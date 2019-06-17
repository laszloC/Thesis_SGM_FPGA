#ifndef __AGGR_H__
#define __AGGR_H__

#include <stdint.h>

#include "../hw_constants/constants.h"

void aggr(int32_t* cost_in, int32_t p1, int32_t p2, int32_t* summed_cost);

void top_down();

void bottom_up();

void aggr_for_pixel_td(int32_t curr_i, int32_t curr_j);

void aggr_for_pixel_bu(int32_t curr_i, int32_t curr_j);

void initialize_arrays();

void aggr_cost_for_pixel(int32_t curr_i, int32_t curr_j, int32_t r);

int32_t min_cost(int32_t mi, int32_t d, int32_t r);

void shift_rows();
#endif // __AGGR_H__
