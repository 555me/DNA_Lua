-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\RougeLikeTreasure.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    10
  },
  RT_2 = {
    20
  },
  RT_3 = {
    49
  },
  RT_4 = {
    40
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [15, 15] id: 1
  return r1_1
end
local r3_0 = "RougeLikeTreasure"
local r4_0 = {}
local r5_0 = 10101
local r6_0 = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_10101",
  EndPoints = r0_0.RT_1,
  IPDesc = "RLTreasure_IPDesc_10101",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_01.T_Rouge_Treasure_01",
  Name = "RLTreasure_Name_10101",
  RLArchiveId = 1,
}
r6_0.ServerBuild = {
  [1] = {
    1,
    15
  },
}
r6_0.ServerBuildValue = {
  [1] = "$#RougelikeServerBuild[1].Param[1]$",
}
r6_0.ShopPrices = 200
r6_0.ShopWeight = 1000
r6_0.SimpleDesc = "RLTreasure_SimpleDesc_10101"
r6_0.TreasureGroup = 1
r6_0.TreasureId = 10101
r6_0.TreasureRarity = 1
r6_0.TreasureWeight = 1000
r6_0.UnlockConditionText = "RLTreasure_UnlockCon_Default"
r4_0[r5_0] = r6_0
r5_0 = 10102
r6_0 = {
  Desc = "RLTreasure_Desc_10102",
  EndPoints = r0_0.RT_1,
  IPDesc = "RLTreasure_IPDesc_10102",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_02.T_Rouge_Treasure_02",
  Name = "RLTreasure_Name_10102",
  RLArchiveId = 2,
}
r6_0.ServerBuild = {
  [1] = {
    3
  },
}
r6_0.ServerBuildValue = {
  [1] = "$(1-#RougelikeServerBuild[3].Param[1])*100$%",
}
r6_0.SimpleDesc = "RLTreasure_SimpleDesc_10102"
r6_0.TreasureGroup = 1
r6_0.TreasureId = 10102
r6_0.TreasureRarity = 1
r6_0.TreasureWeight = 1000
r6_0.UnlockConditionText = "RLTreasure_UnlockCon_Default"
r4_0[r5_0] = r6_0
r4_0[10103] = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_10103",
  EndPoints = r0_0.RT_1,
  IPDesc = "RLTreasure_IPDesc_10103",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_05.T_Rouge_Treasure_05",
  ModEquip = "Role",
  Name = "RLTreasure_Name_10103",
  RLArchiveId = 3,
  ShopPrices = 200,
  ShopWeight = 1000,
  SimpleDesc = "RLTreasure_SimpleDesc_10103",
  TreasureGroup = 1,
  TreasureId = 10103,
  TreasureMod = 20104001,
  TreasureRarity = 1,
  TreasureWeight = 1000,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r4_0[10104] = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_10104",
  EndPoints = r0_0.RT_1,
  IPDesc = "RLTreasure_IPDesc_10104",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_06.T_Rouge_Treasure_06",
  ModEquip = "Role",
  Name = "RLTreasure_Name_10104",
  RLArchiveId = 4,
  ShopPrices = 200,
  ShopWeight = 1000,
  SimpleDesc = "RLTreasure_SimpleDesc_10104",
  TreasureGroup = 1,
  TreasureId = 10104,
  TreasureMod = 20105001,
  TreasureRarity = 1,
  TreasureWeight = 1000,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r5_0 = 10105
r6_0 = {
  Desc = "RLTreasure_Desc_10105",
  EndPoints = r0_0.RT_1,
  IPDesc = "RLTreasure_IPDesc_10105",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_07.T_Rouge_Treasure_07",
  Name = "RLTreasure_Name_10105",
  RLArchiveId = 5,
}
r6_0.ServerBuild = {
  [1] = {
    19
  },
}
r6_0.ServerBuildValue = {
  [1] = "$#RougelikeServerBuild[19].Param[1]*100$%",
}
r6_0.SimpleDesc = "RLTreasure_SimpleDesc_10105"
r6_0.TreasureGroup = 2
r6_0.TreasureId = 10105
r6_0.TreasureRarity = 1
r6_0.TreasureWeight = 1000
r6_0.UnlockConditionText = "RLTreasure_UnlockCon_Default"
r4_0[r5_0] = r6_0
r4_0[10106] = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_10106",
  EndPoints = r0_0.RT_1,
  IPDesc = "RLTreasure_IPDesc_10106",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_09.T_Rouge_Treasure_09",
  ModEquip = "Role",
  Name = "RLTreasure_Name_10106",
  RLArchiveId = 6,
  ShopPrices = 200,
  ShopWeight = 1000,
  SimpleDesc = "RLTreasure_SimpleDesc_10106",
  TreasureGroup = 1,
  TreasureId = 10106,
  TreasureMod = 20107001,
  TreasureRarity = 1,
  TreasureWeight = 1000,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r4_0[10107] = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_10107",
  EndPoints = r0_0.RT_1,
  IPDesc = "RLTreasure_IPDesc_10107",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_21.T_Rouge_Treasure_21",
  ModEquip = "Role",
  Name = "RLTreasure_Name_10107",
  RLArchiveId = 7,
  ShopPrices = 200,
  ShopWeight = 1000,
  SimpleDesc = "RLTreasure_SimpleDesc_10107",
  TreasureGroup = 1,
  TreasureId = 10107,
  TreasureMod = 20101001,
  TreasureRarity = 1,
  TreasureWeight = 1000,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r4_0[10108] = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_10108",
  EndPoints = r0_0.RT_1,
  IPDesc = "RLTreasure_IPDesc_10108",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_32.T_Rouge_Treasure_32",
  ModEquip = "Role",
  Name = "RLTreasure_Name_10108",
  RLArchiveId = 8,
  ShopPrices = 200,
  ShopWeight = 1000,
  SimpleDesc = "RLTreasure_SimpleDesc_10108",
  TreasureGroup = 10108,
  TreasureId = 10108,
  TreasureMod = 20108001,
  TreasureRarity = 1,
  TreasureWeight = 1000,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r4_0[10109] = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_10109",
  EndPoints = r0_0.RT_1,
  IPDesc = "RLTreasure_IPDesc_10109",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_32.T_Rouge_Treasure_32",
  ModEquip = "Role",
  Name = "RLTreasure_Name_10109",
  RLArchiveId = 9,
  ShopPrices = 200,
  ShopWeight = 1000,
  SimpleDesc = "RLTreasure_SimpleDesc_10109",
  TreasureGroup = 10108,
  TreasureId = 10109,
  TreasureMod = 20109001,
  TreasureRarity = 1,
  TreasureWeight = 1000,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r4_0[10110] = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_10110",
  EndPoints = r0_0.RT_1,
  IPDesc = "RLTreasure_IPDesc_10110",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_32.T_Rouge_Treasure_32",
  ModEquip = "Role",
  Name = "RLTreasure_Name_10110",
  RLArchiveId = 10,
  ShopPrices = 200,
  ShopWeight = 1000,
  SimpleDesc = "RLTreasure_SimpleDesc_10110",
  TreasureGroup = 10108,
  TreasureId = 10110,
  TreasureMod = 20110001,
  TreasureRarity = 1,
  TreasureWeight = 1000,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r4_0[10111] = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_10111",
  EndPoints = r0_0.RT_1,
  IPDesc = "RLTreasure_IPDesc_10111",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_32.T_Rouge_Treasure_32",
  ModEquip = "Role",
  Name = "RLTreasure_Name_10111",
  RLArchiveId = 11,
  ShopPrices = 200,
  ShopWeight = 1000,
  SimpleDesc = "RLTreasure_SimpleDesc_10111",
  TreasureGroup = 10108,
  TreasureId = 10111,
  TreasureMod = 20111001,
  TreasureRarity = 1,
  TreasureWeight = 1000,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r4_0[10112] = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_10112",
  EndPoints = r0_0.RT_1,
  IPDesc = "RLTreasure_IPDesc_10112",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_32.T_Rouge_Treasure_32",
  ModEquip = "Role",
  Name = "RLTreasure_Name_10112",
  RLArchiveId = 12,
  ShopPrices = 200,
  ShopWeight = 1000,
  SimpleDesc = "RLTreasure_SimpleDesc_10112",
  TreasureGroup = 10108,
  TreasureId = 10112,
  TreasureMod = 20112001,
  TreasureRarity = 1,
  TreasureWeight = 1000,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r4_0[10113] = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_10113",
  EndPoints = r0_0.RT_1,
  IPDesc = "RLTreasure_IPDesc_10113",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_32.T_Rouge_Treasure_32",
  ModEquip = "Role",
  Name = "RLTreasure_Name_10113",
  RLArchiveId = 13,
  ShopPrices = 200,
  ShopWeight = 1000,
  SimpleDesc = "RLTreasure_SimpleDesc_10113",
  TreasureGroup = 10108,
  TreasureId = 10113,
  TreasureMod = 20113001,
  TreasureRarity = 1,
  TreasureWeight = 1000,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r4_0[10114] = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_10114",
  EndPoints = r0_0.RT_1,
  IPDesc = "RLTreasure_IPDesc_10113",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_28.T_Rouge_Treasure_28",
  ModEquip = "Role",
  Name = "RLTreasure_Name_10114",
  RLArchiveId = 14,
  ShopPrices = 200,
  ShopWeight = 1000,
  SimpleDesc = "RLTreasure_SimpleDesc_10114",
  TreasureGroup = 1,
  TreasureId = 10114,
  TreasureMod = 20120001,
  TreasureRarity = 1,
  TreasureWeight = 1000,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r5_0 = 10201
r6_0 = {
  Desc = "RLTreasure_Desc_10201",
  EndPoints = r0_0.RT_2,
  IPDesc = "RLTreasure_IPDesc_10201",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_03.T_Rouge_Treasure_03",
  Name = "RLTreasure_Name_10201",
  RLArchiveId = 15,
}
r6_0.ServerBuild = {
  [1] = {
    4
  },
}
r6_0.SimpleDesc = "RLTreasure_SimpleDesc_10201"
r6_0.TreasureGroup = 3
r6_0.TreasureId = 10201
r6_0.TreasureRarity = 2
r6_0.TreasureWeight = 500
r6_0.UnlockConditionText = "RLTreasure_UnlockCon_Default"
r4_0[r5_0] = r6_0
r5_0 = 10202
r6_0 = {
  Desc = "RLTreasure_Desc_10202",
  EndPoints = r0_0.RT_2,
  IPDesc = "RLTreasure_IPDesc_10202",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_03.T_Rouge_Treasure_03",
  Name = "RLTreasure_Name_10202",
  RLArchiveId = 16,
}
r6_0.ServerBuild = {
  [1] = {
    16
  },
}
r6_0.SimpleDesc = "RLTreasure_SimpleDesc_10202"
r6_0.TreasureGroup = 3
r6_0.TreasureId = 10202
r6_0.TreasureRarity = 2
r6_0.TreasureWeight = 500
r6_0.UnlockConditionText = "RLTreasure_UnlockCon_Default"
r4_0[r5_0] = r6_0
r4_0[10203] = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_10203",
  EndPoints = r0_0.RT_2,
  IPDesc = "RLTreasure_IPDesc_10203",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_19.T_Rouge_Treasure_19",
  ModEquip = "Role",
  Name = "RLTreasure_Name_10203",
  RLArchiveId = 17,
  ShopPrices = 400,
  ShopWeight = 500,
  SimpleDesc = "RLTreasure_SimpleDesc_10203",
  TreasureGroup = 1,
  TreasureId = 10203,
  TreasureMod = 20103001,
  TreasureRarity = 2,
  TreasureWeight = 500,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r4_0[10204] = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_10204",
  EndPoints = r0_0.RT_2,
  IPDesc = "RLTreasure_IPDesc_10204",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_22.T_Rouge_Treasure_22",
  ModEquip = "Role",
  Name = "RLTreasure_Name_10204",
  RLArchiveId = 18,
  ShopPrices = 400,
  ShopWeight = 500,
  SimpleDesc = "RLTreasure_SimpleDesc_10204",
  TreasureGroup = 1,
  TreasureId = 10204,
  TreasureMod = 20102001,
  TreasureRarity = 2,
  TreasureWeight = 500,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r4_0[10205] = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_10205",
  EndPoints = r0_0.RT_2,
  IPDesc = "RLTreasure_IPDesc_10205",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_24.T_Rouge_Treasure_24",
  ModEquip = "Role",
  Name = "RLTreasure_Name_10205",
  RLArchiveId = 19,
  ShopPrices = 400,
  ShopWeight = 500,
  SimpleDesc = "RLTreasure_SimpleDesc_10205",
  TreasureGroup = 1,
  TreasureId = 10205,
  TreasureMod = 20114001,
  TreasureRarity = 2,
  TreasureWeight = 500,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r4_0[10206] = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_10206",
  EndPoints = r0_0.RT_2,
  IPDesc = "RLTreasure_IPDesc_10206",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_25.T_Rouge_Treasure_25",
  ModEquip = "Role",
  Name = "RLTreasure_Name_10206",
  RLArchiveId = 20,
  ShopPrices = 400,
  ShopWeight = 500,
  SimpleDesc = "RLTreasure_SimpleDesc_10206",
  TreasureGroup = 1,
  TreasureId = 10206,
  TreasureMod = 20115001,
  TreasureRarity = 2,
  TreasureWeight = 500,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r5_0 = 10207
r6_0 = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_10207",
  EndPoints = r0_0.RT_2,
  IPDesc = "RLTreasure_IPDesc_10207",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_23.T_Rouge_Treasure_23",
  ModEquip = "Role",
  Name = "RLTreasure_Name_10207",
  RLArchiveId = 21,
}
r6_0.ServerBuild = {
  [1] = {
    25
  },
}
r6_0.ServerBuildValue = {
  [1] = "$#RougelikeServerBuild[25].Param[1]$",
}
r6_0.ShopPrices = 400
r6_0.ShopWeight = 500
r6_0.SimpleDesc = "RLTreasure_SimpleDesc_10207"
r6_0.TreasureGroup = 1
r6_0.TreasureId = 10207
r6_0.TreasureMod = 20116001
r6_0.TreasureRarity = 2
r6_0.TreasureWeight = 500
r6_0.UnlockConditionText = "RLTreasure_UnlockCon_Default"
r4_0[r5_0] = r6_0
r5_0 = 10209
r6_0 = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_10209",
  EndPoints = r0_0.RT_2,
  IPDesc = "RLTreasure_IPDesc_10209",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_17.T_Rouge_Treasure_17",
  Name = "RLTreasure_Name_10209",
  RLArchiveId = 22,
}
r6_0.ServerBuild = {
  [1] = {
    22
  },
}
r6_0.ShopPrices = 400
r6_0.ShopWeight = 500
r6_0.SimpleDesc = "RLTreasure_SimpleDesc_10209"
r6_0.TreasureGroup = 1
r6_0.TreasureId = 10209
r6_0.TreasureRarity = 2
r6_0.TreasureWeight = 500
r6_0.UnlockConditionText = "RLTreasure_UnlockCon_Default"
r4_0[r5_0] = r6_0
r5_0 = 10210
r6_0 = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_10210",
  EndPoints = r0_0.RT_2,
  IPDesc = "RLTreasure_IPDesc_10210",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_20.T_Rouge_Treasure_20",
  Name = "RLTreasure_Name_10210",
  RLArchiveId = 23,
}
r6_0.ServerBuild = {
  [1] = {
    23
  },
}
r6_0.ServerBuildValue = {
  [1] = "$#RougelikeServerBuild[23].Param[2]$",
  [2] = "$#RougelikeServerBuild[24].Param[1]$",
}
r6_0.ShopPrices = 400
r6_0.ShopWeight = 500
r6_0.SimpleDesc = "RLTreasure_SimpleDesc_10210"
r6_0.TreasureGroup = 1
r6_0.TreasureId = 10210
r6_0.TreasureRarity = 2
r6_0.TreasureWeight = 500
r6_0.UnlockConditionText = "RLTreasure_UnlockCon_Default"
r4_0[r5_0] = r6_0
r5_0 = 10211
r6_0 = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_10211",
  EndPoints = r0_0.RT_2,
  IPDesc = "RLTreasure_IPDesc_10211",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_30.T_Rouge_Treasure_30",
  Name = "RLTreasure_Name_10211",
  RLArchiveId = 24,
}
r6_0.ServerBuild = {
  [1] = r0_0.RT_3,
  [2] = {
    27
  },
}
r6_0.ShopPrices = 400
r6_0.ShopWeight = 500
r6_0.SimpleDesc = "RLTreasure_SimpleDesc_10211"
r6_0.TreasureGroup = 10211
r6_0.TreasureId = 10211
r6_0.TreasureRarity = 2
r6_0.TreasureWeight = 500
r6_0.UnlockConditionText = "RLTreasure_UnlockCon_Default"
r4_0[r5_0] = r6_0
r5_0 = 10212
r6_0 = {
  Desc = "RLTreasure_Desc_10212",
  EndPoints = r0_0.RT_2,
  IPDesc = "RLTreasure_IPDesc_10212",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_12.T_Rouge_Treasure_12",
  Name = "RLTreasure_Name_10212",
  RLArchiveId = 25,
}
r6_0.ServerBuild = {
  [1] = {
    34
  },
}
r6_0.SimpleDesc = "RLTreasure_SimpleDesc_10212"
r6_0.TreasureGroup = 3
r6_0.TreasureId = 10212
r6_0.TreasureRarity = 2
r6_0.TreasureWeight = 500
r6_0.UnlockConditionText = "RLTreasure_UnlockCon_Default"
r4_0[r5_0] = r6_0
r5_0 = 10213
r6_0 = {
  CanSell = 1,
  Condition = {
    5044,
    5064
  },
  Desc = "RLTreasure_Desc_10213",
  EndPoints = r0_0.RT_2,
  IPDesc = "RLTreasure_IPDesc_10213",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_04.T_Rouge_Treasure_04",
  Name = "RLTreasure_Name_10213",
  RLArchiveId = 26,
}
r6_0.ServerBuild = {
  [1] = {
    35
  },
  [2] = {
    36
  },
}
r6_0.ShopPrices = 400
r6_0.ShopWeight = 500
r6_0.SimpleDesc = "RLTreasure_SimpleDesc_10213"
r6_0.TreasureGroup = 4
r6_0.TreasureId = 10213
r6_0.TreasureRarity = 2
r6_0.TreasureWeight = 500
r6_0.UnlockConditionText = "RLTreasure_UnlockCon_Default"
r4_0[r5_0] = r6_0
r5_0 = 10214
r6_0 = {
  CanSell = 1,
  Condition = {
    5045,
    5065
  },
  Desc = "RLTreasure_Desc_10214",
  EndPoints = r0_0.RT_2,
  IPDesc = "RLTreasure_IPDesc_10214",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_04.T_Rouge_Treasure_04",
  Name = "RLTreasure_Name_10214",
  RLArchiveId = 27,
}
r6_0.ServerBuild = {
  [1] = {
    37
  },
  [2] = {
    38
  },
}
r6_0.ShopPrices = 400
r6_0.ShopWeight = 500
r6_0.SimpleDesc = "RLTreasure_SimpleDesc_10214"
r6_0.TreasureGroup = 4
r6_0.TreasureId = 10214
r6_0.TreasureRarity = 2
r6_0.TreasureWeight = 500
r6_0.UnlockConditionText = "RLTreasure_UnlockCon_Default"
r4_0[r5_0] = r6_0
r5_0 = 10215
r6_0 = {
  CanSell = 1,
  Condition = {
    5046
  },
  Desc = "RLTreasure_Desc_10215",
  EndPoints = r0_0.RT_2,
  IPDesc = "RLTreasure_IPDesc_10215",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_04.T_Rouge_Treasure_04",
  Name = "RLTreasure_Name_10215",
  RLArchiveId = 28,
}
r6_0.ServerBuild = {
  [1] = {
    39
  },
  [2] = r0_0.RT_4,
}
r6_0.ShopPrices = 400
r6_0.ShopWeight = 500
r6_0.SimpleDesc = "RLTreasure_SimpleDesc_10215"
r6_0.TreasureGroup = 4
r6_0.TreasureId = 10215
r6_0.TreasureRarity = 2
r6_0.TreasureWeight = 500
r6_0.UnlockConditionText = "RLTreasure_UnlockCon_Default"
r4_0[r5_0] = r6_0
r5_0 = 10216
r6_0 = {
  CanSell = 1,
  Condition = {
    5047,
    5065
  },
  Desc = "RLTreasure_Desc_10216",
  EndPoints = r0_0.RT_2,
  IPDesc = "RLTreasure_IPDesc_10216",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_04.T_Rouge_Treasure_04",
  Name = "RLTreasure_Name_10216",
  RLArchiveId = 29,
}
r6_0.ServerBuild = {
  [1] = {
    41
  },
  [2] = {
    42
  },
}
r6_0.ShopPrices = 400
r6_0.ShopWeight = 500
r6_0.SimpleDesc = "RLTreasure_SimpleDesc_10216"
r6_0.TreasureGroup = 4
r6_0.TreasureId = 10216
r6_0.TreasureRarity = 2
r6_0.TreasureWeight = 500
r6_0.UnlockConditionText = "RLTreasure_UnlockCon_Default"
r4_0[r5_0] = r6_0
r5_0 = 10217
r6_0 = {
  CanSell = 1,
  Condition = {
    5048
  },
  Desc = "RLTreasure_Desc_10217",
  EndPoints = r0_0.RT_2,
  IPDesc = "RLTreasure_IPDesc_10217",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_04.T_Rouge_Treasure_04",
  Name = "RLTreasure_Name_10217",
  RLArchiveId = 30,
}
r6_0.ServerBuild = {
  [1] = {
    43
  },
  [2] = {
    44
  },
}
r6_0.ShopPrices = 400
r6_0.ShopWeight = 500
r6_0.SimpleDesc = "RLTreasure_SimpleDesc_10217"
r6_0.TreasureGroup = 4
r6_0.TreasureId = 10217
r6_0.TreasureRarity = 2
r6_0.TreasureWeight = 500
r6_0.UnlockConditionText = "RLTreasure_UnlockCon_Default"
r4_0[r5_0] = r6_0
r5_0 = 10218
r6_0 = {
  CanSell = 1,
  Condition = {
    5049,
    5064
  },
  Desc = "RLTreasure_Desc_10218",
  EndPoints = r0_0.RT_2,
  IPDesc = "RLTreasure_IPDesc_10218",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_04.T_Rouge_Treasure_04",
  Name = "RLTreasure_Name_10218",
  RLArchiveId = 31,
}
r6_0.ServerBuild = {
  [1] = {
    45
  },
  [2] = {
    46
  },
}
r6_0.ShopPrices = 400
r6_0.ShopWeight = 500
r6_0.SimpleDesc = "RLTreasure_SimpleDesc_10218"
r6_0.TreasureGroup = 4
r6_0.TreasureId = 10218
r6_0.TreasureRarity = 2
r6_0.TreasureWeight = 500
r6_0.UnlockConditionText = "RLTreasure_UnlockCon_Default"
r4_0[r5_0] = r6_0
r5_0 = 10219
r6_0 = {
  CanSell = 1,
  Condition = {
    5050
  },
  Desc = "RLTreasure_Desc_10219",
  EndPoints = r0_0.RT_2,
  IPDesc = "RLTreasure_IPDesc_10219",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_04.T_Rouge_Treasure_04",
  Name = "RLTreasure_Name_10219",
  RLArchiveId = 32,
}
r6_0.ServerBuild = {
  [1] = {
    47
  },
  [2] = {
    48
  },
}
r6_0.ShopPrices = 400
r6_0.ShopWeight = 500
r6_0.SimpleDesc = "RLTreasure_SimpleDesc_10219"
r6_0.TreasureGroup = 4
r6_0.TreasureId = 10219
r6_0.TreasureRarity = 2
r6_0.TreasureWeight = 500
r6_0.UnlockConditionText = "RLTreasure_UnlockCon_Default"
r4_0[r5_0] = r6_0
r5_0 = 10301
r6_0 = {
  Desc = "RLTreasure_Desc_10301",
  EndPoints = r0_0.RT_4,
  IPDesc = "RLTreasure_IPDesc_10301",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_03.T_Rouge_Treasure_03",
  Name = "RLTreasure_Name_10301",
  RLArchiveId = 33,
}
r6_0.ServerBuild = {
  [1] = {
    17
  },
}
r6_0.SimpleDesc = "RLTreasure_SimpleDesc_10301"
r6_0.TreasureGroup = 3
r6_0.TreasureId = 10301
r6_0.TreasureRarity = 3
r6_0.TreasureWeight = 200
r6_0.UnlockConditionText = "RLTreasure_UnlockCon_Default"
r4_0[r5_0] = r6_0
r5_0 = 10302
r6_0 = {
  Desc = "RLTreasure_Desc_10302",
  EndPoints = r0_0.RT_4,
  IPDesc = "RLTreasure_IPDesc_10302",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_03.T_Rouge_Treasure_03",
  Name = "RLTreasure_Name_10302",
  RLArchiveId = 34,
}
r6_0.ServerBuild = {
  [1] = {
    18
  },
}
r6_0.SimpleDesc = "RLTreasure_SimpleDesc_10302"
r6_0.TreasureGroup = 3
r6_0.TreasureId = 10302
r6_0.TreasureRarity = 3
r6_0.TreasureWeight = 200
r6_0.UnlockConditionText = "RLTreasure_UnlockCon_Default"
r4_0[r5_0] = r6_0
r4_0[10303] = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_10303",
  EndPoints = r0_0.RT_2,
  IPDesc = "RLTreasure_IPDesc_10303",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_10.T_Rouge_Treasure_10",
  ModEquip = "Role",
  Name = "RLTreasure_Name_10303",
  RLArchiveId = 35,
  ShopPrices = 400,
  ShopWeight = 500,
  SimpleDesc = "RLTreasure_SimpleDesc_10303",
  TreasureGroup = 1,
  TreasureId = 10303,
  TreasureMod = 20106001,
  TreasureRarity = 2,
  TreasureWeight = 500,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r5_0 = 10304
r6_0 = {
  Desc = "RLTreasure_Desc_10304",
  EndPoints = r0_0.RT_4,
  IPDesc = "RLTreasure_IPDesc_10304",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_15.T_Rouge_Treasure_15",
  Name = "RLTreasure_Name_10304",
}
r6_0.ServerBuild = {
  [1] = {
    5
  },
  [2] = {
    26
  },
}
r6_0.ServerBuildValue = {
  [1] = "$#RougelikeServerBuild[26].Param[2]$",
}
r6_0.SimpleDesc = "RLTreasure_SimpleDesc_10304"
r6_0.TreasureGroup = 10304
r6_0.TreasureId = 10304
r6_0.TreasureRarity = 3
r6_0.TreasureWeight = 200
r6_0.UnlockConditionText = "RLTreasure_UnlockCon_Default"
r4_0[r5_0] = r6_0
r5_0 = 10305
r6_0 = {
  Desc = "RLTreasure_Desc_10305",
  EndPoints = r0_0.RT_4,
  IPDesc = "RLTreasure_IPDesc_10305",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_16.T_Rouge_Treasure_16",
  Name = "RLTreasure_Name_10305",
}
r6_0.ServerBuild = {
  [1] = {
    6
  },
}
r6_0.SimpleDesc = "RLTreasure_SimpleDesc_10305"
r6_0.TreasureGroup = 10305
r6_0.TreasureId = 10305
r6_0.TreasureRarity = 3
r6_0.TreasureWeight = 200
r6_0.UnlockConditionText = "RLTreasure_UnlockCon_Default"
r4_0[r5_0] = r6_0
r4_0[10306] = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_10306",
  EndPoints = r0_0.RT_4,
  IPDesc = "RLTreasure_IPDesc_10306",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_18.T_Rouge_Treasure_18",
  ModEquip = "Role",
  Name = "RLTreasure_Name_10306",
  RLArchiveId = 36,
  ShopPrices = 800,
  ShopWeight = 200,
  SimpleDesc = "RLTreasure_SimpleDesc_10306",
  TreasureGroup = 1,
  TreasureId = 10306,
  TreasureMod = 20118001,
  TreasureRarity = 3,
  TreasureWeight = 200,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r4_0[10307] = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_10307",
  EndPoints = r0_0.RT_4,
  IPDesc = "RLTreasure_IPDesc_10307",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_26.T_Rouge_Treasure_26",
  ModEquip = "Role",
  Name = "RLTreasure_Name_10307",
  RLArchiveId = 37,
  ShopPrices = 800,
  ShopWeight = 200,
  SimpleDesc = "RLTreasure_SimpleDesc_10307",
  TreasureGroup = 1,
  TreasureId = 10307,
  TreasureMod = 20119001,
  TreasureRarity = 3,
  TreasureWeight = 200,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r4_0[10308] = {
  ClientBuild = {
    GroupDiscount = -1,
  },
  Desc = "RLTreasure_Desc_10308",
  EndPoints = r0_0.RT_4,
  IPDesc = "RLTreasure_IPDesc_10308",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_11.T_Rouge_Treasure_11",
  Name = "RLTreasure_Name_10308",
  RLArchiveId = 38,
  SimpleDesc = "RLTreasure_SimpleDesc_10308",
  TreasureGroup = 10308,
  TreasureId = 10308,
  TreasureRarity = 3,
  TreasureWeight = 200,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r5_0 = 10309
r6_0 = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_10309",
  EndPoints = r0_0.RT_4,
  IPDesc = "RLTreasure_IPDesc_10309",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_08.T_Rouge_Treasure_08",
  Name = "RLTreasure_Name_10309",
  RLArchiveId = 39,
}
r6_0.ServerBuild = {
  [1] = {
    21
  },
}
r6_0.ServerBuildValue = {
  [1] = "$#RougelikeServerBuild[21].Param[2]$",
}
r6_0.ShopPrices = 800
r6_0.ShopWeight = 200
r6_0.SimpleDesc = "RLTreasure_SimpleDesc_10309"
r6_0.TreasureGroup = 10309
r6_0.TreasureId = 10309
r6_0.TreasureRarity = 3
r6_0.TreasureWeight = 200
r6_0.UnlockConditionText = "RLTreasure_UnlockCon_Default"
r4_0[r5_0] = r6_0
r4_0[10310] = {
  Desc = "RLTreasure_Desc_10310",
  EndPoints = r0_0.RT_4,
  IPDesc = "RLTreasure_IPDesc_10310",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_46.T_Rouge_Treasure_46",
  ModEquip = "Role",
  Name = "RLTreasure_Name_10310",
  RLArchiveId = 53,
  SimpleDesc = "RLTreasure_SimpleDesc_10310",
  TreasureGroup = 10310,
  TreasureId = 10310,
  TreasureMod = 20130001,
  TreasureRarity = 3,
  TreasureWeight = 200,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r4_0[10311] = {
  Desc = "RLTreasure_Desc_10311",
  EndPoints = r0_0.RT_4,
  IPDesc = "RLTreasure_IPDesc_10311",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_47.T_Rouge_Treasure_47",
  ModEquip = "Role",
  Name = "RLTreasure_Name_10311",
  RLArchiveId = 54,
  SimpleDesc = "RLTreasure_SimpleDesc_10311",
  TreasureGroup = 10310,
  TreasureId = 10311,
  TreasureMod = 20131001,
  TreasureRarity = 3,
  TreasureWeight = 200,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r4_0[10312] = {
  Desc = "RLTreasure_Desc_10312",
  EndPoints = r0_0.RT_4,
  IPDesc = "RLTreasure_IPDesc_10312",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_48.T_Rouge_Treasure_48",
  ModEquip = "Role",
  Name = "RLTreasure_Name_10312",
  RLArchiveId = 55,
  SimpleDesc = "RLTreasure_SimpleDesc_10312",
  TreasureGroup = 10310,
  TreasureId = 10312,
  TreasureMod = 20132001,
  TreasureRarity = 3,
  TreasureWeight = 200,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r4_0[10313] = {
  Desc = "RLTreasure_Desc_10313",
  EndPoints = r0_0.RT_4,
  IPDesc = "RLTreasure_IPDesc_10313",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_49.T_Rouge_Treasure_49",
  ModEquip = "Role",
  Name = "RLTreasure_Name_10313",
  RLArchiveId = 56,
  SimpleDesc = "RLTreasure_SimpleDesc_10313",
  TreasureGroup = 10310,
  TreasureId = 10313,
  TreasureMod = 20133001,
  TreasureRarity = 3,
  TreasureWeight = 200,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r4_0[10314] = {
  Desc = "RLTreasure_Desc_10314",
  EndPoints = r0_0.RT_4,
  IPDesc = "RLTreasure_IPDesc_10314",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_50.T_Rouge_Treasure_50",
  ModEquip = "Role",
  Name = "RLTreasure_Name_10314",
  RLArchiveId = 57,
  SimpleDesc = "RLTreasure_SimpleDesc_10314",
  TreasureGroup = 10310,
  TreasureId = 10314,
  TreasureMod = 20134001,
  TreasureRarity = 3,
  TreasureWeight = 200,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r4_0[10315] = {
  Desc = "RLTreasure_Desc_10315",
  EndPoints = r0_0.RT_4,
  IPDesc = "RLTreasure_IPDesc_10315",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_51.T_Rouge_Treasure_51",
  ModEquip = "Role",
  Name = "RLTreasure_Name_10315",
  RLArchiveId = 58,
  SimpleDesc = "RLTreasure_SimpleDesc_10315",
  TreasureGroup = 10310,
  TreasureId = 10315,
  TreasureMod = 20135001,
  TreasureRarity = 3,
  TreasureWeight = 200,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r4_0[10316] = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_10316",
  EndPoints = r0_0.RT_4,
  IPDesc = "RLTreasure_IPDesc_10316",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_54.T_Rouge_Treasure_54",
  ModEquip = "Role",
  Name = "RLTreasure_Name_10316",
  RLArchiveId = 61,
  ShopPrices = 800,
  ShopWeight = 200,
  SimpleDesc = "RLTreasure_SimpleDesc_10316",
  TreasureGroup = 1,
  TreasureId = 10316,
  TreasureMod = 20121001,
  TreasureRarity = 3,
  TreasureWeight = 200,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r4_0[11101] = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_11101",
  EndPoints = r0_0.RT_1,
  IPDesc = "RLTreasure_IPDesc_11101",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_34.T_Rouge_Treasure_34",
  ModEquip = "Role",
  Name = "RLTreasure_Name_11101",
  RLArchiveId = 40,
  ShopPrices = 200,
  ShopWeight = 1000,
  SimpleDesc = "RLTreasure_SimpleDesc_11101",
  TreasureGroup = 101,
  TreasureId = 11101,
  TreasureMod = 20171001,
  TreasureRarity = 1,
  TreasureWeight = 1000,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r4_0[11201] = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_11201",
  EndPoints = r0_0.RT_2,
  IPDesc = "RLTreasure_IPDesc_11201",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_33.T_Rouge_Treasure_33",
  ModEquip = "Role",
  Name = "RLTreasure_Name_11201",
  RLArchiveId = 41,
  ShopPrices = 400,
  ShopWeight = 500,
  SimpleDesc = "RLTreasure_SimpleDesc_11201",
  TreasureGroup = 101,
  TreasureId = 11201,
  TreasureMod = 20172001,
  TreasureRarity = 2,
  TreasureWeight = 500,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r5_0 = 12101
r6_0 = {
  Desc = "RLTreasure_Desc_12101",
  EndPoints = r0_0.RT_1,
  IPDesc = "RLTreasure_IPDesc_12101",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_35.T_Rouge_Treasure_35",
  Name = "RLTreasure_Name_12101",
  RLArchiveId = 42,
}
r6_0.ServerBuild = {
  [1] = r0_0.RT_3,
  [2] = {
    30
  },
  [3] = {
    31
  },
}
r6_0.ServerBuildValue = {
  [1] = "$(#RougelikeServerBuild[30].Param[1]-1)*100$%",
  [2] = "$(#RougelikeServerBuild[30].RoomCount-1)$",
  [3] = "$#RougelikeServerBuild[31].Param[1]$",
}
r6_0.SimpleDesc = "RLTreasure_SimpleDesc_12101"
r6_0.TreasureGroup = 102
r6_0.TreasureId = 12101
r6_0.TreasureRarity = 1
r6_0.TreasureWeight = 1000
r6_0.UnlockConditionText = "RLTreasure_UnlockCon_Default"
r4_0[r5_0] = r6_0
r5_0 = 12102
r6_0 = {
  Desc = "RLTreasure_Desc_12102",
  EndPoints = r0_0.RT_1,
  IPDesc = "RLTreasure_IPDesc_12102",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_36.T_Rouge_Treasure_36",
  Name = "RLTreasure_Name_12102",
  RLArchiveId = 43,
}
r6_0.ServerBuild = {
  [1] = r0_0.RT_3,
  [2] = {
    28
  },
  [3] = {
    29
  },
}
r6_0.ServerBuildValue = {
  [1] = "$(#RougelikeServerBuild[28].Param[1]-1)*100$%",
  [2] = "$(#RougelikeServerBuild[28].RoomCount-1)$",
  [3] = "$#RougelikeServerBuild[29].Param[1]$",
}
r6_0.SimpleDesc = "RLTreasure_SimpleDesc_12102"
r6_0.TreasureGroup = 102
r6_0.TreasureId = 12102
r6_0.TreasureRarity = 1
r6_0.TreasureWeight = 1000
r6_0.UnlockConditionText = "RLTreasure_UnlockCon_Default"
r4_0[r5_0] = r6_0
r5_0 = 12201
r6_0 = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_12201",
  EndPoints = r0_0.RT_2,
  IPDesc = "RLTreasure_IPDesc_12201",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_37.T_Rouge_Treasure_37",
  ModEquip = "Role",
  Name = "RLTreasure_Name_12201",
  RLArchiveId = 44,
}
r6_0.ServerBuild = {
  [1] = r0_0.RT_3,
  [2] = {
    50
  },
  [3] = {
    33
  },
}
r6_0.ServerBuildValue = {
  [1] = "$(#RougelikeServerBuild[50].RoomCount-1)$",
  [2] = "$#RougelikeServerBuild[33].Param[1]$",
}
r6_0.ShopPrices = 400
r6_0.ShopWeight = 500
r6_0.SimpleDesc = "RLTreasure_SimpleDesc_12201"
r6_0.TreasureGroup = 102
r6_0.TreasureId = 12201
r6_0.TreasureMod = 20161001
r6_0.TreasureRarity = 2
r6_0.TreasureWeight = 500
r6_0.UnlockConditionText = "RLTreasure_UnlockCon_Default"
r4_0[r5_0] = r6_0
r4_0[13101] = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_13101",
  EndPoints = r0_0.RT_1,
  IPDesc = "RLTreasure_IPDesc_13101",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_38.T_Rouge_Treasure_38",
  ModEquip = "Role",
  Name = "RLTreasure_Name_13101",
  RLArchiveId = 45,
  ShopPrices = 200,
  ShopWeight = 1000,
  SimpleDesc = "RLTreasure_SimpleDesc_13101",
  TreasureGroup = 103,
  TreasureId = 13101,
  TreasureMod = 20181001,
  TreasureRarity = 1,
  TreasureWeight = 1000,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r4_0[13102] = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_13102",
  EndPoints = r0_0.RT_1,
  IPDesc = "RLTreasure_IPDesc_13102",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_39.T_Rouge_Treasure_39",
  ModEquip = "Role",
  Name = "RLTreasure_Name_13102",
  RLArchiveId = 46,
  ShopPrices = 200,
  ShopWeight = 1000,
  SimpleDesc = "RLTreasure_SimpleDesc_13102",
  TreasureGroup = 103,
  TreasureId = 13102,
  TreasureMod = 20182001,
  TreasureRarity = 1,
  TreasureWeight = 1000,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r4_0[13103] = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_13103",
  EndPoints = r0_0.RT_1,
  IPDesc = "RLTreasure_IPDesc_13103",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_40.T_Rouge_Treasure_40",
  ModEquip = "Role",
  Name = "RLTreasure_Name_13103",
  RLArchiveId = 47,
  ShopPrices = 200,
  ShopWeight = 1000,
  SimpleDesc = "RLTreasure_SimpleDesc_13103",
  TreasureGroup = 103,
  TreasureId = 13103,
  TreasureMod = 20183001,
  TreasureRarity = 1,
  TreasureWeight = 1000,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r4_0[13104] = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_13104",
  EndPoints = r0_0.RT_1,
  IPDesc = "RLTreasure_IPDesc_13104",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_41.T_Rouge_Treasure_41",
  ModEquip = "Role",
  Name = "RLTreasure_Name_13104",
  RLArchiveId = 48,
  ShopPrices = 200,
  ShopWeight = 1000,
  SimpleDesc = "RLTreasure_SimpleDesc_13104",
  TreasureGroup = 103,
  TreasureId = 13104,
  TreasureMod = 20184001,
  TreasureRarity = 1,
  TreasureWeight = 1000,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r4_0[14101] = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_14101",
  EndPoints = r0_0.RT_1,
  IPDesc = "RLTreasure_IPDesc_14101",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_42.T_Rouge_Treasure_42",
  ModEquip = "Role",
  Name = "RLTreasure_Name_14101",
  RLArchiveId = 49,
  ShopPrices = 200,
  ShopWeight = 1000,
  SimpleDesc = "RLTreasure_SimpleDesc_14101",
  TreasureGroup = 104,
  TreasureId = 14101,
  TreasureMod = 20151001,
  TreasureRarity = 1,
  TreasureWeight = 1000,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r4_0[14201] = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_14201",
  EndPoints = r0_0.RT_2,
  IPDesc = "RLTreasure_IPDesc_14201",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_43.T_Rouge_Treasure_43",
  ModEquip = "Role",
  Name = "RLTreasure_Name_14201",
  RLArchiveId = 50,
  ShopPrices = 400,
  ShopWeight = 500,
  SimpleDesc = "RLTreasure_SimpleDesc_14201",
  TreasureGroup = 104,
  TreasureId = 14201,
  TreasureMod = 20152001,
  TreasureRarity = 2,
  TreasureWeight = 500,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r4_0[14202] = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_14202",
  EndPoints = r0_0.RT_2,
  IPDesc = "RLTreasure_IPDesc_14202",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_44.T_Rouge_Treasure_44",
  ModEquip = "Role",
  Name = "RLTreasure_Name_14202",
  RLArchiveId = 51,
  ShopPrices = 400,
  ShopWeight = 500,
  SimpleDesc = "RLTreasure_SimpleDesc_14202",
  TreasureGroup = 104,
  TreasureId = 14202,
  TreasureMod = 20153001,
  TreasureRarity = 2,
  TreasureWeight = 500,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r4_0[14301] = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_14301",
  EndPoints = r0_0.RT_4,
  IPDesc = "RLTreasure_IPDesc_14301",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_45.T_Rouge_Treasure_45",
  ModEquip = "Role",
  Name = "RLTreasure_Name_14301",
  RLArchiveId = 52,
  ShopPrices = 800,
  ShopWeight = 200,
  SimpleDesc = "RLTreasure_SimpleDesc_14301",
  TreasureGroup = 104,
  TreasureId = 14301,
  TreasureMod = 20154001,
  TreasureRarity = 3,
  TreasureWeight = 200,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r4_0[15101] = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_15101",
  EndPoints = r0_0.RT_1,
  IPDesc = "RLTreasure_IPDesc_15101",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_53.T_Rouge_Treasure_53",
  ModEquip = "Role",
  Name = "RLTreasure_Name_15101",
  RLArchiveId = 59,
  ShopPrices = 200,
  ShopWeight = 1000,
  SimpleDesc = "RLTreasure_SimpleDesc_15101",
  TreasureGroup = 105,
  TreasureId = 15101,
  TreasureMod = 20156001,
  TreasureRarity = 1,
  TreasureWeight = 1000,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
r4_0[15201] = {
  CanSell = 1,
  Desc = "RLTreasure_Desc_15201",
  EndPoints = r0_0.RT_2,
  IPDesc = "RLTreasure_IPDesc_15201",
  Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_52.T_Rouge_Treasure_52",
  ModEquip = "Role",
  Name = "RLTreasure_Name_15201",
  RLArchiveId = 60,
  ShopPrices = 400,
  ShopWeight = 500,
  SimpleDesc = "RLTreasure_SimpleDesc_15201",
  TreasureGroup = 105,
  TreasureId = 15201,
  TreasureMod = 20157001,
  TreasureRarity = 2,
  TreasureWeight = 500,
  UnlockConditionText = "RLTreasure_UnlockCon_Default",
}
return r2_0(r3_0, r4_0)
