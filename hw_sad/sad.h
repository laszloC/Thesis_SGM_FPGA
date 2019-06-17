#ifndef __SAD_H__
#define __SAD_H__

#include "../hw_constants/constants.h"

#include <stdint.h>
//#include <ap_int.h>

#define WINDOW 5

#define HALF_WINDOW (WINDOW / 2)

//void sad_cost(ap_int<8> *img_left, ap_int<8> *img_right, ap_int<16> *cost, ap_int<1> disp_coeff);

void sad_cost(uint8_t *img_left, uint8_t *img_right, int32_t *cost, int8_t disp_coeff);

//void sad_block_cost(ap_int<8> *img_left, ap_int<8> *img_right, ap_int<16> li, ap_int<16> lj, ap_int<16> ri, ap_int<16> rj);

int32_t sad_block_cost(uint8_t *img_left, uint8_t *img_right, int32_t li, int32_t lj, int32_t ri, int32_t rj);

#endif // __SAD_H__
