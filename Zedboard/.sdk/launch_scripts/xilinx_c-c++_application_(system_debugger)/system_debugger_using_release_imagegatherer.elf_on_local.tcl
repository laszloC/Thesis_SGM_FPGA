connect -url tcp:127.0.0.1:3121
source E:/Git/Thesis_SGM_FPGA/Zedboard/zed_hw_platform/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zed 210248518041"} -index 0
loadhw -hw E:/Git/Thesis_SGM_FPGA/Zedboard/zed_hw_platform/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zed 210248518041"} -index 0
stop
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zed 210248518041"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zed 210248518041"} -index 0
dow E:/Git/Thesis_SGM_FPGA/Zedboard/ImageGatherer/Release/ImageGatherer.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zed 210248518041"} -index 0
con
