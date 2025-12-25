-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\UI_PC\Common\Common_ItemDetails\WBP_ItemDetails_MenuAnchor_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})
local r1_0 = 60
local r2_0 = nil
local r3_0 = UE4.UWidgetBlueprintLibrary.Unhandled()
function r0_0.OnMenuClose(r0_1)
  -- line: [17, 42] id: 1
  if r0_1.ParentWidget then
    if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad and r0_1.ParentWidget and r0_1.ParentWidget.Content and r0_1.ParentWidget.Content.bIsResetFocus then
      r0_1.ParentWidget:SetFocus()
    elseif r0_1.ParentWidget.Normal then
      r0_1.ParentWidget:PlayAnimation(r0_1.ParentWidget.Normal)
    end
    r0_1.ParentWidget.Content.IsShowTips = false
    r0_1.ParentWidget.Content.IsSelect = false
    r0_1.ParentWidget:StopAllAnimations()
    if r0_1.ParentWidget.VX_Loop then
      r0_1.ParentWidget.VX_Loop:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    if r0_1.ParentWidget.Item then
      r0_1.ParentWidget.Item:PlayAnimation(r0_1.ParentWidget.Item.Normal)
    end
  end
end
function r0_0.Construct(r0_2)
  -- line: [44, 60] id: 2
  r0_2:InitMenuOpenChangedListen()
  if CommonUtils.GetDeviceTypeByPlatformName(GWorld.GameInstance) == "PC" then
    r0_2.OriginPadding = FMargin(0)
    local r2_2 = r0_2.ItemDetailsMenuAnchor.ViewportPadding
    r0_2.OriginPadding.Top = r2_2.Top
    r0_2.OriginPadding.Bottom = r2_2.Bottom
    r0_2.OriginPadding.Left = r2_2.Left
    r0_2.OriginPadding.Right = r2_2.Right
    r2_2.Top = r2_2.Top + r1_0
    r2_2.Bottom = r2_2.Bottom + r1_0
    r0_2.ItemDetailsMenuAnchor:SetViewportPadding(r2_2)
  end
end
function r0_0.InitMenuOpenChangedListen(r0_3)
  -- line: [62, 64] id: 3
  r0_3.ItemDetailsMenuAnchor.OnMenuOpenChanged:Add(r0_3, r0_3.OnMenuOpenChanged)
end
function r0_0.ClearMenuOpenChangedListen(r0_4)
  -- line: [66, 68] id: 4
  r0_4.ItemDetailsMenuAnchor.OnMenuOpenChanged:Remove(r0_4, r0_4.OnMenuOpenChanged)
end
function r0_0.OnMenuOpenChanged(r0_5, r1_5)
  -- line: [70, 75] id: 5
  UIManager(r0_5):SetIsMenuAnchorOpen(r1_5)
  if not r1_5 then
    r0_5:OnMenuClose()
  end
end
function r0_0.Destruct(r0_6)
  -- line: [77, 85] id: 6
  r0_6:StopHoverTimer()
  if not r0_6.bMenuClosing then
    r0_6:CloseItemDetailsWidget(true)
  end
  r0_6.ItemDetailsMenuAnchor:SetViewportPadding(r0_6.OriginPadding)
end
function r0_0.InitializeSetUp(r0_7, r1_7, r2_7, r3_7)
  -- line: [89, 97] id: 7
  r0_7.ParentWidget = r1_7
  r0_7.Content = r2_7
  r0_7.bAllowHover = r3_7
  if r0_7.Content then
    r0_7.Content.ItemType = r0_7.Content.Type
    r0_7.Content.ItemId = r0_7.Content.UnitId
  end
end
function r0_0.SetConfirmDesc(r0_8, r1_8)
  -- line: [99, 103] id: 8
  if r0_8.Content then
    r0_8.Content.ConfirmDesc = r1_8
  end
end
function r0_0.ClearSetup(r0_9)
  -- line: [106, 108] id: 9
  r0_9.bAllowHover = nil
  r0_9.Content = nil
  r0_9.ParentWidget = nil
end
function r0_0.OnMouseEnter(r0_10, r1_10, r2_10)
  -- line: [110, 131] id: 10
  DebugPrint("Wbp_itemdetails_Menuanchor_c:: OnMouseEnter")
  if CommonUtils.GetDeviceTypeByPlatformName(GWorld.GameInstance) ~= "PC" then
    return 
  end
  if not r0_10.bAllowHover or not r0_10.Content then
    return 
  end
  local r4_10 = true
  if r0_10.Content.IsSelected ~= nil then
    r4_10 = r0_10.Content.IsSelected ~= true
  end
  if r0_10.ParentWidget.IsSelected ~= nil then
    r4_10 = r0_10.ParentWidget.IsSelected ~= true
  end
  r0_10:StopHoverTimer()
  local r5_10 = 0.15
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    r5_10 = 0.1
  end
  local r6_10, r7_10 = r0_10:AddTimer(r5_10, function()
    -- line: [127, 129] id: 11
    r0_10:OpenItemDetailsWidget(r4_10)
  end, false, 0, nil, true)
  r2_0 = r7_10
end
function r0_0.OnMouseLeave(r0_12, r1_12)
  -- line: [133, 142] id: 12
  if CommonUtils.GetDeviceTypeByPlatformName(GWorld.GameInstance) ~= "PC" then
    return 
  end
  r0_12:StopHoverTimer()
  if not r0_12.bAllowHover or not r0_12.Content then
    return 
  end
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    return 
  end
  r0_12:CloseItemDetailsWidget()
end
function r0_0.StopHoverTimer(r0_13)
  -- line: [151, 156] id: 13
  if r0_13:IsExistTimer(r2_0) then
    r0_13:RemoveTimer(r2_0)
  end
  r2_0 = nil
end
function r0_0.OpenItemDetailsWidget(r0_14, r1_14, r2_14)
  -- line: [161, 189] id: 14
  DebugPrint("ItemDetails_MenuAnchor:: OpenItemDetailsWidget")
  if r0_14.Content then
    r2_14 = r0_14.Content
  end
  if not r2_14 then
    return 
  end
  if not r2_14.IsShowDetails and r0_14.Content then
    return 
  end
  if not r1_14 and r2_14.bDontOpenTipsWhenClick then
    return 
  end
  if r0_14.bAllowRetain and r0_14.ItemDetailsMenuAnchor:IsOpen() then
    return 
  end
  r2_14.bIsHoverState = r1_14
  if r2_14.MenuPlacement then
    r0_14.ItemDetailsMenuAnchor:SetPlacement(r2_14.MenuPlacement)
  end
  if r0_14.IsRevertShear then
    local r3_14 = r0_14.ItemDetailsMenuAnchor.RenderTransform
    r3_14.Shear.X = -r0_14.RenderTransform.Shear.X
    r0_14.ItemDetailsMenuAnchor:SetRenderTransform(r3_14)
  end
  r0_14.ItemDetailsMenuAnchor:Open(not r1_14)
  if r0_14.CommonItemDetails then
    r0_14.CommonItemDetails.Parent = r0_14.ItemDetailsMenuAnchor
    r0_14.CommonItemDetails.ParentWidget = r0_14
    if r0_14.ParentWidget then
      r0_14.CommonItemDetails.UIName = r0_14.ParentWidget.UIName
    end
    r0_14.CommonItemDetails:RefreshItemInfo(r2_14)
  end
end
function r0_0.ExecuteOnGuideTouchOpen(r0_15)
  -- line: [191, 198] id: 15
  r0_15.OriginbAllowHover = r0_15.bAllowHover
  r0_15.bAllowHover = false
  r0_15.bGuideState = true
  if r0_15.ItemDetailsMenuAnchor.SetUseApplicationMenuStack then
    r0_15.ItemDetailsMenuAnchor:SetUseApplicationMenuStack(false)
  end
end
function r0_0.ExecuteOnGuideTouchClose(r0_16)
  -- line: [200, 202] id: 16
  r0_16:OpenItemDetailsWidget(false)
end
function r0_0.CloseItemDetailsWidget(r0_17, r1_17)
  -- line: [205, 221] id: 17
  r0_17.bMenuClosing = true
  if not r0_17.ItemDetailsMenuAnchor:IsOpen() then
    return 
  end
  if r0_17.bAllowRetain and not r1_17 then
    return 
  end
  r0_17.ItemDetailsMenuAnchor:Close()
  if r0_17.LastFocusWidget then
    r0_17.LastFocusWidget:SetFocus()
  end
  if r0_17.bGuideState then
    if r0_17.ItemDetailsMenuAnchor.SetUseApplicationMenuStack then
      r0_17.ItemDetailsMenuAnchor:SetUseApplicationMenuStack(true)
    end
    r0_17.bGuideState = nil
    r0_17.bAllowHover = r0_17.OriginbAllowHover
  end
end
function r0_0.SetLastFocusWidget(r0_18, r1_18)
  -- line: [224, 226] id: 18
  r0_18.LastFocusWidget = r1_18
end
function r0_0.SetAllowRetain(r0_19, r1_19)
  -- line: [229, 231] id: 19
  r0_19.bAllowRetain = r1_19
end
function r0_0.SetRevertShear(r0_20, r1_20)
  -- line: [234, 236] id: 20
  r0_20.IsRevertShear = r1_20
end
function r0_0.SetAllowHover(r0_21, r1_21)
  -- line: [238, 241] id: 21
  r0_21.bAllowHover = r1_21
  r0_21:StopHoverTimer()
end
return r0_0
