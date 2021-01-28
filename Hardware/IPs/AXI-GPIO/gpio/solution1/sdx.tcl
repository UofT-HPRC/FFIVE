# ==============================================================
# File generated on Wed Jan 27 13:58:24 EST 2021
# Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
# SW Build 2405991 on Thu Dec  6 23:36:41 MST 2018
# IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
# ==============================================================
add_files AXI_GPIO.cpp
add_files gpio.cpp
set_part xcu250-figd2104-2L-e
create_clock -name default -period 3
config_export -format=ip_catalog
config_export -rtl=verilog
config_export -vivado_phys_opt=place
config_export -vivado_report_level=0
config_rtl -encoding=onehot
config_rtl -reset=all
config_rtl -reset_level=low
