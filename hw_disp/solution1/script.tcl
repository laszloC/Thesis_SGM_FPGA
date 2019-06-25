############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project hw_disp
set_top disp
add_files hw_disp/disp.cpp
add_files hw_disp/disp.h
add_files -tb hw_disp/disp_tb.cpp -cflags "-Wno-unknown-pragmas"
open_solution "solution1"
set_part {xc7z020clg484-1} -tool vivado
create_clock -period 10 -name default
config_export -description {Disparity calculator from a cost matrix} -display_name {Disparity Calculator} -format ip_catalog -library sgm -rtl vhdl -vendor Ciople -version 2.1
#source "./hw_disp/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -flow syn -rtl vhdl -format ip_catalog -description "Disparity calculator from a cost matrix" -vendor "Ciople" -library "sgm" -version "2.1" -display_name "Disparity Calculator"
