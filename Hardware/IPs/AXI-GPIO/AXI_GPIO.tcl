open_project gpio
set_top gpio
add_files AXI_GPIO.cpp
open_solution "solution1"
set_part {xcu250-figd2104-2L-e} -tool vivado
create_clock -period 3 -name default
config_compile
config_export -format ip_catalog -rtl verilog -vivado_phys_opt place -vivado_report_level 0
config_rtl -encoding onehot -reset all -reset_level low
csynth_design
export_design -rtl verilog -format ip_catalog
exit
