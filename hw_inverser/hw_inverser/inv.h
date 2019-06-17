#ifndef __INV_H__
#define __INV_H__

#include <stdint.h>

#define IMG_ROWS 188
#define IMG_COLS 225

#define IMG_SIZE (IMG_ROWS * IMG_COLS)

void inverse_img(uint8_t img_in[IMG_SIZE], uint8_t img_out[IMG_SIZE]);

#endif // __INV_H__
