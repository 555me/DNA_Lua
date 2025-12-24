-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\WeeklySelectDungeon.lua
-- version: lua54
-- line: [0, 0] id: 0
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end
local r2_0 = "WeeklySelectDungeon"
local r3_0 = {}
r3_0[1] = {
  ChapterId = 1,
  ChapterName = "UI_DUNGEON_TYPE_SYNTHESIS",
  ChapterSubName = "UI_DUNGEON_DROP_MOD",
  DungeonList = {
    91302,
    91304,
    91306,
    91307
  },
  GuidanceTitle = 200001,
  Path = "/Game/UI/Texture/Dynamic/Atlas/Permanent/T_Play_Weekly01.T_Play_Weekly01",
  RewardViewId = 90012,
  Sequence = 10,
}
return r1_0(r2_0, r3_0)
