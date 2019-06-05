#ifndef __SGM_H__
#define __SGM_H__

#include <stdint.h>
#include "common.h"

#define IMG_ROWS 188
#define IMG_COLS 225

#define MAX_DISP 30

#define IMG_SIZE (IMG_ROWS * IMG_COLS)

void comp_d_map(uint8_t* img_left, uint8_t* img_right, uint8_t* disp_out, int32_t* img_cost);

void comp_disps(img_t<int32_t>& cost_in, img_t<uint8_t>& disp_out);

#endif // __SGM_H__
