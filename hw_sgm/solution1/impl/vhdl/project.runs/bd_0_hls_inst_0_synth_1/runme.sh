#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
# 

echo "This script was generated under a different operating system."
echo "Please update the PATH and LD_LIBRARY_PATH variables below, before executing this script"
exit

if [ -z "$PATH" ]; then
  PATH=E:/Programs/Xilinx/SDK/2018.3/bin;E:/Programs/Xilinx/Vivado/2018.3/ids_lite/ISE/bin/nt64;E:/Programs/Xilinx/Vivado/2018.3/ids_lite/ISE/lib/nt64:E:/Programs/Xilinx/Vivado/2018.3/bin
else
  PATH=E:/Programs/Xilinx/SDK/2018.3/bin;E:/Programs/Xilinx/Vivado/2018.3/ids_lite/ISE/bin/nt64;E:/Programs/Xilinx/Vivado/2018.3/ids_lite/ISE/lib/nt64:E:/Programs/Xilinx/Vivado/2018.3/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='E:/Git/Thesis_SGM_FPGA/hw_sgm/solution1/impl/vhdl/project.runs/bd_0_hls_inst_0_synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log bd_0_hls_inst_0.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source bd_0_hls_inst_0.tcl
