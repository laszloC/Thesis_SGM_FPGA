############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project hw_inverser
set_top inverse_img
add_files hw_inverser/inv.h
add_files hw_inverser/inv.cpp
add_files -tb hw_inverser/inv_test.cpp -cflags "-Wno-unknown-pragmas"
open_solution "solution1"
set_part {xc7z020clg484-1}
create_clock -period 10 -name default
config_export -format ip_catalog -rtl vhdl
#source "./hw_inverser/solution1/directives.tcl"
csim_design -clean
csynth_design
cosim_design -setup -rtl vhdl
export_design -rtl vhdl -format ip_catalog
