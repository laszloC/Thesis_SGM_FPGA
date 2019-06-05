--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
--Date        : Wed Jun  5 20:44:41 2019
--Host        : Laszlo-LPT running 64-bit major release  (build 9200)
--Command     : generate_target bd_0.bd
--Design      : bd_0
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_0 is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    interrupt : out STD_LOGIC;
    m_axi_COST_BUS_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_COST_BUS_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_COST_BUS_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_COST_BUS_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_COST_BUS_arlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_COST_BUS_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_COST_BUS_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_COST_BUS_arready : in STD_LOGIC;
    m_axi_COST_BUS_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_COST_BUS_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_COST_BUS_arvalid : out STD_LOGIC;
    m_axi_COST_BUS_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_COST_BUS_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_COST_BUS_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_COST_BUS_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_COST_BUS_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_COST_BUS_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_COST_BUS_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_COST_BUS_awready : in STD_LOGIC;
    m_axi_COST_BUS_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_COST_BUS_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_COST_BUS_awvalid : out STD_LOGIC;
    m_axi_COST_BUS_bready : out STD_LOGIC;
    m_axi_COST_BUS_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_COST_BUS_bvalid : in STD_LOGIC;
    m_axi_COST_BUS_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_COST_BUS_rlast : in STD_LOGIC;
    m_axi_COST_BUS_rready : out STD_LOGIC;
    m_axi_COST_BUS_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_COST_BUS_rvalid : in STD_LOGIC;
    m_axi_COST_BUS_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_COST_BUS_wlast : out STD_LOGIC;
    m_axi_COST_BUS_wready : in STD_LOGIC;
    m_axi_COST_BUS_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_COST_BUS_wvalid : out STD_LOGIC;
    m_axi_IMG_BUS_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_IMG_BUS_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_IMG_BUS_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_IMG_BUS_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_IMG_BUS_arlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_IMG_BUS_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_IMG_BUS_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_IMG_BUS_arready : in STD_LOGIC;
    m_axi_IMG_BUS_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_IMG_BUS_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_IMG_BUS_arvalid : out STD_LOGIC;
    m_axi_IMG_BUS_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_IMG_BUS_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_IMG_BUS_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_IMG_BUS_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_IMG_BUS_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_IMG_BUS_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_IMG_BUS_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_IMG_BUS_awready : in STD_LOGIC;
    m_axi_IMG_BUS_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_IMG_BUS_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_IMG_BUS_awvalid : out STD_LOGIC;
    m_axi_IMG_BUS_bready : out STD_LOGIC;
    m_axi_IMG_BUS_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_IMG_BUS_bvalid : in STD_LOGIC;
    m_axi_IMG_BUS_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_IMG_BUS_rlast : in STD_LOGIC;
    m_axi_IMG_BUS_rready : out STD_LOGIC;
    m_axi_IMG_BUS_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_IMG_BUS_rvalid : in STD_LOGIC;
    m_axi_IMG_BUS_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_IMG_BUS_wlast : out STD_LOGIC;
    m_axi_IMG_BUS_wready : in STD_LOGIC;
    m_axi_IMG_BUS_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_IMG_BUS_wvalid : out STD_LOGIC;
    s_axi_IMG_BUS_araddr : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_IMG_BUS_arready : out STD_LOGIC;
    s_axi_IMG_BUS_arvalid : in STD_LOGIC;
    s_axi_IMG_BUS_awaddr : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_IMG_BUS_awready : out STD_LOGIC;
    s_axi_IMG_BUS_awvalid : in STD_LOGIC;
    s_axi_IMG_BUS_bready : in STD_LOGIC;
    s_axi_IMG_BUS_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_IMG_BUS_bvalid : out STD_LOGIC;
    s_axi_IMG_BUS_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_IMG_BUS_rready : in STD_LOGIC;
    s_axi_IMG_BUS_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_IMG_BUS_rvalid : out STD_LOGIC;
    s_axi_IMG_BUS_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_IMG_BUS_wready : out STD_LOGIC;
    s_axi_IMG_BUS_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_IMG_BUS_wvalid : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of bd_0 : entity is "bd_0,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_0,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=1,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of bd_0 : entity is "bd_0.hwdef";
end bd_0;

architecture STRUCTURE of bd_0 is
  component bd_0_hls_inst_0 is
  port (
    s_axi_IMG_BUS_AWADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_IMG_BUS_AWVALID : in STD_LOGIC;
    s_axi_IMG_BUS_AWREADY : out STD_LOGIC;
    s_axi_IMG_BUS_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_IMG_BUS_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_IMG_BUS_WVALID : in STD_LOGIC;
    s_axi_IMG_BUS_WREADY : out STD_LOGIC;
    s_axi_IMG_BUS_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_IMG_BUS_BVALID : out STD_LOGIC;
    s_axi_IMG_BUS_BREADY : in STD_LOGIC;
    s_axi_IMG_BUS_ARADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_IMG_BUS_ARVALID : in STD_LOGIC;
    s_axi_IMG_BUS_ARREADY : out STD_LOGIC;
    s_axi_IMG_BUS_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_IMG_BUS_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_IMG_BUS_RVALID : out STD_LOGIC;
    s_axi_IMG_BUS_RREADY : in STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    interrupt : out STD_LOGIC;
    m_axi_IMG_BUS_AWADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_IMG_BUS_AWLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_IMG_BUS_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_IMG_BUS_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_IMG_BUS_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_IMG_BUS_AWREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_IMG_BUS_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_IMG_BUS_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_IMG_BUS_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_IMG_BUS_AWVALID : out STD_LOGIC;
    m_axi_IMG_BUS_AWREADY : in STD_LOGIC;
    m_axi_IMG_BUS_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_IMG_BUS_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_IMG_BUS_WLAST : out STD_LOGIC;
    m_axi_IMG_BUS_WVALID : out STD_LOGIC;
    m_axi_IMG_BUS_WREADY : in STD_LOGIC;
    m_axi_IMG_BUS_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_IMG_BUS_BVALID : in STD_LOGIC;
    m_axi_IMG_BUS_BREADY : out STD_LOGIC;
    m_axi_IMG_BUS_ARADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_IMG_BUS_ARLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_IMG_BUS_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_IMG_BUS_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_IMG_BUS_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_IMG_BUS_ARREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_IMG_BUS_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_IMG_BUS_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_IMG_BUS_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_IMG_BUS_ARVALID : out STD_LOGIC;
    m_axi_IMG_BUS_ARREADY : in STD_LOGIC;
    m_axi_IMG_BUS_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_IMG_BUS_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_IMG_BUS_RLAST : in STD_LOGIC;
    m_axi_IMG_BUS_RVALID : in STD_LOGIC;
    m_axi_IMG_BUS_RREADY : out STD_LOGIC;
    m_axi_COST_BUS_AWADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_COST_BUS_AWLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_COST_BUS_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_COST_BUS_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_COST_BUS_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_COST_BUS_AWREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_COST_BUS_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_COST_BUS_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_COST_BUS_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_COST_BUS_AWVALID : out STD_LOGIC;
    m_axi_COST_BUS_AWREADY : in STD_LOGIC;
    m_axi_COST_BUS_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_COST_BUS_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_COST_BUS_WLAST : out STD_LOGIC;
    m_axi_COST_BUS_WVALID : out STD_LOGIC;
    m_axi_COST_BUS_WREADY : in STD_LOGIC;
    m_axi_COST_BUS_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_COST_BUS_BVALID : in STD_LOGIC;
    m_axi_COST_BUS_BREADY : out STD_LOGIC;
    m_axi_COST_BUS_ARADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_COST_BUS_ARLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_COST_BUS_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_COST_BUS_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_COST_BUS_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_COST_BUS_ARREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_COST_BUS_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_COST_BUS_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_COST_BUS_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_COST_BUS_ARVALID : out STD_LOGIC;
    m_axi_COST_BUS_ARREADY : in STD_LOGIC;
    m_axi_COST_BUS_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_COST_BUS_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_COST_BUS_RLAST : in STD_LOGIC;
    m_axi_COST_BUS_RVALID : in STD_LOGIC;
    m_axi_COST_BUS_RREADY : out STD_LOGIC
  );
  end component bd_0_hls_inst_0;
  signal ap_clk_0_1 : STD_LOGIC;
  signal ap_rst_n_0_1 : STD_LOGIC;
  signal hls_inst_interrupt : STD_LOGIC;
  signal hls_inst_m_axi_COST_BUS_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal hls_inst_m_axi_COST_BUS_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_COST_BUS_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_COST_BUS_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal hls_inst_m_axi_COST_BUS_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_COST_BUS_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal hls_inst_m_axi_COST_BUS_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_COST_BUS_ARREADY : STD_LOGIC;
  signal hls_inst_m_axi_COST_BUS_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_COST_BUS_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal hls_inst_m_axi_COST_BUS_ARVALID : STD_LOGIC;
  signal hls_inst_m_axi_COST_BUS_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal hls_inst_m_axi_COST_BUS_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_COST_BUS_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_COST_BUS_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal hls_inst_m_axi_COST_BUS_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_COST_BUS_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal hls_inst_m_axi_COST_BUS_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_COST_BUS_AWREADY : STD_LOGIC;
  signal hls_inst_m_axi_COST_BUS_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_COST_BUS_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal hls_inst_m_axi_COST_BUS_AWVALID : STD_LOGIC;
  signal hls_inst_m_axi_COST_BUS_BREADY : STD_LOGIC;
  signal hls_inst_m_axi_COST_BUS_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_COST_BUS_BVALID : STD_LOGIC;
  signal hls_inst_m_axi_COST_BUS_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal hls_inst_m_axi_COST_BUS_RLAST : STD_LOGIC;
  signal hls_inst_m_axi_COST_BUS_RREADY : STD_LOGIC;
  signal hls_inst_m_axi_COST_BUS_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_COST_BUS_RVALID : STD_LOGIC;
  signal hls_inst_m_axi_COST_BUS_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal hls_inst_m_axi_COST_BUS_WLAST : STD_LOGIC;
  signal hls_inst_m_axi_COST_BUS_WREADY : STD_LOGIC;
  signal hls_inst_m_axi_COST_BUS_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_COST_BUS_WVALID : STD_LOGIC;
  signal hls_inst_m_axi_IMG_BUS_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal hls_inst_m_axi_IMG_BUS_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_IMG_BUS_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_IMG_BUS_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal hls_inst_m_axi_IMG_BUS_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_IMG_BUS_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal hls_inst_m_axi_IMG_BUS_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_IMG_BUS_ARREADY : STD_LOGIC;
  signal hls_inst_m_axi_IMG_BUS_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_IMG_BUS_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal hls_inst_m_axi_IMG_BUS_ARVALID : STD_LOGIC;
  signal hls_inst_m_axi_IMG_BUS_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal hls_inst_m_axi_IMG_BUS_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_IMG_BUS_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_IMG_BUS_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal hls_inst_m_axi_IMG_BUS_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_IMG_BUS_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal hls_inst_m_axi_IMG_BUS_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_IMG_BUS_AWREADY : STD_LOGIC;
  signal hls_inst_m_axi_IMG_BUS_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_IMG_BUS_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal hls_inst_m_axi_IMG_BUS_AWVALID : STD_LOGIC;
  signal hls_inst_m_axi_IMG_BUS_BREADY : STD_LOGIC;
  signal hls_inst_m_axi_IMG_BUS_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_IMG_BUS_BVALID : STD_LOGIC;
  signal hls_inst_m_axi_IMG_BUS_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal hls_inst_m_axi_IMG_BUS_RLAST : STD_LOGIC;
  signal hls_inst_m_axi_IMG_BUS_RREADY : STD_LOGIC;
  signal hls_inst_m_axi_IMG_BUS_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_IMG_BUS_RVALID : STD_LOGIC;
  signal hls_inst_m_axi_IMG_BUS_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal hls_inst_m_axi_IMG_BUS_WLAST : STD_LOGIC;
  signal hls_inst_m_axi_IMG_BUS_WREADY : STD_LOGIC;
  signal hls_inst_m_axi_IMG_BUS_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_IMG_BUS_WVALID : STD_LOGIC;
  signal s_axi_IMG_BUS_0_1_ARADDR : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal s_axi_IMG_BUS_0_1_ARREADY : STD_LOGIC;
  signal s_axi_IMG_BUS_0_1_ARVALID : STD_LOGIC;
  signal s_axi_IMG_BUS_0_1_AWADDR : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal s_axi_IMG_BUS_0_1_AWREADY : STD_LOGIC;
  signal s_axi_IMG_BUS_0_1_AWVALID : STD_LOGIC;
  signal s_axi_IMG_BUS_0_1_BREADY : STD_LOGIC;
  signal s_axi_IMG_BUS_0_1_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s_axi_IMG_BUS_0_1_BVALID : STD_LOGIC;
  signal s_axi_IMG_BUS_0_1_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s_axi_IMG_BUS_0_1_RREADY : STD_LOGIC;
  signal s_axi_IMG_BUS_0_1_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s_axi_IMG_BUS_0_1_RVALID : STD_LOGIC;
  signal s_axi_IMG_BUS_0_1_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s_axi_IMG_BUS_0_1_WREADY : STD_LOGIC;
  signal s_axi_IMG_BUS_0_1_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s_axi_IMG_BUS_0_1_WVALID : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of ap_clk : signal is "xilinx.com:signal:clock:1.0 CLK.AP_CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of ap_clk : signal is "XIL_INTERFACENAME CLK.AP_CLK, ASSOCIATED_BUSIF m_axi_COST_BUS:m_axi_IMG_BUS:s_axi_IMG_BUS, ASSOCIATED_RESET ap_rst_n, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 100000000.0, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of ap_rst_n : signal is "xilinx.com:signal:reset:1.0 RST.AP_RST_N RST";
  attribute X_INTERFACE_PARAMETER of ap_rst_n : signal is "XIL_INTERFACENAME RST.AP_RST_N, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of interrupt : signal is "xilinx.com:signal:interrupt:1.0 INTR.INTERRUPT INTERRUPT";
  attribute X_INTERFACE_PARAMETER of interrupt : signal is "XIL_INTERFACENAME INTR.INTERRUPT, PortWidth 1, SENSITIVITY LEVEL_HIGH";
  attribute X_INTERFACE_INFO of m_axi_COST_BUS_arready : signal is "xilinx.com:interface:aximm:1.0 m_axi_COST_BUS ";
  attribute X_INTERFACE_INFO of m_axi_COST_BUS_arvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_COST_BUS ";
  attribute X_INTERFACE_INFO of m_axi_COST_BUS_awready : signal is "xilinx.com:interface:aximm:1.0 m_axi_COST_BUS ";
  attribute X_INTERFACE_INFO of m_axi_COST_BUS_awvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_COST_BUS ";
  attribute X_INTERFACE_INFO of m_axi_COST_BUS_bready : signal is "xilinx.com:interface:aximm:1.0 m_axi_COST_BUS ";
  attribute X_INTERFACE_INFO of m_axi_COST_BUS_bvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_COST_BUS ";
  attribute X_INTERFACE_INFO of m_axi_COST_BUS_rlast : signal is "xilinx.com:interface:aximm:1.0 m_axi_COST_BUS ";
  attribute X_INTERFACE_INFO of m_axi_COST_BUS_rready : signal is "xilinx.com:interface:aximm:1.0 m_axi_COST_BUS ";
  attribute X_INTERFACE_INFO of m_axi_COST_BUS_rvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_COST_BUS ";
  attribute X_INTERFACE_INFO of m_axi_COST_BUS_wlast : signal is "xilinx.com:interface:aximm:1.0 m_axi_COST_BUS ";
  attribute X_INTERFACE_INFO of m_axi_COST_BUS_wready : signal is "xilinx.com:interface:aximm:1.0 m_axi_COST_BUS ";
  attribute X_INTERFACE_INFO of m_axi_COST_BUS_wvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_COST_BUS ";
  attribute X_INTERFACE_INFO of m_axi_IMG_BUS_arready : signal is "xilinx.com:interface:aximm:1.0 m_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of m_axi_IMG_BUS_arvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of m_axi_IMG_BUS_awready : signal is "xilinx.com:interface:aximm:1.0 m_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of m_axi_IMG_BUS_awvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of m_axi_IMG_BUS_bready : signal is "xilinx.com:interface:aximm:1.0 m_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of m_axi_IMG_BUS_bvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of m_axi_IMG_BUS_rlast : signal is "xilinx.com:interface:aximm:1.0 m_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of m_axi_IMG_BUS_rready : signal is "xilinx.com:interface:aximm:1.0 m_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of m_axi_IMG_BUS_rvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of m_axi_IMG_BUS_wlast : signal is "xilinx.com:interface:aximm:1.0 m_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of m_axi_IMG_BUS_wready : signal is "xilinx.com:interface:aximm:1.0 m_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of m_axi_IMG_BUS_wvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of s_axi_IMG_BUS_arready : signal is "xilinx.com:interface:aximm:1.0 s_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of s_axi_IMG_BUS_arvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of s_axi_IMG_BUS_awready : signal is "xilinx.com:interface:aximm:1.0 s_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of s_axi_IMG_BUS_awvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of s_axi_IMG_BUS_bready : signal is "xilinx.com:interface:aximm:1.0 s_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of s_axi_IMG_BUS_bvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of s_axi_IMG_BUS_rready : signal is "xilinx.com:interface:aximm:1.0 s_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of s_axi_IMG_BUS_rvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of s_axi_IMG_BUS_wready : signal is "xilinx.com:interface:aximm:1.0 s_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of s_axi_IMG_BUS_wvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of m_axi_COST_BUS_araddr : signal is "xilinx.com:interface:aximm:1.0 m_axi_COST_BUS ";
  attribute X_INTERFACE_PARAMETER of m_axi_COST_BUS_araddr : signal is "XIL_INTERFACENAME m_axi_COST_BUS, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN bd_0_ap_clk_0, DATA_WIDTH 32, FREQ_HZ 100000000.0, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 1, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 16, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 16, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of m_axi_COST_BUS_arburst : signal is "xilinx.com:interface:aximm:1.0 m_axi_COST_BUS ";
  attribute X_INTERFACE_INFO of m_axi_COST_BUS_arcache : signal is "xilinx.com:interface:aximm:1.0 m_axi_COST_BUS ";
  attribute X_INTERFACE_INFO of m_axi_COST_BUS_arlen : signal is "xilinx.com:interface:aximm:1.0 m_axi_COST_BUS ";
  attribute X_INTERFACE_INFO of m_axi_COST_BUS_arlock : signal is "xilinx.com:interface:aximm:1.0 m_axi_COST_BUS ";
  attribute X_INTERFACE_INFO of m_axi_COST_BUS_arprot : signal is "xilinx.com:interface:aximm:1.0 m_axi_COST_BUS ";
  attribute X_INTERFACE_INFO of m_axi_COST_BUS_arqos : signal is "xilinx.com:interface:aximm:1.0 m_axi_COST_BUS ";
  attribute X_INTERFACE_INFO of m_axi_COST_BUS_arregion : signal is "xilinx.com:interface:aximm:1.0 m_axi_COST_BUS ";
  attribute X_INTERFACE_INFO of m_axi_COST_BUS_arsize : signal is "xilinx.com:interface:aximm:1.0 m_axi_COST_BUS ";
  attribute X_INTERFACE_INFO of m_axi_COST_BUS_awaddr : signal is "xilinx.com:interface:aximm:1.0 m_axi_COST_BUS ";
  attribute X_INTERFACE_INFO of m_axi_COST_BUS_awburst : signal is "xilinx.com:interface:aximm:1.0 m_axi_COST_BUS ";
  attribute X_INTERFACE_INFO of m_axi_COST_BUS_awcache : signal is "xilinx.com:interface:aximm:1.0 m_axi_COST_BUS ";
  attribute X_INTERFACE_INFO of m_axi_COST_BUS_awlen : signal is "xilinx.com:interface:aximm:1.0 m_axi_COST_BUS ";
  attribute X_INTERFACE_INFO of m_axi_COST_BUS_awlock : signal is "xilinx.com:interface:aximm:1.0 m_axi_COST_BUS ";
  attribute X_INTERFACE_INFO of m_axi_COST_BUS_awprot : signal is "xilinx.com:interface:aximm:1.0 m_axi_COST_BUS ";
  attribute X_INTERFACE_INFO of m_axi_COST_BUS_awqos : signal is "xilinx.com:interface:aximm:1.0 m_axi_COST_BUS ";
  attribute X_INTERFACE_INFO of m_axi_COST_BUS_awregion : signal is "xilinx.com:interface:aximm:1.0 m_axi_COST_BUS ";
  attribute X_INTERFACE_INFO of m_axi_COST_BUS_awsize : signal is "xilinx.com:interface:aximm:1.0 m_axi_COST_BUS ";
  attribute X_INTERFACE_INFO of m_axi_COST_BUS_bresp : signal is "xilinx.com:interface:aximm:1.0 m_axi_COST_BUS ";
  attribute X_INTERFACE_INFO of m_axi_COST_BUS_rdata : signal is "xilinx.com:interface:aximm:1.0 m_axi_COST_BUS ";
  attribute X_INTERFACE_INFO of m_axi_COST_BUS_rresp : signal is "xilinx.com:interface:aximm:1.0 m_axi_COST_BUS ";
  attribute X_INTERFACE_INFO of m_axi_COST_BUS_wdata : signal is "xilinx.com:interface:aximm:1.0 m_axi_COST_BUS ";
  attribute X_INTERFACE_INFO of m_axi_COST_BUS_wstrb : signal is "xilinx.com:interface:aximm:1.0 m_axi_COST_BUS ";
  attribute X_INTERFACE_INFO of m_axi_IMG_BUS_araddr : signal is "xilinx.com:interface:aximm:1.0 m_axi_IMG_BUS ";
  attribute X_INTERFACE_PARAMETER of m_axi_IMG_BUS_araddr : signal is "XIL_INTERFACENAME m_axi_IMG_BUS, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN bd_0_ap_clk_0, DATA_WIDTH 32, FREQ_HZ 100000000.0, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 1, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 16, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 16, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of m_axi_IMG_BUS_arburst : signal is "xilinx.com:interface:aximm:1.0 m_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of m_axi_IMG_BUS_arcache : signal is "xilinx.com:interface:aximm:1.0 m_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of m_axi_IMG_BUS_arlen : signal is "xilinx.com:interface:aximm:1.0 m_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of m_axi_IMG_BUS_arlock : signal is "xilinx.com:interface:aximm:1.0 m_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of m_axi_IMG_BUS_arprot : signal is "xilinx.com:interface:aximm:1.0 m_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of m_axi_IMG_BUS_arqos : signal is "xilinx.com:interface:aximm:1.0 m_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of m_axi_IMG_BUS_arregion : signal is "xilinx.com:interface:aximm:1.0 m_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of m_axi_IMG_BUS_arsize : signal is "xilinx.com:interface:aximm:1.0 m_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of m_axi_IMG_BUS_awaddr : signal is "xilinx.com:interface:aximm:1.0 m_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of m_axi_IMG_BUS_awburst : signal is "xilinx.com:interface:aximm:1.0 m_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of m_axi_IMG_BUS_awcache : signal is "xilinx.com:interface:aximm:1.0 m_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of m_axi_IMG_BUS_awlen : signal is "xilinx.com:interface:aximm:1.0 m_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of m_axi_IMG_BUS_awlock : signal is "xilinx.com:interface:aximm:1.0 m_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of m_axi_IMG_BUS_awprot : signal is "xilinx.com:interface:aximm:1.0 m_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of m_axi_IMG_BUS_awqos : signal is "xilinx.com:interface:aximm:1.0 m_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of m_axi_IMG_BUS_awregion : signal is "xilinx.com:interface:aximm:1.0 m_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of m_axi_IMG_BUS_awsize : signal is "xilinx.com:interface:aximm:1.0 m_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of m_axi_IMG_BUS_bresp : signal is "xilinx.com:interface:aximm:1.0 m_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of m_axi_IMG_BUS_rdata : signal is "xilinx.com:interface:aximm:1.0 m_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of m_axi_IMG_BUS_rresp : signal is "xilinx.com:interface:aximm:1.0 m_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of m_axi_IMG_BUS_wdata : signal is "xilinx.com:interface:aximm:1.0 m_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of m_axi_IMG_BUS_wstrb : signal is "xilinx.com:interface:aximm:1.0 m_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of s_axi_IMG_BUS_araddr : signal is "xilinx.com:interface:aximm:1.0 s_axi_IMG_BUS ";
  attribute X_INTERFACE_PARAMETER of s_axi_IMG_BUS_araddr : signal is "XIL_INTERFACENAME s_axi_IMG_BUS, ADDR_WIDTH 12, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN bd_0_ap_clk_0, DATA_WIDTH 32, FREQ_HZ 100000000.0, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 0, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of s_axi_IMG_BUS_awaddr : signal is "xilinx.com:interface:aximm:1.0 s_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of s_axi_IMG_BUS_bresp : signal is "xilinx.com:interface:aximm:1.0 s_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of s_axi_IMG_BUS_rdata : signal is "xilinx.com:interface:aximm:1.0 s_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of s_axi_IMG_BUS_rresp : signal is "xilinx.com:interface:aximm:1.0 s_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of s_axi_IMG_BUS_wdata : signal is "xilinx.com:interface:aximm:1.0 s_axi_IMG_BUS ";
  attribute X_INTERFACE_INFO of s_axi_IMG_BUS_wstrb : signal is "xilinx.com:interface:aximm:1.0 s_axi_IMG_BUS ";
begin
  ap_clk_0_1 <= ap_clk;
  ap_rst_n_0_1 <= ap_rst_n;
  hls_inst_m_axi_COST_BUS_ARREADY <= m_axi_COST_BUS_arready;
  hls_inst_m_axi_COST_BUS_AWREADY <= m_axi_COST_BUS_awready;
  hls_inst_m_axi_COST_BUS_BRESP(1 downto 0) <= m_axi_COST_BUS_bresp(1 downto 0);
  hls_inst_m_axi_COST_BUS_BVALID <= m_axi_COST_BUS_bvalid;
  hls_inst_m_axi_COST_BUS_RDATA(31 downto 0) <= m_axi_COST_BUS_rdata(31 downto 0);
  hls_inst_m_axi_COST_BUS_RLAST <= m_axi_COST_BUS_rlast;
  hls_inst_m_axi_COST_BUS_RRESP(1 downto 0) <= m_axi_COST_BUS_rresp(1 downto 0);
  hls_inst_m_axi_COST_BUS_RVALID <= m_axi_COST_BUS_rvalid;
  hls_inst_m_axi_COST_BUS_WREADY <= m_axi_COST_BUS_wready;
  hls_inst_m_axi_IMG_BUS_ARREADY <= m_axi_IMG_BUS_arready;
  hls_inst_m_axi_IMG_BUS_AWREADY <= m_axi_IMG_BUS_awready;
  hls_inst_m_axi_IMG_BUS_BRESP(1 downto 0) <= m_axi_IMG_BUS_bresp(1 downto 0);
  hls_inst_m_axi_IMG_BUS_BVALID <= m_axi_IMG_BUS_bvalid;
  hls_inst_m_axi_IMG_BUS_RDATA(31 downto 0) <= m_axi_IMG_BUS_rdata(31 downto 0);
  hls_inst_m_axi_IMG_BUS_RLAST <= m_axi_IMG_BUS_rlast;
  hls_inst_m_axi_IMG_BUS_RRESP(1 downto 0) <= m_axi_IMG_BUS_rresp(1 downto 0);
  hls_inst_m_axi_IMG_BUS_RVALID <= m_axi_IMG_BUS_rvalid;
  hls_inst_m_axi_IMG_BUS_WREADY <= m_axi_IMG_BUS_wready;
  interrupt <= hls_inst_interrupt;
  m_axi_COST_BUS_araddr(31 downto 0) <= hls_inst_m_axi_COST_BUS_ARADDR(31 downto 0);
  m_axi_COST_BUS_arburst(1 downto 0) <= hls_inst_m_axi_COST_BUS_ARBURST(1 downto 0);
  m_axi_COST_BUS_arcache(3 downto 0) <= hls_inst_m_axi_COST_BUS_ARCACHE(3 downto 0);
  m_axi_COST_BUS_arlen(7 downto 0) <= hls_inst_m_axi_COST_BUS_ARLEN(7 downto 0);
  m_axi_COST_BUS_arlock(1 downto 0) <= hls_inst_m_axi_COST_BUS_ARLOCK(1 downto 0);
  m_axi_COST_BUS_arprot(2 downto 0) <= hls_inst_m_axi_COST_BUS_ARPROT(2 downto 0);
  m_axi_COST_BUS_arqos(3 downto 0) <= hls_inst_m_axi_COST_BUS_ARQOS(3 downto 0);
  m_axi_COST_BUS_arregion(3 downto 0) <= hls_inst_m_axi_COST_BUS_ARREGION(3 downto 0);
  m_axi_COST_BUS_arsize(2 downto 0) <= hls_inst_m_axi_COST_BUS_ARSIZE(2 downto 0);
  m_axi_COST_BUS_arvalid <= hls_inst_m_axi_COST_BUS_ARVALID;
  m_axi_COST_BUS_awaddr(31 downto 0) <= hls_inst_m_axi_COST_BUS_AWADDR(31 downto 0);
  m_axi_COST_BUS_awburst(1 downto 0) <= hls_inst_m_axi_COST_BUS_AWBURST(1 downto 0);
  m_axi_COST_BUS_awcache(3 downto 0) <= hls_inst_m_axi_COST_BUS_AWCACHE(3 downto 0);
  m_axi_COST_BUS_awlen(7 downto 0) <= hls_inst_m_axi_COST_BUS_AWLEN(7 downto 0);
  m_axi_COST_BUS_awlock(1 downto 0) <= hls_inst_m_axi_COST_BUS_AWLOCK(1 downto 0);
  m_axi_COST_BUS_awprot(2 downto 0) <= hls_inst_m_axi_COST_BUS_AWPROT(2 downto 0);
  m_axi_COST_BUS_awqos(3 downto 0) <= hls_inst_m_axi_COST_BUS_AWQOS(3 downto 0);
  m_axi_COST_BUS_awregion(3 downto 0) <= hls_inst_m_axi_COST_BUS_AWREGION(3 downto 0);
  m_axi_COST_BUS_awsize(2 downto 0) <= hls_inst_m_axi_COST_BUS_AWSIZE(2 downto 0);
  m_axi_COST_BUS_awvalid <= hls_inst_m_axi_COST_BUS_AWVALID;
  m_axi_COST_BUS_bready <= hls_inst_m_axi_COST_BUS_BREADY;
  m_axi_COST_BUS_rready <= hls_inst_m_axi_COST_BUS_RREADY;
  m_axi_COST_BUS_wdata(31 downto 0) <= hls_inst_m_axi_COST_BUS_WDATA(31 downto 0);
  m_axi_COST_BUS_wlast <= hls_inst_m_axi_COST_BUS_WLAST;
  m_axi_COST_BUS_wstrb(3 downto 0) <= hls_inst_m_axi_COST_BUS_WSTRB(3 downto 0);
  m_axi_COST_BUS_wvalid <= hls_inst_m_axi_COST_BUS_WVALID;
  m_axi_IMG_BUS_araddr(31 downto 0) <= hls_inst_m_axi_IMG_BUS_ARADDR(31 downto 0);
  m_axi_IMG_BUS_arburst(1 downto 0) <= hls_inst_m_axi_IMG_BUS_ARBURST(1 downto 0);
  m_axi_IMG_BUS_arcache(3 downto 0) <= hls_inst_m_axi_IMG_BUS_ARCACHE(3 downto 0);
  m_axi_IMG_BUS_arlen(7 downto 0) <= hls_inst_m_axi_IMG_BUS_ARLEN(7 downto 0);
  m_axi_IMG_BUS_arlock(1 downto 0) <= hls_inst_m_axi_IMG_BUS_ARLOCK(1 downto 0);
  m_axi_IMG_BUS_arprot(2 downto 0) <= hls_inst_m_axi_IMG_BUS_ARPROT(2 downto 0);
  m_axi_IMG_BUS_arqos(3 downto 0) <= hls_inst_m_axi_IMG_BUS_ARQOS(3 downto 0);
  m_axi_IMG_BUS_arregion(3 downto 0) <= hls_inst_m_axi_IMG_BUS_ARREGION(3 downto 0);
  m_axi_IMG_BUS_arsize(2 downto 0) <= hls_inst_m_axi_IMG_BUS_ARSIZE(2 downto 0);
  m_axi_IMG_BUS_arvalid <= hls_inst_m_axi_IMG_BUS_ARVALID;
  m_axi_IMG_BUS_awaddr(31 downto 0) <= hls_inst_m_axi_IMG_BUS_AWADDR(31 downto 0);
  m_axi_IMG_BUS_awburst(1 downto 0) <= hls_inst_m_axi_IMG_BUS_AWBURST(1 downto 0);
  m_axi_IMG_BUS_awcache(3 downto 0) <= hls_inst_m_axi_IMG_BUS_AWCACHE(3 downto 0);
  m_axi_IMG_BUS_awlen(7 downto 0) <= hls_inst_m_axi_IMG_BUS_AWLEN(7 downto 0);
  m_axi_IMG_BUS_awlock(1 downto 0) <= hls_inst_m_axi_IMG_BUS_AWLOCK(1 downto 0);
  m_axi_IMG_BUS_awprot(2 downto 0) <= hls_inst_m_axi_IMG_BUS_AWPROT(2 downto 0);
  m_axi_IMG_BUS_awqos(3 downto 0) <= hls_inst_m_axi_IMG_BUS_AWQOS(3 downto 0);
  m_axi_IMG_BUS_awregion(3 downto 0) <= hls_inst_m_axi_IMG_BUS_AWREGION(3 downto 0);
  m_axi_IMG_BUS_awsize(2 downto 0) <= hls_inst_m_axi_IMG_BUS_AWSIZE(2 downto 0);
  m_axi_IMG_BUS_awvalid <= hls_inst_m_axi_IMG_BUS_AWVALID;
  m_axi_IMG_BUS_bready <= hls_inst_m_axi_IMG_BUS_BREADY;
  m_axi_IMG_BUS_rready <= hls_inst_m_axi_IMG_BUS_RREADY;
  m_axi_IMG_BUS_wdata(31 downto 0) <= hls_inst_m_axi_IMG_BUS_WDATA(31 downto 0);
  m_axi_IMG_BUS_wlast <= hls_inst_m_axi_IMG_BUS_WLAST;
  m_axi_IMG_BUS_wstrb(3 downto 0) <= hls_inst_m_axi_IMG_BUS_WSTRB(3 downto 0);
  m_axi_IMG_BUS_wvalid <= hls_inst_m_axi_IMG_BUS_WVALID;
  s_axi_IMG_BUS_0_1_ARADDR(5 downto 0) <= s_axi_IMG_BUS_araddr(5 downto 0);
  s_axi_IMG_BUS_0_1_ARVALID <= s_axi_IMG_BUS_arvalid;
  s_axi_IMG_BUS_0_1_AWADDR(5 downto 0) <= s_axi_IMG_BUS_awaddr(5 downto 0);
  s_axi_IMG_BUS_0_1_AWVALID <= s_axi_IMG_BUS_awvalid;
  s_axi_IMG_BUS_0_1_BREADY <= s_axi_IMG_BUS_bready;
  s_axi_IMG_BUS_0_1_RREADY <= s_axi_IMG_BUS_rready;
  s_axi_IMG_BUS_0_1_WDATA(31 downto 0) <= s_axi_IMG_BUS_wdata(31 downto 0);
  s_axi_IMG_BUS_0_1_WSTRB(3 downto 0) <= s_axi_IMG_BUS_wstrb(3 downto 0);
  s_axi_IMG_BUS_0_1_WVALID <= s_axi_IMG_BUS_wvalid;
  s_axi_IMG_BUS_arready <= s_axi_IMG_BUS_0_1_ARREADY;
  s_axi_IMG_BUS_awready <= s_axi_IMG_BUS_0_1_AWREADY;
  s_axi_IMG_BUS_bresp(1 downto 0) <= s_axi_IMG_BUS_0_1_BRESP(1 downto 0);
  s_axi_IMG_BUS_bvalid <= s_axi_IMG_BUS_0_1_BVALID;
  s_axi_IMG_BUS_rdata(31 downto 0) <= s_axi_IMG_BUS_0_1_RDATA(31 downto 0);
  s_axi_IMG_BUS_rresp(1 downto 0) <= s_axi_IMG_BUS_0_1_RRESP(1 downto 0);
  s_axi_IMG_BUS_rvalid <= s_axi_IMG_BUS_0_1_RVALID;
  s_axi_IMG_BUS_wready <= s_axi_IMG_BUS_0_1_WREADY;
hls_inst: component bd_0_hls_inst_0
     port map (
      ap_clk => ap_clk_0_1,
      ap_rst_n => ap_rst_n_0_1,
      interrupt => hls_inst_interrupt,
      m_axi_COST_BUS_ARADDR(31 downto 0) => hls_inst_m_axi_COST_BUS_ARADDR(31 downto 0),
      m_axi_COST_BUS_ARBURST(1 downto 0) => hls_inst_m_axi_COST_BUS_ARBURST(1 downto 0),
      m_axi_COST_BUS_ARCACHE(3 downto 0) => hls_inst_m_axi_COST_BUS_ARCACHE(3 downto 0),
      m_axi_COST_BUS_ARLEN(7 downto 0) => hls_inst_m_axi_COST_BUS_ARLEN(7 downto 0),
      m_axi_COST_BUS_ARLOCK(1 downto 0) => hls_inst_m_axi_COST_BUS_ARLOCK(1 downto 0),
      m_axi_COST_BUS_ARPROT(2 downto 0) => hls_inst_m_axi_COST_BUS_ARPROT(2 downto 0),
      m_axi_COST_BUS_ARQOS(3 downto 0) => hls_inst_m_axi_COST_BUS_ARQOS(3 downto 0),
      m_axi_COST_BUS_ARREADY => hls_inst_m_axi_COST_BUS_ARREADY,
      m_axi_COST_BUS_ARREGION(3 downto 0) => hls_inst_m_axi_COST_BUS_ARREGION(3 downto 0),
      m_axi_COST_BUS_ARSIZE(2 downto 0) => hls_inst_m_axi_COST_BUS_ARSIZE(2 downto 0),
      m_axi_COST_BUS_ARVALID => hls_inst_m_axi_COST_BUS_ARVALID,
      m_axi_COST_BUS_AWADDR(31 downto 0) => hls_inst_m_axi_COST_BUS_AWADDR(31 downto 0),
      m_axi_COST_BUS_AWBURST(1 downto 0) => hls_inst_m_axi_COST_BUS_AWBURST(1 downto 0),
      m_axi_COST_BUS_AWCACHE(3 downto 0) => hls_inst_m_axi_COST_BUS_AWCACHE(3 downto 0),
      m_axi_COST_BUS_AWLEN(7 downto 0) => hls_inst_m_axi_COST_BUS_AWLEN(7 downto 0),
      m_axi_COST_BUS_AWLOCK(1 downto 0) => hls_inst_m_axi_COST_BUS_AWLOCK(1 downto 0),
      m_axi_COST_BUS_AWPROT(2 downto 0) => hls_inst_m_axi_COST_BUS_AWPROT(2 downto 0),
      m_axi_COST_BUS_AWQOS(3 downto 0) => hls_inst_m_axi_COST_BUS_AWQOS(3 downto 0),
      m_axi_COST_BUS_AWREADY => hls_inst_m_axi_COST_BUS_AWREADY,
      m_axi_COST_BUS_AWREGION(3 downto 0) => hls_inst_m_axi_COST_BUS_AWREGION(3 downto 0),
      m_axi_COST_BUS_AWSIZE(2 downto 0) => hls_inst_m_axi_COST_BUS_AWSIZE(2 downto 0),
      m_axi_COST_BUS_AWVALID => hls_inst_m_axi_COST_BUS_AWVALID,
      m_axi_COST_BUS_BREADY => hls_inst_m_axi_COST_BUS_BREADY,
      m_axi_COST_BUS_BRESP(1 downto 0) => hls_inst_m_axi_COST_BUS_BRESP(1 downto 0),
      m_axi_COST_BUS_BVALID => hls_inst_m_axi_COST_BUS_BVALID,
      m_axi_COST_BUS_RDATA(31 downto 0) => hls_inst_m_axi_COST_BUS_RDATA(31 downto 0),
      m_axi_COST_BUS_RLAST => hls_inst_m_axi_COST_BUS_RLAST,
      m_axi_COST_BUS_RREADY => hls_inst_m_axi_COST_BUS_RREADY,
      m_axi_COST_BUS_RRESP(1 downto 0) => hls_inst_m_axi_COST_BUS_RRESP(1 downto 0),
      m_axi_COST_BUS_RVALID => hls_inst_m_axi_COST_BUS_RVALID,
      m_axi_COST_BUS_WDATA(31 downto 0) => hls_inst_m_axi_COST_BUS_WDATA(31 downto 0),
      m_axi_COST_BUS_WLAST => hls_inst_m_axi_COST_BUS_WLAST,
      m_axi_COST_BUS_WREADY => hls_inst_m_axi_COST_BUS_WREADY,
      m_axi_COST_BUS_WSTRB(3 downto 0) => hls_inst_m_axi_COST_BUS_WSTRB(3 downto 0),
      m_axi_COST_BUS_WVALID => hls_inst_m_axi_COST_BUS_WVALID,
      m_axi_IMG_BUS_ARADDR(31 downto 0) => hls_inst_m_axi_IMG_BUS_ARADDR(31 downto 0),
      m_axi_IMG_BUS_ARBURST(1 downto 0) => hls_inst_m_axi_IMG_BUS_ARBURST(1 downto 0),
      m_axi_IMG_BUS_ARCACHE(3 downto 0) => hls_inst_m_axi_IMG_BUS_ARCACHE(3 downto 0),
      m_axi_IMG_BUS_ARLEN(7 downto 0) => hls_inst_m_axi_IMG_BUS_ARLEN(7 downto 0),
      m_axi_IMG_BUS_ARLOCK(1 downto 0) => hls_inst_m_axi_IMG_BUS_ARLOCK(1 downto 0),
      m_axi_IMG_BUS_ARPROT(2 downto 0) => hls_inst_m_axi_IMG_BUS_ARPROT(2 downto 0),
      m_axi_IMG_BUS_ARQOS(3 downto 0) => hls_inst_m_axi_IMG_BUS_ARQOS(3 downto 0),
      m_axi_IMG_BUS_ARREADY => hls_inst_m_axi_IMG_BUS_ARREADY,
      m_axi_IMG_BUS_ARREGION(3 downto 0) => hls_inst_m_axi_IMG_BUS_ARREGION(3 downto 0),
      m_axi_IMG_BUS_ARSIZE(2 downto 0) => hls_inst_m_axi_IMG_BUS_ARSIZE(2 downto 0),
      m_axi_IMG_BUS_ARVALID => hls_inst_m_axi_IMG_BUS_ARVALID,
      m_axi_IMG_BUS_AWADDR(31 downto 0) => hls_inst_m_axi_IMG_BUS_AWADDR(31 downto 0),
      m_axi_IMG_BUS_AWBURST(1 downto 0) => hls_inst_m_axi_IMG_BUS_AWBURST(1 downto 0),
      m_axi_IMG_BUS_AWCACHE(3 downto 0) => hls_inst_m_axi_IMG_BUS_AWCACHE(3 downto 0),
      m_axi_IMG_BUS_AWLEN(7 downto 0) => hls_inst_m_axi_IMG_BUS_AWLEN(7 downto 0),
      m_axi_IMG_BUS_AWLOCK(1 downto 0) => hls_inst_m_axi_IMG_BUS_AWLOCK(1 downto 0),
      m_axi_IMG_BUS_AWPROT(2 downto 0) => hls_inst_m_axi_IMG_BUS_AWPROT(2 downto 0),
      m_axi_IMG_BUS_AWQOS(3 downto 0) => hls_inst_m_axi_IMG_BUS_AWQOS(3 downto 0),
      m_axi_IMG_BUS_AWREADY => hls_inst_m_axi_IMG_BUS_AWREADY,
      m_axi_IMG_BUS_AWREGION(3 downto 0) => hls_inst_m_axi_IMG_BUS_AWREGION(3 downto 0),
      m_axi_IMG_BUS_AWSIZE(2 downto 0) => hls_inst_m_axi_IMG_BUS_AWSIZE(2 downto 0),
      m_axi_IMG_BUS_AWVALID => hls_inst_m_axi_IMG_BUS_AWVALID,
      m_axi_IMG_BUS_BREADY => hls_inst_m_axi_IMG_BUS_BREADY,
      m_axi_IMG_BUS_BRESP(1 downto 0) => hls_inst_m_axi_IMG_BUS_BRESP(1 downto 0),
      m_axi_IMG_BUS_BVALID => hls_inst_m_axi_IMG_BUS_BVALID,
      m_axi_IMG_BUS_RDATA(31 downto 0) => hls_inst_m_axi_IMG_BUS_RDATA(31 downto 0),
      m_axi_IMG_BUS_RLAST => hls_inst_m_axi_IMG_BUS_RLAST,
      m_axi_IMG_BUS_RREADY => hls_inst_m_axi_IMG_BUS_RREADY,
      m_axi_IMG_BUS_RRESP(1 downto 0) => hls_inst_m_axi_IMG_BUS_RRESP(1 downto 0),
      m_axi_IMG_BUS_RVALID => hls_inst_m_axi_IMG_BUS_RVALID,
      m_axi_IMG_BUS_WDATA(31 downto 0) => hls_inst_m_axi_IMG_BUS_WDATA(31 downto 0),
      m_axi_IMG_BUS_WLAST => hls_inst_m_axi_IMG_BUS_WLAST,
      m_axi_IMG_BUS_WREADY => hls_inst_m_axi_IMG_BUS_WREADY,
      m_axi_IMG_BUS_WSTRB(3 downto 0) => hls_inst_m_axi_IMG_BUS_WSTRB(3 downto 0),
      m_axi_IMG_BUS_WVALID => hls_inst_m_axi_IMG_BUS_WVALID,
      s_axi_IMG_BUS_ARADDR(5 downto 0) => s_axi_IMG_BUS_0_1_ARADDR(5 downto 0),
      s_axi_IMG_BUS_ARREADY => s_axi_IMG_BUS_0_1_ARREADY,
      s_axi_IMG_BUS_ARVALID => s_axi_IMG_BUS_0_1_ARVALID,
      s_axi_IMG_BUS_AWADDR(5 downto 0) => s_axi_IMG_BUS_0_1_AWADDR(5 downto 0),
      s_axi_IMG_BUS_AWREADY => s_axi_IMG_BUS_0_1_AWREADY,
      s_axi_IMG_BUS_AWVALID => s_axi_IMG_BUS_0_1_AWVALID,
      s_axi_IMG_BUS_BREADY => s_axi_IMG_BUS_0_1_BREADY,
      s_axi_IMG_BUS_BRESP(1 downto 0) => s_axi_IMG_BUS_0_1_BRESP(1 downto 0),
      s_axi_IMG_BUS_BVALID => s_axi_IMG_BUS_0_1_BVALID,
      s_axi_IMG_BUS_RDATA(31 downto 0) => s_axi_IMG_BUS_0_1_RDATA(31 downto 0),
      s_axi_IMG_BUS_RREADY => s_axi_IMG_BUS_0_1_RREADY,
      s_axi_IMG_BUS_RRESP(1 downto 0) => s_axi_IMG_BUS_0_1_RRESP(1 downto 0),
      s_axi_IMG_BUS_RVALID => s_axi_IMG_BUS_0_1_RVALID,
      s_axi_IMG_BUS_WDATA(31 downto 0) => s_axi_IMG_BUS_0_1_WDATA(31 downto 0),
      s_axi_IMG_BUS_WREADY => s_axi_IMG_BUS_0_1_WREADY,
      s_axi_IMG_BUS_WSTRB(3 downto 0) => s_axi_IMG_BUS_0_1_WSTRB(3 downto 0),
      s_axi_IMG_BUS_WVALID => s_axi_IMG_BUS_0_1_WVALID
    );
end STRUCTURE;
