-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\BattlePet.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    AttrName = "JumpVelocityModifier",
    Value = "#1",
  },
  RT_2 = {
    AttrName = "ATK",
    Rate = "#1",
  },
  RT_3 = {
    AttrName = "ATK_Dark",
    Rate = "#1",
  },
  RT_4 = {
    AttrName = "MaxHp",
    Rate = "#2",
  },
  RT_5 = {
    AttrName = "ATK_Water",
    Rate = "#1",
  },
  RT_6 = {
    AttrName = "ATK_Fire",
    Rate = "#1",
  },
  RT_7 = {
    AttrName = "ATK_Thunder",
    Rate = "#1",
  },
  RT_8 = {
    AttrName = "ATK_Wind",
    Rate = "#1",
  },
  RT_9 = {
    AttrName = "ATK_Light",
    Rate = "#1",
  },
}
r0_0.RT_10 = {
  [1] = r0_0.RT_3,
}
r0_0.RT_11 = {
  Normal = "#2",
}
r0_0.RT_12 = {
  [1] = r0_0.RT_5,
}
r0_0.RT_13 = {
  [1] = r0_0.RT_6,
}
r0_0.RT_14 = {
  [1] = r0_0.RT_7,
}
r0_0.RT_15 = {
  [1] = r0_0.RT_8,
}
r0_0.RT_16 = {
  [1] = r0_0.RT_9,
}
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [60, 60] id: 1
  return r1_1
end
local r4_0 = {}
r4_0[401] = {
  AddAttrs = {
    [1] = r0_0.RT_3,
    [2] = r0_0.RT_4,
  },
  EffectCreatureId = 4011,
  PassiveEffectDesc = "PET_401_PASSIVE",
  PassiveEffectDescParameter = {
    [1] = "$#BattlePet[401].AddAttrs[1].Rate*100$%",
    [2] = "$#BattlePet[401].AddAttrs[2].Rate*100$%",
  },
  PetId = 401,
  PetType = "Pet",
  SupportSkillId = 401,
}
r4_0[402] = {
  AddAttrs = {
    [1] = r0_0.RT_5,
    [2] = r0_0.RT_4,
  },
  EffectCreatureId = 4021,
  PassiveEffectDesc = "PET_402_PASSIVE",
  PassiveEffectDescParameter = {
    [1] = "$#BattlePet[402].AddAttrs[1].Rate*100$%",
    [2] = "$#BattlePet[402].AddAttrs[2].Rate*100$%",
  },
  PetId = 402,
  PetType = "Pet",
  SupportSkillId = 402,
}
r4_0[403] = {
  AddAttrs = {
    [1] = r0_0.RT_6,
    [2] = r0_0.RT_4,
  },
  EffectCreatureId = 4031,
  PassiveEffectDesc = "PET_403_PASSIVE",
  PassiveEffectDescParameter = {
    [1] = "$#BattlePet[403].AddAttrs[1].Rate*100$%",
    [2] = "$#BattlePet[403].AddAttrs[2].Rate*100$%",
  },
  PetId = 403,
  PetType = "Pet",
  SupportSkillId = 403,
}
r4_0[404] = {
  AddAttrs = {
    [1] = r0_0.RT_7,
    [2] = r0_0.RT_4,
  },
  EffectCreatureId = 4041,
  PassiveEffectDesc = "PET_404_PASSIVE",
  PassiveEffectDescParameter = {
    [1] = "$#BattlePet[404].AddAttrs[1].Rate*100$%",
    [2] = "$#BattlePet[404].AddAttrs[2].Rate*100$%",
  },
  PetId = 404,
  PetType = "Pet",
  SupportSkillId = 404,
}
r4_0[405] = {
  AddAttrs = {
    [1] = r0_0.RT_8,
    [2] = r0_0.RT_4,
  },
  EffectCreatureId = 4051,
  PassiveEffectDesc = "PET_405_PASSIVE",
  PassiveEffectDescParameter = {
    [1] = "$#BattlePet[405].AddAttrs[1].Rate*100$%",
    [2] = "$#BattlePet[405].AddAttrs[2].Rate*100$%",
  },
  PetId = 405,
  PetType = "Pet",
  SupportSkillId = 405,
}
r4_0[406] = {
  AddAttrs = {
    [1] = r0_0.RT_9,
    [2] = r0_0.RT_4,
  },
  EffectCreatureId = 4061,
  PassiveEffectDesc = "PET_406_PASSIVE",
  PassiveEffectDescParameter = {
    [1] = "$#BattlePet[406].AddAttrs[1].Rate*100$%",
    [2] = "$#BattlePet[406].AddAttrs[2].Rate*100$%",
  },
  PetId = 406,
  PetType = "Pet",
  SupportSkillId = 406,
}
local r6_0 = {}
r6_0.AddAttrs = {
  [1] = {
    AttrName = "DropDistance",
    Value = 2000,
  },
}
r6_0.BonusRateOffset = "#1"
r6_0.EffectCreatureId = 4071
r6_0.ExpRate = {
  AttrName = "ExpRate",
  Value = "#2",
}
r6_0.PassiveEffectDesc = "PET_407_PASSIVE"
r6_0.PassiveEffectDescParameter = {
  [1] = "$#BattlePet[407].BonusRateOffset*100$%",
  [2] = "$#BattlePet[407].ExpRate.Value*100$%",
  [3] = "$#BattlePet[407].AddAttrs[1].Value/100$",
}
r6_0.PetId = 407
r6_0.PetType = "Pet"
r6_0.SupportSkillId = 407
r4_0[407] = r6_0
r6_0 = {}
r6_0.AddAttrs = {
  [1] = r0_0.RT_1,
  [2] = {
    AttrName = "BulletJumpVelocityModifier",
    Value = "#2",
  },
  [3] = {
    AttrName = "SlideFrictionModifier",
    Value = "#3",
  },
}
r6_0.EffectCreatureId = 4081
r6_0.PassiveEffectDesc = "PET_408_PASSIVE"
r6_0.PassiveEffectDescParameter = {
  [1] = "$#BattlePet[408].AddAttrs[1].Value*100$%",
  [2] = "$#BattlePet[408].AddAttrs[2].Value*100$%",
  [3] = "$-#BattlePet[408].AddAttrs[3].Value*100$%",
}
r6_0.PetId = 408
r6_0.PetType = "Pet"
r6_0.SupportSkillId = 408
r4_0[408] = r6_0
r6_0 = {}
r6_0.AddAttrs = {
  [1] = r0_0.RT_2,
  [2] = r0_0.RT_4,
  [3] = {
    AttrName = "Def",
    Rate = "#3",
  },
}
r6_0.EffectCreatureId = 4091
r6_0.PassiveEffectDesc = "PET_409_PASSIVE"
r6_0.PassiveEffectDescParameter = {
  [1] = "$#BattlePet[409].AddAttrs[1].Rate*100$%",
  [2] = "$#BattlePet[409].AddAttrs[2].Rate*100$%",
  [3] = "$#BattlePet[409].AddAttrs[3].Rate*100$%",
}
r6_0.PetId = 409
r6_0.PetType = "Pet"
r6_0.SupportSkillId = 409
r4_0[409] = r6_0
r4_0[411] = {
  AddAttrs = r0_0.RT_10,
  AddModMultiplier = r0_0.RT_11,
  EffectCreatureId = 4111,
  PassiveEffectDesc = "PET_411_PASSIVE",
  PassiveEffectDescParameter = {
    [1] = "$#BattlePet[411].AddAttrs[1].Rate*100$%",
    [2] = "$#BattlePet[411].AddModMultiplier.Normal*100$%",
  },
  PetId = 411,
  PetType = "Pet",
  SupportSkillId = 411,
}
r4_0[412] = {
  AddAttrs = r0_0.RT_12,
  AddModMultiplier = r0_0.RT_11,
  EffectCreatureId = 4121,
  PassiveEffectDesc = "PET_412_PASSIVE",
  PassiveEffectDescParameter = {
    [1] = "$#BattlePet[412].AddAttrs[1].Rate*100$%",
    [2] = "$#BattlePet[412].AddModMultiplier.Normal*100$%",
  },
  PetId = 412,
  PetType = "Pet",
  SupportSkillId = 412,
}
r4_0[413] = {
  AddAttrs = r0_0.RT_13,
  AddModMultiplier = r0_0.RT_11,
  EffectCreatureId = 4131,
  PassiveEffectDesc = "PET_413_PASSIVE",
  PassiveEffectDescParameter = {
    [1] = "$#BattlePet[413].AddAttrs[1].Rate*100$%",
    [2] = "$#BattlePet[413].AddModMultiplier.Normal*100$%",
  },
  PetId = 413,
  PetType = "Pet",
  SupportSkillId = 413,
}
r4_0[414] = {
  AddAttrs = r0_0.RT_14,
  AddModMultiplier = r0_0.RT_11,
  EffectCreatureId = 4141,
  PassiveEffectDesc = "PET_414_PASSIVE",
  PassiveEffectDescParameter = {
    [1] = "$#BattlePet[414].AddAttrs[1].Rate*100$%",
    [2] = "$#BattlePet[414].AddModMultiplier.Normal*100$%",
  },
  PetId = 414,
  PetType = "Pet",
  SupportSkillId = 414,
}
r4_0[415] = {
  AddAttrs = r0_0.RT_15,
  AddModMultiplier = r0_0.RT_11,
  EffectCreatureId = 4151,
  PassiveEffectDesc = "PET_415_PASSIVE",
  PassiveEffectDescParameter = {
    [1] = "$#BattlePet[415].AddAttrs[1].Rate*100$%",
    [2] = "$#BattlePet[415].AddModMultiplier.Normal*100$%",
  },
  PetId = 415,
  PetType = "Pet",
  SupportSkillId = 415,
}
r4_0[416] = {
  AddAttrs = r0_0.RT_16,
  AddModMultiplier = r0_0.RT_11,
  EffectCreatureId = 4161,
  PassiveEffectDesc = "PET_416_PASSIVE",
  PassiveEffectDescParameter = {
    [1] = "$#BattlePet[416].AddAttrs[1].Rate*100$%",
    [2] = "$#BattlePet[416].AddModMultiplier.Normal*100$%",
  },
  PetId = 416,
  PetType = "Pet",
  SupportSkillId = 416,
}
r4_0[421] = {
  AddAttrs = r0_0.RT_10,
  AddModMultiplier = {
    Dark = "#2",
  },
  EffectCreatureId = 4211,
  PassiveEffectDesc = "PET_421_PASSIVE",
  PassiveEffectDescParameter = {
    [1] = "$#BattlePet[421].AddAttrs[1].Rate*100$%",
    [2] = "$#BattlePet[421].AddModMultiplier.Dark*100$%",
  },
  PetId = 421,
  PetType = "Pet",
  SupportSkillId = 421,
}
r4_0[422] = {
  AddAttrs = r0_0.RT_12,
  AddModMultiplier = {
    Water = "#2",
  },
  EffectCreatureId = 4221,
  PassiveEffectDesc = "PET_422_PASSIVE",
  PassiveEffectDescParameter = {
    [1] = "$#BattlePet[422].AddAttrs[1].Rate*100$%",
    [2] = "$#BattlePet[422].AddModMultiplier.Water*100$%",
  },
  PetId = 422,
  PetType = "Pet",
  SupportSkillId = 422,
}
r4_0[423] = {
  AddAttrs = r0_0.RT_13,
  AddModMultiplier = {
    Fire = "#2",
  },
  EffectCreatureId = 4231,
  PassiveEffectDesc = "PET_423_PASSIVE",
  PassiveEffectDescParameter = {
    [1] = "$#BattlePet[423].AddAttrs[1].Rate*100$%",
    [2] = "$#BattlePet[423].AddModMultiplier.Fire*100$%",
  },
  PetId = 423,
  PetType = "Pet",
  SupportSkillId = 423,
}
r4_0[424] = {
  AddAttrs = r0_0.RT_14,
  AddModMultiplier = {
    Thunder = "#2",
  },
  EffectCreatureId = 4241,
  PassiveEffectDesc = "PET_424_PASSIVE",
  PassiveEffectDescParameter = {
    [1] = "$#BattlePet[424].AddAttrs[1].Rate*100$%",
    [2] = "$#BattlePet[424].AddModMultiplier.Thunder*100$%",
  },
  PetId = 424,
  PetType = "Pet",
  SupportSkillId = 424,
}
r4_0[425] = {
  AddAttrs = r0_0.RT_15,
  AddModMultiplier = {
    Wind = "#2",
  },
  EffectCreatureId = 4251,
  PassiveEffectDesc = "PET_425_PASSIVE",
  PassiveEffectDescParameter = {
    [1] = "$#BattlePet[425].AddAttrs[1].Rate*100$%",
    [2] = "$#BattlePet[425].AddModMultiplier.Wind*100$%",
  },
  PetId = 425,
  PetType = "Pet",
  SupportSkillId = 425,
}
r4_0[426] = {
  AddAttrs = r0_0.RT_16,
  AddModMultiplier = {
    Light = "#2",
  },
  EffectCreatureId = 4261,
  PassiveEffectDesc = "PET_426_PASSIVE",
  PassiveEffectDescParameter = {
    [1] = "$#BattlePet[426].AddAttrs[1].Rate*100$%",
    [2] = "$#BattlePet[426].AddModMultiplier.Light*100$%",
  },
  PetId = 426,
  PetType = "Pet",
  SupportSkillId = 426,
}
r4_0[491] = {
  EffectCreatureId = 4911,
  PetId = 491,
  PetType = "Pet",
}
r4_0[492] = {
  EffectCreatureId = 4921,
  PetId = 492,
  PetType = "Pet",
}
r4_0[493] = {
  EffectCreatureId = 4931,
  PetId = 493,
  PetType = "Pet",
}
r4_0[494] = {
  EffectCreatureId = 4932,
  PetId = 494,
  PetType = "Pet",
}
r4_0[495] = {
  EffectCreatureId = 4933,
  PetId = 495,
  PetType = "Pet",
}
r4_0[496] = {
  EffectCreatureId = 4934,
  PetId = 496,
  PetType = "Pet",
}
r4_0[601] = {
  EffectCreatureId = 6011,
  PetId = 601,
  PetType = "Pet",
  SupportSkillId = 601,
}
r4_0[602] = {
  EffectCreatureId = 6021,
  PetId = 602,
  PetType = "Pet",
  SupportSkillId = 602,
}
r4_0[603] = {
  EffectCreatureId = 6031,
  PetId = 603,
  PetType = "Pet",
  SupportSkillId = 603,
}
r4_0[604] = {
  EffectCreatureId = 6041,
  PetId = 604,
  PetType = "Pet",
  SupportSkillId = 604,
}
r4_0[901] = {
  EffectCreatureId = 9011,
  PetId = 901,
  PetType = "Pet",
  SupportSkillId = 901,
}
r6_0 = {}
r6_0.AddAttrs = {
  [1] = {
    AttrName = "DropDistance",
    Value = "#1",
  },
}
r6_0.PassiveEffectDesc = "AFFIX_1001_DESC"
r6_0.PassiveEffectDescParameter = {
  [1] = "$#BattlePet[1001].AddAttrs[1].Value/100$",
}
r6_0.PetId = 1001
r6_0.PetType = "Affix"
r4_0[1001] = r6_0
r4_0[1002] = {
  BonusRateOffset = "#1",
  PassiveEffectDesc = "AFFIX_1002_DESC",
  PassiveEffectDescParameter = {
    [1] = "$#BattlePet[1002].BonusRateOffset*100$%",
  },
  PetId = 1002,
  PetType = "Affix",
}
r4_0[1003] = {
  ExpRate = {
    AttrName = "ExpRate",
    Value = "#1",
  },
  PassiveEffectDesc = "AFFIX_1003_DESC",
  PassiveEffectDescParameter = {
    [1] = "$#BattlePet[1003].ExpRate.Value*100$%",
  },
  PetId = 1003,
  PetType = "Affix",
}
r6_0 = {}
r6_0.AddAttrs = {
  [1] = {
    AttrName = "AdditionalRecoverTime",
    Value = 1,
  },
}
r6_0.PassiveEffectDesc = "AFFIX_1004_DESC"
r6_0.PassiveEffectDescParameter = {
  [1] = "$#BattlePet[1004].AddAttrs[1].Value$",
}
r6_0.PetId = 1004
r6_0.PetType = "Affix"
r4_0[1004] = r6_0
r6_0 = {}
r6_0.AddAttrs = {
  [1] = {
    AttrName = "WalkSpeedModifier",
    Value = "#1",
  },
}
r6_0.PassiveEffectDesc = "AFFIX_1005_DESC"
r6_0.PassiveEffectDescParameter = {
  [1] = "$#BattlePet[1005].AddAttrs[1].Value*100$%",
}
r6_0.PetId = 1005
r6_0.PetType = "Affix"
r4_0[1005] = r6_0
r4_0[1006] = {
  AddAttrs = {
    [1] = r0_0.RT_1,
  },
  PassiveEffectDesc = "AFFIX_1006_DESC",
  PassiveEffectDescParameter = {
    [1] = "$#BattlePet[1006].AddAttrs[1].Value*100$%",
  },
  PetId = 1006,
  PetType = "Affix",
}
r6_0 = {}
r6_0.AddAttrs = {
  [1] = {
    AttrName = "BulletJumpVelocityModifier",
    Value = "#1",
  },
}
r6_0.PassiveEffectDesc = "AFFIX_1007_DESC"
r6_0.PassiveEffectDescParameter = {
  [1] = "$#BattlePet[1007].AddAttrs[1].Value*100$%",
}
r6_0.PetId = 1007
r6_0.PetType = "Affix"
r4_0[1007] = r6_0
r6_0 = {}
r6_0.AddAttrs = {
  [1] = {
    AttrName = "SlideFrictionModifier",
    Value = "#1",
  },
}
r6_0.PassiveEffectDesc = "AFFIX_1008_DESC"
r6_0.PassiveEffectDescParameter = {
  [1] = "$-#BattlePet[1008].AddAttrs[1].Value*100$%",
}
r6_0.PetId = 1008
r6_0.PetType = "Affix"
r4_0[1008] = r6_0
r6_0 = {}
r6_0.AddAttrs = {
  [1] = {
    AttrName = "AvoidChargeCd",
    Rate = "#1",
  },
}
r6_0.PassiveEffectDesc = "AFFIX_1009_DESC"
r6_0.PassiveEffectDescParameter = {
  [1] = "$-#BattlePet[1009].AddAttrs[1].Rate*100$%",
}
r6_0.PetId = 1009
r6_0.PetType = "Affix"
r4_0[1009] = r6_0
r4_0[1010] = {
  AddAttrs = {
    [1] = r0_0.RT_2,
  },
  PassiveEffectDesc = "AFFIX_1010_DESC",
  PassiveEffectDescParameter = {
    [1] = "$#BattlePet[1010].AddAttrs[1].Rate*100$%",
  },
  PetId = 1010,
  PetType = "Affix",
}
r6_0 = {}
r6_0.AddAttrs = {
  [1] = {
    AttrName = "Def",
    Rate = "#1",
  },
}
r6_0.PassiveEffectDesc = "AFFIX_1011_DESC"
r6_0.PassiveEffectDescParameter = {
  [1] = "$#BattlePet[1011].AddAttrs[1].Rate*100$%",
}
r6_0.PetId = 1011
r6_0.PetType = "Affix"
r4_0[1011] = r6_0
r6_0 = {}
r6_0.AddAttrs = {
  [1] = {
    AttrName = "MaxHp",
    Rate = "#1",
  },
}
r6_0.PassiveEffectDesc = "AFFIX_1012_DESC"
r6_0.PassiveEffectDescParameter = {
  [1] = "$#BattlePet[1012].AddAttrs[1].Rate*100$%",
}
r6_0.PetId = 1012
r6_0.PetType = "Affix"
r4_0[1012] = r6_0
r6_0 = {}
r6_0.AddAttrs = {
  [1] = {
    AttrName = "MaxES",
    Rate = "#1",
  },
}
r6_0.PassiveEffectDesc = "AFFIX_1013_DESC"
r6_0.PassiveEffectDescParameter = {
  [1] = "$#BattlePet[1013].AddAttrs[1].Rate*100$%",
}
r6_0.PetId = 1013
r6_0.PetType = "Affix"
r4_0[1013] = r6_0
r6_0 = {}
r6_0.AddAttrs = {
  [1] = {
    AttrName = "SupportSkillCD",
    Rate = "#1",
  },
}
r6_0.PassiveEffectDesc = "AFFIX_1014_DESC"
r6_0.PassiveEffectDescParameter = {
  [1] = "$-#BattlePet[1014].AddAttrs[1].Rate*100$%",
}
r6_0.PetId = 1014
r6_0.PetType = "Affix"
r4_0[1014] = r6_0
r4_0[1015] = {
  ConsumeExpFix = "#1",
  PassiveEffectDesc = "AFFIX_1015_DESC",
  PassiveEffectDescParameter = {
    [1] = "$#BattlePet[1015].ConsumeExpFix*100$%",
  },
  PetId = 1015,
  PetType = "Affix",
}
r4_0[1016] = {
  CanDecode = true,
  PassiveEffectDesc = "AFFIX_1016_DESC",
  PetId = 1016,
  PetType = "Affix",
}
r4_0[1017] = {
  CanAutoFishing = true,
  PassiveEffectDesc = "AFFIX_1017_DESC",
  PetId = 1017,
  PetType = "Affix",
}
return r1_0("BattlePet", r4_0)
