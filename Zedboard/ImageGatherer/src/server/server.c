#include <stdio.h>
#include <string.h>

#include "xil_types.h"

#include "server.h"
#include "server_internal.h"

#include "netif/xadapter.h"

#if defined (__arm__) || defined (__aarch64__)
#include "xil_printf.h"
#endif

static int g_img_l_size[2];
static u8* g_img_l;
static u8 g_img_l_recv;

static int g_img_r_size[2];
static u8* g_img_r;
static u8 g_img_r_recv;

static global_state_t g_state;

// static struct udp_pcb* g_pcb;

static ip_addr_t g_pc_addr;

static u16_t g_pc_port;

err_t srv_init()
{
    // initialize global variables

    g_img_l_size[0] = 0;
    g_img_l_size[1] = 0;
    g_img_l = NULL;
    g_img_l_recv = FALSE;

    g_img_r_size[0] = 0;
    g_img_r_size[1] = 0;
    g_img_r = NULL;
    g_img_r_recv = FALSE;

    memset(&g_pc_addr, 0, sizeof(g_pc_addr));
    g_pc_port = 0;

    g_state = ST_IDLE;

    xil_printf("Initialized global variables\n\r");

    return ERR_OK;
}

void recv_callback(void* arg, struct udp_pcb* pcb, struct pbuf* p, const ip_addr_t* addr, u16_t port)
{
    set_pc_address(addr, port);

    xil_printf("Received packet of size %d\n\r", p->len);

    //* do not read the packet if we are not in ESTABLISHED state
    if (!p) {
        srv_uninit();
        udp_disconnect(pcb);
        udp_recv(pcb, NULL, NULL);
    }

    switch (g_state) {
        // in idle state commands are expected
        case ST_IDLE:
            xil_printf("State idle\n\r");
            handle_command(*((command_t*)p->payload), pcb);
            break;

        case ST_RECV_IMG_LEFT:
            xil_printf("State receive image left\n\r");
            receive_image(&g_img_l, g_img_l_size, p);
            break;

        case ST_RECV_IMG_RIGHT:
            xil_printf("State receive image right\n\r");
            receive_image(&g_img_r, g_img_l_size, p);
            break;

        default:
            xil_printf("Unrecognized state\n\r");
            break;
    }

    pbuf_free(p);
}

void handle_command(const command_t cmd, struct udp_pcb* pcb)
{
    int size = 0;

    switch (cmd)
    {
        case CMD_SEND_IMG:
            xil_printf("Got send image command\n\r");
            g_state = get_next_state();
            break;
        case CMD_TEST_NEG:
            xil_printf("Got test command\n\r");

            size = g_img_l_size[H_INDEX] * g_img_l_size[W_INDEX];
            for (int i = 0; i < size; i++)
            {
                g_img_l[i] = 255 - g_img_l[i];
            }
            xil_printf("Reversed image\n\r");
            send_img(pcb, g_img_l, g_img_l[H_INDEX], g_img_l[W_INDEX]);
            break;
        default:
            break;
    }
}

void receive_image(u8_t** img, int* img_size, struct pbuf* p)
{
    static img_state_t img_state = IMG_ST_START;
    static int recv = 0;
    static int size_bytes = 0;

    // do not read the packet if we are not in established state
    if (!p)
    {
        xil_printf("Not in the established state\n\r");
        srv_uninit();
    }

    // xil_printf("In receive image\n\r");

    switch (img_state)
    {
        case IMG_ST_START:
            // xil_printf("Img state start\n\r");

            img_size[H_INDEX] = ((int*)p->payload)[H_INDEX];
            img_size[W_INDEX] = ((int*)p->payload)[W_INDEX];
            size_bytes = img_size[H_INDEX] * img_size[W_INDEX];

            xil_printf("Got size of image: %d\n\r", size_bytes);

            *img = malloc(size_bytes);
            if (*img == NULL)
            {
                xil_printf("Failed to allocate %d bytes\n\r", size_bytes);
                srv_uninit();
            }

            recv = 0;

            build_image(NULL, 0, 0, NULL);
            img_state = IMG_ST_RECV;
            break;

        case IMG_ST_RECV:
            xil_printf("Img state recv\n\r");
            build_image(*img, (u8_t*)p->payload, p->len, &recv);
            xil_printf("pack: %d; recv: %d; size: %d\n\r", p->len, recv, size_bytes);
            if (recv > size_bytes)
            {
                xil_printf("Error: received more than image size\n\r");
            }
            else if (recv == size_bytes)
            {
                if (!g_img_l_recv && !g_img_l_recv)
                {
                    xil_printf("Received left image\n\r");
                    g_img_l_recv = TRUE;
                }
                else if (g_img_l_recv && !g_img_r_recv)
                {
                    xil_printf("Received right image\n\r");
                    g_img_r_recv = TRUE;
                }

                img_state = IMG_ST_START;
                g_state = get_next_state();
            }
            break;

        default:
            xil_printf("Unrecognized image state\n\r");
            break;
    }
}

err_t build_image(u8_t* img, u8_t* buf, int bufsize, int* built_size)
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

err_t send_img(struct udp_pcb* pcb, const u8* buf, int h, int w)
{
    command_t cmd = CMD_SEND_IMG;
    int size[2] = { h, w };
    struct pbuf* p = NULL;
    int fragment_size = 500;
    int size_bytes = h * w;
    int rem_size = size_bytes;
    int send_size = 0;

    // send command
    p = pbuf_alloc(PBUF_TRANSPORT, sizeof(cmd), PBUF_RAM);
    if (p == NULL) {
        return ERR_MEM;
    }

    xil_printf("Will send command\n\r");
    p->payload = (void*)cmd;
    udp_sendto(pcb, p, &g_pc_addr, g_pc_port);
    xil_printf("Sent command\n\r");
    pbuf_free(p);
    p = NULL;

    // send image size
    p = pbuf_alloc(PBUF_TRANSPORT, sizeof(size), PBUF_RAM);
    if (p == NULL) {
        xil_printf("Failed to allocate pbuf\n\r");
        return ERR_MEM;
    }

    xil_printf("Will send image size\n\r");
    p->payload = (void*)size;
    udp_sendto(pcb, p, &g_pc_addr, g_pc_port);
    xil_printf("Sent image size\n\r");
    pbuf_free(p);
    p = NULL;

    // send image fragments
    for(int i = 0; i < size_bytes; i += fragment_size) {
        send_size = min(fragment_size, rem_size);
        rem_size -= fragment_size;

        p = pbuf_alloc(PBUF_TRANSPORT, send_size, PBUF_RAM);
        if (p == NULL) {
            xil_printf("Failed to reallocate pbuf\n\r");
            return ERR_MEM;
        }
        pbuf_free(p);

        p->payload = (void*)(buf + i);
        udp_sendto(pcb, p, &g_pc_addr, g_pc_port);
        xil_printf("Sent image fragment %d\n\r", i);
    }

    pbuf_free(p);
    xil_printf("Freed image\n\r");

    return ERR_OK;
}

void set_pc_address(const ip_addr_t* ipaddr, const u16_t port)
{
    if (g_pc_addr.addr == 0) {
        g_pc_addr.addr = ipaddr->addr;
        xil_printf("set pc address to %d.%d.%d.%d\n\r", ip4_addr1(&g_pc_addr), ip4_addr2(&g_pc_addr), ip4_addr3(&g_pc_addr), ip4_addr4(&g_pc_addr));
    }
    if (g_pc_port == 0) {
        g_pc_port = port;
        xil_printf("set pc port to %d\n\r", port);
    }
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

int min(int a, int b)
{
    if (a <= b)
        return a;
    else
        return b;
}

// defined for lwip
void print_app_header()
{
    xil_printf("\n\r\n\r-----lwIP UDP sgm server ------\n\r");
}

// defined for lwip
int start_application()
{
    struct udp_pcb *in_pcb;

    err_t err;
    unsigned board_port = 50000;

    /* create new TCP PCB structure */
    in_pcb = udp_new_ip_type(IPADDR_TYPE_ANY);
    if (!in_pcb) {
        xil_printf("Error creating PCB. Out of Memory\n\r");
        return -1;
    }

    /* bind incoming socket to specified @port */
    err = udp_bind(in_pcb, IP_ANY_TYPE, board_port);
    if (err != ERR_OK) {
        xil_printf("Unable to bind to port %d: err = %d\n\r", board_port, err);
        return -3;
    }

    /* listen for data */
    udp_recv(in_pcb, recv_callback, NULL);

    xil_printf("Image receiver started @ port %d %d\n\r", board_port);

    return 0;
}

// defined for lwip
int transfer_data() {
    return 0;
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
