#include "sad.h"

int32_t abs_val(int32_t a){
	return (a < 0) ? -a : a;
}


void comp_sad_cost(img_t<uint8_t>& img_left, img_t<uint8_t>& img_right, img_t<int32_t>& cost_out, int32_t disp_dir)
{
	int32_t max_disp = cost_out.m_cols;
	int32_t rows = img_left.m_rows;
	int32_t cols = img_left.m_cols;
	int32_t block_width = 5;

	for (int32_t i = 0; i < rows; i++) {
		for (int32_t j = 0; j < cols; j++) {
			for (int32_t d = 0; d < max_disp; d++) {

				int32_t ci = i * cols + j, cj = d;
				int32_t ni = i, nj = j + (disp_dir * d);

				cost_out.at(ci, cj) = sad_block_cost(img_left, img_right, i, j, ni, nj, block_width);
			}
		}
	}
}

int32_t sad_block_cost(img_t<uint8_t>& img_left, img_t<uint8_t>& img_right, int32_t li, int32_t lj, int32_t ri, int32_t rj, int32_t width)
{
	int32_t w = width / 2;
	int32_t sum = 0;

	for	(int32_t di = -w; di <= w; di++) {
		for (int32_t dj = -w; dj <= w; dj++) {
			int cli = li + di, clj = lj + dj;
			int cri = ri + di, crj = rj + dj;

			if (img_left.is_in_img_range(cli, clj) && img_right.is_in_img_range(cri, crj)){
				int32_t l = img_left.at(cli, clj);
				int32_t r = img_right.at(cri, crj);

				sum += abs_val(l - r);
			}
		}
	}

	return sum;
}
