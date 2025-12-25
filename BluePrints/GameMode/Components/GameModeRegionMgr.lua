-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\GameMode\Components\GameModeRegionMgr.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
require("Utils")
local r0_0 = require("Utils.LoadingUtils")
return {
  GetLevelGamemModeAndLevelName = function(r0_1, r1_1)
    -- line: [8, 11] id: 1
    local r2_1 = r0_1:GetLevelLoader():GetLevelIdByRegionId(r1_1)
    return r2_1, r0_1.SubGameModeInfo:FindRef(r2_1)
  end,
  IsWorldLoader = function(r0_2, r1_2)
    -- line: [13, 16] id: 2
    if not r1_2 then
      r1_2 = r0_2:GetLevelLoader()
    end
    return IsValid(r1_2) and r1_2.IsWorldLoader
  end,
  SetEnterLevelStateReady = function(r0_3)
    -- line: [18, 24] id: 3
    local r1_3 = GWorld:GetAvatar()
    if not r1_3 then
      return 
    end
    r1_3:SetEnterLevelStateReady()
  end,
  SaveQuestData = function(r0_4, r1_4)
    -- line: [26, 35] id: 4
    if IsStandAlone(r0_4) then
      local r2_4 = GWorld:GetAvatar()
      if r2_4 then
        r2_4:UpdateRegionData(r1_4, UE4.ERegionDataType.RDT_QuestData)
      end
    elseif IsDedicatedServer(r0_4) then
      print(_G.LogTag, "ZJT_ IsDedicatedServer Not Do ")
    end
  end,
  SaveCommonData = function(r0_5, r1_5)
    -- line: [37, 46] id: 5
    if IsStandAlone(r0_5) then
      local r2_5 = GWorld:GetAvatar()
      if r2_5 then
        r2_5:UpdateRegionData(r1_5, UE4.ERegionDataType.RDT_CommonData)
      end
    elseif IsDedicatedServer(r0_5) then
      print(_G.LogTag, "ZJT_ IsDedicatedServer Not Do")
    end
  end,
  SaveRarelyData = function(r0_6, r1_6)
    -- line: [48, 50] id: 6
    print(_G.LogTag, "ZJT_ IsDedicatedServer Not Do")
  end,
  HandleLevelDeliverBlackCurtainEnd = function(r0_7)
    -- line: [54, 115] id: 7
    AudioManager(r0_7):SetEventSoundParam(r0_7, "Loading", {
      ToEnd = 1,
    })
    AudioManager(r0_7):ResumePlayBGMCauseIsLoadingOrBlackScreen()
    local r1_7 = UE4.UGameplayStatics.GetPlayerCharacter(r0_7, 0)
    r1_7:RemoveDisableInputTag("DeliverBlackCurtain")
    DebugPrint("HandleLevelDeliverBlackCurtainEnd CB1")
    local r2_7 = UE4.UGameplayStatics.GetGameInstance(r0_7)
    local r3_7 = r2_7:GetGameUIManager()
    local r4_7 = r3_7:GetUIObj("MainTaskIndicator")
    r3_7:HideCommonBlackScreen("HandleLevelDeliverBlackCurtain")
    local r5_7 = r3_7:GetUIObj("BlackScreenXiaobai")
    local r6_7 = nil	-- notice: implicit variable refs by block#[6, 7]
    if r5_7 then
      r6_7 = r2_7:GetSceneManager()
      local function r7_7()
        -- line: [69, 84] id: 8
        r4_7 = r3_7:GetUIObj("MainTaskIndicator")
        if IsValid(r4_7) then
          r4_7:SetVisibility(UE4.ESlateVisibility.Visible)
        end
        r6_7 = r2_7:GetSceneManager()
        r6_7:ShowOrHideAllSceneGuideIcon(true)
        r5_7:UnbindAllFromAnimationFinished(r5_7.Out)
        local r0_8 = r3_7:GetUIObj("BlackScreenXiaobai")
        if r0_8 then
          r0_8:CloseUI()
        end
        EventManager:FireEvent(EventID.OnLevelDeliverBlackCurtainEnd, r1_7.Eid)
      end
      r5_7:BindToAnimationFinished(r5_7.Out, {
        r5_7,
        r7_7
      })
      r5_7:PlayAnimationForward(r5_7.Out, 1, true)
      if not r5_7.Out then
        r7_7()
      end
      -- close: r6_7
    end
    function r6_7()
      -- line: [91, 98] id: 9
      r4_7 = r3_7:GetUIObj("MainTaskIndicator")
      if IsValid(r4_7) then
        r4_7:SetVisibility(UE4.ESlateVisibility.Visible)
      end
      r2_7:GetSceneManager():ShowOrHideAllSceneGuideIcon(true)
    end
    if r0_7.WidgetLoading then
      if r0_7.WidgetLoading.CloseUI then
        r0_7.WidgetLoading:CloseUI(r6_7)
      else
        r0_7.WidgetLoading:RemoveFromParent()
        r6_7()
      end
      r0_7.WidgetLoading = nil
    end
    local r7_7 = UE4.UGameplayStatics.GetPlayerCharacter(r0_7, 0)
    if IsValid(r7_7) then
      r7_7:DisablePlayerInputInDeliver(false)
    end
    EventManager:FireEvent(EventID.OnLevelDeliverBlackCurtainEnd, r7_7.Eid)
  end,
  CloseCurUI = function(r0_10)
    -- line: [117, 157] id: 10
    local r2_10 = UE4.UGameplayStatics.GetGameInstance(r0_10):GetGameUIManager()
    local r3_10 = r2_10.CurrentUIList:ToTable()
    for r7_10 = #r3_10, 1, -1 do
      local r8_10 = r3_10[r7_10]
      local r9_10 = r2_10:GetUI(r8_10)
      if r9_10 and r9_10.GetUIConfigName then
        local r10_10 = DataMgr.SystemUI[r9_10:GetUIConfigName()]
        local r11_10 = true
        if r10_10 and (r10_10.System == "Battle" or r10_10.System == "Common" or r10_10.System == "Story") then
          r11_10 = false
        end
        if r8_10 == "CommonBlackScreen" or r8_10 == "BlackScreenXiaobai" or r8_10 == "SceneStartUI" or r8_10 == "SelectRole" then
          r11_10 = false
        end
        if r8_10 == "GuideIconMain" or r9_10.IsDungeonIndicator then
          r11_10 = false
        end
        if r8_10 == "Entertainment" then
          r11_10 = false
        end
        if r8_10 == "TalkGuideUI" then
          r11_10 = false
        end
        if r8_10 == "TheaterTaskTime" then
          r11_10 = false
        end
        if r11_10 then
          DebugPrint("HandleLevelDeliverBlackCurtainEnd Systemui Close:", r8_10)
          r9_10:Close()
        end
      end
    end
  end,
  InterruptBlackCurtainEnd = function(r0_11)
    -- line: [159, 172] id: 11
    local r2_11 = UE4.UGameplayStatics.GetGameInstance(r0_11):GetGameUIManager()
    local r3_11 = r2_11:GetUIObj("CommonBlackScreen") and r2_11:GetUIObj("BlackScreenXiaobai")
    if not r3_11 then
      return 
    end
    if r3_11:IsAnimationPlaying(r3_11.FadeOutAnimation) then
      r3_11:StopAnimation(r3_11.FadeOutAnimation)
    end
  end,
  HandleLevelDeliverBlackCurtainStart = function(r0_12, r1_12, r2_12)
    -- line: [174, 250] id: 12
    DebugPrint("HandleLevelDeliverBlackCurtainStart")
    AudioManager(r0_12):PlayUISound(r0_12, "event:/ui/common/loading_common", "Loading", nil)
    AudioManager(r0_12):PausePlayBGMCauseIsLoadingOrBlackScreen()
    local r3_12 = UE4.UGameplayStatics.GetPlayerCharacter(r0_12, 0)
    if IsValid(r3_12) then
      r3_12:DisablePlayerInputInDeliver(true)
    end
    EventManager:FireEvent(EventID.OnLevelDeliverBlackCurtainStart)
    local r4_12 = UE4.UGameplayStatics.GetGameInstance(r0_12)
    local r5_12 = r4_12:GetGameUIManager()
    local r6_12 = r5_12:GetUIObj("CommonBlackScreen")
    local r7_12 = r4_12:GetSceneManager()
    if r6_12 then
      r5_12:CloseCommonBlackScreenWithoutCB("HandleLevelDeliverBlackCurtain")
      local r8_12 = r5_12:GetUIObj("MainTaskIndicator")
      if IsValid(r8_12) then
        r8_12:SetVisibility(UE4.ESlateVisibility.Visible)
      end
      r7_12 = r4_12:GetSceneManager()
      r7_12:ShowOrHideAllSceneGuideIcon(true)
    end
    r6_12 = r5_12:GetUIObj("BlackScreenXiaobai")
    if r6_12 then
      r6_12:CloseUI()
    end
    local r8_12, r9_12 = r0_0:GetLoadingBpPath(false)
    local r11_12 = nil	-- notice: implicit variable refs by block#[19]
    if r9_12 then
      local r10_12 = r5_12:CreateWidget(r9_12)
      r11_12 = DataMgr.SystemUI.BlackScreenXiaobai
      local r14_12 = nil	-- notice: implicit variable refs by block#[12]
      if r11_12 then
        r14_12 = r11_12.ZOrder
        if not r14_12 then
          ::label_98::
          r14_12 = 105
        end
      else
        goto label_98	-- block#11 is visited secondly
      end
      r10_12:AddToViewport(r14_12)
      if r10_12.InitLoadingData then
        r10_12:InitLoadingData(r8_12, nil)
      end
      r0_12.WidgetLoading = r10_12
    elseif not r2_12 then
      local r10_12 = {
        BlackScreenHandle = "HandleLevelDeliverBlackCurtain",
      }
      if r1_12 then
        r11_12 = "White"
        if not r11_12 then
          ::label_119::
          r11_12 = "Black"
        end
      else
        goto label_119	-- block#18 is visited secondly
      end
      r10_12.ScreenColor = r11_12
      r10_12.OutAnimationPlayTime = 0.5
      r10_12.OutAnimationObj = r0_12
      function r10_12.OutAnimationCallback()
        -- line: [219, 228] id: 13
        local r0_13 = r4_12:GetSceneManager()
        local r1_13 = r5_12:GetUIObj("MainTaskIndicator")
        if IsValid(r1_13) then
          r1_13:SetVisibility(UE4.ESlateVisibility.Visible)
        end
        r4_12:GetSceneManager():ShowOrHideAllSceneGuideIcon(true)
        EventManager:FireEvent(EventID.OnLevelDeliverBlackCurtainEnd, r3_12.Eid)
      end
      r5_12:ShowCommonBlackScreen(r10_12)
    else
      r5_12:LoadUINew("BlackScreenXiaobai", r1_12).bUseFakeProgress = true
    end
    r7_12:ShowOrHideAllSceneGuideIcon(false)
    local r10_12 = r5_12:GetUIObj("MainTaskIndicator")
    r11_12 = IsValid(r10_12)
    if r11_12 then
      r10_12:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    r3_12:ResetIdle()
    r11_12 = r0_12:IsExistTimer("HandleLevelDeliver", true)
    if r11_12 then
      r0_12:RemoveTimer("HandleLevelDeliver", true)
    end
  end,
  StopLimitTimeExploreGroup = function(r0_14)
    -- line: [252, 259] id: 14
    if r0_14.EMGameState.ActiveLimitTimeExploreGroup == 0 then
      return 
    end
    r0_14.EMGameState.ExploreGroupMap:FindRef(r0_14.EMGameState.ActiveLimitTimeExploreGroup):FailLimitExplore()
  end,
  AsyncSetPlayerByStartIndex = function(r0_15, r1_15, r2_15, r3_15, r4_15, r5_15, r6_15)
    -- line: [261, 309] id: 15
    r0_15:HandleLevelDeliverBlackCurtainStart(r5_15, r6_15)
    local r7_15 = r0_15:GetLevelLoader()
    local r8_15 = r7_15.WorldCompositionSubSystem
    if r8_15 and r0_15:IsInRegion() then
      local r10_15 = r0_15:GetLevelLoader():GetStartPointByManager(r2_15, r3_15):GetTransform()
      local r11_15 = UE4.UGameplayStatics.GetPlayerCharacter(r0_15, 0)
      local r12_15 = r7_15:GetRegionIdByLevelId(r2_15)
      r8_15:RequestAsyncTravel(r11_15, r10_15, {
        r0_15,
        function()
          -- line: [274, 287] id: 16
          UE4.UGameplayStatics.GetPlayerCharacter(r0_15, 0):AddDisableInputTag("DeliverBlackCurtain")
          r0_15:HandleLevelDeliverBlackCurtainEnd()
          local r1_16 = GWorld:GetAvatar()
          DebugPrint("ExeRegionSkipCallbck", r12_15, r1_16.CurrentRegionId)
          r1_16:ExeRegionSkipCallbck(r12_15 and r1_16.CurrentRegionId, "Enter")
          if r1_16:CheckCurrentSubRegion() and r1_16:CheckSubRegionType(nil, CommonConst.SubRegionType.Field) and not r1_16.IsOpenPlayerPositionSync then
            DebugPrint("AsyncSetPlayerByStartIndex, PlayerEnterBigWorld")
            r1_16:PlayerEnterBigWorld()
          end
        end
      })
      return 
      -- close: r9_15
    end
  end,
  AsyncSetPlayerByLocationAndRotation = function(r0_17, r1_17, r2_17, r3_17, r4_17, r5_17, r6_17)
    -- line: [311, 352] id: 17
    local r7_17 = r0_17:GetLevelLoader()
    r0_17:HandleLevelDeliverBlackCurtainStart(r6_17)
    local r8_17 = r7_17.WorldCompositionSubSystem
    if r8_17 and r0_17:IsInRegion() then
      r8_17:RequestAsyncTravel(UE4.UGameplayStatics.GetPlayerCharacter(r0_17, 0), UE4.UKismetMathLibrary.MakeTransform(r3_17, r4_17, UE4.FVector(1, 1, 1)), {
        r0_17,
        function()
          -- line: [320, 325] id: 18
          UE4.UGameplayStatics.GetPlayerCharacter(r0_17, 0):AddDisableInputTag("DeliverBlackCurtain")
          r0_17:HandleLevelDeliverBlackCurtainEnd()
        end
      })
      return 
    end
  end,
  SetPlayerLocationAndRotation = function(r0_19, r1_19, r2_19)
    -- line: [354, 357] id: 19
    r0_19:GetLevelLoader():GetStartPointByManager(r1_19, r2_19):SetPlayerTrans()
  end,
  PrepareLevelDelivery = function(r0_20, r1_20, r2_20)
    -- line: [358, 361] id: 20
    r0_20.TargetSubRegion = r1_20
    r0_20.TargetSpawnPoint = r2_20
  end,
  HandleLevelDeliver = function(r0_21, r1_21, r2_21, r3_21, r4_21, r5_21, r6_21)
    -- line: [362, 534] id: 21
    r2_21 = tonumber(r2_21)
    r1_21 = tonumber(r1_21)
    r3_21 = tonumber(r3_21)
    r0_21:PrepareLevelDelivery(r2_21, r3_21)
    local r7_21 = GWorld:GetAvatar()
    local r8_21 = r0_21:GetLevelLoader()
    if not r7_21 or r1_21 == UE4.EModeType.ModeNone then
      return false
    end
    local r9_21 = UGameplayStatics.GetPlayerCharacter(r0_21, 0)
    if r1_21 == UE4.EModeType.ModeRegion then
      local r10_21 = HeroUSDKSubsystem()
      local r12_21 = "event_transmit"
      local r13_21 = {}
      local r14_21 = tostring(r7_21.CurrentRegionId)
      r13_21.before_map_id = r14_21
      if r9_21 then
        r14_21 = tostring(r9_21:K2_GetActorLocation()) and ""
      else
        goto label_58	-- block#6 is visited secondly
      end
      r13_21.position = r14_21
      r13_21.trans_id = tostring(r3_21)
      r13_21.after_map_id = tostring(r2_21)
      r13_21.trans_type = CommonConst.EnterRegionType.Deliver
      r10_21:UploadTrackLog_Lua(r12_21, r13_21)
    end
    if UE4.UGameplayStatics.GetPlayerController(r0_21, 0):GetStoryModeState() then
      UE4.UGameplayStatics.GetGameInstance(r0_21):GetGameUIManager():ShowError(ErrorCode.RET_STORYMODE_STOP_HANDLE_DELIVER_REGION)
      return false
    end
    local r11_21 = UE4.UGameplayStatics.GetGameInstance(r0_21)
    local r12_21 = r11_21:GetGameUIManager()
    local r13_21 = r12_21:GetUIObj(UIConst.MenuWorld)
    if r13_21 then
      r13_21:Close()
    end
    local r14_21 = r11_21:GetSceneManager()
    if IsValid(r14_21) then
      if r14_21.NearestPetGuideEid > 0 then
        r14_21:CloseOneGuideIconByTargetEid(r14_21.NearestPetGuideEid)
        r14_21.NearestPetGuideEid = 0
      end
      if r14_21.NearestBreakableItemGuideEid > 0 then
        r14_21:CloseOneGuideIconByTargetEid(r14_21.NearestBreakableItemGuideEid)
        r14_21.NearestBreakableItemGuideEid = 0
      end
    end
    r11_21.ShouldPlayDeliveryEndMontage = false
    r11_21.AlreadyDeliver = false
    local r17_21 = nil	-- notice: implicit variable refs by block#[39]
    local r18_21 = nil	-- notice: implicit variable refs by block#[39, 42]
    local r19_21 = nil	-- notice: implicit variable refs by block#[42]
    if r1_21 == UE4.EModeType.ModeRegion then
      local r15_21 = DataMgr.SubRegion[r2_21]
      r17_21 = r7_21.CurrentRegionId
      local r16_21 = DataMgr.SubRegion[r17_21]
      if not r15_21 then
        r17_21 = false
        return r17_21
      end
      r17_21 = DataMgr.Region[r16_21.RegionId].RegionMapFile
      r18_21 = DataMgr.Region[r15_21.RegionId].RegionMapFile
      r19_21 = IsValid(r8_21)
      if not r19_21 then
        r19_21 = r7_21:IsRealInBigWorld()
        if r19_21 then
          if r17_21 == r18_21 then
            r19_21 = false
            return r19_21
          end
          r7_21:EnterRegion(r2_21, r3_21, CommonConst.EnterRegionType.Deliver, nil, r5_21)
        else
          r7_21:EnterRegion(r2_21, r3_21, CommonConst.EnterRegionType.Deliver, nil, r5_21)
        end
      else
        function r19_21()
          -- line: [426, 445] id: 22
          if r8_21.IsWorldLoader then
            if r17_21 == r18_21 then
              local r0_22 = r8_21:GetLevelIdByRegionId(r2_21)
              if not r0_21:CheckSkipRegionByStartIndex(r0_22, r3_21) then
                return false
              end
              r7_21:ClosePlayerPositionSync()
              r0_21:StopLimitTimeExploreGroup()
              if r6_21 then
                local r1_22 = {
                  BlackScreenHandle = "HandleLevelDeliverBlackCurtain",
                  InAnimationObj = r0_21,
                  OutAnimationObj = r0_21,
                }
                local r2_22 = r4_21
                if r2_22 then
                  r2_22 = "White" and "Black"
                else
                  goto label_42	-- block#7 is visited secondly
                end
                r1_22.ScreenColor = r2_22
                r12_21:ShowCommonBlackScreen(r1_22)
              end
              ULoadLevel.DeliverTargtePlayer(r0_21, r0_22, r3_21, true, r4_21, r6_21)
            else
              r7_21:EnterRegion(r2_21, r3_21, CommonConst.EnterRegionType.Deliver, nil, r5_21)
            end
          else
            r7_21:EnterRegion(r2_21, r3_21, CommonConst.EnterRegionType.Deliver, nil, r5_21)
          end
        end
        local function r20_21()
          -- line: [449, 458] id: 23
          DebugPrint("zwk RealDelivery")
          r9_21:SetInvincible(false, "Delivery")
          r9_21:SetSuperArmor(false, "Delivery")
          r9_21:SetTNCannotReduce(false, "Delivery")
          r11_21.AlreadyDeliver = true
          r9_21:SetActorHideTag("DeliveryMontage", true)
          r19_21()
          r0_21:DeliveryHideWeapon(r9_21, false)
        end
        local r23_21 = {
          OnNotifyBegin = function()
            -- line: [459, 465] id: 24
            DebugPrint("zwk OnDeliveryPreLoadingMontageNotifyBegin")
            if not r11_21.AlreadyDeliver then
              r20_21()
            end
          end,
          OnInterrupted = function()
            -- line: [466, 476] id: 25
            DebugPrint("zwk OnDeliveryPreLoadingInterrupted", r11_21.ShouldPlayDeliveryEndMontage, r11_21.AlreadyDeliver)
            if not r11_21.AlreadyDeliver then
              local r0_25 = r9_21:K2_GetActorRotation()
              r0_25.Pitch = 0
              r0_25.Roll = 0
              r9_21:K2_SetActorRotation(r0_25, false, nil, false)
              r20_21()
            end
          end,
        }
        if r6_21 then
          DebugPrint("zwk OnDeliveryPreLoadingMontageBeginLoad")
          r9_21:ForceClearActorHideTag()
          r11_21:OnCharaterReset()
          r9_21.CameraControlComponent:RemoveStatesEXBasic()
          local r24_21 = r9_21.CharCameraComponent:K2_GetComponentRotation()
          r24_21.Pitch = 0
          r24_21.Roll = 0
          r9_21:K2_SetActorRotation(r24_21, false, nil, false)
          r0_21:CloseCurUI()
          r9_21:AddDisableInputTag("DeliverBlackCurtain")
          r9_21:DisablePlayerInputInDeliver(true)
          r9_21:SetInvincible(true, "Delivery")
          r9_21:SetSuperArmor(true, "Delivery")
          r9_21:SetTNCannotReduce(true, "Delivery")
          r0_21:DeliveryHideWeapon(r9_21, true)
          r9_21:SetActorHideTag("DeliveryMontage", false)
          r11_21.ShouldPlayDeliveryEndMontage = true
          if r9_21:IsMainPlayer() and r9_21:IsExistTimer("SetOnlineStateNormal") then
            r9_21:RemoveTimer("SetOnlineStateNormal")
          end
          if r7_21.IsInRegionOnline and r7_21.CurrentOnlineType then
            DebugPrint("zwk 区域联机传送 ", r7_21.IsInRegionOnline, IsClient(r0_21), IsDedicatedServer(r0_21), IsStandAlone(r0_21))
            r9_21:ForceReSyncLocation()
            r7_21:SwitchOnlineState(r7_21.CurrentOnlineType, CommonConst.OnlineState.UseDelivery)
          end
          r9_21:PlayTeleportAction(r23_21, false, true, false)
          r0_21:AddTimer(5, function()
            -- line: [511, 519] id: 26
            if r9_21 then
              r9_21:SetInvincible(false, "Delivery")
              r9_21:SetSuperArmor(false, "Delivery")
              r9_21:SetTNCannotReduce(false, "Delivery")
              r0_21:DeliveryHideWeapon(r9_21, false)
            end
          end, false, 0, "DisableInvincible", true)
        else
          r19_21()
        end
        -- close: r19_21
      end
      -- close: r15_21
    elseif r1_21 == UE4.EModeType.ModeDungeon then
      if r7_21:IsRealInBigWorld() then
        r17_21 = r2_21
        r18_21 = nil
        r7_21:EnterDungeon(r17_21, r18_21)
      else
        if GWorld.GameInstance:GetCurrentDungeonId() == r2_21 then
          return false
        end
        r18_21 = r2_21
        r19_21 = nil
        r7_21:EnterDungeon(r18_21, r19_21)
      end
    end
    return true
  end,
  DeliveryHideWeapon = function(r0_27, r1_27, r2_27)
    -- line: [536, 540] id: 27
    for r7_27, r8_27 in pairs(r1_27.Weapons) do
      r8_27:SetActorHideTag("Delivery", r2_27)
    end
    -- close: r3_27
  end,
  CheckSkipRegionByStartIndex = function(r0_28, r1_28, r2_28)
    -- line: [542, 545] id: 28
    return IsValid(r0_28:GetLevelLoader():GetStartPointByManager(r1_28, r2_28))
  end,
  DeliverByLocationAndRotation = function(r0_29, r1_29, r2_29, r3_29, r4_29)
    -- line: [547, 566] id: 29
    local r5_29 = GWorld:GetAvatar()
    if not r5_29 then
      return 
    end
    local r6_29 = DataMgr.SubRegion[r1_29]
    local r7_29 = DataMgr.SubRegion[r5_29.CurrentRegionId]
    if not r6_29 then
      return 
    end
    if DataMgr.Region[r7_29.RegionId].RegionMapFile == DataMgr.Region[r6_29.RegionId].RegionMapFile then
      local r11_29 = r0_29:GetLevelLoader():GetLevelIdByRegionId(r1_29)
      r5_29:ClosePlayerPositionSync()
      r0_29:StopLimitTimeExploreGroup()
      ULoadLevel.DeliverTargtePlayerByLocationAndRotation(r0_29, r11_29, FVector(r2_29.X, r2_29.Y, r2_29.Z), FRotator(r3_29.Pitch, r3_29.Yaw, r3_29.Roll), true, r4_29)
    end
  end,
  DelDrop = function(r0_30, r1_30)
    -- line: [571, 577] id: 30
    r0_30.LevelGameMode.DropRule[r1_30] = true
    local r2_30 = GWorld:GetAvatar()
    if r2_30 then
      r2_30:UpdateSuitKey2Value(CommonConst.SuitType.GameModeSuit, CommonConst.GameModeSuit.DropRule, r1_30, true)
    end
  end,
  RecoverDrop = function(r0_31, r1_31)
    -- line: [580, 586] id: 31
    r0_31.LevelGameMode.DropRule[r1_31] = false
    local r2_31 = GWorld:GetAvatar()
    if r2_31 then
      r2_31:UpdateSuitKey2Value(CommonConst.SuitType.GameModeSuit, CommonConst.GameModeSuit.DropRule, r1_31, false)
    end
  end,
}
