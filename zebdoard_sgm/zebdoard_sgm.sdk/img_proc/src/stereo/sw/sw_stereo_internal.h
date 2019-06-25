/*
 * sw_stereo_internal.h
 *
 *  Created on: Jun 25, 2019
 *      Author: laszl
 */

#ifndef SRC_STEREO_SW_SW_STEREO_INTERNAL_H_
#define SRC_STEREO_SW_SW_STEREO_INTERNAL_H_

#include "../../common/sgm_types.h"

void compute_sad_cost_sw(img_t *left, img_t *right, cost_t *cost);

void compute_aggr_sw(cost_t *cost_in, cost_t p1, cost_t p2, cost_t *cost_out);

void compute_disp_sw(cost_t *cost, img_t *disp);

void sad_rows_cost(img_t *rows_l, img_t *rows_r, cost_t* cost_block);

cost_t sad_block_cost(img_t *rows_l,img_t *rows_r,index_t cj);

#endif /* SRC_STEREO_SW_SW_STEREO_INTERNAL_H_ */
