/*
 * stereo_internal.h
 *
 *  Created on: Jun 12, 2019
 *      Author: laszl
 */

#ifndef SRC_STEREO_STEREO_INTERNAL_H_
#define SRC_STEREO_STEREO_INTERNAL_H_

#include "xsad_cost.h"
#include "xaggr.h"
#include "xdisp.h"

int init_sad_cost(XSad_cost *instance);

int init_aggr(XAggr *instance);

int init_disp(XDisp *instance);

void compute_sad_cost(u8 *left, u8* right, s32* cost, s8* disp_coeff);

void compute_aggr(s32* cost_in, s32 p1, s32 p2, s32* cost_out);

void compute_disp(s32* cost, u8* disp);

void start_sad_cost(void *instance);

void start_aggr(void *instance);

void start_disp(void *instance);

#endif /* SRC_STEREO_STEREO_INTERNAL_H_ */
