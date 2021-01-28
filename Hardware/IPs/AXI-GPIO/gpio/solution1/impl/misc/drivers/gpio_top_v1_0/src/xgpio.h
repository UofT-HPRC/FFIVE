// ==============================================================
// File generated on Wed Jan 27 13:58:24 EST 2021
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:36:41 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XGPIO_H
#define XGPIO_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xgpio_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 Bus_a_BaseAddress;
} XGpio_Config;
#endif

typedef struct {
    u32 Bus_a_BaseAddress;
    u32 IsReady;
} XGpio;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XGpio_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XGpio_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XGpio_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XGpio_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XGpio_Initialize(XGpio *InstancePtr, u16 DeviceId);
XGpio_Config* XGpio_LookupConfig(u16 DeviceId);
int XGpio_CfgInitialize(XGpio *InstancePtr, XGpio_Config *ConfigPtr);
#else
int XGpio_Initialize(XGpio *InstancePtr, const char* InstanceName);
int XGpio_Release(XGpio *InstancePtr);
#endif


void XGpio_SetInput_0_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_0_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_1_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_1_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_2_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_2_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_3_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_3_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_4_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_4_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_5_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_5_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_6_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_6_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_7_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_7_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_8_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_8_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_9_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_9_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_10_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_10_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_11_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_11_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_12_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_12_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_13_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_13_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_14_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_14_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_15_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_15_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_16_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_16_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_17_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_17_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_18_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_18_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_19_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_19_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_20_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_20_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_21_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_21_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_22_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_22_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_23_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_23_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_24_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_24_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_25_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_25_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_26_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_26_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_27_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_27_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_28_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_28_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_29_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_29_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_30_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_30_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_31_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_31_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_32_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_32_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_33_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_33_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_34_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_34_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_35_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_35_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_36_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_36_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_37_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_37_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_38_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_38_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_39_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_39_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_40_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_40_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_41_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_41_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_42_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_42_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_43_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_43_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_44_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_44_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_45_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_45_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_46_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_46_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_47_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_47_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_48_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_48_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_49_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_49_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_50_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_50_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_51_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_51_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_52_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_52_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_53_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_53_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_54_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_54_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_55_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_55_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_56_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_56_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_57_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_57_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_58_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_58_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_59_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_59_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_60_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_60_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_61_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_61_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_62_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_62_axi_v(XGpio *InstancePtr);
void XGpio_SetInput_63_axi_v(XGpio *InstancePtr, u32 Data);
u32 XGpio_GetInput_63_axi_v(XGpio *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
