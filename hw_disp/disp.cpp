#include "disp.h"

void disp(int32_t* cost_in, uint8_t* disp_out)
{
	p_loop: for (int32_t p = 0; p < IMG_SIZE; p++) {
		int32_t min_d = MAX_DISP + 1;
		int32_t min_c = COST_MAX;
		d_loop: for (int32_t d = 0; d < MAX_DISP; d++) {
			int16_t c = cost_in[p * MAX_DISP + d];
			if (c < min_c) {
				min_c = c;
				min_d = d;
			}
		}
		disp_out[p] = min_d;
	}
}
