-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\MechanismState.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    Function = "SetParam",
    Param = "CanOpen",
    Value = true,
  },
}
r0_0.RT_2 = {
  r0_0.RT_1
}
r0_0.RT_3 = {
  Type = "Interactive",
}
r0_0.RT_4 = {
  Type = "Manual",
}
r0_0.RT_5 = {
  Function = "OpenUI",
}
r0_0.RT_6 = {
  r0_0.RT_5
}
r0_0.RT_7 = {
  Type = "InteractBreak",
}
r0_0.RT_8 = {
  Type = "InteractDone",
}
r0_0.RT_9 = {
  Function = "DeactiveGuide",
}
r0_0.RT_10 = {
  Param = 0,
  Type = "Time",
}
r0_0.RT_11 = {
  Function = "CloseMechanism",
}
r0_0.RT_12 = {
  DoorType = 0,
  Function = "SetConditionDoorState",
}
r0_0.RT_13 = {
  ColorId = 0,
  Function = "ChangeColor",
}
r0_0.RT_14 = {
  Type = "TriggerBox",
}
r0_0.RT_15 = {
  NextStateId = 104012,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_16 = {
  NextStateId = 104013,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_17 = {
  Function = "OpenMechanism",
}
r0_0.RT_18 = {
  r0_0.RT_17,
  r0_0.RT_12,
  r0_0.RT_13
}
r0_0.RT_19 = {
  DoorType = 1,
  Function = "SetConditionDoorState",
}
r0_0.RT_20 = {
  ColorId = 1,
  Function = "ChangeColor",
}
r0_0.RT_21 = {
  NextStateId = 104011,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_22 = {
  ColorId = 2,
  Function = "ChangeColor",
}
r0_0.RT_23 = {
  r0_0.RT_11,
  r0_0.RT_22
}
r0_0.RT_24 = {
  ActiveRange = 1500,
  Type = "DistanceActive",
}
r0_0.RT_25 = {
  Param = 1,
  Type = "Time",
}
r0_0.RT_26 = {
  r0_0.RT_22,
  r0_0.RT_9
}
r0_0.RT_27 = {
  NextStateId = 1060401,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_28 = {
  NextStateId = 1060402,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_29 = {
  r0_0.RT_20
}
r0_0.RT_30 = {
  NextStateId = 1060400,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_31 = {
  r0_0.RT_20,
  r0_0.RT_9
}
r0_0.RT_32 = {
  NextStateId = 1060801,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_33 = {
  NextStateId = 1060802,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_34 = {
  NextStateId = 1060800,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_35 = {
  ColorId = 3,
  Function = "ChangeColor",
}
r0_0.RT_36 = {
  r0_0.RT_35
}
r0_0.RT_37 = {
  NextStateId = 1061101,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_38 = {
  NextStateId = 1061102,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_39 = {
  NextStateId = 1061103,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_40 = {
  NextStateId = 1061104,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_41 = {
  NextStateId = 1061105,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_42 = {
  NextStateId = 1061100,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_43 = {
  Param = 2,
  Type = "Time",
}
r0_0.RT_44 = {
  r0_0.RT_13
}
r0_0.RT_45 = {
  NextStateId = 1061201,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_46 = {
  InteractiveId = 918,
  Type = "Interactive",
}
r0_0.RT_47 = {
  NextStateId = 1061200,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_48 = {
  Param = 3,
  Type = "Time",
}
r0_0.RT_49 = {
  InteractiveId = 919,
  Type = "Interactive",
}
r0_0.RT_50 = {
  r0_0.RT_35,
  r0_0.RT_9
}
r0_0.RT_51 = {
  r0_0.RT_22
}
r0_0.RT_52 = {
  NextStateId = 1061231,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_53 = {
  NextStateId = 1061232,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_54 = {
  NextStateId = 1061230,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_55 = {
  InteractiveId = 922,
  Type = "Interactive",
}
r0_0.RT_56 = {
  r0_0.RT_17,
  r0_0.RT_20
}
r0_0.RT_57 = {
  Function = "SetParam",
  Param = "OpenState",
  Value = false,
}
r0_0.RT_58 = {
  InteractiveId = 923,
  Type = "Interactive",
}
r0_0.RT_59 = {
  InteractiveId = 924,
  Type = "Interactive",
}
r0_0.RT_60 = {
  NextStateId = 1061251,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_61 = {
  NextStateId = 1061301,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_62 = {
  NextStateId = 1061302,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_63 = {
  NextStateId = 1061300,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_64 = {
  DeActiveRange = 5000,
  Type = "DistanceDeActive",
}
r0_0.RT_65 = {
  ActiveRange = 4000,
  Type = "DistanceActive",
}
r0_0.RT_66 = {
  NextStateId = 1061311,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_67 = {
  NextStateId = 1061313,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_68 = {
  NextStateId = 1061310,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_69 = {
  NextStateId = 1061312,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_70 = {
  NextStateId = 1061321,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_71 = {
  NextStateId = 1061323,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_72 = {
  NextStateId = 1061320,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_73 = {
  NextStateId = 1061400,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_74 = {
  DeActiveRange = 1600,
  Type = "DistanceDeActive",
}
r0_0.RT_75 = {
  NextStateId = 1061601,
  TypeNextState = r0_0.RT_74,
}
r0_0.RT_76 = {
  NextStateId = 1061900,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_77 = {
  NextStateId = 1062002,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_78 = {
  Function = "CombatPropActive",
}
r0_0.RT_79 = {
  r0_0.RT_78,
  r0_0.RT_13
}
r0_0.RT_80 = {
  DeActiveRange = 3000,
  Type = "DistanceDeActive",
}
r0_0.RT_81 = {
  NextStateId = 1070102,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_82 = {
  Function = "CombatPropDeActive",
}
r0_0.RT_83 = {
  r0_0.RT_82,
  r0_0.RT_20
}
r0_0.RT_84 = {
  ActiveRange = 3000,
  Type = "DistanceActive",
}
r0_0.RT_85 = {
  r0_0.RT_82,
  r0_0.RT_22
}
r0_0.RT_86 = {
  NextStateId = 1070160,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_87 = {
  Param = 4,
  Type = "Time",
}
r0_0.RT_88 = {
  NextStateId = 1070200,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_89 = {
  r0_0.RT_82,
  r0_0.RT_13
}
r0_0.RT_90 = {
  r0_0.RT_9
}
r0_0.RT_91 = {
  NextStateId = 109010,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_92 = {
  r0_0.RT_17
}
r0_0.RT_93 = {
  NextStateId = 111011,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_94 = {
  NextStateId = 111010,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_95 = {
  Type = "Hit",
}
r0_0.RT_96 = {
  r0_0.RT_13,
  r0_0.RT_9
}
r0_0.RT_97 = {
  NextStateId = 111014,
  TypeNextState = r0_0.RT_95,
}
r0_0.RT_98 = {
  NeedCountDown = true,
  Type = "CustomTime",
}
r0_0.RT_99 = {
  NextStateId = 111013,
  TypeNextState = r0_0.RT_98,
}
r0_0.RT_100 = {
  NextStateId = 111012,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_101 = {
  NextStateId = 111020,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_102 = {
  Function = "ActiveGuide",
}
r0_0.RT_103 = {
  NextStateId = 111030,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_104 = {
  NeedCountDown = false,
  Param = 1,
  Type = "Time",
}
r0_0.RT_105 = {
  NextStateId = 111040,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_106 = {
  NextStateId = 111042,
  TypeNextState = r0_0.RT_95,
}
r0_0.RT_107 = {
  NextStateId = 111041,
  TypeNextState = r0_0.RT_98,
}
r0_0.RT_108 = {
  r0_0.RT_82,
  r0_0.RT_22,
  r0_0.RT_9
}
r0_0.RT_109 = {
  r0_0.RT_78,
  r0_0.RT_20
}
r0_0.RT_110 = {
  NextStateId = 112010,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_111 = {
  Function = "StopFX",
  Tag = "GearR1",
}
r0_0.RT_112 = {
  Function = "StopFX",
  Tag = "GearR2",
}
r0_0.RT_113 = {
  Function = "StopFX",
  Tag = "GearR3",
}
r0_0.RT_114 = {
  Function = "StopFX",
  Tag = "GearR4",
}
r0_0.RT_115 = {
  Function = "StopFX",
  Tag = "GearS",
}
r0_0.RT_116 = {
  NextStateId = 11301231,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_117 = {
  NextStateId = 11301232,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_118 = {
  NextStateId = 11301230,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_119 = {
  Function = "SetParam",
  Param = "CanOpen",
  Value = false,
}
r0_0.RT_120 = {
  r0_0.RT_119
}
r0_0.RT_121 = {
  NextStateId = 1150301,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_122 = {
  NextStateId = 1150302,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_123 = {
  NextStateId = 1150303,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_124 = {
  NextStateId = 1150300,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_125 = {
  NextStateId = 116011,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_126 = {
  NextStateId = 116012,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_127 = {
  NextStateId = 116013,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_128 = {
  NextStateId = 116014,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_129 = {
  NextStateId = 116015,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_130 = {
  NextStateId = 116010,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_131 = {
  NextStateId = 1170102,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_132 = {
  NextStateId = 118002,
  TypeNextState = r0_0.RT_14,
}
r0_0.RT_133 = {
  NextStateId = 118004,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_134 = {
  NextStateId = 118005,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_135 = {
  ColorId = 4,
  Function = "ChangeColor",
}
r0_0.RT_136 = {
  r0_0.RT_135
}
r0_0.RT_137 = {
  NextStateId = 118001,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_138 = {
  [1] = r0_0.RT_137,
}
r0_0.RT_139 = {
  NextStateId = 118011,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_140 = {
  NextStateId = 118026,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_141 = {
  NextStateId = 118015,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_142 = {
  r0_0.RT_17,
  r0_0.RT_135
}
r0_0.RT_143 = {
  NextStateId = 118013,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_144 = {
  [1] = r0_0.RT_143,
  [2] = r0_0.RT_141,
  [3] = r0_0.RT_139,
}
r0_0.RT_145 = {
  NextStateId = 1180180,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_146 = {
  Function = "CombatPropInvincible",
}
r0_0.RT_147 = {
  r0_0.RT_146
}
r0_0.RT_148 = {
  Function = "CombatPropUnInvincible",
}
r0_0.RT_149 = {
  r0_0.RT_148
}
r0_0.RT_150 = {
  EffectId = 900031,
  Function = "PlayFX",
  Tag = "Bomb",
}
r0_0.RT_151 = {
  Function = "DestroySelf",
}
r0_0.RT_152 = {
  r0_0.RT_151
}
r0_0.RT_153 = {
  Function = "SetCanHatred",
  IsCan = false,
}
r0_0.RT_154 = {
  NextStateId = 13,
  TypeNextState = r0_0.RT_3,
}
r0_0.RT_155 = {
  NextStateId = 1210021,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_156 = {
  Function = "GiveReward",
}
r0_0.RT_157 = {
  r0_0.RT_156
}
r0_0.RT_158 = {
  r0_0.RT_82
}
r0_0.RT_159 = {
  r0_0.RT_78
}
r0_0.RT_160 = {
  InteractiveId = 103,
  Type = "Interactive",
}
r0_0.RT_161 = {
  NextStateId = 1210182,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_162 = {
  Param = 5,
  Type = "Time",
}
r0_0.RT_163 = {
  NextStateId = 1210220,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_164 = {
  NextStateId = 1210240,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_165 = {
  NextStateId = 1210283,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_166 = {
  InteractiveId = 300,
  Type = "Interactive",
}
r0_0.RT_167 = {
  NextStateId = 1220110,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_168 = {
  NextStateId = 15,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_169 = {
  NextStateId = 1310042,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_170 = {
  NextStateId = 1310040,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_171 = {
  NextStateId = 1310071,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_172 = {
  NextStateId = 1310073,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_173 = {
  NextStateId = 1310070,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_174 = {
  InteractiveId = 301,
  Type = "Interactive",
}
r0_0.RT_175 = {
  NextStateId = 1310082,
  TypeNextState = r0_0.RT_174,
}
r0_0.RT_176 = {
  NextStateId = 1310083,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_177 = {
  NextStateId = 1310085,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_178 = {
  NextStateId = 1310092,
  TypeNextState = r0_0.RT_174,
}
r0_0.RT_179 = {
  [1] = r0_0.RT_178,
}
r0_0.RT_180 = {
  NextStateId = 1310094,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_181 = {
  NextStateId = 1310095,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_182 = {
  NextStateId = 1310170,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_183 = {
  [1] = r0_0.RT_182,
}
r0_0.RT_184 = {
  NextStateId = 1310173,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_185 = {
  Param = 6,
  Type = "Time",
}
r0_0.RT_186 = {
  NextStateId = 1310176,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_187 = {
  NextStateId = 1310182,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_188 = {
  Param = 10,
  Type = "Time",
}
r0_0.RT_189 = {
  Function = "Rotate",
  IsForward = true,
}
r0_0.RT_190 = {
  r0_0.RT_189
}
r0_0.RT_191 = {
  Function = "Rotate",
  IsForward = false,
}
r0_0.RT_192 = {
  r0_0.RT_191
}
r0_0.RT_193 = {
  NextStateId = 1310564,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_194 = {
  NextStateId = 1310573,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_195 = {
  NextStateId = 1500110,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_196 = {
  Function = "SetParam",
  Param = "ForceStop",
  Value = true,
}
r0_0.RT_197 = {
  r0_0.RT_196
}
r0_0.RT_198 = {
  NextStateId = 242,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_199 = {
  Function = "SetParam",
  Param = "ForceStop",
  Value = false,
}
r0_0.RT_200 = {
  Param = 0.1,
  Type = "Time",
}
r0_0.RT_201 = {
  Function = "SetParam",
  Param = "IsActive",
  Value = false,
}
r0_0.RT_202 = {
  r0_0.RT_201,
  r0_0.RT_20
}
r0_0.RT_203 = {
  Function = "SetParam",
  Param = "IsActive",
  Value = true,
}
r0_0.RT_204 = {
  r0_0.RT_203,
  r0_0.RT_13
}
r0_0.RT_205 = {
  NextStateId = 244,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_206 = {
  Function = "SetBubbleWidget",
  Show = false,
}
r0_0.RT_207 = {
  r0_0.RT_119,
  r0_0.RT_206
}
r0_0.RT_208 = {
  NextStateId = 26,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_209 = {
  [1] = r0_0.RT_208,
}
r0_0.RT_210 = {
  r0_0.RT_57
}
r0_0.RT_211 = {
  Function = "SetParam",
  Param = "OpenState",
  Value = true,
}
r0_0.RT_212 = {
  Function = "ShowToast",
  ToastText = "UI_TELEPORTPOINT_INTERACTIVE",
}
r0_0.RT_213 = {
  InteractiveId = 909,
  StateChangeParam = true,
  Type = "Interactive",
}
r0_0.RT_214 = {
  r0_0.RT_82,
  r0_0.RT_9
}
r0_0.RT_215 = {
  ActiveRange = 1000,
  Type = "DistanceActive",
}
r0_0.RT_216 = {
  r0_0.RT_78,
  r0_0.RT_102
}
r0_0.RT_217 = {
  NextStateId = 3900130,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_218 = {
  EffectId = 900035,
  Function = "PlayFX",
  Tag = "Lock",
}
r0_0.RT_219 = {
  r0_0.RT_82,
  r0_0.RT_218
}
r0_0.RT_220 = {
  InteractiveId = 111,
  Type = "Interactive",
}
r0_0.RT_221 = {
  r0_0.RT_78,
  r0_0.RT_17
}
r0_0.RT_222 = {
  EffectId = 900036,
  Function = "PlayFX",
  Tag = "Unlock",
}
r0_0.RT_223 = {
  Function = "StopFX",
  Tag = "Lock",
}
r0_0.RT_224 = {
  r0_0.RT_82,
  r0_0.RT_222,
  r0_0.RT_223
}
r0_0.RT_225 = {
  NextStateId = 3900180,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_226 = {
  [2] = r0_0.RT_225,
}
r0_0.RT_227 = {
  r0_0.RT_201
}
r0_0.RT_228 = {
  r0_0.RT_203
}
r0_0.RT_229 = {
  Function = "ChangeTrapSkillOpen",
  Open = false,
}
r0_0.RT_230 = {
  Function = "ChangeTrapSkillOpen",
  Open = true,
}
r0_0.RT_231 = {
  NextStateId = 3901501,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_232 = {
  NextStateId = 3901502,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_233 = {
  NextStateId = 3901500,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_234 = {
  NextStateId = 3901511,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_235 = {
  NextStateId = 3901510,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_236 = {
  r0_0.RT_78,
  r0_0.RT_229,
  r0_0.RT_20
}
r0_0.RT_237 = {
  NextStateId = 3901600,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_238 = {
  r0_0.RT_78,
  r0_0.RT_230,
  r0_0.RT_35,
  r0_0.RT_9
}
r0_0.RT_239 = {
  NeedCountDown = true,
  Param = 45,
  Type = "Time",
}
r0_0.RT_240 = {
  NextStateId = 3901702,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_241 = {
  NextStateId = 3901700,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_242 = {
  NextStateId = 3901803,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_243 = {
  [1] = r0_0.RT_242,
}
r0_0.RT_244 = {
  r0_0.RT_146,
  r0_0.RT_82
}
r0_0.RT_245 = {
  NextStateId = 3902000,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_246 = {
  r0_0.RT_148,
  r0_0.RT_78
}
r0_0.RT_247 = {
  DeActiveRange = 2000,
  Type = "DistanceDeActive",
}
r0_0.RT_248 = {
  NextStateId = 3902301,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_249 = {
  NextStateId = 3902302,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_250 = {
  NextStateId = 3902300,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_251 = {
  Param = 15,
  Type = "Time",
}
r0_0.RT_252 = {
  NextStateId = 3902400,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_253 = {
  [1] = r0_0.RT_252,
}
r0_0.RT_254 = {
  NextStateId = 3902501,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_255 = {
  NextStateId = 3902502,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_256 = {
  NextStateId = 3902500,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_257 = {
  NextStateId = 3902701,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_258 = {
  NextStateId = 3902702,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_259 = {
  NextStateId = 3902703,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_260 = {
  NextStateId = 3902700,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_261 = {
  NextStateId = 3902704,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_262 = {
  NextStateId = 3902705,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_263 = {
  NextStateId = 3902706,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_264 = {
  NextStateId = 3902707,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_265 = {
  [1] = r0_0.RT_264,
}
r0_0.RT_266 = {
  NextStateId = 3902710,
  TypeNextState = r0_0.RT_188,
}
r0_0.RT_267 = {
  NextStateId = 3902727,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_268 = {
  [1] = r0_0.RT_267,
}
r0_0.RT_269 = {
  NextStateId = 3902720,
  TypeNextState = r0_0.RT_25,
}
r0_0.RT_270 = {
  [1] = r0_0.RT_269,
}
r0_0.RT_271 = {
  NextStateId = 3902750,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_272 = {
  NextStateId = 3902757,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_273 = {
  [1] = r0_0.RT_272,
}
r0_0.RT_274 = {
  NextStateId = 3902792,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_275 = {
  NextStateId = 3902790,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_276 = {
  ActiveRange = 300,
  Type = "DistanceActive",
}
r0_0.RT_277 = {
  NextStateId = 3902901,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_278 = {
  NextStateId = 3902902,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_279 = {
  NextStateId = 3902900,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_280 = {
  NextStateId = 3903000,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_281 = {
  [1] = r0_0.RT_280,
}
r0_0.RT_282 = {
  NextStateId = 3903101,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_283 = {
  NextStateId = 3903102,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_284 = {
  [1] = r0_0.RT_282,
  [2] = r0_0.RT_283,
}
r0_0.RT_285 = {
  NextStateId = 3903201,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_286 = {
  NextStateId = 3903202,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_287 = {
  NextStateId = 3903203,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_288 = {
  NextStateId = 3903206,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_289 = {
  NextStateId = 3903204,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_290 = {
  NextStateId = 3903200,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_291 = {
  NextStateId = 3903205,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_292 = {
  NextStateId = 3903603,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_293 = {
  NextStateId = 3903604,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_294 = {
  NextStateId = 3904401,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_295 = {
  DeActiveRange = 1000,
  Type = "DistanceDeActive",
}
r0_0.RT_296 = {
  InteractiveId = 910,
  StateChangeParam = true,
  Type = "Interactive",
}
r0_0.RT_297 = {
  NextStateId = 4900103,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_298 = {
  NextStateId = 4900102,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_299 = {
  Function = "PlayMontage",
  Mesh = "Mesh",
  MontagePath = "AnimMontage\'/Game/AssetDesign/Item/MiniGame/JH_MiniGame_Montage.JH_MiniGame_Montage\'",
  SectionName = "Loop",
}
r0_0.RT_300 = {
  EffectId = 900024,
  Function = "PlayFX",
  Tag = "JHA",
}
r0_0.RT_301 = {
  EffectId = 900023,
  Function = "PlayFX",
  NeedFinish = false,
  Tag = "Niagara",
}
r0_0.RT_302 = {
  r0_0.RT_301
}
r0_0.RT_303 = {
  NextStateId = 4900712,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_304 = {
  Function = "StopFX",
  Tag = "JHB",
}
r0_0.RT_305 = {
  EffectId = 900025,
  Function = "PlayFX",
  Tag = "JHB",
}
r0_0.RT_306 = {
  Function = "StopFX",
  Tag = "JHA",
}
r0_0.RT_307 = {
  NextStateId = 4900710,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_308 = {
  Function = "PlayMontage",
  Mesh = "Mesh",
  MontagePath = "AnimMontage\'/Game/AssetDesign/Item/MiniGame/JH_MiniGame_Montage.JH_MiniGame_Montage\'",
  SectionName = "End",
}
r0_0.RT_309 = {
  r0_0.RT_119,
  r0_0.RT_308,
  r0_0.RT_306,
  r0_0.RT_22,
  r0_0.RT_304,
  r0_0.RT_57
}
r0_0.RT_310 = {
  Function = "PlayMontage",
  Mesh = "Mesh",
  MontagePath = "AnimMontage\'/Game/AssetDesign/Item/MiniGame/DG_MiniGame_Montage.DG_MiniGame_Montage\'",
  SectionName = "Loop",
}
r0_0.RT_311 = {
  EffectId = 900021,
  Function = "PlayFX",
  Tag = "DGA",
}
r0_0.RT_312 = {
  EffectId = 900020,
  Function = "PlayFX",
  NeedFinish = false,
  Tag = "Niagara",
}
r0_0.RT_313 = {
  r0_0.RT_312
}
r0_0.RT_314 = {
  NextStateId = 4900732,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_315 = {
  Function = "StopFX",
  Tag = "DGB",
}
r0_0.RT_316 = {
  EffectId = 900022,
  Function = "PlayFX",
  Tag = "DGB",
}
r0_0.RT_317 = {
  Function = "StopFX",
  Tag = "DGA",
}
r0_0.RT_318 = {
  NextStateId = 4900730,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_319 = {
  r0_0.RT_17,
  r0_0.RT_299,
  r0_0.RT_305,
  r0_0.RT_306,
  r0_0.RT_13
}
r0_0.RT_320 = {
  r0_0.RT_308
}
r0_0.RT_321 = {
  EventsNextState = r0_0.RT_320,
  NextStateId = 4900752,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_322 = {
  r0_0.RT_1,
  r0_0.RT_299,
  r0_0.RT_300,
  r0_0.RT_304,
  r0_0.RT_20,
  r0_0.RT_57
}
r0_0.RT_323 = {
  EffectId = 900023,
  Function = "PlayFX",
  NeedFinish = false,
  Tag = "Niagara2",
}
r0_0.RT_324 = {
  r0_0.RT_323
}
r0_0.RT_325 = {
  r0_0.RT_299,
  r0_0.RT_315,
  r0_0.RT_305,
  r0_0.RT_13
}
r0_0.RT_326 = {
  NextStateId = 4920011,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_327 = {
  r0_0.RT_196,
  r0_0.RT_22,
  r0_0.RT_9
}
r0_0.RT_328 = {
  NextStateId = 4920010,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_329 = {
  NextStateId = 4920012,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_330 = {
  NextStateId = 4920014,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_331 = {
  NextStateId = 4920015,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_332 = {
  EffectId = 900033,
  Function = "PlayFX",
  Tag = "Training",
}
r0_0.RT_333 = {
  NextStateId = 494001,
  TypeNextState = r0_0.RT_10,
}
r0_0.RT_334 = {
  [1] = r0_0.RT_333,
}
r0_0.RT_335 = {
  r0_0.RT_17,
  r0_0.RT_9
}
r0_0.RT_336 = {
  NextStateId = 495000,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_337 = {
  r0_0.RT_119,
  r0_0.RT_9,
  r0_0.RT_22
}
r0_0.RT_338 = {
  NextStateId = 501,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_339 = {
  r0_0.RT_119,
  r0_0.RT_57,
  r0_0.RT_22
}
r0_0.RT_340 = {
  NextStateId = 500,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_341 = {
  r0_0.RT_1,
  r0_0.RT_57,
  r0_0.RT_20
}
r0_0.RT_342 = {
  r0_0.RT_17,
  r0_0.RT_13
}
r0_0.RT_343 = {
  NextStateId = 510,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_344 = {
  Function = "StopFX",
  Tag = "Trap1",
}
r0_0.RT_345 = {
  Function = "StopFX",
  Tag = "Trap2",
}
r0_0.RT_346 = {
  Function = "PlayMontage",
  Mesh = "Mesh",
  MontagePath = "AnimMontage\'/Game/AssetDesign/Item/MiniGame/JH_MiniGame_Montage.JH_MiniGame_Montage\'",
  SectionName = "Idle",
}
r0_0.RT_347 = {
  CallBackName = "OnStart",
  Function = "PlayMontage",
  Mesh = "Mesh",
  MontagePath = "AnimMontage\'/Game/AssetDesign/Item/MiniGame/JH_MiniGame_Montage.JH_MiniGame_Montage\'",
  SectionName = "Start",
}
r0_0.RT_348 = {
  r0_0.RT_347
}
r0_0.RT_349 = {
  NextStateId = 581,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_350 = {
  NextStateId = 582,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_351 = {
  Function = "PlayMontage",
  Mesh = "Mesh",
  MontagePath = "AnimMontage\'/Game/AssetDesign/Item/MiniGame/DG_MiniGame_Montage.DG_MiniGame_Montage\'",
  SectionName = "Idle",
}
r0_0.RT_352 = {
  CallBackName = "OnStart",
  Function = "PlayMontage",
  Mesh = "Mesh",
  MontagePath = "AnimMontage\'/Game/AssetDesign/Item/MiniGame/DG_MiniGame_Montage.DG_MiniGame_Montage\'",
  SectionName = "Start",
}
r0_0.RT_353 = {
  r0_0.RT_352
}
r0_0.RT_354 = {
  NextStateId = 5531,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_355 = {
  NextStateId = 5431,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_356 = {
  r0_0.RT_119,
  r0_0.RT_9,
  r0_0.RT_299,
  r0_0.RT_305,
  r0_0.RT_306,
  r0_0.RT_13
}
r0_0.RT_357 = {
  NextStateId = 541,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_358 = {
  r0_0.RT_119,
  r0_0.RT_9
}
r0_0.RT_359 = {
  NextStateId = 542,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_360 = {
  r0_0.RT_119,
  r0_0.RT_9,
  r0_0.RT_310,
  r0_0.RT_316,
  r0_0.RT_317,
  r0_0.RT_13
}
r0_0.RT_361 = {
  NextStateId = 543,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_362 = {
  [1] = r0_0.RT_361,
}
r0_0.RT_363 = {
  EffectId = 209,
  Function = "PlayFX",
  Tag = "Niagara",
}
r0_0.RT_364 = {
  Function = "PlayMontage",
  Mesh = "Mesh",
  MontagePath = "AnimMontage\'/Game/AssetDesign/Item/MiniGame/DG_MiniGame_Montage.DG_MiniGame_Montage\'",
  SectionName = "End",
}
r0_0.RT_365 = {
  NextStateId = 591011,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_366 = {
  NextStateId = 591012,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_367 = {
  NextStateId = 591014,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_368 = {
  NextStateId = 591021,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_369 = {
  NextStateId = 591020,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_370 = {
  NextStateId = 592011,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_371 = {
  NextStateId = 592012,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_372 = {
  NextStateId = 592014,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_373 = {
  NextStateId = 595013,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_374 = {
  NextStateId = 595014,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_375 = {
  CallBackName = "OnStart",
  Function = "PlayMontage",
  Mesh = "Mesh",
  MontagePath = "AnimMontage\'/Game/BluePrints/Item/CombatProp/LaserMontage.LaserMontage\'",
  SectionName = "DeActive",
}
r0_0.RT_376 = {
  r0_0.RT_375
}
r0_0.RT_377 = {
  NextStateId = 601,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_378 = {
  NextStateId = 600,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_379 = {
  r0_0.RT_119,
  r0_0.RT_9,
  r0_0.RT_13
}
r0_0.RT_380 = {
  Function = "CreateSpecialMonster",
  RuleId = 1,
}
r0_0.RT_381 = {
  r0_0.RT_156,
  r0_0.RT_380
}
r0_0.RT_382 = {
  Function = "StopFX",
  Tag = "Bling",
}
r0_0.RT_383 = {
  r0_0.RT_17,
  r0_0.RT_382,
  r0_0.RT_151
}
r0_0.RT_384 = {
  EffectId = 900028,
  Function = "PlayFX",
  Tag = "Bomb",
}
r0_0.RT_385 = {
  r0_0.RT_384
}
r0_0.RT_386 = {
  EffectId = 900029,
  Function = "PlayFX",
  Tag = "Star",
}
r0_0.RT_387 = {
  r0_0.RT_386,
  r0_0.RT_382
}
r0_0.RT_388 = {
  InteractiveId = 91510,
  Type = "Interactive",
}
r0_0.RT_389 = {
  Function = "StopFX",
  Tag = "Star",
}
r0_0.RT_390 = {
  r0_0.RT_17,
  r0_0.RT_389,
  r0_0.RT_151
}
r0_0.RT_391 = {
  r0_0.RT_150,
  r0_0.RT_382
}
r0_0.RT_392 = {
  EffectId = 900032,
  Function = "PlayFX",
  Tag = "Star",
}
r0_0.RT_393 = {
  r0_0.RT_392
}
r0_0.RT_394 = {
  InteractiveId = 91505,
  Type = "Interactive",
}
r0_0.RT_395 = {
  NextStateId = 610023,
  TypeNextState = r0_0.RT_394,
}
r0_0.RT_396 = {
  [1] = r0_0.RT_395,
}
r0_0.RT_397 = {
  Function = "CreateSpecialMonster",
  RuleId = 2,
}
r0_0.RT_398 = {
  r0_0.RT_156,
  r0_0.RT_397
}
r0_0.RT_399 = {
  r0_0.RT_382,
  r0_0.RT_151
}
r0_0.RT_400 = {
  CallBackName = "OnNotifyBegin",
  Function = "PlayMontage",
  Mesh = "Mesh",
  MontagePath = "AnimMontage\'/Game/BluePrints/Item/CombatProp/LaserMontage.LaserMontage\'",
  SectionName = "Rise",
}
r0_0.RT_401 = {
  r0_0.RT_400
}
r0_0.RT_402 = {
  EffectId = 208,
  Function = "PlayFX",
  Tag = "Lock",
}
r0_0.RT_403 = {
  r0_0.RT_119,
  r0_0.RT_402
}
r0_0.RT_404 = {
  NextStateId = 701061,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_405 = {
  [1] = r0_0.RT_404,
}
r0_0.RT_406 = {
  EffectId = 209,
  Function = "PlayFX",
  Tag = "Unlock",
}
r0_0.RT_407 = {
  r0_0.RT_1,
  r0_0.RT_223,
  r0_0.RT_406,
  r0_0.RT_102
}
r0_0.RT_408 = {
  InteractiveId = 70000,
  Type = "Interactive",
}
r0_0.RT_409 = {
  InteractiveId = 70002,
  Type = "Interactive",
}
r0_0.RT_410 = {
  r0_0.RT_1,
  r0_0.RT_102
}
r0_0.RT_411 = {
  InteractiveId = 70003,
  Type = "Interactive",
}
r0_0.RT_412 = {
  EffectId = 212,
  Function = "PlayFX",
  Tag = "Start",
}
r0_0.RT_413 = {
  Color = "6E57FFFF",
  DeadTime = true,
  Function = "ChangeFX",
  Tag = "Niagara",
}
r0_0.RT_414 = {
  r0_0.RT_17,
  r0_0.RT_412,
  r0_0.RT_413
}
r0_0.RT_415 = {
  Function = "StopFX",
  Tag = "Niagara",
}
r0_0.RT_416 = {
  Function = "StopFX",
  Tag = "Start",
}
r0_0.RT_417 = {
  EffectId = 214,
  Function = "PlayFX",
  NotAttached = true,
  Tag = "ok",
}
r0_0.RT_418 = {
  r0_0.RT_415,
  r0_0.RT_416,
  r0_0.RT_417,
  r0_0.RT_211
}
r0_0.RT_419 = {
  r0_0.RT_415
}
r0_0.RT_420 = {
  Function = "InteractiveEffect",
}
r0_0.RT_421 = {
  Function = "AfterInteractiveEffect",
}
r0_0.RT_422 = {
  NextStateId = 703012,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_423 = {
  InteractiveId = 109,
  Type = "Interactive",
}
r0_0.RT_424 = {
  InteractiveId = 108,
  Type = "Interactive",
}
r0_0.RT_425 = {
  r0_0.RT_402
}
r0_0.RT_426 = {
  NextStateId = 704010,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_427 = {
  r0_0.RT_223,
  r0_0.RT_363
}
r0_0.RT_428 = {
  NextStateId = 704020,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_429 = {
  NextStateId = 704031,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_430 = {
  NextStateId = 704032,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_431 = {
  NextStateId = 704033,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_432 = {
  NextStateId = 704034,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_433 = {
  NextStateId = 704030,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_434 = {
  Function = "StopFX",
  Tag = "Die",
}
r0_0.RT_435 = {
  NextStateId = 705033,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_436 = {
  [1] = r0_0.RT_435,
}
r0_0.RT_437 = {
  Type = "LeaveTriggerBox",
}
r0_0.RT_438 = {
  NextStateId = 708001,
  TypeNextState = r0_0.RT_3,
}
r0_0.RT_439 = {
  [1] = r0_0.RT_438,
}
r0_0.RT_440 = {
  EffectId = 231,
  Function = "PlayFX",
  Tag = "inter",
}
r0_0.RT_441 = {
  r0_0.RT_440
}
r0_0.RT_442 = {
  Function = "StopFX",
  Tag = "Inter",
}
r0_0.RT_443 = {
  Function = "PlayMontage",
  Mesh = "Mesh_0",
  MontagePath = "AnimMontage\'/Game/AssetDesign/Item/MiniGame/DG_MiniGame_Montage.DG_MiniGame_Montage\'",
  SectionName = "Idle",
}
r0_0.RT_444 = {
  CallBackName = "OnStart",
  Function = "PlayMontage",
  Mesh = "Mesh_0",
  MontagePath = "AnimMontage\'/Game/AssetDesign/Item/MiniGame/DG_MiniGame_Montage.DG_MiniGame_Montage\'",
  SectionName = "Start",
}
r0_0.RT_445 = {
  r0_0.RT_444
}
r0_0.RT_446 = {
  Function = "PlayMontage",
  Mesh = "Mesh_0",
  MontagePath = "AnimMontage\'/Game/AssetDesign/Item/MiniGame/DG_MiniGame_Montage.DG_MiniGame_Montage\'",
  SectionName = "Loop",
}
r0_0.RT_447 = {
  r0_0.RT_446,
  r0_0.RT_311,
  r0_0.RT_20
}
r0_0.RT_448 = {
  CallBackName = "OnStart",
  Function = "PlayMontage",
  Mesh = "Mesh_0",
  MontagePath = "AnimMontage\'/Game/AssetDesign/Item/MiniGame/DG_MiniGame_Montage.DG_MiniGame_Montage\'",
  SectionName = "End",
}
r0_0.RT_449 = {
  r0_0.RT_448,
  r0_0.RT_317
}
r0_0.RT_450 = {
  r0_0.RT_317,
  r0_0.RT_22
}
r0_0.RT_451 = {
  EventsNextState = r0_0.RT_401,
  NextStateId = 780080,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_452 = {
  [1] = r0_0.RT_451,
}
r0_0.RT_453 = {
  Function = "PlayMontage",
  Mesh = "Mesh",
  MontagePath = "AnimMontage\'/Game/AssetDesign/Item/MiniGame/Dyn_Minigame_Tanceqi.Dyn_Minigame_Tanceqi\'",
  SectionName = "Idle",
}
r0_0.RT_454 = {
  r0_0.RT_453
}
r0_0.RT_455 = {
  NextStateId = 780100,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_456 = {
  [1] = r0_0.RT_455,
}
r0_0.RT_457 = {
  NextStateId = 780162,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_458 = {
  [1] = r0_0.RT_457,
}
r0_0.RT_459 = {
  NextStateId = 801130,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_460 = {
  NextStateId = 810010,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_461 = {
  [1] = r0_0.RT_460,
}
r0_0.RT_462 = {
  ConditionID = 20021501,
  Type = "Condition",
}
r0_0.RT_463 = {
  NextStateId = 9020001,
  TypeNextState = r0_0.RT_462,
}
r0_0.RT_464 = {
  [1] = r0_0.RT_463,
}
r0_0.RT_465 = {
  NextStateId = 904,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_466 = {
  r0_0.RT_11
}
r0_0.RT_467 = {
  NextStateId = 9043,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_468 = {
  [1] = r0_0.RT_467,
}
r0_0.RT_469 = {
  NextStateId = 90430,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_470 = {
  NextStateId = 90432,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_471 = {
  NextStateId = 90434,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_472 = {
  NextStateId = 90436,
  TypeNextState = r0_0.RT_4,
}
r0_0.RT_473 = {
  NextStateId = 90438,
  TypeNextState = r0_0.RT_4,
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [1930, 1930] id: 1
  return r1_1
end
local r3_0 = "MechanismState"
local r4_0 = {}
local r5_0 = {
  EventsCurrentState = r0_0.RT_2,
}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 3,
    TypeNextState = r0_0.RT_3,
  },
  [2] = {
    NextStateId = 2,
    TypeNextState = r0_0.RT_4,
  },
}
r5_0.StateId = 1
r4_0[1] = r5_0
r5_0 = {
  EventsCurrentState = r0_0.RT_120,
}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 1,
    TypeNextState = r0_0.RT_4,
  },
}
r5_0.StateId = 2
r4_0[2] = r5_0
r4_0[3] = {
  EventsCurrentState = r0_0.RT_92,
  StateId = 3,
}
r5_0 = {
  EventsCurrentState = r0_0.RT_159,
}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 5,
    TypeNextState = r0_0.RT_295,
  },
}
r5_0.StateId = 4
r4_0[4] = r5_0
r5_0 = {
  EventsCurrentState = r0_0.RT_158,
}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 4,
    TypeNextState = r0_0.RT_215,
  },
}
r5_0.StateId = 5
r4_0[5] = r5_0
r5_0 = {
  EventsCurrentState = r0_0.RT_159,
}
r5_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_376,
    NextStateId = 7,
    TypeNextState = r0_0.RT_295,
  },
}
r5_0.StateId = 6
r4_0[6] = r5_0
r5_0 = {
  EventsCurrentState = r0_0.RT_158,
}
r5_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_401,
    NextStateId = 6,
    TypeNextState = r0_0.RT_215,
  },
}
r5_0.StateId = 7
r4_0[7] = r5_0
r5_0 = {}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 11,
    TypeNextState = r0_0.RT_3,
  },
}
r5_0.StateId = 10
r4_0[10] = r5_0
r5_0 = {
  EventsCurrentState = r0_0.RT_92,
}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 10,
    TypeNextState = r0_0.RT_10,
  },
}
r5_0.StateId = 11
r4_0[11] = r5_0
r4_0[12] = {
  EventsCurrentState = {
    r0_0.RT_20,
    r0_0.RT_153
  },
  StateEvent = {
    [1] = r0_0.RT_154,
  },
  StateId = 12,
}
r5_0 = {
  EventsCurrentState = {
    r0_0.RT_17,
    r0_0.RT_13,
    {
      Function = "SetCanHatred",
      IsCan = true,
    }
  },
}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 14,
    TypeNextState = r0_0.RT_4,
  },
  [2] = r0_0.RT_168,
}
r5_0.StateId = 13
r4_0[13] = r5_0
r4_0[14] = {
  EventsCurrentState = {
    r0_0.RT_11,
    r0_0.RT_20,
    r0_0.RT_153
  },
  StateEvent = {
    [1] = r0_0.RT_154,
    [2] = r0_0.RT_168,
  },
  StateId = 14,
}
r4_0[15] = {
  EventsCurrentState = r0_0.RT_23,
  StateId = 15,
}
r4_0[25] = {
  EventsCurrentState = r0_0.RT_207,
  StateEvent = r0_0.RT_209,
  StateId = 25,
}
r5_0 = {
  EventsCurrentState = {
    r0_0.RT_1,
    {
      Function = "SetBubbleWidget",
      Show = true,
    }
  },
}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 27,
    TypeNextState = r0_0.RT_3,
  },
}
r5_0.StateId = 26
r4_0[26] = r5_0
r5_0 = {
  EventsCurrentState = r0_0.RT_92,
}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 26,
    TypeNextState = r0_0.RT_10,
  },
}
r5_0.StateId = 27
r4_0[27] = r5_0
r5_0 = {
  EventsCurrentState = r0_0.RT_210,
}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 29,
    TypeNextState = r0_0.RT_3,
  },
}
r5_0.StateId = 28
r4_0[28] = r5_0
r5_0 = {
  EventsCurrentState = r0_0.RT_92,
}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 28,
    TypeNextState = r0_0.RT_10,
  },
}
r5_0.StateId = 29
r4_0[29] = r5_0
r5_0 = {}
local r6_0 = "StateEvent"
local r7_0 = {}
r7_0[1] = {
  EventsNextState = {
    {
      EffectId = 200,
      Function = "PlayFX",
      NeedFinish = true,
      Tag = "NiagaraA",
    }
  },
  NextStateId = 31,
  TypeNextState = r0_0.RT_3,
}
r5_0[r6_0] = r7_0
r5_0.StateId = 30
r4_0[30] = r5_0
r4_0[31] = {
  EventsCurrentState = {
    r0_0.RT_17,
    {
      EffectId = 201,
      Function = "PlayFX",
      Tag = "NiagaraB",
    }
  },
  StateId = 31,
}
r5_0 = {}
r6_0 = "StateEvent"
r7_0 = {}
r7_0[1] = {
  EventsNextState = {
    r0_0.RT_212
  },
  NextStateId = 33,
  TypeNextState = r0_0.RT_3,
}
r5_0[r6_0] = r7_0
r5_0.StateId = 32
r4_0[32] = r5_0
r4_0[33] = {
  EventsCurrentState = r0_0.RT_92,
  StateId = 33,
}
r5_0 = {
  EventsCurrentState = r0_0.RT_2,
}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 35,
    TypeNextState = r0_0.RT_213,
  },
}
r5_0.StateId = 34
r4_0[34] = r5_0
r4_0[35] = {
  EventsCurrentState = r0_0.RT_92,
  StateId = 35,
}
r5_0 = {
  EventsCurrentState = r0_0.RT_120,
}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 34,
    TypeNextState = r0_0.RT_188,
  },
}
r5_0.StateId = 36
r4_0[36] = r5_0
r5_0 = {
  EventsCurrentState = r0_0.RT_2,
}
r7_0 = {}
r7_0[1] = {
  NextStateId = 39,
  TypeNextState = {
    InteractiveId = 909,
    StateChangeParam = false,
    Type = "Interactive",
  },
}
r5_0.StateEvent = r7_0
r5_0.StateId = 37
r4_0[37] = r5_0
r4_0[38] = {
  EventsCurrentState = r0_0.RT_92,
  StateId = 38,
}
r5_0 = {
  EventsCurrentState = r0_0.RT_120,
}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 37,
    TypeNextState = r0_0.RT_188,
  },
}
r5_0.StateId = 39
r4_0[39] = r5_0
r5_0 = {}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 41,
    TypeNextState = r0_0.RT_213,
  },
  [2] = {
    NextStateId = 42,
    TypeNextState = r0_0.RT_296,
  },
}
r5_0.StateId = 40
r4_0[40] = r5_0
r4_0[41] = {
  EventsCurrentState = r0_0.RT_92,
  StateId = 41,
}
r4_0[42] = {
  EventsCurrentState = r0_0.RT_92,
  StateId = 42,
}
r5_0 = {}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 44,
    TypeNextState = r0_0.RT_296,
  },
}
r5_0.StateId = 43
r4_0[43] = r5_0
r4_0[44] = {
  EventsCurrentState = r0_0.RT_92,
  StateId = 44,
}
r5_0 = {
  EventsCurrentState = {
    r0_0.RT_201,
    r0_0.RT_22
  },
}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 46,
    TypeNextState = r0_0.RT_4,
  },
}
r5_0.StateId = 45
r4_0[45] = r5_0
r4_0[46] = {
  EventsCurrentState = r0_0.RT_204,
  StateId = 46,
}
r5_0 = {
  EventsCurrentState = r0_0.RT_210,
}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 53,
    TypeNextState = r0_0.RT_215,
  },
}
r5_0.StateId = 52
r4_0[52] = r5_0
r5_0 = {
  EventsCurrentState = r0_0.RT_92,
}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 52,
    TypeNextState = r0_0.RT_247,
  },
}
r5_0.StateId = 53
r4_0[53] = r5_0
r5_0 = {
  EventsCurrentState = {
    r0_0.RT_346
  },
}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 55,
    TypeNextState = r0_0.RT_215,
  },
}
r5_0.StateId = 54
r4_0[54] = r5_0
r5_0 = {
  EventsCurrentState = {
    {
      Function = "PlayMontage",
      Mesh = "Mesh",
      MontagePath = "AnimMontage\'/Game/AssetDesign/Item/MiniGame/JH_MiniGame_Montage.JH_MiniGame_Montage\'",
      SectionName = "Start",
    }
  },
}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 56,
    TypeNextState = r0_0.RT_3,
  },
}
r5_0.StateId = 55
r4_0[55] = r5_0
r5_0 = {
  EventsCurrentState = {
    r0_0.RT_17,
    r0_0.RT_308
  },
}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 55,
    TypeNextState = r0_0.RT_10,
  },
}
r5_0.StateId = 56
r4_0[56] = r5_0
r5_0 = {
  EventsCurrentState = {
    {
      EffectId = 208,
      Function = "PlayFX",
      Tag = "ABC",
    }
  },
}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 58,
    TypeNextState = r0_0.RT_276,
  },
}
r5_0.StateId = 57
r4_0[57] = r5_0
r5_0 = {
  EventsCurrentState = {
    {
      Function = "StopFX",
      Tag = "ABC",
    },
    r0_0.RT_363
  },
}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 59,
    TypeNextState = r0_0.RT_3,
  },
}
r5_0.StateId = 58
r4_0[58] = r5_0
r4_0[59] = {
  EventsCurrentState = r0_0.RT_92,
  StateId = 59,
}
r4_0[60] = {
  StateId = 60,
}
r5_0 = {
  EventsCurrentState = {
    r0_0.RT_351
  },
}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 62,
    TypeNextState = r0_0.RT_215,
  },
}
r5_0.StateId = 61
r4_0[61] = r5_0
r5_0 = {
  EventsCurrentState = {
    {
      Function = "PlayMontage",
      Mesh = "Mesh",
      MontagePath = "AnimMontage\'/Game/AssetDesign/Item/MiniGame/DG_MiniGame_Montage.DG_MiniGame_Montage\'",
      SectionName = "Start",
    }
  },
}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 63,
    TypeNextState = r0_0.RT_3,
  },
}
r5_0.StateId = 62
r4_0[62] = r5_0
r5_0 = {
  EventsCurrentState = {
    r0_0.RT_17,
    r0_0.RT_364
  },
}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 62,
    TypeNextState = r0_0.RT_10,
  },
}
r5_0.StateId = 63
r4_0[63] = r5_0
r5_0 = {
  EventsCurrentState = r0_0.RT_2,
}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 65,
    TypeNextState = r0_0.RT_3,
  },
}
r5_0.StateId = 64
r4_0[64] = r5_0
r4_0[65] = {
  EventsCurrentState = {
    r0_0.RT_17,
    r0_0.RT_22
  },
  StateId = 65,
}
r5_0 = {}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 67,
    TypeNextState = r0_0.RT_4,
  },
}
r5_0.StateId = 66
r4_0[66] = r5_0
r5_0 = {}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 66,
    TypeNextState = r0_0.RT_4,
  },
}
r5_0.StateId = 67
r4_0[67] = r5_0
r5_0 = {
  EventsCurrentState = r0_0.RT_2,
}
r5_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_6,
    NextStateId = 101,
    TypeNextState = r0_0.RT_3,
  },
  [2] = {
    NextStateId = 102,
    TypeNextState = r0_0.RT_4,
  },
}
r5_0.StateId = 100
r4_0[100] = r5_0
r5_0 = {}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 100,
    TypeNextState = r0_0.RT_7,
  },
  [2] = {
    NextStateId = 102,
    TypeNextState = r0_0.RT_8,
  },
}
r5_0.StateId = 101
r4_0[101] = r5_0
r5_0 = {
  EventsCurrentState = {
    r0_0.RT_1,
    r0_0.RT_9
  },
}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 100,
    TypeNextState = r0_0.RT_10,
  },
}
r5_0.StateId = 102
r4_0[102] = r5_0
r5_0 = {}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 239,
    TypeNextState = r0_0.RT_4,
  },
}
r5_0.StateId = 238
r4_0[238] = r5_0
r4_0[239] = {
  EventsCurrentState = {
    r0_0.RT_102,
    r0_0.RT_78
  },
  StateId = 239,
}
r5_0 = {
  EventsCurrentState = {
    r0_0.RT_17,
    r0_0.RT_78
  },
}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 241,
    TypeNextState = r0_0.RT_4,
  },
  [2] = {
    NextStateId = 243,
    TypeNextState = r0_0.RT_4,
  },
}
r5_0.StateId = 240
r4_0[240] = r5_0
r5_0 = {
  EventsCurrentState = r0_0.RT_197,
}
r7_0 = {
  [1] = r0_0.RT_198,
}
r7_0[2] = {
  NextStateId = 240,
  TypeNextState = {
    InteractiveId = 911,
    StateChangeParam = true,
    Type = "Interactive",
  },
}
r5_0.StateEvent = r7_0
r5_0.StateId = 241
r4_0[241] = r5_0
r5_0 = {
  EventsCurrentState = {
    r0_0.RT_199
  },
}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 240,
    TypeNextState = r0_0.RT_200,
  },
}
r5_0.StateId = 242
r4_0[242] = r5_0
r5_0 = {
  EventsCurrentState = r0_0.RT_197,
}
r7_0 = {
  [1] = r0_0.RT_198,
}
r7_0[2] = {
  NextStateId = 240,
  TypeNextState = {
    InteractiveId = 913,
    StateChangeParam = true,
    Type = "Interactive",
  },
}
r5_0.StateEvent = r7_0
r5_0.StateId = 243
r4_0[243] = r5_0
r5_0 = {
  EventsCurrentState = r0_0.RT_202,
}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 245,
    TypeNextState = r0_0.RT_4,
  },
}
r5_0.StateId = 244
r4_0[244] = r5_0
r4_0[245] = {
  EventsCurrentState = r0_0.RT_204,
  StateEvent = {
    [1] = r0_0.RT_205,
  },
  StateId = 245,
}
r5_0 = {
  EventsCurrentState = r0_0.RT_202,
}
r5_0.StateEvent = {
  [1] = {
    NextStateId = 245,
    TypeNextState = r0_0.RT_200,
  },
  [2] = r0_0.RT_205,
}
r5_0.StateId = 246
r4_0[246] = r5_0
r5_0 = 300
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_1,
    {
      EffectId = 10199001,
      Function = "PlayFX",
      Tag = "Fire",
    }
  },
}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_6,
    NextStateId = 301,
    TypeNextState = r0_0.RT_3,
  },
  [2] = {
    NextStateId = 302,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 300
r4_0[r5_0] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 300,
    TypeNextState = r0_0.RT_7,
  },
  [2] = {
    NextStateId = 302,
    TypeNextState = r0_0.RT_8,
  },
}
r6_0.StateId = 301
r4_0[301] = r6_0
r4_0[302] = {
  EventsCurrentState = {
    r0_0.RT_211,
    r0_0.RT_9,
    {
      Function = "StopFX",
      Tag = "Fire",
    }
  },
  StateId = 302,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_337,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 502,
    TypeNextState = r0_0.RT_4,
  },
  [2] = r0_0.RT_338,
}
r6_0.StateId = 500
r4_0[500] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_339,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 502,
    TypeNextState = r0_0.RT_24,
  },
  [2] = r0_0.RT_340,
}
r6_0.StateId = 501
r4_0[501] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_341,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 503,
    TypeNextState = r0_0.RT_3,
  },
  [2] = r0_0.RT_340,
}
r6_0.StateId = 502
r4_0[502] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_342,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 502,
    TypeNextState = r0_0.RT_7,
  },
  [2] = {
    NextStateId = 504,
    TypeNextState = r0_0.RT_8,
  },
}
r6_0.StateId = 503
r4_0[503] = r6_0
r4_0[504] = {
  EventsCurrentState = r0_0.RT_337,
  StateEvent = {
    [1] = r0_0.RT_338,
    [2] = r0_0.RT_340,
  },
  StateId = 504,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_337,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 512,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 510
r4_0[510] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_339,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 512,
    TypeNextState = r0_0.RT_24,
  },
  [2] = r0_0.RT_343,
}
r6_0.StateId = 511
r4_0[511] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_341,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 513,
    TypeNextState = r0_0.RT_3,
  },
  [2] = r0_0.RT_343,
}
r6_0.StateId = 512
r4_0[512] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_342,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 512,
    TypeNextState = r0_0.RT_7,
  },
  [2] = {
    NextStateId = 514,
    TypeNextState = r0_0.RT_8,
  },
}
r6_0.StateId = 513
r4_0[513] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_337,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 511,
    TypeNextState = r0_0.RT_185,
  },
}
r6_0.StateId = 514
r4_0[514] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_337,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 511,
    TypeNextState = r0_0.RT_4,
  },
  [2] = r0_0.RT_343,
}
r6_0.StateId = 515
r4_0[515] = r6_0
r5_0 = 541
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_119,
    r0_0.RT_57,
    r0_0.RT_346,
    r0_0.RT_304,
    r0_0.RT_22
  },
}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_348,
    NextStateId = 551,
    TypeNextState = r0_0.RT_215,
  },
  [2] = r0_0.RT_349,
}
r6_0.StateId = 541
r4_0[r5_0] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_120,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 552,
    TypeNextState = r0_0.RT_4,
  },
  [2] = r0_0.RT_350,
}
r6_0.StateId = 542
r4_0[542] = r6_0
r5_0 = 543
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_119,
    r0_0.RT_57,
    r0_0.RT_351,
    r0_0.RT_315,
    r0_0.RT_22
  },
}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_353,
    NextStateId = 553,
    TypeNextState = r0_0.RT_24,
  },
  [2] = {
    NextStateId = 583,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 543
r4_0[r5_0] = r6_0
r5_0 = 551
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_1,
    r0_0.RT_57,
    r0_0.RT_299,
    r0_0.RT_306,
    r0_0.RT_300,
    r0_0.RT_20
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 561,
    TypeNextState = r0_0.RT_3,
  },
  [2] = r0_0.RT_349,
}
r6_0.StateId = 551
r4_0[r5_0] = r6_0
r5_0 = 552
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_1,
    r0_0.RT_57
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 562,
    TypeNextState = r0_0.RT_3,
  },
  [2] = r0_0.RT_350,
}
r6_0.StateId = 552
r4_0[r5_0] = r6_0
r5_0 = 553
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_1,
    r0_0.RT_57,
    r0_0.RT_310,
    r0_0.RT_317,
    r0_0.RT_311,
    r0_0.RT_20
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 563,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 553
r4_0[r5_0] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_56,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 551,
    TypeNextState = r0_0.RT_7,
  },
  [2] = {
    EventsNextState = r0_0.RT_302,
    NextStateId = 571,
    TypeNextState = r0_0.RT_8,
  },
}
r6_0.StateId = 561
r4_0[561] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_92,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 552,
    TypeNextState = r0_0.RT_7,
  },
  [2] = {
    NextStateId = 572,
    TypeNextState = r0_0.RT_8,
  },
}
r6_0.StateId = 562
r4_0[562] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_56,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 553,
    TypeNextState = r0_0.RT_7,
  },
  [2] = {
    EventsNextState = r0_0.RT_313,
    NextStateId = 573,
    TypeNextState = r0_0.RT_8,
  },
}
r6_0.StateId = 563
r4_0[563] = r6_0
r4_0[571] = {
  EventsCurrentState = r0_0.RT_356,
  StateEvent = {
    [1] = r0_0.RT_357,
    [2] = r0_0.RT_349,
  },
  StateId = 571,
}
r4_0[572] = {
  EventsCurrentState = r0_0.RT_358,
  StateEvent = {
    [1] = r0_0.RT_359,
    [2] = r0_0.RT_350,
  },
  StateId = 572,
}
r4_0[573] = {
  EventsCurrentState = r0_0.RT_360,
  StateEvent = r0_0.RT_362,
  StateId = 573,
}
r4_0[581] = {
  EventsCurrentState = {
    r0_0.RT_119,
    r0_0.RT_9,
    r0_0.RT_308,
    r0_0.RT_306,
    r0_0.RT_304,
    r0_0.RT_22
  },
  StateEvent = {
    [1] = r0_0.RT_357,
  },
  StateId = 581,
}
r4_0[582] = {
  EventsCurrentState = r0_0.RT_358,
  StateEvent = {
    [1] = r0_0.RT_359,
  },
  StateId = 582,
}
r4_0[583] = {
  EventsCurrentState = {
    r0_0.RT_364,
    r0_0.RT_9,
    r0_0.RT_317,
    r0_0.RT_315,
    r0_0.RT_22
  },
  StateEvent = r0_0.RT_362,
  StateId = 583,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_337,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 602,
    TypeNextState = r0_0.RT_4,
  },
  [2] = r0_0.RT_377,
}
r6_0.StateId = 600
r4_0[600] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_339,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 602,
    TypeNextState = r0_0.RT_24,
  },
  [2] = r0_0.RT_378,
}
r6_0.StateId = 601
r4_0[601] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_341,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 603,
    TypeNextState = r0_0.RT_3,
  },
  [2] = r0_0.RT_378,
}
r6_0.StateId = 602
r4_0[602] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_56,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 602,
    TypeNextState = r0_0.RT_7,
  },
  [2] = {
    NextStateId = 604,
    TypeNextState = r0_0.RT_8,
  },
}
r6_0.StateId = 603
r4_0[603] = r6_0
r4_0[604] = {
  EventsCurrentState = r0_0.RT_379,
  StateEvent = {
    [1] = r0_0.RT_377,
    [2] = r0_0.RT_378,
  },
  StateId = 604,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_158,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 901,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 900
r4_0[900] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_159,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 900,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 901
r4_0[901] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 903,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 902
r4_0[902] = r6_0
r4_0[903] = {
  StateEvent = {
    [1] = r0_0.RT_465,
  },
  StateId = 903,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_466,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 905,
    TypeNextState = r0_0.RT_14,
  },
  [2] = {
    NextStateId = 907,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 904
r4_0[904] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_92,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 904,
    TypeNextState = r0_0.RT_14,
  },
  [2] = {
    NextStateId = 906,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 905
r4_0[905] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_466,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 907,
    TypeNextState = r0_0.RT_14,
  },
  [2] = {
    NextStateId = 905,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 906
r4_0[906] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_92,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 906,
    TypeNextState = r0_0.RT_14,
  },
  [2] = r0_0.RT_465,
}
r6_0.StateId = 907
r4_0[907] = r6_0
r5_0 = 908
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_11,
    r0_0.RT_19
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 909,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 908
r4_0[r5_0] = r6_0
r5_0 = 909
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_17,
    r0_0.RT_12
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 908,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 909
r4_0[r5_0] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_2,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1802,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 1801
r4_0[1801] = r6_0
r4_0[1802] = {
  EventsCurrentState = r0_0.RT_92,
  StateId = 1802,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_207,
}
local r8_0 = {}
r8_0[1] = {
  NextStateId = 26,
  TypeNextState = {
    ConditionID = 310,
    Type = "Condition",
  },
}
r6_0.StateEvent = r8_0
r6_0.StateId = 2501
r4_0[2501] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_207,
}
r8_0 = {}
r8_0[1] = {
  NextStateId = 26,
  TypeNextState = {
    ConditionID = 311,
    Type = "Condition",
  },
}
r6_0.StateEvent = r8_0
r6_0.StateId = 2502
r4_0[2502] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_207,
}
r8_0 = {}
r8_0[1] = {
  NextStateId = 26,
  TypeNextState = {
    ConditionID = 312,
    Type = "Condition",
  },
}
r6_0.StateEvent = r8_0
r6_0.StateId = 2503
r4_0[2503] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_207,
}
r8_0 = {}
r8_0[1] = {
  NextStateId = 26,
  TypeNextState = {
    ConditionID = 313,
    Type = "Condition",
  },
}
r6_0.StateEvent = r8_0
r6_0.StateId = 2504
r4_0[2504] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_207,
}
r8_0 = {}
r8_0[1] = {
  NextStateId = 26,
  TypeNextState = {
    ConditionID = 314,
    Type = "Condition",
  },
}
r6_0.StateEvent = r8_0
r6_0.StateId = 2505
r4_0[2505] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_207,
}
r8_0 = {}
r8_0[1] = {
  NextStateId = 26,
  TypeNextState = {
    ConditionID = 315,
    Type = "Condition",
  },
}
r6_0.StateEvent = r8_0
r6_0.StateId = 2506
r4_0[2506] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_207,
}
r8_0 = {}
r8_0[1] = {
  NextStateId = 26,
  TypeNextState = {
    ConditionID = 316,
    Type = "Condition",
  },
}
r6_0.StateEvent = r8_0
r6_0.StateId = 2507
r4_0[2507] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_207,
}
r8_0 = {}
r8_0[1] = {
  NextStateId = 26,
  TypeNextState = {
    ConditionID = 317,
    Type = "Condition",
  },
}
r6_0.StateEvent = r8_0
r6_0.StateId = 2508
r4_0[2508] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_207,
}
r8_0 = {}
r8_0[1] = {
  NextStateId = 26,
  TypeNextState = {
    ConditionID = 318,
    Type = "Condition",
  },
}
r6_0.StateEvent = r8_0
r6_0.StateId = 2509
r4_0[2509] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_207,
}
r8_0 = {}
r8_0[1] = {
  NextStateId = 26,
  TypeNextState = {
    ConditionID = 319,
    Type = "Condition",
  },
}
r6_0.StateEvent = r8_0
r6_0.StateId = 2510
r4_0[2510] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_207,
}
r8_0 = {}
r8_0[1] = {
  NextStateId = 26,
  TypeNextState = {
    ConditionID = 320,
    Type = "Condition",
  },
}
r6_0.StateEvent = r8_0
r6_0.StateId = 2511
r4_0[2511] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_207,
}
r8_0 = {}
r8_0[1] = {
  NextStateId = 26,
  TypeNextState = {
    ConditionID = 321,
    Type = "Condition",
  },
}
r6_0.StateEvent = r8_0
r6_0.StateId = 2512
r4_0[2512] = r6_0
r4_0[2513] = {
  EventsCurrentState = r0_0.RT_207,
  StateEvent = r0_0.RT_209,
  StateId = 2513,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_207,
}
r8_0 = {}
r8_0[1] = {
  NextStateId = 26,
  TypeNextState = {
    ConditionID = 323,
    Type = "Condition",
  },
}
r6_0.StateEvent = r8_0
r6_0.StateId = 2514
r4_0[2514] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_207,
}
r8_0 = {}
r8_0[1] = {
  NextStateId = 26,
  TypeNextState = {
    ConditionID = 324,
    Type = "Condition",
  },
}
r6_0.StateEvent = r8_0
r6_0.StateId = 2515
r4_0[2515] = r6_0
r5_0 = 5431
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_119,
    r0_0.RT_57,
    r0_0.RT_351,
    r0_0.RT_9,
    r0_0.RT_22,
    r0_0.RT_317,
    r0_0.RT_315
  },
}
r6_0.StateEvent = {
  [1] = r0_0.RT_354,
  [2] = {
    NextStateId = 5731,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 5431
r4_0[r5_0] = r6_0
r5_0 = 5531
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_1,
    r0_0.RT_57,
    r0_0.RT_310,
    r0_0.RT_317,
    r0_0.RT_311,
    r0_0.RT_315,
    r0_0.RT_20
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 5731,
    TypeNextState = r0_0.RT_3,
  },
  [2] = r0_0.RT_355,
}
r6_0.StateId = 5531
r4_0[r5_0] = r6_0
r4_0[5731] = {
  EventsCurrentState = r0_0.RT_360,
  StateEvent = {
    [1] = r0_0.RT_355,
    [2] = r0_0.RT_354,
  },
  StateId = 5731,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 9042,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 9041
r4_0[9041] = r6_0
r4_0[9042] = {
  StateId = 9042,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 9043
r4_0[9043] = r6_0
r6_0 = {}
r8_0 = {}
r8_0[1] = {
  NextStateId = 9045,
  TypeNextState = {
    InteractiveId = 118,
    Type = "Interactive",
  },
}
r6_0.StateEvent = r8_0
r6_0.StateId = 9044
r4_0[9044] = r6_0
r4_0[9045] = {
  StateId = 9045,
}
r4_0[90430] = {
  StateEvent = r0_0.RT_468,
  StateId = 90430,
}
r4_0[90432] = {
  StateEvent = r0_0.RT_468,
  StateId = 90432,
}
r4_0[90434] = {
  StateEvent = r0_0.RT_468,
  StateId = 90434,
}
r4_0[90436] = {
  StateEvent = r0_0.RT_468,
  StateId = 90436,
}
r4_0[90438] = {
  StateEvent = r0_0.RT_468,
  StateId = 90438,
}
r5_0 = 104010
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_11,
    r0_0.RT_12,
    r0_0.RT_13
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 104011,
    TypeNextState = r0_0.RT_14,
  },
  [2] = r0_0.RT_15,
  [3] = r0_0.RT_16,
}
r6_0.StateId = 104010
r4_0[r5_0] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_18,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 104010,
    TypeNextState = r0_0.RT_14,
  },
  [2] = r0_0.RT_15,
  [3] = r0_0.RT_16,
}
r6_0.StateId = 104011
r4_0[104011] = r6_0
r4_0[104012] = {
  EventsCurrentState = {
    r0_0.RT_11,
    r0_0.RT_19,
    r0_0.RT_20
  },
  StateEvent = {
    [1] = r0_0.RT_21,
    [2] = r0_0.RT_16,
  },
  StateId = 104012,
}
r4_0[104013] = {
  EventsCurrentState = {
    r0_0.RT_11,
    {
      DoorType = 2,
      Function = "SetConditionDoorState",
    },
    r0_0.RT_22
  },
  StateEvent = {
    [1] = r0_0.RT_21,
    [2] = r0_0.RT_15,
  },
  StateId = 104013,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_23,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 104071,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 104070
r4_0[104070] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_18,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 104070,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 104071
r4_0[104071] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 105011,
    TypeNextState = r0_0.RT_24,
  },
}
r6_0.StateId = 105010
r4_0[105010] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 105012,
    TypeNextState = r0_0.RT_25,
  },
}
r6_0.StateId = 105011
r4_0[105011] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 105010,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 105012
r4_0[105012] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 106051,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 106050
r4_0[106050] = r6_0
r4_0[106051] = {
  StateId = 106051,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 108011,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 108010
r4_0[108010] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 108010,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 108011
r4_0[108011] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_90,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 109011,
    TypeNextState = r0_0.RT_4,
  },
  [2] = {
    NextStateId = 109013,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 109010
r4_0[109010] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = r0_0.RT_91,
  [2] = {
    NextStateId = 109012,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 109011
r4_0[109011] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = r0_0.RT_91,
  [2] = {
    NextStateId = 109011,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 109012
r4_0[109012] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = r0_0.RT_91,
  [2] = {
    NextStateId = 109014,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 109013
r4_0[109013] = r6_0
r4_0[109014] = {
  StateEvent = {
    [1] = r0_0.RT_91,
  },
  StateId = 109014,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 110081,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 110080
r4_0[110080] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 110080,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 110081
r4_0[110081] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_31,
}
r6_0.StateEvent = {
  [1] = r0_0.RT_93,
  [2] = {
    NextStateId = 111013,
    TypeNextState = r0_0.RT_4,
  },
  [3] = {
    NextStateId = 111015,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 111010
r4_0[111010] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_29,
}
r6_0.StateEvent = {
  [1] = r0_0.RT_94,
  [2] = {
    NextStateId = 111012,
    TypeNextState = r0_0.RT_95,
  },
}
r6_0.StateId = 111011
r4_0[111011] = r6_0
r4_0[111012] = {
  EventsCurrentState = r0_0.RT_96,
  StateEvent = {
    [1] = r0_0.RT_94,
    [2] = r0_0.RT_93,
  },
  StateId = 111012,
}
r4_0[111013] = {
  EventsCurrentState = r0_0.RT_29,
  StateEvent = {
    [1] = r0_0.RT_94,
    [2] = r0_0.RT_97,
  },
  StateId = 111013,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_96,
}
r6_0.StateEvent = {
  [1] = r0_0.RT_94,
  [2] = r0_0.RT_99,
  [3] = {
    NextStateId = 111015,
    TypeNextState = r0_0.RT_95,
  },
  [4] = r0_0.RT_100,
}
r6_0.StateId = 111014
r4_0[111014] = r6_0
r4_0[111015] = {
  EventsCurrentState = r0_0.RT_96,
  StateEvent = {
    [1] = r0_0.RT_94,
    [2] = r0_0.RT_99,
    [3] = r0_0.RT_97,
    [4] = r0_0.RT_100,
  },
  StateId = 111015,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_44,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 111017,
    TypeNextState = r0_0.RT_95,
  },
}
r6_0.StateId = 111016
r4_0[111016] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_31,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 111016,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 111017
r4_0[111017] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_50,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 111021,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 111020
r4_0[111020] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_50,
}
r8_0 = {
  [1] = r0_0.RT_101,
}
r8_0[2] = {
  NextStateId = 111022,
  TypeNextState = {
    NeedCountDown = true,
    Param = 30,
    Type = "Time",
  },
}
r6_0.StateEvent = r8_0
r6_0.StateId = 111021
r4_0[111021] = r6_0
r5_0 = 111022
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_20,
    r0_0.RT_102
  },
}
r6_0.StateEvent = {
  [1] = r0_0.RT_101,
  [2] = {
    NextStateId = 111023,
    TypeNextState = r0_0.RT_95,
  },
}
r6_0.StateId = 111022
r4_0[r5_0] = r6_0
r4_0[111023] = {
  EventsCurrentState = r0_0.RT_96,
  StateEvent = {
    [1] = r0_0.RT_101,
  },
  StateId = 111023,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_26,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 111031,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 111030
r4_0[111030] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_44,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 111032,
    TypeNextState = r0_0.RT_95,
  },
  [2] = r0_0.RT_103,
}
r6_0.StateId = 111031
r4_0[111031] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_31,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 111033,
    TypeNextState = r0_0.RT_104,
  },
  [2] = r0_0.RT_103,
}
r6_0.StateId = 111032
r4_0[111032] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_29,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 111034,
    TypeNextState = r0_0.RT_95,
  },
  [2] = r0_0.RT_103,
}
r6_0.StateId = 111033
r4_0[111033] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_96,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 111031,
    TypeNextState = r0_0.RT_104,
  },
  [2] = r0_0.RT_103,
}
r6_0.StateId = 111034
r4_0[111034] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_51,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 111041,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 111040
r4_0[111040] = r6_0
r4_0[111041] = {
  EventsCurrentState = r0_0.RT_44,
  StateEvent = {
    [1] = r0_0.RT_105,
    [2] = r0_0.RT_106,
  },
  StateId = 111041,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_29,
}
r6_0.StateEvent = {
  [1] = r0_0.RT_105,
  [2] = r0_0.RT_107,
  [3] = {
    NextStateId = 111043,
    TypeNextState = r0_0.RT_95,
  },
}
r6_0.StateId = 111042
r4_0[111042] = r6_0
r4_0[111043] = {
  EventsCurrentState = r0_0.RT_29,
  StateEvent = {
    [1] = r0_0.RT_105,
    [2] = r0_0.RT_107,
    [3] = r0_0.RT_106,
  },
  StateId = 111043,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_108,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 112011,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 112010
r4_0[112010] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_109,
}
r6_0.StateEvent = {
  [1] = r0_0.RT_110,
  [2] = {
    NextStateId = 112012,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 112011
r4_0[112011] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_108,
}
r6_0.StateEvent = {
  [1] = r0_0.RT_110,
  [2] = {
    NextStateId = 112013,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 112012
r4_0[112012] = r6_0
r4_0[112013] = {
  EventsCurrentState = r0_0.RT_108,
  StateId = 112013,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_120,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 115011,
    TypeNextState = r0_0.RT_3,
  },
  [2] = {
    NextStateId = 115012,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 115010
r4_0[115010] = r6_0
r4_0[115011] = {
  StateId = 115011,
}
r4_0[115012] = {
  StateId = 115012,
}
r4_0[116010] = {
  StateEvent = {
    [1] = r0_0.RT_125,
    [2] = r0_0.RT_126,
    [3] = r0_0.RT_127,
    [4] = r0_0.RT_128,
    [5] = r0_0.RT_129,
  },
  StateId = 116010,
}
r4_0[116011] = {
  StateEvent = {
    [1] = r0_0.RT_130,
    [2] = r0_0.RT_126,
    [3] = r0_0.RT_127,
    [4] = r0_0.RT_128,
    [5] = r0_0.RT_129,
  },
  StateId = 116011,
}
r4_0[116012] = {
  StateEvent = {
    [1] = r0_0.RT_130,
    [2] = r0_0.RT_125,
    [3] = r0_0.RT_127,
    [4] = r0_0.RT_128,
    [5] = r0_0.RT_129,
  },
  StateId = 116012,
}
r4_0[116013] = {
  StateEvent = {
    [1] = r0_0.RT_130,
    [2] = r0_0.RT_125,
    [3] = r0_0.RT_126,
    [4] = r0_0.RT_128,
    [5] = r0_0.RT_129,
  },
  StateId = 116013,
}
r4_0[116014] = {
  StateEvent = {
    [1] = r0_0.RT_130,
    [2] = r0_0.RT_125,
    [3] = r0_0.RT_126,
    [4] = r0_0.RT_127,
    [5] = r0_0.RT_129,
  },
  StateId = 116014,
}
r4_0[116015] = {
  StateEvent = {
    [1] = r0_0.RT_130,
    [2] = r0_0.RT_125,
    [3] = r0_0.RT_126,
    [4] = r0_0.RT_127,
    [5] = r0_0.RT_128,
  },
  StateId = 116015,
}
r4_0[118001] = {
  EventsCurrentState = r0_0.RT_51,
  StateEvent = {
    [1] = r0_0.RT_132,
    [2] = r0_0.RT_133,
    [3] = r0_0.RT_134,
  },
  StateId = 118001,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_51,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 118003,
    TypeNextState = r0_0.RT_4,
  },
  [2] = r0_0.RT_133,
}
r6_0.StateId = 118002
r4_0[118002] = r6_0
r4_0[118003] = {
  EventsCurrentState = r0_0.RT_136,
  StateEvent = {
    [1] = r0_0.RT_137,
    [2] = r0_0.RT_133,
    [3] = r0_0.RT_132,
    [4] = r0_0.RT_134,
  },
  StateId = 118003,
}
r4_0[118004] = {
  EventsCurrentState = r0_0.RT_36,
  StateEvent = r0_0.RT_138,
  StateId = 118004,
}
r4_0[118005] = {
  EventsCurrentState = r0_0.RT_136,
  StateEvent = r0_0.RT_138,
  StateId = 118005,
}
r4_0[118010] = {
  EventsCurrentState = r0_0.RT_51,
  StateEvent = {
    [1] = r0_0.RT_139,
    [2] = r0_0.RT_140,
  },
  StateId = 118010,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_51,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 118012,
    TypeNextState = r0_0.RT_3,
  },
  [2] = r0_0.RT_141,
  [3] = r0_0.RT_140,
}
r6_0.StateId = 118011
r4_0[118011] = r6_0
r4_0[118012] = {
  EventsCurrentState = r0_0.RT_142,
  StateEvent = r0_0.RT_144,
  StateId = 118012,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_51,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 118014,
    TypeNextState = r0_0.RT_3,
  },
  [2] = r0_0.RT_141,
  [3] = r0_0.RT_139,
}
r6_0.StateId = 118013
r4_0[118013] = r6_0
r4_0[118014] = {
  EventsCurrentState = r0_0.RT_142,
  StateEvent = r0_0.RT_144,
  StateId = 118014,
}
r4_0[118015] = {
  EventsCurrentState = r0_0.RT_136,
  StateId = 118015,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_44,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 118017,
    TypeNextState = r0_0.RT_14,
  },
}
r6_0.StateId = 118016
r4_0[118016] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_36,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 118016,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 118017
r4_0[118017] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 118019,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 118018
r4_0[118018] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 118018,
    TypeNextState = r0_0.RT_4,
  },
  [2] = {
    NextStateId = 118020,
    TypeNextState = r0_0.RT_4,
  },
  [3] = r0_0.RT_145,
}
r6_0.StateId = 118019
r4_0[118019] = r6_0
r4_0[118020] = {
  StateEvent = {
    [1] = r0_0.RT_145,
  },
  StateId = 118020,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 118022,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 118021
r4_0[118021] = r6_0
r4_0[118022] = {
  StateId = 118022,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_147,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 118024,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 118023
r4_0[118023] = r6_0
r5_0 = 118024
r6_0 = {
  EventsCurrentState = r0_0.RT_149,
}
r7_0 = "StateEvent"
r8_0 = {}
r8_0[1] = {
  EventsNextState = {
    r0_0.RT_150
  },
  NextStateId = 118025,
  TypeNextState = r0_0.RT_4,
}
r6_0[r7_0] = r8_0
r6_0.StateId = 118024
r4_0[r5_0] = r6_0
r4_0[118025] = {
  EventsCurrentState = r0_0.RT_152,
  StateId = 118025,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_51,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 118010,
    TypeNextState = r0_0.RT_4,
  },
  [2] = r0_0.RT_139,
}
r6_0.StateId = 118026
r4_0[118026] = r6_0
r4_0[390011] = {
  EventsCurrentState = r0_0.RT_159,
  StateId = 390011,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_158,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 390011,
    TypeNextState = r0_0.RT_215,
  },
}
r6_0.StateId = 390012
r4_0[390012] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_227,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 390061,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 390060
r4_0[390060] = r6_0
r4_0[390061] = {
  EventsCurrentState = r0_0.RT_228,
  StateId = 390061,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 492062,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 492061
r4_0[492061] = r6_0
r4_0[492062] = {
  EventsCurrentState = r0_0.RT_152,
  StateId = 492062,
}
r5_0 = 493011
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_146,
    r0_0.RT_13
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 493012,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 493011
r4_0[r5_0] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_36,
}
r8_0 = {}
r8_0[1] = {
  NextStateId = 493013,
  TypeNextState = {
    Param = 3.5,
    Type = "Time",
  },
}
r6_0.StateEvent = r8_0
r6_0.StateId = 493012
r4_0[493012] = r6_0
r4_0[493013] = {
  EventsCurrentState = {
    r0_0.RT_148,
    r0_0.RT_35
  },
  StateId = 493013,
}
r4_0[494000] = {
  EventsCurrentState = {
    r0_0.RT_332
  },
  StateEvent = r0_0.RT_334,
  StateId = 494000,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_2,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 494002,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 494001
r4_0[494001] = r6_0
r4_0[494002] = {
  EventsCurrentState = r0_0.RT_335,
  StateEvent = r0_0.RT_334,
  StateId = 494002,
}
r5_0 = 494003
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_1,
    r0_0.RT_332
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 494004,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 494003
r4_0[r5_0] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_335,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 494003,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 494004
r4_0[494004] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 495001,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 495000
r4_0[495000] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 495002,
    TypeNextState = r0_0.RT_3,
  },
  [2] = r0_0.RT_336,
}
r6_0.StateId = 495001
r4_0[495001] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_92,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 495003,
    TypeNextState = r0_0.RT_8,
  },
  [2] = {
    NextStateId = 495001,
    TypeNextState = r0_0.RT_7,
  },
}
r6_0.StateId = 495002
r4_0[495002] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_90,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 495004,
    TypeNextState = r0_0.RT_48,
  },
}
r6_0.StateId = 495003
r4_0[495003] = r6_0
r4_0[495004] = {
  StateEvent = {
    [1] = r0_0.RT_336,
  },
  StateId = 495004,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_158,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 496002,
    TypeNextState = r0_0.RT_215,
  },
}
r6_0.StateId = 496001
r4_0[496001] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_159,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 496003,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 496002
r4_0[496002] = r6_0
r4_0[496003] = {
  EventsCurrentState = r0_0.RT_146,
  StateId = 496003,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_244,
}
r8_0 = {}
r8_0[1] = {
  NextStateId = 496032,
  TypeNextState = {
    ActiveRange = 7000,
    Type = "DistanceActive",
  },
}
r6_0.StateEvent = r8_0
r6_0.StateId = 496031
r4_0[496031] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_246,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 496031,
    TypeNextState = r0_0.RT_4,
  },
  [2] = r0_0.RT_245,
}
r6_0.StateId = 496032
r4_0[496032] = r6_0
r4_0[496033] = {
  EventsCurrentState = r0_0.RT_244,
  StateId = 496033,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 521011,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 520110
r4_0[520110] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_344,
    NextStateId = 521012,
    TypeNextState = r0_0.RT_14,
  },
  [2] = {
    EventsNextState = r0_0.RT_344,
    NextStateId = 521010,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 520111
r4_0[520111] = r6_0
r5_0 = 520112
r6_0 = {
  EventsCurrentState = {
    {
      EffectId = 212,
      Function = "PlayFX",
      Tag = "Trap2",
    }
  },
}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_345,
    NextStateId = 521011,
    TypeNextState = r0_0.RT_162,
  },
  [2] = {
    EventsNextState = r0_0.RT_345,
    NextStateId = 521010,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 520112
r4_0[r5_0] = r6_0
r4_0[591010] = {
  StateEvent = {
    [1] = r0_0.RT_365,
  },
  StateId = 591010,
}
r4_0[591011] = {
  StateEvent = {
    [1] = r0_0.RT_366,
  },
  StateId = 591011,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 591013,
    TypeNextState = r0_0.RT_4,
  },
  [2] = r0_0.RT_367,
}
r6_0.StateId = 591012
r4_0[591012] = r6_0
r4_0[591013] = {
  StateEvent = {
    [1] = r0_0.RT_367,
  },
  StateId = 591013,
}
r4_0[591014] = {
  StateEvent = {
    [1] = r0_0.RT_365,
    [2] = r0_0.RT_366,
  },
  StateId = 591014,
}
r4_0[591020] = {
  StateEvent = {
    [1] = r0_0.RT_368,
  },
  StateId = 591020,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = r0_0.RT_369,
  [2] = {
    NextStateId = 591022,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 591021
r4_0[591021] = r6_0
r4_0[591022] = {
  StateEvent = {
    [1] = r0_0.RT_369,
    [2] = r0_0.RT_368,
  },
  StateId = 591022,
}
r4_0[592010] = {
  StateEvent = {
    [1] = r0_0.RT_370,
  },
  StateId = 592010,
}
r4_0[592011] = {
  StateEvent = {
    [1] = r0_0.RT_371,
  },
  StateId = 592011,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 592013,
    TypeNextState = r0_0.RT_4,
  },
  [2] = r0_0.RT_372,
}
r6_0.StateId = 592012
r4_0[592012] = r6_0
r4_0[592013] = {
  StateEvent = {
    [1] = r0_0.RT_372,
  },
  StateId = 592013,
}
r4_0[592014] = {
  StateEvent = {
    [1] = r0_0.RT_370,
    [2] = r0_0.RT_371,
  },
  StateId = 592014,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 595011,
    TypeNextState = r0_0.RT_4,
  },
  [2] = {
    NextStateId = 595012,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 595010
r4_0[595010] = r6_0
r4_0[595011] = {
  StateEvent = {
    [1] = r0_0.RT_373,
    [2] = r0_0.RT_374,
  },
  StateId = 595011,
}
r4_0[595012] = {
  StateEvent = {
    [1] = r0_0.RT_374,
    [2] = r0_0.RT_373,
  },
  StateId = 595012,
}
r4_0[595013] = {
  StateId = 595013,
}
r4_0[595014] = {
  StateId = 595014,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 596011,
    TypeNextState = r0_0.RT_4,
  },
  [2] = {
    NextStateId = 596012,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 596010
r4_0[596010] = r6_0
r4_0[596011] = {
  StateId = 596011,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 596013,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 596012
r4_0[596012] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 596014,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 596013
r4_0[596013] = r6_0
r4_0[596014] = {
  StateId = 596014,
}
r5_0 = 600110
r6_0 = {
  EventsCurrentState = {
    {
      Function = "PlayMontage",
      Mesh = "Mesh",
      MontagePath = "AnimMontage\'/Game/Asset/Scene/common/InterProps/Animation/Tele/Ani_Tele02_Montage2.Ani_Tele02_Montage2\'",
      SectionName = "Idle",
    },
    r0_0.RT_1,
    {
      EffectId = 10199004,
      Function = "PlayFX",
      Tag = "BirdIdle",
    }
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 600111,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 600110
r4_0[r5_0] = r6_0
r5_0 = 600111
r6_0 = {
  EventsCurrentState = {
    {
      Function = "PlayMontage",
      Mesh = "Mesh",
      MontagePath = "AnimMontage\'/Game/Asset/Scene/common/InterProps/Animation/Tele/Ani_Tele02_Montage2.Ani_Tele02_Montage2\'",
      SectionName = "Open",
    },
    r0_0.RT_17,
    {
      Function = "StopFX",
      Tag = "BirdIdle",
    },
    {
      EffectId = 10199005,
      Function = "PlayFX",
      Tag = "BirdFly",
    }
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 600112,
    TypeNextState = r0_0.RT_10,
  },
}
r6_0.StateId = 600111
r4_0[r5_0] = r6_0
r4_0[600112] = {
  StateId = 600112,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_381,
    NextStateId = 610011,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 610010
r4_0[610010] = r6_0
r4_0[610011] = {
  EventsCurrentState = r0_0.RT_383,
  StateId = 610011,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_385,
    NextStateId = 610013,
    TypeNextState = r0_0.RT_4,
  },
  [2] = {
    EventsNextState = r0_0.RT_385,
    NextStateId = 610014,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 610012
r4_0[610012] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_387,
}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_157,
    NextStateId = 610015,
    TypeNextState = r0_0.RT_388,
  },
}
r6_0.StateId = 610013
r4_0[610013] = r6_0
r5_0 = 610014
r6_0 = {
  EventsCurrentState = {
    {
      EffectId = 900030,
      Function = "PlayFX",
      Tag = "Star",
    },
    r0_0.RT_382
  },
}
r8_0 = {}
r8_0[1] = {
  EventsNextState = r0_0.RT_157,
  NextStateId = 610015,
  TypeNextState = {
    InteractiveId = 91511,
    Type = "Interactive",
  },
}
r6_0.StateEvent = r8_0
r6_0.StateId = 610014
r4_0[r5_0] = r6_0
r4_0[610015] = {
  EventsCurrentState = r0_0.RT_390,
  StateId = 610015,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_157,
    NextStateId = 610017,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 610016
r4_0[610016] = r6_0
r4_0[610017] = {
  EventsCurrentState = {
    r0_0.RT_17,
    r0_0.RT_119,
    r0_0.RT_382
  },
  StateId = 610017,
}
r5_0 = 610018
r6_0 = {}
r7_0 = "StateEvent"
r8_0 = {}
r8_0[1] = {
  EventsNextState = {
    r0_0.RT_156,
    {
      Function = "CreateSpecialMonster",
      RuleId = 3,
    }
  },
  NextStateId = 610019,
  TypeNextState = r0_0.RT_3,
}
r6_0[r7_0] = r8_0
r6_0.StateId = 610018
r4_0[r5_0] = r6_0
r4_0[610019] = {
  EventsCurrentState = {
    r0_0.RT_17,
    {
      Function = "StopFX",
      Tag = "Body",
    },
    r0_0.RT_151
  },
  StateId = 610019,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_391,
    NextStateId = 610021,
    TypeNextState = r0_0.RT_4,
  },
  [2] = {
    EventsNextState = r0_0.RT_391,
    NextStateId = 610022,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 610020
r4_0[610020] = r6_0
r4_0[610021] = {
  EventsCurrentState = r0_0.RT_393,
  StateEvent = r0_0.RT_396,
  StateId = 610021,
}
r4_0[610022] = {
  EventsCurrentState = r0_0.RT_393,
  StateEvent = r0_0.RT_396,
  StateId = 610022,
}
r4_0[610023] = {
  EventsCurrentState = r0_0.RT_390,
  StateId = 610023,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_398,
    NextStateId = 610025,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 610024
r4_0[610024] = r6_0
r4_0[610025] = {
  EventsCurrentState = r0_0.RT_399,
  StateId = 610025,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_398,
    NextStateId = 610027,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 610026
r4_0[610026] = r6_0
r4_0[610027] = {
  EventsCurrentState = r0_0.RT_399,
  StateId = 610027,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_157,
    NextStateId = 610029,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 610028
r4_0[610028] = r6_0
r4_0[610029] = {
  EventsCurrentState = r0_0.RT_152,
  StateId = 610029,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_157,
    NextStateId = 610031,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 610030
r4_0[610030] = r6_0
r4_0[610031] = {
  EventsCurrentState = r0_0.RT_383,
  StateId = 610031,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_157,
    NextStateId = 610033,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 610032
r4_0[610032] = r6_0
r4_0[610033] = {
  EventsCurrentState = r0_0.RT_383,
  StateId = 610033,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_381,
    NextStateId = 610036,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 610035
r4_0[610035] = r6_0
r4_0[610036] = {
  EventsCurrentState = r0_0.RT_399,
  StateId = 610036,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_157,
    NextStateId = 610041,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 610040
r4_0[610040] = r6_0
r4_0[610041] = {
  EventsCurrentState = {
    r0_0.RT_17,
    r0_0.RT_382
  },
  StateId = 610041,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_385,
    NextStateId = 610043,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 610042
r4_0[610042] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_387,
}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_157,
    NextStateId = 610044,
    TypeNextState = r0_0.RT_388,
  },
}
r6_0.StateId = 610043
r4_0[610043] = r6_0
r4_0[610044] = {
  EventsCurrentState = {
    r0_0.RT_17,
    r0_0.RT_389
  },
  StateId = 610044,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_120,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 701001,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 701000
r4_0[701000] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_2,
}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_157,
    NextStateId = 701002,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 701001
r4_0[701001] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_92,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 701003,
    TypeNextState = r0_0.RT_10,
  },
}
r6_0.StateId = 701002
r4_0[701002] = r6_0
r4_0[701003] = {
  StateId = 701003,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_2,
}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_157,
    NextStateId = 701002,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 701004
r4_0[701004] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_120,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 701031,
    TypeNextState = r0_0.RT_4,
  },
  [2] = {
    NextStateId = 701032,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 701030
r4_0[701030] = r6_0
r5_0 = 701031
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_1,
    {
      EffectId = 211,
      Function = "PlayFX",
      Tag = "Loop",
    }
  },
}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_157,
    NextStateId = 701032,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 701031
r4_0[r5_0] = r6_0
r5_0 = 701032
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_17,
    {
      Function = "StopFX",
      Tag = "Loop",
    }
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 701033,
    TypeNextState = r0_0.RT_10,
  },
}
r6_0.StateId = 701032
r4_0[r5_0] = r6_0
r4_0[701033] = {
  StateId = 701033,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 701060,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 701059
r4_0[701059] = r6_0
r4_0[701060] = {
  EventsCurrentState = r0_0.RT_403,
  StateEvent = r0_0.RT_405,
  StateId = 701060,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_407,
}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_157,
    NextStateId = 701062,
    TypeNextState = r0_0.RT_408,
  },
}
r6_0.StateId = 701061
r4_0[701061] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_92,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 701063,
    TypeNextState = r0_0.RT_10,
  },
}
r6_0.StateId = 701062
r4_0[701062] = r6_0
r4_0[701063] = {
  StateId = 701063,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_2,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 701101,
    TypeNextState = r0_0.RT_4,
  },
  [2] = {
    NextStateId = 701102,
    TypeNextState = r0_0.RT_409,
  },
}
r6_0.StateId = 701100
r4_0[701100] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_410,
}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_157,
    NextStateId = 701102,
    TypeNextState = r0_0.RT_409,
  },
}
r6_0.StateId = 701101
r4_0[701101] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_92,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 701103,
    TypeNextState = r0_0.RT_10,
  },
}
r6_0.StateId = 701102
r4_0[701102] = r6_0
r4_0[701103] = {
  StateId = 701103,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_2,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 701131,
    TypeNextState = r0_0.RT_4,
  },
  [2] = {
    NextStateId = 701132,
    TypeNextState = r0_0.RT_411,
  },
}
r6_0.StateId = 701130
r4_0[701130] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_410,
}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_157,
    NextStateId = 701132,
    TypeNextState = r0_0.RT_411,
  },
}
r6_0.StateId = 701131
r4_0[701131] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_92,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 701133,
    TypeNextState = r0_0.RT_10,
  },
}
r6_0.StateId = 701132
r4_0[701132] = r6_0
r4_0[701133] = {
  StateId = 701133,
}
r5_0 = 701300
r6_0 = {
  EventsCurrentState = {
    {
      ColorLogoMul = 1.5,
      Function = "ChangeFX",
      PositionMove = 0,
      Tag = "Niagara",
    }
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 701301,
    TypeNextState = r0_0.RT_215,
  },
}
r6_0.StateId = 701300
r4_0[r5_0] = r6_0
r5_0 = 701301
r6_0 = {
  EventsCurrentState = {
    {
      ColorLogoMul = 10,
      Function = "ChangeFX",
      PositionMove = 1,
      Tag = "Niagara",
    }
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 701302,
    TypeNextState = r0_0.RT_3,
  },
  [2] = {
    NextStateId = 701300,
    TypeNextState = r0_0.RT_295,
  },
}
r6_0.StateId = 701301
r4_0[r5_0] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_414,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 701303,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 701302
r4_0[701302] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_418,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 701304,
    TypeNextState = r0_0.RT_43,
  },
}
r6_0.StateId = 701303
r4_0[701303] = r6_0
r4_0[701304] = {
  EventsCurrentState = r0_0.RT_419,
  StateId = 701304,
}
r5_0 = 701310
r6_0 = {
  EventsCurrentState = {
    {
      EffectId = 201,
      Function = "PlayFX",
      Tag = "Trap",
    }
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 701311,
    TypeNextState = r0_0.RT_276,
  },
}
r6_0.StateId = 701310
r4_0[r5_0] = r6_0
r5_0 = 701311
r6_0 = {
  EventsCurrentState = {
    {
      Function = "StopFX",
      Tag = "Trap",
    },
    {
      EffectId = 202,
      Function = "PlayFX",
      NotAttached = true,
      Tag = "Die",
    },
    r0_0.RT_9
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 701312,
    TypeNextState = r0_0.RT_10,
  },
}
r6_0.StateId = 701311
r4_0[r5_0] = r6_0
r4_0[701312] = {
  EventsCurrentState = r0_0.RT_335,
  StateId = 701312,
}
r5_0 = 701400
r6_0 = {
  EventsCurrentState = r0_0.RT_2,
}
r7_0 = "StateEvent"
r8_0 = {}
r8_0[1] = {
  EventsNextState = {
    r0_0.RT_420
  },
  NextStateId = 701401,
  TypeNextState = {
    ActiveRange = 220,
    Type = "DistanceActive",
  },
}
r6_0[r7_0] = r8_0
r6_0.StateId = 701400
r4_0[r5_0] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_92,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 701402,
    TypeNextState = r0_0.RT_10,
  },
}
r6_0.StateId = 701401
r4_0[701401] = r6_0
r4_0[701402] = {
  EventsCurrentState = {
    r0_0.RT_421
  },
  StateId = 701402,
}
r5_0 = 702000
r6_0 = {
  EventsCurrentState = {
    {
      ColorLogoMul = 7,
      Function = "ChangeFX",
      PositionMove = 0,
      Tag = "Niagara",
    }
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 702001,
    TypeNextState = r0_0.RT_215,
  },
}
r6_0.StateId = 702000
r4_0[r5_0] = r6_0
r5_0 = 702001
r6_0 = {
  EventsCurrentState = {
    {
      ColorLogoMul = 20,
      Function = "ChangeFX",
      PositionMove = 1,
      Tag = "Niagara",
    }
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 702002,
    TypeNextState = r0_0.RT_3,
  },
  [2] = {
    NextStateId = 702000,
    TypeNextState = r0_0.RT_295,
  },
}
r6_0.StateId = 702001
r4_0[r5_0] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_414,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 702003,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 702002
r4_0[702002] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_418,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 702004,
    TypeNextState = r0_0.RT_43,
  },
}
r6_0.StateId = 702003
r4_0[702003] = r6_0
r4_0[702004] = {
  EventsCurrentState = r0_0.RT_419,
  StateId = 702004,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 703011,
    TypeNextState = r0_0.RT_160,
  },
  [2] = r0_0.RT_422,
}
r6_0.StateId = 703010
r4_0[703010] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_92,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 703010,
    TypeNextState = r0_0.RT_4,
  },
  [2] = r0_0.RT_422,
}
r6_0.StateId = 703011
r4_0[703011] = r6_0
r4_0[703012] = {
  StateId = 703012,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_190,
    NextStateId = 703021,
    TypeNextState = r0_0.RT_423,
  },
  [2] = {
    EventsNextState = r0_0.RT_192,
    NextStateId = 703027,
    TypeNextState = r0_0.RT_424,
  },
  [3] = r0_0.RT_422,
}
r6_0.StateId = 703020
r4_0[703020] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_190,
    NextStateId = 703022,
    TypeNextState = r0_0.RT_423,
  },
  [2] = {
    EventsNextState = r0_0.RT_192,
    NextStateId = 703020,
    TypeNextState = r0_0.RT_424,
  },
  [3] = r0_0.RT_422,
}
r6_0.StateId = 703021
r4_0[703021] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_190,
    NextStateId = 703023,
    TypeNextState = r0_0.RT_423,
  },
  [2] = {
    EventsNextState = r0_0.RT_192,
    NextStateId = 703021,
    TypeNextState = r0_0.RT_424,
  },
  [3] = r0_0.RT_422,
}
r6_0.StateId = 703022
r4_0[703022] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_190,
    NextStateId = 703024,
    TypeNextState = r0_0.RT_423,
  },
  [2] = {
    EventsNextState = r0_0.RT_192,
    NextStateId = 703022,
    TypeNextState = r0_0.RT_424,
  },
  [3] = r0_0.RT_422,
}
r6_0.StateId = 703023
r4_0[703023] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_190,
    NextStateId = 703025,
    TypeNextState = r0_0.RT_423,
  },
  [2] = {
    EventsNextState = r0_0.RT_192,
    NextStateId = 703023,
    TypeNextState = r0_0.RT_424,
  },
  [3] = r0_0.RT_422,
}
r6_0.StateId = 703024
r4_0[703024] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_190,
    NextStateId = 703026,
    TypeNextState = r0_0.RT_423,
  },
  [2] = {
    EventsNextState = r0_0.RT_192,
    NextStateId = 703024,
    TypeNextState = r0_0.RT_424,
  },
  [3] = r0_0.RT_422,
}
r6_0.StateId = 703025
r4_0[703025] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_190,
    NextStateId = 703027,
    TypeNextState = r0_0.RT_423,
  },
  [2] = {
    EventsNextState = r0_0.RT_192,
    NextStateId = 703025,
    TypeNextState = r0_0.RT_424,
  },
  [3] = r0_0.RT_422,
}
r6_0.StateId = 703026
r4_0[703026] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_190,
    NextStateId = 703020,
    TypeNextState = r0_0.RT_423,
  },
  [2] = {
    EventsNextState = r0_0.RT_192,
    NextStateId = 703026,
    TypeNextState = r0_0.RT_424,
  },
  [3] = r0_0.RT_422,
}
r6_0.StateId = 703027
r4_0[703027] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 703031,
    TypeNextState = r0_0.RT_4,
  },
  [2] = r0_0.RT_422,
}
r6_0.StateId = 703030
r4_0[703030] = r6_0
r4_0[703031] = {
  StateEvent = {
    [1] = r0_0.RT_422,
  },
  StateId = 703031,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 704001,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 704000
r4_0[704000] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 704000,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 704001
r4_0[704001] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 704011,
    TypeNextState = r0_0.RT_4,
  },
  [2] = {
    NextStateId = 704012,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 704010
r4_0[704010] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_425,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 704012,
    TypeNextState = r0_0.RT_3,
  },
  [2] = r0_0.RT_426,
}
r6_0.StateId = 704011
r4_0[704011] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_427,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 704011,
    TypeNextState = r0_0.RT_3,
  },
  [2] = r0_0.RT_426,
}
r6_0.StateId = 704012
r4_0[704012] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_427,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 704021,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 704020
r4_0[704020] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_425,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 704022,
    TypeNextState = r0_0.RT_3,
  },
  [2] = r0_0.RT_428,
}
r6_0.StateId = 704021
r4_0[704021] = r6_0
r4_0[704022] = {
  EventsCurrentState = r0_0.RT_427,
  StateEvent = {
    [2] = r0_0.RT_428,
  },
  StateId = 704022,
}
r4_0[704030] = {
  StateEvent = {
    [1] = r0_0.RT_429,
    [2] = r0_0.RT_430,
    [3] = r0_0.RT_431,
    [4] = r0_0.RT_432,
  },
  StateId = 704030,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = r0_0.RT_430,
  [2] = r0_0.RT_433,
  [3] = {
    NextStateId = 7040311,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 704031
r4_0[704031] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = r0_0.RT_431,
  [2] = r0_0.RT_433,
  [3] = {
    NextStateId = 7040321,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 704032
r4_0[704032] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = r0_0.RT_432,
  [2] = r0_0.RT_433,
  [3] = {
    NextStateId = 7040331,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 704033
r4_0[704033] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = r0_0.RT_433,
  [2] = {
    NextStateId = 7040341,
    TypeNextState = r0_0.RT_4,
  },
  [3] = r0_0.RT_431,
}
r6_0.StateId = 704034
r4_0[704034] = r6_0
r5_0 = 705010
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_416,
    r0_0.RT_434,
    {
      Function = "StopFX",
      Tag = "End",
    }
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 705011,
    TypeNextState = r0_0.RT_276,
  },
}
r6_0.StateId = 705010
r4_0[r5_0] = r6_0
r5_0 = 705011
r6_0 = {
  EventsCurrentState = {
    {
      EffectId = 217,
      Function = "PlayFX",
      Tag = "Start",
    }
  },
}
r8_0 = {}
r8_0[1] = {
  NextStateId = 705012,
  TypeNextState = {
    ActiveRange = 100,
    Type = "DistanceActive",
  },
}
r8_0[2] = {
  NextStateId = 705010,
  TypeNextState = {
    DeActiveRange = 300,
    Type = "DistanceDeActive",
  },
}
r6_0.StateEvent = r8_0
r6_0.StateId = 705011
r4_0[r5_0] = r6_0
r5_0 = 705012
r6_0 = {
  EventsCurrentState = {
    {
      DeadTime = true,
      Function = "ChangeFX",
      Tag = "Start",
    },
    {
      EffectId = 219,
      Function = "PlayFX",
      Tag = "Die",
    },
    {
      EffectId = 218,
      Function = "PlayFX",
      Tag = "End",
    }
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 705013,
    TypeNextState = r0_0.RT_14,
  },
  [2] = {
    NextStateId = 705010,
    TypeNextState = r0_0.RT_188,
  },
}
r6_0.StateId = 705012
r4_0[r5_0] = r6_0
r5_0 = 705013
r6_0 = {
  EventsCurrentState = {
    {
      DeadTime = true,
      Function = "ChangeFX",
      Tag = "End",
    },
    r0_0.RT_416,
    r0_0.RT_434
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 705010,
    TypeNextState = r0_0.RT_25,
  },
}
r6_0.StateId = 705013
r4_0[r5_0] = r6_0
r5_0 = 705030
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_351,
    r0_0.RT_315,
    r0_0.RT_22
  },
}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_353,
    NextStateId = 705031,
    TypeNextState = r0_0.RT_3,
  },
  [2] = {
    NextStateId = 705032,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 705030
r4_0[r5_0] = r6_0
r4_0[705031] = {
  EventsCurrentState = {
    r0_0.RT_9,
    r0_0.RT_310,
    r0_0.RT_315,
    r0_0.RT_316,
    r0_0.RT_317,
    r0_0.RT_13
  },
  StateEvent = r0_0.RT_436,
  StateId = 705031,
}
r4_0[705032] = {
  EventsCurrentState = {
    r0_0.RT_9,
    r0_0.RT_310,
    r0_0.RT_316,
    r0_0.RT_317,
    r0_0.RT_13
  },
  StateEvent = r0_0.RT_436,
  StateId = 705032,
}
r4_0[705033] = {
  EventsCurrentState = {
    r0_0.RT_351,
    r0_0.RT_317,
    r0_0.RT_315,
    r0_0.RT_22
  },
  StateId = 705033,
}
r6_0 = {}
r8_0 = {}
r8_0[1] = {
  NextStateId = 701060,
  TypeNextState = {
    InteractiveId = 100017,
    Type = "Interactive",
  },
}
r8_0[2] = {
  NextStateId = 705041,
  TypeNextState = r0_0.RT_4,
}
r6_0.StateEvent = r8_0
r6_0.StateId = 705040
r4_0[705040] = r6_0
r4_0[705041] = {
  EventsCurrentState = r0_0.RT_403,
  StateEvent = r0_0.RT_405,
  StateId = 705041,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 705051,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 705050
r4_0[705050] = r6_0
r5_0 = 705051
r6_0 = {
  EventsCurrentState = {
    {
      Function = "PlayMontage",
      Mesh = "SkeletalMesh",
      MontagePath = "AnimMontage\'/Game/Asset/Scene/common/InterProps/Animation/Com_Hay/Ani_Com_Hay02A_Shake_Montage.Ani_Com_Hay02A_Shake_Montage\'",
    }
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 705052,
    TypeNextState = r0_0.RT_25,
  },
}
r6_0.StateId = 705051
r4_0[r5_0] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 705050,
    TypeNextState = r0_0.RT_25,
  },
}
r6_0.StateId = 705052
r4_0[705052] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 705061,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 705060
r4_0[705060] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 705062,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 705061
r4_0[705061] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 705060,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 705062
r4_0[705062] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 705071,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 705070
r4_0[705070] = r6_0
r4_0[705071] = {
  StateId = 705071,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 706001,
    TypeNextState = r0_0.RT_14,
  },
}
r6_0.StateId = 706000
r4_0[706000] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 706000,
    TypeNextState = r0_0.RT_437,
  },
}
r6_0.StateId = 706001
r4_0[706001] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 706011,
    TypeNextState = r0_0.RT_95,
  },
}
r6_0.StateId = 706010
r4_0[706010] = r6_0
r4_0[706011] = {
  StateId = 706011,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 706021,
    TypeNextState = r0_0.RT_14,
  },
}
r6_0.StateId = 706020
r4_0[706020] = r6_0
r5_0 = 706021
r6_0 = {
  EventsCurrentState = {
    {
      Function = "RemoveTag",
      Tag = "TrafficwayPan1",
    }
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 706022,
    TypeNextState = r0_0.RT_437,
  },
}
r6_0.StateId = 706021
r4_0[r5_0] = r6_0
r5_0 = 706022
r6_0 = {
  EventsCurrentState = {
    {
      Function = "AddTag",
      Tag = "TrafficwayPan1",
      Time = 2,
    }
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 706020,
    TypeNextState = r0_0.RT_200,
  },
}
r6_0.StateId = 706022
r4_0[r5_0] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 706031,
    TypeNextState = r0_0.RT_14,
  },
}
r6_0.StateId = 706030
r4_0[706030] = r6_0
r4_0[706031] = {
  StateId = 706031,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 707031,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 707030
r4_0[707030] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 707032,
    TypeNextState = r0_0.RT_95,
  },
}
r6_0.StateId = 707031
r4_0[707031] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 707033,
    TypeNextState = r0_0.RT_48,
  },
}
r6_0.StateId = 707032
r4_0[707032] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 707034,
    TypeNextState = r0_0.RT_95,
  },
}
r6_0.StateId = 707033
r4_0[707033] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 707035,
    TypeNextState = r0_0.RT_48,
  },
}
r6_0.StateId = 707034
r4_0[707034] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 707036,
    TypeNextState = r0_0.RT_95,
  },
}
r6_0.StateId = 707035
r4_0[707035] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 707037,
    TypeNextState = r0_0.RT_43,
  },
}
r6_0.StateId = 707036
r4_0[707036] = r6_0
r4_0[707037] = {
  StateId = 707037,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 707041,
    TypeNextState = r0_0.RT_95,
  },
}
r6_0.StateId = 707040
r4_0[707040] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 707042,
    TypeNextState = r0_0.RT_43,
  },
}
r6_0.StateId = 707041
r4_0[707041] = r6_0
r4_0[707042] = {
  StateId = 707042,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 707951,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 707950
r4_0[707950] = r6_0
r4_0[707951] = {
  StateId = 707951,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 707961,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 707960
r4_0[707960] = r6_0
r4_0[707961] = {
  StateId = 707961,
}
r4_0[707970] = {
  StateEvent = r0_0.RT_439,
  StateId = 707970,
}
r5_0 = 707980
r6_0 = {
  EventsCurrentState = {
    {
      EffectId = 230,
      Function = "PlayFX",
      Tag = "fp",
    }
  },
}
r7_0 = "StateEvent"
r8_0 = {}
r8_0[1] = {
  EventsNextState = {
    {
      EffectId = 232,
      Function = "PlayFX",
      Tag = "wind",
    }
  },
  NextStateId = 707981,
  TypeNextState = r0_0.RT_3,
}
r6_0[r7_0] = r8_0
r6_0.StateId = 707980
r4_0[r5_0] = r6_0
r4_0[707981] = {
  EventsCurrentState = {
    {
      Function = "StopFX",
      Tag = "fp",
    }
  },
  StateId = 707981,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 707991,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 707990
r4_0[707990] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_441,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 707992,
    TypeNextState = r0_0.RT_43,
  },
}
r6_0.StateId = 707991
r4_0[707991] = r6_0
r4_0[707992] = {
  EventsCurrentState = {
    r0_0.RT_442
  },
  StateId = 707992,
}
r4_0[708000] = {
  StateEvent = r0_0.RT_439,
  StateId = 708000,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 708002,
    TypeNextState = r0_0.RT_43,
  },
}
r6_0.StateId = 708001
r4_0[708001] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 708000,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 708002
r4_0[708002] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 708101,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 708100
r4_0[708100] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_441,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 708102,
    TypeNextState = r0_0.RT_43,
  },
}
r6_0.StateId = 708101
r4_0[708101] = r6_0
r5_0 = 708102
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_402,
    r0_0.RT_442
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 708103,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 708102
r4_0[r5_0] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_407,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 708104,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 708103
r4_0[708103] = r6_0
r5_0 = 708104
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_119,
    r0_0.RT_402,
    r0_0.RT_442
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 708105,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 708104
r4_0[r5_0] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_407,
}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_157,
    NextStateId = 708106,
    TypeNextState = r0_0.RT_408,
  },
}
r6_0.StateId = 708105
r4_0[708105] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_92,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 708107,
    TypeNextState = r0_0.RT_10,
  },
}
r6_0.StateId = 708106
r4_0[708106] = r6_0
r4_0[708107] = {
  StateId = 708107,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780021,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 780020
r4_0[780020] = r6_0
r4_0[780021] = {
  EventsCurrentState = r0_0.RT_90,
  StateId = 780021,
}
r5_0 = 780030
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_443,
    r0_0.RT_22
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780031,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 780030
r4_0[r5_0] = r6_0
r5_0 = 780031
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_443,
    r0_0.RT_22,
    r0_0.RT_102
  },
}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_445,
    NextStateId = 780032,
    TypeNextState = r0_0.RT_95,
  },
}
r6_0.StateId = 780031
r4_0[r5_0] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_447,
}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_449,
    NextStateId = 780033,
    TypeNextState = r0_0.RT_87,
  },
}
r6_0.StateId = 780032
r4_0[780032] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_450,
}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_445,
    NextStateId = 780034,
    TypeNextState = r0_0.RT_95,
  },
}
r6_0.StateId = 780033
r4_0[780033] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_447,
}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_449,
    NextStateId = 780035,
    TypeNextState = r0_0.RT_87,
  },
}
r6_0.StateId = 780034
r4_0[780034] = r6_0
r5_0 = 780035
r6_0 = {
  EventsCurrentState = r0_0.RT_450,
}
r7_0 = "StateEvent"
r8_0 = {}
r8_0[1] = {
  EventsNextState = {
    r0_0.RT_444,
    r0_0.RT_312
  },
  NextStateId = 780036,
  TypeNextState = r0_0.RT_95,
}
r6_0[r7_0] = r8_0
r6_0.StateId = 780035
r4_0[r5_0] = r6_0
r4_0[780036] = {
  EventsCurrentState = {
    r0_0.RT_9,
    r0_0.RT_446,
    r0_0.RT_316,
    r0_0.RT_13
  },
  StateId = 780036,
}
r5_0 = 780040
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_351,
    r0_0.RT_22
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780041,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 780040
r4_0[r5_0] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_56,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780040,
    TypeNextState = r0_0.RT_7,
  },
  [2] = {
    EventsNextState = r0_0.RT_302,
    NextStateId = 780042,
    TypeNextState = r0_0.RT_8,
  },
}
r6_0.StateId = 780041
r4_0[780041] = r6_0
r4_0[780042] = {
  EventsCurrentState = {
    r0_0.RT_9,
    r0_0.RT_310,
    r0_0.RT_316,
    r0_0.RT_13
  },
  StateId = 780042,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780051,
    TypeNextState = r0_0.RT_95,
  },
}
r6_0.StateId = 780050
r4_0[780050] = r6_0
r4_0[780051] = {
  EventsCurrentState = r0_0.RT_152,
  StateId = 780051,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780061,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 780060
r4_0[780060] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780060,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 780061
r4_0[780061] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_159,
}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_376,
    NextStateId = 780081,
    TypeNextState = r0_0.RT_251,
  },
  [2] = {
    EventsNextState = r0_0.RT_376,
    NextStateId = 780082,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 780080
r4_0[780080] = r6_0
r4_0[780081] = {
  EventsCurrentState = r0_0.RT_158,
  StateEvent = r0_0.RT_452,
  StateId = 780081,
}
r4_0[780082] = {
  EventsCurrentState = r0_0.RT_158,
  StateEvent = r0_0.RT_452,
  StateId = 780082,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_454,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780091,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 780090
r4_0[780090] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_454,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780092,
    TypeNextState = r0_0.RT_3,
  },
  [2] = {
    NextStateId = 780090,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 780091
r4_0[780091] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_56,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780091,
    TypeNextState = r0_0.RT_7,
  },
  [2] = {
    EventsNextState = r0_0.RT_302,
    NextStateId = 780093,
    TypeNextState = r0_0.RT_8,
  },
}
r6_0.StateId = 780092
r4_0[780092] = r6_0
r4_0[780093] = {
  EventsCurrentState = {
    {
      Function = "PlayMontage",
      Mesh = "Mesh",
      MontagePath = "AnimMontage\'/Game/AssetDesign/Item/MiniGame/Dyn_Minigame_Tanceqi.Dyn_Minigame_Tanceqi\'",
      SectionName = "Loop",
    }
  },
  StateId = 780093,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_159,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780101,
    TypeNextState = r0_0.RT_251,
  },
  [2] = {
    NextStateId = 780102,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 780100
r4_0[780100] = r6_0
r4_0[780101] = {
  EventsCurrentState = r0_0.RT_158,
  StateEvent = r0_0.RT_456,
  StateId = 780101,
}
r4_0[780102] = {
  EventsCurrentState = r0_0.RT_158,
  StateEvent = r0_0.RT_456,
  StateId = 780102,
}
r5_0 = 780110
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_119,
    r0_0.RT_346,
    r0_0.RT_304,
    r0_0.RT_22,
    r0_0.RT_9
  },
}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_348,
    NextStateId = 780111,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 780110
r4_0[r5_0] = r6_0
r5_0 = 780111
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_1,
    r0_0.RT_299,
    r0_0.RT_306,
    r0_0.RT_300,
    r0_0.RT_20,
    r0_0.RT_102
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780112,
    TypeNextState = r0_0.RT_3,
  },
  [2] = {
    NextStateId = 780110,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 780111
r4_0[r5_0] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_56,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780111,
    TypeNextState = r0_0.RT_7,
  },
  [2] = {
    EventsNextState = r0_0.RT_302,
    NextStateId = 780113,
    TypeNextState = r0_0.RT_8,
  },
}
r6_0.StateId = 780112
r4_0[780112] = r6_0
r4_0[780113] = {
  EventsCurrentState = r0_0.RT_356,
  StateId = 780113,
}
r5_0 = 780130
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_119,
    r0_0.RT_22,
    r0_0.RT_9
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780131,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 780130
r4_0[r5_0] = r6_0
r5_0 = 780131
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_1,
    r0_0.RT_20,
    r0_0.RT_102
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780132,
    TypeNextState = r0_0.RT_3,
  },
  [2] = {
    NextStateId = 780130,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 780131
r4_0[r5_0] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_92,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780131,
    TypeNextState = r0_0.RT_7,
  },
  [2] = {
    NextStateId = 780133,
    TypeNextState = r0_0.RT_8,
  },
}
r6_0.StateId = 780132
r4_0[780132] = r6_0
r4_0[780133] = {
  EventsCurrentState = r0_0.RT_379,
  StateId = 780133,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_227,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780141,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 780140
r4_0[780140] = r6_0
r4_0[780141] = {
  EventsCurrentState = r0_0.RT_228,
  StateId = 780141,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_158,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780151,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 780150
r4_0[780150] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_221,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780152,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 780151
r4_0[780151] = r6_0
r4_0[780152] = {
  EventsCurrentState = {
    r0_0.RT_82,
    r0_0.RT_11
  },
  StateId = 780152,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_219,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780161,
    TypeNextState = r0_0.RT_220,
  },
  [2] = {
    NextStateId = 780163,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 780160
r4_0[780160] = r6_0
r4_0[780161] = {
  EventsCurrentState = r0_0.RT_221,
  StateEvent = r0_0.RT_458,
  StateId = 780161,
}
r4_0[780162] = {
  EventsCurrentState = r0_0.RT_224,
  StateId = 780162,
}
r4_0[780163] = {
  EventsCurrentState = r0_0.RT_221,
  StateEvent = r0_0.RT_458,
  StateId = 780163,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780211,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 780210
r4_0[780210] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_92,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780210,
    TypeNextState = r0_0.RT_7,
  },
  [2] = {
    EventsNextState = r0_0.RT_302,
    NextStateId = 780212,
    TypeNextState = r0_0.RT_8,
  },
}
r6_0.StateId = 780211
r4_0[780211] = r6_0
r4_0[780212] = {
  EventsCurrentState = r0_0.RT_90,
  StateId = 780212,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780231,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 780230
r4_0[780230] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780230,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 780231
r4_0[780231] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780241,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 780240
r4_0[780240] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780240,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 780241
r4_0[780241] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780251,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 780250
r4_0[780250] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780250,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 780251
r4_0[780251] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_425,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780341,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 780340
r4_0[780340] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_427,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780342,
    TypeNextState = r0_0.RT_10,
  },
}
r6_0.StateId = 780341
r4_0[780341] = r6_0
r4_0[780342] = {
  StateId = 780342,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780421,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 780420
r4_0[780420] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_90,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780420,
    TypeNextState = r0_0.RT_10,
  },
}
r6_0.StateId = 780421
r4_0[780421] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780581,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 780580
r4_0[780580] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_90,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780580,
    TypeNextState = r0_0.RT_10,
  },
}
r6_0.StateId = 780581
r4_0[780581] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780651,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 780650
r4_0[780650] = r6_0
r4_0[780651] = {
  EventsCurrentState = r0_0.RT_90,
  StateId = 780651,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780671,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 780670
r4_0[780670] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 780672,
    TypeNextState = r0_0.RT_10,
  },
}
r6_0.StateId = 780671
r4_0[780671] = r6_0
r4_0[780672] = {
  EventsCurrentState = r0_0.RT_152,
  StateId = 780672,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_158,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 801131,
    TypeNextState = r0_0.RT_3,
  },
  [2] = {
    NextStateId = 801132,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 801130
r4_0[801130] = r6_0
r4_0[801131] = {
  EventsCurrentState = r0_0.RT_159,
  StateEvent = {
    [1] = r0_0.RT_459,
  },
  StateId = 801131,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_158,
}
r8_0 = {
  [1] = r0_0.RT_459,
}
r8_0[2] = {
  NextStateId = 801131,
  TypeNextState = {
    InteractiveId = 402,
    Type = "Interactive",
  },
}
r6_0.StateEvent = r8_0
r6_0.StateId = 801132
r4_0[801132] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_319,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 802012,
    TypeNextState = r0_0.RT_87,
  },
}
r6_0.StateId = 802010
r4_0[802010] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_322,
}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_324,
    NextStateId = 802010,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 802011
r4_0[802011] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_309,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 802011,
    TypeNextState = r0_0.RT_185,
  },
}
r6_0.StateId = 802012
r4_0[802012] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 809011,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 809010
r4_0[809010] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 809010,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 809011
r4_0[809011] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 810011,
    TypeNextState = r0_0.RT_4,
  },
  [2] = {
    NextStateId = 810012,
    TypeNextState = r0_0.RT_4,
  },
  [3] = {
    NextStateId = 810013,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 810010
r4_0[810010] = r6_0
r4_0[810011] = {
  StateEvent = r0_0.RT_461,
  StateId = 810011,
}
r4_0[810012] = {
  StateEvent = r0_0.RT_461,
  StateId = 810012,
}
r4_0[810013] = {
  StateEvent = r0_0.RT_461,
  StateId = 810013,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_210,
}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_6,
    NextStateId = 900001,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 900000
r4_0[900000] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 900000,
    TypeNextState = r0_0.RT_8,
  },
}
r6_0.StateId = 900001
r4_0[900001] = r6_0
r5_0 = 901000
r6_0 = {}
r7_0 = "StateEvent"
r8_0 = {}
r8_0[1] = {
  EventsNextState = {
    r0_0.RT_212,
    r0_0.RT_420,
    {
      EffectId = 220,
      Function = "PlayFX",
      NeedFinish = false,
      Tag = "Niagara1",
    },
    {
      EffectId = 221,
      Function = "PlayFX",
      NeedFinish = false,
      Tag = "Niagara2",
    }
  },
  NextStateId = 901001,
  TypeNextState = r0_0.RT_24,
}
r6_0[r7_0] = r8_0
r6_0.StateId = 901000
r4_0[r5_0] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_92,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 901002,
    TypeNextState = r0_0.RT_10,
  },
}
r6_0.StateId = 901001
r4_0[901001] = r6_0
r4_0[901002] = {
  EventsCurrentState = {
    r0_0.RT_119,
    {
      EffectId = 222,
      Function = "PlayFX",
      Tag = "A",
    },
    {
      EffectId = 223,
      Function = "PlayFX",
      Tag = "B",
    },
    r0_0.RT_421,
    r0_0.RT_211
  },
  StateId = 901002,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_227,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 904002,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 904001
r4_0[904001] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_228,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 904001,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 904002
r4_0[904002] = r6_0
r4_0[904312] = {
  StateEvent = {
    [1] = r0_0.RT_469,
    [2] = r0_0.RT_469,
  },
  StateId = 904312,
}
r4_0[904332] = {
  StateEvent = {
    [1] = r0_0.RT_470,
    [2] = r0_0.RT_470,
  },
  StateId = 904332,
}
r4_0[904352] = {
  StateEvent = {
    [1] = r0_0.RT_471,
    [2] = r0_0.RT_471,
  },
  StateId = 904352,
}
r4_0[904372] = {
  StateEvent = {
    [1] = r0_0.RT_472,
    [2] = r0_0.RT_472,
  },
  StateId = 904372,
}
r4_0[904392] = {
  StateEvent = {
    [1] = r0_0.RT_473,
    [2] = r0_0.RT_473,
  },
  StateId = 904392,
}
r4_0[1060400] = {
  EventsCurrentState = r0_0.RT_26,
  StateEvent = {
    [1] = r0_0.RT_27,
    [2] = r0_0.RT_28,
  },
  StateId = 1060400,
}
r4_0[1060401] = {
  EventsCurrentState = r0_0.RT_29,
  StateEvent = {
    [1] = r0_0.RT_30,
    [2] = r0_0.RT_28,
  },
  StateId = 1060401,
}
r4_0[1060402] = {
  EventsCurrentState = r0_0.RT_31,
  StateEvent = {
    [1] = r0_0.RT_30,
    [2] = r0_0.RT_27,
  },
  StateId = 1060402,
}
r4_0[1060800] = {
  StateEvent = {
    [1] = r0_0.RT_32,
    [2] = r0_0.RT_33,
  },
  StateId = 1060800,
}
r4_0[1060801] = {
  StateEvent = {
    [1] = r0_0.RT_34,
    [2] = r0_0.RT_33,
  },
  StateId = 1060801,
}
r4_0[1060802] = {
  StateEvent = {
    [1] = r0_0.RT_34,
    [2] = r0_0.RT_32,
  },
  StateId = 1060802,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061001,
    TypeNextState = r0_0.RT_24,
  },
}
r6_0.StateId = 1061000
r4_0[1061000] = r6_0
r6_0 = {}
r8_0 = {}
r8_0[1] = {
  NextStateId = 1061002,
  TypeNextState = {
    Param = 8,
    Type = "Time",
  },
}
r6_0.StateEvent = r8_0
r6_0.StateId = 1061001
r4_0[1061001] = r6_0
r4_0[1061002] = {
  StateId = 1061002,
}
r4_0[1061100] = {
  EventsCurrentState = r0_0.RT_36,
  StateEvent = {
    [1] = r0_0.RT_37,
    [2] = r0_0.RT_38,
    [3] = r0_0.RT_39,
    [4] = r0_0.RT_40,
    [5] = r0_0.RT_41,
  },
  StateId = 1061100,
}
r4_0[1061101] = {
  EventsCurrentState = r0_0.RT_36,
  StateEvent = {
    [1] = r0_0.RT_42,
    [2] = r0_0.RT_38,
    [3] = r0_0.RT_39,
    [4] = r0_0.RT_40,
    [5] = r0_0.RT_41,
  },
  StateId = 1061101,
}
r4_0[1061102] = {
  EventsCurrentState = r0_0.RT_36,
  StateEvent = {
    [1] = r0_0.RT_42,
    [2] = r0_0.RT_37,
    [3] = r0_0.RT_39,
    [4] = r0_0.RT_40,
    [5] = r0_0.RT_41,
  },
  StateId = 1061102,
}
r4_0[1061103] = {
  EventsCurrentState = r0_0.RT_36,
  StateEvent = {
    [1] = r0_0.RT_42,
    [2] = r0_0.RT_37,
    [3] = r0_0.RT_38,
    [4] = r0_0.RT_40,
    [5] = r0_0.RT_41,
  },
  StateId = 1061103,
}
r4_0[1061104] = {
  EventsCurrentState = r0_0.RT_36,
  StateEvent = {
    [1] = r0_0.RT_42,
    [2] = r0_0.RT_37,
    [3] = r0_0.RT_38,
    [4] = r0_0.RT_39,
    [5] = r0_0.RT_41,
  },
  StateId = 1061104,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_36,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061106,
    TypeNextState = r0_0.RT_43,
  },
}
r6_0.StateId = 1061105
r4_0[1061105] = r6_0
r4_0[1061106] = {
  EventsCurrentState = r0_0.RT_44,
  StateEvent = {
    [1] = r0_0.RT_42,
  },
  StateId = 1061106,
}
r4_0[1061200] = {
  EventsCurrentState = r0_0.RT_26,
  StateEvent = {
    [1] = r0_0.RT_45,
  },
  StateId = 1061200,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_29,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061202,
    TypeNextState = r0_0.RT_46,
  },
  [2] = r0_0.RT_47,
}
r6_0.StateId = 1061201
r4_0[1061201] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_29,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061203,
    TypeNextState = r0_0.RT_48,
  },
  [2] = r0_0.RT_47,
}
r6_0.StateId = 1061202
r4_0[1061202] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_44,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061204,
    TypeNextState = r0_0.RT_49,
  },
  [2] = r0_0.RT_47,
  [3] = r0_0.RT_47,
}
r6_0.StateId = 1061203
r4_0[1061203] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061205,
    TypeNextState = r0_0.RT_48,
  },
  [2] = r0_0.RT_47,
}
r6_0.StateId = 1061204
r4_0[1061204] = r6_0
r6_0 = {}
r8_0 = {}
r8_0[1] = {
  NextStateId = 1061206,
  TypeNextState = {
    InteractiveId = 920,
    Type = "Interactive",
  },
}
r8_0[2] = r0_0.RT_47
r6_0.StateEvent = r8_0
r6_0.StateId = 1061205
r4_0[1061205] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061207,
    TypeNextState = r0_0.RT_48,
  },
  [2] = r0_0.RT_47,
}
r6_0.StateId = 1061206
r4_0[1061206] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_26,
}
r6_0.StateEvent = {
  [1] = r0_0.RT_47,
  [2] = r0_0.RT_45,
  [3] = {
    NextStateId = 1061203,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1061207
r4_0[1061207] = r6_0
r4_0[1061210] = {
  EventsCurrentState = r0_0.RT_50,
  StateId = 1061210,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_29,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061212,
    TypeNextState = r0_0.RT_46,
  },
}
r6_0.StateId = 1061211
r4_0[1061211] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_29,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061210,
    TypeNextState = r0_0.RT_48,
  },
}
r6_0.StateId = 1061212
r4_0[1061212] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_26,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061221,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1061220
r4_0[1061220] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_29,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061210,
    TypeNextState = r0_0.RT_4,
  },
  [2] = {
    NextStateId = 1061222,
    TypeNextState = r0_0.RT_46,
  },
}
r6_0.StateId = 1061221
r4_0[1061221] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_29,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061223,
    TypeNextState = r0_0.RT_48,
  },
  [2] = {
    NextStateId = 1061220,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1061222
r4_0[1061222] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_44,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061224,
    TypeNextState = r0_0.RT_49,
  },
}
r6_0.StateId = 1061223
r4_0[1061223] = r6_0
r4_0[1061224] = {
  EventsCurrentState = r0_0.RT_51,
  StateId = 1061224,
}
r4_0[1061230] = {
  EventsCurrentState = r0_0.RT_26,
  StateEvent = {
    [1] = r0_0.RT_52,
    [2] = r0_0.RT_53,
  },
  StateId = 1061230,
}
r4_0[1061231] = {
  EventsCurrentState = r0_0.RT_29,
  StateEvent = {
    [1] = r0_0.RT_53,
    [2] = r0_0.RT_54,
  },
  StateId = 1061231,
}
r4_0[1061232] = {
  EventsCurrentState = r0_0.RT_44,
  StateEvent = {
    [1] = r0_0.RT_54,
    [2] = r0_0.RT_52,
  },
  StateId = 1061232,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_29,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061241,
    TypeNextState = r0_0.RT_55,
  },
}
r6_0.StateId = 1061240
r4_0[1061240] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_56,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061240,
    TypeNextState = r0_0.RT_7,
  },
  [2] = {
    NextStateId = 1061242,
    TypeNextState = r0_0.RT_8,
  },
}
r6_0.StateId = 1061241
r4_0[1061241] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_29,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061243,
    TypeNextState = r0_0.RT_48,
  },
}
r6_0.StateId = 1061242
r4_0[1061242] = r6_0
r5_0 = 1061243
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_13,
    r0_0.RT_57
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061244,
    TypeNextState = r0_0.RT_58,
  },
}
r6_0.StateId = 1061243
r4_0[r5_0] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_44,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061245,
    TypeNextState = r0_0.RT_43,
  },
}
r6_0.StateId = 1061244
r4_0[1061244] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_44,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061246,
    TypeNextState = r0_0.RT_59,
  },
}
r6_0.StateId = 1061245
r4_0[1061245] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_44,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061243,
    TypeNextState = r0_0.RT_43,
  },
}
r6_0.StateId = 1061246
r4_0[1061246] = r6_0
r4_0[1061250] = {
  EventsCurrentState = r0_0.RT_51,
  StateEvent = {
    [1] = r0_0.RT_60,
  },
  StateId = 1061250,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_29,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061252,
    TypeNextState = r0_0.RT_55,
  },
}
r6_0.StateId = 1061251
r4_0[1061251] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_29,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061253,
    TypeNextState = r0_0.RT_4,
  },
  [2] = r0_0.RT_60,
}
r6_0.StateId = 1061252
r4_0[1061252] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_29,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061254,
    TypeNextState = r0_0.RT_48,
  },
}
r6_0.StateId = 1061253
r4_0[1061253] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_44,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061255,
    TypeNextState = r0_0.RT_58,
  },
}
r6_0.StateId = 1061254
r4_0[1061254] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_44,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061256,
    TypeNextState = r0_0.RT_43,
  },
}
r6_0.StateId = 1061255
r4_0[1061255] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_44,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061257,
    TypeNextState = r0_0.RT_59,
  },
}
r6_0.StateId = 1061256
r4_0[1061256] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_44,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061254,
    TypeNextState = r0_0.RT_43,
  },
}
r6_0.StateId = 1061257
r4_0[1061257] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_29,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061261,
    TypeNextState = r0_0.RT_55,
  },
}
r6_0.StateId = 1061260
r4_0[1061260] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_29,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061262,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1061261
r4_0[1061261] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_29,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061263,
    TypeNextState = r0_0.RT_48,
  },
}
r6_0.StateId = 1061262
r4_0[1061262] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_44,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061264,
    TypeNextState = r0_0.RT_58,
  },
}
r6_0.StateId = 1061263
r4_0[1061263] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_44,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061265,
    TypeNextState = r0_0.RT_43,
  },
}
r6_0.StateId = 1061264
r4_0[1061264] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_44,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061266,
    TypeNextState = r0_0.RT_59,
  },
}
r6_0.StateId = 1061265
r4_0[1061265] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_44,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061263,
    TypeNextState = r0_0.RT_43,
  },
}
r6_0.StateId = 1061266
r4_0[1061266] = r6_0
r4_0[1061300] = {
  StateEvent = {
    [1] = r0_0.RT_61,
    [2] = r0_0.RT_62,
  },
  StateId = 1061300,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = r0_0.RT_63,
  [2] = r0_0.RT_62,
  [3] = {
    NextStateId = 10613011,
    TypeNextState = r0_0.RT_64,
  },
}
r6_0.StateId = 1061301
r4_0[1061301] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = r0_0.RT_63,
  [2] = r0_0.RT_61,
  [3] = {
    NextStateId = 10613021,
    TypeNextState = r0_0.RT_64,
  },
}
r6_0.StateId = 1061302
r4_0[1061302] = r6_0
r4_0[1061310] = {
  EventsCurrentState = {
    {
      Function = "StopFX",
      Tag = "Light",
    }
  },
  StateEvent = {
    [1] = r0_0.RT_66,
    [2] = r0_0.RT_67,
  },
  StateId = 1061310,
}
r4_0[1061311] = {
  StateEvent = {
    [1] = r0_0.RT_68,
    [2] = r0_0.RT_69,
    [3] = r0_0.RT_67,
  },
  StateId = 1061311,
}
r4_0[1061312] = {
  StateEvent = {
    [1] = r0_0.RT_68,
    [2] = r0_0.RT_66,
    [3] = r0_0.RT_67,
  },
  StateId = 1061312,
}
r4_0[1061313] = {
  StateEvent = {
    [1] = r0_0.RT_68,
    [2] = r0_0.RT_66,
    [3] = r0_0.RT_69,
  },
  StateId = 1061313,
}
r4_0[1061320] = {
  StateEvent = {
    [1] = r0_0.RT_70,
    [2] = r0_0.RT_71,
  },
  StateId = 1061320,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = r0_0.RT_72,
  [2] = {
    NextStateId = 10613211,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1061321
r4_0[1061321] = r6_0
r4_0[1061323] = {
  StateEvent = {
    [1] = r0_0.RT_70,
  },
  StateId = 1061323,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061401,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1061400
r4_0[1061400] = r6_0
r6_0 = {}
r8_0 = {
  [1] = r0_0.RT_73,
}
r8_0[2] = {
  NextStateId = 1061402,
  TypeNextState = {
    ActiveRange = 10000,
    Type = "DistanceActive",
  },
}
r6_0.StateEvent = r8_0
r6_0.StateId = 1061401
r4_0[1061401] = r6_0
r6_0 = {}
r8_0 = {
  [1] = r0_0.RT_73,
}
r8_0[2] = {
  NextStateId = 1061401,
  TypeNextState = {
    DeActiveRange = 10000,
    Type = "DistanceDeActive",
  },
}
r6_0.StateEvent = r8_0
r6_0.StateId = 1061402
r4_0[1061402] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061501,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1061500
r4_0[1061500] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061500,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1061501
r4_0[1061501] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_51,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061601,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1061600
r4_0[1061600] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_29,
}
r8_0 = {}
r8_0[1] = {
  NextStateId = 1061602,
  TypeNextState = {
    ActiveRange = 1200,
    Type = "DistanceActive",
  },
}
r6_0.StateEvent = r8_0
r6_0.StateId = 1061601
r4_0[1061601] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_44,
}
r8_0 = {
  [1] = r0_0.RT_75,
}
r8_0[2] = {
  NextStateId = 1061603,
  TypeNextState = {
    NeedCountDown = true,
    Param = 6,
    Type = "Time",
  },
}
r6_0.StateEvent = r8_0
r6_0.StateId = 1061602
r4_0[1061602] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_44,
}
r6_0.StateEvent = {
  [1] = r0_0.RT_75,
  [2] = {
    NextStateId = 1061602,
    TypeNextState = r0_0.RT_25,
  },
}
r6_0.StateId = 1061603
r4_0[1061603] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_51,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061901,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1061900
r4_0[1061900] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_29,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061902,
    TypeNextState = r0_0.RT_4,
  },
  [2] = r0_0.RT_76,
}
r6_0.StateId = 1061901
r4_0[1061901] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_44,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061903,
    TypeNextState = r0_0.RT_48,
  },
  [2] = r0_0.RT_76,
}
r6_0.StateId = 1061902
r4_0[1061902] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_29,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061904,
    TypeNextState = r0_0.RT_4,
  },
  [2] = r0_0.RT_76,
}
r6_0.StateId = 1061903
r4_0[1061903] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_44,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1061901,
    TypeNextState = r0_0.RT_48,
  },
  [2] = r0_0.RT_76,
}
r6_0.StateId = 1061904
r4_0[1061904] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1062001,
    TypeNextState = r0_0.RT_4,
  },
  [2] = r0_0.RT_77,
}
r6_0.StateId = 1062000
r4_0[1062000] = r6_0
r4_0[1062001] = {
  StateEvent = {
    [1] = r0_0.RT_77,
  },
  StateId = 1062001,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1062000,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1062002
r4_0[1062002] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1062101,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1062100
r4_0[1062100] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1062102,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 1062101
r4_0[1062101] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1062100,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1062102
r4_0[1062102] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_79,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1070101,
    TypeNextState = r0_0.RT_80,
  },
  [2] = r0_0.RT_81,
}
r6_0.StateId = 1070100
r4_0[1070100] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_83,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1070100,
    TypeNextState = r0_0.RT_84,
  },
  [2] = r0_0.RT_81,
}
r6_0.StateId = 1070101
r4_0[1070101] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_85,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1070100,
    TypeNextState = r0_0.RT_4,
  },
  [2] = {
    NextStateId = 1070101,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1070102
r4_0[1070102] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_85,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1070161,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1070160
r4_0[1070160] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_83,
}
r6_0.StateEvent = {
  [1] = r0_0.RT_86,
  [2] = {
    NextStateId = 1070162,
    TypeNextState = r0_0.RT_84,
  },
}
r6_0.StateId = 1070161
r4_0[1070161] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_83,
}
r6_0.StateEvent = {
  [1] = r0_0.RT_86,
  [2] = {
    NextStateId = 1070161,
    TypeNextState = r0_0.RT_80,
  },
  [3] = {
    NextStateId = 1070163,
    TypeNextState = r0_0.RT_48,
  },
}
r6_0.StateId = 1070162
r4_0[1070162] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_79,
}
r6_0.StateEvent = {
  [1] = r0_0.RT_86,
  [2] = {
    NextStateId = 1070162,
    TypeNextState = r0_0.RT_87,
  },
}
r6_0.StateId = 1070163
r4_0[1070163] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_85,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1070201,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1070200
r4_0[1070200] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_83,
}
r8_0 = {}
r8_0[1] = {
  NextStateId = 1070202,
  TypeNextState = {
    ActiveRange = 5000,
    Type = "DistanceActive",
  },
}
r8_0[2] = r0_0.RT_88
r6_0.StateEvent = r8_0
r6_0.StateId = 1070201
r4_0[1070201] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_83,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1070201,
    TypeNextState = r0_0.RT_64,
  },
  [2] = {
    NextStateId = 1070203,
    TypeNextState = r0_0.RT_48,
  },
}
r6_0.StateId = 1070202
r4_0[1070202] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_89,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1070204,
    TypeNextState = r0_0.RT_25,
  },
  [2] = r0_0.RT_88,
}
r6_0.StateId = 1070203
r4_0[1070203] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_79,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1070205,
    TypeNextState = r0_0.RT_48,
  },
  [2] = r0_0.RT_88,
}
r6_0.StateId = 1070204
r4_0[1070204] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_89,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1070202,
    TypeNextState = r0_0.RT_25,
  },
  [2] = r0_0.RT_88,
}
r6_0.StateId = 1070205
r4_0[1070205] = r6_0
r4_0[1150300] = {
  StateEvent = {
    [1] = r0_0.RT_121,
    [2] = r0_0.RT_122,
    [3] = r0_0.RT_123,
  },
  StateId = 1150300,
}
r4_0[1150301] = {
  StateEvent = {
    [1] = r0_0.RT_124,
    [2] = r0_0.RT_122,
    [3] = r0_0.RT_123,
  },
  StateId = 1150301,
}
r4_0[1150302] = {
  StateEvent = {
    [1] = r0_0.RT_124,
    [2] = r0_0.RT_121,
    [3] = r0_0.RT_123,
  },
  StateId = 1150302,
}
r4_0[1150303] = {
  StateEvent = {
    [1] = r0_0.RT_124,
    [2] = r0_0.RT_121,
    [3] = r0_0.RT_122,
  },
  StateId = 1150303,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_90,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1170101,
    TypeNextState = r0_0.RT_4,
  },
  [2] = r0_0.RT_131,
}
r6_0.StateId = 1170100
r4_0[1170100] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1170100,
    TypeNextState = r0_0.RT_4,
  },
  [2] = r0_0.RT_131,
}
r6_0.StateId = 1170101
r4_0[1170101] = r6_0
r4_0[1170102] = {
  EventsCurrentState = r0_0.RT_90,
  StateId = 1170102,
}
r4_0[1180180] = {
  StateId = 1180180,
}
r4_0[1210021] = {
  StateId = 1210021,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210023,
    TypeNextState = r0_0.RT_95,
  },
  [2] = r0_0.RT_155,
}
r6_0.StateId = 1210022
r4_0[1210022] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210022,
    TypeNextState = r0_0.RT_4,
  },
  [2] = r0_0.RT_155,
}
r6_0.StateId = 1210023
r4_0[1210023] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_157,
    NextStateId = 1210122,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1210121
r4_0[1210121] = r6_0
r4_0[1210122] = {
  StateId = 1210122,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_158,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210131,
    TypeNextState = r0_0.RT_95,
  },
}
r6_0.StateId = 1210130
r4_0[1210130] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_159,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210130,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1210131
r4_0[1210131] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_158,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210141,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1210140
r4_0[1210140] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_159,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210142,
    TypeNextState = r0_0.RT_4,
  },
  [2] = {
    NextStateId = 1210140,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1210141
r4_0[1210141] = r6_0
r4_0[1210142] = {
  EventsCurrentState = r0_0.RT_158,
  StateId = 1210142,
}
r5_0 = 1210150
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_78,
    r0_0.RT_22
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210151,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1210150
r4_0[r5_0] = r6_0
r4_0[1210151] = {
  EventsCurrentState = {
    r0_0.RT_82,
    r0_0.RT_135
  },
  StateId = 1210151,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_158,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210171,
    TypeNextState = r0_0.RT_4,
  },
  [2] = {
    NextStateId = 1210172,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1210170
r4_0[1210170] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_159,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210170,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1210171
r4_0[1210171] = r6_0
r4_0[1210172] = {
  EventsCurrentState = r0_0.RT_158,
  StateId = 1210172,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210181,
    TypeNextState = r0_0.RT_160,
  },
  [2] = r0_0.RT_161,
}
r6_0.StateId = 1210180
r4_0[1210180] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210180,
    TypeNextState = r0_0.RT_48,
  },
  [2] = r0_0.RT_161,
}
r6_0.StateId = 1210181
r4_0[1210181] = r6_0
r4_0[1210182] = {
  EventsCurrentState = r0_0.RT_158,
  StateId = 1210182,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210184,
    TypeNextState = r0_0.RT_160,
  },
}
r6_0.StateId = 1210183
r4_0[1210183] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210185,
    TypeNextState = r0_0.RT_162,
  },
}
r6_0.StateId = 1210184
r4_0[1210184] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210186,
    TypeNextState = r0_0.RT_160,
  },
}
r6_0.StateId = 1210185
r4_0[1210185] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210183,
    TypeNextState = r0_0.RT_162,
  },
}
r6_0.StateId = 1210186
r4_0[1210186] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_159,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210201,
    TypeNextState = r0_0.RT_4,
  },
  [2] = {
    NextStateId = 1210202,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1210200
r4_0[1210200] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_158,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210200,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1210201
r4_0[1210201] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_158,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210200,
    TypeNextState = r0_0.RT_162,
  },
}
r6_0.StateId = 1210202
r4_0[1210202] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_158,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210221,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1210220
r4_0[1210220] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_159,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210222,
    TypeNextState = r0_0.RT_4,
  },
  [2] = r0_0.RT_163,
}
r6_0.StateId = 1210221
r4_0[1210221] = r6_0
r4_0[1210222] = {
  StateEvent = {
    [1] = r0_0.RT_163,
  },
  StateId = 1210222,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_159,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210231,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1210230
r4_0[1210230] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_158,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210230,
    TypeNextState = r0_0.RT_162,
  },
}
r6_0.StateId = 1210231
r4_0[1210231] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_158,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210241,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1210240
r4_0[1210240] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_159,
}
r6_0.StateEvent = {
  [1] = r0_0.RT_164,
  [2] = {
    NextStateId = 1210242,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1210241
r4_0[1210241] = r6_0
r4_0[1210242] = {
  StateEvent = {
    [1] = r0_0.RT_164,
  },
  StateId = 1210242,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_149,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210251,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1210250
r4_0[1210250] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_147,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210250,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1210251
r4_0[1210251] = r6_0
r4_0[1210252] = {
  EventsCurrentState = r0_0.RT_152,
  StateId = 1210252,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210281,
    TypeNextState = r0_0.RT_4,
  },
  [2] = r0_0.RT_165,
}
r6_0.StateId = 1210280
r4_0[1210280] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210282,
    TypeNextState = r0_0.RT_4,
  },
  [2] = r0_0.RT_165,
}
r6_0.StateId = 1210281
r4_0[1210281] = r6_0
r4_0[1210282] = {
  StateEvent = {
    [1] = r0_0.RT_165,
  },
  StateId = 1210282,
}
r4_0[1210283] = {
  StateId = 1210283,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210321,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1210320
r4_0[1210320] = r6_0
r4_0[1210321] = {
  StateId = 1210321,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210341,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1210340
r4_0[1210340] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210342,
    TypeNextState = r0_0.RT_4,
  },
  [2] = {
    NextStateId = 1210340,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1210341
r4_0[1210341] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210343,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1210342
r4_0[1210342] = r6_0
r4_0[1210343] = {
  StateId = 1210343,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210351,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1210350
r4_0[1210350] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210352,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1210351
r4_0[1210351] = r6_0
r4_0[1210352] = {
  StateId = 1210352,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210361,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1210360
r4_0[1210360] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210362,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1210361
r4_0[1210361] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210360,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1210362
r4_0[1210362] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210381,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1210380
r4_0[1210380] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210380,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1210381
r4_0[1210381] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210391,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1210390
r4_0[1210390] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210392,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1210391
r4_0[1210391] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210393,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1210392
r4_0[1210392] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210394,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1210393
r4_0[1210393] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1210395,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1210394
r4_0[1210394] = r6_0
r4_0[1210395] = {
  StateId = 1210395,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1220111,
    TypeNextState = r0_0.RT_166,
  },
}
r6_0.StateId = 1220110
r4_0[1220110] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = r0_0.RT_167,
  [2] = {
    NextStateId = 1220112,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1220111
r4_0[1220111] = r6_0
r4_0[1220112] = {
  StateId = 1220112,
}
r4_0[1220113] = {
  StateEvent = {
    [1] = r0_0.RT_167,
  },
  StateId = 1220113,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_158,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310011,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310010
r4_0[1310010] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_159,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310010,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310011
r4_0[1310011] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_159,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310015,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310014
r4_0[1310014] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310014,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310015
r4_0[1310015] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_158,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310031,
    TypeNextState = r0_0.RT_95,
  },
}
r6_0.StateId = 1310030
r4_0[1310030] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_159,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310030,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310031
r4_0[1310031] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310041,
    TypeNextState = r0_0.RT_166,
  },
}
r6_0.StateId = 1310040
r4_0[1310040] = r6_0
r4_0[1310041] = {
  StateEvent = {
    [1] = r0_0.RT_169,
  },
  StateId = 1310041,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310043,
    TypeNextState = r0_0.RT_4,
  },
  [2] = r0_0.RT_170,
}
r6_0.StateId = 1310042
r4_0[1310042] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310044,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310043
r4_0[1310043] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310043,
    TypeNextState = r0_0.RT_166,
  },
}
r6_0.StateId = 1310044
r4_0[1310044] = r6_0
r4_0[1310045] = {
  EventsCurrentState = r0_0.RT_159,
  StateEvent = {
    [1] = r0_0.RT_170,
    [2] = r0_0.RT_169,
  },
  StateId = 1310045,
}
r4_0[1310070] = {
  EventsCurrentState = r0_0.RT_158,
  StateEvent = {
    [1] = r0_0.RT_171,
    [2] = r0_0.RT_172,
  },
  StateId = 1310070,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_159,
}
r6_0.StateEvent = {
  [1] = r0_0.RT_173,
  [2] = {
    NextStateId = 1310072,
    TypeNextState = r0_0.RT_4,
  },
  [3] = r0_0.RT_172,
}
r6_0.StateId = 1310071
r4_0[1310071] = r6_0
r4_0[1310072] = {
  StateEvent = {
    [1] = r0_0.RT_173,
    [2] = r0_0.RT_171,
  },
  StateId = 1310072,
}
r4_0[1310073] = {
  StateEvent = {
    [1] = r0_0.RT_171,
  },
  StateId = 1310073,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_158,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310081,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310080
r4_0[1310080] = r6_0
r4_0[1310081] = {
  EventsCurrentState = r0_0.RT_159,
  StateEvent = {
    [1] = r0_0.RT_175,
  },
  StateId = 1310081,
}
r4_0[1310082] = {
  StateEvent = {
    [1] = r0_0.RT_176,
  },
  StateId = 1310082,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310084,
    TypeNextState = r0_0.RT_4,
  },
  [2] = r0_0.RT_177,
}
r6_0.StateId = 1310083
r4_0[1310083] = r6_0
r4_0[1310084] = {
  StateEvent = {
    [1] = r0_0.RT_175,
    [2] = r0_0.RT_176,
    [3] = r0_0.RT_177,
  },
  StateId = 1310084,
}
r4_0[1310085] = {
  StateId = 1310085,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_158,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310091,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310090
r4_0[1310090] = r6_0
r4_0[1310091] = {
  EventsCurrentState = r0_0.RT_159,
  StateEvent = r0_0.RT_179,
  StateId = 1310091,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310093,
    TypeNextState = r0_0.RT_4,
  },
  [2] = r0_0.RT_180,
}
r6_0.StateId = 1310092
r4_0[1310092] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310092,
    TypeNextState = r0_0.RT_4,
  },
  [2] = r0_0.RT_180,
  [3] = {
    NextStateId = 1310096,
    TypeNextState = r0_0.RT_4,
  },
  [4] = r0_0.RT_181,
}
r6_0.StateId = 1310093
r4_0[1310093] = r6_0
r4_0[1310094] = {
  EventsCurrentState = r0_0.RT_158,
  StateEvent = {
    [1] = r0_0.RT_181,
  },
  StateId = 1310094,
}
r4_0[1310095] = {
  EventsCurrentState = r0_0.RT_159,
  StateEvent = r0_0.RT_179,
  StateId = 1310095,
}
r4_0[1310096] = {
  StateId = 1310096,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310151,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310150
r4_0[1310150] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310150,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310151
r4_0[1310151] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_159,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310172,
    TypeNextState = r0_0.RT_95,
  },
}
r6_0.StateId = 1310170
r4_0[1310170] = r6_0
r4_0[1310171] = {
  EventsCurrentState = r0_0.RT_158,
  StateEvent = r0_0.RT_183,
  StateId = 1310171,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_159,
}
r6_0.StateEvent = {
  [1] = r0_0.RT_184,
  [2] = {
    NextStateId = 1310171,
    TypeNextState = r0_0.RT_185,
  },
  [3] = r0_0.RT_182,
}
r6_0.StateId = 1310172
r4_0[1310172] = r6_0
r4_0[1310173] = {
  StateEvent = r0_0.RT_183,
  StateId = 1310173,
}
r4_0[1310174] = {
  StateEvent = {
    [1] = r0_0.RT_182,
    [2] = r0_0.RT_186,
  },
  StateId = 1310174,
}
r4_0[1310175] = {
  EventsCurrentState = r0_0.RT_159,
  StateEvent = {
    [1] = r0_0.RT_184,
    [2] = r0_0.RT_186,
  },
  StateId = 1310175,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_159,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310175,
    TypeNextState = r0_0.RT_95,
  },
}
r6_0.StateId = 1310176
r4_0[1310176] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310181,
    TypeNextState = r0_0.RT_95,
  },
  [2] = r0_0.RT_187,
}
r6_0.StateId = 1310180
r4_0[1310180] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = r0_0.RT_187,
  [2] = {
    NextStateId = 1310180,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310181
r4_0[1310181] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310183,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310182
r4_0[1310182] = r6_0
r4_0[1310183] = {
  StateId = 1310183,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310191,
    TypeNextState = r0_0.RT_95,
  },
}
r6_0.StateId = 1310190
r4_0[1310190] = r6_0
r4_0[1310191] = {
  EventsCurrentState = r0_0.RT_159,
  StateId = 1310191,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_158,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310201,
    TypeNextState = r0_0.RT_95,
  },
}
r6_0.StateId = 1310200
r4_0[1310200] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_159,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310200,
    TypeNextState = r0_0.RT_188,
  },
  [2] = {
    NextStateId = 1310202,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310201
r4_0[1310201] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310200,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310202
r4_0[1310202] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_190,
    NextStateId = 1310212,
    TypeNextState = r0_0.RT_95,
  },
}
r6_0.StateId = 1310211
r4_0[1310211] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_190,
    NextStateId = 1310213,
    TypeNextState = r0_0.RT_95,
  },
}
r6_0.StateId = 1310212
r4_0[1310212] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_190,
    NextStateId = 1310214,
    TypeNextState = r0_0.RT_95,
  },
}
r6_0.StateId = 1310213
r4_0[1310213] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_190,
    NextStateId = 1310211,
    TypeNextState = r0_0.RT_95,
  },
}
r6_0.StateId = 1310214
r4_0[1310214] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_190,
    NextStateId = 1310216,
    TypeNextState = r0_0.RT_95,
  },
}
r6_0.StateId = 1310215
r4_0[1310215] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_192,
    NextStateId = 1310215,
    TypeNextState = r0_0.RT_162,
  },
}
r6_0.StateId = 1310216
r4_0[1310216] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_190,
    NextStateId = 1310231,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310230
r4_0[1310230] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_190,
    NextStateId = 1310230,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310231
r4_0[1310231] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310251,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310250
r4_0[1310250] = r6_0
r4_0[1310251] = {
  StateId = 1310251,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310261,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310260
r4_0[1310260] = r6_0
r4_0[1310261] = {
  StateId = 1310261,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310291,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310290
r4_0[1310290] = r6_0
r4_0[1310291] = {
  StateId = 1310291,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310311,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310310
r4_0[1310310] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310310,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310311
r4_0[1310311] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310321,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310320
r4_0[1310320] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310320,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310321
r4_0[1310321] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310331,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310330
r4_0[1310330] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310330,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310331
r4_0[1310331] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310341,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310340
r4_0[1310340] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310340,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310341
r4_0[1310341] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310351,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310350
r4_0[1310350] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310350,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310351
r4_0[1310351] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310361,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310360
r4_0[1310360] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310360,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310361
r4_0[1310361] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310371,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310370
r4_0[1310370] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310370,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310371
r4_0[1310371] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310381,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310380
r4_0[1310380] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310380,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310381
r4_0[1310381] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310391,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310390
r4_0[1310390] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310390,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310391
r4_0[1310391] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310451,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310450
r4_0[1310450] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310450,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310451
r4_0[1310451] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310461,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310460
r4_0[1310460] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310460,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310461
r4_0[1310461] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310471,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310470
r4_0[1310470] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310470,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310471
r4_0[1310471] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310481,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310480
r4_0[1310480] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310480,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310481
r4_0[1310481] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310491,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310490
r4_0[1310490] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310490,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310491
r4_0[1310491] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310501,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310500
r4_0[1310500] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310500,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310501
r4_0[1310501] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310511,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310510
r4_0[1310510] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310510,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310511
r4_0[1310511] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310531,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310530
r4_0[1310530] = r6_0
r4_0[1310531] = {
  StateId = 1310531,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310541,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310540
r4_0[1310540] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310542,
    TypeNextState = r0_0.RT_4,
  },
  [2] = {
    NextStateId = 1310540,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310541
r4_0[1310541] = r6_0
r4_0[1310542] = {
  StateId = 1310542,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310561,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310560
r4_0[1310560] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310562,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310561
r4_0[1310561] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310563,
    TypeNextState = r0_0.RT_4,
  },
  [2] = r0_0.RT_193,
}
r6_0.StateId = 1310562
r4_0[1310562] = r6_0
r4_0[1310563] = {
  StateEvent = {
    [1] = r0_0.RT_193,
  },
  StateId = 1310563,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310565,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310564
r4_0[1310564] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310560,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310565
r4_0[1310565] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310571,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310570
r4_0[1310570] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310572,
    TypeNextState = r0_0.RT_4,
  },
  [2] = r0_0.RT_194,
}
r6_0.StateId = 1310571
r4_0[1310571] = r6_0
r4_0[1310572] = {
  StateEvent = {
    [1] = r0_0.RT_194,
  },
  StateId = 1310572,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1310570,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1310573
r4_0[1310573] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1500111,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1500110
r4_0[1500110] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = r0_0.RT_195,
  [2] = {
    NextStateId = 1500112,
    TypeNextState = r0_0.RT_43,
  },
}
r6_0.StateId = 1500111
r4_0[1500111] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = r0_0.RT_195,
  [2] = {
    NextStateId = 1500113,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1500112
r4_0[1500112] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1500110,
    TypeNextState = r0_0.RT_43,
  },
}
r6_0.StateId = 1500113
r4_0[1500113] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1610012,
    TypeNextState = r0_0.RT_95,
  },
  [2] = {
    NextStateId = 1610012,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1610011
r4_0[1610011] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 1610011,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 1610012
r4_0[1610012] = r6_0
r5_0 = 3900111
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_78,
    r0_0.RT_102,
    {
      Function = "PlayMontage",
      Mesh = "Mesh",
      MontagePath = "AnimMontage\'/Game/Asset/Scene/EN002_Haiboliya/Common/Prop/Animation/Shouwei_Maer_Montage.Shouwei_Maer_Montage\'",
      SectionName = "Start",
    }
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3900112,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3900111
r4_0[r5_0] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_214,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3900111,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3900112
r4_0[3900112] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_214,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3900111,
    TypeNextState = r0_0.RT_25,
  },
}
r6_0.StateId = 3900113
r4_0[3900113] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_216,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3900122,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3900121
r4_0[3900121] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_214,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3900121,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3900122
r4_0[3900122] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_214,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3900121,
    TypeNextState = r0_0.RT_25,
  },
}
r6_0.StateId = 3900123
r4_0[3900123] = r6_0
r5_0 = 3900130
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_82,
    r0_0.RT_9,
    r0_0.RT_22
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3900131,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3900130
r4_0[r5_0] = r6_0
r5_0 = 3900131
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_78,
    r0_0.RT_102,
    r0_0.RT_20
  },
}
r6_0.StateEvent = {
  [1] = r0_0.RT_217,
  [2] = {
    NextStateId = 3900132,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3900131
r4_0[r5_0] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_109,
}
r6_0.StateEvent = {
  [1] = r0_0.RT_217,
  [2] = {
    NextStateId = 3900133,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3900132
r4_0[3900132] = r6_0
r4_0[3900133] = {
  EventsCurrentState = r0_0.RT_79,
  StateEvent = {
    [1] = r0_0.RT_217,
  },
  StateId = 3900133,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_219,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3900142,
    TypeNextState = r0_0.RT_220,
  },
}
r6_0.StateId = 3900141
r4_0[3900141] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_221,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3900143,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3900142
r4_0[3900142] = r6_0
r4_0[3900143] = {
  EventsCurrentState = r0_0.RT_224,
  StateId = 3900143,
}
r4_0[3900151] = {
  EventsCurrentState = r0_0.RT_159,
  StateId = 3900151,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_158,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3900151,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3900152
r4_0[3900152] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_214,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3900181,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3900180
r4_0[3900180] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_216,
}
r8_0 = {}
r8_0[1] = {
  NextStateId = 3900182,
  TypeNextState = {
    Param = 60,
    Type = "Time",
  },
}
r8_0[2] = r0_0.RT_225
r6_0.StateEvent = r8_0
r6_0.StateId = 3900181
r4_0[3900181] = r6_0
r4_0[3900182] = {
  EventsCurrentState = r0_0.RT_216,
  StateEvent = r0_0.RT_226,
  StateId = 3900182,
}
r4_0[3900183] = {
  EventsCurrentState = r0_0.RT_214,
  StateEvent = r0_0.RT_226,
  StateId = 3900183,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_85,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3900131,
    TypeNextState = r0_0.RT_215,
  },
}
r6_0.StateId = 3900200
r4_0[3900200] = r6_0
r5_0 = 3900700
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_82,
    r0_0.RT_229
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3900701,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3900700
r4_0[r5_0] = r6_0
r5_0 = 3900701
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_78,
    r0_0.RT_230
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3900700,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3900701
r4_0[r5_0] = r6_0
r4_0[3901500] = {
  EventsCurrentState = r0_0.RT_158,
  StateEvent = {
    [1] = r0_0.RT_231,
    [2] = r0_0.RT_232,
  },
  StateId = 3901500,
}
r4_0[3901501] = {
  EventsCurrentState = r0_0.RT_159,
  StateEvent = {
    [1] = r0_0.RT_233,
    [2] = r0_0.RT_232,
  },
  StateId = 3901501,
}
r4_0[3901502] = {
  EventsCurrentState = r0_0.RT_159,
  StateEvent = {
    [1] = r0_0.RT_233,
    [2] = r0_0.RT_231,
  },
  StateId = 3901502,
}
r4_0[3901510] = {
  EventsCurrentState = r0_0.RT_158,
  StateEvent = {
    [1] = r0_0.RT_234,
  },
  StateId = 3901510,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_159,
}
r6_0.StateEvent = {
  [1] = r0_0.RT_235,
  [2] = {
    NextStateId = 3901512,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3901511
r4_0[3901511] = r6_0
r4_0[3901512] = {
  EventsCurrentState = r0_0.RT_158,
  StateEvent = {
    [1] = r0_0.RT_235,
    [2] = r0_0.RT_234,
  },
  StateId = 3901512,
}
r5_0 = 3901600
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_82,
    r0_0.RT_229,
    r0_0.RT_22,
    r0_0.RT_9
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3901601,
    TypeNextState = r0_0.RT_4,
  },
  [2] = {
    NextStateId = 3901603,
    TypeNextState = r0_0.RT_4,
  },
  [3] = {
    NextStateId = 3901605,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3901600
r4_0[r5_0] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_236,
}
r6_0.StateEvent = {
  [1] = r0_0.RT_237,
  [2] = {
    NextStateId = 3901602,
    TypeNextState = r0_0.RT_95,
  },
}
r6_0.StateId = 3901601
r4_0[3901601] = r6_0
r4_0[3901602] = {
  EventsCurrentState = r0_0.RT_238,
  StateEvent = {
    [1] = r0_0.RT_237,
  },
  StateId = 3901602,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_236,
}
r6_0.StateEvent = {
  [1] = r0_0.RT_237,
  [2] = {
    NextStateId = 3901604,
    TypeNextState = r0_0.RT_95,
  },
}
r6_0.StateId = 3901603
r4_0[3901603] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_238,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3901603,
    TypeNextState = r0_0.RT_239,
  },
}
r6_0.StateId = 3901604
r4_0[3901604] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_236,
}
r6_0.StateEvent = {
  [1] = r0_0.RT_237,
  [2] = {
    NextStateId = 3901606,
    TypeNextState = r0_0.RT_95,
  },
}
r6_0.StateId = 3901605
r4_0[3901605] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_238,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3901600,
    TypeNextState = r0_0.RT_239,
  },
}
r6_0.StateId = 3901606
r4_0[3901606] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_158,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3901701,
    TypeNextState = r0_0.RT_4,
  },
  [2] = r0_0.RT_240,
}
r6_0.StateId = 3901700
r4_0[3901700] = r6_0
r4_0[3901701] = {
  EventsCurrentState = r0_0.RT_159,
  StateEvent = {
    [1] = r0_0.RT_240,
    [2] = r0_0.RT_241,
  },
  StateId = 3901701,
}
r4_0[3901702] = {
  EventsCurrentState = r0_0.RT_159,
  StateEvent = {
    [1] = r0_0.RT_241,
  },
  StateId = 3901702,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_227,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3901801,
    TypeNextState = r0_0.RT_4,
  },
  [2] = {
    NextStateId = 3901802,
    TypeNextState = r0_0.RT_95,
  },
}
r6_0.StateId = 3901800
r4_0[3901800] = r6_0
r4_0[3901801] = {
  EventsCurrentState = r0_0.RT_228,
  StateEvent = r0_0.RT_243,
  StateId = 3901801,
}
r4_0[3901802] = {
  EventsCurrentState = r0_0.RT_228,
  StateEvent = r0_0.RT_243,
  StateId = 3901802,
}
r4_0[3901803] = {
  StateId = 3901803,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_244,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3902001,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3902000
r4_0[3902000] = r6_0
r5_0 = 3902001
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_148,
    r0_0.RT_82
  },
}
r8_0 = {}
r8_0[1] = {
  NextStateId = 3902002,
  TypeNextState = {
    ActiveRange = 2000,
    Type = "DistanceActive",
  },
}
r8_0[2] = r0_0.RT_245
r6_0.StateEvent = r8_0
r6_0.StateId = 3902001
r4_0[r5_0] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_246,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3902001,
    TypeNextState = r0_0.RT_247,
  },
  [2] = r0_0.RT_245,
}
r6_0.StateId = 3902002
r4_0[3902002] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_158,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3902101,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3902100
r4_0[3902100] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_159,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3902100,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3902101
r4_0[3902101] = r6_0
r4_0[3902300] = {
  EventsCurrentState = r0_0.RT_159,
  StateEvent = {
    [1] = r0_0.RT_248,
    [2] = r0_0.RT_249,
  },
  StateId = 3902300,
}
r4_0[3902301] = {
  StateEvent = {
    [1] = r0_0.RT_249,
    [2] = r0_0.RT_250,
  },
  StateId = 3902301,
}
r4_0[3902302] = {
  StateEvent = {
    [1] = r0_0.RT_248,
    [2] = r0_0.RT_250,
  },
  StateId = 3902302,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_159,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3902401,
    TypeNextState = r0_0.RT_251,
  },
  [2] = {
    NextStateId = 3902402,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3902400
r4_0[3902400] = r6_0
r4_0[3902401] = {
  EventsCurrentState = r0_0.RT_158,
  StateEvent = r0_0.RT_253,
  StateId = 3902401,
}
r4_0[3902402] = {
  EventsCurrentState = r0_0.RT_158,
  StateEvent = r0_0.RT_253,
  StateId = 3902402,
}
r4_0[3902500] = {
  EventsCurrentState = r0_0.RT_159,
  StateEvent = {
    [1] = r0_0.RT_254,
    [2] = r0_0.RT_255,
  },
  StateId = 3902500,
}
r4_0[3902501] = {
  StateEvent = {
    [1] = r0_0.RT_255,
    [2] = r0_0.RT_256,
  },
  StateId = 3902501,
}
r4_0[3902502] = {
  StateEvent = {
    [1] = r0_0.RT_254,
    [2] = r0_0.RT_256,
  },
  StateId = 3902502,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = r0_0.RT_257,
  [2] = r0_0.RT_258,
  [3] = r0_0.RT_259,
  [4] = {
    NextStateId = 3902708,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3902700
r4_0[3902700] = r6_0
r4_0[3902701] = {
  StateEvent = {
    [1] = r0_0.RT_260,
    [2] = r0_0.RT_258,
    [3] = r0_0.RT_259,
    [4] = r0_0.RT_261,
    [5] = r0_0.RT_262,
    [6] = r0_0.RT_263,
  },
  StateId = 3902701,
}
r4_0[3902702] = {
  StateEvent = {
    [1] = r0_0.RT_257,
    [2] = r0_0.RT_260,
    [3] = r0_0.RT_259,
    [4] = r0_0.RT_261,
    [5] = r0_0.RT_262,
    [6] = r0_0.RT_263,
  },
  StateId = 3902702,
}
r4_0[3902703] = {
  StateEvent = {
    [1] = r0_0.RT_257,
    [2] = r0_0.RT_258,
    [3] = r0_0.RT_260,
    [4] = r0_0.RT_261,
    [5] = r0_0.RT_262,
    [6] = r0_0.RT_263,
  },
  StateId = 3902703,
}
r4_0[3902704] = {
  StateEvent = r0_0.RT_265,
  StateId = 3902704,
}
r4_0[3902705] = {
  StateEvent = r0_0.RT_265,
  StateId = 3902705,
}
r4_0[3902706] = {
  StateEvent = r0_0.RT_265,
  StateId = 3902706,
}
r4_0[3902707] = {
  StateId = 3902707,
}
r4_0[3902708] = {
  StateEvent = {
    [1] = r0_0.RT_260,
  },
  StateId = 3902708,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3902711,
    TypeNextState = r0_0.RT_4,
  },
  [2] = {
    NextStateId = 3902712,
    TypeNextState = r0_0.RT_4,
  },
  [3] = {
    NextStateId = 3902713,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3902710
r4_0[3902710] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = r0_0.RT_266,
  [2] = {
    NextStateId = 3902714,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3902711
r4_0[3902711] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = r0_0.RT_266,
  [2] = {
    NextStateId = 3902715,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3902712
r4_0[3902712] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = r0_0.RT_266,
  [2] = {
    NextStateId = 3902716,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3902713
r4_0[3902713] = r6_0
r4_0[3902714] = {
  StateId = 3902714,
}
r4_0[3902715] = {
  StateId = 3902715,
}
r4_0[3902716] = {
  StateId = 3902716,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3902721,
    TypeNextState = r0_0.RT_4,
  },
  [2] = {
    NextStateId = 3902722,
    TypeNextState = r0_0.RT_4,
  },
  [3] = {
    NextStateId = 3902723,
    TypeNextState = r0_0.RT_4,
  },
  [4] = {
    NextStateId = 3902724,
    TypeNextState = r0_0.RT_4,
  },
  [5] = {
    NextStateId = 3902725,
    TypeNextState = r0_0.RT_4,
  },
  [6] = {
    NextStateId = 3902726,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3902720
r4_0[3902720] = r6_0
r4_0[3902721] = {
  StateEvent = r0_0.RT_268,
  StateId = 3902721,
}
r4_0[3902722] = {
  StateEvent = r0_0.RT_268,
  StateId = 3902722,
}
r4_0[3902723] = {
  StateEvent = r0_0.RT_268,
  StateId = 3902723,
}
r4_0[3902724] = {
  StateEvent = r0_0.RT_270,
  StateId = 3902724,
}
r4_0[3902725] = {
  StateEvent = r0_0.RT_270,
  StateId = 3902725,
}
r4_0[3902726] = {
  StateEvent = r0_0.RT_270,
  StateId = 3902726,
}
r4_0[3902727] = {
  StateId = 3902727,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3902751,
    TypeNextState = r0_0.RT_4,
  },
  [2] = {
    NextStateId = 3902752,
    TypeNextState = r0_0.RT_4,
  },
  [3] = {
    NextStateId = 3902753,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3902750
r4_0[3902750] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = r0_0.RT_271,
  [2] = {
    NextStateId = 3902754,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3902751
r4_0[3902751] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = r0_0.RT_271,
  [2] = {
    NextStateId = 3902755,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3902752
r4_0[3902752] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = r0_0.RT_271,
  [2] = {
    NextStateId = 3902756,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3902753
r4_0[3902753] = r6_0
r4_0[3902754] = {
  StateEvent = r0_0.RT_273,
  StateId = 3902754,
}
r4_0[3902755] = {
  StateEvent = r0_0.RT_273,
  StateId = 3902755,
}
r4_0[3902756] = {
  StateEvent = r0_0.RT_273,
  StateId = 3902756,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3902758,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3902757
r4_0[3902757] = r6_0
r4_0[3902758] = {
  StateId = 3902758,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3902791,
    TypeNextState = r0_0.RT_4,
  },
  [2] = {
    NextStateId = 3902794,
    TypeNextState = r0_0.RT_4,
  },
  [3] = {
    NextStateId = 3902797,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3902790
r4_0[3902790] = r6_0
r4_0[3902791] = {
  StateEvent = {
    [1] = r0_0.RT_274,
    [2] = r0_0.RT_275,
  },
  StateId = 3902791,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3902793,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3902792
r4_0[3902792] = r6_0
r4_0[3902793] = {
  StateId = 3902793,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3902795,
    TypeNextState = r0_0.RT_4,
  },
  [2] = r0_0.RT_275,
  [3] = r0_0.RT_274,
}
r6_0.StateId = 3902794
r4_0[3902794] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3902796,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3902795
r4_0[3902795] = r6_0
r4_0[3902796] = {
  StateId = 3902796,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3902798,
    TypeNextState = r0_0.RT_4,
  },
  [2] = r0_0.RT_275,
  [3] = r0_0.RT_274,
}
r6_0.StateId = 3902797
r4_0[3902797] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3902799,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3902798
r4_0[3902798] = r6_0
r4_0[3902799] = {
  StateId = 3902799,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3902801,
    TypeNextState = r0_0.RT_276,
  },
}
r6_0.StateId = 3902800
r4_0[3902800] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3902802,
    TypeNextState = r0_0.RT_10,
  },
}
r6_0.StateId = 3902801
r4_0[3902801] = r6_0
r4_0[3902802] = {
  StateId = 3902802,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3902800,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3902803
r4_0[3902803] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_159,
}
r6_0.StateEvent = {
  [1] = r0_0.RT_277,
  [2] = r0_0.RT_278,
  [3] = {
    NextStateId = 3902903,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 3902900
r4_0[3902900] = r6_0
r4_0[3902901] = {
  StateEvent = {
    [1] = r0_0.RT_278,
    [2] = r0_0.RT_279,
  },
  StateId = 3902901,
}
r4_0[3902902] = {
  StateEvent = {
    [1] = r0_0.RT_277,
    [2] = r0_0.RT_279,
  },
  StateId = 3902902,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_158,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3902900,
    TypeNextState = r0_0.RT_188,
  },
}
r6_0.StateId = 3902903
r4_0[3902903] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3903001,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 3903000
r4_0[3903000] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3903002,
    TypeNextState = r0_0.RT_10,
  },
}
r6_0.StateId = 3903001
r4_0[3903001] = r6_0
r4_0[3903002] = {
  StateEvent = r0_0.RT_281,
  StateId = 3903002,
}
r4_0[3903003] = {
  StateEvent = r0_0.RT_281,
  StateId = 3903003,
}
r4_0[3903100] = {
  StateEvent = r0_0.RT_284,
  StateId = 3903100,
}
r6_0 = {}
r8_0 = {}
r8_0[1] = {
  NextStateId = 3903103,
  TypeNextState = {
    ActiveRange = 500,
    Type = "DistanceActive",
  },
}
r6_0.StateEvent = r8_0
r6_0.StateId = 3903101
r4_0[3903101] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3903103,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 3903102
r4_0[3903102] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3903104,
    TypeNextState = r0_0.RT_10,
  },
}
r6_0.StateId = 3903103
r4_0[3903103] = r6_0
r4_0[3903104] = {
  StateEvent = r0_0.RT_284,
  StateId = 3903104,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = r0_0.RT_285,
  [2] = r0_0.RT_286,
  [3] = r0_0.RT_287,
  [4] = {
    NextStateId = 3903208,
    TypeNextState = r0_0.RT_4,
  },
  [5] = r0_0.RT_288,
  [6] = r0_0.RT_289,
}
r6_0.StateId = 3903200
r4_0[3903200] = r6_0
r4_0[3903201] = {
  StateEvent = {
    [1] = r0_0.RT_290,
    [2] = r0_0.RT_286,
    [3] = r0_0.RT_287,
    [4] = r0_0.RT_289,
    [5] = r0_0.RT_291,
    [6] = r0_0.RT_288,
  },
  StateId = 3903201,
}
r4_0[3903202] = {
  StateEvent = {
    [1] = r0_0.RT_285,
    [2] = r0_0.RT_290,
    [3] = r0_0.RT_287,
    [4] = r0_0.RT_289,
    [5] = r0_0.RT_291,
    [6] = r0_0.RT_288,
  },
  StateId = 3903202,
}
r4_0[3903203] = {
  StateEvent = {
    [1] = r0_0.RT_285,
    [2] = r0_0.RT_286,
    [3] = r0_0.RT_290,
    [4] = r0_0.RT_289,
    [5] = r0_0.RT_291,
    [6] = r0_0.RT_288,
  },
  StateId = 3903203,
}
r4_0[3903204] = {
  StateId = 3903204,
}
r4_0[3903205] = {
  StateId = 3903205,
}
r4_0[3903206] = {
  StateId = 3903206,
}
r4_0[3903208] = {
  StateEvent = {
    [1] = r0_0.RT_290,
  },
  StateId = 3903208,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3903601,
    TypeNextState = r0_0.RT_4,
  },
  [2] = r0_0.RT_292,
  [3] = r0_0.RT_293,
}
r6_0.StateId = 3903600
r4_0[3903600] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3903602,
    TypeNextState = r0_0.RT_4,
  },
  [2] = r0_0.RT_292,
}
r6_0.StateId = 3903601
r4_0[3903601] = r6_0
r4_0[3903602] = {
  StateEvent = {
    [1] = r0_0.RT_292,
  },
  StateId = 3903602,
}
r4_0[3903603] = {
  StateEvent = {
    [1] = r0_0.RT_293,
  },
  StateId = 3903603,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3903605,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3903604
r4_0[3903604] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3903600,
    TypeNextState = r0_0.RT_4,
  },
  [2] = r0_0.RT_292,
}
r6_0.StateId = 3903605
r4_0[3903605] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3904201,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3904200
r4_0[3904200] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3904202,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3904201
r4_0[3904201] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3904203,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3904202
r4_0[3904202] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3904204,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3904203
r4_0[3904203] = r6_0
r4_0[3904204] = {
  StateId = 3904204,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3904301,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3904300
r4_0[3904300] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3904302,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3904301
r4_0[3904301] = r6_0
r4_0[3904302] = {
  StateId = 3904302,
}
r4_0[3904400] = {
  StateEvent = {
    [1] = r0_0.RT_294,
  },
  StateId = 3904400,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3904402,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3904401
r4_0[3904401] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3904403,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3904402
r4_0[3904402] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3904404,
    TypeNextState = r0_0.RT_25,
  },
}
r6_0.StateId = 3904403
r4_0[3904403] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3904405,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3904404
r4_0[3904404] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3904406,
  },
}
r6_0.StateId = 3904405
r4_0[3904405] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3904501,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3904500
r4_0[3904500] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3904502,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 3904501
r4_0[3904501] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3904500,
    TypeNextState = r0_0.RT_4,
  },
  [2] = r0_0.RT_294,
}
r6_0.StateId = 3904502
r4_0[3904502] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3904602,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3904601
r4_0[3904601] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 3904601,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 3904602
r4_0[3904602] = r6_0
r4_0[4900101] = {
  EventsCurrentState = r0_0.RT_159,
  StateEvent = {
    [1] = r0_0.RT_297,
    [2] = r0_0.RT_298,
  },
  StateId = 4900101,
}
r4_0[4900102] = {
  StateEvent = {
    [1] = r0_0.RT_297,
  },
  StateId = 4900102,
}
r4_0[4900103] = {
  StateEvent = {
    [1] = r0_0.RT_298,
  },
  StateId = 4900103,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_158,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 4900101,
    TypeNextState = r0_0.RT_215,
  },
}
r6_0.StateId = 4900104
r4_0[4900104] = r6_0
r5_0 = 4900710
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_1,
    r0_0.RT_299,
    r0_0.RT_300,
    r0_0.RT_20,
    r0_0.RT_57
  },
}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_302,
    NextStateId = 4900711,
    TypeNextState = r0_0.RT_3,
  },
  [2] = r0_0.RT_303,
}
r6_0.StateId = 4900710
r4_0[r5_0] = r6_0
r4_0[4900711] = {
  EventsCurrentState = {
    r0_0.RT_17,
    r0_0.RT_299,
    r0_0.RT_304,
    r0_0.RT_305,
    r0_0.RT_306,
    r0_0.RT_13
  },
  StateEvent = {
    [1] = r0_0.RT_307,
    [2] = r0_0.RT_303,
  },
  StateId = 4900711,
}
r4_0[4900712] = {
  EventsCurrentState = r0_0.RT_309,
  StateEvent = {
    [1] = r0_0.RT_307,
  },
  StateId = 4900712,
}
r5_0 = 4900730
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_1,
    r0_0.RT_310,
    r0_0.RT_311,
    r0_0.RT_20,
    r0_0.RT_57
  },
}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_313,
    NextStateId = 4900731,
    TypeNextState = r0_0.RT_3,
  },
  [2] = r0_0.RT_314,
}
r6_0.StateId = 4900730
r4_0[r5_0] = r6_0
r4_0[4900731] = {
  EventsCurrentState = {
    r0_0.RT_17,
    r0_0.RT_310,
    r0_0.RT_315,
    r0_0.RT_316,
    r0_0.RT_317,
    r0_0.RT_13
  },
  StateEvent = {
    [1] = r0_0.RT_318,
    [2] = r0_0.RT_314,
  },
  StateId = 4900731,
}
r4_0[4900732] = {
  EventsCurrentState = {
    r0_0.RT_119,
    r0_0.RT_308,
    r0_0.RT_317,
    r0_0.RT_22,
    r0_0.RT_315,
    r0_0.RT_57
  },
  StateEvent = {
    [1] = r0_0.RT_318,
  },
  StateId = 4900732,
}
r5_0 = 4900750
r6_0 = {
  EventsCurrentState = r0_0.RT_319,
}
r7_0 = "StateEvent"
r8_0 = {}
r8_0[1] = {
  EventsNextState = {
    {
      EffectId = 900023,
      Function = "PlayFX",
      NeedFinish = false,
      Tag = "Niagara1",
    }
  },
  NextStateId = 4900751,
  TypeNextState = r0_0.RT_4,
}
r8_0[2] = r0_0.RT_321
r6_0[r7_0] = r8_0
r6_0.StateId = 4900750
r4_0[r5_0] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_322,
}
r6_0.StateEvent = {
  [1] = r0_0.RT_321,
  [2] = {
    EventsNextState = r0_0.RT_324,
    NextStateId = 4900750,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 4900751
r4_0[4900751] = r6_0
r4_0[4900752] = {
  EventsCurrentState = r0_0.RT_309,
  StateId = 4900752,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_325,
}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_320,
    NextStateId = 4900762,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 4900761
r4_0[4900761] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_325,
}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_320,
    NextStateId = 4900763,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 4900762
r4_0[4900762] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_325,
}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_320,
    NextStateId = 4900764,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 4900763
r4_0[4900763] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_325,
}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_320,
    NextStateId = 4900761,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 4900764
r4_0[4900764] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 4900802,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 4900801
r4_0[4900801] = r6_0
r6_0 = {
  EventsCurrentState = r0_0.RT_92,
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 4900801,
    TypeNextState = r0_0.RT_8,
  },
}
r6_0.StateId = 4900802
r4_0[4900802] = r6_0
r5_0 = 4920010
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_199,
    r0_0.RT_17,
    r0_0.RT_78,
    r0_0.RT_13,
    r0_0.RT_102
  },
}
r6_0.StateEvent = {
  [1] = r0_0.RT_326,
  [2] = {
    NextStateId = 4920013,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 4920010
r4_0[r5_0] = r6_0
r4_0[4920011] = {
  EventsCurrentState = r0_0.RT_327,
  StateEvent = {
    [1] = r0_0.RT_328,
    [2] = r0_0.RT_329,
    [3] = r0_0.RT_330,
    [4] = r0_0.RT_331,
  },
  StateId = 4920011,
}
r5_0 = 4920012
r6_0 = {
  EventsCurrentState = {
    r0_0.RT_199,
    r0_0.RT_20,
    r0_0.RT_102
  },
}
r8_0 = {}
r8_0[1] = {
  NextStateId = 4920010,
  TypeNextState = {
    InteractiveId = 912,
    Type = "Interactive",
  },
}
r8_0[2] = r0_0.RT_326
r6_0.StateEvent = r8_0
r6_0.StateId = 4920012
r4_0[r5_0] = r6_0
r4_0[4920013] = {
  EventsCurrentState = r0_0.RT_327,
  StateEvent = {
    [1] = r0_0.RT_329,
    [2] = r0_0.RT_328,
  },
  StateId = 4920013,
}
r4_0[4920014] = {
  EventsCurrentState = r0_0.RT_29,
  StateEvent = {
    [1] = r0_0.RT_326,
    [2] = r0_0.RT_331,
  },
  StateId = 4920014,
}
r4_0[4920015] = {
  EventsCurrentState = r0_0.RT_29,
  StateEvent = {
    [1] = r0_0.RT_326,
    [2] = r0_0.RT_330,
  },
  StateId = 4920015,
}
r4_0[6100171] = {
  EventsCurrentState = {
    r0_0.RT_119,
    r0_0.RT_382
  },
  StateId = 6100171,
}
r4_0[7040311] = {
  StateEvent = {
    [1] = r0_0.RT_430,
    [2] = r0_0.RT_433,
    [3] = r0_0.RT_431,
    [4] = r0_0.RT_432,
  },
  StateId = 7040311,
}
r4_0[7040321] = {
  StateEvent = {
    [1] = r0_0.RT_431,
    [2] = r0_0.RT_433,
    [3] = r0_0.RT_429,
    [4] = r0_0.RT_432,
  },
  StateId = 7040321,
}
r4_0[7040331] = {
  StateEvent = {
    [1] = r0_0.RT_432,
    [2] = r0_0.RT_433,
    [3] = r0_0.RT_429,
    [4] = r0_0.RT_430,
  },
  StateId = 7040331,
}
r4_0[7040341] = {
  StateEvent = {
    [1] = r0_0.RT_433,
    [2] = r0_0.RT_429,
    [3] = r0_0.RT_430,
    [4] = r0_0.RT_431,
  },
  StateId = 7040341,
}
r6_0 = {
  EventsCurrentState = r0_0.RT_2,
}
r6_0.StateEvent = {
  [1] = {
    EventsNextState = r0_0.RT_6,
    NextStateId = 9020002,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 9020001
r4_0[9020001] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 9020001,
    TypeNextState = r0_0.RT_10,
  },
}
r6_0.StateId = 9020002
r4_0[9020002] = r6_0
r4_0[9020003] = {
  EventsCurrentState = r0_0.RT_120,
  StateEvent = r0_0.RT_464,
  StateId = 9020003,
}
r4_0[9020004] = {
  EventsCurrentState = r0_0.RT_120,
  StateEvent = r0_0.RT_464,
  StateId = 9020004,
}
r4_0[9020005] = {
  EventsCurrentState = r0_0.RT_120,
  StateEvent = r0_0.RT_464,
  StateId = 9020005,
}
r4_0[9020006] = {
  EventsCurrentState = r0_0.RT_120,
  StateEvent = r0_0.RT_464,
  StateId = 9020006,
}
r4_0[9020007] = {
  EventsCurrentState = r0_0.RT_120,
  StateEvent = r0_0.RT_464,
  StateId = 9020007,
}
r4_0[9020008] = {
  EventsCurrentState = r0_0.RT_120,
  StateEvent = r0_0.RT_464,
  StateId = 9020008,
}
r4_0[9020009] = {
  EventsCurrentState = r0_0.RT_120,
  StateEvent = r0_0.RT_464,
  StateId = 9020009,
}
r4_0[9020010] = {
  EventsCurrentState = r0_0.RT_120,
  StateEvent = r0_0.RT_464,
  StateId = 9020010,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = r0_0.RT_63,
  [2] = r0_0.RT_62,
  [3] = {
    NextStateId = 1061301,
    TypeNextState = r0_0.RT_65,
  },
}
r6_0.StateId = 10613011
r4_0[10613011] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = r0_0.RT_63,
  [2] = r0_0.RT_61,
  [3] = {
    NextStateId = 1061302,
    TypeNextState = r0_0.RT_65,
  },
}
r6_0.StateId = 10613021
r4_0[10613021] = r6_0
r4_0[10613211] = {
  StateEvent = {
    [1] = r0_0.RT_72,
    [2] = r0_0.RT_71,
  },
  StateId = 10613211,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 11301171,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 11301170
r4_0[11301170] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 11301170,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 11301171
r4_0[11301171] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 11301181,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 11301180
r4_0[11301180] = r6_0
r4_0[11301181] = {
  StateId = 11301181,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 11301191,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 11301190
r4_0[11301190] = r6_0
r4_0[11301191] = {
  StateId = 11301191,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 11301201,
    TypeNextState = r0_0.RT_3,
  },
  [2] = {
    NextStateId = 11301202,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 11301200
r4_0[11301200] = r6_0
r4_0[11301201] = {
  StateId = 11301201,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 11301200,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 11301202
r4_0[11301202] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 11301211,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 11301210
r4_0[11301210] = r6_0
r4_0[11301211] = {
  StateId = 11301211,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 11301221,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 11301220
r4_0[11301220] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 11301222,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 11301221
r4_0[11301221] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 11301223,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 11301222
r4_0[11301222] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 11301224,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 11301223
r4_0[11301223] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 11301225,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 11301224
r4_0[11301224] = r6_0
r4_0[11301225] = {
  StateId = 11301225,
}
r4_0[11301230] = {
  EventsCurrentState = {
    r0_0.RT_111,
    r0_0.RT_112,
    r0_0.RT_113,
    r0_0.RT_114,
    r0_0.RT_115
  },
  StateEvent = {
    [1] = r0_0.RT_116,
    [2] = r0_0.RT_117,
  },
  StateId = 11301230,
}
r4_0[11301231] = {
  EventsCurrentState = {
    r0_0.RT_111,
    r0_0.RT_112,
    r0_0.RT_113,
    r0_0.RT_114,
    {
      EffectId = 900071,
      Function = "PlayFX",
      Tag = "GearS",
    }
  },
  StateEvent = {
    [1] = r0_0.RT_118,
    [2] = r0_0.RT_117,
  },
  StateId = 11301231,
}
r4_0[11301232] = {
  EventsCurrentState = {
    r0_0.RT_115,
    {
      EffectId = 900067,
      Function = "PlayFX",
      Tag = "GearR1",
    },
    {
      EffectId = 900068,
      Function = "PlayFX",
      Tag = "GearR2",
    },
    {
      EffectId = 900069,
      Function = "PlayFX",
      Tag = "GearR3",
    },
    {
      EffectId = 900070,
      Function = "PlayFX",
      Tag = "GearR4",
    }
  },
  StateEvent = {
    [1] = r0_0.RT_118,
    [2] = r0_0.RT_116,
  },
  StateId = 11301232,
}
r5_0 = 11301250
r6_0 = {
  EventsCurrentState = {
    {
      EffectId = 900065,
      Function = "PlayFX",
      Tag = "Boss",
    }
  },
}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 11301251,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 11301250
r4_0[r5_0] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 11301261,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 11301260
r4_0[11301260] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 11301260,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 11301261
r4_0[11301261] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 11301271,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 11301270
r4_0[11301270] = r6_0
r4_0[11301271] = {
  StateId = 11301271,
}
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 11301281,
    TypeNextState = r0_0.RT_3,
  },
}
r6_0.StateId = 11301280
r4_0[11301280] = r6_0
r6_0 = {}
r6_0.StateEvent = {
  [1] = {
    NextStateId = 11301280,
    TypeNextState = r0_0.RT_4,
  },
}
r6_0.StateId = 11301281
r4_0[11301281] = r6_0
return r2_0(r3_0, r4_0)
