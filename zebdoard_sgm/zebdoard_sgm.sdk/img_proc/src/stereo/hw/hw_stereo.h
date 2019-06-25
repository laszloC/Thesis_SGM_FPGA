/*
 * stereo.h
 *
 *  Created on: Jun 12, 2019
 *      Author: laszl
 */

#ifndef SRC_STEREO_HW_STEREO_H_
#define SRC_STEREO_HW_STEREO_H_

#include "../../common/common.h"
#include "../../common/sgm_types.h"

status_t init_stereo();

status_t compute_disparity_hw(img_t *left, img_t *right, img_t *disp, cost_t p1, cost_t p2, stats_t *time_stats);

status_t uninit_stereo();

#endif /* SRC_STEREO_HW_STEREO_H_ */
