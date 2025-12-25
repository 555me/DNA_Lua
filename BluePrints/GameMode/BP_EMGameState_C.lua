-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\GameMode\BP_EMGameState_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("Const")
local r1_0 = require("msgpack_core")
local r2_0 = Class()
local r3_0 = "NpcLoaded"
r2_0._components = {
  "BluePrints.Combat.Components.GameStateInterface",
  "BluePrints.Combat.Components.GameModeInterface",
  "BluePrints.Combat.BattleLogic.MonsterFirstSeenComp",
  "BluePrints.Combat.BattleLogic.MechanismFirstSeenComp",
  "BluePrints.Combat.BattleLogic.NavLinkGroupMgr",
  "BluePrints.GameMode.Components.ConditionTriggerComponent",
  "BluePrints.UI.WBP.Chat.EMGameStateChatComp",
  "BluePrints.GameMode.GameStateComponents.HardBossDgComponent"
}
function r2_0.Initialize(r0_1)
  -- line: [29, 31] id: 1
  r0_1.LastDungeonEvent = {}
end
function r2_0.ReceiveBeginPlay(r0_2)
  -- line: [33, 79] id: 2
  r0_2.Overridden.ReceiveBeginPlay(r0_2)
  r0_2.DebugMonster = nil
  r0_2.EndLoadingSuccess = false
  r0_2.bCustomNpcCanCache = r0_0.CustomNpcCanCache
  EventManager:AddEvent(EventID.OnExploreGroupDeactive, r0_2, r0_2.OnExploreGroupDeactive)
  EventManager:AddEvent(EventID.OnExploreGroupActive, r0_2, r0_2.OnExploreGroupActive)
  EventManager:AddEvent(EventID.OnExploreGroupSpecialActive, r0_2, r0_2.OnExploreGroupSpecialActive)
  EventManager:AddEvent(EventID.OnExploreGroupLimitComplete, r0_2, r0_2.OnExploreGroupLimitComplete)
  EventManager:AddEvent(EventID.OnExploreGroupComplete, r0_2, r0_2.OnExploreGroupComplete)
  EventManager:AddEvent(EventID.OnExploreGroupReset, r0_2, r0_2.OnExploreGroupReset)
  EventManager:AddEvent(EventID.OnMainCharacterInitReady, r0_2, r0_2.OnLoadingPanelClosed)
  r0_2.OnDelPlayerState:Add(r0_2, function(r0_3, r1_3)
    -- line: [59, 61] id: 3
    EventManager:FireEvent(EventID.OnDelPlayerState, r1_3)
  end)
  r0_2.OnDelPhantomState:Add(r0_2, function(r0_4, r1_4)
    -- line: [62, 64] id: 4
    EventManager:FireEvent(EventID.OnDelPhantomState, r1_4)
  end)
  r0_2.GameStateIndex = GWorld:AddGameState(r0_2)
  r0_2:InitTimeCheckMgr()
  r0_2:AddSceneMgrEvent()
  r0_2:InitPickupNiagaraPath()
  r0_2.AudioCompCacheNum = 0
  r0_2:SpawnClientEventManager()
  local r1_2 = TArray(AActor)
  UE4.UGameplayStatics.GetAllActorsOfClass(r0_2, APhantomState, r1_2)
  for r6_2, r7_2 in pairs(r1_2) do
    r0_2.PhantomArray:AddUnique(r7_2)
  end
  -- close: r2_2
end
function r2_0.OnLoadingPanelClosed(r0_5)
  -- line: [81, 83] id: 5
  r0_5.LoadingClosed = true
end
function r2_0.InitGameStateInfo(r0_6)
  -- line: [85, 90] id: 6
  r0_6.HardBossInfo = {}
  r0_6:InitGameStateInterface()
  r0_6:InitDungeonUIInfo()
end
function r2_0.InitDungeonUIInfo(r0_7)
  -- line: [92, 97] id: 7
  if IsDedicatedServer(r0_7) then
    return 
  end
  r0_7:OnRep_DungeonUIInfo()
end
function r2_0.OnGameModeReady_Lua(r0_8)
  -- line: [99, 113] id: 8
  if not IsAuthority(r0_8) then
    return 
  end
  local r1_8 = UE4.UGameplayStatics.GetGameMode(r0_8)
  r1_8:InitMonsterSpawnDivisions(r0_8.MonsterSpawnPointParams)
  local r2_8 = GWorld:GetDSEntity()
  if r2_8 then
    r2_8:HookGameModeReady(r1_8)
  end
end
function r2_0.SetEndPointActor(r0_9, r1_9)
  -- line: [115, 120] id: 9
  if not IsValid(r1_9) then
    return 
  end
  r0_9.EndPointActor = r1_9
end
function r2_0.AddCoverInfo(r0_10, r1_10)
  -- line: [122, 127] id: 10
  if not IsValid(r1_10) then
    return 
  end
  r0_10.CoverMap:Add(r1_10.Eid, r1_10)
end
function r2_0.AddDefBaseInfo(r0_11, r1_11)
  -- line: [129, 148] id: 11
  if r1_11 == nil then
    return 
  end
  local r2_11 = r0_11.DefBaseMap:Keys():Length()
  r0_11.DefBaseMap:Add(r1_11.Eid, r1_11)
  r0_11.HatredCombatProp:Add(r1_11.Eid, r1_11)
  if r2_11 <= 0 then
  end
end
function r2_0.AddHijackPointInfo(r0_12, r1_12)
  -- line: [151, 169] id: 12
  if not IsValid(r1_12) then
    return 
  end
  if not r0_12.HijackPathInfo then
    r0_12.HijackPathInfo = {}
  end
  if r1_12.DisplayName == "" or r1_12.PathId == 0 or r1_12.PathPointIndex == 0 then
    GWorld.logger.error("HijackPathInfo数据错误, 请检查。DisplayName: " .. r1_12.DisplayName .. "   PathId: " .. r1_12.PathId .. " PathPointIndex: " .. r1_12.PathPointIndex)
    return 
  end
  if r0_12.HijackPathInfo[r1_12.PathId] then
    r0_12.HijackPathInfo[r1_12.PathId][r1_12.PathPointIndex] = r1_12
  else
    r0_12.HijackPathInfo[r1_12.PathId] = {}
    r0_12.HijackPathInfo[r1_12.PathId][r1_12.PathPointIndex] = r1_12
  end
end
function r2_0.AddTargetPointInfo(r0_13, r1_13)
  -- line: [171, 192] id: 13
  if not IsValid(r1_13) then
    return 
  end
  if r1_13.DisplayName == "" then
    return 
  end
  r0_13.TargetPointMap:Add(r1_13.DisplayName, r1_13)
  if r1_13.DisplayName == r0_0.GuidePointName then
    r0_13:SpawnGuidePlayerAtLoc(r1_13:K2_GetActorLocation())
  end
  if r1_13.DisplayName == r0_0.FallAttackPointName and r1_13.IsActive then
    local r3_13 = UE4.UGameplayStatics.GetPlayerCharacter(r0_13, 0):GetOrAddFallAttackObject()
    r3_13.bFallAttackPoint = true
    r3_13.FallAttackPoint = r1_13:K2_GetActorLocation()
  end
end
function r2_0.AddQuestArea(r0_14, r1_14)
  -- line: [194, 205] id: 14
  if not IsValid(r1_14) then
    return 
  end
  if r1_14.DisplayName == "" then
    return 
  end
  if not r0_14.QuestArea then
    r0_14.QuestArea = {}
  end
  r0_14.QuestArea[r1_14.DisplayName] = r1_14
end
function r2_0.AddMonsterSpawnPointInfo(r0_15, r1_15)
  -- line: [207, 212] id: 15
  if not IsValid(r1_15) then
    return 
  end
  r0_15.MonsterSpawnPointArray:AddUnique(r1_15)
end
function r2_0.AddFallTriggerInfo(r0_16, r1_16)
  -- line: [214, 220] id: 16
  if not IsValid(r1_16) then
    DebugPrint("FallTrigger 不存在")
    return 
  end
  r0_16.FallTriggersArray:Add(r1_16)
end
function r2_0.RemoveFallTriggerInfo(r0_17, r1_17)
  -- line: [222, 228] id: 17
  if not IsValid(r1_17) then
    DebugPrint("FallTrigger 不存在")
    return 
  end
  r0_17.FallTriggersArray:RemoveItem(r1_17)
end
function r2_0.CheckActorNeedCache(r0_18)
  -- line: [241, 248] id: 18
  if UE4.UGameplayStatics.GetGameInstance(r0_18).IsTakeRecorderCapturing then
    return false
  end
  return true
end
function r2_0.CheckMonsterNeedCache(r0_19, r1_19)
  -- line: [250, 252] id: 19
  return r0_19:CheckActorNeedCache()
end
function r2_0.CheckBodyAccessotyNeedCache(r0_20, r1_20)
  -- line: [254, 256] id: 20
  return r0_20:CheckActorNeedCache()
end
function r2_0.GetTargetPoint(r0_21, r1_21)
  -- line: [258, 263] id: 21
  if r1_21 == "" or r1_21 == nil then
    return 
  end
  return r0_21.TargetPointMap:FindRef(r1_21)
end
function r2_0.GetTargetPointLoc(r0_22, r1_22)
  -- line: [265, 272] id: 22
  if r1_22 == "" or r1_22 == nil then
    return 
  end
  if r0_22.TargetPointMap:FindRef(r1_22) then
    return r0_22.TargetPointMap:FindRef(r1_22):K2_GetActorLocation()
  end
end
function r2_0.OnNpcLoaded_Lua(r0_23, r1_23, r2_23)
  -- line: [290, 299] id: 23
  for r8_23, r9_23 in pairs(r0_23:GetNpcInfoAsyncCallbackTable(r1_23)) do
    if r9_23 then
      r9_23(r2_23)
    end
  end
  -- close: r4_23
  r0_23:EmptyNpcInfoAsyncCallbackTable(r1_23)
end
function r2_0.AddNpcInfo_Lua(r0_24, r1_24)
  -- line: [301, 311] id: 24
  local r2_24 = DataMgr.Npc[r1_24.UnitId]
  DebugPrint("AddNpcInfo_Lua:", r1_24.UnitId)
  if r2_24 and r2_24.IsSit == 1 then
    r1_24:SetSitPoseInteractive()
  elseif r2_24 and r2_24.IsSit == 2 then
    r1_24:SetSitPoseWithoutInteractive()
  elseif r2_24 and r2_24.IsSit == 3 then
    r1_24:SetSitPoseWithInteractiveAndNoDown()
  end
end
function r2_0.RemoveGetNpcInfoAsyncDelegate(r0_25, r1_25, r2_25)
  -- line: [313, 319] id: 25
  if r2_25 then
    local r3_25 = r0_25:GetNpcInfoAsyncCallbackTable(r1_25)
    DebugPrint("RemoveGetNpcInfoAsyncDelegate", r1_25, r2_25, r3_25[r2_25])
    r3_25[r2_25] = nil
  end
end
function r2_0.GetNpcInfoAsyncCallbackTable(r0_26, r1_26)
  -- line: [321, 325] id: 26
  local r2_26 = r3_0 .. r1_26
  r0_26[r2_26] = r0_26[r2_26] and {}
  return r0_26[r2_26]
end
function r2_0.EmptyNpcInfoAsyncCallbackTable(r0_27, r1_27)
  -- line: [327, 330] id: 27
  r0_27[r3_0 .. r1_27] = {}
end
function r2_0.GetNpcInfoAsync(r0_28, r1_28, r2_28)
  -- line: [333, 360] id: 28
  if not r1_28 and r2_28 then
    r2_28(nil)
  end
  local r3_28 = URuntimeCommonFunctionLibrary.GetNPCIdByGender(r0_28, r1_28)
  if r3_28 ~= r1_28 then
    DebugPrint("ChangeNpcId", r3_28, " : ", r1_28)
    r1_28 = r3_28
  end
  local r4_28 = r0_28:GetNpcInfo(r1_28)
  if r4_28 ~= nil then
    DebugPrint("NpcId:", r1_28, "Npc Is Loaded ========================")
    r2_28(r4_28)
  elseif r0_28:IsNpcInAsyncProcess(r1_28) then
    DebugPrint("NpcId:", r1_28, "Npc Is Loading ========================")
    local r5_28 = r0_28:GetNpcInfoAsyncCallbackTable(r1_28)
    if r2_28 then
      r5_28[r2_28] = r2_28
    end
  else
    r2_28(nil)
  end
end
function r2_0.CanUnloadNavMeshLevel(r0_29)
  -- line: [362, 364] id: 29
  return r0_0.CanUnloadNavMeshLevel
end
function r2_0.OnRep_GameModeState_Lua(r0_30)
  -- line: [372, 374] id: 30
end
function r2_0.OnRep_GuideEids(r0_31)
  -- line: [376, 387] id: 31
  local r2_31 = UE4.UGameplayStatics.GetGameInstance(r0_31):GetSceneManager()
  if IsValid(r2_31) then
    r2_31:UpdateAllCommonGuideIcon()
  end
  if r0_31.OnRepEidsDelegate:IsBound() then
    print(_G.LogTag, "OnRepEidsDelegateBro")
    r0_31.OnRepEidsDelegate:Broadcast(r0_31)
  end
end
function r2_0.OnRep_DungeonUIState(r0_32)
  -- line: [389, 391] id: 32
  EventManager:FireEvent(EventID.OnDungeonUIStateUpdated)
end
function r2_0.RealShowLargeCountDownUI(r0_33, r1_33, r2_33)
  -- line: [394, 396] id: 33
  EventManager:FireEvent(EventID.OnNotifyShowLargeCountDown, r1_33, r2_33)
end
function r2_0.GetSurvivalValue(r0_34)
  -- line: [447, 452] id: 34
  if r0_34.GameModeType == "SurvivalMini" or r0_34.GameModeType == "SurvivalMiniPro" then
    return r0_34.SurvivalMiniValue
  end
  return r0_34.SurvivalValue
end
function r2_0.AddEnergySupplyCount(r0_35, r1_35)
  -- line: [455, 461] id: 35
  r0_35:SetEnergySupplyCount(r0_35.EnergySupplyCount + r1_35)
  if GWorld:IsStandAlone() then
    r0_35:OnRep_EnergySupplyCount()
  end
end
function r2_0.MulticastAddSurvivalValue_Lua(r0_36, r1_36)
  -- line: [463, 466] id: 36
end
function r2_0.ShowInteractedToast_Lua(r0_37, r1_37)
  -- line: [469, 483] id: 37
  if not IsClient(r0_37) then
    return 
  end
  local r2_37 = UE4.UGameplayStatics.GetPlayerCharacter(r0_37, 0)
  if not IsValid(r2_37) or r2_37.Eid == r1_37 then
    return 
  end
  local r3_37 = r0_37:GetPlayerState(r1_37)
  local r5_37 = UE4.UGameplayStatics.GetGameInstance(r0_37):GetGameUIManager()
  if r5_37 and r3_37 then
    r5_37:ShowUITip(UIConst.Tip_CommonTop, string.format(GText("DUNGEON_SURVIVALPRO_126"), r3_37.PlayerName))
  end
end
function r2_0.GetSurvialTime(r0_38)
  -- line: [494, 496] id: 38
  return r0_38.CumulativeSurvivalTime
end
function r2_0.OnRep_CumulativeSurvivalTime(r0_39)
  -- line: [498, 500] id: 39
  EventManager:FireEvent(EventID.OnRepSurvivalTime, r0_39.CumulativeSurvivalTime)
end
function r2_0.OnRep_SabotageCountDownTime(r0_40)
  -- line: [502, 504] id: 40
  EventManager:FireEvent(EventID.OnRepSabotageCountDownTime)
end
function r2_0.OnRep_EnergySupplyCount(r0_41)
  -- line: [512, 514] id: 41
  EventManager:FireEvent(EventID.OnRepEnergySupplyCount)
end
function r2_0.OnRep_SurvivalMiniValue(r0_42)
  -- line: [516, 518] id: 42
  EventManager:FireEvent(EventID.OnRepSurvivalMiniValue, r0_42.SurvivalMiniValue)
end
function r2_0.OnRep_ExterminateKilledNum(r0_43)
  -- line: [520, 523] id: 43
  DebugPrint("BP_EMGameState_C:OnRep_ExterminateKilledNum", r0_43.ExterminateKilledNum)
  EventManager:FireEvent(EventID.OnRepExterminateKilledNum)
end
function r2_0.OnRep_TrialKilledNum(r0_44)
  -- line: [525, 528] id: 44
  DebugPrint("BP_EMGameState_C:OnRep_TrialKilledNum", r0_44.TrialKilledNum)
  EventManager:FireEvent(EventID.OnRepTrialKilledNum)
end
function r2_0.OnRep_CaptureRecoveryTime(r0_45)
  -- line: [530, 532] id: 45
  EventManager:FireEvent(EventID.OnRepCaptureRecoveryTime)
end
function r2_0.AddRougeBattleCount(r0_46, r1_46)
  -- line: [534, 541] id: 46
  if not r0_46.RougeBattleCount then
    r0_46.RougeBattleCount = 0
  end
  r0_46.RougeBattleCount = r0_46.RougeBattleCount + r1_46
  EventManager:FireEvent(EventID.OnRepRougeBattleCount)
end
function r2_0.SetRougeBattleNums(r0_47, r1_47, r2_47)
  -- line: [543, 548] id: 47
  r0_47.RougeBattleCount = r1_47 and 0
  r0_47.RougeBattleMaxNum = r2_47 and r0_47.RougeBattleMaxNum
  EventManager:FireEvent(EventID.OnRepRougeBattleCount)
end
function r2_0.SetRougeBattleMaxNum(r0_48, r1_48, r2_48)
  -- line: [550, 568] id: 48
  UE4.UGameplayStatics.GetGameMode(r0_48):RefreshRougeBattleUI(true, false)
  r0_48.RougeBattleMaxNum = r1_48
  local r4_48 = UIManager(r0_48):GetUIObj("Rouge_BattleProgress")
  if r4_48 then
    r4_48:InitRougeBattleDisplayText(r2_48)
    r4_48:OnRepRougeBattleCount()
  else
    ScreenPrint("BP_EMGameState_C:SetRougeBattleMaxNum 找不到肉鸽ui")
  end
end
function r2_0.TryGetNpc(r0_49, r1_49, r2_49)
  -- line: [571, 592] id: 49
  local r3_49 = r0_49:GetNpcInfo()
  if r3_49 then
    return r3_49, true
  end
  local r4_49 = UE4.UGameplayStatics.GetGameMode(r0_49)
  if not r4_49 then
    return nil, false
  end
  local r5_49 = r4_49:GetRegionDataMgrSubSystem()
  if not r5_49 then
    return nil, false
  end
  local r6_49 = r5_49:GetNpcData(r1_49)
  if r6_49 then
    r0_49.NpcCallBackMap = r0_49.NpcCallBackMap and {}
    r0_49.NpcCallBackMap[r1_49] = r2_49
  end
  return nil, r6_49
end
function r2_0.RemoveMechanismRegionOnline(r0_50, r1_50, r2_50)
  -- line: [595, 610] id: 50
  print(_G.LogTag, "LXZ RequestDeadRegionOnlineItem4444")
  if not GWorld:GetAvatar() then
    return 
  end
  local r4_50 = r0_50.RegionOnlineMechanismMap:FindRef(r1_50)
  print(_G.LogTag, "LXZ RequestDeadRegionOnlineItem5555", r1_50, r4_50)
  if r4_50 then
    print(_G.LogTag, "LXZ RequestDeadRegionOnlineItem6666")
    r4_50:EMActorDestroy(r2_50)
    r0_50.RegionOnlineMechanismMap:Remove(r1_50)
  else
    r0_50:AddDeleteRegionMechanism(r1_50)
  end
end
function r2_0.FireRegionOnlineMechanismUser(r0_51, r1_51, r2_51)
  -- line: [612, 631] id: 51
  local r3_51 = GWorld:GetAvatar()
  if not r3_51 or not r3_51.IsInRegionOnline then
    return 
  end
  print(_G.LogTag, "LXZ HandleMechanism FireRegionOnlineMechanismUser", r2_51:GetName())
  if not r3_51.Mechanism2User or not r3_51.Mechanism2User[r1_51] then
    return 
  end
  print(_G.LogTag, "LXZ HandleMechanism444", r2_51:GetName())
  for r8_51, r9_51 in pairs(r3_51.Mechanism2User[r1_51]) do
    local r11_51 = r3_51:GetBornedChar(CommonUtils.Str2ObjId(r9_51))
    print(_G.LogTag, "LXZ HandleMechanism555", r8_51, r9_51, r11_51)
    if r11_51 then
      local r12_51 = r2_51.ChestInteractiveComponent
      r11_51:InteractiveMechanism(r2_51.Eid, r11_51.Eid, r12_51.NextStateId, r12_51.CommonUIConfirmID, true, r8_51)
    end
  end
  -- close: r4_51
end
function r2_0.DealDungeonVoteResult(r0_52)
  -- line: [633, 671] id: 52
  local r1_52 = UE4.UGameplayStatics.GetGameMode(r0_52)
  if not r1_52.IsInDungeonVote then
    r0_52:ShowDungeonError("Vote::: 非投票阶段触发结算投票，丢弃此次结果", r0_0.DungeonErrorType.DungeonVote, r0_0.DungeonErrorTitle.Process)
    return 
  end
  r1_52.IsInDungeonVote = false
  r1_52:RemoveDungeonEvent("OnDungeonVoteBegin")
  DebugPrint("Vote::: Dungeon Begin Deal Vote Result")
  local r2_52 = 0
  local r3_52 = {}
  local r4_52 = {}
  for r9_52, r10_52 in pairs(r0_52.VoteValues) do
    if r10_52 == EVoteState.Continue then
      r2_52 = r2_52 + 1
    else
      local r11_52 = Battle(r0_52):GetCharacter(r9_52)
      if r11_52 then
        table.insert(r3_52, r11_52:GetOwner().AvatarEidStr)
        table.insert(r4_52, r9_52)
      end
    end
  end
  -- close: r5_52
  DebugPrint("Vote::: BattleNum :" .. r2_52 .. "  ExitNum:" .. #r3_52)
  r0_52.VoteValues:Clear()
  UMapSyncHelper.SyncMap(r0_52, "VoteValues")
  if #r3_52 ~= 0 then
    r1_52:TriggerPlayerWin(r3_52, r4_52)
  end
  if r2_52 == 0 then
    DebugPrint("Vote::: BattleNum = 0 ,触发副本结算")
    r1_52:TriggerDungeonOnEnd(true)
  else
    r1_52:ExecuteNextStepOfDungeonVote()
  end
end
function r2_0.DealDungeonTicketResult(r0_53)
  -- line: [673, 678] id: 53
  local r1_53 = UE4.UGameplayStatics.GetGameMode(r0_53)
  r1_53:RemoveDungeonEvent("SelectTicket")
  r1_53:ExecuteNextStepOfTicket()
end
function r2_0.RealShowContinuedPCGuide(r0_54, r1_54)
  -- line: [680, 689] id: 54
  local r2_54 = UE4.ESlateVisibility.Visible
  if r1_54 then
    r2_54 = UE4.ESlateVisibility.Hidden
  end
  local r3_54 = UIManager(r0_54):GetUIObj("BattleMain").Guide_KeyTip
  if r3_54 then
    r3_54:SetVisibility(r2_54)
  end
end
function r2_0.RealSetContinuedPCGuideVisibility(r0_55, r1_55, r2_55)
  -- line: [691, 714] id: 55
  local r3_55 = UIManager(r0_55):GetUIObj("BattleMain").Guide_KeyTip
  local r4_55 = UE4.ESlateVisibility.Visible
  if r2_55 then
    r4_55 = UE4.ESlateVisibility.Collapsed
  end
  if r3_55 then
    if r1_55 == "Attack" then
      r3_55.Hint01:SetVisibility(r4_55)
    elseif r1_55 == "Fire" then
      r3_55.Hint02:SetVisibility(r4_55)
    elseif r1_55 == "ESC" then
      r3_55.Hint03:SetVisibility(r4_55)
    elseif r1_55 == "Alt" then
      r3_55.Hint04:SetVisibility(r4_55)
    end
  end
  if (r1_55 == "SpiralLeap" or r1_55 == "Dodge" or r1_55 == "Skill1" or r1_55 == "Skill2" or r1_55 == "Skill2Attack") and CommonUtils.GetDeviceTypeByPlatformName(r0_55) == "PC" then
    UIManager(r0_55):GetUIObj("BattleMain"):ShowInstructionInfo(r1_55, r2_55)
  end
end
function r2_0.RealHideGuideMessage(r0_56, r1_56, r2_56)
  -- line: [716, 735] id: 56
  if not r1_56 then
    return 
  end
  if not UIManager(r0_56) then
    return 
  end
  local r3_56 = UIManager(r0_56):GetUIObj("GuideTextFloat" .. r1_56)
  if r3_56 then
    r3_56:DeleteGuideMessage(r2_56)
  end
  if CommonUtils.GetDeviceTypeByPlatformName(r0_56) == "Mobile" then
    local r4_56 = UIManager(r0_56):GetUIObj(UIManager().CurGuideTouchName)
    if not r4_56 then
      return 
    end
    r4_56:Close()
  end
end
function r2_0.RealHideHighlightButton(r0_57)
  -- line: [737, 749] id: 57
  if not UIManager(r0_57) then
    return 
  end
  local r1_57 = UIManager(r0_57):GetUIObj("BattleMain")
  r1_57.Pos_Instruction:SetVisibility(UE4.ESlateVisibility.Collapsed)
  local r2_57 = r1_57.Pos_Instruction:GetChildAt(0)
  if r2_57 and r2_57.Key then
    r2_57.Key:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
function r2_0.RealShowHighlightButton(r0_58, r1_58)
  -- line: [751, 772] id: 58
  if not UIManager(r0_58) then
    return 
  end
  if CommonUtils.GetDeviceTypeByPlatformName(r0_58) == "Mobile" then
    return 
  elseif CommonUtils.GetDeviceTypeByPlatformName(r0_58) == "PC" then
    local r2_58 = UIManager(r0_58):GetUIObj("BattleMain")
    r2_58.Pos_Instruction:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    local r3_58 = r2_58.Pos_Instruction:GetChildAt(0)
    if r3_58 == nil then
      r3_58 = r2_58:GetOrAddWidget("InstructionPC", r2_58.Pos_Instruction)
      if r3_58 then
        r3_58:Init(r1_58)
      end
    else
      r3_58:Init(r1_58)
    end
  end
end
function r2_0.RealPlayGuideTextFloatAnimation(r0_59, r1_59)
  -- line: [774, 786] id: 59
  if not UIManager(r0_59) then
    return 
  end
  if CommonUtils.GetDeviceTypeByPlatformName(r0_59) == "Mobile" then
    return 
  elseif CommonUtils.GetDeviceTypeByPlatformName(r0_59) == "PC" then
    local r2_59 = UIManager(r0_59):GetUIObj("GuideTextFloat" .. r1_59)
    if r2_59 then
      r2_59:DeleteGuideMessage(true)
    end
  end
end
function r2_0.HideUIInScreen(r0_60, r1_60, r2_60, r3_60)
  -- line: [788, 870] id: 60
  if IsDedicatedServer(r0_60) and IsAuthority(r0_60) then
    print(_G.LogTag, "WARNING: 是服务器,不执行 HideUIInScreen 函数")
    return 
  end
  if not r1_60 then
    print(_G.LogTag, "ERROR: 输入的UI路径错误", r1_60)
    return 
  end
  local r4_60 = UE4.ESlateVisibility.SelfHitTestInvisible
  local r5_60 = UE4.ESlateVisibility.Visible
  if r2_60 then
    r4_60 = UE4.ESlateVisibility.Collapsed
    r5_60 = UE4.ESlateVisibility.Hidden
  end
  if r1_60 == "EnergySkill" and CommonUtils.GetDeviceTypeByPlatformName(r0_60) == "Mobile" then
    r1_60 = "SkillPhone"
  end
  if r1_60 == "Esc" then
    local r6_60 = UE4.UGameplayStatics.GetPlayerCharacter(r0_60, 0)
    if r6_60 then
      r6_60:SetESCMenuForbiddenState(r2_60)
    end
  end
  r1_60 = UIConst[r1_60 .. "Path"]
  if r1_60 == "TaskBar" and UIManager(r0_60) then
    local r6_60 = UIManager(r0_60):GetUIObj("BattleMain")
    local r7_60 = nil
    if r6_60 ~= nil and r6_60.Pos_TaskBar ~= nil and r6_60.Pos_TaskBar:GetChildrenCount() == 1 then
      r7_60 = r6_60.Pos_TaskBar:GetChildAt(0)
      if r7_60 then
        r7_60.IsHideByNode = false
        DebugPrint("ShowOrHideUINode: GetVisibility", r7_60:GetName(), r7_60:GetVisibility())
        if r7_60:GetVisibility() ~= r4_60 and r7_60:GetVisibility() ~= r5_60 then
          r7_60:SetVisibility(r4_60)
          DebugPrint("ShowOrHideUINode: SetVisibility", r7_60:GetName(), r4_60)
          if r3_60 then
            if r2_60 then
              r7_60.IsHideByNode = true
            end
            r3_60.RealSetVisibility = true
            DebugPrint("ShowOrHideUINode: HideUIInScreen", r3_60.Function, r3_60.UIParam, r3_60.ActionParam, r3_60.ShowOrHide)
          end
        end
        return 
      end
    end
  end
  if UIManager(r0_60) then
    local r6_60 = UIManager(r0_60):GetUIPathFromString(r1_60)
    if r6_60 then
      local r7_60 = UIManager(r0_60):GetUIObj(r6_60[1])
      if not r7_60 then
        print(_G.LogTag, "ERROR: 输入的UI路径错误,没有找到该UI", r1_60)
        return 
      end
      for r12_60 = 2, #r6_60, 1 do
        r7_60 = r7_60[r6_60[r12_60]]
      end
      if not r7_60 then
        print(_G.LogTag, "ERROR: 输入的UI路径错误,没有找到该UI", r1_60)
        return 
      end
      DebugPrint("ShowOrHideUINode: GetVisibility", r7_60:GetName(), r7_60:GetVisibility())
      if r7_60:GetVisibility() ~= r4_60 and r7_60:GetVisibility() ~= r5_60 then
        if r1_60 == UIConst.BloodBarPath then
          local r9_60 = UIManager(r0_60):GetUIObj("BattleMain")
          if r9_60 then
            r9_60:ShowOrHideMainPlayerBloodUI(r2_60 == false, "HideUIInScreen")
          end
        else
          r7_60:SetVisibility(r4_60)
        end
        if r3_60 then
          r3_60.RealSetVisibility = true
          DebugPrint("ShowOrHideUINode: HideUIInScreen", r3_60.Function, r3_60.UIParam, r3_60.ActionParam, r3_60.ShowOrHide)
        end
      end
    end
  end
end
function r2_0.ShowUIAndCloseItAfterCertainTime(r0_61, r1_61, r2_61, r3_61, r4_61)
  -- line: [872, 886] id: 61
  if IsDedicatedServer(r0_61) and IsAuthority(r0_61) then
    print(_G.LogTag, "WARNING: 是服务器,不执行 ShowUIAndCloseItAfterCertainTime 函数")
    return nil
  end
  if r3_61 <= 0 then
    print(_G.LogTag, "WARNING: Duration 不能小于等于0")
    return nil
  end
  local r5_61 = UIManager(r0_61):LoadUI(r1_61, r2_61, r4_61)
  r0_61:AddTimer(r3_61, function()
    -- line: [882, 884] id: 62
    UIManager(r0_61):UnLoadUI(r2_61)
  end)
  return r5_61
end
function r2_0.ReceiveEndPlay(r0_63, r1_63)
  -- line: [888, 905] id: 63
  GWorld.Battle = nil
  GWorld:RemoveGameState(r0_63.GameStateIndex)
  EventManager:RemoveEvent(EventID.OnExploreGroupDeactive, r0_63)
  EventManager:RemoveEvent(EventID.OnExploreGroupActive, r0_63)
  EventManager:RemoveEvent(EventID.OnExploreGroupSpecialActive, r0_63)
  EventManager:RemoveEvent(EventID.OnExploreGroupLimitComplete, r0_63)
  EventManager:RemoveEvent(EventID.OnExploreGroupComplete, r0_63)
  EventManager:RemoveEvent(EventID.OnExploreGroupReset, r0_63)
  EventManager:RemoveEvent(EventID.OnMainCharacterInitReady, r0_63)
  r0_63:RemoveSceneMgrEvent()
  r0_63.OnDelPlayerState:Clear()
  r0_63.OnDelPhantomState:Clear()
  r0_63.Overridden.ReceiveEndPlay(r0_63, r1_63)
end
function r2_0.AddSceneMgrEvent(r0_64)
  -- line: [907, 911] id: 64
  UE4.UGameplayStatics.GetGameInstance(r0_64):GetSceneManager():AddRegionEvent(r0_64:IsInRegion())
end
function r2_0.RemoveSceneMgrEvent(r0_65)
  -- line: [913, 917] id: 65
  UE4.UGameplayStatics.GetGameInstance(r0_65):GetSceneManager():RemoveRegionEvent()
end
function r2_0.MulticastRealUnknownPickup_Lua(r0_66, r1_66)
  -- line: [920, 932] id: 66
end
function r2_0.OnExploreGroupActive(r0_67, r1_67)
  -- line: [934, 941] id: 67
  local r2_67 = r0_67.ExploreGroupMap:FindRef(r1_67)
  if not r2_67 then
    return 
  end
  r2_67:RealSetExploreGroupStatus(EExploreGroupStatus.EGS_Active)
end
function r2_0.OnExploreGroupSpecialActive(r0_68, r1_68)
  -- line: [943, 950] id: 68
  local r2_68 = r0_68.ExploreGroupMap:FindRef(r1_68)
  if not r2_68 then
    return 
  end
  r2_68:RealSetExploreGroupStatus(EExploreGroupStatus.EGS_SpecialActive)
end
function r2_0.OnExploreGroupDeactive(r0_69, r1_69)
  -- line: [952, 959] id: 69
  local r2_69 = r0_69.ExploreGroupMap:FindRef(r1_69)
  if not r2_69 then
    return 
  end
  r2_69:RealSetExploreGroupStatus(EExploreGroupStatus.EGS_Deactive)
end
function r2_0.OnExploreGroupLimitComplete(r0_70, r1_70)
  -- line: [961, 968] id: 70
  local r2_70 = r0_70.ExploreGroupMap:FindRef(r1_70)
  if not r2_70 then
    return 
  end
  r2_70:RealSetExploreGroupStatus(EExploreGroupStatus.EGS_LimitComplete)
end
function r2_0.OnExploreGroupComplete(r0_71, r1_71, r2_71)
  -- line: [970, 978] id: 71
  local r3_71 = r0_71.ExploreGroupMap:FindRef(r1_71)
  if not r3_71 then
    return 
  end
  r3_71:RealSetExploreGroupStatus(EExploreGroupStatus.EGS_Complete)
  r3_71:ShowRewardUI(r2_71)
end
function r2_0.OnExploreGroupReset(r0_72, r1_72)
  -- line: [980, 987] id: 72
  local r2_72 = r0_72.ExploreGroupMap:FindRef(r1_72)
  if not r2_72 then
    return 
  end
  r2_72:ReceiveOnExploreGroupReset()
end
function r2_0.GetMaxArchiveID(r0_73)
  -- line: [989, 999] id: 73
  local r1_73 = -1
  for r6_73, r7_73 in pairs(r0_73.ManualActiveCombat) do
    if r7_73.IsArchivePointActive == true and r1_73 < r7_73.ArchiveID then
      r1_73 = r7_73.ArchiveID
    end
  end
  -- close: r2_73
  return r1_73
end
function r2_0.ArchiveShowFX(r0_74)
  -- line: [1001, 1014] id: 74
  local r1_74 = r0_74:GetMaxArchiveID()
  for r6_74, r7_74 in pairs(r0_74.ManualActiveCombat) do
    if r7_74.IsArchivePointActive == true then
      if r1_74 == r7_74.ArchiveID then
        r7_74:OnMaxFX()
        DebugPrint("==============================================OnMaxFX=====MaxArchiveID,self.ArchiveID", r1_74, r7_74.ArchiveID)
      else
        r7_74:OnNormalFX()
        DebugPrint("==============================================OnNormalFX=====MaxArchiveID,self.ArchiveID", r1_74, r7_74.ArchiveID)
      end
    end
  end
  -- close: r2_74
end
function r2_0.BackToTempleArchivePoint(r0_75)
  -- line: [1016, 1044] id: 75
  local r1_75 = nil
  local r2_75 = -1
  for r7_75, r8_75 in pairs(r0_75.ManualActiveCombat) do
    if r8_75.IsArchivePointActive == true and r2_75 < r8_75.ArchiveID then
      r2_75 = r8_75.ArchiveID
      r1_75 = r8_75
    end
  end
  -- close: r3_75
  if r1_75 ~= nil then
    for r7_75, r8_75 in pairs(r0_75.ManualActiveCombat) do
      if r8_75.LinkArchiveID == r1_75.ArchiveID then
        r8_75:ResetInfo()
      end
    end
    -- close: r3_75
    DebugPrint("==============TriggerGameModeEvent: OnStageStart====BackToTempleArchivePoint================")
    local r3_75 = UE4.UGameplayStatics.GetGameMode(r0_75)
    r3_75:GetDungeonComponent():OnPlayerLeaveColorRange()
    r1_75.UseTimes = r1_75.UseTimes + 1
    if r3_75:GetDungeonComponent().CleanMovePlatformDelegateByArchiveId then
      r3_75:GetDungeonComponent():CleanMovePlatformDelegateByArchiveId(r1_75.ArchiveID)
    end
    r3_75:TriggerGameModeEvent("OnStageStart", r2_75, r1_75.UseTimes)
    return r1_75.ResetPoint:K2_GetComponentLocation(), r1_75.ResetPoint:K2_GetComponentRotation()
  end
  return nil, nil
end
function r2_0.GetMutiMaxArchiveID(r0_76, r1_76, r2_76)
  -- line: [1046, 1054] id: 76
  local r3_76 = r1_76
  for r8_76, r9_76 in pairs(r0_76.ManualActiveCombat) do
    if r9_76.EnterPlayerList and r9_76:CheckIsActive(r2_76) and r3_76 < r9_76.ArchiveID then
      r3_76 = r9_76.ArchiveID
    end
  end
  -- close: r4_76
  return r3_76
end
function r2_0.ArchiveMutiShowFX(r0_77, r1_77, r2_77)
  -- line: [1056, 1070] id: 77
  local r3_77 = r0_77:GetMutiMaxArchiveID(r1_77.ArchiveID, r2_77)
  DebugPrint("==============================================LXZ ArchiveMutiShowFX=====MaxArchiveID", r3_77)
  for r8_77, r9_77 in pairs(r0_77.ManualActiveCombat) do
    if r9_77.EnterPlayerList and not r9_77:CheckIsActive(r2_77) then
      if r3_77 == r9_77.ArchiveID and r9_77.Eid == r1_77.Eid then
        r9_77:OnMaxFX()
        DebugPrint("==============================================LXZ OnMaxFX=====MaxArchiveID,self.ArchiveID", r3_77, r9_77.ArchiveID)
      elseif r9_77.ArchiveID <= r3_77 then
        r9_77:OnNormalFX()
        DebugPrint("==============================================lxz OnNormalFX=====MaxArchiveID,self.ArchiveID", r3_77, r9_77.ArchiveID)
      end
    end
  end
  -- close: r4_77
end
function r2_0.BackToPartyArchivePoint(r0_78, r1_78)
  -- line: [1073, 1113] id: 78
  local r2_78 = nil
  local r3_78 = DataMgr.Party[r0_78.DungeonId].RespawnRule and 0
  if r3_78 == 0 then
    local r4_78 = -1
    for r9_78, r10_78 in pairs(r0_78.ManualActiveCombat) do
      if r10_78.EnterPlayerList and r10_78:CheckIsActive(r1_78.Eid) and r4_78 < r10_78.ArchiveID then
        r4_78 = r10_78.ArchiveID
        r2_78 = r10_78
      end
    end
    -- close: r5_78
  elseif r3_78 == 1 then
    local r4_78 = UE4.UGameplayStatics.GetGameMode(r0_78)
    if r4_78 and r4_78:GetDungeonComponent() then
      local r5_78 = r4_78:GetDungeonComponent().PlayerToArchivePointMultiInfo[r1_78.Eid]
      for r10_78, r11_78 in pairs(r0_78.ManualActiveCombat) do
        if r11_78.IsArchivePointActive == true and r5_78 == r11_78.ArchiveID then
          r2_78 = r11_78
        end
      end
      -- close: r6_78
    end
  elseif r3_78 == 2 then
    local r4_78 = 99999
    for r9_78, r10_78 in pairs(r0_78.ManualActiveCombat) do
      if r10_78.IsArchivePointActive == true then
        local r11_78 = r10_78:GetActorDistance(r10_78, r1_78)
        if r11_78 < r4_78 then
          r4_78 = r11_78
          r2_78 = r10_78
        end
      end
    end
    -- close: r5_78
  end
  if r2_78 ~= nil then
    DebugPrint("==============TriggerGameModeEvent: OnStageStart====BackToPartyArchivePoint================")
    return r2_78.ResetPoint:K2_GetComponentLocation(), r2_78.ResetPoint:K2_GetComponentRotation()
  end
  return nil, nil
end
function r2_0.ResetAllArchivePointAndManualActiveCombat(r0_79)
  -- line: [1115, 1128] id: 79
  for r5_79, r6_79 in pairs(r0_79.ManualActiveCombat) do
    if r6_79.LinkArchiveID ~= nil then
      r6_79:ResetInfo()
    end
  end
  -- close: r1_79
  for r5_79, r6_79 in pairs(r0_79.ManualActiveCombat) do
    if r6_79.IsArchivePointActive == true then
      r6_79:ResetInfo()
    end
  end
  -- close: r1_79
  DebugPrint("==============Reset All ArchivePoint And ManualActiveCombat================")
end
function r2_0.ResetAllArchivePoint(r0_80)
  -- line: [1130, 1137] id: 80
  for r5_80, r6_80 in pairs(r0_80.ManualActiveCombat) do
    if r6_80.IsArchivePointActive == true then
      r6_80:ResetInfo()
    end
  end
  -- close: r1_80
  DebugPrint("==============Reset All ArchivePoint================")
end
function r2_0.ResetAllManualActiveCombat(r0_81)
  -- line: [1139, 1146] id: 81
  for r5_81, r6_81 in pairs(r0_81.ManualActiveCombat) do
    if r6_81.LinkArchiveID ~= nil then
      r6_81:ResetInfo()
    end
  end
  -- close: r1_81
  DebugPrint("==============Reset All ManualActiveCombat================")
end
function r2_0.AddDrone(r0_82, r1_82, r2_82)
  -- line: [1148, 1156] id: 82
  if not r0_82.DroneGroup then
    r0_82.DroneGroup = {}
  end
  if not r0_82.DroneGroup[r1_82] then
    r0_82.DroneGroup[r1_82] = {}
  end
  table.insert(r0_82.DroneGroup[r1_82], r2_82)
end
function r2_0.OnDroneFoundPlayer(r0_83, r1_83, r2_83)
  -- line: [1158, 1167] id: 83
  if not r0_83.DroneGroup or not r0_83.DroneGroup[r1_83] then
    return 
  end
  for r6_83 = 1, #r0_83.DroneGroup[r1_83], 1 do
    local r8_83 = r0_83.ManualActiveCombat:Find(r0_83.DroneGroup[r1_83][r6_83])
    if r8_83 and r8_83.IsActive and r8_83.ManualItemId ~= r2_83 then
      r8_83:OnOtherDroneFoundPlayer()
    end
  end
end
function r2_0.OnDroneChangeToInit(r0_84, r1_84, r2_84)
  -- line: [1169, 1182] id: 84
  if not r0_84.DroneGroup or not r0_84.DroneGroup[r1_84] then
    return 
  end
  local r3_84 = true
  for r7_84 = 1, #r0_84.DroneGroup[r1_84], 1 do
    local r8_84 = r0_84.DroneGroup[r1_84][r7_84]
    local r9_84 = r0_84.ManualActiveCombat:Find(r8_84)
    if r8_84 ~= r2_84 and r9_84.IsActive and (not r9_84.RotateFinish or r9_84.AlertValue > 0) then
      r3_84 = false
    end
  end
  return r3_84
end
function r2_0.OnDroneAlertValueReset(r0_85, r1_85, r2_85)
  -- line: [1184, 1206] id: 85
  if not r0_85.DroneGroup or not r0_85.DroneGroup[r1_85] then
    return 
  end
  local r3_85 = true
  for r7_85 = 1, #r0_85.DroneGroup[r1_85], 1 do
    if r0_85.ManualActiveCombat:Find(r0_85.DroneGroup[r1_85][r7_85]).AlertValue > 0 then
      r3_85 = false
      break
    end
  end
  if r3_85 then
    for r7_85 = 1, #r0_85.DroneGroup[r1_85], 1 do
      local r9_85 = r0_85.ManualActiveCombat:Find(r0_85.DroneGroup[r1_85][r7_85])
      if r9_85 and r9_85.IsActive then
        r9_85:OnAllGroupDroneAlertZero()
        r9_85:OnDroneStateChange(0)
      end
    end
  end
end
function r2_0.ChangeMechanismInteractiveInSpecialQuest(r0_86, r1_86, r2_86, r3_86)
  -- line: [1209, 1229] id: 86
  local r4_86 = UE4.UGameplayStatics.GetGameMode(r0_86)
  if r2_86 == "Part" then
    for r9_86, r10_86 in pairs(r4_86.BPBornRegionActor) do
      r0_86:ChangeMechanismInteractive(r10_86, r1_86, false)
    end
    -- close: r5_86
    for r9_86, r10_86 in pairs(r3_86) do
      local r11_86 = r4_86.BPBornRegionActor:Find(r10_86)
      if not r11_86 then
        GWorld.logger.error("特殊任务通用配置,机关ID" .. r10_86 .. "错误")
        return 
      end
      r0_86:ChangeMechanismInteractive(r11_86, false, false)
    end
    -- close: r5_86
  elseif r2_86 == "Off" then
    r0_86:ChangeMechanismInteractive(nil, r1_86, true)
  end
end
function r2_0.ChangeMechanismInteractive(r0_87, r1_87, r2_87, r3_87)
  -- line: [1231, 1250] id: 87
  if r3_87 then
    if r0_87.MechanismInteractiveClose == nil then
      r0_87.MechanismInteractiveClose = {}
    end
    r0_87.MechanismInteractiveClose[0] = r2_87
    return 
  end
  if not IsValid(r1_87) or not r1_87.BpBorn then
    return 
  end
  if r2_87 == false and r0_87.MechanismInteractiveClose[r1_87.Eid] ~= nil then
    r0_87.MechanismInteractiveClose[r1_87.Eid] = nil
    return 
  end
  if r0_87.MechanismInteractiveClose == nil then
    r0_87.MechanismInteractiveClose = {}
  end
  r0_87.MechanismInteractiveClose[r1_87.Eid] = r2_87
end
function r2_0.GetMechanismInteractiveInSpecialQuest(r0_88, r1_88)
  -- line: [1252, 1258] id: 88
  -- notice: unreachable block#6
  if r1_88.BpBorn and r0_88.MechanismInteractiveClose ~= nil and r0_88.MechanismInteractiveClose[0] == true then
    return false
  end
  local r2_88 = r0_88.MechanismInteractiveClose
  if r2_88 ~= nil then
    r2_88 = not r0_88.MechanismInteractiveClose[r1_88.Eid]
  else
    r2_88 = true
  end
  return r2_88
end
function r2_0.OnRep_PartyPlayerDisPercentValues(r0_89)
  -- line: [1269, 1272] id: 89
  r0_89:UpdatePatryPlayerOrdinal()
  EventManager:FireEvent(EventID.OnPartyProgressUpdate)
end
function r2_0.ShowDungeonError(r0_90, r1_90, r2_90, r3_90, r4_90)
  -- line: [1278, 1343] id: 90
  local r5_90 = UE4.URuntimeCommonFunctionLibrary.IsDistribution()
  local r6_90 = UE4.URuntimeCommonFunctionLibrary.EnableLogInShipping()
  if r5_90 and not r6_90 then
    return 
  end
  local r7_90 = ""
  local r8_90 = nil
  if IsStandAlone(r0_90) then
    r7_90 = "StandAlone"
    r8_90 = GWorld:GetAvatar()
  elseif IsDedicatedServer(r0_90) then
    r7_90 = "DedicatedServer"
    r8_90 = GWorld:GetDSEntity()
  elseif IsClient(r0_90) then
    r7_90 = "Client"
    r8_90 = GWorld:GetAvatar()
  end
  if not r8_90 then
    return 
  end
  local r9_90 = "=========================================================\n"
  local r10_90 = {
    r9_90,
    "报错文本:\n\t",
    tostring(r1_90),
    "\n"
  }
  table.insert(r10_90, r9_90)
  r0_90:FillNetMode(r10_90, r7_90)
  r0_90:FillGameStateLog(r10_90)
  if r7_90 ~= "DedicatedServer" then
    r0_90:FillLevelLog(r10_90)
  end
  table.insert(r10_90, r9_90)
  r0_90:FillTraceBack(r10_90)
  table.insert(r10_90, r9_90)
  if r4_90 then
    r2_90 = r0_0.DungeonErrorType[r2_90]
    r3_90 = r0_0.DungeonErrorTitle[r3_90]
  end
  local r11_90 = table.concat(r10_90)
  if UE4.URuntimeCommonFunctionLibrary.IsPlayInEditor(r0_90) then
    ScreenPrint("副本报错:\n" .. r11_90)
  end
  r8_90:SendToFeiShuForRegionMgr(r11_90, "关卡报错 | " .. tostring(r2_90) .. " | " .. tostring(r2_90) .. " | " .. r7_90)
  r8_90:SendTraceToQaWeb({
    first = GText("关卡报错"),
    second = r2_90,
    third = r3_90,
  }, {
    title = GText("详细信息"),
    trace_content = r11_90,
  })
end
function r2_0.FillNetMode(r0_91, r1_91, r2_91)
  -- line: [1345, 1357] id: 91
  table.insert(r1_91, "环境: ")
  if r2_91 == "DedicatedServer" then
    table.insert(r1_91, "联机DS")
  elseif r2_91 == "Client" then
    table.insert(r1_91, "联机客户端")
  elseif r2_91 == "StandAlone" then
    table.insert(r1_91, "单机")
  else
    table.insert(r1_91, "未知")
  end
  table.insert(r1_91, "\n")
end
function r2_0.FillGameStateLog(r0_92, r1_92)
  -- line: [1359, 1365] id: 92
  table.insert(r1_92, "副本Id: " .. r0_92.DungeonId .. "\n")
  table.insert(r1_92, "玩法类型: " .. r0_92.GameModeType .. "\n")
  table.insert(r1_92, "副本状态: " .. EGameModeState:GetNameByValue(r0_92.GameModeState) .. "\n")
  table.insert(r1_92, "副本进度: " .. r0_92.DungeonProgress .. "\n")
end
function r2_0.FillLevelLog(r0_93, r1_93)
  -- line: [1368, 1395] id: 93
  pcall(function()
    -- line: [1369, 1394] id: 94
    local r0_94 = UE4.UGameplayStatics.GetPlayerCharacter(r0_93, 0)
    local r1_94 = UE4.URuntimeCommonFunctionLibrary.GetLevelLoadJsonName(r0_94)
    table.insert(r1_93, string.format("当前玩家进的拼接关卡: %s", r1_94) .. "\n")
    local r6_94 = require("rapidjson").decode(UE4.URuntimeCommonFunctionLibrary.LoadFile(UE4.UKismetSystemLibrary.GetProjectContentDirectory() .. "Script/Datas/Houdini_data/" .. r1_94 .. ".json"))
    local r7_94 = r0_94.CurrentLevelId
    for r12_94, r13_94 in pairs(r6_94.points) do
      for r17_94 = 1, r7_94:Length(), 1 do
        local r18_94 = r7_94:Get(r17_94)
        if tostring(r13_94.id) == r18_94 then
          local r19_94 = r13_94.art_path
          if r19_94 == "" then
            r19_94 = string.gsub(r13_94.struct, "Data_Design", "Data_Art", 1)
          end
          table.insert(r1_93, string.format("所在美术关卡: %s, 关卡id: %s", r19_94, r18_94) .. "\n")
        end
      end
    end
    -- close: r8_94
  end)
end
function r2_0.FillTraceBack(r0_95, r1_95)
  -- line: [1397, 1401] id: 95
  table.insert(r1_95, "Traceback:\n\t")
  table.insert(r1_95, debug.traceback())
  table.insert(r1_95, "\n")
end
function r2_0.InitPickupNiagaraPath(r0_96)
  -- line: [1405, 1409] id: 96
  for r5_96, r6_96 in pairs(r0_0.PickupNiagaraPaths) do
    r0_96.PickupNiagaraPaths:Add(r6_96)
  end
  -- close: r1_96
end
function r2_0.AddEvent_UpdateCNPCFlexible(r0_97)
  -- line: [1411, 1413] id: 97
  EventManager:AddEvent(EventID.SetCustomNpcFlexibShowOrHideDynamic, r0_97, r0_97.UpdateCNPCFlexible)
end
function r2_0.RemoveEvent_UpdateCNPCFlexible(r0_98)
  -- line: [1415, 1417] id: 98
  EventManager:RemoveEvent(EventID.SetCustomNpcFlexibShowOrHideDynamic, r0_98)
end
function r2_0.DungeonSafePlayTalk_Lua(r0_99, r1_99)
  -- line: [1420, 1430] id: 99
  if GWorld.GameInstance:GetLoadingUI() then
    EventManager:AddEvent(EventID.OnCloseLoadingEnableStory, r0_99, function()
      -- line: [1423, 1426] id: 100
      EventManager:RemoveEvent(EventID.OnCloseLoadingEnableStory, r0_99)
      UE4.UPlayTalkAsyncAction.PlayTalk(r0_99, r1_99, nil)
    end)
  else
    UE4.UPlayTalkAsyncAction.PlayTalk(r0_99, r1_99, nil)
  end
end
function r2_0.ClientSafeRunStory(r0_101, r1_101, r2_101, r3_101)
  -- line: [1432, 1442] id: 101
  if GWorld.GameInstance:GetLoadingUI() then
    EventManager:AddEvent(EventID.OnCloseLoadingEnableStory, r0_101, function()
      -- line: [1435, 1438] id: 102
      EventManager:RemoveEvent(EventID.OnCloseLoadingEnableStory, r0_101)
      GWorld.StoryMgr:RunStory(r1_101, r2_101, nil, r3_101, r3_101)
    end)
  else
    GWorld.StoryMgr:RunStory(r1_101, r2_101, nil, r3_101, r3_101)
  end
end
function r2_0.SpawnClientEventManager(r0_103)
  -- line: [1445, 1464] id: 103
  if IsDedicatedServer(r0_103) then
    return 
  end
  local r2_103 = DataMgr.Dungeon[GWorld.GameInstance:GetCurrentDungeonId()]
  if not r2_103 then
    return 
  end
  local r3_103 = r2_103.DungeonType
  local r4_103 = string.format(r0_0.ClientEventManagerClassPath, r3_103, r3_103)
  if not UResourceLibrary.CheckResourceExistOnDisk(r4_103) then
    return 
  end
  local r5_103 = UE4.UClass.Load(r4_103)
  if not r5_103 then
    return 
  end
  r0_103.ClientEventManager = r0_103:GetWorld():SpawnActor(r5_103, FTransform(), UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn)
end
function r2_0.TriggerClientEvent(r0_104, r1_104)
  -- line: [1466, 1480] id: 104
  if not r0_104.ClientEventManager then
    return 
  end
  try({
    exec = function()
      -- line: [1472, 1474] id: 105
      r0_104.ClientEventManager[r1_104](r0_104.ClientEventManager)
    end,
    catch = function(r0_106)
      -- line: [1475, 1478] id: 106
      DebugPrint(ErrorTag, "TriggerClientEvent Error! FuncName: " .. r1_104 .. " traceback: ")
      Traceback(ErrorTag, r0_106, false)
    end,
  })
end
AssembleComponents(r2_0)
return r2_0
