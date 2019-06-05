// ==============================================================
// File generated on Wed Jun 05 20:42:09 +0300 2019
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XCOMP_D_MAP_H
#define XCOMP_D_MAP_H

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
#include "xcomp_d_map_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 Img_bus_BaseAddress;
} XComp_d_map_Config;
#endif

typedef struct {
    u32 Img_bus_BaseAddress;
    u32 IsReady;
} XComp_d_map;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XComp_d_map_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XComp_d_map_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XComp_d_map_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XComp_d_map_ReadReg(BaseAddress, RegOffset) \
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
int XComp_d_map_Initialize(XComp_d_map *InstancePtr, u16 DeviceId);
XComp_d_map_Config* XComp_d_map_LookupConfig(u16 DeviceId);
int XComp_d_map_CfgInitialize(XComp_d_map *InstancePtr, XComp_d_map_Config *ConfigPtr);
#else
int XComp_d_map_Initialize(XComp_d_map *InstancePtr, const char* InstanceName);
int XComp_d_map_Release(XComp_d_map *InstancePtr);
#endif

void XComp_d_map_Start(XComp_d_map *InstancePtr);
u32 XComp_d_map_IsDone(XComp_d_map *InstancePtr);
u32 XComp_d_map_IsIdle(XComp_d_map *InstancePtr);
u32 XComp_d_map_IsReady(XComp_d_map *InstancePtr);
void XComp_d_map_EnableAutoRestart(XComp_d_map *InstancePtr);
void XComp_d_map_DisableAutoRestart(XComp_d_map *InstancePtr);

void XComp_d_map_Set_img_left(XComp_d_map *InstancePtr, u32 Data);
u32 XComp_d_map_Get_img_left(XComp_d_map *InstancePtr);
void XComp_d_map_Set_img_right(XComp_d_map *InstancePtr, u32 Data);
u32 XComp_d_map_Get_img_right(XComp_d_map *InstancePtr);
void XComp_d_map_Set_disp_out(XComp_d_map *InstancePtr, u32 Data);
u32 XComp_d_map_Get_disp_out(XComp_d_map *InstancePtr);
void XComp_d_map_Set_img_cost(XComp_d_map *InstancePtr, u32 Data);
u32 XComp_d_map_Get_img_cost(XComp_d_map *InstancePtr);

void XComp_d_map_InterruptGlobalEnable(XComp_d_map *InstancePtr);
void XComp_d_map_InterruptGlobalDisable(XComp_d_map *InstancePtr);
void XComp_d_map_InterruptEnable(XComp_d_map *InstancePtr, u32 Mask);
void XComp_d_map_InterruptDisable(XComp_d_map *InstancePtr, u32 Mask);
void XComp_d_map_InterruptClear(XComp_d_map *InstancePtr, u32 Mask);
u32 XComp_d_map_InterruptGetEnabled(XComp_d_map *InstancePtr);
u32 XComp_d_map_InterruptGetStatus(XComp_d_map *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
