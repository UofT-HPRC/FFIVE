set FPGA xcu250-figd2104-2L-e
set BOARD xilinx.com:au250:part0:1.3
set WORK_DIR /work/mewais/projects/FPGA-Shell/Hardware/
set QSFP_COUNT 2
set QSFP_INTERFACES {qsfp1 qsfp0 }
set QSFP_MODES {qsfp1_4x qsfp0_4x }
set QSFP_CLOCKS {qsfp1_156mhz qsfp0_156mhz }
set QSFP_SPEEDS {100G 100G }
set QSFP_100_USED true
set VXLAN_INTERFACES {2 2 }
set DDR4_COUNT 4
set DDR4_INTERFACES {ddr4_sdram_c0 ddr4_sdram_c1 ddr4_sdram_c2 ddr4_sdram_c3 }
set DDR4_CLOCKS {default_300mhz_clk0 default_300mhz_clk1 default_300mhz_clk2 default_300mhz_clk3 }
set PCIe pci_express_x16
set PCIe_CLOCK pcie_refclk
set PCIe_RESET pcie_perstn
set USE_ARM false
set USER_CLOCK_DIVS {2 1}
set USER_CLOCK 400
