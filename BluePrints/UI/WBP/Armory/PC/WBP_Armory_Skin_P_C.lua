-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Armory\PC\WBP_Armory_Skin_P_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("Blueprints.UI.FocusStateMachine")
local r1_0 = {
  SkinList = "SkinList",
  AccessoryList = "AccessoryList",
  AccessoryTab = "AccessoryTab",
  HiddenSelf = "HiddenSelf",
  Resource = "Resource",
}
local r2_0 = Class("BluePrints.UI.WBP.Armory.WBP_Armory_Skin_Base_C")
r2_0._components = {
  "BluePrints.UI.KeyInputComponent"
}
function r2_0.Construct(r0_1)
  -- line: [21, 86] id: 1
  rawset(r0_1, "TabStyleName", "Text")
  rawset(r0_1, "EscapeKey", EKeys.Escape.KeyName)
  rawset(r0_1, "ZoomKey", "Mouse_Button")
  r0_1.ESCKeyInfoList = {
    KeyInfoList = {
      {
        Type = "Text",
        Text = r0_1.EscapeKey,
        ClickCallback = r0_1.OnBackKeyDown,
        Owner = r0_1,
      }
    },
    GamePadInfoList = {
      {
        Type = "Img",
        ImgShortPath = "B",
        ClickCallback = r0_1.OnBackKeyDown,
        Owner = r0_1,
      }
    },
    Desc = GText("UI_BACK"),
  }
  r0_1.HideUI_KeyInfoList = {
    KeyInfoList = {
      {
        Type = "Text",
        Text = CommonUtils:GetKeyText("U"),
        ClickCallback = r0_1.OnHideUIKeyDown,
        Owner = r0_1,
      }
    },
    GamePadInfoList = {
      {
        Type = "Img",
        ImgShortPath = "X",
      }
    },
    Desc = GText("UI_Dye_HideUI"),
  }
  local r1_1 = {
    KeyInfoList = {
      {
        Type = "Text",
        Text = r0_1.ZoomKey,
        Owner = r0_1,
      }
    },
  }
  local r2_1 = {
    {
      Type = "Or",
    }
  }
  r1_1.GamePadInfoList = r2_1
  r1_1.Desc = GText("UI_Dye_Zoom")
  r1_1.bLongPress = false
  r0_1.ZoomKeyInfoList = r1_1
  r0_1.RightThumbstickAnalogBottomKeyInfoList = {
    GamePadInfoList = {
      {
        Type = "Img",
        ImgShortPath = "RH",
      }
    },
    Desc = GText("UI_CTL_RotatePreview"),
  }
  r0_1.Btn_Function:SetDefaultGamePadImg("A")
  r0_1.Key_Check:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "View",
      }
    },
    Desc = GText("UI_Controller_Check"),
  })
  r0_1.Key_Dye:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "Y",
      }
    },
  })
  r2_0.Super.Construct(r0_1)
  function r0_1.TabConfig.GetReplyOnBack()
    -- line: [76, 79] id: 2
    r0_1.FSM:Pop()
    return r0_1:GetReplyOnBack()
  end
  r0_1.TabConfig.OnResourceBarAddedToFocusPath = r0_1.OnResourceBarAddedToFocusPath
  r0_1.TabConfig.OnResourceBarRemovedFromFocusPath = r0_1.OnResourceBarRemovedFromFocusPath
  rawset(r0_1, "FSM", r0_0:New(r0_1, {
    StateNames = r1_0,
    OnStateChanged = r0_1.OnFocusStateChanged,
    CheckFunction = r0_1.IsFocusStateValid,
  }))
  r0_1.WBP_Com_Cost:SwitchToPC()
end
function r2_0.InitUIInfo(r0_3, ...)
  -- line: [88, 90] id: 3
  r2_0.Super.InitUIInfo(r0_3, ...)
end
function r2_0.OnInited(r0_4)
  -- line: [92, 96] id: 4
  r2_0.Super.OnInited(r0_4)
  rawset(r0_4, "Inited", true)
  r0_4:RefreshOpInfoByInputDevice(UIUtils.UtilsGetCurrentInputType())
end
function r2_0.UpdateKeySetting(r0_5)
  -- line: [98, 140] id: 5
  r0_5:ClearAllKeyEvents()
  r0_5.BottomKeyInfo = {}
  r0_5.RepeatKeyDownEvents = {}
  if r0_5.IsGamepadInput then
    if r0_5.FSM:Peak().Name == r1_0.Resource then
      r0_5:AddKeyDownEvent(Const.GamepadFaceButtonRight, r0_5.OnBackKeyDown)
      table.insert(r0_5.BottomKeyInfo, r0_5.ESCKeyInfoList)
    else
      r0_5.RepeatKeyDownEvents[Const.GamepadLeftTrigger] = r0_5.OnCameraScrollBackwardKeyDown
      r0_5.RepeatKeyDownEvents[Const.GamepadRightTrigger] = r0_5.OnCameraScrollForwardKeyDown
      r0_5:AddKeyDownEvent(Const.GamepadRightThumbstick, r0_5.OnFocusToResourceKeyDown)
      r0_5:AddKeyDownEvent(Const.GamepadSpecialLeft, r0_5.OnOpenVideoKeyDown)
      r0_5:AddKeyDownEvent(Const.GamepadFaceButtonRight, r0_5.OnBackKeyDown)
      r0_5:AddKeyDownEvent(UIConst.GamePadKey.FaceButtonLeft, r0_5.OnHideUIKeyDown)
      r0_5:AddKeyDownEvent(Const.GamepadLeftShoulder, r0_5.OnTabLeftKeyDown)
      r0_5:AddKeyDownEvent(Const.GamepadRightShoulder, r0_5.OnTabRightKeyDown)
      if not r0_5.bSelfHidden and r0_5.CurrentTopTabIdx == r0_5.SkinTabIdx and not r0_5.IsPreviewMode and not r0_5.IsCharacterTrialMode then
        r0_5:AddKeyDownEvent(UIConst.GamePadKey.FaceButtonTop, r0_5.OnGamePadGotoDyeKeyDown)
      end
      table.insert(r0_5.BottomKeyInfo, r0_5.HideUI_KeyInfoList)
      table.insert(r0_5.BottomKeyInfo, r0_5.ZoomKeyInfoList)
      table.insert(r0_5.BottomKeyInfo, r0_5.RightThumbstickAnalogBottomKeyInfoList)
      table.insert(r0_5.BottomKeyInfo, r0_5.ESCKeyInfoList)
    end
  else
    r0_5:AddKeyDownEvent(r0_5.EscapeKey, r0_5.OnBackKeyDown)
    r0_5:AddKeyDownEvent(EKeys.U.KeyName, r0_5.OnHideUIKeyDown)
    r0_5:AddKeyDownEvent(EKeys.Q.KeyName, r0_5.OnTabLeftKeyDown)
    r0_5:AddKeyDownEvent(EKeys.E.KeyName, r0_5.OnTabRightKeyDown)
    table.insert(r0_5.BottomKeyInfo, r0_5.HideUI_KeyInfoList)
    table.insert(r0_5.BottomKeyInfo, r0_5.ZoomKeyInfoList)
    table.insert(r0_5.BottomKeyInfo, r0_5.RightThumbstickAnalogBottomKeyInfoList)
    table.insert(r0_5.BottomKeyInfo, r0_5.ESCKeyInfoList)
  end
  r0_5.Tab_Skin:UpdateBottomKeyInfo(r0_5.BottomKeyInfo)
end
function r2_0.OnFocusToResourceKeyDown(r0_6)
  -- line: [142, 145] id: 6
  r0_6.Tab_Skin:Handle_KeyEventOnGamePad(Const.GamepadRightThumbstick)
  return UIUtils.Handled, true
end
function r2_0.OnOpenVideoKeyDown(r0_7)
  -- line: [147, 149] id: 7
  r0_7:OpenSkinVideo()
end
function r2_0.RefreshOpInfoByInputDevice(r0_8, r1_8, r2_8)
  -- line: [151, 153] id: 8
  r0_8:OnUpdateUIStyleByInputTypeChange(r1_8, r2_8)
end
function r2_0.OnUpdateUIStyleByInputTypeChange(r0_9, r1_9, r2_9)
  -- line: [155, 180] id: 9
  r2_0.Super.OnUpdateUIStyleByInputTypeChange(r0_9, r1_9, r2_9)
  if not rawget(r0_9, "Inited") then
    return 
  end
  r0_9.IsGamepadInput = r1_9 == ECommonInputType.Gamepad
  if r0_9.IsGamepadInput then
    r0_9.GamePad_Check:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    r0_9.Panel_Key_Dye:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    if not r0_9.IsInFocusPath then
      return 
    end
    if not r0_9:IsFocusStateValid(r0_9.FSM:Peak()) then
      r0_9.FSM:Clear()
    end
    local r4_9 = r0_9:GetDesiredFocusTarget()
    if r4_9 and not UIUtils.HasAnyFocus(r4_9) then
      r4_9:SetFocus()
    end
  else
    r0_9.Panel_Key_Dye:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_9.GamePad_Check:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  r0_9:UpdateKeySetting()
end
function r2_0.OnFocusStateChanged(r0_10)
  -- line: [182, 184] id: 10
  r0_10:UpdateKeySetting()
end
function r2_0.IsFocusStateValid(r0_11, r1_11)
  -- line: [186, 198] id: 11
  local r2_11 = r1_11.Name
  if r2_11 == r1_0.SkinList then
    return r0_11.List_Skin:GetIndexForItem(r1_11.Content) >= 0
  elseif r2_11 == r1_0.AccessoryTab then
    local r3_11 = r0_11.AccessoryTabsArray and r0_11.AccessoryTabsArray[r0_11.CurrentAccessoryTabIdx]
    return r3_11 and r3_11 == r1_11.Content
  elseif r2_11 == r1_0.AccessoryList then
    return r0_11.List_Accessory:GetIndexForItem(r1_11.Content) >= 0
  elseif r2_11 == r1_0.HiddenSelf then
    return r0_11.bSelfHidden
  end
end
function r2_0.GetDesiredFocusTarget(r0_12)
  -- line: [200, 214] id: 12
  local r2_12 = r0_12.FSM:Peak().Name
  if r0_12.bSelfHidden then
    return r0_12
  elseif r0_12.CurrentTopTabIdx == r0_12.SkinTabIdx then
    return r0_12:NavigateToSkinList()
  elseif r2_12 == r1_0.AccessoryTab then
    return r0_12:NavigateToAccessoryTab()
  else
    return r0_12:NavigateToAccessoryList()
  end
end
function r2_0.OnSkinContentCreated(r0_13, r1_13)
  -- line: [216, 219] id: 13
  r1_13.OnAddedToFocusPath = r0_13.OnSkinItemAddedToFocusPath
  r1_13.OnRemovedFromFocusPath = r0_13.OnSkinItemRemovedFromFocusPath
end
function r2_0.OnSkinItemAddedToFocusPath(r0_14, r1_14)
  -- line: [221, 227] id: 14
  r0_14.FSM:Clear()
  r0_14.FSM:Push({
    Name = r1_0.SkinList,
    Content = r1_14,
  })
  if r0_14.IsGamepadInput then
    r0_14:SelectSkinByContent(r1_14)
  end
end
function r2_0.OnSkinItemRemovedFromFocusPath(r0_15, r1_15)
  -- line: [229, 230] id: 15
end
function r2_0.OnResourceBarAddedToFocusPath(r0_16, r1_16)
  -- line: [232, 234] id: 16
  r0_16.FSM:Push({
    Name = r1_0.Resource,
    Widget = r1_16,
  })
end
function r2_0.OnResourceBarRemovedFromFocusPath(r0_17, r1_17)
  -- line: [236, 237] id: 17
end
function r2_0.NavigateToSkinList(r0_18, r1_18)
  -- line: [239, 251] id: 18
  local r2_18 = r1_18 and r0_18.SkinMap[r0_18.SelectedSkinId]
  if not r2_18 or r0_18.List_Skin:GetIndexForItem(r2_18) < 0 then
    r2_18 = r0_18.List_Skin:GetItemAt(0)
  end
  r0_18.List_Skin:BP_CancelScrollIntoView()
  r0_18.List_Skin:BP_SetSelectedItem(r2_18)
  r0_18.List_Skin:BP_NavigateToItem(r2_18)
  if r2_18 and r2_18.Widget then
    return r2_18.Widget
  end
  return r0_18.List_Skin
end
function r2_0.NavigateToAccessoryTab(r0_19)
  -- line: [253, 256] id: 19
  local r1_19 = r0_19.AccessoryTabsArray and r0_19.AccessoryTabsArray[r0_19.CurrentAccessoryTabIdx]
  return r1_19 and r1_19.UI
end
function r2_0.NavigateToAccessoryList(r0_20)
  -- line: [258, 270] id: 20
  local r1_20 = r0_20.ComparedContent and r0_20.CurrentContent
  if not r1_20 or r0_20.List_Accessory:GetIndexForItem(r1_20) < 0 then
    r1_20 = r0_20.List_Accessory:GetItemAt(0)
  end
  r0_20.List_Accessory:BP_CancelScrollIntoView()
  r0_20.List_Accessory:BP_SetSelectedItem(r1_20)
  r0_20.List_Accessory:BP_NavigateToItem(r1_20)
  if r1_20 and r1_20.SelfWidget then
    return r1_20.SelfWidget
  end
  return r0_20.List_Accessory
end
function r2_0.OnAccessoryContentCreated(r0_21, r1_21)
  -- line: [272, 279] id: 21
  r1_21.OnAddedToFocusPathEvent = {
    Obj = r0_21,
    Callback = function()
      -- line: [273, 276] id: 22
      r0_21.FSM:Clear()
      r0_21.FSM:Push({
        Name = r1_0.AccessoryList,
        Content = r1_21,
      })
    end,
  }
  r1_21.OnRemovedFromFocusPathEvent = {
    Obj = r0_21,
    Callback = function()
      -- line: [277, 278] id: 23
    end,
  }
end
function r2_0.OnAccessoryTabContentCreated(r0_24, r1_24, r2_24)
  -- line: [281, 288] id: 24
  function r1_24.OnAddedToFocusPath()
    -- line: [282, 285] id: 25
    r0_24.FSM:Clear()
    r0_24.FSM:Push({
      Name = r1_0.AccessoryTab,
      Content = r1_24,
      Widget = r2_24,
    })
  end
  function r1_24.OnRemovedFromFocusPath()
    -- line: [286, 287] id: 26
  end
end
function r2_0.OnAddedToFocusPath(r0_27)
  -- line: [290, 292] id: 27
  r0_27.IsInFocusPath = true
end
function r2_0.OnRemovedFromFocusPath(r0_28)
  -- line: [294, 296] id: 28
  r0_28.IsInFocusPath = false
end
function r2_0.InitAccessoryNavigationRules(r0_29)
  -- line: [299, 314] id: 29
  r0_29.Tab_Accessory:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  r0_29.Tab_Accessory:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  r0_29.Tab_Accessory:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  r0_29.List_Accessory:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  r0_29.List_Accessory:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  r0_29.List_Accessory:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  if r0_29.Tab_Accessory:IsVisible() then
    r0_29.Tab_Accessory:SetNavigationRuleCustom(EUINavigation.Right, {
      r0_29,
      function()
        -- line: [307, 309] id: 30
        return r0_29:NavigateToAccessoryList()
      end
    })
    r0_29.List_Accessory:SetNavigationRuleCustom(EUINavigation.Left, {
      r0_29,
      function()
        -- line: [310, 312] id: 31
        return r0_29:NavigateToAccessoryTab()
      end
    })
  end
end
function r2_0.OnAccessoryListSelectionChanged(r0_32, r1_32, r2_32)
  -- line: [316, 321] id: 32
  if not r2_32 or not r0_32.IsGamepadInput then
    return 
  end
  r0_32:TrySelectAccessoryItem(r1_32)
end
function r2_0.OnAccessoryItemClicked(r0_33, r1_33)
  -- line: [323, 329] id: 33
  if r0_33.IsGamepadInput then
    r0_33:OnGamePadConfirKeyDown()
  else
    r2_0.Super.OnAccessoryItemClicked(r0_33, r1_33)
  end
end
function r2_0.OnSkinListSelectionChanged(r0_34, r1_34, r2_34)
  -- line: [331, 335] id: 34
  if r0_34.IsGamepadInput then
    r2_0.Super.OnSkinItemClicked(r0_34, r1_34)
  end
end
function r2_0.OnSkinItemClicked(r0_35, r1_35)
  -- line: [337, 343] id: 35
  if r0_35.IsGamepadInput then
    r0_35:OnGamePadConfirKeyDown()
  else
    r2_0.Super.OnSkinItemClicked(r0_35, r1_35)
  end
end
function r2_0.OnGamePadConfirKeyDown(r0_36)
  -- line: [346, 356] id: 36
  if r0_36.IsPreviewMode or r0_36.IsCharacterTrialMode then
    return UIUtils.Handled, true
  end
  if r0_36.Btn_Function:IsVisible() and not r0_36.Btn_Function:IsBtnForbidden() and r0_36.WidgetSwitcher_BtnState:GetActiveWidgetIndex() == 0 and r0_36.ConfirmBtnFunc then
    r0_36.ConfirmBtnFunc(r0_36)
  end
  return UIUtils.Handled, true
end
function r2_0.OnGamePadGotoDyeKeyDown(r0_37)
  -- line: [359, 371] id: 37
  if r0_37.IsPreviewMode or r0_37.IsCharacterTrialMode or r0_37.IsTargetUnowned then
    return UIUtils.Handled, true
  end
  local r1_37 = r0_37.SkinMap[r0_37.SelectedSkinId]
  if not r1_37 then
    return UIUtils.Handled, true
  end
  if r1_37.bDyeable and not r1_37.LockType then
    r0_37:OpenDye()
  end
  return UIUtils.Handled, true
end
function r2_0.OnCameraScrollBackwardKeyDown(r0_38)
  -- line: [373, 375] id: 38
  r0_38:ScrollCamera(1)
end
function r2_0.OnCameraScrollForwardKeyDown(r0_39)
  -- line: [377, 379] id: 39
  r0_39:ScrollCamera(-1)
end
function r2_0.OnPreviewKeyDown(r0_40, r1_40, r2_40)
  -- line: [381, 393] id: 40
  if CommonUtils:IfExistSystemGuideUI(r0_40) then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  r2_0.Super.OnPreviewKeyDown(r0_40, r1_40, r2_40)
  if UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_40)) == Const.GamepadFaceButtonDown then
    r0_40:OnGamePadConfirKeyDown()
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end
function r2_0.OnRepeatKeyDown(r0_41, r1_41, r2_41)
  -- line: [395, 406] id: 41
  local r5_41 = r0_41.RepeatKeyDownEvents[UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_41))]
  if r5_41 then
    local r6_41, r7_41 = r5_41(r0_41)
    if r7_41 then
      return r6_41
    end
  end
  return UIUtils.Handled
end
function r2_0.OnKeyDown(r0_42, r1_42, r2_42)
  -- line: [408, 417] id: 42
  if CommonUtils:IfExistSystemGuideUI(r0_42) then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  local r3_42, r4_42 = r0_42:ProcessOnKeyDown(r1_42, r2_42)
  if r4_42 then
    return r3_42
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end
function r2_0.OnFocusReceived(r0_43, r1_43, r2_43)
  -- line: [419, 430] id: 43
  local r3_43 = r2_0.Super.OnFocusReceived(r0_43, r1_43, r2_43)
  if not r0_43.IsGamepadInput then
    return UIUtils.Handled
  end
  local r4_43 = r0_43:GetDesiredFocusTarget()
  if r4_43 == r0_43 then
    r0_43:OnFocusStateChanged()
    return UIUtils.Handled
  end
  return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), r4_43)
end
function r2_0.OnAnalogValueChanged(r0_44, r1_44, r2_44)
  -- line: [432, 443] id: 44
  if UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_44)) == "Gamepad_RightX" then
    if r0_44.ActorController then
      r0_44.ActorController:OnDragging({
        X = UKismetInputLibrary.GetAnalogValue(r2_44) * 10,
      })
    end
    return UIUtils.Handled
  end
  return UIUtils.Unhandled
end
function r2_0.OnTabLeftKeyDown(r0_45)
  -- line: [445, 448] id: 45
  r0_45.Tab_Skin:TabToLeft()
  return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), r0_45:GetDesiredFocusTarget()), true
end
function r2_0.OnTabRightKeyDown(r0_46)
  -- line: [450, 453] id: 46
  r0_46.Tab_Skin:TabToRight()
  return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), r0_46:GetDesiredFocusTarget()), true
end
function r2_0.OnHideUIKeyDown(r0_47)
  -- line: [455, 458] id: 47
  r2_0.Super.OnHideUIKeyDown(r0_47)
  return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), r0_47:GetDesiredFocusTarget()), true
end
function r2_0.GetReplyOnBack(r0_48)
  -- line: [460, 462] id: 48
  return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), r0_48:GetDesiredFocusTarget()), true
end
function r2_0.OnBackKeyDown(r0_49)
  -- line: [464, 466] id: 49
  r2_0.Super.OnBackKeyDown(r0_49)
end
AssembleComponents(r2_0)
return r2_0
