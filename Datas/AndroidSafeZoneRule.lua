-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\AndroidSafeZoneRule.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end
local r3_0 = {}
local r4_0 = {}
local r5_0 = {}
r5_0[784] = {
  [720] = {
    DeviceMake = "HUAWEI",
    DeviceModel = "GRL-AL10",
    LRPadding = 0,
    UDPadding = 0,
    VSizeX = 784,
    VSizeY = 720,
  },
}
r5_0[1024] = {
  [720] = {
    DeviceMake = "HUAWEI",
    DeviceModel = "GRL-AL10",
    LRPadding = 0,
    UDPadding = 0,
    VSizeX = 1024,
    VSizeY = 720,
  },
}
r5_0[1592] = {
  [720] = {
    DeviceMake = "HUAWEI",
    DeviceModel = "GRL-AL10",
    LRPadding = 45,
    UDPadding = 0,
    VSizeX = 1592,
    VSizeY = 720,
  },
}
r4_0["GRL-AL10"] = r5_0
r3_0.HUAWEI = r4_0
return r0_0("AndroidSafeZoneRule", r3_0)
