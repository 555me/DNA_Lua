-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Common\ItemOptional\WBP_Bag_OptionalProp_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")
function r0_0.InitContent(r0_1, r1_1, r2_1, r3_1)
  -- line: [14, 49] id: 1
  r0_1.OptionalItemsList = r1_1.OptionalItemsList
  r0_1.ChooseCallbackFunction = r1_1.ChooseCallbackFunction
  r0_1.FunctionCallbackObj = r1_1.FunctionCallbackObj
  r0_1.OriginalTips = r1_1.Tips
  r0_1.CurrentChooseWidget = nil
  r0_1.CurrentChooseInfo = {}
  r0_1.AllItemsWidget = {}
  r0_1.CurrentCount = 0
  r0_1.ResourceName = r1_1.Title
  r0_1.GamePadMode = "Default"
  r0_1.OptCount = r1_1.OptionalItemsList[1].OptCount
  r0_1.ResourceId = r1_1.ResourceId
  r0_1.Id2ConsumeCount = {}
  r0_1.GamePadKeyLS = r0_1:ShowGamepadShortcutBtn({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "LS",
      }
    },
    Desc = GText("UI_Controller_CheckDetails"),
  })
  r0_1:InitAllOptionalItemsInfo()
  r0_1:InitListenEvent()
  r0_1:InitUIInfo()
  r0_1:AddTimer(0.01, function()
    -- line: [46, 48] id: 2
    r0_1:RefreshDialogTip()
  end)
end
function r0_0.InitUIInfo(r0_3)
  -- line: [51, 54] id: 3
  r0_3.List_Prop:SetScrollbarVisibility(UE4.ESlateVisibility.Hidden)
  r0_3.List_Prop:SetControlScrollbarInside(true)
end
function r0_0.InitAllOptionalItemsInfo(r0_4)
  -- line: [56, 103] id: 4
  r0_4.List_Prop:ClearListItems()
  for r5_4, r6_4 in ipairs(r0_4.OptionalItemsList) do
    r6_4.Index = r5_4
    local r7_4 = NewObject(UIUtils.GetCommonItemContentClass())
    r7_4.Id = r6_4.StuffId
    r7_4.Rarity = r6_4.Rarity
    r7_4.Type = CommonConst.DataType.Resource
    r7_4.Name = r6_4.StuffName
    r7_4.Count = r6_4.Count
    r7_4.IsShowDetails = true
    r7_4.Icon = r6_4.StuffIcon
    r7_4.Count = r6_4.Count
    r7_4.ItemType = r6_4.StuffType
    r7_4.ChooseCallback = r0_4.ChangeChooseClickCallback
    r7_4.ParentWidget = r0_4
    r7_4.ChooseIndex = r6_4.Index
    r7_4.OptionalId = r6_4.OptionalId
    r7_4.ResourceId = r6_4.ResourceId
    r7_4.OptCount = r6_4.OptCount
    r7_4.StuffCount = r6_4.StuffCount
    r0_4.Id2ConsumeCount[r6_4.StuffId] = 0
    r0_4.List_Prop:AddItem(r7_4)
  end
  -- close: r1_4
  r0_4:RefreshOpInfoByInputDevice(r0_4.GameInputModeSubsystem:GetCurrentInputType())
  local r2_4 = #r0_4.AllItemsWidget
  for r7_4, r8_4 in ipairs(r0_4.AllItemsWidget) do
    if r8_4 then
      r8_4:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
      r8_4:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
      if r7_4 ~= 1 and r7_4 == r2_4 then
      end
    end
  end
  -- close: r3_4
end
function r0_0.InitListenEvent(r0_5)
  -- line: [105, 109] id: 5
  if IsValid(r0_5.GameInputModeSubsystem) then
    r0_5.GameInputModeSubsystem.OnInputMethodChanged:Add(r0_5, r0_5.RefreshOpInfoByInputDevice)
  end
end
function r0_0.Destruct(r0_6)
  -- line: [111, 115] id: 6
  if IsValid(r0_6.GameInputModeSubsystem) then
    r0_6.GameInputModeSubsystem.OnInputMethodChanged:Remove(r0_6, r0_6.RefreshOpInfoByInputDevice)
  end
end
function r0_0.ChangeChooseClickCallback(r0_7, r1_7, r2_7)
  -- line: [117, 139] id: 7
  if r0_7.CurrentChooseWidget then
  end
  r0_7.CurrentChooseInfo[r2_7.ChooseId] = r2_7
  if r1_7 then
    r0_7.CurrentChooseWidget = r2_7.ChooseWidget
    if type(r0_7.ChooseCallbackFunction) == "function" then
      r0_7.ChooseCallbackFunction(r0_7.FunctionCallbackObj, r0_7.CurrentChooseInfo)
    end
    r0_7.Owner:ForbidRightBtn(false)
  else
    r0_7.CurrentChooseWidget = nil
    r0_7.Owner:ForbidRightBtn(true)
  end
end
function r0_0.ScrollToTargetItem(r0_8, r1_8)
  -- line: [141, 143] id: 8
  r0_8.ScrollBox_Avatar:ScrollWidgetIntoView(r1_8)
end
function r0_0.BP_GetDesiredFocusTarget(r0_9)
  -- line: [145, 147] id: 9
  return r0_9.CurrentChooseWidget and r0_9.ScrollBox_Avatar
end
function r0_0.OnBtnYes(r0_10)
  -- line: [149, 157] id: 10
  if r0_10.Owner then
    if r0_10.CurrentCount == 0 then
      r0_10.Owner:OnForbiddenRightBtnClicked()
    else
      r0_10.Owner:OnRightBtnClicked()
    end
  end
end
function r0_0.HideSelf(r0_11, r1_11, r2_11)
  -- line: [159, 174] id: 11
  if r0_11.Owner then
    if r1_11 then
      r0_11.Owner:SetVisibility(UIConst.VisibilityOp.Collapsed)
    else
      r0_11.Owner:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
    if r2_11 then
      r0_11.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
      r0_11:AddTimer(0.6, function()
        -- line: [168, 171] id: 12
        r0_11.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
        r0_11:SetFocus()
      end)
    end
  end
end
function r0_0.CloseDialog(r0_13)
  -- line: [176, 180] id: 13
  if r0_13.Owner then
    r0_13.Owner:Close()
  end
end
function r0_0.RefreshDialogTip(r0_14)
  -- line: [182, 198] id: 14
  local r1_14 = {
    [1] = {},
  }
  r1_14[1].FundId = r0_14.ResourceId
  r1_14[1].FundNeed = r0_14.CurrentCount
  r1_14[1].CostText = GText("UI_Armory_Trace_Cost")
  r1_14[1].bShowNumerator = true
  r0_14:BroadcastDialogEvent("UpdateFunds", {
    Funds = r1_14,
  })
  if r0_14.CurrentCount <= 0 then
    r0_14.Owner:ForbidRightBtn(true)
  else
    r0_14.Owner:ForbidRightBtn(false)
  end
  r0_14.Owner:HideDialogTip(1)
  r0_14.Owner:ShowDialogTip(2)
end
function r0_0.GetCurrentHoverItem(r0_15)
  -- line: [200, 217] id: 15
  local r1_15 = nil
  local r2_15 = r0_15.List_Prop:GetDisplayedEntryWidgets()
  local r3_15 = 1
  if r2_15 then
    for r7_15 = 1, r2_15:Length(), 1 do
      local r8_15 = r2_15:GetRef(r7_15)
      if r8_15 and (r8_15:IsHovered() or r8_15.HasAnyFocus and r8_15:HasAnyFocus()) then
        r1_15 = r8_15
        r3_15 = r7_15 + -1
        break
      end
    end
  end
  return r1_15
end
function r0_0.RefreshOpInfoByInputDevice(r0_16, r1_16, r2_16)
  -- line: [219, 227] id: 16
  if r1_16 == ECommonInputType.MouseAndKeyboard and r0_16.LastFocusWidget and r0_16.LastFocusWidget.Com_NumInput then
    r0_16.LastFocusWidget.Com_NumInput:UpdateUIStyleInPlatform(true)
  elseif r1_16 == ECommonInputType.Gamepad then
    r0_16.List_Prop:SetFocus()
  end
end
function r0_0.OnPreviewKeyDown(r0_17, r1_17, r2_17)
  -- line: [229, 241] id: 17
  local r4_17 = UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_17))
  local r5_17 = false
  if (r4_17 == UIConst.GamePadKey.DPadRight or r4_17 == UIConst.GamePadKey.DPadLeft) and r0_17.GamePadMode ~= "CheckDetails" then
    r0_17:GetCurrentHoverItem():OnKeyDownEvent(r4_17)
    r5_17 = true
  elseif r4_17 == UIConst.GamePadKey.FaceButtonBottom then
    r5_17 = true
  end
  return r5_17
end
function r0_0.OnContentKeyDown(r0_18, r1_18, r2_18)
  -- line: [243, 275] id: 18
  local r3_18 = UE4.UKismetInputLibrary.GetKey(r2_18)
  local r4_18 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_18)
  local r5_18 = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_18) then
    if r4_18 == UIConst.GamePadKey.FaceButtonLeft and r0_18.CurrentChooseInfo ~= nil then
      r0_18:OnBtnYes()
      r5_18 = true
    elseif r4_18 == UIConst.GamePadKey.LeftThumb then
      if r0_18.LastFocusWidget then
        r0_18.LastFocusWidget.Item_Gift:OpenItemMenu()
        r0_18:ChangeGamePadMode("CheckDetails")
      end
      r5_18 = true
    elseif r0_18.GamePadMode ~= "CheckItems" then
      local r6_18 = r0_18:GetCurrentHoverItem()
      if r6_18 then
        r5_18 = r6_18:OnKeyDownEvent(r4_18)
      end
    end
  end
  return r5_18
  -- warn: not visited block [3]
  -- block#3:
  -- r0_18:ChangeGamePadMode("Default")
  -- r5_18 = true
  -- goto label_71
end
function r0_0.OnMenuOpenChangedEvents(r0_19, r1_19)
  -- line: [277, 288] id: 19
  if r1_19 then
    r0_19:ChangeGamePadMode("CheckDetails")
  else
    r0_19:ChangeGamePadMode("Default")
    r0_19:AddTimer(0.01, function()
      -- line: [282, 286] id: 20
      if r0_19.LastFocusWidget then
        r0_19.LastFocusWidget:SetFocus()
      end
    end)
  end
end
function r0_0.ChangeGamePadMode(r0_21, r1_21)
  -- line: [290, 303] id: 21
  if r1_21 == "CheckDetails" then
    r0_21:HideGamepadShortcut(r0_21.GamePadKeyLS)
    r0_21.Owner:SetGamepadBtnKeyVisibility(false)
    r0_21.GamePadMode = "CheckDetails"
  elseif r1_21 == "Default" then
    r0_21:ShowGamepadShortcut(r0_21.GamePadKeyLS)
    if r0_21.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
      r0_21.Owner:SetGamepadBtnKeyVisibility(true)
    end
    r0_21.GamePadMode = "Default"
  end
end
return r0_0
