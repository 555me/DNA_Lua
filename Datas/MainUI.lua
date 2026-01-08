-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\MainUI.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    2
  },
  RT_2 = {
    2,
    5
  },
  RT_3 = {
    1
  },
  RT_4 = {
    1,
    5
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [17, 17] id: 1
  return r1_1
end
local r3_0 = "MainUI"
local r4_0 = {}
r4_0[1] = {
  ActionName = "OpenArmory",
  EnterId = 1,
  EscShowCondition = {
    4
  },
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Armory.T_Entrance_Armory",
  Name = "MAIN_UI_ARMORY",
  ReddotNode = "ArmoryMainMenu",
  Sequence = 10,
  ShowCondition = {
    4,
    10
  },
  SystemUIName = "ArmoryMain",
  UIUnlockRuleName = "Armory",
}
r4_0[2] = {
  ActionName = "OpenBag",
  EnterId = 2,
  EscShowCondition = r0_0.RT_1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Bag.T_Entrance_Bag",
  Name = "MAIN_UI_BAG",
  Sequence = 20,
  SystemUIName = "BagMain",
  UIUnlockRuleName = "Bag",
}
r4_0[3] = {
  EnterId = 3,
  EscShowCondition = r0_0.RT_3,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Invite.T_Entrance_Invite",
  Name = "MAIN_UI_NPCSWITCH",
  Sequence = 225,
  ShowCondition = r0_0.RT_4,
  SystemUIName = "NpcSwitchMain",
  UIUnlockRuleName = "Invite",
}
r4_0[4] = {
  EnterId = 4,
  EscShowCondition = r0_0.RT_1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Store.T_Entrance_Store",
  Name = "MAIN_UI_SHOP",
  ReddotNode = "Shop",
  Sequence = 90,
  SystemUIName = "ShopMain",
  UIUnlockRuleName = "Shop",
}
r4_0[5] = {
  ActionName = "OpenGacha",
  EnterId = 5,
  EscShowCondition = r0_0.RT_1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Gacha.T_Entrance_Gacha",
  Name = "MAIN_UI_GACHA",
  ReddotNode = "Gacha",
  Sequence = 80,
  ShowCondition = r0_0.RT_2,
  SystemUIName = "GachaMain",
  UIUnlockRuleName = "Gacha",
}
r4_0[6] = {
  ActionName = "OpenForge",
  EnterId = 6,
  EscShowCondition = r0_0.RT_1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Forging.T_Entrance_Forging",
  Name = "MAIN_UI_FORGE",
  ReddotNode = "ForgeEntry",
  Sequence = 70,
  ShowCondition = r0_0.RT_4,
  SystemUIName = "ForgeMain",
  UIUnlockRuleName = "Forging",
}
r4_0[7] = {
  EnterId = 7,
  EscShowCondition = r0_0.RT_1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Achievement.T_Entrance_Achievement",
  Name = "MAIN_UI_ACHIEVEMENT",
  ReddotNode = "AchieveMain",
  Sequence = 30,
  SystemUIName = "AchievementSystem",
  UIUnlockRuleName = "Achievement",
}
r4_0[8] = {
  ActionName = "OpenPlay",
  EnterId = 8,
  EscShowCondition = r0_0.RT_1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Pve.T_Entrance_Pve",
  Name = "MAIN_UI_PLAY",
  ReddotNode = "Play",
  Sequence = 50,
  ShowCondition = r0_0.RT_2,
  SystemUIName = "StyleOfPlay",
  UIUnlockRuleName = "Play",
}
r4_0[9] = {
  ActionName = "OpenTask",
  EnterId = 9,
  EscShowCondition = r0_0.RT_1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Task.T_Entrance_Task",
  Name = "MAIN_UI_QUEST",
  ReddotNode = "Quest",
  Sequence = 40,
  SystemUIName = "TaskPanel",
  UIUnlockRuleName = "Quest",
}
r4_0[10] = {
  EnterId = 10,
  EscShowCondition = r0_0.RT_1,
  EscShowType = 1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Mail.T_Entrance_Mail",
  Name = "MAIN_UI_MAIL",
  ReddotNode = "NormalMail",
  Sequence = 100,
  SystemUIName = "MailMain",
  UIUnlockRuleName = "Mail",
}
r4_0[11] = {
  ActionName = "OpenMenu",
  DungeonIcon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Quit.T_Entrance_Quit",
  EnterId = 11,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Menu.T_Entrance_Menu",
  Name = "MAIN_UI_MENU",
  ReddotNode = "BattleMainMenu",
}
r4_0[12] = {
  EnterId = 12,
  EscShowCondition = r0_0.RT_1,
  EscShowType = 1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Announcement.T_Entrance_Announcement",
  Name = "MAIN_UI_NOTICE",
  ReddotNode = "AnnouncementItems",
  Sequence = 110,
  SystemUIName = "AnnouncementMain",
  UIUnlockRuleName = "Announcement",
}
r4_0[13] = {
  ActionName = "OpenGuideBook",
  EnterId = 13,
  EscShowCondition = r0_0.RT_1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_GuideBook.T_Entrance_GuideBook",
  Name = "MAIN_UI_GUIDEBOOK",
  ReddotNode = "NewGuideNote",
  Sequence = 120,
  SystemUIName = "GuideBook",
  UIUnlockRuleName = "GuideBook",
}
r4_0[14] = {
  EnterId = 14,
  EscShowCondition = r0_0.RT_1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Friend.T_Entrance_Friend",
  Name = "MAIN_UI_FRIEND",
  ReddotNode = "NewFriendRequest",
  Sequence = 130,
  SystemUIName = "FriendMain",
  UIUnlockRuleName = "FriendMain",
}
r4_0[15] = {
  EnterId = 15,
  EscShowCondition = r0_0.RT_1,
  EscShowType = 1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Camera.T_Entrance_Camera",
  Name = "MAIN_UI_PHOTOCAMERA",
  Sequence = 140,
  ShowCondition = {
    6
  },
  SystemUIName = "PhotoCameraMain",
  UIUnlockRuleName = "PhotoCameraMain",
}
r4_0[16] = {
  ActionName = "RougeOpenBag",
  EnterId = 16,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/RougeLike/T_Rouge_knapsack.T_Rouge_knapsack",
  Name = "UI_RougeBag_Name",
  Sequence = 150,
  ShowCondition = {
    3
  },
  SystemUIName = "RougeBag",
  UIUnlockRuleName = "RougeBag",
}
r4_0[17] = {
  ActionName = "OpenChat",
  EnterId = 17,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Common/T_Entrance_Chat.T_Entrance_Chat",
  Name = "MAIN_UI_CHAT",
  ReddotNode = "ChatMainMenu",
  SystemUIName = "ChatMain",
  UIUnlockRuleName = "Chat",
}
r4_0[18] = {
  ActionName = "OpenBattlePass",
  EnterId = 18,
  EscShowCondition = r0_0.RT_1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_BattlePass.T_Entrance_BattlePass",
  Name = "MAIN_UI_BATTLEPASS",
  ReddotNode = "BattlePassMain",
  Sequence = 160,
  ShowCondition = r0_0.RT_2,
  SystemUIName = "BattlePassMain",
  UIUnlockRuleName = "BattlePass",
}
r4_0[19] = {
  ActionName = "OpenEvent",
  EnterId = 19,
  EscShowCondition = r0_0.RT_1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Activity.T_Entrance_Activity",
  Name = "MAIN_UI_GAMEEVENT",
  ReddotNode = "ActivityHub",
  Sequence = 170,
  ShowCondition = r0_0.RT_2,
  SystemUIName = "ActivityMain",
  UIUnlockRuleName = "GameEvent",
}
r4_0[20] = {
  ActionName = "OpenMap",
  EnterId = 20,
  EscShowCondition = r0_0.RT_1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Map.T_Entrance_Map",
  Name = "MAIN_UI_MAP",
  ReddotNode = "Map",
  Sequence = 180,
  SystemUIName = "LevelMapMain",
  UIUnlockRuleName = "Map",
}
r4_0[21] = {
  EnterId = 21,
  EscShowCondition = r0_0.RT_3,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Entertainment",
  Name = "MAIN_UI_ENTERTAINMENT",
  ReddotNode = "Entertainment",
  Sequence = 190,
  ShowCondition = r0_0.RT_4,
  SystemUIName = "Entertainment",
  UIUnlockRuleName = "Entertainment",
}
r4_0[22] = {
  EnterId = 22,
  EscShowCondition = r0_0.RT_1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Wiki",
  Name = "MAIN_UI_WIKI",
  ReddotNode = "WikiReward",
  Sequence = 200,
  SystemUIName = "Wiki",
  UIUnlockRuleName = "Wiki",
}
r4_0[23] = {
  EnterId = 23,
  EscShowCondition = r0_0.RT_1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Walnut.T_Entrance_Walnut",
  Name = "MAIN_UI_WALNUTBAG",
  ReddotNode = "WalnutBagItems",
  Sequence = 210,
  SystemUIName = "WalnutBagMain",
  UIUnlockRuleName = "WalnutBag",
}
r4_0[24] = {
  EnterId = 24,
  EscShowCondition = r0_0.RT_1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Archive.T_Entrance_Archive",
  Name = "MAIN_UI_ARCHIVE",
  ReddotNode = "Archive",
  Sequence = 220,
  SystemUIName = "ArchiveMain",
  UIUnlockRuleName = "Archive",
}
r4_0[25] = {
  EnterId = 25,
  EscShowCondition = r0_0.RT_1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_ModArchive.T_Entrance_ModArchive",
  Name = "MAIN_UI_MODGUIDEBOOK",
  ReddotNode = "ModArchive",
  Sequence = 171,
  ShowCondition = {
    2,
    5,
    350
  },
  SystemUIName = "ModArchiveMain",
  UIUnlockRuleName = "ModArchive",
}
r4_0[26] = {
  EnterId = 26,
  EscShowCondition = r0_0.RT_1,
  EscShowType = 1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Set.T_Entrance_Set",
  Name = "UI_Esc_CommonSet",
  ReddotNode = "Setting_Root",
  Sequence = 230,
  SystemUIName = "Setting",
}
r4_0[27] = {
  EnterId = 27,
  EscShowCondition = r0_0.RT_1,
  Icon = "Texture2D\'/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_RelatedProduct.T_Entrance_RelatedProduct\'",
  IfNoUI = true,
  Link = "RelatedProduct",
  Name = "MAIN_UI_RELATEDPRODUCT",
  Sequence = 221,
}
r4_0[28] = {
  EnterId = 28,
  EscShowCondition = r0_0.RT_1,
  EscShowType = 1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_TrainingLevel.T_Entrance_TrainingLevel",
  Name = "MAIN_UI_PlayLevel",
  ReddotNode = "ExperienceMain",
  Sequence = 95,
  SystemUIName = "ExperienceMain",
  UIUnlockRuleName = "PlayerLevel",
}
r4_0[29] = {
  EnterId = 29,
  EscShowCondition = r0_0.RT_1,
  EscShowType = 1,
  Icon = "Texture2D\'/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Clock.T_Entrance_Clock\'",
  Name = "UI_Esc_DayAndNight",
  ReddotNode = "DayAndNight",
  Sequence = 105,
  SystemUIName = "DayAndNight",
  UIUnlockRuleName = "TODSetting",
}
r4_0[30] = {
  EnterId = 30,
  EscShowCondition = r0_0.RT_1,
  Icon = "Texture2D\'/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_CloudGame.T_Entrance_CloudGame\'",
  Link = "CloudGame",
  Name = "UI_OPTION_CloudGame",
  Sequence = 221,
  SystemUIName = "GlobalWebBrowser",
}
return r2_0(r3_0, r4_0)
