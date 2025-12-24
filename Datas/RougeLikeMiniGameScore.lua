-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\RougeLikeMiniGameScore.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end
local r3_0 = {}
r3_0[1] = {
  MiniGameScore = {
    [1] = 0,
    [2] = 1600,
    [3] = 3200,
  },
  ScoreId = 1,
}
r3_0[2] = {
  MiniGameScore = {
    [1] = 0,
    [2] = 100,
  },
  ScoreId = 2,
}
return r0_0("RougeLikeMiniGameScore", r3_0)
