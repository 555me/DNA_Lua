-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\PlayerLvEvent.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end
local r3_0 = {}
r3_0[106001] = {
  [5] = {
    EventId = 106001,
    PlayerLvReward = 10600101,
    RequiredPlayerLv = 5,
  },
  [15] = {
    EventId = 106001,
    PlayerLvReward = 10600102,
    RequiredPlayerLv = 15,
  },
  [25] = {
    EventId = 106001,
    PlayerLvReward = 10600103,
    RequiredPlayerLv = 25,
  },
  [35] = {
    EventId = 106001,
    PlayerLvReward = 10600104,
    RequiredPlayerLv = 35,
  },
  [45] = {
    EventId = 106001,
    PlayerLvReward = 10600105,
    RequiredPlayerLv = 45,
  },
}
return r0_0("PlayerLvEvent", r3_0)
