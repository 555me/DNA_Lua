-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\UI_Phone\Battle\Component\DraggableWidgetComponent.lua
-- version: lua54
-- line: [0, 0] id: 0
return {
  InitAllDraggableWidgetInfo = function(r0_1, r1_1, r2_1)
    -- line: [10, 15] id: 1
    r0_1:RegisterDraggableComponent(r1_1, r1_1[r2_1.WidgetName], r1_1[r2_1.ParentNodeName], r2_1.InnerActiveSlateName, r2_1.MaskNodeName)
  end,
  LeaveDesignState = function(r0_2)
    -- line: [18, 21] id: 2
    r0_2:UnSelectWidget()
    r0_2:UnRegisterDraggableComponent()
  end,
  SelectWidget = function(r0_3)
    -- line: [24, 33] id: 3
    local r1_3 = r0_3:GetSelectWidgetMaskWidget()
    if r1_3 ~= nil then
      r1_3:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
    if r0_3.OwnerWidget and type(r0_3.OwnerWidget.OnDraggableWidgetSelected) == "function" then
      r0_3.OwnerWidget:OnDraggableWidgetSelected(r0_3)
    end
  end,
  UnSelectWidget = function(r0_4)
    -- line: [36, 41] id: 4
    local r1_4 = r0_4:GetSelectWidgetMaskWidget()
    if r1_4 ~= nil then
      r1_4:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end,
  GetSelectWidgetMaskWidget = function(r0_5)
    -- line: [44, 55] id: 5
    local r1_5 = nil
    if type(r0_5.MaskNodeName) == "table" then
      local r2_5 = r0_5.MaskNodeName[r0_5.CurEditPlanIndex]
      if r2_5 ~= nil then
        r1_5 = r0_5.OwnerWidget[r2_5]
      end
    else
      r1_5 = r0_5.OwnerWidget[r0_5.MaskNodeName]
    end
    return r1_5
  end,
  EnterDesignState = function(r0_6, r1_6)
    -- line: [59, 61] id: 6
    r0_6.CurEditPlanIndex = r1_6
  end,
  MoveWidgetByOffset = function(r0_7, r1_7)
    -- line: [65, 77] id: 7
    if not IsValid(r0_7.DraggableWidget) then
      return 
    end
    local r3_7 = r0_7:GetWidgetPosition() + r1_7
    r0_7:SetWidgetPosition(r3_7)
    if r0_7.OwnerWidget and type(r0_7.OwnerWidget.OnDraggableWidgetInfoChanged) == "function" then
      r0_7.OwnerWidget:OnDraggableWidgetInfoChanged("Pos", r0_7, r3_7)
    end
  end,
  ModifyWidgetScale = function(r0_8, r1_8)
    -- line: [81, 94] id: 8
    local r2_8 = r0_8.ParentLayoutNode and r0_8.DraggableWidget
    if not IsValid(r2_8) then
      DebugPrint("DraggableWidgetComponent== Error: ModifyWidgetScale failed, ParentLayoutNode is invalid!")
      return 
    end
    r2_8:SetRenderScale(FVector2D(r1_8, r1_8))
    r0_8:AdjustPositioByScaleValueChange(r2_8)
    if r0_8.OwnerWidget and type(r0_8.OwnerWidget.OnDraggableWidgetInfoChanged) == "function" then
      r0_8.OwnerWidget:OnDraggableWidgetInfoChanged("Scale", r0_8, r1_8)
    end
  end,
  RegisterDraggableComponent = function(r0_9, r1_9, r2_9, r3_9, r4_9, r5_9)
    -- line: [104, 118] id: 9
    r0_9.OwnerWidget = r1_9
    r0_9.DraggableWidget = r2_9
    r0_9.ParentLayoutNode = r3_9
    r0_9.InnerActiveSlateName = r4_9
    r0_9.MaskNodeName = r5_9
    r0_9.bIsDragging = false
    r0_9.StartPosition = FVector2D(0, 0)
    r0_9.CurrnetPositionInScreen = FVector2D(0, 0)
    r0_9.DragOffset = FVector2D(0, 0)
    r0_9.TouchPointLocalOffset = nil
    r0_9.LimitDraggableArea = nil
    r0_9:InitializeVariable()
  end,
  UnRegisterDraggableComponent = function(r0_10)
    -- line: [121, 124] id: 10
    r0_10:SetDraggable(false)
    DebugPrint("DraggableWidgetComponent== DraggableWidget destroyed")
  end,
  InitializeVariable = function(r0_11)
    -- line: [127, 136] id: 11
    if not r0_11.DraggableWidget then
      r0_11.DraggableWidget = r0_11
    end
    r0_11:SetDraggable(true)
    DebugPrint("DraggableWidgetComponent== Initialized Successfully!")
  end,
  SetDraggable = function(r0_12, r1_12)
    -- line: [140, 180] id: 12
    if IsValid(r0_12.DraggableWidget) then
      if r1_12 then
        r0_12.DraggableWidget:SetVisibility(UE4.ESlateVisibility.Visible)
      else
        r0_12.DraggableWidget:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      end
    end
    if type(r0_12.InnerActiveSlateName) == "table" then
      for r6_12, r7_12 in ipairs(r0_12.InnerActiveSlateName) do
        local r8_12 = nil
        if type(r7_12) == "table" then
          r8_12 = r0_12.DraggableWidget[r7_12[1]]
          for r13_12 = 2, #r7_12, 1 do
            r8_12 = r8_12[r7_12[r13_12]]
          end
        else
          r8_12 = r0_12.DraggableWidget[r7_12]
        end
        if r8_12 ~= nil and IsValid(r8_12) then
          if r1_12 then
            r8_12:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
          else
            r8_12:SetVisibility(UE4.ESlateVisibility.Visible)
          end
        end
      end
      -- close: r2_12
    else
      local r2_12 = r0_12.DraggableWidget[r0_12.InnerActiveSlateName]
      if IsValid(r2_12) then
        if r1_12 then
          r2_12:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
        else
          r2_12:SetVisibility(UE4.ESlateVisibility.Visible)
        end
      end
    end
    r0_12.bDraggable = r1_12
  end,
  OnTouchStarted = function(r0_13, r1_13, r2_13)
    -- line: [183, 203] id: 13
    if not r0_13.bDraggable then
      return UE4.UWidgetBlueprintLibrary.Unhandled()
    end
    r0_13.bIsDragging = true
    r0_13:SelectWidget()
    local r3_13 = UE4.UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(r2_13)
    r0_13.StartPosition = r3_13
    local r4_13 = r0_13.ParentLayoutNode:GetCachedGeometry()
    r0_13.TouchPointLocalOffset = UE4.USlateBlueprintLibrary.AbsoluteToLocal(r4_13, r3_13)
    r0_13:SetDraggableArea(r4_13)
    DebugPrint("DraggableWidgetComponent== Start dragging, Position in Screen Space is :", r3_13, ", TouchPoint LocalOffset is :", r0_13.TouchPointLocalOffset)
    return UE4.UWidgetBlueprintLibrary.CaptureMouse(UE4.UWidgetBlueprintLibrary.Handled(), r0_13.DraggableWidget)
  end,
  OnTouchMoved = function(r0_14, r1_14, r2_14)
    -- line: [206, 232] id: 14
    if not r0_14.bIsDragging then
      return UE4.UWidgetBlueprintLibrary.Unhandled()
    end
    local r3_14 = r0_14:ClampPositionToViewport(UE4.UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(r2_14))
    local r4_14 = UIUtils.GetRelativePositionInParent(r0_14.ParentLayoutNode, r3_14, r0_14.TouchPointLocalOffset)
    r0_14.DragOffset = r3_14 - r0_14.StartPosition
    r0_14.CurrnetPositionInScreen = r3_14
    r0_14:SetWidgetPosition(r4_14)
    if r0_14.OwnerWidget and type(r0_14.OwnerWidget.OnDraggableWidgetInfoChanged) == "function" then
      r0_14.OwnerWidget:OnDraggableWidgetInfoChanged("Pos", r0_14, r4_14)
    end
    DebugPrint("DraggableWidgetComponent== Dragging OnTouchMoved to:  ", r4_14)
    return UIUtils.Handled
  end,
  OnTouchEnded = function(r0_15, r1_15, r2_15)
    -- line: [235, 250] id: 15
    if not r0_15.bDraggable then
      return UE4.UWidgetBlueprintLibrary.Unhandled()
    end
    r0_15.bIsDragging = false
    r0_15.DragOffset = FVector2D(0, 0)
    r0_15.TouchPointLocalOffset = nil
    DebugPrint("DraggableWidgetComponent== Stop dragging")
    if r0_15.DraggableWidget:HasMouseCapture() then
      return UE4.UWidgetBlueprintLibrary.ReleaseMouseCapture(UE4.UWidgetBlueprintLibrary.Handled())
    else
      return UE4.UWidgetBlueprintLibrary.Unhandled()
    end
  end,
  SetWidgetPosition = function(r0_16, r1_16)
    -- line: [253, 265] id: 16
    if r0_16.ParentLayoutNode then
      local r2_16 = r0_16.ParentLayoutNode.Slot
      if r2_16 then
        r2_16:SetPosition(r1_16)
      else
        r0_16.DraggableWidget:SetPositionInViewport(r1_16)
      end
    else
      r0_16.DraggableWidget:SetPositionInViewport(r1_16)
    end
  end,
  GetWidgetPosition = function(r0_17)
    -- line: [268, 279] id: 17
    if r0_17.ParentLayoutNode then
      local r1_17 = r0_17.ParentLayoutNode.Slot
      if r1_17 then
        return r1_17:GetPosition()
      else
        return FVector2D(0, 0)
      end
    else
      return FVector2D(0, 0)
    end
  end,
  ClampPositionToViewport = function(r0_18, r1_18)
    -- line: [282, 296] id: 18
    if r0_18.LimitDraggableArea == nil then
      return r1_18
    end
    return FVector2D(UE.UKismetMathLibrary.FClamp(r1_18.X, r0_18.LimitDraggableArea.MinX, r0_18.LimitDraggableArea.MaxX), UE.UKismetMathLibrary.FClamp(r1_18.Y, r0_18.LimitDraggableArea.MinY, r0_18.LimitDraggableArea.MaxY))
  end,
  SetDraggableArea = function(r0_19, r1_19)
    -- line: [299, 337] id: 19
    local r2_19 = nil
    if r0_19.OwnerWidget.SafeZone then
      local r3_19 = r0_19.OwnerWidget.SafeZone:GetContent()
      if r3_19 then
        r2_19 = r3_19:GetCachedGeometry()
      else
        r2_19 = r0_19.OwnerWidget:GetCachedGeometry()
      end
    else
      r2_19 = r0_19.OwnerWidget:GetCachedGeometry()
    end
    if r2_19 == nil then
      r0_19.LimitDraggableArea = nil
      return 
    end
    local r3_19 = UE4.USlateBlueprintLibrary.LocalToAbsolute(r0_19.OwnerWidget:GetCachedGeometry(), UE4.USlateBlueprintLibrary.GetLocalTopLeft(r2_19))
    local r4_19 = UE4.USlateBlueprintLibrary.GetAbsoluteSize(r2_19)
    local r5_19 = UE4.USlateBlueprintLibrary.GetAbsoluteSize(r1_19)
    local r6_19 = UE4.USlateBlueprintLibrary.GetLocalSize(r1_19)
    r0_19.LimitDraggableArea = {
      MinX = r3_19.X + r5_19.X * r0_19.TouchPointLocalOffset.X / r6_19.X,
      MaxX = r3_19.X + r4_19.X - r5_19.X * (1 - r0_19.TouchPointLocalOffset.X / r6_19.X),
      MinY = r3_19.Y + r5_19.Y * r0_19.TouchPointLocalOffset.Y / r6_19.Y,
      MaxY = r3_19.Y + r4_19.Y - r5_19.Y * (1 - r0_19.TouchPointLocalOffset.Y / r6_19.Y),
    }
  end,
  AdjustPositioByScaleValueChange = function(r0_20, r1_20)
    -- line: [341, 359] id: 20
    local r2_20 = r1_20:GetCachedGeometry()
    local r3_20 = UIManager(r0_20.OwnerWidget):GetWorldPosition(r1_20)
    local r4_20 = UE4.USlateBlueprintLibrary.GetAbsoluteSize(r2_20)
    local r5_20 = FVector2D(r3_20.X + r4_20.X / 2, r3_20.Y + r4_20.Y / 2)
    local r6_20 = UE4.USlateBlueprintLibrary.GetLocalSize(r2_20)
    r0_20.TouchPointLocalOffset = FVector2D(r6_20.X / 2, r6_20.Y / 2)
    r0_20:SetDraggableArea(r2_20)
    r0_20:SetWidgetPosition(UIUtils.GetRelativePositionInParent(r1_20, r0_20:ClampPositionToViewport(r5_20), r0_20.TouchPointLocalOffset))
  end,
  IsDragging = function(r0_21)
    -- line: [362, 364] id: 21
    return r0_21.bIsDragging
  end,
}
