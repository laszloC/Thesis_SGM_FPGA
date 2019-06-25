#ifndef __DISP_H__
#define __DISP_H__

#include <stdint.h>

#include "../hw_constants/constants.h"
#include "../hw_constants/types.h"

//#include <ap_int.h>

void disp(cost_t* cost_in, img_t* disp_out);

img_t min_disp(cost_t* cost, index_t p);

void copy_column(cost_t* dest, cost_t* src);

//void wta_disp(index_t p);
void wta_disp(index_t p, cost_t *cost, img_t* disp);

index_t cost_index(index_t i, index_t j);

#endif // __DISP_H__
