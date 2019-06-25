/*
 * stereo_internal.h
 *
 *  Created on: Jun 12, 2019
 *      Author: laszl
 */

#ifndef SRC_STEREO_HW_STEREO_INTERNAL_H_
#define SRC_STEREO_HW_STEREO_INTERNAL_H_

#include "xsad_cost.h"
//#include "xaggr.h"
#include "xdisp.h"

#include "../../common/sgm_types.h"

status_t init_sad_cost(XSad_cost *instance);

//int init_aggr(XAggr *instance);

status_t init_disp(XDisp *instance);

void compute_sad_cost_hw(img_t *left, img_t *right, cost_t *cost);

//void compute_aggr_hw(s32* cost_in, s32 p1, s32 p2, s32* cost_out);

void compute_disp_hw(cost_t *cost, img_t *disp);

void start_sad_cost(void *instance);

//void start_aggr(void *instance);

void start_disp(void *instance);

#endif /* SRC_STEREO_HW_STEREO_INTERNAL_H_ */
