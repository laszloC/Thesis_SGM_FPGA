#ifndef __SAD_H__
#define __SAD_H__

#include <stdint.h>
#include "common.h"

void comp_sad_cost(img_t<uint8_t>& img_left, img_t<uint8_t>& img_right, img_t<int32_t>& cost_out, int32_t disp_dir);

int32_t sad_block_cost(img_t<uint8_t>& img_left, img_t<uint8_t>& img_right, int32_t li, int32_t lj, int32_t ri, int32_t rj, int32_t width);

#endif // __SAD_H__
