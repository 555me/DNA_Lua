-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\Shop\Widget\WBP_Shop_RecommendBanner_Item_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.BP_UIState_C",
  "BluePrints.Common.DelayFrameComponent"
})
function r0_0.Construct(r0_1)
  -- line: [17, 32] id: 1
  r0_1.Super.Construct(r0_1)
  r0_1.Btn_Click.OnPressed:Add(r0_1, r0_1.OnBtnPressed)
  r0_1.Btn_Click.OnReleased:Add(r0_1, r0_1.OnBtnReleased)
  r0_1.Btn_Click.OnClicked:Add(r0_1, r0_1.OnItemClick)
  r0_1.Btn_Click.OnHovered:Add(r0_1, r0_1.OnItemHovered)
  r0_1.Btn_Click.OnUnhovered:Add(r0_1, r0_1.OnItemUnhovered)
  r0_1.CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
  if r0_1.CurInputDeviceType == ECommonInputType.Touch then
    r0_1.Btn_Click:SetVisibility(ESlateVisibility.Collapsed)
  end
  r0_1.Key_Left:CreateGamepadKey(UIConst.GamePadImgKey.DPadLeft)
  r0_1.Key_Right:CreateGamepadKey(UIConst.GamePadImgKey.DPadRight)
end
function r0_0.Destruct(r0_2)
  -- line: [37, 42] id: 2
  r0_2.Super.Destruct(r0_2)
  r0_2.CurrentIndex = nil
  r0_2:CleanTimer()
  r0_2.ScrollboxIndex = 0
end
function r0_0.InitItemInfo(r0_3)
  -- line: [44, 82] id: 3
  r0_3.bSelected = false
  r0_3.SwitchBannerList = ShopUtils:GetBannerInfo(true)
  if not r0_3.SwitchBannerList or not next(r0_3.SwitchBannerList) then
    return 
  end
  r0_3.SwitchBannerIndexMap = {}
  r0_3.SwitchBannerBottomProgressMap = {}
  if not r0_3.CurrentIndex then
    r0_3.CurrentIndex = 1
  end
  r0_3:SetBannerItemIcon(r0_3.Image_ItemIcon01, r0_3.SwitchBannerList[r0_3.CurrentIndex].BannerIcon)
  r0_3:SetBannerItemIcon(r0_3.Image_ItemIcon02, r0_3.SwitchBannerList[r0_3.CurrentIndex].BannerIcon)
  r0_3:SetItemInfo()
  r0_3.List_Progress:ClearListItems()
  if #r0_3.SwitchBannerList > 1 then
    for r5_3, r6_3 in ipairs(r0_3.SwitchBannerList) do
      local r7_3 = NewObject(UIUtils.GetCommonItemContentClass())
      if r5_3 == r0_3.CurrentIndex then
        r7_3.NeedStartTick = true
      end
      r0_3.SwitchBannerIndexMap[r5_3] = r6_3
      r7_3.LastTime = r6_3.SwitchTime and 10
      r0_3.List_Progress:AddItem(r7_3)
      r0_3.SwitchBannerBottomProgressMap[r5_3] = r7_3
    end
    -- close: r1_3
    local r1_3 = UIManager(GWorld.GameInstance):GetUIObj("ShopMain")
    if r1_3 and not r1_3.ShowSwitchBanner then
      r0_3:AddTimer(r0_3.SwitchBannerList[r0_3.CurrentIndex].SwitchTime and 10, function()
        -- line: [76, 78] id: 4
        r0_3:SwitchBannerItem(nil, true, true)
      end, false, 0, "SwitchBannerPage", true)
    end
  end
end
function r0_0.StopBannerTimer(r0_5)
  -- line: [84, 86] id: 5
  r0_5:CleanTimer()
end
function r0_0.StartBannerTimer(r0_6)
  -- line: [88, 95] id: 6
  if not r0_6.SwitchBannerList or not next(r0_6.SwitchBannerList) then
    return 
  end
  r0_6:AddTimer(r0_6.SwitchBannerList[r0_6.CurrentIndex].SwitchTime and 10, function()
    -- line: [92, 94] id: 7
    r0_6:SwitchBannerItem(nil, true, true)
  end, false, 0, "SwitchBannerPage", true)
end
function r0_0.SetBannerItemIcon(r0_8, r1_8, r2_8)
  -- line: [100, 106] id: 8
  local r3_8 = r1_8:GetDynamicMaterial()
  if r3_8 then
    r3_8:SetTextureParameterValue("IconMap", LoadObject(r2_8))
  end
end
function r0_0.SwitchBannerItem(r0_9, r1_9, r2_9, r3_9)
  -- line: [114, 153] id: 9
  local r4_9 = #r0_9.SwitchBannerList
  if r0_9.CurrentIndex and r0_9.SwitchBannerBottomProgressMap[r0_9.CurrentIndex] and r0_9.SwitchBannerBottomProgressMap[r0_9.CurrentIndex].SelfWidget then
    r0_9.SwitchBannerBottomProgressMap[r0_9.CurrentIndex].SelfWidget:ResetItem()
  end
  if r1_9 then
    r0_9.CurrentIndex = r1_9
  elseif r2_9 then
    r0_9.CurrentIndex = r0_9.CurrentIndex % r4_9 + 1
  else
    r0_9.CurrentIndex = (r0_9.CurrentIndex + -2 + r4_9) % r4_9 + 1
  end
  r0_9:StopAllAnimations()
  if r2_9 then
    r0_9:PlayAnimation(r0_9.Change_LToR)
  else
    r0_9:PlayAnimation(r0_9.Change_RToL)
  end
  r0_9:RemoveTimer("SwitchBannerPage")
  local r5_9 = 10
  if r0_9.SwitchBannerIndexMap[r0_9.CurrentIndex] then
    r5_9 = r0_9.SwitchBannerIndexMap[r0_9.CurrentIndex].SwitchTime
    if r0_9.Func then
      r0_9.Func(r0_9.Obj, r0_9.SwitchBannerIndexMap[r0_9.CurrentIndex].Id, true, r2_9)
    end
  end
  local r6_9 = UIManager(GWorld.GameInstance):GetUIObj("ShopMain")
  if r6_9 and not r6_9.ShowSwitchBanner then
    r0_9:AddTimer(r5_9, function()
      -- line: [148, 150] id: 10
      r0_9:SwitchBannerItem(nil, true, true)
    end, false, 0, "SwitchBannerPage", true)
  end
end
function r0_0.SetItemInfo(r0_11)
  -- line: [155, 169] id: 11
  if r0_11.CurrentIndex then
    r0_11.Text_Title:SetText(GText(r0_11.SwitchBannerList[r0_11.CurrentIndex].Text1))
    if r0_11.SwitchBannerList[r0_11.CurrentIndex].MarkText then
      r0_11.Group_Sign:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      r0_11.Text_MoreNum:SetText(GText(r0_11.SwitchBannerList[r0_11.CurrentIndex].MarkText))
    else
      r0_11.Group_Sign:SetVisibility(ESlateVisibility.Hidden)
    end
    r0_11:SetBannerItemIcon(r0_11.Image_ItemIcon01, r0_11.SwitchBannerList[r0_11.CurrentIndex].BannerIcon)
    if r0_11.SwitchBannerBottomProgressMap[r0_11.CurrentIndex] and r0_11.SwitchBannerBottomProgressMap[r0_11.CurrentIndex].SelfWidget then
      r0_11.SwitchBannerBottomProgressMap[r0_11.CurrentIndex].SelfWidget:StartTick()
    end
  end
end
function r0_0.OnAnimationFinished(r0_12, r1_12)
  -- line: [171, 177] id: 12
  if (r1_12 == r0_12.Change_LToR or r1_12 == r0_12.Change_RToL) and r0_12.CurrentIndex then
    r0_12:SetBannerItemIcon(r0_12.Image_ItemIcon02, r0_12.SwitchBannerList[r0_12.CurrentIndex].BannerIcon)
  end
end
function r0_0.ClearAllTimer(r0_13)
  -- line: [179, 181] id: 13
  r0_13:CleanTimer()
end
function r0_0.BindBtnEvent(r0_14, r1_14, r2_14)
  -- line: [184, 187] id: 14
  r0_14.Obj = r1_14
  r0_14.Func = r2_14
end
function r0_0.BindBtnClickEvent(r0_15, r1_15, r2_15)
  -- line: [190, 193] id: 15
  r0_15.ClickObj = r1_15
  r0_15.ClickFunc = r2_15
end
function r0_0.OnItemClick(r0_16, r1_16, r2_16)
  -- line: [195, 213] id: 16
  if r0_16.bSelected then
    local r3_16 = UIManager(r0_16):GetUIObj("ShopMain")
    if r3_16 and r3_16.TabType == "Banner" and r3_16.SelectBannerId and r3_16.BannerIdMap and type(r3_16.BannerIdMap) == "table" then
      local r4_16 = r3_16.BannerIdMap[r3_16.SelectBannerId]
      if r4_16 and r4_16.HandlePreviewKeyDown and UIUtils.IsGamepadInput() then
        r4_16:HandlePreviewKeyDown(nil, Const.GamepadFaceButtonDown)
      end
    end
    return 
  end
  r0_16.bSelected = true
  r0_16:StopAllAnimations()
  r0_16:PlayAnimation(r0_16.Click)
  if r0_16.ClickObj then
    r0_16.ClickFunc(r0_16.ClickObj, r0_16.SwitchBannerIndexMap[r0_16.CurrentIndex].Id, r1_16, r2_16)
  end
end
function r0_0.OnItemHovered(r0_17)
  -- line: [215, 224] id: 17
  if r0_17.bSelected then
    return 
  end
  if UIUtils.IsMobileInput() then
    return 
  end
  r0_17:StopAllAnimations()
  r0_17:PlayAnimation(r0_17.Hover)
end
function r0_0.OnItemUnhovered(r0_18)
  -- line: [226, 235] id: 18
  if r0_18.bSelected then
    return 
  end
  if UIUtils.IsMobileInput() then
    return 
  end
  r0_18:StopAllAnimations()
  r0_18:PlayAnimation(r0_18.Unhover)
end
function r0_0.UnSelect(r0_19)
  -- line: [237, 241] id: 19
  r0_19.bSelected = false
  r0_19:StopAllAnimations()
  r0_19:PlayAnimation(r0_19.Normal)
end
function r0_0.OnBtnPressed(r0_20)
  -- line: [244, 251] id: 20
  if UIUtils.IsMobileInput() then
    return 
  end
  r0_20:PlayAnimation(r0_20.Press)
  r0_20.PressX = UWidgetLayoutLibrary.GetMousePositionOnPlatform().X
end
function r0_0.OnBtnReleased(r0_21)
  -- line: [253, 267] id: 21
  if r0_21:IsAnimationPlaying(r0_21.Change_LToR) or r0_21:IsAnimationPlaying(r0_21.Change_RToL) then
    return 
  end
  local r1_21 = UWidgetLayoutLibrary.GetMousePositionOnPlatform()
  if r0_21.PressX < r1_21.X then
    r0_21:SwitchBannerItem(nil, false, true)
    AudioManager(r0_21):PlayUISound(r0_21, "event:/ui/common/shop_banner_scroll", nil, nil)
  elseif r1_21.X < r0_21.PressX then
    r0_21:SwitchBannerItem(nil, true, true)
    AudioManager(r0_21):PlayUISound(r0_21, "event:/ui/common/shop_banner_scroll", nil, nil)
  else
    AudioManager(r0_21):PlayUISound(r0_21, "event:/ui/activity/large_btn_click", nil, nil)
  end
end
function r0_0.OnScrollBoxMouseButtonDown(r0_22, r1_22, r2_22)
  -- line: [269, 274] id: 22
  r0_22.PressX = UE4.USlateBlueprintLibrary.AbsoluteToLocal(r1_22, UE4.UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(r2_22)).X
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end
function r0_0.OnScrollBoxMouseButtonUp(r0_23, r1_23, r2_23)
  -- line: [277, 293] id: 23
  if r0_23:IsAnimationPlaying(r0_23.Change_LToR) or r0_23:IsAnimationPlaying(r0_23.Change_RToL) then
    return UE4.UWidgetBlueprintLibrary.Unhandled()
  end
  local r4_23 = UE4.USlateBlueprintLibrary.AbsoluteToLocal(r1_23, UE4.UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(r2_23))
  if r0_23.PressX < r4_23.X then
    r0_23:SwitchBannerItem(nil, false, true)
    AudioManager(r0_23):PlayUISound(r0_23, "event:/ui/common/shop_banner_scroll", nil, nil)
  elseif r4_23.X < r0_23.PressX then
    r0_23:SwitchBannerItem(nil, true, true)
    AudioManager(r0_23):PlayUISound(r0_23, "event:/ui/common/shop_banner_scroll", nil, nil)
  else
    AudioManager(r0_23):PlayUISound(r0_23, "event:/ui/activity/large_btn_click", nil, nil)
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end
function r0_0.OnTouchMoved(r0_24, r1_24, r2_24)
  -- line: [295, 297] id: 24
  return r0_24:OnScrollBoxMouseButtonUp(r1_24, r2_24)
end
function r0_0.OnFocusReceived(r0_25, r1_25, r2_25)
  -- line: [299, 319] id: 25
  if not UIUtils.IsGamepadInput() then
    r0_25:OnItemClick(false)
    return UIUtils.Handle
  end
  if r0_25.bSelected then
    return UIUtils.Handle
  end
  r0_25:OnItemClick()
  local r3_25 = UIManager(r0_25):GetUIObj("ShopMain")
  if r0_25.ScrollboxIndex == 0 then
    r0_25:AddDelayFrameFunc(function()
      -- line: [310, 314] id: 26
      DebugPrint("lgc@OnFocusReceived", r3_25.ScrollBox_Recommend:GetScrollOffset())
      if not r0_25 or not r3_25 or not r3_25.ScrollBox_Recommend then
        return 
      end
      r3_25.ScrollBox_Recommend:SetScrollOffset(0)
    end, 5, "DelaySetScrollOffset")
  elseif r3_25 and r3_25.ScrollBox_Recommend then
    r3_25.ScrollBox_Recommend:ScrollWidgetIntoView(r0_25, true, UE4.EDescendantScrollDestination.IntoView)
  end
  return UIUtils.Handle
end
function r0_0.OnUpdateUIStyleByInputTypeChange(r0_27, r1_27, r2_27)
  -- line: [322, 333] id: 27
  if r1_27 == ECommonInputType.Touch then
    return 
  end
  if r1_27 == ECommonInputType.Gamepad then
    r0_27:InitGamepadView()
  else
    r0_27:InitKeyboardView()
  end
end
function r0_0.OnRepeatKeyDown(r0_28, r1_28, r2_28)
  -- line: [335, 352] id: 28
  local r3_28 = UE4.UKismetInputLibrary.GetKey(r2_28)
  local r4_28 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_28)
  local r5_28 = false
  local r6_28 = UIManager(r0_28):GetUIObj("ShopMain")
  if r6_28 and r6_28.TabType == "Banner" and r6_28.SelectBannerId and r6_28.BannerIdMap and type(r6_28.BannerIdMap) == "table" then
    local r7_28 = r6_28.BannerIdMap[r6_28.SelectBannerId]
    if r7_28 and r7_28.HandleRepeatKeyDown and not r5_28 then
      r5_28 = r7_28:HandleRepeatKeyDown(r3_28, r4_28)
    end
  end
  if r5_28 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end
return r0_0
