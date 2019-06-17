############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_interface -mode m_axi -depth 42300 -offset slave -bundle DATA_BUS "sad_cost" img_left
set_directive_interface -mode m_axi -depth 42300 -offset slave -bundle DATA_BUS "sad_cost" img_right
set_directive_interface -mode m_axi -depth 1269000 -offset slave -bundle DATA_BUS "sad_cost" cost
set_directive_interface -mode s_axilite -bundle DATA_BUS "sad_cost"
set_directive_pipeline "sad_cost/d_loop"
set_directive_pipeline "sad_block_cost/dj_loop"
set_directive_interface -mode s_axilite -bundle DATA_BUS "sad_cost" disp_coeff
set_directive_pipeline "sad_block_cost/dj_loop"
