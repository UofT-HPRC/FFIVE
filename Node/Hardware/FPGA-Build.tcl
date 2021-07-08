source Parameters.tcl
open_project $WORK_DIR/FPGA_Shell/FPGA_Shell.xpr
update_compile_order -fileset sources_1
launch_runs impl_1 -to_step write_bitstream
