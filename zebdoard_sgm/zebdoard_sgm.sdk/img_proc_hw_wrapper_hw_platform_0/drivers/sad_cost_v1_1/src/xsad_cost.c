// ==============================================================
// File generated on Wed Jun 12 11:34:12 +0300 2019
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xsad_cost.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XSad_cost_CfgInitialize(XSad_cost *InstancePtr, XSad_cost_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Data_bus_BaseAddress = ConfigPtr->Data_bus_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XSad_cost_Start(XSad_cost *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSad_cost_ReadReg(InstancePtr->Data_bus_BaseAddress, XSAD_COST_DATA_BUS_ADDR_AP_CTRL) & 0x80;
    XSad_cost_WriteReg(InstancePtr->Data_bus_BaseAddress, XSAD_COST_DATA_BUS_ADDR_AP_CTRL, Data | 0x01);
}

u32 XSad_cost_IsDone(XSad_cost *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSad_cost_ReadReg(InstancePtr->Data_bus_BaseAddress, XSAD_COST_DATA_BUS_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XSad_cost_IsIdle(XSad_cost *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSad_cost_ReadReg(InstancePtr->Data_bus_BaseAddress, XSAD_COST_DATA_BUS_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XSad_cost_IsReady(XSad_cost *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSad_cost_ReadReg(InstancePtr->Data_bus_BaseAddress, XSAD_COST_DATA_BUS_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XSad_cost_EnableAutoRestart(XSad_cost *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSad_cost_WriteReg(InstancePtr->Data_bus_BaseAddress, XSAD_COST_DATA_BUS_ADDR_AP_CTRL, 0x80);
}

void XSad_cost_DisableAutoRestart(XSad_cost *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSad_cost_WriteReg(InstancePtr->Data_bus_BaseAddress, XSAD_COST_DATA_BUS_ADDR_AP_CTRL, 0);
}

void XSad_cost_Set_img_left(XSad_cost *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSad_cost_WriteReg(InstancePtr->Data_bus_BaseAddress, XSAD_COST_DATA_BUS_ADDR_IMG_LEFT_DATA, Data);
}

u32 XSad_cost_Get_img_left(XSad_cost *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSad_cost_ReadReg(InstancePtr->Data_bus_BaseAddress, XSAD_COST_DATA_BUS_ADDR_IMG_LEFT_DATA);
    return Data;
}

void XSad_cost_Set_img_right(XSad_cost *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSad_cost_WriteReg(InstancePtr->Data_bus_BaseAddress, XSAD_COST_DATA_BUS_ADDR_IMG_RIGHT_DATA, Data);
}

u32 XSad_cost_Get_img_right(XSad_cost *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSad_cost_ReadReg(InstancePtr->Data_bus_BaseAddress, XSAD_COST_DATA_BUS_ADDR_IMG_RIGHT_DATA);
    return Data;
}

void XSad_cost_Set_cost(XSad_cost *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSad_cost_WriteReg(InstancePtr->Data_bus_BaseAddress, XSAD_COST_DATA_BUS_ADDR_COST_DATA, Data);
}

u32 XSad_cost_Get_cost(XSad_cost *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSad_cost_ReadReg(InstancePtr->Data_bus_BaseAddress, XSAD_COST_DATA_BUS_ADDR_COST_DATA);
    return Data;
}

void XSad_cost_Set_disp_coeff(XSad_cost *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSad_cost_WriteReg(InstancePtr->Data_bus_BaseAddress, XSAD_COST_DATA_BUS_ADDR_DISP_COEFF_DATA, Data);
}

u32 XSad_cost_Get_disp_coeff(XSad_cost *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSad_cost_ReadReg(InstancePtr->Data_bus_BaseAddress, XSAD_COST_DATA_BUS_ADDR_DISP_COEFF_DATA);
    return Data;
}

void XSad_cost_InterruptGlobalEnable(XSad_cost *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSad_cost_WriteReg(InstancePtr->Data_bus_BaseAddress, XSAD_COST_DATA_BUS_ADDR_GIE, 1);
}

void XSad_cost_InterruptGlobalDisable(XSad_cost *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSad_cost_WriteReg(InstancePtr->Data_bus_BaseAddress, XSAD_COST_DATA_BUS_ADDR_GIE, 0);
}

void XSad_cost_InterruptEnable(XSad_cost *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XSad_cost_ReadReg(InstancePtr->Data_bus_BaseAddress, XSAD_COST_DATA_BUS_ADDR_IER);
    XSad_cost_WriteReg(InstancePtr->Data_bus_BaseAddress, XSAD_COST_DATA_BUS_ADDR_IER, Register | Mask);
}

void XSad_cost_InterruptDisable(XSad_cost *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XSad_cost_ReadReg(InstancePtr->Data_bus_BaseAddress, XSAD_COST_DATA_BUS_ADDR_IER);
    XSad_cost_WriteReg(InstancePtr->Data_bus_BaseAddress, XSAD_COST_DATA_BUS_ADDR_IER, Register & (~Mask));
}

void XSad_cost_InterruptClear(XSad_cost *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSad_cost_WriteReg(InstancePtr->Data_bus_BaseAddress, XSAD_COST_DATA_BUS_ADDR_ISR, Mask);
}

u32 XSad_cost_InterruptGetEnabled(XSad_cost *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSad_cost_ReadReg(InstancePtr->Data_bus_BaseAddress, XSAD_COST_DATA_BUS_ADDR_IER);
}

u32 XSad_cost_InterruptGetStatus(XSad_cost *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSad_cost_ReadReg(InstancePtr->Data_bus_BaseAddress, XSAD_COST_DATA_BUS_ADDR_ISR);
}

