-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\SkillEffects.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    EnmityValue = 0,
    StrongValue = 0,
  },
  RT_2 = {
    "hit1"
  },
  RT_3 = {
    BaseAttr = "ATK",
    Function = "Damage",
    Rate = 1,
  },
  RT_4 = {
    FXId = 600008,
    Function = "PlayFX",
  },
  RT_5 = {
    Function = "PlaySE",
    SEId = 1003,
  },
}
r0_0.RT_6 = {
  [1] = r0_0.RT_3,
  [2] = r0_0.RT_4,
  [3] = r0_0.RT_5,
}
r0_0.RT_7 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 1.2,
}
r0_0.RT_8 = {
  [1] = r0_0.RT_7,
  [2] = r0_0.RT_4,
  [3] = r0_0.RT_5,
}
r0_0.RT_9 = {
  "hit2"
}
r0_0.RT_10 = {
  CauseHit = "LightHit",
  Function = "CutToughness",
}
r0_0.RT_11 = {
  [1] = r0_0.RT_7,
  [2] = r0_0.RT_4,
  [3] = r0_0.RT_10,
  [4] = r0_0.RT_5,
}
r0_0.RT_12 = {
  "hit3"
}
r0_0.RT_13 = {
  "hit4"
}
r0_0.RT_14 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 1.8,
}
r0_0.RT_15 = {
  [1] = r0_0.RT_14,
  [2] = r0_0.RT_4,
  [3] = r0_0.RT_10,
  [4] = r0_0.RT_5,
}
r0_0.RT_16 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 2,
}
r0_0.RT_17 = {
  CauseHit = "HitFly_XY0Z1000",
  Function = "CutToughness",
}
r0_0.RT_18 = {
  CauseHit = "HitFly_XY500Z1000",
  Function = "CutToughness",
}
r0_0.RT_19 = {
  Function = "SaveLoc",
  IsOnGround = true,
  TargetType = "Target",
}
r0_0.RT_20 = {
  [1] = r0_0.RT_19,
}
r0_0.RT_21 = {
  0,
  0,
  -5
}
r0_0.RT_22 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 1.5,
}
r0_0.RT_23 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 1.87,
}
r0_0.RT_24 = {
  Function = "PlaySE",
  SEId = 10003001,
}
r0_0.RT_25 = {
  [1] = r0_0.RT_23,
  [2] = r0_0.RT_10,
  [3] = r0_0.RT_24,
}
r0_0.RT_26 = {
  FXId = 1000302,
  Function = "PlayFX",
  Overlap = true,
}
r0_0.RT_27 = {
  Function = "PlaySE",
  SEId = 10003008,
}
r0_0.RT_28 = {
  [1] = r0_0.RT_7,
  [2] = r0_0.RT_18,
  [3] = r0_0.RT_26,
  [4] = r0_0.RT_27,
}
r0_0.RT_29 = {
  BuffId = 1000301,
  Function = "AddBuff",
  LastTime = -1,
}
r0_0.RT_30 = {
  [1] = r0_0.RT_29,
}
r0_0.RT_31 = {
  0,
  150,
  0
}
r0_0.RT_32 = {
  FXId = 1000402,
  Function = "PlayFX",
  NormalToHit = true,
  Overlap = true,
}
r0_0.RT_33 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 0.5,
}
r0_0.RT_34 = {
  FXId = 1000404,
  Function = "PlayFX",
}
r0_0.RT_35 = {
  CauseHit = "HitFly_XY500Z1000",
  Function = "CutToughness",
  Value = 100,
}
r0_0.RT_36 = {
  0,
  0,
  100
}
r0_0.RT_37 = {
  "MeleeWord"
}
r0_0.RT_38 = {
  Function = "PlayFX",
  WeaponFXGroupName = "Hit1",
}
r0_0.RT_39 = {
  CauseHit = "LightHit_50",
  Function = "CutToughness",
  Value = 100,
}
r0_0.RT_40 = {
  "Skill",
  "Skill2"
}
r0_0.RT_41 = {
  CauseHit = "HitFly_XY500Z300",
  Function = "CutToughness",
  Value = 100,
}
r0_0.RT_42 = {
  FXId = 25,
  Function = "PlayFX",
}
r0_0.RT_43 = {
  BaseAttr = "MaxHp",
  DamageType = "Default",
  Function = "Heal",
  Rate = "#1",
}
r0_0.RT_44 = {
  [1] = r0_0.RT_43,
}
r0_0.RT_45 = {
  "Melee",
  "Weapon",
  "Attack"
}
r0_0.RT_46 = {
  BaseAttr = "ATK_Melee",
  DamageTag = r0_0.RT_45,
  Function = "Damage",
  Rate = 0.45,
}
r0_0.RT_47 = {
  CauseHit = "LightHit_100_F",
  Function = "CutToughness",
  Value = 25,
}
r0_0.RT_48 = {
  Condition = 100,
  Delay = 0.05,
  Dilation = 0,
  Duration = 0.03,
  Function = "HitStop",
}
r0_0.RT_49 = {
  Function = "PlaySE",
  MeleeHitLevel = "Normal",
  SEId = 104,
}
r0_0.RT_50 = {
  BaseAttr = "ATK_Melee",
  DamageTag = r0_0.RT_45,
  Function = "Damage",
  Rate = 0.5,
}
r0_0.RT_51 = {
  60,
  90,
  0
}
r0_0.RT_52 = {
  Condition = 100,
  Delay = 0.1,
  Dilation = 0,
  Duration = 0.03,
  Function = "HitStop",
}
r0_0.RT_53 = {
  BaseAttr = "ATK_Melee",
  DamageTag = r0_0.RT_45,
  Function = "Damage",
  Rate = 0.4,
}
r0_0.RT_54 = {
  185,
  90,
  0
}
r0_0.RT_55 = {
  CauseHit = "LightHit_100_F",
  Delay = 0.05,
  Function = "CutToughness",
  Value = 30,
}
r0_0.RT_56 = {
  BaseAttr = "ATK_Melee",
  DamageTag = r0_0.RT_45,
  Function = "Damage",
  Rate = 0.82,
}
r0_0.RT_57 = {
  90,
  90,
  0
}
r0_0.RT_58 = {
  Condition = 100,
  Delay = 0.05,
  Dilation = 0,
  Duration = 0.07,
  Function = "HitStop",
}
r0_0.RT_59 = {
  Function = "PlaySE",
  MeleeHitLevel = "Heavy",
  SEId = 104,
}
r0_0.RT_60 = {
  200,
  90,
  0
}
r0_0.RT_61 = {
  "Melee",
  "Weapon",
  "HeavyAttack"
}
r0_0.RT_62 = {
  Function = "ExecutePassiveFunction",
  FunctionName = "ClearComboCount",
  PassiveEffectId = 102,
}
r0_0.RT_63 = {
  Function = "PlayFX",
  MaxHitFXNum = 5,
  WeaponFXGroupName = "Hit1",
}
r0_0.RT_64 = {
  CauseHit = "HitFly_XY800Z400_F",
  Function = "CutToughness",
  Value = 73,
}
r0_0.RT_65 = {
  Condition = 100,
  Dilation = 0,
  Duration = 0.03,
  Function = "HitStop",
}
r0_0.RT_66 = {
  "Melee",
  "RouB101"
}
r0_0.RT_67 = {
  Acceleration = 35000,
  AccelerationTime = 0.25,
  Angle = 30,
  Function = "AddCameraSpeed",
}
r0_0.RT_68 = {
  [1] = r0_0.RT_67,
}
r0_0.RT_69 = {
  "Melee",
  "Weapon",
  "FallAttack"
}
r0_0.RT_70 = {
  BaseAttr = "ATK",
  DamageTag = r0_0.RT_69,
  Function = "Damage",
  Rate = 0.51,
}
r0_0.RT_71 = {
  CauseHit = "HitFly_XY400Z600",
  Function = "CutToughness",
  Value = 33,
}
r0_0.RT_72 = {
  Function = "MakeSound",
  SoundSourceId = 7,
}
r0_0.RT_73 = {
  [1] = r0_0.RT_70,
  [2] = r0_0.RT_63,
  [3] = r0_0.RT_71,
  [4] = r0_0.RT_59,
  [5] = r0_0.RT_72,
}
r0_0.RT_74 = {
  "Melee",
  "Weapon",
  "SlideAttack"
}
r0_0.RT_75 = {
  BaseAttr = "ATK",
  DamageTag = r0_0.RT_74,
  Function = "Damage",
  Rate = 0.51,
}
r0_0.RT_76 = {
  0,
  90,
  0
}
r0_0.RT_77 = {
  Function = "PlayFX",
  FxRotator = r0_0.RT_76,
  IsFaceToChar = true,
  MaxHitFXNum = 3,
  WeaponFXGroupName = "Hit",
}
r0_0.RT_78 = {
  CauseHit = "HitFly_XY200Z300_F",
  Function = "CutToughness",
  Value = 33,
}
r0_0.RT_79 = {
  Condition = 100,
  Dilation = 0,
  Duration = 0.1,
  Function = "HitStop",
}
r0_0.RT_80 = {
  ChargeAmount = 1,
  Function = "ChargeBullet",
}
r0_0.RT_81 = {
  Function = "AddBullet",
  Value = 1,
}
r0_0.RT_82 = {
  Function = "AddEnergyShield",
  IsOverShield = 1,
  Rate = 0,
  Value = "#1",
}
r0_0.RT_83 = {
  [1] = r0_0.RT_82,
}
r0_0.RT_84 = {
  ATK = 1,
}
r0_0.RT_85 = {
  CauseHit = "LightHit_100_F",
  Function = "CutToughness",
  Value = 20,
}
r0_0.RT_86 = {
  BaseAttr = "ATK_Melee",
  DamageTag = r0_0.RT_45,
  Function = "Damage",
  Rate = 0.85,
}
r0_0.RT_87 = {
  180,
  90,
  0
}
r0_0.RT_88 = {
  CauseHit = "HitFly_XY200Z300_F",
  Function = "CutToughness",
  Value = 25,
}
r0_0.RT_89 = {
  BaseAttr = "ATK_Melee",
  DamageTag = r0_0.RT_45,
  Function = "Damage",
  Rate = 0.55,
}
r0_0.RT_90 = {
  Function = "PlayFX",
  MaxHitFXNum = 3,
  WeaponFXGroupName = "Hit1",
}
r0_0.RT_91 = {
  BaseAttr = "ATK_Melee",
  DamageTag = r0_0.RT_45,
  Function = "Damage",
  Rate = 1.2,
}
r0_0.RT_92 = {
  CauseHit = "HitFly_XY400Z300_F",
  Function = "CutToughness",
  Value = 40,
}
r0_0.RT_93 = {
  Function = "AddSp",
  SpChange = "#1",
}
r0_0.RT_94 = {
  [1] = r0_0.RT_93,
}
r0_0.RT_95 = {
  BaseChar = "Target",
  FXId = 6,
  Function = "PlayFX",
  IsAttached = true,
}
r0_0.RT_96 = {
  BaseChar = "Target",
  FXId = 7,
  Function = "PlayFX",
  IsAttached = true,
}
r0_0.RT_97 = {
  0,
  35,
  -5
}
r0_0.RT_98 = {
  0,
  0,
  50
}
r0_0.RT_99 = {
  AimSkeletal = "hit1",
  CreatureId = 1010201,
  Direction = "Camera",
  Function = "CreateSkillCreature",
  Location = r0_0.RT_97,
  Rotation = r0_0.RT_98,
}
r0_0.RT_100 = {
  Function = "AimDiffusion",
}
r0_0.RT_101 = {
  "Ranged",
  "RouB102"
}
r0_0.RT_102 = {
  BaseAttr = "ATK_Char",
  DamageTag = r0_0.RT_101,
  Function = "Damage",
  Rate = 2.7,
}
r0_0.RT_103 = {
  FXId = 10102102,
  Function = "PlayFX",
  Overlap = true,
}
r0_0.RT_104 = {
  CauseHit = "HitFly_Force_Common",
  Function = "CutToughness",
  Value = 50,
}
r0_0.RT_105 = {
  Falloff = 0.1,
  Function = "CameraShake",
  IsSceneCameraShake = true,
  OuterRadius = 2000,
  ShakeClass = "BP_CS_Cannon_Hit",
}
r0_0.RT_106 = {
  [1] = r0_0.RT_102,
  [2] = r0_0.RT_103,
  [3] = r0_0.RT_104,
  [4] = r0_0.RT_105,
}
r0_0.RT_107 = {
  "RouB104"
}
r0_0.RT_108 = {
  CauseHit = "LightHit",
  Function = "CutToughness",
  Value = 50,
}
r0_0.RT_109 = {
  FXId = 10104104,
  Function = "PlayFX",
}
r0_0.RT_110 = {
  CauseHit = "LightHit",
  Function = "CutToughness",
  Value = 100,
}
r0_0.RT_111 = {
  CauseHit = "HitFly_XY200Z300_F",
  Function = "CutToughness",
  Value = 150,
}
r0_0.RT_112 = {
  FXId = 10104101,
  Function = "PlayFX",
}
r0_0.RT_113 = {
  CreatureId = 10105102,
  Function = "CreateSkillCreature",
}
r0_0.RT_114 = {
  "RouB105"
}
r0_0.RT_115 = {
  BaseAttr = "ATK_Char",
  DamageTag = r0_0.RT_114,
  Function = "Damage",
  Rate = "#1",
}
r0_0.RT_116 = {
  FXId = 10105103,
  Function = "PlayFX",
}
r0_0.RT_117 = {
  "RouB106"
}
r0_0.RT_118 = {
  BaseAttr = "ATK_Char",
  DamageTag = r0_0.RT_117,
  Function = "Damage",
  Rate = 3,
}
r0_0.RT_119 = {
  BodyAccessoryEffect = true,
  DieEffect = true,
  Function = "AdditionalHitFX",
}
r0_0.RT_120 = {
  CauseHit = "LightHit",
  Function = "CutToughness",
  Value = 20,
}
r0_0.RT_121 = {
  FXId = 600005,
  Function = "PlayFX",
}
r0_0.RT_122 = {
  Function = "RemoveSkillCreature",
  Self = true,
}
r0_0.RT_123 = {
  FXId = 26,
  Function = "PlayFX",
}
r0_0.RT_124 = {
  BaseAttr = "ATK_Char",
  DamageTag = r0_0.RT_117,
  Function = "Damage",
  Rate = 7,
}
r0_0.RT_125 = {
  BuffId = 10107123,
  Function = "AddBuff",
  LastTime = 1,
}
r0_0.RT_126 = {
  0,
  0,
  90
}
r0_0.RT_127 = {
  Function = "ChargeBullet",
}
r0_0.RT_128 = {
  [1] = r0_0.RT_127,
}
r0_0.RT_129 = {
  CauseHit = "HitFly_XY200Z300_F",
  Function = "CutToughness",
  Value = 20,
}
r0_0.RT_130 = {
  Condition = 100,
  Dilation = 0.1,
  Duration = 0.1,
  Function = "HitStop",
}
r0_0.RT_131 = {
  BaseAttr = "ATK_Melee",
  DamageTag = r0_0.RT_45,
  Function = "Damage",
  Rate = 0.25,
}
r0_0.RT_132 = {
  CauseHit = "LightHit_100_F",
  Function = "CutToughness",
  Value = 15,
}
r0_0.RT_133 = {
  CauseHit = "LightHit_100_F",
  Function = "CutToughness",
  Value = 35,
}
r0_0.RT_134 = {
  BaseAttr = "ATK_Melee",
  DamageTag = r0_0.RT_61,
  Function = "Damage",
  Rate = 0.1,
}
r0_0.RT_135 = {
  FXId = 47,
  Function = "PlayFX",
  MaxHitFXNum = 3,
}
r0_0.RT_136 = {
  CauseHit = "LightHit",
  Function = "CutToughness",
  Value = 5,
}
r0_0.RT_137 = {
  [1] = r0_0.RT_134,
  [2] = r0_0.RT_135,
  [3] = r0_0.RT_136,
  [4] = r0_0.RT_49,
  [5] = r0_0.RT_119,
}
r0_0.RT_138 = {
  CauseHit = "LightHit_50_F",
  Function = "CutToughness",
  Value = 20,
}
r0_0.RT_139 = {
  BaseAttr = "ATK_Melee",
  DamageTag = r0_0.RT_45,
  Function = "Damage",
  Rate = 0.3,
}
r0_0.RT_140 = {
  0,
  -15,
  0
}
r0_0.RT_141 = {
  0,
  15,
  0
}
r0_0.RT_142 = {
  0,
  -30,
  0
}
r0_0.RT_143 = {
  0,
  30,
  0
}
r0_0.RT_144 = {
  FXId = 1020202,
  Function = "PlayFX",
  MaxHitFXNum = 3,
}
r0_0.RT_145 = {
  CauseHit = "HitFly_XY200Z300",
  Function = "CutToughness",
  Value = 15,
}
r0_0.RT_146 = {
  0,
  0,
  -90
}
r0_0.RT_147 = {
  FXId = 1020203,
  Function = "PlayFX",
}
r0_0.RT_148 = {
  Falloff = 0.1,
  Function = "CameraShake",
  IsSceneCameraShake = true,
  OuterRadius = 2000,
  ShakeClass = "BP_CameraShake_FallAttack",
}
r0_0.RT_149 = {
  [1] = r0_0.RT_147,
  [2] = r0_0.RT_148,
}
r0_0.RT_150 = {
  Function = "PlayFX",
  FxRotator = r0_0.RT_60,
  IsFaceToChar = true,
  MaxHitFXNum = 3,
  WeaponFXGroupName = "Hit",
}
r0_0.RT_151 = {
  Condition = 100,
  Dilation = 0,
  Duration = 0.07,
  Function = "HitStop",
}
r0_0.RT_152 = {
  Function = "PlayFX",
  FxRotator = r0_0.RT_51,
  IsFaceToChar = true,
  MaxHitFXNum = 3,
  WeaponFXGroupName = "Hit",
}
r0_0.RT_153 = {
  CauseHit = "HitFly_XY400Z500_F",
  Function = "CutToughness",
  Value = 25,
}
r0_0.RT_154 = {
  -20,
  90,
  0
}
r0_0.RT_155 = {
  Function = "PlayFX",
  FxRotator = r0_0.RT_154,
  IsFaceToChar = true,
  MaxHitFXNum = 3,
  WeaponFXGroupName = "Hit",
}
r0_0.RT_156 = {
  CauseHit = "LightHit_100_F",
  Function = "CutToughness",
  Value = 30,
}
r0_0.RT_157 = {
  BaseAttr = "ATK",
  DamageTag = r0_0.RT_61,
  Function = "Damage",
  Rate = 0.55,
}
r0_0.RT_158 = {
  CauseHit = "HitFly_XY200Z300",
  Function = "CutToughness",
  Value = 35,
}
r0_0.RT_159 = {
  10,
  90,
  0
}
r0_0.RT_160 = {
  Function = "PlayFX",
  FxRotator = r0_0.RT_159,
  IsFaceToChar = true,
  MaxHitFXNum = 3,
  WeaponFXGroupName = "Hit",
}
r0_0.RT_161 = {
  CauseHit = "HitFly_XY600Z400",
  Function = "CutToughness",
  Value = 150,
}
r0_0.RT_162 = {
  -10,
  90,
  0
}
r0_0.RT_163 = {
  CreatureId = 1030221,
  Function = "RemoveSkillCreature",
}
r0_0.RT_164 = {
  CauseHit = "LightHit_50_F",
  Function = "CutToughness",
  Value = 15,
}
r0_0.RT_165 = {
  CauseHit = "HitFly_XY200Z300_F",
  Function = "CutToughness",
  Value = 15,
}
r0_0.RT_166 = {
  CauseHit = "HitFly_XY500Z300_F",
  Function = "CutToughness",
  Value = 20,
}
r0_0.RT_167 = {
  BaseAttr = "ATK_Melee",
  DamageTag = r0_0.RT_45,
  Function = "Damage",
  Rate = 0.2,
}
r0_0.RT_168 = {
  Function = "PlaySE",
  MeleeHitLevel = "Light",
  SEId = 105,
}
r0_0.RT_169 = {
  Function = "PlaySE",
  MeleeHitLevel = "Sp",
  SEId = 105,
}
r0_0.RT_170 = {
  Function = "PlayFX",
  FxRotator = r0_0.RT_76,
  IsFaceToChar = true,
  WeaponFXGroupName = "Hit",
}
r0_0.RT_171 = {
  Function = "PlaySE",
  MeleeHitLevel = "Combo",
  SEId = 105,
}
r0_0.RT_172 = {
  Function = "PlayFX",
  FxRotator = r0_0.RT_159,
  IsFaceToChar = true,
  WeaponFXGroupName = "Hit",
}
r0_0.RT_173 = {
  CauseHit = "HitFly_XY200Z300_F",
  Function = "CutToughness",
  Value = 12,
}
r0_0.RT_174 = {
  0,
  45,
  0
}
r0_0.RT_175 = {
  Function = "MakeSound",
  SoundSourceId = 6,
}
r0_0.RT_176 = {
  FXId = 44,
  Function = "PlayFX",
  NormalToHit = true,
  Overlap = true,
}
r0_0.RT_177 = {
  CauseHit = "LightHit_50_F",
  Function = "CutToughness",
  Value = 30,
}
r0_0.RT_178 = {
  5,
  90,
  0
}
r0_0.RT_179 = {
  "Skill",
  "Skill1"
}
r0_0.RT_180 = {
  BaseAttr = "ATK_Char",
  DamageTag = r0_0.RT_179,
  Function = "Damage",
  Rate = "#1",
}
r0_0.RT_181 = {
  FXId = 110151,
  Function = "PlayFX",
}
r0_0.RT_182 = {
  BossValue = 29,
  CauseHit = "HitFly_XY800Z400_F",
  Function = "CutToughness",
  Value = 25,
}
r0_0.RT_183 = {
  Function = "PlaySE",
  SEId = 110101,
}
r0_0.RT_184 = {
  [1] = r0_0.RT_180,
  [2] = r0_0.RT_181,
  [3] = r0_0.RT_182,
  [4] = r0_0.RT_183,
}
r0_0.RT_185 = {
  BossValue = 29,
  CauseHit = "HitFly_XY600Z400_F",
  Function = "CutToughness",
  Value = 25,
}
r0_0.RT_186 = {
  0,
  0,
  30
}
r0_0.RT_187 = {
  BaseAttr = "ATK_Ultra",
  DamageTag = r0_0.RT_45,
  Function = "Damage",
  Rate = "#1",
}
r0_0.RT_188 = {
  BossValue = 15,
  CauseHit = "HitFly_XY400Z400_F",
  Function = "CutToughness",
  Value = 15,
}
r0_0.RT_189 = {
  BossValue = 25,
  CauseHit = "HitFly_XY200Z300_F",
  Function = "CutToughness",
  Value = 25,
}
r0_0.RT_190 = {
  0,
  0,
  12
}
r0_0.RT_191 = {
  0,
  0,
  20
}
r0_0.RT_192 = {
  ATKBase = "ATK_Ultra",
  CreatureId = 110141,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_190,
  Rotation = r0_0.RT_191,
}
r0_0.RT_193 = {
  0,
  0,
  0
}
r0_0.RT_194 = {
  0,
  0,
  59
}
r0_0.RT_195 = {
  ATKBase = "ATK_Ultra",
  CreatureId = 110142,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_193,
  Rotation = r0_0.RT_194,
}
r0_0.RT_196 = {
  0,
  0,
  40
}
r0_0.RT_197 = {
  0,
  0,
  -8
}
r0_0.RT_198 = {
  ATKBase = "ATK_Ultra",
  CreatureId = 110143,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_196,
  Rotation = r0_0.RT_197,
}
r0_0.RT_199 = {
  0,
  0,
  142
}
r0_0.RT_200 = {
  ATKBase = "ATK_Ultra",
  CreatureId = 110144,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_186,
  Rotation = r0_0.RT_199,
}
r0_0.RT_201 = {
  ATKBase = "ATK_Ultra",
  CreatureId = 110145,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_193,
  Rotation = r0_0.RT_126,
}
r0_0.RT_202 = {
  FXId = 110152,
  Function = "PlayFX",
}
r0_0.RT_203 = {
  Function = "PlaySE",
  SEId = 104,
}
r0_0.RT_204 = {
  BossValue = 32,
  CauseHit = "HitFly_XY200Z300_F",
  Function = "CutToughness",
  Value = 15,
}
r0_0.RT_205 = {
  "Weapon",
  "Melee",
  "Attack"
}
r0_0.RT_206 = {
  BaseAttr = "ATK_Melee",
  DamageTag = r0_0.RT_205,
  Function = "Damage",
  Rate = 1,
}
r0_0.RT_207 = {
  BuffId = 110221,
  Function = "RemoveBuff",
}
r0_0.RT_208 = {
  FXId = 410220,
  Function = "PlayFX",
  IsAttached = 1,
}
r0_0.RT_209 = {
  CreatureId = 410230,
  Function = "CreateSkillCreature",
}
r0_0.RT_210 = {
  FXId = 21,
  Function = "PlayFX",
}
r0_0.RT_211 = {
  CreatureId = 110301,
  Function = "CreateSkillCreature",
}
r0_0.RT_212 = {
  Function = "ExecutePassiveFunction",
  FunctionName = "Skill1AddMsp2",
  PassiveEffectId = 110301,
}
r0_0.RT_213 = {
  BaseAttr = "ATK_Char",
  DamageTag = r0_0.RT_40,
  Function = "Damage",
  Rate = "#1",
}
r0_0.RT_214 = {
  BossValue = 21,
  CauseHit = "LightHit_Tuosi",
  Function = "CutToughness",
  Value = 25,
}
r0_0.RT_215 = {
  Function = "PlaySE",
  SEId = 110306,
}
r0_0.RT_216 = {
  "TuosiCombo",
  "Skill",
  "Skill2"
}
r0_0.RT_217 = {
  BaseAttr = "ATK_Char",
  DamageTag = r0_0.RT_216,
  Function = "Damage",
  Rate = "#1",
}
r0_0.RT_218 = {
  FXId = 110341,
  Function = "PlayFX",
  MaxHitFXNum = 5,
}
r0_0.RT_219 = {
  "TuosiFinish",
  "Skill",
  "Skill2"
}
r0_0.RT_220 = {
  BaseAttr = "ATK_Char",
  DamageTag = r0_0.RT_219,
  Function = "Damage",
  Rate = "#1",
}
r0_0.RT_221 = {
  "hit0"
}
r0_0.RT_222 = {
  FXId = 110311,
  Function = "PlayFX",
}
r0_0.RT_223 = {
  BaseAttr = "ATK_Char",
  DamageTag = r0_0.RT_179,
  Function = "Damage",
  Rate = 0.5,
}
r0_0.RT_224 = {
  "Skill",
  "Skill1",
  "QiuxianSpSkill1"
}
r0_0.RT_225 = {
  BaseAttr = "ATK_Char",
  DamageTag = r0_0.RT_224,
  Function = "Damage",
  Rate = 0.1,
}
r0_0.RT_226 = {
  CauseHit = "HitFly_XY200Z300",
  Function = "CutToughness",
  Value = 300,
}
r0_0.RT_227 = {
  Function = "AddSp",
  SpChange = 25,
}
r0_0.RT_228 = {
  [1] = r0_0.RT_227,
  [2] = r0_0.RT_96,
}
r0_0.RT_229 = {
  "Skill",
  "Skill1",
  "ZhujueDark"
}
r0_0.RT_230 = {
  BaseAttr = "ATK_Char",
  DamageTag = r0_0.RT_229,
  Function = "Damage",
  Rate = 1,
}
r0_0.RT_231 = {
  BuffId = 120102,
  Function = "AddBuff",
  LastTime = 6,
}
r0_0.RT_232 = {
  BaseAttr = "MaxHp",
  DamageType = "Default",
  Function = "Heal",
  Rate = 0.25,
}
r0_0.RT_233 = {
  "Skill",
  "Skill2",
  "ZhujueDark"
}
r0_0.RT_234 = {
  BaseAttr = "ATK_Char",
  DamageTag = r0_0.RT_233,
  Function = "Damage",
  Rate = 4.2,
}
r0_0.RT_235 = {
  FXId = 10103102,
  Function = "PlayFX",
}
r0_0.RT_236 = {
  [1] = r0_0.RT_234,
  [2] = r0_0.RT_41,
  [3] = r0_0.RT_235,
}
r0_0.RT_237 = {
  BaseAttr = "MaxHp",
  DamageType = "Default",
  Function = "Heal",
  Rate = 0.1,
}
r0_0.RT_238 = {
  ComboCount = 10,
  Function = "HitCount",
}
r0_0.RT_239 = {
  [1] = r0_0.RT_237,
  [2] = r0_0.RT_238,
}
r0_0.RT_240 = {
  BaseAttr = "ATK_Char",
  DamageTag = r0_0.RT_179,
  Function = "Damage",
  Rate = 1,
}
r0_0.RT_241 = {
  100,
  0,
  200
}
r0_0.RT_242 = {
  0,
  200,
  0
}
r0_0.RT_243 = {
  Function = "PlaySE",
  SEId = 150106,
}
r0_0.RT_244 = {
  Function = "PlaySE",
  SEId = 150107,
}
r0_0.RT_245 = {
  BaseAttr = "ATK_Ultra",
  DamageTag = r0_0.RT_61,
  Function = "Damage",
  Rate = "#1",
}
r0_0.RT_246 = {
  "Skill"
}
r0_0.RT_247 = {
  BaseAttr = "ATK_Char",
  DamageTag = r0_0.RT_246,
  Function = "Damage",
  Rate = "#1",
}
r0_0.RT_248 = {
  Delay = 0.15,
  FXId = 25,
  Function = "PlayFX",
}
r0_0.RT_249 = {
  Condition = 100,
  Delay = 0.15,
  Dilation = 0,
  Duration = 0.05,
  Function = "HitStop",
}
r0_0.RT_250 = {
  "Mod"
}
r0_0.RT_251 = {
  CauseHit = "HitFly_XY400Z600",
  Function = "CutToughness",
  Value = 15,
}
r0_0.RT_252 = {
  Delay = 0.05,
  FXId = 25,
  Function = "PlayFX",
}
r0_0.RT_253 = {
  Function = "PlaySE",
  SEId = 850294,
}
r0_0.RT_254 = {
  0,
  600,
  -90
}
r0_0.RT_255 = {
  0,
  1000,
  -90
}
r0_0.RT_256 = {
  BossValue = 150,
  CauseHit = "HitDown",
  Function = "CutToughness",
  Value = 100,
}
r0_0.RT_257 = {
  Falloff = 0.1,
  Function = "CameraShake",
  IsSceneCameraShake = true,
  OuterRadius = 2000,
  ShakeClass = "BP_CS_Xibi_Skill01",
}
r0_0.RT_258 = {
  BuffId = 150211,
  Condition = 72,
  Function = "AddBuff",
  LastTime = 3,
}
r0_0.RT_259 = {
  BuffId = 150215,
  Function = "AddBuff",
  LastTime = 3,
}
r0_0.RT_260 = {
  Function = "PlaySE",
  SEId = 150205,
}
r0_0.RT_261 = {
  "Skill",
  "Skill1",
  "NifuDark"
}
r0_0.RT_262 = {
  BaseAttr = "ATK_Char",
  DamageTag = r0_0.RT_261,
  DamageType = "Dark",
  Function = "Damage",
  Rate = "#1",
  TriggerProbability = "$Source:GetRootSource():GetFloat(\'Skill04TriggerRate\')$",
}
r0_0.RT_263 = {
  BuffId = 150212,
  Condition = 72,
  Function = "AddBuff",
  LastTime = 3,
}
r0_0.RT_264 = {
  BuffId = 150214,
  Function = "AddBuff",
  LastTime = 3,
}
r0_0.RT_265 = {
  Function = "PlaySE",
  SEId = 401,
}
r0_0.RT_266 = {
  FXId = 150314,
  Function = "PlayFX",
}
r0_0.RT_267 = {
  Function = "PlaySE",
  SEId = 150308,
}
r0_0.RT_268 = {
  BuffId = 150327,
  Condition = 74,
  Function = "AddBuff",
  LastTime = 25,
}
r0_0.RT_269 = {
  BuffId = 150320,
  Function = "AddBuff",
  LastTime = -1,
}
r0_0.RT_270 = {
  BossValue = 100,
  CauseHit = "HitFly_XY0Z500",
  Function = "CutToughness",
  Value = 30,
}
r0_0.RT_271 = {
  Function = "PlaySE",
  MeleeHitLevel = "Light",
  SEId = 104,
}
r0_0.RT_272 = {
  BaseAttr = "ATK_Melee",
  DamageTag = r0_0.RT_45,
  Function = "Damage",
  Rate = "#1",
}
r0_0.RT_273 = {
  Condition = 100,
  Dilation = 0.1,
  Duration = 0.03,
  Function = "HitStop",
}
r0_0.RT_274 = {
  CauseHit = "LightHit_50_F",
  Function = "CutToughness",
  Value = 60,
}
r0_0.RT_275 = {
  [1] = r0_0.RT_272,
  [2] = r0_0.RT_273,
  [3] = r0_0.RT_274,
  [4] = r0_0.RT_49,
}
r0_0.RT_276 = {
  FXId = 1020202,
  Function = "PlayFX",
}
r0_0.RT_277 = {
  BaseAttr = "ATK_Melee",
  DamageTag = r0_0.RT_61,
  Function = "Damage",
  Rate = "#1",
}
r0_0.RT_278 = {
  BaseAttr = "ATK_Melee",
  DamageTag = r0_0.RT_69,
  Function = "Damage",
  Rate = "#1",
}
r0_0.RT_279 = {
  CauseHit = "HitFly_XY400Z600",
  Function = "CutToughness",
  Value = 50,
}
r0_0.RT_280 = {
  [1] = r0_0.RT_278,
  [2] = r0_0.RT_38,
  [3] = r0_0.RT_279,
  [4] = r0_0.RT_59,
  [5] = r0_0.RT_72,
}
r0_0.RT_281 = {
  BaseAttr = "ATK_Melee",
  DamageTag = r0_0.RT_74,
  Function = "Damage",
  Rate = "#1",
}
r0_0.RT_282 = {
  [1] = r0_0.RT_281,
  [2] = r0_0.RT_170,
  [3] = r0_0.RT_129,
  [4] = r0_0.RT_79,
  [5] = r0_0.RT_49,
}
r0_0.RT_283 = {
  [1] = r0_0.RT_272,
  [2] = r0_0.RT_38,
  [3] = r0_0.RT_47,
  [4] = r0_0.RT_271,
}
r0_0.RT_284 = {
  -110,
  90,
  0
}
r0_0.RT_285 = {
  Function = "PlayFX",
  FxRotator = r0_0.RT_284,
  IsFaceToChar = true,
  WeaponFXGroupName = "Hit",
}
r0_0.RT_286 = {
  170,
  90,
  0
}
r0_0.RT_287 = {
  Function = "PlayFX",
  FxRotator = r0_0.RT_286,
  IsFaceToChar = true,
  WeaponFXGroupName = "Hit",
}
r0_0.RT_288 = {
  Function = "PlayFX",
  FxRotator = r0_0.RT_162,
  IsFaceToChar = true,
  WeaponFXGroupName = "Hit",
}
r0_0.RT_289 = {
  Function = "ExecuteClientPassiveFunction",
  FunctionName = "EndJetRush",
}
r0_0.RT_290 = {
  Condition = 100,
  Dilation = 0,
  Duration = 0.02,
  Function = "HitStop",
}
r0_0.RT_291 = {
  Function = "PlaySE",
  SEId = 410104,
}
r0_0.RT_292 = {
  1
}
r0_0.RT_293 = {
  "Skill",
  "Skill2",
  "SuyiSkill02Creature"
}
r0_0.RT_294 = {
  BaseAttr = "ATK",
  DamageTag = r0_0.RT_293,
  Function = "Damage",
  Rate = 1,
}
r0_0.RT_295 = {
  Function = "ExecuteClientPassiveFunction",
  FunctionName = "SwitchMontage",
}
r0_0.RT_296 = {
  ClientSkillLogicId = 150402,
  Function = "ExecuteClientSkillLogicFunction",
  FunctionName = "SetShootLoc",
}
r0_0.RT_297 = {
  BaseChar = "Self",
  Function = "PlaySE",
  SEId = 530105,
}
r0_0.RT_298 = {
  "Skill",
  "Skill2",
  "SuyiWeapon"
}
r0_0.RT_299 = {
  BaseAttr = "ATK",
  DamageTag = r0_0.RT_298,
  Function = "Damage",
  Rate = 1,
}
r0_0.RT_300 = {
  BossValue = 100,
  CauseHit = "HitFly_XY0Z500",
  Function = "CutToughness",
  Value = 20,
}
r0_0.RT_301 = {
  BuffId = 150402,
  Function = "AddBuff",
  LastTime = -1,
}
r0_0.RT_302 = {
  FXId = 2051005,
  Function = "PlayFX",
  IsAttached = true,
}
r0_0.RT_303 = {
  Function = "BeginAccumulate",
}
r0_0.RT_304 = {
  Function = "PlaySE",
  SEId = 2060305,
}
r0_0.RT_305 = {
  Function = "PlaySE",
  SEId = 2050702,
}
r0_0.RT_306 = {
  Mud = 64,
  Sand = 63,
  Snow = 62,
  Water = 61,
}
r0_0.RT_307 = {
  FXId = 54,
  Function = "PlayFX",
  NormalToHit = true,
  Overlap = true,
  ReplaceFXId = r0_0.RT_306,
}
r0_0.RT_308 = {
  Mud = 0,
  Sand = 0,
  Snow = 0,
  Water = 0,
}
r0_0.RT_309 = {
  Function = "PlaySE",
  SEId = 2050703,
  SceneSe = true,
}
r0_0.RT_310 = {
  BaseAttr = "ATK_Ultra",
  DamageTag = r0_0.RT_45,
  Function = "Damage",
  Rate = 1,
}
r0_0.RT_311 = {
  [1] = r0_0.RT_310,
}
r0_0.RT_312 = {
  CauseHit = "HitFly_XY500Z300",
  Function = "CutToughness",
  Value = 30,
}
r0_0.RT_313 = {
  "Melee",
  "Weapon",
  "Attack",
  "NoCombo"
}
r0_0.RT_314 = {
  BaseAttr = "ATK_Ultra",
  DamageTag = r0_0.RT_313,
  Function = "Damage",
  Rate = 1,
}
r0_0.RT_315 = {
  0,
  300,
  -90
}
r0_0.RT_316 = {
  [1] = r0_0.RT_310,
  [2] = r0_0.RT_63,
}
r0_0.RT_317 = {
  -5,
  90,
  0
}
r0_0.RT_318 = {
  Function = "PlayFX",
  FxRotator = r0_0.RT_317,
  IsFaceToChar = true,
  WeaponFXGroupName = "Hit",
}
r0_0.RT_319 = {
  Function = "PlaySE",
  SEId = 850272,
}
r0_0.RT_320 = {
  BaseAttr = "ATK_Char",
  DamageTag = r0_0.RT_250,
  DamageType = "Fire",
  Function = "Damage",
  Rate = 2.56,
}
r0_0.RT_321 = {
  Delay = 0.05,
  FXId = 22,
  Function = "PlayFX",
}
r0_0.RT_322 = {
  Function = "PlaySE",
  SEId = 850282,
}
r0_0.RT_323 = {
  0,
  0,
  -45
}
r0_0.RT_324 = {
  0,
  0,
  45
}
r0_0.RT_325 = {
  BuffId = 180113,
  Function = "AddBuff",
  LastTime = 12,
}
r0_0.RT_326 = {
  Function = "ExecutePassiveFunction",
  FunctionName = "Skill1AddBuff",
  PassiveEffectId = 180101,
}
r0_0.RT_327 = {
  BossValue = 56,
  CauseHit = "LightHit",
  Function = "CutToughness",
  Value = 65,
}
r0_0.RT_328 = {
  BaseChar = "Self",
  Function = "PlaySE",
  SEId = 18010,
}
r0_0.RT_329 = {
  BuffType = 180130,
  Function = "ChangeBuffTypeLastTime",
  IsExpand = false,
  LastTimeValue = 12,
}
r0_0.RT_330 = {
  "FeinaColorRed"
}
r0_0.RT_331 = {
  DamageTag = r0_0.RT_330,
  Function = "Damage",
  Value = 1,
}
r0_0.RT_332 = {
  FXId = 10301031,
  Function = "PlayFX",
  NormalToHit = true,
  Overlap = true,
}
r0_0.RT_333 = {
  [1] = r0_0.RT_331,
  [2] = r0_0.RT_332,
}
r0_0.RT_334 = {
  "FeinaColorBlue"
}
r0_0.RT_335 = {
  DamageTag = r0_0.RT_334,
  Function = "Damage",
  Value = 1,
}
r0_0.RT_336 = {
  FXId = 10301011,
  Function = "PlayFX",
  NormalToHit = true,
  Overlap = true,
}
r0_0.RT_337 = {
  [1] = r0_0.RT_335,
  [2] = r0_0.RT_336,
}
r0_0.RT_338 = {
  "FeinaColorGreen"
}
r0_0.RT_339 = {
  DamageTag = r0_0.RT_338,
  Function = "Damage",
  Value = 1,
}
r0_0.RT_340 = {
  FXId = 10301021,
  Function = "PlayFX",
  NormalToHit = true,
  Overlap = true,
}
r0_0.RT_341 = {
  [1] = r0_0.RT_339,
  [2] = r0_0.RT_340,
}
r0_0.RT_342 = {
  [1] = r0_0.RT_81,
}
r0_0.RT_343 = {
  "Ranged",
  "Weapon"
}
r0_0.RT_344 = {
  BaseAttr = "ATK_Ranged",
  DamageTag = r0_0.RT_343,
  Function = "Damage",
  Rate = 0.71,
}
r0_0.RT_345 = {
  CauseHit = "RangedWeapon_Common",
  Function = "CutToughness",
  Value = 12,
}
r0_0.RT_346 = {
  Function = "PlaySE",
  SEId = 103,
}
r0_0.RT_347 = {
  BaseAttr = "ATK_Ranged",
  DamageTag = r0_0.RT_343,
  Function = "Damage",
  Rate = "#1",
}
r0_0.RT_348 = {
  Function = "PlaySE",
  SEId = 2010104,
}
r0_0.RT_349 = {
  Falloff = 0.1,
  Function = "CameraShake",
  IsSceneCameraShake = true,
  OuterRadius = 1500,
  ShakeClass = "BP_CS_Wuxu_Hit",
}
r0_0.RT_350 = {
  Function = "PlaySE",
  SEId = 2010101,
  SceneSe = true,
}
r0_0.RT_351 = {
  0,
  0,
  -10
}
r0_0.RT_352 = {
  FXId = 2019901,
  Function = "PlayFX",
  IsAttached = true,
}
r0_0.RT_353 = {
  FXId = 42,
  Function = "PlayFX",
  Overlap = true,
}
r0_0.RT_354 = {
  FXId = 52,
  Function = "PlayFX",
  NormalToHit = true,
  Overlap = true,
  ReplaceFXId = r0_0.RT_306,
}
r0_0.RT_355 = {
  FXId = 2020106,
  Function = "PlayFX",
  IsAttached = true,
  IsDecalEffectCreature = true,
  NormalToHit = true,
  Overlap = true,
  RefinedOverlap = true,
  ReplaceFXId = r0_0.RT_308,
}
r0_0.RT_356 = {
  Function = "PlaySE",
  SEId = 103,
  SceneSe = true,
}
r0_0.RT_357 = {
  [1] = r0_0.RT_354,
  [2] = r0_0.RT_355,
  [3] = r0_0.RT_356,
}
r0_0.RT_358 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 10,
}
r0_0.RT_359 = {
  0,
  -45,
  0
}
r0_0.RT_360 = {
  0,
  135,
  0
}
r0_0.RT_361 = {
  0,
  -135,
  0
}
r0_0.RT_362 = {
  CreatureId = 20132001,
  Delay = 0.05,
  Function = "CreateSkillCreature",
}
r0_0.RT_363 = {
  CreatureId = 20132001,
  Delay = 0.1,
  Function = "CreateSkillCreature",
}
r0_0.RT_364 = {
  [1] = r0_0.RT_362,
  [2] = r0_0.RT_362,
  [3] = r0_0.RT_362,
  [4] = r0_0.RT_363,
  [5] = r0_0.RT_363,
  [6] = r0_0.RT_363,
}
r0_0.RT_365 = {
  FXId = 530103,
  Function = "PlayFX",
}
r0_0.RT_366 = {
  "RouT103"
}
r0_0.RT_367 = {
  BaseAttr = "ATK_Char",
  DamageTag = r0_0.RT_366,
  DamageType = "TrueDamage",
  Function = "Damage",
  Rate = 1,
}
r0_0.RT_368 = {
  [1] = r0_0.RT_367,
}
r0_0.RT_369 = {
  BaseChar = "Self",
  ConsumeAmount = 1,
  Function = "ConsumeBullet",
}
r0_0.RT_370 = {
  BaseAttr = "ATK_Ranged",
  DamageTag = r0_0.RT_343,
  Function = "Damage",
  Rate = 0.47,
}
r0_0.RT_371 = {
  CauseHit = "RangedWeapon_Common",
  Function = "CutToughness",
  Value = 8,
}
r0_0.RT_372 = {
  [1] = r0_0.RT_370,
  [2] = r0_0.RT_176,
  [3] = r0_0.RT_371,
}
r0_0.RT_373 = {
  FXId = 51,
  Function = "PlayFX",
  NormalToHit = true,
  Overlap = true,
  ReplaceFXId = r0_0.RT_306,
}
r0_0.RT_374 = {
  [1] = r0_0.RT_373,
}
r0_0.RT_375 = {
  "Ranged",
  "Weapon",
  "Explode"
}
r0_0.RT_376 = {
  BaseAttr = "ATK_Ranged",
  DamageTag = r0_0.RT_375,
  Function = "Damage",
  Rate = 0.95,
}
r0_0.RT_377 = {
  CauseHit = "HitFly_Force_Common",
  Function = "CutToughness",
  Value = 40,
}
r0_0.RT_378 = {
  Falloff = 0.2,
  Function = "CameraShake",
  IsSceneCameraShake = true,
  OuterRadius = 1500,
  ShakeClass = "BP_CS_Cannon_Hit",
}
r0_0.RT_379 = {
  [1] = r0_0.RT_110,
}
r0_0.RT_380 = {
  BaseAttr = "ATK_Ranged",
  DamageTag = r0_0.RT_375,
  Function = "Damage",
  Rate = 0.8,
}
r0_0.RT_381 = {
  CauseHit = "HitFly_Force_Common",
  Function = "CutToughness",
  Value = 30,
}
r0_0.RT_382 = {
  Function = "PlaySE",
  SEId = 2030204,
}
r0_0.RT_383 = {
  Function = "PlaySE",
  SEId = 2030201,
  SceneSe = true,
}
r0_0.RT_384 = {
  1,
  1,
  0
}
r0_0.RT_385 = {
  -20,
  20
}
r0_0.RT_386 = {
  0,
  20
}
r0_0.RT_387 = {
  -400,
  400
}
r0_0.RT_388 = {
  750,
  750
}
r0_0.RT_389 = {
  AttackRangeBulletModify = r0_0.RT_384,
  CreatureId = 2030212,
  Function = "CreateSkillCreature",
  Horizontally = true,
  RandomOffsetX = r0_0.RT_385,
  RandomOffsetY = r0_0.RT_385,
  RandomOffsetZ = r0_0.RT_386,
  RandomVelocityX = r0_0.RT_387,
  RandomVelocityY = r0_0.RT_387,
  RandomVelocityZ = r0_0.RT_388,
}
r0_0.RT_390 = {
  AttackRangeBulletModify = r0_0.RT_384,
  CreatureId = 2030212,
  Delay = 0.1,
  Function = "CreateSkillCreature",
  Horizontally = true,
  RandomOffsetX = r0_0.RT_385,
  RandomOffsetY = r0_0.RT_385,
  RandomOffsetZ = r0_0.RT_386,
  RandomVelocityX = r0_0.RT_387,
  RandomVelocityY = r0_0.RT_387,
  RandomVelocityZ = r0_0.RT_388,
}
r0_0.RT_391 = {
  BaseAttr = "ATK_Ranged",
  DamageTag = r0_0.RT_375,
  Function = "Damage",
  Rate = 0.15,
}
r0_0.RT_392 = {
  BaseAttr = "ATK_Ranged",
  DamageTag = r0_0.RT_375,
  Function = "Damage",
  Rate = 0.32,
}
r0_0.RT_393 = {
  CauseHit = "LightHit_50",
  Function = "CutToughness",
  Value = 12,
}
r0_0.RT_394 = {
  Function = "PlaySE",
  SEId = 2030304,
}
r0_0.RT_395 = {
  Falloff = 0.1,
  Function = "CameraShake",
  IsSceneCameraShake = true,
  OuterRadius = 1500,
  ShakeClass = "BP_CS_Chiqiang_Hit",
}
r0_0.RT_396 = {
  Function = "PlaySE",
  SEId = 2030301,
  SceneSe = true,
}
r0_0.RT_397 = {
  BaseAttr = "ATK_Ranged",
  DamageTag = r0_0.RT_375,
  Delay = 0.6,
  Function = "Damage",
  Rate = 0.32,
}
r0_0.RT_398 = {
  Delay = 0.6,
  FXId = 2030302,
  Function = "PlayFX",
}
r0_0.RT_399 = {
  Delay = 0.6,
  Function = "PlaySE",
  SEId = 2030304,
}
r0_0.RT_400 = {
  Delay = 0.6,
  Function = "PlaySE",
  SEId = 2030302,
  SceneSe = true,
}
r0_0.RT_401 = {
  [1] = r0_0.RT_397,
  [2] = r0_0.RT_398,
  [3] = r0_0.RT_399,
  [4] = r0_0.RT_400,
}
r0_0.RT_402 = {
  CauseHit = "HitFly_Force_Common",
  Function = "CutToughness",
  Value = 1,
}
r0_0.RT_403 = {
  Function = "PlaySE",
  SEId = 2030406,
}
r0_0.RT_404 = {
  2030511
}
r0_0.RT_405 = {
  "hit5"
}
r0_0.RT_406 = {
  AimSkeletal = "hit1",
  CreatureId = 2040111,
  Direction = "Camera",
  ExtraRotation = 2,
  Function = "CreateSkillCreature",
}
r0_0.RT_407 = {
  FXId = 2040203,
  Function = "PlayFX",
}
r0_0.RT_408 = {
  Function = "PlaySE",
  SEId = 2040202,
}
r0_0.RT_409 = {
  BaseAttr = "ATK_Ranged",
  DamageTag = r0_0.RT_375,
  Function = "Damage",
  Rate = 1.39,
}
r0_0.RT_410 = {
  CauseHit = "HitFly_Force_Common",
  Function = "CutToughness",
  Value = 25,
}
r0_0.RT_411 = {
  BaseAttr = "ATK_Ranged",
  DamageTag = r0_0.RT_343,
  Function = "Damage",
  Rate = 0.33,
}
r0_0.RT_412 = {
  FXId = 2040504,
  Function = "PlayFX",
}
r0_0.RT_413 = {
  FXId = 23,
  Function = "PlayFX",
}
r0_0.RT_414 = {
  FXId = 22,
  Function = "PlayFX",
}
r0_0.RT_415 = {
  0,
  60,
  0
}
r0_0.RT_416 = {
  CreatureId = 2040602,
  Delay = 0.1,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_193,
  Rotation = r0_0.RT_415,
}
r0_0.RT_417 = {
  0,
  -60,
  0
}
r0_0.RT_418 = {
  CreatureId = 2040602,
  Delay = 0.1,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_193,
  Rotation = r0_0.RT_417,
}
r0_0.RT_419 = {
  CreatureId = 2040602,
  Delay = 0.1,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_193,
  Rotation = r0_0.RT_193,
}
r0_0.RT_420 = {
  0,
  20,
  0
}
r0_0.RT_421 = {
  0,
  40,
  0
}
r0_0.RT_422 = {
  0,
  -40,
  0
}
r0_0.RT_423 = {
  0,
  25,
  0
}
r0_0.RT_424 = {
  0,
  -25,
  0
}
r0_0.RT_425 = {
  0,
  50,
  0
}
r0_0.RT_426 = {
  0,
  -50,
  0
}
r0_0.RT_427 = {
  0,
  75,
  0
}
r0_0.RT_428 = {
  0,
  -75,
  0
}
r0_0.RT_429 = {
  FXId = 2050102,
  Function = "PlayFX",
  IsAttached = true,
}
r0_0.RT_430 = {
  BaseChar = "Self",
  Function = "PlaySE",
  SEId = 109,
}
r0_0.RT_431 = {
  CauseHit = "RangedWeapon_Common",
  Function = "CutToughness",
  Value = 4,
}
r0_0.RT_432 = {
  "Ranged",
  "Weapon",
  "Ray",
  "Ranged20502"
}
r0_0.RT_433 = {
  BaseAttr = "ATK_Ranged",
  DamageTag = r0_0.RT_432,
  Function = "Damage",
  Rate = 0.176,
}
r0_0.RT_434 = {
  FXId = 2050205,
  Function = "PlayFX",
}
r0_0.RT_435 = {
  FXId = 2050206,
  Function = "PlayFX",
}
r0_0.RT_436 = {
  [1] = r0_0.RT_435,
}
r0_0.RT_437 = {
  "Ranged",
  "Weapon",
  "Ray"
}
r0_0.RT_438 = {
  BaseAttr = "ATK_Ranged",
  DamageTag = r0_0.RT_437,
  Function = "Damage",
  Rate = 0.2,
}
r0_0.RT_439 = {
  CreatureId = 2050411,
  Function = "RemoveRayCreature",
}
r0_0.RT_440 = {
  CreatureId = 2050412,
  Function = "RemoveRayCreature",
}
r0_0.RT_441 = {
  CauseHit = "RangedWeapon_Common",
  Function = "CutToughness",
  Value = 3,
}
r0_0.RT_442 = {
  Function = "PlaySE",
  SEId = 2050404,
  SceneSe = true,
}
r0_0.RT_443 = {
  FXId = 2050503,
  Function = "PlayFX",
}
r0_0.RT_444 = {
  -90,
  0,
  -90
}
r0_0.RT_445 = {
  AllowAttackSpeed = 1,
  Rotate = r0_0.RT_444,
  Time = 1.5,
}
r0_0.RT_446 = {
  90,
  0,
  90
}
r0_0.RT_447 = {
  CreatureId = 2050611,
  Direction = "Camera",
  Function = "CreateRayCreature",
  InterpRotation = r0_0.RT_445,
  RayEndLoc = true,
  Rotation = r0_0.RT_446,
}
r0_0.RT_448 = {
  AllowAttackSpeed = 1,
  Rotate = r0_0.RT_446,
  Time = 1.5,
}
r0_0.RT_449 = {
  CreatureId = 2050612,
  Direction = "Camera",
  Function = "CreateRayCreature",
  InterpRotation = r0_0.RT_448,
  RayEndLoc = true,
  Rotation = r0_0.RT_444,
}
r0_0.RT_450 = {
  FXId = 2050601,
  Function = "PlayFX",
  IsAttached = true,
}
r0_0.RT_451 = {
  FXId = 2050604,
  Function = "PlayFX",
}
r0_0.RT_452 = {
  BaseAttr = "ATK_Ranged",
  DamageTag = r0_0.RT_343,
  Function = "Damage",
  Rate = 0.06,
}
r0_0.RT_453 = {
  CauseHit = "RangedWeapon_Common",
  Function = "CutToughness",
  Value = 1,
}
r0_0.RT_454 = {
  FXId = 2060102,
  Function = "PlayFX",
  IsAttached = true,
}
r0_0.RT_455 = {
  BaseAttr = "ATK_Ranged",
  DamageTag = r0_0.RT_343,
  Function = "Damage",
  Rate = 0.35,
}
r0_0.RT_456 = {
  FXId = 45,
  Function = "PlayFX",
  Overlap = true,
}
r0_0.RT_457 = {
  10,
  16,
  10
}
r0_0.RT_458 = {
  AttachToMesh = true,
  BaseChar = "Target",
  DirectionByCreature = true,
  FXId = 46,
  Function = "PlayFX",
  Overlap = true,
  RandomRotation = r0_0.RT_457,
}
r0_0.RT_459 = {
  Function = "PlaySE",
  SEId = 112,
}
r0_0.RT_460 = {
  [1] = r0_0.RT_455,
  [2] = r0_0.RT_456,
  [3] = r0_0.RT_458,
  [4] = r0_0.RT_371,
  [5] = r0_0.RT_459,
}
r0_0.RT_461 = {
  Function = "PlaySE",
  SEId = 112,
  SceneSe = true,
}
r0_0.RT_462 = {
  5,
  5,
  5
}
r0_0.RT_463 = {
  DirectionByCreature = true,
  FXId = 46,
  Function = "PlayFX",
  Overlap = true,
  RandomRotation = r0_0.RT_462,
}
r0_0.RT_464 = {
  [1] = r0_0.RT_354,
  [2] = r0_0.RT_461,
  [3] = r0_0.RT_463,
}
r0_0.RT_465 = {
  FXId = 2060103,
  Function = "PlayFX",
  IsAttached = true,
}
r0_0.RT_466 = {
  BaseAttr = "ATK_Ranged",
  DamageTag = r0_0.RT_343,
  Function = "Damage",
  Rate = 0.6,
}
r0_0.RT_467 = {
  CauseHit = "RangedWeapon_Common",
  Function = "CutToughness",
  Value = 10,
}
r0_0.RT_468 = {
  AttachToSkillCreature = true,
  Function = "GrabTarget",
  OnlyInPlayer = true,
}
r0_0.RT_469 = {
  0.5,
  0.5,
  0.5
}
r0_0.RT_470 = {
  BaseChar = "Self",
  Condition = 44,
  ConsumeAmount = 1,
  Function = "ConsumeBullet",
  TotalBullet = 1,
}
r0_0.RT_471 = {
  0,
  12,
  0
}
r0_0.RT_472 = {
  0,
  -12,
  0
}
r0_0.RT_473 = {
  AimSkeletal = "hit1",
  CreatureId = 2060311,
  Direction = "Camera",
  Function = "CreateSkillCreature",
}
r0_0.RT_474 = {
  BaseChar = "Self",
  Function = "PlaySE",
  SEId = 2060308,
}
r0_0.RT_475 = {
  ClientSkillLogicId = 2060301,
  Function = "ExecuteClientSkillLogicFunction",
  FunctionName = "EndShoot",
}
r0_0.RT_476 = {
  BaseAttr = "ATK_Ranged",
  DamageTag = r0_0.RT_343,
  Function = "Damage",
  Rate = 0.18,
}
r0_0.RT_477 = {
  [1] = r0_0.RT_354,
  [2] = r0_0.RT_461,
  [3] = r0_0.RT_463,
  [4] = r0_0.RT_122,
}
r0_0.RT_478 = {
  AimSkeletal = "hit1",
  CreatureId = 2060521,
  Direction = "Camera",
  Function = "CreateSkillCreature",
}
r0_0.RT_479 = {
  BaseAttr = "ATK",
  DamageTag = r0_0.RT_246,
  Function = "Damage",
  Rate = "#1",
}
r0_0.RT_480 = {
  BossValue = 18,
  CauseHit = "LightHit",
  Function = "CutToughness",
  Value = 15,
}
r0_0.RT_481 = {
  [1] = r0_0.RT_479,
  [2] = r0_0.RT_413,
  [3] = r0_0.RT_480,
}
r0_0.RT_482 = {
  Function = "PlaySE",
  SEId = 210105,
}
r0_0.RT_483 = {
  IsEveAdditionalSummon = 1,
}
r0_0.RT_484 = {
  Function = "RemoveUnit",
  UnitId = 210204,
}
r0_0.RT_485 = {
  FXId = 700804,
  Function = "PlayFX",
  NormalToHit = true,
}
r0_0.RT_486 = {
  Function = "PlaySE",
  SEId = 700803,
}
r0_0.RT_487 = {
  Function = "AddSp",
  SpChange = 4,
}
r0_0.RT_488 = {
  BaseChar = "Target",
  Delay = 0.15,
  FXId = 7,
  Function = "PlayFX",
}
r0_0.RT_489 = {
  [1] = r0_0.RT_487,
  [2] = r0_0.RT_488,
}
r0_0.RT_490 = {
  "Skill",
  "Zhangyu"
}
r0_0.RT_491 = {
  BaseAttr = "ATK",
  DamageTag = r0_0.RT_490,
  Function = "Damage",
  Rate = "#1",
}
r0_0.RT_492 = {
  BaseChar = "Target",
  Delay = 0.15,
  FXId = 6,
  Function = "PlayFX",
}
r0_0.RT_493 = {
  AllowSkillIntensity = 1,
  BaseAttr = "ATK_Char",
  DamageType = "Default",
  Function = "AddEnergyShield",
  IsOverShield = 1,
  Rate = "#1",
  Value = 80,
}
r0_0.RT_494 = {
  0,
  0,
  60
}
r0_0.RT_495 = {
  FXId = 900502,
  Function = "PlayFX",
}
r0_0.RT_496 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 0.2,
}
r0_0.RT_497 = {
  [1] = r0_0.RT_3,
  [2] = r0_0.RT_10,
  [3] = r0_0.RT_495,
}
r0_0.RT_498 = {
  [1] = r0_0.RT_3,
  [2] = r0_0.RT_10,
}
r0_0.RT_499 = {
  CreatureId = 30423,
  Function = "CreateSkillCreature",
}
r0_0.RT_500 = {
  BuffId = 30400015,
  Function = "AddBuff",
  LastTime = 6,
}
r0_0.RT_501 = {
  [1] = r0_0.RT_499,
  [2] = r0_0.RT_500,
}
r0_0.RT_502 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 0.1,
}
r0_0.RT_503 = {
  [1] = r0_0.RT_502,
}
r0_0.RT_504 = {
  [1] = r0_0.RT_33,
}
r0_0.RT_505 = {
  "hit6"
}
r0_0.RT_506 = {
  FXId = 600009,
  Function = "PlayFX",
  Overlap = true,
}
r0_0.RT_507 = {
  FXId = 600009,
  Function = "PlayFX",
  NormalToHit = true,
  Overlap = true,
}
r0_0.RT_508 = {
  [1] = r0_0.RT_507,
}
r0_0.RT_509 = {
  "hit10"
}
r0_0.RT_510 = {
  BuffId = 6000204,
  Function = "AddBuff",
  LastTime = -1,
}
r0_0.RT_511 = {
  [1] = r0_0.RT_510,
}
r0_0.RT_512 = {
  BuffId = 30400008,
  Function = "AddBuff",
  LastTime = -1,
}
r0_0.RT_513 = {
  [1] = r0_0.RT_512,
}
r0_0.RT_514 = {
  BuffId = 30400009,
  Function = "AddBuff",
  LastTime = -1,
}
r0_0.RT_515 = {
  [1] = r0_0.RT_514,
}
r0_0.RT_516 = {
  [1] = r0_0.RT_3,
  [2] = r0_0.RT_495,
}
r0_0.RT_517 = {
  [1] = r0_0.RT_496,
  [2] = r0_0.RT_495,
}
r0_0.RT_518 = {
  CauseHit = "LightHit",
  Function = "CutToughness",
  Value = 10000,
}
r0_0.RT_519 = {
  FXId = 851511,
  Function = "PlayFX",
}
r0_0.RT_520 = {
  FXId = 600302,
  Function = "PlayFX",
}
r0_0.RT_521 = {
  [1] = r0_0.RT_33,
  [2] = r0_0.RT_495,
}
r0_0.RT_522 = {
  Function = "PlaySE",
  SEId = 310105,
}
r0_0.RT_523 = {
  "hit1",
  "hit2"
}
r0_0.RT_524 = {
  FXId = 310203,
  Function = "PlayFX",
  IsAttached = true,
}
r0_0.RT_525 = {
  Function = "Disarm",
}
r0_0.RT_526 = {
  Function = "PlaySE",
  SEId = 310205,
}
r0_0.RT_527 = {
  BossValue = 8,
  CauseHit = "LightHit",
  Function = "CutToughness",
  Value = 33,
}
r0_0.RT_528 = {
  [1] = r0_0.RT_247,
  [2] = r0_0.RT_527,
  [3] = r0_0.RT_526,
  [4] = r0_0.RT_119,
  [5] = r0_0.RT_414,
}
r0_0.RT_529 = {
  FXId = 310204,
  Function = "PlayFX",
  IsAttached = true,
}
r0_0.RT_530 = {
  Falloff = 0.1,
  Function = "CameraShake",
  IsSceneCameraShake = true,
  OuterRadius = 500,
  ShakeClass = "BP_Camera_Yeer_Explode_Light",
}
r0_0.RT_531 = {
  BaseAttr = "MaxHp",
  DamageTag = r0_0.RT_40,
  DamageType = "Fire",
  Function = "Damage",
  Rate = "#1",
  Value = "#2",
}
r0_0.RT_532 = {
  BossValue = 160,
  CauseHit = "HitFly_XY300Z800",
  Function = "CutToughness",
  Value = 100,
}
r0_0.RT_533 = {
  BuffId = 205,
  Function = "AddBuff",
  LastTime = 5,
}
r0_0.RT_534 = {
  Function = "PlaySE",
  SEId = 320105,
}
r0_0.RT_535 = {
  CreatureId = 320202,
  Function = "RemoveSkillCreature",
}
r0_0.RT_536 = {
  -40,
  0,
  70
}
r0_0.RT_537 = {
  AutoAttach = 1,
  CreatureId = 320202,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_536,
}
r0_0.RT_538 = {
  "Skill",
  "KamiPassive"
}
r0_0.RT_539 = {
  BaseAttr = "ATK_Char",
  DamageTag = r0_0.RT_179,
  Delay = 0.2,
  Function = "Damage",
  Rate = "#1",
}
r0_0.RT_540 = {
  BuffId = 201,
  Delay = 0.2,
  Function = "AddBuff",
  LastTime = 2,
}
r0_0.RT_541 = {
  BossValue = 23,
  CauseHit = "LightHit",
  Delay = 0.2,
  Function = "CutToughness",
  Value = 5,
}
r0_0.RT_542 = {
  BaseChar = "Target",
  FXId = 330110,
  Function = "PlayFX",
  IsEffectCreature = true,
}
r0_0.RT_543 = {
  Function = "PlaySE",
  SEId = 330101,
}
r0_0.RT_544 = {
  BaseChar = "Target",
  CreateWithoutTarget = false,
  CreatureId = 330103,
  DefaultLocationOffset = r0_0.RT_315,
  Function = "CreateSkillCreature",
}
r0_0.RT_545 = {
  [1] = r0_0.RT_539,
  [2] = r0_0.RT_540,
  [3] = r0_0.RT_541,
  [4] = r0_0.RT_542,
  [5] = r0_0.RT_543,
  [6] = r0_0.RT_544,
}
r0_0.RT_546 = {
  Function = "ExecutePassiveFunction",
  FunctionName = "ClearSkill01TargetNum",
  PassiveEffectId = 330101,
}
r0_0.RT_547 = {
  [1] = r0_0.RT_539,
  [2] = r0_0.RT_540,
  [3] = r0_0.RT_541,
  [4] = r0_0.RT_542,
  [5] = r0_0.RT_543,
  [6] = r0_0.RT_546,
}
r0_0.RT_548 = {
  Falloff = 0.1,
  Function = "CameraShake",
  IsSceneCameraShake = true,
  OuterRadius = 2000,
  ShakeClass = "BP_CS_Maer_Hit01",
}
r0_0.RT_549 = {
  BossValue = 93,
  CauseHit = "HitFly_Force_Common",
  Function = "CutToughness",
  Value = 30,
}
r0_0.RT_550 = {
  CauseHit = "HitFly_XY200Z300",
  Function = "CutToughness",
  Value = 100,
}
r0_0.RT_551 = {
  "Support"
}
r0_0.RT_552 = {
  BaseAttr = "ATK_Char",
  DamageTag = r0_0.RT_551,
  DamageType = "Dark",
  Delay = 0.4,
  Function = "Damage",
  Rate = "#1",
}
r0_0.RT_553 = {
  CauseHit = "LightHit_100_F",
  Delay = 0.4,
  Function = "CutToughness",
  Value = 80,
}
r0_0.RT_554 = {
  BaseChar = "Self",
  Function = "PlaySE",
  SEId = 2018,
}
r0_0.RT_555 = {
  BaseChar = "Self",
  Function = "PlaySE",
  SEId = 2016,
}
r0_0.RT_556 = {
  FXId = 90003,
  Function = "PlayFX",
  Overlap = true,
}
r0_0.RT_557 = {
  CauseHit = "HitFly_Force_Common",
  Function = "CutToughness",
  Value = 1000,
}
r0_0.RT_558 = {
  BaseAttr = "ATK_Char",
  Function = "Damage",
  Rate = 17,
}
r0_0.RT_559 = {
  FXId = 90003,
  Function = "PlayFX",
  NormalToHit = true,
  Overlap = true,
}
r0_0.RT_560 = {
  [1] = r0_0.RT_558,
  [2] = r0_0.RT_559,
  [3] = r0_0.RT_557,
  [4] = r0_0.RT_175,
}
r0_0.RT_561 = {
  BaseAttr = "ATK_Char",
  DamageType = "TrueDamage",
  Function = "Damage",
  Rate = 1.7,
}
r0_0.RT_562 = {
  FXId = 90004,
  Function = "PlayFX",
  NormalToHit = true,
  Overlap = true,
}
r0_0.RT_563 = {
  CauseHit = "RangedWeapon_Shotgun",
  Function = "CutToughness",
  Value = 0.2,
}
r0_0.RT_564 = {
  [1] = r0_0.RT_562,
}
r0_0.RT_565 = {
  BaseAttr = "ATK_Char",
  DamageType = "Default",
  Function = "Damage",
  Rate = 24,
}
r0_0.RT_566 = {
  CauseHit = "HitFly_XY400Z300_F",
  Function = "CutToughness",
  Value = 1000,
}
r0_0.RT_567 = {
  Function = "PlaySE",
  SEId = 2017,
}
r0_0.RT_568 = {
  [1] = r0_0.RT_565,
  [2] = r0_0.RT_559,
  [3] = r0_0.RT_566,
  [4] = r0_0.RT_567,
}
r0_0.RT_569 = {
  BaseAttr = "ATK_Char",
  DamageType = "Default",
  Function = "Damage",
  Rate = 2.8,
}
r0_0.RT_570 = {
  [1] = r0_0.RT_569,
  [2] = r0_0.RT_562,
}
r0_0.RT_571 = {
  BaseAttr = "ATK_Char",
  DamageType = "Default",
  Function = "Damage",
  Rate = 5,
}
r0_0.RT_572 = {
  [1] = r0_0.RT_571,
  [2] = r0_0.RT_562,
}
r0_0.RT_573 = {
  BuffId = 850204,
  Function = "AddBuff",
  LastTime = 1.3,
}
r0_0.RT_574 = {
  BuffId = 850204,
  BySource = true,
  Function = "RemoveBuff",
}
r0_0.RT_575 = {
  FXId = 40101007,
  Function = "PlayFX",
  NormalToHit = true,
  Overlap = true,
}
r0_0.RT_576 = {
  [1] = r0_0.RT_565,
  [2] = r0_0.RT_575,
  [3] = r0_0.RT_566,
  [4] = r0_0.RT_567,
}
r0_0.RT_577 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 5,
}
r0_0.RT_578 = {
  [1] = r0_0.RT_577,
}
r0_0.RT_579 = {
  Delay = 0.4,
  Function = "AddEnergyShield",
  IsOverShield = 1,
  Rate = 0,
  Value = "#1",
}
r0_0.RT_580 = {
  BaseAttr = "MaxHp",
  DamageType = "Default",
  Delay = 0.4,
  Function = "Heal",
  Rate = "#1",
}
r0_0.RT_581 = {
  BossValue = 1,
  CauseHit = "LightHit",
  Function = "CutToughness",
  Value = 33,
}
r0_0.RT_582 = {
  Function = "PlaySE",
  SEId = 410105,
}
r0_0.RT_583 = {
  AimTarget = true,
  FXId = 410121,
  Function = "PlayFX",
  IsAttached = true,
}
r0_0.RT_584 = {
  [1] = r0_0.RT_213,
  [2] = r0_0.RT_581,
  [3] = r0_0.RT_123,
}
r0_0.RT_585 = {
  0,
  0,
  -87
}
r0_0.RT_586 = {
  Function = "PlaySE",
  SEId = 410207,
}
r0_0.RT_587 = {
  ATKBase = "ATK_Char",
  CreatureId = 410222,
  Function = "CreateSkillCreature",
  UseSaveLoc = "ZhiliuTD",
}
r0_0.RT_588 = {
  ATKBase = "ATK_Char",
  CreatureId = 410223,
  Function = "CreateSkillCreature",
  UseSaveLoc = "ZhiliuTD",
}
r0_0.RT_589 = {
  Function = "PlaySE",
  SEId = 410211,
}
r0_0.RT_590 = {
  Function = "ExecuteClientPassiveFunction",
  FunctionName = "EndPP",
}
r0_0.RT_591 = {
  CreatureId = 410225,
  Function = "RemoveSkillCreature",
}
r0_0.RT_592 = {
  CreatureId = 410245,
  Function = "RemoveSkillCreature",
}
r0_0.RT_593 = {
  BossValue = 12,
  CauseHit = "HitFly_XY400Z300",
  Function = "CutToughness",
  Value = 100,
}
r0_0.RT_594 = {
  CanBeScaled = true,
  FXId = 410215,
  Function = "PlayFX",
  IsAttached = 1,
}
r0_0.RT_595 = {
  Function = "PlaySE",
  SEId = 410210,
}
r0_0.RT_596 = {
  [1] = r0_0.RT_213,
  [2] = r0_0.RT_593,
  [3] = r0_0.RT_594,
  [4] = r0_0.RT_595,
}
r0_0.RT_597 = {
  ComboCount = 1,
  Function = "HitCount",
}
r0_0.RT_598 = {
  [1] = r0_0.RT_597,
}
r0_0.RT_599 = {
  DamageType = "TrueDamage",
  Function = "Damage",
  Value = 200,
}
r0_0.RT_600 = {
  [1] = r0_0.RT_599,
  [2] = r0_0.RT_556,
  [3] = r0_0.RT_557,
  [4] = r0_0.RT_175,
}
r0_0.RT_601 = {
  [1] = r0_0.RT_599,
  [2] = r0_0.RT_559,
  [3] = r0_0.RT_557,
  [4] = r0_0.RT_175,
}
r0_0.RT_602 = {
  BuffId = 420111,
  Function = "AddBuff",
  LastTime = -1,
}
r0_0.RT_603 = {
  Delay = 0.1,
  FXId = 26,
  Function = "PlayFX",
}
r0_0.RT_604 = {
  "Skill",
  "Skill2",
  "YumingExtra"
}
r0_0.RT_605 = {
  BaseAttr = "ATK_Char",
  DamageTag = r0_0.RT_604,
  Function = "Damage",
  Rate = "#1",
}
r0_0.RT_606 = {
  BaseChar = "Target",
  FXId = 420103,
  Function = "PlayFX",
}
r0_0.RT_607 = {
  [1] = r0_0.RT_605,
  [2] = r0_0.RT_606,
}
r0_0.RT_608 = {
  BuffId = 420112,
  Function = "AddBuff",
  LastTime = 8,
}
r0_0.RT_609 = {
  BaseAttr = "DEF",
  DamageTag = r0_0.RT_40,
  DamageType = "EsDamage",
  Function = "Damage",
  Rate = "#1",
  Value = "#2",
}
r0_0.RT_610 = {
  "Skill",
  "Skill1",
  "XibiSkill01",
  "XibiSkill01SP"
}
r0_0.RT_611 = {
  CreatureId = 430111,
  Function = "RemoveSkillCreature",
}
r0_0.RT_612 = {
  CreatureId = 430113,
  Function = "RemoveSkillCreature",
}
r0_0.RT_613 = {
  CreatureId = 430114,
  Function = "RemoveSkillCreature",
}
r0_0.RT_614 = {
  [1] = r0_0.RT_611,
  [2] = r0_0.RT_612,
  [3] = r0_0.RT_613,
}
r0_0.RT_615 = {
  BaseAttr = "MaxHp",
  DamageTag = r0_0.RT_246,
  DamageType = "Thunder",
  Function = "Damage",
  Rate = "#1",
  Value = "#2",
}
r0_0.RT_616 = {
  [1] = r0_0.RT_615,
}
r0_0.RT_617 = {
  BossValue = 46,
  CauseHit = "HitFly_XY200Z300",
  Function = "CutToughness",
  Value = 33,
}
r0_0.RT_618 = {
  FXId = 500000306,
  Function = "PlayFX",
}
r0_0.RT_619 = {
  BaseAttr = "MaxHp",
  BaseChar = "Target",
  DamageType = "Default",
  Function = "Damage",
  Rate = 0.67,
}
r0_0.RT_620 = {
  -200,
  200
}
r0_0.RT_621 = {
  CauseHit = "HitFly_XY400Z600",
  Function = "CutToughness",
  Value = 150,
}
r0_0.RT_622 = {
  BaseAttr = "MaxHp",
  DamageTag = r0_0.RT_179,
  DamageType = "Wind",
  Function = "Damage",
  Rate = "#1",
  Value = "#2",
}
r0_0.RT_623 = {
  BuffType = 10,
  Function = "RemoveBuff",
  Num = 1,
}
r0_0.RT_624 = {
  BossValue = 56,
  CauseHit = "HitFly_XY1000Z500",
  Function = "CutToughness",
  Value = 100,
}
r0_0.RT_625 = {
  FXId = 510105,
  Function = "PlayFX",
}
r0_0.RT_626 = {
  Function = "PlaySE",
  SEId = 510102,
}
r0_0.RT_627 = {
  "MeleeWord",
  "Skill"
}
r0_0.RT_628 = {
  BaseAttr = "MaxHp",
  DamageTag = r0_0.RT_627,
  DamageType = "Wind",
  Function = "Damage",
  Rate = "#1",
  Value = "#2",
}
r0_0.RT_629 = {
  BodyAccessoryEffect = true,
  DieEffect = false,
  Function = "AdditionalHitFX",
}
r0_0.RT_630 = {
  Function = "ExecutePassiveFunction",
  FunctionName = "QuitSkill02",
  PassiveEffectId = 510201,
}
r0_0.RT_631 = {
  ATK = 1,
  DEF = 1,
  ES = 0,
  EnmityValue = 0,
  MaxES = 0,
  MaxHp = 1,
  SkillIntensity = 1,
  StrongValue = 0,
}
r0_0.RT_632 = {
  AttrRates = r0_0.RT_631,
  Function = "CreateUnit",
  IsShadow = 1,
  LifeTime = 5,
  MaxSummonCount = 1,
  SingleSummonCount = 1,
  UnitId = 530101,
  UnitType = "Monster",
}
r0_0.RT_633 = {
  Function = "PlaySE",
  SEId = 25,
}
r0_0.RT_634 = {
  ATKBase = "ATK",
  CreatureId = 530111,
  Delay = 0.05,
  Function = "CreateSkillCreature",
  UseSaveLoc = "SaiqiMissle",
}
r0_0.RT_635 = {
  ATKBase = "ATK",
  CreatureId = 530111,
  Delay = 0.1,
  Function = "CreateSkillCreature",
  UseSaveLoc = "SaiqiMissle",
}
r0_0.RT_636 = {
  ATKBase = "ATK",
  CreatureId = 530111,
  Delay = 0.15,
  Function = "CreateSkillCreature",
  UseSaveLoc = "SaiqiMissle",
}
r0_0.RT_637 = {
  ATKBase = "ATK",
  CreatureId = 530111,
  Delay = 0.2,
  Function = "CreateSkillCreature",
  UseSaveLoc = "SaiqiMissle",
}
r0_0.RT_638 = {
  "RootSource"
}
r0_0.RT_639 = {
  Function = "PlaySE",
  SEId = 530102,
}
r0_0.RT_640 = {
  "Skill",
  "Skill1",
  "SaiqiSkill01"
}
r0_0.RT_641 = {
  BaseAttr = "ATK_Char",
  DamageTag = r0_0.RT_640,
  Function = "Damage",
  Rate = "#1",
}
r0_0.RT_642 = {
  ATKBase = "ATK",
  CreatureId = 530111,
  Delay = 0.25,
  Function = "CreateSkillCreature",
  UseSaveLoc = "SaiqiMissle",
}
r0_0.RT_643 = {
  ATKBase = "ATK",
  CreatureId = 530111,
  Delay = 0.3,
  Function = "CreateSkillCreature",
  UseSaveLoc = "SaiqiMissle",
}
r0_0.RT_644 = {
  ATKBase = "ATK",
  CreatureId = 530111,
  Delay = 0.35,
  Function = "CreateSkillCreature",
  UseSaveLoc = "SaiqiMissle",
}
r0_0.RT_645 = {
  ATKBase = "ATK",
  CreatureId = 530111,
  Delay = 0.4,
  Function = "CreateSkillCreature",
  UseSaveLoc = "SaiqiMissle",
}
r0_0.RT_646 = {
  ClientSkillLogicId = 530101,
  Function = "ExecuteClientSkillLogicFunction",
  FunctionName = "SetShootLoc",
}
r0_0.RT_647 = {
  BaseAttr = "ATK_Ultra",
  DamageTag = r0_0.RT_343,
  Function = "Damage",
  Rate = "#1",
}
r0_0.RT_648 = {
  BossValue = 14,
  CauseHit = "LightHit",
  Function = "CutToughness",
  Value = 15,
}
r0_0.RT_649 = {
  Function = "PlaySE",
  SEId = 530106,
}
r0_0.RT_650 = {
  BaseAttr = "ATK_Char",
  Function = "Heal",
  Rate = "#1",
  Value = 35,
}
r0_0.RT_651 = {
  BaseAttr = "MaxSp",
  DamageTag = r0_0.RT_179,
  DamageType = "Wind",
  Function = "Damage",
  Rate = 1,
}
r0_0.RT_652 = {
  BuffId = 540222,
  Function = "AddBuff",
  LastTime = 12,
}
r0_0.RT_653 = {
  [1] = r0_0.RT_652,
}
r0_0.RT_654 = {
  "PhantomAvoid"
}
r0_0.RT_655 = {
  BaseAttr = "ATK",
  DamageTag = r0_0.RT_654,
  Function = "Damage",
  Rate = 0.1,
}
r0_0.RT_656 = {
  FXId = 600001,
  Function = "PlayFX",
}
r0_0.RT_657 = {
  AimTarget = true,
  FXId = 600000402,
  Function = "PlayFX",
  IsAttached = true,
}
r0_0.RT_658 = {
  "PhantomAvoid",
  "Fade"
}
r0_0.RT_659 = {
  BaseAttr = "ATK",
  DamageTag = r0_0.RT_658,
  Function = "Damage",
  Rate = 0.4,
}
r0_0.RT_660 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 1.67,
}
r0_0.RT_661 = {
  FXId = 600009,
  Function = "PlayFX",
}
r0_0.RT_662 = {
  [1] = r0_0.RT_660,
  [2] = r0_0.RT_661,
  [3] = r0_0.RT_5,
}
r0_0.RT_663 = {
  BuffId = 600101,
  Function = "AddBuff",
  LastTime = 5,
}
r0_0.RT_664 = {
  [1] = r0_0.RT_663,
}
r0_0.RT_665 = {
  BuffId = 600101,
  BySource = true,
  Function = "RemoveBuff",
}
r0_0.RT_666 = {
  [1] = r0_0.RT_665,
}
r0_0.RT_667 = {
  "hit1",
  "hit2",
  "hit3"
}
r0_0.RT_668 = {
  FXId = 600203,
  Function = "PlayFX",
  Overlap = true,
}
r0_0.RT_669 = {
  Function = "PlaySE",
  SEId = 600201,
}
r0_0.RT_670 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 1.57,
}
r0_0.RT_671 = {
  FXId = 600203,
  Function = "PlayFX",
  NormalToHit = true,
  Overlap = true,
}
r0_0.RT_672 = {
  Function = "PlaySE",
  SEId = 600201,
  SceneSe = true,
}
r0_0.RT_673 = {
  [1] = r0_0.RT_671,
  [2] = r0_0.RT_672,
}
r0_0.RT_674 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 2.67,
}
r0_0.RT_675 = {
  BaseAttr = "MaxHp",
  Function = "Heal",
  Rate = 0.3,
}
r0_0.RT_676 = {
  BaseAttr = "MaxHp",
  Function = "Heal",
  Rate = 0.5,
}
r0_0.RT_677 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 2.1,
}
r0_0.RT_678 = {
  [1] = r0_0.RT_677,
  [2] = r0_0.RT_661,
  [3] = r0_0.RT_5,
}
r0_0.RT_679 = {
  Function = "PlaySE",
  SEId = 600401,
}
r0_0.RT_680 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 2.5,
}
r0_0.RT_681 = {
  CauseHit = "HitFly_XY1200Z1000",
  Function = "CutToughness",
  Value = 100,
}
r0_0.RT_682 = {
  CauseHit = "LightHit_300",
  Function = "CutToughness",
  Value = 100,
}
r0_0.RT_683 = {
  BuffId = 600501,
  Function = "AddBuff",
  LastTime = 3,
}
r0_0.RT_684 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 4,
}
r0_0.RT_685 = {
  CauseHit = "LightHit_300",
  Function = "CutToughness",
}
r0_0.RT_686 = {
  Function = "PlaySE",
  SEId = 600701,
}
r0_0.RT_687 = {
  Function = "PlaySE",
  SEId = 600701,
  SceneSe = true,
}
r0_0.RT_688 = {
  BaseAttr = "MaxHP",
  DamageType = "TrueDamage",
  Function = "Damage",
  Rate = 0.5,
}
r0_0.RT_689 = {
  [1] = r0_0.RT_688,
  [2] = r0_0.RT_10,
  [3] = r0_0.RT_686,
}
r0_0.RT_690 = {
  CauseHit = "HitFly_XY800Z1000",
  Function = "CutToughness",
}
r0_0.RT_691 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 1.85,
}
r0_0.RT_692 = {
  FXId = 600704,
  Function = "PlayFX",
}
r0_0.RT_693 = {
  0,
  800,
  0
}
r0_0.RT_694 = {
  BaseAttr = "ATK_Char",
  DamageTag = r0_0.RT_551,
  Function = "Damage",
  Rate = 3,
}
r0_0.RT_695 = {
  FXId = 6011,
  Function = "PlayFX",
}
r0_0.RT_696 = {
  FXId = 601202,
  Function = "PlayFX",
  NormalToHit = true,
  Overlap = true,
}
r0_0.RT_697 = {
  BuffId = 6000301,
  Function = "AddBuff",
  LastTime = 5,
}
r0_0.RT_698 = {
  Function = "PlaySE",
  SEId = 600203,
}
r0_0.RT_699 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 0.43,
}
r0_0.RT_700 = {
  CauseHit = "LightHit_100",
  Function = "CutToughness",
  Value = 100,
}
r0_0.RT_701 = {
  Function = "PlaySE",
  SEId = 600303,
}
r0_0.RT_702 = {
  BaseAttr = "MaxHp",
  DamageType = "TrueDamage",
  Function = "Damage",
  Rate = 2,
}
r0_0.RT_703 = {
  Function = "PlaySE",
  SEId = 601502,
}
r0_0.RT_704 = {
  Function = "PlaySE",
  SEId = 601503,
}
r0_0.RT_705 = {
  FXId = 601504,
  Function = "PlayFX",
}
r0_0.RT_706 = {
  FXId = 601603,
  Function = "PlayFX",
  Overlap = true,
}
r0_0.RT_707 = {
  Function = "PlaySE",
  SEId = 601601,
}
r0_0.RT_708 = {
  FXId = 601606,
  Function = "PlayFX",
  NormalToHit = true,
  Overlap = true,
}
r0_0.RT_709 = {
  [1] = r0_0.RT_708,
}
r0_0.RT_710 = {
  Function = "PlaySE",
  SEId = 601701,
}
r0_0.RT_711 = {
  [1] = r0_0.RT_660,
  [2] = r0_0.RT_661,
  [3] = r0_0.RT_710,
}
r0_0.RT_712 = {
  CreatureId = 60200,
  Function = "CreateSkillCreature",
}
r0_0.RT_713 = {
  [1] = r0_0.RT_712,
  [2] = r0_0.RT_712,
  [3] = r0_0.RT_712,
  [4] = r0_0.RT_712,
  [5] = r0_0.RT_712,
  [6] = r0_0.RT_712,
  [7] = r0_0.RT_712,
  [8] = r0_0.RT_712,
}
r0_0.RT_714 = {
  FXId = 6022,
  Function = "PlayFX",
}
r0_0.RT_715 = {
  CauseHit = "LightHit_100",
  Function = "CutToughness",
  Value = 15,
}
r0_0.RT_716 = {
  CreatureId = 60202,
  Function = "CreateSkillCreature",
}
r0_0.RT_717 = {
  [1] = r0_0.RT_716,
  [2] = r0_0.RT_716,
  [3] = r0_0.RT_716,
  [4] = r0_0.RT_716,
  [5] = r0_0.RT_716,
  [6] = r0_0.RT_716,
  [7] = r0_0.RT_716,
  [8] = r0_0.RT_716,
}
r0_0.RT_718 = {
  CreatureId = 60301,
  Function = "CreateSkillCreature",
}
r0_0.RT_719 = {
  CreatureId = 60303,
  Function = "CreateSkillCreature",
}
r0_0.RT_720 = {
  CauseHit = "HitFly_XY200Z300",
  Function = "CutToughness",
  Value = 20,
}
r0_0.RT_721 = {
  CreatureId = 700101,
  ExtraRotation = 105,
  Function = "CreateSkillCreature",
}
r0_0.RT_722 = {
  FXId = 700104,
  Function = "PlayFX",
  IsAttached = true,
}
r0_0.RT_723 = {
  [1] = r0_0.RT_721,
  [2] = r0_0.RT_722,
}
r0_0.RT_724 = {
  FXId = 600006,
  Function = "PlayFX",
  Overlap = true,
}
r0_0.RT_725 = {
  Function = "PlaySE",
  SEId = 1001,
}
r0_0.RT_726 = {
  FXId = 600006,
  Function = "PlayFX",
  NormalToHit = true,
  Overlap = true,
}
r0_0.RT_727 = {
  Function = "PlaySE",
  SEId = 1001,
  SceneSe = true,
}
r0_0.RT_728 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 1.53,
}
r0_0.RT_729 = {
  [1] = r0_0.RT_728,
  [2] = r0_0.RT_4,
}
r0_0.RT_730 = {
  -25,
  -90,
  0
}
r0_0.RT_731 = {
  FXId = 600008,
  Function = "PlayFX",
  FxRotator = r0_0.RT_730,
  IsFaceToChar = true,
}
r0_0.RT_732 = {
  30,
  -90,
  0
}
r0_0.RT_733 = {
  FXId = 600008,
  Function = "PlayFX",
  FxRotator = r0_0.RT_732,
  IsFaceToChar = true,
}
r0_0.RT_734 = {
  FXId = 600008,
  Function = "PlayFX",
  IsFaceToChar = true,
}
r0_0.RT_735 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 0.18,
}
r0_0.RT_736 = {
  FXId = 700302,
  Function = "PlayFX",
  NormalToHit = true,
}
r0_0.RT_737 = {
  "hit1",
  "hit2",
  "hit3",
  "hit4"
}
r0_0.RT_738 = {
  FXId = 600007,
  Function = "PlayFX",
}
r0_0.RT_739 = {
  10,
  -90,
  0
}
r0_0.RT_740 = {
  FXId = 600008,
  Function = "PlayFX",
  FxRotator = r0_0.RT_739,
  IsFaceToChar = true,
}
r0_0.RT_741 = {
  CauseHit = "HitFly_XY1000Z1000",
  Function = "CutToughness",
  Value = 100,
}
r0_0.RT_742 = {
  BuffId = 700501,
  Function = "AddBuff",
  LastTime = -1,
}
r0_0.RT_743 = {
  [1] = r0_0.RT_742,
}
r0_0.RT_744 = {
  BuffId = 700501,
  Function = "RemoveBuff",
}
r0_0.RT_745 = {
  [1] = r0_0.RT_744,
}
r0_0.RT_746 = {
  BuffId = 700502,
  Function = "AddBuff",
  LastTime = -1,
}
r0_0.RT_747 = {
  [1] = r0_0.RT_746,
}
r0_0.RT_748 = {
  BaseAttr = "MaxHp",
  DamageType = "TrueDamage",
  Function = "Damage",
  Rate = 1,
}
r0_0.RT_749 = {
  [1] = r0_0.RT_748,
}
r0_0.RT_750 = {
  [1] = r0_0.RT_358,
  [2] = r0_0.RT_10,
  [3] = r0_0.RT_738,
}
r0_0.RT_751 = {
  Function = "PlaySE",
  SEId = 700804,
}
r0_0.RT_752 = {
  FXId = 700802,
  Function = "PlayFX",
  NormalToHit = true,
}
r0_0.RT_753 = {
  CauseHit = "HitFly_XY600Z1000",
  Function = "CutToughness",
  Value = 100,
}
r0_0.RT_754 = {
  CauseHit = "LightHit_200",
  Function = "CutToughness",
  Value = 100,
}
r0_0.RT_755 = {
  Tag = 6,
}
r0_0.RT_756 = {
  Function = "EffectFunction",
  FunctionName = "SelfLocation",
  Vars = r0_0.RT_755,
}
r0_0.RT_757 = {
  Distance = 700,
  MaxNum = 4,
  Radius = 1000,
}
r0_0.RT_758 = {
  Function = "EffectFunction",
  FunctionName = "RandomAreaLocation",
  Vars = r0_0.RT_757,
}
r0_0.RT_759 = {
  CauseHit = "HitFly_XY800Z1000",
  Function = "CutToughness",
  Value = 100,
}
r0_0.RT_760 = {
  Function = "PlaySE",
  SEId = 700901,
}
r0_0.RT_761 = {
  [1] = r0_0.RT_660,
  [2] = r0_0.RT_661,
  [3] = r0_0.RT_760,
}
r0_0.RT_762 = {
  0,
  0,
  -50
}
r0_0.RT_763 = {
  Function = "PlaySE",
  SEId = 701001,
}
r0_0.RT_764 = {
  FXId = 701006,
  Function = "PlayFX",
}
r0_0.RT_765 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 1.39,
}
r0_0.RT_766 = {
  FXId = 701304,
  Function = "PlayFX",
  NormalToHit = true,
}
r0_0.RT_767 = {
  Function = "SaveLoc",
  TargetType = "Target",
}
r0_0.RT_768 = {
  [1] = r0_0.RT_767,
}
r0_0.RT_769 = {
  0,
  20,
  40
}
r0_0.RT_770 = {
  FXId = 701504,
  Function = "PlayFX",
}
r0_0.RT_771 = {
  BaseAttr = "MaxHP",
  DamageType = "TrueDamage",
  Function = "Damage",
  Rate = 1,
}
r0_0.RT_772 = {
  [1] = r0_0.RT_771,
}
r0_0.RT_773 = {
  Function = "PlaySE",
  SEId = 701602,
}
r0_0.RT_774 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 0.8,
}
r0_0.RT_775 = {
  Function = "PlaySE",
  SEId = 800101,
}
r0_0.RT_776 = {
  Function = "PlaySE",
  SEId = 800102,
}
r0_0.RT_777 = {
  [1] = r0_0.RT_3,
  [2] = r0_0.RT_4,
  [3] = r0_0.RT_776,
}
r0_0.RT_778 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 1.6,
}
r0_0.RT_779 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 3,
}
r0_0.RT_780 = {
  CauseHit = "LightHit_400",
  Function = "CutToughness",
  Value = 100,
}
r0_0.RT_781 = {
  FXId = 850001,
  Function = "PlayFX",
}
r0_0.RT_782 = {
  CauseHit = "LightHit_150",
  Function = "CutToughness",
  Value = 100,
}
r0_0.RT_783 = {
  [1] = r0_0.RT_779,
  [2] = r0_0.RT_781,
  [3] = r0_0.RT_782,
  [4] = r0_0.RT_5,
}
r0_0.RT_784 = {
  [1] = r0_0.RT_16,
  [2] = r0_0.RT_781,
  [3] = r0_0.RT_782,
  [4] = r0_0.RT_5,
}
r0_0.RT_785 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 2.3,
}
r0_0.RT_786 = {
  [1] = r0_0.RT_785,
  [2] = r0_0.RT_781,
  [3] = r0_0.RT_682,
  [4] = r0_0.RT_5,
}
r0_0.RT_787 = {
  [1] = r0_0.RT_22,
  [2] = r0_0.RT_781,
  [3] = r0_0.RT_682,
  [4] = r0_0.RT_5,
}
r0_0.RT_788 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 4.5,
}
r0_0.RT_789 = {
  [1] = r0_0.RT_788,
  [2] = r0_0.RT_781,
  [3] = r0_0.RT_782,
  [4] = r0_0.RT_5,
}
r0_0.RT_790 = {
  CreatureId = 850011,
  Function = "CreateSkillCreature",
}
r0_0.RT_791 = {
  [1] = r0_0.RT_790,
}
r0_0.RT_792 = {
  CreatureId = 850011,
  Function = "RemoveSkillCreature",
}
r0_0.RT_793 = {
  [1] = r0_0.RT_792,
}
r0_0.RT_794 = {
  [1] = r0_0.RT_3,
  [2] = r0_0.RT_781,
  [3] = r0_0.RT_782,
  [4] = r0_0.RT_5,
}
r0_0.RT_795 = {
  CreatureId = 850012,
  Function = "CreateSkillCreature",
  UseSaveLoc = "SwordDashLocStart",
}
r0_0.RT_796 = {
  CreatureId = 850012,
  Delay = 0.3,
  Function = "CreateSkillCreature",
  UseSaveLoc = "SwordDashLocMid",
}
r0_0.RT_797 = {
  CreatureId = 850012,
  Delay = 0.6,
  Function = "CreateSkillCreature",
  UseSaveLoc = "SwordDashLocEnd",
}
r0_0.RT_798 = {
  [1] = r0_0.RT_795,
  [2] = r0_0.RT_796,
  [3] = r0_0.RT_797,
}
r0_0.RT_799 = {
  [1] = r0_0.RT_3,
  [2] = r0_0.RT_781,
  [3] = r0_0.RT_682,
  [4] = r0_0.RT_5,
}
r0_0.RT_800 = {
  0,
  0,
  -100
}
r0_0.RT_801 = {
  Delay = 0.1,
  FXId = 850002,
  Function = "PlayFX",
}
r0_0.RT_802 = {
  CauseHit = "LightHit_100",
  Delay = 0.1,
  Function = "CutToughness",
  Value = 100,
}
r0_0.RT_803 = {
  50,
  -50,
  0
}
r0_0.RT_804 = {
  50,
  50,
  0
}
r0_0.RT_805 = {
  FXId = 850002,
  Function = "PlayFX",
}
r0_0.RT_806 = {
  [1] = r0_0.RT_674,
  [2] = r0_0.RT_805,
  [3] = r0_0.RT_700,
}
r0_0.RT_807 = {
  BoneName = "head",
  DanmakuTemplateId = 850051,
  Duration = 3,
  Function = "CreateDanmaku",
}
r0_0.RT_808 = {
  [1] = r0_0.RT_807,
}
r0_0.RT_809 = {
  FXId = 850011,
  Function = "PlayFX",
  NormalToHit = true,
  Overlap = true,
}
r0_0.RT_810 = {
  [1] = r0_0.RT_496,
  [2] = r0_0.RT_809,
  [3] = r0_0.RT_805,
}
r0_0.RT_811 = {
  CantLockTime = 0.8,
  Function = "CameraUnlock",
}
r0_0.RT_812 = {
  [1] = r0_0.RT_811,
}
r0_0.RT_813 = {
  Function = "SetSelfLoc",
  SaveLocTag = "BornLoc",
  TargetCenterLoc = "SavedLoc",
}
r0_0.RT_814 = {
  [1] = r0_0.RT_813,
}
r0_0.RT_815 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 5.5,
}
r0_0.RT_816 = {
  [1] = r0_0.RT_815,
  [2] = r0_0.RT_781,
  [3] = r0_0.RT_39,
}
r0_0.RT_817 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 0.4,
}
r0_0.RT_818 = {
  [1] = r0_0.RT_817,
  [2] = r0_0.RT_805,
}
r0_0.RT_819 = {
  CauseHit = "BossXibi_Skill07",
  Function = "CutToughness",
  Value = 100,
}
r0_0.RT_820 = {
  [1] = r0_0.RT_815,
  [2] = r0_0.RT_819,
}
r0_0.RT_821 = {
  "hit7"
}
r0_0.RT_822 = {
  0,
  0,
  350
}
r0_0.RT_823 = {
  FixLocation = true,
  FixLocationEndZ = -2000,
  FixLocationStartZ = 100,
  Function = "SetSelfLoc",
  LocOffset = r0_0.RT_822,
  TargetCenterLoc = "SavedLoc",
}
r0_0.RT_824 = {
  [1] = r0_0.RT_823,
}
r0_0.RT_825 = {
  "hit8"
}
r0_0.RT_826 = {
  CauseHit = "BossXibi_Skill08",
  Function = "CutToughness",
  Value = 100,
}
r0_0.RT_827 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 0.25,
}
r0_0.RT_828 = {
  [1] = r0_0.RT_827,
  [2] = r0_0.RT_805,
}
r0_0.RT_829 = {
  "MajoDodge"
}
r0_0.RT_830 = {
  BaseAttr = "ATK",
  DamageTag = r0_0.RT_829,
  Function = "Damage",
  Rate = 0.7,
}
r0_0.RT_831 = {
  CauseHit = "LightHit_120",
  Function = "CutToughness",
  Value = 100,
}
r0_0.RT_832 = {
  Function = "PlaySE",
  SEId = 850107,
}
r0_0.RT_833 = {
  [1] = r0_0.RT_830,
  [2] = r0_0.RT_831,
  [3] = r0_0.RT_832,
}
r0_0.RT_834 = {
  CauseHit = "BossLizhan_Skill02",
  Function = "CutToughness",
  Value = 100,
}
r0_0.RT_835 = {
  Function = "PlaySE",
  SEId = 850108,
}
r0_0.RT_836 = {
  BaseAttr = "ATK",
  DamageTag = r0_0.RT_829,
  Function = "Damage",
  Rate = 1.2,
}
r0_0.RT_837 = {
  [1] = r0_0.RT_836,
  [2] = r0_0.RT_834,
  [3] = r0_0.RT_835,
}
r0_0.RT_838 = {
  BaseAttr = "ATK",
  DamageTag = r0_0.RT_829,
  Function = "Damage",
  Rate = 0.9,
}
r0_0.RT_839 = {
  FXId = 850313,
  Function = "PlayFX",
}
r0_0.RT_840 = {
  BaseAttr = "ATK",
  DamageTag = r0_0.RT_829,
  Function = "Damage",
  Rate = 0.3,
}
r0_0.RT_841 = {
  BaseAttr = "ATK",
  DamageTag = r0_0.RT_829,
  Function = "Damage",
  Rate = 0.6,
}
r0_0.RT_842 = {
  CauseHit = "LightHit_60",
  Function = "CutToughness",
  Value = 100,
}
r0_0.RT_843 = {
  Function = "PlayFX",
  FxRotator = r0_0.RT_178,
  IsFaceToChar = true,
  WeaponFXGroupName = "Hit",
}
r0_0.RT_844 = {
  Function = "PlaySE",
  SEId = 850211,
}
r0_0.RT_845 = {
  [1] = r0_0.RT_22,
  [2] = r0_0.RT_110,
  [3] = r0_0.RT_843,
  [4] = r0_0.RT_844,
}
r0_0.RT_846 = {
  3,
  -90,
  0
}
r0_0.RT_847 = {
  Function = "PlayFX",
  FxRotator = r0_0.RT_846,
  IsFaceToChar = true,
  WeaponFXGroupName = "Hit",
}
r0_0.RT_848 = {
  [1] = r0_0.RT_779,
  [2] = r0_0.RT_110,
  [3] = r0_0.RT_847,
  [4] = r0_0.RT_844,
}
r0_0.RT_849 = {
  [1] = r0_0.RT_779,
  [2] = r0_0.RT_700,
  [3] = r0_0.RT_844,
}
r0_0.RT_850 = {
  0,
  0,
  140
}
r0_0.RT_851 = {
  CreatureId = 850207,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_850,
}
r0_0.RT_852 = {
  [1] = r0_0.RT_851,
}
r0_0.RT_853 = {
  CreatureId = 850210,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_850,
}
r0_0.RT_854 = {
  [1] = r0_0.RT_853,
}
r0_0.RT_855 = {
  Function = "PlaySE",
  SEId = 850232,
}
r0_0.RT_856 = {
  [1] = r0_0.RT_16,
  [2] = r0_0.RT_110,
  [3] = r0_0.RT_855,
}
r0_0.RT_857 = {
  [1] = r0_0.RT_684,
  [2] = r0_0.RT_754,
  [3] = r0_0.RT_318,
  [4] = r0_0.RT_844,
}
r0_0.RT_858 = {
  Function = "PlayFX",
  FxRotator = r0_0.RT_57,
  IsFaceToChar = true,
  WeaponFXGroupName = "Hit",
}
r0_0.RT_859 = {
  [1] = r0_0.RT_779,
  [2] = r0_0.RT_700,
  [3] = r0_0.RT_858,
  [4] = r0_0.RT_844,
}
r0_0.RT_860 = {
  BuffId = 850202,
  Function = "AddBuff",
  LastTime = 99,
}
r0_0.RT_861 = {
  BuffId = 850206,
  Function = "AddBuff",
  LastTime = 99,
}
r0_0.RT_862 = {
  BuffId = 850207,
  Function = "AddBuff",
  LastTime = 99,
}
r0_0.RT_863 = {
  BuffId = 850208,
  Function = "AddBuff",
  LastTime = 99,
}
r0_0.RT_864 = {
  BuffId = 850209,
  Function = "AddBuff",
  LastTime = 99,
}
r0_0.RT_865 = {
  [1] = r0_0.RT_861,
  [2] = r0_0.RT_862,
  [3] = r0_0.RT_863,
  [4] = r0_0.RT_864,
}
r0_0.RT_866 = {
  "hit13"
}
r0_0.RT_867 = {
  BuffId = 850202,
  Function = "RemoveBuff",
}
r0_0.RT_868 = {
  BuffId = 850206,
  Function = "RemoveBuff",
}
r0_0.RT_869 = {
  BuffId = 850207,
  Function = "RemoveBuff",
}
r0_0.RT_870 = {
  BuffId = 850208,
  Function = "RemoveBuff",
}
r0_0.RT_871 = {
  BuffId = 850209,
  Function = "RemoveBuff",
}
r0_0.RT_872 = {
  [1] = r0_0.RT_867,
  [2] = r0_0.RT_868,
  [3] = r0_0.RT_869,
  [4] = r0_0.RT_870,
  [5] = r0_0.RT_871,
}
r0_0.RT_873 = {
  0,
  600,
  400
}
r0_0.RT_874 = {
  CreatureId = 850201,
  Direction = r0_0.RT_873,
  Function = "CreateSkillCreature",
}
r0_0.RT_875 = {
  [1] = r0_0.RT_874,
}
r0_0.RT_876 = {
  0,
  600,
  -400
}
r0_0.RT_877 = {
  CreatureId = 850202,
  Direction = r0_0.RT_876,
  Function = "CreateSkillCreature",
}
r0_0.RT_878 = {
  [1] = r0_0.RT_877,
}
r0_0.RT_879 = {
  0,
  -600,
  400
}
r0_0.RT_880 = {
  CreatureId = 850204,
  Direction = r0_0.RT_879,
  Function = "CreateSkillCreature",
}
r0_0.RT_881 = {
  [1] = r0_0.RT_880,
}
r0_0.RT_882 = {
  0,
  -600,
  -400
}
r0_0.RT_883 = {
  CreatureId = 850205,
  Direction = r0_0.RT_882,
  Function = "CreateSkillCreature",
}
r0_0.RT_884 = {
  [1] = r0_0.RT_883,
}
r0_0.RT_885 = {
  Function = "PlaySE",
  SEId = 850262,
}
r0_0.RT_886 = {
  FixLocationEndZ = -3500,
  Function = "SaveLoc",
  IsOnGround = true,
  TargetType = "Target",
}
r0_0.RT_887 = {
  Distance = 600,
}
r0_0.RT_888 = {
  Function = "EffectFunction",
  FunctionName = "RelativeLocationToTarget",
  Vars = r0_0.RT_887,
}
r0_0.RT_889 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 0.3,
}
r0_0.RT_890 = {
  [1] = r0_0.RT_889,
  [2] = r0_0.RT_754,
  [3] = r0_0.RT_319,
}
r0_0.RT_891 = {
  [1] = r0_0.RT_886,
}
r0_0.RT_892 = {
  CreatureId = 850213,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_762,
  UseSaveLoc = "",
}
r0_0.RT_893 = {
  CreatureId = 850211,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_762,
  UseSaveLoc = "",
}
r0_0.RT_894 = {
  [1] = r0_0.RT_779,
  [2] = r0_0.RT_322,
}
r0_0.RT_895 = {
  [1] = r0_0.RT_573,
}
r0_0.RT_896 = {
  [1] = r0_0.RT_574,
}
r0_0.RT_897 = {
  Function = "CreateUnit",
  LifeTime = 15,
  UnitId = 850291,
  UnitType = "MechanismSummon",
}
r0_0.RT_898 = {
  [1] = r0_0.RT_897,
}
r0_0.RT_899 = {
  "hit3",
  "hit5",
  "hit7",
  "hit9"
}
r0_0.RT_900 = {
  "hit4",
  "hit6",
  "hit8",
  "hit10"
}
r0_0.RT_901 = {
  CreatureId = 850212,
  Function = "CreateSkillCreature",
  UseSaveLoc = "",
}
r0_0.RT_902 = {
  [1] = r0_0.RT_901,
}
r0_0.RT_903 = {
  Function = "PlaySE",
  SEId = 850292,
}
r0_0.RT_904 = {
  "hit11"
}
r0_0.RT_905 = {
  CreatureId = 850208,
  Function = "CreateSkillCreature",
  UseSaveLoc = "",
}
r0_0.RT_906 = {
  [1] = r0_0.RT_905,
}
r0_0.RT_907 = {
  [1] = r0_0.RT_779,
  [2] = r0_0.RT_681,
  [3] = r0_0.RT_253,
}
r0_0.RT_908 = {
  [1] = r0_0.RT_684,
  [2] = r0_0.RT_753,
  [3] = r0_0.RT_253,
}
r0_0.RT_909 = {
  "hit12"
}
r0_0.RT_910 = {
  CantLockTime = 6,
  Function = "CameraUnlock",
}
r0_0.RT_911 = {
  [1] = r0_0.RT_910,
}
r0_0.RT_912 = {
  CantLockTime = 1.5,
  Function = "CameraUnlock",
}
r0_0.RT_913 = {
  [1] = r0_0.RT_912,
}
r0_0.RT_914 = {
  [1] = r0_0.RT_779,
  [2] = r0_0.RT_844,
  [3] = r0_0.RT_754,
}
r0_0.RT_915 = {
  [1] = r0_0.RT_16,
  [2] = r0_0.RT_681,
  [3] = r0_0.RT_844,
}
r0_0.RT_916 = {
  [1] = r0_0.RT_779,
  [2] = r0_0.RT_681,
  [3] = r0_0.RT_844,
}
r0_0.RT_917 = {
  CreatureId = 850211,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_762,
  UseSaveLoc = "1",
}
r0_0.RT_918 = {
  CreatureId = 850211,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_762,
  UseSaveLoc = "2",
}
r0_0.RT_919 = {
  CreatureId = 850211,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_762,
  UseSaveLoc = "3",
}
r0_0.RT_920 = {
  CreatureId = 850211,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_762,
  UseSaveLoc = "4",
}
r0_0.RT_921 = {
  CreatureId = 850213,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_762,
  UseSaveLoc = "1",
}
r0_0.RT_922 = {
  CreatureId = 850213,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_762,
  UseSaveLoc = "2",
}
r0_0.RT_923 = {
  CreatureId = 850213,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_762,
  UseSaveLoc = "3",
}
r0_0.RT_924 = {
  CreatureId = 850213,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_762,
  UseSaveLoc = "4",
}
r0_0.RT_925 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 0.7,
}
r0_0.RT_926 = {
  CauseHit = "BossShijingzhe_Effect850301",
  Function = "CutToughness",
  Value = 100,
}
r0_0.RT_927 = {
  FXId = 850312,
  Function = "PlayFX",
}
r0_0.RT_928 = {
  Function = "PlaySE",
  SEId = 850322,
}
r0_0.RT_929 = {
  [1] = r0_0.RT_778,
  [2] = r0_0.RT_926,
  [3] = r0_0.RT_927,
  [4] = r0_0.RT_928,
}
r0_0.RT_930 = {
  CauseHit = "BossShijingzhe_Effect850302",
  Function = "CutToughness",
  Value = 100,
}
r0_0.RT_931 = {
  [1] = r0_0.RT_778,
  [2] = r0_0.RT_930,
  [3] = r0_0.RT_927,
  [4] = r0_0.RT_928,
}
r0_0.RT_932 = {
  CreatureId = 850305,
  Function = "CreateSkillCreature",
}
r0_0.RT_933 = {
  [1] = r0_0.RT_932,
}
r0_0.RT_934 = {
  CauseHit = "BossShijingzhe_Effect850304",
  Function = "CutToughness",
  Value = 100,
}
r0_0.RT_935 = {
  Function = "PlaySE",
  SEId = 850320,
}
r0_0.RT_936 = {
  [1] = r0_0.RT_16,
  [2] = r0_0.RT_934,
  [3] = r0_0.RT_927,
  [4] = r0_0.RT_935,
}
r0_0.RT_937 = {
  CreatureId = 850301,
  Function = "CreateSkillCreature",
}
r0_0.RT_938 = {
  [1] = r0_0.RT_937,
}
r0_0.RT_939 = {
  CreatureId = 850301,
  Function = "RemoveSkillCreature",
}
r0_0.RT_940 = {
  [1] = r0_0.RT_939,
}
r0_0.RT_941 = {
  BoneName = "head",
  DanmakuTemplateId = 850303,
  Duration = 7,
  Function = "CreateDanmaku",
}
r0_0.RT_942 = {
  [1] = r0_0.RT_941,
}
r0_0.RT_943 = {
  CauseHit = "BossShijingzhe_Effect850316",
  Function = "CutToughness",
  Value = 100,
}
r0_0.RT_944 = {
  CauseHit = "BossShijingzhe_Effect850320",
  Function = "CutToughness",
  Value = 100,
}
r0_0.RT_945 = {
  [1] = r0_0.RT_14,
  [2] = r0_0.RT_944,
  [3] = r0_0.RT_927,
  [4] = r0_0.RT_928,
}
r0_0.RT_946 = {
  CreatureId = 850305,
  Function = "RemoveSkillCreature",
}
r0_0.RT_947 = {
  [1] = r0_0.RT_946,
}
r0_0.RT_948 = {
  -350,
  300,
  0
}
r0_0.RT_949 = {
  50,
  0,
  0
}
r0_0.RT_950 = {
  "hit98",
  "hit99"
}
r0_0.RT_951 = {
  BaseAttr = "ATK",
  Function = "Damage",
  JumpWordHide = true,
  Rate = 999,
}
r0_0.RT_952 = {
  [1] = r0_0.RT_951,
}
r0_0.RT_953 = {
  Function = "PlaySE",
  SEId = 850321,
}
r0_0.RT_954 = {
  Radius = 1500,
}
r0_0.RT_955 = {
  Function = "EffectFunction",
  FunctionName = "RandomAreaLocation_Shijingzhe",
  Vars = r0_0.RT_954,
}
r0_0.RT_956 = {
  CreatureId = 850312,
  Function = "CreateSkillCreature",
  UseSaveLoc = "1",
}
r0_0.RT_957 = {
  CreatureId = 850319,
  Function = "CreateSkillCreature",
  UseSaveLoc = "4",
}
r0_0.RT_958 = {
  CreatureId = 850320,
  Function = "CreateSkillCreature",
  UseSaveLoc = "5",
}
r0_0.RT_959 = {
  CreatureId = 850318,
  Function = "CreateSkillCreature",
  UseSaveLoc = "3",
}
r0_0.RT_960 = {
  CreatureId = 850321,
  Function = "CreateSkillCreature",
  UseSaveLoc = "6",
}
r0_0.RT_961 = {
  CreatureId = 850322,
  Function = "CreateSkillCreature",
  UseSaveLoc = "7",
}
r0_0.RT_962 = {
  [1] = r0_0.RT_955,
  [2] = r0_0.RT_959,
  [3] = r0_0.RT_960,
  [4] = r0_0.RT_961,
}
r0_0.RT_963 = {
  CreatureId = 850323,
  Function = "CreateSkillCreature",
  UseSaveLoc = "8",
}
r0_0.RT_964 = {
  CreatureId = 850303,
  Function = "CreateSkillCreature",
  UseSaveLoc = "1",
}
r0_0.RT_965 = {
  CreatureId = 850313,
  Function = "CreateSkillCreature",
  UseSaveLoc = "2",
}
r0_0.RT_966 = {
  CreatureId = 850314,
  Function = "CreateSkillCreature",
  UseSaveLoc = "3",
}
r0_0.RT_967 = {
  CreatureId = 850315,
  Function = "CreateSkillCreature",
  UseSaveLoc = "4",
}
r0_0.RT_968 = {
  CreatureId = 850317,
  Function = "CreateSkillCreature",
  UseSaveLoc = "2",
}
r0_0.RT_969 = {
  CreatureId = 850303,
  Function = "TriggerSkillCreatureTriggerEvent",
}
r0_0.RT_970 = {
  CreatureId = 850313,
  Function = "TriggerSkillCreatureTriggerEvent",
}
r0_0.RT_971 = {
  CreatureId = 850314,
  Function = "TriggerSkillCreatureTriggerEvent",
}
r0_0.RT_972 = {
  CreatureId = 850315,
  Function = "TriggerSkillCreatureTriggerEvent",
}
r0_0.RT_973 = {
  [1] = r0_0.RT_969,
  [2] = r0_0.RT_970,
  [3] = r0_0.RT_971,
  [4] = r0_0.RT_972,
}
r0_0.RT_974 = {
  BoneName = "head",
  DanmakuTemplateId = 850301,
  Duration = 3.5,
  Function = "CreateDanmaku",
}
r0_0.RT_975 = {
  [1] = r0_0.RT_974,
}
r0_0.RT_976 = {
  FXId = 850320,
  Function = "PlayFX",
}
r0_0.RT_977 = {
  [1] = r0_0.RT_22,
  [2] = r0_0.RT_944,
  [3] = r0_0.RT_927,
  [4] = r0_0.RT_928,
}
r0_0.RT_978 = {
  -50,
  0,
  0
}
r0_0.RT_979 = {
  -350,
  -200,
  0
}
r0_0.RT_980 = {
  -50,
  -50,
  0
}
r0_0.RT_981 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 0.6,
}
r0_0.RT_982 = {
  350,
  -200,
  0
}
r0_0.RT_983 = {
  0,
  0,
  -150
}
r0_0.RT_984 = {
  CauseHit = "BossShijingzhe_Effect850322",
  Function = "CutToughness",
  Value = 100,
}
r0_0.RT_985 = {
  FXId = 600000,
  Function = "PlayFX",
  Overlap = true,
}
r0_0.RT_986 = {
  BuffId = 207,
  Function = "AddBuff",
  LastTime = 5,
}
r0_0.RT_987 = {
  EventName = "OnBeforeGrabHit",
  Function = "TriggerBattleEvent",
}
r0_0.RT_988 = {
  [1] = r0_0.RT_986,
  [2] = r0_0.RT_987,
}
r0_0.RT_989 = {
  [1] = r0_0.RT_16,
}
r0_0.RT_990 = {
  [1] = r0_0.RT_774,
  [2] = r0_0.RT_930,
  [3] = r0_0.RT_927,
  [4] = r0_0.RT_935,
}
r0_0.RT_991 = {
  CantLockTime = -1,
  Function = "CameraUnlock",
}
r0_0.RT_992 = {
  0,
  0,
  600
}
r0_0.RT_993 = {
  90,
  0,
  0
}
r0_0.RT_994 = {
  CreatureId = 850324,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_992,
  Rotation = r0_0.RT_993,
}
r0_0.RT_995 = {
  CreatureId = 850306,
  Function = "RemoveSkillCreature",
}
r0_0.RT_996 = {
  [1] = r0_0.RT_774,
  [2] = r0_0.RT_930,
  [3] = r0_0.RT_927,
  [4] = r0_0.RT_928,
}
r0_0.RT_997 = {
  DEF = 2,
  MaxHp = 0.1,
}
r0_0.RT_998 = {
  DEF = 2,
  MaxHp = 0.18,
}
r0_0.RT_999 = {
  -100,
  -100,
  0
}
r0_0.RT_1000 = {
  100,
  100,
  0
}
r0_0.RT_1001 = {
  ATK = 1,
  DEF = 1,
  ES = 1,
  Hp = 1,
  MaxES = 1,
  MaxHp = 0.1,
}
r0_0.RT_1002 = {
  AttrRates = r0_0.RT_1001,
  FormationId = 850401,
  Function = "CreateUnit",
  LifeTime = 9999,
  MaxSummonCount = 10,
  SingleSummonCount = 1,
  UnitId = 8504003,
  UnitType = "Monster",
}
r0_0.RT_1003 = {
  AttrRates = r0_0.RT_1001,
  AutoAttach = 1,
  Function = "CreateUnit",
  LifeTime = 9999,
  UnitId = 850402,
  UnitType = "MechanismSummon",
}
r0_0.RT_1004 = {
  BuffId = 6000205,
  Function = "AddBuff",
  LastTime = 9999,
}
r0_0.RT_1005 = {
  BuffId = 850406,
  Function = "AddBuff",
  LastTime = 10,
}
r0_0.RT_1006 = {
  Function = "PlaySE",
  SEId = 850409,
}
r0_0.RT_1007 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 1.3,
}
r0_0.RT_1008 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 6,
}
r0_0.RT_1009 = {
  CauseHit = "LightHit_40",
  Function = "CutToughness",
  Value = 100,
}
r0_0.RT_1010 = {
  Function = "PlaySE",
  SEId = 850402,
}
r0_0.RT_1011 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 8,
}
r0_0.RT_1012 = {
  BuffId = 850403,
  Function = "AddBuff",
  LastTime = 100000,
}
r0_0.RT_1013 = {
  [1] = r0_0.RT_1012,
}
r0_0.RT_1014 = {
  [1] = r0_0.RT_502,
  [2] = r0_0.RT_1010,
}
r0_0.RT_1015 = {
  CantLockTime = 20,
  Function = "CameraUnlock",
}
r0_0.RT_1016 = {
  -400,
  300,
  200
}
r0_0.RT_1017 = {
  0,
  300,
  200
}
r0_0.RT_1018 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 0.15,
}
r0_0.RT_1019 = {
  Function = "PlaySE",
  MeleeHitLevel = "Normal",
  SEId = 503,
}
r0_0.RT_1020 = {
  [1] = r0_0.RT_3,
  [2] = r0_0.RT_682,
  [3] = r0_0.RT_1019,
}
r0_0.RT_1021 = {
  [1] = r0_0.RT_3,
  [2] = r0_0.RT_754,
  [3] = r0_0.RT_1019,
}
r0_0.RT_1022 = {
  [1] = r0_0.RT_22,
  [2] = r0_0.RT_754,
  [3] = r0_0.RT_1019,
}
r0_0.RT_1023 = {
  "hit2",
  "hit3"
}
r0_0.RT_1024 = {
  [1] = r0_0.RT_33,
  [2] = r0_0.RT_700,
  [3] = r0_0.RT_1019,
}
r0_0.RT_1025 = {
  [1] = r0_0.RT_33,
  [2] = r0_0.RT_682,
  [3] = r0_0.RT_1019,
}
r0_0.RT_1026 = {
  [1] = r0_0.RT_22,
  [2] = r0_0.RT_35,
  [3] = r0_0.RT_1019,
}
r0_0.RT_1027 = {
  Function = "PlaySE",
  SEId = 850510,
}
r0_0.RT_1028 = {
  [1] = r0_0.RT_7,
  [2] = r0_0.RT_550,
  [3] = r0_0.RT_1027,
}
r0_0.RT_1029 = {
  BuffId = 850503,
  Function = "AddBuff",
  LastTime = -1,
}
r0_0.RT_1030 = {
  [1] = r0_0.RT_16,
  [2] = r0_0.RT_1029,
  [3] = r0_0.RT_1027,
  [4] = r0_0.RT_700,
}
r0_0.RT_1031 = {
  CantLockTime = 1,
  Function = "CameraUnlock",
}
r0_0.RT_1032 = {
  [1] = r0_0.RT_1031,
}
r0_0.RT_1033 = {
  0,
  0,
  -270
}
r0_0.RT_1034 = {
  FormationId = 850501,
  Function = "BossSPSaveLocs",
  Location = r0_0.RT_1033,
  SetSaveLocs = "First",
}
r0_0.RT_1035 = {
  [1] = r0_0.RT_774,
  [2] = r0_0.RT_754,
  [3] = r0_0.RT_1027,
}
r0_0.RT_1036 = {
  500,
  0,
  500
}
r0_0.RT_1037 = {
  CreatureId = 850503,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_1036,
}
r0_0.RT_1038 = {
  [1] = r0_0.RT_1037,
}
r0_0.RT_1039 = {
  CreatureId = 850503,
  Function = "RemoveSkillCreature",
}
r0_0.RT_1040 = {
  [1] = r0_0.RT_1039,
}
r0_0.RT_1041 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 1.1,
}
r0_0.RT_1042 = {
  CauseHit = "HitFly_XY0Z300",
  Function = "CutToughness",
  Value = 100,
}
r0_0.RT_1043 = {
  [1] = r0_0.RT_1041,
  [2] = r0_0.RT_1042,
  [3] = r0_0.RT_1019,
}
r0_0.RT_1044 = {
  [1] = r0_0.RT_16,
  [2] = r0_0.RT_741,
  [3] = r0_0.RT_1027,
}
r0_0.RT_1045 = {
  FormationId = 850502,
  Function = "BossSPSaveLocs",
  Location = r0_0.RT_1033,
  SetSaveLocs = "Fire",
}
r0_0.RT_1046 = {
  CreatureId = 850515,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_1033,
  UseRelativeOffset = true,
  UseSaveLoc = "Fire1",
}
r0_0.RT_1047 = {
  CreatureId = 850515,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_1033,
  UseRelativeOffset = true,
  UseSaveLoc = "Fire2",
}
r0_0.RT_1048 = {
  CreatureId = 850515,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_1033,
  UseRelativeOffset = true,
  UseSaveLoc = "Fire3",
}
r0_0.RT_1049 = {
  CreatureId = 850515,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_1033,
  UseRelativeOffset = true,
  UseSaveLoc = "Fire4",
}
r0_0.RT_1050 = {
  [1] = r0_0.RT_1045,
  [2] = r0_0.RT_1046,
  [3] = r0_0.RT_1047,
  [4] = r0_0.RT_1048,
  [5] = r0_0.RT_1049,
}
r0_0.RT_1051 = {
  [1] = r0_0.RT_16,
  [2] = r0_0.RT_754,
  [3] = r0_0.RT_1027,
}
r0_0.RT_1052 = {
  CauseHit = "BossLianhuo_Effect850507",
  Function = "GrabHit",
}
r0_0.RT_1053 = {
  [1] = r0_0.RT_1052,
  [2] = r0_0.RT_496,
}
r0_0.RT_1054 = {
  "hit2",
  "hit4",
  "hit6",
  "hit8",
  "hit10",
  "hit12"
}
r0_0.RT_1055 = {
  CreatureId = 850504,
  Function = "CreateSkillCreature",
}
r0_0.RT_1056 = {
  [1] = r0_0.RT_1055,
}
r0_0.RT_1057 = {
  Function = "PlaySE",
  MeleeHitLevel = "Heavy",
  SEId = 503,
}
r0_0.RT_1058 = {
  [1] = r0_0.RT_1041,
  [2] = r0_0.RT_754,
  [3] = r0_0.RT_1057,
}
r0_0.RT_1059 = {
  "hit3",
  "hit5",
  "hit7",
  "hit9",
  "hit11",
  "hit13"
}
r0_0.RT_1060 = {
  CreatureId = 850504,
  Function = "RemoveSkillCreature",
}
r0_0.RT_1061 = {
  [1] = r0_0.RT_1060,
}
r0_0.RT_1062 = {
  "hit14"
}
r0_0.RT_1063 = {
  CreatureId = 850505,
  Function = "CreateSkillCreature",
}
r0_0.RT_1064 = {
  [1] = r0_0.RT_1063,
}
r0_0.RT_1065 = {
  "hit16"
}
r0_0.RT_1066 = {
  "hit17"
}
r0_0.RT_1067 = {
  [1] = r0_0.RT_991,
}
r0_0.RT_1068 = {
  Function = "CameraRelock",
}
r0_0.RT_1069 = {
  "hit20",
  "hit24"
}
r0_0.RT_1070 = {
  Distance = 600,
  MaxNum = 3,
  Radius = 700,
}
r0_0.RT_1071 = {
  Function = "EffectFunction",
  FunctionName = "RandomAreaLocation",
  Vars = r0_0.RT_1070,
}
r0_0.RT_1072 = {
  [1] = r0_0.RT_1071,
}
r0_0.RT_1073 = {
  "hit21",
  "hit25"
}
r0_0.RT_1074 = {
  CreatureId = 850509,
  Function = "CreateSkillCreature",
  UseSaveLoc = "1",
}
r0_0.RT_1075 = {
  CreatureId = 850509,
  Function = "CreateSkillCreature",
  UseSaveLoc = "2",
}
r0_0.RT_1076 = {
  CreatureId = 850509,
  Function = "CreateSkillCreature",
  UseSaveLoc = "3",
}
r0_0.RT_1077 = {
  [1] = r0_0.RT_1074,
  [2] = r0_0.RT_1075,
  [3] = r0_0.RT_1076,
}
r0_0.RT_1078 = {
  "hit19",
  "hit23"
}
r0_0.RT_1079 = {
  CreatureId = 850509,
  Function = "CreateSkillCreature",
  UseSaveLoc = "",
}
r0_0.RT_1080 = {
  [1] = r0_0.RT_1079,
}
r0_0.RT_1081 = {
  BuffId = 6000205,
  Function = "AddBuff",
  LastTime = -1,
}
r0_0.RT_1082 = {
  "hit26"
}
r0_0.RT_1083 = {
  BuffId = 6000205,
  Function = "RemoveBuff",
}
r0_0.RT_1084 = {
  [1] = r0_0.RT_981,
  [2] = r0_0.RT_1019,
}
r0_0.RT_1085 = {
  [1] = r0_0.RT_7,
  [2] = r0_0.RT_754,
  [3] = r0_0.RT_1019,
}
r0_0.RT_1086 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 1.4,
}
r0_0.RT_1087 = {
  [1] = r0_0.RT_1086,
  [2] = r0_0.RT_682,
  [3] = r0_0.RT_1019,
}
r0_0.RT_1088 = {
  "hit24"
}
r0_0.RT_1089 = {
  CreatureId = 850510,
  Function = "CreateSkillCreature",
}
r0_0.RT_1090 = {
  [1] = r0_0.RT_1089,
}
r0_0.RT_1091 = {
  CauseHit = "LightHit_200",
  Function = "CutToughness",
  Value = 10,
}
r0_0.RT_1092 = {
  BuffId = 6000209,
  Function = "AddBuff",
  LastTime = -1,
}
r0_0.RT_1093 = {
  BuffId = 6000209,
  Function = "RemoveBuff",
}
r0_0.RT_1094 = {
  BaseAttr = "ATK",
  DamageTag = r0_0.RT_829,
  Function = "Damage",
  Rate = 0.4,
}
r0_0.RT_1095 = {
  Function = "PlaySE",
  SEId = 850601,
}
r0_0.RT_1096 = {
  BaseAttr = "ATK",
  DamageTag = r0_0.RT_829,
  Function = "Damage",
  Rate = 1.5,
}
r0_0.RT_1097 = {
  CauseHit = "HitFly_XY600Z300",
  Function = "CutToughness",
  Value = 100,
}
r0_0.RT_1098 = {
  [1] = r0_0.RT_1096,
  [2] = r0_0.RT_1095,
  [3] = r0_0.RT_72,
  [4] = r0_0.RT_38,
  [5] = r0_0.RT_1097,
}
r0_0.RT_1099 = {
  "hit3",
  "hit4"
}
r0_0.RT_1100 = {
  CauseHit = "LightHit_200",
  Function = "CutToughness",
}
r0_0.RT_1101 = {
  Function = "PlaySE",
  SEId = 850916,
}
r0_0.RT_1102 = {
  [1] = r0_0.RT_16,
  [2] = r0_0.RT_17,
  [3] = r0_0.RT_1101,
}
r0_0.RT_1103 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 1.9,
}
r0_0.RT_1104 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 0.9,
}
r0_0.RT_1105 = {
  [1] = r0_0.RT_1104,
  [2] = r0_0.RT_17,
  [3] = r0_0.RT_1101,
}
r0_0.RT_1106 = {
  FXId = 850923,
  Function = "PlayFX",
  NormalToHit = true,
  Overlap = true,
}
r0_0.RT_1107 = {
  [1] = r0_0.RT_1106,
}
r0_0.RT_1108 = {
  Falloff = 0.1,
  Function = "CameraShake",
  IsSceneCameraShake = true,
  OuterRadius = 2000,
  ShakeClass = "BP_Camera_BossTuosi_Burst",
}
r0_0.RT_1109 = {
  Function = "PlaySE",
  SEId = 850919,
}
r0_0.RT_1110 = {
  CauseHit = "HitFly_XY2000Z1000",
  Function = "CutToughness",
}
r0_0.RT_1111 = {
  Function = "PlaySE",
  SEId = 850920,
}
r0_0.RT_1112 = {
  CantLockTime = 13,
  Function = "CameraUnlock",
}
r0_0.RT_1113 = {
  FXId = 850903,
  Function = "PlayFX",
}
r0_0.RT_1114 = {
  Function = "PlaySE",
  SEId = 851003,
}
r0_0.RT_1115 = {
  BuffId = 851001,
  Function = "AddBuff",
  LastTime = 5,
}
r0_0.RT_1116 = {
  Function = "PlaySE",
  SEId = 851004,
}
r0_0.RT_1117 = {
  [1] = r0_0.RT_1115,
}
r0_0.RT_1118 = {
  ATK = 1,
  DEF = 0,
  MaxHp = 0.06,
}
r0_0.RT_1119 = {
  Function = "PlaySE",
  SEId = 851009,
}
r0_0.RT_1120 = {
  Function = "PlaySE",
  SEId = 851010,
}
r0_0.RT_1121 = {
  [1] = r0_0.RT_16,
  [2] = r0_0.RT_10,
  [3] = r0_0.RT_1119,
  [4] = r0_0.RT_1120,
}
r0_0.RT_1122 = {
  Function = "PlaySE",
  SEId = 851012,
}
r0_0.RT_1123 = {
  CantLockTime = 18,
  Function = "CameraUnlock",
}
r0_0.RT_1124 = {
  Function = "PlaySE",
  SEId = 851016,
}
r0_0.RT_1125 = {
  DanmakuTemplateId = 851004,
  Duration = 20,
  Function = "CreateDanmaku",
}
r0_0.RT_1126 = {
  [1] = r0_0.RT_1125,
}
r0_0.RT_1127 = {
  CauseHit = "LightHit_100",
  Function = "CutToughness",
}
r0_0.RT_1128 = {
  [1] = r0_0.RT_16,
  [2] = r0_0.RT_10,
  [3] = r0_0.RT_1120,
}
r0_0.RT_1129 = {
  CreatureId = 851013,
  Function = "CreateSkillCreature",
  SetSavelocAsTarget = "19",
  UseSaveLoc = "25",
}
r0_0.RT_1130 = {
  [1] = r0_0.RT_1129,
}
r0_0.RT_1131 = {
  CreatureId = 851013,
  Function = "CreateSkillCreature",
  SetSavelocAsTarget = "20",
  UseSaveLoc = "25",
}
r0_0.RT_1132 = {
  [1] = r0_0.RT_1131,
}
r0_0.RT_1133 = {
  CreatureId = 851013,
  Function = "CreateSkillCreature",
  SetSavelocAsTarget = "21",
  UseSaveLoc = "25",
}
r0_0.RT_1134 = {
  [1] = r0_0.RT_1133,
}
r0_0.RT_1135 = {
  "hit9"
}
r0_0.RT_1136 = {
  CreatureId = 851013,
  Function = "CreateSkillCreature",
  SetSavelocAsTarget = "22",
  UseSaveLoc = "25",
}
r0_0.RT_1137 = {
  [1] = r0_0.RT_1136,
}
r0_0.RT_1138 = {
  BuffId = 851101,
  Function = "AddBuff",
  LastTime = 10,
}
r0_0.RT_1139 = {
  [1] = r0_0.RT_16,
  [2] = r0_0.RT_1100,
  [3] = r0_0.RT_1138,
}
r0_0.RT_1140 = {
  [1] = r0_0.RT_1138,
}
r0_0.RT_1141 = {
  ATK = 1,
  DEF = 0,
  MaxHp = 0.02,
}
r0_0.RT_1142 = {
  Function = "PlaySE",
  SEId = 851202,
}
r0_0.RT_1143 = {
  CauseHit = "BossLinen_Skill06",
  Function = "CutToughness",
  Value = 100,
}
r0_0.RT_1144 = {
  CreatureId = 851208,
  Function = "CreateSkillCreature",
}
r0_0.RT_1145 = {
  [1] = r0_0.RT_1144,
  [2] = r0_0.RT_1144,
  [3] = r0_0.RT_1144,
  [4] = r0_0.RT_1144,
  [5] = r0_0.RT_1144,
  [6] = r0_0.RT_1144,
}
r0_0.RT_1146 = {
  FXId = 851212,
  Function = "PlayFX",
}
r0_0.RT_1147 = {
  Function = "PlaySE",
  SEId = 851201,
}
r0_0.RT_1148 = {
  CreatureId = 851203,
  Delay = 0.167,
  Function = "CreateSkillCreature",
}
r0_0.RT_1149 = {
  CauseHit = "LightHit",
  Function = "CutToughness",
  Value = 30,
}
r0_0.RT_1150 = {
  FXId = 851205,
  Function = "PlayFX",
}
r0_0.RT_1151 = {
  FXId = 851204,
  Function = "PlayFX",
  NormalToHit = true,
  Overlap = true,
}
r0_0.RT_1152 = {
  ATK = 1,
  DEF = 1,
  MaxHp = 0.007,
}
r0_0.RT_1153 = {
  [1] = r0_0.RT_16,
  [2] = r0_0.RT_1143,
  [3] = r0_0.RT_1147,
}
r0_0.RT_1154 = {
  CauseHit = "BossLinen_Skill07",
  Function = "CutToughness",
  Value = 50,
}
r0_0.RT_1155 = {
  BuffId = 851201,
  Function = "AddBuff",
  LastTime = -1,
}
r0_0.RT_1156 = {
  Function = "AddTnToMax",
}
r0_0.RT_1157 = {
  [1] = r0_0.RT_1155,
  [2] = r0_0.RT_1156,
}
r0_0.RT_1158 = {
  ATK = 1,
  DEF = 1,
  MaxHp = 0.01,
}
r0_0.RT_1159 = {
  ATK = 1,
  DEF = 1,
  MaxHp = 0.02,
}
r0_0.RT_1160 = {
  [1] = r0_0.RT_7,
  [2] = r0_0.RT_1143,
  [3] = r0_0.RT_1147,
}
r0_0.RT_1161 = {
  BaseAttr = "ATK",
  DamageTag = r0_0.RT_343,
  Function = "Damage",
  Rate = 0.6,
}
r0_0.RT_1162 = {
  CreatureId = 8512908,
  Function = "CreateSkillCreature",
}
r0_0.RT_1163 = {
  [1] = r0_0.RT_1162,
  [2] = r0_0.RT_1162,
  [3] = r0_0.RT_1162,
  [4] = r0_0.RT_1162,
  [5] = r0_0.RT_1162,
  [6] = r0_0.RT_1162,
}
r0_0.RT_1164 = {
  CreatureId = 8512903,
  Delay = 0.167,
  Function = "CreateSkillCreature",
}
r0_0.RT_1165 = {
  BaseAttr = "MaxHp",
  BaseChar = "Target",
  DamageType = "TrueDamage",
  Function = "Damage",
  Rate = 0.1,
}
r0_0.RT_1166 = {
  [1] = r0_0.RT_1165,
}
r0_0.RT_1167 = {
  Function = "PlaySE",
  SEId = 851301,
}
r0_0.RT_1168 = {
  -8.89,
  153.32,
  50
}
r0_0.RT_1169 = {
  CreatureId = 851302,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_1168,
}
r0_0.RT_1170 = {
  [1] = r0_0.RT_1169,
}
r0_0.RT_1171 = {
  FXId = 851303,
  Function = "PlayFX",
  Overlap = true,
}
r0_0.RT_1172 = {
  FXId = 851303,
  Function = "PlayFX",
  NormalToHit = true,
  Overlap = true,
}
r0_0.RT_1173 = {
  [1] = r0_0.RT_1172,
}
r0_0.RT_1174 = {
  CreatureId = 851304,
  Function = "CreateSkillCreature",
  SetSavelocAsTarget = "End1",
  UseSaveLoc = "StartCenter",
}
r0_0.RT_1175 = {
  CreatureId = 851304,
  Function = "CreateSkillCreature",
  SetSavelocAsTarget = "End2",
  UseSaveLoc = "StartCenter",
}
r0_0.RT_1176 = {
  CreatureId = 851304,
  Function = "CreateSkillCreature",
  SetSavelocAsTarget = "End3",
  UseSaveLoc = "StartCenter",
}
r0_0.RT_1177 = {
  CreatureId = 851304,
  Function = "CreateSkillCreature",
  SetSavelocAsTarget = "End4",
  UseSaveLoc = "StartCenter",
}
r0_0.RT_1178 = {
  CreatureId = 851304,
  Function = "CreateSkillCreature",
  SetSavelocAsTarget = "End5",
  UseSaveLoc = "StartCenter",
}
r0_0.RT_1179 = {
  CreatureId = 851304,
  Function = "CreateSkillCreature",
  SetSavelocAsTarget = "End6",
  UseSaveLoc = "StartCenter",
}
r0_0.RT_1180 = {
  BaseChar = "Self",
  Function = "PlaySE",
  SEId = 851307,
}
r0_0.RT_1181 = {
  Function = "PlaySE",
  SEId = 851309,
}
r0_0.RT_1182 = {
  FXId = 851311,
  Function = "PlayFX",
}
r0_0.RT_1183 = {
  [1] = r0_0.RT_1182,
}
r0_0.RT_1184 = {
  Function = "EffectFunction",
  FunctionName = "Mon_BossShenpan_Skill03BulletLoc",
}
r0_0.RT_1185 = {
  CreatureId = 851402,
  Function = "CreateSkillCreature",
  SetSavelocAsTarget = "Skill03Right01",
}
r0_0.RT_1186 = {
  CreatureId = 851411,
  Delay = 0.3,
  Function = "CreateSkillCreature",
  SetSavelocAsTarget = "Skill03Right02",
}
r0_0.RT_1187 = {
  CreatureId = 851403,
  Delay = 0.1,
  Function = "CreateSkillCreature",
  SetSavelocAsTarget = "Skill03Left01",
}
r0_0.RT_1188 = {
  CreatureId = 851412,
  Delay = 0.2,
  Function = "CreateSkillCreature",
  SetSavelocAsTarget = "Skill03Left02",
}
r0_0.RT_1189 = {
  [1] = r0_0.RT_1184,
  [2] = r0_0.RT_1185,
  [3] = r0_0.RT_1186,
  [4] = r0_0.RT_1187,
  [5] = r0_0.RT_1188,
}
r0_0.RT_1190 = {
  CauseHit = "LightHit_400",
  Function = "CutToughness",
}
r0_0.RT_1191 = {
  Function = "PlaySE",
  SEId = 851408,
}
r0_0.RT_1192 = {
  Function = "PlaySE",
  SEId = 851519,
}
r0_0.RT_1193 = {
  [1] = r0_0.RT_3,
  [2] = r0_0.RT_10,
  [3] = r0_0.RT_661,
  [4] = r0_0.RT_1192,
}
r0_0.RT_1194 = {
  Function = "PlaySE",
  SEId = 851507,
}
r0_0.RT_1195 = {
  0,
  175,
  455
}
r0_0.RT_1196 = {
  FXId = 851504,
  Function = "PlayFX",
}
r0_0.RT_1197 = {
  Function = "EffectFunction",
  FunctionName = "Mon_BossJushi_Skill08Bullet",
}
r0_0.RT_1198 = {
  BoneName = "ShoulderLaserR2",
  DanmakuTemplateId = 851506,
  Duration = 2,
  Function = "CreateDanmaku",
}
r0_0.RT_1199 = {
  BoneName = "ShoulderLaserL2",
  DanmakuTemplateId = 851506,
  Duration = 2,
  Function = "CreateDanmaku",
}
r0_0.RT_1200 = {
  FXId = 851510,
  Function = "PlayFX",
  Overlap = true,
}
r0_0.RT_1201 = {
  [1] = r0_0.RT_3,
  [2] = r0_0.RT_10,
  [3] = r0_0.RT_661,
}
r0_0.RT_1202 = {
  [1] = r0_0.RT_753,
  [2] = r0_0.RT_3,
  [3] = r0_0.RT_661,
}
r0_0.RT_1203 = {
  [1] = r0_0.RT_827,
  [2] = r0_0.RT_10,
  [3] = r0_0.RT_661,
}
r0_0.RT_1204 = {
  Function = "PlaySE",
  SEId = 851701,
}
r0_0.RT_1205 = {
  [1] = r0_0.RT_3,
  [2] = r0_0.RT_1127,
  [3] = r0_0.RT_1204,
}
r0_0.RT_1206 = {
  Function = "PlaySE",
  SEId = 851702,
}
r0_0.RT_1207 = {
  [1] = r0_0.RT_779,
  [2] = r0_0.RT_1100,
  [3] = r0_0.RT_1204,
}
r0_0.RT_1208 = {
  [1] = r0_0.RT_779,
  [2] = r0_0.RT_753,
  [3] = r0_0.RT_1206,
}
r0_0.RT_1209 = {
  [1] = r0_0.RT_3,
  [2] = r0_0.RT_753,
}
r0_0.RT_1210 = {
  CreatureId = 851805,
  Function = "CreateSkillCreature",
  UseSaveLoc = "1",
}
r0_0.RT_1211 = {
  CreatureId = 851805,
  Function = "CreateSkillCreature",
  UseSaveLoc = "2",
}
r0_0.RT_1212 = {
  CreatureId = 851805,
  Function = "CreateSkillCreature",
  UseSaveLoc = "5",
}
r0_0.RT_1213 = {
  CreatureId = 851805,
  Function = "CreateSkillCreature",
  UseSaveLoc = "6",
}
r0_0.RT_1214 = {
  CreatureId = 851805,
  Function = "CreateSkillCreature",
  UseSaveLoc = "3",
}
r0_0.RT_1215 = {
  CreatureId = 851805,
  Function = "CreateSkillCreature",
  UseSaveLoc = "4",
}
r0_0.RT_1216 = {
  CreatureId = 851805,
  Function = "CreateSkillCreature",
  UseSaveLoc = "7",
}
r0_0.RT_1217 = {
  CreatureId = 851805,
  Function = "CreateSkillCreature",
  UseSaveLoc = "8",
}
r0_0.RT_1218 = {
  [1] = r0_0.RT_16,
  [2] = r0_0.RT_10,
}
r0_0.RT_1219 = {
  CreatureId = 851805,
  Function = "CreateSkillCreature",
  UseSaveLoc = "9",
}
r0_0.RT_1220 = {
  CreatureId = 851805,
  Function = "CreateSkillCreature",
  UseSaveLoc = "10",
}
r0_0.RT_1221 = {
  CreatureId = 851805,
  Function = "CreateSkillCreature",
  UseSaveLoc = "13",
}
r0_0.RT_1222 = {
  CreatureId = 851805,
  Function = "CreateSkillCreature",
  UseSaveLoc = "11",
}
r0_0.RT_1223 = {
  CreatureId = 851805,
  Function = "CreateSkillCreature",
  UseSaveLoc = "14",
}
r0_0.RT_1224 = {
  CreatureId = 851805,
  Function = "CreateSkillCreature",
  UseSaveLoc = "12",
}
r0_0.RT_1225 = {
  CreatureId = 851805,
  Function = "CreateSkillCreature",
  UseSaveLoc = "15",
}
r0_0.RT_1226 = {
  CreatureId = 851805,
  Function = "CreateSkillCreature",
  UseSaveLoc = "16",
}
r0_0.RT_1227 = {
  FXId = 851901,
  Function = "PlayFX",
  Overlap = true,
}
r0_0.RT_1228 = {
  [1] = r0_0.RT_3,
  [2] = r0_0.RT_10,
  [3] = r0_0.RT_1227,
}
r0_0.RT_1229 = {
  CauseHit = "HitFly_XY0Z300",
  Function = "CutToughness",
}
r0_0.RT_1230 = {
  FXId = 900406,
  Function = "PlayFX",
}
r0_0.RT_1231 = {
  CreatureId = 851903,
  Function = "CreateSkillCreature",
  UseSaveLoc = "LFront",
}
r0_0.RT_1232 = {
  FXId = 851902,
  Function = "PlayFX",
}
r0_0.RT_1233 = {
  [1] = r0_0.RT_22,
  [2] = r0_0.RT_10,
  [3] = r0_0.RT_1232,
}
r0_0.RT_1234 = {
  [1] = r0_0.RT_702,
}
r0_0.RT_1235 = {
  Function = "CreateUnit",
  MaxSummonCount = 2,
  SingleSummonCount = 1,
  UnitId = 8519005,
  UnitType = "Monster",
  UseSaveLoc = "Skill05L",
}
r0_0.RT_1236 = {
  Function = "CreateUnit",
  MaxSummonCount = 2,
  SingleSummonCount = 1,
  UnitId = 8519005,
  UnitType = "Monster",
  UseSaveLoc = "Skill05M",
}
r0_0.RT_1237 = {
  CreatureId = 851915,
  Function = "CreateSkillCreature",
  UseSaveLoc = "LFront",
}
r0_0.RT_1238 = {
  Function = "CreateUnit",
  MaxSummonCount = 2,
  SingleSummonCount = 1,
  UnitId = 8519005,
  UnitType = "Monster",
  UseSaveLoc = "Skill05R",
}
r0_0.RT_1239 = {
  CreatureId = 851919,
  Function = "CreateSkillCreature",
  UseSaveLoc = "RFront",
}
r0_0.RT_1240 = {
  CreatureId = 851920,
  Function = "CreateSkillCreature",
  UseSaveLoc = "RFront",
}
r0_0.RT_1241 = {
  Hp = 1,
  MaxHp = 0.03,
}
r0_0.RT_1242 = {
  AttrRates = r0_0.RT_1241,
  Function = "CreateUnit",
  MaxSummonCount = 3,
  SingleSummonCount = 1,
  UnitId = 8519009,
  UnitType = "Monster",
  UseSaveLoc = "8519302",
}
r0_0.RT_1243 = {
  AttrRates = r0_0.RT_1241,
  Function = "CreateUnit",
  MaxSummonCount = 9,
  SingleSummonCount = 1,
  UnitId = 8519010,
  UnitType = "Monster",
  UseSaveLoc = "8519310",
}
r0_0.RT_1244 = {
  AttrRates = r0_0.RT_1241,
  Function = "CreateUnit",
  MaxSummonCount = 3,
  SingleSummonCount = 1,
  UnitId = 8519009,
  UnitType = "Monster",
  UseSaveLoc = "8519304",
}
r0_0.RT_1245 = {
  AttrRates = r0_0.RT_1241,
  Function = "CreateUnit",
  MaxSummonCount = 9,
  SingleSummonCount = 1,
  UnitId = 8519010,
  UnitType = "Monster",
  UseSaveLoc = "8519301",
}
r0_0.RT_1246 = {
  AttrRates = r0_0.RT_1241,
  Function = "CreateUnit",
  MaxSummonCount = 9,
  SingleSummonCount = 1,
  UnitId = 8519010,
  UnitType = "Monster",
  UseSaveLoc = "8519303",
}
r0_0.RT_1247 = {
  AttrRates = r0_0.RT_1241,
  Function = "CreateUnit",
  MaxSummonCount = 9,
  SingleSummonCount = 1,
  UnitId = 8519010,
  UnitType = "Monster",
  UseSaveLoc = "8519305",
}
r0_0.RT_1248 = {
  AttrRates = r0_0.RT_1241,
  Function = "CreateUnit",
  MaxSummonCount = 9,
  SingleSummonCount = 1,
  UnitId = 8519010,
  UnitType = "Monster",
  UseSaveLoc = "8519307",
}
r0_0.RT_1249 = {
  AttrRates = r0_0.RT_1241,
  Function = "CreateUnit",
  MaxSummonCount = 9,
  SingleSummonCount = 1,
  UnitId = 8519010,
  UnitType = "Monster",
  UseSaveLoc = "8519308",
}
r0_0.RT_1250 = {
  AttrRates = r0_0.RT_1241,
  Function = "CreateUnit",
  MaxSummonCount = 9,
  SingleSummonCount = 1,
  UnitId = 8519010,
  UnitType = "Monster",
  UseSaveLoc = "8519309",
}
r0_0.RT_1251 = {
  AttrRates = r0_0.RT_1241,
  Function = "CreateUnit",
  MaxSummonCount = 9,
  SingleSummonCount = 1,
  UnitId = 8519010,
  UnitType = "Monster",
  UseSaveLoc = "8519302",
}
r0_0.RT_1252 = {
  AttrRates = r0_0.RT_1241,
  Function = "CreateUnit",
  MaxSummonCount = 9,
  SingleSummonCount = 1,
  UnitId = 8519010,
  UnitType = "Monster",
  UseSaveLoc = "8519304",
}
r0_0.RT_1253 = {
  AttrRates = r0_0.RT_1241,
  Function = "CreateUnit",
  MaxSummonCount = 9,
  SingleSummonCount = 1,
  UnitId = 8519010,
  UnitType = "Monster",
  UseSaveLoc = "8519306",
}
r0_0.RT_1254 = {
  [1] = r0_0.RT_16,
  [2] = r0_0.RT_10,
  [3] = r0_0.RT_805,
}
r0_0.RT_1255 = {
  CauseHit = "HitFly_XY0Z800",
  Function = "CutToughness",
}
r0_0.RT_1256 = {
  [1] = r0_0.RT_3,
  [2] = r0_0.RT_1255,
}
r0_0.RT_1257 = {
  CreatureId = 852008,
  Function = "CreateSkillCreature",
  UseBattlePointID = 85200502,
  UseBattlePointRotation = 1,
}
r0_0.RT_1258 = {
  CreatureId = 852008,
  Function = "CreateSkillCreature",
  UseBattlePointID = 85200520,
  UseBattlePointRotation = 1,
}
r0_0.RT_1259 = {
  CreatureId = 852008,
  Function = "CreateSkillCreature",
  UseBattlePointID = 85200503,
  UseBattlePointRotation = 1,
}
r0_0.RT_1260 = {
  CreatureId = 852008,
  Function = "CreateSkillCreature",
  UseBattlePointID = 85200504,
  UseBattlePointRotation = 1,
}
r0_0.RT_1261 = {
  CreatureId = 852008,
  Function = "CreateSkillCreature",
  UseBattlePointID = 85200505,
  UseBattlePointRotation = 1,
}
r0_0.RT_1262 = {
  CreatureId = 852008,
  Function = "CreateSkillCreature",
  UseBattlePointID = 85200506,
  UseBattlePointRotation = 1,
}
r0_0.RT_1263 = {
  CreatureId = 852008,
  Function = "CreateSkillCreature",
  UseBattlePointID = 85200508,
  UseBattlePointRotation = 1,
}
r0_0.RT_1264 = {
  CreatureId = 852008,
  Function = "CreateSkillCreature",
  UseBattlePointID = 85200509,
  UseBattlePointRotation = 1,
}
r0_0.RT_1265 = {
  CreatureId = 852008,
  Function = "CreateSkillCreature",
  UseBattlePointID = 85200510,
  UseBattlePointRotation = 1,
}
r0_0.RT_1266 = {
  CreatureId = 852008,
  Function = "CreateSkillCreature",
  UseBattlePointID = 85200507,
  UseBattlePointRotation = 1,
}
r0_0.RT_1267 = {
  [1] = r0_0.RT_3,
}
r0_0.RT_1268 = {
  BattlePointID = 85200801,
  Function = "SetSelfLoc",
  TargetCenterLoc = "BattlePoint",
  UseBattlePointRotation = 1,
}
r0_0.RT_1269 = {
  [1] = r0_0.RT_1268,
}
r0_0.RT_1270 = {
  Function = "CreateUnit",
  MaxSummonCount = 3,
  SingleSummonCount = 1,
  UnitId = 8520003,
  UnitType = "Monster",
  UseSaveLoc = "85200902",
}
r0_0.RT_1271 = {
  Function = "CreateUnit",
  MaxSummonCount = 3,
  SingleSummonCount = 1,
  UnitId = 8520003,
  UnitType = "Monster",
  UseSaveLoc = "85200903",
}
r0_0.RT_1272 = {
  Function = "CreateUnit",
  MaxSummonCount = 3,
  SingleSummonCount = 1,
  UnitId = 8520003,
  UnitType = "Monster",
  UseSaveLoc = "85200901",
}
r0_0.RT_1273 = {
  CreatureId = 852008,
  Function = "CreateSkillCreature",
  UseBattlePointID = 85200802,
  UseBattlePointRotation = 1,
}
r0_0.RT_1274 = {
  CreatureId = 852008,
  Function = "CreateSkillCreature",
  UseBattlePointID = 85200820,
  UseBattlePointRotation = 1,
}
r0_0.RT_1275 = {
  CreatureId = 852008,
  Function = "CreateSkillCreature",
  UseBattlePointID = 85200803,
  UseBattlePointRotation = 1,
}
r0_0.RT_1276 = {
  CreatureId = 852008,
  Function = "CreateSkillCreature",
  UseBattlePointID = 85200804,
  UseBattlePointRotation = 1,
}
r0_0.RT_1277 = {
  CreatureId = 852008,
  Function = "CreateSkillCreature",
  UseBattlePointID = 85200805,
  UseBattlePointRotation = 1,
}
r0_0.RT_1278 = {
  CreatureId = 852008,
  Function = "CreateSkillCreature",
  UseBattlePointID = 85200806,
  UseBattlePointRotation = 1,
}
r0_0.RT_1279 = {
  CreatureId = 852008,
  Function = "CreateSkillCreature",
  UseBattlePointID = 85200808,
  UseBattlePointRotation = 1,
}
r0_0.RT_1280 = {
  CreatureId = 852008,
  Function = "CreateSkillCreature",
  UseBattlePointID = 85200809,
  UseBattlePointRotation = 1,
}
r0_0.RT_1281 = {
  CreatureId = 852008,
  Function = "CreateSkillCreature",
  UseBattlePointID = 85200810,
  UseBattlePointRotation = 1,
}
r0_0.RT_1282 = {
  CreatureId = 852008,
  Function = "CreateSkillCreature",
  UseBattlePointID = 85200807,
  UseBattlePointRotation = 1,
}
r0_0.RT_1283 = {
  0,
  0,
  -130
}
r0_0.RT_1284 = {
  FXId = 900038,
  Function = "PlayFX",
}
r0_0.RT_1285 = {
  [1] = r0_0.RT_3,
  [2] = r0_0.RT_682,
  [3] = r0_0.RT_1284,
}
r0_0.RT_1286 = {
  [1] = r0_0.RT_3,
  [2] = r0_0.RT_682,
}
r0_0.RT_1287 = {
  0,
  0,
  -120
}
r0_0.RT_1288 = {
  CauseHit = "HitFly_XY300Z800",
  Function = "CutToughness",
}
r0_0.RT_1289 = {
  [1] = r0_0.RT_3,
  [2] = r0_0.RT_1288,
}
r0_0.RT_1290 = {
  [1] = r0_0.RT_7,
  [2] = r0_0.RT_4,
  [3] = r0_0.RT_1288,
}
r0_0.RT_1291 = {
  CauseHit = "HitFly_XY600Z1000",
  Function = "CutToughness",
  Value = 150,
}
r0_0.RT_1292 = {
  0,
  0,
  1900
}
r0_0.RT_1293 = {
  CreatureId = 900001,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_1292,
  UseSaveLoc = "",
}
r0_0.RT_1294 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 0.01,
}
r0_0.RT_1295 = {
  BaseAttr = "MaxHp",
  BaseChar = "Target",
  DamageType = "Default",
  Function = "Damage",
  Rate = 0.05,
}
r0_0.RT_1296 = {
  BuffId = 5000020,
  Function = "AddBuff",
  LastTime = 1.3,
}
r0_0.RT_1297 = {
  BaseAttr = "MaxHp",
  BaseChar = "Target",
  DamageType = "TrueDamage",
  Function = "Damage",
  Rate = 0.35,
}
r0_0.RT_1298 = {
  BaseChar = "Target",
  FXId = 900074,
  Function = "PlayFX",
  IsAttached = true,
}
r0_0.RT_1299 = {
  CauseHit = "LightHit",
  Function = "CutToughness",
  Value = 300,
}
r0_0.RT_1300 = {
  BaseAttr = "ATK",
  DamageType = "TrueDamage",
  Function = "Damage",
  Rate = 10,
}
r0_0.RT_1301 = {
  CauseHit = "HitFly_XY800Z1000",
  Function = "CutToughness",
  Value = 300,
}
r0_0.RT_1302 = {
  [1] = r0_0.RT_1294,
}
r0_0.RT_1303 = {
  Function = "PlaySE",
  SEId = 111,
}
r0_0.RT_1304 = {
  FXId = 900062,
  Function = "PlayFX",
  Overlap = true,
}
r0_0.RT_1305 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 0,
  Value = 1,
}
r0_0.RT_1306 = {
  CauseHit = "HitFly_XY600Z1000",
  Function = "CutToughness",
}
r0_0.RT_1307 = {
  [1] = r0_0.RT_1305,
  [2] = r0_0.RT_1306,
}
r0_0.RT_1308 = {
  CauseHit = "HitFly_XY600Z1000",
  Function = "CutToughness",
  Value = 500,
}
r0_0.RT_1309 = {
  BaseAttr = "ATK",
  Function = "Damage",
  Rate = 1.65,
}
r0_0.RT_1310 = {
  Function = "PlaySE",
  SEId = 900101,
}
r0_0.RT_1311 = {
  Function = "PlaySE",
  SEId = 900201,
}
r0_0.RT_1312 = {
  Function = "PlaySE",
  MeleeHitLevel = "light",
  SEId = 502,
}
r0_0.RT_1313 = {
  [1] = r0_0.RT_23,
  [2] = r0_0.RT_661,
  [3] = r0_0.RT_39,
  [4] = r0_0.RT_1312,
}
r0_0.RT_1314 = {
  Function = "PlaySE",
  MeleeHitLevel = "light",
  SEId = 504,
}
r0_0.RT_1315 = {
  CreatureId = 900701,
  Function = "CreateSkillCreature",
}
r0_0.RT_1316 = {
  [1] = r0_0.RT_1315,
}
r0_0.RT_1317 = {
  FXId = 900702,
  Function = "PlayFX",
  Overlap = true,
}
r0_0.RT_1318 = {
  Function = "PlaySE",
  SEId = 900701,
}
r0_0.RT_1319 = {
  [1] = r0_0.RT_3,
  [2] = r0_0.RT_1317,
  [3] = r0_0.RT_1318,
}
r0_0.RT_1320 = {
  FXId = 900702,
  Function = "PlayFX",
  NormalToHit = true,
  Overlap = true,
}
r0_0.RT_1321 = {
  [1] = r0_0.RT_1320,
}
r0_0.RT_1322 = {
  CreatureId = 950004,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_420,
}
r0_0.RT_1323 = {
  CreatureId = 950011,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_420,
}
r0_0.RT_1324 = {
  Function = "PlaySE",
  SEId = 950102,
}
r0_0.RT_1325 = {
  [1] = r0_0.RT_16,
  [2] = r0_0.RT_4,
  [3] = r0_0.RT_1324,
}
r0_0.RT_1326 = {
  CauseHit = "HitFly_XY200Z300",
  Function = "CutToughness",
  Value = 1,
}
r0_0.RT_1327 = {
  [1] = r0_0.RT_3,
  [2] = r0_0.RT_1326,
}
r0_0.RT_1328 = {
  CauseHit = "LightHit",
  Function = "CutToughness",
  Value = 1,
}
r0_0.RT_1329 = {
  Function = "PlaySE",
  SEId = 950701,
}
r0_0.RT_1330 = {
  [1] = r0_0.RT_3,
  [2] = r0_0.RT_4,
  [3] = r0_0.RT_1329,
}
r0_0.RT_1331 = {
  Function = "PlaySE",
  SEId = 980101,
}
r0_0.RT_1332 = {
  [1] = r0_0.RT_16,
  [2] = r0_0.RT_10,
  [3] = r0_0.RT_1331,
}
r0_0.RT_1333 = {
  Function = "PlaySE",
  SEId = 980201,
}
r0_0.RT_1334 = {
  [1] = r0_0.RT_660,
  [2] = r0_0.RT_1100,
  [3] = r0_0.RT_1333,
}
r0_0.RT_1335 = {
  [1] = r0_0.RT_660,
  [2] = r0_0.RT_1127,
  [3] = r0_0.RT_1333,
}
r0_0.RT_1336 = {
  Function = "PlaySE",
  SEId = 980301,
}
r0_0.RT_1337 = {
  BuffId = 980501,
  Function = "AddBuff",
  LastTime = -1,
}
r0_0.RT_1338 = {
  [1] = r0_0.RT_1337,
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [6709, 6709] id: 1
  return r1_1
end
local r3_0 = "SkillEffects"
local r4_0 = {}
local r5_0 = {
  TargetFilter = "Self",
}
r5_0.TaskEffects = {
  [1] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "HitWall",
    PassiveEffectId = 1,
  },
}
r5_0.TaskId = 4
r4_0[4] = r5_0
r5_0 = {
  TargetFilter = "Self",
}
r5_0.TaskEffects = {
  [1] = {
    CreatureId = 5,
    Function = "CreateSkillCreature",
  },
}
r5_0.TaskId = 5
r4_0[5] = r5_0
r5_0 = {
  TargetFilter = "Self",
}
r5_0.TaskEffects = {
  [1] = {
    CreatureId = 5,
    Function = "RemoveSkillCreature",
  },
}
r5_0.TaskId = 6
r4_0[6] = r5_0
r4_0[10] = {
  TaskId = 10,
}
r5_0 = {
  TargetFilter = "Self",
}
r5_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHp",
    DamageType = "Default",
    Function = "Heal",
    Rate = 0.05,
    Value = 15,
  },
  [2] = r0_0.RT_95,
}
r5_0.TaskId = 11
r4_0[11] = r5_0
r4_0[12] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_228,
  TaskId = 12,
}
r5_0 = {
  TargetFilter = "Target",
}
r5_0.TaskEffects = {
  [1] = {
    FXId = 20,
    Function = "PlayFX",
  },
}
r5_0.TaskId = 13
r4_0[13] = r5_0
r5_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r5_0.TaskEffects = {
  [1] = {
    BuffId = 301,
    Function = "AddBuff",
    LastTime = 6,
  },
  [2] = {
    BuffId = 305,
    Function = "AddBuff",
    LastTime = 4,
  },
}
r5_0.TaskId = 20
r4_0[20] = r5_0
r5_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle",
}
r5_0.TaskEffects = {
  [1] = {
    CauseHit = "HitFly_XY800Z400",
    ForceHit = true,
    Function = "CutToughness",
    Value = 70,
  },
}
r5_0.TaskId = 21
r4_0[21] = r5_0
r4_0[23] = {
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_369,
  },
  TaskId = 23,
}
r4_0[24] = {
  EffectExecuteTiming = "Leave",
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_128,
  TaskId = 24,
}
r4_0[25] = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_127,
    [2] = r0_0.RT_81,
  },
  TaskId = 25,
}
r5_0 = {
  TargetFilter = "Self",
}
r5_0.TaskEffects = {
  [1] = {
    Function = "ClearHitTargets",
  },
}
r5_0.TaskId = 26
r4_0[26] = r5_0
r4_0[27] = {
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_122,
  },
  TaskId = 27,
}
r5_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "CondemnTarget",
}
r5_0.TaskEffects = {
  [1] = {
    CantLockTime = 4,
    Function = "PlayerCameraUnlock",
  },
  [2] = {
    Function = "SetToCondemnLoc",
  },
}
r5_0.TaskId = 30
r4_0[30] = r5_0
r5_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "CondemnTarget",
}
r5_0.TaskEffects = {
  [1] = {
    Function = "StartTargetCondemn",
  },
}
r5_0.TaskId = 31
r4_0[31] = r5_0
r5_0 = {
  HatredIncrement = 40,
  NotifyName = r0_0.RT_12,
  TargetFilter = "CondemnTarget",
}
r5_0.TaskEffects = {
  [1] = {
    BaseAttr = "SkillIntensity",
    Condition = 301,
    DamageTag = r0_0.RT_37,
    DamageType = "TrueDamage",
    Function = "Damage",
    Rate = "$0.25*math.exp(0.0002*Source:GetAttr(\'Level\')^2+0.0868*Source:GetAttr(\'Level\')+7.0885)$",
  },
  [2] = {
    BaseAttr = "MaxHp",
    BaseChar = "Target",
    Condition = 300,
    DamageTag = r0_0.RT_37,
    DamageType = "TrueDamage",
    Function = "Damage",
    Rate = 0.05,
  },
  [3] = {
    BaseChar = "Target",
    FXId = 31,
    Function = "PlayFX",
  },
  [4] = {
    BaseChar = "Target",
    FXId = 33,
    Function = "PlayFX",
  },
}
r5_0.TaskId = 32
r4_0[32] = r5_0
r5_0 = {
  HatredIncrement = 40,
  NotifyName = r0_0.RT_13,
  TargetFilter = "CondemnTarget",
}
r5_0.TaskEffects = {
  [1] = {
    BaseAttr = "SkillIntensity",
    Condition = 301,
    DamageTag = r0_0.RT_37,
    DamageType = "TrueDamage",
    Function = "Damage",
    Rate = "$0.75*math.exp(0.0002*Source:GetAttr(\'Level\')^2+0.0868*Source:GetAttr(\'Level\')+7.0885)$",
  },
  [2] = {
    BaseAttr = "MaxHp",
    BaseChar = "Target",
    Condition = 300,
    DamageTag = r0_0.RT_37,
    DamageType = "TrueDamage",
    Function = "Damage",
    Rate = 0.15,
  },
  [3] = {
    BaseChar = "Target",
    FXId = 32,
    Function = "PlayFX",
  },
}
r5_0.TaskId = 33
r4_0[33] = r5_0
r5_0 = {
  TargetFilter = "Self",
}
r5_0.TaskEffects = {
  [1] = {
    ClearCount = 1,
    Function = "HitCount",
  },
}
r5_0.TaskId = 41
r4_0[41] = r5_0
r4_0[42] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_598,
  TaskId = 42,
}
r4_0[43] = {
  TargetFilter = "RootSource",
  TaskEffects = r0_0.RT_598,
  TaskId = 43,
}
r5_0 = {
  TargetFilter = "Target",
}
local r6_0 = "TaskEffects"
local r7_0 = {}
r7_0[1] = {
  BaseChar = "Target",
  CreatureId = 101,
  Function = "CreateSkillCreature",
  Location = {
    0,
    0,
    1000
  },
}
r5_0[r6_0] = r7_0
r5_0.TaskId = 101
r4_0[101] = r5_0
r5_0 = {
  TargetFilter = "Char_Sphere_Small_Frd",
}
r5_0.TaskEffects = {
  [1] = {
    FXId = 247,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
    RandomRotation = r0_0.RT_126,
  },
  [2] = {
    BuffId = 5000202,
    Function = "AddBuff",
    LastTime = 1,
  },
}
r5_0.TaskId = 102
r4_0[102] = r5_0
r5_0 = {
  TargetFilter = "Char_Sphere_Small_Frd",
}
r5_0.TaskEffects = {
  [1] = {
    BaseChar = "Self",
    FXId = 242,
    Function = "PlayFX",
  },
  [2] = {
    BuffId = 5000205,
    Function = "AddBuff",
    LastTime = 2,
  },
  [3] = {
    BuffId = 5000204,
    Function = "RemoveBuff",
  },
}
r5_0.TaskId = 103
r4_0[103] = r5_0
r5_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Target",
}
r5_0.TaskEffects = {
  [1] = {
    CreatureId = 102,
    Function = "CreateSkillCreature",
  },
}
r5_0.TaskId = 104
r4_0[104] = r5_0
r5_0 = {
  TargetFilter = "Target",
}
r5_0.TaskEffects = {
  [1] = {
    CauseHit = "HitFly_XY600Z600",
    Function = "CutToughness",
    Value = 100,
  },
  [2] = r0_0.RT_176,
  [3] = {
    Function = "PlaySE",
    SEId = 2018,
  },
}
r5_0.TaskId = 105
r4_0[105] = r5_0
r5_0 = {
  TargetFilter = "Target",
}
r5_0.TaskEffects = {
  [1] = {
    CreatureId = 102,
    Function = "RemoveSkillCreature",
  },
}
r5_0.TaskId = 106
r4_0[106] = r5_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_250,
    DamageType = "Wind",
    Function = "Damage",
    Rate = 2.56,
  },
  [2] = r0_0.RT_251,
  [3] = r0_0.RT_252,
  [4] = {
    Delay = 0.05,
    Dilation = 0,
    Duration = 0.03,
    Function = "HitStop",
  },
  [5] = r0_0.RT_253,
}
r6_0.TaskId = 1502
r4_0[1502] = r6_0
r6_0 = {
  TargetFilter = "Char_Cylinder_Large",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_250,
    DamageType = "Smash",
    Function = "Damage",
    Rate = 1.28,
  },
  [2] = {
    Delay = 0.1,
    FXId = 15131,
    Function = "PlayFX",
  },
  [3] = {
    CauseHit = "LightHit_100",
    Delay = 0.1,
    Function = "CutToughness",
    Value = 45,
  },
  [4] = r0_0.RT_248,
  [5] = r0_0.RT_249,
  [6] = r0_0.RT_319,
}
r6_0.TaskId = 1513
r4_0[1513] = r6_0
r6_0 = {
  TargetFilter = "Char_Cylinder_Large_OtFr",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "Maxhp",
    BaseChar = "Target",
    DamageType = "Default",
    Function = "Heal",
    Rate = 0.03,
  },
}
r6_0.TaskId = 1525
r4_0[1525] = r6_0
r6_0 = {
  TargetFilter = "AlmostAllFrd",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    BuffId = 1922,
    Function = "AddBuff",
    LastTime = 10,
  },
}
r6_0.TaskId = 1922
r4_0[1922] = r6_0
r6_0 = {
  TargetFilter = "AlmostAllFrd",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 1952,
    Function = "AddBuff",
    LastTime = 10,
  },
}
r6_0.TaskId = 1952
r4_0[1952] = r6_0
r5_0 = 3311
r6_0 = {
  TargetFilter = "Char_Sphere_Middle",
}
r7_0 = "TaskEffects"
local r8_0 = {}
r8_0[1] = {
  BaseAttr = "ATK_Ranged",
  DamageTag = {
    "Weapon",
    "Ranged"
  },
  Function = "Damage",
  Rate = "#1",
}
r8_0[2] = r0_0.RT_550
r8_0[3] = r0_0.RT_42
r8_0[4] = {
  Function = "PlaySE",
  SEId = 3331102,
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 3311
r4_0[r5_0] = r6_0
r4_0[3322] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_525,
  },
  TaskId = 3322,
}
r4_0[3332] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_342,
  TaskId = 3332,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AttrRates = r0_0.RT_1,
    Function = "CreateUnit",
    LifeTime = 0.6,
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 10001,
    UnitType = "MechanismSummon",
  },
}
r6_0.TaskId = 10001
r4_0[10001] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small180",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_37,
    Function = "Damage",
    Rate = 7.5,
  },
  [2] = r0_0.RT_38,
  [3] = r0_0.RT_39,
  [4] = {
    CauseHit = "LightHit_50",
    Condition = 15,
    Function = "CutToughness",
    Value = 178,
  },
  [5] = {
    Function = "PlaySE",
    SEId = 10002,
  },
}
r6_0.TaskId = 10011
r4_0[10011] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Large_Frd",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 96,
    Function = "AddBuff",
    LastTime = 6,
  },
  [2] = {
    BaseAttr = "MaxHp",
    DamageType = "Default",
    Function = "Heal",
    Rate = 0.2,
  },
  [3] = {
    FXId = 113,
    Function = "PlayFX",
    IsAttached = true,
  },
}
r6_0.TaskId = 10021
r4_0[10021] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Large",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_40,
    Function = "Damage",
    Rate = 7.5,
  },
  [2] = r0_0.RT_41,
  [3] = r0_0.RT_42,
}
r6_0.TaskId = 10022
r4_0[10022] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CauseHit = "LightHit",
    Function = "CutToughness",
    NotRotateWhenHit = true,
    Value = 100,
  },
}
r6_0.TaskId = 10101
r4_0[10101] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "ChangeColor",
    PassiveEffectId = 18011,
  },
}
r6_0.TaskId = 18010
r4_0[18010] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "StartShoot",
    PassiveEffectId = 18011,
  },
}
r6_0.TaskId = 18011
r4_0[18011] = r6_0
r6_0 = {
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 18011,
    Direction = "Camera",
    Distance = 2000,
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_328,
}
r6_0.TaskId = 18012
r4_0[18012] = r6_0
r6_0 = {
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 18012,
    Direction = "Camera",
    Distance = 2000,
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_328,
}
r6_0.TaskId = 18013
r4_0[18013] = r6_0
r6_0 = {
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 18013,
    Direction = "Camera",
    Distance = 2000,
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_328,
}
r6_0.TaskId = 18014
r4_0[18014] = r6_0
r4_0[18015] = {
  TargetFilter = "Char_Sphere_Small",
  TaskEffects = r0_0.RT_333,
  TaskId = 18015,
}
r4_0[18016] = {
  TargetFilter = "Char_Sphere_Small",
  TaskEffects = r0_0.RT_337,
  TaskId = 18016,
}
r4_0[18017] = {
  TargetFilter = "Char_Sphere_Small",
  TaskEffects = r0_0.RT_341,
  TaskId = 18017,
}
r4_0[18018] = {
  TargetFilter = "Char_Sphere_Small",
  TaskEffects = r0_0.RT_333,
  TaskId = 18018,
}
r4_0[18019] = {
  TargetFilter = "Char_Sphere_Small",
  TaskEffects = r0_0.RT_337,
  TaskId = 18019,
}
r4_0[18020] = {
  TargetFilter = "Char_Sphere_Small",
  TaskEffects = r0_0.RT_341,
  TaskId = 18020,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 20101,
    Function = "CreateSkillCreature",
    Rotation = r0_0.RT_193,
  },
  [2] = r0_0.RT_72,
}
r6_0.TaskId = 20111
r4_0[20111] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 20102,
    Function = "CreateSkillCreature",
    Rotation = r0_0.RT_141,
  },
  [2] = r0_0.RT_72,
}
r6_0.TaskId = 20112
r4_0[20112] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 20103,
    Function = "CreateSkillCreature",
    Rotation = r0_0.RT_140,
  },
  [2] = r0_0.RT_72,
}
r6_0.TaskId = 20113
r4_0[20113] = r6_0
r6_0 = {
  AttackRangeType = "Bullet",
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_Middle",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_358,
  [2] = {
    BuffId = 201001,
    Function = "AddBuff",
    LastTime = 8,
  },
  [3] = {
    FXId = 20102,
    Function = "PlayFX",
  },
  [4] = r0_0.RT_312,
}
r6_0.TaskId = 20114
r4_0[20114] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 201002,
    Function = "AddBuff",
    LastTime = 10,
  },
}
r6_0.TaskId = 20121
r4_0[20121] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossOnline_RDChoose1",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 30401,
    Function = "CreateSkillCreature",
    UseBattlePointId = 30400,
  },
  [2] = {
    BuffId = 30400012,
    Function = "AddBuff",
    LastTime = 6,
  },
}
r6_0.TaskId = 30401
r4_0[30401] = r6_0
r4_0[30402] = {
  TargetFilter = "Mon_Sphere_800_360",
  TaskEffects = {
    [1] = r0_0.RT_16,
    [2] = r0_0.RT_485,
    [3] = r0_0.RT_495,
  },
  TaskId = 30402,
}
r4_0[30403] = {
  TargetFilter = "Mon_Sphere_800_360",
  TaskEffects = {
    [1] = r0_0.RT_3,
    [2] = r0_0.RT_485,
    [3] = r0_0.RT_495,
  },
  TaskId = 30403,
}
r4_0[30404] = {
  TargetFilter = "Mon_Sphere_800_360",
  TaskEffects = {
    [1] = r0_0.RT_33,
    [2] = r0_0.RT_485,
    [3] = r0_0.RT_495,
  },
  TaskId = 30404,
}
r4_0[30405] = {
  TargetFilter = "Mon_Sphere_800_360",
  TaskEffects = {
    [1] = r0_0.RT_496,
    [2] = r0_0.RT_485,
    [3] = r0_0.RT_495,
  },
  TaskId = 30405,
}
r6_0 = {
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 311,
    UnitType = "Monster",
    UseBattlePointId = 3040301,
  },
}
r6_0.TaskId = 30406
r4_0[30406] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 30402,
    Function = "CreateSkillCreature",
    UseBattlePointId = 30400,
  },
}
r6_0.TaskId = 30407
r4_0[30407] = r6_0
r4_0[30408] = {
  TargetFilter = "BossOnline_Skill04Cylinder1",
  TaskEffects = r0_0.RT_497,
  TaskId = 30408,
}
r4_0[30409] = {
  TargetFilter = "BossOnline_Skill05Damage",
  TaskEffects = r0_0.RT_498,
  TaskId = 30409,
}
r4_0[30410] = {
  TargetFilter = "BossOnline_Skill06Damage",
  TaskEffects = r0_0.RT_498,
  TaskId = 30410,
}
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 30403,
    Function = "CreateSkillCreature",
    UseBattlePointId = 30400,
  },
}
r6_0.TaskId = 30411
r4_0[30411] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 30403,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 30412
r4_0[30412] = r6_0
r4_0[30413] = {
  TargetFilter = "BossOnline_Skill07Damage",
  TaskEffects = r0_0.RT_503,
  TaskId = 30413,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 30404,
    Function = "CreateSkillCreature",
    UseBattlePointId = 3040701,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 30414
r4_0[30414] = r6_0
r4_0[30415] = {
  TargetFilter = "Mon_Sphere_50_360",
  TaskEffects = r0_0.RT_504,
  TaskId = 30415,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 30404,
    Function = "CreateSkillCreature",
    UseBattlePointId = 3040702,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 30416
r4_0[30416] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 30404,
    Function = "CreateSkillCreature",
    UseBattlePointId = 3040703,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 30417
r4_0[30417] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_13,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 30404,
    Function = "CreateSkillCreature",
    UseBattlePointId = 3040704,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 30418
r4_0[30418] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_405,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 30404,
    Function = "CreateSkillCreature",
    UseBattlePointId = 3040705,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 30419
r4_0[30419] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_505,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 30404,
    Function = "CreateSkillCreature",
    UseBattlePointId = 3040706,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 30420
r4_0[30420] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 30405,
    Function = "CreateSkillCreature",
    UseBattlePointId = 3040801,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 30421
r4_0[30421] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 30406,
    Function = "CreateSkillCreature",
    UseBattlePointId = 3040802,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 30422
r4_0[30422] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 30407,
    Function = "CreateSkillCreature",
    UseBattlePointId = 3040901,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 30423
r4_0[30423] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
}
r6_0.TaskEffects = {
  [1] = {
    DanmakuTemplateId = 30401,
    Duration = 17,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 30424
r4_0[30424] = r6_0
r4_0[30425] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_502,
    [2] = r0_0.RT_506,
  },
  TaskId = 30425,
}
r4_0[30426] = {
  TaskEffects = r0_0.RT_508,
  TaskId = 30426,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 30408,
    Function = "CreateSkillCreature",
    UseBattlePointId = 3041001,
    UseBattlePointRotation = 1,
  },
  [2] = {
    CreatureId = 30408,
    Function = "CreateSkillCreature",
    UseBattlePointId = 3041002,
    UseBattlePointRotation = 1,
  },
  [3] = {
    CreatureId = 30408,
    Function = "CreateSkillCreature",
    UseBattlePointId = 3041003,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 30427
r4_0[30427] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 30409,
    Function = "CreateSkillCreature",
    UseBattlePointId = 3041004,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 30428
r4_0[30428] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 30409,
    Function = "CreateSkillCreature",
    UseBattlePointId = 3041005,
    UseBattlePointRotation = 1,
  },
  [2] = {
    CreatureId = 30409,
    Function = "CreateSkillCreature",
    UseBattlePointId = 3041006,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 30429
r4_0[30429] = r6_0
r4_0[30430] = {
  TargetFilter = "BossOnline_Skill10Damage",
  TaskEffects = r0_0.RT_498,
  TaskId = 30430,
}
r6_0 = {
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 312,
    UnitType = "Monster",
    UseBattlePointId = 3040302,
  },
}
r6_0.TaskId = 30431
r4_0[30431] = r6_0
r4_0[30432] = {
  NotifyName = r0_0.RT_509,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_511,
  TaskId = 30432,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 30411,
    Function = "CreateSkillCreature",
    UseBattlePointId = 3041101,
    UseBattlePointRotation = 1,
  },
  [2] = {
    CreatureId = 30411,
    Function = "CreateSkillCreature",
    UseBattlePointId = 3041102,
    UseBattlePointRotation = 1,
  },
  [3] = {
    CreatureId = 30411,
    Function = "CreateSkillCreature",
    UseBattlePointId = 3041103,
    UseBattlePointRotation = 1,
  },
  [4] = {
    CreatureId = 30411,
    Function = "CreateSkillCreature",
    UseBattlePointId = 3041104,
    UseBattlePointRotation = 1,
  },
  [5] = {
    CreatureId = 30411,
    Function = "CreateSkillCreature",
    UseBattlePointId = 3041105,
    UseBattlePointRotation = 1,
  },
  [6] = {
    CreatureId = 30411,
    Function = "CreateSkillCreature",
    UseBattlePointId = 3041106,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 30433
r4_0[30433] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 30410,
    Function = "CreateSkillCreature",
    UseBattlePointId = 3041107,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 30434
r4_0[30434] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 30411,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 30435
r4_0[30435] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 30412,
    Function = "CreateSkillCreature",
    UseBattlePointId = 30400,
  },
}
r6_0.TaskId = 30436
r4_0[30436] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 30412,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 30437
r4_0[30437] = r6_0
r4_0[30438] = {
  TargetFilter = "BossOnline_Skill02Cylinder1",
  TaskEffects = r0_0.RT_497,
  TaskId = 30438,
}
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 30413,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 30439
r4_0[30439] = r6_0
r6_0 = {
  TargetFilter = "HatredPlayers",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 30400004,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 30440
r4_0[30440] = r6_0
r6_0 = {
  TargetFilter = "HatredPlayers",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 30400004,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 30441
r4_0[30441] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BattlePointID = 30400,
    Function = "SetSelfLoc",
    TargetCenterLoc = "BattlePoint",
  },
}
r6_0.TaskId = 30442
r4_0[30442] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 307,
    UnitType = "Monster",
    UseBattlePointId = 3040101,
  },
  [2] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 308,
    UnitType = "Monster",
    UseBattlePointId = 3040102,
  },
  [3] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 308,
    UnitType = "Monster",
    UseBattlePointId = 3040103,
  },
  [4] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 308,
    UnitType = "Monster",
    UseBattlePointId = 3040104,
  },
  [5] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 308,
    UnitType = "Monster",
    UseBattlePointId = 3040105,
  },
  [6] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 308,
    UnitType = "Monster",
    UseBattlePointId = 3040106,
  },
  [7] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 308,
    UnitType = "Monster",
    UseBattlePointId = 3040107,
  },
  [8] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 308,
    UnitType = "Monster",
    UseBattlePointId = 3040108,
  },
}
r6_0.TaskId = 30443
r4_0[30443] = r6_0
r6_0 = {
  TargetFilter = "HatredPlayers",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "SpecificTarget",
    Tag = "HatredShuffle",
    TargetType = "Target",
  },
  [2] = {
    Function = "ShuffleSpecificTarget",
    Tag = "HatredShuffle",
  },
}
r6_0.TaskId = 30446
r4_0[30446] = r6_0
r4_0[30447] = {
  TargetFilter = "Mon_SPTarget01",
  TaskEffects = r0_0.RT_513,
  TaskId = 30447,
}
r4_0[30448] = {
  TargetFilter = "Mon_SPTarget02",
  TaskEffects = r0_0.RT_515,
  TaskId = 30448,
}
r4_0[30449] = {
  TargetFilter = "Mon_SPTarget03",
  TaskEffects = r0_0.RT_513,
  TaskId = 30449,
}
r4_0[30450] = {
  TargetFilter = "Mon_SPTarget04",
  TaskEffects = r0_0.RT_515,
  TaskId = 30450,
}
r4_0[30451] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossOnline_Skill12Cylinder1",
  TaskEffects = r0_0.RT_516,
  TaskId = 30451,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossOnline_RDChoose1",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 30414,
    Function = "CreateSkillCreature",
    UseBattlePointId = 3041301,
    UseBattlePointRotation = 1,
  },
  [2] = {
    CreatureId = 30414,
    Function = "CreateSkillCreature",
    UseBattlePointId = 3041302,
    UseBattlePointRotation = 1,
  },
  [3] = {
    CreatureId = 30414,
    Function = "CreateSkillCreature",
    UseBattlePointId = 3041303,
    UseBattlePointRotation = 1,
  },
  [4] = {
    CreatureId = 30414,
    Function = "CreateSkillCreature",
    UseBattlePointId = 3041304,
    UseBattlePointRotation = 1,
  },
  [5] = {
    CreatureId = 30414,
    Function = "CreateSkillCreature",
    UseBattlePointId = 3041305,
    UseBattlePointRotation = 1,
  },
  [6] = {
    CreatureId = 30415,
    Function = "CreateSkillCreature",
    UseBattlePointId = 3041301,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 30452
r4_0[30452] = r6_0
r4_0[30453] = {
  TargetFilter = "BossOnline_Skill13Cylinder1",
  TaskEffects = r0_0.RT_516,
  TaskId = 30453,
}
r4_0[30454] = {
  TargetFilter = "BossOnline_Skill13Cylinder2",
  TaskEffects = r0_0.RT_516,
  TaskId = 30454,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Target",
}
r8_0 = {}
r8_0[1] = {
  Function = "EffectFunction",
  FunctionName = "Mon_RandomChoosePlayersRepeatableToSPT",
  Vars = {
    ChooseNum = 3,
    SPTargetTag = "Repeatable",
  },
}
r6_0.TaskEffects = r8_0
r6_0.TaskId = 30455
r4_0[30455] = r6_0
r4_0[30456] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossOnline_Skill15Cylinder1",
  TaskEffects = r0_0.RT_517,
  TaskId = 30456,
}
r4_0[30457] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossOnline_Skill16Cylinder1",
  TaskEffects = r0_0.RT_517,
  TaskId = 30457,
}
r4_0[30458] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossOnline_Skill16Cylinder1",
  TaskEffects = {
    [1] = r0_0.RT_496,
    [2] = r0_0.RT_495,
    [3] = r0_0.RT_10,
  },
  TaskId = 30458,
}
r4_0[30459] = {
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_518,
    [2] = r0_0.RT_519,
  },
  TaskId = 30459,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 30416,
    Function = "CreateSkillCreature",
    UseBattlePointId = 3041701,
  },
}
r6_0.TaskId = 30460
r4_0[30460] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 30417,
    Function = "CreateSkillCreature",
    UseBattlePointId = 3041702,
  },
}
r6_0.TaskId = 30461
r4_0[30461] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 30418,
    Function = "CreateSkillCreature",
    UseBattlePointId = 3041703,
  },
}
r6_0.TaskId = 30462
r4_0[30462] = r6_0
r4_0[30463] = {
  TargetFilter = "Mon_Cylinder_300_40_360",
  TaskEffects = r0_0.RT_513,
  TaskId = 30463,
}
r4_0[30464] = {
  TargetFilter = "Mon_Cylinder_300_40_360",
  TaskEffects = r0_0.RT_515,
  TaskId = 30464,
}
r6_0 = {
  TargetFilter = "Mon_Cylinder_300_40_360",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 30400010,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 30465
r4_0[30465] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 30400007,
    Function = "AddBuff",
    LastTime = 180,
  },
}
r6_0.TaskId = 30466
r4_0[30466] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 305,
    UnitType = "Monster",
    UseBattlePointId = 3040101,
  },
  [2] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 305,
    UnitType = "Monster",
    UseBattlePointId = 3040102,
  },
  [3] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 305,
    UnitType = "Monster",
    UseBattlePointId = 3040103,
  },
  [4] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 305,
    UnitType = "Monster",
    UseBattlePointId = 3040104,
  },
  [5] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 305,
    UnitType = "Monster",
    UseBattlePointId = 3040105,
  },
  [6] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 305,
    UnitType = "Monster",
    UseBattlePointId = 3040106,
  },
}
r6_0.TaskId = 30467
r4_0[30467] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 306,
    UnitType = "Monster",
    UseBattlePointId = 3040101,
  },
  [2] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 306,
    UnitType = "Monster",
    UseBattlePointId = 3040102,
  },
  [3] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 306,
    UnitType = "Monster",
    UseBattlePointId = 3040103,
  },
  [4] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 306,
    UnitType = "Monster",
    UseBattlePointId = 3040104,
  },
  [5] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 306,
    UnitType = "Monster",
    UseBattlePointId = 3040105,
  },
  [6] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 306,
    UnitType = "Monster",
    UseBattlePointId = 3040106,
  },
}
r6_0.TaskId = 30468
r4_0[30468] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 310,
    UnitType = "Monster",
    UseBattlePointId = 3040101,
  },
  [2] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 310,
    UnitType = "Monster",
    UseBattlePointId = 3040102,
  },
  [3] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 310,
    UnitType = "Monster",
    UseBattlePointId = 3040103,
  },
  [4] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 310,
    UnitType = "Monster",
    UseBattlePointId = 3040104,
  },
  [5] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 310,
    UnitType = "Monster",
    UseBattlePointId = 3040105,
  },
  [6] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 310,
    UnitType = "Monster",
    UseBattlePointId = 3040106,
  },
}
r6_0.TaskId = 30469
r4_0[30469] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHp",
    Function = "Heal",
    Rate = 0.001,
  },
  [2] = r0_0.RT_520,
}
r6_0.TaskId = 30470
r4_0[30470] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 30416,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 30471
r4_0[30471] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 30417,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 30472
r4_0[30472] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 30418,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 30473
r4_0[30473] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 30419,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 30474
r4_0[30474] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 30420,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 30475
r4_0[30475] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 30421,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 30476
r4_0[30476] = r6_0
r6_0 = {
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 30400016,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 30477
r4_0[30477] = r6_0
r6_0 = {
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 30400016,
    Function = "RemoveBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 30478
r4_0[30478] = r6_0
r4_0[30479] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossOnline_Skill12Cylinder2",
  TaskEffects = r0_0.RT_516,
  TaskId = 30479,
}
r4_0[30480] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossOnline_Skill12Cylinder3",
  TaskEffects = r0_0.RT_516,
  TaskId = 30480,
}
r4_0[30481] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossOnline_Skill12Cylinder4",
  TaskEffects = r0_0.RT_516,
  TaskId = 30481,
}
r4_0[30482] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossOnline_Skill12Cylinder5",
  TaskEffects = r0_0.RT_516,
  TaskId = 30482,
}
r4_0[30483] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossOnline_Skill12Cylinder6",
  TaskEffects = r0_0.RT_516,
  TaskId = 30483,
}
r6_0 = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "CreateUnit",
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 313,
    UnitType = "Monster",
    UseBattlePointId = 3041701,
  },
}
r6_0.TaskId = 30484
r4_0[30484] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "CreateUnit",
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 314,
    UnitType = "Monster",
    UseBattlePointId = 3041702,
  },
}
r6_0.TaskId = 30485
r4_0[30485] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "CreateUnit",
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 315,
    UnitType = "Monster",
    UseBattlePointId = 3041703,
  },
}
r6_0.TaskId = 30486
r4_0[30486] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 30422,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 30487
r4_0[30487] = r6_0
r4_0[30488] = {
  TargetFilter = "Mon_Sphere_150_360",
  TaskEffects = r0_0.RT_516,
  TaskId = 30488,
}
r4_0[30489] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossOnline_Skill14SPTarget01",
  TaskEffects = r0_0.RT_501,
  TaskId = 30489,
}
r4_0[30490] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossOnline_Skill14SPTarget02",
  TaskEffects = r0_0.RT_501,
  TaskId = 30490,
}
r4_0[30491] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossOnline_Skill14SPTarget03",
  TaskEffects = r0_0.RT_501,
  TaskId = 30491,
}
r4_0[30492] = {
  TargetFilter = "BossOnline_Skill14Cylinder1",
  TaskEffects = r0_0.RT_516,
  TaskId = 30492,
}
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851315,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 30493
r4_0[30493] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 30424,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 30494
r4_0[30494] = r6_0
r6_0 = {
  TargetFilter = "Mon_Cylinder_600_40_360",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    Function = "Damage",
    Rate = 0.05,
  },
}
r6_0.TaskId = 30495
r4_0[30495] = r6_0
r4_0[30496] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossOnline_Skill18Cylinder1",
  TaskEffects = r0_0.RT_521,
  TaskId = 30496,
}
r4_0[30497] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossOnline_Skill19Cylinder1",
  TaskEffects = r0_0.RT_521,
  TaskId = 30497,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "CreateUnit",
    LifeTime = 16,
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 316,
    UnitType = "Monster",
    UseBattlePointId = 30400,
  },
}
r6_0.TaskId = 30498
r4_0[30498] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 30425,
    Function = "CreateSkillCreature",
    UseBattlePointId = 30400,
  },
}
r6_0.TaskId = 30499
r4_0[30499] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Delay = 0.4,
    FXId = 4011,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 40100
r4_0[40100] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "Char_Cylinder_Large",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_552,
  [2] = {
    Delay = 0.4,
    FXId = 4012,
    Function = "PlayFX",
  },
  [3] = r0_0.RT_553,
  [4] = {
    BuffType = 100,
    Delay = 0.4,
    Function = "AddBuff",
    LastTime = 10,
  },
}
r6_0.TaskId = 40101
r4_0[40101] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Delay = 0.4,
    FXId = 4021,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 40200
r4_0[40200] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "AlmostAllFrd",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 402,
    Delay = 0.4,
    Function = "AddBuff",
    LastTime = 12,
  },
}
r6_0.TaskId = 40201
r4_0[40201] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Delay = 0.4,
    FXId = 4031,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 40300
r4_0[40300] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "AlmostAllFrd",
}
r6_0.TaskEffects = {
  [1] = {
    Delay = 0.4,
    Function = "AddSp",
    SpChange = "#1",
  },
  [2] = {
    BaseChar = "Target",
    Delay = 0.4,
    FXId = 4032,
    Function = "PlayFX",
    IsAttached = true,
  },
}
r6_0.TaskId = 40301
r4_0[40301] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Delay = 0.4,
    FXId = 4041,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 40400
r4_0[40400] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "AlmostAllFrd",
}
r6_0.TaskEffects = {
  [1] = {
    BuffType = 12,
    Delay = 0.4,
    Function = "AddBuff",
    LastTime = 10,
  },
  [2] = r0_0.RT_579,
  [3] = {
    BaseChar = "Target",
    Delay = 0.4,
    FXId = 4042,
    Function = "PlayFX",
    IsAttached = true,
  },
}
r6_0.TaskId = 40401
r4_0[40401] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Delay = 0.4,
    FXId = 4051,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 40500
r4_0[40500] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "AlmostAllFrd",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_580,
  [2] = {
    BaseChar = "Target",
    Delay = 0.4,
    FXId = 4052,
    Function = "PlayFX",
    IsAttached = true,
  },
}
r6_0.TaskId = 40501
r4_0[40501] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Delay = 0.4,
    FXId = 4061,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 40600
r4_0[40600] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "Char_Cylinder_Large",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_551,
    DamageType = "Light",
    Delay = 0.4,
    Function = "Damage",
    Rate = "#1",
  },
  [2] = {
    CauseHit = "HitFly_XY400Z300",
    Delay = 0.4,
    Function = "CutToughness",
    Value = 80,
  },
  [3] = {
    Delay = 0.4,
    FXId = 4062,
    Function = "PlayFX",
  },
  [4] = {
    BuffId = 406,
    Delay = 0.4,
    Function = "AddBuff",
    LastTime = 10,
  },
}
r6_0.TaskId = 40601
r4_0[40601] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Delay = 0.4,
    FXId = 4071,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 40700
r4_0[40700] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "Char_Cylinder_Large",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_551,
    Delay = 0.4,
    Function = "Damage",
    Rate = "#1",
  },
}
r6_0.TaskId = 40701
r4_0[40701] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
}
r6_0.TaskEffects = {
  [1] = {
    CheckRange = 100,
    CheckType = 1,
    Function = "FindTreasure",
    GuideCloseRange = 500,
    GuideDuration = 30,
  },
  [2] = {
    CheckRange = 100,
    CheckType = 2,
    Function = "FindTreasure",
    GuideCloseRange = 500,
    GuideDuration = 30,
  },
}
r6_0.TaskId = 40702
r4_0[40702] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 4081,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 40800
r4_0[40800] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "AlmostAllFrd",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 408,
    Function = "AddBuff",
    LastTime = "#1",
  },
}
r6_0.TaskId = 40801
r4_0[40801] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Delay = 0.4,
    FXId = 4091,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 40900
r4_0[40900] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "AlmostAllFrd",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 409,
    Delay = 0.4,
    Function = "AddBuff",
    LastTime = 10,
  },
}
r6_0.TaskId = 40901
r4_0[40901] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Delay = 0.4,
    FXId = 4111,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 41100
r4_0[41100] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "Char_Cylinder_Large",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_552,
  [2] = {
    Delay = 0.4,
    FXId = 4112,
    Function = "PlayFX",
  },
  [3] = r0_0.RT_553,
  [4] = {
    BuffId = 411,
    Delay = 0.4,
    Function = "AddBuff",
    LastTime = 10,
  },
}
r6_0.TaskId = 41101
r4_0[41101] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Delay = 0.4,
    FXId = 4121,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 41200
r4_0[41200] = r6_0
r6_0 = {
  ExtraBPFilter = "Common_IsRealSummon",
  NotifyName = r0_0.RT_9,
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "AlmostAllFrd",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 412,
    Delay = 0.4,
    Function = "AddBuff",
    LastTime = 10,
  },
}
r6_0.TaskId = 41201
r4_0[41201] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Delay = 0.4,
    FXId = 4131,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 41300
r4_0[41300] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "AlmostAllFrd",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 413,
    Delay = 0.4,
    Function = "AddBuff",
    LastTime = 15,
  },
}
r6_0.TaskId = 41301
r4_0[41301] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Delay = 0.4,
    Function = "SpawnDrop",
    UnitId = 1001,
    UnitType = "Drop",
  },
  [2] = {
    Delay = 0.4,
    Function = "SpawnDrop",
    UnitId = 1002,
    UnitType = "Drop",
  },
  [3] = {
    Delay = 0.4,
    Function = "SpawnDrop",
    UnitId = 1003,
    UnitType = "Drop",
  },
}
r6_0.TaskId = 41302
r4_0[41302] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Delay = 0.4,
    FXId = 4142,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 41400
r4_0[41400] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "AlmostAllFrd",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_579,
  [2] = {
    Delay = 0.4,
    Function = "AddSp",
    SpChange = "#2",
  },
  [3] = {
    BaseChar = "Target",
    Delay = 0.4,
    FXId = 4142,
    Function = "PlayFX",
    IsAttached = true,
  },
}
r6_0.TaskId = 41401
r4_0[41401] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Delay = 0.4,
    FXId = 4151,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 41500
r4_0[41500] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "AlmostAllFrd",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 415,
    Delay = 0.4,
    Function = "AddBuff",
    LastTime = 15,
  },
  [2] = r0_0.RT_580,
}
r6_0.TaskId = 41501
r4_0[41501] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Delay = 0.4,
    FXId = 4161,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 41600
r4_0[41600] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "Char_Cylinder_Large",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_551,
    DamageType = "Light",
    Delay = 0.5,
    Function = "Damage",
    Rate = "#1",
  },
  [2] = {
    CauseHit = "HitFly_XY400Z300",
    Delay = 0.5,
    Function = "CutToughness",
    Value = 80,
  },
  [3] = {
    Delay = 0.5,
    FXId = 4162,
    Function = "PlayFX",
  },
  [4] = {
    BuffId = 416,
    Delay = 0.5,
    Function = "AddBuff",
    LastTime = 10,
  },
}
r6_0.TaskId = 41601
r4_0[41601] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 4211,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 42100
r4_0[42100] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "Char_Cylinder_Large",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_551,
    DamageType = "Dark",
    Function = "Damage",
    Rate = "#1",
  },
  [2] = {
    FXId = 4112,
    Function = "PlayFX",
  },
  [3] = {
    CauseHit = "HitFly_XY400Z300",
    Function = "CutToughness",
    Value = 125,
  },
}
r6_0.TaskId = 42101
r4_0[42101] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "AlmostAllFrd",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 421,
    Function = "AddBuff",
    LastTime = 12,
  },
}
r6_0.TaskId = 42102
r4_0[42102] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 4121,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 42200
r4_0[42200] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "AlmostAllFrd",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 422,
    Function = "AddBuff",
    LastTime = 12,
  },
  [2] = {
    BuffId = 422,
    Condition = 210,
    Function = "AddBuff",
    LastTime = 10,
  },
  [3] = {
    BuffId = 422,
    Condition = 211,
    Function = "AddBuff",
    LastTime = 10,
  },
  [4] = {
    BuffId = 422,
    Condition = 212,
    Function = "AddBuff",
    LastTime = 10,
  },
}
r6_0.TaskId = 42201
r4_0[42201] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 4231,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 42300
r4_0[42300] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "Char_Cylinder_Large",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_551,
    DamageType = "Fire",
    Function = "Damage",
    Rate = "#1",
  },
  [2] = {
    FXId = 4132,
    Function = "PlayFX",
  },
  [3] = r0_0.RT_85,
}
r6_0.TaskId = 42301
r4_0[42301] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "AlmostAllFrd",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 423,
    Function = "AddBuff",
    LastTime = 12,
  },
}
r6_0.TaskId = 42302
r4_0[42302] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 4241,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 42400
r4_0[42400] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "AlmostAllFrd",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_93,
  [2] = {
    BuffId = 424,
    Function = "AddBuff",
    LastTime = 12,
  },
}
r6_0.TaskId = 42401
r4_0[42401] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 4251,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 42500
r4_0[42500] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "AlmostAllFrd",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 425,
    Function = "AddBuff",
    LastTime = 12,
  },
}
r6_0.TaskId = 42501
r4_0[42501] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "AlmostAllFrd",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHp",
    Condition = 415,
    DamageType = "Default",
    Function = "Heal",
    Rate = 0.1,
  },
}
r6_0.TaskId = 42502
r4_0[42502] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 4261,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 42600
r4_0[42600] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "Char_Cylinder_Large",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_551,
    DamageType = "Light",
    Function = "Damage",
    Rate = "#1",
  },
  [2] = {
    FXId = 4162,
    Function = "PlayFX",
  },
  [3] = r0_0.RT_85,
}
r6_0.TaskId = 42601
r4_0[42601] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "AlmostAllFrd",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 426,
    Function = "AddBuff",
    LastTime = 12,
  },
}
r6_0.TaskId = 42602
r4_0[42602] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 49100,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 49100
r4_0[49100] = r6_0
r5_0 = 49101
r6_0 = {
  TargetFilter = "Char_Sphere_Xlarge",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  BaseAttr = "ATK_Char",
  DamageTag = {
    "Support",
    "DongGuoWysSkill01"
  },
  DamageType = "Default",
  Function = "Damage",
  Rate = 0,
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 49101
r4_0[r5_0] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 60100,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_693,
  },
}
r6_0.TaskId = 60100
r4_0[60100] = r6_0
r4_0[60101] = {
  TargetFilter = "Char_Cylinder_Large",
  TaskEffects = {
    [1] = r0_0.RT_694,
    [2] = r0_0.RT_695,
  },
  TaskId = 60101,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 60102,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_693,
  },
}
r6_0.TaskId = 60102
r4_0[60102] = r6_0
r6_0 = {
  TargetFilter = "Char_Cylinder_Large",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_551,
    Function = "Damage",
    Rate = 6,
  },
  [2] = r0_0.RT_695,
}
r6_0.TaskId = 60103
r4_0[60103] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 4010013,
    Function = "AddBuff",
    LastTime = 6,
  },
}
r6_0.TaskId = 60104
r4_0[60104] = r6_0
r4_0[60200] = {
  TaskEffects = r0_0.RT_713,
  TaskId = 60200,
}
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_551,
    Function = "Damage",
    Rate = 2,
  },
  [2] = r0_0.RT_714,
  [3] = r0_0.RT_715,
}
r6_0.TaskId = 60201
r4_0[60201] = r6_0
r4_0[60202] = {
  TaskEffects = r0_0.RT_717,
  TaskId = 60202,
}
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_551,
    Function = "Damage",
    Rate = 4,
  },
  [2] = r0_0.RT_714,
  [3] = r0_0.RT_715,
}
r6_0.TaskId = 60203
r4_0[60203] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 4010014,
    Function = "AddBuff",
    LastTime = 6,
  },
  [2] = {
    FXId = 6023,
    Function = "PlayFX",
    IsAttached = true,
  },
}
r6_0.TaskId = 60204
r4_0[60204] = r6_0
r4_0[60205] = {
  TaskEffects = r0_0.RT_713,
  TaskId = 60205,
}
r4_0[60206] = {
  TaskEffects = r0_0.RT_717,
  TaskId = 60206,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 60300,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 60300
r4_0[60300] = r6_0
r4_0[60301] = {
  TaskEffects = {
    [1] = r0_0.RT_718,
    [2] = r0_0.RT_718,
    [3] = r0_0.RT_718,
  },
  TaskId = 60301,
}
r4_0[60302] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_694,
    [2] = r0_0.RT_251,
  },
  TaskId = 60302,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 60302,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 60303
r4_0[60303] = r6_0
r4_0[60304] = {
  TaskEffects = {
    [1] = r0_0.RT_719,
    [2] = r0_0.RT_719,
    [3] = r0_0.RT_719,
  },
  TaskId = 60304,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 4010015,
    Function = "AddBuff",
    LastTime = 6,
  },
}
r6_0.TaskId = 60305
r4_0[60305] = r6_0
r6_0 = {
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_551,
    Function = "Damage",
    Rate = 5,
  },
  [2] = {
    FXId = 6041,
    Function = "PlayFX",
  },
  [3] = r0_0.RT_720,
}
r6_0.TaskId = 60400
r4_0[60400] = r6_0
r6_0 = {
  TargetFilter = "Char_Cylinder_Large",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_551,
    Function = "Damage",
    Rate = 10,
  },
  [2] = {
    FXId = 6043,
    Function = "PlayFX",
  },
  [3] = r0_0.RT_720,
}
r6_0.TaskId = 60401
r4_0[60401] = r6_0
r6_0 = {
  ExtraBPFilter = "Common_IsRealSummon",
  TargetFilter = "AlmostAllOtFr",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 4010016,
    Function = "AddBuff",
    LastTime = 6,
  },
}
r6_0.TaskId = 60402
r4_0[60402] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 90001,
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_100,
  [3] = r0_0.RT_555,
}
r6_0.TaskId = 90001
r4_0[90001] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_large",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    DamageType = "TrueDamage",
    Function = "Damage",
    Rate = 17,
  },
  [2] = r0_0.RT_556,
  [3] = r0_0.RT_557,
  [4] = r0_0.RT_175,
}
r6_0.TaskId = 90002
r4_0[90002] = r6_0
r4_0[90003] = {
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_large",
  TaskEffects = r0_0.RT_560,
  TaskId = 90003,
}
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 90002,
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_100,
  [3] = r0_0.RT_554,
}
r6_0.TaskId = 90004
r4_0[90004] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    DamageType = "TrueDamage",
    Function = "Damage",
    Rate = 1.7,
  },
  [2] = r0_0.RT_562,
  [3] = r0_0.RT_563,
}
r6_0.TaskId = 90005
r4_0[90005] = r6_0
r4_0[90006] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_564,
  TaskId = 90006,
}
r6_0 = {
  EffectExecuteTiming = "Enter",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "ShootLoopStart",
    PassiveEffectId = 90002,
  },
}
r6_0.TaskId = 90007
r4_0[90007] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 90011,
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_100,
  [3] = r0_0.RT_555,
}
r6_0.TaskId = 90011
r4_0[90011] = r6_0
r4_0[90012] = {
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_large",
  TaskEffects = r0_0.RT_600,
  TaskId = 90012,
}
r4_0[90013] = {
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_large",
  TaskEffects = r0_0.RT_601,
  TaskId = 90013,
}
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 90012,
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_100,
  [3] = r0_0.RT_554,
}
r6_0.TaskId = 90014
r4_0[90014] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    DamageType = "TrueDamage",
    Function = "Damage",
    Value = 20,
  },
  [2] = r0_0.RT_562,
  [3] = r0_0.RT_563,
}
r6_0.TaskId = 90015
r4_0[90015] = r6_0
r4_0[90016] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_564,
  TaskId = 90016,
}
r6_0 = {
  EffectExecuteTiming = "Enter",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "ShootLoopStart",
    PassiveEffectId = 90012,
  },
}
r6_0.TaskId = 90017
r4_0[90017] = r6_0
r4_0[110111] = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
  TaskEffects = r0_0.RT_184,
  TaskId = 110111,
}
r4_0[110112] = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  NotifyName = r0_0.RT_9,
  TargetFilter = "Char_Cylinder_Small",
  TaskEffects = r0_0.RT_184,
  TaskId = 110112,
}
r4_0[110113] = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  NotifyName = r0_0.RT_12,
  TargetFilter = "Char_Cylinder_Small",
  TaskEffects = r0_0.RT_184,
  TaskId = 110113,
}
r4_0[110114] = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  NotifyName = r0_0.RT_13,
  TargetFilter = "Char_Cylinder_Small",
  TaskEffects = {
    [1] = r0_0.RT_180,
    [2] = r0_0.RT_181,
    [3] = r0_0.RT_185,
    [4] = r0_0.RT_183,
  },
  TaskId = 110114,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 110101,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 110121
r4_0[110121] = r6_0
r6_0 = {
  HatredIncrement = 40,
  NotifyName = r0_0.RT_9,
  TargetFilter = "Heitao_Skill02_Search",
}
r6_0.TaskEffects = {
  [1] = {
    ATKBase = "ATK_Ultra",
    CreatureId = 110141,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_186,
    Rotation = r0_0.RT_186,
  },
}
r6_0.TaskId = 110122
r4_0[110122] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 110101,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 110131
r4_0[110131] = r6_0
r4_0[110141] = {
  AllowSkillRangeModify = true,
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small180",
  TaskEffects = {
    [1] = r0_0.RT_187,
    [2] = r0_0.RT_181,
    [3] = r0_0.RT_188,
    [4] = r0_0.RT_79,
    [5] = r0_0.RT_183,
  },
  TaskId = 110141,
}
r6_0 = {
  AllowSkillRangeModify = true,
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small180",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_187,
  [2] = r0_0.RT_181,
  [3] = {
    BossValue = 20,
    CauseHit = "HitFly_XY200Z300_F",
    Function = "CutToughness",
    Value = 15,
  },
  [4] = r0_0.RT_79,
  [5] = r0_0.RT_183,
}
r6_0.TaskId = 110142
r4_0[110142] = r6_0
r4_0[110143] = {
  AllowSkillRangeModify = true,
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
  TaskEffects = {
    [1] = r0_0.RT_187,
    [2] = r0_0.RT_181,
    [3] = r0_0.RT_189,
    [4] = r0_0.RT_79,
    [5] = r0_0.RT_183,
  },
  TaskId = 110143,
}
r6_0 = {
  AllowSkillRangeModify = true,
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small180",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_187,
  [2] = r0_0.RT_181,
  [3] = {
    BossValue = 30,
    CauseHit = "HitFly_XY200Z300_F",
    Function = "CutToughness",
    Value = 30,
  },
  [4] = r0_0.RT_79,
  [5] = r0_0.RT_183,
}
r6_0.TaskId = 110144
r4_0[110144] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small180",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_187,
  [2] = r0_0.RT_181,
  [3] = {
    BossValue = 35,
    CauseHit = "HitFly_XY400Z300_F",
    Function = "CutToughness",
    Value = 40,
  },
  [4] = r0_0.RT_79,
  [5] = r0_0.RT_183,
}
r6_0.TaskId = 110145
r4_0[110145] = r6_0
r4_0[110146] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Heitao_Skill02_Search",
  TaskEffects = {
    [1] = r0_0.RT_192,
  },
  TaskId = 110146,
}
r4_0[110147] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Heitao_Skill02_Search",
  TaskEffects = {
    [1] = r0_0.RT_195,
  },
  TaskId = 110147,
}
r4_0[110148] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Heitao_Skill02_Search",
  TaskEffects = {
    [1] = r0_0.RT_198,
  },
  TaskId = 110148,
}
r4_0[110149] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Heitao_Skill02_Search",
  TaskEffects = {
    [1] = r0_0.RT_200,
  },
  TaskId = 110149,
}
r4_0[110150] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Heitao_Skill02_Search",
  TaskEffects = {
    [1] = r0_0.RT_201,
  },
  TaskId = 110150,
}
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_187,
  [2] = r0_0.RT_202,
  [3] = {
    BossValue = 27,
    CauseHit = "HitFly_XY400Z400_F",
    Function = "CutToughness",
    Value = 15,
  },
  [4] = r0_0.RT_203,
}
r6_0.TaskId = 110151
r4_0[110151] = r6_0
r4_0[110152] = {
  HatredIncrement = 40,
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_187,
    [2] = r0_0.RT_202,
    [3] = r0_0.RT_204,
    [4] = r0_0.RT_203,
  },
  TaskId = 110152,
}
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_187,
  [2] = r0_0.RT_202,
  [3] = {
    BossValue = 37,
    CauseHit = "HitFly_XY200Z300_F",
    Function = "CutToughness",
    Value = 15,
  },
  [4] = r0_0.RT_203,
}
r6_0.TaskId = 110153
r4_0[110153] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_187,
  [2] = r0_0.RT_202,
  [3] = {
    BossValue = 42,
    CauseHit = "HitFly_XY200Z300_F",
    Function = "CutToughness",
    Value = 15,
  },
  [4] = r0_0.RT_203,
}
r6_0.TaskId = 110154
r4_0[110154] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_187,
  [2] = r0_0.RT_202,
  [3] = {
    BossValue = 47,
    CauseHit = "HitFly_XY400Z300_F",
    Function = "CutToughness",
    Value = 15,
  },
  [4] = r0_0.RT_203,
}
r6_0.TaskId = 110155
r4_0[110155] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Heitao_Skill02_Search",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_192,
  [2] = {
    ATKBase = "ATK_Ultra",
    Condition = 110102,
    CreatureId = 110141,
    Delay = 0.2,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_190,
    Rotation = r0_0.RT_191,
  },
}
r6_0.TaskId = 110161
r4_0[110161] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Heitao_Skill02_Search",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_195,
  [2] = {
    ATKBase = "ATK_Ultra",
    Condition = 110102,
    CreatureId = 110142,
    Delay = 0.2,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_193,
    Rotation = r0_0.RT_194,
  },
}
r6_0.TaskId = 110162
r4_0[110162] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Heitao_Skill02_Search",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_198,
  [2] = {
    ATKBase = "ATK_Ultra",
    Condition = 110102,
    CreatureId = 110143,
    Delay = 0.2,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_196,
    Rotation = r0_0.RT_197,
  },
}
r6_0.TaskId = 110163
r4_0[110163] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Heitao_Skill02_Search",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_200,
  [2] = {
    ATKBase = "ATK_Ultra",
    Condition = 110102,
    CreatureId = 110144,
    Delay = 0.2,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_186,
    Rotation = r0_0.RT_199,
  },
}
r6_0.TaskId = 110164
r4_0[110164] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Heitao_Skill02_Search",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_201,
  [2] = {
    ATKBase = "ATK_Ultra",
    Condition = 110102,
    CreatureId = 110145,
    Delay = 0.2,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_193,
    Rotation = r0_0.RT_126,
  },
}
r6_0.TaskId = 110165
r4_0[110165] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecuteClientPassiveFunction",
    FunctionName = "Skill1Aim",
  },
}
r6_0.TaskId = 110211
r4_0[110211] = r6_0
r4_0[110212] = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  NotifyName = r0_0.RT_9,
  TargetFilter = "Char_Cylinder_Middle",
  TaskEffects = {
    [1] = r0_0.RT_206,
    [2] = r0_0.RT_181,
    [3] = r0_0.RT_185,
  },
  TaskId = 110212,
}
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 110201,
    Condition = 71,
    Function = "AddBuff",
    LastTime = 12,
  },
}
r6_0.TaskId = 110213
r4_0[110213] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 110202,
    Function = "AddBuff",
    LastTime = -1,
  },
  [2] = {
    AttrRates = r0_0.RT_1,
    AutoAttach = 1,
    Delay = 3,
    Function = "CreateUnit",
    LifeTime = -1,
    MaxSummonCount = 1,
    UnitId = 110201,
    UnitType = "Monster",
  },
  [3] = {
    FXId = 110221,
    Function = "PlayFX",
    IsAttached = false,
    IsEffectCreature = true,
  },
  [4] = {
    FXId = 110222,
    Function = "PlayFX",
    IsAttached = false,
    IsEffectCreature = true,
  },
  [5] = {
    FXId = 110223,
    Function = "PlayFX",
    IsAttached = false,
    IsEffectCreature = true,
  },
  [6] = {
    FXId = 110224,
    Function = "PlayFX",
    IsAttached = false,
    IsEffectCreature = true,
  },
  [7] = {
    FXId = 110225,
    Function = "PlayFX",
    IsAttached = false,
    IsEffectCreature = true,
  },
}
r6_0.TaskId = 110221
r4_0[110221] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_207,
  [2] = {
    BuffId = 110202,
    Function = "RemoveBuff",
  },
  [3] = {
    Function = "RemoveUnit",
    UnitId = 110201,
  },
}
r6_0.TaskId = 110222
r4_0[110222] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "FuluoDollAttack",
    PassiveEffectId = 110201,
  },
}
r6_0.TaskId = 110223
r4_0[110223] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 110201,
    Function = "CreateSkillCreature",
    UseSaveLoc = "FuluoDoll",
  },
  [2] = {
    BuffId = 110231,
    Function = "AddBuff",
    LastTime = 20,
  },
  [3] = {
    BuffId = 110232,
    Function = "AddBuff",
    LastTime = 20,
  },
}
r6_0.TaskId = 110231
r4_0[110231] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 110202,
    Function = "CreateSkillCreature",
    UseSaveLoc = "FuluoStart",
  },
}
r6_0.TaskId = 110241
r4_0[110241] = r6_0
r4_0[110242] = {
  HatredIncrement = 40,
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_206,
    [2] = r0_0.RT_202,
    [3] = r0_0.RT_204,
  },
  TaskId = 110242,
}
r5_0 = 110251
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Large",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  BaseAttr = "ATK_Melee",
  DamageTag = {
    "Weapon",
    "Melee",
    "HeavyAttack"
  },
  Function = "Damage",
  Rate = 3,
}
r8_0[2] = {
  CanBeScaled = true,
  FXId = 410225,
  Function = "PlayFX",
  IsAttached = 1,
}
r8_0[3] = r0_0.RT_208
r8_0[4] = r0_0.RT_209
r6_0[r7_0] = r8_0
r6_0.TaskId = 110251
r4_0[r5_0] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_62,
  [2] = r0_0.RT_207,
  [3] = {
    BuffId = 110205,
    Condition = 74,
    Function = "AddBuff",
    LastTime = 20,
  },
}
r6_0.TaskId = 110252
r4_0[110252] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle120",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_180,
  [2] = {
    BossValue = 25,
    CauseHit = "LightHit",
    Function = "CutToughness",
    Value = 25,
  },
  [3] = r0_0.RT_210,
  [4] = {
    BuffCount = 5,
    BuffId = 110301,
    Function = "AddBuff",
    LastTime = 8,
  },
  [5] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "Skill1AddMsp1",
    PassiveEffectId = 110301,
  },
  [6] = {
    Function = "PlaySE",
    SEId = 110311,
  },
}
r6_0.TaskId = 110311
r4_0[110311] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 110311,
    Function = "AddBuff",
    LastTime = 5,
  },
  [2] = r0_0.RT_211,
  [3] = r0_0.RT_212,
}
r6_0.TaskId = 110312
r4_0[110312] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseChar = "Target",
    FXId = 110331,
    Function = "PlayFX",
    IsAttached = true,
  },
  [2] = {
    Dilation = 0,
    Duration = 0.05,
    Function = "HitStop",
  },
}
r6_0.TaskId = 110313
r4_0[110313] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_180,
  [2] = {
    BossValue = 25,
    CauseHit = "HitFly_XY1000Z300_F",
    Function = "CutToughness",
    Value = 25,
  },
  [3] = r0_0.RT_210,
  [4] = {
    Function = "PlaySE",
    SEId = 110305,
  },
}
r6_0.TaskId = 110314
r4_0[110314] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 110341,
    Function = "AddBuff",
    LastTime = 5,
  },
  [2] = r0_0.RT_211,
  [3] = r0_0.RT_212,
}
r6_0.TaskId = 110315
r4_0[110315] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ChangeModel",
    ModelId = 110301,
  },
  [2] = {
    BuffId = 110302,
    Function = "AddBuff",
    LastTime = -1,
  },
  [3] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "HenshinBuff",
    PassiveEffectId = 110301,
  },
}
r6_0.TaskId = 110321
r4_0[110321] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ChangeModel",
    ModelId = 0,
  },
  [2] = {
    BuffId = 110302,
    Function = "RemoveBuff",
  },
  [3] = {
    BuffId = 110303,
    Function = "RemoveBuff",
  },
  [4] = {
    BuffId = 110331,
    Function = "RemoveBuff",
  },
  [5] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "HenshinOff",
    PassiveEffectId = 110301,
  },
}
r6_0.TaskId = 110322
r4_0[110322] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "Skill2AddMsp",
    PassiveEffectId = 110301,
  },
}
r6_0.TaskId = 110323
r4_0[110323] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = {
    BossValue = 1,
    CauseHit = "HitFly_XY200Z500",
    Function = "CutToughness",
    Value = 30,
  },
}
r6_0.TaskId = 110324
r4_0[110324] = r6_0
r5_0 = 110331
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle240",
}
r7_0 = "TaskEffects"
r8_0 = {
  [1] = r0_0.RT_213,
}
r8_0[2] = {
  FXId = 110304,
  Function = "PlayFX",
  FxRotator = {
    200,
    -90,
    0
  },
  IsFaceToChar = true,
  MaxHitFXNum = 3,
}
r8_0[3] = r0_0.RT_214
r8_0[4] = r0_0.RT_72
r8_0[5] = r0_0.RT_215
r6_0[r7_0] = r8_0
r6_0.TaskId = 110331
r4_0[r5_0] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle240",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_213,
  [2] = {
    FXId = 110304,
    Function = "PlayFX",
    FxRotator = r0_0.RT_60,
    IsFaceToChar = true,
    MaxHitFXNum = 3,
  },
  [3] = r0_0.RT_214,
  [4] = r0_0.RT_72,
  [5] = r0_0.RT_215,
}
r6_0.TaskId = 110332
r4_0[110332] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle240",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_217,
  [2] = r0_0.RT_218,
  [3] = {
    BossValue = 14,
    CauseHit = "LightHit_Tuosi",
    Function = "CutToughness",
    Value = 15,
  },
  [4] = r0_0.RT_72,
  [5] = {
    BaseChar = "Self",
    Condition = 100,
    Function = "ExecutePassiveFunction",
    FunctionName = "AddMspOnHit",
    PassiveEffectId = 110301,
  },
  [6] = r0_0.RT_215,
}
r6_0.TaskId = 110333
r4_0[110333] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle240",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_220,
  [2] = r0_0.RT_218,
  [3] = {
    BossValue = 49,
    CauseHit = "HitFly_XY800Z400_F",
    Function = "CutToughness",
    Value = 100,
  },
  [4] = r0_0.RT_72,
  [5] = {
    Function = "PlaySE",
    SEId = 110307,
  },
}
r6_0.TaskId = 110334
r4_0[110334] = r6_0
r4_0[110341] = {
  NotifyName = r0_0.RT_221,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_68,
  TaskId = 110341,
}
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_220,
  [2] = r0_0.RT_218,
  [3] = {
    BossValue = 49,
    CauseHit = "HitFly_XY300Z800",
    Function = "CutToughness",
    Value = 50,
  },
  [4] = r0_0.RT_72,
  [5] = {
    Function = "PlaySE",
    SEId = 110308,
  },
}
r6_0.TaskId = 110342
r4_0[110342] = r6_0
r6_0 = {
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    Condition = 110312,
    CreatureId = 110301,
    Direction = "Camera",
    Function = "CreateRayCreature",
    RayEndLoc = true,
  },
  [2] = {
    Condition = 110313,
    CreatureId = 110311,
    Direction = "Camera",
    Function = "CreateRayCreature",
    RayEndLoc = true,
  },
  [3] = {
    CreatureId = 110312,
    Direction = "Camera",
    Function = "CreateRayCreature",
    RayEndLoc = true,
  },
  [4] = r0_0.RT_72,
  [5] = r0_0.RT_100,
}
r6_0.TaskId = 110351
r4_0[110351] = r6_0
r6_0 = {
  EffectExecuteTiming = "Leave",
  NotifyName = r0_0.RT_9,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 110301,
    Function = "RemoveRayCreature",
  },
  [2] = {
    CreatureId = 110311,
    Function = "RemoveRayCreature",
  },
  [3] = {
    CreatureId = 110312,
    Function = "RemoveRayCreature",
  },
}
r6_0.TaskId = 110352
r4_0[110352] = r6_0
r5_0 = 110353
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  Function = "StartLoopShoot",
  LoopInterval = 0.25,
  LoopShootId = 110325,
  SkillEffect = {
    110351
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 110353
r4_0[r5_0] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
}
r6_0.TaskEffects = {
  [1] = {
    Function = "EndLoopShoot",
    LoopShootId = 110325,
  },
}
r6_0.TaskId = 110354
r4_0[110354] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_217,
  [2] = {
    BossValue = 17,
    CauseHit = "LightHit",
    Function = "CutToughness",
    Value = 15,
  },
  [3] = {
    BaseChar = "Self",
    Function = "ExecutePassiveFunction",
    FunctionName = "AddMspOnHit",
    PassiveEffectId = 110301,
  },
  [4] = {
    Condition = 110312,
    Function = "PlaySE",
    SEId = 110309,
  },
  [5] = {
    Condition = 110313,
    Function = "PlaySE",
    SEId = 110312,
  },
}
r6_0.TaskId = 110355
r4_0[110355] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_222,
  [2] = {
    Function = "PlaySE",
    SEId = 110310,
    SceneSe = true,
  },
}
r6_0.TaskId = 110356
r4_0[110356] = r6_0
r4_0[110357] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_222,
  },
  TaskId = 110357,
}
r4_0[110411] = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small180",
  TaskEffects = {
    [1] = r0_0.RT_223,
    [2] = r0_0.RT_181,
    [3] = r0_0.RT_188,
    [4] = r0_0.RT_79,
  },
  TaskId = 110411,
}
r6_0 = {
  ExtraBPFilter = "Common_Random",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle180",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_223,
  [2] = {
    Function = "GrabTarget",
    MySocketName = "hook_arm_r_Qiuxian",
  },
  [3] = {
    Condition = 110401,
    Delay = 0.05,
    Function = "SpawnDrop",
    UnitId = 1003,
    UnitType = "Drop",
  },
}
r6_0.TaskId = 110412
r4_0[110412] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 110401,
    Function = "RemoveSkillCreature",
  },
  [2] = {
    Function = "ReleaseTarget",
  },
}
r6_0.TaskId = 110413
r4_0[110413] = r6_0
r6_0 = {
  HatredIncrement = 40,
  NotifyName = r0_0.RT_12,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_223,
  [2] = {
    CauseHit = "HeavyHit_200",
    Function = "CutToughness",
    Value = 50,
  },
}
r6_0.TaskId = 110414
r4_0[110414] = r6_0
r4_0[110415] = {
  HatredIncrement = 40,
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_223,
    [2] = r0_0.RT_156,
  },
  TaskId = 110415,
}
r6_0 = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 110401,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 110416
r4_0[110416] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "Skill02_Addbuff",
    PassiveEffectId = 110401,
  },
}
r6_0.TaskId = 110421
r4_0[110421] = r6_0
r4_0[110451] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Rectangle_Large",
  TaskEffects = {
    [1] = r0_0.RT_225,
    [2] = r0_0.RT_156,
  },
  TaskId = 110451,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Large180",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_224,
    Function = "Damage",
    Rate = 0.5,
    TriggerProbability = 1,
  },
  [2] = r0_0.RT_156,
}
r6_0.TaskId = 110461
r4_0[110461] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 110471,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 110471
r4_0[110471] = r6_0
r4_0[110472] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_225,
    [2] = r0_0.RT_226,
  },
  TaskId = 110472,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 110471,
    Function = "CallBackSkillCreature",
    IsFollowing = true,
    MinDistance = 100,
    TargetSocket = "hook_arm_r",
    TargetSocketLocation = r0_0.RT_193,
  },
}
r6_0.TaskId = 110473
r4_0[110473] = r6_0
r4_0[120111] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small180",
  TaskEffects = {
    [1] = r0_0.RT_230,
    [2] = r0_0.RT_39,
  },
  TaskId = 120111,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 120101,
    Condition = 120102,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 120112
r4_0[120112] = r6_0
r5_0 = 120113
r6_0 = {
  TargetFilter = "Self",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 120112,
  Function = "CreateSkillCreature",
  Location = {
    0,
    400,
    0
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 120113
r4_0[r5_0] = r6_0
r6_0 = {
  TargetFilter = "Char_Cylinder_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_230,
  [2] = r0_0.RT_39,
  [3] = {
    FXId = 120101,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 120114
r4_0[120114] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHp",
    DamageType = "HpConsume",
    Function = "Damage",
    Rate = 0.25,
  },
  [2] = r0_0.RT_231,
}
r6_0.TaskId = 120121
r4_0[120121] = r6_0
r4_0[120122] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "AlmostAllOtFr",
  TaskEffects = {
    [1] = r0_0.RT_232,
    [2] = r0_0.RT_231,
  },
  TaskId = 120122,
}
r4_0[120123] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Large",
  TaskEffects = r0_0.RT_236,
  TaskId = 120123,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Condition = 120101,
    Function = "ExecutePassiveFunction",
    FunctionName = "ExecuteSkill02ExtraEffect",
    PassiveEffectId = 120101,
  },
}
r6_0.TaskId = 120124
r4_0[120124] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 120121,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 120125
r4_0[120125] = r6_0
r4_0[120126] = {
  TargetFilter = "Char_Cylinder_Large",
  TaskEffects = r0_0.RT_236,
  TaskId = 120126,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 120101,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 120127
r4_0[120127] = r6_0
r6_0 = {
  TargetFilter = "Char_Cylinder_Large",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_233,
    Function = "Damage",
    Rate = 1,
  },
  [2] = {
    CauseHit = "LightHit_50",
    Function = "CutToughness",
    Value = 10,
  },
  [3] = r0_0.RT_112,
}
r6_0.TaskId = 120128
r4_0[120128] = r6_0
r5_0 = 120131
r6_0 = {
  TargetFilter = "Self",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 120131,
  Function = "CreateSkillCreature",
  Location = {
    0,
    400,
    -100
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 120131
r4_0[r5_0] = r6_0
r4_0[120132] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_239,
  TaskId = 120132,
}
r4_0[120133] = {
  TargetFilter = "AlmostAllOtFr",
  TaskEffects = r0_0.RT_239,
  TaskId = 120133,
}
r5_0 = 120134
r6_0 = {
  TargetFilter = "Char_Cylinder_Small",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  BaseAttr = "ATK_Char",
  DamageTag = {
    "Skill",
    "Skill1",
    "ZhujueDark",
    "ZhujueDarkPassive"
  },
  Function = "Damage",
  Rate = 1,
}
r8_0[2] = r0_0.RT_39
r6_0[r7_0] = r8_0
r6_0.TaskId = 120134
r4_0[r5_0] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHp",
    DamageType = "Default",
    Function = "Heal",
    Rate = 0.01,
  },
}
r6_0.TaskId = 120135
r4_0[120135] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 120211,
    Function = "AddBuff",
    LastTime = -1,
  },
  [2] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "Falu_Skill01_On",
    PassiveEffectId = 120201,
  },
  [3] = {
    CreatureId = 120211,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 120211
r4_0[120211] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 120211,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 120212
r4_0[120212] = r6_0
r5_0 = 120213
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  BaseAttr = "ATK_Char",
  DamageTag = {
    "Skill",
    "Skill1",
    "Falu_Skill1"
  },
  Function = "Damage",
  Rate = 1,
}
r8_0[2] = r0_0.RT_123
r6_0[r7_0] = r8_0
r6_0.TaskId = 120213
r4_0[r5_0] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_240,
  [2] = {
    Function = "GatherTargets",
    GatherSpeed = 2000,
    LocationOffset = r0_0.RT_241,
    StopDistance = 100,
  },
}
r6_0.TaskId = 120214
r4_0[120214] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 120211,
    Function = "RemoveSkillCreature",
  },
  [2] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "Skill01_GatherTarget",
    PassiveEffectId = 120201,
  },
}
r6_0.TaskId = 120215
r4_0[120215] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_74,
    Function = "Damage",
    Rate = 0.5,
  },
  [2] = r0_0.RT_181,
  [3] = {
    CauseHit = "LightHit_50",
    Function = "CutToughness",
    Value = 30,
  },
  [4] = r0_0.RT_79,
}
r6_0.TaskId = 120221
r4_0[120221] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  NotifyName = r0_0.RT_9,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_74,
    Function = "Damage",
    Rate = 1,
  },
  [2] = r0_0.RT_181,
  [3] = {
    BossValue = 15,
    CauseHit = "HitFly_XY200Z300",
    Function = "CutToughness",
    Value = 15,
  },
  [4] = r0_0.RT_79,
}
r6_0.TaskId = 120222
r4_0[120222] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 120221,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_242,
  },
}
r6_0.TaskId = 120223
r4_0[120223] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_74,
    Function = "Damage",
    Rate = 1.5,
  },
  [2] = r0_0.RT_181,
  [3] = r0_0.RT_226,
  [4] = r0_0.RT_79,
}
r6_0.TaskId = 120224
r4_0[120224] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Sphere_Middle",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_180,
  [2] = {
    BossValue = 11,
    CauseHit = "HitFly_XY1000Z300_F",
    Function = "CutToughness",
    Value = 15,
  },
  [3] = r0_0.RT_63,
  [4] = r0_0.RT_243,
}
r6_0.TaskId = 150111
r4_0[150111] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  NotifyName = r0_0.RT_9,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_180,
  [2] = {
    BossValue = 28,
    CauseHit = "HitFly_XY800Z400_F",
    Function = "CutToughness",
    Value = 80,
  },
  [3] = {
    Function = "PlayFX",
    MaxHitFXNum = 8,
    WeaponFXGroupName = "Hit1",
  },
  [4] = r0_0.RT_65,
  [5] = r0_0.RT_244,
}
r6_0.TaskId = 150112
r4_0[150112] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 150102,
    Function = "AddBuff",
    LastTime = -1,
  },
  [2] = {
    BuffId = 150121,
    Delay = 1.7,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 150121
r4_0[150121] = r6_0
r6_0 = {
  EffectExecuteTiming = "Leave",
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 150102,
    Function = "RemoveBuff",
  },
  [2] = {
    BuffId = 150121,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 150122
r4_0[150122] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Large240_InAir",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_213,
  [2] = {
    BossValue = 50,
    CauseHit = "HitFly_XY800Z600_F",
    Function = "CutToughness",
    Value = 30,
  },
  [3] = r0_0.RT_244,
}
r6_0.TaskId = 150123
r4_0[150123] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small240",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_187,
  [2] = {
    BossValue = 42,
    CauseHit = "LightHit_100_F",
    Function = "CutToughness",
    Value = 25,
  },
  [3] = r0_0.RT_150,
  [4] = r0_0.RT_151,
  [5] = r0_0.RT_243,
}
r6_0.TaskId = 150131
r4_0[150131] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Rectangle_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_187,
  [2] = {
    BossValue = 49,
    CauseHit = "LightHit_150_F",
    Function = "CutToughness",
    Value = 25,
  },
  [3] = r0_0.RT_90,
  [4] = r0_0.RT_151,
  [5] = r0_0.RT_244,
}
r6_0.TaskId = 150132
r4_0[150132] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_187,
  [2] = {
    BossValue = 24,
    CauseHit = "HitFly_XY500Z300_F",
    Function = "CutToughness",
    Value = 15,
  },
  [3] = r0_0.RT_77,
  [4] = {
    Condition = 100,
    Dilation = 0.03,
    Duration = 0.05,
    Function = "HitStop",
  },
  [5] = r0_0.RT_243,
}
r6_0.TaskId = 150133
r4_0[150133] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle240",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_187,
  [2] = {
    BossValue = 30,
    CauseHit = "HitFly_XY400Z500_F",
    Function = "CutToughness",
    Value = 30,
  },
  [3] = {
    Function = "PlayFX",
    FxRotator = r0_0.RT_57,
    IsFaceToChar = true,
    MaxHitFXNum = 3,
    WeaponFXGroupName = "Hit",
  },
  [4] = r0_0.RT_151,
  [5] = r0_0.RT_244,
}
r6_0.TaskId = 150134
r4_0[150134] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  NotifyName = r0_0.RT_9,
  TargetFilter = "Char_Rectangle_Middle",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_187,
  [2] = {
    BossValue = 60,
    CauseHit = "HitFly_XY800Z600_F",
    Function = "CutToughness",
    Value = 80,
  },
  [3] = {
    Delay = 0.1,
    Function = "PlayFX",
    MaxHitFXNum = 5,
    WeaponFXGroupName = "Hit1",
  },
  [4] = {
    Delay = 0.05,
    Dilation = 0,
    Duration = 0.07,
    Function = "HitStop",
  },
  [5] = r0_0.RT_244,
}
r6_0.TaskId = 150135
r4_0[150135] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  NotifyName = r0_0.RT_12,
  TargetFilter = "Char_Rectangle_Middle",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_245,
  [2] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "ClearComboCount",
    PassiveEffectId = 150103,
  },
  [3] = {
    Delay = 0.1,
    Function = "PlayFX",
    MaxHitFXNum = 8,
    WeaponFXGroupName = "Hit1",
  },
  [4] = {
    BossValue = 120,
    CauseHit = "HitFly_XY800Z600_F",
    Function = "CutToughness",
    Value = 80,
  },
  [5] = r0_0.RT_58,
  [6] = r0_0.RT_244,
}
r6_0.TaskId = 150141
r4_0[150141] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "HeavyAttackStart",
    PassiveEffectId = 150101,
  },
  [2] = {
    Function = "ExecuteClientPassiveFunction",
    FunctionName = "CreateWarning",
  },
}
r6_0.TaskId = 150142
r4_0[150142] = r6_0
r6_0 = {
  EffectExecuteTiming = "Leave",
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecuteClientPassiveFunction",
    FunctionName = "RemoveWarning",
  },
}
r6_0.TaskId = 150143
r4_0[150143] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "HeavyAttackEnd",
    PassiveEffectId = 150101,
  },
}
r6_0.TaskId = 150144
r4_0[150144] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  NotifyName = r0_0.RT_13,
  TargetFilter = "Char_Cylinder_Small240",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_245,
  [2] = {
    BossValue = 50,
    CauseHit = "HitFly_XY200Z500_F",
    Function = "CutToughness",
    Value = 30,
  },
  [3] = {
    Function = "PlayFX",
    FxRotator = r0_0.RT_57,
    IsFaceToChar = true,
    MaxHitFXNum = 5,
    WeaponFXGroupName = "Hit",
  },
  [4] = r0_0.RT_151,
  [5] = r0_0.RT_244,
}
r6_0.TaskId = 150145
r4_0[150145] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_247,
  [2] = {
    FXId = 150101,
    Function = "PlayFX",
  },
  [3] = {
    CauseHit = "LightHit",
    Delay = 0.1,
    Function = "CutToughness",
    Value = 45,
  },
  [4] = r0_0.RT_248,
  [5] = r0_0.RT_249,
  [6] = r0_0.RT_243,
  [7] = {
    FeedbackPath = "FE_Light_R_Big",
    Function = "PlayForceFeedback",
    Tag = "Hit",
  },
  [8] = {
    Condition = 150141,
    Function = "CameraShake",
    ShakeClass = "BP_CS_BaoNu_Cast_001",
  },
  [9] = {
    Condition = 150104,
    Function = "CameraShake",
    ShakeClass = "BP_CS_BaoNu_Cast_002",
  },
}
r6_0.TaskId = 150151
r4_0[150151] = r6_0
r6_0 = {
  ExtraBPFilter = "Nifu_Skill01_Search",
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Large",
}
r6_0.TaskEffects = {
  [1] = {
    BaseChar = "Target",
    Condition = 150201,
    CreatureId = 150201,
    DefaultLocationOffset = r0_0.RT_254,
    Function = "CreateSkillCreature",
  },
  [2] = {
    BaseChar = "Target",
    Condition = 150203,
    CreatureId = 150203,
    DefaultLocationOffset = r0_0.RT_254,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 150211
r4_0[150211] = r6_0
r6_0 = {
  ExtraBPFilter = "Nifu_Skill01_Search",
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Large",
}
r6_0.TaskEffects = {
  [1] = {
    BaseChar = "Target",
    Condition = 150202,
    CreatureId = 150202,
    DefaultLocationOffset = r0_0.RT_255,
    Function = "CreateSkillCreature",
  },
  [2] = {
    BaseChar = "Target",
    Condition = 150204,
    CreatureId = 150204,
    DefaultLocationOffset = r0_0.RT_255,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 150212
r4_0[150212] = r6_0
r5_0 = 150213
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Small",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  BaseAttr = "ATK_Char",
  DamageTag = {
    "Skill",
    "Skill1",
    "NifuLight"
  },
  DamageType = "Light",
  Function = "Damage",
  Rate = "#1",
  TriggerProbability = "$Source:GetRootSource():GetFloat(\'Skill04TriggerRate\')$",
}
r8_0[2] = r0_0.RT_256
r8_0[3] = r0_0.RT_257
r8_0[4] = {
  CanBeScaled = true,
  FXId = 150201,
  Function = "PlayFX",
}
r8_0[5] = r0_0.RT_258
r8_0[6] = r0_0.RT_259
r8_0[7] = r0_0.RT_260
r6_0[r7_0] = r8_0
r6_0.TaskId = 150213
r4_0[r5_0] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Large",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_262,
  [2] = {
    BossValue = 150,
    CauseHit = "HitFly_XY0Z500",
    Function = "CutToughness",
    Value = 100,
  },
  [3] = r0_0.RT_257,
  [4] = {
    CanBeScaled = true,
    FXId = 150202,
    Function = "PlayFX",
  },
  [5] = r0_0.RT_263,
  [6] = r0_0.RT_264,
  [7] = r0_0.RT_260,
}
r6_0.TaskId = 150214
r4_0[150214] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 150201,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 150215
r4_0[150215] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 150201,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 150216
r4_0[150216] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 150201,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 150217
r4_0[150217] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 150202,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 150218
r4_0[150218] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "AddbuffSkill02",
    PassiveEffectId = 150201,
  },
}
r6_0.TaskId = 150221
r4_0[150221] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 150203,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 150222
r4_0[150222] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 150203,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 150223
r4_0[150223] = r6_0
r5_0 = 150224
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Middle",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  BaseAttr = "ATK_Char",
  DamageTag = {
    "Skill",
    "Skill1",
    "NifuLight",
    "NifuSpLight"
  },
  DamageType = "Light",
  Function = "Damage",
  Rate = "#1",
  TriggerProbability = "$Source:GetRootSource():GetFloat(\'Skill04TriggerRate\')$",
}
r8_0[2] = r0_0.RT_256
r8_0[3] = r0_0.RT_257
r8_0[4] = {
  FXId = 150203,
  Function = "PlayFX",
}
r8_0[5] = r0_0.RT_263
r8_0[6] = r0_0.RT_259
r8_0[7] = r0_0.RT_260
r6_0[r7_0] = r8_0
r6_0.TaskId = 150224
r4_0[r5_0] = r6_0
r5_0 = 150225
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Large",
}
r7_0 = "TaskEffects"
r8_0 = {
  [1] = r0_0.RT_262,
}
r8_0[2] = {
  Function = "GatherTargets",
  GatherSpeed = 2000,
  LocationOffset = {
    0,
    0,
    200
  },
  StopDistance = 50,
}
r8_0[3] = r0_0.RT_257
r8_0[4] = {
  FXId = 150204,
  Function = "PlayFX",
}
r8_0[5] = r0_0.RT_258
r8_0[6] = r0_0.RT_264
r8_0[7] = r0_0.RT_260
r6_0[r7_0] = r8_0
r6_0.TaskId = 150225
r4_0[r5_0] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseChar = "Target",
    CreatureId = 150201,
    DefaultLocationOffset = r0_0.RT_254,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 150231
r4_0[150231] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseChar = "Target",
    CreatureId = 150202,
    DefaultLocationOffset = r0_0.RT_255,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 150232
r4_0[150232] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 150301,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_146,
  },
  [2] = {
    CanBeScaled = true,
    FXId = 150312,
    Function = "PlayFX",
  },
  [3] = {
    Condition = 43,
    FXId = 150313,
    Function = "PlayFX",
  },
  [4] = r0_0.RT_265,
  [5] = {
    BaseChar = "Target",
    Function = "PlaySE",
    SEId = 150307,
  },
  [6] = {
    FeedbackPath = "FE_Loop_Light",
    Function = "PlayForceFeedback",
    Tag = "Hit",
  },
}
r6_0.TaskId = 150311
r4_0[150311] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_large",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_180,
  [2] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_179,
    Delay = 0.2,
    Function = "Damage",
    Rate = "#2",
  },
  [3] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_179,
    Delay = 0.4,
    Function = "Damage",
    Rate = "#3",
  },
  [4] = r0_0.RT_266,
  [5] = {
    Delay = 0.2,
    FXId = 150314,
    Function = "PlayFX",
  },
  [6] = {
    Delay = 0.4,
    FXId = 150314,
    Function = "PlayFX",
  },
  [7] = {
    FXId = 150315,
    Function = "PlayFX",
  },
  [8] = r0_0.RT_267,
  [9] = {
    Delay = 0.2,
    Function = "PlaySE",
    SEId = 150308,
  },
  [10] = {
    Delay = 0.4,
    Function = "PlaySE",
    SEId = 150308,
  },
}
r6_0.TaskId = 150312
r4_0[150312] = r6_0
r5_0 = 150321
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Target",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 150322,
  Function = "CreateSkillCreature",
  Location = {
    223,
    -429,
    500
  },
  Rotation = {
    -78,
    -116,
    116
  },
}
r8_0[2] = {
  CreatureId = 150324,
  Function = "CreateSkillCreature",
  Location = {
    -537,
    -677,
    500
  },
  Rotation = {
    -98,
    -65,
    10
  },
}
r8_0[3] = {
  CreatureId = 150324,
  Function = "CreateSkillCreature",
  Location = {
    -312,
    523,
    500
  },
  Rotation = {
    -77,
    20,
    -5
  },
}
r8_0[4] = {
  CreatureId = 150323,
  Delay = 0.3,
  Function = "CreateSkillCreature",
  Location = {
    571,
    483,
    500
  },
  Rotation = {
    -78,
    -62,
    168
  },
}
r8_0[5] = {
  CreatureId = 150324,
  Delay = 0.4,
  Function = "CreateSkillCreature",
  Location = {
    741,
    142,
    500
  },
  Rotation = {
    -72,
    257,
    -241
  },
}
r8_0[6] = {
  CreatureId = 150322,
  Delay = 0.5,
  Function = "CreateSkillCreature",
  Location = {
    998,
    -328,
    500
  },
  Rotation = {
    -98,
    -104,
    135
  },
}
r8_0[7] = {
  CreatureId = 150324,
  Delay = 0.6,
  Function = "CreateSkillCreature",
  Location = {
    146,
    -1003,
    500
  },
  Rotation = {
    -101,
    -68,
    73
  },
}
r8_0[8] = {
  CreatureId = 150321,
  Delay = 0.9,
  Function = "CreateSkillCreature",
  Location = {
    -628,
    -704,
    500
  },
  Rotation = {
    -73,
    -47,
    7
  },
}
r8_0[9] = {
  CreatureId = 150324,
  Delay = 0.8,
  Function = "CreateSkillCreature",
  Location = {
    546,
    -813,
    500
  },
  Rotation = {
    -71,
    -78,
    77
  },
}
r8_0[10] = {
  CreatureId = 150322,
  Delay = 0.8,
  Function = "CreateSkillCreature",
  Location = {
    -546,
    -853,
    500
  },
  Rotation = {
    -102,
    -78,
    77
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 150321
r4_0[r5_0] = r6_0
r5_0 = 150322
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Target",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 150323,
  Delay = 0.7,
  Function = "CreateSkillCreature",
  Location = {
    -896,
    373,
    500
  },
  Rotation = {
    -75,
    63,
    64
  },
}
r8_0[2] = {
  CreatureId = 150322,
  Delay = 0.1,
  Function = "CreateSkillCreature",
  Location = {
    -568,
    1102,
    500
  },
  Rotation = {
    -64,
    47,
    -43
  },
}
r8_0[3] = {
  CreatureId = 150321,
  Delay = 0.2,
  Function = "CreateSkillCreature",
  Location = {
    126,
    1138,
    500
  },
  Rotation = {
    -98,
    101,
    -71
  },
}
r8_0[4] = {
  CreatureId = 150321,
  Delay = 0.3,
  Function = "CreateSkillCreature",
  Location = {
    1047,
    618,
    500
  },
  Rotation = {
    -102,
    64,
    173
  },
}
r8_0[5] = {
  CreatureId = 150321,
  Delay = 0.4,
  Function = "CreateSkillCreature",
  Location = {
    -845,
    762,
    500
  },
  Rotation = {
    -71,
    62,
    -3
  },
}
r8_0[6] = {
  CreatureId = 150323,
  Delay = 0.9,
  Function = "CreateSkillCreature",
  Location = {
    965,
    -995,
    500
  },
  Rotation = {
    -105,
    101,
    109
  },
}
r8_0[7] = {
  CreatureId = 150322,
  Delay = 0.8,
  Function = "CreateSkillCreature",
  Location = {
    624,
    1111,
    500
  },
  Rotation = {
    -108,
    -199,
    197
  },
}
r8_0[8] = {
  CreatureId = 150322,
  Delay = 0.8,
  Function = "CreateSkillCreature",
  Location = {
    904,
    721,
    500
  },
  Rotation = {
    -98,
    199,
    197
  },
}
r8_0[9] = {
  CreatureId = 150324,
  Delay = 0.6,
  Function = "CreateSkillCreature",
  Location = {
    -183,
    1275,
    500
  },
  Rotation = {
    -66,
    51,
    -45
  },
}
r8_0[10] = {
  CreatureId = 150321,
  Delay = 0.9,
  Function = "CreateSkillCreature",
  Location = {
    -578,
    -100,
    500
  },
  Rotation = {
    -83,
    -50,
    7
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 150322
r4_0[r5_0] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 150325,
    Function = "AddBuff",
    LastTime = -1,
  },
  [2] = {
    AttrRates = r0_0.RT_1,
    Function = "CreateUnit",
    LifeTime = -1,
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 150302,
    UnitType = "MechanismSummon",
  },
  [3] = r0_0.RT_268,
  [4] = r0_0.RT_269,
}
r6_0.TaskId = 150325
r4_0[150325] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_Middle",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_213,
  [2] = r0_0.RT_270,
  [3] = {
    CorrectDirection = true,
    FXId = 150307,
    Function = "PlayFX",
    IsAttached = true,
    NormalToHit = true,
  },
  [4] = r0_0.RT_266,
  [5] = r0_0.RT_271,
}
r6_0.TaskId = 150326
r4_0[150326] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_Middle",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_213,
  [2] = r0_0.RT_270,
  [3] = {
    CorrectDirection = true,
    FXId = 150309,
    Function = "PlayFX",
    IsAttached = true,
    NormalToHit = true,
  },
  [4] = r0_0.RT_266,
  [5] = r0_0.RT_271,
}
r6_0.TaskId = 150327
r4_0[150327] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 150325,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Kezhou_Skill02_Loop",
  },
}
r6_0.TaskId = 150328
r4_0[150328] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "PlaySE",
    SEId = 150305,
    SceneSe = true,
  },
}
r6_0.TaskId = 150329
r4_0[150329] = r6_0
r4_0[150331] = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_269,
  },
  TaskId = 150331,
}
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 150321,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 150332
r4_0[150332] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 150322,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 150333
r4_0[150333] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 150323,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 150334
r4_0[150334] = r6_0
r4_0[150335] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
  TaskEffects = r0_0.RT_275,
  TaskId = 150335,
}
r4_0[150336] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
  TaskEffects = {
    [1] = r0_0.RT_272,
    [2] = r0_0.RT_273,
    [3] = r0_0.RT_274,
    [4] = r0_0.RT_271,
  },
  TaskId = 150336,
}
r4_0[150337] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
  TaskEffects = r0_0.RT_275,
  TaskId = 150337,
}
r4_0[150338] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
  TaskEffects = {
    [1] = r0_0.RT_272,
    [2] = r0_0.RT_273,
    [3] = r0_0.RT_274,
    [4] = r0_0.RT_168,
  },
  TaskId = 150338,
}
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 150320,
    Function = "RemoveBuff",
  },
  [2] = {
    BuffId = 150321,
    Function = "RemoveBuff",
  },
  [3] = {
    BuffId = 150322,
    Function = "RemoveBuff",
  },
  [4] = {
    BuffId = 150323,
    Function = "RemoveBuff",
  },
  [5] = {
    BuffId = 150324,
    Function = "RemoveBuff",
  },
  [6] = {
    BuffId = 150325,
    Function = "RemoveBuff",
  },
  [7] = r0_0.RT_268,
}
r6_0.TaskId = 150340
r4_0[150340] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 150321,
    Function = "CallBackSkillCreature",
    IsFollowing = true,
    MinDistance = 10,
    SetSpeed = 0,
    TargetSocket = "hook_arm_r",
    TargetSocketLocation = r0_0.RT_193,
  },
  [2] = {
    CreatureId = 150322,
    Function = "CallBackSkillCreature",
    IsFollowing = true,
    MinDistance = 10,
    SetSpeed = 0,
    TargetSocket = "hook_arm_r",
    TargetSocketLocation = r0_0.RT_193,
  },
  [3] = {
    CreatureId = 150323,
    Function = "CallBackSkillCreature",
    IsFollowing = true,
    MinDistance = 10,
    SetSpeed = 0,
    TargetSocket = "hook_arm_r",
    TargetSocketLocation = r0_0.RT_193,
  },
  [4] = {
    CreatureId = 150324,
    Function = "CallBackSkillCreature",
    IsFollowing = true,
    MinDistance = 10,
    SetSpeed = 0,
    TargetSocket = "hook_arm_r",
    TargetSocketLocation = r0_0.RT_193,
  },
  [5] = {
    CreatureId = 150325,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 150341
r4_0[150341] = r6_0
r5_0 = 150342
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 150332,
  Function = "CreateSkillCreature",
  Location = {
    0,
    100,
    160
  },
  Rotation = {
    -10,
    0,
    0
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 150342
r4_0[r5_0] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_large",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_213,
  [2] = {
    BossValue = 100,
    CauseHit = "RangedWeapon_Common",
    Function = "CutToughness",
    Value = 100,
  },
  [3] = r0_0.RT_266,
  [4] = {
    CanBeScaled = true,
    FXId = 150324,
    Function = "PlayFX",
  },
  [5] = {
    Falloff = 0.1,
    Function = "CameraShake",
    IsSceneCameraShake = true,
    OuterRadius = 1000,
    ShakeClass = "BP_CS_Kezhou_Skill02_Off",
  },
  [6] = r0_0.RT_59,
  [7] = {
    FeedbackPath = "FE_Medium_R",
    Function = "PlayForceFeedback",
    Tag = "Hit",
  },
}
r6_0.TaskId = 150343
r4_0[150343] = r6_0
r5_0 = 150344
r6_0 = {}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  BaseChar = "Self",
  CreatureId = 150333,
  Function = "CreateSkillCreature",
  IsAttached = true,
  Location = {
    30,
    30,
    50
  },
  Rotation = {
    60,
    60,
    60
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 150344
r4_0[r5_0] = r6_0
r5_0 = 150345
r6_0 = {
  TargetFilter = "Target",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  BaseAttr = "ATK_Char",
  DamageTag = {
    "Skill",
    "Skill2",
    "KezhouShadowSword"
  },
  Function = "Damage",
  Rate = "#1",
}
r8_0[2] = {
  BossValue = 3,
  CauseHit = "RangedWeapon_Common",
  Function = "CutToughness",
  Value = 10,
}
r8_0[3] = r0_0.RT_267
r8_0[4] = {
  FXId = 150326,
  Function = "PlayFX",
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 150345
r4_0[r5_0] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "LaunchShadowSword",
    PassiveEffectId = 150301,
  },
}
r6_0.TaskId = 150346
r4_0[150346] = r6_0
r4_0[150351] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small180",
  TaskEffects = {
    [1] = r0_0.RT_272,
    [2] = r0_0.RT_170,
    [3] = r0_0.RT_164,
    [4] = r0_0.RT_273,
    [5] = r0_0.RT_49,
  },
  TaskId = 150351,
}
r5_0 = 150352
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small180",
}
r7_0 = "TaskEffects"
r8_0 = {
  [1] = r0_0.RT_272,
}
r8_0[2] = {
  Function = "PlayFX",
  FxRotator = {
    -40,
    90,
    0
  },
  IsFaceToChar = true,
  WeaponFXGroupName = "Hit",
}
r8_0[3] = {
  CauseHit = "HitFly_XY400Z400_F",
  Function = "CutToughness",
  Value = 20,
}
r8_0[4] = r0_0.RT_273
r8_0[5] = r0_0.RT_49
r6_0[r7_0] = r8_0
r6_0.TaskId = 150352
r4_0[r5_0] = r6_0
r5_0 = 150353
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small180",
}
r7_0 = "TaskEffects"
r8_0 = {
  [1] = r0_0.RT_272,
}
r8_0[2] = {
  Function = "PlayFX",
  FxRotator = {
    70,
    90,
    0
  },
  IsFaceToChar = true,
  WeaponFXGroupName = "Hit",
}
r8_0[3] = r0_0.RT_85
r8_0[4] = r0_0.RT_273
r8_0[5] = r0_0.RT_49
r6_0[r7_0] = r8_0
r6_0.TaskId = 150353
r4_0[r5_0] = r6_0
r5_0 = 150354
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Target",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 150341,
  Function = "CreateSkillCreature",
  Location = {
    0,
    50,
    45
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 150354
r4_0[r5_0] = r6_0
r4_0[150355] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_272,
    [2] = r0_0.RT_276,
    [3] = r0_0.RT_165,
    [4] = r0_0.RT_49,
    [5] = r0_0.RT_119,
  },
  TaskId = 150355,
}
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle180",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_277,
  [2] = r0_0.RT_62,
  [3] = r0_0.RT_38,
  [4] = {
    CauseHit = "HitFly_XY800Z400_F",
    Function = "CutToughness",
    Value = 80,
  },
  [5] = r0_0.RT_65,
  [6] = r0_0.RT_59,
}
r6_0.TaskId = 150356
r4_0[150356] = r6_0
r4_0[150357] = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_68,
  TaskId = 150357,
}
r4_0[150358] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle",
  TaskEffects = r0_0.RT_280,
  TaskId = 150358,
}
r4_0[150359] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
  TaskEffects = r0_0.RT_282,
  TaskId = 150359,
}
r4_0[150361] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
  TaskEffects = {
    [1] = r0_0.RT_272,
    [2] = r0_0.RT_38,
    [3] = r0_0.RT_129,
    [4] = r0_0.RT_130,
    [5] = r0_0.RT_271,
  },
  TaskId = 150361,
}
r4_0[150362] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
  TaskEffects = r0_0.RT_283,
  TaskId = 150362,
}
r5_0 = 150363
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Target",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 150342,
  Function = "CreateSkillCreature",
  Location = {
    0,
    45,
    45
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 150363
r4_0[r5_0] = r6_0
r4_0[150364] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
  TaskEffects = r0_0.RT_283,
  TaskId = 150364,
}
r4_0[150365] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
  TaskEffects = {
    [1] = r0_0.RT_272,
    [2] = r0_0.RT_38,
    [3] = r0_0.RT_92,
    [4] = r0_0.RT_65,
    [5] = r0_0.RT_271,
  },
  TaskId = 150365,
}
r4_0[150366] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_272,
    [2] = r0_0.RT_276,
    [3] = r0_0.RT_165,
    [4] = r0_0.RT_271,
    [5] = r0_0.RT_119,
  },
  TaskId = 150366,
}
r6_0 = {
  AttackRangeType = "Normal",
  NotifyName = r0_0.RT_2,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 150343,
    Function = "CreateSkillCreature",
  },
  [2] = {
    CreatureId = 150343,
    Function = "CreateSkillCreature",
    Rotation = r0_0.RT_140,
  },
  [3] = {
    CreatureId = 150343,
    Function = "CreateSkillCreature",
    Rotation = r0_0.RT_141,
  },
  [4] = {
    CreatureId = 150343,
    Function = "CreateSkillCreature",
    Rotation = r0_0.RT_142,
  },
  [5] = {
    CreatureId = 150343,
    Function = "CreateSkillCreature",
    Rotation = r0_0.RT_143,
  },
  [6] = r0_0.RT_62,
}
r6_0.TaskId = 150367
r4_0[150367] = r6_0
r4_0[150368] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_277,
    [2] = r0_0.RT_276,
    [3] = r0_0.RT_111,
    [4] = r0_0.RT_49,
    [5] = r0_0.RT_119,
  },
  TaskId = 150368,
}
r4_0[150369] = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_68,
  TaskId = 150369,
}
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_278,
  [2] = r0_0.RT_38,
  [3] = r0_0.RT_158,
  [4] = r0_0.RT_49,
  [5] = r0_0.RT_72,
  [6] = {
    CreatureId = 150344,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_146,
  },
}
r6_0.TaskId = 150370
r4_0[150370] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Large",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_278,
  [2] = r0_0.RT_38,
  [3] = {
    CauseHit = "HitFly_XY600Z600",
    Function = "CutToughness",
    Value = 35,
  },
  [4] = r0_0.RT_49,
  [5] = r0_0.RT_72,
}
r6_0.TaskId = 150371
r4_0[150371] = r6_0
r4_0[150372] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_149,
  TaskId = 150372,
}
r4_0[150373] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
  TaskEffects = r0_0.RT_282,
  TaskId = 150373,
}
r4_0[150381] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small240",
  TaskEffects = {
    [1] = r0_0.RT_272,
    [2] = r0_0.RT_172,
    [3] = r0_0.RT_177,
    [4] = r0_0.RT_151,
    [5] = r0_0.RT_49,
  },
  TaskId = 150381,
}
r4_0[150382] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small180",
  TaskEffects = {
    [1] = r0_0.RT_272,
    [2] = r0_0.RT_285,
    [3] = r0_0.RT_177,
    [4] = r0_0.RT_151,
    [5] = r0_0.RT_49,
  },
  TaskId = 150382,
}
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small240",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_272,
  [2] = r0_0.RT_287,
  [3] = {
    CauseHit = "LightHit_100_F",
    Function = "CutToughness",
    Value = 60,
  },
  [4] = r0_0.RT_151,
  [5] = r0_0.RT_49,
}
r6_0.TaskId = 150383
r4_0[150383] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_272,
  [2] = r0_0.RT_38,
  [3] = {
    CauseHit = "HitFly_XY400Z300",
    Function = "CutToughness",
    Value = 80,
  },
  [4] = r0_0.RT_151,
  [5] = r0_0.RT_49,
}
r6_0.TaskId = 150384
r4_0[150384] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_277,
  [2] = r0_0.RT_170,
  [3] = {
    CauseHit = "HitFly_XY200Z300",
    Function = "CutToughness",
    Value = 30,
  },
  [4] = r0_0.RT_65,
  [5] = r0_0.RT_59,
}
r6_0.TaskId = 150385
r4_0[150385] = r6_0
r4_0[150386] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_9,
  TargetFilter = "Char_Cylinder_Middle",
  TaskEffects = {
    [1] = r0_0.RT_277,
    [2] = r0_0.RT_62,
    [3] = r0_0.RT_172,
    [4] = r0_0.RT_161,
    [5] = r0_0.RT_79,
    [6] = r0_0.RT_59,
  },
  TaskId = 150386,
}
r4_0[150387] = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_68,
  TaskId = 150387,
}
r4_0[150388] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle",
  TaskEffects = r0_0.RT_280,
  TaskId = 150388,
}
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_281,
  [2] = r0_0.RT_288,
  [3] = {
    CauseHit = "HitFly_XY600Z400_F",
    Function = "CutToughness",
    Value = 20,
  },
  [4] = r0_0.RT_79,
  [5] = r0_0.RT_49,
}
r6_0.TaskId = 150389
r4_0[150389] = r6_0
r4_0[150391] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small240",
  TaskEffects = {
    [1] = r0_0.RT_272,
    [2] = r0_0.RT_172,
    [3] = r0_0.RT_85,
    [4] = r0_0.RT_168,
  },
  TaskId = 150391,
}
r4_0[150392] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small180",
  TaskEffects = {
    [1] = r0_0.RT_272,
    [2] = r0_0.RT_285,
    [3] = r0_0.RT_138,
    [4] = r0_0.RT_168,
  },
  TaskId = 150392,
}
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small240",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_272,
  [2] = r0_0.RT_287,
  [3] = {
    CauseHit = "HitFly_XY200Z300_B",
    Delay = 0.1,
    Function = "CutToughness",
    Value = 60,
  },
  [4] = r0_0.RT_151,
  [5] = r0_0.RT_168,
}
r6_0.TaskId = 150393
r4_0[150393] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_272,
  [2] = r0_0.RT_38,
  [3] = {
    CauseHit = "HitFly_XY500Z300_F",
    Function = "CutToughness",
    Value = 80,
  },
  [4] = r0_0.RT_168,
}
r6_0.TaskId = 150394
r4_0[150394] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_277,
  [2] = r0_0.RT_170,
  [3] = {
    CauseHit = "LightHit",
    Function = "CutToughness",
    Value = 15,
  },
  [4] = r0_0.RT_171,
}
r6_0.TaskId = 150395
r4_0[150395] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_9,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_277,
  [2] = r0_0.RT_62,
  [3] = r0_0.RT_172,
  [4] = {
    CauseHit = "HitFly_XY500Z300_F",
    Function = "CutToughness",
    Value = 200,
  },
  [5] = r0_0.RT_79,
  [6] = r0_0.RT_59,
}
r6_0.TaskId = 150396
r4_0[150396] = r6_0
r4_0[150397] = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_68,
  TaskId = 150397,
}
r4_0[150398] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle",
  TaskEffects = {
    [1] = r0_0.RT_278,
    [2] = r0_0.RT_38,
    [3] = r0_0.RT_279,
    [4] = r0_0.RT_72,
    [5] = r0_0.RT_59,
  },
  TaskId = 150398,
}
r4_0[150399] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
  TaskEffects = {
    [1] = r0_0.RT_281,
    [2] = r0_0.RT_288,
    [3] = r0_0.RT_129,
    [4] = r0_0.RT_65,
    [5] = r0_0.RT_59,
  },
  TaskId = 150399,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecuteClientPassiveFunction",
    FunctionName = "StartJetRush",
  },
  [2] = {
    CreatureId = 150401,
    Function = "CreateSkillCreature",
  },
  [3] = {
    BuffId = 150407,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 150412
r4_0[150412] = r6_0
r4_0[150413] = {
  EffectExecuteTiming = "Leave",
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_289,
  },
  TaskId = 150413,
}
r4_0[150414] = {
  HatredIncrement = 40,
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_240,
    [2] = r0_0.RT_104,
    [3] = r0_0.RT_123,
    [4] = r0_0.RT_290,
    [5] = r0_0.RT_291,
  },
  TaskId = 150414,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Char_Cylinder_Large",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_240,
  [2] = {
    CauseHit = "HitFly_XY800Z600_F",
    Function = "CutToughness",
    Value = 100,
  },
  [3] = r0_0.RT_123,
  [4] = r0_0.RT_291,
}
r6_0.TaskId = 150415
r4_0[150415] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 150401,
    Function = "RemoveSkillCreature",
  },
  [2] = {
    BuffId = 150411,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 150416
r4_0[150416] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 150401,
    Function = "AddBuff",
    LastTime = -1,
  },
  [2] = {
    BuffId = 150404,
    Function = "AddBuff",
    LastTime = -1,
  },
  [3] = {
    Function = "AddBullet",
    TotalBullet = 1,
    UltraWeapon = r0_0.RT_292,
    Value = -99999,
  },
  [4] = {
    Function = "AddBullet",
    TotalBullet = 1,
    UltraWeapon = r0_0.RT_292,
    Value = "$Source:GetInt(\'Skill02BulletNum\')$",
  },
  [5] = r0_0.RT_127,
}
r6_0.TaskId = 150421
r4_0[150421] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 150401,
    Function = "RemoveBuff",
  },
  [2] = {
    BuffId = 150403,
    Function = "RemoveBuff",
  },
  [3] = {
    BuffId = 150404,
    Function = "RemoveBuff",
  },
  [4] = {
    BuffId = 150406,
    Function = "RemoveBuff",
  },
  [5] = r0_0.RT_289,
}
r6_0.TaskId = 150422
r4_0[150422] = r6_0
r5_0 = 150425
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  ATKBase = "ATK_Ultra",
  Condition = 150402,
  CreatureId = 150421,
  Direction = "Camera",
  Distance = 2000,
  Function = "CreateSkillCreature",
  Location = {
    50,
    50,
    150
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 150425
r4_0[r5_0] = r6_0
r6_0 = {
  AttackRangeType = "Bullet",
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_294,
  [2] = {
    CauseHit = "HitFly_XY0Z500",
    Function = "CutToughness",
    Value = 50,
  },
  [3] = r0_0.RT_175,
}
r6_0.TaskId = 150426
r4_0[150426] = r6_0
r6_0 = {
  AttackRangeType = "Bullet",
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_Xlarge",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_294,
  [2] = r0_0.RT_104,
  [3] = {
    CanBeScaled = true,
    FXId = 150461,
    Function = "PlayFX",
  },
  [4] = r0_0.RT_175,
}
r6_0.TaskId = 150427
r4_0[150427] = r6_0
r5_0 = 150431
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  Function = "StartLoopShoot",
  LoopInterval = 0.3,
  LoopShootId = 150431,
  SkillEffect = {
    150433,
    150436
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 150431
r4_0[r5_0] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "EndLoopShoot",
    LoopShootId = 150431,
  },
  [2] = r0_0.RT_295,
}
r6_0.TaskId = 150432
r4_0[150432] = r6_0
r6_0 = {
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_296,
  [2] = {
    CreatureId = 150402,
    Direction = "Camera",
    Function = "CreateSkillCreature",
    UseSaveLoc = "SuyiShoot",
  },
  [3] = r0_0.RT_297,
}
r6_0.TaskId = 150433
r4_0[150433] = r6_0
r6_0 = {
  AttackRangeType = "Bullet",
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_299,
  [2] = {
    FXId = 150422,
    Function = "PlayFX",
  },
  [3] = r0_0.RT_300,
  [4] = r0_0.RT_175,
}
r6_0.TaskId = 150434
r4_0[150434] = r6_0
r6_0 = {
  AttackRangeType = "Bullet",
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_299,
  [2] = {
    FXId = 150422,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
    RandomRotation = r0_0.RT_126,
  },
  [3] = r0_0.RT_300,
  [4] = r0_0.RT_175,
}
r6_0.TaskId = 150435
r4_0[150435] = r6_0
r4_0[150436] = {
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_301,
  },
  TaskId = 150436,
}
r6_0 = {
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_296,
  [2] = {
    AimSkeletal = "hit1",
    CreatureId = 150403,
    Direction = "Camera",
    Function = "CreateSkillCreature",
    UseSaveLoc = "SuyiShoot",
  },
  [3] = r0_0.RT_302,
  [4] = r0_0.RT_72,
  [5] = r0_0.RT_127,
}
r6_0.TaskId = 150441
r4_0[150441] = r6_0
r5_0 = 150442
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CostBullet = 0,
  Function = "StartLoopShoot",
  LoopInterval = 0.15,
  LoopShootId = 150401,
  SkillEffect = {
    150444,
    150436
  },
}
r8_0[2] = {
  Function = "StartLoopShoot",
  LoopInterval = 0.5,
  LoopShootId = 150402,
  SkillEffect = {
    150441
  },
}
r8_0[3] = r0_0.RT_303
r8_0[4] = r0_0.RT_304
r6_0[r7_0] = r8_0
r6_0.TaskId = 150442
r4_0[r5_0] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "EndLoopShoot",
    LoopShootId = 150401,
  },
  [2] = {
    Function = "EndLoopShoot",
    LoopShootId = 150402,
  },
  [3] = {
    ClientSkillLogicId = 150401,
    Function = "ExecuteClientSkillLogicFunction",
    FunctionName = "EndShoot",
  },
  [4] = r0_0.RT_295,
}
r6_0.TaskId = 150443
r4_0[150443] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    ClientSkillLogicId = 150401,
    Function = "ExecuteClientSkillLogicFunction",
    FunctionName = "HeavyShootingLoop",
  },
}
r6_0.TaskId = 150444
r4_0[150444] = r6_0
r6_0 = {
  TargetFilter = "Char_Cylinder_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_299,
  [2] = r0_0.RT_300,
  [3] = {
    FXId = 150432,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 150445
r4_0[150445] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseChar = "Target",
    CreatureId = 150404,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 150446
r4_0[150446] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseChar = "Target",
    CreatureId = 150441,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 150447
r4_0[150447] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 150405,
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_301,
  [3] = r0_0.RT_301,
  [4] = r0_0.RT_301,
  [5] = r0_0.RT_301,
  [6] = r0_0.RT_301,
  [7] = r0_0.RT_49,
  [8] = {
    BuffId = 150422,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 150451
r4_0[150451] = r6_0
r6_0 = {
  EffectExecuteTiming = "Leave",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 150405,
    Function = "RemoveSkillCreature",
  },
  [2] = r0_0.RT_301,
  [3] = r0_0.RT_301,
  [4] = r0_0.RT_301,
}
r6_0.TaskId = 150452
r4_0[150452] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 150406,
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_301,
  [3] = r0_0.RT_301,
  [4] = r0_0.RT_301,
  [5] = r0_0.RT_301,
  [6] = r0_0.RT_301,
  [7] = r0_0.RT_49,
}
r6_0.TaskId = 150453
r4_0[150453] = r6_0
r6_0 = {
  EffectExecuteTiming = "Leave",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 150406,
    Function = "RemoveSkillCreature",
  },
  [2] = r0_0.RT_301,
  [3] = r0_0.RT_301,
  [4] = r0_0.RT_301,
}
r6_0.TaskId = 150454
r4_0[150454] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_299,
  [2] = r0_0.RT_176,
  [3] = {
    BossValue = 100,
    CauseHit = "HitFly_XY800Z300A270",
    Function = "CutToughness",
    Value = 100,
  },
  [4] = r0_0.RT_119,
  [5] = r0_0.RT_305,
}
r6_0.TaskId = 150455
r4_0[150455] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_299,
  [2] = r0_0.RT_176,
  [3] = {
    BossValue = 100,
    CauseHit = "HitFly_XY800Z300A90",
    Function = "CutToughness",
    Value = 100,
  },
  [4] = r0_0.RT_119,
  [5] = r0_0.RT_305,
}
r6_0.TaskId = 150456
r4_0[150456] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_307,
  [2] = {
    CorrectDirection = true,
    FXId = 150411,
    Function = "PlayFX",
    IsAttached = true,
    IsDecalEffectCreature = true,
    NormalToHit = true,
    Overlap = true,
    RefinedOverlap = true,
    ReplaceFXId = r0_0.RT_308,
  },
  [3] = r0_0.RT_309,
}
r6_0.TaskId = 150457
r4_0[150457] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r8_0 = {}
r8_0[1] = {
  AttrRates = {
    ATK = 0,
    DEF = 0,
    EnmityValue = 0,
    MaxHp = "1",
    SkillEfficiency = 0,
    SkillIntensity = 0,
    StrongValue = 0,
  },
  AutoAttach = 1,
  Function = "CreateUnit",
  LifeTime = -1,
  MaxSummonCount = 1,
  SingleSummonCount = 1,
  UnitId = 150401,
  UnitType = "Monster",
}
r6_0.TaskEffects = r8_0
r6_0.TaskId = 150461
r4_0[150461] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "RemoveUnit",
    UnitId = 150401,
  },
}
r6_0.TaskId = 150462
r4_0[150462] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 150411,
    Function = "CreateSkillCreature",
    UseSaveLoc = "SuyiGradeLoc",
  },
}
r6_0.TaskId = 150471
r4_0[150471] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 150501,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 150511
r4_0[150511] = r6_0
r4_0[150521] = {
  AllowSkillRangeModify = true,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle240",
  TaskEffects = r0_0.RT_311,
  TaskId = 150521,
}
r6_0 = {
  AllowSkillRangeModify = true,
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "BladeUp",
    PassiveEffectId = 150501,
  },
  [2] = {
    BuffId = 150502,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 150522
r4_0[150522] = r6_0
r5_0 = 150531
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "ShootingTargets",
}
r7_0 = "TaskEffects"
r8_0 = {
  [1] = {
    CreatureId = 150501,
    Direction = "Camera",
    Distance = 2000,
    Function = "CreateSkillCreature",
    Rotation = r0_0.RT_21,
  },
}
r8_0[2] = {
  Condition = 150501,
  CreatureId = 150511,
  Direction = "Camera",
  Distance = 2000,
  Function = "CreateSkillCreature",
  Rotation = {
    0,
    0,
    5
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 150531
r4_0[r5_0] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 150502,
    Direction = "Camera",
    Distance = 2000,
    Function = "CreateSkillCreature",
    Rotation = r0_0.RT_126,
  },
  [2] = {
    Condition = 150501,
    CreatureId = 150521,
    Direction = "Camera",
    Distance = 2000,
    Function = "CreateSkillCreature",
    Rotation = r0_0.RT_126,
  },
}
r6_0.TaskId = 150532
r4_0[150532] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_310,
  [2] = {
    CauseHit = "LightHit_120",
    Function = "CutToughness",
    Value = 15,
  },
  [3] = r0_0.RT_42,
  [4] = r0_0.RT_90,
}
r6_0.TaskId = 150533
r4_0[150533] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Ultra",
    DamageTag = r0_0.RT_45,
    Function = "Damage",
    Rate = 2,
  },
  [2] = r0_0.RT_312,
  [3] = r0_0.RT_42,
  [4] = r0_0.RT_38,
}
r6_0.TaskId = 150534
r4_0[150534] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 150503,
    Function = "CreateSkillCreature",
  },
  [2] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "Skill1End",
    PassiveEffectId = 150501,
  },
}
r6_0.TaskId = 150541
r4_0[150541] = r6_0
r4_0[150542] = {
  HatredIncrement = 40,
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_314,
    [2] = r0_0.RT_145,
    [3] = r0_0.RT_63,
  },
  TaskId = 150542,
}
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_314,
  [2] = r0_0.RT_145,
  [3] = {
    FXId = 1060212,
    Function = "PlayFX",
    IsAttached = false,
  },
  [4] = r0_0.RT_90,
}
r6_0.TaskId = 150543
r4_0[150543] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_314,
  [2] = r0_0.RT_145,
  [3] = {
    FXId = 1060213,
    Function = "PlayFX",
    IsAttached = false,
  },
  [4] = r0_0.RT_90,
}
r6_0.TaskId = 150544
r4_0[150544] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_314,
  [2] = r0_0.RT_145,
  [3] = {
    FXId = 1060214,
    Function = "PlayFX",
    IsAttached = false,
  },
  [4] = r0_0.RT_90,
}
r6_0.TaskId = 150545
r4_0[150545] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_314,
  [2] = r0_0.RT_145,
  [3] = {
    FXId = 1060215,
    Function = "PlayFX",
    IsAttached = false,
  },
  [4] = r0_0.RT_90,
}
r6_0.TaskId = 150546
r4_0[150546] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_314,
  [2] = r0_0.RT_145,
  [3] = {
    FXId = 1060216,
    Function = "PlayFX",
    IsAttached = false,
  },
  [4] = r0_0.RT_90,
}
r6_0.TaskId = 150547
r4_0[150547] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_314,
  [2] = r0_0.RT_145,
  [3] = {
    FXId = 1060217,
    Function = "PlayFX",
    IsAttached = false,
  },
  [4] = r0_0.RT_90,
}
r6_0.TaskId = 150548
r4_0[150548] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 1060221,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_315,
  },
}
r6_0.TaskId = 150551
r4_0[150551] = r6_0
r4_0[150552] = {
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle",
  TaskEffects = r0_0.RT_316,
  TaskId = 150552,
}
r4_0[150553] = {
  HatredIncrement = 40,
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_316,
  TaskId = 150553,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 150504,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 150561
r4_0[150561] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 150504,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 150562
r4_0[150562] = r6_0
r4_0[150563] = {
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_Small_Trgt",
  TaskEffects = r0_0.RT_311,
  TaskId = 150563,
}
r4_0[150564] = {
  HatredIncrement = 40,
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_318,
  },
  TaskId = 150564,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 160101,
    Function = "CreateSkillCreature",
    Rotation = r0_0.RT_323,
  },
}
r6_0.TaskId = 160111
r4_0[160111] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 160102,
    Function = "CreateSkillCreature",
    Rotation = r0_0.RT_324,
  },
}
r6_0.TaskId = 160112
r4_0[160112] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_179,
    Function = "Damage",
    Rate = "#1",
    TriggerProbability = 1,
  },
  [2] = {
    BossValue = 23,
    CauseHit = "HitFly_XY800Z400",
    Function = "CutToughness",
    Value = 40,
  },
  [3] = {
    FXId = 160103,
    Function = "PlayFX",
  },
  [4] = {
    Function = "PlaySE",
    SEId = 160101,
  },
}
r6_0.TaskId = 160113
r4_0[160113] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "AlmostAllFrd",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 160101,
    Condition = 96,
    Function = "AddBuff",
    LastTime = 12,
  },
  [2] = {
    AllowSkillIntensity = 1,
    BaseAttr = "MaxES",
    BaseChar = "Self",
    Function = "AddEnergyShield",
    IsOverShield = 1,
    Rate = 0.05,
  },
  [3] = {
    BuffId = 160104,
    Condition = 76,
    Function = "AddBuff",
    LastTime = 12,
  },
}
r6_0.TaskId = 160121
r4_0[160121] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Large",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_213,
  [2] = {
    CauseHit = "HitFly_XY500Z300",
    Function = "CutToughness",
    Value = 150,
  },
  [3] = r0_0.RT_42,
  [4] = {
    Function = "PlaySE",
    SEId = 160104,
  },
}
r6_0.TaskId = 160122
r4_0[160122] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Condition = 72,
    CreatureId = 160103,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 160123
r4_0[160123] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  TargetFilter = "Char_Cylinder_Large",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 160102,
    Function = "AddBuff",
    LastTime = 1.1,
  },
}
r6_0.TaskId = 160124
r4_0[160124] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Condition = 92,
    FXId = 160124,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 160125
r4_0[160125] = r6_0
r6_0 = {
  TargetFilter = "AlmostAllFrd",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 160105,
    Function = "AddBuff",
    LastTime = 12,
  },
}
r6_0.TaskId = 160131
r4_0[160131] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  TargetFilter = "Char_Cylinder_Small_Trgt",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_247,
  [2] = {
    CauseHit = "LightHit_50_F",
    Function = "CutToughness",
    Value = 40,
  },
}
r6_0.TaskId = 160132
r4_0[160132] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseChar = "Target",
    FXId = 160131,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 160133
r4_0[160133] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle180",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_180,
  [2] = r0_0.RT_325,
  [3] = {
    BossValue = 56,
    CauseHit = "HitFly_XY800Z400",
    Function = "CutToughness",
    Value = 40,
  },
  [4] = r0_0.RT_326,
  [5] = {
    Delay = 0.1,
    FXId = 25,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 180111
r4_0[180111] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "SummonSkill1",
    PassiveEffectId = 180101,
  },
}
r6_0.TaskId = 180112
r4_0[180112] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  TargetFilter = "Char_Cylinder_Large_Trgt",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_180,
  [2] = r0_0.RT_325,
  [3] = r0_0.RT_327,
  [4] = r0_0.RT_326,
  [5] = r0_0.RT_252,
  [6] = {
    Function = "PlaySE",
    SEId = 180107,
  },
}
r6_0.TaskId = 180113
r4_0[180113] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  TargetFilter = "Char_Cylinder_Large_Trgt",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_180,
  [2] = r0_0.RT_325,
  [3] = r0_0.RT_327,
  [4] = r0_0.RT_326,
  [5] = r0_0.RT_252,
  [6] = {
    Function = "PlaySE",
    SEId = 180108,
  },
}
r6_0.TaskId = 180114
r4_0[180114] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  TargetFilter = "Char_Cylinder_Large_Trgt",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_180,
  [2] = r0_0.RT_325,
  [3] = r0_0.RT_327,
  [4] = r0_0.RT_326,
  [5] = r0_0.RT_252,
  [6] = {
    Function = "PlaySE",
    SEId = 180109,
  },
}
r6_0.TaskId = 180115
r4_0[180115] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  TargetFilter = "Char_Cylinder_Large_Trgt",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_180,
  [2] = r0_0.RT_325,
  [3] = r0_0.RT_327,
  [4] = r0_0.RT_326,
  [5] = r0_0.RT_252,
  [6] = {
    Function = "PlaySE",
    SEId = 180110,
  },
}
r6_0.TaskId = 180116
r4_0[180116] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AttrRates = r0_0.RT_1,
    Function = "CreateUnit",
    LifeTime = -1,
    MaxSummonCount = 1,
    UnitId = 180101,
    UnitType = "Monster",
    UseSaveLoc = "FeinaSummon",
  },
}
r6_0.TaskId = 180121
r4_0[180121] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "RemoveUnit",
    UnitId = 180101,
  },
}
r6_0.TaskId = 180122
r4_0[180122] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 180121,
    Function = "PlayFX",
    IsAttached = true,
    IsEffectCreature = true,
  },
}
r6_0.TaskId = 180123
r4_0[180123] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  TargetFilter = "AlmostAllFrd_Trgt",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_329,
  [2] = {
    BuffId = 180131,
    Function = "AddBuff",
    LastTime = 12,
  },
}
r6_0.TaskId = 180131
r4_0[180131] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  TargetFilter = "AlmostAllFrd_Trgt",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_329,
  [2] = {
    BuffId = 180132,
    Function = "AddBuff",
    LastTime = 12,
  },
}
r6_0.TaskId = 180132
r4_0[180132] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  TargetFilter = "AlmostAllFrd_Trgt",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_329,
  [2] = {
    BuffId = 180133,
    Function = "AddBuff",
    LastTime = 12,
  },
}
r6_0.TaskId = 180133
r4_0[180133] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  TargetFilter = "AlmostAllFrd_Trgt",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_329,
  [2] = {
    BuffId = 180134,
    Function = "AddBuff",
    LastTime = 12,
  },
}
r6_0.TaskId = 180134
r4_0[180134] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  TargetFilter = "AlmostAllFrd_Trgt",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_329,
  [2] = {
    BuffId = 180135,
    Function = "AddBuff",
    LastTime = 12,
  },
}
r6_0.TaskId = 180135
r4_0[180135] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  TargetFilter = "AlmostAllFrd_Trgt",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_329,
  [2] = {
    BuffId = 180136,
    Function = "AddBuff",
    LastTime = 12,
  },
}
r6_0.TaskId = 180136
r4_0[180136] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  TargetFilter = "AlmostAllFrd_Trgt",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_329,
  [2] = {
    BuffId = 180137,
    Function = "AddBuff",
    LastTime = 12,
  },
}
r6_0.TaskId = 180137
r4_0[180137] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  TargetFilter = "AlmostAllFrd_Trgt",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_329,
  [2] = {
    BuffId = 180138,
    Function = "AddBuff",
    LastTime = 12,
  },
}
r6_0.TaskId = 180138
r4_0[180138] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AllowSkillSustain = 1,
    FixLocation = true,
    FormationId = 210101,
    Function = "CreateUnit",
    LifeTime = 14,
    MaxSummonCount = 3,
    SingleSummonCount = 1,
    UnitId = 210101,
    UnitType = "Monster",
  },
}
r6_0.TaskId = 210111
r4_0[210111] = r6_0
r4_0[210112] = {
  AllowSkillRangeModify = true,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Large",
  TaskEffects = r0_0.RT_481,
  TaskId = 210112,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AllowSkillSustain = 1,
    FixLocation = true,
    FormationId = 210101,
    Function = "CreateUnit",
    LifeTime = 14,
    MaxSummonCount = 5,
    SingleSummonCount = 1,
    UnitId = 210101,
    UnitType = "Monster",
  },
}
r6_0.TaskId = 210113
r4_0[210113] = r6_0
r4_0[210114] = {
  AllowSkillRangeModify = true,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Large",
  TaskEffects = r0_0.RT_481,
  TaskId = 210114,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AllowSkillSustain = 1,
    FormationId = 210101,
    Function = "CreateUnit",
    LifeTime = 14,
    MaxSummonCount = 3,
    SingleSummonCount = 1,
    UnitId = 210101,
    UnitType = "Monster",
    UseSaveLoc = "ShuimuSkill01",
  },
}
r6_0.TaskId = 210115
r4_0[210115] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AllowSkillSustain = 1,
    FormationId = 210101,
    Function = "CreateUnit",
    LifeTime = 14,
    MaxSummonCount = 5,
    SingleSummonCount = 1,
    UnitId = 210101,
    UnitType = "Monster",
    UseSaveLoc = "ShuimuSkill01",
  },
}
r6_0.TaskId = 210116
r4_0[210116] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_213,
  [2] = r0_0.RT_413,
  [3] = {
    BossValue = 233,
    CauseHit = "HitFly_XY300Z1000",
    Function = "CutToughness",
    Value = 100,
  },
  [4] = r0_0.RT_482,
}
r6_0.TaskId = 210121
r4_0[210121] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Shuimu_Skill02_MiddleRing",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_40,
    Delay = 0.3,
    Function = "Damage",
    Rate = "#1",
  },
  [2] = {
    Delay = 0.3,
    FXId = 23,
    Function = "PlayFX",
  },
  [3] = {
    BossValue = 233,
    CauseHit = "HitFly_XY300Z1000",
    Delay = 0.3,
    Function = "CutToughness",
    Value = 100,
  },
  [4] = r0_0.RT_482,
}
r6_0.TaskId = 210122
r4_0[210122] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Shuimu_Skill02_OuterRing",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_40,
    Delay = 0.6,
    Function = "Damage",
    Rate = "#1",
  },
  [2] = {
    Delay = 0.6,
    FXId = 23,
    Function = "PlayFX",
  },
  [3] = {
    BossValue = 233,
    CauseHit = "HitFly_XY300Z1000",
    Delay = 0.6,
    Function = "CutToughness",
    Value = 100,
  },
  [4] = r0_0.RT_482,
}
r6_0.TaskId = 210123
r4_0[210123] = r6_0
r4_0[210131] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_413,
  },
  TaskId = 210131,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FixLocation = true,
    FormationId = 210101,
    Function = "CreateUnit",
    LifeTime = -1,
    MaxSummonCount = 1,
    SetInt = r0_0.RT_483,
    SingleSummonCount = 1,
    UnitId = 210201,
    UnitType = "Monster",
  },
}
r6_0.TaskId = 210211
r4_0[210211] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AllowSkillSustain = 1,
    FixLocation = true,
    FormationId = 210101,
    Function = "CreateUnit",
    LifeTime = 99,
    MaxSummonCount = 9,
    SingleSummonCount = 1,
    UnitId = 210202,
    UnitType = "Monster",
  },
}
r6_0.TaskId = 210212
r4_0[210212] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AllowSkillSustain = 1,
    FixLocation = true,
    Function = "CreateUnit",
    LifeTime = 99,
    MaxSummonCount = 2,
    SetInt = r0_0.RT_483,
    SingleSummonCount = 1,
    UnitId = 210203,
    UnitType = "Monster",
    UseSaveLoc = "EveRook01",
  },
}
r6_0.TaskId = 210213
r4_0[210213] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "Promotion_Rook",
    PassiveEffectId = 210201,
  },
}
r6_0.TaskId = 210214
r4_0[210214] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "Promotion_Queen",
    PassiveEffectId = 210201,
  },
}
r6_0.TaskId = 210215
r4_0[210215] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FixLocation = true,
    Function = "CreateUnit",
    LifeTime = -1,
    MaxSummonCount = 1,
    SetInt = r0_0.RT_483,
    SingleSummonCount = 1,
    UnitId = 210204,
    UnitType = "Monster",
    UseSaveLoc = "EveQueen",
  },
}
r6_0.TaskId = 210216
r4_0[210216] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_484,
  [2] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "EndSkill02",
    PassiveEffectId = 210201,
  },
}
r6_0.TaskId = 210217
r4_0[210217] = r6_0
r4_0[210221] = {
  AllowSkillRangeModify = true,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
  TaskEffects = r0_0.RT_11,
  TaskId = 210221,
}
r4_0[210222] = {
  AllowSkillRangeModify = true,
  NotifyName = r0_0.RT_9,
  TargetFilter = "Char_Cylinder_Small",
  TaskEffects = r0_0.RT_11,
  TaskId = 210222,
}
r6_0 = {
  AllowSkillRangeModify = true,
  TargetFilter = "Char_Cylinder_Small",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    Function = "Damage",
    Rate = 12,
  },
  [2] = r0_0.RT_4,
  [3] = r0_0.RT_10,
  [4] = {
    FXId = 33311,
    Function = "PlayFX",
  },
  [5] = r0_0.RT_5,
}
r6_0.TaskId = 210223
r4_0[210223] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 210201,
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_4,
  [3] = r0_0.RT_10,
  [4] = r0_0.RT_5,
}
r6_0.TaskId = 210231
r4_0[210231] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_16,
  [2] = r0_0.RT_485,
  [3] = {
    CauseHit = "HitFly_XY200Z100",
    Function = "CutToughness",
    Value = 100,
  },
  [4] = r0_0.RT_486,
}
r6_0.TaskId = 210232
r4_0[210232] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 210202,
    Function = "AddBuff",
    LastTime = -1,
  },
  [2] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "ExecuteSkill02",
    PassiveEffectId = 210201,
  },
}
r6_0.TaskId = 210241
r4_0[210241] = r6_0
r4_0[210242] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_489,
  TaskId = 210242,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r8_0 = {}
r8_0[1] = {
  AllowSkillSustain = 1,
  FixLocation = true,
  Function = "CreateUnit",
  LifeTime = 99,
  MaxSummonCount = 9,
  SetInt = {
    IsEveCopySummon = 1,
  },
  SingleSummonCount = 1,
  UnitId = 210202,
  UnitType = "Monster",
  UseSaveLoc = "EveSkill02Copy",
}
r6_0.TaskEffects = r8_0
r6_0.TaskId = 210243
r4_0[210243] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 210202,
    Function = "RemoveBuff",
    LastTime = -1,
  },
  [2] = r0_0.RT_484,
  [3] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "Skill02Off",
    PassiveEffectId = 210201,
  },
}
r6_0.TaskId = 210251
r4_0[210251] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "ReSetQueenLocation",
    PassiveEffectId = 210201,
  },
}
r6_0.TaskId = 210252
r4_0[210252] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Sphere_Xlarge",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_7,
  [2] = r0_0.RT_4,
  [3] = {
    BossValue = 120,
    CauseHit = "HitFly_XY0Z800",
    Function = "CutToughness",
    Value = 120,
  },
  [4] = r0_0.RT_5,
}
r6_0.TaskId = 210253
r4_0[210253] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AllowSkillSustain = 1,
    FixLocation = true,
    FormationId = 210101,
    Function = "CreateUnit",
    LifeTime = 99,
    MaxSummonCount = 9,
    SetInt = r0_0.RT_483,
    SingleSummonCount = 1,
    UnitId = 210202,
    UnitType = "Monster",
  },
}
r6_0.TaskId = 210254
r4_0[210254] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "RemoveUnit",
    Num = 1,
    UnitId = 210202,
  },
}
r6_0.TaskId = 210262
r4_0[210262] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AllowSkillSustain = 1,
    FixLocation = true,
    FormationId = 210101,
    Function = "CreateUnit",
    LifeTime = 99,
    MaxSummonCount = 9,
    SetInt = r0_0.RT_483,
    SingleSummonCount = "$Source:GetRootSource():GetInt(\'PassiveWaitingNum\')$",
    UnitId = 210202,
    UnitType = "Monster",
  },
  [2] = {
    Function = "AddBullet",
    Value = 50,
  },
}
r6_0.TaskId = 210263
r4_0[210263] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "PassiveAdditionalSummon",
    PassiveEffectId = 210201,
  },
}
r6_0.TaskId = 210264
r4_0[210264] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  NotifyName = r0_0.RT_2,
  TargetFilter = "MySummoned",
  TargetFilterVars = {
    Id = 230101,
  },
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 230110,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 230111
r4_0[230111] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "AlmostAllFrd",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 230101,
    Function = "AddBuff",
    LastTime = 8,
  },
}
r6_0.TaskId = 230112
r4_0[230112] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 230102,
    Function = "AddBuff",
    LastTime = 8,
  },
}
r6_0.TaskId = 230113
r4_0[230113] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AllowSkillSustain = 1,
    FixLocation = true,
    FormationId = 230102,
    Function = "CreateUnit",
    LifeTime = 12,
    MaxSummonCount = 18,
    SingleSummonCount = 3,
    UnitId = 230101,
    UnitType = "Monster",
  },
}
r6_0.TaskId = 230121
r4_0[230121] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AllowSkillSustain = 1,
    FixLocation = true,
    FormationId = 230103,
    Function = "CreateUnit",
    LifeTime = 12,
    MaxSummonCount = 18,
    SingleSummonCount = 3,
    UnitId = 230101,
    UnitType = "Monster",
  },
}
r6_0.TaskId = 230122
r4_0[230122] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AllowSkillSustain = 1,
    FixLocation = true,
    FormationId = 230104,
    Function = "CreateUnit",
    LifeTime = 12,
    MaxSummonCount = 18,
    SingleSummonCount = 3,
    UnitId = 230101,
    UnitType = "Monster",
  },
}
r6_0.TaskId = 230123
r4_0[230123] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AllowSkillSustain = 1,
    FixLocation = true,
    FormationId = 230102,
    Function = "CreateUnit",
    LifeTime = 12,
    MaxSummonCount = 24,
    SingleSummonCount = 4,
    UnitId = 230101,
    UnitType = "Monster",
  },
}
r6_0.TaskId = 230124
r4_0[230124] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AllowSkillSustain = 1,
    FixLocation = true,
    FormationId = 230103,
    Function = "CreateUnit",
    LifeTime = 12,
    MaxSummonCount = 24,
    SingleSummonCount = 4,
    UnitId = 230101,
    UnitType = "Monster",
  },
}
r6_0.TaskId = 230125
r4_0[230125] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AllowSkillSustain = 1,
    FixLocation = true,
    FormationId = 230104,
    Function = "CreateUnit",
    LifeTime = 12,
    MaxSummonCount = 24,
    SingleSummonCount = 4,
    UnitId = 230101,
    UnitType = "Monster",
  },
}
r6_0.TaskId = 230126
r4_0[230126] = r6_0
r6_0 = {
  TargetFilter = "Zhangyu_TentacleBirth",
}
r6_0.TaskEffects = {
  [1] = {
    BossValue = 65,
    CauseHit = "HitFly_XY800Z400",
    Function = "CutToughness",
    Value = 65,
  },
  [2] = {
    FXId = 230102,
    Function = "PlayFX",
  },
  [3] = {
    Function = "PlaySE",
    SEId = 230101,
  },
}
r6_0.TaskId = 230130
r4_0[230130] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    AllowSkillSustain = 1,
    FixLocation = true,
    FormationId = 230101,
    Function = "CreateUnit",
    LifeTime = 12,
    MaxSummonCount = 18,
    RefreshRule = "Block",
    SingleSummonCount = 1,
    UnitId = 230101,
    UnitType = "Monster",
  },
}
r6_0.TaskId = 230131
r4_0[230131] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    AllowSkillSustain = 1,
    FixLocation = true,
    FormationId = 230101,
    Function = "CreateUnit",
    LifeTime = 12,
    MaxSummonCount = 24,
    RefreshRule = "Block",
    SingleSummonCount = 1,
    UnitId = 230101,
    UnitType = "Monster",
  },
}
r6_0.TaskId = 230132
r4_0[230132] = r6_0
r6_0 = {
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Large",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_491,
  [2] = {
    BossValue = 3,
    CauseHit = "LightHit_50",
    Function = "CutToughness",
    Value = 15,
  },
}
r6_0.TaskId = 230133
r4_0[230133] = r6_0
r4_0[230134] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_342,
  TaskId = 230134,
}
r6_0 = {
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Zhangyu_TentacleAttackSp",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_491,
  [2] = {
    BossValue = 3,
    CauseHit = "LightHit_100_F",
    Function = "CutToughness",
    Value = 15,
  },
}
r6_0.TaskId = 230135
r4_0[230135] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageType = "Default",
    Function = "Heal",
    Rate = "#1",
    Value = 5,
  },
  [2] = {
    Function = "AddSp",
    SpChange = 12,
  },
  [3] = r0_0.RT_492,
  [4] = r0_0.RT_488,
}
r6_0.TaskId = 240103
r4_0[240103] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AllowSkillSustain = 1,
    FixLocation = true,
    FormationId = 240101,
    Function = "CreateUnit",
    LifeTime = 10,
    MaxSummonCount = 2,
    SingleSummonCount = 1,
    UnitId = 240101,
    UnitType = "Monster",
  },
}
r6_0.TaskId = 240111
r4_0[240111] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AllowSkillSustain = 1,
    FixLocation = true,
    FormationId = 240101,
    Function = "CreateUnit",
    LifeTime = 10,
    MaxSummonCount = 3,
    SingleSummonCount = 1,
    UnitId = 240101,
    UnitType = "Monster",
  },
}
r6_0.TaskId = 240112
r4_0[240112] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AllowSkillSustain = 1,
    FormationId = 240101,
    Function = "CreateUnit",
    LifeTime = 10,
    MaxSummonCount = 2,
    SingleSummonCount = 1,
    UnitId = 240101,
    UnitType = "Monster",
    UseSaveLoc = "BaihengSkill01",
  },
}
r6_0.TaskId = 240113
r4_0[240113] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AllowSkillSustain = 1,
    FormationId = 240101,
    Function = "CreateUnit",
    LifeTime = 10,
    MaxSummonCount = 3,
    SingleSummonCount = 1,
    UnitId = 240101,
    UnitType = "Monster",
    UseSaveLoc = "BaihengSkill01",
  },
}
r6_0.TaskId = 240114
r4_0[240114] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "AlmostAllOtFr",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_493,
  [2] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "AddbuffSkillintensity",
    PassiveEffectId = 240101,
  },
}
r6_0.TaskId = 240121
r4_0[240121] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_493,
  [2] = {
    BuffId = 240123,
    Condition = 96,
    Function = "AddBuff",
    LastTime = 12,
  },
  [3] = {
    BuffId = 240124,
    Condition = 76,
    Function = "AddBuff",
    LastTime = 12,
  },
}
r6_0.TaskId = 240122
r4_0[240122] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_213,
  [2] = {
    BossValue = 100,
    CauseHit = "HitFly_XY200Z300",
    Function = "CutToughness",
    Value = 100,
  },
  [3] = r0_0.RT_413,
}
r6_0.TaskId = 240123
r4_0[240123] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  EffectExecuteTiming = "Enter",
  ExtraBPFilter = "Char_Baiheng_Skill01",
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Large",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_479,
  [2] = {
    BossValue = 1,
    CauseHit = "LightHit",
    Function = "CutToughness",
    Value = 15,
  },
  [3] = {
    AimTarget = true,
    FXId = 240101,
    Function = "PlayFX",
    IsAttached = true,
  },
  [4] = {
    FXId = 240105,
    Function = "PlayFX",
    FxRotator = r0_0.RT_193,
    IsFaceToChar = true,
  },
}
r6_0.TaskId = 240141
r4_0[240141] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 240102,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 240142
r4_0[240142] = r6_0
r4_0[240143] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_492,
  },
  TaskId = 240143,
}
r4_0[240144] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_488,
  },
  TaskId = 240144,
}
r6_0 = {
  TargetFilter = "BossOnline_Skill20Cylinder1",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHp",
    BaseChar = "Target",
    DamageType = "TrueDamage",
    Function = "Damage",
    Rate = 10,
  },
  [2] = r0_0.RT_495,
}
r6_0.TaskId = 304100
r4_0[304100] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    DanmakuTemplateId = 30401,
    Function = "RemoveDanmaku",
  },
}
r6_0.TaskId = 304101
r4_0[304101] = r6_0
r4_0[304102] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Mon_SPTarget01",
  TaskEffects = r0_0.RT_501,
  TaskId = 304102,
}
r4_0[304103] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Mon_SPTarget02",
  TaskEffects = r0_0.RT_501,
  TaskId = 304103,
}
r4_0[304104] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Mon_SPTarget03",
  TaskEffects = r0_0.RT_501,
  TaskId = 304104,
}
r6_0 = {
  AllowSkillRangeModify = true,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_XLarge120",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_180,
  [2] = {
    BaseAttr = "ATK_Ultra",
    BuffId = "$Source:GetRootSource():GetInt(\'Skill1Buff\')$",
    Function = "AddBuff",
    LastTime = 8,
  },
  [3] = {
    BossValue = 95,
    CauseHit = "HitFly_XY200Z500_F",
    Function = "CutToughness",
    Value = 15,
  },
  [4] = {
    FXId = 310111,
    Function = "PlayFX",
  },
  [5] = r0_0.RT_151,
  [6] = r0_0.RT_522,
}
r6_0.TaskId = 310111
r4_0[310111] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseChar = "Target",
    FXId = 310104,
    Function = "PlayFX",
  },
  [2] = {
    BossValue = 45,
    CauseHit = "HitFly_XY200Z500_F",
    Delay = 0.05,
    Function = "CutToughness",
    Value = 30,
  },
}
r6_0.TaskId = 310114
r4_0[310114] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 310120,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 310120
r4_0[310120] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 310122,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 310121
r4_0[310121] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 310121,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 310122
r4_0[310122] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 310122,
    Function = "RemoveBuff",
  },
  [2] = {
    BuffId = 310120,
    Function = "RemoveBuff",
  },
  [3] = {
    BuffId = 310121,
    Function = "RemoveBuff",
  },
  [4] = {
    BuffId = 310124,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 310123
r4_0[310123] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  NotifyName = r0_0.RT_523,
  TargetFilter = "Linen_Skill02",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "SetFloat",
    Key = "LinenSkill02ShootRate",
    Value = "#1",
  },
  [2] = {
    BaseAttr = "ATK_Ultra",
    DamageTag = r0_0.RT_343,
    Function = "Damage",
    Rate = "$Source:GetFloat(\'LinenSkill02ShootRate\')*Source:GetCurrentWeaponAttr(\'MultiShoot\', 1)$",
  },
  [3] = {
    BaseChar = "Target",
    FXId = 310111,
    Function = "PlayFX",
  },
  [4] = {
    BossValue = 17,
    CauseHit = "RangedWeapon_Common",
    Function = "CutToughness",
    Value = 1,
  },
  [5] = {
    AnimName = "OpenFire",
    Function = "PlayUIAnim",
    UIName = "UISkill2Linen",
  },
  [6] = r0_0.RT_522,
}
r6_0.TaskId = 310131
r4_0[310131] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_524,
  [2] = {
    FXId = 310213,
    Function = "PlayFX",
    IsAttached = true,
  },
}
r6_0.TaskId = 310201
r4_0[310201] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AllowSkillSustain = 1,
    AttrRates = r0_0.RT_1,
    Function = "CreateUnit",
    LifeTime = 12,
    MaxSummonCount = 6,
    SingleSummonCount = 1,
    UnitId = 310202,
    UnitType = "MechanismSummon",
  },
}
r6_0.TaskId = 310202
r4_0[310202] = r6_0
r5_0 = 310203
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_XLarge",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  BaseAttr = "ATK_Char",
  DamageTag = {
    "Skill",
    "Skill2",
    "XierSkill2"
  },
  Function = "Damage",
  Rate = "#1",
}
r8_0[2] = r0_0.RT_525
r8_0[3] = {
  BossValue = 47,
  CauseHit = "HitFly_XY200Z300",
  Delay = 0.2,
  Function = "CutToughness",
  Value = 33,
}
r8_0[4] = r0_0.RT_414
r8_0[5] = r0_0.RT_526
r8_0[6] = r0_0.RT_119
r6_0[r7_0] = r8_0
r6_0.TaskId = 310203
r4_0[r5_0] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AttrRates = r0_0.RT_1,
    Function = "CreateUnit",
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 310201,
    UnitType = "Monster",
  },
}
r6_0.TaskId = 310204
r4_0[310204] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "FunnelCreate",
    PassiveEffectId = 310201,
  },
}
r6_0.TaskId = 310205
r4_0[310205] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    ATKBase = "ATK",
    CreatureId = 310201,
    Function = "CreateSkillCreature",
  },
  [2] = {
    FXId = 310202,
    Function = "PlayFX",
    IsAttached = true,
  },
}
r6_0.TaskId = 310211
r4_0[310211] = r6_0
r4_0[310212] = {
  HatredIncrement = 40,
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_528,
  TaskId = 310212,
}
r4_0[310213] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_128,
  TaskId = 310213,
}
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_529,
  [2] = {
    FXId = 310215,
    Function = "PlayFX",
    IsAttached = true,
  },
}
r6_0.TaskId = 310214
r4_0[310214] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_529,
  [2] = {
    FXId = 310216,
    Function = "PlayFX",
    IsAttached = true,
  },
}
r6_0.TaskId = 310215
r4_0[310215] = r6_0
r5_0 = 310216
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  BaseAttr = "ATK_Char",
  DamageTag = {
    "Skill",
    "Skill1",
    "XierSkill1Laser"
  },
  Function = "Damage",
  Rate = "#1",
}
r8_0[2] = {
  BossValue = 5,
  CauseHit = "LightHit",
  Function = "CutToughness",
  Value = 33,
}
r8_0[3] = {
  Function = "PlaySE",
  SEId = 310201,
}
r8_0[4] = r0_0.RT_119
r8_0[5] = r0_0.RT_414
r6_0[r7_0] = r8_0
r6_0.TaskId = 310216
r4_0[r5_0] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    ATKBase = "ATK",
    CreatureId = 310202,
    Function = "CreateSkillCreature",
  },
  [2] = {
    FXId = 310206,
    Function = "PlayFX",
    IsAttached = true,
  },
}
r6_0.TaskId = 310217
r4_0[310217] = r6_0
r4_0[310218] = {
  HatredIncrement = 40,
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_528,
  TaskId = 310218,
}
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_524,
  [2] = {
    FXId = 310214,
    Function = "PlayFX",
    IsAttached = true,
  },
}
r6_0.TaskId = 310219
r4_0[310219] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AttrRates = r0_0.RT_1,
    Function = "CreateUnit",
    MaxSummonCount = 2,
    SingleSummonCount = 2,
    UnitId = 310201,
    UnitType = "MechanismSummon",
  },
}
r6_0.TaskId = 310221
r4_0[310221] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    AimTarget = true,
    FXId = 310207,
    Function = "PlayFX",
    IsAttached = true,
  },
  [2] = {
    AimTarget = true,
    FXId = 310208,
    Function = "PlayFX",
    IsAttached = true,
  },
}
r6_0.TaskId = 310222
r4_0[310222] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "BombCreate",
    PassiveEffectId = 310301,
  },
}
r6_0.TaskId = 310311
r4_0[310311] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AttrRates = r0_0.RT_1,
    Function = "CreateUnit",
    LifeTime = 2,
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 310301,
    UnitType = "Monster",
  },
}
r6_0.TaskId = 310312
r4_0[310312] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "Yeer_Skill01_Enemy",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_180,
  [2] = {
    BossValue = 120,
    CauseHit = "HitFly_XY0Z500",
    Function = "CutToughness",
    Value = 120,
  },
  [3] = r0_0.RT_175,
  [4] = r0_0.RT_530,
  [5] = r0_0.RT_414,
}
r6_0.TaskId = 310313
r4_0[310313] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AttrRates = r0_0.RT_1,
    Function = "CreateUnit",
    LifeTime = 2,
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 310302,
    UnitType = "Monster",
  },
}
r6_0.TaskId = 310314
r4_0[310314] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "Yeer_Skill01_Enemy",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_180,
  [2] = {
    BossValue = 20,
    CauseHit = "HitFly_XY0Z500",
    Function = "CutToughness",
    Value = 20,
  },
  [3] = r0_0.RT_175,
  [4] = r0_0.RT_530,
  [5] = r0_0.RT_414,
}
r6_0.TaskId = 310315
r4_0[310315] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 310303,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 310316
r4_0[310316] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 310303,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 310317
r4_0[310317] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 310301,
    Function = "AddBuff",
    LastTime = -1,
  },
  [2] = {
    AllowSkillSustain = 1,
    AttrRates = r0_0.RT_1,
    FixLocation = true,
    Function = "CreateUnit",
    LifeTime = 15,
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 310303,
    UnitType = "MechanismSummon",
  },
}
r6_0.TaskId = 310321
r4_0[310321] = r6_0
r5_0 = 310322
r6_0 = {
  HatredIncrement = 40,
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "Char_Sphere_Xlarge",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  BaseAttr = "ATK_Char",
  DamageTag = {
    "Skill",
    "Skill2",
    "YeerSkill2Bomb"
  },
  Function = "Damage",
  Rate = "#1",
}
r8_0[2] = {
  BossValue = 70,
  CauseHit = "HitFly_XY0Z500",
  Function = "CutToughness",
  Value = 25,
}
r8_0[3] = r0_0.RT_175
r8_0[4] = {
  Function = "CameraShake",
  IsSceneCameraShake = true,
  OuterRadius = 1000,
  ShakeClass = "BP_Camera_Yeer_Explode_Heavy",
}
r8_0[5] = r0_0.RT_414
r6_0[r7_0] = r8_0
r6_0.TaskId = 310322
r4_0[r5_0] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "RemoveUnit",
    UnitId = 310303,
  },
  [2] = {
    FXId = 310321,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 310323
r4_0[310323] = r6_0
r4_0[310331] = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "Char_Cylinder_Middle",
  TaskEffects = {
    [1] = r0_0.RT_180,
    [2] = r0_0.RT_414,
  },
  TaskId = 310331,
}
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "Yeer_Skill01_Enemy",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_180,
  [2] = {
    BossValue = 120,
    CauseHit = "HitFly_Force_Common",
    Function = "CutToughness",
    Value = 120,
  },
  [3] = r0_0.RT_175,
  [4] = {
    FXId = 2030102,
    Function = "PlayFX",
    Overlap = true,
  },
}
r6_0.TaskId = 310341
r4_0[310341] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHp",
    BuffId = 320111,
    Function = "AddBuff",
    LastTime = 15,
  },
}
r6_0.TaskId = 320111
r4_0[320111] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHp",
    DamageTag = r0_0.RT_179,
    DamageType = "Fire",
    Function = "Damage",
    Rate = "#1",
    Value = "#2",
  },
  [2] = {
    BossValue = 23,
    CauseHit = "LightHit",
    Function = "CutToughness",
    Value = 10,
  },
  [3] = {
    FXId = 320101,
    Function = "PlayFX",
    NormalToHit = true,
  },
  [4] = r0_0.RT_414,
  [5] = {
    Function = "PlaySE",
    SEId = 320104,
  },
}
r6_0.TaskId = 320112
r4_0[320112] = r6_0
r4_0[320123] = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_XLarge",
  TaskEffects = {
    [1] = r0_0.RT_531,
    [2] = r0_0.RT_532,
    [3] = r0_0.RT_533,
    [4] = r0_0.RT_414,
    [5] = r0_0.RT_534,
  },
  TaskId = 320123,
}
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_XLarge",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_531,
  [2] = r0_0.RT_532,
  [3] = r0_0.RT_533,
  [4] = r0_0.RT_414,
  [5] = {
    FXId = 320111,
    Function = "PlayFX",
  },
  [6] = r0_0.RT_534,
}
r6_0.TaskId = 320124
r4_0[320124] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "ExecuteSkill01",
    PassiveEffectId = 320201,
  },
}
r6_0.TaskId = 320212
r4_0[320212] = r6_0
r4_0[320215] = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
  TaskEffects = {
    [1] = r0_0.RT_240,
    [2] = r0_0.RT_189,
    [3] = r0_0.RT_181,
    [4] = r0_0.RT_183,
  },
  TaskId = 320215,
}
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 320203,
    Function = "AddBuff",
    LastTime = -1,
  },
  [2] = {
    BuffId = 320204,
    Condition = 72,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 320222
r4_0[320222] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 320203,
    Function = "RemoveBuff",
  },
  [2] = {
    CreatureId = 320211,
    Function = "RemoveSkillCreature",
  },
  [3] = {
    BuffId = 320204,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 320223
r4_0[320223] = r6_0
r5_0 = 320231
r6_0 = {
  EffectExecuteTiming = "Enter",
}
r7_0 = "TaskEffects"
r8_0 = {
  [1] = r0_0.RT_535,
}
r8_0[2] = {
  AutoAttach = 1,
  CreatureId = 320203,
  Function = "CreateSkillCreature",
  Location = {
    0,
    0,
    70
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 320231
r4_0[r5_0] = r6_0
r5_0 = 320232
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r7_0 = "TaskEffects"
r8_0 = {
  [1] = r0_0.RT_535,
}
r8_0[2] = {
  AutoAttach = 1,
  CreatureId = 320202,
  Function = "CreateSkillCreature",
  Location = {
    -20,
    0,
    50
  },
}
r8_0[3] = {
  AutoAttach = 1,
  CreatureId = 320202,
  Function = "CreateSkillCreature",
  Location = {
    -30,
    0,
    60
  },
}
r8_0[4] = r0_0.RT_537
r8_0[5] = r0_0.RT_537
r8_0[6] = r0_0.RT_537
r8_0[7] = r0_0.RT_537
r8_0[8] = r0_0.RT_537
r8_0[9] = {
  AutoAttach = 1,
  CreatureId = 320202,
  Function = "CreateSkillCreature",
  Location = {
    -10,
    0,
    40
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 320232
r4_0[r5_0] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecuteClientPassiveFunction",
    FunctionName = "CreateEffectCreature01",
  },
}
r6_0.TaskId = 320233
r4_0[320233] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecuteClientPassiveFunction",
    FunctionName = "CreateEffectCreature02",
  },
}
r6_0.TaskId = 320234
r4_0[320234] = r6_0
r6_0 = {
  EffectExecuteTiming = "Leave",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecuteClientPassiveFunction",
    FunctionName = "DissEffectCreature",
  },
}
r6_0.TaskId = 320235
r4_0[320235] = r6_0
r5_0 = 320236
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  BaseAttr = "ATK_Char",
  DamageTag = {
    "Skill",
    "Skill2",
    "KamiPassive"
  },
  Function = "Damage",
  Rate = 0.15,
}
r8_0[2] = r0_0.RT_453
r8_0[3] = r0_0.RT_119
r8_0[4] = {
  BuffId = 320201,
  Function = "AddBuff",
  LastTime = -1,
}
r8_0[5] = r0_0.RT_181
r8_0[6] = r0_0.RT_305
r6_0[r7_0] = r8_0
r6_0.TaskId = 320236
r4_0[r5_0] = r6_0
r4_0[320241] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_489,
  TaskId = 320241,
}
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_538,
    Function = "Damage",
    Rate = 1,
  },
  [2] = r0_0.RT_189,
}
r6_0.TaskId = 320242
r4_0[320242] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_538,
    Function = "Damage",
    Rate = 1.3,
  },
  [2] = r0_0.RT_189,
}
r6_0.TaskId = 320243
r4_0[320243] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 320211,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 320251
r4_0[320251] = r6_0
r4_0[330111] = {
  AllowSkillRangeModify = true,
  ExtraBPFilter = "Common_Random",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_12,
  TargetFilter = "Char_Cylinder_Middle",
  TaskEffects = r0_0.RT_545,
  TaskId = 330111,
}
r4_0[330112] = {
  AllowSkillRangeModify = true,
  ExtraBPFilter = "Maer_Skill01",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle",
  TaskEffects = r0_0.RT_547,
  TaskId = 330112,
}
r4_0[330114] = {
  AllowSkillRangeModify = true,
  ExtraBPFilter = "Common_Random",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_12,
  TargetFilter = "Char_Cylinder_Middle",
  TaskEffects = r0_0.RT_545,
  TaskId = 330114,
}
r4_0[330115] = {
  AllowSkillRangeModify = true,
  ExtraBPFilter = "Maer_Skill01",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle",
  TaskEffects = r0_0.RT_547,
  TaskId = 330115,
}
r6_0 = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "AddSp",
    Reason = "Skill1",
    SkillEfficiency = 1,
    SpChange = -10,
  },
}
r6_0.TaskId = 330116
r4_0[330116] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 330111,
    Function = "CreateSkillCreature",
    Rotation = r0_0.RT_193,
    Scale = r0_0.RT_469,
  },
  [2] = {
    CreatureId = 330111,
    Function = "CreateSkillCreature",
    Rotation = r0_0.RT_143,
    Scale = r0_0.RT_469,
  },
  [3] = {
    CreatureId = 330111,
    Function = "CreateSkillCreature",
    Rotation = r0_0.RT_142,
    Scale = r0_0.RT_469,
  },
}
r6_0.TaskId = 330121
r4_0[330121] = r6_0
r5_0 = 330123
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
}
r6_0.ReplaceEffectParam = {
  Condition = 330111,
  SkillEffect = {
    330124
  },
}
r6_0.TargetFilter = "Char_Sphere_Middle"
r6_0.TaskEffects = {
  [1] = r0_0.RT_213,
  [2] = {
    BossValue = 60,
    CauseHit = "HitFly_Force_Common",
    Function = "CutToughness",
    Value = 30,
  },
  [3] = {
    FXId = 330101,
    Function = "PlayFX",
  },
  [4] = r0_0.RT_548,
  [5] = {
    FeedbackPath = "FE_ExtraLight_L",
    Function = "PlayForceFeedback",
    Tag = "Hit",
  },
}
r6_0.TaskId = 330123
r4_0[r5_0] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_large",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_213,
  [2] = r0_0.RT_549,
  [3] = {
    FXId = 330102,
    Function = "PlayFX",
  },
  [4] = r0_0.RT_548,
}
r6_0.TaskId = 330124
r4_0[330124] = r6_0
r4_0[330125] = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Large",
  TaskEffects = {
    [1] = r0_0.RT_213,
  },
  TaskId = 330125,
}
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_Middle",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_213,
  [2] = r0_0.RT_549,
  [3] = {
    FXId = 330103,
    Function = "PlayFX",
  },
  [4] = {
    Falloff = 0.1,
    Function = "CameraShake",
    IsSceneCameraShake = true,
    OuterRadius = 2000,
    ShakeClass = "BP_CS_Maer_Hit02",
  },
}
r6_0.TaskId = 330126
r4_0[330126] = r6_0
r5_0 = 330127
r6_0 = {}
r6_0.ReplaceEffectParam = {
  Condition = 74,
  SkillEffect = {
    330131
  },
}
r6_0.TargetFilter = "Target"
r6_0.TaskEffects = {
  [1] = {
    Condition = 330112,
    CreatureId = 330112,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 330127
r4_0[r5_0] = r6_0
r5_0 = 330128
r6_0 = {
  TargetFilter = "Target",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  Condition = 330113,
  CreatureId = 330113,
  Function = "CreateSkillCreature",
  Location = {
    150,
    0,
    0
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 330128
r4_0[r5_0] = r6_0
r5_0 = 330129
r6_0 = {
  TargetFilter = "Target",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  Condition = 330113,
  CreatureId = 330114,
  Function = "CreateSkillCreature",
  Location = {
    -150,
    0,
    0
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 330129
r4_0[r5_0] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "SetSkill02Level",
    PassiveEffectId = 330101,
  },
}
r6_0.TaskId = 330130
r4_0[330130] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    Condition = 330112,
    CreatureId = 330115,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 330131
r4_0[330131] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecuteClientPassiveFunction",
    FunctionName = "LaunchHook",
  },
}
r6_0.TaskId = 410112
r4_0[410112] = r6_0
r6_0 = {
  EffectExecuteTiming = "Leave",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecuteClientPassiveFunction",
    FunctionName = "WithdrawHook",
  },
}
r6_0.TaskId = 410113
r4_0[410113] = r6_0
r4_0[410114] = {
  HatredIncrement = 40,
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_180,
    [2] = r0_0.RT_581,
    [3] = r0_0.RT_123,
    [4] = r0_0.RT_290,
    [5] = r0_0.RT_291,
  },
  TaskId = 410114,
}
r4_0[410115] = {
  HatredIncrement = 40,
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_180,
    [2] = r0_0.RT_581,
    [3] = r0_0.RT_123,
    [4] = r0_0.RT_290,
    [5] = r0_0.RT_582,
  },
  TaskId = 410115,
}
r5_0 = 410116
r6_0 = {
  NotifyName = r0_0.RT_9,
}
r6_0.ReplaceEffectParam = {
  Condition = 410103,
  SkillEffect = {
    410117
  },
}
r6_0.TargetFilter = "Self"
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 410101,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 410116
r4_0[r5_0] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 410102,
    Function = "CreateSkillCreature",
  },
  [2] = {
    BuffId = 410102,
    Function = "AddBuff",
    LastTime = 9,
  },
}
r6_0.TaskId = 410117
r4_0[410117] = r6_0
r6_0 = {
  EffectExecuteTiming = "Leave",
  NotifyName = r0_0.RT_13,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 410101,
    Function = "RemoveSkillCreature",
  },
  [2] = {
    CreatureId = 410102,
    Function = "RemoveSkillCreature",
  },
  [3] = {
    BuffId = 410101,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 410118
r4_0[410118] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 410112,
    Function = "AddBuff",
    LastTime = 1.1,
  },
}
r6_0.TaskId = 410119
r4_0[410119] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 410111,
    Function = "AddBuff",
    LastTime = -1,
  },
  [2] = {
    BuffId = 410123,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 410121
r4_0[410121] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_213,
  [2] = {
    BuffId = 410121,
    Function = "AddBuff",
    LastTime = 6,
  },
  [3] = r0_0.RT_581,
  [4] = r0_0.RT_583,
  [5] = r0_0.RT_123,
}
r6_0.TaskId = 410122
r4_0[410122] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_213,
  [2] = {
    BuffId = 410122,
    Function = "AddBuff",
    LastTime = 6,
  },
  [3] = r0_0.RT_581,
  [4] = r0_0.RT_583,
  [5] = r0_0.RT_123,
}
r6_0.TaskId = 410123
r4_0[410123] = r6_0
r4_0[410124] = {
  HatredIncrement = 40,
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_213,
    [2] = r0_0.RT_581,
    [3] = r0_0.RT_583,
    [4] = r0_0.RT_123,
  },
  TaskId = 410124,
}
r4_0[410125] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_584,
  TaskId = 410125,
}
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Sphere_large",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_213,
  [2] = r0_0.RT_123,
  [3] = {
    FXId = 410127,
    Function = "PlayFX",
  },
  [4] = {
    CauseHit = "HitFly_XY0Z500",
    Function = "CutToughness",
    Value = 90,
  },
  [5] = r0_0.RT_582,
}
r6_0.TaskId = 410126
r4_0[410126] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 410111,
    Function = "RemoveBuff",
  },
  [2] = {
    BuffId = 410123,
    Function = "RemoveBuff",
  },
  [3] = {
    FXId = 410131,
    Function = "PlayFX",
    IsAttached = true,
  },
}
r6_0.TaskId = 410131
r4_0[410131] = r6_0
r4_0[410141] = {
  TargetFilter = "Char_Sphere_Small_Trgt",
  TaskEffects = r0_0.RT_584,
  TaskId = 410141,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 410201,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_585,
  },
}
r6_0.TaskId = 410211
r4_0[410211] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 410201,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 410212
r4_0[410212] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  TargetFilter = "Char_Cylinder_Middle180",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_180,
  [2] = {
    BossValue = 40,
    CauseHit = "HitFly_XY0Z500",
    Function = "CutToughness",
    Value = 100,
  },
  [3] = {
    Delaty = 0.07,
    Falloff = 0.1,
    Function = "CameraShake",
    IsSceneCameraShake = true,
    OuterRadius = 500,
    ShakeClass = "BP_Camera_Zhiliu_Skill02",
  },
  [4] = r0_0.RT_586,
}
r6_0.TaskId = 410213
r4_0[410213] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_180,
  [2] = {
    BossValue = 82,
    CauseHit = "HitFly_XY400Z300",
    Function = "CutToughness",
    Value = 100,
  },
  [3] = r0_0.RT_586,
}
r6_0.TaskId = 410214
r4_0[410214] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 410202,
    Function = "AddBuff",
    LastTime = -1,
  },
  [2] = {
    AllowSkillIntensity = 1,
    BaseAttr = "MaxES",
    BaseChar = "Target",
    Function = "AddEnergyShield",
    IsOverShield = 1,
    Rate = 0.04,
  },
  [3] = {
    BuffId = 410251,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 410215
r4_0[410215] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CanBeScaled = true,
    FXId = 410202,
    Function = "PlayFX",
    IsAttached = 1,
  },
}
r6_0.TaskId = 410216
r4_0[410216] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 410211,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_585,
  },
}
r6_0.TaskId = 410221
r4_0[410221] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  TargetFilter = "Char_Cylinder_Large",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_213,
  [2] = {
    BossValue = 89,
    CauseHit = "HitFly_XY800Z400",
    Function = "CutToughness",
    Value = 100,
  },
  [3] = {
    Falloff = 0.1,
    Function = "CameraShake",
    IsSceneCameraShake = true,
    OuterRadius = 1500,
    ShakeClass = "BP_Camera_Zhiliu_Skill02",
  },
  [4] = {
    Function = "PlaySE",
    SEId = 410209,
  },
}
r6_0.TaskId = 410222
r4_0[410222] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 410201,
    Function = "PlayFX",
    IsAttached = 1,
  },
  [2] = {
    CanBeScaled = true,
    FXId = 410204,
    Function = "PlayFX",
    IsAttached = 1,
  },
}
r6_0.TaskId = 410223
r4_0[410223] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_213,
  [2] = {
    BossValue = 105,
    CauseHit = "LightHit",
    Function = "CutToughness",
    Value = 25,
  },
  [3] = {
    Function = "PlaySE",
    SEId = 410212,
  },
}
r6_0.TaskId = 410225
r4_0[410225] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 410231,
    Function = "AddBuff",
    LastTime = 24,
  },
}
r6_0.TaskId = 410226
r4_0[410226] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "OnZhiliuMarkRemove",
    PassiveEffectId = 410201,
  },
}
r6_0.TaskId = 410227
r4_0[410227] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    ATKBase = "ATK_Char",
    CreatureId = 410231,
    Function = "CreateSkillCreature",
    UseSaveLoc = "ZhiliuTT",
  },
  [2] = {
    CreatureId = 410232,
    Delay = 0.16,
    Function = "CreateSkillCreature",
    UseSaveLoc = "ZhiliuTT",
  },
  [3] = {
    CreatureId = 410233,
    Function = "CreateSkillCreature",
    UseSaveLoc = "ZhiliuTT",
  },
}
r6_0.TaskId = 410231
r4_0[410231] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  TargetFilter = "Zhiliu_TT",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_213,
  [2] = {
    BossValue = 90,
    CauseHit = "HitFly_XY0Z500",
    Function = "CutToughness",
    Value = 100,
  },
  [3] = {
    Function = "PlaySE",
    SEId = 410208,
  },
}
r6_0.TaskId = 410232
r4_0[410232] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CanBeScaled = true,
    FXId = 410224,
    Function = "PlayFX",
    IsAttached = 1,
  },
  [2] = r0_0.RT_208,
  [3] = r0_0.RT_209,
  [4] = {
    FXId = 410225,
    Function = "PlayFX",
    IsAttached = 1,
  },
}
r6_0.TaskId = 410233
r4_0[410233] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  TargetFilter = "Zhiliu_TT",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 410233,
    Function = "RemoveSkillCreature",
  },
  [2] = {
    BuffId = 410252,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 410234
r4_0[410234] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 410226,
    Function = "PlayFX",
    IsAttached = 1,
  },
  [2] = {
    FXId = 410227,
    Function = "PlayFX",
    IsAttached = 1,
  },
}
r6_0.TaskId = 410235
r4_0[410235] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  TargetFilter = "Zhiliu_TT",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 410252,
    Function = "AddBuff",
    LastTime = 0.2,
  },
}
r6_0.TaskId = 410236
r4_0[410236] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AttrRates = r0_0.RT_1,
    FormationId = 410201,
    Function = "CreateUnit",
    LifeTime = 7.8,
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 410201,
    UnitType = "Monster",
  },
}
r6_0.TaskId = 410240
r4_0[410240] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    ATKBase = "ATK_Char",
    CreatureId = 410221,
    Function = "CreateSkillCreature",
    UseSaveLoc = "ZhiliuTD",
  },
  [2] = r0_0.RT_587,
  [3] = r0_0.RT_588,
  [4] = {
    ATKBase = "ATK_Char",
    CreatureId = 410224,
    Function = "CreateSkillCreature",
    UseSaveLoc = "ZhiliuTD",
  },
}
r6_0.TaskId = 410241
r4_0[410241] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 410220,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 410242
r4_0[410242] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  TargetFilter = "Char_Cylinder_Large",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_213,
  [2] = {
    BossValue = 25,
    CauseHit = "LightHit",
    Function = "CutToughness",
    Value = 100,
  },
  [3] = r0_0.RT_589,
}
r6_0.TaskId = 410243
r4_0[410243] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 410213,
    Function = "PlayFX",
  },
  [2] = {
    CanBeScaled = true,
    FXId = 410216,
    Function = "PlayFX",
  },
  [3] = r0_0.RT_590,
}
r6_0.TaskId = 410244
r4_0[410244] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  TargetFilter = "Char_Cylinder_Large",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_213,
  [2] = {
    BossValue = 100,
    CauseHit = "HitFly_XY0Z500",
    Function = "CutToughness",
    Value = 100,
  },
  [3] = r0_0.RT_589,
}
r6_0.TaskId = 410245
r4_0[410245] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseChar = "Target",
    CreateWithoutTarget = false,
    CreatureId = 410226,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 410246
r4_0[410246] = r6_0
r6_0 = {
  SkillEffectSourceFlag = "RootSource",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_591,
  [2] = r0_0.RT_592,
  [3] = {
    ATKBase = "ATK_Char",
    CreatureId = 410225,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 410247
r4_0[410247] = r6_0
r4_0[410248] = {
  AllowSkillRangeModify = true,
  TargetFilter = "Char_Cylinder_Middle",
  TaskEffects = r0_0.RT_596,
  TaskId = 410248,
}
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseChar = "Target",
    CreateWithoutTarget = false,
    CreatureId = 410227,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 410249
r4_0[410249] = r6_0
r4_0[410250] = {
  AllowSkillRangeModify = true,
  TargetFilter = "Char_Cylinder_Middle",
  TaskEffects = r0_0.RT_596,
  TaskId = 410250,
}
r6_0 = {
  TargetFilter = "AlmostAllFrd",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 410241,
    Function = "AddBuff",
    LastTime = 16,
  },
}
r6_0.TaskId = 410251
r4_0[410251] = r6_0
r4_0[410252] = {
  TaskEffects = {
    [1] = r0_0.RT_592,
  },
  TaskId = 410252,
}
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AttrRates = r0_0.RT_1,
    FormationId = 410201,
    Function = "CreateUnit",
    LifeTime = 7.8,
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 410202,
    UnitType = "Monster",
  },
}
r6_0.TaskId = 410260
r4_0[410260] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    ATKBase = "ATK_Char",
    CreatureId = 410241,
    Function = "CreateSkillCreature",
    UseSaveLoc = "ZhiliuTD",
  },
  [2] = r0_0.RT_587,
  [3] = r0_0.RT_588,
  [4] = {
    ATKBase = "ATK_Char",
    CreatureId = 410244,
    Function = "CreateSkillCreature",
    UseSaveLoc = "ZhiliuTD",
  },
}
r6_0.TaskId = 410261
r4_0[410261] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 410240,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 410262
r4_0[410262] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 410233,
    Function = "PlayFX",
  },
  [2] = {
    CanBeScaled = true,
    FXId = 410236,
    Function = "PlayFX",
  },
  [3] = r0_0.RT_590,
}
r6_0.TaskId = 410264
r4_0[410264] = r6_0
r6_0 = {
  SkillEffectSourceFlag = "RootSource",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_591,
  [2] = r0_0.RT_592,
  [3] = {
    ATKBase = "ATK_Char",
    CreatureId = 410245,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 410267
r4_0[410267] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_602,
  [2] = {
    BuffId = 420114,
    Condition = 420102,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 420111
r4_0[420111] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  EffectExecuteTiming = "Enter",
  TargetFilter = "Char_Cylinder_Small",
}
r6_0.TaskEffects = {
  [1] = {
    BossValue = 28,
    CauseHit = "LightHit_50",
    Function = "CutToughness",
    Value = 33,
  },
}
r6_0.TaskId = 420112
r4_0[420112] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseChar = "Target",
    CreatureId = 420101,
    DefaultLocationOffset = r0_0.RT_193,
    Delay = 0.1,
    Function = "CreateSkillCreature",
  },
  [2] = {
    Delay = 0.1,
    Function = "CameraShake",
    IsSceneCameraShake = true,
    OuterRadius = 600,
    ShakeClass = "BP_CS_YM_Skill01",
  },
}
r6_0.TaskId = 420113
r4_0[420113] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseChar = "Target",
    CreatureId = 420101,
    DefaultLocationOffset = r0_0.RT_193,
    Delay = 0.3,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 420114
r4_0[420114] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseChar = "Target",
    CreatureId = 420101,
    DefaultLocationOffset = r0_0.RT_193,
    Delay = 0.5,
    Function = "CreateSkillCreature",
  },
  [2] = {
    Delay = 0.5,
    Function = "CameraShake",
    IsSceneCameraShake = true,
    OuterRadius = 600,
    ShakeClass = "BP_CS_YM_Skill01",
  },
}
r6_0.TaskId = 420115
r4_0[420115] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseChar = "Target",
    CreatureId = 420101,
    DefaultLocationOffset = r0_0.RT_193,
    Delay = 0.7,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 420116
r4_0[420116] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseChar = "Target",
    CreatureId = 420101,
    DefaultLocationOffset = r0_0.RT_193,
    Delay = 0.9,
    Function = "CreateSkillCreature",
  },
  [2] = {
    Delay = 0.9,
    Function = "CameraShake",
    IsSceneCameraShake = true,
    OuterRadius = 600,
    ShakeClass = "BP_CS_YM_Skill01",
  },
}
r6_0.TaskId = 420117
r4_0[420117] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_602,
  [2] = {
    BuffCount = 2,
    BuffId = 420114,
    Condition = 420102,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 420118
r4_0[420118] = r6_0
r6_0 = {
  EffectExecuteTiming = "Leave",
  TargetFilter = "Self",
}
r8_0 = {}
r8_0[1] = {
  AttrRates = {
    ATK = 0,
    DEF = 0,
    EnmityValue = 0,
    MaxHp = "#1",
    SkillEfficiency = 0,
    SkillIntensity = 0,
    SkillRange = 0,
    SkillSustain = 0,
    StrongValue = 0,
  },
  AutoAttach = 1,
  Function = "CreateUnit",
  LifeTime = -1,
  MaxSummonCount = 1,
  SingleSummonCount = 1,
  UnitId = 420101,
  UnitType = "Monster",
}
r6_0.TaskEffects = r8_0
r6_0.TaskId = 420121
r4_0[420121] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Large_Front",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_213,
  [2] = {
    BossValue = 46,
    CauseHit = "HitFly_XY800Z400",
    Function = "CutToughness",
    Value = 33,
  },
  [3] = r0_0.RT_603,
  [4] = {
    Condition = 100,
    Dilation = 0,
    Duration = 0.15,
    Function = "HitStop",
  },
}
r6_0.TaskId = 420122
r4_0[420122] = r6_0
r4_0[420123] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_607,
  TaskId = 420123,
}
r4_0[420124] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_607,
  TaskId = 420124,
}
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_180,
  [2] = {
    BossValue = 46,
    CauseHit = "HitDown",
    Function = "CutToughness",
    Value = 33,
  },
}
r6_0.TaskId = 420131
r4_0[420131] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 420103,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 420132
r4_0[420132] = r6_0
r4_0[420133] = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_213,
    [2] = r0_0.RT_606,
    [3] = r0_0.RT_123,
  },
  TaskId = 420133,
}
r6_0 = {
  NotifyName = r0_0.RT_221,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 420114,
    Function = "RemoveBuff",
  },
  [2] = {
    Dilation = 0.5,
    Duration = 0.15,
    Function = "HitStop",
  },
}
r6_0.TaskId = 420140
r4_0[420140] = r6_0
r4_0[420141] = {
  NotifyName = r0_0.RT_221,
  TargetFilter = "AlmostAllFrd",
  TaskEffects = {
    [1] = r0_0.RT_608,
  },
  TaskId = 420141,
}
r6_0 = {
  NotifyName = r0_0.RT_221,
  TargetFilter = "AlmostAllFrd",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_608,
  [2] = {
    BuffId = 420113,
    Function = "AddBuff",
    LastTime = 8,
  },
}
r6_0.TaskId = 420142
r4_0[420142] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Acceleration = 50000,
    AccelerationTime = 0.2,
    Angle = 65,
    Function = "AddCharFallSpeed",
  },
}
r6_0.TaskId = 420143
r4_0[420143] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  AttackRangeType = "Normal",
  NotifyName = r0_0.RT_9,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    DamageTag = r0_0.RT_69,
    DamageType = "Thunder",
    Function = "Damage",
    Rate = "#1",
  },
  [2] = {
    BossValue = 50,
    CauseHit = "HitFly_XY800Z400",
    Function = "CutToughness",
    Value = 50,
  },
}
r6_0.TaskId = 420144
r4_0[420144] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHp",
    DamageType = "HpConsume",
    Function = "Heal",
    Rate = 0.018,
  },
}
r6_0.TaskId = 420145
r4_0[420145] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r8_0 = {}
r8_0[1] = {
  AttrRates = {
    DEF = 0.5,
    ES = 0,
    EnmityValue = 0,
    MaxES = 0,
    MaxHp = 1,
    StrongValue = 0,
  },
  Function = "CreateUnit",
  MaxSummonCount = 1,
  UnitId = 420201,
  UnitType = "MechanismSummon",
}
r8_0[2] = {
  BaseAttr = "DEF",
  BuffId = 420211,
  Function = "AddBuff",
  LastTime = -1,
}
r6_0.TaskEffects = r8_0
r6_0.TaskId = 420211
r4_0[420211] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Large",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 420211,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 420212
r4_0[420212] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "RemoveUnit",
    UnitId = 420201,
  },
  [2] = {
    BuffId = 420211,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 420213
r4_0[420213] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Large",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "DEF",
    DamageTag = r0_0.RT_179,
    DamageType = "Thunder",
    Function = "Damage",
    Rate = "#1",
    Value = "#2",
  },
  [2] = {
    BossValue = 46,
    CauseHit = "HitFly_XY400Z300",
    Delay = 0.1,
    Function = "CutToughness",
    Value = 100,
  },
  [3] = r0_0.RT_603,
}
r6_0.TaskId = 420214
r4_0[420214] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 420202,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_98,
    MaxCount = 3,
  },
}
r6_0.TaskId = 420221
r4_0[420221] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "AlmostAllFrd_Trgt",
}
r6_0.TaskEffects = {
  [1] = {
    AllowSkillIntensity = 1,
    BaseAttr = "DEF",
    Function = "AddEnergyShield",
    IsOverShield = 1,
    Rate = "#1",
    Value = 10,
  },
}
r6_0.TaskId = 420222
r4_0[420222] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  TargetFilter = "Char_Sphere_Middle_Trgt",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_609,
  [2] = {
    BossValue = 16,
    CauseHit = "HitFly_XY200Z300",
    Delay = 0.1,
    Function = "CutToughness",
    Value = 100,
  },
  [3] = {
    CanBeScaled = true,
    FXId = 420221,
    Function = "PlayFX",
  },
  [4] = r0_0.RT_603,
}
r6_0.TaskId = 420223
r4_0[420223] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "Char_Sphere_Middle_Trgt",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_609,
  [2] = {
    BossValue = 16,
    CauseHit = "LightHit",
    Function = "CutToughness",
    Value = 33,
  },
  [3] = r0_0.RT_603,
}
r6_0.TaskId = 420224
r4_0[420224] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  ExtraBPFilter = "Common_AttrFilter",
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "Char_Sphere_Middle_Trgt",
  TargetFilterVars = {
    ConditionId = 420202,
  },
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 203,
    Function = "AddBuff",
    LastTime = 2,
  },
}
r6_0.TaskId = 420225
r4_0[420225] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CanBeScaled = true,
    FXId = 420223,
    Function = "PlayFX",
  },
  [2] = {
    Function = "CameraShake",
    IsSceneCameraShake = true,
    OuterRadius = 1000,
    ShakeClass = "BP_CS_LD_Skill02",
  },
}
r6_0.TaskId = 420226
r4_0[420226] = r6_0
r5_0 = 430111
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Target",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 430111,
  Function = "CreateSkillCreature",
  Location = {
    0,
    450,
    -90
  },
  MaxCount = 3,
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 430111
r4_0[r5_0] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 430112,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_193,
    MaxCount = 3,
  },
}
r6_0.TaskId = 430112
r4_0[430112] = r6_0
r5_0 = 430113
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Middle",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  BaseAttr = "MaxHp",
  DamageTag = {
    "Skill",
    "Skill1",
    "XibiSkill01"
  },
  DamageType = "Thunder",
  Function = "Damage",
  Rate = "#1",
  TriggerProbability = "$Source:GetRootSource():GetFloat(\'Xibi_Skill04_Rate\')$",
  Value = "#2",
}
r8_0[2] = {
  BossValue = 100,
  CauseHit = "HitDown",
  Function = "CutToughness",
  Value = 100,
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 430113
r4_0[r5_0] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 430113,
    Function = "CreateSkillCreature",
    MaxCount = 3,
  },
  [2] = {
    Condition = 74,
    CreatureId = 430114,
    Function = "CreateSkillCreature",
    MaxCount = 3,
  },
}
r6_0.TaskId = 430114
r4_0[430114] = r6_0
r5_0 = 430115
r6_0 = {
  AllowSkillRangeModify = true,
  ExtraBPFilter = "Common_Random",
}
r6_0.ReplaceEffectParam = {
  Condition = 430102,
  SkillEffect = {
    430116
  },
}
r6_0.TargetFilter = "CreatureShape"
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHp",
    DamageTag = r0_0.RT_610,
    DamageType = "Thunder",
    Function = "Damage",
    Rate = "#1",
    TriggerProbability = "$Source:GetRootSource():GetFloat(\'Xibi_Skill04_Rate\')$",
    Value = "#2",
  },
  [2] = {
    BossValue = 35,
    CauseHit = "LightHit_50",
    Function = "CutToughness",
    Value = 15,
  },
  [3] = {
    BaseChar = "Target",
    CreateWithoutTarget = false,
    CreatureId = 430115,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 430115
r4_0[r5_0] = r6_0
r4_0[430116] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_614,
  TaskId = 430116,
}
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_257,
  [2] = {
    Function = "PlaySE",
    SEId = 430102,
  },
}
r6_0.TaskId = 430117
r4_0[430117] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Delay = 0.1,
    Function = "ExecutePassiveFunction",
    FunctionName = "Skill01ConsumeEnergy",
    PassiveEffectId = 430101,
  },
  [2] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "SetRate",
    PassiveEffectId = 430101,
  },
}
r6_0.TaskId = 430118
r4_0[430118] = r6_0
r5_0 = 430119
r6_0 = {
  AllowSkillRangeModify = true,
  ExtraBPFilter = "Common_Random",
}
r6_0.ReplaceEffectParam = {
  Condition = 430102,
  SkillEffect = {
    430120
  },
}
r6_0.TargetFilter = "CreatureShape"
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHp",
    Condition = 430105,
    DamageTag = r0_0.RT_610,
    DamageType = "Thunder",
    Function = "Damage",
    Rate = "#1",
    TriggerProbability = "$Source:GetRootSource():GetFloat(\'Xibi_Skill04_Rate\')$",
    Value = "#2",
  },
  [2] = {
    BossValue = 35,
    CauseHit = "LightHit_50",
    Condition = 430105,
    Function = "CutToughness",
    Value = 15,
  },
  [3] = {
    BaseChar = "Target",
    Condition = 430105,
    CreateWithoutTarget = false,
    CreatureId = 430116,
    Delay = 0.05,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 430119
r4_0[r5_0] = r6_0
r4_0[430120] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_614,
  TaskId = 430120,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r8_0 = {}
r8_0[1] = {
  AttrRates = {
    DEF = 0,
    ES = 0,
    EnmityValue = 0,
    MaxES = 0,
    MaxHp = 100000,
    SkillIntensity = 0,
    StrongValue = 0,
  },
  Camp = "Enemy",
  FixLocation = true,
  FormationId = 430101,
  Function = "CreateUnit",
  LifeTime = 30,
  MaxSummonCount = 1,
  SingleSummonCount = 1,
  UnitId = 430101,
  UnitType = "Monster",
}
r6_0.TaskEffects = r8_0
r6_0.TaskId = 430121
r4_0[430121] = r6_0
r4_0[430122] = {
  HatredIncrement = 40,
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_616,
  TaskId = 430122,
}
r6_0 = {
  AllowSkillRangeModify = true,
  ExtraBPFilter = "Xibi_Skill02",
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Large",
  TargetFilterVars = {
    Id = 430101,
  },
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_615,
  [2] = r0_0.RT_617,
  [3] = {
    FXId = 430153,
    Function = "PlayFX",
  },
  [4] = {
    FXId = 430152,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 430123
r4_0[430123] = r6_0
r4_0[430125] = {
  HatredIncrement = 40,
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_616,
  TaskId = 430125,
}
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 430122,
    Function = "AddBuff",
    LastTime = -1,
  },
  [2] = {
    AimTarget = true,
    FXId = 430151,
    Function = "PlayFX",
    IsAttached = true,
  },
}
r6_0.TaskId = 430151
r4_0[430151] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHp",
    DamageTag = r0_0.RT_246,
    DamageType = "Thunder",
    Function = "Damage",
    Rate = "#1",
    TriggerProbability = 1,
    Value = "#2",
  },
  [2] = {
    BossValue = 23,
    CauseHit = "LightHit_50",
    Function = "CutToughness",
    Value = 33,
  },
  [3] = r0_0.RT_257,
  [4] = {
    BaseChar = "Target",
    CreatureId = 430102,
    DefaultLocationOffset = r0_0.RT_193,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 430155
r4_0[430155] = r6_0
r4_0[510101] = {
  HatredIncrement = 40,
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_622,
    [2] = r0_0.RT_623,
    [3] = r0_0.RT_624,
    [4] = r0_0.RT_625,
    [5] = r0_0.RT_626,
  },
  TaskId = 510101,
}
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_622,
  [2] = r0_0.RT_623,
  [3] = r0_0.RT_624,
  [4] = {
    FXId = 510101,
    Function = "PlayFX",
  },
  [5] = r0_0.RT_625,
  [6] = r0_0.RT_626,
}
r6_0.TaskId = 510102
r4_0[510102] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Delay = 0.05,
    Function = "SpawnDrop",
    UnitId = 1003,
    UnitType = "Drop",
  },
}
r6_0.TaskId = 510103
r4_0[510103] = r6_0
r5_0 = 510111
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 510131,
  Function = "CreateSkillCreature",
  Location = {
    30,
    25,
    36
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 510111
r4_0[r5_0] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  EffectExecuteTiming = "Enter",
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_622,
  [2] = {
    BossValue = 56,
    CauseHit = "HitFly_Force_Songlu",
    Function = "CutToughness",
    Value = 100,
  },
  [3] = {
    BaseChar = "Self",
    FXId = 510121,
    Function = "PlayFX",
  },
  [4] = r0_0.RT_625,
  [5] = r0_0.RT_626,
}
r6_0.TaskId = 510113
r4_0[510113] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "AlmostAllFrd",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 510101,
    Function = "AddBuff",
    LastTime = 6,
  },
  [2] = {
    BaseAttr = "MaxHp",
    DamageType = "Default",
    Function = "Heal",
    Rate = 0.016,
    Value = 30,
  },
}
r6_0.TaskId = 510114
r4_0[510114] = r6_0
r5_0 = 510115
r6_0 = {
  TargetFilter = "Self",
}
r7_0 = "TaskEffects"
r8_0 = {
  [1] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "StartDash",
    PassiveEffectId = 510102,
  },
}
r8_0[2] = {
  CreatureId = 510102,
  Function = "CreateSkillCreature",
  Location = {
    0,
    50,
    30
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 510115
r4_0[r5_0] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "StopDash",
    PassiveEffectId = 510102,
  },
  [2] = {
    CreatureId = 510102,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 510116
r4_0[510116] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "OnSummonHitWall",
    PassiveEffectId = 510102,
  },
}
r6_0.TaskId = 510117
r4_0[510117] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r8_0 = {}
r8_0[1] = {
  AttrRates = {
    ES = 0,
    EnmityValue = 0,
    MaxES = 0,
    MaxHp = 100,
    StrongValue = 0,
  },
  AutoAttach = 1,
  FormationId = 510102,
  Function = "CreateUnit",
  LifeTime = -1,
  MaxSummonCount = 1,
  SingleSummonCount = 1,
  UnitId = 510101,
  UnitType = "Monster",
}
r6_0.TaskEffects = r8_0
r6_0.TaskId = 510121
r4_0[510121] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "RemoveUnit",
    UnitId = 510101,
  },
  [2] = {
    BuffId = 510121,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 510122
r4_0[510122] = r6_0
r5_0 = 510123
r6_0 = {
  EffectExecuteTiming = "Enter",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 510131,
  Function = "CreateSkillCreature",
  Location = {
    0,
    0,
    36
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 510123
r4_0[r5_0] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 510101,
    Function = "CreateSkillCreature",
    MaxCount = 1,
  },
}
r6_0.TaskId = 510124
r4_0[510124] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 510101,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 510125
r4_0[510125] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHp",
    DamageTag = r0_0.RT_40,
    DamageType = "Wind",
    Function = "Damage",
    Rate = "#1",
    Value = "#2",
  },
  [2] = {
    BossValue = 14,
    CauseHit = "HitFly_XY1000Z500",
    Function = "CutToughness",
    Value = 100,
  },
  [3] = r0_0.RT_625,
  [4] = r0_0.RT_626,
}
r6_0.TaskId = 510126
r4_0[510126] = r6_0
r6_0 = {
  TargetFilter = "RootSource",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "OnSkill02Hit",
    PassiveEffectId = 510102,
    Source = "Target",
  },
  [2] = {
    Function = "ExecuteClientPassiveFunction",
    FunctionName = "CameraShake",
    Source = "Target",
  },
}
r6_0.TaskId = 510127
r4_0[510127] = r6_0
r6_0 = {
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_628,
  [2] = {
    BossValue = 14,
    CauseHit = "HitFly_XY400Z300_F",
    Function = "CutToughness",
    Value = 40,
  },
  [3] = r0_0.RT_42,
  [4] = r0_0.RT_629,
  [5] = r0_0.RT_626,
}
r6_0.TaskId = 510141
r4_0[510141] = r6_0
r6_0 = {
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_628,
  [2] = {
    BossValue = 14,
    CauseHit = "HitFly_XY400Z300_F",
    Function = "CutToughness",
    Value = 60,
  },
  [3] = r0_0.RT_42,
  [4] = r0_0.RT_629,
  [5] = r0_0.RT_626,
}
r6_0.TaskId = 510142
r4_0[510142] = r6_0
r4_0[510151] = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_68,
  TaskId = 510151,
}
r6_0 = {
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_628,
  [2] = {
    BossValue = 14,
    CauseHit = "HitFly_XY1000Z500",
    Function = "CutToughness",
    Value = 60,
  },
  [3] = r0_0.RT_625,
  [4] = r0_0.RT_629,
  [5] = r0_0.RT_626,
}
r6_0.TaskId = 510152
r4_0[510152] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 510211,
    Function = "AddBuff",
    LastTime = "#1",
  },
  [2] = r0_0.RT_630,
}
r6_0.TaskId = 510211
r4_0[510211] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 510203,
    Function = "PlayFX",
    IsAttached = true,
  },
  [2] = {
    Delay = 0.05,
    FXId = 510204,
    Function = "PlayFX",
    IsAttached = true,
  },
}
r6_0.TaskId = 510212
r4_0[510212] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 510212,
    Function = "AddBuff",
    LastTime = "#1",
  },
  [2] = r0_0.RT_630,
}
r6_0.TaskId = 510213
r4_0[510213] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 510201,
    Function = "CallBackSkillCreature",
  },
}
r6_0.TaskId = 510221
r4_0[510221] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "AddShield",
    PassiveEffectId = 510201,
  },
}
r6_0.TaskId = 510222
r4_0[510222] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 510222,
    Function = "PlayFX",
    IsAttached = false,
    IsEffectCreature = true,
  },
}
r6_0.TaskId = 510223
r4_0[510223] = r6_0
r5_0 = 510231
r6_0 = {}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 510201,
  Function = "CreateSkillCreature",
  Location = {
    80,
    0,
    0
  },
  MaxCount = 10,
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 510231
r4_0[r5_0] = r6_0
r5_0 = 510232
r6_0 = {}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 510201,
  Function = "CreateSkillCreature",
  Location = {
    -80,
    0,
    0
  },
  MaxCount = 10,
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 510232
r4_0[r5_0] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_246,
    DamageType = "Wind",
    Function = "Damage",
    Rate = "#1",
  },
  [2] = {
    BuffId = 510231,
    Function = "AddBuff",
    LastTime = 15,
  },
  [3] = {
    BossValue = 20,
    CauseHit = "LightHit_50",
    Function = "CutToughness",
    Value = 20,
  },
  [4] = {
    FXId = 510202,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
  [5] = {
    Function = "PlaySE",
    SEId = 510207,
  },
}
r6_0.TaskId = 510233
r4_0[510233] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_632,
  [2] = {
    BuffId = 305,
    Function = "AddBuff",
    LastTime = 0.3,
  },
  [3] = r0_0.RT_633,
  [4] = r0_0.RT_265,
}
r6_0.TaskId = 530111
r4_0[530111] = r6_0
r4_0[530112] = {
  TaskEffects = {
    [1] = r0_0.RT_634,
    [2] = r0_0.RT_634,
    [3] = r0_0.RT_635,
    [4] = r0_0.RT_635,
    [5] = r0_0.RT_636,
    [6] = r0_0.RT_636,
    [7] = r0_0.RT_637,
    [8] = r0_0.RT_637,
  },
  TaskId = 530112,
}
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  NotifyName = r0_0.RT_638,
  TargetFilter = "Char_Sphere_Middle",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 530141,
    Function = "AddBuff",
    LastTime = 1,
  },
}
r6_0.TaskId = 530113
r4_0[530113] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  NotifyName = r0_0.RT_638,
  TargetFilter = "Char_Sphere_Middle",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_180,
  [2] = {
    BossValue = 30,
    CauseHit = "HitFly_XY200Z300",
    Function = "CutToughness",
    Value = 100,
  },
  [3] = r0_0.RT_42,
  [4] = r0_0.RT_639,
}
r6_0.TaskId = 530114
r4_0[530114] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_641,
  [2] = {
    BossValue = 7,
    CauseHit = "HitFly_XY200Z300",
    Function = "CutToughness",
    Value = 15,
  },
  [3] = r0_0.RT_365,
  [4] = {
    BuffId = 530102,
    Function = "AddBuff",
    LastTime = 10,
  },
  [5] = r0_0.RT_639,
}
r6_0.TaskId = 530115
r4_0[530115] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_641,
  [2] = {
    FXId = 530141,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 530116
r4_0[530116] = r6_0
r4_0[530117] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_632,
    [2] = r0_0.RT_633,
  },
  TaskId = 530117,
}
r4_0[530118] = {
  TaskEffects = {
    [1] = r0_0.RT_642,
    [2] = r0_0.RT_642,
    [3] = r0_0.RT_643,
    [4] = r0_0.RT_643,
    [5] = r0_0.RT_644,
    [6] = r0_0.RT_644,
    [7] = r0_0.RT_645,
    [8] = r0_0.RT_645,
  },
  TaskId = 530118,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Condition = 31,
    Function = "OverrideCharVelocity",
    ServerCatchupTime = 0.5,
    VelocityScale = 2500,
  },
  [2] = {
    Condition = 33,
    Function = "OverrideCharVelocity",
    ServerCatchupTime = 0.5,
    VelocityScale = -2000,
  },
  [3] = {
    BuffId = 305,
    Function = "AddBuff",
    LastTime = 0.2,
  },
}
r6_0.TaskId = 530119
r4_0[530119] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 530100,
    Function = "AddBuff",
    LastTime = -1,
  },
  [2] = {
    BuffId = 530101,
    Delay = 1.5,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 530121
r4_0[530121] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffType = 530102,
    Function = "RemoveBuff",
  },
  [2] = {
    BuffId = 530101,
    Delay = 0.05,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 530122
r4_0[530122] = r6_0
r5_0 = 530123
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  Function = "StartLoopShoot",
  LoopInterval = 0.3,
  LoopShootId = 5301,
  SkillEffect = {
    530131
  },
}
r8_0[2] = r0_0.RT_646
r6_0[r7_0] = r8_0
r6_0.TaskId = 530123
r4_0[r5_0] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  TargetFilter = "Saiqi_Skill02_Shoot",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_647,
  [2] = r0_0.RT_648,
  [3] = {
    FXId = 530107,
    Function = "PlayFX",
    Overlap = true,
  },
  [4] = r0_0.RT_42,
  [5] = r0_0.RT_649,
}
r6_0.TaskId = 530124
r4_0[530124] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  TargetFilter = "Saiqi_Skill02_Shoot",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_647,
  [2] = r0_0.RT_648,
  [3] = {
    FXId = 530107,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
    RefinedOverlap = true,
  },
  [4] = r0_0.RT_42,
  [5] = r0_0.RT_649,
}
r6_0.TaskId = 530125
r4_0[530125] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "EndLoopShoot",
    LoopShootId = 5301,
  },
}
r6_0.TaskId = 530126
r4_0[530126] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 530171,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
    RefinedOverlap = true,
  },
  [2] = r0_0.RT_649,
}
r6_0.TaskId = 530127
r4_0[530127] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHp",
    DamageType = "HpConsume",
    Function = "Damage",
    Rate = 0.05,
  },
  [2] = {
    BaseAttr = "MaxHp",
    Function = "AddEnergyShield",
    IsOverShield = 1,
    Rate = 0.075,
  },
}
r6_0.TaskId = 530128
r4_0[530128] = r6_0
r6_0 = {
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_646,
  [2] = {
    ATKBase = "ATK_Ultra",
    AimSkeletal = "hit1",
    CreatureId = 530121,
    Direction = "Camera",
    Function = "CreateSkillCreature",
    UseSaveLoc = "SaiqiShoot0",
  },
  [3] = r0_0.RT_297,
  [4] = {
    ATKBase = "ATK_Ultra",
    AimSkeletal = "hit1",
    CreatureId = 530122,
    Delay = 0.07,
    Direction = "Camera",
    Function = "CreateSkillCreature",
    UseSaveLoc = "SaiqiShoot1",
  },
  [5] = {
    BaseChar = "Self",
    Delay = 0.07,
    Function = "PlaySE",
    SEId = 530105,
  },
  [6] = {
    ATKBase = "ATK_Ultra",
    AimSkeletal = "hit1",
    CreatureId = 530122,
    Delay = 0.15,
    Direction = "Camera",
    Function = "CreateSkillCreature",
    UseSaveLoc = "SaiqiShoot2",
  },
  [7] = {
    BaseChar = "Self",
    Delay = 0.15,
    Function = "PlaySE",
    SEId = 530105,
  },
}
r6_0.TaskId = 530131
r4_0[530131] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHp",
    DamageType = "TrueDamage",
    Function = "Heal",
    Rate = 0.1,
  },
  [2] = {
    BuffId = 530121,
    Function = "AddBuff",
    LastTime = 12,
  },
}
r6_0.TaskId = 530141
r4_0[530141] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "FlyingSkill1",
    PassiveEffectId = 530102,
  },
}
r6_0.TaskId = 530142
r4_0[530142] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 540101,
    Function = "AddBuff",
    LastTime = 15,
  },
}
r6_0.TaskId = 540111
r4_0[540111] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "Skill1AddPassive",
    PassiveEffectId = 540101,
  },
}
r6_0.TaskId = 540112
r4_0[540112] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 540113,
    Function = "AddBuff",
    LastTime = 15,
  },
}
r6_0.TaskId = 540113
r4_0[540113] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "AlmostAllFrd",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_650,
  [2] = {
    BuffId = 540121,
    Function = "AddBuff",
    LastTime = 12,
  },
}
r6_0.TaskId = 540121
r4_0[540121] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Large",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 540102,
    Function = "AddBuff",
    LastTime = 12,
  },
  [2] = {
    BuffId = 540124,
    Function = "AddBuff",
    LastTime = 3,
  },
}
r6_0.TaskId = 540122
r4_0[540122] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "Skill2AddPassive",
    PassiveEffectId = 540101,
  },
}
r6_0.TaskId = 540123
r4_0[540123] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "AlmostAllFrd",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_650,
  [2] = {
    BuffId = 540122,
    Function = "AddBuff",
    LastTime = 12,
  },
}
r6_0.TaskId = 540124
r4_0[540124] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 540201,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 540201
r4_0[540201] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 540202,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 540202
r4_0[540202] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 540203,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 540203
r4_0[540203] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Large",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_651,
  [2] = r0_0.RT_617,
  [3] = {
    BuffId = 540211,
    Function = "AddBuff",
    LastTime = 12,
  },
  [4] = {
    AttrRates = r0_0.RT_1,
    Function = "CreateUnit",
    LifeTime = 10,
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 540201,
    UnitType = "Monster",
  },
}
r6_0.TaskId = 540211
r4_0[540211] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AttrRates = r0_0.RT_1,
    FormationId = 540201,
    Function = "CreateUnit",
    LifeTime = 10,
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 540201,
    UnitType = "Monster",
  },
}
r6_0.TaskId = 540212
r4_0[540212] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AttrRates = r0_0.RT_1,
    FormationId = 540201,
    Function = "CreateUnit",
    LifeTime = 20,
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 540201,
    UnitType = "Monster",
  },
}
r6_0.TaskId = 540213
r4_0[540213] = r6_0
r6_0 = {
  TargetFilter = "Char_Cylinder_Large",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_651,
  [2] = {
    Function = "GatherTargets",
    GatherSpeed = 2000,
    LocationOffset = r0_0.RT_98,
    StopDistance = 50,
  },
}
r6_0.TaskId = 540214
r4_0[540214] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 540221,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 540221
r4_0[540221] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 540221,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 540222
r4_0[540222] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "AlmostAllFrd",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxSp",
    Function = "Heal",
    Rate = 1,
    Value = 35,
  },
  [2] = r0_0.RT_652,
}
r6_0.TaskId = 540231
r4_0[540231] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Large",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxSp",
    DamageTag = r0_0.RT_40,
    DamageType = "Wind",
    Function = "Damage",
    Rate = 1,
  },
  [2] = r0_0.RT_617,
}
r6_0.TaskId = 540232
r4_0[540232] = r6_0
r4_0[540241] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "AlmostAllFrd",
  TaskEffects = r0_0.RT_653,
  TaskId = 540241,
}
r4_0[540242] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "AlmostAllFrd",
  TaskEffects = r0_0.RT_653,
  TaskId = 540242,
}
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 540205,
    Function = "AddBuff",
    LastTime = 3,
  },
}
r6_0.TaskId = 540251
r4_0[540251] = r6_0
r6_0 = {
  AllowSkillRangeModify = true,
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Large",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_651,
  [2] = r0_0.RT_617,
  [3] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "Skill2ComboRemove",
    PassiveEffectId = 540201,
  },
}
r6_0.TaskId = 540252
r4_0[540252] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r6_0.TaskEffects = {
  [1] = {
    Function = "StartAlarm",
  },
}
r6_0.TaskId = 600001
r4_0[600001] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
}
r6_0.TaskEffects = {
  [1] = {
    Function = "TryAlarm",
  },
}
r6_0.TaskId = 600002
r4_0[600002] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r6_0.TaskEffects = {
  [1] = {
    Function = "RescueAlert",
  },
}
r6_0.TaskId = 600003
r4_0[600003] = r6_0
r4_0[600101] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_230_200_180",
  TaskEffects = r0_0.RT_662,
  TaskId = 600101,
}
r4_0[600102] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_230_200_180",
  TaskEffects = r0_0.RT_662,
  TaskId = 600102,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 600101,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 600103
r4_0[600103] = r6_0
r6_0 = {
  TargetFilter = "Mon_Sphere_100_360",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_22,
  [2] = {
    FXId = 600103,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 600104
r4_0[600104] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "root",
    CreatureId = 600101,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 600105
r4_0[600105] = r6_0
r4_0[600106] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_664,
  TaskId = 600106,
}
r4_0[600107] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_666,
  TaskId = 600107,
}
r6_0 = {
  NotifyName = r0_0.RT_667,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 600201,
    ExtraRotation = 105,
    Function = "CreateSkillCreature",
  },
  [2] = {
    CreatureId = 600202,
    ExtraRotation = 105,
    Function = "CreateSkillCreature",
  },
  [3] = {
    CreatureId = 600203,
    ExtraRotation = 105,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 600201
r4_0[600201] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    AimTarget = true,
    FXId = 600205,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 600202
r4_0[600202] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 600206,
    ExtraRotation = 105,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 600203
r4_0[600203] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    Function = "Damage",
    Rate = 0.14,
  },
  [2] = r0_0.RT_668,
  [3] = r0_0.RT_669,
}
r6_0.TaskId = 600204
r4_0[600204] = r6_0
r4_0[600205] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_670,
    [2] = r0_0.RT_668,
    [3] = r0_0.RT_669,
  },
  TaskId = 600205,
}
r4_0[600206] = {
  TaskEffects = r0_0.RT_673,
  TaskId = 600206,
}
r4_0[600207] = {
  TaskEffects = r0_0.RT_673,
  TaskId = 600207,
}
r4_0[600209] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_230_200_180",
  TaskEffects = r0_0.RT_662,
  TaskId = 600209,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_150_400_360",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_674,
  [2] = {
    FXId = 600303,
    Function = "PlayFX",
  },
  [3] = r0_0.RT_5,
}
r6_0.TaskId = 600301
r4_0[600301] = r6_0
r4_0[600302] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Sphere_800_360_OtFr_01",
  TaskEffects = {
    [1] = r0_0.RT_675,
    [2] = r0_0.RT_520,
  },
  TaskId = 600302,
}
r4_0[600303] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_676,
    [2] = r0_0.RT_520,
  },
  TaskId = 600303,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 600301,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 600304
r4_0[600304] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_674,
  [2] = {
    FXId = 600305,
    Function = "PlayFX",
    Overlap = true,
  },
  [3] = {
    Function = "PlaySE",
    SEId = 600202,
  },
}
r6_0.TaskId = 600305
r4_0[600305] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    FXId = 600305,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
}
r6_0.TaskId = 600306
r4_0[600306] = r6_0
r4_0[600401] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_300_200_180",
  TaskEffects = r0_0.RT_678,
  TaskId = 600401,
}
r4_0[600402] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_300_200_180",
  TaskEffects = r0_0.RT_678,
  TaskId = 600402,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 600401,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 600403
r4_0[600403] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Sphere_300_360",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    Function = "Damage",
    Rate = 3.54,
  },
  [2] = r0_0.RT_661,
  [3] = r0_0.RT_679,
}
r6_0.TaskId = 600404
r4_0[600404] = r6_0
r4_0[600405] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_680,
    [2] = r0_0.RT_681,
    [3] = r0_0.RT_661,
    [4] = r0_0.RT_679,
  },
  TaskId = 600405,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 600401,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 600406
r4_0[600406] = r6_0
r4_0[600407] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_682,
    [2] = r0_0.RT_661,
  },
  TaskId = 600407,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Mon_Sphere_300_360",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    Function = "Damage",
    Rate = 7,
  },
  [2] = r0_0.RT_681,
  [3] = r0_0.RT_661,
  [4] = r0_0.RT_679,
}
r6_0.TaskId = 600408
r4_0[600408] = r6_0
r4_0[600409] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_20,
  TaskId = 600409,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 600501,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 600501
r4_0[600501] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_22,
  [2] = r0_0.RT_683,
  [3] = {
    FXId = 600502,
    Function = "PlayFX",
    Overlap = true,
  },
}
r6_0.TaskId = 600502
r4_0[600502] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    FXId = 600506,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
}
r6_0.TaskId = 600503
r4_0[600503] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreateDelay = 2,
    FixLocation = true,
    FixLocationZ = 0,
    FormationId = 600501,
    Function = "CreateUnit",
    LifeTime = 10,
    MaxSummonCount = 5,
    SaveLocTag = "Skill01",
    SaveToSaveLoc = 1,
    SingleSummonCount = 2,
    UnitId = 600501,
    UnitType = "MechanismSummon",
  },
  [2] = {
    CreatureId = 600502,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "Skill011",
  },
  [3] = {
    CreatureId = 600502,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "Skill012",
  },
}
r6_0.TaskId = 600504
r4_0[600504] = r6_0
r4_0[600505] = {
  TargetFilter = "Mon_Cylinder_200_40_360_NoMch",
  TaskEffects = {
    [1] = r0_0.RT_683,
  },
  TaskId = 600505,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 600502,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 600506
r4_0[600506] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 600502,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 600507
r4_0[600507] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 600601,
    Function = "CreateSkillCreature",
  },
  [2] = {
    CreatureId = 600602,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 600601
r4_0[600601] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    Function = "Damage",
    Rate = 2.05,
  },
  [2] = {
    FXId = 600602,
    Function = "PlayFX",
    Overlap = true,
  },
  [3] = {
    Function = "PlaySE",
    SEId = 600601,
  },
}
r6_0.TaskId = 600602
r4_0[600602] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    FXId = 600602,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
}
r6_0.TaskId = 600603
r4_0[600603] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 600603,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_193,
  },
}
r6_0.TaskId = 600604
r4_0[600604] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 600603,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 600605
r4_0[600605] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_684,
  [2] = r0_0.RT_685,
  [3] = {
    FXId = 600603,
    Function = "PlayFX",
  },
  [4] = {
    Function = "PlaySE",
    SEId = 600602,
  },
}
r6_0.TaskId = 600606
r4_0[600606] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 600701,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 600701
r4_0[600701] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_674,
  [2] = {
    FXId = 600702,
    Function = "PlayFX",
    Overlap = true,
  },
  [3] = r0_0.RT_686,
}
r6_0.TaskId = 600702
r4_0[600702] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 600702,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
  [2] = r0_0.RT_687,
}
r6_0.TaskId = 600703
r4_0[600703] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 600702,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 600704
r4_0[600704] = r6_0
r4_0[600705] = {
  TargetFilter = "Mon_Sphere_400_360_OtFr",
  TaskEffects = r0_0.RT_689,
  TaskId = 600705,
}
r4_0[600706] = {
  TargetFilter = "Mon_Sphere_400_360",
  TaskEffects = {
    [1] = r0_0.RT_577,
    [2] = r0_0.RT_690,
    [3] = r0_0.RT_686,
  },
  TaskId = 600706,
}
r4_0[600707] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_691,
    [2] = r0_0.RT_692,
    [3] = r0_0.RT_686,
  },
  TaskId = 600707,
}
r4_0[600708] = {
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_692,
    [2] = r0_0.RT_687,
  },
  TaskId = 600708,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 600703,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_193,
  },
}
r6_0.TaskId = 600709
r4_0[600709] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_22,
  [2] = {
    AimTarget = true,
    FXId = 601101,
    Function = "PlayFX",
    IsAttached = true,
  },
}
r6_0.TaskId = 601101
r4_0[601101] = r6_0
r4_0[601201] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_20,
  TaskId = 601201,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 601201,
    ExtraRotation = 105,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 601202
r4_0[601202] = r6_0
r4_0[601203] = {
  TargetFilter = "Mon_Cylinder_300_200_180",
  TaskEffects = {
    [1] = r0_0.RT_670,
    [2] = r0_0.RT_696,
    [3] = r0_0.RT_697,
    [4] = r0_0.RT_698,
  },
  TaskId = 601203,
}
r6_0 = {}
r6_0.TaskEffects = {
  [1] = r0_0.RT_696,
  [2] = {
    Function = "PlaySE",
    SEId = 600203,
    SceneSe = true,
  },
}
r6_0.TaskId = 601204
r4_0[601204] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_667,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 601202,
    ExtraRotation = 105,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 601205
r4_0[601205] = r6_0
r4_0[601206] = {
  TargetFilter = "Mon_Cylinder_300_200_180",
  TaskEffects = {
    [1] = r0_0.RT_699,
    [2] = r0_0.RT_696,
    [3] = r0_0.RT_697,
    [4] = r0_0.RT_698,
  },
  TaskId = 601206,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    FormationId = 601301,
    Function = "BossSPSaveLocs",
    SetSaveLocs = "bubble",
  },
}
r6_0.TaskId = 601301
r4_0[601301] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    BaseChar = "Target",
    CreatureId = 601301,
    Function = "CreateSkillCreature",
    UseRelativeOffset = true,
    UseSaveLoc = "bubble2",
  },
  [2] = {
    BaseChar = "Target",
    CreatureId = 601301,
    Function = "CreateSkillCreature",
    UseRelativeOffset = true,
    UseSaveLoc = "bubble3",
  },
}
r6_0.TaskId = 601302
r4_0[601302] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_674,
  [2] = {
    FXId = 601302,
    Function = "PlayFX",
  },
  [3] = r0_0.RT_700,
  [4] = r0_0.RT_701,
}
r6_0.TaskId = 601303
r4_0[601303] = r6_0
r4_0[601304] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_500_400_90",
  TaskEffects = {
    [1] = r0_0.RT_674,
    [2] = r0_0.RT_700,
    [3] = r0_0.RT_701,
  },
  TaskId = 601304,
}
r4_0[601401] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_300_200_180",
  TaskEffects = {
    [1] = r0_0.RT_677,
    [2] = r0_0.RT_656,
    [3] = r0_0.RT_697,
    [4] = r0_0.RT_5,
  },
  TaskId = 601401,
}
r4_0[601402] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_300_200_180",
  TaskEffects = {
    [1] = r0_0.RT_677,
    [2] = r0_0.RT_656,
    [3] = r0_0.RT_697,
    [4] = r0_0.RT_5,
    [5] = r0_0.RT_679,
  },
  TaskId = 601402,
}
r4_0[601403] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Sphere_400_360",
  TaskEffects = {
    [1] = r0_0.RT_577,
    [2] = r0_0.RT_681,
    [3] = r0_0.RT_656,
    [4] = r0_0.RT_697,
  },
  TaskId = 601403,
}
r4_0[601404] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Sphere_400_360_OtFr",
  TaskEffects = {
    [1] = r0_0.RT_577,
    [2] = r0_0.RT_681,
    [3] = r0_0.RT_656,
  },
  TaskId = 601404,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Sphere_2500_360",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_577,
  [2] = r0_0.RT_656,
  [3] = {
    BuffId = 30400017,
    Function = "AddBuff",
    LastTime = -1,
  },
  [4] = r0_0.RT_679,
}
r6_0.TaskId = 601405
r4_0[601405] = r6_0
r4_0[601406] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_702,
    [2] = r0_0.RT_656,
  },
  TaskId = 601406,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 601501,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 601501
r4_0[601501] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_674,
  [2] = {
    FXId = 601502,
    Function = "PlayFX",
    Overlap = true,
  },
  [3] = r0_0.RT_703,
}
r6_0.TaskId = 601502
r4_0[601502] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 601502,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
}
r6_0.TaskId = 601503
r4_0[601503] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 601502,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 601504
r4_0[601504] = r6_0
r4_0[601505] = {
  TargetFilter = "Mon_Sphere_400_360_OtFr",
  TaskEffects = {
    [1] = r0_0.RT_688,
    [2] = r0_0.RT_10,
    [3] = r0_0.RT_704,
  },
  TaskId = 601505,
}
r4_0[601506] = {
  TargetFilter = "Mon_Sphere_400_360",
  TaskEffects = {
    [1] = r0_0.RT_577,
    [2] = r0_0.RT_690,
    [3] = r0_0.RT_704,
  },
  TaskId = 601506,
}
r4_0[601507] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_691,
    [2] = r0_0.RT_705,
    [3] = r0_0.RT_703,
  },
  TaskId = 601507,
}
r4_0[601508] = {
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_705,
  },
  TaskId = 601508,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 601503,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_193,
  },
}
r6_0.TaskId = 601509
r4_0[601509] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_667,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 601601,
    ExtraRotation = 105,
    Function = "CreateSkillCreature",
  },
  [2] = {
    CreatureId = 601602,
    ExtraRotation = 105,
    Function = "CreateSkillCreature",
  },
  [3] = {
    CreatureId = 601603,
    ExtraRotation = 105,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 601601
r4_0[601601] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    AimTarget = true,
    FXId = 601605,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 601602
r4_0[601602] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 601606,
    ExtraRotation = 105,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 601603
r4_0[601603] = r6_0
r4_0[601604] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_699,
    [2] = r0_0.RT_706,
    [3] = r0_0.RT_707,
  },
  TaskId = 601604,
}
r4_0[601605] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_670,
    [2] = r0_0.RT_706,
    [3] = r0_0.RT_707,
  },
  TaskId = 601605,
}
r4_0[601606] = {
  TaskEffects = r0_0.RT_709,
  TaskId = 601606,
}
r4_0[601607] = {
  TaskEffects = r0_0.RT_709,
  TaskId = 601607,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_230_200_180",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_660,
  [2] = r0_0.RT_661,
  [3] = {
    Function = "PlaySE",
    SEId = 601602,
  },
}
r6_0.TaskId = 601609
r4_0[601609] = r6_0
r4_0[601701] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_230_200_180",
  TaskEffects = r0_0.RT_711,
  TaskId = 601701,
}
r4_0[601702] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_230_200_180",
  TaskEffects = r0_0.RT_711,
  TaskId = 601702,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 601701,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 601703
r4_0[601703] = r6_0
r6_0 = {
  TargetFilter = "Mon_Sphere_100_360",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_22,
  [2] = {
    FXId = 601703,
    Function = "PlayFX",
  },
  [3] = {
    Function = "PlaySE",
    SEId = 601703,
  },
}
r6_0.TaskId = 601704
r4_0[601704] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "root",
    CreatureId = 601701,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 601705
r4_0[601705] = r6_0
r4_0[601706] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_664,
  TaskId = 601706,
}
r4_0[601707] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_666,
  TaskId = 601707,
}
r4_0[700101] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_723,
  TaskId = 700101,
}
r4_0[700102] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_723,
  TaskId = 700102,
}
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    Function = "Damage",
    Rate = 0.75,
  },
  [2] = r0_0.RT_724,
  [3] = r0_0.RT_725,
}
r6_0.TaskId = 700103
r4_0[700103] = r6_0
r4_0[700104] = {
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_726,
    [2] = r0_0.RT_727,
  },
  TaskId = 700104,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    AimTarget = true,
    FXId = 700101,
    Function = "PlayFX",
    IsAttached = true,
  },
}
r6_0.TaskId = 700106
r4_0[700106] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 700101,
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_722,
}
r6_0.TaskId = 700107
r4_0[700107] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    AimTarget = true,
    FXId = 700105,
    Function = "PlayFX",
    IsAttached = true,
  },
}
r6_0.TaskId = 700108
r4_0[700108] = r6_0
r4_0[700109] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_150_200_180",
  TaskEffects = r0_0.RT_729,
  TaskId = 700109,
}
r4_0[700110] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_150_200_180",
  TaskEffects = r0_0.RT_729,
  TaskId = 700110,
}
r6_0 = {
  TargetFilter = "Self",
}
r8_0 = {}
r8_0[1] = {
  AttrRates = {
    ATK = 1,
    DEF = 1,
    ES = 1,
    Hp = 1,
    MaxES = 1,
    MaxHp = 1,
  },
  FixLocation = true,
  FixLocationNav = 1,
  FormationId = 6000005,
  Function = "CreateUnit",
  LifeTime = 12,
  MaxSummonCount = 10,
  SingleSummonCount = 3,
  UnitId = 70010051,
  UnitType = "Monster",
}
r6_0.TaskEffects = r8_0
r6_0.TaskId = 700121
r4_0[700121] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 700102,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 700122
r4_0[700122] = r6_0
r4_0[700201] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_150_200_180",
  TaskEffects = {
    [1] = r0_0.RT_660,
    [2] = r0_0.RT_731,
    [3] = r0_0.RT_5,
  },
  TaskId = 700201,
}
r4_0[700202] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_150_200_180",
  TaskEffects = {
    [1] = r0_0.RT_660,
    [2] = r0_0.RT_733,
    [3] = r0_0.RT_5,
  },
  TaskId = 700202,
}
r4_0[700203] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_230_200_180",
  TaskEffects = {
    [1] = r0_0.RT_660,
    [2] = r0_0.RT_110,
    [3] = r0_0.RT_734,
    [4] = r0_0.RT_5,
  },
  TaskId = 700203,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r8_0 = {}
r8_0[1] = {
  AttrRates = {
    MaxES = 0.5,
    MaxHp = 0.5,
  },
  FixLocation = true,
  FixLocationNav = 1,
  FormationId = 700201,
  Function = "CreateUnit",
  MaxSummonCount = 1,
  SingleSummonCount = 1,
  UnitId = 7006001,
  UnitType = "Monster",
}
r6_0.TaskEffects = r8_0
r6_0.TaskId = 700223
r4_0[700223] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r8_0 = {}
r8_0[1] = {
  AttrRates = {
    MaxES = 0,
    MaxHp = 0.3,
  },
  FixLocation = true,
  FixLocationNav = 1,
  FormationId = 700202,
  Function = "CreateUnit",
  MaxSummonCount = 10,
  SingleSummonCount = 1,
  UnitId = 7007001,
  UnitType = "Monster",
}
r6_0.TaskEffects = r8_0
r6_0.TaskId = 700224
r4_0[700224] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_667,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 700301,
    ExtraRotation = 104,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 700301
r4_0[700301] = r6_0
r4_0[700302] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_735,
    [2] = r0_0.RT_736,
    [3] = r0_0.RT_725,
  },
  TaskId = 700302,
}
r6_0 = {
  NotifyName = r0_0.RT_737,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "root",
    CreatureId = 700302,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_421,
  },
}
r6_0.TaskId = 700303
r4_0[700303] = r6_0
r6_0 = {
  TargetFilter = "Mon_Sphere_400_360",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_577,
  [2] = {
    FXId = 700304,
    Function = "PlayFX",
  },
  [3] = r0_0.RT_738,
}
r6_0.TaskId = 700304
r4_0[700304] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_737,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "root",
    CreatureId = 700303,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_421,
  },
}
r6_0.TaskId = 700305
r4_0[700305] = r6_0
r4_0[700306] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_150_200_180",
  TaskEffects = {
    [1] = r0_0.RT_728,
    [2] = r0_0.RT_4,
    [3] = r0_0.RT_5,
  },
  TaskId = 700306,
}
r6_0 = {
  TargetFilter = "Mon_Sphere_400_360_Fr",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_496,
  [2] = {
    CauseHit = "HeavyHit_80",
    Function = "CutToughness",
    Value = 100,
  },
  [3] = r0_0.RT_738,
}
r6_0.TaskId = 700307
r4_0[700307] = r6_0
r4_0[700308] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_150_200_180",
  TaskEffects = r0_0.RT_729,
  TaskId = 700308,
}
r4_0[700309] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_150_200_180",
  TaskEffects = r0_0.RT_729,
  TaskId = 700309,
}
r4_0[700312] = {
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_736,
    [2] = r0_0.RT_727,
  },
  TaskId = 700312,
}
r4_0[700321] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_150_200_180",
  TaskEffects = {
    [1] = r0_0.RT_728,
    [2] = r0_0.RT_4,
    [3] = r0_0.RT_700,
    [4] = r0_0.RT_5,
  },
  TaskId = 700321,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 700321,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 700322
r4_0[700322] = r6_0
r5_0 = 700323
r6_0 = {
  TargetFilter = "Jt_Ranger_LandMine",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  BaseAttr = "ATK",
  DamageTag = {
    "LandMine"
  },
  Function = "Damage",
  Rate = 7.7,
}
r8_0[2] = r0_0.RT_110
r8_0[3] = {
  FXId = 700305,
  Function = "PlayFX",
}
r8_0[4] = r0_0.RT_738
r8_0[5] = {
  BuffId = 6000113,
  Function = "AddBuff",
  LastTime = 4,
}
r8_0[6] = {
  Function = "PlaySE",
  SEId = 700314,
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 700323
r4_0[r5_0] = r6_0
r6_0 = {
  TargetFilter = "Jt_Ranger_LandMine_Fr",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_496,
  [2] = r0_0.RT_110,
  [3] = r0_0.RT_738,
  [4] = {
    Function = "PlaySE",
    SEId = 700315,
  },
}
r6_0.TaskId = 700324
r4_0[700324] = r6_0
r4_0[700401] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_230_200_180",
  TaskEffects = {
    [1] = r0_0.RT_7,
    [2] = r0_0.RT_740,
    [3] = r0_0.RT_5,
  },
  TaskId = 700401,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 700401,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_421,
  },
}
r6_0.TaskId = 700402
r4_0[700402] = r6_0
r4_0[700403] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_14,
    [2] = r0_0.RT_39,
    [3] = r0_0.RT_4,
    [4] = r0_0.RT_5,
  },
  TaskId = 700403,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 700401,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 700404
r4_0[700404] = r6_0
r4_0[700405] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_150_50_90",
  TaskEffects = {
    [1] = r0_0.RT_7,
    [2] = r0_0.RT_741,
    [3] = r0_0.RT_4,
    [4] = r0_0.RT_5,
  },
  TaskId = 700405,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 700401,
    Function = "PlayFX",
    IsAttached = true,
  },
}
r6_0.TaskId = 700406
r4_0[700406] = r6_0
r4_0[700501] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Jt_Commander_Cylinder_1500_500_360",
  TaskEffects = r0_0.RT_743,
  TaskId = 700501,
}
r4_0[700502] = {
  TargetFilter = "Jt_Commander_Cylinder_1500_500_360",
  TaskEffects = r0_0.RT_745,
  TaskId = 700502,
}
r4_0[700503] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_747,
  TaskId = 700503,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 700601,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 700621
r4_0[700621] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    AimTarget = true,
    FXId = 700601,
    Function = "PlayFX",
    IsAttached = true,
  },
}
r6_0.TaskId = 700622
r4_0[700622] = r6_0
r6_0 = {
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 700602,
    Function = "AddBuff",
    LastTime = 0.5,
  },
}
r6_0.TaskId = 700623
r4_0[700623] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 700601,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 700624
r4_0[700624] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Sphere_400_360_OtFr",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 700701,
    Function = "AddBuff",
    LastTime = 6,
  },
  [2] = r0_0.RT_3,
}
r6_0.TaskId = 700721
r4_0[700721] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Sphere_400_360",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    Function = "Damage",
    Rate = 0.81,
  },
  [2] = r0_0.RT_10,
  [3] = {
    BuffId = 6000114,
    Function = "AddBuff",
    LastTime = 1.5,
  },
  [4] = r0_0.RT_738,
}
r6_0.TaskId = 700722
r4_0[700722] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHp",
    DamageType = "TrueDamage",
    Function = "Damage",
    Rate = 4.5,
  },
}
r6_0.TaskId = 700723
r4_0[700723] = r6_0
r4_0[700731] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Jt_BlastRobot_NoTrolly",
  TaskEffects = {
    [1] = r0_0.RT_660,
    [2] = r0_0.RT_738,
  },
  TaskId = 700731,
}
r4_0[700732] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Jt_BlastRobot_OnlyTrolly",
  TaskEffects = r0_0.RT_578,
  TaskId = 700732,
}
r4_0[700733] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_749,
  TaskId = 700733,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Sphere_600_360_OtFr",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    DamageType = "TrueDamage",
    Function = "Damage",
    Rate = 510,
  },
  [2] = r0_0.RT_110,
  [3] = r0_0.RT_738,
}
r6_0.TaskId = 700741
r4_0[700741] = r6_0
r4_0[700742] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Sphere_600_360",
  TaskEffects = r0_0.RT_750,
  TaskId = 700742,
}
r4_0[700743] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_749,
  TaskId = 700743,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Sphere_600_360_OtFr",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    DamageType = "TrueDamage",
    Function = "Damage",
    Rate = 1,
  },
  [2] = r0_0.RT_110,
  [3] = r0_0.RT_738,
}
r6_0.TaskId = 700751
r4_0[700751] = r6_0
r4_0[700752] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Sphere_600_360",
  TaskEffects = r0_0.RT_750,
  TaskId = 700752,
}
r4_0[700753] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_749,
  TaskId = 700753,
}
r4_0[700801] = {
  NotifyName = r0_0.RT_523,
  TargetFilter = "Mon_Cylinder_300_200_180",
  TaskEffects = {
    [1] = r0_0.RT_22,
    [2] = r0_0.RT_751,
    [3] = r0_0.RT_110,
  },
  TaskId = 700801,
}
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "upperarm_r",
    CreatureId = 700801,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 700802
r4_0[700802] = r6_0
r4_0[700803] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_16,
    [2] = r0_0.RT_752,
    [3] = r0_0.RT_753,
    [4] = r0_0.RT_486,
  },
  TaskId = 700803,
}
r4_0[700804] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_300_200_180",
  TaskEffects = {
    [1] = r0_0.RT_680,
    [2] = r0_0.RT_751,
    [3] = r0_0.RT_754,
  },
  TaskId = 700804,
}
r4_0[700805] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_20,
  TaskId = 700805,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_756,
  [2] = r0_0.RT_758,
  [3] = {
    CreatureId = 700802,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "1",
    UseSaveLoc = "6",
  },
  [4] = {
    CreatureId = 700802,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "2",
    UseSaveLoc = "6",
  },
  [5] = {
    CreatureId = 700802,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "3",
    UseSaveLoc = "6",
  },
  [6] = {
    CreatureId = 700802,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "4",
    UseSaveLoc = "6",
  },
  [7] = {
    CreatureId = 700802,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "",
    UseSaveLoc = "6",
  },
}
r6_0.TaskId = 700806
r4_0[700806] = r6_0
r4_0[700807] = {
  TargetFilter = "Mon_Sphere_300_360",
  TaskEffects = {
    [1] = r0_0.RT_16,
    [2] = r0_0.RT_485,
    [3] = r0_0.RT_759,
    [4] = r0_0.RT_486,
  },
  TaskId = 700807,
}
r6_0 = {
  TargetFilter = "Mon_Sphere_300_360",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_16,
  [2] = {
    FXId = 700805,
    Function = "PlayFX",
    NormalToHit = true,
  },
  [3] = r0_0.RT_759,
  [4] = r0_0.RT_486,
}
r6_0.TaskId = 700808
r4_0[700808] = r6_0
r4_0[700809] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_650_200_100",
  TaskEffects = {
    [1] = r0_0.RT_680,
    [2] = r0_0.RT_110,
    [3] = r0_0.RT_486,
  },
  TaskId = 700809,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "upperarm_r",
    CreatureId = 700803,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 700810
r4_0[700810] = r6_0
r4_0[700811] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Jt_Commander_Cylinder_1500_500_360",
  TaskEffects = r0_0.RT_743,
  TaskId = 700811,
}
r4_0[700812] = {
  TargetFilter = "Jt_Commander_Cylinder_1500_500_360",
  TaskEffects = r0_0.RT_745,
  TaskId = 700812,
}
r4_0[700813] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_747,
  TaskId = 700813,
}
r4_0[700814] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Mon_Cylinder_150_50_90",
  TaskEffects = {
    [1] = r0_0.RT_3,
    [2] = r0_0.RT_751,
    [3] = r0_0.RT_700,
  },
  TaskId = 700814,
}
r4_0[700815] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_16,
    [2] = r0_0.RT_752,
    [3] = r0_0.RT_486,
  },
  TaskId = 700815,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 700801,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 700816
r4_0[700816] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 700801,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 700817
r4_0[700817] = r6_0
r4_0[700901] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_230_200_40",
  TaskEffects = r0_0.RT_761,
  TaskId = 700901,
}
r4_0[700902] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_230_200_40",
  TaskEffects = r0_0.RT_761,
  TaskId = 700902,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Mon_Cylinder_230_200_40",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_660,
  [2] = r0_0.RT_661,
  [3] = r0_0.RT_10,
  [4] = {
    Function = "PlaySE",
    SEId = 700902,
  },
}
r6_0.TaskId = 700903
r4_0[700903] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 700901,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_762,
  },
}
r6_0.TaskId = 700904
r4_0[700904] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 700901,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 700905
r4_0[700905] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_660,
  [2] = r0_0.RT_10,
  [3] = r0_0.RT_661,
  [4] = {
    Function = "PlaySE",
    SEId = 700903,
  },
}
r6_0.TaskId = 700906
r4_0[700906] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 701001,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 701001
r4_0[701001] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_3,
  [2] = {
    FXId = 701002,
    Function = "PlayFX",
    Overlap = true,
  },
  [3] = r0_0.RT_763,
}
r6_0.TaskId = 701002
r4_0[701002] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    FXId = 701002,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
}
r6_0.TaskId = 701003
r4_0[701003] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 701002,
    Function = "CreateSkillCreature",
  },
  [2] = {
    CreatureId = 701003,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 701004
r4_0[701004] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_3,
  [2] = {
    FXId = 701004,
    Function = "PlayFX",
    Overlap = true,
  },
  [3] = r0_0.RT_763,
}
r6_0.TaskId = 701005
r4_0[701005] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    FXId = 701004,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
}
r6_0.TaskId = 701006
r4_0[701006] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    FXId = 701005,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 701007
r4_0[701007] = r6_0
r4_0[701008] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Sphere_800_360_OtFr",
  TaskEffects = {
    [1] = r0_0.RT_675,
    [2] = r0_0.RT_764,
  },
  TaskId = 701008,
}
r4_0[701009] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_676,
    [2] = r0_0.RT_764,
  },
  TaskId = 701009,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 701101,
    Function = "AddBuff",
    LastTime = 15,
  },
}
r6_0.TaskId = 701101
r4_0[701101] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 701101,
    Function = "AddBuff",
    LastTime = 60,
  },
}
r6_0.TaskId = 701102
r4_0[701102] = r6_0
r4_0[701201] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_150_200_180",
  TaskEffects = {
    [1] = r0_0.RT_765,
    [2] = r0_0.RT_731,
    [3] = r0_0.RT_5,
  },
  TaskId = 701201,
}
r4_0[701202] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_150_200_180",
  TaskEffects = {
    [1] = r0_0.RT_765,
    [2] = r0_0.RT_733,
    [3] = r0_0.RT_5,
  },
  TaskId = 701202,
}
r4_0[701203] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_230_200_180",
  TaskEffects = {
    [1] = r0_0.RT_765,
    [2] = r0_0.RT_110,
    [3] = r0_0.RT_734,
    [4] = r0_0.RT_5,
  },
  TaskId = 701203,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 701301,
    ExtraRotation = 104,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 701301
r4_0[701301] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    Function = "Damage",
    Rate = 0.54,
  },
  [2] = r0_0.RT_766,
  [3] = {
    Function = "PlaySE",
    SEId = 700322,
  },
}
r6_0.TaskId = 701302
r4_0[701302] = r6_0
r4_0[701303] = {
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_766,
  },
  TaskId = 701303,
}
r6_0 = {
  NotifyName = r0_0.RT_737,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "root",
    CreatureId = 701302,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_421,
  },
}
r6_0.TaskId = 701304
r4_0[701304] = r6_0
r6_0 = {
  TargetFilter = "Mon_Sphere_400_360",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_577,
  [2] = {
    FXId = 701303,
    Function = "PlayFX",
  },
  [3] = r0_0.RT_738,
  [4] = r0_0.RT_754,
  [5] = {
    Function = "PlaySE",
    SEId = 700324,
  },
}
r6_0.TaskId = 701305
r4_0[701305] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_230_200_180",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_7,
  [2] = r0_0.RT_740,
  [3] = r0_0.RT_754,
  [4] = {
    Function = "PlaySE",
    SEId = 700401,
  },
}
r6_0.TaskId = 701401
r4_0[701401] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 701401,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_421,
  },
}
r6_0.TaskId = 701402
r4_0[701402] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 701401,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 701403
r4_0[701403] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_14,
  [2] = r0_0.RT_682,
  [3] = {
    FXId = 701401,
    Function = "PlayFX",
    IsFaceToChar = true,
  },
  [4] = {
    Function = "PlaySE",
    SEId = 700402,
  },
}
r6_0.TaskId = 701404
r4_0[701404] = r6_0
r4_0[701501] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_768,
  TaskId = 701501,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 701501,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_769,
    SetSavelocAsTarget = "",
  },
  [2] = {
    CreatureId = 701501,
    Delay = 0.1,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_769,
    SetSavelocAsTarget = "",
  },
}
r6_0.TaskId = 701502
r4_0[701502] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_674,
  [2] = {
    FXId = 701502,
    Function = "PlayFX",
    Overlap = true,
  },
  [3] = r0_0.RT_686,
}
r6_0.TaskId = 701503
r4_0[701503] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 701502,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
  [2] = r0_0.RT_687,
}
r6_0.TaskId = 701504
r4_0[701504] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 701502,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_769,
  },
}
r6_0.TaskId = 701505
r4_0[701505] = r6_0
r4_0[701506] = {
  TargetFilter = "Mon_Sphere_400_360_OtFr",
  TaskEffects = r0_0.RT_689,
  TaskId = 701506,
}
r6_0 = {
  TargetFilter = "Mon_Sphere_400_360",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    Function = "Damage",
    Rate = 15,
  },
  [2] = r0_0.RT_690,
  [3] = r0_0.RT_686,
}
r6_0.TaskId = 701507
r4_0[701507] = r6_0
r4_0[701508] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_691,
    [2] = r0_0.RT_770,
    [3] = r0_0.RT_686,
  },
  TaskId = 701508,
}
r4_0[701509] = {
  TaskEffects = {
    [1] = r0_0.RT_770,
  },
  TaskId = 701509,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 701503,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_193,
  },
}
r6_0.TaskId = 701510
r4_0[701510] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "SaveLoc",
    IsOnGround = true,
    Tag = "CorpTarget",
    TargetType = "Target",
  },
}
r6_0.TaskId = 701511
r4_0[701511] = r6_0
r4_0[701512] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "RootSource",
  TaskEffects = r0_0.RT_772,
  TaskId = 701512,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 701504,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_193,
  },
}
r6_0.TaskId = 701513
r4_0[701513] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 701501,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 701514
r4_0[701514] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 701501,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 701515
r4_0[701515] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 701601,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 701601
r4_0[701601] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 701601,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 701602
r4_0[701602] = r6_0
r6_0 = {
  TargetFilter = "Mon_Sphere_50_360",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_502,
  [2] = {
    FXId = 701602,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
  [3] = {
    Function = "PlaySE",
    SEId = 701601,
  },
}
r6_0.TaskId = 701603
r4_0[701603] = r6_0
r4_0[701604] = {
  TargetFilter = "Mon_Sphere_50_360",
  TaskEffects = r0_0.RT_503,
  TaskId = 701604,
}
r6_0 = {
  TargetFilter = "Mon_Sphere_400_360_OtFr",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHP",
    DamageType = "TrueDamage",
    Function = "Damage",
    Rate = 0.1,
  },
  [2] = r0_0.RT_621,
  [3] = r0_0.RT_773,
  [4] = {
    FXId = 701603,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 701605
r4_0[701605] = r6_0
r4_0[701606] = {
  TargetFilter = "Mon_Sphere_400_360",
  TaskEffects = {
    [1] = r0_0.RT_496,
    [2] = r0_0.RT_10,
    [3] = r0_0.RT_773,
  },
  TaskId = 701606,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 800101,
    ExtraRotation = 105,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 800101
r4_0[800101] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 800102,
    ExtraRotation = 105,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 800102
r4_0[800102] = r6_0
r4_0[800103] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_774,
    [2] = r0_0.RT_724,
    [3] = r0_0.RT_775,
  },
  TaskId = 800103,
}
r4_0[800104] = {
  TaskEffects = {
    [1] = r0_0.RT_726,
  },
  TaskId = 800104,
}
r4_0[800105] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_150_200_180",
  TaskEffects = r0_0.RT_777,
  TaskId = 800105,
}
r4_0[800106] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_150_200_180",
  TaskEffects = r0_0.RT_777,
  TaskId = 800106,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    AimTarget = true,
    FXId = 800103,
    Function = "PlayFX",
    IsAttached = true,
  },
}
r6_0.TaskId = 800107
r4_0[800107] = r6_0
r4_0[800108] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_778,
    [2] = r0_0.RT_724,
    [3] = r0_0.RT_775,
  },
  TaskId = 800108,
}
r4_0[800201] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_200_200_180",
  TaskEffects = r0_0.RT_6,
  TaskId = 800201,
}
r4_0[800202] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_200_200_180",
  TaskEffects = r0_0.RT_6,
  TaskId = 800202,
}
r4_0[800203] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_300_200_180",
  TaskEffects = r0_0.RT_8,
  TaskId = 800203,
}
r4_0[800204] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Mon_Cylinder_300_200_180_180",
  TaskEffects = r0_0.RT_11,
  TaskId = 800204,
}
r4_0[800205] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Mon_Cylinder_300_200_180",
  TaskEffects = r0_0.RT_11,
  TaskId = 800205,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 800201,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 800206
r4_0[800206] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 800201,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 800207
r4_0[800207] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 800202,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 800208
r4_0[800208] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 800202,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 800209
r4_0[800209] = r6_0
r4_0[800210] = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "Mon_Cylinder_300_200_360",
  TaskEffects = {
    [1] = r0_0.RT_779,
    [2] = r0_0.RT_4,
    [3] = r0_0.RT_10,
    [4] = r0_0.RT_5,
  },
  TaskId = 800210,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 6000200,
    Function = "AddBuff",
    LastTime = -1,
  },
  [2] = {
    BuffId = 6000202,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 800211
r4_0[800211] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 6000200,
    Function = "RemoveBuff",
  },
  [2] = {
    BuffId = 6000202,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 800212
r4_0[800212] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 800301,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 800301
r4_0[800301] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_3,
  [2] = {
    FXId = 800304,
    Function = "PlayFX",
    Overlap = true,
  },
  [3] = {
    Function = "PlaySE",
    SEId = 800301,
  },
}
r6_0.TaskId = 800302
r4_0[800302] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    FXId = 800304,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
}
r6_0.TaskId = 800303
r4_0[800303] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 800302,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_98,
  },
}
r6_0.TaskId = 800304
r4_0[800304] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_780,
  [2] = r0_0.RT_3,
  [3] = {
    Function = "PlaySE",
    SEId = 800302,
  },
}
r6_0.TaskId = 800305
r4_0[800305] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_675,
  [2] = {
    FXId = 800305,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 800306
r4_0[800306] = r6_0
r4_0[850011] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossXibi_Skill01_Whip01",
  TaskEffects = r0_0.RT_783,
  TaskId = 850011,
}
r4_0[850012] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossXibi_Skill01_Whip02",
  TaskEffects = r0_0.RT_784,
  TaskId = 850012,
}
r4_0[850013] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BossXibi_Dash_Whip01",
  TaskEffects = r0_0.RT_787,
  TaskId = 850013,
}
r4_0[850014] = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "BossXibi_Dash_Whip02",
  TaskEffects = r0_0.RT_787,
  TaskId = 850014,
}
r4_0[850015] = {
  NotifyName = r0_0.RT_405,
  TargetFilter = "BossXibi_Dash_Sword",
  TaskEffects = r0_0.RT_784,
  TaskId = 850015,
}
r4_0[850016] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_791,
  TaskId = 850016,
}
r4_0[850017] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_793,
  TaskId = 850017,
}
r4_0[850018] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_794,
  TaskId = 850018,
}
r4_0[850021] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossXibi_Skill02_Sword01",
  TaskEffects = r0_0.RT_784,
  TaskId = 850021,
}
r4_0[850022] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossXibi_Skill02_Sword02",
  TaskEffects = r0_0.RT_783,
  TaskId = 850022,
}
r4_0[850023] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BossXibi_Dash_Whip01",
  TaskEffects = r0_0.RT_799,
  TaskId = 850023,
}
r4_0[850024] = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "BossXibi_Dash_Whip02",
  TaskEffects = r0_0.RT_799,
  TaskId = 850024,
}
r4_0[850025] = {
  NotifyName = r0_0.RT_405,
  TargetFilter = "BossXibi_Dash_Sword",
  TaskEffects = r0_0.RT_784,
  TaskId = 850025,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850041,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_425,
  },
}
r6_0.TaskId = 850041
r4_0[850041] = r6_0
r4_0[850042] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_806,
  TaskId = 850042,
}
r4_0[850051] = {
  NotifyName = r0_0.RT_2,
  TaskEffects = r0_0.RT_808,
  TaskId = 850051,
}
r4_0[850052] = {
  TargetFilter = "Mon_Sphere_200_360",
  TaskEffects = r0_0.RT_810,
  TaskId = 850052,
}
r4_0[850061] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_812,
  TaskId = 850061,
}
r4_0[850062] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_814,
  TaskId = 850062,
}
r4_0[850063] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BossXibi_Skill06_Donut01",
  TaskEffects = r0_0.RT_816,
  TaskId = 850063,
}
r4_0[850064] = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "BossXibi_Skill06_Donut02",
  TaskEffects = r0_0.RT_816,
  TaskId = 850064,
}
r4_0[850065] = {
  NotifyName = r0_0.RT_405,
  TargetFilter = "BossXibi_Skill06_Donut03",
  TaskEffects = r0_0.RT_816,
  TaskId = 850065,
}
r4_0[850071] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossXibi_Skill07",
  TaskEffects = r0_0.RT_820,
  TaskId = 850071,
}
r4_0[850081] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossXibi_Dash_Whip01",
  TaskEffects = r0_0.RT_787,
  TaskId = 850081,
}
r4_0[850082] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossXibi_Dash_Whip02",
  TaskEffects = r0_0.RT_787,
  TaskId = 850082,
}
r4_0[850083] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BossXibi_Dash_Sword",
  TaskEffects = r0_0.RT_784,
  TaskId = 850083,
}
r4_0[850084] = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_768,
  TaskId = 850084,
}
r4_0[850085] = {
  NotifyName = r0_0.RT_405,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_812,
  TaskId = 850085,
}
r4_0[850086] = {
  NotifyName = r0_0.RT_505,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_824,
  TaskId = 850086,
}
r4_0[850087] = {
  NotifyName = r0_0.RT_821,
  TargetFilter = "BossXibi_Skill08_Jump",
  TaskEffects = {
    [1] = r0_0.RT_779,
    [2] = r0_0.RT_805,
    [3] = r0_0.RT_826,
    [4] = r0_0.RT_5,
  },
  TaskId = 850087,
}
r4_0[850201] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossSaiqi_Skill01_Cylinder_450_200_270",
  TaskEffects = r0_0.RT_845,
  TaskId = 850201,
}
r4_0[850202] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossSaiqi_Skill01_Cylinder_450_200_270",
  TaskEffects = r0_0.RT_848,
  TaskId = 850202,
}
r4_0[850203] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BossSaiqi_Skill01_Cylinder_450_200_270",
  TaskEffects = r0_0.RT_849,
  TaskId = 850203,
}
r4_0[850204] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_852,
  TaskId = 850204,
}
r4_0[850205] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_16,
    [2] = r0_0.RT_110,
    [3] = r0_0.RT_844,
  },
  TaskId = 850205,
}
r4_0[850206] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_854,
  TaskId = 850206,
}
r4_0[850207] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_856,
  TaskId = 850207,
}
r4_0[850208] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossSaiqi_Skill04_Cylinder_300_200_360",
  TaskEffects = r0_0.RT_857,
  TaskId = 850208,
}
r4_0[850209] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossSaiqi_Skill13_Cylinder_300_200_360",
  TaskEffects = r0_0.RT_859,
  TaskId = 850209,
}
r4_0[850210] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_860,
  },
  TaskId = 850210,
}
r4_0[850211] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_865,
  TaskId = 850211,
}
r4_0[850212] = {
  NotifyName = r0_0.RT_866,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_872,
  TaskId = 850212,
}
r4_0[850213] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_875,
  TaskId = 850213,
}
r4_0[850214] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_878,
  TaskId = 850214,
}
r4_0[850215] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_881,
  TaskId = 850215,
}
r4_0[850216] = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_884,
  TaskId = 850216,
}
r4_0[850217] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_925,
    [2] = r0_0.RT_885,
  },
  TaskId = 850217,
}
r4_0[850218] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = {
    [1] = r0_0.RT_886,
    [2] = r0_0.RT_888,
  },
  TaskId = 850218,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850209,
    Function = "CreateSkillCreature",
    UseSaveLoc = "",
  },
}
r6_0.TaskId = 850219
r4_0[850219] = r6_0
r4_0[850220] = {
  TargetFilter = "BossSaiqi_Skill07_Cylinder_300_800_360",
  TaskEffects = r0_0.RT_890,
  TaskId = 850220,
}
r4_0[850221] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_891,
  TaskId = 850221,
}
r4_0[850222] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
  TaskEffects = {
    [1] = r0_0.RT_893,
  },
  TaskId = 850222,
}
r4_0[850223] = {
  TargetFilter = "Mon_Sphere_300_360",
  TaskEffects = r0_0.RT_894,
  TaskId = 850223,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "CreateUnit",
    LifeTime = 1.3,
    UnitId = 850281,
    UnitType = "MechanismSummon",
  },
}
r6_0.TaskId = 850224
r4_0[850224] = r6_0
r4_0[850225] = {
  TargetFilter = "LaserTarget",
  TaskEffects = r0_0.RT_895,
  TaskId = 850225,
}
r4_0[850226] = {
  TargetFilter = "LaserTarget",
  TaskEffects = r0_0.RT_896,
  TaskId = 850226,
}
r4_0[850227] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_898,
  TaskId = 850227,
}
r4_0[850228] = {
  NotifyName = r0_0.RT_899,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_891,
  TaskId = 850228,
}
r4_0[850229] = {
  NotifyName = r0_0.RT_900,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_902,
  TaskId = 850229,
}
r4_0[850230] = {
  TargetFilter = "Mon_Sphere_300_360",
  TaskEffects = {
    [1] = r0_0.RT_22,
    [2] = r0_0.RT_903,
  },
  TaskId = 850230,
}
r4_0[850231] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_891,
  TaskId = 850231,
}
r4_0[850232] = {
  NotifyName = r0_0.RT_904,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_906,
  TaskId = 850232,
}
r4_0[850233] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Mon_Sphere_300_360",
  TaskEffects = r0_0.RT_907,
  TaskId = 850233,
}
r4_0[850234] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_908,
  TaskId = 850234,
}
r4_0[850235] = {
  NotifyName = r0_0.RT_909,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_911,
  TaskId = 850235,
}
r4_0[850236] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_913,
  TaskId = 850236,
}
r4_0[850237] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossSaiqi_Skill01_Cylinder_450_200_270",
  TaskEffects = r0_0.RT_914,
  TaskId = 850237,
}
r4_0[850238] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_891,
  TaskId = 850238,
}
r4_0[850239] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Mon_Sphere_300_360",
  TaskEffects = r0_0.RT_915,
  TaskId = 850239,
}
r4_0[850240] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Mon_Sphere_300_360",
  TaskEffects = r0_0.RT_916,
  TaskId = 850240,
}
r4_0[850301] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossShijingzhe_Skill01_L",
  TaskEffects = r0_0.RT_929,
  TaskId = 850301,
}
r4_0[850302] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossShijingzhe_Skill02_Cylinder01",
  TaskEffects = r0_0.RT_931,
  TaskId = 850302,
}
r4_0[850303] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_933,
  TaskId = 850303,
}
r4_0[850304] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossShijingzhe_Skill03_Cylinder_1000_200_360",
  TaskEffects = r0_0.RT_936,
  TaskId = 850304,
}
r4_0[850305] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_938,
  TaskId = 850305,
}
r6_0 = {
  TargetFilter = "BossShijingzhe_Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_14,
  [2] = {
    CauseHit = "BossShijingzhe_Effect850306",
    Function = "CutToughness",
    Value = 100,
  },
  [3] = r0_0.RT_927,
  [4] = r0_0.RT_928,
}
r6_0.TaskId = 850306
r4_0[850306] = r6_0
r4_0[850307] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_940,
  TaskId = 850307,
}
r4_0[850308] = {
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_22,
    [2] = r0_0.RT_110,
    [3] = r0_0.RT_927,
    [4] = r0_0.RT_928,
  },
  TaskId = 850308,
}
r4_0[850309] = {
  NotifyName = r0_0.RT_2,
  TaskEffects = r0_0.RT_942,
  TaskId = 850309,
}
r4_0[850310] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_3,
    [2] = r0_0.RT_943,
    [3] = r0_0.RT_927,
    [4] = r0_0.RT_928,
  },
  TaskId = 850310,
}
r5_0 = 850311
r6_0 = {
  NotifyName = {
    "hit2",
    "hit3",
    "hit4",
    "hit5",
    "hit6"
  },
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850302,
    Function = "CreateSkillCreature",
    UseSaveLoc = "",
  },
}
r6_0.TaskId = 850311
r4_0[r5_0] = r6_0
r4_0[850312] = {
  TargetFilter = "BossShijingzhe_Target",
  TaskEffects = {
    [1] = r0_0.RT_16,
    [2] = r0_0.RT_753,
    [3] = r0_0.RT_927,
    [4] = r0_0.RT_928,
  },
  TaskId = 850312,
}
r4_0[850313] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_891,
  TaskId = 850313,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r8_0 = {}
r8_0[1] = {
  Function = "EffectFunction",
  FunctionName = "RandomAreaLocation",
  Vars = {
    Distance = 600,
    MaxNum = 4,
    Radius = 1500,
  },
}
r8_0[2] = r0_0.RT_964
r8_0[3] = r0_0.RT_965
r8_0[4] = r0_0.RT_966
r8_0[5] = r0_0.RT_967
r6_0.TaskEffects = r8_0
r6_0.TaskId = 850314
r4_0[850314] = r6_0
r4_0[850315] = {
  NotifyName = r0_0.RT_12,
  TaskEffects = r0_0.RT_973,
  TaskId = 850315,
}
r4_0[850316] = {
  TargetFilter = "BossShijingzhe_Cylinder_100_100_360",
  TaskEffects = {
    [1] = r0_0.RT_3,
    [2] = r0_0.RT_943,
    [3] = r0_0.RT_927,
    [4] = r0_0.RT_935,
  },
  TaskId = 850316,
}
r4_0[850317] = {
  NotifyName = r0_0.RT_2,
  TaskEffects = r0_0.RT_975,
  TaskId = 850317,
}
r4_0[850318] = {
  TargetFilter = "BossShijingzhe_Target",
  TaskEffects = {
    [1] = r0_0.RT_16,
    [2] = r0_0.RT_926,
    [3] = r0_0.RT_985,
    [4] = r0_0.RT_927,
    [5] = r0_0.RT_953,
  },
  TaskId = 850318,
}
r4_0[850319] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossShijingzhe_Skill01_R",
  TaskEffects = {
    [1] = r0_0.RT_7,
    [2] = r0_0.RT_926,
    [3] = r0_0.RT_927,
    [4] = r0_0.RT_928,
  },
  TaskId = 850319,
}
r4_0[850320] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossShijingzhe_Skill02_Cylinder02",
  TaskEffects = r0_0.RT_945,
  TaskId = 850320,
}
r4_0[850321] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossShijingzhe_Cylinder_320_250_360",
  TaskEffects = r0_0.RT_931,
  TaskId = 850321,
}
r4_0[850322] = {
  TargetFilter = "BossShijingzhe_Cylinder_1000_200_360",
  TaskEffects = {
    [1] = r0_0.RT_16,
    [2] = r0_0.RT_984,
    [3] = r0_0.RT_927,
    [4] = r0_0.RT_928,
  },
  TaskId = 850322,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850303,
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_995,
}
r6_0.TaskId = 850323
r4_0[850323] = r6_0
r6_0 = {
  TargetFilter = "BossShijingzhe_Cylinder_600_350_360",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_3,
  [2] = {
    CauseHit = "BossShijingzhe_Effect850324",
    Function = "CutToughness",
    Value = 100,
  },
  [3] = r0_0.RT_927,
}
r6_0.TaskId = 850324
r4_0[850324] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r6_0.TaskEffects = {
  [1] = {
    BoneName = "head",
    DanmakuTemplateId = 850302,
    Duration = 3.5,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 850325
r4_0[850325] = r6_0
r4_0[850326] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossShijingzhe_Skill05_RushPillar",
  TaskEffects = r0_0.RT_952,
  TaskId = 850326,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "Hp",
    DamageType = "TrueDamage",
    Function = "Damage",
    Rate = 0.172,
  },
}
r6_0.TaskId = 850327
r4_0[850327] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "Hp",
    DamageType = "TrueDamage",
    Function = "Damage",
    Rate = 0.229,
  },
}
r6_0.TaskId = 850328
r4_0[850328] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "Hp",
    DamageType = "TrueDamage",
    Function = "Damage",
    Rate = 0.34,
  },
}
r6_0.TaskId = 850329
r4_0[850329] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "Hp",
    DamageType = "TrueDamage",
    Function = "Damage",
    Rate = 0.667,
  },
}
r6_0.TaskId = 850330
r4_0[850330] = r6_0
r4_0[850331] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossShijingzhe_Cylinder_skill12_L",
  TaskEffects = r0_0.RT_977,
  TaskId = 850331,
}
r4_0[850332] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossShijingzhe_Cylinder_skill12_R",
  TaskEffects = r0_0.RT_977,
  TaskId = 850332,
}
r4_0[850333] = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "BossShijingzhe_Skill03_Cylinder_1000_200_360",
  TaskEffects = r0_0.RT_936,
  TaskId = 850333,
}
r4_0[850334] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossShijingzhe_Cylinder_600_350_360",
  TaskEffects = {
    [1] = r0_0.RT_3,
    [2] = r0_0.RT_934,
    [3] = r0_0.RT_927,
    [4] = r0_0.RT_928,
  },
  TaskId = 850334,
}
r4_0[850335] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossShijingzhe_Skill07_Cylinder01",
  TaskEffects = {
    [1] = r0_0.RT_3,
    [2] = r0_0.RT_926,
    [3] = r0_0.RT_927,
    [4] = r0_0.RT_928,
  },
  TaskId = 850335,
}
r5_0 = 850336
r6_0 = {
  NotifyName = {
    "hit2",
    "hit3",
    "hit4",
    "hit5",
    "hit6",
    "hit7",
    "hit8",
    "hit9",
    "hit10",
    "hit11",
    "hit12"
  },
  TargetFilter = "BTTarget",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 850306,
  Function = "CreateSkillCreature",
  Location = {
    0,
    0,
    700
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 850336
r4_0[r5_0] = r6_0
r4_0[850337] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_947,
  TaskId = 850337,
}
r4_0[850338] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BossShijingzhe_Skill07_Cylinder02",
  TaskEffects = {
    [1] = r0_0.RT_22,
    [2] = r0_0.RT_926,
    [3] = r0_0.RT_927,
    [4] = r0_0.RT_928,
  },
  TaskId = 850338,
}
r4_0[850339] = {
  TargetFilter = "BossShijingzhe_Target",
  TaskEffects = {
    [1] = r0_0.RT_16,
    [2] = r0_0.RT_930,
    [3] = r0_0.RT_985,
    [4] = r0_0.RT_927,
    [5] = r0_0.RT_935,
  },
  TaskId = 850339,
}
r4_0[850340] = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "BossShijingzhe_Skill07_Cylinder03",
  TaskEffects = {
    [1] = r0_0.RT_16,
    [2] = r0_0.RT_934,
    [3] = r0_0.RT_927,
    [4] = r0_0.RT_928,
  },
  TaskId = 850340,
}
r6_0 = {
  TargetFilter = "BossShijingzhe_Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    Function = "Damage",
    Rate = 0.334,
  },
  [2] = r0_0.RT_927,
}
r6_0.TaskId = 850341
r4_0[850341] = r6_0
r6_0 = {
  TargetFilter = "Mon_Cylinder_150_400_360",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_995,
  [2] = {
    FXId = 850311,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
  [3] = r0_0.RT_889,
  [4] = {
    CauseHit = "LightHit_60",
    Function = "CutToughness",
    Value = 20,
  },
}
r6_0.TaskId = 850342
r4_0[850342] = r6_0
r4_0[850343] = {
  NotifyName = r0_0.RT_950,
  TargetFilter = "BossShijingzhe_Skill03_Cylinder_1000_200_360",
  TaskEffects = {
    [1] = r0_0.RT_496,
  },
  TaskId = 850343,
}
r4_0[850344] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossShijingzhe_Skill11_Donut01",
  TaskEffects = r0_0.RT_996,
  TaskId = 850344,
}
r4_0[850345] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossShijingzhe_Skill11_Donut02",
  TaskEffects = r0_0.RT_996,
  TaskId = 850345,
}
r4_0[850346] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BossShijingzhe_Skill11_Donut03",
  TaskEffects = r0_0.RT_996,
  TaskId = 850346,
}
r6_0 = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 850317,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 850347
r4_0[850347] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 850318,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 850348
r4_0[850348] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 850319,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 850349
r4_0[850349] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AttrRates = r0_0.RT_997,
    Function = "CreateUnit",
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 850311,
    UnitType = "MechanismSummon",
  },
  [2] = {
    AttrRates = r0_0.RT_998,
    Function = "CreateUnit",
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 850312,
    UnitType = "MechanismSummon",
  },
  [3] = {
    AttrRates = r0_0.RT_997,
    Function = "CreateUnit",
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 850313,
    UnitType = "MechanismSummon",
  },
  [4] = {
    AttrRates = r0_0.RT_998,
    Function = "CreateUnit",
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 850314,
    UnitType = "MechanismSummon",
  },
}
r6_0.TaskId = 850350
r4_0[850350] = r6_0
r4_0[850351] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossShijingzhe_Skill11_Donut01_Pillar",
  TaskEffects = r0_0.RT_952,
  TaskId = 850351,
}
r4_0[850352] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossShijingzhe_Skill11_Donut02_Pillar",
  TaskEffects = r0_0.RT_952,
  TaskId = 850352,
}
r4_0[850353] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BossShijingzhe_Skill11_Donut03_Pillar",
  TaskEffects = r0_0.RT_952,
  TaskId = 850353,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    DanmakuTemplateId = 850419,
    Duration = 10,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 850401
r4_0[850401] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    DanmakuTemplateId = 850402,
    Duration = 5,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 850402
r4_0[850402] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    DanmakuTemplateId = 850404,
    Duration = 5,
    Function = "CreateDanmaku",
  },
  [2] = {
    DanmakuTemplateId = 850416,
    Duration = 5,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 850403
r4_0[850403] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    DanmakuTemplateId = 850406,
    Duration = 7,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 850404
r4_0[850404] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850402,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_999,
  },
  [2] = {
    CreatureId = 850402,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_980,
  },
  [3] = {
    CreatureId = 850402,
    Function = "CreateSkillCreature",
  },
  [4] = {
    CreatureId = 850402,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_804,
  },
  [5] = {
    CreatureId = 850402,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_1000,
  },
}
r6_0.TaskId = 850405
r4_0[850405] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_502,
  [2] = {
    Function = "PlaySE",
    SEId = 850404,
  },
}
r6_0.TaskId = 850406
r4_0[850406] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1002,
  [2] = {
    AttrRates = r0_0.RT_1001,
    FormationId = 850402,
    Function = "CreateUnit",
    LifeTime = 9999,
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 8504004,
    UnitType = "Monster",
  },
  [3] = r0_0.RT_1003,
  [4] = r0_0.RT_1004,
}
r6_0.TaskId = 850407
r4_0[850407] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FixLocation = true,
    Function = "CreateUnit",
    LifeTime = 999,
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 850403,
    UnitType = "MechanismSummon",
  },
  [2] = {
    FixLocation = true,
    Function = "CreateUnit",
    LifeTime = 999,
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 850404,
    UnitType = "MechanismSummon",
  },
}
r6_0.TaskId = 850408
r4_0[850408] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_667,
  TargetFilter = "Mon_Cylinder_300_200_180",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    Function = "Damage",
    Rate = 2.8,
  },
  [2] = r0_0.RT_842,
  [3] = r0_0.RT_1005,
  [4] = r0_0.RT_1006,
}
r6_0.TaskId = 850409
r4_0[850409] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "Mon_Cylinder_300_200_180",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    Function = "Damage",
    Rate = 3.2,
  },
  [2] = r0_0.RT_754,
  [3] = r0_0.RT_1005,
  [4] = r0_0.RT_1006,
}
r6_0.TaskId = 850410
r4_0[850410] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r8_0 = {
  [1] = r0_0.RT_19,
}
r8_0[2] = {
  Function = "EffectFunction",
  FunctionName = "SelfLocation",
  Vars = {
    Tag = 1,
  },
}
r8_0[3] = {
  CreatureId = 850401,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_494,
  Saveloc = "1",
  SetSavelocAsTarget = "",
}
r6_0.TaskEffects = r8_0
r6_0.TaskId = 850411
r4_0[850411] = r6_0
r4_0[850412] = {
  TargetFilter = "Mon_Cylinder_300_200_360",
  TaskEffects = {
    [1] = r0_0.RT_1007,
    [2] = r0_0.RT_1005,
    [3] = r0_0.RT_1006,
  },
  TaskId = 850412,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_300_200_180",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    Function = "Damage",
    Rate = 4.8,
  },
  [2] = r0_0.RT_1005,
  [3] = r0_0.RT_842,
  [4] = r0_0.RT_1006,
}
r6_0.TaskId = 850413
r4_0[850413] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850403,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_36,
  },
}
r6_0.TaskId = 850414
r4_0[850414] = r6_0
r4_0[850415] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_1008,
    [2] = r0_0.RT_1005,
    [3] = r0_0.RT_1009,
    [4] = r0_0.RT_1010,
  },
  TaskId = 850415,
}
r4_0[850416] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Sphere_200_360",
  TaskEffects = {
    [1] = r0_0.RT_1011,
    [2] = r0_0.RT_754,
    [3] = r0_0.RT_1005,
    [4] = r0_0.RT_1010,
  },
  TaskId = 850416,
}
r4_0[850417] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_768,
  TaskId = 850417,
}
r4_0[850418] = {
  TaskId = 850418,
}
r4_0[850419] = {
  TaskId = 850419,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    DanmakuTemplateId = 850403,
    Duration = 4,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 850420
r4_0[850420] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    DanmakuTemplateId = 850405,
    Duration = 2,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 850421
r4_0[850421] = r6_0
r4_0[850422] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_768,
  TaskId = 850422,
}
r6_0 = {
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850405,
    Function = "CreateSkillCreature",
    UseSaveLoc = "",
  },
}
r6_0.TaskId = 850423
r4_0[850423] = r6_0
r4_0[850424] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_1013,
  TaskId = 850424,
}
r4_0[850425] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_1013,
  TaskId = 850425,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHP",
    DamageType = "TrueDamage",
    DefaultHealFX = 0,
    Function = "Damage",
    Rate = 3,
  },
}
r6_0.TaskId = 850426
r4_0[850426] = r6_0
r6_0 = {
  TargetFilter = "Mon_Sphere_400_360",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1008,
  [2] = {
    FXId = 530106,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 850427
r4_0[850427] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850404,
    Function = "CreateSkillCreature",
    UseSaveLoc = "storm",
  },
}
r6_0.TaskId = 850428
r4_0[850428] = r6_0
r6_0 = {
  TargetFilter = "BossSaiqi02_Cylinder_750_2500_360",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_889,
  [2] = r0_0.RT_754,
  [3] = {
    Function = "PlaySE",
    SEId = 850420,
  },
}
r6_0.TaskId = 850429
r4_0[850429] = r6_0
r4_0[850430] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Mon_Sphere_200_360",
  TaskEffects = {
    [1] = r0_0.RT_1011,
    [2] = r0_0.RT_759,
  },
  TaskId = 850430,
}
r4_0[850431] = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "Mon_Sphere_300_360",
  TaskEffects = {
    [1] = r0_0.RT_684,
    [2] = r0_0.RT_39,
  },
  TaskId = 850431,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "CreateUnit",
    LifeTime = 3,
    UnitId = 850401,
    UnitType = "MechanismSummon",
  },
}
r6_0.TaskId = 850432
r4_0[850432] = r6_0
r6_0 = {
  TargetFilter = "LaserTarget",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 850404,
    Function = "AddBuff",
    LastTime = 3,
  },
}
r6_0.TaskId = 850433
r4_0[850433] = r6_0
r6_0 = {
  TargetFilter = "LaserTarget",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 850404,
    BySource = true,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 850434
r4_0[850434] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    DanmakuTemplateId = 850407,
    Duration = 5,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 850435
r4_0[850435] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    DanmakuTemplateId = 850408,
    Duration = 5,
    Function = "CreateDanmaku",
  },
  [2] = {
    DanmakuTemplateId = 850415,
    Duration = 5,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 850436
r4_0[850436] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    DanmakuTemplateId = 850409,
    Duration = 5,
    Function = "CreateDanmaku",
  },
  [2] = {
    DanmakuTemplateId = 850410,
    Duration = 5,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 850437
r4_0[850437] = r6_0
r5_0 = 850438
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 850406,
  Function = "CreateSkillCreature",
  Location = {
    400,
    0,
    200
  },
  Rotation = r0_0.RT_324,
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 850438
r4_0[r5_0] = r6_0
r4_0[850439] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_1014,
  TaskId = 850439,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CantLockTime = 3,
    Function = "CameraUnlock",
  },
}
r6_0.TaskId = 850440
r4_0[850440] = r6_0
r4_0[850441] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_1014,
  TaskId = 850441,
}
r4_0[850442] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
  TaskId = 850442,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    DanmakuTemplateId = 850413,
    Duration = 7,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 850443
r4_0[850443] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    DanmakuTemplateId = 850414,
    Duration = 7,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 850444
r4_0[850444] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AttrRates = r0_0.RT_1001,
    FormationId = 850402,
    Function = "CreateUnit",
    LifeTime = 9999,
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 8504003,
    UnitType = "Monster",
  },
  [2] = {
    AttrRates = r0_0.RT_1001,
    FormationId = 850404,
    Function = "CreateUnit",
    LifeTime = 9999,
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 8504004,
    UnitType = "Monster",
  },
  [3] = r0_0.RT_1003,
  [4] = r0_0.RT_1004,
}
r6_0.TaskId = 850445
r4_0[850445] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1002,
  [2] = {
    AttrRates = r0_0.RT_1001,
    FormationId = 850403,
    Function = "CreateUnit",
    LifeTime = 9999,
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 8504004,
    UnitType = "Monster",
  },
  [3] = r0_0.RT_1003,
  [4] = r0_0.RT_1004,
}
r6_0.TaskId = 850446
r4_0[850446] = r6_0
r4_0[850447] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_1015,
  },
  TaskId = 850447,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850406,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_1016,
    Rotation = r0_0.RT_323,
  },
}
r6_0.TaskId = 850448
r4_0[850448] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850406,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_1017,
  },
}
r6_0.TaskId = 850449
r4_0[850449] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_13,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850406,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_1017,
    Rotation = r0_0.RT_126,
  },
}
r6_0.TaskId = 850450
r4_0[850450] = r6_0
r5_0 = 850451
r6_0 = {
  NotifyName = r0_0.RT_405,
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 850406,
  Function = "CreateSkillCreature",
  Location = {
    400,
    300,
    200
  },
  Rotation = r0_0.RT_126,
}
r8_0[2] = {
  CreatureId = 850406,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_1016,
  Rotation = r0_0.RT_126,
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 850451
r4_0[r5_0] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_505,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850406,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_1017,
    Rotation = r0_0.RT_324,
  },
}
r6_0.TaskId = 850452
r4_0[850452] = r6_0
r5_0 = 850453
r6_0 = {
  NotifyName = r0_0.RT_821,
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 850406,
  Function = "CreateSkillCreature",
  Location = {
    0,
    300,
    500
  },
  Rotation = r0_0.RT_126,
}
r8_0[2] = {
  CreatureId = 850406,
  Function = "CreateSkillCreature",
  Location = {
    0,
    30,
    -100
  },
  Rotation = r0_0.RT_126,
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 850453
r4_0[r5_0] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_825,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850406,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_1017,
    Rotation = r0_0.RT_323,
  },
}
r6_0.TaskId = 850454
r4_0[850454] = r6_0
r5_0 = 850455
r6_0 = {
  NotifyName = {
    "hit9",
    "hit10",
    "hit11",
    "hit12",
    "hit13",
    "hit14",
    "hit15"
  },
  TargetFilter = "BTTarget",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 850407,
  Function = "CreateSkillCreature",
  Location = {
    0,
    300,
    100
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 850455
r4_0[r5_0] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    DanmakuTemplateId = 850418,
    Duration = 4,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 850456
r4_0[850456] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850408,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_999,
  },
  [2] = {
    CreatureId = 850408,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_980,
  },
  [3] = {
    CreatureId = 850408,
    Function = "CreateSkillCreature",
  },
  [4] = {
    CreatureId = 850408,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_804,
  },
  [5] = {
    CreatureId = 850408,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_1000,
  },
}
r6_0.TaskId = 850457
r4_0[850457] = r6_0
r4_0[850458] = {
  TargetFilter = "Mon_Cylinder_300_200_360",
  TaskEffects = {
    [1] = r0_0.RT_3,
    [2] = r0_0.RT_1009,
  },
  TaskId = 850458,
}
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850410,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 850459
r4_0[850459] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850411,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 850460
r4_0[850460] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850412,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 850461
r4_0[850461] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850413,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 850462
r4_0[850462] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850414,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 850463
r4_0[850463] = r6_0
r5_0 = 850464
r6_0 = {}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 850415,
  Function = "CreateSkillCreature",
  Location = {
    250,
    0,
    0
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 850464
r4_0[r5_0] = r6_0
r5_0 = 850465
r6_0 = {}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 850415,
  Function = "CreateSkillCreature",
  Location = {
    -250,
    0,
    0
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 850465
r4_0[r5_0] = r6_0
r4_0[850466] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_1018,
    [2] = r0_0.RT_885,
  },
  TaskId = 850466,
}
r4_0[850501] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossLianhuo_Skill01_Cylinder_01",
  TaskEffects = r0_0.RT_1020,
  TaskId = 850501,
}
r4_0[850502] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossLianhuo_Skill01_Cylinder_02",
  TaskEffects = r0_0.RT_1021,
  TaskId = 850502,
}
r4_0[850503] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BossLianhuo_Skill01_Cylinder_02",
  TaskEffects = {
    [1] = r0_0.RT_16,
    [2] = r0_0.RT_550,
    [3] = r0_0.RT_1019,
  },
  TaskId = 850503,
}
r4_0[850504] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossLianhuo_Skill02_Cylinder_01",
  TaskEffects = r0_0.RT_1022,
  TaskId = 850504,
}
r4_0[850505] = {
  NotifyName = r0_0.RT_1023,
  TargetFilter = "BossLianhuo_Skill02_Cylinder_02",
  TaskEffects = r0_0.RT_1024,
  TaskId = 850505,
}
r4_0[850506] = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "BossLianhuo_Skill02_Cylinder_03",
  TaskEffects = r0_0.RT_1025,
  TaskId = 850506,
}
r4_0[850507] = {
  NotifyName = r0_0.RT_405,
  TargetFilter = "BossLianhuo_Skill02_Cylinder_03",
  TaskEffects = r0_0.RT_1026,
  TaskId = 850507,
}
r4_0[850508] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossLianhuo_Skill03_Cylinder",
  TaskEffects = r0_0.RT_1028,
  TaskId = 850508,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 850501,
    Function = "AddBuff",
    LastTime = 20,
  },
}
r6_0.TaskId = 850509
r4_0[850509] = r6_0
r6_0 = {
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850501,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_36,
  },
}
r6_0.TaskId = 850510
r4_0[850510] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_33,
  [2] = {
    FXId = 601202,
    Function = "PlayFX",
    Overlap = true,
  },
  [3] = r0_0.RT_1027,
}
r6_0.TaskId = 850511
r4_0[850511] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_1023,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1034,
  [2] = {
    CreatureId = 850502,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_1033,
    UseRelativeOffset = true,
    UseSaveLoc = "First1",
  },
  [3] = {
    CreatureId = 850502,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_1033,
    UseRelativeOffset = true,
    UseSaveLoc = "First2",
  },
}
r6_0.TaskId = 850512
r4_0[850512] = r6_0
r4_0[850513] = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_1038,
  TaskId = 850513,
}
r4_0[850514] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_1043,
  TaskId = 850514,
}
r4_0[850515] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_891,
  TaskId = 850515,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850502,
    Function = "CreateSkillCreature",
    UseSaveLoc = "",
  },
}
r6_0.TaskId = 850516
r4_0[850516] = r6_0
r4_0[850517] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_1035,
  TaskId = 850517,
}
r4_0[850518] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossLianhuo_Skill06_Cylinder",
  TaskEffects = r0_0.RT_1044,
  TaskId = 850518,
}
r4_0[850519] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossLianhuo_Skill07_Select",
  TaskEffects = {
    [1] = r0_0.RT_1091,
    [2] = r0_0.RT_1027,
  },
  TaskId = 850519,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossLianhuo_Skill07_GetActor",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 207,
    Function = "AddBuff",
    LastTime = 2.4,
  },
  [2] = r0_0.RT_987,
}
r6_0.TaskId = 850520
r4_0[850520] = r6_0
r4_0[850521] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BossLianhuo_Skill07_GetActor",
  TaskEffects = {
    [1] = r0_0.RT_1091,
    [2] = r0_0.RT_496,
  },
  TaskId = 850521,
}
r6_0 = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "BossLianhuo_Skill07_GetActor",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    Function = "Damage",
    Rate = 2.2,
  },
  [2] = r0_0.RT_681,
}
r6_0.TaskId = 850522
r4_0[850522] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850507,
    Function = "CreateSkillCreature",
    UseSaveLoc = "",
  },
}
r6_0.TaskId = 850523
r4_0[850523] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "AlmostAllEnemy",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ActiveStaticCreator",
    StaticCreatorId = 1660021,
  },
  [2] = r0_0.RT_1015,
}
r6_0.TaskId = 850524
r4_0[850524] = r6_0
r4_0[850525] = {
  NotifyName = r0_0.RT_1054,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_1056,
  TaskId = 850525,
}
r4_0[850526] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_1058,
  TaskId = 850526,
}
r4_0[850527] = {
  NotifyName = r0_0.RT_1059,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_1061,
  TaskId = 850527,
}
r6_0 = {
  NotifyName = r0_0.RT_1066,
  TargetFilter = "AlmostAllEnemy",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "InactiveStaticCreator",
    StaticCreatorId = 1660021,
  },
  [2] = r0_0.RT_1068,
}
r6_0.TaskId = 850528
r4_0[850528] = r6_0
r4_0[850529] = {
  NotifyName = {
    "hit15",
    "hit18",
    "hit22"
  },
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_891,
  TaskId = 850529,
}
r4_0[850530] = {
  NotifyName = r0_0.RT_1065,
  TargetFilter = "BossLianhuo_Skill08_Cylinder",
  TaskEffects = r0_0.RT_1044,
  TaskId = 850530,
}
r4_0[850531] = {
  NotifyName = r0_0.RT_1062,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_1064,
  TaskId = 850531,
}
r4_0[850532] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_768,
  TaskId = 850532,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850506,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_800,
    UseSaveLoc = "",
  },
}
r6_0.TaskId = 850533
r4_0[850533] = r6_0
r6_0 = {
  TargetFilter = "BossLianhuo_Skill07_Select",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_986,
  [2] = r0_0.RT_987,
  [3] = {
    BuffId = 850504,
    Function = "AddBuff",
    LastTime = 5,
  },
}
r6_0.TaskId = 850534
r4_0[850534] = r6_0
r4_0[850535] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BossLianhuo_Skill07_GetActor",
  TaskEffects = r0_0.RT_1053,
  TaskId = 850535,
}
r4_0[850536] = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "BossLianhuo_Skill07_GetActor",
  TaskEffects = r0_0.RT_989,
  TaskId = 850536,
}
r4_0[850537] = {
  TargetFilter = "BossLianhuo_Skill08_Field",
  TaskEffects = {
    [1] = r0_0.RT_817,
    [2] = r0_0.RT_1027,
  },
  TaskId = 850537,
}
r4_0[850538] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossLianhuo_Skill12_Rectangle",
  TaskEffects = r0_0.RT_1085,
  TaskId = 850538,
}
r4_0[850539] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossLianhuo_Skill02_Cylinder_01",
  TaskEffects = r0_0.RT_1087,
  TaskId = 850539,
}
r4_0[850540] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_1084,
  TaskId = 850540,
}
r4_0[850541] = {
  TargetFilter = "Mon_Sphere_200_360",
  TaskEffects = r0_0.RT_1084,
  TaskId = 850541,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1045,
  [2] = {
    CreatureId = 850508,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_1033,
    UseRelativeOffset = true,
    UseSaveLoc = "Fire1",
  },
  [3] = {
    CreatureId = 850508,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_1033,
    UseRelativeOffset = true,
    UseSaveLoc = "Fire2",
  },
  [4] = {
    CreatureId = 850508,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_1033,
    UseRelativeOffset = true,
    UseSaveLoc = "Fire3",
  },
  [5] = {
    CreatureId = 850508,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_1033,
    UseRelativeOffset = true,
    UseSaveLoc = "Fire4",
  },
}
r6_0.TaskId = 850542
r4_0[850542] = r6_0
r4_0[850543] = {
  TargetFilter = "BossLianhuo_Skill06_Cylinder_02",
  TaskEffects = {
    [1] = r0_0.RT_1018,
    [2] = r0_0.RT_1027,
  },
  TaskId = 850543,
}
r4_0[850544] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_1032,
  TaskId = 850544,
}
r4_0[850545] = {
  NotifyName = r0_0.RT_405,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_1040,
  TaskId = 850545,
}
r4_0[850546] = {
  NotifyName = r0_0.RT_1066,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_1067,
  TaskId = 850546,
}
r4_0[850547] = {
  NotifyName = r0_0.RT_1073,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_1077,
  TaskId = 850547,
}
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_817,
  [2] = r0_0.RT_1019,
  [3] = {
    FXId = 850510,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
}
r6_0.TaskId = 850548
r4_0[850548] = r6_0
r4_0[850549] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BossLianhuo_Skill06_Cylinder",
  TaskEffects = r0_0.RT_1051,
  TaskId = 850549,
}
r4_0[850550] = {
  NotifyName = r0_0.RT_1078,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_1080,
  TaskId = 850550,
}
r4_0[850551] = {
  NotifyName = r0_0.RT_1088,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_1090,
  TaskId = 850551,
}
r4_0[850552] = {
  NotifyName = {
    "hit25"
  },
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_1081,
    [2] = r0_0.RT_1092,
  },
  TaskId = 850552,
}
r4_0[850553] = {
  NotifyName = r0_0.RT_1082,
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_1083,
    [2] = r0_0.RT_1093,
  },
  TaskId = 850553,
}
r4_0[850554] = {
  NotifyName = r0_0.RT_1069,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_1072,
  TaskId = 850554,
}
r6_0 = {
  NotifyName = r0_0.RT_405,
  TargetFilter = "BossLianhuo_Skill07_GetActor",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 850505,
    Function = "AddBuff",
    LastTime = 5,
  },
}
r6_0.TaskId = 850555
r4_0[850555] = r6_0
r5_0 = 850601
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_300_200_180",
}
r7_0 = "TaskEffects"
r8_0 = {
  [1] = r0_0.RT_1094,
}
r8_0[2] = {
  Function = "PlayFX",
  FxRotator = {
    30,
    90,
    0
  },
  IsFaceToChar = true,
  WeaponFXGroupName = "Hit2",
}
r8_0[3] = r0_0.RT_700
r8_0[4] = r0_0.RT_1095
r6_0[r7_0] = r8_0
r6_0.TaskId = 850601
r4_0[r5_0] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Mon_Cylinder_300_200_180",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1094,
  [2] = {
    Delay = 0.1,
    Function = "PlayFX",
    FxRotator = r0_0.RT_51,
    IsFaceToChar = true,
    WeaponFXGroupName = "Hit2",
  },
  [3] = r0_0.RT_700,
  [4] = r0_0.RT_1095,
}
r6_0.TaskId = 850602
r4_0[850602] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Mon_Cylinder_300_200_360",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1094,
  [2] = {
    FXId = 850601,
    Function = "PlayFX",
  },
  [3] = r0_0.RT_700,
  [4] = r0_0.RT_1095,
}
r6_0.TaskId = 850603
r4_0[850603] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "Mon_Cylinder_300_200_180",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    DamageTag = r0_0.RT_829,
    Function = "Damage",
    Rate = 1,
  },
  [2] = {
    Delay = 0.05,
    Function = "PlayFX",
    FxRotator = r0_0.RT_57,
    IsFaceToChar = true,
    WeaponFXGroupName = "Hit2",
  },
  [3] = {
    CauseHit = "HitFly_XY400Z300",
    Function = "CutToughness",
    Value = 100,
  },
  [4] = r0_0.RT_1095,
}
r6_0.TaskId = 850604
r4_0[850604] = r6_0
r4_0[850605] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_300_200_180",
  TaskEffects = r0_0.RT_1098,
  TaskId = 850605,
}
r4_0[850606] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Mon_Cylinder_300_200_360",
  TaskEffects = r0_0.RT_1098,
  TaskId = 850606,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_300_200_180",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    DamageTag = r0_0.RT_829,
    Function = "Damage",
    Rate = 2,
  },
  [2] = r0_0.RT_1097,
  [3] = r0_0.RT_1095,
}
r6_0.TaskId = 850607
r4_0[850607] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_300_200_180",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    DamageTag = r0_0.RT_829,
    Function = "Damage",
    Rate = 2.5,
  },
  [2] = r0_0.RT_1097,
  [3] = r0_0.RT_1095,
}
r6_0.TaskId = 850608
r4_0[850608] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_1099,
  TargetFilter = "Mon_Cylinder_300_200_360",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1094,
  [2] = {
    Delay = 0.05,
    Function = "PlayFX",
    FxRotator = r0_0.RT_76,
    IsFaceToChar = true,
    WeaponFXGroupName = "Hit2",
  },
  [3] = r0_0.RT_1095,
}
r6_0.TaskId = 850609
r4_0[850609] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossTuosi_Skill01_Cylinder01",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_3,
  [2] = r0_0.RT_1100,
  [3] = {
    Function = "PlaySE",
    SEId = 850912,
  },
}
r6_0.TaskId = 850901
r4_0[850901] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossTuosi_Skill01_Cylinder02",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1041,
  [2] = r0_0.RT_1100,
  [3] = {
    Function = "PlaySE",
    SEId = 850913,
  },
}
r6_0.TaskId = 850902
r4_0[850902] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossTuosi_Skill02_Cylinder01",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_16,
  [2] = r0_0.RT_10,
  [3] = {
    Function = "PlaySE",
    SEId = 850914,
  },
}
r6_0.TaskId = 850903
r4_0[850903] = r6_0
r4_0[850904] = {
  NotifyName = {
    "hit1",
    "hit10"
  },
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_20,
  TaskId = 850904,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850901,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_193,
  },
}
r6_0.TaskId = 850905
r4_0[850905] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850901,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 850906
r4_0[850906] = r6_0
r4_0[850907] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_1102,
  TaskId = 850907,
}
r4_0[850908] = {
  TargetFilter = "BossTuosi_Skill04_Box",
  TaskEffects = r0_0.RT_1102,
  TaskId = 850908,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850902,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_193,
    SetSavelocAsTarget = "Skill04",
  },
}
r6_0.TaskId = 850909
r4_0[850909] = r6_0
r4_0[850910] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_1102,
  TaskId = 850910,
}
r4_0[850911] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossTuosi_Skill06_Cylinder01",
  TaskEffects = {
    [1] = r0_0.RT_774,
    [2] = r0_0.RT_10,
    [3] = r0_0.RT_1101,
  },
  TaskId = 850911,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossTuosi_Skill06_Cylinder02",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_774,
  [2] = {
    CauseHit = "HitFly_XY300Z1000",
    Function = "CutToughness",
  },
  [3] = r0_0.RT_1101,
}
r6_0.TaskId = 850912
r4_0[850912] = r6_0
r4_0[850913] = {
  TargetFilter = "BossTuosi_Skill06_BoxRotate0",
  TaskEffects = {
    [1] = r0_0.RT_1103,
    [2] = r0_0.RT_17,
    [3] = r0_0.RT_1101,
  },
  TaskId = 850913,
}
r4_0[850914] = {
  TargetFilter = "BossTuosi_Skill06_BoxRotate+45",
  TaskEffects = r0_0.RT_1105,
  TaskId = 850914,
}
r4_0[850915] = {
  TargetFilter = "BossTuosi_Skill06_BoxRotate-45",
  TaskEffects = r0_0.RT_1105,
  TaskId = 850915,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BoneName = "pelvis",
    DanmakuTemplateId = 850901,
    Duration = 0.5,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 850916
r4_0[850916] = r6_0
r4_0[850917] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_33,
    [2] = r0_0.RT_10,
    [3] = r0_0.RT_506,
    [4] = r0_0.RT_1101,
  },
  TaskId = 850917,
}
r4_0[850918] = {
  TaskEffects = r0_0.RT_1107,
  TaskId = 850918,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BoneName = "pelvis",
    DanmakuTemplateId = 850902,
    Duration = 0.5,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 850919
r4_0[850919] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "SetSelfLoc",
    TargetCenterLoc = "StaticCreator",
  },
}
r6_0.TaskId = 850920
r4_0[850920] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FixLocation = true,
    FixLocationZ = 0,
    FormationId = 850901,
    Function = "CreateUnit",
    LifeTime = 14,
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 850901,
    UnitType = "MechanismSummon",
  },
}
r6_0.TaskId = 850921
r4_0[850921] = r6_0
r4_0[850922] = {
  TargetFilter = "BossTuosi_Skill08_CenterBurstCylinder",
  TaskEffects = {
    [1] = r0_0.RT_16,
    [2] = r0_0.RT_17,
    [3] = r0_0.RT_1108,
    [4] = r0_0.RT_1109,
  },
  TaskId = 850922,
}
r6_0 = {
  TargetFilter = "BossTuosi_Skill08_AroundBurstCylinder",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1104,
  [2] = r0_0.RT_17,
  [3] = r0_0.RT_1108,
  [4] = {
    Function = "PlaySE",
    SEId = 850917,
  },
}
r6_0.TaskId = 850923
r4_0[850923] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    DanmakuTemplateId = 850903,
    Duration = 0.5,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 850926
r4_0[850926] = r6_0
r4_0[850927] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_33,
    [2] = r0_0.RT_1110,
    [3] = r0_0.RT_506,
    [4] = r0_0.RT_1109,
  },
  TaskId = 850927,
}
r4_0[850928] = {
  TaskEffects = r0_0.RT_508,
  TaskId = 850928,
}
r6_0 = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    DanmakuTemplateId = 850904,
    Delay = 10,
    Duration = 999,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 850929
r4_0[850929] = r6_0
r4_0[850930] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_496,
    [2] = r0_0.RT_506,
    [3] = r0_0.RT_1111,
  },
  TaskId = 850930,
}
r4_0[850931] = {
  TaskEffects = r0_0.RT_508,
  TaskId = 850931,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850903,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_193,
    SetSavelocAsTarget = "Skill04",
  },
}
r6_0.TaskId = 850932
r4_0[850932] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850904,
    Direction = r0_0.RT_949,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_193,
  },
}
r6_0.TaskId = 850933
r4_0[850933] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850905,
    Direction = r0_0.RT_949,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_193,
  },
}
r6_0.TaskId = 850934
r4_0[850934] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850906,
    Direction = r0_0.RT_949,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_193,
  },
}
r6_0.TaskId = 850935
r4_0[850935] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossTuosi_Skill02_Cylinder02",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_16,
  [2] = r0_0.RT_1100,
  [3] = {
    Function = "PlaySE",
    SEId = 850915,
  },
}
r6_0.TaskId = 850937
r4_0[850937] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_405,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850907,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 850939
r4_0[850939] = r6_0
r6_0 = {
  TargetFilter = "BossTuosi_Skill08_BigBurst",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_16,
  [2] = r0_0.RT_1110,
  [3] = {
    FXId = 850904,
    Function = "PlayFX",
  },
  [4] = r0_0.RT_1109,
}
r6_0.TaskId = 850940
r4_0[850940] = r6_0
r4_0[850941] = {
  NotifyName = r0_0.RT_523,
  TargetFilter = "BossTuosi_Skill07_Hit",
  TaskEffects = {
    [1] = r0_0.RT_1041,
    [2] = r0_0.RT_1100,
    [3] = r0_0.RT_1101,
  },
  TaskId = 850941,
}
r4_0[850942] = {
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_1092,
  },
  TaskId = 850942,
}
r4_0[850943] = {
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_1093,
  },
  TaskId = 850943,
}
r4_0[850944] = {
  NotifyName = r0_0.RT_505,
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_1112,
  },
  TaskId = 850944,
}
r4_0[850945] = {
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_1113,
  },
  TaskId = 850945,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 850922,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 850946
r4_0[850946] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 850908,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 850947
r4_0[850947] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 850910,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 850948
r4_0[850948] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 850912,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 850949
r4_0[850949] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 850907,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 850950
r4_0[850950] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 850909,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 850951
r4_0[850951] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 850911,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 850952
r4_0[850952] = r6_0
r4_0[850953] = {
  TargetFilter = "BossTuosi_Skill05_Box01",
  TaskEffects = {
    [1] = r0_0.RT_14,
    [2] = r0_0.RT_17,
    [3] = r0_0.RT_1101,
  },
  TaskId = 850953,
}
r4_0[850954] = {
  TargetFilter = "BossTuosi_Skill05_Box02",
  TaskEffects = {
    [1] = r0_0.RT_1007,
    [2] = r0_0.RT_17,
    [3] = r0_0.RT_1101,
  },
  TaskId = 850954,
}
r4_0[850955] = {
  TargetFilter = "BossTuosi_Skill05_Box03",
  TaskEffects = {
    [1] = r0_0.RT_774,
    [2] = r0_0.RT_17,
    [3] = r0_0.RT_1101,
  },
  TaskId = 850955,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 850917,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 850956
r4_0[850956] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 850918,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 850957
r4_0[850957] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 850919,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 850958
r4_0[850958] = r6_0
r4_0[850959] = {
  TargetFilter = "Mon_Sphere_100_360",
  TaskEffects = {
    [1] = r0_0.RT_889,
    [2] = r0_0.RT_10,
    [3] = r0_0.RT_661,
    [4] = r0_0.RT_1111,
  },
  TaskId = 850959,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 850920,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 850960
r4_0[850960] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 850921,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 850961
r4_0[850961] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r6_0.TaskEffects = {
  [1] = {
    DanmakuTemplateId = 851001,
    Duration = 10,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 851001
r4_0[851001] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossHeilong_Skill02_Cylinder_Left",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_16,
  [2] = r0_0.RT_1100,
  [3] = {
    Function = "PlaySE",
    SEId = 851002,
  },
}
r6_0.TaskId = 851002
r4_0[851002] = r6_0
r4_0[851003] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossHeilong_Skill02_Cylinder_Right",
  TaskEffects = {
    [1] = r0_0.RT_16,
    [2] = r0_0.RT_1100,
    [3] = r0_0.RT_1114,
  },
  TaskId = 851003,
}
r4_0[851004] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_16,
    [2] = r0_0.RT_1114,
  },
  TaskId = 851004,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851002,
    Function = "CreateSkillCreature",
    UseSaveLoc = "center",
  },
}
r6_0.TaskId = 851005
r4_0[851005] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851003,
    Function = "CreateSkillCreature",
    UseSaveLoc = "center",
  },
}
r6_0.TaskId = 851006
r4_0[851006] = r6_0
r4_0[851007] = {
  TargetFilter = "BossHeilong_Skill04_Cylinder_In",
  TaskEffects = {
    [1] = r0_0.RT_16,
    [2] = r0_0.RT_1115,
    [3] = r0_0.RT_621,
    [4] = r0_0.RT_1116,
  },
  TaskId = 851007,
}
r4_0[851008] = {
  TargetFilter = "BossHeilong_Skill04_Cylinder_Out",
  TaskEffects = {
    [1] = r0_0.RT_16,
    [2] = r0_0.RT_1115,
    [3] = r0_0.RT_685,
    [4] = r0_0.RT_1116,
  },
  TaskId = 851008,
}
r4_0[851009] = {
  TargetFilter = "BossHeilong_Skill04_Cylinder_In",
  TaskEffects = r0_0.RT_1117,
  TaskId = 851009,
}
r4_0[851010] = {
  TargetFilter = "BossHeilong_Skill04_Cylinder_Out",
  TaskEffects = r0_0.RT_1117,
  TaskId = 851010,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AttrRates = r0_0.RT_1118,
    Function = "CreateUnit",
    LifeTime = 30,
    MaxSummonCount = 3,
    SingleSummonCount = 1,
    UnitId = 8510003,
    UnitType = "Monster",
    UseSaveLoc = "FireBall1",
  },
  [2] = {
    AttrRates = r0_0.RT_1118,
    Function = "CreateUnit",
    LifeTime = 30,
    MaxSummonCount = 3,
    SingleSummonCount = 1,
    UnitId = 8510003,
    UnitType = "Monster",
    UseSaveLoc = "FireBall2",
  },
}
r6_0.TaskId = 851011
r4_0[851011] = r6_0
r4_0[851012] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossHeilong_Skill06_Cylinder",
  TaskEffects = r0_0.RT_1121,
  TaskId = 851012,
}
r6_0 = {
  TargetFilter = "BossHeilong_Skill05_Cylinder",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_16,
  [2] = r0_0.RT_1100,
  [3] = {
    FXId = 851006,
    Function = "PlayFX",
  },
  [4] = r0_0.RT_1119,
}
r6_0.TaskId = 851013
r4_0[851013] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
}
r6_0.TaskEffects = {
  [1] = {
    DanmakuTemplateId = 851002,
    Duration = 15,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 851014
r4_0[851014] = r6_0
r4_0[851015] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = {
    [1] = r0_0.RT_19,
    [2] = r0_0.RT_888,
  },
  TaskId = 851015,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851004,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_762,
    UseSaveLoc = "HeilongStrom01",
  },
}
r6_0.TaskId = 851016
r4_0[851016] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 851003,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 851017
r4_0[851017] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 851004,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 851018
r4_0[851018] = r6_0
r4_0[851019] = {
  TargetFilter = "AlmostAllEnemy",
  TaskEffects = {
    [1] = r0_0.RT_358,
    [2] = r0_0.RT_17,
  },
  TaskId = 851019,
}
r4_0[851020] = {
  TargetFilter = "Mon_Sphere_400_360",
  TaskEffects = {
    [1] = r0_0.RT_16,
    [2] = r0_0.RT_1100,
    [3] = r0_0.RT_1122,
  },
  TaskId = 851020,
}
r6_0 = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    DanmakuTemplateId = 851003,
    Duration = 15,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 851021
r4_0[851021] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851006,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_193,
  },
}
r6_0.TaskId = 851022
r4_0[851022] = r6_0
r4_0[851023] = {
  TargetFilter = "Mon_Sphere_600_360",
  TaskEffects = {
    [1] = r0_0.RT_577,
    [2] = r0_0.RT_1100,
    [3] = r0_0.RT_1122,
  },
  TaskId = 851023,
}
r4_0[851024] = {
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_676,
  },
  TaskId = 851024,
}
r6_0 = {
  NotifyName = r0_0.RT_405,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 851003,
    Function = "AddBuff",
    LastTime = 18,
  },
  [2] = r0_0.RT_1123,
}
r6_0.TaskId = 851025
r4_0[851025] = r6_0
r4_0[851026] = {
  TargetFilter = "BossHeilong_Skill08_Cylinder",
  TaskEffects = {
    [1] = r0_0.RT_3,
    [2] = r0_0.RT_1124,
  },
  TaskId = 851026,
}
r4_0[851027] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_1126,
  TaskId = 851027,
}
r6_0 = {
  TargetFilter = "BossHeilong_Skill07_Cylinder",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_16,
  [2] = {
    Function = "PlaySE",
    SEId = 851014,
  },
}
r6_0.TaskId = 851028
r4_0[851028] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_505,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 6000205,
    Function = "AddBuff",
    LastTime = 20,
  },
}
r6_0.TaskId = 851029
r4_0[851029] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AttrRates = r0_0.RT_1118,
    Function = "CreateUnit",
    LifeTime = 30,
    MaxSummonCount = 3,
    SingleSummonCount = 1,
    UnitId = 8510003,
    UnitType = "Monster",
    UseSaveLoc = "IceBall1",
  },
  [2] = {
    AttrRates = r0_0.RT_1118,
    Function = "CreateUnit",
    LifeTime = 30,
    MaxSummonCount = 3,
    SingleSummonCount = 1,
    UnitId = 8510003,
    UnitType = "Monster",
    UseSaveLoc = "IceBall2",
  },
  [3] = {
    AttrRates = r0_0.RT_1118,
    Function = "CreateUnit",
    LifeTime = 30,
    MaxSummonCount = 3,
    SingleSummonCount = 1,
    UnitId = 8510003,
    UnitType = "Monster",
    UseSaveLoc = "IceBall3",
  },
}
r6_0.TaskId = 851030
r4_0[851030] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851007,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Skill0901",
  },
  [2] = {
    CreatureId = 851007,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Skill0902",
  },
  [3] = {
    CreatureId = 851007,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Skill0903",
  },
  [4] = {
    CreatureId = 851007,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Skill0904",
  },
}
r6_0.TaskId = 851031
r4_0[851031] = r6_0
r4_0[851032] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_3,
    [2] = r0_0.RT_1127,
  },
  TaskId = 851032,
}
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851012,
    Function = "CreateSkillCreature",
    UseSaveLoc = "FireRingIn",
  },
}
r6_0.TaskId = 851033
r4_0[851033] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851008,
    Function = "CreateSkillCreature",
    UseSaveLoc = "FireRingIn",
  },
}
r6_0.TaskId = 851034
r4_0[851034] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851009,
    Function = "CreateSkillCreature",
    UseSaveLoc = "FireRingIn",
  },
}
r6_0.TaskId = 851035
r4_0[851035] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851010,
    Function = "CreateSkillCreature",
    UseSaveLoc = "FireRingIn",
  },
}
r6_0.TaskId = 851036
r4_0[851036] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851011,
    Function = "CreateSkillCreature",
    UseSaveLoc = "FireRingIn",
  },
}
r6_0.TaskId = 851037
r4_0[851037] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_405,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 851003,
    Function = "AddBuff",
    LastTime = 13,
  },
  [2] = r0_0.RT_1112,
}
r6_0.TaskId = 851038
r4_0[851038] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_405,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851007,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Skill0905",
  },
  [2] = {
    CreatureId = 851007,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Skill0906",
  },
  [3] = {
    CreatureId = 851007,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Skill0907",
  },
  [4] = {
    CreatureId = 851007,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Skill0908",
  },
}
r6_0.TaskId = 851039
r4_0[851039] = r6_0
r4_0[851040] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_1127,
  },
  TaskId = 851040,
}
r4_0[851041] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossHeilong_Skill06_Cylinder",
  TaskEffects = r0_0.RT_1128,
  TaskId = 851041,
}
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_659,
  [2] = r0_0.RT_10,
  [3] = {
    Function = "PlaySE",
    SEId = 851001,
  },
}
r6_0.TaskId = 851042
r4_0[851042] = r6_0
r4_0[851043] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_659,
    [2] = r0_0.RT_10,
    [3] = r0_0.RT_1124,
  },
  TaskId = 851043,
}
r4_0[851044] = {
  NotifyName = r0_0.RT_505,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_1130,
  TaskId = 851044,
}
r4_0[851045] = {
  NotifyName = r0_0.RT_821,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_1132,
  TaskId = 851045,
}
r4_0[851046] = {
  NotifyName = r0_0.RT_825,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_1134,
  TaskId = 851046,
}
r4_0[851047] = {
  NotifyName = r0_0.RT_1135,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_1137,
  TaskId = 851047,
}
r4_0[851048] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossHeilong02_Skill06_Cylinder",
  TaskEffects = r0_0.RT_1121,
  TaskId = 851048,
}
r4_0[851049] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossHeilong02_Skill06_Cylinder",
  TaskEffects = r0_0.RT_1128,
  TaskId = 851049,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r6_0.TaskEffects = {
  [1] = {
    DanmakuTemplateId = 851101,
    Duration = 10,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 851101
r4_0[851101] = r6_0
r4_0[851102] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossHeilong_Skill02_Cylinder_Left",
  TaskEffects = r0_0.RT_1139,
  TaskId = 851102,
}
r4_0[851103] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossHeilong_Skill02_Cylinder_Right",
  TaskEffects = r0_0.RT_1139,
  TaskId = 851103,
}
r4_0[851104] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_16,
    [2] = r0_0.RT_1138,
  },
  TaskId = 851104,
}
r4_0[851105] = {
  TargetFilter = "BossBailong_Skill04_Rectangle_Left",
  TaskEffects = r0_0.RT_1139,
  TaskId = 851105,
}
r4_0[851106] = {
  TargetFilter = "BossBailong_Skill04_Rectangle_Middle",
  TaskEffects = r0_0.RT_1139,
  TaskId = 851106,
}
r4_0[851107] = {
  TargetFilter = "BossBailong_Skill04_Rectangle_Right",
  TaskEffects = r0_0.RT_1139,
  TaskId = 851107,
}
r4_0[851108] = {
  TargetFilter = "BossBailong_Skill04_Rectangle_Middle",
  TaskEffects = r0_0.RT_1140,
  TaskId = 851108,
}
r4_0[851109] = {
  TargetFilter = "BossBailong_Skill04_Rectangle_Left",
  TaskEffects = r0_0.RT_1140,
  TaskId = 851109,
}
r4_0[851110] = {
  TargetFilter = "BossBailong_Skill04_Rectangle_Right",
  TaskEffects = r0_0.RT_1140,
  TaskId = 851110,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AttrRates = r0_0.RT_1141,
    Function = "CreateUnit",
    LifeTime = 30,
    MaxSummonCount = 3,
    SingleSummonCount = 1,
    UnitId = 851101,
    UnitType = "MechanismSummon",
    UseSaveLoc = "IceBall1",
  },
  [2] = {
    AttrRates = r0_0.RT_1141,
    Function = "CreateUnit",
    LifeTime = 30,
    MaxSummonCount = 3,
    SingleSummonCount = 1,
    UnitId = 851101,
    UnitType = "MechanismSummon",
    UseSaveLoc = "IceBall2",
  },
  [3] = {
    AttrRates = r0_0.RT_1141,
    Function = "CreateUnit",
    LifeTime = 30,
    MaxSummonCount = 3,
    SingleSummonCount = 1,
    UnitId = 851101,
    UnitType = "MechanismSummon",
    UseSaveLoc = "IceBall3",
  },
}
r6_0.TaskId = 851111
r4_0[851111] = r6_0
r6_0 = {
  TargetFilter = "LaserTarget",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_496,
  [2] = {
    CauseHit = "LightHit_150_Laser",
    Function = "CutToughness",
  },
}
r6_0.TaskId = 851112
r4_0[851112] = r6_0
r4_0[851113] = {
  NotifyName = r0_0.RT_737,
  TargetFilter = "BossBailong_Skill08_Cylinder",
  TaskEffects = r0_0.RT_989,
  TaskId = 851113,
}
r4_0[851114] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_1126,
  TaskId = 851114,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851101,
    Function = "CreateSkillCreature",
    UseSaveLoc = "FireRingIn",
  },
}
r6_0.TaskId = 851115
r4_0[851115] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851102,
    Function = "CreateSkillCreature",
    UseSaveLoc = "FireRingOut",
  },
}
r6_0.TaskId = 851116
r4_0[851116] = r6_0
r4_0[851117] = {
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_986,
  },
  TaskId = 851117,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851103,
    Function = "CreateSkillCreature",
    UseSaveLoc = "FireRingIn",
  },
}
r6_0.TaskId = 851118
r4_0[851118] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851104,
    Function = "CreateSkillCreature",
    UseSaveLoc = "FireRingIn",
  },
}
r6_0.TaskId = 851119
r4_0[851119] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851105,
    Function = "CreateSkillCreature",
    UseSaveLoc = "FireRingIn",
  },
}
r6_0.TaskId = 851120
r4_0[851120] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851106,
    Function = "CreateSkillCreature",
    UseSaveLoc = "FireRingIn",
  },
}
r6_0.TaskId = 851121
r4_0[851121] = r6_0
r4_0[851122] = {
  NotifyName = r0_0.RT_505,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_1134,
  TaskId = 851122,
}
r4_0[851123] = {
  NotifyName = r0_0.RT_821,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_1137,
  TaskId = 851123,
}
r4_0[851124] = {
  NotifyName = r0_0.RT_825,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_1130,
  TaskId = 851124,
}
r4_0[851125] = {
  NotifyName = r0_0.RT_1135,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_1132,
  TaskId = 851125,
}
r4_0[851201] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossLinen_Skill01",
  TaskEffects = {
    [1] = r0_0.RT_22,
    [2] = r0_0.RT_39,
    [3] = r0_0.RT_1142,
  },
  TaskId = 851201,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851230,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 851202
r4_0[851202] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    Function = "Damage",
    Rate = 2.4,
  },
  [2] = r0_0.RT_1143,
  [3] = r0_0.RT_1142,
}
r6_0.TaskId = 851203
r4_0[851203] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851230,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 851204
r4_0[851204] = r6_0
r4_0[851206] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_1145,
  TaskId = 851206,
}
r6_0 = {
  TargetFilter = "BossLinen_Skill02_Scene",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_925,
  [2] = {
    CauseHit = "BossLinen_Skill02",
    Function = "CutToughness",
    Value = 30,
  },
  [3] = r0_0.RT_1146,
  [4] = r0_0.RT_1147,
}
r6_0.TaskId = 851207
r4_0[851207] = r6_0
r6_0 = {
  TargetFilter = "BossLinen_Skill02_Scene",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 851212,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
  [2] = r0_0.RT_496,
  [3] = {
    CauseHit = "LightHit_50",
    Function = "CutToughness",
    Value = 20,
  },
  [4] = r0_0.RT_1147,
}
r6_0.TaskId = 851208
r4_0[851208] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851202,
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_1148,
  [3] = {
    CreatureId = 851204,
    Delay = 0.333,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 851211
r4_0[851211] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851205,
    Function = "CreateSkillCreature",
  },
  [2] = {
    CreatureId = 851206,
    Delay = 0.167,
    Function = "CreateSkillCreature",
  },
  [3] = {
    CreatureId = 851207,
    Delay = 0.333,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 851212
r4_0[851212] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851228,
    Function = "CreateSkillCreature",
  },
  [2] = {
    CreatureId = 851229,
    Function = "CreateSkillCreature",
  },
  [3] = {
    CreatureId = 851202,
    Delay = 0.033,
    Function = "CreateSkillCreature",
  },
  [4] = {
    CreatureId = 851206,
    Delay = 0.067,
    Function = "CreateSkillCreature",
  },
  [5] = {
    CreatureId = 851205,
    Delay = 0.1,
    Function = "CreateSkillCreature",
  },
  [6] = {
    CreatureId = 851204,
    Delay = 0.133,
    Function = "CreateSkillCreature",
  },
  [7] = r0_0.RT_1148,
  [8] = {
    CreatureId = 851207,
    Delay = 0.2,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 851213
r4_0[851213] = r6_0
r4_0[851214] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_889,
    [2] = r0_0.RT_1149,
    [3] = r0_0.RT_1150,
    [4] = r0_0.RT_1147,
  },
  TaskId = 851214,
}
r6_0 = {
  TargetFilter = "BossLinen_Skill03_Scene1",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1151,
  [2] = r0_0.RT_496,
  [3] = {
    CauseHit = "LightHit_100",
    Function = "CutToughness",
    Value = 20,
  },
  [4] = r0_0.RT_1147,
}
r6_0.TaskId = 851215
r4_0[851215] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "SetSelfLoc",
    SaveLocTag = "Skill04TargetLoc",
    TargetCenterLoc = "SavedLoc",
  },
  [2] = {
    CantLockTime = 1.3,
    Function = "CameraUnlock",
  },
}
r6_0.TaskId = 851216
r4_0[851216] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 851213,
    Function = "AddBuff",
    LastTime = 3,
  },
}
r6_0.TaskId = 851217
r4_0[851217] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 851213,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 851218
r4_0[851218] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851209,
    Function = "CreateSkillCreature",
  },
  [2] = {
    CreatureId = 851209,
    Delay = 0.01,
    Function = "CreateSkillCreature",
  },
  [3] = {
    CreatureId = 851209,
    Delay = 0.02,
    Function = "CreateSkillCreature",
  },
  [4] = {
    CreatureId = 851209,
    Delay = 0.03,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 851221
r4_0[851221] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_33,
  [2] = {
    CauseHit = "BossLinen_Skill05",
    Function = "CutToughness",
    Value = 50,
  },
  [3] = r0_0.RT_1147,
}
r6_0.TaskId = 851222
r4_0[851222] = r6_0
r4_0[851223] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_891,
  TaskId = 851223,
}
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851210,
    Function = "CreateSkillCreature",
    UseSaveLoc = "",
  },
}
r6_0.TaskId = 851224
r4_0[851224] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AttrRates = r0_0.RT_1152,
    Function = "CreateUnit",
    LifeTime = 30,
    MaxSummonCount = 3,
    SingleSummonCount = 1,
    UnitId = 8512012,
    UnitType = "Monster",
  },
  [2] = {
    AttrRates = r0_0.RT_1152,
    Delay = 0.02,
    Function = "CreateUnit",
    LifeTime = 30,
    MaxSummonCount = 3,
    SingleSummonCount = 1,
    UnitId = 8512012,
    UnitType = "Monster",
  },
}
r6_0.TaskId = 851225
r4_0[851225] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r6_0.TaskEffects = {
  [1] = {
    DanmakuTemplateId = 851203,
    Duration = 2.3,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 851226
r4_0[851226] = r6_0
r4_0[851227] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_1153,
  TaskId = 851227,
}
r4_0[851228] = {
  TargetFilter = "BossLinen_Skill06_Scene2",
  TaskEffects = r0_0.RT_1153,
  TaskId = 851228,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851213,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 851229
r4_0[851229] = r6_0
r5_0 = 851231
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Target",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 851211,
  Function = "CreateSkillCreature",
  Location = {
    -500,
    200,
    0
  },
}
r8_0[2] = {
  CreatureId = 851211,
  Delay = 0.05,
  Function = "CreateSkillCreature",
  Location = {
    -250,
    200,
    250
  },
}
r8_0[3] = {
  CreatureId = 851211,
  Delay = 0.1,
  Function = "CreateSkillCreature",
  Location = {
    250,
    200,
    250
  },
}
r8_0[4] = {
  CreatureId = 851211,
  Delay = 0.15,
  Function = "CreateSkillCreature",
  Location = {
    500,
    200,
    0
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 851231
r4_0[r5_0] = r6_0
r4_0[851232] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_33,
    [2] = r0_0.RT_1154,
    [3] = r0_0.RT_1147,
  },
  TaskId = 851232,
}
r4_0[851233] = {
  TargetFilter = "BossLinen_Skill07_Scene",
  TaskEffects = {
    [1] = r0_0.RT_1008,
    [2] = r0_0.RT_1154,
    [3] = r0_0.RT_1147,
  },
  TaskId = 851233,
}
r4_0[851236] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_1157,
  TaskId = 851236,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r8_0 = {}
r8_0[1] = {
  AttrRates = {
    MaxHp = 0.15,
  },
  Function = "CreateUnit",
  LifeTime = -1,
  MaxSummonCount = 1,
  SingleSummonCount = 1,
  UnitId = 851201,
  UnitType = "MechanismSummon",
}
r6_0.TaskEffects = r8_0
r6_0.TaskId = 851237
r4_0[851237] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AttrRates = r0_0.RT_1158,
    Function = "CreateUnit",
    LifeTime = -1,
    MaxSummonCount = 3,
    SingleSummonCount = 1,
    UnitId = 8512011,
    UnitType = "Monster",
    UseSaveLoc = "Skill08_1",
  },
  [2] = {
    AttrRates = r0_0.RT_1152,
    Function = "CreateUnit",
    LifeTime = -1,
    MaxSummonCount = 3,
    SingleSummonCount = 1,
    UnitId = 8512012,
    UnitType = "Monster",
    UseSaveLoc = "Skill08_2",
  },
  [3] = {
    AttrRates = r0_0.RT_1159,
    Function = "CreateUnit",
    LifeTime = -1,
    MaxSummonCount = 2,
    SingleSummonCount = 1,
    UnitId = 8512013,
    UnitType = "Monster",
    UseSaveLoc = "Skill08_3",
  },
  [4] = {
    AttrRates = r0_0.RT_1158,
    Function = "CreateUnit",
    LifeTime = -1,
    MaxSummonCount = 3,
    SingleSummonCount = 1,
    UnitId = 8512011,
    UnitType = "Monster",
    UseSaveLoc = "Skill08_4",
  },
}
r6_0.TaskId = 851238
r4_0[851238] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AttrRates = r0_0.RT_1152,
    Function = "CreateUnit",
    LifeTime = -1,
    MaxSummonCount = 3,
    SingleSummonCount = 1,
    UnitId = 8512012,
    UnitType = "Monster",
    UseSaveLoc = "Skill08_5",
  },
  [2] = {
    AttrRates = r0_0.RT_1159,
    Function = "CreateUnit",
    LifeTime = -1,
    MaxSummonCount = 2,
    SingleSummonCount = 1,
    UnitId = 8512013,
    UnitType = "Monster",
    UseSaveLoc = "Skill08_6",
  },
  [3] = {
    AttrRates = r0_0.RT_1158,
    Function = "CreateUnit",
    LifeTime = -1,
    MaxSummonCount = 3,
    SingleSummonCount = 1,
    UnitId = 8512011,
    UnitType = "Monster",
    UseSaveLoc = "Skill08_7",
  },
  [4] = {
    AttrRates = r0_0.RT_1152,
    Function = "CreateUnit",
    LifeTime = -1,
    MaxSummonCount = 3,
    SingleSummonCount = 1,
    UnitId = 8512012,
    UnitType = "Monster",
    UseSaveLoc = "Skill08_8",
  },
}
r6_0.TaskId = 851239
r4_0[851239] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AttrRates = r0_0.RT_84,
    Function = "CreateUnit",
    LifeTime = 22,
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 851202,
    UnitType = "MechanismSummon",
  },
  [2] = {
    AttrRates = r0_0.RT_84,
    Delay = 0.2,
    Function = "CreateUnit",
    LifeTime = 22.8,
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 851203,
    UnitType = "MechanismSummon",
  },
  [3] = {
    AttrRates = r0_0.RT_84,
    Delay = 5.2,
    Function = "CreateUnit",
    LifeTime = 19.8,
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 851204,
    UnitType = "MechanismSummon",
  },
  [4] = {
    AttrRates = r0_0.RT_84,
    Delay = 5.4,
    Function = "CreateUnit",
    LifeTime = 18.6,
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 851213,
    UnitType = "MechanismSummon",
  },
}
r6_0.TaskId = 851241
r4_0[851241] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    DanmakuTemplateId = 851205,
    Duration = 2.3,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 851242
r4_0[851242] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    DanmakuTemplateId = 851206,
    Duration = 21.5,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 851243
r4_0[851243] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851214,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Skill09LaserSceneLoc1",
  },
}
r6_0.TaskId = 851244
r4_0[851244] = r6_0
r6_0 = {
  TargetFilter = "BossLinen_Skill03_Scene1",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_827,
  [2] = {
    CauseHit = "BossLinen_Skill11",
    Function = "CutToughness",
    Value = 30,
  },
  [3] = r0_0.RT_1147,
}
r6_0.TaskId = 851245
r4_0[851245] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AttrRates = r0_0.RT_1158,
    Function = "CreateUnit",
    LifeTime = -1,
    MaxSummonCount = 5,
    SingleSummonCount = 1,
    UnitId = 8512011,
    UnitType = "Monster",
  },
  [2] = {
    AttrRates = r0_0.RT_1158,
    Delay = 0.3,
    Function = "CreateUnit",
    LifeTime = -1,
    MaxSummonCount = 5,
    SingleSummonCount = 1,
    UnitId = 8512011,
    UnitType = "Monster",
  },
  [3] = {
    AttrRates = r0_0.RT_1158,
    Delay = 0.6,
    Function = "CreateUnit",
    LifeTime = -1,
    MaxSummonCount = 5,
    SingleSummonCount = 1,
    UnitId = 8512011,
    UnitType = "Monster",
  },
}
r6_0.TaskId = 851246
r4_0[851246] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851216,
    Function = "CreateSkillCreature",
  },
  [2] = {
    CreatureId = 851217,
    Delay = 0.1,
    Function = "CreateSkillCreature",
  },
  [3] = {
    CreatureId = 851218,
    Delay = 0.15,
    Function = "CreateSkillCreature",
  },
  [4] = {
    CreatureId = 851219,
    Delay = 0.25,
    Function = "CreateSkillCreature",
  },
  [5] = {
    CreatureId = 851220,
    Delay = 0.05,
    Function = "CreateSkillCreature",
  },
  [6] = {
    CreatureId = 851221,
    Delay = 0.2,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 851251
r4_0[851251] = r6_0
r4_0[851252] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_827,
    [2] = r0_0.RT_839,
    [3] = r0_0.RT_976,
    [4] = r0_0.RT_1147,
    [5] = r0_0.RT_1149,
  },
  TaskId = 851252,
}
r6_0 = {
  TargetFilter = "BossLinen_Skill03_Scene1",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 851229,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
  [2] = r0_0.RT_889,
  [3] = r0_0.RT_1147,
  [4] = r0_0.RT_1149,
}
r6_0.TaskId = 851253
r4_0[851253] = r6_0
r4_0[851254] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_1157,
  TaskId = 851254,
}
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851222,
    Function = "CreateSkillCreature",
  },
  [2] = {
    CreatureId = 851223,
    Delay = 0.1,
    Function = "CreateSkillCreature",
  },
  [3] = {
    CreatureId = 851224,
    Delay = 0.15,
    Function = "CreateSkillCreature",
  },
  [4] = {
    CreatureId = 851225,
    Delay = 0.25,
    Function = "CreateSkillCreature",
  },
  [5] = {
    CreatureId = 851226,
    Delay = 0.05,
    Function = "CreateSkillCreature",
  },
  [6] = {
    CreatureId = 851227,
    Delay = 0.2,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 851255
r4_0[851255] = r6_0
r4_0[851256] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_1145,
  TaskId = 851256,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 851216,
    Function = "PlayFX",
  },
  [2] = {
    Delay = 0.1,
    FXId = 851217,
    Function = "PlayFX",
  },
  [3] = {
    Delay = 0.15,
    FXId = 851218,
    Function = "PlayFX",
  },
  [4] = {
    Delay = 0.25,
    FXId = 851219,
    Function = "PlayFX",
  },
  [5] = {
    Delay = 0.05,
    FXId = 851220,
    Function = "PlayFX",
  },
  [6] = {
    Delay = 0.2,
    FXId = 851221,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 851257
r4_0[851257] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 851222,
    Function = "PlayFX",
  },
  [2] = {
    Delay = 0.1,
    FXId = 851223,
    Function = "PlayFX",
  },
  [3] = {
    Delay = 0.15,
    FXId = 851224,
    Function = "PlayFX",
  },
  [4] = {
    Delay = 0.25,
    FXId = 851225,
    Function = "PlayFX",
  },
  [5] = {
    Delay = 0.05,
    FXId = 851226,
    Function = "PlayFX",
  },
  [6] = {
    Delay = 0.2,
    FXId = 851227,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 851258
r4_0[851258] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r6_0.TaskEffects = {
  [1] = {
    DanmakuTemplateId = 851204,
    Duration = 2.3,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 851261
r4_0[851261] = r6_0
r4_0[851262] = {
  TargetFilter = "BossLinen_Skill06_Scene1",
  TaskEffects = r0_0.RT_1160,
  TaskId = 851262,
}
r4_0[851263] = {
  TargetFilter = "BossLinen_Skill06_Scene2",
  TaskEffects = r0_0.RT_1160,
  TaskId = 851263,
}
r4_0[851264] = {
  TargetFilter = "BossLinen_Skill06_Scene3",
  TaskEffects = r0_0.RT_1160,
  TaskId = 851264,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AttrRates = r0_0.RT_84,
    Function = "CreateUnit",
    LifeTime = 23,
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 851205,
    UnitType = "MechanismSummon",
    UseSaveLoc = "Skill09Summon1",
  },
  [2] = {
    AttrRates = r0_0.RT_84,
    Function = "CreateUnit",
    LifeTime = 23,
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 851206,
    UnitType = "MechanismSummon",
    UseSaveLoc = "Skill09Summon2",
  },
  [3] = {
    AttrRates = r0_0.RT_84,
    Function = "CreateUnit",
    LifeTime = 23,
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 851207,
    UnitType = "MechanismSummon",
    UseSaveLoc = "Skill09Summon3",
  },
  [4] = {
    AttrRates = r0_0.RT_84,
    Function = "CreateUnit",
    LifeTime = 23,
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 851208,
    UnitType = "MechanismSummon",
    UseSaveLoc = "Skill09Summon4",
  },
}
r6_0.TaskId = 851266
r4_0[851266] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    DanmakuTemplateId = 851207,
    Duration = 2,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 851267
r4_0[851267] = r6_0
r4_0[851268] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_1161,
    [2] = r0_0.RT_110,
    [3] = r0_0.RT_1147,
  },
  TaskId = 851268,
}
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AttrRates = r0_0.RT_84,
    Function = "CreateUnit",
    LifeTime = 23,
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 851209,
    UnitType = "MechanismSummon",
    UseSaveLoc = "Skill09Summon5",
  },
  [2] = {
    AttrRates = r0_0.RT_84,
    Function = "CreateUnit",
    LifeTime = 23,
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 851210,
    UnitType = "MechanismSummon",
    UseSaveLoc = "Skill09Summon6",
  },
  [3] = {
    AttrRates = r0_0.RT_84,
    Function = "CreateUnit",
    LifeTime = 23,
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 851211,
    UnitType = "MechanismSummon",
    UseSaveLoc = "Skill09Summon7",
  },
  [4] = {
    AttrRates = r0_0.RT_84,
    Function = "CreateUnit",
    LifeTime = 23,
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 851212,
    UnitType = "MechanismSummon",
    UseSaveLoc = "Skill09Summon8",
  },
}
r6_0.TaskId = 851269
r4_0[851269] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851215,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 851270
r4_0[851270] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 851207,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 851271
r4_0[851271] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 851208,
    Function = "PlayFX",
    IsAttached = true,
  },
}
r6_0.TaskId = 851272
r4_0[851272] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851214,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Skill09LaserSceneLoc2",
  },
}
r6_0.TaskId = 851273
r4_0[851273] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851214,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Skill09LaserSceneLoc3",
  },
}
r6_0.TaskId = 851274
r4_0[851274] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851214,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Skill09LaserSceneLoc4",
  },
}
r6_0.TaskId = 851275
r4_0[851275] = r6_0
r6_0 = {
  TargetFilter = "BossLinen_Skill03_Scene2",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 851215,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
  [2] = r0_0.RT_496,
  [3] = r0_0.RT_120,
}
r6_0.TaskId = 851276
r4_0[851276] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "CreateUnit",
    LifeTime = 30,
    MaxSummonCount = 3,
    SingleSummonCount = 1,
    UnitId = 8512011,
    UnitType = "Monster",
  },
}
r6_0.TaskId = 851281
r4_0[851281] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "CreateUnit",
    LifeTime = 30,
    MaxSummonCount = 3,
    SingleSummonCount = 1,
    UnitId = 8512012,
    UnitType = "Monster",
  },
}
r6_0.TaskId = 851282
r4_0[851282] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "CreateUnit",
    LifeTime = 40,
    MaxSummonCount = 3,
    SingleSummonCount = 1,
    UnitId = 8512013,
    UnitType = "Monster",
  },
}
r6_0.TaskId = 851283
r4_0[851283] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    DanmakuTemplateId = 851201,
    Duration = 2,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 851284
r4_0[851284] = r6_0
r4_0[851285] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_1161,
    [2] = r0_0.RT_1147,
  },
  TaskId = 851285,
}
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    FXId = 851209,
    Function = "PlayFX",
  },
  [2] = {
    CreatureId = 851201,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 851286
r4_0[851286] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    DamageTag = r0_0.RT_343,
    Function = "Damage",
    Rate = 0.2,
  },
  [2] = r0_0.RT_176,
  [3] = {
    Function = "PlaySE",
    SEId = 851210,
  },
}
r6_0.TaskId = 851287
r4_0[851287] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_354,
  [2] = {
    AttachToTarget = true,
    FXId = 2020106,
    Function = "PlayFX",
    IsDecalEffectCreature = true,
    NormalToHit = true,
    Overlap = true,
    RefinedOverlap = true,
    ReplaceFXId = r0_0.RT_308,
  },
}
r6_0.TaskId = 851288
r4_0[851288] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    DanmakuTemplateId = 851202,
    Duration = 4.5,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 851289
r4_0[851289] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    DamageTag = r0_0.RT_343,
    Function = "Damage",
    Rate = 1.2,
  },
  [2] = {
    CauseHit = "BossLinen_Summon3",
    Function = "CutToughness",
    Value = 100,
  },
  [3] = r0_0.RT_1147,
}
r6_0.TaskId = 851290
r4_0[851290] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851231,
    Function = "CreateSkillCreature",
  },
  [2] = {
    CreatureId = 851232,
    Delay = 0.04,
    Function = "CreateSkillCreature",
  },
  [3] = {
    CreatureId = 851233,
    Delay = 0.08,
    Function = "CreateSkillCreature",
  },
  [4] = {
    CreatureId = 851234,
    Delay = 0.12,
    Function = "CreateSkillCreature",
  },
  [5] = {
    CreatureId = 851235,
    Delay = 0.16,
    Function = "CreateSkillCreature",
  },
  [6] = {
    CreatureId = 851236,
    Delay = 0.2,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 851291
r4_0[851291] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851237,
    Function = "CreateSkillCreature",
  },
  [2] = {
    CreatureId = 851238,
    Delay = 0.04,
    Function = "CreateSkillCreature",
  },
  [3] = {
    CreatureId = 851239,
    Delay = 0.08,
    Function = "CreateSkillCreature",
  },
  [4] = {
    CreatureId = 851240,
    Delay = 0.12,
    Function = "CreateSkillCreature",
  },
  [5] = {
    CreatureId = 851241,
    Delay = 0.16,
    Function = "CreateSkillCreature",
  },
  [6] = {
    CreatureId = 851242,
    Delay = 0.2,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 851292
r4_0[851292] = r6_0
r4_0[851296] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_1166,
  TaskId = 851296,
}
r4_0[851297] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_1166,
  TaskId = 851297,
}
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHp",
    BaseChar = "Target",
    DamageType = "TrueDamage",
    Function = "Damage",
    Rate = 0.15,
  },
}
r6_0.TaskId = 851298
r4_0[851298] = r6_0
r4_0[851301] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossKuxiu_Attack",
  TaskEffects = {
    [1] = r0_0.RT_3,
    [2] = r0_0.RT_1100,
    [3] = r0_0.RT_661,
    [4] = r0_0.RT_1167,
  },
  TaskId = 851301,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossKuxiu_Skill01",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_3,
  [2] = {
    CauseHit = "BossKuxiu_Skill01",
    Function = "CutToughness",
  },
  [3] = r0_0.RT_661,
  [4] = r0_0.RT_1167,
}
r6_0.TaskId = 851302
r4_0[851302] = r6_0
r5_0 = 851303
r6_0 = {
  NotifyName = r0_0.RT_9,
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 851302,
  Function = "CreateSkillCreature",
  Location = {
    2,
    153.32,
    50
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 851303
r4_0[r5_0] = r6_0
r4_0[851304] = {
  NotifyName = r0_0.RT_9,
  TaskEffects = r0_0.RT_1170,
  TaskId = 851304,
}
r4_0[851305] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossKuxiu_Attack",
  TaskEffects = {
    [1] = r0_0.RT_3,
    [2] = r0_0.RT_1100,
    [3] = r0_0.RT_661,
  },
  TaskId = 851305,
}
r4_0[851306] = {
  NotifyName = r0_0.RT_9,
  TaskEffects = r0_0.RT_1170,
  TaskId = 851306,
}
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1103,
  [2] = {
    CauseHit = "BossKuxiu_ShockWave",
    Function = "CutToughness",
  },
  [3] = r0_0.RT_661,
  [4] = {
    Function = "PlaySE",
    SEId = 851303,
  },
}
r6_0.TaskId = 851307
r4_0[851307] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "EffectFunction",
    FunctionName = "Mon_BossKuxiu_Skill03BulletLoc",
  },
  [2] = {
    CreatureId = 851303,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "EndLeft",
    UseSaveLoc = "StartLeft",
  },
  [3] = {
    CreatureId = 851303,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "EndRight",
    UseSaveLoc = "StartRight",
  },
  [4] = {
    BaseChar = "Self",
    Function = "PlaySE",
    SEId = 851304,
  },
}
r6_0.TaskId = 851308
r4_0[851308] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_22,
  [2] = r0_0.RT_1100,
  [3] = r0_0.RT_1171,
  [4] = {
    Function = "PlaySE",
    SEId = 851306,
  },
}
r6_0.TaskId = 851309
r4_0[851309] = r6_0
r4_0[851310] = {
  TaskEffects = r0_0.RT_1173,
  TaskId = 851310,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "EffectFunction",
    FunctionName = "Mon_BossKuxiu_Skill05BulletLoc",
  },
  [2] = r0_0.RT_1174,
  [3] = r0_0.RT_1175,
  [4] = r0_0.RT_1176,
  [5] = r0_0.RT_1177,
  [6] = r0_0.RT_1178,
  [7] = r0_0.RT_1179,
  [8] = r0_0.RT_1180,
}
r6_0.TaskId = 851311
r4_0[851311] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_22,
  [2] = r0_0.RT_1100,
  [3] = {
    FXId = 851313,
    Function = "PlayFX",
    Overlap = true,
  },
  [4] = r0_0.RT_1181,
}
r6_0.TaskId = 851312
r4_0[851312] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    FXId = 851313,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
}
r6_0.TaskId = 851313
r4_0[851313] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851305,
    Function = "CreateSkillCreature",
  },
  [2] = {
    CreatureId = 851306,
    Function = "CreateSkillCreature",
  },
  [3] = {
    CreatureId = 851307,
    Function = "CreateSkillCreature",
  },
  [4] = {
    CreatureId = 851308,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 851314
r4_0[851314] = r6_0
r4_0[851315] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_22,
    [2] = r0_0.RT_1100,
    [3] = r0_0.RT_1171,
    [4] = r0_0.RT_1181,
  },
  TaskId = 851315,
}
r4_0[851316] = {
  TaskEffects = r0_0.RT_1173,
  TaskId = 851316,
}
r4_0[851317] = {
  TaskEffects = r0_0.RT_1183,
  TaskId = 851317,
}
r6_0 = {
  TargetFilter = "Mon_Sphere_200_360",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_22,
  [2] = r0_0.RT_10,
  [3] = {
    CreatureId = 851315,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_98,
  },
  [4] = {
    Function = "PlaySE",
    SEId = 851316,
  },
}
r6_0.TaskId = 851318
r4_0[851318] = r6_0
r4_0[851319] = {
  TaskEffects = r0_0.RT_1183,
  TaskId = 851319,
}
r4_0[851320] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_768,
  TaskId = 851320,
}
r6_0 = {
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    AimSaveLoc = true,
    FXId = 851306,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 851321
r4_0[851321] = r6_0
r6_0 = {
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    AimSaveLoc = true,
    FXId = 851307,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 851322
r4_0[851322] = r6_0
r6_0 = {
  TargetFilter = "Mon_Sphere_50_360",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_22,
  [2] = r0_0.RT_1100,
  [3] = {
    FXId = 851308,
    Function = "PlayFX",
    Overlap = true,
  },
}
r6_0.TaskId = 851323
r4_0[851323] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 851309,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 851324
r4_0[851324] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851305,
    Function = "RemoveSkillCreature",
  },
  [2] = {
    CreatureId = 851306,
    Function = "RemoveSkillCreature",
  },
  [3] = {
    CreatureId = 851307,
    Function = "RemoveSkillCreature",
  },
  [4] = {
    CreatureId = 851308,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 851325
r4_0[851325] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851309,
    Function = "CreateSkillCreature",
  },
  [2] = {
    CreatureId = 851310,
    Function = "CreateSkillCreature",
  },
  [3] = {
    CreatureId = 851311,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 851326
r4_0[851326] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_19,
  [2] = {
    CreatureId = 851312,
    Function = "CreateSkillCreature",
    UseSaveLoc = "",
  },
}
r6_0.TaskId = 851327
r4_0[851327] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "root",
    CreatureId = 851313,
    Function = "CreateSkillCreature",
    UseSaveLoc = "851313Loc",
  },
  [2] = {
    CreatureId = 851310,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 851328
r4_0[851328] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_405,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "root",
    CreatureId = 851314,
    Function = "CreateSkillCreature",
    UseSaveLoc = "851314Loc",
  },
  [2] = {
    CreatureId = 851311,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 851329
r4_0[851329] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 851315,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 851330
r4_0[851330] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    FXId = 851310,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
}
r6_0.TaskId = 851331
r4_0[851331] = r6_0
r6_0 = {
  TargetFilter = "Mon_Sphere_50_360",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_22,
  [2] = r0_0.RT_1100,
  [3] = {
    FXId = 851314,
    Function = "PlayFX",
    Overlap = true,
  },
}
r6_0.TaskId = 851332
r4_0[851332] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "EffectFunction",
    FunctionName = "Mon_BossKuxiu_Skill05BulletLoc2",
  },
  [2] = r0_0.RT_1174,
  [3] = r0_0.RT_1175,
  [4] = r0_0.RT_1176,
  [5] = r0_0.RT_1177,
  [6] = r0_0.RT_1178,
  [7] = r0_0.RT_1179,
  [8] = r0_0.RT_1180,
}
r6_0.TaskId = 851333
r4_0[851333] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851401,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 851401
r4_0[851401] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    Function = "Damage",
    Rate = 0.135,
  },
  [2] = {
    FXId = 851402,
    Function = "PlayFX",
    Overlap = true,
  },
  [3] = {
    Function = "PlaySE",
    SEId = 851407,
  },
}
r6_0.TaskId = 851402
r4_0[851402] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    FXId = 851402,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
}
r6_0.TaskId = 851403
r4_0[851403] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 851403,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 851404
r4_0[851404] = r6_0
r4_0[851405] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_768,
  TaskId = 851405,
}
r6_0 = {
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    AimSaveLoc = true,
    FXId = 851404,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 851406
r4_0[851406] = r6_0
r6_0 = {
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    AimSaveLoc = true,
    FXId = 851405,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 851407
r4_0[851407] = r6_0
r6_0 = {
  TargetFilter = "Mon_Sphere_50_360",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_981,
  [2] = r0_0.RT_1100,
  [3] = {
    FXId = 851406,
    Function = "PlayFX",
    Overlap = true,
  },
}
r6_0.TaskId = 851408
r4_0[851408] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851404,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 851409
r4_0[851409] = r6_0
r4_0[851410] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_1189,
  TaskId = 851410,
}
r6_0 = {
  TargetFilter = "Mon_Sphere_100_360",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1104,
  [2] = r0_0.RT_1100,
  [3] = {
    FXId = 851408,
    Function = "PlayFX",
    Overlap = true,
  },
}
r6_0.TaskId = 851411
r4_0[851411] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851405,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 851412
r4_0[851412] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851406,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 851413
r4_0[851413] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_405,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851407,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 851414
r4_0[851414] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_505,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851408,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 851415
r4_0[851415] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_821,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851409,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 851416
r4_0[851416] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_19,
  [2] = {
    CreatureId = 851410,
    Function = "CreateSkillCreature",
    UseSaveLoc = "",
  },
}
r6_0.TaskId = 851417
r4_0[851417] = r6_0
r4_0[851418] = {
  NotifyName = r0_0.RT_825,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_1189,
  TaskId = 851418,
}
r4_0[851419] = {
  TargetFilter = "BossShenpan_GroundHit",
  TaskEffects = {
    [1] = r0_0.RT_22,
    [2] = r0_0.RT_1100,
  },
  TaskId = 851419,
}
r4_0[851420] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossShenpan_Skill07",
  TaskEffects = {
    [1] = r0_0.RT_680,
    [2] = r0_0.RT_1190,
    [3] = r0_0.RT_661,
    [4] = r0_0.RT_1191,
  },
  TaskId = 851420,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossShenpan_Skill08",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    Function = "Damage",
    Rate = 3.5,
  },
  [2] = r0_0.RT_1190,
  [3] = r0_0.RT_661,
  [4] = r0_0.RT_1191,
}
r6_0.TaskId = 851421
r4_0[851421] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 851411,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 851422
r4_0[851422] = r6_0
r4_0[851501] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossJushi_Skill01_Cylinder",
  TaskEffects = r0_0.RT_1193,
  TaskId = 851501,
}
r4_0[851502] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossJushi_Skill02_Cylinder",
  TaskEffects = r0_0.RT_1193,
  TaskId = 851502,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1031,
  [2] = {
    FixLocation = true,
    FixLocationZ = 160,
    Function = "SetSelfLoc",
    SaveLocTag = "Skill03Loc",
    TargetCenterLoc = "SavedLoc",
  },
}
r6_0.TaskId = 851503
r4_0[851503] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "EffectFunction",
    FunctionName = "Mon_BossJushi_Skill04HeadBullet",
  },
  [2] = {
    CreatureId = 851501,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Start1",
  },
  [3] = {
    CreatureId = 851501,
    Delay = 0.2,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Start2",
  },
  [4] = {
    CreatureId = 851501,
    Delay = 0.4,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Start3",
  },
  [5] = {
    CreatureId = 851501,
    Delay = 0.6,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Start4",
  },
  [6] = {
    CreatureId = 851501,
    Delay = 0.8,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Start5",
  },
  [7] = {
    CreatureId = 851501,
    Delay = 1,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Start6",
  },
}
r6_0.TaskId = 851504
r4_0[851504] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_22,
  [2] = {
    FXId = 851502,
    Function = "PlayFX",
    Overlap = true,
  },
  [3] = r0_0.RT_1194,
}
r6_0.TaskId = 851505
r4_0[851505] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    FXId = 851502,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
}
r6_0.TaskId = 851506
r4_0[851506] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BoneName = "spine_02",
    DanmakuTemplateId = 851501,
    Duration = 2,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 851507
r4_0[851507] = r6_0
r4_0[851508] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_496,
    [2] = r0_0.RT_506,
    [3] = r0_0.RT_1194,
  },
  TaskId = 851508,
}
r4_0[851509] = {
  TaskEffects = r0_0.RT_508,
  TaskId = 851509,
}
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BoneName = "spine_02",
    DanmakuTemplateId = 851502,
    Duration = 2,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 851510
r4_0[851510] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BoneName = "spine_02",
    DanmakuTemplateId = 851503,
    Duration = 2,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 851511
r4_0[851511] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851502,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_1195,
  },
}
r6_0.TaskId = 851512
r4_0[851512] = r6_0
r6_0 = {
  TargetFilter = "Mon_Sphere_200_360",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_22,
  [2] = r0_0.RT_10,
  [3] = r0_0.RT_1196,
  [4] = {
    Function = "PlaySE",
    SEId = 851511,
  },
}
r6_0.TaskId = 851513
r4_0[851513] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1197,
  [2] = {
    CreatureId = 851503,
    Function = "CreateSkillCreature",
    UseSaveLoc = "851514Loc",
  },
  [3] = {
    CreatureId = 851501,
    Delay = 0.3,
    Function = "CreateSkillCreature",
    UseSaveLoc = "851514Loc",
  },
}
r6_0.TaskId = 851514
r4_0[851514] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851504,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_1195,
  },
}
r6_0.TaskId = 851515
r4_0[851515] = r6_0
r6_0 = {
  TargetFilter = "Mon_Sphere_400_360",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_22,
  [2] = r0_0.RT_10,
  [3] = {
    FXId = 851506,
    Function = "PlayFX",
  },
  [4] = {
    Function = "PlaySE",
    SEId = 851512,
  },
}
r6_0.TaskId = 851516
r4_0[851516] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851505,
    Function = "CreateSkillCreature",
  },
  [2] = {
    CreatureId = 851506,
    Function = "CreateSkillCreature",
  },
  [3] = {
    CreatureId = 851507,
    Function = "CreateSkillCreature",
  },
  [4] = {
    CreatureId = 851508,
    Function = "CreateSkillCreature",
  },
  [5] = r0_0.RT_1198,
  [6] = r0_0.RT_1199,
}
r6_0.TaskId = 851517
r4_0[851517] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851509,
    Function = "CreateSkillCreature",
  },
  [2] = {
    CreatureId = 851510,
    Function = "CreateSkillCreature",
  },
  [3] = {
    CreatureId = 851511,
    Function = "CreateSkillCreature",
  },
  [4] = {
    CreatureId = 851512,
    Function = "CreateSkillCreature",
  },
  [5] = r0_0.RT_1198,
  [6] = r0_0.RT_1199,
}
r6_0.TaskId = 851518
r4_0[851518] = r6_0
r6_0 = {
  TargetFilter = "Mon_Sphere_50_360",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_981,
  [2] = r0_0.RT_10,
  [3] = {
    FXId = 851508,
    Function = "PlayFX",
    Overlap = true,
  },
  [4] = {
    Function = "PlaySE",
    SEId = 851514,
  },
}
r6_0.TaskId = 851519
r4_0[851519] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FixLocation = true,
    FixLocationZ = 0,
    FormationId = 2,
    Function = "CreateUnit",
    LifeTime = 6,
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 851501,
    UnitType = "MechanismSummon",
  },
}
r6_0.TaskId = 851520
r4_0[851520] = r6_0
r6_0 = {
  TargetFilter = "BossJushi_Skill07_Burst",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1103,
  [2] = r0_0.RT_10,
  [3] = {
    Function = "PlaySE",
    SEId = 851516,
  },
}
r6_0.TaskId = 851521
r4_0[851521] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    DanmakuTemplateId = 851504,
    Duration = 2,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 851522
r4_0[851522] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_22,
  [2] = r0_0.RT_506,
  [3] = {
    Function = "PlaySE",
    SEId = 851502,
  },
}
r6_0.TaskId = 851523
r4_0[851523] = r6_0
r4_0[851524] = {
  TaskEffects = r0_0.RT_508,
  TaskId = 851524,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851513,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_31,
  },
}
r6_0.TaskId = 851525
r4_0[851525] = r6_0
r6_0 = {
  TargetFilter = "Mon_Sphere_50_360",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_3,
  [2] = r0_0.RT_10,
  [3] = r0_0.RT_1200,
  [4] = {
    Function = "PlaySE",
    SEId = 851518,
  },
}
r6_0.TaskId = 851526
r4_0[851526] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CauseHit = "LightHit",
    Function = "CutToughness",
    Value = 3000,
  },
  [2] = r0_0.RT_519,
}
r6_0.TaskId = 851527
r4_0[851527] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851513,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 851528
r4_0[851528] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    DanmakuTemplateId = 851505,
    Duration = 2,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 851529
r4_0[851529] = r6_0
r5_0 = 851530
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 851514,
  Function = "CreateSkillCreature",
  Location = {
    0,
    0,
    -182
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 851530
r4_0[r5_0] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 851512,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 851531
r4_0[851531] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1197,
  [2] = {
    CreatureId = 851503,
    Function = "CreateSkillCreature",
    UseSaveLoc = "851532Loc",
  },
  [3] = {
    CreatureId = 851501,
    Delay = 0.3,
    Function = "CreateSkillCreature",
    UseSaveLoc = "851532Loc",
  },
}
r6_0.TaskId = 851532
r4_0[851532] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1197,
  [2] = {
    CreatureId = 851503,
    Function = "CreateSkillCreature",
    UseSaveLoc = "851533Loc",
  },
  [3] = {
    CreatureId = 851501,
    Delay = 0.3,
    Function = "CreateSkillCreature",
    UseSaveLoc = "851533Loc",
  },
}
r6_0.TaskId = 851533
r4_0[851533] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1197,
  [2] = {
    CreatureId = 851503,
    Function = "CreateSkillCreature",
    UseSaveLoc = "851534Loc",
  },
  [3] = {
    CreatureId = 851501,
    Delay = 0.3,
    Function = "CreateSkillCreature",
    UseSaveLoc = "851534Loc",
  },
}
r6_0.TaskId = 851534
r4_0[851534] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_405,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1197,
  [2] = {
    CreatureId = 851503,
    Function = "CreateSkillCreature",
    UseSaveLoc = "851535Loc",
  },
  [3] = {
    CreatureId = 851501,
    Delay = 0.3,
    Function = "CreateSkillCreature",
    UseSaveLoc = "851535Loc",
  },
}
r6_0.TaskId = 851535
r4_0[851535] = r6_0
r6_0 = {
  TargetFilter = "BossJushi_Passive_Dot",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 851501,
    Function = "AddBuff",
    LastTime = 0.5,
  },
}
r6_0.TaskId = 851536
r4_0[851536] = r6_0
r4_0[851603] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossFuer_Skill02",
  TaskEffects = r0_0.RT_1201,
  TaskId = 851603,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851603,
    ExtraRotation = 101,
    Function = "CreateSkillCreature",
  },
  [2] = {
    CreatureId = 851603,
    Delay = 0.1,
    ExtraRotation = 101,
    Function = "CreateSkillCreature",
  },
  [3] = {
    CreatureId = 851603,
    Delay = 0.2,
    ExtraRotation = 101,
    Function = "CreateSkillCreature",
  },
  [4] = {
    CreatureId = 851603,
    Delay = 0.3,
    ExtraRotation = 101,
    Function = "CreateSkillCreature",
  },
  [5] = {
    CreatureId = 851603,
    Delay = 0.4,
    ExtraRotation = 101,
    Function = "CreateSkillCreature",
  },
  [6] = {
    CreatureId = 851603,
    Delay = 0.5,
    ExtraRotation = 101,
    Function = "CreateSkillCreature",
  },
  [7] = {
    CreatureId = 851603,
    Delay = 0.6,
    ExtraRotation = 101,
    Function = "CreateSkillCreature",
  },
  [8] = {
    CreatureId = 851603,
    Delay = 0.7,
    ExtraRotation = 101,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 851607
r4_0[851607] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_502,
  [2] = {
    FXId = 851604,
    Function = "PlayFX",
    Overlap = true,
  },
}
r6_0.TaskId = 851608
r4_0[851608] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    FXId = 851604,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
}
r6_0.TaskId = 851609
r4_0[851609] = r6_0
r4_0[851610] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_768,
  TaskId = 851610,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851604,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "",
  },
}
r6_0.TaskId = 851611
r4_0[851611] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_3,
  [2] = r0_0.RT_10,
  [3] = {
    FXId = 851607,
    Function = "PlayFX",
    Overlap = true,
  },
}
r6_0.TaskId = 851612
r4_0[851612] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 851607,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
  [2] = {
    CreatureId = 851605,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "End1",
    UseSaveLoc = "",
  },
  [3] = {
    CreatureId = 851605,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "End2",
    UseSaveLoc = "",
  },
  [4] = {
    CreatureId = 851605,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "End3",
    UseSaveLoc = "",
  },
  [5] = {
    CreatureId = 851605,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "End4",
    UseSaveLoc = "",
  },
  [6] = {
    CreatureId = 851605,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "End5",
    UseSaveLoc = "",
  },
  [7] = {
    CreatureId = 851605,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "End6",
    UseSaveLoc = "",
  },
}
r6_0.TaskId = 851613
r4_0[851613] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_33,
  [2] = r0_0.RT_10,
  [3] = {
    FXId = 851609,
    Function = "PlayFX",
    Overlap = true,
  },
}
r6_0.TaskId = 851614
r4_0[851614] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    FXId = 851609,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
}
r6_0.TaskId = 851615
r4_0[851615] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    FXId = 851610,
    Function = "PlayFX",
    IsAttached = true,
  },
  [2] = {
    Delay = 0.2,
    FXId = 851611,
    Function = "PlayFX",
    IsAttached = true,
  },
}
r6_0.TaskId = 851617
r4_0[851617] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851606,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "RocketDrop",
    UseSaveLoc = "RocketFire",
  },
}
r6_0.TaskId = 851618
r4_0[851618] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_3,
  [2] = r0_0.RT_10,
  [3] = {
    FXId = 851612,
    Function = "PlayFX",
    Overlap = true,
  },
}
r6_0.TaskId = 851619
r4_0[851619] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    FXId = 851612,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
}
r6_0.TaskId = 851620
r4_0[851620] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851607,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 851621
r4_0[851621] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851607,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 851622
r4_0[851622] = r6_0
r6_0 = {
  TargetFilter = "Mon_Sphere_50_360",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_502,
  [2] = {
    FXId = 851614,
    Function = "PlayFX",
    Overlap = true,
  },
}
r6_0.TaskId = 851623
r4_0[851623] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851608,
    Function = "CreateSkillCreature",
    UseSaveLoc = "",
  },
}
r6_0.TaskId = 851624
r4_0[851624] = r6_0
r6_0 = {
  TargetFilter = "Mon_Sphere_100_360",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_33,
  [2] = {
    FXId = 851617,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 851625
r4_0[851625] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851609,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_98,
  },
}
r6_0.TaskId = 851626
r4_0[851626] = r6_0
r4_0[851627] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_753,
  },
  TaskId = 851627,
}
r4_0[851630] = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "BossFuer_Skill06_Rectangle",
  TaskEffects = r0_0.RT_1202,
  TaskId = 851630,
}
r4_0[851631] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_768,
  TaskId = 851631,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851611,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 851632
r4_0[851632] = r6_0
r4_0[851635] = {
  NotifyName = r0_0.RT_405,
  TargetFilter = "BossFuer_Skill06_Cylinder",
  TaskEffects = r0_0.RT_1201,
  TaskId = 851635,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 6000206,
    Function = "AddBuff",
    LastTime = 3,
  },
}
r6_0.TaskId = 851636
r4_0[851636] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 6000206,
    BySource = true,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 851637
r4_0[851637] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851611,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 851638
r4_0[851638] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CauseHit = "LightHit",
    Function = "CutToughness",
    Value = 1000000,
  },
}
r6_0.TaskId = 851639
r4_0[851639] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851614,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 851640
r4_0[851640] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851614,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 851641
r4_0[851641] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851606,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "RocketDrop1",
    UseSaveLoc = "RocketFire1",
  },
}
r6_0.TaskId = 851642
r4_0[851642] = r6_0
r4_0[851643] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossFuer_Skill01_1",
  TaskEffects = r0_0.RT_1203,
  TaskId = 851643,
}
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851615,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 851644
r4_0[851644] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851615,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 851645
r4_0[851645] = r6_0
r4_0[851646] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossFuer_Skill01_2",
  TaskEffects = r0_0.RT_1203,
  TaskId = 851646,
}
r4_0[851647] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BossFuer_Skill01_3",
  TaskEffects = r0_0.RT_1203,
  TaskId = 851647,
}
r4_0[851648] = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "BossFuer_Skill01_4",
  TaskEffects = r0_0.RT_1203,
  TaskId = 851648,
}
r4_0[851649] = {
  NotifyName = r0_0.RT_405,
  TargetFilter = "BossFuer_Skill01_5",
  TaskEffects = r0_0.RT_1203,
  TaskId = 851649,
}
r4_0[851650] = {
  NotifyName = r0_0.RT_505,
  TargetFilter = "BossFuer_Skill01_6",
  TaskEffects = r0_0.RT_1203,
  TaskId = 851650,
}
r4_0[851651] = {
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_1202,
  TaskId = 851651,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851616,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 851652
r4_0[851652] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851616,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 851653
r4_0[851653] = r6_0
r4_0[851654] = {
  TargetFilter = "BTTarget",
  TaskEffects = {
    [1] = r0_0.RT_10,
    [2] = r0_0.RT_3,
    [3] = r0_0.RT_661,
  },
  TaskId = 851654,
}
r4_0[851701] = {
  NotifyName = r0_0.RT_667,
  TargetFilter = "Mon_Cylinder_300_200_180",
  TaskEffects = r0_0.RT_1205,
  TaskId = 851701,
}
r6_0 = {
  NotifyName = r0_0.RT_13,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851702,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_36,
  },
}
r6_0.TaskId = 851702
r4_0[851702] = r6_0
r4_0[851703] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_3,
    [2] = r0_0.RT_10,
    [3] = r0_0.RT_1206,
  },
  TaskId = 851703,
}
r4_0[851704] = {
  NotifyName = r0_0.RT_405,
  TargetFilter = "Mon_Cylinder_300_200_180",
  TaskEffects = {
    [1] = r0_0.RT_3,
    [2] = r0_0.RT_1100,
    [3] = r0_0.RT_1204,
  },
  TaskId = 851704,
}
r4_0[851705] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_400_200_360",
  TaskEffects = r0_0.RT_1207,
  TaskId = 851705,
}
r4_0[851706] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Mon_Sphere_500_360",
  TaskEffects = {
    [1] = r0_0.RT_779,
    [2] = r0_0.RT_753,
    [3] = r0_0.RT_1204,
  },
  TaskId = 851706,
}
r4_0[851707] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_300_200_180",
  TaskEffects = r0_0.RT_1207,
  TaskId = 851707,
}
r4_0[851708] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Mon_Sphere_400_360",
  TaskEffects = r0_0.RT_1208,
  TaskId = 851708,
}
r4_0[851709] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Sphere_400_360",
  TaskEffects = r0_0.RT_1208,
  TaskId = 851709,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r8_0 = {}
r8_0[1] = {
  AttrRates = {
    ATK = 1,
    DEF = 0,
    ES = 1,
    HP = 1,
    MaxES = 1,
    MaxHp = "1",
  },
  Function = "CreateUnit",
  UnitId = 8517002,
  UnitType = "Monster",
}
r6_0.TaskEffects = r8_0
r6_0.TaskId = 851710
r4_0[851710] = r6_0
r4_0[851711] = {
  NotifyName = {
    "hit4",
    "hit1",
    "hit3"
  },
  TargetFilter = "Mon_Cylinder_300_200_180",
  TaskEffects = r0_0.RT_1205,
  TaskId = 851711,
}
r4_0[851712] = {
  TargetFilter = "Mon_Sphere_200_360",
  TaskEffects = {
    [1] = r0_0.RT_3,
    [2] = r0_0.RT_1127,
    [3] = r0_0.RT_1206,
  },
  TaskId = 851712,
}
r4_0[851713] = {
  NotifyName = r0_0.RT_505,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_20,
  TaskId = 851713,
}
r6_0 = {
  NotifyName = r0_0.RT_821,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851701,
    Function = "CreateSkillCreature",
    UseSaveLoc = "",
  },
}
r6_0.TaskId = 851714
r4_0[851714] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "CreateUnit",
    LifeTime = 4.5,
    MaxSummonCount = 5,
    Rotation = r0_0.RT_186,
    SingleSummonCount = 1,
    UnitId = 851801,
    UnitType = "MechanismSummon",
  },
}
r6_0.TaskId = 851801
r4_0[851801] = r6_0
r5_0 = 851802
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  Function = "CreateUnit",
  LifeTime = 3.05,
  MaxSummonCount = 5,
  Rotation = {
    0,
    0,
    -30
  },
  SingleSummonCount = 1,
  UnitId = 851802,
  UnitType = "MechanismSummon",
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 851802
r4_0[r5_0] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BossRobot_Skill07_Cylinder",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_3,
  [2] = r0_0.RT_753,
  [3] = {
    Function = "PlaySE",
    SEId = 851812,
  },
}
r6_0.TaskId = 851803
r4_0[851803] = r6_0
r4_0[851804] = {
  TaskId = 851804,
}
r4_0[851805] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_20,
  TaskId = 851805,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_756,
  [2] = {
    CreatureId = 851803,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "",
    UseSaveLoc = "6",
  },
}
r6_0.TaskId = 851806
r4_0[851806] = r6_0
r6_0 = {
  TargetFilter = "BossJuque_Skill01_Cylinder",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_3,
  [2] = r0_0.RT_10,
  [3] = {
    Function = "PlaySE",
    SEId = 851804,
  },
}
r6_0.TaskId = 851807
r4_0[851807] = r6_0
r4_0[851808] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Mon_Cylinder_300_200_180",
  TaskEffects = r0_0.RT_1209,
  TaskId = 851808,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossRobot_Skill02_Cylinder",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_779,
  [2] = r0_0.RT_753,
  [3] = {
    Function = "PlaySE",
    SEId = 851803,
  },
}
r6_0.TaskId = 851810
r4_0[851810] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FormationId = 851801,
    Function = "BossSPSaveLocs",
    Location = r0_0.RT_351,
    SetSaveLocs = "First",
  },
  [2] = {
    CreatureId = 851802,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_351,
    UseRelativeOffset = true,
    UseSaveLoc = "First1",
  },
  [3] = {
    CreatureId = 851802,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_351,
    UseRelativeOffset = true,
    UseSaveLoc = "First2",
  },
  [4] = {
    CreatureId = 851802,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_351,
    UseRelativeOffset = true,
    UseSaveLoc = "First3",
  },
  [5] = {
    CreatureId = 851802,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_351,
    UseRelativeOffset = true,
    UseSaveLoc = "First4",
  },
  [6] = {
    CreatureId = 851802,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_351,
    UseRelativeOffset = true,
    UseSaveLoc = "First5",
  },
  [7] = {
    CreatureId = 851802,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_351,
    UseRelativeOffset = true,
    UseSaveLoc = "First6",
  },
  [8] = {
    CreatureId = 851802,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_351,
    UseRelativeOffset = true,
    UseSaveLoc = "First7",
  },
  [9] = {
    CreatureId = 851802,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_351,
    UseRelativeOffset = true,
    UseSaveLoc = "First8",
  },
}
r6_0.TaskId = 851811
r4_0[851811] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_523,
  TargetFilter = "BossJuque_Skill01_Cylinder",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_3,
  [2] = r0_0.RT_10,
  [3] = {
    Function = "PlaySE",
    SEId = 851801,
  },
}
r6_0.TaskId = 851812
r4_0[851812] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_756,
  [2] = {
    CreatureId = 851801,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "",
    UseSaveLoc = "6",
  },
}
r6_0.TaskId = 851813
r4_0[851813] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_756,
  [2] = r0_0.RT_758,
  [3] = {
    CreatureId = 851804,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "1",
    UseSaveLoc = "6",
  },
  [4] = {
    CreatureId = 851804,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "2",
    UseSaveLoc = "7",
  },
  [5] = {
    CreatureId = 851804,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "3",
    UseSaveLoc = "8",
  },
  [6] = {
    CreatureId = 851804,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "4",
    UseSaveLoc = "9",
  },
  [7] = {
    CreatureId = 851804,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "",
    UseSaveLoc = "10",
  },
}
r6_0.TaskId = 851814
r4_0[851814] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossRobot_Skill06_Cylinder",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_16,
  [2] = r0_0.RT_753,
  [3] = {
    Function = "PlaySE",
    SEId = 851807,
  },
}
r6_0.TaskId = 851815
r4_0[851815] = r6_0
r6_0 = {
  TargetFilter = "Mon_Sphere_300_360",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_16,
  [2] = {
    FXId = 851805,
    Function = "PlayFX",
    Overlap = true,
  },
  [3] = r0_0.RT_753,
  [4] = {
    Function = "PlaySE",
    SEId = 851809,
  },
}
r6_0.TaskId = 851816
r4_0[851816] = r6_0
r4_0[851817] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = {
    [1] = r0_0.RT_1210,
    [2] = r0_0.RT_1211,
    [3] = r0_0.RT_1212,
    [4] = r0_0.RT_1213,
  },
  TaskId = 851817,
}
r4_0[851818] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = {
    [1] = r0_0.RT_1214,
    [2] = r0_0.RT_1215,
    [3] = r0_0.RT_1216,
    [4] = r0_0.RT_1217,
  },
  TaskId = 851818,
}
r6_0 = {
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851805,
    Function = "CreateSkillCreature",
    UseSaveLoc = "loop",
  },
}
r6_0.TaskId = 851819
r4_0[851819] = r6_0
r4_0[851820] = {
  TargetFilter = "BossJuque_Creature_Rectangle",
  TaskEffects = r0_0.RT_1218,
  TaskId = 851820,
}
r4_0[851821] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_768,
  TaskId = 851821,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851806,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_992,
    UseSaveLoc = "",
  },
}
r6_0.TaskId = 851822
r4_0[851822] = r6_0
r4_0[851823] = {
  TargetFilter = "Mon_Cylinder_500_40_360",
  TaskEffects = r0_0.RT_1218,
  TaskId = 851823,
}
r4_0[851824] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = {
    [1] = r0_0.RT_1210,
  },
  TaskId = 851824,
}
r4_0[851825] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
  TaskEffects = {
    [1] = r0_0.RT_1211,
    [2] = r0_0.RT_1212,
  },
  TaskId = 851825,
}
r4_0[851826] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BTTarget",
  TaskEffects = {
    [1] = r0_0.RT_1214,
    [2] = r0_0.RT_1213,
    [3] = r0_0.RT_1219,
  },
  TaskId = 851826,
}
r4_0[851827] = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "BTTarget",
  TaskEffects = {
    [1] = r0_0.RT_1215,
    [2] = r0_0.RT_1216,
    [3] = r0_0.RT_1220,
    [4] = r0_0.RT_1221,
  },
  TaskId = 851827,
}
r4_0[851828] = {
  NotifyName = r0_0.RT_405,
  TargetFilter = "BTTarget",
  TaskEffects = {
    [1] = r0_0.RT_1217,
    [2] = r0_0.RT_1222,
    [3] = r0_0.RT_1223,
  },
  TaskId = 851828,
}
r4_0[851829] = {
  NotifyName = r0_0.RT_505,
  TargetFilter = "BTTarget",
  TaskEffects = {
    [1] = r0_0.RT_1224,
    [2] = r0_0.RT_1225,
  },
  TaskId = 851829,
}
r4_0[851830] = {
  NotifyName = r0_0.RT_821,
  TargetFilter = "BTTarget",
  TaskEffects = {
    [1] = r0_0.RT_1226,
  },
  TaskId = 851830,
}
r6_0 = {
  NotifyName = r0_0.RT_825,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851807,
    Function = "CreateSkillCreature",
    UseSaveLoc = "1",
  },
}
r6_0.TaskId = 851831
r4_0[851831] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_1135,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851807,
    Function = "CreateSkillCreature",
    UseSaveLoc = "2",
  },
}
r6_0.TaskId = 851832
r4_0[851832] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_509,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851807,
    Function = "CreateSkillCreature",
    UseSaveLoc = "3",
  },
}
r6_0.TaskId = 851833
r4_0[851833] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_904,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851807,
    Function = "CreateSkillCreature",
    UseSaveLoc = "4",
  },
}
r6_0.TaskId = 851834
r4_0[851834] = r6_0
r4_0[851835] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_1209,
  TaskId = 851835,
}
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 851003,
    Function = "AddBuff",
    LastTime = 99,
  },
  [2] = r0_0.RT_1123,
}
r6_0.TaskId = 851836
r4_0[851836] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 851003,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 851837
r4_0[851837] = r6_0
r4_0[851838] = {
  TargetFilter = "BTTarget",
  TaskEffects = {
    [1] = r0_0.RT_1210,
    [2] = r0_0.RT_1212,
    [3] = r0_0.RT_1219,
    [4] = r0_0.RT_1221,
  },
  TaskId = 851838,
}
r4_0[851839] = {
  TargetFilter = "BTTarget",
  TaskEffects = {
    [1] = r0_0.RT_1211,
    [2] = r0_0.RT_1213,
    [3] = r0_0.RT_1220,
    [4] = r0_0.RT_1223,
  },
  TaskId = 851839,
}
r4_0[851840] = {
  TargetFilter = "BTTarget",
  TaskEffects = {
    [1] = r0_0.RT_1214,
    [2] = r0_0.RT_1216,
    [3] = r0_0.RT_1222,
    [4] = r0_0.RT_1225,
  },
  TaskId = 851840,
}
r4_0[851841] = {
  TargetFilter = "BTTarget",
  TaskEffects = {
    [1] = r0_0.RT_1215,
    [2] = r0_0.RT_1217,
    [3] = r0_0.RT_1224,
    [4] = r0_0.RT_1226,
  },
  TaskId = 851841,
}
r4_0[851842] = {
  TargetFilter = "BTTarget",
  TaskEffects = {
    [1] = r0_0.RT_1210,
    [2] = r0_0.RT_1211,
    [3] = r0_0.RT_1214,
    [4] = r0_0.RT_1215,
  },
  TaskId = 851842,
}
r4_0[851843] = {
  TargetFilter = "BTTarget",
  TaskEffects = {
    [1] = r0_0.RT_1212,
    [2] = r0_0.RT_1213,
    [3] = r0_0.RT_1216,
    [4] = r0_0.RT_1217,
  },
  TaskId = 851843,
}
r4_0[851844] = {
  TargetFilter = "BTTarget",
  TaskEffects = {
    [1] = r0_0.RT_1219,
    [2] = r0_0.RT_1220,
    [3] = r0_0.RT_1222,
    [4] = r0_0.RT_1224,
  },
  TaskId = 851844,
}
r4_0[851845] = {
  TargetFilter = "BTTarget",
  TaskEffects = {
    [1] = r0_0.RT_1221,
    [2] = r0_0.RT_1223,
    [3] = r0_0.RT_1225,
    [4] = r0_0.RT_1226,
  },
  TaskId = 851845,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "InactiveStaticCreator",
    StaticCreatorId = 3,
  },
  [2] = {
    Function = "InactiveStaticCreator",
    StaticCreatorId = 4,
  },
  [3] = {
    Function = "InactiveStaticCreator",
    StaticCreatorId = 7,
  },
  [4] = {
    Function = "InactiveStaticCreator",
    StaticCreatorId = 8,
  },
  [5] = {
    Function = "InactiveStaticCreator",
    StaticCreatorId = 9,
  },
  [6] = {
    Function = "InactiveStaticCreator",
    StaticCreatorId = 10,
  },
  [7] = {
    Function = "InactiveStaticCreator",
    StaticCreatorId = 11,
  },
  [8] = {
    Function = "InactiveStaticCreator",
    StaticCreatorId = 12,
  },
}
r6_0.TaskId = 851846
r4_0[851846] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "InactiveStaticCreator",
    StaticCreatorId = 1,
  },
  [2] = {
    Function = "InactiveStaticCreator",
    StaticCreatorId = 2,
  },
  [3] = {
    Function = "InactiveStaticCreator",
    StaticCreatorId = 5,
  },
  [4] = {
    Function = "InactiveStaticCreator",
    StaticCreatorId = 6,
  },
}
r6_0.TaskId = 851847
r4_0[851847] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r6_0.TaskEffects = {
  [1] = {
    DanmakuTemplateId = 851801,
    Duration = 3,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 851848
r4_0[851848] = r6_0
r4_0[851849] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_1209,
  TaskId = 851849,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "InactiveStaticCreator",
    StaticCreatorId = 13,
  },
  [2] = {
    Function = "InactiveStaticCreator",
    StaticCreatorId = 14,
  },
  [3] = {
    Function = "InactiveStaticCreator",
    StaticCreatorId = 15,
  },
  [4] = {
    Function = "InactiveStaticCreator",
    StaticCreatorId = 16,
  },
}
r6_0.TaskId = 851850
r4_0[851850] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ActiveStaticCreator",
    StaticCreatorId = 13,
  },
  [2] = {
    Function = "ActiveStaticCreator",
    StaticCreatorId = 14,
  },
  [3] = {
    Function = "ActiveStaticCreator",
    StaticCreatorId = 15,
  },
  [4] = {
    Function = "ActiveStaticCreator",
    StaticCreatorId = 16,
  },
}
r6_0.TaskId = 851851
r4_0[851851] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851901,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 851901
r4_0[851901] = r6_0
r4_0[851902] = {
  TargetFilter = "Mon_Sphere_50_360",
  TaskEffects = r0_0.RT_1228,
  TaskId = 851902,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851901,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 851903
r4_0[851903] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    DanmakuTemplateId = 851901,
    Duration = 0.5,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 851904
r4_0[851904] = r6_0
r4_0[851905] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_3,
    [2] = r0_0.RT_506,
  },
  TaskId = 851905,
}
r4_0[851906] = {
  TaskEffects = r0_0.RT_508,
  TaskId = 851906,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    DanmakuTemplateId = 851902,
    Duration = 0.5,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 851907
r4_0[851907] = r6_0
r4_0[851908] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossLiecheHand_Skill01",
  TaskEffects = {
    [1] = r0_0.RT_3,
    [2] = r0_0.RT_1229,
  },
  TaskId = 851908,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "EffectFunction",
    FunctionName = "Mon_BossLiecheHand_Skill02Bullet",
  },
  [2] = {
    CreatureId = 851902,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "End1",
    UseSaveLoc = "Start1",
  },
  [3] = {
    CreatureId = 851902,
    Delay = 0.2,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "End2",
    UseSaveLoc = "Start2",
  },
  [4] = {
    CreatureId = 851902,
    Delay = 0.4,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "End3",
    UseSaveLoc = "Start3",
  },
  [5] = {
    CreatureId = 851902,
    Delay = 0.6,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "End4",
    UseSaveLoc = "Start4",
  },
  [6] = {
    CreatureId = 851902,
    Delay = 0.8,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "End5",
    UseSaveLoc = "Start5",
  },
}
r6_0.TaskId = 851909
r4_0[851909] = r6_0
r4_0[851910] = {
  TargetFilter = "Mon_Sphere_100_360",
  TaskEffects = {
    [1] = r0_0.RT_22,
    [2] = r0_0.RT_1171,
  },
  TaskId = 851910,
}
r4_0[851911] = {
  TaskId = 851911,
}
r4_0[851912] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_676,
    [2] = r0_0.RT_1230,
  },
  TaskId = 851912,
}
r6_0 = {
  NotifyName = r0_0.RT_405,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1231,
  [2] = {
    CreatureId = 851903,
    Delay = 2,
    Function = "CreateSkillCreature",
    UseSaveLoc = "LMid",
  },
  [3] = {
    CreatureId = 851903,
    Delay = 4,
    Function = "CreateSkillCreature",
    UseSaveLoc = "LDown",
  },
}
r6_0.TaskId = 851913
r4_0[851913] = r6_0
r4_0[851914] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_3,
    [2] = r0_0.RT_10,
    [3] = r0_0.RT_1200,
  },
  TaskId = 851914,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851906,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Down1",
  },
  [2] = {
    CreatureId = 851907,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Up2",
  },
  [3] = {
    CreatureId = 851906,
    Delay = 0.5,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Down3",
  },
  [4] = {
    CreatureId = 851907,
    Delay = 0.5,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Up4",
  },
  [5] = {
    CreatureId = 851906,
    Delay = 1,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Down5",
  },
  [6] = {
    CreatureId = 851907,
    Delay = 1,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Up6",
  },
}
r6_0.TaskId = 851915
r4_0[851915] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851907,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Up1",
  },
  [2] = {
    CreatureId = 851906,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Down2",
  },
  [3] = {
    CreatureId = 851907,
    Delay = 0.5,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Up3",
  },
  [4] = {
    CreatureId = 851906,
    Delay = 0.5,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Down4",
  },
  [5] = {
    CreatureId = 851907,
    Delay = 1,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Up5",
  },
  [6] = {
    CreatureId = 851906,
    Delay = 1,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Down6",
  },
}
r6_0.TaskId = 851916
r4_0[851916] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851908,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Down1",
  },
  [2] = {
    CreatureId = 851909,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Up2",
  },
  [3] = {
    CreatureId = 851908,
    Delay = 0.5,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Down3",
  },
  [4] = {
    CreatureId = 851909,
    Delay = 0.5,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Up4",
  },
  [5] = {
    CreatureId = 851908,
    Delay = 1,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Down5",
  },
  [6] = {
    CreatureId = 851909,
    Delay = 1,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Up6",
  },
}
r6_0.TaskId = 851917
r4_0[851917] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851909,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Up1",
  },
  [2] = {
    CreatureId = 851908,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Down2",
  },
  [3] = {
    CreatureId = 851909,
    Delay = 0.5,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Up3",
  },
  [4] = {
    CreatureId = 851908,
    Delay = 0.5,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Down4",
  },
  [5] = {
    CreatureId = 851909,
    Delay = 1,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Up5",
  },
  [6] = {
    CreatureId = 851908,
    Delay = 1,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Down6",
  },
}
r6_0.TaskId = 851918
r4_0[851918] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "SaveLoc",
    IsOnGround = true,
    Tag = "Skill03",
    TargetType = "Target",
  },
  [2] = {
    CreatureId = 851910,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Skill03",
  },
}
r6_0.TaskId = 851919
r4_0[851919] = r6_0
r4_0[851920] = {
  TargetFilter = "BossLieche_Skill07Step01",
  TaskEffects = r0_0.RT_1233,
  TaskId = 851920,
}
r4_0[851921] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_1234,
  TaskId = 851921,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "CreateUnit",
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 851902,
    UnitType = "MechanismSummon",
    UseSaveLoc = "Skill04",
  },
}
r6_0.TaskId = 851922
r4_0[851922] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1235,
  [2] = r0_0.RT_1236,
  [3] = {
    Function = "CreateUnit",
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 8519006,
    UnitType = "Monster",
    UseSaveLoc = "Skill05R",
  },
}
r6_0.TaskId = 851923
r4_0[851923] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossLiecheBomb_Burst",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_3,
  [2] = r0_0.RT_1229,
  [3] = {
    FXId = 851908,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 851924
r4_0[851924] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "CreateUnit",
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 8519004,
    UnitType = "Monster",
    UseSaveLoc = "Skill05L",
  },
}
r6_0.TaskId = 851925
r4_0[851925] = r6_0
r4_0[851926] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_1234,
  TaskId = 851926,
}
r6_0 = {
  NotifyName = r0_0.RT_505,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1237,
  [2] = {
    CreatureId = 851915,
    Delay = 2,
    Function = "CreateSkillCreature",
    UseSaveLoc = "LMid",
  },
  [3] = {
    CreatureId = 851915,
    Delay = 4,
    Function = "CreateSkillCreature",
    UseSaveLoc = "LDown",
  },
}
r6_0.TaskId = 851927
r4_0[851927] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "CreateUnit",
    LifeTime = 30,
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 851901,
    UnitType = "MechanismSummon",
  },
}
r6_0.TaskId = 851929
r4_0[851929] = r6_0
r4_0[851930] = {
  TargetFilter = "BossLieche_Skill07Step01",
  TaskEffects = r0_0.RT_1233,
  TaskId = 851930,
}
r6_0 = {
  TargetFilter = "BossLieche_Skill07Step02",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_22,
  [2] = r0_0.RT_1229,
  [3] = {
    FXId = 851903,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 851931
r4_0[851931] = r6_0
r6_0 = {
  TargetFilter = "BossLieche_Skill07AllLieche",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_22,
  [2] = r0_0.RT_1229,
  [3] = {
    FXId = 851906,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 851932
r4_0[851932] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851912,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 851933
r4_0[851933] = r6_0
r6_0 = {
  TargetFilter = "BossLieche_Skill07Attach",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_22,
  [2] = r0_0.RT_1229,
  [3] = {
    FXId = 851905,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 851934
r4_0[851934] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851913,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 851935
r4_0[851935] = r6_0
r6_0 = {
  TargetFilter = "BossLieche_Skill07Step03",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_22,
  [2] = r0_0.RT_1229,
  [3] = {
    FXId = 851904,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 851936
r4_0[851936] = r6_0
r6_0 = {
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "SaveLoc",
    IsOnGround = true,
    Tag = "Step04",
    TargetType = "Target",
  },
  [2] = {
    CreatureId = 851914,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Step04",
  },
}
r6_0.TaskId = 851937
r4_0[851937] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1235,
  [2] = {
    Function = "CreateUnit",
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 8519006,
    UnitType = "Monster",
    UseSaveLoc = "Skill05M",
  },
  [3] = r0_0.RT_1238,
}
r6_0.TaskId = 851938
r4_0[851938] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "CreateUnit",
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 8519006,
    UnitType = "Monster",
    UseSaveLoc = "Skill05L",
  },
  [2] = r0_0.RT_1236,
  [3] = r0_0.RT_1238,
}
r6_0.TaskId = 851939
r4_0[851939] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851916,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 851940
r4_0[851940] = r6_0
r4_0[851941] = {
  TargetFilter = "Mon_Sphere_50_360",
  TaskEffects = r0_0.RT_1228,
  TaskId = 851941,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851916,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 851942
r4_0[851942] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "CreateUnit",
    LifeTime = 30,
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 851903,
    UnitType = "MechanismSummon",
  },
}
r6_0.TaskId = 851943
r4_0[851943] = r6_0
r4_0[851944] = {
  TargetFilter = "BossLiecheCore_Skill02Burst",
  TaskEffects = r0_0.RT_1233,
  TaskId = 851944,
}
r6_0 = {
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 851902,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 851945
r4_0[851945] = r6_0
r6_0 = {
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 851902,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 851946
r4_0[851946] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851917,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 851947
r4_0[851947] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851918,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 851948
r4_0[851948] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851918,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 851949
r4_0[851949] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_821,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1239,
  [2] = {
    CreatureId = 851919,
    Delay = 2,
    Function = "CreateSkillCreature",
    UseSaveLoc = "RMid",
  },
  [3] = {
    CreatureId = 851919,
    Delay = 4,
    Function = "CreateSkillCreature",
    UseSaveLoc = "RDown",
  },
}
r6_0.TaskId = 851950
r4_0[851950] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_825,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1240,
  [2] = {
    CreatureId = 851920,
    Delay = 2,
    Function = "CreateSkillCreature",
    UseSaveLoc = "RMid",
  },
  [3] = {
    CreatureId = 851920,
    Delay = 4,
    Function = "CreateSkillCreature",
    UseSaveLoc = "RDown",
  },
}
r6_0.TaskId = 851951
r4_0[851951] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r8_0 = {}
r8_0[1] = {
  AttrRates = {
    Hp = 0.4,
    MaxHp = 0.4,
  },
  Function = "CreateUnit",
  MaxSummonCount = 1,
  SingleSummonCount = 1,
  UnitId = 8519008,
  UnitType = "Monster",
  UseSaveLoc = "Skill07Center",
}
r6_0.TaskEffects = r8_0
r6_0.TaskId = 851952
r4_0[851952] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_821,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1239,
  [2] = {
    CreatureId = 851919,
    Delay = 0.2,
    Function = "CreateSkillCreature",
    UseSaveLoc = "RMid",
  },
  [3] = {
    CreatureId = 851919,
    Delay = 0.4,
    Function = "CreateSkillCreature",
    UseSaveLoc = "RDown",
  },
}
r6_0.TaskId = 851953
r4_0[851953] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_825,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1240,
  [2] = {
    CreatureId = 851920,
    Delay = 0.2,
    Function = "CreateSkillCreature",
    UseSaveLoc = "RMid",
  },
  [3] = {
    CreatureId = 851920,
    Delay = 0.4,
    Function = "CreateSkillCreature",
    UseSaveLoc = "RDown",
  },
}
r6_0.TaskId = 851954
r4_0[851954] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_405,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1231,
  [2] = {
    CreatureId = 851903,
    Delay = 0.2,
    Function = "CreateSkillCreature",
    UseSaveLoc = "LMid",
  },
  [3] = {
    CreatureId = 851903,
    Delay = 0.4,
    Function = "CreateSkillCreature",
    UseSaveLoc = "LDown",
  },
}
r6_0.TaskId = 851955
r4_0[851955] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_505,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1237,
  [2] = {
    CreatureId = 851915,
    Delay = 0.2,
    Function = "CreateSkillCreature",
    UseSaveLoc = "LMid",
  },
  [3] = {
    CreatureId = 851915,
    Delay = 0.4,
    Function = "CreateSkillCreature",
    UseSaveLoc = "LDown",
  },
}
r6_0.TaskId = 851956
r4_0[851956] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851921,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Skill091",
  },
  [2] = {
    CreatureId = 851923,
    Delay = 0.3,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Skill092",
  },
}
r6_0.TaskId = 851957
r4_0[851957] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851922,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Skill091",
  },
  [2] = {
    CreatureId = 851924,
    Delay = 0.3,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Skill092",
  },
}
r6_0.TaskId = 851958
r4_0[851958] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851925,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Skill093",
  },
  [2] = {
    CreatureId = 851927,
    Delay = 0.3,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Skill094",
  },
}
r6_0.TaskId = 851959
r4_0[851959] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851926,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Skill093",
  },
  [2] = {
    CreatureId = 851928,
    Delay = 0.3,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Skill094",
  },
}
r6_0.TaskId = 851960
r4_0[851960] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_405,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851929,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Skill095",
  },
}
r6_0.TaskId = 851961
r4_0[851961] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_505,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 851930,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Skill095",
  },
}
r6_0.TaskId = 851962
r4_0[851962] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1242,
  [2] = r0_0.RT_1244,
  [3] = {
    AttrRates = r0_0.RT_1241,
    Function = "CreateUnit",
    MaxSummonCount = 3,
    SingleSummonCount = 1,
    UnitId = 8519009,
    UnitType = "Monster",
    UseSaveLoc = "8519306",
  },
  [4] = r0_0.RT_1245,
  [5] = r0_0.RT_1246,
  [6] = r0_0.RT_1247,
  [7] = r0_0.RT_1248,
  [8] = r0_0.RT_1249,
  [9] = r0_0.RT_1250,
  [10] = r0_0.RT_1243,
}
r6_0.TaskId = 851963
r4_0[851963] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AttrRates = r0_0.RT_1241,
    Function = "CreateUnit",
    MaxSummonCount = 3,
    SingleSummonCount = 1,
    UnitId = 8519009,
    UnitType = "Monster",
    UseSaveLoc = "8519303",
  },
  [2] = {
    AttrRates = r0_0.RT_1241,
    Function = "CreateUnit",
    MaxSummonCount = 3,
    SingleSummonCount = 1,
    UnitId = 8519009,
    UnitType = "Monster",
    UseSaveLoc = "8519305",
  },
  [3] = {
    AttrRates = r0_0.RT_1241,
    Function = "CreateUnit",
    MaxSummonCount = 3,
    SingleSummonCount = 1,
    UnitId = 8519009,
    UnitType = "Monster",
    UseSaveLoc = "8519307",
  },
  [4] = r0_0.RT_1245,
  [5] = r0_0.RT_1251,
  [6] = r0_0.RT_1252,
  [7] = r0_0.RT_1253,
  [8] = r0_0.RT_1249,
  [9] = r0_0.RT_1250,
  [10] = r0_0.RT_1243,
}
r6_0.TaskId = 851964
r4_0[851964] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1242,
  [2] = {
    AttrRates = r0_0.RT_1241,
    Function = "CreateUnit",
    MaxSummonCount = 3,
    SingleSummonCount = 1,
    UnitId = 8519009,
    UnitType = "Monster",
    UseSaveLoc = "8519308",
  },
  [3] = {
    AttrRates = r0_0.RT_1241,
    Function = "CreateUnit",
    MaxSummonCount = 3,
    SingleSummonCount = 1,
    UnitId = 8519009,
    UnitType = "Monster",
    UseSaveLoc = "8519310",
  },
  [4] = r0_0.RT_1245,
  [5] = r0_0.RT_1246,
  [6] = r0_0.RT_1247,
  [7] = r0_0.RT_1248,
  [8] = r0_0.RT_1252,
  [9] = r0_0.RT_1250,
  [10] = r0_0.RT_1253,
}
r6_0.TaskId = 851965
r4_0[851965] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AttrRates = r0_0.RT_1241,
    Function = "CreateUnit",
    MaxSummonCount = 3,
    SingleSummonCount = 1,
    UnitId = 8519009,
    UnitType = "Monster",
    UseSaveLoc = "8519301",
  },
  [2] = r0_0.RT_1244,
  [3] = {
    AttrRates = r0_0.RT_1241,
    Function = "CreateUnit",
    MaxSummonCount = 3,
    SingleSummonCount = 1,
    UnitId = 8519009,
    UnitType = "Monster",
    UseSaveLoc = "8519309",
  },
  [4] = r0_0.RT_1251,
  [5] = r0_0.RT_1246,
  [6] = r0_0.RT_1247,
  [7] = r0_0.RT_1248,
  [8] = r0_0.RT_1249,
  [9] = r0_0.RT_1253,
  [10] = r0_0.RT_1243,
}
r6_0.TaskId = 851966
r4_0[851966] = r6_0
r6_0 = {
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 851903,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 851967
r4_0[851967] = r6_0
r6_0 = {
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 851903,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 851968
r4_0[851968] = r6_0
r6_0 = {
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 851904,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 851969
r4_0[851969] = r6_0
r6_0 = {
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 851904,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 851970
r4_0[851970] = r6_0
r6_0 = {
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 851905,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 851971
r4_0[851971] = r6_0
r6_0 = {
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 851905,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 851972
r4_0[851972] = r6_0
r6_0 = {
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 851906,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 851973
r4_0[851973] = r6_0
r6_0 = {
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 851906,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 851974
r4_0[851974] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "CreateUnit",
    LifeTime = 30,
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 851904,
    UnitType = "MechanismSummon",
  },
}
r6_0.TaskId = 851975
r4_0[851975] = r6_0
r4_0[851976] = {
  TargetFilter = "BossLiecheCore_Skill05Burst1",
  TaskEffects = r0_0.RT_1254,
  TaskId = 851976,
}
r4_0[851977] = {
  TargetFilter = "BossLiecheCore_Skill05Burst2",
  TaskEffects = r0_0.RT_1254,
  TaskId = 851977,
}
r4_0[851978] = {
  TargetFilter = "BossLiecheCore_Skill05Burst3",
  TaskEffects = r0_0.RT_1254,
  TaskId = 851978,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852001,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200101,
    UseBattlePointRotation = 1,
  },
  [2] = {
    CreatureId = 852002,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200102,
    UseBattlePointRotation = 1,
  },
  [3] = {
    CreatureId = 852003,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200103,
    UseBattlePointRotation = 1,
  },
  [4] = {
    CreatureId = 852004,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200104,
    UseBattlePointRotation = 1,
  },
  [5] = {
    CreatureId = 852005,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200105,
    UseBattlePointRotation = 1,
  },
  [6] = {
    CreatureId = 852006,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200106,
    UseBattlePointRotation = 1,
  },
  [7] = {
    CreatureId = 852001,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200107,
    UseBattlePointRotation = 1,
  },
  [8] = {
    CreatureId = 852001,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200108,
    UseBattlePointRotation = 1,
  },
  [9] = {
    CreatureId = 852004,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200109,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852001
r4_0[852001] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852002,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200110,
    UseBattlePointRotation = 1,
  },
  [2] = {
    CreatureId = 852003,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200111,
    UseBattlePointRotation = 1,
  },
  [3] = {
    CreatureId = 852003,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200112,
    UseBattlePointRotation = 1,
  },
  [4] = {
    CreatureId = 852003,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200113,
    UseBattlePointRotation = 1,
  },
  [5] = {
    CreatureId = 852003,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200114,
    UseBattlePointRotation = 1,
  },
  [6] = {
    CreatureId = 852003,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200115,
    UseBattlePointRotation = 1,
  },
  [7] = {
    CreatureId = 852004,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200116,
    UseBattlePointRotation = 1,
  },
  [8] = {
    CreatureId = 852002,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200117,
    UseBattlePointRotation = 1,
  },
  [9] = {
    CreatureId = 852006,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200118,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852002
r4_0[852002] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852006,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200119,
    UseBattlePointRotation = 1,
  },
  [2] = {
    CreatureId = 852006,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200120,
    UseBattlePointRotation = 1,
  },
  [3] = {
    CreatureId = 852006,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200121,
    UseBattlePointRotation = 1,
  },
  [4] = {
    CreatureId = 852006,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200122,
    UseBattlePointRotation = 1,
  },
  [5] = {
    CreatureId = 852002,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200123,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852003
r4_0[852003] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_3,
  [2] = {
    CauseHit = "HitFly_XY0Z3000",
    Function = "CutToughness",
  },
  [3] = r0_0.RT_1200,
}
r6_0.TaskId = 852004
r4_0[852004] = r6_0
r4_0[852005] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossAida_Skill02_BoxL",
  TaskEffects = r0_0.RT_1256,
  TaskId = 852005,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852007,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 852006
r4_0[852006] = r6_0
r4_0[852007] = {
  TargetFilter = "Mon_Sphere_200_360",
  TaskEffects = {
    [1] = r0_0.RT_3,
    [2] = r0_0.RT_10,
    [3] = r0_0.RT_1196,
  },
  TaskId = 852007,
}
r4_0[852008] = {
  TargetFilter = "BossAida_Skill04_Box1",
  TaskEffects = r0_0.RT_1256,
  TaskId = 852008,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1257,
  [2] = r0_0.RT_1259,
  [3] = r0_0.RT_1260,
  [4] = r0_0.RT_1261,
  [5] = r0_0.RT_1262,
  [6] = {
    CreatureId = 852009,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200507,
    UseBattlePointRotation = 1,
  },
  [7] = r0_0.RT_1263,
  [8] = r0_0.RT_1264,
  [9] = r0_0.RT_1265,
  [10] = r0_0.RT_1258,
}
r6_0.TaskId = 852009
r4_0[852009] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852009,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200502,
    UseBattlePointRotation = 1,
  },
  [2] = r0_0.RT_1259,
  [3] = r0_0.RT_1260,
  [4] = r0_0.RT_1261,
  [5] = r0_0.RT_1262,
  [6] = r0_0.RT_1266,
  [7] = r0_0.RT_1263,
  [8] = r0_0.RT_1264,
  [9] = r0_0.RT_1265,
  [10] = r0_0.RT_1258,
}
r6_0.TaskId = 852010
r4_0[852010] = r6_0
r4_0[852011] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_3,
    [2] = r0_0.RT_1255,
    [3] = r0_0.RT_1200,
  },
  TaskId = 852011,
}
r6_0 = {
  NotifyName = r0_0.RT_509,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BattlePointID = 85200000,
    Function = "SetSelfLoc",
    TargetCenterLoc = "BattlePoint",
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852013
r4_0[852013] = r6_0
r4_0[852014] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossAida_Skill02_BoxR",
  TaskEffects = r0_0.RT_1256,
  TaskId = 852014,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BattlePointID = 85200501,
    Function = "SetSelfLoc",
    TargetCenterLoc = "BattlePoint",
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852015
r4_0[852015] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BattlePointID = 85200701,
    Function = "SetSelfLoc",
    TargetCenterLoc = "BattlePoint",
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852016
r4_0[852016] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852010,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200000,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852017
r4_0[852017] = r6_0
r4_0[852018] = {
  TargetFilter = "BossAida_Skill07_Box1",
  TaskEffects = r0_0.RT_1267,
  TaskId = 852018,
}
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852011,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200702,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852019
r4_0[852019] = r6_0
r4_0[852020] = {
  TargetFilter = "BossAida_Skill07_Box2",
  TaskEffects = r0_0.RT_1267,
  TaskId = 852020,
}
r6_0 = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852012,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200703,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852021
r4_0[852021] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_405,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852026,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200704,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852022
r4_0[852022] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_505,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852027,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200705,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852023
r4_0[852023] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852010,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 852024
r4_0[852024] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_821,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852028,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200706,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852025
r4_0[852025] = r6_0
r4_0[852026] = {
  TargetFilter = "BossTuosi_Skill08_AroundBurstCylinder",
  TaskEffects = {
    [1] = r0_0.RT_1104,
    [2] = r0_0.RT_1113,
  },
  TaskId = 852026,
}
r4_0[852027] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_33,
    [2] = r0_0.RT_1110,
  },
  TaskId = 852027,
}
r4_0[852029] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_1269,
  TaskId = 852029,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852014,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200803,
    UseBattlePointRotation = 1,
  },
  [2] = {
    CreatureId = 852014,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200805,
    UseBattlePointRotation = 1,
  },
  [3] = {
    CreatureId = 852014,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200808,
    UseBattlePointRotation = 1,
  },
  [4] = {
    CreatureId = 852014,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200810,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852030
r4_0[852030] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_3,
  [2] = {
    CauseHit = "BossAida_Skill08TrainHit",
    Function = "CutToughness",
  },
}
r6_0.TaskId = 852031
r4_0[852031] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852015,
    Function = "CreateSkillCreature",
    UseBattlePointID = 852008031,
    UseBattlePointRotation = 1,
  },
  [2] = {
    CreatureId = 852015,
    Function = "CreateSkillCreature",
    UseBattlePointID = 852008051,
    UseBattlePointRotation = 1,
  },
  [3] = {
    CreatureId = 852015,
    Function = "CreateSkillCreature",
    UseBattlePointID = 852008081,
    UseBattlePointRotation = 1,
  },
  [4] = {
    CreatureId = 852015,
    Function = "CreateSkillCreature",
    UseBattlePointID = 852008101,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852032
r4_0[852032] = r6_0
r5_0 = 852033
r6_0 = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "BTTarget",
}
r7_0 = "TaskEffects"
r8_0 = {
  [1] = {
    Function = "SaveLoc",
    IsOnGround = true,
    Tag = "Skill08",
    TargetType = "Target",
  },
}
r8_0[2] = {
  CreatureId = 852016,
  Function = "CreateSkillCreature",
  Location = {
    0,
    0,
    -1000
  },
  Rotation = r0_0.RT_993,
  UseSaveLoc = "Skill08",
}
r8_0[3] = {
  CreatureId = 852016,
  Delay = 0.3,
  Function = "CreateSkillCreature",
  Location = {
    500,
    500,
    -1000
  },
  Rotation = r0_0.RT_993,
  UseSaveLoc = "Skill08",
}
r8_0[4] = {
  CreatureId = 852016,
  Delay = 0.6,
  Function = "CreateSkillCreature",
  Location = {
    0,
    500,
    -1000
  },
  Rotation = r0_0.RT_993,
  UseSaveLoc = "Skill08",
}
r8_0[5] = {
  CreatureId = 852016,
  Delay = 0.9,
  Function = "CreateSkillCreature",
  Location = {
    -500,
    0,
    -1000
  },
  Rotation = r0_0.RT_993,
  UseSaveLoc = "Skill08",
}
r8_0[6] = {
  CreatureId = 852016,
  Delay = 1.2,
  Function = "CreateSkillCreature",
  Location = {
    0,
    -500,
    -1000
  },
  Rotation = r0_0.RT_993,
  UseSaveLoc = "Skill08",
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 852033
r4_0[r5_0] = r6_0
r4_0[852034] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_1256,
  TaskId = 852034,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "CreateUnit",
    MaxSummonCount = 3,
    SingleSummonCount = 1,
    UnitId = 8520002,
    UnitType = "Monster",
    UseSaveLoc = "85200901",
  },
  [2] = r0_0.RT_1270,
  [3] = r0_0.RT_1271,
}
r6_0.TaskId = 852035
r4_0[852035] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "CreateUnit",
    MaxSummonCount = 3,
    SingleSummonCount = 1,
    UnitId = 8520002,
    UnitType = "Monster",
    UseSaveLoc = "85200902",
  },
  [2] = r0_0.RT_1272,
  [3] = r0_0.RT_1271,
}
r6_0.TaskId = 852036
r4_0[852036] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "CreateUnit",
    MaxSummonCount = 3,
    SingleSummonCount = 1,
    UnitId = 8520002,
    UnitType = "Monster",
    UseSaveLoc = "85200903",
  },
  [2] = r0_0.RT_1270,
  [3] = r0_0.RT_1272,
}
r6_0.TaskId = 852037
r4_0[852037] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_904,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHp",
    Function = "Heal",
    Rate = 0.1,
  },
}
r6_0.TaskId = 852038
r4_0[852038] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 8520004,
    UnitType = "Monster",
    UseSaveLoc = "85201101",
  },
  [2] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 8520005,
    UnitType = "Monster",
    UseSaveLoc = "85201101",
  },
  [3] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 8520006,
    UnitType = "Monster",
    UseSaveLoc = "85201101",
  },
}
r6_0.TaskId = 852039
r4_0[852039] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BoneName = "pelvis",
    DanmakuTemplateId = 852001,
    Duration = 0.5,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 852040
r4_0[852040] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BattlePointID = 85201101,
    Function = "SetSelfLoc",
    TargetCenterLoc = "BattlePoint",
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852041
r4_0[852041] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BattlePointID = 85201102,
    Function = "SetSelfLoc",
    TargetCenterLoc = "BattlePoint",
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852042
r4_0[852042] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BattlePointID = 85201103,
    Function = "SetSelfLoc",
    TargetCenterLoc = "BattlePoint",
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852043
r4_0[852043] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BattlePointID = 85201104,
    Function = "SetSelfLoc",
    TargetCenterLoc = "BattlePoint",
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852044
r4_0[852044] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BattlePointID = 85201105,
    Function = "SetSelfLoc",
    TargetCenterLoc = "BattlePoint",
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852045
r4_0[852045] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BattlePointID = 85201106,
    Function = "SetSelfLoc",
    TargetCenterLoc = "BattlePoint",
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852046
r4_0[852046] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852017,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85201001,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852047
r4_0[852047] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_3,
  [2] = {
    CauseHit = "BossAida_Skill10SPHit",
    Function = "CutToughness",
  },
}
r6_0.TaskId = 852048
r4_0[852048] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852018,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85201001,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852049
r4_0[852049] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852017,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85201002,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852050
r4_0[852050] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852019,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85201002,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852051
r4_0[852051] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_405,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852017,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85201003,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852052
r4_0[852052] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_505,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852020,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85201003,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852053
r4_0[852053] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_821,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852017,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85201004,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852054
r4_0[852054] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_825,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852021,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85201004,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852055
r4_0[852055] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_1135,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852017,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85201005,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852056
r4_0[852056] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_509,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852022,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85201005,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852057
r4_0[852057] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852023,
    Function = "CreateSkillCreature",
    Rotation = r0_0.RT_993,
  },
}
r6_0.TaskId = 852058
r4_0[852058] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852024,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200751,
  },
}
r6_0.TaskId = 852059
r4_0[852059] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852024,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 852060
r4_0[852060] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_904,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852025,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200751,
  },
}
r6_0.TaskId = 852061
r4_0[852061] = r6_0
r4_0[852062] = {
  TargetFilter = "BossAida_Skill10_Box1",
  TaskEffects = r0_0.RT_498,
  TaskId = 852062,
}
r6_0 = {
  NotifyName = r0_0.RT_909,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852018,
    Function = "RemoveSkillCreature",
  },
  [2] = {
    CreatureId = 852019,
    Function = "RemoveSkillCreature",
  },
  [3] = {
    CreatureId = 852020,
    Function = "RemoveSkillCreature",
  },
  [4] = {
    CreatureId = 852021,
    Function = "RemoveSkillCreature",
  },
  [5] = {
    CreatureId = 852022,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 852063
r4_0[852063] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1257,
  [2] = {
    CreatureId = 852009,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200503,
    UseBattlePointRotation = 1,
  },
  [3] = r0_0.RT_1260,
  [4] = r0_0.RT_1261,
  [5] = r0_0.RT_1262,
  [6] = r0_0.RT_1266,
  [7] = r0_0.RT_1263,
  [8] = r0_0.RT_1264,
  [9] = r0_0.RT_1265,
  [10] = r0_0.RT_1258,
}
r6_0.TaskId = 852064
r4_0[852064] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1257,
  [2] = r0_0.RT_1259,
  [3] = {
    CreatureId = 852009,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200504,
    UseBattlePointRotation = 1,
  },
  [4] = r0_0.RT_1261,
  [5] = r0_0.RT_1262,
  [6] = r0_0.RT_1266,
  [7] = r0_0.RT_1263,
  [8] = r0_0.RT_1264,
  [9] = r0_0.RT_1265,
  [10] = r0_0.RT_1258,
}
r6_0.TaskId = 852065
r4_0[852065] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1257,
  [2] = r0_0.RT_1259,
  [3] = r0_0.RT_1260,
  [4] = {
    CreatureId = 852009,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200505,
    UseBattlePointRotation = 1,
  },
  [5] = r0_0.RT_1262,
  [6] = r0_0.RT_1266,
  [7] = r0_0.RT_1263,
  [8] = r0_0.RT_1264,
  [9] = r0_0.RT_1265,
  [10] = r0_0.RT_1258,
}
r6_0.TaskId = 852066
r4_0[852066] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1257,
  [2] = r0_0.RT_1259,
  [3] = r0_0.RT_1260,
  [4] = r0_0.RT_1261,
  [5] = {
    CreatureId = 852009,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200506,
    UseBattlePointRotation = 1,
  },
  [6] = r0_0.RT_1266,
  [7] = r0_0.RT_1263,
  [8] = r0_0.RT_1264,
  [9] = r0_0.RT_1265,
  [10] = r0_0.RT_1258,
}
r6_0.TaskId = 852067
r4_0[852067] = r6_0
r6_0 = {
  TargetFilter = "BossAida_Skill07_Box3",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 301,
    Function = "AddBuff",
    LastTime = 2,
  },
}
r6_0.TaskId = 852068
r4_0[852068] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BattlePointID = 85200100,
    Function = "SetSelfLoc",
    TargetCenterLoc = "BattlePoint",
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852069
r4_0[852069] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852029,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200000,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852070
r4_0[852070] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_509,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BattlePointID = 85200751,
    Function = "SetSelfLoc",
    TargetCenterLoc = "BattlePoint",
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852071
r4_0[852071] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 8520007,
    UnitType = "Monster",
    UseSaveLoc = "85201101",
  },
  [2] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 8520008,
    UnitType = "Monster",
    UseSaveLoc = "85201101",
  },
}
r6_0.TaskId = 852072
r4_0[852072] = r6_0
r4_0[852073] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_1269,
  TaskId = 852073,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852030,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 852074
r4_0[852074] = r6_0
r4_0[852075] = {
  TargetFilter = "BossAida_Skill17_Cylinder1",
  TaskEffects = r0_0.RT_1256,
  TaskId = 852075,
}
r4_0[852076] = {
  TargetFilter = "BossAida_Skill17_Cylinder1_OtFr",
  TaskEffects = r0_0.RT_772,
  TaskId = 852076,
}
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "SetSelfLoc",
    SaveLocTag = "Skill17",
    TargetCenterLoc = "SavedLoc",
  },
}
r6_0.TaskId = 852077
r4_0[852077] = r6_0
r6_0 = {
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 852001,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 852078
r4_0[852078] = r6_0
r6_0 = {
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 852001,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 852079
r4_0[852079] = r6_0
r6_0 = {
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 852003,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 852080
r4_0[852080] = r6_0
r6_0 = {
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 852003,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 852081
r4_0[852081] = r6_0
r6_0 = {
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 852004,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 852082
r4_0[852082] = r6_0
r6_0 = {
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 852004,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 852083
r4_0[852083] = r6_0
r6_0 = {
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 852005,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 852084
r4_0[852084] = r6_0
r6_0 = {
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 852005,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 852085
r4_0[852085] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852001,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85201801,
    UseBattlePointRotation = 1,
  },
  [2] = {
    CreatureId = 852002,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85201802,
    UseBattlePointRotation = 1,
  },
  [3] = {
    CreatureId = 852003,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85201803,
    UseBattlePointRotation = 1,
  },
  [4] = {
    CreatureId = 852004,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85201804,
    UseBattlePointRotation = 1,
  },
  [5] = {
    CreatureId = 852005,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85201805,
    UseBattlePointRotation = 1,
  },
  [6] = {
    CreatureId = 852006,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85201806,
    UseBattlePointRotation = 1,
  },
  [7] = {
    CreatureId = 852001,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85201807,
    UseBattlePointRotation = 1,
  },
  [8] = {
    CreatureId = 852001,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85201808,
    UseBattlePointRotation = 1,
  },
  [9] = {
    CreatureId = 852004,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85201809,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852086
r4_0[852086] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852002,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85201810,
    UseBattlePointRotation = 1,
  },
  [2] = {
    CreatureId = 852003,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85201811,
    UseBattlePointRotation = 1,
  },
  [3] = {
    CreatureId = 852003,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85201812,
    UseBattlePointRotation = 1,
  },
  [4] = {
    CreatureId = 852003,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85201813,
    UseBattlePointRotation = 1,
  },
  [5] = {
    CreatureId = 852003,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85201814,
    UseBattlePointRotation = 1,
  },
  [6] = {
    CreatureId = 852003,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85201815,
    UseBattlePointRotation = 1,
  },
  [7] = {
    CreatureId = 852004,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85201816,
    UseBattlePointRotation = 1,
  },
  [8] = {
    CreatureId = 852002,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85201817,
    UseBattlePointRotation = 1,
  },
  [9] = {
    CreatureId = 852006,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85201818,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852087
r4_0[852087] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852006,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85201819,
    UseBattlePointRotation = 1,
  },
  [2] = {
    CreatureId = 852006,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85201820,
    UseBattlePointRotation = 1,
  },
  [3] = {
    CreatureId = 852006,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85201821,
    UseBattlePointRotation = 1,
  },
  [4] = {
    CreatureId = 852006,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85201822,
    UseBattlePointRotation = 1,
  },
  [5] = {
    CreatureId = 852002,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85201823,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852088
r4_0[852088] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BattlePointID = 85201800,
    Function = "SetSelfLoc",
    TargetCenterLoc = "BattlePoint",
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852089
r4_0[852089] = r6_0
r4_0[852090] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_1269,
  TaskId = 852090,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1273,
  [2] = r0_0.RT_1275,
  [3] = r0_0.RT_1276,
  [4] = r0_0.RT_1277,
  [5] = r0_0.RT_1278,
  [6] = {
    CreatureId = 852009,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200807,
    UseBattlePointRotation = 1,
  },
  [7] = r0_0.RT_1279,
  [8] = r0_0.RT_1280,
  [9] = r0_0.RT_1281,
  [10] = r0_0.RT_1274,
}
r6_0.TaskId = 852091
r4_0[852091] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852009,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200802,
    UseBattlePointRotation = 1,
  },
  [2] = r0_0.RT_1275,
  [3] = r0_0.RT_1276,
  [4] = r0_0.RT_1277,
  [5] = r0_0.RT_1278,
  [6] = r0_0.RT_1282,
  [7] = r0_0.RT_1279,
  [8] = r0_0.RT_1280,
  [9] = r0_0.RT_1281,
  [10] = r0_0.RT_1274,
}
r6_0.TaskId = 852092
r4_0[852092] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1273,
  [2] = {
    CreatureId = 852009,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200803,
    UseBattlePointRotation = 1,
  },
  [3] = r0_0.RT_1276,
  [4] = r0_0.RT_1277,
  [5] = r0_0.RT_1278,
  [6] = r0_0.RT_1282,
  [7] = r0_0.RT_1279,
  [8] = r0_0.RT_1280,
  [9] = r0_0.RT_1281,
  [10] = r0_0.RT_1274,
}
r6_0.TaskId = 852093
r4_0[852093] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1273,
  [2] = r0_0.RT_1275,
  [3] = {
    CreatureId = 852009,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200804,
    UseBattlePointRotation = 1,
  },
  [4] = r0_0.RT_1277,
  [5] = r0_0.RT_1278,
  [6] = r0_0.RT_1282,
  [7] = r0_0.RT_1279,
  [8] = r0_0.RT_1280,
  [9] = r0_0.RT_1281,
  [10] = r0_0.RT_1274,
}
r6_0.TaskId = 852094
r4_0[852094] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1273,
  [2] = r0_0.RT_1275,
  [3] = r0_0.RT_1276,
  [4] = {
    CreatureId = 852009,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200805,
    UseBattlePointRotation = 1,
  },
  [5] = r0_0.RT_1278,
  [6] = r0_0.RT_1282,
  [7] = r0_0.RT_1279,
  [8] = r0_0.RT_1280,
  [9] = r0_0.RT_1281,
  [10] = r0_0.RT_1274,
}
r6_0.TaskId = 852095
r4_0[852095] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1273,
  [2] = r0_0.RT_1275,
  [3] = r0_0.RT_1276,
  [4] = r0_0.RT_1277,
  [5] = {
    CreatureId = 852009,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200806,
    UseBattlePointRotation = 1,
  },
  [6] = r0_0.RT_1282,
  [7] = r0_0.RT_1279,
  [8] = r0_0.RT_1280,
  [9] = r0_0.RT_1281,
  [10] = r0_0.RT_1274,
}
r6_0.TaskId = 852096
r4_0[852096] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852029,
    Function = "CreateSkillCreature",
    UseBattlePointID = 85200751,
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 852097
r4_0[852097] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852031,
    Function = "CreateSkillCreature",
  },
  [2] = {
    CreatureId = 852032,
    Function = "CreateSkillCreature",
  },
  [3] = {
    CreatureId = 852033,
    Function = "CreateSkillCreature",
  },
  [4] = {
    CreatureId = 852034,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 852098
r4_0[852098] = r6_0
r4_0[852099] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_33,
    [2] = r0_0.RT_506,
    [3] = r0_0.RT_1101,
  },
  TaskId = 852099,
}
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_3,
  [2] = {
    FXId = 600203,
    Function = "PlayFX",
  },
  [3] = {
    BuffId = 6000200,
    Function = "AddBuff",
    LastTime = 3,
  },
}
r6_0.TaskId = 900001
r4_0[900001] = r6_0
r4_0[900002] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_1209,
  TaskId = 900002,
}
r4_0[900003] = {
  TargetFilter = "Mech_Bomb_MonAndSelf",
  TaskEffects = {
    [1] = r0_0.RT_577,
    [2] = r0_0.RT_753,
  },
  TaskId = 900003,
}
r6_0 = {
  TargetFilter = "Mech_Bomb_MonAndSelf",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_577,
  [2] = {
    CauseHit = "HitFly_XY600Z1000",
    Function = "CutToughness",
    Value = 350,
  },
}
r6_0.TaskId = 900004
r4_0[900004] = r6_0
r4_0[900005] = {
  TargetFilter = "Mech_Bomb_MonAndSelf",
  TaskEffects = {
    [1] = r0_0.RT_577,
    [2] = r0_0.RT_1291,
  },
  TaskId = 900005,
}
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 5000001,
    Function = "AddBuff",
    LastTime = 5,
  },
}
r6_0.TaskId = 900006
r4_0[900006] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 5000001,
    Function = "ChangeBuffLastTime",
    IsExpand = false,
    LastTimeValue = 5,
  },
}
r6_0.TaskId = 900007
r4_0[900007] = r6_0
r4_0[900008] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_1293,
    [2] = r0_0.RT_682,
  },
  TaskId = 900008,
}
r4_0[900009] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_768,
  TaskId = 900009,
}
r4_0[900010] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_3,
    [2] = r0_0.RT_1291,
  },
  TaskId = 900010,
}
r6_0 = {
  TargetFilter = "LaserTarget",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 5000006,
    Function = "AddBuff",
    LastTime = 100000,
  },
}
r6_0.TaskId = 900011
r4_0[900011] = r6_0
r6_0 = {
  TargetFilter = "LaserTarget",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 5000006,
    BySource = true,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 900012
r4_0[900012] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1294,
  [2] = {
    CauseHit = "HitFly_XY0Z1000",
    Function = "CutToughness",
    Value = 100,
  },
}
r6_0.TaskId = 900013
r4_0[900013] = r6_0
r4_0[900014] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_1294,
    [2] = r0_0.RT_110,
  },
  TaskId = 900014,
}
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CauseHit = "LightHit_1000_Z",
    Function = "CutToughness",
    Value = 100,
  },
}
r6_0.TaskId = 900015
r4_0[900015] = r6_0
r6_0 = {
  TargetFilter = "Mon_Sphere_300_360",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 900073,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
  [2] = r0_0.RT_680,
  [3] = r0_0.RT_682,
}
r6_0.TaskId = 900016
r4_0[900016] = r6_0
r6_0 = {
  TargetFilter = "LaserTarget",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 5000007,
    Function = "AddBuff",
    LastTime = 100000,
  },
}
r6_0.TaskId = 900017
r4_0[900017] = r6_0
r6_0 = {
  TargetFilter = "LaserTarget",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 5000008,
    Function = "AddBuff",
    LastTime = 100000,
  },
}
r6_0.TaskId = 900018
r4_0[900018] = r6_0
r6_0 = {
  TargetFilter = "LaserTarget",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 5000007,
    BySource = true,
    Function = "RemoveBuff",
  },
  [2] = {
    BuffId = 5000008,
    BySource = true,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 900019
r4_0[900019] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "EffectFunction",
    FunctionName = "RandomLocation",
    Vars = r0_0.RT_954,
  },
  [2] = r0_0.RT_1293,
  [3] = r0_0.RT_682,
}
r6_0.TaskId = 900020
r4_0[900020] = r6_0
r6_0 = {
  TargetFilter = "Mech_Target_OtFr",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHp",
    BaseChar = "Target",
    DamageType = "TrueDamage",
    Function = "Damage",
    Rate = 0.4,
  },
  [2] = {
    BuffId = 5000018,
    Function = "AddBuff",
    LastTime = 5,
  },
}
r6_0.TaskId = 900021
r4_0[900021] = r6_0
r6_0 = {
  TargetFilter = "LaserTarget",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    Function = "Damage",
    Rate = 0,
    Value = 3,
  },
  [2] = {
    BuffId = 5000019,
    Function = "AddBuff",
    LastTime = 5,
  },
}
r6_0.TaskId = 900022
r4_0[900022] = r6_0
r4_0[900023] = {
  TargetFilter = "Mech_PlayerSingle",
  TaskEffects = {
    [1] = r0_0.RT_1295,
  },
  TaskId = 900023,
}
r4_0[900024] = {
  TargetFilter = "LaserTarget",
  TaskEffects = {
    [1] = r0_0.RT_16,
    [2] = r0_0.RT_550,
    [3] = r0_0.RT_1296,
  },
  TaskId = 900024,
}
r4_0[900025] = {
  TargetFilter = "Mech_Target_OtFr",
  TaskEffects = {
    [1] = r0_0.RT_1297,
    [2] = r0_0.RT_550,
    [3] = r0_0.RT_1296,
  },
  TaskId = 900025,
}
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "Heal",
    Value = 800,
  },
  [2] = r0_0.RT_1298,
}
r6_0.TaskId = 900026
r4_0[900026] = r6_0
r4_0[900027] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_228,
  TaskId = 900027,
}
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "Heal",
    Value = 30,
  },
  [2] = r0_0.RT_227,
  [3] = {
    Function = "AddBullet",
    Value = 10,
  },
}
r6_0.TaskId = 900028
r4_0[900028] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "Heal",
    Value = 300,
  },
  [2] = r0_0.RT_1298,
}
r6_0.TaskId = 900029
r4_0[900029] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "AddSp",
    SpChange = 100,
  },
  [2] = r0_0.RT_96,
}
r6_0.TaskId = 900030
r4_0[900030] = r6_0
r4_0[900031] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_1166,
  TaskId = 900031,
}
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 851002,
    Function = "AddBuff",
    LastTime = 100000,
  },
  [2] = r0_0.RT_1295,
}
r6_0.TaskId = 900032
r4_0[900032] = r6_0
r4_0[900040] = {
  TargetFilter = "Mech_TouchBomb_Player",
  TaskEffects = {
    [1] = r0_0.RT_1284,
    [2] = r0_0.RT_502,
  },
  TaskId = 900040,
}
r6_0 = {
  TargetFilter = "Mech_TouchBomb_Monster",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    Function = "Damage",
    Rate = 999,
  },
  [2] = r0_0.RT_1299,
}
r6_0.TaskId = 900041
r4_0[900041] = r6_0
r6_0 = {
  TargetFilter = "Mech_TouchBomb_Player",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 900039,
    Function = "PlayFX",
  },
  [2] = r0_0.RT_1294,
}
r6_0.TaskId = 900042
r4_0[900042] = r6_0
r4_0[900043] = {
  TargetFilter = "Mech_TouchBomb_Monster",
  TaskEffects = {
    [1] = r0_0.RT_1300,
    [2] = r0_0.RT_1301,
  },
  TaskId = 900043,
}
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1300,
  [2] = r0_0.RT_1301,
  [3] = {
    Function = "PlaySE",
    SEId = 9000405,
  },
}
r6_0.TaskId = 900044
r4_0[900044] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1300,
  [2] = {
    FXId = 900042,
    Function = "PlayFX",
    IsAttached = true,
  },
  [3] = r0_0.RT_1301,
}
r6_0.TaskId = 900045
r4_0[900045] = r6_0
r4_0[900046] = {
  TargetFilter = "Mech_RockBomb_Player",
  TaskEffects = {
    [1] = r0_0.RT_1294,
    [2] = r0_0.RT_1301,
  },
  TaskId = 900046,
}
r6_0 = {
  TargetFilter = "Mech_RockBomb_Monster",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1300,
  [2] = {
    FXId = 900040,
    Function = "PlayFX",
  },
  [3] = r0_0.RT_1301,
}
r6_0.TaskId = 900047
r4_0[900047] = r6_0
r4_0[900048] = {
  TargetFilter = "Mech_BallBomb_Player",
  TaskEffects = r0_0.RT_1302,
  TaskId = 900048,
}
r6_0 = {
  TargetFilter = "Mech_BallBomb_Monster",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    DamageType = "TrueDamage",
    Function = "Damage",
    Rate = 9999,
  },
  [2] = {
    FXId = 900041,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 900049
r4_0[900049] = r6_0
r4_0[900050] = {
  TargetFilter = "LaserTarget",
  TaskEffects = {
    [1] = r0_0.RT_16,
    [2] = r0_0.RT_1303,
  },
  TaskId = 900050,
}
r4_0[900051] = {
  TargetFilter = "Mech_Target_OtFr",
  TaskEffects = {
    [1] = r0_0.RT_1297,
    [2] = r0_0.RT_1303,
  },
  TaskId = 900051,
}
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 900061,
    Function = "CreateSkillCreature",
  },
  [2] = {
    BaseChar = "Self",
    Function = "PlaySE",
    SEId = 9000601,
  },
}
r6_0.TaskId = 900061
r4_0[900061] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_735,
  [2] = r0_0.RT_1304,
  [3] = {
    Function = "PlaySE",
    SEId = 9000602,
  },
}
r6_0.TaskId = 900062
r4_0[900062] = r6_0
r4_0[900063] = {
  TaskEffects = {
    [1] = r0_0.RT_1304,
  },
  TaskId = 900063,
}
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    FXId = 900061,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 900064
r4_0[900064] = r6_0
r4_0[900070] = {
  TargetFilter = "Mech_IceBomb_Player",
  TaskEffects = r0_0.RT_1302,
  TaskId = 900070,
}
r6_0 = {
  TargetFilter = "Mech_IceBomb_Monster",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1294,
  [2] = {
    FXId = 900043,
    Function = "PlayFX",
  },
  [3] = {
    CauseHit = "LightHit_IceBomb",
    Function = "CutToughness",
    Value = 300,
  },
}
r6_0.TaskId = 900071
r4_0[900071] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_19,
  [2] = {
    CreatureId = 900071,
    Function = "CreateSkillCreature",
    UseSaveLoc = "",
  },
}
r6_0.TaskId = 900072
r4_0[900072] = r6_0
r6_0 = {
  TargetFilter = "Mech_IceBombField_Monster",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 5000021,
    Function = "AddBuff",
    LastTime = 0.5,
  },
}
r6_0.TaskId = 900073
r4_0[900073] = r6_0
r6_0 = {
  TargetFilter = "Mech_MonAndSelf",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHp",
    BaseChar = "Target",
    DamageType = "Default",
    Function = "Damage",
    Rate = 0.4,
  },
}
r6_0.TaskId = 900074
r4_0[900074] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHp",
    BaseChar = "Target",
    DamageType = "TrueDamage",
    Function = "Damage",
    Rate = 0.02,
  },
  [2] = {
    BuffId = 5000022,
    Function = "AddBuff",
    LastTime = 5,
  },
}
r6_0.TaskId = 900075
r4_0[900075] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 303,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 900076
r4_0[900076] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 303,
    Function = "ChangeBuffLastTime",
    IsExpand = false,
    LastTimeValue = 3,
  },
}
r6_0.TaskId = 900077
r4_0[900077] = r6_0
r4_0[900078] = {
  TargetFilter = "Mech_Bomb_Player",
  TaskEffects = r0_0.RT_1307,
  TaskId = 900078,
}
r6_0 = {
  TargetFilter = "Mech_Bomb_Monster",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    DamageType = "TrueDamage",
    Function = "Damage",
    Rate = 50,
  },
  [2] = r0_0.RT_1308,
}
r6_0.TaskId = 900079
r4_0[900079] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 900002,
    Function = "CreateSkillCreature",
    UseSaveLoc = "",
  },
  [2] = r0_0.RT_682,
}
r6_0.TaskId = 900080
r4_0[900080] = r6_0
r4_0[900081] = {
  TargetFilter = "Mon_Cylinder_300_200_360",
  TaskEffects = {
    [1] = r0_0.RT_680,
    [2] = r0_0.RT_1308,
  },
  TaskId = 900081,
}
r4_0[900082] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_20,
  TaskId = 900082,
}
r6_0 = {
  TargetFilter = "Mech_Bomb_PlayerSingle",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    Function = "Damage",
    Rate = 0,
    Value = 10,
  },
  [2] = r0_0.RT_753,
}
r6_0.TaskId = 900083
r4_0[900083] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "CreateUnit",
    LifeTime = 5,
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 900001,
    UnitType = "MechanismSummon",
  },
}
r6_0.TaskId = 900084
r4_0[900084] = r6_0
r6_0 = {
  TargetFilter = "Mech_Cylinder_500_40_360",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 5000103,
    Function = "AddBuff",
    LastTime = 5,
  },
}
r6_0.TaskId = 900085
r4_0[900085] = r6_0
r4_0[900086] = {
  TargetFilter = "Mech_Bomb",
  TaskEffects = r0_0.RT_1307,
  TaskId = 900086,
}
r6_0 = {
  TargetFilter = "Mech_Bomb_Monster",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    Function = "Damage",
    Rate = 50,
  },
  [2] = r0_0.RT_1308,
}
r6_0.TaskId = 900087
r4_0[900087] = r6_0
r4_0[900101] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_230_200_180",
  TaskEffects = {
    [1] = r0_0.RT_1309,
    [2] = r0_0.RT_661,
    [3] = r0_0.RT_1310,
  },
  TaskId = 900101,
}
r4_0[900102] = {
  NotifyName = r0_0.RT_523,
  TargetFilter = "Mon_Cylinder_230_200_180",
  TaskEffects = {
    [1] = r0_0.RT_1041,
    [2] = r0_0.RT_661,
    [3] = r0_0.RT_1310,
  },
  TaskId = 900102,
}
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Mon_Cylinder_230_200_180",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    Function = "Damage",
    Rate = 2.75,
  },
  [2] = r0_0.RT_661,
  [3] = r0_0.RT_110,
  [4] = r0_0.RT_1310,
}
r6_0.TaskId = 900103
r4_0[900103] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 900201,
    ExtraRotation = 104,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 900201
r4_0[900201] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1007,
  [2] = {
    FXId = 900202,
    Function = "PlayFX",
    Overlap = true,
  },
  [3] = r0_0.RT_1311,
}
r6_0.TaskId = 900202
r4_0[900202] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    FXId = 900202,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
}
r6_0.TaskId = 900203
r4_0[900203] = r6_0
r4_0[900204] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_230_200_180",
  TaskEffects = {
    [1] = r0_0.RT_1309,
    [2] = r0_0.RT_661,
    [3] = r0_0.RT_1311,
  },
  TaskId = 900204,
}
r4_0[900301] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_230_200_180",
  TaskEffects = r0_0.RT_1313,
  TaskId = 900301,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r8_0 = {}
r8_0[1] = {
  AttrRates = {
    ATK = 0.5,
    DEF = 0,
    MaxES = 0.5,
    MaxHp = 0.5,
  },
  FixLocation = true,
  FixLocationNav = 1,
  FixLocationZ = 0,
  FormationId = 900301,
  Function = "CreateUnit",
  LifeTime = 30,
  MaxSummonCount = 2,
  SingleSummonCount = 1,
  UnitId = 9004001,
  UnitType = "Monster",
}
r6_0.TaskEffects = r8_0
r6_0.TaskId = 900302
r4_0[900302] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 900303,
    Function = "AddBuff",
    LastTime = 12,
  },
}
r6_0.TaskId = 900303
r4_0[900303] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "SQ_Wanju_Skill02_Sphere",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 900401,
    Function = "AddBuff",
    LastTime = 5,
  },
}
r6_0.TaskId = 900304
r4_0[900304] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_667,
  TargetFilter = "Mon_Cylinder_230_200_180",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    Function = "Damage",
    Rate = 1.935,
  },
  [2] = r0_0.RT_39,
  [3] = r0_0.RT_661,
  [4] = r0_0.RT_1312,
}
r6_0.TaskId = 900305
r4_0[900305] = r6_0
r4_0[900401] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_768,
  TaskId = 900401,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 900401,
    Function = "CreateSkillCreature",
  },
  [2] = {
    CreatureId = 900402,
    Function = "CreateSkillCreature",
  },
  [3] = {
    CreatureId = 900403,
    Function = "CreateSkillCreature",
  },
  [4] = {
    CreatureId = 900404,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 900402
r4_0[900402] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    Function = "Damage",
    Rate = 0.56,
  },
  [2] = {
    FXId = 900403,
    Function = "PlayFX",
    Overlap = true,
  },
}
r6_0.TaskId = 900403
r4_0[900403] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    FXId = 900403,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
}
r6_0.TaskId = 900404
r4_0[900404] = r6_0
r4_0[900405] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_20,
  TaskId = 900405,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_758,
  [2] = {
    CreatureId = 900405,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_191,
    SetSavelocAsTarget = "1",
  },
  [3] = {
    CreatureId = 900405,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_191,
    SetSavelocAsTarget = "2",
  },
  [4] = {
    CreatureId = 900405,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_191,
    SetSavelocAsTarget = "3",
  },
  [5] = {
    CreatureId = 900405,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_191,
    SetSavelocAsTarget = "4",
  },
  [6] = {
    CreatureId = 900405,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_191,
    SetSavelocAsTarget = "",
  },
}
r6_0.TaskId = 900406
r4_0[900406] = r6_0
r6_0 = {
  TargetFilter = "Mon_Sphere_300_360",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_22,
  [2] = r0_0.RT_110,
  [3] = {
    FXId = 900405,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
}
r6_0.TaskId = 900407
r4_0[900407] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHp",
    Function = "Heal",
    Rate = 0.2,
  },
  [2] = r0_0.RT_1230,
}
r6_0.TaskId = 900408
r4_0[900408] = r6_0
r4_0[900501] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_230_200_180",
  TaskEffects = r0_0.RT_1313,
  TaskId = 900501,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "Root",
    CreatureId = 900501,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 900502
r4_0[900502] = r6_0
r4_0[900503] = {
  TargetFilter = "Mon_Sphere_300_360",
  TaskEffects = {
    [1] = r0_0.RT_680,
    [2] = r0_0.RT_18,
    [3] = r0_0.RT_495,
    [4] = r0_0.RT_656,
  },
  TaskId = 900503,
}
r4_0[900504] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Sphere_800_360",
  TaskEffects = {
    [1] = r0_0.RT_358,
    [2] = r0_0.RT_18,
    [3] = r0_0.RT_656,
  },
  TaskId = 900504,
}
r4_0[900505] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_749,
  TaskId = 900505,
}
r4_0[900506] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_230_200_180",
  TaskEffects = {
    [1] = r0_0.RT_22,
    [2] = r0_0.RT_661,
    [3] = r0_0.RT_39,
    [4] = r0_0.RT_1312,
  },
  TaskId = 900506,
}
r4_0[900507] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "SQ_Baozha_Skill03_Sphere",
  TaskEffects = {
    [1] = r0_0.RT_779,
    [2] = r0_0.RT_18,
    [3] = r0_0.RT_656,
  },
  TaskId = 900507,
}
r4_0[900508] = {
  TargetFilter = "SQ_Baozha_Die_Sphere",
  TaskEffects = {
    [1] = r0_0.RT_358,
    [2] = r0_0.RT_10,
    [3] = r0_0.RT_656,
  },
  TaskId = 900508,
}
r4_0[900601] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_230_200_180",
  TaskEffects = {
    [1] = r0_0.RT_23,
    [2] = r0_0.RT_661,
    [3] = r0_0.RT_39,
    [4] = r0_0.RT_1314,
  },
  TaskId = 900601,
}
r4_0[900602] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_230_200_180",
  TaskEffects = {
    [1] = r0_0.RT_7,
    [2] = r0_0.RT_661,
    [3] = r0_0.RT_39,
    [4] = r0_0.RT_1314,
  },
  TaskId = 900602,
}
r4_0[900603] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Mon_Cylinder_230_200_180",
  TaskEffects = {
    [1] = r0_0.RT_22,
    [2] = r0_0.RT_661,
    [3] = r0_0.RT_39,
    [4] = r0_0.RT_1314,
  },
  TaskId = 900603,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 900601,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_191,
  },
}
r6_0.TaskId = 900604
r4_0[900604] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 900601,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 900605
r4_0[900605] = r6_0
r4_0[900606] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_1103,
    [2] = r0_0.RT_10,
    [3] = r0_0.RT_4,
    [4] = r0_0.RT_1314,
  },
  TaskId = 900606,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 900601,
    Function = "AddBuff",
    LastTime = 2.5,
  },
}
r6_0.TaskId = 900607
r4_0[900607] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FixLocation = true,
    FixLocationNav = 1,
    FormationId = 900601,
    Function = "CreateUnit",
    LifeTime = 20,
    MaxSummonCount = 5,
    SingleSummonCount = 1,
    UnitId = 9006002,
    UnitType = "Monster",
  },
}
r6_0.TaskId = 900608
r4_0[900608] = r6_0
r4_0[900609] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_20,
  TaskId = 900609,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "SetSelfLoc",
    SaveLocTag = "NearlistSumLoc",
    TargetCenterLoc = "SavedLoc",
  },
}
r6_0.TaskId = 900610
r4_0[900610] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 900602,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_191,
  },
}
r6_0.TaskId = 900611
r4_0[900611] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 900602,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 900612
r4_0[900612] = r6_0
r4_0[900613] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_680,
    [2] = r0_0.RT_10,
    [3] = r0_0.RT_4,
    [4] = r0_0.RT_1314,
  },
  TaskId = 900613,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 301,
    Function = "AddBuff",
    LastTime = 0.5,
  },
}
r6_0.TaskId = 900614
r4_0[900614] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    FixLocation = true,
    FixLocationNav = 1,
    FixLocationZ = 0,
    FormationId = 900602,
    Function = "CreateUnit",
    LifeTime = 20,
    MaxSummonCount = 5,
    SingleSummonCount = 5,
    UnitId = 9006003,
    UnitType = "Monster",
  },
}
r6_0.TaskId = 900615
r4_0[900615] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "SetSelfLoc",
    LocOffset = r0_0.RT_949,
    TargetCenterLoc = "SavedLoc",
  },
}
r6_0.TaskId = 900616
r4_0[900616] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 900602,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 900617
r4_0[900617] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 900602,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 900618
r4_0[900618] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 900603,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 900619
r4_0[900619] = r6_0
r4_0[900620] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Mon_Cylinder_230_200_180",
  TaskEffects = {
    [1] = r0_0.RT_680,
    [2] = r0_0.RT_661,
    [3] = r0_0.RT_39,
    [4] = r0_0.RT_1314,
  },
  TaskId = 900620,
}
r4_0[900701] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_1316,
  TaskId = 900701,
}
r4_0[900702] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_1319,
  TaskId = 900702,
}
r4_0[900703] = {
  TaskEffects = r0_0.RT_1321,
  TaskId = 900703,
}
r4_0[900704] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_1316,
  TaskId = 900704,
}
r4_0[900705] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_1319,
  TaskId = 900705,
}
r4_0[900706] = {
  TaskEffects = r0_0.RT_1321,
  TaskId = 900706,
}
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 900702,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 900707
r4_0[900707] = r6_0
r6_0 = {
  TargetFilter = "Mon_Sphere_100_360",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_779,
  [2] = {
    FXId = 900704,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 900708
r4_0[900708] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_230_200_180",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_660,
  [2] = r0_0.RT_661,
  [3] = r0_0.RT_10,
  [4] = {
    Function = "PlaySE",
    SEId = 900704,
  },
}
r6_0.TaskId = 900709
r4_0[900709] = r6_0
r4_0[950001] = {
  NotifyName = r0_0.RT_2,
  TaskEffects = {
    [1] = r0_0.RT_1322,
    [2] = r0_0.RT_1322,
    [3] = r0_0.RT_1322,
    [4] = r0_0.RT_1322,
    [5] = r0_0.RT_1322,
  },
  TaskId = 950001,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "SpawnDrop",
    UnitId = 1051,
    UnitType = "Drop",
  },
}
r6_0.TaskId = 950002
r4_0[950002] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 950001,
    Function = "AddBuff",
    LastTime = 20,
  },
}
r6_0.TaskId = 950003
r4_0[950003] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_737,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 950001,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_420,
  },
  [2] = {
    CreatureId = 950002,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_420,
  },
  [3] = r0_0.RT_1322,
}
r6_0.TaskId = 950004
r4_0[950004] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "head",
    CreatureId = 950006,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 950005
r4_0[950005] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "SpawnDrop",
    UnitId = 1052,
    UnitType = "Drop",
  },
}
r6_0.TaskId = 950006
r4_0[950006] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "SpawnDrop",
    UnitId = 1053,
    UnitType = "Drop",
  },
}
r6_0.TaskId = 950007
r4_0[950007] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "SpawnDrop",
    UnitId = 1005,
    UnitType = "Drop",
  },
}
r6_0.TaskId = 950008
r4_0[950008] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "SpawnDrop",
    UnitId = 1016,
    UnitType = "Drop",
  },
}
r6_0.TaskId = 950009
r4_0[950009] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 950005,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_420,
  },
}
r6_0.TaskId = 950010
r4_0[950010] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 950007,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_420,
  },
}
r6_0.TaskId = 950011
r4_0[950011] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 950008,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_420,
  },
}
r6_0.TaskId = 950012
r4_0[950012] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 950009,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_420,
  },
}
r6_0.TaskId = 950013
r4_0[950013] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "SpawnDrop",
    UnitId = 51030,
    UnitType = "Drop",
  },
  [2] = {
    Function = "SpawnDrop",
    UnitId = 51031,
    UnitType = "Drop",
  },
  [3] = {
    Function = "SpawnDrop",
    UnitId = 51032,
    UnitType = "Drop",
  },
  [4] = {
    Function = "SpawnDrop",
    UnitId = 51033,
    UnitType = "Drop",
  },
  [5] = {
    Function = "SpawnDrop",
    UnitId = 51034,
    UnitType = "Drop",
  },
}
r6_0.TaskId = 950014
r4_0[950014] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "SpawnDrop",
    UnitId = 51035,
    UnitType = "Drop",
  },
  [2] = {
    Function = "SpawnDrop",
    UnitId = 51036,
    UnitType = "Drop",
  },
  [3] = {
    Function = "SpawnDrop",
    UnitId = 51037,
    UnitType = "Drop",
  },
  [4] = {
    Function = "SpawnDrop",
    UnitId = 51038,
    UnitType = "Drop",
  },
  [5] = {
    Function = "SpawnDrop",
    UnitId = 51039,
    UnitType = "Drop",
  },
}
r6_0.TaskId = 950015
r4_0[950015] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "SpawnDrop",
    UnitId = 51040,
    UnitType = "Drop",
  },
  [2] = {
    Function = "SpawnDrop",
    UnitId = 51041,
    UnitType = "Drop",
  },
  [3] = {
    Function = "SpawnDrop",
    UnitId = 51042,
    UnitType = "Drop",
  },
  [4] = {
    Function = "SpawnDrop",
    UnitId = 51043,
    UnitType = "Drop",
  },
  [5] = {
    Function = "SpawnDrop",
    UnitId = 51044,
    UnitType = "Drop",
  },
}
r6_0.TaskId = 950016
r4_0[950016] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "SpawnDrop",
    UnitId = 4901,
    UnitType = "Drop",
  },
}
r6_0.TaskId = 950017
r4_0[950017] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 950010,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_420,
  },
}
r6_0.TaskId = 950018
r4_0[950018] = r6_0
r4_0[950019] = {
  NotifyName = r0_0.RT_2,
  TaskEffects = {
    [1] = r0_0.RT_1323,
    [2] = r0_0.RT_1323,
    [3] = r0_0.RT_1323,
  },
  TaskId = 950019,
}
r6_0 = {
  TargetFilter = "Mon_Sphere_300_360",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1299,
  [2] = {
    FXId = 950005,
    Function = "PlayFX",
    Overlap = true,
  },
}
r6_0.TaskId = 950020
r4_0[950020] = r6_0
r4_0[950021] = {
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_518,
  },
  TaskId = 950021,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "SpawnDrop",
    UnitId = 3014,
    UnitType = "Drop",
  },
}
r6_0.TaskId = 950022
r4_0[950022] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 950002,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 950023
r4_0[950023] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 950002,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 950024
r4_0[950024] = r6_0
r4_0[950025] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_749,
  TaskId = 950025,
}
r4_0[950101] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_150_200_180",
  TaskEffects = r0_0.RT_1325,
  TaskId = 950101,
}
r4_0[950102] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_150_200_180",
  TaskEffects = r0_0.RT_1325,
  TaskId = 950102,
}
r4_0[950103] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Mon_Cylinder_150_200_180",
  TaskEffects = r0_0.RT_1325,
  TaskId = 950103,
}
r6_0 = {
  NotifyName = r0_0.RT_1099,
  TargetFilter = "Mon_Cylinder_150_200_180",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_3,
  [2] = {
    CauseHit = "LightHit_80",
    Function = "CutToughness",
    Value = 100,
  },
  [3] = r0_0.RT_4,
  [4] = r0_0.RT_1324,
}
r6_0.TaskId = 950104
r4_0[950104] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "upperarm_r",
    CreatureId = 950101,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 950105
r4_0[950105] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_779,
  [2] = r0_0.RT_10,
  [3] = {
    FXId = 950102,
    Function = "PlayFX",
    Overlap = true,
  },
  [4] = {
    Function = "PlaySE",
    SEId = 950101,
  },
}
r6_0.TaskId = 950106
r4_0[950106] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    FXId = 950102,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
}
r6_0.TaskId = 950107
r4_0[950107] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 950102,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 950108
r4_0[950108] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 950102,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 950109
r4_0[950109] = r6_0
r4_0[950110] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_749,
  TaskId = 950110,
}
r5_0 = 950401
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 950401,
  Function = "CreateSkillCreature",
  Rotation = {
    20,
    0,
    0
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 950401
r4_0[r5_0] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_33,
  [2] = {
    FXId = 950401,
    Function = "PlayFX",
    Overlap = true,
  },
  [3] = {
    Function = "PlaySE",
    SEId = 950402,
  },
}
r6_0.TaskId = 950402
r4_0[950402] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 950401,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
  [2] = {
    Function = "PlaySE",
    SEId = 950402,
    SceneSe = true,
  },
}
r6_0.TaskId = 950403
r4_0[950403] = r6_0
r5_0 = 950404
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 950401,
  Function = "CreateSkillCreature",
  Rotation = {
    -15,
    -15,
    0
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 950404
r4_0[r5_0] = r6_0
r4_0[950405] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "NEWuyou_Skill02Burst1",
  TaskEffects = r0_0.RT_1327,
  TaskId = 950405,
}
r4_0[950406] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "NEWuyou_Skill02Burst2",
  TaskEffects = r0_0.RT_1327,
  TaskId = 950406,
}
r4_0[950407] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "NEWuyou_Skill02Burst3",
  TaskEffects = r0_0.RT_1327,
  TaskId = 950407,
}
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 950401,
    Function = "CreateSkillCreature",
    Rotation = r0_0.RT_420,
  },
}
r6_0.TaskId = 950408
r4_0[950408] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_230_200_180",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_22,
  [2] = r0_0.RT_1328,
  [3] = {
    FXId = 950501,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 950501
r4_0[950501] = r6_0
r4_0[950502] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Sphere_300_360",
  TaskEffects = {
    [1] = r0_0.RT_774,
    [2] = r0_0.RT_1326,
  },
  TaskId = 950502,
}
r4_0[950601] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_400_200_180",
  TaskEffects = {
    [1] = r0_0.RT_14,
    [2] = r0_0.RT_1328,
  },
  TaskId = 950601,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Sphere_600_360_180",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_3,
  [2] = {
    CauseHit = "HitFly_XY200Z300_F",
    Function = "CutToughness",
    Value = 1,
  },
}
r6_0.TaskId = 950602
r4_0[950602] = r6_0
r4_0[950701] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_150_200_180",
  TaskEffects = r0_0.RT_1330,
  TaskId = 950701,
}
r4_0[950702] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_150_200_180",
  TaskEffects = r0_0.RT_1330,
  TaskId = 950702,
}
r4_0[980101] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_230_200_180",
  TaskEffects = {
    [1] = r0_0.RT_660,
    [2] = r0_0.RT_1331,
  },
  TaskId = 980101,
}
r4_0[980102] = {
  NotifyName = r0_0.RT_523,
  TargetFilter = "Mon_Cylinder_230_200_180",
  TaskEffects = {
    [1] = r0_0.RT_16,
    [2] = r0_0.RT_1331,
  },
  TaskId = 980102,
}
r4_0[980103] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Mon_Cylinder_230_200_180",
  TaskEffects = r0_0.RT_1332,
  TaskId = 980103,
}
r4_0[980104] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_300_200_180",
  TaskEffects = {
    [1] = r0_0.RT_660,
    [2] = r0_0.RT_10,
    [3] = r0_0.RT_1331,
  },
  TaskId = 980104,
}
r4_0[980105] = {
  NotifyName = r0_0.RT_523,
  TargetFilter = "Mon_Cylinder_300_200_180",
  TaskEffects = {
    [1] = r0_0.RT_16,
    [2] = r0_0.RT_1127,
    [3] = r0_0.RT_1331,
  },
  TaskId = 980105,
}
r4_0[980106] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Mon_Cylinder_300_200_180",
  TaskEffects = r0_0.RT_1332,
  TaskId = 980106,
}
r4_0[980107] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_772,
  TaskId = 980107,
}
r4_0[980108] = {
  TargetFilter = "Mon_Sphere_400_360_Fr",
  TaskEffects = {
    [1] = r0_0.RT_688,
    [2] = r0_0.RT_621,
    [3] = r0_0.RT_686,
  },
  TaskId = 980108,
}
r4_0[980109] = {
  TargetFilter = "Mon_Sphere_400_360",
  TaskEffects = {
    [1] = r0_0.RT_496,
    [2] = r0_0.RT_10,
    [3] = r0_0.RT_686,
  },
  TaskId = 980109,
}
r4_0[980201] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_230_300_90",
  TaskEffects = r0_0.RT_1334,
  TaskId = 980201,
}
r4_0[980202] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_230_200_180",
  TaskEffects = r0_0.RT_1335,
  TaskId = 980202,
}
r4_0[980203] = {
  NotifyName = r0_0.RT_523,
  TargetFilter = "Mon_Cylinder_300_200_180",
  TaskEffects = r0_0.RT_1335,
  TaskId = 980203,
}
r4_0[980204] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Rectangle_80_200_100",
  TaskEffects = r0_0.RT_1334,
  TaskId = 980204,
}
r4_0[980301] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_150_50_90",
  TaskEffects = {
    [1] = r0_0.RT_660,
    [2] = r0_0.RT_1336,
  },
  TaskId = 980301,
}
r4_0[980302] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_150_50_90",
  TaskEffects = {
    [1] = r0_0.RT_16,
    [2] = r0_0.RT_1336,
  },
  TaskId = 980302,
}
r4_0[980303] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_150_50_90",
  TaskEffects = {
    [1] = r0_0.RT_660,
    [2] = r0_0.RT_10,
    [3] = r0_0.RT_1336,
  },
  TaskId = 980303,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 980301,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 980304
r4_0[980304] = r6_0
r4_0[980305] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_16,
    [2] = r0_0.RT_10,
    [3] = r0_0.RT_1336,
  },
  TaskId = 980305,
}
r4_0[980306] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Mon_Cylinder_150_50_90",
  TaskEffects = {
    [1] = r0_0.RT_7,
    [2] = r0_0.RT_1127,
    [3] = r0_0.RT_1336,
  },
  TaskId = 980306,
}
r4_0[980401] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_1338,
  TaskId = 980401,
}
r4_0[980501] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_1338,
  TaskId = 980501,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 980701,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 980701
r4_0[980701] = r6_0
r4_0[980702] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_3,
    [2] = r0_0.RT_685,
  },
  TaskId = 980702,
}
r4_0[1000101] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_200_200_180",
  TaskEffects = r0_0.RT_6,
  TaskId = 1000101,
}
r4_0[1000102] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_200_200_180",
  TaskEffects = r0_0.RT_6,
  TaskId = 1000102,
}
r4_0[1000103] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_300_200_180",
  TaskEffects = r0_0.RT_8,
  TaskId = 1000103,
}
r4_0[1000104] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Mon_Cylinder_300_200_180_180",
  TaskEffects = r0_0.RT_11,
  TaskId = 1000104,
}
r4_0[1000105] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Mon_Cylinder_300_200_180",
  TaskEffects = r0_0.RT_11,
  TaskId = 1000105,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 1000101,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 1000106
r4_0[1000106] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 1000101,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 1000107
r4_0[1000107] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 1000102,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 1000108
r4_0[1000108] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 1000102,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 1000109
r4_0[1000109] = r6_0
r4_0[1000110] = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "Mon_Cylinder_300_200_360",
  TaskEffects = r0_0.RT_15,
  TaskId = 1000110,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 1000501,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 1000111
r4_0[1000111] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 1000501,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 1000112
r4_0[1000112] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 1000502,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 1000113
r4_0[1000113] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 1000502,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 1000114
r4_0[1000114] = r6_0
r4_0[1000201] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_250_200_120",
  TaskEffects = r0_0.RT_15,
  TaskId = 1000201,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "SaveLoc",
    IsOnGround = true,
    Tag = "Loc1",
    TargetType = "Target",
  },
}
r6_0.TaskId = 1000202
r4_0[1000202] = r6_0
r5_0 = 1000203
r6_0 = {
  TargetFilter = "Self",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 1000202,
  Function = "CreateSkillCreature",
  Location = {
    0,
    100,
    0
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 1000203
r4_0[r5_0] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 1000202,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 1000204
r4_0[1000204] = r6_0
r4_0[1000205] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Mon_Cylinder_250_400_180",
  TaskEffects = {
    [1] = r0_0.RT_16,
    [2] = r0_0.RT_4,
    [3] = r0_0.RT_17,
    [4] = r0_0.RT_5,
  },
  TaskId = 1000205,
}
r4_0[1000206] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_300_200_360_Tianwei",
  TaskEffects = {
    [1] = r0_0.RT_16,
    [2] = r0_0.RT_4,
    [3] = r0_0.RT_10,
    [4] = r0_0.RT_5,
  },
  TaskId = 1000206,
}
r4_0[1000207] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Mon_Sphere_500_360_Tianwei",
  TaskEffects = {
    [1] = r0_0.RT_16,
    [2] = r0_0.RT_4,
    [3] = r0_0.RT_18,
    [4] = r0_0.RT_5,
  },
  TaskId = 1000207,
}
r4_0[1000208] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_20,
  TaskId = 1000208,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 1000201,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_21,
    SetSavelocAsTarget = "",
  },
}
r6_0.TaskId = 1000209
r4_0[1000209] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_14,
  [2] = r0_0.RT_10,
  [3] = {
    FXId = 600008,
    Function = "PlayFX",
    Overlap = true,
  },
}
r6_0.TaskId = 1000210
r4_0[1000210] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 600008,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
}
r6_0.TaskId = 1000211
r4_0[1000211] = r6_0
r4_0[1000212] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Sphere_500_360",
  TaskEffects = {
    [1] = r0_0.RT_22,
    [2] = r0_0.RT_18,
  },
  TaskId = 1000212,
}
r4_0[1000213] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_16,
    [2] = r0_0.RT_4,
    [3] = r0_0.RT_10,
  },
  TaskId = 1000213,
}
r4_0[1000301] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossBianA_Attack01_1",
  TaskEffects = r0_0.RT_25,
  TaskId = 1000301,
}
r4_0[1000302] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_20,
  TaskId = 1000302,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossBianA_Skill01_1",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_23,
  [2] = r0_0.RT_10,
  [3] = {
    Function = "PlaySE",
    SEId = 10003002,
  },
}
r6_0.TaskId = 1000303
r4_0[1000303] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 1000301,
    Function = "CreateSkillCreature",
  },
  [2] = {
    CreatureId = 1000302,
    Function = "CreateSkillCreature",
  },
  [3] = {
    CreatureId = 1000303,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 1000304
r4_0[1000304] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_3,
  [2] = {
    FXId = 1000302,
    Function = "PlayFX",
  },
  [3] = {
    Function = "PlaySE",
    SEId = 10003003,
  },
}
r6_0.TaskId = 1000305
r4_0[1000305] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    FXId = 1000302,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
}
r6_0.TaskId = 1000306
r4_0[1000306] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossBianA_Skill03_1",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_7,
  [2] = r0_0.RT_10,
  [3] = r0_0.RT_26,
  [4] = {
    Function = "PlaySE",
    SEId = 10003005,
  },
}
r6_0.TaskId = 1000307
r4_0[1000307] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "EffectFunction",
    FunctionName = "Mon_AnimHeiBiAn_Skill03Blade",
  },
  [2] = {
    CreatureId = 1000304,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "Target1",
    UseSaveLoc = "BornBlade",
  },
  [3] = {
    CreatureId = 1000304,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "Target2",
    UseSaveLoc = "BornBlade",
  },
  [4] = {
    CreatureId = 1000304,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "Target3",
    UseSaveLoc = "BornBlade",
  },
}
r6_0.TaskId = 1000308
r4_0[1000308] = r6_0
r4_0[1000309] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Mon_Cylinder_600_200_360",
  TaskEffects = r0_0.RT_28,
  TaskId = 1000309,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossBiAn_Corp_Rectangle",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_22,
  [2] = r0_0.RT_18,
  [3] = r0_0.RT_26,
  [4] = {
    Function = "PlaySE",
    SEId = 10003007,
  },
}
r6_0.TaskId = 1000310
r4_0[1000310] = r6_0
r4_0[1000311] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossBiAn_Corp_Cylinder",
  TaskEffects = r0_0.RT_28,
  TaskId = 1000311,
}
r4_0[1000312] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_30,
  TaskId = 1000312,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 1000304,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 1000313
r4_0[1000313] = r6_0
r4_0[1000314] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossBianA_Attack01_2",
  TaskEffects = r0_0.RT_25,
  TaskId = 1000314,
}
r4_0[1000315] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Mon_Sphere_400_360",
  TaskEffects = {
    [1] = r0_0.RT_23,
    [2] = r0_0.RT_18,
    [3] = r0_0.RT_24,
  },
  TaskId = 1000315,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 1000401,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_31,
  },
}
r6_0.TaskId = 1000401
r4_0[1000401] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_23,
  [2] = r0_0.RT_32,
  [3] = {
    Function = "PlaySE",
    SEId = 10004001,
  },
}
r6_0.TaskId = 1000402
r4_0[1000402] = r6_0
r4_0[1000403] = {
  TaskEffects = {
    [1] = r0_0.RT_32,
  },
  TaskId = 1000403,
}
r5_0 = 1000404
r6_0 = {
  TargetFilter = "Self",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 1000402,
  Function = "CreateSkillCreature",
  Location = {
    0,
    130,
    150
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 1000404
r4_0[r5_0] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 1000402,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 1000405
r4_0[1000405] = r6_0
r6_0 = {
  TargetFilter = "Mon_Sphere_50_360",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_33,
  [2] = {
    FXId = 1000403,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
  [3] = {
    Function = "PlaySE",
    SEId = 10004002,
  },
}
r6_0.TaskId = 1000406
r4_0[1000406] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 1000403,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Skill02_Blade1",
  },
  [2] = {
    CreatureId = 1000403,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Skill02_Blade2",
  },
}
r6_0.TaskId = 1000408
r4_0[1000408] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_23,
  [2] = r0_0.RT_10,
  [3] = r0_0.RT_34,
  [4] = {
    Function = "PlaySE",
    SEId = 10004004,
  },
}
r6_0.TaskId = 1000409
r4_0[1000409] = r6_0
r4_0[1000410] = {
  TaskEffects = {
    [1] = r0_0.RT_34,
  },
  TaskId = 1000410,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 1000404,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Skill02_Blade1",
  },
  [2] = {
    CreatureId = 1000404,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Skill02_Blade2",
  },
}
r6_0.TaskId = 1000411
r4_0[1000411] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_19,
  [2] = {
    CreatureId = 1000405,
    Function = "CreateSkillCreature",
    UseSaveLoc = "",
  },
}
r6_0.TaskId = 1000412
r4_0[1000412] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_7,
  [2] = r0_0.RT_35,
  [3] = {
    FXId = 1000402,
    Function = "PlayFX",
  },
  [4] = {
    Function = "PlaySE",
    SEId = 10004007,
  },
}
r6_0.TaskId = 1000413
r4_0[1000413] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossBiAn_Corp_Rectangle",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_22,
  [2] = r0_0.RT_18,
  [3] = r0_0.RT_26,
  [4] = {
    Function = "PlaySE",
    SEId = 10004008,
  },
}
r6_0.TaskId = 1000414
r4_0[1000414] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossBiAn_Corp_Cylinder",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_7,
  [2] = r0_0.RT_18,
  [3] = r0_0.RT_26,
  [4] = {
    Function = "PlaySE",
    SEId = 10004009,
  },
}
r6_0.TaskId = 1000415
r4_0[1000415] = r6_0
r4_0[1000416] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_30,
  TaskId = 1000416,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 1000406,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_36,
  },
}
r6_0.TaskId = 1000417
r4_0[1000417] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 1000406,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 1000418
r4_0[1000418] = r6_0
r5_0 = 1010111
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small240",
}
r7_0 = "TaskEffects"
r8_0 = {
  [1] = r0_0.RT_46,
}
r8_0[2] = {
  Function = "PlayFX",
  FxRotator = {
    210,
    90,
    0
  },
  IsFaceToChar = true,
  MaxHitFXNum = 3,
  WeaponFXGroupName = "Hit",
}
r8_0[3] = r0_0.RT_47
r8_0[4] = r0_0.RT_48
r8_0[5] = r0_0.RT_49
r6_0[r7_0] = r8_0
r6_0.TaskId = 1010111
r4_0[r5_0] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small180",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_50,
  [2] = {
    Delay = 0.1,
    Function = "PlayFX",
    FxRotator = r0_0.RT_51,
    IsFaceToChar = true,
    MaxHitFXNum = 3,
    WeaponFXGroupName = "Hit",
  },
  [3] = {
    CauseHit = "HitFly_XY400Z400_F",
    Delay = 0.1,
    Function = "CutToughness",
    Value = 30,
  },
  [4] = r0_0.RT_52,
  [5] = r0_0.RT_49,
}
r6_0.TaskId = 1010112
r4_0[1010112] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_53,
  [2] = {
    Delay = 0.05,
    Function = "PlayFX",
    FxRotator = r0_0.RT_54,
    IsFaceToChar = true,
    MaxHitFXNum = 3,
    WeaponFXGroupName = "Hit",
  },
  [3] = r0_0.RT_55,
  [4] = r0_0.RT_49,
}
r6_0.TaskId = 1010113
r4_0[1010113] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_56,
  [2] = {
    Delay = 0.05,
    Function = "PlayFX",
    FxRotator = r0_0.RT_57,
    IsFaceToChar = true,
    MaxHitFXNum = 3,
    WeaponFXGroupName = "Hit",
  },
  [3] = {
    CauseHit = "HitFly_XY400Z500_F",
    Function = "CutToughness",
    Value = 50,
  },
  [4] = r0_0.RT_58,
  [5] = r0_0.RT_59,
}
r6_0.TaskId = 1010114
r4_0[1010114] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_9,
  TargetFilter = "Char_Cylinder_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_53,
  [2] = {
    Delay = 0.05,
    Function = "PlayFX",
    FxRotator = r0_0.RT_60,
    IsFaceToChar = true,
    MaxHitFXNum = 3,
    WeaponFXGroupName = "Hit",
  },
  [3] = r0_0.RT_55,
  [4] = r0_0.RT_49,
}
r6_0.TaskId = 1010115
r4_0[1010115] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle180",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    DamageTag = r0_0.RT_61,
    Function = "Damage",
    Rate = 1.13,
  },
  [2] = r0_0.RT_62,
  [3] = r0_0.RT_63,
  [4] = r0_0.RT_64,
  [5] = r0_0.RT_65,
  [6] = r0_0.RT_59,
}
r6_0.TaskId = 1010121
r4_0[1010121] = r6_0
r4_0[1010131] = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_68,
  TaskId = 1010131,
}
r4_0[1010132] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle",
  TaskEffects = r0_0.RT_73,
  TaskId = 1010132,
}
r4_0[1010141] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
  TaskEffects = {
    [1] = r0_0.RT_75,
    [2] = r0_0.RT_77,
    [3] = r0_0.RT_78,
    [4] = r0_0.RT_79,
    [5] = r0_0.RT_49,
  },
  TaskId = 1010141,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "UpdateSupportSkillCd",
    ModifyValue = "#1",
  },
}
r6_0.TaskId = 1010155
r4_0[1010155] = r6_0
r5_0 = 1010211
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small240",
}
r7_0 = "TaskEffects"
r8_0 = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_45,
    Function = "Damage",
    Rate = 0.65,
  },
}
r8_0[2] = {
  Function = "PlayFX",
  FxRotator = {
    -30,
    90,
    0
  },
  IsFaceToChar = true,
  MaxHitFXNum = 3,
  WeaponFXGroupName = "Hit",
}
r8_0[3] = r0_0.RT_85
r8_0[4] = r0_0.RT_65
r8_0[5] = r0_0.RT_49
r6_0[r7_0] = r8_0
r6_0.TaskId = 1010211
r4_0[r5_0] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small180",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_86,
  [2] = {
    Delay = 0.1,
    Function = "PlayFX",
    FxRotator = r0_0.RT_87,
    IsFaceToChar = true,
    MaxHitFXNum = 3,
    WeaponFXGroupName = "Hit",
  },
  [3] = r0_0.RT_88,
  [4] = r0_0.RT_65,
  [5] = r0_0.RT_49,
}
r6_0.TaskId = 1010212
r4_0[1010212] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Rectangle_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_89,
  [2] = r0_0.RT_90,
  [3] = {
    CauseHit = "LightHit_100_F",
    Delay = 0.05,
    Function = "CutToughness",
    Value = 25,
  },
  [4] = r0_0.RT_49,
}
r6_0.TaskId = 1010213
r4_0[1010213] = r6_0
r5_0 = 1010214
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle240",
}
r7_0 = "TaskEffects"
r8_0 = {
  [1] = r0_0.RT_91,
}
r8_0[2] = {
  Delay = 0.05,
  Function = "PlayFX",
  FxRotator = {
    190,
    90,
    0
  },
  IsFaceToChar = true,
  MaxHitFXNum = 3,
  WeaponFXGroupName = "Hit",
}
r8_0[3] = r0_0.RT_92
r8_0[4] = r0_0.RT_79
r8_0[5] = r0_0.RT_59
r6_0[r7_0] = r8_0
r6_0.TaskId = 1010214
r4_0[r5_0] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle240",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_61,
    Function = "Damage",
    Rate = 2.28,
  },
  [2] = {
    Function = "PlayFX",
    FxRotator = r0_0.RT_87,
    IsFaceToChar = true,
    WeaponFXGroupName = "Hit",
  },
  [3] = r0_0.RT_64,
  [4] = r0_0.RT_79,
  [5] = r0_0.RT_59,
}
r6_0.TaskId = 1010221
r4_0[1010221] = r6_0
r6_0 = {
  TargetFilter = "AlmostAllOtFr",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 10102,
    Function = "AddBuff",
    LastTime = "#1",
  },
}
r6_0.TaskId = 1010299
r4_0[1010299] = r6_0
r5_0 = 1010321
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Target",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 1010301,
  Function = "CreateSkillCreature",
  Rotation = {
    -35,
    0,
    0
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 1010321
r4_0[r5_0] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_61,
    Function = "Damage",
    Rate = 0.5,
  },
  [2] = r0_0.RT_63,
  [3] = {
    CauseHit = "HitFly_XY0Z500",
    Function = "CutToughness",
    Value = 40,
  },
  [4] = r0_0.RT_59,
}
r6_0.TaskId = 1010322
r4_0[1010322] = r6_0
r4_0[1020001] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_128,
  TaskId = 1020001,
}
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_45,
    Function = "Damage",
    Rate = 0.35,
  },
  [2] = r0_0.RT_90,
  [3] = r0_0.RT_129,
  [4] = r0_0.RT_130,
  [5] = r0_0.RT_59,
}
r6_0.TaskId = 1020111
r4_0[1020111] = r6_0
r4_0[1020112] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
  TaskEffects = {
    [1] = r0_0.RT_131,
    [2] = r0_0.RT_90,
    [3] = r0_0.RT_132,
    [4] = r0_0.RT_49,
  },
  TaskId = 1020112,
}
r4_0[1020113] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
  TaskEffects = {
    [1] = r0_0.RT_50,
    [2] = r0_0.RT_90,
    [3] = r0_0.RT_133,
    [4] = r0_0.RT_59,
  },
  TaskId = 1020113,
}
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_53,
  [2] = r0_0.RT_90,
  [3] = {
    CauseHit = "HitFly_XY400Z300_F",
    Function = "CutToughness",
    Value = 25,
  },
  [4] = r0_0.RT_65,
  [5] = r0_0.RT_49,
}
r6_0.TaskId = 1020114
r4_0[1020114] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_45,
    Function = "Damage",
    Rate = 0.75,
  },
  [2] = r0_0.RT_90,
  [3] = {
    CauseHit = "HitFly_XY600Z400_F",
    Function = "CutToughness",
    Value = 50,
  },
  [4] = r0_0.RT_65,
  [5] = r0_0.RT_59,
}
r6_0.TaskId = 1020115
r4_0[1020115] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  NotifyName = r0_0.RT_2,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 1020101,
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_62,
}
r6_0.TaskId = 1020121
r4_0[1020121] = r6_0
r4_0[1020122] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Small",
  TaskEffects = r0_0.RT_137,
  TaskId = 1020122,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 1020121,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 1020123
r4_0[1020123] = r6_0
r4_0[1020124] = {
  HatredIncrement = 40,
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_137,
  TaskId = 1020124,
}
r4_0[1020131] = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_68,
  TaskId = 1020131,
}
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    DamageTag = r0_0.RT_69,
    Function = "Damage",
    Rate = 0.47,
  },
  [2] = r0_0.RT_63,
  [3] = {
    CauseHit = "HitFly_XY400Z600",
    Function = "CutToughness",
    Value = 30,
  },
  [4] = r0_0.RT_59,
  [5] = r0_0.RT_72,
}
r6_0.TaskId = 1020132
r4_0[1020132] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    DamageTag = r0_0.RT_74,
    Function = "Damage",
    Rate = 0.4,
  },
  [2] = r0_0.RT_77,
  [3] = {
    CauseHit = "HitFly_XY200Z300_F",
    Function = "CutToughness",
    Value = 26,
  },
  [4] = r0_0.RT_79,
  [5] = r0_0.RT_49,
}
r6_0.TaskId = 1020141
r4_0[1020141] = r6_0
r5_0 = 1020151
r6_0 = {
  TargetFilter = "Self",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 1020101,
  Function = "CallBackSkillCreature",
  IsFollowing = true,
  MinDistance = 300,
  TargetSocket = "Root",
  TargetSocketLocation = {
    0,
    450,
    100
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 1020151
r4_0[r5_0] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 1020121,
    Delay = 0.134,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 1020161
r4_0[1020161] = r6_0
r6_0 = {
  TargetFilter = "RootSource",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 1020121,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 1020162
r4_0[1020162] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_45,
    Function = "Damage",
    Rate = 1.1,
  },
  [2] = r0_0.RT_90,
  [3] = r0_0.RT_88,
  [4] = r0_0.RT_65,
  [5] = r0_0.RT_49,
}
r6_0.TaskId = 1020211
r4_0[1020211] = r6_0
r4_0[1020212] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
  TaskEffects = {
    [1] = r0_0.RT_91,
    [2] = r0_0.RT_90,
    [3] = r0_0.RT_88,
    [4] = r0_0.RT_65,
    [5] = r0_0.RT_49,
  },
  TaskId = 1020212,
}
r4_0[1020213] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle",
  TaskEffects = {
    [1] = r0_0.RT_50,
    [2] = r0_0.RT_90,
    [3] = r0_0.RT_138,
    [4] = r0_0.RT_49,
  },
  TaskId = 1020213,
}
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_9,
  TargetFilter = "Char_Cylinder_Middle180",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_45,
    Function = "Damage",
    Rate = 1.5,
  },
  [2] = r0_0.RT_90,
  [3] = {
    CauseHit = "HitFly_XY0Z300",
    Function = "CutToughness",
    Value = 40,
  },
  [4] = r0_0.RT_130,
  [5] = r0_0.RT_49,
}
r6_0.TaskId = 1020214
r4_0[1020214] = r6_0
r4_0[1020215] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
  TaskEffects = {
    [1] = r0_0.RT_139,
    [2] = r0_0.RT_90,
    [3] = r0_0.RT_132,
    [4] = r0_0.RT_65,
    [5] = r0_0.RT_49,
  },
  TaskId = 1020215,
}
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_9,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_45,
    Function = "Damage",
    Rate = 3.7,
  },
  [2] = r0_0.RT_90,
  [3] = {
    CauseHit = "HitFly_XY0Z500",
    Function = "CutToughness",
    Value = 150,
  },
  [4] = r0_0.RT_130,
  [5] = r0_0.RT_49,
}
r6_0.TaskId = 1020216
r4_0[1020216] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  NotifyName = r0_0.RT_2,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 1020201,
    Function = "CreateSkillCreature",
  },
  [2] = {
    CreatureId = 1020201,
    Function = "CreateSkillCreature",
    Rotation = r0_0.RT_140,
  },
  [3] = {
    CreatureId = 1020201,
    Function = "CreateSkillCreature",
    Rotation = r0_0.RT_141,
  },
  [4] = {
    CreatureId = 1020201,
    Function = "CreateSkillCreature",
    Rotation = r0_0.RT_142,
  },
  [5] = {
    CreatureId = 1020201,
    Function = "CreateSkillCreature",
    Rotation = r0_0.RT_143,
  },
  [6] = r0_0.RT_62,
}
r6_0.TaskId = 1020221
r4_0[1020221] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_61,
    Function = "Damage",
    Rate = 0.3,
  },
  [2] = r0_0.RT_144,
  [3] = {
    CauseHit = "HitFly_XY200Z300_F",
    Function = "CutToughness",
    Value = 10,
  },
  [4] = r0_0.RT_49,
  [5] = r0_0.RT_119,
}
r6_0.TaskId = 1020222
r4_0[1020222] = r6_0
r4_0[1020231] = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_68,
  TaskId = 1020231,
}
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_69,
    Function = "Damage",
    Rate = 0.47,
  },
  [2] = r0_0.RT_90,
  [3] = r0_0.RT_145,
  [4] = r0_0.RT_49,
  [5] = r0_0.RT_72,
  [6] = {
    CreatureId = 1020202,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_146,
  },
}
r6_0.TaskId = 1020232
r4_0[1020232] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Large",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_69,
    Function = "Damage",
    Rate = 0.63,
  },
  [2] = r0_0.RT_63,
  [3] = {
    CauseHit = "HitFly_XY600Z600",
    Function = "CutToughness",
    Value = 20,
  },
  [4] = r0_0.RT_49,
  [5] = r0_0.RT_72,
}
r6_0.TaskId = 1020233
r4_0[1020233] = r6_0
r4_0[1020234] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_149,
  TaskId = 1020234,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 1020321,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 1020321
r4_0[1020321] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 1020321,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 1020322
r4_0[1020322] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_61,
    Function = "Damage",
    Rate = 1.24,
  },
  [2] = r0_0.RT_144,
  [3] = {
    CauseHit = "HitFly_XY800Z400",
    Function = "CutToughness",
    Value = 40,
  },
  [4] = r0_0.RT_49,
}
r6_0.TaskId = 1020323
r4_0[1020323] = r6_0
r4_0[1030111] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small240",
  TaskEffects = {
    [1] = r0_0.RT_53,
    [2] = r0_0.RT_150,
    [3] = r0_0.RT_138,
    [4] = r0_0.RT_151,
    [5] = r0_0.RT_49,
  },
  TaskId = 1030111,
}
r4_0[1030112] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small180",
  TaskEffects = {
    [1] = r0_0.RT_46,
    [2] = r0_0.RT_152,
    [3] = r0_0.RT_153,
    [4] = r0_0.RT_151,
    [5] = r0_0.RT_49,
  },
  TaskId = 1030112,
}
r4_0[1030113] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small240",
  TaskEffects = {
    [1] = r0_0.RT_50,
    [2] = r0_0.RT_155,
    [3] = r0_0.RT_156,
    [4] = r0_0.RT_151,
    [5] = r0_0.RT_49,
  },
  TaskId = 1030113,
}
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_91,
  [2] = r0_0.RT_90,
  [3] = {
    CauseHit = "HitFly_XY600Z600",
    Function = "CutToughness",
    Value = 85,
  },
  [4] = r0_0.RT_151,
  [5] = r0_0.RT_59,
}
r6_0.TaskId = 1030114
r4_0[1030114] = r6_0
r4_0[1030121] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle",
  TaskEffects = {
    [1] = r0_0.RT_157,
    [2] = r0_0.RT_77,
    [3] = r0_0.RT_158,
    [4] = r0_0.RT_65,
    [5] = r0_0.RT_59,
  },
  TaskId = 1030121,
}
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_9,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    DamageTag = r0_0.RT_61,
    Function = "Damage",
    Rate = 0.5,
  },
  [2] = r0_0.RT_62,
  [3] = r0_0.RT_160,
  [4] = r0_0.RT_161,
  [5] = r0_0.RT_79,
  [6] = r0_0.RT_59,
}
r6_0.TaskId = 1030122
r4_0[1030122] = r6_0
r4_0[1030131] = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_68,
  TaskId = 1030131,
}
r4_0[1030132] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle",
  TaskEffects = r0_0.RT_73,
  TaskId = 1030132,
}
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    DamageTag = r0_0.RT_74,
    Function = "Damage",
    Rate = 0.73,
  },
  [2] = {
    Function = "PlayFX",
    FxRotator = r0_0.RT_162,
    IsFaceToChar = true,
    MaxHitFXNum = 3,
    WeaponFXGroupName = "Hit",
  },
  [3] = {
    CauseHit = "HitFly_XY200Z500_F",
    Function = "CutToughness",
    Value = 47,
  },
  [4] = r0_0.RT_79,
  [5] = r0_0.RT_49,
}
r6_0.TaskId = 1030141
r4_0[1030141] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    ComboCount = 120,
    Function = "HitCount",
  },
}
r6_0.TaskId = 1030152
r4_0[1030152] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_91,
  [2] = r0_0.RT_160,
  [3] = {
    CauseHit = "HitFly_XY400Z400_F",
    Function = "CutToughness",
    Value = 30,
  },
  [4] = r0_0.RT_151,
  [5] = r0_0.RT_49,
}
r6_0.TaskId = 1030211
r4_0[1030211] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_45,
    Function = "Damage",
    Rate = 0.7,
  },
  [2] = r0_0.RT_160,
  [3] = {
    CauseHit = "HitFly_XY200Z300_F",
    Function = "CutToughness",
    Value = 35,
  },
  [4] = r0_0.RT_151,
  [5] = r0_0.RT_49,
}
r6_0.TaskId = 1030212
r4_0[1030212] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  NotifyName = r0_0.RT_2,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 1030201,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_31,
  },
  [2] = {
    CreatureId = 1030202,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_31,
    Rotation = r0_0.RT_143,
  },
  [3] = {
    CreatureId = 1030202,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_31,
    Rotation = r0_0.RT_142,
  },
}
r6_0.TaskId = 1030213
r4_0[1030213] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_45,
    Function = "Damage",
    Rate = 1.8,
  },
  [2] = r0_0.RT_160,
  [3] = {
    CauseHit = "HitFly_XY400Z300_F",
    Function = "CutToughness",
    Value = 70,
  },
  [4] = r0_0.RT_151,
  [5] = r0_0.RT_49,
}
r6_0.TaskId = 1030214
r4_0[1030214] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_45,
    Function = "Damage",
    Rate = 1.42,
  },
  [2] = r0_0.RT_90,
  [3] = {
    CauseHit = "HitFly_XY200Z100",
    Function = "CutToughness",
    Value = 35,
  },
}
r6_0.TaskId = 1030218
r4_0[1030218] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "StartGrab",
    PassiveEffectId = 1030202,
  },
  [2] = {
    CreatureId = 1030221,
    Function = "CreateSkillCreature",
  },
  [3] = {
    CreatureId = 1030222,
    Function = "CreateSkillCreature",
  },
  [4] = {
    CreatureId = 1030223,
    Function = "CreateSkillCreature",
  },
  [5] = {
    CreatureId = 1030224,
    Function = "CreateSkillCreature",
  },
  [6] = {
    CreatureId = 1030225,
    Function = "CreateSkillCreature",
  },
  [7] = {
    ClientSkillLogicId = 1030202,
    Function = "ExecuteClientSkillLogicFunction",
    FunctionName = "SetCatchTrue",
  },
}
r6_0.TaskId = 1030221
r4_0[1030221] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "EndGrab",
    PassiveEffectId = 1030202,
  },
  [2] = r0_0.RT_163,
  [3] = {
    CreatureId = 1030222,
    Function = "RemoveSkillCreature",
  },
  [4] = {
    CreatureId = 1030223,
    Function = "RemoveSkillCreature",
  },
  [5] = {
    CreatureId = 1030224,
    Function = "RemoveSkillCreature",
  },
  [6] = {
    CreatureId = 1030225,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 1030222
r4_0[1030222] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_12,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_61,
    Function = "Damage",
    Rate = 2,
  },
  [2] = r0_0.RT_62,
  [3] = r0_0.RT_160,
  [4] = {
    CauseHit = "HitFly_XY800Z400",
    Function = "CutToughness",
    Value = 62,
  },
  [5] = r0_0.RT_163,
  [6] = {
    Function = "PlaySE",
    MeleeHitLevel = "heavy",
    SEId = 119,
  },
}
r6_0.TaskId = 1030224
r4_0[1030224] = r6_0
r5_0 = 1030225
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  BaseAttr = "ATK_Melee",
  DamageTag = {
    "Melee",
    "Weapon",
    "HeavyAttack",
    "Catch"
  },
  Function = "Damage",
  Rate = 0.55,
}
r8_0[2] = r0_0.RT_90
r8_0[3] = {
  CauseHit = "LightHit_80",
  Function = "CutToughness",
  Value = 20,
}
r8_0[4] = {
  Function = "PlaySE",
  MeleeHitLevel = "light",
  SEId = 119,
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 1030225
r4_0[r5_0] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_61,
    Function = "Damage",
    Rate = 0.55,
  },
  [2] = r0_0.RT_90,
  [3] = {
    CauseHit = "HitFly_XY800Z400",
    Function = "CutToughness",
    Value = 20,
  },
}
r6_0.TaskId = 1030226
r4_0[1030226] = r6_0
r4_0[1030311] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small240",
  TaskEffects = {
    [1] = r0_0.RT_53,
    [2] = r0_0.RT_150,
    [3] = r0_0.RT_164,
    [4] = r0_0.RT_151,
    [5] = r0_0.RT_49,
  },
  TaskId = 1030311,
}
r4_0[1030312] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small180",
  TaskEffects = {
    [1] = r0_0.RT_46,
    [2] = r0_0.RT_152,
    [3] = r0_0.RT_165,
    [4] = r0_0.RT_151,
    [5] = r0_0.RT_49,
  },
  TaskId = 1030312,
}
r4_0[1030313] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle240",
  TaskEffects = {
    [1] = r0_0.RT_50,
    [2] = r0_0.RT_155,
    [3] = r0_0.RT_166,
    [4] = r0_0.RT_151,
    [5] = r0_0.RT_49,
  },
  TaskId = 1030313,
}
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_91,
  [2] = r0_0.RT_90,
  [3] = {
    CauseHit = "HitFly_XY500Z300",
    Function = "CutToughness",
    Value = 85,
  },
  [4] = r0_0.RT_151,
  [5] = r0_0.RT_59,
}
r6_0.TaskId = 1030314
r4_0[1030314] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "Maxhp",
    DamageType = "TrueDamage",
    Function = "Heal",
    Rate = "#1",
  },
}
r6_0.TaskId = 1040001
r4_0[1040001] = r6_0
r4_0[1040111] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small240",
  TaskEffects = {
    [1] = r0_0.RT_167,
    [2] = r0_0.RT_90,
    [3] = r0_0.RT_132,
    [4] = r0_0.RT_168,
  },
  TaskId = 1040111,
}
r4_0[1040112] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small240",
  TaskEffects = {
    [1] = r0_0.RT_131,
    [2] = r0_0.RT_90,
    [3] = r0_0.RT_138,
    [4] = r0_0.RT_168,
  },
  TaskId = 1040112,
}
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Rectangle_Large",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_45,
    Function = "Damage",
    Rate = 0.38,
  },
  [2] = r0_0.RT_90,
  [3] = r0_0.RT_133,
  [4] = r0_0.RT_151,
  [5] = {
    FXId = 1040101,
    Function = "PlayFX",
    IsAttached = false,
    IsEffectCreature = true,
  },
  [6] = r0_0.RT_169,
}
r6_0.TaskId = 1040113
r4_0[1040113] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_45,
    Function = "Damage",
    Rate = 0.43,
  },
  [2] = r0_0.RT_90,
  [3] = r0_0.RT_166,
  [4] = r0_0.RT_169,
}
r6_0.TaskId = 1040114
r4_0[1040114] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    DamageTag = r0_0.RT_61,
    Function = "Damage",
    Rate = 0.2,
  },
  [2] = r0_0.RT_170,
  [3] = {
    CauseHit = "LightHit",
    Function = "CutToughness",
    Value = 12,
  },
  [4] = r0_0.RT_171,
}
r6_0.TaskId = 1040121
r4_0[1040121] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_9,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_157,
  [2] = r0_0.RT_62,
  [3] = r0_0.RT_172,
  [4] = {
    CauseHit = "HitFly_XY500Z300_F",
    Function = "CutToughness",
    Value = 40,
  },
  [5] = r0_0.RT_79,
  [6] = r0_0.RT_59,
}
r6_0.TaskId = 1040122
r4_0[1040122] = r6_0
r4_0[1040131] = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_68,
  TaskId = 1040131,
}
r4_0[1040132] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle",
  TaskEffects = {
    [1] = r0_0.RT_70,
    [2] = r0_0.RT_63,
    [3] = r0_0.RT_71,
    [4] = r0_0.RT_72,
    [5] = r0_0.RT_59,
  },
  TaskId = 1040132,
}
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    DamageTag = r0_0.RT_74,
    Function = "Damage",
    Rate = 0.36,
  },
  [2] = r0_0.RT_90,
  [3] = r0_0.RT_173,
  [4] = r0_0.RT_65,
  [5] = r0_0.RT_59,
}
r6_0.TaskId = 1040141
r4_0[1040141] = r6_0
r4_0[1040211] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small240",
  TaskEffects = {
    [1] = r0_0.RT_89,
    [2] = r0_0.RT_90,
    [3] = r0_0.RT_85,
    [4] = r0_0.RT_65,
    [5] = r0_0.RT_168,
  },
  TaskId = 1040211,
}
r4_0[1040212] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small240",
  TaskEffects = {
    [1] = r0_0.RT_91,
    [2] = r0_0.RT_90,
    [3] = r0_0.RT_133,
    [4] = r0_0.RT_65,
    [5] = r0_0.RT_168,
  },
  TaskId = 1040212,
}
r4_0[1040213] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
  TaskEffects = {
    [1] = r0_0.RT_89,
    [2] = r0_0.RT_90,
    [3] = r0_0.RT_85,
    [4] = r0_0.RT_168,
  },
  TaskId = 1040213,
}
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_56,
  [2] = r0_0.RT_90,
  [3] = {
    CauseHit = "HitFly_XY500Z300_F",
    Function = "CutToughness",
    Value = 25,
  },
  [4] = r0_0.RT_169,
}
r6_0.TaskId = 1040214
r4_0[1040214] = r6_0
r5_0 = 1040221
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Target",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 1040222,
  Function = "CreateSkillCreature",
  Location = {
    0,
    100,
    20
  },
  Rotation = r0_0.RT_174,
}
r8_0[2] = r0_0.RT_62
r6_0[r7_0] = r8_0
r6_0.TaskId = 1040221
r4_0[r5_0] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_61,
    Function = "Damage",
    Rate = 0.88,
  },
  [2] = r0_0.RT_90,
  [3] = {
    CauseHit = "HitFly_XY200Z300",
    Function = "CutToughness",
    Value = 28,
  },
  [4] = r0_0.RT_168,
  [5] = r0_0.RT_175,
}
r6_0.TaskId = 1040222
r4_0[1040222] = r6_0
r4_0[1040223] = {
  TargetFilter = "Char_Sphere_Small",
  TaskEffects = {
    [1] = r0_0.RT_175,
  },
  TaskId = 1040223,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 1040241,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 1040241
r4_0[1040241] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_74,
    Function = "Damage",
    Rate = 2.05,
  },
  [2] = r0_0.RT_90,
  [3] = {
    CauseHit = "HitFly_XY200Z300_F",
    Function = "CutToughness",
    Value = 66,
  },
  [4] = r0_0.RT_65,
  [5] = r0_0.RT_59,
}
r6_0.TaskId = 1040242
r4_0[1040242] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 1040241,
    Function = "RemoveCreature",
  },
}
r6_0.TaskId = 1040243
r4_0[1040243] = r6_0
r6_0 = {
  TargetFilter = "AlmostAllOtFr",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 10502,
    Function = "AddBuff",
    LastTime = "#1",
  },
}
r6_0.TaskId = 1050001
r4_0[1050001] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle240",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_53,
  [2] = {
    Function = "PlayFX",
    FxRotator = r0_0.RT_54,
    IsFaceToChar = true,
    MaxHitFXNum = 3,
    WeaponFXGroupName = "Hit",
  },
  [3] = r0_0.RT_88,
  [4] = r0_0.RT_48,
  [5] = r0_0.RT_49,
}
r6_0.TaskId = 1050111
r4_0[1050111] = r6_0
r5_0 = 1050112
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle240",
}
r7_0 = "TaskEffects"
r8_0 = {
  [1] = r0_0.RT_50,
}
r8_0[2] = {
  Function = "PlayFX",
  FxRotator = {
    -35,
    90,
    0
  },
  IsFaceToChar = true,
  MaxHitFXNum = 3,
  WeaponFXGroupName = "Hit",
}
r8_0[3] = r0_0.RT_177
r8_0[4] = r0_0.RT_52
r8_0[5] = r0_0.RT_49
r6_0[r7_0] = r8_0
r6_0.TaskId = 1050112
r4_0[r5_0] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_45,
    Function = "Damage",
    Rate = 0.6,
  },
  [2] = r0_0.RT_77,
  [3] = {
    CauseHit = "HitFly_XY400Z500_F",
    Function = "CutToughness",
    Value = 35,
  },
  [4] = r0_0.RT_49,
}
r6_0.TaskId = 1050113
r4_0[1050113] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_50,
  [2] = {
    Function = "PlayFX",
    FxRotator = r0_0.RT_178,
    IsFaceToChar = true,
    MaxHitFXNum = 3,
    WeaponFXGroupName = "Hit",
  },
  [3] = {
    CauseHit = "HitFly_XY500Z300_F",
    Function = "CutToughness",
    Value = 35,
  },
  [4] = r0_0.RT_58,
  [5] = r0_0.RT_59,
}
r6_0.TaskId = 1050114
r4_0[1050114] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 1050121,
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_62,
}
r6_0.TaskId = 1050121
r4_0[1050121] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  TargetFilter = "Char_Rectangle_Middle",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_61,
    Function = "Damage",
    Rate = 0.161,
  },
  [2] = r0_0.RT_90,
  [3] = r0_0.RT_173,
  [4] = r0_0.RT_65,
  [5] = r0_0.RT_59,
}
r6_0.TaskId = 1050122
r4_0[1050122] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Rectangle_Middle",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_61,
    Function = "Damage",
    Rate = 1,
  },
  [2] = r0_0.RT_38,
  [3] = r0_0.RT_165,
  [4] = r0_0.RT_65,
  [5] = r0_0.RT_59,
}
r6_0.TaskId = 1050123
r4_0[1050123] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Rectangle_Middle",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_61,
    Delay = 0.2,
    Function = "Damage",
    Rate = 1,
  },
  [2] = {
    Delay = 0.2,
    Function = "PlayFX",
    WeaponFXGroupName = "Hit1",
  },
  [3] = {
    CauseHit = "HitFly_XY0Z300",
    Delay = 0.2,
    Function = "CutToughness",
    Value = 15,
  },
  [4] = {
    Condition = 100,
    Delay = 0.2,
    Dilation = 0,
    Duration = 0.03,
    Function = "HitStop",
  },
  [5] = {
    Delay = 0.2,
    Function = "PlaySE",
    MeleeHitLevel = "Heavy",
    SEId = 104,
  },
}
r6_0.TaskId = 1050124
r4_0[1050124] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Rectangle_Middle",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_61,
    Delay = 0.4,
    Function = "Damage",
    Rate = 1,
  },
  [2] = {
    Delay = 0.4,
    Function = "PlayFX",
    WeaponFXGroupName = "Hit1",
  },
  [3] = {
    CauseHit = "HitFly_XY200Z100_B",
    Delay = 0.4,
    Function = "CutToughness",
    Value = 15,
  },
  [4] = {
    Condition = 100,
    Delay = 0.4,
    Dilation = 0,
    Duration = 0.03,
    Function = "HitStop",
  },
  [5] = {
    Delay = 0.4,
    Function = "PlaySE",
    MeleeHitLevel = "Heavy",
    SEId = 104,
  },
}
r6_0.TaskId = 1050125
r4_0[1050125] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Rectangle_Middle",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_61,
    Delay = 0.6,
    Function = "Damage",
    Rate = 1,
  },
  [2] = {
    Delay = 0.6,
    Function = "PlayFX",
    WeaponFXGroupName = "Hit1",
  },
  [3] = {
    CauseHit = "HitFly_XY200Z100_B",
    Delay = 0.6,
    Function = "CutToughness",
    Value = 15,
  },
  [4] = {
    Condition = 100,
    Delay = 0.6,
    Dilation = 0,
    Duration = 0.03,
    Function = "HitStop",
  },
  [5] = {
    Delay = 0.6,
    Function = "PlaySE",
    MeleeHitLevel = "Heavy",
    SEId = 104,
  },
}
r6_0.TaskId = 1050126
r4_0[1050126] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Rectangle_Middle",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_61,
    Delay = 0.8,
    Function = "Damage",
    Rate = 1,
  },
  [2] = {
    Delay = 0.8,
    Function = "PlayFX",
    WeaponFXGroupName = "Hit1",
  },
  [3] = {
    CauseHit = "HitFly_XY200Z100_B",
    Delay = 0.8,
    Function = "CutToughness",
    Value = 15,
  },
  [4] = {
    Condition = 100,
    Delay = 0.8,
    Dilation = 0,
    Duration = 0.03,
    Function = "HitStop",
  },
  [5] = {
    Delay = 0.8,
    Function = "PlaySE",
    MeleeHitLevel = "Heavy",
    SEId = 104,
  },
}
r6_0.TaskId = 1050127
r4_0[1050127] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Rectangle_Middle",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_61,
    Delay = 1,
    Function = "Damage",
    Rate = 1,
  },
  [2] = {
    Delay = 1,
    Function = "PlayFX",
    WeaponFXGroupName = "Hit1",
  },
  [3] = {
    CauseHit = "HitFly_XY200Z100_B",
    Delay = 1,
    Function = "CutToughness",
    Value = 15,
  },
  [4] = {
    Condition = 100,
    Delay = 1,
    Dilation = 0,
    Duration = 0.03,
    Function = "HitStop",
  },
  [5] = {
    Delay = 1,
    Function = "PlaySE",
    MeleeHitLevel = "Heavy",
    SEId = 104,
  },
}
r6_0.TaskId = 1050128
r4_0[1050128] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Rectangle_Middle",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_61,
    Delay = 1.2,
    Function = "Damage",
    Rate = 1,
  },
  [2] = {
    Delay = 1.2,
    Function = "ExecutePassiveFunction",
    FunctionName = "ClearComboCount",
    PassiveEffectId = 102,
  },
  [3] = {
    Delay = 1.2,
    Function = "PlayFX",
    WeaponFXGroupName = "Hit1",
  },
  [4] = {
    CauseHit = "HitFly_XY0Z300",
    Delay = 1.2,
    Function = "CutToughness",
    Value = 15,
  },
  [5] = {
    Condition = 100,
    Delay = 1.2,
    Dilation = 0,
    Duration = 0.03,
    Function = "HitStop",
  },
  [6] = {
    Delay = 1.2,
    Function = "PlaySE",
    MeleeHitLevel = "Heavy",
    SEId = 104,
  },
}
r6_0.TaskId = 1050129
r4_0[1050129] = r6_0
r4_0[1050131] = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_68,
  TaskId = 1050131,
}
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_69,
    Function = "Damage",
    Rate = 0.51,
  },
  [2] = r0_0.RT_90,
  [3] = r0_0.RT_71,
  [4] = r0_0.RT_59,
  [5] = r0_0.RT_72,
}
r6_0.TaskId = 1050132
r4_0[1050132] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_74,
    Function = "Damage",
    Rate = 0.51,
  },
  [2] = r0_0.RT_90,
  [3] = r0_0.RT_78,
  [4] = r0_0.RT_79,
  [5] = r0_0.RT_49,
}
r6_0.TaskId = 1050141
r4_0[1050141] = r6_0
r4_0[1060111] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small240",
  TaskEffects = {
    [1] = r0_0.RT_167,
    [2] = r0_0.RT_90,
    [3] = r0_0.RT_164,
    [4] = r0_0.RT_49,
  },
  TaskId = 1060111,
}
r4_0[1060112] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small240",
  TaskEffects = {
    [1] = r0_0.RT_139,
    [2] = r0_0.RT_90,
    [3] = r0_0.RT_85,
    [4] = r0_0.RT_49,
  },
  TaskId = 1060112,
}
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small240",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_53,
  [2] = r0_0.RT_90,
  [3] = {
    CauseHit = "LightHit_50_F",
    Function = "CutToughness",
    Value = 25,
  },
  [4] = r0_0.RT_49,
}
r6_0.TaskId = 1060113
r4_0[1060113] = r6_0
r5_0 = 1060114
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle180",
}
r7_0 = "TaskEffects"
r8_0 = {
  [1] = r0_0.RT_86,
}
r8_0[2] = {
  Function = "PlayFX",
  FxRotator = {
    165,
    90,
    0
  },
  IsFaceToChar = true,
  MaxHitFXNum = 3,
  WeaponFXGroupName = "Hit",
}
r8_0[3] = {
  CauseHit = "HitFly_XY200Z500_F",
  Function = "CutToughness",
  Value = 50,
}
r8_0[4] = r0_0.RT_65
r8_0[5] = r0_0.RT_59
r6_0[r7_0] = r8_0
r6_0.TaskId = 1060114
r4_0[r5_0] = r6_0
r4_0[1060115] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_9,
  TargetFilter = "Char_Cylinder_Small240",
  TaskEffects = {
    [1] = r0_0.RT_46,
    [2] = r0_0.RT_90,
    [3] = r0_0.RT_153,
    [4] = r0_0.RT_65,
    [5] = r0_0.RT_59,
  },
  TaskId = 1060115,
}
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 1060121,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_146,
  },
  [2] = r0_0.RT_62,
}
r6_0.TaskId = 1060120
r4_0[1060120] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Middle180",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_134,
  [2] = r0_0.RT_90,
  [3] = {
    CauseHit = "HitFly_XY200Z300_F",
    Delay = 0.05,
    Function = "CutToughness",
    Value = 8,
  },
  [4] = r0_0.RT_65,
  [5] = r0_0.RT_49,
  [6] = {
    FXId = 1010121,
    Function = "PlayFX",
    IsAttached = false,
  },
}
r6_0.TaskId = 1060121
r4_0[1060121] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Middle180",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_61,
    Delay = 0.045,
    Function = "Damage",
    Rate = 0.1,
  },
  [2] = {
    Delay = 0.045,
    Function = "PlayFX",
    MaxHitFXNum = 3,
    WeaponFXGroupName = "Hit1",
  },
  [3] = {
    CauseHit = "LightHit",
    Delay = 0.045,
    Function = "CutToughness",
    Value = 8,
  },
  [4] = {
    Condition = 100,
    Delay = 0.045,
    Dilation = 0,
    Duration = 0.03,
    Function = "HitStop",
  },
  [5] = {
    Delay = 0.045,
    Function = "PlaySE",
    MeleeHitLevel = "Normal",
    SEId = 104,
  },
  [6] = {
    Delay = 0.045,
    FXId = 1010122,
    Function = "PlayFX",
    IsAttached = false,
  },
}
r6_0.TaskId = 1060122
r4_0[1060122] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Middle180",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_61,
    Delay = 0.112,
    Function = "Damage",
    Rate = 0.1,
  },
  [2] = {
    Delay = 0.112,
    Function = "PlayFX",
    MaxHitFXNum = 3,
    WeaponFXGroupName = "Hit1",
  },
  [3] = {
    CauseHit = "LightHit",
    Delay = 0.112,
    Function = "CutToughness",
    Value = 8,
  },
  [4] = {
    Condition = 100,
    Delay = 0.112,
    Dilation = 0,
    Duration = 0.03,
    Function = "HitStop",
  },
  [5] = {
    Delay = 0.112,
    Function = "PlaySE",
    MeleeHitLevel = "Normal",
    SEId = 104,
  },
  [6] = {
    Delay = 0.112,
    FXId = 1010123,
    Function = "PlayFX",
    IsAttached = false,
  },
}
r6_0.TaskId = 1060123
r4_0[1060123] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Middle180",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_61,
    Delay = 0.165,
    Function = "Damage",
    Rate = 0.1,
  },
  [2] = {
    Delay = 0.165,
    Function = "PlayFX",
    MaxHitFXNum = 3,
    WeaponFXGroupName = "Hit1",
  },
  [3] = {
    CauseHit = "LightHit",
    Delay = 0.165,
    Function = "CutToughness",
    Value = 8,
  },
  [4] = {
    Condition = 100,
    Delay = 0.165,
    Dilation = 0,
    Duration = 0.03,
    Function = "HitStop",
  },
  [5] = {
    Delay = 0.165,
    Function = "PlaySE",
    MeleeHitLevel = "Normal",
    SEId = 104,
  },
  [6] = {
    Delay = 0.165,
    FXId = 1010124,
    Function = "PlayFX",
    IsAttached = false,
  },
}
r6_0.TaskId = 1060124
r4_0[1060124] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Middle180",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_61,
    Delay = 0.229,
    Function = "Damage",
    Rate = 0.1,
  },
  [2] = {
    Delay = 0.267,
    Function = "PlayFX",
    MaxHitFXNum = 3,
    WeaponFXGroupName = "Hit1",
  },
  [3] = {
    CauseHit = "LightHit",
    Delay = 0.267,
    Function = "CutToughness",
    Value = 8,
  },
  [4] = {
    Condition = 100,
    Delay = 0.267,
    Dilation = 0,
    Duration = 0.03,
    Function = "HitStop",
  },
  [5] = {
    Delay = 0.267,
    Function = "PlaySE",
    MeleeHitLevel = "Normal",
    SEId = 104,
  },
  [6] = {
    Delay = 0.267,
    FXId = 1010125,
    Function = "PlayFX",
    IsAttached = false,
  },
}
r6_0.TaskId = 1060125
r4_0[1060125] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Middle180",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_61,
    Delay = 0.284,
    Function = "Damage",
    Rate = 0.1,
  },
  [2] = {
    Delay = 0.284,
    Function = "PlayFX",
    MaxHitFXNum = 3,
    WeaponFXGroupName = "Hit1",
  },
  [3] = {
    CauseHit = "LightHit",
    Delay = 0.284,
    Function = "CutToughness",
    Value = 8,
  },
  [4] = {
    Condition = 100,
    Delay = 0.284,
    Dilation = 0,
    Duration = 0.03,
    Function = "HitStop",
  },
  [5] = {
    Delay = 0.284,
    Function = "PlaySE",
    MeleeHitLevel = "Normal",
    SEId = 104,
  },
  [6] = {
    Delay = 0.284,
    FXId = 1010126,
    Function = "PlayFX",
    IsAttached = false,
  },
}
r6_0.TaskId = 1060126
r4_0[1060126] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Middle180",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_61,
    Delay = 0.342,
    Function = "Damage",
    Rate = 0.1,
  },
  [2] = {
    Delay = 0.342,
    Function = "PlayFX",
    MaxHitFXNum = 3,
    WeaponFXGroupName = "Hit1",
  },
  [3] = {
    CauseHit = "LightHit",
    Delay = 0.342,
    Function = "CutToughness",
    Value = 8,
  },
  [4] = {
    Condition = 100,
    Delay = 0.342,
    Dilation = 0,
    Duration = 0.03,
    Function = "HitStop",
  },
  [5] = {
    Delay = 0.342,
    Function = "PlaySE",
    MeleeHitLevel = "Normal",
    SEId = 104,
  },
  [6] = {
    Delay = 0.342,
    FXId = 1010127,
    Function = "PlayFX",
    IsAttached = false,
  },
}
r6_0.TaskId = 1060127
r4_0[1060127] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Middle180",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_61,
    Delay = 0.365,
    Function = "Damage",
    Rate = 0.1,
  },
  [2] = {
    Delay = 0.365,
    Function = "PlayFX",
    MaxHitFXNum = 3,
    WeaponFXGroupName = "Hit1",
  },
  [3] = {
    CauseHit = "LightHit",
    Delay = 0.365,
    Function = "CutToughness",
    Value = 8,
  },
  [4] = {
    Condition = 100,
    Delay = 0.365,
    Dilation = 0,
    Duration = 0.03,
    Function = "HitStop",
  },
  [5] = {
    Delay = 0.365,
    Function = "PlaySE",
    MeleeHitLevel = "Heavy",
    SEId = 104,
  },
  [6] = {
    Delay = 0.365,
    FXId = 1010128,
    Function = "PlayFX",
    IsAttached = false,
  },
}
r6_0.TaskId = 1060128
r4_0[1060128] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Middle180",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_61,
    Delay = 0.441,
    Function = "Damage",
    Rate = 0.25,
  },
  [2] = r0_0.RT_62,
  [3] = {
    Delay = 0.441,
    Function = "PlayFX",
    MaxHitFXNum = 3,
    WeaponFXGroupName = "Hit1",
  },
  [4] = {
    CauseHit = "HitFly_XY200Z300_F",
    Delay = 0.441,
    Function = "CutToughness",
    Value = 12,
  },
  [5] = {
    Condition = 100,
    Delay = 0.441,
    Dilation = 0,
    Duration = 0.03,
    Function = "HitStop",
  },
  [6] = {
    Delay = 0.441,
    Function = "PlaySE",
    MeleeHitLevel = "Heavy",
    SEId = 104,
  },
  [7] = {
    Delay = 0.441,
    FXId = 1010129,
    Function = "PlayFX",
    IsAttached = false,
  },
}
r6_0.TaskId = 1060129
r4_0[1060129] = r6_0
r4_0[1060131] = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_68,
  TaskId = 1060131,
}
r4_0[1060132] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle",
  TaskEffects = {
    [1] = r0_0.RT_70,
    [2] = r0_0.RT_90,
    [3] = r0_0.RT_71,
    [4] = r0_0.RT_59,
    [5] = r0_0.RT_72,
  },
  TaskId = 1060132,
}
r4_0[1060141] = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small",
  TaskEffects = {
    [1] = r0_0.RT_75,
    [2] = r0_0.RT_90,
    [3] = r0_0.RT_78,
    [4] = r0_0.RT_79,
    [5] = r0_0.RT_49,
  },
  TaskId = 1060141,
}
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 1060221,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_146,
  },
  [2] = r0_0.RT_62,
}
r6_0.TaskId = 1060220
r4_0[1060220] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_61,
    Function = "Damage",
    Rate = 0.64,
  },
  [2] = r0_0.RT_90,
  [3] = {
    CauseHit = "HitFly_XY200Z500_F",
    Function = "CutToughness",
    Value = 6,
  },
  [4] = r0_0.RT_65,
  [5] = r0_0.RT_49,
}
r6_0.TaskId = 1060221
r4_0[1060221] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_61,
    Delay = 0.845,
    Function = "Damage",
    Rate = 0.64,
  },
  [2] = {
    Delay = 0.836,
    Function = "PlayFX",
    MaxHitFXNum = 3,
    WeaponFXGroupName = "Hit1",
  },
  [3] = {
    CauseHit = "LightHit",
    Delay = 0.836,
    Function = "CutToughness",
    Value = 6,
  },
  [4] = {
    Condition = 100,
    Delay = 0.836,
    Dilation = 0,
    Duration = 0.03,
    Function = "HitStop",
  },
  [5] = {
    Delay = 0.836,
    Function = "PlaySE",
    MeleeHitLevel = "Normal",
    SEId = 104,
  },
  [6] = {
    Delay = 0.836,
    FXId = 1060212,
    Function = "PlayFX",
    IsAttached = false,
  },
}
r6_0.TaskId = 1060222
r4_0[1060222] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_61,
    Delay = 0.895,
    Function = "Damage",
    Rate = 0.64,
  },
  [2] = {
    Delay = 0.895,
    Function = "PlayFX",
    MaxHitFXNum = 3,
    WeaponFXGroupName = "Hit1",
  },
  [3] = {
    CauseHit = "LightHit",
    Delay = 0.895,
    Function = "CutToughness",
    Value = 6,
  },
  [4] = {
    Condition = 100,
    Delay = 0.895,
    Dilation = 0,
    Duration = 0.03,
    Function = "HitStop",
  },
  [5] = {
    Delay = 0.895,
    Function = "PlaySE",
    MeleeHitLevel = "Normal",
    SEId = 104,
  },
  [6] = {
    Delay = 0.895,
    FXId = 1060213,
    Function = "PlayFX",
    IsAttached = false,
  },
}
r6_0.TaskId = 1060223
r4_0[1060223] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_61,
    Delay = 0.957,
    Function = "Damage",
    Rate = 0.64,
  },
  [2] = {
    Delay = 0.957,
    Function = "PlayFX",
    MaxHitFXNum = 3,
    WeaponFXGroupName = "Hit1",
  },
  [3] = {
    CauseHit = "LightHit",
    Delay = 0.957,
    Function = "CutToughness",
    Value = 6,
  },
  [4] = {
    Condition = 100,
    Delay = 0.957,
    Dilation = 0,
    Duration = 0.03,
    Function = "HitStop",
  },
  [5] = {
    Delay = 0.957,
    Function = "PlaySE",
    MeleeHitLevel = "Normal",
    SEId = 104,
  },
  [6] = {
    Delay = 0.957,
    FXId = 1060214,
    Function = "PlayFX",
    IsAttached = false,
  },
}
r6_0.TaskId = 1060224
r4_0[1060224] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_61,
    Delay = 1.042,
    Function = "Damage",
    Rate = 0.64,
  },
  [2] = {
    Delay = 1.042,
    Function = "PlayFX",
    MaxHitFXNum = 3,
    WeaponFXGroupName = "Hit1",
  },
  [3] = {
    CauseHit = "LightHit",
    Delay = 1.042,
    Function = "CutToughness",
    Value = 6,
  },
  [4] = {
    Condition = 100,
    Delay = 1.042,
    Dilation = 0,
    Duration = 0.03,
    Function = "HitStop",
  },
  [5] = {
    Delay = 1.042,
    Function = "PlaySE",
    MeleeHitLevel = "Normal",
    SEId = 104,
  },
  [6] = {
    Delay = 1.042,
    FXId = 1060215,
    Function = "PlayFX",
    IsAttached = false,
  },
}
r6_0.TaskId = 1060225
r4_0[1060225] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_61,
    Delay = 1.107,
    Function = "Damage",
    Rate = 0.64,
  },
  [2] = {
    Delay = 1.107,
    Function = "PlayFX",
    MaxHitFXNum = 3,
    WeaponFXGroupName = "Hit1",
  },
  [3] = {
    CauseHit = "LightHit",
    Delay = 1.107,
    Function = "CutToughness",
    Value = 6,
  },
  [4] = {
    Condition = 100,
    Delay = 1.107,
    Dilation = 0,
    Duration = 0.03,
    Function = "HitStop",
  },
  [5] = {
    Delay = 1.107,
    Function = "PlaySE",
    MeleeHitLevel = "Normal",
    SEId = 104,
  },
  [6] = {
    Delay = 1.107,
    FXId = 1060216,
    Function = "PlayFX",
    IsAttached = false,
  },
}
r6_0.TaskId = 1060226
r4_0[1060226] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_61,
    Delay = 1.192,
    Function = "Damage",
    Rate = 0.64,
  },
  [2] = {
    Delay = 1.192,
    Function = "PlayFX",
    MaxHitFXNum = 3,
    WeaponFXGroupName = "Hit1",
  },
  [3] = {
    CauseHit = "LightHit",
    Delay = 1.192,
    Function = "CutToughness",
    Value = 6,
  },
  [4] = {
    Condition = 100,
    Delay = 1.192,
    Dilation = 0,
    Duration = 0.03,
    Function = "HitStop",
  },
  [5] = {
    Delay = 1.192,
    Function = "PlaySE",
    MeleeHitLevel = "Normal",
    SEId = 104,
  },
  [6] = {
    Delay = 1.192,
    FXId = 1060217,
    Function = "PlayFX",
    IsAttached = false,
  },
}
r6_0.TaskId = 1060227
r4_0[1060227] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_61,
    Delay = 1.267,
    Function = "Damage",
    Rate = 0.64,
  },
  [2] = {
    Delay = 1.267,
    Function = "PlayFX",
    MaxHitFXNum = 3,
    WeaponFXGroupName = "Hit1",
  },
  [3] = {
    CauseHit = "LightHit",
    Delay = 1.267,
    Function = "CutToughness",
    Value = 13,
  },
  [4] = {
    Condition = 100,
    Delay = 1.267,
    Dilation = 0,
    Duration = 0.03,
    Function = "HitStop",
  },
  [5] = {
    Delay = 1.267,
    Function = "PlaySE",
    MeleeHitLevel = "Heavy",
    SEId = 104,
  },
  [6] = {
    Delay = 1.267,
    FXId = 1060218,
    Function = "PlayFX",
    IsAttached = false,
  },
}
r6_0.TaskId = 1060228
r4_0[1060228] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_61,
    Delay = 1.392,
    Function = "Damage",
    Rate = 1.9,
  },
  [2] = r0_0.RT_62,
  [3] = {
    Delay = 1.392,
    Function = "PlayFX",
    MaxHitFXNum = 3,
    WeaponFXGroupName = "Hit1",
  },
  [4] = {
    CauseHit = "HitFly_XY200Z300",
    Delay = 1.392,
    Function = "CutToughness",
    Value = 15,
  },
  [5] = {
    Condition = 100,
    Delay = 1.392,
    Dilation = 0,
    Duration = 0.03,
    Function = "HitStop",
  },
  [6] = {
    Delay = 1.392,
    Function = "PlaySE",
    MeleeHitLevel = "Heavy",
    SEId = 104,
  },
  [7] = {
    Delay = 1.392,
    FXId = 1060219,
    Function = "PlayFX",
    IsAttached = false,
  },
}
r6_0.TaskId = 1060229
r4_0[1060229] = r6_0
r6_0 = {
  AttackRangeType = "Normal",
  HatredIncrement = 40,
  NotifyName = r0_0.RT_2,
  TargetFilter = "Char_Cylinder_Small240",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Melee",
    DamageTag = r0_0.RT_61,
    Function = "Damage",
    Rate = 0.75,
  },
  [2] = r0_0.RT_90,
  [3] = {
    CauseHit = "LightHit_150_F",
    Function = "CutToughness",
    Value = 5,
  },
  [4] = r0_0.RT_65,
  [5] = r0_0.RT_38,
  [6] = r0_0.RT_49,
}
r6_0.TaskId = 1060251
r4_0[1060251] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 1060202,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 1060252
r4_0[1060252] = r6_0
r6_0 = {
  EffectExecuteTiming = "Leave",
  NotifyName = r0_0.RT_12,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 1060202,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 1060253
r4_0[1060253] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 1502,
    Function = "CreateSkillCreature",
  },
  [2] = {
    FXId = 15021,
    Function = "PlayFX",
    IsAttached = true,
  },
}
r6_0.TaskId = 1502001
r4_0[1502001] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 1502,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 1502002
r4_0[1502002] = r6_0
r6_0 = {
  TargetFilter = "Char_Cylinder_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_320,
  [2] = {
    CauseHit = "LightHit_150_F",
    Delay = 0.1,
    Function = "CutToughness",
    Value = 15,
  },
  [3] = r0_0.RT_321,
  [4] = {
    FXId = 15321,
    Function = "PlayFX",
    IsAttached = true,
  },
  [5] = r0_0.RT_48,
  [6] = r0_0.RT_322,
}
r6_0.TaskId = 1532001
r4_0[1532001] = r6_0
r6_0 = {
  TargetFilter = "Char_Cylinder_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_320,
  [2] = {
    CauseHit = "LightHit_100",
    Delay = 0.1,
    Function = "CutToughness",
    Value = 15,
  },
  [3] = r0_0.RT_321,
  [4] = {
    FXId = 15322,
    Function = "PlayFX",
  },
  [5] = r0_0.RT_48,
  [6] = r0_0.RT_322,
}
r6_0.TaskId = 1532002
r4_0[1532002] = r6_0
r4_0[2010001] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_342,
  TaskId = 2010001,
}
r5_0 = 2010111
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "ShootingTargets",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  AimSkeletal = "hit1",
  CreatureId = 2010111,
  Direction = "Camera",
  Function = "CreateSkillCreature",
  Location = {
    0,
    0,
    10
  },
}
r8_0[2] = r0_0.RT_72
r8_0[3] = r0_0.RT_100
r8_0[4] = {
  FXId = 2010101,
  Function = "PlayFX",
  IsAttached = true,
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 2010111
r4_0[r5_0] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_344,
  [2] = {
    FXId = 2010121,
    Function = "PlayFX",
  },
  [3] = r0_0.RT_345,
  [4] = {
    Function = "PlaySE",
    SEId = 2010106,
  },
  [5] = r0_0.RT_346,
}
r6_0.TaskId = 2010112
r4_0[2010112] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 2010121,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
  [2] = r0_0.RT_72,
  [3] = {
    Function = "PlaySE",
    SEId = 2010105,
    SceneSe = true,
  },
}
r6_0.TaskId = 2010113
r4_0[2010113] = r6_0
r6_0 = {
  AttackRangeType = "Bullet",
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_347,
  [2] = {
    FXId = 2010122,
    Function = "PlayFX",
  },
  [3] = {
    CauseHit = "HitFly_Force_Common",
    Function = "CutToughness",
    Value = 20,
  },
  [4] = r0_0.RT_72,
  [5] = r0_0.RT_348,
  [6] = r0_0.RT_349,
  [7] = r0_0.RT_350,
}
r6_0.TaskId = 2010114
r4_0[2010114] = r6_0
r6_0 = {
  AttackRangeType = "Bullet",
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_347,
  [2] = {
    FXId = 2010122,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
  [3] = {
    CauseHit = "RangedWeapon_Shotgun",
    Function = "CutToughness",
    Value = 10,
  },
  [4] = r0_0.RT_72,
  [5] = r0_0.RT_348,
  [6] = r0_0.RT_349,
  [7] = r0_0.RT_350,
}
r6_0.TaskId = 2010115
r4_0[2010115] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "ShootJudge",
    PassiveEffectId = 20101,
  },
}
r6_0.TaskId = 2010116
r4_0[2010116] = r6_0
r6_0 = {
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "hit1",
    CreatureId = 2010121,
    Direction = "Camera",
    Function = "CreateSkillCreature",
    Location = r0_0.RT_351,
  },
  [2] = r0_0.RT_72,
  [3] = {
    FXId = 2010102,
    Function = "PlayFX",
    IsAttached = true,
  },
}
r6_0.TaskId = 2010117
r4_0[2010117] = r6_0
r4_0[2010121] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_128,
  TaskId = 2010121,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "hit1",
    CreatureId = 2010411,
    Direction = "Camera",
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_72,
  [3] = r0_0.RT_100,
  [4] = r0_0.RT_352,
}
r6_0.TaskId = 2010411
r4_0[2010411] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_344,
  [2] = r0_0.RT_353,
  [3] = {
    CauseHit = "HeavyHit_120",
    Function = "CutToughness",
    Value = 100,
  },
  [4] = r0_0.RT_346,
}
r6_0.TaskId = 2010412
r4_0[2010412] = r6_0
r4_0[2010413] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_357,
  TaskId = 2010413,
}
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    Condition = 104,
    CreatureId = 2010412,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 2010414
r4_0[2010414] = r6_0
r6_0 = {
  TargetFilter = "Char_Cylinder_Small",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    DamageTag = r0_0.RT_343,
    Function = "Damage",
    Rate = 1,
  },
  [2] = {
    BossValue = 100,
    CauseHit = "LightHit",
    Function = "CutToughness",
    Value = 10,
  },
  [3] = {
    BuffId = 203,
    Function = "AddBuff",
    LastTime = 1.5,
  },
  [4] = {
    FXId = 2010401,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 2010415
r4_0[2010415] = r6_0
r4_0[2010421] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_128,
  TaskId = 2010421,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "hit1",
    CreatureId = 2019911,
    Direction = "Camera",
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_72,
  [3] = r0_0.RT_100,
  [4] = r0_0.RT_352,
}
r6_0.TaskId = 2019911
r4_0[2019911] = r6_0
r4_0[2019912] = {
  HatredIncrement = 40,
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_344,
    [2] = r0_0.RT_353,
    [3] = r0_0.RT_345,
    [4] = r0_0.RT_346,
  },
  TaskId = 2019912,
}
r4_0[2019913] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_357,
  TaskId = 2019913,
}
r4_0[2019921] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_128,
  TaskId = 2019921,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "hit1",
    CreatureId = 2020111,
    Direction = "Camera",
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_72,
  [3] = r0_0.RT_100,
}
r6_0.TaskId = 2020111
r4_0[2020111] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "hit1",
    CreatureId = 2020112,
    Direction = "Camera",
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_72,
  [3] = r0_0.RT_100,
  [4] = r0_0.RT_369,
}
r6_0.TaskId = 2020112
r4_0[2020112] = r6_0
r4_0[2020113] = {
  HatredIncrement = 40,
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_370,
    [2] = r0_0.RT_353,
    [3] = r0_0.RT_371,
    [4] = r0_0.RT_346,
  },
  TaskId = 2020113,
}
r4_0[2020114] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_357,
  TaskId = 2020114,
}
r4_0[2020121] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_128,
  TaskId = 2020121,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "hit1",
    CreatureId = 2020311,
    Direction = "Camera",
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_72,
  [3] = r0_0.RT_100,
}
r6_0.TaskId = 2020311
r4_0[2020311] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "hit1",
    CreatureId = 2020312,
    Direction = "Camera",
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_72,
  [3] = r0_0.RT_100,
  [4] = r0_0.RT_369,
}
r6_0.TaskId = 2020312
r4_0[2020312] = r6_0
r4_0[2020313] = {
  HatredIncrement = 40,
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_372,
  TaskId = 2020313,
}
r4_0[2020314] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_374,
  TaskId = 2020314,
}
r4_0[2020321] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_128,
  TaskId = 2020321,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "hit1",
    CreatureId = 2020711,
    Direction = "Camera",
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_72,
  [3] = r0_0.RT_100,
}
r6_0.TaskId = 2020711
r4_0[2020711] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "hit1",
    CreatureId = 2020712,
    Direction = "Camera",
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_72,
  [3] = r0_0.RT_100,
  [4] = r0_0.RT_369,
}
r6_0.TaskId = 2020712
r4_0[2020712] = r6_0
r4_0[2020713] = {
  HatredIncrement = 40,
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_372,
  TaskId = 2020713,
}
r4_0[2020714] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_374,
  TaskId = 2020714,
}
r4_0[2020721] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_128,
  TaskId = 2020721,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "hit1",
    CreatureId = 2030111,
    Direction = "Camera",
    Function = "CreateSkillCreature",
    Location = r0_0.RT_97,
  },
  [2] = r0_0.RT_72,
  [3] = r0_0.RT_100,
}
r6_0.TaskId = 2030111
r4_0[2030111] = r6_0
r6_0 = {
  AttackRangeType = "Bullet",
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_376,
  [2] = {
    FXId = 2030102,
    Function = "PlayFX",
    Overlap = true,
    RandomRotation = r0_0.RT_193,
  },
  [3] = r0_0.RT_377,
  [4] = r0_0.RT_175,
  [5] = r0_0.RT_378,
}
r6_0.TaskId = 2030112
r4_0[2030112] = r6_0
r6_0 = {
  AttackRangeType = "Bullet",
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_376,
  [2] = {
    FXId = 2030102,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
    RandomRotation = r0_0.RT_126,
  },
  [3] = r0_0.RT_377,
  [4] = r0_0.RT_175,
  [5] = r0_0.RT_378,
}
r6_0.TaskId = 2030113
r4_0[2030113] = r6_0
r4_0[2030114] = {
  ExtraBPFilter = "Common_CreatorFilter",
  TargetFilter = "Char_Sphere_Small_Frd",
  TaskEffects = r0_0.RT_379,
  TaskId = 2030114,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    ChargeAmount = 2,
    Function = "ChargeBullet",
  },
}
r6_0.TaskId = 2030121
r4_0[2030121] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "hit1",
    CreatureId = 2030211,
    Direction = "Camera",
    Function = "CreateSkillCreature",
    Location = r0_0.RT_97,
  },
  [2] = r0_0.RT_72,
  [3] = r0_0.RT_100,
}
r6_0.TaskId = 2030211
r4_0[2030211] = r6_0
r6_0 = {
  AttackRangeType = "Bullet",
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_380,
  [2] = {
    FXId = 2030201,
    Function = "PlayFX",
    Rotation = r0_0.RT_76,
  },
  [3] = r0_0.RT_381,
  [4] = r0_0.RT_175,
  [5] = r0_0.RT_382,
  [6] = r0_0.RT_378,
  [7] = r0_0.RT_383,
}
r6_0.TaskId = 2030212
r4_0[2030212] = r6_0
r6_0 = {
  AttackRangeType = "Bullet",
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_380,
  [2] = {
    FXId = 2030201,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
  [3] = r0_0.RT_381,
  [4] = r0_0.RT_175,
  [5] = r0_0.RT_378,
  [6] = r0_0.RT_383,
}
r6_0.TaskId = 2030213
r4_0[2030213] = r6_0
r4_0[2030214] = {
  ExtraBPFilter = "Common_CreatorFilter",
  TargetFilter = "Char_Sphere_Small_Frd",
  TaskEffects = r0_0.RT_379,
  TaskId = 2030214,
}
r4_0[2030215] = {
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_389,
    [2] = r0_0.RT_389,
    [3] = r0_0.RT_389,
    [4] = r0_0.RT_390,
    [5] = r0_0.RT_390,
    [6] = r0_0.RT_390,
  },
  TaskId = 2030215,
}
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_391,
  [2] = {
    FXId = 2030202,
    Function = "PlayFX",
  },
  [3] = {
    CauseHit = "HitFly_Force_Common",
    Function = "CutToughness",
    Value = 8,
  },
  [4] = r0_0.RT_175,
  [5] = r0_0.RT_382,
  [6] = {
    Function = "PlaySE",
    SEId = 2030203,
    SceneSe = true,
  },
}
r6_0.TaskId = 2030216
r4_0[2030216] = r6_0
r4_0[2030221] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_128,
  TaskId = 2030221,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "hit1",
    CreatureId = 2030311,
    Direction = "Camera",
    Function = "CreateSkillCreature",
    Location = r0_0.RT_97,
  },
  [2] = r0_0.RT_72,
  [3] = r0_0.RT_100,
}
r6_0.TaskId = 2030311
r4_0[2030311] = r6_0
r6_0 = {
  AttackRangeType = "Bullet",
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_392,
  [2] = {
    FXId = 2030301,
    Function = "PlayFX",
    Overlap = true,
    RandomRotation = r0_0.RT_193,
  },
  [3] = r0_0.RT_393,
  [4] = r0_0.RT_394,
  [5] = r0_0.RT_395,
  [6] = r0_0.RT_396,
}
r6_0.TaskId = 2030312
r4_0[2030312] = r6_0
r6_0 = {
  AttackRangeType = "Bullet",
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_392,
  [2] = {
    FXId = 2030301,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
    RandomRotation = r0_0.RT_126,
  },
  [3] = r0_0.RT_393,
  [4] = r0_0.RT_394,
  [5] = r0_0.RT_395,
  [6] = r0_0.RT_396,
}
r6_0.TaskId = 2030313
r4_0[2030313] = r6_0
r4_0[2030314] = {
  AttackRangeType = "Bullet",
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_Small",
  TaskEffects = r0_0.RT_401,
  TaskId = 2030314,
}
r4_0[2030315] = {
  AttackRangeType = "Bullet",
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_Small",
  TaskEffects = r0_0.RT_401,
  TaskId = 2030315,
}
r4_0[2030316] = {
  AttackRangeType = "Bullet",
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_Small",
  TaskEffects = r0_0.RT_401,
  TaskId = 2030316,
}
r4_0[2030317] = {
  AttackRangeType = "Bullet",
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_Small",
  TaskEffects = r0_0.RT_401,
  TaskId = 2030317,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "hit1",
    CreatureId = 2030312,
    Direction = "Camera",
    Function = "CreateSkillCreature",
    Location = r0_0.RT_97,
  },
  [2] = r0_0.RT_100,
  [3] = r0_0.RT_369,
  [4] = r0_0.RT_100,
}
r6_0.TaskId = 2030321
r4_0[2030321] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "hit1",
    CreatureId = 2030313,
    Direction = "Camera",
    Function = "CreateSkillCreature",
    Location = r0_0.RT_97,
  },
  [2] = r0_0.RT_100,
  [3] = r0_0.RT_369,
  [4] = r0_0.RT_100,
}
r6_0.TaskId = 2030322
r4_0[2030322] = r6_0
r4_0[2030331] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_128,
  TaskId = 2030331,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 2030401,
    Direction = "Camera",
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_72,
  [3] = r0_0.RT_100,
}
r6_0.TaskId = 2030411
r4_0[2030411] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 2030403,
    Delay = 0.1,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_191,
    Rotation = r0_0.RT_141,
  },
  [2] = {
    CreatureId = 2030403,
    Delay = 0.1,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_191,
    Rotation = r0_0.RT_140,
  },
  [3] = r0_0.RT_72,
  [4] = {
    BaseChar = "Self",
    Function = "PlaySE",
    SEId = 2030401,
  },
}
r6_0.TaskId = 2030412
r4_0[2030412] = r6_0
r6_0 = {
  AttackRangeType = "Bullet",
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_391,
  [2] = {
    FXId = 2030403,
    Function = "PlayFX",
  },
  [3] = r0_0.RT_402,
  [4] = r0_0.RT_175,
  [5] = r0_0.RT_403,
}
r6_0.TaskId = 2030413
r4_0[2030413] = r6_0
r6_0 = {
  AttackRangeType = "Bullet",
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Ranged",
    DamageTag = r0_0.RT_343,
    Function = "Damage",
    Rate = 0.04,
  },
  [2] = r0_0.RT_402,
  [3] = r0_0.RT_175,
  [4] = {
    FXId = 2030401,
    Function = "PlayFX",
  },
  [5] = r0_0.RT_403,
}
r6_0.TaskId = 2030414
r4_0[2030414] = r6_0
r6_0 = {
  AttackRangeType = "Bullet",
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_Small",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Ranged",
    DamageTag = r0_0.RT_375,
    Function = "Damage",
    Rate = 0.08,
  },
  [2] = {
    FXId = 2030402,
    Function = "PlayFX",
  },
  [3] = r0_0.RT_402,
  [4] = r0_0.RT_175,
  [5] = r0_0.RT_403,
}
r6_0.TaskId = 2030416
r4_0[2030416] = r6_0
r4_0[2030421] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_128,
  TaskId = 2030421,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "hit1",
    CreatureId = 2030511,
    Direction = "Camera",
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_72,
  [3] = r0_0.RT_100,
}
r6_0.TaskId = 2030511
r4_0[2030511] = r6_0
r6_0 = {
  AttackRangeType = "Bullet",
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Ranged",
    DamageTag = r0_0.RT_343,
    Function = "Damage",
    Rate = 0.072,
  },
  [2] = {
    FXId = 44,
    Function = "PlayFX",
  },
  [3] = {
    CauseHit = "LightHit_50",
    Function = "CutToughness",
    Value = 2,
  },
  [4] = {
    Function = "PlaySE",
    SEId = 2030503,
  },
}
r6_0.TaskId = 2030512
r4_0[2030512] = r6_0
r4_0[2030513] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_357,
  TaskId = 2030513,
}
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "StartLoopShoot",
    LoopInterval = 0.35,
    LoopShootId = 20305,
    SkillEffect = r0_0.RT_404,
  },
}
r6_0.TaskId = 2030514
r4_0[2030514] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_405,
}
r6_0.TaskEffects = {
  [1] = {
    Function = "EndLoopShoot",
    LoopShootId = 20305,
  },
}
r6_0.TaskId = 2030515
r4_0[2030515] = r6_0
r5_0 = 2030516
r6_0 = {
  EffectExecuteTiming = "Enter",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  Function = "StartHeavyCharge",
  GradeInterval = {
    1.1,
    1.1,
    1.1
  },
  HeavyChargeId = 20305,
  MaxGrade = 3,
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 2030516
r4_0[r5_0] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
}
r6_0.TaskEffects = {
  [1] = {
    Function = "UpdateLoopShoot",
    LoopInterval = 0.25,
    LoopShootId = 20305,
    SkillEffect = r0_0.RT_404,
  },
}
r6_0.TaskId = 2030517
r4_0[2030517] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
}
r6_0.TaskEffects = {
  [1] = {
    Function = "UpdateLoopShoot",
    LoopInterval = 0.15,
    LoopShootId = 20305,
    SkillEffect = r0_0.RT_404,
  },
}
r6_0.TaskId = 2030518
r4_0[2030518] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_13,
}
r6_0.TaskEffects = {
  [1] = {
    Function = "UpdateLoopShoot",
    LoopInterval = 0.05,
    LoopShootId = 20305,
    SkillEffect = r0_0.RT_404,
  },
}
r6_0.TaskId = 2030519
r4_0[2030519] = r6_0
r4_0[2030521] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_128,
  TaskId = 2030521,
}
r4_0[2040111] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "ShootingTargets",
  TaskEffects = {
    [1] = r0_0.RT_406,
    [2] = r0_0.RT_406,
    [3] = r0_0.RT_406,
    [4] = r0_0.RT_406,
    [5] = r0_0.RT_406,
    [6] = r0_0.RT_72,
    [7] = r0_0.RT_100,
  },
  TaskId = 2040111,
}
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Ranged",
    DamageTag = r0_0.RT_343,
    Function = "Damage",
    Rate = 0.3,
  },
  [2] = {
    FXId = 43,
    Function = "PlayFX",
    Overlap = true,
  },
  [3] = {
    CauseHit = "RangedWeapon_Shotgun",
    Function = "CutToughness",
    Value = 2,
  },
  [4] = r0_0.RT_346,
}
r6_0.TaskId = 2040112
r4_0[2040112] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 53,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
    ReplaceFXId = r0_0.RT_306,
  },
  [2] = r0_0.RT_355,
  [3] = r0_0.RT_356,
}
r6_0.TaskId = 2040113
r4_0[2040113] = r6_0
r4_0[2040121] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_128,
  TaskId = 2040121,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 2040211,
    Direction = "Camera",
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_72,
  [3] = r0_0.RT_100,
}
r6_0.TaskId = 2040211
r4_0[2040211] = r6_0
r5_0 = 2040213
r6_0 = {
  AttackRangeType = "Bullet",
  HatredIncrement = 40,
}
r6_0.ReplaceEffectParam = {
  Condition = 2040202,
  SkillEffect = {
    2040214
  },
}
r6_0.TargetFilter = "Char_Shotgun_20402_1"
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Ranged",
    Condition = 2040201,
    DamageTag = r0_0.RT_375,
    Function = "Damage",
    Rate = 1,
  },
  [2] = r0_0.RT_407,
  [3] = r0_0.RT_104,
  [4] = r0_0.RT_175,
  [5] = r0_0.RT_408,
}
r6_0.TaskId = 2040213
r4_0[r5_0] = r6_0
r5_0 = 2040214
r6_0 = {
  AttackRangeType = "Bullet",
  HatredIncrement = 40,
}
r6_0.ReplaceEffectParam = {
  Condition = 2040203,
  SkillEffect = {
    2040215
  },
}
r6_0.TargetFilter = "Char_Shotgun_20402_2"
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Ranged",
    DamageTag = r0_0.RT_375,
    Function = "Damage",
    Rate = "#1",
  },
  [2] = r0_0.RT_407,
  [3] = {
    CauseHit = "HitFly_Force_Common",
    Function = "CutToughness",
    Value = 100,
  },
  [4] = r0_0.RT_175,
  [5] = r0_0.RT_408,
}
r6_0.TaskId = 2040214
r4_0[r5_0] = r6_0
r5_0 = 2040215
r6_0 = {
  AttackRangeType = "Bullet",
  HatredIncrement = 40,
}
r6_0.ReplaceEffectParam = {
  Condition = 2040204,
  SkillEffect = {
    2040216
  },
}
r6_0.TargetFilter = "Char_Shotgun_20402_3"
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Ranged",
    DamageTag = r0_0.RT_375,
    Function = "Damage",
    Rate = "#2",
  },
  [2] = r0_0.RT_407,
  [3] = {
    CauseHit = "HitFly_Force_Common",
    Function = "CutToughness",
    Value = 150,
  },
  [4] = r0_0.RT_175,
  [5] = r0_0.RT_408,
}
r6_0.TaskId = 2040215
r4_0[r5_0] = r6_0
r6_0 = {
  AttackRangeType = "Bullet",
  HatredIncrement = 40,
  TargetFilter = "Char_Shotgun_20402_4",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Ranged",
    DamageTag = r0_0.RT_375,
    Function = "Damage",
    Rate = "#3",
  },
  [2] = r0_0.RT_407,
  [3] = {
    CauseHit = "HitFly_Force_Common",
    Function = "CutToughness",
    Value = 200,
  },
  [4] = r0_0.RT_175,
  [5] = r0_0.RT_408,
  [6] = r0_0.RT_105,
}
r6_0.TaskId = 2040216
r4_0[2040216] = r6_0
r4_0[2040221] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_128,
  TaskId = 2040221,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 2040301,
    Direction = "Camera",
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_72,
  [3] = r0_0.RT_100,
}
r6_0.TaskId = 2040311
r4_0[2040311] = r6_0
r6_0 = {
  AttackRangeType = "Bullet",
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_409,
  [2] = {
    FXId = 2040302,
    Function = "PlayFX",
    Overlap = true,
  },
  [3] = r0_0.RT_410,
  [4] = r0_0.RT_175,
  [5] = r0_0.RT_105,
}
r6_0.TaskId = 2040313
r4_0[2040313] = r6_0
r6_0 = {
  AttackRangeType = "Bullet",
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_409,
  [2] = {
    FXId = 2040302,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
  [3] = r0_0.RT_410,
  [4] = r0_0.RT_175,
  [5] = r0_0.RT_105,
}
r6_0.TaskId = 2040314
r4_0[2040314] = r6_0
r4_0[2040315] = {
  ExtraBPFilter = "Common_CreatorFilter",
  TargetFilter = "Char_Sphere_Small_Frd",
  TaskEffects = {
    [1] = r0_0.RT_110,
    [2] = r0_0.RT_175,
  },
  TaskId = 2040315,
}
r4_0[2040321] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_128,
  TaskId = 2040321,
}
r6_0 = {
  AttackRangeType = "Bullet",
  NotifyName = r0_0.RT_2,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 2040511,
    Direction = "Camera",
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_72,
  [3] = r0_0.RT_100,
  [4] = {
    BaseChar = "Self",
    Function = "PlaySE",
    SEId = 2040501,
  },
}
r6_0.TaskId = 2040511
r4_0[2040511] = r6_0
r6_0 = {
  AttackRangeType = "Bullet",
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_411,
  [2] = r0_0.RT_412,
  [3] = r0_0.RT_345,
  [4] = r0_0.RT_175,
  [5] = {
    Function = "PlaySE",
    SEId = 2040505,
  },
}
r6_0.TaskId = 2040512
r4_0[2040512] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 53,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
  [2] = {
    Function = "PlaySE",
    SEId = 2040505,
    SceneSe = true,
  },
}
r6_0.TaskId = 2040513
r4_0[2040513] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 2040512,
    Direction = "Camera",
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_72,
  [3] = r0_0.RT_100,
  [4] = {
    BaseChar = "Self",
    Function = "PlaySE",
    SEId = 2040502,
  },
}
r6_0.TaskId = 2040514
r4_0[2040514] = r6_0
r6_0 = {
  AttackRangeType = "Bullet",
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Ranged",
    DamageTag = r0_0.RT_343,
    Function = "Damage",
    Rate = 0.1,
  },
  [2] = r0_0.RT_413,
  [3] = {
    Function = "PlaySE",
    SEId = 2040506,
  },
}
r6_0.TaskId = 2040515
r4_0[2040515] = r6_0
r6_0 = {
  AttackRangeType = "Bullet",
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_large",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Ranged",
    DamageTag = r0_0.RT_375,
    Function = "Damage",
    Rate = 2,
  },
  [2] = {
    CauseHit = "HitFly_Force_Common",
    Function = "CutToughness",
    Value = 80,
  },
  [3] = r0_0.RT_175,
  [4] = r0_0.RT_414,
  [5] = {
    Function = "PlaySE",
    SEId = 2040508,
  },
  [6] = {
    Falloff = 0.5,
    Function = "CameraShake",
    IsSceneCameraShake = true,
    OuterRadius = 3000,
    ShakeClass = "BP_CS_BPYS_01",
  },
}
r6_0.TaskId = 2040518
r4_0[2040518] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 2040503,
    Function = "PlayFX",
  },
  [2] = r0_0.RT_175,
}
r6_0.TaskId = 2040519
r4_0[2040519] = r6_0
r4_0[2040521] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_128,
  TaskId = 2040521,
}
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "StartHeavyCharge",
    GradeInterval = r0_0.RT_292,
    HeavyChargeId = 20405,
    MaxGrade = 1,
  },
  [2] = r0_0.RT_303,
}
r6_0.TaskId = 2040531
r4_0[2040531] = r6_0
r5_0 = 2040532
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  Function = "ExecuteHeavyEffect",
  HeavyChargeId = 20405,
  SkillEffect = {
    2040511,
    2040514
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 2040532
r4_0[r5_0] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 2040601,
    Direction = "Camera",
    Function = "CreateSkillCreature",
    MaxCount = 5,
  },
  [2] = r0_0.RT_72,
  [3] = r0_0.RT_100,
  [4] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "CheckBullet",
    PassiveEffectId = 20406,
  },
  [5] = {
    BaseChar = "Self",
    ConsumeAmount = "$Source:GetInt(\'MagazineBulletNum_20406\')$",
    Function = "ConsumeBullet",
  },
}
r6_0.TaskId = 2040611
r4_0[2040611] = r6_0
r4_0[2040612] = {
  HatredIncrement = 40,
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_411,
    [2] = r0_0.RT_412,
    [3] = r0_0.RT_345,
    [4] = r0_0.RT_175,
  },
  TaskId = 2040612,
}
r6_0 = {
  AttackRangeType = "Bullet",
  ExtraBPFilter = "Common_Random",
  TargetFilter = "Char_Sphere_large",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 2040602,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 2040614
r4_0[2040614] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Ranged",
    DamageTag = r0_0.RT_375,
    Function = "Damage",
    Rate = 0.5,
  },
  [2] = {
    FXId = 2040403,
    Function = "PlayFX",
  },
  [3] = r0_0.RT_402,
  [4] = r0_0.RT_175,
}
r6_0.TaskId = 2040615
r4_0[2040615] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = r0_0.RT_416,
  [2] = r0_0.RT_418,
  [3] = {
    CreatureId = 2040602,
    Delay = 0.1,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_193,
    Rotation = r0_0.RT_143,
  },
  [4] = {
    CreatureId = 2040602,
    Delay = 0.1,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_193,
    Rotation = r0_0.RT_142,
  },
  [5] = r0_0.RT_419,
  [6] = r0_0.RT_72,
}
r6_0.TaskId = 2040616
r4_0[2040616] = r6_0
r5_0 = 2040617
r6_0 = {}
r7_0 = "TaskEffects"
r8_0 = {
  [1] = {
    CreatureId = 2040602,
    Delay = 0.1,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_193,
    Rotation = r0_0.RT_420,
  },
}
r8_0[2] = {
  CreatureId = 2040602,
  Delay = 0.1,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_193,
  Rotation = {
    0,
    -20,
    0
  },
}
r8_0[3] = {
  CreatureId = 2040602,
  Delay = 0.1,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_193,
  Rotation = r0_0.RT_421,
}
r8_0[4] = {
  CreatureId = 2040602,
  Delay = 0.1,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_193,
  Rotation = r0_0.RT_422,
}
r8_0[5] = r0_0.RT_416
r8_0[6] = r0_0.RT_418
r8_0[7] = r0_0.RT_72
r6_0[r7_0] = r8_0
r6_0.TaskId = 2040617
r4_0[r5_0] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 2040602,
    Delay = 0.1,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_193,
    Rotation = r0_0.RT_423,
  },
  [2] = {
    CreatureId = 2040602,
    Delay = 0.1,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_193,
    Rotation = r0_0.RT_424,
  },
  [3] = {
    CreatureId = 2040602,
    Delay = 0.1,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_193,
    Rotation = r0_0.RT_425,
  },
  [4] = {
    CreatureId = 2040602,
    Delay = 0.1,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_193,
    Rotation = r0_0.RT_426,
  },
  [5] = {
    CreatureId = 2040602,
    Delay = 0.1,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_193,
    Rotation = r0_0.RT_427,
  },
  [6] = {
    CreatureId = 2040602,
    Delay = 0.1,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_193,
    Rotation = r0_0.RT_428,
  },
  [7] = r0_0.RT_419,
  [8] = r0_0.RT_72,
}
r6_0.TaskId = 2040618
r4_0[2040618] = r6_0
r5_0 = 2040711
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "ShootingTargets",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  AimSkeletal = "hit1",
  CreatureId = 2040711,
  Direction = "Camera",
  Function = "CreateSkillCreature",
  Rotation = {
    -10,
    -20,
    0
  },
}
r8_0[2] = {
  AimSkeletal = "hit1",
  CreatureId = 2040711,
  Direction = "Camera",
  Function = "CreateSkillCreature",
  Rotation = {
    -10,
    20,
    0
  },
}
r8_0[3] = {
  AimSkeletal = "hit1",
  CreatureId = 2040711,
  Direction = "Camera",
  Function = "CreateSkillCreature",
  Rotation = {
    10,
    0,
    0
  },
}
r8_0[4] = r0_0.RT_72
r8_0[5] = r0_0.RT_100
r6_0[r7_0] = r8_0
r6_0.TaskId = 2040711
r4_0[r5_0] = r6_0
r6_0 = {
  AttackRangeType = "Bullet",
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_409,
  [2] = {
    FXId = 2040702,
    Function = "PlayFX",
    Overlap = true,
  },
  [3] = r0_0.RT_410,
  [4] = r0_0.RT_175,
}
r6_0.TaskId = 2040712
r4_0[2040712] = r6_0
r6_0 = {
  AttackRangeType = "Bullet",
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_409,
  [2] = {
    FXId = 2040702,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
  [3] = r0_0.RT_410,
  [4] = r0_0.RT_175,
}
r6_0.TaskId = 2040713
r4_0[2040713] = r6_0
r4_0[2040721] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_128,
  TaskId = 2040721,
}
r6_0 = {
  TargetFilter = "AlmostAllOtFr",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 20509,
    Function = "AddBuff",
    LastTime = 15,
  },
}
r6_0.TaskId = 2050001
r4_0[2050001] = r6_0
r6_0 = {
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "hit1",
    CreatureId = 2050111,
    Direction = "Camera",
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_429,
  [3] = r0_0.RT_72,
  [4] = r0_0.RT_100,
  [5] = r0_0.RT_430,
}
r6_0.TaskId = 2050111
r4_0[2050111] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Ranged",
    DamageTag = r0_0.RT_343,
    Function = "Damage",
    Rate = 0.16,
  },
  [2] = r0_0.RT_176,
  [3] = r0_0.RT_431,
  [4] = r0_0.RT_346,
}
r6_0.TaskId = 2050113
r4_0[2050113] = r6_0
r4_0[2050114] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_357,
  TaskId = 2050114,
}
r5_0 = 2050115
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  Function = "StartLoopShoot",
  LoopInterval = 0.1,
  LoopShootId = 20501,
  SkillEffect = {
    2050111
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 2050115
r4_0[r5_0] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
}
r6_0.TaskEffects = {
  [1] = {
    Function = "EndLoopShoot",
    LoopShootId = 20501,
  },
}
r6_0.TaskId = 2050116
r4_0[2050116] = r6_0
r4_0[2050121] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_128,
  TaskId = 2050121,
}
r6_0 = {
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 2050211,
    Direction = "Camera",
    Function = "CreateRayCreature",
    RayEndLoc = true,
  },
  [2] = {
    AimSaveLoc = true,
    FXId = 2050201,
    Function = "PlayFX",
    IsAttached = true,
    LerpTime = 0.1,
  },
  [3] = {
    FXId = 2050204,
    Function = "PlayFX",
    IsAttached = true,
  },
  [4] = r0_0.RT_72,
  [5] = r0_0.RT_100,
}
r6_0.TaskId = 2050211
r4_0[2050211] = r6_0
r4_0[2050213] = {
  HatredIncrement = 40,
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_433,
    [2] = r0_0.RT_431,
    [3] = r0_0.RT_434,
  },
  TaskId = 2050213,
}
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_433,
  [2] = r0_0.RT_431,
  [3] = {
    AimFrom = "SaveLoc",
    AimTarget = true,
    FXId = 2050202,
    Function = "PlayFX",
  },
  [4] = {
    FXId = 2050203,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 2050214
r4_0[2050214] = r6_0
r5_0 = 2050215
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  Function = "StartLoopShoot",
  LoopInterval = 0.1,
  LoopShootId = 20502,
  SkillEffect = {
    2050211
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 2050215
r4_0[r5_0] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
}
r6_0.TaskEffects = {
  [1] = {
    Function = "EndLoopShoot",
    LoopShootId = 20502,
  },
}
r6_0.TaskId = 2050216
r4_0[2050216] = r6_0
r4_0[2050217] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_436,
  TaskId = 2050217,
}
r6_0 = {
  TargetFilter = "Char_Machinegun_20502",
}
r6_0.TaskEffects = {
  [1] = {
    CatapultNum = 4,
    Function = "Catapult",
    Rule = "Nearpriority",
    SkillEffectId = 2050214,
  },
}
r6_0.TaskId = 2050218
r4_0[2050218] = r6_0
r4_0[2050221] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_128,
  TaskId = 2050221,
}
r6_0 = {
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 2050311,
    Direction = "Camera",
    Function = "CreateRayCreature",
  },
  [2] = {
    FXId = 2050301,
    Function = "PlayFX",
    IsAttached = true,
  },
  [3] = r0_0.RT_72,
  [4] = r0_0.RT_100,
}
r6_0.TaskId = 2050311
r4_0[2050311] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_438,
  [2] = r0_0.RT_431,
  [3] = {
    Function = "PlaySE",
    SEId = 151,
  },
}
r6_0.TaskId = 2050314
r4_0[2050314] = r6_0
r5_0 = 2050315
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  Function = "StartLoopShoot",
  LoopInterval = 0.125,
  LoopShootId = 20503,
  SkillEffect = {
    2050311
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 2050315
r4_0[r5_0] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
}
r6_0.TaskEffects = {
  [1] = {
    Function = "EndLoopShoot",
    LoopShootId = 20503,
  },
}
r6_0.TaskId = 2050316
r4_0[2050316] = r6_0
r4_0[2050321] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_128,
  TaskId = 2050321,
}
r4_0[2050331] = {
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_80,
  },
  TaskId = 2050331,
}
r6_0 = {
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 2050411,
    Direction = "Camera",
    Function = "CreateRayCreature",
    RayEndLoc = true,
  },
  [2] = r0_0.RT_72,
  [3] = r0_0.RT_100,
}
r6_0.TaskId = 2050411
r4_0[2050411] = r6_0
r6_0 = {
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_439,
  [2] = {
    CreatureId = 2050412,
    Direction = "Camera",
    Function = "CreateRayCreature",
    RayEndLoc = true,
  },
  [3] = r0_0.RT_72,
  [4] = r0_0.RT_100,
}
r6_0.TaskId = 2050412
r4_0[2050412] = r6_0
r6_0 = {
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_440,
  [2] = {
    CreatureId = 2050413,
    Direction = "Camera",
    Function = "CreateRayCreature",
    RayEndLoc = true,
  },
  [3] = r0_0.RT_72,
  [4] = r0_0.RT_100,
}
r6_0.TaskId = 2050413
r4_0[2050413] = r6_0
r5_0 = 2050414
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  Function = "StartLoopShoot",
  LoopInterval = 0.5,
  LoopShootId = 20504,
  SkillEffect = {
    2050411
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 2050414
r4_0[r5_0] = r6_0
r6_0 = {
  EffectExecuteTiming = "Leave",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "EndLoopShoot",
    LoopShootId = 20504,
  },
  [2] = r0_0.RT_439,
  [3] = r0_0.RT_440,
  [4] = {
    CreatureId = 2050413,
    Function = "RemoveRayCreature",
  },
}
r6_0.TaskId = 2050415
r4_0[2050415] = r6_0
r5_0 = 2050416
r6_0 = {
  EffectExecuteTiming = "Enter",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  Function = "StartHeavyCharge",
  GradeInterval = {
    2,
    2
  },
  HeavyChargeId = 20504,
  MaxGrade = 2,
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 2050416
r4_0[r5_0] = r6_0
r5_0 = 2050417
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  Function = "UpdateLoopShoot",
  LoopInterval = 0.35,
  LoopShootId = 20504,
  SkillEffect = {
    2050412
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 2050417
r4_0[r5_0] = r6_0
r5_0 = 2050418
r6_0 = {
  NotifyName = r0_0.RT_9,
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  Function = "UpdateLoopShoot",
  LoopInterval = 0.1,
  LoopShootId = 20504,
  SkillEffect = {
    2050413
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 2050418
r4_0[r5_0] = r6_0
r4_0[2050421] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_128,
  TaskId = 2050421,
}
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Ranged",
    DamageTag = r0_0.RT_437,
    Function = "Damage",
    Rate = 0.12,
  },
  [2] = {
    FXId = 2050411,
    Function = "PlayFX",
  },
  [3] = r0_0.RT_441,
  [4] = {
    Function = "PlaySE",
    SEId = 2050401,
  },
}
r6_0.TaskId = 2050431
r4_0[2050431] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_438,
  [2] = {
    FXId = 2050412,
    Function = "PlayFX",
  },
  [3] = r0_0.RT_431,
  [4] = {
    Function = "PlaySE",
    SEId = 2050402,
  },
}
r6_0.TaskId = 2050432
r4_0[2050432] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Ranged",
    DamageTag = r0_0.RT_437,
    Function = "Damage",
    Rate = 0.37,
  },
  [2] = {
    FXId = 2050413,
    Function = "PlayFX",
  },
  [3] = {
    CauseHit = "RangedWeapon_Common",
    Function = "CutToughness",
    Value = 5,
  },
  [4] = {
    Function = "PlaySE",
    SEId = 2050403,
  },
}
r6_0.TaskId = 2050433
r4_0[2050433] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 2050414,
    Function = "PlayFX",
  },
  [2] = r0_0.RT_442,
}
r6_0.TaskId = 2050434
r4_0[2050434] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 2050415,
    Function = "PlayFX",
  },
  [2] = r0_0.RT_442,
}
r6_0.TaskId = 2050435
r4_0[2050435] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 2050416,
    Function = "PlayFX",
  },
  [2] = r0_0.RT_442,
}
r6_0.TaskId = 2050436
r4_0[2050436] = r6_0
r6_0 = {
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 2050511,
    Direction = "Camera",
    Function = "CreateRayCreature",
    RayEndLoc = true,
  },
  [2] = {
    AimSaveLoc = true,
    FXId = 2050501,
    Function = "PlayFX",
    IsAttached = true,
    LerpTime = 0.1,
  },
  [3] = r0_0.RT_72,
}
r6_0.TaskId = 2050511
r4_0[2050511] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 2050501,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 2050512
r4_0[2050512] = r6_0
r5_0 = 2050513
r6_0 = {
  EffectExecuteTiming = "Enter",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  Function = "StartLoopShoot",
  LoopInterval = 0.1,
  LoopShootId = 20505,
  SkillEffect = {
    2050511,
    2050512
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 2050513
r4_0[r5_0] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Ranged",
    DamageTag = r0_0.RT_437,
    Function = "Damage",
    Rate = 0.15,
  },
  [2] = r0_0.RT_443,
  [3] = {
    Function = "PlaySE",
    SEId = 2050201,
  },
}
r6_0.TaskId = 2050514
r4_0[2050514] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "EndLoopShoot",
    LoopShootId = 20505,
  },
  [2] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "CheckBullet",
    PassiveEffectId = 20505,
  },
  [3] = {
    BuffId = 2050501,
    Function = "RemoveBuff",
    Num = 10,
  },
  [4] = {
    BaseChar = "Self",
    ConsumeAmount = "$Source:GetInt(\'MagazineBulletNum_20505\')$",
    Function = "ConsumeBullet",
  },
}
r6_0.TaskId = 2050515
r4_0[2050515] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "hit1",
    CreatureId = 2050511,
    Direction = "Camera",
    Function = "CreateSkillCreature",
  },
  [2] = {
    FXId = 2050505,
    Function = "PlayFX",
    IsAttached = true,
  },
}
r6_0.TaskId = 2050516
r4_0[2050516] = r6_0
r6_0 = {
  AttackRangeType = "Bullet",
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_Small",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Ranged",
    DamageTag = r0_0.RT_375,
    Function = "Damage",
    Rate = 1.5,
  },
  [2] = {
    FXId = 2050504,
    Function = "PlayFX",
    Overlap = true,
  },
  [3] = r0_0.RT_104,
  [4] = r0_0.RT_175,
}
r6_0.TaskId = 2050517
r4_0[2050517] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_443,
  [2] = {
    Function = "PlaySE",
    SEId = 2050201,
    SceneSe = true,
  },
}
r6_0.TaskId = 2050518
r4_0[2050518] = r6_0
r4_0[2050521] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_128,
  TaskId = 2050521,
}
r4_0[2050611] = {
  TargetFilter = "ShootingTargets",
  TaskEffects = {
    [1] = r0_0.RT_447,
    [2] = r0_0.RT_449,
    [3] = r0_0.RT_72,
    [4] = r0_0.RT_450,
  },
  TaskId = 2050611,
}
r5_0 = 2050612
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  Function = "StartLoopShoot",
  LoopInterval = 0.1,
  LoopShootId = 20506,
  SkillEffect = {
    2050611
  },
}
r8_0[2] = {
  Function = "StartHeavyCharge",
  GradeInterval = {
    1.5
  },
  HeavyChargeId = 20506,
  MaxGrade = 1,
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 2050612
r4_0[r5_0] = r6_0
r6_0 = {
  EffectExecuteTiming = "Leave",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "EndLoopShoot",
    LoopShootId = 20506,
  },
  [2] = {
    CreatureId = 2050611,
    Function = "RemoveRayCreature",
  },
  [3] = {
    CreatureId = 2050612,
    Function = "RemoveRayCreature",
  },
  [4] = {
    CreatureId = 2050613,
    Function = "RemoveRayCreature",
  },
  [5] = {
    CreatureId = 2050614,
    Function = "RemoveRayCreature",
  },
}
r6_0.TaskId = 2050613
r4_0[2050613] = r6_0
r6_0 = {
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_447,
  [2] = r0_0.RT_449,
  [3] = {
    CreatureId = 2050613,
    Direction = "Camera",
    Function = "CreateRayCreature",
    InterpRotation = r0_0.RT_445,
    RayEndLoc = true,
    Rotation = r0_0.RT_446,
  },
  [4] = {
    CreatureId = 2050614,
    Direction = "Camera",
    Function = "CreateRayCreature",
    InterpRotation = r0_0.RT_448,
    RayEndLoc = true,
    Rotation = r0_0.RT_444,
  },
  [5] = r0_0.RT_450,
  [6] = r0_0.RT_72,
}
r6_0.TaskId = 2050614
r4_0[2050614] = r6_0
r5_0 = 2050615
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  Function = "UpdateLoopShoot",
  LoopInterval = 0.1,
  LoopShootId = 20506,
  SkillEffect = {
    2050614
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 2050615
r4_0[r5_0] = r6_0
r4_0[2050621] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_128,
  TaskId = 2050621,
}
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Ranged",
    DamageTag = r0_0.RT_437,
    Function = "Damage",
    Rate = 0.041,
  },
  [2] = r0_0.RT_451,
  [3] = r0_0.RT_441,
  [4] = {
    Function = "PlaySE",
    SEId = 2050603,
  },
}
r6_0.TaskId = 2050631
r4_0[2050631] = r6_0
r4_0[2050632] = {
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_451,
  },
  TaskId = 2050632,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "hit1",
    CreatureId = 2050701,
    Direction = "Camera",
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_429,
  [3] = r0_0.RT_72,
  [4] = r0_0.RT_100,
  [5] = r0_0.RT_127,
  [6] = {
    BaseChar = "Self",
    Function = "PlaySE",
    SEId = 2050704,
  },
}
r6_0.TaskId = 2050711
r4_0[2050711] = r6_0
r4_0[2050713] = {
  HatredIncrement = 40,
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_452,
    [2] = r0_0.RT_176,
    [3] = r0_0.RT_453,
    [4] = r0_0.RT_119,
    [5] = r0_0.RT_305,
  },
  TaskId = 2050713,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_307,
  [2] = {
    CorrectDirection = true,
    FXId = 2050701,
    Function = "PlayFX",
    IsAttached = true,
    IsDecalEffectCreature = true,
    NormalToHit = true,
    Overlap = true,
    RefinedOverlap = true,
    ReplaceFXId = r0_0.RT_308,
  },
  [3] = r0_0.RT_309,
}
r6_0.TaskId = 2050714
r4_0[2050714] = r6_0
r5_0 = 2050715
r6_0 = {
  EffectExecuteTiming = "Enter",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  Function = "StartLoopShoot",
  LoopInterval = 0.1,
  LoopShootId = 20507,
  SkillEffect = {
    2050711
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 2050715
r4_0[r5_0] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
}
r6_0.TaskEffects = {
  [1] = {
    Function = "EndLoopShoot",
    LoopShootId = 20507,
  },
}
r6_0.TaskId = 2050716
r4_0[2050716] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BeCallBacked = true,
    Function = "CallBackSkillCreature",
    IsFollowing = true,
    MinDistance = 50,
    SetSpeed = 5000,
    Target = "RangedWeapon",
    TargetSocket = "root",
  },
}
r6_0.TaskId = 2050721
r4_0[2050721] = r6_0
r6_0 = {
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "RootSource",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_81,
  [2] = {
    Function = "PlaySE",
    SEId = 2050705,
  },
}
r6_0.TaskId = 2050722
r4_0[2050722] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "hit1",
    CreatureId = 2051001,
    Direction = "Camera",
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_302,
  [3] = r0_0.RT_72,
  [4] = r0_0.RT_100,
  [5] = r0_0.RT_127,
}
r6_0.TaskId = 2051011
r4_0[2051011] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_452,
  [2] = r0_0.RT_453,
  [3] = {
    FXId = 2051004,
    Function = "PlayFX",
  },
  [4] = r0_0.RT_119,
  [5] = r0_0.RT_305,
}
r6_0.TaskId = 2051013
r4_0[2051013] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 2051006,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
    ReplaceFXId = r0_0.RT_306,
  },
  [2] = {
    CorrectDirection = true,
    FXId = 2010100,
    Function = "PlayFX",
    IsAttached = true,
    IsDecalEffectCreature = true,
    NormalToHit = true,
    Overlap = true,
    RefinedOverlap = true,
    ReplaceFXId = r0_0.RT_308,
  },
  [3] = r0_0.RT_309,
}
r6_0.TaskId = 2051014
r4_0[2051014] = r6_0
r5_0 = 2051015
r6_0 = {
  EffectExecuteTiming = "Enter",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  Function = "StartLoopShoot",
  LoopInterval = 0.1,
  LoopShootId = 20510,
  SkillEffect = {
    2051011
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 2051015
r4_0[r5_0] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
}
r6_0.TaskEffects = {
  [1] = {
    Function = "EndLoopShoot",
    LoopShootId = 20510,
  },
}
r6_0.TaskId = 2051016
r4_0[2051016] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BeCallBacked = true,
    Function = "CallBackSkillCreature",
    IsFollowing = true,
    MinDistance = 50,
    SetSpeed = 2000,
    Target = "RangedWeapon",
    TargetSocket = "root",
  },
  [2] = {
    FXId = 2051002,
    Function = "ReplaceBulletFXID",
  },
}
r6_0.TaskId = 2051021
r4_0[2051021] = r6_0
r6_0 = {
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "RootSource",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_81,
  [2] = {
    Function = "PlaySE",
    SEId = 2051002,
  },
}
r6_0.TaskId = 2051022
r4_0[2051022] = r6_0
r6_0 = {
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "hit1",
    CreatureId = 2051111,
    Direction = "Camera",
    ExtraRotation = 3,
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_429,
  [3] = r0_0.RT_72,
  [4] = r0_0.RT_100,
  [5] = r0_0.RT_430,
}
r6_0.TaskId = 2051111
r4_0[2051111] = r6_0
r6_0 = {
  AttackRangeType = "Bullet",
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_Small",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_409,
  [2] = {
    FXId = 2051102,
    Function = "PlayFX",
    Overlap = true,
  },
  [3] = r0_0.RT_410,
  [4] = r0_0.RT_175,
}
r6_0.TaskId = 2051113
r4_0[2051113] = r6_0
r5_0 = 2051115
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  Function = "StartLoopShoot",
  LoopInterval = 0.15,
  LoopShootId = 20511,
  SkillEffect = {
    2051111
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 2051115
r4_0[r5_0] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
}
r6_0.TaskEffects = {
  [1] = {
    Function = "EndLoopShoot",
    LoopShootId = 20511,
  },
}
r6_0.TaskId = 2051116
r4_0[2051116] = r6_0
r4_0[2051121] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_128,
  TaskId = 2051121,
}
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 2051111,
    Function = "CallBackSkillCreature",
    SetSpeed = 0.001,
  },
}
r6_0.TaskId = 2051122
r4_0[2051122] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "hit1",
    CreatureId = 2060111,
    Direction = "Camera",
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_72,
  [3] = r0_0.RT_454,
  [4] = r0_0.RT_100,
  [5] = r0_0.RT_127,
}
r6_0.TaskId = 2060111
r4_0[2060111] = r6_0
r4_0[2060112] = {
  HatredIncrement = 40,
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_460,
  TaskId = 2060112,
}
r4_0[2060113] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_464,
  TaskId = 2060113,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "hit1",
    CreatureId = 2060121,
    Direction = "Camera",
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_72,
  [3] = r0_0.RT_465,
  [4] = r0_0.RT_100,
  [5] = r0_0.RT_127,
}
r6_0.TaskId = 2060121
r4_0[2060121] = r6_0
r4_0[2060122] = {
  HatredIncrement = 40,
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_466,
    [2] = r0_0.RT_456,
    [3] = r0_0.RT_458,
    [4] = r0_0.RT_467,
    [5] = r0_0.RT_459,
    [6] = r0_0.RT_468,
  },
  TaskId = 2060122,
}
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "hit1",
    CreatureId = 2060131,
    Direction = "Camera",
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_72,
  [3] = {
    FXId = 2060131,
    Function = "PlayFX",
    IsAttached = true,
  },
  [4] = r0_0.RT_100,
  [5] = r0_0.RT_127,
}
r6_0.TaskId = 2060131
r4_0[2060131] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Ranged",
    DamageTag = r0_0.RT_343,
    Function = "Damage",
    Rate = 1.43,
  },
  [2] = r0_0.RT_456,
  [3] = r0_0.RT_458,
  [4] = {
    CauseHit = "RangedWeapon_Common",
    Function = "CutToughness",
    Value = 20,
  },
  [5] = r0_0.RT_459,
  [6] = r0_0.RT_468,
}
r6_0.TaskId = 2060132
r4_0[2060132] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "StartHeavyCharge",
    GradeInterval = r0_0.RT_469,
    HeavyChargeId = 20601,
    MaxGrade = 3,
  },
  [2] = r0_0.RT_303,
}
r6_0.TaskId = 2060141
r4_0[2060141] = r6_0
r5_0 = 2060142
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  Function = "ExecuteHeavyEffect",
  HeavyChargeId = 20601,
  SkillEffect = {
    2060111,
    2060121,
    2060131,
    2060121
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 2060142
r4_0[r5_0] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AttachToSkillCreature = true,
    Function = "ReleaseTarget",
  },
}
r6_0.TaskId = 2060143
r4_0[2060143] = r6_0
r5_0 = 2060211
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "ShootingTargets",
}
r7_0 = "TaskEffects"
r8_0 = {
  [1] = {
    AimSkeletal = "hit1",
    CreatureId = 2060211,
    Direction = "Camera",
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_470,
}
r8_0[3] = {
  AimSkeletal = "hit1",
  Condition = 44,
  CreatureId = 2060211,
  Direction = "Camera",
  Function = "CreateSkillCreature",
  Rotation = {
    0,
    6,
    0
  },
}
r8_0[4] = r0_0.RT_470
r8_0[5] = {
  AimSkeletal = "hit1",
  Condition = 44,
  CreatureId = 2060211,
  Direction = "Camera",
  Function = "CreateSkillCreature",
  Rotation = {
    0,
    -6,
    0
  },
}
r8_0[6] = r0_0.RT_470
r8_0[7] = {
  AimSkeletal = "hit1",
  Condition = 44,
  CreatureId = 2060211,
  Direction = "Camera",
  Function = "CreateSkillCreature",
  Rotation = r0_0.RT_471,
}
r8_0[8] = r0_0.RT_470
r6_0[r7_0] = r8_0
r6_0.TaskId = 2060211
r4_0[r5_0] = r6_0
r5_0 = 2060212
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "ShootingTargets",
}
r7_0 = "TaskEffects"
r8_0 = {
  [1] = {
    AimSkeletal = "hit1",
    Condition = 44,
    CreatureId = 2060211,
    Direction = "Camera",
    Function = "CreateSkillCreature",
    Rotation = r0_0.RT_472,
  },
  [2] = r0_0.RT_470,
}
r8_0[3] = {
  AimSkeletal = "hit1",
  Condition = 44,
  CreatureId = 2060211,
  Direction = "Camera",
  Function = "CreateSkillCreature",
  Rotation = {
    0,
    18,
    0
  },
}
r8_0[4] = r0_0.RT_470
r8_0[5] = {
  AimSkeletal = "hit1",
  Condition = 44,
  CreatureId = 2060211,
  Direction = "Camera",
  Function = "CreateSkillCreature",
  Rotation = {
    0,
    -18,
    0
  },
}
r8_0[6] = r0_0.RT_470
r8_0[7] = r0_0.RT_127
r8_0[8] = r0_0.RT_72
r8_0[9] = r0_0.RT_454
r8_0[10] = r0_0.RT_100
r6_0[r7_0] = r8_0
r6_0.TaskId = 2060212
r4_0[r5_0] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Ranged",
    DamageTag = r0_0.RT_343,
    Function = "Damage",
    Rate = 0.063,
  },
  [2] = r0_0.RT_456,
  [3] = r0_0.RT_458,
  [4] = r0_0.RT_441,
  [5] = r0_0.RT_459,
}
r6_0.TaskId = 2060213
r4_0[2060213] = r6_0
r4_0[2060214] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_464,
  TaskId = 2060214,
}
r4_0[2060311] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "ShootingTargets",
  TaskEffects = {
    [1] = r0_0.RT_473,
    [2] = r0_0.RT_72,
    [3] = r0_0.RT_454,
    [4] = r0_0.RT_100,
    [5] = r0_0.RT_474,
    [6] = r0_0.RT_127,
  },
  TaskId = 2060311,
}
r5_0 = 2060312
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r6_0.ReplaceEffectParam = {
  Condition = 2060301,
  SkillEffect = {
    2060317
  },
}
r6_0.TargetFilter = "CustomizedTargets"
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "hit1",
    CreatureId = 2060312,
    Direction = "Camera",
    ExtraRotation = 2,
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_72,
  [3] = r0_0.RT_454,
  [4] = r0_0.RT_100,
  [5] = {
    BaseChar = "Target",
    ConsumeAmount = 1,
    Function = "ConsumeBullet",
    TotalBullet = 1,
  },
  [6] = {
    BaseChar = "Self",
    Function = "PlaySE",
    SEId = 2060307,
  },
}
r6_0.TaskId = 2060312
r4_0[r5_0] = r6_0
r5_0 = 2060313
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CostBullet = 0,
  Function = "StartLoopShoot",
  LoopInterval = 0.2,
  LoopShootId = 20603,
  SkillEffect = {
    2060315
  },
}
r8_0[2] = r0_0.RT_303
r8_0[3] = r0_0.RT_304
r6_0[r7_0] = r8_0
r6_0.TaskId = 2060313
r4_0[r5_0] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r6_0.TaskEffects = {
  [1] = {
    Function = "EndLoopShoot",
    LoopShootId = 20603,
  },
  [2] = r0_0.RT_475,
  [3] = r0_0.RT_127,
}
r6_0.TaskId = 2060314
r4_0[2060314] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    ClientSkillLogicId = 2060301,
    Function = "ExecuteClientSkillLogicFunction",
    FunctionName = "HeavyShootingLoop",
  },
}
r6_0.TaskId = 2060315
r4_0[2060315] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_476,
  [2] = r0_0.RT_456,
  [3] = r0_0.RT_441,
  [4] = {
    Function = "PlaySE",
    SEId = 2060302,
  },
  [5] = r0_0.RT_119,
}
r6_0.TaskId = 2060316
r4_0[2060316] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "CustomizedTargets",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_473,
  [2] = r0_0.RT_72,
  [3] = r0_0.RT_454,
  [4] = r0_0.RT_100,
  [5] = {
    BaseChar = "Self",
    ConsumeAmount = 1,
    Function = "ConsumeBullet",
    TotalBullet = 1,
  },
  [6] = r0_0.RT_474,
  [7] = r0_0.RT_127,
}
r6_0.TaskId = 2060317
r4_0[2060317] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_476,
  [2] = r0_0.RT_456,
  [3] = r0_0.RT_441,
  [4] = {
    Function = "PlaySE",
    SEId = 2060303,
  },
  [5] = r0_0.RT_119,
}
r6_0.TaskId = 2060318
r4_0[2060318] = r6_0
r4_0[2060321] = {
  EffectExecuteTiming = "Leave",
  TargetFilter = "ShootingTargets",
  TaskEffects = {
    [1] = r0_0.RT_475,
  },
  TaskId = 2060321,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "hit1",
    CreatureId = 2060511,
    Direction = "Camera",
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_72,
  [3] = r0_0.RT_454,
  [4] = r0_0.RT_100,
  [5] = r0_0.RT_127,
}
r6_0.TaskId = 2060511
r4_0[2060511] = r6_0
r4_0[2060512] = {
  HatredIncrement = 40,
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_460,
  TaskId = 2060512,
}
r4_0[2060513] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_477,
  TaskId = 2060513,
}
r4_0[2060521] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "ShootingTargets",
  TaskEffects = {
    [1] = r0_0.RT_478,
    [2] = r0_0.RT_72,
    [3] = r0_0.RT_465,
    [4] = r0_0.RT_100,
    [5] = r0_0.RT_127,
  },
  TaskId = 2060521,
}
r6_0 = {
  AttackRangeType = "Bullet",
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_Middle",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_409,
  [2] = {
    FXId = 2060511,
    Function = "PlayFX",
    Overlap = true,
  },
  [3] = r0_0.RT_410,
  [4] = r0_0.RT_175,
}
r6_0.TaskId = 2060522
r4_0[2060522] = r6_0
r6_0 = {
  AttackRangeType = "Bullet",
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_Middle",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_409,
  [2] = {
    FXId = 2060511,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
  [3] = r0_0.RT_410,
  [4] = r0_0.RT_175,
}
r6_0.TaskId = 2060523
r4_0[2060523] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_478,
  [2] = {
    AimSkeletal = "hit1",
    CreatureId = 2060521,
    Direction = "Camera",
    Function = "CreateSkillCreature",
    Rotation = r0_0.RT_472,
  },
  [3] = {
    AimSkeletal = "hit1",
    CreatureId = 2060521,
    Direction = "Camera",
    Function = "CreateSkillCreature",
    Rotation = r0_0.RT_471,
  },
  [4] = r0_0.RT_72,
  [5] = r0_0.RT_465,
  [6] = r0_0.RT_100,
  [7] = r0_0.RT_127,
}
r6_0.TaskId = 2060524
r4_0[2060524] = r6_0
r5_0 = 2060531
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  Function = "StartHeavyCharge",
  GradeInterval = {
    0.4,
    0.4,
    0.4
  },
  HeavyChargeId = 20605,
  MaxGrade = 3,
}
r8_0[2] = r0_0.RT_303
r6_0[r7_0] = r8_0
r6_0.TaskId = 2060531
r4_0[r5_0] = r6_0
r5_0 = 2060532
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  Function = "ExecuteHeavyEffect",
  HeavyChargeId = 20605,
  SkillEffect = {
    2060511,
    2060521,
    2060524,
    2060521
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 2060532
r4_0[r5_0] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "hit1",
    CreatureId = 2069911,
    Direction = "Camera",
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_72,
  [3] = r0_0.RT_454,
  [4] = r0_0.RT_100,
  [5] = r0_0.RT_127,
}
r6_0.TaskId = 2069911
r4_0[2069911] = r6_0
r4_0[2069912] = {
  HatredIncrement = 40,
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_460,
  TaskId = 2069912,
}
r4_0[2069913] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_477,
  TaskId = 2069913,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "hit1",
    CreatureId = 2069921,
    Direction = "Camera",
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_72,
  [3] = r0_0.RT_465,
  [4] = r0_0.RT_100,
  [5] = r0_0.RT_127,
}
r6_0.TaskId = 2069921
r4_0[2069921] = r6_0
r4_0[2069922] = {
  HatredIncrement = 40,
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_466,
    [2] = r0_0.RT_456,
    [3] = r0_0.RT_458,
    [4] = r0_0.RT_467,
    [5] = r0_0.RT_459,
  },
  TaskId = 2069922,
}
r5_0 = 2069931
r6_0 = {
  EffectExecuteTiming = "Enter",
  TargetFilter = "Self",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  Function = "StartHeavyCharge",
  GradeInterval = {
    0.5
  },
  HeavyChargeId = 20601,
  MaxGrade = 1,
}
r8_0[2] = r0_0.RT_303
r6_0[r7_0] = r8_0
r6_0.TaskId = 2069931
r4_0[r5_0] = r6_0
r5_0 = 2069932
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  Function = "ExecuteHeavyEffect",
  HeavyChargeId = 20601,
  SkillEffect = {
    2069911,
    2069921
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 2069932
r4_0[r5_0] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseChar = "Target",
    FXId = 33311,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 3311001
r4_0[3311001] = r6_0
r6_0 = {
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 4200101,
    Direction = "Camera",
    Function = "CreateRayCreature",
    RayEndLoc = true,
  },
}
r6_0.TaskId = 4200101
r4_0[4200101] = r6_0
r4_0[4200102] = {
  HatredIncrement = 40,
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_434,
  },
  TaskId = 4200102,
}
r4_0[4200103] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_436,
  TaskId = 4200103,
}
r6_0 = {
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 4200102,
    Direction = "Camera",
    Function = "CreateRayCreature",
    RayEndLoc = true,
  },
}
r6_0.TaskId = 4200104
r4_0[4200104] = r6_0
r5_0 = 4200105
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  BaseAttr = "ATK_Ranged",
  DamageTag = {
    "Ray",
    "Prop42001Ray"
  },
  Function = "Damage",
  Rate = 0.25,
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 4200105
r4_0[r5_0] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 4200101,
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_555,
}
r6_0.TaskId = 4200106
r4_0[4200106] = r6_0
r4_0[4200107] = {
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_large",
  TaskEffects = r0_0.RT_600,
  TaskId = 4200107,
}
r4_0[4200108] = {
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_large",
  TaskEffects = r0_0.RT_601,
  TaskId = 4200108,
}
r6_0 = {
  TargetFilter = "ShootingTargets",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 4200201,
    Direction = "Camera",
    Function = "CreateRayCreature",
  },
}
r6_0.TaskId = 4200201
r4_0[4200201] = r6_0
r5_0 = 4200202
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Target",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  BaseAttr = "ATK_Ranged",
  DamageTag = {
    "Ray",
    "Prop42002Ray"
  },
  Function = "Damage",
  Rate = 0.25,
}
r8_0[2] = r0_0.RT_453
r8_0[3] = {
  Function = "PlaySE",
  SEId = 2036,
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 4200202
r4_0[r5_0] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CheckRange = 50,
    CheckType = 3,
    Function = "FindTreasure",
    GuideCloseRange = 100,
    GuideDuration = 5,
    ScanAll = true,
  },
}
r6_0.TaskId = 4200203
r4_0[4200203] = r6_0
r4_0[8500111] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossXibi_Skill01_Whip01",
  TaskEffects = r0_0.RT_783,
  TaskId = 8500111,
}
r4_0[8500112] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossXibi_Skill01_Whip02",
  TaskEffects = r0_0.RT_784,
  TaskId = 8500112,
}
r4_0[8500113] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BossXibi_Dash_Whip01",
  TaskEffects = r0_0.RT_786,
  TaskId = 8500113,
}
r4_0[8500114] = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "BossXibi_Dash_Whip02",
  TaskEffects = r0_0.RT_787,
  TaskId = 8500114,
}
r4_0[8500115] = {
  NotifyName = r0_0.RT_405,
  TargetFilter = "BossXibi_Dash_Sword",
  TaskEffects = r0_0.RT_789,
  TaskId = 8500115,
}
r4_0[8500116] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_791,
  TaskId = 8500116,
}
r4_0[8500117] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_793,
  TaskId = 8500117,
}
r4_0[8500118] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_794,
  TaskId = 8500118,
}
r4_0[8500119] = {
  NotifyName = r0_0.RT_505,
  TaskEffects = r0_0.RT_798,
  TaskId = 8500119,
}
r4_0[8500121] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossXibi_Skill02_Sword01",
  TaskEffects = r0_0.RT_784,
  TaskId = 8500121,
}
r4_0[8500122] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossXibi_Skill02_Sword02",
  TaskEffects = r0_0.RT_783,
  TaskId = 8500122,
}
r4_0[8500123] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BossXibi_Dash_Whip01",
  TaskEffects = r0_0.RT_799,
  TaskId = 8500123,
}
r4_0[8500124] = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "BossXibi_Dash_Whip02",
  TaskEffects = r0_0.RT_799,
  TaskId = 8500124,
}
r4_0[8500125] = {
  NotifyName = r0_0.RT_405,
  TargetFilter = "BossXibi_Dash_Sword",
  TaskEffects = r0_0.RT_784,
  TaskId = 8500125,
}
r4_0[8500126] = {
  NotifyName = r0_0.RT_505,
  TaskEffects = r0_0.RT_798,
  TaskId = 8500126,
}
r4_0[8500131] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_768,
  TaskId = 8500131,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850031,
    Delay = 0.6,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_800,
    UseSaveLoc = "",
  },
}
r6_0.TaskId = 8500132
r4_0[8500132] = r6_0
r6_0 = {
  TargetFilter = "BossXibi_Skill03_Thunder",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    Delay = 0.1,
    Function = "Damage",
    Rate = 5,
  },
  [2] = r0_0.RT_801,
  [3] = r0_0.RT_802,
}
r6_0.TaskId = 8500133
r4_0[8500133] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850031,
    Delay = 0.6,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_800,
    UseSaveLoc = "FieldThunder101",
  },
  [2] = {
    CreatureId = 850031,
    Delay = 0.6,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_800,
    UseSaveLoc = "FieldThunder102",
  },
  [3] = {
    CreatureId = 850031,
    Delay = 0.6,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_800,
    UseSaveLoc = "FieldThunder103",
  },
  [4] = {
    CreatureId = 850031,
    Delay = 0.6,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_800,
    UseSaveLoc = "FieldThunder104",
  },
  [5] = {
    CreatureId = 850031,
    Delay = 0.6,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_800,
    UseSaveLoc = "FieldThunder105",
  },
  [6] = {
    CreatureId = 850031,
    Delay = 0.6,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_800,
    UseSaveLoc = "FieldThunder106",
  },
}
r6_0.TaskId = 8500134
r4_0[8500134] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850031,
    Delay = 0.6,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_800,
    UseSaveLoc = "FieldThunder201",
  },
  [2] = {
    CreatureId = 850031,
    Delay = 0.6,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_800,
    UseSaveLoc = "FieldThunder202",
  },
  [3] = {
    CreatureId = 850031,
    Delay = 0.6,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_800,
    UseSaveLoc = "FieldThunder203",
  },
  [4] = {
    CreatureId = 850031,
    Delay = 0.6,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_800,
    UseSaveLoc = "FieldThunder204",
  },
  [5] = {
    CreatureId = 850031,
    Delay = 0.6,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_800,
    UseSaveLoc = "FieldThunder205",
  },
  [6] = {
    CreatureId = 850031,
    Delay = 0.6,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_800,
    UseSaveLoc = "FieldThunder206",
  },
}
r6_0.TaskId = 8500135
r4_0[8500135] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850031,
    Delay = 0.6,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_800,
    UseSaveLoc = "FieldThunder301",
  },
  [2] = {
    CreatureId = 850031,
    Delay = 0.6,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_800,
    UseSaveLoc = "FieldThunder302",
  },
  [3] = {
    CreatureId = 850031,
    Delay = 0.6,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_800,
    UseSaveLoc = "FieldThunder303",
  },
  [4] = {
    CreatureId = 850031,
    Delay = 0.6,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_800,
    UseSaveLoc = "FieldThunder304",
  },
  [5] = {
    CreatureId = 850031,
    Delay = 0.6,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_800,
    UseSaveLoc = "FieldThunder305",
  },
  [6] = {
    CreatureId = 850031,
    Delay = 0.6,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_800,
    UseSaveLoc = "FieldThunder306",
  },
}
r6_0.TaskId = 8500136
r4_0[8500136] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850042,
    Direction = r0_0.RT_803,
    DirectionBase = "Creature",
    Function = "CreateSkillCreature",
  },
  [2] = {
    CreatureId = 850042,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_425,
  },
  [3] = {
    CreatureId = 850042,
    Direction = r0_0.RT_804,
    DirectionBase = "Creature",
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 8500141
r4_0[8500141] = r6_0
r4_0[8500142] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_806,
  TaskId = 8500142,
}
r6_0 = {
  TargetFilter = "BossXibi_Skill03_Thunder",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    Delay = 0.1,
    Function = "Damage",
    Rate = 3,
  },
  [2] = r0_0.RT_801,
  [3] = r0_0.RT_802,
}
r6_0.TaskId = 8500143
r4_0[8500143] = r6_0
r4_0[8500151] = {
  NotifyName = r0_0.RT_2,
  TaskEffects = r0_0.RT_808,
  TaskId = 8500151,
}
r4_0[8500152] = {
  TargetFilter = "Mon_Sphere_200_360",
  TaskEffects = r0_0.RT_810,
  TaskId = 8500152,
}
r4_0[8500161] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_812,
  TaskId = 8500161,
}
r4_0[8500162] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_814,
  TaskId = 8500162,
}
r4_0[8500163] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BossXibi_Skill06_Donut01",
  TaskEffects = r0_0.RT_816,
  TaskId = 8500163,
}
r4_0[8500164] = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "BossXibi_Skill06_Donut02",
  TaskEffects = r0_0.RT_816,
  TaskId = 8500164,
}
r4_0[8500165] = {
  NotifyName = r0_0.RT_405,
  TargetFilter = "BossXibi_Skill06_Donut03",
  TaskEffects = r0_0.RT_816,
  TaskId = 8500165,
}
r6_0 = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FixLocation = true,
    FormationId = 850061,
    Function = "CreateUnit",
    LifeTime = 6.15,
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 850061,
    UnitType = "MechanismSummon",
  },
}
r6_0.TaskId = 8500166
r4_0[8500166] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_405,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FixLocation = true,
    FormationId = 850061,
    Function = "CreateUnit",
    LifeTime = 5,
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 850062,
    UnitType = "MechanismSummon",
  },
}
r6_0.TaskId = 8500167
r4_0[8500167] = r6_0
r4_0[8500168] = {
  TargetFilter = "BossXibi_Skill06_Field01",
  TaskEffects = r0_0.RT_818,
  TaskId = 8500168,
}
r4_0[8500169] = {
  TargetFilter = "BossXibi_Skill06_Field02",
  TaskEffects = r0_0.RT_818,
  TaskId = 8500169,
}
r4_0[8500171] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossXibi_Skill07",
  TaskEffects = r0_0.RT_820,
  TaskId = 8500171,
}
r4_0[8500181] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossXibi_Dash_Whip01",
  TaskEffects = r0_0.RT_786,
  TaskId = 8500181,
}
r4_0[8500182] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossXibi_Dash_Whip02",
  TaskEffects = r0_0.RT_786,
  TaskId = 8500182,
}
r4_0[8500183] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BossXibi_Dash_Sword",
  TaskEffects = r0_0.RT_789,
  TaskId = 8500183,
}
r4_0[8500184] = {
  NotifyName = r0_0.RT_13,
  TaskEffects = r0_0.RT_798,
  TaskId = 8500184,
}
r4_0[8500185] = {
  NotifyName = r0_0.RT_405,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_768,
  TaskId = 8500185,
}
r4_0[8500186] = {
  NotifyName = r0_0.RT_505,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_812,
  TaskId = 8500186,
}
r4_0[8500187] = {
  NotifyName = r0_0.RT_821,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_824,
  TaskId = 8500187,
}
r4_0[8500188] = {
  NotifyName = r0_0.RT_825,
  TargetFilter = "BossXibi_Skill08_Jump",
  TaskEffects = {
    [1] = r0_0.RT_788,
    [2] = r0_0.RT_805,
    [3] = r0_0.RT_826,
    [4] = r0_0.RT_5,
  },
  TaskId = 8500188,
}
r4_0[8500191] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BossXibi_StageSkill_Donut01",
  TaskEffects = r0_0.RT_816,
  TaskId = 8500191,
}
r4_0[8500192] = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "BossXibi_StageSkill_Donut02",
  TaskEffects = r0_0.RT_816,
  TaskId = 8500192,
}
r4_0[8500193] = {
  NotifyName = r0_0.RT_405,
  TargetFilter = "BossXibi_StageSkill_Donut03",
  TaskEffects = r0_0.RT_816,
  TaskId = 8500193,
}
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FixLocation = true,
    FormationId = 850061,
    Function = "CreateUnit",
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 850063,
    UnitType = "MechanismSummon",
  },
}
r6_0.TaskId = 8500194
r4_0[8500194] = r6_0
r4_0[8500195] = {
  TargetFilter = "BossXibi_StageSkill_Field01",
  TaskEffects = r0_0.RT_828,
  TaskId = 8500195,
}
r6_0 = {
  NotifyName = r0_0.RT_405,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FixLocation = true,
    FormationId = 850061,
    Function = "CreateUnit",
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 850064,
    UnitType = "MechanismSummon",
  },
}
r6_0.TaskId = 8500196
r4_0[8500196] = r6_0
r4_0[8500197] = {
  TargetFilter = "BossXibi_StageSkill_Field02",
  TaskEffects = r0_0.RT_828,
  TaskId = 8500197,
}
r6_0 = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FixLocation = true,
    FormationId = 850061,
    Function = "CreateUnit",
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 850065,
    UnitType = "MechanismSummon",
  },
}
r6_0.TaskId = 8500198
r4_0[8500198] = r6_0
r4_0[8500199] = {
  TargetFilter = "BossXibi_StageSkill_Field03",
  TaskEffects = r0_0.RT_828,
  TaskId = 8500199,
}
r4_0[8501101] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossLizhan_Skill01_HalfCylinder",
  TaskEffects = r0_0.RT_833,
  TaskId = 8501101,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossLizhan_Skill02_Cylinder",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    DamageTag = r0_0.RT_829,
    Function = "Damage",
    Rate = 1.1,
  },
  [2] = r0_0.RT_834,
  [3] = r0_0.RT_835,
}
r6_0.TaskId = 8501102
r4_0[8501102] = r6_0
r4_0[8501106] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossLizhan_Skill02_Cylinder",
  TaskEffects = r0_0.RT_837,
  TaskId = 8501106,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850101,
    Function = "CreateSkillCreature",
  },
  [2] = {
    BaseChar = "Self",
    Function = "PlaySE",
    SEId = 850101,
  },
}
r6_0.TaskId = 8501111
r4_0[8501111] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    DamageTag = r0_0.RT_829,
    Function = "Damage",
    Rate = 1.25,
  },
  [2] = r0_0.RT_831,
  [3] = {
    FXId = 850103,
    Function = "PlayFX",
  },
  [4] = r0_0.RT_835,
}
r6_0.TaskId = 8501112
r4_0[8501112] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 850102,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
}
r6_0.TaskId = 8501113
r4_0[8501113] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossLizhan_Skill04_Cylinder",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    DamageTag = r0_0.RT_829,
    Function = "Damage",
    Rate = 0.8,
  },
  [2] = r0_0.RT_682,
  [3] = r0_0.RT_835,
}
r6_0.TaskId = 8501116
r4_0[8501116] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossLizhan_Skill04_HalfCylinder",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_838,
  [2] = {
    CauseHit = "BossLizhan_Skill04",
    Function = "CutToughness",
    Value = 100,
  },
  [3] = r0_0.RT_835,
}
r6_0.TaskId = 8501117
r4_0[8501117] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "EffectFunction",
    FunctionName = "LizhanTargetLocation_Skill05",
  },
  [2] = {
    CreatureId = 850102,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_241,
    SetSavelocAsTarget = "1",
  },
  [3] = {
    CreatureId = 850102,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_241,
    SetSavelocAsTarget = "2",
  },
  [4] = {
    CreatureId = 850102,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_241,
    SetSavelocAsTarget = "3",
  },
  [5] = {
    CreatureId = 850102,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_241,
    SetSavelocAsTarget = "4",
  },
  [6] = {
    CreatureId = 850102,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_241,
    SetSavelocAsTarget = "5",
  },
  [7] = {
    CreatureId = 850102,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_241,
    SetSavelocAsTarget = "6",
  },
}
r6_0.TaskId = 8501121
r4_0[8501121] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    DamageTag = r0_0.RT_829,
    Function = "Damage",
    Rate = 0.85,
  },
  [2] = r0_0.RT_782,
  [3] = r0_0.RT_839,
  [4] = r0_0.RT_835,
}
r6_0.TaskId = 8501122
r4_0[8501122] = r6_0
r6_0 = {
  TargetFilter = "BossLizhan_Skill05_Cylinder",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 850105,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
  [2] = r0_0.RT_840,
  [3] = r0_0.RT_835,
}
r6_0.TaskId = 8501123
r4_0[8501123] = r6_0
r4_0[8501124] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_20,
  TaskId = 8501124,
}
r4_0[8501131] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossLizhan_Skill04_Cylinder",
  TaskEffects = {
    [1] = r0_0.RT_841,
    [2] = r0_0.RT_831,
    [3] = r0_0.RT_835,
  },
  TaskId = 8501131,
}
r4_0[8501132] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossLizhan_Skill07_Cylinder_120",
  TaskEffects = {
    [1] = r0_0.RT_838,
    [2] = r0_0.RT_834,
    [3] = r0_0.RT_835,
  },
  TaskId = 8501132,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850103,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 8501133
r4_0[8501133] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850103,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 8501134
r4_0[8501134] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    DamageTag = r0_0.RT_829,
    Function = "Damage",
    Rate = 1.8,
  },
  [2] = {
    CauseHit = "BossLizhan_Skill07",
    Function = "CutToughness",
    Value = 100,
  },
  [3] = r0_0.RT_832,
}
r6_0.TaskId = 8501135
r4_0[8501135] = r6_0
r4_0[8501146] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossLizhan_Skill04_Cylinder",
  TaskEffects = {
    [1] = r0_0.RT_841,
    [2] = r0_0.RT_842,
    [3] = r0_0.RT_835,
  },
  TaskId = 8501146,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    DanmakuTemplateId = 850101,
    Duration = 15,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 8501147
r4_0[8501147] = r6_0
r4_0[8501148] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_836,
    [2] = r0_0.RT_839,
    [3] = r0_0.RT_835,
  },
  TaskId = 8501148,
}
r6_0 = {
  TargetFilter = "BossLizhan_Skill10_Cylinder",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 850107,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
  [2] = r0_0.RT_840,
  [3] = r0_0.RT_835,
}
r6_0.TaskId = 8501149
r4_0[8501149] = r6_0
r4_0[8501151] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_20,
  TaskId = 8501151,
}
r5_0 = 8501152
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  FixLocation = true,
  FixLocationEndZ = -2000,
  FixLocationStartZ = 0,
  Function = "SetSelfLoc",
  LocOffset = {
    0,
    0,
    230
  },
  TargetCenterLoc = "SavedLoc",
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 8501152
r4_0[r5_0] = r6_0
r4_0[8501153] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BossLizhan_Skill11_Cylinder",
  TaskEffects = r0_0.RT_837,
  TaskId = 8501153,
}
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 850308,
    Function = "AddBuff",
    LastTime = 99,
  },
}
r6_0.TaskId = 8501156
r4_0[8501156] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 850308,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 8501157
r4_0[8501157] = r6_0
r4_0[8501161] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossLizhan_Skill01_HalfCylinder",
  TaskEffects = r0_0.RT_833,
  TaskId = 8501161,
}
r4_0[8502101] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossSaiqi_Skill01_Cylinder_450_200_270",
  TaskEffects = r0_0.RT_845,
  TaskId = 8502101,
}
r4_0[8502102] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossSaiqi_Skill01_Cylinder_450_200_270",
  TaskEffects = r0_0.RT_848,
  TaskId = 8502102,
}
r4_0[8502103] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BossSaiqi_Skill01_Cylinder_450_200_270",
  TaskEffects = r0_0.RT_849,
  TaskId = 8502103,
}
r4_0[8502104] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_852,
  TaskId = 8502104,
}
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_16,
  [2] = r0_0.RT_110,
  [3] = {
    Function = "PlaySE",
    SEId = 850222,
  },
}
r6_0.TaskId = 8502105
r4_0[8502105] = r6_0
r4_0[8502106] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_854,
  TaskId = 8502106,
}
r4_0[8502107] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_856,
  TaskId = 8502107,
}
r4_0[8502108] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossSaiqi_Skill04_Cylinder_300_200_360",
  TaskEffects = r0_0.RT_857,
  TaskId = 8502108,
}
r4_0[8502109] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossSaiqi_Skill13_Cylinder_300_200_360",
  TaskEffects = r0_0.RT_859,
  TaskId = 8502109,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_860,
  [2] = {
    BuffId = 850210,
    Function = "AddBuff",
    LastTime = 9999,
  },
}
r6_0.TaskId = 8502110
r4_0[8502110] = r6_0
r4_0[8502111] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_865,
  TaskId = 8502111,
}
r4_0[8502112] = {
  NotifyName = r0_0.RT_866,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_872,
  TaskId = 8502112,
}
r4_0[8502113] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_875,
  TaskId = 8502113,
}
r4_0[8502114] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_878,
  TaskId = 8502114,
}
r4_0[8502115] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_881,
  TaskId = 8502115,
}
r4_0[8502116] = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_884,
  TaskId = 8502116,
}
r4_0[8502117] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_22,
    [2] = r0_0.RT_885,
  },
  TaskId = 8502117,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r8_0 = {
  [1] = r0_0.RT_886,
  [2] = r0_0.RT_888,
}
r8_0[3] = {
  Function = "EffectFunction",
  FunctionName = "RelativeLocationToTarget",
  Vars = {
    Distance = 600,
    Tag = 1,
    X = 200,
  },
}
r8_0[4] = {
  Function = "EffectFunction",
  FunctionName = "RelativeLocationToTarget",
  Vars = {
    Distance = 600,
    Tag = 2,
    X = -200,
  },
}
r6_0.TaskEffects = r8_0
r6_0.TaskId = 8502118
r4_0[8502118] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850218,
    Function = "CreateSkillCreature",
    UseSaveLoc = "",
  },
}
r6_0.TaskId = 8502119
r4_0[8502119] = r6_0
r4_0[8502120] = {
  TargetFilter = "BossSaiqi_Skill07_Cylinder_300_800_360",
  TaskEffects = r0_0.RT_890,
  TaskId = 8502120,
}
r4_0[8502121] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_891,
  TaskId = 8502121,
}
r4_0[8502122] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
  TaskEffects = {
    [1] = r0_0.RT_892,
    [2] = r0_0.RT_893,
  },
  TaskId = 8502122,
}
r4_0[8502123] = {
  TargetFilter = "Mon_Sphere_300_360",
  TaskEffects = r0_0.RT_894,
  TaskId = 8502123,
}
r6_0 = {
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "CreateUnit",
    LifeTime = 1.3,
    UnitId = 850281,
    UnitType = "MechanismSummon",
    UseSaveLoc = "08",
  },
}
r6_0.TaskId = 8502124
r4_0[8502124] = r6_0
r4_0[8502125] = {
  TargetFilter = "LaserTarget",
  TaskEffects = r0_0.RT_895,
  TaskId = 8502125,
}
r4_0[8502126] = {
  TargetFilter = "LaserTarget",
  TaskEffects = r0_0.RT_896,
  TaskId = 8502126,
}
r4_0[8502127] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_898,
  TaskId = 8502127,
}
r4_0[8502128] = {
  NotifyName = r0_0.RT_899,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_891,
  TaskId = 8502128,
}
r4_0[8502129] = {
  NotifyName = r0_0.RT_900,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_902,
  TaskId = 8502129,
}
r4_0[8502130] = {
  TargetFilter = "Mon_Sphere_300_360",
  TaskEffects = {
    [1] = r0_0.RT_779,
    [2] = r0_0.RT_903,
  },
  TaskId = 8502130,
}
r4_0[8502131] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_891,
  TaskId = 8502131,
}
r4_0[8502132] = {
  NotifyName = r0_0.RT_904,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_906,
  TaskId = 8502132,
}
r4_0[8502133] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Mon_Sphere_300_360",
  TaskEffects = r0_0.RT_907,
  TaskId = 8502133,
}
r4_0[8502134] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_908,
  TaskId = 8502134,
}
r4_0[8502135] = {
  NotifyName = r0_0.RT_909,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_911,
  TaskId = 8502135,
}
r4_0[8502136] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_913,
  TaskId = 8502136,
}
r4_0[8502137] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossSaiqi_Skill01_Cylinder_450_200_270",
  TaskEffects = r0_0.RT_914,
  TaskId = 8502137,
}
r4_0[8502138] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_891,
  TaskId = 8502138,
}
r4_0[8502139] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Mon_Sphere_300_360",
  TaskEffects = r0_0.RT_915,
  TaskId = 8502139,
}
r4_0[8502140] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Mon_Sphere_300_360",
  TaskEffects = r0_0.RT_916,
  TaskId = 8502140,
}
r4_0[8502141] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Sphere_600_360",
  TaskEffects = {
    [1] = r0_0.RT_577,
    [2] = r0_0.RT_322,
  },
  TaskId = 8502141,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850219,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 8502142
r4_0[8502142] = r6_0
r4_0[8502143] = {
  TargetFilter = "Mon_Sphere_600_360",
  TaskEffects = {
    [1] = r0_0.RT_33,
    [2] = r0_0.RT_322,
  },
  TaskId = 8502143,
}
r4_0[8502144] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_400_200_360",
  TaskEffects = {
    [1] = r0_0.RT_684,
    [2] = r0_0.RT_682,
    [3] = r0_0.RT_844,
  },
  TaskId = 8502144,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    DanmakuTemplateId = 850201,
    Duration = 3,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 8502145
r4_0[8502145] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_16,
  [2] = {
    Function = "PlaySE",
    SEId = 850219,
  },
}
r6_0.TaskId = 8502146
r4_0[8502146] = r6_0
r5_0 = 8502147
r6_0 = {
  NotifyName = {
    "hit1",
    "hit2",
    "hit3",
    "hit4",
    "hit5",
    "hit6"
  },
  TargetFilter = "BTTarget",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 850214,
  Function = "CreateSkillCreature",
  Location = {
    50,
    40,
    300
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 8502147
r4_0[r5_0] = r6_0
r4_0[8502148] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_33,
    [2] = r0_0.RT_885,
  },
  TaskId = 8502148,
}
r4_0[8502149] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_891,
  TaskId = 8502149,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r8_0 = {}
r8_0[1] = {
  Function = "EffectFunction",
  FunctionName = "SaveLoc",
  Vars = {
    Tag = 1,
    X = 700,
    Y = 0,
  },
}
r8_0[2] = {
  Function = "EffectFunction",
  FunctionName = "SaveLoc",
  Vars = {
    Tag = 2,
    X = -700,
    Y = 0,
  },
}
r8_0[3] = r0_0.RT_917
r8_0[4] = r0_0.RT_918
r8_0[5] = r0_0.RT_893
r6_0.TaskEffects = r8_0
r6_0.TaskId = 8502150
r4_0[8502150] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BTTarget",
}
r8_0 = {}
r8_0[1] = {
  Function = "EffectFunction",
  FunctionName = "SaveLoc",
  Vars = {
    Tag = 3,
    X = 0,
    Y = 700,
  },
}
r8_0[2] = {
  Function = "EffectFunction",
  FunctionName = "SaveLoc",
  Vars = {
    Tag = 4,
    X = 0,
    Y = -700,
  },
}
r8_0[3] = r0_0.RT_919
r8_0[4] = r0_0.RT_920
r6_0.TaskEffects = r8_0
r6_0.TaskId = 8502151
r4_0[8502151] = r6_0
r4_0[8502152] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
  TaskEffects = {
    [1] = r0_0.RT_758,
    [2] = r0_0.RT_893,
    [3] = r0_0.RT_917,
    [4] = r0_0.RT_918,
    [5] = r0_0.RT_919,
    [6] = r0_0.RT_920,
  },
  TaskId = 8502152,
}
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Self",
}
r8_0 = {
  [1] = r0_0.RT_886,
}
r8_0[2] = {
  Function = "EffectFunction",
  FunctionName = "SaveLoc",
  Vars = {
    Tag = 1,
    X = 2500,
  },
}
r8_0[3] = {
  Function = "EffectFunction",
  FunctionName = "SaveLoc",
  Vars = {
    Tag = 2,
    X = -2500,
  },
}
r8_0[4] = {
  Function = "EffectFunction",
  FunctionName = "SaveLoc",
  Vars = {
    Tag = 3,
    X = 1000,
  },
}
r8_0[5] = {
  Function = "EffectFunction",
  FunctionName = "SaveLoc",
  Vars = {
    Tag = 4,
    X = -1000,
  },
}
r6_0.TaskEffects = r8_0
r6_0.TaskId = 8502154
r4_0[8502154] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850220,
    Function = "CreateSkillCreature",
    UseSaveLoc = "1",
  },
  [2] = {
    CreatureId = 850220,
    Function = "CreateSkillCreature",
    UseSaveLoc = "2",
  },
}
r6_0.TaskId = 8502155
r4_0[8502155] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_405,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850221,
    Function = "CreateSkillCreature",
    UseSaveLoc = "3",
  },
  [2] = {
    CreatureId = 850221,
    Function = "CreateSkillCreature",
    UseSaveLoc = "4",
  },
}
r6_0.TaskId = 8502156
r4_0[8502156] = r6_0
r4_0[8502157] = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "BTTarget",
  TaskEffects = {
    [1] = r0_0.RT_921,
    [2] = r0_0.RT_922,
    [3] = r0_0.RT_892,
  },
  TaskId = 8502157,
}
r4_0[8502158] = {
  NotifyName = r0_0.RT_405,
  TargetFilter = "BTTarget",
  TaskEffects = {
    [1] = r0_0.RT_923,
    [2] = r0_0.RT_924,
  },
  TaskId = 8502158,
}
r4_0[8502159] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BTTarget",
  TaskEffects = {
    [1] = r0_0.RT_892,
    [2] = r0_0.RT_921,
    [3] = r0_0.RT_922,
    [4] = r0_0.RT_923,
    [5] = r0_0.RT_924,
  },
  TaskId = 8502159,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850222,
    Function = "CreateSkillCreature",
    UseSaveLoc = "",
  },
}
r6_0.TaskId = 8502160
r4_0[8502160] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FixLocation = true,
    FixLocationZ = 0,
    Function = "CreateUnit",
    LifeTime = 19,
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 850201,
    UnitType = "MechanismSummon",
  },
}
r6_0.TaskId = 8502161
r4_0[8502161] = r6_0
r5_0 = 8502162
r6_0 = {
  NotifyName = {
    "hit2",
    "hit4"
  },
  TargetFilter = "Self",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 850223,
  Function = "CreateSkillCreature",
  Location = {
    300,
    0,
    0
  },
}
r8_0[2] = {
  CreatureId = 850223,
  Function = "CreateSkillCreature",
  Location = {
    -300,
    0,
    0
  },
}
r8_0[3] = {
  CreatureId = 850223,
  Function = "CreateSkillCreature",
  Location = {
    0,
    300,
    0
  },
}
r8_0[4] = {
  CreatureId = 850223,
  Function = "CreateSkillCreature",
  Location = {
    0,
    -300,
    0
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 8502162
r4_0[r5_0] = r6_0
r5_0 = 8502163
r6_0 = {
  NotifyName = {
    "hit3",
    "hit5"
  },
  TargetFilter = "Self",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 850223,
  Function = "CreateSkillCreature",
  Location = {
    212,
    212,
    0
  },
}
r8_0[2] = {
  CreatureId = 850223,
  Function = "CreateSkillCreature",
  Location = {
    -212,
    212,
    0
  },
}
r8_0[3] = {
  CreatureId = 850223,
  Function = "CreateSkillCreature",
  Location = {
    212,
    -212,
    0
  },
}
r8_0[4] = {
  CreatureId = 850223,
  Function = "CreateSkillCreature",
  Location = {
    -212,
    -212,
    0
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 8502163
r4_0[r5_0] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_505,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850224,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 8502164
r4_0[8502164] = r6_0
r4_0[8502165] = {
  TargetFilter = "BossSaiqi_Skill23_Cylinder_1000_1000_360",
  TaskEffects = {
    [1] = r0_0.RT_33,
    [2] = r0_0.RT_780,
    [3] = r0_0.RT_322,
  },
  TaskId = 8502165,
}
r4_0[8503101] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossShijingzhe_Skill01_L",
  TaskEffects = r0_0.RT_929,
  TaskId = 8503101,
}
r4_0[8503106] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossShijingzhe_Skill01_R",
  TaskEffects = r0_0.RT_929,
  TaskId = 8503106,
}
r4_0[8503111] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossShijingzhe_Skill02_Cylinder01",
  TaskEffects = {
    [1] = r0_0.RT_7,
    [2] = r0_0.RT_930,
    [3] = r0_0.RT_927,
    [4] = r0_0.RT_928,
  },
  TaskId = 8503111,
}
r4_0[8503112] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossShijingzhe_Skill02_Cylinder02",
  TaskEffects = r0_0.RT_945,
  TaskId = 8503112,
}
r4_0[8503116] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_933,
  TaskId = 8503116,
}
r4_0[8503117] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_947,
  TaskId = 8503117,
}
r4_0[8503118] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossShijingzhe_Cylinder_320_250_360",
  TaskEffects = r0_0.RT_931,
  TaskId = 8503118,
}
r5_0 = 8503119
r6_0 = {
  NotifyName = r0_0.RT_9,
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 850307,
  Direction = {
    50,
    45,
    0
  },
  DirectionBase = "Creature",
  Function = "CreateSkillCreature",
  Location = r0_0.RT_948,
}
r8_0[2] = {
  CreatureId = 850307,
  Direction = {
    50,
    -45,
    0
  },
  DirectionBase = "Creature",
  Function = "CreateSkillCreature",
  Location = r0_0.RT_948,
}
r8_0[3] = {
  CreatureId = 850307,
  Direction = r0_0.RT_949,
  DirectionBase = "Creature",
  Function = "CreateSkillCreature",
  Location = r0_0.RT_948,
}
r8_0[4] = r0_0.RT_935
r6_0[r7_0] = r8_0
r6_0.TaskId = 8503119
r4_0[r5_0] = r6_0
r4_0[8503121] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossShijingzhe_Skill03_Cylinder_1000_200_360",
  TaskEffects = r0_0.RT_936,
  TaskId = 8503121,
}
r4_0[8503122] = {
  NotifyName = r0_0.RT_950,
  TargetFilter = "BossShijingzhe_Skill03_Cylinder_1000_200_360",
  TaskEffects = r0_0.RT_504,
  TaskId = 8503122,
}
r4_0[8503126] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_938,
  TaskId = 8503126,
}
r4_0[8503127] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_940,
  TaskId = 8503127,
}
r4_0[8503128] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossShijingzhe_Skill05_RushPillar",
  TaskEffects = r0_0.RT_952,
  TaskId = 8503128,
}
r4_0[8503129] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossShijingzhe_Cylinder_600_350_360",
  TaskEffects = {
    [1] = r0_0.RT_14,
    [2] = r0_0.RT_934,
    [3] = r0_0.RT_927,
    [4] = r0_0.RT_928,
  },
  TaskId = 8503129,
}
r4_0[8503131] = {
  NotifyName = r0_0.RT_2,
  TaskEffects = r0_0.RT_942,
  TaskId = 8503131,
}
r4_0[8503132] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossShijingzhe_Skill07_Cylinder01",
  TaskEffects = {
    [1] = r0_0.RT_22,
    [2] = r0_0.RT_926,
    [3] = r0_0.RT_927,
    [4] = r0_0.RT_953,
  },
  TaskId = 8503132,
}
r4_0[8503133] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BossShijingzhe_Skill07_Cylinder02",
  TaskEffects = {
    [1] = r0_0.RT_16,
    [2] = r0_0.RT_926,
    [3] = r0_0.RT_927,
    [4] = r0_0.RT_953,
  },
  TaskId = 8503133,
}
r4_0[8503134] = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "BossShijingzhe_Skill07_Cylinder03",
  TaskEffects = {
    [1] = r0_0.RT_680,
    [2] = r0_0.RT_934,
    [3] = r0_0.RT_927,
    [4] = r0_0.RT_953,
  },
  TaskId = 8503134,
}
r4_0[8503136] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_955,
    [2] = r0_0.RT_956,
    [3] = r0_0.RT_957,
    [4] = r0_0.RT_958,
  },
  TaskId = 8503136,
}
r4_0[8503137] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_962,
  TaskId = 8503137,
}
r4_0[8503138] = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_955,
    [2] = r0_0.RT_956,
    [3] = r0_0.RT_957,
    [4] = r0_0.RT_958,
    [5] = r0_0.RT_963,
  },
  TaskId = 8503138,
}
r4_0[8503139] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_962,
  TaskId = 8503139,
}
r4_0[8503140] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_955,
    [2] = r0_0.RT_956,
    [3] = r0_0.RT_968,
    [4] = r0_0.RT_963,
  },
  TaskId = 8503140,
}
r4_0[8503141] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_891,
  TaskId = 8503141,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r8_0 = {}
r8_0[1] = {
  Function = "EffectFunction",
  FunctionName = "RandomAreaLocation",
  Vars = {
    Distance = 600,
    MaxNum = 4,
    Radius = 1000,
  },
}
r8_0[2] = r0_0.RT_964
r8_0[3] = r0_0.RT_965
r8_0[4] = r0_0.RT_966
r8_0[5] = r0_0.RT_967
r6_0.TaskEffects = r8_0
r6_0.TaskId = 8503142
r4_0[8503142] = r6_0
r4_0[8503143] = {
  NotifyName = r0_0.RT_12,
  TaskEffects = r0_0.RT_973,
  TaskId = 8503143,
}
r4_0[8503144] = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "BossShijingzhe_Skill03_Cylinder_1000_200_360",
  TaskEffects = r0_0.RT_936,
  TaskId = 8503144,
}
r4_0[8503145] = {
  TargetFilter = "BossShijingzhe_Cylinder_1000_200_360",
  TaskEffects = {
    [1] = r0_0.RT_779,
    [2] = r0_0.RT_934,
    [3] = r0_0.RT_927,
    [4] = r0_0.RT_935,
  },
  TaskId = 8503145,
}
r4_0[8503146] = {
  NotifyName = r0_0.RT_2,
  TaskEffects = r0_0.RT_975,
  TaskId = 8503146,
}
r5_0 = 8503147
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 850306,
  Function = "CreateSkillCreature",
  Location = {
    0,
    0,
    850
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 8503147
r4_0[r5_0] = r6_0
r6_0 = {
  TargetFilter = "BossShijingzhe_Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_827,
  [2] = {
    CauseHit = "LightHit_60",
    Function = "CutToughness",
    Value = 30,
  },
  [3] = r0_0.RT_839,
  [4] = r0_0.RT_976,
  [5] = r0_0.RT_935,
}
r6_0.TaskId = 8503148
r4_0[8503148] = r6_0
r5_0 = 8503151
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 850316,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_242,
  Rotation = {
    10,
    50,
    0
  },
}
r8_0[2] = {
  CreatureId = 850316,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_242,
  Rotation = {
    10,
    -50,
    0
  },
}
r8_0[3] = {
  CreatureId = 850316,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_242,
  Rotation = r0_0.RT_804,
}
r8_0[4] = {
  CreatureId = 850316,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_242,
  Rotation = r0_0.RT_803,
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 8503151
r4_0[r5_0] = r6_0
r5_0 = 8503152
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 850316,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_242,
  Rotation = {
    23,
    -30,
    0
  },
}
r8_0[2] = {
  CreatureId = 850316,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_242,
  Rotation = {
    23,
    30,
    0
  },
}
r8_0[3] = {
  CreatureId = 850316,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_242,
  Rotation = {
    36,
    -30,
    0
  },
}
r8_0[4] = {
  CreatureId = 850316,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_242,
  Rotation = {
    36,
    30,
    0
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 8503152
r4_0[r5_0] = r6_0
r5_0 = 8503153
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BTTarget",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 850316,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_242,
  Rotation = {
    40,
    -40,
    0
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 8503153
r4_0[r5_0] = r6_0
r5_0 = 8503154
r6_0 = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "BTTarget",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 850316,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_242,
  Rotation = {
    50,
    60,
    0
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 8503154
r4_0[r5_0] = r6_0
r4_0[8503156] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossShijingzhe_Cylinder_skill12_L",
  TaskEffects = r0_0.RT_977,
  TaskId = 8503156,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850307,
    Direction = r0_0.RT_978,
    DirectionBase = "Creature",
    Function = "CreateSkillCreature",
    Location = r0_0.RT_979,
  },
  [2] = {
    CreatureId = 850307,
    Direction = r0_0.RT_980,
    DirectionBase = "Creature",
    Function = "CreateSkillCreature",
    Location = r0_0.RT_979,
  },
  [3] = {
    CreatureId = 850307,
    Direction = r0_0.RT_426,
    DirectionBase = "Creature",
    Function = "CreateSkillCreature",
    Location = r0_0.RT_979,
  },
}
r6_0.TaskId = 8503157
r4_0[8503157] = r6_0
r4_0[8503158] = {
  TargetFilter = "BossShijingzhe_Target",
  TaskEffects = {
    [1] = r0_0.RT_981,
    [2] = r0_0.RT_930,
    [3] = r0_0.RT_927,
    [4] = r0_0.RT_928,
  },
  TaskId = 8503158,
}
r4_0[8503161] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossShijingzhe_Cylinder_skill12_R",
  TaskEffects = r0_0.RT_977,
  TaskId = 8503161,
}
r5_0 = 8503162
r6_0 = {
  NotifyName = r0_0.RT_9,
}
r7_0 = "TaskEffects"
r8_0 = {
  [1] = {
    CreatureId = 850307,
    Direction = r0_0.RT_978,
    DirectionBase = "Creature",
    Function = "CreateSkillCreature",
    Location = r0_0.RT_982,
  },
}
r8_0[2] = {
  CreatureId = 850307,
  Direction = {
    -50,
    50,
    0
  },
  DirectionBase = "Creature",
  Function = "CreateSkillCreature",
  Location = r0_0.RT_982,
}
r8_0[3] = {
  CreatureId = 850307,
  Direction = r0_0.RT_425,
  DirectionBase = "Creature",
  Function = "CreateSkillCreature",
  Location = r0_0.RT_982,
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 8503162
r4_0[r5_0] = r6_0
r6_0 = {
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850308,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_983,
  },
  [2] = {
    CreatureId = 850309,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_983,
  },
  [3] = {
    CreatureId = 850310,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_983,
  },
  [4] = {
    CreatureId = 850311,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_983,
  },
}
r6_0.TaskId = 8503166
r4_0[8503166] = r6_0
r4_0[8503167] = {
  TargetFilter = "BossShijingzhe_Sphere_3000_360_NoMch",
  TaskEffects = {
    [1] = r0_0.RT_33,
    [2] = r0_0.RT_657,
    [3] = r0_0.RT_927,
    [4] = r0_0.RT_935,
  },
  TaskId = 8503167,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "Hp",
    DamageType = "TrueDamage",
    Function = "Damage",
    Rate = 0.075,
  },
}
r6_0.TaskId = 8503171
r4_0[8503171] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "Hp",
    DamageType = "TrueDamage",
    Function = "Damage",
    Rate = 0.11,
  },
}
r6_0.TaskId = 8503172
r4_0[8503172] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "Hp",
    DamageType = "TrueDamage",
    Function = "Damage",
    Rate = 0.16,
  },
}
r6_0.TaskId = 8503173
r4_0[8503173] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "Hp",
    DamageType = "TrueDamage",
    Function = "Damage",
    Rate = 0.3,
  },
}
r6_0.TaskId = 8503174
r4_0[8503174] = r6_0
r4_0[8503176] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_891,
  TaskId = 8503176,
}
r4_0[8503177] = {
  TargetFilter = "BossShijingzhe_Cylinder_600_200_360",
  TaskEffects = {
    [1] = r0_0.RT_16,
    [2] = r0_0.RT_984,
    [3] = r0_0.RT_927,
    [4] = r0_0.RT_935,
  },
  TaskId = 8503177,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossShijingzhe_Skill13_Howl",
}
r6_0.TaskEffects = {
  [1] = {
    CauseHit = "BossShijingzhe_Effect8503181",
    Function = "CutToughness",
    NotRotateWhenHit = true,
    Value = 10,
  },
}
r6_0.TaskId = 8503181
r4_0[8503181] = r6_0
r4_0[8503182] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossShijingzhe_Skill13_Select",
  TaskEffects = r0_0.RT_988,
  TaskId = 8503182,
}
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Boss_Grab_GetActorByEid",
}
r6_0.TaskEffects = {
  [1] = {
    CauseHit = "BossShijingzhe_Effect8503182",
    Function = "GrabHit",
  },
  [2] = r0_0.RT_496,
}
r6_0.TaskId = 8503183
r4_0[8503183] = r6_0
r4_0[8503184] = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "Boss_Grab_GetActorByEid",
  TaskEffects = r0_0.RT_989,
  TaskId = 8503184,
}
r4_0[8503185] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossShijingzhe_Skill13_Howl_Pillar",
  TaskEffects = r0_0.RT_952,
  TaskId = 8503185,
}
r4_0[8503186] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossShijingzhe_Skill11_Donut01",
  TaskEffects = r0_0.RT_990,
  TaskId = 8503186,
}
r4_0[8503187] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossShijingzhe_Skill11_Donut02",
  TaskEffects = r0_0.RT_990,
  TaskId = 8503187,
}
r4_0[8503188] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BossShijingzhe_Skill11_Donut03",
  TaskEffects = r0_0.RT_990,
  TaskId = 8503188,
}
r4_0[8503191] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_891,
  TaskId = 8503191,
}
r4_0[8503192] = {
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_955,
    [2] = r0_0.RT_956,
    [3] = r0_0.RT_958,
  },
  TaskId = 8503192,
}
r4_0[8503193] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_962,
  TaskId = 8503193,
}
r4_0[8503194] = {
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_955,
    [2] = r0_0.RT_956,
    [3] = r0_0.RT_959,
    [4] = r0_0.RT_958,
    [5] = r0_0.RT_961,
  },
  TaskId = 8503194,
}
r4_0[8503195] = {
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_955,
    [2] = r0_0.RT_968,
    [3] = r0_0.RT_957,
    [4] = r0_0.RT_960,
    [5] = r0_0.RT_963,
  },
  TaskId = 8503195,
}
r4_0[8503196] = {
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_891,
  TaskId = 8503196,
}
r6_0 = {
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850312,
    Function = "CreateSkillCreature",
    UseSaveLoc = "",
  },
}
r6_0.TaskId = 8503197
r4_0[8503197] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_505,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 850309,
    Function = "AddBuff",
    LastTime = 5.7,
  },
}
r6_0.TaskId = 8503198
r4_0[8503198] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 850313,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 8503201
r4_0[8503201] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_821,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "InactiveStaticCreator",
    StaticCreatorId = 1440065,
  },
}
r6_0.TaskId = 8503202
r4_0[8503202] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 850312,
    Function = "AddBuff",
    LastTime = -1,
  },
  [2] = {
    Function = "ActiveStaticCreator",
    StaticCreatorId = 1440065,
  },
}
r6_0.TaskId = 8503203
r4_0[8503203] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_821,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 850312,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 8503204
r4_0[8503204] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 850310,
    Function = "AddBuff",
    LastTime = 31,
  },
  [2] = r0_0.RT_991,
}
r6_0.TaskId = 8503205
r4_0[8503205] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_13,
}
r6_0.TaskEffects = {
  [1] = {
    DanmakuTemplateId = 850305,
    Duration = 11,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 8503206
r4_0[8503206] = r6_0
r4_0[8503207] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_778,
    [2] = r0_0.RT_110,
    [3] = r0_0.RT_953,
  },
  TaskId = 8503207,
}
r4_0[8503208] = {
  NotifyName = r0_0.RT_405,
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_994,
    [2] = r0_0.RT_994,
    [3] = r0_0.RT_994,
    [4] = r0_0.RT_994,
  },
  TaskId = 8503208,
}
r6_0 = {
  NotifyName = r0_0.RT_505,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Camp = "Enemy",
    Function = "CreateUnit",
    LifeTime = 34,
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 850316,
    UnitType = "MechanismSummon",
    UseSaveLoc = "SJZ_Skill15_Pillar",
  },
  [2] = {
    CreatureId = 850327,
    Function = "CreateSkillCreature",
    UseSaveLoc = "SJZ_Skill15_Pillar",
  },
}
r6_0.TaskId = 8503209
r4_0[8503209] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850325,
    Function = "CreateSkillCreature",
  },
  [2] = {
    CreatureId = 850328,
    Function = "CreateSkillCreature",
  },
  [3] = {
    CreatureId = 850329,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 8503210
r4_0[8503210] = r6_0
r6_0 = {
  TargetFilter = "BossShijingzhe_Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    Function = "Damage",
    Rate = 7.3,
  },
  [2] = r0_0.RT_935,
}
r6_0.TaskId = 8503211
r4_0[8503211] = r6_0
r6_0 = {
  TargetFilter = "BossShijingzhe_Skill15Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHp",
    BaseChar = "Target",
    DamageType = "TrueDamage",
    Function = "Damage",
    Rate = 1,
  },
  [2] = r0_0.RT_935,
}
r6_0.TaskId = 8503212
r4_0[8503212] = r6_0
r5_0 = 8503213
r6_0 = {
  NotifyName = r0_0.RT_821,
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 850326,
  Function = "CreateSkillCreature",
  Location = {
    52.2936,
    597.717,
    0
  },
  Rotation = {
    0,
    5,
    0
  },
}
r8_0[2] = {
  CreatureId = 850326,
  Function = "CreateSkillCreature",
  Location = {
    155.2914,
    579.5556,
    0
  },
  Rotation = r0_0.RT_141,
}
r8_0[3] = {
  CreatureId = 850326,
  Function = "CreateSkillCreature",
  Location = {
    253.5708,
    543.7842,
    0
  },
  Rotation = r0_0.RT_423,
}
r8_0[4] = {
  CreatureId = 850326,
  Function = "CreateSkillCreature",
  Location = {
    344.1456,
    491.4912,
    0
  },
  Rotation = {
    0,
    35,
    0
  },
}
r8_0[5] = {
  CreatureId = 850326,
  Function = "CreateSkillCreature",
  Location = {
    424.2642,
    424.2642,
    0
  },
  Rotation = r0_0.RT_174,
}
r8_0[6] = {
  CreatureId = 850326,
  Function = "CreateSkillCreature",
  Location = {
    491.4912,
    344.1456,
    0
  },
  Rotation = {
    0,
    55,
    0
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 8503213
r4_0[r5_0] = r6_0
r5_0 = 8503214
r6_0 = {
  NotifyName = r0_0.RT_821,
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 850326,
  Function = "CreateSkillCreature",
  Location = {
    543.7842,
    253.5708,
    0
  },
  Rotation = {
    0,
    65,
    0
  },
}
r8_0[2] = {
  CreatureId = 850326,
  Function = "CreateSkillCreature",
  Location = {
    579.5556,
    155.2914,
    0
  },
  Rotation = r0_0.RT_427,
}
r8_0[3] = {
  CreatureId = 850326,
  Function = "CreateSkillCreature",
  Location = {
    597.717,
    52.2936,
    0
  },
  Rotation = {
    0,
    85,
    0
  },
}
r8_0[4] = {
  CreatureId = 850326,
  Function = "CreateSkillCreature",
  Location = {
    597.717,
    -52.2936,
    0
  },
  Rotation = {
    0,
    95,
    0
  },
}
r8_0[5] = {
  CreatureId = 850326,
  Function = "CreateSkillCreature",
  Location = {
    579.5556,
    -155.2914,
    0
  },
  Rotation = {
    0,
    105,
    0
  },
}
r8_0[6] = {
  CreatureId = 850326,
  Function = "CreateSkillCreature",
  Location = {
    543.7842,
    -253.5708,
    0
  },
  Rotation = {
    0,
    115,
    0
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 8503214
r4_0[r5_0] = r6_0
r5_0 = 8503215
r6_0 = {
  NotifyName = r0_0.RT_821,
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 850326,
  Function = "CreateSkillCreature",
  Location = {
    491.4912,
    -344.1456,
    0
  },
  Rotation = {
    0,
    125,
    0
  },
}
r8_0[2] = {
  CreatureId = 850326,
  Function = "CreateSkillCreature",
  Location = {
    424.2642,
    -424.2642,
    0
  },
  Rotation = r0_0.RT_360,
}
r8_0[3] = {
  CreatureId = 850326,
  Function = "CreateSkillCreature",
  Location = {
    344.1456,
    -491.4912,
    0
  },
  Rotation = {
    0,
    145,
    0
  },
}
r8_0[4] = {
  CreatureId = 850326,
  Function = "CreateSkillCreature",
  Location = {
    253.5708,
    -543.7842,
    0
  },
  Rotation = {
    0,
    155,
    0
  },
}
r8_0[5] = {
  CreatureId = 850326,
  Function = "CreateSkillCreature",
  Location = {
    155.2914,
    -579.5556,
    0
  },
  Rotation = {
    0,
    165,
    0
  },
}
r8_0[6] = {
  CreatureId = 850326,
  Function = "CreateSkillCreature",
  Location = {
    52.2936,
    -597.717,
    0
  },
  Rotation = {
    0,
    175,
    0
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 8503215
r4_0[r5_0] = r6_0
r5_0 = 8503216
r6_0 = {
  NotifyName = r0_0.RT_821,
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 850326,
  Function = "CreateSkillCreature",
  Location = {
    -52.2936,
    -597.717,
    0
  },
  Rotation = {
    0,
    -175,
    0
  },
}
r8_0[2] = {
  CreatureId = 850326,
  Function = "CreateSkillCreature",
  Location = {
    -155.2914,
    -579.5556,
    0
  },
  Rotation = {
    0,
    -165,
    0
  },
}
r8_0[3] = {
  CreatureId = 850326,
  Function = "CreateSkillCreature",
  Location = {
    -253.5708,
    -543.7842,
    0
  },
  Rotation = {
    0,
    -155,
    0
  },
}
r8_0[4] = {
  CreatureId = 850326,
  Function = "CreateSkillCreature",
  Location = {
    -344.1456,
    -491.4912,
    0
  },
  Rotation = {
    0,
    -145,
    0
  },
}
r8_0[5] = {
  CreatureId = 850326,
  Function = "CreateSkillCreature",
  Location = {
    -424.2642,
    -424.2642,
    0
  },
  Rotation = r0_0.RT_361,
}
r8_0[6] = {
  CreatureId = 850326,
  Function = "CreateSkillCreature",
  Location = {
    -491.4912,
    -344.1456,
    0
  },
  Rotation = {
    0,
    -125,
    0
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 8503216
r4_0[r5_0] = r6_0
r5_0 = 8503217
r6_0 = {
  NotifyName = r0_0.RT_821,
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 850326,
  Function = "CreateSkillCreature",
  Location = {
    -543.7842,
    -253.5708,
    0
  },
  Rotation = {
    0,
    -115,
    0
  },
}
r8_0[2] = {
  CreatureId = 850326,
  Function = "CreateSkillCreature",
  Location = {
    -579.5556,
    -155.2914,
    0
  },
  Rotation = {
    0,
    -105,
    0
  },
}
r8_0[3] = {
  CreatureId = 850326,
  Function = "CreateSkillCreature",
  Location = {
    -597.717,
    -52.2936,
    0
  },
  Rotation = {
    0,
    -95,
    0
  },
}
r8_0[4] = {
  CreatureId = 850326,
  Function = "CreateSkillCreature",
  Location = {
    -597.717,
    52.2936,
    0
  },
  Rotation = {
    0,
    -85,
    0
  },
}
r8_0[5] = {
  CreatureId = 850326,
  Function = "CreateSkillCreature",
  Location = {
    -579.5556,
    155.2914,
    0
  },
  Rotation = r0_0.RT_428,
}
r8_0[6] = {
  CreatureId = 850326,
  Function = "CreateSkillCreature",
  Location = {
    -543.7842,
    253.5708,
    0
  },
  Rotation = {
    0,
    -65,
    0
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 8503217
r4_0[r5_0] = r6_0
r5_0 = 8503218
r6_0 = {
  NotifyName = r0_0.RT_821,
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 850326,
  Function = "CreateSkillCreature",
  Location = {
    -491.4912,
    344.1456,
    0
  },
  Rotation = {
    0,
    -55,
    0
  },
}
r8_0[2] = {
  CreatureId = 850326,
  Function = "CreateSkillCreature",
  Location = {
    -424.2642,
    424.2642,
    0
  },
  Rotation = r0_0.RT_359,
}
r8_0[3] = {
  CreatureId = 850326,
  Function = "CreateSkillCreature",
  Location = {
    -344.1456,
    491.4912,
    0
  },
  Rotation = {
    0,
    -35,
    0
  },
}
r8_0[4] = {
  CreatureId = 850326,
  Function = "CreateSkillCreature",
  Location = {
    -253.5708,
    543.7842,
    0
  },
  Rotation = r0_0.RT_424,
}
r8_0[5] = {
  CreatureId = 850326,
  Function = "CreateSkillCreature",
  Location = {
    -155.2914,
    579.5556,
    0
  },
  Rotation = r0_0.RT_140,
}
r8_0[6] = {
  CreatureId = 850326,
  Function = "CreateSkillCreature",
  Location = {
    -52.2936,
    597.717,
    0
  },
  Rotation = {
    0,
    -5,
    0
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 8503218
r4_0[r5_0] = r6_0
r6_0 = {
  TargetFilter = "BossShijingzhe_Skill15Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHp",
    BaseChar = "Target",
    DamageType = "TrueDamage",
    Function = "Damage",
    Rate = 0.07,
  },
  [2] = r0_0.RT_935,
}
r6_0.TaskId = 8503219
r4_0[8503219] = r6_0
r4_0[8503220] = {
  NotifyName = {
    "hit93"
  },
  TargetFilter = "BossShijingzhe_Skill15_ClearPillar",
  TaskEffects = r0_0.RT_952,
  TaskId = 8503220,
}
r5_0 = 8503221
r6_0 = {
  NotifyName = {
    "hit94"
  },
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 850313,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 8503221
r4_0[r5_0] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r8_0 = {}
r8_0[1] = {
  AttrRates = {
    MaxHp = 1,
  },
  Function = "CreateUnit",
  LifeTime = 35,
  MaxSummonCount = 1,
  SingleSummonCount = 1,
  UnitId = 850315,
  UnitType = "MechanismSummon",
}
r6_0.TaskEffects = r8_0
r6_0.TaskId = 8503222
r4_0[8503222] = r6_0
r4_0[8505101] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossLianhuo_Skill01_Cylinder_01",
  TaskEffects = r0_0.RT_1020,
  TaskId = 8505101,
}
r4_0[8505102] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossLianhuo_Skill01_Cylinder_02",
  TaskEffects = r0_0.RT_1021,
  TaskId = 8505102,
}
r4_0[8505103] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BossLianhuo_Skill01_Cylinder_02",
  TaskEffects = {
    [1] = r0_0.RT_16,
    [2] = r0_0.RT_550,
    [3] = r0_0.RT_1029,
  },
  TaskId = 8505103,
}
r4_0[8505104] = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "BossLianhuo_Skill01_Cross",
  TaskEffects = r0_0.RT_1030,
  TaskId = 8505104,
}
r4_0[8505105] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossLianhuo_Skill02_Cylinder_01",
  TaskEffects = r0_0.RT_1022,
  TaskId = 8505105,
}
r4_0[8505106] = {
  NotifyName = r0_0.RT_1023,
  TargetFilter = "BossLianhuo_Skill02_Cylinder_02",
  TaskEffects = r0_0.RT_1024,
  TaskId = 8505106,
}
r4_0[8505107] = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "BossLianhuo_Skill02_Cylinder_03",
  TaskEffects = r0_0.RT_1025,
  TaskId = 8505107,
}
r4_0[8505108] = {
  NotifyName = r0_0.RT_405,
  TargetFilter = "BossLianhuo_Skill02_Cylinder_03",
  TaskEffects = r0_0.RT_1026,
  TaskId = 8505108,
}
r4_0[8505109] = {
  NotifyName = r0_0.RT_505,
  TargetFilter = "BossLianhuo_Skill01_Cross",
  TaskEffects = r0_0.RT_1030,
  TaskId = 8505109,
}
r4_0[8505110] = {
  NotifyName = r0_0.RT_821,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_812,
  TaskId = 8505110,
}
r4_0[8505111] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossLianhuo_Skill03_Cylinder",
  TaskEffects = r0_0.RT_1028,
  TaskId = 8505111,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 850501,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 8505112
r4_0[8505112] = r6_0
r4_0[8505113] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_891,
  TaskId = 8505113,
}
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850511,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "Skill03Target",
    UseSaveLoc = "SelfLoc",
  },
}
r6_0.TaskId = 8505114
r4_0[8505114] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_33,
  [2] = {
    FixLocation = true,
    Function = "CreateUnit",
    LifeTime = 5,
    MaxSummonCount = 3,
    SingleSummonCount = 1,
    UnitId = 850502,
    UnitType = "MechanismSummon",
  },
  [3] = r0_0.RT_1027,
}
r6_0.TaskId = 8505115
r4_0[8505115] = r6_0
r4_0[8505116] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_1032,
  TaskId = 8505116,
}
r6_0 = {
  NotifyName = r0_0.RT_1023,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_1034,
  [2] = {
    CreatureId = 850502,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_1033,
    Rotation = r0_0.RT_174,
    UseRelativeOffset = true,
    UseSaveLoc = "First1",
  },
  [3] = {
    CreatureId = 850502,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_1033,
    Rotation = r0_0.RT_174,
    UseRelativeOffset = true,
    UseSaveLoc = "First2",
  },
}
r6_0.TaskId = 8505117
r4_0[8505117] = r6_0
r4_0[8505118] = {
  TargetFilter = "Mon_Cylinder_300_200_360",
  TaskEffects = r0_0.RT_1035,
  TaskId = 8505118,
}
r4_0[8505119] = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_1038,
  TaskId = 8505119,
}
r4_0[8505120] = {
  NotifyName = r0_0.RT_405,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_1040,
  TaskId = 8505120,
}
r4_0[8505121] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_1043,
  TaskId = 8505121,
}
r4_0[8505122] = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "BossLianhuo_Skill02_Cylinder_03",
  TaskEffects = r0_0.RT_1025,
  TaskId = 8505122,
}
r4_0[8505123] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_891,
  TaskId = 8505123,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850513,
    Function = "CreateSkillCreature",
    UseSaveLoc = "",
  },
}
r6_0.TaskId = 8505124
r4_0[8505124] = r6_0
r4_0[8505125] = {
  TargetFilter = "BossLianhuo_Skill05_Cross",
  TaskEffects = r0_0.RT_1035,
  TaskId = 8505125,
}
r4_0[8505126] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossLianhuo_Skill06_Cylinder",
  TaskEffects = r0_0.RT_1044,
  TaskId = 8505126,
}
r4_0[8505127] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_1050,
  TaskId = 8505127,
}
r4_0[8505128] = {
  TargetFilter = "BossLianhuo_Skill06_Cylinder_02",
  TaskEffects = {
    [1] = r0_0.RT_1018,
    [2] = r0_0.RT_1027,
    [3] = r0_0.RT_1029,
    [4] = r0_0.RT_700,
  },
  TaskId = 8505128,
}
r4_0[8505129] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BossLianhuo_Skill06_Cylinder",
  TaskEffects = r0_0.RT_1051,
  TaskId = 8505129,
}
r4_0[8505130] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_768,
  TaskId = 8505130,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850506,
    Function = "CreateSkillCreature",
    UseSaveLoc = "",
  },
}
r6_0.TaskId = 8505131
r4_0[8505131] = r6_0
r4_0[8505132] = {
  TargetFilter = "BossLianhuo_Skill07_Select",
  TaskEffects = r0_0.RT_988,
  TaskId = 8505132,
}
r4_0[8505133] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BossLianhuo_Skill07_GetActor",
  TaskEffects = r0_0.RT_1053,
  TaskId = 8505133,
}
r4_0[8505134] = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "BossLianhuo_Skill07_GetActor",
  TaskEffects = r0_0.RT_989,
  TaskId = 8505134,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ActiveStaticCreator",
    StaticCreatorId = 1660122,
  },
  [2] = r0_0.RT_1015,
}
r6_0.TaskId = 8505135
r4_0[8505135] = r6_0
r4_0[8505136] = {
  NotifyName = r0_0.RT_1054,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_1056,
  TaskId = 8505136,
}
r4_0[8505137] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_1058,
  TaskId = 8505137,
}
r4_0[8505138] = {
  NotifyName = r0_0.RT_1059,
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_1061,
  TaskId = 8505138,
}
r4_0[8505139] = {
  NotifyName = {
    "hit15",
    "hit1",
    "hit22"
  },
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_891,
  TaskId = 8505139,
}
r4_0[8505140] = {
  NotifyName = r0_0.RT_1062,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_1064,
  TaskId = 8505140,
}
r4_0[8505141] = {
  NotifyName = r0_0.RT_1065,
  TargetFilter = "BossLianhuo_Skill08_Cylinder",
  TaskEffects = r0_0.RT_1044,
  TaskId = 8505141,
}
r4_0[8505142] = {
  NotifyName = r0_0.RT_1066,
  TargetFilter = "AlmostAllEnemy",
  TaskEffects = r0_0.RT_1067,
  TaskId = 8505142,
}
r6_0 = {
  NotifyName = r0_0.RT_1066,
  TargetFilter = "AlmostAllEnemy",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "InactiveStaticCreator",
    StaticCreatorId = 1660122,
  },
  [2] = r0_0.RT_1068,
}
r6_0.TaskId = 8505143
r4_0[8505143] = r6_0
r4_0[8505144] = {
  NotifyName = r0_0.RT_1069,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_1072,
  TaskId = 8505144,
}
r4_0[8505145] = {
  NotifyName = r0_0.RT_1073,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_1077,
  TaskId = 8505145,
}
r4_0[8505146] = {
  NotifyName = r0_0.RT_1078,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_1080,
  TaskId = 8505146,
}
r4_0[8505147] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_817,
    [2] = r0_0.RT_1019,
  },
  TaskId = 8505147,
}
r4_0[8505148] = {
  NotifyName = {
    "hit27"
  },
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_1081,
  },
  TaskId = 8505148,
}
r4_0[8505149] = {
  NotifyName = r0_0.RT_1082,
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_1083,
  },
  TaskId = 8505149,
}
r4_0[8505150] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_1084,
  TaskId = 8505150,
}
r4_0[8505151] = {
  TargetFilter = "Mon_Sphere_200_360",
  TaskEffects = r0_0.RT_1084,
  TaskId = 8505151,
}
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850517,
    Function = "CreateSkillCreature",
    UseSaveLoc = "",
  },
}
r6_0.TaskId = 8505152
r4_0[8505152] = r6_0
r4_0[8505153] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossLianhuo_Skill12_Rectangle",
  TaskEffects = r0_0.RT_1085,
  TaskId = 8505153,
}
r4_0[8505154] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossLianhuo_Skill02_Cylinder_01",
  TaskEffects = r0_0.RT_1087,
  TaskId = 8505154,
}
r4_0[8505155] = {
  NotifyName = r0_0.RT_1088,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_1090,
  TaskId = 8505155,
}
r6_0 = {
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    FixLocationEndZ = -3500,
    Function = "SaveLoc",
    IsOnGround = true,
    Tag = "FirePool",
    TargetType = "Target",
  },
}
r6_0.TaskId = 8505156
r4_0[8505156] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r8_0 = {}
r8_0[1] = {
  Function = "EffectFunction",
  FunctionName = "RandomAreaLocation",
  Vars = {
    Distance = 850,
    MaxNum = 3,
    Radius = 1300,
    Tag = "FirePool",
  },
}
r6_0.TaskEffects = r8_0
r6_0.TaskId = 8505157
r4_0[8505157] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850512,
    Function = "CreateSkillCreature",
    UseSaveLoc = "3",
  },
  [2] = {
    CreatureId = 850512,
    Function = "CreateSkillCreature",
    UseSaveLoc = "FirePool",
  },
  [3] = {
    CreatureId = 850512,
    Function = "CreateSkillCreature",
    UseSaveLoc = "1",
  },
  [4] = {
    CreatureId = 850512,
    Function = "CreateSkillCreature",
    UseSaveLoc = "2",
  },
  [5] = {
    Function = "PlaySE",
    SEId = 850514,
    SceneSe = true,
  },
}
r6_0.TaskId = 8505158
r4_0[8505158] = r6_0
r6_0 = {
  TargetFilter = "Mon_Cylinder_400_200_360",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    Function = "Damage",
    Rate = 0.025,
  },
}
r6_0.TaskId = 8505159
r4_0[8505159] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850512,
    Function = "CreateSkillCreature",
    UseSaveLoc = "",
  },
}
r6_0.TaskId = 8505160
r4_0[8505160] = r6_0
r4_0[8505161] = {
  NotifyName = {
    "hit28"
  },
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_1050,
  TaskId = 8505161,
}
r5_0 = 8505162
r6_0 = {
  NotifyName = r0_0.RT_12,
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 850516,
  Function = "CreateSkillCreature",
  Location = {
    190,
    0,
    -270
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 8505162
r4_0[r5_0] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 850518,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Skill03Target",
  },
}
r6_0.TaskId = 8505163
r4_0[8505163] = r6_0
r4_0[8512901] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossLinen_Skill01",
  TaskEffects = {
    [1] = r0_0.RT_3,
    [2] = r0_0.RT_1142,
  },
  TaskId = 8512901,
}
r4_0[8512906] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_1163,
  TaskId = 8512906,
}
r4_0[8512907] = {
  TargetFilter = "BossLinen_Skill02_Scene",
  TaskEffects = {
    [1] = r0_0.RT_496,
    [2] = r0_0.RT_1146,
    [3] = r0_0.RT_1147,
  },
  TaskId = 8512907,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 8512902,
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_1164,
  [3] = {
    CreatureId = 8512904,
    Delay = 0.333,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 8512911
r4_0[8512911] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 8512905,
    Function = "CreateSkillCreature",
  },
  [2] = {
    CreatureId = 8512906,
    Delay = 0.167,
    Function = "CreateSkillCreature",
  },
  [3] = {
    CreatureId = 8512907,
    Delay = 0.333,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 8512912
r4_0[8512912] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 8512928,
    Function = "CreateSkillCreature",
  },
  [2] = {
    CreatureId = 8512929,
    Function = "CreateSkillCreature",
  },
  [3] = {
    CreatureId = 8512902,
    Delay = 0.033,
    Function = "CreateSkillCreature",
  },
  [4] = {
    CreatureId = 8512906,
    Delay = 0.067,
    Function = "CreateSkillCreature",
  },
  [5] = {
    CreatureId = 8512905,
    Delay = 0.1,
    Function = "CreateSkillCreature",
  },
  [6] = {
    CreatureId = 8512904,
    Delay = 0.133,
    Function = "CreateSkillCreature",
  },
  [7] = r0_0.RT_1164,
  [8] = {
    CreatureId = 8512907,
    Delay = 0.2,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 8512913
r4_0[8512913] = r6_0
r4_0[8512914] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_496,
    [2] = r0_0.RT_1150,
    [3] = r0_0.RT_1147,
  },
  TaskId = 8512914,
}
r4_0[8512915] = {
  TargetFilter = "BossLinen_Skill03_Scene1",
  TaskEffects = {
    [1] = r0_0.RT_1151,
    [2] = r0_0.RT_496,
    [3] = r0_0.RT_1147,
  },
  TaskId = 8512915,
}
r4_0[8512956] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_1163,
  TaskId = 8512956,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 8512931,
    Function = "CreateSkillCreature",
  },
  [2] = {
    CreatureId = 8512932,
    Delay = 0.04,
    Function = "CreateSkillCreature",
  },
  [3] = {
    CreatureId = 8512933,
    Delay = 0.08,
    Function = "CreateSkillCreature",
  },
  [4] = {
    CreatureId = 8512934,
    Delay = 0.12,
    Function = "CreateSkillCreature",
  },
  [5] = {
    CreatureId = 8512935,
    Delay = 0.16,
    Function = "CreateSkillCreature",
  },
  [6] = {
    CreatureId = 8512936,
    Delay = 0.2,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 8512991
r4_0[8512991] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 8512937,
    Function = "CreateSkillCreature",
  },
  [2] = {
    CreatureId = 8512938,
    Delay = 0.04,
    Function = "CreateSkillCreature",
  },
  [3] = {
    CreatureId = 8512939,
    Delay = 0.08,
    Function = "CreateSkillCreature",
  },
  [4] = {
    CreatureId = 8512940,
    Delay = 0.12,
    Function = "CreateSkillCreature",
  },
  [5] = {
    CreatureId = 8512941,
    Delay = 0.16,
    Function = "CreateSkillCreature",
  },
  [6] = {
    CreatureId = 8512942,
    Delay = 0.2,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 8512992
r4_0[8512992] = r6_0
r4_0[8520100] = {
  TaskEffects = r0_0.RT_1107,
  TaskId = 8520100,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 8520009,
    UnitType = "Monster",
  },
  [2] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 8520010,
    UnitType = "Monster",
  },
}
r6_0.TaskId = 8520101
r4_0[8520101] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BattlePointID = 85201107,
    Function = "SetSelfLoc",
    TargetCenterLoc = "BattlePoint",
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 8520102
r4_0[8520102] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BattlePointID = 85201108,
    Function = "SetSelfLoc",
    TargetCenterLoc = "BattlePoint",
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 8520103
r4_0[8520103] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BattlePointID = 85201109,
    Function = "SetSelfLoc",
    TargetCenterLoc = "BattlePoint",
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 8520104
r4_0[8520104] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BattlePointID = 85201110,
    Function = "SetSelfLoc",
    TargetCenterLoc = "BattlePoint",
    UseBattlePointRotation = 1,
  },
}
r6_0.TaskId = 8520105
r4_0[8520105] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 8520011,
    UnitType = "Monster",
  },
  [2] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 8520012,
    UnitType = "Monster",
  },
  [3] = {
    Function = "CreateUnit",
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 8520013,
    UnitType = "Monster",
  },
}
r6_0.TaskId = 8520106
r4_0[8520106] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852035,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 8520107
r4_0[8520107] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852025,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 8520108
r4_0[8520108] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852036,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 8520109
r4_0[8520109] = r6_0
r4_0[8520110] = {
  TargetFilter = "BossAida_Skill23_Sphere1",
  TaskEffects = r0_0.RT_1256,
  TaskId = 8520110,
}
r4_0[8520111] = {
  TargetFilter = "BossAida_Skill23_Sphere2",
  TaskEffects = r0_0.RT_1256,
  TaskId = 8520111,
}
r4_0[8520112] = {
  TargetFilter = "BossAida_Skill23_Sphere3",
  TaskEffects = r0_0.RT_1256,
  TaskId = 8520112,
}
r4_0[8520113] = {
  TargetFilter = "BossAida_Skill23_Sphere4",
  TaskEffects = r0_0.RT_1256,
  TaskId = 8520113,
}
r4_0[8520114] = {
  TargetFilter = "BossAida_Skill23_Sphere5",
  TaskEffects = r0_0.RT_1256,
  TaskId = 8520114,
}
r4_0[8520115] = {
  TargetFilter = "BossAida_Skill23_Cylinder1",
  TaskEffects = r0_0.RT_498,
  TaskId = 8520115,
}
r4_0[8520116] = {
  TargetFilter = "BossAida_Skill23_Cylinder2",
  TaskEffects = r0_0.RT_498,
  TaskId = 8520116,
}
r4_0[8520117] = {
  TargetFilter = "BossAida_Skill23_Cylinder3",
  TaskEffects = r0_0.RT_498,
  TaskId = 8520117,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHp",
    DamageType = "TrueDamage",
    Function = "Damage",
    Rate = 0.04,
  },
}
r6_0.TaskId = 8520118
r4_0[8520118] = r6_0
r5_0 = 8520119
r6_0 = {
  TargetFilter = "Target",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 852037,
  Function = "CreateSkillCreature",
  Rotation = {
    40,
    0,
    0
  },
}
r8_0[2] = {
  CreatureId = 852037,
  Function = "CreateSkillCreature",
  Rotation = r0_0.RT_421,
}
r8_0[3] = {
  CreatureId = 852037,
  Function = "CreateSkillCreature",
  Rotation = r0_0.RT_422,
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 8520119
r4_0[r5_0] = r6_0
r4_0[8520120] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_511,
  TaskId = 8520120,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 6000204,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 8520121
r4_0[8520121] = r6_0
r4_0[8521001] = {
  NotifyName = r0_0.RT_523,
  TargetFilter = "Mon_Cylinder_300_200_180",
  TaskEffects = r0_0.RT_1267,
  TaskId = 8521001,
}
r4_0[8521002] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_300_200_360",
  TaskEffects = r0_0.RT_1256,
  TaskId = 8521002,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    FormationId = 852101,
    Function = "BossSPSaveLocs",
    SetSaveLocs = "Target",
  },
  [2] = {
    CreatureId = 852101,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_1283,
    UseRelativeOffset = true,
    UseSaveLoc = "Target1",
  },
  [3] = {
    CreatureId = 852101,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_1283,
    UseRelativeOffset = true,
    UseSaveLoc = "Target2",
  },
  [4] = {
    CreatureId = 852101,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_1283,
    UseRelativeOffset = true,
    UseSaveLoc = "Target3",
  },
  [5] = {
    CreatureId = 852101,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_1283,
    UseRelativeOffset = true,
    UseSaveLoc = "Target4",
  },
  [6] = {
    CreatureId = 852101,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_1283,
    UseRelativeOffset = true,
    UseSaveLoc = "Target5",
  },
}
r6_0.TaskId = 8521003
r4_0[8521003] = r6_0
r4_0[8521004] = {
  TargetFilter = "Mon_Cylinder_150_400_360",
  TaskEffects = r0_0.RT_1285,
  TaskId = 8521004,
}
r4_0[8521005] = {
  NotifyName = r0_0.RT_1023,
  TargetFilter = "Mon_Cylinder_300_200_180",
  TaskEffects = r0_0.RT_1286,
  TaskId = 8521005,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852102,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 8521006
r4_0[8521006] = r6_0
r4_0[8521007] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_3,
    [2] = r0_0.RT_110,
  },
  TaskId = 8521007,
}
r4_0[8521008] = {
  NotifyName = r0_0.RT_1023,
  TargetFilter = "Mon_Cylinder_300_200_180",
  TaskEffects = r0_0.RT_1286,
  TaskId = 8521008,
}
r4_0[8521009] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_300_200_180",
  TaskEffects = r0_0.RT_1256,
  TaskId = 8521009,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Self",
}
r8_0 = {}
r8_0[1] = {
  Function = "EffectFunction",
  FunctionName = "RandomAreaLocation",
  Vars = {
    Distance = 200,
    MaxNum = 4,
    Radius = 500,
  },
}
r8_0[2] = {
  CreatureId = 852103,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_1287,
  UseRelativeOffset = true,
  UseSaveLoc = "1",
}
r8_0[3] = {
  CreatureId = 852103,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_1287,
  UseRelativeOffset = true,
  UseSaveLoc = "2",
}
r8_0[4] = {
  CreatureId = 852103,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_1287,
  UseRelativeOffset = true,
  UseSaveLoc = "3",
}
r8_0[5] = {
  CreatureId = 852103,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_1287,
  UseRelativeOffset = true,
  UseSaveLoc = "4",
}
r6_0.TaskEffects = r8_0
r6_0.TaskId = 8521010
r4_0[8521010] = r6_0
r4_0[8521011] = {
  TargetFilter = "Mon_Cylinder_150_400_360",
  TaskEffects = r0_0.RT_1285,
  TaskId = 8521011,
}
r4_0[8522001] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossTuisheng_Skill01_Cylinder1",
  TaskEffects = r0_0.RT_498,
  TaskId = 8522001,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossTuisheng_Skill02_Cylinder1",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_3,
  [2] = r0_0.RT_685,
  [3] = {
    Function = "EffectFunction",
    FunctionName = "Mon_BossTuisheng_Skill02Hit1",
  },
}
r6_0.TaskId = 8522002
r4_0[8522002] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852201,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 8522003
r4_0[8522003] = r6_0
r4_0[8522004] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_498,
  TaskId = 8522004,
}
r4_0[8522005] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_400_200_240",
  TaskEffects = r0_0.RT_498,
  TaskId = 8522005,
}
r4_0[8522006] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
  TaskEffects = r0_0.RT_20,
  TaskId = 8522006,
}
r4_0[8522007] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "Mon_Cylinder_400_200_360",
  TaskEffects = r0_0.RT_1256,
  TaskId = 8522007,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r8_0 = {
  [1] = {
    CreatureId = 852202,
    Function = "CreateSkillCreature",
  },
}
r8_0[2] = {
  Function = "EffectFunction",
  FunctionName = "Mon_SetBool",
  Vars = {
    BoolKey = "BossTuisheng_Skill04CreatureHitResult",
    BoolValue = false,
  },
}
r6_0.TaskEffects = r8_0
r6_0.TaskId = 8522008
r4_0[8522008] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r8_0 = {
  [1] = {
    BuffId = 852201,
    Function = "AddBuff",
    LastTime = 3,
  },
  [2] = r0_0.RT_3,
}
r8_0[3] = {
  Function = "EffectFunction",
  FunctionName = "Mon_SetBool",
  Vars = {
    BoolKey = "BossTuisheng_Skill04CreatureHitResult",
    BoolValue = true,
  },
}
r8_0[4] = r0_0.RT_1196
r6_0.TaskEffects = r8_0
r6_0.TaskId = 8522009
r4_0[8522009] = r6_0
r4_0[8522010] = {
  TaskEffects = {
    [1] = r0_0.RT_1196,
  },
  TaskId = 8522010,
}
r6_0 = {
  NotifyName = r0_0.RT_12,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852203,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 8522011
r4_0[8522011] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "SaveLoc",
    Tag = "BossTuishengSkill04",
    TargetType = "Target",
  },
}
r6_0.TaskId = 8522012
r4_0[8522012] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_9,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852204,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 8522013
r4_0[8522013] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "SaveLoc",
    Tag = "BossTuishengSkill05",
    TargetType = "Target",
  },
}
r6_0.TaskId = 8522014
r4_0[8522014] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852205,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 8522015
r4_0[8522015] = r6_0
r4_0[8522016] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_1267,
  TaskId = 8522016,
}
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852206,
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_1196,
}
r6_0.TaskId = 8522017
r4_0[8522017] = r6_0
r4_0[8522018] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_1267,
  TaskId = 8522018,
}
r4_0[8522019] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "Mon_Cylinder_400_200_180",
  TaskEffects = r0_0.RT_498,
  TaskId = 8522019,
}
r4_0[8522020] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "Mon_Cylinder_400_200_360",
  TaskEffects = r0_0.RT_498,
  TaskId = 8522020,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852207,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 8522021
r4_0[8522021] = r6_0
r4_0[8522022] = {
  TargetFilter = "Mon_Cylinder_500_400_360",
  TaskEffects = r0_0.RT_1289,
  TaskId = 8522022,
}
r4_0[8522023] = {
  TargetFilter = "Mon_Cylinder_800_400_360",
  TaskEffects = r0_0.RT_1267,
  TaskId = 8522023,
}
r4_0[8523001] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossJishi_Attack01",
  TaskEffects = r0_0.RT_498,
  TaskId = 8523001,
}
r4_0[8523002] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossJishi_Attack01",
  TaskEffects = r0_0.RT_498,
  TaskId = 8523002,
}
r4_0[8523003] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BossJishi_Attack01",
  TaskEffects = r0_0.RT_1289,
  TaskId = 8523003,
}
r4_0[8523004] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossJishi_Skill02",
  TaskEffects = r0_0.RT_498,
  TaskId = 8523004,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "SaveLoc",
    IsOnGround = true,
    Tag = "Skill03Loc",
    TargetType = "Target",
  },
}
r6_0.TaskId = 8523005
r4_0[8523005] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852301,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 8523006
r4_0[8523006] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852301,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 8523007
r4_0[8523007] = r6_0
r4_0[8523008] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_1290,
  TaskId = 8523008,
}
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "SaveLoc",
    IsOnGround = true,
    Tag = "Skill04Loc",
    TargetType = "Target",
  },
}
r6_0.TaskId = 8523009
r4_0[8523009] = r6_0
r4_0[8523010] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossJishi_Attack02",
  TaskEffects = r0_0.RT_1256,
  TaskId = 8523010,
}
r4_0[8523013] = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BossJishi_Attack02",
  TaskEffects = {
    [1] = r0_0.RT_7,
    [2] = r0_0.RT_4,
    [3] = r0_0.RT_5,
    [4] = r0_0.RT_10,
  },
  TaskId = 8523013,
}
r4_0[8523014] = {
  NotifyName = r0_0.RT_9,
  TargetFilter = "BossJishi_Attack02",
  TaskEffects = r0_0.RT_1290,
  TaskId = 8523014,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852303,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_415,
  },
}
r6_0.TaskId = 8523015
r4_0[8523015] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852303,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 8523016
r4_0[8523016] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r8_0 = {}
r8_0[1] = {
  AttrRates = {
    ATK = 0.3,
    DEF = 0,
    MaxES = 0.5,
    MaxHp = 0.5,
  },
  FixLocation = true,
  FixLocationNav = 1,
  FixLocationZ = 0,
  FormationId = 852301,
  Function = "CreateUnit",
  MaxSummonCount = 3,
  SingleSummonCount = 3,
  UnitId = 8523002,
  UnitType = "Monster",
}
r6_0.TaskEffects = r8_0
r6_0.TaskId = 8523017
r4_0[8523017] = r6_0
r6_0 = {
  NotifyName = r0_0.RT_2,
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "SaveLoc",
    IsOnGround = true,
    Tag = "SumSkill01Loc",
    TargetType = "Target",
  },
}
r6_0.TaskId = 8523018
r4_0[8523018] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852304,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 8523019
r4_0[8523019] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852304,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 8523020
r4_0[8523020] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 852302,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 8523021
r4_0[8523021] = r6_0
r5_0 = 8523025
r6_0 = {
  TargetFilter = "Self",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 852309,
  Function = "CreateSkillCreature",
  Location = {
    60,
    60,
    100
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 8523025
r4_0[r5_0] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852309,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 8523026
r4_0[8523026] = r6_0
r6_0 = {
  TargetFilter = "Mon_Sphere_50_360",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_33,
  [2] = {
    FXId = 852306,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
}
r6_0.TaskId = 8523027
r4_0[8523027] = r6_0
r4_0[8523028] = {
  NotifyName = r0_0.RT_12,
  TargetFilter = "BossJishi_Attack01",
  TaskEffects = r0_0.RT_498,
  TaskId = 8523028,
}
r4_0[8523029] = {
  NotifyName = r0_0.RT_13,
  TargetFilter = "BossJishi_Attack01",
  TaskEffects = r0_0.RT_1289,
  TaskId = 8523029,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852310,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 8523030
r4_0[8523030] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 852310,
    Function = "RemoveSkillCreature",
  },
}
r6_0.TaskId = 8523031
r4_0[8523031] = r6_0
r4_0[8523032] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_7,
    [2] = r0_0.RT_4,
    [3] = r0_0.RT_10,
  },
  TaskId = 8523032,
}
r4_0[101011041] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_44,
  TaskId = 101011041,
}
r6_0 = {
  TargetFilter = "Rou_10101201_Debuff",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 10101101,
    Function = "AddBuff",
    LastTime = 5,
  },
}
r6_0.TaskId = 101011061
r4_0[101011061] = r6_0
r6_0 = {
  TargetFilter = "Rou_10101201_Debuff",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    BuffId = 10101102,
    Function = "AddBuff",
    LastTime = 5,
  },
}
r6_0.TaskId = 101011062
r4_0[101011062] = r6_0
r6_0 = {
  TargetFilter = "Rou_10101201_Debuff",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    BuffId = 10101103,
    Function = "AddBuff",
    LastTime = 10,
  },
}
r6_0.TaskId = 101011063
r4_0[101011063] = r6_0
r4_0[101012051] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_44,
  TaskId = 101012051,
}
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 10101302,
    Function = "PlayFX",
  },
  [2] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_66,
    Delay = 0.45,
    Function = "Damage",
    Rate = "#1",
  },
}
r6_0.TaskId = 101013021
r4_0[101013021] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 10101901,
    Function = "PlayFX",
  },
  [2] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_66,
    Delay = 0.45,
    Function = "Damage",
    Rate = 5.63,
  },
}
r6_0.TaskId = 101019011
r4_0[101019011] = r6_0
r4_0[101021031] = {
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_80,
    [2] = r0_0.RT_81,
  },
  TaskId = 101021031,
}
r4_0[101021041] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_83,
  TaskId = 101021041,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AttrRates = r0_0.RT_84,
    Function = "CreateUnit",
    LifeTime = 3,
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 9901102,
    UnitType = "Monster",
    UseSaveLoc = "10102106",
  },
}
r6_0.TaskId = 101021061
r4_0[101021061] = r6_0
r4_0[101022041] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_94,
  TaskId = 101022041,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AttrRates = r0_0.RT_84,
    Function = "CreateUnit",
    LifeTime = 2.5,
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 9901101,
    UnitType = "Monster",
    UseSaveLoc = "10102902",
  },
}
r6_0.TaskId = 101029021
r4_0[101029021] = r6_0
r5_0 = 101029022
r6_0 = {
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "Char_Cylinder_Middle",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  BaseAttr = "ATK_Char",
  DamageTag = {
    "RouB102"
  },
  Delay = 0.2,
  Function = "Damage",
  Rate = 13.5,
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 101029022
r4_0[r5_0] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHp",
    DamageType = "TrueDamage",
    Function = "Heal",
    Rate = 0.03,
  },
  [2] = r0_0.RT_95,
  [3] = {
    Function = "AddSp",
    SpChange = 10,
  },
  [4] = r0_0.RT_96,
  [5] = {
    Function = "AddBullet",
    Value = 3,
  },
}
r6_0.TaskId = 101029023
r4_0[101029023] = r6_0
r4_0[101029031] = {
  TargetFilter = "ShootingTargets",
  TaskEffects = {
    [1] = r0_0.RT_99,
    [2] = r0_0.RT_100,
  },
  TaskId = 101029031,
}
r4_0[101029032] = {
  TargetFilter = "Char_Sphere_Small",
  TaskEffects = r0_0.RT_106,
  TaskId = 101029032,
}
r4_0[101029033] = {
  TargetFilter = "Char_Sphere_Small",
  TaskEffects = r0_0.RT_106,
  TaskId = 101029033,
}
r5_0 = 101029034
r6_0 = {
  TargetFilter = "ShootingTargets",
}
r7_0 = "TaskEffects"
r8_0 = {
  [1] = r0_0.RT_99,
}
r8_0[2] = {
  AimSkeletal = "hit1",
  CreatureId = 1010201,
  Direction = "Camera",
  Function = "CreateSkillCreature",
  Location = r0_0.RT_97,
  Rotation = {
    0,
    10,
    50
  },
}
r8_0[3] = {
  AimSkeletal = "hit1",
  CreatureId = 1010201,
  Direction = "Camera",
  Function = "CreateSkillCreature",
  Location = r0_0.RT_97,
  Rotation = {
    0,
    -10,
    50
  },
}
r8_0[4] = r0_0.RT_100
r6_0[r7_0] = r8_0
r6_0.TaskId = 101029034
r4_0[r5_0] = r6_0
r4_0[101031041] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_94,
  TaskId = 101031041,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxES",
    BaseChar = "Target",
    Function = "AddEnergyShield",
    Rate = "#1",
  },
}
r6_0.TaskId = 101031051
r4_0[101031051] = r6_0
r5_0 = 101039001
r6_0 = {
  TargetFilter = "Char_Cylinder_Middle",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  BaseAttr = "ATK_Char",
  DamageTag = {
    "Skill",
    "RouB103"
  },
  Delay = 0.2,
  Function = "Damage",
  Rate = 8.1,
}
r8_0[2] = {
  BaseChar = "Self",
  FXId = 10103102,
  Function = "PlayFX",
  IsAttached = true,
}
r8_0[3] = {
  Delay = 0.2,
  FXId = 10103103,
  Function = "PlayFX",
}
r8_0[4] = {
  CauseHit = "LightHit",
  Delay = 0.2,
  Function = "CutToughness",
  Value = 20,
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 101039001
r4_0[r5_0] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FixLocation = true,
    FixLocationEndZ = -6000,
    FixLocationStartZ = 0,
    FixLocationZ = 0,
    FormationId = 10104900,
    Function = "CreateUnit",
    LifeTime = 10,
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 9901111,
    UnitType = "Monster",
  },
}
r6_0.TaskId = 101041011
r4_0[101041011] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FixLocation = true,
    FixLocationEndZ = -6000,
    FixLocationStartZ = 0,
    FixLocationZ = 0,
    FormationId = 10104900,
    Function = "CreateUnit",
    LifeTime = 10,
    MaxSummonCount = 10,
    SingleSummonCount = 1,
    UnitId = 9901112,
    UnitType = "Monster",
  },
}
r6_0.TaskId = 101041012
r4_0[101041012] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Condition = 10104101,
    FixLocation = true,
    Function = "CreateUnit",
    LifeTime = 10,
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 9901113,
    UnitType = "Monster",
    UseSaveLoc = "Rou104Leaf",
  },
}
r6_0.TaskId = 101041013
r4_0[101041013] = r6_0
r6_0 = {
  TargetFilter = "Rou_10104_Sphere_Level02",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_107,
    Function = "Damage",
    Rate = 6,
  },
  [2] = r0_0.RT_108,
  [3] = r0_0.RT_109,
}
r6_0.TaskId = 101041022
r4_0[101041022] = r6_0
r6_0 = {
  TargetFilter = "Rou_10104_Sphere_Level02",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_107,
    Function = "Damage",
    Rate = 10,
  },
  [2] = r0_0.RT_110,
  [3] = r0_0.RT_109,
}
r6_0.TaskId = 101041024
r4_0[101041024] = r6_0
r4_0[101041051] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_44,
  TaskId = 101041051,
}
r4_0[101041061] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_94,
  TaskId = 101041061,
}
r4_0[101042051] = {
  TargetFilter = "Rou_10104_Sphere_Level02",
  TaskEffects = {
    [1] = r0_0.RT_111,
  },
  TaskId = 101042051,
}
r6_0 = {
  TargetFilter = "Rou_10104_Sphere_Level02",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_107,
    Function = "Damage",
    Rate = "#1",
  },
  [2] = r0_0.RT_108,
  [3] = r0_0.RT_109,
}
r6_0.TaskId = 101043031
r4_0[101043031] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHp",
    DamageType = "HpConsume",
    Function = "Damage",
    Rate = 1,
  },
}
r6_0.TaskId = 101049001
r4_0[101049001] = r6_0
r6_0 = {
  TargetFilter = "Rou_10104_Cylinder_1000_Fr",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHp",
    BaseChar = "Target",
    DamageType = "Default",
    Function = "Heal",
    Rate = 0.05,
  },
}
r6_0.TaskId = 101049011
r4_0[101049011] = r6_0
r6_0 = {
  TargetFilter = "Rou_10104_Cylinder_1000",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    Function = "Damage",
    Rate = 6.5,
  },
  [2] = r0_0.RT_112,
}
r6_0.TaskId = 101049012
r4_0[101049012] = r6_0
r4_0[101051021] = {
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_113,
    [2] = r0_0.RT_113,
    [3] = r0_0.RT_113,
  },
  TaskId = 101051021,
}
r4_0[101051022] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_115,
    [2] = r0_0.RT_116,
  },
  TaskId = 101051022,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 10105106,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 101051061
r4_0[101051061] = r6_0
r6_0 = {
  TargetFilter = "Rou_10105_Cylinder_400",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_114,
    Function = "Damage",
    Rate = 4,
  },
  [2] = r0_0.RT_108,
  [3] = {
    FXId = 10105902,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 101051062
r4_0[101051062] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 10105205,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 101052051
r4_0[101052051] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_115,
  [2] = {
    CauseHit = "HitFly_XY400Z400_F",
    Function = "CutToughness",
    Value = 200,
  },
  [3] = r0_0.RT_116,
}
r6_0.TaskId = 101052052
r4_0[101052052] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FixLocation = true,
    FixLocationZ = 0,
    Function = "CreateUnit",
    LifeTime = 5,
    MaxSummonCount = 5,
    SingleSummonCount = 1,
    UnitId = 10106002,
    UnitType = "MechanismSummon",
  },
}
r6_0.TaskId = 101053023
r4_0[101053023] = r6_0
r5_0 = 101059041
r6_0 = {
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "Target",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  BaseAttr = "ATK_Char",
  DamageTag = {
    "RouB105Group4"
  },
  Function = "Damage",
  Rate = 1,
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 101059041
r4_0[r5_0] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    AttrRates = r0_0.RT_84,
    Function = "CreateUnit",
    MaxSummonCount = 5,
    SingleSummonCount = 1,
    UnitId = 10106001,
    UnitType = "MechanismSummon",
  },
}
r6_0.TaskId = 101061011
r4_0[101061011] = r6_0
r4_0[101061012] = {
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_118,
    [2] = r0_0.RT_119,
    [3] = r0_0.RT_120,
    [4] = r0_0.RT_121,
  },
  TaskId = 101061012,
}
r4_0[101061013] = {
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_121,
    [2] = r0_0.RT_122,
  },
  TaskId = 101061013,
}
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    ATKBase = "ATK",
    CreatureId = 1010602,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 101061014
r4_0[101061014] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    ATKBase = "ATK",
    CreatureId = 1010603,
    Function = "CreateSkillCreature",
    UseSaveLoc = "SubInsectLoc",
  },
  [2] = {
    ATKBase = "ATK",
    CreatureId = 1010604,
    Function = "CreateSkillCreature",
    UseSaveLoc = "SubInsectLoc",
  },
  [3] = {
    ATKBase = "ATK",
    CreatureId = 1010605,
    Function = "CreateSkillCreature",
    UseSaveLoc = "SubInsectLoc",
  },
}
r6_0.TaskId = 101061015
r4_0[101061015] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    ATKBase = "ATK",
    CreatureId = 1010604,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 101061016
r4_0[101061016] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    ATKBase = "ATK",
    CreatureId = 1010605,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 101061017
r4_0[101061017] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    ATKBase = "ATK",
    CreatureId = 1010606,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 101061018
r4_0[101061018] = r6_0
r4_0[101061019] = {
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "Rou_10106_Group1Damage",
  TaskEffects = {
    [1] = r0_0.RT_118,
    [2] = r0_0.RT_119,
    [3] = r0_0.RT_120,
    [4] = r0_0.RT_123,
  },
  TaskId = 101061019,
}
r4_0[101061020] = {
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "Rou_10106_Group1Damage",
  TaskEffects = {
    [1] = r0_0.RT_118,
    [2] = r0_0.RT_120,
  },
  TaskId = 101061020,
}
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    ATKBase = "ATK",
    CreatureId = 1010601,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 101061021
r4_0[101061021] = r6_0
r4_0[101061022] = {
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "Rou_10106_Group2Damage",
  TaskEffects = {
    [1] = r0_0.RT_124,
    [2] = r0_0.RT_119,
    [3] = r0_0.RT_120,
    [4] = r0_0.RT_123,
  },
  TaskId = 101061022,
}
r4_0[101061023] = {
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "Rou_10106_Group2Damage",
  TaskEffects = {
    [1] = r0_0.RT_124,
    [2] = r0_0.RT_120,
  },
  TaskId = 101061023,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 10106105,
    Function = "PlayFX",
    NormalToHit = true,
  },
}
r6_0.TaskId = 101061024
r4_0[101061024] = r6_0
r5_0 = 101071061
r6_0 = {
  SkillEffectSourceFlag = "RootSource",
  TargetFilter = "Rou_101071061",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  BaseAttr = "MaxHp",
  DamageTag = {
    "RouB107106"
  },
  DamageType = "Default",
  Function = "Damage",
  Rate = "#1",
}
r8_0[2] = r0_0.RT_120
r6_0[r7_0] = r8_0
r6_0.TaskId = 101071061
r4_0[r5_0] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    ATKBase = "ATK",
    CreatureId = 1010701,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 101071062
r4_0[101071062] = r6_0
r4_0[101072051] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_83,
  TaskId = 101072051,
}
r6_0 = {
  TargetFilter = "Rou_10107_Group3Damage",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHp",
    DamageType = "Default",
    Function = "Damage",
    Rate = 0.4,
  },
  [2] = r0_0.RT_125,
}
r6_0.TaskId = 101079301
r4_0[101079301] = r6_0
r6_0 = {
  TargetFilter = "Rou_10107_Group3Damage",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHp",
    DamageType = "Default",
    Function = "Damage",
    Rate = 0.533,
  },
  [2] = r0_0.RT_125,
}
r6_0.TaskId = 101079302
r4_0[101079302] = r6_0
r6_0 = {
  TargetFilter = "Rou_10107_Group3Damage",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHp",
    DamageType = "Default",
    Function = "Damage",
    Rate = 0.667,
  },
  [2] = r0_0.RT_125,
}
r6_0.TaskId = 101079303
r4_0[101079303] = r6_0
r6_0 = {
  TargetFilter = "Rou_10107_Group3Damage",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHp",
    DamageType = "Default",
    Function = "Damage",
    Rate = 0.8,
  },
  [2] = r0_0.RT_125,
}
r6_0.TaskId = 101079304
r4_0[101079304] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    DamageType = "TrueDamage",
    Function = "Heal",
    Value = 100,
  },
  [2] = {
    BaseAttr = "MaxHp",
    DamageType = "TrueDamage",
    Function = "Heal",
    Rate = 0.25,
  },
  [3] = r0_0.RT_95,
}
r6_0.TaskId = 101999991
r4_0[101999991] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHp",
    DamageType = "Default",
    Function = "Heal",
    Rate = 0.02,
  },
}
r6_0.TaskId = 201020011
r4_0[201020011] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "AddSp",
    SpChange = 15,
  },
}
r6_0.TaskId = 201020012
r4_0[201020012] = r6_0
r4_0[201040011] = {
  TargetFilter = "Self",
  TaskEffects = {
    [1] = r0_0.RT_232,
  },
  TaskId = 201040011,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "AddSp",
    SpChange = 50,
  },
}
r6_0.TaskId = 201050011
r4_0[201050011] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    DamageType = "TrueDamage",
    Function = "Damage",
    Value = 500,
  },
}
r6_0.TaskId = 201210011
r4_0[201210011] = r6_0
r5_0 = 201300011
r6_0 = {}
r7_0 = "TaskEffects"
r8_0 = {
  [1] = {
    CreatureId = 20130001,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_324,
  },
  [2] = {
    CreatureId = 20130001,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_324,
    Rotation = r0_0.RT_174,
  },
  [3] = {
    CreatureId = 20130001,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_324,
    Rotation = r0_0.RT_359,
  },
  [4] = {
    CreatureId = 20130001,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_324,
    Rotation = r0_0.RT_76,
  },
}
r8_0[5] = {
  CreatureId = 20130001,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_324,
  Rotation = {
    0,
    -90,
    0
  },
}
r8_0[6] = {
  CreatureId = 20130001,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_324,
  Rotation = r0_0.RT_360,
}
r8_0[7] = {
  CreatureId = 20130001,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_324,
  Rotation = r0_0.RT_361,
}
r8_0[8] = {
  CreatureId = 20130001,
  Function = "CreateSkillCreature",
  Location = r0_0.RT_324,
  Rotation = {
    0,
    -180,
    0
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 201300011
r4_0[r5_0] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageType = "Light",
    Function = "Damage",
    Rate = 5,
  },
  [2] = r0_0.RT_165,
}
r6_0.TaskId = 201300012
r4_0[201300012] = r6_0
r5_0 = 201310011
r6_0 = {
  TargetFilter = "Self",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 20131001,
  Delay = 0.2,
  Function = "CreateSkillCreature",
  Location = {
    400,
    400,
    0
  },
}
r8_0[2] = {
  CreatureId = 20131001,
  Delay = 0.2,
  Function = "CreateSkillCreature",
  Location = {
    -400,
    400,
    0
  },
}
r8_0[3] = {
  CreatureId = 20131001,
  Delay = 0.4,
  Function = "CreateSkillCreature",
  Location = {
    -400,
    -400,
    0
  },
}
r8_0[4] = {
  CreatureId = 20131001,
  Delay = 0.4,
  Function = "CreateSkillCreature",
  Location = {
    400,
    -400,
    0
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 201310011
r4_0[r5_0] = r6_0
r6_0 = {
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageType = "Dark",
    Function = "Damage",
    Rate = 9,
  },
  [2] = {
    CauseHit = "HitFly_XY0Z500",
    Function = "CutToughness",
    Value = 80,
  },
}
r6_0.TaskId = 201310012
r4_0[201310012] = r6_0
r4_0[201320011] = {
  TaskEffects = r0_0.RT_364,
  TaskId = 201320011,
}
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageType = "Wind",
    Function = "Damage",
    Rate = 5,
  },
  [2] = r0_0.RT_365,
  [3] = {
    CauseHit = "LightHit",
    Function = "CutToughness",
    Value = 10,
  },
}
r6_0.TaskId = 201320012
r4_0[201320012] = r6_0
r4_0[201320013] = {
  TaskEffects = r0_0.RT_364,
  TaskId = 201320013,
}
r6_0 = {
  TargetFilter = "Char_Cylinder_Large_Trgt",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageType = "Water",
    Function = "Damage",
    Rate = 13.5,
  },
  [2] = {
    FXId = 210121,
    Function = "PlayFX",
  },
  [3] = {
    BossValue = 100,
    CauseHit = "HitFly_XY0Z500",
    Function = "CutToughness",
    Value = 50,
  },
}
r6_0.TaskId = 201330011
r4_0[201330011] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 20134001,
    Direction = "Camera",
    Function = "CreateSkillCreature",
  },
  [2] = {
    CreatureId = 20134002,
    Direction = "Camera",
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 201340011
r4_0[201340011] = r6_0
r6_0 = {
  TargetFilter = "Rou_20134_Cylinder_XLarge120",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageType = "Fire",
    Function = "Damage",
    Rate = 7,
  },
  [2] = r0_0.RT_129,
}
r6_0.TaskId = 201340012
r4_0[201340012] = r6_0
r5_0 = 201350011
r6_0 = {}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreatureId = 20135001,
  Function = "CreateSkillCreature",
  Location = {
    0,
    500,
    0
  },
}
r8_0[2] = {
  CreatureId = 20135001,
  Function = "CreateSkillCreature",
  Location = {
    300,
    300,
    0
  },
}
r8_0[3] = {
  CreatureId = 20135001,
  Function = "CreateSkillCreature",
  Location = {
    -300,
    300,
    0
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 201350011
r4_0[r5_0] = r6_0
r6_0 = {
  TargetFilter = "Char_Cylinder_Middle",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageType = "Thunder",
    Function = "Damage",
    Rate = 3.5,
  },
  [2] = {
    FXId = 20135001,
    Function = "PlayFX",
  },
  [3] = {
    BossValue = 10,
    CauseHit = "HitFly_XY200Z300_F",
    Function = "CutToughness",
    Value = 15,
  },
}
r6_0.TaskId = 201350012
r4_0[201350012] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "AddSp",
    SpChange = 3,
  },
}
r6_0.TaskId = 201560011
r4_0[201560011] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHp",
    Function = "AddEnergyShield",
    IsOverShield = 1,
    Rate = 0.1,
  },
}
r6_0.TaskId = 201720011
r4_0[201720011] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_366,
    DamageType = "Fire",
    Function = "Damage",
    Rate = 0.2,
  },
}
r6_0.TaskId = 201810011
r4_0[201810011] = r6_0
r4_0[201810012] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_368,
  TaskId = 201810012,
}
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_366,
    DamageType = "Water",
    Function = "Damage",
    Rate = 0.2,
  },
}
r6_0.TaskId = 201820011
r4_0[201820011] = r6_0
r4_0[201820012] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_368,
  TaskId = 201820012,
}
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_366,
    DamageType = "Wind",
    Function = "Damage",
    Rate = 0.2,
  },
}
r6_0.TaskId = 201830011
r4_0[201830011] = r6_0
r4_0[201830012] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_368,
  TaskId = 201830012,
}
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageTag = r0_0.RT_366,
    DamageType = "Thunder",
    Function = "Damage",
    Rate = 0.2,
  },
}
r6_0.TaskId = 201840011
r4_0[201840011] = r6_0
r4_0[201840012] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_368,
  TaskId = 201840012,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    ATKBase = "ATK",
    CreatureId = 30102004,
    Function = "CreateSkillCreature",
    Location = r0_0.RT_494,
  },
}
r6_0.TaskId = 301020041
r4_0[301020041] = r6_0
r6_0 = {
  TargetFilter = "Mon_Sphere_300_360",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_16,
  [2] = r0_0.RT_10,
  [3] = {
    FXId = 30102042,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 301020042
r4_0[301020042] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "ShootLoopStart",
    PassiveEffectId = 40101001,
  },
}
r6_0.TaskId = 401010001
r4_0[401010001] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 4010102,
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_100,
  [3] = r0_0.RT_554,
}
r6_0.TaskId = 401010002
r4_0[401010002] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 4010101,
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_100,
  [3] = r0_0.RT_555,
}
r6_0.TaskId = 401010003
r4_0[401010003] = r6_0
r6_0 = {
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_large",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageType = "TrueDamage",
    Function = "Damage",
    Rate = 17,
  },
  [2] = r0_0.RT_556,
  [3] = r0_0.RT_557,
  [4] = r0_0.RT_175,
}
r6_0.TaskId = 401010004
r4_0[401010004] = r6_0
r4_0[401010005] = {
  HatredIncrement = 40,
  TargetFilter = "Char_Sphere_large",
  TaskEffects = r0_0.RT_560,
  TaskId = 401010005,
}
r4_0[401010006] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_561,
    [2] = r0_0.RT_562,
    [3] = r0_0.RT_563,
  },
  TaskId = 401010006,
}
r4_0[401010007] = {
  TargetFilter = "Self",
  TaskEffects = r0_0.RT_564,
  TaskId = 401010007,
}
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 4010103,
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_100,
}
r6_0.TaskId = 401010008
r4_0[401010008] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 4010104,
    Direction = "Camera",
    Function = "CreateRayCreature",
    RayEndLoc = true,
  },
}
r6_0.TaskId = 401010009
r4_0[401010009] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_561,
  [2] = r0_0.RT_562,
  [3] = r0_0.RT_563,
  [4] = {
    Function = "PlaySE",
    SEId = 40101001,
  },
}
r6_0.TaskId = 401010010
r4_0[401010010] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 4010104,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "End",
    UseSaveLoc = "Start",
  },
}
r6_0.TaskId = 401010011
r4_0[401010011] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 40101002,
    Function = "AddBuff",
    LastTime = 1,
  },
}
r6_0.TaskId = 401010012
r4_0[401010012] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 4010201,
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_100,
  [3] = r0_0.RT_555,
}
r6_0.TaskId = 401020001
r4_0[401020001] = r6_0
r4_0[401020002] = {
  TargetFilter = "Mon_Sphere_600_360",
  TaskEffects = r0_0.RT_568,
  TaskId = 401020002,
}
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 4010202,
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_100,
  [3] = r0_0.RT_554,
}
r6_0.TaskId = 401020003
r4_0[401020003] = r6_0
r4_0[401020004] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_570,
  TaskId = 401020004,
}
r4_0[401020005] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_570,
  TaskId = 401020005,
}
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 4010203,
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_100,
  [3] = r0_0.RT_554,
}
r6_0.TaskId = 401020006
r4_0[401020006] = r6_0
r4_0[401020007] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_572,
  TaskId = 401020007,
}
r4_0[401020008] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_572,
  TaskId = 401020008,
}
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 4010105,
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_100,
  [3] = r0_0.RT_554,
}
r6_0.TaskId = 401020009
r4_0[401020009] = r6_0
r6_0 = {
  EffectExecuteTiming = "Enter",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "ExecutePassiveFunction",
    FunctionName = "ShootLoopStart",
    PassiveEffectId = 40102001,
  },
}
r6_0.TaskId = 401020010
r4_0[401020010] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 4010204,
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_100,
  [3] = r0_0.RT_555,
}
r6_0.TaskId = 401020011
r4_0[401020011] = r6_0
r4_0[401020012] = {
  TargetFilter = "Mon_Sphere_600_360",
  TaskEffects = r0_0.RT_568,
  TaskId = 401020012,
}
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 4010205,
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_100,
  [3] = r0_0.RT_555,
}
r6_0.TaskId = 401020013
r4_0[401020013] = r6_0
r6_0 = {
  TargetFilter = "Mon_Sphere_600_360",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_565,
  [2] = {
    FXId = 40101003,
    Function = "PlayFX",
    Overlap = true,
  },
  [3] = r0_0.RT_566,
  [4] = r0_0.RT_567,
}
r6_0.TaskId = 401020014
r4_0[401020014] = r6_0
r4_0[401020015] = {
  TargetFilter = "LaserTarget",
  TaskEffects = {
    [1] = r0_0.RT_573,
    [2] = r0_0.RT_573,
  },
  TaskId = 401020015,
}
r4_0[401020016] = {
  TargetFilter = "LaserTarget",
  TaskEffects = {
    [1] = r0_0.RT_574,
    [2] = r0_0.RT_574,
  },
  TaskId = 401020016,
}
r4_0[401020017] = {
  TargetFilter = "Target",
  TaskEffects = r0_0.RT_570,
  TaskId = 401020017,
}
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageType = "Default",
    Function = "Damage",
    Rate = 4.3,
  },
  [2] = r0_0.RT_562,
}
r6_0.TaskId = 401020018
r4_0[401020018] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 4010209,
    Function = "CreateSkillCreature",
    UseSaveLoc = "Onground",
  },
}
r6_0.TaskId = 401020024
r4_0[401020024] = r6_0
r6_0 = {
  TargetFilter = "AlmostAllOtFr",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 40101018,
    Function = "AddBuff",
    LastTime = 4,
  },
}
r6_0.TaskId = 401020025
r4_0[401020025] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 4010106,
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_100,
  [3] = r0_0.RT_554,
}
r6_0.TaskId = 401020026
r4_0[401020026] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 4010206,
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_100,
  [3] = r0_0.RT_555,
}
r6_0.TaskId = 401020027
r4_0[401020027] = r6_0
r4_0[401020028] = {
  TargetFilter = "Mon_Sphere_800_360",
  TaskEffects = r0_0.RT_576,
  TaskId = 401020028,
}
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 4010207,
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_100,
  [3] = r0_0.RT_555,
}
r6_0.TaskId = 401020029
r4_0[401020029] = r6_0
r4_0[401020030] = {
  TargetFilter = "Mon_Sphere_800_360",
  TaskEffects = r0_0.RT_576,
  TaskId = 401020030,
}
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 4010208,
    Function = "CreateSkillCreature",
  },
  [2] = r0_0.RT_100,
  [3] = r0_0.RT_555,
}
r6_0.TaskId = 401020031
r4_0[401020031] = r6_0
r6_0 = {
  TargetFilter = "Mon_Sphere_800_360",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_565,
  [2] = {
    FXId = 40101008,
    Function = "PlayFX",
    Overlap = true,
  },
  [3] = r0_0.RT_566,
  [4] = r0_0.RT_567,
}
r6_0.TaskId = 401020032
r4_0[401020032] = r6_0
r4_0[401020033] = {
  TargetFilter = "Mon_Cylinder_400_200_360",
  TaskEffects = r0_0.RT_578,
  TaskId = 401020033,
}
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "CreateUnit",
    LifeTime = 5,
    UnitId = 40101001,
    UnitType = "MechanismSummon",
    UseSaveLoc = "Onground",
  },
}
r6_0.TaskId = 401020034
r4_0[401020034] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "MaxHp",
    DamageType = "TrueDamage",
    DefaultHealFX = 0,
    Function = "Heal",
    Rate = 0.3,
  },
}
r6_0.TaskId = 500000001
r4_0[500000001] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 5000301,
    Function = "AddBuff",
    LastTime = 60,
  },
}
r6_0.TaskId = 500000301
r4_0[500000301] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 5000302,
    Function = "AddBuff",
    LastTime = 15,
  },
}
r6_0.TaskId = 500000302
r4_0[500000302] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 5000303,
    Function = "AddBuff",
    LastTime = 20,
  },
}
r6_0.TaskId = 500000303
r4_0[500000303] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 5000304,
    Function = "AddBuff",
    LastTime = 25,
  },
}
r6_0.TaskId = 500000304
r4_0[500000304] = r6_0
r6_0 = {
  TargetFilter = "Silverbox",
}
r6_0.TaskEffects = {
  [1] = {
    CreateWithoutTarget = false,
    CreatureId = 500000305,
    Function = "CreateSkillCreature",
    RandomVelocityX = r0_0.RT_387,
    RandomVelocityY = r0_0.RT_387,
    RandomVelocityZ = r0_0.RT_388,
  },
}
r6_0.TaskId = 500000305
r4_0[500000305] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK_Char",
    DamageType = "Default",
    Function = "Damage",
    Rate = 25,
  },
  [2] = r0_0.RT_618,
}
r6_0.TaskId = 500000306
r4_0[500000306] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    FXId = 5000303,
    Function = "PlayFX",
    IsAttached = true,
    IsEffectCreature = true,
  },
  [2] = {
    FXId = 5000304,
    Function = "PlayFX",
    IsAttached = true,
    IsEffectCreature = true,
  },
  [3] = {
    FXId = 5000305,
    Function = "PlayFX",
    IsAttached = true,
    IsEffectCreature = true,
  },
}
r6_0.TaskId = 500000307
r4_0[500000307] = r6_0
r4_0[500000309] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_619,
  },
  TaskId = 500000309,
}
r6_0 = {
  TargetFilter = "Silverbox_03",
}
r6_0.TaskEffects = {
  [1] = {
    CreateWithoutTarget = false,
    CreatureId = 500000301,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 500000310
r4_0[500000310] = r6_0
r6_0 = {
  TargetFilter = "Silverbox_03",
}
r6_0.TaskEffects = {
  [1] = {
    CreateWithoutTarget = false,
    CreatureId = 500000302,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 500000311
r4_0[500000311] = r6_0
r6_0 = {
  TargetFilter = "Silverbox_03",
}
r6_0.TaskEffects = {
  [1] = {
    CreateWithoutTarget = false,
    CreatureId = 500000303,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 500000312
r4_0[500000312] = r6_0
r5_0 = 500000401
r6_0 = {
  TargetFilter = "Target",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  CreateWithoutTarget = false,
  CreatureId = 500000401,
  Function = "CreateSkillCreature",
  RandomVelocityX = r0_0.RT_620,
  RandomVelocityY = r0_0.RT_620,
  RandomVelocityZ = {
    400,
    400
  },
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 500000401
r4_0[r5_0] = r6_0
r4_0[500000402] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_619,
    [2] = r0_0.RT_618,
  },
  TaskId = 500000402,
}
r4_0[500000403] = {
  TargetFilter = "Target",
  TaskEffects = {
    [1] = r0_0.RT_16,
    [2] = r0_0.RT_621,
  },
  TaskId = 500000403,
}
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    DamageType = "EsDamage",
    Function = "Damage",
    Rate = 5,
    Value = 10,
  },
}
r6_0.TaskId = 500000404
r4_0[500000404] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = {
    AimSkeletal = "spine_03",
    CreatureId = 600000101,
    Function = "CreateSkillCreature",
  },
  [2] = {
    Function = "PlaySE",
    SEId = 700112,
  },
}
r6_0.TaskId = 600000101
r4_0[600000101] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_655,
  [2] = {
    BuffId = 6000102,
    Function = "AddBuff",
    LastTime = 3,
  },
  [3] = {
    FXId = 600003,
    Function = "PlayFX",
    Overlap = true,
  },
}
r6_0.TaskId = 600000102
r4_0[600000102] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 600000102,
    Function = "PlayFX",
    IsAttached = true,
  },
}
r6_0.TaskId = 600000103
r4_0[600000103] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    FXId = 600003,
    Function = "PlayFX",
    NormalToHit = true,
    Overlap = true,
  },
}
r6_0.TaskId = 600000104
r4_0[600000104] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 600000104,
    Function = "PlayFX",
    IsAttached = true,
  },
}
r6_0.TaskId = 600000105
r4_0[600000105] = r6_0
r5_0 = 600000201
r6_0 = {
  TargetFilter = "Mon_Sphere_400_360_NoMch",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  BaseAttr = "ATK",
  DamageTag = {
    "PhantomAvoid",
    "Burst"
  },
  Function = "Damage",
  Rate = 0.65,
}
r8_0[2] = r0_0.RT_35
r8_0[3] = r0_0.RT_656
r6_0[r7_0] = r8_0
r6_0.TaskId = 600000201
r4_0[r5_0] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreateDelay = 3,
    FixLocation = true,
    FixLocationZ = 0,
    Function = "CreateUnit",
    LifeTime = 10,
    MaxSummonCount = 15,
    SaveLocTag = "Strong",
    SaveToSaveLoc = 1,
    SingleSummonCount = 1,
    UnitId = 900301,
    UnitType = "MechanismSummon",
  },
}
r6_0.TaskId = 600000301
r4_0[600000301] = r6_0
r6_0 = {
  TargetFilter = "Mon_Cylinder_500_40_360_NoMch",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 6000107,
    Function = "AddBuff",
    LastTime = 0.5,
  },
}
r6_0.TaskId = 600000302
r4_0[600000302] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    BoneName = "spine_03",
    DanmakuTemplateId = 600000401,
    Duration = 1,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 600000401
r4_0[600000401] = r6_0
r4_0[600000402] = {
  TargetFilter = "Mon_Sphere_200_360_NoMch",
  TaskEffects = {
    [1] = r0_0.RT_655,
    [2] = r0_0.RT_657,
    [3] = r0_0.RT_121,
  },
  TaskId = 600000402,
}
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 600000404,
    Function = "PlayFX",
    IsAttached = true,
  },
}
r6_0.TaskId = 600000403
r4_0[600000403] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 600000405,
    Function = "PlayFX",
    IsAttached = true,
  },
}
r6_0.TaskId = 600000404
r4_0[600000404] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreateDelay = 2,
    FixLocation = true,
    FixLocationZ = 0,
    FormationId = 6000005,
    Function = "CreateUnit",
    LifeTime = 10,
    MaxSummonCount = 3,
    SaveLocTag = "Strong",
    SaveToSaveLoc = 1,
    SingleSummonCount = 3,
    UnitId = 900501,
    UnitType = "MechanismSummon",
  },
  [2] = {
    CreatureId = 600000501,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "Strong1",
  },
  [3] = {
    CreatureId = 600000501,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "Strong2",
  },
  [4] = {
    CreatureId = 600000501,
    Function = "CreateSkillCreature",
    SetSavelocAsTarget = "Strong3",
  },
  [5] = {
    Function = "PlaySE",
    SEId = 700123,
  },
}
r6_0.TaskId = 600000501
r4_0[600000501] = r6_0
r6_0 = {
  TargetFilter = "Mon_Cylinder_300_40_360_NoMch",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 6000109,
    Function = "AddBuff",
    LastTime = 0.5,
  },
}
r6_0.TaskId = 600000502
r4_0[600000502] = r6_0
r6_0 = {
  TargetFilter = "Mon_Cylinder_300_40_360_FrNoMch",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 6000111,
    Function = "AddBuff",
    LastTime = 0.5,
  },
}
r6_0.TaskId = 600000503
r4_0[600000503] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    FXId = 600000503,
    Function = "PlayFX",
    IsAttached = true,
  },
}
r6_0.TaskId = 600000504
r4_0[600000504] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    DanmakuTemplateId = 600000406,
    Duration = 12.5,
    Function = "CreateDanmaku",
  },
}
r6_0.TaskId = 600000601
r4_0[600000601] = r6_0
r6_0 = {
  TargetFilter = "Target",
}
r6_0.TaskEffects = {
  [1] = r0_0.RT_659,
  [2] = {
    Function = "AddSp",
    SpChange = -3,
  },
}
r6_0.TaskId = 600000602
r4_0[600000602] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    Function = "CreateUnit",
    LifeTime = 9,
    MaxSummonCount = 1,
    SingleSummonCount = 1,
    UnitId = 900701,
    UnitType = "MechanismSummon",
  },
}
r6_0.TaskId = 600000701
r4_0[600000701] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 600000701,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 600000702
r4_0[600000702] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 600000702,
    Function = "PlayFX",
    IsAttached = true,
  },
}
r6_0.TaskId = 600000703
r4_0[600000703] = r6_0
r6_0 = {
  TargetFilter = "Mon_Sphere_500_360_Fr",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 6000112,
    Function = "AddBuff",
    LastTime = 20,
  },
}
r6_0.TaskId = 600000801
r4_0[600000801] = r6_0
r6_0 = {}
r6_0.TaskEffects = {
  [1] = {
    FXId = 600000801,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 600000802
r4_0[600000802] = r6_0
r6_0 = {
  TargetFilter = "BTTarget",
}
r6_0.TaskEffects = {
  [1] = {
    FixLocation = true,
    FixLocationZ = 0,
    FormationId = 6000009,
    Function = "CreateUnit",
    LifeTime = 4,
    MaxSummonCount = 8,
    SaveLocTag = "IceOrb",
    SaveToSaveLoc = 1,
    SingleSummonCount = 1,
    UnitId = 900901,
    UnitType = "MechanismSummon",
  },
}
r6_0.TaskId = 600000901
r4_0[600000901] = r6_0
r6_0 = {
  TargetFilter = "Mon_Cylinder_700_300_360_NoMch",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 6000115,
    Function = "AddBuff",
    LastTime = 0.5,
  },
}
r6_0.TaskId = 600000902
r4_0[600000902] = r6_0
r5_0 = 600000903
r6_0 = {
  TargetFilter = "Mon_Cylinder_700_300_360_NoMch",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  BaseAttr = "ATK",
  DamageTag = {
    "PhantomAvoid",
    "IceOrb"
  },
  Function = "Damage",
  Rate = 0.65,
}
r8_0[2] = {
  FXId = 600000903,
  Function = "PlayFX",
}
r8_0[3] = {
  Function = "PlaySE",
  SEId = 600000903,
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 600000903
r4_0[r5_0] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 600000902,
    Function = "PlayFX",
    IsAttached = true,
  },
}
r6_0.TaskId = 600000904
r4_0[600000904] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 6000116,
    Function = "AddBuff",
    LastTime = 2.5,
  },
}
r6_0.TaskId = 600001001
r4_0[600001001] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 600001002,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 600001002
r4_0[600001002] = r6_0
r5_0 = 600001003
r6_0 = {
  TargetFilter = "Mon_Sphere_400_360_NoMch",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  BaseAttr = "ATK",
  DamageTag = {
    "PhantomAvoid",
    "Reflect"
  },
  Function = "Damage",
  Rate = 0.65,
}
r8_0[2] = r0_0.RT_10
r8_0[3] = {
  FXId = 600001003,
  Function = "PlayFX",
}
r8_0[4] = {
  Function = "PlaySE",
  SEId = 600001004,
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 600001003
r4_0[r5_0] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 600001004,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 600001004
r4_0[600001004] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 6000116,
    Function = "RemoveBuff",
  },
}
r6_0.TaskId = 600001005
r4_0[600001005] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreatureId = 600001101,
    Function = "CreateSkillCreature",
  },
}
r6_0.TaskId = 600001101
r4_0[600001101] = r6_0
r6_0 = {
  TargetFilter = "Mon_Sphere_400_360_NoMch",
}
r6_0.TaskEffects = {
  [1] = {
    BaseAttr = "ATK",
    DamageTag = r0_0.RT_654,
    Function = "Damage",
    Rate = 0.65,
  },
  [2] = r0_0.RT_10,
  [3] = {
    FXId = 600001102,
    Function = "PlayFX",
  },
  [4] = {
    Function = "PlaySE",
    SEId = 600001103,
  },
}
r6_0.TaskId = 600001102
r4_0[600001102] = r6_0
r6_0 = {
  TargetFilter = "Mon_Sphere_400_360_OtFr",
}
r6_0.TaskEffects = {
  [1] = {
    CauseHit = "LightHit",
    Function = "CutToughness",
    Value = 200,
  },
}
r6_0.TaskId = 600001103
r4_0[600001103] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FixLocation = true,
    FixLocationZ = 0,
    FormationId = 6000012,
    Function = "CreateUnit",
    LifeTime = 10,
    MaxSummonCount = 8,
    SingleSummonCount = 6,
    UnitId = 901201,
    UnitType = "MechanismSummon",
  },
}
r6_0.TaskId = 600001201
r4_0[600001201] = r6_0
r5_0 = 600001202
r6_0 = {
  TargetFilter = "Mon_Sphere_50_360_NoMch",
}
r7_0 = "TaskEffects"
r8_0 = {}
r8_0[1] = {
  BaseAttr = "ATK",
  DamageTag = {
    "PhantomAvoid",
    "ThunderLaser"
  },
  Function = "Damage",
  Rate = 0.4,
}
r8_0[2] = {
  Function = "PlaySE",
  SEId = 600001203,
}
r6_0[r7_0] = r8_0
r6_0.TaskId = 600001202
r4_0[r5_0] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 600001201,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 600001203
r4_0[600001203] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 600001301,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 600001301
r4_0[600001301] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    CreateNotSummoned = 1,
    DestroyWithCreator = 0,
    FixLocation = true,
    FixLocationNav = 1,
    FixLocationZ = 0,
    FormationId = 6000014,
    Function = "CreateUnit",
    MaxSummonCount = 2,
    SingleSummonCount = 2,
    UnitType = "Monster",
    UseSelfUnitId = 1,
  },
}
r6_0.TaskId = 600001401
r4_0[600001401] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    BuffId = 6000117,
    Function = "AddBuff",
    LastTime = -1,
  },
}
r6_0.TaskId = 600001402
r4_0[600001402] = r6_0
r6_0 = {
  TargetFilter = "Self",
}
r6_0.TaskEffects = {
  [1] = {
    FXId = 600001401,
    Function = "PlayFX",
  },
}
r6_0.TaskId = 600001403
r4_0[600001403] = r6_0
return r2_0(r3_0, r4_0)
