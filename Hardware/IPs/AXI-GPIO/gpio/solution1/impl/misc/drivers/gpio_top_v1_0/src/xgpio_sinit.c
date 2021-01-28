// ==============================================================
// File generated on Wed Jan 27 13:58:24 EST 2021
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:36:41 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xgpio.h"

extern XGpio_Config XGpio_ConfigTable[];

XGpio_Config *XGpio_LookupConfig(u16 DeviceId) {
	XGpio_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XGPIO_NUM_INSTANCES; Index++) {
		if (XGpio_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XGpio_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XGpio_Initialize(XGpio *InstancePtr, u16 DeviceId) {
	XGpio_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XGpio_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XGpio_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

