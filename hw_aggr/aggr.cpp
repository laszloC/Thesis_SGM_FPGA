#include "aggr.h"

cost_t g_p1 = 0, g_p2 = 0;
cost_t *g_cost_in, *g_summed_cost;

cost_t g_m[2 * IMG_COLS][4 * MAX_DISP] = { 0 };
cost_t g_min_lr[2 * IMG_COLS][4] = { 0 };

const cost_t DI[8] = {-1, -1, -1,  0, +1, +1, +1,  0};
const cost_t DJ[8] = {-1,  0, +1, -1, +1,  0, -1, +1};

void aggr(cost_t* cost_in, cost_t p1, cost_t p2, cost_t* summed_cost)
{
#pragma HLS INTERFACE m_axi depth=2457600 port=summed_cost offset=slave bundle=DATA_BUS
#pragma HLS INTERFACE s_axilite port=return bundle=DATA_BUS
#pragma HLS INTERFACE m_axi depth=2457600 port=cost_in offset=slave bundle=DATA_BUS
#pragma HLS INTERFACE s_axilite port=p1 bundle=DATA_BUS
#pragma HLS INTERFACE s_axilite port=p2 bundle=DATA_BUS
	g_p1 = p1;
	g_p2 = p2;

//	for (int32_t i = 0; i < COST_SIZE; i++) {
//		g_cost_in[i] = cost_in[i];
//	}
	g_cost_in = cost_in;
	g_summed_cost = summed_cost;

	top_down();

	bottom_up();

//	for (int32_t i = 0; i < COST_SIZE; i++) {
//		summed_cost[i] = g_summed_cost[i];
//	}
}

void top_down()
{
	initialize_arrays();

	// go in top-down manner from left-top pixel
	i_loop: for (index_t curr_i = 0; curr_i < IMG_ROWS; curr_i++) {
		j_loop: for (index_t curr_j = 0; curr_j < IMG_COLS; curr_j++) {
			aggr_for_pixel_td(curr_i, curr_j);
		}
		shift_rows();
	}
}

void bottom_up()
{
	initialize_arrays();

	// go in bottom-up manner from bottom-right pixel
	i_loop: for (index_t curr_i = IMG_ROWS - 1; curr_i >= 0; curr_i--) {
		j_loop: for (index_t curr_j = IMG_COLS - 1; curr_j >= 0; curr_j--) {
			aggr_for_pixel_bu(curr_i, curr_j);
		}
		shift_rows();
	}
}

void aggr_for_pixel_td(index_t curr_i, index_t curr_j)
{
//#pragma HLS DATAFLOW
	aggr_cost_for_pixel(curr_i, curr_j, 0);
	aggr_cost_for_pixel(curr_i, curr_j, 1);
	aggr_cost_for_pixel(curr_i, curr_j, 2);
	aggr_cost_for_pixel(curr_i, curr_j, 3);
}

void aggr_for_pixel_bu(index_t curr_i, index_t curr_j)
{
//#pragma HLS DATAFLOW
	aggr_cost_for_pixel(curr_i, curr_j, 4);
	aggr_cost_for_pixel(curr_i, curr_j, 5);
	aggr_cost_for_pixel(curr_i, curr_j, 6);
	aggr_cost_for_pixel(curr_i, curr_j, 7);
}

void initialize_arrays()
{
	index_t i_max = 2 * IMG_COLS;
	i1_loop: for (index_t i = 0; i < i_max; i++) {
		j1_loop: for (index_t j = 0; j < 4; j++) {
		#pragma HLS PIPELINE
			g_min_lr[i][j] = COST_MAX;
		}
	}

	i2_loop: for (index_t i = 0; i < i_max; i++) {
		j2_loop: for (index_t j	= 0; j < 4 * MAX_DISP; j++) {
		#pragma HLS PIPELINE
			g_m[i][j] = 0;
		}
	}
}


void aggr_cost_for_pixel(int curr_i, int curr_j, int r)
{
	volatile index_t p;
	volatile index_t prev_i, prev_j;
	volatile index_t curr_mi, curr_mj;
	volatile index_t prev_mi, prev_mj;
	volatile index_t r_adj = r % 4;

	prev_i = curr_i + DI[r];
	prev_j = curr_j + DJ[r];

	p = curr_i * IMG_COLS + curr_j;

	curr_mi = IMG_COLS + curr_j;
	prev_mi = ((r_adj < 3) ? 0 : IMG_COLS) + prev_j;

	if (prev_i < 0 || prev_j < 0 || prev_i >= IMG_ROWS || prev_j >= IMG_COLS) {
		d_loop_out: for	(index_t d = 0; d < MAX_DISP; d++) {
			curr_mj = r_adj * MAX_DISP + d;
			g_m[curr_mi][curr_mj] = g_cost_in[p * MAX_DISP + d];
		}
	}
	else {
		d_loop_in: for (index_t d = 0; d < MAX_DISP; d++) {
			curr_mj = r_adj * MAX_DISP + d;
			g_m[curr_mi][curr_mj] = g_cost_in[p * MAX_DISP + d] +
					min_cost(prev_mi, d, r_adj) - g_min_lr[prev_mi][r_adj];
		}
	}

	// add computed cost to summed cost
	// find minimum cost from all disparities
	d_loop: for (index_t d = 0; d < MAX_DISP; d++) {
		curr_mj = r_adj * MAX_DISP + d;
		g_summed_cost[p * MAX_DISP + d] += g_m[curr_mi][curr_mj];
		if (g_m[curr_mi][curr_mj] < g_min_lr[curr_mi][r_adj]) {
			g_min_lr[curr_mi][r_adj] = g_m[curr_mi][curr_mj];
		}
	}
}


cost_t min_cost(cost_t mi, cost_t d, cost_t r)
{
	volatile cost_t min = COST_MAX;
	volatile int curr_mj;
	volatile int delta_d;
	volatile cost_t l;

	cd_loop:for (index_t cd = 0; cd < MAX_DISP; cd++) {
		delta_d = (d > cd) ? (d - cd) : (cd - d);
		curr_mj = r * MAX_DISP + cd;
		l = g_m[mi][curr_mj];

		if (delta_d == 1) l += g_p1;
		else if (delta_d > 1) l += g_p2;

		if (l < min) min = l;
	}

	return min;
}

void shift_rows()
{
	j1_loop: for (index_t j = 0; j < IMG_COLS; j++) {
		r_loop:for (index_t r = 0; r < 4; r++) {
		#pragma HLS UNROLL
			g_min_lr[j][r] = g_min_lr[IMG_COLS + j][r];
			g_min_lr[IMG_COLS + j][r] = COST_MAX;
		}
	}

	j2_loop: for	(index_t j = 0; j < IMG_COLS; j++) {
		d_loop:for (index_t d = 0; d < 4 * MAX_DISP; d++) {
		#pragma HLS UNROLL
			g_m[j][d] = g_m[IMG_COLS + j][d];
			g_m[IMG_COLS + j][d] = 0;
		}
	}
}
