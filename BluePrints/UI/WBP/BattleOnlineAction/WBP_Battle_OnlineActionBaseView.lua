-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\BattleOnlineAction\WBP_Battle_OnlineActionBaseView.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = {}
local r1_0 = require("BluePrints.UI.WBP.BattleOnlineAction.OnlineActionController")
local r2_0 = require("BluePrints.UI.WBP.BattleOnlineAction.OnlineActionModel")
local r3_0 = require("BluePrints.UI.WBP.BattleOnlineAction.OnlineActionCommon")
function r0_0.InitBaseView(r0_1, r1_1)
  -- line: [9, 24] id: 1
  if not r1_1 then
    r1_1 = 1
  end
  r0_1.OpenReason = r1_1
  r0_1:StaticInit()
  r0_1:BindEvent()
  r0_1:DynamicInit()
  r0_1:PlayAnimation(r0_1.In)
  r0_1:SetFocus()
end
function r0_0.NotifyTick(r0_2, r1_2)
  -- line: [26, 40] id: 2
  if not IsValid(r0_2) then
    return 
  end
  r0_2:ClearDeadItem()
  local r2_2 = r0_2.List_Invite:GetDisplayedEntryWidgets()
  for r6_2 = 1, r2_2:Length(), 1 do
    r2_2:GetRef(r6_2):NotifyTick()
  end
end
function r0_0.ClearDeadItem(r0_3)
  -- line: [44, 66] id: 3
  local r1_3 = {}
  local r2_3 = r0_3.List_Invite:GetListItems()
  if not r2_3 then
    return 
  end
  for r6_3 = 1, r2_3:Length(), 1 do
    local r7_3 = r2_3:GetRef(r6_3)
    if r7_3 and r7_3.Content and (r7_3.Kind == 1 or r7_3.Kind == 3) and r7_3.Content.RemainTime <= 0 then
      table.insert(r1_3, r7_3)
    end
  end
  if #r1_3 > 0 then
    local r3_3 = r0_3.OldTabID
    if r0_3.Tab_OnlineAction and r0_3.Tab_OnlineAction.GetCurrentTabInfo then
      local r4_3 = r0_3.Tab_OnlineAction:GetCurrentTabInfo()
      if r4_3 then
        r3_3 = r4_3.TabId
      end
    end
    r0_3:RemoveItemsAndAutoSwitch(r1_3, r3_3)
  end
end
function r0_0.Tick(r0_4, r1_4, r2_4)
  -- line: [68, 70] id: 4
end
function r0_0.StaticInit(r0_5)
  -- line: [74, 92] id: 5
  r0_5.Text_Empty:SetText(GText("UI_RegionOnline_NoInvitation"))
  r0_5.Text_Title:SetText(GText("UI_RegionOnline_CommonList"))
end
function r0_0.BindEvent(r0_6)
  -- line: [94, 101] id: 6
  r0_6.Btn_Close.btn_close.OnClicked:Add(r0_6, function()
    -- line: [95, 98] id: 7
    AudioManager(r0_6):PlayUISound(r0_6, "event:/ui/common/click_btn_return", "Click", nil)
    r0_6:OnReturnKeyDown()
  end)
  r0_6.Tab_OnlineAction:BindEventOnTabSelected(r0_6, r0_6.OnTabSwitchOn)
end
function r0_0.DynamicInit(r0_8)
  -- line: [104, 114] id: 8
  if r0_8.OpenReason == 1 then
    r0_8.WS_Top:SetActiveWidgetIndex(0)
    r0_8:InitTabs()
  else
    r0_8.WS_Top:SetActiveWidgetIndex(1)
    r0_8.Text_Title:SetText(GText("UI_RegionOnline_CommonList"))
    r0_8:OnInvitationspageOpen()
  end
end
local r4_0 = {
  TabKey = "Applications",
  Text = GText("UI_RegionOnline_ApplyList"),
  TabId = 1,
}
local r5_0 = {
  TabKey = "NearbyPlayers",
  Text = GText("UI_RegionOnline_InviteNearby"),
  TabId = 2,
}
local r6_0 = {
  TabKey = "Invitations",
  Text = GText("UI_RegionOnline_InviteList"),
  TabId = 3,
}
function r0_0.InitTabs(r0_9)
  -- line: [134, 181] id: 9
  local r1_9 = {}
  if r0_9.OpenReason == 1 or not r0_9.OpenReason then
    r1_9 = {
      r4_0,
      r5_0,
      r6_0
    }
  elseif r0_9.OpenReason == 2 then
    r1_9 = {
      r6_0
    }
  else
    ScreenPrint("InitTabs: Unknown OpenReason 错误的打开原因，找不到对应Tab数据" .. tostring(r0_9.OpenReason))
    r1_9 = {
      r6_0
    }
  end
  local r2_9 = CommonUtils.GetDeviceTypeByPlatformName(r0_9) == "Mobile"
  local r3_9 = {
    LeftKey = "Q",
    RightKey = "E",
    LeftGamePadKey = "LeftShoulder",
    RightGamePadKey = "RightShoulder",
    ChildWidgetName = "",
    ChildWidgetBPPath = "/Game/UI/WBP/Battle/Widget/Online_Action/WBP_Battle_OnlineAction_TabItem.WBP_Battle_OnlineAction_TabItem",
    Tabs = r1_9,
    SoundFunc = function(r0_10)
      -- line: [159, 161] id: 10
      AudioManager(r0_10):PlayUISound(r0_10, "event:/ui/common/click_level_03", "OnlineActionTabBtnClick", nil)
    end,
  }
  if r0_9.OpenReason == 1 and not r2_0:HaveOtherApply() then
    r0_9.Tab_OnlineAction:Init(r3_9)
    r0_9:HideLastTabItemLine()
    r0_9.Tab_OnlineAction:SelectTab(2)
  elseif r0_9.OpenReason == 1 and r2_0:HaveOtherApply() then
    r0_9.Tab_OnlineAction:Init(r3_9)
    r0_9:HideLastTabItemLine()
    r0_9.Tab_OnlineAction:SelectTab(1)
  elseif r0_9.OpenReason == 2 then
    r0_9:OnInvitationspageOpen()
  end
end
function r0_0.HideLastTabItemLine(r0_11)
  -- line: [184, 196] id: 11
  local r1_11 = r0_11.Tab_OnlineAction
  if not r1_11 or not r1_11.List_Tab then
    return 
  end
  local r2_11 = r1_11.List_Tab:GetChildrenCount() and 0
  if r2_11 <= 0 then
    return 
  end
  local r3_11 = r1_11.List_Tab:GetChildAt(r2_11 + -1)
  if not r3_11 then
    return 
  end
  if r3_11.Line then
    r3_11.Line:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end
function r0_0.SwitchListView(r0_12)
  -- line: [200, 202] id: 12
  r0_12.WS_State:SetActiveWidgetIndex(0)
end
function r0_0.SwitchEmptyBG(r0_13, r1_13)
  -- line: [205, 214] id: 13
  if r1_13 == 1 then
    r0_13.Text_Empty:SetText(GText("UI_RegionOnline_NoApplication"))
  elseif r1_13 == 2 then
    r0_13.Text_Empty:SetText(GText("UI_RegionOnline_NoPlayer"))
  elseif r1_13 == 3 then
    r0_13.Text_Empty:SetText(GText("UI_RegionOnline_NoInvitation"))
  end
  r0_13.WS_State:SetActiveWidgetIndex(1)
end
function r0_0.OnTabSwitchOn(r0_14, r1_14, r2_14)
  -- line: [216, 230] id: 14
  if r2_14.TabKey == "Applications" then
    r0_14.TabKind = 1
    r0_14:SwitchListView(r1_14, r2_14)
    r0_14:OnApplicationsTabSwitchOn(r1_14, r2_14)
  elseif r2_14.TabKey == "NearbyPlayers" then
    r0_14.TabKind = 2
    r0_14:SwitchEmptyBG(r1_14, r2_14)
    r0_14:OnNearbyPlayersTabSwitchOn(r1_14, r2_14)
  elseif r2_14.TabKey == "Invitations" then
    r0_14.TabKind = 3
    r0_14:SwitchEmptyBG(r1_14, r2_14)
    r0_14:OnInvitationsTabSwitchOn(r1_14, r2_14)
  end
end
function r0_0.GenerateListItem(r0_15, r1_15, r2_15)
  -- line: [235, 291] id: 15
  local r3_15 = nil
  local r4_15 = nil
  local r5_15 = r0_15.List_Invite
  if r1_15 == 1 then
    r3_15 = r2_0:GetApplyInfos()
    r4_15 = r0_15.ApplyInfosCache
  elseif r1_15 == 2 then
    r3_15 = r2_0:GetNearbyPlayerInfos()
    r4_15 = r0_15.NearbyPlayersCache
  elseif r1_15 == 3 then
    r3_15 = r2_0:GetInvitationInfos()
    r4_15 = r0_15.InvitationInfosCache
  end
  if r3_15 and next(r3_15) then
    r0_15:SwitchListView()
    r5_15:ClearListItems()
    if r1_15 == 2 then
      local r6_15 = r2_0:GetMaxPlayerNum()
      for r11_15, r12_15 in ipairs(r3_15) do
        local r13_15 = NewObject(UIUtils.GetCommonItemContentClass())
        r13_15.Parent = r0_15
        r13_15.Content = r12_15
        r4_15:Add(r13_15)
        r13_15.Parent = r0_15
        r13_15.CallbackObj = r0_15
        r13_15.Kind = r1_15
        r13_15.NeedAni = r2_15
        function r13_15.InvitationCallback(r0_16, r1_16, r2_16)
          -- line: [267, 269] id: 16
          r1_0:SendInvitation(r1_16, r2_16)
        end
        r13_15.MaxPlayerNum = r6_15
        r5_15:AddItem(r13_15)
      end
      -- close: r7_15
    else
      for r9_15 = #r3_15, 1, -1 do
        local r10_15 = r3_15[r9_15]
        if r1_15 == 1 then
          r0_15:AddNewApplicationItem(r10_15, r2_15)
        elseif r1_15 == 3 then
          r0_15:AddNewInvitationItem(r10_15, r2_15)
        end
      end
    end
    if r0_15.IsGamePad then
      r0_15:FocusFirstItem()
    end
  else
    r0_15:SwitchEmptyBG(r1_15)
  end
end
function r0_0.RemoveSameSeatApplications(r0_17, r1_17)
  -- line: [293, 305] id: 17
  local r2_17 = {}
  local r3_17 = r0_17.List_Invite and r0_17.List_Invite:GetListItems()
  if r3_17 then
    for r7_17 = r3_17:Length(), 1, -1 do
      local r8_17 = r3_17:GetRef(r7_17)
      if r8_17 and r8_17.Content.InteractiveId == r1_17 then
        table.insert(r2_17, r8_17)
      end
    end
  end
  r0_17:RemoveItemsAndAutoSwitch(r2_17, 1)
end
function r0_0.IsListHaveItem(r0_18)
  -- line: [307, 310] id: 18
  local r1_18 = r0_18.List_Invite
  return r1_18 and r1_18:GetNumItems() > 0
end
function r0_0.RemoveItemsAndAutoSwitch(r0_19, r1_19, r2_19)
  -- line: [312, 342] id: 19
  local r3_19 = r0_19.List_Invite
  if not r3_19 then
    return 
  end
  if r1_19 then
    if #r1_19 > 1 then
      for r8_19, r9_19 in ipairs(r1_19) do
        if r9_19 then
          r3_19:RemoveItem(r9_19)
        end
      end
      -- close: r4_19
    else
      r3_19:RemoveItem(r1_19[1] and r1_19)
    end
  end
  if not r0_19:IsListHaveItem() then
    local r4_19 = r2_19
    if not r4_19 then
      local r5_19 = r0_19.Tab_OnlineAction and r0_19.Tab_OnlineAction.GetCurrentTabInfo and r0_19.Tab_OnlineAction:GetCurrentTabInfo()
      if r5_19 and r5_19.TabId then
        r4_19 = r5_19.TabId
      else
        r4_19 = r0_19.TabKind
      end
    end
    if r4_19 then
      r0_19:SwitchEmptyBG(r4_19)
    end
  end
end
function r0_0.FocusFirstItem(r0_20)
  -- line: [344, 354] id: 20
  r0_20:AddTimer(0.01, function()
    -- line: [345, 353] id: 21
    if r0_20:IsListHaveItem() then
      local r0_21 = r0_20.List_Invite:GetItemAt(0)
      r0_20.List_Invite:BP_NavigateToItem(r0_21)
      r0_20.List_Invite:BP_SetItemSelection(r0_21, true)
    else
      r0_20:SetFocus()
    end
  end)
end
function r0_0.OnTabSwitchOnBase(r0_22, r1_22, r2_22)
  -- line: [356, 372] id: 22
  local r3_22 = r2_22.TabId
  if r0_22.OldTabID and r0_22.OldTabID < r3_22 then
    r0_22:PlayAnimation(r0_22.List_Change_R)
  elseif r0_22.OldTabID and r3_22 < r0_22.OldTabID then
    r0_22:PlayAnimation(r0_22.List_Change_L)
  end
  if r0_22.Key_Refuse then
    r0_22.Key_Refuse:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if r0_22.Btn_Refuse then
    r0_22.Btn_Refuse:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  r0_22.OldTabID = r3_22
  r0_22.List_Invite:ClearListItems()
end
function r0_0.OnApplicationsTabSwitchOn(r0_23, r1_23, r2_23)
  -- line: [374, 378] id: 23
  r0_23:OnTabSwitchOnBase(r1_23, r2_23)
  r0_23:GenerateListItem(1)
end
function r0_0.OnNearbyPlayersTabSwitchOn(r0_24, r1_24, r2_24)
  -- line: [381, 391] id: 24
  r0_24:OnTabSwitchOnBase(r1_24, r2_24)
  r0_24:GenerateListItem(2)
  if r0_24.Key_Refuse then
    r0_24.Key_Refuse:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if r0_24.Btn_Refuse then
    r0_24.Btn_Refuse:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end
function r0_0.OnInvitationsTabSwitchOn(r0_25, r1_25, r2_25)
  -- line: [394, 399] id: 25
  r0_25:OnTabSwitchOnBase(r1_25, r2_25)
  r0_25:GenerateListItem(3)
end
function r0_0.OnInvitationspageOpen(r0_26)
  -- line: [402, 404] id: 26
  r0_26:GenerateListItem(3)
end
function r0_0.OnLeftTabKeyDown(r0_27)
  -- line: [408, 412] id: 27
  if r0_27.Tab_OnlineAction.CurrentTab and r0_27.Tab_OnlineAction.CurrentTab + -1 >= 1 then
    r0_27.Tab_OnlineAction:TabToLeft()
  end
end
function r0_0.OnRightTabKeyDown(r0_28)
  -- line: [415, 419] id: 28
  if r0_28.Tab_OnlineAction.CurrentTab and r0_28.Tab_OnlineAction.CurrentTab + 1 <= #r0_28.Tab_OnlineAction.Tabs then
    r0_28.Tab_OnlineAction:TabToRight()
  end
end
function r0_0.OnReceivedNewInvitation(r0_29, r1_29)
  -- line: [421, 430] id: 29
  if r0_29.TabKind == 3 or r0_29.OpenReason == 2 then
    local r2_29 = r0_29:AddNewInvitationItem(r1_29, true)
    r0_29.WS_State:SetActiveWidgetIndex(0)
    r0_29:AddTimer(0.1, function()
      -- line: [425, 427] id: 30
      r2_29.NeedAni = false
    end)
    -- close: r2_29
  end
end
function r0_0.AddNewInvitationItem(r0_31, r1_31, r2_31)
  -- line: [432, 455] id: 31
  local r3_31 = 3
  local r4_31 = r0_31.List_Invite
  local r6_31 = NewObject(UIUtils.GetCommonItemContentClass())
  r6_31.Content = r1_31
  r6_31.Parent = r0_31
  r0_31.InvitationInfosCache:Add(r6_31)
  r6_31.Parent = r0_31
  r6_31.CallbackObj = r0_31
  r6_31.Kind = r3_31
  r6_31.NeedAni = r2_31
  function r6_31.AcceptCallback(r0_32, r1_32)
    -- line: [444, 448] id: 32
    r1_0:SendAcceptInvitation(r1_32)
    r0_31:ClearListAndSwitchEmpty(3)
    r0_31:OnReturnKeyDown()
  end
  function r6_31.RejectCallback(r0_33, r1_33)
    -- line: [449, 452] id: 33
    r1_0:SendRejectInvitation(r1_33)
    r0_31:RemoveItemsAndAutoSwitch(r6_31, 3)
  end
  r4_31:AddItem(r6_31)
  return r6_31
end
function r0_0.OnReceivedNewApplication(r0_34, r1_34)
  -- line: [457, 466] id: 34
  if r0_34.TabKind == 1 then
    local r2_34 = r0_34:AddNewApplicationItem(r1_34, true)
    r0_34.WS_State:SetActiveWidgetIndex(0)
    r0_34:AddTimer(0.1, function()
      -- line: [461, 463] id: 35
      r2_34.NeedAni = false
    end)
    -- close: r2_34
  end
end
function r0_0.AddNewApplicationItem(r0_36, r1_36, r2_36)
  -- line: [468, 490] id: 36
  local r3_36 = 1
  local r4_36 = r0_36.List_Invite
  local r6_36 = NewObject(UIUtils.GetCommonItemContentClass())
  r6_36.Content = r1_36
  r6_36.Parent = r0_36
  r0_36.ApplyInfosCache:Add(r6_36)
  r6_36.Parent = r0_36
  r6_36.CallbackObj = r0_36
  r6_36.Kind = r3_36
  r6_36.NeedAni = r2_36
  function r6_36.AcceptCallback(r0_37, r1_37)
    -- line: [480, 483] id: 37
    r1_0:SendAcceptApplication(r1_37)
    r0_36:ClearListAndSwitchEmpty(3)
  end
  function r6_36.RejectCallback(r0_38, r1_38)
    -- line: [484, 487] id: 38
    r1_0:SendRejectApplication(r1_38)
    r0_36:RemoveItemsAndAutoSwitch(r6_36, 3)
  end
  r4_36:AddItem(r6_36)
  return r6_36
end
function r0_0.OnRefreshAllKeyDown(r0_39)
  -- line: [492, 505] id: 39
  DebugPrint("OnRefreshAllKeyDown")
  if r0_39.OpenReason == 2 then
    r0_39:GenerateListItem(3, true)
  end
  if r0_39.TabKind == 1 then
    r0_39:GenerateListItem(1, true)
  elseif r0_39.TabKind == 2 then
    r2_0:FindPlayerAround()
    r0_39:GenerateListItem(2, true)
  elseif r0_39.TabKind == 3 then
    r0_39:GenerateListItem(3, true)
  end
end
function r0_0.ClearListAndSwitchEmpty(r0_40, r1_40)
  -- line: [507, 513] id: 40
  local r2_40 = r0_40.List_Invite
  if not r2_40 then
    return 
  end
  r2_40:ClearListItems()
  r0_40:SwitchEmptyBG(r1_40 and r0_40.TabKind and 3)
end
function r0_0.OnRejectAllKeyDown(r0_41)
  -- line: [515, 524] id: 41
  DebugPrint("OnRejectAllKeyDown")
  if r0_41.TabKind == 3 or r0_41.OpenReason == 2 then
    r1_0:RejectAllInvitations()
    r0_41:ClearListAndSwitchEmpty(3)
  elseif r0_41.TabKind == 1 then
    r1_0:RejectAllApplications()
    r0_41:ClearListAndSwitchEmpty(1)
  end
end
function r0_0.OnReturnKeyDown(r0_42)
  -- line: [526, 532] id: 42
  r0_42:PlayAnimation(r0_42.Out)
  r0_42:UnbindAllFromAnimationFinished(r0_42.Out)
  r0_42:BindToAnimationFinished(r0_42.Out, function()
    -- line: [529, 531] id: 43
    r1_0:CloseView(r0_42)
    r0_42:MyClose()
  end)
end
function r0_0.MyClose(r0_44)
  -- line: [534, 537] id: 44
  r0_44.Super.Close(r0_44)
end
return r0_0
