set VXLAN_COUNT [lindex $VXLAN_INTERFACES 0]
for {set VXLAN_INDEX 0} {$VXLAN_INDEX < $VXLAN_COUNT} {incr VXLAN_INDEX} {
    set FIRST_INDEX [expr $VXLAN_INDEX * 2]
    set SECOND_INDEX [expr $FIRST_INDEX + 1]
    connect_bd_intf_net [get_bd_intf_pins VNF/VXLAN_0_${FIRST_INDEX}_rx] [get_bd_intf_pins VNF/VXLAN_0_${SECOND_INDEX}_tx]
    connect_bd_intf_net [get_bd_intf_pins VNF/VXLAN_0_${SECOND_INDEX}_rx] [get_bd_intf_pins VNF/VXLAN_0_${FIRST_INDEX}_tx]
}

set VXLAN_COUNT [lindex $VXLAN_INTERFACES 1]
for {set VXLAN_INDEX 0} {$VXLAN_INDEX < $VXLAN_COUNT} {incr VXLAN_INDEX} {
    set FIRST_INDEX [expr $VXLAN_INDEX * 2]
    set SECOND_INDEX [expr $FIRST_INDEX + 1]
    connect_bd_intf_net [get_bd_intf_pins VNF/VXLAN_1_${FIRST_INDEX}_rx] [get_bd_intf_pins VNF/VXLAN_1_${SECOND_INDEX}_tx]
    connect_bd_intf_net [get_bd_intf_pins VNF/VXLAN_1_${SECOND_INDEX}_rx] [get_bd_intf_pins VNF/VXLAN_1_${FIRST_INDEX}_tx]
}
