// ==============================================================
// File generated on Wed Jun 12 11:52:13 +0300 2019
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xdisp.h"

extern XDisp_Config XDisp_ConfigTable[];

XDisp_Config *XDisp_LookupConfig(u16 DeviceId) {
	XDisp_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XDISP_NUM_INSTANCES; Index++) {
		if (XDisp_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XDisp_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XDisp_Initialize(XDisp *InstancePtr, u16 DeviceId) {
	XDisp_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XDisp_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XDisp_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

