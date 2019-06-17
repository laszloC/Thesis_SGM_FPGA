// ==============================================================
// File generated on Wed Jun 12 11:34:12 +0300 2019
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xsad_cost.h"

extern XSad_cost_Config XSad_cost_ConfigTable[];

XSad_cost_Config *XSad_cost_LookupConfig(u16 DeviceId) {
	XSad_cost_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XSAD_COST_NUM_INSTANCES; Index++) {
		if (XSad_cost_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XSad_cost_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XSad_cost_Initialize(XSad_cost *InstancePtr, u16 DeviceId) {
	XSad_cost_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XSad_cost_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XSad_cost_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

