/*
 * common.h
 *
 *  Created on: Jun 12, 2019
 *      Author: laszl
 */

#ifndef SRC_COMMON_COMMON_H_
#define SRC_COMMON_COMMON_H_

#include <xil_types.h>

#define MIN(A, B) ((A) < (B) ? (A) : (B))

// ERROR NUMBERS
#define SRV_STATUS_SUCCESS          0
#define SRV_STATUS_ERR_UNKNOWN_CMD  1
#define SRV_STATUS_RECV_FAILED      2
#define SRV_STATUS_SEND_FAILED      3
#define SRV_STATUS_IMG_PROC_FAILED  4
#define SRV_STATUS_STOP             5
#define SRV_STATUS_ALLOC_FAILED     6
#define SRV_STATUS_INIT_FAILED      7

typedef struct _stats_t
{
    u64 cost_time;
    u64 aggr_time;
    u64 disp_time;
    u64 total_time;
} stats_t;

void scale(u8* img, u32 size, u8 in_start, u8 in_end, u8 out_start, u8 out_end);

#endif /* SRC_COMMON_COMMON_H_ */
