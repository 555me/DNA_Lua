-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Client\Entities\Components\DungeonMgr.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("Utils.MiscUtils")
return {
  EnterWorld = function(r0_1)
    -- line: [4, 5] id: 1
  end,
  GMEnterDsVersion = function(r0_2, r1_2, r2_2)
    -- line: [7, 9] id: 2
    r0_2:EnterDungeon(r1_2, 2, nil, nil, nil, {
      DSVersion = r2_2,
    })
  end,
  CommonPreEnterDungeon = function(r0_3)
    -- line: [11, 13] id: 3
    GWorld:CloseWorldRegionState()
  end,
  EnterDungeon = function(r0_4, r1_4, r2_4, r3_4, r4_4, r5_4, r6_4)
    -- line: [15, 43] id: 4
    r0_4:CommonPreEnterDungeon()
    if not r1_4 then
      return 
    end
    local r7_4 = DataMgr.Dungeon[r1_4]
    if not r7_4 then
      return 
    end
    local function r8_4(r0_5, ...)
      -- line: [25, 32] id: 5
      r0_4.logger.debug(string.format("EnterDungeon callback, Ret is %s, DungeonId is %s, DungeonNetMode is %s", r0_5, r1_4, r2_4))
      if r3_4 then
        r3_4(r0_5, ...)
      end
    end
    print(_G.LogTag, "EnterDungeon with DungeonType", r7_4.DungeonType, r1_4, r4_4)
    if not r2_4 then
      r2_4 = CommonConst.DungeonNetMode.Standalone
    end
    if not r6_4 then
      r6_4 = {}
    end
    r6_4.DSVersion = r6_4.DSVersion and r0_0.GetGameCofingSettings("DSVersion") and 0
    if not r4_4 then
      r4_4 = -1
    end
    if not r5_4 then
      r5_4 = 0
    end
    r0_4:CallServer("ClientEnterDungeon", r8_4, r1_4, r2_4, r5_4, r4_4, r6_4)
  end,
  EnterDungeonAgain = function(r0_6, r1_6, r2_6, r3_6)
    -- line: [46, 62] id: 6
    DebugPrint("gmy@DungeonMgr Component:EnterDungeonAgain", r1_6, r2_6, r3_6)
    r0_6:CommonPreEnterDungeon()
    local function r4_6(r0_7, ...)
      -- line: [49, 56] id: 7
      r0_6.logger.debug(string.format("EnterDungeonAgain callback, Ret is %s", r0_7))
      ErrorCode:Check(r0_7)
      if r1_6 then
        r1_6(r0_7, ...)
      end
    end
    if not r3_6 then
      r3_6 = {}
    end
    r3_6.DSVersion = r3_6.DSVersion and Const.DSVersion
    if not r2_6 then
      r2_6 = -1
    end
    r0_6:CallServer("ClientEnterDungeonAgain", r4_6, r2_6, r3_6)
  end,
  CancelEnterDungeon = function(r0_8, r1_8)
    -- line: [64, 74] id: 8
    if r0_8:IsInTeam() then
      r0_8:CallServer("TeamCancelEnterDungeon")
    else
      r0_8:CallServer("CancelEnterDungeon", function(r0_9)
        -- line: [68, 71] id: 9
        r0_8.logger.debug("CancelEnterDungeon callback, ", r0_9)
        ErrorCode:Check(r0_9)
      end, r1_8)
    end
  end,
  OnCancelEnterDungeon = function(r0_10)
    -- line: [76, 78] id: 10
    print(_G.LogTag, "OnCancelEnterDungeon")
  end,
  EnterCharTrial = function(r0_11, r1_11, r2_11, r3_11)
    -- line: [80, 82] id: 11
    r0_11:EnterDungeon(r2_11, nil, r1_11, nil, nil, {
      Id = r3_11,
    })
  end,
  EnterCharTrialByEvent = function(r0_12, r1_12, r2_12, r3_12)
    -- line: [84, 86] id: 12
    r0_12:EnterEventDungeon(r1_12, r2_12, nil, r3_12)
  end,
  EnterEventDungeon = function(r0_13, r1_13, r2_13, r3_13, r4_13, r5_13)
    -- line: [88, 106] id: 13
    r0_13:CommonPreEnterDungeon()
    if not r2_13 then
      return 
    end
    assert(DataMgr.Dungeon[r2_13])
    assert(r4_13)
    if not r3_13 then
      r3_13 = 0
    end
    if not r5_13 then
      r5_13 = {}
    end
    r0_13:CallServer("EnterEventDungeon", function(r0_14, ...)
      -- line: [98, 104] id: 14
      print(_G.LogTag, "EnterEventDungeon callback, ret ", r0_14)
      if r1_13 then
        r1_13(r0_14, ...)
      end
    end, r2_13, r3_13, r4_13, r5_13)
  end,
  OnDungeonFinish = function(r0_15, r1_15, r2_15, r3_15, r4_15, r5_15, r6_15, r7_15)
    -- line: [108, 142] id: 15
    r0_15.logger.info(string.format("OnDungeonFinish, DungeonId is %d, IsWin is %s, PlayerTime is %s, GameTime is %s", r1_15, r2_15, r5_15, r6_15))
    PrintTable({
      ClientRes = r7_15,
    }, 10)
    r0_15.CacheDSInfo = nil
    r0_15:ResetCachedDungeonRewards()
    if not GWorld.GameInstance:GetGameUIManager() then
      return 
    end
    if not r0_15:IsInDungeon2() and not r0_15:IsInHardBoss() then
      print(_G.LogTag, "LogicServer_OnDungeonFinish Not InDungeon or InHardBoss")
      return 
    end
    local function r9_15()
      -- line: [123, 130] id: 16
      print(_G.LogTag, "LogicServer_OnDungeonFinish RealOnDungeonFinish", r1_15, r2_15, r3_15, r4_15, r5_15, r6_15)
      if r0_15.ReconnectTag then
        EventManager:RemoveEvent(EventID.CloseLoading, r0_15)
      end
      GWorld.GameInstance:PushLogicServerCallbackInfo(r2_15, r1_15, r3_15, r4_15, r5_15, r6_15, r7_15)
    end
    if GWorld.GameInstance:GetLoadingUI() then
      print(_G.LogTag, "LogicServer_OnDungeonFinish GetLoadingUI")
      r0_15.ReconnectTag = true
      EventManager:AddEvent(EventID.CloseLoading, r0_15, r9_15)
      return 
    end
    print(_G.LogTag, "LogicServer_OnDungeonFinish OnDungeonFinish")
    r9_15()
  end,
  NotifyUnCostItems = function(r0_17, r1_17)
    -- line: [144, 153] id: 17
    r0_17.logger.info("NotifyUnCostItems")
    PrintTable(r1_17, 3)
    DebugPrint("thy    NotifyUnCostItems In")
    GWorld.GameInstance.UnCostItemsInfo = r1_17
    local r2_17 = UIManager(r0_17):GetUI("DungeonSettlement")
    if r2_17 then
      r2_17:InitRefundInfo(GWorld.GameInstance.UnCostItemsInfo)
    end
  end,
  UpdateDungeonProgress = function(r0_18)
    -- line: [155, 158] id: 18
    print(_G.LogTag, "Avatar UpdateDungeonProgress")
    r0_18:CallServerMethod("UpdateDungeonProgress")
  end,
  ContinueDungeonSettlement = function(r0_19, r1_19, r2_19, r3_19, r4_19)
    -- line: [161, 167] id: 19
    if r0_19:IsInDungeon() then
      r0_19:EnterDungeon(r1_19, nil, r2_19, r3_19, r4_19)
    elseif r0_19:IsInHardBoss() then
      r0_19:EnterHardBoss(r1_19.HardBossId, r1_19.DifficultyId, r2_19)
    end
  end,
  ExitDungeonSettlement = function(r0_20)
    -- line: [169, 175] id: 20
    if r0_20:IsInDungeon() then
      r0_20:ExitDungeon()
    elseif r0_20:IsInHardBoss() then
      r0_20:ExitHardBoss()
    end
  end,
  ExitDungeon = function(r0_21)
    -- line: [180, 206] id: 21
    if GWorld:IsListenServer() then
      r0_21:UnregisterLS()
    end
    local r1_21 = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
    if r1_21 then
      r1_21 = r1_21:Cast(UE4.ASinglePlayerController)
      if r1_21 then
        local r2_21 = r1_21:GetMyPawn()
        if r2_21 then
          r2_21:SetCanInteractiveTrigger(true)
        end
      end
    end
    if (GWorld:IsStandAlone() or GWorld:IsClient()) and r1_21 then
      local r2_21 = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(r1_21, UE4.URolePreloadGameInstanceSubsystem)
      if r2_21 then
        r2_21:ReleaseAllCacheBeforeChangeScene(UE.TArray(0))
        r2_21:ReleaseAllCacheObj()
      end
    end
    r0_21:RecoverRegion_ExitDungeon()
  end,
  CheckMoveToTempScene = function(r0_22, r1_22, r2_22)
    -- line: [209, 275] id: 22
    local r4_22 = UE4.URuntimeCommonFunctionLibrary.GetCurrentGameState(GWorld.GameInstance):GetCurrentLevelLoader()
    if r4_22 then
      local r5_22 = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
      local r6_22 = r5_22:GetMyPawn()
      local r7_22 = r6_22:K2_GetActorLocation()
      local r8_22 = r6_22:K2_GetActorRotation()
      local r10_22, r11_22, r12_22 = r4_22:K2_GetArtPathByLevelId(r4_22:GetLevelId(r6_22))
      local r13_22 = DataMgr.Dungeon[r1_22]
      if r13_22 and r13_22.ExitLevel then
        r10_22 = r13_22.ExitLevel
        GWorld.GameInstance:SetExitLevelEndPointInfo(FTransform(FRotator(r13_22.ExitPlayerRotation[2], r13_22.ExitPlayerRotation[3], r13_22.ExitPlayerRotation[1]):ToQuat(), FVector(r13_22.ExitPlayerLocation[1], r13_22.ExitPlayerLocation[2], r13_22.ExitPlayerLocation[3])))
        local r17_22, r18_22, r19_22 = r6_22:GetEndPointInfo()
        if r17_22 then
          GWorld.GameInstance:CachePlayerCharacterInfo(r17_22, r7_22, r8_22)
        end
      else
        local r14_22 = UE4.UKismetMathLibrary.MakeTransform(r11_22, r12_22, UE4.UKismetMathLibrary.Vector_One())
        GWorld.GameInstance:SetFixedStartPoint(UE4.UKismetMathLibrary.InverseTransformLocation(r14_22, r7_22), UE4.UKismetMathLibrary.InverseTransformRotation(r14_22, r8_22), UE4.UKismetMathLibrary.InverseTransformRotation(r14_22, r5_22:GetControlRotation()), r6_22:IsDead())
        local r16_22, r17_22, r18_22 = r6_22:GetEndPointInfo()
        if r16_22 then
          GWorld.GameInstance:CachePlayerCharacterInfo(r16_22, UE4.UKismetMathLibrary.InverseTransformLocation(r14_22, r17_22), UE4.UKismetMathLibrary.InverseTransformRotation(r14_22, r18_22))
        end
      end
      if CommonUtils.GetDeviceTypeByPlatformName(r0_22) == "Mobile" then
        local r14_22 = string.gsub(r10_22, "/Maps/", "/Maps_Phone/")
        if UResourceLibrary.CheckResourceExistOnDisk(r14_22) then
          r10_22 = r14_22
        end
      end
      if r10_22 then
        r0_22:NotifyServerStatusModify(CommonConst.AvatarStatus.EnterSingleDungeon)
        UE4.UGameplayStatics.OpenLevel(GWorld.GameInstance, r10_22, true, "EMCUSTOM=TempScene")
      else
        print(_G.ErrorTag, "MapFile is null.")
        return false
      end
    else
      print(_G.WarningTag, "LevelLoader is null.")
      return false
    end
    return true
  end,
  TryEnterNextProgress = function(r0_23, r1_23)
    -- line: [277, 279] id: 23
    r0_23:CallServer("TryEnterNextProgress", r1_23)
  end,
  SaveProgressData = function(r0_24, r1_24)
    -- line: [281, 287] id: 24
    print(_G.LogTag, "SaveProgressData")
    r1_24.AvatarInitData = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0):GetBattleExtraInfo()
    r0_24:CallServerMethod("SaveProgressData", SerializeUtils:Serialize(r1_24))
  end,
  RecoverSingleDungeon = function(r0_25, r1_25, r2_25, r3_25, r4_25, r5_25, r6_25)
    -- line: [289, 310] id: 25
    print(_G.LogTag, "RecoverSingleDungeon", r4_25, r5_25)
    local r7_25 = nil
    if r2_25 ~= "" then
      r7_25 = SerializeUtils:UnSerialize(r2_25)
      r0_25.AvatarInitData = r7_25.AvatarInitData
    end
    GWorld.GameInstance:SetProgressData(r7_25, r3_25)
    r0_25.AvatarBattleInfo = r1_25
    if not r5_25 then
      return 
    end
    if r6_25 then
      r0_25:CacheDungeonRewards(r6_25)
    end
    WorldTravelSubsystem():ChangeDungeonByDungeonId(r4_25, CommonConst.DungeonNetMode.Standalone)
  end,
  ConsumeAvatarInitData = function(r0_26)
    -- line: [312, 316] id: 26
    r0_26.AvatarInitData = nil
    return r0_26.AvatarInitData
  end,
  SetDungeonDoubleCost = function(r0_27, r1_27)
    -- line: [318, 320] id: 27
    r0_27:CallServerMethod("SetDungeonDoubleCost", r1_27)
  end,
  SelectTicket = function(r0_28, r1_28, r2_28, r3_28)
    -- line: [322, 333] id: 28
    DebugPrint("SelectTicket", r2_28, r3_28)
    assert(r2_28)
    assert(r3_28)
    r0_28:CallServer("SelectTicketForRunningDungeon", function(r0_29)
      -- line: [326, 331] id: 29
      DebugPrint("SelectTicket callback", r0_29)
      if r1_28 then
        r1_28(r0_29)
      end
    end, r2_28, r3_28)
  end,
  GMDungeonEventTest = function(r0_30, r1_30, r2_30)
    -- line: [335, 341] id: 30
    r0_30:CallServer("GMDungeonEventTest", function(r0_31, r1_31)
      -- line: [336, 339] id: 31
      DebugPrint("[GMDungeonEventTest] Detail:", CommonUtils.TableToString(r1_31))
      DebugPrint("[GMDungeonEventTest] Count Result:", CommonUtils.TableToString(r0_31))
    end, r1_30, r2_30)
  end,
  GMSetMustHappenDungenEvent = function(r0_32, r1_32)
    -- line: [342, 344] id: 32
    r0_32:CallServerMethod("GMSetMustHappenDungenEvent", r1_32)
  end,
  GMCleanMustHappenDungenEvent = function(r0_33)
    -- line: [345, 347] id: 33
    r0_33:CallServerMethod("GMCleanMustHappenDungenEvent")
  end,
  GMHappenDungenEvent = function(r0_34, r1_34, r2_34)
    -- line: [348, 350] id: 34
    r0_34:CallServerMethod("GMHappenDungenEvent", r1_34, r2_34)
  end,
  GMMiniGameTest = function(r0_35, r1_35, r2_35, r3_35)
    -- line: [351, 356] id: 35
    r0_35:CallServer("GMMiniGameTest", function(r0_36)
      -- line: [352, 354] id: 36
      DebugPrint("[GMMiniGameTest]", r0_36)
    end, r1_35, r2_35, r3_35)
  end,
}
