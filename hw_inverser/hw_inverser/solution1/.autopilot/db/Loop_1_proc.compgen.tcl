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
    name img_in \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_img_in \
    op interface \
    ports { m_axi_img_in_AWVALID { O 1 bit } m_axi_img_in_AWREADY { I 1 bit } m_axi_img_in_AWADDR { O 32 vector } m_axi_img_in_AWID { O 1 vector } m_axi_img_in_AWLEN { O 32 vector } m_axi_img_in_AWSIZE { O 3 vector } m_axi_img_in_AWBURST { O 2 vector } m_axi_img_in_AWLOCK { O 2 vector } m_axi_img_in_AWCACHE { O 4 vector } m_axi_img_in_AWPROT { O 3 vector } m_axi_img_in_AWQOS { O 4 vector } m_axi_img_in_AWREGION { O 4 vector } m_axi_img_in_AWUSER { O 1 vector } m_axi_img_in_WVALID { O 1 bit } m_axi_img_in_WREADY { I 1 bit } m_axi_img_in_WDATA { O 8 vector } m_axi_img_in_WSTRB { O 1 vector } m_axi_img_in_WLAST { O 1 bit } m_axi_img_in_WID { O 1 vector } m_axi_img_in_WUSER { O 1 vector } m_axi_img_in_ARVALID { O 1 bit } m_axi_img_in_ARREADY { I 1 bit } m_axi_img_in_ARADDR { O 32 vector } m_axi_img_in_ARID { O 1 vector } m_axi_img_in_ARLEN { O 32 vector } m_axi_img_in_ARSIZE { O 3 vector } m_axi_img_in_ARBURST { O 2 vector } m_axi_img_in_ARLOCK { O 2 vector } m_axi_img_in_ARCACHE { O 4 vector } m_axi_img_in_ARPROT { O 3 vector } m_axi_img_in_ARQOS { O 4 vector } m_axi_img_in_ARREGION { O 4 vector } m_axi_img_in_ARUSER { O 1 vector } m_axi_img_in_RVALID { I 1 bit } m_axi_img_in_RREADY { O 1 bit } m_axi_img_in_RDATA { I 8 vector } m_axi_img_in_RLAST { I 1 bit } m_axi_img_in_RID { I 1 vector } m_axi_img_in_RUSER { I 1 vector } m_axi_img_in_RRESP { I 2 vector } m_axi_img_in_BVALID { I 1 bit } m_axi_img_in_BREADY { O 1 bit } m_axi_img_in_BRESP { I 2 vector } m_axi_img_in_BID { I 1 vector } m_axi_img_in_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2 \
    name img_in_offset \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_img_in_offset \
    op interface \
    ports { img_in_offset { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3 \
    name img_out_offset \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_img_out_offset \
    op interface \
    ports { img_out_offset { I 32 vector } } \
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
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } ap_continue { I 1 bit } } \
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


