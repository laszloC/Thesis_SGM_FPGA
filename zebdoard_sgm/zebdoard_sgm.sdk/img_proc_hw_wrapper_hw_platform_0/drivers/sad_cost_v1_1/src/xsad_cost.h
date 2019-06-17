// ==============================================================
// File generated on Wed Jun 12 11:34:12 +0300 2019
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XSAD_COST_H
#define XSAD_COST_H

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
#include "xsad_cost_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 Data_bus_BaseAddress;
} XSad_cost_Config;
#endif

typedef struct {
    u32 Data_bus_BaseAddress;
    u32 IsReady;
} XSad_cost;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XSad_cost_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XSad_cost_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XSad_cost_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XSad_cost_ReadReg(BaseAddress, RegOffset) \
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
int XSad_cost_Initialize(XSad_cost *InstancePtr, u16 DeviceId);
XSad_cost_Config* XSad_cost_LookupConfig(u16 DeviceId);
int XSad_cost_CfgInitialize(XSad_cost *InstancePtr, XSad_cost_Config *ConfigPtr);
#else
int XSad_cost_Initialize(XSad_cost *InstancePtr, const char* InstanceName);
int XSad_cost_Release(XSad_cost *InstancePtr);
#endif

void XSad_cost_Start(XSad_cost *InstancePtr);
u32 XSad_cost_IsDone(XSad_cost *InstancePtr);
u32 XSad_cost_IsIdle(XSad_cost *InstancePtr);
u32 XSad_cost_IsReady(XSad_cost *InstancePtr);
void XSad_cost_EnableAutoRestart(XSad_cost *InstancePtr);
void XSad_cost_DisableAutoRestart(XSad_cost *InstancePtr);

void XSad_cost_Set_img_left(XSad_cost *InstancePtr, u32 Data);
u32 XSad_cost_Get_img_left(XSad_cost *InstancePtr);
void XSad_cost_Set_img_right(XSad_cost *InstancePtr, u32 Data);
u32 XSad_cost_Get_img_right(XSad_cost *InstancePtr);
void XSad_cost_Set_cost(XSad_cost *InstancePtr, u32 Data);
u32 XSad_cost_Get_cost(XSad_cost *InstancePtr);
void XSad_cost_Set_disp_coeff(XSad_cost *InstancePtr, u32 Data);
u32 XSad_cost_Get_disp_coeff(XSad_cost *InstancePtr);

void XSad_cost_InterruptGlobalEnable(XSad_cost *InstancePtr);
void XSad_cost_InterruptGlobalDisable(XSad_cost *InstancePtr);
void XSad_cost_InterruptEnable(XSad_cost *InstancePtr, u32 Mask);
void XSad_cost_InterruptDisable(XSad_cost *InstancePtr, u32 Mask);
void XSad_cost_InterruptClear(XSad_cost *InstancePtr, u32 Mask);
u32 XSad_cost_InterruptGetEnabled(XSad_cost *InstancePtr);
u32 XSad_cost_InterruptGetStatus(XSad_cost *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
