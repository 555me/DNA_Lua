-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\RegionMapIconRange.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    0,
    100
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [7, 7] id: 1
  return r1_1
end
local r3_0 = "RegionMapIconRange"
local r4_0 = {
  UI_BOSS = {
    IconScaleInterval = r0_0.RT_1,
    IconType = "UI_BOSS",
  },
}
r4_0.UI_CUSTOMPOINT = {
  IconScaleInterval = {
    33,
    100
  },
  IconType = "UI_CUSTOMPOINT",
}
r4_0.UI_DOORICONS = {
  IconScaleInterval = {
    67,
    100
  },
  IconType = "UI_DOORICONS",
}
r4_0.UI_SUBREGION = {
  IconScaleInterval = {
    50,
    100
  },
  IconType = "UI_SUBREGION",
}
r4_0.UI_TELEPORTPOINT = {
  IconScaleInterval = r0_0.RT_1,
  IconType = "UI_TELEPORTPOINT",
}
return r2_0(r3_0, r4_0)
