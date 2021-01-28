// ==============================================================
// File generated on Wed Jan 27 13:58:24 EST 2021
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:36:41 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1 ns / 1 ps
module gpio_top (
s_axi_BUS_A_AWADDR,
s_axi_BUS_A_AWVALID,
s_axi_BUS_A_AWREADY,
s_axi_BUS_A_WDATA,
s_axi_BUS_A_WSTRB,
s_axi_BUS_A_WVALID,
s_axi_BUS_A_WREADY,
s_axi_BUS_A_BRESP,
s_axi_BUS_A_BVALID,
s_axi_BUS_A_BREADY,
s_axi_BUS_A_ARADDR,
s_axi_BUS_A_ARVALID,
s_axi_BUS_A_ARREADY,
s_axi_BUS_A_RDATA,
s_axi_BUS_A_RRESP,
s_axi_BUS_A_RVALID,
s_axi_BUS_A_RREADY,
aresetn,
aclk,
input_0_V,
input_1_V,
input_2_V,
input_3_V,
input_4_V,
input_5_V,
input_6_V,
input_7_V,
input_8_V,
input_9_V,
input_10_V,
input_11_V,
input_12_V,
input_13_V,
input_14_V,
input_15_V,
input_16_V,
input_17_V,
input_18_V,
input_19_V,
input_20_V,
input_21_V,
input_22_V,
input_23_V,
input_24_V,
input_25_V,
input_26_V,
input_27_V,
input_28_V,
input_29_V,
input_30_V,
input_31_V,
input_32_V,
input_33_V,
input_34_V,
input_35_V,
input_36_V,
input_37_V,
input_38_V,
input_39_V,
input_40_V,
input_41_V,
input_42_V,
input_43_V,
input_44_V,
input_45_V,
input_46_V,
input_47_V,
input_48_V,
input_49_V,
input_50_V,
input_51_V,
input_52_V,
input_53_V,
input_54_V,
input_55_V,
input_56_V,
input_57_V,
input_58_V,
input_59_V,
input_60_V,
input_61_V,
input_62_V,
input_63_V
);

parameter C_S_AXI_BUS_A_ADDR_WIDTH = 10;
parameter C_S_AXI_BUS_A_DATA_WIDTH = 32;
parameter RESET_ACTIVE_LOW = 1;

input [C_S_AXI_BUS_A_ADDR_WIDTH - 1:0] s_axi_BUS_A_AWADDR ;
input s_axi_BUS_A_AWVALID ;
output s_axi_BUS_A_AWREADY ;
input [C_S_AXI_BUS_A_DATA_WIDTH - 1:0] s_axi_BUS_A_WDATA ;
input [C_S_AXI_BUS_A_DATA_WIDTH/8 - 1:0] s_axi_BUS_A_WSTRB ;
input s_axi_BUS_A_WVALID ;
output s_axi_BUS_A_WREADY ;
output [2 - 1:0] s_axi_BUS_A_BRESP ;
output s_axi_BUS_A_BVALID ;
input s_axi_BUS_A_BREADY ;
input [C_S_AXI_BUS_A_ADDR_WIDTH - 1:0] s_axi_BUS_A_ARADDR ;
input s_axi_BUS_A_ARVALID ;
output s_axi_BUS_A_ARREADY ;
output [C_S_AXI_BUS_A_DATA_WIDTH - 1:0] s_axi_BUS_A_RDATA ;
output [2 - 1:0] s_axi_BUS_A_RRESP ;
output s_axi_BUS_A_RVALID ;
input s_axi_BUS_A_RREADY ;

input aresetn ;

input aclk ;

output [32 - 1:0] input_0_V ;
output [16 - 1:0] input_1_V ;
output [16 - 1:0] input_2_V ;
output [24 - 1:0] input_3_V ;
output [32 - 1:0] input_4_V ;
output [16 - 1:0] input_5_V ;
output [16 - 1:0] input_6_V ;
output [24 - 1:0] input_7_V ;
output [32 - 1:0] input_8_V ;
output [16 - 1:0] input_9_V ;
output [16 - 1:0] input_10_V ;
output [24 - 1:0] input_11_V ;
output [32 - 1:0] input_12_V ;
output [16 - 1:0] input_13_V ;
output [16 - 1:0] input_14_V ;
output [24 - 1:0] input_15_V ;
output [32 - 1:0] input_16_V ;
output [16 - 1:0] input_17_V ;
output [16 - 1:0] input_18_V ;
output [24 - 1:0] input_19_V ;
output [32 - 1:0] input_20_V ;
output [16 - 1:0] input_21_V ;
output [16 - 1:0] input_22_V ;
output [24 - 1:0] input_23_V ;
output [32 - 1:0] input_24_V ;
output [16 - 1:0] input_25_V ;
output [16 - 1:0] input_26_V ;
output [24 - 1:0] input_27_V ;
output [32 - 1:0] input_28_V ;
output [16 - 1:0] input_29_V ;
output [16 - 1:0] input_30_V ;
output [24 - 1:0] input_31_V ;
output [32 - 1:0] input_32_V ;
output [16 - 1:0] input_33_V ;
output [16 - 1:0] input_34_V ;
output [24 - 1:0] input_35_V ;
output [32 - 1:0] input_36_V ;
output [16 - 1:0] input_37_V ;
output [16 - 1:0] input_38_V ;
output [24 - 1:0] input_39_V ;
output [32 - 1:0] input_40_V ;
output [16 - 1:0] input_41_V ;
output [16 - 1:0] input_42_V ;
output [24 - 1:0] input_43_V ;
output [32 - 1:0] input_44_V ;
output [16 - 1:0] input_45_V ;
output [16 - 1:0] input_46_V ;
output [24 - 1:0] input_47_V ;
output [32 - 1:0] input_48_V ;
output [16 - 1:0] input_49_V ;
output [16 - 1:0] input_50_V ;
output [24 - 1:0] input_51_V ;
output [32 - 1:0] input_52_V ;
output [16 - 1:0] input_53_V ;
output [16 - 1:0] input_54_V ;
output [24 - 1:0] input_55_V ;
output [32 - 1:0] input_56_V ;
output [16 - 1:0] input_57_V ;
output [16 - 1:0] input_58_V ;
output [24 - 1:0] input_59_V ;
output [32 - 1:0] input_60_V ;
output [16 - 1:0] input_61_V ;
output [16 - 1:0] input_62_V ;
output [24 - 1:0] input_63_V ;


wire [C_S_AXI_BUS_A_ADDR_WIDTH - 1:0] s_axi_BUS_A_AWADDR;
wire s_axi_BUS_A_AWVALID;
wire s_axi_BUS_A_AWREADY;
wire [C_S_AXI_BUS_A_DATA_WIDTH - 1:0] s_axi_BUS_A_WDATA;
wire [C_S_AXI_BUS_A_DATA_WIDTH/8 - 1:0] s_axi_BUS_A_WSTRB;
wire s_axi_BUS_A_WVALID;
wire s_axi_BUS_A_WREADY;
wire [2 - 1:0] s_axi_BUS_A_BRESP;
wire s_axi_BUS_A_BVALID;
wire s_axi_BUS_A_BREADY;
wire [C_S_AXI_BUS_A_ADDR_WIDTH - 1:0] s_axi_BUS_A_ARADDR;
wire s_axi_BUS_A_ARVALID;
wire s_axi_BUS_A_ARREADY;
wire [C_S_AXI_BUS_A_DATA_WIDTH - 1:0] s_axi_BUS_A_RDATA;
wire [2 - 1:0] s_axi_BUS_A_RRESP;
wire s_axi_BUS_A_RVALID;
wire s_axi_BUS_A_RREADY;

wire aresetn;


wire [32 - 1:0] sig_gpio_input_0_axi_V;
wire [16 - 1:0] sig_gpio_input_1_axi_V;
wire [16 - 1:0] sig_gpio_input_2_axi_V;
wire [24 - 1:0] sig_gpio_input_3_axi_V;
wire [32 - 1:0] sig_gpio_input_4_axi_V;
wire [16 - 1:0] sig_gpio_input_5_axi_V;
wire [16 - 1:0] sig_gpio_input_6_axi_V;
wire [24 - 1:0] sig_gpio_input_7_axi_V;
wire [32 - 1:0] sig_gpio_input_8_axi_V;
wire [16 - 1:0] sig_gpio_input_9_axi_V;
wire [16 - 1:0] sig_gpio_input_10_axi_V;
wire [24 - 1:0] sig_gpio_input_11_axi_V;
wire [32 - 1:0] sig_gpio_input_12_axi_V;
wire [16 - 1:0] sig_gpio_input_13_axi_V;
wire [16 - 1:0] sig_gpio_input_14_axi_V;
wire [24 - 1:0] sig_gpio_input_15_axi_V;
wire [32 - 1:0] sig_gpio_input_16_axi_V;
wire [16 - 1:0] sig_gpio_input_17_axi_V;
wire [16 - 1:0] sig_gpio_input_18_axi_V;
wire [24 - 1:0] sig_gpio_input_19_axi_V;
wire [32 - 1:0] sig_gpio_input_20_axi_V;
wire [16 - 1:0] sig_gpio_input_21_axi_V;
wire [16 - 1:0] sig_gpio_input_22_axi_V;
wire [24 - 1:0] sig_gpio_input_23_axi_V;
wire [32 - 1:0] sig_gpio_input_24_axi_V;
wire [16 - 1:0] sig_gpio_input_25_axi_V;
wire [16 - 1:0] sig_gpio_input_26_axi_V;
wire [24 - 1:0] sig_gpio_input_27_axi_V;
wire [32 - 1:0] sig_gpio_input_28_axi_V;
wire [16 - 1:0] sig_gpio_input_29_axi_V;
wire [16 - 1:0] sig_gpio_input_30_axi_V;
wire [24 - 1:0] sig_gpio_input_31_axi_V;
wire [32 - 1:0] sig_gpio_input_32_axi_V;
wire [16 - 1:0] sig_gpio_input_33_axi_V;
wire [16 - 1:0] sig_gpio_input_34_axi_V;
wire [24 - 1:0] sig_gpio_input_35_axi_V;
wire [32 - 1:0] sig_gpio_input_36_axi_V;
wire [16 - 1:0] sig_gpio_input_37_axi_V;
wire [16 - 1:0] sig_gpio_input_38_axi_V;
wire [24 - 1:0] sig_gpio_input_39_axi_V;
wire [32 - 1:0] sig_gpio_input_40_axi_V;
wire [16 - 1:0] sig_gpio_input_41_axi_V;
wire [16 - 1:0] sig_gpio_input_42_axi_V;
wire [24 - 1:0] sig_gpio_input_43_axi_V;
wire [32 - 1:0] sig_gpio_input_44_axi_V;
wire [16 - 1:0] sig_gpio_input_45_axi_V;
wire [16 - 1:0] sig_gpio_input_46_axi_V;
wire [24 - 1:0] sig_gpio_input_47_axi_V;
wire [32 - 1:0] sig_gpio_input_48_axi_V;
wire [16 - 1:0] sig_gpio_input_49_axi_V;
wire [16 - 1:0] sig_gpio_input_50_axi_V;
wire [24 - 1:0] sig_gpio_input_51_axi_V;
wire [32 - 1:0] sig_gpio_input_52_axi_V;
wire [16 - 1:0] sig_gpio_input_53_axi_V;
wire [16 - 1:0] sig_gpio_input_54_axi_V;
wire [24 - 1:0] sig_gpio_input_55_axi_V;
wire [32 - 1:0] sig_gpio_input_56_axi_V;
wire [16 - 1:0] sig_gpio_input_57_axi_V;
wire [16 - 1:0] sig_gpio_input_58_axi_V;
wire [24 - 1:0] sig_gpio_input_59_axi_V;
wire [32 - 1:0] sig_gpio_input_60_axi_V;
wire [16 - 1:0] sig_gpio_input_61_axi_V;
wire [16 - 1:0] sig_gpio_input_62_axi_V;
wire [24 - 1:0] sig_gpio_input_63_axi_V;

wire sig_gpio_ap_rst_n;



gpio gpio_U(
    .input_0_axi_V(sig_gpio_input_0_axi_V),
    .input_1_axi_V(sig_gpio_input_1_axi_V),
    .input_2_axi_V(sig_gpio_input_2_axi_V),
    .input_3_axi_V(sig_gpio_input_3_axi_V),
    .input_4_axi_V(sig_gpio_input_4_axi_V),
    .input_5_axi_V(sig_gpio_input_5_axi_V),
    .input_6_axi_V(sig_gpio_input_6_axi_V),
    .input_7_axi_V(sig_gpio_input_7_axi_V),
    .input_8_axi_V(sig_gpio_input_8_axi_V),
    .input_9_axi_V(sig_gpio_input_9_axi_V),
    .input_10_axi_V(sig_gpio_input_10_axi_V),
    .input_11_axi_V(sig_gpio_input_11_axi_V),
    .input_12_axi_V(sig_gpio_input_12_axi_V),
    .input_13_axi_V(sig_gpio_input_13_axi_V),
    .input_14_axi_V(sig_gpio_input_14_axi_V),
    .input_15_axi_V(sig_gpio_input_15_axi_V),
    .input_16_axi_V(sig_gpio_input_16_axi_V),
    .input_17_axi_V(sig_gpio_input_17_axi_V),
    .input_18_axi_V(sig_gpio_input_18_axi_V),
    .input_19_axi_V(sig_gpio_input_19_axi_V),
    .input_20_axi_V(sig_gpio_input_20_axi_V),
    .input_21_axi_V(sig_gpio_input_21_axi_V),
    .input_22_axi_V(sig_gpio_input_22_axi_V),
    .input_23_axi_V(sig_gpio_input_23_axi_V),
    .input_24_axi_V(sig_gpio_input_24_axi_V),
    .input_25_axi_V(sig_gpio_input_25_axi_V),
    .input_26_axi_V(sig_gpio_input_26_axi_V),
    .input_27_axi_V(sig_gpio_input_27_axi_V),
    .input_28_axi_V(sig_gpio_input_28_axi_V),
    .input_29_axi_V(sig_gpio_input_29_axi_V),
    .input_30_axi_V(sig_gpio_input_30_axi_V),
    .input_31_axi_V(sig_gpio_input_31_axi_V),
    .input_32_axi_V(sig_gpio_input_32_axi_V),
    .input_33_axi_V(sig_gpio_input_33_axi_V),
    .input_34_axi_V(sig_gpio_input_34_axi_V),
    .input_35_axi_V(sig_gpio_input_35_axi_V),
    .input_36_axi_V(sig_gpio_input_36_axi_V),
    .input_37_axi_V(sig_gpio_input_37_axi_V),
    .input_38_axi_V(sig_gpio_input_38_axi_V),
    .input_39_axi_V(sig_gpio_input_39_axi_V),
    .input_40_axi_V(sig_gpio_input_40_axi_V),
    .input_41_axi_V(sig_gpio_input_41_axi_V),
    .input_42_axi_V(sig_gpio_input_42_axi_V),
    .input_43_axi_V(sig_gpio_input_43_axi_V),
    .input_44_axi_V(sig_gpio_input_44_axi_V),
    .input_45_axi_V(sig_gpio_input_45_axi_V),
    .input_46_axi_V(sig_gpio_input_46_axi_V),
    .input_47_axi_V(sig_gpio_input_47_axi_V),
    .input_48_axi_V(sig_gpio_input_48_axi_V),
    .input_49_axi_V(sig_gpio_input_49_axi_V),
    .input_50_axi_V(sig_gpio_input_50_axi_V),
    .input_51_axi_V(sig_gpio_input_51_axi_V),
    .input_52_axi_V(sig_gpio_input_52_axi_V),
    .input_53_axi_V(sig_gpio_input_53_axi_V),
    .input_54_axi_V(sig_gpio_input_54_axi_V),
    .input_55_axi_V(sig_gpio_input_55_axi_V),
    .input_56_axi_V(sig_gpio_input_56_axi_V),
    .input_57_axi_V(sig_gpio_input_57_axi_V),
    .input_58_axi_V(sig_gpio_input_58_axi_V),
    .input_59_axi_V(sig_gpio_input_59_axi_V),
    .input_60_axi_V(sig_gpio_input_60_axi_V),
    .input_61_axi_V(sig_gpio_input_61_axi_V),
    .input_62_axi_V(sig_gpio_input_62_axi_V),
    .input_63_axi_V(sig_gpio_input_63_axi_V),
    .ap_rst_n(sig_gpio_ap_rst_n),
    .ap_clk(aclk),
    .input_0_V(input_0_V),
    .input_1_V(input_1_V),
    .input_2_V(input_2_V),
    .input_3_V(input_3_V),
    .input_4_V(input_4_V),
    .input_5_V(input_5_V),
    .input_6_V(input_6_V),
    .input_7_V(input_7_V),
    .input_8_V(input_8_V),
    .input_9_V(input_9_V),
    .input_10_V(input_10_V),
    .input_11_V(input_11_V),
    .input_12_V(input_12_V),
    .input_13_V(input_13_V),
    .input_14_V(input_14_V),
    .input_15_V(input_15_V),
    .input_16_V(input_16_V),
    .input_17_V(input_17_V),
    .input_18_V(input_18_V),
    .input_19_V(input_19_V),
    .input_20_V(input_20_V),
    .input_21_V(input_21_V),
    .input_22_V(input_22_V),
    .input_23_V(input_23_V),
    .input_24_V(input_24_V),
    .input_25_V(input_25_V),
    .input_26_V(input_26_V),
    .input_27_V(input_27_V),
    .input_28_V(input_28_V),
    .input_29_V(input_29_V),
    .input_30_V(input_30_V),
    .input_31_V(input_31_V),
    .input_32_V(input_32_V),
    .input_33_V(input_33_V),
    .input_34_V(input_34_V),
    .input_35_V(input_35_V),
    .input_36_V(input_36_V),
    .input_37_V(input_37_V),
    .input_38_V(input_38_V),
    .input_39_V(input_39_V),
    .input_40_V(input_40_V),
    .input_41_V(input_41_V),
    .input_42_V(input_42_V),
    .input_43_V(input_43_V),
    .input_44_V(input_44_V),
    .input_45_V(input_45_V),
    .input_46_V(input_46_V),
    .input_47_V(input_47_V),
    .input_48_V(input_48_V),
    .input_49_V(input_49_V),
    .input_50_V(input_50_V),
    .input_51_V(input_51_V),
    .input_52_V(input_52_V),
    .input_53_V(input_53_V),
    .input_54_V(input_54_V),
    .input_55_V(input_55_V),
    .input_56_V(input_56_V),
    .input_57_V(input_57_V),
    .input_58_V(input_58_V),
    .input_59_V(input_59_V),
    .input_60_V(input_60_V),
    .input_61_V(input_61_V),
    .input_62_V(input_62_V),
    .input_63_V(input_63_V)
);

gpio_BUS_A_if #(
    .C_ADDR_WIDTH(C_S_AXI_BUS_A_ADDR_WIDTH),
    .C_DATA_WIDTH(C_S_AXI_BUS_A_DATA_WIDTH))
gpio_BUS_A_if_U(
    .ACLK(aclk),
    .ARESETN(aresetn),
    .I_input_0_axi_V(sig_gpio_input_0_axi_V),
    .I_input_1_axi_V(sig_gpio_input_1_axi_V),
    .I_input_2_axi_V(sig_gpio_input_2_axi_V),
    .I_input_3_axi_V(sig_gpio_input_3_axi_V),
    .I_input_4_axi_V(sig_gpio_input_4_axi_V),
    .I_input_5_axi_V(sig_gpio_input_5_axi_V),
    .I_input_6_axi_V(sig_gpio_input_6_axi_V),
    .I_input_7_axi_V(sig_gpio_input_7_axi_V),
    .I_input_8_axi_V(sig_gpio_input_8_axi_V),
    .I_input_9_axi_V(sig_gpio_input_9_axi_V),
    .I_input_10_axi_V(sig_gpio_input_10_axi_V),
    .I_input_11_axi_V(sig_gpio_input_11_axi_V),
    .I_input_12_axi_V(sig_gpio_input_12_axi_V),
    .I_input_13_axi_V(sig_gpio_input_13_axi_V),
    .I_input_14_axi_V(sig_gpio_input_14_axi_V),
    .I_input_15_axi_V(sig_gpio_input_15_axi_V),
    .I_input_16_axi_V(sig_gpio_input_16_axi_V),
    .I_input_17_axi_V(sig_gpio_input_17_axi_V),
    .I_input_18_axi_V(sig_gpio_input_18_axi_V),
    .I_input_19_axi_V(sig_gpio_input_19_axi_V),
    .I_input_20_axi_V(sig_gpio_input_20_axi_V),
    .I_input_21_axi_V(sig_gpio_input_21_axi_V),
    .I_input_22_axi_V(sig_gpio_input_22_axi_V),
    .I_input_23_axi_V(sig_gpio_input_23_axi_V),
    .I_input_24_axi_V(sig_gpio_input_24_axi_V),
    .I_input_25_axi_V(sig_gpio_input_25_axi_V),
    .I_input_26_axi_V(sig_gpio_input_26_axi_V),
    .I_input_27_axi_V(sig_gpio_input_27_axi_V),
    .I_input_28_axi_V(sig_gpio_input_28_axi_V),
    .I_input_29_axi_V(sig_gpio_input_29_axi_V),
    .I_input_30_axi_V(sig_gpio_input_30_axi_V),
    .I_input_31_axi_V(sig_gpio_input_31_axi_V),
    .I_input_32_axi_V(sig_gpio_input_32_axi_V),
    .I_input_33_axi_V(sig_gpio_input_33_axi_V),
    .I_input_34_axi_V(sig_gpio_input_34_axi_V),
    .I_input_35_axi_V(sig_gpio_input_35_axi_V),
    .I_input_36_axi_V(sig_gpio_input_36_axi_V),
    .I_input_37_axi_V(sig_gpio_input_37_axi_V),
    .I_input_38_axi_V(sig_gpio_input_38_axi_V),
    .I_input_39_axi_V(sig_gpio_input_39_axi_V),
    .I_input_40_axi_V(sig_gpio_input_40_axi_V),
    .I_input_41_axi_V(sig_gpio_input_41_axi_V),
    .I_input_42_axi_V(sig_gpio_input_42_axi_V),
    .I_input_43_axi_V(sig_gpio_input_43_axi_V),
    .I_input_44_axi_V(sig_gpio_input_44_axi_V),
    .I_input_45_axi_V(sig_gpio_input_45_axi_V),
    .I_input_46_axi_V(sig_gpio_input_46_axi_V),
    .I_input_47_axi_V(sig_gpio_input_47_axi_V),
    .I_input_48_axi_V(sig_gpio_input_48_axi_V),
    .I_input_49_axi_V(sig_gpio_input_49_axi_V),
    .I_input_50_axi_V(sig_gpio_input_50_axi_V),
    .I_input_51_axi_V(sig_gpio_input_51_axi_V),
    .I_input_52_axi_V(sig_gpio_input_52_axi_V),
    .I_input_53_axi_V(sig_gpio_input_53_axi_V),
    .I_input_54_axi_V(sig_gpio_input_54_axi_V),
    .I_input_55_axi_V(sig_gpio_input_55_axi_V),
    .I_input_56_axi_V(sig_gpio_input_56_axi_V),
    .I_input_57_axi_V(sig_gpio_input_57_axi_V),
    .I_input_58_axi_V(sig_gpio_input_58_axi_V),
    .I_input_59_axi_V(sig_gpio_input_59_axi_V),
    .I_input_60_axi_V(sig_gpio_input_60_axi_V),
    .I_input_61_axi_V(sig_gpio_input_61_axi_V),
    .I_input_62_axi_V(sig_gpio_input_62_axi_V),
    .I_input_63_axi_V(sig_gpio_input_63_axi_V),
    .AWADDR(s_axi_BUS_A_AWADDR),
    .AWVALID(s_axi_BUS_A_AWVALID),
    .AWREADY(s_axi_BUS_A_AWREADY),
    .WDATA(s_axi_BUS_A_WDATA),
    .WSTRB(s_axi_BUS_A_WSTRB),
    .WVALID(s_axi_BUS_A_WVALID),
    .WREADY(s_axi_BUS_A_WREADY),
    .BRESP(s_axi_BUS_A_BRESP),
    .BVALID(s_axi_BUS_A_BVALID),
    .BREADY(s_axi_BUS_A_BREADY),
    .ARADDR(s_axi_BUS_A_ARADDR),
    .ARVALID(s_axi_BUS_A_ARVALID),
    .ARREADY(s_axi_BUS_A_ARREADY),
    .RDATA(s_axi_BUS_A_RDATA),
    .RRESP(s_axi_BUS_A_RRESP),
    .RVALID(s_axi_BUS_A_RVALID),
    .RREADY(s_axi_BUS_A_RREADY));

gpio_ap_rst_n_if #(
    .RESET_ACTIVE_LOW(RESET_ACTIVE_LOW))
ap_rst_n_if_U(
    .dout(sig_gpio_ap_rst_n),
    .din(aresetn));

endmodule
