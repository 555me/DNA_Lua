-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\TrialTask.lua
-- version: lua54
-- line: [0, 0] id: 0
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end
local r2_0 = "TrialTask"
local r3_0 = {
  [1] = {
    IsKillMonsterTask = false,
    TaskId = 1,
    TextMap = "DUNGEONSINGLE",
    TextTitle = "UI_CharTrial_Title",
    TexturePath = "MainMission",
    WidgetPath = "Guide_Point",
  },
}
r3_0[2] = {
  IsKillMonsterTask = true,
  MonsterSpawnId = {
    9000101
  },
  TargetNum = 40,
  TaskId = 2,
  TextMap = "TARGET_DUNGEON_TRAINING_102",
  TextTitle = "UI_CharTrial_Title",
  TexturePath = "DefeatMission",
  WidgetPath = "Guide_Point",
}
r3_0[3] = {
  IsKillMonsterTask = false,
  TaskId = 3,
  TextMap = "TARGET_DUNGEON_103",
  TextTitle = "UI_CharTrial_Title",
  TexturePath = "Evacuation",
  WidgetPath = "Guide_Point",
}
return r1_0(r2_0, r3_0)
