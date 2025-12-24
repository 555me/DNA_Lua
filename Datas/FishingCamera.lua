-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\FishingCamera.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    [1] = "-12.024712,-308.135498,331.143066,0.000059,-24.19873,90.004784,4.0,1.5,false,DoNotOverride,1.2",
    [2] = 0.4,
    [3] = 7,
  },
}
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [8, 8] id: 1
  return r1_1
end
local r4_0 = {}
local r5_0 = {}
r5_0.Boy = {
  CameraInfoGame = r0_0.RT_1,
  CameraInfoMain = {
    [1] = "10.601534,86.371635,152.269531,0.000073,-8.199498,-91.591652,4.0,1.5,false,DoNotOverride,1.2",
    [2] = 0.7,
    [3] = 5,
  },
  CameraInfoSelect = {
    [1] = "13.718151,128.957657,147.509277,0.000081,-9.998986,-61.199715,0.0,0.0,false,DoNotOverride,0.0",
    [2] = 0.4,
    [3] = 7,
  },
  FishingSpotId1 = 1,
  FishingSpotId2 = "Boy",
}
r5_0.Girl = {
  CameraInfoGame = r0_0.RT_1,
  CameraInfoMain = {
    [1] = "10.601534,86.371635,146.269531,0.000073,-8.199498,-91.591652,4.0,1.5,false,DoNotOverride,1.2",
    [2] = 0.7,
    [3] = 5,
  },
  CameraInfoSelect = {
    [1] = "13.718151,128.957657,141.509277,0.000081,-9.998986,-61.199715,0.0,0.0,false,DoNotOverride,0.0",
    [2] = 0.4,
    [3] = 7,
  },
  FishingSpotId1 = 1,
  FishingSpotId2 = "Girl",
}
r5_0.Loli = {
  CameraInfoGame = r0_0.RT_1,
  CameraInfoMain = {
    [1] = "10.601534,86.371635,117.269531,0.000073,-8.199498,-91.591652,4.0,1.5,false,DoNotOverride,1.2",
    [2] = 0.7,
    [3] = 5,
  },
  CameraInfoSelect = {
    [1] = "13.718151,128.957657,112.509277,0.000081,-9.998986,-61.199715,0.0,0.0,false,DoNotOverride,0.0",
    [2] = 0.4,
    [3] = 7,
  },
  FishingSpotId1 = 1,
  FishingSpotId2 = "Loli",
}
r5_0.Man = {
  CameraInfoGame = r0_0.RT_1,
  CameraInfoMain = {
    [1] = "10.601534,86.371635,169.269531,0.000073,-8.199498,-91.591652,4.0,1.5,false,DoNotOverride,1.2",
    [2] = 0.7,
    [3] = 5,
  },
  CameraInfoSelect = {
    [1] = "13.718151,128.957657,164.509277,0.000081,-9.998986,-61.199715,0.0,0.0,false,DoNotOverride,0.0",
    [2] = 0.4,
    [3] = 7,
  },
  FishingSpotId1 = 1,
  FishingSpotId2 = "Man",
}
r5_0.Woman = {
  CameraInfoGame = r0_0.RT_1,
  CameraInfoMain = {
    [1] = "10.601534,86.371635,155.269531,0.000073,-8.199498,-91.591652,4.0,1.5,false,DoNotOverride,1.2",
    [2] = 0.7,
    [3] = 5,
  },
  CameraInfoSelect = {
    [1] = "13.718151,128.957657,150.509277,0.000081,-9.998986,-61.199715,0.0,0.0,false,DoNotOverride,0.0",
    [2] = 0.4,
    [3] = 7,
  },
  FishingSpotId1 = 1,
  FishingSpotId2 = "Woman",
}
r4_0[1] = r5_0
return r1_0("FishingCamera", r4_0)
