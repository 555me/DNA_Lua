-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\MiniGameBattery1.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    2,
    6,
    10,
    14,
    18,
    22
  },
  RT_2 = {
    0,
    3,
    6,
    9,
    12,
    15,
    18,
    21
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [21, 21] id: 1
  return r1_1
end
local r3_0 = "MiniGameBattery1"
local r4_0 = {}
r4_0[1] = {
  BatteryId = 1,
  PointerNum = 1,
  PointerSpeed = 5,
  SwitchPosition = r0_0.RT_1,
  SwitchStatus = {
    0,
    0,
    0,
    0,
    0,
    0
  },
}
r4_0[2] = {
  BatteryId = 2,
  PointerNum = 1,
  PointerSpeed = 5,
  SwitchPosition = r0_0.RT_1,
  SwitchStatus = {
    0,
    0,
    1,
    0,
    0,
    1
  },
}
r4_0[3] = {
  BatteryId = 3,
  PointerNum = 1,
  PointerSpeed = 5,
  SwitchPosition = r0_0.RT_1,
  SwitchStatus = {
    1,
    1,
    0,
    1,
    1,
    0
  },
}
r4_0[4] = {
  BatteryId = 4,
  PointerNum = 1,
  PointerSpeed = 5,
  SwitchPosition = r0_0.RT_1,
  SwitchStatus = {
    1,
    0,
    1,
    1,
    1,
    0
  },
}
r4_0[5] = {
  BatteryId = 5,
  PointerNum = 1,
  PointerSpeed = 5,
  SwitchPosition = r0_0.RT_1,
  SwitchStatus = {
    0,
    0,
    1,
    1,
    0,
    1
  },
}
r4_0[6] = {
  BatteryId = 6,
  PointerNum = 1,
  PointerSpeed = 5,
  SwitchPosition = r0_0.RT_1,
  SwitchStatus = {
    0,
    1,
    0,
    0,
    1,
    0
  },
}
r4_0[7] = {
  BatteryId = 7,
  PointerNum = 1,
  PointerSpeed = 5,
  SwitchPosition = r0_0.RT_2,
  SwitchStatus = {
    1,
    1,
    1,
    1,
    0,
    1,
    0,
    1
  },
}
r4_0[8] = {
  BatteryId = 8,
  PointerNum = 1,
  PointerSpeed = 5,
  SwitchPosition = r0_0.RT_2,
  SwitchStatus = {
    1,
    1,
    1,
    0,
    1,
    0,
    1,
    0
  },
}
r4_0[9] = {
  BatteryId = 9,
  PointerNum = 1,
  PointerSpeed = 5,
  SwitchPosition = r0_0.RT_2,
  SwitchStatus = {
    1,
    1,
    0,
    1,
    1,
    0,
    1,
    0
  },
}
r4_0[10] = {
  BatteryId = 10,
  PointerNum = 1,
  PointerSpeed = 5,
  SwitchPosition = r0_0.RT_2,
  SwitchStatus = {
    1,
    0,
    1,
    1,
    0,
    1,
    0,
    0
  },
}
r4_0[11] = {
  BatteryId = 11,
  PointerNum = 1,
  PointerSpeed = 5,
  SwitchPosition = r0_0.RT_2,
  SwitchStatus = {
    0,
    1,
    1,
    0,
    1,
    1,
    0,
    0
  },
}
r4_0[12] = {
  BatteryId = 12,
  PointerNum = 1,
  PointerSpeed = 5,
  SwitchPosition = r0_0.RT_2,
  SwitchStatus = {
    0,
    0,
    1,
    1,
    1,
    0,
    1,
    0
  },
}
return r2_0(r3_0, r4_0)
