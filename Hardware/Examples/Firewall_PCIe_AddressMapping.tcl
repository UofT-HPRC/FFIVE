for {set BPF_INDEX 0} {$BPF_INDEX < 6} {incr BPF_INDEX} {
    assign_bd_address -target_address_space /PCIe/XDMA/M_AXI [get_bd_addr_segs {VNF/axistream_packetfilt_0_${BPF_INDEX}/s_axi/reg0 }]
    set_property offset 0x00A04${BPF_INDEX}0000 [get_bd_addr_segs {PCIe/XDMA/M_AXI/SEG_axistream_packetfilt_0_${BPF_INDEX}_reg0}]
    set_property range 64K [get_bd_addr_segs {PCIe/XDMA/M_AXI/SEG_axistream_packetfilt_0_${BPF_INDEX}_reg0}]

    assign_bd_address -target_address_space /PCIe/XDMA/M_AXI_LITE [get_bd_addr_segs {VNF/axistream_packetfilt_0_${BPF_INDEX}/s_axi/reg0 }]
    set_property offset 0x00A04${BPF_INDEX}0000 [get_bd_addr_segs {PCIe/XDMA/M_AXI_LITE/SEG_axistream_packetfilt_0_${BPF_INDEX}_reg0}]
    set_property range 64K [get_bd_addr_segs {PCIe/XDMA/M_AXI_LITE/SEG_axistream_packetfilt_0_${BPF_INDEX}_reg0}]

    assign_bd_address -target_address_space /PCIe/XDMA/M_AXI [get_bd_addr_segs {VNF/axistream_packetfilt_1_${BPF_INDEX}/s_axi/reg0 }]
    set_property offset 0x00A05${BPF_INDEX}0000 [get_bd_addr_segs {PCIe/XDMA/M_AXI/SEG_axistream_packetfilt_1_${BPF_INDEX}_reg0}]
    set_property range 64K [get_bd_addr_segs {PCIe/XDMA/M_AXI/SEG_axistream_packetfilt_1_${BPF_INDEX}_reg0}]

    assign_bd_address -target_address_space /PCIe/XDMA/M_AXI_LITE [get_bd_addr_segs {VNF/axistream_packetfilt_1_${BPF_INDEX}/s_axi/reg0 }]
    set_property offset 0x00A05${BPF_INDEX}0000 [get_bd_addr_segs {PCIe/XDMA/M_AXI_LITE/SEG_axistream_packetfilt_1_${BPF_INDEX}_reg0}]
    set_property range 64K [get_bd_addr_segs {PCIe/XDMA/M_AXI_LITE/SEG_axistream_packetfilt_1_${BPF_INDEX}_reg0}]
}
