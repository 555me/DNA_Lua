-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Activity\Widget\Theater\WBP_Activity_Theater_Btn_Item01_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})
function r0_0.Construct(r0_1)
  -- line: [13, 17] id: 1
  r0_1.Btn_item.OnClicked:Add(r0_1, r0_1.OnBtnItemClicked)
  r0_1.Btn_Item.OnHovered:Add(r0_1, r0_1.OnBtnItemHovered)
  r0_1.Btn_Item.OnUnhovered:Add(r0_1, r0_1.OnBtnItemUnhovered)
end
function r0_0.OnListItemObjectSet(r0_2, r1_2)
  -- line: [19, 38] id: 2
  r0_2.Content = r1_2
  r0_2.ParentWidget = r1_2.ParentWidget
  r0_2.Text_num_nor:SetText(r1_2.Index)
  r0_2.Content.UI = r0_2
  if r1_2.IsLock then
    r0_2:PlayAnimation(r0_2.Lock)
  else
    r0_2:PlayAnimation(r0_2.Lock_Normal)
  end
  if r1_2.IsDone then
    r0_2.panel_check:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    r0_2.panel_check:SetVisibility(ESlateVisibility.Collapsed)
  end
  if r1_2.IsSelected then
    r0_2:PlayAnimation(r0_2.Click)
    r0_2:SetFocus()
  end
end
function r0_0.OnBtnItemHovered(r0_3)
  -- line: [40, 49] id: 3
  if r0_3.ParentWidget.SelectedIndex == r0_3.Content.Index then
    return 
  end
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    r0_3:OnBtnItemClicked()
    return 
  end
  r0_3:PlayAnimation(r0_3.Hover)
end
function r0_0.OnBtnItemUnhovered(r0_4)
  -- line: [51, 56] id: 4
  if r0_4.ParentWidget.SelectedIndex == r0_4.Content.Index then
    return 
  end
  r0_4:PlayAnimation(r0_4.Unhover)
end
function r0_0.OnBtnItemClicked(r0_5)
  -- line: [58, 61] id: 5
  r0_5.ParentWidget:OnBtnItemClicked(r0_5.Content.Index)
  AudioManager(r0_5):PlayUISound(r0_5, "event:/ui/common/click_btn_confirm", nil, nil)
end
function r0_0.StopAllRegularAnimations(r0_6)
  -- line: [63, 68] id: 6
  r0_6:StopAnimation(r0_6.Hover)
  r0_6:StopAnimation(r0_6.Unhover)
  r0_6:StopAnimation(r0_6.Click)
  r0_6:StopAnimation(r0_6.Normal)
end
return r0_0
