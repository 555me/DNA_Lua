-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Chat\View\WBP_Common_Dialog_ChatReport_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("Utils.StringUtils")
local r1_0 = require("Utils.HeroUSDKUtils")
local r2_0 = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")
function r2_0.Construct(r0_1)
  -- line: [7, 25] id: 1
  r2_0.Super.Construct(r0_1)
  r0_1.bTipsShowed = false
  r0_1.TipsText = ""
  r0_1.CheckedTypes = {}
end
function r2_0.Destruct(r0_2)
  -- line: [27, 34] id: 2
  if CommonUtils.GetDeviceTypeByPlatformName(r0_2) ~= "Mobile" then
    local r1_2 = UGameInputModeSubsystem.GetGameInputModeSubsystem(r0_2)
    if IsValid(r1_2) then
      r1_2.OnInputMethodChanged:Remove(r0_2, r0_2.RefreshOpInfoByInputDevice)
    end
  end
end
function r2_0.InitContent(r0_3, r1_3, r2_3, r3_3)
  -- line: [37, 88] id: 3
  r0_3.Super.InitContent(r0_3, r1_3, r2_3, r3_3)
  r0_3.ChatMessage = r1_3.ChatMassage
  r0_3.Owner = r3_3
  r0_3.Owner:GetButtonBar().Btn_Yes:BindEventOnReleased(r0_3, r0_3.OnBtnYes)
  r0_3.Owner:GetButtonBar().Btn_Yes:ForbidBtn(true)
  r0_3.Owner:GetButtonBar().Btn_Quit:BindEventOnReleased(r0_3, r0_3.OnBtnNo)
  r0_3.Text_Title:SetText(string.format("%s: ", GText("UI_COMMONPOP_TEXT_100090_1")))
  r0_3.Text_PlayerName:SetText(string.format("%s ", r1_3.PlayerName))
  r0_3.Text_PlayerUID:SetText(string.format(" UID%s", r1_3.UID))
  r0_3.Text_ReportTypeTitle:SetText(GText("UI_COMMONPOP_TEXT_100090_2"))
  r0_3.List_Report:ClearListItems()
  for r8_3, r9_3 in pairs(CommonConst.ReportType) do
    local r10_3 = NewObject(UIUtils.GetCommonItemContentClass())
    r10_3.Owner = r0_3
    r10_3.Id = r8_3
    r10_3.value = r9_3
    r0_3.List_Report:AddItem(r10_3)
  end
  -- close: r4_3
  r0_3.Text_ReportDescTitle:SetText(GText("UI_COMMONPOP_TEXT_100090_11"))
  r1_3.OwnerDialog = r3_3
  local r4_3 = r1_3.EditTextConfig and {}
  r4_3.Events = r4_3.Events and {}
  if not r4_3.Events.OnTextChanged then
    function r4_3.Events.OnTextChanged(r0_4, r1_4)
      -- line: [65, 67] id: 4
      r0_3:RefreshForbidBtn(nil, r1_4)
    end
  end
  r0_3.Com_Input_Multiline_Light:Init(r4_3, r1_3)
  r0_3.Btn_Yes = r0_3.Owner:GetButtonBar().Btn_Yes
  r0_3.Btn_Yes:SetGamePadImg("Y")
  if CommonUtils.GetDeviceTypeByPlatformName(r0_3) ~= "Mobile" then
    local r5_3 = UGameInputModeSubsystem.GetGameInputModeSubsystem(r0_3)
    if IsValid(r5_3) then
      r5_3.OnInputMethodChanged:Add(r0_3, r0_3.RefreshOpInfoByInputDevice)
      r0_3:RefreshOpInfoByInputDevice(r5_3:GetCurrentInputType(), r5_3:GetCurrentGamepadName())
    end
    r0_3.GamepadAKeyIndex = r0_3:ShowGamepadShortcutBtn({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "A",
          Owner = r0_3,
        }
      },
      Desc = GText("UI_CTL_Select"),
      bLongPress = false,
    })
    r0_3.Com_Input_Multiline_Light:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
    r0_3.Com_Input_Multiline_Light:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  end
end
function r2_0.OnTextComposing(r0_5)
  -- line: [90, 96] id: 5
  if r0_5.bTipsShowed then
    r0_5.Owner:HideDialogTip(2, false)
    r0_5.bTipsShowed = false
  end
end
function r2_0.OnCheckTextLegality(r0_6, r1_6)
  -- line: [102, 105] id: 6
end
function r2_0.OnTextChange(r0_7, r1_7)
  -- line: [107, 136] id: 7
  if r0_7.Com_Input_Multiline_Light.TextLimit <= r0_7.Com_Input_Multiline_Light:Utf8StrLen(r1_7) then
    r0_7:ShowTips(r1_7, 1, 1.5)
  end
end
function r2_0.OnChatItemChange(r0_8, r1_8, r2_8)
  -- line: [138, 146] id: 8
  if r1_8 then
    AudioManager(r0_8):PlayUISound(r0_8, "event:/ui/common/click_checkbox_check", nil, nil)
    r0_8:AddSelection(r2_8)
  else
    AudioManager(r0_8):PlayUISound(r0_8, "event:/ui/common/click_checkbox_uncheck", nil, nil)
    r0_8:RemoveSelection(r2_8)
  end
end
function r2_0.AddSelection(r0_9, r1_9)
  -- line: [148, 154] id: 9
  if not r0_9.CheckedTypes[r1_9.Id] then
    r0_9.CheckedTypes[r1_9.Id] = true
  end
  r0_9:RefreshForbidBtn(false, nil)
end
function r2_0.RemoveSelection(r0_10, r1_10)
  -- line: [156, 164] id: 10
  if r0_10.CheckedTypes[r1_10.Id] then
    r0_10.CheckedTypes[r1_10.Id] = nil
  end
  if r0_10:_isDictionaryEmpty(r0_10.CheckedTypes) then
    r0_10:RefreshForbidBtn(true, nil)
  end
end
function r2_0.RefreshForbidBtn(r0_11, r1_11, r2_11)
  -- line: [165, 175] id: 11
  if r1_11 == nil then
    r1_11 = r0_11:_isDictionaryEmpty(r0_11.CheckedTypes)
  end
  if r2_11 == nil then
    r2_11 = r0_11.Com_Input_Multiline_Light:GetText()
  end
  local r3_11 = r1_11 and r2_11 == ""
  r0_11.Owner:GetButtonBar().Btn_Yes:ForbidBtn(r3_11)
  r0_11.Owner.ForbidRightBtn = r3_11
end
function r2_0._isDictionaryEmpty(r0_12, r1_12)
  -- line: [176, 181] id: 12
  for r6_12 in pairs(r1_12) do
    return false
  end
  -- close: r2_12
  return true
end
function r2_0.GetCheckedTypes(r0_13, r1_13)
  -- line: [184, 192] id: 13
  local r2_13 = {}
  for r7_13, r8_13 in pairs(r1_13) do
    table.insert(r2_13, DataMgr.ChatReportType[tonumber(r7_13)].Id)
  end
  -- close: r3_13
  return table.concat(r2_13, "&")
end
function r2_0.OnBtnYes(r0_14)
  -- line: [194, 233] id: 14
  if r0_14.Owner.ForbidRightBtn then
    UIManager(GWorld.GameInstance):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Chat_Report_None"))
    return 
  end
  local r1_14 = r0_14.Com_Input_Multiline_Light:GetText()
  local r2_14 = r0_14:GetCheckedTypes(r0_14.CheckedTypes)
  local r3_14 = GText("UI_REGISTER_BANNEDINPUT")
  ChatController:CheckTextValid(r1_14, function(r0_15, r1_15)
    -- line: [205, 222] id: 15
    if r0_15 then
      r1_14 = r1_15
      local r2_15 = nil
      if r0_14.ChatMessage.Sender.all_dump then
        r2_15 = r0_14.ChatMessage.Sender:all_dump(r0_14.ChatMessage.Sender)
      else
        r2_15 = r0_14.ChatMessage.Sender
      end
      GWorld:GetAvatar():ReportChat(r2_14, r1_14, {
        Content = r0_14.ChatMessage.Content,
        Sender = r2_15,
      })
      r0_14.Owner.DontCloseWhenRightBtnClicked = false
      r0_14.Owner:OnClose()
    end
  end, function(r0_16)
    -- line: [223, 228] id: 16
    if #r1_14 > 0 then
      r0_14:ShowTips("UI_REGISTER_BANNEDINPUT", 1, 0)
    end
  end, {}, true)
end
function r2_0.ShowTips(r0_17, r1_17, r2_17, r3_17)
  -- line: [235, 266] id: 17
  r0_17.Com_Input_Multiline_Light:ShowTips(r1_17, r2_17)
  if r0_17.bTipsShowed and r0_17.TipsText == r1_17 then
    return 
  end
  r0_17.TipsText = r1_17
  local r4_17 = r0_17:IsExistTimer(r0_17.TipTimerKey)
  if r4_17 then
    r0_17:RemoveTimer(r0_17.TipTimerKey)
    r0_17.Owner:HideDialogTip(1, false)
    r0_17.Owner:HideDialogTip(2, false)
  end
  if r2_17 == 1 then
    r4_17 = 1 and 2
  else
    goto label_36	-- block#7 is visited secondly
  end
  local r5_17 = {
    DialogItemIndex = r4_17,
    bHideDialogItem = false,
    bShouldPlayAnim = true,
    Tips = {
      r1_17,
      r1_17
    },
  }
  AudioManager(r0_17):PlayUISound(r0_17, "event:/ui/common/input_err", nil, nil)
  r0_17.Owner:BroadcastDialogEvent("UpdateDialogTipText", r5_17)
  r0_17.Owner:BroadcastDialogEvent(DialogEvent.HideDialogItem, r5_17)
  r0_17.bTipsShowed = true
  r0_17:AddTimer(1.5, function()
    -- line: [260, 265] id: 18
    if r3_17 and r3_17 ~= 0 then
      r0_17.Owner:HideDialogTip(r4_17, false)
      r0_17.bTipsShowed = false
    end
  end, false, 0, r0_17.TipTimerKey)
end
function r2_0.CloseTip(r0_19, r1_19)
  -- line: [269, 278] id: 19
  r0_19.Owner:BroadcastDialogEvent(DialogEvent.HideDialogItem, {
    DialogItemIndex = 2,
    bHideDialogItem = true,
    bShouldPlayAnim = true,
    Tips = {
      r1_19,
      r1_19
    },
  })
  r0_19.bTipsShowed = false
end
function r2_0.OnBtnNo(r0_20)
  -- line: [280, 282] id: 20
  r0_20.Owner:OnClose()
end
function r2_0.OnClose(r0_21)
  -- line: [284, 287] id: 21
  r0_21.Owner:GetButtonBar().Btn_Yes:UnbindEventOnReleased(r0_21)
  r0_21.Owner:GetButtonBar().Btn_Quit:UnbindEventOnReleased(r0_21)
end
function r2_0.OnContentFocusReceived(r0_22)
  -- line: [288, 290] id: 22
  r0_22.List_Report:SetFocus()
end
function r2_0.OnKeyDown(r0_23, r1_23, r2_23)
  -- line: [291, 302] id: 23
  local r3_23 = UE4.UKismetInputLibrary.GetKey(r2_23)
  local r4_23 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_23)
  local r5_23 = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_23) then
    r5_23 = r0_23:OnGamePadDown(r4_23)
  end
  if r5_23 then
    return UWidgetBlueprintLibrary.Handled()
  end
  return UWidgetBlueprintLibrary.UnHandled()
end
function r2_0.OnGamePadDown(r0_24, r1_24)
  -- line: [304, 321] id: 24
  local r2_24 = false
  if r1_24 == Const.GamepadFaceButtonUp then
    if not r0_24.Owner.ForbidRightBtn then
      r0_24:OnBtnYes()
    end
    r2_24 = true
  elseif r1_24 == Const.GamepadFaceButtonLeft then
    r0_24.Com_Input_Multiline_Light:FocusInputField()
    r0_24:UpdateUIStyleInPlatform()
    r2_24 = true
  elseif r1_24 == Const.GamepadLeftThumbstick then
    r0_24.Com_Input_Multiline_Light:OnDeleteBtnClicked()
    r0_24.Com_Input_Multiline_Light:FocusInputField()
    r2_24 = true
  end
  return r2_24
end
function r2_0.OnUpdateUIStyleByInputTypeChange(r0_25, r1_25, r2_25)
  -- line: [322, 332] id: 25
  if r1_25 == ECommonInputType.Gamepad then
    if r0_25.Com_Input_Multiline_Light:HasFocusedDescendants() then
      r0_25.Com_Input_Multiline_Light:FocusInputField()
    else
      r0_25.List_Report:SetFocus()
    end
  end
  r0_25.CurInputDeviceType = r1_25
  r0_25:UpdateUIStyleInPlatform()
end
function r2_0.UpdateUIStyleInPlatform(r0_26)
  -- line: [333, 343] id: 26
  if not r0_26.GamepadAKeyIndex then
    return 
  end
  if r0_26.CurInputDeviceType == ECommonInputType.Gamepad and r0_26.List_Report:HasFocusedDescendants() then
    r0_26:ShowGamepadShortcut(r0_26.GamepadAKeyIndex)
  else
    r0_26:HideGamepadShortcut(r0_26.GamepadAKeyIndex)
  end
end
return r2_0
