

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "sgm" "NUM_INSTANCES" "DEVICE_ID"  "C_img_in_BASEADDR" "C_img_in_HIGHADDR" "C_img_out_BASEADDR" "C_img_out_HIGHADDR"
}
