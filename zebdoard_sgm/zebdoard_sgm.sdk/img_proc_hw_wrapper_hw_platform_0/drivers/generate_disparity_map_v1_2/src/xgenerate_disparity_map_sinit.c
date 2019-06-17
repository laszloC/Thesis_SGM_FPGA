// ==============================================================
// File generated on Mon Jun 10 21:24:41 +0300 2019
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xgenerate_disparity_map.h"

extern XGenerate_disparity_map_Config XGenerate_disparity_map_ConfigTable[];

XGenerate_disparity_map_Config *XGenerate_disparity_map_LookupConfig(u16 DeviceId) {
	XGenerate_disparity_map_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XGENERATE_DISPARITY_MAP_NUM_INSTANCES; Index++) {
		if (XGenerate_disparity_map_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XGenerate_disparity_map_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XGenerate_disparity_map_Initialize(XGenerate_disparity_map *InstancePtr, u16 DeviceId) {
	XGenerate_disparity_map_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XGenerate_disparity_map_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XGenerate_disparity_map_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

