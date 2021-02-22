# create ethernet hierarchy
create_bd_cell -type hier QSFP/QSFP_$QSFP_INDEX

# add ports
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:gt_rtl:1.0 QSFP/QSFP_$QSFP_INDEX/$QSFP_INTERFACE
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 QSFP/QSFP_$QSFP_INDEX/network_rx
create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 QSFP/QSFP_$QSFP_INDEX/network_tx
create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 QSFP/QSFP_$QSFP_INDEX/network_config
create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 QSFP/QSFP_$QSFP_INDEX/gt_ref
create_bd_pin -dir I QSFP/QSFP_$QSFP_INDEX/general_reset
create_bd_pin -dir I QSFP/QSFP_$QSFP_INDEX/init
create_bd_pin -dir O QSFP/QSFP_$QSFP_INDEX/network_clk
create_bd_pin -dir O QSFP/QSFP_$QSFP_INDEX/network_resetn
create_bd_pin -dir O QSFP/QSFP_$QSFP_INDEX/network_resetp
create_bd_pin -dir I QSFP/QSFP_$QSFP_INDEX/network_tx_resetn
create_bd_pin -dir I QSFP/QSFP_$QSFP_INDEX/network_tx_clk

# add cores
create_bd_cell -type ip -vlnv clarkshen.com:user:lbus_axis_converter:1.0 QSFP/QSFP_$QSFP_INDEX/lbus_axis_converter
create_bd_cell -type ip -vlnv clarkshen.com:user:GULF_Stream:1.0 QSFP/QSFP_$QSFP_INDEX/GULF_Stream
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 QSFP/QSFP_$QSFP_INDEX/axi_interconnect_0
create_bd_cell -type ip -vlnv xilinx.com:ip:cmac_usplus:3.1 QSFP/QSFP_$QSFP_INDEX/cmac
create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 QSFP/QSFP_$QSFP_INDEX/network_rx_cdc
create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 QSFP/QSFP_$QSFP_INDEX/network_tx_cdc
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 QSFP/QSFP_$QSFP_INDEX/w1v0
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 QSFP/QSFP_$QSFP_INDEX/w10v0
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 QSFP/QSFP_$QSFP_INDEX/w12v0
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 QSFP/QSFP_$QSFP_INDEX/w16v0
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 QSFP/QSFP_$QSFP_INDEX/w56v0
create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 QSFP/QSFP_$QSFP_INDEX/network_reset_hub
create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 QSFP/QSFP_$QSFP_INDEX/packet_mode_fifo

# configure the cores
set_property -dict [list CONFIG.ETHERNET_BOARD_INTERFACE $QSFP_MODE CONFIG.DIFFCLK_BOARD_INTERFACE $QSFP_CLOCK CONFIG.USE_BOARD_FLOW true CONFIG.GT_DRP_CLK {200.00} CONFIG.ENABLE_AXI_INTERFACE {1} CONFIG.RX_CHECK_PREAMBLE {1} CONFIG.RX_CHECK_SFD {1} CONFIG.TX_FLOW_CONTROL {0} CONFIG.RX_FLOW_CONTROL {0}] [get_bd_cells QSFP/QSFP_$QSFP_INDEX/cmac]
set_property -dict [list CONFIG.HAS_AXIL {true}] [get_bd_cells QSFP/QSFP_$QSFP_INDEX/GULF_Stream]
set_property -dict [list CONFIG.NUM_MI {2} CONFIG.M00_HAS_REGSLICE {1} CONFIG.M01_HAS_REGSLICE {1} CONFIG.S00_HAS_REGSLICE {1}] [get_bd_cells QSFP/QSFP_$QSFP_INDEX/axi_interconnect_0]
set_property -dict [list CONFIG.FIFO_DEPTH {1024} CONFIG.FIFO_MODE {1} CONFIG.IS_ACLK_ASYNC {1} CONFIG.SYNCHRONIZATION_STAGES {3}] [get_bd_cells QSFP/QSFP_$QSFP_INDEX/network_rx_cdc]
set_property -dict [list CONFIG.FIFO_DEPTH {1024} CONFIG.FIFO_MODE {1} CONFIG.IS_ACLK_ASYNC {1} CONFIG.SYNCHRONIZATION_STAGES {3}] [get_bd_cells QSFP/QSFP_$QSFP_INDEX/network_tx_cdc]
set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {0}] [get_bd_cells QSFP/QSFP_$QSFP_INDEX/w1v0]
set_property -dict [list CONFIG.CONST_WIDTH {10} CONFIG.CONST_VAL {0}] [get_bd_cells QSFP/QSFP_$QSFP_INDEX/w10v0]
set_property -dict [list CONFIG.CONST_WIDTH {12} CONFIG.CONST_VAL {0}] [get_bd_cells QSFP/QSFP_$QSFP_INDEX/w12v0]
set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {0}] [get_bd_cells QSFP/QSFP_$QSFP_INDEX/w16v0]
set_property -dict [list CONFIG.CONST_WIDTH {56} CONFIG.CONST_VAL {0}] [get_bd_cells QSFP/QSFP_$QSFP_INDEX/w56v0]
set_property -dict [list CONFIG.HAS_TKEEP.VALUE_SRC USER CONFIG.HAS_TLAST.VALUE_SRC USER CONFIG.TUSER_WIDTH.VALUE_SRC USER CONFIG.TDEST_WIDTH.VALUE_SRC USER CONFIG.TID_WIDTH.VALUE_SRC USER CONFIG.TDATA_NUM_BYTES.VALUE_SRC USER] [get_bd_cells QSFP/QSFP_$QSFP_INDEX/packet_mode_fifo]
set_property -dict [list CONFIG.TDATA_NUM_BYTES {64} CONFIG.TID_WIDTH {16} CONFIG.TDEST_WIDTH {16} CONFIG.TUSER_WIDTH {32} CONFIG.FIFO_DEPTH {16} CONFIG.HAS_TKEEP {1} CONFIG.HAS_TLAST {1}] [get_bd_cells QSFP/QSFP_$QSFP_INDEX/packet_mode_fifo]

# connect Interfaces
connect_bd_intf_net [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/$QSFP_INTERFACE] [get_bd_intf_pins /QSFP/QSFP_$QSFP_INDEX/cmac/gt_serial_port]
connect_bd_intf_net [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/gt_ref] [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/cmac/gt_ref_clk]
connect_bd_intf_net [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/cmac/lbus_tx] [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/lbus_axis_converter/lbus_tx]
connect_bd_intf_net [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/cmac/lbus_rx] [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/lbus_axis_converter/lbus_rx]
connect_bd_intf_net [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/lbus_axis_converter/m_axis] [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/GULF_Stream/s_axis]
connect_bd_intf_net [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/lbus_axis_converter/s_axis] [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/GULF_Stream/m_axis]
connect_bd_intf_net [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/network_tx_cdc/M_AXIS] [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/packet_mode_fifo/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/network_rx_cdc/S_AXIS] [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/GULF_Stream/payload_to_user]
connect_bd_intf_net [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/network_config] [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/axi_interconnect_0/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/axi_interconnect_0/M00_AXI] [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/cmac/s_axi]
connect_bd_intf_net [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/axi_interconnect_0/M01_AXI] [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/GULF_Stream/s_axictl]

connect_bd_intf_net [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/network_tx] [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/network_tx_cdc/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/network_rx_cdc/M_AXIS] [get_bd_intf_pins QSFP/QSFP_$QSFP_INDEX/network_rx]

# connect Clocks and resets
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/init] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/cmac/init_clk]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/cmac/gt_txusrclk2] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/cmac/rx_clk]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/cmac/gt_txusrclk2] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/network_clk]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/cmac/gt_txusrclk2] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/lbus_axis_converter/clk]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/cmac/gt_txusrclk2] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/GULF_Stream/clk]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/cmac/gt_txusrclk2] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/network_reset_hub/slowest_sync_clk]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/cmac/gt_txusrclk2] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/packet_mode_fifo/s_axis_aclk]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/cmac/gt_txusrclk2] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/cmac/s_axi_aclk]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/cmac/gt_txusrclk2] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/network_rx_cdc/s_axis_aclk]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/cmac/gt_txusrclk2] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/network_tx_cdc/m_axis_aclk]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/cmac/pm_tick] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/w1v0/dout]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/cmac/s_axi_sreset] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/network_reset_hub/peripheral_reset]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/axi_interconnect_0/ACLK] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/cmac/gt_txusrclk2]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/axi_interconnect_0/S00_ACLK] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/cmac/gt_txusrclk2]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/axi_interconnect_0/M00_ACLK] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/cmac/gt_txusrclk2]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/axi_interconnect_0/M01_ACLK] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/cmac/gt_txusrclk2]
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
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/w1v0/dout] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/lbus_axis_converter/rst]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/w1v0/dout] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/cmac/drp_en]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/w1v0/dout] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/cmac/drp_we]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/w1v0/dout] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/cmac/gtwiz_reset_tx_datapath]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/w1v0/dout] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/cmac/gtwiz_reset_rx_datapath]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/w1v0/dout] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/cmac/sys_reset]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/w1v0/dout] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/cmac/core_rx_reset]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/w1v0/dout] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/cmac/core_tx_reset]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/w1v0/dout] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/cmac/core_drp_reset]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/w1v0/dout] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/cmac/drp_clk]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/w10v0/dout] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/cmac/drp_addr]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/w12v0/dout] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/cmac/gt_loopback_in]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/w16v0/dout] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/cmac/drp_di]
connect_bd_net [get_bd_pins QSFP/QSFP_$QSFP_INDEX/w56v0/dout] [get_bd_pins QSFP/QSFP_$QSFP_INDEX/cmac/tx_preamblein]
