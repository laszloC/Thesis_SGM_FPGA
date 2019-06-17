/*
 * Copyright (C) 2016 - 2018 Xilinx, Inc.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
 * SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
 * OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
 * IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY
 * OF SUCH DAMAGE.
 *
 */

#include <stdio.h>
#include <string.h>

#include "lwip/sockets.h"
#include "netif/xadapter.h"
#include "lwipopts.h"
#include "xil_printf.h"
#include "FreeRTOS.h"
#include "task.h"
//#include "xparameters.h"
//#include "xsad_cost.h"
//#include "xdisp.h"
#include "stereo/stereo.h"
#include "common/common.h"

#define THREAD_STACKSIZE 1024
#define FRAG_SIZE 1000
#define MAX_DISPARITY 30

#define MIN(A, B) ((A) < (B) ? (A) : (B))

typedef enum _command_t
{
	CMD_UNKNOWN 		= 0x0,
	CMD_SEND_IMG		= 0x1,
	CMD_TEST_NEG 		= 0x2,
	CMD_STOP			= 0x3,
	CMD_RECV_IMG		= 0x4,
	CMD_RECV_FRAG		= 0x5,
	CMD_READY_TO_RECV	= 0x6,
	CMD_CANNOT_RECV		= 0x7,
	CMD_COMP_DEPTH_MAP	= 0x8,
} command_t;

u16_t server_port = 50000;

void print_echo_app_header()
{
	xil_printf("FreeRTOS with lwip receiver\r\n");
}

static u32 g_img_l_size[2];
static u8* g_img_l;
u8 g_img_l_recv;

static u32 g_img_r_size[2];
static u8* g_img_r;
u8 g_img_r_recv;

void cleanup()
{
	g_img_l_recv = 0;
	g_img_r_recv = 0;

	if (g_img_l != NULL) {
		free(g_img_l);
	}

	if (g_img_r != NULL) {
		free(g_img_r);
	}
}

int build_image(int sd, u8** img, u32* size)
{
	u32 bytes = size[0] * size[1];
	u32 rem_bytes = bytes;
	u32 recv_size = 0;
	u8* buf = NULL;
	u32 cmd = 0;

	*img = malloc(bytes);
	if (*img == NULL) {
		xil_printf("%s: failed to allocate %d bytes\r\n", __FUNCTION__, bytes);
		return -1;
	}

	xil_printf("%s: allocated image of size %d\r\n", __FUNCTION__, bytes);

	cmd = CMD_READY_TO_RECV;
	if (write(sd, &cmd, sizeof(cmd)) < 0) {
		xil_printf("%s: error writing to socket %d\r\n", __FUNCTION__, sd);
		return -1;
	}


	for (int i = 0; i < bytes; i += FRAG_SIZE) {
		buf = *img + i;
		recv_size = MIN(FRAG_SIZE, rem_bytes);
		rem_bytes -= recv_size;

		if (read(sd, buf, (size_t)recv_size) != (size_t)recv_size) {
			xil_printf("%s: error reading from socket %d", __FUNCTION__, sd);
			return -1;
		}

		 cmd = CMD_RECV_FRAG;
		 if (write(sd, &cmd, sizeof(cmd)) < 0) {
		 	xil_printf("%s: error sending fragment acknowledgment", __FUNCTION__, sd);
		 	return -1;
		 }

//		xil_printf("%s: received fragment %d of size %d\r\n", __FUNCTION__, i, recv_size);
	}

	return 0;
}

int receive_image(int sd)
{
	u32* img_size = NULL;
	u8** img = NULL;
	u8* img_recv = NULL;
	u32 cmd = 0;

	if (!g_img_l_recv && !g_img_r_recv) {
		xil_printf("%s: preparing to receive left image\r\n", __FUNCTION__);
		img = &g_img_l;
		img_size = g_img_l_size;
		img_recv = &g_img_l_recv;
	}
	else if (g_img_l_recv && !g_img_r_recv) {
		xil_printf("%s: preparing to receive right image\r\n", __FUNCTION__);
		img = &g_img_r;
		img_size = g_img_r_size;
		img_recv = &g_img_r_recv;
	}
	else {
		xil_printf("%s: cannot receive left or right image\r\n", __FUNCTION__);
		return -1;
	}

	if ((read(sd, img_size, sizeof(g_img_l_size))) != sizeof(g_img_l_size)) {
		xil_printf("%s: error reading from socket %d\r\n", __FUNCTION__, sd);
		return -1;
	}

	xil_printf("%s: read image size [%d %d]\r\n", __FUNCTION__, img_size[0], img_size[1]);
	
	if (build_image(sd, img, img_size) < 0) {
		return -1;
	}

	xil_printf("%s: received image, sending recv command\r\n", __FUNCTION__);

	cmd = CMD_RECV_IMG;
	if (write(sd, &cmd, sizeof(cmd)) < 0) {
		xil_printf("%s: error writing to socket %d\r\n", __FUNCTION__, sd);
		return -1;
	}

	*img_recv = 1;

	return 0;
}

int send_image(int sd, u8* img, u32 h, u32 w)
{
	// send image command
	u32 cmd = CMD_SEND_IMG;
	u32 send_size = 0;
	u32 sizes[2] = { h, w };
	u32 size = h * w;
	u32 rem_size = size;

	if (write(sd, &cmd, sizeof(u32)) < 0) {
		xil_printf("%s: failed to send image command %d\r\n", __FUNCTION__);
		return -1;
	}

	// send image size
	if (write(sd, sizes, sizeof(sizes)) < 0) {
		xil_printf("%s: failed to send size\r\n", __FUNCTION__);
		return -1;
	}

	// send fragments and wait for ack
	for (u32 i = 0; i < size; i += FRAG_SIZE) {
		u8* buf = img + i;
		send_size = MIN(rem_size, FRAG_SIZE);
		rem_size -= send_size;

//		xil_printf("%s: sending fragment %d of size %d\r\n", __FUNCTION__, i, send_size);
		if (write(sd, buf, (size_t)send_size) < 0) {
			xil_printf("%s: failed to send image fragment\r\n", __FUNCTION__);
			return -1;
		}

		if (read(sd, &cmd, sizeof(cmd)) != sizeof(cmd)) {
			xil_printf("%s: failed to read from socket\r\n", __FUNCTION__);
			return -1;
		}
		if (cmd != CMD_RECV_FRAG) {
			xil_printf("%s: did not receive fragment acknowledgment\r\n", __FUNCTION__);
			return -1;
		}
	}

//	xil_printf("%s: waiting to receive acknowledgment of image transmission\r\n", __FUNCTION__);
	if (read(sd, &cmd, sizeof(cmd)) != sizeof(cmd)) {
		xil_printf("%s: failed to read from socket\r\n", __FUNCTION__);
		return -1;
	}
	if (cmd != CMD_RECV_IMG) {
		xil_printf("%s: did not receive image acknowledgment\r\n", __FUNCTION__);
		return -1;
	}
	xil_printf("%s: Image was successfully transmitted\r\n", __FUNCTION__);

	return 0;
}

void compute_and_send_negative(int sd)
{
	u32 bytes = g_img_l_size[0] * g_img_l_size[1];
	u8* rev_img = malloc(bytes);
	if (rev_img == NULL) {
		xil_printf("%s: failed to allocate %u bytes for negative image\r\n", __FUNCTION__, g_img_l_size);
		goto cleanup;
	}

	// compute negative in sw
	for (u32 i = 0; i < bytes; i++)
	{
		rev_img[i] = 255 - g_img_l[i];
	}

	// compute negative in hw

	// setup input parameters of hw inverser
	// XInverse_img_Set_img_in(&depth_map_computer, (u32)g_img_l);
	// XInverse_img_Set_img_out(&depth_map_computer, (u32)rev_img);
	//
	// inverse_img_start(&depth_map_computer);
	// while(!XInverse_img_IsReady(&depth_map_computer));
	// xil_printf("Finished to compute image negative in HW\n\r");

	send_image(sd, rev_img, g_img_l_size[0], g_img_l_size[1]);

cleanup:
	if (rev_img != NULL) {
		free(rev_img);
	}

}


void compute_and_send_depth_map(int sd)
{
	u32 dm_bytes = g_img_l_size[0] * g_img_l_size[1];

	u8* depth_map = malloc(dm_bytes * sizeof(u8));
	if (depth_map == NULL) {
		xil_printf("%s: failed to allocate %d bytes\r\n", __FUNCTION__, dm_bytes);
		goto cleanup;
	}

	compute_disparity(g_img_l, g_img_r, depth_map, g_img_l_size, MAX_DISPARITY);

	scale(depth_map, g_img_l_size[0] * g_img_l_size[1], 0, MAX_DISPARITY - 1, 0, 255);

	send_image(sd, depth_map, g_img_l_size[0], g_img_l_size[1]);

cleanup:
	if (depth_map != NULL) {
		free(depth_map);
	}
}


/* thread spawned for each connection */
void process_request(void *p)
{
	int sd = (int)p;
	u32 cmd = 0;
	u8 finish = 0;

	xil_printf("%s: Client connected; waiting for commands\r\n", __FUNCTION__);

	while (!finish) {
		/* read command*/
		if (read(sd, &cmd, sizeof(u32)) != sizeof(u32) ) {
			xil_printf("%s: error reading from socket %u, closing socket\r\n", __FUNCTION__, sd);
			break;
		}

		xil_printf("%s: received command: %u\r\n", __FUNCTION__, cmd);

		switch (cmd) {
		case CMD_SEND_IMG:
			if (receive_image(sd) < 0) {
				finish	= 1;
			}
			break;
		case CMD_TEST_NEG:
			if (!g_img_l_recv) {
				xil_printf("%s: did not receive image, cannot send negative\r\n", __FUNCTION__);
				finish = 1;
			}
			compute_and_send_negative(sd);
			break;
		case CMD_STOP:
				xil_printf("%s: communication finished, closing socket\r\n", __FUNCTION__);
				finish = 1;
			break;
		case CMD_COMP_DEPTH_MAP:
			if (!g_img_l_recv && !g_img_r_recv) {
				xil_printf("%s: did not receive left and right images, cannot compute depth map\r\n", __FUNCTION__);
				finish = 1;
			}
			compute_and_send_depth_map(sd);
			break;
		default:
			xil_printf("%s: command unrecognized, closing socket\r\n", __FUNCTION__);
			finish = 1;
			break;
		}
	}

	cleanup();

	/* close connection */
	close(sd);
	vTaskDelete(NULL);
}

void application_thread()
{
	int sock, new_sd;
	int size;
	int status;
#if LWIP_IPV6==0
	struct sockaddr_in address, remote;

	// setup hw stereo
	status = init_stereo();
	if (status != 0){
		xil_printf("Failed to initialize stereo hardware\r\n");
		return;
	}

	memset(&address, 0, sizeof(address));

	if ((sock = lwip_socket(AF_INET, SOCK_STREAM, 0)) < 0)
		return;

	address.sin_family = AF_INET;
	address.sin_port = htons(server_port);
	address.sin_addr.s_addr = INADDR_ANY;
#else
	struct sockaddr_in6 address, remote;

	memset(&address, 0, sizeof(address));

	address.sin6_len = sizeof(address);
	address.sin6_family = AF_INET6;
	address.sin6_port = htons(server_port);

	memset(&(address.sin6_addr), 0, sizeof(address.sin6_addr));

	if ((sock = lwip_socket(AF_INET6, SOCK_STREAM, 0)) < 0)
		return;
#endif

	if (lwip_bind(sock, (struct sockaddr *)&address, sizeof (address)) < 0)
		return;

	lwip_listen(sock, 0);

	size = sizeof(remote);

	while (1) {
		if ((new_sd = lwip_accept(sock, (struct sockaddr *)&remote, (socklen_t *)&size)) > 0) {
			sys_thread_new("echos", process_request,
				(void*)new_sd,
				THREAD_STACKSIZE,
				DEFAULT_THREAD_PRIO);
		}
	}
}
