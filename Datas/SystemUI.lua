-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\SystemUI.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    "JumpToRogueMain"
  },
  RT_2 = {
    IsAllowEscape = 1,
  },
  RT_3 = {
    201,
    202
  },
  RT_4 = {
    "GuideBook_Tips"
  },
  RT_5 = {
    "Talk"
  },
  RT_6 = {
    "MainLineQuest"
  },
  RT_7 = {
    "SkillFeature"
  },
  RT_8 = {
    "SubSystemUnlock",
    "GuideBook_Tips",
    "CommonNewMonster",
    "AchievementPanel"
  },
  RT_9 = {
    "CharLevelUp_System"
  },
  RT_10 = {
    "TriggerGuide",
    "SystemUnlock",
    "MainLineQuest"
  },
  RT_11 = {
    101,
    102
  },
  RT_12 = {
    "QuestBeginEnd"
  },
}
r0_0.RT_13 = {
  BlockedUIName = r0_0.RT_12,
}
r0_0.RT_14 = {
  "OpenForcePopup"
}
r0_0.RT_15 = {
  203
}
r0_0.RT_16 = {
  205
}
r0_0.RT_17 = {
  100,
  101,
  102,
  110,
  111
}
r0_0.RT_18 = {
  "SystemUnlock"
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [68, 68] id: 1
  return r1_1
end
local r3_0 = "SystemUI"
local r4_0 = {
  RougeUpgradeTip = {
    ConfigName = "OnlyUIMode",
    MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/Mobile/Shop/WBP_Rouge_ItemUpgrade_M.WBP_Rouge_ItemUpgrade_M\'",
    PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/PC/Shop/WBP_Rouge_ItemUpgrade_P.WBP_Rouge_ItemUpgrade_P\'",
    UIName = " RougeUpgradeTip",
    ZOrder = 99,
  },
  AbyssEntry = {
    ConfigName = "OnlyUIMode",
    IsStopGame = 1,
    MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Abyss/Widget/WBP_Abyss_Entry.WBP_Abyss_Entry\'",
    PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Abyss/Widget/WBP_Abyss_Entry.WBP_Abyss_Entry\'",
    Popup = true,
    UIName = "AbyssEntry",
    ZOrder = 57,
  },
}
r4_0.AbyssMain = {
  ConfigName = "StackAndUIMode",
  GlobalGameUITag = "Abyss",
  IsHideBattleUnit = 1,
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Abyss/Mobile/WBP_Abyss_Main_M.WBP_Abyss_Main_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Abyss/PC/WBP_Abyss_Main_P.WBP_Abyss_Main_P\'",
  PauseAfterLoadingState = r0_0.RT_1,
  Popup = true,
  System = "Abyss",
  TabCoin = {
    214
  },
  UIName = "AbyssMain",
  ZOrder = 50,
}
r4_0.AbyssMod = {
  ConfigName = "StackAndUIMode",
  GlobalGameUITag = "Abyss",
  IsHideBattleUnit = 1,
  IsHideDrop = true,
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Abyss/Mobile/WBP_Abyss_Mod_M.WBP_Abyss_Mod_M‘",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Abyss/PC/WBP_Abyss_Mod_P.WBP_Abyss_Mod_P‘",
  Params = r0_0.RT_2,
  Popup = true,
  System = "Abyss",
  TabCoin = r0_0.RT_3,
  UIName = "AbyssMod",
  ZOrder = 51,
}
r4_0.AbyssSettlement = {
  ConfigName = "StackAndUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Abyss/Mobile/WBP_Abyss_Settle_M.WBP_Abyss_Settle_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Abyss/PC/WBP_Abyss_Settle_P.WBP_Abyss_Settle_P\'",
  Popup = true,
  System = "Abyss",
  UIName = "AbyssSettlement",
}
r4_0.Abyss_BattleProgress = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Abyss/WBP_Abyss_CountBar.WBP_Abyss_CountBar\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Abyss/WBP_Abyss_CountBar.WBP_Abyss_CountBar\'",
  UIName = "Abyss_BattleProgress",
}
r4_0.Abyss_CountDown = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Abyss/Widget/WBP_Abyss_CountDown.WBP_Abyss_CountDown\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Abyss/Widget/WBP_Abyss_CountDown.WBP_Abyss_CountDown\'",
  UIName = "Abyss_CountDown",
}
r4_0.Abyss_CountDown_Progress = {
  GlobalGameUITag = "Abyss",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Abyss/Widget/WBP_Abyss_Progress.WBP_Abyss_Progress\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Abyss/Widget/WBP_Abyss_Progress.WBP_Abyss_Progress\'",
  System = "Abyss",
  UIName = "Abyss_CountDown_Progress",
}
r4_0.AchievementPanel = {
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Achievement/Widget/WBP_Achievement_Hud.WBP_Achievement_Hud\'",
  System = "Battle",
  UIName = "AchievementPanel",
  ZOrder = 19,
}
r4_0.AchievementSystem = {
  ConfigName = "StackAndUIMode",
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Achievement/Mobile/WBP_Achievement_M.WBP_Achievement_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Achievement/PC/WBP_Achievement_P.WBP_Achievement_P\'",
  Popup = true,
  UIName = "AchievementSystem",
}
r4_0.ActionOnline = {
  ConfigName = "StackAndUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Mobile/Online_Action/WBP_Battle_OnlineAction_M.WBP_Battle_OnlineAction_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/PC/Online_Action/WBP_Battle_OnlineAction_P.WBP_Battle_OnlineAction_P\'",
  UIName = "ActionOnline",
  ZOrder = 52,
}
r4_0.ActivityEastTask = {
  ConfigName = "StackAndUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/Mobile/East/Season01/WBP_Activity_East_Sason01_Task_M.WBP_Activity_East_Sason01_Task_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/PC/East/Season01/WBP_Activity_East_Sason01_Task_P.WBP_Activity_East_Sason01_Task_P\'",
  UIName = "ActivityEastTask",
  ZOrder = 56,
}
r4_0.ActivityFeinaEventLevelSelect = {
  ConfigName = "OnlyUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/Mobile/FeinaEvent/WBP_Activity_FeinaEvent_LevelSelect_M.WBP_Activity_FeinaEvent_LevelSelect_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/PC/FeinaEvent/WBP_Activity_FeinaEvent_LevelSelect_P.WBP_Activity_FeinaEvent_LevelSelect_P\'",
  UIName = "ActivityFeinaEventLevelSelect",
  ZOrder = 56,
}
r4_0.ActivityFortTask = {
  ConfigName = "StackAndUIMode",
  IsHideBattleUnit = 1,
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/Mobile/Fort/WBP_Activity_Fort_Task_M.WBP_Activity_Fort_Task_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/PC/Fort/WBP_Activity_Fort_Task_P.WBP_Activity_Fort_Task_P\'",
  Popup = true,
  UIName = "ActivityFortTask",
  ZOrder = 56,
}
r4_0.ActivityJJGameTask = {
  ConfigName = "StackAndUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/Mobile/JJGame/WBP_Activity_JJGame_Task_M.WBP_Activity_JJGame_Task_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/PC/JJGame/WBP_Activity_JJGame_Task_P.WBP_Activity_JJGame_Task_P\'",
  Params = r0_0.RT_2,
  UIName = "ActivityJJGameTask",
  ZOrder = 56,
}
r4_0.ActivityMain = {
  ConfigName = "StackAndUIMode",
  GlobalGameUITag = "Activity",
  IsHideBattleUnit = 11,
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/Mobile/WBP_Activity_Entry_M.WBP_Activity_Entry_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/PC/WBP_Activity_Entry_P.WBP_Activity_Entry_P\'",
  Popup = true,
  System = "Activity",
  UIName = "ActivityMain",
  ZOrder = 55,
}
r4_0.ActivityShop = {
  ConfigName = "OnlyUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/Mobile/Shop/WBP_Activity_Shop_M.WBP_Activity_Shop_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/PC/Shop/WBP_Activity_Shop_P.WBP_Activity_Shop_P\'",
  Popup = true,
  UIName = "ActivityShop",
}
r4_0.ActivityTempleSoloTask = {
  ConfigName = "StackAndUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/Mobile/Temple/Solo/WBP_Activity_Temple_Solo_LevelDetail_M.WBP_Activity_Temple_Solo_LevelDetail_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/PC/Temple/Solo/WBP_Activity_Temple_Solo_LevelDetail_P.WBP_Activity_Temple_Solo_LevelDetail_P\'",
  UIName = "ActivityTempleSoloTask",
  ZOrder = 56,
}
r4_0.ActivityTheaterTask = {
  ConfigName = "StackAndUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/Mobile/TheaterOnline/WBP_Activity_Theater_Task_M.WBP_Activity_Theater_Task_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/PC/TheaterOnline/WBP_Activity_Theater_Task_P.WBP_Activity_Theater_Task_P\'",
  Popup = true,
  UIName = "ActivityTheaterTask",
  ZOrder = 56,
}
r4_0.ActivityWuyoushengMain = {
  ConfigName = "StackAndUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/Mobile/Wuyousheng/WBP_Activity_Wuyousheng_Main_M.WBP_Activity_Wuyousheng_Main_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/PC/Wuyousheng/WBP_Activity_Wuyousheng_Main_P.WBP_Activity_Wuyousheng_Main_P\'",
  UIName = "ActivityWuyoushengMain",
  ZOrder = 56,
}
r4_0.AimLock = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/WBP_Battle_AimLocked.WBP_Battle_AimLocked\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/WBP_Battle_AimLocked.WBP_Battle_AimLocked\'",
  System = "Battle",
  UIName = "AimLock",
}
r4_0.AnglingMain = {
  ConfigName = "StackAndUIMode",
  IsHideBattleUnit = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Angling/Mobile/WBP_Angling_Panel_M.WBP_Angling_Panel_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Angling/PC/WBP_AngLing_Panel_P.WBP_AngLing_Panel_P\'",
  Popup = true,
  TabCoin = {
    210
  },
  UIName = "AnglingMain",
}
r4_0.AnglingMap = {
  ConfigName = "StackAndUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Angling/Mobile/WBP_Angling_FishMap_M.WBP_Angling_FishMap_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Angling/PC/WBP_Angling_FishMap_P.WBP_Angling_FishMap_P\'",
  Popup = true,
  UIName = "AnglingMap",
}
r4_0.AnglingNewFish = {
  ConfigName = "StackAndUIMode",
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Angling/Widget/WBP_Angling_FishUnlock.WBP_Angling_FishUnlock\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Angling/Widget/WBP_Angling_FishUnlock.WBP_Angling_FishUnlock\'",
  Popup = true,
  UIName = "AnglingNewFish",
}
r4_0.ArchiveBookDetail = {
  ConfigName = "OnlyUIMode",
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Archive/Widget/WBP_Archive_BookDetail.WBP_Archive_BookDetail\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Archive/Widget/WBP_Archive_BookDetail.WBP_Archive_BookDetail\'",
  UIName = "ArchiveBookDetail",
}
r4_0.ArchiveMain = {
  ConfigName = "StackAndUIMode",
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Archive/Mobile/WBP_Archive_Main_M.WBP_Archive_Main_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Archive/PC/WBP_Archive_Main_P.WBP_Archive_Main_P\'",
  Popup = true,
  UIName = "ArchiveMain",
}
r4_0.ArchivePageChar = {
  ConfigName = "StackAndUIMode",
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Archive/Mobile/WBP_Archive_PageChar_M.WBP_Archive_PageChar_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Archive/PC/WBP_Archive_PageChar_P.WBP_Archive_PageChar_P\'",
  Popup = true,
  UIName = "ArchivePageChar",
}
r4_0.ArchivePageItem = {
  ConfigName = "StackAndUIMode",
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Archive/Mobile/WBP_Archive_PageItem_M.WBP_Archive_PageItem_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Archive/PC/WBP_Archive_PageItem_P.WBP_Archive_PageItem_P\'",
  Popup = true,
  UIName = "ArchivePageItem",
}
r4_0.ArchiveReward = {
  ConfigName = "OnlyUIMode",
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Archive/Widget/WBP_Archive_Reward.WBP_Archive_Reward\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Archive/Widget/WBP_Archive_Reward.WBP_Archive_Reward\'",
  UIName = "ArchiveReward",
}
r4_0.ArmoryCardLevelWeapon = {
  ConfigName = "StackAndUIMode",
  GlobalGameUITag = "Armory",
  IsHideDrop = true,
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/Mobile/WBP_Armory_Intensify_M.WBP_Armory_Intensify_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/PC/WBP_Armory_Intensify_P.WBP_Armory_Intensify_P’",
  Params = r0_0.RT_2,
  Popup = true,
  SpecialUINameList = r0_0.RT_4,
  StateTag = 1,
  System = "Armory",
  UIName = "ArmoryCardLevelWeapon",
  ZOrder = 55,
}
r4_0.ArmoryDetail = {
  ConfigName = "StackAndUIMode",
  GlobalGameUITag = "Armory",
  IsHideBattleUnit = 1,
  IsHideDrop = true,
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/Mobile/WBP_Armory_Main_M.WBP_Armory_Main_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/PC/WBP_Armory_Main_P.WBP_Armory_Main_P\'",
  Popup = true,
  SpecialUINameList = r0_0.RT_4,
  StateTag = 1,
  System = "Armory",
  UIName = "ArmoryDetail",
  ZOrder = 55,
}
r4_0.ArmoryDye = {
  ConfigName = "StackAndUIMode",
  GlobalGameUITag = "Armory",
  IsHideDrop = true,
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/Mobile/WBP_Armory_Dye_M.WBP_Armory_Dye_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/PC/WBP_Armory_Dye_P.WBP_Armory_Dye_P\'",
  Popup = true,
  SpecialUINameList = r0_0.RT_4,
  StateTag = 1,
  System = "Armory",
  UIName = "ArmoryDye",
  ZOrder = 55,
}
r4_0.ArmoryFile = {
  ConfigName = "StackAndUIMode",
  GlobalGameUITag = "Armory",
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/Mobile/WBP_Armory_File_M.WBP_Armory_File_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/PC/WBP_Armory_File_P.WBP_Armory_File_P\'",
  Params = r0_0.RT_2,
  Popup = true,
  System = "Armory",
  UIName = "ArmoryFile",
  ZOrder = 55,
}
r4_0.ArmoryMain = {
  CombatconditionIdList = {
    11,
    21
  },
  ConditiontextList = {
    "UI_Toast_OpenSys_InCombat",
    "UI_Toast_Armory_Forbid"
  },
  ConfigName = "StackAndUIMode",
  GlobalGameUITag = "Armory",
  IsHideBattleUnit = 1,
  IsHideDrop = true,
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/Mobile/WBP_Armory_Main_M.WBP_Armory_Main_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/PC/WBP_Armory_Main_P.WBP_Armory_Main_P\'",
  Popup = true,
  SpecialUINameList = r0_0.RT_4,
  StateTag = 1,
  System = "Armory",
  UIName = "ArmoryMain",
  ZOrder = 55,
}
r4_0.ArmoryMod = {
  ConfigName = "StackAndUIMode",
  GlobalGameUITag = "Armory",
  IsHideBattleUnit = 1,
  IsHideDrop = true,
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/Mobile/WBP_Armory_Mod_M.WBP_Armory_Mod_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/PC/WBP_Armory_Mod_P.WBP_Armory_Mod_P\'",
  Params = r0_0.RT_2,
  Popup = true,
  SpecialUINameList = r0_0.RT_4,
  StateTag = 1,
  System = "Armory",
  TabCoin = r0_0.RT_3,
  UIName = "ArmoryMod",
  ZOrder = 55,
}
r4_0.ArmoryModImport = {
  ConfigName = "OnlyUIMode",
  GlobalGameUITag = "Armory",
  IsHideDrop = true,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/Mobile/WBP_Armory_ModImport_M.WBP_Armory_ModImport_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/PC/WBP_Armory_ModImport_P.WBP_Armory_ModImport_P\'",
  Popup = true,
  SpecialUINameList = r0_0.RT_4,
  StateTag = 1,
  System = "Armory",
  UIName = "ArmoryModImport",
  ZOrder = 56,
}
r4_0.ArmoryModIntensify = {
  ConfigName = "StackAndUIMode",
  GlobalGameUITag = "Armory",
  IsHideDrop = true,
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/Mobile/WBP_Armory_Intensify_M.WBP_Armory_Intensify_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/PC/WBP_Armory_Intensify_P.WBP_Armory_Intensify_P’",
  Params = r0_0.RT_2,
  Popup = true,
  SpecialUINameList = r0_0.RT_4,
  StateTag = 1,
  System = "Armory",
  UIName = "ArmoryModIntensify",
  ZOrder = 55,
}
r4_0.ArmorySkin = {
  ConfigName = "StackAndUIMode",
  GlobalGameUITag = "Armory",
  IsHideBattleUnit = 1,
  IsHideDrop = true,
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/Mobile/WBP_Armory_Skin_M.WBP_Armory_Skin_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/PC/WBP_Armory_Skin_P.WBP_Armory_Skin_P\'",
  Popup = true,
  SpecialUINameList = r0_0.RT_4,
  StateTag = 1,
  System = "Armory",
  TabCoin = {
    100
  },
  UIName = "ArmorySkin",
  ZOrder = 55,
}
r4_0.ArmorySkinVideo = {
  ConfigName = "StackAndUIMode",
  GlobalGameUITag = "Armory",
  IsHideDrop = true,
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/Widget/Appearance/WBP_Armory_SkinVideo.WBP_Armory_SkinVideo\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/Widget/Appearance/WBP_Armory_SkinVideo.WBP_Armory_SkinVideo\'",
  Popup = true,
  SpecialUINameList = r0_0.RT_4,
  StateTag = 1,
  System = "Armory",
  UIName = "ArmorySkinVideo",
  ZOrder = 55,
}
r4_0.ArmoryTraceDetails = {
  ConfigName = "StackAndUIMode",
  GlobalGameUITag = "Armory",
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/Mobile/WBP_Armory_InronDetail_M.WBP_Armory_InronDetail_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/PC/WBP_Armory_InronDetail_P.WBP_Armory_InronDetail_P\'",
  Popup = true,
  System = "Armory",
  UIName = "ArmoryTraceDetails",
  ZOrder = 54,
}
r4_0.BagMain = {
  ConfigName = "StackAndUIMode",
  GlobalGameUITag = "Bag",
  IsHideBattleUnit = 11,
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Bag/Mobile/WBP_Bag_Main_M.WBP_Bag_Main_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Bag/PC/WBP_Bag_Main_P.WBP_Bag_Main_P\'",
  Popup = true,
  System = "Bag",
  TabCoin = {
    100,
    101,
    102
  },
  UIName = "BagMain",
  ZOrder = 55,
}
r4_0.BattleBeharmed = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/WBP_Battle_Beharmed.WBP_Battle_Beharmed\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/WBP_Battle_Beharmed.WBP_Battle_Beharmed\'",
  Params = {
    AnimPlayHPPercentage = 0.15,
  },
  System = "Battle",
  UIName = "BattleBeharmed",
  ZOrder = -9,
}
r4_0.BattleCombo = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Mobile/WBP_Battle_Combo_M.WBP_Battle_Combo_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/PC/WBP_Battle_Combo_P.WBP_Battle_Combo_P\'",
  System = "Battle",
  UIName = "BattleCombo",
  ZOrder = 25,
}
r4_0.BattleFort = {
  ConfigName = "OnlyForceShow",
  KeyboardSetName = "BattleFort",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Mobile/WBP_Battle_Fort_M.WBP_Battle_Fort_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/PC/WBP_Battle_Fort_P.WBP_Battle_Fort_P\'",
  SpecialUINameList = {
    "BattleMain",
    "BattleHitDirection",
    "DungeonSabotageFloat",
    "DungenonDefenseProFloat",
    "DungenonSurviveFloat",
    "DungeonHijackFloat",
    "DungenonExcavation",
    "DungeonRescueFloat",
    "DungeonExterminateFloat",
    "DestoryAlarm",
    "DungeonSabotageChallenge",
    "BattleBeharmed",
    "NearDeathBlood",
    "BrokenShieldEffect",
    "BossBlood",
    "TaskIndicator",
    "ExploreToastTips",
    "ExploreToastFail",
    "ExploreToastSuccess",
    "TeamToast",
    "GuideMain",
    "GuideIconMain",
    "DungeonBlackScreen",
    "DungeonSettlement",
    "MenuLevel",
    "TalkGuideUI"
  },
  StateTag = 4,
  System = "BattleSubsystem",
  UIName = "BattleFort",
}
r4_0.BattleHitDirection = {
  ConfigName = "BattleHitDirection",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/WBP_Battle_HitDirection.WBP_Battle_HitDirection\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/WBP_Battle_HitDirection.WBP_Battle_HitDirection\'",
  System = "Battle",
  UIName = "BattleHitDirection",
  ZOrder = -9,
}
r4_0.BattleMain = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Mobile/WBP_Battle_M.WBP_Battle_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/PC/WBP_Battle_P.WBP_Battle_P\'",
  System = "Battle",
  UIName = "BattleMain",
  ZOrder = -3,
}
r4_0.BattlePassGetItemPage = {
  ConditionShowStateTags = r0_0.RT_5,
  ConfigName = "OnlyUIMode",
  IsBanAccess = true,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/BattlePass/Mobile/WBP_BattlePass_GetItem_Paid_M.WBP_BattlePass_GetItem_Paid_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/BattlePass/PC/WBP_BattlePass_GetItem_Paid_P.WBP_BattlePass_GetItem_Paid_P\'",
  PauseAfterLoadingState = r0_0.RT_6,
  System = "BattlePass",
  UIName = "BattlePassGetItemPage",
  ZOrder = 101,
}
r4_0.BattlePassLevelUp = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/BattlePass/Widget/WBP_BattlePass_LevelUp.WBP_BattlePass_LevelUp\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/BattlePass/Widget/WBP_BattlePass_LevelUp.WBP_BattlePass_LevelUp\'",
  UIName = "BattlePassLevelUp",
}
r4_0.BattlePassMain = {
  ConfigName = "StackAndUIMode",
  IsHideBattleUnit = 1,
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/BattlePass/Mobile/WBP_BattlePass_Main_M.WBP_BattlePass_Main_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/BattlePass/PC/WBP_BattlePass_Main_P.WBP_BattlePass_Main_P\'",
  Popup = true,
  System = "BattlePass",
  UIName = "BattlePassMain",
}
r4_0.BattlePassPurchase = {
  ConfigName = "StackAndUIMode",
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/BattlePass/Mobile/WBP_BattlePass_PurchasePage_M.WBP_BattlePass_PurchasePage_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/BattlePass/PC/WBP_BattlePass_PurchasePage_P.WBP_BattlePass_PurchasePage_P\'",
  Params = r0_0.RT_2,
  System = "BattlePass",
  UIName = "BattlePassPurchase",
}
r4_0.BattleResurgence = {
  KeyboardSetName = "Dead",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/WBP_Battle_Resurrection.WBP_Battle_Resurrection\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/WBP_Battle_Resurrection.WBP_Battle_Resurrection\'",
  SpecialUINameList = {
    "BattleMain",
    "MenuLevel",
    "MenuWorld",
    "DungeonBlackScreen",
    "DungeonSettlement",
    "Setting",
    "TaskIndicator",
    "Vote",
    "SkillDetails",
    "LoadingReconnect",
    "HardBossBattleOpen",
    "RougeSettlement",
    "DungeonSabotageChallenge",
    "Rouge_Blessing_3Choose1",
    "Rouge_Treasure_3Choose1",
    "GuideMain",
    "CommonDialog"
  },
  StateTag = 4,
  System = "Battle",
  UIName = "BattleResurgence",
  ZOrder = 50,
}
r4_0.BlackScreeCharChange = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/ChapterStart/Widget/WBP_Chapter_CharChange.WBP_Chapter_CharChange\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/ChapterStart/Widget/WBP_Chapter_CharChange.WBP_Chapter_CharChange\'",
  UIName = "BlackScreeCharChange",
  ZOrder = 105,
}
r4_0.BlackScreenHeadPhone = {
  ConfigName = "StackAndUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Story/Widget/WBP_BlackScreen_HeadPhone.WBP_BlackScreen_HeadPhone\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Story/Widget/WBP_BlackScreen_HeadPhone.WBP_BlackScreen_HeadPhone\'",
  System = "Story",
  UIName = "BlackScreenHeadPhone",
  ZOrder = 102,
}
r4_0.BlackScreenXiaobai = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Loading/Widget/WBP_Com_Loading_XiaoBai.WBP_Com_Loading_XiaoBai\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Loading/Widget/WBP_Com_Loading_XiaoBai.WBP_Com_Loading_XiaoBai\'",
  UIName = "BlackScreenXiaobai",
  ZOrder = 105,
}
r4_0.BlackTalkUI = {
  ConditionShowStateTags = r0_0.RT_5,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Story/Mobile/WBP_BlackScreenTalk_M.WBP_BlackScreenTalk_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Story/PC/WBP_BlackScreenTalk_P.WBP_BlackScreenTalk_P\'",
  System = "Story",
  UIName = "BlackTalkUI",
  ZOrder = 53,
}
r4_0.BossBlood = {
  IsHideInImmersionMode = true,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Mobile/Lifebar/WBP_Battle_BossBar_M.WBP_Battle_BossBar_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/PC/Lifebar/WBP_Battle_BossBar_P.WBP_Battle_BossBar_P\'",
  System = "Battle",
  UIName = "BossBlood",
  ZOrder = 30,
}
r4_0.BossSkillToast = {
  ConditionShowStateTags = r0_0.RT_5,
  IgnoreHideTags = r0_0.RT_7,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Toast/Mobile/WBP_Com_ToastBossSkill_M.WBP_Com_ToastBossSkill_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Toast/PC/WBP_Com_ToastBossSkill_P.WBP_Com_ToastBossSkill_P\'",
  UIName = "BossSkillToast",
}
r4_0.BranchTaskReceiveTips = {
  ConditionShowStateTags = r0_0.RT_5,
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Task/Widget/SideTask/WBP_Task_NpcSideTaskTips.WBP_Task_NpcSideTaskTips\'",
  Popup = true,
  UIName = "BranchTaskReceiveTips",
  ZOrder = 55,
}
r4_0.BrokenShieldEffect = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Mobile/WBP_Battle_BrokenShield_M.WBP_Battle_BrokenShield_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/PC/WBP_Battle_BrokenShield_P.WBP_Battle_BrokenShield_P\'",
  Params = {
    AnimName = "BrokenShield_All",
    ShieldUIResetRate = 0.3,
  },
  System = "Battle",
  UIName = "BrokenShieldEffect",
  ZOrder = 8,
}
r4_0.ChapterStart_East_YanJinDu = {
  ConditionShowStateTags = r0_0.RT_5,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/ChapterStart/Widget/WBP_ChapterStart_East_YanJinDu.WBP_ChapterStart_East_YanJinDu\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/ChapterStart/Widget/WBP_ChapterStart_East_YanJinDu.WBP_ChapterStart_East_YanJinDu\'",
  UIName = "ChapterStart_East_YanJinDu",
}
r4_0.ChapterStart_IceLakeCity = {
  ConditionShowStateTags = r0_0.RT_5,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/ChapterStart/Widget/WBP_ChapterStart_IceLakeCity.WBP_ChapterStart_IceLakeCity\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/ChapterStart/Widget/WBP_ChapterStart_IceLakeCity.WBP_ChapterStart_IceLakeCity\'",
  UIName = "ChapterStart_IceLakeCity",
}
r4_0.ChapterStart_SandySea = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/ChapterStart/Widget/WBP_ChapterStart_SandySea.WBP_ChapterStart_SandySea\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/ChapterStart/Widget/WBP_ChapterStart_SandySea.WBP_ChapterStart_SandySea\'",
  UIName = "ChapterStart_SandySea",
}
r4_0.Chapter_Transition02 = {
  ConditionShowStateTags = r0_0.RT_5,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/ChapterStart/Widget/WBP_Chapter_Transition02.WBP_Chapter_Transition02\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/ChapterStart/Widget/WBP_Chapter_Transition02.WBP_Chapter_Transition02\'",
  UIName = "Chapter_Transition02",
  ZOrder = 60,
}
r4_0.CharLevelUp = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/WBP_Char_LevelUp.WBP_Char_LevelUp\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/WBP_Char_LevelUp.WBP_Char_LevelUp\'",
  SpecialUINameList = {
    "RegionOnlineFloat"
  },
  StateTag = 1,
  System = "Battle",
  UIName = "CharLevelUp",
  ZOrder = -9,
}
local r5_0 = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/WBP_Char_LevelUp.WBP_Char_LevelUp\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/WBP_Char_LevelUp.WBP_Char_LevelUp\'",
}
r5_0.Params = {
  SupportUIName = {
    "ArmoryMain",
    "ForgeMain",
    "ShopMain"
  },
}
r5_0.System = "BattleSubsystem"
r5_0.UIName = "CharLevelUp_System"
r5_0.ZOrder = 56
r4_0.CharLevelUp_System = r5_0
r4_0.CharSkinPreview = {
  ConfigName = "StackAndUIMode",
  IsHideBattleUnit = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/BattlePass/Mobile/WBP_BattlePass_SkinPreview_M.WBP_BattlePass_SkinPreview_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/BattlePass/PC/WBP_BattlePass_SkinPreview_P.WBP_BattlePass_SkinPreview_P\'",
  System = "BattlePass",
  UIName = "CharSkinPreview",
}
r4_0.ChatMain = {
  ConfigName = "OnlyUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Chat/Mobile/WBP_Chat_Main_M.WBP_Chat_Main_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Chat/PC/WBP_Chat_Main_P.WBP_Chat_Main_P\'",
  Params = r0_0.RT_2,
  System = "Chat",
  UIName = "ChatMain",
  ZOrder = 99,
}
r4_0.CinematicUI = {
  ConditionShowStateTags = r0_0.RT_5,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Story/Mobile/WBP_Story_Cinema_M.WBP_Story_Cinema_M_C\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Story/PC/WBP_Story_Cinema_P.WBP_Story_Cinema_P_C\'",
  System = "Story",
  UIName = "CinematicUI",
  ZOrder = 10,
}
r4_0.CommonBlackScreen = {
  ConditionShowStateTags = r0_0.RT_5,
  ConfigName = "OnlyAllowMulti",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/WBP_Com_BlackScreen.WBP_Com_BlackScreen\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/WBP_Com_BlackScreen.WBP_Com_BlackScreen\'",
  SpecialUINameList = {
    "CommonHudReward"
  },
  StateTag = 3,
  System = "Common",
  UIName = "CommonBlackScreen",
  ZOrder = 30,
}
r4_0.CommonDarkScreen = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/WBP_Com_DarkScreen.WBP_Com_DarkScreen\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/WBP_Com_DarkScreen.WBP_Com_DarkScreen\'",
  System = "Common",
  UIName = "CommonDarkScreen",
}
r4_0.CommonDialog = {
  ConditionShowStateTags = r0_0.RT_5,
  ConfigName = "UIModeAndForceShow",
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Dialog/WBP_Com_Dialog.WBP_Com_Dialog\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Dialog/WBP_Com_Dialog.WBP_Com_Dialog\'",
  System = "Common",
  UIName = "CommonDialog",
  ZOrder = 100,
}
r4_0.CommonDialogTip = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Dialog/Widget/WBP_Com_Dialog_Tip.WBP_Com_Dialog_Tip\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Dialog/Widget/WBP_Com_Dialog_Tip.WBP_Com_Dialog_Tip\'",
  System = "Common",
  UIName = "CommonDialogTip",
  ZOrder = 101,
}
r4_0.CommonHudReward = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/WBP_Battle_Reward.WBP_Battle_Reward\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/WBP_Battle_Reward.WBP_Battle_Reward\'",
  PauseAfterLoadingState = r0_0.RT_6,
  SpecialUINameList = r0_0.RT_8,
  StateTag = 1,
  System = "Battle",
  UIName = "CommonHudReward",
  ZOrder = 21,
}
r4_0.CommonNewMonster = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/WBP_Battle_NewMonster.WBP_Battle_NewMonster\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/WBP_Battle_NewMonster.WBP_Battle_NewMonster\'",
  SpecialUINameList = {
    "AchievementPanel"
  },
  StateTag = 1,
  System = "Battle",
  UIName = "CommonNewMonster",
  ZOrder = 20,
}
r4_0.CommonStoryToast = {
  ConfigName = "OnlyForceShow",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Toast/Mobile/WBP_Com_ToastStory_M.WBP_Com_ToastStory_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Toast/PC/WBP_Com_ToastStory_P.WBP_Com_ToastStory_P\'",
  System = "Common",
  UIName = "CommonStoryToast",
  ZOrder = 102,
}
r4_0.CommonTopToastList = {
  ConfigName = "OnlyForceShow",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Toast/Mobile/WBP_Com_ToastList_M.WBP_Com_ToastList_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Toast/PC/WBP_Com_ToastList_P.WBP_Com_ToastList_P\'",
  System = "Common",
  UIName = "CommonTopToastList",
  ZOrder = 103,
}
r4_0.ConnectLine = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/MiniGame/Mobile/WBP_MiniGame_MiGongMain_M.WBP_MiniGame_MiGongMain_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/MiniGame/PC/WBP_MiniGame_MiGongMain_P.WBP_MiniGame_MiGongMain_P\'",
  System = "Battle",
  UIName = "ConnectLine",
  ZOrder = 50,
}
r4_0.CustomHUDSetting = {
  ConfigName = "StackAndUIMode",
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Mobile/WBP_SettingCustomBtn_M.WBP_SettingCustomBtn_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Mobile/WBP_SettingCustomBtn_M.WBP_SettingCustomBtn_M\'",
  Popup = true,
  UIName = "CustomHUDSetting",
}
r4_0.DayAndNight = {
  CombatconditionIdList = {
    11
  },
  ConditiontextList = {
    "UI_Toast_OpenSys_InCombat"
  },
  ConfigName = "StackAndUIMode",
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/DayAndNight/Mobile/WBP_DayAndNight_M.WBP_DayAndNight_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/DayAndNight/PC/WBP_DayAndNight_P.WBP_DayAndNight_P\'",
  System = "PersonInfo",
  UIName = "DayAndNight",
  ZOrder = 55,
}
r4_0.DefeatedInteract = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/PC/WBP_Battle_Execute_P.WBP_Battle_Execute_P_C\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/PC/WBP_Battle_Execute_P.WBP_Battle_Execute_P_C\'",
  System = "Battle",
  UIName = "DefeatedInteract",
  ZOrder = 22,
}
r4_0.DefenseLowHealth = {
  ConfigName = "OnlyForceShow",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Dungeon/Defense/WBP_Dungeon_DefenseLowHealth.WBP_Dungeon_DefenseLowHealth\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Dungeon/Defense/WBP_Dungeon_DefenseLowHealth.WBP_Dungeon_DefenseLowHealth\'",
  System = "Battle",
  UIName = "DefenseLowHealth",
  ZOrder = -9,
}
r4_0.DestoryAlarm = {
  ConfigName = "OnlyForceShow",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Dungeon/Sabotage/WBP_Dungeon_SabotageAlarm.WBP_Dungeon_SabotageAlarm\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Dungeon/Sabotage/WBP_Dungeon_SabotageAlarm.WBP_Dungeon_SabotageAlarm\'",
  UIName = "DestoryAlarm",
}
r4_0.DetectiveAssociate = {
  ConditionShowStateTags = r0_0.RT_5,
  ConfigName = "OnlyUIMode",
  IsHideBattleUnit = 1,
  IsHideDrop = true,
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Reasoning/Mobile/WBP_Reasoning_Associate_M.WBP_Reasoning_Associate_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Reasoning/PC/WBP_Reasoning_Associate_P.WBP_Reasoning_Associate_P\'",
  Popup = true,
  UIName = "DetectiveAssociate",
  ZOrder = 61,
}
r4_0.DetectiveAssociateSuccess = {
  ConditionShowStateTags = r0_0.RT_5,
  ConfigName = "OnlyUIMode",
  IsHideBattleUnit = 1,
  IsHideDrop = true,
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Reasoning/Widget/WBP_Reasoning_AssociateSuccess.WBP_Reasoning_AssociateSuccess\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Reasoning/Widget/WBP_Reasoning_AssociateSuccess.WBP_Reasoning_AssociateSuccess\'",
  Popup = true,
  UIName = "DetectiveAssociateSuccess",
  ZOrder = 61,
}
r4_0.DetectiveMinigame = {
  ConditionShowStateTags = r0_0.RT_5,
  ConfigName = "StackAndUIMode",
  IsHideDrop = true,
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Reasoning/Mobile/WBP_Reasoning_Main_M.WBP_Reasoning_Main_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Reasoning/PC/WBP_Reasoning_Main_P.WBP_Reasoning_Main_P\'",
  Params = r0_0.RT_2,
  Popup = true,
  SpecialUINameList = r0_0.RT_4,
  UIName = "DetectiveMinigame",
  ZOrder = 60,
}
r4_0.DetectiveMinigameTips = {
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Tips/WBP_Com_QuickCheck_Tips.WBP_Com_QuickCheck_Tips\'",
  SpecialUINameList = r0_0.RT_4,
  StateTag = 1,
  System = "Battle",
  UIName = "DetectiveMinigameTips",
}
r4_0.DetectiveReasoningAni = {
  ConfigName = "OnlyUIMode",
  IsHideBattleUnit = 1,
  IsHideDrop = true,
  IsStopGame = 1,
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Reasoning/Widget/WBP_Reasoning_Ani.WBP_Reasoning_Ani\'",
  Popup = true,
  SpecialUINameList = r0_0.RT_4,
  UIName = "DetectiveReasoningAni",
  ZOrder = 61,
}
r4_0.DetectiveReasoningDetail = {
  ConfigName = "OnlyUIMode",
  IsHideBattleUnit = 1,
  IsHideDrop = true,
  IsStopGame = 1,
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Reasoning/Widget/WBP_Reasoning_Detail.WBP_Reasoning_Detail\'",
  Popup = true,
  SpecialUINameList = r0_0.RT_4,
  UIName = "DetectiveReasoningDetail",
  ZOrder = 61,
}
r4_0.DialogueReview = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Review/Mobile/WBP_Com_DialogueReview_M.WBP_Com_DialogueReview_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Review/PC/WBP_Com_DialogueReview_P.WBP_Com_DialogueReview_P\'",
  UIName = "DialogueReview",
  ZOrder = 48,
}
r4_0.DoubleBossBlood = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Mobile/Lifebar/WBP_Battle_DoubleBossBar_M.WBP_Battle_DoubleBossBar_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/PC/Lifebar/WBP_Battle_DoubleBossBar_P.WBP_Battle_DoubleBossBar_P\'",
  System = "Battle",
  UIName = "DoubleBossBlood",
}
r4_0.DungenonDefenseFloat = {
  ConfigName = "OnlyForceShow",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Dungeon/Defense/WBP_Dungeon_Defense.WBP_Dungeon_Defense\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Dungeon/Defense/WBP_Dungeon_Defense.WBP_Dungeon_Defense\'",
  UIName = "DungenonDefenseFloat",
}
r4_0.DungenonDefenseProFloat = {
  ConfigName = "OnlyForceShow",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Dungeon/Defense/WBP_Dungeon_DefensePro.WBP_Dungeon_DefensePro\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Dungeon/Defense/WBP_Dungeon_DefensePro.WBP_Dungeon_DefensePro\'",
  UIName = "DungenonDefenseProFloat",
}
r4_0.DungenonExcavation = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Dungeon/Excavation/WBP_Dungeon_Excavation.WBP_Dungeon_Excavation\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Dungeon/Excavation/WBP_Dungeon_Excavation.WBP_Dungeon_Excavation\'",
  UIName = "DungenonExcavation",
}
r4_0.DungenonSurviveFloat = {
  ConfigName = "OnlyForceShow",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Dungeon/Survival/WBP_Dungeon_Survival.WBP_Dungeon_Survival\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Dungeon/Survival/WBP_Dungeon_Survival.WBP_Dungeon_Survival\'",
  UIName = "DungenonSurviveFloat",
}
r4_0.DungeonBlackScreen = {
  ConfigName = "OnlyUIMode",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Settlement/Widget/WBP_Settlement_BlackScreen.WBP_Settlement_BlackScreen\'",
  System = "Battle",
  UIName = "DungeonBlackScreen",
  ZOrder = 30,
}
r4_0.DungeonCaptureFloat = {
  ConfigName = "OnlyForceShow",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Dungeon/Capture/WBP_Dungeon_CaptureTime.WBP_Dungeon_CaptureTime\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Dungeon/Capture/WBP_Dungeon_CaptureTime.WBP_Dungeon_CaptureTime\'",
  UIName = "DungeonCaptureFloat",
}
r4_0.DungeonExterminateFloat = {
  ConfigName = "OnlyForceShow",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/Annihilate/WBP_Battle_Annihilate.WBP_Battle_Annihilate\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/Annihilate/WBP_Battle_Annihilate.WBP_Battle_Annihilate\'",
  UIName = "DungeonExterminateFloat",
}
r4_0.DungeonFirstGuide = {
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Guide/Mobile/WBP_Guide_Image_Main_M.WBP_Guide_Image_Main_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Guide/PC/WBP_Guide_Image_Main_P.WBP_Guide_Image_Main_P\'",
  PauseAfterLoadingState = {
    "DungeonUI",
    "TriggerGuide"
  },
  UIName = "DungeonFirstGuide",
  ZOrder = 55,
}
r4_0.DungeonHijackFloat = {
  ConfigName = "OnlyForceShow",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Dungeon/Hijack/WBP_Dungeon_HijackTask.WBP_Dungeon_HijackTask\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Dungeon/Hijack/WBP_Dungeon_HijackTask.WBP_Dungeon_HijackTask\'",
  UIName = "DungeonHijackFloat",
}
r4_0.DungeonHijackFloatPanel = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Dungeon/Hijack/WBP_Dungeon_HijackMain.WBP_Dungeon_HijackMain\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Dungeon/Hijack/WBP_Dungeon_HijackMain.WBP_Dungeon_HijackMain\'",
  UIName = "DungeonHijackFloatPanel",
}
r4_0.DungeonMatchTimingBar = {
  ConfigName = "OnlyForceShow",
  KeyboardSetName = "PopupConfirm",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Team/Widget/WBP_Team_Timing.WBP_Team_Timing_C\'",
  UIName = "DungeonMatchTimingBar",
  ZOrder = 101,
}
r4_0.DungeonRescueFloat = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Dungeon/Defense/WBP_Dungeon_Defense.WBP_Dungeon_Defense\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Dungeon/Defense/WBP_Dungeon_Defense.WBP_Dungeon_Defense\'",
  UIName = "DungeonRescueFloat",
}
r4_0.DungeonRescueTimeFloat = {
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Dungeon/Rescue/PC/WBP_Dungeon_RescueTime_P.WBP_Dungeon_RescueTime_P\'",
  UIName = "DungeonRescueTimeFloat",
}
r4_0.DungeonSabotageChallenge = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Dungeon/Sabotage/WBP_Dungeon_DestroyTaskBar.WBP_Dungeon_DestroyTaskBar_C\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Dungeon/Sabotage/WBP_Dungeon_DestroyTaskBar.WBP_Dungeon_DestroyTaskBar_C\'",
  UIName = "DungeonSabotageChallenge",
  ZOrder = -4,
}
r4_0.DungeonSabotageFloat = {
  ConfigName = "OnlyForceShow",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Dungeon/Sabotage/WBP_Dungeon_Sabotage.WBP_Dungeon_Sabotage\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Dungeon/Sabotage/WBP_Dungeon_Sabotage.WBP_Dungeon_Sabotage\'",
  UIName = "DungeonSabotageFloat",
}
r4_0.DungeonSettlement = {
  ConfigName = "StackAndUIMode",
  IsBanAccess = true,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Settlement/Mobile/WBP_Settlement_M.WBP_Settlement_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Settlement/PC/WBP_Settlement_P.WBP_Settlement_P\'",
  System = "Battle",
  UIName = "DungeonSettlement",
  ZOrder = 10,
}
r4_0.DungeonSurvivalLowSerum = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Dungeon/Survival/WBP_Dungeon_SurvivalLowSerum.WBP_Dungeon_SurvivalLowSerum\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Dungeon/Survival/WBP_Dungeon_SurvivalLowSerum.WBP_Dungeon_SurvivalLowSerum\'",
  UIName = "DungeonSurvivalLowSerum",
  ZOrder = -5,
}
r4_0.DungeonSynthesisCrack = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Play/Widget/Depute/Weekly/WBP_Play_DeputeWeekly_Hud_KeyItem.WBP_Play_DeputeWeekly_Hud_KeyItem\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Play/Widget/Depute/Weekly/WBP_Play_DeputeWeekly_Hud_KeyItem.WBP_Play_DeputeWeekly_Hud_KeyItem\'",
  UIName = "DungeonSynthesisCrack",
}
r4_0.DungeonSynthesisFloat = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Play/Widget/Depute/Weekly/WBP_Play_DeputeWeekly_Hud_ClueProgressItem.WBP_Play_DeputeWeekly_Hud_ClueProgressItem\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Play/Widget/Depute/Weekly/WBP_Play_DeputeWeekly_Hud_ClueProgressItem.WBP_Play_DeputeWeekly_Hud_ClueProgressItem\'",
  UIName = "DungeonSynthesisFloat",
}
r4_0.DungeonTempleFloat = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Dungeon/Temple/WBP_Dungeon_Temple_Left.WBP_Dungeon_Temple_Left\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Dungeon/Temple/WBP_Dungeon_Temple_Left.WBP_Dungeon_Temple_Left\'",
  UIName = "DungeonTempleFloat",
}
r4_0.Entertainment = {
  ConfigName = "StackAndUIMode",
  GlobalGameUITag = "Entertainment",
  IsHideBattleUnit = 11,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Entertainment/Mobile/WBP_Entertainment_M.WBP_Entertainment_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Entertainment/PC/WBP_entertainment_P.WBP_Entertainment_P\'",
  Popup = true,
  TabCoin = {
    19000
  },
  UIName = "Entertainment",
  ZOrder = 55,
}
r4_0.ExperienceMain = {
  ConfigName = "StackAndUIMode",
  IsHideBattleUnit = 1,
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Experience/Mobile/WBP_Experience_Main_M.WBP_Experience_Main_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Experience/PC/WBP_Experience_Main_P.WBP_Experience_Main_P\'",
  Popup = true,
  UIName = "ExperienceMain",
  ZOrder = 55,
}
r4_0.ExploreToastFail = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Toast/Mobile/WBP_Com_ToastFail_M.WBP_Com_ToastFail_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Toast/PC/WBP_Com_ToastFail_P.WBP_Com_ToastFail_P\'",
  UIName = "ExploreToastFail",
  ZOrder = 10,
}
r4_0.ExploreToastSuccess = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Toast/Mobile/WBP_Com_ToastSuccess_M.WBP_Com_ToastSuccess_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Toast/PC/WBP_Com_ToastSuccess_P.WBP_Com_ToastSuccess_P\'",
  SpecialUINameList = {
    "WarningToast"
  },
  StateTag = 1,
  UIName = "ExploreToastSuccess",
  ZOrder = 10,
}
r4_0.ExploreToastTips = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Toast/Mobile/WBP_Com_ToastTitle_M.WBP_Com_ToastTitle_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Toast/PC/WBP_Com_ToastTitle_P.WBP_Com_ToastTitle_P\'",
  UIName = "ExploreToastTips",
  ZOrder = 10,
}
r4_0.FaultBlackTalkUI = {
  ConditionShowStateTags = r0_0.RT_5,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Story/Widget/WBP_Story_FaultBlack.WBP_Story_FaultBlack\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Story/Widget/WBP_Story_FaultBlack.WBP_Story_FaultBlack\'",
  System = "Story",
  UIName = "FaultBlackTalkUI",
  ZOrder = 53,
}
r4_0.FeinaChangeScene = {
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/Widget/FeinaEvent/WBP_Activity_FeinaEvent_ChangeScene.WBP_Activity_FeinaEvent_ChangeScene\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/Widget/FeinaEvent/WBP_Activity_FeinaEvent_ChangeScene.WBP_Activity_FeinaEvent_ChangeScene\'",
  Popup = true,
  UIName = "FeinaChangeScene",
  ZOrder = 60,
}
r4_0.FeinaEventHUD = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/Mobile/FeinaEvent/WBP_Activity_FeinaEvent_Hud_M.WBP_Activity_FeinaEvent_Hud_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/PC/FeinaEvent/WBP_Activity_FeinaEvent_Hud_P.WBP_Activity_FeinaEvent_Hud_P\'",
  System = "BattleSubsystem",
  UIName = "FeinaEventHUD",
}
r4_0.FeinaEventReward = {
  ConfigName = "OnlyUIMode",
  IsBanAccess = true,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/Widget/FeinaEvent/Reward/WBP_Activity_FeinaEvent_Reward.WBP_Activity_FeinaEvent_Reward\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/Widget/FeinaEvent/Reward/WBP_Activity_FeinaEvent_Reward.WBP_Activity_FeinaEvent_Reward\'",
  UIName = "FeinaEventReward",
  ZOrder = 59,
}
r4_0.ForgeCompenduim = {
  ConfigName = "StackAndUIMode",
  GlobalGameUITag = "Forge",
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Forging/Mobile/WBP_Forging_Compendium_M.WBP_Forging_Compendium_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Forging/PC/WBP_Forging_Compendium_P.WBP_Forging_Compendium_P\'",
  System = "Forge",
  UIName = "ForgeCompenduim",
  ZOrder = 56,
}
r4_0.ForgeMain = {
  ConfigName = "StackAndUIMode",
  GlobalGameUITag = "Forge",
  IsHideBattleUnit = 11,
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Forging/Mobile/WBP_Forging_Main_M.WBP_Forging_Main_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Forging/PC/WBP_Forging_Main_P.WBP_Forging_Main_P\'",
  Popup = true,
  System = "Forge",
  TabCoin = {
    101,
    1002
  },
  UIName = "ForgeMain",
  ZOrder = 55,
}
r4_0.ForgePathView = {
  ConfigName = "OnlyUIMode",
  GlobalGameUITag = "Forge",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Forging/Mobile/WBP_Forging_Compendium_ForgingPath_M.WBP_Forging_Compendium_ForgingPath_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Forging/PC/WBP_Forging_Compendium_ForgingPath_P.WBP_Forging_Compendium_ForgingPath_P\'",
  System = "Forge",
  UIName = "ForgePathView",
  ZOrder = 57,
}
r4_0.FortActivitySettlement = {
  ConditionShowStateTags = r0_0.RT_5,
  ConfigName = "OnlyUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/Mobile/Fort/WBP_Activity_Fort_Settlement_M.WBP_Activity_Fort_Settlement_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/PC/Fort/WBP_Activity_Fort_Settlement_P.WBP_Activity_Fort_Settlement_P\'",
  UIName = "FortActivitySettlement",
  ZOrder = 59,
}
r4_0.FriendDialog = {
  ConfigName = "UIModeAndForceShow",
  IsChat = true,
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Friend/Widget/WBP_Friend_Window.WBP_Friend_Window\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Friend/Widget/WBP_Friend_Window.WBP_Friend_Window\'",
  Params = r0_0.RT_2,
  System = "Friend",
  UIName = "FriendDialog",
}
r4_0.FriendMain = {
  ConfigName = "StackAndUIMode",
  IsChat = true,
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Friend/Mobile/WBP_Friend_Main_M.WBP_Friend_Main_M’",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Friend/PC/WBP_Friend_Main_P.WBP_Friend_Main_P\'",
  Params = r0_0.RT_2,
  Popup = true,
  System = "Friend",
  UIName = "FriendMain",
}
r4_0.GachaGetItemPage = {
  ConditionShowStateTags = r0_0.RT_5,
  ConfigName = "OnlyUIMode",
  IsBanAccess = true,
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/GachaNew/Widget/WBP_Gacha_NormalDraw.WBP_Gacha_NormalDraw\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/GachaNew/Widget/WBP_Gacha_NormalDraw.WBP_Gacha_NormalDraw\'",
  PauseAfterLoadingState = r0_0.RT_6,
  System = "Common",
  UIName = "GachaGetItemPage",
  ZOrder = 101,
}
r4_0.GachaGetItemPageSP = {
  ConditionShowStateTags = r0_0.RT_5,
  ConfigName = "OnlyUIMode",
  IsBanAccess = true,
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/GachaNew/Mobile/WBP_Gacha_ExclusiveDraw_M.WBP_Gacha_ExclusiveDraw_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/GachaNew/PC/WBP_Gacha_ExclusiveDraw_P.WBP_Gacha_ExclusiveDraw_P\'",
  PauseAfterLoadingState = r0_0.RT_6,
  System = "Common",
  UIName = "GachaGetItemPageSP",
  ZOrder = 101,
}
r4_0.GachaMain = {
  ConfigName = "StackAndUIMode",
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/GachaNew/Mobile/WBP_Gacha_M.WBP_Gacha_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/GachaNew/PC/WBP_Gacha_P.WBP_Gacha_P\'",
  Popup = true,
  System = "Gacha",
  TabCoin = {
    99,
    100
  },
  UIName = "GachaMain",
}
r4_0.GameReview = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/GameReview/WBP_GameReview_Main.WBP_GameReview_Main\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/GameReview/WBP_GameReview_Main.WBP_GameReview_Main\'",
  UIName = "GameReview",
  ZOrder = 105,
}
r4_0.GetCharPage = {
  ConditionShowStateTags = r0_0.RT_5,
  ConfigName = "OnlyUIMode",
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Get/Mobile/WBP_Get_Avatar_M.WBP_Get_Avatar_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Get/PC/WBP_Get_Avatar_P.WBP_Get_Avatar_P\'",
  SpecialUINameList = r0_0.RT_9,
  StateTag = 1,
  System = "Common",
  UIName = "GetCharPage",
  ZOrder = 99,
}
r4_0.GetItemPage = {
  ConditionShowStateTags = r0_0.RT_5,
  ConfigName = "OnlyUIMode",
  IsBanAccess = true,
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/WBP_Com_GetItem_M.WBP_Com_GetItem_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/WBP_Com_GetItem_P.WBP_Com_GetItem_P\'",
  PauseAfterLoadingState = r0_0.RT_6,
  SpecialUINameList = {
    "CharLevelUp_System",
    "SystemUnlockGuide"
  },
  StateTag = 1,
  System = "Common",
  UIName = "GetItemPage",
  ZOrder = 101,
}
r4_0.GetItemPageSP = {
  ConditionShowStateTags = r0_0.RT_5,
  ConfigName = "OnlyUIMode",
  IsBanAccess = true,
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/WBP_Com_GetItem_SP_M.WBP_Com_GetItem_SP_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/WBP_Com_GetItem_SP_P.WBP_Com_GetItem_SP_P\'",
  PauseAfterLoadingState = r0_0.RT_6,
  SpecialUINameList = r0_0.RT_9,
  StateTag = 1,
  System = "Common",
  UIName = "GetItemPageSP",
  ZOrder = 101,
}
r4_0.GetWeaponPage = {
  ConditionShowStateTags = r0_0.RT_5,
  ConfigName = "OnlyUIMode",
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Get/Mobile/WBP_Get_Weapon_M.WBP_Get_Weapon_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Get/PC/WBP_Get_Weapon_P.WBP_Get_Weapon_P\'",
  SpecialUINameList = r0_0.RT_9,
  StateTag = 1,
  System = "Common",
  UIName = "GetWeaponPage",
  ZOrder = 99,
}
r4_0.GlobalWebBrowser = {
  ConfigName = "UIModeAndForceShow",
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Menu/Widget/WBP_InnerWebBrowser.WBP_InnerWebBrowser\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Menu/Widget/WBP_InnerWebBrowser.WBP_InnerWebBrowser\'",
  Params = r0_0.RT_2,
  UIName = "GlobalWebBrowser",
  ZOrder = 101,
}
r4_0.GuideBook = {
  ConfigName = "OnlyUIMode",
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Guide/Mobile/WBP_Guide_GuideBook_Main_M.WBP_Guide_GuideBook_Main_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Guide/PC/WBP_Guide_GuideBook_Main_P.WBP_Guide_GuideBook_Main_P\'",
  Popup = true,
  UIName = "GuideBook",
}
r4_0.GuideBook_Tips = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Guide/Widget/WBP_Guide_GuideBook_HUDTips.WBP_Guide_GuideBook_HUDTips\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Guide/Widget/WBP_Guide_GuideBook_HUDTips.WBP_Guide_GuideBook_HUDTips\'",
  SpecialUINameList = {
    "CommonNewMonster",
    "AchievementPanel"
  },
  StateTag = 1,
  System = "Battle",
  UIName = "GuideBook_Tips",
  ZOrder = 20,
}
r4_0.GuideCountDown = {
  ConfigName = "OnlyForceShow",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Dungeon/Defense/WBP_Dungeon_DefenseCountDown.WBP_Dungeon_DefenseCountDown\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Dungeon/Defense/WBP_Dungeon_DefenseCountDown.WBP_Dungeon_DefenseCountDown\'",
  UIName = "GuideCountDown",
  ZOrder = 5,
}
r4_0.GuideGesture = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/UI_PC/Guide/Guide_Beginner_Phone.Guide_Beginner_Phone\'",
  PauseAfterLoadingState = r0_0.RT_10,
  System = "Guide",
  UIName = "GuideGesture",
  ZOrder = 102,
}
r4_0.GuideIconMain = {
  IsHideInImmersionMode = true,
  PCBPPath = "WidgetBlueprint\'/Game/UI/UI_PC/Guide/Guide_Point/WBP_Guide_Icon_Main.WBP_Guide_Icon_Main\'",
  UIName = "GuideIconMain",
}
r4_0.GuideMain = {
  ConditionShowStateTags = r0_0.RT_5,
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Guide/Mobile/WBP_Guide_Image_Main_M.WBP_Guide_Image_Main_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Guide/PC/WBP_Guide_Image_Main_P.WBP_Guide_Image_Main_P\'",
  PauseAfterLoadingState = r0_0.RT_10,
  SpecialUINameList = {
    "CommonNewMonster"
  },
  StateTag = 1,
  System = "Guide",
  UIName = "GuideMain",
  ZOrder = 31,
}
r4_0.GuideTextBox = {
  ConditionShowStateTags = r0_0.RT_5,
  ConfigName = "OnlyForceShow",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/UI_PC/Guide/Guide_UICharacter_PC.Guide_UICharacter_PC_C\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/UI_PC/Guide/Guide_UICharacter_PC.Guide_UICharacter_PC_C\'",
  PauseAfterLoadingState = r0_0.RT_10,
  System = "Guide",
  UIName = "GuideTextBox",
  ZOrder = 102,
}
r4_0.GuideTextFloatList = {
  PauseAfterLoadingState = r0_0.RT_10,
  System = "Guide",
  UIName = "GuideTextFloatList",
}
r4_0.GuideTouch = {
  ConfigName = "OnlyAllowMulti",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/UI_PC/Guide/Guide_HighLightBox_Dark_PC.Guide_HighLightBox_Dark_PC\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/UI_PC/Guide/Guide_HighLightBox_Dark_PC.Guide_HighLightBox_Dark_PC\'",
  PauseAfterLoadingState = r0_0.RT_10,
  System = "Guide",
  UIName = "GuideTouch",
  ZOrder = 103,
}
r4_0.GuildWarEnvironment = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/Widget/GuildWar/WBP_Activity_GuildWar_Environment.WBP_Activity_GuildWar_Environment\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/Widget/GuildWar/WBP_Activity_GuildWar_Environment.WBP_Activity_GuildWar_Environment\'",
  UIName = "GuildWarEnvironment",
  ZOrder = 56,
}
r4_0.GuildWarGroupConfirm = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/Widget/GuildWar/WBP_Activity_GuildWar_GroupConfirm.WBP_Activity_GuildWar_GroupConfirm\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/Widget/GuildWar/WBP_Activity_GuildWar_GroupConfirm.WBP_Activity_GuildWar_GroupConfirm\'",
  UIName = "GuildWarGroupConfirm",
  ZOrder = 56,
}
r4_0.GuildWarLevel = {
  ConfigName = "StackAndUIMode",
  IsHideBattleUnit = 11,
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/Mobile/GuildWar/WBP_Activity_GuildWar_LevelSelect_M.WBP_Activity_GuildWar_LevelSelect_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/PC/GuildWar/WBP_Activity_GuildWar_LevelSelect_P.WBP_Activity_GuildWar_LevelSelect_P\'",
  Popup = true,
  PopupInfoId = 100279,
  TabCoin = {
    217,
    218
  },
  UIName = "GuildWarLevel",
  ZOrder = 56,
}
r4_0.GuildWarRank = {
  ConfigName = "StackAndUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/Mobile/GuildWar/WBP_Activity_GuildWar_Ranking_M.WBP_Activity_GuildWar_Ranking_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/PC/GuildWar/WBP_Activity_GuildWar_Ranking_P.WBP_Activity_GuildWar_Ranking_P\'",
  UIName = "GuildWarRank",
}
r4_0.GuildWarRewardPop = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/Widget/GuildWar/WBP_Activity_GuildWar_Reward.WBP_Activity_GuildWar_Reward\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/Widget/GuildWar/WBP_Activity_GuildWar_Reward.WBP_Activity_GuildWar_Reward\'",
  UIName = "GuildWarRewardPop",
  ZOrder = 56,
}
r4_0.HardBossBattleOpen = {
  ConfigName = "UIModeAndNotAddToStack",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Play/Widget/HardBoss/WBP_Play_HardBoss_BattleOpen.WBP_Play_HardBoss_BattleOpen\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Play/Widget/HardBoss/WBP_Play_HardBoss_BattleOpen.WBP_Play_HardBoss_BattleOpen\'",
  Popup = true,
  System = "Hardboss",
  UIName = "HardBossBattleOpen",
  ZOrder = 66,
}
r4_0.HardBossLevelChoose = {
  ConfigName = "StackAndUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Play/Widget/HardBoss/WBP_Play_HardBoss_HardLevelChoose.WBP_Play_HardBoss_HardLevelChoose\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Play/Widget/HardBoss/WBP_Play_HardBoss_HardLevelChoose.WBP_Play_HardBoss_HardLevelChoose\'",
  Popup = true,
  System = "Hardboss",
  TabCoin = r0_0.RT_11,
  UIName = "HardBossLevelChoose",
  ZOrder = -2,
}
r4_0.HardBossMapTips = {
  IsBanAccess = true,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Play/Widget/HardBoss/WBP_Play_HardBoss_MapTips.WBP_Play_HardBoss_MapTips\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Play/Widget/HardBoss/WBP_Play_HardBoss_MapTips.WBP_Play_HardBoss_MapTips\'",
  Popup = true,
  System = "Hardboss",
  TabCoin = r0_0.RT_11,
  UIName = "HardBossMapTips",
  ZOrder = 5,
}
r4_0.HookInteractive = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Mobile/Unit/WBP_Battle_HookLock_M.WBP_Battle_HookLock_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/PC/WBP_Battle_HookLock_P.WBP_Battle_HookLock_P\'",
  UIName = "HookInteractive",
}
r4_0.HudBubbleL = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/WBP_Com_HudBubble_L.WBP_Com_HudBubble_L\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/WBP_Com_HudBubble_L.WBP_Com_HudBubble_L\'",
  System = "Guide",
  UIName = "HudBubbleL",
  ZOrder = 10,
}
r4_0.ImpressionDimensionResult = {
  ConditionShowStateTags = r0_0.RT_5,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Impression/Widget/WBP_Impression_DimensionResult.WBP_Impression_DimensionResult\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Impression/Widget/WBP_Impression_DimensionResult.WBP_Impression_DimensionResult\'",
  UIName = "ImpressionDimensionResult ",
  ZOrder = 10,
}
r4_0.ImpressionMainUI = {
  ConditionShowStateTags = r0_0.RT_5,
  IsBanAccess = true,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Impression/Mobile/WBP_Impression_M.WBP_Impression_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Impression/PC/WBP_Impression_P.WBP_Impression_P\'",
  System = "Story",
  UIName = "ImpressionMainUI",
  ZOrder = 10,
}
r4_0.ImpressionShop = {
  ConfigName = "StackAndUIMode",
  GlobalGameUITag = "Shop",
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Impression/Mobile/Shop/WBP_Impression_Shop_M.WBP_Impression_Shop_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Impression/PC/Shop/WBP_Impression_Shop_P.WBP_Impression_Shop_P_C\'",
  Popup = true,
  UIName = "ImpressionShop",
}
r4_0.InBattleWheelMenu = {
  KeyboardSetName = "InBattleWheel",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Mobile/WBP_Battle_Menu_M.WBP_Battle_Menu_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/PC/WBP_Battle_Menu_P.WBP_Battle_Menu_P\'",
  Params = {
    BehaviourType = 1,
  },
  System = "Battle",
  UIName = "InBattleWheelMenu",
  ZOrder = 50,
}
r4_0.InteractiveUI = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Mobile/WBP_Battle_Interactive_M.WBP_Battle_Interactive_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/PC/WBP_Battle_Interactive_P.WBP_Battle_Interactive_P\'",
  System = "Battle",
  UIName = "InteractiveUI",
  ZOrder = 20,
}
r4_0.ItemInformation = {
  ConfigName = "UIModeAndNotAddToStack",
  IsStopGame = 1,
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Dialog/WBP_Com_DialogStory.WBP_Com_DialogStory\'",
  System = "Battle",
  UIName = "ItemInformation",
  ZOrder = 102,
}
r4_0.LayoutPlan = {
  ConfigName = "StackAndUIMode",
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Mobile/WBP_Battle_LayoutPlan_M.WBP_Battle_LayoutPlan_M\'",
  PauseAfterLoadingState = {
    "LayoutPlan"
  },
  Popup = true,
  UIName = "LayoutPlan",
  ZOrder = 101,
}
r4_0.LevelMapMain = {
  ConfigName = "StackAndFullScreen",
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Map/Mobile/WBP_Map_M.WBP_Map_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Map/PC/WBP_Map_P.WBP_Map_P\'",
  Popup = true,
  UIName = "LevelMapMain",
  ZOrder = 50,
}
r4_0.Loading = {
  UIName = "Loading",
  ZOrder = 105,
}
r4_0.LoadingReconnect = {
  ConditionShowStateTags = r0_0.RT_5,
  ConfigName = "OnlyForceShow",
  IsStopGame = 1,
  KeyboardSetName = "LoadingReconnect",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/UI_PC/Login/Loading_Reconnect.Loading_Reconnect\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/UI_PC/Login/Loading_Reconnect.Loading_Reconnect\'",
  System = "Battle",
  UIName = "LoadingReconnect",
  ZOrder = 106,
}
r4_0.LoginMainPage = {
  ConfigName = "OnlyUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Login/Widget/WBP_Login_Main.WBP_Login_Main\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Login/Widget/WBP_Login_Main.WBP_Login_Main\'",
  Popup = true,
  UIName = "LoginMainPage",
}
r4_0.LoginPatchPage = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/UI_PC/Login/Login_Patch_PC.Login_Patch_PC\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/UI_PC/Login/Login_Patch_PC.Login_Patch_PC\'",
  UIName = "LoginPatchPage",
}
r4_0.MailMain = {
  ConfigName = "StackAndUIMode",
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Mail/Mobile/WBP_Mail_Main_M.WBP_Mail_Main_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Mail/PC/WBP_Mail_Main_P.WBP_Mail_Main_P\'",
  Popup = true,
  UIName = "MailMain",
  ZOrder = 55,
}
r4_0.MenuBattle = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Menu/Mobile/WBP_Menu_Battle_M.WBP_Menu_Battle_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Menu/PC/WBP_Menu_Battle_P.WBP_Menu_Battle_P\'",
  UIName = "MenuBattle",
  ZOrder = 52,
}
r4_0.MenuLevel = {
  ConfigName = "StackAndUIMode",
  IsBanAccess = true,
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Menu/Mobile/WBP_Menu_Battle_M.WBP_Menu_Battle_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Menu/PC/WBP_Menu_Battle_P.WBP_Menu_Battle_P\'",
  Params = r0_0.RT_13,
  UIName = "MenuLevel",
  ZOrder = 52,
}
r4_0.MenuWorld = {
  ConfigName = "StackAndUIMode",
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Menu/Mobile/WBP_Menu_World_M.WBP_Menu_World_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Menu/PC/WBP_Menu_World_P.WBP_Menu_World_P\'",
  Params = r0_0.RT_13,
  UIName = "MenuWorld",
  ZOrder = 52,
}
r4_0.ModArchiveMain = {
  ConfigName = "StackAndUIMode",
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/ModArchive/Mobile/WBP_ModArchive_Main_M.WBP_ModArchive_Main_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/ModArchive/PC/WBP_ModArchive_Main_P.WBP_ModArchive_Main_P\'",
  Popup = true,
  System = "ModArchive",
  TabCoin = {
    211
  },
  UIName = "ModArchiveMain",
}
r4_0.ModArchiveTaskTips = {
  ConfigName = "OnlyAllowMulti",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/ModArchive/Widget/WBP_ModArchive_HudTips.WBP_ModArchive_HudTips\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/ModArchive/Widget/WBP_ModArchive_HudTips.WBP_ModArchive_HudTips\'",
  SpecialUINameList = r0_0.RT_8,
  StateTag = 1,
  System = "ModArchive",
  UIName = "ModArchiveTaskTips",
}
r4_0.ModArchiveUpdateTips = {
  ConfigName = "OnlyUIMode",
  IsBanAccess = true,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/ModArchive/Widget/WBP_ModArchive_UpdateTips.WBP_ModArchive_UpdateTips\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/ModArchive/Widget/WBP_ModArchive_UpdateTips.WBP_ModArchive_UpdateTips\'",
  Popup = true,
  System = "ModArchive",
  UIName = "ModArchiveUpdateTips",
}
r4_0.MonsterDetailInfo = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Play/Widget/Depute/WBP_Play_DeputeMonsterInfo.WBP_Play_DeputeMonsterInfo\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Play/Widget/Depute/WBP_Play_DeputeMonsterInfo.WBP_Play_DeputeMonsterInfo\'",
  UIName = "MonsterDetailInfo",
  ZOrder = 56,
}
r4_0.MonthCardPop = {
  ConfigName = "StackAndUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Shop/Widget/MonthCardPopUp/WBP_MonthCard_PopUp.WBP_MonthCard_PopUp\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Shop/Widget/MonthCardPopUp/WBP_MonthCard_PopUp.WBP_MonthCard_PopUp\'",
  PauseAfterLoadingState = r0_0.RT_14,
  UIName = "MonthCardPop",
  ZOrder = 51,
}
r4_0.Morse = {
  ConfigName = "StackAndUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/MiniGame/Mobile/WBP_MiniGame_Mima_M.WBP_MiniGame_Mima_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/MiniGame/PC/WBP_MiniGame_Mima_P.WBP_MiniGame_Mima_P\'",
  Popup = true,
  UIName = "Morse",
}
r4_0.MountsMain = {
  ConfigName = "StackAndUIMode",
  IsHideBattleUnit = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Mounts/Mobile/WBP_MountsMain_M.WBP_MountsMain_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Mounts/PC/WBP_MountsMain_P.WBP_MountsMain_P\'",
  UIName = "MountsMain",
}
r4_0.MultiplayerChallenge = {
  ConfigName = "StackAndUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/AreaCoop/Widget/WBP_AreaCoop_LevelChoose.WBP_AreaCoop_LevelChoose\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/AreaCoop/Widget/WBP_AreaCoop_LevelChoose.WBP_AreaCoop_LevelChoose\'",
  Popup = true,
  UIName = "MultiplayerChallenge",
  ZOrder = -2,
}
r4_0.NearDeathBlood = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Mobile/WBP_Battle_NearDeath_M.WBP_Battle_NearDeath_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/PC/WBP_Battle_NearDeath_P.WBP_Battle_NearDeath_P\'",
  Params = {
    FirstLevelFactor = 1,
    SecondLevelBloodStrength = 0.15,
    SecondLevelFactor = 2,
    ShowUIBloodStrength = 0.3,
  },
  System = "Battle",
  UIName = "NearDeathBlood",
  ZOrder = 8,
}
r4_0.NetDisConnectedDialog = {
  ConditionShowStateTags = r0_0.RT_5,
  ConfigName = "UIModeAndForceShow",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Dialog/WBP_Com_Dialog.WBP_Com_Dialog\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Dialog/WBP_Com_Dialog.WBP_Com_Dialog\'",
  System = "Common",
  UIName = "NetDisConnectedDialog",
  ZOrder = 110,
}
r4_0.NpcBiography = {
  ConditionShowStateTags = r0_0.RT_5,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Story/Widget/WBP_Story_NPC.WBP_Story_NPC_C\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Story/Widget/WBP_Story_NPC.WBP_Story_NPC_C\'",
  UIName = "NpcBiography",
  ZOrder = 40,
}
r4_0.NpcSwitchMain = {
  ConfigName = "StackAndUIMode",
  IsHideBattleUnit = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Invitation/Mobile/WBP_Invitation_M.WBP_Invitation_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Invitation/PC/WBP_Invitation_P.WBP_Invitation_P\'",
  Popup = true,
  UIName = "NpcSwitchMain",
  ZOrder = 55,
}
r4_0.PayGiftPopup_Purple = {
  ConfigName = "OnlyUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Shop/Mobile/WBP_Shop_Gift_PopUp_Purple_M.WBP_Shop_Gift_PopUp_Purple_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Shop/PC/WBP_Shop_Gift_PopUp_Purple_P.WBP_Shop_Gift_PopUp_Purple_P\'",
  System = "Shop",
  UIName = "PayGiftPopup_Purple",
  ZOrder = 56,
}
r4_0.PayGiftPopup_Yellow = {
  ConfigName = "OnlyUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Shop/Mobile/WBP_Shop_Gift_PopUp_Yellow_M.WBP_Shop_Gift_PopUp_Yellow_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Shop/PC/WBP_Shop_Gift_PopUp_Yellow_P.WBP_Shop_Gift_PopUp_Yellow_P\'",
  System = "Shop",
  UIName = "PayGiftPopup_Yellow",
  ZOrder = 56,
}
r4_0.PersonInfoPageMain = {
  ConfigName = "StackAndUIMode",
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/PersonalInfo/Mobile/WBP_PersonalInfo_Root_M.WBP_PersonalInfo_Root_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/PersonalInfo/PC/WBP_PersonalInfo_Root_P.WBP_PersonalInfo_Root_P\'",
  Popup = true,
  SpecialUINameList = {
    "ChatMain"
  },
  StateTag = 1,
  System = "PersonInfo",
  UIName = "PersonInfoPageMain",
  ZOrder = 55,
}
r4_0.PetCapture = {
  ConfigName = "OnlyUIMode",
  IsBanAccess = true,
  IsHideBattleUnit = 1,
  IsHideDrop = true,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Pet_Capture/Mobile/WBP_Pet_Capture_M.WBP_Pet_Capture_M_C\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Pet_Capture/PC/WBP_Pet_Capture_P.WBP_Pet_Capture_P_C\'",
  Popup = true,
  UIName = "PetCapture",
  ZOrder = -2,
}
r4_0.PetCaptureDetail = {
  IsHideBattleUnit = 1,
  IsHideDrop = true,
  IsStopGame = 1,
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Pet_Capture/Widget/WBP_Pet_Capture_Detail.WBP_Pet_Capture_Detail_C\'",
  UIName = "PetCaptureDetail",
  ZOrder = 28,
}
r4_0.PetEnhance = {
  ConfigName = "StackAndUIMode",
  IsHideBattleUnit = 1,
  IsHideDrop = true,
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/Mobile/WBP_Armory_PetEnhance_M.WBP_Armory_PetEnhance_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/PC/WBP_Armory_PetEnhance_P.WBP_Armory_PetEnhance_P\'",
  Popup = true,
  UIName = "PetEnhance",
}
r4_0.PetEntry = {
  ConfigName = "StackAndUIMode",
  GlobalGameUITag = "Armory",
  IsHideBattleUnit = 1,
  IsHideDrop = true,
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/Mobile/WBP_Armory_PetArchive_M.WBP_Armory_PetArchive_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/PC/WBP_Armory_PetArchive_P.WBP_Armory_PetArchive_P\'",
  Popup = true,
  System = "Armory",
  UIName = "PetEntry",
}
r4_0.PetMix = {
  ConfigName = "StackAndUIMode",
  GlobalGameUITag = "Armory",
  IsHideBattleUnit = 1,
  IsHideDrop = true,
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/Mobile/WBP_Armory_PetMix_M.WBP_Armory_PetMix_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/PC/WBP_Armory_PetMix_P.WBP_Armory_PetMix_P\'",
  Params = r0_0.RT_2,
  Popup = true,
  System = "Armory",
  UIName = "PetMix",
}
r4_0.PetMixEntry = {
  ConfigName = "StackAndUIMode",
  GlobalGameUITag = "Armory",
  IsHideBattleUnit = 1,
  IsHideDrop = true,
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/Mobile/WBP_Armory_PetArchive_M.WBP_Armory_PetArchive_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/PC/WBP_Armory_PetArchive_P.WBP_Armory_PetArchive_P\'",
  Popup = true,
  System = "Armory",
  UIName = "PetMixEntry",
}
r4_0.PhotoCameraMain = {
  ConfigName = "StackAndUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Camera/Mobile/WBP_Camera_M.WBP_Camera_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Camera/PC/WBP_Camera_P.WBP_Camera_P\'",
  Popup = true,
  UIName = "PhotoCameraMain",
  ZOrder = 55,
}
r4_0.PianoSystem = {
  ConfigName = "StackAndUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Piano/Mobile/WBP_Piano_Main_M.WBP_Piano_Main_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Piano/PC/WBP_Piano_Main_P.WBP_Piano_Main_P\'",
  System = "Piano",
  UIName = "PianoSystem",
}
r4_0.QTE = {
  ConditionShowStateTags = r0_0.RT_5,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Story/Mobile/WBP_Story_QTE_M.WBP_Story_QTE_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Story/PC/WBP_Story_QTE_P.WBP_Story_QTE_P\'",
  UIName = "QTE",
}
r4_0.ReasoningCollect = {
  ConditionShowStateTags = r0_0.RT_5,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Reasoning/Mobile/WBP_Reasoning_Collect_M.WBP_Reasoning_Collect_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Reasoning/PC/WBP_Reasoning_Collect_P.WBP_Reasoning_Collect_P\'",
  UIName = "ReasoningCollect",
  ZOrder = 50,
}
r4_0.ReasoningItemInformation = {
  ConfigName = "UIModeAndNotAddToStack",
  IsStopGame = 1,
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Reasoning/Widget/WBP_Reasoning_Dialog.WBP_Reasoning_Dialog\'",
  System = "Battle",
  UIName = "ReasoningItemInformation",
  ZOrder = 102,
}
r4_0.RechargeRebateTips = {
  ConfigName = "OnlyUIMode",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/Widget/RechargeRebate/WBP_Activity_RechargeRebate_Tips.WBP_Activity_RechargeRebate_Tips\'",
  UIName = "RechargeRebateTips",
}
r4_0.RecoverUI = {
  ConfigName = "UIModeAndForceShow",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/ActionPoint/WBP_AP_Dialog.WBP_AP_Dialog\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/ActionPoint/WBP_AP_Dialog.WBP_AP_Dialog\'",
  UIName = "RecoverUI",
  ZOrder = 99,
}
r4_0.RegionCoDefenceProgress = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/Task_Process/WBP_Battle_ProcessEscape.WBP_Battle_ProcessEscape\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/Task_Process/WBP_Battle_ProcessEscape.WBP_Battle_ProcessEscape\'",
  UIName = "RegionCoDefenceProgress",
}
r4_0.RegionHijackFloatPanel = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/Task_Process/WBP_Battle_ProcessEscort.WBP_Battle_ProcessEscort\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/Task_Process/WBP_Battle_ProcessEscort.WBP_Battle_ProcessEscort\'",
  UIName = "RegionHijackFloatPanel",
}
r4_0.RegionMapImpression = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Map/Mobile/WBP_Map_ImpressionPage_M.WBP_Map_ImpressionPage_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Map/PC/WBP_Map_ImpressionPage_P.WBP_Map_ImpressionPage_P\'",
  UIName = "RegionMapImpression",
  ZOrder = 59,
}
r4_0.RegionMultiDestroyProgress = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/Task_Process/WBP_Battle_ProcessOverload.WBP_Battle_ProcessOverload\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/Task_Process/WBP_Battle_ProcessOverload.WBP_Battle_ProcessOverload\'",
  UIName = "RegionMultiDestroyProgress",
}
r4_0.RegionOnlineFloat = {
  ConfigName = "OnlyForceShow",
  IsHideInImmersionMode = true,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Toast/Mobile/WBP_Com_ToastOnline_M.WBP_Com_ToastOnline_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Toast/PC/WBP_Com_ToastOnline_P.WBP_Com_ToastOnline_P\'",
  System = "Common",
  UIName = "RegionOnlineFloat",
}
r4_0.RegionResurgence = {
  KeyboardSetName = "DeadInRegion",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/WBP_Battle_Resurrection.WBP_Battle_Resurrection\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/WBP_Battle_Resurrection.WBP_Battle_Resurrection\'",
  SpecialUINameList = {
    "BattleMain",
    "MenuLevel",
    "MenuWorld",
    "DungeonBlackScreen",
    "DungeonSettlement",
    "Setting",
    "TaskIndicator",
    "Vote",
    "SkillDetails",
    "LoadingReconnect",
    "HardBossBattleOpen",
    "RougeSettlement",
    "DungeonSabotageChallenge",
    "CommonBlackScreen",
    "GuideMain",
    "CommonDialog"
  },
  StateTag = 4,
  System = "Battle",
  UIName = "RegionResurgence",
  ZOrder = 50,
}
r4_0.RougeArchiveEvent = {
  ConfigName = "OnlyUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/Mobile/Archive/WBP_Rougelike_Archive_Event_M.WBP_Rougelike_Archive_Event_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/PC/Archive/WBP_Rougelike_Archive_Event_P.WBP_Rougelike_Archive_Event_P\'",
  UIName = "RougeArchiveEvent",
  ZOrder = 56,
}
r4_0.RougeArchiveReward = {
  ConfigName = "OnlyUIMode",
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/Widget/Archive/WBP_RougeLike_ArchiveReward.WBP_RougeLike_ArchiveReward\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/Widget/Archive/WBP_RougeLike_ArchiveReward.WBP_RougeLike_ArchiveReward\'",
  UIName = "RougeArchiveReward",
  ZOrder = 100,
}
r4_0.RougeArchiveStory = {
  ConfigName = "OnlyUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/Mobile/Archive/WBP_RougeLike_Archive_StoryLine_M.WBP_RougeLike_Archive_StoryLine_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/PC/Archive/WBP_RougeLike_Archive_StoryLine_P.WBP_RougeLike_Archive_StoryLine_P\'",
  UIName = "RougeArchiveStory",
  ZOrder = 56,
}
r4_0.RougeBag = {
  ConfigName = "OnlyUIMode",
  GlobalGameUITag = "RougeBag",
  IsHideBattleUnit = 1,
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/Mobile/CheckDetail/WBP_Rouge_CheckDetail_M.WBP_Rouge_CheckDetail_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/PC/CheckDetail/WBP_Rouge_CheckDetail_P.WBP_Rouge_CheckDetail_P\'",
  Popup = true,
  TabCoin = r0_0.RT_15,
  UIName = "RougeBag",
  ZOrder = 60,
}
r4_0.RougeBagItemPopUp = {
  ConfigName = "OnlyUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/Mobile/CheckDetail/WBP_Rouge_CheckDetailPopUp_M.WBP_Rouge_CheckDetailPopUp_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/PC/CheckDetail/WBP_Rouge_CheckDetailPopUp_P.WBP_Rouge_CheckDetailPopUp_P\'",
  UIName = "RougeBagItemPopUp",
  ZOrder = 62,
}
r4_0.RougeGameSettlement = {
  ConfigName = "OnlyUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/Mobile/WBP_Rouge_GameSettlement_M.WBP_Rouge_GameSettlement_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/PC/WBP_Rouge_GameSettlement_P.WBP_Rouge_GameSettlement_P\'",
  UIName = "RougeGameSettlement",
  ZOrder = 102,
}
r4_0.RougeGetItemsTip = {
  ConfigName = "OnlyUIMode",
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/Mobile/GetItemTips/WBP_Rouge_GetItemTips_M.WBP_Rouge_GetItemTips_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/PC/GetItemTips/WBP_Rouge_GetItemTips_P.WBP_Rouge_GetItemTips_P\'",
  UIName = "RougeGetItemsTip",
  ZOrder = 99,
}
r4_0.RougeItemDetailPopUp = {
  ConfigName = "OnlyUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/Mobile/CheckDetail/WBP_Rouge_CheckDetail_PopUp_M.WBP_Rouge_CheckDetail_PopUp_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/PC/CheckDetail/WBP_Rouge_CheckDetail_PopUp_P.WBP_Rouge_CheckDetail_PopUp_P\'",
  UIName = "RougeItemDetailPopUp",
  ZOrder = 62,
}
r4_0.RougeLikeContractPanel = {
  ConfigName = "OnlyUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/Mobile/WBP_Rouge_Heat_M.WBP_Rouge_Heat_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/PC/WBP_Rouge_Heat_P.WBP_Rouge_Heat_P\'",
  UIName = "RougeLikeContractPanel",
  ZOrder = 58,
}
r4_0.RougeLikeEnterToastUI = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/Widget/WBP_Rouge_EnterToast.WBP_Rouge_EnterToast_C\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/Widget/WBP_Rouge_EnterToast.WBP_Rouge_EnterToast_C\'",
  SpecialUINameList = {
    "CharLevelUp"
  },
  StateTag = 1,
  System = "Battle",
  UIName = "RougeLikeEnterToastUI",
  ZOrder = 5,
}
r4_0.RougeLikeMenuContractPanel = {
  ConfigName = "OnlyUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/Mobile/WBP_Rouge_MenuHeatPage_M.WBP_Rouge_MenuHeatPage_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/PC/WBP_Rouge_MenuHeatPage_P.WBP_Rouge_MenuHeatPage_P\'",
  UIName = "RougeLikeMenuContractPanel",
  ZOrder = 58,
}
r4_0.RougeMain = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/PC/WBP_Rouge_Main_P.WBP_Rouge_Main_P\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/PC/WBP_Rouge_Main_P.WBP_Rouge_Main_P\'",
  TabCoin = r0_0.RT_16,
  UIName = "RougeMain",
  ZOrder = 50,
}
r4_0.RougeReward = {
  ConfigName = "OnlyUIMode",
  IsBanAccess = true,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/Widget/Reward/WBP_Rouge_Reward.WBP_Rouge_Reward\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/Widget/Reward/WBP_Rouge_Reward.WBP_Rouge_Reward\'",
  UIName = "RougeReward",
  ZOrder = 59,
}
r4_0.RougeSettlement = {
  ConfigName = "OnlyUIMode",
  IsBanAccess = true,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/Mobile/WBP_Rouge_Settlement_M.WBP_Rouge_Settlement_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/PC/WBP_Rouge_Settlement_P.WBP_Rouge_Settlement_P\'",
  UIName = "RougeSettlement",
  ZOrder = 102,
}
r4_0.RougeShop = {
  ConfigName = "StackAndUIMode",
  GlobalGameUITag = "RougeShop",
  IsHideBattleUnit = 1,
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/Mobile/Shop/WBP_Rouge_Shop_M.WBP_Rouge_Shop_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/PC/Shop/WBP_Rouge_Shop_P.WBP_Rouge_Shop_P\'",
  Popup = true,
  TabCoin = r0_0.RT_15,
  UIName = "RougeShop",
  ZOrder = 60,
}
r4_0.RougeTalentMenu = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/PC/TalentTree/WBP_Rouge_TalentMenu_P.WBP_Rouge_TalentMenu_P\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/PC/TalentTree/WBP_Rouge_TalentMenu_P.WBP_Rouge_TalentMenu_P\'",
  TabCoin = r0_0.RT_16,
  UIName = "RougeTalentMenu",
}
r4_0.RougeTalentPage = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/Mobile/TalentTree/WBP_Rouge_TalentPage_M.WBP_Rouge_TalentPage_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/PC/TalentTree/WBP_Rouge_TalentPage_P.WBP_Rouge_TalentPage_P\'",
  TabCoin = r0_0.RT_16,
  UIName = "RougeTalentPage",
  ZOrder = 50,
}
r4_0.RougeTransition = {
  KeyboardSetName = "InDeliver",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/Widget/WBP_Rouge_Transition.WBP_Rouge_Transition\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/Widget/WBP_Rouge_Transition.WBP_Rouge_Transition\'",
  Popup = true,
  UIName = "RougeTransition",
}
r4_0.RougeTransitionBoss = {
  KeyboardSetName = "InDeliver",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/Widget/WBP_Rouge_Transition_Boss.WBP_Rouge_Transition_Boss\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/Widget/WBP_Rouge_Transition_Boss.WBP_Rouge_Transition_Boss\'",
  Popup = true,
  UIName = "RougeTransitionBoss",
}
r4_0.Rouge_BattleProgress = {
  ConfigName = "OnlyForceShow",
  MobileBPPath = "/Game/UI/WBP/RougeLike/Widget/WBP_Rouge_Annihilate.WBP_Rouge_Annihilate_C",
  PCBPPath = "/Game/UI/WBP/RougeLike/Widget/WBP_Rouge_Annihilate.WBP_Rouge_Annihilate_C",
  UIName = "Rouge_BattleProgress",
}
r4_0.Rouge_Blessing_3Choose1 = {
  ConfigName = "OnlyUIMode",
  IsStopGame = 1,
  MobileBPPath = "/Game/UI/WBP/RougeLike/Mobile/3Choose1/WBP_Rouge_Blessing3Choose1_M.WBP_Rouge_Blessing3Choose1_M_C",
  PCBPPath = "/Game/UI/WBP/RougeLike/PC/3Choose1/WBP_Rouge_Blessing3Choose1_P.WBP_Rouge_Blessing3Choose1_P_C",
  UIName = "Rouge_Blessing_3Choose1",
  ZOrder = 58,
}
r4_0.Rouge_Definition = {
  ConfigName = "OnlyUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/Mobile/CheckDetail/WBP_Rouge_CheckDetail_Definition_PopUp_M.WBP_Rouge_CheckDetail_Definition_PopUp_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/PC/CheckDetail/WBP_Rouge_CheckDetail_Definition_PopUp_P.WBP_Rouge_CheckDetail_Definition_PopUp_P\'",
  UIName = "Rouge_Definition",
  ZOrder = 105,
}
r4_0.Rouge_Event_Main = {
  ConfigName = "OnlyUIMode",
  IsStopGame = 1,
  MobileBPPath = "/Game/UI/WBP/RougeLike/Mobile/Event/WBP_Rouge_Event_New_M.WBP_Rouge_Event_New_M_C",
  PCBPPath = "/Game/UI/WBP/RougeLike/PC/Event/WBP_Rouge_Event_New_P.WBP_Rouge_Event_New_P_C",
  UIName = "Rouge_Event_Main",
  ZOrder = 57,
}
r4_0.Rouge_SuitActivate = {
  ConfigName = "OnlyUIMode",
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/Mobile/Suit/WBP_Rouge_Suit_Activate_M.WBP_Rouge_Suit_Activate_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/PC/Suit/WBP_Rouge_Suit_Activate_P.WBP_Rouge_Suit_Activate_P\'",
  UIName = "Rouge_SuitActivate",
  ZOrder = 65,
}
r4_0.Rouge_SuitDetail = {
  ConfigName = "OnlyUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/Widget/Suit/WBP_Rouge_SuitDetail.WBP_Rouge_SuitDetail\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/RougeLike/Widget/Suit/WBP_Rouge_SuitDetail.WBP_Rouge_SuitDetail\'",
  UIName = "Rouge_SuitDetail",
  ZOrder = 65,
}
r4_0.Rouge_Treasure_3Choose1 = {
  ConfigName = "OnlyUIMode",
  IsStopGame = 1,
  MobileBPPath = "/Game/UI/WBP/RougeLike/Mobile/3Choose1/WBP_Rouge_Treasure3Choose1_M.WBP_Rouge_Treasure3Choose1_M_C",
  PCBPPath = "/Game/UI/WBP/RougeLike/PC/3Choose1/WBP_Rouge_Treasure3Choose1_P.WBP_Rouge_Treasure3Choose1_P_C",
  UIName = "Rouge_Treasure_3Choose1",
  ZOrder = 58,
}
r4_0.SWSCannonHUD = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Progress/WBP_Com_ProgressOrgan.WBP_Com_ProgressOrgan\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Progress/WBP_Com_ProgressOrgan.WBP_Com_ProgressOrgan\'",
  System = "BattleSubsystem",
  UIName = "SWSCannonHUD",
}
r4_0.SaiqiFantasy = {
  ConditionShowStateTags = r0_0.RT_5,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Story/Widget/WBP_Story_Transition_SaiqiFantasy.WBP_Story_Transition_SaiqiFantasy\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Story/Widget/WBP_Story_Transition_SaiqiFantasy.WBP_Story_Transition_SaiqiFantasy\'",
  UIName = "SaiqiFantasy",
}
r4_0.SelectRole = {
  ConfigName = "OnlyUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/SelectRole/Mobile/WBP_SelectRole_M.WBP_SelectRole_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/SelectRole/PC/WBP_SelectRole_P.WBP_SelectRole_P\'",
  UIName = "SelectRole",
}
r4_0.Setting = {
  ConfigName = "StackAndUIMode",
  IsHideBattleUnit = 1,
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Set/Mobile/WBP_Set_Main_M.WBP_Set_Main_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Set/PC/WBP_Set_Main_P.WBP_Set_Main_P\'",
  Popup = true,
  System = "Set",
  UIName = "Setting",
  ZOrder = 55,
}
r4_0.ShopActivity = {
  ConfigName = "StackAndUIMode",
  GlobalGameUITag = "Shop",
  IsHideBattleUnit = 1,
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/Mobile/Shop/WBP_Activity_Store_M.WBP_Activity_Store_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/PC/Shop/WBP_Activity_Store_P.WBP_Activity_Store_P\'",
  Popup = true,
  System = "Shop",
  TabCoin = r0_0.RT_17,
  UIName = "ShopActivity",
  ZOrder = 55,
}
r4_0.ShopMain = {
  ConfigName = "StackAndUIMode",
  GlobalGameUITag = "Shop",
  IsHideBattleUnit = 11,
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Shop/Mobile/WBP_Shop_Main_M.WBP_Shop_Main_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Shop/PC/WBP_Shop_Main_P.WBP_Shop_Main_P\'",
  Popup = true,
  System = "Shop",
  TabCoin = r0_0.RT_17,
  UIName = "ShopMain",
  ZOrder = 55,
}
r4_0.ShuiFa = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/MiniGame/Mobile/WBP_MiniGame_ShuifaMain_M.WBP_MiniGame_ShuifaMain_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/MiniGame/PC/WBP_MiniGame_ShuifaMain_P.WBP_MiniGame_ShuifaMain_P\'",
  System = "Battle",
  UIName = "ShuiFa",
  ZOrder = 50,
}
r4_0.SimpleTalkUI = {
  ConditionShowStateTags = r0_0.RT_5,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Story/Mobile/WBP_Story_SimpleTalk_M.WBP_Story_SimpleTalk_M_C\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Story/PC/WBP_Story_SimpleTalk_P.WBP_Story_SimpleTalk_P_C\'",
  System = "Story",
  UIName = "SimpleTalkUI",
  ZOrder = 10,
}
r4_0.SkillDetails = {
  ConfigName = "StackAndUIMode",
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/Mobile/WBP_Armory_CharSkillDetail_M.WBP_Armory_CharSkillDetail_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/PC/WBP_Armory_CharSkillDetail_P.WBP_Armory_CharSkillDetail_P\'",
  Popup = true,
  System = "BattleSubsystem",
  UIName = "SkillDetails",
  ZOrder = 55,
}
r4_0.SkinPreview = {
  ConfigName = "StackAndUIMode",
  IsHideBattleUnit = 1,
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Shop/Mobile/WBP_Shop_SkinPreview_M.WBP_Shop_SkinPreview_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Shop/PC/WBP_Shop_SkinPreview_P.WBP_Shop_SkinPreview_P\'",
  UIName = "SkinPreview",
  ZOrder = 61,
}
r4_0.SpecialBossSkillToast = {
  ConditionShowStateTags = r0_0.RT_5,
  IgnoreHideTags = r0_0.RT_7,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Toast/Widget/WBP_Com_ToastBossSpecialSkillWarning.WBP_Com_ToastBossSpecialSkillWarning\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Toast/Widget/WBP_Com_ToastBossSpecialSkillWarning.WBP_Com_ToastBossSpecialSkillWarning\'",
  UIName = "SpecialBossSkillToast",
}
r4_0.SquadMainUI = {
  ConfigName = "StackAndUIMode",
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Build/Mobile/WBP_Build_Main_M.WBP_Build_Main_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Build/PC/WBP_Build_Main_P.WBP_Build_Main_P\'",
  System = "Armory",
  UIName = "SquadMainUI",
}
r4_0.SquadMainUINew = {
  ConfigName = "StackAndUIMode",
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Build/Mobile/WBP_Build_Main_New_M.WBP_Build_Main_New_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Build/PC/WBP_Build_Main_New_P.WBP_Build_Main_New_P\'",
  System = "Armory",
  UIName = "SquadMainUINew",
}
r4_0.StoryBattleFail = {
  ConfigName = "StackAndUIMode",
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Settlement/Mobile/WBP_Settlement_BossFail_M.WBP_Settlement_BossFail_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Settlement/PC/WBP_Settlement_BossFail_P.WBP_Settlement_BossFail_P\'",
  Popup = true,
  UIName = "StoryBattleFail",
}
r4_0.StoryInteractiveUI = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Story/Mobile/WBP_Story_Interactive_M.WBP_Story_Interactive_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Story/PC/WBP_Story_Interactive_P.WBP_Story_Interactive_P\'",
  Popup = true,
  UIName = "StoryInteractiveUI",
}
r4_0.StoryReviewMain = {
  ConditionShowStateTags = r0_0.RT_5,
  ConfigName = "StackAndUIMode",
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Story_Review/Mobile/WBP_Story_Review_Main_M.WBP_Story_Review_Main_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Story_Review/PC/WBP_Story_Review_Main_P.WBP_Story_Review_Main_P\'",
  Popup = true,
  UIName = "StoryReviewMain",
  ZOrder = 54,
}
r4_0.StoryWeaponSelect = {
  ConditionShowStateTags = r0_0.RT_5,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Story/Widget/BP_Story_WeaponSelect.BP_Story_WeaponSelect\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Story/Widget/BP_Story_WeaponSelect.BP_Story_WeaponSelect\'",
  UIName = "StoryWeaponSelect",
}
r4_0.StyleOfPlay = {
  CombatconditionIdList = {
    506
  },
  ConfigName = "StackAndUIMode",
  GlobalGameUITag = "Play",
  IsChat = true,
  IsHideBattleUnit = 11,
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Play/Mobile/WBP_Play_Entry_M.WBP_Play_Entry_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Play/PC/WBP_Play_Entry_P.WBP_Play_Entry_P\'",
  PauseAfterLoadingState = r0_0.RT_1,
  Popup = true,
  System = "Play",
  TabCoin = r0_0.RT_11,
  UIName = "StyleOfPlay",
  ZOrder = 56,
}
r4_0.SubSystemUnlock = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Guide/Widget/WBP_Guide_SubSystemUnlock.WBP_Guide_SubSystemUnlock\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Guide/Widget/WBP_Guide_SubSystemUnlock.WBP_Guide_SubSystemUnlock\'",
  PauseAfterLoadingState = r0_0.RT_18,
  SpecialUINameList = {
    "GuideBook_Tips",
    "CommonNewMonster",
    "AchievementPanel"
  },
  StateTag = 1,
  System = "Guide",
  UIName = "SubSystemUnlock",
}
r4_0.SynthesisSuccessEffect = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/ScreenEffects/PC/WBP_ScreenEffects.WBP_ScreenEffects\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/ScreenEffects/PC/WBP_ScreenEffects.WBP_ScreenEffects\'",
  UIName = "SynthesisSuccessEffect",
}
r4_0.SystemUnlockGuide = {
  ConfigName = "OnlyUIMode",
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Guide/Mobile/WBP_Guide_NewSystemUnlock_M.WBP_Guide_NewSystemUnlock_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Guide/PC/WBP_Guide_NewSystemUnlock_P.WBP_Guide_NewSystemUnlock_P\'",
  PauseAfterLoadingState = r0_0.RT_18,
  System = "Guide",
  UIName = "SystemUnlockGuide",
  ZOrder = 104,
}
r4_0.TalkGuideUI = {
  ConditionShowStateTags = r0_0.RT_5,
  IsPreloadBP = true,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Story/Mobile/WBP_Story_GuideMan_M.WBP_Story_GuideMan_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Story/PC/WBP_Story_GuideMan_P.WBP_Story_GuideMan_P\'",
  UIName = "TalkGuideUI",
}
r4_0.TaskChapterBeginEndTip = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Guide/Mobile/WBP_Guide_ChapterBegin_M.WBP_Guide_ChapterBegin_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Guide/PC/WBP_Guide_ChapterBegin_P.WBP_Guide_ChapterBegin_P\'",
  PauseAfterLoadingState = r0_0.RT_6,
  SpecialUINameList = {
    "CharLevelUp",
    "RegionOnlineFloat"
  },
  StateTag = 1,
  System = "Battle",
  UIName = "TaskChapterBeginEndTip",
}
r4_0.TaskFullfillPopup = {
  ConfigName = "StackAndUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Task/Widget/WBP_Task_Fullfill_Popup.WBP_Task_Fullfill_Popup\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Task/Widget/WBP_Task_Fullfill_Popup.WBP_Task_Fullfill_Popup\'",
  Popup = true,
  UIName = "TaskFullfillPopup",
}
r4_0.TaskIndicator = {
  PCBPPath = "WidgetBlueprint\'/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Task.Guide_Icon_Task\'",
  System = "Battle",
  UIName = "TaskIndicator",
  ZOrder = 22,
}
r4_0.TaskPanel = {
  ConfigName = "StackAndUIMode",
  IsStopGame = 2,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Task/Mobile/WBP_Task_Main_M.WBP_Task_Main_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Task/PC/WBP_Task_Main_P.WBP_Task_Main_P\'",
  Popup = true,
  UIName = "TaskPanel",
  ZOrder = 56,
}
r4_0.TeamBattleInfo = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Team/Mobile/WBP_Team_PlayerList_M.WBP_Team_PlayerList_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Team/PC/WBP_Team_PlayerList_P.WBP_Team_PlayerList_P\'",
  System = "Team",
  UIName = "TeamBattleInfo",
  ZOrder = -3,
}
r4_0.TeamInSystem = {
  ConfigName = "OnlyAllowMulti",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Team/Mobile/WBP_Team_Main_M.WBP_Team_Main_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Team/PC/WBP_Team_Main_P.WBP_Team_Main_P\'",
  System = "Team",
  UIName = "TeamInSystem",
  ZOrder = 20,
}
r4_0.TeamInSystemSame = {
  ConfigName = "OnlyAllowMulti",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Team/PC/WBP_Team_Main_P.WBP_Team_Main_P\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Team/PC/WBP_Team_Main_P.WBP_Team_Main_P\'",
  System = "Team",
  UIName = "TeamInSystemSame",
  ZOrder = 20,
}
r4_0.TeamInviteTip = {
  ConfigName = "Default",
  KeyboardSetName = "PopupConfirm",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Team/Widget/WBP_Team_Invite.WBP_Team_Invite\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Team/Widget/WBP_Team_Invite.WBP_Team_Invite\'",
  System = "Team",
  UIName = "TeamInviteTip",
  ZOrder = 101,
}
r4_0.TeamToast = {
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Team/Widget/WBP_Team_Toast.WBP_Team_Toast_C\'",
  UIName = "TeamToast",
  ZOrder = 100,
}
r4_0.TheaterTaskTime = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/Widget/TheaterOnline/WBP_Activity_TheaterTask.WBP_Activity_TheaterTask\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/Widget/TheaterOnline/WBP_Activity_TheaterTask.WBP_Activity_TheaterTask\'",
  UIName = "TheaterTaskTime",
}
r4_0.TheaterToast = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/Mobile/TheaterOnline/WBP_Activity_Theater_Toast_M.WBP_Activity_Theater_Toast_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/PC/TheaterOnline/WBP_Activity_Theater_Toast_P.WBP_Activity_Theater_Toast_P\'",
  UIName = "TheaterToast",
}
r4_0.TiaoPin = {
  ConfigName = "StackAndUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/MiniGame/Mobile/WBP_MiniGame_Tiaopin_M.WBP_MiniGame_Tiaopin_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/MiniGame/PC/WBP_MiniGame_Tiaopin_P.WBP_MiniGame_Tiaopin_P\'",
  Popup = true,
  UIName = "TiaoPin",
  ZOrder = 55,
}
r4_0.ToughnessWeak = {
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/HUD_Bar/WBP_Battle_HUD_ToughnessWeak.WBP_Battle_HUD_ToughnessWeak_C\'",
  UIName = "ToughnessWeak",
}
r4_0.TrainingGroundSetup = {
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Mobile/Training/WBP_Battle_Training_Main_M.WBP_Battle_Training_Main_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/PC/Training/WBP_Battle_Training_Main_P.WBP_Battle_Training_Main_P\'",
  Popup = true,
  System = "Training",
  UIName = "TrainingGroundSetup",
  ZOrder = 1,
}
r4_0.TrainingSettingPage = {
  ConfigName = "OnlyUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Mobile/Training/WBP_Battle_TrainingSettingPage_M.WBP_Battle_TrainingSettingPage_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Mobile/Training/WBP_Battle_TrainingSettingPage_M.WBP_Battle_TrainingSettingPage_M\'",
  System = "Training",
  UIName = "TrainingSettingPage",
  ZOrder = 52,
}
r4_0.TreasureToast = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Toast/Mobile/WBP_Com_ToastTreasure_M.WBP_Com_ToastTreasure_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Toast/PC/WBP_Com_ToastTreasure_P.WBP_Com_ToastTreasure_P\'",
  System = "Common",
  UIName = "TreasureToast",
}
r4_0.Trial_BattleProgress = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/TryOut/WBP_TryOut_CountBar.WBP_TryOut_CountBar\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/TryOut/WBP_TryOut_CountBar.WBP_TryOut_CountBar\'",
  UIName = "Trial_BattleProgress",
}
r4_0.TryOutMain = {
  ConfigName = "OnlyUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/TryOut/Mobile/WBP_TryOut_Main_M.WBP_TryOut_Main_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/TryOut/PC/WBP_TryOut_Main_P.WBP_TryOut_Main_P\'",
  PauseAfterLoadingState = r0_0.RT_14,
  Popup = true,
  UIName = "TryOutMain",
  ZOrder = 50,
}
r4_0.TryOut_Victory = {
  ConfigName = "StackAndUIMode",
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/TryOut/Widget/WBP_TryOut_Victory.WBP_TryOut_Victory\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/TryOut/Widget/WBP_TryOut_Victory.WBP_TryOut_Victory\'",
  Popup = true,
  UIName = "TryOut_Victory",
}
r4_0.UIChapterStart = {
  ConditionShowStateTags = r0_0.RT_5,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/ChapterStart/Widget/WBP_ChapterStart_PurgatorioIsland.WBP_ChapterStart_PurgatorioIsland\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/ChapterStart/Widget/WBP_ChapterStart_PurgatorioIsland.WBP_ChapterStart_PurgatorioIsland\'",
  UIName = "UIChapterStart",
}
r4_0.UIFushuNearDeath = {
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/PC/WBP_Battle_NearDeath_Test_P.WBP_Battle_NearDeath_Test_P\'",
  UIName = "UIFushuNearDeath",
}
r4_0.UISKillFushu = {
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_FushuSkill.WBP_Battle_FushuSkill\'",
  System = "Battle",
  UIName = "UISKillFushu",
}
r4_0.UISkilYeerUlti = {
  ConfigName = "OnlyForceShow",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_YeErUltiSkill.WBP_Battle_YeerUltiSkill\'",
  System = "Battle",
  UIName = "UISkilYeerUlti",
  ZOrder = -6,
}
r4_0.UISkill2Linen = {
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_LinenUltiSkill.WBP_Battle_LinenUltiSkill\'",
  System = "Battle",
  UIName = "UISkill2Linen",
  ZOrder = -3,
}
r4_0.UISkill2Tuosi = {
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_TuosiUltiSkill.WBP_Battle_TuosiUltiSkill\'",
  System = "Battle",
  UIName = "UISkill2Tuosi",
  ZOrder = -6,
}
r4_0.UISkillBaonu = {
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_BaonuSkill.WBP_Battle_BaonuSkill\'",
  System = "Battle",
  UIName = "UISkillBaonu",
}
r4_0.UISkillFeina = {
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_FeinaSkill.WBP_Battle_FeinaSkill\'",
  System = "Battle",
  UIName = "UISkillFeina",
  ZOrder = -3,
}
r4_0.UISkillHeilong = {
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_HeilongSkill.WBP_Battle_HeilongSkill\'",
  System = "Battle",
  UIName = "UISkillHeilong",
  ZOrder = -3,
}
r4_0.UISkillKami = {
  ConfigName = "OnlyForceShow",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_Kami_Skill.WBP_Battle_Kami_Skill\'",
  System = "Battle",
  UIName = "UISkillKami",
}
r4_0.UISkillKezhou = {
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_KezhouSkill.WBP_Battle_KezhouSkill\'",
  System = "Battle",
  UIName = "UISkillKezhou",
  ZOrder = -3,
}
r4_0.UISkillLandi = {
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_LandiSkill.WBP_Battle_LandiSkill\'",
  System = "Battle",
  UIName = "UISkillLandi",
  ZOrder = -3,
}
r4_0.UISkillLinen = {
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_LinenSkill.WBP_Battle_LinenSkill\'",
  System = "Battle",
  UIName = "UISkillLinen",
  ZOrder = -3,
}
r4_0.UISkillLise = {
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_LiseSkill.WBP_Battle_LiseSkill\'",
  System = "Battle",
  UIName = "UISkillLise",
  ZOrder = -3,
}
r4_0.UISkillNvzhu = {
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/WBP_Battle_PerfectDodge.WBP_Battle_PerfectDodge\'",
  System = "Battle",
  UIName = "UISkillNvzhu",
  ZOrder = -3,
}
r4_0.UISkillSaqiUlti = {
  ConfigName = "OnlyForceShow",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_SaiqiUltiSkill.WBP_Battle_SaiqiUltiSkill\'",
  System = "Battle",
  UIName = "UISkillSaqiUlti",
  ZOrder = -6,
}
r4_0.UISkillSaqiUltiSkin1 = {
  ConfigName = "OnlyForceShow",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_SaiqiUltiSkill_Skin01.WBP_Battle_SaiqiUltiSkill_Skin01\'",
  System = "Battle",
  UIName = "UISkillSaqiUltiSkin1",
  ZOrder = -6,
}
r4_0.UISkillShuimu = {
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_ShuimuSkill.WBP_Battle_ShuimuSkill\'",
  System = "Battle",
  UIName = "UISkillShuimu",
  ZOrder = -3,
}
r4_0.UISkillSonglu = {
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_SongluSkill.WBP_Battle_SongluSkill\'",
  System = "Battle",
  UIName = "UISkillSonglu",
  ZOrder = -3,
}
r4_0.UISkillSpade = {
  ConfigName = "OnlyForceShow",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_SpadeSkill.WBP_Battle_SpadeSkill\'",
  System = "Battle",
  UIName = "UISkillSpade",
  ZOrder = -6,
}
r4_0.UISkillTuosi = {
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_TuosiSkill.WBP_Battle_TuosiSkill\'",
  System = "Battle",
  UIName = "UISkillTuosi",
  ZOrder = -3,
}
r4_0.UISkillXibi = {
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_XibiSkill.WBP_Battle_XibiSkill\'",
  System = "Battle",
  UIName = "UISkillXibi",
  ZOrder = -3,
}
r4_0.UISkillXier = {
  ConfigName = "OnlyForceShow",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_XierSkill.WBP_Battle_XierSkill\'",
  System = "Battle",
  UIName = "UISkillXier",
}
r4_0.UISkillXierUlti = {
  ConfigName = "OnlyForceShow",
  IgnoreHideTags = r0_0.RT_7,
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_XierUltiSkill.WBP_Battle_XierUltiSkill\'",
  System = "Battle",
  UIName = "UISkillXierUlti",
}
r4_0.UISkillZhiliu = {
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_ZhiliuSKill.WBP_Battle_ZhiliuSKill\'",
  System = "Battle",
  UIName = "UISkillZhiliu",
  ZOrder = -3,
}
r4_0.UISkillZhiliuUlti = {
  ConfigName = "OnlyForceShow",
  IgnoreHideTags = r0_0.RT_7,
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_ZhiliuUltiSkill.WBP_Battle_ZhiliuUltiSkill\'",
  System = "Battle",
  UIName = "UISkillZhiliuUlti",
}
r4_0.VideoPlayer = {
  ConfigName = "StackAndUIMode",
  GlobalGameUITag = "VideoPlayer",
  IsStopGame = 1,
  MobileBPPath = "/Game/UI/WBP/Video/WBP_VideoPlayer.WBP_VideoPlayer_C",
  PCBPPath = "/Game/UI/WBP/Video/WBP_VideoPlayer.WBP_VideoPlayer_C",
  Popup = true,
  UIName = "VideoPlayer",
}
r4_0.Vote = {
  ConfigName = "UIModeAndForceShow",
  IsBanAccess = true,
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Vote/Mobile/WBP_Vote_M.WBP_Vote_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Vote/PC/WBP_Vote_P.WBP_Vote_P\'",
  System = "Battle",
  UIName = "Vote",
  ZOrder = 48,
}
r4_0.WBP_Battle_Version = {
  IfDevOnly = true,
  IsGlobalUI = true,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/WBP_Battle_Version.WBP_Battle_Version\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/WBP_Battle_Version.WBP_Battle_Version\'",
  UIName = "WBP_Battle_Version",
}
r4_0.WalnutBagMain = {
  ConfigName = "StackAndUIMode",
  IsHideBattleUnit = 1,
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Walnut/Mobile/WBP_Walnut_Bag_M.WBP_Walnut_Bag_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Walnut/PC/WBP_Walnut_Bag_P.WBP_Walnut_Bag_P\'",
  Popup = true,
  System = "WalnutBag",
  UIName = "WalnutBagMain",
  ZOrder = 55,
}
r4_0.WalnutChoice = {
  ConfigName = "UIModeAndForceShow",
  IsBanAccess = true,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Walnut/Mobile/WBP_Walnut_Choice_M.WBP_Walnut_Choice_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Walnut/PC/WBP_Walnut_Choice_P.WBP_Walnut_Choice_P\'",
  System = "Walnut",
  UIName = "WalnutChoice",
  ZOrder = 100,
}
r4_0.WalnutReward = {
  ConfigName = "UIModeAndForceShow",
  IsBanAccess = true,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Walnut/Mobile/WBP_Walnut_Reward_M.WBP_Walnut_Reward_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Walnut/PC/WBP_Walnut_Reward_P.WBP_Walnut_Reward_P\'",
  System = "Walnut",
  UIName = "WalnutReward",
  ZOrder = 100,
}
r4_0.WalnutRewardDialog = {
  ConfigName = "UIModeAndForceShow",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Walnut/Mobile/WBP_Walnut_RewardDialog_M.WBP_Walnut_RewardDialog_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Walnut/PC/WBP_Walnut_RewardDialog_P.WBP_Walnut_RewardDialog_P\'",
  Params = r0_0.RT_2,
  System = "Walnut",
  UIName = "WalnutRewardDialog",
  ZOrder = 102,
}
r4_0.WarningToast = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Toast/Mobile/WBP_Com_ToastWarning_M.WBP_Com_ToastWarning_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Toast/PC/WBP_Com_ToastWarning_P.WBP_Com_ToastWarning_P\'",
  SpecialUINameList = {
    "ExploreToastSuccess"
  },
  StateTag = 1,
  System = "Common",
  UIName = "WarningToast",
  ZOrder = 51,
}
r4_0.WaveStartBP = {
  ConfigName = "OnlyForceShow",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Dungeon/Defense/WBP_Dungeon_DefenseWaveStart.WBP_Dungeon_DefenseWaveStart\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Dungeon/Defense/WBP_Dungeon_DefenseWaveStart.WBP_Dungeon_DefenseWaveStart\'",
  UIName = "WaveStartBP",
  ZOrder = 5,
}
r4_0.WhiteTalkUI = {
  ConditionShowStateTags = r0_0.RT_5,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Story/Mobile/WBP_WhiteScreenTalk_M.WBP_WhiteScreenTalk_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Story/PC/WBP_WhiteScreenTalk_P.WBP_WhiteScreenTalk_P\'",
  System = "Story",
  UIName = "WhiteTalkUI",
  ZOrder = 53,
}
r4_0.Wiki = {
  ConfigName = "StackAndUIMode",
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Encyclopedia/Mobile/WBP_Encyclopedia_Entrance_M.WBP_Encyclopedia_Entrance_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Encyclopedia/PC/WBP_Encyclopedia_Entrance_P.WBP_Encyclopedia_Entrance_P\'",
  Popup = true,
  System = "Wiki",
  UIName = "Wiki",
}
r4_0.Wiki_Main = {
  ConditionShowStateTags = r0_0.RT_5,
  ConfigName = "OnlyUIMode",
  IsStopGame = 1,
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Encyclopedia/Mobile/WBP_Encyclopedia_Main_M.WBP_Encyclopedia_Main_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Encyclopedia/PC/WBP_Encyclopedia_Main_P.WBP_Encyclopedia_Main_P\'",
  Popup = true,
  System = "Wiki",
  UIName = "Wiki_Main",
  ZOrder = 54,
}
r4_0.ZhiLiuDoorQTE = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Level/Mobile/WBP_Level_QTE_Zhiliu_M.WBP_Level_QTE_Zhiliu_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Level/PC/WBP_Level_QTE_Zhiliu_P.WBP_Level_QTE_Zhiliu_P\'",
  UIName = "ZhiLiuDoorQTE",
}
r4_0.ZhiliuEventTask = {
  ConfigName = "StackAndUIMode",
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/Mobile/ZhiliuEvent/WBP_Activity_ZhiliuEvent_Task_M.WBP_Activity_ZhiliuEvent_Task_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/PC/ZhiliuEvent/WBP_Activity_ZhiliuEvent_Task_P.WBP_Activity_ZhiliuEvent_Task_P\'",
  Params = r0_0.RT_2,
  Popup = true,
  UIName = "ZhiliuEventTask",
}
r4_0.ZhuanQuanQuan = {
  MobileBPPath = "WidgetBlueprint\'/Game/UI/WBP/MiniGame/Mobile/WBP_MiniGame_ZhuanQuanQuan_M.WBP_MiniGame_ZhuanQuanQuan_M\'",
  PCBPPath = "WidgetBlueprint\'/Game/UI/WBP/MiniGame/PC/WBP_MiniGame_ZhuanQuanQuan_P.WBP_MiniGame_ZhuanQuanQuan_P\'",
  System = "Battle",
  UIName = "ZhuanQuanQuan",
  ZOrder = 50,
}
return r2_0(r3_0, r4_0)
