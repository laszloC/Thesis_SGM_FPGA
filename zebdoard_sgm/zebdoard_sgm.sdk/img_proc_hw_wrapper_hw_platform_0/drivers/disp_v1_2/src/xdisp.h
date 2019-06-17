// ==============================================================
// File generated on Wed Jun 12 11:52:13 +0300 2019
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XDISP_H
#define XDISP_H

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
#include "xdisp_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 Data_bus_BaseAddress;
} XDisp_Config;
#endif

typedef struct {
    u32 Data_bus_BaseAddress;
    u32 IsReady;
} XDisp;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XDisp_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XDisp_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XDisp_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XDisp_ReadReg(BaseAddress, RegOffset) \
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
int XDisp_Initialize(XDisp *InstancePtr, u16 DeviceId);
XDisp_Config* XDisp_LookupConfig(u16 DeviceId);
int XDisp_CfgInitialize(XDisp *InstancePtr, XDisp_Config *ConfigPtr);
#else
int XDisp_Initialize(XDisp *InstancePtr, const char* InstanceName);
int XDisp_Release(XDisp *InstancePtr);
#endif

void XDisp_Start(XDisp *InstancePtr);
u32 XDisp_IsDone(XDisp *InstancePtr);
u32 XDisp_IsIdle(XDisp *InstancePtr);
u32 XDisp_IsReady(XDisp *InstancePtr);
void XDisp_EnableAutoRestart(XDisp *InstancePtr);
void XDisp_DisableAutoRestart(XDisp *InstancePtr);

void XDisp_Set_cost_in(XDisp *InstancePtr, u32 Data);
u32 XDisp_Get_cost_in(XDisp *InstancePtr);
void XDisp_Set_disp_out(XDisp *InstancePtr, u32 Data);
u32 XDisp_Get_disp_out(XDisp *InstancePtr);

void XDisp_InterruptGlobalEnable(XDisp *InstancePtr);
void XDisp_InterruptGlobalDisable(XDisp *InstancePtr);
void XDisp_InterruptEnable(XDisp *InstancePtr, u32 Mask);
void XDisp_InterruptDisable(XDisp *InstancePtr, u32 Mask);
void XDisp_InterruptClear(XDisp *InstancePtr, u32 Mask);
u32 XDisp_InterruptGetEnabled(XDisp *InstancePtr);
u32 XDisp_InterruptGetStatus(XDisp *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
