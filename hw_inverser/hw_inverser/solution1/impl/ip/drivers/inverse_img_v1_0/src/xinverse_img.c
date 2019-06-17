// ==============================================================
// File generated on Fri May 31 13:35:32 +0300 2019
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xinverse_img.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XInverse_img_CfgInitialize(XInverse_img *InstancePtr, XInverse_img_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->D_bus_BaseAddress = ConfigPtr->D_bus_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XInverse_img_Start(XInverse_img *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XInverse_img_ReadReg(InstancePtr->D_bus_BaseAddress, XINVERSE_IMG_D_BUS_ADDR_AP_CTRL) & 0x80;
    XInverse_img_WriteReg(InstancePtr->D_bus_BaseAddress, XINVERSE_IMG_D_BUS_ADDR_AP_CTRL, Data | 0x01);
}

u32 XInverse_img_IsDone(XInverse_img *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XInverse_img_ReadReg(InstancePtr->D_bus_BaseAddress, XINVERSE_IMG_D_BUS_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XInverse_img_IsIdle(XInverse_img *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XInverse_img_ReadReg(InstancePtr->D_bus_BaseAddress, XINVERSE_IMG_D_BUS_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XInverse_img_IsReady(XInverse_img *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XInverse_img_ReadReg(InstancePtr->D_bus_BaseAddress, XINVERSE_IMG_D_BUS_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XInverse_img_EnableAutoRestart(XInverse_img *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XInverse_img_WriteReg(InstancePtr->D_bus_BaseAddress, XINVERSE_IMG_D_BUS_ADDR_AP_CTRL, 0x80);
}

void XInverse_img_DisableAutoRestart(XInverse_img *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XInverse_img_WriteReg(InstancePtr->D_bus_BaseAddress, XINVERSE_IMG_D_BUS_ADDR_AP_CTRL, 0);
}

void XInverse_img_Set_img_in(XInverse_img *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XInverse_img_WriteReg(InstancePtr->D_bus_BaseAddress, XINVERSE_IMG_D_BUS_ADDR_IMG_IN_DATA, Data);
}

u32 XInverse_img_Get_img_in(XInverse_img *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XInverse_img_ReadReg(InstancePtr->D_bus_BaseAddress, XINVERSE_IMG_D_BUS_ADDR_IMG_IN_DATA);
    return Data;
}

void XInverse_img_Set_img_out(XInverse_img *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XInverse_img_WriteReg(InstancePtr->D_bus_BaseAddress, XINVERSE_IMG_D_BUS_ADDR_IMG_OUT_DATA, Data);
}

u32 XInverse_img_Get_img_out(XInverse_img *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XInverse_img_ReadReg(InstancePtr->D_bus_BaseAddress, XINVERSE_IMG_D_BUS_ADDR_IMG_OUT_DATA);
    return Data;
}

void XInverse_img_InterruptGlobalEnable(XInverse_img *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XInverse_img_WriteReg(InstancePtr->D_bus_BaseAddress, XINVERSE_IMG_D_BUS_ADDR_GIE, 1);
}

void XInverse_img_InterruptGlobalDisable(XInverse_img *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XInverse_img_WriteReg(InstancePtr->D_bus_BaseAddress, XINVERSE_IMG_D_BUS_ADDR_GIE, 0);
}

void XInverse_img_InterruptEnable(XInverse_img *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XInverse_img_ReadReg(InstancePtr->D_bus_BaseAddress, XINVERSE_IMG_D_BUS_ADDR_IER);
    XInverse_img_WriteReg(InstancePtr->D_bus_BaseAddress, XINVERSE_IMG_D_BUS_ADDR_IER, Register | Mask);
}

void XInverse_img_InterruptDisable(XInverse_img *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XInverse_img_ReadReg(InstancePtr->D_bus_BaseAddress, XINVERSE_IMG_D_BUS_ADDR_IER);
    XInverse_img_WriteReg(InstancePtr->D_bus_BaseAddress, XINVERSE_IMG_D_BUS_ADDR_IER, Register & (~Mask));
}

void XInverse_img_InterruptClear(XInverse_img *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XInverse_img_WriteReg(InstancePtr->D_bus_BaseAddress, XINVERSE_IMG_D_BUS_ADDR_ISR, Mask);
}

u32 XInverse_img_InterruptGetEnabled(XInverse_img *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XInverse_img_ReadReg(InstancePtr->D_bus_BaseAddress, XINVERSE_IMG_D_BUS_ADDR_IER);
}

u32 XInverse_img_InterruptGetStatus(XInverse_img *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XInverse_img_ReadReg(InstancePtr->D_bus_BaseAddress, XINVERSE_IMG_D_BUS_ADDR_ISR);
}

