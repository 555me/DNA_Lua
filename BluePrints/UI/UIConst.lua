-- filename: @E:/Pack/Branch/OBT10_Geili\Content/Script/BluePrints\UI\UIConst.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  ZORDER_UNDER_ALL = -127,
  ZORDER_FOR_DAMAGETIPS = -9,
  ZORDER_FOR_MORIBUND = -8,
  ZORDER_FOR_INDICATORS = -7,
  ZORDER_FOT_TAKE_AIM_INDICATOR = -6,
  ZORDER_FOR_MAINPAGE = -5,
  ZORDER_FOR_JOYSTICK = -4,
  ZORDER_FOR_DESKTOP = -3,
  ZORDER_FOR_DESKTOP_TEMP = -2,
  ZORDER_FOR_LONG_DIS = -1,
  ZORDER_FOR_ZERO = 0,
  ZORDER_FOR_NORMAL = 1,
  ZORDER_FOR_SECONDARY_POPUP = 5,
  ZORDER_SCREEN_EFFECT = 8,
  ZORDER_FOR_COMMON_TIP = 10,
  ZORDER_FOR_TOP_TIP = 11,
  ZORDER_FOR_CHANGE_SCENE = 20,
  ZORDER_ABOVE_SystemGuide = 104,
  ZORDER_FOR_NET_DISCONNECT = 110,
  ZORDER_ABOVE_ALL = 127,
  WORLDTASKMAIN = "/Game/UI/UI_PC/MainInterfaceUI/WBP_WorldTask.WBP_WorldTask_C",
  BATTLEWEAPONHINT = "/Game/UI/UI_Phone/Battle/Battle_Weapon_Hint.Battle_Weapon_Hint_C",
  SCENESTARTUI = "/Game/UI/WBP/Common/Class/Scene_StartUI.Scene_StartUI_C",
  PICKUPITEMTIPS = "/Game/UI/UI_PC/PickUp/WBP_ButtomPickUpTips.WBP_ButtomPickUpTips_C",
  PICKUPITEMPANEL = "/Game/BluePrints/UI/WBP_PickUpItemsPanel.WBP_PickUpItemsPanel_C",
  TASKINDICATORUIBASE = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Task.Guide_Icon_Task",
  TASKINDICATORUI = {
    Task = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Task_Mission.Guide_Icon_Task_Mission",
    Dynamic = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Task_Dynamic.Guide_Icon_Task_Dynamic",
    UnSpecialSide = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Task_UnSpecialSide.Guide_Icon_Task_UnSpecialSide",
  },
  GUIDETEXTFLOAT = "/Game/UI/UI_PC/Guide/Guide_TextFloat_PC.Guide_TextFloat_PC_C",
  GUIDEMAIN = "/Game/UI/UI_PC/Guide/Guide_Image/Guide_Image_Main.Guide_Image_Main_C",
  MONSTEREXPTIPS = "/Game/UI/UI_PC/Battle/JumpWord_Other.JumpWord_Other",
  GRENADESTIPS = "/Game/UI/WBP/Battle/Widget/WBP_Battle_Grenades.WBP_Battle_Grenades_C",
  ACHIEVEMENTPANEL = "/Game/UI/UI_PC/Achievement/Achievement_PCNew.Achievement_PCNew_C",
  BOSSBLOOD = "/Game/UI/UI_PC/Battle/Battle_Blood_Boss_Part_PC_New.Battle_Blood_Boss_Part_PC_New_C",
  CAPTUREINTERACTIVE = "/Game/UI/UI_PC/Prologue/Prologue_Capture_PC.Prologue_Capture_PC",
  ENERGYSUPPLYBUFF = "/Game/UI/UI_PC/Guide/Guide_TextFloat02_PC.Guide_TextFloat02_PC_C",
  WEAPONTIPS = "/Game/UI/UI_PC/MainInterfaceUI/WBP_Special_FullScreen.WBP_Special_FullScreen_C",
  WARNINGHINT = "/Game/UI/UI_PC/Guide/Guide_Text_Warning_PC.Guide_Text_Warning_PC_C",
  DESTROYALARM = "/Game/UI/UI_PC/Battle/Destroy/Battle_Destroy_Alarm_PC.Battle_Destroy_Alarm_PC_C",
  WARNINGTOAST = "/Game/UI/UI_PC/Common/Common_Toast/Common_Toast_Warning_PC.Common_Toast_Warning_PC_C",
  NEWMAPLEVELSELECT = "/Game/UI/UI_PC/LevelMap/World/LevelMap_World_PC.LevelMap_World_PC_C",
  MAPLEVELWORLDTIMELINE = "/Game/UI/UI_PC/LevelMap/World/LevelMap_World_TimeLine_PC.LevelMap_World_TimeLine_PC_C",
  PRELOGINCGANIM = "/Game/UI/UI_PC/Video/WBP_CGMovie.WBP_CGMovie_C",
  LOGINMAINPAGE = "/Game/UI/UI_PC/Login/Login_Main_PC.Login_Main_PC_C",
  SERVERSELEC = "/Game/UI/UI_PC/Login/WBP_ServerSelect.WBP_ServerSelect_C",
  ARMORYWEAPONCARD = "/Game/UI/WBP/Armory/PC/WBP_Armory_WeaponCardLevel_P.WBP_Armory_WeaponCardLevel_P_C",
  CHARRECORD_PC = "/Game/UI/WBP/Armory/PC/WBP_Armory_RecordSub_P.WBP_Armory_RecordSub_P",
  CHARRECORD_MOBILE = "/Game/UI/WBP/Armory/Mobile/WBP_Armory_RecordSub_M.WBP_Armory_RecordSub_M",
  CARDLEVEL_PC = "/Game/UI/WBP/Armory/PC/WBP_Armory_CardLevel_P.WBP_Armory_CardLevel_P",
  CARDLEVEL_MOBILE = "/Game/UI/WBP/Armory/Mobile/WBP_Armory_CardLevel_M.WBP_Armory_CardLevel_M",
  BATTLEMENUWEAPONCONFIG = "/Game/UI/WBP/Armory/Widget/BattleMenu/WBP_Armory_BattleMenu_Config.WBP_Armory_BattleMenu_Config",
  CHARPIECTURE = "/Game/UI/WBP/Archive/Widget/WBP_Archive_CharPicture.WBP_Archive_CharPicture",
  UPGRADEPROMPT = "/Game/UI/WBP/Common/Dialog/WBP_Com_Dialog_Upgrade_Prompt.WBP_Com_Dialog_Upgrade_Prompt_C",
  SKILLLEVELUP = "/Game/UI/WBP/Armory/Widget/CharSkill/WBP_Armory_CharSkillLevelUp.WBP_Armory_CharSkillLevelUp",
  BAGSTUFFSALESELECTPC = "/Game/UI/WBP/Bag/PC/WBP_Bag_Sell_P.WBP_Bag_Sell_P_C",
  BAGSTUFFSALESELECTMOBILE = "/Game/UI/WBP/Bag/Mobile/WBP_Bag_Sell_M.WBP_Bag_Sell_M_C",
  WALNUTBAGSALESELECT = "/Game/UI/WBP/Walnut/PC/WBP_Walnut_Bag_Sell_P.WBP_Walnut_Bag_Sell_P",
  BAGITEMDETAILS = "/Game/UI/WBP/Bag/Widget/WBP_Bag_Detail.WBP_Bag_Detail",
  FORGEMAIN = "/Game/UI/UI_PC/Forging/Page/Forging_Main_Page_PC.Forging_Main_Page_PC",
  FORGESHOWNAME = "/Game/UI/UI_PC/Forging/Widget/Forging_ShowName_Widget_PC.Forging_ShowName_Widget_PC_C",
  FORGE_CONFIRM_WINDOW = "/Game/UI/UI_PC/Forging/Dialog/Forging_Confirm_Dialog_PC.Forging_Confirm_Dialog_PC",
  FORGING_TEST = "/Game/UI/UI_PC/Forging/Dialog/Forging_Test.Forging_Test",
  NPCSWITCHMAIN = "/Game/UI/UI_PC/Npc_Switch/Page/Npc_Switch_Page_PC.Npc_Switch_Page_PC_C",
  LOGINPATCHPAGE = "/Game/UI/UI_PC/Login/Login_Patch_PC.Login_Patch_PC_C",
  GACHAMAIN = "/Game/UI/UI_PC/Gacha/Gacha_PC.Gacha_PC_C",
  SHOPMAIN = "/Game/UI/UI_PC/Shop/Shop_Main_PC.Shop_Main_PC_C",
  SHOPITEMSINGLE = "/Game/UI/UI_PC/Shop/Shop_Purchase_Single_PC.Shop_Purchase_Single_PC_C",
  SHOPITEMPACKAGE = "/Game/UI/UI_PC/Shop/Shop_Purchase_Package_PC.Shop_Purchase_Package_PC_C",
  ACHIEVEMENTSYSTEM = "/Game/UI/UI_PC/Achievement/Achievement_SystemDetail_PC.Achievement_SystemDetail_PC_C",
  MAILMAIN = "/Game/UI/UI_PC/Mail/Mail_Main_PC.Mail_Main_PC_C",
  PROLOGUEENDLOGO = "/Game/UI/WBP/ChapterStart/Widget/WBP_Chapter_Transition01.WBP_Chapter_Transition01_C",
  TASKPANEL = "/Game/UI/UI_PC/Task/Task_Main_PC.Task_Main_PC",
  PORTRAIT = "/Game/UI/UI_PC/Menu/Widget/Menu_Portrait_List.Menu_Portrait_List_C",
  ScreenshotWidget = "/Game/UI/WBP/Camera/Widget/WBP_Camera_Screenshot.WBP_Camera_Screenshot_C",
  DUNGEONTRAININGFLOAT = "/Game/UI/UI_PC/Training_Ground/Training_Ground_KillNum_PC.Training_Ground_KillNum_PC_C",
  DUNGEONCHARACTERINTRO = "/Game/UI/UI_PC/Training_Ground/Training_Ground_PC.Training_Ground_PC",
  DUNGEONCOMRIGHTKEYTEXTDESCDATA = "/Game/UI/WBP/Common/Key/Com_RightKeyTextDesc_Data_PC.Com_RightKeyTextDesc_Data_PC_C",
  DUNGEONTRAININGMONSTERITEMDATA = "/Game/UI/WBP/Battle/Widget/Trainning/WBP_Battle_Training_Item_Data.WBP_Battle_Training_Item_Data_C",
  DUNGEONTOASTFLOAT = "/Game/UI/UI_PC/Battle/Defense/Battle_Defense_Toast_PC.Battle_Defense_Toast_PC_C",
  DUNGEONTASKPANEL = "/Game/UI/UI_PC/MainInterfaceUI/WorldTaskEntryItem.WorldTaskEntryItem_C",
  DUNGEONSABOTAGEFLOAT = "/Game/UI/UI_PC/Battle/Destroy/Battle_TaskDestroy_Page_PC.Battle_TaskDestroy_Page_PC_C",
  DUNGEONSABOTAGECHALLENGE = "/Game/UI/WBP/Dungeon/Sabotage/WBP_Dungeon_DestroyTaskBar.WBP_Dungeon_DestroyTaskBar_C",
  DUNGEONSETTLEMENTDEFEATREMINDER = "/Game/UI/UI_PC/Settlement/WBP_DungeonSettlement_DefeatReminder_PC.WBP_DungeonSettlement_DefeatReminder_PC_C",
  DUNGEONSETTLEMENTVICTORYREMINDER = "/Game/UI/UI_PC/Settlement/WBP_DungeonSettlement_VictoryReminder_PC.WBP_DungeonSettlement_VictoryReminder_PC_C",
  DUNGEONSETTLEMENT = "/Game/UI/UI_PC/Settlement/WBP_DungeonSettlement_PC.WBP_DungeonSettlement_PC_C",
  DUNGEONHIJACKFLOAT = "/Game/UI/UI_PC/Battle/Hijack/Hijack_Task_Page_PC.Hijack_Task_Page_PC_C",
  DUNGEONHIJACKFLOATPANEL = "/Game/UI/UI_PC/Battle/Hijack/Hijack_Main_Page_PC.Hijack_Main_Page_PC_C",
  DUNGEONBLACKSCREEN = "/Game/UI/UI_PC/Settlement/Settlement_BlackScreen_PC.Settlement_BlackScreen_PC_C",
  SETTLEMENTFAILURETIPS = "/Game/UI/WBP/Settlement/Widget/Settlement_FailTips_Content.Settlement_FailTips_Content_C",
  DUNGEONSURVIVALFLOAT = "/Game/UI/UI_PC/Battle/Survival/Battle_Survival_PC.Battle_Survival_PC_C",
  DUNGEONSURVIVALPROFLOAT = "/Game/UI/UI_PC/Battle/Survival/Battle_Survival_PC.Battle_Survival_PC_C",
  DUNGEONDEFENCEPROFLOAT = "/Game/UI/UI_PC/Battle/Defense/Battle_Defense02_PC.Battle_Defense02_PC_C",
  DUNGEONDEFENCEFLOAT = "/Game/UI/UI_PC/Battle/Defense/Battle_Defense_PC.Battle_Defense_PC_C",
  DUNGEONERETREAT = "/Game/UI/UI_PC/Battle/Defense/Battle_Defense_Settlement_PC.Battle_Defense_Settlement_PC",
  DUNGEONEXCAVATION = "/Game/UI/UI_PC/Battle/Digging/Battle_Digging_List_PC.Battle_Digging_List_PC_C",
  DUNGEONEXCAVATIONENERGYBARDATA = "/Game/UI/Blueprint/BP_Digging_EnergyBar_Data.BP_Digging_EnergyBar_Data_C",
  DUNGEONEXCAVATIONENERGYBARUI = "/Game/UI/UI_PC/Battle/Digging/Battle_Digging_Energybar_PC_New.Battle_Digging_Energybar_PC_New_C",
  DUNGEONCAPTUREFLOAT = "/Game/UI/UI_PC/Battle/Capture/Battle_Capture_Time.Battle_Capture_Time_C",
  DUNGEONMATCHFLOAT = "/Game/UI/UI_Phone/Prologue_Map/Prologue_Info.Prologue_Info_C",
  DUNGEONMATCHINGFLOAT = "/Game/UI/UI_Phone/Team/Team_Countdown.Team_Countdown_C",
  DUNGEONTOASTPANEL = "/Game/UI/UI_PC/Guide/Guide_TextFloat03_PC.Guide_TextFloat03_PC_C",
  EXCAVATIONDUNGEONTEXTFLOAT = "/Game/UI/WBP/Dungeon/Excavation/WBP_Dungeon_ExcavationToast_New.WBP_Dungeon_ExcavationToast_New",
  DUNGEONEXTERMINATEFLOAT = "/Game/UI/WBP/Battle/Widget/Annihilate/WBP_Battle_Annihilate.WBP_Battle_Annihilate_C",
  DungeonFirstGuide = "/Game/UI/UI_PC/Battle/Battle_ImageGuide_PC.Battle_ImageGuide_PC_C",
  COMMONCHANGESCENE = "/Game/UI/WBP/Common/Loading/Widget/WBP_Com_ChangeScene.WBP_Com_ChangeScene_C",
  GMCOMMANDPANEL = "/Game/UI/UI_PC/GM/GM_PC.GM_PC_C",
  GMTIPSHOTKEY = "/Game/UI/UI_PC/GM/GM_Tips_Hotkey_PC.GM_Tips_Hotkey_PC_C",
  GMTIPSMONSTER = "/Game/UI/UI_PC/GM/GM_Tips_Monster_PC.GM_Tips_Monster_PC_C",
  GMBATTLEHISTORY = "/Game/UI/UI_PC/GM/WBP_GM_BattleHistory.WBP_GM_BattleHistory_C",
  MONSTERINFOPANEL = "/Game/BluePrints/UI/Debug/WBP_MonsterInfo.WBP_MonsterInfo_C",
  CAMERAKEEPSIGHTUI = "/Game/UI/WBP/Common/Class/WPB_CameraKeepSight.WPB_CameraKeepSight_C",
  BUFFDEBUGPANEL = "/Game/BluePrints/UI/Debug/WBP_BuffDebugPanel.WBP_BuffDebugPanel_C",
  ATTRDEBUGPANEL = "/Game/BluePrints/UI/Debug/WBP_AttrDebugPanel.WBP_AttrDebugPanel_C",
  ComSortFullScreen = "/Game/UI/WBP/Common/FilterSort/WBP_Com_Sort_FullScreen.WBP_Com_Sort_FullScreen_C",
  UnknownRewardTipsUI = "/Game/UI/UI_UnknownReward/UnlnownRewardTips.UnlnownRewardTips_C",
  UnknownRewardManagerTipsUI = "/Game/UI/UI_UnknownReward/WBP_UnknownPickupUIState.WBP_UnknownPickupUIState_C",
  ExitTimeDown = "/Game/UI/ExitTimeDownUI/WBP_ExitTimeDown.WBP_ExitTimeDown_C",
  MINIGAMELINE = "/Game/UI/UI_PC/MiniGame/MiGong/MiniGame_MiGong_PC.MiniGame_MiGong_PC_C",
  ZHUANQUANQUAN = "/Game/UI/UI_PC/MiniGame/MiniGame_ZhuanQuanQuan_PC.MiniGame_ZhuanQuanQuan_PC_C",
  BUBBLETALK2DEMPTY = "/Game/UI/UI_PC/Dialog/BP_Empty.BP_Empty_C",
  STORYWEAPONSELECT = "/Game/UI/WBP/Story/Widget/BP_Story_WeaponSelect.BP_Story_WeaponSelect_C",
  FaceItemTips = "/Game/UI/WBP/Chat/Widget/Face/WBP_Chat_FaceItemTips.WBP_Chat_FaceItemTips",
  NPCHeadWidget = "/Game/UI/UI_PC/NPC/NPC_UniformHeadWidget.NPC_UniformHeadWidget_C",
  DEFEATEDINTERACT = "/Game/UI/WBP/Battle/PC/WBP_Battle_Execute_P.WBP_Battle_Execute_P_C",
  DEFEATEDINTERACTHGUIDE = "/Game/UI/WBP/Battle/PC/WBP_Battle_ExecuteOutWindowArrow_PC.WBP_Battle_ExecuteOutWindowArrow_PC_C",
  ROUGELIKEENTERTOAST = "/Game/UI/WBP/RougeLike/Widget/WBP_Rouge_EnterToast.WBP_Rouge_EnterToast_C",
  ROUGELIKESUCESSTOAST = "/Game/UI/WBP/Common/Toast/WBP_Com_ToastSuccess.WBP_Com_ToastSuccess_C",
  SEVENDAYSIGNPOPUPUI = "/Game/UI/WBP/Activity/Widget/SevenDay/WBP_Activity_SevenDayPopUp.WBP_Activity_SevenDayPopUp_C",
  PianoMusicScoreData = "/Game/UI/WBP/Piano/Widget/Piano_MusicScore_Data.Piano_MusicScore_Data_C",
  PianoMusicItemData = "/Game/UI/WBP/Piano/Widget/Piano_MusicItem_Data.Piano_MusicItem_Data_C",
  TEXTMEMORYINFOFLOAT = "/Game/BluePrints/UI/Rank/WBP_TestInfoFloat.WBP_TestInfoFloat_C",
  DUNGEONINDICATOR = {
    Hostage = "/Game/UI/WBP/GuidePoint/WBP_GuidePoint_Hostage.WBP_GuidePoint_Hostage",
    Annihilate_S = "/Game/UI/WBP/GuidePoint/WBP_GuidePoint_Annihilate.WBP_GuidePoint_Annihilate",
    Excavation = "/Game/UI/WBP/GuidePoint/WBP_GuidePoint_Level3.WBP_GuidePoint_Level3",
    Explore = "/Game/UI/UI_PC/World/ExploreToast/Explore_GuidePoint_PC.Explore_GuidePoint_PC",
    Phantom = "/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom",
    GuidePointLevel1 = "/Game/UI/WBP/GuidePoint/WBP_GuidePoint_Level1.WBP_GuidePoint_Level1",
    GuidePointLevel2 = "/Game/UI/WBP/GuidePoint/WBP_GuidePoint_Level2.WBP_GuidePoint_Level2",
    GuidePointMechLevel1 = "/Game/UI/WBP/GuidePoint/WBP_GuidePoint_Mech_Level1.WBP_GuidePoint_Mech_Level1",
    GuidePointMechLevel2 = "/Game/UI/WBP/GuidePoint/WBP_GuidePoint_Mech_Level2.WBP_GuidePoint_Mech_Level2",
  },
  DUNGEONINDICATORIMG = {
    Guide_Chest = "/Game/UI/UI_PNG/Guide/GuidePoint/Guide_Chest.Guide_Chest",
    Guide_Transportation = "/Game/UI/UI_PNG/Guide/GuidePoint/Guide_Transportation.Guide_Transportation",
    Guide_SurvivalPro_Attack = "/Game/UI/UI_PNG/Guide/GuidePoint/Guide_SurvivalPro_Attack.Guide_SurvivalPro_Attack",
    Guide_SurvivalPro_Heal = "/Game/UI/UI_PNG/Guide/GuidePoint/Guide_SurvivalPro_Heal.Guide_SurvivalPro_Heal",
    Guide_SurvivalPro_Resource = "/Game/UI/UI_PNG/Guide/GuidePoint/Guide_SurvivalPro_Resource.Guide_SurvivalPro_Resource",
    Guide_KillMonsterNode = "/Game/UI/UI_PNG/Guide/GuidePoint/Guide_Enemy.Guide_Enemy",
    Guide_LifeSupport = "/Game/UI/UI_PNG/Guide/GuidePoint/Guide_LifeSupport.Guide_LifeSupport",
  },
  BloodBarPath = "BattleMain.PlayerBloodBar",
  EnergySkillPath = "BattleMain.Char_Skill.Energy_Skill",
  MapPath = "BattleMain.Battle_Map",
  TaskPath = "TaskBar",
  EntrancePath = "BattleMain.ListView",
  SkillPhonePath = "BattleMain.Char_Skill.Skill",
  EscPath = "BattleMain.Btn_Esc",
  BattleWheelPath = "BattleMain.Char_Skill.Battle_Menu",
  LoadInConfig = "LoadInConfig",
  FromUI = "FromUI",
  GuideTextFloat = "/Game/UI/UI_PC/Guide/Guide_TextFloat_PC",
}
local r1_0 = "AllUIConfig"
local r2_0 = {
  PickUpInfoTips = {
    popup = false,
    addtostack = false,
    allowmulti = false,
    resource = r0_0.PICKUPITEMTIPS,
  },
  PickUpInfoTipsFullOff = {
    popup = false,
    addtostack = false,
    resource = r0_0.PICKUPITEMTIPS,
  },
  PickUpChooseItemInfo = {
    popup = false,
    addtostack = false,
    resource = r0_0.PICKUPITEMPANEL,
  },
  CommonChangeScene = {
    popup = false,
    addtostack = false,
    resource = r0_0.COMMONCHANGESCENE,
    needuimode = true,
  },
  WorldTaskPanel = {
    popup = false,
    addtostack = false,
    resource = r0_0.WORLDTASKMAIN,
  },
}
r2_0.AchievementPanel = {
  eventlist = {
    "StartTalk",
    "EndTalk"
  },
}
r2_0.BattleWeaponHint = {
  popup = false,
  addtostack = false,
  resource = r0_0.BATTLEWEAPONHINT,
}
r2_0.BagStuffSelectToList = {
  popup = false,
  addtostack = false,
}
r2_0.TaskPanel = {
  popup = true,
  addtostack = false,
  resource = r0_0.TASKPANEL,
}
r2_0.NpcSwitchMain = {
  popup = true,
  addtostack = false,
  resource = r0_0.NPCSWITCHMAIN,
}
r2_0.TaskIndicator = {
  popup = false,
  addtostack = false,
  resource = r0_0.TASKINDICATORUI,
  haschildBP = true,
}
r2_0.GuideTextFloat = {
  popup = false,
  addtostack = false,
  resource = r0_0.GUIDETEXTFLOAT,
}
r2_0.PreLoginCgAnim = {
  popup = false,
  addtostack = false,
  resource = r0_0.PRELOGINCGANIM,
}
r2_0.ServerSelect = {
  popup = false,
  swallow = true,
  addtostack = true,
  resource = r0_0.SERVERSELEC,
}
r2_0.LoginPatchPage = {
  popup = false,
  addtostack = false,
  resource = r0_0.LOGINPATCHPAGE,
}
r2_0.DungenonSettlement = {
  popup = false,
  addtostack = false,
  resource = r0_0.DUNGEONSETTLEMENT,
  needuimode = true,
}
r2_0.DungenonIndicator = {
  popup = false,
  addtostack = false,
  resource = r0_0.DUNGEONINDICATOR,
  haschildBP = true,
}
r2_0.DungenonSurviveFloat = {
  popup = false,
  addtostack = false,
  resource = r0_0.DUNGEONSURVIVALFLOAT,
}
r2_0.DungenonDefenseFloat = {
  popup = false,
  addtostack = false,
  resource = r0_0.DUNGEONDEFENCEFLOAT,
}
r2_0.DungenonRetreat = {
  popup = false,
  addtostack = false,
  resource = r0_0.DUNGEONERETREAT,
}
r2_0.Vote = {
  popup = false,
  addtostack = false,
  needuimode = true,
  resource = r0_0.DUNGEONERETREAT,
}
r2_0.BranchTaskReceiveTips = {
  popup = true,
  addtostack = true,
  resource = r0_0.LoadInConfig,
  needuimode = true,
}
r2_0.ArmoryMain = {
  popup = true,
  addtostack = true,
  resource = r0_0.LoadInConfig,
  needuimode = true,
}
r2_0.CharRecord = {
  popup = true,
  addtostack = true,
  needuimode = true,
  IsStopGame = true,
}
r2_0.DyeMain = {
  popup = true,
  addtostack = true,
  needuimode = true,
  IsStopGame = true,
}
r2_0.ArmoryBattleMenuWeaponConfig = {
  popup = true,
  addtostack = false,
  resource = r0_0.BATTLEMENUWEAPONCONFIG,
  needuimode = true,
  IsStopGame = true,
}
r2_0.UpgradePrompt = {
  popup = true,
  addtostack = false,
  resource = r0_0.UPGRADEPROMPT,
  needuimode = true,
}
r2_0.SkillLevelUp = {
  popup = true,
  addtostack = false,
  resource = r0_0.SKILLLEVELUP,
  needuimode = true,
}
r2_0.ForgeMain = {
  popup = true,
  addtostack = false,
  resource = r0_0.FORGEMAIN,
  needuimode = true,
}
r2_0.ForgeShowName = {
  popup = false,
  addtostack = false,
  resource = r0_0.FORGESHOWNAME,
}
r2_0.MonsterExpWord = {
  popup = false,
  addtostack = false,
  allowmulti = true,
  resource = r0_0.MONSTEREXPTIPS,
}
r2_0.BossBlood = {
  popup = false,
  addtostack = false,
  allowmulti = false,
  resource = r0_0.BOSSBLOOD,
}
r2_0.DungenonExcavation = {
  popup = false,
  addtostack = true,
  resource = r0_0.DUNGEONEXCAVATION,
}
r2_0.GachaMain = {
  popup = true,
  addtostack = false,
  resource = r0_0.GACHAMAIN,
  needuimode = true,
}
r2_0.MailMain = {
  popup = true,
  addtostack = false,
  resource = r0_0.GACHAMAIN,
  needuimode = true,
}
r2_0.MainMain = {
  popup = true,
  addtostack = false,
  resource = r0_0.GACHAMAIN,
  needuimode = true,
}
r2_0.GMCommandPanel = {
  swallow = true,
  specialvisiblemode = "forceshow",
  addtostack = true,
  resource = r0_0.GMCOMMANDPANEL,
  needuimode = true,
  IsStopGame = true,
}
r2_0.GMTipsHotkey = {
  swallow = true,
  specialvisiblemode = "forceshow",
  addtostack = true,
  resource = r0_0.GMTIPSHOTKEY,
  needuimode = true,
  IsStopGame = true,
}
r2_0.GMTipsMonster = {
  swallow = true,
  specialvisiblemode = "forceshow",
  addtostack = true,
  resource = r0_0.GMTIPSMONSTER,
  needuimode = true,
  IsStopGame = true,
}
r2_0.GMBattleHistory = {
  swallow = true,
  specialvisiblemode = "forceshow",
  addtostack = true,
  resource = r0_0.GMTIPSMONSTER,
  needuimode = true,
  IsStopGame = true,
}
r2_0.UnknownRewardTipsUI = {
  popup = false,
  addtostack = false,
  resource = r0_0.UnknownRewardTipsUI,
}
r2_0.UnknownRewardManagerTipsUI = {
  popup = false,
  addtostack = false,
  resource = r0_0.UnknownRewardManagerTipsUI,
}
r2_0.MonsterInfo = {
  popup = false,
  addtostack = true,
  resource = r0_0.MONSTERINFOPANEL,
}
r2_0.ExitTimeDown = {
  popup = false,
  addtostack = false,
  resource = r0_0.ExitTimeDown,
}
r2_0.DungeonMatchFloat = {
  popup = false,
  addtostack = false,
  resource = r0_0.DUNGEONEMATCHFLOAT,
}
r2_0.DungeonMatchingFloat = {
  popup = false,
  addtostack = false,
  resource = r0_0.DUNGEONEMATCHINGFLOAT,
}
r2_0.DungeonExterminateFloat = {
  popup = false,
  addtostack = false,
  resource = r0_0.DUNGEONEXTERMINATEFLOAT,
}
r2_0.GrenadesTips = {
  popup = false,
  addtostack = false,
  allowmulti = true,
  resource = r0_0.GRENADESTIPS,
}
r2_0.WeaponTips = {
  popup = false,
  addtostack = false,
  needuimode = true,
  resource = r0_0.WEAPONTIPS,
}
r2_0.SevenDaySignPopUp = {
  popup = true,
  addtostack = false,
  resource = r0_0.SEVENDAYSIGNPOPUPUI,
  needuimode = true,
  zorder = 47,
}
r2_0.ShopMain = {
  popup = true,
  addtostack = false,
  needuimode = true,
  resource = r0_0.SHOPMAIN,
}
r2_0.ShopItemSingle = {
  popup = false,
  addtostack = false,
  needuimode = false,
  resource = r0_0.SHOPITEMSINGLE,
}
r2_0.ShopItemPackage = {
  popup = false,
  addtostack = false,
  needuimode = false,
  resource = r0_0.SHOPITEMPACKAGE,
}
r2_0.DefeatedInteract = {
  popup = false,
  addtostack = false,
  resource = r0_0.DEFEATEDINTERACT,
}
r2_0.StoryWeaponSelect = {
  popup = true,
  addtostack = true,
  resource = r0_0.STORYWEAPONSELECT,
  needuimode = true,
}
r2_0.DungeonFirstGuide = {
  needuimode = true,
}
r2_0.AchievementSystem = {
  popup = true,
  addtostack = false,
  resource = r0_0.ACHIEVEMENTSYSTEM,
  needuimode = true,
}
r2_0.LevelMapMain = {
  popup = true,
  addtostack = true,
  needuimode = true,
}
r2_0.GuideMain = {
  popup = true,
  addtostack = false,
  resource = r0_0.GUIDEMAIN,
  needuimode = true,
}
r2_0.ZhuanQuanQuan = {
  popup = true,
  addtostack = true,
  resource = r0_0.ZHUANQUANQUAN,
  needuimode = true,
}
r2_0.ConnectLine = {
  popup = true,
  addtostack = true,
  resource = r0_0.MINIGAMELINE,
  needuimode = true,
}
r2_0.ChangePortrain = {
  popup = false,
  addtostack = true,
  resource = r0_0.PORTRAIT,
  needuimode = true,
}
r2_0.CameraKeepSightUI = {
  popup = false,
  addtostack = false,
  specialvisiblemode = "forceshow",
  resource = r0_0.CAMERAKEEPSIGHTUI,
  needuimode = true,
}
r2_0.ComSortFullScreen = {
  popup = false,
  addtostack = false,
  resource = r0_0.ComSortFullScreen,
  needuimode = true,
}
r2_0.EXPLORETOASTTIPS = {
  specialvisiblemode = "forceshow",
}
r2_0.EXPLORETOASTFAIL = {
  specialvisiblemode = "forceshow",
}
r2_0.EXPLORETOASTSUCCESS = {
  specialvisiblemode = "forceshow",
}
r2_0.GetItemTip = {
  popup = false,
  resource = r0_0.GetItemsTip,
  needuimode = true,
}
r2_0.UpgradeTip = {
  popup = false,
  resource = r0_0.UpgradeTip,
  needuimode = true,
}
r2_0.CharPicture = {
  popup = true,
  addtostack = false,
  resource = r0_0.CHARPIECTURE,
  needuimode = true,
  IsStopGame = true,
}
r0_0[r1_0] = r2_0
r0_0.VisibilityOp = {
  Visible = 0,
  Collapsed = 1,
  Hidden = 2,
  HitTestInvisible = 3,
  SelfHitTestInvisible = 4,
}
r0_0.GamePadKey = {
  LeftAnalogX = "Gamepad_LeftX",
  LeftAnalogY = "Gamepad_LeftY",
  RightAnalogX = "Gamepad_RightX",
  RightAnalogY = "Gamepad_RightY",
  LeftTriggerAnalog = "Gamepad_LeftTriggerAxis",
  RightTriggerAnalog = "Gamepad_RightTriggerAxis",
  LeftThumb = "Gamepad_LeftThumbstick",
  RightThumb = "Gamepad_RightThumbstick",
  SpecialLeft = "Gamepad_Special_Left",
  SpecialRight = "Gamepad_Special_Right",
  SpecialLeft_X = "Gamepad_Special_Left_X",
  SpecialRight_X = "Gamepad_Special_Right_X",
  SpecialLeft_Y = "Gamepad_Special_Left_Y",
  SpecialRight_Y = "Gamepad_Special_Right_Y",
  FaceButtonBottom = "Gamepad_FaceButton_Bottom",
  FaceButtonRight = "Gamepad_FaceButton_Right",
  FaceButtonLeft = "Gamepad_FaceButton_Left",
  FaceButtonTop = "Gamepad_FaceButton_Top",
  LeftShoulder = "Gamepad_LeftShoulder",
  RightShoulder = "Gamepad_RightShoulder",
  LeftTriggerThreshold = "Gamepad_LeftTrigger",
  RightTriggerThreshold = "Gamepad_RightTrigger",
  DPadUp = "Gamepad_DPad_Up",
  DPadDown = "Gamepad_DPad_Down",
  DPadRight = "Gamepad_DPad_Right",
  DPadLeft = "Gamepad_DPad_Left",
  LeftStickUp = "Gamepad_LeftStick_Up",
  LeftStickDown = "Gamepad_LeftStick_Down",
  LeftStickRight = "Gamepad_LeftStick_Right",
  LeftStickLeft = "Gamepad_LeftStick_Left",
  RightStickUp = "Gamepad_RightStick_Up",
  RightStickDown = "Gamepad_RightStick_Down",
  RightStickRight = "Gamepad_RightStick_Right",
  RightStickLeft = "Gamepad_RightStick_Left",
}
r0_0.GamePadImgKey = {
  FaceButtonBottom = "A",
  FaceButtonRight = "B",
  FaceButtonLeft = "X",
  FaceButtonTop = "Y",
  LeftShoulder = "LB",
  RightShoulder = "RB",
  LeftTriggerThreshold = "LT",
  RightTriggerThreshold = "RT",
  LeftThumb = "LS",
  RightThumb = "RS",
  DPadUp = "Up",
  DPadDown = "Down",
  DPadLeft = "Left",
  DPadRight = "Right",
  SpecialLeft = "View",
  SpecialRight = "Menu",
  RightTriggerAnalog = "RV",
  LeftTriggerAnalog = "LV",
}
r0_0.MAXEXISTNUM = 1000
r0_0.InteractiveUIName = "InteractiveUI"
r0_0.BattleHitShieldPCName = "HitShieldEffect"
r0_0.BattleBrokenShieldPCName = "BrokenShieldEffect"
r0_0.BattleNearDeathPCName = "NearDeathBlood"
r0_0.WarningHintName = "WarningHintName"
r0_0.DestroyAlarmName = "DestroyAlarm"
r0_0.CommonSetUP = "CommonSetUp"
r0_0.MenuLevel = "MenuLevel"
r0_0.MenuWorld = "MenuWorld"
r0_0.CommonDialogTip = "CommonDialogTip"
r0_0.SkillDetails = "SkillDetails"
r0_0.RecoverUI = "RecoverUI"
r0_0.GetItemsTip = "RougeGetItemsTip"
r0_0.UpgradeTip = "RougeUpgradeTip"
r0_0.Tip_Quest = "QuestTips"
r0_0.Tip_CommonTop = "CommonTopTips"
r0_0.Tip_CommonWarning = "CommonWarningTips"
r0_0.Tip_CommonToast = "CommonToastMain"
r0_0.Tip_ExcavationToast = "ExcavationToast"
r0_0.Tip_CommonDialogTip = "CommonDialogTip"
r0_0.Tip_StoryToast = "CommonStoryToast"
r0_0.RarityColor = {
  [1] = "d1d1d1ff",
  [2] = "4cb587ff",
  [3] = "708fffff",
  [4] = "b77cffff",
  [5] = "de9f49ff",
}
r0_0.RarityColorName = {
  "Grey",
  "Green",
  "Blue",
  "Purple",
  "Yellow",
  "Black"
}
r0_0.PopUpUIName = {
  SpecificSystemList = {
    "Battle",
    "Common",
    "Guide"
  },
  SpecificUIList = {
    "SceneStartUI",
    "MenuLevel",
    "MenuWorld"
  },
}
r0_0.BATTLE_MENU_BEHAVIOUR_TYPE = {
  IN_BATTLE_MENU = 1,
  ARMOURY_BATTLE_MENU = 2,
}
r0_0.DPIBaseOnSize = {
  PC = {
    X = 1920,
    Y = 1080,
  },
  Mobile = {
    X = 1600,
    Y = 900,
  },
}
r0_0.EnumTimeStyleType = {
  YMDAndHMS = 1,
  YMD = 2,
  HMS = 3,
}
r0_0.WidgetAllStateTag = {
  Precedence = 1,
  Mutual = 2,
  Queue = 3,
  Group = 4,
  Exclusive = 9,
  Blocked = 10,
}
r0_0.CommonHideTagName = {
  UIPopUp = "UIPopUp",
  SystemOpen = "SystemOpen",
  UIStackChange = "UIStackChange",
  DefaultTag = "DefaultTag",
  GMShowUIOnly = "GMShowUIOnly",
}
r0_0.GameUIShowState = {
  HUD = 1,
  System = 2,
}
r0_0.AnimOutSpeedWithPageJump = {
  LittleFastSpeed = 3,
  NormalFastSpeed = 5,
  MoreFastSpeed = 10,
}
r0_0.DungeonIndicatorShowWidgets = {
  "BattleFort"
}
r0_0.RedDotType = {
  CommonRedDot = EReddotType.Normal,
  NewRedDot = EReddotType.New,
  GreyRedDot = EReddotType.Gray,
}
r0_0.OptimizeSwitch = {
  PC = {
    UI_WRAPPING_WITH_INVALIDBOX = false,
    UI_WRAPPING_WITH_RETAINERBOX = false,
    UI_ADD_IN_CACHE = false,
  },
  Mobile = {
    UI_WRAPPING_WITH_INVALIDBOX = false,
    UI_WRAPPING_WITH_RETAINERBOX = true,
    UI_ADD_IN_CACHE = false,
  },
}
r0_0.PhotoCameraHiddenButton = {
  Role = "Hide_Role",
  Player = "Hide_Player",
  NPC = "Hide_NPC",
  Monster = "Hide_Monster",
  Pet = "Hide_Pet",
}
r0_0.EnumHideBattleUnitStyle = {
  NormalShowAndHideAll = 1,
  NormalShowAndHideAllExceptSelf = 2,
  InstantShowAll = 11,
  InstantShowAllExceptSelf = 12,
  DelayHideAll = 13,
  DelayHideAllExceptSelf = 14,
}
r0_0.IndicatorCategoryTable = {
  ["/Game/UI/WBP/GuidePoint/WBP_GuidePoint_BlastRobot.WBP_GuidePoint_BlastRobot"] = "Monster",
  ["/Game/UI/WBP/GuidePoint/WBP_GuidePoint_Hostage.WBP_GuidePoint_Hostage"] = "Hostage",
  ["/Game/UI/UI_PC/World/ExploreToast/Explore_GuidePoint_PC.Explore_GuidePoint_PC"] = "Mechanism",
  ["/Game/UI/WBP/GuidePoint/WBP_GuidePoint_Annihilate.WBP_GuidePoint_Annihilate"] = "Monster",
  ["/Game/UI/WBP/GuidePoint/WBP_GuidePoint_Level3.WBP_GuidePoint_Level3"] = "Mechanism",
  ["/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom"] = "Phantom",
  ["/Game/UI/WBP/GuidePoint/WBP_GuidePoint_Entrance.WBP_GuidePoint_Entrance"] = "Mechanism",
  ["/Game/UI/WBP/GuidePoint/WBP_GuidePoint_Alert.WBP_GuidePoint_Alert"] = "AlertActor",
  ["/Game/UI/WBP/GuidePoint/WBP_GuidePoint_Pet.WBP_GuidePoint_Pet"] = "Pet",
}
r0_0.IndicatorCategoryIconTable = {
  ["/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_DestroyTarget_A.T_Gp_DestroyTarget_A"] = "Monster",
  ["/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_DestroyTarget_B.T_Gp_DestroyTarget_B"] = "Monster",
  ["/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_DestroyTarget_C.T_Gp_DestroyTarget_C"] = "Monster",
  ["/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Evacuation.T_Gp_Evacuation"] = "Mechanism",
  ["/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_LifeSupport.T_Gp_LifeSupport"] = "Mechanism",
  ["/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_MainMission.T_Gp_MainMission"] = "Mechanism",
  ["/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_DefeatMission.T_Gp_DefeatMission"] = "Mechanism",
  ["/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Rou_Battle01.T_Gp_Rou_Battle01"] = "Mechanism",
  ["/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Rou_Battle02.T_Gp_Rou_Battle02"] = "Mechanism",
  ["/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Rou_Battle03.T_Gp_Rou_Battle03"] = "Mechanism",
  ["/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Rou_Battle04.T_Gp_Rou_Battle04"] = "Mechanism",
  ["/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Rou_Event01.T_Gp_Rou_Event01"] = "Mechanism",
  ["/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Rou_Shop01.T_Gp_Rou_Shop01"] = "Mechanism",
  ["/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_SurvivalPro_Attack.T_Gp_SurvivalPro_Attack"] = "Mechanism",
  ["/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_SurvivalPro_Heal.T_Gp_SurvivalPro_Heal"] = "Mechanism",
  ["/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_SurvivalPro_Resource.T_Gp_SurvivalPro_Resource"] = "Mechanism",
  ["/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Chest.T_Gp_Chest"] = "Mechanism",
}
r0_0.IndicatorAnimTable = {
  ["/Game/UI/WBP/GuidePoint/WBP_GuidePoint_BlastRobot.WBP_GuidePoint_BlastRobot"] = "Blast",
  ["/Game/UI/WBP/GuidePoint/WBP_GuidePoint_Hostage.WBP_GuidePoint_Hostage"] = "Hostage",
  ["/Game/UI/UI_PC/World/ExploreToast/Explore_GuidePoint_PC.Explore_GuidePoint_PC"] = "Guide_Point",
  ["/Game/UI/WBP/GuidePoint/WBP_GuidePoint_Annihilate.WBP_GuidePoint_Annihilate"] = "Annihilate_S",
  ["/Game/UI/WBP/GuidePoint/WBP_GuidePoint_Level3.WBP_GuidePoint_Level3"] = "Excavation",
  ["/Game/UI/UI_PC/Guide/Guide_Point/Guide_Icon_Phantom.Guide_Icon_Phantom"] = "Phantom",
  ["/Game/UI/WBP/GuidePoint/WBP_GuidePoint_Entrance.WBP_GuidePoint_Entrance"] = "Entrance",
  ["/Game/UI/WBP/GuidePoint/WBP_GuidePoint_Alert.WBP_GuidePoint_Alert"] = "Alert",
  ["/Game/UI/WBP/GuidePoint/WBP_GuidePoint_Pet.WBP_GuidePoint_Pet"] = "Pet",
}
r0_0.IndicatorAnimIconTable = {
  ["/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_DestroyTarget_A.T_Gp_DestroyTarget_A"] = "Destroy",
  ["/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_DestroyTarget_B.T_Gp_DestroyTarget_B"] = "Destroy",
  ["/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_DestroyTarget_C.T_Gp_DestroyTarget_C"] = "Destroy",
  ["/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Evacuation.T_Gp_Evacuation"] = "Evacuation",
  ["/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_LifeSupport.T_Gp_LifeSupport"] = "Mechanism",
  ["/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_MainMission.T_Gp_MainMission"] = "Mechanism",
  ["/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_DefeatMission.T_Gp_DefeatMission"] = "Mechanism",
  ["/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Rou_Battle01.T_Gp_Rou_Battle01"] = "Mechanism",
  ["/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Rou_Battle02.T_Gp_Rou_Battle02"] = "Mechanism",
  ["/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Rou_Battle03.T_Gp_Rou_Battle03"] = "Mechanism",
  ["/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Rou_Battle04.T_Gp_Rou_Battle04"] = "Mechanism",
  ["/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Rou_Event01.T_Gp_Rou_Event01"] = "Mechanism",
  ["/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Rou_Shop01.T_Gp_Rou_Shop01"] = "Mechanism",
  ["/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_SurvivalPro_Attack.T_Gp_SurvivalPro_Attack"] = "Guide_Icon_Survival",
  ["/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_SurvivalPro_Heal.T_Gp_SurvivalPro_Heal"] = "Guide_Icon_Survival",
  ["/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_SurvivalPro_Resource.T_Gp_SurvivalPro_Resource"] = "Guide_Icon_Survival",
  ["/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Chest.T_Gp_Chest"] = "WorldExploration",
  ["/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Trans01.T_Gp_Trans01"] = "WorldExploration",
}
r0_0.DungeonTaskPath = {
  MainMission = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_MainMission.T_Gp_MainMission",
  DefeatMission = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_DefeatMission.T_Gp_DefeatMission",
  Boss = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Boss.T_Gp_Boss",
  Evacuation = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Evacuation.T_Gp_Evacuation",
  SpecialEnemy = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_SpecialEnemy.T_Gp_SpecialEnemy",
}
r0_0.AccessoryTypeTextMap = {
  Head = "UI_SkinPreview_Accessory_Head",
  Face = "UI_SkinPreview_Accessory_Face",
  Waist = "UI_SkinPreview_Accessory_Waist",
  Back = "UI_SkinPreview_Accessory_Back",
  FX_Dead = "UI_SkinPreview_Accessory_FX_Dead",
  FX_Teleport = "UI_SkinPreview_Accessory_FX_Teleport",
  FX_Footprint = "UI_SkinPreview_Accessory_FX_Footprint",
  FX_Body = "UI_SkinPreview_Accessory_FX_Body",
  WeaponAccessory = "UI_SkinPreview_Accessory_Weapon",
}
r0_0.MouseButton = {
  LeftMouseButton = true,
  RightMouseButton = true,
  MiddleMouseButton = true,
  ThumbMouseButton = true,
  ThumbMouseButton2 = true,
  MouseScrollUp = true,
  MouseScrollDown = true,
  MouseX = true,
  MouseY = true,
  MouseWheelAxis = true,
}
return r0_0
