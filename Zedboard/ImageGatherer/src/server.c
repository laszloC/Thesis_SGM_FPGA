#include <stdio.h>
#include <string.h>

#include "xil_types.h"

#include "server.h"

#include "lwip/err.h"
#include "lwip/tcp.h"
#if defined (__arm__) || defined (__aarch64__)
#include "xil_printf.h"
#endif

//#include "xil_printf.h"

static int g_img_l_size;
static u8* g_img_l;
static u8 g_img_l_recv;

static int g_img_r_size;
static u8* g_img_r;
static u8 g_img_r_recv;

static global_state_t g_state;

err_t srv_init()
{
    g_img_l_size = 0;
    g_img_l = NULL;
    g_img_l_recv = FALSE;

    g_img_r_size = 0;
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

err_t accept_callback(void *arg, struct tcp_pcb *newpcb, err_t err)
{
    static int connection = 1;

    /* set the receive callback for this connection */
    tcp_recv(newpcb, recv_callback);

    /* just use an integer number indicating the connection id as the
       callback argument */
    tcp_arg(newpcb, (void*)(UINTPTR)connection);

    /* increment for subsequent accepted connections */
    connection++;

    return ERR_OK;
}

err_t recv_callback(void *arg, struct tcp_pcb *tpcb, struct pbuf *p, err_t err)
{
    command_t cmd;

    //* do not read the packet if we are not in ESTABLISHED state
    if (!p) {
        tcp_close(tpcb);
        tcp_recv(tpcb, NULL);
        return ERR_OK;
    }

    // indicate that the packet has been received
    tcp_recved(tpcb, p->len);

    xil_printf("Received packet of size 0x%x\n\r", p->len);

    switch (g_state) {
        // in idle state commands are expected
        case ST_IDLE:
            cmd = *((command_t*)p->payload);
            if (cmd == CMD_SEND_IMG) {
                // set the receive callback to build image
                g_state = get_next_state();
                tcp_recv(tpcb, img_recv_callback);
            }

            if (cmd == CMD_TEST_NEG) {
                xil_printf("Got test command\n\r");
                for(int i = 0; i < g_img_l_size; i++)
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

    return ERR_OK;
}

err_t img_recv_callback(void *arg, struct tcp_pcb* tpcb, struct pbuf* p, err_t err)
{
    static img_state_t img_state = IMG_ST_START;
    static int recv = 0;
    static int* size = NULL;
    static u8* image = NULL;

    // do not read the packet if we are not in ESTABLISHED state
    if (!p) {
        srv_uninit();
        tcp_close(tpcb);
        tcp_recv(tpcb, NULL);
        return ERR_OK;
    }

    // indicate that the package was received
    tcp_recved(tpcb, p->len);

    xil_printf("Received packet of size 0x%x\n\r", p->len);

    switch (img_state)
    {
        case IMG_ST_START:
            if (g_state == ST_RECV_IMG_LEFT) {
                size = &g_img_l_size;
                image = g_img_l;
            }
            if (g_state == ST_RECV_IMG_RIGHT) {
                size = &g_img_r_size;
                image = g_img_r;
            }

            *size = *((int*)p->payload);
            image = malloc(sizeof(u8) * (*size));
            if (image == NULL) {
                xil_printf("Failed to allocate 0x%x bytes\n\r", *size);
                srv_uninit();
                tcp_close(tpcb);
                tcp_recv(tpcb, NULL);
                return ERR_OK;
            }

            recv = 0;

            img_state = IMG_ST_RECV;
            break;

        case IMG_ST_RECV:
            if (recv < *size) {
                build_image(image, (u8*)p->payload, p->len, &recv);
            }
            else if (recv == *size)
            {
                if (!g_img_l_recv && !g_img_r_recv) {
                    g_img_l_recv = TRUE;
                }
                else if (g_img_l_recv && !g_img_r_recv) {
                    g_img_r_recv = TRUE;
                }

                img_state = IMG_ST_START;
                g_state = get_next_state();
                tcp_recv(tpcb, recv_callback);
            }
            break;

        default:
            break;
    }

    pbuf_free(p);

    return ERR_OK;
}

err_t build_image(u8* img, u8* buf, int bufsize, int* built_size)
{
    static int offset = 0;

    memcpy(img + offset, buf, bufsize);

    offset += bufsize;

    *built_size = offset;

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
#if (LWIP_IPV6==0)
    xil_printf("\n\r\n\r-----lwIP TCP echo server ------\n\r");
#else
    xil_printf("\n\r\n\r-----lwIPv6 TCP echo server ------\n\r");
#endif
    xil_printf("TCP packets sent to port 6001 will be echoed back\n\r");
}

// defined for lwip
int transfer_data() {
    return 0;
}

// defined for lwip
int start_application()
{
    struct tcp_pcb *pcb;
    err_t err;
    unsigned port = 7;

    srv_init();

    /* create new TCP PCB structure */
    pcb = tcp_new_ip_type(IPADDR_TYPE_ANY);
    if (!pcb) {
        xil_printf("Error creating PCB. Out of Memory\n\r");
        return -1;
    }

    /* bind to specified @port */
    err = tcp_bind(pcb, IP_ANY_TYPE, port);
    if (err != ERR_OK) {
        xil_printf("Unable to bind to port %d: err = %d\n\r", port, err);
        return -2;
    }

    /* we do not need any arguments to callback functions */
    tcp_arg(pcb, NULL);

    /* listen for connections */
    pcb = tcp_listen(pcb);
    if (!pcb) {
        xil_printf("Out of memory while tcp_listen\n\r");
        return -3;
    }

    /* specify callback to use for incoming connections */
    tcp_accept(pcb, accept_callback);

    xil_printf("TCP echo server started @ port %d\n\r", port);

    return 0;
}
