-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\PreRaidRank.lua
-- version: lua54
-- line: [0, 0] id: 0
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end
local r2_0 = "PreRaidRank"
local r3_0 = {}
r3_0[1] = {
  IsOnline = {
    true,
    true,
    false,
    false,
    false
  },
  PreRaidRank = 1,
  RankName = {
    "SSS",
    "SS",
    "S",
    "A",
    "B"
  },
  RankPercent = {
    5,
    20,
    45,
    70,
    100
  },
  RankReward = {
    300316,
    300317,
    300318,
    300319,
    300320
  },
}
return r1_0(r2_0, r3_0)
