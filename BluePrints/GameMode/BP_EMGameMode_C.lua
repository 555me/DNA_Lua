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
  -- line: [160, 175] id: 8
  r0_8.LevelGameMode = UE4.UGameplayStatics.GetGameMode(r0_8)
  if r0_8:IsSubGameMode() then
    return 
  end
  r0_8:SetActorTickInterval(1)
  r0_8:AIBattleMgrReceiveBeginPlay()
  r0_8:BindTalkSubsystem()
  r0_8:SwitchCalcOpt()
  r0_8.GameModeIndex = GWorld:AddGameMode(r0_8)
end
function r6_0.SwitchCalcOpt(r0_9)
  -- line: [177, 187] id: 9
  local r1_9 = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UAttributesSetSubsystem:StaticClass())
  if not r1_9 then
    return 
  end
  if IsDedicatedServer(r0_9) then
    r1_9:SwitchCalcAttrOptimization(false)
  else
    r1_9:SwitchCalcAttrOptimization(true)
  end
end
function r6_0.ReceiveEndPlay(r0_10, r1_10)
  -- line: [189, 199] id: 10
  if r0_10:IsSubGameMode() then
    return 
  end
  r0_10.Overridden.ReceiveEndPlay(r0_10, r1_10)
  r0_10.OnDestroyDelegates:Broadcast()
  r0_10:UnbindTalkSubsystem()
  GWorld:RemoveGameMode(r0_10.GameModeIndex)
end
function r6_0.BindTalkSubsystem(r0_11)
  -- line: [201, 210] id: 11
  local r1_11 = USubsystemBlueprintLibrary.GetWorldSubsystem(r0_11, UTalkSubsystem)
  if not IsValid(r1_11) then
    return 
  end
  if r0_11.OnGamePauseChanged then
    r0_11.OnGamePauseChanged:Add(r1_11, r1_11.OnGamePauseChanged)
  end
end
function r6_0.UnbindTalkSubsystem(r0_12)
  -- line: [212, 221] id: 12
  local r1_12 = USubsystemBlueprintLibrary.GetWorldSubsystem(r0_12, UTalkSubsystem)
  if not IsValid(r1_12) then
    return 
  end
  if r0_12.OnGamePauseChanged then
    r0_12.OnGamePauseChanged:Remove(r1_12, r1_12.OnGamePauseChanged)
  end
end
function r6_0.GetPlayerLevel(r0_13)
  -- line: [223, 225] id: 13
  local r1_13 = GWorld:GetAvatar()
  if r1_13 then
    r1_13 = GWorld:GetAvatar().Level and 0
  else
    goto label_11	-- block#2 is visited secondly
  end
  return r1_13
end
function r6_0.GetTargetPlayerNum(r0_14)
  -- line: [264, 266] id: 14
  return r2_0.Size(r0_14.AvatarInfos)
end
function r6_0.IsNeedToWaitForOthers(r0_15)
  -- line: [268, 270] id: 15
  return r0_15.NeedToWaitForOthers
end
function r6_0.ReceiveTick(r0_16, r1_16)
  -- line: [272, 275] id: 16
  r0_16:TickAIBattleMgr(r1_16)
  r0_16:TickGenReward(r1_16)
end
function r6_0.GetAlreadyInit(r0_17)
  -- line: [278, 280] id: 17
  return r0_17.AlreadyInit
end
function r6_0.SetRegionSpecialQuest(r0_18, r1_18, r2_18)
  -- line: [286, 298] id: 18
  assert(r0_18:IsInRegion(), "SetRegionSpecialQuest 只能在区域内调用")
  r0_18.EMGameState.CurDungeonUIParamID = r2_18
  local r3_18 = ERegionSpecialQuestType:GetNameByValue(r1_18)
  r0_18:InitRegionDungeonComponent(r3_18)
  r0_18.LevelGameMode:InitRegionSpecialQuestGameModeComponent()
  r0_18.EMGameState:SetDungeonUIState(Const.EDungeonUIState.None)
  r0_18.EMGameState:LoadDungeonUI(r3_18)
  DebugPrint("SetRegionSpecialQuest 特殊任务GameModeComponent初始化 特殊任务:", r3_18)
end
function r6_0.ResetRegionSpecialQuest(r0_19)
  -- line: [300, 307] id: 19
  DebugPrint("ResetRegionSpecialQuest 特殊任务GameModeComponent重置 特殊任务:", r0_19.LevelGameMode.RegionSpecialQuest)
  r0_19.EMGameState:UnloadDungeonUI(r0_19.LevelGameMode.RegionSpecialQuest)
  r0_19.LevelGameMode:ClearRegionSpecialQuestGameModeComponent()
  r0_19:ClearRegionDungeonComponent()
  r0_19.EMGameState.CurDungeonUIParamID = 0
end
function r6_0.InitRegionSpecialQuestGameModeComponent(r0_20)
  -- line: [309, 315] id: 20
  if r0_20.RegionSpecialQuest == nil then
    return 
  end
  r0_20:TriggerDungeonComponentFun("Init" .. r0_20.RegionSpecialQuest .. "Component")
end
function r6_0.ClearRegionSpecialQuestGameModeComponent(r0_21)
  -- line: [317, 323] id: 21
  if r0_21.RegionSpecialQuest == nil then
    return 
  end
  r0_21:TriggerDungeonComponentFun("Clear" .. r0_21.RegionSpecialQuest .. "Component")
end
function r6_0.ShowTrialTask(r0_22, r1_22)
  -- line: [325, 327] id: 22
  r0_22:TriggerDungeonComponentFun("ShowTrialTask", r1_22)
end
function r6_0.OnInit(r0_23)
  -- line: [331, 390] id: 23
  if not r0_23:CheckGameModeEnable() then
    return 
  end
  if r0_23:IsSubGameMode() then
    return 
  end
  r0_23:RegionOnInit()
  DebugPrint("GameMode进行激活 OnInit")
  GWorld:DSBLog("Info", "GameMode:OnInit", "GameMode")
  r0_23:AddDungeonEvent("OnInit")
  r0_23.AlreadyInit = true
  if IsDedicatedServer(r0_23) then
    GWorld.GameInstance:SetFixedFrameRate(20)
  end
  r0_23:TryRegisterPlayerToTacmap()
  r0_23.CharExpGetInBattle = 0
  if r0_23:IsInDungeon() and r0_23:NeedProgressRecover() then
    r0_23:InitBPBornActor()
    r0_23:TriggerProgressRecover()
  else
    r0_23:InitDungeonBaseInfo()
    local r1_23 = GWorld:GetAvatar()
    if r1_23 then
      require("BluePrints.UI.TaskPanel.TaskUtils"):UpdatePlayerSubRegionIdInfo(r1_23.CurrentRegionId)
      r1_23:CombineAddRegionData(true)
      r0_23:AddTimer(0.1, function()
        -- line: [363, 368] id: 24
        local r0_24 = GWorld:GetAvatar()
        if r0_24 and r0_24.CombineAdd and r0_23:IsInRegion() then
          r0_24:CombineAddRegionData(false)
        end
      end)
    end
    r0_23:InitBPBornActor()
    r0_23:InitCustomActor()
    r0_23:InitAutoActiveStaticCreator()
    if r1_23 and r0_23:IsInRegion() then
      r1_23:CombineAddRegionData(false)
    end
    r0_23.Overridden.OnInit(r0_23)
  end
  if r0_23:IsInDungeon() and r0_23.DungeonId and r0_23.DungeonId > 0 then
    r0_23:SetDungeonBGMState(0)
  end
  r0_23.OnInitDelegates:Broadcast()
  r4_0:ClearCurrentDoingDynamicEvent(true, true)
end
function r6_0.InitDungeonBaseInfo(r0_25)
  -- line: [392, 407] id: 25
  if r0_25:IsSubGameMode() or r0_25:IsInRegion() then
    return 
  end
  if r0_25.EMGameState.GameModeType == "Blank" then
    return 
  end
  if not r0_25:GetDungeonComponent() then
    return 
  end
  local r1_25 = "Init" .. r0_25.EMGameState.GameModeType .. "BaseInfo"
  if r0_25:GetDungeonComponent() ~= nil and r0_25:GetDungeonComponent()[r1_25] ~= nil then
    r0_25:GetDungeonComponent()[r1_25](r0_25:GetDungeonComponent())
  end
end
function r6_0.RegionOnInit(r0_26)
  -- line: [410, 421] id: 26
  if r0_26:IsInRegion() then
    local r1_26 = GWorld:GetAvatar()
    if r1_26 then
      r1_26:HandleTryInitRegionInfo()
    end
    if not r0_26.EMGameState:RegionNeedPreCreateUnit() then
      r0_26:GetRegionDataMgrSubSystem():OnInitRecoverRegionData(false)
    end
  end
end
function r6_0.OnQuestComplete(r0_27, r1_27, r2_27)
  -- line: [427, 435] id: 27
  r0_27.Overridden.OnQuestComplete(r0_27, r1_27, r2_27)
  for r8_27, r9_27 in pairs(r0_27:K2_GetComponentsByClass(UAfterQuestFinishEventComponent.StaticClass()):ToTable()) do
    if r9_27.QuestId == r2_27 then
      r9_27.AfterQuestFinish:Broadcast()
    end
  end
  -- close: r4_27
end
function r6_0.TriggerOnQuestCompleteComponent(r0_28)
  -- line: [437, 448] id: 28
  local r1_28 = r0_28:K2_GetComponentsByClass(UAfterQuestFinishEventComponent.StaticClass())
  local r2_28 = GWorld:GetAvatar()
  if not r2_28 then
    return 
  end
  for r7_28, r8_28 in pairs(r1_28:ToTable()) do
    if r2_28:IsQuestFinished(r8_28.QuestId) or r2_28:IsQuestAssumeFinished(r8_28.QuestId) then
      r8_28.AfterQuestFinish:Broadcast()
    end
  end
  -- close: r3_28
end
function r6_0.OnBigWorldActive(r0_29)
  -- line: [450, 454] id: 29
  r0_29.Overridden.OnBigWorldActive(r0_29)
  r0_29:TriggerOnQuestCompleteComponent()
end
function r6_0.MainGameModeOnBigWorldActive(r0_30)
  -- line: [456, 494] id: 30
  if r0_30:IsSubGameMode() then
    return 
  end
  local r1_30 = GWorld:GetAvatar()
  local r2_30 = {}
  for r7_30, r8_30 in pairs(r0_30.EMGameState.ExploreGroupMap:ToTable()) do
    if r8_30.AutoActive then
      local r9_30 = r0_30:GetRegionIdByLocation(r8_30:K2_GetActorLocation())
      local r10_30 = r8_30:GetExploreGroupId()
      if not DataMgr.SubRegion[r9_30] then
        GWorld.logger.error("ZJT_ 哦我的上帝，这里有一个探索组" .. r10_30 .. "被丢弃在区域外" .. r9_30 .. "找不到它所在的区域")
      elseif r2_30[r8_30:GetExploreGroupId()] then
        GWorld.logger.error("ZJT_ 哦我的上帝，这里有一个探索组居然重复掉了" .. r10_30 .. ":SubRegionId:" .. r9_30 .. "所在的区域")
      else
        local r11_30 = r1_30.Explores[r10_30]
        if r11_30 then
          if r11_30:IsDoing() and r11_30.RegionId ~= r9_30 then
            GWorld.logger.error("ZJT_ 哦我的上帝，这里有一个探索组居然重复掉了 不同区域: " .. r10_30 .. ": 本次激活 SubRegionId:" .. r9_30 .. "所在的区域" .. "上次激活：" .. r11_30.RegionId .. " 所在区域！")
          elseif r11_30:IsInActive() then
            r2_30[r10_30] = r9_30
          end
        else
          r2_30[r10_30] = r9_30
        end
        r8_30:InitSetExploreGroupStatus_Active()
      end
    end
  end
  -- close: r3_30
  if r1_30 then
    r1_30:ExploreIdsActive(r2_30)
  end
  r0_30:TriggerOnQuestCompleteComponent()
end
function r6_0.OnBattle(r0_31)
  -- line: [496, 503] id: 31
  if not r0_31:IsSubGameMode() then
    r0_31.OnBattleDelegates:Broadcast()
    r0_31:TriggerDungeonComponentFun("OnBattle")
  end
  r0_31.Overridden.OnBattle(r0_31)
end
function r6_0.OnPlayerEnter(r0_32, r1_32)
  -- line: [505, 512] id: 32
  if not r0_32:IsSubGameMode() and r1_32 > 0 then
    r0_32:TriggerDungeonComponentFun("OnPlayerEnter", r1_32)
  end
  r0_32.Overridden.OnPlayerEnter(r0_32, r1_32)
end
function r6_0.OnPause(r0_33)
  -- line: [514, 520] id: 33
  if not r0_33:IsSubGameMode() then
    r0_33.OnPauseDelegates:Broadcast()
  end
  r0_33.Overridden.OnPause(r0_33)
end
function r6_0.OnAlert(r0_34)
  -- line: [522, 528] id: 34
  if not r0_34:IsSubGameMode() then
    r0_34.OnAlertDelegates:Broadcast()
  end
  r0_34.Overridden.OnAlert(r0_34)
end
function r6_0.OnEnterCommonAlert(r0_35)
  -- line: [530, 536] id: 35
  if not r0_35:IsSubGameMode() then
    r0_35.OnEnterCommonAlertDelegates:Broadcast()
  end
  r0_35.Overridden.OnEnterCommonAlert(r0_35)
end
function r6_0.OnExitCommonAlert(r0_36)
  -- line: [538, 544] id: 36
  if not r0_36:IsSubGameMode() then
    r0_36.OnExitCommonAlertDelegates:Broadcast()
  end
  r0_36.Overridden.OnExitCommonAlert(r0_36)
end
function r6_0.OnResumeBattleEntities(r0_37)
  -- line: [546, 551] id: 37
  if not r0_37:IsSubGameMode() then
    r0_37.OnResumeBattleEntitiesDelegates:Broadcast()
  end
  r0_37.Overridden.OnResumeBattleEntities(r0_37)
end
function r6_0.OnPauseBattleEntities(r0_38, r1_38)
  -- line: [553, 558] id: 38
  if not r0_38:IsSubGameMode() then
    r0_38.OnPauseBattleEntitiesDelegates:Broadcast()
  end
  r0_38.Overridden.OnPauseBattleEntities(r0_38, r1_38)
end
function r6_0.OnBossDead(r0_39, r1_39)
  -- line: [560, 563] id: 39
  r0_39.Overridden.OnBossDead(r0_39, r1_39)
  r0_39:TriggerBPGameModeEvent("OnBossDead", r1_39)
end
function r6_0.OnEnd(r0_40, r1_40)
  -- line: [565, 585] id: 40
  if not r0_40:IsSubGameMode() then
    r0_40.OnEndDelegates:Broadcast(r1_40)
    r0_40.EMGameState:ClearGuideEid()
    r0_40:TriggerDungeonComponentFun("Trigger" .. r0_40.EMGameState.GameModeType .. "OnEnd")
    r0_40:RemoveDungeonEvent("OnInit")
    r0_40.CharExpGetInBattle = 0
    for r7_40, r8_40 in pairs(r0_40:GetAllPlayer()) do
      local r9_40 = r8_40:IsDead()
      if r9_40 then
        r9_40 = UE4.ETeamRecoveryState.RealDead and UE4.ETeamRecoveryState.Alive
      else
        goto label_37	-- block#4 is visited secondly
      end
      r8_40:HandleRemoveModPassives()
      r8_40:TryLeaveDying(r9_40)
    end
    -- close: r3_40
  end
  r0_40.Overridden.OnEnd(r0_40, r1_40)
end
function r6_0.OnStaticCreatorEvent(r0_41, r1_41, r2_41, r3_41, r4_41)
  -- line: [587, 592] id: 41
  if not r0_41:IsSubGameMode() then
    r0_41:TriggerDungeonComponentFun("OnStaticCreatorEvent", r1_41, r2_41, r3_41, r4_41)
  end
  r0_41.Overridden.OnStaticCreatorEvent(r0_41, r1_41, r2_41, r3_41, r4_41)
end
function r6_0.OnUnitDeadEvent(r0_42, r1_42)
  -- line: [594, 599] id: 42
  if not r0_42:IsSubGameMode() then
    r0_42:TriggerDungeonComponentFun("OnUnitDeadEvent", r1_42)
    r0_42:TriggerDungeonAchieve("OnMonsterDeadAchieve", r1_42, -1)
  end
end
function r6_0.OnUnitDestoryEvent(r0_43, r1_43, r2_43, r3_43)
  -- line: [601, 613] id: 43
  if not r0_43:IsSubGameMode() then
    r0_43:TriggerDungeonComponentFun("OnUnitDestoryEvent", r1_43, r2_43)
  end
  if r1_43 then
    r0_43:TriggerSTLEvent("OnSTLActorDestroyed", r1_43, r3_43)
  elseif r2_43 then
    r0_43:TriggerSTLEvent("OnSTLActorDestroyed", r2_43, r3_43)
  else
    DebugPrint("BP_EMGameMode_C:OnUnitDestoryEvent 传入的Monster和CombatItemBase均为空！")
  end
end
function r6_0.OnCombatPropDeadEvent(r0_44, r1_44)
  -- line: [615, 619] id: 44
  if not r0_44:IsSubGameMode() then
    r0_44:TriggerDungeonComponentFun("OnCombatPropDeadEvent", r1_44)
  end
end
function r6_0.STLPostStaticCreatorEvent(r0_45, r1_45, r2_45)
  -- line: [621, 628] id: 45
  if r0_45:IsInDungeon() then
    return 
  end
  if r2_45.Creator and r1_45.RandomCreatorId == 0 and r1_45.CreatorId ~= 0 then
    r0_45:TriggerSTLEvent("STLPostStaticCreatorEvent", r1_45)
  end
end
function r6_0.ClearDelayMonster(r0_46)
  -- line: [630, 638] id: 46
  if r0_46:IsInRegion() then
    return 
  end
  local r1_46 = r0_46.EMGameState.EventMgr
  r1_46.FramingCreateUintQueue.Monster = {}
  r1_46.LoadingClassMonsterQueue = {}
end
function r6_0.STLRegisterKillMonsterNode(r0_47, r1_47)
  -- line: [641, 652] id: 47
  if not r0_47.KillMonsterNodeMap then
    r0_47.KillMonsterNodeMap = {}
  end
  if _G.next(r0_47.KillMonsterNodeMap) == nil then
    r0_47.EMGameState:RegisterGameModeEvent("OnDead", r0_47, r0_47.STLOnMonsterKilled)
    DebugPrint("KillMonsterNode: 注册OnDead事件")
  end
  r0_47.KillMonsterNodeMap[r1_47.Key] = r1_47
  DebugPrint("KillMonsterNode: 注册到GameMode. Key", r1_47.Key)
end
function r6_0.STLUnRegisterKillMonsterNode(r0_48, r1_48)
  -- line: [654, 665] id: 48
  if not r0_48.KillMonsterNodeMap then
    return 
  end
  r0_48.KillMonsterNodeMap[r1_48] = nil
  DebugPrint("KillMonsterNode: 从GameMode移除. Key", r1_48)
  if _G.next(r0_48.KillMonsterNodeMap) == nil then
    r0_48.EMGameState:RemoveGameModeEvent("OnDead", r0_48, r0_48.STLOnMonsterKilled)
    DebugPrint("KillMonsterNode: 注销OnDead事件")
  end
end
function r6_0.STLOnMonsterKilled(r0_49, r1_49)
  -- line: [667, 677] id: 49
  if not r0_49.KillMonsterNodeMap then
    return 
  end
  for r7_49, r8_49 in pairs(r0_49:STLTableDeepCopy(r0_49.KillMonsterNodeMap)) do
    DebugPrint("KillMonsterNode: 怪物被击杀，Node Key", r7_49)
    r8_49:OnMonsterKilledByNums(r1_49)
  end
  -- close: r3_49
end
function r6_0.STLRegisterKillMonsterNode_Creator(r0_50, r1_50)
  -- line: [682, 693] id: 50
  if not r0_50.KillMonsterNodeMap_Creator then
    r0_50.KillMonsterNodeMap_Creator = {}
  end
  if _G.next(r0_50.KillMonsterNodeMap_Creator) == nil then
    r0_50.EMGameState:RegisterGameModeEvent("OnDeadStaticUnit", r0_50, r0_50.STLOnMonsterKilled_Creator)
    DebugPrint("KillMonsterNode_Creator: 注册OnDead事件")
  end
  r0_50.KillMonsterNodeMap_Creator[r1_50.Key] = r1_50
  DebugPrint("KillMonsterNode_Creator: 注册到GameMode. Key", r1_50.Key)
end
function r6_0.STLUnRegisterKillMonsterNode_Creator(r0_51, r1_51)
  -- line: [695, 706] id: 51
  if not r0_51.KillMonsterNodeMap_Creator then
    return 
  end
  r0_51.KillMonsterNodeMap_Creator[r1_51] = nil
  DebugPrint("KillMonsterNode_Creator: 从GameMode移除. Key", r1_51)
  if _G.next(r0_51.KillMonsterNodeMap_Creator) == nil then
    r0_51.EMGameState:RemoveGameModeEvent("OnDeadStaticUnit", r0_51, r0_51.STLOnMonsterKilled_Creator)
    DebugPrint("KillMonsterNode_Creator: 注销OnDead事件")
  end
end
function r6_0.STLOnMonsterKilled_Creator(r0_52, r1_52)
  -- line: [708, 718] id: 52
  if not r0_52.KillMonsterNodeMap_Creator then
    return 
  end
  for r7_52, r8_52 in pairs(r0_52:STLTableDeepCopy(r0_52.KillMonsterNodeMap_Creator)) do
    DebugPrint("KillMonsterNode_Creator: 怪物被击杀，Node Key", r7_52)
    r8_52:OnMonsterKilledByCreatorId(r1_52)
  end
  -- close: r3_52
end
function r6_0.STLTableDeepCopy(r0_53, r1_53)
  -- line: [720, 726] id: 53
  local r2_53 = {}
  for r7_53, r8_53 in pairs(r1_53) do
    r2_53[r7_53] = r8_53
  end
  -- close: r3_53
  return r2_53
end
function r6_0.OnCustomEvent(r0_54, r1_54, r2_54)
  -- line: [729, 735] id: 54
  if not r0_54:IsSubGameMode() then
    r0_54.OnCustomEventDelegates:Broadcast(r1_54, r2_54)
  end
  r0_54.Overridden.OnCustomEvent(r0_54, r1_54, r2_54)
  r0_54:TriggerBPGameModeEvent("OnCustomEvent", r1_54)
end
function r6_0.OnTriggerAOIBase(r0_55, r1_55, r2_55, r3_55, r4_55)
  -- line: [737, 748] id: 55
  if not r0_55:IsSubGameMode() then
    r0_55:TriggerSTLEvent("OnTriggerAOIBase", r1_55, r2_55, r3_55, r4_55)
  end
  r0_55.Overridden.OnTriggerAOIBase(r0_55, r1_55, r2_55, r3_55, r4_55)
  r0_55:TriggerBPGameModeEvent("OnTriggerAOIBase", r1_55, r2_55, r3_55, r4_55)
end
function r6_0.ChangeAOITriggerCollision(r0_56, r1_56, r2_56)
  -- line: [750, 761] id: 56
  for r7_56, r8_56 in pairs(r1_56) do
    local r9_56 = r0_56.EMGameState.StaticCreatorMap:Find(r8_56)
    if r9_56 and r9_56.ChildEids:Length() > 0 then
      local r10_56 = Battle(r0_56):GetEntity(r9_56.ChildEids[1])
      if r10_56 then
        local r11_56 = r10_56.CollisionComponent
        if r11_56 then
          if r2_56 then
            r11_56 = ECollisionEnabled.QueryOnly and ECollisionEnabled.NoCollision
          else
            goto label_34	-- block#7 is visited secondly
          end
          r10_56.CollisionComponent:SetCollisionEnabled(r11_56)
        end
      end
    end
  end
  -- close: r3_56
end
function r6_0.BpAddTimer(r0_57, r1_57, r2_57, r3_57, r4_57)
  -- line: [765, 773] id: 57
  DebugPrint("BpTimerDebug: BpAddTimer", r1_57, r2_57, r3_57, r4_57)
  r0_57:AddTimer(r2_57, r0_57.BpOnTimerEnd, false, 0, r1_57, r3_57, r1_57)
  r0_57:AddClientTimerStruct(r0_57, r1_57, r2_57, r3_57)
  if r4_57 == Const.GameModeEventServerClient then
    r0_57:AddDungeonEvent(r1_57)
  end
end
function r6_0.BpDelTimer(r0_58, r1_58, r2_58, r3_58)
  -- line: [775, 792] id: 58
  DebugPrint("BpTimerDebug: BpDelTimer", r1_58, r2_58, r3_58)
  r0_58:RemoveTimer(r1_58, r2_58)
  local r4_58 = "BpOnTimerDel_" .. r1_58
  if r0_58[r4_58] then
    r0_58[r4_58](r0_58)
  end
  if r1_58 == Const.BattleProgressTimerHandle and r0_58.BP_BattleProgressComponent then
    r0_58.BP_BattleProgressComponent:OnTimerDel()
  end
  r0_58:RemoveClientTimerStruct(r1_58)
  if r3_58 == Const.GameModeEventServerClient then
    r0_58:RemoveDungeonEvent(r1_58)
  end
end
function r6_0.BpResetTimer(r0_59, r1_59, r2_59, r3_59, r4_59)
  -- line: [795, 803] id: 59
  DebugPrint("BpTimerDebug: BpResetTimer", r1_59, r2_59, r3_59, r4_59)
  r0_59:RemoveTimer(r1_59, r3_59)
  r0_59:AddTimer(r2_59, r0_59.BpOnTimerEnd, false, 0, r1_59, r3_59, r1_59)
  r0_59:RemoveClientTimerStruct(r1_59)
  if r4_59 == Const.GameModeEventServerClient then
    r0_59:AddClientTimerStruct(r0_59, r1_59, r2_59, r3_59)
  end
end
function r6_0.BpOnTimerEnd(r0_60, r1_60)
  -- line: [805, 823] id: 60
  DebugPrint("BpTimerDebug: BpOnTimerEnd", r1_60)
  r0_60.Overridden.BpOnTimerEnd(r0_60, r1_60)
  r0_60:TriggerBPGameModeEvent("BpOnTimerEnd", r1_60)
  local r2_60 = "BpOnTimerEnd_" .. r1_60
  if r0_60[r2_60] then
    r0_60[r2_60](r0_60)
  end
  r0_60.LevelGameMode:TriggerDungeonComponentFun(r2_60)
  if r1_60 == Const.BattleProgressTimerHandle and r0_60.BP_BattleProgressComponent then
    r0_60.BP_BattleProgressComponent:OnTimerEnd()
  end
  r0_60:RemoveClientTimerStruct(r1_60)
  r0_60:RemoveDungeonEvent(r1_60)
end
function r6_0.BpGetRemainTime(r0_61, r1_61)
  -- line: [825, 831] id: 61
  local r2_61 = r2_0.GetClientTimerStructRemainTime(r1_61)
  if not r2_61 then
    return 0
  end
  return r2_61
end
function r6_0.SetClientDungeonUIState(r0_62, r1_62)
  -- line: [842, 849] id: 62
  local r2_62 = r0_62.EMGameState.DungeonUIState
  r0_62.EMGameState.DungeonUIState = r1_62
  r0_62.EMGameState:MarkDungeonUIStateAsDirtyData()
  if IsStandAlone(r0_62) and r2_62 ~= r1_62 then
    r0_62.EMGameState:OnRep_DungeonUIState()
  end
end
function r6_0.NotifyClientShowSurvivalProBuffInfo(r0_63, r1_63, r2_63, r3_63)
  -- line: [852, 859] id: 63
  r0_63.EMGameState.SurvivalProBuffInfo.PathIconList = r1_63
  r0_63.EMGameState.SurvivalProBuffInfo.TextMapList = r2_63
  r0_63.EMGameState.SurvivalProBuffInfo.Duration = r3_63
  r0_63.EMGameState:MarkSurvivalProBuffInfoAsDirtyData()
  r0_63:AddDungeonEvent("UpdateSurvivalProBuffInfo")
end
function r6_0.NotifyClientShowDungeonToast(r0_64, r1_64, r2_64, r3_64, r4_64)
  -- line: [862, 865] id: 64
  r0_64.EMGameState:MulticastClientShowDungeonToast(r1_64, r2_64, r3_64, r4_64)
  return r1_64
end
function r6_0.InitBPBornActor(r0_65)
  -- line: [868, 896] id: 65
  if r0_65.BPBornActor:Num() == 0 then
    return 
  end
  for r5_65, r6_65 in pairs(r0_65.BPBornActor:ToTable()) do
    if IsValid(r6_65) then
      if UE4.UGameplayStatics.GetGameState(r6_65) and not r6_65.ServerInitSuccess then
        if not r6_65.TryInitActorInfo then
          DebugPrint("ERROR TryInitActorInfo:", r6_65:GetName())
        else
          r6_65:TryInitActorInfo("OnInit")
        end
      elseif not UE4.UGameplayStatics.GetGameState(r6_65) then
        local r7_65 = GWorld:GetAvatar()
        if r7_65 then
          r7_65:SendToFeiShuForRegionMgr(table.concat({
            "报错文本:\n\t",
            "机关名称：",
            r6_65:GetName(),
            "\n"
          }), "BPBorn初始化报错 | 未获取到GameState")
        else
          DebugPrint("Error: InitBPBornActor, NoGameState From This :", r6_65:GetName())
        end
      end
    end
  end
  -- close: r1_65
end
function r6_0.InitCustomActor(r0_66)
  -- line: [898, 903] id: 66
  for r5_66, r6_66 in pairs(r0_66.EMGameState.ClanManagerMap) do
    r6_66:InitClan()
  end
  -- close: r1_66
end
function r6_0.InitAutoActiveStaticCreator(r0_67)
  -- line: [905, 909] id: 67
  r0_67:TriggerActiveStaticCreator(r0_67.EMGameState.AutoActiveStaticIds)
  r0_67:TriggerActiveAutoPrivateStaticCreator()
  r0_67:TriggerFlexibleActiveStaticCreator()
end
function r6_0.GetIsOpenWroldRegion(r0_68)
  -- line: [911, 913] id: 68
  return GWorld:GetWorldRegionState()
end
function r6_0.IsCanTriggerRandomStaticCreator(r0_69, r1_69, r2_69)
  -- line: [944, 958] id: 69
  if not GWorld:GetWorldRegionState() then
    return true
  end
  if IsStandAlone(r0_69) and GWorld:GetAvatar() and r0_69:GetRegionDataMgrSubSystem():IsRandomIdControlByCacheNew(r1_69, r2_69) then
    return false
  end
  return true
end
function r6_0.OnPlayersDungeonEnd(r0_70, r1_70)
  -- line: [961, 998] id: 70
  local function r2_70(r0_71)
    -- line: [962, 987] id: 71
    local r1_71 = UE4.URuntimeCommonFunctionLibrary.GetPlayerControllerByAvatarEid(GWorld.GameInstance, r0_71)
    if r1_71 then
      local r2_71 = r1_71:GetMyPawn()
      if r2_71 then
        DebugPrint("Tianyi@ On Player Leave Dungeon")
        r2_71:RawRemoveAllBuff(true)
        r2_71:HandleRemoveModPassives()
        r2_71:ClearSummons(false)
        if r0_70:IsInDungeon() then
          UE4.UPhantomFunctionLibrary.CancelAllPhantomFromOwner(r2_71, EDestroyReason.PhantomExitDungeon)
          if r0_70:GetWCSubSystem() then
            UBattleFunctionLibrary.AddBuffToTarget(r2_71, r2_71, 308, -1, nil, nil, 1)
          end
        end
        local r3_71 = r2_71:IsDead()
        if r3_71 then
          r3_71 = UE4.ETeamRecoveryState.RealDead and UE4.ETeamRecoveryState.Alive
        else
          goto label_59	-- block#7 is visited secondly
        end
        r2_71:TryLeaveDying(r3_71)
        if not r2_71:IsDead() then
          r2_71:ResetIdle()
        end
        r0_70:TriggerDungeonComponentFun("Trigger" .. r0_70.EMGameState.GameModeType .. "PlayerDungeonEnd", r2_71)
      end
    end
  end
  if r1_70 and #r1_70 ~= 0 then
    for r7_70, r8_70 in ipairs(r1_70) do
      r2_70(r8_70)
    end
    -- close: r3_70
  else
    for r7_70, r8_70 in pairs(r0_70.LevelGameMode.AvatarInfos) do
      r2_70(r7_70)
    end
    -- close: r3_70
  end
end
function r6_0.TriggerFallingCallable(r0_72, r1_72, r2_72, r3_72, r4_72, r5_72, r6_72)
  -- line: [1066, 1084] id: 72
  if not IsValid(r1_72) then
    return 
  end
  if r1_72.TriggerFallingCallable then
    r1_72:TriggerFallingCallable(r0_72, r2_72, r3_72, r4_72, r5_72, r6_72)
  else
    local r7_72 = ScreenPrint
    local r8_72 = string.format
    local r9_72 = "This OtherActor has not function called TriggerFallingCallable.  ActorName:  %s,  UnitId:  %d,  Eid:  %d,  CreatorId:  %d"
    local r10_72 = r1_72:GetName() and "nil"
    local r11_72 = r1_72.UnitId and -1
    local r12_72 = r1_72.Eid and -1
    r7_72(r8_72(r9_72, r10_72, r11_72, r12_72, r1_72.CreatorId and -1))
  end
end
function r6_0.TriggerWaterFallingCallable(r0_73, r1_73, r2_73, r3_73, r4_73)
  -- line: [1086, 1102] id: 73
  if not IsValid(r1_73) then
    return 
  end
  if r1_73.TriggerWaterFallingCallable then
    r1_73:TriggerWaterFallingCallable(r0_73, r2_73, r3_73, r4_73)
  else
    local r5_73 = ScreenPrint
    local r6_73 = string.format
    local r7_73 = "This OtherActor has not function called TriggerWaterFallingCallable.  ActorName:  %s,  UnitId:  %d,  Eid:  %d,  CreatorId:  %d"
    local r8_73 = r1_73:GetName() and "nil"
    local r9_73 = r1_73.UnitId and -1
    local r10_73 = r1_73.Eid and -1
    r5_73(r6_73(r7_73, r8_73, r9_73, r10_73, r1_73.CreatorId and -1))
  end
end
function r6_0.SpawnDefaultPawnAtTransform(r0_74, r1_74, r2_74)
  -- line: [1119, 1125] id: 74
  DebugPrint("BP_EMGameMode_C:SpawnDefaultPawnAtTransform", r2_74)
  return UE4.URuntimeCommonFunctionLibrary.SpawnDefaultPawn(r1_74, r0_74:GetDefaultPawnClassForController(r1_74), r2_74, r0_74:GetInstigator())
end
function r6_0.GetCurrentQuestId(r0_75)
  -- line: [1128, 1140] id: 75
  local r1_75 = GWorld:GetAvatar()
  local r2_75 = UE4.TArray(0)
  if not r1_75 then
    return r2_75
  end
  for r8_75, r9_75 in pairs(r1_75:GetQuestDoing()) do
    r2_75:Add(r9_75)
  end
  -- close: r4_75
  return r2_75
end
function r6_0.SwitchToQuestRole(r0_76, r1_76, r2_76)
  -- line: [1142, 1203] id: 76
  local r3_76 = GWorld:GetAvatar()
  if r3_76 == nil then
    return 
  end
  local r4_76 = UE4.UGameplayStatics.GetPlayerCharacter(r0_76, 0)
  r4_76:RecoverBanSkills()
  local r5_76 = r4_76:GetController()
  local function r6_76()
    -- line: [1151, 1159] id: 77
    r4_76:ChangeRoleEffect()
    r4_76.FXComponent:PlayEffectByIDParams(401, {
      NotAttached = true,
      scale = Const.BattleCharTagVXScaleTable[r4_76:GetBattleCharBodyType()],
    })
  end
  if r1_76 == 0 then
    local r7_76 = r3_76.CurrentChar
    r4_76:ChangeRole(r3_76.Chars[r7_76].CharId, AvatarUtils:GetDefaultBattleInfo(r3_76))
    if r2_76 then
      r6_76()
    end
    if r4_76.RangedWeapon and r4_76.RangedWeapon:GetAttr("MagazineBulletNum") == 0 then
      r4_76.RangedWeapon:SetWeaponState("NoBullet", true)
    end
    EventManager:FireEvent(EventID.OnSwitchRole, r7_76)
    return 
  end
  if not DataMgr.QuestRoleInfo[r1_76] then
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, UE.EStoryLogType.Quest, "QuestRoleId不存在", "QuestRoleId不存在" .. "\n\t在调用SwitchToQuestRole的时候，传入的参数QuestRoleId 【" .. tostring(r1_76) .. "】 在QuestRoleInfo表中不存在，请查阅QuestRoleInfo表格")
    return 
  end
  local r8_76 = AvatarUtils:GetBattleInfoByQuestRoleId(r1_76, r3_76)
  if r8_76.RoleInfo then
    r8_76.RoleInfo.AvatarQuestRoleID = r1_76
  end
  r4_76:ChangeRole(nil, r8_76)
  if r2_76 then
    r6_76()
  end
  if r4_76.RangedWeapon and r4_76.RangedWeapon:GetAttr("MagazineBulletNum") == 0 then
    r4_76.RangedWeapon:SetWeaponState("NoBullet", true)
  end
  EventManager:FireEvent(EventID.OnSwitchRole)
end
function r6_0.SetNpcPatrol(r0_78, r1_78, r2_78)
  -- line: [1205, 1221] id: 78
  local r3_78 = r0_78.EMGameState.NpcCharacterMap:Find(r1_78)
  if not IsValid(r3_78) then
    print(_G.LogTag, "NpcMap no-exist this Npc", r1_78)
    return 
  end
  r3_78.PatrolId = r2_78
end
function r6_0.TriggerMechanism(r0_79, r1_79, r2_79, r3_79, r4_79)
  -- line: [1223, 1282] id: 79
  if r3_79 == true and not r0_79:IsSubGameMode() then
    r0_79.EMGameState:ShowDungeonError("TriggerMechanism PrivateEnable is true but IsSubGameMode:" .. r0_79:GetName(), Const.DungeonErrorType.GameMode, Const.DungeonErrorTitle.Other)
    return 
  end
  local r5_79 = r0_79.EMGameState:GetStaticCreatorInfo(r1_79, r3_79, r0_79.LevelName)
  if not IsValid(r5_79) then
    return 
  end
  local r6_79 = true
  if r5_79.ChildEids:Length() >= 2 then
    DebugPrint("Warning: 这个StaticCreator刷新了多个机关", r5_79.ChildEids:Length())
  end
  local r7_79 = false
  if r5_79.ChildEids:Length() > 0 then
    for r11_79 = 1, r5_79.ChildEids:Length(), 1 do
      local r12_79 = Battle(r0_79):GetEntity(r5_79.ChildEids:GetRef(r11_79))
      if IsValid(r12_79) then
        print(_G.LogTag, "LXZ TriggerMechanism444", r12_79:GetName())
        if r12_79:IsCombatItemBase() then
          r7_79 = true
          r12_79:ChangeState("Manual", 0, r2_79)
          if r12_79.RegionDataType == ERegionDataType.RDT_CommonQuestData then
            r12_79.QuestId = r4_79
          end
        end
      else
        local r14_79 = DataMgr.MechanismState[r0_79.EMGameState.MechanismStateIdMap:Find(r1_79)]
        if r14_79 and r14_79.StateEvent then
          for r19_79, r20_79 in pairs(r14_79.StateEvent) do
            if r20_79.NextStateId == r2_79 and r20_79.TypeNextState.Type == "Manual" then
              r7_79 = true
              break
            end
          end
          -- close: r15_79
        end
      end
    end
  elseif r5_79.CreatedWorldRegionEid ~= "" then
    local r8_79, r9_79 = r0_79:GetRegionDataMgrSubSystem():TryGetLuaDataIndex(r5_79.CreatedWorldRegionEid)
    if r9_79 then
      local r10_79 = r0_79:GetRegionDataMgrSubSystem():GetStateIdByWorldRegionEid(r8_79)
      if r10_79 == -1 then
        r10_79 = DataMgr.Mechanism[r5_79.UnitId].FirstStateId
      end
      local r11_79 = DataMgr.MechanismState[r10_79]
      if r11_79 and r11_79.StateEvent then
        for r16_79, r17_79 in pairs(r11_79.StateEvent) do
          if r17_79.NextStateId == r2_79 and r17_79.TypeNextState.Type == "Manual" then
            r7_79 = true
          end
        end
        -- close: r12_79
      end
    end
  end
  if r5_79.CreatedWorldRegionEid ~= "" and r7_79 then
    r0_79:GetRegionDataMgrSubSystem():ChangeState(r5_79.CreatedWorldRegionEid, r2_79)
  end
end
function r6_0.TriggerMechanismArray(r0_80, r1_80, r2_80, r3_80, r4_80)
  -- line: [1284, 1288] id: 80
  for r9_80, r10_80 in pairs(r1_80) do
    r0_80:TriggerMechanism(r10_80, r2_80, r3_80, r4_80)
  end
  -- close: r5_80
end
function r6_0.TriggerPetStateChange(r0_81, r1_81, r2_81, r3_81)
  -- line: [1290, 1307] id: 81
  if r3_81 == true and not r0_81:IsSubGameMode() then
    r0_81.EMGameState:ShowDungeonError("TriggerPetStateChange PrivateEnable is true but IsSubGameMode: " .. r0_81:GetName(), Const.DungeonErrorType.Pet, Const.DungeonErrorTitle.Config)
    return 
  end
  local r4_81 = r0_81.EMGameState:GetStaticCreatorInfo(r1_81, r3_81, r0_81.LevelName)
  if not IsValid(r4_81) then
    r0_81.EMGameState:ShowDungeonError("TriggerPetStateChange Can Not Find StaticCreator: " .. r1_81 .. " PrivateEnable: " .. r3_81, Const.DungeonErrorType.Pet, Const.DungeonErrorTitle.FindObject)
    return 
  end
  for r8_81 = 1, r4_81.ChildEids:Length(), 1 do
    local r9_81 = Battle(r0_81):GetEntity(r4_81.ChildEids:GetRef(r8_81))
    if IsValid(r9_81) and r9_81:IsPetNpc() then
      r9_81:SetInteractiveState(r2_81)
    end
  end
end
function r6_0.PetPlayFailureMontage(r0_82, r1_82, r2_82)
  -- line: [1309, 1322] id: 82
  r0_82.LevelGameMode:AddDungeonEvent("PetPlayFailureMontage")
end
function r6_0.TriggerPetMechanismState(r0_83, r1_83, r2_83, r3_83)
  -- line: [1324, 1333] id: 83
  if r0_83:IsSubGameMode() then
    r0_83.EMGameState:ShowDungeonError("在子GameMode使用了TriggerPetMechanismState: " .. r0_83:GetName(), Const.DungeonErrorType.Pet, Const.DungeonErrorTitle.Config)
    return 
  end
  if not IsValid(r0_83.RandomPetCreator) then
    r0_83.EMGameState:ShowDungeonError("TriggerPetMechanismState RandomPetCreator无效: " .. r0_83:GetName(), Const.DungeonErrorType.Pet, Const.DungeonErrorTitle.Config)
  end
  r0_83:TriggerMechanism(r0_83.RandomPetCreator.StaticCreatorId, r1_83, r2_83, r3_83)
end
function r6_0.TriggerPetStateChangeMain(r0_84, r1_84, r2_84)
  -- line: [1335, 1349] id: 84
  if r0_84:IsSubGameMode() then
    r0_84.EMGameState:ShowDungeonError("在子GameMode使用了TriggerPetStateChangeMain: " .. r0_84:GetName(), Const.DungeonErrorType.Pet, Const.DungeonErrorTitle.Config)
    return 
  end
  if not IsValid(r0_84.RandomPetCreator) then
    r0_84.EMGameState:ShowDungeonError("TriggerPetStateChangeMain RandomPetCreator无效: " .. r0_84:GetName(), Const.DungeonErrorType.Pet, Const.DungeonErrorTitle.Config)
  end
  for r6_84 = 1, r0_84.RandomPetCreator.ChildEids:Length(), 1 do
    local r7_84 = Battle(r0_84):GetEntity(r0_84.RandomPetCreator.ChildEids:GetRef(r6_84))
    if IsValid(r7_84) and r7_84:IsPetNpc() then
      r7_84:SetInteractiveState(r1_84)
    end
  end
end
function r6_0.PetPlayFailureMontageMain(r0_85, r1_85)
  -- line: [1351, 1353] id: 85
  r0_85.LevelGameMode:AddDungeonEvent("PetPlayFailureMontage")
end
function r6_0.OnTriggerMechanismManualItem(r0_86, r1_86, r2_86, r3_86, r4_86)
  -- line: [1355, 1380] id: 86
  if r0_86:IsSubGameMode() and not r0_86:IsInRegion() then
    print(_G.LogTag, "LXZ OnTriggerMechanismManualItem", r2_86)
    return 
  end
  for r8_86 = 1, r1_86:Length(), 1 do
    local r9_86 = r0_86.EMGameState.ManualActiveCombat:Find(r1_86[r8_86])
    if not IsValid(r9_86) then
      GWorld.logger.error("哦我的上帝，这里有一个ManualItemId" .. r1_86[r8_86] .. "找不到它亲爱的机关实体，亲爱的策划能改一下gamemode配置吗")
    end
    if IsValid(r9_86) then
      if r9_86.ChangeToState then
        r9_86:ChangeToState(r3_86)
      end
      if r2_86 ~= 0 then
        r9_86:ChangeState("Manual", 0, r2_86)
      end
      if r9_86.RegionDataType == ERegionDataType.RDT_QuestCommonData then
        r9_86.QuestId = r4_86
      end
    end
  end
end
function r6_0.OnTriggerMechanismMonsterNest(r0_87, r1_87, r2_87, r3_87, r4_87, r5_87, r6_87, r7_87)
  -- line: [1382, 1400] id: 87
  if r0_87:IsSubGameMode() then
    return 
  end
  for r12_87, r13_87 in pairs(r1_87) do
    local r14_87 = r0_87.EMGameState.ManualActiveCombat:Find(r13_87)
    if not IsValid(r14_87) then
      GWorld.logger.error("哦我的上帝，这里有一个ManualItemId" .. r1_87 .. "找不到它亲爱的机关实体，亲爱的策划能改一下gamemode配置吗")
    end
    r14_87.MonsterNum = r2_87
    r14_87.MonsterSpawnInterval = r3_87
    r14_87.MonsterUnitId = r4_87
    r14_87.MonsterUnitType = r5_87
    r14_87.MonsterPresetTarget = r6_87
    r14_87.MonsterPresetTargetId = r7_87
    DebugPrint("thy      OnTriggerMechanismMonsterNest")
  end
  -- close: r8_87
end
function r6_0.GetHLODDistance(r0_88, r1_88)
  -- line: [1402, 1415] id: 88
  if not Const.bOverrideHLODDistance then
    return -1
  end
  local r2_88 = 5000
  local r3_88 = UE4.UUIFunctionLibrary.GetDevicePlatformName(r0_88)
  if r3_88 == "Android" then
    r2_88 = Const.HLODDistanceAndroid[r1_88]
    if r2_88 then
      r2_88 = r2_88
    end
  else
    r2_88 = Const.HLODDistanceDefault[r1_88]
    if r2_88 then
      r2_88 = r2_88
    end
  end
  DebugPrint("BP_EMGameMode_C:GetHLODDistance PlatformName: ", r3_88, "Distance: ", r2_88)
  return r2_88
end
function r6_0.OnTriggerDestroyMonsterInMonsterNest(r0_89, r1_89)
  -- line: [1417, 1430] id: 89
  if r0_89:IsSubGameMode() then
    return 
  end
  for r5_89 = 1, r1_89:Length(), 1 do
    local r6_89 = r0_89.EMGameState.ManualActiveCombat:Find(r1_89[r5_89])
    if not IsValid(r6_89) or not r6_89:IsCombatItemBase("MonsterNest") then
      GWorld.logger.error("哦我的上帝，这里有一个ManualItemId" .. r1_89[r5_89] .. "找不到它亲爱的MonsterNest，亲爱的策划能改一下gamemode配置吗")
    end
    if IsValid(r6_89) then
      r6_89:DestroyAllMonster()
    end
  end
end
function r6_0.InitBPVars(r0_90, r1_90)
  -- line: [1432, 1451] id: 90
  if GWorld.GameInstance:IsInTempScene() then
    DebugPrint("BP_EMGameMode_C 结算场景 不初始化策划配表赋值蓝图变量")
    return 
  end
  local r2_90 = r1_90.BPOverrideVars
  if not r2_90 then
    return 
  end
  for r7_90, r8_90 in pairs(r2_90) do
    if r0_90[r7_90] ~= nil then
      r0_90[r7_90] = r8_90
      DebugPrint("BP_EMGameMode_C 初始化策划配表赋值蓝图变量: ", r7_90, r8_90)
    else
      ScreenPrint("BP_EMGameMode_C 初始化策划配表赋值蓝图变量: 不存在的变量 " .. r7_90)
    end
  end
  -- close: r3_90
end
function r6_0.InitEmergencyMonster(r0_91)
  -- line: [1453, 1471] id: 91
  r0_91.NeedTreasureMonster = false
  r0_91.TreasureMonsterCreated = false
  r0_91.NeedButcherMonster = false
  r0_91.ButcherMonsterCreated = false
  r0_91.NeedPetMonster = false
  r0_91.PetMonsterCreated = false
  r0_91.TreasureMonsterSpawnInterval = 3
  r0_91.ButcherMonsterSpawnInterval = 5
  r0_91.EmergencyMonsterSpawnLoc = {
    RandomTime = 5,
    MaxDistance = 1000,
    MaxZDistance = 500,
  }
end
function r6_0.GetCreateEmergencyMonsterInterval(r0_92, r1_92)
  -- line: [1473, 1475] id: 92
  return r0_92[r1_92 .. "MonsterSpawnInterval"]
end
function r6_0.GetNeedCreateEmergencyMonster(r0_93, r1_93)
  -- line: [1477, 1479] id: 93
  local r2_93 = r0_93["Need" .. r1_93 .. "Monster"]
  if r2_93 == true then
    r2_93 = r0_93[r1_93 .. "MonsterCreated"] == false
  else
    goto label_13	-- block#2 is visited secondly
  end
  return r2_93
end
function r6_0.InitCreateEmergencyMonsterProb(r0_94, r1_94, r2_94, r3_94)
  -- line: [1481, 1496] id: 94
  if r2_94 == nil then
    DebugPrint("InitCreateEmergencyMonsterProb: GameMode Componet 不存在！")
    return 
  end
  if r3_94 == nil then
    DebugPrint("InitCreateEmergencyMonsterProb: DungeonInfo 不存在！")
    return 
  end
  local r4_94 = r3_94[r1_94 .. "MonsterSpawnProbability"]
  if r4_94 == nil then
    DebugPrint("InitCreateEmergencyMonsterProb: " .. r1_94 .. "怪信息不存在！")
    return 
  end
  r2_94["Current" .. r1_94 .. "MonsterProb"] = r4_94[1]
end
function r6_0.CreateEmergencyMonsterEachWave(r0_95, r1_95, r2_95, r3_95)
  -- line: [1498, 1529] id: 95
  if r2_95 == nil then
    return 
  end
  if r3_95 == nil then
    return 
  end
  local r4_95 = r3_95[r1_95 .. "MonsterSpawnProbability"]
  if r4_95 == nil then
    return 
  end
  local r5_95 = r3_95[r1_95 .. "MonsterSpawnMinWave"]
  if r5_95 == nil then
    return 
  end
  if r0_95:GetNeedCreateEmergencyMonster(r1_95) == false then
    return 
  end
  local r6_95 = r2_95:GetWaveIndex()
  if r6_95 and r6_95 < r5_95 then
    return 
  end
  local r7_95 = "Current" .. r1_95 .. "MonsterProb"
  if r2_95[r7_95] == nil then
    return 
  end
  if r2_95[r7_95] < math.random() then
    r2_95[r7_95] = r2_95[r7_95] + r4_95[2]
    return 
  end
  r0_95:TryCreateEmergencyMonster(r1_95)
end
function r6_0.TryCreateEmergencyMonster(r0_96, r1_96)
  -- line: [1531, 1587] id: 96
  local r2_96 = DataMgr[r0_96.EMGameState.GameModeType]
  if r2_96 == nil then
    return 
  end
  local r3_96 = r2_96[r0_96.DungeonId]
  if r3_96 == nil then
    return 
  end
  local r4_96 = r3_96[r1_96 .. "MonsterId"]
  if r4_96 == nil then
    return 
  end
  local r5_96 = r0_96.LevelGameMode:GetLevelLoader()
  if r5_96 == nil then
    return 
  end
  if not IsValid(r0_96:GetOneRandomPlayer()) then
    DebugPrint("TryCreateEmergencyMonster, 玩家不存在, 本次不创建！")
    return 
  end
  local r7_96 = r0_96:GetOneRandomPlayer().CurrentLocation
  local r8_96 = UKismetMathLibrary.Vector_Zero()
  local r9_96 = false
  for r13_96 = 1, r0_96.EmergencyMonsterSpawnLoc.RandomTime, 1 do
    if UNavigationSystemV1.K2_GetRandomLocationInNavigableRadius(r0_96, r7_96, r8_96, r0_96.EmergencyMonsterSpawnLoc.MaxDistance) == true and math.abs(r7_96.Z - r8_96.Z) <= r0_96.EmergencyMonsterSpawnLoc.MaxZDistance and r5_96:GetLevelIdByLocation(r7_96) == r5_96:GetLevelIdByLocation(r8_96) and UNavigationFunctionLibrary.CheckTwoPosHasPath(r7_96, r8_96, r0_96) == EPathConnectType.HasPath then
      r9_96 = true
      break
    end
  end
  if r9_96 == false then
    r8_96 = r0_96:GetMonsterCustomLoc(nil)
  end
  if UKismetMathLibrary.EqualEqual_VectorVector(r8_96, UKismetMathLibrary.Vector_Zero(), 0.001) == false then
    local r10_96 = AEventMgr.CreateUnitContext()
    r10_96.UnitType = "Monster"
    r10_96.UnitId = r4_96
    r10_96.Loc = r8_96
    r10_96.IntParams:Add("Level", r0_96:GetFixedGamemodeLevel())
    r10_96.MonsterSpawn = r0_96.LevelGameMode.FixedMonsterSpawn
    r0_96.EMGameState.EventMgr:CreateUnitNew(r10_96, false)
    r0_96[r1_96 .. "MonsterCreated"] = true
  end
end
function r6_0.OnRandomCreateSpawn(r0_97, r1_97, r2_97)
  -- line: [1589, 1590] id: 97
end
function r6_0.ShowMessage(r0_98, r1_98, r2_98)
  -- line: [1592, 1611] id: 98
  local r4_98 = UE4.UGameplayStatics.GetGameInstance(r0_98):GetGameUIManager()
  if r4_98 == nil then
    return 
  end
  if r1_98 ~= nil and r2_98 ~= nil then
    local r5_98 = r4_98:GetUIObj("GuideTextFloat")
    if r5_98 == nil then
      r5_98 = r4_98:LoadUI(UIConst.GUIDETEXTFLOAT, "GuideTextFloat", UIConst.ZORDER_FOR_COMMON_TIP)
    end
    r5_98:AddGuideMessage(r1_98, r2_98)
  end
end
function r6_0.HideMessage(r0_99, r1_99)
  -- line: [1613, 1621] id: 99
  local r3_99 = UE4.UGameplayStatics.GetGameInstance(r0_99):GetGameUIManager()
  local r4_99 = r3_99:GetUIObj("GuideTextFloat")
  if r3_99 == nil or r4_99 == nil then
    return 
  end
  r4_99:DeleteGuideMessage(r1_99)
end
function r6_0.GetItemType(r0_100, r1_100)
  -- line: [1623, 1629] id: 100
  if not DataMgr.Mechanism[r1_100] then
    return ""
  end
  return DataMgr.Mechanism[r1_100].UnitRealType
end
function r6_0.UpdateDungeonProgress(r0_101)
  -- line: [1631, 1661] id: 101
  r0_101.EMGameState:SetDungeonProgress(r0_101.EMGameState.DungeonProgress + 1)
  DebugPrint("DungeonProgress 副本轮次 +1，当前轮次:", r0_101.EMGameState.DungeonProgress)
  local r1_101 = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if r1_101 and r1_101.BattleAchievement then
    r1_101.BattleAchievement:UpdateTopProcessedValue()
  end
  r0_101:TriggerUploadDungeonAchievement()
  if IsDedicatedServer(r0_101) then
    if GWorld.bDebugServer then
      return 
    end
    local r2_101 = GWorld:GetDSEntity()
    if r2_101 then
      r2_101:UpdateDungeonProgress()
    end
  else
    local r2_101 = GWorld:GetAvatar()
    if r2_101 then
      r2_101:UpdateDungeonProgress()
    end
  end
end
function r6_0.ExecuteLogicBetweenRounds(r0_102)
  -- line: [1663, 1671] id: 102
  if r0_102:IsWalnutDungeon() then
    r0_102:TriggerShowWalnutReward()
  else
    r0_102:ExecuteLogicStartDungeonVote()
  end
end
function r6_0.ExecuteLogicStartDungeonVote(r0_103)
  -- line: [1676, 1684] id: 103
  r0_103:UpdateDungeonProgress()
  if r0_103:CheckDungeonProgressIsMaxRound() then
    return 
  end
  r0_103:RecordProgressDataWithStageInfo("OnVoteBegin")
  r0_103:TriggerDungeonComponentFun("TriggerDungeonVoteBegin")
  r0_103:SetGamePaused("GameModeState", true)
end
function r6_0.ExecuteNextStepOfDungeonVote(r0_104)
  -- line: [1686, 1693] id: 104
  if r0_104:IsTicketDungeon() then
    r0_104:TriggerShowTicket()
  else
    r0_104:ExecuteNextStepOfTicket()
  end
end
function r6_0.ExecuteNextStepOfTicket(r0_105)
  -- line: [1695, 1706] id: 105
  r0_105.EMGameState.IsInSelectTicket = false
  r0_105.EMGameState.NextTicketPlayer:Clear()
  UE.UMapSyncHelper.SyncMap(r0_105.EMGameState, "NextTicketPlayer")
  if r0_105:IsWalnutDungeon() then
    r0_105:TriggerShowNextWalnut()
  else
    r0_105:TriggerActiveGameModeState(Const.StateBattleProgress)
  end
end
function r6_0.BpOnTimerEnd_OnDungeonVoteBegin(r0_106)
  -- line: [1708, 1710] id: 106
  r0_106.EMGameState:DealDungeonVoteResult()
end
function r6_0.BpOnTimerEnd_SelectTicket(r0_107)
  -- line: [1712, 1714] id: 107
  r0_107.EMGameState:DealDungeonTicketResult()
end
function r6_0.IsEndlessDungeon(r0_108)
  -- line: [1716, 1724] id: 108
  if r0_108.IsDungeonTypeEndless == nil then
    local r1_108 = DataMgr.Dungeon[r0_108.DungeonId]
    if r1_108 then
      r0_108.IsDungeonTypeEndless = r1_108.DungeonWinMode == r0_0.DungeonWinMode.Endless
    end
  end
  return r0_108.IsDungeonTypeEndless
end
function r6_0.DungeonFinish_OnPlayerRealDead(r0_109, r1_109)
  -- line: [1736, 1753] id: 109
  local r2_109 = GWorld:GetAvatar()
  if r2_109 and r2_109:IsInRougeLike() then
    DebugPrint("EMGameMode:DungeonFinish_OnPlayerRealDead RougeLike")
    r0_109:FinishRougeLike(false, r1_109)
  elseif r0_109:IsAbyssDungeon() then
    local r3_109 = r0_109:TriggerDungeonComponentFun("IsReEnteringAbyss")
    DebugPrint("EMGameMode:DungeonFinish_OnPlayerRealDead Abyss IsReEntering", r3_109)
    if r3_109 then
      return 
    end
    r0_109:TriggerPlayerFailed(r1_109)
  else
    DebugPrint("EMGameMode:DungeonFinish_OnPlayerRealDead Default")
    r0_109:TriggerPlayerFailed(r1_109)
  end
end
function r6_0.IsDungeonInSettlement(r0_110)
  -- line: [1755, 1770] id: 110
  if not r0_110.EMGameState:CheckGameModeStateEnable() then
    DebugPrint("BP_EMGameMode_C:副本状态不正确 多次触发副本结算")
    return true
  end
  local r1_110 = GWorld:GetAvatar()
  if r1_110 and r1_110:IsInHardBoss() and r0_110.LevelGameMode.IsInHardBossSettlement then
    DebugPrint("BP_EMGameMode_C:正处于mycs 多次触发副本结算")
    return true
  end
  return false
end
function r6_0.TriggerDungeonWin(r0_111)
  -- line: [1773, 1780] id: 111
  DebugPrint("BP_EMGameMode_C:TriggerDungeonWin 副本胜利")
  if r0_111:IsDungeonInSettlement() then
    return 
  end
  r0_111.LevelGameMode:TriggerDungeFinish(true)
end
function r6_0.TriggerDungeonFailed(r0_112)
  -- line: [1783, 1790] id: 112
  DebugPrint("BP_EMGameMode_C:TriggerDungeonFailed 副本失败")
  if r0_112:IsDungeonInSettlement() then
    return 
  end
  r0_112.LevelGameMode:TriggerDungeFinish(false)
end
function r6_0.TriggerExitDungeon(r0_113, r1_113)
  -- line: [1793, 1800] id: 113
  DebugPrint("BP_EMGameMode_C:TriggerExitDungeon: Exit Battle + HardBoss", r1_113)
  if r0_113:IsDungeonInSettlement() then
    return 
  end
  r0_113.LevelGameMode:TriggerDungeFinish(r1_113)
end
function r6_0.TriggerPlayerWin(r0_114, r1_114, r2_114)
  -- line: [1804, 1817] id: 114
  DebugPrint("BP_EMGameMode_C:TriggerPlayerWin 玩家成功 撤离")
  if r0_114:IsDungeonInSettlement() then
    return 
  end
  if IsStandAlone(r0_114) then
    r0_114:TriggerBattleAchievementUploadOnDungeonEnd(true)
    r0_114:TriggerDungeonOnEnd(true)
  end
  r0_114:TriggerUploadDungeonAchievement(r2_114)
  r0_114.LevelGameMode:TriggerPlayerFinish(true, r1_114)
end
function r6_0.TriggerPlayerFailed(r0_115, r1_115)
  -- line: [1820, 1831] id: 115
  DebugPrint("BP_EMGameMode_C:TriggerPlayerFailed 玩家失败 撤离")
  if r0_115:IsDungeonInSettlement() then
    return 
  end
  if IsStandAlone(r0_115) then
    r0_115:TriggerBattleAchievementUploadOnDungeonEnd(false)
    r0_115:TriggerDungeonOnEnd(false)
  end
  r0_115.LevelGameMode:TriggerPlayerFinish(false, r1_115)
end
function r6_0.ForceFinishPlayerByFailed(r0_116, r1_116)
  -- line: [1836, 1839] id: 116
  DebugPrint("BP_EMGameMode_C:ForceFinishPlayerByFailed 强制玩家以失败结算")
  r0_116.LevelGameMode:TriggerPlayerFinish(false, r1_116)
end
function r6_0.TriggerDungeFinish(r0_117, r1_117)
  -- line: [1843, 1854] id: 117
  GWorld:DSBLog("Info", "TriggerDungeFinish IsWin:" .. tostring(r1_117), "GameMode")
  r0_117:TriggerDungeonOnEnd(r1_117)
  if r1_117 and r0_117:IsWalnutDungeon() and not r0_117:IsEndlessDungeon() then
    r0_117:ExecuteWalutLogicOnEnd()
  else
    r0_117:TriggerRealDungeFinish(r1_117)
  end
end
function r6_0.TriggerRealDungeFinish(r0_118, r1_118)
  -- line: [1856, 1874] id: 118
  local r2_118 = DataMgr.Dungeon[r0_118.DungeonId]
  if r1_118 then
    if r2_118 and r2_118.DungeonWinMode == r0_0.DungeonWinMode.Single then
      r0_118:UpdateDungeonProgress()
    end
    if r2_118 and r2_118.DungeonWinMode == r0_0.DungeonWinMode.Disable then
      local r3_118 = r0_118:GetDungeonComponent().RewardLevel
      if r3_118 then
        for r7_118 = 1, r3_118, 1 do
          r0_118:UpdateDungeonProgress()
        end
      end
    end
    r0_118:TriggerUploadDungeonAchievement()
  end
  r0_118:TriggerBattleAchievementUploadOnDungeonEnd(r1_118)
  r0_118:TriggerPlayerFinish(r1_118)
end
function r6_0.TriggerPlayerFinish(r0_119, r1_119, r2_119)
  -- line: [1878, 1910] id: 119
  GWorld:DSBLog("Info", "TriggerPlayerFinish IsWin:" .. tostring(r1_119), "GameMode")
  DebugPrint("TriggerPlayerFinish 玩家结算，结算状态：", r1_119)
  if IsStandAlone(r0_119) or r5_0.IsListenServer(r0_119) then
    local r3_119 = GWorld:GetAvatar()
    if r3_119 then
      print(_G.LogTag, "CollectAlertBaseInfo Server TriggerPlayerFinish", r1_119, r0_119.DungeonId)
      r0_119:TriggerPlayerFinishDungeon(r1_119)
      r3_119:BattleFinish(r1_119)
    end
    r0_119:NotifyClientGameEnd(r1_119, r2_119)
    r0_119:OnPlayersDungeonEnd(r2_119)
  elseif IsDedicatedServer(r0_119) then
    print(_G.LogTag, "Server TriggerPlayerFinish", r1_119)
    if GWorld.bDebugServer then
      return 
    end
    local r3_119 = GWorld:GetDSEntity()
    if r3_119 then
      r3_119:BattleFinish(r1_119, r2_119)
    end
  end
end
function r6_0.SendTimeDistCheatalert(r0_120, r1_120, r2_120, r3_120, r4_120, r5_120, r6_120, r7_120)
  -- line: [1911, 1950] id: 120
  local r8_120 = "检测到非法信息:  "
  local r9_120 = r0_120:CollectAlertBaseInfo(r1_120)
  if r9_120.DungeonId then
    r8_120 = r8_120 .. "副本ID: " .. r9_120.DungeonId .. "  "
  end
  if r9_120.DungeonLevel then
    r8_120 = r8_120 .. "副本等级: " .. r9_120.DungeonLevel .. "  "
  end
  if r9_120.CharLevel then
    r8_120 = r8_120 .. "角色等级: " .. r9_120.CharLevel .. "  "
  end
  if r4_120 then
    r8_120 = r8_120 .. "MonitorType: " .. r4_120 .. "  "
  end
  if r5_120 then
    r8_120 = r8_120 .. "SubID: " .. r5_120 .. "  "
  end
  if r2_120 then
    r8_120 = r8_120 .. "副本耗时: " .. r2_120 .. "  "
  end
  if r7_120 then
    r8_120 = r8_120 .. "时间阈值: " .. r7_120 .. "  "
  end
  if r3_120 then
    r8_120 = r8_120 .. "主控角色移动距离: " .. r3_120 .. "  "
  end
  if r6_120 then
    r8_120 = r8_120 .. "距离阈值: " .. r6_120 .. "  "
  end
  local r10_120 = GWorld:GetAvatar()
  if not r10_120 then
    return 
  end
  print(_G.LogTag, "SendTimeDistCheatalert", r8_120)
  r10_120:SendToFeishuForCombatMonitor(r8_120)
end
function r6_0.CollectAlertBaseInfo(r0_121, r1_121)
  -- line: [1951, 1967] id: 121
  local r2_121 = {}
  if not r0_121.LevelGameMode then
    print(_G.LogTag, "CollectAlertBaseInfo LevelGameMode is nil")
    return r2_121
  end
  r2_121.DungeonId = r0_121.LevelGameMode.DungeonId
  local r3_121 = DataMgr.Dungeon[r2_121.DungeonId]
  if not r3_121 then
    print(_G.LogTag, "CollectAlertBaseInfo DungeonInfo is nil", r2_121.DungeonId, r0_121.DungeonId)
    return r2_121
  end
  r2_121.DungeonLevel = r3_121.DungeonLevel and 1
  r2_121.CharLevel = r1_121:GetAttr("Level") and 0
  print(_G.LogTag, "CollectAlertBaseInfo", r2_121.DungeonId, r2_121.DungeonLevel, r2_121.CharLevel, r1_121:GetAttr("Level"))
  return r2_121
end
function r6_0.NotifyClientFightAttributeData(r0_122, r1_122)
  -- line: [1970, 2000] id: 122
  if not IsDedicatedServer(r0_122) then
    return 
  end
  local r2_122 = r1_122 and r1_122:GetFightAttributeSet()
  if not r2_122 then
    return 
  end
  for r6_122 = 1, r0_122:GetPlayerNum(), 1 do
    local r9_122 = UE4.UGameplayStatics.GetPlayerController(r0_122, r6_122 + -1):GetMyPawn()
    if r9_122 and r9_122.Eid ~= r1_122.Eid then
      local r10_122 = FTeammateAttrInfo()
      r10_122.TeammateEid = r9_122.Eid
      r10_122.FinalDamage = r9_122:GetFinalDamage()
      r10_122.TotalKillCount = r9_122:GetTotalKillCount()
      r10_122.TakedDamage = r9_122:GetTakedDamage()
      r10_122.GiveHealing = r9_122:GetGiveHealing()
      r10_122.MaxDamage = r9_122:GetMaxDamage()
      r10_122.BreakableItemCount = r9_122:GetBreakableItemCount()
      r10_122.MaxComboCount = r9_122:GetMaxComboCount()
      local r11_122 = r9_122:GetPhantomAttrInfos()
      if r11_122:Num() > 0 then
        r10_122.PhantomAttrInfo = r11_122[1]
      end
      r2_122:AddTeammateDamageInfos(r10_122)
    end
  end
  r2_122:RefreshFightAttributeData()
end
function r6_0.NotifyClientGameEnd(r0_123, r1_123, r2_123)
  -- line: [2003, 2055] id: 123
  if not r2_123 or #r2_123 == 0 then
    for r6_123 = 1, r0_123:GetPlayerNum(), 1 do
      local r7_123 = r6_123 + -1
      local r8_123 = UE4.UGameplayStatics.GetPlayerController(r0_123, r7_123)
      if not r8_123 then
        error("Controller is Not Exist")
      end
      local r9_123 = GWorld:GetAvatar()
      if r1_123 and (not r9_123 or not r9_123:IsInHardBoss()) then
        r0_123:UpdatePlayerCharacterEndPointInfo(r7_123, r8_123)
        DebugPrint("StartAndEndPoint AllSuccess UpdatePlayerCharacterEndPointInfo")
      end
      local r10_123 = r8_123:GetMyPawn()
      if IsStandAlone(r0_123) then
        DebugPrint("StartAndEndPoint AllSuccess NotifyClientGameEnd_Lua")
        r8_123:NotifyClientGameEnd_Lua(r1_123, r0_123:GetScenePlayersInfo(r10_123))
      else
        DebugPrint("StartAndEndPoint AllSuccess NotifyClientGameEnd")
        r0_123:NotifyClientFightAttributeData(r10_123)
        r8_123:NotifyClientGameEnd(r1_123, r0_123:GetScenePlayersInfo(r10_123))
      end
    end
  else
    local function r3_123(r0_124)
      -- line: [2032, 2049] id: 124
      local r1_124 = UE4.URuntimeCommonFunctionLibrary.GetPlayerControllerByAvatarEid(r0_123, r0_124)
      if not r1_124 then
        DebugPrint("Controller is Not Exist")
        return 
      end
      if r1_123 then
        r0_123:UpdatePlayerCharacterEndPointInfo(UE4.URuntimeCommonFunctionLibrary.GetPlayerControllerIndex(r0_123, r1_124), r1_124)
        DebugPrint("StartAndEndPoint PartSuccess UpdatePlayerCharacterEndPointInfo")
      end
      DebugPrint("StartAndEndPoint PartSuccess NotifyClientGameEnd")
      local r2_124 = r1_124:GetMyPawn()
      r0_123:NotifyClientFightAttributeData(r2_124)
      r1_124:NotifyClientGameEnd(r1_123, r0_123:GetScenePlayersInfo(r2_124))
    end
    for r8_123, r9_123 in ipairs(r2_123) do
      r3_123(r9_123)
    end
    -- close: r4_123
  end
end
function r6_0.SimplifyInfoForInit(r0_125, r1_125)
  -- line: [2057, 2064] id: 125
  if r1_125 == nil then
    DebugPrint("Error SimplifyInfoForInit InfoForInit is nil")
    return r1_125
  end
  r1_125.FromOtherWorld = true
  return r1_125
end
function r6_0.GetScenePlayersInfo(r0_126, r1_126)
  -- line: [2067, 2133] id: 126
  local r2_126 = {}
  if r0_126.EMGameState.GameModeType == "Party" then
    local r3_126 = r0_126.EMGameState.PartyPlayerOrdinal
    for r7_126 = 1, r3_126:Length(), 1 do
      local r8_126 = r3_126[r7_126]
      local r9_126 = Battle(r0_126):GetEntity(r8_126)
      if r9_126 then
        local r10_126 = r9_126:IsPhantom()
        r2_126[#r2_126 + 1] = r0_126:SimplifyInfoForInit(r9_126.InfoForInit)
        r2_126[#r2_126].IsDungeonEnd = true
        r2_126[#r2_126].IsPhantom = r10_126
        local r11_126 = r9_126:GetCurrentWeapon()
        if r11_126 then
          r2_126[#r2_126].CurrentWeaponType = r11_126:GetWeaponType()
          r2_126[#r2_126].CurrentWeaponMeleeOrRanged = r11_126:GetWeaponMeleeOrRanged()
        end
        if r1_126.Eid == r8_126 then
          r2_126[#r2_126].IsMainPlayer = true
        else
          r2_126[#r2_126].IsMainPlayer = false
          r2_126[#r2_126].IsSettlementOtherRole = true
        end
      end
    end
  else
    r2_126[1] = r0_126:SimplifyInfoForInit(r1_126.InfoForInit)
    r2_126[1].IsDungeonEnd = true
    r2_126[1].IsMainPlayer = true
    r2_126[1].IsDead = r1_126:IsDead()
    local r3_126 = r1_126:GetCurrentWeapon()
    if r3_126 then
      r2_126[1].CurrentWeaponType = r3_126:GetWeaponType()
      r2_126[1].CurrentWeaponMeleeOrRanged = r3_126:GetWeaponMeleeOrRanged()
    end
    print(_G.LogTag, "GetScenePlayersInfo", r1_126:GetAllTeammates():Length())
    for r8_126, r9_126 in pairs(r1_126:GetAllTeammates()) do
      if r9_126 ~= r1_126 then
        local r10_126 = r9_126.InfoForInit
        if r10_126 == nil then
          r10_126 = r9_126.CreateUnitContextCopy:GetLuaTable("AvatarInfo")
        end
        local r11_126 = r9_126:IsPhantom()
        r2_126[#r2_126 + 1] = r0_126:SimplifyInfoForInit(r10_126)
        r2_126[#r2_126].IsDungeonEnd = true
        r2_126[#r2_126].IsPhantom = r11_126
        r2_126[#r2_126].IsMainPlayer = false
        r2_126[#r2_126].IsSettlementOtherRole = true
        r2_126[#r2_126].IsDead = r9_126:IsDead()
        local r12_126 = r9_126:GetCurrentWeapon()
        if r12_126 then
          r2_126[#r2_126].CurrentWeaponType = r12_126:GetWeaponType()
          r2_126[#r2_126].CurrentWeaponMeleeOrRanged = r12_126:GetWeaponMeleeOrRanged()
        end
      end
    end
    -- close: r4_126
  end
  local r3_126 = r3_0.pack(r2_126)
  local r4_126 = FMessage()
  r4_126:SetBytes(r3_126, #r3_126)
  return r4_126
end
function r6_0.TriggerEnterEndPlayer(r0_127, r1_127)
  -- line: [2136, 2151] id: 127
  local r2_127 = UE4.URuntimeCommonFunctionLibrary.GetPlayerControllerByAvatarEid(r0_127, r1_127)
  if r2_127 and r2_127:IsPlayEnd() then
    DebugPrint("TriggerEnterEndPlayer 玩家已结算：", r1_127)
    local r3_127 = GWorld:GetDSEntity()
    assert(r3_127)
    r0_127:NotifyClientGameEnd(rawget(r3_127.HasLeaveAvatars, r1_127), {
      r1_127
    })
  else
    DebugPrint("TriggerEnterEndPlayer 副本已结束但玩家未结算：", r1_127)
    r0_127:ForceFinishPlayerByFailed({
      r1_127
    })
  end
end
function r6_0.OnMiniGameSuccess(r0_128, r1_128, r2_128)
  -- line: [2153, 2156] id: 128
  r0_128.Overridden.OnMiniGameSuccess(r0_128, r1_128, r2_128)
  r0_128:TriggerDungeonComponentFun("OnMiniGameSuccess", r1_128, r2_128)
end
function r6_0.OnDefenceCoreActive(r0_129, r1_129)
  -- line: [2158, 2161] id: 129
  r0_129.Overridden.OnDefenceCoreActive(r0_129, r1_129)
  r0_129:TriggerDungeonComponentFun("OnDefenceCoreActive", r1_129)
end
function r6_0.OnMiniGameFail(r0_130, r1_130, r2_130)
  -- line: [2163, 2171] id: 130
  if not r0_130:IsSubGameMode() then
    if not r0_130.MiniGameFailedTime[r1_130] then
      r0_130.MiniGameFailedTime[r1_130] = 0
    end
    r0_130.MiniGameFailedTime[r1_130] = r0_130.MiniGameFailedTime[r1_130] + 1
  end
  r0_130.Overridden.OnMiniGameFail(r0_130, r1_130, r2_130)
end
function r6_0.OnDefenceCoreDead(r0_131, r1_131)
  -- line: [2173, 2176] id: 131
  r0_131.Overridden.OnDefenceCoreDead(r0_131, r1_131)
end
function r6_0.ChangeFallTriggersActive(r0_132, r1_132, r2_132)
  -- line: [2178, 2186] id: 132
  for r7_132, r8_132 in pairs(r1_132) do
    for r13_132, r14_132 in pairs(r0_132.EMGameState.FallTriggersArray) do
      if r14_132.FallTriggerId == r8_132 then
        r14_132.Active = r2_132
      end
    end
    -- close: r9_132
  end
  -- close: r3_132
end
function r6_0.AsyncLoadTargetLevel(r0_133, r1_133, r2_133)
  -- line: [2258, 2289] id: 133
  local function r3_133()
    -- line: [2259, 2261] id: 134
    r1_133:AsyncPrintHello()
  end
  local r4_133 = r0_133.EMGameState:GetTargetPoint(r2_133)
  if not IsValid(r4_133) then
    r0_133:AddTimer(0.1, r3_133)
    return 
  end
  local r5_133 = UE4.UGameplayStatics.GetPlayerCharacter(r0_133, 0)
  if not r0_133:GetLevelLoader() then
    r0_133:AddTimer(0.1, r3_133)
    return 
  end
  local r6_133 = r0_133:GetLevelLoader():GetLevelIdByLocation(r4_133:K2_GetActorLocation())
  local r7_133 = r0_133:GetLevelLoader():GetLevelIdByLocation(r5_133:K2_GetActorLocation())
  if not r6_133 or not r7_133 or r6_133 == r7_133 then
    r0_133:AddTimer(0.1, r3_133)
    return 
  end
  local r8_133 = r0_133:GetLevelLoader()
  r8_133:BindArtLevelLoadedCompleteCallback(r6_133, function()
    -- line: [2279, 2286] id: 135
    UE4.UGameplayStatics.GetGameInstance(r0_133):CloseLoadingUI()
    r1_133:AsyncPrintHello()
    if r8_133 then
      r8_133:RemoveArtLevelLoadedCompleteCallback(r6_133)
    end
  end)
  r8_133:LoadArtLevel(r6_133)
end
function r6_0.SetActorLocationAndRotationByTransform(r0_136, r1_136, r2_136, r3_136, r4_136)
  -- line: [2291, 2347] id: 136
  if not r4_136 then
    r4_136 = false
  end
  local r5_136 = nil
  local r6_136 = nil
  if r1_136 == 0 then
    r5_136 = UE4.UGameplayStatics.GetPlayerCharacter(r0_136, 0)
  else
    r5_136 = r0_136.EMGameState.NpcCharacterMap:FindRef(r1_136)
  end
  if not IsValid(r5_136) then
    print(_G.LogTag, " ZJT_PlayerCharacter Or NewTargetPoint Is NUll !")
    return false
  end
  local r7_136 = r2_136.Translation
  local r8_136 = r2_136.Rotation:ToRotator()
  r6_136 = r7_136
  if r4_136 then
    local r9_136 = r5_136.CapsuleComponent:GetScaledCapsuleHalfHeight()
    local r10_136 = r5_136.CapsuleComponent:GetScaledCapsuleRadius()
    local r11_136 = FHitResult()
    local r12_136 = FHitResult()
    if UE4.UKismetSystemLibrary.CapsuleTraceSingle(r0_136, r7_136 + FVector(0, 0, r9_136), r7_136 + FVector(0, 0, r9_136 * -2), r10_136, r9_136, ETraceTypeQuery.TraceScene, false, nil, 0, r11_136, true) then
      r6_136 = FVector(r11_136.Location.X, r11_136.Location.Y, r11_136.ImpactPoint.Z + r9_136 + 2)
    end
  end
  if r3_136 and not r5_136:IsDead() then
    r0_136:SetPlayerCharacterForceIdle(r5_136)
  end
  local r9_136 = UE4.UGameplayStatics.GetGameMode(r0_136)
  if r9_136:GetLevelLoader() then
    local r10_136 = r9_136:GetLevelLoader():GetLevelIdByLocation(r7_136)
    local r11_136 = r9_136:GetLevelLoader():GetLevelIdByLocation(r5_136:K2_GetActorLocation())
    r5_136:K2_SetActorLocationAndRotation(r6_136, r8_136, false, nil, false)
    if r10_136 and r11_136 and r11_136 ~= r10_136 then
      r9_136:GetLevelLoader():UnloadArtLevel(r11_136)
    end
  else
    r5_136:K2_SetActorLocationAndRotation(r6_136, r8_136, false, nil, false)
  end
  return true
end
function r6_0.EMSetActorLocationAndRotation(r0_137, r1_137, r2_137, r3_137, r4_137)
  -- line: [2349, 2411] id: 137
  if not r4_137 then
    r4_137 = false
  end
  local r5_137 = nil
  local r6_137 = nil
  local r7_137 = nil
  print(_G.LogTag, " ZJT_ EMSetActorLocationAndRotation ", r1_137, r2_137, r3_137)
  if r2_137 == "" then
    return false
  end
  r6_137 = r0_137.EMGameState:GetTargetPoint(r2_137)
  if not r6_137 then
    return false
  end
  if r1_137 == 0 then
    r5_137 = UE4.UGameplayStatics.GetPlayerCharacter(r0_137, 0)
  else
    r5_137 = r0_137.EMGameState.NpcCharacterMap:FindRef(r1_137)
  end
  if not IsValid(r5_137) or not IsValid(r6_137) then
    print(_G.LogTag, " ZJT_PlayerCharacter Or NewTargetPoint Is NUll !")
    return false
  end
  local r8_137 = r6_137:K2_GetActorLocation()
  r7_137 = r8_137
  if r4_137 then
    local r9_137 = r5_137.CapsuleComponent:GetScaledCapsuleHalfHeight()
    local r10_137 = r5_137.CapsuleComponent:GetScaledCapsuleRadius()
    local r11_137 = FHitResult()
    local r12_137 = FHitResult()
    if UE4.UKismetSystemLibrary.CapsuleTraceSingle(r0_137, r8_137 + FVector(0, 0, r9_137), r8_137 + FVector(0, 0, r9_137 * -2), r10_137, r9_137, ETraceTypeQuery.TraceScene, false, nil, 0, r11_137, true) then
      r7_137 = FVector(r11_137.Location.X, r11_137.Location.Y, r11_137.ImpactPoint.Z + r9_137 + 2)
    end
  end
  if r3_137 and not r5_137:IsDead() then
    r0_137:SetPlayerCharacterForceIdle(r5_137)
  end
  local r9_137 = UE4.UGameplayStatics.GetGameMode(r0_137)
  if r9_137:GetLevelLoader() then
    local r10_137 = r9_137:GetLevelLoader():GetLevelIdByLocation(r6_137:K2_GetActorLocation())
    local r11_137 = r9_137:GetLevelLoader():GetLevelIdByLocation(r5_137:K2_GetActorLocation())
    r5_137:K2_SetActorLocationAndRotation(r7_137, r6_137:K2_GetActorRotation(), false, nil, false)
    if r10_137 and r11_137 and r11_137 ~= r10_137 then
      r9_137:GetLevelLoader():UnloadArtLevel(r11_137)
    end
  else
    r5_137:K2_SetActorLocationAndRotation(r7_137, r6_137:K2_GetActorRotation(), false, nil, false)
  end
  return true
end
function r6_0.SetPlayerCharacterForceIdle(r0_138, r1_138)
  -- line: [2413, 2420] id: 138
  r1_138:ResetIdle()
  r1_138:DisableInput(UE4.UGameplayStatics.GetPlayerController(r0_138, 0))
  r0_138:AddTimer(0.2, function()
    -- line: [2416, 2418] id: 139
    r1_138:EnableInput(UE4.UGameplayStatics.GetPlayerController(r0_138, 0))
  end)
end
function r6_0.GetRespawnRuleName(r0_140, r1_140)
  -- line: [2422, 2473] id: 140
  DebugPrint("Tianyi@ GetRespawnRuleName begin")
  local r2_140 = "Default"
  local r3_140 = r0_140.DunegeonId
  if not r3_140 then
    DebugPrint("Tianyi@ GetRespawnRuleName: CurrentDungeonId is nil, Try to get it from gameinstance")
    r3_140 = UE4.UGameplayStatics.GetGameInstance(r0_140):GetCurrentDungeonId()
  end
  if IsDedicatedServer(r0_140) then
    local r4_140 = DataMgr.Dungeon[r3_140]
    if r4_140 and r4_140.RespawnRule then
      r2_140 = r4_140.RespawnRule
    end
    return r2_140
  end
  local r4_140 = GWorld:GetAvatar()
  if not r4_140 then
    DebugPrint("Tianyi@ GetRespawnRuleName: Avatar is nil")
    return r2_140
  end
  if r1_140 and r1_140.IsHostage then
    r2_140 = "Hostage"
    return r2_140
  end
  if r4_140:IsInDungeon2() then
    if not r3_140 then
      DebugPrint("GetRespawnRuleName: Tianyi@ DungeonId is nil")
      return r2_140
    end
    local r5_140 = DataMgr.Dungeon[r3_140]
    if r5_140 and r5_140.RespawnRule then
      r2_140 = r5_140.RespawnRule
    end
  elseif r4_140:IsInBigWorld() then
    DebugPrint("Tianyi@ GetRespawnRuleName: Player in bigworld")
    if r4_140:IsInHardBoss() then
      r2_140 = "HardBoss"
    else
      r2_140 = "CommonRegion"
    end
  end
  DebugPrint("Tianyi@ GetRespawnRuleName: RespawnRuleName = " .. r2_140)
  return r2_140
end
function r6_0.GetRespawnRule(r0_141, r1_141, r2_141)
  -- line: [2476, 2484] id: 141
  local r3_141 = nil
  if r2_141 then
    return DataMgr.RespawnRule[r2_141] and DataMgr.RespawnRule.CommonSolo
  end
  return DataMgr.RespawnRule[r0_141:GetRespawnRuleName(r1_141)]
end
function r6_0.InitEntityRecoveryData(r0_142, r1_142)
  -- line: [2486, 2494] id: 142
  r1_142:ClearSkillRecoverTargets()
  r1_142:SetAttr("AdditionalRecoverTime", 0)
  if r1_142:IsPlayer() then
    r0_142:InitPlayerReocveryData(r1_142)
  elseif r1_142:IsPhantom() then
    r0_142:InitPhantomRecoveryData(r1_142)
  end
end
function r6_0.CheckEntityCanRecover(r0_143, r1_143)
  -- line: [2532, 2542] id: 143
  if r1_143:IsPlayer() then
    return r0_143:CheckPlayerCanRecover(r1_143)
  elseif r1_143:IsPhantom() then
    return r0_143:CheckPhantomCanRecover(r1_143)
  elseif r1_143:IsMonster() then
    return r0_143:CheckMonsterCanRecover(r1_143)
  else
    return true
  end
end
function r6_0.CheckPlayerCanRecover(r0_144, r1_144)
  -- line: [2544, 2553] id: 144
  local r2_144 = r1_144:GetRecoveryCount()
  local r3_144 = r1_144:GetRecoveryMaxCount()
  local r4_144 = nil	-- notice: implicit variable refs by block#[4]
  if r3_144 >= 0 then
    r4_144 = r2_144 < r3_144
  else
    goto label_9	-- block#3 is visited secondly
  end
  return r4_144
end
function r6_0.CheckPhantomCanRecover(r0_145, r1_145)
  -- line: [2555, 2565] id: 145
  local r2_145 = GWorld:GetAvatar()
  if r2_145 and r2_145:IsRealInBigWorld() and not r2_145:IsInHardBoss() then
    return false
  end
  local r3_145 = r1_145:GetRecoveryCount()
  local r4_145 = r1_145:GetRecoveryMaxCount()
  local r5_145 = nil	-- notice: implicit variable refs by block#[8]
  if r4_145 >= 0 then
    r5_145 = r3_145 < r4_145
  else
    goto label_24	-- block#7 is visited secondly
  end
  return r5_145
end
function r6_0.CheckMonsterCanRecover(r0_146, r1_146)
  -- line: [2568, 2570] id: 146
  return true
end
function r6_0.TriggerGenerateReward(r0_147, r1_147, r2_147, r3_147, r4_147)
  -- line: [2582, 2587] id: 147
  if r1_147.ToTable then
    r1_147 = r1_147:ToTable()
  end
  r0_147.EMGameState.EventMgr:TriggerGenerateReward(r1_147, r2_147, r3_147, r4_147)
end
function r6_0.ActiveMonsterBuff(r0_148, r1_148, r2_148)
  -- line: [2612, 2617] id: 148
  if not r0_148.MonsterAddBuffRule then
    r0_148.MonsterAddBuffRule = {}
  end
  table.insert(r0_148.MonsterAddBuffRule, {
    BuffList = r1_148,
    BuffNum = r2_148,
  })
end
function r6_0.DestroyMonsterBuff(r0_149)
  -- line: [2619, 2621] id: 149
  r0_149.MonsterAddBuffRule = nil
end
function r6_0.TriggerMechanismFieldCreature(r0_150, r1_150, r2_150, r3_150, r4_150, r5_150)
  -- line: [2632, 2645] id: 150
  for r9_150 = 1, r1_150:Length(), 1 do
    local r10_150 = r1_150:GetRef(r9_150)
    local r11_150 = r0_150.EMGameState.FeildCreatureMap:FindRef(r10_150)
    if not r11_150 then
      print(_G.LogTag, "ZJT_ TriggerMechanismFieldCreature ", r10_150, r2_150, r3_150, r4_150, r5_150)
    else
      r11_150:SetFieldCreateMechanismInfo(r3_150, r4_150, r5_150, r2_150)
    end
  end
end
function r6_0.HideUIInScreen(r0_151, r1_151, r2_151)
  -- line: [2647, 2652] id: 151
  if not r0_151.EMGameState then
    return 
  end
  r0_151.EMGameState:HideUIInScreen(r1_151, r2_151)
end
function r6_0.SetContinuedPCGuideVisibility(r0_152, r1_152, r2_152)
  -- line: [2654, 2659] id: 152
  if not r0_152.EMGameState then
    return 
  end
  r0_152.EMGameState:RealSetContinuedPCGuideVisibility(r1_152, r2_152)
end
function r6_0.UpdatePlayerCharacterEndPointInfo(r0_153, r1_153, r2_153)
  -- line: [2661, 2687] id: 153
  if not r2_153 then
    r2_153 = UE4.UGameplayStatics.GetPlayerController(r1_153)
  end
  local r3_153 = r2_153:GetMyPawn()
  local r4_153 = r0_153.EMGameState.EndPointActor
  if not IsValid(r4_153) then
    DebugPrint("StartAndEndPoint No End EndPoint")
    r3_153:SetEndPointInfo(true, nil, nil)
    return 
  end
  local r5_153 = r4_153:GetTransform(r1_153)
  local r6_153 = r5_153.Translation
  local r7_153 = FRotator(r5_153.Rotation)
  if (r3_153:K2_GetActorLocation() - r6_153):Size() <= 1000 then
    r3_153:SetEndPointInfo(true, r6_153, r7_153)
  else
    r3_153:SetEndPointInfo(false, r6_153, r7_153)
  end
end
function r6_0.AddPickUpSuccessCallback(r0_154, r1_154, r2_154, r3_154)
  -- line: [2689, 2697] id: 154
  if not r0_154.PickUpSuccessCallback then
    r0_154.PickUpSuccessCallback = {}
  end
  if not r0_154.PickUpSuccessCallback[r1_154] then
    r0_154.PickUpSuccessCallback[r1_154] = {}
  end
  r0_154.PickUpSuccessCallback[r1_154][r2_154] = r3_154
end
function r6_0.RemovePickUpSuccessCallback(r0_155, r1_155, r2_155)
  -- line: [2699, 2703] id: 155
  if r0_155.PickUpSuccessCallback and r0_155.PickUpSuccessCallback[r1_155] then
    r0_155.PickUpSuccessCallback[r1_155][r2_155] = nil
  end
end
function r6_0.AddMiniGameSuccessCallback(r0_156, r1_156, r2_156)
  -- line: [2705, 2710] id: 156
  if not r0_156.MiniGameSuccessCallback then
    r0_156.MiniGameSuccessCallback = {}
  end
  r0_156.MiniGameSuccessCallback[r1_156] = r2_156
end
function r6_0.RemoveMiniGameSuccessCallback(r0_157, r1_157, r2_157)
  -- line: [2712, 2716] id: 157
  if r0_157.MiniGameSuccessCallback then
    r0_157.MiniGameSuccessCallback[r1_157] = nil
  end
end
function r6_0.RunStory(r0_158, r1_158, r2_158, r3_158, r4_158)
  -- line: [2718, 2721] id: 158
  DebugPrint("StoryPathStoryPathStoryPathStoryPath", r1_158)
  GWorld.StoryMgr:RunStory(r1_158, r2_158, nil, r3_158, r4_158)
end
function r6_0.PickUpForAllPlayers(r0_159, r1_159, r2_159, r3_159, r4_159, r5_159, r6_159, r7_159)
  -- line: [2723, 2729] id: 159
  for r11_159 = 0, r0_159:GetPlayerNum() + -1, 1 do
    local r13_159 = UE4.UGameplayStatics.GetPlayerController(r0_159, r11_159):GetMyPawn()
    r13_159[r1_159](r13_159, r2_159, r3_159, r4_159, r5_159, r6_159, r7_159)
  end
end
function r6_0.CollectGameModeTimerHandle(r0_160, r1_160)
  -- line: [2732, 2737] id: 160
  if not r0_160.GameModeTimerSet then
    r0_160.GameModeTimerSet = UE4.TSet(UE4.FTimerHandle())
  end
  r0_160.GameModeTimerSet:Add(r1_160)
end
function r6_0.PauseGameModeTimer(r0_161)
  -- line: [2739, 2758] id: 161
  r0_161.CurPauseGameModeTimerMap = {}
  if r0_161.GameModeTimerSet and r0_161.GameModeTimerSet:Num() > 0 then
    local r1_161 = {}
    local r2_161 = r0_161.GameModeTimerSet:ToArray()
    for r6_161 = 1, r2_161:Num(), 1 do
      local r7_161 = r2_161[r6_161]
      if not UE4.UKismetSystemLibrary.K2_TimerExistsHandle(r0_161, r7_161) then
        table.insert(r1_161, r7_161)
      else
        r0_161.CurPauseGameModeTimerMap[r7_161] = true
        UE4.UKismetSystemLibrary.K2_PauseTimerHandle(r0_161, r7_161)
        UE4.UKismetSystemLibrary.K2_TimerExistsHandle(r0_161, r7_161)
      end
    end
    for r6_161 = 1, #r1_161, 1 do
      r0_161.GameModeTimerSet:Remove(r1_161[r6_161])
    end
  end
end
function r6_0.UnPauseGameModeTimer(r0_162)
  -- line: [2760, 2772] id: 162
  if r0_162.CurPauseGameModeTimerMap == nil or IsEmptyTable(r0_162.CurPauseGameModeTimerMap) then
    return 
  end
  for r5_162, r6_162 in pairs(r0_162.CurPauseGameModeTimerMap) do
    if UE4.UKismetSystemLibrary.K2_TimerExistsHandle(r0_162, r5_162) then
      UE4.UKismetSystemLibrary.K2_UnPauseTimerHandle(r0_162, r5_162)
    end
  end
  -- close: r1_162
  r0_162.CurPauseGameModeTimerMap = {}
end
function r6_0.GetActor2ManualId(r0_163, r1_163)
  -- line: [2775, 2778] id: 163
  return r0_163.LevelGameMode.BPBornRegionActor:FindRef(r1_163)
end
function r6_0.TriggerMechanismWindCreator(r0_164, r1_164, r2_164, r3_164)
  -- line: [2780, 2791] id: 164
  for r7_164 = 1, r1_164:Length(), 1 do
    local r9_164 = r0_164.LevelGameMode.BPBornRegionActor:FindRef(r1_164:GetRef(r7_164))
    if r9_164 then
      r9_164:SetWindCreator(r2_164, r3_164)
    else
      print(_G.LogTag, "ZJT_ TriggerMechanismWindCreator ", r2_164, r3_164)
    end
  end
end
function r6_0.EMActorDestroy_Lua(r0_165, r1_165, r2_165)
  -- line: [2833, 2835] id: 165
  r1_165:EMActorDestroy(r2_165)
end
function r6_0.GetMonsterCustomLoc(r0_166, r1_166)
  -- line: [2837, 2876] id: 166
  if r0_166:IsInRegion() then
    DebugPrint("Error!!! 区域出现Boss被卸载瞬移！请检查！ ViewLocation : ", URuntimeCommonFunctionLibrary.GetViewPortLocation(r1_166))
    return FVector(0, 0, 0)
  end
  local r2_166 = nil
  if IsValid(r1_166) and IsValid(r1_166.BBTarget) then
    r2_166 = r1_166.BBTarget
  else
    r2_166 = r0_166:GetOneRandomPlayer()
  end
  if r0_166.TacMapManager then
    local r4_166 = r0_166.TacMapManager:GetSpawnPoints({
      PresetTargets = {
        [r2_166] = 1,
      },
      Mode = "Player",
      UnitSpawnRadiusMin = 1000,
      UnitSpawnRadiusMax = 5000,
      RandomSpawn = true,
      FilterReachable = true,
    })
    if r4_166[r2_166].Num == 0 then
      return FVector(0, 0, 0)
    end
    return r4_166[r2_166][1]
  else
    local r3_166 = FPointCheckInfo()
    r3_166:SetCheckInfo(1000, 5000, true, true, true)
    local r4_166 = r0_166.FixedMonsterSpawn:GetSpawnPointLocations(r2_166, r3_166)
    if r4_166:Num() == 0 then
      return FVector(0, 0, 0)
    end
    return r4_166[1]
  end
end
function r6_0.UploadTargetValues(r0_167, r1_167, r2_167)
  -- line: [2878, 2890] id: 167
  local r3_167 = GWorld:GetAvatar()
  if r3_167 then
    r3_167:TriggerTarget(r1_167)
    return 
  end
  local r4_167 = GWorld:GetDSEntity()
  if r4_167 then
    r4_167:TriggerTarget(r1_167, r2_167)
  end
end
function r6_0.GetAvatarInfo(r0_168, r1_168)
  -- line: [2893, 2906] id: 168
  if IsStandAlone(r0_168) or r5_0.IsListenServer(r0_168) then
    return GWorld:GetAvatar()
  elseif IsDedicatedServer(r0_168) then
    if r1_168 then
      return r0_168.AvatarInfos[r1_168].PlayerInfo
    end
    for r6_168, r7_168 in pairs(r0_168.AvatarInfos) do
      if r7_168 then
        return r7_168.PlayerInfo
      end
    end
    -- close: r2_168
  end
end
function r6_0.TriggerSpawnPet(r0_169)
  -- line: [2908, 2946] id: 169
  if r0_169.EMGameState.PetDefenceFail == true then
    r0_169.EMGameState:ShowDungeonError("TriggerSpawnPet 宠物防御已经失败，不再创建", Const.DungeonErrorType.Pet, Const.DungeonErrorTitle.Process)
    return 
  end
  if not r0_169.RandomPetCreator or not IsValid(r0_169.RandomPetCreator) then
    local r1_169 = r0_169:GetPetStaticCreatorInfo()
    if r1_169:Num() == 0 then
      r0_169.EMGameState:ShowDungeonError("TriggerSpawnPet 当前拼接副本内找不到宠物静态点，请检查配置！", Const.DungeonErrorType.Pet, Const.DungeonErrorTitle.Config)
      return 
    end
    r0_169.RandomPetCreator = r0_169:GetPetCreatorNearestToFirstPlayer(r1_169)
    if not IsValid(r0_169.RandomPetCreator) then
      r0_169.EMGameState:ShowDungeonError("TriggerSpawnPet 选择宠物静态点失败！", Const.DungeonErrorType.Pet, Const.DungeonErrorTitle.FindObject)
      return 
    end
  end
  local r1_169 = r0_169:GetActorLevelName(r0_169.RandomPetCreator)
  local r2_169 = r0_169.SubGameModeInfo:FindRef(r1_169)
  if not IsValid(r2_169) then
    r0_169.EMGameState:ShowDungeonError("TriggerSpawnPet 创建宠物静态点找不到SubGameMode StaticCreatorId: " .. r0_169.RandomPetCreator.StaticCreatorId .. "SubLevelName: " .. tostring(r1_169), Const.DungeonErrorType.Pet, Const.DungeonErrorTitle.FindObject)
    return 
  end
  r2_169.PetActiveLevel = true
  r2_169.RandomPetDefenceCoreId = r0_169.DungeonRandomEventDefenceCoreId
  r2_169.RandomPetId = r0_169.DungeonRandomEventPetId
  r0_169.RandomPetCreator.UnitId = r0_169.DungeonRandomEventPetId
  r0_169.RandomPetCreator.UnitType = "Pet"
  DebugPrint("BP_EMGameMode_C:TriggerSpawnPet 创建宠物 StaticCreatorId", r0_169.RandomPetCreator.StaticCreatorId, "UnitId", r0_169.RandomPetCreator.UnitId)
  r0_169:TriggerActiveCustomStaticCreator(r0_169.RandomPetCreator.StaticCreatorId, "DungeonPetSpawn", true, r1_169)
  r0_169.RandomPetCreator.UnitId = r0_169.DungeonRandomEventDefenceCoreId
  r0_169.RandomPetCreator.UnitType = "Mechanism"
  DebugPrint("BP_EMGameMode_C:TriggerSpawnPet 创建宠物防御核心 StaticCreatorId", r0_169.RandomPetCreator.StaticCreatorId, "UnitId", r0_169.RandomPetCreator.UnitId)
  r0_169:TriggerActiveCustomStaticCreator(r0_169.RandomPetCreator.StaticCreatorId, "DungeonPetDefSpawn", true, r1_169)
  r0_169.PetMonsterCreated = true
end
function r6_0.GetPetCreatorNearestToExit(r0_170, r1_170)
  -- line: [2948, 2970] id: 170
  local r2_170 = r0_170:GetLevelLoader()
  if not r2_170 then
    r0_170.EMGameState:ShowDungeonError("TriggerSpawnPet 拿不到LevelLoader", Const.DungeonErrorType.Pet, Const.DungeonErrorTitle.FindObject)
    return nil
  end
  local r3_170 = r2_170:GetExitLevelLocation()
  local r4_170 = math.huge
  local r5_170 = nil
  for r9_170 = 1, r1_170:Num(), 1 do
    local r10_170 = r1_170[r9_170]
    if r10_170 then
      local r12_170 = UE4.UKismetMathLibrary.Vector_DistanceSquared(r3_170, r10_170:K2_GetActorLocation())
      if r12_170 < r4_170 then
        r4_170 = r12_170
        r5_170 = r10_170
      end
    end
  end
  return r5_170
end
function r6_0.GetPetCreatorNearestToFirstPlayer(r0_171, r1_171)
  -- line: [2972, 3000] id: 171
  if not r0_171:GetLevelLoader() then
    r0_171.EMGameState:ShowDungeonError("TriggerSpawnPet 拿不到LevelLoader", Const.DungeonErrorType.Pet, Const.DungeonErrorTitle.FindObject)
    return nil
  end
  local r3_171 = r0_171:GetAllPlayer()
  if not r3_171 or r3_171:Length() <= 0 then
    r0_171.EMGameState:ShowDungeonError("TriggerSpawnPet 获取不到Players", Const.DungeonErrorType.Pet, Const.DungeonErrorTitle.FindObject)
    return nil
  end
  local r5_171 = r3_171:GetRef(1):K2_GetActorLocation()
  local r6_171 = math.huge
  local r7_171 = nil
  for r11_171 = 1, r1_171:Num(), 1 do
    local r12_171 = r1_171[r11_171]
    if r12_171 then
      local r14_171 = UE4.UKismetMathLibrary.Vector_DistanceSquared(r5_171, r12_171:K2_GetActorLocation())
      if r14_171 < r6_171 then
        r6_171 = r14_171
        r7_171 = r12_171
      end
    end
  end
  return r7_171
end
function r6_0.ShowPetDefenseDynamicEvent(r0_172, r1_172, r2_172, r3_172, r4_172)
  -- line: [3002, 3008] id: 172
  r0_172.EMGameState:SetPetEventName(r1_172)
  r0_172.EMGameState:SetPetEventDescribe(r2_172)
  r0_172.EMGameState:SetPetEventSuccess(r3_172)
  r0_172.EMGameState:SetPetEventFail(r4_172)
  r0_172.LevelGameMode:AddDungeonEvent("ShowPetDefenseDynamicEvent")
end
function r6_0.ShowPetDefenseProgress(r0_173, r1_173, r2_173, r3_173, r4_173)
  -- line: [3010, 3023] id: 173
  r0_173.EMGameState:SetPetEventName(r1_173)
  r0_173.EMGameState:SetPetEventDescribe(r2_173)
  if r0_173:IsSubGameMode() then
    r0_173.EMGameState:SetPetDefenceCoreId(r0_173.RandomPetDefenceCoreId)
    r0_173.EMGameState:SetPetId(r0_173.RandomPetId)
  else
    r0_173.EMGameState:SetPetDefenceCoreId(r0_173.DungeonRandomEventDefenceCoreId)
    r0_173.EMGameState:SetPetId(r0_173.DungeonRandomEventPetId)
  end
  r0_173.EMGameState:SetPetEventSuccess(r3_173)
  r0_173.EMGameState:SetPetEventFail(r4_173)
  r0_173.LevelGameMode:AddDungeonEvent("ShowPetDefenseProgress")
end
function r6_0.HidePetDefenseProgress(r0_174, r1_174)
  -- line: [3025, 3034] id: 174
  r0_174.EMGameState:SetPetSuccess(r1_174)
  r0_174.EMGameState:SetPetDefenceFail(not r1_174)
  r0_174.LevelGameMode:RemoveDungeonEvent("ShowPetDefenseDynamicEvent")
  r0_174.LevelGameMode:RemoveDungeonEvent("ShowPetDefenseProgress")
  r0_174.LevelGameMode:RemoveDungeonEvent("PetPlayFailureMontage")
  if r1_174 then
    r0_174.EMGameState:PetAddGuideAllPlayer()
  end
end
function r6_0.UpdatePetDefenseProgress(r0_175)
  -- line: [3036, 3040] id: 175
  if IsStandAlone(r0_175) then
    r0_175.EMGameState:OnRep_PetDefenceKilled()
  end
end
function r6_0.HandleJoinMidwayDungeonRandomEvent(r0_176, r1_176)
  -- line: [3042, 3061] id: 176
  DebugPrint("[BP_EMGameMode_C:HandleJoinMidwayDungeonRandomEvent] Start")
  local r2_176 = GWorld:GetDSEntity()
  if not r2_176 then
    DebugPrint("[BP_EMGameMode_C:HandleJoinMidwayDungeonRandomEvent] not find DSEntity")
    return 
  end
  if r0_176.DungeonRandomEventPetId then
    DebugPrint("HandleJoinMidwayDungeonRandomEvent Pet ", r0_176.DungeonRandomEventPetId)
    for r7_176, r8_176 in pairs(r1_176 and {}) do
      DebugPrint("CallServerMethod DungeonEventRealHappendPet ", r2_0.ObjId2Str(r7_176))
      r2_176:SendAvatar(r7_176, "DungeonEventRealHappendPet", r0_176.DungeonRandomEventPetId)
    end
    -- close: r3_176
  end
  DebugPrint("[BP_EMGameMode_C:HandleJoinMidwayDungeonRandomEvent] End")
end
function r6_0.InitDungeonRandomEvent(r0_177, r1_177)
  -- line: [3063, 3105] id: 177
  if r0_177.HasInitDungeonEvent then
    r0_177:HandleJoinMidwayDungeonRandomEvent(r1_177)
    return 
  end
  r0_177.HasInitDungeonEvent = true
  DebugPrint("[BP_EMGameMode_C:InitDungeonEvent] Start")
  local r2_177 = r0_177:GetAvatarInfo()
  if not r2_177 then
    DebugPrint("[BP_EMGameMode_C:InitDungeonEvent] not find avatar")
    return 
  end
  local r3_177 = r2_177.DungeonRandomEvent.CurrentEventId
  local r4_177 = DataMgr.DungeonRandomEvent[r3_177]
  if not r4_177 then
    DebugPrint("[BP_EMGameMode_C:InitDungeonEvent] not find event excel <EventId>", r3_177)
    return 
  end
  local r5_177 = r4_177.EventType
  local r6_177 = r2_177.DungeonRandomEvent[r5_177]
  DebugPrint("[BP_EMGameMode_C:InitDungeonEvent] <EventId,EventType>", r3_177, r5_177)
  if r3_177 == 0 then
    DebugPrint("[BP_EMGameMode_C:InitDungeonEvent] not happen event")
    return 
  end
  if not r6_177 then
    DebugPrint("[BP_EMGameMode_C:InitDungeonEvent] not find event detail <EventId,EventType>", r3_177, r5_177)
    return 
  end
  if r0_177["InitDungeonRandomEvent" .. r5_177] then
    r0_177["InitDungeonRandomEvent" .. r5_177](r0_177, r6_177)
  else
    DebugPrint("[BP_EMGameMode_C:InitDungeonEvent] not find event type")
  end
  local r7_177 = GWorld:GetDSEntity()
  if r7_177 then
    r7_177:ServerMulticast("DungeonEventRealHappend", r3_177, r2_177.Uid)
  else
    r2_177:CallServerMethod("DungeonEventRealHappend", r3_177, r2_177.Uid)
  end
end
function r6_0.InitDungeonRandomEventPet(r0_178, r1_178)
  -- line: [3107, 3124] id: 178
  DebugPrint("[BP_EMGameMode_C:InitDungeonRandomEventPet] Start <PetId>", r1_178.PetId)
  local r2_178 = GWorld:GetDSEntity()
  if r2_178 then
    r2_178:ServerMulticast("DungeonEventRealHappendPet", r1_178.PetId)
  end
  if r1_178.PetId == 0 then
    DebugPrint("[BP_EMGameMode_C:InitDungeonRandomEventPet] PetId为0")
    return 
  end
  r0_178.NeedPetMonster = true
  r0_178.DungeonRandomEventPetId = r1_178.PetId
  if not DataMgr.Pet[r1_178.PetId] then
    ScreenPrint("[BP_EMGameMode_C:InitDungeonRandomEventPet] 传入的PetId不存在于Pet表中", r1_178.PetId)
    return 
  end
  r0_178.DungeonRandomEventDefenceCoreId = DataMgr.Pet[r1_178.PetId].DefenceCoreID
end
function r6_0.InitDungeonRandomEventTreasure(r0_179, r1_179)
  -- line: [3126, 3129] id: 179
  DebugPrint("[BP_EMGameMode_C:InitDungeonRandomEventTreasure] Start")
  r0_179.NeedTreasureMonster = true
end
function r6_0.InitDungeonRandomEventButcher(r0_180, r1_180)
  -- line: [3131, 3134] id: 180
  DebugPrint("[BP_EMGameMode_C:InitDungeonRandomEventButcher] Start")
  r0_180.NeedButcherMonster = true
end
function r6_0.JudgeEscapeMechanismArray(r0_181, r1_181)
  -- line: [3136, 3142] id: 181
  if r1_181:Num() <= 0 then
    DebugPrint("Error: 找不到撤离机关。")
  elseif r1_181:Num() > 1 then
    DebugPrint("Warning: 找到了多于一个撤离机关。")
  end
end
function r6_0.GetEscapeMechanismLocation(r0_182)
  -- line: [3144, 3172] id: 182
  local r1_182 = r0_182.EMGameState.MechanismMap:FindRef("ExitTrigger")
  if r1_182 ~= nil then
    r1_182 = r1_182.Array
    r0_182:JudgeEscapeMechanismArray(r1_182)
    for r6_182, r7_182 in pairs(r1_182:ToTable()) do
      return r7_182:K2_GetActorLocation()
    end
    -- close: r2_182
  else
    r1_182 = TArray(FSnapShotInfo())
    local r2_182 = r0_182:GetLevelLoader()
    if r2_182 ~= nil then
      local r3_182 = TArray(FSnapShotInfo())
      r0_182:GetCustomDungeonSnapShotData(r3_182, r2_182.exitLevelID)
      for r8_182, r9_182 in pairs(r3_182) do
        if r9_182.UnitType == "Mechanism" and DataMgr.Mechanism[r9_182.UnitId] ~= nil and DataMgr.Mechanism[r9_182.UnitId].UnitRealType == "ExitTrigger" then
          r1_182:Add(r9_182)
        end
      end
      -- close: r4_182
    end
    r0_182:JudgeEscapeMechanismArray(r1_182)
    for r7_182, r8_182 in pairs(r1_182:ToTable()) do
      return r8_182.Loc
    end
    -- close: r3_182
  end
  return nil
end
function r6_0.GetEscapeMechanismActor(r0_183)
  -- line: [3174, 3186] id: 183
  local r1_183 = r0_183.EMGameState.MechanismMap:FindRef("ExitTrigger")
  if r1_183 == nil then
    DebugPrint("Error: 找不到撤离机关。")
    return nil
  end
  r1_183 = r1_183.Array
  r0_183:JudgeEscapeMechanismArray(r1_183)
  for r6_183, r7_183 in pairs(r1_183:ToTable()) do
    return r7_183
  end
  -- close: r2_183
  return nil
end
function r6_0.GetPickupUnitPreloadTable(r0_184)
  -- line: [3188, 3197] id: 184
  if r0_184.EMGameState.GameModeType == "Blank" then
    return nil
  end
  local r1_184 = "BP_" .. r0_184.EMGameState.GameModeType .. "Component"
  if r0_184:GetDungeonComponent() ~= nil and r0_184:GetDungeonComponent().GetPickupUnitPreloadTable ~= nil then
    return r0_184:GetDungeonComponent():GetPickupUnitPreloadTable()
  end
  return nil
end
function r6_0.GetAvatarBuffs(r0_185, r1_185)
  -- line: [3199, 3207] id: 185
  for r6_185, r7_185 in pairs(r0_185.AvatarInfos) do
    DebugPrint("Tianyi@ AvatarEid = " .. r6_185)
    for r13_185, r14_185 in pairs(r7_185.Buffs) do
      DebugPrint("Tianyi@ BuffInfo: " .. r14_185.BuffId .. " StartTime: " .. r14_185.StartTime .. " Duration: " .. r14_185.Duration)
    end
    -- close: r9_185
  end
  -- close: r2_185
end
function r6_0.TriggerBattleAchievementUploadOnDungeonEnd(r0_186, r1_186)
  -- line: [3209, 3225] id: 186
  if IsStandAlone(r0_186) then
    local r2_186 = GWorld:GetAvatar()
    if r2_186 then
      local r3_186 = UE4.UGameplayStatics.GetPlayerCharacter(r0_186, 0)
      local r4_186 = "Dungeon"
      local r5_186 = r0_186.LevelGameMode.DungeonId
      if r2_186:IsInHardBoss() then
        r4_186 = "HardBoss"
        r5_186 = r0_186.LevelGameMode.EMGameState.HardBossInfo.DifficultyId
      end
      r3_186.BattleAchievement:OnDungeonEnd(r3_186, r4_186, r5_186, r1_186)
    end
  end
end
function r6_0.NotifyGameModePlayerDead(r0_187, r1_187)
  -- line: [3227, 3230] id: 187
  r0_187:TriggerDungeonComponentFun("OnPlayerDead")
  r0_187:PlayerOnDead(r1_187)
end
function r6_0.DestroyActorsByUnitLabels_Lua(r0_188, r1_188)
  -- line: [3232, 3239] id: 188
  local r2_188 = GWorld:GetAvatar()
  if r2_188 then
    for r7_188, r8_188 in pairs(r1_188:ToTable()) do
      r2_188:RegionActorDataDeadByUnitLabel(r8_188.UnitId, r8_188.UnitType)
    end
    -- close: r3_188
  end
end
function r6_0.GetRegionIdByLocation(r0_189, ...)
  -- line: [3241, 3245] id: 189
  local r1_189 = r0_189:GetLevelLoader()
  if not r1_189 then
    return 
  end
  return r1_189:GetRegionIdByLocation(...)
end
function r6_0.ActivateDynamicQuestEvent(r0_190)
  -- line: [3247, 3267] id: 190
  local r1_190 = GWorld:GetAvatar()
  if r1_190 and r1_190.DynamicQuests and #r1_190.DynamicQuests then
    for r6_190, r7_190 in pairs(r1_190.DynamicQuests) do
      if r7_190:IsActive() then
        if not r4_0:CheckDynamicEventStarted(r7_190.DynamicQuestId) then
          r4_0:StartDynamicEvent(r7_190.DynamicQuestId)
        else
          local r8_190 = r4_0:GetCurrentActiveDynamicEvent(r7_190.DynamicQuestId)
          if r8_190 then
            r8_190:ActivateTrigger()
          end
        end
      end
    end
    -- close: r2_190
  end
end
function r6_0.IsRegionAllReady(r0_191)
  -- line: [3269, 3273] id: 191
  local r1_191 = r0_191:GetRegionDataMgrSubSystem()
  if not r1_191 then
    return false
  end
  return r1_191:IsRegionAllReady()
end
function r6_0.TriggerTarget(r0_192, r1_192, r2_192, r3_192)
  -- line: [3275, 3290] id: 192
  local r4_192 = GWorld:GetAvatar()
  if r4_192 then
    r4_192:ServerTargetFinish(r1_192, r2_192, 1)
  end
  local r5_192 = GWorld:GetDSEntity()
  if r5_192 then
    if r3_192 == -1 then
      r5_192:ServerMulticast("ServerTargetFinish", r1_192, r2_192, 1, {})
    else
      r5_192:SendAvatar(Battle(r0_192):GetEntity(r3_192):GetOwner().AvatarId, "ServerTargetFinish", r1_192, r2_192, 1, {})
    end
  end
end
function r6_0.ActiveNewTargetPointAOITrigger_Region(r0_193, r1_193)
  -- line: [3292, 3313] id: 193
  if r1_193 ~= Const.Hijack then
    GWorld.logger.error("ActiveNewTargetPointAOITrigger_Region 接口当前只支持 Hijack Type")
    return 
  end
  if r0_193.EMGameState == nil or r0_193.EMGameState.HijackPathInfo == nil then
    return 
  end
  if not r0_193.NewTargetPointAOITriggerList then
    r0_193.NewTargetPointAOITriggerList = {}
  end
  r0_193.NewTargetPointAOITriggerList[r1_193] = {}
  for r6_193, r7_193 in pairs(r0_193.EMGameState.HijackPathInfo) do
    for r12_193, r13_193 in pairs(r7_193) do
      if IsAuthority(r0_193) and r13_193.SpawnTriggerBoxId ~= -1 and r13_193.SpawnBoxType == ENTPSpawnBoxType.GamemodeEvent then
        r13_193:SpawnTriggerBox()
        table.insert(r0_193.NewTargetPointAOITriggerList[r1_193], r13_193)
      end
    end
    -- close: r8_193
  end
  -- close: r2_193
end
function r6_0.DisactiveNewTargetPointAOITrigger_Region(r0_194, r1_194)
  -- line: [3315, 3324] id: 194
  if not r0_194.NewTargetPointAOITriggerList or not r0_194.NewTargetPointAOITriggerList[r1_194] then
    return 
  end
  for r6_194, r7_194 in pairs(r0_194.NewTargetPointAOITriggerList[r1_194]) do
    r7_194:DestroyTriggerBox(EDestroyReason.SpecialQuestClear)
  end
  -- close: r2_194
end
function r6_0.OnAllPlayersVoted(r0_195)
  -- line: [3326, 3328] id: 195
  r0_195:TriggerDungeonComponentFun("OnAllPlayersVoted")
end
function r6_0.InitMonsterFramingNodeSetting(r0_196, r1_196)
  -- line: [3330, 3338] id: 196
  r1_196.Type = EFramingType.ByReplicateNum
  r1_196.DistanceToCull = 4500
  r1_196.DistanceToCull_FastShare = 15000
  r1_196.PreFrameReplicateNum = 30
  r1_196.PreFrameReplicateMovementNum = 15
  r1_196.SkipFullReplicationFactor = 0.5
  r1_196.SkipMovementReplicationFactor = 1
end
function r6_0.GetPlayerEidByAvatarEidStr(r0_197, r1_197)
  -- line: [3340, 3347] id: 197
  local r2_197 = UE4.URuntimeCommonFunctionLibrary.GetPlayerStateByAvatarEid(GWorld.GameInstance, r1_197)
  if r2_197 then
    return r2_197.Eid
  else
    DebugPrint("BP_EMGameMode_C: AvatarEidStr", r1_197, "拿不到对应的PlayerState!")
  end
end
function r6_0.SetGameStatePetRandomDailyCount(r0_198)
  -- line: [3349, 3362] id: 198
  local r1_198 = GWorld:GetAvatar()
  if not r1_198 then
    return 
  end
  local r2_198 = 0
  for r8_198, r9_198 in pairs(r1_198.Region2TryPetCount) do
    r2_198 = r2_198 + r9_198
  end
  -- close: r4_198
  r0_198.EMGameState.RegionRandomPetLimitedDailyCount = DataMgr.GlobalConstant.PetRareDailyLimit.ConstantValue - r2_198
end
function r6_0.GetRegionCharAvgLevel(r0_199)
  -- line: [3364, 3405] id: 199
  local r1_199 = GWorld:GetAvatar()
  if not r1_199 then
    return 99
  end
  if not r1_199.Chars then
    return 99
  end
  local r2_199 = {}
  local r3_199 = 3
  local function r4_199(r0_200)
    -- line: [3375, 3390] id: 200
    if #r2_199 < r3_199 then
      table.insert(r2_199, r0_200)
    else
      local r1_200 = math.min(table.unpack(r2_199))
      if r1_200 < r0_200 then
        for r6_200, r7_200 in ipairs(r2_199) do
          if r7_200 == r1_200 then
            r2_199[r6_200] = r0_200
            break
          end
        end
        -- close: r2_200
      end
    end
  end
  for r9_199, r10_199 in pairs(r1_199.Chars) do
    if r10_199 and r10_199.Level then
      r4_199(r10_199.Level)
    end
  end
  -- close: r5_199
  local r5_199 = 0
  for r10_199, r11_199 in pairs(r2_199) do
    r5_199 = r5_199 + r11_199
  end
  -- close: r6_199
  local r6_199 = math.floor(r5_199 / #r2_199)
  DebugPrint("BP_EMGameMode_C:GetRegionCharAvgLevel", r6_199)
  return r6_199
end
function r6_0.UpdateServerTimeOfDay(r0_201, r1_201)
  -- line: [3407, 3413] id: 201
  local r2_201 = GWorld:GetAvatar()
  if not r2_201 then
    return 
  end
  r2_201:SetTimeOfDay(r1_201)
end
function r6_0.GetServerTimeOfDay(r0_202)
  -- line: [3415, 3421] id: 202
  local r1_202 = GWorld:GetAvatar()
  if not r1_202 then
    return 12
  end
  return r1_202.TimeOfDay
end
function r6_0.SetPlayerInvincible(r0_203, r1_203, r2_203)
  -- line: [3423, 3434] id: 203
  if not IsValid(r1_203) then
    return 
  end
  DebugPrint("BP_EMGameMode_C: SetPlayerInvincible", r2_203, "PlayerEid:", r1_203.Eid)
  if r2_203 then
    Battle(r0_203):AddBuffToTarget(r1_203, r1_203, Const.InvincibleBuffId, -1)
  else
    Battle(r0_203):RemoveBuffFromTarget(r1_203, r1_203, Const.InvincibleBuffId, false, -1)
  end
end
function r6_0.PausePhantomBTByPlayer(r0_204, r1_204, r2_204, r3_204)
  -- line: [3436, 3455] id: 204
  if not IsValid(r1_204) then
    return 
  end
  if not r3_204 then
    r3_204 = "GameModePauseBT"
  end
  DebugPrint("BP_EMGameMode_C: StopPhantomBTByPlayer", r2_204, "PlayerEid:", r1_204.Eid)
  for r9_204, r10_204 in pairs(r1_204:GetPhantomTeammates(false, true)) do
    if IsValid(r10_204) then
      if r2_204 then
        r10_204:PauseBT(r3_204)
      else
        r10_204:ResumeBT(r3_204)
      end
    end
  end
  -- close: r5_204
end
AssembleComponents(r6_0)
return r6_0
