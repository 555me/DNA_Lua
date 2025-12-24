-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\MiniGameFreq3.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    2,
    1
  },
  RT_2 = {
    2,
    0
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [11, 11] id: 1
  return r1_1
end
local r3_0 = "MiniGameFreq3"
local r4_0 = {}
r4_0[1] = {
  BindingRealtion = r0_0.RT_1,
  Comb = {
    10,
    9,
    10,
    6,
    1,
    10,
    3
  },
  Destination = {
    2,
    7,
    7,
    5,
    9,
    11,
    6
  },
  Id = 1,
  MoveRange = 1,
  Num = 7,
}
r4_0[2] = {
  BindingRealtion = r0_0.RT_1,
  Comb = {
    6,
    6,
    6,
    6,
    6,
    6,
    6
  },
  Destination = {
    3,
    4,
    5,
    4,
    5,
    6,
    3
  },
  Id = 2,
  MoveRange = 1,
  Num = 7,
}
r4_0[3] = {
  BindingRealtion = r0_0.RT_2,
  Comb = {
    7,
    6,
    5,
    4,
    6,
    4,
    1
  },
  Destination = {
    6,
    7,
    9,
    11,
    9,
    7,
    6
  },
  Id = 3,
  MoveRange = 1,
  Num = 7,
}
r4_0[4] = {
  BindingRealtion = r0_0.RT_2,
  Comb = {
    5,
    2,
    3,
    9,
    7,
    7,
    9
  },
  Destination = {
    8,
    9,
    10,
    11,
    10,
    8,
    6
  },
  Id = 4,
  MoveRange = 1,
  Num = 7,
}
return r2_0(r3_0, r4_0)
