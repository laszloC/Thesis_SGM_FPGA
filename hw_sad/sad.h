#ifndef __SAD_H__
#define __SAD_H__

#include "../hw_constants/types.h"
#include "../hw_constants/constants.h"

#include <stdint.h>

// given 5 rows of the image, it calculates the sad cost of the middle row using a 5 by 5 window
void sad_cost(img_t *rows_left, img_t *rows_right, cost_t *cost_out);

void compute_cost();

//void sad_block_cost(ap_int<8> *img_left, ap_int<8> *img_right, ap_int<16> li, ap_int<16> lj, ap_int<16> ri, ap_int<16> rj);

cost_t sad_block_cost(index_t cj);

cost_t diff_abs(cost_t a, cost_t b);

img_t get_left_pix(index_t i, index_t j);

img_t get_right_pix(index_t i, index_t j);

void copy_input(img_t rows_left[BLOCK_ROWS * BLOCK_COLS], img_t rows_right[BLOCK_ROWS * BLOCK_COLS]);

index_t block_index(index_t i, index_t j);

#endif // __SAD_H__
