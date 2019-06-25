# ==============================================================
# File generated on Sat Jun 22 01:53:41 +0300 2019
# Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
# SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
# IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
# ==============================================================
add_files -tb ../sad_tb.cpp -cflags { -Wno-unknown-pragmas}
add_files hw_sad/sad.h
add_files hw_sad/sad.cpp
set_part xc7z020clg484-1
create_clock -name default -period 10
config_export -description {Computes SAD Cost between two images}
config_export -display_name {SAD Cost}
config_export -format=ip_catalog
config_export -library=sgm
config_export -rtl=vhdl
config_export -vendor=Ciople
config_export -version=4.0
set_directive_pipeline sad_cost/d_loop 
