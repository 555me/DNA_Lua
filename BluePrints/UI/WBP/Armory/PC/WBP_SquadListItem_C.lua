-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Armory\PC\WBP_SquadListItem_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = CommonUtils.GetDeviceTypeByPlatformName(GWorld.GameInstance)
local r1_0 = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr",
  "BluePrints.Common.DelayFrameComponent"
})
r1_0._components = {
  "BluePrints.UI.WBP.Abyss.MainComponent.Abyss_CharMainComponent"
}
local r2_0 = UE.UWidgetBlueprintLibrary.Handled()
local r3_0 = UE.UWidgetBlueprintLibrary.UnHandled()
function r1_0.Init(r0_1)
  -- line: [33, 67] id: 1
  r0_1:SwitchItemType()
  r0_1:InitBtn()
  if not r0_1.IsAddSquad then
    r0_1:InitItem()
    r0_1.Btn_Add:SetVisibility(ESlateVisibility.Collapsed)
  else
    r0_1.Btn_Add:SetVisibility(ESlateVisibility.Visible)
  end
  r0_1:HideAllArrow()
  r0_1:CheckSortIcon()
  r0_1:UnbindAllFromAnimationFinished(r0_1.Click)
  r0_1:BindToAnimationFinished(r0_1.Click, {
    r0_1,
    function()
      -- line: [47, 49] id: 2
      r0_1.ClickCallback(r0_1.Owner, r0_1.Index)
    end
  })
  if r0_1.Owner.IsDraging and r0_1.Owner.CurSelectSquadIndex == r0_1.Index then
    r0_1.Owner:HideOrShowItemInDraging(r0_1.Owner.CurSelectSquadIndex)
  end
  if not r0_1.Owner.IsDraging then
    if r0_1.IsSelect then
      r0_1:PlayAnimation(r0_1.Select)
      r0_1.Melee:PlayAnimation(r0_1.Melee.Click)
      r0_1.Ranged:PlayAnimation(r0_1.Ranged.Click)
    else
      r0_1:PlayAnimation(r0_1.Normal)
      r0_1.Melee:PlayAnimation(r0_1.Melee.Normal)
      r0_1.Ranged:PlayAnimation(r0_1.Ranged.Normal)
    end
  end
end
function r1_0.OnListItemObjectSet(r0_3, r1_3)
  -- line: [69, 82] id: 3
  r0_3.Content = r1_3
  r0_3.Content.SelfWidget = r0_3
  r0_3.SquadInfo = r1_3.SquadInfo
  r0_3.IsNeedSort = r1_3.IsNeedSort
  r0_3.ClickCallback = r1_3.ClickCallback
  r0_3.Owner = r1_3.Owner
  r0_3.IsAddSquad = r1_3.IsAddSquad
  local r2_3 = r0_3.IsAddSquad
  if r2_3 then
    r2_3 = r0_3.Owner.SquadMax and r1_3.Index
  else
    goto label_20	-- block#2 is visited secondly
  end
  r0_3.Index = r2_3
  r0_3.IsSelect = r0_3.Owner.CurSelectSquadIndex == r0_3.Index
  r0_3.FakeIndex = r0_3.Index
  r0_3:Init()
  r0_3:PlayAnimation(r0_3.ResetPos)
end
function r1_0.SetIndex(r0_4, r1_4)
  -- line: [84, 86] id: 4
  r0_4.FakeIndex = r1_4
end
function r1_0.SwitchItemType(r0_5)
  -- line: [89, 98] id: 5
  if r0_5.IsAddSquad then
    r0_5.Panel_Normal:SetVisibility(ESlateVisibility.Collapsed)
    r0_5.Panel_Add:SetVisibility(ESlateVisibility.Visible)
    r0_5.Frame_Black:SetVisibility(ESlateVisibility.Collapsed)
  else
    r0_5.Panel_Add:SetVisibility(ESlateVisibility.Collapsed)
    r0_5.Panel_Normal:SetVisibility(ESlateVisibility.Visible)
  end
end
function r1_0.InitItem(r0_6)
  -- line: [101, 121] id: 6
  local r1_6 = ""
  if r0_6.SquadInfo.Name and r0_6.SquadInfo.Name ~= "" then
    r1_6 = r0_6.SquadInfo.Name
  else
    r1_6 = GText("Squad_DefaultName1")
  end
  r0_6.Text_Name:SetText(r1_6)
  local r2_6 = r0_6.SquadInfo.CharId
  local r3_6 = r0_6.Icon_Avatar:GetDynamicMaterial()
  if r3_6 and r2_6 then
    r3_6:SetTextureParameterValue("MainTex", LoadObject(DataMgr.Char[r2_6].Icon))
  end
  r0_6.Melee:InitInfo(r0_6.SquadInfo.MeleeWeaponId)
  r0_6.Ranged:InitInfo(r0_6.SquadInfo.RangedWeaponId)
end
function r1_0.HideOrShowItemUIInfo(r0_7, r1_7)
  -- line: [123, 147] id: 7
  if r1_7 then
    r0_7.Pattern:SetVisibility(ESlateVisibility.Visible)
    r0_7.BG:SetVisibility(ESlateVisibility.Visible)
    r0_7.Frame_Black:SetVisibility(ESlateVisibility.Visible)
    r0_7.Panel_Normal:SetVisibility(ESlateVisibility.Visible)
    r0_7.Avatar:SetVisibility(ESlateVisibility.Visible)
    if r0_7.Owner then
      for r7_7, r8_7 in pairs(r0_7.Panel_Normal:GetAllChildren():ToTable()) do
        if r8_7:GetName() ~= "Arrow_Up" and r8_7:GetName() ~= "Arrow_Down" and r8_7:GetName() ~= "Icon_Warning" and r8_7:GetName() ~= "Panel_Selected" then
          r8_7:SetVisibility(ESlateVisibility.Visible)
        end
      end
      -- close: r3_7
    end
  else
    r0_7.Pattern:SetVisibility(ESlateVisibility.Collapsed)
    r0_7.BG:SetVisibility(ESlateVisibility.Collapsed)
    r0_7.Frame_Black:SetVisibility(ESlateVisibility.Collapsed)
    r0_7.Panel_Normal:SetVisibility(ESlateVisibility.Collapsed)
  end
  r0_7:PlayAnimation(r0_7.Normal)
end
function r1_0.CheckSortIcon(r0_8)
  -- line: [149, 158] id: 8
  local r1_8 = r0_8.Index
  if r1_8 == r0_8.Owner.CurSelectSquadIndex then
    r1_8 = r0_8.Owner.SquadListLen > 1
  else
    goto label_9	-- block#2 is visited secondly
  end
  r0_8.IsNeedSort = r1_8
  if r0_8.IsNeedSort then
    r0_8.Icon_Sort:SetRenderOpacity(1)
    r0_8.Icon_Sort:SetVisibility(ESlateVisibility.Visible)
  else
    r0_8.Icon_Sort:SetRenderOpacity(0)
    r0_8.Icon_Sort:SetVisibility(ESlateVisibility.Collapsed)
  end
end
function r1_0.PlayUpArrowAnimation(r0_9)
  -- line: [161, 164] id: 9
  r0_9.Arrow_Up:SetVisibility(ESlateVisibility.Visible)
end
function r1_0.PlayDownArrowAnimation(r0_10)
  -- line: [167, 170] id: 10
  r0_10.Arrow_Down:SetVisibility(ESlateVisibility.Visible)
end
function r1_0.OnlyShowUpArrow(r0_11)
  -- line: [173, 176] id: 11
  r0_11.Arrow_Up:SetVisibility(ESlateVisibility.Visible)
  r0_11.Arrow_Down:SetVisibility(ESlateVisibility.Collapsed)
end
function r1_0.OnlyShowDownArrow(r0_12)
  -- line: [179, 182] id: 12
  r0_12.Arrow_Up:SetVisibility(ESlateVisibility.Collapsed)
  r0_12.Arrow_Down:SetVisibility(ESlateVisibility.Visible)
end
function r1_0.ShowAllArrow(r0_13)
  -- line: [185, 188] id: 13
  r0_13.Arrow_Down:SetVisibility(ESlateVisibility.Visible)
  r0_13.Arrow_Up:SetVisibility(ESlateVisibility.Visible)
end
function r1_0.HideAllArrow(r0_14)
  -- line: [191, 194] id: 14
  r0_14.Arrow_Down:SetVisibility(ESlateVisibility.Collapsed)
  r0_14.Arrow_Up:SetVisibility(ESlateVisibility.Collapsed)
end
function r1_0.InitBtn(r0_15)
  -- line: [197, 216] id: 15
  if r0_15.IsAddSquad then
    r0_15.Btn_Add.OnClicked:Clear()
    r0_15.Btn_Add.OnPressed:Clear()
    r0_15.Btn_Add.OnHovered:Clear()
    r0_15.Btn_Add.OnUnhovered:Clear()
    r0_15.Btn_Add.OnClicked:Add(r0_15, r0_15.OnBtnAddClicked)
    r0_15.Btn_Add.OnPressed:Add(r0_15, r0_15.OnBtnAddPressed)
    r0_15.Btn_Add.OnHovered:Add(r0_15, r0_15.OnBtnAddHovered)
    r0_15.Btn_Add.OnUnhovered:Add(r0_15, r0_15.OnBtnAddUnhovered)
    r0_15:PlayAnimation(r0_15.Add_Normal)
  end
end
function r1_0.MoveUp(r0_16)
  -- line: [221, 231] id: 16
  local r1_16 = r0_16.Index - r0_16.FakeIndex
  if r1_16 >= 0 then
    r0_16:PlayAnimation(r0_16["Offset_Up_" .. r1_16])
    DebugPrint("MoveUp: Offset_Up_   ", r1_16, r0_16.FakeIndex, r0_16.Index, r0_16.SquadInfo.CharId)
  else
    r1_16 = math.abs(r1_16) + -1
    r0_16:PlayAnimation(r0_16["Offset_Down_" .. r1_16], 0, 1, EUMGSequencePlayMode.Reverse)
    DebugPrint("MoveUp:   Offset_Down_    ", r1_16, r0_16.FakeIndex, r0_16.Index, r0_16.SquadInfo.CharId)
  end
end
function r1_0.MoveDown(r0_17)
  -- line: [234, 245] id: 17
  local r1_17 = r0_17.Index - r0_17.FakeIndex
  if r1_17 <= 0 then
    r1_17 = math.abs(r1_17)
    r0_17:PlayAnimation(r0_17["Offset_Down_" .. r1_17])
    DebugPrint("MoveDown: Offset_Down_", r1_17, r0_17.FakeIndex, r0_17.Index, r0_17.SquadInfo.CharId)
  else
    r1_17 = r1_17 + -1
    r0_17:PlayAnimation(r0_17["Offset_Up_" .. r1_17], 0, 1, EUMGSequencePlayMode.Reverse)
    DebugPrint("MoveDown: Offset_Up_   ", r1_17, r0_17.FakeIndex, r0_17.Index, r0_17.SquadInfo.CharId)
  end
end
function r1_0.OnBtnAddClicked(r0_18)
  -- line: [248, 254] id: 18
  r0_18:PlayAnimation(r0_18.Add_Click)
  if r0_18.ClickCallback then
    AudioManager(r0_18):PlayUISound(nil, "event:/ui/common/click_btn_large", nil, nil)
    r0_18.ClickCallback(r0_18.Owner)
  end
end
function r1_0.OnBtnAddPressed(r0_19)
  -- line: [255, 257] id: 19
  r0_19:PlayAnimation(r0_19.Add_Press)
end
function r1_0.OnBtnAddHovered(r0_20)
  -- line: [258, 260] id: 20
  r0_20:PlayAnimation(r0_20.Add_Hover)
end
function r1_0.OnBtnAddUnhovered(r0_21)
  -- line: [261, 263] id: 21
  r0_21:PlayAnimation(r0_21.Add_UnHover)
end
function r1_0.OnMouseButtonDown(r0_22, r1_22, r2_22)
  -- line: [289, 324] id: 22
  if r0_22.Owner.CurInputDeviceType == ECommonInputType.Touch then
    return r2_0
  end
  r0_22.bClickBegin = true
  if not r0_22.IsAddSquad then
    AudioManager(r0_22):PlayUISound(nil, "event:/ui/common/click_btn_large", nil, nil)
  end
  if r0_22.Owner.CurSelectSquadIndex ~= r0_22.Index then
    r0_22:PlayAnimation(r0_22.Press)
  end
  if r0_22.IsNeedSort and r0_22.Owner.CurSelectSquadIndex == r0_22.Index then
    r0_22.IsPressingItem = true
    r0_22.StartDrag = false
    r0_22.StartDragCountDown = r0_22.StartDragTime
    r0_22:AddTimer(0.1, function()
      -- line: [307, 319] id: 23
      if not r0_22.IsPressingItem then
        DebugPrint("OnDragDetected fail")
        r0_22:RemoveTimer("DragDelay")
        return r3_0
      end
      r0_22.StartDragCountDown = math.max(r0_22.StartDragCountDown - 0.1, 0)
      if r0_22.StartDragCountDown <= 0 then
        r0_22.StartDrag = true
        r0_22:CheckArrowState()
        r0_22:RemoveTimer("DragDelay")
      end
    end, true, 0, "DragDelay", true)
  end
  return UE4.UWidgetBlueprintLibrary.CaptureMouse(UE.UWidgetBlueprintLibrary.DetectDragIfPressed(r2_22, r0_22, UE.EKeys.LeftMouseButton), r0_22)
end
function r1_0.OnMouseButtonUp(r0_24, r1_24, r2_24)
  -- line: [326, 342] id: 24
  if r0_24.Owner.CurInputDeviceType == ECommonInputType.Touch then
    return r2_0
  end
  r0_24.Owner:GetSquadWidgetInSquadList(r0_24.Owner.CurSelectSquadIndex):HideAllArrow()
  if not r0_24.bClickBegin then
    return r2_0
  end
  r0_24.bClickBegin = false
  if r0_24.Owner.CurSelectSquadIndex ~= r0_24.Index then
    r0_24.Owner:SelectCurSquadInSquadList(r0_24.Index)
  end
  r0_24.Owner.IsNeedPlayRefresh = true
  r0_24.IsPressingItem = false
  return r2_0
end
function r1_0.OnMouseMove(r0_25, r1_25, r2_25)
  -- line: [344, 353] id: 25
  if r0_25.Owner.IsDraging then
  end
  if r0_25.Owner.CurInputDeviceType == ECommonInputType.Touch then
    return r2_0
  end
  return UE4.UWidgetBlueprintLibrary.ReleaseMouseCapture(UE4.UWidgetBlueprintLibrary.DetectDragIfPressed(r2_25, r0_25, EKeys.LeftMouseButton))
end
function r1_0.OnMouseEnter(r0_26, r1_26, r2_26)
  -- line: [355, 365] id: 26
  if r0_26.Owner.IsDraging then
    return 
  end
  if r0_26.Owner.CurInputDeviceType == ECommonInputType.Touch then
    return r2_0
  end
  if not r0_26.IsSelect and r0_0 == "PC" then
    r0_26:PlayAnimation(r0_26.Hover)
  end
end
function r1_0.OnMouseLeave(r0_27, r1_27, r2_27)
  -- line: [367, 381] id: 27
  if r0_27.Owner.IsDraging then
  end
  if r0_27.Owner.CurInputDeviceType == ECommonInputType.Touch then
    return r2_0
  end
  r0_27.IsPressingItem = false
  if not r0_27.IsSelect and r0_0 == "PC" then
    r0_27:PlayAnimation(r0_27.UnHover)
  else
    r0_27:PlayAnimation(r0_27.Select)
  end
end
function r1_0.OnTouchStarted(r0_28, r1_28, r2_28)
  -- line: [385, 419] id: 28
  local r3_28 = UE.UWidgetBlueprintLibrary.DetectDragIfPressed(r2_28, r0_28, UE.FKey("Touch"))
  r0_28.bClickBegin = true
  if r0_28.Owner.CurSelectSquadIndex ~= r0_28.Index then
  end
  if r0_28.IsNeedSort and r0_28.Owner.CurSelectSquadIndex == r0_28.Index then
    r0_28.IsPressingItem = true
    r0_28.StartDrag = false
    r0_28.StartDragCountDown = r0_28.StartDragTime
    r0_28:AddTimer(0.1, function()
      -- line: [397, 415] id: 29
      if not r0_28.IsPressingItem then
        DebugPrint("OnDragDetected fail")
        r0_28:RemoveTimer("DragDelay")
        return 
      end
      DebugPrint("self.StartDragCountDown ", r0_28.StartDragCountDown)
      r0_28.StartDragCountDown = math.max(r0_28.StartDragCountDown - 0.1, 0)
      if r0_28.StartDragCountDown <= 0 then
        if r0_28.Owner.IsTouchMoving then
          r0_28:RemoveTimer("DragDelay")
          return 
        end
        r0_28.StartDrag = true
        DebugPrint("self.StartDragCountDown 0")
        r0_28:CheckArrowState()
        r0_28:RemoveTimer("DragDelay")
      end
    end, true, 0, "DragDelay", true)
  end
  return r3_28
end
function r1_0.OnTouchMoved(r0_30, r1_30, r2_30)
  -- line: [423, 436] id: 30
  local r3_30 = UE4.UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(PointerEvent)
  if not r0_30.Owner.PreMousPos then
    r0_30.Owner.PreMousPos = r3_30
  end
  if UKismetMathLibrary.Vector_Distance2D(r0_30.Owner.PreMousPos, r3_30) > 10 then
    r0_30.Owner.IsTouchMoving = true
  else
    r0_30.Owner.IsTouchMoving = false
  end
  r0_30.Owner.PreMousPos = r3_30
  return r2_0
end
function r1_0.OnTouchEnded(r0_31, r1_31, r2_31)
  -- line: [438, 453] id: 31
  DebugPrint("OnTouchEnded")
  r0_31.Owner.IsTouchMoving = false
  r0_31.Owner:GetSquadWidgetInSquadList(r0_31.Owner.CurSelectSquadIndex):HideAllArrow()
  if not r0_31.bClickBegin then
    return r2_0
  end
  r0_31.bClickBegin = false
  if r0_31.Owner.CurSelectSquadIndex ~= r0_31.Index then
    r0_31.Owner:SelectCurSquadInSquadList(r0_31.Index)
  end
  r0_31.IsPressingItem = false
  return r2_0
end
function r1_0.InitAsDragUI(r0_32, r1_32)
  -- line: [457, 486] id: 32
  r0_32.LinkWidgets = {}
  r0_32.ActiveLinkWidgets = {}
  r0_32.Panel_Add:SetVisibility(ESlateVisibility.Collapsed)
  for r7_32, r8_32 in pairs(r1_32.Panel_Normal:GetAllChildren():ToTable()) do
    r8_32:GetName()
    r8_32:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  -- close: r3_32
  r0_32.SquadInfo = r1_32.SquadInfo
  r0_32:InitItem()
  r0_32:HideOrShowItemUIInfo(true)
  r0_32:PlayAnimation(r0_32.Select)
  r0_32.Melee:PlayAnimation(r0_32.Melee.Click)
  r0_32.Ranged:PlayAnimation(r0_32.Ranged.Click)
  local r3_32 = r1_32.SquadInfo.CharId
  local r4_32 = r0_32.Icon_Avatar:GetDynamicMaterial()
  if r4_32 then
    r4_32:SetTextureParameterValue("IconMap", LoadObject(DataMgr.Char[r3_32].Icon))
  end
  r0_32.Text_Name:SetText(r1_32.SquadInfo.Name and GText("Squad_DefaultName1"))
  r0_32:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  r0_32:SetRenderScale(FVector2D(1, 1))
end
function r1_0.CreateDragUI(r0_33)
  -- line: [488, 492] id: 33
  local r1_33 = UIManager(r0_33):_CreateWidgetNew("SquadListItem")
  r1_33:InitAsDragUI(r0_33)
  return r1_33
end
function r1_0.OnDragDetected(r0_34, r1_34, r2_34)
  -- line: [494, 516] id: 34
  r0_34.Owner:GetSquadWidgetInSquadList(r0_34.Owner.CurSelectSquadIndex):HideAllArrow()
  if r0_34.Owner.CurSelectSquadIndex ~= r0_34.Index or not r0_34.StartDrag then
    return 
  end
  r0_34.bClickBegin = false
  r0_34.Owner.IsDraging = true
  local r3_34 = NewObject(UIUtils.GetCommonDragDropOperationClass())
  r3_34.DefaultDragVisual = r0_34:CreateDragUI()
  r3_34.Pivot = UE.EDragPivot.CenterCenter
  r3_34.Index = r0_34.Index
  r3_34.FakeIndex = r0_34.FakeIndex
  r3_34.Tag = "SquadListItem"
  r3_34.Payload = r0_34.Content
  r3_34.Owner = r0_34.Owner
  r0_34:HideOrShowItemUIInfo(false)
  r0_34.Owner:SwitchAddSquadItemVisibility(false)
  return r3_34
end
function r1_0.OnDragEnter(r0_35, r1_35, r2_35, r3_35)
  -- line: [519, 540] id: 35
  if r0_35.Owner.IsDraging then
  end
  if nil and not nil then
    goto label_7	-- block#2 is visited secondly
  end
  if r3_35.FakeIndex == 1 then
    r3_35.DefaultDragVisual:OnlyShowDownArrow()
    r3_35.DefaultDragVisual:PlayDownArrowAnimation()
  elseif r3_35.FakeIndex < r0_35.Owner.SquadListLen then
    r3_35.DefaultDragVisual:ShowAllArrow()
    r3_35.DefaultDragVisual:PlayUpArrowAnimation()
    r3_35.DefaultDragVisual:PlayDownArrowAnimation()
  else
    r3_35.DefaultDragVisual:OnlyShowUpArrow()
    r3_35.DefaultDragVisual:PlayUpArrowAnimation()
  end
  return true
end
function r1_0.OnDragLeave(r0_36, r1_36, r2_36)
  -- line: [543, 568] id: 36
  if r0_36.Owner.IsDraging then
  end
  if nil and not nil then
    goto label_7	-- block#2 is visited secondly
  end
  local r4_36 = UIManager(r0_36):GetUIObj("SquadMainUINew").List_Default:GetTickSpaceGeometry()
  local r5_36 = UE4.UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(r1_36)
  if r0_36.Offset then
    r5_36.X = r5_36.X + r0_36.Offset
  end
  if not UE4.USlateBlueprintLibrary.IsUnderLocation(r4_36, r5_36) then
    r2_36.DefaultDragVisual:SetVisibility(ESlateVisibility.Collapsed)
    r0_36.Owner.IsDraging = false
    r0_36.StartDrag = false
    r0_36.Owner.IsInSortState = false
    r0_36.Owner.IsOutBound = true
    r0_36:UpdateListView()
    r0_36.Owner:HideOrShowItemInDraging()
  end
  return true
end
function r1_0.OnDragCancelled(r0_37, r1_37, r2_37)
  -- line: [571, 583] id: 37
  r0_37.Owner.IsDraging = false
  r0_37.StartDrag = false
  r2_37.DefaultDragVisual:HideAllArrow()
  if not r0_37.Owner.IsOutBound then
    r0_37:UpdateListView()
    r0_37.Owner:HideOrShowItemInDraging()
  end
  r0_37.Owner.IsOutBound = false
  r0_37.Owner:SwitchAddSquadItemVisibility(true)
  return true
end
function r1_0.OnDrop(r0_38, r1_38, r2_38, r3_38)
  -- line: [586, 596] id: 38
  r0_38.Owner.IsDraging = false
  r0_38.StartDrag = false
  r3_38.DefaultDragVisual:HideAllArrow()
  r0_38.Owner:HideOrShowItemInDraging()
  r0_38.Owner:SwitchAddSquadItemVisibility(true)
  r0_38:UpdateListView()
  return true
end
function r1_0.OnDragOver(r0_39, r1_39, r2_39, r3_39)
  -- line: [599, 651] id: 39
  if not r0_39.Owner.IsDraging then
    return true
  end
  local r4_39 = r0_39.Owner.List_Default
  local r6_39 = USlateBlueprintLibrary.AbsoluteToLocal(r4_39:GetCachedGeometry(), UE4.UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(r2_39))
  local r7_39 = USlateBlueprintLibrary.GetLocalSize(r4_39:GetCachedGeometry())
  local r9_39 = r6_39.Y + r4_39:GetScrollOffset()
  local r10_39, r11_39 = r0_39:GetListViewSize(r4_39)
  local r13_39 = math.clamp(math.floor(r9_39 / r11_39), 0, r0_39.Owner.SquadListLen) + 1
  local r14_39 = r3_39.FakeIndex
  if r13_39 > 5 then
    r13_39 = r13_39 + -1
  end
  if math.abs(r14_39 - r13_39) == 1 then
    r0_39:ChangeTwoItemInListView(r4_39, r14_39, r13_39, r3_39)
  end
  if r3_39.FakeIndex == 1 then
    r3_39.DefaultDragVisual:OnlyShowDownArrow()
    r3_39.DefaultDragVisual:PlayDownArrowAnimation()
  elseif r3_39.FakeIndex < r3_39.Owner.SquadListLen then
    r3_39.DefaultDragVisual:ShowAllArrow()
    r3_39.DefaultDragVisual:PlayUpArrowAnimation()
    r3_39.DefaultDragVisual:PlayDownArrowAnimation()
  else
    r3_39.DefaultDragVisual:OnlyShowUpArrow()
    r3_39.DefaultDragVisual:PlayUpArrowAnimation()
  end
  return true
end
function r1_0.ChangeTwoItemInListView(r0_40, r1_40, r2_40, r3_40, r4_40)
  -- line: [654, 692] id: 40
  local r5_40 = r1_40:GetListItems()
  r3_40 = math.min(r3_40, r0_40.Owner.SquadMax)
  if r5_40[r3_40].IsAddSquad then
    return 
  end
  local r6_40 = r0_40.Owner:GetSquadContent(r2_40)
  local r7_40 = r0_40.Owner:GetSquadContent(r3_40)
  if r6_40 and r7_40 then
    DebugPrint("DragItem", r6_40.FakeIndex, r6_40.SquadInfo.CharId)
    DebugPrint("NewItem", r7_40.FakeIndex, r7_40.SquadInfo.CharId)
    if r2_40 < r3_40 then
      r6_40:MoveDown()
      r7_40:MoveUp()
    else
      r6_40:MoveUp()
      r7_40:MoveDown()
    end
    r6_40:SetIndex(r3_40)
    r7_40:SetIndex(r2_40)
  else
    DebugPrint("DragItem or NewItem is nil", r6_40, r7_40)
  end
  if r4_40 then
    r4_40.FakeIndex = r3_40
  end
  r0_40.Owner.CurSelectSquadIndex = r3_40
  GWorld:GetAvatar():SwitchSquad(nil, r0_40, r2_40, r3_40)
end
function r1_0.UpdateListView(r0_41)
  -- line: [694, 701] id: 41
  r0_41.Owner:PlayAnimation(r0_41.Owner.UpdateList)
  r0_41:AddDelayFrameFunc(function()
    -- line: [697, 700] id: 42
    r0_41.Owner:SwitchToSquadList(false)
  end, 8, "DelayUpdateListView")
end
function r1_0.GetListViewSize(r0_43, r1_43)
  -- line: [704, 717] id: 43
  local r2_43 = GWorld.GameInstance:GetGameUIManager()
  local r3_43 = r2_43:GetWidgetRenderSize(r1_43)
  local r4_43 = r1_43:GetParent()
  if r4_43:Cast(UScrollBox) then
    r3_43 = r2_43:GetWidgetRenderSize(r4_43)
  end
  r0_43.Offset = (r3_43.X - r2_43:GetWidgetRenderSize(r0_43.BG).X) / 2
  return r3_43.Y, r2_43:GetWidgetRenderSize(r0_43.BG).Y
end
function r1_0.GetItemRenderSizeXY(r0_44, r1_44)
  -- line: [719, 722] id: 44
  local r2_44 = GWorld.GameInstance:GetGameUIManager()
  return r2_44:GetWidgetRenderSize(r1_44).X, r2_44:GetWidgetRenderSize(r1_44).Y
end
function r1_0.CheckArrowState(r0_45)
  -- line: [728, 741] id: 45
  if r0_45.FakeIndex == 1 then
    r0_45:OnlyShowDownArrow()
    r0_45:PlayDownArrowAnimation()
  elseif r0_45.FakeIndex < r0_45.Owner.SquadListLen then
    r0_45:ShowAllArrow()
    r0_45:PlayUpArrowAnimation()
    r0_45:PlayDownArrowAnimation()
  else
    r0_45:OnlyShowUpArrow()
    r0_45:PlayUpArrowAnimation()
  end
end
function r1_0.OnFocusReceived(r0_46, r1_46, r2_46)
  -- line: [743, 770] id: 46
  if r0_46.Owner.CurInputDeviceType and r0_46.Owner.CurInputDeviceType == ECommonInputType.Gamepad then
    if r0_46.Owner.IsInSortState then
      r0_46.Owner:FocusOnSquadListInSortState()
      return r3_0
    else
      r0_46.Owner.IsOnlyPlayAnimation = false
      r0_46.Owner:SelectCurSquad(r0_46.Index)
      if r0_46.IsAddSquad then
        r0_46.Owner.IsAddSquadDefault = true
        r0_46.Owner:InitBottomTab(false, 2)
        r0_46.Owner.FocusInAddSquad = true
        return r3_0
      else
        r0_46.Owner.CurSelectSquadIndex = r0_46.Index
        r0_46.Owner:GetSquadWidgetInSquadList(r0_46.Owner.CurSelectSquadIndex):CheckSortIcon()
        if r0_46.Owner.IsAddSquadDefault then
          r0_46.Owner.IsAddSquadDefault = false
          r0_46.Owner:InitBottomTab(true, 2)
        end
        r0_46:CheckSortIcon()
        return r2_0
      end
    end
  end
  return r3_0
end
return r1_0
