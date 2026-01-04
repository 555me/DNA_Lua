-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\ReddotNode.lua
-- version: lua54
-- line: [0, 0] id: 0
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end
local r2_0 = "ReddotNode"
local r3_0 = {
  AbyssEntry1 = {
    CacheType = 1,
    IsLeaf = true,
    Name = "AbyssEntry1",
    Type = 0,
  },
  AbyssEntry2 = {
    CacheType = 1,
    IsLeaf = true,
    Name = "AbyssEntry2",
    Type = 0,
  },
}
r3_0.AbyssMain = {
  Childs = {
    "AbyssReward"
  },
  Name = "AbyssMain",
}
r3_0.AbyssReward = {
  CacheType = 1,
  IsLeaf = true,
  Name = "AbyssReward",
  Type = 0,
  bInvokeEveryTime = true,
}
r3_0.AchieveMain = {
  Name = "AchieveMain",
}
r3_0.Acti_Abyss01 = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Acti_Abyss01",
  NodeModuleName = "Activity.Abyss",
  Type = 0,
}
r3_0.Acti_Abyss02 = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Acti_Abyss02",
  NodeModuleName = "Activity.Abyss",
  Type = 0,
}
r3_0.Acti_BetaAward = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Acti_BetaAward",
  NodeModuleName = "Activity.ConditionReward",
  Type = 0,
}
r3_0.Acti_ChallengeLevel = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Acti_ChallengeLevel",
  NodeModuleName = "Activity.ChallengeLevel",
  Type = 0,
}
r3_0.Acti_Community = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Acti_Community",
  NodeModuleName = "Activity.Community",
  Type = 0,
}
r3_0.Acti_DobuleMod = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Acti_DobuleMod",
  NodeModuleName = "Activity.ActivityBase",
  Type = 0,
}
r3_0.Acti_DongGuo = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Acti_DongGuo",
  NodeModuleName = "Activity.QuestEvent",
  Type = 0,
}
r3_0.Acti_DongGuo02 = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Acti_DongGuo02",
  NodeModuleName = "Activity.QuestEvent",
  Type = 0,
}
r3_0.Acti_FeinaEvent = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Acti_FeinaEvent",
  NodeModuleName = "Activity.FeinaEvent",
  Type = 0,
}
r3_0.Acti_GiveAoge = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Acti_GiveAoge",
  NodeModuleName = "Activity.ActivityBase",
  Type = 0,
}
r3_0.Acti_GiveBaonu = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Acti_GiveBaonu",
  NodeModuleName = "Activity.ActivityBase",
  Type = 0,
}
r3_0.Acti_GiveDafunie = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Acti_GiveDafunie",
  NodeModuleName = "Activity.ActivityBase",
  Type = 0,
}
r3_0.Acti_GiveSonglu = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Acti_GiveSonglu",
  NodeModuleName = "Activity.ActivityBase",
  Type = 0,
}
r3_0.Acti_JJGame = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Acti_JJGame",
  NodeModuleName = "Activity.JJGame",
  Type = 0,
}
r3_0.Acti_MidTerm = {
  Childs = {
    "Acti_JJGame",
    "JJGameTask_Normal_Reddot",
    "JJGameTask_Challenge_Reddot",
    "JJGameTask_Normal_New",
    "JJGameTask_Challenge_New"
  },
  Name = "Acti_MidTerm",
  bInvokeEveryTime = true,
}
r3_0.Acti_MultiDeviceLogin = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Acti_MultiDeviceLogin",
  NodeModuleName = "Activity.ConditionReward",
  Type = 0,
}
r3_0.Acti_PaoTai = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Acti_PaoTai",
  NodeModuleName = "Activity.PaoTai",
  Type = 1,
}
r3_0.Acti_PaoTaiTab = {
  Childs = {
    "Acti_PaoTai",
    "PaotaiEventReward",
    "PaotaiEventNewLevel"
  },
  Name = "Acti_PaoTaiTab",
  bInvokeEveryTime = true,
}
r3_0.Acti_RegionOnline = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Acti_RegionOnline",
  NodeModuleName = "Activity.ConditionReward",
  Type = 0,
}
r3_0.Acti_Rouge = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Acti_Rouge",
  NodeModuleName = "Activity.Rouge",
  Type = 0,
}
r3_0.Acti_SignIn11 = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Acti_SignIn11",
  NodeModuleName = "Activity.DailySignIn",
  Type = 0,
}
r3_0.Acti_SignInFeina = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Acti_SignInFeina",
  NodeModuleName = "Activity.DailySignIn",
  Type = 0,
}
r3_0.Acti_SignInFuShu = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Acti_SignInFuShu",
  NodeModuleName = "Activity.DailySignIn",
  Type = 0,
}
r3_0.Acti_SignInKezhou = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Acti_SignInKezhou",
  NodeModuleName = "Activity.DailySignIn",
  Type = 0,
}
r3_0.Acti_SignInSaiqi = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Acti_SignInSaiqi",
  NodeModuleName = "Activity.DailySignIn",
  Type = 0,
}
r3_0.Acti_SoloRaid = {
  Childs = {
    "RaidReward",
    "Acti_SoloRaidSub"
  },
  Name = "Acti_SoloRaid",
}
r3_0.Acti_SoloRaidSub = {
  CacheType = -1,
  IsLeaf = true,
  Name = "Acti_SoloRaidSub",
  NodeModuleName = "Activity.GuildWar",
  Type = 0,
  bInvokeEveryTime = true,
}
r3_0.Acti_Temple = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Acti_Temple",
  NodeModuleName = "Activity.ActivityBase",
  Type = 1,
}
r3_0.Acti_TempleTab = {
  Childs = {
    "Acti_Temple",
    "TempleSoloEventReward",
    "TempleSoloNewLevel"
  },
  Name = "Acti_TempleTab",
  bInvokeEveryTime = true,
}
r3_0.Acti_Theater = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Acti_Theater",
  NodeModuleName = "Activity.Theater",
  Type = 0,
}
r3_0.Acti_TrailFeinaChar = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Acti_TrailFeinaChar",
  NodeModuleName = "Activity.TrialChar",
  Type = 1,
}
r3_0.Acti_TrailFuShuChar = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Acti_TrailFuShuChar",
  NodeModuleName = "Activity.TrialChar",
  Type = 1,
}
r3_0.Acti_TrailFuShuSkin01 = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Acti_TrailFuShuSkin01",
  NodeModuleName = "Activity.TrialChar",
  Type = 1,
}
r3_0.Acti_TrailKezhouChar = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Acti_TrailKezhouChar",
  NodeModuleName = "Activity.TrialChar",
  Type = 1,
}
r3_0.Acti_TrailSaiqiSkin01 = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Acti_TrailSaiqiSkin01",
  NodeModuleName = "Activity.TrialChar",
  Type = 1,
}
r3_0.Acti_TrailShuimuSkin01 = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Acti_TrailShuimuSkin01",
  NodeModuleName = "Activity.TrialChar",
  Type = 1,
}
r3_0.Acti_TrailSkin01 = {
  Childs = {
    "Acti_TrailSaiqiSkin01",
    "Acti_TrailSongluSkin01",
    "Acti_TrailShuimuSkin01"
  },
  Name = "Acti_TrailSkin01",
  bInvokeEveryTime = true,
}
r3_0.Acti_TrailSongluSkin01 = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Acti_TrailSongluSkin01",
  NodeModuleName = "Activity.TrialChar",
  Type = 1,
}
r3_0.Acti_WebJumpEvent01 = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Acti_WebJumpEvent01",
  NodeModuleName = "Activity.WebJumpEvent",
  Type = 0,
}
r3_0.Acti_ZhiliuEvent = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Acti_ZhiliuEvent",
  NodeModuleName = "Activity.ZhiliuEvent",
  Type = 0,
}
r3_0.ActivityAnnouncement = {
  CacheType = 0,
  IsLeaf = true,
  Name = "ActivityAnnouncement",
  Type = 1,
  bInvokeEveryTime = true,
}
r3_0.ActivityHub = {
  Name = "ActivityHub",
  bInvokeEveryTime = true,
}
r3_0.AnglingMap = {
  CacheType = 1,
  IsLeaf = true,
  Name = "AnglingMap",
  Type = 0,
}
r3_0.AnnouncementDirty = {
  CacheType = 0,
  IsLeaf = true,
  Name = "AnnouncementDirty",
  Type = 1,
  bInvokeEveryTime = true,
}
r3_0.AnnouncementItems = {
  Childs = {
    "SystemAnnouncement",
    "ActivityAnnouncement",
    "NewsAnnouncement",
    "AnnouncementDirty"
  },
  Name = "AnnouncementItems",
}
r3_0.Archive = {
  Childs = {
    "ArchiveReward"
  },
  Name = "Archive",
}
r3_0.ArchiveNewChar = {
  CacheType = 1,
  IsLeaf = true,
  Name = "ArchiveNewChar",
  Type = 0,
  bInvokeEveryTime = true,
}
r3_0.ArchiveNewMelee = {
  CacheType = 1,
  IsLeaf = true,
  Name = "ArchiveNewMelee",
  Type = 0,
  bInvokeEveryTime = true,
}
r3_0.ArchiveNewMonster = {
  CacheType = 1,
  IsLeaf = true,
  Name = "ArchiveNewMonster",
  Type = 0,
  bInvokeEveryTime = true,
}
r3_0.ArchiveNewRanged = {
  CacheType = 1,
  IsLeaf = true,
  Name = "ArchiveNewRanged",
  Type = 0,
  bInvokeEveryTime = true,
}
r3_0.ArchiveNewReadBook = {
  CacheType = 1,
  IsLeaf = true,
  Name = "ArchiveNewReadBook",
  Type = 0,
  bInvokeEveryTime = true,
}
r3_0.ArchiveNewResource = {
  CacheType = 1,
  IsLeaf = true,
  Name = "ArchiveNewResource",
  Type = 0,
  bInvokeEveryTime = true,
}
r3_0.ArchiveReward = {
  CacheType = 1,
  IsLeaf = true,
  Name = "ArchiveReward",
  Type = 0,
  bInvokeEveryTime = true,
}
r3_0.ArmoryBattleItem = {
  CacheType = 1,
  IsLeaf = true,
  Name = "ArmoryBattleItem",
  Type = 1,
}
r3_0.ArmoryMainMenu = {
  Childs = {
    "NewChar",
    "PromoteChar",
    "UnlockableChar",
    "ArmoryReward",
    "NewReleasedChar"
  },
  Name = "ArmoryMainMenu",
  bInvokeEveryTime = true,
}
r3_0.ArmoryReward = {
  Childs = {
    "CharReward",
    "MeleeReward",
    "RangedReward"
  },
  Name = "ArmoryReward",
}
r3_0.BattleMainMenu = {
  Childs = {
    "EscPortrait",
    "ExperienceMain",
    "ArmoryMainMenu",
    "Shop",
    "Gacha",
    "ForgeEntry",
    "AchieveMain",
    "Play",
    "Quest",
    "NormalMail",
    "AnnouncementItems",
    "NewGuideNote",
    "NewFriendRequest",
    "BattlePassMain",
    "ActivityHub",
    "Map",
    "Entertainment",
    "WikiReward",
    "WalnutBagItems",
    "Archive",
    "ModArchive",
    "Setting_Root",
    "DayAndNight"
  },
  Name = "BattleMainMenu",
  NodeModuleName = "BattleMainMenu",
}
r3_0.BattlePassMain = {
  Childs = {
    "BattlePassNewVision",
    "BattlePassReward",
    "BattlePassMission",
    "BattlePassPetSelection"
  },
  Name = "BattlePassMain",
}
r3_0.BattlePassMission = {
  CacheType = 1,
  IsLeaf = true,
  Name = "BattlePassMission",
  Type = 0,
  bInvokeEveryTime = true,
}
r3_0.BattlePassNewVision = {
  CacheType = 1,
  IsLeaf = true,
  Name = "BattlePassNewVision",
  Type = 0,
}
r3_0.BattlePassPetSelection = {
  CacheType = 1,
  IsLeaf = true,
  Name = "BattlePassPetSelection",
  Type = 0,
}
r3_0.BattlePassReward = {
  CacheType = 1,
  IsLeaf = true,
  Name = "BattlePassReward",
  Type = 0,
}
r3_0.CharReward = {
  CacheType = -1,
  IsLeaf = true,
  Name = "CharReward",
  Type = 0,
}
r3_0.ChatMainMenu = {
  Name = "ChatMainMenu",
}
r3_0.DailyMain = {
  CacheType = 1,
  IsLeaf = true,
  Name = "DailyMain",
  Type = 0,
}
r3_0.DayAndNight = {
  CacheType = 1,
  IsLeaf = true,
  Name = "DayAndNight",
  Type = 1,
}
r3_0.DetectiveAnswer = {
  CacheType = 1,
  IsLeaf = true,
  Name = "DetectiveAnswer",
  Type = 1,
}
r3_0.DetectiveQuestion = {
  CacheType = 1,
  IsLeaf = true,
  Name = "DetectiveQuestion",
  Type = 1,
}
r3_0.Dispatch = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Dispatch",
  Type = 0,
}
r3_0.EditBtn = {
  Childs = {
    "EscPortrait",
    "TitleBtn"
  },
  Name = "EditBtn",
}
r3_0.Entertainment = {
  Childs = {
    "Entertainment_Char"
  },
  Name = "Entertainment",
}
r3_0.Entertainment_Char = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Entertainment_Char",
  Type = 0,
}
r3_0.EscPortrait = {
  Childs = {
    "Portrait",
    "PortraitFrame"
  },
  Name = "EscPortrait",
}
r3_0.ExperienceItem = {
  CacheType = 1,
  IsLeaf = true,
  Name = "ExperienceItem",
  NodeModuleName = "Experience",
  Type = 0,
  bInvokeEveryTime = true,
}
r3_0.ExperienceMain = {
  Childs = {
    "ExperienceItem"
  },
  Name = "ExperienceMain",
}
r3_0.FeinaEventReward = {
  CacheType = 1,
  IsLeaf = true,
  Name = "FeinaEventReward",
  Type = 0,
  bInvokeEveryTime = true,
}
r3_0.ForgeEntry = {
  Name = "ForgeEntry",
}
r3_0.Gacha = {
  Childs = {
    "Gacha_Normal",
    "Gacha_Special",
    "Gacha_Special_2",
    "Gacha_New"
  },
  Name = "Gacha",
}
r3_0.Gacha_New = {
  CacheType = 0,
  IsLeaf = true,
  Name = "Gacha_New",
  NodeModuleName = "Gacha",
  Type = 1,
}
r3_0.Gacha_Normal = {
  CacheType = 0,
  IsLeaf = true,
  Name = "Gacha_Normal",
  NodeModuleName = "Gacha",
  Type = 0,
}
r3_0.Gacha_Special = {
  CacheType = 0,
  IsLeaf = true,
  Name = "Gacha_Special",
  NodeModuleName = "Gacha",
  Type = 0,
}
r3_0.Gacha_Special_2 = {
  CacheType = 0,
  IsLeaf = true,
  Name = "Gacha_Special_2",
  NodeModuleName = "Gacha",
  Type = 0,
}
r3_0.HardBossItem = {
  CacheType = 1,
  IsLeaf = true,
  Name = "HardBossItem",
  Type = 1,
}
r3_0.HardBossMain = {
  CacheType = 1,
  IsLeaf = true,
  Name = "HardBossMain",
  Type = 0,
}
r3_0.JJGameTask_Challenge_New = {
  CacheType = 1,
  IsLeaf = true,
  Name = "JJGameTask_Challenge_New",
  Type = 1,
}
r3_0.JJGameTask_Challenge_Reddot = {
  CacheType = 1,
  IsLeaf = true,
  Name = "JJGameTask_Challenge_Reddot",
  Type = 0,
  bInvokeEveryTime = true,
}
r3_0.JJGameTask_Normal_New = {
  CacheType = 1,
  IsLeaf = true,
  Name = "JJGameTask_Normal_New",
  Type = 1,
}
r3_0.JJGameTask_Normal_Reddot = {
  CacheType = 1,
  IsLeaf = true,
  Name = "JJGameTask_Normal_Reddot",
  Type = 0,
  bInvokeEveryTime = true,
}
r3_0.Map = {
  Childs = {
    "Dispatch"
  },
  Name = "Map",
}
r3_0.MeleeReward = {
  CacheType = -1,
  IsLeaf = true,
  Name = "MeleeReward",
  Type = 0,
}
r3_0.ModArchive = {
  Childs = {
    "ModArchive_Task",
    "ModArchive_Archive"
  },
  Name = "ModArchive",
}
r3_0.ModArchive_Archive = {
  Childs = {
    "ModArchive_Archive_Char",
    "ModArchive_Archive_Melee",
    "ModArchive_Archive_Range",
    "ModArchive_Archive_MeleeUltra",
    "ModArchive_Archive_RangeUltra"
  },
  Name = "ModArchive_Archive",
}
r3_0.ModArchive_Archive_Char = {
  CacheType = 1,
  IsLeaf = true,
  Name = "ModArchive_Archive_Char",
  NodeModuleName = "ModArchive",
  Type = 1,
}
r3_0.ModArchive_Archive_Melee = {
  CacheType = 1,
  IsLeaf = true,
  Name = "ModArchive_Archive_Melee",
  NodeModuleName = "ModArchive",
  Type = 1,
}
r3_0.ModArchive_Archive_MeleeUltra = {
  CacheType = 1,
  IsLeaf = true,
  Name = "ModArchive_Archive_MeleeUltra",
  NodeModuleName = "ModArchive",
  Type = 1,
}
r3_0.ModArchive_Archive_Range = {
  CacheType = 1,
  IsLeaf = true,
  Name = "ModArchive_Archive_Range",
  NodeModuleName = "ModArchive",
  Type = 1,
}
r3_0.ModArchive_Archive_RangeUltra = {
  CacheType = 1,
  IsLeaf = true,
  Name = "ModArchive_Archive_RangeUltra",
  NodeModuleName = "ModArchive",
  Type = 1,
}
r3_0.ModArchive_Task = {
  CacheType = 1,
  IsLeaf = true,
  Name = "ModArchive_Task",
  NodeModuleName = "ModArchive",
  Type = 1,
}
r3_0.NewChar = {
  CacheType = 1,
  IsLeaf = true,
  Name = "NewChar",
  Type = 1,
}
r3_0.NewFriendRequest = {
  CacheType = 1,
  IsLeaf = true,
  Name = "NewFriendRequest",
  Type = 0,
}
r3_0.NewGuideNote = {
  CacheType = 1,
  IsLeaf = true,
  Name = "NewGuideNote",
  Type = 1,
}
r3_0.NewReleasedChar = {
  CacheType = 1,
  IsLeaf = true,
  Name = "NewReleasedChar",
  Type = 1,
}
r3_0.NewsAnnouncement = {
  CacheType = 0,
  IsLeaf = true,
  Name = "NewsAnnouncement",
  Type = 1,
  bInvokeEveryTime = true,
}
r3_0.NormalMail = {
  CacheType = -1,
  IsLeaf = true,
  Name = "NormalMail",
  Type = 3,
  bInvokeEveryTime = true,
}
r3_0.OnlineActionBtn = {
  CacheType = -1,
  IsLeaf = true,
  Name = "OnlineActionBtn",
  Type = 1,
}
r3_0.PaotaiEventNewBuff = {
  CacheType = 1,
  IsLeaf = true,
  Name = "PaotaiEventNewBuff",
  Type = 1,
  bInvokeEveryTime = true,
}
r3_0.PaotaiEventNewLevel = {
  CacheType = 1,
  IsLeaf = true,
  Name = "PaotaiEventNewLevel",
  Type = 1,
  bInvokeEveryTime = true,
}
r3_0.PaotaiEventReward = {
  CacheType = 1,
  IsLeaf = true,
  Name = "PaotaiEventReward",
  Type = 0,
  bInvokeEveryTime = true,
}
r3_0.Play = {
  Childs = {
    "HardBossMain",
    "PlayCommon",
    "PlayTaskRoot"
  },
  Name = "Play",
}
r3_0.PlayCommon = {
  Childs = {
    "RougeMain",
    "AbyssMain"
  },
  Name = "PlayCommon",
}
r3_0.PlayTaskRoot = {
  Childs = {
    "StarterQuest",
    "DailyMain"
  },
  Name = "PlayTaskRoot",
}
r3_0.Portrait = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Portrait",
  Type = 1,
  bInvokeEveryTime = true,
}
r3_0.PortraitFrame = {
  CacheType = 1,
  IsLeaf = true,
  Name = "PortraitFrame",
  Type = 1,
  bInvokeEveryTime = true,
}
r3_0.PromoteChar = {
  CacheType = 1,
  IsLeaf = true,
  Name = "PromoteChar",
  Type = 0,
}
r3_0.Quest = {
  Childs = {
    "UI_QUEST_SUBTAB_NAME_ALL",
    "UI_QUEST_SUBTAB_NAME_MAIN",
    "UI_QUEST_SUBTAB_NAME_Activity",
    "UI_QUEST_SUBTAB_NAME_LimitedtimeActivity",
    "UI_QUEST_SUBTAB_NAME_SpecialSlide",
    "UI_QUEST_SUBTAB_NAME_SIDE"
  },
  Name = "Quest",
}
r3_0.RaidReward = {
  CacheType = 1,
  IsLeaf = true,
  Name = "RaidReward",
  Type = 0,
  bInvokeEveryTime = true,
}
r3_0.RangedReward = {
  CacheType = -1,
  IsLeaf = true,
  Name = "RangedReward",
  Type = 0,
}
r3_0.RougeArchiveBlessing = {
  CacheType = 1,
  IsLeaf = true,
  Name = "RougeArchiveBlessing",
  Type = 1,
}
r3_0.RougeArchiveEvent = {
  CacheType = 1,
  IsLeaf = true,
  Name = "RougeArchiveEvent",
  Type = 1,
}
r3_0.RougeArchiveMain = {
  Childs = {
    "RougeArchiveReward"
  },
  Name = "RougeArchiveMain",
}
r3_0.RougeArchiveNew = {
  Childs = {
    "RougeArchiveTreasure",
    "RougeArchiveBlessing",
    "RougeArchiveStory",
    "RougeArchiveEvent"
  },
  Name = "RougeArchiveNew",
}
r3_0.RougeArchiveReward = {
  CacheType = 1,
  IsLeaf = true,
  Name = "RougeArchiveReward",
  Type = 0,
  bInvokeEveryTime = true,
}
r3_0.RougeArchiveStory = {
  CacheType = 1,
  IsLeaf = true,
  Name = "RougeArchiveStory",
  Type = 1,
}
r3_0.RougeArchiveTreasure = {
  CacheType = 1,
  IsLeaf = true,
  Name = "RougeArchiveTreasure",
  Type = 1,
}
r3_0.RougeLikeReward = {
  CacheType = 1,
  IsLeaf = true,
  Name = "RougeLikeReward",
  Type = 0,
}
r3_0.RougeMain = {
  Childs = {
    "RougeLikeReward",
    "RougeArchiveMain"
  },
  Name = "RougeMain",
}
r3_0.Setting_Control = {
  Childs = {
    "Setting_Layout"
  },
  Name = "Setting_Control",
}
r3_0.Setting_Layout = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Setting_Layout",
  Type = 1,
}
r3_0.Setting_Root = {
  Childs = {
    "Setting_Control",
    "Setting_Tab_Other"
  },
  Name = "Setting_Root",
}
r3_0.Setting_Service = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Setting_Service",
  Type = 0,
}
r3_0.Setting_Tab_Other = {
  Childs = {
    "Setting_Service"
  },
  Name = "Setting_Tab_Other",
}
r3_0.Shop = {
  Childs = {
    "Shop_Item",
    "Shop_Skin",
    "Shop_Gacha",
    "Shop_Pack",
    "Shop_Walnut"
  },
  Name = "Shop",
}
r3_0.Shop_Gacha = {
  Childs = {
    "Shop_Gacha_Higth",
    "Shop_Gacha_Low"
  },
  Name = "Shop_Gacha",
}
r3_0.Shop_Gacha_Higth = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Shop_Gacha_Higth",
  NodeModuleName = "Shop",
  Type = 1,
}
r3_0.Shop_Gacha_Low = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Shop_Gacha_Low",
  NodeModuleName = "Shop",
  Type = 1,
}
r3_0.Shop_Item = {
  Childs = {
    "Shop_Item_Yueshi",
    "Shop_Item_Yueshijingpei",
    "Shop_Item_CharPiece",
    "Shop_Item_Weapon"
  },
  Name = "Shop_Item",
}
r3_0.Shop_Item_CharPiece = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Shop_Item_CharPiece",
  NodeModuleName = "Shop",
  Type = 1,
}
r3_0.Shop_Item_Weapon = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Shop_Item_Weapon",
  NodeModuleName = "Shop",
  Type = 1,
}
r3_0.Shop_Item_Yueshi = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Shop_Item_Yueshi",
  NodeModuleName = "Shop",
  Type = 1,
}
r3_0.Shop_Item_Yueshijingpei = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Shop_Item_Yueshijingpei",
  NodeModuleName = "Shop",
  Type = 1,
}
r3_0.Shop_Pack = {
  Childs = {
    "Shop_Pack_Limit",
    "Shop_Pack_Skin",
    "Shop_Pack_Item",
    "Shop_Pack_Month",
    "Shop_Pack_Week"
  },
  Name = "Shop_Pack",
}
r3_0.Shop_Pack_Item = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Shop_Pack_Item",
  NodeModuleName = "Shop",
  Type = 1,
}
r3_0.Shop_Pack_Limit = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Shop_Pack_Limit",
  NodeModuleName = "Shop",
  Type = 1,
}
r3_0.Shop_Pack_Month = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Shop_Pack_Month",
  NodeModuleName = "Shop",
  Type = 1,
}
r3_0.Shop_Pack_Skin = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Shop_Pack_Skin",
  NodeModuleName = "Shop",
  Type = 1,
}
r3_0.Shop_Pack_Week = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Shop_Pack_Week",
  NodeModuleName = "Shop",
  Type = 1,
}
r3_0.Shop_Skin = {
  Childs = {
    "Shop_Skin_Head",
    "Shop_Skin_Face",
    "Shop_Skin_Waist",
    "Shop_Skin_Back",
    "Shop_Skin_Weapon",
    "Shop_Skin_Suit",
    "Shop_Skin_Effect"
  },
  Name = "Shop_Skin",
}
r3_0.Shop_Skin_Back = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Shop_Skin_Back",
  NodeModuleName = "Shop",
  Type = 1,
}
r3_0.Shop_Skin_Effect = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Shop_Skin_Effect",
  NodeModuleName = "Shop",
  Type = 1,
}
r3_0.Shop_Skin_Face = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Shop_Skin_Face",
  NodeModuleName = "Shop",
  Type = 1,
}
r3_0.Shop_Skin_Head = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Shop_Skin_Head",
  NodeModuleName = "Shop",
  Type = 1,
}
r3_0.Shop_Skin_Suit = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Shop_Skin_Suit",
  NodeModuleName = "Shop",
  Type = 1,
}
r3_0.Shop_Skin_Waist = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Shop_Skin_Waist",
  NodeModuleName = "Shop",
  Type = 1,
}
r3_0.Shop_Skin_Weapon = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Shop_Skin_Weapon",
  NodeModuleName = "Shop",
  Type = 1,
}
r3_0.Shop_Walnut = {
  Childs = {
    "Shop_Walnut_3",
    "Shop_Walnut_1",
    "Shop_Walnut_2"
  },
  Name = "Shop_Walnut",
}
r3_0.Shop_Walnut_1 = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Shop_Walnut_1",
  NodeModuleName = "Shop",
  RuleId = "SecretLetterShopTab",
  Type = 1,
}
r3_0.Shop_Walnut_2 = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Shop_Walnut_2",
  NodeModuleName = "Shop",
  RuleId = "SecretLetterShopTab",
  Type = 1,
}
r3_0.Shop_Walnut_3 = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Shop_Walnut_3",
  NodeModuleName = "Shop",
  RuleId = "SecretLetterShopTab",
  Type = 1,
}
r3_0.StarterQuest = {
  CacheType = 1,
  IsLeaf = true,
  Name = "StarterQuest",
  Type = 0,
}
r3_0.SystemAnnouncement = {
  CacheType = 0,
  IsLeaf = true,
  Name = "SystemAnnouncement",
  Type = 1,
  bInvokeEveryTime = true,
}
r3_0.TempleSoloEventReward = {
  CacheType = 1,
  IsLeaf = true,
  Name = "TempleSoloEventReward",
  Type = 0,
  bInvokeEveryTime = true,
}
r3_0.TempleSoloNewLevel = {
  CacheType = 1,
  IsLeaf = true,
  Name = "TempleSoloNewLevel",
  NodeModuleName = "Activity.IActivityBase",
  Type = 1,
  bInvokeEveryTime = true,
}
r3_0.TheaterEventReward = {
  CacheType = 1,
  IsLeaf = true,
  Name = "TheaterEventReward",
  Type = 0,
  bInvokeEveryTime = true,
}
r3_0.Title = {
  CacheType = 1,
  IsLeaf = true,
  Name = "Title",
  Type = 1,
}
r3_0.TitleBtn = {
  CacheType = 1,
  IsLeaf = true,
  Name = "TitleBtn",
  Type = 1,
}
r3_0.TitleFrame = {
  CacheType = 1,
  IsLeaf = true,
  Name = "TitleFrame",
  Type = 1,
}
r3_0.TitleFrameTab = {
  Childs = {
    "TitleFrame"
  },
  Name = "TitleFrameTab",
}
r3_0.TitleTab = {
  Childs = {
    "Title"
  },
  Name = "TitleTab",
}
r3_0.UI_QUEST_SUBTAB_NAME_ALL = {
  Childs = {
    "UI_QUEST_SUBTAB_NAME_MAIN",
    "UI_QUEST_SUBTAB_NAME_Activity",
    "UI_QUEST_SUBTAB_NAME_LimitedtimeActivity",
    "UI_QUEST_SUBTAB_NAME_SpecialSlide",
    "UI_QUEST_SUBTAB_NAME_SIDE"
  },
  Name = "UI_QUEST_SUBTAB_NAME_ALL",
}
r3_0.UI_QUEST_SUBTAB_NAME_Activity = {
  CacheType = 1,
  IsLeaf = true,
  Name = "UI_QUEST_SUBTAB_NAME_Activity",
  NodeModuleName = "Quest",
  Type = 1,
}
r3_0.UI_QUEST_SUBTAB_NAME_LimitedtimeActivity = {
  CacheType = 1,
  IsLeaf = true,
  Name = "UI_QUEST_SUBTAB_NAME_LimitedtimeActivity",
  NodeModuleName = "Quest",
  Type = 1,
}
r3_0.UI_QUEST_SUBTAB_NAME_MAIN = {
  CacheType = 1,
  IsLeaf = true,
  Name = "UI_QUEST_SUBTAB_NAME_MAIN",
  NodeModuleName = "Quest",
  Type = 1,
}
r3_0.UI_QUEST_SUBTAB_NAME_SIDE = {
  CacheType = 1,
  IsLeaf = true,
  Name = "UI_QUEST_SUBTAB_NAME_SIDE",
  NodeModuleName = "Quest",
  Type = 1,
}
r3_0.UI_QUEST_SUBTAB_NAME_SpecialSlide = {
  CacheType = 1,
  IsLeaf = true,
  Name = "UI_QUEST_SUBTAB_NAME_SpecialSlide",
  NodeModuleName = "Quest",
  Type = 1,
}
r3_0.UnlockableChar = {
  CacheType = -1,
  IsLeaf = true,
  Name = "UnlockableChar",
  Type = 0,
}
r3_0.WalnutBagItems = {
  CacheType = 1,
  IsLeaf = true,
  Name = "WalnutBagItems",
  Type = 1,
}
r3_0.WikiEntrance = {
  Childs = {
    "WikiItems"
  },
  Name = "WikiEntrance",
}
r3_0.WikiItems = {
  CacheType = 1,
  IsLeaf = true,
  Name = "WikiItems",
  Type = 1,
}
r3_0.WikiReward = {
  CacheType = 1,
  IsLeaf = true,
  Name = "WikiReward",
  Type = 0,
}
return r1_0(r2_0, r3_0)
