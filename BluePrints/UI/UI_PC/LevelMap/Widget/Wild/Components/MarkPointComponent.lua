-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\UI_PC\LevelMap\Widget\Wild\Components\MarkPointComponent.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
return {
  InitComponentCoroutine = function(r0_1)
    -- line: [5, 9] id: 1
    local r1_1 = CreateCoroutine(r0_1.InitMark)
    table.insert(r0_1.InitCoroutines, r1_1)
    coroutine.resume(r1_1, r0_1, #r0_1.InitCoroutines)
  end,
  AddComponentEvent = function(r0_2)
    -- line: [11, 13] id: 2
    EventManager:AddEvent(EventID.UpdateMapMark, r0_2, r0_2.UpdateMapMark)
  end,
  RemoveComponentEvent = function(r0_3)
    -- line: [15, 17] id: 3
    EventManager:RemoveEvent(EventID.UpdateMapMark, r0_3)
  end,
  ClearData = function(r0_4)
    -- line: [19, 26] id: 4
    if r0_4.MarkTable then
      for r5_4, r6_4 in pairs(r0_4.MarkTable) do
        r6_4:RemoveFromParent()
      end
      -- close: r1_4
      r0_4.MarkTable = {}
    end
  end,
  OpenMark = function(r0_5, r1_5, r2_5)
    -- line: [28, 77] id: 5
    if not r0_5.MarkPanel then
      r0_5.MarkPanel = NewObject(r0_5.MarkPanelClass, r0_5)
      r0_5.MainMap.Mark:AddChild(r0_5.MarkPanel)
      r0_5.MarkPanel.Parent = r0_5
      r0_5.MarkPanel.Btn_Confirm:TryOverrideSoundFunc(r0_5.OnTraceSound)
      r0_5.MarkPanel.Btn_Track:TryOverrideSoundFunc(r0_5.OnTraceSound)
      r0_5.MarkPanel:SetVisibility(ESlateVisibility.Collapsed)
    end
    if r1_5 then
      r0_5.CurrentMark = r1_5
      local r3_5 = r0_5:GetTrackingId(CommonConst.RegionMapTrackingType.MarkPoint)
      for r8_5, r9_5 in pairs(r0_5.MarkTable) do
        if r9_5 == r1_5 then
          r0_5.CurrentMarkData = r0_5.MarkData[r8_5]
          r0_5.CurrentMarkUuid = r8_5
          r0_5.MarkPanel:Open(r8_5, r0_5.MarkData[r8_5], GText("UI_RegionMap_Mark"), r0_5.MarkData[r8_5].Type, r3_5 == r8_5, r0_5.RegionIcon)
          r0_5:OnPanelOpen(0)
        end
      end
      -- close: r4_5
    else
      if r0_5.MaxMarkNum <= r0_5.MarkCount then
        UIManager(r0_5):ShowUITip("CommonToastMain", GText("UI_RegionMap_MaxMark"))
        return 
      end
      local r3_5, r4_5 = r0_5:NewPoint()
      FVector2D.Sub(r2_5, r0_5.ScreenSize)
      r3_5:SetRenderTranslation(r2_5)
      r4_5:SetRenderTranslation(r2_5)
      local r5_5 = GWorld:GetAvatar()
      r0_5.CurrentMarkUuid = URuntimeCommonFunctionLibrary.GenerateGUID()
      r3_5:InitAsMark(r0_5, {
        Id = r0_5.CurrentMarkUuid,
        ImagePath = nil,
      }, r0_5.OnMarkClick, r0_5.OnMarkHover, r0_5.OnMarkUnhover)
      r0_5.TempMark = r3_5
      r0_5.SelectWidgetTable[r0_5.CurrentMarkUuid] = r4_5
      r4_5:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      r4_5:PlayAnimation(r4_5.Click)
      local r6_5 = GText("UI_RegionMap_Mark")
      r0_5.CurrentMarkData = {
        PositionX = r0_5.TempMark.RenderTransform.Translation.X / r0_5.MapScale.X,
        PositionY = r0_5.TempMark.RenderTransform.Translation.Y / r0_5.MapScale.Y,
        FloorId = r0_5.CurrentFloorId,
        Type = 1,
      }
      r0_5.MarkPanel:Open(r0_5.CurrentMarkUuid, r0_5.CurrentMarkData, r6_5, nil, r0_5:GetTrackingId(CommonConst.RegionMapTrackingType.MarkPoint) == r0_5.CurrentMarkUuid, r0_5.RegionIcon)
      r0_5:OnPanelOpen(0)
    end
  end,
  TryDeleteTempMarkAndClose = function(r0_6)
    -- line: [79, 91] id: 6
    if r0_6.MarkPanel then
      r0_6.MarkPanel:Close(r0_6.TempMark == nil)
    end
    if r0_6.TempMark then
      r0_6.TempMark:RemoveFromParent()
      r0_6.TempMark = nil
      r0_6.SelectWidgetTable[r0_6.CurrentMarkUuid]:RemoveFromParent()
      r0_6.SelectWidgetTable[r0_6.CurrentMarkUuid] = nil
      r0_6.CurrentMarkUuid = nil
      r0_6.CurrentMarkData = {}
    end
  end,
  DeleteMark = function(r0_7)
    -- line: [93, 115] id: 7
    if not r0_7.TempMark then
      if r0_7:GetTrackingId(CommonConst.RegionMapTrackingType.MarkPoint) == r0_7.CurrentMarkUuid then
        r0_7:OnMarkTrack()
      end
      for r5_7, r6_7 in pairs(r0_7.MarkTable) do
        if r6_7 == r0_7.CurrentMark then
          GWorld:GetAvatar():DeleteMarkPoint(r0_7.RegionID, r5_7)
          r0_7:RemoveTrack(r6_7)
          r0_7.MarkTable[r5_7] = nil
          r0_7.MarkData[r5_7] = nil
          r6_7:RemoveFromParent()
          r0_7.MarkCount = r0_7.MarkCount + -1
          if r0_7.CurrentSelectPoint == r6_7 then
            r0_7.CurrentSelectPoint = nil
            break
          else
            break
          end
        end
      end
      -- close: r1_7
    end
    r0_7:ClosePanel()
  end,
  ChangeMarkType = function(r0_8, r1_8, r2_8)
    -- line: [117, 136] id: 8
    local r3_8 = r0_8.TempMark and r0_8.CurrentMark
    if not r3_8 then
      return 
    end
    local r4_8 = LoadObject(r2_8)
    r3_8.Img_Point:SetBrushFromTexture(r4_8)
    r3_8.Data.ImagePath = r2_8
    if r3_8 == r0_8.TrackTarget then
      r0_8.TrackIndicator:SetIcon(r4_8)
    end
    if r3_8 == r0_8.TempMark then
      r0_8.CurrentMarkData.Type = r1_8
    end
    if r3_8 == r0_8.CurrentMark and r0_8.CurrentMarkData.Type ~= r1_8 then
      r0_8.CurrentMarkData.Type = r1_8
      GWorld:GetAvatar():UpdateMarkPoint(r0_8.RegionID, r0_8.CurrentMarkUuid, r0_8.CurrentMarkData)
    end
  end,
  OnMarkConfirm = function(r0_9, r1_9)
    -- line: [138, 157] id: 9
    if not r0_9.CurrentMarkData then
      return 
    end
    r0_9.CurrentMarkData.Name = r1_9
    local r2_9 = GWorld:GetAvatar()
    if r0_9.TempMark then
      r0_9.MarkTable[r0_9.CurrentMarkUuid] = r0_9.TempMark
      r0_9.MarkData[r0_9.CurrentMarkUuid] = r0_9.CurrentMarkData
      r0_9.TempMark.Data = {
        Id = r0_9.CurrentMarkUuid,
        ImagePath = r0_9.CurrentMarkData.ImagePath,
        Name = r1_9,
        Type = r0_9.CurrentMarkData.Type,
      }
      r2_9:AddMarkPoint(r0_9.RegionID, r0_9.CurrentMarkUuid, r0_9.CurrentMarkData)
      r0_9.MarkCount = r0_9.MarkCount + 1
      r0_9.TempMark = nil
      r0_9.CurrentMarkUuid = nil
      r0_9.CurrentMarkData = {}
    end
    r0_9:ClosePanel()
  end,
  OnMarkNameConfirm = function(r0_10, r1_10, r2_10)
    -- line: [159, 170] id: 10
    if not r1_10 or not r2_10 or not r0_10.MarkTable[r1_10] then
      return 
    end
    r0_10.MarkTable[r1_10].Data.Name = r2_10.Name
    GWorld:GetAvatar():UpdateMarkPoint(r0_10.RegionID, r1_10, r2_10)
  end,
  InitMark = function(r0_11, r1_11)
    -- line: [172, 217] id: 11
    r0_11.MarkTable = {}
    r0_11.MarkData = {}
    r0_11.CurrentMark = nil
    r0_11.TempMark = nil
    r0_11.CurrentMarkUuid = nil
    r0_11.CurrentMarkData = {}
    local r2_11 = 0
    r0_11:AddTimer(0.001, function()
      -- line: [180, 182] id: 12
      coroutine.resume(r0_11.InitCoroutines[r1_11])
    end)
    coroutine.yield()
    local r3_11 = GWorld:GetAvatar()
    r0_11.MarkCount = r3_11:GetCurrentMarkCount()
    local r4_11 = r0_11:GetTrackingId(CommonConst.RegionMapTrackingType.MarkPoint)
    for r9_11, r10_11 in pairs(r3_11.MarkPoints) do
      if r9_11 == r0_11.RegionID then
        for r15_11, r16_11 in pairs(r10_11.MarkPointData) do
          local r17_11, r18_11 = r0_11:NewPoint(r0_11.InitCoroutines[r1_11])
          local r19_11 = FVector2D(r16_11.PositionX, r16_11.PositionY)
          FVector2D.Mul(r19_11, r0_11.MapScale)
          r17_11:SetRenderTranslation(r19_11)
          r18_11:SetRenderTranslation(r19_11)
          r17_11:InitAsMark(r0_11, {
            Id = r15_11,
            ImagePath = DataMgr.MapMarkIcon[r16_11.Type].MarkIconPath.Point,
            Name = r16_11.Name,
          }, r0_11.OnMarkClick, r0_11.OnMarkHover, r0_11.OnMarkUnhover)
          r0_11.MarkTable[r15_11] = r17_11
          r0_11.MarkData[r15_11] = r16_11
          r0_11.SelectWidgetTable[r15_11] = r18_11
          if r15_11 == r4_11 then
            r17_11:PlayAnimation(r17_11.Loop, 0, 0)
            r0_11:CreateTrackIndicator(r17_11)
          end
          r2_11 = r2_11 + 1
          if r2_11 == 10 then
            r2_11 = 0
            r0_11:AddTimer(0.001, function()
              -- line: [207, 209] id: 13
              coroutine.resume(r0_11.InitCoroutines[r1_11])
            end)
            coroutine.yield()
          end
        end
        -- close: r11_11
        break
      end
    end
    -- close: r5_11
    r0_11:InitCoroutineCheck(r1_11)
  end,
  ShowFloor_Component = function(r0_14, r1_14)
    -- line: [219, 228] id: 14
    for r6_14, r7_14 in pairs(r0_14.MarkTable) do
      r7_14:SetFloor(r0_14.MarkData[r6_14].FloorId - r1_14)
    end
    -- close: r2_14
  end,
  OnScaleChange_Component = function(r0_15, r1_15)
    -- line: [230, 270] id: 15
    local r2_15 = r0_15:GetTrackingId(CommonConst.RegionMapTrackingType.MarkPoint)
    local r3_15 = r0_15:GetMapIconVisible("UI_CUSTOMPOINT", r1_15)
    if not IsEmptyTable(r0_15.MarkTable) then
      for r8_15, r9_15 in pairs(r0_15.MarkTable) do
        if not r0_15.IsMinimap and (r9_15:GetVisibility() ~= ESlateVisibility.Collapsed or r9_15.PlayForward) then
          if not r9_15:IsAnimationPlaying(r9_15.In) or r9_15.PlayForward then
            r9_15:StopAnimation(r9_15.In)
            r9_15:PlayAnimationReverse(r9_15.In)
            r9_15.PlayForward = false
          end
          r9_15:SetPointVisibility("Scale", false)
        end
        if r9_15:GetVisibility() ~= ESlateVisibility.Collapsed or r0_15.IsMinimap then
          local r10_15 = FVector2D(r0_15.MarkData[r8_15].PositionX, r0_15.MarkData[r8_15].PositionY)
          FVector2D.Mul(r10_15, r0_15.MapScale)
          r9_15:SetRenderTranslation(r10_15)
          r0_15.SelectWidgetTable[r8_15]:SetRenderTranslation(r10_15)
        end
      end
      -- close: r4_15
    end
    if r0_15.TempMark then
      local r4_15 = FVector2D(r0_15.CurrentMarkData.PositionX, r0_15.CurrentMarkData.PositionY)
      FVector2D.Mul(r4_15, r0_15.MapScale)
      r0_15.TempMark:SetRenderTranslation(r4_15)
      r0_15.SelectWidgetTable[r0_15.CurrentMarkUuid]:SetRenderTranslation(r4_15)
    end
    -- warn: not visited block [10]
    -- block#10:
    -- r9_15:StopAnimation(r9_15.In)
    -- r9_15:PlayAnimation(r9_15.In)
    -- r9_15.PlayForward = true
    -- goto label_82
  end,
  OnMarkClick = function(r0_16, r1_16)
    -- line: [272, 298] id: 16
    if not r1_16 or not r0_16.MarkTable[r1_16] then
      return 
    end
    if not r0_16:CheckControlPriority_Normal() then
      return 
    end
    if r0_16.CurrentSelectPoint and r0_16.CurrentSelectPoint ~= r0_16.MarkTable[r1_16] then
      r0_16.CurrentSelectPoint:PlayAnimation(r0_16.CurrentSelectPoint.NormalAni)
      r0_16.CurrentSelectPoint.IsSelected = false
      r0_16.CurrentSelectPoint.Slot:SetZOrder(0)
    end
    r0_16:ClosePanel(true)
    if not r0_16:CheckSelect(r0_16.MarkTable[r1_16]) then
      return 
    end
    r0_16.CurrentSelectPoint = r0_16.MarkTable[r1_16]
    r0_16.CurrentSelectPoint.Slot:SetZOrder(20)
    r0_16:OpenMark(r0_16.MarkTable[r1_16], FVector2D(r0_16.MarkData[r1_16].PositionX, r0_16.MarkData[r1_16].PositionY))
    r0_16.SelectWidgetTable[r1_16]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_16.SelectWidgetTable[r1_16]:PlayAnimation(r0_16.SelectWidgetTable[r1_16].Click)
    if r0_16.ClickedSelectWidget then
      r0_16.ClickedSelectWidget:SetVisibility(ESlateVisibility.Collapsed)
    end
    r0_16.ClickedSelectWidget = r0_16.SelectWidgetTable[r1_16]
    r0_16:MoveMapToMarkPoint(r1_16)
  end,
  OnMarkHover = function(r0_17, r1_17)
    -- line: [300, 307] id: 17
    if not r1_17 or not r0_17.MarkTable[r1_17] or r0_17.ClickedSelectWidget == r0_17.SelectWidgetTable[r1_17] then
      return 
    end
    r0_17.SelectWidgetTable[r1_17]:SetRenderTranslation(r0_17.MarkTable[r1_17].RenderTransform.Translation)
    r0_17.SelectWidgetTable[r1_17]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_17.SelectWidgetTable[r1_17]:PlayAnimation(r0_17.SelectWidgetTable[r1_17].Hover)
  end,
  OnMarkUnhover = function(r0_18, r1_18)
    -- line: [309, 314] id: 18
    if not r1_18 or not r0_18.MarkTable[r1_18] or r0_18.ClickedSelectWidget == r0_18.SelectWidgetTable[r1_18] then
      return 
    end
    r0_18.SelectWidgetTable[r1_18]:SetVisibility(ESlateVisibility.Collapsed)
  end,
  UpdateMapMark = function(r0_19, r1_19, r2_19, r3_19)
    -- line: [316, 347] id: 19
    if not r0_19.IsMiniMap or r1_19 ~= r0_19.RegionID then
      return 
    end
    if r3_19 then
      if r0_19.MarkTable[r2_19] then
        r0_19.MarkTable[r2_19]:InitAsMark(r0_19, {
          Id = r2_19,
          ImagePath = DataMgr.MapMarkIcon[r3_19.Type].MarkIconPath.Point,
          Name = r3_19.Name,
        })
        r0_19.MarkData[r2_19] = r3_19
      else
        local r4_19, r5_19 = r0_19:NewPoint()
        local r6_19 = FVector2D(r3_19.PositionX, r3_19.PositionY)
        FVector2D.Mul(r6_19, r0_19.MapScale)
        r4_19:SetRenderTranslation(r6_19)
        r5_19:SetRenderTranslation(r6_19)
        r4_19:InitAsMark(r0_19, {
          Id = r2_19,
          ImagePath = DataMgr.MapMarkIcon[r3_19.Type].MarkIconPath.Point,
          Name = r3_19.Name,
        }, r0_19.OnMarkClick, r0_19.OnMarkHover, r0_19.OnMarkUnhover)
        r0_19.MarkTable[r2_19] = r4_19
        r0_19.MarkData[r2_19] = r3_19
        r0_19.SelectWidgetTable[r2_19] = r5_19
        if r3_19.FloorId ~= r0_19.CurrentFloorId then
          r4_19:SetVisibility(ESlateVisibility.Collapsed)
        end
        if r0_19:GetTrackingId(CommonConst.RegionMapTrackingType.MarkPoint) == r2_19 then
          r0_19:OnCommonTrack(CommonConst.RegionMapTrackingType.MarkPoint, r2_19, true)
        end
      end
    elseif r0_19.MarkTable[r2_19] then
      r0_19:RemovePoint(r0_19.MarkTable[r2_19])
      r0_19.MarkTable[r2_19]:RemoveFromParent()
      r0_19.MarkTable[r2_19] = nil
      r0_19.MarkData[r2_19] = nil
    end
  end,
  OnMarkTrack = function(r0_20)
    -- line: [349, 363] id: 20
    if r0_20.CurrentMark and r0_20.CurrentMarkUuid then
      if r0_20:GetTrackingId(CommonConst.RegionMapTrackingType.MarkPoint) ~= r0_20.CurrentMarkUuid then
        r0_20:CancelCurrentTracking()
        EventManager:FireEvent(EventID.OnCommonTrack, CommonConst.RegionMapTrackingType.MarkPoint, r0_20.CurrentMarkUuid, true)
        r0_20.CurrentMark:PlayAnimation(r0_20.CurrentMark.Loop, 0, 0)
        r0_20:CreateTrackIndicator(r0_20.CurrentMark)
      else
        EventManager:FireEvent(EventID.OnCommonTrack, CommonConst.RegionMapTrackingType.MarkPoint, r0_20.CurrentMarkUuid, false)
        r0_20.CurrentMark:StopAllAnimations()
        r0_20:RemoveTrackIndicator()
      end
    end
    r0_20:ClosePanel(false)
  end,
}
