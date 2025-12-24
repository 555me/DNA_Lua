-- filename: @C:/Pack/Branch/geili11\Content/Script/RegionPreloadData.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {}
local r1_0 = {}
r1_0.RT_1 = {
  MonsterSpawn = {
    [9804001] = 5,
    [9805001] = 5,
    [9806001] = 5,
    [9806002] = 5,
    [9807001] = 5,
    [9808001] = 5,
    [9809001] = 5,
    [9809002] = 5,
  },
}
r0_0.Dongguo = r1_0
r1_0 = {}
r1_0.RT_1 = {
  MonsterSpawn = {
    [6001005] = 10,
    [6002001] = 8,
    [6003001] = 8,
    [6004001] = 2,
    [7001001] = 10,
    [7002001] = 12,
    [7003001] = 5,
    [7004001] = 5,
  },
}
r0_0.Prologue_optimization = r1_0
return {
  Dongguo = r0_0.Dongguo.RT_1,
  Prologue_optimization = r0_0.Prologue_optimization.RT_1,
}
