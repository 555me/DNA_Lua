-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\PaotaiMiniGame.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    [1] = "PaotaiMiniGame_DungeonTask_1",
    [2] = "PaotaiMiniGame_DungeonTask_1",
    [3] = "PaotaiMiniGame_DungeonTask_1",
  },
  RT_2 = {
    [1] = 110401,
    [2] = 110402,
    [3] = 110403,
  },
}
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [13, 13] id: 1
  return r1_1
end
local r4_0 = {}
r4_0[40101] = {
  DungeonId = 40101,
  DungeonName = "PaotaiMiniGame_DungeonName_1",
  EventId = 103007,
  Id = 1,
  LeveDes = r0_0.RT_1,
  Level = {
    [1] = 5000,
    [2] = 9000,
    [3] = 12000,
  },
  MonsterNum = 8,
  Reward = r0_0.RT_2,
  StartTime = 1768874400,
  TotalTime = 30,
}
r4_0[40102] = {
  DungeonId = 40102,
  DungeonName = "PaotaiMiniGame_DungeonName_2",
  EventId = 103007,
  Id = 2,
  LeveDes = r0_0.RT_1,
  Level = {
    [1] = 10000,
    [2] = 18000,
    [3] = 26000,
  },
  LockToast = "PaotaiGame_PropLock_1",
  MonsterNum = 20,
  PreDungeon = 40101,
  Reward = r0_0.RT_2,
  StartTime = 1768942800,
  TotalTime = 60,
}
r4_0[40103] = {
  DungeonId = 40103,
  DungeonName = "PaotaiMiniGame_DungeonName_3",
  EventId = 103007,
  Id = 3,
  LeveDes = r0_0.RT_1,
  Level = {
    [1] = 14000,
    [2] = 23000,
    [3] = 32000,
  },
  LockToast = "PaotaiGame_PropLock_2",
  MonsterNum = 42,
  PreDungeon = 40102,
  Reward = r0_0.RT_2,
  StartTime = 1769029200,
  TotalTime = 90,
}
r4_0[40104] = {
  DungeonId = 40104,
  DungeonName = "PaotaiMiniGame_DungeonName_4",
  EventId = 103007,
  Id = 4,
  LeveDes = r0_0.RT_1,
  Level = {
    [1] = 28000,
    [2] = 45000,
    [3] = 66000,
  },
  LockToast = "PaotaiGame_PropLock_3",
  MonsterNum = 51,
  PreDungeon = 40103,
  Reward = r0_0.RT_2,
  StartTime = 1769115600,
  TotalTime = 90,
}
r4_0[40105] = {
  DungeonId = 40105,
  DungeonName = "PaotaiMiniGame_DungeonName_5",
  EventId = 103007,
  Id = 5,
  LeveDes = r0_0.RT_1,
  Level = {
    [1] = 38000,
    [2] = 64000,
    [3] = 88000,
  },
  LockToast = "PaotaiGame_PropLock_4",
  MonsterNum = 46,
  PreDungeon = 40104,
  Reward = r0_0.RT_2,
  StartTime = 1769202000,
  TotalTime = 120,
}
r4_0[40106] = {
  DungeonId = 40106,
  DungeonName = "PaotaiMiniGame_DungeonName_6",
  EventId = 103007,
  Id = 6,
  LeveDes = r0_0.RT_1,
  Level = {
    [1] = 30000,
    [2] = 50000,
    [3] = 69000,
  },
  LockToast = "PaotaiGame_PropLock_5",
  MonsterNum = 53,
  PreDungeon = 40105,
  Reward = r0_0.RT_2,
  StartTime = 1769288400,
  TotalTime = 140,
}
r4_0[40107] = {
  DungeonId = 40107,
  DungeonName = "PaotaiMiniGame_DungeonName_7",
  EventId = 103007,
  Id = 7,
  LeveDes = r0_0.RT_1,
  Level = {
    [1] = 30000,
    [2] = 60000,
    [3] = 95000,
  },
  LockToast = "PaotaiGame_PropLock_6",
  MonsterNum = 49,
  PreDungeon = 40106,
  Reward = r0_0.RT_2,
  StartTime = 1769374800,
  TotalTime = 120,
}
return r1_0("PaotaiMiniGame", r4_0)
