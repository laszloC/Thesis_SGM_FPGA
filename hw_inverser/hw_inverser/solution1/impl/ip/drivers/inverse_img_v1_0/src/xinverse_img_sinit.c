// ==============================================================
// File generated on Fri May 31 13:35:32 +0300 2019
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xinverse_img.h"

extern XInverse_img_Config XInverse_img_ConfigTable[];

XInverse_img_Config *XInverse_img_LookupConfig(u16 DeviceId) {
	XInverse_img_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XINVERSE_IMG_NUM_INSTANCES; Index++) {
		if (XInverse_img_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XInverse_img_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XInverse_img_Initialize(XInverse_img *InstancePtr, u16 DeviceId) {
	XInverse_img_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XInverse_img_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XInverse_img_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

