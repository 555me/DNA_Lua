-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\Party.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    0,
    180,
    360
  },
  RT_2 = {
    500,
    1000,
    2000,
    3000
  },
  RT_3 = {
    7101,
    7102,
    7103
  },
}
return ((DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [19, 19] id: 1
  return r1_1
end)("Party", {
  [70000] = {
    DungeonId = 70000,
    RatingRange = r0_0.RT_1,
    RespawnRule = 0,
    RewardCoin = r0_0.RT_2,
    RewardId = r0_0.RT_3,
  },
  [70101] = {
    DungeonId = 70101,
    RatingRange = r0_0.RT_1,
    RespawnRule = 0,
    RewardCoin = r0_0.RT_2,
    RewardId = r0_0.RT_3,
    SucRule = "Parkour",
  },
  [70102] = {
    DungeonId = 70102,
    RatingRange = r0_0.RT_1,
    RespawnRule = 0,
    RewardCoin = r0_0.RT_2,
    RewardId = r0_0.RT_3,
    SucRule = "Parkour",
  },
  [70201] = {
    DungeonId = 70201,
    RespawnRule = 1,
    RewardCoin = r0_0.RT_2,
    RewardId = r0_0.RT_3,
  },
  [70202] = {
    DungeonId = 70202,
    RespawnRule = 0,
    RewardCoin = r0_0.RT_2,
    RewardId = r0_0.RT_3,
  },
  [70301] = {
    DungeonId = 70301,
    RespawnRule = 0,
  },
})
