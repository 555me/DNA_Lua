-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\RougeLikeServerBuild.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    [1] = 0.2,
  },
  RT_2 = {
    [1] = 2,
  },
  RT_3 = {
    [1] = 4,
    [2] = 4,
  },
  RT_4 = {
    [1] = 5,
    [2] = 5,
  },
  RT_5 = {
    1
  },
  RT_6 = {
    1,
    6
  },
  RT_7 = {
    [1] = 300,
  },
  RT_8 = {
    [1] = 6,
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [30, 30] id: 1
  return r1_1
end
local r3_0 = "RougeLikeServerBuild"
local r4_0 = {}
r4_0[1] = {
  Id = 1,
  Param = {
    [1] = 1,
  },
  RoomCount = -1,
  ServerBuild = "MRTExtraTimes",
}
r4_0[2] = {
  Id = 2,
  Param = {
    [1] = 200,
  },
  RoomCount = 0,
  ServerBuild = "GetToken",
}
r4_0[3] = {
  Id = 3,
  Param = {
    [1] = 0.8,
  },
  RoomCount = -1,
  ServerBuild = "ShopDiscount",
}
r4_0[4] = {
  Id = 4,
  Param = r0_0.RT_3,
  RoomCount = 0,
  ServerBuild = "GetBlessing",
}
r4_0[5] = {
  Id = 5,
  Param = r0_0.RT_8,
  RoomCount = 0,
  ServerBuild = "ReplaceAllBlessing",
}
r4_0[6] = {
  Id = 6,
  Param = r0_0.RT_8,
  RoomCount = 0,
  ServerBuild = "ReplaceAllTreasure",
}
r4_0[7] = {
  Id = 7,
  RoomCount = 3,
  RoomType = r0_0.RT_6,
  ServerBuild = "DisableGetToken",
}
r4_0[8] = {
  Id = 8,
  RoomCount = 2,
  RoomType = r0_0.RT_5,
  ServerBuild = "DisableGetToken",
}
r4_0[9] = {
  Id = 9,
  Param = r0_0.RT_1,
  RoomCount = -1,
  ServerBuild = "EndPointsExtraRate",
}
r4_0[10] = {
  Id = 10,
  Param = r0_0.RT_1,
  RoomCount = -1,
  ServerBuild = "TokenExtraRate",
}
r4_0[11] = {
  Id = 11,
  Param = {
    [1] = 13,
  },
  RoomCount = 0,
  ServerBuild = "GetTreasure",
}
r4_0[12] = {
  Id = 12,
  Param = {
    [1] = 1.5,
  },
  RoomCount = -1,
  ServerBuild = "ShopDiscount",
}
r4_0[13] = {
  Id = 13,
  Param = r0_0.RT_2,
  RoomCount = -1,
  ServerBuild = "ChoiceNumber",
}
r4_0[14] = {
  Id = 14,
  RoomCount = -1,
  ServerBuild = "RandomChoice",
}
r4_0[15] = {
  Id = 15,
  Param = {
    [1] = 0,
    [2] = 1,
  },
  RoomCount = -1,
  ServerBuild = "RefreshCost",
}
r4_0[16] = {
  Id = 16,
  Param = r0_0.RT_3,
  RoomCount = 0,
  ServerBuild = "GetTreasure",
}
r4_0[17] = {
  Id = 17,
  Param = r0_0.RT_4,
  RoomCount = 0,
  ServerBuild = "GetBlessing",
}
r4_0[18] = {
  Id = 18,
  Param = r0_0.RT_4,
  RoomCount = 0,
  ServerBuild = "GetTreasure",
}
r4_0[19] = {
  Id = 19,
  Param = {
    [1] = 0.3,
  },
  RoomCount = -1,
  ServerBuild = "EndPointsExtraRate",
}
r4_0[20] = {
  Id = 20,
  Param = r0_0.RT_2,
  RoomCount = 4,
  ServerBuild = "RefreshRate",
}
r4_0[21] = {
  Id = 21,
  Param = {
    [1] = 1000,
    [2] = 500,
  },
  RoomCount = -1,
  ServerBuild = "RecoverTimes",
}
r4_0[22] = {
  Id = 22,
  Param = {
    [1] = 1,
    [2] = r0_0.RT_5,
  },
  RoomCount = -1,
  RoomType = r0_0.RT_6,
  ServerBuild = "MRTAutoUpgrade",
}
r4_0[23] = {
  Id = 23,
  Param = {
    [1] = "Mon.Strong",
    [2] = 3,
    [3] = 24,
  },
  RoomCount = -1,
  ServerBuild = "KillMonster",
}
r4_0[24] = {
  Id = 24,
  Param = {
    [1] = 150,
  },
  RoomCount = 0,
  ServerBuild = "GetToken",
}
r4_0[25] = {
  Id = 25,
  Param = {
    [1] = 50,
  },
  RoomCount = -1,
  ServerBuild = "EffectByToken",
}
r4_0[26] = {
  Id = 26,
  Param = {
    [1] = "Blessing",
    [2] = 50,
  },
  RoomCount = 0,
  ServerBuild = "GetTokenByAwardCount",
}
local r5_0 = {
  Id = 27,
}
r5_0.Param = {
  [1] = "Blessing",
  [2] = {
    2,
    3
  },
}
r5_0.RoomCount = 2
r5_0.RoomType = r0_0.RT_6
r5_0.ServerBuild = "MRTLimitRarity"
r4_0[27] = r5_0
r4_0[28] = {
  Id = 28,
  Param = {
    [1] = 1.2,
  },
  RoomCount = 4,
  ServerBuild = "ShopDiscount",
}
r4_0[29] = {
  Id = 29,
  Param = r0_0.RT_7,
  RoomCount = 0,
  ServerBuild = "GetToken",
}
r4_0[30] = {
  Id = 30,
  Param = r0_0.RT_2,
  RoomCount = 4,
  ServerBuild = "RefreshRate",
}
r4_0[31] = {
  Id = 31,
  Param = r0_0.RT_7,
  RoomCount = 0,
  ServerBuild = "GetToken",
}
r4_0[32] = {
  Id = 32,
  RoomCount = 6,
  ServerBuild = "DisableGetToken",
}
r4_0[33] = {
  Id = 33,
  Param = {
    [1] = 1000,
  },
  RoomCount = 0,
  ServerBuild = "GetToken",
}
r4_0[34] = {
  Id = 34,
  Param = {
    [1] = "Blessing",
    [2] = 1,
    [3] = 1,
  },
  RoomCount = 0,
  ServerBuild = "GetGroupAwardByCount",
}
r4_0[35] = {
  Id = 35,
  Param = {
    [1] = 21,
  },
  RoomCount = 0,
  ServerBuild = "GetBlessing",
}
r4_0[36] = {
  Id = 36,
  Param = {
    [1] = "Blessing",
    [2] = r0_0.RT_5,
    [3] = 1.8,
  },
  RoomCount = -1,
  ServerBuild = "GroupWeightRate",
}
r4_0[37] = {
  Id = 37,
  Param = {
    [1] = 22,
  },
  RoomCount = 0,
  ServerBuild = "GetBlessing",
}
r5_0 = {
  Id = 38,
}
r5_0.Param = {
  [1] = "Blessing",
  [2] = {
    2
  },
  [3] = 1.8,
}
r5_0.RoomCount = -1
r5_0.ServerBuild = "GroupWeightRate"
r4_0[38] = r5_0
r4_0[39] = {
  Id = 39,
  Param = {
    [1] = 23,
  },
  RoomCount = 0,
  ServerBuild = "GetBlessing",
}
r5_0 = {
  Id = 40,
}
r5_0.Param = {
  [1] = "Blessing",
  [2] = {
    3
  },
  [3] = 1.8,
}
r5_0.RoomCount = -1
r5_0.ServerBuild = "GroupWeightRate"
r4_0[40] = r5_0
r4_0[41] = {
  Id = 41,
  Param = {
    [1] = 24,
  },
  RoomCount = 0,
  ServerBuild = "GetBlessing",
}
r5_0 = {
  Id = 42,
}
r5_0.Param = {
  [1] = "Blessing",
  [2] = {
    4
  },
  [3] = 1.8,
}
r5_0.RoomCount = -1
r5_0.ServerBuild = "GroupWeightRate"
r4_0[42] = r5_0
r4_0[43] = {
  Id = 43,
  Param = {
    [1] = 25,
  },
  RoomCount = 0,
  ServerBuild = "GetBlessing",
}
r5_0 = {
  Id = 44,
}
r5_0.Param = {
  [1] = "Blessing",
  [2] = {
    5
  },
  [3] = 1.8,
}
r5_0.RoomCount = -1
r5_0.ServerBuild = "GroupWeightRate"
r4_0[44] = r5_0
r4_0[45] = {
  Id = 45,
  Param = {
    [1] = 26,
  },
  RoomCount = 0,
  ServerBuild = "GetBlessing",
}
r5_0 = {
  Id = 46,
}
r5_0.Param = {
  [1] = "Blessing",
  [2] = {
    6
  },
  [3] = 1.8,
}
r5_0.RoomCount = -1
r5_0.ServerBuild = "GroupWeightRate"
r4_0[46] = r5_0
r4_0[47] = {
  Id = 47,
  Param = {
    [1] = 27,
  },
  RoomCount = 0,
  ServerBuild = "GetBlessing",
}
r5_0 = {
  Id = 48,
}
r5_0.Param = {
  [1] = "Blessing",
  [2] = {
    7
  },
  [3] = 1.8,
}
r5_0.RoomCount = -1
r5_0.ServerBuild = "GroupWeightRate"
r4_0[48] = r5_0
r4_0[49] = {
  Id = 49,
  RoomCount = 1,
  ServerBuild = "Skip",
}
r4_0[50] = {
  Id = 50,
  RoomCount = 6,
  ServerBuild = "Skip",
}
r4_0[999] = {
  Id = 999,
  RoomCount = 1,
  ServerBuild = "DisableGetToken",
}
return r2_0(r3_0, r4_0)
