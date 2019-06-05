#include "sad.h"
#include "sgm.h"

// declare cost matrix

void comp_d_map(uint8_t* img_left, uint8_t* img_right, uint8_t* disp_out, int32_t* img_cost)
{
#pragma HLS INTERFACE s_axilite port=return bundle=IMG_BUS
#pragma HLS INTERFACE m_axi depth=42300 port=disp_out offset=slave bundle=IMG_BUS
#pragma HLS INTERFACE m_axi depth=42300 port=img_right offset=slave bundle=IMG_BUS
#pragma HLS INTERFACE m_axi depth=42300 port=img_left offset=slave bundle=IMG_BUS
#pragma HLS INTERFACE m_axi depth=1269000 port=img_cost offset=slave bundle=COST_BUS

	// create image objects
	img_t<uint8_t> left(img_left, IMG_ROWS, IMG_COLS);
	img_t<uint8_t> right(img_right, IMG_ROWS, IMG_COLS);
	img_t<uint8_t> d_map(disp_out, IMG_ROWS, IMG_COLS);

	img_t<int32_t> cost_lr(img_cost, IMG_SIZE, MAX_DISP);

	// compute sad cost matrix
	comp_sad_cost(left, right, cost_lr, -1);

	// compute disparities
	comp_disps(cost_lr, d_map);

	// optimize the disparity map using SGM

	// scale disparity image into 0-255 range
	scale<uint8_t>(d_map, 0, MAX_DISP - 1, 0, 255);
}

void comp_disps(img_t<int32_t>& cost_in, img_t<uint8_t>& disp_out)
{
	int32_t rows = disp_out.m_rows;
	int32_t cols = disp_out.m_cols;

	for (int32_t i = 0; i < rows; i++) {
		for (int32_t j = 0; j < cols; j++) {
			int32_t min_d = cost_in.m_cols + 1;
			int32_t min_c = 255;

			for (int32_t d = 0; d < cost_in.m_cols; ++d) {
				int32_t p = i * cols + j;
				if (cost_in.at(p, d) < min_c) {
					min_c = cost_in.at(p, d);
					min_d = d;
				}
			}
			disp_out.at(i, j) = min_d;
		}
	}
}
