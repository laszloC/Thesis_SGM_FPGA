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

#define THREAD_STACKSIZE 1024
#define FRAG_SIZE 1000

#define MIN(A, B) ((A) < (B) ? (A) : (B))

typedef enum _command_t
{
	CMD_UNKNOWN 	= 0x0,
	CMD_SEND_IMG	= 0x1,
	CMD_TEST_NEG 	= 0x2,
	CMD_STOP		= 0x3,
	CMD_RECV_IMG	= 0x4,
	CMD_RECV_FRAG	= 0x5
} command_t;

u16_t server_port = 50000;

void print_echo_app_header()
{
    xil_printf("%20s %6d %s\r\n", "echo server",
                        server_port,
                        "$ telnet <board_ip> 7");

}

static u32 g_img_l_size[2];
static u8* g_img_l;
u8 g_img_l_recv;

static u32 g_img_r_size[2];
static u8* g_img_r;
u8 g_img_r_recv;

void cleanup()
{
	if (g_img_l != NULL) {
		free(g_img_l);
	}

	if (g_img_r != NULL) {
		free(g_img_r);
	}
}

int build_image(int sd, u8** img, u32* size)
{
	int bytes = size[0] * size[1];
	int rem_bytes = bytes;
	int recv_size = 0;
	u8* buf = NULL;
	int32_t cmd = CMD_RECV_FRAG;

	*img = malloc(sizeof(bytes));
	if (*img == NULL) {
		xil_printf("%s: failed to allocate %d bytes\r\n", __FUNCTION__, bytes);
		return -1;
	}

	xil_printf("%s: allocated image of size %d\r\n", __FUNCTION__, bytes);

	for (int i = 0; i < bytes; i += FRAG_SIZE) {
		buf = *img + i;
		recv_size = MIN(FRAG_SIZE, rem_bytes);
		rem_bytes -= recv_size;

		if (read(sd, buf, recv_size) != recv_size) {
			xil_printf("%s: error reading from socket %d", __FUNCTION__, sd);
			return -1;
		}

		if (write(sd, &cmd, sizeof(cmd)) < 0) {
			xil_printf("%s: error sending fragment acknowledgment", __FUNCTION__, sd);
			return -1;
		}

		xil_printf("%s: received fragment %d of size %d\r\n", __FUNCTION__, i, recv_size);
	}

	return 0;
}

int receive_image(int sd)
{
	u32* img_size = NULL;
	u8** img = NULL;
	u8* img_recv = NULL;

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

	u32 cmd = CMD_RECV_IMG;
	if (write(sd, &cmd, sizeof(cmd)) < 0) {
		xil_printf("%s: error writing to socket %d\r\n", __FUNCTION__, sd);
		return -1;
	}

	*img_recv = 1;

	return 0;
}

send_image(int sd, u8* img, int size)
{
	// send image command

	// send image size

	// send fragments and wait for ack
}

/* thread spawned for each connection */
void process_echo_request(void *p)
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
			if (!g_img_l_recv && g_img_r_recv) {
				xil_printf("%s: did not receive image, cannot send negative\r\n", __FUNCTION__);
				finish = 1;
			}

			u8* rev_img = malloc(g_img_l_size);
			if (rev_img == NULL) {
				xil_printf("%s: failed to allocate %u bytes for negative image\r\n", __FUNCTION__, g_img_l_size);
			}

			for (int i = 0; i < g_img_l_size; i++)
			{
				rev_img[i] = 255 - g_img_l[i];
			}

			send_image(sd, rev_img, g_img_l_size);

			if (rev_img != NULL) {
				free(rev_img);
			}

			break;
		case CMD_STOP:
				xil_printf("%s: communcatinon finished, closing socket\r\n", __FUNCTION__);
				finish = 1;
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

void echo_application_thread()
{
	int sock, new_sd;
	int size;
#if LWIP_IPV6==0
	struct sockaddr_in address, remote;

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
			sys_thread_new("echos", process_echo_request,
				(void*)new_sd,
				THREAD_STACKSIZE,
				DEFAULT_THREAD_PRIO);
		}
	}
}
