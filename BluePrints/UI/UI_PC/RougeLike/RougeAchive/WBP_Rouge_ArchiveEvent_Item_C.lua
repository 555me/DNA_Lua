-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\UI_PC\RougeLike\RougeAchive\WBP_Rouge_ArchiveEvent_Item_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("BluePrints.UI.UI_PC.RougeLike.RougeAchive.RougeConst")
local r1_0 = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})
function r1_0.Construct(r0_1)
  -- line: [17, 22] id: 1
  r0_1.Btn_Click.OnClicked:Add(r0_1, r0_1.OnCellClicked)
  r0_1.Btn_Click.OnHovered:Add(r0_1, r0_1.OnCellHovered)
  r0_1.Btn_Click.OnUnhovered:Add(r0_1, r0_1.OnCellUnhovered)
  r0_1:SetNavRule()
end
function r1_0.SetNavRule(r0_2)
  -- line: [24, 29] id: 2
  r0_2:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  r0_2:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  r0_2.Btn_Click:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  r0_2.Btn_Click:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
end
function r1_0.OnListItemObjectSet(r0_3, r1_3)
  -- line: [31, 49] id: 3
  r0_3:SetNavRule()
  r0_3.IsNew = false
  r0_3.IsUnlocked = r1_3.IsUnlocked
  r0_3.Index = r1_3.Index
  r0_3.Data = r1_3.Data
  r0_3.UnlockNum = r1_3.UnlockNum
  r0_3.TotalNum = r1_3.TotalNum
  r0_3.SubItems = r1_3.SubItems
  r0_3.Parent = r1_3.Parent
  for r6_3, r7_3 in ipairs(r0_3.SubItems) do
    if r0_3.Parent.DataModel:CheckArchiveItemIsNew(r0_0.ArchiveType.Event, r7_3.ArchiveId) then
      r0_3.IsNew = true
    end
  end
  -- close: r2_3
  r0_3.IsSelected = r0_3.Parent.CurSelectIndex == r0_3.Index
  r0_3.Btn_Click:SetChecked(r0_3.IsSelected)
  r0_3:InitEventItem()
end
function r1_0.InitEventItem(r0_4)
  -- line: [51, 88] id: 4
  local r1_4 = r0_4.Data.Data.SeriesMainIcon
  if r1_4 then
    UE.UResourceLibrary.LoadObjectAsync(r0_4, r1_4, {
      r0_4,
      r1_0.OnEventBGIconLoadFinish
    })
  end
  local r2_4 = r0_4.Data.Data.SeriesName
  local r4_4 = string.format(GText("RLArchive_ID"), string.format("%03d", r0_4.Index + 1))
  r0_4.Text_EventIndex:SetText(r0_4.UnlockNum .. "/" .. r0_4.TotalNum)
  r0_4.Text_TitleNum:SetText(r4_4)
  if r0_4.IsNew then
    r0_4.New:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    r0_4.New:SetVisibility(ESlateVisibility.Collapsed)
  end
  if r0_4.IsUnlocked then
    r0_4.Text_Title:SetText(GText(r2_4))
    r0_4.Image_Lock:SetVisibility(ESlateVisibility.Collapsed)
  else
    r0_4.Text_Title:SetText(GText("RLArchive_UnlockEntry"))
    r0_4.Image_Lock:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  if r0_4.IsSelected then
    r0_4:PlayAnimation(r0_4.Select)
  else
    r0_4:PlayAnimation(r0_4.Normal_S)
  end
  if r0_4.IsUnlocked then
    if r0_4.TotalNum == r0_4.UnlockNum then
      r0_4:PlayAnimation(r0_4.Finish)
    else
      r0_4:PlayAnimation(r0_4.Normal)
    end
  else
    r0_4:PlayAnimation(r0_4.Forbidden)
  end
end
function r1_0.OnCellClicked(r0_5)
  -- line: [90, 94] id: 5
  r0_5.Parent:ChooseItem(r0_5.Index, r0_5)
  r0_5:PlayAnimation(r0_5.Select)
  AudioManager(r0_5):PlayUISound(r0_5, "event:/ui/roguelike/choose_point_btn_affix_click", nil, nil)
end
function r1_0.OnCellHovered(r0_6)
  -- line: [96, 101] id: 6
  if not r0_6.IsSelected then
    r0_6:PlayAnimation(r0_6.Hover)
    AudioManager(r0_6):PlayUISound(r0_6, "event:/ui/roguelike/choose_point_hover", nil, nil)
  end
end
function r1_0.OnCellUnhovered(r0_7)
  -- line: [103, 108] id: 7
  if not r0_7.IsSelected then
    r0_7:StopAnimation(r0_7.Hover)
    r0_7:PlayAnimation(r0_7.UnHover)
  end
end
function r1_0.BP_OnItemSelectionChanged(r0_8, r1_8)
  -- line: [110, 133] id: 8
  r0_8.IsSelected = r1_8
  if r1_8 then
    r0_8:PlayAnimation(r0_8.Select)
    for r6_8, r7_8 in ipairs(r0_8.SubItems) do
      if r7_8.IsUnlocked and r7_8.IsNew then
        r0_8.Parent.DataModel:MarkArchiveItemSeened(r0_0.ArchiveType.Event, r7_8.ArchiveId)
      end
    end
    -- close: r2_8
    if r0_8.IsNew then
      r0_8.IsNew = false
      r0_8.New:SetVisibility(ESlateVisibility.Collapsed)
    end
    r0_8.Parent.DataModel:UpdateArchiveReddot(r0_0.ArchiveType.Event)
    if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
      r0_8.Btn_Click:SetFocus()
    elseif r0_8.Parent.CurSelectIndex ~= r0_8.Index then
      r0_8.Parent:SelectItem(r0_8.Index)
    end
  else
    r0_8:PlayAnimation(r0_8.Unselect)
    r0_8.Btn_Click:SetChecked(false)
  end
end
function r1_0.OnEventBGIconLoadFinish(r0_9, r1_9)
  -- line: [135, 142] id: 9
  if IsValid(r0_9) and r1_9 then
    local r2_9 = r0_9.EventItem.Img_Icon:GetDynamicMaterial()
    local r3_9 = r0_9.EventItem.Img_Icon_Color:GetDynamicMaterial()
    r2_9:SetTextureParameterValue("IconMap", r1_9)
    r3_9:SetTextureParameterValue("DissolveTex", r1_9)
  end
end
return r1_0
