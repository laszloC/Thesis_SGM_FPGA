# ==============================================================
# File generated on Wed Jun 12 11:52:14 +0300 2019
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
config_export -version=1.1
set_directive_interface disp 
set_directive_interface disp 
set_directive_pipeline disp/p_loop 
set_directive_interface disp 
set_directive_dependence disp 
set_directive_dependence disp 
