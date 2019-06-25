/*
 * sw_stereo.h
 *
 *  Created on: Jun 25, 2019
 *      Author: laszl
 */

#ifndef SRC_STEREO_SW_SW_STEREO_H_
#define SRC_STEREO_SW_SW_STEREO_H_

#include "../../common/common.h"
#include "../../common/sgm_types.h"

status_t init_hw_stereo();

status_t compute_disparity_sw(img_t *left, img_t *right, img_t *disp, cost_t p1, cost_t p2, stats_t *time_stats);

status_t uninit_sw_stereo();

#endif /* SRC_STEREO_SW_SW_STEREO_H_ */
