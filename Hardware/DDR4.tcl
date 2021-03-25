# Create DDR4 Hierarchy
create_bd_cell -type hier DDR4

# Create ports
create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 DDR4/cpu_mem
create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 DDR4/fpga_mem
create_bd_pin -dir I DDR4/cpu_mem_clk
create_bd_pin -dir I DDR4/cpu_mem_reset
create_bd_pin -dir I DDR4/fpga_mem_clk
create_bd_pin -dir I DDR4/fpga_mem_reset
for {set DDR4_INDEX 0} {$DDR4_INDEX < $DDR4_COUNT} {incr DDR4_INDEX} {
	create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:ddr4_rtl:1.0 DDR4/ddr4_$DDR4_INDEX
	create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 DDR4/ddr4_clk_$DDR4_INDEX
}
create_bd_pin -dir I DDR4/global_reset

# Create cores
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 DDR4/axi_interconnect
create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 DDR4/polarity_flipper
for {set DDR4_INDEX 0} {$DDR4_INDEX < $DDR4_COUNT} {incr DDR4_INDEX} {
	set DDR4_INTERFACE [lindex $DDR4_INTERFACES $DDR4_INDEX]
	create_bd_cell -type ip -vlnv xilinx.com:ip:ddr4:2.2 DDR4/$DDR4_INTERFACE
    create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 DDR4/${DDR4_INTERFACE}_reset_hub
}

# Configure cores
set MASTERS [expr $DDR4_COUNT * 2]
set_property -dict [list CONFIG.NUM_SI {2} CONFIG.NUM_MI $MASTERS CONFIG.ENABLE_ADVANCED_OPTIONS {1} CONFIG.XBAR_DATA_WIDTH {512} CONFIG.SYNCHRONIZATION_STAGES {5}] [get_bd_cells DDR4/axi_interconnect]
set_property -dict [list CONFIG.C_SIZE {1} CONFIG.C_OPERATION {not} CONFIG.LOGO_FILE {data/sym_notgate.png}] [get_bd_cells DDR4/polarity_flipper]
for {set DDR4_INDEX 0} {$DDR4_INDEX < $DDR4_COUNT} {incr DDR4_INDEX} {
	set DDR4_INTERFACE [lindex $DDR4_INTERFACES $DDR4_INDEX]
	set DDR4_CLOCK [lindex $DDR4_CLOCKS $DDR4_INDEX]
	set_property -dict [list CONFIG.C0_CLOCK_BOARD_INTERFACE $DDR4_CLOCK CONFIG.C0_DDR4_BOARD_INTERFACE $DDR4_INTERFACE] [get_bd_cells DDR4/$DDR4_INTERFACE]
}

# Connect interfaces
connect_bd_intf_net [get_bd_intf_pins DDR4/cpu_mem] [get_bd_intf_pins DDR4/axi_interconnect/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins DDR4/fpga_mem] [get_bd_intf_pins DDR4/axi_interconnect/S01_AXI]
connect_bd_net [get_bd_pins DDR4/cpu_mem_reset] [get_bd_pins DDR4/axi_interconnect/S00_ARESETN]
connect_bd_net [get_bd_pins DDR4/fpga_mem_reset] [get_bd_pins DDR4/axi_interconnect/S01_ARESETN]
connect_bd_net [get_bd_pins DDR4/cpu_mem_clk] [get_bd_pins DDR4/axi_interconnect/S00_ACLK]
connect_bd_net [get_bd_pins DDR4/fpga_mem_clk] [get_bd_pins DDR4/axi_interconnect/S01_ACLK]
for {set DDR4_INDEX 0} {$DDR4_INDEX < $DDR4_COUNT} {incr DDR4_INDEX} {
    set SECOND_INDEX [expr $DDR4_INDEX + $DDR4_COUNT]
	set DDR4_INTERFACE [lindex $DDR4_INTERFACES $DDR4_INDEX]
    set_property -dict [list CONFIG.M0${DDR4_INDEX}_HAS_REGSLICE {4} CONFIG.M0${SECOND_INDEX}_HAS_REGSLICE {4}] [get_bd_cells DDR4/axi_interconnect]
	connect_bd_intf_net [get_bd_intf_pins DDR4/ddr4_clk_$DDR4_INDEX] [get_bd_intf_pins DDR4/$DDR4_INTERFACE/C0_SYS_CLK]
	connect_bd_intf_net [get_bd_intf_pins DDR4/ddr4_$DDR4_INDEX] [get_bd_intf_pins DDR4/$DDR4_INTERFACE/C0_DDR4]
	connect_bd_intf_net [get_bd_intf_pins DDR4/axi_interconnect/M0${DDR4_INDEX}_AXI] [get_bd_intf_pins DDR4/$DDR4_INTERFACE/C0_DDR4_S_AXI]
	connect_bd_intf_net [get_bd_intf_pins DDR4/axi_interconnect/M0${SECOND_INDEX}_AXI] [get_bd_intf_pins DDR4/$DDR4_INTERFACE/C0_DDR4_S_AXI_CTRL]
	connect_bd_net [get_bd_pins DDR4/$DDR4_INTERFACE/c0_ddr4_ui_clk] [get_bd_pins DDR4/axi_interconnect/M0${DDR4_INDEX}_ACLK]
	connect_bd_net [get_bd_pins DDR4/$DDR4_INTERFACE/c0_ddr4_ui_clk] [get_bd_pins DDR4/axi_interconnect/M0${SECOND_INDEX}_ACLK]
	connect_bd_net [get_bd_pins DDR4/polarity_flipper/Res] [get_bd_pins DDR4/$DDR4_INTERFACE/sys_rst]
    connect_bd_net [get_bd_pins DDR4/$DDR4_INTERFACE/c0_ddr4_ui_clk] [get_bd_pins DDR4/${DDR4_INTERFACE}_reset_hub/slowest_sync_clk]
    connect_bd_net [get_bd_pins DDR4/global_reset] [get_bd_pins DDR4/${DDR4_INTERFACE}_reset_hub/ext_reset_in]
   	connect_bd_net [get_bd_pins DDR4/${DDR4_INTERFACE}_reset_hub/interconnect_aresetn] [get_bd_pins DDR4/$DDR4_INTERFACE/c0_ddr4_aresetn]
	connect_bd_net [get_bd_pins DDR4/${DDR4_INTERFACE}_reset_hub/interconnect_aresetn] [get_bd_pins DDR4/axi_interconnect/M0${DDR4_INDEX}_ARESETN]
	connect_bd_net [get_bd_pins DDR4/${DDR4_INTERFACE}_reset_hub/interconnect_aresetn] [get_bd_pins DDR4/axi_interconnect/M0${SECOND_INDEX}_ARESETN]
}

# Connect others
set DDR4_INTERFACE [lindex $DDR4_INTERFACES 0]
connect_bd_net [get_bd_pins DDR4/$DDR4_INTERFACE/c0_ddr4_ui_clk] [get_bd_pins DDR4/axi_interconnect/ACLK]
connect_bd_net [get_bd_pins DDR4/${DDR4_INTERFACE}_reset_hub/interconnect_aresetn] [get_bd_pins DDR4/axi_interconnect/ARESETN]
connect_bd_net [get_bd_pins DDR4/global_reset] [get_bd_pins DDR4/polarity_flipper/Op1]
