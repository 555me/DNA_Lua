-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\BlessingGroup.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    3,
    6,
    9,
    12
  },
  RT_2 = {
    "Term_Rou_10101_MoltenBlaze"
  },
  RT_3 = {
    "Term_Rou_10103_Radiance"
  },
  RT_4 = {
    "Term_Rou_10105_Nocturne"
  },
  RT_5 = {
    "Term_Rou_10106_Glimmerfly"
  },
  RT_6 = {
    "Term_Rou_10106_Glimmerfly",
    "Term_Rou_10106_LargerGlimmerfly"
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [25, 25] id: 1
  return r1_1
end
local r3_0 = "BlessingGroup"
local r4_0 = {}
local r5_0 = {
  ActivateDesc = {
    [1] = "RLBlessingGroup_Desc_101",
    [2] = "RLBlessingGroup_Desc_102",
    [3] = "RLBlessingGroup_Desc_103",
    [4] = "RLBlessingGroup_Desc_104",
  },
  ActivateNeed = r0_0.RT_1,
  BigIcon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_BlessingType_MeleeB.T_Rouge_BlessingType_MeleeB",
}
r5_0.ExplanationId = {
  [1] = r0_0.RT_2,
  [2] = r0_0.RT_2,
  [3] = r0_0.RT_2,
  [4] = {
    "Term_Rou_10101_MoltenBlazeSabre",
    "Term_Rou_10101_MoltenBlaze"
  },
}
r5_0.GroupEffectDesc = "RLBlessingGroup_Desc_1"
r5_0.GroupEffectNum = 4
r5_0.GroupId = 1
r5_0.Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Rouge_Fire.T_Tab_Rouge_Fire"
r5_0.Name = "RLBlessingGroup_Name_1"
r5_0.PassiveEffects = {
  10101901
}
r4_0[1] = r5_0
r5_0 = {
  ActivateDesc = {
    [1] = "RLBlessingGroup_Desc_201",
    [2] = "RLBlessingGroup_Desc_202",
    [3] = "RLBlessingGroup_Desc_203",
    [4] = "RLBlessingGroup_Desc_204",
  },
  ActivateNeed = r0_0.RT_1,
  BigIcon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_BlessingType_CharA.T_Rouge_BlessingType_CharA",
}
r5_0.ExplanationId = {
  [2] = {
    "Term_Rou_10102_MiniSeaborneMoons",
    "Term_Rou_10102_SeaborneMoon"
  },
  [3] = {
    "Term_Rou_10102_MiniSeaborneMoons",
    "Term_Rou_10102_VeiledMoon"
  },
  [4] = {
    "Term_Rou_10102_VeiledMoon",
    "Term_Rou_10102_Stinger",
    "Term_Rou_10102_PhantomDrift"
  },
}
r5_0.GroupEffectDesc = "RLBlessingGroup_Desc_2"
r5_0.GroupEffectNum = 4
r5_0.GroupId = 2
r5_0.Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Rouge_Jellyfish.T_Tab_Rouge_Jellyfish"
r5_0.Name = "RLBlessingGroup_Name_2"
r5_0.PassiveEffects = {
  10102901
}
r4_0[2] = r5_0
r5_0 = {
  ActivateDesc = {
    [1] = "RLBlessingGroup_Desc_301",
    [2] = "RLBlessingGroup_Desc_302",
    [3] = "RLBlessingGroup_Desc_303",
    [4] = "RLBlessingGroup_Desc_304",
  },
  ActivateNeed = r0_0.RT_1,
  BigIcon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_BlessingType_MeleeA.T_Rouge_BlessingType_MeleeA",
}
r5_0.ExplanationId = {
  [2] = r0_0.RT_3,
  [3] = {
    "Term_Rou_10103_Radiance",
    "Term_Rou_10103_Emission"
  },
  [4] = r0_0.RT_3,
}
r5_0.GroupEffectDesc = "RLBlessingGroup_Desc_3"
r5_0.GroupEffectNum = 4
r5_0.GroupId = 3
r5_0.Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Rouge_Stone.T_Tab_Rouge_Stone"
r5_0.Name = "RLBlessingGroup_Name_3"
r5_0.PassiveEffects = {
  10103900
}
r4_0[3] = r5_0
r5_0 = {
  ActivateDesc = {
    [1] = "RLBlessingGroup_Desc_401",
    [2] = "RLBlessingGroup_Desc_402",
    [3] = "RLBlessingGroup_Desc_403",
    [4] = "RLBlessingGroup_Desc_404",
  },
  ActivateNeed = r0_0.RT_1,
  BigIcon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_BlessingType_LifeTree.T_Rouge_BlessingType_LifeTree",
}
r5_0.ExplanationId = {
  [1] = {
    "Term_Rou_10104_Lumiseed"
  },
  [2] = {
    "Term_Rou_10104_Lumiseed",
    "Term_Rou_10104_Lumileaf"
  },
  [3] = {
    "Term_Rou_10104_Lumileaf",
    "Term_Rou_10104_GlowingTree"
  },
  [4] = {
    "Term_Rou_10104_Lumiseed",
    "Term_Rou_10104_GlowingTree"
  },
}
r5_0.GroupEffectDesc = "RLBlessingGroup_Desc_4"
r5_0.GroupEffectNum = 4
r5_0.GroupId = 4
r5_0.Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Rouge_Tree.T_Tab_Rouge_Tree"
r5_0.Name = "RLBlessingGroup_Name_4"
r5_0.PassiveEffects = {
  10104900
}
r4_0[4] = r5_0
r5_0 = {
  ActivateDesc = {
    [1] = "RLBlessingGroup_Desc_501",
    [2] = "RLBlessingGroup_Desc_502",
    [3] = "RLBlessingGroup_Desc_503",
    [4] = "RLBlessingGroup_Desc_504",
  },
  ActivateNeed = r0_0.RT_1,
  BigIcon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_BlessingType_HelixLeap.T_Rouge_BlessingType_HelixLeap",
}
r5_0.ExplanationId = {
  [1] = r0_0.RT_4,
  [2] = r0_0.RT_4,
  [3] = r0_0.RT_4,
  [4] = {
    "Term_Rou_10105_Powder",
    "Term_Rou_10105_WindWings",
    "Term_Rou_10105_BladeWings"
  },
}
r5_0.GroupEffectDesc = "RLBlessingGroup_Desc_5"
r5_0.GroupEffectNum = 4
r5_0.GroupId = 5
r5_0.Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Rouge_Butterfly.T_Tab_Rouge_Butterfly"
r5_0.Name = "RLBlessingGroup_Name_5"
r5_0.PassiveEffects = {
  10105900
}
r4_0[5] = r5_0
r4_0[6] = {
  ActivateDesc = {
    [1] = "RLBlessingGroup_Desc_601",
    [2] = "RLBlessingGroup_Desc_602",
    [3] = "RLBlessingGroup_Desc_603",
    [4] = "RLBlessingGroup_Desc_604",
  },
  ActivateNeed = r0_0.RT_1,
  BigIcon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_BlessingType_DanmakuA.T_Rouge_BlessingType_DanmakuA",
  ExplanationId = {
    [1] = r0_0.RT_5,
    [2] = r0_0.RT_6,
    [3] = r0_0.RT_6,
    [4] = r0_0.RT_5,
  },
  GroupEffectDesc = "RLBlessingGroup_Desc_6",
  GroupEffectNum = 4,
  GroupId = 6,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Rouge_Firefly.T_Tab_Rouge_Firefly",
  Name = "RLBlessingGroup_Name_6",
  PassiveEffects = {
    10106901
  },
}
r4_0[7] = {
  ActivateDesc = {
    [1] = "RLBlessingGroup_Desc_701",
    [2] = "RLBlessingGroup_Desc_702",
    [3] = "RLBlessingGroup_Desc_703",
    [4] = "RLBlessingGroup_Desc_704",
  },
  ActivateNeed = r0_0.RT_1,
  BigIcon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_BlessingType_SurvivalA.T_Rouge_BlessingType_SurvivalA",
  GroupEffectDesc = "RLBlessingGroup_Desc_7",
  GroupEffectNum = 4,
  GroupId = 7,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Rouge_Thorns.T_Tab_Rouge_Thorns",
  Name = "RLBlessingGroup_Name_7",
  PassiveEffects = {
    10107901
  },
}
return r2_0(r3_0, r4_0)
