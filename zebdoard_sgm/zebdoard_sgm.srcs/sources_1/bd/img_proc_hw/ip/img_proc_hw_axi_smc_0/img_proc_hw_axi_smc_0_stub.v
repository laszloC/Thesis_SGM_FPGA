// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Wed Jun  5 21:44:05 2019
// Host        : Laszlo-LPT running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               E:/Git/Thesis_SGM_FPGA/zebdoard_sgm/zebdoard_sgm.srcs/sources_1/bd/img_proc_hw/ip/img_proc_hw_axi_smc_0/img_proc_hw_axi_smc_0_stub.v
// Design      : img_proc_hw_axi_smc_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "bd_0020,Vivado 2018.3" *)
module img_proc_hw_axi_smc_0(aclk, aresetn, S00_AXI_awid, S00_AXI_awaddr, 
  S00_AXI_awlen, S00_AXI_awsize, S00_AXI_awburst, S00_AXI_awlock, S00_AXI_awcache, 
  S00_AXI_awprot, S00_AXI_awregion, S00_AXI_awqos, S00_AXI_awuser, S00_AXI_awvalid, 
  S00_AXI_awready, S00_AXI_wid, S00_AXI_wdata, S00_AXI_wstrb, S00_AXI_wlast, S00_AXI_wuser, 
  S00_AXI_wvalid, S00_AXI_wready, S00_AXI_bid, S00_AXI_bresp, S00_AXI_buser, S00_AXI_bvalid, 
  S00_AXI_bready, S00_AXI_arid, S00_AXI_araddr, S00_AXI_arlen, S00_AXI_arsize, 
  S00_AXI_arburst, S00_AXI_arlock, S00_AXI_arcache, S00_AXI_arprot, S00_AXI_arregion, 
  S00_AXI_arqos, S00_AXI_aruser, S00_AXI_arvalid, S00_AXI_arready, S00_AXI_rid, 
  S00_AXI_rdata, S00_AXI_rresp, S00_AXI_rlast, S00_AXI_ruser, S00_AXI_rvalid, S00_AXI_rready, 
  S01_AXI_awid, S01_AXI_awaddr, S01_AXI_awlen, S01_AXI_awsize, S01_AXI_awburst, 
  S01_AXI_awlock, S01_AXI_awcache, S01_AXI_awprot, S01_AXI_awregion, S01_AXI_awqos, 
  S01_AXI_awuser, S01_AXI_awvalid, S01_AXI_awready, S01_AXI_wid, S01_AXI_wdata, 
  S01_AXI_wstrb, S01_AXI_wlast, S01_AXI_wuser, S01_AXI_wvalid, S01_AXI_wready, S01_AXI_bid, 
  S01_AXI_bresp, S01_AXI_buser, S01_AXI_bvalid, S01_AXI_bready, S01_AXI_arid, S01_AXI_araddr, 
  S01_AXI_arlen, S01_AXI_arsize, S01_AXI_arburst, S01_AXI_arlock, S01_AXI_arcache, 
  S01_AXI_arprot, S01_AXI_arregion, S01_AXI_arqos, S01_AXI_aruser, S01_AXI_arvalid, 
  S01_AXI_arready, S01_AXI_rid, S01_AXI_rdata, S01_AXI_rresp, S01_AXI_rlast, S01_AXI_ruser, 
  S01_AXI_rvalid, S01_AXI_rready, S02_AXI_awid, S02_AXI_awaddr, S02_AXI_awlen, 
  S02_AXI_awsize, S02_AXI_awburst, S02_AXI_awlock, S02_AXI_awcache, S02_AXI_awprot, 
  S02_AXI_awregion, S02_AXI_awqos, S02_AXI_awuser, S02_AXI_awvalid, S02_AXI_awready, 
  S02_AXI_wid, S02_AXI_wdata, S02_AXI_wstrb, S02_AXI_wlast, S02_AXI_wuser, S02_AXI_wvalid, 
  S02_AXI_wready, S02_AXI_bid, S02_AXI_bresp, S02_AXI_buser, S02_AXI_bvalid, S02_AXI_bready, 
  S02_AXI_arid, S02_AXI_araddr, S02_AXI_arlen, S02_AXI_arsize, S02_AXI_arburst, 
  S02_AXI_arlock, S02_AXI_arcache, S02_AXI_arprot, S02_AXI_arregion, S02_AXI_arqos, 
  S02_AXI_aruser, S02_AXI_arvalid, S02_AXI_arready, S02_AXI_rid, S02_AXI_rdata, 
  S02_AXI_rresp, S02_AXI_rlast, S02_AXI_ruser, S02_AXI_rvalid, S02_AXI_rready, 
  S03_AXI_awaddr, S03_AXI_awlen, S03_AXI_awsize, S03_AXI_awburst, S03_AXI_awlock, 
  S03_AXI_awcache, S03_AXI_awprot, S03_AXI_awqos, S03_AXI_awvalid, S03_AXI_awready, 
  S03_AXI_wdata, S03_AXI_wstrb, S03_AXI_wlast, S03_AXI_wvalid, S03_AXI_wready, S03_AXI_bresp, 
  S03_AXI_bvalid, S03_AXI_bready, S03_AXI_araddr, S03_AXI_arlen, S03_AXI_arsize, 
  S03_AXI_arburst, S03_AXI_arlock, S03_AXI_arcache, S03_AXI_arprot, S03_AXI_arqos, 
  S03_AXI_arvalid, S03_AXI_arready, S03_AXI_rdata, S03_AXI_rresp, S03_AXI_rlast, 
  S03_AXI_rvalid, S03_AXI_rready, S04_AXI_awaddr, S04_AXI_awlen, S04_AXI_awsize, 
  S04_AXI_awburst, S04_AXI_awlock, S04_AXI_awcache, S04_AXI_awprot, S04_AXI_awqos, 
  S04_AXI_awvalid, S04_AXI_awready, S04_AXI_wdata, S04_AXI_wstrb, S04_AXI_wlast, 
  S04_AXI_wvalid, S04_AXI_wready, S04_AXI_bresp, S04_AXI_bvalid, S04_AXI_bready, 
  S04_AXI_araddr, S04_AXI_arlen, S04_AXI_arsize, S04_AXI_arburst, S04_AXI_arlock, 
  S04_AXI_arcache, S04_AXI_arprot, S04_AXI_arqos, S04_AXI_arvalid, S04_AXI_arready, 
  S04_AXI_rdata, S04_AXI_rresp, S04_AXI_rlast, S04_AXI_rvalid, S04_AXI_rready, 
  M00_AXI_awaddr, M00_AXI_awlen, M00_AXI_awsize, M00_AXI_awburst, M00_AXI_awlock, 
  M00_AXI_awcache, M00_AXI_awprot, M00_AXI_awqos, M00_AXI_awvalid, M00_AXI_awready, 
  M00_AXI_wdata, M00_AXI_wstrb, M00_AXI_wlast, M00_AXI_wvalid, M00_AXI_wready, M00_AXI_bresp, 
  M00_AXI_bvalid, M00_AXI_bready, M00_AXI_araddr, M00_AXI_arlen, M00_AXI_arsize, 
  M00_AXI_arburst, M00_AXI_arlock, M00_AXI_arcache, M00_AXI_arprot, M00_AXI_arqos, 
  M00_AXI_arvalid, M00_AXI_arready, M00_AXI_rdata, M00_AXI_rresp, M00_AXI_rlast, 
  M00_AXI_rvalid, M00_AXI_rready)
/* synthesis syn_black_box black_box_pad_pin="aclk,aresetn,S00_AXI_awid,S00_AXI_awaddr,S00_AXI_awlen,S00_AXI_awsize[2:0],S00_AXI_awburst[1:0],S00_AXI_awlock,S00_AXI_awcache[3:0],S00_AXI_awprot[2:0],S00_AXI_awregion[3:0],S00_AXI_awqos[3:0],S00_AXI_awuser,S00_AXI_awvalid[0:0],S00_AXI_awready[0:0],S00_AXI_wid,S00_AXI_wdata,S00_AXI_wstrb,S00_AXI_wlast[0:0],S00_AXI_wuser,S00_AXI_wvalid[0:0],S00_AXI_wready[0:0],S00_AXI_bid,S00_AXI_bresp[1:0],S00_AXI_buser,S00_AXI_bvalid[0:0],S00_AXI_bready[0:0],S00_AXI_arid,S00_AXI_araddr,S00_AXI_arlen,S00_AXI_arsize[2:0],S00_AXI_arburst[1:0],S00_AXI_arlock,S00_AXI_arcache[3:0],S00_AXI_arprot[2:0],S00_AXI_arregion[3:0],S00_AXI_arqos[3:0],S00_AXI_aruser,S00_AXI_arvalid[0:0],S00_AXI_arready[0:0],S00_AXI_rid,S00_AXI_rdata,S00_AXI_rresp[1:0],S00_AXI_rlast[0:0],S00_AXI_ruser,S00_AXI_rvalid[0:0],S00_AXI_rready[0:0],S01_AXI_awid,S01_AXI_awaddr,S01_AXI_awlen,S01_AXI_awsize[2:0],S01_AXI_awburst[1:0],S01_AXI_awlock,S01_AXI_awcache[3:0],S01_AXI_awprot[2:0],S01_AXI_awregion[3:0],S01_AXI_awqos[3:0],S01_AXI_awuser,S01_AXI_awvalid[0:0],S01_AXI_awready[0:0],S01_AXI_wid,S01_AXI_wdata,S01_AXI_wstrb,S01_AXI_wlast[0:0],S01_AXI_wuser,S01_AXI_wvalid[0:0],S01_AXI_wready[0:0],S01_AXI_bid,S01_AXI_bresp[1:0],S01_AXI_buser,S01_AXI_bvalid[0:0],S01_AXI_bready[0:0],S01_AXI_arid,S01_AXI_araddr,S01_AXI_arlen,S01_AXI_arsize[2:0],S01_AXI_arburst[1:0],S01_AXI_arlock,S01_AXI_arcache[3:0],S01_AXI_arprot[2:0],S01_AXI_arregion[3:0],S01_AXI_arqos[3:0],S01_AXI_aruser,S01_AXI_arvalid[0:0],S01_AXI_arready[0:0],S01_AXI_rid,S01_AXI_rdata,S01_AXI_rresp[1:0],S01_AXI_rlast[0:0],S01_AXI_ruser,S01_AXI_rvalid[0:0],S01_AXI_rready[0:0],S02_AXI_awid,S02_AXI_awaddr,S02_AXI_awlen,S02_AXI_awsize[2:0],S02_AXI_awburst[1:0],S02_AXI_awlock,S02_AXI_awcache[3:0],S02_AXI_awprot[2:0],S02_AXI_awregion[3:0],S02_AXI_awqos[3:0],S02_AXI_awuser,S02_AXI_awvalid[0:0],S02_AXI_awready[0:0],S02_AXI_wid,S02_AXI_wdata,S02_AXI_wstrb,S02_AXI_wlast[0:0],S02_AXI_wuser,S02_AXI_wvalid[0:0],S02_AXI_wready[0:0],S02_AXI_bid,S02_AXI_bresp[1:0],S02_AXI_buser,S02_AXI_bvalid[0:0],S02_AXI_bready[0:0],S02_AXI_arid,S02_AXI_araddr,S02_AXI_arlen,S02_AXI_arsize[2:0],S02_AXI_arburst[1:0],S02_AXI_arlock,S02_AXI_arcache[3:0],S02_AXI_arprot[2:0],S02_AXI_arregion[3:0],S02_AXI_arqos[3:0],S02_AXI_aruser,S02_AXI_arvalid[0:0],S02_AXI_arready[0:0],S02_AXI_rid,S02_AXI_rdata,S02_AXI_rresp[1:0],S02_AXI_rlast[0:0],S02_AXI_ruser,S02_AXI_rvalid[0:0],S02_AXI_rready[0:0],S03_AXI_awaddr[31:0],S03_AXI_awlen[7:0],S03_AXI_awsize[2:0],S03_AXI_awburst[1:0],S03_AXI_awlock[0:0],S03_AXI_awcache[3:0],S03_AXI_awprot[2:0],S03_AXI_awqos[3:0],S03_AXI_awvalid,S03_AXI_awready,S03_AXI_wdata[31:0],S03_AXI_wstrb[3:0],S03_AXI_wlast,S03_AXI_wvalid,S03_AXI_wready,S03_AXI_bresp[1:0],S03_AXI_bvalid,S03_AXI_bready,S03_AXI_araddr[31:0],S03_AXI_arlen[7:0],S03_AXI_arsize[2:0],S03_AXI_arburst[1:0],S03_AXI_arlock[0:0],S03_AXI_arcache[3:0],S03_AXI_arprot[2:0],S03_AXI_arqos[3:0],S03_AXI_arvalid,S03_AXI_arready,S03_AXI_rdata[31:0],S03_AXI_rresp[1:0],S03_AXI_rlast,S03_AXI_rvalid,S03_AXI_rready,S04_AXI_awaddr[31:0],S04_AXI_awlen[7:0],S04_AXI_awsize[2:0],S04_AXI_awburst[1:0],S04_AXI_awlock[0:0],S04_AXI_awcache[3:0],S04_AXI_awprot[2:0],S04_AXI_awqos[3:0],S04_AXI_awvalid,S04_AXI_awready,S04_AXI_wdata[31:0],S04_AXI_wstrb[3:0],S04_AXI_wlast,S04_AXI_wvalid,S04_AXI_wready,S04_AXI_bresp[1:0],S04_AXI_bvalid,S04_AXI_bready,S04_AXI_araddr[31:0],S04_AXI_arlen[7:0],S04_AXI_arsize[2:0],S04_AXI_arburst[1:0],S04_AXI_arlock[0:0],S04_AXI_arcache[3:0],S04_AXI_arprot[2:0],S04_AXI_arqos[3:0],S04_AXI_arvalid,S04_AXI_arready,S04_AXI_rdata[31:0],S04_AXI_rresp[1:0],S04_AXI_rlast,S04_AXI_rvalid,S04_AXI_rready,M00_AXI_awaddr[31:0],M00_AXI_awlen[3:0],M00_AXI_awsize[2:0],M00_AXI_awburst[1:0],M00_AXI_awlock[1:0],M00_AXI_awcache[3:0],M00_AXI_awprot[2:0],M00_AXI_awqos[3:0],M00_AXI_awvalid,M00_AXI_awready,M00_AXI_wdata[63:0],M00_AXI_wstrb[7:0],M00_AXI_wlast,M00_AXI_wvalid,M00_AXI_wready,M00_AXI_bresp[1:0],M00_AXI_bvalid,M00_AXI_bready,M00_AXI_araddr[31:0],M00_AXI_arlen[3:0],M00_AXI_arsize[2:0],M00_AXI_arburst[1:0],M00_AXI_arlock[1:0],M00_AXI_arcache[3:0],M00_AXI_arprot[2:0],M00_AXI_arqos[3:0],M00_AXI_arvalid,M00_AXI_arready,M00_AXI_rdata[63:0],M00_AXI_rresp[1:0],M00_AXI_rlast,M00_AXI_rvalid,M00_AXI_rready" */;
  input aclk;
  input aresetn;
  input S00_AXI_awid;
  input S00_AXI_awaddr;
  input S00_AXI_awlen;
  input [2:0]S00_AXI_awsize;
  input [1:0]S00_AXI_awburst;
  input S00_AXI_awlock;
  input [3:0]S00_AXI_awcache;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awregion;
  input [3:0]S00_AXI_awqos;
  input S00_AXI_awuser;
  input [0:0]S00_AXI_awvalid;
  output [0:0]S00_AXI_awready;
  input S00_AXI_wid;
  input S00_AXI_wdata;
  input S00_AXI_wstrb;
  input [0:0]S00_AXI_wlast;
  input S00_AXI_wuser;
  input [0:0]S00_AXI_wvalid;
  output [0:0]S00_AXI_wready;
  output S00_AXI_bid;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_buser;
  output [0:0]S00_AXI_bvalid;
  input [0:0]S00_AXI_bready;
  input S00_AXI_arid;
  input S00_AXI_araddr;
  input S00_AXI_arlen;
  input [2:0]S00_AXI_arsize;
  input [1:0]S00_AXI_arburst;
  input S00_AXI_arlock;
  input [3:0]S00_AXI_arcache;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arregion;
  input [3:0]S00_AXI_arqos;
  input S00_AXI_aruser;
  input [0:0]S00_AXI_arvalid;
  output [0:0]S00_AXI_arready;
  output S00_AXI_rid;
  output S00_AXI_rdata;
  output [1:0]S00_AXI_rresp;
  output [0:0]S00_AXI_rlast;
  output S00_AXI_ruser;
  output [0:0]S00_AXI_rvalid;
  input [0:0]S00_AXI_rready;
  input S01_AXI_awid;
  input S01_AXI_awaddr;
  input S01_AXI_awlen;
  input [2:0]S01_AXI_awsize;
  input [1:0]S01_AXI_awburst;
  input S01_AXI_awlock;
  input [3:0]S01_AXI_awcache;
  input [2:0]S01_AXI_awprot;
  input [3:0]S01_AXI_awregion;
  input [3:0]S01_AXI_awqos;
  input S01_AXI_awuser;
  input [0:0]S01_AXI_awvalid;
  output [0:0]S01_AXI_awready;
  input S01_AXI_wid;
  input S01_AXI_wdata;
  input S01_AXI_wstrb;
  input [0:0]S01_AXI_wlast;
  input S01_AXI_wuser;
  input [0:0]S01_AXI_wvalid;
  output [0:0]S01_AXI_wready;
  output S01_AXI_bid;
  output [1:0]S01_AXI_bresp;
  output S01_AXI_buser;
  output [0:0]S01_AXI_bvalid;
  input [0:0]S01_AXI_bready;
  input S01_AXI_arid;
  input S01_AXI_araddr;
  input S01_AXI_arlen;
  input [2:0]S01_AXI_arsize;
  input [1:0]S01_AXI_arburst;
  input S01_AXI_arlock;
  input [3:0]S01_AXI_arcache;
  input [2:0]S01_AXI_arprot;
  input [3:0]S01_AXI_arregion;
  input [3:0]S01_AXI_arqos;
  input S01_AXI_aruser;
  input [0:0]S01_AXI_arvalid;
  output [0:0]S01_AXI_arready;
  output S01_AXI_rid;
  output S01_AXI_rdata;
  output [1:0]S01_AXI_rresp;
  output [0:0]S01_AXI_rlast;
  output S01_AXI_ruser;
  output [0:0]S01_AXI_rvalid;
  input [0:0]S01_AXI_rready;
  input S02_AXI_awid;
  input S02_AXI_awaddr;
  input S02_AXI_awlen;
  input [2:0]S02_AXI_awsize;
  input [1:0]S02_AXI_awburst;
  input S02_AXI_awlock;
  input [3:0]S02_AXI_awcache;
  input [2:0]S02_AXI_awprot;
  input [3:0]S02_AXI_awregion;
  input [3:0]S02_AXI_awqos;
  input S02_AXI_awuser;
  input [0:0]S02_AXI_awvalid;
  output [0:0]S02_AXI_awready;
  input S02_AXI_wid;
  input S02_AXI_wdata;
  input S02_AXI_wstrb;
  input [0:0]S02_AXI_wlast;
  input S02_AXI_wuser;
  input [0:0]S02_AXI_wvalid;
  output [0:0]S02_AXI_wready;
  output S02_AXI_bid;
  output [1:0]S02_AXI_bresp;
  output S02_AXI_buser;
  output [0:0]S02_AXI_bvalid;
  input [0:0]S02_AXI_bready;
  input S02_AXI_arid;
  input S02_AXI_araddr;
  input S02_AXI_arlen;
  input [2:0]S02_AXI_arsize;
  input [1:0]S02_AXI_arburst;
  input S02_AXI_arlock;
  input [3:0]S02_AXI_arcache;
  input [2:0]S02_AXI_arprot;
  input [3:0]S02_AXI_arregion;
  input [3:0]S02_AXI_arqos;
  input S02_AXI_aruser;
  input [0:0]S02_AXI_arvalid;
  output [0:0]S02_AXI_arready;
  output S02_AXI_rid;
  output S02_AXI_rdata;
  output [1:0]S02_AXI_rresp;
  output [0:0]S02_AXI_rlast;
  output S02_AXI_ruser;
  output [0:0]S02_AXI_rvalid;
  input [0:0]S02_AXI_rready;
  input [31:0]S03_AXI_awaddr;
  input [7:0]S03_AXI_awlen;
  input [2:0]S03_AXI_awsize;
  input [1:0]S03_AXI_awburst;
  input [0:0]S03_AXI_awlock;
  input [3:0]S03_AXI_awcache;
  input [2:0]S03_AXI_awprot;
  input [3:0]S03_AXI_awqos;
  input S03_AXI_awvalid;
  output S03_AXI_awready;
  input [31:0]S03_AXI_wdata;
  input [3:0]S03_AXI_wstrb;
  input S03_AXI_wlast;
  input S03_AXI_wvalid;
  output S03_AXI_wready;
  output [1:0]S03_AXI_bresp;
  output S03_AXI_bvalid;
  input S03_AXI_bready;
  input [31:0]S03_AXI_araddr;
  input [7:0]S03_AXI_arlen;
  input [2:0]S03_AXI_arsize;
  input [1:0]S03_AXI_arburst;
  input [0:0]S03_AXI_arlock;
  input [3:0]S03_AXI_arcache;
  input [2:0]S03_AXI_arprot;
  input [3:0]S03_AXI_arqos;
  input S03_AXI_arvalid;
  output S03_AXI_arready;
  output [31:0]S03_AXI_rdata;
  output [1:0]S03_AXI_rresp;
  output S03_AXI_rlast;
  output S03_AXI_rvalid;
  input S03_AXI_rready;
  input [31:0]S04_AXI_awaddr;
  input [7:0]S04_AXI_awlen;
  input [2:0]S04_AXI_awsize;
  input [1:0]S04_AXI_awburst;
  input [0:0]S04_AXI_awlock;
  input [3:0]S04_AXI_awcache;
  input [2:0]S04_AXI_awprot;
  input [3:0]S04_AXI_awqos;
  input S04_AXI_awvalid;
  output S04_AXI_awready;
  input [31:0]S04_AXI_wdata;
  input [3:0]S04_AXI_wstrb;
  input S04_AXI_wlast;
  input S04_AXI_wvalid;
  output S04_AXI_wready;
  output [1:0]S04_AXI_bresp;
  output S04_AXI_bvalid;
  input S04_AXI_bready;
  input [31:0]S04_AXI_araddr;
  input [7:0]S04_AXI_arlen;
  input [2:0]S04_AXI_arsize;
  input [1:0]S04_AXI_arburst;
  input [0:0]S04_AXI_arlock;
  input [3:0]S04_AXI_arcache;
  input [2:0]S04_AXI_arprot;
  input [3:0]S04_AXI_arqos;
  input S04_AXI_arvalid;
  output S04_AXI_arready;
  output [31:0]S04_AXI_rdata;
  output [1:0]S04_AXI_rresp;
  output S04_AXI_rlast;
  output S04_AXI_rvalid;
  input S04_AXI_rready;
  output [31:0]M00_AXI_awaddr;
  output [3:0]M00_AXI_awlen;
  output [2:0]M00_AXI_awsize;
  output [1:0]M00_AXI_awburst;
  output [1:0]M00_AXI_awlock;
  output [3:0]M00_AXI_awcache;
  output [2:0]M00_AXI_awprot;
  output [3:0]M00_AXI_awqos;
  output M00_AXI_awvalid;
  input M00_AXI_awready;
  output [63:0]M00_AXI_wdata;
  output [7:0]M00_AXI_wstrb;
  output M00_AXI_wlast;
  output M00_AXI_wvalid;
  input M00_AXI_wready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  output M00_AXI_bready;
  output [31:0]M00_AXI_araddr;
  output [3:0]M00_AXI_arlen;
  output [2:0]M00_AXI_arsize;
  output [1:0]M00_AXI_arburst;
  output [1:0]M00_AXI_arlock;
  output [3:0]M00_AXI_arcache;
  output [2:0]M00_AXI_arprot;
  output [3:0]M00_AXI_arqos;
  output M00_AXI_arvalid;
  input M00_AXI_arready;
  input [63:0]M00_AXI_rdata;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rlast;
  input M00_AXI_rvalid;
  output M00_AXI_rready;
endmodule
