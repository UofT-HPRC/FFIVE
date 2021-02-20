# Top level VXLAN
create_bd_cell -type hier VXLAN

# Cores
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 VXLAN/axi_interconnect
set_property -dict [list CONFIG.NUM_MI ${QSFP_COUNT} CONFIG.ENABLE_ADVANCED_OPTIONS {1} CONFIG.XBAR_DATA_WIDTH {512} CONFIG.SYNCHRONIZATION_STAGES {5}] [get_bd_cells VXLAN/axi_interconnect]

# Interfaces
create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 VXLAN/VXLAN_ctrl
create_bd_pin -dir I VXLAN/VXLAN_ctrl_clk
create_bd_pin -dir I VXLAN/VXLAN_ctrl_reset
connect_bd_net [get_bd_pins VXLAN/VXLAN_ctrl_clk] [get_bd_pins VXLAN/axi_interconnect/ACLK]
connect_bd_net [get_bd_pins VXLAN/VXLAN_ctrl_clk] [get_bd_pins VXLAN/axi_interconnect/S00_ACLK]
connect_bd_net [get_bd_pins VXLAN/VXLAN_ctrl_reset] [get_bd_pins VXLAN/axi_interconnect/ARESETN]
connect_bd_net [get_bd_pins VXLAN/VXLAN_ctrl_reset] [get_bd_pins VXLAN/axi_interconnect/S00_ARESETN]

# Connections
connect_bd_intf_net [get_bd_intf_pins VXLAN/VXLAN_ctrl] -boundary_type upper [get_bd_intf_pins VXLAN/axi_interconnect/S00_AXI]

for {set QSFP_INDEX 0} {$QSFP_INDEX < $QSFP_COUNT} {incr QSFP_INDEX} {
    # Per QSFP VXLAN
    create_bd_cell -type hier VXLAN/VXLAN_$QSFP_INDEX
    set VXLAN_COUNT [lindex $VXLAN_INTERFACES $QSFP_INDEX]
    
    for {set VXLAN_INDEX 0} {$VXLAN_INDEX < $VXLAN_COUNT} {incr VXLAN_INDEX} {
        # Cores
        create_bd_cell -type ip -vlnv xilinx.com:hls:vxlan_bridge:1.0 VXLAN/VXLAN_${QSFP_INDEX}/VXLAN_${VXLAN_INDEX}
        create_bd_cell -type ip -vlnv xilinx.com:ip:axis_register_slice:1.1 VXLAN/VXLAN_${QSFP_INDEX}/reg_slice_${VXLAN_INDEX}

        # Interfaces
        create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 VXLAN/VXLAN_${QSFP_INDEX}/VXLAN_${VXLAN_INDEX}_tx
        create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 VXLAN/VXLAN_${QSFP_INDEX}/VXLAN_${VXLAN_INDEX}_rx
    }

    # Cores
    create_bd_cell -type ip -vlnv mohammad.ewais.ca:ME_IPs:AXI4_GPIO:1.0 VXLAN/VXLAN_${QSFP_INDEX}/GPIO_net
    create_bd_cell -type ip -vlnv xilinx.com:ip:axis_broadcaster:1.1 VXLAN/VXLAN_${QSFP_INDEX}/AXIS_Broadcaster
    create_bd_cell -type ip -vlnv xilinx.com:ip:axis_switch:1.1 VXLAN/VXLAN_${QSFP_INDEX}/AXIS_switch

    # Configuration
    set GPIO_COUNT [expr $VXLAN_COUNT * 4]
    set EXPONENT [expr log10($GPIO_COUNT) / log10(2)]
    set EXPONENT [expr ceil($EXPONENT)]
    set GPIO_COUNT [expr pow(2, $EXPONENT)]
    set_property -dict [list CONFIG.GPIO_DEPTH ${GPIO_COUNT}] [get_bd_cells VXLAN/VXLAN_${QSFP_INDEX}/GPIO_net]
    set_property -dict [list CONFIG.HAS_TLAST.VALUE_SRC USER] [get_bd_cells VXLAN/VXLAN_${QSFP_INDEX}/AXIS_switch]
    set_property -dict [list CONFIG.NUM_SI ${VXLAN_COUNT} CONFIG.HAS_TLAST {1} CONFIG.ARB_ON_MAX_XFERS {0} CONFIG.ARB_ON_TLAST {1} CONFIG.M00_AXIS_HIGHTDEST {0xffffffff}] [get_bd_cells VXLAN/VXLAN_${QSFP_INDEX}/AXIS_switch]
    set_property -dict [list CONFIG.NUM_MI ${VXLAN_COUNT}] [get_bd_cells VXLAN/VXLAN_${QSFP_INDEX}/AXIS_Broadcaster]

    # Interfaces
    create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 VXLAN/VXLAN_${QSFP_INDEX}/network_tx
    create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 VXLAN/VXLAN_${QSFP_INDEX}/network_rx
    create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 VXLAN/VXLAN_${QSFP_INDEX}/VXLAN_ctrl
    create_bd_pin -dir I VXLAN/VXLAN_${QSFP_INDEX}/clk
    create_bd_pin -dir I VXLAN/VXLAN_${QSFP_INDEX}/reset
    
    # Connections
    connect_bd_intf_net [get_bd_intf_pins VXLAN/VXLAN_${QSFP_INDEX}/network_tx] [get_bd_intf_pins VXLAN/VXLAN_${QSFP_INDEX}/AXIS_switch/M00_AXIS]
    connect_bd_intf_net [get_bd_intf_pins VXLAN/VXLAN_${QSFP_INDEX}/network_rx] [get_bd_intf_pins VXLAN/VXLAN_${QSFP_INDEX}/AXIS_Broadcaster/S_AXIS]
    connect_bd_intf_net [get_bd_intf_pins VXLAN/VXLAN_${QSFP_INDEX}/VXLAN_ctrl] [get_bd_intf_pins VXLAN/VXLAN_${QSFP_INDEX}/GPIO_net/s00_axi]
    connect_bd_net [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}/clk] [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}/AXIS_Broadcaster/aclk]
    connect_bd_net [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}/clk] [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}/AXIS_switch/aclk]
    connect_bd_net [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}/clk] [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}/GPIO_net/s00_axi_aclk]
    connect_bd_net [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}/reset] [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}/AXIS_Broadcaster/aresetn]
    connect_bd_net [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}/reset] [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}/AXIS_switch/aresetn]
    connect_bd_net [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}/reset] [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}/GPIO_net/s00_axi_aresetn]

    for {set VXLAN_INDEX 0} {$VXLAN_INDEX < $VXLAN_COUNT} {incr VXLAN_INDEX} {
        # Connections
        connect_bd_intf_net [get_bd_intf_pins VXLAN/VXLAN_${QSFP_INDEX}/reg_slice_${VXLAN_INDEX}/M_AXIS] [get_bd_intf_pins VXLAN/VXLAN_${QSFP_INDEX}/VXLAN_${VXLAN_INDEX}/network_in_V]
        connect_bd_intf_net [get_bd_intf_pins VXLAN/VXLAN_${QSFP_INDEX}/VXLAN_${VXLAN_INDEX}_tx] [get_bd_intf_pins VXLAN/VXLAN_${QSFP_INDEX}/VXLAN_${VXLAN_INDEX}/user_in_V]
        connect_bd_intf_net [get_bd_intf_pins VXLAN/VXLAN_${QSFP_INDEX}/VXLAN_${VXLAN_INDEX}_rx] [get_bd_intf_pins VXLAN/VXLAN_${QSFP_INDEX}/VXLAN_${VXLAN_INDEX}/user_out_V]
        connect_bd_intf_net [get_bd_intf_pins VXLAN/VXLAN_${QSFP_INDEX}/AXIS_Broadcaster/M0${VXLAN_INDEX}_AXIS] [get_bd_intf_pins VXLAN/VXLAN_${QSFP_INDEX}/reg_slice_${VXLAN_INDEX}/S_AXIS]
        connect_bd_intf_net [get_bd_intf_pins VXLAN/VXLAN_${QSFP_INDEX}/VXLAN_${VXLAN_INDEX}/network_out_V] [get_bd_intf_pins VXLAN/VXLAN_${QSFP_INDEX}/AXIS_switch/S0${VXLAN_INDEX}_AXIS]
        connect_bd_net [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}/clk] [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}/reg_slice_${VXLAN_INDEX}/aclk]
        connect_bd_net [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}/clk] [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}/VXLAN_${VXLAN_INDEX}/aclk]
        connect_bd_net [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}/reset] [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}/reg_slice_${VXLAN_INDEX}/aresetn]
        connect_bd_net [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}/reset] [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}/VXLAN_${VXLAN_INDEX}/aresetn]

        set GPIO_INDEX1 [expr $VXLAN_INDEX * 4]
        set GPIO_INDEX2 [expr $GPIO_INDEX1 + 1]
        set GPIO_INDEX3 [expr $GPIO_INDEX1 + 2]
        set GPIO_INDEX4 [expr $GPIO_INDEX1 + 3]
        connect_bd_net [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}/GPIO_net/INPUT_${GPIO_INDEX1}_OUT] [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}/VXLAN_${VXLAN_INDEX}/ip_addr_V]
        connect_bd_net [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}/GPIO_net/INPUT_${GPIO_INDEX2}_OUT] [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}/VXLAN_${VXLAN_INDEX}/local_port_V]
        connect_bd_net [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}/GPIO_net/INPUT_${GPIO_INDEX3}_OUT] [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}/VXLAN_${VXLAN_INDEX}/remote_port_V]
        connect_bd_net [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}/GPIO_net/INPUT_${GPIO_INDEX4}_OUT] [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}/VXLAN_${VXLAN_INDEX}/vni_V]
    }

    # Top VXLAN
    # Ports
    create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 VXLAN/network_${QSFP_INDEX}_rx
    create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 VXLAN/network_${QSFP_INDEX}_tx
    create_bd_pin -dir I VXLAN/VXLAN_${QSFP_INDEX}_clk
    create_bd_pin -dir I VXLAN/VXLAN_${QSFP_INDEX}_reset
    for {set VXLAN_INDEX 0} {$VXLAN_INDEX < $VXLAN_COUNT} {incr VXLAN_INDEX} {
        create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 VXLAN/VXLAN_${QSFP_INDEX}_${VXLAN_INDEX}_tx
        create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 VXLAN/VXLAN_${QSFP_INDEX}_${VXLAN_INDEX}_rx
    }

    # Connections
    connect_bd_intf_net -boundary_type upper [get_bd_intf_pins VXLAN/axi_interconnect/M0${QSFP_INDEX}_AXI] [get_bd_intf_pins VXLAN/VXLAN_${QSFP_INDEX}/VXLAN_ctrl]
    connect_bd_net [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}_clk] [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}/clk]
    connect_bd_net [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}_reset] [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}/reset]
    connect_bd_net [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}_clk] [get_bd_pins VXLAN/axi_interconnect/M0${QSFP_INDEX}_ACLK]
    connect_bd_net [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}_reset] [get_bd_pins VXLAN/axi_interconnect/M0${QSFP_INDEX}_ARESETN]
    for {set VXLAN_INDEX 0} {$VXLAN_INDEX < $VXLAN_COUNT} {incr VXLAN_INDEX} {
        connect_bd_intf_net [get_bd_intf_pins VXLAN/VXLAN_${QSFP_INDEX}_${VXLAN_INDEX}_tx] [get_bd_intf_pins VXLAN/VXLAN_${QSFP_INDEX}/VXLAN_${VXLAN_INDEX}_tx]
        connect_bd_intf_net [get_bd_intf_pins VXLAN/VXLAN_${QSFP_INDEX}_${VXLAN_INDEX}_rx] [get_bd_intf_pins VXLAN/VXLAN_${QSFP_INDEX}/VXLAN_${VXLAN_INDEX}_rx]
        connect_bd_intf_net [get_bd_intf_pins VXLAN/network_${QSFP_INDEX}_rx] -boundary_type upper [get_bd_intf_pins VXLAN/VXLAN_${QSFP_INDEX}/network_rx]
        connect_bd_intf_net [get_bd_intf_pins VXLAN/network_${QSFP_INDEX}_tx] -boundary_type upper [get_bd_intf_pins VXLAN/VXLAN_${QSFP_INDEX}/network_tx]
    }
}
