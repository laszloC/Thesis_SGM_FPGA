#ifndef __SERVER_H__
#define __SERVER_H__

#include <stdio.h>
#include <string.h>

#include "lwip/err.h"
#include "lwip/udp.h"
#include "xil_types.h"

typedef enum _global_state_t
{
    ST_IDLE             = 0x1,
    ST_RECV_IMG_LEFT    = 0x2,
    ST_RECV_IMG_RIGHT   = 0x3,

    ST_ERROR            = 0xFF
} global_state_t;

typedef enum _command_t
{
    CMD_SEND_IMG    = 0x1,
    CMD_TEST_NEG    = 0x2,
    CMD_STOP        = 0x3
} command_t;

typedef enum _img_state_t
{
    IMG_ST_START    = 0x0,
    IMG_ST_RECV     = 0x1,
} img_state_t;

// initializes the global state
err_t srv_init();

err_t srv_uninit();

// callback used to accept a new tcp connection
//err_t accept_callback(void *arg, struct udp_pcb *newpcb, err_t err);

// callback used to receive commands
void recv_callback(void *arg, struct udp_pcb* pcb, struct pbuf *p, const ip_addr_t *addr, u16_t port);

// callback used to receive and build images
void img_recv_callback(void *arg, struct udp_pcb* pcb, struct pbuf *p, const ip_addr_t *addr, u16_t port);

// builds an image buffer by buffer
err_t build_image(u8* img, u8* buf, int bufsize, int* built_size);

// generates the next global state
global_state_t get_next_state();

#endif // __SERVER_H_
