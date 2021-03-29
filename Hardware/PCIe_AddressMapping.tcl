assign_bd_address -target_address_space /PCIe/XDMA/M_AXI [get_bd_addr_segs {ID_RAM/s00_axi/reg0 }]
assign_bd_address -target_address_space /PCIe/XDMA/M_AXI_LITE [get_bd_addr_segs {ID_RAM/s00_axi/reg0 }]
set_property offset 0x00A0000000 [get_bd_addr_segs {PCIe/XDMA/M_AXI/SEG_ID_RAM_reg0}]
set_property offset 0x00A0000000 [get_bd_addr_segs {PCIe/XDMA/M_AXI_LITE/SEG_ID_RAM_reg0}]

# Network Interface
set QSFP_SPEED [lindex $QSFP_SPEEDS 0]
if {$QSFP_SPEED == "100G"} {
    assign_bd_address -target_address_space /PCIe/XDMA/M_AXI [get_bd_addr_segs {QSFP/QSFP_0/cmac/s_axi/Reg }]
    assign_bd_address -target_address_space /PCIe/XDMA/M_AXI_LITE [get_bd_addr_segs {QSFP/QSFP_0/cmac/s_axi/Reg }]
    set_property name SEG_cmac_Reg0 [get_bd_addr_segs {PCIe/XDMA/M_AXI/SEG_cmac_Reg}]
    set_property name SEG_cmac_Reg0 [get_bd_addr_segs {PCIe/XDMA/M_AXI_LITE/SEG_cmac_Reg}]
    set_property offset 0x00A0100000 [get_bd_addr_segs {PCIe/XDMA/M_AXI/SEG_cmac_Reg0}]
    set_property offset 0x00A0100000 [get_bd_addr_segs {PCIe/XDMA/M_AXI_LITE/SEG_cmac_Reg0}]
} else {
    assign_bd_address -target_address_space /PCIe/XDMA/M_AXI [get_bd_addr_segs {QSFP/QSFP_0/eth/s_axi_0/Reg }]
    assign_bd_address -target_address_space /PCIe/XDMA/M_AXI_LITE [get_bd_addr_segs {QSFP/QSFP_0/eth/s_axi_0/Reg }]
    set_property name SEG_eth_Reg0 [get_bd_addr_segs {PCIe/XDMA/M_AXI/SEG_eth_Reg}]
    set_property name SEG_eth_Reg0 [get_bd_addr_segs {PCIe/XDMA/M_AXI_LITE/SEG_eth_Reg}]
    set_property offset 0x00A0100000 [get_bd_addr_segs {PCIe/XDMA/M_AXI/SEG_eth_Reg0}]
    set_property offset 0x00A0100000 [get_bd_addr_segs {PCIe/XDMA/M_AXI_LITE/SEG_eth_Reg0}]
}
# Network UDP
assign_bd_address -target_address_space /PCIe/XDMA/M_AXI [get_bd_addr_segs {QSFP/QSFP_0/GULF_Stream/s_axictl/reg0 }]
assign_bd_address -target_address_space /PCIe/XDMA/M_AXI_LITE [get_bd_addr_segs {QSFP/QSFP_0/GULF_Stream/s_axictl/reg0 }]
set_property offset 0x00A0200000 [get_bd_addr_segs {PCIe/XDMA/M_AXI/SEG_GULF_Stream_reg0}]
set_property offset 0x00A0200000 [get_bd_addr_segs {PCIe/XDMA/M_AXI_LITE/SEG_GULF_Stream_reg0}]
# VXLAN
assign_bd_address -target_address_space /PCIe/XDMA/M_AXI [get_bd_addr_segs {VXLAN/VXLAN_0/GPIO_net/s00_axi/reg0 }]
assign_bd_address -target_address_space /PCIe/XDMA/M_AXI_LITE [get_bd_addr_segs {VXLAN/VXLAN_0/GPIO_net/s00_axi/reg0 }]
set_property offset 0x00A0300000 [get_bd_addr_segs {PCIe/XDMA/M_AXI/SEG_GPIO_net_Reg0}]
set_property offset 0x00A0300000 [get_bd_addr_segs {PCIe/XDMA/M_AXI_LITE/SEG_GPIO_net_Reg0}]



for {set QSFP_INDEX 1} {$QSFP_INDEX < $QSFP_COUNT} {incr QSFP_INDEX} {
	set QSFP_SPEED [lindex $QSFP_SPEEDS $QSFP_INDEX]
    # Network Interface
    if {$QSFP_SPEED == "100G"} {
        assign_bd_address -target_address_space /PCIe/XDMA/M_AXI [get_bd_addr_segs QSFP/QSFP_${QSFP_INDEX}/cmac/s_axi/Reg]
        assign_bd_address -target_address_space /PCIe/XDMA/M_AXI_LITE [get_bd_addr_segs QSFP/QSFP_${QSFP_INDEX}/cmac/s_axi/Reg]
        set_property name SEG_cmac_Reg${QSFP_INDEX} [get_bd_addr_segs {PCIe/XDMA/M_AXI/SEG_cmac_Reg}]
        set_property name SEG_cmac_Reg${QSFP_INDEX} [get_bd_addr_segs {PCIe/XDMA/M_AXI_LITE/SEG_cmac_Reg}]
        set_property offset 0x00A01${QSFP_INDEX}0000 [get_bd_addr_segs PCIe/XDMA/M_AXI/SEG_cmac_Reg${QSFP_INDEX}]
        set_property offset 0x00A01${QSFP_INDEX}0000 [get_bd_addr_segs PCIe/XDMA/M_AXI_LITE/SEG_cmac_Reg${QSFP_INDEX}]
    } else {
        assign_bd_address -target_address_space /PCIe/XDMA/M_AXI [get_bd_addr_segs QSFP/QSFP_${QSFP_INDEX}/eth/s_axi_0/Reg]
        assign_bd_address -target_address_space /PCIe/XDMA/M_AXI_LITE [get_bd_addr_segs QSFP/QSFP_${QSFP_INDEX}/eth/s_axi_0/Reg]
        set_property name SEG_eth_Reg${QSFP_INDEX} [get_bd_addr_segs {PCIe/XDMA/M_AXI/SEG_eth_Reg}]
        set_property name SEG_eth_Reg${QSFP_INDEX} [get_bd_addr_segs {PCIe/XDMA/M_AXI_LITE/SEG_eth_Reg}]
        set_property offset 0x00A01${QSFP_INDEX}0000 [get_bd_addr_segs PCIe/XDMA/M_AXI/SEG_eth_Reg${QSFP_INDEX}]
        set_property offset 0x00A01${QSFP_INDEX}0000 [get_bd_addr_segs PCIe/XDMA/M_AXI_LITE/SEG_eth_Reg${QSFP_INDEX}]
    }
    # Network UDP
    assign_bd_address -target_address_space /PCIe/XDMA/M_AXI [get_bd_addr_segs QSFP/QSFP_${QSFP_INDEX}/GULF_Stream/s_axictl/reg0]
    assign_bd_address -target_address_space /PCIe/XDMA/M_AXI_LITE [get_bd_addr_segs QSFP/QSFP_${QSFP_INDEX}/GULF_Stream/s_axictl/reg0]
    set_property name SEG_GULF_Stream_reg${QSFP_INDEX} [get_bd_addr_segs PCIe/XDMA/M_AXI/SEG_GULF_Stream_reg0_${QSFP_INDEX}]
    set_property name SEG_GULF_Stream_reg${QSFP_INDEX} [get_bd_addr_segs PCIe/XDMA/M_AXI_LITE/SEG_GULF_Stream_reg0_${QSFP_INDEX}]
    set_property offset 0x00A02${QSFP_INDEX}0000 [get_bd_addr_segs PCIe/XDMA/M_AXI/SEG_GULF_Stream_reg${QSFP_INDEX}]
    set_property offset 0x00A02${QSFP_INDEX}0000 [get_bd_addr_segs PCIe/XDMA/M_AXI_LITE/SEG_GULF_Stream_reg${QSFP_INDEX}]
    # VXLAN
    assign_bd_address -target_address_space /PCIe/XDMA/M_AXI [get_bd_addr_segs VXLAN/VXLAN_${QSFP_INDEX}/GPIO_net/s00_axi/reg0]
    assign_bd_address -target_address_space /PCIe/XDMA/M_AXI_LITE [get_bd_addr_segs VXLAN/VXLAN_${QSFP_INDEX}/GPIO_net/s00_axi/reg0]
    set_property name SEG_GPIO_net_Reg${QSFP_INDEX} [get_bd_addr_segs PCIe/XDMA/M_AXI/SEG_GPIO_net_reg0_${QSFP_INDEX}]
    set_property name SEG_GPIO_net_Reg${QSFP_INDEX} [get_bd_addr_segs PCIe/XDMA/M_AXI_LITE/SEG_GPIO_net_reg0_${QSFP_INDEX}]
    set_property offset 0x00A03${QSFP_INDEX}0000 [get_bd_addr_segs PCIe/XDMA/M_AXI/SEG_GPIO_net_Reg${QSFP_INDEX}]
    set_property offset 0x00A03${QSFP_INDEX}0000 [get_bd_addr_segs PCIe/XDMA/M_AXI_LITE/SEG_GPIO_net_Reg${QSFP_INDEX}]
}

# DDR4
for {set DDR4_INDEX 0} {$DDR4_INDEX < $DDR4_COUNT} {incr DDR4_INDEX} {
	set DDR4_INTERFACE [lindex $DDR4_INTERFACES $DDR4_INDEX]
    assign_bd_address -target_address_space /PCIe/XDMA/M_AXI [get_bd_addr_segs DDR4/${DDR4_INTERFACE}/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK]
    exclude_bd_addr_seg [get_bd_addr_segs DDR4/${DDR4_INTERFACE}/C0_DDR4_MEMORY_MAP_CTRL/C0_REG] -target_address_space [get_bd_addr_spaces PCIe/XDMA/M_AXI]
    exclude_bd_addr_seg [get_bd_addr_segs DDR4/${DDR4_INTERFACE}/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK] -target_address_space [get_bd_addr_spaces PCIe/XDMA/M_AXI_LITE]
    exclude_bd_addr_seg [get_bd_addr_segs DDR4/${DDR4_INTERFACE}/C0_DDR4_MEMORY_MAP_CTRL/C0_REG] -target_address_space [get_bd_addr_spaces PCIe/XDMA/M_AXI_LITE]
}

# Examples
if {[info exists EXAMPLE]} {
    if {[file exists Examples/${EXAMPLE}_PCIe_AddressMapping.tcl] == 1} {
        source Examples/${EXAMPLE}_PCIe_AddressMapping.tcl
    }
}
