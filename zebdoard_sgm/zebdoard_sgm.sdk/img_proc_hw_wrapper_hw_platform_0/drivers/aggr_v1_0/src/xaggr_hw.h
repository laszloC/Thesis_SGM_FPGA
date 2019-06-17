// ==============================================================
// File generated on Sat Jun 15 22:47:31 +0300 2019
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// DATA_BUS
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read)
//        bit 7  - auto_restart (Read/Write)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0  - Channel 0 (ap_done)
//        bit 1  - Channel 1 (ap_ready)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0  - Channel 0 (ap_done)
//        bit 1  - Channel 1 (ap_ready)
//        others - reserved
// 0x10 : Data signal of cost_in
//        bit 31~0 - cost_in[31:0] (Read/Write)
// 0x14 : reserved
// 0x18 : Data signal of p1
//        bit 31~0 - p1[31:0] (Read/Write)
// 0x1c : reserved
// 0x20 : Data signal of p2
//        bit 31~0 - p2[31:0] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of summed_cost
//        bit 31~0 - summed_cost[31:0] (Read/Write)
// 0x2c : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XAGGR_DATA_BUS_ADDR_AP_CTRL          0x00
#define XAGGR_DATA_BUS_ADDR_GIE              0x04
#define XAGGR_DATA_BUS_ADDR_IER              0x08
#define XAGGR_DATA_BUS_ADDR_ISR              0x0c
#define XAGGR_DATA_BUS_ADDR_COST_IN_DATA     0x10
#define XAGGR_DATA_BUS_BITS_COST_IN_DATA     32
#define XAGGR_DATA_BUS_ADDR_P1_DATA          0x18
#define XAGGR_DATA_BUS_BITS_P1_DATA          32
#define XAGGR_DATA_BUS_ADDR_P2_DATA          0x20
#define XAGGR_DATA_BUS_BITS_P2_DATA          32
#define XAGGR_DATA_BUS_ADDR_SUMMED_COST_DATA 0x28
#define XAGGR_DATA_BUS_BITS_SUMMED_COST_DATA 32

