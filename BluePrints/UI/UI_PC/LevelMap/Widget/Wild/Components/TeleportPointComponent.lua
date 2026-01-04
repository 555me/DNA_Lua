-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\UI_PC\LevelMap\Widget\Wild\Components\TeleportPointComponent.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
return {
  InitComponentCoroutine = function(r0_1)
    -- line: [5, 9] id: 1
    local r1_1 = CreateCoroutine(r0_1.InitTeleportPoint)
    table.insert(r0_1.InitCoroutines, r1_1)
    coroutine.resume(r1_1, r0_1, #r0_1.InitCoroutines)
  end,
  ClearData = function(r0_2)
    -- line: [11, 18] id: 2
    if r0_2.TeleportPoints then
      for r5_2, r6_2 in pairs(r0_2.TeleportPoints) do
        r6_2:RemoveFromParent()
      end
      -- close: r1_2
      r0_2.TeleportPoints = {}
    end
  end,
  InitTeleportPoint = function(r0_3, r1_3)
    -- line: [20, 143] id: 3
    r0_3.TeleportPoints = {}
    r0_3.TeleportPointLocation = {}
    r0_3.TeleportPoint2FloorId = {}
    r0_3.TeleportState = {}
    r0_3.TeleportIdToHardBossId = {}
    r0_3.Teleport2LocalPos = {}
    local r2_3 = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
    if r2_3 == nil or r2_3:GetRegionDataMgrSubSystem() == nil then
      return 
    end
    local r3_3 = GWorld:GetAvatar()
    local r4_3 = {}
    for r9_3, r10_3 in pairs(r0_3.RegionData.IsRandom) do
      for r15_3, r16_3 in pairs(DataMgr.TeleportPoint) do
        if r16_3.TeleportPointSubRegion == r10_3 and r16_3.StaticId then
          r4_3[r16_3.StaticId] = r16_3
          local r17_3 = nil
          if r16_3.BuildingNameAndId then
            local r18_3 = nil
            r18_3, r17_3 = r0_3:GetBuildingNameAndId(r16_3.BuildingNameAndId)
          end
          if not r17_3 then
            r17_3 = r0_3.MaxFloorId
          end
          r0_3.TeleportPoint2FloorId[r16_3.Id] = r17_3
          r0_3.TeleportState[r15_3] = false
        end
      end
      -- close: r11_3
    end
    -- close: r5_3
    local r5_3 = r2_3:GetRegionDataMgrSubSystem().DataLibrary:GetFullRegionStoreDatas()
    if r5_3 ~= nil then
      for r10_3, r11_3 in pairs(r5_3) do
        local r12_3 = r4_3[r11_3.CreatorId]
        if r12_3 then
          local r13_3 = nil
          if r11_3.State then
            r13_3 = r11_3.State.OpenState
          end
          if not r13_3 then
            r13_3 = false
          end
          r0_3.TeleportState[r12_3.Id] = r13_3
        end
      end
      -- close: r6_3
    end
    local r6_3 = r0_3:GetTrackingId(CommonConst.RegionMapTrackingType.TeleportPoint)
    for r11_3, r12_3 in pairs(r4_3) do
      local r13_3, r14_3 = r0_3:NewPointAsync(r0_3.InitCoroutines[r1_3])
      r13_3:Init(r0_3, r12_3, r0_3.TeleportState[r12_3.Id], r0_3.OnTeleportPointClick, r0_3.OnTeleportHover, r0_3.OnTeleportUnhover)
      local r15_3 = r0_3:TransformWorldLocToUILoc(r12_3.MechanismPos[1], r12_3.MechanismPos[2])
      r13_3:SetRenderTranslation(r15_3)
      r14_3:SetRenderTranslation(r15_3)
      r0_3.TeleportPoints[r12_3.Id] = r13_3
      r0_3.TeleportPointLocation[r12_3.Id] = FVector2D(r12_3.MechanismPos[1], r12_3.MechanismPos[2])
      r0_3.SelectWidgetTable[r12_3.Id] = r14_3
      if r12_3.Id == r6_3 then
        r13_3:PlayAnimation(r13_3.Loop, 0, 0)
        r0_3:CreateTrackIndicator(r13_3)
      end
    end
    -- close: r7_3
    for r11_3, r12_3 in pairs(DataMgr.HardBossMain) do
      local r13_3 = r12_3.TeleportId
      if r13_3 and not r0_3.TeleportPoints[r13_3] then
        local r14_3 = DataMgr.TeleportPoint[r13_3]
        if DataMgr.SubRegion[r14_3.TeleportPointSubRegion].RegionId == r0_3.RegionData.RegionId and r3_3 and r3_3:CheckHardBossUnlockCondition(r12_3.HardBossId) then
          local r17_3, r18_3 = r0_3:NewPointAsync(r0_3.InitCoroutines[r1_3])
          r17_3:Init(r0_3, r14_3, true, r0_3.OnTeleportPointClick, r0_3.OnTeleportHover, r0_3.OnTeleportUnhover)
          r17_3.HardBossId = r12_3.HardBossId
          local r19_3 = r0_3:TransformWorldLocToUILoc(r14_3.MechanismPos[1], r14_3.MechanismPos[2])
          r17_3:SetRenderTranslation(r19_3)
          r18_3:SetRenderTranslation(r19_3)
          r0_3.TeleportIdToHardBossId[r14_3.Id] = r12_3.HardBossId
          r0_3.TeleportPoints[r14_3.Id] = r17_3
          r0_3.TeleportState[r14_3.Id] = true
          r0_3.TeleportPointLocation[r14_3.Id] = FVector2D(r14_3.MechanismPos[1], r14_3.MechanismPos[2])
          r0_3.SelectWidgetTable[r14_3.Id] = r18_3
          local r20_3 = nil
          if r14_3.BuildingNameAndId then
            local r21_3 = nil
            r21_3, r20_3 = r0_3:GetBuildingNameAndId(r14_3.BuildingNameAndId)
          end
          if not r20_3 then
            r20_3 = r0_3.MaxFloorId
          end
          r0_3.TeleportPoint2FloorId[r14_3.Id] = r20_3
        end
      end
    end
    -- close: r7_3
    local r7_3 = DataMgr.UIUnlockRule.HardBoss.UIUnlockRuleId
    if r3_3 and r3_3:CheckUIUnlocked(r7_3) then
      for r13_3, r14_3 in pairs(r0_3.TeleportIdToHardBossId) do
        if r0_3.TeleportPoint2FloorId[r13_3] == r0_3.MaxFloorId then
          r0_3.TeleportPoints[r13_3]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
        end
      end
      -- close: r9_3
    end
    r0_3:InitCoroutineCheck(r1_3)
  end,
  ShowFloor_Component = function(r0_4, r1_4)
    -- line: [145, 154] id: 4
    for r6_4, r7_4 in pairs(r0_4.TeleportPoints) do
      r7_4:SetFloor(r0_4.TeleportPoint2FloorId[r6_4] - r1_4)
    end
    -- close: r2_4
  end,
  OnScaleChange_Component = function(r0_5, r1_5)
    -- line: [156, 189] id: 5
    local r2_5 = r0_5:GetTrackingId(CommonConst.RegionMapTrackingType.TeleportPoint)
    local r3_5 = r0_5:GetMapIconVisible("UI_TELEPORTPOINT", r1_5)
    local r4_5 = r0_5:GetMapIconVisible("UI_BOSS", r1_5)
    for r9_5, r10_5 in pairs(r0_5.TeleportPoints) do
      if not r0_5.IsMinimap then
        local r11_5 = DataMgr.TeleportPoint[r9_5]
        if r11_5 then
          r11_5 = r3_5 and r4_5
        else
          goto label_27	-- block#4 is visited secondly
        end
        if (r11_5 or r9_5 == r0_5.CurrentConveyId or r9_5 == r2_5) and (r10_5:GetVisibility() ~= ESlateVisibility.SelfHitTestInvisible or not r10_5.PlayForward) and r10_5:SetPointVisibility("Scale", true) then
          r10_5:StopAnimation(r10_5.In)
          r10_5:PlayAnimation(r10_5.In)
          r10_5.PlayForward = true
        elseif r10_5:GetVisibility() ~= ESlateVisibility.Collapsed or r10_5.PlayForward then
          if not r10_5:IsAnimationPlaying(r10_5.In) or r10_5.PlayForward then
            r10_5:StopAnimation(r10_5.In)
            r10_5:PlayAnimationReverse(r10_5.In)
            r10_5.PlayForward = false
          end
          r10_5:SetPointVisibility("Scale", false)
        end
      end
      if r10_5:GetVisibility() ~= ESlateVisibility.Collapsed or r0_5.IsMinimap then
        local r11_5 = r0_5:TransformWorldLocToUILoc(r0_5.TeleportPointLocation[r9_5].X, r0_5.TeleportPointLocation[r9_5].Y)
        r10_5:SetRenderTranslation(r11_5)
        r0_5.SelectWidgetTable[r9_5]:SetRenderTranslation(r11_5)
      end
    end
    -- close: r5_5
  end,
  CheckIsAnyTeleporPointUnlock = function(r0_6, r1_6, r2_6)
    -- line: [191, 229] id: 6
    local r4_6 = DataMgr.Region[DataMgr.SubRegion[r1_6].RegionId]
    if not r4_6 then
      return 
    end
    local r5_6 = {}
    local r6_6 = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
    for r11_6, r12_6 in pairs(DataMgr.TeleportPoint) do
      if r2_6 and CommonUtils.HasValue(r4_6.IsRandom, r12_6.TeleportPointSubRegion) and r12_6.StaticId then
        r5_6[r12_6.StaticId] = r12_6
      elseif r12_6.TeleportPointSubRegion == r1_6 and r12_6.StaticId then
        r5_6[r12_6.StaticId] = r12_6
      end
    end
    -- close: r7_6
    local r7_6 = r6_6:GetRegionDataMgrSubSystem().DataLibrary:GetFullRegionStoreDatas()
    if r7_6 ~= nil then
      for r12_6, r13_6 in pairs(r7_6) do
        if r5_6[r13_6.CreatorId] then
          local r15_6 = false
          if r13_6.State then
            r15_6 = r13_6.State.OpenState
          end
          if r15_6 then
            return true
          end
        end
      end
      -- close: r8_6
    end
    return false
  end,
  GetTeleportLocalPos = function(r0_7)
    -- line: [231, 240] id: 7
    for r5_7, r6_7 in pairs(r0_7.TeleportPoints) do
      if not r0_7.TeleportIdToHardBossId[r5_7] then
        local r7_7, r8_7 = r0_7:GetWidgetLocalPos(r6_7)
        if r8_7 then
          r0_7.Teleport2LocalPos[r5_7] = r7_7
        end
      end
    end
    -- close: r1_7
  end,
  OnTeleportPointClick = function(r0_8, r1_8)
    -- line: [242, 317] id: 8
    r0_8.CurrentConveyId = nil
    local r2_8 = DataMgr.TeleportPoint[r1_8]
    if not r2_8 or not r0_8:CheckControlPriority_Normal() then
      return 
    end
    r0_8:ClosePanel(true)
    if r0_8.CurrentSelectPoint and r0_8.TeleportPoints[r1_8] then
      r0_8.CurrentSelectPoint:PlayAnimation(r0_8.CurrentSelectPoint.NormalAni)
      r0_8.CurrentSelectPoint.IsSelected = false
      r0_8.CurrentSelectPoint.Slot:SetZOrder(0)
    end
    if not r0_8:CheckSelect(r0_8.TeleportPoints[r1_8]) then
      return 
    end
    r0_8.CurrentSelectPoint = r0_8.TeleportPoints[r1_8]
    r0_8.CurrentSelectPoint.Slot:SetZOrder(20)
    r0_8.SelectWidgetTable[r1_8]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_8.SelectWidgetTable[r1_8]:PlayAnimation(r0_8.SelectWidgetTable[r1_8].Click)
    if r0_8.ClickedSelectWidget then
      r0_8.ClickedSelectWidget:SetVisibility(ESlateVisibility.Collapsed)
    end
    r0_8.ClickedSelectWidget = r0_8.SelectWidgetTable[r1_8]
    r0_8.CurrentConveyId = r1_8
    if r0_8.TeleportIdToHardBossId[r0_8.CurrentConveyId] then
      r0_8.TureHardBoss_MapTips:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      r0_8.TureHardBoss_MapTips:RefreshMapTips(r0_8.TeleportIdToHardBossId[r0_8.CurrentConveyId])
      local r3_8 = r0_8.TeleportPoint2FloorId[r2_8.Id]
      if r3_8 then
        r0_8:OnFloorBtnClicked(r3_8, true)
      end
      r0_8.TureHardBoss_MapTips:SetFocus()
    else
      r0_8.LevelMap_Convey_Widget_PC.Btn_Go:UnBindEventOnClickedByObj(r0_8)
      r0_8.LevelMap_Convey_Widget_PC.Btn_Go:BindEventOnClicked(r0_8, r0_8.OnConveyClicked)
      r0_8.LevelMap_Convey_Widget_PC:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      r0_8.LevelMap_Convey_Widget_PC:PlayAnimation(r0_8.LevelMap_Convey_Widget_PC.Auto_In)
      r0_8.LevelMap_Convey_Widget_PC.Text_Name:SetText(GText(r2_8.TeleportPointName))
      r0_8.LevelMap_Convey_Widget_PC.Text_Describe:SetText(GText(r2_8.TeleportPointDes))
      r0_8.LevelMap_Convey_Widget_PC.Img_GuidePoint_Icon:SetBrushFromTexture(r0_8.CurrentSelectPoint.Img_Point.Brush.ResourceObject)
      r0_8.LevelMap_Convey_Widget_PC.Describe:SetVisibility(ESlateVisibility.Collapsed)
      if r0_8.TeleportState[r2_8.Id] or Const.UnlockRegionTeleport then
        r0_8.LevelMap_Convey_Widget_PC.Lock:SetVisibility(ESlateVisibility.Collapsed)
        r0_8.LevelMap_Convey_Widget_PC.Switch_Button:SetActiveWidgetIndex(0)
        local r3_8 = r0_8:CheckTempleAndPartyInfo(r2_8.Id)
        if r3_8 ~= nil and #r3_8 > 0 then
          local r4_8 = r0_8.LevelMap_Convey_Widget_PC.Group_Temple
          local r6_8 = r0_8.GameInputModeSubsystem:GetCurrentInputType()
          if r6_8 == ECommonInputType.Gamepad then
            r6_8 = ESlateVisibility.HitTestInvisible and ESlateVisibility.SelfHitTestInvisible
          else
            goto label_193	-- block#20 is visited secondly
          end
          r4_8:SetVisibility(r6_8)
          r0_8.LevelMap_Convey_Widget_PC:InitialTempleAndPartyInfo(r3_8, r0_8.CurrentSelectPoint.Img_Point.Brush.ResourceObject, r0_8.RegionIcon)
        end
      else
        r0_8.LevelMap_Convey_Widget_PC.Lock:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
        r0_8.LevelMap_Convey_Widget_PC.Switch_Button:SetActiveWidgetIndex(1)
      end
      local r3_8 = r0_8.TeleportPoint2FloorId[r2_8.Id]
      if r3_8 then
        r0_8:OnFloorBtnClicked(r3_8, true)
      end
    end
    r0_8:OnPanelOpen(2)
    if r0_8:GetTrackingId(CommonConst.RegionMapTrackingType.TeleportPoint) ~= r0_8.CurrentConveyId then
      r0_8.LevelMap_Convey_Widget_PC.Btn_Track:SetText(GText("UI_RegionMap_Track"))
      r0_8.LevelMap_Convey_Widget_PC.Btn_Track.Img_Track:SetBrushResourceObject(LoadObject("/Game/UI/Texture/Static/Atlas/Common/T_Com_IconTrack.T_Com_IconTrack"))
      r0_8.LevelMap_Convey_Widget_PC.Btn_Track.Img_Track:SetBrushTintColor(UE4.UUIFunctionLibrary.StringToSlateColor("E1B454"))
    else
      r0_8.LevelMap_Convey_Widget_PC.Btn_Track:SetText(GText("UI_RegionMap_Untrack"))
      r0_8.LevelMap_Convey_Widget_PC.Btn_Track.Img_Track:SetBrushResourceObject(LoadObject("/Game/UI/Texture/Static/Atlas/Common/T_Com_IconNo.T_Com_IconNo"))
      r0_8.LevelMap_Convey_Widget_PC.Btn_Track.Img_Track:SetBrushTintColor(UE4.UUIFunctionLibrary.StringToSlateColor("BD4545"))
    end
    r0_8:MoveMapToTelepoint(r1_8)
    r0_8.LevelMap_Convey_Widget_PC:SetFocus()
  end,
  OnConveyClicked = function(r0_9, r1_9)
    -- line: [319, 337] id: 9
    if not r0_9.TeleportState[r0_9.CurrentConveyId] and not Const.UnlockRegionTeleport and not r1_9 then
      UIManager(r0_9):ShowUITip(UIConst.Tip_CommonTop, GText("UI_TELEPORTPOINT_UNLOCK"))
      return 
    end
    AudioManager(r0_9):PlayUISound(r0_9, "event:/ui/common/map_click_enter_level", "", nil)
    if r0_9.CurrentConveyId and not r0_9.IsConveyClicked then
      local r2_9 = UE4.UGameplayStatics.GetGameMode(r0_9)
      local r3_9 = GWorld:GetAvatar()
      local r4_9 = DataMgr.TeleportPoint[r0_9.CurrentConveyId]
      if r3_9 and r2_9 and r4_9 then
        r0_9.MainMap:BindToAnimationFinished(r0_9.MainMap.Auto_Out, function()
          -- line: [330, 332] id: 10
          r2_9:HandleLevelDeliver(UE4.EModeType.ModeRegion, r4_9.TeleportPointSubRegion, r4_9.TeleportPointPos, nil, true, true)
        end)
        r0_9.MainMap:Close()
        r0_9.IsConveyClicked = true
      end
      -- close: r2_9
    end
  end,
  OnTraceSound = function(r0_11)
    -- line: [339, 341] id: 11
    AudioManager(r0_11):PlayUISound(r0_11, "event:/ui/common/click_btn_confirm", "", nil)
  end,
  OnConveyTrace = function(r0_12)
    -- line: [343, 357] id: 12
    if r0_12.CurrentConveyId then
      if r0_12:GetTrackingId(CommonConst.RegionMapTrackingType.TeleportPoint) ~= r0_12.CurrentConveyId then
        r0_12:CancelCurrentTracking()
        EventManager:FireEvent(EventID.OnCommonTrack, CommonConst.RegionMapTrackingType.TeleportPoint, r0_12.CurrentConveyId, true)
        r0_12.CurrentSelectPoint:PlayAnimation(r0_12.CurrentSelectPoint.Loop, 0, 0)
        r0_12:CreateTrackIndicator(r0_12.CurrentSelectPoint)
      else
        EventManager:FireEvent(EventID.OnCommonTrack, CommonConst.RegionMapTrackingType.TeleportPoint, r0_12.CurrentConveyId, false)
        r0_12.CurrentSelectPoint:StopAllAnimations()
        r0_12:RemoveTrackIndicator()
      end
    end
    r0_12:ClosePanel(false)
  end,
  OnTeleportHover = function(r0_13, r1_13)
    -- line: [359, 364] id: 13
    if r0_13.TeleportPoints[r1_13] and r0_13.SelectWidgetTable[r1_13] ~= r0_13.ClickedSelectWidget then
      r0_13.SelectWidgetTable[r1_13]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      r0_13.SelectWidgetTable[r1_13]:PlayAnimation(r0_13.SelectWidgetTable[r1_13].Hover)
    end
  end,
  OnTeleportUnhover = function(r0_14, r1_14)
    -- line: [366, 370] id: 14
    if r0_14.TeleportPoints[r1_14] and r0_14.SelectWidgetTable[r1_14] ~= r0_14.ClickedSelectWidget then
      r0_14.SelectWidgetTable[r1_14]:SetVisibility(ESlateVisibility.Collapsed)
    end
  end,
  ShowHardBoss = function(r0_15, r1_15)
    -- line: [372, 376] id: 15
    for r6_15, r7_15 in pairs(r0_15.TeleportIdToHardBossId) do
      r0_15.TeleportPoints[r6_15]:SetPointVisibility("HardBoss", r1_15, true)
    end
    -- close: r2_15
  end,
  CheckTempleAndPartyInfo = function(r0_16, r1_16)
    -- line: [378, 401] id: 16
    local r2_16 = GWorld:GetAvatar()
    if not r2_16 then
      error("Avatar is nil")
    end
    local r3_16 = {}
    if r2_16:CheckUIUnlocked(DataMgr.UIUnlockRule.Temple.UIUnlockRuleId) and DataMgr.TeleportPoint[r1_16] and DataMgr.TeleportPoint[r1_16].Temples ~= nil then
      for r11_16, r12_16 in ipairs(DataMgr.TeleportPoint[r1_16].Temples) do
        table.insert(r3_16, r12_16)
      end
      -- close: r7_16
    end
    return r3_16
  end,
}
