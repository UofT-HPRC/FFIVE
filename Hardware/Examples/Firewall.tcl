create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 VNF/vnf_master_intc
create_bd_cell -type ip -vlnv xilinx.com:hls:chopper:1.0 VNF/chopper_0_1
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 VNF/axi_interconnect_0_1
create_bd_cell -type ip -vlnv xilinx.com:ip:axis_switch:1.1 VNF/axis_switch_0_1
create_bd_cell -type ip -vlnv xilinx.com:hls:chopper:1.0 VNF/chopper_1_0
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 VNF/axi_interconnect_1_0
create_bd_cell -type ip -vlnv xilinx.com:ip:axis_switch:1.1 VNF/axis_switch_1_0
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 VNF/full_0
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 VNF/empty_0
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 VNF/full_1
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 VNF/empty_1
for {set BPF_INDEX 0} {$BPF_INDEX < 6} {incr BPF_INDEX} {
    create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 VNF/stats_gather_0_${BPF_INDEX}
    create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 VNF/stats_gather_1_${BPF_INDEX}
    create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 VNF/vx_to_fil_clk_0_${BPF_INDEX}
    create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 VNF/vx_to_fil_clk_1_${BPF_INDEX}
    create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 VNF/fil_to_vx_clk_0_${BPF_INDEX}
    create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 VNF/fil_to_vx_clk_1_${BPF_INDEX}
    create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 VNF/pmf_0_${BPF_INDEX}
    create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 VNF/pmf_1_${BPF_INDEX}
    create_bd_cell -type ip -vlnv Marco_Merlini:fpga_bpf:axistream_packetfilt:1.0 VNF/axistream_packetfilt_0_${BPF_INDEX}
    create_bd_cell -type ip -vlnv Marco_Merlini:fpga_bpf:axistream_packetfilt:1.0 VNF/axistream_packetfilt_1_${BPF_INDEX}
}

set_property -dict [list CONFIG.NUM_SI {1} CONFIG.NUM_MI {2}] [get_bd_cells VNF/vnf_master_intc]
set_property -dict [list CONFIG.NUM_PORTS {6}] [get_bd_cells VNF/full_0]
set_property -dict [list CONFIG.NUM_PORTS {6}] [get_bd_cells VNF/empty_0]
set_property -dict [list CONFIG.NUM_PORTS {6}] [get_bd_cells VNF/full_1]
set_property -dict [list CONFIG.NUM_PORTS {6}] [get_bd_cells VNF/empty_1]
set_property -dict [list CONFIG.NUM_MI {6} CONFIG.S00_HAS_REGSLICE {4}] [get_bd_cells VNF/axi_interconnect_0_1]
set_property -dict [list CONFIG.NUM_MI {6} CONFIG.S00_HAS_REGSLICE {4}] [get_bd_cells VNF/axi_interconnect_1_0]
set_property -dict [list CONFIG.NUM_SI {6}] [get_bd_cells VNF/axis_switch_0_1]
set_property -dict [list CONFIG.NUM_SI {6}] [get_bd_cells VNF/axis_switch_1_0]
for {set BPF_INDEX 0} {$BPF_INDEX < 6} {incr BPF_INDEX} {
    set_property -dict [list CONFIG.FIFO_DEPTH {64} CONFIG.HAS_AEMPTY {1} CONFIG.HAS_PROG_FULL {1} CONFIG.PROG_FULL_THRESH {35}] [get_bd_cells VNF/stats_gather_0_${BPF_INDEX}]
    set_property -dict [list CONFIG.FIFO_DEPTH {64} CONFIG.HAS_AEMPTY {1} CONFIG.HAS_PROG_FULL {1} CONFIG.PROG_FULL_THRESH {35}] [get_bd_cells VNF/stats_gather_1_${BPF_INDEX}]
    set_property -dict [list CONFIG.FIFO_DEPTH {16} CONFIG.IS_ACLK_ASYNC {1}] [get_bd_cells VNF/vx_to_fil_clk_0_${BPF_INDEX}]
    set_property -dict [list CONFIG.FIFO_DEPTH {16} CONFIG.IS_ACLK_ASYNC {1}] [get_bd_cells VNF/vx_to_fil_clk_1_${BPF_INDEX}]
    set_property -dict [list CONFIG.FIFO_DEPTH {16} CONFIG.IS_ACLK_ASYNC {1}] [get_bd_cells VNF/fil_to_vx_clk_0_${BPF_INDEX}]
    set_property -dict [list CONFIG.FIFO_DEPTH {16} CONFIG.IS_ACLK_ASYNC {1}] [get_bd_cells VNF/fil_to_vx_clk_1_${BPF_INDEX}]
    set_property -dict [list CONFIG.N {2} CONFIG.SN_FWD_DATA_WIDTH {512} CONFIG.ENABLE_BACKPRESSURE {true}] [get_bd_cells VNF/axistream_packetfilt_0_${BPF_INDEX}]
    set_property -dict [list CONFIG.N {2} CONFIG.SN_FWD_DATA_WIDTH {512} CONFIG.ENABLE_BACKPRESSURE {true}] [get_bd_cells VNF/axistream_packetfilt_1_${BPF_INDEX}]
    set_property -dict [list CONFIG.FIFO_DEPTH {64} CONFIG.FIFO_MODE {2}] [get_bd_cells VNF/pmf_0_${BPF_INDEX}]
    set_property -dict [list CONFIG.FIFO_DEPTH {64} CONFIG.FIFO_MODE {2}] [get_bd_cells VNF/pmf_1_${BPF_INDEX}]
}

connect_bd_net [get_bd_pins VNF/full_0/dout] [get_bd_pins VNF/chopper_0_1/nfull_in_V]
connect_bd_net [get_bd_pins VNF/empty_0/dout] [get_bd_pins VNF/chopper_0_1/empty_in_V]
connect_bd_net [get_bd_pins VNF/full_1/dout] [get_bd_pins VNF/chopper_1_0/nfull_in_V]
connect_bd_net [get_bd_pins VNF/empty_1/dout] [get_bd_pins VNF/chopper_1_0/empty_in_V]
connect_bd_intf_net [get_bd_intf_pins VNF/VXLAN_1_0_tx] [get_bd_intf_pins VNF/axis_switch_0_1/M00_AXIS]
connect_bd_intf_net [get_bd_intf_pins VNF/VXLAN_0_0_rx] [get_bd_intf_pins VNF/chopper_0_1/data_in_V]
connect_bd_intf_net [get_bd_intf_pins VNF/VXLAN_0_0_tx] [get_bd_intf_pins VNF/axis_switch_1_0/M00_AXIS]
connect_bd_intf_net [get_bd_intf_pins VNF/VXLAN_1_0_rx] [get_bd_intf_pins VNF/chopper_1_0/data_in_V]
connect_bd_net [get_bd_pins VNF/VXLAN_1_clk] [get_bd_pins VNF/axis_switch_0_1/aclk]
connect_bd_net [get_bd_pins VNF/VXLAN_0_clk] [get_bd_pins VNF/axis_switch_1_0/aclk]
connect_bd_net [get_bd_pins VNF/VXLAN_0_clk] [get_bd_pins VNF/chopper_0_1/aclk]
connect_bd_net [get_bd_pins VNF/VXLAN_1_clk] [get_bd_pins VNF/chopper_1_0/aclk]
connect_bd_net [get_bd_pins VNF/user_clock] [get_bd_pins VNF/axi_interconnect_0_1/ACLK]
connect_bd_net [get_bd_pins VNF/user_reset] [get_bd_pins VNF/axi_interconnect_0_1/ARESETN]
connect_bd_net [get_bd_pins VNF/user_clock] [get_bd_pins VNF/axi_interconnect_1_0/ACLK]
connect_bd_net [get_bd_pins VNF/user_reset] [get_bd_pins VNF/axi_interconnect_1_0/ARESETN]
connect_bd_net [get_bd_pins VNF/VXLAN_0_reset] [get_bd_pins VNF/axis_switch_1_0/aresetn]
connect_bd_net [get_bd_pins VNF/VXLAN_1_reset] [get_bd_pins VNF/axis_switch_0_1/aresetn]
connect_bd_net [get_bd_pins VNF/VXLAN_0_reset] [get_bd_pins VNF/chopper_0_1/aresetn]
connect_bd_net [get_bd_pins VNF/VXLAN_1_reset] [get_bd_pins VNF/chopper_1_0/aresetn]

connect_bd_intf_net [get_bd_intf_pins VNF/VNF_config] -boundary_type upper [get_bd_intf_pins VNF/vnf_master_intc/S00_AXI]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins VNF/vnf_master_intc/M00_AXI] [get_bd_intf_pins VNF/axi_interconnect_0_1/S00_AXI]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins VNF/vnf_master_intc/M01_AXI] [get_bd_intf_pins VNF/axi_interconnect_1_0/S00_AXI]
connect_bd_net [get_bd_pins VNF/config_clk] [get_bd_pins VNF/vnf_master_intc/ACLK]
connect_bd_net [get_bd_pins VNF/config_clk] [get_bd_pins VNF/vnf_master_intc/S00_ACLK]
connect_bd_net [get_bd_pins VNF/config_clk] [get_bd_pins VNF/vnf_master_intc/M00_ACLK]
connect_bd_net [get_bd_pins VNF/config_clk] [get_bd_pins VNF/vnf_master_intc/M01_ACLK]
connect_bd_net [get_bd_pins VNF/config_reset] [get_bd_pins VNF/vnf_master_intc/ARESETN]
connect_bd_net [get_bd_pins VNF/config_reset] [get_bd_pins VNF/vnf_master_intc/S00_ARESETN]
connect_bd_net [get_bd_pins VNF/config_reset] [get_bd_pins VNF/vnf_master_intc/M00_ARESETN]
connect_bd_net [get_bd_pins VNF/config_reset] [get_bd_pins VNF/vnf_master_intc/M01_ARESETN]
connect_bd_net [get_bd_pins VNF/config_clk] [get_bd_pins VNF/axi_interconnect_0_1/S00_ACLK]
connect_bd_net [get_bd_pins VNF/config_clk] [get_bd_pins VNF/axi_interconnect_1_0/S00_ACLK]
connect_bd_net [get_bd_pins VNF/config_reset] [get_bd_pins VNF/axi_interconnect_0_1/S00_ARESETN]
connect_bd_net [get_bd_pins VNF/config_reset] [get_bd_pins VNF/axi_interconnect_1_0/S00_ARESETN]

for {set BPF_INDEX 0} {$BPF_INDEX < 6} {incr BPF_INDEX} {
    set NEXT_BPF_INDEX [expr $BPF_INDEX + 1]
    connect_bd_intf_net [get_bd_intf_pins VNF/chopper_0_1/arb_${NEXT_BPF_INDEX}_out_V] [get_bd_intf_pins VNF/stats_gather_0_${BPF_INDEX}/S_AXIS]
    connect_bd_net [get_bd_pins VNF/stats_gather_0_${BPF_INDEX}/almost_empty] [get_bd_pins VNF/empty_0/In${BPF_INDEX}]
    connect_bd_net [get_bd_pins VNF/stats_gather_0_${BPF_INDEX}/prog_full] [get_bd_pins VNF/full_0/In${BPF_INDEX}]
    connect_bd_intf_net [get_bd_intf_pins VNF/stats_gather_0_${BPF_INDEX}/M_AXIS] [get_bd_intf_pins VNF/vx_to_fil_clk_0_${BPF_INDEX}/S_AXIS]
    connect_bd_intf_net [get_bd_intf_pins VNF/vx_to_fil_clk_0_${BPF_INDEX}/M_AXIS] [get_bd_intf_pins VNF/axistream_packetfilt_0_${BPF_INDEX}/sn_bp]
    connect_bd_intf_net [get_bd_intf_pins VNF/axistream_packetfilt_0_${BPF_INDEX}/fwd] [get_bd_intf_pins VNF/fil_to_vx_clk_0_${BPF_INDEX}/S_AXIS]
    connect_bd_intf_net [get_bd_intf_pins VNF/fil_to_vx_clk_0_${BPF_INDEX}/M_AXIS] [get_bd_intf_pins VNF/pmf_0_${BPF_INDEX}/S_AXIS]
    connect_bd_net [get_bd_pins VNF/VXLAN_0_clk] [get_bd_pins VNF/stats_gather_0_${BPF_INDEX}/s_axis_aclk]
    connect_bd_net [get_bd_pins VNF/VXLAN_0_clk] [get_bd_pins VNF/vx_to_fil_clk_0_${BPF_INDEX}/s_axis_aclk]
    connect_bd_net [get_bd_pins VNF/VXLAN_0_reset] [get_bd_pins VNF/stats_gather_0_${BPF_INDEX}/s_axis_aresetn]
    connect_bd_net [get_bd_pins VNF/VXLAN_0_reset] [get_bd_pins VNF/vx_to_fil_clk_0_${BPF_INDEX}/s_axis_aresetn]
    connect_bd_net [get_bd_pins VNF/user_clk] [get_bd_pins VNF/axistream_packetfilt_0_${BPF_INDEX}/clk]
    connect_bd_net [get_bd_pins VNF/user_clk] [get_bd_pins VNF/fil_to_vx_clk_0_${BPF_INDEX}/s_axis_aclk]
    connect_bd_net [get_bd_pins VNF/user_clk] [get_bd_pins VNF/vx_to_fil_clk_0_${BPF_INDEX}/m_axis_aclk]
    connect_bd_net [get_bd_pins VNF/user_reset] [get_bd_pins VNF/fil_to_vx_clk_0_${BPF_INDEX}/s_axis_aresetn]
    connect_bd_net [get_bd_pins VNF/VXLAN_1_clk] [get_bd_pins VNF/fil_to_vx_clk_0_${BPF_INDEX}/m_axis_aclk]
    connect_bd_net [get_bd_pins VNF/user_reset] [get_bd_pins VNF/axistream_packetfilt_0_${BPF_INDEX}/rst]
    connect_bd_net [get_bd_pins VNF/VXLAN_1_clk] [get_bd_pins VNF/pmf_0_${BPF_INDEX}/s_axis_aclk]
    connect_bd_net [get_bd_pins VNF/VXLAN_1_reset] [get_bd_pins VNF/pmf_0_${BPF_INDEX}/s_axis_aresetn]
    
    connect_bd_intf_net [get_bd_intf_pins VNF/chopper_1_0/arb_${NEXT_BPF_INDEX}_out_V] [get_bd_intf_pins VNF/stats_gather_1_${BPF_INDEX}/S_AXIS]
    connect_bd_net [get_bd_pins VNF/stats_gather_1_${BPF_INDEX}/almost_empty] [get_bd_pins VNF/empty_1/In${BPF_INDEX}]
    connect_bd_net [get_bd_pins VNF/stats_gather_1_${BPF_INDEX}/prog_full] [get_bd_pins VNF/full_1/In${BPF_INDEX}]
    connect_bd_intf_net [get_bd_intf_pins VNF/stats_gather_1_${BPF_INDEX}/M_AXIS] [get_bd_intf_pins VNF/vx_to_fil_clk_1_${BPF_INDEX}/S_AXIS]
    connect_bd_intf_net [get_bd_intf_pins VNF/vx_to_fil_clk_1_${BPF_INDEX}/M_AXIS] [get_bd_intf_pins VNF/axistream_packetfilt_1_${BPF_INDEX}/sn_bp]
    connect_bd_intf_net [get_bd_intf_pins VNF/axistream_packetfilt_1_${BPF_INDEX}/fwd] [get_bd_intf_pins VNF/fil_to_vx_clk_1_${BPF_INDEX}/S_AXIS]
    connect_bd_intf_net [get_bd_intf_pins VNF/fil_to_vx_clk_1_${BPF_INDEX}/M_AXIS] [get_bd_intf_pins VNF/pmf_1_${BPF_INDEX}/S_AXIS]
    connect_bd_net [get_bd_pins VNF/VXLAN_1_clk] [get_bd_pins VNF/stats_gather_1_${BPF_INDEX}/s_axis_aclk]
    connect_bd_net [get_bd_pins VNF/VXLAN_1_clk] [get_bd_pins VNF/vx_to_fil_clk_1_${BPF_INDEX}/s_axis_aclk]
    connect_bd_net [get_bd_pins VNF/VXLAN_1_reset] [get_bd_pins VNF/stats_gather_1_${BPF_INDEX}/s_axis_aresetn]
    connect_bd_net [get_bd_pins VNF/VXLAN_1_reset] [get_bd_pins VNF/vx_to_fil_clk_1_${BPF_INDEX}/s_axis_aresetn]
    connect_bd_net [get_bd_pins VNF/user_clk] [get_bd_pins VNF/axistream_packetfilt_1_${BPF_INDEX}/clk]
    connect_bd_net [get_bd_pins VNF/user_clk] [get_bd_pins VNF/fil_to_vx_clk_1_${BPF_INDEX}/s_axis_aclk]
    connect_bd_net [get_bd_pins VNF/user_clk] [get_bd_pins VNF/vx_to_fil_clk_1_${BPF_INDEX}/m_axis_aclk]
    connect_bd_net [get_bd_pins VNF/user_reset] [get_bd_pins VNF/fil_to_vx_clk_1_${BPF_INDEX}/s_axis_aresetn]
    connect_bd_net [get_bd_pins VNF/VXLAN_0_clk] [get_bd_pins VNF/fil_to_vx_clk_1_${BPF_INDEX}/m_axis_aclk]
    connect_bd_net [get_bd_pins VNF/user_reset] [get_bd_pins VNF/axistream_packetfilt_1_${BPF_INDEX}/rst]
    connect_bd_net [get_bd_pins VNF/VXLAN_0_clk] [get_bd_pins VNF/pmf_1_${BPF_INDEX}/s_axis_aclk]
    connect_bd_net [get_bd_pins VNF/VXLAN_0_reset] [get_bd_pins VNF/pmf_1_${BPF_INDEX}/s_axis_aresetn]

    connect_bd_intf_net [get_bd_intf_pins VNF/pmf_0_${BPF_INDEX}/M_AXIS] [get_bd_intf_pins VNF/axis_switch_0_1/S0${BPF_INDEX}_AXIS]
    connect_bd_intf_net [get_bd_intf_pins VNF/pmf_1_${BPF_INDEX}/M_AXIS] [get_bd_intf_pins VNF/axis_switch_1_0/S0${BPF_INDEX}_AXIS]
    connect_bd_intf_net -boundary_type upper [get_bd_intf_pins VNF/axi_interconnect_0_1/M0${BPF_INDEX}_AXI] [get_bd_intf_pins VNF/axistream_packetfilt_0_${BPF_INDEX}/s_axi]
    connect_bd_intf_net -boundary_type upper [get_bd_intf_pins VNF/axi_interconnect_1_0/M0${BPF_INDEX}_AXI] [get_bd_intf_pins VNF/axistream_packetfilt_1_${BPF_INDEX}/s_axi]
    connect_bd_net [get_bd_pins VNF/user_clk] [get_bd_pins VNF/axi_interconnect_0_1/M0${BPF_INDEX}_ACLK]
    connect_bd_net [get_bd_pins VNF/user_clk] [get_bd_pins VNF/axi_interconnect_1_0/M0${BPF_INDEX}_ACLK]
    connect_bd_net [get_bd_pins VNF/user_reset] [get_bd_pins VNF/axi_interconnect_0_1/M0${BPF_INDEX}_ARESETN]
    connect_bd_net [get_bd_pins VNF/user_reset] [get_bd_pins VNF/axi_interconnect_1_0/M0${BPF_INDEX}_ARESETN]
} 
