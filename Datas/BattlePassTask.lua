-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\BattlePassTask.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    10150
  },
  RT_2 = {
    201
  },
  RT_3 = {
    10100
  },
  RT_4 = {
    10116
  },
  RT_5 = {
    30101
  },
  RT_6 = {
    1400101
  },
  RT_7 = {
    10200
  },
  RT_8 = {
    1900101
  },
  RT_9 = {
    11000
  },
  RT_10 = {
    10600
  },
  RT_11 = {
    10201
  },
  RT_12 = {
    50930
  },
  RT_13 = {
    10800
  },
  RT_14 = {
    9000
  },
  RT_15 = {
    10051601
  },
  RT_16 = {
    1400201
  },
  RT_17 = {
    2300101
  },
  RT_18 = {
    11600
  },
  RT_19 = {
    22000
  },
  RT_20 = {
    1500102
  },
  RT_21 = {
    23000
  },
  RT_22 = {
    100101
  },
  RT_23 = {
    22500
  },
  RT_24 = {
    20300
  },
  RT_25 = {
    1080201
  },
  RT_26 = {
    1500110
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [81, 81] id: 1
  return r1_1
end
local r3_0 = "BattlePassTask"
local r4_0 = {
  [100001001] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001001",
    BattlePassTaskId = 100001001,
    BattlePassType = "Daily",
    QuestReward = r0_0.RT_1,
    Target = 1,
    TargetId = r0_0.RT_2,
  },
  [100001003] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001003",
    BattlePassTaskId = 100001003,
    BattlePassType = "Daily",
    JumpUIId = 31,
    QuestReward = r0_0.RT_3,
    Target = 200,
    TargetId = r0_0.RT_4,
  },
  [100001004] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001004",
    BattlePassTaskId = 100001004,
    BattlePassType = "Daily",
    JumpUIId = 20,
    QuestReward = r0_0.RT_3,
    Target = 3,
    TargetId = r0_0.RT_5,
  },
  [100001005] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001005",
    BattlePassTaskId = 100001005,
    BattlePassType = "Daily",
    QuestReward = r0_0.RT_3,
    Target = 1,
    TargetId = r0_0.RT_6,
  },
  [100001006] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001006",
    BattlePassTaskId = 100001006,
    BattlePassType = "Daily",
    JumpUIId = 21,
    QuestReward = r0_0.RT_7,
    Target = 1,
    TargetId = r0_0.RT_8,
  },
  [100001101] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001101",
    BattlePassTaskId = 100001101,
    BattlePassType = "Weekly",
    JumpUIId = 20,
    QuestReward = r0_0.RT_9,
    Target = 30,
    TargetId = r0_0.RT_5,
  },
  [100001102] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001102",
    BattlePassTaskId = 100001102,
    BattlePassType = "Weekly",
    QuestReward = r0_0.RT_10,
    Target = 300000,
    TargetId = r0_0.RT_11,
  },
  [100001103] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001103",
    BattlePassTaskId = 100001103,
    BattlePassType = "Weekly",
    JumpUIId = 19,
    QuestReward = r0_0.RT_10,
    Target = 10,
    TargetId = r0_0.RT_12,
  },
  [100001104] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001104",
    BattlePassTaskId = 100001104,
    BattlePassType = "Weekly",
    JumpUIId = 13,
    QuestReward = r0_0.RT_13,
    Target = 1,
    TargetId = r0_0.RT_14,
  },
  [100001105] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001105",
    BattlePassTaskId = 100001105,
    BattlePassType = "Weekly",
    QuestReward = r0_0.RT_10,
    Target = 1,
    TargetId = r0_0.RT_15,
  },
  [100001106] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001106",
    BattlePassTaskId = 100001106,
    BattlePassType = "Weekly",
    QuestReward = r0_0.RT_13,
    Target = 10,
    TargetId = r0_0.RT_6,
  },
  [100001107] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001107",
    BattlePassTaskId = 100001107,
    BattlePassType = "Weekly",
    JumpUIId = 50,
    QuestReward = r0_0.RT_10,
    Target = 3,
    TargetId = r0_0.RT_16,
  },
  [100001108] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001108",
    BattlePassTaskId = 100001108,
    BattlePassType = "Weekly",
    JumpUIId = 22,
    QuestReward = r0_0.RT_13,
    Target = 1,
    TargetId = r0_0.RT_17,
  },
  [100001109] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001109",
    BattlePassTaskId = 100001109,
    BattlePassType = "Weekly",
    JumpUIId = 21,
    QuestReward = r0_0.RT_18,
    Target = 6,
    TargetId = r0_0.RT_8,
  },
  [100001110] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001110",
    BattlePassTaskId = 100001110,
    BattlePassType = "Weekly",
    JumpUIId = 21,
    QuestReward = r0_0.RT_18,
    Target = 12,
    TargetId = r0_0.RT_8,
  },
  [100001111] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001111",
    BattlePassTaskId = 100001111,
    BattlePassType = "Weekly",
    JumpUIId = 21,
    QuestReward = r0_0.RT_18,
    Target = 18,
    TargetId = r0_0.RT_8,
  },
  [100001112] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001112",
    BattlePassTaskId = 100001112,
    BattlePassType = "Weekly",
    JumpUIId = 21,
    QuestReward = r0_0.RT_18,
    Target = 24,
    TargetId = r0_0.RT_8,
  },
  [100001201] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001201",
    BattlePassTaskId = 100001201,
    BattlePassType = "Version",
    JumpUIId = 14,
    QuestReward = r0_0.RT_19,
    Target = 1,
    TargetId = r0_0.RT_20,
  },
  [100001202] = {
    BattlePassId = 100001,
    BattlePassTaskDes = "BattlePass_Task_Des_100001202",
    BattlePassTaskId = 100001202,
    BattlePassType = "Version",
    JumpUIId = 5,
    QuestReward = r0_0.RT_21,
    Target = 40,
    TargetId = r0_0.RT_22,
  },
}
r4_0[100001203] = {
  BattlePassId = 100001,
  BattlePassTaskDes = "BattlePass_Task_Des_100001203",
  BattlePassTaskId = 100001203,
  BattlePassType = "Version",
  JumpUIId = 11,
  QuestReward = r0_0.RT_23,
  Target = 1,
  TargetId = {
    70108
  },
}
r4_0[100001204] = {
  BattlePassId = 100001,
  BattlePassTaskDes = "BattlePass_Task_Des_100001204",
  BattlePassTaskId = 100001204,
  BattlePassType = "Version",
  JumpUIId = 17,
  QuestReward = r0_0.RT_23,
  Target = 1,
  TargetId = {
    70110
  },
}
r4_0[100001205] = {
  BattlePassId = 100001,
  BattlePassTaskDes = "BattlePass_Task_Des_100001205",
  BattlePassTaskId = 100001205,
  BattlePassType = "Version",
  JumpUIId = 32,
  QuestReward = r0_0.RT_23,
  Target = 1,
  TargetId = {
    1800101
  },
}
r4_0[100001206] = {
  BattlePassId = 100001,
  BattlePassTaskDes = "BattlePass_Task_Des_100001206",
  BattlePassTaskId = 100001206,
  BattlePassType = "Version",
  QuestReward = r0_0.RT_19,
  Target = 8,
  TargetId = r0_0.RT_2,
}
r4_0[100001207] = {
  BattlePassId = 100001,
  BattlePassTaskDes = "BattlePass_Task_Des_100002202",
  BattlePassTaskId = 100001207,
  BattlePassType = "Version",
  QuestReward = r0_0.RT_19,
  Target = 1000,
  TargetId = {
    2200601
  },
  TaskUnlockTime = 1762135200,
}
r4_0[100002001] = {
  BattlePassId = 100002,
  BattlePassTaskDes = "BattlePass_Task_Des_100001001",
  BattlePassTaskId = 100002001,
  BattlePassType = "Daily",
  QuestReward = r0_0.RT_1,
  Target = 1,
  TargetId = r0_0.RT_2,
}
r4_0[100002003] = {
  BattlePassId = 100002,
  BattlePassTaskDes = "BattlePass_Task_Des_100001003",
  BattlePassTaskId = 100002003,
  BattlePassType = "Daily",
  JumpUIId = 31,
  QuestReward = r0_0.RT_3,
  Target = 200,
  TargetId = r0_0.RT_4,
}
r4_0[100002004] = {
  BattlePassId = 100002,
  BattlePassTaskDes = "BattlePass_Task_Des_100001004",
  BattlePassTaskId = 100002004,
  BattlePassType = "Daily",
  JumpUIId = 20,
  QuestReward = r0_0.RT_3,
  Target = 3,
  TargetId = r0_0.RT_5,
}
r4_0[100002005] = {
  BattlePassId = 100002,
  BattlePassTaskDes = "BattlePass_Task_Des_100001005",
  BattlePassTaskId = 100002005,
  BattlePassType = "Daily",
  QuestReward = r0_0.RT_3,
  Target = 1,
  TargetId = r0_0.RT_6,
}
r4_0[100002006] = {
  BattlePassId = 100002,
  BattlePassTaskDes = "BattlePass_Task_Des_100001006",
  BattlePassTaskId = 100002006,
  BattlePassType = "Daily",
  JumpUIId = 21,
  QuestReward = r0_0.RT_7,
  Target = 1,
  TargetId = r0_0.RT_8,
}
r4_0[100002101] = {
  BattlePassId = 100002,
  BattlePassTaskDes = "BattlePass_Task_Des_100001101",
  BattlePassTaskId = 100002101,
  BattlePassType = "Weekly",
  JumpUIId = 20,
  QuestReward = r0_0.RT_9,
  Target = 30,
  TargetId = r0_0.RT_5,
}
r4_0[100002102] = {
  BattlePassId = 100002,
  BattlePassTaskDes = "BattlePass_Task_Des_100001102",
  BattlePassTaskId = 100002102,
  BattlePassType = "Weekly",
  QuestReward = r0_0.RT_10,
  Target = 300000,
  TargetId = r0_0.RT_11,
}
r4_0[100002103] = {
  BattlePassId = 100002,
  BattlePassTaskDes = "BattlePass_Task_Des_100001103",
  BattlePassTaskId = 100002103,
  BattlePassType = "Weekly",
  JumpUIId = 19,
  QuestReward = r0_0.RT_10,
  Target = 10,
  TargetId = r0_0.RT_12,
}
r4_0[100002104] = {
  BattlePassId = 100002,
  BattlePassTaskDes = "BattlePass_Task_Des_100001104",
  BattlePassTaskId = 100002104,
  BattlePassType = "Weekly",
  JumpUIId = 13,
  QuestReward = r0_0.RT_13,
  Target = 1,
  TargetId = r0_0.RT_14,
}
r4_0[100002105] = {
  BattlePassId = 100002,
  BattlePassTaskDes = "BattlePass_Task_Des_100001105",
  BattlePassTaskId = 100002105,
  BattlePassType = "Weekly",
  QuestReward = r0_0.RT_10,
  Target = 1,
  TargetId = r0_0.RT_15,
}
r4_0[100002106] = {
  BattlePassId = 100002,
  BattlePassTaskDes = "BattlePass_Task_Des_100001106",
  BattlePassTaskId = 100002106,
  BattlePassType = "Weekly",
  QuestReward = r0_0.RT_13,
  Target = 10,
  TargetId = r0_0.RT_6,
}
r4_0[100002107] = {
  BattlePassId = 100002,
  BattlePassTaskDes = "BattlePass_Task_Des_100001107",
  BattlePassTaskId = 100002107,
  BattlePassType = "Weekly",
  JumpUIId = 50,
  QuestReward = r0_0.RT_10,
  Target = 3,
  TargetId = r0_0.RT_16,
}
r4_0[100002108] = {
  BattlePassId = 100002,
  BattlePassTaskDes = "BattlePass_Task_Des_100001108",
  BattlePassTaskId = 100002108,
  BattlePassType = "Weekly",
  JumpUIId = 22,
  QuestReward = r0_0.RT_13,
  Target = 1,
  TargetId = r0_0.RT_17,
}
r4_0[100002109] = {
  BattlePassId = 100002,
  BattlePassTaskDes = "BattlePass_Task_Des_100001109",
  BattlePassTaskId = 100002109,
  BattlePassType = "Weekly",
  JumpUIId = 21,
  QuestReward = r0_0.RT_18,
  Target = 6,
  TargetId = r0_0.RT_8,
}
r4_0[100002110] = {
  BattlePassId = 100002,
  BattlePassTaskDes = "BattlePass_Task_Des_100001110",
  BattlePassTaskId = 100002110,
  BattlePassType = "Weekly",
  JumpUIId = 21,
  QuestReward = r0_0.RT_18,
  Target = 12,
  TargetId = r0_0.RT_8,
}
r4_0[100002111] = {
  BattlePassId = 100002,
  BattlePassTaskDes = "BattlePass_Task_Des_100001111",
  BattlePassTaskId = 100002111,
  BattlePassType = "Weekly",
  JumpUIId = 21,
  QuestReward = r0_0.RT_18,
  Target = 18,
  TargetId = r0_0.RT_8,
}
r4_0[100002112] = {
  BattlePassId = 100002,
  BattlePassTaskDes = "BattlePass_Task_Des_100001112",
  BattlePassTaskId = 100002112,
  BattlePassType = "Weekly",
  JumpUIId = 21,
  QuestReward = r0_0.RT_18,
  Target = 24,
  TargetId = r0_0.RT_8,
}
r4_0[100002201] = {
  BattlePassId = 100002,
  BattlePassTaskDes = "BattlePass_Task_Des_100001201",
  BattlePassTaskId = 100002201,
  BattlePassType = "Version",
  JumpUIId = 14,
  QuestReward = r0_0.RT_19,
  Target = 1,
  TargetId = r0_0.RT_20,
}
r4_0[100002202] = {
  BattlePassId = 100002,
  BattlePassTaskDes = "BattlePass_Task_Des_100001202",
  BattlePassTaskId = 100002202,
  BattlePassType = "Version",
  JumpUIId = 5,
  QuestReward = r0_0.RT_21,
  Target = 40,
  TargetId = r0_0.RT_22,
}
r4_0[100002206] = {
  BattlePassId = 100002,
  BattlePassTaskDes = "BattlePass_Task_Des_100001206",
  BattlePassTaskId = 100002206,
  BattlePassType = "Version",
  QuestReward = r0_0.RT_19,
  Target = 8,
  TargetId = r0_0.RT_2,
}
r4_0[100002207] = {
  BattlePassId = 100002,
  BattlePassTaskDes = "BattlePass_Task_Des_100001207",
  BattlePassTaskId = 100002207,
  BattlePassType = "Version",
  QuestReward = r0_0.RT_19,
  Target = 10,
  TargetId = {
    2200301
  },
  TaskUnlockTime = 1765159200,
}
r4_0[100002208] = {
  BattlePassId = 100002,
  BattlePassTaskDes = "BattlePass_Task_Des_100001209",
  BattlePassTaskId = 100002208,
  BattlePassType = "Version",
  QuestReward = r0_0.RT_19,
  Target = 1,
  TargetId = {
    2200501
  },
  TaskUnlockTime = 1764036000,
}
r4_0[100003001] = {
  BattlePassId = 100003,
  BattlePassTaskDes = "BattlePass_Task_Des_100001001",
  BattlePassTaskId = 100003001,
  BattlePassType = "Daily",
  QuestReward = r0_0.RT_1,
  Target = 1,
  TargetId = r0_0.RT_2,
}
r4_0[100003002] = {
  BattlePassId = 100003,
  BattlePassTaskDes = "BattlePass_Task_Des_100003002",
  BattlePassTaskId = 100003002,
  BattlePassType = "Daily",
  JumpUIId = 19,
  QuestReward = r0_0.RT_24,
  Target = 10,
  TargetId = r0_0.RT_12,
}
r4_0[100003003] = {
  BattlePassId = 100003,
  BattlePassTaskDes = "BattlePass_Task_Des_100001003",
  BattlePassTaskId = 100003003,
  BattlePassType = "Daily",
  JumpUIId = 31,
  QuestReward = r0_0.RT_3,
  Target = 200,
  TargetId = r0_0.RT_4,
}
r4_0[100003004] = {
  BattlePassId = 100003,
  BattlePassTaskDes = "BattlePass_Task_Des_100001004",
  BattlePassTaskId = 100003004,
  BattlePassType = "Daily",
  JumpUIId = 20,
  QuestReward = r0_0.RT_3,
  Target = 3,
  TargetId = r0_0.RT_5,
}
r4_0[100003005] = {
  BattlePassId = 100003,
  BattlePassTaskDes = "BattlePass_Task_Des_100001005",
  BattlePassTaskId = 100003005,
  BattlePassType = "Daily",
  QuestReward = r0_0.RT_3,
  Target = 1,
  TargetId = r0_0.RT_6,
}
r4_0[100003006] = {
  BattlePassId = 100003,
  BattlePassTaskDes = "BattlePass_Task_Des_100001006",
  BattlePassTaskId = 100003006,
  BattlePassType = "Daily",
  JumpUIId = 21,
  QuestReward = r0_0.RT_7,
  Target = 1,
  TargetId = r0_0.RT_8,
}
r4_0[100003101] = {
  BattlePassId = 100003,
  BattlePassTaskDes = "BattlePass_Task_Des_100001101",
  BattlePassTaskId = 100003101,
  BattlePassType = "Weekly",
  JumpUIId = 20,
  QuestReward = r0_0.RT_9,
  Target = 30,
  TargetId = r0_0.RT_5,
}
r4_0[100003102] = {
  BattlePassId = 100003,
  BattlePassTaskDes = "BattlePass_Task_Des_100001102",
  BattlePassTaskId = 100003102,
  BattlePassType = "Weekly",
  QuestReward = r0_0.RT_10,
  Target = 300000,
  TargetId = r0_0.RT_11,
}
r4_0[100003103] = {
  BattlePassId = 100003,
  BattlePassTaskDes = "BattlePass_Task_Des_100001103",
  BattlePassTaskId = 100003103,
  BattlePassType = "Weekly",
  JumpUIId = 19,
  QuestReward = r0_0.RT_10,
  Target = 10,
  TargetId = r0_0.RT_12,
}
r4_0[100003104] = {
  BattlePassId = 100003,
  BattlePassTaskDes = "BattlePass_Task_Des_100003104",
  BattlePassTaskId = 100003104,
  BattlePassType = "Weekly",
  JumpUIId = 19,
  QuestReward = r0_0.RT_19,
  Target = 50,
  TargetId = r0_0.RT_12,
}
r4_0[100003105] = {
  BattlePassId = 100003,
  BattlePassTaskDes = "BattlePass_Task_Des_100001104",
  BattlePassTaskId = 100003105,
  BattlePassType = "Weekly",
  JumpUIId = 13,
  QuestReward = r0_0.RT_13,
  Target = 1,
  TargetId = r0_0.RT_14,
}
r4_0[100003106] = {
  BattlePassId = 100003,
  BattlePassTaskDes = "BattlePass_Task_Des_100001106",
  BattlePassTaskId = 100003106,
  BattlePassType = "Weekly",
  QuestReward = r0_0.RT_13,
  Target = 10,
  TargetId = r0_0.RT_6,
}
r4_0[100003107] = {
  BattlePassId = 100003,
  BattlePassTaskDes = "BattlePass_Task_Des_100001108",
  BattlePassTaskId = 100003107,
  BattlePassType = "Weekly",
  JumpUIId = 22,
  QuestReward = r0_0.RT_13,
  Target = 1,
  TargetId = r0_0.RT_17,
}
r4_0[100003108] = {
  BattlePassId = 100003,
  BattlePassTaskDes = "BattlePass_Task_Des_100001109",
  BattlePassTaskId = 100003108,
  BattlePassType = "Weekly",
  JumpUIId = 21,
  QuestReward = r0_0.RT_18,
  Target = 6,
  TargetId = r0_0.RT_8,
}
r4_0[100003109] = {
  BattlePassId = 100003,
  BattlePassTaskDes = "BattlePass_Task_Des_100001110",
  BattlePassTaskId = 100003109,
  BattlePassType = "Weekly",
  JumpUIId = 21,
  QuestReward = r0_0.RT_18,
  Target = 12,
  TargetId = r0_0.RT_8,
}
r4_0[100003110] = {
  BattlePassId = 100003,
  BattlePassTaskDes = "BattlePass_Task_Des_100001111",
  BattlePassTaskId = 100003110,
  BattlePassType = "Weekly",
  JumpUIId = 21,
  QuestReward = r0_0.RT_18,
  Target = 18,
  TargetId = r0_0.RT_8,
}
r4_0[100003111] = {
  BattlePassId = 100003,
  BattlePassTaskDes = "BattlePass_Task_Des_100003113",
  BattlePassTaskId = 100003111,
  BattlePassType = "Weekly",
  JumpUIId = 70,
  QuestReward = r0_0.RT_9,
  Target = 10,
  TargetId = r0_0.RT_25,
}
r4_0[100003112] = {
  BattlePassId = 100003,
  BattlePassTaskDes = "BattlePass_Task_Des_100003114",
  BattlePassTaskId = 100003112,
  BattlePassType = "Weekly",
  JumpUIId = 70,
  QuestReward = r0_0.RT_9,
  Target = 30,
  TargetId = r0_0.RT_25,
}
r4_0[100003113] = {
  BattlePassId = 100003,
  BattlePassTaskDes = "BattlePass_Task_Des_100003115",
  BattlePassTaskId = 100003113,
  BattlePassType = "Weekly",
  JumpUIId = 70,
  QuestReward = r0_0.RT_9,
  Target = 60,
  TargetId = r0_0.RT_25,
}
r4_0[100003201] = {
  BattlePassId = 100003,
  BattlePassTaskDes = "BattlePass_Task_Des_100001201",
  BattlePassTaskId = 100003201,
  BattlePassType = "Version",
  JumpUIId = 14,
  QuestReward = r0_0.RT_19,
  Target = 1,
  TargetId = r0_0.RT_20,
}
r4_0[100003202] = {
  BattlePassId = 100003,
  BattlePassTaskDes = "BattlePass_Task_Des_100003202",
  BattlePassTaskId = 100003202,
  BattlePassType = "Version",
  JumpUIId = 14,
  QuestReward = r0_0.RT_19,
  Target = 1,
  TargetId = r0_0.RT_26,
}
r4_0[100003203] = {
  BattlePassId = 100003,
  BattlePassTaskDes = "BattlePass_Task_Des_100001202",
  BattlePassTaskId = 100003203,
  BattlePassType = "Version",
  JumpUIId = 5,
  QuestReward = r0_0.RT_21,
  Target = 40,
  TargetId = r0_0.RT_22,
}
r4_0[100003205] = {
  BattlePassId = 100003,
  BattlePassTaskDes = "BattlePass_Task_Des_100001206",
  BattlePassTaskId = 100003205,
  BattlePassType = "Version",
  QuestReward = r0_0.RT_19,
  Target = 8,
  TargetId = r0_0.RT_2,
}
r4_0[100003207] = {
  BattlePassId = 100003,
  BattlePassTaskDes = "BattlePass_Task_Des_100003207",
  BattlePassTaskId = 100003207,
  BattlePassType = "Version",
  QuestReward = r0_0.RT_21,
  Target = 1,
  TargetId = {
    10200106
  },
}
r4_0[100004001] = {
  BattlePassId = 100004,
  BattlePassTaskDes = "BattlePass_Task_Des_100004001",
  BattlePassTaskId = 100004001,
  BattlePassType = "Daily",
  QuestReward = r0_0.RT_24,
  Target = 1,
  TargetId = r0_0.RT_2,
}
r4_0[100004002] = {
  BattlePassId = 100004,
  BattlePassTaskDes = "BattlePass_Task_Des_100003002",
  BattlePassTaskId = 100004002,
  BattlePassType = "Daily",
  JumpUIId = 19,
  QuestReward = r0_0.RT_24,
  Target = 10,
  TargetId = r0_0.RT_12,
}
r4_0[100004003] = {
  BattlePassId = 100004,
  BattlePassTaskDes = "BattlePass_Task_Des_100001003",
  BattlePassTaskId = 100004003,
  BattlePassType = "Daily",
  JumpUIId = 31,
  QuestReward = r0_0.RT_3,
  Target = 200,
  TargetId = r0_0.RT_4,
}
r4_0[100004004] = {
  BattlePassId = 100004,
  BattlePassTaskDes = "BattlePass_Task_Des_100001004",
  BattlePassTaskId = 100004004,
  BattlePassType = "Daily",
  JumpUIId = 20,
  QuestReward = r0_0.RT_3,
  Target = 3,
  TargetId = r0_0.RT_5,
}
r4_0[100004005] = {
  BattlePassId = 100004,
  BattlePassTaskDes = "BattlePass_Task_Des_100001005",
  BattlePassTaskId = 100004005,
  BattlePassType = "Daily",
  QuestReward = r0_0.RT_3,
  Target = 1,
  TargetId = r0_0.RT_6,
}
r4_0[100004006] = {
  BattlePassId = 100004,
  BattlePassTaskDes = "BattlePass_Task_Des_100001006",
  BattlePassTaskId = 100004006,
  BattlePassType = "Daily",
  JumpUIId = 21,
  QuestReward = r0_0.RT_7,
  Target = 1,
  TargetId = r0_0.RT_8,
}
r4_0[100004100] = {
  BattlePassId = 100004,
  BattlePassTaskDes = "BattlePass_Task_Des_100004100",
  BattlePassTaskId = 100004100,
  BattlePassType = "Weekly",
  QuestReward = r0_0.RT_21,
  Target = 5,
  TargetId = r0_0.RT_2,
}
r4_0[100004101] = {
  BattlePassId = 100004,
  BattlePassTaskDes = "BattlePass_Task_Des_100001101",
  BattlePassTaskId = 100004101,
  BattlePassType = "Weekly",
  JumpUIId = 20,
  QuestReward = r0_0.RT_9,
  Target = 30,
  TargetId = r0_0.RT_5,
}
r4_0[100004102] = {
  BattlePassId = 100004,
  BattlePassTaskDes = "BattlePass_Task_Des_100001102",
  BattlePassTaskId = 100004102,
  BattlePassType = "Weekly",
  QuestReward = r0_0.RT_10,
  Target = 300000,
  TargetId = r0_0.RT_11,
}
r4_0[100004103] = {
  BattlePassId = 100004,
  BattlePassTaskDes = "BattlePass_Task_Des_100001103",
  BattlePassTaskId = 100004103,
  BattlePassType = "Weekly",
  JumpUIId = 19,
  QuestReward = r0_0.RT_10,
  Target = 10,
  TargetId = r0_0.RT_12,
}
r4_0[100004104] = {
  BattlePassId = 100004,
  BattlePassTaskDes = "BattlePass_Task_Des_100003104",
  BattlePassTaskId = 100004104,
  BattlePassType = "Weekly",
  JumpUIId = 19,
  QuestReward = r0_0.RT_19,
  Target = 50,
  TargetId = r0_0.RT_12,
}
r4_0[100004105] = {
  BattlePassId = 100004,
  BattlePassTaskDes = "BattlePass_Task_Des_100001104",
  BattlePassTaskId = 100004105,
  BattlePassType = "Weekly",
  JumpUIId = 13,
  QuestReward = r0_0.RT_13,
  Target = 1,
  TargetId = r0_0.RT_14,
}
r4_0[100004106] = {
  BattlePassId = 100004,
  BattlePassTaskDes = "BattlePass_Task_Des_100001106",
  BattlePassTaskId = 100004106,
  BattlePassType = "Weekly",
  QuestReward = r0_0.RT_13,
  Target = 10,
  TargetId = r0_0.RT_6,
}
r4_0[100004107] = {
  BattlePassId = 100004,
  BattlePassTaskDes = "BattlePass_Task_Des_100001108",
  BattlePassTaskId = 100004107,
  BattlePassType = "Weekly",
  JumpUIId = 22,
  QuestReward = r0_0.RT_13,
  Target = 1,
  TargetId = r0_0.RT_17,
}
r4_0[100004108] = {
  BattlePassId = 100004,
  BattlePassTaskDes = "BattlePass_Task_Des_100001109",
  BattlePassTaskId = 100004108,
  BattlePassType = "Weekly",
  JumpUIId = 21,
  QuestReward = r0_0.RT_18,
  Target = 6,
  TargetId = r0_0.RT_8,
}
r4_0[100004109] = {
  BattlePassId = 100004,
  BattlePassTaskDes = "BattlePass_Task_Des_100001110",
  BattlePassTaskId = 100004109,
  BattlePassType = "Weekly",
  JumpUIId = 21,
  QuestReward = r0_0.RT_18,
  Target = 12,
  TargetId = r0_0.RT_8,
}
r4_0[100004110] = {
  BattlePassId = 100004,
  BattlePassTaskDes = "BattlePass_Task_Des_100001111",
  BattlePassTaskId = 100004110,
  BattlePassType = "Weekly",
  JumpUIId = 21,
  QuestReward = r0_0.RT_18,
  Target = 18,
  TargetId = r0_0.RT_8,
}
r4_0[100004111] = {
  BattlePassId = 100004,
  BattlePassTaskDes = "BattlePass_Task_Des_100003113",
  BattlePassTaskId = 100004111,
  BattlePassType = "Weekly",
  JumpUIId = 70,
  QuestReward = r0_0.RT_9,
  Target = 10,
  TargetId = r0_0.RT_25,
}
r4_0[100004112] = {
  BattlePassId = 100004,
  BattlePassTaskDes = "BattlePass_Task_Des_100003114",
  BattlePassTaskId = 100004112,
  BattlePassType = "Weekly",
  JumpUIId = 70,
  QuestReward = r0_0.RT_9,
  Target = 30,
  TargetId = r0_0.RT_25,
}
r4_0[100004113] = {
  BattlePassId = 100004,
  BattlePassTaskDes = "BattlePass_Task_Des_100003115",
  BattlePassTaskId = 100004113,
  BattlePassType = "Weekly",
  JumpUIId = 70,
  QuestReward = r0_0.RT_9,
  Target = 60,
  TargetId = r0_0.RT_25,
}
r4_0[100004201] = {
  BattlePassId = 100004,
  BattlePassTaskDes = "BattlePass_Task_Des_100001201",
  BattlePassTaskId = 100004201,
  BattlePassType = "Version",
  JumpUIId = 14,
  QuestReward = r0_0.RT_19,
  Target = 1,
  TargetId = r0_0.RT_20,
}
r4_0[100004202] = {
  BattlePassId = 100004,
  BattlePassTaskDes = "BattlePass_Task_Des_100003202",
  BattlePassTaskId = 100004202,
  BattlePassType = "Version",
  JumpUIId = 14,
  QuestReward = r0_0.RT_19,
  Target = 1,
  TargetId = r0_0.RT_26,
}
r4_0[100004203] = {
  BattlePassId = 100004,
  BattlePassTaskDes = "BattlePass_Task_Des_100004203",
  BattlePassTaskId = 100004203,
  BattlePassType = "Version",
  JumpUIId = 14,
  QuestReward = r0_0.RT_21,
  Target = 1,
  TargetId = {
    1500111
  },
}
r4_0[100004204] = {
  BattlePassId = 100004,
  BattlePassTaskDes = "BattlePass_Task_Des_100001206",
  BattlePassTaskId = 100004204,
  BattlePassType = "Version",
  QuestReward = r0_0.RT_19,
  Target = 8,
  TargetId = r0_0.RT_2,
}
r4_0[100004205] = {
  BattlePassId = 100004,
  BattlePassTaskDes = "BattlePass_Task_Des_100004205",
  BattlePassTaskId = 100004205,
  BattlePassType = "Version",
  JumpUIId = 74,
  QuestReward = r0_0.RT_21,
  Target = 1,
  TargetId = {
    100004205
  },
}
return r2_0(r3_0, r4_0)
