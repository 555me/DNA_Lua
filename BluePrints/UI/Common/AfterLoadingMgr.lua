-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\Common\AfterLoadingMgr.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("BluePrints.UI.ControllerFSM")
local r1_0 = require("Utils.MiscUtils")
local r2_0 = require("StoryCreator.StoryLogic.StorylineUtils")
local function r3_0()
  -- line: [5, 12] id: 1
  local r0_1 = GWorld:GetMainPlayer()
  if r0_1 and r0_1.IsImmersionModel then
    return false
  end
  local r1_1 = UIManager():GetUIObj("BattleMain")
  return IsValid(r1_1) and r1_1.IsPlayOutAnim and not r1_1:IsVisible()
end
local r4_0 = {
  __index = {
    GetNextState = function(r0_2)
      -- line: [17, 19] id: 2
      return DataMgr.AfterLoadingFSM[r0_2.StateName].NextState
    end,
    OnAfterEnter = function(r0_3, r1_3)
      -- line: [20, 22] id: 3
      r0_3:Fallback(r1_3)
    end,
  },
  New = function(r0_4, r1_4, r2_4)
    -- line: [24, 48] id: 4
    local r3_4 = {}
    setmetatable(r3_4, r0_4)
    function r3_4.OnEnter(r0_5)
      -- line: [27, 36] id: 5
      try({
        exec = r2_4.OnEnter,
        catch = function(r0_6)
          -- line: [30, 34] id: 6
          DebugPrint(Traceback(ErrorTag, "AfterLoading流程出错了,看日志有trace,出错状态：%s", r0_5.FSM:Current()))
          LogError(Traceback(ErrorTag, r0_6, true))
          UIManager():DestroyAfterLoadingMgr()
        end,
      }, r0_5)
    end
    r3_4.StateName = r1_4
    if r2_4.OnAfterEnter then
      r3_4.OnAfterEnter = r2_4.OnAfterEnter
    end
    if r2_4.OnLeave then
      r3_4.OnLeave = r2_4.OnLeave
    end
    if r2_4.GetNextState then
      r3_4.GetNextState = r2_4.GetNextState
    end
    return r3_4
  end,
}
local r5_0 = Class("BluePrints.Common.TimerMgr")
r5_0.BeginState = r4_0:New("BeginState", {
  OnEnter = function(r0_7)
    -- line: [54, 67] id: 7
    GWorld.NetworkMgr:UpdateNetDisconnectUIConfirm()
    local r1_7 = UGameInputModeSubsystem.GetGameInputModeSubsystem(GWorld.GameInstance)
    if IsValid(r1_7) then
      r1_7:DisableInputMode("CommonChangeScene")
    end
    GWorld.StoryMgr:EnableStory()
    local r2_7 = GWorld:GetMainPlayer()
    if r2_7 then
      r2_7:SetCanInteractiveTrigger(true, "Loading")
    end
    EventManager:FireEvent(EventID.OnCloseLoadingEnableStory)
  end,
  GetNextState = function(r0_8)
    -- line: [68, 70] id: 8
    return DataMgr.AfterLoadingFSM[r0_8.StateName].NextState
  end,
})
r5_0.JumpToRogueMain = r4_0:New("JumpToRogueMain", {
  OnEnter = function(r0_9)
    -- line: [74, 120] id: 9
    local r1_9 = GWorld:GetMainPlayer()
    if WorldTravelSubsystem():GetCurrentDungeonType() == CommonConst.DungeonType.Abyss and r1_9 then
      r1_9:DisableBattleWheel()
    end
    local r3_9 = GameState()
    if r3_9 and r3_9.IsInRegion and r3_9:IsInRegion() then
      local r4_9 = GWorld.GameInstance:GetExitDungeonData()
      if r4_9 then
        GWorld.GameInstance:ClearExitDungeonData()
        if r4_9.Type == "Abyss" then
          PageJumpUtils:JumpToAbyssLevelInfoPage(r4_9.AbyssId, r4_9.AbyssLevelId, r4_9.AbyssDungeonIndex)
        elseif r4_9.Type == "Rouge" then
          PageJumpUtils:JumpToRougeMain("ExitFromRouge")
        elseif r4_9.Type == "TryOut" then
          PageJumpUtils:JumpToTryOut(r4_9.CurTabIndex, r4_9.ActivityId, r4_9.CurSelectIndex)
        elseif r4_9.Type == "Paotai" then
          PageJumpUtils:JumpToPaotai(r4_9.CurTabIndex, r4_9.CurSelectIndex)
        elseif r4_9.Type == "FeinaEvent" then
          PageJumpUtils:JumpToFeinaEvent(r4_9.CurTabIndex)
        elseif r4_9.Type == "Depute" and not r4_9.IsFromRegionMechanism then
          PageJumpUtils:JumpToStyleOfPlaySubUI("NewDeputeRoot", r4_9.DeputeType)
        elseif r4_9.Type == "GuildWar" then
          PageJumpUtils:JumpToTargetPageByJumpId(r4_9.JumpId, false, false, true)
        elseif r4_9.Type == "Temple" then
          PageJumpUtils:JumpToTempleSolo(r4_9.CurTabIndex)
        end
      end
    end
  end,
})
r5_0.GameplayReward = r4_0:New("GameplayReward", {
  OnEnter = function(r0_10)
    -- line: [124, 126] id: 10
  end,
})
r5_0.DungeonUI = r4_0:New("DungeonUI", {
  OnEnter = function(r0_11)
    -- line: [130, 132] id: 11
  end,
})
r5_0.SystemUnlock = r4_0:New("SystemUnlock", {
  OnEnter = function(r0_12)
    -- line: [136, 141] id: 12
    local r1_12 = GWorld:GetAvatar()
    if r1_12 then
      r1_12:HandleCloseLoadingEvent_WhileSystemUnlock()
    end
  end,
})
r5_0.TriggerGuide = r4_0:New("TriggerGuide", {
  OnEnter = function(r0_13)
    -- line: [145, 162] id: 13
    local r1_13 = GWorld.GameInstance:GetCurrentDungeonId()
    local r2_13 = r1_0.GameMode()
    if not GWorld.GameInstance:IsNullDungeonId(r1_13) then
      DebugPrint("SystemGuide Enter Dungeon")
      EventManager:FireEvent(EventID.ExitRegion)
      EventManager:FireEvent(EventID.SystemGuideEnterDungeon, r1_13)
    elseif r2_13 ~= nil and r2_13.IsInRegion and r2_13:IsInRegion() then
      DebugPrint("SystemGuide Enter Region", UE4.URuntimeCommonFunctionLibrary.GetInputMode(GWorld.GameInstance:GetWorld()))
      EventManager:FireEvent(EventID.SystemGuideEnterRegion)
    else
      DebugPrint("ERROR:SystemGuide Not Enter Region And Not Enter Dungeon")
    end
  end,
  GetNextState = function(r0_14, r1_14)
    -- line: [163, 177] id: 14
    if r1_14.bGuideEndPending then
      r1_14.bGuideEndPending = nil
      if r3_0() then
        return r0_14.StateName
      else
        return DataMgr.AfterLoadingFSM[r0_14.StateName].NextState
      end
    end
    if r2_0:IsGuideNodeRunning() or r3_0() then
      return r0_14.StateName
    else
      return DataMgr.AfterLoadingFSM[r0_14.StateName].NextState
    end
  end,
})
r5_0.OpenForcePopup = r4_0:New("OpenForcePopup", {
  OnEnter = function(r0_15)
    -- line: [181, 200] id: 15
    local r1_15 = r1_0.GameMode()
    local r2_15 = GameState()
    if r1_15 ~= nil and r2_15 ~= nil and r2_15.GameModeType == "Trial" then
      r0_15:Pause()
      UIManager():AddTimer(0.1, function()
        -- line: [187, 189] id: 16
        UIManager():LoadUINew("TryOutMain")
      end, false, 0, nil, true)
      return 
    end
    local r3_15 = GWorld:GetAvatar()
    if r3_15 then
      MonthCardController:TryPopUpCacheReward()
      UIManager(PlayerCharacter):TryShowPlayerLevelUpInfo({
        CurLevel = r3_15.Level,
        ShowProgresBar = false,
      })
    end
  end,
})
r5_0.LayoutPlan = r4_0:New("LayoutPlan", {
  OnEnter = function(r0_17)
    -- line: [204, 215] id: 17
    local r1_17 = GWorld:GetAvatar()
    if r1_17 and UIUtils.IsMobileInput() then
      local r2_17 = GWorld:GetMainPlayer()
      local r3_17 = r1_17:GetCurrentMobileHudPlanIndex()
      local r5_17 = nil	-- notice: implicit variable refs by block#[6]
      if r1_17:GetMobileHudPlanCount() == 0 then
        r5_17 = r3_17 == 1
      else
        goto label_21	-- block#4 is visited secondly
      end
      if r5_17 then
        UIManager(r2_17):LoadUINew("LayoutPlan")
      end
    end
  end,
})
r5_0.MainLineQuest = r4_0:New("MainLineQuest", {
  OnEnter = function(r0_18)
    -- line: [219, 231] id: 18
    local r1_18 = r1_0.GameMode()
    local r2_18 = GWorld:GetAvatar()
    if r2_18 and r2_18.NotifyAvatarRegionAllReady and r1_18 and r1_18:IsInRegion() then
      local r3_18 = UIManager():GetUIObj("BattleMain")
      if r2_18 and r2_18.TrackingQuestChainId ~= 0 and r2_18.TrackingQuestChainId ~= nil and r3_18.Pos_TaskBar then
        r3_18.Pos_TaskBar:SetVisibility(UIConst.VisibilityOp.Visible)
      else
        r3_18.Pos_TaskBar:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
      r2_18:NotifyAvatarRegionAllReady()
    end
  end,
  OnAfterEnter = function(r0_19, r1_19)
    -- line: [232, 245] id: 19
    if not GWorld.StoryMgr then
      return 
    end
    local r2_19 = {}
    GWorld.StoryMgr:GetRunningNodeTableByType("WaitOfTimeNode", r2_19)
    if not table.isempty(r2_19) then
      return 
    end
    local r3_19 = {}
    GWorld.StoryMgr:GetRunningNodeTableByType("TalkNode", r2_19)
    if not table.isempty(r3_19) then
      return 
    end
    r0_19:Fallback(r1_19)
  end,
  GetNextState = function(r0_20, r1_20)
    -- line: [246, 260] id: 20
    if r1_20.bGuideEndPending then
      r1_20.bGuideEndPending = nil
      if r3_0() then
        return r0_20.StateName
      else
        return DataMgr.AfterLoadingFSM[r0_20.StateName].NextState
      end
    end
    if r2_0:IsGuideNodeRunning() or r3_0() then
      return r0_20.StateName
    else
      return DataMgr.AfterLoadingFSM[r0_20.StateName].NextState
    end
  end,
})
r5_0.DynamicQuest = r4_0:New("DynamicQuest", {
  OnEnter = function(r0_21)
    -- line: [265, 270] id: 21
    local r1_21 = r1_0.GameMode()
    if r1_21 and r1_21.ActivateDynamicQuestEvent then
      r1_21:ActivateDynamicQuestEvent()
    end
  end,
  OnAfterEnter = function(r0_22, r1_22)
    -- line: [271, 284] id: 22
    if not GWorld.StoryMgr then
      return 
    end
    local r2_22 = {}
    GWorld.StoryMgr:GetRunningNodeTableByType("WaitOfTimeNode", r2_22)
    if not table.isempty(r2_22) then
      return 
    end
    local r3_22 = {}
    GWorld.StoryMgr:GetRunningNodeTableByType("TalkNode", r2_22)
    if not table.isempty(r3_22) then
      return 
    end
    r0_22:Fallback(r1_22)
  end,
  GetNextState = function(r0_23, r1_23)
    -- line: [285, 299] id: 23
    if r1_23.bGuideEndPending then
      r1_23.bGuideEndPending = nil
      if r3_0() then
        return r0_23.StateName
      else
        return DataMgr.AfterLoadingFSM[r0_23.StateName].NextState
      end
    end
    if r2_0:IsGuideNodeRunning() or r3_0() then
      return r0_23.StateName
    else
      return DataMgr.AfterLoadingFSM[r0_23.StateName].NextState
    end
  end,
})
r5_0.EndState = r4_0:New("EndState", {
  OnEnter = function(r0_24)
    -- line: [303, 306] id: 24
    UIManager():DestroyAfterLoadingMgr()
    UIManager():StartScriptDetectionCheck()
  end,
  GetNextState = function(r0_25)
    -- line: [307, 307] id: 25
  end,
})
local r6_0 = Class()
function r6_0.New()
  -- line: [315, 320] id: 26
  local r0_26 = {}
  setmetatable(r0_26, r6_0)
  r0_26.FSM = r0_0.New(r0_26, r5_0)
  return r0_26
end
function r6_0.Pause(r0_27)
  -- line: [322, 325] id: 27
  r0_27.bPause = true
  DebugPrint(WarningTag, string.format("AfterLoadingMgr 状态机暂停，当前状态：%s", r0_27.FSM:Current()))
end
function r6_0.Fallback(r0_28, r1_28)
  -- line: [327, 333] id: 28
  if not r1_28 then
    r1_28 = r0_28.FSM:Current()
  end
  if not r0_28.bPause and r0_28:IsCurrentState(r1_28) then
    DebugPrint(WarningTag, string.format("AfterLoadingMgr 状态机没有被暂停，继续执行 State: %s", r1_28))
    r0_28:Continue()
  end
end
function r6_0.IsCurrentState(r0_29, r1_29)
  -- line: [335, 337] id: 29
  return r0_29.FSM:Current() == r1_29
end
function r6_0.IsEnd(r0_30)
  -- line: [339, 342] id: 30
  return r0_30.FSM:Current() == "EndState"
end
function r6_0.Continue(r0_31)
  -- line: [344, 368] id: 31
  if r0_31.bPause then
    DebugPrint(WarningTag, string.format("AfterLoadingMgr 状态机从暂停中恢复, CurrState: %s", r0_31.FSM:Current()))
  end
  r0_31.bPause = false
  if r0_31:IsEnd() then
    DebugPrint(WarningTag, "AfterLoadingMgr 状态机执行完毕！！！")
    return 
  end
  local r1_31 = r0_31.FSM:Current()
  if not r1_31 then
    DebugPrint(WarningTag, "AfterLoadingMgr 状态机开始执行！！！")
    r0_31.FSM:Enter("BeginState")
    return 
  end
  local r2_31 = r5_0[r1_31]:GetNextState(r0_31)
  if r2_31 then
    if r2_31 == r1_31 then
      DebugPrint(WarningTag, string.format("AfterLoadingMgr GetNextState保持原状，暂停切换 CurrState:%s", r1_31))
      return 
    end
    DebugPrint(WarningTag, string.format("AfterLoadingMgr 切换状态，前个状态：%s，下个状态：%s", r1_31, r2_31))
    r0_31.FSM:Enter(r2_31)
  end
end
return r6_0
