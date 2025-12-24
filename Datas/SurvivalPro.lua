-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\SurvivalPro.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    100506
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [6, 6] id: 1
  return r1_1
end
local r3_0 = "SurvivalPro"
local r4_0 = {}
local r5_0 = 91401
local r6_0 = {
  BuffDescribe = {
    [5000016] = "100%",
  },
  ButcherMonsterId = 8501002,
  ButcherMonsterSpawnMinWave = 2,
  ButcherMonsterSpawnProbability = {
    0,
    0
  },
  DungeonId = 91401,
  LoopRule = {
    3,
    4
  },
  MonsterFirstSpawnId = r0_0.RT_1,
  MonsterSpawnDelay = 20,
}
r6_0.MonsterSpawnId = {
  [1] = {
    100502
  },
  [2] = {
    100503
  },
  [3] = {
    100504
  },
  [4] = {
    100505
  },
  [5] = r0_0.RT_1,
}
r6_0.RoundTime = 180
r6_0.SpLoopRule = {
  1
}
local r7_0 = {}
r7_0[1] = {
  SpMonsterSpawnId = {
    512
  },
  SpMonsterSpawnTime = 80,
}
r6_0.SpMonster = r7_0
r4_0[r5_0] = r6_0
return r2_0(r3_0, r4_0)
