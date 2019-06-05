# ==============================================================
# File generated on Wed Jun 05 20:42:10 +0300 2019
# Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
# SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
# IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
# ==============================================================
add_files -tb ../sgm_tb.cpp -cflags { -Wno-unknown-pragmas}
add_files hw_sgm/common.h
add_files hw_sgm/sad.cpp
add_files hw_sgm/sad.h
add_files hw_sgm/sgm.cpp
add_files hw_sgm/sgm.h
set_part xc7z020clg484-1
create_clock -name default -period 10
config_export -format=ip_catalog
config_export -rtl=vhdl
