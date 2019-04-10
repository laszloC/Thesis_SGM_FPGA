#ifndef __SRV_INTERNAL__
#define __SRV_INTERNAL__

#include <stdio.h>

#include "lwip/err.h"
#include "lwip/udp.h"
#include "xil_types.h"

#define H_INDEX 0
#define W_INDEX 1

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

// callback used to receive commands
void recv_callback(void* arg, struct udp_pcb* pcb, struct pbuf* p, const ip_addr_t* addr, u16_t port);

// handles the command received in state IDLE
void handle_command(const command_t cmd, struct udp_pcb* pcb);

// callback used to receive and build images
void img_recv_callback(void* arg, struct udp_pcb* pcb, struct pbuf* p, const ip_addr_t* addr, u16_t port);

// consecutive calls to this function will construct an image
void receive_image(u8_t** img, int* img_size, struct pbuf* p);

// builds an image buffer by buffer
err_t build_image(u8_t* img, u8_t* buf, int bufsize, int* built_size);

// send an image to the remote connection
err_t send_img(struct udp_pcb* pcb, const u8_t* buf, int h, int w);

// minimum function
int min(int a, int b);

void set_pc_address(const ip_addr_t* ipaddr, const u16_t port);

// generates the next global state
global_state_t get_next_state();

#endif // __SRV_INTERNAL__
