-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\UIUnlockRule.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    2,
    5
  },
  RT_2 = {
    "UI_Disabled_Des_Armory",
    "UI_Disabled_InStoryMode"
  },
  RT_3 = {
    4,
    5
  },
  RT_4 = {
    8028
  },
  RT_5 = {
    "UI_Disabled_Des_Play",
    "UI_Disabled_InStoryMode"
  },
  RT_6 = {
    1,
    5
  },
  RT_7 = {
    "UI_Locked_Des_NewMap"
  },
  RT_8 = {
    "UI_Locked_Des_Shop"
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [32, 32] id: 1
  return r1_1
end
local r3_0 = "UIUnlockRule"
local r4_0 = {}
r4_0.Abyss = {
  ConditionId = 8002,
  IsHideUnlockPopup = 1,
  OpenConditionId = r0_0.RT_1,
  OpenSystemDesc = {
    "UI_Disabled_Des_Abyss"
  },
  UIUnlockName = "Abyss_entry",
  UIUnlockRuleId = "Abyss",
}
r4_0.Achievement = {
  AfterUIUnlockDesc = "System_Des_Achievement",
  ConditionId = 4070,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Achievement.T_Entrance_Achievement",
  IsHideUnlockPopup = 1,
  OpenConditionId = r0_0.RT_1,
  OpenSystemDesc = {
    "UI_Disabled_Des_Achievement",
    "UI_Disabled_InStoryMode"
  },
  UIUnlockDesc = "UI_Locked_Des_Achievement",
  UIUnlockName = "MAIN_UI_ACHIEVEMENT",
  UIUnlockRuleId = "Achievement",
  UnlockPopupType = "Light",
}
r4_0.Announcement = {
  AfterUIUnlockDesc = "System_Des_Notice",
  ConditionId = 4150,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Announcement.T_Entrance_Announcement",
  IsHideUnlockPopup = 1,
  OpenConditionId = r0_0.RT_1,
  OpenSystemDesc = {
    "UI_Disabled_Des_Notice",
    "UI_Disabled_InStoryMode"
  },
  UIUnlockDesc = "UI_Locked_Des_Notice",
  UIUnlockName = "MAIN_UI_NOTICE",
  UIUnlockRuleId = "Announcement",
  UnlockPopupType = "Light",
}
r4_0.Archive = {
  AfterUIUnlockDesc = "System_Des_Archive",
  ConditionId = 4070,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Archive.T_Entrance_Archive",
  IsHideUnlockPopup = 1,
  OpenConditionId = r0_0.RT_1,
  OpenSystemDesc = {
    "UI_Disabled_Des_Archive"
  },
  UIUnlockDesc = "UI_Locked_Des_Archive",
  UIUnlockName = "MAIN_UI_ARCHIVE",
  UIUnlockRuleId = "Archive",
  UnlockPopupType = "Light",
}
r4_0.Armory = {
  AfterUIUnlockDesc = "System_Des_Armory",
  ConditionId = 4020,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Armory.T_Entrance_Armory",
  IsHideUnlockPopup = 1,
  OpenConditionId = {
    4,
    10
  },
  OpenSystemDesc = r0_0.RT_2,
  UIUnlockDesc = "UI_Locked_Des_Armory",
  UIUnlockName = "MAIN_UI_ARMORY",
  UIUnlockRuleId = "Armory",
  UnlockPopupType = "Normal",
}
r4_0.Bag = {
  AfterUIUnlockDesc = "System_Des_Bag_CBT3",
  ConditionId = 4010,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Bag.T_Entrance_Bag",
  OpenConditionId = r0_0.RT_1,
  OpenSystemDesc = {
    "UI_Disabled_Des_Bag",
    "UI_Disabled_InStoryMode"
  },
  UIUnlockDesc = "UI_Unlock_Des_Bag",
  UIUnlockName = "MAIN_UI_BAG",
  UIUnlockRuleId = "Bag",
  UnlockPopupType = "Light",
}
r4_0.BattlePass = {
  AfterUIUnlockDesc = "System_Des_BattlePass",
  ConditionId = 4310,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_BattlePass.T_Entrance_BattlePass",
  IsHideUnlockPopup = 1,
  OpenConditionId = {
    2,
    5,
    4311
  },
  OpenSystemDesc = {
    "UI_Disabled_Des_BattlePass",
    "UI_Disabled_Des_BattlePass",
    "UI_BattlePass_NotInPeriod"
  },
  UIUnlockDesc = "UI_Locked_Des_BattlePass",
  UIUnlockName = "MAIN_UI_BATTLEPASS",
  UIUnlockRuleId = "BattlePass",
  UnlockPopupType = "Normal",
}
r4_0.BattleWheel = {
  AfterUIUnlockDesc = "System_Des_BattleWheel",
  ConditionId = 4140,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Armory.T_Entrance_Armory",
  IsHideUnlockPopup = 1,
  OpenConditionId = r0_0.RT_1,
  OpenSystemDesc = {
    "UI_Disabled_Des_BattleWheel",
    "UI_Disabled_InStoryMode"
  },
  UIUnlockDesc = "UI_Locked_Des_BattleWheel",
  UIUnlockName = "MAIN_UI_BATTLEWHEEL",
  UIUnlockRuleId = "BattleWheel",
  UnlockPopupType = "Normal",
}
r4_0.CardLevel = {
  AfterUIUnlockDesc = "System_Des_CardLevel",
  ConditionId = 4041,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Armory.T_Entrance_Armory",
  IsHideUnlockPopup = 1,
  OpenConditionId = r0_0.RT_3,
  OpenSystemDesc = r0_0.RT_2,
  UIUnlockDesc = "UI_Locked_Des_Armory",
  UIUnlockName = "MAIN_UI_CARDLEVEL",
  UIUnlockRuleId = "CardLevel",
  UnlockPopupType = "Normal",
}
r4_0.Chat = {
  AfterUIUnlockDesc = "System_Des_Chat",
  ConditionId = 4260,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Chat.T_Entrance_Chat",
  IsHideUnlockPopup = 1,
  OpenConditionId = r0_0.RT_4,
  OpenSystemDesc = {
    "UI_Disabled_Des_Chat"
  },
  UIUnlockDesc = "UI_Locked_Des_Chat",
  UIUnlockName = "MAIN_UI_CHAT",
  UIUnlockRuleId = "Chat",
  UnlockPopupType = "Normal",
}
r4_0.DailyGoal = {
  AfterUIUnlockDesc = "System_Des_DailyGoal_CBT3",
  ConditionId = 4320,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_StarterQuest.T_Entrance_StarterQuest",
  OpenConditionId = r0_0.RT_1,
  OpenSystemDesc = {
    "UI_Disabled_Des_DailyGoal"
  },
  UIUnlockDesc = "UI_Locked_Des_DailyGoal",
  UIUnlockName = "MAIN_UI_DAILYGOAL",
  UIUnlockRuleId = "DailyGoal",
  UnlockPopupType = "Light",
}
r4_0.Dispatch = {
  AfterUIUnlockDesc = "System_Des_Dispatch_CBT3",
  ConditionId = 4330,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Dispatch.T_Entrance_Dispatch",
  OpenConditionId = r0_0.RT_1,
  OpenSystemDesc = {
    "UI_Disabled_Des_Dispatch"
  },
  UIUnlockDesc = "UI_Locked_Des_Dispatch",
  UIUnlockName = "MAIN_UI_DISPATCH",
  UIUnlockRuleId = "Dispatch",
  UnlockPopupType = "Light",
}
r4_0.Dungeon = {
  AfterUIUnlockDesc = "System_Des_Play",
  ConditionId = 4320,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Pve.T_Entrance_Pve",
  OpenSystemDesc = r0_0.RT_5,
  UIUnlockDesc = "UI_Locked_Des_Play",
  UIUnlockName = "MAIN_UI_PLAY",
  UIUnlockRuleId = "Dungeon",
  UnlockPopupType = "Normal",
}
r4_0.Entertainment = {
  AfterUIUnlockDesc = "System_Des_Enterntainment",
  ConditionId = 4250,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Entertainment.T_Entrance_Entertainment",
  OpenConditionId = r0_0.RT_6,
  OpenSystemDesc = {
    "UI_Disabled_Des_Entertainment",
    "UI_Disabled_InStoryMode"
  },
  UIUnlockDesc = "UI_Locked_Des_Entertainment",
  UIUnlockName = "MAIN_UI_ENTERTAINMENT",
  UIUnlockRuleId = "Entertainment",
  UnlockPopupType = "Normal",
}
r4_0.ExploreBadgeShop = {
  AfterUIUnlockDesc = "System_Des_ExploreBadgeShop",
  ConditionId = 10101001,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Store.T_Entrance_Store",
  IsHideUnlockPopup = 1,
  OpenConditionId = r0_0.RT_1,
  OpenSystemDesc = {
    "UI_Disabled_Des_ExploreBadgeShop"
  },
  UIUnlockDesc = "UI_Locked_Des_ExploreBadgeShop",
  UIUnlockName = "MAIN_UI_EXPLOREBADGESHOP",
  UIUnlockRuleId = "ExploreBadgeShop",
  UnlockPopupType = "Normal",
}
r4_0.Forging = {
  AfterUIUnlockDesc = "System_Des_Forging",
  ConditionId = 4080,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Forging.T_Entrance_Forging",
  OpenConditionId = r0_0.RT_1,
  OpenSystemDesc = {
    "UI_Disabled_Des_Forging",
    "UI_Disabled_InStoryMode"
  },
  UIUnlockDesc = "UI_Locked_Des_Forging",
  UIUnlockName = "MAIN_UI_FORGE",
  UIUnlockRuleId = "Forging",
  UnlockPopupType = "Normal",
}
r4_0.FriendMain = {
  AfterUIUnlockDesc = "System_Des_Friend",
  ConditionId = 4190,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Friend.T_Entrance_Friend",
  OpenConditionId = r0_0.RT_1,
  OpenSystemDesc = {
    "UI_Disabled_Des_Friend",
    "UI_Disabled_InStoryMode"
  },
  UIUnlockDesc = "UI_Locked_Des_Friend",
  UIUnlockName = "MAIN_UI_FRIEND",
  UIUnlockRuleId = "FriendMain",
  UnlockPopupType = "Normal",
}
r4_0.Gacha = {
  AfterUIUnlockDesc = "System_Des_Gacha",
  ConditionId = 4040,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Gacha.T_Entrance_Gacha",
  IsHideUnlockPopup = 1,
  OpenConditionId = r0_0.RT_1,
  OpenSystemDesc = {
    "UI_Disabled_Des_Gacha",
    "UI_Disabled_InStoryMode"
  },
  UIUnlockDesc = "UI_Locked_Des_Gacha",
  UIUnlockName = "MAIN_UI_GACHA",
  UIUnlockRuleId = "Gacha",
  UnlockPopupType = "Normal",
}
r4_0.GameEvent = {
  AfterUIUnlockDesc = "System_Des_GameEvent",
  ConditionId = 4220,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Activity.T_Entrance_Activity",
  OpenConditionId = r0_0.RT_1,
  OpenSystemDesc = {
    "UI_Disabled_Des_GameEvent",
    "UI_Disabled_InStoryMode"
  },
  UIUnlockDesc = "UI_Locked_Des_GameEvent",
  UIUnlockName = "MAIN_UI_GAMEEVENT",
  UIUnlockRuleId = "GameEvent",
  UnlockPopupType = "Normal",
}
r4_0.GuideBook = {
  AfterUIUnlockDesc = "System_Des_GuideBook_CBT3",
  ConditionId = 4180,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_GuideBook.T_Entrance_GuideBook",
  OpenConditionId = r0_0.RT_4,
  OpenSystemDesc = {
    "UI_Disabled_Des_GuideBook"
  },
  UIUnlockDesc = "UI_Locked_Des_GuideBook",
  UIUnlockName = "MAIN_UI_GUIDEBOOK",
  UIUnlockRuleId = "GuideBook",
  UnlockPopupType = "Light",
}
r4_0.HardBoss = {
  AfterUIUnlockDesc = "System_Des_HardBoss",
  ConditionId = 4120,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Weelydungeon.T_Entrance_Weelydungeon",
  OpenConditionId = r0_0.RT_1,
  OpenSystemDesc = {
    "UI_Disabled_Des_HardBoss",
    "UI_Disabled_InStoryMode"
  },
  UIUnlockDesc = "UI_Locked_Des_HardBoss",
  UIUnlockName = "MAIN_UI_HARDBOSS",
  UIUnlockRuleId = "HardBoss",
  UnlockPopupType = "Normal",
}
r4_0.Home = {
  AfterUIUnlockDesc = "System_Des_Forging",
  ConditionId = 4280,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Map.T_Entrance_Map",
  IsHideUnlockPopup = 1,
  OpenConditionId = {
    7
  },
  OpenSystemDesc = {
    "UI_TOAST_FORGING_WARNING"
  },
  UIUnlockDesc = "UI_Locked_Des_Forging",
  UIUnlockName = "MAIN_UI_FORGE",
  UIUnlockRuleId = "Home",
  UnlockPopupType = "Normal",
}
r4_0.Invite = {
  AfterUIUnlockDesc = "System_Des_Invite_CBT3",
  ConditionId = 4060,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Invite.T_Entrance_Invite",
  OpenConditionId = r0_0.RT_6,
  OpenSystemDesc = {
    "UI_Disabled_Des_Invite",
    "UI_Disabled_InStoryMode"
  },
  UIUnlockDesc = "UI_Locked_Des_Invite",
  UIUnlockName = "MAIN_UI_NPCSWITCH",
  UIUnlockRuleId = "Invite",
  UnlockPopupType = "Light",
}
r4_0.LonzaFortressShopTab = {
  ConditionId = 322,
  IsHideUnlockPopup = 1,
  OpenConditionId = r0_0.RT_1,
  OpenSystemDesc = r0_0.RT_7,
  UIUnlockName = "UI_SHOP_TAB_ExploreBadge_EXChapter01",
  UIUnlockRuleId = "LonzaFortressShopTab",
}
r4_0.Mail = {
  AfterUIUnlockDesc = "System_Des_Mail_CBT3",
  ConditionId = 4100,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Mail.T_Entrance_Mail",
  OpenConditionId = r0_0.RT_1,
  OpenSystemDesc = {
    "UI_Disabled_Des_Mail",
    "UI_Disabled_InStoryMode"
  },
  UIUnlockDesc = "UI_Locked_Des_Mail",
  UIUnlockName = "MAIN_UI_MAIL",
  UIUnlockRuleId = "Mail",
  UnlockPopupType = "Light",
}
r4_0.Map = {
  AfterUIUnlockDesc = "System_Des_Map",
  ConditionId = 4050,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Map.T_Entrance_Map",
  OpenConditionId = r0_0.RT_1,
  OpenSystemDesc = {
    "UI_Disabled_Des_Map",
    "UI_Disabled_InStoryMode"
  },
  UIUnlockDesc = "UI_Locked_Des_Map",
  UIUnlockName = "MAIN_UI_MAP",
  UIUnlockRuleId = "Map",
  UnlockPopupType = "Normal",
}
r4_0.Match = {
  AfterUIUnlockDesc = "System_Des_Match",
  ConditionId = 4240,
  IsHideUnlockPopup = 1,
  OpenSystemDesc = {
    "UI_Disabled_Des_Match"
  },
  UIUnlockDesc = "UI_Locked_Des_Match",
  UIUnlockName = "MAIN_UI_MATCH",
  UIUnlockRuleId = "Match",
  UnlockPopupType = "Normal",
}
r4_0.Mod = {
  AfterUIUnlockDesc = "System_Des_Mod",
  ConditionId = 4160,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Armory.T_Entrance_Armory",
  OpenConditionId = r0_0.RT_3,
  OpenSystemDesc = {
    "UI_Disabled_Des_Mod",
    "UI_Disabled_InStoryMode"
  },
  UIUnlockDesc = "UI_Locked_Des_Mod",
  UIUnlockName = "UI_Armory_Mod",
  UIUnlockRuleId = "Mod",
  UnlockPopupType = "Normal",
}
r4_0.ModArchive = {
  AfterUIUnlockDesc = "System_Des_ModArchive_CBT3",
  ConditionId = 4350,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_ModArchive.T_Entrance_ModArchive",
  OpenConditionId = r0_0.RT_1,
  OpenSystemDesc = {
    "UI_Disabled_Des_ModArchive"
  },
  UIUnlockDesc = "UI_Locked_Des_ModArchive",
  UIUnlockName = "MAIN_UI_MODGUIDEBOOK",
  UIUnlockRuleId = "ModArchive",
  UnlockPopupType = "Light",
}
r4_0.ModDungeon = {
  AfterUIUnlockDesc = "System_Des_ModDungeon_CBT3",
  ConditionId = 4360,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Pve.T_Entrance_Pve",
  OpenConditionId = r0_0.RT_1,
  OpenSystemDesc = {
    "UI_Disabled_Des_ModDungeon",
    "UI_Disabled_InStoryMode"
  },
  UIUnlockDesc = "UI_Locked_Des_ModDungeon",
  UIUnlockName = "MAIN_UI_MODDUNGEON",
  UIUnlockRuleId = "ModDungeon",
  UnlockPopupType = "Light",
}
r4_0.Party = {
  ConditionId = 4230,
  IsHideUnlockPopup = 1,
  UIUnlockName = "MAIN_UI_PARTY",
  UIUnlockRuleId = "Party",
}
r4_0.Pet = {
  AfterUIUnlockDesc = "System_Des_Pet",
  ConditionId = 4090,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Pet.T_Entrance_Pet",
  OpenConditionId = r0_0.RT_1,
  OpenSystemDesc = {
    "UI_Disabled_Des_Pet",
    "UI_Disabled_InStoryMode"
  },
  UIUnlockDesc = "UI_Locked_Des_Pet",
  UIUnlockName = "MAIN_UI_PET",
  UIUnlockRuleId = "Pet",
  UnlockPopupType = "Normal",
}
r4_0.PetSkill = {
  AfterUIUnlockDesc = "System_Des_Pet",
  ConditionId = 4270,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Pet.T_Entrance_Pet",
  IsHideUnlockPopup = 1,
  OpenSystemDesc = {
    "UI_Disabled_Des_Pet"
  },
  UIUnlockDesc = "UI_Locked_Des_Pet",
  UIUnlockName = "MAIN_UI_PET",
  UIUnlockRuleId = "PetSkill",
  UnlockPopupType = "Normal",
}
r4_0.PhotoCameraMain = {
  AfterUIUnlockDesc = "System_Des_PhotoCamera_CBT3",
  ConditionId = 4200,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Camera.T_Entrance_Camera",
  OpenConditionId = {
    2
  },
  OpenSystemDesc = {
    "UI_Disabled_Des_PhotoCamera"
  },
  UIUnlockDesc = "UI_Locked_Des_PhotoCamera",
  UIUnlockName = "MAIN_UI_PHOTOCAMERA",
  UIUnlockRuleId = "PhotoCameraMain",
  UnlockPopupType = "Light",
}
r4_0.Play = {
  AfterUIUnlockDesc = "System_Des_Play",
  ConditionId = 4110,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Pve.T_Entrance_Pve",
  IsHideUnlockPopup = 1,
  OpenConditionId = r0_0.RT_1,
  OpenSystemDesc = r0_0.RT_5,
  UIUnlockDesc = "UI_Locked_Des_Play",
  UIUnlockName = "MAIN_UI_PLAY",
  UIUnlockRuleId = "Play",
  UnlockPopupType = "Normal",
}
r4_0.PlayTaskRoot = {
  AfterUIUnlockDesc = "System_Des_StarterQuest",
  ConditionId = 4380,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_StarterQuest.T_Entrance_StarterQuest",
  IsHideUnlockPopup = 1,
  OpenConditionId = r0_0.RT_1,
  OpenSystemDesc = {
    "UI_Disabled_Des_PlayTaskRoot"
  },
  UIUnlockDesc = "UI_Locked_Des_PlayTaskRoot",
  UIUnlockName = "MAIN_UI_PLAYTASKROOT",
  UIUnlockRuleId = "PlayTaskRoot",
  UnlockPopupType = "Light",
}
r4_0.PlayerLevel = {
  ConditionId = 4020,
  IsHideUnlockPopup = 1,
  UIUnlockName = "UI_Player_Level",
  UIUnlockRuleId = "PlayerLevel",
}
r4_0.Polarity = {
  AfterUIUnlockDesc = "System_Des_Polarity_CBT3",
  ConditionId = 4210,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Armory.T_Entrance_Armory",
  OpenConditionId = r0_0.RT_3,
  OpenSystemDesc = {
    "UI_Disabled_Des_Polarity",
    "UI_Disabled_InStoryMode"
  },
  UIUnlockDesc = "UI_Locked_Des_Polarity",
  UIUnlockName = "MAIN_UI_POLARITY",
  UIUnlockRuleId = "Polarity",
  UnlockPopupType = "Light",
}
r4_0.Quest = {
  AfterUIUnlockDesc = "System_Des_Quest",
  ConditionId = 4130,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Task.T_Entrance_Task",
  OpenConditionId = r0_0.RT_1,
  OpenSystemDesc = {
    "UI_Disabled_Des_Quest",
    "UI_Disabled_InStoryMode"
  },
  UIUnlockDesc = "UI_Locked_Des_Quest",
  UIUnlockName = "MAIN_UI_QUEST",
  UIUnlockRuleId = "Quest",
  UnlockPopupType = "Normal",
}
r4_0.RegionalShopTab = {
  ConditionId = 12010306,
  IsHideUnlockPopup = 1,
  OpenConditionId = r0_0.RT_1,
  OpenSystemDesc = r0_0.RT_8,
  UIUnlockName = "UI_SHOP_MAINTAB_COMPLEX_3",
  UIUnlockRuleId = "RegionalShopTab",
}
r4_0.Rouge = {
  AfterUIUnlockDesc = "System_Des_Rouge",
  ConditionId = 4170,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Permanent.T_Entrance_Permanent",
  OpenConditionId = r0_0.RT_1,
  OpenSystemDesc = {
    "UI_Disabled_Des_Rouge",
    "UI_Disabled_InStoryMode"
  },
  UIUnlockDesc = "UI_Locked_Des_Rouge",
  UIUnlockName = "MAIN_UI_ROUGE",
  UIUnlockRuleId = "Rouge",
  UnlockPopupType = "Normal",
}
r4_0.RougeBag = {
  AfterUIUnlockDesc = "System_Des_Rouge",
  ConditionId = 4170,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Permanent.T_Entrance_Permanent",
  IsHideUnlockPopup = 1,
  OpenConditionId = {
    3
  },
  OpenSystemDesc = {
    "UI_Disabled_Des_Rouge"
  },
  UIUnlockDesc = "UI_Locked_Des_Rouge",
  UIUnlockName = "MAIN_UI_BAG",
  UIUnlockRuleId = "RougeBag",
  UnlockPopupType = "Normal",
}
r4_0.SecretLetterShopTab = {
  ConditionId = 4340,
  IsHideUnlockPopup = 1,
  OpenConditionId = r0_0.RT_1,
  OpenSystemDesc = {
    "UI_Locked_Des_WalnutBag"
  },
  UIUnlockName = "MAIN_UI_WALNUTBAG",
  UIUnlockRuleId = "SecretLetterShopTab",
}
r4_0.Shop = {
  AfterUIUnlockDesc = "System_Des_Shop",
  ConditionId = 4030,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Store.T_Entrance_Store",
  IsHideUnlockPopup = 1,
  OpenConditionId = r0_0.RT_1,
  OpenSystemDesc = {
    "UI_Disabled_Des_Shop",
    "UI_Disabled_InStoryMode"
  },
  UIUnlockDesc = "UI_Locked_Des_Shop",
  UIUnlockName = "MAIN_UI_SHOP",
  UIUnlockRuleId = "Shop",
  UnlockPopupType = "Normal",
}
r4_0.Skill = {
  AfterUIUnlockDesc = "System_Des_Skill",
  ConditionId = 4021,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Armory.T_Entrance_Armory",
  IsHideUnlockPopup = 1,
  OpenConditionId = r0_0.RT_3,
  OpenSystemDesc = r0_0.RT_2,
  UIUnlockDesc = "UI_Locked_Des_Armory",
  UIUnlockName = "MAIN_UI_SKILL",
  UIUnlockRuleId = "Skill",
  UnlockPopupType = "Normal",
}
r4_0.Squad = {
  AfterUIUnlockDesc = "System_Des_Play",
  ConditionId = 4320,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Pve.T_Entrance_Pve",
  IsHideUnlockPopup = 1,
  OpenConditionId = r0_0.RT_1,
  OpenSystemDesc = r0_0.RT_5,
  UIUnlockDesc = "UI_Locked_Des_Play",
  UIUnlockName = "UI_Squad",
  UIUnlockRuleId = "Squad",
  UnlockPopupType = "Normal",
}
r4_0.StarterQuest = {
  AfterUIUnlockDesc = "System_Des_StarterQuest",
  ConditionId = 4370,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_StarterQuest.T_Entrance_StarterQuest",
  OpenConditionId = r0_0.RT_1,
  OpenSystemDesc = {
    "UI_Disabled_Des_StarterQuest"
  },
  UIUnlockDesc = "UI_Locked_Des_StarterQuest",
  UIUnlockName = "MAIN_UI_STARTERQUEST",
  UIUnlockRuleId = "StarterQuest",
  UnlockPopupType = "Normal",
}
r4_0.Swatch = {
  AfterUIUnlockDesc = "System_Des_Armory",
  ConditionId = 4020,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Armory.T_Entrance_Armory",
  IsHideUnlockPopup = 1,
  OpenConditionId = r0_0.RT_3,
  OpenSystemDesc = r0_0.RT_2,
  UIUnlockDesc = "UI_Locked_Des_Armory",
  UIUnlockName = "MAIN_UI_ARMORY",
  UIUnlockRuleId = "Swatch",
  UnlockPopupType = "Normal",
}
r4_0.TODSetting = {
  ConditionId = 4400,
  IsHideUnlockPopup = 1,
  UIUnlockRuleId = "TODSetting",
}
r4_0.Temple = {
  AfterUIUnlockDesc = "System_Des_Temple_CBT3",
  ConditionId = 4230,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Temple.T_Entrance_Temple",
  OpenConditionId = r0_0.RT_1,
  OpenSystemDesc = {
    "UI_Disabled_Des_Temple",
    "UI_Disabled_InStoryMode"
  },
  UIUnlockDesc = "UI_Locked_Des_Temple",
  UIUnlockName = "MAIN_UI_Temple",
  UIUnlockRuleId = "Temple",
  UnlockPopupType = "Light",
}
r4_0.TimeRewardShopTab = {
  ConditionId = 4240,
  IsHideUnlockPopup = 1,
  OpenConditionId = r0_0.RT_1,
  OpenSystemDesc = r0_0.RT_8,
  UIUnlockName = "UI_SHOP_MAINTAB_COMPLEX_2",
  UIUnlockRuleId = "TimeRewardShopTab",
}
r4_0.UWeapon = {
  AfterUIUnlockDesc = "System_Des_Uweapon",
  ConditionId = 4041,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Armory.T_Entrance_Armory",
  IsHideUnlockPopup = 1,
  OpenConditionId = r0_0.RT_3,
  OpenSystemDesc = r0_0.RT_2,
  UIUnlockDesc = "UI_Locked_Des_Armory",
  UIUnlockName = "MAIN_UI_UWEAPON",
  UIUnlockRuleId = "UWeapon",
  UnlockPopupType = "Normal",
}
r4_0.WalnutBag = {
  AfterUIUnlockDesc = "System_Des_WalnutBag_CBT3",
  ConditionId = 4340,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Walnut.T_Entrance_Walnut",
  OpenConditionId = r0_0.RT_1,
  OpenSystemDesc = {
    "UI_Disabled_Des_WalnutBag",
    "UI_Disabled_InStoryMode"
  },
  UIUnlockDesc = "UI_Locked_Des_WalnutBag",
  UIUnlockName = "MAIN_UI_WALNUTBAG",
  UIUnlockRuleId = "WalnutBag",
  UnlockPopupType = "Light",
}
r4_0.WalnutSell = {
  ConditionId = 4341,
  IsHideUnlockPopup = 1,
  OpenConditionId = r0_0.RT_1,
  UIUnlockRuleId = "WalnutSell",
}
r4_0.Wiki = {
  AfterUIUnlockDesc = "System_Des_Wiki",
  ConditionId = 4070,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Wiki.T_Entrance_Wiki",
  IsHideUnlockPopup = 1,
  OpenConditionId = r0_0.RT_1,
  OpenSystemDesc = {
    "UI_Disabled_Des_Wiki"
  },
  UIUnlockDesc = "UI_Locked_Des_Wiki",
  UIUnlockName = "MAIN_UI_WIKI",
  UIUnlockRuleId = "Wiki",
  UnlockPopupType = "Light",
}
r4_0.YanjinduShopTab = {
  ConditionId = 325,
  IsHideUnlockPopup = 1,
  OpenConditionId = r0_0.RT_1,
  OpenSystemDesc = r0_0.RT_7,
  UIUnlockName = "UI_SHOP_TAB_ExploreBadge_EXChapter01",
  UIUnlockRuleId = "YanjinduShopTab",
}
return r2_0(r3_0, r4_0)
