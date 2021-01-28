# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Adapter definition:
set corename BUS_A
set opts {
    {
        id 1
        name input_0_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 32
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 3
        name input_1_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 5
        name input_2_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 7
        name input_3_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 24
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 9
        name input_4_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 32
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 11
        name input_5_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 13
        name input_6_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 15
        name input_7_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 24
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 17
        name input_8_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 32
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 19
        name input_9_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 21
        name input_10_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 23
        name input_11_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 24
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 25
        name input_12_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 32
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 27
        name input_13_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 29
        name input_14_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 31
        name input_15_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 24
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 33
        name input_16_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 32
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 35
        name input_17_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 37
        name input_18_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 39
        name input_19_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 24
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 41
        name input_20_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 32
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 43
        name input_21_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 45
        name input_22_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 47
        name input_23_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 24
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 49
        name input_24_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 32
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 51
        name input_25_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 53
        name input_26_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 55
        name input_27_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 24
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 57
        name input_28_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 32
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 59
        name input_29_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 61
        name input_30_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 63
        name input_31_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 24
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 65
        name input_32_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 32
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 67
        name input_33_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 69
        name input_34_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 71
        name input_35_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 24
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 73
        name input_36_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 32
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 75
        name input_37_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 77
        name input_38_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 79
        name input_39_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 24
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 81
        name input_40_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 32
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 83
        name input_41_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 85
        name input_42_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 87
        name input_43_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 24
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 89
        name input_44_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 32
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 91
        name input_45_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 93
        name input_46_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 95
        name input_47_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 24
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 97
        name input_48_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 32
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 99
        name input_49_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 101
        name input_50_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 103
        name input_51_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 24
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 105
        name input_52_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 32
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 107
        name input_53_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 109
        name input_54_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 111
        name input_55_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 24
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 113
        name input_56_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 32
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 115
        name input_57_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 117
        name input_58_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 119
        name input_59_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 24
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 121
        name input_60_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 32
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 123
        name input_61_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 125
        name input_62_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 127
        name input_63_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 24
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
}
set portmap { }
set metadata { -bus_bundle BUS_A}
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::axi_slave_int_gen] == "::AESL_LIB_XILADAPTER::axi_slave_int_gen"} {
eval "::AESL_LIB_XILADAPTER::axi_slave_int_gen { \
    corename ${corename} \
    reset_level 1 \
    sync_rst true \
    opts {${opts}} \
    portmap {${portmap}} \
    metadata {${metadata}} \
}"
} else {
puts "@W Can not find gen function '::AESL_LIB_XILADAPTER::axi_slave_int_gen' in the library. Ignored generation of adapter for '${corename}'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2 \
    name input_0_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_0_V \
    op interface \
    ports { input_0_V { O 32 vector } input_0_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4 \
    name input_1_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_1_V \
    op interface \
    ports { input_1_V { O 16 vector } input_1_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 6 \
    name input_2_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_2_V \
    op interface \
    ports { input_2_V { O 16 vector } input_2_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 8 \
    name input_3_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_3_V \
    op interface \
    ports { input_3_V { O 24 vector } input_3_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 10 \
    name input_4_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_4_V \
    op interface \
    ports { input_4_V { O 32 vector } input_4_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 12 \
    name input_5_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_5_V \
    op interface \
    ports { input_5_V { O 16 vector } input_5_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 14 \
    name input_6_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_6_V \
    op interface \
    ports { input_6_V { O 16 vector } input_6_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 16 \
    name input_7_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_7_V \
    op interface \
    ports { input_7_V { O 24 vector } input_7_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 18 \
    name input_8_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_8_V \
    op interface \
    ports { input_8_V { O 32 vector } input_8_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 20 \
    name input_9_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_9_V \
    op interface \
    ports { input_9_V { O 16 vector } input_9_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 22 \
    name input_10_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_10_V \
    op interface \
    ports { input_10_V { O 16 vector } input_10_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 24 \
    name input_11_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_11_V \
    op interface \
    ports { input_11_V { O 24 vector } input_11_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 26 \
    name input_12_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_12_V \
    op interface \
    ports { input_12_V { O 32 vector } input_12_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 28 \
    name input_13_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_13_V \
    op interface \
    ports { input_13_V { O 16 vector } input_13_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 30 \
    name input_14_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_14_V \
    op interface \
    ports { input_14_V { O 16 vector } input_14_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 32 \
    name input_15_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_15_V \
    op interface \
    ports { input_15_V { O 24 vector } input_15_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 34 \
    name input_16_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_16_V \
    op interface \
    ports { input_16_V { O 32 vector } input_16_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 36 \
    name input_17_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_17_V \
    op interface \
    ports { input_17_V { O 16 vector } input_17_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 38 \
    name input_18_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_18_V \
    op interface \
    ports { input_18_V { O 16 vector } input_18_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 40 \
    name input_19_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_19_V \
    op interface \
    ports { input_19_V { O 24 vector } input_19_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 42 \
    name input_20_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_20_V \
    op interface \
    ports { input_20_V { O 32 vector } input_20_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 44 \
    name input_21_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_21_V \
    op interface \
    ports { input_21_V { O 16 vector } input_21_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 46 \
    name input_22_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_22_V \
    op interface \
    ports { input_22_V { O 16 vector } input_22_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 48 \
    name input_23_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_23_V \
    op interface \
    ports { input_23_V { O 24 vector } input_23_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 50 \
    name input_24_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_24_V \
    op interface \
    ports { input_24_V { O 32 vector } input_24_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 52 \
    name input_25_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_25_V \
    op interface \
    ports { input_25_V { O 16 vector } input_25_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 54 \
    name input_26_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_26_V \
    op interface \
    ports { input_26_V { O 16 vector } input_26_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 56 \
    name input_27_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_27_V \
    op interface \
    ports { input_27_V { O 24 vector } input_27_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 58 \
    name input_28_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_28_V \
    op interface \
    ports { input_28_V { O 32 vector } input_28_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 60 \
    name input_29_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_29_V \
    op interface \
    ports { input_29_V { O 16 vector } input_29_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 62 \
    name input_30_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_30_V \
    op interface \
    ports { input_30_V { O 16 vector } input_30_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 64 \
    name input_31_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_31_V \
    op interface \
    ports { input_31_V { O 24 vector } input_31_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 66 \
    name input_32_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_32_V \
    op interface \
    ports { input_32_V { O 32 vector } input_32_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 68 \
    name input_33_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_33_V \
    op interface \
    ports { input_33_V { O 16 vector } input_33_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 70 \
    name input_34_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_34_V \
    op interface \
    ports { input_34_V { O 16 vector } input_34_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 72 \
    name input_35_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_35_V \
    op interface \
    ports { input_35_V { O 24 vector } input_35_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 74 \
    name input_36_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_36_V \
    op interface \
    ports { input_36_V { O 32 vector } input_36_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 76 \
    name input_37_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_37_V \
    op interface \
    ports { input_37_V { O 16 vector } input_37_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 78 \
    name input_38_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_38_V \
    op interface \
    ports { input_38_V { O 16 vector } input_38_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 80 \
    name input_39_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_39_V \
    op interface \
    ports { input_39_V { O 24 vector } input_39_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 82 \
    name input_40_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_40_V \
    op interface \
    ports { input_40_V { O 32 vector } input_40_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 84 \
    name input_41_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_41_V \
    op interface \
    ports { input_41_V { O 16 vector } input_41_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 86 \
    name input_42_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_42_V \
    op interface \
    ports { input_42_V { O 16 vector } input_42_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 88 \
    name input_43_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_43_V \
    op interface \
    ports { input_43_V { O 24 vector } input_43_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 90 \
    name input_44_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_44_V \
    op interface \
    ports { input_44_V { O 32 vector } input_44_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 92 \
    name input_45_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_45_V \
    op interface \
    ports { input_45_V { O 16 vector } input_45_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 94 \
    name input_46_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_46_V \
    op interface \
    ports { input_46_V { O 16 vector } input_46_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 96 \
    name input_47_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_47_V \
    op interface \
    ports { input_47_V { O 24 vector } input_47_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 98 \
    name input_48_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_48_V \
    op interface \
    ports { input_48_V { O 32 vector } input_48_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 100 \
    name input_49_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_49_V \
    op interface \
    ports { input_49_V { O 16 vector } input_49_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 102 \
    name input_50_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_50_V \
    op interface \
    ports { input_50_V { O 16 vector } input_50_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 104 \
    name input_51_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_51_V \
    op interface \
    ports { input_51_V { O 24 vector } input_51_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 106 \
    name input_52_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_52_V \
    op interface \
    ports { input_52_V { O 32 vector } input_52_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 108 \
    name input_53_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_53_V \
    op interface \
    ports { input_53_V { O 16 vector } input_53_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 110 \
    name input_54_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_54_V \
    op interface \
    ports { input_54_V { O 16 vector } input_54_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 112 \
    name input_55_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_55_V \
    op interface \
    ports { input_55_V { O 24 vector } input_55_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 114 \
    name input_56_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_56_V \
    op interface \
    ports { input_56_V { O 32 vector } input_56_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 116 \
    name input_57_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_57_V \
    op interface \
    ports { input_57_V { O 16 vector } input_57_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 118 \
    name input_58_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_58_V \
    op interface \
    ports { input_58_V { O 16 vector } input_58_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 120 \
    name input_59_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_59_V \
    op interface \
    ports { input_59_V { O 24 vector } input_59_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 122 \
    name input_60_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_60_V \
    op interface \
    ports { input_60_V { O 32 vector } input_60_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 124 \
    name input_61_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_61_V \
    op interface \
    ports { input_61_V { O 16 vector } input_61_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 126 \
    name input_62_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_62_V \
    op interface \
    ports { input_62_V { O 16 vector } input_62_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 128 \
    name input_63_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_63_V \
    op interface \
    ports { input_63_V { O 24 vector } input_63_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } ap_continue { I 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


