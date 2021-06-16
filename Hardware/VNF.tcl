# Cretae VNF Hierarchy
create_bd_cell -type hier VNF

# Ports
create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 VNF/VNF_config
create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 VNF/User
if {$USE_ARM} {
    create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 VNF/cpu_mem
}
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 VNF/fpga_mem
create_bd_pin -dir I VNF/config_clk
create_bd_pin -dir I VNF/config_reset
create_bd_pin -dir I VNF/user_clk
create_bd_pin -dir I VNF/user_reset
for {set QSFP_INDEX 0} {$QSFP_INDEX < $QSFP_COUNT} {incr QSFP_INDEX} {
    set VXLAN_COUNT [lindex $VXLAN_INTERFACES $QSFP_INDEX]
    create_bd_pin -dir I VNF/VXLAN_${QSFP_INDEX}_clk
    create_bd_pin -dir I VNF/VXLAN_${QSFP_INDEX}_reset
    for {set VXLAN_INDEX 0} {$VXLAN_INDEX < $VXLAN_COUNT} {incr VXLAN_INDEX} {
        create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 VNF/VXLAN_${QSFP_INDEX}_${VXLAN_INDEX}_rx
        create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 VNF/VXLAN_${QSFP_INDEX}_${VXLAN_INDEX}_tx
    }
}

# Examples
if {[info exists EXAMPLE]} {
    source Examples/$EXAMPLE.tcl
}
