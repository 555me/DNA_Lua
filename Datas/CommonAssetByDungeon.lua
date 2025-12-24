-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\CommonAssetByDungeon.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    Path = "WidgetBlueprint\'/Game/UI/WBP/Dungeon/Defense/WBP_Dungeon_DefenseWaveStart.WBP_Dungeon_DefenseWaveStart\'",
  },
}
r0_0.RT_2 = {
  [1] = r0_0.RT_1,
}
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [9, 9] id: 1
  return r1_1
end
local r4_0 = {}
local r5_0 = {}
r5_0.AssetPath = {
  [1] = {
    Path = "/Game/AssetDesign/AI/Z_Misc_Test/BT/TestNew.TestNew",
  },
}
r5_0.DungeonId = 1
r4_0[1] = r5_0
r4_0[60101] = {
  AssetPath = r0_0.RT_2,
  DungeonId = 60101,
}
r4_0[60102] = {
  AssetPath = r0_0.RT_2,
  DungeonId = 60102,
}
r4_0[62101] = {
  AssetPath = r0_0.RT_2,
  DungeonId = 62101,
}
r4_0[62102] = {
  AssetPath = r0_0.RT_2,
  DungeonId = 62102,
}
r4_0[64101] = {
  AssetPath = r0_0.RT_2,
  DungeonId = 64101,
}
r4_0[64102] = {
  AssetPath = r0_0.RT_2,
  DungeonId = 64102,
}
r4_0[90102] = {
  AssetPath = r0_0.RT_2,
  DungeonId = 90102,
}
r4_0[90104] = {
  AssetPath = r0_0.RT_2,
  DungeonId = 90104,
}
r4_0[90106] = {
  AssetPath = r0_0.RT_2,
  DungeonId = 90106,
}
r4_0[90108] = {
  AssetPath = r0_0.RT_2,
  DungeonId = 90108,
}
r4_0[90110] = {
  AssetPath = r0_0.RT_2,
  DungeonId = 90110,
}
r4_0[90112] = {
  AssetPath = r0_0.RT_2,
  DungeonId = 90112,
}
r4_0[90114] = {
  AssetPath = r0_0.RT_2,
  DungeonId = 90114,
}
return r1_0("CommonAssetByDungeon", r4_0)
