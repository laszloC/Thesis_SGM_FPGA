# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1 \
    name cost_in_m_img \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cost_in_m_img \
    op interface \
    ports { m_axi_cost_in_m_img_AWVALID { O 1 bit } m_axi_cost_in_m_img_AWREADY { I 1 bit } m_axi_cost_in_m_img_AWADDR { O 32 vector } m_axi_cost_in_m_img_AWID { O 1 vector } m_axi_cost_in_m_img_AWLEN { O 32 vector } m_axi_cost_in_m_img_AWSIZE { O 3 vector } m_axi_cost_in_m_img_AWBURST { O 2 vector } m_axi_cost_in_m_img_AWLOCK { O 2 vector } m_axi_cost_in_m_img_AWCACHE { O 4 vector } m_axi_cost_in_m_img_AWPROT { O 3 vector } m_axi_cost_in_m_img_AWQOS { O 4 vector } m_axi_cost_in_m_img_AWREGION { O 4 vector } m_axi_cost_in_m_img_AWUSER { O 1 vector } m_axi_cost_in_m_img_WVALID { O 1 bit } m_axi_cost_in_m_img_WREADY { I 1 bit } m_axi_cost_in_m_img_WDATA { O 32 vector } m_axi_cost_in_m_img_WSTRB { O 4 vector } m_axi_cost_in_m_img_WLAST { O 1 bit } m_axi_cost_in_m_img_WID { O 1 vector } m_axi_cost_in_m_img_WUSER { O 1 vector } m_axi_cost_in_m_img_ARVALID { O 1 bit } m_axi_cost_in_m_img_ARREADY { I 1 bit } m_axi_cost_in_m_img_ARADDR { O 32 vector } m_axi_cost_in_m_img_ARID { O 1 vector } m_axi_cost_in_m_img_ARLEN { O 32 vector } m_axi_cost_in_m_img_ARSIZE { O 3 vector } m_axi_cost_in_m_img_ARBURST { O 2 vector } m_axi_cost_in_m_img_ARLOCK { O 2 vector } m_axi_cost_in_m_img_ARCACHE { O 4 vector } m_axi_cost_in_m_img_ARPROT { O 3 vector } m_axi_cost_in_m_img_ARQOS { O 4 vector } m_axi_cost_in_m_img_ARREGION { O 4 vector } m_axi_cost_in_m_img_ARUSER { O 1 vector } m_axi_cost_in_m_img_RVALID { I 1 bit } m_axi_cost_in_m_img_RREADY { O 1 bit } m_axi_cost_in_m_img_RDATA { I 32 vector } m_axi_cost_in_m_img_RLAST { I 1 bit } m_axi_cost_in_m_img_RID { I 1 vector } m_axi_cost_in_m_img_RUSER { I 1 vector } m_axi_cost_in_m_img_RRESP { I 2 vector } m_axi_cost_in_m_img_BVALID { I 1 bit } m_axi_cost_in_m_img_BREADY { O 1 bit } m_axi_cost_in_m_img_BRESP { I 2 vector } m_axi_cost_in_m_img_BID { I 1 vector } m_axi_cost_in_m_img_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2 \
    name disp_out_m_img \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_disp_out_m_img \
    op interface \
    ports { m_axi_disp_out_m_img_AWVALID { O 1 bit } m_axi_disp_out_m_img_AWREADY { I 1 bit } m_axi_disp_out_m_img_AWADDR { O 32 vector } m_axi_disp_out_m_img_AWID { O 1 vector } m_axi_disp_out_m_img_AWLEN { O 32 vector } m_axi_disp_out_m_img_AWSIZE { O 3 vector } m_axi_disp_out_m_img_AWBURST { O 2 vector } m_axi_disp_out_m_img_AWLOCK { O 2 vector } m_axi_disp_out_m_img_AWCACHE { O 4 vector } m_axi_disp_out_m_img_AWPROT { O 3 vector } m_axi_disp_out_m_img_AWQOS { O 4 vector } m_axi_disp_out_m_img_AWREGION { O 4 vector } m_axi_disp_out_m_img_AWUSER { O 1 vector } m_axi_disp_out_m_img_WVALID { O 1 bit } m_axi_disp_out_m_img_WREADY { I 1 bit } m_axi_disp_out_m_img_WDATA { O 8 vector } m_axi_disp_out_m_img_WSTRB { O 1 vector } m_axi_disp_out_m_img_WLAST { O 1 bit } m_axi_disp_out_m_img_WID { O 1 vector } m_axi_disp_out_m_img_WUSER { O 1 vector } m_axi_disp_out_m_img_ARVALID { O 1 bit } m_axi_disp_out_m_img_ARREADY { I 1 bit } m_axi_disp_out_m_img_ARADDR { O 32 vector } m_axi_disp_out_m_img_ARID { O 1 vector } m_axi_disp_out_m_img_ARLEN { O 32 vector } m_axi_disp_out_m_img_ARSIZE { O 3 vector } m_axi_disp_out_m_img_ARBURST { O 2 vector } m_axi_disp_out_m_img_ARLOCK { O 2 vector } m_axi_disp_out_m_img_ARCACHE { O 4 vector } m_axi_disp_out_m_img_ARPROT { O 3 vector } m_axi_disp_out_m_img_ARQOS { O 4 vector } m_axi_disp_out_m_img_ARREGION { O 4 vector } m_axi_disp_out_m_img_ARUSER { O 1 vector } m_axi_disp_out_m_img_RVALID { I 1 bit } m_axi_disp_out_m_img_RREADY { O 1 bit } m_axi_disp_out_m_img_RDATA { I 8 vector } m_axi_disp_out_m_img_RLAST { I 1 bit } m_axi_disp_out_m_img_RID { I 1 vector } m_axi_disp_out_m_img_RUSER { I 1 vector } m_axi_disp_out_m_img_RRESP { I 2 vector } m_axi_disp_out_m_img_BVALID { I 1 bit } m_axi_disp_out_m_img_BREADY { O 1 bit } m_axi_disp_out_m_img_BRESP { I 2 vector } m_axi_disp_out_m_img_BID { I 1 vector } m_axi_disp_out_m_img_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


