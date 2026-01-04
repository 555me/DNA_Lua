-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Combat\Components\GameStateInterface.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("Utils.TimeUtils")
local r1_0 = require("Utils.MiscUtils")
local r2_0 = Class({
  "BluePrints.Common.TimerMgr"
})
function r2_0.InitGameStateInterface(r0_1)
  -- line: [9, 20] id: 1
  if not IsAuthority(r0_1) then
    return 
  end
  r0_1:RegisterGameModeEvent("OnEnter", r0_1, r0_1.OnEnter)
  r0_1:RegisterGameModeEvent("OnCustomEvent", r0_1, r0_1.OnCustomEvent)
  r0_1:RegisterGameModeEvent("OnPause", r0_1, r0_1.OnPause)
  r0_1:RegisterGameModeEvent("OnBattle", r0_1, r0_1.OnBattle)
  r0_1:RegisterGameModeEvent("OnExit", r0_1, r0_1.OnExit)
  r0_1:RegisterGameModeEvent("OnDisconnect", r0_1, r0_1.OnDisconnect)
end
function r2_0.GameModeEvent_Lua(r0_2, r1_2, ...)
  -- line: [23, 29] id: 2
  local r2_2 = r1_2 .. "_Lua"
  if r0_2[r2_2] ~= nil then
    DebugPrint("GameStateInterface 收到Custom事件广播进行转发：", r1_2)
    r0_2[r2_2](r0_2, ...)
  end
end
function r2_0.InitTimeCheckMgr(r0_3)
  -- line: [31, 38] id: 3
  if IsStandAlone(r0_3) or IsClient(r0_3) then
    r0_3:AddTimer(60, function()
      -- line: [34, 36] id: 4
      r0_0.RequestSetNowTime()
    end, true, 30, "ClientTimeReset", true)
  end
end
function r2_0.OnEnter(r0_5, r1_5)
  -- line: [42, 44] id: 5
  r0_5:MulticastOnEnter(r1_5)
end
function r2_0.OnExit(r0_6, r1_6)
  -- line: [46, 48] id: 6
  r0_6:MulticastOnExit(r1_6)
end
function r2_0.OnDisconnect(r0_7, r1_7)
  -- line: [50, 52] id: 7
  r0_7:MulticastOnDisconnect(r1_7)
end
function r2_0.OnCustomEvent(r0_8, r1_8, r2_8)
  -- line: [54, 58] id: 8
  if r2_8 == Const.GameModeEventServerClient then
    r0_8:MulticastOnCustomeEvent(r1_8)
  end
end
function r2_0.OnInit(r0_9)
  -- line: [60, 62] id: 9
  r0_9:MulticastGameModeEvent("OnInit")
end
function r2_0.OnEnd(r0_10, r1_10)
  -- line: [64, 66] id: 10
  r0_10:MulticastOnEnd(r1_10)
end
function r2_0.OnBattle(r0_11)
  -- line: [68, 70] id: 11
  r0_11:MulticastGameModeEvent("OnBattle")
end
function r2_0.OnPause(r0_12)
  -- line: [72, 74] id: 12
  r0_12:MulticastGameModeEvent("OnPause")
end
function r2_0.OnAlert(r0_13)
  -- line: [76, 78] id: 13
  r0_13:MulticastGameModeEvent("OnAlert")
end
function r2_0.OnEnterCommonAlert(r0_14)
  -- line: [80, 82] id: 14
  r0_14:MulticastGameModeEvent("OnEnterCommonAlert")
end
function r2_0.OnExitCommonAlert(r0_15)
  -- line: [84, 86] id: 15
  r0_15:MulticastGameModeEvent("OnExitCommonAlert")
end
function r2_0.OnRep_DungeonEvent_Lua(r0_16)
  -- line: [94, 126] id: 16
  if not r0_16.IsCanFreshDungeonEvent then
    DebugPrint("GameStateInterface  OnRep_DungeonEvent_Lua IsCanFreshDungeonEvent==false")
    return 
  end
  if GWorld.GameInstance:IsInTempScene() then
    DebugPrint("GameStateInterface  OnRep_DungeonEvent_Lua 因为在结算界面而阻断")
    return 
  end
  if not UE4.UGameplayStatics.GetPlayerCharacter(r0_16, 0) then
    DebugPrint("GameStateInterface  OnRep_DungeonEvent_Lua Player==nil")
    return 
  end
  if not r0_16.LastDungeonEvent then
    r0_16.LastDungeonEvent = {}
  end
  DebugPrint("GameStateInterface  OnRep_DungeonEvent_Lua 收到事件广播, 上一次事件数量：" .. #r0_16.LastDungeonEvent .. "    当前事件数量：" .. r0_16.DungeonEvent:Num())
  r0_16:PrintAllDungeonEvents()
  r0_16:TriggerUpdateDungeonEvent()
  r0_16.LastDungeonEvent = {}
  for r6_16 = 1, r0_16.DungeonEvent:Num(), 1 do
    if r0_16.DungeonEvent:GetValueByIdx(r6_16 + -1) ~= "" then
      r0_16.LastDungeonEvent[r6_16] = r0_16.DungeonEvent:GetValueByIdx(r6_16 + -1)
    else
      break
    end
  end
end
function r2_0.PrintAllDungeonEvents(r0_17)
  -- line: [128, 141] id: 17
  local r1_17 = ""
  for r6_17, r7_17 in pairs(r0_17.LastDungeonEvent and {}) do
    r1_17 = r1_17 .. r7_17 .. ", "
  end
  -- close: r2_17
  DebugPrint("GameStateInterface  OnRep_DungeonEvent_Lua 打印上一次事件内容   " .. r1_17)
  r1_17 = ""
  for r5_17 = 1, r0_17.DungeonEvent:Num(), 1 do
    r1_17 = r1_17 .. r0_17.DungeonEvent:GetValueByIdx(r5_17 + -1) .. ", "
  end
  DebugPrint("GameStateInterface  OnRep_DungeonEvent_Lua 打印当前DungeonEvent内容   " .. r1_17)
end
function r2_0.TriggerUpdateDungeonEvent(r0_18)
  -- line: [144, 199] id: 18
  local r1_18 = r0_18.DungeonEvent:Num()
  local r2_18 = 0
  local r3_18 = true
  local r4_18 = {}
  local r5_18 = {}
  DebugPrint("GameStateInterface @@@@@@  此次OnRep收到TriggerUpdateDungeonEvent", r2_18, r0_18.DungeonEvent:Num())
  if #r0_18.LastDungeonEvent == r1_18 and #r0_18.LastDungeonEvent ~= 0 then
    local r6_18 = false
    for r10_18 = 1, r0_18.DungeonEvent:Num(), 1 do
      local r11_18 = r0_18.DungeonEvent:GetValueByIdx(r10_18 + -1)
      if r11_18 ~= "" and not CommonUtils.HasValue(r0_18.LastDungeonEvent, r11_18) then
        r6_18 = true
        break
      end
    end
    if not r6_18 then
      r0_18:TriggerAddDungeonEvent(r0_18.DungeonEvent:GetValueByIdx(r1_18 + -1))
      return 
    end
  end
  for r10_18, r11_18 in pairs(r0_18.LastDungeonEvent and {}) do
    if r10_18 <= r1_18 and r0_18.DungeonEvent:GetValueByIdx(r10_18 + -1) == r11_18 and r3_18 then
      r2_18 = r10_18
    else
      r3_18 = false
      table.insert(r4_18, r11_18)
    end
  end
  -- close: r6_18
  for r9_18 = 1, r0_18.DungeonEvent:Num(), 1 do
    local r10_18 = r0_18.DungeonEvent:GetValueByIdx(r9_18 + -1)
    if r10_18 ~= "" and r2_18 < r9_18 then
      table.insert(r5_18, r10_18)
    end
  end
  for r10_18, r11_18 in pairs(r4_18) do
    if not CommonUtils.HasValue(r5_18, r11_18) then
      r0_18:TriggerRemoveDungeonEvent(r11_18)
    else
      CommonUtils.RemoveValue(r5_18, r11_18)
    end
  end
  -- close: r6_18
  for r10_18, r11_18 in pairs(r5_18) do
    r0_18:TriggerAddDungeonEvent(r11_18)
  end
  -- close: r6_18
end
function r2_0.TriggerAddDungeonEvent(r0_19, r1_19)
  -- line: [201, 223] id: 19
  if r1_19 == "" then
    DebugPrint("GameStateInterface  TriggerAddDungeonEvent 出现空事件")
    return 
  end
  local r2_19 = r1_19 .. "_Lua"
  DebugPrint("GameStateInterface  OnRep_DungeonEvent_Lua 收到增量事件：", r1_19)
  if r0_19[r2_19] ~= nil then
    DebugPrint("GameStateInterface  OnRep_DungeonEvent_Lua 执行增量事件：", r2_19)
    try({
      exec = function()
        -- line: [212, 214] id: 20
        r0_19[r2_19](r0_19)
      end,
      catch = function(r0_21)
        -- line: [215, 218] id: 21
        DebugPrint(ErrorTag, "AddDungeonEvent Error! EventName: " .. r1_19 .. " traceback: ")
        Traceback(ErrorTag, r0_21, false)
      end,
    })
  else
    DebugPrint("GameStateInterface  OnRep_DungeonEvent_Lua 未找到对应的事件：", r2_19)
  end
end
function r2_0.TriggerRemoveDungeonEvent(r0_22, r1_22)
  -- line: [225, 247] id: 22
  if r1_22 == "" then
    DebugPrint("GameStateInterface  TriggerRemoveDungeonEvent 出现空事件")
    return 
  end
  local r2_22 = "Remove" .. r1_22 .. "_Lua"
  DebugPrint("GameStateInterface  OnRep_DungeonEvent_Lua 收到Remove事件：", r1_22)
  if r0_22[r2_22] ~= nil then
    DebugPrint("GameStateInterface  OnRep_DungeonEvent_Lua 执行Remove事件：", r2_22)
    try({
      exec = function()
        -- line: [236, 238] id: 23
        r0_22[r2_22](r0_22)
      end,
      catch = function(r0_24)
        -- line: [239, 242] id: 24
        DebugPrint(ErrorTag, "RemoveDungeonEvent Error! EventName: " .. r1_22 .. " traceback: ")
        Traceback(ErrorTag, r0_24, false)
      end,
    })
  else
    DebugPrint("GameStateInterface  OnRep_DungeonEvent_Lua 未找到对应的事件：", r2_22)
  end
end
function r2_0.OnRep_GameModeReady(r0_25)
  -- line: [255, 260] id: 25
  DebugPrint("GameStateInterface  Client 收到OnRep_GameModeReady")
  if r0_25.bGameModeReady then
    r0_25:TryEndLoading("GameModeReady")
  end
end
function r2_0.OnInit_Lua(r0_26)
  -- line: [262, 276] id: 26
  DebugPrint("GameStateInterface  Client 收到事件OnInit_Lua")
  r0_26:LoadDungeonUI()
  r0_26:InitFbdRule()
  r0_26:TriggerClientEvent("OnClientInit")
  if r0_26.GameModeType == "SoloRaid" then
    r0_26.SoloRaidHistoryMaxScore = 0
    local r1_26 = GWorld:GetAvatar()
    if r1_26 and r1_26.RaidSeasons and r1_26.CurrentRaidSeasonId and r1_26.RaidSeasons[r1_26.CurrentRaidSeasonId] then
      r0_26.SoloRaidHistoryMaxScore = r1_26.RaidSeasons[r1_26.CurrentRaidSeasonId]:GetMaxRaidScore()
    end
  end
end
function r2_0.RemoveOnInit_Lua(r0_27)
  -- line: [278, 282] id: 27
  DebugPrint("GameStateInterface  Client 收到事件RemoveOnInit_Lua")
  r0_27:ResetFbdRule()
end
function r2_0.OnBattle_Lua(r0_28)
  -- line: [285, 286] id: 28
end
function r2_0.OnExit_Lua(r0_29, r1_29)
  -- line: [288, 323] id: 29
end
function r2_0.OnDisconnect_Lua(r0_30, r1_30)
  -- line: [325, 327] id: 30
end
function r2_0.OnCustomeEvent_Lua(r0_31, r1_31)
  -- line: [345, 351] id: 31
  local r2_31 = "On" .. r1_31 .. "_Lua"
  DebugPrint("GameStateInterface 收到事件OnCustomeEvent_Lua：", r1_31)
  if r0_31[r2_31] ~= nil then
    r0_31[r2_31](r0_31)
  end
end
function r2_0.OnDungeonVoteBegin_Lua(r0_32)
  -- line: [353, 356] id: 32
  EventManager:FireEvent(EventID.OnDungeonVoteBegin, r0_32.VoteValues)
  UIManager(r0_32):LoadUINew("Vote")
end
function r2_0.OnDungeonOneEnter_Lua(r0_33, r1_33)
  -- line: [358, 377] id: 33
  DebugPrint("gmy@Component:OnDungeonOneEnter_Lua", r1_33)
  local r3_33 = UE4.UGameplayStatics.GetGameInstance(r0_33)
  for r8_33, r9_33 in pairs(r0_33.PlayerArray) do
    if r9_33.Eid == r1_33 then
      local r10_33 = GWorld:GetMainPlayer()
      if r10_33 and r10_33.Eid ~= r1_33 then
        r0_33:DungeonOtherPlayerChange(r9_33, true)
        return 
      end
    end
  end
  -- close: r4_33
end
function r2_0.IsTeammate(r0_34, r1_34)
  -- line: [391, 393] id: 34
  return TeamController:GetModel():IsTeammateByAvatarEid(r1_34.AvatarEidStr)
end
function r2_0.DungeonOtherPlayerChange(r0_35, r1_35, r2_35)
  -- line: [395, 403] id: 35
  if IsClient(r0_35) and not r0_35:IsTeammate(r1_35) then
    if UIManager(r0_35):GetUIObj("TeamToast") then
      UIManager(r0_35):UnLoadUINew("TeamToast")
    end
    UIManager(r0_35):LoadUINew("TeamToast", r1_35, r2_35)
  end
end
function r2_0.RemoveOnDungeonVoteBegin_Lua(r0_36, r1_36, r2_36)
  -- line: [405, 407] id: 36
end
function r2_0.RescueCountDownUI_Lua(r0_37)
  -- line: [410, 421] id: 37
  DebugPrint("RescueUI: ShowCountDown")
  local r2_37 = UE4.UGameplayStatics.GetGameInstance(r0_37):GetGameUIManager()
  if r2_37 ~= nil then
    local r3_37 = r2_37:GetUIObj("DungeonCaptureFloat")
    if r3_37 == nil then
      r3_37 = r2_37:LoadUINew("DungeonCaptureFloat", r0_37.RescueCountDownTime, DataMgr.GlobalConstant.RescueCountdownPoint.ConstantValue)
    end
    r3_37:InitCaptureTimeUIOnShowDownTime()
  end
end
function r2_0.RemoveRescueCountDownUI_Lua(r0_38)
  -- line: [423, 433] id: 38
  DebugPrint("RescueUI: CloseCountDown")
  local r2_38 = UE4.UGameplayStatics.GetGameInstance(r0_38):GetGameUIManager()
  if r2_38 ~= nil then
    local r3_38 = r2_38:GetUIObj("DungeonCaptureFloat")
    if r3_38 then
      r3_38:Close()
    end
  end
end
function r2_0.OnRep_RescueCountDownTime(r0_39)
  -- line: [435, 450] id: 39
  DebugPrint("RescueUI: OnRep_RescueCountDownTime CurTime:", r0_39.RescueCountDownTime)
  EventManager:FireEvent(EventID.OnRepRescueCountDownTime)
  if r0_39.RescueCountDownTime <= 15 then
    local r2_39 = UE4.UGameplayStatics.GetGameInstance(r0_39):GetGameUIManager()
    for r8_39, r9_39 in pairs(r2_39:GetAllUINameByBPClass(UE4.UClass.Load(UIConst.DUNGEONINDICATOR.GuidePointMechLevel2))) do
      local r10_39 = r2_39:GetUIObj(r9_39)
      if r10_39 and not r10_39:IsAnimationPlaying(r10_39.Loop) then
        r10_39:PlayAnimation(r10_39.Loop, 0, 0)
      end
      return 
    end
    -- close: r4_39
  end
end
function r2_0.OnRep_bHostageInvincible(r0_40)
  -- line: [452, 455] id: 40
  DebugPrint("OnRep_bHostageInvincible", r0_40.bHostageInvincible)
  EventManager:FireEvent(EventID.NotifyClientChangeHostageInvincible, r0_40.bHostageInvincible)
end
function r2_0.HostageDyingCountDown_Lua(r0_41)
  -- line: [457, 474] id: 41
  DebugPrint("RescueUI: HostageDyingCountDown")
  EventManager:FireEvent(EventID.TriggerHostageGuideLoop, true)
  local r1_41 = UIManager(r0_41):GetUIObj("DungeonRescueTimeFloat")
  if r1_41 == nil then
    r1_41 = UIManager(r0_41):LoadUINew("DungeonRescueTimeFloat")
  end
  r1_41:InitRescueTimeFloatOnHostageDead()
  local r2_41 = UIManager(r0_41):GetUIObj("DungeonCaptureFloat")
  if r2_41 == nil then
    r2_41 = UIManager(r0_41):LoadUINew("DungeonCaptureFloat", 15, 15)
  end
  r2_41:InitCaptureTimeUIOnHostageDead(r0_41:GetHostagePhantomState())
end
function r2_0.GetHostagePhantomState(r0_42)
  -- line: [476, 482] id: 42
  for r5_42, r6_42 in pairs(r0_42.PhantomArray) do
    if IsValid(r6_42) and r6_42.bIsHostage then
      return r6_42
    end
  end
  -- close: r1_42
end
function r2_0.RemoveHostageDyingCountDown_Lua(r0_43)
  -- line: [484, 498] id: 43
  DebugPrint("RescueUI: RemoveHostageDyingCountDown")
  EventManager:FireEvent(EventID.TriggerHostageGuideLoop, false)
  local r1_43 = UIManager(r0_43):GetUIObj("DungeonRescueTimeFloat")
  if r1_43 ~= nil then
    r1_43:Close()
  end
  local r2_43 = UIManager(r0_43):GetUIObj("DungeonCaptureFloat")
  if r2_43 ~= nil then
    r2_43:Close()
  end
end
function r2_0.OnRepDungeonExitInfo(r0_44, r1_44, r2_44)
  -- line: [501, 534] id: 44
  local r4_44 = UE4.UGameplayStatics.GetGameInstance(r0_44):GetGameUIManager()
  if not r4_44 then
    return 
  end
  local r5_44 = r4_44:GetUIObj("DungeonCaptureFloat")
  local r6_44 = nil
  if r2_44 then
    r6_44 = GText("UI_Evacuated") .. tostring(r1_44.WaitingPlayerNum) .. "/" .. tostring(r1_44.TotalPlayerNum)
  else
    r6_44 = string.format(GText("UI_Evacuating"), r1_44.WaitingPlayerNum)
  end
  if r1_44.bShowExitCountdownToast then
    local r7_44 = r0_44.ExitCountDown - math.max(math.floor(r0_44.ReplicatedTimeSeconds - r1_44.StartExitCountdownTime), 0)
    DebugPrint("Show Exit Countdown Toast RemaingTime = " .. r7_44, r0_44.ReplicatedTimeSeconds, r1_44.StartExitCountdownTime)
    if r7_44 <= 0 then
      return 
    end
    if r5_44 then
      r5_44:Reset(r7_44, -1, r0_44.ReplicatedTimeSeconds)
      r5_44:UIStateChange_OnTarget()
    else
      r5_44 = r4_44:LoadUINew("DungeonCaptureFloat", r7_44, -1)
      r5_44:UIStateChange_OnTarget()
    end
    if r5_44 then
      r5_44:SetTitle(r6_44)
    end
  elseif r5_44 then
    r5_44:UIStateChange_AfterTarget()
  end
end
function r2_0.OnRep_ExitInfo(r0_45)
  -- line: [536, 550] id: 45
  local r1_45 = r0_45.MechanismMap:FindRef("ExitTrigger")
  local r2_45 = nil
  if r1_45 then
    r2_45 = r1_45.Array:ToTable()[1]
  end
  local r3_45 = r2_45 and r2_45:IsPlayerWaiting(UE4.UGameplayStatics.GetPlayerController(r0_45, 0).Character)
  DebugPrint("GameState:OnRep_ExitInfo", r2_45, r3_45)
  PrintTable(r0_45.ExitInfo)
  if r0_45.GameModeType == "Party" then
    EventManager:FireEvent(EventID.OnPlayerEnterToExit, r0_45.ExitInfo, r3_45)
  else
    r0_45:OnRepDungeonExitInfo(r0_45.ExitInfo, r3_45)
  end
end
function r2_0.SurvivalValueFinished_Lua(r0_46)
  -- line: [552, 560] id: 46
  DebugPrint("SurvivalUI: SurvivalValueFinished")
  local r3_46 = UE4.UGameplayStatics.GetGameInstance(r0_46):GetGameUIManager():GetUIObj("DungenonSurviveFloat")
  if r3_46 ~= nil then
    r3_46:OnEnd()
  end
end
function r2_0.CaptureMonsterRecovery_Lua(r0_47)
  -- line: [563, 566] id: 47
  DebugPrint("CaptureComponent: ShowCaptureMonsterRecovery_Lua")
  EventManager:FireEvent(EventID.ShowDungeonUI)
end
function r2_0.RemoveCaptureMonsterRecovery_Lua(r0_48)
  -- line: [568, 582] id: 48
  DebugPrint("CaptureComponent: CloseCaptureMonsterRecovery_Lua")
  EventManager:FireEvent(EventID.CloseDungeonUI)
  local r1_48 = GWorld.GameInstance:GetSceneManager()
  if IsValid(r1_48) and not IsDedicatedServer(r0_48) then
    local r3_48 = Battle(r0_48):GetEntity(r1_48.CaptureMonsterEid)
    if IsValid(r3_48) then
      r3_48:SetMonWaitForCaught(false)
      r3_48:SetCharacterTag("Idle")
    end
    r1_48:RecoverGuideIcon()
  end
end
function r2_0.Chapter01_Trafficway_Hunt3_Lua(r0_49)
  -- line: [585, 590] id: 49
  local r1_49 = r0_49.ClientTimerStruct:GetTimerInfo("Chapter01_Trafficway_Hunt3")
  DebugPrint("RegionDefenceUI: Chapter01_Trafficway_Hunt3", r1_49.Time, r1_49.TimeSeconds, GWorld:IsStandAlone())
  EventManager:FireEvent(EventID.DefenseTimerAdded, r1_49.Key, r1_49.Time, r1_49.TimeSeconds)
  EventManager:FireEvent(EventID.ShowDungeonUI)
end
function r2_0.RemoveChapter01_Trafficway_Hunt3_Lua(r0_50)
  -- line: [592, 596] id: 50
  local r1_50 = r0_50.ClientTimerStruct:GetTimerInfo("Chapter01_Trafficway_Hunt3")
  DebugPrint("RemoveRegionDefenceUI: Chapter01_Trafficway_Hunt3", r1_50.Time, r1_50.TimeSeconds, GWorld:IsStandAlone())
  EventManager:FireEvent(EventID.CloseDungeonUI)
end
function r2_0.DefenceCountDown_Lua(r0_51)
  -- line: [599, 605] id: 51
  local r1_51 = r0_51.ClientTimerStruct:GetTimerInfo("DefenceCountDown")
  DebugPrint("GameStateInterface 收到 DefenceCountDown_Lua", r0_51:GetLocalRole())
  EventManager:FireEvent(EventID.DefenseTimerAdded, r1_51.Key, r1_51.Time, r1_51.TimeSeconds)
  EventManager:FireEvent(EventID.ShowDungeonUI)
end
function r2_0.RemoveDefenceCountDown_Lua(r0_52)
  -- line: [607, 609] id: 52
  DebugPrint("GameStateInterface 收到 RemoveDefenceCountDown_Lua", r0_52:GetLocalRole())
end
function r2_0.OnWaveStart_Lua(r0_53)
  -- line: [611, 613] id: 53
  EventManager:FireEvent(EventID.OnWaveStart)
end
function r2_0.OnWaveEnd_Lua(r0_54)
  -- line: [615, 617] id: 54
  EventManager:FireEvent(EventID.OnWaveEnd)
end
function r2_0.OnSurvivalProFinishTutorial_Lua(r0_55)
  -- line: [619, 621] id: 55
  EventManager:FireEvent(EventID.SurvivalProFinishTutorial)
end
function r2_0.OnSurvivalProSurpossedLeave_Lua(r0_56)
  -- line: [623, 625] id: 56
  EventManager:FireEvent(EventID.SurvivalProSurpossedLeave)
end
function r2_0.OnSurvivalProBeginTutorial_Lua(r0_57)
  -- line: [627, 629] id: 57
  EventManager:FireEvent(EventID.SurvivalProBeginTutorial)
end
function r2_0.OnSabotageOptionalMissionSucceed_Lua(r0_58)
  -- line: [631, 638] id: 58
  if UE4.UGameplayStatics.GetGameInstance(r0_58):GetGameUIManager() == nil then
    return 
  end
end
function r2_0.InitFbdRule(r0_59)
  -- line: [640, 672] id: 59
  DebugPrint("InitFbdRule", r0_59.DungeonId)
  local r1_59 = DataMgr.Dungeon[r0_59.DungeonId]
  if not r1_59 then
    return 
  end
  local r2_59 = r1_59.FbdRule
  if not r2_59 then
    return 
  end
  local r3_59 = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if r2_59.NoBattleWheel and r2_59.NoBattleWheel ~= 0 and r3_59 then
    r3_59:DisableBattleWheel()
  end
  if r3_59 then
    if r2_59.NoSkill and r2_59.NoSkill ~= 0 then
      r3_59:ForbidAllSkills(true)
    end
    if r2_59.NoMelee and r2_59.NoMelee ~= 0 then
      r3_59:ForbidMeleeSkills(true)
    end
    if r2_59.NoRanged and r2_59.NoRanged ~= 0 then
      r3_59:ForbidRangedSkills(true)
    end
  end
end
function r2_0.ResetFbdRule(r0_60)
  -- line: [674, 706] id: 60
  DebugPrint("ResetFbdRule", r0_60.DungeonId)
  local r1_60 = DataMgr.Dungeon[r0_60.DungeonId]
  if not r1_60 then
    return 
  end
  local r2_60 = r1_60.FbdRule
  if not r2_60 then
    return 
  end
  local r3_60 = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if r2_60.NoBattleWheel and r2_60.NoBattleWheel ~= 0 and r3_60 then
    r3_60:EnableBattleWheel()
  end
  if r3_60 then
    if r2_60.NoSkill and r2_60.NoSkill ~= 0 then
      r3_60:ForbidAllSkills(false)
    end
    if r2_60.NoMelee and r2_60.NoMelee ~= 0 then
      r3_60:ForbidMeleeSkills(false)
    end
    if r2_60.NoRanged and r2_60.NoRanged ~= 0 then
      r3_60:ForbidRangedSkills(false)
    end
  end
end
function r2_0.LoadDungeonUI(r0_61, r1_61)
  -- line: [712, 771] id: 61
  local r2_61 = GWorld:GetAvatar()
  if not r2_61 then
    return 
  end
  local r3_61 = r0_61.GameModeType
  if r1_61 then
    r3_61 = string.sub(r1_61, 7)
  else
    if r3_61 == "Region" then
      return 
    end
    local r4_61 = true
    if r0_61.DungeonId and r2_61:CheckIsFirstEnterDungeonType(r0_61.DungeonId) and not r0_61.bShown then
      r0_61.bShown = true
      r4_61 = not r0_61:TryShowDungeonFirstGuide(r0_61.GameModeType)
    end
    if r4_61 and DataMgr.DungeonTypeToId[r3_61] then
      local r5_61 = DataMgr.DungeonTypeToId[r3_61].GuideId
      if r5_61 then
        local r6_61 = DataMgr.GuideBookConditionTwo.CompleteUIGuideId[r5_61]
        if r6_61 then
          for r11_61, r12_61 in pairs(r6_61) do
            if r12_61.GuideNoteId and not r2_61.GuideBook[r12_61.GuideNoteId] then
              DebugPrint("Not UnLock Last Time", r5_61)
              r2_61:GuideBookFinishSomething("CompleteUIGuideId", r5_61)
              break
            end
          end
          -- close: r7_61
        end
      end
    end
  end
  local r4_61 = CommonConst.DungeonUINameMap[r3_61]
  if r4_61 == "Disable" then
    return 
  end
  if r4_61 == "WidgetUI" then
    r0_61:LoadDungeonUIEMWdiget(r3_61)
  else
    r0_61:LoadDungeonUIState(r3_61, r4_61)
  end
end
function r2_0.LoadDungeonUIState(r0_62, r1_62, r2_62)
  -- line: [773, 786] id: 62
  local r3_62 = r0_62:GetToLoadDungeonUINames()
  if r3_62 then
    for r8_62, r9_62 in pairs(r3_62) do
      r0_62:RealLoadDungeonUI(r9_62)
    end
    -- close: r4_62
  elseif r2_62 then
    r0_62:RealLoadDungeonUI(r2_62)
  else
    ScreenPrint("LoadDungeonUI加载对应副本UI失败，没有填写默认值！GameModeType " .. r1_62)
  end
end
function r2_0.RealLoadDungeonUI(r0_63, r1_63)
  -- line: [788, 805] id: 63
  if r1_63 == "DungeonHijackFloat" then
    return 
  end
  if r1_63 == "DungeonCaptureFloat" then
    if not UIManager(r0_63):GetUIObj("DungeonCaptureFloat") then
      UIManager(r0_63):LoadUINew("DungeonCaptureFloat", 30, DataMgr.GlobalConstant.CaptureCountdownPoint.ConstantValue, true)
    end
    return 
  end
  if not UIManager(r0_63):GetUIObj(r1_63) then
    UIManager(r0_63):LoadUINew(r1_63)
  end
end
function r2_0.UnloadDungeonUI(r0_64, r1_64)
  -- line: [807, 829] id: 64
  local r2_64 = r0_64.GameModeType
  if r1_64 then
    r2_64 = string.sub(r1_64, 7)
  elseif r2_64 == "Region" then
    return 
  end
  local r3_64 = CommonConst.DungeonUINameMap[r2_64]
  local r4_64 = r0_64:GetToLoadDungeonUINames()
  if r4_64 then
    for r9_64, r10_64 in pairs(r4_64) do
      r0_64:RealCloseDungeonUI(r10_64)
    end
    -- close: r5_64
  elseif r3_64 then
    r0_64:RealCloseDungeonUI(r3_64)
  else
    ScreenPrint("CloseDungeonUI卸载对应副本UI失败！GameModeType " .. r2_64)
  end
end
function r2_0.RealCloseDungeonUI(r0_65, r1_65)
  -- line: [831, 836] id: 65
  local r2_65 = UIManager(r0_65):GetUIObj(r1_65)
  if r2_65 and r2_65.CloseDungeonUI then
    r2_65:CloseDungeonUI()
  end
end
function r2_0.GetToLoadDungeonUINames(r0_66)
  -- line: [838, 852] id: 66
  if not r0_66:IsInRegion() then
    return 
  end
  local r1_66 = r0_66.CurDungeonUIParamID
  if not r1_66 then
    return 
  end
  local r2_66 = DataMgr.DungeonUIParams[r1_66]
  if not r2_66 then
    return 
  end
  return r2_66.UIName
end
function r2_0.LoadDungeonUIEMWdiget(r0_67, r1_67)
  -- line: [854, 868] id: 67
  local r2_67 = CommonConst.DungeonEMWidgetUINameMap[r1_67]
  if not r2_67 then
    ScreenPrint("LoadDungoenUI加载对应副本WidgetUI失败，没有填写默认值！GameModeType " .. r1_67)
    return 
  end
  local r3_67 = UIManager(r0_67):_CreateWidgetNew(r2_67)
  if not r3_67 then
    ScreenPrint("LoadDungoenUI加载对应副本WidgetUI失败，创建Widget失败！WidgetUIName " .. r2_67)
    return 
  end
  r3_67:InitDungeonWidget()
end
function r2_0.OnRep_DungeonUIInfo(r0_68)
  -- line: [871, 875] id: 68
  DebugPrint("GameState:OnRep_DungeonUIInfo 客户端收到DungeonUIInfo数据", r0_68.DungeonUIInfo.TexturePath, r0_68.DungeonUIInfo.TextTitle, r0_68.DungeonUIInfo.TextMap)
  r0_68.HasDungeonUIInfoData = true
  r0_68:RealShowDungeonTask()
end
function r2_0.ShowDungeonTask_Lua(r0_69)
  -- line: [877, 884] id: 69
  DebugPrint("GameState:ShowDungeonTask_Lua 客户端收到DungeonUIInfo事件 之前的self.HasDungeonUIInfoEvent", r0_69.HasDungeonUIInfoEvent)
  if r0_69.HasDungeonUIInfoEvent then
    return 
  end
  r0_69.HasDungeonUIInfoEvent = true
  r0_69:RealShowDungeonTask()
end
function r2_0.RealShowDungeonTask(r0_70)
  -- line: [887, 915] id: 70
  DebugPrint("GameState:RealShowDungeonTask 客户端是否收到数据", r0_70.HasDungeonUIInfoData, "客户端是否收到事件", r0_70.HasDungeonUIInfoEvent)
  if not r0_70.HasDungeonUIInfoData or not r0_70.HasDungeonUIInfoEvent then
    return 
  end
  r0_70.HasDungeonUIInfoData = false
  DebugPrint("GameState:RealShowDungeonTask 客户端更新任务栏")
  (function()
    -- line: [896, 913] id: 71
    local r1_71 = UE4.UGameplayStatics.GetGameInstance(r0_70):GetGameUIManager()
    if not r1_71 then
      return 
    end
    local r2_71 = r1_71:GetUIObj("BattleMain")
    if not r2_71 then
      return 
    end
    local r3_71 = UIConst.DungeonTaskPath[r0_70.DungeonUIInfo.TexturePath] and ""
    r2_71.Pos_TaskBar:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r2_71.Pos_TaskBar:GetChildAt(0):SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r2_71.Pos_TaskBar:GetChildAt(0):SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r2_71.Pos_TaskBar:GetChildAt(0):OnLoaded()
    EventManager:FireEvent(EventID.OnReceiveTask, r3_71, r0_70.DungeonUIInfo.TextTitle, r0_70.DungeonUIInfo.TextMap)
  end)()
end
function r2_0.ShowRescuePanel_Lua(r0_72)
  -- line: [917, 921] id: 72
  if r0_72.GameModeType == "Rescue" then
    r0_72:TryToShowRescuePanel()
  end
end
function r2_0.UpdateSurvivalProBuffInfo_Lua(r0_73)
  -- line: [923, 933] id: 73
  local r2_73 = UE4.UGameplayStatics.GetGameInstance(r0_73):GetGameUIManager()
  if not r2_73 then
    return 
  end
  local r3_73 = r2_73:GetUIObj("DungenonSurviveFloat")
  if r3_73 then
    r3_73:ShowBuffInfo(r0_73.SurvivalProBuffInfo.PathIconList, r0_73.SurvivalProBuffInfo.TextMapList, r0_73.SurvivalProBuffInfo.Duration)
  end
end
function r2_0.TryToShowRescuePanel(r0_74)
  -- line: [935, 948] id: 74
  local r2_74 = UE4.UGameplayStatics.GetGameInstance(r0_74):GetGameUIManager()
  if r2_74 == nil then
    return 
  end
  local r3_74 = r2_74:GetUIObj("DungeonRescueFloat")
  if r3_74 then
    r3_74:UIStateChange_OnTarget()
  else
    r2_74:LoadUI(UIConst.DUNGEONDEFENCEFLOAT, "DungeonRescueFloat", UIConst.ZORDER_FOR_DESKTOP_TEMP, true)
  end
end
function r2_0.TryShowDungeonFirstGuide(r0_75, r1_75)
  -- line: [950, 979] id: 75
  if not GWorld:IsStandAlone() then
    return false
  end
  local r2_75 = UE4.UGameplayStatics.GetGameMode(r0_75)
  if not r2_75 then
    return false
  end
  if not r2_75:GetLevelLoader() then
    return false
  end
  if UE4.UGameplayStatics.GetGameInstance(r0_75):GetGameUIManager() == nil then
    return false
  end
  local r5_75 = DataMgr.DungeonTypeToId[r1_75]
  if r5_75 then
    r5_75 = USubsystemBlueprintLibrary.GetWorldSubsystem(GWorld.GameInstance, UGameFlowManager)
    local r6_75 = r5_75:CreateFlow("GuideMain")
    r6_75.OnBegin:Add(r6_75, function()
      -- line: [969, 974] id: 76
      UE4.UUIStateAsyncActionBase.ShowGuideUI(r0_75, DataMgr.DungeonTypeToId[r1_75].GuideId).OnGuideEnd:Add(r0_75, function()
        -- line: [971, 973] id: 77
        r5_75:RemoveFlow(r6_75)
      end)
    end)
    r5_75:AddFlow(r6_75)
    -- close: r5_75
  end
  r5_75 = true
  return r5_75
end
function r2_0.ShowDungeonToast_Lua(r0_78, r1_78, r2_78, r3_78, r4_78)
  -- line: [981, 1026] id: 78
  DebugPrint("ShowDungeonToast_Lua TextMapIndex", r1_78, "Duration", r2_78, "ToastType", r3_78)
  local r6_78 = UE4.UGameplayStatics.GetGameInstance(r0_78):GetGameUIManager()
  if r6_78 == nil then
    return 
  end
  if r3_78 == EToastType.Common then
    if r4_78 and r4_78 ~= 0 then
      r6_78:ShowUITip(UIConst.Tip_CommonTop, GText(r1_78), r2_78, nil, {
        Color = r4_78,
      })
    else
      r6_78:ShowUITip(UIConst.Tip_CommonTop, GText(r1_78), r2_78)
    end
  end
  if r3_78 == EToastType.Warning then
    r6_78:ShowUITip(UIConst.Tip_CommonWarning, GText(r1_78), r2_78, nil, r1_78)
  end
  if r3_78 == EToastType.SpecialQuestStart then
    r6_78:LoadUINew("ExploreToastTips", r1_78)
  end
  if r3_78 == EToastType.Success then
    r6_78:LoadUINew("ExploreToastSuccess", r1_78)
  end
  if r3_78 == EToastType.Failed then
    r6_78:LoadUINew("ExploreToastFail", r1_78)
  end
  if r3_78 == EToastType.Treasure then
    if r6_78:GetUIObj("TreasureToast") then
      r6_78:UnLoadUINew("TreasureToast")
    end
    r6_78:LoadUINew("TreasureToast", GText(r1_78), r2_78)
  end
  if r3_78 == EToastType.SabotageAlarm then
    local r7_78 = r6_78:LoadUINew("DestoryAlarm")
    if r7_78 then
      r7_78:InitializeData(r2_78, true)
    end
  end
end
function r2_0.UnShowDungeonToast_Lua(r0_79, r1_79, r2_79)
  -- line: [1029, 1038] id: 79
  local r4_79 = UE4.UGameplayStatics.GetGameInstance(r0_79):GetGameUIManager()
  if r4_79 == nil then
    return 
  end
  if r2_79 == EToastType.Warning then
    r4_79:HideWarningUITip(r1_79)
  end
end
function r2_0.ShowCountDownUI_Lua(r0_80, r1_80, r2_80, r3_80)
  -- line: [1040, 1051] id: 80
  local r5_80 = UE4.UGameplayStatics.GetGameInstance(r0_80):GetGameUIManager()
  if r5_80 == nil then
    return 
  end
  local r6_80 = r5_80:LoadUINew("DungeonCaptureFloat", r2_80, r3_80)
  if r6_80 then
    r6_80:SetTextFromGameMode(r1_80)
    r6_80:UIStateChange_OnTarget()
  end
end
function r2_0.HideCountDownUI_Lua(r0_81, r1_81)
  -- line: [1053, 1063] id: 81
  local r3_81 = UE4.UGameplayStatics.GetGameInstance(r0_81):GetGameUIManager()
  if r3_81 == nil then
    return 
  end
  local r4_81 = r3_81:GetUIObj("DungeonCaptureFloat")
  if r4_81 and r4_81.KeyToHideSelf == r1_81 then
    r3_81:UnLoadUINew("DungeonCaptureFloat")
  end
end
function r2_0.ShowBuffInfo_Lua(r0_82, r1_82, r2_82, r3_82)
  -- line: [1065, 1077] id: 82
  local r5_82 = UE4.UGameplayStatics.GetGameInstance(r0_82):GetGameUIManager()
  if r5_82 == nil then
    return 
  end
  local r6_82 = r5_82:GetUIObj("DungenonSurviveFloat")
  if not r6_82 then
    return 
  end
  r6_82:ShowBuffInfo(r1_82, r2_82, r3_82)
end
function r2_0.FireEventBuffChange_Lua(r0_83, r1_83, r2_83, r3_83)
  -- line: [1079, 1089] id: 83
  if not GWorld.GameInstance or not GWorld.Battle or r3_83 == nil then
    return 
  end
  local r4_83 = Battle(GWorld.GameInstance):GetEntity(r3_83)
  if r4_83 and rawget(r4_83, "TeammateUI") then
    rawget(r4_83, "TeammateUI"):ShowShortageUI(r1_83, r2_83)
  end
end
function r2_0.OnActiveSurvivalTime_Lua(r0_84)
  -- line: [1091, 1095] id: 84
  if IsAuthority(r0_84) then
    r0_84:SetDungeonUIState(Const.EDungeonUIState.OnTarget)
  end
end
function r2_0.OnDefenceWaveStart_Lua(r0_85)
  -- line: [1098, 1110] id: 85
  EventManager:FireEvent(EventID.OnDefenseWaveStart)
  for r5_85, r6_85 in pairs(r0_85.DefBaseMap) do
    if IsValid(r6_85) then
      r6_85:OnDefenceWaveStart()
    end
  end
  -- close: r1_85
end
function r2_0.OnDefenceWaveEnd_Lua(r0_86)
  -- line: [1112, 1120] id: 86
  AudioManager(r0_86):PlayUISound(nil, "event:/ui/common/battle_stage_success", nil, nil)
  EventManager:FireEvent(EventID.OnDefenceWaveEnd)
  for r5_86, r6_86 in pairs(r0_86.DefBaseMap) do
    if IsValid(r6_86) then
      r6_86:OnDefenceWaveEnd()
    end
  end
  -- close: r1_86
end
function r2_0.UpdateDungeonVote_Lua(r0_87, r1_87)
  -- line: [1122, 1174] id: 87
  local r2_87 = UGameplayStatics.GetPlayerCharacter(r0_87, 0)
  EventManager:RemoveEvent(EventID.OnDungeonVoteBegin, r0_87)
  if not r0_87.IsCanFreshDungeonEvent then
    EventManager:AddEvent(EventID.OnDungeonVoteBegin, r0_87, r0_87.UpdateDungeonVote_Lua)
    return 
  end
  if r1_87:Length() == 0 and UIManager(r0_87):GetUIObj("Vote") then
    if r2_87 then
      print(_G.LogTag, "LXZ  UpdateDungeonVote_Lua Clear VoteValues")
      r2_87:TriggerFreezeMove(false)
    end
    EventManager:FireEvent(EventID.OnRepDungeonVoteInterval)
    return 
  end
  print(_G.LogTag, "LXZ  UpdateDungeonVote_Lua", r1_87)
  if r1_87:FindRef(r2_87.Eid) == EVoteState.Forbid then
    return 
  end
  print(_G.LogTag, "LXZ  UpdateDungeonVote_Lua Load Vote bushiren")
  if not UIManager(r0_87):GetUIObj("Vote") and not GWorld.GameInstance:IsInTempScene() then
    local r3_87 = false
    for r7_87 = 1, r0_87.DungeonEvent:Num(), 1 do
      if r0_87.DungeonEvent:GetValueByIdx(r7_87 + -1) == "OnDungeonVoteBegin" then
        r3_87 = true
      end
    end
    if not r3_87 then
      return 
    end
    for r8_87, r9_87 in pairs(r1_87) do
      if r9_87 ~= EVoteState.Wait then
        return 
      end
    end
    -- close: r4_87
    if r2_87 then
      print(_G.LogTag, "LXZ  UpdateDungeonVote_Lua Load Vote")
      r2_87:TriggerFreezeMove(true)
    end
    UIManager(r0_87):LoadUINew("Vote")
  elseif UIManager(r0_87):GetUIObj("Vote") then
    EventManager:FireEvent(EventID.UpdateDungeonValues, r1_87)
    if not IsDedicatedServer(r0_87) and IsAuthority(r0_87) then
      EventManager:FireEvent(EventID.OnRepDungeonVoteInterval)
      r0_87:DealDungeonVoteResult()
    end
  end
end
function r2_0.UpdateDungeonLoadingProgress(r0_88)
  -- line: [1176, 1193] id: 88
  r0_88.LoadingProgressInfo = 0
  if r0_88.LevelLoaderReady then
    r0_88.LoadingProgressInfo = r0_88.LoadingProgressInfo + 50
  end
  r0_88.LoadingProgressInfo = r0_88.LoadingProgressInfo + r0_88:GetPreloadProgress() * 40
  if r0_88.bGameModeReady then
    r0_88.LoadingProgressInfo = r0_88.LoadingProgressInfo + 1
  end
  if r0_88.PlayerReady then
    r0_88.LoadingProgressInfo = r0_88.LoadingProgressInfo + 2
  end
  local r2_88 = UE4.UGameplayStatics.GetGameInstance(r0_88):GetLoadingUI()
  if r2_88 then
    r2_88:AddQuene(r0_88.LoadingProgressInfo)
  end
end
function r2_0.TryEndLoading(r0_89, r1_89)
  -- line: [1195, 1251] id: 89
  if not r0_89.LevelLoaderReady then
    if r0_89:GetCurrentLevelLoader() then
      r0_89.LevelLoaderReady = false
    else
      r0_89.LevelLoaderReady = true
    end
  else
    r0_89:UpdateDungeonLoadingProgress()
  end
  print(_G.LogTag, "TryEndLoading", r0_89.PlayerReady, r0_89.bGameModeReady, r0_89.LevelLoaderReady, r0_89:IsPreloadGameAssetsReady(), r1_89, r0_89.DungeonId)
  if r0_89.PlayerReady and r0_89.LevelLoaderReady and r0_89:NeedPreloadGameAssets() then
    r0_89:PreloadGameAssets()
  end
  if r0_89.bGameModeReady and r0_89.LevelLoaderReady and r0_89:IsPreloadGameAssetsReady() and r0_89:IsPreloadGameAssetsReady() then
    r0_89:PreCreateUnit()
  end
  if IsDedicatedServer(r0_89) then
    local r2_89 = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(r0_89, UE4.URolePreloadGameInstanceSubsystem)
    if r2_89 then
      r2_89:DSLoadBT()
    end
  end
  if r0_89.bGameModeReady and r0_89.LevelLoaderReady and r0_89:IsPreloadGameAssetsReady() and r0_89.bRegionPreCreateUnitReady then
    if (r0_89.PlayerReady or r1_0.IsListenServer(r0_89)) and not r0_89.EndLoadingSuccess then
      r0_89.EndLoadingSuccess = true
      UE4.UGameplayStatics.GetPlayerController(r0_89, 0):NotifyServerClientReady()
      local r3_89 = UE4.USubsystemBlueprintLibrary.GetWorldSubsystem(r0_89, UE4.UWorldCompositionSubSystem)
      if r3_89 then
        local r4_89 = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, URegionDataMgrSubsystem:StaticClass())
        if r4_89 then
          r4_89:SetRegionInitState(ERegionInitState.RegionEntityCreating)
        end
        r3_89:TickAsyncQueueReady()
      else
        local r4_89 = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, URegionDataMgrSubsystem:StaticClass())
        if r4_89 then
          r4_89:SetRegionInitState(ERegionInitState.AllReady)
        end
      end
      print(_G.LogTag, "SetSyncLoaderOptimization True")
      GWorld.GameInstance:SetSyncLoaderOptimization(true)
    else
      r0_89.EndLoadingSuccess = false
    end
  end
end
function r2_0.PreCreateUnit(r0_90)
  -- line: [1253, 1270] id: 90
  if not r0_90:RegionNeedPreCreateUnit() then
    r0_90.bRegionPreCreateUnitReady = true
    return 
  end
  local r1_90 = UE4.USubsystemBlueprintLibrary.GetWorldSubsystem(r0_90, UE4.UWorldCompositionSubSystem)
  if not r1_90 then
    r0_90.bRegionPreCreateUnitReady = true
    return 
  end
  local r2_90 = UE4.UGameplayStatics.GetGameMode(r0_90)
  if not r2_90 then
    r0_90.bRegionPreCreateUnitReady = true
    return 
  end
  r2_90:GetRegionDataMgrSubSystem():OnInitRecoverRegionData(false)
  r1_90:PreCreateUnit()
end
function r2_0.IsPreloadGameAssetsReady(r0_91)
  -- line: [1272, 1278] id: 91
  local r1_91 = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(r0_91, UE4.URolePreloadGameInstanceSubsystem)
  if not r1_91 or not r1_91:EnableOptimization() then
    return true
  end
  return r0_91.bPreloadAssetsReady
end
function r2_0.GetPreloadProgress(r0_92)
  -- line: [1280, 1286] id: 92
  local r1_92 = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(r0_92, UE4.URolePreloadGameInstanceSubsystem)
  if not r1_92 or not r1_92:EnableOptimization() or r0_92.bPreloadAssetsReady then
    return 1
  end
  return r1_92:GetAsyncLoadingProgress()
end
function r2_0.NeedPreloadGameAssets(r0_93)
  -- line: [1288, 1290] id: 93
  -- notice: unreachable block#3
  local r1_93 = r0_93:IsPreloadGameAssetsReady()
  if not r1_93 then
    r1_93 = not r0_93.bAssetsPreloading
  else
    r1_93 = false
  end
  return r1_93
end
function r2_0.PreloadGameAssets(r0_94)
  -- line: [1292, 1393] id: 94
  local r1_94 = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(r0_94, UE4.URolePreloadGameInstanceSubsystem)
  if not r1_94 then
    r0_94.bPreloadAssetsReady = true
    r0_94.bAssetsPreloading = false
    return 
  end
  local r2_94 = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(r0_94, UE4.UUnitBudgetAllocatorSubsystem)
  local r4_94 = nil	-- notice: implicit variable refs by block#[38]
  if r2_94 then
    local r3_94 = false
    r4_94 = IsClient(r0_94)
    if r4_94 then
      r3_94 = true
    else
      r4_94 = UE4.UGameplayStatics.GetPlayerCharacter(r0_94, 0)
      if r4_94 then
        for r9_94, r10_94 in ipairs(Const.SkipShadowBudgetConfig) do
          if r4_94.CurrentRoleId == tonumber(r10_94) then
            r3_94 = true
            break
          end
        end
        -- close: r5_94
      end
      if r3_94 == false and r4_94 and r4_94.GetPhantomTeammates then
        for r9_94, r10_94 in pairs(r4_94:GetPhantomTeammates()) do
          if r10_94 then
            for r15_94, r16_94 in ipairs(Const.SkipShadowBudgetConfig) do
              if r10_94.CurrentRoleId == tonumber(r16_94) then
                r3_94 = true
                break
              end
            end
            -- close: r11_94
          end
          if r3_94 then
            break
          end
        end
        -- close: r5_94
      end
    end
    r4_94 = r0_94:IsInDungeon()
    if r4_94 and r3_94 == false then
      r2_94:UpdateDynamicShadowBudget(false)
    else
      r2_94:UpdateDynamicShadowBudget(true)
    end
  end
  local r3_94 = UE4.UGameplayStatics.GetPlayerCharacter(r0_94, 0)
  if r3_94 then
    r4_94 = r3_94:GetPhantomTeammates(false, false):ToTable()
    if not r4_94 then
      ::label_117::
      r4_94 = {}
    end
  else
    goto label_117	-- block#30 is visited secondly
  end
  local r7_94 = {}
  local r8_94 = nil	-- notice: implicit variable refs by block#[34]
  if r3_94 then
    r8_94 = r3_94.CurrentRoleId
    if not r8_94 then
      ::label_127::
      r8_94 = 0
    end
  else
    goto label_127	-- block#33 is visited secondly
  end
  -- setlist for #7 failed
  r1_94:ReleaseAllCacheBeforeChangeScene(r7_94)
  r1_94:ReleaseAllCacheObj(false)
  r1_94:PreloadScatteredAsset_All()
  if r3_94 and r3_94.DelayCacheLoadPlayerAssets == true then
    if not r1_94:IsRoleAssetCached(r3_94.CurrentRoleId) then
      r3_94:GetCharPreloadComp():CacheLoadAssets()
    end
    for r9_94, r10_94 in pairs(r4_94) do
      r10_94:GetCharPreloadComp():PreloadAssets({})
    end
    -- close: r5_94
  end
  local r5_94 = GWorld.GameInstance:GetCurrentDungeonId()
  if r0_94:IsInDungeon() then
    r8_94 = r5_94 and 0
    r1_94:PreloadScatteredAsset_Dungeon(r8_94)
  elseif r0_94:IsInRegion() then
    r1_94:PreloadScatteredAsset_Region()
  end
  local r6_94 = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UAnimOptGameInstanceSubsystem:StaticClass())
  if r6_94 and GWorld.GameInstance then
    if not IsStandAlone(r0_94) and r0_94:IsInDungeon() or GWorld.GameInstance.IsInTempScene and GWorld.GameInstance:IsInTempScene() then
      r6_94.SystemEnableState = 0
      DebugPrint("@gulinan 联机和结算界面取消副本动画缓存加载")
    else
      r6_94.SystemEnableState = 1
      DebugPrint("@gulinan 非联机和结算界面下开启副本动画缓存加载")
    end
  end
  if r5_94 == nil or r5_94 == -1 then
    print(_G.LogTag, "wzj- 副本资源预加载 StartEnd", UE4.UGameplayStatics.GetTimeSeconds(r0_94), r5_94)
    r0_94.bPreloadAssetsReady = true
    r0_94.bAssetsPreloading = false
    return 
  end
  print(_G.LogTag, "wzj- 副本资源预加载 Start", UE4.UGameplayStatics.GetTimeSeconds(r0_94), r5_94)
  r0_94.bPreloadAssetsReady = false
  r0_94.bAssetsPreloading = true
  if not r1_94:CacheDungeonGameAssetsOuter({
    r0_94,
    r0_94.PreloadGameAssetsCallback
  }) then
    r0_94:PreloadGameAssetsCallback()
  end
end
function r2_0.PreloadGameAssetsCallback(r0_95)
  -- line: [1395, 1401] id: 95
  print(_G.LogTag, "wzj- 副本资源预加载 End", UE4.UGameplayStatics.GetTimeSeconds(r0_95), GWorld.GameInstance:GetCurrentDungeonId())
  r0_95.bPreloadAssetsReady = true
  r0_95.bAssetsPreloading = false
  r0_95:TryEndLoading("AssetsPreload")
end
function r2_0.ShowPetDefenseDynamicEvent_Lua(r0_96)
  -- line: [1407, 1418] id: 96
  local r2_96 = GWorld.GameInstance:GetGameUIManager():GetUIObj("BattleMain")
  if r2_96 then
    local r3_96 = r2_96:GetOrAddDynamicEventWidget()
    r3_96:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r3_96:PetPlayInAnim()
    r3_96:SetEventInfo(GText(r0_96.PetEventName), GText(r0_96.PetEventDescribe))
    r3_96:HidePetProgressRoot()
    r3_96.Name:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
function r2_0.ShowPetDefenseProgress_Lua(r0_97)
  -- line: [1420, 1431] id: 97
  local r2_97 = GWorld.GameInstance:GetGameUIManager():GetUIObj("BattleMain")
  if r2_97 then
    local r3_97 = r2_97:GetOrAddDynamicEventWidget()
    r3_97:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r3_97:PlayAnimation(r3_97.Get_In)
    r3_97:SetEventInfo(GText(r0_97.PetEventName), GText(r0_97.PetEventDescribe))
    r3_97:ShowPetProgress()
    r0_97:PetCaputreDefenceWidgetShow()
  end
end
function r2_0.RemoveShowPetDefenseProgress_Lua(r0_98)
  -- line: [1433, 1441] id: 98
  local r2_98 = GWorld.GameInstance:GetGameUIManager():GetUIObj("BattleMain")
  if r2_98 then
    r2_98:GetOrAddDynamicEventWidget():HidePetProgress(r0_98.PetEventSuccess, r0_98.PetEventFail, r0_98.PetSuccess)
    r0_98:PetCaputreDefenceWidgetHide()
  end
end
function r2_0.PetPlayFailureMontage_Lua(r0_99)
  -- line: [1443, 1448] id: 99
  local r1_99 = r0_99:GetNpcInfo(r0_99.PetId)
  if IsValid(r1_99) then
    r1_99:PlayFailureMontageThenDestroy()
  end
end
function r2_0.PetAddGuideAllPlayer(r0_100)
  -- line: [1450, 1458] id: 100
  for r6_100, r7_100 in pairs(UE4.UGameplayStatics.GetGameMode(r0_100):GetAllPlayer()) do
    DebugPrint("=======================PetAddGuideAllPlayer=========IsInHidePetPlayers====Player.Eid:", r0_100:IsInHidePetPlayers(r7_100.Eid), r7_100.Eid)
    if r0_100:IsInHidePetPlayers(r7_100.Eid) == false then
      r0_100:PetAddGuide(r7_100.Eid)
    end
  end
  -- close: r2_100
end
function r2_0.PetAddGuide(r0_101, r1_101)
  -- line: [1460, 1464] id: 101
  local r2_101 = r0_101:GetNpcInfo(r0_101.PetId)
  DebugPrint("================================PetAddGuide======Pet.Eid, Player.Eid:", r2_101.Eid, r1_101)
  r0_101:AddGuideEid(r2_101.Eid, r1_101)
end
function r2_0.PetRemoveGuide(r0_102, r1_102)
  -- line: [1466, 1470] id: 102
  local r2_102 = UE4.UGameplayStatics.GetPlayerCharacter(r0_102, 0)
  DebugPrint("=======================================PetRemoveGuide===PetEid,Player.Eid=", r1_102, r2_102.Eid)
  r0_102:RemoveGuideEid(r1_102, r2_102.Eid)
end
function r2_0.UpdatePetDefenseProgress(r0_103)
  -- line: [1472, 1480] id: 103
  local r2_103 = GWorld.GameInstance:GetGameUIManager():GetUIObj("BattleMain")
  if r2_103 then
    r2_103:GetOrAddDynamicEventWidget():UpdatePetProgress()
    r0_103:PetCaputreDefenceWidgetUpdate()
  end
end
function r2_0.PetDefenceCoreDestory(r0_104)
  -- line: [1482, 1487] id: 104
  local r1_104 = r0_104:GetDefenceCore(r0_104.PetDefenceCoreId)
  if r1_104 then
    r1_104:K2_DestroyActor()
  end
end
function r2_0.PetCaputreDefenceWidgetShow(r0_105)
  -- line: [1489, 1496] id: 105
  local r1_105 = r0_105:GetDefenceCore(r0_105.PetDefenceCoreId)
  if IsValid(r1_105) and r1_105.PetCaptureDefense then
    r0_105:PetCaputreDefenceWidgetUpdateByDefenceCore(r1_105)
    r1_105.PetCaptureDefense:SetHiddenInGame(false)
    r1_105.PetCaptureDefense.PetRoot = r1_105.PetRoot
  end
end
function r2_0.PetCaputreDefenceWidgetHide(r0_106)
  -- line: [1498, 1505] id: 106
  local r1_106 = r0_106:GetDefenceCore(r0_106.PetDefenceCoreId)
  if IsValid(r1_106) and r1_106.PetCaptureDefense then
    local r2_106 = r1_106.PetCaptureDefense:GetWidget()
    r2_106:PlayAnimation(r2_106.Out)
    r1_106.PetCaptureDefense.PetRoot = nil
  end
end
function r2_0.PetCaputreDefenceWidgetUpdate(r0_107)
  -- line: [1507, 1510] id: 107
  r0_107:PetCaputreDefenceWidgetUpdateByDefenceCore(r0_107:GetDefenceCore(r0_107.PetDefenceCoreId))
end
function r2_0.PetCaputreDefenceWidgetUpdateByDefenceCore(r0_108, r1_108)
  -- line: [1512, 1521] id: 108
  if IsValid(r1_108) and r1_108.PetCaptureDefense then
    local r2_108 = r1_108.PetCaptureDefense:GetWidget()
    local r4_108 = math.min(r0_108.PetDefenceKilledNum / DataMgr.GlobalConstant.PetDefenceMonsterNum.ConstantValue, 1)
    r1_108:UpdatePetFXProgress(r4_108)
    r2_108.Text_Process:SetText(math.floor(r4_108 * 100))
  end
end
function r2_0.GetDefenceCore(r0_109, r1_109)
  -- line: [1523, 1534] id: 109
  local r2_109 = r0_109.MechanismMap:FindRef("DefenceCore")
  if r2_109 ~= nil then
    for r7_109, r8_109 in pairs(r2_109.Array:ToTable()) do
      if r8_109.UnitId == r1_109 then
        return r8_109
      end
    end
    -- close: r3_109
  end
  return nil
end
function r2_0.OnRep_PetDefenceKilled(r0_110)
  -- line: [1536, 1539] id: 110
  r0_110:UpdatePetDefenseProgress()
  UE4.UGameplayStatics.GetGameState(r0_110):MarkPetDefenceKilledNumAsDirtyData()
end
function r2_0.SelectTicket_Lua(r0_111)
  -- line: [1544, 1597] id: 111
  print(_G.LogTag, "LXZ SelectTicket")
  local r1_111 = IsStandAlone(r0_111)
  if r1_111 then
    r1_111 = GWorld.GameInstance:GetCurrentDungeonId()
    local function r2_111(r0_112, r1_112)
      -- line: [1548, 1555] id: 112
      local r2_112 = GWorld:GetAvatar()
      if not r2_112 then
        return 
      end
      r2_112:SelectTicket(nil, r1_111, r1_112.Content_1.TicketId)
      local r3_112 = UE4.UGameplayStatics.GetGameMode(r0_111)
      r3_112:RemoveDungeonEvent("SelectTicket")
      r3_112:ExecuteNextStepOfTicket()
    end
    if r0_111:CheckAvatarHasTicket() then
      local r3_111 = UIManager(r0_111):ShowCommonPopupUI(100252, {
        DungeonId = r1_111,
        RightCallbackObj = r0_111,
        RightCallbackFunction = r2_111,
        ForbiddenRightCallbackObj = r0_111,
        AutoFocus = true,
        DisableEscClose = true,
      }, r0_111)
      EventManager:AddEvent(EventID.OnSelectTicketTimeout, r0_111, r0_111.OnSelectTicketTimeout)
    else
      r2_111(_, {
        Content_1 = {
          TicketId = 0,
        },
      })
    end
    -- close: r1_111
  else
    r1_111 = GWorld
    r1_111 = r1_111.GameInstance
    r1_111 = r1_111:GetCurrentDungeonId()
    local function r2_111(r0_113, r1_113)
      -- line: [1571, 1580] id: 113
      local r2_113 = GWorld:GetAvatar()
      if not r2_113 then
        return 
      end
      r2_113:SelectTicket(nil, r1_111, r1_113.Content_1.TicketId)
      local r4_113 = UE4.UGameplayStatics.GetPlayerCharacter(UE4.UGameplayStatics.GetGameInstance(r0_111), 0)
      r4_113.RPCComponent:SendDungeonTicket(r4_113.Eid, true)
    end
    print(_G.LogTag, "LXZ SelectTicket OnRep_NextTicketPlayer", r0_111.IsInSelectTicket, NeedVote)
    if r0_111:CheckAvatarHasTicket() then
      local r3_111 = UIManager(r0_111):ShowCommonPopupUI(100252, {
        DungeonId = r1_111,
        RightCallbackObj = r0_111,
        RightCallbackFunction = r2_111,
        ForbiddenRightCallbackObj = r0_111,
        DontCloseWhenRightBtnClicked = true,
        DisableEscClose = true,
      }, r0_111)
      EventManager:AddEvent(EventID.OnSelectTicketTimeout, r0_111, r0_111.OnSelectTicketTimeout)
    else
      r2_111(_, {
        Content_1 = {
          TicketId = 0,
        },
      })
    end
    -- close: r1_111
  end
end
function r2_0.RemoveSelectTicket_Lua(r0_114)
  -- line: [1599, 1604] id: 114
  print(_G.LogTag, "LXZ SelectTicket RemoveSelectTicket_Lua", IsClient(r0_114))
  if IsClient(r0_114) then
    EventManager:FireEvent(EventID.DungeonSelectTicketEnd)
  end
end
function r2_0.OnRep_NextTicketPlayer(r0_115)
  -- line: [1606, 1618] id: 115
end
function r2_0.CheckAvatarHasTicket(r0_116)
  -- line: [1620, 1639] id: 116
  local r1_116 = GWorld:GetAvatar()
  if not r1_116 then
    return false
  end
  local r2_116 = DataMgr.Dungeon[r0_116.DungeonId]
  if not r2_116 or not r2_116.TicketId then
    return false
  end
  if r2_116 and r2_116.NoTicketEnter then
    return true
  end
  for r7_116, r8_116 in pairs(r2_116.TicketId) do
    local r9_116 = r1_116.Resources[r8_116]
    if r9_116 and r9_116.Count and r9_116.Count > 0 then
      return true
    end
  end
  -- close: r3_116
  return false
end
function r2_0.OnSelectTicketTimeout(r0_117, r1_117)
  -- line: [1641, 1655] id: 117
  local r2_117 = GWorld:GetAvatar()
  if not r2_117 then
    return 
  end
  local r3_117 = GWorld.GameInstance:GetCurrentDungeonId()
  if IsStandAlone(r0_117) then
    r2_117:SelectTicket(nil, r3_117, r1_117)
    UE4.UGameplayStatics.GetGameMode(r0_117):ExecuteNextStepOfTicket()
  else
    r2_117:SelectTicket(nil, r3_117, r1_117)
    local r5_117 = UE4.UGameplayStatics.GetPlayerCharacter(UE4.UGameplayStatics.GetGameInstance(r0_117), 0)
    r5_117.RPCComponent:SendDungeonTicket(r5_117.Eid, true)
  end
end
function r2_0.UpdateDungeonTicket_Lua(r0_118, r1_118)
  -- line: [1657, 1674] id: 118
  if not IsAuthority(r0_118) then
    return 
  end
  print(_G.LogTag, "LXZ SelectTicket UpdateDungeonTicket_Lua")
  local r2_118 = UE4.UGameplayStatics.GetGameMode(r0_118)
  for r7_118, r8_118 in pairs(r2_118:GetAllPlayer()) do
    print(_G.LogTag, "LXZ SelectTicket UpdateDungeonTicket_Lua111", r8_118.Eid, r1_118:Find(r8_118.Eid))
    if not r1_118:Find(r8_118.Eid) then
      return 
    end
  end
  -- close: r3_118
  r2_118:BpDelTimer("SelectTicket", false, Const.GameModeEventServerClient)
  r2_118:RemoveDungeonEvent("SelectTicket")
  r0_118.NextTicketPlayer:Clear()
  UE.UMapSyncHelper.SyncMap(r0_118, "NextTicketPlayer")
  r2_118:ExecuteNextStepOfTicket()
end
function r2_0.ShowWalnutReward_Lua(r0_119)
  -- line: [1679, 1684] id: 119
  DebugPrint("WalnutReward ShowWalnutReward_Lua")
  if not UIManager(r0_119):GetUIObj("WalnutReward") then
    UIManager(r0_119):LoadUINew("WalnutReward")
  end
end
function r2_0.RemoveShowWalnutReward_Lua(r0_120)
  -- line: [1686, 1692] id: 120
  DebugPrint("WalnutReward RemoveShowWalnutReward_Lua")
  local r1_120 = UIManager(r0_120):GetUIObj("WalnutReward")
  if r1_120 then
    r1_120:Close()
  end
end
function r2_0.OnRep_WalnutRewardPlayer(r0_121)
  -- line: [1694, 1702] id: 121
  DebugPrint("WalnutReward OnRep_WalnutRewardPlayer")
  local r1_121 = UIManager(r0_121):GetUIObj("WalnutReward")
  if r1_121 then
    r1_121:ReceiveWalnutRewardChoose()
  end
end
function r2_0.NextWalnut_Lua(r0_122)
  -- line: [1704, 1711] id: 122
  DebugPrint("DungeonWalnutChoice NextWalnut_Lua")
  if not UIManager(r0_122):GetUIObj("WalnutChoice") then
    UIManager(r0_122):LoadUINew("WalnutChoice", CommonConst.WalnutUser.Dungeon)
  end
end
function r2_0.RemoveNextWalnut_Lua(r0_123)
  -- line: [1713, 1723] id: 123
  DebugPrint("DungeonWalnutChoice RemoveNextWalnut_Lua")
  local r1_123 = UIManager(r0_123):GetUIObj("WalnutChoice")
  if r1_123 then
    if IsStandAlone(r0_123) then
      r1_123:Close()
    else
      r1_123:PlayWalnutReady()
    end
  end
end
function r2_0.WalnutReady_Lua(r0_124)
  -- line: [1725, 1727] id: 124
  DebugPrint("WalnutReady_Lua")
end
function r2_0.RemoveWalnutReady_Lua(r0_125)
  -- line: [1729, 1735] id: 125
  DebugPrint("DungeonWalnutChoice RemoveWalnutReady_Lua")
  local r1_125 = UIManager(r0_125):GetUIObj("WalnutChoice")
  if r1_125 then
    r1_125:Close()
  end
end
function r2_0.OnRep_NextWalnutPlayer(r0_126)
  -- line: [1737, 1748] id: 126
  DebugPrint("DungeonWalnutChoice OnRep_NextWalnutPlayer")
  local r1_126 = r0_126.NextWalnutPlayer:ToTable()
  PrintTable(r1_126)
  local r2_126 = UIManager(r0_126):GetUIObj("WalnutChoice")
  if r2_126 then
    r2_126:ReceiveTeammateChoose(r1_126)
  end
end
function r2_0.AbyssBattleNew_Lua(r0_127)
  -- line: [1760, 1767] id: 127
  DebugPrint("AbyssBattleNew_Lua")
  (UIManager(r0_127):GetUIObj("Abyss_CountDown_Progress") and UIManager(r0_127):LoadUINew("Abyss_CountDown_Progress")):ShowAbyssCountDown("AbyssBattleNew")
end
function r2_0.RemoveAbyssBattleNew_Lua(r0_128)
  -- line: [1769, 1776] id: 128
  DebugPrint("RemoveAbyssBattleNew_Lua")
  local r1_128 = UIManager(r0_128):GetUIObj("Abyss_CountDown_Progress")
  if not r1_128 then
    return 
  end
  r1_128:HideAbyssCountDown("AbyssBattleNew")
end
function r2_0.AbyssBattle_Lua(r0_129)
  -- line: [1778, 1785] id: 129
  DebugPrint("AbyssBattle_Lua")
  (UIManager(r0_129):GetUIObj("Abyss_CountDown") and UIManager(r0_129):LoadUINew("Abyss_CountDown")):ShowAbyssCountDown("AbyssBattle")
end
function r2_0.RemoveAbyssBattle_Lua(r0_130)
  -- line: [1787, 1794] id: 130
  DebugPrint("RemoveAbyssBattle_Lua")
  local r1_130 = UIManager(r0_130):GetUIObj("Abyss_CountDown")
  if not r1_130 then
    return 
  end
  r1_130:HideAbyssCountDown("AbyssBattle")
end
function r2_0.AbyssNextRoom_Lua(r0_131)
  -- line: [1796, 1803] id: 131
  DebugPrint("AbyssNextRoom_Lua")
  (UIManager(r0_131):GetUIObj("Abyss_CountDown") and UIManager(r0_131):LoadUINew("Abyss_CountDown")):ShowAbyssCountDown("AbyssNextRoom")
end
function r2_0.RemoveAbyssNextRoom_Lua(r0_132)
  -- line: [1805, 1812] id: 132
  DebugPrint("RemoveAbyssNextRoom_Lua")
  local r1_132 = UIManager(r0_132):GetUIObj("Abyss_CountDown")
  if not r1_132 then
    return 
  end
  r1_132:HideAbyssCountDown("AbyssNextRoom")
end
function r2_0.PartyWaitPlayerEnter_Lua(r0_133)
  -- line: [1818, 1824] id: 133
  (UIManager(r0_133):GetUIObj("DungeonCaptureFloat") and UIManager(r0_133):LoadUINew("DungeonCaptureFloat", 60)):InitPartyWaitUI()
end
function r2_0.RemovePartyWaitPlayerEnter_Lua(r0_134)
  -- line: [1826, 1832] id: 134
  local r1_134 = UIManager(r0_134):GetUIObj("DungeonCaptureFloat")
  if not r1_134 then
    return 
  end
  r1_134:ClosePartyWaitUI()
end
function r2_0.OnRep_PartyTime(r0_135)
  -- line: [1834, 1857] id: 135
  local r1_135 = UGameplayStatics.GetPlayerCharacter(r0_135, 0).Eid
  local r2_135 = 0
  local r3_135 = 1
  if r0_135.PartyPlayerDisPercent.Items:Num() ~= 0 then
    r2_135 = r0_135.PartyPlayerDisPercent.Items[r1_135].Value
    r3_135 = r0_135.PartyPlayerDisPercent.Items:Num()
  end
  local r4_135 = 1
  for r9_135, r10_135 in pairs(r0_135.PartyPlayerDisPercent.Items) do
    if r9_135 ~= r1_135 and r2_135 < r10_135.Value then
      r4_135 = r4_135 + 1
    end
  end
  -- close: r5_135
  EventManager:FireEvent(EventID.OnUpdatePartyLeftUI, r0_135.PartyTime)
  EventManager:FireEvent(EventID.OnUpdatePartyRightUI, r2_135, r4_135, r3_135)
end
function r2_0.OnPartyPlayerGetBuff(r0_136, r1_136, r2_136, r3_136, r4_136)
  -- line: [1859, 1861] id: 136
  EventManager:FireEvent(EventID.OnPartyPlayerGetBuff, r1_136, r2_136, r3_136, r4_136)
end
function r2_0.OnPartyPlayerTriggerFallTrigger(r0_137, r1_137)
  -- line: [1863, 1865] id: 137
  EventManager:FireEvent(EventID.OnPartyPlayerTriggerFallTrigger, r1_137)
end
function r2_0.OnPartyPlayerFirstComplete(r0_138, r1_138)
  -- line: [1867, 1869] id: 138
  EventManager:FireEvent(EventID.OnOnePlayerEnd, r1_138)
end
function r2_0.OnNotifyPartyBuff_Lua(r0_139, r1_139, r2_139, r3_139)
  -- line: [1871, 1873] id: 139
  EventManager:FireEvent(EventID.OnPlayerGetDeBuff, r1_139, r2_139, r3_139)
end
function r2_0.SabotageProLimitTimer_Lua(r0_140)
  -- line: [1877, 1884] id: 140
  DebugPrint("SabotageProComponent:Client SabotageProLimitTimer_Lua", r0_140.DungeonId)
  (UIManager(r0_140):GetUIObj("DungeonCaptureFloat") and UIManager(r0_140):LoadUINew("DungeonCaptureFloat")):InitClientTimerByHandleName("SabotageProLimitTimer", "UI_TEMPLE_LIMIT_TIME", 10)
end
function r2_0.RemoveSabotageProLimitTimer_Lua(r0_141)
  -- line: [1886, 1893] id: 141
  DebugPrint("SabotageProComponent:Client RemoveSabotageProLimitTimer_Lua", r0_141.DungeonId)
  local r1_141 = UIManager(r0_141):GetUIObj("DungeonCaptureFloat")
  if not r1_141 then
    return 
  end
  r1_141:CloseClientTimerByHandleName()
end
function r2_0.SynthesisBuffList_Lua(r0_142)
  -- line: [1898, 1905] id: 142
  r0_142.SynthesisBuffList = UIManager(r0_142):_CreateWidgetNew("SynthesisBuffList")
  local r1_142 = UIManager(r0_142):GetUIObj("BattleMain")
  r1_142.Task:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r1_142.Task:AddChildToOverlay(r0_142.SynthesisBuffList)
  r0_142.SynthesisBuffList:Init()
end
function r2_0.RemoveSynthesisBuffList_Lua(r0_143)
  -- line: [1907, 1911] id: 143
  if r0_143.SynthesisBuffList then
    r0_143.SynthesisBuffList:RemoveFromParent()
  end
end
function r2_0.SynthesisDestruction_Lua(r0_144)
  -- line: [1913, 1918] id: 144
  if not UIManager(r0_144):GetUIObj("DungeonSynthesisFloat") then
    local r1_144 = UIManager(r0_144):LoadUINew("DungeonSynthesisFloat")
  end
end
function r2_0.RemoveSynthesisDestruction_Lua(r0_145)
  -- line: [1920, 1926] id: 145
  local r1_145 = UIManager(r0_145):GetUIObj("DungeonSynthesisFloat")
  if r1_145 then
    r1_145:Close()
  end
  r0_145:ShowSynthesisSuccessEffect()
end
function r2_0.OnRep_RageValue(r0_146)
  -- line: [1928, 1931] id: 146
  EventManager:FireEvent(EventID.OnRepSynthesisRageValue, r0_146.RageValue)
  r0_146:UpdateSynthesisDestructionTaskProgress()
end
function r2_0.OnRep_GuideSupervisorEids(r0_147)
  -- line: [1933, 1936] id: 147
  EventManager:FireEvent(EventID.OnRepGuideSupervisorEids, r0_147.GuideSupervisorEids, r0_147.DeadSupervisorEids)
  r0_147:UpdateSynthesisDestructionTaskProgress()
end
function r2_0.OnRep_DeadSupervisorEids(r0_148)
  -- line: [1938, 1940] id: 148
  EventManager:FireEvent(EventID.OnRepDeadSupervisorEids, r0_148.GuideSupervisorEids, r0_148.DeadSupervisorEids)
end
function r2_0.UpdateSynthesisDestructionTaskProgress(r0_149)
  -- line: [1942, 1966] id: 149
  local r1_149 = DataMgr.Synthesis[r0_149.DungeonId]
  if not r1_149 then
    return 
  end
  if not r1_149.RageValueStages then
    return 
  end
  local r2_149 = r0_149.GuideSupervisorEids:Num()
  if r0_149.SynthesisGuideNumCache and r0_149.SynthesisGuideNumCache == r2_149 then
    return 
  end
  r0_149.SynthesisGuideNumCache = r2_149
  DebugPrint("Synthesis Destruction UpdateDungeonTaskProgress", r2_149, #r1_149.RageValueStages)
  r0_149:UpdateDungeonTaskProgress(r2_149, #r1_149.RageValueStages)
end
function r2_0.ShowDiscoverSupervisorToast_Lua(r0_150, r1_150)
  -- line: [1968, 1973] id: 150
  local r2_150 = UIManager(r0_150):GetUIObj("DungeonSynthesisFloat")
  if r2_150 then
    r2_150:ShowDiscoverSupervisorToast(r1_150)
  end
end
function r2_0.SynthesisOccupation_Lua(r0_151)
  -- line: [1975, 1977] id: 151
  r0_151:OnRep_OccupationFinishNum()
end
function r2_0.RemoveSynthesisOccupation_Lua(r0_152)
  -- line: [1979, 1981] id: 152
  r0_152:ShowSynthesisSuccessEffect()
end
function r2_0.OnRep_OccupationFinishNum(r0_153)
  -- line: [1983, 1993] id: 153
  local r1_153 = DataMgr.Synthesis[r0_153.DungeonId]
  if not r1_153 then
    return 
  end
  if not r1_153.OccupationTargetNum then
    return 
  end
  DebugPrint("Synthesis Occupation UpdateDungeonTaskProgress", r0_153.OccupationFinishNum, r1_153.OccupationTargetNum)
  r0_153:UpdateDungeonTaskProgress(r0_153.OccupationFinishNum, r1_153.OccupationTargetNum)
end
function r2_0.SynthesisCrack_Lua(r0_154)
  -- line: [1995, 1997] id: 154
  UIManager(r0_154):LoadUINew("DungeonSynthesisCrack")
end
function r2_0.RemoveSynthesisCrack_Lua(r0_155)
  -- line: [1999, 2006] id: 155
  local r1_155 = UIManager(r0_155):GetUIObj("DungeonSynthesisCrack")
  if r1_155 then
    r1_155:PlayOutAnimation()
  end
  EventManager:FireEvent(EventID.CloseDungeonUI)
  r0_155:ShowSynthesisSuccessEffect(2)
end
function r2_0.OnRep_KeySubmitNum(r0_156)
  -- line: [2008, 2010] id: 156
  EventManager:FireEvent(EventID.OnRepKeySubmitNum, r0_156.KeySubmitNum)
end
function r2_0.OpenChestTime_Lua(r0_157)
  -- line: [2012, 2018] id: 157
  (UIManager(r0_157):GetUIObj("DungeonCaptureFloat") and UIManager(r0_157):LoadUINew("DungeonCaptureFloat")):InitClientTimerByHandleName("OpenChestTime", "DUNGEON_SYNTHESIS_112", 0)
end
function r2_0.RemoveOpenChestTime_Lua(r0_158)
  -- line: [2020, 2026] id: 158
  local r1_158 = UIManager(r0_158):GetUIObj("DungeonCaptureFloat")
  if not r1_158 then
    return 
  end
  r1_158:CloseClientTimerByHandleName()
end
function r2_0.ShowSynthesisSuccessEffect(r0_159, r1_159)
  -- line: [2028, 2041] id: 159
  local function r2_159()
    -- line: [2029, 2034] id: 160
    local r0_160 = UIManager(r0_159):LoadUINew("SynthesisSuccessEffect")
    if r0_160 then
      r0_160:ShowEffect()
    end
  end
  if r1_159 and r1_159 > 0 then
    r0_159:AddTimer(r1_159, r2_159)
  else
    r2_159()
  end
end
function r2_0.UpdateDungeonTaskProgress(r0_161, r1_161, r2_161)
  -- line: [2047, 2051] id: 161
  r0_161.CurProgressCache = r1_161
  r0_161.TotalProgressCache = r2_161
  EventManager:FireEvent(EventID.OnDungeonTaskProgress, r1_161, r2_161)
end
function r2_0.OnRep_DungeonProgress(r0_162)
  -- line: [2053, 2055] id: 162
  EventManager:FireEvent(EventID.OnRepDungeonProgress, r0_162.DungeonProgress)
end
function r2_0.BattleProgress_Lua(r0_163)
  -- line: [2059, 2067] id: 163
  UIManager(r0_163):_CreateWidgetNew("CommonBattleProgress"):InitWidgetUI()
  UIManager(r0_163):_CreateWidgetNew("CommonBattleCount"):InitWidgetUI()
  UIManager(r0_163):_CreateWidgetNew("CommonBattleCountDown"):InitWidgetUI()
end
function r2_0.RemoveBattleProgress_Lua(r0_164)
  -- line: [2069, 2075] id: 164
  local r1_164 = UIManager(r0_164):GetUIObj("BattleMain")
  r1_164.Pos_Abyss_CountDown_1:ClearChildren()
  r1_164.Task:ClearChildren()
  r1_164.Pos_Abyss_CountDown:ClearChildren()
end
function r2_0.OnRep_BattleProgressNum(r0_165)
  -- line: [2077, 2079] id: 165
  EventManager:FireEvent(EventID.OnRepBattleProgressNum, r0_165.BattleProgressNum, r0_165.BattleProgressInfo.MaxProgressNum)
end
function r2_0.OnRep_BattleProgressInfo(r0_166)
  -- line: [2081, 2083] id: 166
  EventManager:FireEvent(EventID.OnRepBattleProgressInfo, r0_166.BattleProgressInfo)
end
function r2_0.OnRep_RaidScore(r0_167)
  -- line: [2088, 2090] id: 167
  EventManager:FireEvent(EventID.OnRepRaidScore, r0_167.RaidScore)
end
return r2_0
