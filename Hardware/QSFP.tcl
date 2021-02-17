create_bd_cell -type hier QSFP

# Create QSFP
for {set QSFP_INDEX 0} {$QSFP_INDEX < $QSFP_COUNT} {incr QSFP_INDEX} {
	set QSFP_INTERFACE [lindex $QSFP_INTERFACES $QSFP_INDEX]
	create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 QSFP/QSFP_${QSFP_INDEX}_rx
	create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 QSFP/QSFP_${QSFP_INDEX}_tx
	create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 QSFP/QSFP_${QSFP_INDEX}_refclk
	create_bd_pin -dir I QSFP/QSFP_${QSFP_INDEX}_iface_clk
	create_bd_pin -dir I QSFP/QSFP_${QSFP_INDEX}_iface_reset
	create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:gt_rtl:1.0 QSFP/$QSFP_INTERFACE
}
create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 QSFP/network_config
if {$QSFP_100_USED} {
	create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 QSFP/init
}
create_bd_pin -dir I QSFP/general_reset
create_bd_pin -dir I QSFP/config_clk
create_bd_pin -dir I QSFP/config_reset

# Create 100G QSFP
for {set QSFP_INDEX 0} {$QSFP_INDEX < $QSFP_COUNT} {incr QSFP_INDEX} {
	set QSFP_INTERFACE [lindex $QSFP_INTERFACES $QSFP_INDEX]
	set QSFP_SPEED [lindex $QSFP_SPEEDS $QSFP_INDEX]
	set QSFP_MODE [lindex $QSFP_MODES $QSFP_INDEX]
	if {$QSFP_SPEED == "10G" || $QSFP_SPEED == "25G"} {
		source 25G-Eth.tcl
	} elseif {$QSFP_SPEED == "50G" || $QSFP_SPEED == "40G"} {
		source 50G-Eth.tcl
	} elseif {$QSFP_SPEED == "100G"} {
		source 100G-Eth.tcl
	} else {
		puts "Wrong value for speed."
		exit
	}
}

# Create init
if {$QSFP_100_USED} {
	create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 QSFP/init_parser
	set_property -dict [list CONFIG.C_BUF_TYPE {IBUFDS}] [get_bd_cells QSFP/init_parser]
	connect_bd_intf_net [get_bd_intf_pins QSFP/init] [get_bd_intf_pins QSFP/init_parser/CLK_IN_D]
	for {set QSFP_INDEX 0} {$QSFP_INDEX < $QSFP_COUNT} {incr QSFP_INDEX} {
		set QSFP_SPEED [lindex $QSFP_SPEEDS $QSFP_INDEX]
		if {$QSFP_SPEED == "100G"} {
			connect_bd_net [get_bd_pins QSFP/init_parser/IBUF_OUT] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/init]
		}
	}
}

# Create AXI switch
if {$QSFP_COUNT > 1} {
	create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 QSFP/axi_interconnect
	set_property -dict [list CONFIG.NUM_SI {1} CONFIG.NUM_MI $QSFP_COUNT CONFIG.ENABLE_ADVANCED_OPTIONS {1} CONFIG.XBAR_DATA_WIDTH {512} CONFIG.SYNCHRONIZATION_STAGES {5}] [get_bd_cells QSFP/axi_interconnect]
	connect_bd_intf_net [get_bd_intf_pins QSFP/network_config] [get_bd_intf_pins QSFP/axi_interconnect/S00_AXI]
	connect_bd_net [get_bd_pins QSFP/config_clk] [get_bd_pins QSFP/axi_interconnect/ACLK]
	connect_bd_net [get_bd_pins QSFP/config_reset] [get_bd_pins QSFP/axi_interconnect/ARESETN]
	connect_bd_net [get_bd_pins QSFP/config_clk] [get_bd_pins QSFP/axi_interconnect/S00_ACLK]
	connect_bd_net [get_bd_pins QSFP/config_reset] [get_bd_pins QSFP/axi_interconnect/S00_ARESETN]
	for {set QSFP_INDEX 0} {$QSFP_INDEX < $QSFP_COUNT} {incr QSFP_INDEX} {
		connect_bd_intf_net [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/network_config] [get_bd_intf_pins QSFP/axi_interconnect/M0${QSFP_INDEX}_AXI]
		connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/network_clk] [get_bd_pins QSFP/axi_interconnect/M0${QSFP_INDEX}_ACLK]
		connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/network_resetn] [get_bd_pins QSFP/axi_interconnect/M0${QSFP_INDEX}_ARESETN]
	}
}

# Connect 100G
for {set QSFP_INDEX 0} {$QSFP_INDEX < $QSFP_COUNT} {incr QSFP_INDEX} {
	set QSFP_INTERFACE [lindex $QSFP_INTERFACES $QSFP_INDEX]
	connect_bd_intf_net [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/$QSFP_INTERFACE] [get_bd_intf_pins QSFP/$QSFP_INTERFACE]
	connect_bd_intf_net [get_bd_intf_pins QSFP/QSFP_${QSFP_INDEX}_rx] [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/network_rx]
	connect_bd_intf_net [get_bd_intf_pins QSFP/QSFP_${QSFP_INDEX}_tx] [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/network_tx]
	connect_bd_intf_net [get_bd_intf_pins QSFP/QSFP_${QSFP_INDEX}_refclk] [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/gt_ref]
	connect_bd_net [get_bd_pins QSFP/general_reset] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/general_reset]
	connect_bd_net [get_bd_pins QSFP/QSFP_${QSFP_INDEX}_iface_reset] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/network_tx_resetn]
	connect_bd_net [get_bd_pins QSFP/QSFP_${QSFP_INDEX}_iface_clk] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/network_tx_clk]
}
