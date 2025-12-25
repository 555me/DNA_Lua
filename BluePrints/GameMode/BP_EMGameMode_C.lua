-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\GameMode\BP_EMGameMode_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("CommonConst")
local r1_0 = require("Utils.ItemUtils")
local r2_0 = require("Utils.CommonUtils")
local r3_0 = require("msgpack_core")
local r4_0 = require("BluePrints.Common.ClientEvent.ClientEventUtils")
local r5_0 = require("Utils.MiscUtils")
local r6_0 = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.GameMode.Components.AIBattleMgr",
  "BluePrints.GameMode.Components.HardBossComponent",
  "BluePrints.GameMode.Components.AbyssComponent",
  "BluePrints.GameMode.Components.ProgressSnapShotComponent",
  "BluePrints.GameMode.Components.GameModeLogin",
  "BluePrints.GameMode.Components.RewardComponent",
  "BluePrints.GameMode.Components.GameModeEventComponent",
  "BluePrints.GameMode.Components.RougeLikeComponent",
  "BluePrints.GameMode.Components.GameModeRegionMgr",
  "BluePrints.GameMode.Components.GameModeQuestMgr",
  "BluePrints.GameMode.Components.WalnutComponent",
  "BluePrints.GameMode.Components.TicketComponent",
  "BluePrints.GameMode.Components.RewardGenComponent",
  "BluePrints.GameMode.Components.DungeonDeliveryComponent"
})
r6_0._components = {}
function r6_0.InitGameModeInfo(r0_1, r1_1)
  -- line: [38, 65] id: 1
  r0_1.PreInitInfo = GWorld.GameInstance:ConsumeGameModePreInitInfo()
  r0_1:SetGameModeBaseInfo(r1_1)
  r0_1.EMGameState:InitGameStateInfo()
  r0_1.MonsterCacheNum = 10
  r0_1.CacheAvatarToItems = {}
  r0_1.GMMonsterBuff = {}
  r0_1.MiniGameFailedTime = {}
  r0_1.DropRule = {}
  r0_1:InitFixedCreator()
  r0_1:InitAIBattleMgr()
  r0_1:InitRewardParams()
  r0_1.bEnableMonsterCollisionPush = true
  r0_1.NeedToWaitForOthers = false
  local r2_1 = GWorld:GetDSEntity()
  if r2_1 and r2_1.bBlock then
    r0_1:BlockEntrance()
  else
    r0_1.bBlock = false
  end
  r0_1.BattleAvatars = {}
end
function r6_0.SetGameModeBaseInfo(r0_2, r1_2)
  -- line: [68, 113] id: 2
  local r2_2 = GWorld:GetAvatar()
  if r2_2 and r0_2:IsInRegion() then
    print(_G.LogTag, "Init Region")
    r0_2.DungeonId = -1
    r0_2.RegionId = r2_2:GetSubRegionId2RegionId(r2_2.CurrentRegionId)
    r0_2:UpdateRegionGameModeLevel()
    r0_2.EMGameState:SetGameModeType("Region")
    r0_2:UpdateQuestArtLevel()
    r0_2.EMGameState.CurDungeonUIParamID = 0
    r0_2:SetGameStatePetRandomDailyCount()
  elseif r0_2:IsInDungeon() then
    print(_G.LogTag, "Init Dungeon")
    local r3_2 = DataMgr.Dungeon[r1_2]
    if not r3_2 then
      return 
    end
    r0_2.DungeonId = r1_2
    local r4_2 = r3_2.DungeonLevel and 1
    r0_2.BattleProgressLevel = r3_2.DungeonFixLevel and 0
    r0_2:SetGameModeLevel(r4_2)
    r0_2.CommonAlertDisable = r3_2.AlertDisable and r0_2.CommonAlertDisable
    r0_2.EMGameState:SetGameModeType("Blank")
    if r3_2.DungeonType and r3_2.DungeonType ~= "" then
      r0_2.EMGameState:SetGameModeType(r3_2.DungeonType)
    end
    r0_2:InitDungeonComponent()
    if r3_2.EnableTacmap then
      r0_2:InitTacMapManager()
    end
    r0_2:InitGameModeTypeInfo()
    r0_2:InitEmergencyMonster()
    r0_2:InitBPVars(r3_2)
    if not IsDedicatedServer(r0_2) then
      r0_2:InitDungeonRandomEvent()
    end
  else
    DebugPrint("BP_EMGameMode_C: Warning!!! DungeonId 为", r1_2)
  end
end
function r6_0.InitGameModeTypeInfo(r0_3)
  -- line: [115, 129] id: 3
  if not r0_3:CheckGameModeEnable() then
    return 
  end
  if r0_3.EMGameState.GameModeType == "Blank" then
    return 
  end
  if not r0_3:GetDungeonComponent() then
    return 
  end
  local r1_3 = "Init" .. r0_3.EMGameState.GameModeType .. "Component"
  if r0_3:GetDungeonComponent() ~= nil and r0_3:GetDungeonComponent()[r1_3] ~= nil then
    r0_3:GetDungeonComponent()[r1_3](r0_3:GetDungeonComponent())
  end
end
function r6_0.InitTacMapManager(r0_4)
  -- line: [131, 139] id: 4
  r0_4.TacMapManager = nil
  if not r0_4:GetLevelLoader() then
    return 
  end
  r0_4.TacMapManager = NewObject(LoadClass("/Game/BluePrints/Common/Level/BP_TacmapManagerNew.BP_TacmapManagerNew_C"), r0_4)
  r0_4.TacMapManager:Init(r0_4.levelLoader)
end
function r6_0.TryRegisterPlayerToTacmap(r0_5)
  -- line: [141, 150] id: 5
  local r1_5 = DataMgr.Dungeon[r0_5.DungeonId]
  if not r1_5 or not r1_5.EnableTacmap or not r0_5.TacMapManager then
    return 
  end
  for r5_5 = 0, r0_5:GetPlayerNum() + -1, 1 do
    r0_5.TacMapManager:RegisterPlayer(UE4.UGameplayStatics.GetPlayerCharacter(r0_5, r5_5), r5_5 + 1)
  end
end
function r6_0.GMInitGameModeInfo(r0_6, r1_6)
  -- line: [152, 154] id: 6
  r0_6:InitGameModeInfo(r1_6)
end
function r6_0.ResetRemainTriggerAlertCD(r0_7)
  -- line: [156, 158] id: 7
  r0_7.RemainTriggerAlertCD = DataMgr.GlobalConstant.GameModeAlertCD.ConstantValue and 30
end
function r6_0.ReceiveBeginPlay(r0_8)
  -- line: [160, 172] id: 8
  r0_8.LevelGameMode = UE4.UGameplayStatics.GetGameMode(r0_8)
  if r0_8:IsSubGameMode() then
    return 
  end
  r0_8:SetActorTickInterval(1)
  r0_8:AIBattleMgrReceiveBeginPlay()
  r0_8:BindTalkSubsystem()
  r0_8.GameModeIndex = GWorld:AddGameMode(r0_8)
end
function r6_0.ReceiveEndPlay(r0_9, r1_9)
  -- line: [174, 184] id: 9
  if r0_9:IsSubGameMode() then
    return 
  end
  r0_9.Overridden.ReceiveEndPlay(r0_9, r1_9)
  r0_9.OnDestroyDelegates:Broadcast()
  r0_9:UnbindTalkSubsystem()
  GWorld:RemoveGameMode(r0_9.GameModeIndex)
end
function r6_0.BindTalkSubsystem(r0_10)
  -- line: [186, 195] id: 10
  local r1_10 = USubsystemBlueprintLibrary.GetWorldSubsystem(r0_10, UTalkSubsystem)
  if not IsValid(r1_10) then
    return 
  end
  if r0_10.OnGamePauseChanged then
    r0_10.OnGamePauseChanged:Add(r1_10, r1_10.OnGamePauseChanged)
  end
end
function r6_0.UnbindTalkSubsystem(r0_11)
  -- line: [197, 206] id: 11
  local r1_11 = USubsystemBlueprintLibrary.GetWorldSubsystem(r0_11, UTalkSubsystem)
  if not IsValid(r1_11) then
    return 
  end
  if r0_11.OnGamePauseChanged then
    r0_11.OnGamePauseChanged:Remove(r1_11, r1_11.OnGamePauseChanged)
  end
end
function r6_0.GetPlayerLevel(r0_12)
  -- line: [208, 210] id: 12
  local r1_12 = GWorld:GetAvatar()
  if r1_12 then
    r1_12 = GWorld:GetAvatar().Level and 0
  else
    goto label_11	-- block#2 is visited secondly
  end
  return r1_12
end
function r6_0.GetTargetPlayerNum(r0_13)
  -- line: [249, 251] id: 13
  return r2_0.Size(r0_13.AvatarInfos)
end
function r6_0.IsNeedToWaitForOthers(r0_14)
  -- line: [253, 255] id: 14
  return r0_14.NeedToWaitForOthers
end
function r6_0.ReceiveTick(r0_15, r1_15)
  -- line: [257, 260] id: 15
  r0_15:TickAIBattleMgr(r1_15)
  r0_15:TickGenReward(r1_15)
end
function r6_0.GetAlreadyInit(r0_16)
  -- line: [263, 265] id: 16
  return r0_16.AlreadyInit
end
function r6_0.SetRegionSpecialQuest(r0_17, r1_17, r2_17)
  -- line: [271, 283] id: 17
  assert(r0_17:IsInRegion(), "SetRegionSpecialQuest 只能在区域内调用")
  r0_17.EMGameState.CurDungeonUIParamID = r2_17
  local r3_17 = ERegionSpecialQuestType:GetNameByValue(r1_17)
  r0_17:InitRegionDungeonComponent(r3_17)
  r0_17.LevelGameMode:InitRegionSpecialQuestGameModeComponent()
  r0_17.EMGameState:SetDungeonUIState(Const.EDungeonUIState.None)
  r0_17.EMGameState:LoadDungeonUI(r3_17)
  DebugPrint("SetRegionSpecialQuest 特殊任务GameModeComponent初始化 特殊任务:", r3_17)
end
function r6_0.ResetRegionSpecialQuest(r0_18)
  -- line: [285, 292] id: 18
  DebugPrint("ResetRegionSpecialQuest 特殊任务GameModeComponent重置 特殊任务:", r0_18.LevelGameMode.RegionSpecialQuest)
  r0_18.EMGameState:UnloadDungeonUI(r0_18.LevelGameMode.RegionSpecialQuest)
  r0_18.LevelGameMode:ClearRegionSpecialQuestGameModeComponent()
  r0_18:ClearRegionDungeonComponent()
  r0_18.EMGameState.CurDungeonUIParamID = 0
end
function r6_0.InitRegionSpecialQuestGameModeComponent(r0_19)
  -- line: [294, 300] id: 19
  if r0_19.RegionSpecialQuest == nil then
    return 
  end
  r0_19:TriggerDungeonComponentFun("Init" .. r0_19.RegionSpecialQuest .. "Component")
end
function r6_0.ClearRegionSpecialQuestGameModeComponent(r0_20)
  -- line: [302, 308] id: 20
  if r0_20.RegionSpecialQuest == nil then
    return 
  end
  r0_20:TriggerDungeonComponentFun("Clear" .. r0_20.RegionSpecialQuest .. "Component")
end
function r6_0.ShowTrialTask(r0_21, r1_21)
  -- line: [310, 312] id: 21
  r0_21:TriggerDungeonComponentFun("ShowTrialTask", r1_21)
end
function r6_0.OnInit(r0_22)
  -- line: [316, 375] id: 22
  if not r0_22:CheckGameModeEnable() then
    return 
  end
  if r0_22:IsSubGameMode() then
    return 
  end
  r0_22:RegionOnInit()
  DebugPrint("GameMode进行激活 OnInit")
  GWorld:DSBLog("Info", "GameMode:OnInit", "GameMode")
  r0_22:AddDungeonEvent("OnInit")
  r0_22.AlreadyInit = true
  if IsDedicatedServer(r0_22) then
    GWorld.GameInstance:SetFixedFrameRate(20)
  end
  r0_22:TryRegisterPlayerToTacmap()
  r0_22.CharExpGetInBattle = 0
  if r0_22:IsInDungeon() and r0_22:NeedProgressRecover() then
    r0_22:InitBPBornActor()
    r0_22:TriggerProgressRecover()
  else
    r0_22:InitDungeonBaseInfo()
    local r1_22 = GWorld:GetAvatar()
    if r1_22 then
      require("BluePrints.UI.TaskPanel.TaskUtils"):UpdatePlayerSubRegionIdInfo(r1_22.CurrentRegionId)
      r1_22:CombineAddRegionData(true)
      r0_22:AddTimer(0.1, function()
        -- line: [348, 353] id: 23
        local r0_23 = GWorld:GetAvatar()
        if r0_23 and r0_23.CombineAdd and r0_22:IsInRegion() then
          r0_23:CombineAddRegionData(false)
        end
      end)
    end
    r0_22:InitBPBornActor()
    r0_22:InitCustomActor()
    r0_22:InitAutoActiveStaticCreator()
    if r1_22 and r0_22:IsInRegion() then
      r1_22:CombineAddRegionData(false)
    end
    r0_22.Overridden.OnInit(r0_22)
  end
  if r0_22:IsInDungeon() and r0_22.DungeonId and r0_22.DungeonId > 0 then
    r0_22:SetDungeonBGMState(0)
  end
  r0_22.OnInitDelegates:Broadcast()
  r4_0:ClearCurrentDoingDynamicEvent(true, true)
end
function r6_0.InitDungeonBaseInfo(r0_24)
  -- line: [377, 392] id: 24
  if r0_24:IsSubGameMode() or r0_24:IsInRegion() then
    return 
  end
  if r0_24.EMGameState.GameModeType == "Blank" then
    return 
  end
  if not r0_24:GetDungeonComponent() then
    return 
  end
  local r1_24 = "Init" .. r0_24.EMGameState.GameModeType .. "BaseInfo"
  if r0_24:GetDungeonComponent() ~= nil and r0_24:GetDungeonComponent()[r1_24] ~= nil then
    r0_24:GetDungeonComponent()[r1_24](r0_24:GetDungeonComponent())
  end
end
function r6_0.RegionOnInit(r0_25)
  -- line: [395, 406] id: 25
  if r0_25:IsInRegion() then
    local r1_25 = GWorld:GetAvatar()
    if r1_25 then
      r1_25:HandleTryInitRegionInfo()
    end
    if not r0_25.EMGameState:RegionNeedPreCreateUnit() then
      r0_25:GetRegionDataMgrSubSystem():OnInitRecoverRegionData(false)
    end
  end
end
function r6_0.OnQuestComplete(r0_26, r1_26, r2_26)
  -- line: [412, 420] id: 26
  r0_26.Overridden.OnQuestComplete(r0_26, r1_26, r2_26)
  for r8_26, r9_26 in pairs(r0_26:K2_GetComponentsByClass(UAfterQuestFinishEventComponent.StaticClass()):ToTable()) do
    if r9_26.QuestId == r2_26 then
      r9_26.AfterQuestFinish:Broadcast()
    end
  end
  -- close: r4_26
end
function r6_0.TriggerOnQuestCompleteComponent(r0_27)
  -- line: [422, 433] id: 27
  local r1_27 = r0_27:K2_GetComponentsByClass(UAfterQuestFinishEventComponent.StaticClass())
  local r2_27 = GWorld:GetAvatar()
  if not r2_27 then
    return 
  end
  for r7_27, r8_27 in pairs(r1_27:ToTable()) do
    if r2_27:IsQuestFinished(r8_27.QuestId) or r2_27:IsQuestAssumeFinished(r8_27.QuestId) then
      r8_27.AfterQuestFinish:Broadcast()
    end
  end
  -- close: r3_27
end
function r6_0.OnBigWorldActive(r0_28)
  -- line: [435, 439] id: 28
  r0_28.Overridden.OnBigWorldActive(r0_28)
  r0_28:TriggerOnQuestCompleteComponent()
end
function r6_0.MainGameModeOnBigWorldActive(r0_29)
  -- line: [441, 479] id: 29
  if r0_29:IsSubGameMode() then
    return 
  end
  local r1_29 = GWorld:GetAvatar()
  local r2_29 = {}
  for r7_29, r8_29 in pairs(r0_29.EMGameState.ExploreGroupMap:ToTable()) do
    if r8_29.AutoActive then
      local r9_29 = r0_29:GetRegionIdByLocation(r8_29:K2_GetActorLocation())
      local r10_29 = r8_29:GetExploreGroupId()
      if not DataMgr.SubRegion[r9_29] then
        GWorld.logger.error("ZJT_ 哦我的上帝，这里有一个探索组" .. r10_29 .. "被丢弃在区域外" .. r9_29 .. "找不到它所在的区域")
      elseif r2_29[r8_29:GetExploreGroupId()] then
        GWorld.logger.error("ZJT_ 哦我的上帝，这里有一个探索组居然重复掉了" .. r10_29 .. ":SubRegionId:" .. r9_29 .. "所在的区域")
      else
        local r11_29 = r1_29.Explores[r10_29]
        if r11_29 then
          if r11_29:IsDoing() and r11_29.RegionId ~= r9_29 then
            GWorld.logger.error("ZJT_ 哦我的上帝，这里有一个探索组居然重复掉了 不同区域: " .. r10_29 .. ": 本次激活 SubRegionId:" .. r9_29 .. "所在的区域" .. "上次激活：" .. r11_29.RegionId .. " 所在区域！")
          elseif r11_29:IsInActive() then
            r2_29[r10_29] = r9_29
          end
        else
          r2_29[r10_29] = r9_29
        end
        r8_29:InitSetExploreGroupStatus_Active()
      end
    end
  end
  -- close: r3_29
  if r1_29 then
    r1_29:ExploreIdsActive(r2_29)
  end
  r0_29:TriggerOnQuestCompleteComponent()
end
function r6_0.OnBattle(r0_30)
  -- line: [481, 488] id: 30
  if not r0_30:IsSubGameMode() then
    r0_30.OnBattleDelegates:Broadcast()
    r0_30:TriggerDungeonComponentFun("OnBattle")
  end
  r0_30.Overridden.OnBattle(r0_30)
end
function r6_0.OnPlayerEnter(r0_31, r1_31)
  -- line: [490, 497] id: 31
  if not r0_31:IsSubGameMode() and r1_31 > 0 then
    r0_31:TriggerDungeonComponentFun("OnPlayerEnter", r1_31)
  end
  r0_31.Overridden.OnPlayerEnter(r0_31, r1_31)
end
function r6_0.OnPause(r0_32)
  -- line: [499, 505] id: 32
  if not r0_32:IsSubGameMode() then
    r0_32.OnPauseDelegates:Broadcast()
  end
  r0_32.Overridden.OnPause(r0_32)
end
function r6_0.OnAlert(r0_33)
  -- line: [507, 513] id: 33
  if not r0_33:IsSubGameMode() then
    r0_33.OnAlertDelegates:Broadcast()
  end
  r0_33.Overridden.OnAlert(r0_33)
end
function r6_0.OnEnterCommonAlert(r0_34)
  -- line: [515, 521] id: 34
  if not r0_34:IsSubGameMode() then
    r0_34.OnEnterCommonAlertDelegates:Broadcast()
  end
  r0_34.Overridden.OnEnterCommonAlert(r0_34)
end
function r6_0.OnExitCommonAlert(r0_35)
  -- line: [523, 529] id: 35
  if not r0_35:IsSubGameMode() then
    r0_35.OnExitCommonAlertDelegates:Broadcast()
  end
  r0_35.Overridden.OnExitCommonAlert(r0_35)
end
function r6_0.OnResumeBattleEntities(r0_36)
  -- line: [531, 536] id: 36
  if not r0_36:IsSubGameMode() then
    r0_36.OnResumeBattleEntitiesDelegates:Broadcast()
  end
  r0_36.Overridden.OnResumeBattleEntities(r0_36)
end
function r6_0.OnPauseBattleEntities(r0_37, r1_37)
  -- line: [538, 543] id: 37
  if not r0_37:IsSubGameMode() then
    r0_37.OnPauseBattleEntitiesDelegates:Broadcast()
  end
  r0_37.Overridden.OnPauseBattleEntities(r0_37, r1_37)
end
function r6_0.OnBossDead(r0_38, r1_38)
  -- line: [545, 548] id: 38
  r0_38.Overridden.OnBossDead(r0_38, r1_38)
  r0_38:TriggerBPGameModeEvent("OnBossDead", r1_38)
end
function r6_0.OnEnd(r0_39, r1_39)
  -- line: [550, 570] id: 39
  if not r0_39:IsSubGameMode() then
    r0_39.OnEndDelegates:Broadcast(r1_39)
    r0_39.EMGameState:ClearGuideEid()
    r0_39:TriggerDungeonComponentFun("Trigger" .. r0_39.EMGameState.GameModeType .. "OnEnd")
    r0_39:RemoveDungeonEvent("OnInit")
    r0_39.CharExpGetInBattle = 0
    for r7_39, r8_39 in pairs(r0_39:GetAllPlayer()) do
      local r9_39 = r8_39:IsDead()
      if r9_39 then
        r9_39 = UE4.ETeamRecoveryState.RealDead and UE4.ETeamRecoveryState.Alive
      else
        goto label_37	-- block#4 is visited secondly
      end
      r8_39:HandleRemoveModPassives()
      r8_39:TryLeaveDying(r9_39)
    end
    -- close: r3_39
  end
  r0_39.Overridden.OnEnd(r0_39, r1_39)
end
function r6_0.OnStaticCreatorEvent(r0_40, r1_40, r2_40, r3_40, r4_40)
  -- line: [572, 577] id: 40
  if not r0_40:IsSubGameMode() then
    r0_40:TriggerDungeonComponentFun("OnStaticCreatorEvent", r1_40, r2_40, r3_40, r4_40)
  end
  r0_40.Overridden.OnStaticCreatorEvent(r0_40, r1_40, r2_40, r3_40, r4_40)
end
function r6_0.OnUnitDeadEvent(r0_41, r1_41)
  -- line: [579, 584] id: 41
  if not r0_41:IsSubGameMode() then
    r0_41:TriggerDungeonComponentFun("OnUnitDeadEvent", r1_41)
    r0_41:TriggerDungeonAchieve("OnMonsterDeadAchieve", r1_41, -1)
  end
end
function r6_0.OnUnitDestoryEvent(r0_42, r1_42, r2_42, r3_42)
  -- line: [586, 598] id: 42
  if not r0_42:IsSubGameMode() then
    r0_42:TriggerDungeonComponentFun("OnUnitDestoryEvent", r1_42, r2_42)
  end
  if r1_42 then
    r0_42:TriggerSTLEvent("OnSTLActorDestroyed", r1_42, r3_42)
  elseif r2_42 then
    r0_42:TriggerSTLEvent("OnSTLActorDestroyed", r2_42, r3_42)
  else
    DebugPrint("BP_EMGameMode_C:OnUnitDestoryEvent 传入的Monster和CombatItemBase均为空！")
  end
end
function r6_0.OnCombatPropDeadEvent(r0_43, r1_43)
  -- line: [600, 604] id: 43
  if not r0_43:IsSubGameMode() then
    r0_43:TriggerDungeonComponentFun("OnCombatPropDeadEvent", r1_43)
  end
end
function r6_0.STLPostStaticCreatorEvent(r0_44, r1_44, r2_44)
  -- line: [606, 613] id: 44
  if r0_44:IsInDungeon() then
    return 
  end
  if r2_44.Creator and r1_44.RandomCreatorId == 0 and r1_44.CreatorId ~= 0 then
    r0_44:TriggerSTLEvent("STLPostStaticCreatorEvent", r1_44)
  end
end
function r6_0.ClearDelayMonster(r0_45)
  -- line: [615, 623] id: 45
  if r0_45:IsInRegion() then
    return 
  end
  local r1_45 = r0_45.EMGameState.EventMgr
  r1_45.FramingCreateUintQueue.Monster = {}
  r1_45.LoadingClassMonsterQueue = {}
end
function r6_0.STLRegisterKillMonsterNode(r0_46, r1_46)
  -- line: [626, 637] id: 46
  if not r0_46.KillMonsterNodeMap then
    r0_46.KillMonsterNodeMap = {}
  end
  if _G.next(r0_46.KillMonsterNodeMap) == nil then
    r0_46.EMGameState:RegisterGameModeEvent("OnDead", r0_46, r0_46.STLOnMonsterKilled)
    DebugPrint("KillMonsterNode: 注册OnDead事件")
  end
  r0_46.KillMonsterNodeMap[r1_46.Key] = r1_46
  DebugPrint("KillMonsterNode: 注册到GameMode. Key", r1_46.Key)
end
function r6_0.STLUnRegisterKillMonsterNode(r0_47, r1_47)
  -- line: [639, 650] id: 47
  if not r0_47.KillMonsterNodeMap then
    return 
  end
  r0_47.KillMonsterNodeMap[r1_47] = nil
  DebugPrint("KillMonsterNode: 从GameMode移除. Key", r1_47)
  if _G.next(r0_47.KillMonsterNodeMap) == nil then
    r0_47.EMGameState:RemoveGameModeEvent("OnDead", r0_47, r0_47.STLOnMonsterKilled)
    DebugPrint("KillMonsterNode: 注销OnDead事件")
  end
end
function r6_0.STLOnMonsterKilled(r0_48, r1_48)
  -- line: [652, 662] id: 48
  if not r0_48.KillMonsterNodeMap then
    return 
  end
  for r7_48, r8_48 in pairs(r0_48:STLTableDeepCopy(r0_48.KillMonsterNodeMap)) do
    DebugPrint("KillMonsterNode: 怪物被击杀，Node Key", r7_48)
    r8_48:OnMonsterKilledByNums(r1_48)
  end
  -- close: r3_48
end
function r6_0.STLRegisterKillMonsterNode_Creator(r0_49, r1_49)
  -- line: [667, 678] id: 49
  if not r0_49.KillMonsterNodeMap_Creator then
    r0_49.KillMonsterNodeMap_Creator = {}
  end
  if _G.next(r0_49.KillMonsterNodeMap_Creator) == nil then
    r0_49.EMGameState:RegisterGameModeEvent("OnDeadStaticUnit", r0_49, r0_49.STLOnMonsterKilled_Creator)
    DebugPrint("KillMonsterNode_Creator: 注册OnDead事件")
  end
  r0_49.KillMonsterNodeMap_Creator[r1_49.Key] = r1_49
  DebugPrint("KillMonsterNode_Creator: 注册到GameMode. Key", r1_49.Key)
end
function r6_0.STLUnRegisterKillMonsterNode_Creator(r0_50, r1_50)
  -- line: [680, 691] id: 50
  if not r0_50.KillMonsterNodeMap_Creator then
    return 
  end
  r0_50.KillMonsterNodeMap_Creator[r1_50] = nil
  DebugPrint("KillMonsterNode_Creator: 从GameMode移除. Key", r1_50)
  if _G.next(r0_50.KillMonsterNodeMap_Creator) == nil then
    r0_50.EMGameState:RemoveGameModeEvent("OnDeadStaticUnit", r0_50, r0_50.STLOnMonsterKilled_Creator)
    DebugPrint("KillMonsterNode_Creator: 注销OnDead事件")
  end
end
function r6_0.STLOnMonsterKilled_Creator(r0_51, r1_51)
  -- line: [693, 703] id: 51
  if not r0_51.KillMonsterNodeMap_Creator then
    return 
  end
  for r7_51, r8_51 in pairs(r0_51:STLTableDeepCopy(r0_51.KillMonsterNodeMap_Creator)) do
    DebugPrint("KillMonsterNode_Creator: 怪物被击杀，Node Key", r7_51)
    r8_51:OnMonsterKilledByCreatorId(r1_51)
  end
  -- close: r3_51
end
function r6_0.STLTableDeepCopy(r0_52, r1_52)
  -- line: [705, 711] id: 52
  local r2_52 = {}
  for r7_52, r8_52 in pairs(r1_52) do
    r2_52[r7_52] = r8_52
  end
  -- close: r3_52
  return r2_52
end
function r6_0.OnCustomEvent(r0_53, r1_53, r2_53)
  -- line: [714, 720] id: 53
  if not r0_53:IsSubGameMode() then
    r0_53.OnCustomEventDelegates:Broadcast(r1_53, r2_53)
  end
  r0_53.Overridden.OnCustomEvent(r0_53, r1_53, r2_53)
  r0_53:TriggerBPGameModeEvent("OnCustomEvent", r1_53)
end
function r6_0.OnTriggerAOIBase(r0_54, r1_54, r2_54, r3_54, r4_54)
  -- line: [722, 733] id: 54
  if not r0_54:IsSubGameMode() then
    r0_54:TriggerSTLEvent("OnTriggerAOIBase", r1_54, r2_54, r3_54, r4_54)
  end
  r0_54.Overridden.OnTriggerAOIBase(r0_54, r1_54, r2_54, r3_54, r4_54)
  r0_54:TriggerBPGameModeEvent("OnTriggerAOIBase", r1_54, r2_54, r3_54, r4_54)
end
function r6_0.ChangeAOITriggerCollision(r0_55, r1_55, r2_55)
  -- line: [735, 746] id: 55
  for r7_55, r8_55 in pairs(r1_55) do
    local r9_55 = r0_55.EMGameState.StaticCreatorMap:Find(r8_55)
    if r9_55 and r9_55.ChildEids:Length() > 0 then
      local r10_55 = Battle(r0_55):GetEntity(r9_55.ChildEids[1])
      if r10_55 then
        local r11_55 = r10_55.CollisionComponent
        if r11_55 then
          if r2_55 then
            r11_55 = ECollisionEnabled.QueryOnly and ECollisionEnabled.NoCollision
          else
            goto label_34	-- block#7 is visited secondly
          end
          r10_55.CollisionComponent:SetCollisionEnabled(r11_55)
        end
      end
    end
  end
  -- close: r3_55
end
function r6_0.BpAddTimer(r0_56, r1_56, r2_56, r3_56, r4_56)
  -- line: [750, 758] id: 56
  DebugPrint("BpTimerDebug: BpAddTimer", r1_56, r2_56, r3_56, r4_56)
  r0_56:AddTimer(r2_56, r0_56.BpOnTimerEnd, false, 0, r1_56, r3_56, r1_56)
  r0_56:AddClientTimerStruct(r0_56, r1_56, r2_56, r3_56)
  if r4_56 == Const.GameModeEventServerClient then
    r0_56:AddDungeonEvent(r1_56)
  end
end
function r6_0.BpDelTimer(r0_57, r1_57, r2_57, r3_57)
  -- line: [760, 777] id: 57
  DebugPrint("BpTimerDebug: BpDelTimer", r1_57, r2_57, r3_57)
  r0_57:RemoveTimer(r1_57, r2_57)
  local r4_57 = "BpOnTimerDel_" .. r1_57
  if r0_57[r4_57] then
    r0_57[r4_57](r0_57)
  end
  if r1_57 == Const.BattleProgressTimerHandle and r0_57.BP_BattleProgressComponent then
    r0_57.BP_BattleProgressComponent:OnTimerDel()
  end
  r0_57:RemoveClientTimerStruct(r1_57)
  if r3_57 == Const.GameModeEventServerClient then
    r0_57:RemoveDungeonEvent(r1_57)
  end
end
function r6_0.BpResetTimer(r0_58, r1_58, r2_58, r3_58, r4_58)
  -- line: [780, 788] id: 58
  DebugPrint("BpTimerDebug: BpResetTimer", r1_58, r2_58, r3_58, r4_58)
  r0_58:RemoveTimer(r1_58, r3_58)
  r0_58:AddTimer(r2_58, r0_58.BpOnTimerEnd, false, 0, r1_58, r3_58, r1_58)
  r0_58:RemoveClientTimerStruct(r1_58)
  if r4_58 == Const.GameModeEventServerClient then
    r0_58:AddClientTimerStruct(r0_58, r1_58, r2_58, r3_58)
  end
end
function r6_0.BpOnTimerEnd(r0_59, r1_59)
  -- line: [790, 808] id: 59
  DebugPrint("BpTimerDebug: BpOnTimerEnd", r1_59)
  r0_59.Overridden.BpOnTimerEnd(r0_59, r1_59)
  r0_59:TriggerBPGameModeEvent("BpOnTimerEnd", r1_59)
  local r2_59 = "BpOnTimerEnd_" .. r1_59
  if r0_59[r2_59] then
    r0_59[r2_59](r0_59)
  end
  r0_59.LevelGameMode:TriggerDungeonComponentFun(r2_59)
  if r1_59 == Const.BattleProgressTimerHandle and r0_59.BP_BattleProgressComponent then
    r0_59.BP_BattleProgressComponent:OnTimerEnd()
  end
  r0_59:RemoveClientTimerStruct(r1_59)
  r0_59:RemoveDungeonEvent(r1_59)
end
function r6_0.BpGetRemainTime(r0_60, r1_60)
  -- line: [810, 816] id: 60
  local r2_60 = r2_0.GetClientTimerStructRemainTime(r1_60)
  if not r2_60 then
    return 0
  end
  return r2_60
end
function r6_0.SetClientDungeonUIState(r0_61, r1_61)
  -- line: [827, 834] id: 61
  local r2_61 = r0_61.EMGameState.DungeonUIState
  r0_61.EMGameState.DungeonUIState = r1_61
  r0_61.EMGameState:MarkDungeonUIStateAsDirtyData()
  if IsStandAlone(r0_61) and r2_61 ~= r1_61 then
    r0_61.EMGameState:OnRep_DungeonUIState()
  end
end
function r6_0.NotifyClientShowSurvivalProBuffInfo(r0_62, r1_62, r2_62, r3_62)
  -- line: [837, 844] id: 62
  r0_62.EMGameState.SurvivalProBuffInfo.PathIconList = r1_62
  r0_62.EMGameState.SurvivalProBuffInfo.TextMapList = r2_62
  r0_62.EMGameState.SurvivalProBuffInfo.Duration = r3_62
  r0_62.EMGameState:MarkSurvivalProBuffInfoAsDirtyData()
  r0_62:AddDungeonEvent("UpdateSurvivalProBuffInfo")
end
function r6_0.NotifyClientShowDungeonToast(r0_63, r1_63, r2_63, r3_63, r4_63)
  -- line: [847, 850] id: 63
  r0_63.EMGameState:MulticastClientShowDungeonToast(r1_63, r2_63, r3_63, r4_63)
  return r1_63
end
function r6_0.InitBPBornActor(r0_64)
  -- line: [853, 881] id: 64
  if r0_64.BPBornActor:Num() == 0 then
    return 
  end
  for r5_64, r6_64 in pairs(r0_64.BPBornActor:ToTable()) do
    if IsValid(r6_64) then
      if UE4.UGameplayStatics.GetGameState(r6_64) and not r6_64.ServerInitSuccess then
        if not r6_64.TryInitActorInfo then
          DebugPrint("ERROR TryInitActorInfo:", r6_64:GetName())
        else
          r6_64:TryInitActorInfo("OnInit")
        end
      elseif not UE4.UGameplayStatics.GetGameState(r6_64) then
        local r7_64 = GWorld:GetAvatar()
        if r7_64 then
          r7_64:SendToFeiShuForRegionMgr(table.concat({
            "报错文本:\n\t",
            "机关名称：",
            r6_64:GetName(),
            "\n"
          }), "BPBorn初始化报错 | 未获取到GameState")
        else
          DebugPrint("Error: InitBPBornActor, NoGameState From This :", r6_64:GetName())
        end
      end
    end
  end
  -- close: r1_64
end
function r6_0.InitCustomActor(r0_65)
  -- line: [883, 888] id: 65
  for r5_65, r6_65 in pairs(r0_65.EMGameState.ClanManagerMap) do
    r6_65:InitClan()
  end
  -- close: r1_65
end
function r6_0.InitAutoActiveStaticCreator(r0_66)
  -- line: [890, 894] id: 66
  r0_66:TriggerActiveStaticCreator(r0_66.EMGameState.AutoActiveStaticIds)
  r0_66:TriggerActiveAutoPrivateStaticCreator()
  r0_66:TriggerFlexibleActiveStaticCreator()
end
function r6_0.GetIsOpenWroldRegion(r0_67)
  -- line: [896, 898] id: 67
  return GWorld:GetWorldRegionState()
end
function r6_0.IsCanTriggerRandomStaticCreator(r0_68, r1_68, r2_68)
  -- line: [929, 943] id: 68
  if not GWorld:GetWorldRegionState() then
    return true
  end
  if IsStandAlone(r0_68) and GWorld:GetAvatar() and r0_68:GetRegionDataMgrSubSystem():IsRandomIdControlByCacheNew(r1_68, r2_68) then
    return false
  end
  return true
end
function r6_0.OnPlayersDungeonEnd(r0_69, r1_69)
  -- line: [946, 983] id: 69
  local function r2_69(r0_70)
    -- line: [947, 972] id: 70
    local r1_70 = UE4.URuntimeCommonFunctionLibrary.GetPlayerControllerByAvatarEid(GWorld.GameInstance, r0_70)
    if r1_70 then
      local r2_70 = r1_70:GetMyPawn()
      if r2_70 then
        DebugPrint("Tianyi@ On Player Leave Dungeon")
        r2_70:RawRemoveAllBuff(true)
        r2_70:HandleRemoveModPassives()
        r2_70:ClearSummons(false)
        if r0_69:IsInDungeon() then
          UE4.UPhantomFunctionLibrary.CancelAllPhantomFromOwner(r2_70, EDestroyReason.PhantomExitDungeon)
          if r0_69:GetWCSubSystem() then
            UBattleFunctionLibrary.AddBuffToTarget(r2_70, r2_70, 308, -1, nil, nil, 1)
          end
        end
        local r3_70 = r2_70:IsDead()
        if r3_70 then
          r3_70 = UE4.ETeamRecoveryState.RealDead and UE4.ETeamRecoveryState.Alive
        else
          goto label_59	-- block#7 is visited secondly
        end
        r2_70:TryLeaveDying(r3_70)
        if not r2_70:IsDead() then
          r2_70:ResetIdle()
        end
        r0_69:TriggerDungeonComponentFun("Trigger" .. r0_69.EMGameState.GameModeType .. "PlayerDungeonEnd", r2_70)
      end
    end
  end
  if r1_69 and #r1_69 ~= 0 then
    for r7_69, r8_69 in ipairs(r1_69) do
      r2_69(r8_69)
    end
    -- close: r3_69
  else
    for r7_69, r8_69 in pairs(r0_69.LevelGameMode.AvatarInfos) do
      r2_69(r7_69)
    end
    -- close: r3_69
  end
end
function r6_0.TriggerFallingCallable(r0_71, r1_71, r2_71, r3_71, r4_71, r5_71, r6_71)
  -- line: [1051, 1069] id: 71
  if not IsValid(r1_71) then
    return 
  end
  if r1_71.TriggerFallingCallable then
    r1_71:TriggerFallingCallable(r0_71, r2_71, r3_71, r4_71, r5_71, r6_71)
  else
    local r7_71 = ScreenPrint
    local r8_71 = string.format
    local r9_71 = "This OtherActor has not function called TriggerFallingCallable.  ActorName:  %s,  UnitId:  %d,  Eid:  %d,  CreatorId:  %d"
    local r10_71 = r1_71:GetName() and "nil"
    local r11_71 = r1_71.UnitId and -1
    local r12_71 = r1_71.Eid and -1
    r7_71(r8_71(r9_71, r10_71, r11_71, r12_71, r1_71.CreatorId and -1))
  end
end
function r6_0.TriggerWaterFallingCallable(r0_72, r1_72, r2_72, r3_72, r4_72)
  -- line: [1071, 1087] id: 72
  if not IsValid(r1_72) then
    return 
  end
  if r1_72.TriggerWaterFallingCallable then
    r1_72:TriggerWaterFallingCallable(r0_72, r2_72, r3_72, r4_72)
  else
    local r5_72 = ScreenPrint
    local r6_72 = string.format
    local r7_72 = "This OtherActor has not function called TriggerWaterFallingCallable.  ActorName:  %s,  UnitId:  %d,  Eid:  %d,  CreatorId:  %d"
    local r8_72 = r1_72:GetName() and "nil"
    local r9_72 = r1_72.UnitId and -1
    local r10_72 = r1_72.Eid and -1
    r5_72(r6_72(r7_72, r8_72, r9_72, r10_72, r1_72.CreatorId and -1))
  end
end
function r6_0.SpawnDefaultPawnAtTransform(r0_73, r1_73, r2_73)
  -- line: [1104, 1110] id: 73
  DebugPrint("BP_EMGameMode_C:SpawnDefaultPawnAtTransform", r2_73)
  return UE4.URuntimeCommonFunctionLibrary.SpawnDefaultPawn(r1_73, r0_73:GetDefaultPawnClassForController(r1_73), r2_73, r0_73:GetInstigator())
end
function r6_0.GetCurrentQuestId(r0_74)
  -- line: [1113, 1125] id: 74
  local r1_74 = GWorld:GetAvatar()
  local r2_74 = UE4.TArray(0)
  if not r1_74 then
    return r2_74
  end
  for r8_74, r9_74 in pairs(r1_74:GetQuestDoing()) do
    r2_74:Add(r9_74)
  end
  -- close: r4_74
  return r2_74
end
function r6_0.SwitchToQuestRole(r0_75, r1_75, r2_75)
  -- line: [1127, 1188] id: 75
  local r3_75 = GWorld:GetAvatar()
  if r3_75 == nil then
    return 
  end
  local r4_75 = UE4.UGameplayStatics.GetPlayerCharacter(r0_75, 0)
  r4_75:RecoverBanSkills()
  local r5_75 = r4_75:GetController()
  local function r6_75()
    -- line: [1136, 1144] id: 76
    r4_75:ChangeRoleEffect()
    r4_75.FXComponent:PlayEffectByIDParams(401, {
      NotAttached = true,
      scale = Const.BattleCharTagVXScaleTable[r4_75:GetBattleCharBodyType()],
    })
  end
  if r1_75 == 0 then
    local r7_75 = r3_75.CurrentChar
    r4_75:ChangeRole(r3_75.Chars[r7_75].CharId, AvatarUtils:GetDefaultBattleInfo(r3_75))
    if r2_75 then
      r6_75()
    end
    if r4_75.RangedWeapon and r4_75.RangedWeapon:GetAttr("MagazineBulletNum") == 0 then
      r4_75.RangedWeapon:SetWeaponState("NoBullet", true)
    end
    EventManager:FireEvent(EventID.OnSwitchRole, r7_75)
    return 
  end
  if not DataMgr.QuestRoleInfo[r1_75] then
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, UE.EStoryLogType.Quest, "QuestRoleId不存在", "QuestRoleId不存在" .. "\n\t在调用SwitchToQuestRole的时候，传入的参数QuestRoleId 【" .. tostring(r1_75) .. "】 在QuestRoleInfo表中不存在，请查阅QuestRoleInfo表格")
    return 
  end
  local r8_75 = AvatarUtils:GetBattleInfoByQuestRoleId(r1_75, r3_75)
  if r8_75.RoleInfo then
    r8_75.RoleInfo.AvatarQuestRoleID = r1_75
  end
  r4_75:ChangeRole(nil, r8_75)
  if r2_75 then
    r6_75()
  end
  if r4_75.RangedWeapon and r4_75.RangedWeapon:GetAttr("MagazineBulletNum") == 0 then
    r4_75.RangedWeapon:SetWeaponState("NoBullet", true)
  end
  EventManager:FireEvent(EventID.OnSwitchRole)
end
function r6_0.SetNpcPatrol(r0_77, r1_77, r2_77)
  -- line: [1190, 1206] id: 77
  local r3_77 = r0_77.EMGameState.NpcCharacterMap:Find(r1_77)
  if not IsValid(r3_77) then
    print(_G.LogTag, "NpcMap no-exist this Npc", r1_77)
    return 
  end
  r3_77.PatrolId = r2_77
end
function r6_0.TriggerMechanism(r0_78, r1_78, r2_78, r3_78, r4_78)
  -- line: [1208, 1267] id: 78
  if r3_78 == true and not r0_78:IsSubGameMode() then
    r0_78.EMGameState:ShowDungeonError("TriggerMechanism PrivateEnable is true but IsSubGameMode:" .. r0_78:GetName(), Const.DungeonErrorType.GameMode, Const.DungeonErrorTitle.Other)
    return 
  end
  local r5_78 = r0_78.EMGameState:GetStaticCreatorInfo(r1_78, r3_78, r0_78.LevelName)
  if not IsValid(r5_78) then
    return 
  end
  local r6_78 = true
  if r5_78.ChildEids:Length() >= 2 then
    DebugPrint("Warning: 这个StaticCreator刷新了多个机关", r5_78.ChildEids:Length())
  end
  local r7_78 = false
  if r5_78.ChildEids:Length() > 0 then
    for r11_78 = 1, r5_78.ChildEids:Length(), 1 do
      local r12_78 = Battle(r0_78):GetEntity(r5_78.ChildEids:GetRef(r11_78))
      if IsValid(r12_78) then
        print(_G.LogTag, "LXZ TriggerMechanism444", r12_78:GetName())
        if r12_78:IsCombatItemBase() then
          r7_78 = true
          r12_78:ChangeState("Manual", 0, r2_78)
          if r12_78.RegionDataType == ERegionDataType.RDT_CommonQuestData then
            r12_78.QuestId = r4_78
          end
        end
      else
        local r14_78 = DataMgr.MechanismState[r0_78.EMGameState.MechanismStateIdMap:Find(r1_78)]
        if r14_78 then
          for r19_78, r20_78 in pairs(r14_78.StateEvent) do
            if r20_78.NextStateId == r2_78 and r20_78.TypeNextState.Type == "Manual" then
              r7_78 = true
              break
            end
          end
          -- close: r15_78
        end
      end
    end
  elseif r5_78.CreatedWorldRegionEid ~= "" then
    local r8_78, r9_78 = r0_78:GetRegionDataMgrSubSystem():TryGetLuaDataIndex(r5_78.CreatedWorldRegionEid)
    if r9_78 then
      local r10_78 = r0_78:GetRegionDataMgrSubSystem():GetStateIdByWorldRegionEid(r8_78)
      if r10_78 == -1 then
        r10_78 = DataMgr.Mechanism[r5_78.UnitId].FirstStateId
      end
      local r11_78 = DataMgr.MechanismState[r10_78]
      if r11_78 then
        for r16_78, r17_78 in pairs(r11_78.StateEvent) do
          if r17_78.NextStateId == r2_78 and r17_78.TypeNextState.Type == "Manual" then
            r7_78 = true
          end
        end
        -- close: r12_78
      end
    end
  end
  if r5_78.CreatedWorldRegionEid ~= "" and r7_78 then
    r0_78:GetRegionDataMgrSubSystem():ChangeState(r5_78.CreatedWorldRegionEid, r2_78)
  end
end
function r6_0.TriggerMechanismArray(r0_79, r1_79, r2_79, r3_79, r4_79)
  -- line: [1269, 1273] id: 79
  for r9_79, r10_79 in pairs(r1_79) do
    r0_79:TriggerMechanism(r10_79, r2_79, r3_79, r4_79)
  end
  -- close: r5_79
end
function r6_0.TriggerPetStateChange(r0_80, r1_80, r2_80, r3_80)
  -- line: [1275, 1292] id: 80
  if r3_80 == true and not r0_80:IsSubGameMode() then
    r0_80.EMGameState:ShowDungeonError("TriggerPetStateChange PrivateEnable is true but IsSubGameMode: " .. r0_80:GetName(), Const.DungeonErrorType.Pet, Const.DungeonErrorTitle.Config)
    return 
  end
  local r4_80 = r0_80.EMGameState:GetStaticCreatorInfo(r1_80, r3_80, r0_80.LevelName)
  if not IsValid(r4_80) then
    r0_80.EMGameState:ShowDungeonError("TriggerPetStateChange Can Not Find StaticCreator: " .. r1_80 .. " PrivateEnable: " .. r3_80, Const.DungeonErrorType.Pet, Const.DungeonErrorTitle.FindObject)
    return 
  end
  for r8_80 = 1, r4_80.ChildEids:Length(), 1 do
    local r9_80 = Battle(r0_80):GetEntity(r4_80.ChildEids:GetRef(r8_80))
    if IsValid(r9_80) and r9_80:IsPetNpc() then
      r9_80:SetInteractiveState(r2_80)
    end
  end
end
function r6_0.PetPlayFailureMontage(r0_81, r1_81, r2_81)
  -- line: [1294, 1307] id: 81
  r0_81.LevelGameMode:AddDungeonEvent("PetPlayFailureMontage")
end
function r6_0.TriggerPetMechanismState(r0_82, r1_82, r2_82, r3_82)
  -- line: [1309, 1318] id: 82
  if r0_82:IsSubGameMode() then
    r0_82.EMGameState:ShowDungeonError("在子GameMode使用了TriggerPetMechanismState: " .. r0_82:GetName(), Const.DungeonErrorType.Pet, Const.DungeonErrorTitle.Config)
    return 
  end
  if not IsValid(r0_82.RandomPetCreator) then
    r0_82.EMGameState:ShowDungeonError("TriggerPetMechanismState RandomPetCreator无效: " .. r0_82:GetName(), Const.DungeonErrorType.Pet, Const.DungeonErrorTitle.Config)
  end
  r0_82:TriggerMechanism(r0_82.RandomPetCreator.StaticCreatorId, r1_82, r2_82, r3_82)
end
function r6_0.TriggerPetStateChangeMain(r0_83, r1_83, r2_83)
  -- line: [1320, 1334] id: 83
  if r0_83:IsSubGameMode() then
    r0_83.EMGameState:ShowDungeonError("在子GameMode使用了TriggerPetStateChangeMain: " .. r0_83:GetName(), Const.DungeonErrorType.Pet, Const.DungeonErrorTitle.Config)
    return 
  end
  if not IsValid(r0_83.RandomPetCreator) then
    r0_83.EMGameState:ShowDungeonError("TriggerPetStateChangeMain RandomPetCreator无效: " .. r0_83:GetName(), Const.DungeonErrorType.Pet, Const.DungeonErrorTitle.Config)
  end
  for r6_83 = 1, r0_83.RandomPetCreator.ChildEids:Length(), 1 do
    local r7_83 = Battle(r0_83):GetEntity(r0_83.RandomPetCreator.ChildEids:GetRef(r6_83))
    if IsValid(r7_83) and r7_83:IsPetNpc() then
      r7_83:SetInteractiveState(r1_83)
    end
  end
end
function r6_0.PetPlayFailureMontageMain(r0_84, r1_84)
  -- line: [1336, 1338] id: 84
  r0_84.LevelGameMode:AddDungeonEvent("PetPlayFailureMontage")
end
function r6_0.OnTriggerMechanismManualItem(r0_85, r1_85, r2_85, r3_85, r4_85)
  -- line: [1340, 1365] id: 85
  if r0_85:IsSubGameMode() and not r0_85:IsInRegion() then
    print(_G.LogTag, "LXZ OnTriggerMechanismManualItem", r2_85)
    return 
  end
  for r8_85 = 1, r1_85:Length(), 1 do
    local r9_85 = r0_85.EMGameState.ManualActiveCombat:Find(r1_85[r8_85])
    if not IsValid(r9_85) then
      GWorld.logger.error("哦我的上帝，这里有一个ManualItemId" .. r1_85[r8_85] .. "找不到它亲爱的机关实体，亲爱的策划能改一下gamemode配置吗")
    end
    if IsValid(r9_85) then
      if r9_85.ChangeToState then
        r9_85:ChangeToState(r3_85)
      end
      if r2_85 ~= 0 then
        r9_85:ChangeState("Manual", 0, r2_85)
      end
      if r9_85.RegionDataType == ERegionDataType.RDT_QuestCommonData then
        r9_85.QuestId = r4_85
      end
    end
  end
end
function r6_0.OnTriggerMechanismMonsterNest(r0_86, r1_86, r2_86, r3_86, r4_86, r5_86, r6_86, r7_86)
  -- line: [1367, 1385] id: 86
  if r0_86:IsSubGameMode() then
    return 
  end
  for r12_86, r13_86 in pairs(r1_86) do
    local r14_86 = r0_86.EMGameState.ManualActiveCombat:Find(r13_86)
    if not IsValid(r14_86) then
      GWorld.logger.error("哦我的上帝，这里有一个ManualItemId" .. r1_86 .. "找不到它亲爱的机关实体，亲爱的策划能改一下gamemode配置吗")
    end
    r14_86.MonsterNum = r2_86
    r14_86.MonsterSpawnInterval = r3_86
    r14_86.MonsterUnitId = r4_86
    r14_86.MonsterUnitType = r5_86
    r14_86.MonsterPresetTarget = r6_86
    r14_86.MonsterPresetTargetId = r7_86
    DebugPrint("thy      OnTriggerMechanismMonsterNest")
  end
  -- close: r8_86
end
function r6_0.GetHLODDistance(r0_87, r1_87)
  -- line: [1387, 1400] id: 87
  if not Const.bOverrideHLODDistance then
    return -1
  end
  local r2_87 = 5000
  local r3_87 = UE4.UUIFunctionLibrary.GetDevicePlatformName(r0_87)
  if r3_87 == "Android" then
    r2_87 = Const.HLODDistanceAndroid[r1_87]
    if r2_87 then
      r2_87 = r2_87
    end
  else
    r2_87 = Const.HLODDistanceDefault[r1_87]
    if r2_87 then
      r2_87 = r2_87
    end
  end
  DebugPrint("BP_EMGameMode_C:GetHLODDistance PlatformName: ", r3_87, "Distance: ", r2_87)
  return r2_87
end
function r6_0.OnTriggerDestroyMonsterInMonsterNest(r0_88, r1_88)
  -- line: [1402, 1415] id: 88
  if r0_88:IsSubGameMode() then
    return 
  end
  for r5_88 = 1, r1_88:Length(), 1 do
    local r6_88 = r0_88.EMGameState.ManualActiveCombat:Find(r1_88[r5_88])
    if not IsValid(r6_88) or not r6_88:IsCombatItemBase("MonsterNest") then
      GWorld.logger.error("哦我的上帝，这里有一个ManualItemId" .. r1_88[r5_88] .. "找不到它亲爱的MonsterNest，亲爱的策划能改一下gamemode配置吗")
    end
    if IsValid(r6_88) then
      r6_88:DestroyAllMonster()
    end
  end
end
function r6_0.InitBPVars(r0_89, r1_89)
  -- line: [1417, 1436] id: 89
  if GWorld.GameInstance:IsInTempScene() then
    DebugPrint("BP_EMGameMode_C 结算场景 不初始化策划配表赋值蓝图变量")
    return 
  end
  local r2_89 = r1_89.BPOverrideVars
  if not r2_89 then
    return 
  end
  for r7_89, r8_89 in pairs(r2_89) do
    if r0_89[r7_89] ~= nil then
      r0_89[r7_89] = r8_89
      DebugPrint("BP_EMGameMode_C 初始化策划配表赋值蓝图变量: ", r7_89, r8_89)
    else
      ScreenPrint("BP_EMGameMode_C 初始化策划配表赋值蓝图变量: 不存在的变量 " .. r7_89)
    end
  end
  -- close: r3_89
end
function r6_0.InitEmergencyMonster(r0_90)
  -- line: [1438, 1456] id: 90
  r0_90.NeedTreasureMonster = false
  r0_90.TreasureMonsterCreated = false
  r0_90.NeedButcherMonster = false
  r0_90.ButcherMonsterCreated = false
  r0_90.NeedPetMonster = false
  r0_90.PetMonsterCreated = false
  r0_90.TreasureMonsterSpawnInterval = 3
  r0_90.ButcherMonsterSpawnInterval = 5
  r0_90.EmergencyMonsterSpawnLoc = {
    RandomTime = 5,
    MaxDistance = 1000,
    MaxZDistance = 500,
  }
end
function r6_0.GetCreateEmergencyMonsterInterval(r0_91, r1_91)
  -- line: [1458, 1460] id: 91
  return r0_91[r1_91 .. "MonsterSpawnInterval"]
end
function r6_0.GetNeedCreateEmergencyMonster(r0_92, r1_92)
  -- line: [1462, 1464] id: 92
  local r2_92 = r0_92["Need" .. r1_92 .. "Monster"]
  if r2_92 == true then
    r2_92 = r0_92[r1_92 .. "MonsterCreated"] == false
  else
    goto label_13	-- block#2 is visited secondly
  end
  return r2_92
end
function r6_0.InitCreateEmergencyMonsterProb(r0_93, r1_93, r2_93, r3_93)
  -- line: [1466, 1481] id: 93
  if r2_93 == nil then
    DebugPrint("InitCreateEmergencyMonsterProb: GameMode Componet 不存在！")
    return 
  end
  if r3_93 == nil then
    DebugPrint("InitCreateEmergencyMonsterProb: DungeonInfo 不存在！")
    return 
  end
  local r4_93 = r3_93[r1_93 .. "MonsterSpawnProbability"]
  if r4_93 == nil then
    DebugPrint("InitCreateEmergencyMonsterProb: " .. r1_93 .. "怪信息不存在！")
    return 
  end
  r2_93["Current" .. r1_93 .. "MonsterProb"] = r4_93[1]
end
function r6_0.CreateEmergencyMonsterEachWave(r0_94, r1_94, r2_94, r3_94)
  -- line: [1483, 1514] id: 94
  if r2_94 == nil then
    return 
  end
  if r3_94 == nil then
    return 
  end
  local r4_94 = r3_94[r1_94 .. "MonsterSpawnProbability"]
  if r4_94 == nil then
    return 
  end
  local r5_94 = r3_94[r1_94 .. "MonsterSpawnMinWave"]
  if r5_94 == nil then
    return 
  end
  if r0_94:GetNeedCreateEmergencyMonster(r1_94) == false then
    return 
  end
  local r6_94 = r2_94:GetWaveIndex()
  if r6_94 and r6_94 < r5_94 then
    return 
  end
  local r7_94 = "Current" .. r1_94 .. "MonsterProb"
  if r2_94[r7_94] == nil then
    return 
  end
  if r2_94[r7_94] < math.random() then
    r2_94[r7_94] = r2_94[r7_94] + r4_94[2]
    return 
  end
  r0_94:TryCreateEmergencyMonster(r1_94)
end
function r6_0.TryCreateEmergencyMonster(r0_95, r1_95)
  -- line: [1516, 1572] id: 95
  local r2_95 = DataMgr[r0_95.EMGameState.GameModeType]
  if r2_95 == nil then
    return 
  end
  local r3_95 = r2_95[r0_95.DungeonId]
  if r3_95 == nil then
    return 
  end
  local r4_95 = r3_95[r1_95 .. "MonsterId"]
  if r4_95 == nil then
    return 
  end
  local r5_95 = r0_95.LevelGameMode:GetLevelLoader()
  if r5_95 == nil then
    return 
  end
  if not IsValid(r0_95:GetOneRandomPlayer()) then
    DebugPrint("TryCreateEmergencyMonster, 玩家不存在, 本次不创建！")
    return 
  end
  local r7_95 = r0_95:GetOneRandomPlayer().CurrentLocation
  local r8_95 = UKismetMathLibrary.Vector_Zero()
  local r9_95 = false
  for r13_95 = 1, r0_95.EmergencyMonsterSpawnLoc.RandomTime, 1 do
    if UNavigationSystemV1.K2_GetRandomLocationInNavigableRadius(r0_95, r7_95, r8_95, r0_95.EmergencyMonsterSpawnLoc.MaxDistance) == true and math.abs(r7_95.Z - r8_95.Z) <= r0_95.EmergencyMonsterSpawnLoc.MaxZDistance and r5_95:GetLevelIdByLocation(r7_95) == r5_95:GetLevelIdByLocation(r8_95) and UNavigationFunctionLibrary.CheckTwoPosHasPath(r7_95, r8_95, r0_95) == EPathConnectType.HasPath then
      r9_95 = true
      break
    end
  end
  if r9_95 == false then
    r8_95 = r0_95:GetMonsterCustomLoc(nil)
  end
  if UKismetMathLibrary.EqualEqual_VectorVector(r8_95, UKismetMathLibrary.Vector_Zero(), 0.001) == false then
    local r10_95 = AEventMgr.CreateUnitContext()
    r10_95.UnitType = "Monster"
    r10_95.UnitId = r4_95
    r10_95.Loc = r8_95
    r10_95.IntParams:Add("Level", r0_95:GetFixedGamemodeLevel())
    r10_95.MonsterSpawn = r0_95.LevelGameMode.FixedMonsterSpawn
    r0_95.EMGameState.EventMgr:CreateUnitNew(r10_95, false)
    r0_95[r1_95 .. "MonsterCreated"] = true
  end
end
function r6_0.OnRandomCreateSpawn(r0_96, r1_96, r2_96)
  -- line: [1574, 1575] id: 96
end
function r6_0.ShowMessage(r0_97, r1_97, r2_97)
  -- line: [1577, 1596] id: 97
  local r4_97 = UE4.UGameplayStatics.GetGameInstance(r0_97):GetGameUIManager()
  if r4_97 == nil then
    return 
  end
  if r1_97 ~= nil and r2_97 ~= nil then
    local r5_97 = r4_97:GetUIObj("GuideTextFloat")
    if r5_97 == nil then
      r5_97 = r4_97:LoadUI(UIConst.GUIDETEXTFLOAT, "GuideTextFloat", UIConst.ZORDER_FOR_COMMON_TIP)
    end
    r5_97:AddGuideMessage(r1_97, r2_97)
  end
end
function r6_0.HideMessage(r0_98, r1_98)
  -- line: [1598, 1606] id: 98
  local r3_98 = UE4.UGameplayStatics.GetGameInstance(r0_98):GetGameUIManager()
  local r4_98 = r3_98:GetUIObj("GuideTextFloat")
  if r3_98 == nil or r4_98 == nil then
    return 
  end
  r4_98:DeleteGuideMessage(r1_98)
end
function r6_0.GetItemType(r0_99, r1_99)
  -- line: [1608, 1614] id: 99
  if not DataMgr.Mechanism[r1_99] then
    return ""
  end
  return DataMgr.Mechanism[r1_99].UnitRealType
end
function r6_0.UpdateDungeonProgress(r0_100)
  -- line: [1616, 1646] id: 100
  r0_100.EMGameState:SetDungeonProgress(r0_100.EMGameState.DungeonProgress + 1)
  DebugPrint("DungeonProgress 副本轮次 +1，当前轮次:", r0_100.EMGameState.DungeonProgress)
  local r1_100 = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if r1_100 and r1_100.BattleAchievement then
    r1_100.BattleAchievement:UpdateTopProcessedValue()
  end
  r0_100:TriggerUploadDungeonAchievement()
  if IsDedicatedServer(r0_100) then
    if GWorld.bDebugServer then
      return 
    end
    local r2_100 = GWorld:GetDSEntity()
    if r2_100 then
      r2_100:UpdateDungeonProgress()
    end
  else
    local r2_100 = GWorld:GetAvatar()
    if r2_100 then
      r2_100:UpdateDungeonProgress()
    end
  end
end
function r6_0.ExecuteLogicBetweenRounds(r0_101)
  -- line: [1648, 1656] id: 101
  if r0_101:IsWalnutDungeon() then
    r0_101:TriggerShowWalnutReward()
  else
    r0_101:ExecuteLogicStartDungeonVote()
  end
end
function r6_0.ExecuteLogicStartDungeonVote(r0_102)
  -- line: [1661, 1668] id: 102
  r0_102:UpdateDungeonProgress()
  if r0_102:CheckDungeonProgressIsMaxRound() then
    return 
  end
  r0_102:TriggerDungeonComponentFun("TriggerDungeonVoteBegin")
  r0_102:SetGamePaused("GameModeState", true)
end
function r6_0.ExecuteNextStepOfDungeonVote(r0_103)
  -- line: [1670, 1677] id: 103
  if r0_103:IsTicketDungeon() then
    r0_103:TriggerShowTicket()
  else
    r0_103:ExecuteNextStepOfTicket()
  end
end
function r6_0.ExecuteNextStepOfTicket(r0_104)
  -- line: [1679, 1690] id: 104
  r0_104.EMGameState.IsInSelectTicket = false
  r0_104.EMGameState.NextTicketPlayer:Clear()
  UE.UMapSyncHelper.SyncMap(r0_104.EMGameState, "NextTicketPlayer")
  if r0_104:IsWalnutDungeon() then
    r0_104:TriggerShowNextWalnut()
  else
    r0_104:TriggerActiveGameModeState(Const.StateBattleProgress)
  end
end
function r6_0.BpOnTimerEnd_OnDungeonVoteBegin(r0_105)
  -- line: [1692, 1694] id: 105
  r0_105.EMGameState:DealDungeonVoteResult()
end
function r6_0.BpOnTimerEnd_SelectTicket(r0_106)
  -- line: [1696, 1698] id: 106
  r0_106.EMGameState:DealDungeonTicketResult()
end
function r6_0.IsEndlessDungeon(r0_107)
  -- line: [1700, 1708] id: 107
  if r0_107.IsDungeonTypeEndless == nil then
    local r1_107 = DataMgr.Dungeon[r0_107.DungeonId]
    if r1_107 then
      r0_107.IsDungeonTypeEndless = r1_107.DungeonWinMode == r0_0.DungeonWinMode.Endless
    end
  end
  return r0_107.IsDungeonTypeEndless
end
function r6_0.DungeonFinish_OnPlayerRealDead(r0_108, r1_108)
  -- line: [1720, 1737] id: 108
  local r2_108 = GWorld:GetAvatar()
  if r2_108 and r2_108:IsInRougeLike() then
    DebugPrint("EMGameMode:DungeonFinish_OnPlayerRealDead RougeLike")
    r0_108:FinishRougeLike(false, r1_108)
  elseif r0_108:IsAbyssDungeon() then
    local r3_108 = r0_108:TriggerDungeonComponentFun("IsReEnteringAbyss")
    DebugPrint("EMGameMode:DungeonFinish_OnPlayerRealDead Abyss IsReEntering", r3_108)
    if r3_108 then
      return 
    end
    r0_108:TriggerPlayerFailed(r1_108)
  else
    DebugPrint("EMGameMode:DungeonFinish_OnPlayerRealDead Default")
    r0_108:TriggerPlayerFailed(r1_108)
  end
end
function r6_0.IsDungeonInSettlement(r0_109)
  -- line: [1739, 1754] id: 109
  if not r0_109.EMGameState:CheckGameModeStateEnable() then
    DebugPrint("BP_EMGameMode_C:副本状态不正确 多次触发副本结算")
    return true
  end
  local r1_109 = GWorld:GetAvatar()
  if r1_109 and r1_109:IsInHardBoss() and r0_109.LevelGameMode.IsInHardBossSettlement then
    DebugPrint("BP_EMGameMode_C:正处于mycs 多次触发副本结算")
    return true
  end
  return false
end
function r6_0.TriggerDungeonWin(r0_110)
  -- line: [1757, 1764] id: 110
  DebugPrint("BP_EMGameMode_C:TriggerDungeonWin 副本胜利")
  if r0_110:IsDungeonInSettlement() then
    return 
  end
  r0_110.LevelGameMode:TriggerDungeFinish(true)
end
function r6_0.TriggerDungeonFailed(r0_111)
  -- line: [1767, 1774] id: 111
  DebugPrint("BP_EMGameMode_C:TriggerDungeonFailed 副本失败")
  if r0_111:IsDungeonInSettlement() then
    return 
  end
  r0_111.LevelGameMode:TriggerDungeFinish(false)
end
function r6_0.TriggerExitDungeon(r0_112, r1_112)
  -- line: [1777, 1784] id: 112
  DebugPrint("BP_EMGameMode_C:TriggerExitDungeon: Exit Battle + HardBoss", r1_112)
  if r0_112:IsDungeonInSettlement() then
    return 
  end
  r0_112.LevelGameMode:TriggerDungeFinish(r1_112)
end
function r6_0.TriggerPlayerWin(r0_113, r1_113, r2_113)
  -- line: [1788, 1801] id: 113
  DebugPrint("BP_EMGameMode_C:TriggerPlayerWin 玩家成功 撤离")
  if r0_113:IsDungeonInSettlement() then
    return 
  end
  if IsStandAlone(r0_113) then
    r0_113:TriggerBattleAchievementUploadOnDungeonEnd(true)
    r0_113:TriggerDungeonOnEnd(true)
  end
  r0_113:TriggerUploadDungeonAchievement(r2_113)
  r0_113.LevelGameMode:TriggerPlayerFinish(true, r1_113)
end
function r6_0.TriggerPlayerFailed(r0_114, r1_114)
  -- line: [1804, 1815] id: 114
  DebugPrint("BP_EMGameMode_C:TriggerPlayerFailed 玩家失败 撤离")
  if r0_114:IsDungeonInSettlement() then
    return 
  end
  if IsStandAlone(r0_114) then
    r0_114:TriggerBattleAchievementUploadOnDungeonEnd(false)
    r0_114:TriggerDungeonOnEnd(false)
  end
  r0_114.LevelGameMode:TriggerPlayerFinish(false, r1_114)
end
function r6_0.ForceFinishPlayerByFailed(r0_115, r1_115)
  -- line: [1820, 1823] id: 115
  DebugPrint("BP_EMGameMode_C:ForceFinishPlayerByFailed 强制玩家以失败结算")
  r0_115.LevelGameMode:TriggerPlayerFinish(false, r1_115)
end
function r6_0.TriggerDungeFinish(r0_116, r1_116)
  -- line: [1827, 1838] id: 116
  GWorld:DSBLog("Info", "TriggerDungeFinish IsWin:" .. tostring(r1_116), "GameMode")
  r0_116:TriggerDungeonOnEnd(r1_116)
  if r1_116 and r0_116:IsWalnutDungeon() and not r0_116:IsEndlessDungeon() then
    r0_116:ExecuteWalutLogicOnEnd()
  else
    r0_116:TriggerRealDungeFinish(r1_116)
  end
end
function r6_0.TriggerRealDungeFinish(r0_117, r1_117)
  -- line: [1840, 1858] id: 117
  local r2_117 = DataMgr.Dungeon[r0_117.DungeonId]
  if r1_117 then
    if r2_117 and r2_117.DungeonWinMode == r0_0.DungeonWinMode.Single then
      r0_117:UpdateDungeonProgress()
    end
    if r2_117 and r2_117.DungeonWinMode == r0_0.DungeonWinMode.Disable then
      local r3_117 = r0_117:GetDungeonComponent().RewardLevel
      if r3_117 then
        for r7_117 = 1, r3_117, 1 do
          r0_117:UpdateDungeonProgress()
        end
      end
    end
    r0_117:TriggerUploadDungeonAchievement()
  end
  r0_117:TriggerBattleAchievementUploadOnDungeonEnd(r1_117)
  r0_117:TriggerPlayerFinish(r1_117)
end
function r6_0.TriggerPlayerFinish(r0_118, r1_118, r2_118)
  -- line: [1862, 1894] id: 118
  GWorld:DSBLog("Info", "TriggerPlayerFinish IsWin:" .. tostring(r1_118), "GameMode")
  DebugPrint("TriggerPlayerFinish 玩家结算，结算状态：", r1_118)
  if IsStandAlone(r0_118) or r5_0.IsListenServer(r0_118) then
    local r3_118 = GWorld:GetAvatar()
    if r3_118 then
      print(_G.LogTag, "CollectAlertBaseInfo Server TriggerPlayerFinish", r1_118, r0_118.DungeonId)
      r0_118:TriggerPlayerFinishDungeon(r1_118)
      r3_118:BattleFinish(r1_118)
    end
    r0_118:NotifyClientGameEnd(r1_118, r2_118)
    r0_118:OnPlayersDungeonEnd(r2_118)
  elseif IsDedicatedServer(r0_118) then
    print(_G.LogTag, "Server TriggerPlayerFinish", r1_118)
    if GWorld.bDebugServer then
      return 
    end
    local r3_118 = GWorld:GetDSEntity()
    if r3_118 then
      r3_118:BattleFinish(r1_118, r2_118)
    end
  end
end
function r6_0.SendTimeDistCheatalert(r0_119, r1_119, r2_119, r3_119, r4_119, r5_119, r6_119, r7_119)
  -- line: [1895, 1934] id: 119
  local r8_119 = "检测到非法信息:  "
  local r9_119 = r0_119:CollectAlertBaseInfo(r1_119)
  if r9_119.DungeonId then
    r8_119 = r8_119 .. "副本ID: " .. r9_119.DungeonId .. "  "
  end
  if r9_119.DungeonLevel then
    r8_119 = r8_119 .. "副本等级: " .. r9_119.DungeonLevel .. "  "
  end
  if r9_119.CharLevel then
    r8_119 = r8_119 .. "角色等级: " .. r9_119.CharLevel .. "  "
  end
  if r4_119 then
    r8_119 = r8_119 .. "MonitorType: " .. r4_119 .. "  "
  end
  if r5_119 then
    r8_119 = r8_119 .. "SubID: " .. r5_119 .. "  "
  end
  if r2_119 then
    r8_119 = r8_119 .. "副本耗时: " .. r2_119 .. "  "
  end
  if r7_119 then
    r8_119 = r8_119 .. "时间阈值: " .. r7_119 .. "  "
  end
  if r3_119 then
    r8_119 = r8_119 .. "主控角色移动距离: " .. r3_119 .. "  "
  end
  if r6_119 then
    r8_119 = r8_119 .. "距离阈值: " .. r6_119 .. "  "
  end
  local r10_119 = GWorld:GetAvatar()
  if not r10_119 then
    return 
  end
  print(_G.LogTag, "SendTimeDistCheatalert", r8_119)
  r10_119:SendToFeishuForCombatMonitor(r8_119)
end
function r6_0.CollectAlertBaseInfo(r0_120, r1_120)
  -- line: [1935, 1951] id: 120
  local r2_120 = {}
  if not r0_120.LevelGameMode then
    print(_G.LogTag, "CollectAlertBaseInfo LevelGameMode is nil")
    return r2_120
  end
  r2_120.DungeonId = r0_120.LevelGameMode.DungeonId
  local r3_120 = DataMgr.Dungeon[r2_120.DungeonId]
  if not r3_120 then
    print(_G.LogTag, "CollectAlertBaseInfo DungeonInfo is nil", r2_120.DungeonId, r0_120.DungeonId)
    return r2_120
  end
  r2_120.DungeonLevel = r3_120.DungeonLevel and 1
  r2_120.CharLevel = r1_120:GetAttr("Level") and 0
  print(_G.LogTag, "CollectAlertBaseInfo", r2_120.DungeonId, r2_120.DungeonLevel, r2_120.CharLevel, r1_120:GetAttr("Level"))
  return r2_120
end
function r6_0.NotifyClientFightAttributeData(r0_121, r1_121)
  -- line: [1954, 1984] id: 121
  if not IsDedicatedServer(r0_121) then
    return 
  end
  local r2_121 = r1_121 and r1_121:GetFightAttributeSet()
  if not r2_121 then
    return 
  end
  for r6_121 = 1, r0_121:GetPlayerNum(), 1 do
    local r9_121 = UE4.UGameplayStatics.GetPlayerController(r0_121, r6_121 + -1):GetMyPawn()
    if r9_121 and r9_121.Eid ~= r1_121.Eid then
      local r10_121 = FTeammateAttrInfo()
      r10_121.TeammateEid = r9_121.Eid
      r10_121.FinalDamage = r9_121:GetFinalDamage()
      r10_121.TotalKillCount = r9_121:GetTotalKillCount()
      r10_121.TakedDamage = r9_121:GetTakedDamage()
      r10_121.GiveHealing = r9_121:GetGiveHealing()
      r10_121.MaxDamage = r9_121:GetMaxDamage()
      r10_121.BreakableItemCount = r9_121:GetBreakableItemCount()
      r10_121.MaxComboCount = r9_121:GetMaxComboCount()
      local r11_121 = r9_121:GetPhantomAttrInfos()
      if r11_121:Num() > 0 then
        r10_121.PhantomAttrInfo = r11_121[1]
      end
      r2_121:AddTeammateDamageInfos(r10_121)
    end
  end
  r2_121:RefreshFightAttributeData()
end
function r6_0.NotifyClientGameEnd(r0_122, r1_122, r2_122)
  -- line: [1987, 2039] id: 122
  if not r2_122 or #r2_122 == 0 then
    for r6_122 = 1, r0_122:GetPlayerNum(), 1 do
      local r7_122 = r6_122 + -1
      local r8_122 = UE4.UGameplayStatics.GetPlayerController(r0_122, r7_122)
      if not r8_122 then
        error("Controller is Not Exist")
      end
      local r9_122 = GWorld:GetAvatar()
      if r1_122 and (not r9_122 or not r9_122:IsInHardBoss()) then
        r0_122:UpdatePlayerCharacterEndPointInfo(r7_122, r8_122)
        DebugPrint("StartAndEndPoint AllSuccess UpdatePlayerCharacterEndPointInfo")
      end
      local r10_122 = r8_122:GetMyPawn()
      if IsStandAlone(r0_122) then
        DebugPrint("StartAndEndPoint AllSuccess NotifyClientGameEnd_Lua")
        r8_122:NotifyClientGameEnd_Lua(r1_122, r0_122:GetScenePlayersInfo(r10_122))
      else
        DebugPrint("StartAndEndPoint AllSuccess NotifyClientGameEnd")
        r0_122:NotifyClientFightAttributeData(r10_122)
        r8_122:NotifyClientGameEnd(r1_122, r0_122:GetScenePlayersInfo(r10_122))
      end
    end
  else
    local function r3_122(r0_123)
      -- line: [2016, 2033] id: 123
      local r1_123 = UE4.URuntimeCommonFunctionLibrary.GetPlayerControllerByAvatarEid(r0_122, r0_123)
      if not r1_123 then
        DebugPrint("Controller is Not Exist")
        return 
      end
      if r1_122 then
        r0_122:UpdatePlayerCharacterEndPointInfo(UE4.URuntimeCommonFunctionLibrary.GetPlayerControllerIndex(r0_122, r1_123), r1_123)
        DebugPrint("StartAndEndPoint PartSuccess UpdatePlayerCharacterEndPointInfo")
      end
      DebugPrint("StartAndEndPoint PartSuccess NotifyClientGameEnd")
      local r2_123 = r1_123:GetMyPawn()
      r0_122:NotifyClientFightAttributeData(r2_123)
      r1_123:NotifyClientGameEnd(r1_122, r0_122:GetScenePlayersInfo(r2_123))
    end
    for r8_122, r9_122 in ipairs(r2_122) do
      r3_122(r9_122)
    end
    -- close: r4_122
  end
end
function r6_0.SimplifyInfoForInit(r0_124, r1_124)
  -- line: [2041, 2048] id: 124
  if r1_124 == nil then
    DebugPrint("Error SimplifyInfoForInit InfoForInit is nil")
    return r1_124
  end
  r1_124.FromOtherWorld = true
  return r1_124
end
function r6_0.GetScenePlayersInfo(r0_125, r1_125)
  -- line: [2051, 2117] id: 125
  local r2_125 = {}
  if r0_125.EMGameState.GameModeType == "Party" then
    local r3_125 = r0_125.EMGameState.PartyPlayerOrdinal
    for r7_125 = 1, r3_125:Length(), 1 do
      local r8_125 = r3_125[r7_125]
      local r9_125 = Battle(r0_125):GetEntity(r8_125)
      if r9_125 then
        local r10_125 = r9_125:IsPhantom()
        r2_125[#r2_125 + 1] = r0_125:SimplifyInfoForInit(r9_125.InfoForInit)
        r2_125[#r2_125].IsDungeonEnd = true
        r2_125[#r2_125].IsPhantom = r10_125
        local r11_125 = r9_125:GetCurrentWeapon()
        if r11_125 then
          r2_125[#r2_125].CurrentWeaponType = r11_125:GetWeaponType()
          r2_125[#r2_125].CurrentWeaponMeleeOrRanged = r11_125:GetWeaponMeleeOrRanged()
        end
        if r1_125.Eid == r8_125 then
          r2_125[#r2_125].IsMainPlayer = true
        else
          r2_125[#r2_125].IsMainPlayer = false
          r2_125[#r2_125].IsSettlementOtherRole = true
        end
      end
    end
  else
    r2_125[1] = r0_125:SimplifyInfoForInit(r1_125.InfoForInit)
    r2_125[1].IsDungeonEnd = true
    r2_125[1].IsMainPlayer = true
    r2_125[1].IsDead = r1_125:IsDead()
    local r3_125 = r1_125:GetCurrentWeapon()
    if r3_125 then
      r2_125[1].CurrentWeaponType = r3_125:GetWeaponType()
      r2_125[1].CurrentWeaponMeleeOrRanged = r3_125:GetWeaponMeleeOrRanged()
    end
    print(_G.LogTag, "GetScenePlayersInfo", r1_125:GetAllTeammates():Length())
    for r8_125, r9_125 in pairs(r1_125:GetAllTeammates()) do
      if r9_125 ~= r1_125 then
        local r10_125 = r9_125.InfoForInit
        if r10_125 == nil then
          r10_125 = r9_125.CreateUnitContextCopy:GetLuaTable("AvatarInfo")
        end
        local r11_125 = r9_125:IsPhantom()
        r2_125[#r2_125 + 1] = r0_125:SimplifyInfoForInit(r10_125)
        r2_125[#r2_125].IsDungeonEnd = true
        r2_125[#r2_125].IsPhantom = r11_125
        r2_125[#r2_125].IsMainPlayer = false
        r2_125[#r2_125].IsSettlementOtherRole = true
        r2_125[#r2_125].IsDead = r9_125:IsDead()
        local r12_125 = r9_125:GetCurrentWeapon()
        if r12_125 then
          r2_125[#r2_125].CurrentWeaponType = r12_125:GetWeaponType()
          r2_125[#r2_125].CurrentWeaponMeleeOrRanged = r12_125:GetWeaponMeleeOrRanged()
        end
      end
    end
    -- close: r4_125
  end
  local r3_125 = r3_0.pack(r2_125)
  local r4_125 = FMessage()
  r4_125:SetBytes(r3_125, #r3_125)
  return r4_125
end
function r6_0.TriggerEnterEndPlayer(r0_126, r1_126)
  -- line: [2120, 2135] id: 126
  local r2_126 = UE4.URuntimeCommonFunctionLibrary.GetPlayerControllerByAvatarEid(r0_126, r1_126)
  if r2_126 and r2_126:IsPlayEnd() then
    DebugPrint("TriggerEnterEndPlayer 玩家已结算：", r1_126)
    local r3_126 = GWorld:GetDSEntity()
    assert(r3_126)
    r0_126:NotifyClientGameEnd(rawget(r3_126.HasLeaveAvatars, r1_126), {
      r1_126
    })
  else
    DebugPrint("TriggerEnterEndPlayer 副本已结束但玩家未结算：", r1_126)
    r0_126:ForceFinishPlayerByFailed({
      r1_126
    })
  end
end
function r6_0.OnMiniGameSuccess(r0_127, r1_127, r2_127)
  -- line: [2137, 2140] id: 127
  r0_127.Overridden.OnMiniGameSuccess(r0_127, r1_127, r2_127)
  r0_127:TriggerDungeonComponentFun("OnMiniGameSuccess", r1_127, r2_127)
end
function r6_0.OnDefenceCoreActive(r0_128, r1_128)
  -- line: [2142, 2145] id: 128
  r0_128.Overridden.OnDefenceCoreActive(r0_128, r1_128)
  r0_128:TriggerDungeonComponentFun("OnDefenceCoreActive", r1_128)
end
function r6_0.OnMiniGameFail(r0_129, r1_129, r2_129)
  -- line: [2147, 2155] id: 129
  if not r0_129:IsSubGameMode() then
    if not r0_129.MiniGameFailedTime[r1_129] then
      r0_129.MiniGameFailedTime[r1_129] = 0
    end
    r0_129.MiniGameFailedTime[r1_129] = r0_129.MiniGameFailedTime[r1_129] + 1
  end
  r0_129.Overridden.OnMiniGameFail(r0_129, r1_129, r2_129)
end
function r6_0.OnDefenceCoreDead(r0_130, r1_130)
  -- line: [2157, 2160] id: 130
  r0_130.Overridden.OnDefenceCoreDead(r0_130, r1_130)
end
function r6_0.ChangeFallTriggersActive(r0_131, r1_131, r2_131)
  -- line: [2162, 2170] id: 131
  for r7_131, r8_131 in pairs(r1_131) do
    for r13_131, r14_131 in pairs(r0_131.EMGameState.FallTriggersArray) do
      if r14_131.FallTriggerId == r8_131 then
        r14_131.Active = r2_131
      end
    end
    -- close: r9_131
  end
  -- close: r3_131
end
function r6_0.AsyncLoadTargetLevel(r0_132, r1_132, r2_132)
  -- line: [2242, 2273] id: 132
  local function r3_132()
    -- line: [2243, 2245] id: 133
    r1_132:AsyncPrintHello()
  end
  local r4_132 = r0_132.EMGameState:GetTargetPoint(r2_132)
  if not IsValid(r4_132) then
    r0_132:AddTimer(0.1, r3_132)
    return 
  end
  local r5_132 = UE4.UGameplayStatics.GetPlayerCharacter(r0_132, 0)
  if not r0_132:GetLevelLoader() then
    r0_132:AddTimer(0.1, r3_132)
    return 
  end
  local r6_132 = r0_132:GetLevelLoader():GetLevelIdByLocation(r4_132:K2_GetActorLocation())
  local r7_132 = r0_132:GetLevelLoader():GetLevelIdByLocation(r5_132:K2_GetActorLocation())
  if not r6_132 or not r7_132 or r6_132 == r7_132 then
    r0_132:AddTimer(0.1, r3_132)
    return 
  end
  local r8_132 = r0_132:GetLevelLoader()
  r8_132:BindArtLevelLoadedCompleteCallback(r6_132, function()
    -- line: [2263, 2270] id: 134
    UE4.UGameplayStatics.GetGameInstance(r0_132):CloseLoadingUI()
    r1_132:AsyncPrintHello()
    if r8_132 then
      r8_132:RemoveArtLevelLoadedCompleteCallback(r6_132)
    end
  end)
  r8_132:LoadArtLevel(r6_132)
end
function r6_0.SetActorLocationAndRotationByTransform(r0_135, r1_135, r2_135, r3_135, r4_135)
  -- line: [2275, 2331] id: 135
  if not r4_135 then
    r4_135 = false
  end
  local r5_135 = nil
  local r6_135 = nil
  if r1_135 == 0 then
    r5_135 = UE4.UGameplayStatics.GetPlayerCharacter(r0_135, 0)
  else
    r5_135 = r0_135.EMGameState.NpcCharacterMap:FindRef(r1_135)
  end
  if not IsValid(r5_135) then
    print(_G.LogTag, " ZJT_PlayerCharacter Or NewTargetPoint Is NUll !")
    return false
  end
  local r7_135 = r2_135.Translation
  local r8_135 = r2_135.Rotation:ToRotator()
  r6_135 = r7_135
  if r4_135 then
    local r9_135 = r5_135.CapsuleComponent:GetScaledCapsuleHalfHeight()
    local r10_135 = r5_135.CapsuleComponent:GetScaledCapsuleRadius()
    local r11_135 = FHitResult()
    local r12_135 = FHitResult()
    if UE4.UKismetSystemLibrary.CapsuleTraceSingle(r0_135, r7_135 + FVector(0, 0, r9_135), r7_135 + FVector(0, 0, r9_135 * -2), r10_135, r9_135, ETraceTypeQuery.TraceScene, false, nil, 0, r11_135, true) then
      r6_135 = FVector(r11_135.Location.X, r11_135.Location.Y, r11_135.ImpactPoint.Z + r9_135 + 2)
    end
  end
  if r3_135 and not r5_135:IsDead() then
    r0_135:SetPlayerCharacterForceIdle(r5_135)
  end
  local r9_135 = UE4.UGameplayStatics.GetGameMode(r0_135)
  if r9_135:GetLevelLoader() then
    local r10_135 = r9_135:GetLevelLoader():GetLevelIdByLocation(r7_135)
    local r11_135 = r9_135:GetLevelLoader():GetLevelIdByLocation(r5_135:K2_GetActorLocation())
    r5_135:K2_SetActorLocationAndRotation(r6_135, r8_135, false, nil, false)
    if r10_135 and r11_135 and r11_135 ~= r10_135 then
      r9_135:GetLevelLoader():UnloadArtLevel(r11_135)
    end
  else
    r5_135:K2_SetActorLocationAndRotation(r6_135, r8_135, false, nil, false)
  end
  return true
end
function r6_0.EMSetActorLocationAndRotation(r0_136, r1_136, r2_136, r3_136, r4_136)
  -- line: [2333, 2395] id: 136
  if not r4_136 then
    r4_136 = false
  end
  local r5_136 = nil
  local r6_136 = nil
  local r7_136 = nil
  print(_G.LogTag, " ZJT_ EMSetActorLocationAndRotation ", r1_136, r2_136, r3_136)
  if r2_136 == "" then
    return false
  end
  r6_136 = r0_136.EMGameState:GetTargetPoint(r2_136)
  if not r6_136 then
    return false
  end
  if r1_136 == 0 then
    r5_136 = UE4.UGameplayStatics.GetPlayerCharacter(r0_136, 0)
  else
    r5_136 = r0_136.EMGameState.NpcCharacterMap:FindRef(r1_136)
  end
  if not IsValid(r5_136) or not IsValid(r6_136) then
    print(_G.LogTag, " ZJT_PlayerCharacter Or NewTargetPoint Is NUll !")
    return false
  end
  local r8_136 = r6_136:K2_GetActorLocation()
  r7_136 = r8_136
  if r4_136 then
    local r9_136 = r5_136.CapsuleComponent:GetScaledCapsuleHalfHeight()
    local r10_136 = r5_136.CapsuleComponent:GetScaledCapsuleRadius()
    local r11_136 = FHitResult()
    local r12_136 = FHitResult()
    if UE4.UKismetSystemLibrary.CapsuleTraceSingle(r0_136, r8_136 + FVector(0, 0, r9_136), r8_136 + FVector(0, 0, r9_136 * -2), r10_136, r9_136, ETraceTypeQuery.TraceScene, false, nil, 0, r11_136, true) then
      r7_136 = FVector(r11_136.Location.X, r11_136.Location.Y, r11_136.ImpactPoint.Z + r9_136 + 2)
    end
  end
  if r3_136 and not r5_136:IsDead() then
    r0_136:SetPlayerCharacterForceIdle(r5_136)
  end
  local r9_136 = UE4.UGameplayStatics.GetGameMode(r0_136)
  if r9_136:GetLevelLoader() then
    local r10_136 = r9_136:GetLevelLoader():GetLevelIdByLocation(r6_136:K2_GetActorLocation())
    local r11_136 = r9_136:GetLevelLoader():GetLevelIdByLocation(r5_136:K2_GetActorLocation())
    r5_136:K2_SetActorLocationAndRotation(r7_136, r6_136:K2_GetActorRotation(), false, nil, false)
    if r10_136 and r11_136 and r11_136 ~= r10_136 then
      r9_136:GetLevelLoader():UnloadArtLevel(r11_136)
    end
  else
    r5_136:K2_SetActorLocationAndRotation(r7_136, r6_136:K2_GetActorRotation(), false, nil, false)
  end
  return true
end
function r6_0.SetPlayerCharacterForceIdle(r0_137, r1_137)
  -- line: [2397, 2404] id: 137
  r1_137:ResetIdle()
  r1_137:DisableInput(UE4.UGameplayStatics.GetPlayerController(r0_137, 0))
  r0_137:AddTimer(0.2, function()
    -- line: [2400, 2402] id: 138
    r1_137:EnableInput(UE4.UGameplayStatics.GetPlayerController(r0_137, 0))
  end)
end
function r6_0.GetRespawnRuleName(r0_139, r1_139)
  -- line: [2406, 2457] id: 139
  DebugPrint("Tianyi@ GetRespawnRuleName begin")
  local r2_139 = "Default"
  local r3_139 = r0_139.DunegeonId
  if not r3_139 then
    DebugPrint("Tianyi@ GetRespawnRuleName: CurrentDungeonId is nil, Try to get it from gameinstance")
    r3_139 = UE4.UGameplayStatics.GetGameInstance(r0_139):GetCurrentDungeonId()
  end
  if IsDedicatedServer(r0_139) then
    local r4_139 = DataMgr.Dungeon[r3_139]
    if r4_139 and r4_139.RespawnRule then
      r2_139 = r4_139.RespawnRule
    end
    return r2_139
  end
  local r4_139 = GWorld:GetAvatar()
  if not r4_139 then
    DebugPrint("Tianyi@ GetRespawnRuleName: Avatar is nil")
    return r2_139
  end
  if r1_139 and r1_139.IsHostage then
    r2_139 = "Hostage"
    return r2_139
  end
  if r4_139:IsInDungeon2() then
    if not r3_139 then
      DebugPrint("GetRespawnRuleName: Tianyi@ DungeonId is nil")
      return r2_139
    end
    local r5_139 = DataMgr.Dungeon[r3_139]
    if r5_139 and r5_139.RespawnRule then
      r2_139 = r5_139.RespawnRule
    end
  elseif r4_139:IsInBigWorld() then
    DebugPrint("Tianyi@ GetRespawnRuleName: Player in bigworld")
    if r4_139:IsInHardBoss() then
      r2_139 = "HardBoss"
    else
      r2_139 = "CommonRegion"
    end
  end
  DebugPrint("Tianyi@ GetRespawnRuleName: RespawnRuleName = " .. r2_139)
  return r2_139
end
function r6_0.GetRespawnRule(r0_140, r1_140, r2_140)
  -- line: [2460, 2468] id: 140
  local r3_140 = nil
  if r2_140 then
    return DataMgr.RespawnRule[r2_140] and DataMgr.RespawnRule.CommonSolo
  end
  return DataMgr.RespawnRule[r0_140:GetRespawnRuleName(r1_140)]
end
function r6_0.InitEntityRecoveryData(r0_141, r1_141)
  -- line: [2470, 2478] id: 141
  r1_141:ClearSkillRecoverTargets()
  r1_141:SetAttr("AdditionalRecoverTime", 0)
  if r1_141:IsPlayer() then
    r0_141:InitPlayerReocveryData(r1_141)
  elseif r1_141:IsPhantom() then
    r0_141:InitPhantomRecoveryData(r1_141)
  end
end
function r6_0.CheckEntityCanRecover(r0_142, r1_142)
  -- line: [2516, 2526] id: 142
  if r1_142:IsPlayer() then
    return r0_142:CheckPlayerCanRecover(r1_142)
  elseif r1_142:IsPhantom() then
    return r0_142:CheckPhantomCanRecover(r1_142)
  elseif r1_142:IsMonster() then
    return r0_142:CheckMonsterCanRecover(r1_142)
  else
    return true
  end
end
function r6_0.CheckPlayerCanRecover(r0_143, r1_143)
  -- line: [2528, 2537] id: 143
  local r2_143 = r1_143:GetRecoveryCount()
  local r3_143 = r1_143:GetRecoveryMaxCount()
  local r4_143 = nil	-- notice: implicit variable refs by block#[4]
  if r3_143 >= 0 then
    r4_143 = r2_143 < r3_143
  else
    goto label_9	-- block#3 is visited secondly
  end
  return r4_143
end
function r6_0.CheckPhantomCanRecover(r0_144, r1_144)
  -- line: [2539, 2549] id: 144
  local r2_144 = GWorld:GetAvatar()
  if r2_144 and r2_144:IsRealInBigWorld() and not r2_144:IsInHardBoss() then
    return false
  end
  local r3_144 = r1_144:GetRecoveryCount()
  local r4_144 = r1_144:GetRecoveryMaxCount()
  local r5_144 = nil	-- notice: implicit variable refs by block#[8]
  if r4_144 >= 0 then
    r5_144 = r3_144 < r4_144
  else
    goto label_24	-- block#7 is visited secondly
  end
  return r5_144
end
function r6_0.CheckMonsterCanRecover(r0_145, r1_145)
  -- line: [2552, 2554] id: 145
  return true
end
function r6_0.TriggerGenerateReward(r0_146, r1_146, r2_146, r3_146, r4_146)
  -- line: [2566, 2571] id: 146
  if r1_146.ToTable then
    r1_146 = r1_146:ToTable()
  end
  r0_146.EMGameState.EventMgr:TriggerGenerateReward(r1_146, r2_146, r3_146, r4_146)
end
function r6_0.ActiveMonsterBuff(r0_147, r1_147, r2_147)
  -- line: [2596, 2601] id: 147
  if not r0_147.MonsterAddBuffRule then
    r0_147.MonsterAddBuffRule = {}
  end
  table.insert(r0_147.MonsterAddBuffRule, {
    BuffList = r1_147,
    BuffNum = r2_147,
  })
end
function r6_0.DestroyMonsterBuff(r0_148)
  -- line: [2603, 2605] id: 148
  r0_148.MonsterAddBuffRule = nil
end
function r6_0.TriggerMechanismFieldCreature(r0_149, r1_149, r2_149, r3_149, r4_149, r5_149)
  -- line: [2616, 2629] id: 149
  for r9_149 = 1, r1_149:Length(), 1 do
    local r10_149 = r1_149:GetRef(r9_149)
    local r11_149 = r0_149.EMGameState.FeildCreatureMap:FindRef(r10_149)
    if not r11_149 then
      print(_G.LogTag, "ZJT_ TriggerMechanismFieldCreature ", r10_149, r2_149, r3_149, r4_149, r5_149)
    else
      r11_149:SetFieldCreateMechanismInfo(r3_149, r4_149, r5_149, r2_149)
    end
  end
end
function r6_0.HideUIInScreen(r0_150, r1_150, r2_150)
  -- line: [2631, 2636] id: 150
  if not r0_150.EMGameState then
    return 
  end
  r0_150.EMGameState:HideUIInScreen(r1_150, r2_150)
end
function r6_0.SetContinuedPCGuideVisibility(r0_151, r1_151, r2_151)
  -- line: [2638, 2643] id: 151
  if not r0_151.EMGameState then
    return 
  end
  r0_151.EMGameState:RealSetContinuedPCGuideVisibility(r1_151, r2_151)
end
function r6_0.UpdatePlayerCharacterEndPointInfo(r0_152, r1_152, r2_152)
  -- line: [2645, 2671] id: 152
  if not r2_152 then
    r2_152 = UE4.UGameplayStatics.GetPlayerController(r1_152)
  end
  local r3_152 = r2_152:GetMyPawn()
  local r4_152 = r0_152.EMGameState.EndPointActor
  if not IsValid(r4_152) then
    DebugPrint("StartAndEndPoint No End EndPoint")
    r3_152:SetEndPointInfo(true, nil, nil)
    return 
  end
  local r5_152 = r4_152:GetTransform(r1_152)
  local r6_152 = r5_152.Translation
  local r7_152 = FRotator(r5_152.Rotation)
  if (r3_152:K2_GetActorLocation() - r6_152):Size() <= 1000 then
    r3_152:SetEndPointInfo(true, r6_152, r7_152)
  else
    r3_152:SetEndPointInfo(false, r6_152, r7_152)
  end
end
function r6_0.AddPickUpSuccessCallback(r0_153, r1_153, r2_153, r3_153)
  -- line: [2673, 2681] id: 153
  if not r0_153.PickUpSuccessCallback then
    r0_153.PickUpSuccessCallback = {}
  end
  if not r0_153.PickUpSuccessCallback[r1_153] then
    r0_153.PickUpSuccessCallback[r1_153] = {}
  end
  r0_153.PickUpSuccessCallback[r1_153][r2_153] = r3_153
end
function r6_0.RemovePickUpSuccessCallback(r0_154, r1_154, r2_154)
  -- line: [2683, 2687] id: 154
  if r0_154.PickUpSuccessCallback and r0_154.PickUpSuccessCallback[r1_154] then
    r0_154.PickUpSuccessCallback[r1_154][r2_154] = nil
  end
end
function r6_0.AddMiniGameSuccessCallback(r0_155, r1_155, r2_155)
  -- line: [2689, 2694] id: 155
  if not r0_155.MiniGameSuccessCallback then
    r0_155.MiniGameSuccessCallback = {}
  end
  r0_155.MiniGameSuccessCallback[r1_155] = r2_155
end
function r6_0.RemoveMiniGameSuccessCallback(r0_156, r1_156, r2_156)
  -- line: [2696, 2700] id: 156
  if r0_156.MiniGameSuccessCallback then
    r0_156.MiniGameSuccessCallback[r1_156] = nil
  end
end
function r6_0.RunStory(r0_157, r1_157, r2_157, r3_157, r4_157)
  -- line: [2702, 2705] id: 157
  DebugPrint("StoryPathStoryPathStoryPathStoryPath", r1_157)
  GWorld.StoryMgr:RunStory(r1_157, r2_157, nil, r3_157, r4_157)
end
function r6_0.PickUpForAllPlayers(r0_158, r1_158, r2_158, r3_158, r4_158, r5_158, r6_158, r7_158)
  -- line: [2707, 2713] id: 158
  for r11_158 = 0, r0_158:GetPlayerNum() + -1, 1 do
    local r13_158 = UE4.UGameplayStatics.GetPlayerController(r0_158, r11_158):GetMyPawn()
    r13_158[r1_158](r13_158, r2_158, r3_158, r4_158, r5_158, r6_158, r7_158)
  end
end
function r6_0.CollectGameModeTimerHandle(r0_159, r1_159)
  -- line: [2716, 2721] id: 159
  if not r0_159.GameModeTimerSet then
    r0_159.GameModeTimerSet = UE4.TSet(UE4.FTimerHandle())
  end
  r0_159.GameModeTimerSet:Add(r1_159)
end
function r6_0.PauseGameModeTimer(r0_160)
  -- line: [2723, 2742] id: 160
  r0_160.CurPauseGameModeTimerMap = {}
  if r0_160.GameModeTimerSet and r0_160.GameModeTimerSet:Num() > 0 then
    local r1_160 = {}
    local r2_160 = r0_160.GameModeTimerSet:ToArray()
    for r6_160 = 1, r2_160:Num(), 1 do
      local r7_160 = r2_160[r6_160]
      if not UE4.UKismetSystemLibrary.K2_TimerExistsHandle(r0_160, r7_160) then
        table.insert(r1_160, r7_160)
      else
        r0_160.CurPauseGameModeTimerMap[r7_160] = true
        UE4.UKismetSystemLibrary.K2_PauseTimerHandle(r0_160, r7_160)
        UE4.UKismetSystemLibrary.K2_TimerExistsHandle(r0_160, r7_160)
      end
    end
    for r6_160 = 1, #r1_160, 1 do
      r0_160.GameModeTimerSet:Remove(r1_160[r6_160])
    end
  end
end
function r6_0.UnPauseGameModeTimer(r0_161)
  -- line: [2744, 2756] id: 161
  if r0_161.CurPauseGameModeTimerMap == nil or IsEmptyTable(r0_161.CurPauseGameModeTimerMap) then
    return 
  end
  for r5_161, r6_161 in pairs(r0_161.CurPauseGameModeTimerMap) do
    if UE4.UKismetSystemLibrary.K2_TimerExistsHandle(r0_161, r5_161) then
      UE4.UKismetSystemLibrary.K2_UnPauseTimerHandle(r0_161, r5_161)
    end
  end
  -- close: r1_161
  r0_161.CurPauseGameModeTimerMap = {}
end
function r6_0.GetActor2ManualId(r0_162, r1_162)
  -- line: [2759, 2762] id: 162
  return r0_162.LevelGameMode.BPBornRegionActor:FindRef(r1_162)
end
function r6_0.TriggerMechanismWindCreator(r0_163, r1_163, r2_163, r3_163)
  -- line: [2764, 2775] id: 163
  for r7_163 = 1, r1_163:Length(), 1 do
    local r9_163 = r0_163.LevelGameMode.BPBornRegionActor:FindRef(r1_163:GetRef(r7_163))
    if r9_163 then
      r9_163:SetWindCreator(r2_163, r3_163)
    else
      print(_G.LogTag, "ZJT_ TriggerMechanismWindCreator ", r2_163, r3_163)
    end
  end
end
function r6_0.EMActorDestroy_Lua(r0_164, r1_164, r2_164)
  -- line: [2817, 2819] id: 164
  r1_164:EMActorDestroy(r2_164)
end
function r6_0.GetMonsterCustomLoc(r0_165, r1_165)
  -- line: [2821, 2860] id: 165
  if r0_165:IsInRegion() then
    DebugPrint("Error!!! 区域出现Boss被卸载瞬移！请检查！ ViewLocation : ", URuntimeCommonFunctionLibrary.GetViewPortLocation(r1_165))
    return FVector(0, 0, 0)
  end
  local r2_165 = nil
  if IsValid(r1_165) and IsValid(r1_165.BBTarget) then
    r2_165 = r1_165.BBTarget
  else
    r2_165 = r0_165:GetOneRandomPlayer()
  end
  if r0_165.TacMapManager then
    local r4_165 = r0_165.TacMapManager:GetSpawnPoints({
      PresetTargets = {
        [r2_165] = 1,
      },
      Mode = "Player",
      UnitSpawnRadiusMin = 1000,
      UnitSpawnRadiusMax = 5000,
      RandomSpawn = true,
      FilterReachable = true,
    })
    if r4_165[r2_165].Num == 0 then
      return FVector(0, 0, 0)
    end
    return r4_165[r2_165][1]
  else
    local r3_165 = FPointCheckInfo()
    r3_165:SetCheckInfo(1000, 5000, true, true, true)
    local r4_165 = r0_165.FixedMonsterSpawn:GetSpawnPointLocations(r2_165, r3_165)
    if r4_165:Num() == 0 then
      return FVector(0, 0, 0)
    end
    return r4_165[1]
  end
end
function r6_0.UploadTargetValues(r0_166, r1_166, r2_166)
  -- line: [2862, 2874] id: 166
  local r3_166 = GWorld:GetAvatar()
  if r3_166 then
    r3_166:TriggerTarget(r1_166)
    return 
  end
  local r4_166 = GWorld:GetDSEntity()
  if r4_166 then
    r4_166:TriggerTarget(r1_166, r2_166)
  end
end
function r6_0.GetAvatarInfo(r0_167, r1_167)
  -- line: [2877, 2890] id: 167
  if IsStandAlone(r0_167) or r5_0.IsListenServer(r0_167) then
    return GWorld:GetAvatar()
  elseif IsDedicatedServer(r0_167) then
    if r1_167 then
      return r0_167.AvatarInfos[r1_167].PlayerInfo
    end
    for r6_167, r7_167 in pairs(r0_167.AvatarInfos) do
      if r7_167 then
        return r7_167.PlayerInfo
      end
    end
    -- close: r2_167
  end
end
function r6_0.TriggerSpawnPet(r0_168)
  -- line: [2892, 2930] id: 168
  if r0_168.EMGameState.PetDefenceFail == true then
    r0_168.EMGameState:ShowDungeonError("TriggerSpawnPet 宠物防御已经失败，不再创建", Const.DungeonErrorType.Pet, Const.DungeonErrorTitle.Process)
    return 
  end
  if not r0_168.RandomPetCreator or not IsValid(r0_168.RandomPetCreator) then
    local r1_168 = r0_168:GetPetStaticCreatorInfo()
    if r1_168:Num() == 0 then
      r0_168.EMGameState:ShowDungeonError("TriggerSpawnPet 当前拼接副本内找不到宠物静态点，请检查配置！", Const.DungeonErrorType.Pet, Const.DungeonErrorTitle.Config)
      return 
    end
    r0_168.RandomPetCreator = r0_168:GetPetCreatorNearestToFirstPlayer(r1_168)
    if not IsValid(r0_168.RandomPetCreator) then
      r0_168.EMGameState:ShowDungeonError("TriggerSpawnPet 选择宠物静态点失败！", Const.DungeonErrorType.Pet, Const.DungeonErrorTitle.FindObject)
      return 
    end
  end
  local r1_168 = r0_168:GetActorLevelName(r0_168.RandomPetCreator)
  local r2_168 = r0_168.SubGameModeInfo:FindRef(r1_168)
  if not IsValid(r2_168) then
    r0_168.EMGameState:ShowDungeonError("TriggerSpawnPet 创建宠物静态点找不到SubGameMode StaticCreatorId: " .. r0_168.RandomPetCreator.StaticCreatorId .. "SubLevelName: " .. tostring(r1_168), Const.DungeonErrorType.Pet, Const.DungeonErrorTitle.FindObject)
    return 
  end
  r2_168.PetActiveLevel = true
  r2_168.RandomPetDefenceCoreId = r0_168.DungeonRandomEventDefenceCoreId
  r2_168.RandomPetId = r0_168.DungeonRandomEventPetId
  r0_168.RandomPetCreator.UnitId = r0_168.DungeonRandomEventPetId
  r0_168.RandomPetCreator.UnitType = "Pet"
  DebugPrint("BP_EMGameMode_C:TriggerSpawnPet 创建宠物 StaticCreatorId", r0_168.RandomPetCreator.StaticCreatorId, "UnitId", r0_168.RandomPetCreator.UnitId)
  r0_168:TriggerActiveCustomStaticCreator(r0_168.RandomPetCreator.StaticCreatorId, "DungeonPetSpawn", true, r1_168)
  r0_168.RandomPetCreator.UnitId = r0_168.DungeonRandomEventDefenceCoreId
  r0_168.RandomPetCreator.UnitType = "Mechanism"
  DebugPrint("BP_EMGameMode_C:TriggerSpawnPet 创建宠物防御核心 StaticCreatorId", r0_168.RandomPetCreator.StaticCreatorId, "UnitId", r0_168.RandomPetCreator.UnitId)
  r0_168:TriggerActiveCustomStaticCreator(r0_168.RandomPetCreator.StaticCreatorId, "DungeonPetDefSpawn", true, r1_168)
  r0_168.PetMonsterCreated = true
end
function r6_0.GetPetCreatorNearestToExit(r0_169, r1_169)
  -- line: [2932, 2954] id: 169
  local r2_169 = r0_169:GetLevelLoader()
  if not r2_169 then
    r0_169.EMGameState:ShowDungeonError("TriggerSpawnPet 拿不到LevelLoader", Const.DungeonErrorType.Pet, Const.DungeonErrorTitle.FindObject)
    return nil
  end
  local r3_169 = r2_169:GetExitLevelLocation()
  local r4_169 = math.huge
  local r5_169 = nil
  for r9_169 = 1, r1_169:Num(), 1 do
    local r10_169 = r1_169[r9_169]
    if r10_169 then
      local r12_169 = UE4.UKismetMathLibrary.Vector_DistanceSquared(r3_169, r10_169:K2_GetActorLocation())
      if r12_169 < r4_169 then
        r4_169 = r12_169
        r5_169 = r10_169
      end
    end
  end
  return r5_169
end
function r6_0.GetPetCreatorNearestToFirstPlayer(r0_170, r1_170)
  -- line: [2956, 2984] id: 170
  if not r0_170:GetLevelLoader() then
    r0_170.EMGameState:ShowDungeonError("TriggerSpawnPet 拿不到LevelLoader", Const.DungeonErrorType.Pet, Const.DungeonErrorTitle.FindObject)
    return nil
  end
  local r3_170 = r0_170:GetAllPlayer()
  if not r3_170 or r3_170:Length() <= 0 then
    r0_170.EMGameState:ShowDungeonError("TriggerSpawnPet 获取不到Players", Const.DungeonErrorType.Pet, Const.DungeonErrorTitle.FindObject)
    return nil
  end
  local r5_170 = r3_170:GetRef(1):K2_GetActorLocation()
  local r6_170 = math.huge
  local r7_170 = nil
  for r11_170 = 1, r1_170:Num(), 1 do
    local r12_170 = r1_170[r11_170]
    if r12_170 then
      local r14_170 = UE4.UKismetMathLibrary.Vector_DistanceSquared(r5_170, r12_170:K2_GetActorLocation())
      if r14_170 < r6_170 then
        r6_170 = r14_170
        r7_170 = r12_170
      end
    end
  end
  return r7_170
end
function r6_0.ShowPetDefenseDynamicEvent(r0_171, r1_171, r2_171, r3_171, r4_171)
  -- line: [2986, 2992] id: 171
  r0_171.EMGameState:SetPetEventName(r1_171)
  r0_171.EMGameState:SetPetEventDescribe(r2_171)
  r0_171.EMGameState:SetPetEventSuccess(r3_171)
  r0_171.EMGameState:SetPetEventFail(r4_171)
  r0_171.LevelGameMode:AddDungeonEvent("ShowPetDefenseDynamicEvent")
end
function r6_0.ShowPetDefenseProgress(r0_172, r1_172, r2_172, r3_172, r4_172)
  -- line: [2994, 3007] id: 172
  r0_172.EMGameState:SetPetEventName(r1_172)
  r0_172.EMGameState:SetPetEventDescribe(r2_172)
  if r0_172:IsSubGameMode() then
    r0_172.EMGameState:SetPetDefenceCoreId(r0_172.RandomPetDefenceCoreId)
    r0_172.EMGameState:SetPetId(r0_172.RandomPetId)
  else
    r0_172.EMGameState:SetPetDefenceCoreId(r0_172.DungeonRandomEventDefenceCoreId)
    r0_172.EMGameState:SetPetId(r0_172.DungeonRandomEventPetId)
  end
  r0_172.EMGameState:SetPetEventSuccess(r3_172)
  r0_172.EMGameState:SetPetEventFail(r4_172)
  r0_172.LevelGameMode:AddDungeonEvent("ShowPetDefenseProgress")
end
function r6_0.HidePetDefenseProgress(r0_173, r1_173)
  -- line: [3009, 3018] id: 173
  r0_173.EMGameState:SetPetSuccess(r1_173)
  r0_173.EMGameState:SetPetDefenceFail(not r1_173)
  r0_173.LevelGameMode:RemoveDungeonEvent("ShowPetDefenseDynamicEvent")
  r0_173.LevelGameMode:RemoveDungeonEvent("ShowPetDefenseProgress")
  r0_173.LevelGameMode:RemoveDungeonEvent("PetPlayFailureMontage")
  if r1_173 then
    r0_173.EMGameState:PetAddGuideAllPlayer()
  end
end
function r6_0.UpdatePetDefenseProgress(r0_174)
  -- line: [3020, 3024] id: 174
  if IsStandAlone(r0_174) then
    r0_174.EMGameState:OnRep_PetDefenceKilled()
  end
end
function r6_0.HandleJoinMidwayDungeonRandomEvent(r0_175, r1_175)
  -- line: [3026, 3045] id: 175
  DebugPrint("[BP_EMGameMode_C:HandleJoinMidwayDungeonRandomEvent] Start")
  local r2_175 = GWorld:GetDSEntity()
  if not r2_175 then
    DebugPrint("[BP_EMGameMode_C:HandleJoinMidwayDungeonRandomEvent] not find DSEntity")
    return 
  end
  if r0_175.DungeonRandomEventPetId then
    DebugPrint("HandleJoinMidwayDungeonRandomEvent Pet ", r0_175.DungeonRandomEventPetId)
    for r7_175, r8_175 in pairs(r1_175 and {}) do
      DebugPrint("CallServerMethod DungeonEventRealHappendPet ", r2_0.ObjId2Str(r7_175))
      r2_175:SendAvatar(r7_175, "DungeonEventRealHappendPet", r0_175.DungeonRandomEventPetId)
    end
    -- close: r3_175
  end
  DebugPrint("[BP_EMGameMode_C:HandleJoinMidwayDungeonRandomEvent] End")
end
function r6_0.InitDungeonRandomEvent(r0_176, r1_176)
  -- line: [3047, 3089] id: 176
  if r0_176.HasInitDungeonEvent then
    r0_176:HandleJoinMidwayDungeonRandomEvent(r1_176)
    return 
  end
  r0_176.HasInitDungeonEvent = true
  DebugPrint("[BP_EMGameMode_C:InitDungeonEvent] Start")
  local r2_176 = r0_176:GetAvatarInfo()
  if not r2_176 then
    DebugPrint("[BP_EMGameMode_C:InitDungeonEvent] not find avatar")
    return 
  end
  local r3_176 = r2_176.DungeonRandomEvent.CurrentEventId
  local r4_176 = DataMgr.DungeonRandomEvent[r3_176]
  if not r4_176 then
    DebugPrint("[BP_EMGameMode_C:InitDungeonEvent] not find event excel <EventId>", r3_176)
    return 
  end
  local r5_176 = r4_176.EventType
  local r6_176 = r2_176.DungeonRandomEvent[r5_176]
  DebugPrint("[BP_EMGameMode_C:InitDungeonEvent] <EventId,EventType>", r3_176, r5_176)
  if r3_176 == 0 then
    DebugPrint("[BP_EMGameMode_C:InitDungeonEvent] not happen event")
    return 
  end
  if not r6_176 then
    DebugPrint("[BP_EMGameMode_C:InitDungeonEvent] not find event detail <EventId,EventType>", r3_176, r5_176)
    return 
  end
  if r0_176["InitDungeonRandomEvent" .. r5_176] then
    r0_176["InitDungeonRandomEvent" .. r5_176](r0_176, r6_176)
  else
    DebugPrint("[BP_EMGameMode_C:InitDungeonEvent] not find event type")
  end
  local r7_176 = GWorld:GetDSEntity()
  if r7_176 then
    r7_176:ServerMulticast("DungeonEventRealHappend", r3_176, r2_176.Uid)
  else
    r2_176:CallServerMethod("DungeonEventRealHappend", r3_176)
  end
end
function r6_0.InitDungeonRandomEventPet(r0_177, r1_177)
  -- line: [3091, 3108] id: 177
  DebugPrint("[BP_EMGameMode_C:InitDungeonRandomEventPet] Start <PetId>", r1_177.PetId)
  local r2_177 = GWorld:GetDSEntity()
  if r2_177 then
    r2_177:ServerMulticast("DungeonEventRealHappendPet", r1_177.PetId)
  end
  if r1_177.PetId == 0 then
    DebugPrint("[BP_EMGameMode_C:InitDungeonRandomEventPet] PetId为0")
    return 
  end
  r0_177.NeedPetMonster = true
  r0_177.DungeonRandomEventPetId = r1_177.PetId
  if not DataMgr.Pet[r1_177.PetId] then
    ScreenPrint("[BP_EMGameMode_C:InitDungeonRandomEventPet] 传入的PetId不存在于Pet表中", r1_177.PetId)
    return 
  end
  r0_177.DungeonRandomEventDefenceCoreId = DataMgr.Pet[r1_177.PetId].DefenceCoreID
end
function r6_0.InitDungeonRandomEventTreasure(r0_178, r1_178)
  -- line: [3110, 3113] id: 178
  DebugPrint("[BP_EMGameMode_C:InitDungeonRandomEventTreasure] Start")
  r0_178.NeedTreasureMonster = true
end
function r6_0.InitDungeonRandomEventButcher(r0_179, r1_179)
  -- line: [3115, 3118] id: 179
  DebugPrint("[BP_EMGameMode_C:InitDungeonRandomEventButcher] Start")
  r0_179.NeedButcherMonster = true
end
function r6_0.JudgeEscapeMechanismArray(r0_180, r1_180)
  -- line: [3120, 3126] id: 180
  if r1_180:Num() <= 0 then
    DebugPrint("Error: 找不到撤离机关。")
  elseif r1_180:Num() > 1 then
    DebugPrint("Warning: 找到了多于一个撤离机关。")
  end
end
function r6_0.GetEscapeMechanismLocation(r0_181)
  -- line: [3128, 3156] id: 181
  local r1_181 = r0_181.EMGameState.MechanismMap:FindRef("ExitTrigger")
  if r1_181 ~= nil then
    r1_181 = r1_181.Array
    r0_181:JudgeEscapeMechanismArray(r1_181)
    for r6_181, r7_181 in pairs(r1_181:ToTable()) do
      return r7_181:K2_GetActorLocation()
    end
    -- close: r2_181
  else
    r1_181 = TArray(FSnapShotInfo())
    local r2_181 = r0_181:GetLevelLoader()
    if r2_181 ~= nil then
      local r3_181 = TArray(FSnapShotInfo())
      r0_181:GetCustomDungeonSnapShotData(r3_181, r2_181.exitLevelID)
      for r8_181, r9_181 in pairs(r3_181) do
        if r9_181.UnitType == "Mechanism" and DataMgr.Mechanism[r9_181.UnitId] ~= nil and DataMgr.Mechanism[r9_181.UnitId].UnitRealType == "ExitTrigger" then
          r1_181:Add(r9_181)
        end
      end
      -- close: r4_181
    end
    r0_181:JudgeEscapeMechanismArray(r1_181)
    for r7_181, r8_181 in pairs(r1_181:ToTable()) do
      return r8_181.Loc
    end
    -- close: r3_181
  end
  return nil
end
function r6_0.GetEscapeMechanismActor(r0_182)
  -- line: [3158, 3170] id: 182
  local r1_182 = r0_182.EMGameState.MechanismMap:FindRef("ExitTrigger")
  if r1_182 == nil then
    DebugPrint("Error: 找不到撤离机关。")
    return nil
  end
  r1_182 = r1_182.Array
  r0_182:JudgeEscapeMechanismArray(r1_182)
  for r6_182, r7_182 in pairs(r1_182:ToTable()) do
    return r7_182
  end
  -- close: r2_182
  return nil
end
function r6_0.GetPickupUnitPreloadTable(r0_183)
  -- line: [3172, 3181] id: 183
  if r0_183.EMGameState.GameModeType == "Blank" then
    return nil
  end
  local r1_183 = "BP_" .. r0_183.EMGameState.GameModeType .. "Component"
  if r0_183:GetDungeonComponent() ~= nil and r0_183:GetDungeonComponent().GetPickupUnitPreloadTable ~= nil then
    return r0_183:GetDungeonComponent():GetPickupUnitPreloadTable()
  end
  return nil
end
function r6_0.GetAvatarBuffs(r0_184, r1_184)
  -- line: [3183, 3191] id: 184
  for r6_184, r7_184 in pairs(r0_184.AvatarInfos) do
    DebugPrint("Tianyi@ AvatarEid = " .. r6_184)
    for r13_184, r14_184 in pairs(r7_184.Buffs) do
      DebugPrint("Tianyi@ BuffInfo: " .. r14_184.BuffId .. " StartTime: " .. r14_184.StartTime .. " Duration: " .. r14_184.Duration)
    end
    -- close: r9_184
  end
  -- close: r2_184
end
function r6_0.TriggerBattleAchievementUploadOnDungeonEnd(r0_185, r1_185)
  -- line: [3193, 3209] id: 185
  if IsStandAlone(r0_185) then
    local r2_185 = GWorld:GetAvatar()
    if r2_185 then
      local r3_185 = UE4.UGameplayStatics.GetPlayerCharacter(r0_185, 0)
      local r4_185 = "Dungeon"
      local r5_185 = r0_185.LevelGameMode.DungeonId
      if r2_185:IsInHardBoss() then
        r4_185 = "HardBoss"
        r5_185 = r0_185.LevelGameMode.EMGameState.HardBossInfo.DifficultyId
      end
      r3_185.BattleAchievement:OnDungeonEnd(r3_185, r4_185, r5_185, r1_185)
    end
  end
end
function r6_0.NotifyGameModePlayerDead(r0_186, r1_186)
  -- line: [3211, 3214] id: 186
  r0_186:TriggerDungeonComponentFun("OnPlayerDead")
  r0_186:PlayerOnDead(r1_186)
end
function r6_0.DestroyActorsByUnitLabels_Lua(r0_187, r1_187)
  -- line: [3216, 3223] id: 187
  local r2_187 = GWorld:GetAvatar()
  if r2_187 then
    for r7_187, r8_187 in pairs(r1_187:ToTable()) do
      r2_187:RegionActorDataDeadByUnitLabel(r8_187.UnitId, r8_187.UnitType)
    end
    -- close: r3_187
  end
end
function r6_0.GetRegionIdByLocation(r0_188, ...)
  -- line: [3225, 3229] id: 188
  local r1_188 = r0_188:GetLevelLoader()
  if not r1_188 then
    return 
  end
  return r1_188:GetRegionIdByLocation(...)
end
function r6_0.ActivateDynamicQuestEvent(r0_189)
  -- line: [3231, 3251] id: 189
  local r1_189 = GWorld:GetAvatar()
  if r1_189 and r1_189.DynamicQuests and #r1_189.DynamicQuests then
    for r6_189, r7_189 in pairs(r1_189.DynamicQuests) do
      if r7_189:IsActive() then
        if not r4_0:CheckDynamicEventStarted(r7_189.DynamicQuestId) then
          r4_0:StartDynamicEvent(r7_189.DynamicQuestId)
        else
          local r8_189 = r4_0:GetCurrentActiveDynamicEvent(r7_189.DynamicQuestId)
          if r8_189 then
            r8_189:ActivateTrigger()
          end
        end
      end
    end
    -- close: r2_189
  end
end
function r6_0.IsRegionAllReady(r0_190)
  -- line: [3253, 3257] id: 190
  local r1_190 = r0_190:GetRegionDataMgrSubSystem()
  if not r1_190 then
    return false
  end
  return r1_190:IsRegionAllReady()
end
function r6_0.TriggerTarget(r0_191, r1_191, r2_191, r3_191)
  -- line: [3259, 3274] id: 191
  local r4_191 = GWorld:GetAvatar()
  if r4_191 then
    r4_191:ServerTargetFinish(r1_191, r2_191, 1)
  end
  local r5_191 = GWorld:GetDSEntity()
  if r5_191 then
    if r3_191 == -1 then
      r5_191:ServerMulticast("ServerTargetFinish", r1_191, r2_191, 1, {})
    else
      r5_191:SendAvatar(Battle(r0_191):GetEntity(r3_191):GetOwner().AvatarId, "ServerTargetFinish", r1_191, r2_191, 1, {})
    end
  end
end
function r6_0.ActiveNewTargetPointAOITrigger_Region(r0_192, r1_192)
  -- line: [3276, 3297] id: 192
  if r1_192 ~= Const.Hijack then
    GWorld.logger.error("ActiveNewTargetPointAOITrigger_Region 接口当前只支持 Hijack Type")
    return 
  end
  if r0_192.EMGameState == nil or r0_192.EMGameState.HijackPathInfo == nil then
    return 
  end
  if not r0_192.NewTargetPointAOITriggerList then
    r0_192.NewTargetPointAOITriggerList = {}
  end
  r0_192.NewTargetPointAOITriggerList[r1_192] = {}
  for r6_192, r7_192 in pairs(r0_192.EMGameState.HijackPathInfo) do
    for r12_192, r13_192 in pairs(r7_192) do
      if IsAuthority(r0_192) and r13_192.SpawnTriggerBoxId ~= -1 and r13_192.SpawnBoxType == ENTPSpawnBoxType.GamemodeEvent then
        r13_192:SpawnTriggerBox()
        table.insert(r0_192.NewTargetPointAOITriggerList[r1_192], r13_192)
      end
    end
    -- close: r8_192
  end
  -- close: r2_192
end
function r6_0.DisactiveNewTargetPointAOITrigger_Region(r0_193, r1_193)
  -- line: [3299, 3308] id: 193
  if not r0_193.NewTargetPointAOITriggerList or not r0_193.NewTargetPointAOITriggerList[r1_193] then
    return 
  end
  for r6_193, r7_193 in pairs(r0_193.NewTargetPointAOITriggerList[r1_193]) do
    r7_193:DestroyTriggerBox(EDestroyReason.SpecialQuestClear)
  end
  -- close: r2_193
end
function r6_0.OnAllPlayersVoted(r0_194)
  -- line: [3310, 3312] id: 194
  r0_194:TriggerDungeonComponentFun("OnAllPlayersVoted")
end
function r6_0.InitMonsterFramingNodeSetting(r0_195, r1_195)
  -- line: [3314, 3322] id: 195
  r1_195.Type = EFramingType.ByReplicateNum
  r1_195.DistanceToCull = 4500
  r1_195.DistanceToCull_FastShare = 15000
  r1_195.PreFrameReplicateNum = 30
  r1_195.PreFrameReplicateMovementNum = 15
  r1_195.SkipFullReplicationFactor = 0.5
  r1_195.SkipMovementReplicationFactor = 1
end
function r6_0.GetPlayerEidByAvatarEidStr(r0_196, r1_196)
  -- line: [3324, 3331] id: 196
  local r2_196 = UE4.URuntimeCommonFunctionLibrary.GetPlayerStateByAvatarEid(GWorld.GameInstance, r1_196)
  if r2_196 then
    return r2_196.Eid
  else
    DebugPrint("BP_EMGameMode_C: AvatarEidStr", r1_196, "拿不到对应的PlayerState!")
  end
end
function r6_0.SetGameStatePetRandomDailyCount(r0_197)
  -- line: [3333, 3346] id: 197
  local r1_197 = GWorld:GetAvatar()
  if not r1_197 then
    return 
  end
  local r2_197 = 0
  for r8_197, r9_197 in pairs(r1_197.Region2TryPetCount) do
    r2_197 = r2_197 + r9_197
  end
  -- close: r4_197
  r0_197.EMGameState.RegionRandomPetLimitedDailyCount = DataMgr.GlobalConstant.PetRareDailyLimit.ConstantValue - r2_197
end
function r6_0.GetRegionCharAvgLevel(r0_198)
  -- line: [3348, 3389] id: 198
  local r1_198 = GWorld:GetAvatar()
  if not r1_198 then
    return 99
  end
  if not r1_198.Chars then
    return 99
  end
  local r2_198 = {}
  local r3_198 = 3
  local function r4_198(r0_199)
    -- line: [3359, 3374] id: 199
    if #r2_198 < r3_198 then
      table.insert(r2_198, r0_199)
    else
      local r1_199 = math.min(table.unpack(r2_198))
      if r1_199 < r0_199 then
        for r6_199, r7_199 in ipairs(r2_198) do
          if r7_199 == r1_199 then
            r2_198[r6_199] = r0_199
            break
          end
        end
        -- close: r2_199
      end
    end
  end
  for r9_198, r10_198 in pairs(r1_198.Chars) do
    if r10_198 and r10_198.Level then
      r4_198(r10_198.Level)
    end
  end
  -- close: r5_198
  local r5_198 = 0
  for r10_198, r11_198 in pairs(r2_198) do
    r5_198 = r5_198 + r11_198
  end
  -- close: r6_198
  local r6_198 = math.floor(r5_198 / #r2_198)
  DebugPrint("BP_EMGameMode_C:GetRegionCharAvgLevel", r6_198)
  return r6_198
end
function r6_0.UpdateServerTimeOfDay(r0_200, r1_200)
  -- line: [3391, 3397] id: 200
  local r2_200 = GWorld:GetAvatar()
  if not r2_200 then
    return 
  end
  r2_200:SetTimeOfDay(r1_200)
end
function r6_0.GetServerTimeOfDay(r0_201)
  -- line: [3399, 3405] id: 201
  local r1_201 = GWorld:GetAvatar()
  if not r1_201 then
    return 12
  end
  return r1_201.TimeOfDay
end
function r6_0.SetPlayerInvincible(r0_202, r1_202, r2_202)
  -- line: [3407, 3418] id: 202
  if not IsValid(r1_202) then
    return 
  end
  DebugPrint("BP_EMGameMode_C: SetPlayerInvincible", r2_202, "PlayerEid:", r1_202.Eid)
  if r2_202 then
    Battle(r0_202):AddBuffToTarget(r1_202, r1_202, Const.InvincibleBuffId, -1)
  else
    Battle(r0_202):RemoveBuffFromTarget(r1_202, r1_202, Const.InvincibleBuffId, false, -1)
  end
end
function r6_0.PausePhantomBTByPlayer(r0_203, r1_203, r2_203, r3_203)
  -- line: [3420, 3439] id: 203
  if not IsValid(r1_203) then
    return 
  end
  if not r3_203 then
    r3_203 = "GameModePauseBT"
  end
  DebugPrint("BP_EMGameMode_C: StopPhantomBTByPlayer", r2_203, "PlayerEid:", r1_203.Eid)
  for r9_203, r10_203 in pairs(r1_203:GetPhantomTeammates(false, true)) do
    if IsValid(r10_203) then
      if r2_203 then
        r10_203:PauseBT(r3_203)
      else
        r10_203:ResumeBT(r3_203)
      end
    end
  end
  -- close: r5_203
end
AssembleComponents(r6_0)
return r6_0
