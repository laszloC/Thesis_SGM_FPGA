#include "sad.h"

void sad_cost(uint8_t *img_left, uint8_t *img_right, int32_t *cost, int8_t disp_coeff)
{
//	int16_t disp_coeff = disp_dir ? 1 : -1;
	p_loop: for (int32_t p = 0; p < IMG_SIZE; p++) {
		d_loop: for (int32_t d = 0; d < MAX_DISP; d++) {
			int32_t ci = p, cj = d;
			int32_t i = p / IMG_COLS, j = p % IMG_COLS;
			int32_t ni = i, nj = j + (disp_coeff * d);

			cost[ci * MAX_DISP + cj] = sad_block_cost(img_left, img_right, i, j, ni, nj);
		}
	}
}


int32_t sad_block_cost(uint8_t *img_left, uint8_t *img_right, int32_t li, int32_t lj, int32_t ri, int32_t rj)
{
	int32_t sum = 0;

	di_loop: for (int32_t di = -HALF_WINDOW; di <= HALF_WINDOW; di++) {
		dj_loop: for (int32_t dj = -HALF_WINDOW; dj <= HALF_WINDOW; dj++) {
			int32_t cli = li + di, clj = lj + dj;
			int32_t cri = ri + di, crj = rj + dj;

			if (IS_IN_IMG_RANGE(cli, clj) && IS_IN_IMG_RANGE(cri, crj)) {
				int32_t l = (int16_t)img_left[cli * IMG_COLS + clj];
				int32_t r = (int16_t)img_right[cri * IMG_COLS + crj];

				sum += (l > r) ? (l - r) : (r - l);
			}
		}
	}

	return sum;
}
