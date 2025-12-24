-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\Survival.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    0.8,
    0.2
  },
  RT_2 = {
    201
  },
  RT_3 = {
    202
  },
  RT_4 = {
    203
  },
  RT_5 = {
    204
  },
  RT_6 = {
    205
  },
  RT_7 = {
    206
  },
}
r0_0.RT_8 = {
  [1] = r0_0.RT_2,
  [2] = r0_0.RT_3,
  [3] = r0_0.RT_4,
  [4] = r0_0.RT_5,
  [5] = r0_0.RT_6,
  [6] = r0_0.RT_7,
}
r0_0.RT_9 = {
  1,
  0.2
}
return ((DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [37, 37] id: 1
  return r1_1
end)("Survival", {
  [20001] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = r0_0.RT_1,
    DungeonId = 20001,
    MonsterSpawnId = r0_0.RT_8,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = r0_0.RT_9,
    WaveTime = 90,
  },
  [90400] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = r0_0.RT_1,
    DungeonId = 90400,
    MonsterSpawnId = r0_0.RT_8,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = r0_0.RT_9,
    WaveTime = 90,
  },
})
