-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\AbyssRoom.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    201000
  },
  RT_2 = {
    60055
  },
  RT_3 = {
    2010101,
    2010191,
    2010107
  },
  RT_4 = {
    60901
  },
  RT_5 = {
    70055
  },
  RT_6 = {
    2010201,
    2010291,
    2010208
  },
  RT_7 = {
    70902
  },
  RT_8 = {
    2010101,
    2010191,
    2010108
  },
  RT_9 = {
    80055
  },
  RT_10 = {
    2010201,
    2010291,
    2010210
  },
  RT_11 = {
    80901
  },
  RT_12 = {
    60073
  },
  RT_13 = {
    2010101,
    2010191,
    2010111
  },
  RT_14 = {
    90055
  },
  RT_15 = {
    2010201,
    2010294,
    2010209
  },
  RT_16 = {
    90901
  },
  RT_17 = {
    2010101,
    2010194,
    2010103
  },
  RT_18 = {
    70901
  },
  RT_19 = {
    90073
  },
  RT_20 = {
    2010201,
    2010292,
    2010205
  },
  RT_21 = {
    80073
  },
  RT_22 = {
    2010101,
    2010194,
    2010109
  },
  RT_23 = {
    70173
  },
  RT_24 = {
    2010201,
    2010291,
    2010204
  },
  RT_25 = {
    2010101,
    2010191,
    2010104
  },
  RT_26 = {
    70173,
    7002018
  },
  RT_27 = {
    2010201,
    2010291,
    2010206
  },
  RT_28 = {
    90073,
    9001019
  },
  RT_29 = {
    60173
  },
  RT_30 = {
    2010201,
    2010294,
    2010203
  },
  RT_31 = {
    2010201,
    2010291,
    2010203
  },
  RT_32 = {
    80201
  },
  RT_33 = {
    80200
  },
  RT_34 = {
    60201
  },
  RT_35 = {
    60200
  },
  RT_36 = {
    90201
  },
  RT_37 = {
    90200
  },
  RT_38 = {
    70201
  },
  RT_39 = {
    70200
  },
  RT_40 = {
    2010101,
    2010191,
    2010106
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [155, 155] id: 1
  return r1_1
end
local r3_0 = "AbyssRoom"
local r4_0 = {
  [110111] = {
    ClearCondition = 55,
    RoomId = 110111,
    RoomType = "Default",
    StaticCreatorId = r0_0.RT_1,
    SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
    TimeLimit = 90,
    UnitSpawnId = r0_0.RT_2,
  },
  [110112] = {
    ClearCondition = 70,
    RoomId = 110112,
    RoomType = "Default",
    SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
    TimeLimit = 90,
    UnitSpawnId = r0_0.RT_2,
  },
  [110113] = {
    ClearCondition = 85,
    RoomId = 110113,
    RoomType = "Default",
    SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
    TimeLimit = 90,
    UnitSpawnId = r0_0.RT_2,
  },
  [110114] = {
    ClearCondition = 100,
    RoomId = 110114,
    RoomType = "Default",
    SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
    TimeLimit = 90,
    UnitSpawnId = r0_0.RT_2,
  },
  [110115] = {
    ClearCondition = 50,
    RoomId = 110115,
    RoomType = "Boss",
    StaticCreatorId = r0_0.RT_3,
    SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
    TimeLimit = 180,
    UnitSpawnId = r0_0.RT_4,
  },
  [110121] = {
    ClearCondition = 55,
    RoomId = 110121,
    RoomType = "Default",
    StaticCreatorId = r0_0.RT_1,
    SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
    TimeLimit = 90,
    UnitSpawnId = r0_0.RT_5,
  },
  [110122] = {
    ClearCondition = 70,
    RoomId = 110122,
    RoomType = "Default",
    SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
    TimeLimit = 90,
    UnitSpawnId = r0_0.RT_5,
  },
  [110123] = {
    ClearCondition = 85,
    RoomId = 110123,
    RoomType = "Default",
    SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
    TimeLimit = 90,
    UnitSpawnId = r0_0.RT_5,
  },
  [110124] = {
    ClearCondition = 100,
    RoomId = 110124,
    RoomType = "Default",
    SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
    TimeLimit = 90,
    UnitSpawnId = r0_0.RT_5,
  },
  [110125] = {
    ClearCondition = 50,
    RoomId = 110125,
    RoomType = "Boss",
    StaticCreatorId = r0_0.RT_6,
    SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
    TimeLimit = 180,
    UnitSpawnId = r0_0.RT_7,
  },
  [110211] = {
    ClearCondition = 60,
    RoomId = 110211,
    RoomType = "Default",
    StaticCreatorId = r0_0.RT_1,
    SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
    TimeLimit = 90,
    UnitSpawnId = r0_0.RT_2,
  },
  [110212] = {
    ClearCondition = 75,
    RoomId = 110212,
    RoomType = "Default",
    SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
    TimeLimit = 90,
    UnitSpawnId = r0_0.RT_2,
  },
  [110213] = {
    ClearCondition = 90,
    RoomId = 110213,
    RoomType = "Default",
    SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
    TimeLimit = 90,
    UnitSpawnId = r0_0.RT_2,
  },
  [110214] = {
    ClearCondition = 110,
    RoomId = 110214,
    RoomType = "Default",
    SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
    TimeLimit = 90,
    UnitSpawnId = r0_0.RT_2,
  },
  [110215] = {
    ClearCondition = 50,
    RoomId = 110215,
    RoomType = "Boss",
    StaticCreatorId = r0_0.RT_8,
    SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
    TimeLimit = 180,
    UnitSpawnId = r0_0.RT_4,
  },
  [110221] = {
    ClearCondition = 60,
    RoomId = 110221,
    RoomType = "Default",
    StaticCreatorId = r0_0.RT_1,
    SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
    TimeLimit = 90,
    UnitSpawnId = r0_0.RT_9,
  },
  [110222] = {
    ClearCondition = 75,
    RoomId = 110222,
    RoomType = "Default",
    SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
    TimeLimit = 90,
    UnitSpawnId = r0_0.RT_9,
  },
  [110223] = {
    ClearCondition = 90,
    RoomId = 110223,
    RoomType = "Default",
    SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
    TimeLimit = 90,
    UnitSpawnId = r0_0.RT_9,
  },
  [110224] = {
    ClearCondition = 110,
    RoomId = 110224,
    RoomType = "Default",
    SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
    TimeLimit = 90,
    UnitSpawnId = r0_0.RT_9,
  },
  [110225] = {
    ClearCondition = 50,
    RoomId = 110225,
    RoomType = "Boss",
    StaticCreatorId = r0_0.RT_10,
    SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
    TimeLimit = 180,
    UnitSpawnId = r0_0.RT_11,
  },
  [110311] = {
    ClearCondition = 70,
    RoomId = 110311,
    RoomType = "Default",
    StaticCreatorId = r0_0.RT_1,
    SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
    TimeLimit = 90,
    UnitSpawnId = r0_0.RT_12,
  },
  [110312] = {
    ClearCondition = 85,
    RoomId = 110312,
    RoomType = "Default",
    SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
    TimeLimit = 90,
    UnitSpawnId = r0_0.RT_12,
  },
  [110313] = {
    ClearCondition = 100,
    RoomId = 110313,
    RoomType = "Default",
    SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
    TimeLimit = 90,
    UnitSpawnId = r0_0.RT_12,
  },
}
r4_0[110314] = {
  ClearCondition = 120,
  RoomId = 110314,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    60073,
    6001012
  },
}
r4_0[110315] = {
  ClearCondition = 50,
  RoomId = 110315,
  RoomType = "Boss",
  StaticCreatorId = r0_0.RT_13,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 180,
  UnitSpawnId = r0_0.RT_11,
}
r4_0[110321] = {
  ClearCondition = 70,
  RoomId = 110321,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_5,
}
r4_0[110322] = {
  ClearCondition = 85,
  RoomId = 110322,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_5,
}
r4_0[110323] = {
  ClearCondition = 100,
  RoomId = 110323,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_5,
}
r4_0[110324] = {
  ClearCondition = 120,
  RoomId = 110324,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    70055,
    7001015
  },
}
r4_0[110325] = {
  ClearCondition = 50,
  RoomId = 110325,
  RoomType = "Boss",
  StaticCreatorId = {
    2010201,
    2010291,
    2010207
  },
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 180,
  UnitSpawnId = r0_0.RT_7,
}
r4_0[110411] = {
  ClearCondition = 80,
  RoomId = 110411,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_9,
}
r4_0[110412] = {
  ClearCondition = 95,
  RoomId = 110412,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_9,
}
r4_0[110413] = {
  ClearCondition = 110,
  RoomId = 110413,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    80055,
    8003017
  },
}
r4_0[110414] = {
  ClearCondition = 130,
  RoomId = 110414,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    80055,
    8001016
  },
}
r4_0[110415] = {
  ClearCondition = 50,
  RoomId = 110415,
  RoomType = "Boss",
  StaticCreatorId = {
    2010101,
    2010191,
    2010110
  },
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 180,
  UnitSpawnId = r0_0.RT_11,
}
r4_0[110421] = {
  ClearCondition = 80,
  RoomId = 110421,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_14,
}
r4_0[110422] = {
  ClearCondition = 95,
  RoomId = 110422,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_14,
}
r4_0[110423] = {
  ClearCondition = 110,
  RoomId = 110423,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    90055,
    9007011
  },
}
r4_0[110424] = {
  ClearCondition = 130,
  RoomId = 110424,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    90055,
    9001014
  },
}
r4_0[110425] = {
  ClearCondition = 50,
  RoomId = 110425,
  RoomType = "Boss",
  StaticCreatorId = r0_0.RT_15,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 220,
  UnitSpawnId = r0_0.RT_16,
}
r4_0[110511] = {
  ClearCondition = 90,
  RoomId = 110511,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = {
    70155
  },
}
r4_0[110512] = {
  ClearCondition = 105,
  RoomId = 110512,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    70155,
    7002014
  },
}
r4_0[110513] = {
  ClearCondition = 120,
  RoomId = 110513,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    70155,
    7001011
  },
}
r4_0[110514] = {
  ClearCondition = 140,
  RoomId = 110514,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    70155,
    7003017
  },
}
r4_0[110515] = {
  ClearCondition = 50,
  RoomId = 110515,
  RoomType = "Boss",
  StaticCreatorId = r0_0.RT_17,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 180,
  UnitSpawnId = r0_0.RT_18,
}
r4_0[110521] = {
  ClearCondition = 90,
  RoomId = 110521,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_19,
}
r4_0[110522] = {
  ClearCondition = 105,
  RoomId = 110522,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    90073,
    9007018
  },
}
r4_0[110523] = {
  ClearCondition = 120,
  RoomId = 110523,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    90073,
    9002016
  },
}
r4_0[110524] = {
  ClearCondition = 140,
  RoomId = 110524,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    90073,
    9001020
  },
}
r4_0[110525] = {
  ClearCondition = 50,
  RoomId = 110525,
  RoomType = "Boss",
  StaticCreatorId = r0_0.RT_20,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 225,
  UnitSpawnId = r0_0.RT_4,
}
r4_0[110611] = {
  ClearCondition = 100,
  RoomId = 110611,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_21,
}
r4_0[110612] = {
  ClearCondition = 115,
  RoomId = 110612,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    80073,
    8002020
  },
}
r4_0[110613] = {
  ClearCondition = 130,
  RoomId = 110613,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    80073,
    8001017
  },
}
r4_0[110614] = {
  ClearCondition = 150,
  RoomId = 110614,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    80073,
    8002020,
    8001017
  },
}
r4_0[110615] = {
  ClearCondition = 50,
  RoomId = 110615,
  RoomType = "Boss",
  StaticCreatorId = r0_0.RT_22,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 220,
  UnitSpawnId = r0_0.RT_11,
}
r4_0[110621] = {
  ClearCondition = 100,
  RoomId = 110621,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_23,
}
r4_0[110622] = {
  ClearCondition = 115,
  RoomId = 110622,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    70173,
    7002012
  },
}
r4_0[110623] = {
  ClearCondition = 130,
  RoomId = 110623,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    70173,
    7001011
  },
}
r4_0[110624] = {
  ClearCondition = 150,
  RoomId = 110624,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    70173,
    7002012,
    7001011
  },
}
r4_0[110625] = {
  ClearCondition = 50,
  RoomId = 110625,
  RoomType = "Boss",
  StaticCreatorId = r0_0.RT_24,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 205,
  UnitSpawnId = r0_0.RT_7,
}
r4_0[110711] = {
  ClearCondition = 100,
  RoomId = 110711,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = {
    60155
  },
}
r4_0[110712] = {
  ClearCondition = 120,
  RoomId = 110712,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    60155,
    6001016
  },
}
r4_0[110713] = {
  ClearCondition = 140,
  RoomId = 110713,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    60155,
    6002015
  },
}
r4_0[110714] = {
  ClearCondition = 160,
  RoomId = 110714,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    60155,
    6001016,
    6002015
  },
}
r4_0[110715] = {
  ClearCondition = 50,
  RoomId = 110715,
  RoomType = "Boss",
  StaticCreatorId = r0_0.RT_25,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 205,
  UnitSpawnId = r0_0.RT_4,
}
r4_0[110721] = {
  ClearCondition = 100,
  RoomId = 110721,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_23,
}
r4_0[110722] = {
  ClearCondition = 120,
  RoomId = 110722,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_26,
}
r4_0[110723] = {
  ClearCondition = 140,
  RoomId = 110723,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    70173,
    7003011
  },
}
r4_0[110724] = {
  ClearCondition = 160,
  RoomId = 110724,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    70173,
    7002018,
    7003011
  },
}
r4_0[110725] = {
  ClearCondition = 50,
  RoomId = 110725,
  RoomType = "Boss",
  StaticCreatorId = r0_0.RT_27,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 255,
  UnitSpawnId = r0_0.RT_7,
}
r4_0[120111] = {
  ClearCondition = 100,
  RoomId = 120111,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_19,
}
r4_0[120112] = {
  ClearCondition = 120,
  RoomId = 120112,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_28,
}
r4_0[120113] = {
  ClearCondition = 140,
  RoomId = 120113,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    90073,
    9002023
  },
}
r4_0[120114] = {
  ClearCondition = 160,
  RoomId = 120114,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    90073,
    9001019,
    9002023
  },
}
r4_0[120115] = {
  ClearCondition = 50,
  RoomId = 120115,
  RoomType = "Boss",
  StaticCreatorId = r0_0.RT_6,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 180,
  UnitSpawnId = r0_0.RT_16,
}
r4_0[120121] = {
  ClearCondition = 100,
  RoomId = 120121,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_29,
}
r4_0[120122] = {
  ClearCondition = 120,
  RoomId = 120122,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    60173,
    6001014
  },
}
r4_0[120123] = {
  ClearCondition = 140,
  RoomId = 120123,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    60173,
    6002015
  },
}
r4_0[120124] = {
  ClearCondition = 160,
  RoomId = 120124,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    60173,
    6001014,
    6002015
  },
}
r4_0[120125] = {
  ClearCondition = 50,
  RoomId = 120125,
  RoomType = "Boss",
  StaticCreatorId = r0_0.RT_3,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 180,
  UnitSpawnId = r0_0.RT_4,
}
r4_0[120211] = {
  ClearCondition = 100,
  RoomId = 120211,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_23,
}
r4_0[120212] = {
  ClearCondition = 120,
  RoomId = 120212,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_26,
}
r4_0[120213] = {
  ClearCondition = 140,
  RoomId = 120213,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    70173,
    7001015
  },
}
r4_0[120214] = {
  ClearCondition = 160,
  RoomId = 120214,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    70173,
    7002018,
    7001015
  },
}
r4_0[120215] = {
  ClearCondition = 50,
  RoomId = 120215,
  RoomType = "Boss",
  StaticCreatorId = r0_0.RT_30,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 180,
  UnitSpawnId = r0_0.RT_18,
}
r4_0[120221] = {
  ClearCondition = 100,
  RoomId = 120221,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_19,
}
r4_0[120222] = {
  ClearCondition = 120,
  RoomId = 120222,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_28,
}
r4_0[120223] = {
  ClearCondition = 140,
  RoomId = 120223,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    90073,
    9002017
  },
}
r4_0[120224] = {
  ClearCondition = 160,
  RoomId = 120224,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    90073,
    9001019,
    9002017
  },
}
r4_0[120225] = {
  ClearCondition = 50,
  RoomId = 120225,
  RoomType = "Boss",
  StaticCreatorId = r0_0.RT_22,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 220,
  UnitSpawnId = r0_0.RT_16,
}
r4_0[120311] = {
  ClearCondition = 100,
  RoomId = 120311,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_29,
}
r4_0[120312] = {
  ClearCondition = 120,
  RoomId = 120312,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    60173,
    6001012
  },
}
r4_0[120313] = {
  ClearCondition = 140,
  RoomId = 120313,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    60173,
    6002011
  },
}
r4_0[120314] = {
  ClearCondition = 160,
  RoomId = 120314,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    60173,
    6001012,
    6002011
  },
}
r4_0[120315] = {
  ClearCondition = 50,
  RoomId = 120315,
  RoomType = "Boss",
  StaticCreatorId = r0_0.RT_20,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 225,
  UnitSpawnId = r0_0.RT_4,
}
r4_0[120321] = {
  ClearCondition = 100,
  RoomId = 120321,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_21,
}
r4_0[120322] = {
  ClearCondition = 120,
  RoomId = 120322,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    80073,
    8002024
  },
}
r4_0[120323] = {
  ClearCondition = 140,
  RoomId = 120323,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    80073,
    8001022
  },
}
r4_0[120324] = {
  ClearCondition = 160,
  RoomId = 120324,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    80073,
    8002024,
    8001022
  },
}
r4_0[120325] = {
  ClearCondition = 50,
  RoomId = 120325,
  RoomType = "Boss",
  StaticCreatorId = r0_0.RT_25,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 205,
  UnitSpawnId = r0_0.RT_11,
}
r4_0[210111] = {
  ClearCondition = 100,
  RoomId = 210111,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_14,
}
r4_0[210112] = {
  ClearCondition = 120,
  RoomId = 210112,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_14,
}
r4_0[210113] = {
  ClearCondition = 140,
  RoomId = 210113,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_14,
}
r4_0[210114] = {
  ClearCondition = 160,
  RoomId = 210114,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_14,
}
r4_0[210115] = {
  ClearCondition = 50,
  RoomId = 210115,
  RoomType = "Boss",
  StaticCreatorId = r0_0.RT_31,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 135,
  UnitSpawnId = r0_0.RT_14,
}
r4_0[210121] = {
  ClearCondition = 100,
  RoomId = 210121,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_14,
}
r4_0[210122] = {
  ClearCondition = 120,
  RoomId = 210122,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_14,
}
r4_0[210123] = {
  ClearCondition = 140,
  RoomId = 210123,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_14,
}
r4_0[210124] = {
  ClearCondition = 160,
  RoomId = 210124,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_14,
}
r4_0[210125] = {
  ClearCondition = 50,
  RoomId = 210125,
  RoomType = "Boss",
  StaticCreatorId = r0_0.RT_31,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 135,
  UnitSpawnId = r0_0.RT_14,
}
r4_0[210211] = {
  ClearCondition = 100,
  RoomId = 210211,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_14,
}
r4_0[210212] = {
  ClearCondition = 120,
  RoomId = 210212,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_14,
}
r4_0[210213] = {
  ClearCondition = 140,
  RoomId = 210213,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_14,
}
r4_0[210214] = {
  ClearCondition = 160,
  RoomId = 210214,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_14,
}
r4_0[210215] = {
  ClearCondition = 50,
  RoomId = 210215,
  RoomType = "Boss",
  StaticCreatorId = r0_0.RT_31,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 135,
  UnitSpawnId = r0_0.RT_14,
}
r4_0[210221] = {
  ClearCondition = 100,
  RoomId = 210221,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_14,
}
r4_0[210222] = {
  ClearCondition = 120,
  RoomId = 210222,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_14,
}
r4_0[210223] = {
  ClearCondition = 140,
  RoomId = 210223,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_14,
}
r4_0[210224] = {
  ClearCondition = 160,
  RoomId = 210224,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_14,
}
r4_0[210225] = {
  ClearCondition = 50,
  RoomId = 210225,
  RoomType = "Boss",
  StaticCreatorId = r0_0.RT_31,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 135,
  UnitSpawnId = r0_0.RT_14,
}
r4_0[211111] = {
  ClearCondition = 100,
  RoomId = 211111,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_32,
}
r4_0[211112] = {
  ClearCondition = 120,
  RoomId = 211112,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    80201,
    8002012
  },
}
r4_0[211113] = {
  ClearCondition = 140,
  RoomId = 211113,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    80201,
    8001018
  },
}
r4_0[211114] = {
  ClearCondition = 160,
  RoomId = 211114,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    80201,
    8002012,
    8001018
  },
}
r4_0[211115] = {
  ClearCondition = 50,
  RoomId = 211115,
  RoomType = "Boss",
  StaticCreatorId = r0_0.RT_10,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 180,
  UnitSpawnId = r0_0.RT_33,
}
r4_0[211121] = {
  ClearCondition = 100,
  RoomId = 211121,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_34,
}
r4_0[211122] = {
  ClearCondition = 120,
  RoomId = 211122,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    60201,
    6001016
  },
}
r4_0[211123] = {
  ClearCondition = 140,
  RoomId = 211123,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    60201,
    6002017
  },
}
r4_0[211124] = {
  ClearCondition = 160,
  RoomId = 211124,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    60201,
    6001016,
    6002017
  },
}
r4_0[211125] = {
  ClearCondition = 50,
  RoomId = 211125,
  RoomType = "Boss",
  StaticCreatorId = r0_0.RT_8,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 180,
  UnitSpawnId = r0_0.RT_35,
}
r4_0[211211] = {
  ClearCondition = 100,
  RoomId = 211211,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_36,
}
r4_0[211212] = {
  ClearCondition = 120,
  RoomId = 211212,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    90201,
    9001016
  },
}
r4_0[211213] = {
  ClearCondition = 140,
  RoomId = 211213,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    90201,
    9002011
  },
}
r4_0[211214] = {
  ClearCondition = 160,
  RoomId = 211214,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    90201,
    9001016,
    9002011
  },
}
r4_0[211215] = {
  ClearCondition = 50,
  RoomId = 211215,
  RoomType = "Boss",
  StaticCreatorId = r0_0.RT_15,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 180,
  UnitSpawnId = r0_0.RT_37,
}
r4_0[211221] = {
  ClearCondition = 100,
  RoomId = 211221,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_38,
}
r4_0[211222] = {
  ClearCondition = 120,
  RoomId = 211222,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    70201,
    7002018
  },
}
r4_0[211223] = {
  ClearCondition = 140,
  RoomId = 211223,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    70201,
    7001011
  },
}
r4_0[211224] = {
  ClearCondition = 160,
  RoomId = 211224,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    70201,
    7002018,
    7001011
  },
}
r4_0[211225] = {
  ClearCondition = 50,
  RoomId = 211225,
  RoomType = "Boss",
  StaticCreatorId = r0_0.RT_17,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 205,
  UnitSpawnId = r0_0.RT_39,
}
r4_0[211311] = {
  ClearCondition = 100,
  RoomId = 211311,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_38,
}
r4_0[211312] = {
  ClearCondition = 120,
  RoomId = 211312,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    70201,
    7002014
  },
}
r4_0[211313] = {
  ClearCondition = 140,
  RoomId = 211313,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    70201,
    7003015
  },
}
r4_0[211314] = {
  ClearCondition = 160,
  RoomId = 211314,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    70201,
    7002014,
    7003015
  },
}
r4_0[211315] = {
  ClearCondition = 50,
  RoomId = 211315,
  RoomType = "Boss",
  StaticCreatorId = {
    2010201,
    2010293,
    2010212
  },
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 225,
  UnitSpawnId = r0_0.RT_39,
}
r4_0[211321] = {
  ClearCondition = 100,
  RoomId = 211321,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_38,
}
r4_0[211322] = {
  ClearCondition = 120,
  RoomId = 211322,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    70201,
    7002012
  },
}
r4_0[211323] = {
  ClearCondition = 140,
  RoomId = 211323,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    70201,
    7003016
  },
}
r4_0[211324] = {
  ClearCondition = 160,
  RoomId = 211324,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    70201,
    7002012,
    7003016
  },
}
r4_0[211325] = {
  ClearCondition = 50,
  RoomId = 211325,
  RoomType = "Boss",
  StaticCreatorId = r0_0.RT_40,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 225,
  UnitSpawnId = r0_0.RT_39,
}
r4_0[211411] = {
  ClearCondition = 100,
  RoomId = 211411,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_32,
}
r4_0[211412] = {
  ClearCondition = 120,
  RoomId = 211412,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    80201,
    8002023
  },
}
r4_0[211413] = {
  ClearCondition = 140,
  RoomId = 211413,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    80201,
    8003022
  },
}
r4_0[211414] = {
  ClearCondition = 160,
  RoomId = 211414,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    80201,
    8002023,
    8003022
  },
}
r4_0[211415] = {
  ClearCondition = 50,
  RoomId = 211415,
  RoomType = "Boss",
  StaticCreatorId = {
    2010201,
    2010291,
    2010211
  },
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 180,
  UnitSpawnId = r0_0.RT_33,
}
r4_0[211421] = {
  ClearCondition = 100,
  RoomId = 211421,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_34,
}
r4_0[211422] = {
  ClearCondition = 120,
  RoomId = 211422,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    60201,
    6001014
  },
}
r4_0[211423] = {
  ClearCondition = 140,
  RoomId = 211423,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    60201,
    6002018
  },
}
r4_0[211424] = {
  ClearCondition = 160,
  RoomId = 211424,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    60201,
    6001014,
    6002018
  },
}
r4_0[211425] = {
  ClearCondition = 50,
  RoomId = 211425,
  RoomType = "Boss",
  StaticCreatorId = r0_0.RT_8,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 180,
  UnitSpawnId = r0_0.RT_35,
}
r4_0[211511] = {
  ClearCondition = 100,
  RoomId = 211511,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_36,
}
r4_0[211512] = {
  ClearCondition = 120,
  RoomId = 211512,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    90201,
    9001024
  },
}
r4_0[211513] = {
  ClearCondition = 140,
  RoomId = 211513,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    90201,
    9007019
  },
}
r4_0[211514] = {
  ClearCondition = 160,
  RoomId = 211514,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    90201,
    9001024,
    9007019
  },
}
r4_0[211515] = {
  ClearCondition = 50,
  RoomId = 211515,
  RoomType = "Boss",
  StaticCreatorId = r0_0.RT_15,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 180,
  UnitSpawnId = r0_0.RT_37,
}
r4_0[211521] = {
  ClearCondition = 100,
  RoomId = 211521,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_38,
}
r4_0[211522] = {
  ClearCondition = 120,
  RoomId = 211522,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    70201,
    7002011
  },
}
r4_0[211523] = {
  ClearCondition = 140,
  RoomId = 211523,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    70201,
    7001015
  },
}
r4_0[211524] = {
  ClearCondition = 160,
  RoomId = 211524,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    70201,
    7002011,
    7001015
  },
}
r4_0[211525] = {
  ClearCondition = 50,
  RoomId = 211525,
  RoomType = "Boss",
  StaticCreatorId = r0_0.RT_17,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 205,
  UnitSpawnId = r0_0.RT_39,
}
r4_0[211611] = {
  ClearCondition = 100,
  RoomId = 211611,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_34,
}
r4_0[211612] = {
  ClearCondition = 120,
  RoomId = 211612,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    60201,
    6001012
  },
}
r4_0[211613] = {
  ClearCondition = 140,
  RoomId = 211613,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    60201,
    6002015
  },
}
r4_0[211614] = {
  ClearCondition = 160,
  RoomId = 211614,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    60201,
    6001012,
    6002015
  },
}
r4_0[211615] = {
  ClearCondition = 50,
  RoomId = 211615,
  RoomType = "Boss",
  StaticCreatorId = r0_0.RT_24,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 225,
  UnitSpawnId = r0_0.RT_35,
}
r4_0[211621] = {
  ClearCondition = 100,
  RoomId = 211621,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_38,
}
r4_0[211622] = {
  ClearCondition = 120,
  RoomId = 211622,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    70201,
    7002016
  },
}
r4_0[211623] = {
  ClearCondition = 140,
  RoomId = 211623,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    70201,
    7003017
  },
}
r4_0[211624] = {
  ClearCondition = 160,
  RoomId = 211624,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    70201,
    7002016,
    7003017
  },
}
r4_0[211625] = {
  ClearCondition = 50,
  RoomId = 211625,
  RoomType = "Boss",
  StaticCreatorId = r0_0.RT_40,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 225,
  UnitSpawnId = r0_0.RT_39,
}
r4_0[220111] = {
  ClearCondition = 100,
  RoomId = 220111,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_21,
}
r4_0[220112] = {
  ClearCondition = 120,
  RoomId = 220112,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    80073,
    8002018
  },
}
r4_0[220113] = {
  ClearCondition = 140,
  RoomId = 220113,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    80073,
    8003022
  },
}
r4_0[220114] = {
  ClearCondition = 160,
  RoomId = 220114,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    80073,
    8002018,
    8003022
  },
}
r4_0[220115] = {
  ClearCondition = 50,
  RoomId = 220115,
  RoomType = "Boss",
  StaticCreatorId = r0_0.RT_10,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 180,
  UnitSpawnId = r0_0.RT_11,
}
r4_0[220121] = {
  ClearCondition = 100,
  RoomId = 220121,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_21,
}
r4_0[220122] = {
  ClearCondition = 120,
  RoomId = 220122,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    80073,
    8002019
  },
}
r4_0[220123] = {
  ClearCondition = 140,
  RoomId = 220123,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    80073,
    8001023
  },
}
r4_0[220124] = {
  ClearCondition = 160,
  RoomId = 220124,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    80073,
    8002019,
    8001023
  },
}
r4_0[220125] = {
  ClearCondition = 50,
  RoomId = 220125,
  RoomType = "Boss",
  StaticCreatorId = r0_0.RT_13,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 180,
  UnitSpawnId = r0_0.RT_11,
}
r4_0[220211] = {
  ClearCondition = 100,
  RoomId = 220211,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = {
    70073
  },
}
r4_0[220212] = {
  ClearCondition = 120,
  RoomId = 220212,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    70073,
    7002014
  },
}
r4_0[220213] = {
  ClearCondition = 140,
  RoomId = 220213,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    70073,
    7001016
  },
}
r4_0[220214] = {
  ClearCondition = 160,
  RoomId = 220214,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    70073,
    7002014,
    7001016
  },
}
r4_0[220215] = {
  ClearCondition = 50,
  RoomId = 220215,
  RoomType = "Boss",
  StaticCreatorId = r0_0.RT_30,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 180,
  UnitSpawnId = r0_0.RT_18,
}
r4_0[220221] = {
  ClearCondition = 100,
  RoomId = 220221,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_19,
}
r4_0[220222] = {
  ClearCondition = 120,
  RoomId = 220222,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    90073,
    9001017
  },
}
r4_0[220223] = {
  ClearCondition = 140,
  RoomId = 220223,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    90073,
    9002024
  },
}
r4_0[220224] = {
  ClearCondition = 160,
  RoomId = 220224,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    90073,
    9001017,
    9002024
  },
}
r4_0[220225] = {
  ClearCondition = 50,
  RoomId = 220225,
  RoomType = "Boss",
  StaticCreatorId = r0_0.RT_25,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 205,
  UnitSpawnId = r0_0.RT_16,
}
r4_0[220311] = {
  ClearCondition = 100,
  RoomId = 220311,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_23,
}
r4_0[220312] = {
  ClearCondition = 120,
  RoomId = 220312,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    70173,
    6001012
  },
}
r4_0[220313] = {
  ClearCondition = 140,
  RoomId = 220313,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    70173,
    7003015
  },
}
r4_0[220314] = {
  ClearCondition = 160,
  RoomId = 220314,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    70173,
    6001012,
    7003015
  },
}
r4_0[220315] = {
  ClearCondition = 50,
  RoomId = 220315,
  RoomType = "Boss",
  StaticCreatorId = r0_0.RT_27,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 255,
  UnitSpawnId = r0_0.RT_18,
}
r4_0[220321] = {
  ClearCondition = 100,
  RoomId = 220321,
  RoomType = "Default",
  StaticCreatorId = r0_0.RT_1,
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Start.BP_EMGameMode_Abyss_Start",
  TimeLimit = 90,
  UnitSpawnId = r0_0.RT_19,
}
r4_0[220322] = {
  ClearCondition = 120,
  RoomId = 220322,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    90073,
    6001014
  },
}
r4_0[220323] = {
  ClearCondition = 140,
  RoomId = 220323,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    90073,
    9007011
  },
}
r4_0[220324] = {
  ClearCondition = 160,
  RoomId = 220324,
  RoomType = "Default",
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_Default.BP_EMGameMode_Abyss_Default",
  TimeLimit = 90,
  UnitSpawnId = {
    90073,
    6001014,
    9007011
  },
}
r4_0[220325] = {
  ClearCondition = 50,
  RoomId = 220325,
  RoomType = "Boss",
  StaticCreatorId = {
    2010101,
    2010192,
    2010105
  },
  SubGamemode = "/Game/AssetDesign/GameMode/Abyss/BP_EMGameMode_Abyss_BossBase.BP_EMGameMode_Abyss_BossBase",
  TimeLimit = 225,
  UnitSpawnId = r0_0.RT_16,
}
return r2_0(r3_0, r4_0)
