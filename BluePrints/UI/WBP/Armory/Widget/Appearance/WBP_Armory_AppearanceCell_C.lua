-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Armory\Widget\Appearance\WBP_Armory_AppearanceCell_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})
r0_0._components = {
  "BluePrints.UI.BP_EMUserWidgetUtils_C"
}
local r1_0 = {
  [6] = "Img_Quality_Red",
  [5] = "Img_Quality_Gold",
  [4] = "Img_Quality_Purple",
  [3] = "Img_Quality_Blue",
}
function r0_0.Construct(r0_1)
  -- line: [24, 26] id: 1
  r0_1:PlayAnimation(r0_1.Stain_Out, 0, 1, 0, 1000)
end
function r0_0.OnListItemObjectSet(r0_2, r1_2)
  -- line: [34, 74] id: 2
  rawset(r1_2, "Widget", r0_2)
  rawset(r0_2, "Content", r1_2)
  rawset(r0_2, "Owner", r1_2.Owner)
  rawset(r0_2, "_OnAddedToFocusPath", r1_2.OnAddedToFocusPath)
  rawset(r0_2, "_OnRemovedFromFocusPath", r1_2.OnRemovedFromFocusPath)
  rawset(r0_2, "IsPreviewMode", r1_2.IsPreviewMode)
  rawset(r0_2, "bFormPersonalPage", r1_2.bFormPersonalPage)
  rawset(r0_2, "IsCharacterTrialMode", r1_2.IsCharacterTrialMode)
  rawset(r0_2, "IsTargetUnowned", r1_2.IsTargetUnowned)
  rawset(r0_2, "IsCurrentUse", r1_2.IsCurrentUse)
  rawset(r0_2, "bDyeable", r1_2.bDyeable)
  rawset(r0_2, "Type", r1_2.Type)
  rawset(r0_2, "ItemType", r1_2.ItemType)
  rawset(r0_2, "DyeInfos", r1_2.DyeInfos)
  rawset(r0_2, "DyePlanIndex", r1_2.DyePlanIndex)
  rawset(r0_2, "SpecialColor", r1_2.SpecialColor)
  rawset(r0_2, "ItemId", r1_2.ItemId)
  rawset(r0_2, "TipType", r1_2.TipType)
  rawset(r0_2, "LockType", r1_2.LockType)
  rawset(r0_2, "Rarity", r1_2.Rarity)
  rawset(r0_2, "NoState", r1_2.NoState)
  rawset(r0_2, "bHasGot", r1_2.bHasGot)
  EMUIAnimationSubsystem:EMPlayAnimation(r0_2, r0_2.Normal)
  if rawget(r1_2, "IsEmpty") then
    r0_2:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    r0_2.WS_State:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_2.WS_Img:SetActiveWidgetIndex(1)
  else
    r0_2:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r0_2.WS_State:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r0_2.WS_Img:SetActiveWidgetIndex(0)
  end
  r0_2:SetIcon(r1_2.IconPath)
  r0_2:SetDyeable(r1_2.bDyeable)
  r0_2:SetRarity(r1_2.Rarity)
  r0_2:InitTextStyle()
  r0_2:SetIsNew(r1_2.IsNew)
  r0_2:SetIsSelected(r1_2.IsSelect)
end
function r0_0.SetReddot(r0_3, r1_3)
  -- line: [76, 78] id: 3
  r0_3:SetIsNew(r1_3)
end
function r0_0.SetIsNew(r0_4, r1_4)
  -- line: [80, 86] id: 4
  if r1_4 then
    r0_4.New:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    r0_4.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end
function r0_0.SetIsCurrentUse(r0_5, r1_5)
  -- line: [88, 91] id: 5
  r0_5.IsCurrentUse = r1_5
  r0_5:InitTextStyle()
end
function r0_0.SetRarity(r0_6, r1_6)
  -- line: [93, 97] id: 6
  if r1_0[r1_6] then
    r0_6.Img_Quality:SetBrush(r0_6[r1_0[r1_6]])
  end
end
function r0_0.InitTextStyle(r0_7)
  -- line: [99, 145] id: 7
  if r0_7.NoState then
    r0_7.WS_State:SetVisibility(UIConst.VisibilityOp.Collapsed)
    return 
  end
  if r0_7.ItemType == CommonConst.DataType.Skin then
    if r0_7.IsCurrentUse then
      r0_7.Text_Disable:SetText(GText("UI_Skin_NoChar"))
    else
      r0_7.Text_Disable:SetText(GText("UI_Skin_Forbid"))
    end
  elseif r0_7.IsCurrentUse then
    r0_7.Text_Disable:SetText(GText("UI_Skin_NoWeapon"))
  else
    r0_7.Text_Disable:SetText(GText("UI_Skin_Forbid"))
  end
  r0_7.WS_State:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  if r0_7.IsCurrentUse then
    if r0_7.IsCharacterTrialMode then
      r0_7.WS_State:SetActiveWidgetIndex(1)
      r0_7.Text_TryOut:SetText(GText("UI_CharPreview_Accessory_In_Trial"))
    elseif r0_7.IsTargetUnowned then
      r0_7.WS_State:SetActiveWidgetIndex(3)
    else
      r0_7.WS_State:SetActiveWidgetIndex(0)
    end
    r0_7:StopAnimation(r0_7.Lock)
    r0_7:PlayAnimation(r0_7.Locked_Normal)
  elseif r0_7.LockType then
    r0_7.WS_State:SetActiveWidgetIndex(2)
    r0_7:StopAnimation(r0_7.Locked_Normal)
    r0_7:PlayAnimation(r0_7.Lock)
  elseif r0_7.IsTargetUnowned then
    r0_7.WS_State:SetActiveWidgetIndex(3)
  elseif r0_7.bHasGot then
    r0_7.WS_State:SetActiveWidgetIndex(4)
    r0_7.Text_Have:SetText(GText("UI_SHOP_ALREADYOWNED"))
  else
    r0_7.WS_State:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_7:StopAnimation(r0_7.Lock)
    r0_7:PlayAnimation(r0_7.Locked_Normal)
  end
end
function r0_0.BP_OnEntryReleased(r0_8)
  -- line: [147, 151] id: 8
  if r0_8.Content then
    r0_8.Content.Widget = nil
  end
end
function r0_0.OnClicked(r0_9)
  -- line: [153, 178] id: 9
  if not r0_9.Content then
    return 
  end
  AudioManager(r0_9):PlayUISound(nil, "event:/ui/common/click_btn_large", nil, nil)
  if r0_9.Content and r0_9.Content.OnClicked then
    if r0_9.bFormPersonalPage then
      local r1_9 = {
        ItemType = r0_9.TipType,
        ItemId = r0_9.ItemId,
        bCustomStype = true,
      }
      if r0_9.ItemId ~= nil and r0_9.ItemId ~= -1 and r0_9.ItemDetails_MenuAnchor then
        r0_9.ItemDetails_MenuAnchor.ParentWidget = r0_9
        r0_9.ItemDetails_MenuAnchor:OpenItemDetailsWidget(false, r1_9)
      end
    else
      r0_9.Content.OnClicked(r0_9.Owner, r0_9.Content)
    end
  end
end
function r0_0.SetIcon(r0_10, r1_10)
  -- line: [180, 185] id: 10
  local r2_10 = r0_10.Img_Avatar:GetDynamicMaterial()
  if r2_10 and r1_10 then
    r2_10:SetTextureParameterValue("IconMap", LoadObject(r1_10))
  end
end
function r0_0.SetDyeable(r0_11, r1_11)
  -- line: [187, 193] id: 11
  if r1_11 then
    r0_11.Tag_Dye:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    r0_11.Tag_Dye:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end
function r0_0.InitPreviewView(r0_12)
  -- line: [196, 230] id: 12
  if not r0_12.bFormPersonalPage then
    return 
  end
  if r0_12.bDyeable then
    r0_12.DefaultColorId = DataMgr.GlobalConstant[r0_12.Type .. "DefaultColor"].ConstantValue
    if r0_12.SpecialColor ~= nil and DataMgr.SpecialSwatch[r0_12.SpecialColor] then
      r0_12.Image_SPDye:SetBrushResourceObject(LoadObject(DataMgr.SpecialSwatch[r0_12.SpecialColor].MaterialPath))
      r0_12.List_Color:SetVisibility(UIConst.VisibilityOp.Collapsed)
      r0_12.Image_SPDye:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    else
      r0_12.List_Color:ClearListItems()
      local r1_12 = nil
      if r0_12.DyeInfos == nil or r0_12.DyeInfos:Length() == 0 or r0_12.DyeInfos[r0_12.DyePlanIndex] == nil or r0_12.DyeInfos[r0_12.DyePlanIndex]:Length() == 0 then
        r1_12 = r0_12:CreateDefaultSkin().Colors
      else
        r1_12 = r0_12.DyeInfos[r0_12.DyePlanIndex]
      end
      for r6_12, r7_12 in ipairs(r1_12) do
        local r8_12 = NewObject(UIUtils.GetCommonItemContentClass())
        r8_12.ColorId = r7_12
        r0_12.List_Color:AddItem(r8_12)
      end
      -- close: r2_12
      r0_12.List_Color:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      r0_12.Image_SPDye:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  else
    r0_12.List_Color:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end
function r0_0.CreateDefaultSkin(r0_13)
  -- line: [233, 240] id: 13
  local r2_13 = {
    Colors = {},
    SpecialColor = r0_13.DefaultColorId,
  }
  for r6_13 = 1, DataMgr.GlobalConstant[r0_13.Type .. "ColorPart"].ConstantValue, 1 do
    r2_13.Colors[r6_13] = r0_13.DefaultColorId
  end
  return r2_13
end
function r0_0.OnAddedToFocusPath(r0_14)
  -- line: [242, 246] id: 14
  if r0_14._OnAddedToFocusPath then
    r0_14._OnAddedToFocusPath(r0_14.Owner, r0_14.Content)
  end
end
function r0_0.OnRemovedFromFocusPath(r0_15)
  -- line: [248, 252] id: 15
  if r0_15._OnRemovedFromFocusPath then
    r0_15._OnRemovedFromFocusPath(r0_15.Owner, r0_15.Content)
  end
end
function r0_0.SetIsSelected(r0_16, r1_16)
  -- line: [254, 260] id: 16
  if r1_16 then
    r0_16:SetSelect()
  else
    r0_16:SetUnSelect()
  end
end
function r0_0.SetSelect(r0_17)
  -- line: [262, 269] id: 17
  if r0_17.IsPreviewMode then
    EMUIAnimationSubsystem:EMPlayAnimation(r0_17, r0_17.Select_Click)
  else
    EMUIAnimationSubsystem:EMStopAnimation(r0_17, r0_17.Normal)
    EMUIAnimationSubsystem:EMPlayAnimation(r0_17, r0_17.Click)
  end
end
function r0_0.SetUnSelect(r0_18)
  -- line: [271, 276] id: 18
  if EMUIAnimationSubsystem:EMAnimationIsPlaying(r0_18, r0_18.Click) then
    EMUIAnimationSubsystem:EMStopAnimation(r0_18, r0_18.Click)
  end
  EMUIAnimationSubsystem:EMPlayAnimation(r0_18, r0_18.Normal)
end
function r0_0.OnBtnHovered(r0_19)
  -- line: [278, 290] id: 19
  if not r0_19.Content or r0_19.Content.IsSelect then
    return 
  end
  if r0_19.CurInputDeviceType == ECommonInputType.Gamepad then
    r0_19:SetSelect()
  elseif r0_19.CurInputDeviceType == ECommonInputType.Touch then
    return 
  else
    AudioManager(r0_19):PlayUISound(nil, "event:/ui/common/hover_btn_large", nil, nil)
    EMUIAnimationSubsystem:EMPlayAnimation(r0_19, r0_19.Hover)
  end
end
function r0_0.OnBtnUnhovered(r0_20)
  -- line: [292, 300] id: 20
  if r0_20.Content.IsSelect then
    return 
  end
  if r0_20.CurInputDeviceType == ECommonInputType.Touch then
    return 
  end
  EMUIAnimationSubsystem:EMPlayAnimation(r0_20, r0_20.UnHover)
end
function r0_0.OnBtnReleased(r0_21)
  -- line: [302, 308] id: 21
  if r0_21.Content.IsSelect then
    return 
  end
  EMUIAnimationSubsystem:EMStopAnimation(r0_21, r0_21.Press)
  EMUIAnimationSubsystem:EMPlayAnimation(r0_21, r0_21.Normal)
end
function r0_0.OnBtnPressed(r0_22)
  -- line: [310, 315] id: 22
  if r0_22.Content.IsSelect then
    return 
  end
  EMUIAnimationSubsystem:EMPlayAnimation(r0_22, r0_22.Press)
end
function r0_0.OnFocusReceived(r0_23, r1_23, r2_23)
  -- line: [317, 319] id: 23
  return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), r0_23.Button_Area)
end
AssembleComponents(r0_0)
return r0_0
