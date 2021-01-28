source Parameters.tcl
create_project FPGA_Shell -in_memory -part $FPGA
set_property board_part $BOARD [current_project]
set_property ip_repo_paths {"IPs/GULF-Stream/" "IPs/lbus_axis_converter" "IPs/VXLAN-bridge" "IPs/AXI-GPIO" "IPs/IPLibrary"} [current_project]
update_ip_catalog -rebuild
create_bd_design FPGA_Shell -dir $WORK_DIR
open_bd_design FPGA_Shell
if {$QSFP_COUNT} {
    source VXLAN.tcl
	source QSFP.tcl
}
if {$DDR4_COUNT} {
	source DDR4.tcl
}
set_property target_language VHDL [current_project]
validate_bd_design
save_bd_design
