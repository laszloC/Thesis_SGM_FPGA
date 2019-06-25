#include "hw_stereo.h"
#include "hw_stereo_internal.h"

#include <stdlib.h>
#include "xparameters.h"
#include "../../common/common.h"
#include "../../common/constants.h"
#include "xtime_l.h"

XSad_cost	g_sad_cost_hw;
//XAggr		g_aggr_hw;
XDisp		g_disp_hw;

status_t init_hw_stereo()
{
	status_t status = 0;

	status = init_sad_cost(&g_sad_cost_hw);
	if (status != 0) {
		xil_printf("Init sad cost failed with status %d\r\n", status);
		return SRV_STATUS_INIT_FAILED;
	}

//	status = init_aggr(&g_aggr_hw);
//	if (status != 0) {
//		xil_printf("Init aggr failed with status %d\r\n", status);
//		return status;
//	}

	status = init_disp(&g_disp_hw);
	if (status != 0) {
		xil_printf("Init disp failed with status %d\r\n", status);
		return SRV_STATUS_INIT_FAILED;
	}

	return status;
}

status_t compute_disparity_hw(img_t *left, img_t *right, img_t *disp, cost_t p1, cost_t p2, stats_t *time_stats)
{
    status_t status = SRV_STATUS_SUCCESS;
    XTime t_start_total, t_end_total;
    XTime t_start, t_end;

    XTime_GetTime(&t_start_total);
    // allocate cost matrix
    cost_t* cost_matrix = malloc(COST_SIZE * sizeof(cost_t));
    if (cost_matrix == NULL) {
        xil_printf("Failed to allocate %d bytes\r\n", COST_SIZE * sizeof(cost_t));
        status = SRV_STATUS_ALLOC_FAILED;
        goto cleanup;
    }

//     allocate aggr matrix
//     s32* aggr_matrix = malloc(cost_size * sizeof(s32));
//     if (cost_matrix == NULL) {
//         xil_printf("Failed to allocate %d bytes\r\n", cost_size * sizeof(s32));
//        goto cleanup;
//     }

    // compute sad cost
    xil_printf("Will compute sad cost\r\n");
    XTime_GetTime(&t_start);
    compute_sad_cost_hw(left, right, cost_matrix);
    XTime_GetTime(&t_end);
    time_stats->cost_time = (t_end - t_start) / (COUNTS_PER_SECOND / 1000000);

    // aggregate cost
//    xil_printf("Will aggregate cost\r\n");
    XTime_GetTime(&t_start);
//    compute_aggr_hw(cost_matrix, p1, p2, aggr_matrix);
    XTime_GetTime(&t_end);
    time_stats->aggr_time = (t_end - t_start) / (COUNTS_PER_SECOND / 1000000);

    // compute disparity map
    xil_printf("Will compute disparity map\r\n");
    XTime_GetTime(&t_start);
//    compute_disp(aggr_matrix, disp);
    compute_disp_hw(cost_matrix, disp);
    XTime_GetTime(&t_end);
    time_stats->disp_time = (t_end - t_start) / (COUNTS_PER_SECOND / 1000000);

    XTime_GetTime(&t_end_total);
    time_stats->total_time = (t_end_total - t_start_total) / (COUNTS_PER_SECOND / 1000000);

cleanup:

//    if (aggr_matrix != NULL) {
//        free(aggr_matrix);
//    }

    if (cost_matrix != NULL) {
        free(cost_matrix);
    }

    return status;
}

status_t uninit_hw_stereo()
{
	return 0;
}

status_t init_sad_cost(XSad_cost *instance)
{
	XSad_cost_Config *sad_cost_cfg;
	status_t status = 0;

	sad_cost_cfg = XSad_cost_LookupConfig(XPAR_XSAD_COST_0_DEVICE_ID);
	if (!sad_cost_cfg) {
		xil_printf("Sad cost lookup failed\r\n");
		return XST_FAILURE;
	}

	status = XSad_cost_CfgInitialize(instance, sad_cost_cfg);
	if (status != XST_SUCCESS) {
		xil_printf("Sad Cost Cfg Initialize failed with status %d\r\n");
		return status;
	}

	return status;
}

//int init_aggr(XAggr *instance)
//{
//	XAggr_Config *aggr_cfg;
//	int status = 0;
//
//	aggr_cfg = XAggr_LookupConfig(XPAR_XAGGR_0_DEVICE_ID);
//	if (!aggr_cfg) {
//		xil_printf("Aggr lookup failed\r\n");
//		return XST_FAILURE;
//	}
//
//	status = XAggr_CfgInitialize(instance, aggr_cfg);
//	if (status != XST_SUCCESS) {
//		xil_printf("Aggr Cfg Initialize failed with status %d\r\n");
//		return status;
//	}
//
//	return status;
//}

status_t init_disp(XDisp *instance)
{
	XDisp_Config *disp_cfg;
	status_t status = 0;

	disp_cfg = XDisp_LookupConfig(XPAR_XDISP_0_DEVICE_ID);
	if (!disp_cfg) {
		xil_printf("Disp lookup failed\r\n");
		return XST_FAILURE;
	}

	status = XDisp_CfgInitialize(instance, disp_cfg);
	if (status != XST_SUCCESS) {
		xil_printf("Disp Cfg Initialize failed with status %d\r\n");
		return status;
	}

	return status;
}

void compute_sad_cost_hw(img_t *left, img_t *right, cost_t *cost)
{
	img_t rows_l[BLOCK_SIZE];
	img_t rows_r[BLOCK_SIZE];

	for (index_t i = 0; i < IMG_ROWS; i++) {
		for (index_t d = 0; d < MAX_DISP; d++) {

			// build blocks start
			for (index_t bi = 0; bi < BLOCK_ROWS; bi++) {
				for (index_t bj = 0; bj < BLOCK_COLS; bj++) {
					index_t li = i - 2 + bi, lj = bj - 2;
					index_t ri = i - 2 + bi, rj = lj - d;

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

			// set parameters
			XSad_cost_Set_rows_left(&g_sad_cost_hw, (u32)rows_l);
			XSad_cost_Set_rows_right(&g_sad_cost_hw, (u32)rows_r);
			XSad_cost_Set_cost_out(&g_sad_cost_hw, (u32)cost_block);

			start_sad_cost(&g_sad_cost_hw);

//			xil_printf("Computing sad block cost\r\n");
			while (!XSad_cost_IsDone(&g_sad_cost_hw));
//			xil_printf("Finished computing sad block cost\r\n");
		}
	}
}

//void compute_aggr_hw(s32* cost_in, s32 p1, s32 p2, s32* cost_out)
//{
//	XAggr_Set_cost_in(&g_aggr_hw, (u32)cost_in);
//	XAggr_Set_p1(&g_aggr_hw, (u32)p1);
//	XAggr_Set_p2(&g_aggr_hw, (u32)p2);
//	XAggr_Set_summed_cost(&g_aggr_hw, (u32)cost_out);
//
//	start_aggr(&g_aggr_hw);
//
//	while (!XAggr_IsDone(&g_aggr_hw));
//}

void compute_disp_hw(cost_t *cost, img_t *disp)
{
	cost_t *cost_trans = malloc(COST_SIZE * sizeof(cost_t));
	if (cost_trans == NULL) {
		goto cleanup;
	}

	// transpose matrix
	for (index_t i = 0; i < COST_ROWS; i++) {
		for (index_t j = 0; j < COST_COLS; j++) {
			cost_trans[j * COST_ROWS + i] = cost[i * COST_COLS + j];
		}
	}

	for	(index_t i = 0; i < IMG_ROWS; i++) {

//		// build cost block start
//		for (index_t j = 0; j < IMG_COLS; j++) {
//			for (index_t r = 0; r < COST_ROWS; r++) {
//				disp_block[j * DISP_BLOCK_COLS + r] = cost[COST_INDEX(r, IMG_INDEX(i, j))];
//			}
//		}
//		// build cost block end

		cost_t *cost_row = &cost_trans[i * IMG_COLS * MAX_DISP];
		img_t *disp_row = &disp[i * IMG_COLS];
		XDisp_Set_cost_in(&g_disp_hw, (u32)cost_row);
		XDisp_Set_disp_out(&g_disp_hw, (u32)disp_row);

		XDisp_Start(&g_disp_hw);
//		xil_printf("Computing disparity block\r\n");
		while (!XDisp_IsDone(&g_disp_hw));
//		xil_printf("Finished computing disparity block\r\n");
	}

cleanup:

	if(cost_trans != NULL){
		free(cost_trans);
	}

}

void start_sad_cost(void *instance)
{
	XSad_cost *sad_cost = (XSad_cost*) instance;

	XSad_cost_InterruptEnable(sad_cost, 1);
	XSad_cost_InterruptGlobalEnable(sad_cost);
	XSad_cost_Start(sad_cost);
}

//void start_aggr(void *instance)
//{
//	XAggr *aggr = (XAggr*) instance;
//
//	XAggr_InterruptEnable(aggr, 1);
//	XAggr_InterruptGlobalEnable(aggr);
//	XAggr_Start(aggr);
//}

void start_disp(void *instance)
{
	XDisp *disp = (XDisp*) instance;

	XDisp_InterruptEnable(disp, 1);
	XDisp_InterruptGlobalEnable(disp);
	XDisp_Start(disp);
}
