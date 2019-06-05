############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project hw_sgm
set_top comp_d_map
add_files hw_sgm/sgm.h
add_files hw_sgm/sgm.cpp
add_files hw_sgm/sad.h
add_files hw_sgm/sad.cpp
add_files hw_sgm/common.h
add_files -tb hw_sgm/sgm_tb.cpp -cflags "-Wno-unknown-pragmas"
open_solution "solution1"
set_part {xc7z020clg484-1} -tool vivado
create_clock -period 10 -name default
config_export -format ip_catalog -rtl vhdl
#source "./hw_sgm/solution1/directives.tcl"
csim_design -clean -O
csynth_design
cosim_design -rtl vhdl
export_design -flow syn -rtl vhdl -format ip_catalog
