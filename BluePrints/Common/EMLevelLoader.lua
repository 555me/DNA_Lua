-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Common\EMLevelLoader.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = Class()
local r1_0 = require("EMCache.EMCache")
local r2_0 = require("DungeonPreloadData")
local r3_0 = require("RegionPreloadData")
local r4_0 = require("AbyssPreloadData")
local r5_0 = require("Datas.DataNames")
function r0_0.Initialize(r0_1, r1_1)
  -- line: [8, 18] id: 1
  r0_1.artLevelLoadedCompleteCallback = {}
  r0_1.volumeArray = nil
  r0_1.startPoint = nil
  r0_1.ID2DesignStreamingLevel = {}
  r0_1.StartPoints = {}
  r0_1.StartPointManagers = {}
  r0_1.id2LevelNameAndTransform = {}
  r0_1.id2LevelLocationAndRotation = {}
  r0_1.artStreamingLevel2ID = {}
end
function r0_0.BeginPlay(r0_2)
  -- line: [20, 25] id: 2
  r0_2:InitEnvironment()
  r0_2:InitSettings()
  r0_2:InitGameScreenFilter()
  r0_2:InitGameGraphicsSettings()
end
function r0_0.InitEnvironment(r0_3)
  -- line: [27, 36] id: 3
  if not r0_3.EnvironmentManager then
    local r1_3 = UE4.UGameplayStatics.GetActorOfClass(r0_3, UE4.AEnvironmentManager:StaticClass())
    if r1_3 then
      r0_3.EnvironmentManager = r1_3
    else
      r0_3.EnvironmentManager = r0_3:GetWorld():SpawnActor(LoadClass("/Game/Asset/Scene/common/EnvirSystem/EnvirCreat.EnvirCreat_C"), r0_3:GetTransform())
    end
  end
end
function r0_0.InitSettings(r0_4)
  -- line: [38, 42] id: 4
  DebugPrint("LevelLoaderInitSettings")
  local r1_4 = GWorld.GameInstance
  URuntimeCommonFunctionLibrary.SetConsoleVariableIntValue("r.Mobile.EnableReadSurface", 1, 1)
end
function r0_0.InitGameScreenFilter(r0_5)
  -- line: [45, 67] id: 5
  local r1_5 = "ScreenFilter"
  local r2_5 = r1_0:Get(r1_5)
  if r2_5 then
    r0_5.EnvironmentManager:SetPosLUT(r2_5)
  else
    local r3_5 = {
      [1] = 1,
      [2] = 2,
      [3] = 0,
    }
    local r4_5 = DataMgr.Option[r1_5]
    local r5_5 = 1
    if r4_5 and r4_5.DefaultValue then
      r5_5 = r3_5[tonumber(r4_5.DefaultValue)]
      if CommonUtils.GetDeviceTypeByPlatformName(r0_5) == "Mobile" and r4_5.DefaultValueM ~= nil then
        r5_5 = r3_5[tonumber(r4_5.DefaultValueM)]
      end
    end
    r0_5.EnvironmentManager:SetPosLUT(r5_5)
    r1_0:Set(r1_5, r5_5)
  end
end
function r0_0.InitGameGraphicsSettings(r0_6)
  -- line: [70, 201] id: 6
  if IsDedicatedServer(r0_6) then
    DebugPrint("Skip InitGameGraphicsSettings")
    return 
  end
  DebugPrint("InitGameGraphicsSettings")
  local r1_6 = CommonUtils.GetDeviceTypeByPlatformName(r0_6) == "Mobile"
  if UUCloudGameInstanceSubsystem and UUCloudGameInstanceSubsystem.IsCloudGame() then
    r1_6 = false
  end
  local r2_6 = nil
  if not r1_6 then
    local r3_6 = "AntiAliasing"
    r2_6 = r1_0:Get(r3_6)
    if r2_6 == nil then
      r2_6 = 2
    end
    UE4.UKismetSystemLibrary.ExecuteConsoleCommand(r0_6, "r.DefaultFeature.AntiAliasing " .. r2_6)
    r1_0:Set(r3_6, r2_6)
  else
    local r3_6 = "AntiAliasingMobile"
    local r4_6 = r1_0:Get(r3_6)
    r2_6 = 4
    if r4_6 == nil then
      r4_6 = true
    end
    if r4_6 then
      r2_6 = 2
    else
      r2_6 = 4
    end
    r2_6 = 2
    UE4.UKismetSystemLibrary.ExecuteConsoleCommand(r0_6, "r.DefaultFeature.AntiAliasing " .. r2_6)
    r1_0:Set(r3_6, r4_6)
  end
  local r3_6 = 100
  if not r1_6 then
    local r4_6 = r1_0:Get("RenderingValue")
    if r4_6 ~= nil then
      r3_6 = r4_6
      UKismetSystemLibrary.ExecuteConsoleCommand(r0_6, "r.ScreenPercentage " .. r3_6)
    end
  end
  if r2_6 == 2 and USRMBlueprintLibrary ~= nil and r3_6 == 100 then
    local r4_6 = "UpscalingMethodValue"
    local r5_6 = "QualityModeValue"
    local r6_6 = r1_0:Get(r4_6)
    local r7_6 = r1_0:Get(r5_6)
    if r6_6 == nil or r7_6 == nil then
      if r1_6 then
        r6_6 = ESuperResolutionType.Default
        r7_6 = 0
      elseif USRMBlueprintLibrary.IsSRTypeAvailable(ESuperResolutionType.DLSS) then
        r6_6 = ESuperResolutionType.DLSS
        local r8_6 = URuntimeCommonFunctionLibrary.GetDefaultDLSSQualityMode()
        if r8_6 ~= 0 then
          r7_6 = r8_6
        else
          r7_6 = 4
        end
      else
        r6_6 = ESuperResolutionType.Default
        r7_6 = 0
      end
    end
    if ESuperResolutionType.Default <= r6_6 and r6_6 <= ESuperResolutionType.GSR then
      USRMBlueprintLibrary.SetSRTypeAndQuality(r6_6, r7_6)
      r1_0:Set(r4_6, r6_6)
      r1_0:Set(r5_6, r7_6)
    end
  end
  if not r1_6 and UStreamlineLibraryDLSSG and UStreamlineLibraryDLSSG.IsDLSSGSupported() then
    local r4_6 = r1_0:Get("DLSSFG")
    if r4_6 ~= nil then
      UStreamlineLibraryDLSSG.SetDLSSGMode(r4_6)
    end
  end
  if not r1_6 then
    local r5_6 = r1_0:Get("WaterQuality")
    if r5_6 == nil then
      r5_6 = 3
    end
    URuntimeCommonFunctionLibrary.SetWaterQuality(r5_6 + -1)
  end
end
function r0_0.OnArtLevelLoadedCallback(r0_7, r1_7)
  -- line: [203, 224] id: 7
  local r2_7 = UE4.UGameplayStatics.GetGameMode(r0_7)
  if r2_7 == nil then
    EventManager:FireEvent(EventID.OnArtLevelLoaded, r1_7)
    return 
  end
  if IsStandAlone(r0_7) then
    EventManager:FireEvent(EventID.OnArtLevelLoaded, r1_7)
  end
  DebugPrint("EMLevelLoader Loaded Level:", r1_7)
  r2_7:TriggerActiveSubGameModeInfo(r1_7)
  r2_7:DungeonRecoverSnapShot(r1_7)
  if r0_7.artLevelLoadedCompleteCallback[r1_7] then
    for r7_7, r8_7 in pairs(r0_7.artLevelLoadedCompleteCallback[r1_7]) do
      r8_7()
    end
    -- close: r3_7
  end
  if r0_7.AfterLevelLoadeCallback then
    r0_7:AfterLevelLoadeCallback(r1_7)
  end
end
function r0_0.OnArtLevelUnloadedCallback(r0_8, r1_8)
  -- line: [226, 232] id: 8
  local r2_8 = UE4.UGameplayStatics.GetGameMode(r0_8)
  if r2_8 == nil then
    return 
  end
  r2_8:TriggerDeActiveSubGameModeInfo(r1_8)
end
function r0_0.BeforeLevelUnloadedCallback(r0_9, r1_9)
  -- line: [234, 241] id: 9
  local r2_9 = UE4.UGameplayStatics.GetGameMode(r0_9)
  if r2_9 ~= nil then
    DebugPrint("EMLevelLoader Unloaded Level:", r1_9)
    r2_9:SetSnapShot(r1_9)
    r2_9:UpdateMonsterSpawnInfo()
  end
end
function r0_0.GetAllLevelVolume(r0_10)
  -- line: [243, 246] id: 10
  r0_10.volumeArray = UGameplayStatics.GetAllActorsOfClass(r0_10, LoadClass("/Game/BluePrints/Common/Level/BP_LevelVolume.BP_LevelVolume_C"))
  PrintTable(r0_10.volumeArray)
end
function r0_0.GetAllLevelBounds(r0_11)
  -- line: [248, 250] id: 11
  r0_11.LevelBoundsArray = UGameplayStatics.GetAllActorsOfClass(r0_11, ALevelBounds.StaticClass())
end
function r0_0.GetRandStartPoint(r0_12)
  -- line: [252, 261] id: 12
  if #r0_12.StartPoints > 0 then
    r0_12.startPoint = r0_12.StartPoints[1]
    return 
  end
  local r1_12 = UGameplayStatics.GetAllActorsOfClass(r0_12, LoadClass("/Game/BluePrints/Common/Level/BP_StartPoint.BP_StartPoint_C"))
  if r1_12:Length() > 0 then
    r0_12.startPoint = r1_12:GetRef(1)
  end
end
function r0_0.LevelLoaderReady(r0_13)
  -- line: [263, 282] id: 13
  local r1_13 = UE4.URuntimeCommonFunctionLibrary.GetCurrentGameState(r0_13)
  r1_13.LevelLoaderReady = true
  r1_13:TryEndLoading("LevelLoaderReady")
  AudioManager(r0_13):PlayDungeonBGM()
  r0_13:TriggerLevelInitMonsterPool(Const.DungeonPreloadMonster)
  r0_13:TriggerLevelInitIndicatorPool(true)
  r0_13:InitGameStatePickupUnitPool()
  r0_13:InitGameStateBloodbarSubWidgetPool()
  r0_13:InitGameStatePickupIconComponentPool()
  r0_13:WaitNavigationLoading()
  if IsAuthority(r0_13) then
    local r2_13 = UE4.UGameplayStatics.GetGameMode(r0_13)
    if r2_13.RandomActorManager and not r2_13:IsInRegion() then
      r2_13.RandomActorManager:RegisterAllData()
    end
    r2_13:RegisterBPArrow()
    r2_13:TryTriggerOnPrepare("LevelActorInit")
  end
end
function r0_0.TriggerLevelInitIndicatorPool(r0_14, r1_14)
  -- line: [284, 288] id: 14
  if r1_14 then
    r0_14:InitGameStateIndicatorPool()
  end
end
function r0_0.InitGameStateIndicatorPool(r0_15)
  -- line: [290, 314] id: 15
  if DataMgr.Dungeon[GWorld.GameInstance:GetCurrentDungeonId()] == nil then
    return 
  end
  local r3_15 = GWorld.GameInstance:GetGameUIManager()
  if not r3_15 then
    return 
  end
  local r4_15 = UE4.URuntimeCommonFunctionLibrary.GetCurrentGameState(r0_15)
  local function r5_15(r0_16)
    -- line: [302, 309] id: 16
    local r2_16 = r3_15:LoadUI("/Game/UI/WBP/GuidePoint/WBP_GuidePoint_Annihilate.WBP_GuidePoint_Annihilate", "PoolClass_Monster_" .. r0_16, UIConst.ZORDER_FOR_INDICATORS)
    r2_16.GuideType = "Monster"
    r2_16.IsFromPool = true
    r2_16.IsActiveInPoor = false
    r4_15:AddIndicatorToPool("Monster", r2_16)
  end
  for r9_15 = 0, 7, 1 do
    r5_15(r9_15)
  end
end
function r0_0.InitGameStatePickupUnitPool(r0_17)
  -- line: [316, 350] id: 17
  local r1_17 = GWorld:GetAvatar()
  if r0_17.IsWorldLoader and r1_17 and r1_17:GetIsInHome() then
    return 
  end
  local r2_17 = nil
  if IsClient(r0_17) then
    r2_17 = {
      {
        "/Game/AssetDesign/Item/Pickups/AutoPick/ResourceNew.ResourceNew",
        20
      },
      {
        "/Game/AssetDesign/Item/Pickups/AutoPick/AmmoNew.AmmoNew",
        10
      },
      {
        "/Game/AssetDesign/Item/Pickups/AutoPick/ModNew.ModNew",
        10
      },
      {
        "/Game/AssetDesign/Item/Pickups/AutoPick/HpBall.HpBall",
        10
      },
      {
        "/Game/AssetDesign/Item/Pickups/AutoPick/MpBall.MpBall",
        10
      }
    }
  elseif IsDedicatedServer(r0_17) then
    r2_17 = {}
  else
    r2_17 = {
      {
        "/Game/AssetDesign/Item/Pickups/AutoPick/ResourceNew.ResourceNew",
        20
      },
      {
        "/Game/AssetDesign/Item/Pickups/AutoPick/AmmoNew.AmmoNew",
        10
      },
      {
        "/Game/AssetDesign/Item/Pickups/AutoPick/ModNew.ModNew",
        10
      },
      {
        "/Game/AssetDesign/Item/Pickups/AutoPick/HpBall.HpBall",
        10
      },
      {
        "/Game/AssetDesign/Item/Pickups/AutoPick/MpBall.MpBall",
        10
      }
    }
  end
  local r3_17 = {}
  local r4_17 = UGameplayStatics.GetGameMode(r0_17)
  if r4_17 and r4_17.GetPickupUnitPreloadTable then
    r3_17 = r4_17:GetPickupUnitPreloadTable() and {}
  end
  for r9_17, r10_17 in pairs(r2_17) do
    r0_17:AddPickupUnitToPool(r10_17)
  end
  -- close: r5_17
  for r9_17, r10_17 in pairs(r3_17) do
    r0_17:AddPickupUnitToPool(r10_17)
  end
  -- close: r5_17
end
function r0_0.AddPickupUnitToPool(r0_18, r1_18)
  -- line: [352, 368] id: 18
  local r2_18 = UE4.URuntimeCommonFunctionLibrary.GetCurrentGameState(r0_18)
  local function r3_18(r0_19, r1_19)
    -- line: [354, 364] id: 19
    local r4_19 = r0_19:GetWorld():SpawnActor(r1_19, UE4.FTransform(FRotator(0, 0, 0):ToQuat(), FVector(100000, 100000, 100000)), UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn)
    if r4_19.GuideIconComponent then
      r4_19.GuideIconComponent:SetHiddenInGame(true)
    end
    r4_19:ResetForCache()
    r4_19:TryInitActorInfo("OnInit")
    r2_18:DoPickUpUnitToCache(r1_18[1], r4_19)
  end
  for r7_18 = 1, r1_18[2] + 1, 1 do
    UResourceLibrary.LoadClassAsync(r0_18, r1_18[1], {
      r0_18,
      r3_18
    })
  end
end
function r0_0.GetSkeletalMeshAccessoryBPPath(r0_20)
  -- line: [370, 372] id: 20
  return Const.CharResourcePaths.AccessoryBP
end
function r0_0.GetStaticMeshAccessoryBPPath(r0_21)
  -- line: [374, 376] id: 21
  return Const.CharResourcePaths.StaticAccessoryBP
end
function r0_0.InitGameStateBloodbarSubWidgetPool(r0_22)
  -- line: [378, 409] id: 22
  local r1_22 = GWorld.GameInstance:GetGameUIManager()
  if not r1_22 then
    return 
  end
  local r2_22 = UE4.URuntimeCommonFunctionLibrary.GetCurrentGameState(r0_22)
  if not r2_22 then
    return 
  end
  local r3_22 = CommonUtils.GetDeviceTypeByPlatformName(r0_22)
  local r4_22 = 30
  if r3_22 == "PC" then
    r4_22 = 50
  end
  for r10_22, r11_22 in pairs({
    {
      "HPBar",
      r4_22
    },
    {
      "ShieldBar",
      r4_22
    },
    {
      "BuffBar",
      r4_22
    },
    {
      "EliteBar",
      r4_22
    },
    {
      "BuffIcon",
      r4_22
    }
  }) do
    local r12_22 = r11_22[1]
    for r17_22 = 1, r11_22[2], 1 do
      r2_22:DoBloodbarSubWidgetCache(r12_22, r1_22:_CreateWidgetNew(r12_22))
    end
  end
  -- close: r6_22
end
function r0_0.AddStartPoint(r0_23, r1_23)
  -- line: [411, 413] id: 23
  r0_23.StartPoints[#r0_23.StartPoints + 1] = r1_23
end
function r0_0.AddStartPointManager(r0_24, r1_24)
  -- line: [415, 417] id: 24
  r0_24.StartPointManagers[#r0_24.StartPointManagers + 1] = r1_24
end
function r0_0.SetPlayerTrans(r0_25)
  -- line: [419, 421] id: 25
end
function r0_0.SetNewEnteredPlayerTrans(r0_26, r1_26)
  -- line: [423, 425] id: 26
end
function r0_0.RealSetNewEnteredPlayerTrans(r0_27, r1_27)
  -- line: [427, 429] id: 27
end
function r0_0.BindArtLevelLoadedCompleteCallback(r0_28, r1_28, r2_28)
  -- line: [432, 443] id: 28
  print(_G.LogTag, "ZJT_ BindArtLevelLoadedCompleteCallback ", r1_28, r0_28.artLevelLoadedCompleteCallback[r1_28])
  if r0_28.artLevelLoadedCompleteCallback[r1_28] then
    r0_28.artLevelLoadedCompleteCallback[r1_28][#r0_28.artLevelLoadedCompleteCallback[r1_28] + 1] = r2_28
  else
    r0_28.artLevelLoadedCompleteCallback[r1_28] = {}
    r0_28.artLevelLoadedCompleteCallback[r1_28][#r0_28.artLevelLoadedCompleteCallback[r1_28] + 1] = r2_28
  end
end
function r0_0.RemoveArtLevelLoadedCompleteCallback(r0_29, r1_29)
  -- line: [445, 449] id: 29
  if r0_29.artLevelLoadedCompleteCallback[r1_29] then
    r0_29.artLevelLoadedCompleteCallback[r1_29] = nil
  end
end
function r0_0.CheckActorInGridframeByLevelId(r0_30, r1_30, r2_30)
  -- line: [501, 506] id: 30
  if not r2_30 then
    return false
  end
  return r0_30:CheckLocationInGridframeByLevelId(r1_30, r2_30:K2_GetActorLocation())
end
function r0_0.GetActorInLevelTransform(r0_31, r1_31)
  -- line: [508, 520] id: 31
  print("EnvirSystemActor GetActorInLevelTransform")
  if not r0_31.artStreamingLevel2ID then
    return FTransform()
  end
  local r2_31 = UE4.URuntimeCommonFunctionLibrary.GetLevel(r1_31)
  for r7_31, r8_31 in pairs(r0_31.artStreamingLevel2ID) do
    if r7_31:GetLoadedLevel() == r2_31 then
      return r7_31.LevelTransform
    end
  end
  -- close: r3_31
  return FTransform()
end
function r0_0.GetDesignActorLevelName(r0_32, r1_32)
  -- line: [522, 530] id: 32
  local r2_32 = UE4.URuntimeCommonFunctionLibrary.GetLevel(r1_32)
  for r7_32, r8_32 in pairs(r0_32.ID2DesignStreamingLevel) do
    if r8_32:GetLoadedLevel() == r2_32 then
      return r7_32
    end
  end
  -- close: r3_32
  return nil
end
function r0_0.GetLevelTransformByLevelName(r0_33, r1_33)
  -- line: [532, 535] id: 33
  return r0_33.ID2DesignStreamingLevel[r1_33].LevelTransform
end
function r0_0.AddGridFrame(r0_34, r1_34)
  -- line: [537, 575] id: 34
  local r2_34 = UE4.URuntimeCommonFunctionLibrary.GetLevel(r1_34)
  PrintTable(r0_34.ID2DesignStreamingLevel)
  for r7_34, r8_34 in pairs(r0_34.ID2DesignStreamingLevel) do
    if r8_34:GetLoadedLevel() == r2_34 then
      r0_34.LevelID2GridFrame:Add(r7_34, r1_34)
      if r0_34.LevelPathfinding and r1_34.Elevator and r1_34.ElevatorTopBPArrow and r1_34.ElevatorBottomBPArrow then
        r0_34.LevelPathfinding.ID2Elevator:Add(r7_34, r1_34.Elevator)
        r0_34.LevelPathfinding.ID2ElevatorTopDoor:Add(r7_34, r1_34.ElevatorTopBPArrow)
        r0_34.LevelPathfinding.ID2ElevatorBottomDoor:Add(r7_34, r1_34.ElevatorBottomBPArrow)
      end
      local r9_34 = nil
      local r10_34 = GWorld.GameInstance:GetGameUIManager()
      if r10_34 then
        local r11_34 = r10_34:GetUI("BattleMain")
        if r11_34 then
          r9_34 = r11_34.Battle_Map and r11_34.Battle_Map_PC
        end
      end
      if r0_34.id2LevelNameAndTransform[r7_34] then
        r0_34.id2LevelNameAndTransform[r7_34][4] = r1_34.Floor
        if r9_34 then
          r9_34:CreateSingleBattleMap(r7_34, r0_34.id2LevelNameAndTransform[r7_34])
        end
      else
        for r15_34, r16_34 in pairs(r0_34.id2LevelNameAndTransform) do
          if string.find(r16_34[1], r7_34) then
            r16_34[4] = r1_34.Floor
            if r9_34 then
              r9_34:CreateSingleBattleMap(r7_34, r16_34)
              break
            else
              break
            end
          end
        end
        -- close: r11_34
      end
    end
  end
  -- close: r3_34
end
function r0_0.SetDesignLevelHidden(r0_35, r1_35)
  -- line: [577, 582] id: 35
  for r6_35, r7_35 in pairs(r0_35.ID2DesignStreamingLevel) do
    DebugPrint("SetDesignLevelHidden", r7_35:GetName())
    r7_35:SetShouldBeVisible(not r1_35)
  end
  -- close: r2_35
end
function r0_0.CheckIsRougeLike(r0_36)
  -- line: [584, 586] id: 36
  return false
end
function r0_0.GetConstStandAloneMonsterCanCache(r0_37)
  -- line: [588, 590] id: 37
  return Const.StandAloneMonsterCanCache
end
function r0_0.GetConstOnlineMonsterCanCache(r0_38)
  -- line: [592, 594] id: 38
  return Const.OnlineMonsterCanCache
end
function r0_0.LoadPreviewLevel(r0_39, r1_39, r2_39, r3_39, r4_39, r5_39, r6_39)
  -- line: [596, 613] id: 39
  local r7_39 = nil
  if not r0_39[r1_39] then
    local r8_39 = UAsyncFunctionLibrary.LoadLevelInstance
    local r9_39 = r0_39
    local r10_39 = r2_39
    local r11_39 = r4_39 and FVector(0, 0, 0)
    r7_39, r0_39[r1_39] = r8_39(r9_39, r10_39, r11_39, r5_39 and FRotator(0, 0, 0), r7_39, r1_39)
  end
  if r0_39[r1_39] then
    local r8_39 = UGameplayStatics.GetGameMode(r0_39):GetWCSubSystem()
    if r8_39 then
      r8_39:FreezeWorldComposition()
      r8_39:FreezeDistanceBasedRegion()
    end
    r0_39[r1_39].OnLevelShown:Clear()
    r0_39[r1_39].OnLevelShown:Add(r0_39, r3_39)
    coroutine.resume(coroutine.create(r0_39.LatentPrevewLevelAction), r0_39, true, r1_39, r6_39)
    return true
  end
end
function r0_0.UnloadPreviewLevel(r0_40, r1_40)
  -- line: [617, 626] id: 40
  if r0_40[r1_40] then
    local r2_40 = UGameplayStatics.GetGameMode(r0_40):GetWCSubSystem()
    if r2_40 then
      r2_40:UnFreezeWorldComposition()
      r2_40:UnFreezeDistanceBasedRegion()
    end
    coroutine.resume(coroutine.create(r0_40.LatentPrevewLevelAction), r0_40, false, r1_40)
  end
end
function r0_0.LatentPrevewLevelAction(r0_41, r1_41, r2_41, r3_41)
  -- line: [628, 635] id: 41
  if r1_41 then
    UGameplayStatics.LoadStreamLevel(r0_41, r2_41, not r3_41, true)
  else
    UGameplayStatics.UnloadStreamLevel(r0_41, r2_41, true)
  end
end
function r0_0.SetLevelVisible(r0_42, r1_42)
  -- line: [637, 641] id: 42
  if r0_42[r1_42] then
    r0_42[r1_42]:SetShouldBeVisible(true)
  end
end
function r0_0.GetDungeonPreloadData(r0_43, r1_43)
  -- line: [643, 711] id: 43
  local r2_43 = FDungeonPreloadData()
  local r3_43 = {
    [90108] = true,
    [90604] = true,
    [90804] = true,
    [91009] = true,
    [91124] = true,
    [91125] = true,
    [91144] = true,
    [91145] = true,
    [91146] = true,
    [91147] = true,
    [91185] = true,
    [91186] = true,
    [91181] = true,
    [91182] = true,
    [91183] = true,
    [91184] = true,
  }
  if IsDedicatedServer(r0_43) and r3_43[r1_43] == true then
    return r2_43
  end
  if r2_0[r1_43] == nil then
    return r2_43
  end
  local r4_43 = r2_0[r1_43]
  r2_43.OnlineCoefficient = r4_43.OnlineCoefficient
  for r9_43, r10_43 in pairs(r4_43.MonsterSpawn) do
    r2_43.MonsterSpawn:Add(r9_43, r10_43)
  end
  -- close: r5_43
  local r5_43 = UE4.URuntimeCommonFunctionLibrary.GetCurrentGameState(r0_43)
  local r6_43 = false
  local r8_43 = r5_0
  for r11_43, r12_43 in pairs(r8_43) do
    if r12_43 == r5_43.GameModeType then
      r6_43 = true
      break
    end
  end
  -- close: r7_43
  if r6_43 then
    local r7_43 = r5_43.GameModeType
    if r7_43 then
      r8_43 = r5_43.GameModeType
      r7_43 = DataMgr[r8_43] and nil
    else
      goto label_94	-- block#15 is visited secondly
    end
    if r7_43 then
      r8_43 = r7_43[r1_43] and nil
    else
      goto label_100	-- block#18 is visited secondly
    end
    if r8_43 then
      local r9_43 = r8_43["Treasure" .. "MonsterId"]
      if r9_43 then
        r2_43.FixedMonsterSpawn:Add(r9_43, 1)
      end
      local r10_43 = r8_43["Butcher" .. "MonsterId"]
      if r10_43 then
        r2_43.FixedMonsterSpawn:Add(r10_43, 1)
      end
    end
  end
  if r4_43.FixedMonster then
    for r11_43, r12_43 in pairs(r4_43.FixedMonster) do
      r2_43.FixedMonsterSpawn:Add(r11_43, r12_43)
    end
    -- close: r7_43
  end
  return r2_43
end
function r0_0.GetStoryRegionPreloadData(r0_44, r1_44)
  -- line: [713, 742] id: 44
  local r2_44 = FDungeonPreloadData()
  if UE4.UUIFunctionLibrary.GetDevicePlatformName(r0_44) == "IOS" then
    return r2_44
  end
  local r4_44 = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UStorySubsystem:StaticClass())
  if r4_44 == nil then
    return r2_44
  end
  if r1_44 ~= 1001 then
    return r2_44
  end
  local r5_44 = "Prologue_optimization"
  local r6_44 = r4_44:GetOptimizeTag(r5_44)
  local r7_44 = nil
  if r6_44 == EStoryOptimizeTag.None or r6_44 == EStoryOptimizeTag.On then
    r7_44 = r3_0[r5_44]
  end
  if r7_44 ~= nil then
    r2_44.OnlineCoefficient = 1
    for r12_44, r13_44 in pairs(r7_44.MonsterSpawn) do
      r2_44.MonsterSpawn:Add(r12_44, r13_44)
    end
    -- close: r8_44
  end
  return r2_44
end
function r0_0.GetRegionPreloadData(r0_45, r1_45)
  -- line: [744, 766] id: 45
  local r2_45 = FDungeonPreloadData()
  if UE4.UUIFunctionLibrary.GetDevicePlatformName(r0_45) == "IOS" then
    return r2_45
  end
  local r5_45 = ({
    [1041] = "Dongguo",
  })[r1_45]
  if r5_45 == nil or r3_0[r5_45] == nil then
    return r2_45
  end
  r2_45.OnlineCoefficient = 1
  for r11_45, r12_45 in pairs(r3_0[r5_45].MonsterSpawn) do
    r2_45.MonsterSpawn:Add(r11_45, r12_45)
  end
  -- close: r7_45
  return r2_45
end
function r0_0.GetAbyssPreloadData(r0_46, r1_46)
  -- line: [768, 780] id: 46
  local r2_46 = FDungeonPreloadData()
  if r4_0[r1_46] == nil then
    return r2_46
  end
  r2_46.OnlineCoefficient = 1
  for r8_46, r9_46 in pairs(r4_0[r1_46].MonsterSpawn) do
    r2_46.MonsterSpawn:Add(r8_46, r9_46)
  end
  -- close: r4_46
  return r2_46
end
return r0_0
