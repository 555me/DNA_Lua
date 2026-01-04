-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\ImpressionRegion.lua
-- version: lua54
-- line: [0, 0] id: 0
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end
local r2_0 = "ImpressionRegion"
local r3_0 = {}
r3_0[1011] = {
  Icon = "/Game/UI/Texture/Dynamic/Image/Area/T_Area_01.T_Area_01",
  ImpressionRegionId = 1011,
  RegionId = {
    2101,
    1001,
    1011,
    1013,
    1014,
    1017,
    1018,
    1019,
    1021,
    1022,
    1031,
    1032
  },
  RegionPointId = 2612,
  UIName = "DimensionGraph_Hyper",
}
r3_0[1041] = {
  Icon = "/Game/UI/Texture/Dynamic/Image/Area/T_Area_05.T_Area_05",
  ImpressionRegionId = 1041,
  RegionId = {
    1041,
    1049,
    1057
  },
  RegionPointId = 2826,
  UIName = "DimensionGraph_East",
}
return r1_0(r2_0, r3_0)
