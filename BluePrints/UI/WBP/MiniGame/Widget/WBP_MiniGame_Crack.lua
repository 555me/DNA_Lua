-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\MiniGame\Widget\WBP_MiniGame_Crack.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class("BluePrints.UI.BP_UIState_C")
function r0_0.Init(r0_1, r1_1)
  -- line: [20, 36] id: 1
  r0_1.RootPage = r1_1.RootPage
  r0_1.SuccCallBack = r1_1.SuccCallBack
  r0_1.ResetCallBack = r1_1.ResetCallBack
  r0_1.Text_Crack:SetText(GText("UI_MiniGame_Decode"))
  r0_1.NeedCrack = r1_1.NeedCrack
  r0_1.NeedReset = r1_1.NeedReset
  r0_1.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(r0_1)
  r0_1.GameInputModeSubsystem.OnInputMethodChanged:Add(r0_1, r0_1.RefreshInfoByInputTypeChange)
  r0_1.CurMode = r0_1.GameInputModeSubsystem:GetCurrentInputType()
  r0_1:RefreshInfoByInputTypeChange(r0_1.CurMode)
  r0_1:InitCrackButton()
  r0_1:InitResetButton()
  r0_1:PlayAnim()
end
function r0_0.InitCrackButton(r0_2)
  -- line: [38, 58] id: 2
  if not r0_2.NeedCrack then
    r0_2.Panel_Crack:SetVisibility(ESlateVisibility.Collapsed)
    return 
  end
  r0_2.CrackHover = false
  r0_2.CrackPress = false
  r0_2.Key_Crack_GamePad:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "Y",
      }
    },
  })
  r0_2.Key_Crack:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = "F",
      }
    },
  })
  r0_2.Btn_Crack:SetVisibility(ESlateVisibility.Visible)
  r0_2.Btn_Crack.OnClicked:Add(r0_2, r0_2.OnClickCrackButton)
  r0_2.Btn_Crack.OnHovered:Add(r0_2, r0_2.OnHoverCrackButton)
  r0_2.Btn_Crack.OnUnhovered:Add(r0_2, r0_2.OnUnhovereCrackButton)
  r0_2.Btn_Crack.OnPressed:Add(r0_2, r0_2.OnPressCrackButton)
  r0_2.Btn_Crack.OnReleased:Add(r0_2, r0_2.OnReleaseCrackButton)
end
function r0_0.OnClickCrackButton(r0_3)
  -- line: [60, 66] id: 3
  if not r0_3.NeedCrack then
    return 
  end
  r0_3.SuccCallBack(r0_3.RootPage)
  r0_3.Btn_Crack:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
end
function r0_0.OnHoverCrackButton(r0_4)
  -- line: [68, 71] id: 4
  r0_4.CrackHover = true
  r0_4:PlayAnimation(r0_4.Crack_Hover)
end
function r0_0.OnUnhovereCrackButton(r0_5)
  -- line: [73, 79] id: 5
  r0_5.CrackHover = false
  if not r0_5.CrackPress then
    r0_5:PlayAnimation(r0_5.Crack_UnHover)
    r0_5:PlayAnimation(r0_5.Crack_Normal)
  end
end
function r0_0.OnPressCrackButton(r0_6)
  -- line: [81, 84] id: 6
  r0_6.CrackPress = true
  r0_6:PlayAnimation(r0_6.Crack_Press)
end
function r0_0.OnReleaseCrackButton(r0_7)
  -- line: [86, 93] id: 7
  r0_7.CrackPress = false
  if r0_7.CrackHover then
    r0_7:PlayAnimation(r0_7.Crack_Click)
  else
    r0_7:PlayAnimation(r0_7.Crack_Normal)
  end
end
function r0_0.InitResetButton(r0_8)
  -- line: [95, 113] id: 8
  if not r0_8.NeedReset then
    r0_8.Panel_Reset:SetVisibility(ESlateVisibility.Collapsed)
    return 
  end
  r0_8.ResetHover = false
  r0_8.ReserPress = false
  r0_8.Key_Reset_GamePad:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "X",
      }
    },
  })
  r0_8.Btn_Reset.OnClicked:Add(r0_8, r0_8.OnClickResetButton)
  r0_8.Btn_Reset.OnHovered:Add(r0_8, r0_8.OnHoverResetButton)
  r0_8.Btn_Reset.OnUnhovered:Add(r0_8, r0_8.OnUnhovereResetButton)
  r0_8.Btn_Reset.OnPressed:Add(r0_8, r0_8.OnPressResetButton)
  r0_8.Btn_Reset.OnReleased:Add(r0_8, r0_8.OnReleaseResetButton)
end
function r0_0.OnClickResetButton(r0_9)
  -- line: [115, 123] id: 9
  if not r0_9.NeedReset then
    return 
  end
  if r0_9.CurMode ~= ECommonInputType.MouseAndKeyboard then
    r0_9:PlayAnimation(r0_9.Reset_Click)
  end
  r0_9.ResetCallBack(r0_9.RootPage)
end
function r0_0.OnHoverResetButton(r0_10)
  -- line: [125, 128] id: 10
  r0_10.ResetHover = true
  r0_10:PlayAnimation(r0_10.Reset_Hover)
end
function r0_0.OnUnhovereResetButton(r0_11)
  -- line: [130, 136] id: 11
  r0_11.ResetHover = false
  if not r0_11.ReserPress then
    r0_11:PlayAnimation(r0_11.Reset_UnHover)
    r0_11:PlayAnimation(r0_11.Reset_Normal)
  end
end
function r0_0.OnPressResetButton(r0_12)
  -- line: [138, 141] id: 12
  r0_12.ReserPress = true
  r0_12:PlayAnimation(r0_12.Reset_Press)
end
function r0_0.OnReleaseResetButton(r0_13)
  -- line: [143, 150] id: 13
  r0_13.ReserPress = false
  if r0_13.ResetHover then
    r0_13:PlayAnimation(r0_13.Reset_Click)
  else
    r0_13:PlayAnimation(r0_13.Reset_Normal)
  end
end
function r0_0.RefreshInfoByInputTypeChange(r0_14, r1_14, r2_14)
  -- line: [152, 165] id: 14
  r0_14.CurMode = r1_14
  if r1_14 == ECommonInputType.MouseAndKeyboard then
    r0_14.Key_Reset_GamePad:SetVisibility(ESlateVisibility.Collapsed)
  elseif r1_14 == ECommonInputType.Gamepad then
    r0_14.WidgetSwitcher_Key:SetActiveWidgetIndex(1)
    if r0_14.NeedReset then
      r0_14.Key_Reset_GamePad:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
  elseif r1_14 == ECommonInputType.Touch then
    r0_14.WidgetSwitcher_Key:SetVisibility(ESlateVisibility.Collapsed)
    r0_14.Key_Reset_GamePad:SetVisibility(ESlateVisibility.Collapsed)
  end
end
function r0_0.PlayAnim(r0_15)
  -- line: [167, 175] id: 15
  if r0_15.NeedCrack and r0_15.NeedReset then
    r0_15:PlayAnimation(r0_15.Both)
  elseif not r0_15.NeedCrack and r0_15.NeedReset then
    r0_15:PlayAnimation(r0_15.Restart)
  elseif r0_15.NeedCrack and not r0_15.NeedReset then
    r0_15:PlayAnimation(r0_15.Crack)
  end
end
function r0_0.Destruct(r0_16)
  -- line: [177, 181] id: 16
  if IsValid(r0_16.GameInputModeSubsystem) then
    r0_16.GameInputModeSubsystem.OnInputMethodChanged:Remove(r0_16, r0_16.RefreshInfoByInputTypeChange)
  end
end
return r0_0
