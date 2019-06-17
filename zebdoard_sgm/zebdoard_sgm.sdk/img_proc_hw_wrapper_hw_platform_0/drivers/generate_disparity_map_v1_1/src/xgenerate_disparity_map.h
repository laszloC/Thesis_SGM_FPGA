// ==============================================================
// File generated on Mon Jun 10 19:32:04 +0300 2019
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XGENERATE_DISPARITY_MAP_H
#define XGENERATE_DISPARITY_MAP_H

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
#include "xgenerate_disparity_map_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 Comp_d_map_BaseAddress;
} XGenerate_disparity_map_Config;
#endif

typedef struct {
    u32 Comp_d_map_BaseAddress;
    u32 IsReady;
} XGenerate_disparity_map;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XGenerate_disparity_map_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XGenerate_disparity_map_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XGenerate_disparity_map_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XGenerate_disparity_map_ReadReg(BaseAddress, RegOffset) \
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
int XGenerate_disparity_map_Initialize(XGenerate_disparity_map *InstancePtr, u16 DeviceId);
XGenerate_disparity_map_Config* XGenerate_disparity_map_LookupConfig(u16 DeviceId);
int XGenerate_disparity_map_CfgInitialize(XGenerate_disparity_map *InstancePtr, XGenerate_disparity_map_Config *ConfigPtr);
#else
int XGenerate_disparity_map_Initialize(XGenerate_disparity_map *InstancePtr, const char* InstanceName);
int XGenerate_disparity_map_Release(XGenerate_disparity_map *InstancePtr);
#endif

void XGenerate_disparity_map_Start(XGenerate_disparity_map *InstancePtr);
u32 XGenerate_disparity_map_IsDone(XGenerate_disparity_map *InstancePtr);
u32 XGenerate_disparity_map_IsIdle(XGenerate_disparity_map *InstancePtr);
u32 XGenerate_disparity_map_IsReady(XGenerate_disparity_map *InstancePtr);
void XGenerate_disparity_map_EnableAutoRestart(XGenerate_disparity_map *InstancePtr);
void XGenerate_disparity_map_DisableAutoRestart(XGenerate_disparity_map *InstancePtr);

void XGenerate_disparity_map_Set_img_left_r(XGenerate_disparity_map *InstancePtr, u32 Data);
u32 XGenerate_disparity_map_Get_img_left_r(XGenerate_disparity_map *InstancePtr);
void XGenerate_disparity_map_Set_img_right_r(XGenerate_disparity_map *InstancePtr, u32 Data);
u32 XGenerate_disparity_map_Get_img_right_r(XGenerate_disparity_map *InstancePtr);
void XGenerate_disparity_map_Set_disp_out_r(XGenerate_disparity_map *InstancePtr, u32 Data);
u32 XGenerate_disparity_map_Get_disp_out_r(XGenerate_disparity_map *InstancePtr);
void XGenerate_disparity_map_Set_img_cost(XGenerate_disparity_map *InstancePtr, u32 Data);
u32 XGenerate_disparity_map_Get_img_cost(XGenerate_disparity_map *InstancePtr);

void XGenerate_disparity_map_InterruptGlobalEnable(XGenerate_disparity_map *InstancePtr);
void XGenerate_disparity_map_InterruptGlobalDisable(XGenerate_disparity_map *InstancePtr);
void XGenerate_disparity_map_InterruptEnable(XGenerate_disparity_map *InstancePtr, u32 Mask);
void XGenerate_disparity_map_InterruptDisable(XGenerate_disparity_map *InstancePtr, u32 Mask);
void XGenerate_disparity_map_InterruptClear(XGenerate_disparity_map *InstancePtr, u32 Mask);
u32 XGenerate_disparity_map_InterruptGetEnabled(XGenerate_disparity_map *InstancePtr);
u32 XGenerate_disparity_map_InterruptGetStatus(XGenerate_disparity_map *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
