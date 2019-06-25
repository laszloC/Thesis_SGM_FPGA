// ==============================================================
// File generated on Wed Jun 19 18:37:30 +0300 2019
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XAGGR_H
#define XAGGR_H

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
#include "xaggr_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 Data_bus_BaseAddress;
} XAggr_Config;
#endif

typedef struct {
    u32 Data_bus_BaseAddress;
    u32 IsReady;
} XAggr;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XAggr_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XAggr_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XAggr_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XAggr_ReadReg(BaseAddress, RegOffset) \
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
int XAggr_Initialize(XAggr *InstancePtr, u16 DeviceId);
XAggr_Config* XAggr_LookupConfig(u16 DeviceId);
int XAggr_CfgInitialize(XAggr *InstancePtr, XAggr_Config *ConfigPtr);
#else
int XAggr_Initialize(XAggr *InstancePtr, const char* InstanceName);
int XAggr_Release(XAggr *InstancePtr);
#endif

void XAggr_Start(XAggr *InstancePtr);
u32 XAggr_IsDone(XAggr *InstancePtr);
u32 XAggr_IsIdle(XAggr *InstancePtr);
u32 XAggr_IsReady(XAggr *InstancePtr);
void XAggr_EnableAutoRestart(XAggr *InstancePtr);
void XAggr_DisableAutoRestart(XAggr *InstancePtr);

void XAggr_Set_cost_in(XAggr *InstancePtr, u32 Data);
u32 XAggr_Get_cost_in(XAggr *InstancePtr);
void XAggr_Set_p1(XAggr *InstancePtr, u32 Data);
u32 XAggr_Get_p1(XAggr *InstancePtr);
void XAggr_Set_p2(XAggr *InstancePtr, u32 Data);
u32 XAggr_Get_p2(XAggr *InstancePtr);
void XAggr_Set_summed_cost(XAggr *InstancePtr, u32 Data);
u32 XAggr_Get_summed_cost(XAggr *InstancePtr);

void XAggr_InterruptGlobalEnable(XAggr *InstancePtr);
void XAggr_InterruptGlobalDisable(XAggr *InstancePtr);
void XAggr_InterruptEnable(XAggr *InstancePtr, u32 Mask);
void XAggr_InterruptDisable(XAggr *InstancePtr, u32 Mask);
void XAggr_InterruptClear(XAggr *InstancePtr, u32 Mask);
u32 XAggr_InterruptGetEnabled(XAggr *InstancePtr);
u32 XAggr_InterruptGetStatus(XAggr *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
