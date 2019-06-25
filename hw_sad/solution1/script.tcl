############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project hw_sad
set_top sad_cost
add_files hw_sad/sad.h
add_files hw_sad/sad.cpp
add_files -tb hw_sad/sad_tb.cpp -cflags "-Wno-unknown-pragmas"
open_solution "solution1"
set_part {xc7z020clg484-1} -tool vivado
create_clock -period 10 -name default
config_export -description {Computes SAD Cost between two images} -display_name {SAD Cost} -format ip_catalog -library sgm -rtl vhdl -vendor Ciople -version 4.0
source "./hw_sad/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -flow syn -rtl vhdl -format ip_catalog -description "Computes SAD Cost between two images" -vendor "Ciople" -library "sgm" -version "4.0" -display_name "SAD Cost"
