// ==============================================================
// File generated on Wed Jun 12 11:52:13 +0300 2019
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xdisp.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XDisp_CfgInitialize(XDisp *InstancePtr, XDisp_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Data_bus_BaseAddress = ConfigPtr->Data_bus_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XDisp_Start(XDisp *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDisp_ReadReg(InstancePtr->Data_bus_BaseAddress, XDISP_DATA_BUS_ADDR_AP_CTRL) & 0x80;
    XDisp_WriteReg(InstancePtr->Data_bus_BaseAddress, XDISP_DATA_BUS_ADDR_AP_CTRL, Data | 0x01);
}

u32 XDisp_IsDone(XDisp *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDisp_ReadReg(InstancePtr->Data_bus_BaseAddress, XDISP_DATA_BUS_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XDisp_IsIdle(XDisp *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDisp_ReadReg(InstancePtr->Data_bus_BaseAddress, XDISP_DATA_BUS_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XDisp_IsReady(XDisp *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDisp_ReadReg(InstancePtr->Data_bus_BaseAddress, XDISP_DATA_BUS_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XDisp_EnableAutoRestart(XDisp *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDisp_WriteReg(InstancePtr->Data_bus_BaseAddress, XDISP_DATA_BUS_ADDR_AP_CTRL, 0x80);
}

void XDisp_DisableAutoRestart(XDisp *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDisp_WriteReg(InstancePtr->Data_bus_BaseAddress, XDISP_DATA_BUS_ADDR_AP_CTRL, 0);
}

void XDisp_Set_cost_in(XDisp *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDisp_WriteReg(InstancePtr->Data_bus_BaseAddress, XDISP_DATA_BUS_ADDR_COST_IN_DATA, Data);
}

u32 XDisp_Get_cost_in(XDisp *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDisp_ReadReg(InstancePtr->Data_bus_BaseAddress, XDISP_DATA_BUS_ADDR_COST_IN_DATA);
    return Data;
}

void XDisp_Set_disp_out(XDisp *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDisp_WriteReg(InstancePtr->Data_bus_BaseAddress, XDISP_DATA_BUS_ADDR_DISP_OUT_DATA, Data);
}

u32 XDisp_Get_disp_out(XDisp *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDisp_ReadReg(InstancePtr->Data_bus_BaseAddress, XDISP_DATA_BUS_ADDR_DISP_OUT_DATA);
    return Data;
}

void XDisp_InterruptGlobalEnable(XDisp *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDisp_WriteReg(InstancePtr->Data_bus_BaseAddress, XDISP_DATA_BUS_ADDR_GIE, 1);
}

void XDisp_InterruptGlobalDisable(XDisp *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDisp_WriteReg(InstancePtr->Data_bus_BaseAddress, XDISP_DATA_BUS_ADDR_GIE, 0);
}

void XDisp_InterruptEnable(XDisp *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XDisp_ReadReg(InstancePtr->Data_bus_BaseAddress, XDISP_DATA_BUS_ADDR_IER);
    XDisp_WriteReg(InstancePtr->Data_bus_BaseAddress, XDISP_DATA_BUS_ADDR_IER, Register | Mask);
}

void XDisp_InterruptDisable(XDisp *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XDisp_ReadReg(InstancePtr->Data_bus_BaseAddress, XDISP_DATA_BUS_ADDR_IER);
    XDisp_WriteReg(InstancePtr->Data_bus_BaseAddress, XDISP_DATA_BUS_ADDR_IER, Register & (~Mask));
}

void XDisp_InterruptClear(XDisp *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDisp_WriteReg(InstancePtr->Data_bus_BaseAddress, XDISP_DATA_BUS_ADDR_ISR, Mask);
}

u32 XDisp_InterruptGetEnabled(XDisp *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDisp_ReadReg(InstancePtr->Data_bus_BaseAddress, XDISP_DATA_BUS_ADDR_IER);
}

u32 XDisp_InterruptGetStatus(XDisp *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDisp_ReadReg(InstancePtr->Data_bus_BaseAddress, XDISP_DATA_BUS_ADDR_ISR);
}

