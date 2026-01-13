-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\RaidSeason.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end
local r3_0 = {}
r3_0[1001] = {
  EventId = 111001,
  PreRaidRank = 1,
  PreRaidTime = 62,
  RaidPointToRewrad = {
    [1000] = 300315,
  },
  RaidPointToRewradMaxTime = 750,
  RaidRankCount = 1000,
  RaidSeason = 1001,
  RaidTime = 173,
  Shop = "RaidShopSeason01",
}
return r0_0("RaidSeason", r3_0)
