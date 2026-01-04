-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Activity\Widget\FeinaEvent\WBP_Activity_FeinaEvent_RewardBtn_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("BluePrints.UI.WBP.Activity.Widget.FeinaEvent.WBP_Activity_FeinaEvent_Reward_Model")
local r1_0 = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local r2_0 = require("BluePrints.UI.WBP.Activity.ActivityReddotHelper")
local r3_0 = Class({
  "Blueprints.UI.BP_UIState_C"
})
function r3_0.Init(r0_1)
  -- line: [19, 43] id: 1
  r0_1:SetText(GText("PermanenEventReward"))
  r0_1:BindEventOnClicked(r0_1, r0_1.OpenReward)
  r0_1.Key_Controller:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "Y",
      }
    },
  })
  r0_1.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(r0_1)
  r0_1:RefreshOpInfoByInputDevice(r0_1.GameInputModeSubsystem:GetCurrentInputType(), r0_1.GameInputModeSubsystem:GetCurrentGamepadName())
  if CommonUtils.GetDeviceTypeByPlatformName(r0_1) == "PC" then
    r0_1:AddInputMethodChangedListen()
  end
  if not ReddotManager.GetTreeNode("FeinaEventReward") then
    ReddotManager.AddNode("FeinaEventReward")
  end
  if not r0_1.AddListenerFinish then
    r0_1.AddListenerFinish = true
    ReddotManager.AddListener("FeinaEventReward", r0_1, r0_1.RefreshReddot)
  end
  r0_1:RefreshReddot()
end
function r3_0.RefreshReddot(r0_2)
  -- line: [45, 62] id: 2
  local r1_2 = ReddotManager.GetLeafNodeCacheDetail("FeinaEventReward")
  if not r1_2 then
    r0_2.Reddot:SetVisibility(ESlateVisibility.Collapsed)
  else
    local r2_2 = true
    for r7_2, r8_2 in pairs(r1_2) do
      r2_2 = false
      break
    end
    -- close: r3_2
    if not r2_2 then
      r0_2.Reddot:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    else
      r0_2.Reddot:SetVisibility(ESlateVisibility.Collapsed)
      r2_0.TrySubReddotCount(r1_0, CommonConst.FeinaEventId, "Red")
    end
  end
end
function r3_0.Construct(r0_3)
  -- line: [65, 71] id: 3
  r0_3.Btn_Click.OnHovered:Add(r0_3, r0_3.OnBtnHovered)
  r0_3.Btn_Click.OnUnhovered:Add(r0_3, r0_3.OnBtnUnhovered)
  r0_3.Btn_Click.OnPressed:Add(r0_3, r0_3.OnBtnPressed)
  r0_3.Btn_Click.OnReleased:Add(r0_3, r0_3.OnBtnReleased)
  r0_3.Btn_Click.OnClicked:Add(r0_3, r0_3.OnBtnClicked)
end
function r3_0.AddInputMethodChangedListen(r0_4)
  -- line: [76, 80] id: 4
  if IsValid(r0_4.GameInputModeSubsystem) then
    r0_4.GameInputModeSubsystem.OnInputMethodChanged:Add(r0_4, r0_4.RefreshOpInfoByInputDevice)
  end
end
function r3_0.RemoveInputMethodChangedListen(r0_5)
  -- line: [82, 86] id: 5
  if IsValid(r0_5.GameInputModeSubsystem) then
    r0_5.GameInputModeSubsystem.OnInputMethodChanged:Remove(r0_5, r0_5.RefreshOpInfoByInputDevice)
  end
end
function r3_0.Destruct(r0_6)
  -- line: [89, 93] id: 6
  r0_6:RemoveInputMethodChangedListen()
  r0_6.Super.Destruct(r0_6)
  ReddotManager.RemoveListener("FeinaEventReward", r0_6)
end
function r3_0.SetText(r0_7, r1_7)
  -- line: [95, 97] id: 7
  r0_7.Text_Reward:SetText(r1_7)
end
function r3_0.BindEventOnClicked(r0_8, r1_8, r2_8, r3_8)
  -- line: [99, 106] id: 8
  if not r1_8 or not r2_8 then
    return 
  end
  r0_8.Obj = r1_8
  r0_8.Func = r2_8
  r0_8.Params = r3_8
end
function r3_0.OnBtnHovered(r0_9)
  -- line: [108, 115] id: 9
  r0_9.IsHovering = true
  if r0_9.IsPressing then
    return 
  end
  r0_9:StopAllAnimations()
  r0_9:PlayAnimation(r0_9.Hover)
end
function r3_0.OnBtnUnhovered(r0_10)
  -- line: [117, 123] id: 10
  r0_10.IsHovering = false
  if not r0_10.IsPressing then
    r0_10:StopAllAnimations()
    r0_10:PlayAnimation(r0_10.Unhover)
  end
end
function r3_0.OnBtnPressed(r0_11)
  -- line: [125, 129] id: 11
  r0_11.IsPressing = true
  r0_11:StopAllAnimations()
  r0_11:PlayAnimation(r0_11.Press)
end
function r3_0.OnBtnReleased(r0_12)
  -- line: [131, 140] id: 12
  r0_12.IsPressing = false
  if not r0_12.IsHovering then
    r0_12:StopAllAnimations()
    r0_12:PlayAnimationReverse(r0_12.Normal)
  else
    r0_12:StopAllAnimations()
    r0_12:PlayAnimationReverse(r0_12.Hover)
  end
end
function r3_0.OnBtnClicked(r0_13)
  -- line: [142, 153] id: 13
  r0_13:StopAllAnimations()
  r0_13:PlayAnimation(r0_13.Click)
  AudioManager(r0_13):PlayUISound(r0_13, "event:/ui/activity/gift_entrance_btn_click", nil, nil)
  if r0_13.Obj and r0_13.Func then
    if r0_13.Params then
      r0_13.Func(r0_13.Obj, table.unpack(r0_13.Params))
    else
      r0_13.Func(r0_13.Obj)
    end
  end
end
function r3_0.OpenReward(r0_14)
  -- line: [155, 157] id: 14
  r0_0:OpenReward(r0_14)
end
function r3_0.RefreshOpInfoByInputDevice(r0_15, r1_15, r2_15)
  -- line: [159, 168] id: 15
  if r1_15 == ECommonInputType.MouseAndKeyboard then
    r0_15:InitKeyBoardView()
  elseif r1_15 == ECommonInputType.Gamepad then
    r0_15:InitGamepadView()
  end
  r0_15.CurInputDeviceType = r1_15
end
function r3_0.InitKeyBoardView(r0_16)
  -- line: [170, 172] id: 16
  r0_16.Key_Controller:SetVisibility(UIConst.VisibilityOp.Collapsed)
end
function r3_0.InitGamepadView(r0_17)
  -- line: [174, 176] id: 17
  r0_17.Key_Controller:SetVisibility(UIConst.VisibilityOp.Visible)
end
function r3_0.HandleKeyDownOnGamePad(r0_18, r1_18)
  -- line: [178, 185] id: 18
  local r2_18 = false
  if r1_18 == UIConst.GamePadKey.FaceButtonTop then
    r2_18 = true
    r0_18:OnBtnClicked()
  end
  return r2_18
end
function r3_0.OnUpdateSubUIViewStyle(r0_19, r1_19)
  -- line: [187, 193] id: 19
  if r1_19 then
    r0_19.Key_Controller:SetVisibility(UIConst.VisibilityOp.Visible)
  else
    r0_19.Key_Controller:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end
return r3_0
