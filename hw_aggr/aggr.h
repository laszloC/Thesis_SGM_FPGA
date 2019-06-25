#ifndef __AGGR_H__
#define __AGGR_H__

#include <stdint.h>

#include "../hw_constants/types.h"
#include "../hw_constants/constants.h"

void aggr(cost_t* cost_in, cost_t p1, cost_t p2, cost_t* summed_cost);

void top_down();

void bottom_up();

void aggr_for_pixel_td(cost_t curr_i, cost_t curr_j);

void aggr_for_pixel_bu(cost_t curr_i, cost_t curr_j);

void initialize_arrays();

void aggr_cost_for_pixel(index_t curr_i, index_t curr_j, index_t r);

cost_t min_cost(cost_t mi, cost_t d, cost_t r);

void shift_rows();
#endif // __AGGR_H__
