-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Armory\Widget\Appearance\WBP_Armory_AppearanceSubCell_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})
local r1_0 = {
  [6] = "Img_Quality_Red",
  [5] = "Img_Quality_Gold",
  [4] = "Img_Quality_Purple",
  [3] = "Img_Quality_Blue",
}
function r0_0.Construct(r0_1)
  -- line: [19, 26] id: 1
  r0_1.Button_Area.OnClicked:Clear()
  r0_1.Button_Area.OnHovered:Add(r0_1, r0_1.OnBtnHovered)
  r0_1.Button_Area.OnUnhovered:Add(r0_1, r0_1.OnBtnUnhovered)
  r0_1.Button_Area.OnPressed:Add(r0_1, r0_1.OnBtnPressed)
  r0_1.Button_Area.OnClicked:Add(r0_1, r0_1.OnClicked)
  r0_1.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
end
function r0_0.OnListItemObjectSet(r0_2, r1_2)
  -- line: [28, 44] id: 2
  r0_2.Content = r1_2
  r0_2.Owner = r1_2.Owner
  r0_2._OnAddedToFocusPath = r1_2.OnAddedToFocusPath
  r0_2._OnRemovedFromFocusPath = r1_2.OnRemovedFromFocusPath
  r0_2.Content.Entry = r0_2
  r0_2.IsPreviewMode = r1_2.IsPreviewMode
  r0_2.ItemId = r1_2.AccessoryId
  r0_2.TipType = r1_2.TipType
  r0_2.IsDressed = r1_2.IsDressed
  EMUIAnimationSubsystem:EMPlayAnimation(r0_2, r0_2.Normal)
  r0_2:SetIcon(r1_2.IconPath, r1_2.IsNoneIcon)
  r0_2:SetRarity(r1_2.Rarity)
  r0_2:SetReddot(r1_2.IsNew)
  r0_2.IsCharacterTrialMode = r1_2.IsCharacterTrialMode
  r0_2:InitButton()
end
function r0_0.BP_OnEntryReleased(r0_3)
  -- line: [46, 50] id: 3
  if r0_3.Content then
    r0_3.Content.Entry = nil
  end
end
function r0_0.OnClicked(r0_4)
  -- line: [52, 79] id: 4
  if r0_4.Content and r0_4.Content.OnClicked then
    if r0_4.IsPreviewMode then
      local r1_4 = {
        ItemType = r0_4.TipType,
        ItemId = r0_4.ItemId,
        bCustomStype = true,
      }
      if r0_4.Content.AccessoryId ~= DataMgr.GlobalConstant.EmptyCharAccessoryID.ConstantValue and r0_4.Content.AccessoryId ~= -1 and r0_4.ItemDetails_MenuAnchor then
        r0_4.ItemDetails_MenuAnchor.ParentWidget = r0_4
        r0_4.ItemDetails_MenuAnchor:OpenItemDetailsWidget(false, r1_4)
        r0_4:SetSelect()
      end
    else
      r0_4.Content.OnClicked(r0_4.Content.Owner)
      r0_4:SetSelect()
    end
    if r0_4.IsCharacterTrialMode then
      r0_4.Content.OnClicked(r0_4.Content.Owner)
      r0_4:SetSelect()
    end
  end
end
function r0_0.SetReddot(r0_5, r1_5)
  -- line: [81, 83] id: 5
  r0_5:SetIsNew(r1_5)
end
function r0_0.SetIsNew(r0_6, r1_6)
  -- line: [85, 91] id: 6
  if r1_6 then
    r0_6.New:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    r0_6.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end
function r0_0.SetIcon(r0_7, r1_7, r2_7)
  -- line: [93, 109] id: 7
  local r3_7 = r1_7 and LoadObject(r1_7)
  if r2_7 then
    r0_7.WS_Img:SetActiveWidgetIndex(1)
    if r3_7 then
      r0_7.Icon_Accessory:SetBrushResourceObject(r3_7)
    end
  else
    r0_7.WS_Img:SetActiveWidgetIndex(0)
    if r3_7 then
      local r4_7 = r0_7.Img_Accessory:GetDynamicMaterial()
      if r4_7 then
        r4_7:SetTextureParameterValue("IconMap", r3_7)
      end
    end
  end
end
function r0_0.SetRarity(r0_8, r1_8)
  -- line: [111, 115] id: 8
  if r1_0[r1_8] then
    r0_8.Img_Quality:SetBrush(r0_8[r1_0[r1_8]])
  end
end
function r0_0.InitButton(r0_9)
  -- line: [117, 127] id: 9
  if not r0_9.IsPreviewMode or r0_9.IsCharacterTrialMode then
    return 
  end
  local r1_9 = DataMgr.GlobalConstant.EmptyCharAccessoryID.ConstantValue
  if r0_9.Content.AccessoryId == nil or r0_9.Content.AccessoryId == r1_9 or r0_9.Content.AccessoryId == -1 then
    r0_9.Button_Area:SetIsEnabled(false)
  else
    r0_9.Button_Area:SetIsEnabled(true)
  end
end
function r0_0.SetSelect(r0_10)
  -- line: [129, 132] id: 10
  EMUIAnimationSubsystem:EMPlayAnimation(r0_10, r0_10.Click)
  r0_10.Content.IsSelect = true
end
function r0_0.SetUnSelect(r0_11)
  -- line: [134, 140] id: 11
  if EMUIAnimationSubsystem:EMAnimationIsPlaying(r0_11, r0_11.Click) then
    EMUIAnimationSubsystem:EMStopAnimation(r0_11, r0_11.Click)
  end
  EMUIAnimationSubsystem:EMPlayAnimation(r0_11, r0_11.Normal)
  r0_11.Content.IsSelect = false
end
function r0_0.OnBtnHovered(r0_12)
  -- line: [142, 151] id: 12
  if r0_12.Content.IsSelect then
    return 
  end
  if r0_12.CurInputDeviceType == ECommonInputType.Gamepad then
    r0_12:SetSelect()
  else
    EMUIAnimationSubsystem:EMPlayAnimation(r0_12, r0_12.Hover)
  end
end
function r0_0.OnBtnUnhovered(r0_13)
  -- line: [153, 158] id: 13
  if r0_13.Content.IsSelect then
    return 
  end
  EMUIAnimationSubsystem:EMPlayAnimation(r0_13, r0_13.UnHover)
end
function r0_0.OnBtnPressed(r0_14)
  -- line: [160, 165] id: 14
  if r0_14.Content.IsSelect then
    return 
  end
  EMUIAnimationSubsystem:EMPlayAnimation(r0_14, r0_14.Press)
end
function r0_0.OnAddedToFocusPath(r0_15)
  -- line: [167, 171] id: 15
  if r0_15._OnAddedToFocusPath then
    r0_15._OnAddedToFocusPath(r0_15.Owner, r0_15.Content)
  end
end
function r0_0.OnRemovedFromFocusPath(r0_16)
  -- line: [173, 177] id: 16
  if r0_16._OnRemovedFromFocusPath then
    r0_16._OnRemovedFromFocusPath(r0_16.Owner, r0_16.Content)
  end
end
return r0_0
