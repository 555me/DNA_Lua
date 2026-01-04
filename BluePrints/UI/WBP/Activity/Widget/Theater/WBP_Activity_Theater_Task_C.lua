-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Activity\Widget\Theater\WBP_Activity_Theater_Task_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class("BluePrints.UI.BP_UIState_C")
local r1_0 = DataMgr.TheaterConstant.EventId.ConstantValue
r0_0._components = {
  "BluePrints.UI.UI_PC.Common.SelectItemToSubListComponent",
  "BluePrints.UI.WBP.Activity.Widget.Theater.TheaterActivityGamepadComponent"
}
function r0_0.Construct(r0_1)
  -- line: [41, 95] id: 1
  r0_1.Tab:Init({
    DynamicNode = {
      "Back"
    },
    StyleName = "Text",
    TitleName = GText("TheaterOnline_Donate_Name"),
    OwnerPanel = r0_1,
    BackCallback = r0_1.CloseSelf,
  })
  r0_1.NeedNum = {}
  r0_1:GetActivityProgress()
  r0_1.PreConsumeCount = 5
  r0_1.Super.Construct(r0_1)
  r0_1:PlayAnimation(r0_1.In)
  r0_1.ListView_Task.OnListViewScrolled:Add(r0_1, r0_1.OnListViewTaskScrolled)
  r0_1.List_Delivery.BP_OnEntryInitialized:Add(r0_1, r0_1.OnListDeliveryItemInited)
  r0_1.View_left_btns.BP_OnEntryInitialized:Add(r0_1, r0_1.OnViewLeftBtnInited)
  r0_1.Btn_Auto:BindEventOnClicked(r0_1, r0_1.OnBtnAutoClicked)
  r0_1.Btn_AutoText = GText("TheaterOnline_Donate_AutoPut")
  r0_1.Btn_Auto:SetText(GText("TheaterOnline_Donate_AutoPut"))
  r0_1.Btn_Delivery:ForbidBtn(true)
  r0_1.Btn_Delivery:BindEventOnClicked(r0_1, r0_1.OnBtnDeliveryClicked)
  r0_1.Btn_Delivery:SetText(GText("TheaterOnline_Donate_Confirm"))
  r0_1.Tip_Refresh:BindEventOnClicked(r0_1, r0_1.OnTipRefreshClicked)
  r0_1.Tip_Refresh:SetText(GText("UI_Friend_RefreshBtn"))
  r0_1.Button_Hit.OnClicked:Add(r0_1, r0_1.OnButtonHitClicked)
  r0_1.Panel_Bag:SetVisibility(ESlateVisibility.Collapsed)
  r0_1.View_left_btns:SetVisibility(ESlateVisibility.Visible)
  r0_1.bListExpand = false
  r0_1:InitListView(r0_1.List_Item, r0_1.List_Delivery, r0_1.Filter)
  r0_1:InitPreConsumeList()
  r0_1.List_Item.OnCreateEmptyContent:Bind(r0_1, function()
    -- line: [71, 75] id: 2
    local r0_2 = NewObject(UIUtils.GetCommonItemContentClass())
    r0_2.IsEmpty = true
    return r0_2
  end)
  r0_1.List_Reward.OnCreateEmptyContent:Bind(r0_1, function()
    -- line: [76, 80] id: 3
    local r0_3 = NewObject(UIUtils.GetCommonItemContentClass())
    r0_3.Id = 0
    return r0_3
  end)
  r0_1:InitGamepadIcon()
  r0_1.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(UE4.UGameplayStatics.GetPlayerController(r0_1, 0))
  if IsValid(r0_1.GameInputModeSubsystem) then
    r0_1.GameInputModeSubsystem.OnInputMethodChanged:Add(r0_1, r0_1.RefreshOpInfoByInputDevice)
  end
  r0_1.SelectedIndex = 1
  r0_1:RefreshOpInfoByInputDevice(r0_1.GameInputModeSubsystem:GetCurrentInputType(), r0_1.GameInputModeSubsystem:GetCurrentGamepadName())
  r0_1.Text_Empty_Search:SetText(GText("TheaterOnline_Donate_NoMatch"))
  EventManager:FireEvent(EventID.OnLeaveActivityEntry)
  r0_1.Text_Lable:SetText(GText("UI_Theater_Mail_Sent"))
  AudioManager(r0_1):PlayUISound(r0_1, "event:/ui/activity/theater_online_entrance_loop", "TheaterLoop", nil)
  AudioManager(r0_1):PlayUISound(r0_1, "event:/ui/armory/open", "Theater", nil)
end
function r0_0.RefreshOpInfoByInputDevice(r0_4, r1_4, r2_4)
  -- line: [97, 107] id: 4
  r0_4.CurInputDevice = r1_4
  r0_4.CurGamepadName = r2_4
  r0_4:UpdateGamepadUI(r1_4, r2_4)
  if r1_4 == ECommonInputType.Gamepad then
    r0_4:SetDefaultFocus()
  else
    r0_4:UpdateBottomKeyInfo()
    r0_4.IsSpecialFocus = false
  end
end
function r0_0.Destruct(r0_5)
  -- line: [110, 114] id: 5
  r0_5.List_Item.OnCreateEmptyContent:Unbind()
  r0_5.List_Reward.OnCreateEmptyContent:Unbind()
  r0_5.Super.Destruct(r0_5)
end
function r0_0.OnListDeliveryItemInited(r0_6, r1_6, r2_6)
  -- line: [116, 125] id: 6
  r0_6:OnPreConsumeListGenerated(r1_6, r2_6)
  r1_6.SelfWidget:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  if r1_6.Index == 1 then
    r1_6.SelfWidget:SetNavigationRuleCustom(EUINavigation.Left, {
      r0_6,
      function()
        -- line: [121, 123] id: 7
        return r0_6:SetDefaultFocus()
      end
    })
  end
end
function r0_0.OnViewLeftBtnInited(r0_8, r1_8, r2_8)
  -- line: [127, 129] id: 8
  r1_8.UI:SetNavigationRuleExplicit(EUINavigation.Right, r0_8.List_Delivery)
end
function r0_0.OnButtonHitClicked(r0_9)
  -- line: [131, 133] id: 9
  r0_9:OnExpandList(false, false)
end
function r0_0.OnBtnAutoClicked(r0_10)
  -- line: [135, 147] id: 10
  local r1_10 = true
  local r2_10 = r0_10.ListWidgets[1].Content
  if r2_10 and r2_10.Count and r2_10.Count > 0 then
    r1_10 = false
  end
  if r1_10 then
    r0_10:OnAutoSelectClick()
  else
    r0_10:ClearListItems()
  end
  r0_10:UpdateAddProgress()
end
function r0_0.PreviewLevelMax(r0_11, r1_11)
  -- line: [149, 163] id: 11
  local r2_11 = r0_11:FindSelectedContent(r1_11)
  local r3_11 = r0_11.NeedNum[r1_11]
  if r3_11 == nil or r0_11.CurStep == 3 and r0_11.SelectedIndex == 3 then
    return false
  end
  if r3_11 == 0 then
    return true
  end
  if r2_11 then
    return r3_11 <= r2_11.Count
  end
  return false
end
function r0_0.OnAutoSelectClick(r0_12)
  -- line: [165, 187] id: 12
  local r1_12 = false
  for r6_12, r7_12 in pairs(r0_12.FilteredContents) do
    local r9_12 = r0_12.NeedNum[r7_12.Id]
    local r11_12 = DataMgr.TheaterConstant["AutoPutMax_" .. r7_12.Rarity]
    if r11_12 then
      r11_12 = r11_12.ConstantValue and 0
    else
      goto label_20	-- block#3 is visited secondly
    end
    if r9_12 and r9_12 > 0 and r11_12 > 0 then
      r1_12 = true
      local r12_12 = math.min(math.min(r9_12, r7_12.Count), r11_12)
      r0_12:CopyItemToConsumeList(r7_12, r12_12)
      r7_12.SelectNeedCount = r12_12
      r0_12:SetResourceCount(r7_12.Id, r12_12)
      r0_12:FindSelectedContent(r7_12.Id).Count = r12_12
    end
  end
  -- close: r2_12
  if not r1_12 then
    UIManager(r0_12):ShowUITip("CommonToastMain", GText("TheaterOnline_Donate_Nothing"))
  end
end
function r0_0.OnBtnDeliveryClicked(r0_13)
  -- line: [189, 240] id: 13
  AudioManager(r0_13):PlayUISound(r0_13, "event:/ui/common/click_btn_confirm", nil, nil)
  local r1_13 = GWorld:GetAvatar()
  local r2_13 = {}
  for r7_13, r8_13 in pairs(r0_13.PreConsumeList) do
    if r8_13.Count and r8_13.Count > 0 then
      r2_13[r8_13.UnitId] = r8_13.Count
    end
  end
  -- close: r3_13
  r1_13:TheaterDonate(r0_13.SelectedIndex, r2_13, function(r0_14, r1_14)
    -- line: [198, 239] id: 14
    if r0_14 == 0 then
      AudioManager(r0_13):PlayUISound(r0_13, "event:/ui/common/combat_bag_hide_use_item", nil, nil)
      UIManager(r0_13):ShowUITip("CommonToastMain", GText("UI_Theater_Donate_Success"))
      local r2_14 = true
      for r7_14, r8_14 in pairs(r2_13) do
        if r0_13.NeedNum[r7_14] then
          if r0_13.NeedNum[r7_14] ~= r2_13[r7_14] then
            r2_14 = false
          end
          r0_13.NeedNum[r7_14] = r0_13.NeedNum[r7_14] - r8_14
          r0_13.DonateProgress[r7_14] = (r0_13.DonateProgress[r7_14] and 0) + r8_14
        end
      end
      -- close: r3_14
      for r7_14, r8_14 in pairs(r0_13.NeedNum) do
        if r8_14 > 0 then
          r2_14 = false
          break
        end
      end
      -- close: r3_14
      if r2_14 and r0_13.CurStep < #DataMgr.TheaterDonateStep[r1_0] then
        r0_13.CurStep = r0_13.CurStep + 1
        if r0_13.DonateProgress then
          for r7_14, r8_14 in pairs(r0_13.DonateProgress) do
            r0_13.DonateProgress[r7_14] = nil
          end
          -- close: r3_14
        else
          r0_13.DonateProgress = {}
        end
        r0_13:RefreshViewLeftBtns()
        r0_13:PlayBGAnimation(r0_13.CurStep)
        r0_13.WBP_Activity_Theater_BG:PlayAnimation(r0_13.WBP_Activity_Theater_BG.Change)
        r0_13:OnBtnItemClicked(r0_13.CurStep)
      end
      r0_13:ClearListItems()
      r0_13:UpdatePage(r0_13.SelectedIndex, true)
      r0_13:ShowItemDetails(false, nil)
      r0_13:UpdateAddProgress()
    end
  end)
end
function r0_0.OnTipRefreshClicked(r0_15)
  -- line: [242, 250] id: 15
  if r0_15.LastRefreshTime and UE4.UGameplayStatics.GetRealTimeSeconds(r0_15) - r0_15.LastRefreshTime < 5 then
    UIManager(r0_15):ShowUITip("CommonToastMain", GText("TheaterOnline_Donate_RefreshCD"))
    return 
  end
  r0_15.LastRefreshTime = UE4.UGameplayStatics.GetRealTimeSeconds(r0_15)
  r0_15:GetActivityProgress(true)
end
function r0_0.OnListViewTaskScrolled(r0_16)
  -- line: [252, 254] id: 16
  UIUtils.UpdateListArrow(r0_16.ListView_Task, r0_16.Arrow_UP, r0_16.Arrow_Down)
end
function r0_0.InitUI(r0_17)
  -- line: [256, 270] id: 17
  r0_17.Text_Title01:SetText(GText("TheaterOnline_Donate_Reward"))
  r0_17.Text_Title02:SetText(GText("TheaterOnline_Donate_Progress"))
  r0_17.Text_Title03:SetText(GText("TheaterOnline_Donate_Puy"))
  r0_17:UpdateBottomKeyInfo()
  r0_17.Tip_Award:Init({
    OwnerWidget = r0_17,
    MenuPlacement = EMenuPlacement.MenuPlacement_CenteredAboveAnchor,
    SoundFunc = function()
      -- line: [265, 267] id: 18
      AudioManager(r0_17):PlayUISound(nil, "event:/ui/common/click_btn_small", nil, nil)
    end,
    TextContent = GText("TheaterOnline_Donate_Explain"),
  })
end
function r0_0.InitViewLeftBtns(r0_19)
  -- line: [272, 286] id: 19
  r0_19.View_left_btns:ClearListItems()
  for r4_19 = 1, 3, 1 do
    local r5_19 = NewObject(UIUtils.GetCommonItemContentClass())
    r5_19.Index = r4_19
    r5_19.ParentWidget = r0_19
    r5_19.IsLock = r0_19.CurStep < r4_19
    r5_19.IsSelected = r0_19.CurStep == r4_19
    r5_19.IsDone = r4_19 < r0_19.CurStep
    if r0_19.CurStep == 3 and r4_19 == 3 then
      r5_19.IsDone = r0_19.IsFinished
    end
    r0_19.View_left_btns:AddItem(r5_19)
  end
end
function r0_0.OnBtnItemClicked(r0_20, r1_20)
  -- line: [288, 318] id: 20
  if r0_20.SelectedIndex == r1_20 then
    return 
  end
  r0_20:UpdatePage(r1_20)
  r0_20:InitRewardListView(r1_20)
  if r0_20.SelectedIndex then
    local r2_20 = r0_20.View_left_btns:GetItemAt(r0_20.SelectedIndex + -1)
    if r2_20 == nil or r2_20.UI == nil then
      return 
    end
    r2_20.UI:StopAllRegularAnimations()
    r2_20.UI:PlayAnimation(r2_20.UI.Normal)
  end
  r0_20.SelectedIndex = r1_20
  local r2_20 = r0_20.View_left_btns:GetItemAt(r1_20 + -1)
  r2_20.UI:StopAllRegularAnimations()
  r2_20.UI:PlayAnimation(r2_20.UI.Click)
  r0_20:UpdateAutoBtnText()
  r0_20:PlayAnimation(r0_20.Change)
  AudioManager(r0_20):PlayUISound(r0_20, "event:/ui/activity/theater_online_level_change", nil, nil)
  r0_20:AddTimer(0.1, function()
    -- line: [310, 317] id: 21
    for r3_21 = 1, r0_20.List_Delivery:GetNumItems(), 1 do
      local r4_21 = r0_20.List_Delivery:GetItemAt(r3_21 + -1)
      if r4_21 and r4_21.SelfWidget and r4_21.SelfWidget.Item then
        r4_21.SelfWidget.Item:PlayAnimation(r4_21.SelfWidget.Item.Normal)
      end
    end
  end)
end
function r0_0.UpdatePage(r0_22, r1_22, r2_22)
  -- line: [320, 329] id: 22
  if r2_22 then
    r0_22:UpdateTaskListView(r1_22)
  else
    r0_22:SetupTaskListView(r1_22)
  end
  r0_22:InitFilteredContents(r1_22)
  r0_22:FillListItem()
  r0_22:InitPreConsumeList()
end
function r0_0.InitRewardListView(r0_23, r1_23)
  -- line: [331, 360] id: 23
  if not IsValid(r0_23.List_Reward) then
    return 
  end
  r0_23.List_Reward:ClearListItems()
  local r3_23 = DataMgr.RewardView[DataMgr.TheaterDonateStep[r1_0][r1_23].RewardViewId]
  if r3_23 then
    local r4_23 = r3_23.Id and {}
    local r5_23 = r3_23.Quantity and {}
    local r6_23 = r3_23.Type and {}
    for r10_23 = 1, #r4_23, 1 do
      local r11_23 = NewObject(UIUtils.GetCommonItemContentClass())
      r11_23.ParentWidget = r0_23
      local r12_23 = r4_23[r10_23]
      local r13_23 = RewardUtils:GetCount(r5_23[r10_23])
      local r14_23 = r6_23[r10_23]
      local r15_23 = ItemUtils.GetItemRarity(r12_23, r14_23)
      r11_23.ItemType = r14_23
      r11_23.Id = r12_23
      r11_23.Count = r13_23
      r11_23.Rarity = r15_23
      r11_23.Icon = ItemUtils.GetItemIconPath(r12_23, r14_23)
      r11_23.IsShowDetails = true
      r11_23.OnMenuOpenChangedEvents = {
        Obj = r0_23,
        Callback = r0_23.ItemMenuAnchorChanged,
      }
      r0_23.List_Reward:AddItem(r11_23)
    end
  end
  r0_23.List_Reward:RequestFillEmptyContent()
end
function r0_0.SetupTaskListView(r0_24, r1_24)
  -- line: [362, 406] id: 24
  r0_24.Text_Right_Title:SetText(string.format(GText("TheaterOnline_Donate_Step"), r1_24))
  local r2_24 = true
  r0_24.ListView_Task:ClearListItems()
  local r3_24 = DataMgr.TheaterDonateStep[r1_0][r1_24]
  for r7_24 = 1, #r3_24.Resource, 1 do
    local r8_24 = NewObject(UIUtils.GetCommonItemContentClass())
    r8_24.ParentWidget = r0_24
    r8_24.Resource = r3_24.Resource[r7_24]
    if r1_24 < r0_24.CurStep then
      r8_24.Progress = r3_24.Num[r7_24]
    elseif r0_24.CurStep == r1_24 then
      r8_24.Progress = r0_24.DonateProgress[r3_24.Resource[r7_24]] and 0
    else
      r8_24.Progress = 0
    end
    r8_24.Index = r7_24
    r8_24.Target = r3_24.Num[r7_24]
    r0_24.ListView_Task:AddItem(r8_24)
    if r8_24.Progress < r8_24.Target then
      r2_24 = false
    end
    r0_24.NeedNum[r3_24.Resource[r7_24]] = r8_24.Target - r8_24.Progress
  end
  r0_24:AddTimer(0.3, function()
    -- line: [389, 391] id: 25
    r0_24:OnListViewTaskScrolled()
  end)
  if r0_24.CurStep ~= r1_24 then
    r0_24.Switch_Delivery:SetActiveWidgetIndex(0)
    if r1_24 < r0_24.CurStep then
      r0_24.Text_Lock:SetText(GText("UI_Theater_Donate_End"))
      r0_24.Image_Lock:SetVisibility(ESlateVisibility.Collapsed)
    elseif r0_24.CurStep < r1_24 then
      r0_24.Text_Lock:SetText(GText("UI_Theater_Donate_NotStart"))
      r0_24.Image_Lock:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
  else
    r0_24.Switch_Delivery:SetActiveWidgetIndex(1)
  end
  local r4_24 = r0_24.Overlay_Lable
  local r6_24 = nil	-- notice: implicit variable refs by block#[21]
  if r2_24 then
    r6_24 = ESlateVisibility.Visible
    if not r6_24 then
      ::label_128::
      r6_24 = ESlateVisibility.Collapsed
    end
  else
    goto label_128	-- block#20 is visited secondly
  end
  r4_24:SetVisibility(r6_24)
end
function r0_0.UpdateTaskListView(r0_26, r1_26)
  -- line: [408, 423] id: 26
  for r5_26 = 1, r0_26.ListView_Task:GetNumItems(), 1 do
    local r6_26 = r0_26.ListView_Task:GetItemAt(r5_26 + -1)
    if r0_26.CurStep == r1_26 and r6_26.Progress ~= r0_26.DonateProgress[r6_26.Resource] and r0_26.DonateProgress[r6_26.Resource] ~= nil then
      r6_26.Progress = r0_26.DonateProgress[r6_26.Resource] and 0
      r6_26.UI:InitUI()
      if r6_26.Target <= r6_26.Progress then
        r6_26.UI:PlayAnimation(r6_26.UI.Finish)
      else
        r6_26.UI:PlayAnimation(r6_26.UI.Flash)
      end
    end
  end
end
function r0_0.OnPreviewKeyDown(r0_27, r1_27, r2_27)
  -- line: [425, 461] id: 27
  if r0_27.IsClosingUi then
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
  local r3_27 = false
  local r5_27 = UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_27))
  if r5_27 == "Escape" then
    r0_27:CloseSelf()
    r3_27 = true
  elseif r5_27 == "Gamepad_FaceButton_Bottom" and (r0_27.View_left_btns:HasFocusedDescendants() or r0_27.View_left_btns:HasAnyUserFocus()) then
    r0_27.List_Delivery:NavigateToIndex(0)
    r0_27.List_Delivery:SetFocus()
    r3_27 = true
  elseif r5_27 == "Gamepad_FaceButton_Right" and (r0_27.Filter.Btn_Filter_List:HasFocusedDescendants() or r0_27.Filter.Btn_Filter_List:HasAnyUserFocus()) then
    DebugPrint("JLy OnPreviewKeyDown: Gamepad_FaceButton_Right")
    if #r0_27.FilteredContents > 0 then
      r0_27.List_Item:SetFocus()
    else
      r0_27.List_Delivery:NavigateToIndex(0)
      r0_27:OnExpandList(false, false)
    end
    r0_27.bIsFocusInFilter = false
    r3_27 = true
  end
  if r3_27 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end
function r0_0.OnKeyDown(r0_28, r1_28, r2_28)
  -- line: [463, 479] id: 28
  if r0_28.IsClosingUi then
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
  local r3_28 = false
  local r4_28 = UE4.UKismetInputLibrary.GetKey(r2_28)
  local r5_28 = UE4.UFormulaFunctionLibrary.Key_GetFName(r4_28)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r4_28) then
    r3_28 = r0_28:Handle_OnGamePadDown(r5_28)
  end
  if r3_28 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end
function r0_0.CloseSelf(r0_29)
  -- line: [481, 492] id: 29
  if r0_29.bListExpand then
    r0_29:OnExpandList(false, false)
  else
    r0_29.IsClosingUi = true
    r0_29:PlayAnimation(r0_29.Out)
    AudioManager(r0_29):SetEventSoundParam(r0_29, "Theater", {
      ToEnd = 1,
    })
    AudioManager(r0_29):StopSound(r0_29, "TheaterLoop")
    EventManager:FireEvent(EventID.OnReturnToActivityEntry)
  end
end
function r0_0.OnAnimationFinished(r0_30, r1_30)
  -- line: [494, 498] id: 30
  if r1_30 == r0_30.Out then
    r0_30.Super.Close(r0_30)
  end
end
function r0_0.OnExpandList(r0_31, r1_31, r2_31)
  -- line: [500, 516] id: 31
  if r0_31.bListExpand == r1_31 then
    return 
  end
  r0_31.bListExpand = r1_31
  if r1_31 then
    r0_31:PlayAnimation(r0_31.Bag_In)
    r0_31.View_left_btns:SetVisibility(ESlateVisibility.Collapsed)
    r0_31.List_Item:NavigateToIndex(0)
    r0_31:SetGamepadImgVisibility(r0_31.CurInputDevice == ECommonInputType.Gamepad, true)
    r0_31:ShowItemDetails(false, nil)
  else
    r0_31:PlayAnimation(r0_31.Bag_Out)
    r0_31.View_left_btns:SetVisibility(ESlateVisibility.Visible)
    r0_31:SetGamepadImgVisibility(r0_31.CurInputDevice == ECommonInputType.Gamepad, false)
  end
end
function r0_0.InitFilteredContents(r0_32, r1_32)
  -- line: [518, 581] id: 32
  r0_32.ContentMap = {}
  r0_32.FilteredContents = {}
  local r2_32 = DataMgr.TheaterDonateStep[r1_0][r1_32]
  local r3_32 = GWorld:GetAvatar()
  if not r3_32 or not r3_32.Resources then
    return 
  end
  local r4_32 = {}
  for r8_32 = 1, #r2_32.Resource, 1 do
    table.insert(r4_32, r2_32.Resource[r8_32])
  end
  local r5_32 = 1
  while true do
    local r7_32 = DataMgr.TheaterConstant["UniqueResource" .. r5_32]
    if r7_32 then
      local r8_32 = r7_32.ConstantValue
      if r8_32 then
        table.insert(r4_32, r7_32.ConstantValue)
        r5_32 = r5_32 + 1
      else
        break
      end
    else
      break
    end
  end
  for r9_32 = 1, #r4_32, 1 do
    local r10_32 = r3_32.Resources[r4_32[r9_32]]
    if r10_32 then
      local r11_32 = NewObject(UIUtils.GetCommonItemContentClass())
      r11_32.ParentWidget = r0_32
      r11_32.Id = r10_32.ResourceId
      r11_32.ItemType = "Resource"
      r11_32.Count = r10_32.Count
      r11_32.Icon = r10_32.Icon
      r11_32.Rarity = r10_32.Rarity
      r11_32.OnMouseButtonDownEvent = {
        Obj = r0_32,
        Callback = function()
          -- line: [557, 564] id: 33
          if not r0_32:PreviewLevelMax(r11_32.Id) then
            r0_32:OnPlusStart(r11_32)
          else
            UIManager(r0_32):ShowUITip(UIConst.Tip_CommonToast, GText("Max_Level_Achieved"), 1.5)
          end
          r0_32:ShowItemDetails(true, r11_32)
        end,
        Params = {
          bIgnoreRightMouseDown = true,
        },
      }
      local function r12_32()
        -- line: [566, 570] id: 34
        r0_32:OnPlusEnd()
        r0_32:OnRightListSelectedChanged(r0_32:FindSelectedContent(r10_32.ResourceId))
      end
      r11_32.OnMouseButtonUpEvents = {
        Obj = r0_32,
        Callback = function()
          -- line: [571, 573] id: 35
          r12_32()
        end,
      }
      r11_32.OnMouseLeaveEvent = {
        Obj = r0_32,
        Callback = function()
          -- line: [574, 576] id: 36
          r12_32()
        end,
      }
      table.insert(r0_32.FilteredContents, r11_32)
      r0_32.ContentMap[r10_32.ResourceId] = r11_32
      -- close: r11_32
    end
    -- close: r10_32
  end
end
function r0_0.GetActivityProgress(r0_37, r1_37)
  -- line: [583, 605] id: 37
  GWorld:GetAvatar():TheaterDonationGet(function(r0_38, r1_38)
    -- line: [585, 604] id: 38
    if r1_38 then
      r0_37.CurStep = r1_38.CurStep
      r0_37.IsFinished = r1_38.IsFinished
      r0_37.DonateProgress = r1_38.DonateProgress
      r0_37:InitUI()
      if not r1_37 then
        r0_37:InitViewLeftBtns()
        r0_37.SelectedIndex = r0_37.CurStep
        r0_37:UpdatePage(r0_37.SelectedIndex)
        r0_37:InitRewardListView(r0_37.SelectedIndex)
        r0_37:UpdateAutoBtnText()
        r0_37:PlayBGAnimation(r0_37.CurStep)
        r0_37.View_left_btns:SetSelectedIndex(r0_37.SelectedIndex + -1)
      else
        r0_37:RefreshViewLeftBtns()
        r0_37:UpdatePage(r0_37.SelectedIndex)
      end
    end
  end)
end
function r0_0.RefreshViewLeftBtns(r0_39)
  -- line: [608, 626] id: 39
  for r4_39 = 1, 3, 1 do
    local r5_39 = r0_39.View_left_btns:GetItemAt(r4_39 + -1)
    if r0_39.CurStep < r4_39 then
      r5_39.UI:PlayAnimation(r5_39.UI.Lock)
    else
      r5_39.UI:PlayAnimation(r5_39.UI.Lock_Normal)
    end
    local r6_39 = r4_39 < r0_39.CurStep
    if r0_39.CurStep == 3 and r4_39 == 3 then
      r6_39 = r0_39.IsFinished
    end
    if r6_39 then
      r5_39.UI.panel_check:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    else
      r5_39.UI.panel_check:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
end
function r0_0.PlayBGAnimation(r0_40, r1_40)
  -- line: [628, 637] id: 40
  if r1_40 == #DataMgr.TheaterDonateStep[r1_0] and r0_40.IsFinished then
    r1_40 = r1_40 + 1
  end
  local r2_40 = r0_40.WBP_Activity_Theater_BG.Spine_Char
  local r4_40 = "Loop" .. r1_40
  r2_40:SetAnimation(0, "In" .. r1_40, false)
  r2_40:AddAnimation(0, r4_40, true, 0)
end
function r0_0.UpdateAddProgress(r0_41)
  -- line: [639, 651] id: 41
  local r1_41 = {}
  for r6_41, r7_41 in pairs(r0_41.PreConsumeList) do
    if r7_41.Count and r7_41.Count > 0 then
      r1_41[r7_41.UnitId] = r7_41.Count
    end
  end
  -- close: r2_41
  for r5_41 = 1, r0_41.ListView_Task:GetNumItems(), 1 do
    r0_41.ListView_Task:GetItemAt(r5_41 + -1).UI:SetAddProgress(r1_41[r6_41.Resource] and 0)
  end
end
function r0_0.ReceiveEnterState(r0_42, r1_42)
  -- line: [653, 660] id: 42
  r0_0.Super.ReceiveEnterState(r0_42, r1_42)
  if r1_42 == 1 and r0_42.LastFocusItem and r0_42.IsSpecialFocus then
    r0_42.LastFocusItem:SetFocus()
  end
end
AssembleComponents(r0_0)
return r0_0
