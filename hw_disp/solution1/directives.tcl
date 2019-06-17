############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_interface -mode m_axi -depth 1269000 -offset slave -bundle DATA_BUS "disp" cost_in
set_directive_interface -mode m_axi -depth 42300 -offset slave -bundle DATA_BUS "disp" disp_out
set_directive_pipeline "disp/p_loop"
set_directive_interface -mode s_axilite -bundle DATA_BUS "disp"
set_directive_dependence -variable cost_in -type inter -dependent false "disp"
set_directive_dependence -variable disp_out -type inter -dependent false "disp"
