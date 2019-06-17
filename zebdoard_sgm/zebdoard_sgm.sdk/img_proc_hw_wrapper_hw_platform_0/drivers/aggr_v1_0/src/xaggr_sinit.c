// ==============================================================
// File generated on Sat Jun 15 22:47:31 +0300 2019
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xaggr.h"

extern XAggr_Config XAggr_ConfigTable[];

XAggr_Config *XAggr_LookupConfig(u16 DeviceId) {
	XAggr_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XAGGR_NUM_INSTANCES; Index++) {
		if (XAggr_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XAggr_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XAggr_Initialize(XAggr *InstancePtr, u16 DeviceId) {
	XAggr_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XAggr_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XAggr_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

