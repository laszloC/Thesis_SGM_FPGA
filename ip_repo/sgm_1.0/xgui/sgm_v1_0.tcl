# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  set C_img_in_DATA_WIDTH [ipgui::add_param $IPINST -name "C_img_in_DATA_WIDTH" -parent ${Page_0} -widget comboBox]
  set_property tooltip {Width of S_AXI data bus} ${C_img_in_DATA_WIDTH}
  set C_img_in_ADDR_WIDTH [ipgui::add_param $IPINST -name "C_img_in_ADDR_WIDTH" -parent ${Page_0}]
  set_property tooltip {Width of S_AXI address bus} ${C_img_in_ADDR_WIDTH}
  ipgui::add_param $IPINST -name "C_img_in_BASEADDR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_img_in_HIGHADDR" -parent ${Page_0}
  set C_img_out_DATA_WIDTH [ipgui::add_param $IPINST -name "C_img_out_DATA_WIDTH" -parent ${Page_0} -widget comboBox]
  set_property tooltip {Width of S_AXI data bus} ${C_img_out_DATA_WIDTH}
  set C_img_out_ADDR_WIDTH [ipgui::add_param $IPINST -name "C_img_out_ADDR_WIDTH" -parent ${Page_0}]
  set_property tooltip {Width of S_AXI address bus} ${C_img_out_ADDR_WIDTH}
  ipgui::add_param $IPINST -name "C_img_out_BASEADDR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_img_out_HIGHADDR" -parent ${Page_0}


}

proc update_PARAM_VALUE.C_img_in_DATA_WIDTH { PARAM_VALUE.C_img_in_DATA_WIDTH } {
	# Procedure called to update C_img_in_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_img_in_DATA_WIDTH { PARAM_VALUE.C_img_in_DATA_WIDTH } {
	# Procedure called to validate C_img_in_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_img_in_ADDR_WIDTH { PARAM_VALUE.C_img_in_ADDR_WIDTH } {
	# Procedure called to update C_img_in_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_img_in_ADDR_WIDTH { PARAM_VALUE.C_img_in_ADDR_WIDTH } {
	# Procedure called to validate C_img_in_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_img_in_BASEADDR { PARAM_VALUE.C_img_in_BASEADDR } {
	# Procedure called to update C_img_in_BASEADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_img_in_BASEADDR { PARAM_VALUE.C_img_in_BASEADDR } {
	# Procedure called to validate C_img_in_BASEADDR
	return true
}

proc update_PARAM_VALUE.C_img_in_HIGHADDR { PARAM_VALUE.C_img_in_HIGHADDR } {
	# Procedure called to update C_img_in_HIGHADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_img_in_HIGHADDR { PARAM_VALUE.C_img_in_HIGHADDR } {
	# Procedure called to validate C_img_in_HIGHADDR
	return true
}

proc update_PARAM_VALUE.C_img_out_DATA_WIDTH { PARAM_VALUE.C_img_out_DATA_WIDTH } {
	# Procedure called to update C_img_out_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_img_out_DATA_WIDTH { PARAM_VALUE.C_img_out_DATA_WIDTH } {
	# Procedure called to validate C_img_out_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_img_out_ADDR_WIDTH { PARAM_VALUE.C_img_out_ADDR_WIDTH } {
	# Procedure called to update C_img_out_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_img_out_ADDR_WIDTH { PARAM_VALUE.C_img_out_ADDR_WIDTH } {
	# Procedure called to validate C_img_out_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_img_out_BASEADDR { PARAM_VALUE.C_img_out_BASEADDR } {
	# Procedure called to update C_img_out_BASEADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_img_out_BASEADDR { PARAM_VALUE.C_img_out_BASEADDR } {
	# Procedure called to validate C_img_out_BASEADDR
	return true
}

proc update_PARAM_VALUE.C_img_out_HIGHADDR { PARAM_VALUE.C_img_out_HIGHADDR } {
	# Procedure called to update C_img_out_HIGHADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_img_out_HIGHADDR { PARAM_VALUE.C_img_out_HIGHADDR } {
	# Procedure called to validate C_img_out_HIGHADDR
	return true
}


proc update_MODELPARAM_VALUE.C_img_in_DATA_WIDTH { MODELPARAM_VALUE.C_img_in_DATA_WIDTH PARAM_VALUE.C_img_in_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_img_in_DATA_WIDTH}] ${MODELPARAM_VALUE.C_img_in_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_img_in_ADDR_WIDTH { MODELPARAM_VALUE.C_img_in_ADDR_WIDTH PARAM_VALUE.C_img_in_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_img_in_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_img_in_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_img_out_DATA_WIDTH { MODELPARAM_VALUE.C_img_out_DATA_WIDTH PARAM_VALUE.C_img_out_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_img_out_DATA_WIDTH}] ${MODELPARAM_VALUE.C_img_out_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_img_out_ADDR_WIDTH { MODELPARAM_VALUE.C_img_out_ADDR_WIDTH PARAM_VALUE.C_img_out_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_img_out_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_img_out_ADDR_WIDTH}
}

