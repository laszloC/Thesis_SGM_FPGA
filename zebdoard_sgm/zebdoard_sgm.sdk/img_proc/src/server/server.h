/*
 * server.h
 *
 *  Created on: Jun 24, 2019
 *      Author: laszl
 */

#ifndef SRC_SERVER_SERVER_H_
#define SRC_SERVER_SERVER_H_

#include "../common/sgm_types.h"

typedef enum _command_t
{
    CMD_UNKNOWN             = 0x0,

    // requests
    CMD_REQ_SEND_IMG        = 0x1,
    CMD_REQ_COMP_NEG        = 0x2,
	CMD_REQ_DEPTH_MAP_HW    = 0x3,
	CMD_REQ_DEPTH_MAP_SW    = 0x4,
    CMD_REQ_STOP            = 0x5,

    // responses
    CMD_RESP_RECV_IMG_SIZE  = 0x16,
    CMD_RESP_RECV_IMG       = 0x17,
    CMD_RESP_RECV_FRAG      = 0x18,
	CMD_RESP_CANNOT_RECV    = 0x19,
} command_t;


// initializes the server
status_t server_init();

// interprets and executes a command
status_t interpret_command(int sd, command_t cmd);

// un-initializes the server
status_t server_uninit();

#endif /* SRC_SERVER_SERVER_H_ */
