-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\RougeLikeEventSelect.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    3
  },
  RT_2 = {
    13
  },
  RT_3 = {
    6
  },
  RT_4 = {
    100
  },
  RT_5 = {
    4
  },
  RT_6 = {
    150
  },
  RT_7 = {
    11
  },
  RT_8 = {
    5
  },
  RT_9 = {
    12
  },
  RT_10 = {
    300
  },
  RT_11 = {
    2
  },
  RT_12 = {
    14
  },
  RT_13 = {
    10
  },
  RT_14 = {
    250
  },
  RT_15 = {
    200
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [48, 48] id: 1
  return r1_1
end
local r3_0 = "RougeLikeEventSelect"
local r4_0 = {
  [1011] = {
    IconType = 1,
    Id = 1011,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event301_Select_1",
    TreasureAward = r0_0.RT_1,
  },
  [1012] = {
    IconType = 1,
    Id = 1012,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event301_Select_2",
    TreasureAward = r0_0.RT_2,
  },
}
r4_0[1016] = {
  BlessingAward = {
    16
  },
  IconType = 1,
  Id = 1016,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event302_Select_1",
}
r4_0[1017] = {
  BlessingAward = {
    17
  },
  IconType = 1,
  Id = 1017,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event302_Select_2",
}
r4_0[1021] = {
  IconType = 1,
  Id = 1021,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event303_Select_1",
  TreasureAward = r0_0.RT_3,
}
r4_0[1022] = {
  IconType = 1,
  Id = 1022,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event303_Select_2",
  TokenAward = r0_0.RT_4,
}
r4_0[1026] = {
  BlessingAward = r0_0.RT_2,
  IconType = 1,
  Id = 1026,
  Name = "DialogueAward",
  Price = 50,
  SelectResultDesc = "RL_Event304_Select_1",
}
r4_0[1027] = {
  IconType = 1,
  Id = 1027,
  Name = "DialogueAward",
  Price = 50,
  SelectResultDesc = "RL_Event304_Select_2",
  TreasureAward = r0_0.RT_5,
}
r4_0[1028] = {
  IconType = 1,
  Id = 1028,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event304_Select_3",
  TokenAward = r0_0.RT_6,
}
r4_0[1031] = {
  IconType = 1,
  Id = 1031,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event305_Select_1",
  TokenAward = r0_0.RT_6,
}
r4_0[1032] = {
  BlessingAward = r0_0.RT_2,
  IconType = 1,
  Id = 1032,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event305_Select_2",
}
r4_0[1033] = {
  IconType = 1,
  Id = 1033,
  Name = "DialogueAward",
  Price = 100,
  SelectResultDesc = "RL_Event305_Select_3",
  TreasureAward = r0_0.RT_7,
}
r4_0[1036] = {
  BlessingAward = r0_0.RT_1,
  IconType = 1,
  Id = 1036,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event306_Select_1",
}
r4_0[1037] = {
  IconType = 0,
  Id = 1037,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event306_Select_2",
}
r4_0[1041] = {
  BlessingAward = r0_0.RT_3,
  IconType = 1,
  Id = 1041,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event307_Select_1",
}
r4_0[1042] = {
  IconType = 1,
  Id = 1042,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event307_Select_2",
  TokenAward = r0_0.RT_4,
}
r4_0[1046] = {
  GameModeEvent = "BattleEvent_1046",
  IconType = 1,
  Id = 1046,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event308_Select_1",
  TreasureAward = r0_0.RT_8,
}
r4_0[1047] = {
  BlessingAward = r0_0.RT_9,
  GameModeEvent = "BattleEvent_1047",
  IconType = 2,
  Id = 1047,
  Name = "Battle",
  SelectResultDesc = "RL_Event308_Select_2",
}
r4_0[1051] = {
  IconType = 1,
  Id = 1051,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event309_Select_1",
  TokenAward = r0_0.RT_10,
}
r4_0[1052] = {
  IconType = 1,
  Id = 1052,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event309_Select_2",
  TreasureAward = r0_0.RT_1,
}
r4_0[1056] = {
  BlessingAward = r0_0.RT_2,
  IconType = 1,
  Id = 1056,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event310_Select_1",
}
r4_0[1057] = {
  BlessingAward = r0_0.RT_11,
  IconType = 1,
  Id = 1057,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event310_Select_2",
}
r4_0[1061] = {
  IconType = 1,
  Id = 1061,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event311_Select_1",
  TreasureAward = {
    25
  },
}
r4_0[1062] = {
  BlessingAward = {
    15
  },
  IconType = 1,
  Id = 1062,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event311_Select_2",
}
r4_0[1066] = {
  BlessingAward = r0_0.RT_8,
  IconType = 1,
  Id = 1066,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event312_Select_1",
}
r4_0[1067] = {
  IconType = 1,
  Id = 1067,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event312_Select_2",
  TreasureAward = r0_0.RT_8,
}
r4_0[1071] = {
  IconType = 1,
  Id = 1071,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event313_Select_1",
  TokenAward = {
    180
  },
}
r4_0[1072] = {
  IconType = 1,
  Id = 1072,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event313_Select_2",
  TreasureAward = {
    26
  },
}
r4_0[1076] = {
  BlessingAward = r0_0.RT_12,
  IconType = 1,
  Id = 1076,
  Name = "DialogueAward",
  Price = 150,
  SelectResultDesc = "RL_Event314_Select_1",
}
r4_0[1077] = {
  IconType = 0,
  Id = 1077,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event314_Select_2",
}
r4_0[1081] = {
  BlessingAward = r0_0.RT_13,
  IconType = 1,
  Id = 1081,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event315_Select_1",
}
r4_0[1082] = {
  BlessingAward = r0_0.RT_7,
  IconType = 1,
  Id = 1082,
  Name = "DialogueAward",
  Price = 100,
  SelectResultDesc = "RL_Event315_Select_2",
}
r4_0[1083] = {
  BlessingAward = r0_0.RT_9,
  IconType = 1,
  Id = 1083,
  Name = "DialogueAward",
  Price = 200,
  SelectResultDesc = "RL_Event315_Select_3",
}
r4_0[1086] = {
  IconType = 1,
  Id = 1086,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event316_Select_1",
  TreasureAward = r0_0.RT_13,
}
r4_0[1087] = {
  IconType = 1,
  Id = 1087,
  Name = "DialogueAward",
  Price = 150,
  SelectResultDesc = "RL_Event316_Select_2",
  TreasureAward = r0_0.RT_12,
}
r4_0[1088] = {
  IconType = 0,
  Id = 1088,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event316_Select_3",
}
r4_0[1091] = {
  IconType = 1,
  Id = 1091,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event317_Select_1",
  TokenAward = r0_0.RT_10,
}
r4_0[1092] = {
  IconType = 1,
  Id = 1092,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event317_Select_2",
  TreasureAward = r0_0.RT_8,
}
r4_0[1093] = {
  BlessingAward = r0_0.RT_8,
  IconType = 1,
  Id = 1093,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event317_Select_3",
}
r4_0[1096] = {
  BlessingAward = {
    18
  },
  IconType = 1,
  Id = 1096,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event318_Select_1",
}
r4_0[1097] = {
  BlessingAward = {
    29
  },
  IconType = 1,
  Id = 1097,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event318_Select_2",
}
r4_0[1098] = {
  BlessingAward = {
    28
  },
  IconType = 1,
  Id = 1098,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event318_Select_3",
}
r4_0[1101] = {
  BlessingAward = {
    19
  },
  IconType = 1,
  Id = 1101,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event319_Select_1",
}
r4_0[1102] = {
  BlessingAward = {
    20
  },
  IconType = 1,
  Id = 1102,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event319_Select_2",
}
r4_0[1106] = {
  IconType = 1,
  Id = 1106,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event320_Select_1",
  TokenAward = r0_0.RT_14,
}
r4_0[1107] = {
  BlessingAward = r0_0.RT_5,
  IconType = 1,
  Id = 1107,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event320_Select_2",
}
r4_0[1111] = {
  GameModeEvent = "BattleEvent_1111",
  IconType = 2,
  Id = 1111,
  Name = "Battle",
  SelectResultDesc = "RL_Event321_Select_1",
  TokenAward = {
    450
  },
}
r4_0[1112] = {
  BlessingAward = r0_0.RT_5,
  GameModeEvent = "BattleEvent_1112",
  IconType = 1,
  Id = 1112,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event321_Select_2",
}
r4_0[1116] = {
  BlessingAward = r0_0.RT_11,
  GameModeEvent = "BattleEvent_1116",
  IconType = 2,
  Id = 1116,
  Name = "Battle",
  SelectResultDesc = "RL_Event322_Select_1",
}
r4_0[1117] = {
  GameModeEvent = "BattleEvent_1117",
  IconType = 1,
  Id = 1117,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event322_Select_2",
  TokenAward = r0_0.RT_15,
}
r4_0[1121] = {
  IconType = 1,
  Id = 1121,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event323_Select_1",
  TokenAward = r0_0.RT_10,
}
r4_0[1122] = {
  IconType = 1,
  Id = 1122,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event323_Select_2",
  TreasureAward = r0_0.RT_2,
}
r4_0[1126] = {
  IconType = 1,
  Id = 1126,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event324_Select_1",
  TreasureAward = r0_0.RT_5,
}
r4_0[1127] = {
  IconType = 1,
  Id = 1127,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event324_Select_2",
  TokenAward = r0_0.RT_14,
}
r4_0[1131] = {
  IconType = 1,
  Id = 1131,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event325_Select_1",
  TokenAward = r0_0.RT_15,
}
r4_0[1132] = {
  BlessingAward = r0_0.RT_2,
  IconType = 1,
  Id = 1132,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event325_Select_2",
}
r4_0[1136] = {
  GameModeEvent = "BattleEvent_1136",
  IconType = 1,
  Id = 1136,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event326_Select_1",
  TokenAward = {
    500
  },
}
r4_0[1137] = {
  BlessingAward = r0_0.RT_8,
  GameModeEvent = "BattleEvent_1137",
  IconType = 2,
  Id = 1137,
  Name = "Battle",
  SelectResultDesc = "RL_Event326_Select_2",
}
r4_0[1141] = {
  GameModeEvent = "BattleEvent_1141",
  IconType = 1,
  Id = 1141,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event327_Select_1",
  TokenAward = {
    750
  },
}
r4_0[1142] = {
  BlessingAward = r0_0.RT_1,
  GameModeEvent = "BattleEvent_1142",
  IconType = 2,
  Id = 1142,
  Name = "Battle",
  SelectResultDesc = "RL_Event327_Select_2",
}
r4_0[1146] = {
  IconType = 1,
  Id = 1146,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event328_Select_1",
  TreasureAward = {
    27
  },
}
r4_0[1147] = {
  IconType = 1,
  Id = 1147,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event328_Select_2",
  TokenAward = {
    1000
  },
}
r4_0[2001] = {
  BlessingAward = {
    -1,
    3,
    3
  },
  GameModeEvent = "GameEvent_2001",
  IconType = 3,
  Id = 2001,
  MiniGameScoreId = 1,
  Name = "Game",
  SelectResultDesc = "RL_Event381_Select_1",
  TokenAward = {
    150,
    200,
    250
  },
  TreasureAward = {
    -1,
    -1,
    4
  },
  UseDedicatedSettlementUI = 1,
}
r4_0[2003] = {
  BlessingAward = {
    -1,
    3
  },
  GameModeEvent = "GameEvent_2003",
  IconType = 3,
  Id = 2003,
  MiniGameScoreId = 2,
  Name = "Game",
  SelectResultDesc = "RL_Event382_Select_1",
  TokenAward = {
    150,
    250
  },
}
r4_0[2004] = {
  GameModeEvent = "GameEvent_2004",
  IconType = 1,
  Id = 2004,
  Name = "DialogueAward",
  SelectResultDesc = "RL_Event382_Select_2",
  TokenAward = r0_0.RT_6,
}
return r2_0(r3_0, r4_0)
