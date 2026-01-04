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
  -- line: [289, 321] id: 22
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
      -- line: [304, 316] id: 23
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
  -- line: [323, 336] id: 24
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
  -- line: [338, 344] id: 25
  if r0_25.Owner.IsDraging then
  end
  return UE4.UWidgetBlueprintLibrary.ReleaseMouseCapture(UE4.UWidgetBlueprintLibrary.DetectDragIfPressed(r2_25, r0_25, EKeys.LeftMouseButton))
end
function r1_0.OnMouseEnter(r0_26, r1_26, r2_26)
  -- line: [346, 353] id: 26
  if r0_26.Owner.IsDraging then
    return 
  end
  if not r0_26.IsSelect and r0_0 == "PC" then
    r0_26:PlayAnimation(r0_26.Hover)
  end
end
function r1_0.OnMouseLeave(r0_27, r1_27, r2_27)
  -- line: [355, 366] id: 27
  if r0_27.Owner.IsDraging then
  end
  r0_27.IsPressingItem = false
  if not r0_27.IsSelect and r0_0 == "PC" then
    r0_27:PlayAnimation(r0_27.UnHover)
  else
    r0_27:PlayAnimation(r0_27.Select)
  end
end
function r1_0.OnTouchStarted(r0_28, r1_28, r2_28)
  -- line: [370, 400] id: 28
  local r3_28 = UE.UWidgetBlueprintLibrary.DetectDragIfPressed(r2_28, r0_28, UE.FKey("Touch"))
  r0_28.bClickBegin = true
  if r0_28.Owner.CurSelectSquadIndex ~= r0_28.Index then
  end
  if r0_28.IsNeedSort and r0_28.Owner.CurSelectSquadIndex == r0_28.Index then
    r0_28.IsPressingItem = true
    r0_28.StartDrag = false
    r0_28.StartDragCountDown = r0_28.StartDragTime
    r0_28:AddTimer(0.1, function()
      -- line: [382, 396] id: 29
      if not r0_28.IsPressingItem then
        DebugPrint("OnDragDetected fail")
        r0_28:RemoveTimer("DragDelay")
        return 
      end
      DebugPrint("self.StartDragCountDown ", r0_28.StartDragCountDown)
      r0_28.StartDragCountDown = math.max(r0_28.StartDragCountDown - 0.1, 0)
      if r0_28.StartDragCountDown <= 0 then
        r0_28.StartDrag = true
        DebugPrint("self.StartDragCountDown 0")
        r0_28:CheckArrowState()
        r0_28:RemoveTimer("DragDelay")
      end
    end, true, 0, "DragDelay", true)
  end
  return r3_28
end
function r1_0.OnTouchEnded(r0_30, r1_30, r2_30)
  -- line: [402, 416] id: 30
  DebugPrint("OnTouchEnded")
  r0_30.Owner:GetSquadWidgetInSquadList(r0_30.Owner.CurSelectSquadIndex):HideAllArrow()
  if not r0_30.bClickBegin then
    return r2_0
  end
  r0_30.bClickBegin = false
  if r0_30.Owner.CurSelectSquadIndex ~= r0_30.Index then
    r0_30.Owner:SelectCurSquadInSquadList(r0_30.Index)
  end
  r0_30.IsPressingItem = false
  return r2_0
end
function r1_0.InitAsDragUI(r0_31, r1_31)
  -- line: [420, 449] id: 31
  r0_31.LinkWidgets = {}
  r0_31.ActiveLinkWidgets = {}
  r0_31.Panel_Add:SetVisibility(ESlateVisibility.Collapsed)
  for r7_31, r8_31 in pairs(r1_31.Panel_Normal:GetAllChildren():ToTable()) do
    r8_31:GetName()
    r8_31:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  -- close: r3_31
  r0_31.SquadInfo = r1_31.SquadInfo
  r0_31:InitItem()
  r0_31:HideOrShowItemUIInfo(true)
  r0_31:PlayAnimation(r0_31.Select)
  r0_31.Melee:PlayAnimation(r0_31.Melee.Click)
  r0_31.Ranged:PlayAnimation(r0_31.Ranged.Click)
  local r3_31 = r1_31.SquadInfo.CharId
  local r4_31 = r0_31.Icon_Avatar:GetDynamicMaterial()
  if r4_31 then
    r4_31:SetTextureParameterValue("IconMap", LoadObject(DataMgr.Char[r3_31].Icon))
  end
  r0_31.Text_Name:SetText(r1_31.SquadInfo.Name and GText("Squad_DefaultName1"))
  r0_31:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  r0_31:SetRenderScale(FVector2D(1, 1))
end
function r1_0.CreateDragUI(r0_32)
  -- line: [451, 455] id: 32
  local r1_32 = UIManager(r0_32):_CreateWidgetNew("SquadListItem")
  r1_32:InitAsDragUI(r0_32)
  return r1_32
end
function r1_0.OnDragDetected(r0_33, r1_33, r2_33)
  -- line: [457, 479] id: 33
  r0_33.Owner:GetSquadWidgetInSquadList(r0_33.Owner.CurSelectSquadIndex):HideAllArrow()
  if r0_33.Owner.CurSelectSquadIndex ~= r0_33.Index or not r0_33.StartDrag then
    return 
  end
  r0_33.bClickBegin = false
  r0_33.Owner.IsDraging = true
  local r3_33 = NewObject(UIUtils.GetCommonDragDropOperationClass())
  r3_33.DefaultDragVisual = r0_33:CreateDragUI()
  r3_33.Pivot = UE.EDragPivot.CenterCenter
  r3_33.Index = r0_33.Index
  r3_33.FakeIndex = r0_33.FakeIndex
  r3_33.Tag = "SquadListItem"
  r3_33.Payload = r0_33.Content
  r3_33.Owner = r0_33.Owner
  r0_33:HideOrShowItemUIInfo(false)
  r0_33.Owner:SwitchAddSquadItemVisibility(false)
  return r3_33
end
function r1_0.OnDragEnter(r0_34, r1_34, r2_34, r3_34)
  -- line: [482, 503] id: 34
  if r0_34.Owner.IsDraging then
  end
  if nil and not nil then
    goto label_7	-- block#2 is visited secondly
  end
  if r3_34.FakeIndex == 1 then
    r3_34.DefaultDragVisual:OnlyShowDownArrow()
    r3_34.DefaultDragVisual:PlayDownArrowAnimation()
  elseif r3_34.FakeIndex < r0_34.Owner.SquadListLen then
    r3_34.DefaultDragVisual:ShowAllArrow()
    r3_34.DefaultDragVisual:PlayUpArrowAnimation()
    r3_34.DefaultDragVisual:PlayDownArrowAnimation()
  else
    r3_34.DefaultDragVisual:OnlyShowUpArrow()
    r3_34.DefaultDragVisual:PlayUpArrowAnimation()
  end
  return true
end
function r1_0.OnDragLeave(r0_35, r1_35, r2_35)
  -- line: [506, 531] id: 35
  if r0_35.Owner.IsDraging then
  end
  if nil and not nil then
    goto label_7	-- block#2 is visited secondly
  end
  local r4_35 = UIManager(r0_35):GetUIObj("SquadMainUINew").List_Default:GetTickSpaceGeometry()
  local r5_35 = UE4.UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(r1_35)
  if r0_35.Offset then
    r5_35.X = r5_35.X + r0_35.Offset
  end
  if not UE4.USlateBlueprintLibrary.IsUnderLocation(r4_35, r5_35) then
    r2_35.DefaultDragVisual:SetVisibility(ESlateVisibility.Collapsed)
    r0_35.Owner.IsDraging = false
    r0_35.StartDrag = false
    r0_35.Owner.IsInSortState = false
    r0_35.Owner.IsOutBound = true
    r0_35:UpdateListView()
    r0_35.Owner:HideOrShowItemInDraging()
  end
  return true
end
function r1_0.OnDragCancelled(r0_36, r1_36, r2_36)
  -- line: [534, 546] id: 36
  r0_36.Owner.IsDraging = false
  r0_36.StartDrag = false
  r2_36.DefaultDragVisual:HideAllArrow()
  if not r0_36.Owner.IsOutBound then
    r0_36:UpdateListView()
    r0_36.Owner:HideOrShowItemInDraging()
  end
  r0_36.Owner.IsOutBound = false
  r0_36.Owner:SwitchAddSquadItemVisibility(true)
  return true
end
function r1_0.OnDrop(r0_37, r1_37, r2_37, r3_37)
  -- line: [549, 559] id: 37
  r0_37.Owner.IsDraging = false
  r0_37.StartDrag = false
  r3_37.DefaultDragVisual:HideAllArrow()
  r0_37.Owner:HideOrShowItemInDraging()
  r0_37.Owner:SwitchAddSquadItemVisibility(true)
  r0_37:UpdateListView()
  return true
end
function r1_0.OnDragOver(r0_38, r1_38, r2_38, r3_38)
  -- line: [562, 614] id: 38
  if not r0_38.Owner.IsDraging then
    return true
  end
  local r4_38 = r0_38.Owner.List_Default
  local r6_38 = USlateBlueprintLibrary.AbsoluteToLocal(r4_38:GetCachedGeometry(), UE4.UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(r2_38))
  local r7_38 = USlateBlueprintLibrary.GetLocalSize(r4_38:GetCachedGeometry())
  local r9_38 = r6_38.Y + r4_38:GetScrollOffset()
  local r10_38, r11_38 = r0_38:GetListViewSize(r4_38)
  local r13_38 = math.clamp(math.floor(r9_38 / r11_38), 0, r0_38.Owner.SquadListLen) + 1
  local r14_38 = r3_38.FakeIndex
  if r13_38 > 5 then
    r13_38 = r13_38 + -1
  end
  if math.abs(r14_38 - r13_38) == 1 then
    r0_38:ChangeTwoItemInListView(r4_38, r14_38, r13_38, r3_38)
  end
  if r3_38.FakeIndex == 1 then
    r3_38.DefaultDragVisual:OnlyShowDownArrow()
    r3_38.DefaultDragVisual:PlayDownArrowAnimation()
  elseif r3_38.FakeIndex < r3_38.Owner.SquadListLen then
    r3_38.DefaultDragVisual:ShowAllArrow()
    r3_38.DefaultDragVisual:PlayUpArrowAnimation()
    r3_38.DefaultDragVisual:PlayDownArrowAnimation()
  else
    r3_38.DefaultDragVisual:OnlyShowUpArrow()
    r3_38.DefaultDragVisual:PlayUpArrowAnimation()
  end
  return true
end
function r1_0.ChangeTwoItemInListView(r0_39, r1_39, r2_39, r3_39, r4_39)
  -- line: [617, 655] id: 39
  local r5_39 = r1_39:GetListItems()
  r3_39 = math.min(r3_39, r0_39.Owner.SquadMax)
  if r5_39[r3_39].IsAddSquad then
    return 
  end
  local r6_39 = r0_39.Owner:GetSquadContent(r2_39)
  local r7_39 = r0_39.Owner:GetSquadContent(r3_39)
  if r6_39 and r7_39 then
    DebugPrint("DragItem", r6_39.FakeIndex, r6_39.SquadInfo.CharId)
    DebugPrint("NewItem", r7_39.FakeIndex, r7_39.SquadInfo.CharId)
    if r2_39 < r3_39 then
      r6_39:MoveDown()
      r7_39:MoveUp()
    else
      r6_39:MoveUp()
      r7_39:MoveDown()
    end
    r6_39:SetIndex(r3_39)
    r7_39:SetIndex(r2_39)
  else
    DebugPrint("DragItem or NewItem is nil", r6_39, r7_39)
  end
  if r4_39 then
    r4_39.FakeIndex = r3_39
  end
  r0_39.Owner.CurSelectSquadIndex = r3_39
  GWorld:GetAvatar():SwitchSquad(nil, r0_39, r2_39, r3_39)
end
function r1_0.UpdateListView(r0_40)
  -- line: [657, 664] id: 40
  r0_40.Owner:PlayAnimation(r0_40.Owner.UpdateList)
  r0_40:AddDelayFrameFunc(function()
    -- line: [660, 663] id: 41
    r0_40.Owner:SwitchToSquadList(false)
  end, 8, "DelayUpdateListView")
end
function r1_0.GetListViewSize(r0_42, r1_42)
  -- line: [667, 680] id: 42
  local r2_42 = GWorld.GameInstance:GetGameUIManager()
  local r3_42 = r2_42:GetWidgetRenderSize(r1_42)
  local r4_42 = r1_42:GetParent()
  if r4_42:Cast(UScrollBox) then
    r3_42 = r2_42:GetWidgetRenderSize(r4_42)
  end
  r0_42.Offset = (r3_42.X - r2_42:GetWidgetRenderSize(r0_42.BG).X) / 2
  return r3_42.Y, r2_42:GetWidgetRenderSize(r0_42.BG).Y
end
function r1_0.GetItemRenderSizeXY(r0_43, r1_43)
  -- line: [682, 685] id: 43
  local r2_43 = GWorld.GameInstance:GetGameUIManager()
  return r2_43:GetWidgetRenderSize(r1_43).X, r2_43:GetWidgetRenderSize(r1_43).Y
end
function r1_0.CheckArrowState(r0_44)
  -- line: [691, 704] id: 44
  if r0_44.FakeIndex == 1 then
    r0_44:OnlyShowDownArrow()
    r0_44:PlayDownArrowAnimation()
  elseif r0_44.FakeIndex < r0_44.Owner.SquadListLen then
    r0_44:ShowAllArrow()
    r0_44:PlayUpArrowAnimation()
    r0_44:PlayDownArrowAnimation()
  else
    r0_44:OnlyShowUpArrow()
    r0_44:PlayUpArrowAnimation()
  end
end
function r1_0.OnFocusReceived(r0_45, r1_45, r2_45)
  -- line: [706, 733] id: 45
  if r0_45.Owner.CurInputDeviceType and r0_45.Owner.CurInputDeviceType == ECommonInputType.Gamepad then
    if r0_45.Owner.IsInSortState then
      r0_45.Owner:FocusOnSquadListInSortState()
      return r3_0
    else
      r0_45.Owner.IsOnlyPlayAnimation = false
      r0_45.Owner:SelectCurSquad(r0_45.Index)
      if r0_45.IsAddSquad then
        r0_45.Owner.IsAddSquadDefault = true
        r0_45.Owner:InitBottomTab(false, 2)
        r0_45.Owner.FocusInAddSquad = true
        return r3_0
      else
        r0_45.Owner.CurSelectSquadIndex = r0_45.Index
        r0_45.Owner:GetSquadWidgetInSquadList(r0_45.Owner.CurSelectSquadIndex):CheckSortIcon()
        if r0_45.Owner.IsAddSquadDefault then
          r0_45.Owner.IsAddSquadDefault = false
          r0_45.Owner:InitBottomTab(true, 2)
        end
        r0_45:CheckSortIcon()
        return r2_0
      end
    end
  end
  return r3_0
end
return r1_0
