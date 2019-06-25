# ==============================================================
# File generated on Sat Jun 22 17:26:55 +0300 2019
# Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
# SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
# IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
# ==============================================================
add_files -tb ../disp_tb.cpp -cflags { -Wno-unknown-pragmas}
add_files hw_disp/disp.h
add_files hw_disp/disp.cpp
set_part xc7z020clg484-1
create_clock -name default -period 10
config_export -description {Disparity calculator from a cost matrix}
config_export -display_name {Disparity Calculator}
config_export -format=ip_catalog
config_export -library=sgm
config_export -rtl=vhdl
config_export -vendor=Ciople
config_export -version=2.0
