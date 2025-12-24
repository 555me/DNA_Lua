-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\MSDKUploadConvert.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [1, 1] id: 1
  return r1_1
end
local r3_0 = {}
r3_0.ConditionUnlockInfo = {
  [110] = {
    [1] = "level_10",
  },
  [120] = {
    [1] = "level_20",
  },
  [150] = {
    [1] = "level_50",
  },
  [2048] = {
    [1] = "nocturnal_echoes_1",
  },
  [4010] = {
    [1] = "backpack_active",
  },
  [5082] = {
    [1] = "Maze_1",
  },
  [310101] = {
    [1] = "lynn_active",
  },
  [20010104] = {
    [1] = "chapter1_2_end",
  },
}
r3_0.QuestStartInfo = {}
r3_0.QuestSuccessInfo = {
  [10010102] = {
    [1] = "anime_start",
  },
  [10010104] = {
    [1] = "leave_cave",
  },
  [10010106] = {
    [1] = "action_train_end",
  },
  [10010108] = {
    [1] = "find_weapon",
  },
  [10010111] = {
    [1] = "select_gun",
  },
  [10010201] = {
    [1] = "find_remain",
    [2] = "test_gun",
  },
  [10010206] = {
    [1] = "first_operate_gear",
  },
  [10010213] = {
    [1] = "combatskill_end",
  },
  [10010307] = {
    [1] = "prologue_anime_start",
  },
  [10010308] = {
    [1] = "chapter1_1_start",
    [2] = "prologue_end",
    [3] = "reborn_start",
  },
  [10010310] = {
    [1] = "Loadout_active",
    [2] = "conquer_sibylle",
  },
  [10010311] = {
    [1] = "conquer_soldiers",
  },
  [10020108] = {
    [1] = "chapter1_1_end",
  },
  [10020203] = {
    [1] = "first_sanctuary",
  },
  [10020223] = {
    [1] = "chapter1_3_end",
  },
  [10020412] = {
    [1] = "name_noctoyager",
  },
  [10020611] = {
    [1] = "psychewalking_end",
  },
  [10020708] = {
    [1] = "psycheboss_end",
  },
  [10020804] = {
    [1] = "psychedream_end",
  },
  [10020810] = {
    [1] = "chapter1_end",
  },
  [20010105] = {
    [1] = "chapter1_3_start",
  },
  [20010305] = {
    [1] = "geniemon_1",
  },
}
return r0_0("MSDKUploadConvert", r3_0)
