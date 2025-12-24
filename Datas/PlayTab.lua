-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\PlayTab.lua
-- version: lua54
-- line: [0, 0] id: 0
return ((DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end)("PlayTab", {
  HardBossMain = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Hardboss.T_Tab_Hardboss",
    Sequence = 90,
    TabName = "MAIN_UI_HARDBOSS",
    TabUnlockRuleId = "HardBoss",
    WidgetUI = "HardBossMain",
  },
  NewDeputeRoot = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Depute.T_Tab_Depute",
    Sequence = 100,
    TabName = "UI_Dungeon_TabName",
    WidgetUI = "NewDeputeRoot",
  },
  PlayCommon = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Permanent.T_Tab_Permanent",
    Sequence = 80,
    TabName = "MAIN_UI_NORMAL",
    TabUnlockRuleId = "Rouge",
    WidgetUI = "PlayCommon",
  },
  PlayTaskRoot = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_ActivityNewPlayer.T_Tab_ActivityNewPlayer",
    Sequence = 120,
    TabName = "MAIN_UI_PLAYTASKROOT",
    TabUnlockRuleId = "PlayTaskRoot",
    WidgetUI = "PlayTaskRoot",
  },
})
