/*
 * server.c
 *
 *  Created on: Jun 24, 2019
 *      Author: laszl
 */

#include <stdlib.h>

#include "lwip/sockets.h"
#include "xil_printf.h"

#include "server.h"
#include "server_internal.h"

#include "../stereo/hw/hw_stereo.h"
#include "../stereo/sw/sw_stereo.h"
#include "../common/common.h"
#include "../common/constants.h"

static u32 g_img_l_size[2];
static u8* g_img_l;
static u8 g_img_l_recv;

static u32 g_img_r_size[2];
static u8* g_img_r;
static u8 g_img_r_recv;

status_t server_init()
{
    status_t status = SRV_STATUS_SUCCESS;

    g_img_l_size[0] = g_img_l_size[1] = 0;
    g_img_l = NULL;
    g_img_l_recv = 0;


    g_img_r_size[0] = g_img_r_size[1] = 0;
    g_img_r = NULL;
    g_img_r_recv = 0;

    if (init_hw_stereo() != SRV_STATUS_SUCCESS) {
        status = SRV_STATUS_INIT_FAILED;
        goto cleanup;
    }

cleanup:
    return status;
}

status_t interpret_command(int sd, command_t cmd)
{
    status_t status = SRV_STATUS_SUCCESS;

    xil_printf("Received command: %u\r\n", cmd);

    switch (cmd) {
        case CMD_REQ_SEND_IMG:
            if (receive_image(sd) != SRV_STATUS_SUCCESS) {
                status = SRV_STATUS_RECV_FAILED;
            }
            break;
        case CMD_REQ_COMP_NEG:
            if (compute_and_send_negative(sd) != SRV_STATUS_SUCCESS) {
                status = SRV_STATUS_IMG_PROC_FAILED;
            }
            break;
        case CMD_REQ_DEPTH_MAP_HW:
            if (compute_and_send_depth_map(sd, 1) != SRV_STATUS_SUCCESS) {
                status = SRV_STATUS_IMG_PROC_FAILED;
            }
            break;
        case CMD_REQ_DEPTH_MAP_SW:
            if (compute_and_send_depth_map(sd, 0) != SRV_STATUS_SUCCESS) {
                status = SRV_STATUS_IMG_PROC_FAILED;
            }
            break;
        case CMD_REQ_STOP:
            status = SRV_STATUS_STOP;
            break;
        default:
            status = SRV_STATUS_ERR_UNKNOWN_CMD;
            break;
    }

    return status;
}

status_t server_uninit()
{
    status_t status = SRV_STATUS_SUCCESS;

    g_img_l_recv = 0;
    g_img_r_recv = 0;

    if (g_img_l != NULL) {
        free(g_img_l);
    }

    if (g_img_r != NULL) {
        free(g_img_r);
    }

    return status;
}

status_t receive_image(int sd)
{
    u32* img_size = NULL;
    img_t** img = NULL;
    u8* img_recv = NULL;
    u32 cmd = 0;

    if (!g_img_l_recv && !g_img_r_recv) {
        xil_printf("Preparing to receive left image\r\n");
        img = &g_img_l;
        img_size = g_img_l_size;
        img_recv = &g_img_l_recv;
    }
    else if (g_img_l_recv && !g_img_r_recv) {
        xil_printf("Preparing to receive right image\r\n");
        img = &g_img_r;
        img_size = g_img_r_size;
        img_recv = &g_img_r_recv;
    }
    else {
        xil_printf("%s: cannot receive left or right image\r\n", __FUNCTION__);
        return SRV_STATUS_RECV_FAILED;
    }

    if ((read(sd, img_size, sizeof(g_img_l_size))) != sizeof(g_img_l_size)) {
        xil_printf("%s: error reading from socket %d\r\n", __FUNCTION__, sd);
        return SRV_STATUS_RECV_FAILED;
    }

    xil_printf("Read image size [%d, %d]\r\n", img_size[0], img_size[1]);

    if (build_image(sd, img, img_size) != SRV_STATUS_SUCCESS) {
        return SRV_STATUS_RECV_FAILED;
    }

    xil_printf("%s: received image, sending recv command\r\n", __FUNCTION__);

    cmd = CMD_RESP_RECV_IMG;
    if (write(sd, &cmd, sizeof(cmd)) < 0) {
        xil_printf("%s: error writing to socket %d\r\n", __FUNCTION__, sd);
        return SRV_STATUS_SEND_FAILED;
    }

    *img_recv = 1;

    return SRV_STATUS_SUCCESS;
}

status_t compute_and_send_negative(int sd)
{
    status_t status = SRV_STATUS_SUCCESS;
    u32 bytes = g_img_l_size[0] * g_img_l_size[1] * sizeof(img_t);

    img_t* rev_img = malloc(bytes);
    if (rev_img == NULL) {
        xil_printf("%s: failed to allocate %u bytes for negative image\r\n", __FUNCTION__, bytes);
        status = SRV_STATUS_ALLOC_FAILED;
        goto cleanup;
    }

    for (index_t i = 0; i < bytes; i++) {
        rev_img[i] = 255 - g_img_l[i];
    }

    if (send_image(sd, rev_img, g_img_l_size[0], g_img_l_size[1]) != SRV_STATUS_SUCCESS) {
        status = SRV_STATUS_SEND_FAILED;
        goto cleanup;
    }

cleanup:

    if (rev_img != NULL) {
        free(rev_img);
    }

    return status;
}

status_t compute_and_send_depth_map(int sd, int accelerated)
{
    status_t status = SRV_STATUS_SUCCESS;
    u32 dm_bytes = g_img_l_size[0] * g_img_l_size[1];
    stats_t time_stats = { 0 };

    cost_t p1 = 0, p2 = 0;
    img_t *depth_map = NULL;

    // get p1
    if (read(sd, &p1, sizeof(cost_t)) != sizeof(cost_t)) {
        xil_printf("%s: failed to receive p1\r\n", __FUNCTION__);
        status = SRV_STATUS_RECV_FAILED;
        goto cleanup;
    }

    // get p2
    if (read(sd, &p2, sizeof(cost_t)) != sizeof(cost_t)) {
        xil_printf("%s: failed to receive p2\r\n", __FUNCTION__);
        status = SRV_STATUS_RECV_FAILED;
        goto cleanup;
    }

    // allocate depth map
    depth_map = malloc(dm_bytes * sizeof(img_t));
    if (depth_map == NULL) {
        xil_printf("%s: failed to allocate %d bytes \r\n", __FUNCTION__);
        status = SRV_STATUS_ALLOC_FAILED;
        goto cleanup;
    }

    if (accelerated != 0) { // compute in hw
        if (compute_disparity_hw(g_img_l, g_img_r, depth_map, p1, p2, &time_stats) != SRV_STATUS_SUCCESS)
        {
            status = SRV_STATUS_IMG_PROC_FAILED;
            goto cleanup;
        }
    } else { // compute in sw
        if (compute_disparity_sw(g_img_l, g_img_r, depth_map, p1, p2, &time_stats) != SRV_STATUS_SUCCESS)
        {
            status = SRV_STATUS_IMG_PROC_FAILED;
            goto cleanup;
        }
    }

    scale(depth_map, dm_bytes, 0, MAX_DISP - 1, 0, 255);

    if (send_image(sd, depth_map, g_img_l_size[0], g_img_l_size[1]) != SRV_STATUS_SUCCESS) {
        status = SRV_STATUS_SEND_FAILED;
        goto cleanup;
    }

    xil_printf("Sending time stats\r\n");
    if (send_time_stats(sd, &time_stats) != SRV_STATUS_SUCCESS) {
        status = SRV_STATUS_SEND_FAILED;
        goto cleanup;
    }

cleanup:
    if (depth_map != NULL) {
        free(depth_map);
    }

    return status;
}

status_t send_image(int sd, img_t* img, u32 h, u32 w)
{
    // send image command
    u32 cmd = CMD_REQ_SEND_IMG;
    u32 send_size = 0;
    u32 sizes[2] = { h, w };
    u32 size = h * w;
    u32 rem_size = size;

    if (write(sd, &cmd, sizeof(u32)) < 0) {
        xil_printf("%s: failed to send image command %d\r\n", __FUNCTION__);
        return SRV_STATUS_SEND_FAILED;
    }

    // send image size
    if (write(sd, sizes, sizeof(sizes)) < 0) {
        xil_printf("%s: failed to send size\r\n", __FUNCTION__);
        return SRV_STATUS_SEND_FAILED;
    }

//    // wait for image size ack
//    if (read(sd, &cmd, sizeof(cmd)) != sizeof(cmd)) {
//        xil_printf("%s: failed to read from socket\r\n", __FUNCTION__);
//        return SRV_STATUS_RECV_FAILED;
//    }
//    if (cmd != CMD_RESP_RECV_IMG_SIZE) {
//        xil_printf("%s: did not receive image size acknowledgment\r\n", __FUNCTION__);
//        return SRV_STATUS_SEND_FAILED;
//    }

    // send fragments and wait for ack
    for (u32 i = 0; i < size; i += FRAG_SIZE) {
        img_t* buf = img + i;
        send_size = MIN(rem_size, FRAG_SIZE);
        rem_size -= send_size;

//      xil_printf("%s: sending fragment %d of size %d\r\n", __FUNCTION__, i, send_size);
        if (write(sd, buf, (size_t)send_size) < 0) {
            xil_printf("%s: failed to send image fragment\r\n", __FUNCTION__);
            return SRV_STATUS_SEND_FAILED;
        }

        if (read(sd, &cmd, sizeof(cmd)) != sizeof(cmd)) {
            xil_printf("%s: failed to read from socket\r\n", __FUNCTION__);
            return SRV_STATUS_RECV_FAILED;
        }
        if (cmd != CMD_RESP_RECV_FRAG) {
            xil_printf("%s: did not receive fragment acknowledgment\r\n", __FUNCTION__);
            return SRV_STATUS_SEND_FAILED;
        }
    }

//  xil_printf("%s: waiting to receive acknowledgment of image transmission\r\n", __FUNCTION__);
    if (read(sd, &cmd, sizeof(cmd)) != sizeof(cmd)) {
        xil_printf("%s: failed to read from socket\r\n", __FUNCTION__);
        return SRV_STATUS_RECV_FAILED;
    }
    if (cmd != CMD_RESP_RECV_IMG) {
        xil_printf("%s: did not receive image acknowledgment\r\n", __FUNCTION__);
        return SRV_STATUS_SEND_FAILED;
    }
    xil_printf("%s: Image was successfully transmitted\r\n", __FUNCTION__);

    return SRV_STATUS_SUCCESS;
}

status_t build_image(int sd, img_t** img, u32* size)
{
    u32 bytes = size[0] * size[1];
    u32 rem_bytes = bytes;
    u32 recv_size = 0;
    u8* buf = NULL;
    u32 cmd = 0;

    *img = malloc(bytes);
    if (*img == NULL) {
        xil_printf("%s: failed to allocate %d bytes\r\n", __FUNCTION__, bytes);
        return SRV_STATUS_ALLOC_FAILED;
    }

    xil_printf("Allocated image of size %d\r\n", __FUNCTION__, bytes);

    cmd = CMD_RESP_RECV_IMG_SIZE;
    if (write(sd, &cmd, sizeof(cmd)) < 0) {
        xil_printf("%s: error writing to socket %d\r\n", __FUNCTION__, sd);
        return SRV_STATUS_SEND_FAILED;
    }

    for (int i = 0; i < bytes; i += FRAG_SIZE) {
        buf = *img + i;
        recv_size = MIN(FRAG_SIZE, rem_bytes);
        rem_bytes -= recv_size;

        if (read(sd, buf, (size_t)recv_size) != (size_t)recv_size) {
            xil_printf("%s: error reading from socket %d\r\n", __FUNCTION__, sd);
            return SRV_STATUS_RECV_FAILED;
        }

         cmd = CMD_RESP_RECV_FRAG;
         if (write(sd, &cmd, sizeof(cmd)) < 0) {
            xil_printf("%s: error sending fragment acknowledgment\r\n", __FUNCTION__, sd);
            return SRV_STATUS_SEND_FAILED;
         }

//      xil_printf("%s: received fragment %d of size %d\r\n", __FUNCTION__, i, recv_size);
    }

    return 0;
}

status_t send_time_stats(int sd, stats_t *time_stats)
{
    status_t status = SRV_STATUS_SUCCESS;

    if (write(sd, time_stats, sizeof(stats_t)) < 0) {
        xil_printf("%s: error sending time stats\r\n", __FUNCTION__);
        status = SRV_STATUS_SEND_FAILED;
        goto cleanup;
    }

cleanup:
    return status;
}

