############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project hw_aggr
set_top aggr
add_files hw_aggr/aggr.cpp
add_files hw_aggr/aggr.h
add_files hw_aggr/types.h
add_files -tb hw_aggr/aggr_tb.cpp -cflags "-Wno-unknown-pragmas"
open_solution "solution1"
set_part {xc7z020clg484-1} -tool vivado
create_clock -period 10 -name default
config_export -description {Cost aggregation using dp} -display_name {SGM Optimization} -format ip_catalog -library sgm -rtl vhdl -vendor Ciople -version 1.0
source "./hw_aggr/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -flow syn -rtl vhdl -format ip_catalog -description "Cost aggregation using dp" -vendor "Ciople" -library "sgm" -display_name "SGM Optimization"
