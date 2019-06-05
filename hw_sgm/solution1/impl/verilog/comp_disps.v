// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.3
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module comp_disps (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        m_axi_cost_in_m_img_AWVALID,
        m_axi_cost_in_m_img_AWREADY,
        m_axi_cost_in_m_img_AWADDR,
        m_axi_cost_in_m_img_AWID,
        m_axi_cost_in_m_img_AWLEN,
        m_axi_cost_in_m_img_AWSIZE,
        m_axi_cost_in_m_img_AWBURST,
        m_axi_cost_in_m_img_AWLOCK,
        m_axi_cost_in_m_img_AWCACHE,
        m_axi_cost_in_m_img_AWPROT,
        m_axi_cost_in_m_img_AWQOS,
        m_axi_cost_in_m_img_AWREGION,
        m_axi_cost_in_m_img_AWUSER,
        m_axi_cost_in_m_img_WVALID,
        m_axi_cost_in_m_img_WREADY,
        m_axi_cost_in_m_img_WDATA,
        m_axi_cost_in_m_img_WSTRB,
        m_axi_cost_in_m_img_WLAST,
        m_axi_cost_in_m_img_WID,
        m_axi_cost_in_m_img_WUSER,
        m_axi_cost_in_m_img_ARVALID,
        m_axi_cost_in_m_img_ARREADY,
        m_axi_cost_in_m_img_ARADDR,
        m_axi_cost_in_m_img_ARID,
        m_axi_cost_in_m_img_ARLEN,
        m_axi_cost_in_m_img_ARSIZE,
        m_axi_cost_in_m_img_ARBURST,
        m_axi_cost_in_m_img_ARLOCK,
        m_axi_cost_in_m_img_ARCACHE,
        m_axi_cost_in_m_img_ARPROT,
        m_axi_cost_in_m_img_ARQOS,
        m_axi_cost_in_m_img_ARREGION,
        m_axi_cost_in_m_img_ARUSER,
        m_axi_cost_in_m_img_RVALID,
        m_axi_cost_in_m_img_RREADY,
        m_axi_cost_in_m_img_RDATA,
        m_axi_cost_in_m_img_RLAST,
        m_axi_cost_in_m_img_RID,
        m_axi_cost_in_m_img_RUSER,
        m_axi_cost_in_m_img_RRESP,
        m_axi_cost_in_m_img_BVALID,
        m_axi_cost_in_m_img_BREADY,
        m_axi_cost_in_m_img_BRESP,
        m_axi_cost_in_m_img_BID,
        m_axi_cost_in_m_img_BUSER,
        m_axi_disp_out_m_img_AWVALID,
        m_axi_disp_out_m_img_AWREADY,
        m_axi_disp_out_m_img_AWADDR,
        m_axi_disp_out_m_img_AWID,
        m_axi_disp_out_m_img_AWLEN,
        m_axi_disp_out_m_img_AWSIZE,
        m_axi_disp_out_m_img_AWBURST,
        m_axi_disp_out_m_img_AWLOCK,
        m_axi_disp_out_m_img_AWCACHE,
        m_axi_disp_out_m_img_AWPROT,
        m_axi_disp_out_m_img_AWQOS,
        m_axi_disp_out_m_img_AWREGION,
        m_axi_disp_out_m_img_AWUSER,
        m_axi_disp_out_m_img_WVALID,
        m_axi_disp_out_m_img_WREADY,
        m_axi_disp_out_m_img_WDATA,
        m_axi_disp_out_m_img_WSTRB,
        m_axi_disp_out_m_img_WLAST,
        m_axi_disp_out_m_img_WID,
        m_axi_disp_out_m_img_WUSER,
        m_axi_disp_out_m_img_ARVALID,
        m_axi_disp_out_m_img_ARREADY,
        m_axi_disp_out_m_img_ARADDR,
        m_axi_disp_out_m_img_ARID,
        m_axi_disp_out_m_img_ARLEN,
        m_axi_disp_out_m_img_ARSIZE,
        m_axi_disp_out_m_img_ARBURST,
        m_axi_disp_out_m_img_ARLOCK,
        m_axi_disp_out_m_img_ARCACHE,
        m_axi_disp_out_m_img_ARPROT,
        m_axi_disp_out_m_img_ARQOS,
        m_axi_disp_out_m_img_ARREGION,
        m_axi_disp_out_m_img_ARUSER,
        m_axi_disp_out_m_img_RVALID,
        m_axi_disp_out_m_img_RREADY,
        m_axi_disp_out_m_img_RDATA,
        m_axi_disp_out_m_img_RLAST,
        m_axi_disp_out_m_img_RID,
        m_axi_disp_out_m_img_RUSER,
        m_axi_disp_out_m_img_RRESP,
        m_axi_disp_out_m_img_BVALID,
        m_axi_disp_out_m_img_BREADY,
        m_axi_disp_out_m_img_BRESP,
        m_axi_disp_out_m_img_BID,
        m_axi_disp_out_m_img_BUSER
);

parameter    ap_ST_fsm_state1 = 16'd1;
parameter    ap_ST_fsm_state2 = 16'd2;
parameter    ap_ST_fsm_state3 = 16'd4;
parameter    ap_ST_fsm_state4 = 16'd8;
parameter    ap_ST_fsm_state5 = 16'd16;
parameter    ap_ST_fsm_state6 = 16'd32;
parameter    ap_ST_fsm_state7 = 16'd64;
parameter    ap_ST_fsm_state8 = 16'd128;
parameter    ap_ST_fsm_state9 = 16'd256;
parameter    ap_ST_fsm_state10 = 16'd512;
parameter    ap_ST_fsm_state11 = 16'd1024;
parameter    ap_ST_fsm_state12 = 16'd2048;
parameter    ap_ST_fsm_state13 = 16'd4096;
parameter    ap_ST_fsm_state14 = 16'd8192;
parameter    ap_ST_fsm_state15 = 16'd16384;
parameter    ap_ST_fsm_state16 = 16'd32768;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output   m_axi_cost_in_m_img_AWVALID;
input   m_axi_cost_in_m_img_AWREADY;
output  [31:0] m_axi_cost_in_m_img_AWADDR;
output  [0:0] m_axi_cost_in_m_img_AWID;
output  [31:0] m_axi_cost_in_m_img_AWLEN;
output  [2:0] m_axi_cost_in_m_img_AWSIZE;
output  [1:0] m_axi_cost_in_m_img_AWBURST;
output  [1:0] m_axi_cost_in_m_img_AWLOCK;
output  [3:0] m_axi_cost_in_m_img_AWCACHE;
output  [2:0] m_axi_cost_in_m_img_AWPROT;
output  [3:0] m_axi_cost_in_m_img_AWQOS;
output  [3:0] m_axi_cost_in_m_img_AWREGION;
output  [0:0] m_axi_cost_in_m_img_AWUSER;
output   m_axi_cost_in_m_img_WVALID;
input   m_axi_cost_in_m_img_WREADY;
output  [31:0] m_axi_cost_in_m_img_WDATA;
output  [3:0] m_axi_cost_in_m_img_WSTRB;
output   m_axi_cost_in_m_img_WLAST;
output  [0:0] m_axi_cost_in_m_img_WID;
output  [0:0] m_axi_cost_in_m_img_WUSER;
output   m_axi_cost_in_m_img_ARVALID;
input   m_axi_cost_in_m_img_ARREADY;
output  [31:0] m_axi_cost_in_m_img_ARADDR;
output  [0:0] m_axi_cost_in_m_img_ARID;
output  [31:0] m_axi_cost_in_m_img_ARLEN;
output  [2:0] m_axi_cost_in_m_img_ARSIZE;
output  [1:0] m_axi_cost_in_m_img_ARBURST;
output  [1:0] m_axi_cost_in_m_img_ARLOCK;
output  [3:0] m_axi_cost_in_m_img_ARCACHE;
output  [2:0] m_axi_cost_in_m_img_ARPROT;
output  [3:0] m_axi_cost_in_m_img_ARQOS;
output  [3:0] m_axi_cost_in_m_img_ARREGION;
output  [0:0] m_axi_cost_in_m_img_ARUSER;
input   m_axi_cost_in_m_img_RVALID;
output   m_axi_cost_in_m_img_RREADY;
input  [31:0] m_axi_cost_in_m_img_RDATA;
input   m_axi_cost_in_m_img_RLAST;
input  [0:0] m_axi_cost_in_m_img_RID;
input  [0:0] m_axi_cost_in_m_img_RUSER;
input  [1:0] m_axi_cost_in_m_img_RRESP;
input   m_axi_cost_in_m_img_BVALID;
output   m_axi_cost_in_m_img_BREADY;
input  [1:0] m_axi_cost_in_m_img_BRESP;
input  [0:0] m_axi_cost_in_m_img_BID;
input  [0:0] m_axi_cost_in_m_img_BUSER;
output   m_axi_disp_out_m_img_AWVALID;
input   m_axi_disp_out_m_img_AWREADY;
output  [31:0] m_axi_disp_out_m_img_AWADDR;
output  [0:0] m_axi_disp_out_m_img_AWID;
output  [31:0] m_axi_disp_out_m_img_AWLEN;
output  [2:0] m_axi_disp_out_m_img_AWSIZE;
output  [1:0] m_axi_disp_out_m_img_AWBURST;
output  [1:0] m_axi_disp_out_m_img_AWLOCK;
output  [3:0] m_axi_disp_out_m_img_AWCACHE;
output  [2:0] m_axi_disp_out_m_img_AWPROT;
output  [3:0] m_axi_disp_out_m_img_AWQOS;
output  [3:0] m_axi_disp_out_m_img_AWREGION;
output  [0:0] m_axi_disp_out_m_img_AWUSER;
output   m_axi_disp_out_m_img_WVALID;
input   m_axi_disp_out_m_img_WREADY;
output  [7:0] m_axi_disp_out_m_img_WDATA;
output  [0:0] m_axi_disp_out_m_img_WSTRB;
output   m_axi_disp_out_m_img_WLAST;
output  [0:0] m_axi_disp_out_m_img_WID;
output  [0:0] m_axi_disp_out_m_img_WUSER;
output   m_axi_disp_out_m_img_ARVALID;
input   m_axi_disp_out_m_img_ARREADY;
output  [31:0] m_axi_disp_out_m_img_ARADDR;
output  [0:0] m_axi_disp_out_m_img_ARID;
output  [31:0] m_axi_disp_out_m_img_ARLEN;
output  [2:0] m_axi_disp_out_m_img_ARSIZE;
output  [1:0] m_axi_disp_out_m_img_ARBURST;
output  [1:0] m_axi_disp_out_m_img_ARLOCK;
output  [3:0] m_axi_disp_out_m_img_ARCACHE;
output  [2:0] m_axi_disp_out_m_img_ARPROT;
output  [3:0] m_axi_disp_out_m_img_ARQOS;
output  [3:0] m_axi_disp_out_m_img_ARREGION;
output  [0:0] m_axi_disp_out_m_img_ARUSER;
input   m_axi_disp_out_m_img_RVALID;
output   m_axi_disp_out_m_img_RREADY;
input  [7:0] m_axi_disp_out_m_img_RDATA;
input   m_axi_disp_out_m_img_RLAST;
input  [0:0] m_axi_disp_out_m_img_RID;
input  [0:0] m_axi_disp_out_m_img_RUSER;
input  [1:0] m_axi_disp_out_m_img_RRESP;
input   m_axi_disp_out_m_img_BVALID;
output   m_axi_disp_out_m_img_BREADY;
input  [1:0] m_axi_disp_out_m_img_BRESP;
input  [0:0] m_axi_disp_out_m_img_BID;
input  [0:0] m_axi_disp_out_m_img_BUSER;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg m_axi_cost_in_m_img_ARVALID;
reg m_axi_cost_in_m_img_RREADY;
reg m_axi_disp_out_m_img_AWVALID;
reg m_axi_disp_out_m_img_WVALID;
reg m_axi_disp_out_m_img_BREADY;

(* fsm_encoding = "none" *) reg   [15:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    cost_in_m_img_blk_n_AR;
wire    ap_CS_fsm_state4;
reg    cost_in_m_img_blk_n_R;
wire    ap_CS_fsm_state11;
wire   [0:0] exitcond_fu_272_p2;
reg    disp_out_m_img_blk_n_AW;
wire    ap_CS_fsm_state2;
wire   [0:0] exitcond3_fu_179_p2;
reg    disp_out_m_img_blk_n_W;
reg    disp_out_m_img_blk_n_B;
wire    ap_CS_fsm_state16;
wire   [15:0] next_mul_fu_173_p2;
reg   [15:0] next_mul_reg_308;
reg    ap_sig_ioackin_m_axi_disp_out_m_img_AWREADY;
reg    ap_block_state2_io;
wire   [7:0] i_fu_185_p2;
reg   [7:0] i_reg_316;
wire   [7:0] j_fu_212_p2;
reg   [7:0] j_reg_330;
wire    ap_CS_fsm_state3;
wire   [21:0] tmp_9_fu_248_p2;
reg   [21:0] tmp_9_reg_335;
wire   [0:0] exitcond2_fu_206_p2;
reg    ap_sig_ioackin_m_axi_cost_in_m_img_ARREADY;
wire   [31:0] min_d_cast1_fu_268_p1;
reg   [31:0] min_d_cast1_reg_346;
reg    ap_block_state11;
reg    ap_sig_ioackin_m_axi_disp_out_m_img_WREADY;
reg    ap_block_state11_io;
wire   [4:0] d_fu_278_p2;
reg   [4:0] d_reg_354;
reg   [31:0] min_c_1_reg_359;
wire   [31:0] j_assign_min_d1_fu_294_p3;
wire    ap_CS_fsm_state12;
wire   [31:0] min_c_2_min_c_fu_301_p3;
reg   [7:0] i_assign_1_reg_104;
reg   [15:0] phi_mul_reg_115;
reg   [7:0] j_assign_2_reg_127;
reg   [31:0] min_d1_reg_138;
wire    ap_CS_fsm_state10;
reg   [31:0] min_c_reg_150;
reg   [4:0] min_d_reg_162;
wire   [63:0] tmp_fu_191_p1;
wire   [63:0] tmp_2_fu_257_p1;
reg    ap_reg_ioackin_m_axi_disp_out_m_img_AWREADY;
reg    ap_reg_ioackin_m_axi_cost_in_m_img_ARREADY;
reg    ap_reg_ioackin_m_axi_disp_out_m_img_WREADY;
wire   [15:0] j_assign_2_cast5_fu_202_p1;
wire   [15:0] p_fu_218_p2;
wire   [20:0] p_shl_fu_224_p3;
wire   [16:0] p_shl1_fu_236_p3;
wire   [21:0] p_shl_cast_fu_232_p1;
wire   [21:0] p_shl1_cast_fu_244_p1;
wire  signed [31:0] tmp_1_fu_254_p1;
wire   [0:0] tmp_5_fu_289_p2;
reg   [15:0] ap_NS_fsm;
reg    ap_condition_432;
reg    ap_condition_220;

// power-on initialization
initial begin
#0 ap_CS_fsm = 16'd1;
#0 ap_reg_ioackin_m_axi_disp_out_m_img_AWREADY = 1'b0;
#0 ap_reg_ioackin_m_axi_cost_in_m_img_ARREADY = 1'b0;
#0 ap_reg_ioackin_m_axi_disp_out_m_img_WREADY = 1'b0;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_reg_ioackin_m_axi_cost_in_m_img_ARREADY <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
            if ((ap_sig_ioackin_m_axi_cost_in_m_img_ARREADY == 1'b1)) begin
                ap_reg_ioackin_m_axi_cost_in_m_img_ARREADY <= 1'b0;
            end else if ((m_axi_cost_in_m_img_ARREADY == 1'b1)) begin
                ap_reg_ioackin_m_axi_cost_in_m_img_ARREADY <= 1'b1;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_reg_ioackin_m_axi_disp_out_m_img_AWREADY <= 1'b0;
    end else begin
        if (((exitcond3_fu_179_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
            if ((1'b0 == ap_block_state2_io)) begin
                ap_reg_ioackin_m_axi_disp_out_m_img_AWREADY <= 1'b0;
            end else if ((m_axi_disp_out_m_img_AWREADY == 1'b1)) begin
                ap_reg_ioackin_m_axi_disp_out_m_img_AWREADY <= 1'b1;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_reg_ioackin_m_axi_disp_out_m_img_WREADY <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state11) & (exitcond_fu_272_p2 == 1'd1))) begin
            if ((1'b1 == ap_condition_220)) begin
                ap_reg_ioackin_m_axi_disp_out_m_img_WREADY <= 1'b0;
            end else if ((1'b1 == ap_condition_432)) begin
                ap_reg_ioackin_m_axi_disp_out_m_img_WREADY <= 1'b1;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state16) & (m_axi_disp_out_m_img_BVALID == 1'b1))) begin
        i_assign_1_reg_104 <= i_reg_316;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        i_assign_1_reg_104 <= 8'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond3_fu_179_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2) & (1'b0 == ap_block_state2_io))) begin
        j_assign_2_reg_127 <= 8'd0;
    end else if ((~((1'b1 == ap_block_state11_io) | ((exitcond_fu_272_p2 == 1'd0) & (m_axi_cost_in_m_img_RVALID == 1'b0))) & (1'b1 == ap_CS_fsm_state11) & (exitcond_fu_272_p2 == 1'd1))) begin
        j_assign_2_reg_127 <= j_reg_330;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state12)) begin
        min_c_reg_150 <= min_c_2_min_c_fu_301_p3;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        min_c_reg_150 <= 32'd255;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state12)) begin
        min_d1_reg_138 <= j_assign_min_d1_fu_294_p3;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        min_d1_reg_138 <= 32'd31;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state12)) begin
        min_d_reg_162 <= d_reg_354;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        min_d_reg_162 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state16) & (m_axi_disp_out_m_img_BVALID == 1'b1))) begin
        phi_mul_reg_115 <= next_mul_reg_308;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        phi_mul_reg_115 <= 16'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((~((1'b1 == ap_block_state11_io) | ((exitcond_fu_272_p2 == 1'd0) & (m_axi_cost_in_m_img_RVALID == 1'b0))) & (1'b1 == ap_CS_fsm_state11))) begin
        d_reg_354 <= d_fu_278_p2;
        min_d_cast1_reg_346[4 : 0] <= min_d_cast1_fu_268_p1[4 : 0];
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state2) & (1'b0 == ap_block_state2_io))) begin
        i_reg_316 <= i_fu_185_p2;
        next_mul_reg_308 <= next_mul_fu_173_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        j_reg_330 <= j_fu_212_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((~((1'b1 == ap_block_state11_io) | ((exitcond_fu_272_p2 == 1'd0) & (m_axi_cost_in_m_img_RVALID == 1'b0))) & (exitcond_fu_272_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state11))) begin
        min_c_1_reg_359 <= m_axi_cost_in_m_img_RDATA;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond2_fu_206_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        tmp_9_reg_335[21 : 1] <= tmp_9_fu_248_p2[21 : 1];
    end
end

always @ (*) begin
    if ((((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)) | ((1'b1 == ap_CS_fsm_state2) & (1'b0 == ap_block_state2_io) & (exitcond3_fu_179_p2 == 1'd1)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (1'b0 == ap_block_state2_io) & (exitcond3_fu_179_p2 == 1'd1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((ap_reg_ioackin_m_axi_cost_in_m_img_ARREADY == 1'b0)) begin
        ap_sig_ioackin_m_axi_cost_in_m_img_ARREADY = m_axi_cost_in_m_img_ARREADY;
    end else begin
        ap_sig_ioackin_m_axi_cost_in_m_img_ARREADY = 1'b1;
    end
end

always @ (*) begin
    if ((ap_reg_ioackin_m_axi_disp_out_m_img_AWREADY == 1'b0)) begin
        ap_sig_ioackin_m_axi_disp_out_m_img_AWREADY = m_axi_disp_out_m_img_AWREADY;
    end else begin
        ap_sig_ioackin_m_axi_disp_out_m_img_AWREADY = 1'b1;
    end
end

always @ (*) begin
    if ((ap_reg_ioackin_m_axi_disp_out_m_img_WREADY == 1'b0)) begin
        ap_sig_ioackin_m_axi_disp_out_m_img_WREADY = m_axi_disp_out_m_img_WREADY;
    end else begin
        ap_sig_ioackin_m_axi_disp_out_m_img_WREADY = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        cost_in_m_img_blk_n_AR = m_axi_cost_in_m_img_ARREADY;
    end else begin
        cost_in_m_img_blk_n_AR = 1'b1;
    end
end

always @ (*) begin
    if (((exitcond_fu_272_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state11))) begin
        cost_in_m_img_blk_n_R = m_axi_cost_in_m_img_RVALID;
    end else begin
        cost_in_m_img_blk_n_R = 1'b1;
    end
end

always @ (*) begin
    if (((exitcond3_fu_179_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        disp_out_m_img_blk_n_AW = m_axi_disp_out_m_img_AWREADY;
    end else begin
        disp_out_m_img_blk_n_AW = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state16)) begin
        disp_out_m_img_blk_n_B = m_axi_disp_out_m_img_BVALID;
    end else begin
        disp_out_m_img_blk_n_B = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state11) & (exitcond_fu_272_p2 == 1'd1))) begin
        disp_out_m_img_blk_n_W = m_axi_disp_out_m_img_WREADY;
    end else begin
        disp_out_m_img_blk_n_W = 1'b1;
    end
end

always @ (*) begin
    if (((ap_reg_ioackin_m_axi_cost_in_m_img_ARREADY == 1'b0) & (1'b1 == ap_CS_fsm_state4))) begin
        m_axi_cost_in_m_img_ARVALID = 1'b1;
    end else begin
        m_axi_cost_in_m_img_ARVALID = 1'b0;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state11_io) | ((exitcond_fu_272_p2 == 1'd0) & (m_axi_cost_in_m_img_RVALID == 1'b0))) & (exitcond_fu_272_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state11))) begin
        m_axi_cost_in_m_img_RREADY = 1'b1;
    end else begin
        m_axi_cost_in_m_img_RREADY = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond3_fu_179_p2 == 1'd0) & (ap_reg_ioackin_m_axi_disp_out_m_img_AWREADY == 1'b0) & (1'b1 == ap_CS_fsm_state2))) begin
        m_axi_disp_out_m_img_AWVALID = 1'b1;
    end else begin
        m_axi_disp_out_m_img_AWVALID = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state16) & (m_axi_disp_out_m_img_BVALID == 1'b1))) begin
        m_axi_disp_out_m_img_BREADY = 1'b1;
    end else begin
        m_axi_disp_out_m_img_BREADY = 1'b0;
    end
end

always @ (*) begin
    if ((~((exitcond_fu_272_p2 == 1'd0) & (m_axi_cost_in_m_img_RVALID == 1'b0)) & (ap_reg_ioackin_m_axi_disp_out_m_img_WREADY == 1'b0) & (1'b1 == ap_CS_fsm_state11) & (exitcond_fu_272_p2 == 1'd1))) begin
        m_axi_disp_out_m_img_WVALID = 1'b1;
    end else begin
        m_axi_disp_out_m_img_WVALID = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((1'b1 == ap_CS_fsm_state2) & (1'b0 == ap_block_state2_io) & (exitcond3_fu_179_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else if (((exitcond3_fu_179_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2) & (1'b0 == ap_block_state2_io))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((1'b1 == ap_CS_fsm_state3) & (exitcond2_fu_206_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state13;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state4 : begin
            if (((ap_sig_ioackin_m_axi_cost_in_m_img_ARREADY == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state10;
        end
        ap_ST_fsm_state10 : begin
            ap_NS_fsm = ap_ST_fsm_state11;
        end
        ap_ST_fsm_state11 : begin
            if ((~((1'b1 == ap_block_state11_io) | ((exitcond_fu_272_p2 == 1'd0) & (m_axi_cost_in_m_img_RVALID == 1'b0))) & (1'b1 == ap_CS_fsm_state11) & (exitcond_fu_272_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else if ((~((1'b1 == ap_block_state11_io) | ((exitcond_fu_272_p2 == 1'd0) & (m_axi_cost_in_m_img_RVALID == 1'b0))) & (exitcond_fu_272_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state11))) begin
                ap_NS_fsm = ap_ST_fsm_state12;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state11;
            end
        end
        ap_ST_fsm_state12 : begin
            ap_NS_fsm = ap_ST_fsm_state11;
        end
        ap_ST_fsm_state13 : begin
            ap_NS_fsm = ap_ST_fsm_state14;
        end
        ap_ST_fsm_state14 : begin
            ap_NS_fsm = ap_ST_fsm_state15;
        end
        ap_ST_fsm_state15 : begin
            ap_NS_fsm = ap_ST_fsm_state16;
        end
        ap_ST_fsm_state16 : begin
            if (((1'b1 == ap_CS_fsm_state16) & (m_axi_disp_out_m_img_BVALID == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state16;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state12 = ap_CS_fsm[32'd11];

assign ap_CS_fsm_state16 = ap_CS_fsm[32'd15];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

always @ (*) begin
    ap_block_state11 = ((exitcond_fu_272_p2 == 1'd0) & (m_axi_cost_in_m_img_RVALID == 1'b0));
end

always @ (*) begin
    ap_block_state11_io = ((ap_sig_ioackin_m_axi_disp_out_m_img_WREADY == 1'b0) & (exitcond_fu_272_p2 == 1'd1));
end

always @ (*) begin
    ap_block_state2_io = ((exitcond3_fu_179_p2 == 1'd0) & (ap_sig_ioackin_m_axi_disp_out_m_img_AWREADY == 1'b0));
end

always @ (*) begin
    ap_condition_220 = ~((1'b1 == ap_block_state11_io) | ((exitcond_fu_272_p2 == 1'd0) & (m_axi_cost_in_m_img_RVALID == 1'b0)));
end

always @ (*) begin
    ap_condition_432 = (~((exitcond_fu_272_p2 == 1'd0) & (m_axi_cost_in_m_img_RVALID == 1'b0)) & (m_axi_disp_out_m_img_WREADY == 1'b1));
end

assign d_fu_278_p2 = (min_d_reg_162 + 5'd1);

assign exitcond2_fu_206_p2 = ((j_assign_2_reg_127 == 8'd225) ? 1'b1 : 1'b0);

assign exitcond3_fu_179_p2 = ((i_assign_1_reg_104 == 8'd188) ? 1'b1 : 1'b0);

assign exitcond_fu_272_p2 = ((min_d_reg_162 == 5'd30) ? 1'b1 : 1'b0);

assign i_fu_185_p2 = (i_assign_1_reg_104 + 8'd1);

assign j_assign_2_cast5_fu_202_p1 = j_assign_2_reg_127;

assign j_assign_min_d1_fu_294_p3 = ((tmp_5_fu_289_p2[0:0] === 1'b1) ? min_d_cast1_reg_346 : min_d1_reg_138);

assign j_fu_212_p2 = (j_assign_2_reg_127 + 8'd1);

assign m_axi_cost_in_m_img_ARADDR = tmp_2_fu_257_p1;

assign m_axi_cost_in_m_img_ARBURST = 2'd0;

assign m_axi_cost_in_m_img_ARCACHE = 4'd0;

assign m_axi_cost_in_m_img_ARID = 1'd0;

assign m_axi_cost_in_m_img_ARLEN = 32'd30;

assign m_axi_cost_in_m_img_ARLOCK = 2'd0;

assign m_axi_cost_in_m_img_ARPROT = 3'd0;

assign m_axi_cost_in_m_img_ARQOS = 4'd0;

assign m_axi_cost_in_m_img_ARREGION = 4'd0;

assign m_axi_cost_in_m_img_ARSIZE = 3'd0;

assign m_axi_cost_in_m_img_ARUSER = 1'd0;

assign m_axi_cost_in_m_img_AWADDR = 32'd0;

assign m_axi_cost_in_m_img_AWBURST = 2'd0;

assign m_axi_cost_in_m_img_AWCACHE = 4'd0;

assign m_axi_cost_in_m_img_AWID = 1'd0;

assign m_axi_cost_in_m_img_AWLEN = 32'd0;

assign m_axi_cost_in_m_img_AWLOCK = 2'd0;

assign m_axi_cost_in_m_img_AWPROT = 3'd0;

assign m_axi_cost_in_m_img_AWQOS = 4'd0;

assign m_axi_cost_in_m_img_AWREGION = 4'd0;

assign m_axi_cost_in_m_img_AWSIZE = 3'd0;

assign m_axi_cost_in_m_img_AWUSER = 1'd0;

assign m_axi_cost_in_m_img_AWVALID = 1'b0;

assign m_axi_cost_in_m_img_BREADY = 1'b0;

assign m_axi_cost_in_m_img_WDATA = 32'd0;

assign m_axi_cost_in_m_img_WID = 1'd0;

assign m_axi_cost_in_m_img_WLAST = 1'b0;

assign m_axi_cost_in_m_img_WSTRB = 4'd0;

assign m_axi_cost_in_m_img_WUSER = 1'd0;

assign m_axi_cost_in_m_img_WVALID = 1'b0;

assign m_axi_disp_out_m_img_ARADDR = 32'd0;

assign m_axi_disp_out_m_img_ARBURST = 2'd0;

assign m_axi_disp_out_m_img_ARCACHE = 4'd0;

assign m_axi_disp_out_m_img_ARID = 1'd0;

assign m_axi_disp_out_m_img_ARLEN = 32'd0;

assign m_axi_disp_out_m_img_ARLOCK = 2'd0;

assign m_axi_disp_out_m_img_ARPROT = 3'd0;

assign m_axi_disp_out_m_img_ARQOS = 4'd0;

assign m_axi_disp_out_m_img_ARREGION = 4'd0;

assign m_axi_disp_out_m_img_ARSIZE = 3'd0;

assign m_axi_disp_out_m_img_ARUSER = 1'd0;

assign m_axi_disp_out_m_img_ARVALID = 1'b0;

assign m_axi_disp_out_m_img_AWADDR = tmp_fu_191_p1;

assign m_axi_disp_out_m_img_AWBURST = 2'd0;

assign m_axi_disp_out_m_img_AWCACHE = 4'd0;

assign m_axi_disp_out_m_img_AWID = 1'd0;

assign m_axi_disp_out_m_img_AWLEN = 32'd225;

assign m_axi_disp_out_m_img_AWLOCK = 2'd0;

assign m_axi_disp_out_m_img_AWPROT = 3'd0;

assign m_axi_disp_out_m_img_AWQOS = 4'd0;

assign m_axi_disp_out_m_img_AWREGION = 4'd0;

assign m_axi_disp_out_m_img_AWSIZE = 3'd0;

assign m_axi_disp_out_m_img_AWUSER = 1'd0;

assign m_axi_disp_out_m_img_RREADY = 1'b0;

assign m_axi_disp_out_m_img_WDATA = min_d1_reg_138[7:0];

assign m_axi_disp_out_m_img_WID = 1'd0;

assign m_axi_disp_out_m_img_WLAST = 1'b0;

assign m_axi_disp_out_m_img_WSTRB = 1'd1;

assign m_axi_disp_out_m_img_WUSER = 1'd0;

assign min_c_2_min_c_fu_301_p3 = ((tmp_5_fu_289_p2[0:0] === 1'b1) ? min_c_1_reg_359 : min_c_reg_150);

assign min_d_cast1_fu_268_p1 = min_d_reg_162;

assign next_mul_fu_173_p2 = (phi_mul_reg_115 + 16'd225);

assign p_fu_218_p2 = (phi_mul_reg_115 + j_assign_2_cast5_fu_202_p1);

assign p_shl1_cast_fu_244_p1 = p_shl1_fu_236_p3;

assign p_shl1_fu_236_p3 = {{p_fu_218_p2}, {1'd0}};

assign p_shl_cast_fu_232_p1 = p_shl_fu_224_p3;

assign p_shl_fu_224_p3 = {{p_fu_218_p2}, {5'd0}};

assign tmp_1_fu_254_p1 = $signed(tmp_9_reg_335);

assign tmp_2_fu_257_p1 = $unsigned(tmp_1_fu_254_p1);

assign tmp_5_fu_289_p2 = (($signed(min_c_1_reg_359) < $signed(min_c_reg_150)) ? 1'b1 : 1'b0);

assign tmp_9_fu_248_p2 = (p_shl_cast_fu_232_p1 - p_shl1_cast_fu_244_p1);

assign tmp_fu_191_p1 = phi_mul_reg_115;

always @ (posedge ap_clk) begin
    tmp_9_reg_335[0] <= 1'b0;
    min_d_cast1_reg_346[31:5] <= 27'b000000000000000000000000000;
end

endmodule //comp_disps