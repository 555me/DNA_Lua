-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\SquadCameraData.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    0,
    0,
    -90
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [8, 8] id: 1
  return r1_1
end
local r3_0 = "SquadCameraData"
local r4_0 = {}
r4_0.Char_Boy = {
  CameraFocal = 38.6,
  CameraName = "Char_Boy",
  Ease = 14,
  Location = {
    13,
    285,
    115
  },
  Rotation = r0_0.RT_1,
  Time = 1.2,
}
r4_0.Char_Girl = {
  CameraFocal = 38.6,
  CameraName = "Char_Girl",
  Ease = 14,
  Location = {
    13,
    285,
    104
  },
  Rotation = r0_0.RT_1,
  Time = 1.2,
}
r4_0.Char_Loli = {
  CameraFocal = 38.6,
  CameraName = "Char_Loli",
  Ease = 14,
  Location = {
    13,
    285,
    88
  },
  Rotation = r0_0.RT_1,
  Time = 1.2,
}
r4_0.Char_Man = {
  CameraFocal = 38.6,
  CameraName = "Char_Man",
  Ease = 14,
  Location = {
    13,
    285,
    140
  },
  Rotation = r0_0.RT_1,
  Time = 1.2,
}
r4_0.Char_Woman = {
  CameraFocal = 38.6,
  CameraName = "Char_Woman",
  Ease = 14,
  Location = {
    13,
    285,
    125
  },
  Rotation = r0_0.RT_1,
  Time = 1.2,
}
r4_0.Default = {
  CameraFocal = 70,
  CameraName = "Default",
  Ease = 14,
  Location = {
    1000,
    -20,
    -1
  },
  Rotation = {
    0,
    0,
    180
  },
  Time = 1.2,
}
return r2_0(r3_0, r4_0)
