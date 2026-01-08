-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Client\Entities\Avatar.lua
-- version: lua54
-- line: [0, 0] id: 0
local r2_0 = require("NetworkEngine.Common.Assemble")
local r3_0 = require("Utils.HeroUSDKUtils")
local r4_0 = require("Utils.TimeUtils")
local r5_0 = require("Utils.MiscUtils")
local r6_0 = require("EMCache.EMCache")
local r7_0 = require("pb")
local r8_0 = _G.TypeClass("Avatar", require("BluePrints.Client.Wrapper.Entity").AvatarEntity)
r8_0.__Props__ = "BluePrints.Client.Implements.Avatar"
r8_0.__Component__ = {
  "BluePrints.Client.Entities.Components.EntityBase",
  "BluePrints.Client.Entities.Components.AvatarInfo",
  "BluePrints.Client.Entities.Components.Others",
  "BluePrints.Client.Entities.Components.Login",
  "BluePrints.Client.Entities.Components.AvatarStatus",
  "BluePrints.Client.Entities.Components.BattleCheck",
  "BluePrints.Client.Entities.Components.CharMgr",
  "BluePrints.Client.Entities.Components.WeaponMgr",
  "BluePrints.Client.Entities.Components.ResourceMgr",
  "BluePrints.Client.Entities.Components.ModMgr",
  "BluePrints.Client.Entities.Components.DungeonMgr",
  "BluePrints.Client.Entities.Components.BattleLogic",
  "BluePrints.Client.Entities.Components.BonusMgr",
  "BluePrints.Client.Entities.Components.QuestMgr",
  "BluePrints.Client.Entities.Components.TargetMgr",
  "BluePrints.Client.Entities.Components.PlayerInfoMgr",
  "BluePrints.Client.Entities.Components.AchvMgr",
  "BluePrints.Client.Entities.Components.DSMgr",
  "BluePrints.Client.Entities.Components.BlueMgr",
  "BluePrints.Client.Entities.Components.GachaMgr",
  "BluePrints.Client.Entities.Components.RankCom",
  "BluePrints.Client.Entities.Components.ShopMgr",
  "BluePrints.Client.Entities.Components.LSMgr",
  "BluePrints.Client.Entities.Components.Team",
  "BluePrints.Client.Entities.Components.ExploreMgr",
  "BluePrints.Client.Entities.Components.SuitMgr",
  "BluePrints.Client.Entities.Components.HardBoss",
  "BluePrints.Client.Entities.Components.MSDKUpload",
  "BluePrints.Client.Entities.Components.Mail",
  "BluePrints.Client.Entities.Components.PartyMgr",
  "BluePrints.Client.Entities.Components.SystemGuideMgr",
  "BluePrints.Client.Entities.CommonComponents.ResourceUseComponent",
  "BluePrints.Client.Entities.Components.ConditionMgr",
  "BluePrints.Client.Entities.Components.PayMgr",
  "BluePrints.Client.Entities.Components.GuideBook",
  "BluePrints.Client.Entities.Components.MarkPointMgr",
  "BluePrints.Client.Entities.Components.UIUnlockMgr",
  "BluePrints.Client.Entities.Components.CharAccessoryMgr",
  "BluePrints.Client.Entities.Components.RegionLogMgr",
  "BluePrints.Client.Entities.Components.RougeLikeMgr",
  "BluePrints.Client.Entities.Components.ExtendMgr",
  "BluePrints.Client.Entities.Components.TraceMgr",
  "BluePrints.Client.Entities.Components.Friend",
  "BluePrints.Client.Entities.Components.Pet",
  "BluePrints.Client.Entities.Components.BuffMgr",
  "BluePrints.Client.Entities.CommonComponents.AutoBattleTestComponent",
  "BluePrints.Client.Entities.Components.AvatarRegionRpcMgr",
  "BluePrints.Client.Entities.Components.AvatarRegionMgr",
  "BluePrints.Client.Entities.Components.ChatComp",
  "BluePrints.Client.Entities.Components.DynamicQuestMgr",
  "BluePrints.Client.Entities.Components.StarterQuest",
  "BluePrints.Client.Entities.Components.DailyLogin",
  "BluePrints.Client.Entities.Components.ImpressionShopMgr",
  "BluePrints.Client.Entities.Components.WikiEntry",
  "BluePrints.Client.Entities.Components.AppearanceMgr",
  "BluePrints.Client.Entities.Components.AbyssMgr",
  "BluePrints.Client.Entities.Components.DispathMgr",
  "Blueprints.Client.Entities.Components.Walnut",
  "Blueprints.Client.Entities.CommonComponents.GameModeWalnutComponent",
  "Blueprints.Client.Entities.Components.OnlineComp",
  "Blueprints.Client.Entities.Components.RegionMoveSyncMgr",
  "Blueprints.Client.Entities.Components.LevelSequence",
  "BluePrints.Client.Entities.Components.NewImpressionMgr",
  "BluePrints.Client.Entities.Components.ArchiveMgr",
  "BluePrints.Client.Entities.Components.FishMgr",
  "BluePrints.Client.Entities.Components.DetectiveQuestion",
  "BluePrints.Client.Entities.Components.SquadMgr",
  "BluePrints.Client.Entities.Components.PersonalInfoMgr",
  "BluePrints.Client.Entities.Components.MonthlyCardComp",
  "BluePrints.Client.Entities.Components.BattlePass",
  "BluePrints.Client.Entities.Components.DailyTaskMgr",
  "BluePrints.Client.Entities.Components.ModBookQuestComp",
  "BluePrints.Client.Entities.Components.ZhiLiuEntrust",
  "BluePrints.Client.Entities.Components.HoldModMgr",
  "BluePrints.Client.Entities.Components.MidTermMgr",
  "BluePrints.Client.Entities.Components.PaotaiGame",
  "BluePrints.Client.Entities.Components.LimitedResourceMgr",
  "BluePrints.Client.Entities.Components.CommonQuestActivity",
  "BluePrints.Client.Entities.Components.CommunityMgr",
  "BluePrints.Client.Entities.Components.TempleEventMgr",
  "BluePrints.Client.Entities.Components.MiscEnterWorldMgr",
  "BluePrints.Client.Entities.Components.FeiNaMgr",
  "BluePrints.Client.Entities.Components.TitleComp",
  "BluePrints.Client.Entities.Components.DoubleModDrop",
  "BluePrints.Client.Entities.Components.SettlementOnlineMgr",
  "BluePrints.Client.Entities.Components.TheaterActivity",
  "BluePrints.Client.Entities.Components.RaidSeasonMgr",
  "BluePrints.Client.Entities.Components.MountMgr",
  "BluePrints.Client.Entities.Components.WebJumpMgr"
}
function r8_0.Init(r0_1, r1_1)
  -- line: [107, 117] id: 1
  r8_0.Super.Init(r0_1, r1_1)
  r0_1.bClientEntity = true
  assert(r7_0.loadufsfile(UE4.UKismetSystemLibrary.GetProjectContentDirectory() .. "Script/NetworkEngine/Proto/pb/Attr.pb"))
  r0_1.AttrTypes = {}
  for r7_1, r8_1, r9_1 in r7_0.types() do
    r0_1.AttrTypes[r8_1] = true
  end
  -- close: r3_1
end
function r8_0.OnBecomePlayer(r0_2)
  -- line: [119, 134] id: 2
  r8_0.Super.OnBecomePlayer(r0_2)
  local r1_2 = GWorld.GameInstance:GetAvatar()
  if r1_2 then
    r1_2:SetClientAvatar(r0_2)
  else
    assert(false, "登录出错，Avatar为空，8成你是用打包环境去运行工程了，回退你的仓库")
  end
  MissionIndicatorManager.TrackingSpecialSideQuestChainId = nil
  SystemGuideManager:AddListenerSystemGuide()
  r0_2:EnterWorld()
  r0_2:QueryHotfix()
  AudioManager(r0_2):SetVoiceGender()
end
function r8_0.QueryHotfix(r0_3)
  -- line: [136, 139] id: 3
  r0_3:CallServerMethod("QueryHotfix", GWorld.HotfixDataIndex and 0)
end
function r8_0.OnQueryHotfixSuccess(r0_4, r1_4, r2_4)
  -- line: [141, 149] id: 4
  r0_4.logger.debug("OnQueryHotfixSuccess", r1_4, r2_4)
  local r3_4 = GWorld.HotfixDataIndex and 0
  if r2_4 and r3_4 < r2_4 then
    require("HotFix").ExecHotFix(r2_4, r1_4)
    GWorld.HotfixDataIndex = r2_4
  end
end
function r8_0.OnRefreshLogin(r0_5, r1_5, r2_5, r3_5)
  -- line: [151, 160] id: 5
  r4_0.SetTimeOffset(r1_5)
  r4_0.SetServerTimeZone(r2_5)
  r0_5:LoginSuccess()
  local r4_5 = HeroUSDKSubsystem()
  if r3_5 then
    r4_5:HeroSDKRoleCreate(r3_0.GenHeroHDCGameRoleInfo())
  end
end
function r8_0.OnRelayLogin(r0_6, r1_6, r2_6, r3_6)
  -- line: [162, 166] id: 6
  r4_0.SetTimeOffset(r1_6)
  r4_0.SetServerTimeZone(r2_6)
  r0_6:LoginSuccess()
end
function r8_0.LoginSuccess(r0_7)
  -- line: [168, 182] id: 7
  r0_7:RefreshWeapon()
  r0_7:InitGameSetting()
  SystemGuideManager:InitCondition()
  local function r1_7()
    -- line: [172, 175] id: 8
    EventManager:FireEvent(EventID.OnLoginSuccess)
    GWorld.GameInstance:OnLoginSuccess()
  end
  local r2_7 = UE.UKismetSystemLibrary:GetPlatformUserName()
  r0_7.logger.debug("LoginSuccess", GWorld.EnterMode, r2_7)
  r0_7:CallServer("OnLoginSuccess", r1_7, GWorld.EnterMode, r2_7)
  if r0_7.Hostnum == 399 then
    r0_7:CallServerMethod("SetIp", UEMGameInstance.GetOuterIp())
  end
end
function r8_0.SA_LOG(r0_9, r1_9, r2_9, r3_9)
  -- line: [184, 186] id: 9
  r0_9:CallServerMethod("Client_SA_LOG", r1_9, r2_9, r3_9)
end
function r8_0.LeaveWorld(r0_10)
  -- line: [188, 193] id: 10
  local r1_10 = GWorld.GameInstance:GetAvatar()
  if r1_10 then
    r1_10:SetClientAvatar(nil)
  end
end
function r8_0.UseCDK(r0_11, r1_11, r2_11)
  -- line: [195, 203] id: 11
  r0_11:CallServer("UseCDK", function(r0_12, r1_12)
    -- line: [196, 201] id: 12
    r0_11.logger.debug("UseCDK", ErrorCode:Name(r0_12), CommonUtils.TableToString(r1_12))
    if r2_11 then
      r2_11(r0_12, r1_12)
    end
  end, r1_11)
end
function r8_0.RequestSetNowTime(r0_13, r1_13)
  -- line: [205, 212] id: 13
  r0_13:CallServer("RequestSetNowTime", function(r0_14, r1_14)
    -- line: [206, 210] id: 14
    if r0_14 == ErrorCode.RET_SUCCESS then
      r4_0.OnRequestSetNowTime(r1_14)
    end
  end, r1_13)
end
function r8_0.CheckTimeAcceleration(r0_15)
  -- line: [214, 217] id: 15
  DebugPrint("CheckTimeAcceleration", r4_0.NowTime())
  r0_15:CallServerMethod("CheckTimeAcceleration")
end
function r8_0.AceReceiveData(r0_16, r1_16, r2_16)
  -- line: [218, 227] id: 16
  DebugPrint("AceReceiveData", r1_16, r2_16)
  local r3_16 = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UACESubsystem)
  if not r3_16 then
    return 
  end
  r3_16:ReceivePacketFromServer(r5_0.StringToByteTable(r1_16))
end
function r8_0.QueryVersionControl(r0_17, r1_17)
  -- line: [229, 238] id: 17
  r0_17:CallServer("QueryVersionControl", function(r0_18)
    -- line: [230, 235] id: 18
    DebugPrint("QueryVersionControl", r0_18)
    if r1_17 then
      r1_17(r0_18)
    end
  end)
end
function r8_0._OnPropChangeCurrentChar(r0_19)
  -- line: [240, 242] id: 19
  r0_19.NeedRefreshPlayer = true
end
function r8_0.OnEntityInitSuccess(r0_20)
  -- line: [243, 245] id: 20
  DebugPrint("Avatar:OnEntityInitSuccess")
end
function r8_0._OnPropChangeCurrentPet(r0_21)
  -- line: [246, 249] id: 21
  r0_21.NeedRefreshPlayer = true
  DebugPrint("Avatar:_OnPropChangeCurrentPet self.NeedRefreshPlayer:", r0_21.NeedRefreshPlayer)
end
function r8_0._OnPropChangePets(r0_22, r1_22)
  -- line: [251, 265] id: 22
  r0_22.NeedRefreshPlayer = true
  DebugPrint("Avatar:_OnPropChangePets", CommonUtils.TableToString(r1_22))
end
function r8_0._OnPropChangeMeleeWeapon(r0_23)
  -- line: [266, 268] id: 23
  r0_23.NeedRefreshPlayer = true
end
function r8_0._OnPropChangeRangedWeapon(r0_24)
  -- line: [270, 272] id: 24
  r0_24.NeedRefreshPlayer = true
end
function r8_0._OnPropChangeLevel(r0_25)
  -- line: [274, 293] id: 25
  local r1_25 = UE.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if r1_25 and r1_25:Cast(UE4.AEMGameMode) and r1_25:IsInRegion() then
    r1_25:UpdateRegionGameModeLevel()
  end
  for r6_25, r7_25 in pairs(DataMgr.PlayerLevelUp) do
    if r7_25.PlayerLevel <= r0_25.Level and not r0_25.LevelRewardsGot[r7_25.PlayerLevel] then
      if not ReddotManager.GetTreeNode("ExperienceItem") then
        ReddotManager.AddNode("ExperienceItem")
      end
      local r9_25 = ReddotManager.GetLeafNodeCacheDetail("ExperienceItem")
      if not r9_25[r7_25.PlayerLevel] then
        r9_25[r7_25.PlayerLevel] = 1
        ReddotManager.IncreaseLeafNodeCount("ExperienceItem")
      end
    end
  end
  -- close: r2_25
  EventManager:FireEvent(EventID.OnPlayerLevelUp)
end
function r8_0._OnPropChangeMailUniqueID(r0_26)
  -- line: [295, 297] id: 26
  EventManager:FireEvent(EventID.OnChangePropMailUniqueID)
end
function r8_0._OnPropChangeActionPoint(r0_27)
  -- line: [299, 301] id: 27
  EventManager:FireEvent(EventID.OnChangeActionPoint, CommonConst.ActionPoint)
end
function r8_0._OnPropChangeChars(r0_28, r1_28)
  -- line: [303, 311] id: 28
  r0_28.NeedRefreshPlayer = true
  if CommonUtils.Size(r1_28) == 1 then
    local r2_28 = r0_28.Chars[r1_28[1]]
    if r2_28 then
      r2_28:_Init()
    end
  end
end
function r8_0.PrintServerLog(r0_29, ...)
  -- line: [312, 314] id: 29
  DebugPrint("Avatar:PrintServerLog", ...)
end
function r8_0._OnPropChangeCommonChars(r0_30, r1_30)
  -- line: [316, 318] id: 30
  r0_30.NeedRefreshPlayer = true
end
function r8_0._OnPropChangeWeapons(r0_31, r1_31)
  -- line: [320, 322] id: 31
  r0_31.NeedRefreshPlayer = true
end
function r8_0._OnPropChangeUWeapons(r0_32, r1_32)
  -- line: [324, 326] id: 32
  r0_32.NeedRefreshPlayer = true
end
function r8_0._OnPropChangeMods(r0_33, r1_33)
  -- line: [328, 330] id: 33
  r0_33.NeedRefreshPlayer = true
end
function r8_0.ResetNeedRefreshPlayer(r0_34)
  -- line: [332, 334] id: 34
  r0_34.NeedRefreshPlayer = false
end
function r8_0.GetNeedRefreshPlayer(r0_35)
  -- line: [336, 338] id: 35
  return r0_35.NeedRefreshPlayer
end
function r8_0._OnPropChangeResources(r0_36, r1_36)
  -- line: [340, 345] id: 36
  if CommonUtils.Size(r1_36) == 1 then
    EventManager:FireEvent(EventID.OnPropSetResources, r1_36[1])
  end
end
function r8_0._OnPropChangeWheels(r0_37, r1_37)
  -- line: [347, 349] id: 37
  EventManager:FireEvent(EventID.OnPropChangeWheels)
end
function r8_0.ResetOnReconnect(r0_38)
  -- line: [351, 352] id: 38
end
function r8_0.ClientTest(r0_39, ...)
  -- line: [356, 366] id: 39
  r0_39.logger.debug("ClientTest")
  local r1_39 = r4_0.NowTime()
  r0_39.logger.debug(r1_39)
  r0_39.logger.debug(r4_0.TimestampToData(r1_39))
  r0_39.logger.debug(r4_0.TimeToStr(r1_39))
  r0_39:CallServer("ClientTest", function(r0_40)
    -- line: [362, 364] id: 40
    PrintTable({
      result = r0_40,
    }, 3)
  end)
end
function r8_0.CallbackTest(r0_41)
  -- line: [368, 370] id: 41
  r0_41.logger.debug("111111111111111111111 CallbackTest")
end
function r8_0.OnTestAutoBattle(r0_42, r1_42, r2_42, r3_42)
  -- line: [373, 375] id: 42
  print(_G.LogTag, "OnTestAutoBattle", r1_42, r2_42, r3_42)
end
function r8_0.tt(r0_43, r1_43)
  -- line: [377, 381] id: 43
  r0_43:CallServerMethod("AddWalnut", 1000, 1)
  r0_43:CallServerMethod("AddWalnut", 1001, 1)
end
function r8_0.SetHomeBaseBGM(r0_44, r1_44)
  -- line: [383, 388] id: 44
  r0_44:CallServer("SetHomeBaseBGM", function(r0_45)
    -- line: [384, 386] id: 45
    print(_G.LogTag, "SetHomeBaseBGM", r0_45)
  end, r1_44)
end
function r8_0.SendToFeishuForBattle(r0_46, r1_46, r2_46)
  -- line: [390, 392] id: 46
  r0_46:CallServerMethod("SendToFeishuForBattle", r1_46, r2_46)
end
function r8_0.SendToFeishuForJQ(r0_47, r1_47, r2_47)
  -- line: [394, 396] id: 47
  r0_47:CallServerMethod("SendToFeishuForJQ", r1_47, r2_47)
end
function r8_0.SendToFeiShuForMonster(r0_48, r1_48, r2_48)
  -- line: [398, 402] id: 48
  local r4_48 = "设备名：" .. UE.UKismetSystemLibrary:GetPlatformUserName() .. "\n" .. r1_48
  r0_48:CallServerMethod("SendToFeiShuForMonster", r1_48, r2_48)
end
function r8_0.SendToFeiShuForRegionMgr(r0_49, r1_49, r2_49)
  -- line: [404, 406] id: 49
  r0_49:CallServerMethod("SendToFeiShuForRegionMgr", r1_49, r2_49)
end
function r8_0.SendToFeishuForRougeLike(r0_50, r1_50, r2_50)
  -- line: [408, 410] id: 50
  r0_50:CallServerMethod("SendToFeishuForRougeLike", r1_50, r2_50)
end
function r8_0.SendToFeishuForCombatMonitor(r0_51, r1_51)
  -- line: [412, 414] id: 51
end
function r8_0.SendTraceToQaWeb(r0_52, r1_52, r2_52)
  -- line: [427, 429] id: 52
  r0_52:CallServerMethod("SendTraceToQaWeb", r1_52, r2_52)
end
function r8_0.NotifyOpenCrashSight(r0_53)
  -- line: [431, 442] id: 53
  print(_G.LogTag, "NotifyOpenCrashSight")
  if not r6_0:Get("IsOpenCrashSight") then
    r6_0:Set("IsOpenCrashSight", true)
    r6_0:SaveAll()
    if GWorld.GameInstance then
      GWorld.GameInstance:InitCrashSight()
    end
  end
end
function r8_0.SaveCreatePhantomInfo(r0_54, r1_54, r2_54, r3_54, r4_54, r5_54)
  -- line: [444, 455] id: 54
  if not r0_54.PhantomCreateInfo then
    r0_54.PhantomCreateInfo = {}
  end
  if not r0_54.PhantomCreateInfo[r1_54] then
    r0_54.PhantomCreateInfo[r1_54] = {}
  end
  r0_54.PhantomCreateInfo[r1_54].BTIndex = r2_54
  r0_54.PhantomCreateInfo[r1_54].Info = r3_54
  r0_54.PhantomCreateInfo[r1_54].ExtraInfo = r4_54
  r0_54.PhantomCreateInfo[r1_54].Level = r5_54
end
function r8_0.ClearCreatePhantomInfo(r0_55, r1_55)
  -- line: [457, 465] id: 55
  if not r0_55.PhantomCreateInfo then
    return 
  end
  if not r0_55.PhantomCreateInfo[r1_55] then
    return 
  end
  r0_55.PhantomCreateInfo[r1_55] = nil
end
function r8_0.NotifyAppStoreRatingJump(r0_56)
  -- line: [467, 483] id: 56
  local r1_56 = UE.AHotUpdateGameMode.IsGlobalPak()
  local r2_56 = UE4.UUIFunctionLibrary.GetDevicePlatformName(r0_56)
  if not r1_56 and r2_56 == "IOS" then
    if HeroUSDKSubsystem():IsHeroSDKEnable() then
      HeroUSDKSubsystem():AppRatingWithType(0, "")
    end
    DebugPrint("NotifyAppStoreRatingJump China IOS Platform")
    return 
  end
  if GWorld.GameInstance then
    GWorld.GameInstance:GetGameUIManager():LoadUINew("GameReview")
  else
    DebugPrint("NotifyAppStoreRatingJump GWorld.GameInstance is nil")
  end
end
r2_0.AssembleComponents(r8_0)
r2_0.FormatProperties(r8_0)
return r8_0
