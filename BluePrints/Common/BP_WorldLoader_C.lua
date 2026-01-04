-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Common\BP_WorldLoader_C.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("rapidjson")
local r1_0 = Class({
  "BluePrints/Common/EMLevelLoader",
  "BluePrints.Common.TimerMgr"
})
local r2_0 = require("BluePrints.UI.GMInterface.GMFunctionLibrary")
function r1_0.Initialize(r0_1, r1_1)
  -- line: [14, 36] id: 1
  r0_1.Super.Initialize(r0_1, r1_1)
  r0_1.ID2ArtStreamingLevel = {}
  r0_1.DesignId2ArtId = {}
  r0_1.ID2LayoutStreamingLevel = {}
  r0_1.ID2NavMeshStreamingLevel = {}
  r0_1.ID2SoundStreamingLevel = {}
  r0_1.ArtLevelUnLoadEvent = {}
  r0_1.ArtLevelLoadEvent = {}
  r0_1.homeLevel2ID = {}
  r0_1.LevelID2RegionID = {}
  r0_1.RegionID2LevelID = {}
  r0_1.id2NeedLoad = {}
  r0_1.GetLevels = false
  r0_1.enterLevelID = nil
  r0_1.enterLoc = nil
  r0_1.enterRot = nil
  r0_1.levelName2Id = {}
  r0_1.EnterRegionType = ""
  r0_1.loadProgress = 0
end
function r1_0.ReceiveBeginPlay(r0_2)
  -- line: [41, 82] id: 2
  r0_2.IsWorldLoader = true
  r0_2:BeginPlay()
  r0_2.EnvironmentManager.bFixLightDirection = false
  r0_2.WorldCompositionSubSystem = USubsystemBlueprintLibrary.GetWorldSubsystem(r0_2, UWorldCompositionSubSystem:StaticClass())
  local r1_2 = GWorld:GetAvatar()
  if r1_2 then
    r0_2:HandleEnterRegionType(r1_2, r1_2.EnterRegionType)
    DebugPrint("ZJT_ Print PlayerCharacter Recover Info ", r1_2:InitRecoverCheck(), r1_2.StartIndex, r1_2.CurrentRegionId, r0_2.enterLevelID, r1_2:GetLastRegionId())
    PrintTable({
      Location = r1_2.LastRegionData:GetLocation(),
    }, 2)
  else
    r0_2:AddTimer(1, function()
      -- line: [53, 56] id: 3
      r0_2:LevelLoaderReady()
      r0_2:ReleaseInitialBuildingLock()
    end)
    if URuntimeCommonFunctionLibrary.IsPlayInEditor(r0_2) then
      r0_2.WorldCompositionSubSystem:ForceAddLoadedLevel()
    end
    return 
  end
  r0_2.shortname = WorldTravelSubsystem(r0_2).LevelLoadJsonName
  local r2_2 = string.find(r0_2.shortname, "Houdini_data/")
  if r0_2.shortname and r2_2 then
    r0_2.shortname = string.sub(r0_2.shortname, string.find(r0_2.shortname, "Houdini_data/") + 13)
    r0_2.points = DataMgr.GetLevelLoaderJsonData(r0_2.shortname).points
    print(_G.LogTag, "222222222222222222222222", r0_2.shortname)
  end
  local r3_2 = UE4.UGameplayStatics.GetGameInstance(r0_2)
  r0_2:InitLevelID()
  r0_2.LevelPathfinding.LevelLoaderComplete = true
  if r3_2 then
    r3_2:UpdatePostProcessMaterial()
  end
end
function r1_0.ReceiveTick(r0_4, r1_4)
  -- line: [84, 99] id: 4
  if not GWorld:GetAvatar() then
    return 
  end
  if r0_4.GetLevels then
    return 
  end
  local r3_4 = r0_4.StreamLevels:ToTable()
  if #r3_4 == 0 then
    r0_4:GetStreamingLevels()
    return 
  end
  r0_4:InitWorldLoad(r3_4)
end
function r1_0.InitLevelID(r0_5)
  -- line: [110, 120] id: 5
  if r0_5.points then
    for r4_5 = 1, #r0_5.points, 1 do
      local r5_5 = r0_5.points[r4_5]
      local r6_5 = string.sub(r5_5.struct, #r5_5.struct - string.reverse(r5_5.struct):find("/") + 2)
      r0_5.LevelIDInt2String:Add(r5_5.id, r6_5)
      r0_5.LevelIDString2Int:Add(r6_5, r5_5.id)
    end
  end
  r0_5:InitLevelInfo()
end
function r1_0.InitLevelInfo(r0_6, r1_6)
  -- line: [122, 216] id: 6
  if r0_6.LevelInfoInited then
    return 
  end
  r0_6.LevelInfoInited = true
  r0_6:GetStreamingLevels()
  r1_6 = r0_6.StreamLevels:ToTable()
  local r2_6 = UE4.URuntimeCommonFunctionLibrary.IsPlayInEditor(r0_6)
  local r3_6 = UE4.USubsystemBlueprintLibrary.GetWorldSubsystem(r0_6, UE4.UWorldCompositionSubSystem)
  local r4_6 = r3_6 and r3_6:WCIsInDungeon()
  for r9_6, r10_6 in pairs(r1_6) do
    local r11_6 = r10_6.PackageNameToLoad
    if r11_6 == "None" then
      r11_6 = r10_6:GetWorldAssetPackageFName()
    end
    local r12_6, r13_6 = UNameStringFunctionLibrary.LongPathNameToName(r11_6)
    local r14_6 = URuntimeCommonFunctionLibrary.IsWorldCompositionEnabled(r0_6) and UKismetStringLibrary.EndsWith(r11_6, "_Gameplay", ESearchCase.CaseSensitive)
    local r15_6 = UKismetStringLibrary.StartsWith(r11_6, "/Game/Maps/Levels", ESearchCase.CaseSensitive) and not URuntimeCommonFunctionLibrary.IsWorldCompositionEnabled(r0_6)
    local r16_6 = -1
    if UKismetStringLibrary.EndsWith(r12_6, "_Art", ESearchCase.CaseSensitive) then
      local r17_6 = string.gsub(r12_6, "_Art", "")
      r0_6.levelName2Id[r17_6] = r17_6
      r0_6.ID2ArtStreamingLevel[r17_6] = r10_6
      r0_6.artStreamingLevel2ID[r10_6] = r17_6
      r0_6.id2NeedLoad = {}
      r10_6.OnLevelLoaded:Add(r0_6, r0_6.OnArtLevelLoaded)
    elseif UKismetStringLibrary.EndsWith(r12_6, "_Layout", ESearchCase.CaseSensitive) and r2_6 then
      r0_6.ID2LayoutStreamingLevel[string.gsub(r12_6, "_Layout", "")] = r10_6
    elseif UKismetStringLibrary.EndsWith(r12_6, "_Sound", ESearchCase.CaseSensitive) then
      r0_6.ID2SoundStreamingLevel[string.gsub(r12_6, "_Sound", "")] = r10_6
    elseif UKismetStringLibrary.EndsWith(r12_6, "_Design", ESearchCase.CaseSensitive) and not r4_6 then
      r0_6.ID2DesignStreamingLevel[string.gsub(r12_6, "_Design", "")] = r10_6
    elseif UE4.UKismetStringLibrary.Contains(r12_6, "_DungeonDesign") and r4_6 then
      r0_6.ID2DesignStreamingLevel[string.sub(r12_6, 1, UE4.UKismetStringLibrary.FindSubstring(r12_6, "_DungeonDesign"))] = r10_6
    elseif UKismetStringLibrary.EndsWith(r12_6, "_NavMesh", ESearchCase.CaseSensitive) then
      local r17_6 = string.gsub(r12_6, "_NavMesh", "")
      r0_6.ID2NavMeshStreamingLevel[r17_6] = r10_6
      local r18_6 = r0_6:GetLevelJsonByLevelName(r17_6)
      if not URuntimeCommonFunctionLibrary.IsWorldCompositionEnabled(r0_6) then
        r0_6.LevelName2Center:Add(r11_6, FVector2D(r18_6.level_center[1], r18_6.level_center[3]))
        r0_6.StreamLevel2ID:Add(r10_6, r18_6.id)
        r0_6.LevelID2Yaw:Add(r18_6.id, r18_6.rot)
        r0_6.id2LevelNameAndTransform[r18_6.id] = {
          string.gsub(r18_6.struct, "/Game/Maps/Datas/Data_Design/", ""),
          FVector(r18_6.P[1], r18_6.P[3], r18_6.P[2]),
          r18_6.rot
        }
      end
    elseif r14_6 or r15_6 then
      r0_6:InithomeLevel2IDInfo(r10_6, r12_6, "_Gameplay")
    end
  end
  -- close: r5_6
  if CommonUtils.IsEmpty(r0_6.homeLevel2ID) then
    for r9_6, r10_6 in pairs(r0_6.ID2DesignStreamingLevel) do
      r0_6:InithomeLevel2IDInfo(r10_6, r9_6, "")
    end
    -- close: r5_6
  end
  for r9_6, r10_6 in pairs(r0_6.ID2ArtStreamingLevel) do
    for r15_6, r16_6 in pairs(r0_6.ID2DesignStreamingLevel) do
      if string.find(r9_6, r15_6) then
        r0_6.DesignId2ArtId[r15_6] = r9_6
      end
    end
    -- close: r11_6
  end
  -- close: r5_6
  r0_6.startPoint = r0_6:GetStartPointByManager(r0_6.enterLevelID, r0_6.StartIndex)
  for r9_6, r10_6 in pairs(DataMgr.SubRegion) do
    if r0_6.ID2DesignStreamingLevel[r10_6.SubRegionLevel] then
      r0_6.LevelID2RegionID[r10_6.SubRegionLevel] = r9_6
      r0_6.RegionID2LevelID[r9_6] = r10_6.SubRegionLevel
    end
  end
  -- close: r5_6
end
function r1_0.InithomeLevel2IDInfo(r0_7, r1_7, r2_7, r3_7)
  -- line: [219, 231] id: 7
  if WorldTravelSubsystem(r0_7):IsDungeonWorld() then
    return 
  end
  r0_7.homeLevel2ID[r1_7:GetLoadedLevel()] = string.gsub(r2_7, r3_7, "")
  if not r0_7.enterLevelID then
    r0_7.enterLevelID = r2_7
  end
  local r4_7 = UE4.UGameplayStatics.GetGameMode(r0_7)
  if r4_7 ~= nil then
    r4_7:AddSubGameModeInfo(string.gsub(r2_7, r3_7, ""), r1_7:GetLoadedLevel())
  end
end
function r1_0.InitWorldLoad(r0_8, r1_8)
  -- line: [233, 274] id: 8
  r0_8:InitLevelInfo(r1_8)
  if r0_8.TempLevelDoor then
    for r6_8, r7_8 in pairs(r0_8.TempLevelDoor) do
      r0_8:RealSetLevelDoor(r7_8)
    end
    -- close: r2_8
  end
  r0_8:GetAllLevelVolume()
  for r5_8 = 1, r0_8.volumeArray:Length(), 1 do
    local r6_8 = r0_8.volumeArray:GetRef(r5_8)
    r6_8.loadName = r0_8.homeLevel2ID[UE4.URuntimeCommonFunctionLibrary.GetLevel(r6_8)]
    r6_8.WorldLoader = r0_8
  end
  r0_8.GetLevels = true
  r0_8:SetActorTickEnabled(false)
  local r2_8 = WorldTravelSubsystem(r0_8):IsDungeonWorld()
  if r0_8.enterLevelID and not r2_8 then
    r0_8:SetPlayerTrans()
    r0_8:LoadArtLevel(r0_8.enterLevelID)
  elseif r2_8 and not IsDedicatedServer(r0_8) then
    r0_8:DungeonSetPlayerTrans()
  end
  r0_8:SetForceGCAfterLevelStreamedOut(false)
end
function r1_0.AddGridFrame(r0_9, r1_9)
  -- line: [276, 289] id: 9
  if URuntimeCommonFunctionLibrary.IsWorldCompositionEnabled(r0_9) then
    r0_9:InitLevelInfo()
    r0_9.Super.AddGridFrame(r0_9, r1_9)
    return 
  end
  if r0_9.GetLevels then
    return 
  end
  if not r0_9.TempGridframe then
    r0_9.TempGridframe = {}
  end
  r0_9.TempGridframe[#r0_9.TempGridframe + 1] = r1_9
end
function r1_0.GetLevelJsonByLevelName(r0_10, r1_10)
  -- line: [291, 300] id: 10
  if not r0_10.points then
    return 
  end
  for r5_10 = 1, #r0_10.points, 1 do
    if string.find(r0_10.points[r5_10].struct, r1_10) then
      return r0_10.points[r5_10]
    end
  end
end
function r1_0.GetLevelId(r0_11, r1_11)
  -- line: [302, 307] id: 11
  if r0_11.WorldCompositionSubSystem then
    return r0_11.WorldCompositionSubSystem:GetObjectLevelId(r1_11)
  end
  return r0_11.Super.GetLevelId(r0_11, r1_11)
end
function r1_0.GetLevelIdByRegionId(r0_12, r1_12)
  -- line: [309, 311] id: 12
  return r0_12.RegionID2LevelID[r1_12]
end
function r1_0.LoadArtLevel(r0_13, r1_13)
  -- line: [313, 326] id: 13
  if URuntimeCommonFunctionLibrary.IsWorldCompositionEnabled(r0_13) then
    r0_13:InitLevelInfo()
    DebugPrint("WorldComposition, LoadArtLevel", r1_13)
    r1_13 = string.gsub(r1_13, "_Gameplay", "")
    if r0_13.id2NeedLoad[r1_13] then
      return 
    end
    r0_13.id2NeedLoad[r1_13] = true
    r0_13:AddTimer(0.7, r0_13.CheckWorldCompositionLevelLoaded, true, 0, "CheckWorldCompositionLevelLoaded", nil, r1_13)
    return 
  end
  coroutine.resume(coroutine.create(r0_13.Load), r0_13, r1_13)
end
function r1_0.CheckWorldCompositionLevelLoaded(r0_14, r1_14)
  -- line: [328, 353] id: 14
  r0_14:SetLoadProgress(r0_14.WorldCompositionSubSystem:GetLoadedLevelPercent() * 100)
  if not r0_14.WorldCompositionSubSystem then
    return 
  end
  if not r0_14.WorldCompositionSubSystem:IsWorldCompositionIdle(r0_14) then
    return 
  end
  for r6_14, r7_14 in pairs(r0_14.id2NeedLoad) do
    r0_14:OnArtLevelLoadedCallback(r6_14)
    r0_14.id2NeedLoad[r6_14] = nil
    r0_14:OnLevelLoaderReady()
  end
  -- close: r2_14
  for r6_14, r7_14 in pairs(r0_14.id2NeedLoad) do
    return 
  end
  -- close: r2_14
  local r2_14 = UGameplayStatics.GetGameState(r0_14)
  if r2_14 and r2_14:IsInDungeon() then
    r0_14:OnLevelLoaderReady()
  end
  r0_14:RemoveTimer("CheckWorldCompositionLevelLoaded")
end
function r1_0.LoadNavMesh(r0_15, r1_15)
  -- line: [355, 357] id: 15
  UGameplayStatics.LoadStreamLevel(r0_15, r1_15, true, true)
end
function r1_0.Load(r0_16, r1_16)
  -- line: [359, 377] id: 16
  if UAsyncFunctionLibrary.CheckStreamLevelBeLoadState(r0_16, r1_16 .. "_Art", true) then
    print(_G.LogTag, "CheckStreamLevelBeLoadState Failed:" .. r1_16)
    return 
  end
  r0_16.id2NeedLoad[r1_16] = true
  if r0_16.ID2ArtStreamingLevel[r1_16] then
    UGameplayStatics.LoadStreamLevel(r0_16, r1_16 .. "_Art", true, true)
  end
  if r0_16.ID2LayoutStreamingLevel[r1_16] then
    UGameplayStatics.LoadStreamLevel(r0_16, r1_16 .. "_Layout", true, true)
  end
  if r0_16.ID2SoundStreamingLevel[r1_16] then
    UGameplayStatics.LoadStreamLevel(r0_16, r1_16 .. "_Sound", true, true)
  end
end
function r1_0.UnloadArtLevel(r0_17, r1_17)
  -- line: [379, 398] id: 17
  if URuntimeCommonFunctionLibrary.IsWorldCompositionEnabled(r0_17) then
    r0_17:BeforeLevelUnloadedCallback(r1_17)
    r0_17:OnArtLevelUnloadedCallback(r1_17)
    return 
  end
  local r2_17 = r1_17
  if r0_17.ID2ArtStreamingLevel[r2_17]:GetLoadedLevel() == nil then
    return 
  end
  if not r0_17:GetLevelLoaded(r2_17) then
    return 
  end
  r0_17.ArtLevelLoaded:Add(r2_17, false)
  r0_17:BeforeLevelUnloadedCallback(r1_17)
  coroutine.resume(coroutine.create(r0_17.Unload), r0_17, r1_17)
  r0_17:OnArtLevelUnloadedCallback(r1_17)
end
function r1_0.Unload(r0_18, r1_18)
  -- line: [400, 413] id: 18
  if r0_18.ID2ArtStreamingLevel[r1_18] then
    UGameplayStatics.UnloadStreamLevel(r0_18, r1_18 .. "_Art", true)
  end
  if r0_18.ID2LayoutStreamingLevel[r1_18] then
    UGameplayStatics.UnloadStreamLevel(r0_18, r1_18 .. "_Layout", true)
  end
  if r0_18.ID2SoundStreamingLevel[r1_18] then
    UGameplayStatics.UnloadStreamLevel(r0_18, r1_18 .. "_Sound", true)
  end
end
function r1_0.OnArtLevelLoaded(r0_19)
  -- line: [416, 429] id: 19
  if URuntimeCommonFunctionLibrary.IsWorldCompositionEnabled(r0_19) then
    return 
  end
  for r5_19, r6_19 in pairs(r0_19.ID2ArtStreamingLevel) do
    if r6_19:GetLoadedLevel() ~= nil and not r0_19:GetLevelLoaded(r5_19) and r0_19.id2NeedLoad[r5_19] then
      r0_19.ArtLevelLoaded:Add(r5_19, true)
      r0_19.id2NeedLoad[r5_19] = nil
      coroutine.resume(coroutine.create(r0_19.WorldLoaderCheckArtLevelLoaded), r0_19, r6_19:GetLoadedLevel(), r5_19)
      break
    end
  end
  -- close: r1_19
end
function r1_0.WorldLoaderCheckArtLevelLoaded(r0_20, r1_20, r2_20)
  -- line: [431, 443] id: 20
  while true do
    if not UE4.UKismetSystemLibrary.IsValid(r1_20) then
      return 
    end
    local r3_20 = UE.UAsyncFunctionLibrary.CheckLevelActorsInitialized(r1_20)
    if not r3_20 then
      UE.UKismetSystemLibrary.Delay(r0_20, 0.1)
    else
      break
    end
  end
  r0_20:OnArtLevelLoadedCallback(r2_20)
  r0_20:OnLevelLoaderReady()
end
function r1_0.OnLevelLoaderReady(r0_21)
  -- line: [445, 455] id: 21
  if not r0_21.levelLoadComplete then
    r0_21.levelLoadComplete = true
    r0_21:LevelLoaderReady()
    r0_21:ReleaseInitialBuildingLock()
  end
end
function r1_0.DungeonSetPlayerTrans(r0_22)
  -- line: [464, 507] id: 22
  if IsDedicatedServer(r0_22) or WorldTravelSubsystem(r0_22):IsDungeonWorld() then
    if not r0_22.startPoint then
      r0_22:GetRandStartPoint()
    end
    if not r0_22.startPoint then
      DebugPrint("DungeonSetPlayerTrans Delay...")
      r0_22:AddTimer(0.1, r0_22.DungeonSetPlayerTrans)
      return 
    end
    if IsStandAlone(r0_22) then
      r0_22.WorldCompositionSubSystem:RequestAsyncTravel(UE4.UGameplayStatics.GetPlayerCharacter(r0_22, 0), r0_22.startPoint:GetTransform(0), {
        r0_22,
        function()
          -- line: [477, 479] id: 23
        end
      }, true, false, false)
      r0_22:AddTimer(0.7, r0_22.CheckWorldCompositionLevelLoaded, true, 0, "CheckWorldCompositionLevelLoaded", nil, nil)
    elseif IsDedicatedServer(r0_22) then
      r0_22.startPoint:InitSetPlayerTrans()
    elseif IsClient(r0_22) then
      local r1_22 = UE4.UGameplayStatics.GetPlayerCharacter(r0_22, 0)
      local r2_22 = UE4.UGameplayStatics.GetPlayerController(r0_22, 0)
      local r3_22 = nil
      if r2_22.PlayerState and r2_22.PlayerState.bIsEMInactive then
        r3_22 = r1_22:K2_GetActorLocation()
      elseif not UKismetMathLibrary.EqualEqual_VectorVector(r2_22.TargetBornLocation, FVector(0, 0, 0), 0.001) then
        r3_22 = r2_22.TargetBornLocation
      end
      local r4_22 = nil
      if r3_22 then
        r4_22 = FTransform()
        r4_22.Translation = r3_22
      else
        r4_22 = r0_22.startPoint:GetTransform(0)
      end
      if not r0_22.InitCameraActor then
        r0_22.InitCameraActor = r0_22:GetWorld():SpawnActor(ACameraActor:StaticClass(), r4_22)
      end
      r0_22.WorldCompositionSubSystem:SetViewTargetWithWC(r0_22.InitCameraActor, function()
        -- line: [502, 503] id: 24
      end, true, false)
      r0_22:AddTimer(0.7, r0_22.CheckWorldCompositionLevelLoaded, true, 0, "CheckWorldCompositionLevelLoaded", nil, nil)
    end
  end
end
function r1_0.SetEnteredPlayerTrans(r0_25, r1_25)
  -- line: [509, 516] id: 25
  if not r0_25.startPoint then
    r0_25:GetRandStartPoint()
  end
  if r0_25.startPoint then
    r0_25.startPoint:SetEnteredPlayerTrans(r1_25)
  end
end
function r1_0.RealSetNewEnteredPlayerTrans(r0_26, r1_26)
  -- line: [518, 523] id: 26
  if r0_26.startPoint == nil then
    r0_26:GetRandStartPoint()
  end
  r0_26.startPoint:RealSetNewEnteredPlayerTrans(r1_26)
end
function r1_0.SetPlayerTrans(r0_27)
  -- line: [525, 555] id: 27
  local r1_27 = UE4.UGameplayStatics.GetGameMode(r0_27)
  local r2_27 = GWorld:GetAvatar()
  if not r2_27 and not IsDedicatedServer(r0_27) then
    return 
  end
  if IsDedicatedServer(r0_27) or r1_27 and r1_27:IsInDungeon() then
    r0_27:DungeonSetPlayerTrans()
    return 
  end
  if r0_27:HandleQuestChainInitLocation(r2_27, r0_27.EnterRegionType) then
    GWorld.logger.error("ZJT_ 本次位置恢复 被任务接管 由任务设置玩家所在位置 ")
  end
  DebugPrint("ZJT_ Set Current PlayerLocation ", r2_27.CurrentRegionId, r0_27.enterLoc, r0_27.StartIndex)
  if r0_27.enterLoc and r0_27.enterLoc ~= FVector(0, 0, 0) then
    r0_27:InitSetPlayerTrans()
  else
    if not r0_27.startPoint then
      r0_27.startPoint = r0_27:GetStartPointByManager(r0_27.enterLevelID, r0_27.StartIndex)
    end
    if not r0_27.startPoint then
      r0_27:AddTimer(0.5, r0_27.SetPlayerTrans)
      return 
    end
    r0_27.startPoint:SetPlayerTrans()
    UE4.UGameplayStatics.GetPlayerCharacter(r0_27, 0):GetMovementComponent().bIsAsyncTraveling = false
  end
end
function r1_0.InitSetPlayerTrans(r0_28)
  -- line: [557, 580] id: 28
  if not UE4.UGameplayStatics.GetGameMode(r0_28) then
    return 
  end
  if r0_28.WorldCompositionSubSystem then
    local r2_28 = FTransform()
    local r3_28 = UE4.UGameplayStatics.GetPlayerCharacter(r0_28, 0)
    r2_28.Translation = r0_28.enterLoc
    r0_28.WorldCompositionSubSystem:RequestAsyncTravel(r3_28, r2_28, {
      r0_28,
      r0_28.OpenPlayerPositionSync
    }, true, true)
    UE4.UGameplayStatics.GetPlayerCharacter(r0_28, 0):K2_SetActorRotation(r0_28.enterRot, false)
    UE4.UGameplayStatics.GetPlayerController(r0_28, 0):SetControlRotation(r0_28.enterRot)
    return 
  end
  local r2_28 = UE4.UGameplayStatics.GetPlayerCharacter(r0_28, 0)
  r2_28:K2_SetActorLocation(r0_28.enterLoc + FVector(0, 0, r2_28.CapsuleComponent:GetUnscaledCapsuleHalfHeight()), false, nil, true)
  r2_28:K2_SetActorRotation(r0_28.enterRot, false)
  UE4.UGameplayStatics.GetPlayerController(r0_28, 0):SetControlRotation(r0_28.enterRot)
  r0_28:OpenPlayerPositionSync()
end
function r1_0.GetRegionIdByLocation(r0_29, r1_29)
  -- line: [582, 588] id: 29
  local r2_29 = r0_29:GetLevelIdByLocation(r1_29)
  if r0_29.LevelID2RegionID[r2_29] then
    return r0_29.LevelID2RegionID[r2_29]
  end
  return -1
end
function r1_0.GetStartPointByManager(r0_30, r1_30, r2_30)
  -- line: [598, 634] id: 30
  DebugPrint("GetStartPointByManager", r1_30, r2_30)
  if not r1_30 then
    return nil
  end
  local r3_30 = r0_30:GetRegionIdByLevelId(r1_30)
  if r3_30 == -1 then
    return 
  end
  r3_30 = r0_30:GetLevelIdByRegionId(r3_30)
  local r4_30 = nil
  for r9_30, r10_30 in pairs(r0_30.homeLevel2ID) do
    if r10_30 == r3_30 then
      r4_30 = r9_30
    end
  end
  -- close: r5_30
  if r0_30.StartPointManagers == nil or #r0_30.StartPointManagers == 0 then
    r0_30.StartPointManagers = UGameplayStatics.GetAllActorsOfClass(r0_30, LoadClass("/Game/BluePrints/Common/Level/BP_StartPointManager.BP_StartPointManager_C")):ToTable()
  end
  for r9_30, r10_30 in pairs(r0_30.StartPointManagers) do
    if URuntimeCommonFunctionLibrary.GetLevel(r10_30) == r4_30 then
      if not r2_30 or r10_30.StartPoints:Length() < r2_30 then
        r2_30 = 1
      end
      return r10_30.StartPoints:GetRef(r2_30)
    end
  end
  -- close: r5_30
  return nil
end
function r1_0.BeforeLevelUnloadedCallback(r0_31, r1_31)
  -- line: [636, 645] id: 31
  local r2_31 = UE4.UGameplayStatics.GetGameMode(r0_31)
  if IsValid(r2_31) and not IsValid(r2_31:GetWCSubSystem()) then
    r2_31:SetSnapShot(r1_31)
  end
  if not r0_31.ArtLevelUnLoadEvent[r1_31] then
    return 
  end
  for r7_31, r8_31 in pairs(r0_31.ArtLevelUnLoadEvent[r1_31]) do
    r8_31(r0_31, r1_31)
  end
  -- close: r3_31
end
function r1_0.AfterLevelLoadeCallback(r0_32, r1_32)
  -- line: [647, 652] id: 32
  if not r0_32.ArtLevelLoadEvent[r1_32] then
    return 
  end
  for r6_32, r7_32 in pairs(r0_32.ArtLevelLoadEvent[r1_32]) do
    r7_32(r0_32, r1_32)
  end
  -- close: r2_32
end
function r1_0.OpenPlayerPositionSync(r0_33)
  -- line: [654, 667] id: 33
  local r1_33 = GWorld:GetAvatar()
  if not r1_33 then
    return 
  end
  if r1_33:CheckCurrentSubRegion() and r1_33:CheckSubRegionType(nil, CommonConst.SubRegionType.Field) and not r1_33.IsOpenPlayerPositionSync then
    r1_33:PlayerEnterBigWorld()
  end
  if not r0_33.levelLoadComplete then
    return 
  end
  r1_33:ExeRegionSkipCallbck(r1_33.CurrentRegionId, "Enter")
  local r2_33 = UE4.UGameplayStatics.GetGameMode(r0_33)
  local r3_33 = UE4.UGameplayStatics.GetPlayerCharacter(r0_33, 0)
  if r3_33 and r2_33 and not r2_33:GetDungeonComponent() then
    r3_33:CreatePhantomOnLevelTransition()
  end
end
function r1_0.OpenRegionDataRecover(r0_34)
  -- line: [669, 670] id: 34
end
function r1_0.GetRegionIdByLevelId(r0_35, r1_35)
  -- line: [672, 677] id: 35
  if r0_35.LevelID2RegionID[r1_35] then
    return r0_35.LevelID2RegionID[r1_35]
  end
  return -1
end
function r1_0.OnArtLevelLoadRecoverRegionData(r0_36, r1_36)
  -- line: [680, 681] id: 36
end
function r1_0.OnArtLevelUnLoadSaveRegionData(r0_37, r1_37)
  -- line: [684, 691] id: 37
end
function r1_0.ArtLevelBindEvent(r0_38, r1_38)
  -- line: [695, 714] id: 38
  local r2_38 = UE4.UGameplayStatics.GetGameMode(r0_38)
  if not IsValid(r2_38) then
    return 
  end
  for r7_38, r8_38 in pairs(r0_38.LevelID2RegionID) do
    local r9_38, r10_38 = r2_38:GetLevelGamemModeAndLevelName(r8_38)
    if r10_38.IsActive then
      r0_38:OnArtLevelLoadRecoverRegionData(r9_38)
    end
    if not r1_38 then
      if not r0_38.ArtLevelLoadEvent[r9_38] then
        r0_38.ArtLevelLoadEvent[r9_38] = {}
      end
      table.insert(r0_38.ArtLevelLoadEvent[r9_38], r0_38.OnArtLevelLoadRecoverRegionData)
      if not r0_38.ArtLevelUnLoadEvent[r9_38] then
        r0_38.ArtLevelUnLoadEvent[r9_38] = {}
      end
      table.insert(r0_38.ArtLevelUnLoadEvent[r9_38], r0_38.OnArtLevelUnLoadSaveRegionData)
    end
  end
  -- close: r3_38
end
function r1_0.OpenInitSuit(r0_39)
  -- line: [716, 725] id: 39
  local r1_39 = UE4.UGameplayStatics.GetPlayerCharacter(r0_39, 0)
  local r2_39 = GWorld:GetAvatar()
  local r3_39 = UE4.UGameplayStatics.GetGameMode(r0_39)
  if r1_39.InitSuccess and r1_39:IsMainPlayer() and r2_39 and (r2_39:IsRealInBigWorld() or r2_39:IsInEnterBigWorld()) then
    r3_39:InitRegionSuit(r2_39, r2_39:GetSubRegionId2RegionId())
  else
    EventManager:AddEvent(EventID.OnCharacterInitSuitRecover, r1_39, r1_39.OnCharacterInitSuitRecover)
  end
end
function r1_0.RecoverArtLevelBreakable(r0_40)
  -- line: [727, 753] id: 40
end
function r1_0.ReAddSubGameModeInfo(r0_41)
  -- line: [755, 766] id: 41
  local r1_41 = UE4.UGameplayStatics.GetGameMode(r0_41)
  if r1_41 == nil then
    return 
  end
  for r6_41, r7_41 in pairs(r0_41.homeLevel2ID) do
    r1_41:AddSubGameModeInfo(r7_41, r6_41)
    if r0_41:GetLevelLoaded(r7_41) then
      r1_41:TriggerActiveSubGameModeInfo(r7_41)
    end
  end
  -- close: r2_41
end
function r1_0.HandleEnterRegionType(r0_42, r1_42, r2_42)
  -- line: [768, 774] id: 42
  DebugPrint("ZJT_ HandleEnterRegionType ", r2_42)
  if not CommonConst.EnterRegionType[r2_42] then
    return 
  end
  r0_42.EnterRegionType = r2_42
  r0_42["Handle" .. CommonConst.EnterRegionType[r2_42]](r0_42, r1_42, r2_42)
end
function r1_0.HandleGM(r0_43, r1_43, r2_43)
  -- line: [776, 779] id: 43
  r0_43.enterLevelID = DataMgr.SubRegion[r1_43.CurrentRegionId].SubRegionLevel
  r0_43.StartIndex = r1_43.StartIndex
end
function r1_0.HandleQuestChainInitLocation(r0_44, r1_44, r2_44)
  -- line: [781, 808] id: 44
  if r2_44 ~= CommonConst.EnterRegionType.Recover then
    return false
  end
  local r3_44 = r1_44.QuestChains[r1_44.TrackingQuestChainId]
  local r4_44 = UE4.UGameplayStatics.GetGameMode(r0_44)
  DebugPrint("ZJT_ HandleQuestChainInitLocation ", r1_44.TrackingQuestChainId)
  if r3_44 and r3_44:IsDoing() then
    local r5_44 = DataMgr.STLExportQuestChain[r3_44.QuestChainId]
    DebugPrint("ZJT_ HandleQuestChainInitLocation ", r5_44, r3_44.DoingQuestId)
    if r5_44 and r5_44.Quests[r3_44.DoingQuestId] then
      local r6_44 = r5_44.Quests[r3_44.DoingQuestId]
      DebugPrint("ZJT_ HandleQuestChainInitLocation 1111111 ", r6_44.SubRegionId, r6_44.SubRegionId == r1_44:GetCurrentRegionId())
      if r6_44.SubRegionId and DataMgr.SubRegion[r6_44.SubRegionId] and r6_44.SubRegionId == r1_44:GetCurrentRegionId() and r3_44.LoginPlayerTransform then
        local r7_44 = r3_44.LoginPlayerTransform[r3_44.DoingQuestId]
        if r7_44 then
          local r8_44 = r4_44.EMGameState:GetTargetPoint(r7_44)
          if r8_44 and r8_44:IsValid() then
            r0_44.enterLoc = r8_44:K2_GetActorLocation()
            r0_44.enterRot = r8_44:K2_GetActorRotation()
            return true
          end
        end
      end
    end
  end
  return false
end
function r1_0.HandleRecover(r0_45, r1_45, r2_45)
  -- line: [810, 824] id: 45
  if r1_45:InitRecoverCheck() then
    r0_45.enterLevelID = DataMgr.SubRegion[r1_45:GetLastRegionId()].SubRegionLevel
    local r3_45 = r1_45.LastRegionData:GetLocation()
    local r4_45 = r1_45.LastRegionData:GetRotation()
    r0_45.enterLoc = FVector(r3_45.X, r3_45.Y, r3_45.Z)
    r0_45.enterRot = FRotator(0, r4_45.Yaw, 0)
    DebugPrint("ZJT_ HandleRecover 成功 ", r0_45.enterLoc, r1_45.LastRegionData.RegionId)
  else
    r0_45.enterLevelID = DataMgr.SubRegion[r1_45.CurrentRegionId].SubRegionLevel
    r0_45.StartIndex = r1_45.StartIndex and 1
    DebugPrint("ZJT_ HandleRecover 失败 ", r0_45.StartIndex, r0_45.enterLevelID, r1_45:InitRecoverCheck())
  end
end
function r1_0.HandleSojourns(r0_46, r1_46, r2_46)
  -- line: [826, 829] id: 46
  r0_46.enterLevelID = DataMgr.SubRegion[r1_46.CurrentRegionId].SubRegionLevel
  r0_46.StartIndex = r1_46.StartIndex
end
function r1_0.HandleSelectMap(r0_47, r1_47, r2_47)
  -- line: [831, 834] id: 47
  r0_47.enterLevelID = DataMgr.SubRegion[r1_47.CurrentRegionId].SubRegionLevel
  r0_47.StartIndex = r1_47.StartIndex
end
function r1_0.HandleDeliver(r0_48, r1_48, r2_48)
  -- line: [836, 839] id: 48
  r0_48.enterLevelID = DataMgr.SubRegion[r1_48.CurrentRegionId].SubRegionLevel
  r0_48.StartIndex = r1_48.StartIndex
end
function r1_0.HandleFirstRegion(r0_49, r1_49, r2_49)
  -- line: [841, 844] id: 49
  r0_49.enterLevelID = DataMgr.SubRegion[r1_49.CurrentRegionId].SubRegionLevel
  r0_49.StartIndex = r1_49.StartIndex
end
function r1_0.SetLevelDoor(r0_50, r1_50)
  -- line: [846, 851] id: 50
  if not r0_50.TempLevelDoor then
    r0_50.TempLevelDoor = {}
  end
  table.insert(r0_50.TempLevelDoor, r1_50)
end
function r1_0.RealSetLevelDoor(r0_51, r1_51)
  -- line: [853, 879] id: 51
  if URuntimeCommonFunctionLibrary.IsWorldCompositionEnabled(r0_51) then
    return 
  end
  local r2_51 = UE4.URuntimeCommonFunctionLibrary.GetLevel(r1_51)
  for r7_51, r8_51 in pairs(r0_51.ID2DesignStreamingLevel) do
    if r8_51 and r8_51:GetLoadedLevel() == r2_51 then
      local r9_51 = r0_51:GetLevelJsonByLevelName(r7_51).door
      if r9_51 ~= nil then
        for r13_51 = 1, #r9_51, 1 do
          if r9_51[r13_51].door_name == r1_51.DisplayName then
            r1_51.if_door = r9_51[r13_51].if_door == 1
            r1_51.door_state = r9_51[r13_51].door_state == 1
            r1_51.LevelPathfinding = r0_51.LevelPathfinding
            r1_51.LevelId = r7_51
            r1_51.OtherLevelId = r0_51.LevelIDInt2String:Find(r9_51[r13_51].next_id)
            r0_51.LevelPathfinding.Name2BpArrowPos:Add(r1_51.LevelId .. r9_51[r13_51].door_name, r1_51)
            if r9_51[r13_51].next_id and r9_51[r13_51].next_id ~= -1 then
              r0_51.LevelPathfinding:AddLevelDoor(r7_51, r0_51.LevelIDInt2String:Find(r9_51[r13_51].next_id), r1_51.DisplayName)
            end
            return 
          end
        end
      end
    end
  end
  -- close: r3_51
end
function r1_0.SetLoadProgress(r0_52, r1_52)
  -- line: [881, 894] id: 52
  if not r1_52 or r1_52 <= 0 or r1_52 >= 100 then
    return 
  end
  r0_52.loadProgress = r1_52
  if r0_52.LoadingUI then
    DebugPrint("SetLoadProgress CloseLoading", r0_52.loadProgress * 0.5)
    r0_52.LoadingUI:AddQuene(r0_52.loadProgress * 0.5)
  else
    r0_52.LoadingUI = UE4.UGameplayStatics.GetGameInstance(r0_52):GetLoadingUI()
  end
end
return r1_0
