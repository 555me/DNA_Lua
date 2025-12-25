-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\UI_Phone\Battle\WBP_JoyStick_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})
function r0_0.Construct(r0_1)
  -- line: [12, 20] id: 1
  r0_1.Overridden.Construct(r0_1)
  r0_1:AddTimer(0.2, r0_1.UpdateDirection, true, 0, "UpdateDirectionForTouch")
end
function r0_0.Init(r0_2)
  -- line: [22, 37] id: 2
  local r2_2 = UGameplayStatics.GetPlayerController(r0_2, 0).CurrentTouchInterface
  if not r2_2 then
    return 
  end
  r0_2.ActiveOpacity = r2_2.ActiveOpacity
  r0_2.InactiveOpacity = r2_2.InactiveOpacity
  r0_2.NowOpacity = r0_2.InactiveOpacity
  r0_2.IsActiveNow = false
  r0_2.IsHide = false
  r0_2.VisibilityFromBattle = UIConst.VisibilityOp.Visible
  r0_2.VisibilityFromSelf = UIConst.VisibilityOp.Visible
  UIManager(r0_2):SetRealVirtualJoystickZOrder(6)
  UIManager(r0_2):SetRealVirtualJoystickOpacity(r0_2.NowOpacity, r0_2.InactiveOpacity)
end
function r0_0.SetOpacity(r0_3, r1_3)
  -- line: [39, 51] id: 3
  if r0_3.IsActiveNow ~= r1_3 then
    if r1_3 then
      r0_3.NowOpacity = r0_3.ActiveOpacity
    else
      r0_3.NowOpacity = r0_3.InactiveOpacity
    end
    if UIManager(r0_3):SetRealVirtualJoystickOpacity(r0_3.NowOpacity, r0_3.InactiveOpacity) then
      r0_3.IsActiveNow = r1_3
    end
  end
end
function r0_0.SetTouchVisibilityFromBattle(r0_4, r1_4)
  -- line: [53, 67] id: 4
  local r3_4 = UE4.UGameplayStatics.GetGameInstance(r0_4):GetGameUIManager()
  local r4_4 = UGameplayStatics.GetPlayerController(r0_4, 0)
  r0_4.VisibilityFromBattle = r1_4
  if r1_4 == UIConst.VisibilityOp.Collapsed or r1_4 == UIConst.VisibilityOp.Hidden then
    r0_4.IsHide = true
    DebugPrint("HY@ UIManagerComponent InActivateVirtualJoystick== Try to InActivate Joystick")
    r3_4:InActivateVirtualJoystick()
    r3_4:SetRealVirtualJoystickOpacity(0, r0_4.InactiveOpacity)
    r4_4:SetVirtualJoystickVisibility(false)
  else
    r0_4:SetTouchVisibility(r0_4.VisibilityFromSelf)
  end
end
function r0_0.SetTouchVisibility(r0_5, r1_5)
  -- line: [69, 94] id: 5
  r0_5.VisibilityFromSelf = r1_5
  if r0_5.VisibilityFromBattle == UIConst.VisibilityOp.Collapsed or r0_5.VisibilityFromBattle == UIConst.VisibilityOp.Hidden then
    return 
  end
  local r3_5 = UE4.UGameplayStatics.GetGameInstance(r0_5):GetGameUIManager()
  local r4_5 = UGameplayStatics.GetPlayerController(r0_5, 0)
  if r1_5 == UIConst.VisibilityOp.Collapsed or r1_5 == UIConst.VisibilityOp.Hidden then
    r0_5.IsHide = true
    r3_5:InActivateVirtualJoystick()
    r3_5:SetRealVirtualJoystickOpacity(0, r0_5.InactiveOpacity)
    r4_5:SetVirtualJoystickVisibility(false)
    DebugPrint("HY@ UIManagerComponent InActivateVirtualJoystick== Try to InActivate Joystick")
  else
    if not r0_5.IsHide then
      return 
    end
    r0_5.IsHide = false
    r3_5:ActivateVirtualJoystick()
    r3_5:SetRealVirtualJoystickZOrder(6)
    r3_5:SetRealVirtualJoystickOpacity(r0_5.NowOpacity, r0_5.InactiveOpacity)
    r4_5:SetVirtualJoystickVisibility(true)
    DebugPrint("HY@ UIManagerComponent ActivateVirtualJoystick== Try to Activate Joystick")
  end
end
return r0_0
