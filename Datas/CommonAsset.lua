-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\CommonAsset.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end
local r3_0 = {}
local r4_0 = {}
r4_0.AssetPath = {
  [1] = {
    Path = "WidgetBlueprint\'/Game/UI/WBP/Battle/PC/WBP_Battle_Interactive_P.WBP_Battle_Interactive_P_C\'",
    PlatformName = "PC",
  },
  [2] = {
    Path = "WidgetBlueprint\'/Game/UI/WBP/Battle/Mobile/WBP_Battle_Interactive_M.WBP_Battle_Interactive_M_C\'",
    PlatformName = "Mobile",
  },
  [3] = {
    Path = "WidgetBlueprint\'/Game/UI/WBP/Common/WBP_Com_BlackScreen.WBP_Com_BlackScreen\'",
  },
  [4] = {
    Path = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/Drops/WBP_Battle_SpecialDrops.WBP_Battle_SpecialDrops_C\'",
  },
  [5] = {
    Path = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/Drops/WBP_Battle_Drops.WBP_Battle_Drops_C\'",
  },
  [6] = {
    Path = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/Drops/WBP_Battle_DropItem.WBP_Battle_DropItem_C\'",
  },
  [7] = {
    Path = "WidgetBlueprint\'/Game/UI/WBP/Common/Toast/PC/WBP_Com_ToastList_P.WBP_Com_ToastList_P_C\'",
    PlatformName = "PC",
  },
  [8] = {
    Path = "WidgetBlueprint\'/Game/UI/WBP/Common/Toast/Mobile/WBP_Com_ToastList_M.WBP_Com_ToastList_M_C\'",
    PlatformName = "Mobile",
  },
}
r4_0.Type = "All"
r3_0.All = r4_0
r4_0 = {}
r4_0.AssetPath = {
  [1] = {
    Path = "WidgetBlueprint\'/Game/UI/WBP/Settlement/Widget/WBP_Settlement_BlackScreen.WBP_Settlement_BlackScreen\'",
  },
}
r4_0.Type = "Dungeon"
r3_0.Dungeon = r4_0
r4_0 = {}
r4_0.AssetPath = {
  [1] = {
    Path = "WidgetBlueprint\'/Game/UI/WBP/World/NPC/Widget/WBP_NPC_UniformHeadWidget.WBP_NPC_UniformHeadWidget\'",
  },
}
r4_0.Type = "Region"
r3_0.Region = r4_0
return r0_0("CommonAsset", r3_0)
