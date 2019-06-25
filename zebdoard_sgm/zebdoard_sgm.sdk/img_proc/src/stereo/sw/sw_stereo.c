/*
 * sw_stereo.c
 *
 *  Created on: Jun 25, 2019
 *      Author: laszl
 */

#ifndef SRC_STEREO_SW_SW_STEREO_C_
#define SRC_STEREO_SW_SW_STEREO_C_

#include "sw_stereo.h"
#include "sw_stereo_internal.h"

#include <stdlib.h>
#include <math.h>

#include "xtime_l.h"
#include "xil_printf.h"
#include "../../common/common.h"
#include "../../common/constants.h"

status_t init_sw_stereo()
{
    return SRV_STATUS_SUCCESS;
}

status_t compute_disparity_sw(img_t *left, img_t *right, img_t *disp, cost_t p1, cost_t p2, stats_t *time_stats)
{
    status_t status = SRV_STATUS_SUCCESS;
    XTime t_start_total, t_end_total;
    XTime t_start, t_end;

    XTime_GetTime(&t_start_total);

    // allocate cost matrix
    cost_t* cost_matrix = malloc(COST_SIZE * sizeof(cost_t));
    if (cost_matrix == NULL) {
        xil_printf("%s: Failed to allocate %d bytes\r\n", __FUNCTION__, COST_SIZE * sizeof(cost_t));
        status = SRV_STATUS_ALLOC_FAILED;
        goto cleanup;
    }

    // allocate aggregated matrix
    cost_t* aggr_matrix = malloc(COST_SIZE * sizeof(cost_t));
    if (aggr_matrix == NULL) {
        xil_printf("%s: Failed to allocate %d bytes\r\n", __FUNCTION__, COST_SIZE * sizeof(cost_t));
        status = SRV_STATUS_ALLOC_FAILED;
        goto cleanup;
    }

    // compute sad cost
    xil_printf("Will compute sad cost\r\n");
    XTime_GetTime(&t_start);
    compute_sad_cost_sw(left, right, cost_matrix);
    XTime_GetTime(&t_end);
    time_stats->cost_time = (t_end - t_start) / (COUNTS_PER_SECOND / 1000000);

    // transpose cost matrix
    for (index_t i = 0; i < COST_ROWS; i++) {
        for (index_t j = 0; j < COST_COLS; j++) {
            cost_t t = cost_matrix[i * COST_COLS + j];
            cost_matrix[i * COST_COLS + j] = cost_matrix[j * COST_ROWS + i];
            cost_matrix[j * COST_ROWS + i] = t;
        }
    }

    // aggregate cost
    xil_printf("Will aggregate cost matrix\r\n");
    XTime_GetTime(&t_start);
    compute_aggr_sw(cost_matrix, p1, p2, aggr_matrix);
    XTime_GetTime(&t_end);
    time_stats->aggr_time = (t_end - t_start) / (COUNTS_PER_SECOND / 1000000);

    // compute disparity map
    xil_printf("Will compute disparity map\r\n");
    XTime_GetTime(&t_start);
    compute_disp_sw(aggr_matrix, disp);
    XTime_GetTime(&t_end);
    time_stats->disp_time = (t_end - t_start) / (COUNTS_PER_SECOND / 1000000);

    XTime_GetTime(&t_end_total);
    time_stats->total_time = (t_end_total - t_start_total) / (COUNTS_PER_SECOND / 1000000);

cleanup:

    if (cost_matrix != NULL) {
        free(aggr_matrix);
    }

    if (cost_matrix != NULL) {
        free(cost_matrix);
    }

    return status;
}

status_t uninit_sw_stereo()
{
    return SRV_STATUS_SUCCESS;
}

void compute_sad_cost_sw(img_t *left, img_t *right, cost_t *cost)
{
    img_t rows_l[BLOCK_SIZE];
    img_t rows_r[BLOCK_SIZE];

    for (index_t i = 0; i < IMG_ROWS; i++) {
        for (index_t d = 0; d < MAX_DISP; d++) {

            // build blocks start
            for (index_t bi = 0; bi < BLOCK_ROWS; bi++) {
                for (index_t bj = 0; bj < BLOCK_COLS; bj++) {
                    index_t li = i - 2 + bi, lj = bj - 2;
                    index_t ri = i - 2 + bj, rj = lj - d;

                    if (!IS_IN_IMG_RANGE(li, lj)) {
                        rows_l[BLOCK_INDEX(bi, bj)] = 0;
                    }
                    else {
                        rows_l[BLOCK_INDEX(bi, bj)] = left[IMG_INDEX(li, lj)];
                    }

                    if (!IS_IN_IMG_RANGE(ri, rj)) {
                        rows_r[BLOCK_INDEX(bi, bj)] = 0;
                    }
                    else {
                        rows_r[BLOCK_INDEX(bi, bj)] = right[IMG_INDEX(ri, rj)];
                    }
                }
            }
            // build blocks end

            index_t cost_block_i = (d * IMG_SIZE) + (i * IMG_COLS);
            cost_t *cost_block = &cost[cost_block_i];

            sad_rows_cost(rows_l, rows_r, cost_block);
        }
    }
}

void compute_aggr_sw(cost_t *cost_in, cost_t p1, cost_t p2, cost_t *cost_out)
{
    for (index_t i = 0; i < COST_SIZE; i++) {
        cost_out[i] = cost_in[i];
    }
}

void compute_disp_sw(cost_t *cost, img_t *disp)
{
    for (index_t i = 0; i < IMG_ROWS; i++) {
        for (index_t j = 0; j < IMG_COLS; j++) {
            cost_t min_c = COST_MAX;
            img_t min_d = 0;
            for (index_t d = 0; d < MAX_DISP; d++) {
                cost_t c = cost[(i * IMG_COLS + j) * MAX_DISP + d];
                if (c < min_c) {
                    min_c = c;
                    min_d = (img_t)d;
                }
            }
            disp[IMG_INDEX(i, j)] = min_d;
        }
        xil_printf("Computed sw disparity for row %d\r\n", i);
    }
}

void sad_rows_cost(img_t *rows_l, img_t *rows_r, cost_t* cost_block)
{
    for (index_t cj = 0; cj < IMG_COLS; cj++) {
        cost_block[cj] = sad_block_cost(rows_l, rows_r, cj);
    }
}

cost_t sad_block_cost(img_t *rows_l,img_t *rows_r,index_t cj)
{
    cost_t sum = 0;

    for (index_t di = 0; di < BLOCK_ROWS; di++) {
        for (index_t dj = 0; dj < BLOCK_ROWS; dj++) {
            sum += abs(rows_l[BLOCK_INDEX(di, cj + dj - 2)] - rows_r[BLOCK_INDEX(di, cj + dj - 2)]);
        }
    }

    return sum;
}

#endif /* SRC_STEREO_SW_SW_STEREO_C_ */
