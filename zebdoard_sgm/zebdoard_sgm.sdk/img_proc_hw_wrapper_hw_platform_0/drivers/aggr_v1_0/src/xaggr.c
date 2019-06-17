// ==============================================================
// File generated on Sat Jun 15 22:47:31 +0300 2019
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xaggr.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XAggr_CfgInitialize(XAggr *InstancePtr, XAggr_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Data_bus_BaseAddress = ConfigPtr->Data_bus_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XAggr_Start(XAggr *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAggr_ReadReg(InstancePtr->Data_bus_BaseAddress, XAGGR_DATA_BUS_ADDR_AP_CTRL) & 0x80;
    XAggr_WriteReg(InstancePtr->Data_bus_BaseAddress, XAGGR_DATA_BUS_ADDR_AP_CTRL, Data | 0x01);
}

u32 XAggr_IsDone(XAggr *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAggr_ReadReg(InstancePtr->Data_bus_BaseAddress, XAGGR_DATA_BUS_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XAggr_IsIdle(XAggr *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAggr_ReadReg(InstancePtr->Data_bus_BaseAddress, XAGGR_DATA_BUS_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XAggr_IsReady(XAggr *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAggr_ReadReg(InstancePtr->Data_bus_BaseAddress, XAGGR_DATA_BUS_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XAggr_EnableAutoRestart(XAggr *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAggr_WriteReg(InstancePtr->Data_bus_BaseAddress, XAGGR_DATA_BUS_ADDR_AP_CTRL, 0x80);
}

void XAggr_DisableAutoRestart(XAggr *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAggr_WriteReg(InstancePtr->Data_bus_BaseAddress, XAGGR_DATA_BUS_ADDR_AP_CTRL, 0);
}

void XAggr_Set_cost_in(XAggr *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAggr_WriteReg(InstancePtr->Data_bus_BaseAddress, XAGGR_DATA_BUS_ADDR_COST_IN_DATA, Data);
}

u32 XAggr_Get_cost_in(XAggr *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAggr_ReadReg(InstancePtr->Data_bus_BaseAddress, XAGGR_DATA_BUS_ADDR_COST_IN_DATA);
    return Data;
}

void XAggr_Set_p1(XAggr *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAggr_WriteReg(InstancePtr->Data_bus_BaseAddress, XAGGR_DATA_BUS_ADDR_P1_DATA, Data);
}

u32 XAggr_Get_p1(XAggr *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAggr_ReadReg(InstancePtr->Data_bus_BaseAddress, XAGGR_DATA_BUS_ADDR_P1_DATA);
    return Data;
}

void XAggr_Set_p2(XAggr *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAggr_WriteReg(InstancePtr->Data_bus_BaseAddress, XAGGR_DATA_BUS_ADDR_P2_DATA, Data);
}

u32 XAggr_Get_p2(XAggr *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAggr_ReadReg(InstancePtr->Data_bus_BaseAddress, XAGGR_DATA_BUS_ADDR_P2_DATA);
    return Data;
}

void XAggr_Set_summed_cost(XAggr *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAggr_WriteReg(InstancePtr->Data_bus_BaseAddress, XAGGR_DATA_BUS_ADDR_SUMMED_COST_DATA, Data);
}

u32 XAggr_Get_summed_cost(XAggr *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAggr_ReadReg(InstancePtr->Data_bus_BaseAddress, XAGGR_DATA_BUS_ADDR_SUMMED_COST_DATA);
    return Data;
}

void XAggr_InterruptGlobalEnable(XAggr *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAggr_WriteReg(InstancePtr->Data_bus_BaseAddress, XAGGR_DATA_BUS_ADDR_GIE, 1);
}

void XAggr_InterruptGlobalDisable(XAggr *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAggr_WriteReg(InstancePtr->Data_bus_BaseAddress, XAGGR_DATA_BUS_ADDR_GIE, 0);
}

void XAggr_InterruptEnable(XAggr *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XAggr_ReadReg(InstancePtr->Data_bus_BaseAddress, XAGGR_DATA_BUS_ADDR_IER);
    XAggr_WriteReg(InstancePtr->Data_bus_BaseAddress, XAGGR_DATA_BUS_ADDR_IER, Register | Mask);
}

void XAggr_InterruptDisable(XAggr *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XAggr_ReadReg(InstancePtr->Data_bus_BaseAddress, XAGGR_DATA_BUS_ADDR_IER);
    XAggr_WriteReg(InstancePtr->Data_bus_BaseAddress, XAGGR_DATA_BUS_ADDR_IER, Register & (~Mask));
}

void XAggr_InterruptClear(XAggr *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAggr_WriteReg(InstancePtr->Data_bus_BaseAddress, XAGGR_DATA_BUS_ADDR_ISR, Mask);
}

u32 XAggr_InterruptGetEnabled(XAggr *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XAggr_ReadReg(InstancePtr->Data_bus_BaseAddress, XAGGR_DATA_BUS_ADDR_IER);
}

u32 XAggr_InterruptGetStatus(XAggr *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XAggr_ReadReg(InstancePtr->Data_bus_BaseAddress, XAGGR_DATA_BUS_ADDR_ISR);
}

