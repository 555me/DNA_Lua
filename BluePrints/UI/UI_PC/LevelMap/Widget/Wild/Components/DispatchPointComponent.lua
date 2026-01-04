-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\UI_PC\LevelMap\Widget\Wild\Components\DispatchPointComponent.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
return {
  InitComponentCoroutine = function(r0_1)
    -- line: [5, 9] id: 1
    local r1_1 = CreateCoroutine(r0_1.InitDispatchPoint)
    table.insert(r0_1.InitCoroutines, r1_1)
    coroutine.resume(r1_1, r0_1, #r0_1.InitCoroutines)
  end,
  AddComponentEvent = function(r0_2)
    -- line: [11, 20] id: 2
    EventManager:AddEvent(EventID.StartDispatch, r0_2, r0_2.StartDispatch)
    EventManager:AddEvent(EventID.CancelDispatch, r0_2, r0_2.CancelDispatch)
    EventManager:AddEvent(EventID.CompleteDispatch, r0_2, r0_2.CompleteDispatch)
    EventManager:AddEvent(EventID.GetAllDispatchReward, r0_2, r0_2.GetAllDispatchReward)
    EventManager:AddEvent(EventID.OnDispatchOverdate, r0_2, r0_2.OnDispatchOverdate)
    EventManager:AddEvent(EventID.OnDispatchComplete, r0_2, r0_2.OnDispatchComplete)
    EventManager:AddEvent(EventID.OnActiveDynamicQuest, r0_2, r0_2.OnActiveDynamicQuest)
    EventManager:AddEvent(EventID.GoToDispatch, r0_2, r0_2.OnDispatchTrace)
  end,
  RemoveComponentEvent = function(r0_3)
    -- line: [22, 31] id: 3
    EventManager:RemoveEvent(EventID.StartDispatch, r0_3)
    EventManager:RemoveEvent(EventID.CancelDispatch, r0_3)
    EventManager:RemoveEvent(EventID.CompleteDispatch, r0_3)
    EventManager:RemoveEvent(EventID.GetAllDispatchReward, r0_3)
    EventManager:RemoveEvent(EventID.OnDispatchOverdate, r0_3)
    EventManager:RemoveEvent(EventID.OnDispatchComplete, r0_3)
    EventManager:RemoveEvent(EventID.OnActiveDynamicQuest, r0_3)
    EventManager:RemoveEvent(EventID.GoToDispatch, r0_3)
  end,
  ClearData = function(r0_4)
    -- line: [33, 54] id: 4
    if next(r0_4.DispatchPoint) then
      for r5_4, r6_4 in pairs(r0_4.DispatchPoint) do
        if r6_4 then
          r6_4:RemoveFromParent()
        end
      end
      -- close: r1_4
      r0_4.DispatchPoint = {}
    end
    if next(r0_4.DispatchSelect) then
      for r5_4, r6_4 in pairs(r0_4.DispatchSelect) do
        if r6_4 then
          r6_4:RemoveFromParent()
        end
      end
      -- close: r1_4
      r0_4.DispatchSelect = {}
    end
    if next(r0_4.DispatchLocations) then
      r0_4.DispatchLocations = {}
    end
  end,
  InitDispatchPoint = function(r0_5, r1_5)
    -- line: [56, 168] id: 5
    local r2_5 = GWorld:GetAvatar()
    if r2_5 == nil or r0_5.IsMiniMap then
      r0_5:InitCoroutineCheck(r1_5)
      return 
    end
    for r7_5, r8_5 in pairs(r2_5.Dispatches) do
      if (r8_5.State == CommonConst.DispatchState.Success or r8_5.State == CommonConst.DispatchState.Perfect or r8_5.State == CommonConst.DispatchState.Qualified or r8_5.State == CommonConst.DispatchState.Disqualified) and r8_5.RegionId == r0_5.RegionID and r0_5.DispatchPoint[r7_5] == nil then
        local r9_5 = nil
        if r1_5 == nil then
          r9_5 = UIManager(r0_5):_CreateWidgetNew("RegionMapDispatchPointInfo")
        else
          r9_5 = UIManager(r0_5):CreateWidgetAsync("RegionMapDispatchPointInfo", r0_5.InitCoroutines[r1_5])
        end
        r0_5.Panel_Point:AddChild(r9_5)
        (function(r0_6)
          -- line: [74, 85] id: 6
          r0_6:SetAlignment(FVector2D(0.5, 0.5))
          r0_6:SetAutoSize(true)
          local r1_6 = FAnchors()
          r1_6.Minimum = FVector2D(0.5, 0.5)
          r1_6.Maximum = FVector2D(0.5, 0.5)
          r0_6:SetAnchors(r1_6)
          local r2_6 = FMargin()
          r2_6.Left = 0
          r2_6.Top = 0
          r0_6:SetOffsets(r2_6)
        end)(r9_5.Slot)
        local r11_5 = DataMgr.DispatchUI[r8_5.DispatchId].UIPos
        local r12_5 = r0_5:TransformWorldLocToUILoc(r11_5[1], r11_5[2])
        r9_5:SetRenderTranslation(r12_5)
        r9_5:Init(r8_5, r0_5)
        r0_5.DispatchPoint[r7_5] = r9_5
        r0_5.DispatchLocations[r7_5] = r12_5
      end
    end
    -- close: r3_5
    for r7_5, r8_5 in ipairs(r2_5.CurrentDispatchList) do
      local r9_5 = r8_5:GetDispatchId()
      if r9_5 ~= -1 then
        local r10_5 = r2_5.Dispatches[r9_5]
        if r0_5.DispatchPoint[r9_5] == nil and r10_5.RegionId == r0_5.RegionID then
          local r11_5 = nil
          if r1_5 == nil then
            r11_5 = UIManager(r0_5):_CreateWidgetNew("RegionMapDispatchPointInfo")
          else
            r11_5 = UIManager(r0_5):CreateWidgetAsync("RegionMapDispatchPointInfo", r0_5.InitCoroutines[r1_5])
          end
          r0_5.Panel_Point:AddChild(r11_5)
          (function(r0_7)
            -- line: [113, 125] id: 7
            r0_7:SetAlignment(FVector2D(0.5, 0.5))
            r0_7:SetAutoSize(true)
            local r1_7 = FAnchors()
            r1_7.Minimum = FVector2D(0.5, 0.5)
            r1_7.Maximum = FVector2D(0.5, 0.5)
            r0_7:SetAnchors(r1_7)
            local r2_7 = FMargin()
            r2_7.Left = 0
            r2_7.Top = 0
            r0_7:SetOffsets(r2_7)
            r0_7:SetZOrder(0)
          end)(r11_5.Slot)
          local r13_5 = DataMgr.DispatchUI[r10_5.DispatchId].UIPos
          local r14_5 = r0_5:TransformWorldLocToUILoc(r13_5[1], r13_5[2])
          r11_5:SetRenderTranslation(r14_5)
          r11_5:Init(r10_5, r0_5)
          r0_5.DispatchPoint[r9_5] = r11_5
          r0_5.DispatchLocations[r9_5] = r14_5
        end
      end
    end
    -- close: r3_5
    for r7_5, r8_5 in pairs(r0_5.DispatchPoint) do
      if r0_5.DispatchSelect[r7_5] == nil then
        local r9_5 = nil
        if r1_5 == nil then
          r9_5 = UIManager(r0_5):_CreateWidgetNew("RegionMapSelect")
        else
          r9_5 = UIManager(r0_5):CreateWidgetAsync("RegionMapSelect", r0_5.InitCoroutines[r1_5])
        end
        r0_5.Panel_Point:AddChild(r9_5)
        (function(r0_8)
          -- line: [148, 160] id: 8
          r0_8:SetAlignment(FVector2D(0.5, 0.5))
          r0_8:SetAutoSize(true)
          local r1_8 = FAnchors()
          r1_8.Minimum = FVector2D(0.5, 0.5)
          r1_8.Maximum = FVector2D(0.5, 0.5)
          r0_8:SetAnchors(r1_8)
          local r2_8 = FMargin()
          r2_8.Left = 0
          r2_8.Top = 0
          r0_8:SetOffsets(r2_8)
          r0_8:SetZOrder(10)
        end)(r9_5.Slot)
        r9_5:SetRenderTranslation(r0_5.DispatchLocations[r7_5])
        r0_5.DispatchSelect[r7_5] = r9_5
        r9_5:SetVisibility(ESlateVisibility.Collapsed)
      end
    end
    -- close: r3_5
    r0_5:InitCoroutineCheck(r1_5)
  end,
  OnScaleChange_Component = function(r0_9, r1_9)
    -- line: [170, 181] id: 9
    for r6_9, r7_9 in pairs(r0_9.DispatchPoint) do
      local r8_9 = DataMgr.DispatchUI[r6_9].UIPos
      r7_9:SetRenderTranslation(r0_9:TransformWorldLocToUILoc(r8_9[1], r8_9[2]))
    end
    -- close: r2_9
    for r6_9, r7_9 in pairs(r0_9.DispatchSelect) do
      local r8_9 = DataMgr.DispatchUI[r6_9].UIPos
      r7_9:SetRenderTranslation(r0_9:TransformWorldLocToUILoc(r8_9[1], r8_9[2]))
    end
    -- close: r2_9
  end,
  RefreshDispatchMap = function(r0_10, r1_10, r2_10)
    -- line: [183, 225] id: 10
    if r1_10 ~= r0_10.RegionID then
      r0_10:ChangeRegion(r1_10, function()
        -- line: [185, 201] id: 11
        r0_10:CloseForDispatch(true)
        r0_10:OnPanelOpen(5)
        local r0_11 = DataMgr.DispatchUI[r2_10].UIPos
        if r0_11 then
          r0_10:MoveMapTo(r0_10:TransformWorldLocToUILoc(r0_11[1], r0_11[2]) * -1)
          r0_10:RefreshDispatchSelect()
          r0_10:RefreshSingleDispatchPoint()
          r0_10:DispatchSelectClick(r2_10)
          local r2_11 = r0_10.DispatchPoint[r2_10]
          if r2_11 then
            r2_11.Slot:SetZOrder(20)
            r2_11:OnItemSelect(true)
          end
        end
      end)
    else
      if r0_10.DispatchPoint[r2_10] == nil then
        r0_10:InitDispatchPoint()
      end
      local r4_10 = DataMgr.DispatchUI[r2_10].UIPos
      if r4_10 then
        r0_10:MoveMapTo(r0_10:TransformWorldLocToUILoc(r4_10[1], r4_10[2]) * -1)
        r0_10:RefreshDispatchSelect()
        r0_10:RefreshSingleDispatchPoint()
        r0_10:DispatchSelectClick(r2_10)
        local r6_10 = r0_10.DispatchPoint[r2_10]
        if r6_10 then
          r6_10.Slot:SetZOrder(20)
          r6_10:OnItemSelect()
        end
      end
    end
    r0_10:ShowAllMiniHead(r2_10)
  end,
  ShowAllMiniHead = function(r0_12, r1_12)
    -- line: [227, 231] id: 12
    for r6_12, r7_12 in pairs(r0_12.DispatchPoint) do
      r7_12:ShowMiniHead(r1_12)
    end
    -- close: r2_12
  end,
  RefreshDispatchPoint = function(r0_13, r1_13, r2_13)
    -- line: [233, 238] id: 13
    local r3_13 = r0_13.DispatchPoint[r1_13]
    if r3_13 then
      r3_13:RefreshAgent(r2_13)
    end
  end,
  RemoveDispatchPoint = function(r0_14, r1_14, r2_14)
    -- line: [240, 245] id: 14
    local r3_14 = r0_14.DispatchPoint[r1_14]
    if r3_14 then
      r3_14:RemoveAgent(r2_14)
    end
  end,
  StartDispatch = function(r0_15, r1_15)
    -- line: [255, 269] id: 15
    if r0_15.IsMiniMap then
      return 
    end
    local r2_15 = GWorld:GetAvatar()
    if not r2_15 then
      return 
    end
    for r7_15, r8_15 in pairs(r0_15.DispatchPoint) do
      if r7_15 == r1_15 then
        r8_15:StartDispatch(r2_15.Dispatches[r1_15])
      end
    end
    -- close: r3_15
  end,
  CancelDispatch = function(r0_16, r1_16)
    -- line: [271, 290] id: 16
    if r0_16.IsMiniMap then
      return 
    end
    if GWorld:GetAvatar() == nil then
      return 
    end
    local r4_16 = r0_16.DispatchSelect[r1_16]
    r0_16.DispatchPoint[r1_16]:RemoveFromParent()
    r4_16:RemoveFromParent()
    if r0_16.MainMap.DispatchDetail then
      r0_16.MainMap.DispatchDetail:RealClose()
    end
    r0_16.DispatchPoint[r1_16] = nil
    r0_16.DispatchSelect[r1_16] = nil
    r0_16.DispatchLocations[r1_16] = nil
  end,
  CompleteDispatch = function(r0_17, r1_17, r2_17)
    -- line: [292, 306] id: 17
    if r0_17.IsMiniMap then
      return 
    end
    local r4_17 = r0_17.DispatchSelect[r2_17]
    r0_17.DispatchPoint[r2_17]:RemoveFromParent()
    r4_17:RemoveFromParent()
    if r0_17.MainMap.DispatchDetail then
      r0_17.MainMap.DispatchDetail:RealClose()
    end
    r0_17.DispatchPoint[r2_17] = nil
    r0_17.DispatchSelect[r2_17] = nil
    r0_17.DispatchLocations[r2_17] = nil
  end,
  GetAllDispatchReward = function(r0_18, r1_18, r2_18)
    -- line: [308, 326] id: 18
    if r0_18.IsMiniMap then
      return 
    end
    for r7_18, r8_18 in pairs(r2_18) do
      local r9_18 = r0_18.DispatchPoint[r8_18]
      local r10_18 = r0_18.DispatchSelect[r8_18]
      if r9_18 then
        r9_18:RemoveFromParent()
      end
      if r10_18 then
        r10_18:RemoveFromParent()
      end
      r0_18.DispatchPoint[r8_18] = nil
      r0_18.DispatchSelect[r8_18] = nil
      r0_18.DispatchLocations[r8_18] = nil
    end
    -- close: r3_18
  end,
  OnDispatchOverdate = function(r0_19, r1_19)
    -- line: [328, 354] id: 19
    if r0_19.IsMiniMap then
      return 
    end
    if next(r0_19.DispatchPoint) then
      for r6_19, r7_19 in pairs(r0_19.DispatchPoint) do
        if r7_19 then
          r7_19:RemoveFromParent()
        end
      end
      -- close: r2_19
      r0_19.DispatchPoint = {}
    end
    if next(r0_19.DispatchSelect) then
      for r6_19, r7_19 in pairs(r0_19.DispatchSelect) do
        if r7_19 then
          r7_19:RemoveFromParent()
        end
      end
      -- close: r2_19
      r0_19.DispatchSelect = {}
    end
    if next(r0_19.DispatchLocations) then
      r0_19.DispatchLocations = {}
    end
    r0_19:InitDispatchPoint()
  end,
  OnActiveDynamicQuest = function(r0_20, r1_20)
    -- line: [356, 358] id: 20
    r0_20:OnCommonTrack(CommonConst.RegionMapTrackingType.MiniDispatchPoint, r1_20, false)
  end,
  RefreshAllDispatchPoint = function(r0_21)
    -- line: [360, 364] id: 21
    for r5_21, r6_21 in pairs(r0_21.DispatchPoint) do
      r6_21:RefreshPoint()
    end
    -- close: r1_21
  end,
  RefreshSingleDispatchPoint = function(r0_22)
    -- line: [366, 371] id: 22
    for r5_22, r6_22 in pairs(r0_22.DispatchPoint) do
      r6_22:RefreshSinglePoint()
    end
    -- close: r1_22
  end,
  DispatchSelectHover = function(r0_23, r1_23)
    -- line: [373, 379] id: 23
    if r1_23 ~= r0_23.CurClickDispatchId then
      local r2_23 = r0_23.DispatchSelect[r1_23]
      r2_23:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      r2_23:PlayAnimation(r2_23.Hover)
    end
  end,
  DispatchSelectUnHover = function(r0_24, r1_24)
    -- line: [381, 387] id: 24
    if r1_24 ~= r0_24.CurClickDispatchId then
      r0_24.DispatchSelect[r1_24]:SetVisibility(ESlateVisibility.Collapsed)
    end
  end,
  PlaySelectAni = function(r0_25, r1_25)
    -- line: [389, 395] id: 25
    local r2_25 = r0_25.DispatchPoint[r1_25]
    if r2_25 then
      r2_25:PlaySelectAnimation()
    end
  end,
  DispatchSelectClick = function(r0_26, r1_26)
    -- line: [397, 410] id: 26
    r0_26.CurClickDispatchId = r1_26
    r0_26.MainMap.DispatchId = r1_26
    r0_26:OnFloorBtnClicked(DataMgr.DispatchUI[DataMgr.Dispatch[r1_26].DispatchUIId].FloorId, true)
    local r4_26 = r0_26.DispatchSelect[r1_26]
    if r4_26 then
      r4_26.Slot:SetZOrder(10)
      r4_26:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      r4_26.IsPlay = false
      r4_26:PlayAnimation(r4_26.Click)
    end
  end,
  RefreshDispatchSelect = function(r0_27)
    -- line: [412, 418] id: 27
    for r5_27, r6_27 in pairs(r0_27.DispatchSelect) do
      if r6_27 then
        r6_27:SetVisibility(ESlateVisibility.Collapsed)
      end
    end
    -- close: r1_27
  end,
  OnDispatchExistingComplete = function(r0_28, r1_28)
    -- line: [421, 439] id: 28
    if r0_28.IsMiniMap then
      return 
    end
    if r0_28.MainMap.DispatchAgentList then
      return 
    end
    local r2_28 = r0_28.DispatchPoint[r1_28]
    local r3_28 = r0_28.DispatchSelect[r1_28]
    if r2_28 then
      r2_28:RemoveFromParent()
      r0_28.DispatchPoint[r1_28] = nil
      if r3_28 then
        r3_28:RemoveFromParent()
        r0_28.DispatchSelect[r1_28] = nil
      end
    end
  end,
  OnDispatchComplete = function(r0_29, r1_29)
    -- line: [441, 454] id: 29
    if r0_29.IsMiniMap then
      return 
    end
    local r2_29 = GWorld:GetAvatar()
    if not r2_29 then
      return 
    end
    local r3_29 = r2_29.Dispatches[r1_29]
    local r4_29 = r0_29.DispatchPoint[r1_29]
    if r4_29 then
      r4_29:SetState(r3_29)
    end
  end,
  BackToOriginalRegion = function(r0_30)
    -- line: [456, 460] id: 30
    r0_30:ChangeRegion(r0_30.OriginalRegionId, function()
      -- line: [457, 459] id: 31
      r0_30:ShowMissionIndicatorsInRegionMap()
    end)
  end,
  OnDispatchTrace = function(r0_32, r1_32)
    -- line: [462, 475] id: 32
    r0_32.CurTrackDispatchId = r1_32
    if r0_32:GetTrackingId(CommonConst.RegionMapTrackingType.MiniDispatchPoint) ~= r0_32.CurTrackDispatchId then
      r0_32:CancelCurrentTracking()
      EventManager:FireEvent(EventID.OnCommonTrack, CommonConst.RegionMapTrackingType.MiniDispatchPoint, r0_32.CurTrackDispatchId, true)
    else
      EventManager:FireEvent(EventID.OnCommonTrack, CommonConst.RegionMapTrackingType.MiniDispatchPoint, r0_32.CurTrackDispatchId, false)
    end
  end,
  CloseForDispatch = function(r0_33, r1_33)
    -- line: [477, 506] id: 33
    local r2_33 = GWorld:GetAvatar()
    local r3_33 = nil	-- notice: implicit variable refs by block#[18]
    if r1_33 then
      r3_33 = ESlateVisibility.Collapsed
      if not r3_33 then
        ::label_9::
        r3_33 = ESlateVisibility.SelfHitTestInvisible
      end
    else
      goto label_9	-- block#2 is visited secondly
    end
    for r8_33, r9_33 in pairs(r0_33.TeleportPoints) do
      r9_33:SetPointVisibility("Dispatch", not r1_33, true)
    end
    -- close: r4_33
    for r8_33, r9_33 in pairs(r0_33.RegionPoints) do
      r9_33:SetPointVisibility("Dispatch", not r1_33, true)
    end
    -- close: r4_33
    for r8_33, r9_33 in pairs(r0_33.MarkTable) do
      r9_33:SetPointVisibility("Dispatch", not r1_33, true)
    end
    -- close: r4_33
    for r8_33, r9_33 in pairs(r0_33.ChallengePoints) do
      r9_33:SetPointVisibility("Dispatch", not r1_33, true)
    end
    -- close: r4_33
    if not IsEmptyTable(r0_33.IndicatorWidgets) then
      for r8_33, r9_33 in pairs(r0_33.IndicatorWidgets) do
        if IsValid(r9_33) then
          r9_33:SetVisibility(r3_33)
        end
      end
      -- close: r4_33
    end
    if r1_33 then
      r0_33.Panel_Gamer:SetVisibility(ESlateVisibility.Collapsed)
      r0_33.MainMap.Slider_Zoom:SetVisibility(ESlateVisibility.Collapsed)
    elseif r0_33.IsInRegion and not DataMgr.SubRegion[r2_33.CurrentRegionId].NotShowInRegionMap then
      r0_33.Panel_Gamer:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      r0_33.MainMap.Slider_Zoom:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
  end,
}
