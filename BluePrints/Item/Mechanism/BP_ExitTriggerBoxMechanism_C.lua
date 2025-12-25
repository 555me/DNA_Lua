-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Item\Mechanism\BP_ExitTriggerBoxMechanism_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("Utils.CommonUtils")
local r1_0 = Class("BluePrints.Common.Triggers.BP_AOITriggerBox_C")
local r2_0 = {}
local r3_0 = {
  Play = 1,
  Dead = 2,
  WaitExit = 3,
  Leave = 4,
}
function r1_0.Initialize(r0_1, r1_1)
  -- line: [21, 25] id: 1
  r1_0.Super.Initialize(r1_0, r1_1)
  r0_1.bShowingCountdownToast = false
  r0_1.PrepareExitPlayers = {}
end
function r1_0.ReceiveBeginPlay(r0_2)
  -- line: [27, 41] id: 2
  print(_G.LogTag, "ReceiveBeginPlay", r0_2:GetName(), r0_2.BpBorn)
  r0_2.Overridden.ReceiveBeginPlay(r0_2)
  r0_2:ActiveGuide("Add")
  r0_2.GameMode = UE4.UGameplayStatics.GetGameMode(r0_2)
  if not IsDedicatedServer(r0_2) then
    return 
  end
  r0_2.GameMode.EMGameState:RegisterGameModeEvent("OnExit", r0_2, r0_2.OnAvatarExit)
  r0_2.GameMode.EMGameState:RegisterGameModeEvent("OnEnter", r0_2, r0_2.OnAvatarEnter)
  EventManager:AddEvent(EventID.CharDie, r0_2, r0_2.OnCharDie)
end
function r1_0.OnRep_Size(r0_3)
  -- line: [43, 45] id: 3
  r0_3:SetBoxExtent(r0_3.Size)
end
function r1_0.AuthorityInitInfo(r0_4, r1_4)
  -- line: [47, 70] id: 4
  r1_0.Super.AuthorityInitInfo(r0_4, r1_4)
  if not IsDedicatedServer(r0_4) then
    return 
  end
  if GWorld.bDebugServer then
    return 
  end
  local r2_4 = r0_4.GameMode.AvatarInfos and {}
  for r8_4, r9_4 in pairs(GWorld:GetDSEntity().HasLeaveAvatars) do
    r2_4[r8_4] = nil
  end
  -- close: r4_4
  for r8_4, r9_4 in pairs(r2_4) do
    r0_4.PrepareExitPlayers[r8_4] = r3_0.Play
  end
  -- close: r4_4
  r0_4.Size = r1_4.Creator.TriggerBoxContent
end
function r1_0.OnAvatarExit(r0_5, r1_5)
  -- line: [72, 90] id: 5
  print(_G.LogTag, "OnAvatarExit")
  local r2_5 = false
  for r6_5 = 1, r1_5:Length(), 1 do
    local r7_5 = r1_5:GetRef(r6_5)
    if not rawget(r0_5.PrepareExitPlayers, r7_5) then
      error("Unauthorized Avatar")
    end
    if r0_5.PrepareExitPlayers[r7_5] ~= r3_0.Leave then
      r0_5.PrepareExitPlayers[r7_5] = r3_0.Leave
      r2_5 = true
    end
  end
  if r2_5 then
    r0_5:CheckTimerAndExit()
  end
end
function r1_0.OnAvatarEnter(r0_6, r1_6)
  -- line: [92, 105] id: 6
  print(_G.LogTag, "OnAvatarEnter")
  local r2_6 = Battle(r0_6):GetEntity(r1_6)
  if not r2_6 then
    error("Character is not exist.", r1_6)
    return 
  end
  local r3_6 = r2_6:GetOwner().AvatarEidStr
  if not rawget(r0_6.PrepareExitPlayers, r3_6) then
    error("Unauthorized Avatar")
    return 
  end
  r0_6.PrepareExitPlayers[r3_6] = r3_0.Play
end
function r1_0.OnCharDie(r0_7, r1_7)
  -- line: [107, 128] id: 7
  print(_G.LogTag, "OnCharDie")
  local r2_7 = Battle(r0_7):GetEntity(r1_7)
  if not r2_7 then
    error("Character is not exist.")
  end
  if r2_7:CheckCanRecovery() then
    return 
  end
  local r3_7 = r2_7:GetOwner().AvatarEidStr
  if not rawget(r0_7.PrepareExitPlayers, r3_7) then
    error("Unauthorized Avatar")
  end
  if r0_7.PrepareExitPlayers[r3_7] == r3_0.Play then
    r0_7.PrepareExitPlayers[r3_7] = r3_0.Dead
  end
  r0_7:CheckTimerAndExit()
end
function r1_0.ExitInGameWin(r0_8)
  -- line: [130, 167] id: 8
  print(_G.LogTag, "ExitInGameWin")
  if r0_8:IsExistTimer("ExitTimeDownTick") then
    r0_8:RemoveExitTimer()
  end
  r0_8.GameMode:TriggerDungeonComponentFun("Trigger" .. r0_8.GameMode.EMGameState.GameModeType .. "Win")
  if r0_8.GameMode.EMGameState.GameModeType ~= "Party" then
    r0_8.GameMode:TriggerDungeonWin()
  end
end
function r1_0.OnBeginOverlapLua(r0_9, r1_9)
  -- line: [170, 188] id: 9
  if IsAuthority(r0_9) then
    local r2_9 = r1_9:Cast(UE4.APlayerCharacter)
    if not r2_9 then
      return 
    end
    r0_9.GameMode:TriggerDungeonComponentFun("Trigger" .. r0_9.GameMode.EMGameState.GameModeType .. "ExitMechanismOverlap", r1_9)
    r0_9:AddPlayer(r2_9)
    AudioManager(r0_9):PauseDungeonBGM()
  elseif IsClient(r0_9) then
    r2_0[r1_9] = true
  end
end
function r1_0.AddPlayer(r0_10, r1_10)
  -- line: [190, 204] id: 10
  if IsStandAlone(r0_10) then
    r0_10:ExitInGameWin()
    return 
  end
  local r2_10 = r1_10:GetOwner().AvatarEidStr
  if not rawget(r0_10.PrepareExitPlayers, r2_10) then
    error("Unauthorized Avatar")
  end
  DebugPrint("AddPlayer")
  r0_10.PrepareExitPlayers[r2_10] = r3_0.WaitExit
  r0_10:CheckTimerAndExit()
  r0_10:RefreshPlayerNumInfo()
end
function r1_0.CheckTimerAndExit(r0_11)
  -- line: [206, 239] id: 11
  if not r0_11.GameMode.EMGameState:CheckGameModeStateEnable() then
    return 
  end
  local r1_11 = true
  local r2_11 = false
  for r7_11, r8_11 in pairs(r0_11.PrepareExitPlayers) do
    if r8_11 == r3_0.Play then
      r1_11 = false
    elseif r8_11 == r3_0.WaitExit then
      r2_11 = true
    end
  end
  -- close: r3_11
  if r1_11 then
    r0_11:ExitInGameWin()
    return 
  end
  if r2_11 then
    if not r0_11:IsExistTimer("ExitTimeDownTick") then
      r0_11:ResetExitTimer()
      if not r0_11.bShowingCountdownToast and r0_0.TableLength(r0_11.PrepareExitPlayers) > 1 then
        r0_11:ShowOrHideCountdownToast(true)
      end
    end
  else
    r0_11:RemoveExitTimer()
  end
end
function r1_0.OnEndOverlapLua(r0_12, r1_12)
  -- line: [242, 283] id: 12
  if IsClient(r0_12) then
    r2_0[r1_12] = nil
  end
  if not IsDedicatedServer(r0_12) then
    return 
  end
  local r2_12 = r1_12:Cast(UE4.APlayerCharacter)
  if not r2_12 or not r2_12:GetOwner() then
    return 
  end
  local r3_12 = r2_12:GetOwner().AvatarEidStr
  if not rawget(r0_12.PrepareExitPlayers, r3_12) then
    error("Unauthorized Avatar")
  end
  if r2_12:IsRealDead() then
    r0_12.PrepareExitPlayers[r3_12] = r3_0.Dead
    r0_12:CheckTimerAndExit()
  else
    r0_12.PrepareExitPlayers[r3_12] = r3_0.Play
  end
  r0_12:RefreshPlayerNumInfo()
  for r8_12, r9_12 in pairs(r0_12.PrepareExitPlayers) do
    if r9_12 == r3_0.WaitExit then
      return 
    end
  end
  -- close: r4_12
  if r0_12.GameMode.EMGameState.GameModeType == "Party" then
    return 
  end
  r0_12:RemoveExitTimer()
end
function r1_0.RemoveExitTimer(r0_13)
  -- line: [286, 293] id: 13
  DebugPrint("BP_ExitTriggerBoxMechanism_C:RemoveExitTimer")
  r0_13:RemoveTimer("ExitTimeDownTick")
  r0_13.ExitCountDown = -1
  if r0_13.bShowingCountdownToast then
    r0_13:ShowOrHideCountdownToast(false)
  end
end
function r1_0.ResetExitTimer(r0_14)
  -- line: [296, 301] id: 14
  r0_14:RemoveExitTimer()
  r0_14.ExitCountDown = UE4.UGameplayStatics.GetGameState(r0_14).ExitCountDown
  r0_14:AddTimer(1, r0_14.UpdatePage, true, 0, "ExitTimeDownTick")
end
function r1_0.UpdatePage(r0_15)
  -- line: [304, 322] id: 15
  DebugPrint("BP_ExitTriggerBoxMechanism_C:UpdatePage")
  if r0_15.ExitCountDown + -1 < 0 then
    if r0_15.ExitCountDown ~= 0 then
      r0_15.ExitCountDown = 0
    end
  else
    r0_15.ExitCountDown = r0_15.ExitCountDown + -1
  end
  DebugPrint("BP_ExitTriggerBoxMechanism_C:UpdatePage", r0_15.bShowingCountdownToast, r0_15.ExitCountDown)
  if r0_15.bShowingCountdownToast and (r0_15.ExitCountDown == 0 or not r0_15:IsSomeoneWaiting()) and r0_15.GameMode.EMGameState.GameModeType ~= "Party" then
    r0_15:ShowOrHideCountdownToast(false)
  end
  if r0_15.ExitCountDown == 0 then
    r0_15:ExitInGameWin()
  end
end
function r1_0.HandleExitCountDownValueChange(r0_16)
  -- line: [325, 344] id: 16
end
function r1_0.IsSomeoneWaiting(r0_17)
  -- line: [346, 354] id: 17
  local r1_17 = false
  r0_17.ExitInfo.WaitingPlayerNum, r0_17.ExitInfo.TotalPlayerNum = r0_17:GetPlayerNum()
  r1_17 = r2_17 > 0
  local r4_17 = DebugPrint
  local r5_17 = "IsSomeoneWaiting Res = "
  local r6_17 = nil	-- notice: implicit variable refs by block#[6]
  if r1_17 == true then
    r6_17 = "true"
    if not r6_17 then
      ::label_18::
      r6_17 = "false"
    end
  else
    goto label_18	-- block#5 is visited secondly
  end
  r4_17(r5_17 .. r6_17, r2_17)
  return r1_17
end
function r1_0.GetPlayerNum(r0_18)
  -- line: [356, 365] id: 18
  local r1_18 = 0
  local r2_18 = 0
  for r7_18, r8_18 in pairs(r0_18.PrepareExitPlayers and {}) do
    if r8_18 == r3_0.WaitExit then
      r1_18 = r1_18 + 1
    end
    r2_18 = r2_18 + 1
  end
  -- close: r3_18
  return r1_18, r2_18
end
function r1_0.OnRep_ExitInfo(r0_19)
  -- line: [367, 386] id: 19
end
function r1_0.ShowOrHideCountdownToast(r0_20, r1_20)
  -- line: [388, 399] id: 20
  if r1_20 == nil then
    return 
  end
  local r2_20 = UE4.UGameplayStatics.GetGameState(r0_20)
  if r2_20 then
    r2_20.ExitInfo.bShowExitCountdownToast = r1_20
    r2_20.ExitInfo.StartExitCountdownTime = r2_20.ReplicatedTimeSeconds
    r0_20.bShowingCountdownToast = r1_20
    if r1_20 then
      r2_20.ExitInfo.WaitingPlayerNum, r2_20.ExitInfo.TotalPlayerNum = r0_20:GetPlayerNum()
    end
  end
end
function r1_0.EMActorDestroy(r0_21, r1_21)
  -- line: [401, 403] id: 21
  r0_21:OnEMActorDestroy(r1_21)
end
function r1_0.OnEMActorDestroy(r0_22, r1_22)
  -- line: [405, 409] id: 22
  r0_22:RemoveExitTimer()
  r0_22:K2_DestroyActor()
  EventManager:RemoveEvent(EventID.CharDie)
end
function r1_0.ReceiveActorBeginOverlap(r0_23, r1_23)
  -- line: [411, 413] id: 23
  r0_23.Overridden.ReceiveActorBeginOverlap(r0_23, r1_23)
end
function r1_0.ReceiveActorEndOverlap(r0_24, r1_24)
  -- line: [415, 417] id: 24
  r0_24.Overridden.ReceiveActorEndOverlap(r0_24, r1_24)
end
function r1_0.IsPlayerWaiting(r0_25, r1_25)
  -- line: [420, 436] id: 25
  local r2_25 = false
  DebugPrint("BP_ExitTriggerBoxMechanism_C:IsPlayerWaiting ", r1_25)
  if r1_25 then
    if UE4.URuntimeCommonFunctionLibrary.CheckBoxAndCapsuleOverlap(r1_25.CapsuleComponent, r0_25.CollisionComponent) then
      return true
    end
    for r7_25, r8_25 in pairs(r2_0 and {}) do
      if r1_25 == r7_25:Cast(UE4.APlayerCharacter) then
        r2_25 = true
        break
      end
    end
    -- close: r3_25
  end
  return r2_25
end
function r1_0.GetUnitRealType(r0_26)
  -- line: [438, 442] id: 26
  if r0_26.UnitId and DataMgr.Mechanism[r0_26.UnitId] then
    return DataMgr.Mechanism[r0_26.UnitId].UnitRealType
  end
end
function r1_0.RefreshPlayerNumInfo(r0_27)
  -- line: [444, 449] id: 27
  local r1_27 = UE4.UGameplayStatics.GetGameState(r0_27)
  if r1_27 and r0_27.bShowingCountdownToast then
    r1_27.ExitInfo.WaitingPlayerNum, r1_27.ExitInfo.TotalPlayerNum = r0_27:GetPlayerNum()
  end
end
return r1_0
