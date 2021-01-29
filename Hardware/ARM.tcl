# Create ARM Hierarchy
create_bd_cell -type hier ARM

# Core
create_bd_cell -type ip -vlnv xilinx.com:ip:zynq_ultra_ps_e:3.2 ARM/ARM
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 ARM/ARM_interconnect
create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 ARM/ARM_clk_reset_core
create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 ARM/VNF_clk_reset_core
create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 ARM/network_reset_core

# Configuration
source ARM_config.tcl
set_property -dict [apply_preset arm_preset] [get_bd_cells ARM/ARM]
set_property -dict [list CONFIG.NUM_MI {5}] [get_bd_cells ARM/ARM_interconnect]
set_property -dict [list CONFIG.PSU__FPGA_PL1_ENABLE {1}] [get_bd_cells ARM/ARM]
set_property -dict [list CONFIG.PSU__CRL_APB__PL1_REF_CTRL__DIVISOR0 {3} CONFIG.PSU__CRL_APB__PL1_REF_CTRL__DIVISOR1 {1}] [get_bd_cells ARM/ARM]
set_property -dict [list CONFIG.PSU__FPGA_PL2_ENABLE {1}] [get_bd_cells ARM/ARM]
set DIV1 [lindex ${CLOCK_DIVS} 0]
set DIV2 [lindex ${CLOCK_DIVS} 1]
set_property -dict [list CONFIG.PSU__CRL_APB__PL2_REF_CTRL__DIVISOR0 ${DIV1} CONFIG.PSU__CRL_APB__PL2_REF_CTRL__DIVISOR1 ${DIV2}] [get_bd_cells ARM/ARM]

# Ports
create_bd_pin -dir O ARM/config_clk
create_bd_pin -dir O ARM/config_reset
create_bd_pin -dir O ARM/network_reset
create_bd_pin -dir O ARM/network_clk
create_bd_pin -dir O ARM/general_reset
create_bd_pin -dir O ARM/vnf_clk
create_bd_pin -dir O ARM/vnf_reset
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 ARM/VXLAN_ctrl
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 ARM/QSFP_ctrl
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 ARM/VNF_ctrl
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 ARM/DDR4_access
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 ARM/ID_access
create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 ARM/ARM_DDR4_access

# Connections
connect_bd_intf_net [get_bd_intf_pins ARM/ARM/M_AXI_HPM0_FPD] -boundary_type upper [get_bd_intf_pins ARM/ARM_interconnect/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins ARM/ID_access] -boundary_type upper [get_bd_intf_pins ARM/ARM_interconnect/M00_AXI]
connect_bd_intf_net [get_bd_intf_pins ARM/QSFP_ctrl] -boundary_type upper [get_bd_intf_pins ARM/ARM_interconnect/M01_AXI]
connect_bd_intf_net [get_bd_intf_pins ARM/VXLAN_ctrl] -boundary_type upper [get_bd_intf_pins ARM/ARM_interconnect/M02_AXI]
connect_bd_intf_net [get_bd_intf_pins ARM/DDR4_access] -boundary_type upper [get_bd_intf_pins ARM/ARM_interconnect/M03_AXI]
connect_bd_intf_net [get_bd_intf_pins ARM/VNF_ctrl] -boundary_type upper [get_bd_intf_pins ARM/ARM_interconnect/M04_AXI]
connect_bd_intf_net [get_bd_intf_pins ARM/ARM_DDR4_access] [get_bd_intf_pins ARM/ARM/S_AXI_HP0_FPD]
connect_bd_net [get_bd_pins ARM/ARM/pl_clk0] [get_bd_pins ARM/ARM_interconnect/ACLK]
connect_bd_net [get_bd_pins ARM/ARM_interconnect/S00_ACLK] [get_bd_pins ARM/ARM/pl_clk0]
connect_bd_net [get_bd_pins ARM/ARM/maxihpm0_fpd_aclk] [get_bd_pins ARM/ARM/pl_clk0]
connect_bd_net [get_bd_pins ARM/ARM/saxihp0_fpd_aclk] [get_bd_pins ARM/ARM/pl_clk0]
connect_bd_net [get_bd_pins ARM/ARM_clk_reset_core/slowest_sync_clk] [get_bd_pins ARM/ARM/pl_clk0]
connect_bd_net [get_bd_pins ARM/ARM_interconnect/ARESETN] [get_bd_pins ARM/ARM_clk_reset_core/interconnect_aresetn]
connect_bd_net [get_bd_pins ARM/ARM_interconnect/S00_ARESETN] [get_bd_pins ARM/ARM_clk_reset_core/interconnect_aresetn]
connect_bd_net [get_bd_pins ARM/ARM/pl_resetn0] [get_bd_pins ARM/ARM_clk_reset_core/ext_reset_in]
connect_bd_net [get_bd_pins ARM/network_reset_core/ext_reset_in] [get_bd_pins ARM/ARM/pl_resetn0]
connect_bd_net [get_bd_pins ARM/VNF_clk_reset_core/ext_reset_in] [get_bd_pins ARM/ARM/pl_resetn0]
connect_bd_net [get_bd_pins ARM/ARM_interconnect/M01_ACLK] [get_bd_pins ARM/ARM/pl_clk0]
connect_bd_net [get_bd_pins ARM/ARM_interconnect/M02_ACLK] [get_bd_pins ARM/ARM/pl_clk0]
connect_bd_net [get_bd_pins ARM/ARM_interconnect/M01_ARESETN] [get_bd_pins ARM/ARM_clk_reset_core/interconnect_aresetn]
connect_bd_net [get_bd_pins ARM/ARM_interconnect/M02_ARESETN] [get_bd_pins ARM/ARM_clk_reset_core/interconnect_aresetn]
connect_bd_net [get_bd_pins ARM/config_clk] [get_bd_pins ARM/ARM/pl_clk0]
connect_bd_net [get_bd_pins ARM/config_reset] [get_bd_pins ARM/ARM_clk_reset_core/interconnect_aresetn]
connect_bd_net [get_bd_pins ARM/network_clk] [get_bd_pins ARM/ARM/pl_clk1]
connect_bd_net [get_bd_pins ARM/network_reset] [get_bd_pins ARM/network_reset_core/interconnect_aresetn]
connect_bd_net [get_bd_pins ARM/network_reset_core/slowest_sync_clk] [get_bd_pins ARM/ARM/pl_clk1]
connect_bd_net [get_bd_pins ARM/general_reset] [get_bd_pins ARM/ARM/pl_resetn0]
connect_bd_net [get_bd_pins ARM/ARM_interconnect/M03_ACLK] [get_bd_pins ARM/ARM/pl_clk0]
connect_bd_net [get_bd_pins ARM/ARM_interconnect/M03_ARESETN] [get_bd_pins ARM/ARM_clk_reset_core/interconnect_aresetn]
connect_bd_net [get_bd_pins ARM/ARM_interconnect/M00_ACLK] [get_bd_pins ARM/ARM/pl_clk0]
connect_bd_net [get_bd_pins ARM/ARM_interconnect/M00_ARESETN] [get_bd_pins ARM/ARM_clk_reset_core/interconnect_aresetn]
connect_bd_net [get_bd_pins ARM/vnf_reset] [get_bd_pins ARM/VNF_clk_reset_core/interconnect_aresetn]
connect_bd_net [get_bd_pins ARM/ARM_interconnect/M04_ARESETN] [get_bd_pins ARM/VNF_clk_reset_core/interconnect_aresetn]
connect_bd_net [get_bd_pins ARM/VNF_clk_reset_core/slowest_sync_clk] [get_bd_pins ARM/ARM/pl_clk2]
connect_bd_net [get_bd_pins ARM/ARM_interconnect/M04_ACLK] [get_bd_pins ARM/ARM/pl_clk2]

