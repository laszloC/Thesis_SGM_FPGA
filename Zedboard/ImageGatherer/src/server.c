#include <stdio.h>
#include <string.h>

#include "xil_types.h"

#include "server.h"

#if defined (__arm__) || defined (__aarch64__)
#include "xil_printf.h"
#endif

//#include "xil_printf.h"

static int g_img_l_size[2];
static u8* g_img_l;
static u8 g_img_l_recv;

static int g_img_r_size[2];
static u8* g_img_r;
static u8 g_img_r_recv;

static global_state_t g_state;

err_t srv_init()
{
    g_img_l_size[0] = 0;
    g_img_l_size[1] = 0;
    g_img_l = NULL;
    g_img_l_recv = FALSE;

    g_img_r_size[0] = 0;
    g_img_r_size[1] = 0;
    g_img_r = NULL;
    g_img_r_recv = FALSE;

    g_state = ST_IDLE;

    return ERR_OK;
}

err_t srv_uninit()
{
    if (g_img_l != NULL) {
        free(g_img_l);
        g_img_l = NULL;
    }

    if (g_img_r != NULL) {
        free(g_img_r);
        g_img_r = NULL;
    }

    return ERR_OK;
}


void recv_callback(void *arg, struct udp_pcb *pcb, struct pbuf *p, const ip_addr_t *addr, u16_t port)
{
    command_t cmd;

    //* do not read the packet if we are not in ESTABLISHED state
    if (!p) {
        srv_uninit();
        udp_disconnect(pcb);
        udp_recv(pcb, NULL, NULL);
    }

    // xil_printf("recv_callback received packet of size 0x%x\n\r", p->len);

    switch (g_state) {
        // in idle state commands are expected
        case ST_IDLE:
            cmd = *((command_t*)p->payload);

            if (cmd == CMD_SEND_IMG) {
                // set the receive callback to build image
                xil_printf("Got send image command\n\r");
                g_state = get_next_state();
                udp_recv(pcb, img_recv_callback, NULL);
            }

            if (cmd == CMD_TEST_NEG) {
                xil_printf("Got test command\n\r");
                for(int i = 0; i < g_img_l_size[0] * g_img_l_size[1]; i++)
                {
                    g_img_l[i] = 255 - g_img_l[i];
                }
            }
            break;

        default:
            xil_printf("Unrecognized state\n\r");
            break;
    }

    pbuf_free(p);
}

void img_recv_callback(void *arg, struct udp_pcb* pcb, struct pbuf* p, const ip_addr_t *addr, u16_t port)
{
    static img_state_t img_state = IMG_ST_START;
    static int recv = 0;
    static int* size = NULL;
    static int size_bytes = 0;
    static u8* image = NULL;

    // do not read the packet if we are not in ESTABLISHED state
    if (!p) {
        srv_uninit();
        udp_disconnect(pcb);
        udp_recv(pcb, NULL, NULL);
    }

    // xil_printf("img_recv_callback received packet of size 0x%x\n\r", p->len);

    switch (img_state)
    {
        case IMG_ST_START:
            if (g_state == ST_RECV_IMG_LEFT) {
                size = g_img_l_size;
                image = g_img_l;
            }
            if (g_state == ST_RECV_IMG_RIGHT) {
                size = g_img_r_size;
                image = g_img_r;
            }

            size[0] = ((int*)p->payload)[0];
            size[1] = ((int*)p->payload)[1];
            size_bytes = sizeof(u8) * size[0] * size[1];

            xil_printf("Got size of image: %d\n\r", size_bytes);

            image = malloc(size_bytes);
            if (image == NULL) {
                xil_printf("Failed to allocate %d bytes\n\r", size_bytes);
                srv_uninit();
                udp_disconnect(pcb);
                udp_recv(pcb, NULL, NULL);
            }

            recv = 0;

            build_image(NULL, 0, 0, NULL);
            img_state = IMG_ST_RECV;
            break;

        case IMG_ST_RECV:
            build_image(image, (u8*)p->payload, p->len, &recv);
            xil_printf("pack: %d; recv: %d; size: %d\n\r", p->len, recv, size_bytes);
            if (recv > size_bytes){
                xil_printf("Error: received more than image size\n\r");
            }
            else if (recv == size_bytes)
            {
                if (!g_img_l_recv && !g_img_r_recv) {
                    xil_printf("Received left image\n\r");
                    g_img_l_recv = TRUE;
                }
                else if (g_img_l_recv && !g_img_r_recv) {
                    xil_printf("Received right image\n\r");
                    g_img_r_recv = TRUE;
                }

                img_state = IMG_ST_START;
                g_state = get_next_state();
                udp_recv(pcb, recv_callback, NULL);
            }
            break;

        default:
            break;
    }

    pbuf_free(p);
}

err_t build_image(u8* img, u8* buf, int bufsize, int* built_size)
{
    static int offset = 0;

    if (img == NULL) {
        offset = 0;
        return ERR_OK;
    }

    memcpy(img + offset, buf, bufsize);

    offset += bufsize;

    if (built_size != NULL) {
        *built_size = offset;
    }

    return ERR_OK;
}

global_state_t get_next_state()
{
    global_state_t next_state = ST_ERROR;

    switch (g_state)
    {
        case ST_IDLE:
            if (!g_img_l_recv && !g_img_r_recv) {
                next_state = ST_RECV_IMG_LEFT;
            }
            else if (g_img_l_recv && !g_img_r_recv) {
                next_state = ST_RECV_IMG_RIGHT;
            }
            break;

        case ST_RECV_IMG_LEFT:
            next_state = ST_IDLE;
            break;

        case ST_RECV_IMG_RIGHT:
            next_state = ST_IDLE;
            break;

        default:
            next_state = ST_ERROR;
    }

    xil_printf("Previous state: %x, next state: %x\n\r", g_state, next_state);

    return next_state;
}

// defined for lwip
void print_app_header()
{
    xil_printf("\n\r\n\r-----lwIP UDP sgm server ------\n\r");
}

// defined for lwip
int transfer_data() {
    return 0;
}

// defined for lwip
int start_application()
{
    struct udp_pcb *pcb;
    err_t err;
    unsigned port = 7;

    srv_init();

    /* create new TCP PCB structure */
    pcb = udp_new_ip_type(IPADDR_TYPE_ANY);
    if (!pcb) {
        xil_printf("Error creating PCB. Out of Memory\n\r");
        return -1;
    }

    /* bind to specified @port */
    err = udp_bind(pcb, IP_ANY_TYPE, port);
    if (err != ERR_OK) {
        xil_printf("Unable to bind to port %d: err = %d\n\r", port, err);
        return -2;
    }

    /* we do not need any arguments to callback functions */
    // udp_arg(pcb, NULL);

    /* listen for data */
    udp_recv(pcb, recv_callback, NULL);

    xil_printf("Image receiver started @ port %d %d\n\r", port);

    return 0;
}
