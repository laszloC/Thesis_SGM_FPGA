set moduleName comp_disps
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {comp_disps}
set C_modelType { void 0 }
set C_modelArgList {
	{ cost_in_m_img int 32 regular {axi_master 0}  }
	{ disp_out_m_img int 8 regular {axi_master 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "cost_in_m_img", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "disp_out_m_img", "interface" : "axi_master", "bitwidth" : 8, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 96
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_cost_in_m_img_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_cost_in_m_img_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_cost_in_m_img_AWADDR sc_out sc_lv 32 signal 0 } 
	{ m_axi_cost_in_m_img_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_cost_in_m_img_AWLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_cost_in_m_img_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_cost_in_m_img_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_cost_in_m_img_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_cost_in_m_img_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_cost_in_m_img_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_cost_in_m_img_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_cost_in_m_img_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_cost_in_m_img_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_cost_in_m_img_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_cost_in_m_img_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_cost_in_m_img_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_cost_in_m_img_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_cost_in_m_img_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_cost_in_m_img_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_cost_in_m_img_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_cost_in_m_img_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_cost_in_m_img_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_cost_in_m_img_ARADDR sc_out sc_lv 32 signal 0 } 
	{ m_axi_cost_in_m_img_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_cost_in_m_img_ARLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_cost_in_m_img_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_cost_in_m_img_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_cost_in_m_img_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_cost_in_m_img_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_cost_in_m_img_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_cost_in_m_img_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_cost_in_m_img_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_cost_in_m_img_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_cost_in_m_img_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_cost_in_m_img_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_cost_in_m_img_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_cost_in_m_img_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_cost_in_m_img_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_cost_in_m_img_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_cost_in_m_img_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_cost_in_m_img_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_cost_in_m_img_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_cost_in_m_img_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_cost_in_m_img_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_cost_in_m_img_BUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_disp_out_m_img_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_disp_out_m_img_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_disp_out_m_img_AWADDR sc_out sc_lv 32 signal 1 } 
	{ m_axi_disp_out_m_img_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_disp_out_m_img_AWLEN sc_out sc_lv 32 signal 1 } 
	{ m_axi_disp_out_m_img_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_disp_out_m_img_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_disp_out_m_img_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_disp_out_m_img_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_disp_out_m_img_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_disp_out_m_img_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_disp_out_m_img_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_disp_out_m_img_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_disp_out_m_img_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_disp_out_m_img_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_disp_out_m_img_WDATA sc_out sc_lv 8 signal 1 } 
	{ m_axi_disp_out_m_img_WSTRB sc_out sc_lv 1 signal 1 } 
	{ m_axi_disp_out_m_img_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_disp_out_m_img_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_disp_out_m_img_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_disp_out_m_img_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_disp_out_m_img_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_disp_out_m_img_ARADDR sc_out sc_lv 32 signal 1 } 
	{ m_axi_disp_out_m_img_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_disp_out_m_img_ARLEN sc_out sc_lv 32 signal 1 } 
	{ m_axi_disp_out_m_img_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_disp_out_m_img_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_disp_out_m_img_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_disp_out_m_img_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_disp_out_m_img_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_disp_out_m_img_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_disp_out_m_img_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_disp_out_m_img_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_disp_out_m_img_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_disp_out_m_img_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_disp_out_m_img_RDATA sc_in sc_lv 8 signal 1 } 
	{ m_axi_disp_out_m_img_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_disp_out_m_img_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_disp_out_m_img_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_disp_out_m_img_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_disp_out_m_img_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_disp_out_m_img_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_disp_out_m_img_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_disp_out_m_img_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_disp_out_m_img_BUSER sc_in sc_lv 1 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axi_cost_in_m_img_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "AWVALID" }} , 
 	{ "name": "m_axi_cost_in_m_img_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "AWREADY" }} , 
 	{ "name": "m_axi_cost_in_m_img_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "AWADDR" }} , 
 	{ "name": "m_axi_cost_in_m_img_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "AWID" }} , 
 	{ "name": "m_axi_cost_in_m_img_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "AWLEN" }} , 
 	{ "name": "m_axi_cost_in_m_img_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_cost_in_m_img_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "AWBURST" }} , 
 	{ "name": "m_axi_cost_in_m_img_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_cost_in_m_img_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_cost_in_m_img_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "AWPROT" }} , 
 	{ "name": "m_axi_cost_in_m_img_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "AWQOS" }} , 
 	{ "name": "m_axi_cost_in_m_img_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "AWREGION" }} , 
 	{ "name": "m_axi_cost_in_m_img_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "AWUSER" }} , 
 	{ "name": "m_axi_cost_in_m_img_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "WVALID" }} , 
 	{ "name": "m_axi_cost_in_m_img_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "WREADY" }} , 
 	{ "name": "m_axi_cost_in_m_img_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "WDATA" }} , 
 	{ "name": "m_axi_cost_in_m_img_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "WSTRB" }} , 
 	{ "name": "m_axi_cost_in_m_img_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "WLAST" }} , 
 	{ "name": "m_axi_cost_in_m_img_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "WID" }} , 
 	{ "name": "m_axi_cost_in_m_img_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "WUSER" }} , 
 	{ "name": "m_axi_cost_in_m_img_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "ARVALID" }} , 
 	{ "name": "m_axi_cost_in_m_img_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "ARREADY" }} , 
 	{ "name": "m_axi_cost_in_m_img_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "ARADDR" }} , 
 	{ "name": "m_axi_cost_in_m_img_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "ARID" }} , 
 	{ "name": "m_axi_cost_in_m_img_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "ARLEN" }} , 
 	{ "name": "m_axi_cost_in_m_img_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_cost_in_m_img_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "ARBURST" }} , 
 	{ "name": "m_axi_cost_in_m_img_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_cost_in_m_img_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_cost_in_m_img_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "ARPROT" }} , 
 	{ "name": "m_axi_cost_in_m_img_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "ARQOS" }} , 
 	{ "name": "m_axi_cost_in_m_img_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "ARREGION" }} , 
 	{ "name": "m_axi_cost_in_m_img_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "ARUSER" }} , 
 	{ "name": "m_axi_cost_in_m_img_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "RVALID" }} , 
 	{ "name": "m_axi_cost_in_m_img_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "RREADY" }} , 
 	{ "name": "m_axi_cost_in_m_img_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "RDATA" }} , 
 	{ "name": "m_axi_cost_in_m_img_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "RLAST" }} , 
 	{ "name": "m_axi_cost_in_m_img_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "RID" }} , 
 	{ "name": "m_axi_cost_in_m_img_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "RUSER" }} , 
 	{ "name": "m_axi_cost_in_m_img_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "RRESP" }} , 
 	{ "name": "m_axi_cost_in_m_img_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "BVALID" }} , 
 	{ "name": "m_axi_cost_in_m_img_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "BREADY" }} , 
 	{ "name": "m_axi_cost_in_m_img_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "BRESP" }} , 
 	{ "name": "m_axi_cost_in_m_img_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "BID" }} , 
 	{ "name": "m_axi_cost_in_m_img_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cost_in_m_img", "role": "BUSER" }} , 
 	{ "name": "m_axi_disp_out_m_img_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "AWVALID" }} , 
 	{ "name": "m_axi_disp_out_m_img_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "AWREADY" }} , 
 	{ "name": "m_axi_disp_out_m_img_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "AWADDR" }} , 
 	{ "name": "m_axi_disp_out_m_img_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "AWID" }} , 
 	{ "name": "m_axi_disp_out_m_img_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "AWLEN" }} , 
 	{ "name": "m_axi_disp_out_m_img_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_disp_out_m_img_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "AWBURST" }} , 
 	{ "name": "m_axi_disp_out_m_img_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_disp_out_m_img_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_disp_out_m_img_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "AWPROT" }} , 
 	{ "name": "m_axi_disp_out_m_img_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "AWQOS" }} , 
 	{ "name": "m_axi_disp_out_m_img_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "AWREGION" }} , 
 	{ "name": "m_axi_disp_out_m_img_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "AWUSER" }} , 
 	{ "name": "m_axi_disp_out_m_img_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "WVALID" }} , 
 	{ "name": "m_axi_disp_out_m_img_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "WREADY" }} , 
 	{ "name": "m_axi_disp_out_m_img_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "WDATA" }} , 
 	{ "name": "m_axi_disp_out_m_img_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "WSTRB" }} , 
 	{ "name": "m_axi_disp_out_m_img_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "WLAST" }} , 
 	{ "name": "m_axi_disp_out_m_img_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "WID" }} , 
 	{ "name": "m_axi_disp_out_m_img_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "WUSER" }} , 
 	{ "name": "m_axi_disp_out_m_img_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "ARVALID" }} , 
 	{ "name": "m_axi_disp_out_m_img_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "ARREADY" }} , 
 	{ "name": "m_axi_disp_out_m_img_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "ARADDR" }} , 
 	{ "name": "m_axi_disp_out_m_img_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "ARID" }} , 
 	{ "name": "m_axi_disp_out_m_img_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "ARLEN" }} , 
 	{ "name": "m_axi_disp_out_m_img_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_disp_out_m_img_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "ARBURST" }} , 
 	{ "name": "m_axi_disp_out_m_img_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_disp_out_m_img_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_disp_out_m_img_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "ARPROT" }} , 
 	{ "name": "m_axi_disp_out_m_img_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "ARQOS" }} , 
 	{ "name": "m_axi_disp_out_m_img_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "ARREGION" }} , 
 	{ "name": "m_axi_disp_out_m_img_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "ARUSER" }} , 
 	{ "name": "m_axi_disp_out_m_img_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "RVALID" }} , 
 	{ "name": "m_axi_disp_out_m_img_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "RREADY" }} , 
 	{ "name": "m_axi_disp_out_m_img_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "RDATA" }} , 
 	{ "name": "m_axi_disp_out_m_img_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "RLAST" }} , 
 	{ "name": "m_axi_disp_out_m_img_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "RID" }} , 
 	{ "name": "m_axi_disp_out_m_img_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "RUSER" }} , 
 	{ "name": "m_axi_disp_out_m_img_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "RRESP" }} , 
 	{ "name": "m_axi_disp_out_m_img_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "BVALID" }} , 
 	{ "name": "m_axi_disp_out_m_img_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "BREADY" }} , 
 	{ "name": "m_axi_disp_out_m_img_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "BRESP" }} , 
 	{ "name": "m_axi_disp_out_m_img_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "BID" }} , 
 	{ "name": "m_axi_disp_out_m_img_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "disp_out_m_img", "role": "BUSER" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "comp_disps",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2919829", "EstimateLatencyMax" : "2919829",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "cost_in_m_img", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "cost_in_m_img_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "cost_in_m_img_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "disp_out_m_img", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "disp_out_m_img_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "disp_out_m_img_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "disp_out_m_img_blk_n_B", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	comp_disps {
		cost_in_m_img {Type I LastRead 10 FirstWrite -1}
		disp_out_m_img {Type O LastRead 2 FirstWrite 10}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2919829", "Max" : "2919829"}
	, {"Name" : "Interval", "Min" : "2919829", "Max" : "2919829"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	cost_in_m_img { m_axi {  { m_axi_cost_in_m_img_AWVALID VALID 1 1 }  { m_axi_cost_in_m_img_AWREADY READY 0 1 }  { m_axi_cost_in_m_img_AWADDR ADDR 1 32 }  { m_axi_cost_in_m_img_AWID ID 1 1 }  { m_axi_cost_in_m_img_AWLEN LEN 1 32 }  { m_axi_cost_in_m_img_AWSIZE SIZE 1 3 }  { m_axi_cost_in_m_img_AWBURST BURST 1 2 }  { m_axi_cost_in_m_img_AWLOCK LOCK 1 2 }  { m_axi_cost_in_m_img_AWCACHE CACHE 1 4 }  { m_axi_cost_in_m_img_AWPROT PROT 1 3 }  { m_axi_cost_in_m_img_AWQOS QOS 1 4 }  { m_axi_cost_in_m_img_AWREGION REGION 1 4 }  { m_axi_cost_in_m_img_AWUSER USER 1 1 }  { m_axi_cost_in_m_img_WVALID VALID 1 1 }  { m_axi_cost_in_m_img_WREADY READY 0 1 }  { m_axi_cost_in_m_img_WDATA DATA 1 32 }  { m_axi_cost_in_m_img_WSTRB STRB 1 4 }  { m_axi_cost_in_m_img_WLAST LAST 1 1 }  { m_axi_cost_in_m_img_WID ID 1 1 }  { m_axi_cost_in_m_img_WUSER USER 1 1 }  { m_axi_cost_in_m_img_ARVALID VALID 1 1 }  { m_axi_cost_in_m_img_ARREADY READY 0 1 }  { m_axi_cost_in_m_img_ARADDR ADDR 1 32 }  { m_axi_cost_in_m_img_ARID ID 1 1 }  { m_axi_cost_in_m_img_ARLEN LEN 1 32 }  { m_axi_cost_in_m_img_ARSIZE SIZE 1 3 }  { m_axi_cost_in_m_img_ARBURST BURST 1 2 }  { m_axi_cost_in_m_img_ARLOCK LOCK 1 2 }  { m_axi_cost_in_m_img_ARCACHE CACHE 1 4 }  { m_axi_cost_in_m_img_ARPROT PROT 1 3 }  { m_axi_cost_in_m_img_ARQOS QOS 1 4 }  { m_axi_cost_in_m_img_ARREGION REGION 1 4 }  { m_axi_cost_in_m_img_ARUSER USER 1 1 }  { m_axi_cost_in_m_img_RVALID VALID 0 1 }  { m_axi_cost_in_m_img_RREADY READY 1 1 }  { m_axi_cost_in_m_img_RDATA DATA 0 32 }  { m_axi_cost_in_m_img_RLAST LAST 0 1 }  { m_axi_cost_in_m_img_RID ID 0 1 }  { m_axi_cost_in_m_img_RUSER USER 0 1 }  { m_axi_cost_in_m_img_RRESP RESP 0 2 }  { m_axi_cost_in_m_img_BVALID VALID 0 1 }  { m_axi_cost_in_m_img_BREADY READY 1 1 }  { m_axi_cost_in_m_img_BRESP RESP 0 2 }  { m_axi_cost_in_m_img_BID ID 0 1 }  { m_axi_cost_in_m_img_BUSER USER 0 1 } } }
	disp_out_m_img { m_axi {  { m_axi_disp_out_m_img_AWVALID VALID 1 1 }  { m_axi_disp_out_m_img_AWREADY READY 0 1 }  { m_axi_disp_out_m_img_AWADDR ADDR 1 32 }  { m_axi_disp_out_m_img_AWID ID 1 1 }  { m_axi_disp_out_m_img_AWLEN LEN 1 32 }  { m_axi_disp_out_m_img_AWSIZE SIZE 1 3 }  { m_axi_disp_out_m_img_AWBURST BURST 1 2 }  { m_axi_disp_out_m_img_AWLOCK LOCK 1 2 }  { m_axi_disp_out_m_img_AWCACHE CACHE 1 4 }  { m_axi_disp_out_m_img_AWPROT PROT 1 3 }  { m_axi_disp_out_m_img_AWQOS QOS 1 4 }  { m_axi_disp_out_m_img_AWREGION REGION 1 4 }  { m_axi_disp_out_m_img_AWUSER USER 1 1 }  { m_axi_disp_out_m_img_WVALID VALID 1 1 }  { m_axi_disp_out_m_img_WREADY READY 0 1 }  { m_axi_disp_out_m_img_WDATA DATA 1 8 }  { m_axi_disp_out_m_img_WSTRB STRB 1 1 }  { m_axi_disp_out_m_img_WLAST LAST 1 1 }  { m_axi_disp_out_m_img_WID ID 1 1 }  { m_axi_disp_out_m_img_WUSER USER 1 1 }  { m_axi_disp_out_m_img_ARVALID VALID 1 1 }  { m_axi_disp_out_m_img_ARREADY READY 0 1 }  { m_axi_disp_out_m_img_ARADDR ADDR 1 32 }  { m_axi_disp_out_m_img_ARID ID 1 1 }  { m_axi_disp_out_m_img_ARLEN LEN 1 32 }  { m_axi_disp_out_m_img_ARSIZE SIZE 1 3 }  { m_axi_disp_out_m_img_ARBURST BURST 1 2 }  { m_axi_disp_out_m_img_ARLOCK LOCK 1 2 }  { m_axi_disp_out_m_img_ARCACHE CACHE 1 4 }  { m_axi_disp_out_m_img_ARPROT PROT 1 3 }  { m_axi_disp_out_m_img_ARQOS QOS 1 4 }  { m_axi_disp_out_m_img_ARREGION REGION 1 4 }  { m_axi_disp_out_m_img_ARUSER USER 1 1 }  { m_axi_disp_out_m_img_RVALID VALID 0 1 }  { m_axi_disp_out_m_img_RREADY READY 1 1 }  { m_axi_disp_out_m_img_RDATA DATA 0 8 }  { m_axi_disp_out_m_img_RLAST LAST 0 1 }  { m_axi_disp_out_m_img_RID ID 0 1 }  { m_axi_disp_out_m_img_RUSER USER 0 1 }  { m_axi_disp_out_m_img_RRESP RESP 0 2 }  { m_axi_disp_out_m_img_BVALID VALID 0 1 }  { m_axi_disp_out_m_img_BREADY READY 1 1 }  { m_axi_disp_out_m_img_BRESP RESP 0 2 }  { m_axi_disp_out_m_img_BID ID 0 1 }  { m_axi_disp_out_m_img_BUSER USER 0 1 } } }
}
