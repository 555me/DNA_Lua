-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Team\TeamController.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("BluePrints.UI.WBP.Team.TeamModel")
local r1_0 = require("BluePrints.UI.WBP.Team.TeamCommon")
local r2_0 = DataMgr.GlobalConstant
local r3_0 = Class("BluePrints.Common.MVC.Controller")
r3_0.HeadUIs = {}
function r3_0.Init(r0_1)
  -- line: [11, 19] id: 1
  r3_0.Super.Init(r0_1)
  r0_1.InviteRecvTimer = "Team_InviteRecvTimer"
  r0_1.TeamRecoveryTimer = "Team_TeamRecoveryTimer"
  r0_1.AutoResetHeadStateTimer = "Team_AutoResetHeadStateTimer"
  r3_0.HeadUIs = {}
  EventManager:AddEvent(EventID.CloseLoading, r0_1, r0_1.OnCloseLoading)
  EventManager:AddEvent(EventID.OnAvatarStatusUpdate, r0_1, r0_1.OnAvatarStatusUpdate)
end
function r3_0.SetTeamPopupBarOpen(r0_2, r1_2)
  -- line: [21, 31] id: 2
  r0_2.bTeamPopupBarOpen = r1_2
  if r1_2 == false then
    r0_2:AddTimer(0.1, function()
      -- line: [24, 29] id: 3
      local r0_3 = UIManager():GetLastestAndFocusableUIWidgetObj()
      if r0_3 ~= nil then
        r0_3:SetFocus()
      end
    end)
  end
end
function r3_0.GetTeamPopupBarOpen(r0_4)
  -- line: [33, 35] id: 4
  return r0_4.bTeamPopupBarOpen
end
function r3_0.IsTeamPopupBarOpenInGamepad(r0_5)
  -- line: [37, 39] id: 5
  return r0_5:GetTeamPopupBarOpen() and r0_5:IsGamepad()
end
function r3_0.OnCloseLoading(r0_6)
  -- line: [41, 49] id: 6
  DebugPrint(" TeamSyncDebug   xxxTeamReconnectNotify   手动")
  r0_0:DestoryTeamDataWithDs()
  if GWorld:IsStandAlone() then
    r0_6:TrySyncTeamInSingleGame()
  else
    r0_6:TrySyncTeamInMultiGame()
  end
end
function r3_0.OnAvatarStatusUpdate(r0_7, r1_7, r2_7)
  -- line: [51, 66] id: 7
  if AvatarUtils:HasAvatarStatusChanged(r1_7, r2_7, r1_0.InStatusShouldDeleteInvite) then
    local r3_7 = true
    for r8_7, r9_7 in ipairs(r1_0.CanEnterMultiGameStatus) do
      if r0_7:GetAvatar():CheckCanSetStatus(nil, r9_7) then
        r3_7 = false
        break
      end
    end
    -- close: r4_7
    if r3_7 and r0_0:GetBackInviteInfo() then
      r0_7:SendTeamRefuseInvite(false)
      r0_7:ShutDownTeamInvite()
    end
  end
end
function r3_0.Destory(r0_8)
  -- line: [68, 73] id: 8
  r3_0.HeadUIs = {}
  EventManager:RemoveEvent(EventID.CloseLoading, r0_8)
  EventManager:RemoveEvent(EventID.OnAvatarStatusUpdate, r0_8)
  r3_0.Super.Destory(r0_8)
end
function r3_0.GetModel(r0_9)
  -- line: [75, 77] id: 9
  return r0_0
end
function r3_0.GetEventName(r0_10)
  -- line: [79, 81] id: 10
  return EventID.TeamControllerEvent
end
function r3_0.ShowToast(r0_11, r1_11, r2_11)
  -- line: [84, 87] id: 11
  DebugPrint(LXYTag, "组队Toast", r1_11)
  r3_0.Super.ShowToast(r0_11, r1_11, r2_11, {
    bPopWait = true,
  })
end
function r3_0.OpenHeadUI(r0_12, r1_12, r2_12)
  -- line: [89, 94] id: 12
  local r3_12 = r0_12:GetUIMgr(r1_12):LoadUINew(r1_0.HeadUIName, r1_12, r2_12)
  r0_12:GetUIMgr(r1_12):RemoveLoadedUI(r3_12:GetName())
  r3_0.HeadUIs[r1_12] = r3_12
  return r3_12
end
function r3_0.OpenHeadUI2(r0_13, r1_13, r2_13)
  -- line: [96, 101] id: 13
  local r3_13 = r0_13:GetUIMgr(r1_13):LoadUINew(r1_0.HeadUIName2, r1_13, r2_13)
  r0_13:GetUIMgr(r1_13):RemoveLoadedUI(r3_13:GetName())
  r3_0.HeadUIs[r1_13] = r3_13
  return r3_13
end
function r3_0.GetHeadUI(r0_14, r1_14)
  -- line: [103, 105] id: 14
  return r3_0.HeadUIs[r1_14]
end
function r3_0.ClearHeadUI(r0_15, r1_15)
  -- line: [107, 109] id: 15
  r3_0.HeadUIs[r1_15] = nil
end
function r3_0.OpenKickMemberDialog(r0_16, r1_16, r2_16)
  -- line: [111, 119] id: 16
  r0_16:GetUIMgr(r2_16):ShowCommonPopupUI(r1_0.KickConfirmDialog, {
    RightCallbackFunction = function()
      -- line: [113, 115] id: 17
      r0_16:SendTeamKickMember(r1_16.Uid)
    end,
    ShortText = string.format(GText("UI_Team_Kick_Content"), r1_16.Nickname),
  }, r2_16)
end
function r3_0.ShutDownTeamInvite(r0_18)
  -- line: [121, 126] id: 18
  if r0_18:IsExistTimer(r0_18.InviteRecvTimer) then
    r0_18:StopTimer(r0_18.InviteRecvTimer)
  end
  r0_0:CleanInviteInfo()
end
function r3_0.SendTeamKickMember(r0_19, r1_19)
  -- line: [131, 133] id: 19
  r0_19:GetAvatar():TeamKickMember(r1_19)
end
function r3_0.RecvTeamKickMember(r0_20, r1_20, r2_20)
  -- line: [134, 139] id: 20
  if not r0_20:CheckError(r1_20, true) then
    return 
  end
  r0_20:NotifyEvent(r1_0.EventId.TeamKickMember, r2_20)
end
function r3_0.SendTeamInvite(r0_21, r1_21)
  -- line: [141, 153] id: 21
  if not r1_21 then
    r0_21:CheckError(ErrorCode.RET_TEAM_INVATE_NOT_EXIST, true)
    return 
  end
  if r0_0:GetInviteSendBox()[r1_21] then
    return 
  end
  r0_21:GetAvatar():TeamInvite(r1_21)
end
function r3_0.RecvTeamInvite(r0_22, r1_22, r2_22)
  -- line: [154, 164] id: 22
  if r0_0:GetInviteSendBox()[r2_22] then
    return 
  end
  if not r0_22:CheckError(r1_22, true) then
    return 
  end
  r0_0:AddSentInvite(r2_22, r0_22:SetUpDoInviteTimer(r2_22, r1_0.LoopTimerInterval))
  r0_22:ShowToast(GText("UI_Team_InviteSend"))
  r0_22:NotifyEvent(r1_0.EventId.TeamInvite, r2_22)
end
function r3_0.SendTeamRefuseInvite(r0_23, r1_23)
  -- line: [166, 183] id: 23
  local r2_23 = r0_0:GetBackInviteInfo()
  if not r2_23 then
    r0_23:CheckError(ErrorCode.RET_TEAM_INVATE_NOT_EXIST, true)
    r0_23:NotifyEvent(r1_0.EventId.TeamInviteFailed, ErrorCode.RET_TEAM_INVATE_NOT_EXIST)
    return 
  end
  local r3_23 = r2_23.Uid
  if r0_23:IsExistTimer(r0_23.InviteRecvTimer) then
    r0_23:StopTimer(r0_23.InviteRecvTimer)
  end
  if r0_0:PopInviteInfo() then
    r0_23:AddTimer(0.01, function()
      -- line: [178, 180] id: 24
      r0_23:SetUpBeInviteTimer(r1_0.LoopTimerInterval)
    end, false, 0, nil, true)
  end
  r0_23:GetAvatar():TeamRefuseInvite(r3_23, r1_23)
end
function r3_0.SendSetTeamOrientation(r0_25, r1_25)
  -- line: [185, 187] id: 25
  r0_25:GetAvatar():SetTeamOrientation(r1_25)
end
function r3_0.SendVoteStartBattle(r0_26, r1_26)
  -- line: [189, 191] id: 26
  r0_26:GetAvatar():VoteStartBattle(r1_26)
end
function r3_0.SendTeamAgreeInvite(r0_27, r1_27)
  -- line: [193, 199] id: 27
  r0_27:GetAvatar():TeamAgreeInvite(r1_27)
  local r2_27 = r0_27:GetView(GWorld.GameInstance, r1_0.TipUIName)
  if IsValid(r2_27) then
    r2_27:Close()
  end
end
function r3_0.RecvTeamAgreeInvite(r0_28, r1_28, r2_28)
  -- line: [200, 214] id: 28
  if not r0_28:CheckError(r1_28, true) then
    r0_28:NotifyEvent(r1_0.EventId.TeamInviteFailed, r1_28)
    r0_28:SendTeamRefuseInvite(false)
    return 
  end
  local r3_28 = r0_0:GetBackInviteInfo()
  if not r3_28 and r2_28 ~= r3_28.Uid then
    r0_28:CheckError(ErrorCode.RET_TEAM_INVATE_NOT_EXIST, true)
    r0_0:PopInviteInfo()
    return 
  end
  r0_28:ShutDownTeamInvite()
  r0_28:NotifyEvent(r1_0.EventId.TeamAgreeInvite, r2_28)
end
function r3_0.SendTeamLeave(r0_29)
  -- line: [216, 218] id: 29
  r0_29:GetAvatar():TeamLeave()
end
function r3_0.RecvTeamLeave(r0_30, r1_30, r2_30)
  -- line: [219, 236] id: 30
  if not r0_30:CheckError(r1_30, true) then
    return 
  end
  local r3_30 = r0_0:GetTeam()
  if not r3_30 then
    return 
  end
  local r4_30 = GText("UI_Team_YouLeaveTeam")
  if r2_30 then
    r4_30 = GText("UI_Team_YouBeKicked")
  elseif #r0_0:GetTeam().Members == 1 then
    r4_30 = GText("UI_Team_TeamDisband")
  end
  if GWorld:IsStandAlone() then
    r0_30:ShowToast(r4_30)
  end
  r0_0:SetTeam(nil)
  r0_30:NotifyEvent(r1_0.EventId.TeamLeave, r3_30)
end
function r3_0.SendTeamChangeLeader(r0_31, r1_31)
  -- line: [238, 240] id: 31
  r0_31:GetAvatar():TeamChangeLeader(r1_31)
end
function r3_0.RecvTeamChangeLeader(r0_32, r1_32, r2_32)
  -- line: [241, 246] id: 32
  if not r0_32:CheckError(r1_32, true) then
    return 
  end
  r0_32:NotifyEvent(r1_0.EventId.TeamChangeLeader, r2_32)
end
function r3_0.RecvTeamBeInvited(r0_33, r1_33)
  -- line: [248, 255] id: 33
  if r0_0:IsInviteExist(r1_33) then
    return 
  end
  local r2_33 = r0_0.InviteRecvQueue:IsEmpty()
  r0_0:PushInviteInfo(r1_33)
  if r2_33 then
    r0_33:SetUpBeInviteTimer(r1_0.LoopTimerInterval)
  end
end
function r3_0.RecvTeamBeRefused(r0_34, r1_34)
  -- line: [257, 267] id: 34
  local r2_34 = r0_0:GetInviteSendBox()[r1_34]
  if not r2_34 then
    return 
  end
  local r3_34 = FriendController:GetModel():GetNicknameByUid(r1_34)
  if r3_34 then
    r0_34:ShowToast(string.format(GText("UI_Team_FriendRefuse"), r3_34))
  end
  r0_34:StopTimer(r2_34)
  r0_0:DelSentInvite(r1_34)
  r0_34:NotifyEvent(r1_0.EventId.TeamBeRefused, r1_34)
end
function r3_0.RecvTeamBeAgreed(r0_35, r1_35)
  -- line: [269, 276] id: 35
  local r2_35 = r0_0:GetInviteSendBox()[r1_35]
  if not r2_35 then
    return 
  end
  AudioManager(r0_35):PlayUISound(r0_35, "event:/ui/common/team_accept_invite", nil, nil)
  r0_35:StopTimer(r2_35)
  r0_0:DelSentInvite(r1_35)
  r0_35:NotifyEvent(r1_0.EventId.TeamBeAgreed, r1_35)
end
function r3_0.RecvTeamOnAddPlayer(r0_36, r1_36)
  -- line: [278, 286] id: 36
  r0_0:AddTeamMember(r1_36)
  local r2_36 = r1_36.Nickname
  if r2_36 then
    r0_36:ShowToast(string.format(GText("UI_Chat_SbJoin"), r2_36))
  end
  r0_36:NotifyEvent(r1_0.EventId.TeamOnAddPlayer, r1_36)
  ChatController:SendMemberChangeTipsToTeam(r1_36, r1_0.EventId.TeamOnAddPlayer)
end
function r3_0.RecvTeamOnDelPlayer(r0_37, r1_37, r2_37)
  -- line: [288, 316] id: 37
  local r3_37 = r0_0:GetTeamMember(r1_37)
  if r3_37 and not r3_37.bDsData then
    local r4_37 = ""
    if r1_37 == r0_37:GetAvatar().Uid and r0_0:GetTeam() then
      r0_37:RecvTeamLeave(ErrorCode.RET_SUCCESS, false)
      return 
    end
    if r2_37 == CommonConst.LeaveTeamReason.Willing then
      r4_37 = GText("UI_Team_SomeOneLeave")
    elseif r2_37 == CommonConst.LeaveTeamReason.Kick then
      r4_37 = GText("UI_Team_SomeOneKicked")
    elseif r2_37 == CommonConst.LeaveTeamReason.OffLine then
      r4_37 = GText("UI_Team_SomeOneOffLine")
    end
    if GWorld:IsStandAlone() then
      r0_37:ShowToast(string.format(r4_37, r3_37.Nickname))
    end
    r0_0:DelTeamMember(r3_37)
    ChatController:SendMemberChangeTipsToTeam(r3_37, r1_0.EventId.TeamOnDelPlayer)
    r0_37:NotifyEvent(r1_0.EventId.TeamOnDelPlayer, r3_37, r2_37)
    if #r0_0:GetTeam().Members == 0 then
      local r5_37 = r0_0:GetTeam()
      r0_0:SetTeam(nil)
      r0_37:NotifyEvent(r1_0.EventId.TeamLeave, r5_37)
    end
  end
end
function r3_0.RecvTeamOnInit(r0_38, r1_38)
  -- line: [318, 329] id: 38
  r0_0:SetTeam(r1_38)
  local r2_38 = r0_0:GetTeam()
  local r3_38 = nil	-- notice: implicit variable refs by block#[3]
  if r2_38 == nil then
    r3_38 = 0
    if not r3_38 then
      ::label_12::
      r3_38 = #r2_38.Members
    end
  else
    goto label_12	-- block#2 is visited secondly
  end
  for r7_38 = 1, r3_38, 1 do
    ChatController:SendMemberChangeTipsToTeam(r2_38.Members[r7_38], r1_0.EventId.TeamOnAddPlayer)
  end
  r0_38:ShutDownTeamInvite()
  r0_38:NotifyEvent(r1_0.EventId.TeamOnInit, r0_0:GetTeam())
end
function r3_0.RecvDsServerDie(r0_39)
  -- line: [331, 334] id: 39
  r0_39:RecvTeamOnVoteInvalid()
  r0_39:NotifyEvent(r1_0.EventId.TeamOnDsDie)
end
function r3_0.RecvTeamOnChangeLeader(r0_40, r1_40)
  -- line: [336, 350] id: 40
  local r2_40 = r0_0:GetTeamMember(r1_40)
  local r3_40 = r0_0:GetTeamLeaderId()
  if r2_40 and not r2_40.bDsData then
    if r1_40 == r0_40:GetAvatar().Uid then
      if #r0_0:GetTeam().Members > 1 then
        r0_40:ShowToast(GText("UI_Team_YouBecomeLeader"))
      end
    else
      r0_40:ShowToast(string.format(GText("UI_Team_SomeOneBecomeLeader"), r2_40.Nickname))
    end
    r0_0:SetTeadLeaderId(r1_40)
    r0_40:NotifyEvent(r1_0.EventId.TeamOnChangeLeader, r2_40, r3_40)
  end
end
function r3_0.RecvTeamOnVoteAgreed(r0_41, r1_41)
  -- line: [352, 358] id: 41
  local r2_41 = r0_0:GetTeamMember(r1_41)
  if r2_41 and not r2_41.bDsData then
    r2_41.HeadState = r1_0.HeadState.VoteEnter
  end
  r0_41:NotifyEvent(r1_0.EventId.TeamOnVoteAgreed, r1_41)
end
function r3_0.RecvTeamOnVoteStart(r0_42, r1_42)
  -- line: [360, 367] id: 42
  r0_0:CacheNowDungeonId(r1_42)
  if not r0_0:GetTeam() then
    return 
  end
  for r6_42, r7_42 in ipairs(r0_0:GetTeam().Members) do
    r7_42.HeadState = r1_0.HeadState.WaitingEnter
  end
  -- close: r2_42
  r0_42:NotifyEvent(r1_0.EventId.TeamOnVoteStart, r1_42)
end
function r3_0.RecvTeamOnVoteRefused(r0_43, r1_43)
  -- line: [369, 382] id: 43
  r0_0:CleanNowDungeonId()
  if not r0_0:GetTeam() then
    return 
  end
  for r6_43, r7_43 in ipairs(r0_0:GetTeam().Members) do
    r7_43.HeadState = r1_0.HeadState.Normal
  end
  -- close: r2_43
  if r1_43 and not r0_0:IsYourself(r1_43) then
    local r2_43 = r0_0:GetTeamMember(r1_43)
    if r2_43 then
      r2_43.HeadState = r1_0.HeadState.VoteRefused
    end
  end
  r0_43:NotifyEvent(r1_0.EventId.TeamOnVoteRefused)
end
function r3_0.RecvTeamOnVoteInvalid(r0_44, r1_44)
  -- line: [384, 394] id: 44
  r0_0:CleanNowDungeonId()
  if r1_44 then
    r0_44:CheckError(r1_44)
  end
  if not r0_0:GetTeam() then
    return 
  end
  for r6_44, r7_44 in ipairs(r0_0:GetTeam().Members) do
    r7_44.HeadState = r1_0.HeadState.Normal
  end
  -- close: r2_44
  r0_44:NotifyEvent(r1_0.EventId.TeamOnVoteInvalid)
end
function r3_0.RecvTeamMemberPropChange(r0_45, r1_45, r2_45)
  -- line: [396, 408] id: 45
  if not r0_0:GetTeam() then
    return 
  end
  local r3_45, r4_45 = r0_0:GetTeamMember(r2_45)
  DebugPrint(DebugTag, LXYTag, "RecvTeamMemberPropChange", r2_45)
  if r3_45 and not r3_45.bDsData then
    CommonUtils.MergeTables(r3_45, r1_45)
    if r3_45.Offline then
      r3_45.HeadState = r1_0.HeadState.Offline
    end
    r0_45:NotifyEvent(r1_0.EventId.TeamOnMemberChange, r3_45, r4_45)
  end
end
function r3_0.RecvTeamOnVoteEntering(r0_46)
  -- line: [410, 419] id: 46
  r0_0:CleanNowDungeonId()
  if not r0_0:GetTeam() then
    return 
  end
  for r5_46, r6_46 in ipairs(r0_0:GetTeam().Members) do
    if r6_46.HeadState == r1_0.HeadState.WaitingEnter then
      r6_46.HeadState = r1_0.HeadState.VoteEnter
    end
  end
  -- close: r1_46
  r0_46:NotifyEvent(r1_0.EventId.TeamOnVoteEntering)
end
function r3_0.SendTeamRefresh(r0_47)
  -- line: [421, 439] id: 47
  if r0_0:GetTeam() and r0_0:GetTeam().bDsData then
    return 
  end
  if not GWorld:IsStandAlone() then
    r0_0:CreateTeamDataWithDs(GWorld.GameInstance)
  end
  local r1_47 = r0_0.CachedRecoveryTeamInfo
  if r1_47 and not table.isempty(r1_47) then
    r0_47:_ApplyRecvTeamRefresh(r1_47)
  else
    r0_0.CachedRecoveryTeamInfo = {}
    if r0_47:IsExistTimer(r0_47.TeamRecoveryTimer) then
      r0_47:StopTimer(r0_47.TeamRecoveryTimer)
    end
    r0_47:AddTimer(15, function()
      -- line: [435, 437] id: 48
      r0_0.CachedRecoveryTeamInfo = nil
    end, false, 0, r0_47.TeamRecoveryTimer)
  end
end
function r3_0.RecvTeamRefresh(r0_49, r1_49, r2_49)
  -- line: [440, 446] id: 49
  if r0_0.CachedRecoveryTeamInfo and table.isempty(r0_0.CachedRecoveryTeamInfo) then
    r0_49:_ApplyRecvTeamRefresh(r2_49)
  else
    r0_0.CachedRecoveryTeamInfo = r2_49
  end
end
function r3_0._ApplyRecvTeamRefresh(r0_50, r1_50)
  -- line: [448, 471] id: 50
  if not GWorld:IsStandAlone() then
    if not r0_0:GetTeamBackup() then
      ChatController:RecvSystemInfoToTeam(string.format(GText("UI_Team_PlayerReOnline"), r0_50:GetAvatar().Nickname))
    end
    if r1_50 then
      r0_0:SetTeamBackup(r1_50)
    end
  else
    r0_50:RecvTeamOnInit(r1_50)
  end
  r0_0.CachedRecoveryTeamInfo = nil
end
function r3_0.TrySyncTeamInSingleGame(r0_51)
  -- line: [473, 479] id: 51
  DebugPrint(DebugTag, LXYTag, " TeamSyncDebug  组队流程时序 单人本或大世界， TeamController::TrySyncTeamInBigWorld")
  if not r0_0:GetTeam() then
    r0_51:SendTeamRefresh()
  end
  r0_51:NotifyEvent(r1_0.EventId.OnEnterSingelGame)
end
function r3_0.TrySyncTeamInMultiGame(r0_52)
  -- line: [480, 491] id: 52
  DebugPrint(DebugTag, LXYTag, " TeamSyncDebug 组队流程时序 多人副本， TeamController::TrySyncTeamInMultiGame")
  if not GameState(GWorld.GameInstance) then
    DebugPrint(LXYTag, " TeamSyncDebug  组队流程时序 多人副本中，GameState为空, 无法判断是否有多名玩家")
    return 
  end
  DebugPrint("TeamSyncDebug  看看PlayerArray的数量", #GameState(GWorld.GameInstance).PlayerArray:ToTable())
  DebugPrint("TeamSyncDebug  看看PhantomArray的值", #GameState(GWorld.GameInstance).PhantomArray:ToTable())
  r0_52:SendTeamRefresh()
  PrintTable(r0_0:GetTeam(), 3, LXYTag .. "TeamSyncDebug  看看TeamModel的队伍值")
  r0_52:NotifyEvent(r1_0.EventId.OnEnterMultiGame)
end
function r3_0.SetUpAutoResetHeadStateTimer(r0_53)
  -- line: [495, 503] id: 53
  r0_53:StopTimer(r0_53.AutoResetHeadStateTimer)
  r0_53:AddTimer(r1_0.ResetHeadStateTime, function()
    -- line: [497, 502] id: 54
    for r4_54, r5_54 in ipairs(r0_0.TeamData.Members) do
      r5_54.HeadState = r1_0.HeadState.Normal
    end
    -- close: r0_54
    r0_53:NotifyEvent(r1_0.EventId.TeamOnVoteInvalid)
  end, false, 0, r0_53.AutoResetHeadStateTimer)
end
function r3_0.SetUpBeInviteTimer(r0_55, r1_55)
  -- line: [505, 545] id: 55
  local r2_55 = r0_0:GetBackInviteInfo()
  local r3_55 = r0_55:GetView(GWorld.GameInstance, r1_0.TipUIName)
  if not r2_55 then
    DebugPrint(LXYTag, "队列空了，邀请流程退出")
    if IsValid(r3_55) then
      r3_55:Close()
      DebugPrint(LXYTag, "关闭邀请UI")
    end
    return 
  end
  DebugPrint(LXYTag, "开始组队受邀请定时器")
  if not r0_55:GetUIMgr():GetUIObj("CommonChangeScene") then
    if not IsValid(r3_55) then
      DebugPrint(LXYTag, "打开邀请UI")
      r3_55 = r0_55:OpenView(GWorld.GameInstance, r1_0.TipUIName, r2_55)
    else
      DebugPrint(LXYTag, "重用邀请UI")
      r3_55:StopAllAnimations()
      r3_55:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      r3_55:Construct()
      r3_55:InitUIInfo(r1_0.TipUIName, false, nil, r2_55)
    end
  end
  local r4_55 = r2_0.TeamInviteStayTime.ConstantValue
  local r5_55 = r4_55
  r0_55:AddTimer(r1_55, function()
    -- line: [532, 544] id: 56
    r5_55 = r5_55 - r1_55
    if IsValid(r3_55) and not r3_55:HasFocusedDescendants() and r0_55:IsGamepad() then
      DebugPrint(LXYTag, WarningTag, "组队邀请UI需要抢夺聚焦！！！！！！")
      r3_55:SetFocus()
    end
    if r5_55 > 0 then
      r0_55:NotifyEvent(r1_0.EventId.TeamInviteWaiting, r5_55 / r4_55)
      return 
    end
    r0_55:StopTimer(r0_55.InviteRecvTimer)
    r0_55:NotifyEvent(r1_0.EventId.TeamInviteWaiting, 0)
  end, true, 0, r0_55.InviteRecvTimer)
end
function r3_0.SetUpDoInviteTimer(r0_57, r1_57, r2_57)
  -- line: [547, 562] id: 57
  if not r0_0:GetInviteSendBox() then
    DebugPrint(DebugTag, "SetUpDoInviteTimer: InviteSendBox is empty")
  end
  local r5_57 = DataMgr.GlobalConstant.TeamInviteMax.ConstantValue * DataMgr.GlobalConstant.TeamInviteStayTime.ConstantValue + 1
  return r0_57:AddTimer(r2_57, function()
    -- line: [554, 561] id: 58
    r5_57 = r5_57 - r2_57
    if r5_57 > 0 then
      return 
    end
    DebugPrint(DebugTag, "发出去的组队邀请已经超时", r1_57)
    r0_57:RecvTeamBeRefused(r1_57)
  end, true, 0, nil)
end
function r3_0.DelTeamMemberWithDs(r0_59, r1_59)
  -- line: [566, 576] id: 59
  if r0_0:GetTeam() and r0_0:GetTeam().bDsData then
    DebugPrint(LXYTag, "TeamSyncDebug  TeamModel 尝试移除ds队友数据 ", r1_59)
    local r2_59 = r0_0:GetTeamMember(r1_59)
    if r2_59 and r2_59.bDsData then
      DebugPrint(LXYTag, "TeamSyncDebug TeamModel Ds队友 移除成功 ", r1_59)
      r0_0:DelTeamMemberWithDs(r1_59)
      r0_59:NotifyEvent(r1_0.EventId.DsTeamOnDelPlayer, r2_59)
    end
  end
end
function r3_0.AddTeamMemberWithDs(r0_60, r1_60, r2_60)
  -- line: [578, 595] id: 60
  DebugPrint(LXYTag, "TeamSyncDebug TeamModel 尝试添加ds队友数据 ", r2_60)
  if not r0_0:AddTeamMemberWithDs(r1_60, r2_60) then
    return 
  end
  DebugPrint(LXYTag, "TeamSyncDebug  Ds队友添加成功 ")
  local r4_60 = r0_0:GetTeam()
  local r5_60 = r0_0:GetTeamBackup()
  if not r5_60 or #r5_60.Members < #r4_60.Members then
    local r6_60 = r0_0:GetTeamMember(r2_60)
    if r6_60 then
      local r7_60 = r6_60.Nickname .. GText("UI_JoinMatch")
      ChatController:RecvSystemInfoToTeam(r7_60)
      r0_60:ShowToast(r7_60)
    end
  end
  r0_60:NotifyEvent(r1_0.EventId.DsTeamOnAddPlayer, r0_0:GetTeamMember(r2_60))
end
function r3_0.DoCheckCanEnterDungeon(r0_61, r1_61)
  -- line: [599, 627] id: 61
  local r2_61 = r0_0:GetTeam()
  if r2_61 then
    local r3_61, r4_61 = r2_61:IsAnyMemberCanNotEnterDungeon()
    if r3_61 then
      r0_61:ShowToast(GText("TOAST_DUNGEON_FAIL_UNABLE"))
      r0_61:NotifyEvent(r1_0.EventId.TeamOnVoteAbort, r4_61)
      r0_61:SetUpAutoResetHeadStateTimer()
      return false
    end
    local r5_61 = DataMgr.Dungeon[r1_61]
    if r5_61 then
      r5_61 = DataMgr.Dungeon[r1_61].DungeonCost[1] and 0
    else
      goto label_35	-- block#5 is visited secondly
    end
    local r6_61 = {}
    local r7_61 = {}
    for r12_61, r13_61 in pairs(r2_61.Members) do
      if r13_61.ActionPoint < r5_61 then
        table.insert(r6_61, r13_61.Index .. "P")
        table.insert(r7_61, r13_61.Uid)
      end
      r13_61.HeadState = r1_0.HeadState.CantEnterDungeon
    end
    -- close: r8_61
    if not table.isempty(r7_61) then
      r0_61:ShowToast(string.format(GText("DUNGEON_ENTER_FAILED_TOAST"), table.concat(r6_61, "/")))
      r0_61:NotifyEvent(r1_0.EventId.TeamOnVoteAbort, r7_61)
      r0_61:SetUpAutoResetHeadStateTimer()
      return false
    end
  end
  return true
end
function r3_0.DoWhenEnterDungeonCheckFailed(r0_62, r1_62, r2_62)
  -- line: [629, 637] id: 62
  if r1_62 ~= ErrorCode.RET_TEAM_DUNGEON_CHECK_FAILED then
    return 
  end
  if not r2_62 or not next(r2_62) then
    assert(false, "FailedMember is nil")
    return 
  end
  DebugPrint(LXYTag, "gmy@M.EnterDungeonCallback FailedMember", r2_62 and #r2_62)
  r0_62:CheckError(r1_62)
end
_G.TeamController = r3_0
return r3_0
