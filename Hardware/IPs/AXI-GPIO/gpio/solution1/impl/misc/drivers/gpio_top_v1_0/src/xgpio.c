// ==============================================================
// File generated on Wed Jan 27 13:58:24 EST 2021
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:36:41 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xgpio.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XGpio_CfgInitialize(XGpio *InstancePtr, XGpio_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Bus_a_BaseAddress = ConfigPtr->Bus_a_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XGpio_SetInput_0_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_0_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_0_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_0_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_1_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_1_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_1_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_1_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_2_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_2_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_2_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_2_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_3_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_3_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_3_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_3_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_4_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_4_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_4_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_4_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_5_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_5_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_5_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_5_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_6_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_6_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_6_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_6_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_7_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_7_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_7_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_7_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_8_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_8_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_8_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_8_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_9_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_9_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_9_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_9_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_10_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_10_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_10_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_10_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_11_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_11_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_11_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_11_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_12_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_12_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_12_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_12_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_13_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_13_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_13_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_13_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_14_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_14_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_14_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_14_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_15_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_15_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_15_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_15_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_16_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_16_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_16_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_16_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_17_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_17_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_17_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_17_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_18_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_18_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_18_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_18_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_19_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_19_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_19_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_19_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_20_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_20_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_20_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_20_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_21_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_21_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_21_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_21_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_22_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_22_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_22_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_22_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_23_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_23_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_23_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_23_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_24_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_24_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_24_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_24_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_25_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_25_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_25_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_25_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_26_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_26_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_26_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_26_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_27_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_27_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_27_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_27_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_28_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_28_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_28_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_28_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_29_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_29_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_29_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_29_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_30_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_30_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_30_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_30_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_31_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_31_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_31_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_31_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_32_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_32_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_32_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_32_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_33_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_33_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_33_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_33_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_34_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_34_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_34_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_34_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_35_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_35_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_35_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_35_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_36_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_36_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_36_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_36_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_37_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_37_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_37_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_37_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_38_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_38_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_38_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_38_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_39_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_39_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_39_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_39_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_40_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_40_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_40_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_40_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_41_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_41_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_41_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_41_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_42_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_42_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_42_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_42_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_43_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_43_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_43_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_43_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_44_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_44_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_44_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_44_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_45_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_45_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_45_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_45_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_46_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_46_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_46_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_46_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_47_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_47_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_47_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_47_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_48_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_48_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_48_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_48_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_49_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_49_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_49_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_49_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_50_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_50_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_50_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_50_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_51_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_51_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_51_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_51_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_52_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_52_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_52_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_52_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_53_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_53_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_53_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_53_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_54_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_54_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_54_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_54_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_55_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_55_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_55_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_55_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_56_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_56_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_56_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_56_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_57_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_57_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_57_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_57_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_58_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_58_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_58_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_58_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_59_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_59_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_59_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_59_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_60_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_60_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_60_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_60_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_61_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_61_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_61_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_61_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_62_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_62_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_62_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_62_AXI_V_DATA);
    return Data;
}

void XGpio_SetInput_63_axi_v(XGpio *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XGpio_WriteReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_63_AXI_V_DATA, Data);
}

u32 XGpio_GetInput_63_axi_v(XGpio *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XGpio_ReadReg(InstancePtr->Bus_a_BaseAddress, XGPIO_BUS_A_ADDR_INPUT_63_AXI_V_DATA);
    return Data;
}

