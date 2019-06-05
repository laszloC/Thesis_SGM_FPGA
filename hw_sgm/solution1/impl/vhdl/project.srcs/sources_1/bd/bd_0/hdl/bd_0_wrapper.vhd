--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
--Date        : Wed Jun  5 20:44:41 2019
--Host        : Laszlo-LPT running 64-bit major release  (build 9200)
--Command     : generate_target bd_0_wrapper.bd
--Design      : bd_0_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_0_wrapper is
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
end bd_0_wrapper;

architecture STRUCTURE of bd_0_wrapper is
  component bd_0 is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    interrupt : out STD_LOGIC;
    m_axi_COST_BUS_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_COST_BUS_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_COST_BUS_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_COST_BUS_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_COST_BUS_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_COST_BUS_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_COST_BUS_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_COST_BUS_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_COST_BUS_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_COST_BUS_awvalid : out STD_LOGIC;
    m_axi_COST_BUS_awready : in STD_LOGIC;
    m_axi_COST_BUS_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_COST_BUS_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_COST_BUS_wlast : out STD_LOGIC;
    m_axi_COST_BUS_wvalid : out STD_LOGIC;
    m_axi_COST_BUS_wready : in STD_LOGIC;
    m_axi_COST_BUS_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_COST_BUS_bvalid : in STD_LOGIC;
    m_axi_COST_BUS_bready : out STD_LOGIC;
    m_axi_COST_BUS_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_COST_BUS_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_COST_BUS_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_COST_BUS_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_COST_BUS_arlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_COST_BUS_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_COST_BUS_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_COST_BUS_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_COST_BUS_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_COST_BUS_arvalid : out STD_LOGIC;
    m_axi_COST_BUS_arready : in STD_LOGIC;
    m_axi_COST_BUS_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_COST_BUS_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_COST_BUS_rlast : in STD_LOGIC;
    m_axi_COST_BUS_rvalid : in STD_LOGIC;
    m_axi_COST_BUS_rready : out STD_LOGIC;
    m_axi_IMG_BUS_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_IMG_BUS_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_IMG_BUS_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_IMG_BUS_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_IMG_BUS_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_IMG_BUS_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_IMG_BUS_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_IMG_BUS_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_IMG_BUS_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_IMG_BUS_awvalid : out STD_LOGIC;
    m_axi_IMG_BUS_awready : in STD_LOGIC;
    m_axi_IMG_BUS_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_IMG_BUS_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_IMG_BUS_wlast : out STD_LOGIC;
    m_axi_IMG_BUS_wvalid : out STD_LOGIC;
    m_axi_IMG_BUS_wready : in STD_LOGIC;
    m_axi_IMG_BUS_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_IMG_BUS_bvalid : in STD_LOGIC;
    m_axi_IMG_BUS_bready : out STD_LOGIC;
    m_axi_IMG_BUS_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_IMG_BUS_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_IMG_BUS_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_IMG_BUS_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_IMG_BUS_arlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_IMG_BUS_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_IMG_BUS_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_IMG_BUS_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_IMG_BUS_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_IMG_BUS_arvalid : out STD_LOGIC;
    m_axi_IMG_BUS_arready : in STD_LOGIC;
    m_axi_IMG_BUS_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_IMG_BUS_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_IMG_BUS_rlast : in STD_LOGIC;
    m_axi_IMG_BUS_rvalid : in STD_LOGIC;
    m_axi_IMG_BUS_rready : out STD_LOGIC;
    s_axi_IMG_BUS_awaddr : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_IMG_BUS_awvalid : in STD_LOGIC;
    s_axi_IMG_BUS_awready : out STD_LOGIC;
    s_axi_IMG_BUS_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_IMG_BUS_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_IMG_BUS_wvalid : in STD_LOGIC;
    s_axi_IMG_BUS_wready : out STD_LOGIC;
    s_axi_IMG_BUS_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_IMG_BUS_bvalid : out STD_LOGIC;
    s_axi_IMG_BUS_bready : in STD_LOGIC;
    s_axi_IMG_BUS_araddr : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_IMG_BUS_arvalid : in STD_LOGIC;
    s_axi_IMG_BUS_arready : out STD_LOGIC;
    s_axi_IMG_BUS_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_IMG_BUS_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_IMG_BUS_rvalid : out STD_LOGIC;
    s_axi_IMG_BUS_rready : in STD_LOGIC
  );
  end component bd_0;
begin
bd_0_i: component bd_0
     port map (
      ap_clk => ap_clk,
      ap_rst_n => ap_rst_n,
      interrupt => interrupt,
      m_axi_COST_BUS_araddr(31 downto 0) => m_axi_COST_BUS_araddr(31 downto 0),
      m_axi_COST_BUS_arburst(1 downto 0) => m_axi_COST_BUS_arburst(1 downto 0),
      m_axi_COST_BUS_arcache(3 downto 0) => m_axi_COST_BUS_arcache(3 downto 0),
      m_axi_COST_BUS_arlen(7 downto 0) => m_axi_COST_BUS_arlen(7 downto 0),
      m_axi_COST_BUS_arlock(1 downto 0) => m_axi_COST_BUS_arlock(1 downto 0),
      m_axi_COST_BUS_arprot(2 downto 0) => m_axi_COST_BUS_arprot(2 downto 0),
      m_axi_COST_BUS_arqos(3 downto 0) => m_axi_COST_BUS_arqos(3 downto 0),
      m_axi_COST_BUS_arready => m_axi_COST_BUS_arready,
      m_axi_COST_BUS_arregion(3 downto 0) => m_axi_COST_BUS_arregion(3 downto 0),
      m_axi_COST_BUS_arsize(2 downto 0) => m_axi_COST_BUS_arsize(2 downto 0),
      m_axi_COST_BUS_arvalid => m_axi_COST_BUS_arvalid,
      m_axi_COST_BUS_awaddr(31 downto 0) => m_axi_COST_BUS_awaddr(31 downto 0),
      m_axi_COST_BUS_awburst(1 downto 0) => m_axi_COST_BUS_awburst(1 downto 0),
      m_axi_COST_BUS_awcache(3 downto 0) => m_axi_COST_BUS_awcache(3 downto 0),
      m_axi_COST_BUS_awlen(7 downto 0) => m_axi_COST_BUS_awlen(7 downto 0),
      m_axi_COST_BUS_awlock(1 downto 0) => m_axi_COST_BUS_awlock(1 downto 0),
      m_axi_COST_BUS_awprot(2 downto 0) => m_axi_COST_BUS_awprot(2 downto 0),
      m_axi_COST_BUS_awqos(3 downto 0) => m_axi_COST_BUS_awqos(3 downto 0),
      m_axi_COST_BUS_awready => m_axi_COST_BUS_awready,
      m_axi_COST_BUS_awregion(3 downto 0) => m_axi_COST_BUS_awregion(3 downto 0),
      m_axi_COST_BUS_awsize(2 downto 0) => m_axi_COST_BUS_awsize(2 downto 0),
      m_axi_COST_BUS_awvalid => m_axi_COST_BUS_awvalid,
      m_axi_COST_BUS_bready => m_axi_COST_BUS_bready,
      m_axi_COST_BUS_bresp(1 downto 0) => m_axi_COST_BUS_bresp(1 downto 0),
      m_axi_COST_BUS_bvalid => m_axi_COST_BUS_bvalid,
      m_axi_COST_BUS_rdata(31 downto 0) => m_axi_COST_BUS_rdata(31 downto 0),
      m_axi_COST_BUS_rlast => m_axi_COST_BUS_rlast,
      m_axi_COST_BUS_rready => m_axi_COST_BUS_rready,
      m_axi_COST_BUS_rresp(1 downto 0) => m_axi_COST_BUS_rresp(1 downto 0),
      m_axi_COST_BUS_rvalid => m_axi_COST_BUS_rvalid,
      m_axi_COST_BUS_wdata(31 downto 0) => m_axi_COST_BUS_wdata(31 downto 0),
      m_axi_COST_BUS_wlast => m_axi_COST_BUS_wlast,
      m_axi_COST_BUS_wready => m_axi_COST_BUS_wready,
      m_axi_COST_BUS_wstrb(3 downto 0) => m_axi_COST_BUS_wstrb(3 downto 0),
      m_axi_COST_BUS_wvalid => m_axi_COST_BUS_wvalid,
      m_axi_IMG_BUS_araddr(31 downto 0) => m_axi_IMG_BUS_araddr(31 downto 0),
      m_axi_IMG_BUS_arburst(1 downto 0) => m_axi_IMG_BUS_arburst(1 downto 0),
      m_axi_IMG_BUS_arcache(3 downto 0) => m_axi_IMG_BUS_arcache(3 downto 0),
      m_axi_IMG_BUS_arlen(7 downto 0) => m_axi_IMG_BUS_arlen(7 downto 0),
      m_axi_IMG_BUS_arlock(1 downto 0) => m_axi_IMG_BUS_arlock(1 downto 0),
      m_axi_IMG_BUS_arprot(2 downto 0) => m_axi_IMG_BUS_arprot(2 downto 0),
      m_axi_IMG_BUS_arqos(3 downto 0) => m_axi_IMG_BUS_arqos(3 downto 0),
      m_axi_IMG_BUS_arready => m_axi_IMG_BUS_arready,
      m_axi_IMG_BUS_arregion(3 downto 0) => m_axi_IMG_BUS_arregion(3 downto 0),
      m_axi_IMG_BUS_arsize(2 downto 0) => m_axi_IMG_BUS_arsize(2 downto 0),
      m_axi_IMG_BUS_arvalid => m_axi_IMG_BUS_arvalid,
      m_axi_IMG_BUS_awaddr(31 downto 0) => m_axi_IMG_BUS_awaddr(31 downto 0),
      m_axi_IMG_BUS_awburst(1 downto 0) => m_axi_IMG_BUS_awburst(1 downto 0),
      m_axi_IMG_BUS_awcache(3 downto 0) => m_axi_IMG_BUS_awcache(3 downto 0),
      m_axi_IMG_BUS_awlen(7 downto 0) => m_axi_IMG_BUS_awlen(7 downto 0),
      m_axi_IMG_BUS_awlock(1 downto 0) => m_axi_IMG_BUS_awlock(1 downto 0),
      m_axi_IMG_BUS_awprot(2 downto 0) => m_axi_IMG_BUS_awprot(2 downto 0),
      m_axi_IMG_BUS_awqos(3 downto 0) => m_axi_IMG_BUS_awqos(3 downto 0),
      m_axi_IMG_BUS_awready => m_axi_IMG_BUS_awready,
      m_axi_IMG_BUS_awregion(3 downto 0) => m_axi_IMG_BUS_awregion(3 downto 0),
      m_axi_IMG_BUS_awsize(2 downto 0) => m_axi_IMG_BUS_awsize(2 downto 0),
      m_axi_IMG_BUS_awvalid => m_axi_IMG_BUS_awvalid,
      m_axi_IMG_BUS_bready => m_axi_IMG_BUS_bready,
      m_axi_IMG_BUS_bresp(1 downto 0) => m_axi_IMG_BUS_bresp(1 downto 0),
      m_axi_IMG_BUS_bvalid => m_axi_IMG_BUS_bvalid,
      m_axi_IMG_BUS_rdata(31 downto 0) => m_axi_IMG_BUS_rdata(31 downto 0),
      m_axi_IMG_BUS_rlast => m_axi_IMG_BUS_rlast,
      m_axi_IMG_BUS_rready => m_axi_IMG_BUS_rready,
      m_axi_IMG_BUS_rresp(1 downto 0) => m_axi_IMG_BUS_rresp(1 downto 0),
      m_axi_IMG_BUS_rvalid => m_axi_IMG_BUS_rvalid,
      m_axi_IMG_BUS_wdata(31 downto 0) => m_axi_IMG_BUS_wdata(31 downto 0),
      m_axi_IMG_BUS_wlast => m_axi_IMG_BUS_wlast,
      m_axi_IMG_BUS_wready => m_axi_IMG_BUS_wready,
      m_axi_IMG_BUS_wstrb(3 downto 0) => m_axi_IMG_BUS_wstrb(3 downto 0),
      m_axi_IMG_BUS_wvalid => m_axi_IMG_BUS_wvalid,
      s_axi_IMG_BUS_araddr(5 downto 0) => s_axi_IMG_BUS_araddr(5 downto 0),
      s_axi_IMG_BUS_arready => s_axi_IMG_BUS_arready,
      s_axi_IMG_BUS_arvalid => s_axi_IMG_BUS_arvalid,
      s_axi_IMG_BUS_awaddr(5 downto 0) => s_axi_IMG_BUS_awaddr(5 downto 0),
      s_axi_IMG_BUS_awready => s_axi_IMG_BUS_awready,
      s_axi_IMG_BUS_awvalid => s_axi_IMG_BUS_awvalid,
      s_axi_IMG_BUS_bready => s_axi_IMG_BUS_bready,
      s_axi_IMG_BUS_bresp(1 downto 0) => s_axi_IMG_BUS_bresp(1 downto 0),
      s_axi_IMG_BUS_bvalid => s_axi_IMG_BUS_bvalid,
      s_axi_IMG_BUS_rdata(31 downto 0) => s_axi_IMG_BUS_rdata(31 downto 0),
      s_axi_IMG_BUS_rready => s_axi_IMG_BUS_rready,
      s_axi_IMG_BUS_rresp(1 downto 0) => s_axi_IMG_BUS_rresp(1 downto 0),
      s_axi_IMG_BUS_rvalid => s_axi_IMG_BUS_rvalid,
      s_axi_IMG_BUS_wdata(31 downto 0) => s_axi_IMG_BUS_wdata(31 downto 0),
      s_axi_IMG_BUS_wready => s_axi_IMG_BUS_wready,
      s_axi_IMG_BUS_wstrb(3 downto 0) => s_axi_IMG_BUS_wstrb(3 downto 0),
      s_axi_IMG_BUS_wvalid => s_axi_IMG_BUS_wvalid
    );
end STRUCTURE;
