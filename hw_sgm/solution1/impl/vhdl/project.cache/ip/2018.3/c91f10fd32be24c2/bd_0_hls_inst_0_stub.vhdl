-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Wed Jun  5 20:45:56 2019
-- Host        : Laszlo-LPT running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_0_hls_inst_0_stub.vhdl
-- Design      : bd_0_hls_inst_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
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

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "s_axi_IMG_BUS_AWADDR[5:0],s_axi_IMG_BUS_AWVALID,s_axi_IMG_BUS_AWREADY,s_axi_IMG_BUS_WDATA[31:0],s_axi_IMG_BUS_WSTRB[3:0],s_axi_IMG_BUS_WVALID,s_axi_IMG_BUS_WREADY,s_axi_IMG_BUS_BRESP[1:0],s_axi_IMG_BUS_BVALID,s_axi_IMG_BUS_BREADY,s_axi_IMG_BUS_ARADDR[5:0],s_axi_IMG_BUS_ARVALID,s_axi_IMG_BUS_ARREADY,s_axi_IMG_BUS_RDATA[31:0],s_axi_IMG_BUS_RRESP[1:0],s_axi_IMG_BUS_RVALID,s_axi_IMG_BUS_RREADY,ap_clk,ap_rst_n,interrupt,m_axi_IMG_BUS_AWADDR[31:0],m_axi_IMG_BUS_AWLEN[7:0],m_axi_IMG_BUS_AWSIZE[2:0],m_axi_IMG_BUS_AWBURST[1:0],m_axi_IMG_BUS_AWLOCK[1:0],m_axi_IMG_BUS_AWREGION[3:0],m_axi_IMG_BUS_AWCACHE[3:0],m_axi_IMG_BUS_AWPROT[2:0],m_axi_IMG_BUS_AWQOS[3:0],m_axi_IMG_BUS_AWVALID,m_axi_IMG_BUS_AWREADY,m_axi_IMG_BUS_WDATA[31:0],m_axi_IMG_BUS_WSTRB[3:0],m_axi_IMG_BUS_WLAST,m_axi_IMG_BUS_WVALID,m_axi_IMG_BUS_WREADY,m_axi_IMG_BUS_BRESP[1:0],m_axi_IMG_BUS_BVALID,m_axi_IMG_BUS_BREADY,m_axi_IMG_BUS_ARADDR[31:0],m_axi_IMG_BUS_ARLEN[7:0],m_axi_IMG_BUS_ARSIZE[2:0],m_axi_IMG_BUS_ARBURST[1:0],m_axi_IMG_BUS_ARLOCK[1:0],m_axi_IMG_BUS_ARREGION[3:0],m_axi_IMG_BUS_ARCACHE[3:0],m_axi_IMG_BUS_ARPROT[2:0],m_axi_IMG_BUS_ARQOS[3:0],m_axi_IMG_BUS_ARVALID,m_axi_IMG_BUS_ARREADY,m_axi_IMG_BUS_RDATA[31:0],m_axi_IMG_BUS_RRESP[1:0],m_axi_IMG_BUS_RLAST,m_axi_IMG_BUS_RVALID,m_axi_IMG_BUS_RREADY,m_axi_COST_BUS_AWADDR[31:0],m_axi_COST_BUS_AWLEN[7:0],m_axi_COST_BUS_AWSIZE[2:0],m_axi_COST_BUS_AWBURST[1:0],m_axi_COST_BUS_AWLOCK[1:0],m_axi_COST_BUS_AWREGION[3:0],m_axi_COST_BUS_AWCACHE[3:0],m_axi_COST_BUS_AWPROT[2:0],m_axi_COST_BUS_AWQOS[3:0],m_axi_COST_BUS_AWVALID,m_axi_COST_BUS_AWREADY,m_axi_COST_BUS_WDATA[31:0],m_axi_COST_BUS_WSTRB[3:0],m_axi_COST_BUS_WLAST,m_axi_COST_BUS_WVALID,m_axi_COST_BUS_WREADY,m_axi_COST_BUS_BRESP[1:0],m_axi_COST_BUS_BVALID,m_axi_COST_BUS_BREADY,m_axi_COST_BUS_ARADDR[31:0],m_axi_COST_BUS_ARLEN[7:0],m_axi_COST_BUS_ARSIZE[2:0],m_axi_COST_BUS_ARBURST[1:0],m_axi_COST_BUS_ARLOCK[1:0],m_axi_COST_BUS_ARREGION[3:0],m_axi_COST_BUS_ARCACHE[3:0],m_axi_COST_BUS_ARPROT[2:0],m_axi_COST_BUS_ARQOS[3:0],m_axi_COST_BUS_ARVALID,m_axi_COST_BUS_ARREADY,m_axi_COST_BUS_RDATA[31:0],m_axi_COST_BUS_RRESP[1:0],m_axi_COST_BUS_RLAST,m_axi_COST_BUS_RVALID,m_axi_COST_BUS_RREADY";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "comp_d_map,Vivado 2018.3";
begin
end;