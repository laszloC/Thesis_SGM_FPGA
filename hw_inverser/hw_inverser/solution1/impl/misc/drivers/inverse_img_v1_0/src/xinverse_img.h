// ==============================================================
// File generated on Fri May 31 13:35:32 +0300 2019
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XINVERSE_IMG_H
#define XINVERSE_IMG_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xinverse_img_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 D_bus_BaseAddress;
} XInverse_img_Config;
#endif

typedef struct {
    u32 D_bus_BaseAddress;
    u32 IsReady;
} XInverse_img;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XInverse_img_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XInverse_img_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XInverse_img_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XInverse_img_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XInverse_img_Initialize(XInverse_img *InstancePtr, u16 DeviceId);
XInverse_img_Config* XInverse_img_LookupConfig(u16 DeviceId);
int XInverse_img_CfgInitialize(XInverse_img *InstancePtr, XInverse_img_Config *ConfigPtr);
#else
int XInverse_img_Initialize(XInverse_img *InstancePtr, const char* InstanceName);
int XInverse_img_Release(XInverse_img *InstancePtr);
#endif

void XInverse_img_Start(XInverse_img *InstancePtr);
u32 XInverse_img_IsDone(XInverse_img *InstancePtr);
u32 XInverse_img_IsIdle(XInverse_img *InstancePtr);
u32 XInverse_img_IsReady(XInverse_img *InstancePtr);
void XInverse_img_EnableAutoRestart(XInverse_img *InstancePtr);
void XInverse_img_DisableAutoRestart(XInverse_img *InstancePtr);

void XInverse_img_Set_img_in(XInverse_img *InstancePtr, u32 Data);
u32 XInverse_img_Get_img_in(XInverse_img *InstancePtr);
void XInverse_img_Set_img_out(XInverse_img *InstancePtr, u32 Data);
u32 XInverse_img_Get_img_out(XInverse_img *InstancePtr);

void XInverse_img_InterruptGlobalEnable(XInverse_img *InstancePtr);
void XInverse_img_InterruptGlobalDisable(XInverse_img *InstancePtr);
void XInverse_img_InterruptEnable(XInverse_img *InstancePtr, u32 Mask);
void XInverse_img_InterruptDisable(XInverse_img *InstancePtr, u32 Mask);
void XInverse_img_InterruptClear(XInverse_img *InstancePtr, u32 Mask);
u32 XInverse_img_InterruptGetEnabled(XInverse_img *InstancePtr);
u32 XInverse_img_InterruptGetStatus(XInverse_img *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
