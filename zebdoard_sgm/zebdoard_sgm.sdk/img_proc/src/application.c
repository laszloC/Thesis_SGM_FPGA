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
#include <stdlib.h>

#include "lwip/sockets.h"
#include "netif/xadapter.h"
#include "lwipopts.h"
#include "xil_printf.h"
#include "FreeRTOS.h"
#include "task.h"

#include "common/common.h"
#include "server/server.h"

#define THREAD_STACKSIZE 1024

static u16_t server_port = 50000;

void print_sgm_server_app_header()
{
	xil_printf("Hardware SGM Server\r\n");
}

/* thread spawned for each connection */
void process_request(void *p)
{
    status_t status = SRV_STATUS_SUCCESS;
	int sd = (int)p;
	u32 cmd = 0;
	u8 finish = 0;

	xil_printf("%s: Client connected; waiting for commands\r\n", __FUNCTION__);

	// initialize server
	if (server_init() != SRV_STATUS_SUCCESS) {
	    xil_printf("%s: Failed to initialize server\r\n", __FUNCTION__);
	    status = SRV_STATUS_IMG_PROC_FAILED;
	    goto cleanup;
	}

	while (!finish) {
		// read command
		if (read(sd, &cmd, sizeof(u32)) != sizeof(u32) ) {
			xil_printf("%s: error reading from socket %u, closing socket\r\n", __FUNCTION__, sd);
			goto cleanup;
		}

		status = interpret_command(sd, (command_t)cmd);
		if (status == SRV_STATUS_STOP) {
		    finish = 1;
		} else if (status != SRV_STATUS_SUCCESS) {
		    xil_printf("%s: interpret command failed with status %d\r\n", __FUNCTION__, status);
		    goto cleanup;
		}
	}

cleanup:
	server_uninit();

	// close connection
	close(sd);
	vTaskDelete(NULL);
}

void application_thread()
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

	xil_printf("Server started. Waiting for client connection\r\n");

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
