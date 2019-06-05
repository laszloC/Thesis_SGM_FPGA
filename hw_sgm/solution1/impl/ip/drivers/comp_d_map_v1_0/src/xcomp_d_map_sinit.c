// ==============================================================
// File generated on Wed Jun 05 20:42:09 +0300 2019
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xcomp_d_map.h"

extern XComp_d_map_Config XComp_d_map_ConfigTable[];

XComp_d_map_Config *XComp_d_map_LookupConfig(u16 DeviceId) {
	XComp_d_map_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XCOMP_D_MAP_NUM_INSTANCES; Index++) {
		if (XComp_d_map_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XComp_d_map_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XComp_d_map_Initialize(XComp_d_map *InstancePtr, u16 DeviceId) {
	XComp_d_map_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XComp_d_map_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XComp_d_map_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

