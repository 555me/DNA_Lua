-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\FeinaEvent.lua
-- version: lua54
-- line: [0, 0] id: 0
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end
local r2_0 = "FeinaEvent"
local r3_0 = {}
r3_0[1] = {
  Condition = 8013,
  DungeonId = {
    60001
  },
  DungeonName = "FeinaEvent_DungeonName_1",
  Id = 1,
  RewardNum = 3,
}
r3_0[2] = {
  Condition = 8014,
  DungeonId = {
    60002
  },
  DungeonName = "FeinaEvent_DungeonName_2",
  Id = 2,
  RewardNum = 3,
}
r3_0[3] = {
  Condition = 8015,
  DungeonId = {
    60003,
    60004
  },
  DungeonName = "FeinaEvent_DungeonName_3",
  Id = 3,
  RewardNum = 6,
}
r3_0[4] = {
  Condition = 8016,
  DungeonId = {
    60005,
    60006
  },
  DungeonName = "FeinaEvent_DungeonName_4",
  Id = 4,
  RewardNum = 6,
}
return r1_0(r2_0, r3_0)
