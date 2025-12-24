-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\FailureGuidanceCombination.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    1001,
    1002,
    1003,
    1005
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [9, 9] id: 1
  return r1_1
end
local r3_0 = "FailureGuidanceCombination"
local r4_0 = {
  [100001] = {
    CombinationId = 100001,
    GuidanceModuleId = r0_0.RT_1,
    GuidanceTitle1 = "UI_DungeonFail_Tips1",
    GuidanceTitle2 = "UI_DungeonFail_Tips2",
    GuidanceType = 1,
  },
}
r4_0[100002] = {
  CombinationId = 100002,
  GuidanceModuleId = {
    1001,
    1002,
    1004,
    1005
  },
  GuidanceTitle1 = "UI_DungeonFail_Tips1",
  GuidanceTitle2 = "UI_DungeonFail_Tips2",
  GuidanceType = 1,
}
r4_0[100003] = {
  CombinationId = 100003,
  GuidanceModuleId = r0_0.RT_1,
  GuidanceTitle1 = "UI_DungeonFail_Tips1",
  GuidanceTitle2 = "UI_DungeonFail_Tips2",
  GuidanceType = 1,
}
r4_0[200001] = {
  CombinationId = 200001,
  GuidanceModuleId = r0_0.RT_1,
  GuidanceTitle1 = "UI_DungeonFail_Tips1",
  GuidanceTitle2 = "UI_DungeonFail_Tips2",
  GuidanceType = 2,
}
return r2_0(r3_0, r4_0)
