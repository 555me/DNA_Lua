-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\Shop\Widget\WBP_Shop_Recommend_ListItem_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.DelayFrameComponent"
})
function r0_0.Construct(r0_1)
  -- line: [13, 18] id: 1
  r0_1.Btn_Click.OnClicked:Add(r0_1, r0_1.OnItemClick)
  r0_1.Btn_Click.OnHovered:Add(r0_1, r0_1.OnItemHovered)
  r0_1.Btn_Click.OnUnhovered:Add(r0_1, r0_1.OnItemUnhovered)
  r0_1.Btn_Click.OnPressed:Add(r0_1, r0_1.OnItemOnPressed)
end
function r0_0.OnListItemObjectSet(r0_2, r1_2)
  -- line: [27, 63] id: 2
  r0_2.Content = r1_2
  r0_2.Content.SelfWidget = r0_2
  r0_2.BannerId = r1_2.BannerId
  r0_2.VirtualClickCallback = r1_2.VirtualClickCallback
  r0_2.OnKeyDownCallBack = r1_2.OnKeyDownCallBack
  r0_2.SetListItemCallBack = r1_2.SetListItemCallBack
  r0_2.UpToSwitchWidget = r1_2.UpToSwitchWidget
  r0_2.Parent = r1_2.Parent
  r0_2.ScrollboxIndex = r1_2.ScrollboxIndex
  if r0_2.UpToSwitchWidget then
    r0_2:SetNavigationRuleExplicit(EUINavigation.Up, r0_2.UpToSwitchWidget)
  end
  local r2_2 = DataMgr.ShopBannerTab[r0_2.BannerId]
  assert(r2_2, "未找到对应的Banner页信息：" .. r0_2.BannerId)
  local r3_2 = LoadObject(r2_2.BannerIcon)
  assert(r3_2, "未找到Banner页对应的Icon:" .. r0_2.BannerId)
  r0_2.Text_Title:SetText(GText(r2_2.Text1))
  local r4_2 = r0_2.Image_ItemIcon:GetDynamicMaterial()
  if r4_2 then
    r4_2:SetTextureParameterValue("IconMap", r3_2)
  end
  if r2_2.MarkText then
    r0_2.Group_Sign:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_2.Text_MoreNum:SetText(GText(r2_2.MarkText))
  else
    r0_2.Group_Sign:SetVisibility(ESlateVisibility.Hidden)
  end
  r0_2:BindClickEvent(r1_2.ClickEvent)
  if r1_2.bSelected then
    r0_2:OnItemClick(nil, true)
  end
end
function r0_0.BindClickEvent(r0_3, r1_3)
  -- line: [65, 68] id: 3
  r0_3.ClickObj = r1_3.Obj
  r0_3.ClickCallback = r1_3.Callback
end
function r0_0.OnItemClick(r0_4, r1_4, r2_4)
  -- line: [70, 91] id: 4
  if r0_4.bSelected then
    if not r1_4 and type(r0_4.VirtualClickCallback) == "function" then
      r0_4.VirtualClickCallback(r0_4.Parent, r0_4.BannerId)
    end
    local r3_4 = UIManager(r0_4):GetUIObj("ShopMain")
    if r3_4 and r3_4.TabType == "Banner" and r3_4.SelectBannerId and r3_4.BannerIdMap and type(r3_4.BannerIdMap) == "table" then
      local r4_4 = r3_4.BannerIdMap[r3_4.SelectBannerId]
      if r4_4 and r4_4.HandlePreviewKeyDown and UIUtils.IsGamepadInput() then
        r4_4:HandlePreviewKeyDown(nil, Const.GamepadFaceButtonDown)
      end
    end
    return 
  end
  if not r0_4.ClickCallback then
    return 
  end
  r0_4.bSelected = true
  r0_4:StopAllAnimations()
  r0_4:PlayAnimation(r0_4.Click)
  r0_4.ClickCallback(r0_4.ClickObj, r0_4.BannerId, r0_4.Content, not r2_4)
end
function r0_0.OnItemHovered(r0_5)
  -- line: [93, 105] id: 5
  if r0_5.bSelected then
    return 
  end
  if UIUtils.IsMobileInput() then
    return 
  end
  r0_5:StopAllAnimations()
  r0_5:PlayAnimation(r0_5.Hover)
  if UIUtils.IsGamepadInput() then
    r0_5:OnItemClick(true)
  end
end
function r0_0.OnItemUnhovered(r0_6)
  -- line: [107, 116] id: 6
  if r0_6.bSelected then
    return 
  end
  if UIUtils.IsMobileInput() then
    return 
  end
  r0_6:StopAllAnimations()
  r0_6:PlayAnimation(r0_6.Unhover)
end
function r0_0.OnItemOnPressed(r0_7)
  -- line: [118, 127] id: 7
  if r0_7.bSelected then
    return 
  end
  if UIUtils.IsMobileInput() then
    return 
  end
  r0_7:StopAllAnimations()
  r0_7:PlayAnimation(r0_7.Press)
end
function r0_0.UnSelect(r0_8)
  -- line: [129, 133] id: 8
  r0_8.bSelected = false
  r0_8:StopAllAnimations()
  r0_8:PlayAnimation(r0_8.Normal)
end
function r0_0.OnFocusReceived(r0_9, r1_9, r2_9)
  -- line: [135, 158] id: 9
  if r0_9.bSelected and r0_9.Parent and r0_9.Parent.LastFocusScrollboxIndex == r0_9.ScrollboxIndex then
    return UIUtils.Handle
  end
  if not UIUtils.IsGamepadInput() then
    return UIUtils.Handle
  end
  if r0_9.Parent.LastFocusListItem and IsValid(r0_9.Parent.LastFocusListItem) then
    r0_9.Parent.LastFocusListItem:SetFocus()
  end
  r0_9.Parent.ScrollBox_Recommend:ScrollWidgetIntoView(r0_9, false, UE4.EDescendantScrollDestination.IntoView)
  r0_9:AddDelayFrameFunc(function()
    -- line: [146, 152] id: 10
    if not r0_9 then
      return 
    end
    r0_9.Parent.LastFocusScrollboxIndex = r0_9.ScrollboxIndex
    r0_9.Parent.LastFocusListItem = r0_9
    r0_9.Selected = true
    r0_9:SetFocus()
  end, 1, "DelaySetFocus")
  if r0_9.ScrollboxIndex == 0 then
    r0_9.Parent.ScrollBox_Recommend:SetScrollOffset(0)
  end
  return UIUtils.Handle
end
function r0_0.OnKeyDown(r0_11, r1_11, r2_11)
  -- line: [160, 167] id: 11
  r0_11.SetListItemCallBack(r0_11.Parent, r0_11.BannerId, r0_11)
  if r0_11.OnKeyDownCallBack then
    return r0_11.OnKeyDownCallBack(r0_11.Parent, r0_11.BannerId, r1_11, r2_11)
  end
  return UIUtils.UnHandled
end
return r0_0
