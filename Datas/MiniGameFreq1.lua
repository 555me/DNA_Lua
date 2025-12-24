-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\MiniGameFreq1.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    1,
    0
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [7, 7] id: 1
  return r1_1
end
local r3_0 = "MiniGameFreq1"
local r4_0 = {}
r4_0[1] = {
  BindingRealtion = r0_0.RT_1,
  Comb = {
    3,
    5,
    7,
    10,
    7,
    5,
    3
  },
  Destination = {
    7,
    6,
    4,
    1,
    4,
    6,
    7
  },
  Id = 1,
  MoveRange = 1,
  Num = 7,
}
r4_0[2] = {
  BindingRealtion = r0_0.RT_1,
  Comb = {
    2,
    6,
    8,
    9,
    8,
    6,
    2
  },
  Destination = {
    6,
    7,
    6,
    5,
    6,
    7,
    6
  },
  Id = 2,
  MoveRange = 1,
  Num = 7,
}
r4_0[3] = {
  BindingRealtion = r0_0.RT_1,
  Comb = {
    8,
    8,
    4,
    8,
    8
  },
  Destination = {
    4,
    4,
    8,
    4,
    4
  },
  Id = 3,
  MoveRange = 1,
  Num = 5,
}
r4_0[4] = {
  BindingRealtion = r0_0.RT_1,
  Comb = {
    11,
    10,
    9,
    10,
    11
  },
  Destination = {
    5,
    6,
    7,
    6,
    5
  },
  Id = 4,
  MoveRange = 1,
  Num = 5,
}
return r2_0(r3_0, r4_0)
