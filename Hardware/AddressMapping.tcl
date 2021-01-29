assign_bd_address [get_bd_addr_segs {ID_RAM/s00_axi/reg0 }]
set_property offset 0x00A0000000 [get_bd_addr_segs {ARM/ARM/Data/SEG_ID_RAM_reg0}]

# Network Interface
set QSFP_SPEED [lindex $QSFP_SPEEDS 0]
if {$QSFP_SPEED == "100G"} {
    assign_bd_address [get_bd_addr_segs {QSFP/QSFP_0/cmac/s_axi/Reg }]
    set_property name SEG_cmac_Reg0 [get_bd_addr_segs {ARM/ARM/Data/SEG_cmac_Reg}]
    set_property offset 0x00A0100000 [get_bd_addr_segs {ARM/ARM/Data/SEG_cmac_Reg0}]
} elseif {$QSFP_SPEED == "50G" || QSFP_SPEED == "40G"} {
} elseif {$QSFP_SPEED == "10G" || QSFP_SPEED == "25G"} {
}
# Network UDP
assign_bd_address [get_bd_addr_segs {QSFP/QSFP_0/GULF_Stream/s_axictl/reg0 }]
set_property offset 0x00A0200000 [get_bd_addr_segs {ARM/ARM/Data/SEG_GULF_Stream_reg0}]
# VXLAN
assign_bd_address [get_bd_addr_segs {VXLAN/VXLAN_0/GPIO_net/S_AXI_BUS_A/Reg }]
set_property name SEG_GPIO_net_Reg0 [get_bd_addr_segs {ARM/ARM/Data/SEG_GPIO_net_Reg}]
set_property offset 0x00A0300000 [get_bd_addr_segs {ARM/ARM/Data/SEG_GPIO_net_Reg0}]



for {set QSFP_INDEX 1} {$QSFP_INDEX < $QSFP_COUNT} {incr QSFP_INDEX} {
	set QSFP_SPEED [lindex $QSFP_SPEEDS $QSFP_INDEX]
    # Network Interface
    if {$QSFP_SPEED == "100G"} {
        assign_bd_address [get_bd_addr_segs QSFP/QSFP_${QSFP_INDEX}/cmac/s_axi/Reg]
        set_property name SEG_cmac_Reg${QSFP_INDEX} [get_bd_addr_segs {ARM/ARM/Data/SEG_cmac_Reg}]
        set_property offset 0x00A01${QSFP_INDEX}0000 [get_bd_addr_segs ARM/ARM/Data/SEG_cmac_Reg${QSFP_INDEX}]
    } elseif {$QSFP_SPEED == "50G" || QSFP_SPEED == "40G"} {
    } elseif {$QSFP_SPEED == "10G" || QSFP_SPEED == "25G"} {
    }
    # Network UDP
    assign_bd_address [get_bd_addr_segs QSFP/QSFP_${QSFP_INDEX}/GULF_Stream/s_axictl/reg0]
    set_property name SEG_GULF_Stream_reg${QSFP_INDEX} [get_bd_addr_segs ARM/ARM/Data/SEG_GULF_Stream_reg0${QSFP_INDEX}]
    set_property offset 0x00A020${QSFP_INDEX}000 [get_bd_addr_segs ARM/ARM/Data/SEG_GULF_Stream_reg${QSFP_INDEX}]
    # VXLAN
    assign_bd_address [get_bd_addr_segs VXLAN/VXLAN_${QSFP_INDEX}/GPIO_net/S_AXI_BUS_A/Reg]
    set_property name SEG_GPIO_net_Reg${QSFP_INDEX} [get_bd_addr_segs {ARM/ARM/Data/SEG_GPIO_net_Reg}]
    set_property offset 0x00A03${QSFP_INDEX}0000 [get_bd_addr_segs ARM/ARM/Data/SEG_GPIO_net_Reg${QSFP_INDEX}]
}

# DDR4
for {set DDR4_INDEX 0} {$DDR4_INDEX < $DDR4_COUNT} {incr DDR4_INDEX} {
	set DDR4_INTERFACE [lindex $DDR4_INTERFACES $DDR4_INDEX]
    assign_bd_address [get_bd_addr_segs DDR4/${DDR4_INTERFACE}/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK]
    exclude_bd_addr_seg [get_bd_addr_segs DDR4/${DDR4_INTERFACE}/C0_DDR4_MEMORY_MAP_CTRL/C0_REG] -target_address_space [get_bd_addr_spaces ARM/ARM/Data]
}