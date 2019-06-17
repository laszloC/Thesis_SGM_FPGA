# Runtime Tcl commands to interact with - sgm_v1_0

# Sourcing design address info tcl
set bd_path [get_property DIRECTORY [current_project]]/[current_project].srcs/[current_fileset]/bd
source ${bd_path}/sgm_v1_0_include.tcl

# jtag axi master interface hardware name, change as per your design.
set jtag_axi_master hw_axi_1
set ec 0

# hw test script
# Delete all previous axis transactions
if { [llength [get_hw_axi_txns -quiet]] } {
	delete_hw_axi_txn [get_hw_axi_txns -quiet]
}


# Test all lite slaves.
set wdata_1 abcd1234

# Test: img_in
# Create a write transaction at img_in_addr address
create_hw_axi_txn w_img_in_addr [get_hw_axis $jtag_axi_master] -type write -address $img_in_addr -data $wdata_1
# Create a read transaction at img_in_addr address
create_hw_axi_txn r_img_in_addr [get_hw_axis $jtag_axi_master] -type read -address $img_in_addr
# Initiate transactions
run_hw_axi r_img_in_addr
run_hw_axi w_img_in_addr
run_hw_axi r_img_in_addr
set rdata_tmp [get_property DATA [get_hw_axi_txn r_img_in_addr]]
# Compare read data
if { $rdata_tmp == $wdata_1 } {
	puts "Data comparison test pass for - img_in"
} else {
	puts "Data comparison test fail for - img_in, expected-$wdata_1 actual-$rdata_tmp"
	inc ec
}

# Test: img_out
# Create a write transaction at img_out_addr address
create_hw_axi_txn w_img_out_addr [get_hw_axis $jtag_axi_master] -type write -address $img_out_addr -data $wdata_1
# Create a read transaction at img_out_addr address
create_hw_axi_txn r_img_out_addr [get_hw_axis $jtag_axi_master] -type read -address $img_out_addr
# Initiate transactions
run_hw_axi r_img_out_addr
run_hw_axi w_img_out_addr
run_hw_axi r_img_out_addr
set rdata_tmp [get_property DATA [get_hw_axi_txn r_img_out_addr]]
# Compare read data
if { $rdata_tmp == $wdata_1 } {
	puts "Data comparison test pass for - img_out"
} else {
	puts "Data comparison test fail for - img_out, expected-$wdata_1 actual-$rdata_tmp"
	inc ec
}

# Check error flag
if { $ec == 0 } {
	 puts "PTGEN_TEST: PASSED!" 
} else {
	 puts "PTGEN_TEST: FAILED!" 
}

