library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sgm_v1_0 is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface img_in
		C_img_in_DATA_WIDTH	: integer	:= 32;
		C_img_in_ADDR_WIDTH	: integer	:= 4;

		-- Parameters of Axi Slave Bus Interface img_out
		C_img_out_DATA_WIDTH	: integer	:= 32;
		C_img_out_ADDR_WIDTH	: integer	:= 4
	);
	port (
		-- Users to add ports here

		-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Slave Bus Interface img_in
		img_in_aclk	: in std_logic;
		img_in_aresetn	: in std_logic;
		img_in_awaddr	: in std_logic_vector(C_img_in_ADDR_WIDTH-1 downto 0);
		img_in_awprot	: in std_logic_vector(2 downto 0);
		img_in_awvalid	: in std_logic;
		img_in_awready	: out std_logic;
		img_in_wdata	: in std_logic_vector(C_img_in_DATA_WIDTH-1 downto 0);
		img_in_wstrb	: in std_logic_vector((C_img_in_DATA_WIDTH/8)-1 downto 0);
		img_in_wvalid	: in std_logic;
		img_in_wready	: out std_logic;
		img_in_bresp	: out std_logic_vector(1 downto 0);
		img_in_bvalid	: out std_logic;
		img_in_bready	: in std_logic;
		img_in_araddr	: in std_logic_vector(C_img_in_ADDR_WIDTH-1 downto 0);
		img_in_arprot	: in std_logic_vector(2 downto 0);
		img_in_arvalid	: in std_logic;
		img_in_arready	: out std_logic;
		img_in_rdata	: out std_logic_vector(C_img_in_DATA_WIDTH-1 downto 0);
		img_in_rresp	: out std_logic_vector(1 downto 0);
		img_in_rvalid	: out std_logic;
		img_in_rready	: in std_logic;

		-- Ports of Axi Slave Bus Interface img_out
		img_out_aclk	: in std_logic;
		img_out_aresetn	: in std_logic;
		img_out_awaddr	: in std_logic_vector(C_img_out_ADDR_WIDTH-1 downto 0);
		img_out_awprot	: in std_logic_vector(2 downto 0);
		img_out_awvalid	: in std_logic;
		img_out_awready	: out std_logic;
		img_out_wdata	: in std_logic_vector(C_img_out_DATA_WIDTH-1 downto 0);
		img_out_wstrb	: in std_logic_vector((C_img_out_DATA_WIDTH/8)-1 downto 0);
		img_out_wvalid	: in std_logic;
		img_out_wready	: out std_logic;
		img_out_bresp	: out std_logic_vector(1 downto 0);
		img_out_bvalid	: out std_logic;
		img_out_bready	: in std_logic;
		img_out_araddr	: in std_logic_vector(C_img_out_ADDR_WIDTH-1 downto 0);
		img_out_arprot	: in std_logic_vector(2 downto 0);
		img_out_arvalid	: in std_logic;
		img_out_arready	: out std_logic;
		img_out_rdata	: out std_logic_vector(C_img_out_DATA_WIDTH-1 downto 0);
		img_out_rresp	: out std_logic_vector(1 downto 0);
		img_out_rvalid	: out std_logic;
		img_out_rready	: in std_logic
	);
end sgm_v1_0;

architecture arch_imp of sgm_v1_0 is

	-- component declaration
	component sgm_v1_0_img_in is
		generic (
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	: integer	:= 4
		);
		port (
		S_AXI_ACLK	: in std_logic;
		S_AXI_ARESETN	: in std_logic;
		S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
		S_AXI_AWVALID	: in std_logic;
		S_AXI_AWREADY	: out std_logic;
		S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		S_AXI_WVALID	: in std_logic;
		S_AXI_WREADY	: out std_logic;
		S_AXI_BRESP	: out std_logic_vector(1 downto 0);
		S_AXI_BVALID	: out std_logic;
		S_AXI_BREADY	: in std_logic;
		S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
		S_AXI_ARVALID	: in std_logic;
		S_AXI_ARREADY	: out std_logic;
		S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_RRESP	: out std_logic_vector(1 downto 0);
		S_AXI_RVALID	: out std_logic;
		S_AXI_RREADY	: in std_logic
		);
	end component sgm_v1_0_img_in;

	component sgm_v1_0_img_out is
		generic (
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	: integer	:= 4
		);
		port (
		S_AXI_ACLK	: in std_logic;
		S_AXI_ARESETN	: in std_logic;
		S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
		S_AXI_AWVALID	: in std_logic;
		S_AXI_AWREADY	: out std_logic;
		S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		S_AXI_WVALID	: in std_logic;
		S_AXI_WREADY	: out std_logic;
		S_AXI_BRESP	: out std_logic_vector(1 downto 0);
		S_AXI_BVALID	: out std_logic;
		S_AXI_BREADY	: in std_logic;
		S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
		S_AXI_ARVALID	: in std_logic;
		S_AXI_ARREADY	: out std_logic;
		S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_RRESP	: out std_logic_vector(1 downto 0);
		S_AXI_RVALID	: out std_logic;
		S_AXI_RREADY	: in std_logic
		);
	end component sgm_v1_0_img_out;

begin

-- Instantiation of Axi Bus Interface img_in
sgm_v1_0_img_in_inst : sgm_v1_0_img_in
	generic map (
		C_S_AXI_DATA_WIDTH	=> C_img_in_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_img_in_ADDR_WIDTH
	)
	port map (
		S_AXI_ACLK	=> img_in_aclk,
		S_AXI_ARESETN	=> img_in_aresetn,
		S_AXI_AWADDR	=> img_in_awaddr,
		S_AXI_AWPROT	=> img_in_awprot,
		S_AXI_AWVALID	=> img_in_awvalid,
		S_AXI_AWREADY	=> img_in_awready,
		S_AXI_WDATA	=> img_in_wdata,
		S_AXI_WSTRB	=> img_in_wstrb,
		S_AXI_WVALID	=> img_in_wvalid,
		S_AXI_WREADY	=> img_in_wready,
		S_AXI_BRESP	=> img_in_bresp,
		S_AXI_BVALID	=> img_in_bvalid,
		S_AXI_BREADY	=> img_in_bready,
		S_AXI_ARADDR	=> img_in_araddr,
		S_AXI_ARPROT	=> img_in_arprot,
		S_AXI_ARVALID	=> img_in_arvalid,
		S_AXI_ARREADY	=> img_in_arready,
		S_AXI_RDATA	=> img_in_rdata,
		S_AXI_RRESP	=> img_in_rresp,
		S_AXI_RVALID	=> img_in_rvalid,
		S_AXI_RREADY	=> img_in_rready
	);

-- Instantiation of Axi Bus Interface img_out
sgm_v1_0_img_out_inst : sgm_v1_0_img_out
	generic map (
		C_S_AXI_DATA_WIDTH	=> C_img_out_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_img_out_ADDR_WIDTH
	)
	port map (
		S_AXI_ACLK	=> img_out_aclk,
		S_AXI_ARESETN	=> img_out_aresetn,
		S_AXI_AWADDR	=> img_out_awaddr,
		S_AXI_AWPROT	=> img_out_awprot,
		S_AXI_AWVALID	=> img_out_awvalid,
		S_AXI_AWREADY	=> img_out_awready,
		S_AXI_WDATA	=> img_out_wdata,
		S_AXI_WSTRB	=> img_out_wstrb,
		S_AXI_WVALID	=> img_out_wvalid,
		S_AXI_WREADY	=> img_out_wready,
		S_AXI_BRESP	=> img_out_bresp,
		S_AXI_BVALID	=> img_out_bvalid,
		S_AXI_BREADY	=> img_out_bready,
		S_AXI_ARADDR	=> img_out_araddr,
		S_AXI_ARPROT	=> img_out_arprot,
		S_AXI_ARVALID	=> img_out_arvalid,
		S_AXI_ARREADY	=> img_out_arready,
		S_AXI_RDATA	=> img_out_rdata,
		S_AXI_RRESP	=> img_out_rresp,
		S_AXI_RVALID	=> img_out_rvalid,
		S_AXI_RREADY	=> img_out_rready
	);

	-- Add user logic here

	-- User logic ends

end arch_imp;
