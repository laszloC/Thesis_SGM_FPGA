# ==============================================================
# File generated on Tue Jun 18 01:09:14 +0300 2019
# Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
# SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
# IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
# ==============================================================
add_files -tb ../aggr_tb.cpp -cflags { -Wno-unknown-pragmas}
add_files hw_aggr/types.h
add_files hw_aggr/aggr.h
add_files hw_aggr/aggr.cpp
set_part xc7z020clg484-1
create_clock -name default -period 10
config_export -description {Cost aggregation using dp}
config_export -display_name {SGM Optimization}
config_export -format=ip_catalog
config_export -library=sgm
config_export -rtl=vhdl
config_export -vendor=Ciople
config_export -version=1.0
set_directive_loop_flatten initialize_arrays/j_loop 
set_directive_loop_flatten initialize_arrays/j_loop 
set_directive_loop_flatten initialize_arrays/j_loop 
