-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Entertainment\Widget\WBP_Entertainment_TabItem_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})
function r0_0.Construct(r0_1)
  -- line: [18, 20] id: 1
  r0_1:SetVisibility(UIConst.VisibilityOp.Visible)
end
function r0_0.OnListItemObjectSet(r0_2, r1_2)
  -- line: [28, 37] id: 2
  r0_2.Content = r1_2
  r1_2.Widget = r0_2
  r0_2:SetIcon(r1_2.Icon and r1_2.IconPath, 0)
  r0_2:StopAllAnimations()
  r0_2:FlushAnimations()
  r0_2.IsSelected = r1_2.IsSelected
  r0_2:SetIsSelected(r1_2.IsSelected)
  r0_2:SetReddot(r1_2.IsNew, r1_2.Upgradeable)
end
function r0_0.SetIcon(r0_3, r1_3, r2_3)
  -- line: [39, 51] id: 3
  if not r2_3 then
    r2_3 = 0
  end
  r0_3.WidgetSwitcher_Head:SetActiveWidgetIndex(r2_3)
  local r4_3 = r0_3.WidgetSwitcher_Head:GetChildAt(r2_3):GetDynamicMaterial()
  if r4_3 then
    if type(r1_3) == "string" then
      r4_3:SetTextureParameterValue("IconMap", LoadObject(r1_3))
    else
      r4_3:SetTextureParameterValue("IconMap", r1_3)
    end
  end
end
function r0_0.SetReddot(r0_4, r1_4, r2_4)
  -- line: [55, 67] id: 4
  if r1_4 then
    r0_4.New:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r0_4.Reddot:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    r0_4.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
    if r2_4 then
      r0_4.Reddot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      r0_4.Reddot:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
end
function r0_0.BP_OnEntryReleased(r0_5)
  -- line: [71, 75] id: 5
  if r0_5.Content then
    r0_5.Content.Widget = nil
  end
end
function r0_0.SetIsSelected(r0_6, r1_6)
  -- line: [79, 89] id: 6
  r0_6.IsSelected = r1_6
  if r1_6 then
    r0_6:StopAllAnimations()
    r0_6:PlayAnimation(r0_6.Click)
  else
    r0_6:StopAnimation(r0_6.Click)
    r0_6:PlayAnimation(r0_6.Normal)
  end
  r0_6:FlushAnimations()
end
function r0_0.OnMouseEnter(r0_7, r1_7, r2_7, r3_7)
  -- line: [91, 99] id: 7
  if r0_7.IsSelected then
    return 
  end
  local r4_7 = CommonUtils.GetDeviceTypeByPlatformName(r0_7) == "Mobile"
  if r3_7 or not r4_7 then
    r0_7:PlayAnimationForward(r0_7.Hover)
  end
end
function r0_0.OnMouseLeave(r0_8, r1_8)
  -- line: [101, 107] id: 8
  if r0_8.IsSelected then
    return 
  end
  r0_8:StopAnimation(r0_8.Press)
  r0_8:PlayAnimationReverse(r0_8.Hover)
end
function r0_0.OnMouseButtonDown(r0_9, r1_9, r2_9)
  -- line: [109, 115] id: 9
  if r0_9.IsSelected then
    return UE4.UWidgetBlueprintLibrary.Unhandled()
  end
  r0_9:PlayAnimation(r0_9.Press)
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end
function r0_0.OnMouseButtonUp(r0_10, r1_10, r2_10)
  -- line: [117, 128] id: 10
  if r0_10.IsSelected then
    return UE4.UWidgetBlueprintLibrary.Unhandled()
  end
  if r0_10:IsHovered() then
    r0_10:OnMouseEnter(r1_10, r2_10, true)
  else
    r0_10:PlayAnimation(r0_10.Normal)
  end
  AudioManager(r0_10):PlayItemSound(r0_10, r0_10.Content.UnitId, "Click", r0_10.Content.Type)
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end
function r0_0.RecoverButton(r0_11, r1_11, r2_11)
  -- line: [130, 138] id: 11
  if r0_11.IsSelected then
    return UE4.UWidgetBlueprintLibrary.Unhandled()
  end
  r0_11:StopAllAnimations()
  r0_11:PlayAnimation(r0_11.Normal)
  r0_11:FlushAnimations()
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end
function r0_0.OnTouchStarted(r0_12, r1_12, r2_12)
  -- line: [140, 142] id: 12
  return r0_12:OnMouseButtonDown(r1_12, r2_12)
end
function r0_0.OnTouchEnded(r0_13, r1_13, r2_13)
  -- line: [144, 146] id: 13
  return r0_13:OnMouseButtonUp(r1_13, r2_13)
end
function r0_0.OnRemovedFromFocusPath(r0_14, r1_14, r2_14)
  -- line: [148, 150] id: 14
  return r0_14:RecoverButton(r1_14, r2_14)
end
return r0_0
