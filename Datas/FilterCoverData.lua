-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\FilterCoverData.lua
-- version: lua54
-- line: [0, 0] id: 0
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end
local r2_0 = "FilterCoverData"
local r3_0 = {}
r3_0[1] = {
  CoverLineCheck = {
    CenterLineEnable = false,
    LineHeight = 100,
    OffsetLineEnable = true,
  },
  FilterCoverDataId = 1,
  MaxAngleList = {
    0,
    75,
    90
  },
  MaxDis = 1200,
  MaxNearNum = 3,
  MaxZ = 300,
  MinAngleList = {
    -90,
    -75,
    0
  },
  MinDis = 100,
}
return r1_0(r2_0, r3_0)
