set moduleName inverse_img
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type dataflow
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {inverse_img}
set C_modelType { void 0 }
set C_modelArgList {
	{ D_BUS int 8 regular {axi_master 2}  }
	{ img_in int 32 regular {axi_slave 0}  }
	{ img_out int 32 regular {axi_slave 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "D_BUS", "interface" : "axi_master", "bitwidth" : 8, "direction" : "READWRITE", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "img_in","cData": "unsigned char","bit_use": { "low": 0,"up": 7},"offset": { "type": "dynamic","port_name": "img_in","bundle": "AXILiteS"},"direction": "READONLY","cArray": [{"low" : 0,"up" : 42299,"step" : 1}]},{"cName": "img_out","cData": "unsigned char","bit_use": { "low": 0,"up": 7},"offset": { "type": "dynamic","port_name": "img_out","bundle": "AXILiteS"},"direction": "WRITEONLY","cArray": [{"low" : 0,"up" : 42299,"step" : 1}]}]}]} , 
 	{ "Name" : "img_in", "interface" : "axi_slave", "bundle":"D_BUS","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":23}} , 
 	{ "Name" : "img_out", "interface" : "axi_slave", "bundle":"D_BUS","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":24}, "offset_end" : {"in":31}} ]}
# RTL Port declarations: 
set portNum 65
set portList { 
	{ s_axi_D_BUS_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_D_BUS_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_D_BUS_AWADDR sc_in sc_lv 5 signal -1 } 
	{ s_axi_D_BUS_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_D_BUS_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_D_BUS_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_D_BUS_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_D_BUS_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_D_BUS_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_D_BUS_ARADDR sc_in sc_lv 5 signal -1 } 
	{ s_axi_D_BUS_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_D_BUS_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_D_BUS_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_D_BUS_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_D_BUS_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_D_BUS_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_D_BUS_BRESP sc_out sc_lv 2 signal -1 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
	{ m_axi_D_BUS_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_D_BUS_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_D_BUS_AWADDR sc_out sc_lv 32 signal 0 } 
	{ m_axi_D_BUS_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_D_BUS_AWLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_D_BUS_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_D_BUS_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_D_BUS_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_D_BUS_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_D_BUS_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_D_BUS_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_D_BUS_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_D_BUS_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_D_BUS_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_D_BUS_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_D_BUS_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_D_BUS_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_D_BUS_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_D_BUS_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_D_BUS_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_D_BUS_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_D_BUS_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_D_BUS_ARADDR sc_out sc_lv 32 signal 0 } 
	{ m_axi_D_BUS_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_D_BUS_ARLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_D_BUS_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_D_BUS_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_D_BUS_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_D_BUS_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_D_BUS_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_D_BUS_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_D_BUS_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_D_BUS_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_D_BUS_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_D_BUS_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_D_BUS_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_D_BUS_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_D_BUS_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_D_BUS_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_D_BUS_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_D_BUS_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_D_BUS_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_D_BUS_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_D_BUS_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_D_BUS_BUSER sc_in sc_lv 1 signal 0 } 
}
set NewPortList {[ 
	{ "name": "s_axi_D_BUS_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "D_BUS", "role": "AWADDR" },"address":[{"name":"inverse_img","role":"start","value":"0","valid_bit":"0"},{"name":"inverse_img","role":"continue","value":"0","valid_bit":"4"},{"name":"inverse_img","role":"auto_start","value":"0","valid_bit":"7"},{"name":"img_in","role":"data","value":"16"},{"name":"img_out","role":"data","value":"24"}] },
	{ "name": "s_axi_D_BUS_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "D_BUS", "role": "AWVALID" } },
	{ "name": "s_axi_D_BUS_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "D_BUS", "role": "AWREADY" } },
	{ "name": "s_axi_D_BUS_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "D_BUS", "role": "WVALID" } },
	{ "name": "s_axi_D_BUS_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "D_BUS", "role": "WREADY" } },
	{ "name": "s_axi_D_BUS_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "D_BUS", "role": "WDATA" } },
	{ "name": "s_axi_D_BUS_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "D_BUS", "role": "WSTRB" } },
	{ "name": "s_axi_D_BUS_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "D_BUS", "role": "ARADDR" },"address":[{"name":"inverse_img","role":"start","value":"0","valid_bit":"0"},{"name":"inverse_img","role":"done","value":"0","valid_bit":"1"},{"name":"inverse_img","role":"idle","value":"0","valid_bit":"2"},{"name":"inverse_img","role":"ready","value":"0","valid_bit":"3"},{"name":"inverse_img","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_D_BUS_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "D_BUS", "role": "ARVALID" } },
	{ "name": "s_axi_D_BUS_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "D_BUS", "role": "ARREADY" } },
	{ "name": "s_axi_D_BUS_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "D_BUS", "role": "RVALID" } },
	{ "name": "s_axi_D_BUS_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "D_BUS", "role": "RREADY" } },
	{ "name": "s_axi_D_BUS_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "D_BUS", "role": "RDATA" } },
	{ "name": "s_axi_D_BUS_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "D_BUS", "role": "RRESP" } },
	{ "name": "s_axi_D_BUS_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "D_BUS", "role": "BVALID" } },
	{ "name": "s_axi_D_BUS_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "D_BUS", "role": "BREADY" } },
	{ "name": "s_axi_D_BUS_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "D_BUS", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "D_BUS", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "m_axi_D_BUS_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "D_BUS", "role": "AWVALID" }} , 
 	{ "name": "m_axi_D_BUS_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "D_BUS", "role": "AWREADY" }} , 
 	{ "name": "m_axi_D_BUS_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "D_BUS", "role": "AWADDR" }} , 
 	{ "name": "m_axi_D_BUS_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "D_BUS", "role": "AWID" }} , 
 	{ "name": "m_axi_D_BUS_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "D_BUS", "role": "AWLEN" }} , 
 	{ "name": "m_axi_D_BUS_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "D_BUS", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_D_BUS_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "D_BUS", "role": "AWBURST" }} , 
 	{ "name": "m_axi_D_BUS_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "D_BUS", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_D_BUS_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "D_BUS", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_D_BUS_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "D_BUS", "role": "AWPROT" }} , 
 	{ "name": "m_axi_D_BUS_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "D_BUS", "role": "AWQOS" }} , 
 	{ "name": "m_axi_D_BUS_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "D_BUS", "role": "AWREGION" }} , 
 	{ "name": "m_axi_D_BUS_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "D_BUS", "role": "AWUSER" }} , 
 	{ "name": "m_axi_D_BUS_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "D_BUS", "role": "WVALID" }} , 
 	{ "name": "m_axi_D_BUS_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "D_BUS", "role": "WREADY" }} , 
 	{ "name": "m_axi_D_BUS_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "D_BUS", "role": "WDATA" }} , 
 	{ "name": "m_axi_D_BUS_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "D_BUS", "role": "WSTRB" }} , 
 	{ "name": "m_axi_D_BUS_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "D_BUS", "role": "WLAST" }} , 
 	{ "name": "m_axi_D_BUS_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "D_BUS", "role": "WID" }} , 
 	{ "name": "m_axi_D_BUS_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "D_BUS", "role": "WUSER" }} , 
 	{ "name": "m_axi_D_BUS_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "D_BUS", "role": "ARVALID" }} , 
 	{ "name": "m_axi_D_BUS_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "D_BUS", "role": "ARREADY" }} , 
 	{ "name": "m_axi_D_BUS_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "D_BUS", "role": "ARADDR" }} , 
 	{ "name": "m_axi_D_BUS_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "D_BUS", "role": "ARID" }} , 
 	{ "name": "m_axi_D_BUS_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "D_BUS", "role": "ARLEN" }} , 
 	{ "name": "m_axi_D_BUS_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "D_BUS", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_D_BUS_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "D_BUS", "role": "ARBURST" }} , 
 	{ "name": "m_axi_D_BUS_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "D_BUS", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_D_BUS_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "D_BUS", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_D_BUS_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "D_BUS", "role": "ARPROT" }} , 
 	{ "name": "m_axi_D_BUS_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "D_BUS", "role": "ARQOS" }} , 
 	{ "name": "m_axi_D_BUS_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "D_BUS", "role": "ARREGION" }} , 
 	{ "name": "m_axi_D_BUS_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "D_BUS", "role": "ARUSER" }} , 
 	{ "name": "m_axi_D_BUS_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "D_BUS", "role": "RVALID" }} , 
 	{ "name": "m_axi_D_BUS_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "D_BUS", "role": "RREADY" }} , 
 	{ "name": "m_axi_D_BUS_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "D_BUS", "role": "RDATA" }} , 
 	{ "name": "m_axi_D_BUS_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "D_BUS", "role": "RLAST" }} , 
 	{ "name": "m_axi_D_BUS_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "D_BUS", "role": "RID" }} , 
 	{ "name": "m_axi_D_BUS_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "D_BUS", "role": "RUSER" }} , 
 	{ "name": "m_axi_D_BUS_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "D_BUS", "role": "RRESP" }} , 
 	{ "name": "m_axi_D_BUS_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "D_BUS", "role": "BVALID" }} , 
 	{ "name": "m_axi_D_BUS_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "D_BUS", "role": "BREADY" }} , 
 	{ "name": "m_axi_D_BUS_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "D_BUS", "role": "BRESP" }} , 
 	{ "name": "m_axi_D_BUS_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "D_BUS", "role": "BID" }} , 
 	{ "name": "m_axi_D_BUS_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "D_BUS", "role": "BUSER" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "inverse_img",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "676801", "EstimateLatencyMax" : "676801",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"InputProcess" : [
			{"ID" : "3", "Name" : "Loop_1_proc_U0"}],
		"OutputProcess" : [
			{"ID" : "3", "Name" : "Loop_1_proc_U0"}],
		"Port" : [
			{"Name" : "D_BUS", "Type" : "MAXI", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "Loop_1_proc_U0", "Port" : "img_in"}]},
			{"Name" : "img_in", "Type" : "None", "Direction" : "I"},
			{"Name" : "img_out", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.inverse_img_D_BUS_s_axi_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.inverse_img_D_BUS_m_axi_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_1_proc_U0", "Parent" : "0",
		"CDFG" : "Loop_1_proc",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "676801", "EstimateLatencyMax" : "676801",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "img_in", "Type" : "MAXI", "Direction" : "IO",
				"BlockSignal" : [
					{"Name" : "img_in_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "img_in_blk_n_R", "Type" : "RtlSignal"},
					{"Name" : "img_in_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "img_in_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "img_in_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "img_in_offset", "Type" : "None", "Direction" : "I"},
			{"Name" : "img_out_offset", "Type" : "None", "Direction" : "I"}]}]}


set ArgLastReadFirstWriteLatency {
	inverse_img {
		D_BUS {Type IO LastRead 12 FirstWrite 11}
		img_in {Type I LastRead 0 FirstWrite -1}
		img_out {Type I LastRead 0 FirstWrite -1}}
	Loop_1_proc {
		img_in {Type IO LastRead 12 FirstWrite 11}
		img_in_offset {Type I LastRead 0 FirstWrite -1}
		img_out_offset {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "676801", "Max" : "676801"}
	, {"Name" : "Interval", "Min" : "676802", "Max" : "676802"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	D_BUS { m_axi {  { m_axi_D_BUS_AWVALID VALID 1 1 }  { m_axi_D_BUS_AWREADY READY 0 1 }  { m_axi_D_BUS_AWADDR ADDR 1 32 }  { m_axi_D_BUS_AWID ID 1 1 }  { m_axi_D_BUS_AWLEN LEN 1 8 }  { m_axi_D_BUS_AWSIZE SIZE 1 3 }  { m_axi_D_BUS_AWBURST BURST 1 2 }  { m_axi_D_BUS_AWLOCK LOCK 1 2 }  { m_axi_D_BUS_AWCACHE CACHE 1 4 }  { m_axi_D_BUS_AWPROT PROT 1 3 }  { m_axi_D_BUS_AWQOS QOS 1 4 }  { m_axi_D_BUS_AWREGION REGION 1 4 }  { m_axi_D_BUS_AWUSER USER 1 1 }  { m_axi_D_BUS_WVALID VALID 1 1 }  { m_axi_D_BUS_WREADY READY 0 1 }  { m_axi_D_BUS_WDATA DATA 1 32 }  { m_axi_D_BUS_WSTRB STRB 1 4 }  { m_axi_D_BUS_WLAST LAST 1 1 }  { m_axi_D_BUS_WID ID 1 1 }  { m_axi_D_BUS_WUSER USER 1 1 }  { m_axi_D_BUS_ARVALID VALID 1 1 }  { m_axi_D_BUS_ARREADY READY 0 1 }  { m_axi_D_BUS_ARADDR ADDR 1 32 }  { m_axi_D_BUS_ARID ID 1 1 }  { m_axi_D_BUS_ARLEN LEN 1 8 }  { m_axi_D_BUS_ARSIZE SIZE 1 3 }  { m_axi_D_BUS_ARBURST BURST 1 2 }  { m_axi_D_BUS_ARLOCK LOCK 1 2 }  { m_axi_D_BUS_ARCACHE CACHE 1 4 }  { m_axi_D_BUS_ARPROT PROT 1 3 }  { m_axi_D_BUS_ARQOS QOS 1 4 }  { m_axi_D_BUS_ARREGION REGION 1 4 }  { m_axi_D_BUS_ARUSER USER 1 1 }  { m_axi_D_BUS_RVALID VALID 0 1 }  { m_axi_D_BUS_RREADY READY 1 1 }  { m_axi_D_BUS_RDATA DATA 0 32 }  { m_axi_D_BUS_RLAST LAST 0 1 }  { m_axi_D_BUS_RID ID 0 1 }  { m_axi_D_BUS_RUSER USER 0 1 }  { m_axi_D_BUS_RRESP RESP 0 2 }  { m_axi_D_BUS_BVALID VALID 0 1 }  { m_axi_D_BUS_BREADY READY 1 1 }  { m_axi_D_BUS_BRESP RESP 0 2 }  { m_axi_D_BUS_BID ID 0 1 }  { m_axi_D_BUS_BUSER USER 0 1 } } }
}

set busDeadlockParameterList { 
	{ D_BUS { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ D_BUS 1 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ D_BUS 1 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
