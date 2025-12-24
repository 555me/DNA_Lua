-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\RaidCalculation.lua
-- version: lua54
-- line: [0, 0] id: 0
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end
local r2_0 = "RaidCalculation"
local r3_0 = {}
r3_0[1] = {
  FomulaId = 1,
  RaidTimeRate = {
    0.025,
    0.05,
    0.075
  },
  RaidTimeZone = {
    10,
    20,
    60
  },
}
r3_0[2] = {
  FomulaId = 2,
  RaidTimeRate = {
    0.01,
    0.018,
    0.025
  },
  RaidTimeZone = {
    25,
    80,
    180
  },
}
return r1_0(r2_0, r3_0)
