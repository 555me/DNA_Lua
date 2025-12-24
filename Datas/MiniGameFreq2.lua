-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\MiniGameFreq2.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    2,
    0
  },
  RT_2 = {
    1,
    0
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [11, 11] id: 1
  return r1_1
end
local r3_0 = "MiniGameFreq2"
local r4_0 = {}
r4_0[1] = {
  BindingRealtion = r0_0.RT_1,
  Comb = {
    8,
    10,
    11,
    5,
    5,
    5,
    2
  },
  Destination = {
    6,
    7,
    8,
    6,
    7,
    8,
    6
  },
  Id = 1,
  MoveRange = 1,
  Num = 7,
}
r4_0[2] = {
  BindingRealtion = r0_0.RT_1,
  Comb = {
    8,
    4,
    4,
    10,
    4,
    4,
    8
  },
  Destination = {
    6,
    6,
    6,
    6,
    6,
    6,
    6
  },
  Id = 2,
  MoveRange = 2,
  Num = 7,
}
r4_0[3] = {
  BindingRealtion = r0_0.RT_2,
  Comb = {
    9,
    11,
    9,
    5,
    1,
    5,
    9
  },
  Destination = {
    3,
    1,
    3,
    7,
    11,
    7,
    3
  },
  Id = 3,
  MoveRange = 2,
  Num = 7,
}
r4_0[4] = {
  BindingRealtion = r0_0.RT_2,
  Comb = {
    4,
    7,
    6,
    9,
    10
  },
  Destination = {
    2,
    3,
    4,
    5,
    6
  },
  Id = 4,
  MoveRange = 2,
  Num = 5,
}
return r2_0(r3_0, r4_0)
