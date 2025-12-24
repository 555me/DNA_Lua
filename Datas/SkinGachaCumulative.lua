-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\SkinGachaCumulative.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    [1] = 7601,
    [2] = 7602,
    [3] = 7603,
    [4] = 7604,
    [5] = 7605,
  },
  RT_2 = {
    [1] = 20,
    [2] = 40,
    [3] = 60,
    [4] = 80,
    [5] = 100,
  },
}
return ((DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [17, 17] id: 1
  return r1_1
end)("SkinGachaCumulative", {
  [9002] = {
    GachaId = 9002,
    RewardId = r0_0.RT_1,
    RewardTarget = r0_0.RT_2,
  },
  [9003] = {
    GachaId = 9003,
    RewardId = r0_0.RT_1,
    RewardTarget = r0_0.RT_2,
  },
})
