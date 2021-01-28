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
        id 129
        name input_0_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 32
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 131
        name input_1_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 133
        name input_2_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 135
        name input_3_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 24
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 137
        name input_4_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 32
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 139
        name input_5_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 141
        name input_6_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 143
        name input_7_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 24
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 145
        name input_8_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 32
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 147
        name input_9_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 149
        name input_10_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 151
        name input_11_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 24
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 153
        name input_12_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 32
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 155
        name input_13_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 157
        name input_14_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 159
        name input_15_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 24
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 161
        name input_16_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 32
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 163
        name input_17_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 165
        name input_18_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 167
        name input_19_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 24
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 169
        name input_20_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 32
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 171
        name input_21_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 173
        name input_22_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 175
        name input_23_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 24
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 177
        name input_24_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 32
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 179
        name input_25_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 181
        name input_26_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 183
        name input_27_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 24
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 185
        name input_28_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 32
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 187
        name input_29_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 189
        name input_30_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 191
        name input_31_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 24
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 193
        name input_32_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 32
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 195
        name input_33_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 197
        name input_34_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 199
        name input_35_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 24
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 201
        name input_36_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 32
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 203
        name input_37_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 205
        name input_38_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 207
        name input_39_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 24
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 209
        name input_40_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 32
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 211
        name input_41_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 213
        name input_42_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 215
        name input_43_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 24
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 217
        name input_44_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 32
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 219
        name input_45_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 221
        name input_46_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 223
        name input_47_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 24
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 225
        name input_48_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 32
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 227
        name input_49_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 229
        name input_50_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 231
        name input_51_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 24
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 233
        name input_52_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 32
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 235
        name input_53_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 237
        name input_54_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 239
        name input_55_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 24
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 241
        name input_56_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 32
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 243
        name input_57_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 245
        name input_58_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 247
        name input_59_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 24
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 249
        name input_60_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 32
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 251
        name input_61_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 253
        name input_62_axi_V
        reset_level 1
        sync_rst true
        type scalar
        dir I
        width 16
        mode SIG_IN_VLD_OFF:SIG_IN_ACC_OFF
    }
    {
        id 255
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
    id 130 \
    name input_0_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_0_V \
    op interface \
    ports { input_0_V { O 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 132 \
    name input_1_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_1_V \
    op interface \
    ports { input_1_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 134 \
    name input_2_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_2_V \
    op interface \
    ports { input_2_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 136 \
    name input_3_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_3_V \
    op interface \
    ports { input_3_V { O 24 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 138 \
    name input_4_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_4_V \
    op interface \
    ports { input_4_V { O 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 140 \
    name input_5_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_5_V \
    op interface \
    ports { input_5_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 142 \
    name input_6_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_6_V \
    op interface \
    ports { input_6_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 144 \
    name input_7_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_7_V \
    op interface \
    ports { input_7_V { O 24 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 146 \
    name input_8_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_8_V \
    op interface \
    ports { input_8_V { O 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 148 \
    name input_9_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_9_V \
    op interface \
    ports { input_9_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 150 \
    name input_10_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_10_V \
    op interface \
    ports { input_10_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 152 \
    name input_11_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_11_V \
    op interface \
    ports { input_11_V { O 24 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 154 \
    name input_12_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_12_V \
    op interface \
    ports { input_12_V { O 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 156 \
    name input_13_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_13_V \
    op interface \
    ports { input_13_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 158 \
    name input_14_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_14_V \
    op interface \
    ports { input_14_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 160 \
    name input_15_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_15_V \
    op interface \
    ports { input_15_V { O 24 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 162 \
    name input_16_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_16_V \
    op interface \
    ports { input_16_V { O 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 164 \
    name input_17_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_17_V \
    op interface \
    ports { input_17_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 166 \
    name input_18_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_18_V \
    op interface \
    ports { input_18_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 168 \
    name input_19_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_19_V \
    op interface \
    ports { input_19_V { O 24 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 170 \
    name input_20_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_20_V \
    op interface \
    ports { input_20_V { O 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 172 \
    name input_21_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_21_V \
    op interface \
    ports { input_21_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 174 \
    name input_22_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_22_V \
    op interface \
    ports { input_22_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 176 \
    name input_23_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_23_V \
    op interface \
    ports { input_23_V { O 24 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 178 \
    name input_24_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_24_V \
    op interface \
    ports { input_24_V { O 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 180 \
    name input_25_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_25_V \
    op interface \
    ports { input_25_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 182 \
    name input_26_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_26_V \
    op interface \
    ports { input_26_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 184 \
    name input_27_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_27_V \
    op interface \
    ports { input_27_V { O 24 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 186 \
    name input_28_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_28_V \
    op interface \
    ports { input_28_V { O 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 188 \
    name input_29_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_29_V \
    op interface \
    ports { input_29_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 190 \
    name input_30_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_30_V \
    op interface \
    ports { input_30_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 192 \
    name input_31_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_31_V \
    op interface \
    ports { input_31_V { O 24 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 194 \
    name input_32_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_32_V \
    op interface \
    ports { input_32_V { O 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 196 \
    name input_33_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_33_V \
    op interface \
    ports { input_33_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 198 \
    name input_34_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_34_V \
    op interface \
    ports { input_34_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 200 \
    name input_35_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_35_V \
    op interface \
    ports { input_35_V { O 24 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 202 \
    name input_36_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_36_V \
    op interface \
    ports { input_36_V { O 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 204 \
    name input_37_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_37_V \
    op interface \
    ports { input_37_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 206 \
    name input_38_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_38_V \
    op interface \
    ports { input_38_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 208 \
    name input_39_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_39_V \
    op interface \
    ports { input_39_V { O 24 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 210 \
    name input_40_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_40_V \
    op interface \
    ports { input_40_V { O 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 212 \
    name input_41_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_41_V \
    op interface \
    ports { input_41_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 214 \
    name input_42_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_42_V \
    op interface \
    ports { input_42_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 216 \
    name input_43_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_43_V \
    op interface \
    ports { input_43_V { O 24 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 218 \
    name input_44_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_44_V \
    op interface \
    ports { input_44_V { O 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 220 \
    name input_45_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_45_V \
    op interface \
    ports { input_45_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 222 \
    name input_46_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_46_V \
    op interface \
    ports { input_46_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 224 \
    name input_47_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_47_V \
    op interface \
    ports { input_47_V { O 24 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 226 \
    name input_48_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_48_V \
    op interface \
    ports { input_48_V { O 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 228 \
    name input_49_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_49_V \
    op interface \
    ports { input_49_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 230 \
    name input_50_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_50_V \
    op interface \
    ports { input_50_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 232 \
    name input_51_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_51_V \
    op interface \
    ports { input_51_V { O 24 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 234 \
    name input_52_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_52_V \
    op interface \
    ports { input_52_V { O 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 236 \
    name input_53_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_53_V \
    op interface \
    ports { input_53_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 238 \
    name input_54_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_54_V \
    op interface \
    ports { input_54_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 240 \
    name input_55_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_55_V \
    op interface \
    ports { input_55_V { O 24 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 242 \
    name input_56_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_56_V \
    op interface \
    ports { input_56_V { O 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 244 \
    name input_57_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_57_V \
    op interface \
    ports { input_57_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 246 \
    name input_58_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_58_V \
    op interface \
    ports { input_58_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 248 \
    name input_59_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_59_V \
    op interface \
    ports { input_59_V { O 24 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 250 \
    name input_60_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_60_V \
    op interface \
    ports { input_60_V { O 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 252 \
    name input_61_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_61_V \
    op interface \
    ports { input_61_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 254 \
    name input_62_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_62_V \
    op interface \
    ports { input_62_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 256 \
    name input_63_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_input_63_V \
    op interface \
    ports { input_63_V { O 24 vector } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -1 \
    name ${PortName} \
    reset_level 0 \
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
set PortName ap_rst_n
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -2 \
    name ${PortName} \
    reset_level 0 \
    sync_rst true \
    corename apif_ap_rst_n \
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


