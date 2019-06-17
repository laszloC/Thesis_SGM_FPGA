#include "stereo.h"
#include "stereo_internal.h"

#include <stdlib.h>

#include "xparameters.h"

XSad_cost	g_sad_cost_hw;
XAggr		g_aggr_hw;
XDisp		g_disp_hw;

int init_stereo()
{
	int status = 0;

	status = init_sad_cost(&g_sad_cost_hw);
	if (status != 0) {
		xil_printf("Init sad cost failed with status %d\r\n", status);
		return status;
	}

	status = init_aggr(&g_aggr_hw);
	if (status != 0) {
		xil_printf("Init aggr failed with status %d\r\n", status);
		return status;
	}

	status = init_disp(&g_disp_hw);
	if (status != 0) {
		xil_printf("Init disp failed with status %d\r\n", status);
		return status;
	}

	return status;
}

int compute_disparity(u8* left, u8* right, u8* disp, u32* size, u32 max_disp)
{
	s32 p1 = 15;
	s32 p2 = 40;

	u32 cost_size = size[0] * size[1] * max_disp;
	// allocate cost matrix
	s32* cost_matrix = malloc(cost_size * sizeof(s32));
	if (cost_matrix == NULL) {
		xil_printf("Failed to allocate %d bytes\r\n", cost_size * sizeof(s32));
		goto cleanup;
	}

	s32* aggr_matrix = malloc(cost_size * sizeof(s32));
	if (cost_matrix == NULL) {
		xil_printf("Failed to allocate %d bytes\r\n", cost_size * sizeof(s32));
		goto cleanup;
	}

	// compute sad cost
	xil_printf("Will compute sad cost\r\n");
	s8 disp_coeff = -1;
	compute_sad_cost(left, right, cost_matrix, &disp_coeff);

	// aggregate cost
	xil_printf("Will aggregate cost\r\n");
	compute_aggr(cost_matrix, p1, p2, aggr_matrix);

	// compute disparity map
	xil_printf("Will compute disparity map\r\n");
	compute_disp(aggr_matrix, disp);

cleanup:

	if (cost_matrix != NULL) {
		free(cost_matrix);
	}

	return 0;
}

int uninit_stereo()
{
	return 0;
}

int init_sad_cost(XSad_cost *instance)
{
	XSad_cost_Config *sad_cost_cfg;
	int status = 0;

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

int init_aggr(XAggr *instance)
{
	XAggr_Config *aggr_cfg;
	int status = 0;

	aggr_cfg = XAggr_LookupConfig(XPAR_XAGGR_0_DEVICE_ID);
	if (!aggr_cfg) {
		xil_printf("Aggr lookup failed\r\n");
		return XST_FAILURE;
	}

	status = XAggr_CfgInitialize(instance, aggr_cfg);
	if (status != XST_SUCCESS) {
		xil_printf("Aggr Cfg Initialize failed with status %d\r\n");
		return status;
	}

	return status;
}

int init_disp(XDisp *instance)
{
	XDisp_Config *disp_cfg;
	int status = 0;

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

void compute_sad_cost(u8 *left, u8* right, s32* cost, s8* disp_coeff)
{
	XSad_cost_Set_img_left(&g_sad_cost_hw, (u32)left);
	XSad_cost_Set_img_right(&g_sad_cost_hw, (u32)right);
	XSad_cost_Set_cost(&g_sad_cost_hw, (u32)cost);
	XSad_cost_Set_disp_coeff(&g_sad_cost_hw, (u32)*disp_coeff);

	start_sad_cost(&g_sad_cost_hw);

	while (!XSad_cost_IsDone(&g_sad_cost_hw));
}

void compute_aggr(s32* cost_in, s32 p1, s32 p2, s32* cost_out)
{
	XAggr_Set_cost_in(&g_aggr_hw, (u32)cost_in);
	XAggr_Set_p1(&g_aggr_hw, (u32)p1);
	XAggr_Set_p2(&g_aggr_hw, (u32)p2);
	XAggr_Set_summed_cost(&g_aggr_hw, (u32)cost_out);

	start_aggr(&g_aggr_hw);

	while (!XAggr_IsDone(&g_aggr_hw));
}

void compute_disp(s32* cost, u8* disp)
{
	XDisp_Set_cost_in(&g_disp_hw, (u32)cost);
	XDisp_Set_disp_out(&g_disp_hw, (u32)disp);

	start_disp(&g_disp_hw);

	while (!XDisp_IsDone(&g_disp_hw));
}

void start_sad_cost(void *instance)
{
	XSad_cost *sad_cost = (XSad_cost*) instance;

	XSad_cost_InterruptEnable(sad_cost, 1);
	XSad_cost_InterruptGlobalEnable(sad_cost);
	XSad_cost_Start(sad_cost);
}

void start_aggr(void *instance)
{
	XAggr *aggr = (XAggr*) instance;

	XAggr_InterruptEnable(aggr, 1);
	XAggr_InterruptGlobalEnable(aggr);
	XAggr_Start(aggr);
}

void start_disp(void *instance)
{
	XDisp *disp = (XDisp*) instance;

	XDisp_InterruptEnable(disp, 1);
	XDisp_InterruptGlobalEnable(disp);
	XDisp_Start(disp);
}
