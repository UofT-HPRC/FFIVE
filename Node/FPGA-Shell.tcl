source Parameters.tcl
create_project FPGA_Shell -in_memory -part $FPGA
set_property board_part $BOARD [current_project]
set_property ip_repo_paths {"Hardware/IPs/GULF-Stream/" "Hardware/IPs/lbus_axis_converter"} [current_project]
update_ip_catalog -rebuild
create_bd_design FPGA_Shell -dir $WORK_DIR
open_bd_design FPGA_Shell
if ($QSFP_COUNT) {
	create_bd_cell -type hier QSFP
	for {set QSFP_INDEX 0} {$QSFP_INDEX < $QSFP_COUNT} {incr QSFP_INDEX} {
		set QSFP_INTERFACE [lindex $QSFP_INTERFACES $QSFP_INDEX]
		set QSFP_CLOCK [lindex $QSFP_CLOCKS $QSFP_INDEX]
		source 100G-Eth.tcl
	}
}
set_property target_language VHDL [current_project]
validate_bd_design
save_bd_design
