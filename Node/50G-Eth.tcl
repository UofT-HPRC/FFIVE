# create ethernet hierarchy
create_bd_cell -type hier QSFP/QSFP_$QSFP_INDEX

# add ports
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:gt_rtl:1.0 QSFP/QSFP_$QSFP_INDEX/$QSFP_INTERFACE
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 QSFP/QSFP_$QSFP_INDEX/network_rx
create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 QSFP/QSFP_$QSFP_INDEX/network_tx
create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 QSFP/QSFP_$QSFP_INDEX/network_config
create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 QSFP/QSFP_$QSFP_INDEX/gt_ref
create_bd_pin -dir I QSFP/QSFP_$QSFP_INDEX/general_reset
create_bd_pin -dir O QSFP/QSFP_$QSFP_INDEX/network_clk
create_bd_pin -dir O QSFP/QSFP_$QSFP_INDEX/network_resetn
create_bd_pin -dir O QSFP/QSFP_$QSFP_INDEX/network_resetp
create_bd_pin -dir I QSFP/QSFP_$QSFP_INDEX/network_tx_resetn
create_bd_pin -dir I QSFP/QSFP_$QSFP_INDEX/network_tx_clk

# add cores
create_bd_cell -type ip -vlnv clarkshen.com:user:GULF_Stream:1.0 QSFP/QSFP_$QSFP_INDEX/GULF_Stream
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 QSFP/QSFP_$QSFP_INDEX/axi_interconnect_0
create_bd_cell -type ip -vlnv xilinx.com:ip:l_ethernet:2.4 QSFP/QSFP_$QSFP_INDEX/eth
create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 QSFP/QSFP_$QSFP_INDEX/network_rx_cdc
create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 QSFP/QSFP_$QSFP_INDEX/network_tx_cdc
create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 QSFP/QSFP_$QSFP_INDEX/axi_width_converter_tx
create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 QSFP/QSFP_$QSFP_INDEX/axi_width_converter_rx
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 QSFP/QSFP_$QSFP_INDEX/w1v0
create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 QSFP/QSFP_$QSFP_INDEX/network_reset_hub
create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 QSFP/QSFP_$QSFP_INDEX/packet_mode_fifo

# configure the cores
set_property CONFIG.USE_BOARD_FLOW true [get_bd_cells /QSFP/QSFP_$QSFP_INDEX/eth]
if {$QSFP_SPEED == "40G"} {
	set_property -dict [list CONFIG.LINE_RATE {40} CONFIG.INCLUDE_AXI4_INTERFACE {1} CONFIG.GT_DRP_CLK {200} CONFIG.ENABLE_TX_FLOW_CONTROL_LOGIC {0} CONFIG.ENABLE_RX_FLOW_CONTROL_LOGIC {0}] [get_bd_cells QSFP/QSFP_${QSFP_INDEX}/eth]
} elseif {$QSFP_SPEED == "50G"} {
	set_property -dict [list CONFIG.LINE_RATE {50} CONFIG.INCLUDE_AXI4_INTERFACE {1} CONFIG.GT_DRP_CLK {200} CONFIG.ENABLE_TX_FLOW_CONTROL_LOGIC {0} CONFIG.ENABLE_RX_FLOW_CONTROL_LOGIC {0}] [get_bd_cells QSFP/QSFP_${QSFP_INDEX}/eth]
} else {
	puts "Wrong speed value"
	exit
}
set_property -dict [list CONFIG.HAS_AXIL {true}] [get_bd_cells QSFP/QSFP_$QSFP_INDEX/GULF_Stream]
set_property -dict [list CONFIG.NUM_MI {2} CONFIG.M00_HAS_REGSLICE {1} CONFIG.M01_HAS_REGSLICE {1} CONFIG.S00_HAS_REGSLICE {1}] [get_bd_cells QSFP/QSFP_$QSFP_INDEX/axi_interconnect_0]
set_property -dict [list CONFIG.FIFO_DEPTH {1024} CONFIG.FIFO_MODE {1} CONFIG.IS_ACLK_ASYNC {1} CONFIG.SYNCHRONIZATION_STAGES {3}] [get_bd_cells QSFP/QSFP_$QSFP_INDEX/network_rx_cdc]
set_property -dict [list CONFIG.FIFO_DEPTH {1024} CONFIG.FIFO_MODE {1} CONFIG.IS_ACLK_ASYNC {1} CONFIG.SYNCHRONIZATION_STAGES {3}] [get_bd_cells QSFP/QSFP_$QSFP_INDEX/network_tx_cdc]
set_property -dict [list CONFIG.S_TDATA_NUM_BYTES.VALUE_SRC USER] [get_bd_cells QSFP/QSFP_$QSFP_INDEX/axi_width_converter_tx]
set_property -dict [list CONFIG.S_TDATA_NUM_BYTES {64} CONFIG.M_TDATA_NUM_BYTES {16}] [get_bd_cells QSFP/QSFP_$QSFP_INDEX/axi_width_converter_tx]
set_property -dict [list CONFIG.S_TDATA_NUM_BYTES.VALUE_SRC USER] [get_bd_cells QSFP/QSFP_$QSFP_INDEX/axi_width_converter_rx]
set_property -dict [list CONFIG.S_TDATA_NUM_BYTES {16} CONFIG.M_TDATA_NUM_BYTES {64}] [get_bd_cells QSFP/QSFP_$QSFP_INDEX/axi_width_converter_rx]
set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {0}] [get_bd_cells QSFP/QSFP_$QSFP_INDEX/w1v0]
set_property -dict [list CONFIG.HAS_TKEEP.VALUE_SRC USER CONFIG.HAS_TLAST.VALUE_SRC USER CONFIG.TUSER_WIDTH.VALUE_SRC USER CONFIG.TDEST_WIDTH.VALUE_SRC USER CONFIG.TID_WIDTH.VALUE_SRC USER CONFIG.TDATA_NUM_BYTES.VALUE_SRC USER] [get_bd_cells QSFP/QSFP_$QSFP_INDEX/packet_mode_fifo]
set_property -dict [list CONFIG.TDATA_NUM_BYTES {64} CONFIG.TID_WIDTH {16} CONFIG.TDEST_WIDTH {16} CONFIG.TUSER_WIDTH {32} CONFIG.FIFO_DEPTH {16} CONFIG.HAS_TKEEP {1} CONFIG.HAS_TLAST {1}] [get_bd_cells QSFP/QSFP_$QSFP_INDEX/packet_mode_fifo]

# connect Interfaces
connect_bd_intf_net [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/$QSFP_INTERFACE] [get_bd_intf_pins /QSFP/QSFP_$QSFP_INDEX/eth/gt_serial_port]
connect_bd_intf_net [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/gt_ref] [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/eth/gt_ref_clk]
connect_bd_intf_net [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/eth/axis_tx_0] [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/axi_width_converter_tx/M_AXIS]
connect_bd_intf_net [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/eth/axis_rx_0] [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/axi_width_converter_rx/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/axi_width_converter_rx/M_AXIS] [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/GULF_Stream/s_axis]
connect_bd_intf_net [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/axi_width_converter_tx/S_AXIS] [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/GULF_Stream/m_axis]
connect_bd_intf_net [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/network_tx_cdc/M_AXIS] [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/packet_mode_fifo/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/network_rx_cdc/S_AXIS] [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/GULF_Stream/payload_to_user]
connect_bd_intf_net [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/network_config] [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/axi_interconnect_0/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/axi_interconnect_0/M00_AXI] [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/eth/s_axi_0]
connect_bd_intf_net [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/axi_interconnect_0/M01_AXI] [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/GULF_Stream/s_axictl]
connect_bd_intf_net [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/network_tx] [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/network_tx_cdc/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/network_rx_cdc/M_AXIS] [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/network_rx]

# connect Clocks and resets
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/eth/tx_clk_out_0] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/eth/rx_core_clk_0]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/eth/tx_clk_out_0] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/network_clk]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/eth/tx_clk_out_0] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/GULF_Stream/clk]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/eth/tx_clk_out_0] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/network_reset_hub/slowest_sync_clk]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/eth/tx_clk_out_0] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/packet_mode_fifo/s_axis_aclk]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/eth/tx_clk_out_0] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/eth/s_axi_aclk_0]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/eth/tx_clk_out_0] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/network_rx_cdc/s_axis_aclk]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/eth/tx_clk_out_0] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/network_tx_cdc/m_axis_aclk]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/eth/pm_tick_0] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/w1v0/dout]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/eth/dclk] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/w1v0/dout]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/eth/s_axi_aresetn_0] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/network_reset_hub/peripheral_reset]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/axi_interconnect_0/ACLK] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/eth/tx_clk_out_0]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/axi_interconnect_0/S00_ACLK] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/eth/tx_clk_out_0]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/axi_interconnect_0/M00_ACLK] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/eth/tx_clk_out_0]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/axi_interconnect_0/M01_ACLK] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/eth/tx_clk_out_0]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/axi_interconnect_0/ARESETN] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/network_reset_hub/interconnect_aresetn]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/axi_interconnect_0/S00_ARESETN] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/network_reset_hub/interconnect_aresetn]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/axi_interconnect_0/M00_ARESETN] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/network_reset_hub/interconnect_aresetn]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/axi_interconnect_0/M01_ARESETN] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/network_reset_hub/interconnect_aresetn]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/network_rx_cdc/s_axis_aresetn] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/network_reset_hub/interconnect_aresetn]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/network_reset_hub/interconnect_aresetn] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/network_resetn]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/network_reset_hub/interconnect_aresetn] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/packet_mode_fifo/s_axis_aresetn]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/network_resetp] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/network_reset_hub/peripheral_reset]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/general_reset] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/network_reset_hub/ext_reset_in]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/network_tx_clk] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/network_tx_cdc/s_axis_aclk]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/network_tx_resetn] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/network_tx_cdc/s_axis_aresetn]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/network_tx_clk] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/network_rx_cdc/m_axis_aclk]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/axi_width_converter_tx/aclk] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/eth/tx_clk_out_0]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/axi_width_converter_rx/aclk] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/eth/tx_clk_out_0]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/axi_width_converter_rx/aresetn] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/network_reset_hub/interconnect_aresetn]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/axi_width_converter_tx/aresetn] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/network_reset_hub/interconnect_aresetn]


# connect others
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/packet_mode_fifo/m_axis_tdata] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/GULF_Stream/payload_from_user_data]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/packet_mode_fifo/m_axis_tdest] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/GULF_Stream/remote_port_tx]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/packet_mode_fifo/m_axis_tid] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/GULF_Stream/local_port_tx]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/packet_mode_fifo/m_axis_tkeep] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/GULF_Stream/payload_from_user_keep]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/packet_mode_fifo/m_axis_tlast] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/GULF_Stream/payload_from_user_last]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/packet_mode_fifo/m_axis_tready] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/GULF_Stream/payload_from_user_ready]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/packet_mode_fifo/m_axis_tuser] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/GULF_Stream/remote_ip_tx]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/packet_mode_fifo/m_axis_tvalid] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/GULF_Stream/payload_from_user_valid]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/w1v0/dout] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/GULF_Stream/rst]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/w1v0/dout] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/eth/gtwiz_reset_tx_datapath_0]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/w1v0/dout] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/eth/gtwiz_reset_rx_datapath_0]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/w1v0/dout] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/eth/sys_reset]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/w1v0/dout] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/eth/rx_reset_0]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/w1v0/dout] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/eth/tx_reset_0]
