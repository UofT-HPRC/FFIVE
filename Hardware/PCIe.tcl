# Create PCIe Hierarchy
create_bd_cell -type hier PCIe

# Core
create_bd_cell -type ip -vlnv xilinx.com:ip:xdma:4.1 PCIe/XDMA
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 PCIe/XDMA_interconnect
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 PCIe/xlconstant_0
create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 PCIe/util_ds_buf_0
create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 PCIe/clk_wiz_0
create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 PCIe/VNF_clk_reset_core
create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 PCIe/network_reset_core
create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 PCIe/config_reset_core

# Configuration
set_property -dict [list CONFIG.SYS_RST_N_BOARD_INTERFACE $PCIe_RESET CONFIG.PCIE_BOARD_INTERFACE $PCIe CONFIG.functional_mode {DMA} CONFIG.mode_selection {Advanced} CONFIG.en_axi_slave_if {false} CONFIG.xdma_axilite_slave {false} CONFIG.en_gt_selection {true} CONFIG.coreclk_freq {500} CONFIG.ref_clk_freq {100_MHz} CONFIG.plltype {QPLL1} CONFIG.PF0_DEVICE_ID_mqdma {903F} CONFIG.PF2_DEVICE_ID_mqdma {903F} CONFIG.PF3_DEVICE_ID_mqdma {903F}] [get_bd_cells PCIe/XDMA]
set_property -dict [list CONFIG.NUM_MI {5}] [get_bd_cells PCIe/XDMA_interconnect]
set_property -dict [list CONFIG.XBAR_DATA_WIDTH.VALUE_SRC USER CONFIG.ENABLE_ADVANCED_OPTIONS {1} CONFIG.XBAR_DATA_WIDTH {512} CONFIG.SYNCHRONIZATION_STAGES {5}] [get_bd_cells PCIe/XDMA_interconnect]
set_property -dict [list CONFIG.CONST_VAL {1}] [get_bd_cells PCIe/xlconstant_0]
set_property -dict [list CONFIG.DIFF_CLK_IN_BOARD_INTERFACE $PCIe_CLOCK CONFIG.C_BUF_TYPE {IBUFDSGTE}] [get_bd_cells PCIe/util_ds_buf_0]
set_property -dict [list CONFIG.CLK_IN1_BOARD_INTERFACE Custom CONFIG.PRIM_SOURCE {Single_ended_clock_capable_pin} CONFIG.CLKOUT2_USED {true} CONFIG.CLKOUT3_USED {true} CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {266.66667} CONFIG.CLKOUT2_REQUESTED_OUT_FREQ $USER_CLOCK CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {100} CONFIG.USE_LOCKED {false} CONFIG.NUM_OUT_CLKS {3}] [get_bd_cells PCIe/clk_wiz_0]

# Ports
create_bd_pin -dir O PCIe/config_clk
create_bd_pin -dir O PCIe/config_reset
create_bd_pin -dir O PCIe/network_reset
create_bd_pin -dir O PCIe/network_clk
create_bd_pin -dir O PCIe/general_reset
create_bd_pin -dir O PCIe/vnf_clk
create_bd_pin -dir O PCIe/vnf_reset
create_bd_pin -dir I PCIe/pcie_reset
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 PCIe/VXLAN_ctrl
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 PCIe/QSFP_ctrl
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 PCIe/VNF_ctrl
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 PCIe/DDR4_access
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 PCIe/ID_access
create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 PCIe/pcie_clk
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:pcie_7x_mgt_rtl:1.0 PCIe/$PCIe

# Connections
connect_bd_intf_net [get_bd_intf_pins PCIe/XDMA/M_AXI] -boundary_type upper [get_bd_intf_pins PCIe/XDMA_interconnect/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins PCIe/ID_access] -boundary_type upper [get_bd_intf_pins PCIe/XDMA_interconnect/M00_AXI]
connect_bd_intf_net [get_bd_intf_pins PCIe/QSFP_ctrl] -boundary_type upper [get_bd_intf_pins PCIe/XDMA_interconnect/M01_AXI]
connect_bd_intf_net [get_bd_intf_pins PCIe/VXLAN_ctrl] -boundary_type upper [get_bd_intf_pins PCIe/XDMA_interconnect/M02_AXI]
connect_bd_intf_net [get_bd_intf_pins PCIe/DDR4_access] -boundary_type upper [get_bd_intf_pins PCIe/XDMA_interconnect/M03_AXI]
connect_bd_intf_net [get_bd_intf_pins PCIe/VNF_ctrl] -boundary_type upper [get_bd_intf_pins PCIe/XDMA_interconnect/M04_AXI]
connect_bd_intf_net [get_bd_intf_pins PCIe/$PCIe] [get_bd_intf_pins PCIe/XDMA/pcie_mgt]
connect_bd_intf_net [get_bd_intf_pins PCIe/pcie_clk] [get_bd_intf_pins PCIe/util_ds_buf_0/CLK_IN_D]
connect_bd_net [get_bd_pins PCIe/XDMA_interconnect/S00_ACLK] [get_bd_pins PCIe/XDMA/axi_aclk]
connect_bd_net [get_bd_pins PCIe/config_reset_core/interconnect_aresetn] [get_bd_pins PCIe/XDMA_interconnect/ARESETN]
connect_bd_net [get_bd_pins PCIe/clk_wiz_0/clk_out3] [get_bd_pins PCIe/XDMA_interconnect/ACLK]
connect_bd_net [get_bd_pins PCIe/config_clk] [get_bd_pins PCIe/clk_wiz_0/clk_out3]
connect_bd_net [get_bd_pins PCIe/XDMA_interconnect/M00_ACLK] [get_bd_pins PCIe/clk_wiz_0/clk_out3]
connect_bd_net [get_bd_pins PCIe/XDMA_interconnect/M01_ACLK] [get_bd_pins PCIe/clk_wiz_0/clk_out3]
connect_bd_net [get_bd_pins PCIe/XDMA_interconnect/M02_ACLK] [get_bd_pins PCIe/clk_wiz_0/clk_out3]
connect_bd_net [get_bd_pins PCIe/XDMA_interconnect/M03_ACLK] [get_bd_pins PCIe/clk_wiz_0/clk_out3]
connect_bd_net [get_bd_pins PCIe/XDMA_interconnect/S00_ARESETN] [get_bd_pins PCIe/XDMA/axi_aresetn]
connect_bd_net [get_bd_pins PCIe/XDMA_interconnect/M00_ARESETN] [get_bd_pins PCIe/config_reset_core/interconnect_aresetn]
connect_bd_net [get_bd_pins PCIe/XDMA_interconnect/M01_ARESETN] [get_bd_pins PCIe/config_reset_core/interconnect_aresetn]
connect_bd_net [get_bd_pins PCIe/XDMA_interconnect/M02_ARESETN] [get_bd_pins PCIe/config_reset_core/interconnect_aresetn]
connect_bd_net [get_bd_pins PCIe/XDMA_interconnect/M03_ARESETN] [get_bd_pins PCIe/config_reset_core/interconnect_aresetn]
connect_bd_net [get_bd_pins PCIe/xlconstant_0/dout] [get_bd_pins PCIe/XDMA/usr_irq_req]
connect_bd_net [get_bd_pins PCIe/util_ds_buf_0/IBUF_OUT] [get_bd_pins PCIe/XDMA/sys_clk_gt]
connect_bd_net [get_bd_pins PCIe/util_ds_buf_0/IBUF_DS_ODIV2] [get_bd_pins PCIe/XDMA/sys_clk]
connect_bd_net [get_bd_pins PCIe/pcie_reset] [get_bd_pins PCIe/XDMA/sys_rst_n]
connect_bd_net [get_bd_pins PCIe/general_reset] [get_bd_pins PCIe/pcie_reset]
connect_bd_net [get_bd_pins PCIe/pcie_reset] [get_bd_pins PCIe/clk_wiz_0/reset]
connect_bd_net [get_bd_pins PCIe/vnf_clk] [get_bd_pins PCIe/clk_wiz_0/clk_out2]
connect_bd_net [get_bd_pins PCIe/XDMA_interconnect/M04_ACLK] [get_bd_pins PCIe/clk_wiz_0/clk_out2]
connect_bd_net [get_bd_pins PCIe/network_clk] [get_bd_pins PCIe/clk_wiz_0/clk_out1]
connect_bd_net [get_bd_pins PCIe/VNF_clk_reset_core/interconnect_aresetn] [get_bd_pins PCIe/XDMA_interconnect/M04_ARESETN]
connect_bd_net [get_bd_pins PCIe/vnf_reset] [get_bd_pins PCIe/VNF_clk_reset_core/interconnect_aresetn]
connect_bd_net [get_bd_pins PCIe/network_reset] [get_bd_pins PCIe/network_reset_core/interconnect_aresetn]
connect_bd_net [get_bd_pins PCIe/config_reset] [get_bd_pins PCIe/config_reset_core/interconnect_aresetn]
connect_bd_net [get_bd_pins PCIe/network_reset_core/slowest_sync_clk] [get_bd_pins PCIe/clk_wiz_0/clk_out1]
connect_bd_net [get_bd_pins PCIe/VNF_clk_reset_core/slowest_sync_clk] [get_bd_pins PCIe/clk_wiz_0/clk_out2]
connect_bd_net [get_bd_pins PCIe/config_reset_core/slowest_sync_clk] [get_bd_pins PCIe/clk_wiz_0/clk_out3]
connect_bd_net [get_bd_pins PCIe/network_reset_core/ext_reset_in] [get_bd_pins PCIe/pcie_reset]
connect_bd_net [get_bd_pins PCIe/VNF_clk_reset_core/ext_reset_in] [get_bd_pins PCIe/pcie_reset]
connect_bd_net [get_bd_pins PCIe/config_reset_core/ext_reset_in] [get_bd_pins PCIe/pcie_reset]
connect_bd_net [get_bd_pins PCIe/clk_wiz_0/clk_in1] [get_bd_pins PCIe/XDMA/axi_aclk]
