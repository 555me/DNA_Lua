-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP_Npc_Story_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class("BluePrints.UI.BP_UIState_C")
local r1_0 = require("Utils.UIUtils")
function r0_0.Construct(r0_1)
  -- line: [14, 21] id: 1
  r0_1.Super.Construct(r0_1)
  r0_1.Btn_Cloce.OnClicked:Add(r0_1, r0_1.BtnBackOnClick)
  r0_1:ChangePlayerInputable(false)
  AudioManager(r0_1):PlayUISound(r0_1, "event:/ui/common/npc_info_panel", "NpcStory", nil)
  r0_1.Text_Tips:SetText(GText("UI_TRAIN_CLOSE"))
  r0_1.ExecOnClose = nil
end
function r0_0.InitUIInfo(r0_2, r1_2, r2_2, r3_2, r4_2, r5_2, r6_2, r7_2)
  -- line: [23, 37] id: 2
  r0_0.Super.InitUIInfo(r0_2, r1_2, r2_2, r3_2, r4_2, r5_2, r6_2, r7_2)
  r0_2.Text_StoryDetail:SetText(r5_2)
  r0_2.Text_NpcStoryTitle:SetText(r4_2)
  if r7_2 then
    r0_2.Text_AgeTitle:SetVisibility(ESlateVisibility.Visible)
    r0_2.Text_AgeNum:SetVisibility(ESlateVisibility.Visible)
    r0_2.Text_AgeTitle:SetText(GText("NpcBiography_AgeText"))
    r0_2.Text_AgeNum:SetText(r7_2)
  else
    r0_2.Text_AgeTitle:SetVisibility(ESlateVisibility.Collapsed)
    r0_2.Text_AgeNum:SetVisibility(ESlateVisibility.Collapsed)
  end
end
function r0_0.OnLoaded(r0_3, r1_3, r2_3, r3_3, r4_3)
  -- line: [39, 59] id: 3
  UE4.UGameplayStatics.GetPlayerCharacter(r0_3, 0):SetCanInteractiveTrigger(false, "WBP_Story_NPC_C")
  r0_3:UnbindAllFromAnimationFinished(r0_3.In)
  r0_3:BindToAnimationFinished(r0_3.In, {
    r0_3,
    function()
      -- line: [53, 57] id: 4
      r0_3:InitDeviceInfo()
      r0_3:InitListenEvent()
    end
  })
  r0_3:PlayAnimation(r0_3.In)
end
function r0_0.Destruct(r0_5)
  -- line: [61, 64] id: 5
  r0_5.ExecOnClose = nil
  r0_0.Super.Destruct(r0_5)
end
function r0_0.BtnBackOnClick(r0_6)
  -- line: [66, 72] id: 6
  r0_6:ChangePlayerInputable(true)
  AudioManager(r0_6):PlayUISound(r0_6, "event:/ui/common/npc_info_panel", "NpcStory", nil)
  r0_6:Close()
  UE4.UGameplayStatics.GetPlayerCharacter(r0_6, 0):SetCanInteractiveTrigger(true, "WBP_Story_NPC_C")
end
function r0_0.Close(r0_7)
  -- line: [74, 82] id: 7
  AudioManager(r0_7):SetEventSoundParam(r0_7, "NpcStory", {
    ToEnd = 1,
  })
  r0_7.Super.Close(r0_7)
  local r1_7 = r0_7.ExecOnClose
  r0_7.ExecOnClose = nil
  if r1_7 then
    r1_7()
  end
end
function r0_0.RealClose(r0_8)
  -- line: [84, 91] id: 8
  r0_0.Super.RealClose(r0_8)
  local r1_8 = r0_8.ExecOnRealClose
  r0_8.ExecOnRealClose = nil
  if r1_8 then
    r1_8()
  end
end
function r0_0.BindOnRealClose(r0_9, r1_9)
  -- line: [93, 95] id: 9
  r0_9.ExecOnRealClose = r1_9
end
function r0_0.UnBindOnRealClose(r0_10)
  -- line: [97, 99] id: 10
  r0_10.ExecOnRealClose = nil
end
function r0_0.BindOnClose(r0_11, r1_11)
  -- line: [102, 104] id: 11
  r0_11.ExecOnClose = r1_11
end
function r0_0.UnBindOnClose(r0_12)
  -- line: [106, 108] id: 12
  r0_12.ExecOnClose = nil
end
function r0_0.ChangePlayerInputable(r0_13, r1_13)
  -- line: [111, 134] id: 13
  local r2_13 = UE4.UGameplayStatics.GetPlayerController(r0_13, 0)
  local r3_13 = CommonUtils.GetDeviceTypeByPlatformName(r0_13) == "Mobile"
  if not r1_13 then
    r0_13:SetInputUIOnly(true)
    if not r3_13 then
      local r4_13 = UE4.UWidgetLayoutLibrary.GetViewportSize(r0_13)
      r2_13:SetMouseLocation(math.floor(r4_13.X / 2), math.floor(r4_13.Y / 2))
    end
  else
    r0_13:SetInputUIOnly(false)
  end
end
function r0_0.OnKeyDown(r0_14, r1_14, r2_14)
  -- line: [136, 152] id: 14
  local r3_14 = false
  local r4_14 = UE4.UKismetInputLibrary.GetKey(r2_14)
  local r5_14 = UE4.UFormulaFunctionLibrary.Key_GetFName(r4_14)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r4_14) then
    r3_14 = r0_14:Handle_OnGamePadDown(r5_14)
  else
    r3_14 = r0_14:Handle_OnPCDown(r5_14)
  end
  if r3_14 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end
function r0_0.Handle_OnGamePadDown(r0_15, r1_15)
  -- line: [154, 160] id: 15
  if r1_15 == "Gamepad_FaceButton_Right" then
    r0_15:BtnBackOnClick()
    return true
  end
  return false
end
function r0_0.Handle_OnPCDown(r0_16, r1_16)
  -- line: [162, 168] id: 16
  if r1_16 == "Escape" then
    r0_16:BtnBackOnClick()
    return true
  end
  return false
end
function r0_0.OnAnalogValueChanged(r0_17, r1_17, r2_17)
  -- line: [170, 181] id: 17
  if UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_17)) == UIConst.GamePadKey.RightAnalogY then
    r0_17.ScrollBox_StoryDetail:SetScrollOffset(math.clamp(r0_17.ScrollBox_StoryDetail:GetScrollOffset() + UKismetInputLibrary.GetAnalogValue(r2_17) * -1 * 5, 0, r0_17.ScrollBox_StoryDetail:GetScrollOffsetOfEnd()))
    return r1_0.Handled
  end
  return r1_0.Unhandled
end
function r0_0.InitDeviceInfo(r0_18)
  -- line: [183, 189] id: 18
  r0_18.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(UE4.UGameplayStatics.GetPlayerController(r0_18, 0))
  if IsValid(r0_18.GameInputModeSubsystem) then
    r0_18:RefreshOpInfoByInputDevice(r0_18.GameInputModeSubsystem:GetCurrentInputType(), r0_18.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end
function r0_0.InitListenEvent(r0_19)
  -- line: [191, 195] id: 19
  if IsValid(r0_19.GameInputModeSubsystem) then
    r0_19.GameInputModeSubsystem.OnInputMethodChanged:Add(r0_19, r0_19.RefreshOpInfoByInputDevice)
  end
end
function r0_0.RefreshOpInfoByInputDevice(r0_20, r1_20, r2_20)
  -- line: [197, 208] id: 20
  DebugPrint("thy     CurGamepadName", r2_20)
  if r0_20.CurInputDeviceType == r1_20 then
    return 
  end
  r0_20.CurInputDeviceType = r1_20
  r0_20.CurGamepadName = r2_20
  r0_20:InitUI()
end
function r0_0.InitUI(r0_21)
  -- line: [210, 230] id: 21
  if r0_21.CurInputDeviceType == ECommonInputType.MouseAndKeyboard or r0_21.CurInputDeviceType == ECommonInputType.Touch then
    r0_21.WS:SetActiveWidgetIndex(0)
  else
    local r1_21 = {
      {
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "RV",
          }
        },
        Desc = GText("UI_Controller_Slide"),
      },
      {
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
          }
        },
        Desc = GText("UI_Controller_Close"),
      }
    }
    if not r1_0.CheckScrollBoxCanScroll(r0_21.ScrollBox_StoryDetail) then
      table.remove(r1_21, 1)
    end
    r0_21.Key_Tips:UpdateKeyInfo(r1_21)
    r0_21.WS:SetActiveWidgetIndex(1)
  end
end
return r0_0
