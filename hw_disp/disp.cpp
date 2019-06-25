#include "disp.h"

#include <stdlib.h>
#include <string.h>

cost_t g_cost[DISP_BLOCK_ROWS][DISP_BLOCK_COLS];
//img_t g_disp[DISP_BLOCK_ROWS];

void disp(cost_t* cost_in, img_t* disp_out)
{
	#pragma HLS INTERFACE s_axilite port=return bundle=DATA_BUS
	// sizeof(cost_in) = DISP_BLOCK_SIZE
	#pragma HLS INTERFACE m_axi depth=10240 port=cost_in offset=slave bundle=DATA_BUS
	// sizeof(disp_out) = BLOCK_ROWS
	#pragma HLS INTERFACE m_axi depth=320 port=disp_out offset=slave bundle=DATA_BUS

	memcpy((void*)g_cost, (const void*)cost_in, DISP_BLOCK_SIZE * sizeof(cost_t));

	p_loop: for (index_t p = 0; p < DISP_BLOCK_ROWS; p++) {
	#pragma HLS DEPENDENCE variable=g_cost array inter false
		wta_disp(p, g_cost[p], disp_out + p);
	}

 }

void cost_index(index_t i, index_t j, index_t& r)
{
	r = cost_index(i, j);
}

void min(cost_t& min_c, img_t& min_i, cost_t& c, index_t& i)
{
	if (c < min_c) {
		min_c = c;
		min_i = i;
	}
}

void wta_disp(index_t p, cost_t *cost, img_t* disp)
{
	img_t min_d = 0;
	cost_t min_c = COST_MAX;
	index_t i;

	d_loop: for(index_t d = 0; d < DISP_BLOCK_COLS; d++) {
	#pragma HLS PIPELINE
		min(min_c, min_d, cost[d], d);
	}

	*disp = min_d;
}

index_t cost_index(index_t i, index_t j)
{
	#pragma HLS INLINE off
	index_t t1 = i * DISP_BLOCK_COLS;
	index_t t2 = t1 + j;
	#pragma HLS RESOURCE variable=t2 core=AddSub
	return t2;
}
