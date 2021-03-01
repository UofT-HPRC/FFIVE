source Parameters.tcl
create_project FPGA_Shell -part $FPGA
set_property board_part $BOARD [current_project]
set_property ip_repo_paths {"IPs/GULF-Stream/" "IPs/lbus_axis_converter" "IPs/VXLAN-bridge" "IPs/IPLibrary"} [current_project]
update_ip_catalog -rebuild
create_bd_design FPGA_Shell -dir $WORK_DIR
open_bd_design FPGA_Shell

## Network
source VXLAN.tcl
source QSFP.tcl

create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 init
connect_bd_intf_net [get_bd_intf_ports init] -boundary_type upper [get_bd_intf_pins QSFP/init]
for {set QSFP_INDEX 0} {$QSFP_INDEX < $QSFP_COUNT} {incr QSFP_INDEX} {
	set QSFP_SPEED [lindex $QSFP_SPEEDS $QSFP_INDEX]
    if {$QSFP_SPEED == "100G"} {
        set CLOCK [get_property CONFIG.GT_REF_CLK_FREQ [get_bd_cells QSFP/QSFP_${QSFP_INDEX}/cmac]]
        set CLOCK [expr int(1000000 * $CLOCK)]
    } else {
        set CLOCK [get_property CONFIG.GT_REF_CLK_FREQ [get_bd_cells QSFP/QSFP_${QSFP_INDEX}/eth]]
        set CLOCK [expr int(1000000 * $CLOCK)]
    }
    set QSFP_INTERFACE [lindex $QSFP_INTERFACES $QSFP_INDEX]
    create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gt_rtl:1.0 ${QSFP_INTERFACE}
    create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 QSFP_${QSFP_INDEX}_refclk
    set_property -dict [list CONFIG.FREQ_HZ ${CLOCK}] [get_bd_intf_ports QSFP_${QSFP_INDEX}_refclk]
    
    connect_bd_intf_net -boundary_type upper [get_bd_intf_pins QSFP/QSFP_${QSFP_INDEX}_rx] [get_bd_intf_pins VXLAN/network_${QSFP_INDEX}_rx]
    connect_bd_intf_net -boundary_type upper [get_bd_intf_pins QSFP/QSFP_${QSFP_INDEX}_tx] [get_bd_intf_pins VXLAN/network_${QSFP_INDEX}_tx]
    connect_bd_intf_net [get_bd_intf_ports ${QSFP_INTERFACE}] -boundary_type upper [get_bd_intf_pins QSFP/${QSFP_INTERFACE}]
    connect_bd_intf_net [get_bd_intf_ports QSFP_${QSFP_INDEX}_refclk] -boundary_type upper [get_bd_intf_pins QSFP/QSFP_${QSFP_INDEX}_refclk]
}

## DDR4
if {$DDR4_COUNT} {
	source DDR4.tcl
    for {set DDR4_INDEX 0} {$DDR4_INDEX < $DDR4_COUNT} {incr DDR4_INDEX} {
	    set DDR4_INTERFACE [lindex $DDR4_INTERFACES $DDR4_INDEX]
        set CLOCK [get_property CONFIG.C0.DDR4_InputClockPeriod [get_bd_cells DDR4/$DDR4_INTERFACE]]
        set CLOCK [expr int(1000000000000 / $CLOCK)]
	    create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddr4_rtl:1.0 ddr4_${DDR4_INDEX}
	    create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 ddr4_clk_${DDR4_INDEX}
        set_property -dict [list CONFIG.FREQ_HZ ${CLOCK}] [get_bd_intf_ports ddr4_clk_${DDR4_INDEX}]

        connect_bd_intf_net [get_bd_intf_ports ddr4_${DDR4_INDEX}] -boundary_type upper [get_bd_intf_pins DDR4/ddr4_${DDR4_INDEX}]
        connect_bd_intf_net [get_bd_intf_ports ddr4_clk_${DDR4_INDEX}] -boundary_type upper [get_bd_intf_pins DDR4/ddr4_clk_${DDR4_INDEX}]
    }
}

## VNF
source VNF.tcl

## ID
create_bd_cell -type ip -vlnv mohammad.ewais.ca:ME_IPs:AXI4_RAM:1.0 ID_RAM
set_property -dict [list CONFIG.MEMORY_FILE ${WORK_DIR}/AXI4_RAM.mif CONFIG.C_S00_AXI_AWUSER_WIDTH {1} CONFIG.C_S00_AXI_ARUSER_WIDTH {1} CONFIG.C_S00_AXI_WUSER_WIDTH {1} CONFIG.C_S00_AXI_RUSER_WIDTH {1} CONFIG.C_S00_AXI_BUSER_WIDTH {1}] [get_bd_cells ID_RAM]

## ARM
if {$USE_ARM} {
    source ARM.tcl
    connect_bd_intf_net [get_bd_intf_pins ID_RAM/s00_axi] -boundary_type upper [get_bd_intf_pins ARM/ID_access]
    connect_bd_net [get_bd_pins ID_RAM/s00_axi_aclk] [get_bd_pins ARM/config_clk]
    connect_bd_net [get_bd_pins ID_RAM/s00_axi_aresetn] [get_bd_pins ARM/config_reset]
    connect_bd_intf_net -boundary_type upper [get_bd_intf_pins ARM/VXLAN_ctrl] [get_bd_intf_pins VXLAN/VXLAN_ctrl]
    connect_bd_intf_net -boundary_type upper [get_bd_intf_pins ARM/QSFP_ctrl] [get_bd_intf_pins QSFP/network_config]
    connect_bd_intf_net -boundary_type upper [get_bd_intf_pins ARM/DDR4_access] [get_bd_intf_pins DDR4/cpu_mem]
    connect_bd_net [get_bd_pins VXLAN/VXLAN_ctrl_clk] [get_bd_pins ARM/config_clk] -boundary_type upper
    connect_bd_net [get_bd_pins ARM/config_reset] [get_bd_pins VXLAN/VXLAN_ctrl_reset] -boundary_type upper
    connect_bd_net [get_bd_pins QSFP/config_clk] [get_bd_pins ARM/config_clk] -boundary_type upper
    connect_bd_net [get_bd_pins QSFP/config_reset] [get_bd_pins ARM/config_reset] -boundary_type upper
    connect_bd_net [get_bd_pins QSFP/general_reset] [get_bd_pins ARM/general_reset] -boundary_type upper
    connect_bd_net [get_bd_pins DDR4/global_reset] [get_bd_pins ARM/general_reset] -boundary_type upper
    connect_bd_net [get_bd_pins DDR4/cpu_mem_clk] [get_bd_pins ARM/config_clk] -boundary_type upper
    connect_bd_net [get_bd_pins DDR4/cpu_mem_reset] [get_bd_pins ARM/config_reset] -boundary_type upper
    connect_bd_net [get_bd_pins VNF/config_clk] [get_bd_pins ARM/config_clk] -boundary_type upper
    connect_bd_net [get_bd_pins VNF/config_reset] [get_bd_pins ARM/config_reset] -boundary_type upper
    connect_bd_intf_net -boundary_type upper [get_bd_intf_pins VNF/fpga_mem] [get_bd_intf_pins DDR4/fpga_mem]
    connect_bd_intf_net -boundary_type upper [get_bd_intf_pins VNF/cpu_mem] [get_bd_intf_pins ARM/ARM_DDR4_access]
    connect_bd_intf_net -boundary_type upper [get_bd_intf_pins ARM/VNF_ctrl] [get_bd_intf_pins VNF/VNF_config]
    connect_bd_net [get_bd_pins ARM/vnf_clk] [get_bd_pins DDR4/fpga_mem_clk] -boundary_type upper
    connect_bd_net [get_bd_pins ARM/vnf_clk] [get_bd_pins VNF/user_clk] -boundary_type upper
    connect_bd_net [get_bd_pins ARM/vnf_reset] [get_bd_pins VNF/user_reset] -boundary_type upper
    connect_bd_net [get_bd_pins ARM/vnf_reset] [get_bd_pins DDR4/fpga_mem_reset] -boundary_type upper

    for {set QSFP_INDEX 0} {$QSFP_INDEX < $QSFP_COUNT} {incr QSFP_INDEX} {
        connect_bd_net [get_bd_pins VNF/VXLAN_${QSFP_INDEX}_clk] [get_bd_pins ARM/network_clk] -boundary_type upper
        connect_bd_net [get_bd_pins VNF/VXLAN_${QSFP_INDEX}_reset] [get_bd_pins ARM/network_reset] -boundary_type upper
        connect_bd_net [get_bd_pins ARM/network_reset] [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}_reset] -boundary_type upper
        connect_bd_net [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}_clk] [get_bd_pins ARM/network_clk] -boundary_type upper
        connect_bd_net [get_bd_pins QSFP/QSFP_${QSFP_INDEX}_iface_reset] [get_bd_pins ARM/network_reset] -boundary_type upper
        connect_bd_net [get_bd_pins ARM/network_clk] [get_bd_pins QSFP/QSFP_${QSFP_INDEX}_iface_clk] -boundary_type upper
        set VXLAN_COUNT [lindex $VXLAN_INTERFACES $QSFP_INDEX]
        for {set VXLAN_INDEX 0} {$VXLAN_INDEX < $VXLAN_COUNT} {incr VXLAN_INDEX} {
            connect_bd_intf_net -boundary_type upper [get_bd_intf_pins VXLAN/VXLAN_${QSFP_INDEX}_${VXLAN_INDEX}_rx] [get_bd_intf_pins VNF/VXLAN_${QSFP_INDEX}_${VXLAN_INDEX}_rx]
            connect_bd_intf_net -boundary_type upper [get_bd_intf_pins VXLAN/VXLAN_${QSFP_INDEX}_${VXLAN_INDEX}_tx] [get_bd_intf_pins VNF/VXLAN_${QSFP_INDEX}_${VXLAN_INDEX}_tx]
        }
    }

    ## Address Mapping
    source ARM_AddressMapping.tcl
} else {
    source PCIe.tcl

    create_bd_intf_port -mode Master -vlnv xilinx.com:interface:pcie_7x_mgt_rtl:1.0 $PCIe
    create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 pcie_clk
    create_bd_port -dir I pcie_reset

    connect_bd_intf_net [get_bd_intf_pins ID_RAM/s00_axi] -boundary_type upper [get_bd_intf_pins PCIe/ID_access]
    connect_bd_net [get_bd_pins ID_RAM/s00_axi_aclk] [get_bd_pins PCIe/config_clk]
    connect_bd_net [get_bd_pins ID_RAM/s00_axi_aresetn] [get_bd_pins PCIe/config_reset]
    connect_bd_intf_net -boundary_type upper [get_bd_intf_pins PCIe/VXLAN_ctrl] [get_bd_intf_pins VXLAN/VXLAN_ctrl]
    connect_bd_intf_net -boundary_type upper [get_bd_intf_pins PCIe/QSFP_ctrl] [get_bd_intf_pins QSFP/network_config]
    connect_bd_intf_net -boundary_type upper [get_bd_intf_pins PCIe/DDR4_access] [get_bd_intf_pins DDR4/cpu_mem]
    connect_bd_net [get_bd_pins VXLAN/VXLAN_ctrl_clk] [get_bd_pins PCIe/config_clk] -boundary_type upper
    connect_bd_net [get_bd_pins PCIe/config_reset] [get_bd_pins VXLAN/VXLAN_ctrl_reset] -boundary_type upper
    connect_bd_net [get_bd_pins QSFP/config_clk] [get_bd_pins PCIe/config_clk] -boundary_type upper
    connect_bd_net [get_bd_pins QSFP/config_reset] [get_bd_pins PCIe/config_reset] -boundary_type upper
    connect_bd_net [get_bd_pins QSFP/general_reset] [get_bd_pins PCIe/general_reset] -boundary_type upper
    connect_bd_net [get_bd_pins DDR4/global_reset] [get_bd_pins PCIe/general_reset] -boundary_type upper
    connect_bd_net [get_bd_pins DDR4/cpu_mem_clk] [get_bd_pins PCIe/config_clk] -boundary_type upper
    connect_bd_net [get_bd_pins DDR4/cpu_mem_reset] [get_bd_pins PCIe/config_reset] -boundary_type upper
    connect_bd_net [get_bd_pins VNF/config_clk] [get_bd_pins PCIe/config_clk] -boundary_type upper
    connect_bd_net [get_bd_pins VNF/config_reset] [get_bd_pins PCIe/config_reset] -boundary_type upper
    connect_bd_intf_net -boundary_type upper [get_bd_intf_pins VNF/fpga_mem] [get_bd_intf_pins DDR4/fpga_mem]
    connect_bd_intf_net -boundary_type upper [get_bd_intf_pins PCIe/VNF_ctrl] [get_bd_intf_pins VNF/VNF_config]
    connect_bd_net [get_bd_pins PCIe/vnf_clk] [get_bd_pins DDR4/fpga_mem_clk] -boundary_type upper
    connect_bd_net [get_bd_pins PCIe/vnf_clk] [get_bd_pins VNF/user_clk] -boundary_type upper
    connect_bd_net [get_bd_pins PCIe/vnf_reset] [get_bd_pins VNF/user_reset] -boundary_type upper
    connect_bd_net [get_bd_pins PCIe/vnf_reset] [get_bd_pins DDR4/fpga_mem_reset] -boundary_type upper
    connect_bd_intf_net [get_bd_intf_ports $PCIe] -boundary_type upper [get_bd_intf_pins PCIe/$PCIe]
    connect_bd_intf_net [get_bd_intf_ports pcie_clk] -boundary_type upper [get_bd_intf_pins PCIe/pcie_clk]
    connect_bd_net [get_bd_ports pcie_reset] [get_bd_pins PCIe/pcie_reset]

    for {set QSFP_INDEX 0} {$QSFP_INDEX < $QSFP_COUNT} {incr QSFP_INDEX} {
        connect_bd_net [get_bd_pins VNF/VXLAN_${QSFP_INDEX}_clk] [get_bd_pins PCIe/network_clk] -boundary_type upper
        connect_bd_net [get_bd_pins VNF/VXLAN_${QSFP_INDEX}_reset] [get_bd_pins PCIe/network_reset] -boundary_type upper
        connect_bd_net [get_bd_pins PCIe/network_reset] [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}_reset] -boundary_type upper
        connect_bd_net [get_bd_pins VXLAN/VXLAN_${QSFP_INDEX}_clk] [get_bd_pins PCIe/network_clk] -boundary_type upper
        connect_bd_net [get_bd_pins QSFP/QSFP_${QSFP_INDEX}_iface_reset] [get_bd_pins PCIe/network_reset] -boundary_type upper
        connect_bd_net [get_bd_pins PCIe/network_clk] [get_bd_pins QSFP/QSFP_${QSFP_INDEX}_iface_clk] -boundary_type upper
        set VXLAN_COUNT [lindex $VXLAN_INTERFACES $QSFP_INDEX]
        for {set VXLAN_INDEX 0} {$VXLAN_INDEX < $VXLAN_COUNT} {incr VXLAN_INDEX} {
            connect_bd_intf_net -boundary_type upper [get_bd_intf_pins VXLAN/VXLAN_${QSFP_INDEX}_${VXLAN_INDEX}_rx] [get_bd_intf_pins VNF/VXLAN_${QSFP_INDEX}_${VXLAN_INDEX}_rx]
            connect_bd_intf_net -boundary_type upper [get_bd_intf_pins VXLAN/VXLAN_${QSFP_INDEX}_${VXLAN_INDEX}_tx] [get_bd_intf_pins VNF/VXLAN_${QSFP_INDEX}_${VXLAN_INDEX}_tx]
        }
    }
}

set_property target_language VHDL [current_project]
validate_bd_design
save_bd_design
make_wrapper -files [get_files FPGA_Shell/FPGA_Shell.bd] -top
add_files -norecurse FPGA_Shell/hdl/FPGA_Shell_wrapper.vhd
set_property top FPGA_Shell_wrapper [current_fileset]
set_property strategy Flow_PerfOptimized_high [get_runs synth_1]
set_property strategy Performance_ExtraTimingOpt [get_runs impl_1]
