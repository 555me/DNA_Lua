-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\WorldMap.lua
-- version: lua54
-- line: [0, 0] id: 0
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end
local r2_0 = "WorldMap"
local r3_0 = {}
r3_0[1] = {
  RegionIcon = "/Game/UI/Texture/Dynamic/Image/Chapter/T_Chapter_Icon01.T_Chapter_Icon01",
  RegionName = "UI_WORLDMAP_REGIONNAME_3",
  RegionUIIndex = 3,
  UIIndex = 3,
  WorldMapId = 1,
  WorldMapName = "UI_WORLDMAP_NAME_1",
  WorldMapRegion = {
    100
  },
}
r3_0[2] = {
  RegionIcon = "/Game/UI/Texture/Dynamic/Image/Chapter/T_Chapter_Icon01.T_Chapter_Icon01",
  RegionName = "UI_WORLDMAP_REGIONNAME_1",
  RegionUIIndex = 1,
  UIIndex = 2,
  WorldMapId = 2,
  WorldMapName = "UI_WORLDMAP_NAME_2",
  WorldMapRegion = {
    200,
    201,
    202,
    203,
    204
  },
  WorldMapUnlockCondition = 26,
}
r3_0[3] = {
  RegionIcon = "/Game/UI/Texture/Dynamic/Image/Chapter/T_Chapter_Icon02.T_Chapter_Icon02",
  RegionName = "UI_WORLDMAP_REGIONNAME_1",
  RegionUIIndex = 1,
  UIIndex = 1,
  UIRegionType = "EX",
  WorldMapId = 3,
  WorldMapName = "UI_WORLDMAP_NAME_3",
  WorldMapRegion = {
    300
  },
  WorldMapUnlockCondition = 11010103,
}
r3_0[4] = {
  RegionIcon = "/Game/UI/Texture/Dynamic/Image/Chapter/T_Chapter_Icon03.T_Chapter_Icon03",
  RegionName = "UI_WORLDMAP_REGIONNAME_2",
  RegionUIIndex = 2,
  UIIndex = 5,
  WorldMapId = 4,
  WorldMapName = "UI_WORLDMAP_NAME_4",
  WorldMapRegion = {
    400,
    401
  },
  WorldMapUnlockCondition = 325,
}
return r1_0(r2_0, r3_0)
