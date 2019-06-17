// ==============================================================
// File generated on Mon Jun 10 19:32:04 +0300 2019
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xgenerate_disparity_map.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XGenerate_disparity_map_CfgInitialize(XGenerate_disparity_map *InstancePtr, XGenerate_disparity_map_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Comp_d_map_BaseAddress = ConfigPtr->Comp_d_map_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XGenerate_disparity_map_Start(XGenerate_disparity_map *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGenerate_disparity_map_ReadReg(InstancePtr->Comp_d_map_BaseAddress, XGENERATE_DISPARITY_MAP_COMP_D_MAP_ADDR_AP_CTRL) & 0x80;
    XGenerate_disparity_map_WriteReg(InstancePtr->Comp_d_map_BaseAddress, XGENERATE_DISPARITY_MAP_COMP_D_MAP_ADDR_AP_CTRL, Data | 0x01);
}

u32 XGenerate_disparity_map_IsDone(XGenerate_disparity_map *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGenerate_disparity_map_ReadReg(InstancePtr->Comp_d_map_BaseAddress, XGENERATE_DISPARITY_MAP_COMP_D_MAP_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XGenerate_disparity_map_IsIdle(XGenerate_disparity_map *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGenerate_disparity_map_ReadReg(InstancePtr->Comp_d_map_BaseAddress, XGENERATE_DISPARITY_MAP_COMP_D_MAP_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XGenerate_disparity_map_IsReady(XGenerate_disparity_map *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGenerate_disparity_map_ReadReg(InstancePtr->Comp_d_map_BaseAddress, XGENERATE_DISPARITY_MAP_COMP_D_MAP_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XGenerate_disparity_map_EnableAutoRestart(XGenerate_disparity_map *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGenerate_disparity_map_WriteReg(InstancePtr->Comp_d_map_BaseAddress, XGENERATE_DISPARITY_MAP_COMP_D_MAP_ADDR_AP_CTRL, 0x80);
}

void XGenerate_disparity_map_DisableAutoRestart(XGenerate_disparity_map *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGenerate_disparity_map_WriteReg(InstancePtr->Comp_d_map_BaseAddress, XGENERATE_DISPARITY_MAP_COMP_D_MAP_ADDR_AP_CTRL, 0);
}

void XGenerate_disparity_map_Set_img_left_r(XGenerate_disparity_map *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGenerate_disparity_map_WriteReg(InstancePtr->Comp_d_map_BaseAddress, XGENERATE_DISPARITY_MAP_COMP_D_MAP_ADDR_IMG_LEFT_R_DATA, Data);
}

u32 XGenerate_disparity_map_Get_img_left_r(XGenerate_disparity_map *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGenerate_disparity_map_ReadReg(InstancePtr->Comp_d_map_BaseAddress, XGENERATE_DISPARITY_MAP_COMP_D_MAP_ADDR_IMG_LEFT_R_DATA);
    return Data;
}

void XGenerate_disparity_map_Set_img_right_r(XGenerate_disparity_map *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGenerate_disparity_map_WriteReg(InstancePtr->Comp_d_map_BaseAddress, XGENERATE_DISPARITY_MAP_COMP_D_MAP_ADDR_IMG_RIGHT_R_DATA, Data);
}

u32 XGenerate_disparity_map_Get_img_right_r(XGenerate_disparity_map *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGenerate_disparity_map_ReadReg(InstancePtr->Comp_d_map_BaseAddress, XGENERATE_DISPARITY_MAP_COMP_D_MAP_ADDR_IMG_RIGHT_R_DATA);
    return Data;
}

void XGenerate_disparity_map_Set_disp_out_r(XGenerate_disparity_map *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGenerate_disparity_map_WriteReg(InstancePtr->Comp_d_map_BaseAddress, XGENERATE_DISPARITY_MAP_COMP_D_MAP_ADDR_DISP_OUT_R_DATA, Data);
}

u32 XGenerate_disparity_map_Get_disp_out_r(XGenerate_disparity_map *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGenerate_disparity_map_ReadReg(InstancePtr->Comp_d_map_BaseAddress, XGENERATE_DISPARITY_MAP_COMP_D_MAP_ADDR_DISP_OUT_R_DATA);
    return Data;
}

void XGenerate_disparity_map_Set_img_cost(XGenerate_disparity_map *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGenerate_disparity_map_WriteReg(InstancePtr->Comp_d_map_BaseAddress, XGENERATE_DISPARITY_MAP_COMP_D_MAP_ADDR_IMG_COST_DATA, Data);
}

u32 XGenerate_disparity_map_Get_img_cost(XGenerate_disparity_map *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGenerate_disparity_map_ReadReg(InstancePtr->Comp_d_map_BaseAddress, XGENERATE_DISPARITY_MAP_COMP_D_MAP_ADDR_IMG_COST_DATA);
    return Data;
}

void XGenerate_disparity_map_InterruptGlobalEnable(XGenerate_disparity_map *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGenerate_disparity_map_WriteReg(InstancePtr->Comp_d_map_BaseAddress, XGENERATE_DISPARITY_MAP_COMP_D_MAP_ADDR_GIE, 1);
}

void XGenerate_disparity_map_InterruptGlobalDisable(XGenerate_disparity_map *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGenerate_disparity_map_WriteReg(InstancePtr->Comp_d_map_BaseAddress, XGENERATE_DISPARITY_MAP_COMP_D_MAP_ADDR_GIE, 0);
}

void XGenerate_disparity_map_InterruptEnable(XGenerate_disparity_map *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XGenerate_disparity_map_ReadReg(InstancePtr->Comp_d_map_BaseAddress, XGENERATE_DISPARITY_MAP_COMP_D_MAP_ADDR_IER);
    XGenerate_disparity_map_WriteReg(InstancePtr->Comp_d_map_BaseAddress, XGENERATE_DISPARITY_MAP_COMP_D_MAP_ADDR_IER, Register | Mask);
}

void XGenerate_disparity_map_InterruptDisable(XGenerate_disparity_map *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XGenerate_disparity_map_ReadReg(InstancePtr->Comp_d_map_BaseAddress, XGENERATE_DISPARITY_MAP_COMP_D_MAP_ADDR_IER);
    XGenerate_disparity_map_WriteReg(InstancePtr->Comp_d_map_BaseAddress, XGENERATE_DISPARITY_MAP_COMP_D_MAP_ADDR_IER, Register & (~Mask));
}

void XGenerate_disparity_map_InterruptClear(XGenerate_disparity_map *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGenerate_disparity_map_WriteReg(InstancePtr->Comp_d_map_BaseAddress, XGENERATE_DISPARITY_MAP_COMP_D_MAP_ADDR_ISR, Mask);
}

u32 XGenerate_disparity_map_InterruptGetEnabled(XGenerate_disparity_map *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XGenerate_disparity_map_ReadReg(InstancePtr->Comp_d_map_BaseAddress, XGENERATE_DISPARITY_MAP_COMP_D_MAP_ADDR_IER);
}

u32 XGenerate_disparity_map_InterruptGetStatus(XGenerate_disparity_map *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XGenerate_disparity_map_ReadReg(InstancePtr->Comp_d_map_BaseAddress, XGENERATE_DISPARITY_MAP_COMP_D_MAP_ADDR_ISR);
}

