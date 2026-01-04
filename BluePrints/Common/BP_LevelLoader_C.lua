-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Common\BP_LevelLoader_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints/Common/EMLevelLoader",
  "BluePrints.Common.TimerMgr"
})
local r1_0 = require("BluePrints.UI.GMInterface.GMFunctionLibrary")
local r2_0 = require("EMLuaConst")
function r0_0.ReceiveBeginPlay(r0_1)
  -- line: [16, 163] id: 1
  r0_1.Overridden.ReceiveBeginPlay(r0_1)
  if IsDedicatedServer(r0_1) then
    r0_1.IsPC = true
  else
    r0_1.IsPC = CommonUtils.GetDeviceTypeByPlatformName(r0_1) == "PC"
  end
  if r2_0 and IsClient(r0_1) then
    r0_1.UseCCDOldValue = r2_0.UseCCDInPC
    r2_0.UseCCDInPC = false
  end
  r0_1.PCScalabilityLevelNum = {
    [0] = 6,
    [1] = 7,
    [2] = 8,
  }
  r0_1.MobileScalabilityLevelNum = {
    IOS = 5,
    Android = 8,
  }
  r0_1.MinimumLoadMaxLevelNum = 5
  if r0_1.IsPC then
    r0_1.MinimumLoadMaxLevelNum = r0_1.PCScalabilityLevelNum[GWorld.GameInstance.GetGameplayScalabilityLevel()] and r0_1.MinimumLoadMaxLevelNum
  else
    r0_1.MinimumLoadMaxLevelNum = r0_1.MobileScalabilityLevelNum[UE4.UUIFunctionLibrary.GetDevicePlatformName(r0_1)] and r0_1.MinimumLoadMaxLevelNum
  end
  DebugPrint("NewLevelLoader", "MinimumLoadMaxLevelNum:", r0_1.MinimumLoadMaxLevelNum)
  r0_1:BeginPlay()
  r0_1.EnvironmentManager.bFixLightDirection = false
  r0_1.showAllLevel = false
  r0_1.DungeonShowAllLevel = false
  r0_1.DungeonMinimumLevel = _G.UseMinimumLoad
  if not r0_1.IsLoaded then
    if not IsDedicatedServer(r0_1) then
      r0_1.LoadingUI = UE4.UGameplayStatics.GetGameInstance(r0_1):ShowLoadingUI(UIConst.COMMONCHANGESCENE)
    else
      r0_1.showAllLevel = true
    end
  end
  r0_1.shortname = UE4.URuntimeCommonFunctionLibrary.GetLevelLoadJsonName(r0_1)
  local r1_1 = UGameplayStatics.GetGameMode(r0_1)
  if IsStandAlone(r0_1) and r1_1 and r1_1:NeedProgressRecover() then
    r0_1.shortname = r1_1:GetProgressDataJsonName()
    URuntimeCommonFunctionLibrary.SetLevelLoadJsonName(r0_1, r0_1.shortname)
    local r2_1 = r1_1:GetProgressDataPlayerTransform()
    if r2_1 then
      r0_1.ProgressLoc = r2_1.Translation
      r0_1.ProgressRot = r2_1.Rotation:ToRotator()
    end
    local r4_1 = DataMgr.Dungeon[r1_1:GetProgressDataDungeonId()]
    if r4_1 and r4_1.IsRandom then
      if r4_1.DungeonDoorBP then
        r0_1.DoorClass = LoadClass(r4_1.DungeonDoorBP)
      end
      r0_1.showAllLevel = r4_1.ShowAllLevel
      r0_1.DungeonShowAllLevel = r4_1.ShowAllLevel
    end
  end
  local r3_1 = DataMgr.Dungeon[GWorld.GameInstance:GetCurrentDungeonId()]
  if r3_1 and r3_1.IsRandom then
    if r3_1.DungeonDoorBP then
      r0_1.DoorClass = LoadClass(r3_1.DungeonDoorBP)
    end
    if not IsDedicatedServer(r0_1) and IsStandAlone(r0_1) and r3_1.ShowAllLevel then
      r0_1.showAllLevel = true
    end
    r0_1.DungeonShowAllLevel = r3_1.ShowAllLevel
  end
  if URuntimeCommonFunctionLibrary.IsPlayInEditor(r0_1) then
    local r4_1 = require("BluePrints.UI.GMInterface.GMVariable")
    if r4_1.LevelLoaderShortName then
      r0_1.shortname = r4_1.LevelLoaderShortName
      r4_1.LevelLoaderShortName = nil
    end
  end
  DebugPrint("NewLevelLoader", "BP_LevelLoader_C:ReceiveBeginPlay LevelLoadJsonName:", r0_1.shortname)
  local r4_1 = DataMgr.GetLevelLoaderJsonData(r0_1.shortname)
  r0_1.points = r4_1.points
  r0_1.attr = r4_1.attr
  r0_1.numOfLevels = #r0_1.points
  r0_1:SetLoadProgress(0)
  r0_1.levelLoadComplete = false
  r0_1.homeStreamingLevel2ID = {}
  r0_1.ID2ArtStreamingLevel = {}
  r0_1.DesignStreamingLevel2ID = {}
  r0_1.homeLevel2ID = {}
  r0_1.homeLevelLoaded = {}
  r0_1.designStreamLevel2DoorData = {}
  r0_1.levelName2Id = {}
  r0_1.artStreamingLevels = {}
  r0_1.soundStreamingLevels = {}
  r0_1.effectStreamingLevels = {}
  r0_1.homeStreamingLevels = {}
  r0_1.designStreamingLevels = {}
  r0_1.layoutStreamingLevels = {}
  r0_1.enterLevelID = -1
  r0_1.exitLevelID = -1
  r0_1.loadCompleteCallback = {}
  r0_1.Doors = {}
  r0_1.LevelId2Doors = {}
  r0_1.HasLayout = false
  r0_1.ID2LayoutStreamingLevel = {}
  r0_1.CacheEids = {}
  r0_1.LevelLoadQueue = {}
  r0_1.CoroutineTable = {}
  r0_1.StreamLevelLoadFlag = false
  local r5_1 = UGameplayStatics.GetPlatformName()
  local r6_1 = _G.UseDungeonLevelBounds
  if not r6_1 then
    if r5_1 ~= "Android" then
      r6_1 = r5_1 == "IOS"
    else
      goto label_308	-- block#46 is visited secondly
    end
  end
  r0_1.UseDungeonLevelBounds = r6_1
  coroutine.resume(coroutine.create(r0_1.PreloadLevels), r0_1)
  EventManager:AddEvent(EventID.ElevatorMechanismCompleteNotify, r0_1, r0_1.OnElevatorMechanismCompleteNotify)
  r6_1 = UE4.UGameplayStatics.GetGameInstance(r0_1)
  if r6_1 then
    r6_1:UpdatePostProcessMaterial()
  end
  r0_1:EnableSoftwareOcclusion()
end
function r0_0.ReceiveEndPlay(r0_2, r1_2)
  -- line: [165, 173] id: 2
  if r2_0 and r0_2.UseCCDOldValue ~= nil then
    r2_0.UseCCDInPC = r0_2.UseCCDOldValue
  end
  r0_2.Overridden.ReceiveEndPlay(r0_2, r1_2)
  EventManager:RemoveEvent(EventID.ElevatorMechanismCompleteNotify, r0_2)
end
function r0_0.GetShortName(r0_3)
  -- line: [175, 177] id: 3
  return r0_3.shortname
end
function r0_0.GetLevelIdByLevel(r0_4, r1_4)
  -- line: [179, 192] id: 4
  for r7_4, r8_4 in pairs(r0_4.StreamLevel2ID:ToTable()) do
    if r7_4:GetLoadedLevel() == r1_4 then
      return tostring(r8_4)
    end
  end
  -- close: r3_4
  for r7_4, r8_4 in pairs(r0_4.ID2DesignStreamingLevel) do
    if r8_4:GetLoadedLevel() == r1_4 then
      return tostring(r7_4)
    end
  end
  -- close: r3_4
  return ""
end
function r0_0.PreloadLevels(r0_5)
  -- line: [208, 433] id: 5
  r0_5.PreLoadComplete = false
  local r1_5 = UE4.URuntimeCommonFunctionLibrary.IsPlayInEditor(r0_5)
  local r2_5 = TArray(AActor)
  for r6_5 = 1, r0_5.numOfLevels, 1 do
    if r0_5.points[r6_5].enterLevel and r0_5.points[r6_5].enterLevel == 1 then
      r0_5.enterLevelID = tostring(r0_5.points[r6_5].id)
    end
  end
  for r6_5 = 1, r0_5.numOfLevels, 1 do
    local r7_5 = r0_5.points[r6_5]
    local r8_5 = string.gsub(r7_5.struct, "Datas/Data_Design", "Levels")
    local r9_5 = r7_5.struct .. "_Design"
    local r10_5 = r7_5.art_path and string.gsub(r7_5.struct, "Data_Design", "Data_Art") .. "_Art"
    local r11_5 = string.gsub(r7_5.struct, "Data_Design", "Data_Layout") .. "_Layout"
    local r12_5 = string.gsub(r7_5.struct, "Data_Design", "Data_NavMesh") .. "_NavMesh"
    local r13_5 = string.gsub(r7_5.struct, "Data_Design", "Data_Sound") .. "_Sound"
    local r14_5 = string.gsub(r7_5.struct, "Data_Design", "Data_Effect") .. "_Effect"
    local r15_5 = r7_5.P
    local r16_5 = FVector(r7_5.level_center[1], r7_5.level_center[3], r7_5.level_center[2])
    local r17_5 = FVector(r15_5[1], r15_5[3], r15_5[2])
    local r18_5 = FRotator(0, r7_5.rot, 0)
    local r19_5 = tostring(r7_5.id)
    r0_5.LevelIDInt2String:Add(r7_5.id, r19_5)
    r0_5.LevelIDString2Int:Add(r19_5, r7_5.id)
    local r20_5 = false
    local r21_5 = nil
    local r23_5 = UE4.UKismetMathLibrary.TransformLocation(UE4.UKismetMathLibrary.MakeTransform(r16_5, r18_5, UE4.UKismetMathLibrary.Vector_One()), UE4.UKismetMathLibrary.Vector_Zero() - r16_5) - r16_5 + r17_5
    local r24_5 = string.gsub(r10_5, "/Game/Maps/Datas/Data_Art/", "")
    r0_5.id2LevelNameAndTransform[r19_5] = {
      string.sub(r24_5, 1, string.len(r24_5) + -4),
      r17_5,
      r7_5.rot
    }
    r0_5.id2LevelLocationAndRotation[r19_5] = {
      r10_5,
      r23_5,
      r18_5
    }
    DebugPrint("PreloadLevels", "LoadLevelInstance", r0_5, tostring(r8_5), r23_5, r18_5, r20_5, tostring(r19_5))
    r20_5, r21_5 = UE4.ULevelStreamingDynamic.LoadLevelInstance(r0_5, tostring(r8_5), r23_5, r18_5, r20_5, tostring(r19_5))
    r0_5.homeStreamingLevels[#r0_5.homeStreamingLevels + 1] = r21_5
    r0_5.homeStreamingLevels[#r0_5.homeStreamingLevels].OnLevelLoaded:Add(r0_5, r0_5.OnHomeLevelLoaded)
    r0_5.homeStreamingLevel2ID[r0_5.homeStreamingLevels[#r0_5.homeStreamingLevels]] = r19_5
    r0_5.StreamLevelLoadFlag = true
    while r0_5.StreamLevelLoadFlag do
      UE.UKismetSystemLibrary.Delay(r0_5, 0.1)
    end
    r20_5, r21_5 = UE4.ULevelStreamingDynamic.LoadLevelInstance(r0_5, tostring(r9_5), r23_5, r18_5, r20_5, r19_5 .. "_Design")
    r0_5.designStreamingLevels[#r0_5.designStreamingLevels + 1] = r21_5
    r0_5.designStreamingLevels[#r0_5.designStreamingLevels].OnLevelShown:Add(r0_5, r0_5.OnDesignLevelLoaded)
    r0_5.ID2DesignStreamingLevel[r19_5] = r0_5.designStreamingLevels[#r0_5.designStreamingLevels]
    r0_5.designStreamLevel2DoorData[r0_5.designStreamingLevels[#r0_5.designStreamingLevels]] = r7_5
    r0_5.DesignStreamingLevel2ID[r0_5.designStreamingLevels[#r0_5.designStreamingLevels]] = r19_5
    r0_5.StreamLevelLoadFlag = true
    while r0_5.StreamLevelLoadFlag do
      UE.UKismetSystemLibrary.Delay(r0_5, 0.1)
    end
    r0_5.LevelName2Center:Add(r12_5, FVector2D(r16_5.X, r16_5.Y))
    r0_5.LevelID2Yaw:Add(r19_5, r7_5.rot)
    if IsAuthority(r0_5) or URuntimeCommonFunctionLibrary.GetShouldAllowClientSideNavigation(r0_5) then
      r20_5, r21_5 = UE4.ULevelStreamingDynamic.LoadLevelInstance(r0_5, tostring(r12_5), r23_5, r18_5, r20_5, r19_5 .. "_NavMesh")
      r0_5.StreamLevel2ID:Add(r21_5, r7_5.id)
      if r20_5 then
        r0_5.NavMeshLevelCount = r0_5.NavMeshLevelCount + 1
        r0_5.StreamLevelLoadFlag = true
        while r0_5.StreamLevelLoadFlag do
          UE.UKismetSystemLibrary.Delay(r0_5, 0.1)
        end
      end
    end
    local r25_5 = Split(r10_5, "/")
    r0_5.levelName2Id[r25_5[#r25_5]] = r19_5
    if r0_5.IsPC then
      local r27_5 = r10_5 .. "_PC"
      local r28_5 = UResourceLibrary.CheckResourceExistOnDisk(r27_5)
      if r28_5 then
        r28_5 = nil
        r20_5, r28_5 = UAsyncFunctionLibrary.LoadLevelInstance(r0_5, tostring(r27_5), r23_5, r18_5, r20_5, r19_5 .. "_Art_PC")
        if r20_5 then
          r28_5.OnLevelLoaded:Add(r0_5, function()
            -- line: [315, 317] id: 6
            r0_5:OnClientOnlyLevelLoaded(r28_5:GetLoadedLevel())
          end)
        end
        if r20_5 and r0_5.showAllLevel then
          r28_5:SetShouldBeLoaded(true)
        end
        -- close: r28_5
      end
    else
      local r28_5 = r10_5
      local r27_5 = string.gsub(r28_5, "/Maps/", "/Maps_Phone/")
      r28_5 = UResourceLibrary
      r28_5 = r28_5.CheckResourceExistOnDisk
      r28_5 = r28_5(r27_5)
      if r28_5 then
        r10_5 = r27_5
      end
    end
    local r28_5 = r0_5
    r20_5, r21_5 = UAsyncFunctionLibrary.LoadLevelInstance(r28_5, tostring(r10_5), r23_5, r18_5, r20_5, r19_5 .. "_Art")
    r28_5 = r0_5.artStreamingLevels
    r28_5 = #r28_5
    r28_5 = r28_5 + 1
    r0_5.artStreamingLevels[r28_5] = r21_5
    if r0_5.showAllLevel then
      if r0_5.LevelID2GridFrame:Find(r19_5) then
        r28_5 = r10_5
        if not string.find(r28_5, "GuideMan") then
          r2_5:Add(r0_5.LevelID2GridFrame:FindRef(r19_5))
          r0_5:SetRVTVolume(r2_5)
        end
      end
      r21_5.OnLevelLoaded:Add(r0_5, function()
        -- line: [341, 343] id: 7
        r0_5:OnArtLevelLoaded(r19_5)
      end)
      r21_5:SetShouldBeLoaded(true)
      r0_5.StreamLevelLoadFlag = true
    else
      r0_5:OnArtLevelUnloaded()
    end
    r28_5 = r0_5.artStreamingLevels
    r28_5 = r28_5[#r0_5.artStreamingLevels]
    r0_5.ID2ArtStreamingLevel[r19_5] = r28_5
    r28_5 = r0_5.artStreamingLevels
    r28_5 = r28_5[#r0_5.artStreamingLevels]
    r0_5.artStreamingLevel2ID[r28_5] = r19_5
    while r0_5.StreamLevelLoadFlag do
      r28_5 = r0_5
      UE.UKismetSystemLibrary.Delay(r28_5, 0.1)
    end
    if r1_5 and (r7_5.if_layout == 1 or not r7_5.if_layout) then
      r28_5 = r0_5
      r20_5, r21_5 = UE4.ULevelStreamingDynamic.LoadLevelInstance(r28_5, tostring(r11_5), r23_5, r18_5, r20_5, r19_5 .. "_Layout")
      if r20_5 then
        r0_5.HasLayout = true
        r0_5.layoutStreamingLevels[r19_5] = true
        r0_5.ID2LayoutStreamingLevel[r19_5] = r21_5
        if not r0_5.showAllLevel or r0_5.showAllLevel and r0_5.enterLevelID == r19_5 then
          r21_5:SetShouldBeLoaded(false)
        end
      end
    end
    r28_5 = r0_5
    local r27_5 = IsDedicatedServer(r28_5)
    if not r27_5 then
      r27_5 = nil
      r28_5 = UE4
      r28_5 = r28_5.ULevelStreamingDynamic
      r28_5 = r28_5.LoadLevelInstance
      r20_5, r27_5 = r28_5(r0_5, tostring(r13_5), r23_5, r18_5, r20_5, r19_5 .. "_Sound")
      r28_5 = r0_5.soundStreamingLevels
      r28_5[r19_5] = r20_5
      if r20_5 then
        r28_5 = r27_5.OnLevelLoaded
        r28_5:Add(r0_5, function()
          -- line: [374, 376] id: 8
          r0_5:OnClientOnlyLevelLoaded(r27_5:GetLoadedLevel())
        end)
      end
      r28_5 = r0_5.showAllLevel
      if not r28_5 and r20_5 then
        r27_5:SetShouldBeLoaded(false)
      end
      -- close: r27_5
    end
    r27_5 = IsDedicatedServer
    r28_5 = r0_5
    r27_5 = r27_5(r28_5)
    if not r27_5 then
      r27_5 = nil
      r28_5 = UE4
      r28_5 = r28_5.ULevelStreamingDynamic
      r28_5 = r28_5.LoadLevelInstance
      r20_5, r27_5 = r28_5(r0_5, tostring(r14_5), r23_5, r18_5, r20_5, r19_5 .. "_Effect")
      r28_5 = r0_5.effectStreamingLevels
      r28_5[r19_5] = r20_5
      if r20_5 then
        r28_5 = r27_5.OnLevelLoaded
        r28_5:Add(r0_5, function()
          -- line: [388, 390] id: 9
          r0_5:OnClientOnlyLevelLoaded(r27_5:GetLoadedLevel())
        end)
      end
      r28_5 = r0_5.showAllLevel
      if not r28_5 and r20_5 then
        r27_5:SetShouldBeLoaded(false)
      end
      -- close: r27_5
    end
    r27_5 = r7_5.door
    if r27_5 then
      r27_5 = 1
      r28_5 = r7_5.door
      r28_5 = #r28_5
      for r30_5 = r27_5, r28_5, 1 do
        local r31_5 = r7_5.door[r30_5]
        if r31_5.next_id and r31_5.next_id ~= -1 then
          r0_5.LevelPathfinding:AddLevelDoor(r19_5, r31_5.next_id, r31_5.door_name)
        end
      end
    end
    r27_5 = r7_5.exitLevel
    if r27_5 then
      r27_5 = r7_5.exitLevel
      if r27_5 == 1 then
        r0_5.exitLevelID = r19_5
      end
    end
    -- close: r7_5
  end
  if IsAuthority(r0_5) then
    r0_5:ReleaseInitialBuildingLock()
  end
  if IsClient(r0_5) then
    r0_5.WaitForPlayerStateTime = UGameplayStatics.GetRealTimeSeconds(r0_5)
    while true do
      local r3_5 = UGameplayStatics.GetPlayerController(r0_5, 0)
      if not r3_5 or not r3_5.PlayerState then
        if UGameplayStatics.GetRealTimeSeconds(r0_5) - r0_5.WaitForPlayerStateTime > 60 then
          DebugPrint("NewLevelLoader", "Wait for PlayerState OverLimit!!!!")
          break
        else
          UKismetSystemLibrary.Delay(r0_5, 0.1)
          DebugPrint("NewLevelLoader", "Wait for PlayerState")
        end
      else
        break
      end
    end
  end
  r0_5.PreLoadComplete = true
  r0_5:NextStep()
  DebugPrint("PreloadLevel Complete")
end
function r0_0.OnHomeLevelLoaded(r0_10)
  -- line: [438, 452] id: 10
  if r0_10.levelLoadComplete == true then
    return 
  end
  r0_10:SetLoadProgress(r0_10.loadProgress + 1 / r0_10.numOfLevels * 0.5 * 0.5)
  for r4_10 = 1, r0_10.numOfLevels, 1 do
    if r0_10.homeStreamingLevels[r4_10] and r0_10.homeStreamingLevels[r4_10]:GetLoadedLevel() ~= nil and r0_10.homeLevelLoaded[r4_10] == nil then
      r0_10.homeLevelLoaded[r4_10] = r0_10.homeStreamingLevels[r4_10]:GetLoadedLevel()
      r0_10.homeLevel2ID[r0_10.homeLevelLoaded[r4_10]] = r0_10.homeStreamingLevel2ID[r0_10.homeStreamingLevels[r4_10]]
      r0_10:OnHomeLevelLoadedCallback(r0_10.homeStreamingLevel2ID[r0_10.homeStreamingLevels[r4_10]])
    end
  end
  r0_10:OnStreamingLevelLoaded()
  r0_10.StreamLevelLoadFlag = false
end
function r0_0.OnDesignLevelLoaded(r0_11)
  -- line: [454, 461] id: 11
  if r0_11.levelLoadComplete == true then
    return 
  end
  r0_11:SetLoadProgress(r0_11.loadProgress + 1 / r0_11.numOfLevels / 2 * 0.5)
  r0_11:OnStreamingLevelLoaded()
  r0_11.StreamLevelLoadFlag = false
end
function r0_0.OnArtLevelUnloaded(r0_12)
  -- line: [463, 470] id: 12
  if r0_12.levelLoadComplete then
    return 
  end
  r0_12:SetLoadProgress(r0_12.loadProgress + 1 / r0_12.numOfLevels / 2 * 0.5)
  r0_12:OnStreamingLevelLoaded()
  r0_12.StreamLevelLoadFlag = false
end
function r0_0.OnPostAttachNavMeshDataChunk_Lua(r0_13, r1_13)
  -- line: [472, 474] id: 13
  r0_13.StreamLevelLoadFlag = false
end
function r0_0.OnArtLevelLoaded(r0_14, r1_14)
  -- line: [476, 501] id: 14
  DebugPrint("zzzzzz", "OnArtLevelLoaded")
  PrintTable(r0_14.ArtLevelLoaded:ToTable())
  if r0_14.ID2ArtStreamingLevel[r1_14]:GetLoadedLevel() ~= nil and not r0_14:GetLevelLoaded(r1_14) then
    r0_14:DisableLevelRVTVolume(r0_14.ID2ArtStreamingLevel[r1_14])
    if not r0_14.IsPC and IsClient(r0_14) then
      r0_14:OnClientOnlyLevelLoaded(r0_14.ID2ArtStreamingLevel[r1_14]:GetLoadedLevel())
    end
    DebugPrint("NewLevelLoader", "Start Art Level Check. ID:" .. r1_14)
    EventManager:FireEvent(EventID.OnArtLevelLoadedStateChange, r1_14, true)
    r0_14.CoroutineTable[r1_14] = coroutine.create(r0_14.LevelLoaderCheckArtLevelLoaded)
    coroutine.resume(r0_14.CoroutineTable[r1_14], r0_14, r0_14.ID2ArtStreamingLevel[r1_14]:GetLoadedLevel(), r1_14)
  end
  if r0_14.levelLoadComplete == true or r1_14 ~= r0_14.enterLevelID and not r0_14.showAllLevel then
    return 
  end
  r0_14:OnStreamingLevelLoaded()
end
function r0_0.LevelLoaderCheckArtLevelLoaded(r0_15, r1_15, r2_15)
  -- line: [503, 572] id: 15
  while not URuntimeCommonFunctionLibrary.IsWorldCompositionEnabled(r0_15) do
    local r3_15 = UE4.UKismetSystemLibrary.IsValid(r1_15)
    if not r3_15 then
      return 
    end
    r3_15 = r1_15.bIsVisible
    if not r3_15 then
      UE.UKismetSystemLibrary.Delay(r0_15, 0.1)
    else
      break
    end
  end
  local r3_15 = nil
  while true do
    if not r3_15 then
      r3_15 = r0_15.ID2DesignStreamingLevel[r2_15]:GetLoadedLevel()
    end
    if r3_15 and r3_15.bIsVisible then
      if not r0_15.HasLayout or not r0_15.layoutStreamingLevels[r2_15] then
        if r0_15.showAllLevel then
          r0_15.StreamLevelLoadFlag = false
          break
        else
          DebugPrint("NewLevelLoader", "End Art Level Check1. ID:" .. r2_15)
          r0_15:OnArtLevelLoadedCallback(r2_15)
          break
        end
      else
        break
      end
    else
      UE.UKismetSystemLibrary.Delay(r0_15, 0.1)
    end
  end
  if r0_15.HasLayout and r0_15.layoutStreamingLevels[r2_15] then
    local r4_15 = nil
    while true do
      if not r4_15 then
        r4_15 = r0_15.ID2LayoutStreamingLevel[r2_15]:GetLoadedLevel()
      end
      if r4_15 and r4_15.bIsVisible then
        if r0_15.showAllLevel then
          r0_15.StreamLevelLoadFlag = false
          break
        else
          DebugPrint("NewLevelLoader", "End Art Level Check2. ID:" .. r2_15)
          r0_15:OnArtLevelLoadedCallback(r2_15)
          break
        end
      else
        UE.UKismetSystemLibrary.Delay(r0_15, 0.1)
      end
    end
  end
  r0_15.ArtLevelLoaded:Add(r2_15, true)
  r0_15:ApplyInstancedFoliageActor(r1_15)
  UKismetSystemLibrary.ExecuteConsoleCommand(r0_15, "r.Shadow.ForceCacheUpdate 1", nil)
  if r2_15 == r0_15.enterLevelID and not r0_15.levelLoadComplete then
    r0_15:SetLoadProgress(r0_15.loadProgress + 0.125)
    r0_15:OnStreamingLevelLoaded()
    if IsDedicatedServer(r0_15) and r0_15.PreLoadComplete then
      r0_15.levelLoadComplete = true
      r0_15:NextStep()
    end
  end
  if r0_15.CapturePathLevel and not r0_15.levelLoadComplete then
    for r8_15, r9_15 in pairs(r0_15.CapturePathLevel) do
      if r2_15 == r9_15 then
        r0_15:SetLoadProgress(r0_15.loadProgress + 0.125 / #r0_15.CapturePathLevel)
        r0_15:OnStreamingLevelLoaded()
        break
      end
    end
    -- close: r4_15
  end
  r0_15:LoadNextArtLevel()
  r0_15.CoroutineTable[r2_15] = nil
end
function r0_0.OnStreamingLevelLoaded(r0_16)
  -- line: [579, 603] id: 16
  if r0_16.showAllLevel then
    return 
  end
  if not r0_16.StreamingCount then
    r0_16.StreamingCount = 0
  end
  r0_16.StreamingCount = r0_16.StreamingCount + 1
  if math.abs(r0_16:GetLoadProgress() - 0.75) < 0.00001 then
  end
  if math.abs(r0_16:GetLoadProgress() - 1) < 0.00001 then
    r0_16.levelLoadComplete = true
    r0_16:NextStep()
  end
  r0_16.Overridden.OnStreamingLevelLoaded(r0_16)
end
function r0_0.OnPreloadComplete(r0_17)
  -- line: [605, 718] id: 17
  r0_17.LevelBoundArray = UGameplayStatics.GetAllActorsOfClass(r0_17, AAutoLevelBound.StaticClass())
  for r4_17 = 1, r0_17.LevelBoundArray:Length(), 1 do
    local r5_17 = r0_17.LevelBoundArray:GetRef(r4_17)
    local r6_17 = UE4.URuntimeCommonFunctionLibrary.GetLevel(r5_17)
    r5_17.loadName = r0_17.homeLevel2ID[r6_17]
    r5_17.levelLoader = r0_17
    r5_17.ID = r0_17.homeLevel2ID[r6_17]
  end
  for r4_17 = 1, r0_17.volumeArray:Length(), 1 do
    local r5_17 = r0_17.volumeArray:GetRef(r4_17)
    local r6_17 = UE4.URuntimeCommonFunctionLibrary.GetLevel(r5_17)
    r5_17.loadName = r0_17.homeLevel2ID[r6_17]
    r5_17.levelLoader = r0_17
    r5_17.ID = r0_17.homeLevel2ID[r6_17]
  end
  if r0_17.showAllLevel then
    r0_17:MarkRVTVolumeDirty()
  else
    local r1_17 = TArray(AActor)
    for r6_17, r7_17 in pairs(r0_17.LevelID2GridFrame) do
      if not string.find(r0_17.id2LevelLocationAndRotation[r6_17][1], "GuideMan") then
        r1_17:Add(r7_17)
      end
    end
    -- close: r2_17
    r0_17:SetRVTVolume(r1_17)
  end
  r0_17.LevelPathfinding.LevelLoaderComplete = true
  local r1_17 = UGameplayStatics.GetGameMode(r0_17)
  if IsClient(r0_17) then
    local r2_17 = UGameplayStatics.GetPlayerController(r0_17, 0)
    local r3_17 = nil
    local r4_17 = UGameplayStatics.GetPlayerCharacter(r0_17, 0)
    r0_17.LevelPathfinding:UpdateAllPathfinding(r4_17.CurrentLevelId)
    DebugPrint("NewLevelLoader playerController.PlayerState", r2_17 and r2_17.PlayerState)
    if r2_17 and r2_17.PlayerState and r2_17.PlayerState.bIsEMInactive then
      r3_17 = r4_17:K2_GetActorLocation()
      DebugPrint("NewLevelLoader", "bIsEMInactive", r3_17)
    elseif not UKismetMathLibrary.EqualEqual_VectorVector(r2_17.TargetBornLocation, FVector(0, 0, 0), 0.001) then
      r3_17 = r2_17.TargetBornLocation
      DebugPrint("NewLevelLoader", "TargetBornLocation", r3_17)
    end
    DebugPrint("NewLevelLoader", "Client TempLoc", r3_17)
    r0_17:SetEnterLevelID(r3_17)
  elseif IsStandAlone(r0_17) and r1_17 and r1_17:NeedProgressRecover() then
    r0_17:SetEnterLevelID(r0_17.ProgressLoc)
  end
  if not r0_17.showAllLevel then
    for r5_17 = 1, r0_17.numOfLevels, 1 do
      local r6_17 = r0_17.artStreamingLevel2ID[r0_17.artStreamingLevels[r5_17]]
      r0_17.artStreamingLevels[r5_17].OnLevelLoaded:Add(r0_17, function()
        -- line: [680, 682] id: 18
        r0_17:OnArtLevelLoaded(r6_17)
      end)
      -- close: r6_17
    end
  end
  r0_17:LoadArtLevel(r0_17.enterLevelID)
  if r0_17.CapturePathLevel then
    for r6_17, r7_17 in pairs(r0_17.CapturePathLevel) do
      r0_17:LoadArtLevel(r7_17)
    end
    -- close: r2_17
  else
    r0_17:SetLoadProgress(r0_17.loadProgress + 0.125)
  end
  r0_17:SetForceGCAfterLevelStreamedOut(false)
  if not r0_17.showAllLevel and not URuntimeCommonFunctionLibrary.IsWorldCompositionEnabled(r0_17) then
    r0_17.levelLoadComplete = true
    r0_17:NextStep()
  end
  if not IsDedicatedServer(r0_17) then
    local r2_17 = UIManager(r0_17):GetUI("BattleMain")
    if r2_17 and r2_17.Battle_Map then
      r2_17.Battle_Map.LastPlayerLevelNum = 0
    end
  end
  -- warn: not visited block [41]
  -- block#41:
  -- r0_17.levelLoadComplete = true
  -- r0_17:NextStep()
  -- goto label_248
end
function r0_0.SetEnterLevelID(r0_19, r1_19)
  -- line: [720, 746] id: 19
  local r2_19 = r0_19:GetLevelIdByLocation(r1_19)
  if r1_19 and r2_19 ~= "" then
    r0_19.enterLevelID = r2_19
    for r7_19, r8_19 in pairs(r0_19.Doors) do
      if (r8_19.LevelId == r2_19 or r8_19.OtherLevelId == r2_19) and r8_19.if_door and r8_19.door_state and r8_19.OtherLevelId ~= "-1" and UKismetMathLibrary.IsPointInBoxWithTransform(r1_19, r8_19.LevelUnloadBox:K2_GetComponentToWorld(), r8_19.LevelUnloadBox:GetUnscaledBoxExtent()) then
        r0_19.enterNextLevelID = r8_19.OtherLevelId
        if r8_19.OtherLevelId == r2_19 then
          r0_19.enterNextLevelID = r8_19.LevelId
          break
        else
          break
        end
      end
    end
    -- close: r3_19
  elseif r1_19 then
    for r7_19, r8_19 in pairs(r0_19.Doors) do
      if r8_19.if_door and r8_19.door_state and r8_19.OtherLevelId ~= "-1" and UKismetMathLibrary.IsPointInBoxWithTransform(r1_19, r8_19.LevelUnloadBox:K2_GetComponentToWorld(), r8_19.LevelUnloadBox:GetUnscaledBoxExtent()) then
        r0_19.enterLevelID = r8_19.LevelId
        r0_19.enterNextLevelID = r8_19.OtherLevelId
        break
      end
    end
    -- close: r3_19
  end
end
function r0_0.OnLevelLoadComplete(r0_20)
  -- line: [748, 759] id: 20
  for r5_20, r6_20 in ipairs(r0_20.loadCompleteCallback) do
    r6_20()
  end
  -- close: r1_20
  r0_20.Overridden.OnLevelLoadComplete(r0_20)
end
function r0_0.BindLoadCompleteCallback(r0_21, r1_21)
  -- line: [762, 764] id: 21
  r0_21.loadCompleteCallback[#r0_21.loadCompleteCallback + 1] = r1_21
end
function r0_0.NextStep(r0_22)
  -- line: [766, 788] id: 22
  if r0_22.startPoint == nil then
    r0_22:GetRandStartPoint()
  end
  if r0_22.volumeArray == nil or r0_22.volumeArray:Length() < r0_22.numOfLevels then
    r0_22:GetAllLevelVolume()
  end
  if r0_22.startPoint == nil or UE4.URuntimeCommonFunctionLibrary.IsActorInitialized(r0_22.startPoint) == false or r0_22.volumeArray == nil or r0_22.volumeArray:Length() < r0_22.numOfLevels then
    UE4.UKismetSystemLibrary.K2_SetTimerDelegate({
      r0_22,
      r0_0.NextStep
    }, 0.1, false)
    return 
  elseif r0_22.levelLoadComplete then
    r0_22:LevelLoaderReady()
    r0_22:OnLevelLoadComplete()
  else
    r0_22:OnPreloadComplete()
  end
end
function r0_0.SetPlayerTrans(r0_23)
  -- line: [790, 805] id: 23
  local r1_23 = UGameplayStatics.GetGameMode(r0_23)
  if IsStandAlone(r0_23) and r1_23 and r1_23:NeedProgressRecover() then
    local r2_23 = UE4.UGameplayStatics.GetPlayerController(r0_23, 0)
    local r3_23 = r2_23:GetMyPawn()
    r3_23:K2_SetActorLocation(r0_23.ProgressLoc, false, nil, true)
    r3_23:K2_SetActorRotation(r0_23.ProgressRot, false)
    r3_23:SetStartLevelId()
    r2_23:SetControlRotation(r0_23.ProgressRot)
  else
    if r0_23.startPoint == nil then
      r0_23:GetRandStartPoint()
    end
    r0_23.startPoint:InitSetPlayerTrans()
  end
end
function r0_0.SetEnteredPlayerTrans(r0_24, r1_24)
  -- line: [807, 812] id: 24
  if r0_24.startPoint == nil then
    r0_24:GetRandStartPoint()
  end
  r0_24.startPoint:SetEnteredPlayerTrans(r1_24)
end
function r0_0.SetInitTrans(r0_25, r1_25)
  -- line: [814, 821] id: 25
  if r0_25.startPoint == nil then
    r0_25:GetRandStartPoint()
  end
  if r0_25.startPoint then
    r0_25.startPoint:SetInitTrans(r1_25)
  end
end
function r0_0.RealSetNewEnteredPlayerTrans(r0_26, r1_26)
  -- line: [823, 828] id: 26
  if r0_26.startPoint == nil then
    r0_26:GetRandStartPoint()
  end
  r0_26.startPoint:RealSetNewEnteredPlayerTrans(r1_26)
end
function r0_0.GetRandStartPoint(r0_27)
  -- line: [830, 857] id: 27
  if r0_27.startPoint then
    return 
  end
  local function r1_27()
    -- line: [834, 842] id: 28
    for r4_28, r5_28 in pairs(r0_27.StartPoints) do
      if r0_27.enterLevelID and (r0_27:GetGamePlayActorLevelName(r5_28) == r0_27.enterLevelID or r0_27:GetDesignActorLevelName(r5_28) == r0_27.enterLevelID) then
        r0_27.startPoint = r5_28
        DebugPrint("NewLevelLoader", "GetRandStartPoint EnterLevel", r0_27.enterLevelID, r0_27:GetGamePlayActorLevelName(r5_28), r0_27:GetDesignActorLevelName(r5_28))
        break
      end
    end
    -- close: r0_28
  end
  if #r0_27.StartPoints == 0 then
    r0_27.StartPoints = UGameplayStatics.GetAllActorsOfClass(r0_27, LoadClass("/Game/BluePrints/Common/Level/BP_StartPoint.BP_StartPoint_C")):ToTable()
  end
  r1_27()
  if not r0_27.startPoint then
    r0_27.StartPoints = UGameplayStatics.GetAllActorsOfClass(r0_27, LoadClass("/Game/BluePrints/Common/Level/BP_StartPoint.BP_StartPoint_C")):ToTable()
  else
    return 
  end
  r1_27()
  if not r0_27.startPoint and #r0_27.StartPoints > 0 then
    r0_27.startPoint = r0_27.StartPoints[1]
    DebugPrint("NewLevelLoader", "GetRandStartPoint Random")
  end
end
function r0_0.GetGamePlayActorLevelName(r0_29, r1_29)
  -- line: [859, 867] id: 29
  local r2_29 = UE4.URuntimeCommonFunctionLibrary.GetLevel(r1_29)
  for r7_29, r8_29 in pairs(r0_29.homeStreamingLevel2ID) do
    if r7_29:GetLoadedLevel() == r2_29 then
      return r8_29
    end
  end
  -- close: r3_29
  return nil
end
function r0_0.GetLayoutStreamingLevels(r0_30, r1_30)
  -- line: [872, 874] id: 30
  return r0_30.layoutStreamingLevels[r1_30]
end
function r0_0.SetNeedLoadLevelState(r0_31, r1_31)
  -- line: [876, 879] id: 31
  DebugPrint("Level Check, Set Need Load Level State. ID:" .. r1_31)
end
function r0_0.LoadArtLevel(r0_32, r1_32, r2_32, r3_32)
  -- line: [881, 957] id: 32
  if r2_32 == nil and r3_32 == nil then
    r2_32 = true
    r3_32 = false
  end
  if URuntimeCommonFunctionLibrary.ShouldBlockOnAllStreamingLevel() then
    r3_32 = true
  end
  if URuntimeCommonFunctionLibrary.IsWorldCompositionEnabled(r0_32) then
    r0_32:OnArtLevelLoadedCallback(r1_32)
    return 
  end
  if r0_32.showAllLevel then
    DebugPrint("Server Load", r1_32)
    r0_32:OnArtLevelLoadedCallback(r1_32)
    return 
  end
  local r4_32 = r0_32:GetWorldStreamingLevelsPrefix()
  local r5_32 = IsClient(r0_32) and URuntimeCommonFunctionLibrary.IsPlayInEditor(r0_32) and r4_32 == ""
  if r5_32 and UAsyncFunctionLibrary.CheckStreamLevelBeLoadState(r0_32, "UEDPIE_0_" .. r1_32 .. "_Art", true) then
    DebugPrint("CheckStreamLevelBeLoadState Failed:" .. r1_32)
    return 
  elseif UAsyncFunctionLibrary.CheckStreamLevelBeLoadState(r0_32, r1_32 .. "_Art", true) then
    DebugPrint("CheckStreamLevelBeLoadState Failed:" .. r1_32)
    return 
  end
  if r5_32 then
    r0_32:LoadStreamLevelWithID("UEDPIE_0_" .. r1_32 .. "_Art", r1_32 + 1, r2_32, r3_32)
    if r0_32.IsPC then
      r0_32:LoadStreamLevelWithID("UEDPIE_0_" .. r1_32 .. "_Art_PC", (r1_32 + 1) * 1000, r2_32, r3_32)
    end
  else
    r0_32:LoadStreamLevelWithID(r1_32 .. "_Art", r1_32 + 1, r2_32, r3_32)
    if r0_32.IsPC then
      r0_32:LoadStreamLevelWithID(r1_32 .. "_Art_PC", (r1_32 + 1) * 1000, r2_32, r3_32)
    end
  end
  if r0_32.layoutStreamingLevels[r1_32] then
    if r5_32 then
      r0_32:LoadStreamLevelWithID("UEDPIE_0_" .. r1_32 .. "_Layout", (r1_32 + 1) * 1000 + 1, r2_32, r3_32)
    else
      r0_32:LoadStreamLevelWithID(r1_32 .. "_Layout", (r1_32 + 1) * 1000 + 1, r2_32, r3_32)
    end
  end
  if r0_32.soundStreamingLevels[r1_32] then
    if r5_32 then
      r0_32:LoadStreamLevelWithID("UEDPIE_0_" .. r1_32 .. "_Sound", (r1_32 + 1) * 1000 + 2, r2_32, r3_32)
    else
      r0_32:LoadStreamLevelWithID(r1_32 .. "_Sound", (r1_32 + 1) * 1000 + 2, r2_32, r3_32)
    end
  end
  if r0_32.effectStreamingLevels[r1_32] then
    if r5_32 then
      r0_32:LoadStreamLevelWithID("UEDPIE_0_" .. r1_32 .. "_Effect", (r1_32 + 1) * 1000 + 3, r2_32, r3_32)
    else
      r0_32:LoadStreamLevelWithID(r1_32 .. "_Effect", (r1_32 + 1) * 1000 + 3, r2_32, r3_32)
    end
  end
  DebugPrint("NewLevelLoader", "Load", r1_32)
end
function r0_0.UnloadArtLevel(r0_33, r1_33)
  -- line: [958, 1031] id: 33
  if r0_33.showAllLevel and not r0_33.DungeonShowAllLevel or URuntimeCommonFunctionLibrary.IsWorldCompositionEnabled(r0_33) then
    DebugPrint("Server Unload", r1_33)
    r0_33:BeforeLevelUnloadedCallback(r1_33)
    r0_33:OnArtLevelUnloadedCallback(r1_33)
    return 
  end
  if r0_33.DungeonShowAllLevel then
    return 
  end
  for r5_33 = 1, r0_33.numOfLevels, 1 do
    if r0_33.ID2ArtStreamingLevel[r1_33] == r0_33.artStreamingLevels[r5_33] then
      if r0_33.artStreamingLevels[r5_33] == false then
        return 
      end
      r0_33.ArtLevelLoaded:Add(r1_33, false)
      DebugPrint("Level Check, artLevelLoaded state false:" .. r1_33)
      EventManager:FireEvent(EventID.OnArtLevelLoadedStateChange, r1_33, false)
    end
  end
  r0_33:BeforeLevelUnloadedCallback(r1_33)
  DebugPrint("NewLevelLoader", "Unload", r1_33)
  if not r0_33.showAllLevel then
    local r2_33 = r0_33:GetWorldStreamingLevelsPrefix()
    local r3_33 = IsClient(r0_33) and URuntimeCommonFunctionLibrary.IsPlayInEditor(r0_33) and r2_33 == ""
    if r3_33 then
      r0_33:UnloadStreamLevel("UEDPIE_0_" .. r1_33 .. "_Art", (r1_33 + 1) * 1000 + 10)
      if r0_33.IsPC then
        r0_33:UnloadStreamLevel("UEDPIE_0_" .. r1_33 .. "_Art_PC", (r1_33 + 1) * 1000 + 11)
      end
    else
      r0_33:UnloadStreamLevel(r1_33 .. "_Art", (r1_33 + 1) * 1000 + 10)
      if r0_33.IsPC then
        r0_33:UnloadStreamLevel(r1_33 .. "_Art_PC", (r1_33 + 1) * 1000 + 11)
      end
    end
    if r0_33.layoutStreamingLevels[r1_33] then
      if r3_33 then
        r0_33:UnloadStreamLevel("UEDPIE_0_" .. r1_33 .. "_Layout", (r1_33 + 1) * 1000 + 12)
      else
        r0_33:UnloadStreamLevel(r1_33 .. "_Layout", (r1_33 + 1) * 1000 + 12)
      end
    end
    if r0_33.soundStreamingLevels[r1_33] then
      if r3_33 then
        r0_33:UnloadStreamLevel("UEDPIE_0_" .. r1_33 .. "_Sound", (r1_33 + 1) * 1000 + 13)
      else
        r0_33:UnloadStreamLevel(r1_33 .. "_Sound", (r1_33 + 1) * 1000 + 13)
      end
    end
    if r0_33.effectStreamingLevels[r1_33] then
      if r3_33 then
        r0_33:UnloadStreamLevel("UEDPIE_0_" .. r1_33 .. "_Effect", (r1_33 + 1) * 1000 + 14)
      else
        r0_33:UnloadStreamLevel(r1_33 .. "_Effect", (r1_33 + 1) * 1000 + 14)
      end
    end
  end
  r0_33:OnArtLevelUnloadedCallback(r1_33)
  if r0_33.CoroutineTable[r1_33] then
    coroutine.close(r0_33.CoroutineTable[r1_33])
    r0_33.CoroutineTable[r1_33] = nil
  end
  if r0_33.LevelLoadQueue[1] == r1_33 then
    r0_33:LoadNextArtLevel()
  end
end
function r0_0.OnHomeLevelLoadedCallback(r0_34, r1_34)
  -- line: [1033, 1048] id: 34
  local r2_34 = UE4.UGameplayStatics.GetGameMode(r0_34)
  if r2_34 == nil then
    return 
  end
  local r3_34 = UE4.UGameplayStatics.GetStreamingLevel(r0_34, r1_34)
  if r3_34 == nil then
    return 
  end
  local r4_34 = r3_34:GetLoadedLevel()
  if r4_34 == nil then
    return 
  end
  r2_34:AddSubGameModeInfo(r1_34, r4_34)
end
function r0_0.SetLevelDoor(r0_35, r1_35)
  -- line: [1050, 1090] id: 35
  r0_35.Doors[#r0_35.Doors + 1] = r1_35
  if r0_35.DoorClass then
    r1_35.DoorClass = r0_35.DoorClass
  end
  local r2_35 = UE4.URuntimeCommonFunctionLibrary.GetLevel(r1_35)
  for r6_35 = 1, r0_35.numOfLevels, 1 do
    if r0_35.designStreamingLevels[r6_35] and r0_35.designStreamingLevels[r6_35]:GetLoadedLevel() == r2_35 then
      local r7_35 = r0_35.designStreamLevel2DoorData[r0_35.designStreamingLevels[r6_35]].door
      if r7_35 ~= nil then
        for r11_35 = 1, #r7_35, 1 do
          if r7_35[r11_35].door_name == r1_35.DisplayName then
            r1_35.if_door = r7_35[r11_35].if_door == 1
            r1_35.door_state = r7_35[r11_35].door_state == 1
            r1_35.LevelPathfinding = r0_35.LevelPathfinding
            r1_35.LevelId = tostring(r0_35.designStreamLevel2DoorData[r0_35.designStreamingLevels[r6_35]].id)
            r1_35.OtherLevelId = tostring(r7_35[r11_35].next_id)
            r0_35.LevelPathfinding.Name2BpArrowPos:Add(r1_35.LevelId .. r7_35[r11_35].door_name, r1_35)
            DebugPrint("SetLevelDoor", r1_35.LevelId, r1_35.OtherLevelId, r1_35.if_door, r1_35.door_state)
            if r0_35.LevelId2Doors[r1_35.LevelId] then
              table.insert(r0_35.LevelId2Doors[r1_35.LevelId], r1_35)
            else
              r0_35.LevelId2Doors[r1_35.LevelId] = {
                r1_35
              }
            end
          end
        end
      end
    end
  end
  if r1_35.if_door and not IsDedicatedServer(r0_35) then
    local r3_35 = UIManager(r0_35):GetUI("BattleMain")
    if r3_35 then
      r3_35.Battle_Map:AddDoorToMinimap(r1_35)
    else
      GWorld.GameInstance:GetSceneManager():AddMinimapDoor(r1_35)
    end
  end
end
function r0_0.StartPathfindingToActorByEid(r0_36, r1_36)
  -- line: [1092, 1149] id: 36
  local r2_36 = Battle(r0_36)
  if r2_36 == nil or not r0_36.levelLoadComplete then
    local r4_36, r5_36 = UE4.UGameplayStatics.GetGameInstance(r0_36):GetSceneManager():GetCurSceneGuideEntityByEid(r1_36)
    r0_36.CacheEids[r1_36] = r4_36 and nil
    if not r0_36:IsExistTimer("BattleWaitHandle") then
      r0_36:AddTimer(0.1, function()
        -- line: [1100, 1109] id: 37
        if Battle(r0_36) and r0_36.levelLoadComplete then
          for r5_37, r6_37 in pairs(r0_36.CacheEids) do
            r0_36:StartPathfindingToActorByEid(r5_37)
          end
          -- close: r1_37
          r0_36.CacheEids = {}
          r0_36:RemoveTimer("BattleWaitHandle")
        end
      end, true, 0, "BattleWaitHandle")
    end
    return 
  end
  local r3_36 = r2_36:GetEntity(r1_36)
  local r4_36 = nil
  if r3_36 then
    if r3_36.CurrentLevelId and r3_36.CurrentLevelId:Num() ~= 0 then
      return r0_36.LevelPathfinding:UpdatePathfindingByEid(r1_36, r3_36.CurrentLevelId)
    else
      r4_36 = r3_36:K2_GetActorLocation()
    end
  else
    local r5_36 = UE4.UGameplayStatics.GetGameInstance(r0_36):GetSceneManager()
    local r7_36 = r0_36.CacheEids[r1_36]
    if r5_36.CurSceneGuideEids[r1_36] then
      local r8_36, r9_36 = r5_36:GetCurSceneGuideEntityByEid(r1_36)
      if not r7_36 then
        r7_36 = r8_36
      end
    end
    if r7_36 then
      if r7_36.UnitType == "Monster" and r7_36.CurrentLevelId and r7_36.CurrentLevelId:Length() > 0 then
        return r0_36.LevelPathfinding:UpdatePathfindingByEid(r1_36, r7_36.CurrentLevelId)
      elseif r7_36.Loc then
        r4_36 = r7_36.Loc
      else
        r4_36 = r7_36:K2_GetActorLocation()
      end
    else
      return false
    end
  end
  for r9_36, r10_36 in pairs(r0_36.homeLevel2ID) do
    if r0_36:CheckLocationInGridframeByLevelId(r10_36, r4_36) then
      local r11_36 = TArray("")
      r11_36:Add(r10_36)
      return r0_36.LevelPathfinding:UpdatePathfindingByEid(r1_36, r11_36)
    end
  end
  -- close: r5_36
  return false
end
function r0_0.StopPathfindingToActorByEid(r0_38, r1_38)
  -- line: [1151, 1153] id: 38
  r0_38.LevelPathfinding:StopPathfinding(r1_38)
end
function r0_0.CheckIsTwoActorInSameLevelId(r0_39, r1_39, r2_39)
  -- line: [1155, 1168] id: 39
  if not UE4.UKismetSystemLibrary.IsValid(r1_39) or not UE4.UKismetSystemLibrary.IsValid(r2_39) then
    return false
  end
  local r3_39 = r1_39:K2_GetActorLocation()
  local r4_39 = r2_39:K2_GetActorLocation()
  for r9_39, r10_39 in pairs(r0_39.homeLevel2ID) do
    if r0_39:CheckLocationInGridframeByLevelId(r10_39, r3_39) and r0_39:CheckLocationInGridframeByLevelId(r10_39, r4_39) then
      return true
    end
  end
  -- close: r5_39
  return false
end
function r0_0.MultiLevelTrans(r0_40, r1_40, r2_40)
  -- line: [1170, 1177] id: 40
  local r3_40 = UE4.URuntimeCommonFunctionLibrary.GetLevel(r1_40)
  for r8_40, r9_40 in pairs(r0_40.artStreamingLevel2ID) do
    if r8_40:GetLoadedLevel() == r3_40 then
      return r2_40 * r8_40.LevelTransform
    end
  end
  -- close: r4_40
end
function r0_0.CreateNavLinkProxy(r0_41)
  -- line: [1238, 1242] id: 41
  for r5_41, r6_41 in pairs(r0_41.Doors) do
    r0_41:CreateNavLinkProxyCPP(FTransform(r6_41:K2_GetActorRotation():ToQuat(), r6_41:K2_GetActorLocation()), r6_41.LevelId, r6_41.OtherLevelId)
  end
  -- close: r1_41
end
function r0_0.LoadCapturePathLevel(r0_42, r1_42)
  -- line: [1244, 1255] id: 42
  if r0_42.CapturePathLevel or not Utils.IsAuthority(r0_42) or r0_42.levelLoadComplete then
    return 
  end
  r0_42.CapturePathLevel = {}
  for r6_42, r7_42 in pairs(r1_42) do
    if r0_42.ID2ArtStreamingLevel[r7_42] then
      r0_42.CapturePathLevel[#r0_42.CapturePathLevel + 1] = r7_42
    end
  end
  -- close: r2_42
end
function r0_0.IsCapturePathLevel(r0_43, r1_43)
  -- line: [1257, 1267] id: 43
  if not r0_43.CapturePathLevel then
    return false
  end
  for r6_43, r7_43 in pairs(r0_43.CapturePathLevel) do
    if r7_43 == r1_43 then
      return true
    end
  end
  -- close: r2_43
  return false
end
function r0_0.RecoverArtLevelBreakable(r0_44)
  -- line: [1270, 1303] id: 44
  local r1_44 = UKismetSystemLibrary.GetProjectSavedDirectory() .. "Breakable/"
  for r6_44, r7_44 in pairs(r0_44.levelName2Id) do
    local r10_44 = Split(UE4.URuntimeCommonFunctionLibrary.LoadFile(r1_44 .. r6_44 .. ".txt"), "/n")
    local r11_44 = r0_44.ID2ArtStreamingLevel[r7_44].LevelTransform
    for r16_44, r17_44 in pairs(r10_44) do
      if not r17_44 or string.len(r17_44) == 0 then
        DebugPrint("ZJT_ not BreakableInfo or string.len(BreakableInfo) == 0  ")
      else
        local r18_44 = Split(r17_44, ":")
        local r19_44 = r18_44[1]
        local r20_44 = Split(r18_44[2], ";")
        local r21_44 = Split(r20_44[1], ",")
        local r22_44 = Split(r20_44[2], ",")
        local r23_44 = Split(r20_44[3], ",")
        local r25_44 = FVector(tonumber(r21_44[1]), tonumber(r21_44[2]), tonumber(r21_44[3]))
        local r26_44 = r11_44.Rotation:ToRotator().Yaw
        local r27_44 = UKismetMathLibrary.GreaterGreater_VectorRotator(r25_44, r11_44.Rotation:ToRotator())
        local r28_44 = FRotator(tonumber(r22_44[1]), tonumber(r22_44[2]), tonumber(r22_44[3]))
        local r29_44 = FVector(tonumber(r23_44[1]), tonumber(r23_44[2]), tonumber(r23_44[3]))
        local r31_44 = r0_44:GetWorld():SpawnActor(LoadClass(r20_44[4]), UE4.UKismetMathLibrary.MakeTransform(r27_44 + r11_44.Translation, r28_44 + r11_44.Rotation:ToRotator(), UE4.FVector(1, 1, 1)), UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn, nil, nil, nil)
      end
    end
    -- close: r12_44
  end
  -- close: r2_44
end
function r0_0.GetNextLevelIsLoaded(r0_45, r1_45, r2_45)
  -- line: [1305, 1327] id: 45
  local r3_45 = r1_45.CurrentLevelId
  if not r3_45 then
    r3_45 = TArray("")
    local r4_45 = r0_45:GetLevelIdByLocation(r2_45)
    if not r4_45 then
      return FVector(0, 0, 0), false
    end
    r3_45:Add(r4_45)
  end
  local r4_45 = r0_45:GetLevelIdByLocation(r2_45)
  if not r4_45 then
    return FVector(0, 0, 0), false
  end
  local r5_45 = TArray("")
  r5_45:Add(r4_45)
  local r6_45, r7_45, r8_45, r9_45 = r0_45.LevelPathfinding:FindDoorByLevelId(r3_45, r5_45)
  if not r9_45 then
    return FVector(0, 0, 0), false
  end
  return r0_45.LevelPathfinding.Name2BpArrowPos:FindRef(r6_45):K2_GetActorLocation(), r0_45:GetLevelLoaded(r8_45)
end
function r0_0.SetLoadProgress(r0_46, r1_46)
  -- line: [1329, 1338] id: 46
  if not r1_46 or r1_46 <= 0 then
    return 
  end
  r0_46.loadProgress = r1_46
  if r0_46.LoadingUI then
    DebugPrint("SetLoadProgress CloseLoading", r0_46.loadProgress * 0.5 * 100)
    r0_46.LoadingUI:AddQuene(r0_46.loadProgress * 0.5 * 100)
  end
end
function r0_0.GetLoadProgress(r0_47)
  -- line: [1340, 1342] id: 47
  return r0_47.loadProgress
end
function r0_0.GetFirstArrowByLevelId(r0_48, r1_48)
  -- line: [1344, 1346] id: 48
  local r2_48 = r0_48.LevelId2Doors[r1_48]
  if r2_48 then
    r2_48 = r0_48.LevelId2Doors[r1_48][1] and nil
  else
    goto label_9	-- block#2 is visited secondly
  end
  return r2_48
end
function r0_0.OnElevatorMechanismCompleteNotify(r0_49)
  -- line: [1348, 1354] id: 49
  if IsDedicatedServer(r0_49) then
    return 
  end
  r0_49.LevelPathfinding:UpdateAllPathfinding(UGameplayStatics.GetPlayerCharacter(r0_49, 0).CurrentLevelId)
end
function r0_0.GetArtPathByLevelId(r0_50, r1_50)
  -- line: [1356, 1367] id: 50
  for r5_50 = 1, r0_50.numOfLevels, 1 do
    local r6_50 = r0_50.points[r5_50]
    if tostring(r6_50.id) == r1_50 then
      return r6_50.art_path and string.gsub(r6_50.struct, "Data_Design", "Data_Art") .. "_Art"
    end
  end
end
function r0_0.K2_GetArtPathByLevelId(r0_51, r1_51)
  -- line: [1369, 1382] id: 51
  for r5_51 = 1, r0_51.numOfLevels, 1 do
    local r6_51 = r0_51.points[r5_51]
    if tostring(r6_51.id) == r1_51 then
      local r7_51 = r6_51.art_path and string.gsub(r6_51.struct, "Data_Design", "Data_Art") .. "_Art"
      local r8_51 = r0_51.id2LevelLocationAndRotation[r1_51]
      PrintTable(r0_51.id2LevelLocationAndRotation, 10)
      return r7_51, r8_51[2], r8_51[3]
    end
  end
end
function r0_0.GetArtLevelByLevelId(r0_52, r1_52)
  -- line: [1410, 1415] id: 52
  if r0_52.ID2ArtStreamingLevel[r1_52] then
    return r0_52.ID2ArtStreamingLevel[r1_52]:GetLoadedLevel()
  end
  return nil
end
function r0_0.GetExitLevelLocation(r0_53)
  -- line: [1417, 1422] id: 53
  if r0_53.exitLevelID ~= -1 and r0_53.id2LevelLocationAndRotation[r0_53.exitLevelID] then
    return r0_53.id2LevelLocationAndRotation[r0_53.exitLevelID][2]
  end
  return nil
end
return r0_0
