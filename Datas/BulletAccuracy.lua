-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\BulletAccuracy.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    0,
    25
  },
  RT_2 = {
    25,
    50
  },
  RT_3 = {
    50,
    75
  },
  RT_4 = {
    75,
    100
  },
  RT_5 = {
    100,
    125
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [23, 23] id: 1
  return r1_1
end
local r3_0 = "BulletAccuracy"
local r4_0 = {}
local r5_0 = {}
local r6_0 = {
  [1] = {
    Accuracy = 20,
    Range = r0_0.RT_1,
  },
  [2] = {
    Accuracy = 0,
    Range = r0_0.RT_2,
  },
  [3] = {
    Accuracy = 20,
    Range = r0_0.RT_3,
  },
  [4] = {
    Accuracy = 20,
    Range = r0_0.RT_4,
  },
  [5] = {
    Accuracy = 20,
    Range = r0_0.RT_5,
  },
}
r6_0[6] = {
  Accuracy = 20,
  Range = {
    125,
    150
  },
}
r5_0.Accuracys = r6_0
r5_0.BulletAccId = 2
r4_0[2] = r5_0
r5_0 = {}
r6_0 = {}
r6_0[1] = {
  Accuracy = 100,
  Range = {
    0,
    1000
  },
}
r5_0.Accuracys = r6_0
r5_0.BulletAccId = 3
r4_0[3] = r5_0
r5_0 = {}
r5_0.Accuracys = {
  [1] = {
    Accuracy = 38,
    Range = r0_0.RT_1,
  },
  [2] = {
    Accuracy = 30,
    Range = r0_0.RT_2,
  },
  [3] = {
    Accuracy = 18,
    Range = r0_0.RT_3,
  },
  [4] = {
    Accuracy = 9,
    Range = r0_0.RT_4,
  },
  [5] = {
    Accuracy = 5,
    Range = r0_0.RT_5,
  },
}
r5_0.BulletAccId = 101
r4_0[101] = r5_0
r5_0 = {}
r6_0 = {}
r6_0[1] = {
  Accuracy = 38,
  Range = {
    0,
    100
  },
}
r6_0[2] = {
  Accuracy = 30,
  Range = {
    100,
    200
  },
}
r6_0[3] = {
  Accuracy = 18,
  Range = {
    200,
    300
  },
}
r6_0[4] = {
  Accuracy = 9,
  Range = {
    300,
    400
  },
}
r6_0[5] = {
  Accuracy = 5,
  Range = {
    400,
    500
  },
}
r5_0.Accuracys = r6_0
r5_0.BulletAccId = 102
r4_0[102] = r5_0
r5_0 = {}
r6_0 = {}
r6_0[1] = {
  Accuracy = 70,
  Range = {
    0,
    376
  },
}
r6_0[2] = {
  Accuracy = 30,
  Range = {
    376,
    752
  },
}
r5_0.Accuracys = r6_0
r5_0.BulletAccId = 103
r4_0[103] = r5_0
r5_0 = {}
r6_0 = {}
r6_0[1] = {
  Accuracy = 70,
  Range = {
    0,
    282
  },
}
r6_0[2] = {
  Accuracy = 30,
  Range = {
    282,
    564
  },
}
r5_0.Accuracys = r6_0
r5_0.BulletAccId = 104
r4_0[104] = r5_0
r5_0 = {}
r6_0 = {}
r6_0[1] = {
  Accuracy = 70,
  Range = {
    0,
    188
  },
}
r6_0[2] = {
  Accuracy = 30,
  Range = {
    188,
    376
  },
}
r5_0.Accuracys = r6_0
r5_0.BulletAccId = 105
r4_0[105] = r5_0
r5_0 = 600201
r6_0 = {}
local r7_0 = {}
r7_0[1] = {
  Accuracy = 38,
  Range = {
    0,
    30
  },
}
r7_0[2] = {
  Accuracy = 30,
  Range = {
    30,
    60
  },
}
r7_0[3] = {
  Accuracy = 18,
  Range = {
    60,
    100
  },
}
r7_0[4] = {
  Accuracy = 9,
  Range = {
    100,
    140
  },
}
r7_0[5] = {
  Accuracy = 3,
  Range = {
    140,
    200
  },
}
r7_0[6] = {
  Accuracy = 2,
  Range = {
    200,
    250
  },
}
r6_0.Accuracys = r7_0
r6_0.BulletAccId = 600201
r4_0[r5_0] = r6_0
return r2_0(r3_0, r4_0)
