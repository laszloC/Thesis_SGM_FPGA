-- (c) Copyright 1995-2019 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:ip:smartconnect:1.0
-- IP Revision: 10

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY img_proc_hw_axi_smc_0 IS
  PORT (
    aclk : IN STD_LOGIC;
    aresetn : IN STD_LOGIC;
    S00_AXI_awid : IN STD_LOGIC;
    S00_AXI_awaddr : IN STD_LOGIC;
    S00_AXI_awlen : IN STD_LOGIC;
    S00_AXI_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    S00_AXI_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    S00_AXI_awlock : IN STD_LOGIC;
    S00_AXI_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S00_AXI_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    S00_AXI_awregion : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S00_AXI_awqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S00_AXI_awuser : IN STD_LOGIC;
    S00_AXI_awvalid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    S00_AXI_awready : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    S00_AXI_wid : IN STD_LOGIC;
    S00_AXI_wdata : IN STD_LOGIC;
    S00_AXI_wstrb : IN STD_LOGIC;
    S00_AXI_wlast : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    S00_AXI_wuser : IN STD_LOGIC;
    S00_AXI_wvalid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    S00_AXI_wready : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    S00_AXI_bid : OUT STD_LOGIC;
    S00_AXI_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    S00_AXI_buser : OUT STD_LOGIC;
    S00_AXI_bvalid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    S00_AXI_bready : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    S00_AXI_arid : IN STD_LOGIC;
    S00_AXI_araddr : IN STD_LOGIC;
    S00_AXI_arlen : IN STD_LOGIC;
    S00_AXI_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    S00_AXI_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    S00_AXI_arlock : IN STD_LOGIC;
    S00_AXI_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S00_AXI_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    S00_AXI_arregion : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S00_AXI_arqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S00_AXI_aruser : IN STD_LOGIC;
    S00_AXI_arvalid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    S00_AXI_arready : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    S00_AXI_rid : OUT STD_LOGIC;
    S00_AXI_rdata : OUT STD_LOGIC;
    S00_AXI_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    S00_AXI_rlast : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    S00_AXI_ruser : OUT STD_LOGIC;
    S00_AXI_rvalid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    S00_AXI_rready : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    S01_AXI_awaddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    S01_AXI_awlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    S01_AXI_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    S01_AXI_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    S01_AXI_awlock : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    S01_AXI_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S01_AXI_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    S01_AXI_awqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S01_AXI_awvalid : IN STD_LOGIC;
    S01_AXI_awready : OUT STD_LOGIC;
    S01_AXI_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    S01_AXI_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S01_AXI_wlast : IN STD_LOGIC;
    S01_AXI_wvalid : IN STD_LOGIC;
    S01_AXI_wready : OUT STD_LOGIC;
    S01_AXI_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    S01_AXI_bvalid : OUT STD_LOGIC;
    S01_AXI_bready : IN STD_LOGIC;
    S01_AXI_araddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    S01_AXI_arlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    S01_AXI_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    S01_AXI_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    S01_AXI_arlock : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    S01_AXI_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S01_AXI_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    S01_AXI_arqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S01_AXI_arvalid : IN STD_LOGIC;
    S01_AXI_arready : OUT STD_LOGIC;
    S01_AXI_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    S01_AXI_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    S01_AXI_rlast : OUT STD_LOGIC;
    S01_AXI_rvalid : OUT STD_LOGIC;
    S01_AXI_rready : IN STD_LOGIC;
    S02_AXI_awaddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    S02_AXI_awlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    S02_AXI_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    S02_AXI_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    S02_AXI_awlock : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    S02_AXI_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S02_AXI_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    S02_AXI_awqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S02_AXI_awvalid : IN STD_LOGIC;
    S02_AXI_awready : OUT STD_LOGIC;
    S02_AXI_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    S02_AXI_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S02_AXI_wlast : IN STD_LOGIC;
    S02_AXI_wvalid : IN STD_LOGIC;
    S02_AXI_wready : OUT STD_LOGIC;
    S02_AXI_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    S02_AXI_bvalid : OUT STD_LOGIC;
    S02_AXI_bready : IN STD_LOGIC;
    S02_AXI_araddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    S02_AXI_arlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    S02_AXI_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    S02_AXI_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    S02_AXI_arlock : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    S02_AXI_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S02_AXI_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    S02_AXI_arqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S02_AXI_arvalid : IN STD_LOGIC;
    S02_AXI_arready : OUT STD_LOGIC;
    S02_AXI_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    S02_AXI_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    S02_AXI_rlast : OUT STD_LOGIC;
    S02_AXI_rvalid : OUT STD_LOGIC;
    S02_AXI_rready : IN STD_LOGIC;
    S03_AXI_awaddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    S03_AXI_awlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    S03_AXI_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    S03_AXI_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    S03_AXI_awlock : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    S03_AXI_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S03_AXI_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    S03_AXI_awqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S03_AXI_awvalid : IN STD_LOGIC;
    S03_AXI_awready : OUT STD_LOGIC;
    S03_AXI_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    S03_AXI_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S03_AXI_wlast : IN STD_LOGIC;
    S03_AXI_wvalid : IN STD_LOGIC;
    S03_AXI_wready : OUT STD_LOGIC;
    S03_AXI_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    S03_AXI_bvalid : OUT STD_LOGIC;
    S03_AXI_bready : IN STD_LOGIC;
    S03_AXI_araddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    S03_AXI_arlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    S03_AXI_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    S03_AXI_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    S03_AXI_arlock : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    S03_AXI_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S03_AXI_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    S03_AXI_arqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S03_AXI_arvalid : IN STD_LOGIC;
    S03_AXI_arready : OUT STD_LOGIC;
    S03_AXI_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    S03_AXI_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    S03_AXI_rlast : OUT STD_LOGIC;
    S03_AXI_rvalid : OUT STD_LOGIC;
    S03_AXI_rready : IN STD_LOGIC;
    S04_AXI_awid : IN STD_LOGIC;
    S04_AXI_awaddr : IN STD_LOGIC;
    S04_AXI_awlen : IN STD_LOGIC;
    S04_AXI_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    S04_AXI_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    S04_AXI_awlock : IN STD_LOGIC;
    S04_AXI_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S04_AXI_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    S04_AXI_awregion : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S04_AXI_awqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S04_AXI_awuser : IN STD_LOGIC;
    S04_AXI_awvalid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    S04_AXI_awready : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    S04_AXI_wid : IN STD_LOGIC;
    S04_AXI_wdata : IN STD_LOGIC;
    S04_AXI_wstrb : IN STD_LOGIC;
    S04_AXI_wlast : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    S04_AXI_wuser : IN STD_LOGIC;
    S04_AXI_wvalid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    S04_AXI_wready : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    S04_AXI_bid : OUT STD_LOGIC;
    S04_AXI_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    S04_AXI_buser : OUT STD_LOGIC;
    S04_AXI_bvalid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    S04_AXI_bready : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    S04_AXI_arid : IN STD_LOGIC;
    S04_AXI_araddr : IN STD_LOGIC;
    S04_AXI_arlen : IN STD_LOGIC;
    S04_AXI_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    S04_AXI_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    S04_AXI_arlock : IN STD_LOGIC;
    S04_AXI_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S04_AXI_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    S04_AXI_arregion : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S04_AXI_arqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S04_AXI_aruser : IN STD_LOGIC;
    S04_AXI_arvalid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    S04_AXI_arready : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    S04_AXI_rid : OUT STD_LOGIC;
    S04_AXI_rdata : OUT STD_LOGIC;
    S04_AXI_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    S04_AXI_rlast : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    S04_AXI_ruser : OUT STD_LOGIC;
    S04_AXI_rvalid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    S04_AXI_rready : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    S05_AXI_awid : IN STD_LOGIC;
    S05_AXI_awaddr : IN STD_LOGIC;
    S05_AXI_awlen : IN STD_LOGIC;
    S05_AXI_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    S05_AXI_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    S05_AXI_awlock : IN STD_LOGIC;
    S05_AXI_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S05_AXI_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    S05_AXI_awregion : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S05_AXI_awqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S05_AXI_awuser : IN STD_LOGIC;
    S05_AXI_awvalid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    S05_AXI_awready : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    S05_AXI_wid : IN STD_LOGIC;
    S05_AXI_wdata : IN STD_LOGIC;
    S05_AXI_wstrb : IN STD_LOGIC;
    S05_AXI_wlast : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    S05_AXI_wuser : IN STD_LOGIC;
    S05_AXI_wvalid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    S05_AXI_wready : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    S05_AXI_bid : OUT STD_LOGIC;
    S05_AXI_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    S05_AXI_buser : OUT STD_LOGIC;
    S05_AXI_bvalid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    S05_AXI_bready : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    S05_AXI_arid : IN STD_LOGIC;
    S05_AXI_araddr : IN STD_LOGIC;
    S05_AXI_arlen : IN STD_LOGIC;
    S05_AXI_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    S05_AXI_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    S05_AXI_arlock : IN STD_LOGIC;
    S05_AXI_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S05_AXI_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    S05_AXI_arregion : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S05_AXI_arqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S05_AXI_aruser : IN STD_LOGIC;
    S05_AXI_arvalid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    S05_AXI_arready : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    S05_AXI_rid : OUT STD_LOGIC;
    S05_AXI_rdata : OUT STD_LOGIC;
    S05_AXI_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    S05_AXI_rlast : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    S05_AXI_ruser : OUT STD_LOGIC;
    S05_AXI_rvalid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    S05_AXI_rready : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    M00_AXI_awaddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    M00_AXI_awlen : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    M00_AXI_awsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    M00_AXI_awburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    M00_AXI_awlock : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    M00_AXI_awcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    M00_AXI_awprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    M00_AXI_awqos : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    M00_AXI_awvalid : OUT STD_LOGIC;
    M00_AXI_awready : IN STD_LOGIC;
    M00_AXI_wdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    M00_AXI_wstrb : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    M00_AXI_wlast : OUT STD_LOGIC;
    M00_AXI_wvalid : OUT STD_LOGIC;
    M00_AXI_wready : IN STD_LOGIC;
    M00_AXI_bresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    M00_AXI_bvalid : IN STD_LOGIC;
    M00_AXI_bready : OUT STD_LOGIC;
    M00_AXI_araddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    M00_AXI_arlen : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    M00_AXI_arsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    M00_AXI_arburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    M00_AXI_arlock : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    M00_AXI_arcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    M00_AXI_arprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    M00_AXI_arqos : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    M00_AXI_arvalid : OUT STD_LOGIC;
    M00_AXI_arready : IN STD_LOGIC;
    M00_AXI_rdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    M00_AXI_rresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    M00_AXI_rlast : IN STD_LOGIC;
    M00_AXI_rvalid : IN STD_LOGIC;
    M00_AXI_rready : OUT STD_LOGIC
  );
END img_proc_hw_axi_smc_0;

ARCHITECTURE img_proc_hw_axi_smc_0_arch OF img_proc_hw_axi_smc_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF img_proc_hw_axi_smc_0_arch: ARCHITECTURE IS "yes";
  COMPONENT bd_0020 IS
    PORT (
      aclk : IN STD_LOGIC;
      aresetn : IN STD_LOGIC;
      S00_AXI_awid : IN STD_LOGIC;
      S00_AXI_awaddr : IN STD_LOGIC;
      S00_AXI_awlen : IN STD_LOGIC;
      S00_AXI_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      S00_AXI_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      S00_AXI_awlock : IN STD_LOGIC;
      S00_AXI_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      S00_AXI_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      S00_AXI_awregion : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      S00_AXI_awqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      S00_AXI_awuser : IN STD_LOGIC;
      S00_AXI_awvalid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      S00_AXI_awready : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      S00_AXI_wid : IN STD_LOGIC;
      S00_AXI_wdata : IN STD_LOGIC;
      S00_AXI_wstrb : IN STD_LOGIC;
      S00_AXI_wlast : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      S00_AXI_wuser : IN STD_LOGIC;
      S00_AXI_wvalid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      S00_AXI_wready : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      S00_AXI_bid : OUT STD_LOGIC;
      S00_AXI_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      S00_AXI_buser : OUT STD_LOGIC;
      S00_AXI_bvalid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      S00_AXI_bready : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      S00_AXI_arid : IN STD_LOGIC;
      S00_AXI_araddr : IN STD_LOGIC;
      S00_AXI_arlen : IN STD_LOGIC;
      S00_AXI_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      S00_AXI_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      S00_AXI_arlock : IN STD_LOGIC;
      S00_AXI_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      S00_AXI_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      S00_AXI_arregion : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      S00_AXI_arqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      S00_AXI_aruser : IN STD_LOGIC;
      S00_AXI_arvalid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      S00_AXI_arready : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      S00_AXI_rid : OUT STD_LOGIC;
      S00_AXI_rdata : OUT STD_LOGIC;
      S00_AXI_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      S00_AXI_rlast : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      S00_AXI_ruser : OUT STD_LOGIC;
      S00_AXI_rvalid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      S00_AXI_rready : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      S01_AXI_awaddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      S01_AXI_awlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      S01_AXI_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      S01_AXI_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      S01_AXI_awlock : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      S01_AXI_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      S01_AXI_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      S01_AXI_awqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      S01_AXI_awvalid : IN STD_LOGIC;
      S01_AXI_awready : OUT STD_LOGIC;
      S01_AXI_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      S01_AXI_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      S01_AXI_wlast : IN STD_LOGIC;
      S01_AXI_wvalid : IN STD_LOGIC;
      S01_AXI_wready : OUT STD_LOGIC;
      S01_AXI_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      S01_AXI_bvalid : OUT STD_LOGIC;
      S01_AXI_bready : IN STD_LOGIC;
      S01_AXI_araddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      S01_AXI_arlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      S01_AXI_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      S01_AXI_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      S01_AXI_arlock : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      S01_AXI_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      S01_AXI_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      S01_AXI_arqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      S01_AXI_arvalid : IN STD_LOGIC;
      S01_AXI_arready : OUT STD_LOGIC;
      S01_AXI_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      S01_AXI_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      S01_AXI_rlast : OUT STD_LOGIC;
      S01_AXI_rvalid : OUT STD_LOGIC;
      S01_AXI_rready : IN STD_LOGIC;
      S02_AXI_awaddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      S02_AXI_awlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      S02_AXI_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      S02_AXI_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      S02_AXI_awlock : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      S02_AXI_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      S02_AXI_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      S02_AXI_awqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      S02_AXI_awvalid : IN STD_LOGIC;
      S02_AXI_awready : OUT STD_LOGIC;
      S02_AXI_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      S02_AXI_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      S02_AXI_wlast : IN STD_LOGIC;
      S02_AXI_wvalid : IN STD_LOGIC;
      S02_AXI_wready : OUT STD_LOGIC;
      S02_AXI_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      S02_AXI_bvalid : OUT STD_LOGIC;
      S02_AXI_bready : IN STD_LOGIC;
      S02_AXI_araddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      S02_AXI_arlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      S02_AXI_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      S02_AXI_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      S02_AXI_arlock : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      S02_AXI_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      S02_AXI_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      S02_AXI_arqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      S02_AXI_arvalid : IN STD_LOGIC;
      S02_AXI_arready : OUT STD_LOGIC;
      S02_AXI_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      S02_AXI_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      S02_AXI_rlast : OUT STD_LOGIC;
      S02_AXI_rvalid : OUT STD_LOGIC;
      S02_AXI_rready : IN STD_LOGIC;
      S03_AXI_awaddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      S03_AXI_awlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      S03_AXI_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      S03_AXI_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      S03_AXI_awlock : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      S03_AXI_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      S03_AXI_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      S03_AXI_awqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      S03_AXI_awvalid : IN STD_LOGIC;
      S03_AXI_awready : OUT STD_LOGIC;
      S03_AXI_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      S03_AXI_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      S03_AXI_wlast : IN STD_LOGIC;
      S03_AXI_wvalid : IN STD_LOGIC;
      S03_AXI_wready : OUT STD_LOGIC;
      S03_AXI_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      S03_AXI_bvalid : OUT STD_LOGIC;
      S03_AXI_bready : IN STD_LOGIC;
      S03_AXI_araddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      S03_AXI_arlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      S03_AXI_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      S03_AXI_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      S03_AXI_arlock : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      S03_AXI_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      S03_AXI_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      S03_AXI_arqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      S03_AXI_arvalid : IN STD_LOGIC;
      S03_AXI_arready : OUT STD_LOGIC;
      S03_AXI_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      S03_AXI_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      S03_AXI_rlast : OUT STD_LOGIC;
      S03_AXI_rvalid : OUT STD_LOGIC;
      S03_AXI_rready : IN STD_LOGIC;
      S04_AXI_awid : IN STD_LOGIC;
      S04_AXI_awaddr : IN STD_LOGIC;
      S04_AXI_awlen : IN STD_LOGIC;
      S04_AXI_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      S04_AXI_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      S04_AXI_awlock : IN STD_LOGIC;
      S04_AXI_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      S04_AXI_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      S04_AXI_awregion : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      S04_AXI_awqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      S04_AXI_awuser : IN STD_LOGIC;
      S04_AXI_awvalid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      S04_AXI_awready : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      S04_AXI_wid : IN STD_LOGIC;
      S04_AXI_wdata : IN STD_LOGIC;
      S04_AXI_wstrb : IN STD_LOGIC;
      S04_AXI_wlast : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      S04_AXI_wuser : IN STD_LOGIC;
      S04_AXI_wvalid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      S04_AXI_wready : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      S04_AXI_bid : OUT STD_LOGIC;
      S04_AXI_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      S04_AXI_buser : OUT STD_LOGIC;
      S04_AXI_bvalid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      S04_AXI_bready : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      S04_AXI_arid : IN STD_LOGIC;
      S04_AXI_araddr : IN STD_LOGIC;
      S04_AXI_arlen : IN STD_LOGIC;
      S04_AXI_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      S04_AXI_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      S04_AXI_arlock : IN STD_LOGIC;
      S04_AXI_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      S04_AXI_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      S04_AXI_arregion : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      S04_AXI_arqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      S04_AXI_aruser : IN STD_LOGIC;
      S04_AXI_arvalid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      S04_AXI_arready : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      S04_AXI_rid : OUT STD_LOGIC;
      S04_AXI_rdata : OUT STD_LOGIC;
      S04_AXI_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      S04_AXI_rlast : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      S04_AXI_ruser : OUT STD_LOGIC;
      S04_AXI_rvalid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      S04_AXI_rready : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      S05_AXI_awid : IN STD_LOGIC;
      S05_AXI_awaddr : IN STD_LOGIC;
      S05_AXI_awlen : IN STD_LOGIC;
      S05_AXI_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      S05_AXI_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      S05_AXI_awlock : IN STD_LOGIC;
      S05_AXI_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      S05_AXI_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      S05_AXI_awregion : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      S05_AXI_awqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      S05_AXI_awuser : IN STD_LOGIC;
      S05_AXI_awvalid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      S05_AXI_awready : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      S05_AXI_wid : IN STD_LOGIC;
      S05_AXI_wdata : IN STD_LOGIC;
      S05_AXI_wstrb : IN STD_LOGIC;
      S05_AXI_wlast : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      S05_AXI_wuser : IN STD_LOGIC;
      S05_AXI_wvalid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      S05_AXI_wready : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      S05_AXI_bid : OUT STD_LOGIC;
      S05_AXI_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      S05_AXI_buser : OUT STD_LOGIC;
      S05_AXI_bvalid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      S05_AXI_bready : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      S05_AXI_arid : IN STD_LOGIC;
      S05_AXI_araddr : IN STD_LOGIC;
      S05_AXI_arlen : IN STD_LOGIC;
      S05_AXI_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      S05_AXI_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      S05_AXI_arlock : IN STD_LOGIC;
      S05_AXI_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      S05_AXI_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      S05_AXI_arregion : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      S05_AXI_arqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      S05_AXI_aruser : IN STD_LOGIC;
      S05_AXI_arvalid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      S05_AXI_arready : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      S05_AXI_rid : OUT STD_LOGIC;
      S05_AXI_rdata : OUT STD_LOGIC;
      S05_AXI_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      S05_AXI_rlast : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      S05_AXI_ruser : OUT STD_LOGIC;
      S05_AXI_rvalid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      S05_AXI_rready : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      M00_AXI_awaddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      M00_AXI_awlen : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      M00_AXI_awsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      M00_AXI_awburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      M00_AXI_awlock : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      M00_AXI_awcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      M00_AXI_awprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      M00_AXI_awqos : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      M00_AXI_awvalid : OUT STD_LOGIC;
      M00_AXI_awready : IN STD_LOGIC;
      M00_AXI_wdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      M00_AXI_wstrb : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      M00_AXI_wlast : OUT STD_LOGIC;
      M00_AXI_wvalid : OUT STD_LOGIC;
      M00_AXI_wready : IN STD_LOGIC;
      M00_AXI_bresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      M00_AXI_bvalid : IN STD_LOGIC;
      M00_AXI_bready : OUT STD_LOGIC;
      M00_AXI_araddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      M00_AXI_arlen : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      M00_AXI_arsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      M00_AXI_arburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      M00_AXI_arlock : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      M00_AXI_arcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      M00_AXI_arprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      M00_AXI_arqos : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      M00_AXI_arvalid : OUT STD_LOGIC;
      M00_AXI_arready : IN STD_LOGIC;
      M00_AXI_rdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      M00_AXI_rresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      M00_AXI_rlast : IN STD_LOGIC;
      M00_AXI_rvalid : IN STD_LOGIC;
      M00_AXI_rready : OUT STD_LOGIC
    );
  END COMPONENT bd_0020;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_rlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_arqos: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI ARQOS";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_arcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_arlock: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_arburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_arsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_arlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_wlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_awqos: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI AWQOS";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_awcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI AWCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_awlock: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_awburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_awsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_awlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI AWLEN";
  ATTRIBUTE X_INTERFACE_PARAMETER OF M00_AXI_awaddr: SIGNAL IS "XIL_INTERFACENAME M00_AXI, DATA_WIDTH 64, PROTOCOL AXI3, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 16, MAX_BURST_LENGTH 16, PHASE 0.000, CLK_DOMAIN img_proc_hw_processing_system7_0_0_FCLK_CLK0, NUM_READ_TH" & 
"READS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_ruser: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI RUSER";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_rlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_rid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI RID";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_aruser: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI ARUSER";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_arqos: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI ARQOS";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_arregion: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI ARREGION";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_arcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_arlock: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_arburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_arsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_arlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_arid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI ARID";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_buser: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI BUSER";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_bid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI BID";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_wuser: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI WUSER";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_wlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_wid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI WID";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_awuser: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI AWUSER";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_awqos: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI AWQOS";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_awregion: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI AWREGION";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_awcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI AWCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_awlock: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_awburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_awsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_awlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI AWLEN";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI AWADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF S05_AXI_awid: SIGNAL IS "XIL_INTERFACENAME S05_AXI, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 256, PHASE 0.000, CLK_DOMAIN img_proc_hw_processing_system7_0_0_FCLK_CLK0, NUM_READ_THR" & 
"EADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF S05_AXI_awid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S05_AXI AWID";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_ruser: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI RUSER";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_rlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_rid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI RID";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_aruser: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI ARUSER";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_arqos: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI ARQOS";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_arregion: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI ARREGION";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_arcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_arlock: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_arburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_arsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_arlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_arid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI ARID";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_buser: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI BUSER";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_bid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI BID";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_wuser: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI WUSER";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_wlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_wid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI WID";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_awuser: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI AWUSER";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_awqos: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI AWQOS";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_awregion: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI AWREGION";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_awcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI AWCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_awlock: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_awburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_awsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_awlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI AWLEN";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI AWADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF S04_AXI_awid: SIGNAL IS "XIL_INTERFACENAME S04_AXI, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 256, PHASE 0.000, CLK_DOMAIN img_proc_hw_processing_system7_0_0_FCLK_CLK0, NUM_READ_THR" & 
"EADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF S04_AXI_awid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S04_AXI AWID";
  ATTRIBUTE X_INTERFACE_INFO OF S03_AXI_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S03_AXI RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S03_AXI_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S03_AXI RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF S03_AXI_rlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 S03_AXI RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF S03_AXI_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 S03_AXI RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF S03_AXI_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 S03_AXI RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF S03_AXI_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S03_AXI ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S03_AXI_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S03_AXI ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF S03_AXI_arqos: SIGNAL IS "xilinx.com:interface:aximm:1.0 S03_AXI ARQOS";
  ATTRIBUTE X_INTERFACE_INFO OF S03_AXI_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 S03_AXI ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF S03_AXI_arcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 S03_AXI ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF S03_AXI_arlock: SIGNAL IS "xilinx.com:interface:aximm:1.0 S03_AXI ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF S03_AXI_arburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 S03_AXI ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF S03_AXI_arsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 S03_AXI ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF S03_AXI_arlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 S03_AXI ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF S03_AXI_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 S03_AXI ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF S03_AXI_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S03_AXI BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S03_AXI_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S03_AXI BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF S03_AXI_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 S03_AXI BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF S03_AXI_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S03_AXI WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S03_AXI_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S03_AXI WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF S03_AXI_wlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 S03_AXI WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF S03_AXI_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 S03_AXI WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF S03_AXI_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 S03_AXI WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF S03_AXI_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S03_AXI AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S03_AXI_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S03_AXI AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF S03_AXI_awqos: SIGNAL IS "xilinx.com:interface:aximm:1.0 S03_AXI AWQOS";
  ATTRIBUTE X_INTERFACE_INFO OF S03_AXI_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 S03_AXI AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF S03_AXI_awcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 S03_AXI AWCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF S03_AXI_awlock: SIGNAL IS "xilinx.com:interface:aximm:1.0 S03_AXI AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF S03_AXI_awburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 S03_AXI AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF S03_AXI_awsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 S03_AXI AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF S03_AXI_awlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 S03_AXI AWLEN";
  ATTRIBUTE X_INTERFACE_PARAMETER OF S03_AXI_awaddr: SIGNAL IS "XIL_INTERFACENAME S03_AXI, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 16, MAX_BURST_LENGTH 256, PHASE 0.000, CLK_DOMAIN img_proc_hw_processing_system7_0_0_FCLK_CLK0, NUM_READ_T" & 
"HREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF S03_AXI_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 S03_AXI AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF S02_AXI_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S02_AXI_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF S02_AXI_rlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF S02_AXI_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF S02_AXI_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF S02_AXI_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S02_AXI_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF S02_AXI_arqos: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI ARQOS";
  ATTRIBUTE X_INTERFACE_INFO OF S02_AXI_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF S02_AXI_arcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF S02_AXI_arlock: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF S02_AXI_arburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF S02_AXI_arsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF S02_AXI_arlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF S02_AXI_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF S02_AXI_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S02_AXI_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF S02_AXI_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF S02_AXI_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S02_AXI_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF S02_AXI_wlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF S02_AXI_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF S02_AXI_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF S02_AXI_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S02_AXI_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF S02_AXI_awqos: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI AWQOS";
  ATTRIBUTE X_INTERFACE_INFO OF S02_AXI_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF S02_AXI_awcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI AWCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF S02_AXI_awlock: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF S02_AXI_awburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF S02_AXI_awsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF S02_AXI_awlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI AWLEN";
  ATTRIBUTE X_INTERFACE_PARAMETER OF S02_AXI_awaddr: SIGNAL IS "XIL_INTERFACENAME S02_AXI, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 16, MAX_BURST_LENGTH 256, PHASE 0.000, CLK_DOMAIN img_proc_hw_processing_system7_0_0_FCLK_CLK0, NUM_READ_T" & 
"HREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF S02_AXI_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF S01_AXI_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S01_AXI_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF S01_AXI_rlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF S01_AXI_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF S01_AXI_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF S01_AXI_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S01_AXI_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF S01_AXI_arqos: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI ARQOS";
  ATTRIBUTE X_INTERFACE_INFO OF S01_AXI_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF S01_AXI_arcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF S01_AXI_arlock: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF S01_AXI_arburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF S01_AXI_arsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF S01_AXI_arlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF S01_AXI_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF S01_AXI_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S01_AXI_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF S01_AXI_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF S01_AXI_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S01_AXI_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF S01_AXI_wlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF S01_AXI_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF S01_AXI_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF S01_AXI_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S01_AXI_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF S01_AXI_awqos: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI AWQOS";
  ATTRIBUTE X_INTERFACE_INFO OF S01_AXI_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF S01_AXI_awcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI AWCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF S01_AXI_awlock: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF S01_AXI_awburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF S01_AXI_awsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF S01_AXI_awlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI AWLEN";
  ATTRIBUTE X_INTERFACE_PARAMETER OF S01_AXI_awaddr: SIGNAL IS "XIL_INTERFACENAME S01_AXI, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 16, MAX_BURST_LENGTH 256, PHASE 0.000, CLK_DOMAIN img_proc_hw_processing_system7_0_0_FCLK_CLK0, NUM_READ_T" & 
"HREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF S01_AXI_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_ruser: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI RUSER";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_rlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_rid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI RID";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_aruser: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI ARUSER";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_arqos: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI ARQOS";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_arregion: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI ARREGION";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_arcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_arlock: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_arburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_arsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_arlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_arid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI ARID";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_buser: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI BUSER";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_bid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI BID";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_wuser: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI WUSER";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_wlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_wid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI WID";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_awuser: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI AWUSER";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_awqos: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI AWQOS";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_awregion: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI AWREGION";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_awcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI AWCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_awlock: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_awburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_awsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_awlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI AWLEN";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF S00_AXI_awid: SIGNAL IS "XIL_INTERFACENAME S00_AXI, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 256, PHASE 0.000, CLK_DOMAIN img_proc_hw_processing_system7_0_0_FCLK_CLK0, NUM_READ_THR" & 
"EADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_awid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI AWID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF aresetn: SIGNAL IS "XIL_INTERFACENAME RST.aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 RST.aresetn RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF aclk: SIGNAL IS "XIL_INTERFACENAME CLK.aclk, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN img_proc_hw_processing_system7_0_0_FCLK_CLK0, ASSOCIATED_BUSIF M00_AXI:S00_AXI:S01_AXI:S02_AXI:S03_AXI:S04_AXI:S05_AXI, INSERT_VIP 0, ASSOCIATED_CLKEN m_sc_aclken";
  ATTRIBUTE X_INTERFACE_INFO OF aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 CLK.aclk CLK";
BEGIN
  U0 : bd_0020
    PORT MAP (
      aclk => aclk,
      aresetn => aresetn,
      S00_AXI_awid => S00_AXI_awid,
      S00_AXI_awaddr => S00_AXI_awaddr,
      S00_AXI_awlen => S00_AXI_awlen,
      S00_AXI_awsize => S00_AXI_awsize,
      S00_AXI_awburst => S00_AXI_awburst,
      S00_AXI_awlock => S00_AXI_awlock,
      S00_AXI_awcache => S00_AXI_awcache,
      S00_AXI_awprot => S00_AXI_awprot,
      S00_AXI_awregion => S00_AXI_awregion,
      S00_AXI_awqos => S00_AXI_awqos,
      S00_AXI_awuser => S00_AXI_awuser,
      S00_AXI_awvalid => S00_AXI_awvalid,
      S00_AXI_awready => S00_AXI_awready,
      S00_AXI_wid => S00_AXI_wid,
      S00_AXI_wdata => S00_AXI_wdata,
      S00_AXI_wstrb => S00_AXI_wstrb,
      S00_AXI_wlast => S00_AXI_wlast,
      S00_AXI_wuser => S00_AXI_wuser,
      S00_AXI_wvalid => S00_AXI_wvalid,
      S00_AXI_wready => S00_AXI_wready,
      S00_AXI_bid => S00_AXI_bid,
      S00_AXI_bresp => S00_AXI_bresp,
      S00_AXI_buser => S00_AXI_buser,
      S00_AXI_bvalid => S00_AXI_bvalid,
      S00_AXI_bready => S00_AXI_bready,
      S00_AXI_arid => S00_AXI_arid,
      S00_AXI_araddr => S00_AXI_araddr,
      S00_AXI_arlen => S00_AXI_arlen,
      S00_AXI_arsize => S00_AXI_arsize,
      S00_AXI_arburst => S00_AXI_arburst,
      S00_AXI_arlock => S00_AXI_arlock,
      S00_AXI_arcache => S00_AXI_arcache,
      S00_AXI_arprot => S00_AXI_arprot,
      S00_AXI_arregion => S00_AXI_arregion,
      S00_AXI_arqos => S00_AXI_arqos,
      S00_AXI_aruser => S00_AXI_aruser,
      S00_AXI_arvalid => S00_AXI_arvalid,
      S00_AXI_arready => S00_AXI_arready,
      S00_AXI_rid => S00_AXI_rid,
      S00_AXI_rdata => S00_AXI_rdata,
      S00_AXI_rresp => S00_AXI_rresp,
      S00_AXI_rlast => S00_AXI_rlast,
      S00_AXI_ruser => S00_AXI_ruser,
      S00_AXI_rvalid => S00_AXI_rvalid,
      S00_AXI_rready => S00_AXI_rready,
      S01_AXI_awaddr => S01_AXI_awaddr,
      S01_AXI_awlen => S01_AXI_awlen,
      S01_AXI_awsize => S01_AXI_awsize,
      S01_AXI_awburst => S01_AXI_awburst,
      S01_AXI_awlock => S01_AXI_awlock,
      S01_AXI_awcache => S01_AXI_awcache,
      S01_AXI_awprot => S01_AXI_awprot,
      S01_AXI_awqos => S01_AXI_awqos,
      S01_AXI_awvalid => S01_AXI_awvalid,
      S01_AXI_awready => S01_AXI_awready,
      S01_AXI_wdata => S01_AXI_wdata,
      S01_AXI_wstrb => S01_AXI_wstrb,
      S01_AXI_wlast => S01_AXI_wlast,
      S01_AXI_wvalid => S01_AXI_wvalid,
      S01_AXI_wready => S01_AXI_wready,
      S01_AXI_bresp => S01_AXI_bresp,
      S01_AXI_bvalid => S01_AXI_bvalid,
      S01_AXI_bready => S01_AXI_bready,
      S01_AXI_araddr => S01_AXI_araddr,
      S01_AXI_arlen => S01_AXI_arlen,
      S01_AXI_arsize => S01_AXI_arsize,
      S01_AXI_arburst => S01_AXI_arburst,
      S01_AXI_arlock => S01_AXI_arlock,
      S01_AXI_arcache => S01_AXI_arcache,
      S01_AXI_arprot => S01_AXI_arprot,
      S01_AXI_arqos => S01_AXI_arqos,
      S01_AXI_arvalid => S01_AXI_arvalid,
      S01_AXI_arready => S01_AXI_arready,
      S01_AXI_rdata => S01_AXI_rdata,
      S01_AXI_rresp => S01_AXI_rresp,
      S01_AXI_rlast => S01_AXI_rlast,
      S01_AXI_rvalid => S01_AXI_rvalid,
      S01_AXI_rready => S01_AXI_rready,
      S02_AXI_awaddr => S02_AXI_awaddr,
      S02_AXI_awlen => S02_AXI_awlen,
      S02_AXI_awsize => S02_AXI_awsize,
      S02_AXI_awburst => S02_AXI_awburst,
      S02_AXI_awlock => S02_AXI_awlock,
      S02_AXI_awcache => S02_AXI_awcache,
      S02_AXI_awprot => S02_AXI_awprot,
      S02_AXI_awqos => S02_AXI_awqos,
      S02_AXI_awvalid => S02_AXI_awvalid,
      S02_AXI_awready => S02_AXI_awready,
      S02_AXI_wdata => S02_AXI_wdata,
      S02_AXI_wstrb => S02_AXI_wstrb,
      S02_AXI_wlast => S02_AXI_wlast,
      S02_AXI_wvalid => S02_AXI_wvalid,
      S02_AXI_wready => S02_AXI_wready,
      S02_AXI_bresp => S02_AXI_bresp,
      S02_AXI_bvalid => S02_AXI_bvalid,
      S02_AXI_bready => S02_AXI_bready,
      S02_AXI_araddr => S02_AXI_araddr,
      S02_AXI_arlen => S02_AXI_arlen,
      S02_AXI_arsize => S02_AXI_arsize,
      S02_AXI_arburst => S02_AXI_arburst,
      S02_AXI_arlock => S02_AXI_arlock,
      S02_AXI_arcache => S02_AXI_arcache,
      S02_AXI_arprot => S02_AXI_arprot,
      S02_AXI_arqos => S02_AXI_arqos,
      S02_AXI_arvalid => S02_AXI_arvalid,
      S02_AXI_arready => S02_AXI_arready,
      S02_AXI_rdata => S02_AXI_rdata,
      S02_AXI_rresp => S02_AXI_rresp,
      S02_AXI_rlast => S02_AXI_rlast,
      S02_AXI_rvalid => S02_AXI_rvalid,
      S02_AXI_rready => S02_AXI_rready,
      S03_AXI_awaddr => S03_AXI_awaddr,
      S03_AXI_awlen => S03_AXI_awlen,
      S03_AXI_awsize => S03_AXI_awsize,
      S03_AXI_awburst => S03_AXI_awburst,
      S03_AXI_awlock => S03_AXI_awlock,
      S03_AXI_awcache => S03_AXI_awcache,
      S03_AXI_awprot => S03_AXI_awprot,
      S03_AXI_awqos => S03_AXI_awqos,
      S03_AXI_awvalid => S03_AXI_awvalid,
      S03_AXI_awready => S03_AXI_awready,
      S03_AXI_wdata => S03_AXI_wdata,
      S03_AXI_wstrb => S03_AXI_wstrb,
      S03_AXI_wlast => S03_AXI_wlast,
      S03_AXI_wvalid => S03_AXI_wvalid,
      S03_AXI_wready => S03_AXI_wready,
      S03_AXI_bresp => S03_AXI_bresp,
      S03_AXI_bvalid => S03_AXI_bvalid,
      S03_AXI_bready => S03_AXI_bready,
      S03_AXI_araddr => S03_AXI_araddr,
      S03_AXI_arlen => S03_AXI_arlen,
      S03_AXI_arsize => S03_AXI_arsize,
      S03_AXI_arburst => S03_AXI_arburst,
      S03_AXI_arlock => S03_AXI_arlock,
      S03_AXI_arcache => S03_AXI_arcache,
      S03_AXI_arprot => S03_AXI_arprot,
      S03_AXI_arqos => S03_AXI_arqos,
      S03_AXI_arvalid => S03_AXI_arvalid,
      S03_AXI_arready => S03_AXI_arready,
      S03_AXI_rdata => S03_AXI_rdata,
      S03_AXI_rresp => S03_AXI_rresp,
      S03_AXI_rlast => S03_AXI_rlast,
      S03_AXI_rvalid => S03_AXI_rvalid,
      S03_AXI_rready => S03_AXI_rready,
      S04_AXI_awid => S04_AXI_awid,
      S04_AXI_awaddr => S04_AXI_awaddr,
      S04_AXI_awlen => S04_AXI_awlen,
      S04_AXI_awsize => S04_AXI_awsize,
      S04_AXI_awburst => S04_AXI_awburst,
      S04_AXI_awlock => S04_AXI_awlock,
      S04_AXI_awcache => S04_AXI_awcache,
      S04_AXI_awprot => S04_AXI_awprot,
      S04_AXI_awregion => S04_AXI_awregion,
      S04_AXI_awqos => S04_AXI_awqos,
      S04_AXI_awuser => S04_AXI_awuser,
      S04_AXI_awvalid => S04_AXI_awvalid,
      S04_AXI_awready => S04_AXI_awready,
      S04_AXI_wid => S04_AXI_wid,
      S04_AXI_wdata => S04_AXI_wdata,
      S04_AXI_wstrb => S04_AXI_wstrb,
      S04_AXI_wlast => S04_AXI_wlast,
      S04_AXI_wuser => S04_AXI_wuser,
      S04_AXI_wvalid => S04_AXI_wvalid,
      S04_AXI_wready => S04_AXI_wready,
      S04_AXI_bid => S04_AXI_bid,
      S04_AXI_bresp => S04_AXI_bresp,
      S04_AXI_buser => S04_AXI_buser,
      S04_AXI_bvalid => S04_AXI_bvalid,
      S04_AXI_bready => S04_AXI_bready,
      S04_AXI_arid => S04_AXI_arid,
      S04_AXI_araddr => S04_AXI_araddr,
      S04_AXI_arlen => S04_AXI_arlen,
      S04_AXI_arsize => S04_AXI_arsize,
      S04_AXI_arburst => S04_AXI_arburst,
      S04_AXI_arlock => S04_AXI_arlock,
      S04_AXI_arcache => S04_AXI_arcache,
      S04_AXI_arprot => S04_AXI_arprot,
      S04_AXI_arregion => S04_AXI_arregion,
      S04_AXI_arqos => S04_AXI_arqos,
      S04_AXI_aruser => S04_AXI_aruser,
      S04_AXI_arvalid => S04_AXI_arvalid,
      S04_AXI_arready => S04_AXI_arready,
      S04_AXI_rid => S04_AXI_rid,
      S04_AXI_rdata => S04_AXI_rdata,
      S04_AXI_rresp => S04_AXI_rresp,
      S04_AXI_rlast => S04_AXI_rlast,
      S04_AXI_ruser => S04_AXI_ruser,
      S04_AXI_rvalid => S04_AXI_rvalid,
      S04_AXI_rready => S04_AXI_rready,
      S05_AXI_awid => S05_AXI_awid,
      S05_AXI_awaddr => S05_AXI_awaddr,
      S05_AXI_awlen => S05_AXI_awlen,
      S05_AXI_awsize => S05_AXI_awsize,
      S05_AXI_awburst => S05_AXI_awburst,
      S05_AXI_awlock => S05_AXI_awlock,
      S05_AXI_awcache => S05_AXI_awcache,
      S05_AXI_awprot => S05_AXI_awprot,
      S05_AXI_awregion => S05_AXI_awregion,
      S05_AXI_awqos => S05_AXI_awqos,
      S05_AXI_awuser => S05_AXI_awuser,
      S05_AXI_awvalid => S05_AXI_awvalid,
      S05_AXI_awready => S05_AXI_awready,
      S05_AXI_wid => S05_AXI_wid,
      S05_AXI_wdata => S05_AXI_wdata,
      S05_AXI_wstrb => S05_AXI_wstrb,
      S05_AXI_wlast => S05_AXI_wlast,
      S05_AXI_wuser => S05_AXI_wuser,
      S05_AXI_wvalid => S05_AXI_wvalid,
      S05_AXI_wready => S05_AXI_wready,
      S05_AXI_bid => S05_AXI_bid,
      S05_AXI_bresp => S05_AXI_bresp,
      S05_AXI_buser => S05_AXI_buser,
      S05_AXI_bvalid => S05_AXI_bvalid,
      S05_AXI_bready => S05_AXI_bready,
      S05_AXI_arid => S05_AXI_arid,
      S05_AXI_araddr => S05_AXI_araddr,
      S05_AXI_arlen => S05_AXI_arlen,
      S05_AXI_arsize => S05_AXI_arsize,
      S05_AXI_arburst => S05_AXI_arburst,
      S05_AXI_arlock => S05_AXI_arlock,
      S05_AXI_arcache => S05_AXI_arcache,
      S05_AXI_arprot => S05_AXI_arprot,
      S05_AXI_arregion => S05_AXI_arregion,
      S05_AXI_arqos => S05_AXI_arqos,
      S05_AXI_aruser => S05_AXI_aruser,
      S05_AXI_arvalid => S05_AXI_arvalid,
      S05_AXI_arready => S05_AXI_arready,
      S05_AXI_rid => S05_AXI_rid,
      S05_AXI_rdata => S05_AXI_rdata,
      S05_AXI_rresp => S05_AXI_rresp,
      S05_AXI_rlast => S05_AXI_rlast,
      S05_AXI_ruser => S05_AXI_ruser,
      S05_AXI_rvalid => S05_AXI_rvalid,
      S05_AXI_rready => S05_AXI_rready,
      M00_AXI_awaddr => M00_AXI_awaddr,
      M00_AXI_awlen => M00_AXI_awlen,
      M00_AXI_awsize => M00_AXI_awsize,
      M00_AXI_awburst => M00_AXI_awburst,
      M00_AXI_awlock => M00_AXI_awlock,
      M00_AXI_awcache => M00_AXI_awcache,
      M00_AXI_awprot => M00_AXI_awprot,
      M00_AXI_awqos => M00_AXI_awqos,
      M00_AXI_awvalid => M00_AXI_awvalid,
      M00_AXI_awready => M00_AXI_awready,
      M00_AXI_wdata => M00_AXI_wdata,
      M00_AXI_wstrb => M00_AXI_wstrb,
      M00_AXI_wlast => M00_AXI_wlast,
      M00_AXI_wvalid => M00_AXI_wvalid,
      M00_AXI_wready => M00_AXI_wready,
      M00_AXI_bresp => M00_AXI_bresp,
      M00_AXI_bvalid => M00_AXI_bvalid,
      M00_AXI_bready => M00_AXI_bready,
      M00_AXI_araddr => M00_AXI_araddr,
      M00_AXI_arlen => M00_AXI_arlen,
      M00_AXI_arsize => M00_AXI_arsize,
      M00_AXI_arburst => M00_AXI_arburst,
      M00_AXI_arlock => M00_AXI_arlock,
      M00_AXI_arcache => M00_AXI_arcache,
      M00_AXI_arprot => M00_AXI_arprot,
      M00_AXI_arqos => M00_AXI_arqos,
      M00_AXI_arvalid => M00_AXI_arvalid,
      M00_AXI_arready => M00_AXI_arready,
      M00_AXI_rdata => M00_AXI_rdata,
      M00_AXI_rresp => M00_AXI_rresp,
      M00_AXI_rlast => M00_AXI_rlast,
      M00_AXI_rvalid => M00_AXI_rvalid,
      M00_AXI_rready => M00_AXI_rready
    );
END img_proc_hw_axi_smc_0_arch;
