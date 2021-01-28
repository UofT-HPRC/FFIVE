# ==============================================================
# File generated on Wed Jan 27 13:58:24 EST 2021
# Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
# SW Build 2405991 on Thu Dec  6 23:36:41 MST 2018
# IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
# ==============================================================
proc generate {drv_handle} {
    xdefine_include_file $drv_handle "xparameters.h" "XGpio" \
        "NUM_INSTANCES" \
        "DEVICE_ID" \
        "C_S_AXI_BUS_A_BASEADDR" \
        "C_S_AXI_BUS_A_HIGHADDR"

    xdefine_config_file $drv_handle "xgpio_g.c" "XGpio" \
        "DEVICE_ID" \
        "C_S_AXI_BUS_A_BASEADDR"

    xdefine_canonical_xpars $drv_handle "xparameters.h" "XGpio" \
        "DEVICE_ID" \
        "C_S_AXI_BUS_A_BASEADDR" \
        "C_S_AXI_BUS_A_HIGHADDR"
}

