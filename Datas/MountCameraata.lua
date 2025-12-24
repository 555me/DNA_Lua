-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\MountCameraData.lua
-- version: lua54
-- line: [0, 0] id: 0
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end
local r2_0 = "MountCameraData"
local r3_0 = {}
r3_0.Default = {
  BackwardLocation = {
    1200,
    0,
    120
  },
  CameraFocal = 38.6,
  CameraName = "Default",
  Ease = 14,
  ForwardLocation = {
    850,
    0,
    120
  },
  Location = {
    1000,
    0,
    120
  },
  Rotation = {
    0,
    0,
    180
  },
  Time = 1.2,
}
return r1_0(r2_0, r3_0)
