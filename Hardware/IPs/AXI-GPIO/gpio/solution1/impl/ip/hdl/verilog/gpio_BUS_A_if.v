// ==============================================================
// File generated on Wed Jan 27 13:58:25 EST 2021
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:36:41 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1ns/1ps
module gpio_BUS_A_if
#(parameter
    C_ADDR_WIDTH = 10,
    C_DATA_WIDTH = 32
)(
    // axi4 lite slave signals
    input  wire                      ACLK,
    input  wire                      ARESETN,
    input  wire [C_ADDR_WIDTH-1:0]   AWADDR,
    input  wire                      AWVALID,
    output wire                      AWREADY,
    input  wire [C_DATA_WIDTH-1:0]   WDATA,
    input  wire [C_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                      WVALID,
    output wire                      WREADY,
    output wire [1:0]                BRESP,
    output wire                      BVALID,
    input  wire                      BREADY,
    input  wire [C_ADDR_WIDTH-1:0]   ARADDR,
    input  wire                      ARVALID,
    output wire                      ARREADY,
    output wire [C_DATA_WIDTH-1:0]   RDATA,
    output wire [1:0]                RRESP,
    output wire                      RVALID,
    input  wire                      RREADY,
    // user signals
    output wire [31:0]               I_input_0_axi_V,
    output wire [15:0]               I_input_1_axi_V,
    output wire [15:0]               I_input_2_axi_V,
    output wire [23:0]               I_input_3_axi_V,
    output wire [31:0]               I_input_4_axi_V,
    output wire [15:0]               I_input_5_axi_V,
    output wire [15:0]               I_input_6_axi_V,
    output wire [23:0]               I_input_7_axi_V,
    output wire [31:0]               I_input_8_axi_V,
    output wire [15:0]               I_input_9_axi_V,
    output wire [15:0]               I_input_10_axi_V,
    output wire [23:0]               I_input_11_axi_V,
    output wire [31:0]               I_input_12_axi_V,
    output wire [15:0]               I_input_13_axi_V,
    output wire [15:0]               I_input_14_axi_V,
    output wire [23:0]               I_input_15_axi_V,
    output wire [31:0]               I_input_16_axi_V,
    output wire [15:0]               I_input_17_axi_V,
    output wire [15:0]               I_input_18_axi_V,
    output wire [23:0]               I_input_19_axi_V,
    output wire [31:0]               I_input_20_axi_V,
    output wire [15:0]               I_input_21_axi_V,
    output wire [15:0]               I_input_22_axi_V,
    output wire [23:0]               I_input_23_axi_V,
    output wire [31:0]               I_input_24_axi_V,
    output wire [15:0]               I_input_25_axi_V,
    output wire [15:0]               I_input_26_axi_V,
    output wire [23:0]               I_input_27_axi_V,
    output wire [31:0]               I_input_28_axi_V,
    output wire [15:0]               I_input_29_axi_V,
    output wire [15:0]               I_input_30_axi_V,
    output wire [23:0]               I_input_31_axi_V,
    output wire [31:0]               I_input_32_axi_V,
    output wire [15:0]               I_input_33_axi_V,
    output wire [15:0]               I_input_34_axi_V,
    output wire [23:0]               I_input_35_axi_V,
    output wire [31:0]               I_input_36_axi_V,
    output wire [15:0]               I_input_37_axi_V,
    output wire [15:0]               I_input_38_axi_V,
    output wire [23:0]               I_input_39_axi_V,
    output wire [31:0]               I_input_40_axi_V,
    output wire [15:0]               I_input_41_axi_V,
    output wire [15:0]               I_input_42_axi_V,
    output wire [23:0]               I_input_43_axi_V,
    output wire [31:0]               I_input_44_axi_V,
    output wire [15:0]               I_input_45_axi_V,
    output wire [15:0]               I_input_46_axi_V,
    output wire [23:0]               I_input_47_axi_V,
    output wire [31:0]               I_input_48_axi_V,
    output wire [15:0]               I_input_49_axi_V,
    output wire [15:0]               I_input_50_axi_V,
    output wire [23:0]               I_input_51_axi_V,
    output wire [31:0]               I_input_52_axi_V,
    output wire [15:0]               I_input_53_axi_V,
    output wire [15:0]               I_input_54_axi_V,
    output wire [23:0]               I_input_55_axi_V,
    output wire [31:0]               I_input_56_axi_V,
    output wire [15:0]               I_input_57_axi_V,
    output wire [15:0]               I_input_58_axi_V,
    output wire [23:0]               I_input_59_axi_V,
    output wire [31:0]               I_input_60_axi_V,
    output wire [15:0]               I_input_61_axi_V,
    output wire [15:0]               I_input_62_axi_V,
    output wire [23:0]               I_input_63_axi_V
);
//------------------------Address Info-------------------
// 0x000 : reserved
// 0x004 : reserved
// 0x008 : reserved
// 0x00c : reserved
// 0x010 : reserved
// 0x014 : Data signal of input_0_axi_V
//         bit 31~0 - input_0_axi_V[31:0] (Read/Write)
// 0x018 : reserved
// 0x01c : Data signal of input_1_axi_V
//         bit 15~0 - input_1_axi_V[15:0] (Read/Write)
//         others   - reserved
// 0x020 : reserved
// 0x024 : Data signal of input_2_axi_V
//         bit 15~0 - input_2_axi_V[15:0] (Read/Write)
//         others   - reserved
// 0x028 : reserved
// 0x02c : Data signal of input_3_axi_V
//         bit 23~0 - input_3_axi_V[23:0] (Read/Write)
//         others   - reserved
// 0x030 : reserved
// 0x034 : Data signal of input_4_axi_V
//         bit 31~0 - input_4_axi_V[31:0] (Read/Write)
// 0x038 : reserved
// 0x03c : Data signal of input_5_axi_V
//         bit 15~0 - input_5_axi_V[15:0] (Read/Write)
//         others   - reserved
// 0x040 : reserved
// 0x044 : Data signal of input_6_axi_V
//         bit 15~0 - input_6_axi_V[15:0] (Read/Write)
//         others   - reserved
// 0x048 : reserved
// 0x04c : Data signal of input_7_axi_V
//         bit 23~0 - input_7_axi_V[23:0] (Read/Write)
//         others   - reserved
// 0x050 : reserved
// 0x054 : Data signal of input_8_axi_V
//         bit 31~0 - input_8_axi_V[31:0] (Read/Write)
// 0x058 : reserved
// 0x05c : Data signal of input_9_axi_V
//         bit 15~0 - input_9_axi_V[15:0] (Read/Write)
//         others   - reserved
// 0x060 : reserved
// 0x064 : Data signal of input_10_axi_V
//         bit 15~0 - input_10_axi_V[15:0] (Read/Write)
//         others   - reserved
// 0x068 : reserved
// 0x06c : Data signal of input_11_axi_V
//         bit 23~0 - input_11_axi_V[23:0] (Read/Write)
//         others   - reserved
// 0x070 : reserved
// 0x074 : Data signal of input_12_axi_V
//         bit 31~0 - input_12_axi_V[31:0] (Read/Write)
// 0x078 : reserved
// 0x07c : Data signal of input_13_axi_V
//         bit 15~0 - input_13_axi_V[15:0] (Read/Write)
//         others   - reserved
// 0x080 : reserved
// 0x084 : Data signal of input_14_axi_V
//         bit 15~0 - input_14_axi_V[15:0] (Read/Write)
//         others   - reserved
// 0x088 : reserved
// 0x08c : Data signal of input_15_axi_V
//         bit 23~0 - input_15_axi_V[23:0] (Read/Write)
//         others   - reserved
// 0x090 : reserved
// 0x094 : Data signal of input_16_axi_V
//         bit 31~0 - input_16_axi_V[31:0] (Read/Write)
// 0x098 : reserved
// 0x09c : Data signal of input_17_axi_V
//         bit 15~0 - input_17_axi_V[15:0] (Read/Write)
//         others   - reserved
// 0x0a0 : reserved
// 0x0a4 : Data signal of input_18_axi_V
//         bit 15~0 - input_18_axi_V[15:0] (Read/Write)
//         others   - reserved
// 0x0a8 : reserved
// 0x0ac : Data signal of input_19_axi_V
//         bit 23~0 - input_19_axi_V[23:0] (Read/Write)
//         others   - reserved
// 0x0b0 : reserved
// 0x0b4 : Data signal of input_20_axi_V
//         bit 31~0 - input_20_axi_V[31:0] (Read/Write)
// 0x0b8 : reserved
// 0x0bc : Data signal of input_21_axi_V
//         bit 15~0 - input_21_axi_V[15:0] (Read/Write)
//         others   - reserved
// 0x0c0 : reserved
// 0x0c4 : Data signal of input_22_axi_V
//         bit 15~0 - input_22_axi_V[15:0] (Read/Write)
//         others   - reserved
// 0x0c8 : reserved
// 0x0cc : Data signal of input_23_axi_V
//         bit 23~0 - input_23_axi_V[23:0] (Read/Write)
//         others   - reserved
// 0x0d0 : reserved
// 0x0d4 : Data signal of input_24_axi_V
//         bit 31~0 - input_24_axi_V[31:0] (Read/Write)
// 0x0d8 : reserved
// 0x0dc : Data signal of input_25_axi_V
//         bit 15~0 - input_25_axi_V[15:0] (Read/Write)
//         others   - reserved
// 0x0e0 : reserved
// 0x0e4 : Data signal of input_26_axi_V
//         bit 15~0 - input_26_axi_V[15:0] (Read/Write)
//         others   - reserved
// 0x0e8 : reserved
// 0x0ec : Data signal of input_27_axi_V
//         bit 23~0 - input_27_axi_V[23:0] (Read/Write)
//         others   - reserved
// 0x0f0 : reserved
// 0x0f4 : Data signal of input_28_axi_V
//         bit 31~0 - input_28_axi_V[31:0] (Read/Write)
// 0x0f8 : reserved
// 0x0fc : Data signal of input_29_axi_V
//         bit 15~0 - input_29_axi_V[15:0] (Read/Write)
//         others   - reserved
// 0x100 : reserved
// 0x104 : Data signal of input_30_axi_V
//         bit 15~0 - input_30_axi_V[15:0] (Read/Write)
//         others   - reserved
// 0x108 : reserved
// 0x10c : Data signal of input_31_axi_V
//         bit 23~0 - input_31_axi_V[23:0] (Read/Write)
//         others   - reserved
// 0x110 : reserved
// 0x114 : Data signal of input_32_axi_V
//         bit 31~0 - input_32_axi_V[31:0] (Read/Write)
// 0x118 : reserved
// 0x11c : Data signal of input_33_axi_V
//         bit 15~0 - input_33_axi_V[15:0] (Read/Write)
//         others   - reserved
// 0x120 : reserved
// 0x124 : Data signal of input_34_axi_V
//         bit 15~0 - input_34_axi_V[15:0] (Read/Write)
//         others   - reserved
// 0x128 : reserved
// 0x12c : Data signal of input_35_axi_V
//         bit 23~0 - input_35_axi_V[23:0] (Read/Write)
//         others   - reserved
// 0x130 : reserved
// 0x134 : Data signal of input_36_axi_V
//         bit 31~0 - input_36_axi_V[31:0] (Read/Write)
// 0x138 : reserved
// 0x13c : Data signal of input_37_axi_V
//         bit 15~0 - input_37_axi_V[15:0] (Read/Write)
//         others   - reserved
// 0x140 : reserved
// 0x144 : Data signal of input_38_axi_V
//         bit 15~0 - input_38_axi_V[15:0] (Read/Write)
//         others   - reserved
// 0x148 : reserved
// 0x14c : Data signal of input_39_axi_V
//         bit 23~0 - input_39_axi_V[23:0] (Read/Write)
//         others   - reserved
// 0x150 : reserved
// 0x154 : Data signal of input_40_axi_V
//         bit 31~0 - input_40_axi_V[31:0] (Read/Write)
// 0x158 : reserved
// 0x15c : Data signal of input_41_axi_V
//         bit 15~0 - input_41_axi_V[15:0] (Read/Write)
//         others   - reserved
// 0x160 : reserved
// 0x164 : Data signal of input_42_axi_V
//         bit 15~0 - input_42_axi_V[15:0] (Read/Write)
//         others   - reserved
// 0x168 : reserved
// 0x16c : Data signal of input_43_axi_V
//         bit 23~0 - input_43_axi_V[23:0] (Read/Write)
//         others   - reserved
// 0x170 : reserved
// 0x174 : Data signal of input_44_axi_V
//         bit 31~0 - input_44_axi_V[31:0] (Read/Write)
// 0x178 : reserved
// 0x17c : Data signal of input_45_axi_V
//         bit 15~0 - input_45_axi_V[15:0] (Read/Write)
//         others   - reserved
// 0x180 : reserved
// 0x184 : Data signal of input_46_axi_V
//         bit 15~0 - input_46_axi_V[15:0] (Read/Write)
//         others   - reserved
// 0x188 : reserved
// 0x18c : Data signal of input_47_axi_V
//         bit 23~0 - input_47_axi_V[23:0] (Read/Write)
//         others   - reserved
// 0x190 : reserved
// 0x194 : Data signal of input_48_axi_V
//         bit 31~0 - input_48_axi_V[31:0] (Read/Write)
// 0x198 : reserved
// 0x19c : Data signal of input_49_axi_V
//         bit 15~0 - input_49_axi_V[15:0] (Read/Write)
//         others   - reserved
// 0x1a0 : reserved
// 0x1a4 : Data signal of input_50_axi_V
//         bit 15~0 - input_50_axi_V[15:0] (Read/Write)
//         others   - reserved
// 0x1a8 : reserved
// 0x1ac : Data signal of input_51_axi_V
//         bit 23~0 - input_51_axi_V[23:0] (Read/Write)
//         others   - reserved
// 0x1b0 : reserved
// 0x1b4 : Data signal of input_52_axi_V
//         bit 31~0 - input_52_axi_V[31:0] (Read/Write)
// 0x1b8 : reserved
// 0x1bc : Data signal of input_53_axi_V
//         bit 15~0 - input_53_axi_V[15:0] (Read/Write)
//         others   - reserved
// 0x1c0 : reserved
// 0x1c4 : Data signal of input_54_axi_V
//         bit 15~0 - input_54_axi_V[15:0] (Read/Write)
//         others   - reserved
// 0x1c8 : reserved
// 0x1cc : Data signal of input_55_axi_V
//         bit 23~0 - input_55_axi_V[23:0] (Read/Write)
//         others   - reserved
// 0x1d0 : reserved
// 0x1d4 : Data signal of input_56_axi_V
//         bit 31~0 - input_56_axi_V[31:0] (Read/Write)
// 0x1d8 : reserved
// 0x1dc : Data signal of input_57_axi_V
//         bit 15~0 - input_57_axi_V[15:0] (Read/Write)
//         others   - reserved
// 0x1e0 : reserved
// 0x1e4 : Data signal of input_58_axi_V
//         bit 15~0 - input_58_axi_V[15:0] (Read/Write)
//         others   - reserved
// 0x1e8 : reserved
// 0x1ec : Data signal of input_59_axi_V
//         bit 23~0 - input_59_axi_V[23:0] (Read/Write)
//         others   - reserved
// 0x1f0 : reserved
// 0x1f4 : Data signal of input_60_axi_V
//         bit 31~0 - input_60_axi_V[31:0] (Read/Write)
// 0x1f8 : reserved
// 0x1fc : Data signal of input_61_axi_V
//         bit 15~0 - input_61_axi_V[15:0] (Read/Write)
//         others   - reserved
// 0x200 : reserved
// 0x204 : Data signal of input_62_axi_V
//         bit 15~0 - input_62_axi_V[15:0] (Read/Write)
//         others   - reserved
// 0x208 : reserved
// 0x20c : Data signal of input_63_axi_V
//         bit 23~0 - input_63_axi_V[23:0] (Read/Write)
//         others   - reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

//------------------------Parameter----------------------
// address bits
localparam
    ADDR_BITS = 10;

// address
localparam
    ADDR_INPUT_0_AXI_V_CTRL    = 10'h010,
    ADDR_INPUT_0_AXI_V_DATA_0  = 10'h014,
    ADDR_INPUT_1_AXI_V_CTRL    = 10'h018,
    ADDR_INPUT_1_AXI_V_DATA_0  = 10'h01c,
    ADDR_INPUT_2_AXI_V_CTRL    = 10'h020,
    ADDR_INPUT_2_AXI_V_DATA_0  = 10'h024,
    ADDR_INPUT_3_AXI_V_CTRL    = 10'h028,
    ADDR_INPUT_3_AXI_V_DATA_0  = 10'h02c,
    ADDR_INPUT_4_AXI_V_CTRL    = 10'h030,
    ADDR_INPUT_4_AXI_V_DATA_0  = 10'h034,
    ADDR_INPUT_5_AXI_V_CTRL    = 10'h038,
    ADDR_INPUT_5_AXI_V_DATA_0  = 10'h03c,
    ADDR_INPUT_6_AXI_V_CTRL    = 10'h040,
    ADDR_INPUT_6_AXI_V_DATA_0  = 10'h044,
    ADDR_INPUT_7_AXI_V_CTRL    = 10'h048,
    ADDR_INPUT_7_AXI_V_DATA_0  = 10'h04c,
    ADDR_INPUT_8_AXI_V_CTRL    = 10'h050,
    ADDR_INPUT_8_AXI_V_DATA_0  = 10'h054,
    ADDR_INPUT_9_AXI_V_CTRL    = 10'h058,
    ADDR_INPUT_9_AXI_V_DATA_0  = 10'h05c,
    ADDR_INPUT_10_AXI_V_CTRL   = 10'h060,
    ADDR_INPUT_10_AXI_V_DATA_0 = 10'h064,
    ADDR_INPUT_11_AXI_V_CTRL   = 10'h068,
    ADDR_INPUT_11_AXI_V_DATA_0 = 10'h06c,
    ADDR_INPUT_12_AXI_V_CTRL   = 10'h070,
    ADDR_INPUT_12_AXI_V_DATA_0 = 10'h074,
    ADDR_INPUT_13_AXI_V_CTRL   = 10'h078,
    ADDR_INPUT_13_AXI_V_DATA_0 = 10'h07c,
    ADDR_INPUT_14_AXI_V_CTRL   = 10'h080,
    ADDR_INPUT_14_AXI_V_DATA_0 = 10'h084,
    ADDR_INPUT_15_AXI_V_CTRL   = 10'h088,
    ADDR_INPUT_15_AXI_V_DATA_0 = 10'h08c,
    ADDR_INPUT_16_AXI_V_CTRL   = 10'h090,
    ADDR_INPUT_16_AXI_V_DATA_0 = 10'h094,
    ADDR_INPUT_17_AXI_V_CTRL   = 10'h098,
    ADDR_INPUT_17_AXI_V_DATA_0 = 10'h09c,
    ADDR_INPUT_18_AXI_V_CTRL   = 10'h0a0,
    ADDR_INPUT_18_AXI_V_DATA_0 = 10'h0a4,
    ADDR_INPUT_19_AXI_V_CTRL   = 10'h0a8,
    ADDR_INPUT_19_AXI_V_DATA_0 = 10'h0ac,
    ADDR_INPUT_20_AXI_V_CTRL   = 10'h0b0,
    ADDR_INPUT_20_AXI_V_DATA_0 = 10'h0b4,
    ADDR_INPUT_21_AXI_V_CTRL   = 10'h0b8,
    ADDR_INPUT_21_AXI_V_DATA_0 = 10'h0bc,
    ADDR_INPUT_22_AXI_V_CTRL   = 10'h0c0,
    ADDR_INPUT_22_AXI_V_DATA_0 = 10'h0c4,
    ADDR_INPUT_23_AXI_V_CTRL   = 10'h0c8,
    ADDR_INPUT_23_AXI_V_DATA_0 = 10'h0cc,
    ADDR_INPUT_24_AXI_V_CTRL   = 10'h0d0,
    ADDR_INPUT_24_AXI_V_DATA_0 = 10'h0d4,
    ADDR_INPUT_25_AXI_V_CTRL   = 10'h0d8,
    ADDR_INPUT_25_AXI_V_DATA_0 = 10'h0dc,
    ADDR_INPUT_26_AXI_V_CTRL   = 10'h0e0,
    ADDR_INPUT_26_AXI_V_DATA_0 = 10'h0e4,
    ADDR_INPUT_27_AXI_V_CTRL   = 10'h0e8,
    ADDR_INPUT_27_AXI_V_DATA_0 = 10'h0ec,
    ADDR_INPUT_28_AXI_V_CTRL   = 10'h0f0,
    ADDR_INPUT_28_AXI_V_DATA_0 = 10'h0f4,
    ADDR_INPUT_29_AXI_V_CTRL   = 10'h0f8,
    ADDR_INPUT_29_AXI_V_DATA_0 = 10'h0fc,
    ADDR_INPUT_30_AXI_V_CTRL   = 10'h100,
    ADDR_INPUT_30_AXI_V_DATA_0 = 10'h104,
    ADDR_INPUT_31_AXI_V_CTRL   = 10'h108,
    ADDR_INPUT_31_AXI_V_DATA_0 = 10'h10c,
    ADDR_INPUT_32_AXI_V_CTRL   = 10'h110,
    ADDR_INPUT_32_AXI_V_DATA_0 = 10'h114,
    ADDR_INPUT_33_AXI_V_CTRL   = 10'h118,
    ADDR_INPUT_33_AXI_V_DATA_0 = 10'h11c,
    ADDR_INPUT_34_AXI_V_CTRL   = 10'h120,
    ADDR_INPUT_34_AXI_V_DATA_0 = 10'h124,
    ADDR_INPUT_35_AXI_V_CTRL   = 10'h128,
    ADDR_INPUT_35_AXI_V_DATA_0 = 10'h12c,
    ADDR_INPUT_36_AXI_V_CTRL   = 10'h130,
    ADDR_INPUT_36_AXI_V_DATA_0 = 10'h134,
    ADDR_INPUT_37_AXI_V_CTRL   = 10'h138,
    ADDR_INPUT_37_AXI_V_DATA_0 = 10'h13c,
    ADDR_INPUT_38_AXI_V_CTRL   = 10'h140,
    ADDR_INPUT_38_AXI_V_DATA_0 = 10'h144,
    ADDR_INPUT_39_AXI_V_CTRL   = 10'h148,
    ADDR_INPUT_39_AXI_V_DATA_0 = 10'h14c,
    ADDR_INPUT_40_AXI_V_CTRL   = 10'h150,
    ADDR_INPUT_40_AXI_V_DATA_0 = 10'h154,
    ADDR_INPUT_41_AXI_V_CTRL   = 10'h158,
    ADDR_INPUT_41_AXI_V_DATA_0 = 10'h15c,
    ADDR_INPUT_42_AXI_V_CTRL   = 10'h160,
    ADDR_INPUT_42_AXI_V_DATA_0 = 10'h164,
    ADDR_INPUT_43_AXI_V_CTRL   = 10'h168,
    ADDR_INPUT_43_AXI_V_DATA_0 = 10'h16c,
    ADDR_INPUT_44_AXI_V_CTRL   = 10'h170,
    ADDR_INPUT_44_AXI_V_DATA_0 = 10'h174,
    ADDR_INPUT_45_AXI_V_CTRL   = 10'h178,
    ADDR_INPUT_45_AXI_V_DATA_0 = 10'h17c,
    ADDR_INPUT_46_AXI_V_CTRL   = 10'h180,
    ADDR_INPUT_46_AXI_V_DATA_0 = 10'h184,
    ADDR_INPUT_47_AXI_V_CTRL   = 10'h188,
    ADDR_INPUT_47_AXI_V_DATA_0 = 10'h18c,
    ADDR_INPUT_48_AXI_V_CTRL   = 10'h190,
    ADDR_INPUT_48_AXI_V_DATA_0 = 10'h194,
    ADDR_INPUT_49_AXI_V_CTRL   = 10'h198,
    ADDR_INPUT_49_AXI_V_DATA_0 = 10'h19c,
    ADDR_INPUT_50_AXI_V_CTRL   = 10'h1a0,
    ADDR_INPUT_50_AXI_V_DATA_0 = 10'h1a4,
    ADDR_INPUT_51_AXI_V_CTRL   = 10'h1a8,
    ADDR_INPUT_51_AXI_V_DATA_0 = 10'h1ac,
    ADDR_INPUT_52_AXI_V_CTRL   = 10'h1b0,
    ADDR_INPUT_52_AXI_V_DATA_0 = 10'h1b4,
    ADDR_INPUT_53_AXI_V_CTRL   = 10'h1b8,
    ADDR_INPUT_53_AXI_V_DATA_0 = 10'h1bc,
    ADDR_INPUT_54_AXI_V_CTRL   = 10'h1c0,
    ADDR_INPUT_54_AXI_V_DATA_0 = 10'h1c4,
    ADDR_INPUT_55_AXI_V_CTRL   = 10'h1c8,
    ADDR_INPUT_55_AXI_V_DATA_0 = 10'h1cc,
    ADDR_INPUT_56_AXI_V_CTRL   = 10'h1d0,
    ADDR_INPUT_56_AXI_V_DATA_0 = 10'h1d4,
    ADDR_INPUT_57_AXI_V_CTRL   = 10'h1d8,
    ADDR_INPUT_57_AXI_V_DATA_0 = 10'h1dc,
    ADDR_INPUT_58_AXI_V_CTRL   = 10'h1e0,
    ADDR_INPUT_58_AXI_V_DATA_0 = 10'h1e4,
    ADDR_INPUT_59_AXI_V_CTRL   = 10'h1e8,
    ADDR_INPUT_59_AXI_V_DATA_0 = 10'h1ec,
    ADDR_INPUT_60_AXI_V_CTRL   = 10'h1f0,
    ADDR_INPUT_60_AXI_V_DATA_0 = 10'h1f4,
    ADDR_INPUT_61_AXI_V_CTRL   = 10'h1f8,
    ADDR_INPUT_61_AXI_V_DATA_0 = 10'h1fc,
    ADDR_INPUT_62_AXI_V_CTRL   = 10'h200,
    ADDR_INPUT_62_AXI_V_DATA_0 = 10'h204,
    ADDR_INPUT_63_AXI_V_CTRL   = 10'h208,
    ADDR_INPUT_63_AXI_V_DATA_0 = 10'h20c;

// axi write fsm
localparam
    WRIDLE = 2'd0,
    WRDATA = 2'd1,
    WRRESP = 2'd2;

// axi read fsm
localparam
    RDIDLE = 2'd0,
    RDDATA = 2'd1;

//------------------------Local signal-------------------
// axi write
reg  [1:0]           wstate;
reg  [1:0]           wnext;
reg  [ADDR_BITS-1:0] waddr;
wire [31:0]          wmask;
wire                 aw_hs;
wire                 w_hs;
// axi read
reg  [1:0]           rstate;
reg  [1:0]           rnext;
reg  [31:0]          rdata;
wire                 ar_hs;
wire [ADDR_BITS-1:0] raddr;
// internal registers
reg  [31:0]          _input_0_axi_V;
reg  [15:0]          _input_1_axi_V;
reg  [15:0]          _input_2_axi_V;
reg  [23:0]          _input_3_axi_V;
reg  [31:0]          _input_4_axi_V;
reg  [15:0]          _input_5_axi_V;
reg  [15:0]          _input_6_axi_V;
reg  [23:0]          _input_7_axi_V;
reg  [31:0]          _input_8_axi_V;
reg  [15:0]          _input_9_axi_V;
reg  [15:0]          _input_10_axi_V;
reg  [23:0]          _input_11_axi_V;
reg  [31:0]          _input_12_axi_V;
reg  [15:0]          _input_13_axi_V;
reg  [15:0]          _input_14_axi_V;
reg  [23:0]          _input_15_axi_V;
reg  [31:0]          _input_16_axi_V;
reg  [15:0]          _input_17_axi_V;
reg  [15:0]          _input_18_axi_V;
reg  [23:0]          _input_19_axi_V;
reg  [31:0]          _input_20_axi_V;
reg  [15:0]          _input_21_axi_V;
reg  [15:0]          _input_22_axi_V;
reg  [23:0]          _input_23_axi_V;
reg  [31:0]          _input_24_axi_V;
reg  [15:0]          _input_25_axi_V;
reg  [15:0]          _input_26_axi_V;
reg  [23:0]          _input_27_axi_V;
reg  [31:0]          _input_28_axi_V;
reg  [15:0]          _input_29_axi_V;
reg  [15:0]          _input_30_axi_V;
reg  [23:0]          _input_31_axi_V;
reg  [31:0]          _input_32_axi_V;
reg  [15:0]          _input_33_axi_V;
reg  [15:0]          _input_34_axi_V;
reg  [23:0]          _input_35_axi_V;
reg  [31:0]          _input_36_axi_V;
reg  [15:0]          _input_37_axi_V;
reg  [15:0]          _input_38_axi_V;
reg  [23:0]          _input_39_axi_V;
reg  [31:0]          _input_40_axi_V;
reg  [15:0]          _input_41_axi_V;
reg  [15:0]          _input_42_axi_V;
reg  [23:0]          _input_43_axi_V;
reg  [31:0]          _input_44_axi_V;
reg  [15:0]          _input_45_axi_V;
reg  [15:0]          _input_46_axi_V;
reg  [23:0]          _input_47_axi_V;
reg  [31:0]          _input_48_axi_V;
reg  [15:0]          _input_49_axi_V;
reg  [15:0]          _input_50_axi_V;
reg  [23:0]          _input_51_axi_V;
reg  [31:0]          _input_52_axi_V;
reg  [15:0]          _input_53_axi_V;
reg  [15:0]          _input_54_axi_V;
reg  [23:0]          _input_55_axi_V;
reg  [31:0]          _input_56_axi_V;
reg  [15:0]          _input_57_axi_V;
reg  [15:0]          _input_58_axi_V;
reg  [23:0]          _input_59_axi_V;
reg  [31:0]          _input_60_axi_V;
reg  [15:0]          _input_61_axi_V;
reg  [15:0]          _input_62_axi_V;
reg  [23:0]          _input_63_axi_V;

//------------------------Body---------------------------
//++++++++++++++++++++++++axi write++++++++++++++++++++++
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA);
assign BRESP   = 2'b00;  // OKAY
assign BVALID  = (wstate == WRRESP);
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK) begin
    if (~ARESETN)
        wstate <= WRIDLE;
    else
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (WVALID)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (aw_hs)
        waddr <= AWADDR[ADDR_BITS-1:0];
end
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++axi read+++++++++++++++++++++++
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA);
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK) begin
    if (~ARESETN)
        rstate <= RDIDLE;
    else
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK) begin
    if (ar_hs) begin
        rdata <= 1'b0;
        case (raddr)
            ADDR_INPUT_0_AXI_V_DATA_0: begin
                rdata <= _input_0_axi_V[31:0];
            end
            ADDR_INPUT_1_AXI_V_DATA_0: begin
                rdata <= _input_1_axi_V[15:0];
            end
            ADDR_INPUT_2_AXI_V_DATA_0: begin
                rdata <= _input_2_axi_V[15:0];
            end
            ADDR_INPUT_3_AXI_V_DATA_0: begin
                rdata <= _input_3_axi_V[23:0];
            end
            ADDR_INPUT_4_AXI_V_DATA_0: begin
                rdata <= _input_4_axi_V[31:0];
            end
            ADDR_INPUT_5_AXI_V_DATA_0: begin
                rdata <= _input_5_axi_V[15:0];
            end
            ADDR_INPUT_6_AXI_V_DATA_0: begin
                rdata <= _input_6_axi_V[15:0];
            end
            ADDR_INPUT_7_AXI_V_DATA_0: begin
                rdata <= _input_7_axi_V[23:0];
            end
            ADDR_INPUT_8_AXI_V_DATA_0: begin
                rdata <= _input_8_axi_V[31:0];
            end
            ADDR_INPUT_9_AXI_V_DATA_0: begin
                rdata <= _input_9_axi_V[15:0];
            end
            ADDR_INPUT_10_AXI_V_DATA_0: begin
                rdata <= _input_10_axi_V[15:0];
            end
            ADDR_INPUT_11_AXI_V_DATA_0: begin
                rdata <= _input_11_axi_V[23:0];
            end
            ADDR_INPUT_12_AXI_V_DATA_0: begin
                rdata <= _input_12_axi_V[31:0];
            end
            ADDR_INPUT_13_AXI_V_DATA_0: begin
                rdata <= _input_13_axi_V[15:0];
            end
            ADDR_INPUT_14_AXI_V_DATA_0: begin
                rdata <= _input_14_axi_V[15:0];
            end
            ADDR_INPUT_15_AXI_V_DATA_0: begin
                rdata <= _input_15_axi_V[23:0];
            end
            ADDR_INPUT_16_AXI_V_DATA_0: begin
                rdata <= _input_16_axi_V[31:0];
            end
            ADDR_INPUT_17_AXI_V_DATA_0: begin
                rdata <= _input_17_axi_V[15:0];
            end
            ADDR_INPUT_18_AXI_V_DATA_0: begin
                rdata <= _input_18_axi_V[15:0];
            end
            ADDR_INPUT_19_AXI_V_DATA_0: begin
                rdata <= _input_19_axi_V[23:0];
            end
            ADDR_INPUT_20_AXI_V_DATA_0: begin
                rdata <= _input_20_axi_V[31:0];
            end
            ADDR_INPUT_21_AXI_V_DATA_0: begin
                rdata <= _input_21_axi_V[15:0];
            end
            ADDR_INPUT_22_AXI_V_DATA_0: begin
                rdata <= _input_22_axi_V[15:0];
            end
            ADDR_INPUT_23_AXI_V_DATA_0: begin
                rdata <= _input_23_axi_V[23:0];
            end
            ADDR_INPUT_24_AXI_V_DATA_0: begin
                rdata <= _input_24_axi_V[31:0];
            end
            ADDR_INPUT_25_AXI_V_DATA_0: begin
                rdata <= _input_25_axi_V[15:0];
            end
            ADDR_INPUT_26_AXI_V_DATA_0: begin
                rdata <= _input_26_axi_V[15:0];
            end
            ADDR_INPUT_27_AXI_V_DATA_0: begin
                rdata <= _input_27_axi_V[23:0];
            end
            ADDR_INPUT_28_AXI_V_DATA_0: begin
                rdata <= _input_28_axi_V[31:0];
            end
            ADDR_INPUT_29_AXI_V_DATA_0: begin
                rdata <= _input_29_axi_V[15:0];
            end
            ADDR_INPUT_30_AXI_V_DATA_0: begin
                rdata <= _input_30_axi_V[15:0];
            end
            ADDR_INPUT_31_AXI_V_DATA_0: begin
                rdata <= _input_31_axi_V[23:0];
            end
            ADDR_INPUT_32_AXI_V_DATA_0: begin
                rdata <= _input_32_axi_V[31:0];
            end
            ADDR_INPUT_33_AXI_V_DATA_0: begin
                rdata <= _input_33_axi_V[15:0];
            end
            ADDR_INPUT_34_AXI_V_DATA_0: begin
                rdata <= _input_34_axi_V[15:0];
            end
            ADDR_INPUT_35_AXI_V_DATA_0: begin
                rdata <= _input_35_axi_V[23:0];
            end
            ADDR_INPUT_36_AXI_V_DATA_0: begin
                rdata <= _input_36_axi_V[31:0];
            end
            ADDR_INPUT_37_AXI_V_DATA_0: begin
                rdata <= _input_37_axi_V[15:0];
            end
            ADDR_INPUT_38_AXI_V_DATA_0: begin
                rdata <= _input_38_axi_V[15:0];
            end
            ADDR_INPUT_39_AXI_V_DATA_0: begin
                rdata <= _input_39_axi_V[23:0];
            end
            ADDR_INPUT_40_AXI_V_DATA_0: begin
                rdata <= _input_40_axi_V[31:0];
            end
            ADDR_INPUT_41_AXI_V_DATA_0: begin
                rdata <= _input_41_axi_V[15:0];
            end
            ADDR_INPUT_42_AXI_V_DATA_0: begin
                rdata <= _input_42_axi_V[15:0];
            end
            ADDR_INPUT_43_AXI_V_DATA_0: begin
                rdata <= _input_43_axi_V[23:0];
            end
            ADDR_INPUT_44_AXI_V_DATA_0: begin
                rdata <= _input_44_axi_V[31:0];
            end
            ADDR_INPUT_45_AXI_V_DATA_0: begin
                rdata <= _input_45_axi_V[15:0];
            end
            ADDR_INPUT_46_AXI_V_DATA_0: begin
                rdata <= _input_46_axi_V[15:0];
            end
            ADDR_INPUT_47_AXI_V_DATA_0: begin
                rdata <= _input_47_axi_V[23:0];
            end
            ADDR_INPUT_48_AXI_V_DATA_0: begin
                rdata <= _input_48_axi_V[31:0];
            end
            ADDR_INPUT_49_AXI_V_DATA_0: begin
                rdata <= _input_49_axi_V[15:0];
            end
            ADDR_INPUT_50_AXI_V_DATA_0: begin
                rdata <= _input_50_axi_V[15:0];
            end
            ADDR_INPUT_51_AXI_V_DATA_0: begin
                rdata <= _input_51_axi_V[23:0];
            end
            ADDR_INPUT_52_AXI_V_DATA_0: begin
                rdata <= _input_52_axi_V[31:0];
            end
            ADDR_INPUT_53_AXI_V_DATA_0: begin
                rdata <= _input_53_axi_V[15:0];
            end
            ADDR_INPUT_54_AXI_V_DATA_0: begin
                rdata <= _input_54_axi_V[15:0];
            end
            ADDR_INPUT_55_AXI_V_DATA_0: begin
                rdata <= _input_55_axi_V[23:0];
            end
            ADDR_INPUT_56_AXI_V_DATA_0: begin
                rdata <= _input_56_axi_V[31:0];
            end
            ADDR_INPUT_57_AXI_V_DATA_0: begin
                rdata <= _input_57_axi_V[15:0];
            end
            ADDR_INPUT_58_AXI_V_DATA_0: begin
                rdata <= _input_58_axi_V[15:0];
            end
            ADDR_INPUT_59_AXI_V_DATA_0: begin
                rdata <= _input_59_axi_V[23:0];
            end
            ADDR_INPUT_60_AXI_V_DATA_0: begin
                rdata <= _input_60_axi_V[31:0];
            end
            ADDR_INPUT_61_AXI_V_DATA_0: begin
                rdata <= _input_61_axi_V[15:0];
            end
            ADDR_INPUT_62_AXI_V_DATA_0: begin
                rdata <= _input_62_axi_V[15:0];
            end
            ADDR_INPUT_63_AXI_V_DATA_0: begin
                rdata <= _input_63_axi_V[23:0];
            end
        endcase
    end
end
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++internal registers+++++++++++++
assign I_input_0_axi_V  = _input_0_axi_V;
assign I_input_1_axi_V  = _input_1_axi_V;
assign I_input_2_axi_V  = _input_2_axi_V;
assign I_input_3_axi_V  = _input_3_axi_V;
assign I_input_4_axi_V  = _input_4_axi_V;
assign I_input_5_axi_V  = _input_5_axi_V;
assign I_input_6_axi_V  = _input_6_axi_V;
assign I_input_7_axi_V  = _input_7_axi_V;
assign I_input_8_axi_V  = _input_8_axi_V;
assign I_input_9_axi_V  = _input_9_axi_V;
assign I_input_10_axi_V = _input_10_axi_V;
assign I_input_11_axi_V = _input_11_axi_V;
assign I_input_12_axi_V = _input_12_axi_V;
assign I_input_13_axi_V = _input_13_axi_V;
assign I_input_14_axi_V = _input_14_axi_V;
assign I_input_15_axi_V = _input_15_axi_V;
assign I_input_16_axi_V = _input_16_axi_V;
assign I_input_17_axi_V = _input_17_axi_V;
assign I_input_18_axi_V = _input_18_axi_V;
assign I_input_19_axi_V = _input_19_axi_V;
assign I_input_20_axi_V = _input_20_axi_V;
assign I_input_21_axi_V = _input_21_axi_V;
assign I_input_22_axi_V = _input_22_axi_V;
assign I_input_23_axi_V = _input_23_axi_V;
assign I_input_24_axi_V = _input_24_axi_V;
assign I_input_25_axi_V = _input_25_axi_V;
assign I_input_26_axi_V = _input_26_axi_V;
assign I_input_27_axi_V = _input_27_axi_V;
assign I_input_28_axi_V = _input_28_axi_V;
assign I_input_29_axi_V = _input_29_axi_V;
assign I_input_30_axi_V = _input_30_axi_V;
assign I_input_31_axi_V = _input_31_axi_V;
assign I_input_32_axi_V = _input_32_axi_V;
assign I_input_33_axi_V = _input_33_axi_V;
assign I_input_34_axi_V = _input_34_axi_V;
assign I_input_35_axi_V = _input_35_axi_V;
assign I_input_36_axi_V = _input_36_axi_V;
assign I_input_37_axi_V = _input_37_axi_V;
assign I_input_38_axi_V = _input_38_axi_V;
assign I_input_39_axi_V = _input_39_axi_V;
assign I_input_40_axi_V = _input_40_axi_V;
assign I_input_41_axi_V = _input_41_axi_V;
assign I_input_42_axi_V = _input_42_axi_V;
assign I_input_43_axi_V = _input_43_axi_V;
assign I_input_44_axi_V = _input_44_axi_V;
assign I_input_45_axi_V = _input_45_axi_V;
assign I_input_46_axi_V = _input_46_axi_V;
assign I_input_47_axi_V = _input_47_axi_V;
assign I_input_48_axi_V = _input_48_axi_V;
assign I_input_49_axi_V = _input_49_axi_V;
assign I_input_50_axi_V = _input_50_axi_V;
assign I_input_51_axi_V = _input_51_axi_V;
assign I_input_52_axi_V = _input_52_axi_V;
assign I_input_53_axi_V = _input_53_axi_V;
assign I_input_54_axi_V = _input_54_axi_V;
assign I_input_55_axi_V = _input_55_axi_V;
assign I_input_56_axi_V = _input_56_axi_V;
assign I_input_57_axi_V = _input_57_axi_V;
assign I_input_58_axi_V = _input_58_axi_V;
assign I_input_59_axi_V = _input_59_axi_V;
assign I_input_60_axi_V = _input_60_axi_V;
assign I_input_61_axi_V = _input_61_axi_V;
assign I_input_62_axi_V = _input_62_axi_V;
assign I_input_63_axi_V = _input_63_axi_V;

// _input_0_axi_V[31:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_0_AXI_V_DATA_0)
        _input_0_axi_V[31:0] <= (WDATA[31:0] & wmask) | (_input_0_axi_V[31:0] & ~wmask);
end

// _input_1_axi_V[15:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_1_AXI_V_DATA_0)
        _input_1_axi_V[15:0] <= (WDATA[31:0] & wmask) | (_input_1_axi_V[15:0] & ~wmask);
end

// _input_2_axi_V[15:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_2_AXI_V_DATA_0)
        _input_2_axi_V[15:0] <= (WDATA[31:0] & wmask) | (_input_2_axi_V[15:0] & ~wmask);
end

// _input_3_axi_V[23:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_3_AXI_V_DATA_0)
        _input_3_axi_V[23:0] <= (WDATA[31:0] & wmask) | (_input_3_axi_V[23:0] & ~wmask);
end

// _input_4_axi_V[31:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_4_AXI_V_DATA_0)
        _input_4_axi_V[31:0] <= (WDATA[31:0] & wmask) | (_input_4_axi_V[31:0] & ~wmask);
end

// _input_5_axi_V[15:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_5_AXI_V_DATA_0)
        _input_5_axi_V[15:0] <= (WDATA[31:0] & wmask) | (_input_5_axi_V[15:0] & ~wmask);
end

// _input_6_axi_V[15:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_6_AXI_V_DATA_0)
        _input_6_axi_V[15:0] <= (WDATA[31:0] & wmask) | (_input_6_axi_V[15:0] & ~wmask);
end

// _input_7_axi_V[23:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_7_AXI_V_DATA_0)
        _input_7_axi_V[23:0] <= (WDATA[31:0] & wmask) | (_input_7_axi_V[23:0] & ~wmask);
end

// _input_8_axi_V[31:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_8_AXI_V_DATA_0)
        _input_8_axi_V[31:0] <= (WDATA[31:0] & wmask) | (_input_8_axi_V[31:0] & ~wmask);
end

// _input_9_axi_V[15:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_9_AXI_V_DATA_0)
        _input_9_axi_V[15:0] <= (WDATA[31:0] & wmask) | (_input_9_axi_V[15:0] & ~wmask);
end

// _input_10_axi_V[15:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_10_AXI_V_DATA_0)
        _input_10_axi_V[15:0] <= (WDATA[31:0] & wmask) | (_input_10_axi_V[15:0] & ~wmask);
end

// _input_11_axi_V[23:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_11_AXI_V_DATA_0)
        _input_11_axi_V[23:0] <= (WDATA[31:0] & wmask) | (_input_11_axi_V[23:0] & ~wmask);
end

// _input_12_axi_V[31:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_12_AXI_V_DATA_0)
        _input_12_axi_V[31:0] <= (WDATA[31:0] & wmask) | (_input_12_axi_V[31:0] & ~wmask);
end

// _input_13_axi_V[15:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_13_AXI_V_DATA_0)
        _input_13_axi_V[15:0] <= (WDATA[31:0] & wmask) | (_input_13_axi_V[15:0] & ~wmask);
end

// _input_14_axi_V[15:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_14_AXI_V_DATA_0)
        _input_14_axi_V[15:0] <= (WDATA[31:0] & wmask) | (_input_14_axi_V[15:0] & ~wmask);
end

// _input_15_axi_V[23:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_15_AXI_V_DATA_0)
        _input_15_axi_V[23:0] <= (WDATA[31:0] & wmask) | (_input_15_axi_V[23:0] & ~wmask);
end

// _input_16_axi_V[31:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_16_AXI_V_DATA_0)
        _input_16_axi_V[31:0] <= (WDATA[31:0] & wmask) | (_input_16_axi_V[31:0] & ~wmask);
end

// _input_17_axi_V[15:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_17_AXI_V_DATA_0)
        _input_17_axi_V[15:0] <= (WDATA[31:0] & wmask) | (_input_17_axi_V[15:0] & ~wmask);
end

// _input_18_axi_V[15:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_18_AXI_V_DATA_0)
        _input_18_axi_V[15:0] <= (WDATA[31:0] & wmask) | (_input_18_axi_V[15:0] & ~wmask);
end

// _input_19_axi_V[23:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_19_AXI_V_DATA_0)
        _input_19_axi_V[23:0] <= (WDATA[31:0] & wmask) | (_input_19_axi_V[23:0] & ~wmask);
end

// _input_20_axi_V[31:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_20_AXI_V_DATA_0)
        _input_20_axi_V[31:0] <= (WDATA[31:0] & wmask) | (_input_20_axi_V[31:0] & ~wmask);
end

// _input_21_axi_V[15:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_21_AXI_V_DATA_0)
        _input_21_axi_V[15:0] <= (WDATA[31:0] & wmask) | (_input_21_axi_V[15:0] & ~wmask);
end

// _input_22_axi_V[15:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_22_AXI_V_DATA_0)
        _input_22_axi_V[15:0] <= (WDATA[31:0] & wmask) | (_input_22_axi_V[15:0] & ~wmask);
end

// _input_23_axi_V[23:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_23_AXI_V_DATA_0)
        _input_23_axi_V[23:0] <= (WDATA[31:0] & wmask) | (_input_23_axi_V[23:0] & ~wmask);
end

// _input_24_axi_V[31:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_24_AXI_V_DATA_0)
        _input_24_axi_V[31:0] <= (WDATA[31:0] & wmask) | (_input_24_axi_V[31:0] & ~wmask);
end

// _input_25_axi_V[15:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_25_AXI_V_DATA_0)
        _input_25_axi_V[15:0] <= (WDATA[31:0] & wmask) | (_input_25_axi_V[15:0] & ~wmask);
end

// _input_26_axi_V[15:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_26_AXI_V_DATA_0)
        _input_26_axi_V[15:0] <= (WDATA[31:0] & wmask) | (_input_26_axi_V[15:0] & ~wmask);
end

// _input_27_axi_V[23:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_27_AXI_V_DATA_0)
        _input_27_axi_V[23:0] <= (WDATA[31:0] & wmask) | (_input_27_axi_V[23:0] & ~wmask);
end

// _input_28_axi_V[31:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_28_AXI_V_DATA_0)
        _input_28_axi_V[31:0] <= (WDATA[31:0] & wmask) | (_input_28_axi_V[31:0] & ~wmask);
end

// _input_29_axi_V[15:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_29_AXI_V_DATA_0)
        _input_29_axi_V[15:0] <= (WDATA[31:0] & wmask) | (_input_29_axi_V[15:0] & ~wmask);
end

// _input_30_axi_V[15:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_30_AXI_V_DATA_0)
        _input_30_axi_V[15:0] <= (WDATA[31:0] & wmask) | (_input_30_axi_V[15:0] & ~wmask);
end

// _input_31_axi_V[23:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_31_AXI_V_DATA_0)
        _input_31_axi_V[23:0] <= (WDATA[31:0] & wmask) | (_input_31_axi_V[23:0] & ~wmask);
end

// _input_32_axi_V[31:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_32_AXI_V_DATA_0)
        _input_32_axi_V[31:0] <= (WDATA[31:0] & wmask) | (_input_32_axi_V[31:0] & ~wmask);
end

// _input_33_axi_V[15:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_33_AXI_V_DATA_0)
        _input_33_axi_V[15:0] <= (WDATA[31:0] & wmask) | (_input_33_axi_V[15:0] & ~wmask);
end

// _input_34_axi_V[15:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_34_AXI_V_DATA_0)
        _input_34_axi_V[15:0] <= (WDATA[31:0] & wmask) | (_input_34_axi_V[15:0] & ~wmask);
end

// _input_35_axi_V[23:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_35_AXI_V_DATA_0)
        _input_35_axi_V[23:0] <= (WDATA[31:0] & wmask) | (_input_35_axi_V[23:0] & ~wmask);
end

// _input_36_axi_V[31:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_36_AXI_V_DATA_0)
        _input_36_axi_V[31:0] <= (WDATA[31:0] & wmask) | (_input_36_axi_V[31:0] & ~wmask);
end

// _input_37_axi_V[15:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_37_AXI_V_DATA_0)
        _input_37_axi_V[15:0] <= (WDATA[31:0] & wmask) | (_input_37_axi_V[15:0] & ~wmask);
end

// _input_38_axi_V[15:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_38_AXI_V_DATA_0)
        _input_38_axi_V[15:0] <= (WDATA[31:0] & wmask) | (_input_38_axi_V[15:0] & ~wmask);
end

// _input_39_axi_V[23:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_39_AXI_V_DATA_0)
        _input_39_axi_V[23:0] <= (WDATA[31:0] & wmask) | (_input_39_axi_V[23:0] & ~wmask);
end

// _input_40_axi_V[31:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_40_AXI_V_DATA_0)
        _input_40_axi_V[31:0] <= (WDATA[31:0] & wmask) | (_input_40_axi_V[31:0] & ~wmask);
end

// _input_41_axi_V[15:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_41_AXI_V_DATA_0)
        _input_41_axi_V[15:0] <= (WDATA[31:0] & wmask) | (_input_41_axi_V[15:0] & ~wmask);
end

// _input_42_axi_V[15:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_42_AXI_V_DATA_0)
        _input_42_axi_V[15:0] <= (WDATA[31:0] & wmask) | (_input_42_axi_V[15:0] & ~wmask);
end

// _input_43_axi_V[23:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_43_AXI_V_DATA_0)
        _input_43_axi_V[23:0] <= (WDATA[31:0] & wmask) | (_input_43_axi_V[23:0] & ~wmask);
end

// _input_44_axi_V[31:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_44_AXI_V_DATA_0)
        _input_44_axi_V[31:0] <= (WDATA[31:0] & wmask) | (_input_44_axi_V[31:0] & ~wmask);
end

// _input_45_axi_V[15:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_45_AXI_V_DATA_0)
        _input_45_axi_V[15:0] <= (WDATA[31:0] & wmask) | (_input_45_axi_V[15:0] & ~wmask);
end

// _input_46_axi_V[15:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_46_AXI_V_DATA_0)
        _input_46_axi_V[15:0] <= (WDATA[31:0] & wmask) | (_input_46_axi_V[15:0] & ~wmask);
end

// _input_47_axi_V[23:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_47_AXI_V_DATA_0)
        _input_47_axi_V[23:0] <= (WDATA[31:0] & wmask) | (_input_47_axi_V[23:0] & ~wmask);
end

// _input_48_axi_V[31:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_48_AXI_V_DATA_0)
        _input_48_axi_V[31:0] <= (WDATA[31:0] & wmask) | (_input_48_axi_V[31:0] & ~wmask);
end

// _input_49_axi_V[15:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_49_AXI_V_DATA_0)
        _input_49_axi_V[15:0] <= (WDATA[31:0] & wmask) | (_input_49_axi_V[15:0] & ~wmask);
end

// _input_50_axi_V[15:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_50_AXI_V_DATA_0)
        _input_50_axi_V[15:0] <= (WDATA[31:0] & wmask) | (_input_50_axi_V[15:0] & ~wmask);
end

// _input_51_axi_V[23:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_51_AXI_V_DATA_0)
        _input_51_axi_V[23:0] <= (WDATA[31:0] & wmask) | (_input_51_axi_V[23:0] & ~wmask);
end

// _input_52_axi_V[31:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_52_AXI_V_DATA_0)
        _input_52_axi_V[31:0] <= (WDATA[31:0] & wmask) | (_input_52_axi_V[31:0] & ~wmask);
end

// _input_53_axi_V[15:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_53_AXI_V_DATA_0)
        _input_53_axi_V[15:0] <= (WDATA[31:0] & wmask) | (_input_53_axi_V[15:0] & ~wmask);
end

// _input_54_axi_V[15:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_54_AXI_V_DATA_0)
        _input_54_axi_V[15:0] <= (WDATA[31:0] & wmask) | (_input_54_axi_V[15:0] & ~wmask);
end

// _input_55_axi_V[23:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_55_AXI_V_DATA_0)
        _input_55_axi_V[23:0] <= (WDATA[31:0] & wmask) | (_input_55_axi_V[23:0] & ~wmask);
end

// _input_56_axi_V[31:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_56_AXI_V_DATA_0)
        _input_56_axi_V[31:0] <= (WDATA[31:0] & wmask) | (_input_56_axi_V[31:0] & ~wmask);
end

// _input_57_axi_V[15:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_57_AXI_V_DATA_0)
        _input_57_axi_V[15:0] <= (WDATA[31:0] & wmask) | (_input_57_axi_V[15:0] & ~wmask);
end

// _input_58_axi_V[15:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_58_AXI_V_DATA_0)
        _input_58_axi_V[15:0] <= (WDATA[31:0] & wmask) | (_input_58_axi_V[15:0] & ~wmask);
end

// _input_59_axi_V[23:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_59_AXI_V_DATA_0)
        _input_59_axi_V[23:0] <= (WDATA[31:0] & wmask) | (_input_59_axi_V[23:0] & ~wmask);
end

// _input_60_axi_V[31:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_60_AXI_V_DATA_0)
        _input_60_axi_V[31:0] <= (WDATA[31:0] & wmask) | (_input_60_axi_V[31:0] & ~wmask);
end

// _input_61_axi_V[15:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_61_AXI_V_DATA_0)
        _input_61_axi_V[15:0] <= (WDATA[31:0] & wmask) | (_input_61_axi_V[15:0] & ~wmask);
end

// _input_62_axi_V[15:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_62_AXI_V_DATA_0)
        _input_62_axi_V[15:0] <= (WDATA[31:0] & wmask) | (_input_62_axi_V[15:0] & ~wmask);
end

// _input_63_axi_V[23:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_INPUT_63_AXI_V_DATA_0)
        _input_63_axi_V[23:0] <= (WDATA[31:0] & wmask) | (_input_63_axi_V[23:0] & ~wmask);
end

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++

endmodule
