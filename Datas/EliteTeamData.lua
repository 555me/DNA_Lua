-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\EliteTeamData.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    0,
    0
  },
}
r0_0.RT_2 = {
  OffsetXY = r0_0.RT_1,
}
r0_0.RT_3 = {
  [1] = r0_0.RT_2,
}
r0_0.RT_4 = {
  HalfHeight = 90,
  MaxLength = 200,
  MaxWidth = 100,
  Radius = 45,
  StepHeight = 50,
  WalkableFloorAngle = 60,
}
r0_0.RT_5 = {
  260,
  0
}
r0_0.RT_6 = {
  OffsetXY = r0_0.RT_5,
}
r0_0.RT_7 = {
  [1] = r0_0.RT_6,
}
r0_0.RT_8 = {
  200,
  0
}
r0_0.RT_9 = {
  OffsetXY = r0_0.RT_8,
}
r0_0.RT_10 = {
  [1] = r0_0.RT_9,
}
r0_0.RT_11 = {
  0,
  0,
  0
}
r0_0.RT_12 = {
  OffsetXY = r0_0.RT_11,
}
r0_0.RT_13 = {
  Interval = 30,
  PreFormationType = "Circle",
  Radius = 200,
  Random = 1,
}
r0_0.RT_14 = {
  0,
  300
}
r0_0.RT_15 = {
  OffsetXY = r0_0.RT_14,
}
r0_0.RT_16 = {
  0,
  -300
}
r0_0.RT_17 = {
  OffsetXY = r0_0.RT_16,
}
r0_0.RT_18 = {
  [1] = r0_0.RT_12,
}
r0_0.RT_19 = {
  0,
  -500
}
r0_0.RT_20 = {
  OffsetXY = r0_0.RT_19,
}
r0_0.RT_21 = {
  0,
  500
}
r0_0.RT_22 = {
  OffsetXY = r0_0.RT_21,
}
r0_0.RT_23 = {
  -500,
  0
}
r0_0.RT_24 = {
  OffsetXY = r0_0.RT_23,
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [93, 93] id: 1
  return r1_1
end
local r3_0 = "EliteTeamData"
local r4_0 = {}
local r5_0 = {
  EliteArgs = {
    1500,
    500,
    7,
    1
  },
  EliteId = 1,
}
local r6_0 = {}
r6_0[1] = {
  OffsetXY = {
    200,
    300
  },
}
r6_0[2] = {
  OffsetXY = {
    -200,
    300
  },
}
r6_0[3] = {
  OffsetXY = {
    400,
    150
  },
}
r6_0[4] = {
  OffsetXY = {
    -400,
    150
  },
}
r6_0[5] = {
  OffsetXY = {
    600,
    450
  },
}
r6_0[6] = {
  OffsetXY = {
    -600,
    450
  },
}
r6_0[7] = {
  OffsetXY = {
    0,
    400
  },
}
r5_0.Offsets = r6_0
r5_0.TeamType = 1
r4_0[1] = r5_0
r4_0[2] = {
  EliteId = 2,
  Offsets = r0_0.RT_3,
}
r5_0 = 10101
r6_0 = {
  EliteId = 10101,
}
local r7_0 = {}
r7_0[1] = {
  OffsetXY = {
    150,
    150
  },
}
r6_0.Offsets = r7_0
r4_0[r5_0] = r6_0
r4_0[210101] = {
  EliteId = 210101,
  LocationCheckParam = r0_0.RT_4,
  Offsets = r0_0.RT_7,
}
r4_0[230101] = {
  EliteId = 230101,
  Offsets = r0_0.RT_3,
}
r5_0 = 230102
r6_0 = {
  EliteId = 230102,
  LocationCheckParam = r0_0.RT_4,
}
r7_0 = {}
r7_0[1] = {
  OffsetXY = {
    200,
    -300
  },
}
r7_0[2] = {
  OffsetXY = {
    550,
    50
  },
}
r7_0[3] = {
  OffsetXY = {
    700,
    -300
  },
}
r7_0[4] = {
  OffsetXY = {
    1000,
    50
  },
}
r6_0.Offsets = r7_0
r4_0[r5_0] = r6_0
r5_0 = 230103
r6_0 = {
  EliteId = 230103,
  LocationCheckParam = r0_0.RT_4,
}
r7_0 = {}
r7_0[1] = {
  OffsetXY = {
    300,
    -50
  },
}
r7_0[2] = {
  OffsetXY = {
    400,
    300
  },
}
r7_0[3] = {
  OffsetXY = {
    800,
    -100
  },
}
r7_0[4] = {
  OffsetXY = {
    1150,
    300
  },
}
r6_0.Offsets = r7_0
r4_0[r5_0] = r6_0
r5_0 = 230104
r6_0 = {
  EliteId = 230104,
  LocationCheckParam = r0_0.RT_4,
}
r7_0 = {}
r7_0[1] = {
  OffsetXY = {
    150,
    350
  },
}
r7_0[2] = {
  OffsetXY = {
    450,
    -400
  },
}
r7_0[3] = {
  OffsetXY = {
    800,
    350
  },
}
r7_0[4] = {
  OffsetXY = {
    1050,
    -300
  },
}
r6_0.Offsets = r7_0
r4_0[r5_0] = r6_0
r4_0[240101] = {
  EliteId = 240101,
  LocationCheckParam = r0_0.RT_4,
  Offsets = r0_0.RT_7,
}
r5_0 = 410101
r6_0 = {
  EliteId = 410101,
}
r7_0 = {}
r7_0[1] = {
  OffsetXY = {
    -50,
    0
  },
}
r6_0.Offsets = r7_0
r4_0[r5_0] = r6_0
r5_0 = 410201
r6_0 = {
  EliteId = 410201,
}
r7_0 = {}
r7_0[1] = {
  OffsetXY = {
    0,
    11,
    -23
  },
}
r6_0.Offsets = r7_0
r4_0[r5_0] = r6_0
r4_0[430101] = {
  EliteId = 430101,
  Offsets = r0_0.RT_10,
}
r5_0 = 510101
r6_0 = {
  EliteId = 510101,
}
r7_0 = {}
r7_0[1] = {
  OffsetXY = {
    0,
    95
  },
}
r6_0.Offsets = r7_0
r4_0[r5_0] = r6_0
r4_0[510102] = {
  EliteId = 510102,
}
r5_0 = 540201
r6_0 = {
  EliteId = 540201,
  LocationCheckParam = r0_0.RT_4,
}
r7_0 = {}
r7_0[1] = {
  OffsetXY = {
    560,
    0
  },
}
r6_0.Offsets = r7_0
r4_0[r5_0] = r6_0
r4_0[600501] = {
  EliteId = 600501,
  SummonPresetShape = r0_0.RT_13,
}
r4_0[600502] = {
  EliteId = 600502,
  SummonPresetShape = r0_0.RT_13,
}
r5_0 = 601301
r6_0 = {
  EliteId = 601301,
}
r7_0 = {}
r7_0[1] = {
  OffsetXY = {
    300,
    0
  },
}
r7_0[2] = r0_0.RT_15
r7_0[3] = r0_0.RT_17
r6_0.Offsets = r7_0
r4_0[r5_0] = r6_0
r5_0 = 700201
r6_0 = {
  EliteId = 700201,
}
r7_0 = {}
r7_0[1] = {
  OffsetXY = {
    -200,
    200
  },
}
r6_0.Offsets = r7_0
r4_0[r5_0] = r6_0
r4_0[700202] = {
  EliteId = 700202,
  Offsets = r0_0.RT_10,
}
r5_0 = 700801
r6_0 = {
  EliteId = 700801,
}
r7_0 = {}
r7_0[1] = {
  OffsetXY = {
    100,
    50,
    400
  },
}
r6_0.Offsets = r7_0
r4_0[r5_0] = r6_0
r4_0[800201] = {
  EliteId = 800201,
  Offsets = {
    [1] = r0_0.RT_15,
    [2] = r0_0.RT_17,
  },
}
r5_0 = 800202
r6_0 = {
  EliteId = 800202,
}
r7_0 = {
  [1] = r0_0.RT_15,
  [2] = r0_0.RT_17,
}
r7_0[3] = {
  OffsetXY = {
    0,
    600
  },
}
r7_0[4] = {
  OffsetXY = {
    0,
    -600
  },
}
r6_0.Offsets = r7_0
r4_0[r5_0] = r6_0
r4_0[850061] = {
  EliteId = 850061,
  Offsets = r0_0.RT_18,
}
r4_0[850081] = {
  EliteId = 850081,
  Offsets = r0_0.RT_18,
}
r4_0[850401] = {
  EliteId = 850401,
  Offsets = {
    [1] = r0_0.RT_20,
  },
}
r4_0[850402] = {
  EliteId = 850402,
  Offsets = {
    [1] = r0_0.RT_22,
  },
}
r5_0 = 850403
r6_0 = {
  EliteId = 850403,
}
r7_0 = {}
r7_0[1] = {
  OffsetXY = {
    0,
    -1000
  },
}
r6_0.Offsets = r7_0
r4_0[r5_0] = r6_0
r5_0 = 850404
r6_0 = {
  EliteId = 850404,
}
r7_0 = {}
r7_0[1] = {
  OffsetXY = {
    0,
    1000
  },
}
r6_0.Offsets = r7_0
r4_0[r5_0] = r6_0
r5_0 = 850501
r6_0 = {
  EliteId = 850501,
}
r7_0 = {}
r7_0[1] = {
  OffsetXY = {
    0,
    650
  },
}
r7_0[2] = {
  OffsetXY = {
    0,
    -650
  },
}
r6_0.Offsets = r7_0
r4_0[r5_0] = r6_0
r5_0 = 850502
r6_0 = {
  EliteId = 850502,
}
r7_0 = {}
r7_0[1] = {
  OffsetXY = {
    450,
    600
  },
}
r7_0[2] = {
  OffsetXY = {
    450,
    -600
  },
}
r7_0[3] = {
  OffsetXY = {
    -450,
    600
  },
}
r7_0[4] = {
  OffsetXY = {
    -450,
    -600
  },
}
r6_0.Offsets = r7_0
r4_0[r5_0] = r6_0
r4_0[850901] = {
  EliteId = 850901,
  Offsets = r0_0.RT_18,
}
r5_0 = 851001
r6_0 = {
  EliteId = 851001,
}
r7_0 = {}
r7_0[1] = {
  OffsetXY = {
    400,
    500
  },
}
r7_0[2] = {
  OffsetXY = {
    400,
    -500
  },
}
r6_0.Offsets = r7_0
r4_0[r5_0] = r6_0
r5_0 = 851002
r6_0 = {
  EliteId = 851002,
}
r7_0 = {
  [1] = r0_0.RT_22,
  [2] = r0_0.RT_20,
}
r7_0[3] = {
  OffsetXY = {
    500,
    0
  },
}
r7_0[4] = r0_0.RT_24
r6_0.Offsets = r7_0
r4_0[r5_0] = r6_0
r5_0 = 851801
r6_0 = {
  EliteId = 851801,
}
r7_0 = {}
r7_0[1] = {
  OffsetXY = {
    100,
    600
  },
}
r7_0[2] = {
  OffsetXY = {
    100,
    -600
  },
}
r7_0[3] = {
  OffsetXY = {
    700,
    0
  },
}
r7_0[4] = r0_0.RT_24
r7_0[5] = {
  OffsetXY = {
    524,
    424
  },
}
r7_0[6] = {
  OffsetXY = {
    524,
    -424
  },
}
r7_0[7] = {
  OffsetXY = {
    -324,
    424
  },
}
r7_0[8] = {
  OffsetXY = {
    -324,
    -424
  },
}
r6_0.Offsets = r7_0
r4_0[r5_0] = r6_0
r5_0 = 852101
r6_0 = {
  EliteId = 852101,
}
r7_0 = {
  [1] = r0_0.RT_22,
}
r7_0[2] = {
  OffsetXY = {
    150,
    420
  },
}
r7_0[3] = {
  OffsetXY = {
    -150,
    420
  },
}
r7_0[4] = {
  OffsetXY = {
    300,
    300
  },
}
r7_0[5] = {
  OffsetXY = {
    -300,
    300
  },
}
r6_0.Offsets = r7_0
r4_0[r5_0] = r6_0
r5_0 = 852301
r6_0 = {
  EliteId = 852301,
  LocationCheckParam = r0_0.RT_4,
}
r7_0 = {}
r7_0[1] = {
  OffsetXY = {
    400,
    0
  },
}
r7_0[2] = {
  OffsetXY = {
    -200,
    346
  },
}
r7_0[3] = {
  OffsetXY = {
    -200,
    -346
  },
}
r6_0.Offsets = r7_0
r4_0[r5_0] = r6_0
r4_0[900301] = {
  EliteId = 900301,
  Offsets = r0_0.RT_10,
}
r5_0 = 900601
r6_0 = {
  EliteId = 900601,
  LocationCheckParam = r0_0.RT_4,
}
r7_0 = {}
r7_0[1] = {
  OffsetXY = {
    20,
    0
  },
}
r6_0.Offsets = r7_0
r4_0[r5_0] = r6_0
r4_0[900602] = {
  EliteId = 900602,
  LocationCheckParam = r0_0.RT_4,
  SummonPresetShape = {
    Interval = 72,
    PreFormationType = "Circle",
    Radius = 500,
    Random = 0,
  },
}
r4_0[6000005] = {
  EliteId = 6000005,
  SummonPresetShape = {
    Interval = 120,
    PreFormationType = "Circle",
    Radius = 700,
    Random = 0,
  },
}
r5_0 = 6000009
r6_0 = {
  EliteId = 6000009,
}
r7_0 = {
  [1] = r0_0.RT_12,
}
r7_0[2] = {
  OffsetXY = {
    1500,
    0,
    0
  },
}
r7_0[3] = {
  OffsetXY = {
    -750,
    1500,
    0
  },
}
r7_0[4] = {
  OffsetXY = {
    -750,
    -1500,
    0
  },
}
r6_0.Offsets = r7_0
r4_0[r5_0] = r6_0
r4_0[6000012] = {
  EliteId = 6000012,
  SummonPresetShape = {
    Interval = 60,
    PreFormationType = "Circle",
    Radius = 1200,
    Random = 0,
  },
}
r5_0 = 6000014
r6_0 = {
  EliteId = 6000014,
}
r7_0 = {}
r7_0[1] = {
  OffsetXY = {
    0,
    500,
    0
  },
}
r7_0[2] = {
  OffsetXY = {
    0,
    -500,
    0
  },
}
r6_0.Offsets = r7_0
r4_0[r5_0] = r6_0
r4_0[10104900] = {
  EliteId = 10104900,
  SummonPresetShape = {
    Interval = 30,
    PreFormationType = "Circle",
    Radius = 150,
    Random = 1,
  },
}
return r2_0(r3_0, r4_0)
