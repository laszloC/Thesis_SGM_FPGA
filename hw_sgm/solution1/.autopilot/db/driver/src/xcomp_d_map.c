// ==============================================================
// File generated on Wed Jun 05 20:42:09 +0300 2019
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xcomp_d_map.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XComp_d_map_CfgInitialize(XComp_d_map *InstancePtr, XComp_d_map_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Img_bus_BaseAddress = ConfigPtr->Img_bus_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XComp_d_map_Start(XComp_d_map *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XComp_d_map_ReadReg(InstancePtr->Img_bus_BaseAddress, XCOMP_D_MAP_IMG_BUS_ADDR_AP_CTRL) & 0x80;
    XComp_d_map_WriteReg(InstancePtr->Img_bus_BaseAddress, XCOMP_D_MAP_IMG_BUS_ADDR_AP_CTRL, Data | 0x01);
}

u32 XComp_d_map_IsDone(XComp_d_map *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XComp_d_map_ReadReg(InstancePtr->Img_bus_BaseAddress, XCOMP_D_MAP_IMG_BUS_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XComp_d_map_IsIdle(XComp_d_map *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XComp_d_map_ReadReg(InstancePtr->Img_bus_BaseAddress, XCOMP_D_MAP_IMG_BUS_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XComp_d_map_IsReady(XComp_d_map *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XComp_d_map_ReadReg(InstancePtr->Img_bus_BaseAddress, XCOMP_D_MAP_IMG_BUS_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XComp_d_map_EnableAutoRestart(XComp_d_map *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XComp_d_map_WriteReg(InstancePtr->Img_bus_BaseAddress, XCOMP_D_MAP_IMG_BUS_ADDR_AP_CTRL, 0x80);
}

void XComp_d_map_DisableAutoRestart(XComp_d_map *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XComp_d_map_WriteReg(InstancePtr->Img_bus_BaseAddress, XCOMP_D_MAP_IMG_BUS_ADDR_AP_CTRL, 0);
}

void XComp_d_map_Set_img_left(XComp_d_map *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XComp_d_map_WriteReg(InstancePtr->Img_bus_BaseAddress, XCOMP_D_MAP_IMG_BUS_ADDR_IMG_LEFT_DATA, Data);
}

u32 XComp_d_map_Get_img_left(XComp_d_map *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XComp_d_map_ReadReg(InstancePtr->Img_bus_BaseAddress, XCOMP_D_MAP_IMG_BUS_ADDR_IMG_LEFT_DATA);
    return Data;
}

void XComp_d_map_Set_img_right(XComp_d_map *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XComp_d_map_WriteReg(InstancePtr->Img_bus_BaseAddress, XCOMP_D_MAP_IMG_BUS_ADDR_IMG_RIGHT_DATA, Data);
}

u32 XComp_d_map_Get_img_right(XComp_d_map *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XComp_d_map_ReadReg(InstancePtr->Img_bus_BaseAddress, XCOMP_D_MAP_IMG_BUS_ADDR_IMG_RIGHT_DATA);
    return Data;
}

void XComp_d_map_Set_disp_out(XComp_d_map *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XComp_d_map_WriteReg(InstancePtr->Img_bus_BaseAddress, XCOMP_D_MAP_IMG_BUS_ADDR_DISP_OUT_DATA, Data);
}

u32 XComp_d_map_Get_disp_out(XComp_d_map *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XComp_d_map_ReadReg(InstancePtr->Img_bus_BaseAddress, XCOMP_D_MAP_IMG_BUS_ADDR_DISP_OUT_DATA);
    return Data;
}

void XComp_d_map_Set_img_cost(XComp_d_map *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XComp_d_map_WriteReg(InstancePtr->Img_bus_BaseAddress, XCOMP_D_MAP_IMG_BUS_ADDR_IMG_COST_DATA, Data);
}

u32 XComp_d_map_Get_img_cost(XComp_d_map *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XComp_d_map_ReadReg(InstancePtr->Img_bus_BaseAddress, XCOMP_D_MAP_IMG_BUS_ADDR_IMG_COST_DATA);
    return Data;
}

void XComp_d_map_InterruptGlobalEnable(XComp_d_map *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XComp_d_map_WriteReg(InstancePtr->Img_bus_BaseAddress, XCOMP_D_MAP_IMG_BUS_ADDR_GIE, 1);
}

void XComp_d_map_InterruptGlobalDisable(XComp_d_map *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XComp_d_map_WriteReg(InstancePtr->Img_bus_BaseAddress, XCOMP_D_MAP_IMG_BUS_ADDR_GIE, 0);
}

void XComp_d_map_InterruptEnable(XComp_d_map *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XComp_d_map_ReadReg(InstancePtr->Img_bus_BaseAddress, XCOMP_D_MAP_IMG_BUS_ADDR_IER);
    XComp_d_map_WriteReg(InstancePtr->Img_bus_BaseAddress, XCOMP_D_MAP_IMG_BUS_ADDR_IER, Register | Mask);
}

void XComp_d_map_InterruptDisable(XComp_d_map *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XComp_d_map_ReadReg(InstancePtr->Img_bus_BaseAddress, XCOMP_D_MAP_IMG_BUS_ADDR_IER);
    XComp_d_map_WriteReg(InstancePtr->Img_bus_BaseAddress, XCOMP_D_MAP_IMG_BUS_ADDR_IER, Register & (~Mask));
}

void XComp_d_map_InterruptClear(XComp_d_map *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XComp_d_map_WriteReg(InstancePtr->Img_bus_BaseAddress, XCOMP_D_MAP_IMG_BUS_ADDR_ISR, Mask);
}

u32 XComp_d_map_InterruptGetEnabled(XComp_d_map *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XComp_d_map_ReadReg(InstancePtr->Img_bus_BaseAddress, XCOMP_D_MAP_IMG_BUS_ADDR_IER);
}

u32 XComp_d_map_InterruptGetStatus(XComp_d_map *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XComp_d_map_ReadReg(InstancePtr->Img_bus_BaseAddress, XCOMP_D_MAP_IMG_BUS_ADDR_ISR);
}

