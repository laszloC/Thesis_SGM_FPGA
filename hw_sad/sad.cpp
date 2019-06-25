#include "sad.h"

#include <stdlib.h>
#include <string.h>
#include <hls_alg.h>

img_t g_rows_l[BLOCK_ROWS * BLOCK_COLS];

img_t g_rows_r[BLOCK_ROWS * BLOCK_COLS];

cost_t cost[IMG_COLS];

void sad_cost(img_t *rows_left, img_t *rows_right, cost_t *cost_out)
{
	#pragma HLS INTERFACE s_axilite port=return bundle=CTRL_BUS
	// sizeof(rows_left) = BLOCK_ROWS * BLOCK_COLS
	#pragma HLS INTERFACE m_axi depth=1620 port=rows_left offset=slave bundle=DATA_BUS
	// sizeof(rows_right) = BLOCK_ROWS * BLOCK_COLS
	#pragma HLS INTERFACE m_axi depth=1620 port=rows_right offset=slave bundle=DATA_BUS
	// sizeof(cost_out) = IMG_ROWS *
	#pragma HLS INTERFACE m_axi depth=240 port=cost_out offset=slave bundle=DATA_BUS

	memcpy((void*)g_rows_l, (const void*)rows_left, BLOCK_SIZE * sizeof(img_t));
	memcpy((void*)g_rows_r, (const void*)rows_right, BLOCK_SIZE * sizeof(img_t));

	compute_cost();

	memcpy(cost_out, cost, IMG_COLS * sizeof(cost_t));
}

void compute_cost()
{
	cj_loop: for (index_t cj = 0; cj < IMG_COLS; cj++)
	{
		cost[cj] = sad_block_cost(cj);
	}
}

cost_t sad_block_cost(index_t cj)
{
	cost_t total_sum = 0;
	cost_t sum[BLOCK_ROWS];
	#pragma HLS ARRAY_RESHAPE variable=sum complete dim=1

	di_loop: for (index_t di = 0; di < BLOCK_ROWS; di++) {
		dj_loop: for (index_t dj = 0; dj < BLOCK_ROWS; dj++) {
		#pragma HLS PIPELINE
			sum[dj] = diff_abs(get_left_pix(di, cj + dj - 2), get_right_pix(di, cj + dj - 2));
		}
		total_sum += sum[0] + sum[1] + sum[2] + sum[3] + sum[4];
	}

	return total_sum;
}

img_t get_left_pix(index_t i, index_t j)
{
	index_t index = block_index(i, j);
//	#pragma HLS RESOURCE variable=index core=Mul
	return g_rows_l[index];
}

img_t get_right_pix(index_t i, index_t j)
{
	index_t index = block_index(i, j);
//	#pragma HLS RESOURCE variable=index core=Mul
	return g_rows_r[index];
}

cost_t diff_abs(cost_t a, cost_t b)
{
	// compute difference
	cost_t res = a - b;

	// compute absolute
	cost_t mask = res >> COST_WIDTH_1;
	res = res ^ mask;
	res = res - mask;

	return res;
}

void copy_input(img_t rows_left[BLOCK_ROWS * BLOCK_COLS], img_t rows_right[BLOCK_ROWS * BLOCK_COLS])
{
#pragma HLS INLINE
	index_t i = 0;
	index_t j = 0;
	i0_loop: for (i = 0; i < BLOCK_ROWS; i++) {
		j0_loop: for (j = 0; j < BLOCK_COLS; j++) {
		#pragma HLS PIPELINE
			index_t index = block_index(i, j);
//			#pragma HLS RESOURCE variable=index core=Mul
			img_t left = rows_left[index];
			img_t right = rows_right[index];
			switch(i) {
				case 0:
					g_rows_l[j] = left;
					g_rows_r[j] = right;
					break;
			}
		}
	}
}

index_t block_index(index_t i, index_t j)
{
	index_t t1 = i * BLOCK_COLS;
	#pragma HLS RESOURCE variable=t1 core=Mul
	index_t t2 = t1 + j;
	#pragma HLS RESOURCE variable=t2 core=AddSub
	return t2;
}
