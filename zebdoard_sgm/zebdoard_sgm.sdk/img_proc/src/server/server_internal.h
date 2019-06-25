/*
 * stereo_internal.h
 *
 *  Created on: Jun 24, 2019
 *      Author: laszl
 */

#ifndef SRC_SERVER_SERVER_INTERNAL_H_
#define SRC_SERVER_SERVER_INTERNAL_H_

#include "../common/common.h"
#include "../common/sgm_types.h"

status_t receive_image(int sd);

status_t compute_and_send_negative(int sd);

status_t compute_and_send_depth_map(int sd, int accelerated);

status_t send_image(int sd, img_t *img, u32 h, u32 w);

status_t build_image(int sd, img_t **img, u32 *size);

status_t send_time_stats(int sd, stats_t *time_stats);

#endif /* SRC_SERVER_SERVER_INTERNAL_H_ */
