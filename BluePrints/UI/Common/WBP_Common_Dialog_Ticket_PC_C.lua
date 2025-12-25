-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\Common\WBP_Common_Dialog_Ticket_PC_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase"
})
function r0_0.Construct(r0_1)
  -- line: [16, 26] id: 1
  r0_1:AddDispatcher(EventID.TeamMatchOneRefused, r0_1, r0_1.OnTeamMatchCancel)
  r0_1:AddDispatcher(EventID.TeamMatchStartMatching, r0_1, r0_1.OnTeamMatchStartMatching)
  r0_1:AddDispatcher(EventID.DungeonSelectTicketEnd, r0_1, r0_1.OnDungeonSelectTicketEnd)
  r0_1:AddDispatcher(EventID.TeamMatchCancel, r0_1, r0_1.OnTeamMatchCancel)
  TeamController:RegisterEvent(r0_1, function(r0_2, r1_2, ...)
    -- line: [21, 25] id: 2
    if r1_2 == TeamCommon.EventId.TeamOnInit or r1_2 == TeamCommon.EventId.TeamLeave then
      r0_2.Owner:OnClose()
    end
  end)
end
function r0_0.Destruct(r0_3)
  -- line: [28, 30] id: 3
  TeamController:UnRegisterEvent(r0_3)
end
function r0_0.InitContent(r0_4, r1_4, r2_4, r3_4)
  -- line: [32, 58] id: 4
  r0_4.Super.InitContent(r0_4, r1_4, r2_4, r3_4)
  r0_4.Owner = r3_4
  r0_4.DungeonId = r1_4.DungeonId
  r0_4:InitItemList(r0_4.DungeonId)
  assert(GWorld:GetAvatar(), "NO AVATAR")
  r0_4.Text_Choose:SetText(GText("UI_Ticket_Choose"))
  DebugPrint("gmy@WBP_Common_Dialog_Ticket_PC_C M:InitContent", r4_4:IsInMultiSettlement(), r4_4:IsInTeam())
  r0_4.bIsInTeam = r4_4:IsInMultiSettlement() and r4_4:IsInTeam()
  r0_4.bIsInMultiDungeon = r4_4:IsInMultiDungeon()
  r0_4.bIsInTempScene = GWorld.GameInstance:IsInTempScene()
  if r0_4.bIsInTeam then
    r0_4:BindDialogEvent("OnRightBtnClicked", r0_4.OnRightBtnClicked)
    r0_4.VB_CountDown:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_4.CountdownSeconds = DataMgr.GlobalConstant.TicketSelectTime.ConstantValue
    r0_4:StartSelectCountDown()
  elseif r0_4.bIsInMultiDungeon and not r0_4.bIsInTempScene then
    r0_4:BindDialogEvent("OnRightBtnClicked", r0_4.OnRightBtnClicked)
    r0_4.VB_CountDown:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_4.CountdownSeconds = DataMgr.GlobalConstant.TicketSelectTime.ConstantValue
    r0_4:StartSelectCountDownInDungeon()
  else
    r0_4.VB_CountDown:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
function r0_0.OnRightBtnClicked(r0_5)
  -- line: [62, 64] id: 5
  r0_5.Owner:ForbidRightBtn(true)
end
function r0_0.InitItemList(r0_6, r1_6)
  -- line: [67, 98] id: 6
  r0_6.TicketItemTable = {}
  if not r1_6 then
    DebugPrint("ZDX_DungeonId is nil")
    return 
  end
  DebugPrint("ZDX_DungeonId is", r1_6)
  r0_6.DungeonId = r1_6
  local r2_6 = DataMgr.Dungeon[r1_6]
  r0_6.TicketIds = {}
  if r2_6.NoTicketEnter then
    table.insert(r0_6.TicketIds, -1)
  end
  if r2_6.TicketId then
    for r7_6, r8_6 in pairs(r2_6.TicketId) do
      table.insert(r0_6.TicketIds, r8_6)
    end
    -- close: r3_6
  end
  if #r0_6.TicketIds ~= 0 then
    for r7_6, r8_6 in pairs(r0_6.TicketIds) do
      local r9_6 = r0_6:CreateWidgetNew("DeputeTicket")
      r9_6.Button_Area.OnClicked:Add(r0_6, function()
        -- line: [88, 90] id: 7
        r0_6:OnItemClicked(r8_6)
      end)
      r0_6.Item:AddChild(r9_6)
      r9_6:InitInfo(r8_6, r0_6.Owner, r0_6)
      r0_6.TicketItemTable[r8_6] = r9_6
      -- close: r7_6
    end
    -- close: r3_6
  else
    DebugPrint("ZDX_TicketId List is nil")
  end
end
function r0_0.OnContentFocusReceived(r0_8, r1_8, r2_8)
  -- line: [100, 107] id: 8
  if r0_8.Item:GetChildAt(0) then
    r0_8.Item:GetChildAt(0):SetFocus()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end
function r0_0.OnFocusReceived(r0_9, r1_9, r2_9)
  -- line: [109, 116] id: 9
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad and r0_9.Item:GetChildAt(0) then
    r0_9.Item:GetChildAt(0):SetFocus()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end
function r0_0.PostInitContent(r0_10, r1_10, r2_10, r3_10)
  -- line: [118, 121] id: 10
  r0_10:OnItemClicked(r0_10.TicketIds[1], true)
  r0_10.LastTickedItem:SetFocus()
end
function r0_0.OnItemClicked(r0_11, r1_11, r2_11)
  -- line: [123, 142] id: 11
  if r0_11.bIsInTeam then
    r0_11.Owner:ForbidRightBtn(false)
  end
  if r1_11 then
    local r3_11 = r0_11.TicketItemTable[r1_11]:OnClicked()
    if r0_11.LastTickedItem and r0_11.LastTickedItem ~= r0_11.TicketItemTable[r1_11] and r3_11 then
      r0_11.LastTickedItem:OnCellUnSelect()
    end
    if r3_11 then
      if not r2_11 then
        AudioManager(r0_11):PlayUISound(r0_11, "event:/ui/common/click_btn_large", nil, nil)
      end
      r0_11.LastTickedItem = r0_11.TicketItemTable[r1_11]
      r0_11.TicketId = r1_11
    else
      AudioManager(r0_11):PlayUISound(r0_11, "event:/ui/common/click_btn_disable", nil, nil)
    end
  end
end
function r0_0.PackageData(r0_12)
  -- line: [144, 146] id: 12
  return {
    TicketId = r0_12.TicketId,
    DungeonId = r0_12.DungeonId,
  }
end
function r0_0.StartSelectCountDown(r0_13)
  -- line: [149, 168] id: 13
  local r1_13 = TimeUtils.NowTime() + r0_13.CountdownSeconds
  r0_13:AddTimer(0.1, function()
    -- line: [152, 167] id: 14
    local r0_14 = math.max(0, math.floor(r1_13 - TimeUtils.NowTime()))
    r0_13.Text_CountDown:SetText(tostring(r0_14))
    if r0_14 <= 0 then
      if not GWorld:GetAvatar() then
        return 
      end
      r0_13.Owner:OnClose()
      r0_13:RemoveTimer("TicketSelectCountDown")
    end
  end, true, 0, "TicketSelectCountDown")
end
function r0_0.StartSelectCountDownInDungeon(r0_15)
  -- line: [170, 185] id: 15
  local r1_15 = UGameplayStatics.GetGameState(r0_15)
  local r2_15 = r1_15.ClientTimerStruct:GetTimerInfo("SelectTicket")
  local r3_15 = r1_15.ReplicatedRealTimeSeconds
  r0_15:AddTimer(0.1, function()
    -- line: [174, 184] id: 16
    local r0_16, r1_16 = r0_15:GetRemainDungeonSelectTicketTime()
    r0_15.Text_CountDown:SetText(tostring(math.max(math.ceil(r0_16), 0)))
    if r0_16 < 1 then
      EventManager:FireEvent(EventID.OnSelectTicketTimeout, r0_15.TicketId)
      r0_15.Owner:OnClose()
      r0_15:RemoveTimer("TicketSelectCountDown")
    end
  end, true, 0, "TicketSelectCountDown")
end
function r0_0.GetRemainDungeonSelectTicketTime(r0_17)
  -- line: [187, 193] id: 17
  local r1_17 = UGameplayStatics.GetGameState(r0_17)
  local r2_17 = r1_17.ClientTimerStruct:GetTimerInfo("SelectTicket")
  return r2_17.Time - r1_17.ReplicatedRealTimeSeconds - r2_17.RealTimeSeconds, (r1_17.ReplicatedRealTimeSeconds - r2_17.RealTimeSeconds) / r2_17.Time
end
function r0_0.OnTeamMatchCancel(r0_18)
  -- line: [195, 199] id: 18
  DebugPrint("TeamBattleEvent_SelectTicket  OnTeamMatchCancel ")
  r0_18.Owner:OnClose()
end
function r0_0.OnTeamMatchStartMatching(r0_19)
  -- line: [201, 213] id: 19
  local r1_19 = GWorld:GetAvatar()
  assert(r1_19, "Avatar is nil")
  local r2_19 = r1_19:IsInTeam()
  DebugPrint("gmy@WBP_Common_Dialog_Ticket_PC_C M:OnTeamMatchStartMatching", r2_19, r1_19:IsInMultiSettlement())
  if r2_19 or r1_19:IsInMultiSettlement() then
    UIManager(r0_19):LoadUINew("DungeonMatchTimingBar", r0_19.DungeonId, Const.DUNGEON_MATCH_BAR_STATE.WAITING_MATCHING, true)
  end
  DebugPrint("TeamBattleEvent_SelectTicket  OnTeamMatchStartMatching ")
  r0_19.Owner:OnClose()
end
function r0_0.OnDungeonSelectTicketEnd(r0_20)
  -- line: [215, 218] id: 20
  DebugPrint("TeamBattleEvent_SelectTicket  OnDungeonSelectTicketEnd ")
  r0_20.Owner:OnClose()
end
return r0_0
