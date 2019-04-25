#ifndef __SERVER_H__
#define __SERVER_H__

#include <stdio.h>
#include <string.h>

#include "lwip/err.h"
#include "lwip/udp.h"
#include "xil_types.h"

err_t srv_init();

void print_app_header();

int start_application(ip_addr_t* in_addr, u16_t in_port, ip_addr_t* out_addr, u16_t out_port);

int transfer_data();

void tcp_fasttmr(void);

void tcp_slowtmr(void);

err_t srv_uninit();

#endif // __SERVER_H_
