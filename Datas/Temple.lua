-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\Temple.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    7104
  },
  RT_2 = {
    7104,
    7102,
    7103
  },
  RT_3 = {
    0,
    40,
    70
  },
  RT_4 = {
    0,
    120,
    210
  },
  RT_5 = {
    0,
    120,
    240
  },
  RT_6 = {
    0,
    20,
    35
  },
  RT_7 = {
    1000,
    2000,
    3000
  },
  RT_8 = {
    2000,
    3000,
    4000
  },
  RT_9 = {
    0,
    60,
    120
  },
  RT_10 = {
    3000,
    5000,
    7000
  },
  RT_11 = {
    10,
    20,
    40
  },
  RT_12 = {
    30,
    50,
    80
  },
  RT_13 = {
    7101,
    7102,
    7103
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [66, 66] id: 1
  return r1_1
end
local r3_0 = "Temple"
local r4_0 = {
  [21] = {
    DungeonId = 21,
    RewardId = r0_0.RT_1,
    SucRule = "Time",
    UIHideCombo = 1,
  },
  [22] = {
    DungeonId = 22,
    RewardId = r0_0.RT_2,
    SucRule = "Score",
    UIHideCombo = 1,
  },
  [23] = {
    DungeonId = 23,
    RewardId = r0_0.RT_2,
    SucRule = "Time",
    UIHideCombo = 1,
  },
  [27] = {
    DungeonId = 27,
    RewardId = r0_0.RT_2,
    SucRule = "Time",
    UIHideCombo = 1,
  },
  [39] = {
    DungeonId = 39,
    RewardId = r0_0.RT_2,
    SucRule = "Score",
    UIHideCombo = 1,
  },
  [40] = {
    DungeonId = 40,
    RewardId = r0_0.RT_2,
    SucRule = "Score",
    UIHideCombo = 1,
  },
  [41] = {
    DungeonId = 41,
    RewardId = r0_0.RT_2,
    SucRule = "Score",
    UIHideCombo = 1,
  },
  [42] = {
    DungeonId = 42,
    RewardId = r0_0.RT_2,
    SucRule = "Score",
    UIHideCombo = 1,
  },
  [44] = {
    DungeonId = 44,
    RatingRange = r0_0.RT_3,
    RewardId = r0_0.RT_2,
    SucRule = "CountDown",
    UIHideCombo = 1,
  },
  [45] = {
    DungeonId = 45,
    RatingRange = r0_0.RT_4,
    RewardId = r0_0.RT_2,
    SucRule = "CountDown",
    UIHideCombo = 1,
  },
  [46] = {
    DungeonId = 46,
    RatingRange = r0_0.RT_4,
    RewardId = r0_0.RT_2,
    SucRule = "CountDown",
    UIHideCombo = 1,
  },
  [47] = {
    DungeonId = 47,
    RatingRange = r0_0.RT_3,
    RewardId = r0_0.RT_2,
    SucRule = "CountDown",
    UIHideCombo = 1,
  },
  [48] = {
    DungeonId = 48,
    RatingRange = r0_0.RT_5,
    RewardId = r0_0.RT_2,
    SucRule = "CountDown",
    UIHideCombo = 1,
  },
  [49] = {
    DungeonId = 49,
    RatingRange = r0_0.RT_5,
    RewardId = r0_0.RT_2,
    SucRule = "CountDown",
    UIHideCombo = 1,
  },
  [80000] = {
    DungeonId = 80000,
    RatingRange = r0_0.RT_6,
    RewardId = r0_0.RT_2,
    SucRule = "CountDown",
    UIHideCombo = 1,
  },
  [80101] = {
    DungeonId = 80101,
    RatingRange = r0_0.RT_6,
    RewardId = r0_0.RT_2,
    SucRule = "Score",
    UIHideCombo = 1,
  },
}
r4_0[80102] = {
  DungeonId = 80102,
  RatingRange = {
    0,
    40,
    55
  },
  RewardId = r0_0.RT_2,
  SucRule = "Score",
  UIHideCombo = 1,
}
r4_0[80201] = {
  DungeonId = 80201,
  RatingRange = {
    0,
    15,
    25
  },
  RewardId = r0_0.RT_2,
  SucRule = "Score",
  UIHideCombo = 1,
}
r4_0[80202] = {
  DungeonId = 80202,
  RatingRange = {
    0,
    22,
    44
  },
  RewardId = r0_0.RT_2,
  SucRule = "Score",
  UIHideCombo = 1,
}
r4_0[80301] = {
  DungeonId = 80301,
  RatingRange = {
    0,
    90,
    180
  },
  RewardId = r0_0.RT_2,
  SucRule = "CountDown",
  UIHideCombo = 1,
}
r4_0[80302] = {
  DungeonId = 80302,
  RatingRange = {
    0,
    1620,
    1710
  },
  RewardId = r0_0.RT_2,
  SucRule = "CountDown",
  UIHideCombo = 1,
  UIShowType = 1,
}
r4_0[80401] = {
  DungeonId = 80401,
  RatingRange = r0_0.RT_7,
  RewardId = r0_0.RT_2,
  SucRule = "Score",
  UIHideCombo = 1,
  UIHideFailCond = 1,
}
r4_0[80402] = {
  DungeonId = 80402,
  RatingRange = r0_0.RT_8,
  RewardId = r0_0.RT_2,
  SucRule = "Score",
  UIHideCombo = 1,
  UIHideFailCond = 1,
}
r4_0[80403] = {
  DungeonId = 80403,
  RatingRange = {
    5000,
    6500,
    8000
  },
  RewardId = r0_0.RT_2,
  SucRule = "Score",
  UIHideCombo = 1,
  UIHideFailCond = 1,
}
r4_0[80404] = {
  DungeonId = 80404,
  RatingRange = {
    4000,
    5500,
    7000
  },
  RewardId = r0_0.RT_2,
  SucRule = "Score",
  UIHideCombo = 1,
  UIHideFailCond = 1,
}
r4_0[80501] = {
  DungeonId = 80501,
  RatingRange = r0_0.RT_9,
  RewardId = r0_0.RT_2,
  SucRule = "CountDown",
  UIHideCombo = 1,
}
r4_0[80502] = {
  DungeonId = 80502,
  RatingRange = {
    0,
    1620,
    1740
  },
  RewardId = r0_0.RT_2,
  SucRule = "CountDown",
  UIHideCombo = 1,
  UIShowType = 1,
}
r4_0[80601] = {
  DungeonId = 80601,
  RatingRange = r0_0.RT_9,
  RewardId = r0_0.RT_2,
  SucRule = "CountDown",
  UIHideCombo = 1,
}
r4_0[80602] = {
  DungeonId = 80602,
  RatingRange = r0_0.RT_9,
  RewardId = r0_0.RT_2,
  SucRule = "CountDown",
  UIHideCombo = 1,
}
r4_0[80701] = {
  DungeonId = 80701,
  RewardId = r0_0.RT_1,
  SucRule = "Time",
  UIHideCombo = 1,
}
r4_0[80702] = {
  DungeonId = 80702,
  RewardId = r0_0.RT_1,
  SucRule = "Time",
  UIHideCombo = 1,
}
r4_0[80703] = {
  DungeonId = 80703,
  RewardId = r0_0.RT_1,
  SucRule = "Time",
  UIHideCombo = 1,
}
r4_0[80704] = {
  DungeonId = 80704,
  RewardId = r0_0.RT_1,
  SucRule = "Time",
  UIHideCombo = 1,
  UIShowType = 1,
}
r4_0[80705] = {
  DungeonId = 80705,
  RewardId = r0_0.RT_1,
  SucRule = "Time",
  UIHideCombo = 1,
  UIShowType = 1,
}
r4_0[80801] = {
  DungeonId = 80801,
  RatingRange = r0_0.RT_7,
  RewardId = r0_0.RT_2,
  SucRule = "Score",
  UIHideCombo = 1,
  UIHideFailCond = 1,
}
r4_0[80802] = {
  DungeonId = 80802,
  RatingRange = {
    1000,
    3000,
    5000
  },
  RewardId = r0_0.RT_2,
  SucRule = "Score",
  UIHideCombo = 1,
  UIHideFailCond = 1,
}
r4_0[80803] = {
  DungeonId = 80803,
  RatingRange = r0_0.RT_10,
  RewardId = r0_0.RT_2,
  SucRule = "Score",
  UIHideCombo = 1,
  UIHideFailCond = 1,
}
r4_0[80804] = {
  DungeonId = 80804,
  RatingRange = r0_0.RT_10,
  RewardId = r0_0.RT_2,
  SucRule = "Score",
  UIHideCombo = 1,
  UIHideFailCond = 1,
}
r4_0[80901] = {
  DungeonId = 80901,
  RatingRange = r0_0.RT_11,
  RewardId = r0_0.RT_2,
  SucRule = "Score",
  UIHideCombo = 1,
}
r4_0[80902] = {
  DungeonId = 80902,
  RatingRange = {
    5,
    15,
    25
  },
  RewardId = r0_0.RT_2,
  SucRule = "Score",
  UIHideCombo = 1,
  UIHideDes = 1,
}
r4_0[80903] = {
  DungeonId = 80903,
  RatingRange = {
    10,
    25,
    40
  },
  RewardId = r0_0.RT_2,
  SucRule = "Score",
  UIHideCombo = 1,
  UIHideDes = 1,
}
r4_0[80904] = {
  DungeonId = 80904,
  RatingRange = r0_0.RT_11,
  RewardId = r0_0.RT_2,
  SucRule = "Score",
  UIHideCombo = 1,
}
r4_0[81001] = {
  DungeonId = 81001,
  RatingRange = {
    100,
    150,
    200
  },
  RewardId = r0_0.RT_2,
  SucRule = "Score",
  UIHideCombo = 1,
}
r4_0[81002] = {
  DungeonId = 81002,
  RatingRange = {
    80,
    160,
    240
  },
  RewardId = r0_0.RT_2,
  SucRule = "Score",
  UIHideCombo = 1,
}
r4_0[81003] = {
  DungeonId = 81003,
  RatingRange = {
    0,
    1650,
    1740
  },
  RewardId = r0_0.RT_2,
  SucRule = "CountDown",
  UIHideCombo = 1,
  UIShowType = 1,
}
r4_0[81101] = {
  DungeonId = 81101,
  RatingRange = r0_0.RT_5,
  RewardId = r0_0.RT_2,
  SucRule = "CountDown",
  UIHideCombo = 1,
}
r4_0[81102] = {
  DungeonId = 81102,
  RatingRange = r0_0.RT_5,
  RewardId = r0_0.RT_2,
  SucRule = "CountDown",
  UIHideCombo = 1,
}
r4_0[81103] = {
  DungeonId = 81103,
  RatingRange = r0_0.RT_5,
  RewardId = r0_0.RT_2,
  SucRule = "CountDown",
  UIHideCombo = 1,
}
r4_0[81201] = {
  DungeonId = 81201,
  RatingRange = r0_0.RT_8,
  RewardId = r0_0.RT_2,
  SucRule = "Score",
  UIHideCombo = 1,
  UIHideFailCond = 1,
}
r4_0[81202] = {
  DungeonId = 81202,
  RatingRange = r0_0.RT_8,
  RewardId = r0_0.RT_2,
  SucRule = "Score",
  UIHideCombo = 1,
  UIHideFailCond = 1,
}
r4_0[81203] = {
  DungeonId = 81203,
  RatingRange = {
    2000,
    4000,
    6000
  },
  RewardId = r0_0.RT_2,
  SucRule = "Score",
  UIHideCombo = 1,
  UIHideFailCond = 1,
}
r4_0[81204] = {
  DungeonId = 81204,
  RatingRange = {
    1000,
    2000,
    4000
  },
  RewardId = r0_0.RT_2,
  SucRule = "Score",
  UIHideCombo = 1,
  UIHideFailCond = 1,
}
r4_0[81301] = {
  DungeonId = 81301,
  RatingRange = r0_0.RT_12,
  RewardId = r0_0.RT_2,
  SucRule = "Score",
  UIHideCombo = 1,
}
r4_0[81302] = {
  DungeonId = 81302,
  RatingRange = r0_0.RT_12,
  RewardId = r0_0.RT_2,
  SucRule = "Score",
  UIHideCombo = 1,
}
r4_0[81401] = {
  DungeonId = 81401,
  RatingRange = r0_0.RT_12,
  RewardId = r0_0.RT_2,
  SucRule = "Score",
  UIHideCombo = 1,
}
r4_0[81402] = {
  DungeonId = 81402,
  RatingRange = r0_0.RT_12,
  RewardId = r0_0.RT_2,
  SucRule = "Score",
  UIHideCombo = 1,
}
r4_0[81501] = {
  DungeonId = 81501,
  RatingRange = {
    500,
    1500,
    2500
  },
  RewardId = r0_0.RT_13,
  SucRule = "Score",
  UIHideCombo = 1,
  UIHideFailCond = 1,
}
r4_0[81502] = {
  DungeonId = 81502,
  RatingRange = {
    1000,
    2500,
    4000
  },
  RewardId = r0_0.RT_13,
  SucRule = "Score",
  UIHideCombo = 1,
  UIHideFailCond = 1,
}
r4_0[81601] = {
  DungeonId = 81601,
  RatingRange = {
    100,
    1500,
    2500
  },
  RewardId = r0_0.RT_13,
  SucRule = "Score",
  UIHideCombo = 1,
  UIHideFailCond = 1,
}
return r2_0(r3_0, r4_0)
