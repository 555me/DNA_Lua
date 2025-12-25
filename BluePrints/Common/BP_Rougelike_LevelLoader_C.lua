-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Common\BP_Rougelike_LevelLoader_C.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = Class({
  "BluePrints/Common/EMLevelLoader",
  "BluePrints.Common.TimerMgr"
})
function r0_0.ReceiveBeginPlay(r0_1)
  -- line: [19, 74] id: 1
  r0_1.Overridden.ReceiveBeginPlay(r0_1)
  r0_1:BeginPlay()
  r0_1.LoadingComplete = false
  r0_1.RoomData = DataMgr.RougeLikeRoom
  r0_1.SeasonId = 0
  r0_1.CurrentRoomId = nil
  r0_1.LastRoomId = nil
  r0_1.NextRoomId = TArray(0)
  r0_1.StepId = 0
  r0_1.RoomId2StreamLevel = {}
  r0_1.StreamLevelNavMeshCheck = {}
  r0_1.ID2DesignStreamingLevel = {}
  r0_1.LoadingFlag = false
  r0_1.NextRoomReady = false
  r0_1.LevelSpacing = 100000
  r0_1.IsMobile = CommonUtils.GetDeviceTypeByPlatformName(r0_1) == "Mobile"
  if not IsDedicatedServer(r0_1) then
    r0_1.LoadingUI = UE4.UGameplayStatics.GetGameInstance(r0_1):ShowLoadingUI(UIConst.COMMONCHANGESCENE)
  end
  r0_1.RenderTexture = UKismetRenderingLibrary.CreateRenderTarget2D(r0_1)
  local r1_1 = UWidgetLayoutLibrary.GetViewportSize(r0_1)
  URuntimeCommonFunctionLibrary.RenderTarget2DResize(r0_1.RenderTexture, r1_1.X, r1_1.Y)
  r0_1.RenderTexture.RenderTargetFormat = ETextureRenderTargetFormat.RTF_RGBA8_SRGB
  r0_1.RenderTexture.LODGroup = 28
  DebugPrint("RenderTarget2DResize", r0_1.RenderTexture.SizeX, r0_1.RenderTexture.SizeY)
  local r2_1 = UGameplayStatics.GetPlayerCharacter(r0_1, 0)
  r0_1.SceneCaptureComponent = NewObject(USceneCaptureComponent2D, r2_1)
  r0_1.SceneCaptureComponent:K2_AttachToComponent(r2_1.CharCameraComponent)
  r0_1.SceneCaptureComponent:K2_SetRelativeTransform(FTransform(), false, nil, false)
  URuntimeCommonFunctionLibrary.RegisterComponent(r0_1.SceneCaptureComponent)
  r0_1.SceneCaptureComponent.FOVAngle = r2_1.CharCameraComponent.FieldOfView
  r0_1.SceneCaptureComponent.TextureTarget = r0_1.RenderTexture
  r0_1.SceneCaptureComponent.CaptureSource = ESceneCaptureSource.SCS_FinalColorHDR
  r0_1.SceneCaptureComponent:SetComponentTickEnabled(false)
  r0_1.SceneCaptureComponent.bCaptureEveryFrame = false
  r0_1.SceneCaptureComponent.bCaptureOnMovement = false
  EventManager:AddEvent(EventID.OnRougeLikeEnterRoom, r0_1, r0_1.OnRougeLikeEnterRoom)
  GWorld.RougelikeLevelLoader = r0_1
end
function r0_0.TestTimer(r0_2)
  -- line: [76, 80] id: 2
  local r1_2 = math.random(1, 3)
  local r2_2 = {
    102,
    301,
    302
  }
  r0_2:EnterRoom(r2_2[r1_2], r2_2)
end
function r0_0.ReceiveEndPlay(r0_3, r1_3)
  -- line: [82, 92] id: 3
  EventManager:RemoveEvent(EventID.OnRougeLikeEnterRoom, r0_3)
  if r0_3.SceneCaptureComponent then
    r0_3.SceneCaptureComponent:K2_DestroyComponent(r0_3.SceneCaptureComponent)
    r0_3.SceneCaptureComponent = nil
  end
  UKismetRenderingLibrary.ReleaseRenderTarget2D(r0_3.RenderTexture)
  r0_3.RenderTexture = nil
end
function r0_0.InitSettings(r0_4)
  -- line: [106, 110] id: 4
  DebugPrint("LevelLoaderInitSettings RougeLike")
  local r1_4 = GWorld.GameInstance
  URuntimeCommonFunctionLibrary.SetConsoleVariableIntValue("r.Mobile.EnableReadSurface", 0, 1)
end
function r0_0.EnterRoom(r0_5, r1_5, r2_5)
  -- line: [112, 136] id: 5
  r0_5.LastRoomId = r0_5.CurrentRoomId
  r0_5.CurrentRoomId = r1_5
  r0_5:AddBuildingLock()
  if not r0_5.LoadingComplete then
    r0_5:LoadStreamLevelByRoomId(r0_5.CurrentRoomId, 0)
  else
    local r3_5 = DataMgr.RougeLikeRoom[r0_5.CurrentRoomId].RoomType == 5
    if r3_5 then
      UIManager(r0_5):LoadUINew("RougeTransitionBoss", r0_5.SceneCaptureComponent, r0_5.RenderTexture, r3_5)
    else
      UIManager(r0_5):LoadUINew("RougeTransition", r0_5.SceneCaptureComponent, r0_5.RenderTexture, r3_5)
    end
    coroutine.resume(coroutine.create(r0_5.LoadNavMeshLevel), r0_5, r1_5)
    r0_5:AddTimer(0.1, function()
      -- line: [127, 131] id: 6
      r0_5:SetPlayerTrans()
      r0_5.StepId = r0_5.StepId + 1
      coroutine.resume(coroutine.create(r0_5.LoadNextLevel), r0_5, r2_5)
    end)
    return 
  end
  r0_5.StepId = r0_5.StepId + 1
  coroutine.resume(coroutine.create(r0_5.LoadNextLevel), r0_5, r2_5)
end
function r0_0.LoadNavMeshLevel(r0_7, r1_7)
  -- line: [138, 141] id: 7
  UKismetSystemLibrary.Delay(r0_7, 1.5)
  UGameplayStatics.LoadStreamLevel(r0_7, r0_7.StepId + -1 .. "-" .. r1_7 .. "_NavMesh", false, false)
end
function r0_0.LoadNextLevel(r0_8, r1_8)
  -- line: [143, 180] id: 8
  r0_8.NextRoomReady = false
  while not r0_8.LoadingComplete do
    UKismetSystemLibrary.Delay(r0_8, 0.1)
  end
  local r2_8 = GWorld.RougeLikeManager
  if r0_8.LastRoomId then
    r2_8:OnUnLoadLastLevel(r0_8.LastRoomId, r0_8.CurrentRoomId)
    coroutine.resume(coroutine.create(r0_8.UnloadStreamLevelByRoomId), r0_8, r0_8.LastRoomId, r0_8.StepId + -2)
    r0_8.LastRoomId = nil
    UKismetSystemLibrary.Delay(r0_8, 0.5)
  end
  if r0_8.NextRoomId:Length() > 0 then
    for r6_8 = 1, r0_8.NextRoomId:Length(), 1 do
      local r7_8 = r0_8.NextRoomId[r6_8]
      if r7_8 ~= r0_8.CurrentRoomId then
        r2_8:OnUnLoadOtherLevel(r7_8)
        coroutine.resume(coroutine.create(r0_8.UnloadStreamLevelByRoomId), r0_8, r7_8, r0_8.StepId + -1)
        UKismetSystemLibrary.Delay(r0_8, 0.5)
      end
    end
  end
  if r1_8 then
    for r6_8 = 1, r1_8:Length(), 1 do
      r0_8:LoadStreamLevelByRoomId(r1_8[r6_8], r6_8)
      while r0_8.LoadingFlag do
        UKismetSystemLibrary.Delay(r0_8, 0.1)
      end
    end
  end
  r0_8.NextRoomId:Clear()
  r0_8.NextRoomId:Append(r1_8)
  r0_8.NextRoomReady = true
  r0_8:ReleaseInitialBuildingLock()
  r0_8:PrintRougeLikeLevelLoader("ReleaseBuildingLock")
end
function r0_0.OnArtLevelLoaded(r0_9, r1_9)
  -- line: [182, 187] id: 9
  if r0_9.LoadingComplete then
    r0_9:DisableLevelRVTVolume(r0_9.RoomId2StreamLevel[r1_9][3])
  end
  coroutine.resume(coroutine.create(r0_9.CheckLevelLoaded), r0_9, r1_9)
end
function r0_0.CheckLevelLoaded(r0_10, r1_10)
  -- line: [189, 229] id: 10
  r0_10:PrintRougeLikeLevelLoader("CheckLevelLoaded:" .. r1_10)
  if not r0_10.LoadingComplete then
    r0_10.LoadingUI:AddQuene(45)
  end
  while true do
    local r2_10 = true
    for r6_10 = 1, #r0_10.RoomId2StreamLevel[r1_10], 1 do
      local r7_10 = r0_10.RoomId2StreamLevel[r1_10][r6_10]
      if r7_10 and r6_10 ~= 2 and r6_10 <= 3 and (not r7_10:GetLoadedLevel() or not r7_10:GetLoadedLevel().bIsVisible) then
        r2_10 = false
        break
      elseif r6_10 > 3 and #r7_10 > 0 and (not r7_10[1]:GetLoadedLevel() or not r7_10[1]:GetLoadedLevel().bIsVisible) then
        r2_10 = false
        break
      end
    end
    if r2_10 then
      local r6_10 = r1_10
      r0_10:PrintRougeLikeLevelLoader("check complete:" .. r6_10)
      break
    else
      UKismetSystemLibrary.Delay(r0_10, 0.1)
    end
  end
  if not r0_10.LoadingComplete then
    r0_10.LoadingUI:AddQuene(90)
    r0_10:SetForceGCAfterLevelStreamedOut(false)
    r0_10:LevelLoaderReady()
    r0_10.LoadingComplete = true
  end
  r0_10.LoadingFlag = false
end
function r0_0.OnPostAttachNavMeshDataChunk_Lua(r0_11, r1_11)
  -- line: [231, 233] id: 11
  r0_11.StreamLevelNavMeshCheck[r1_11] = true
end
function r0_0.SetPlayerTrans(r0_12)
  -- line: [235, 250] id: 12
  r0_12:CreateBattleMap()
  if r0_12.RoomId2StreamLevel[r0_12.CurrentRoomId] and r0_12.RoomId2StreamLevel[r0_12.CurrentRoomId][3] then
    r0_12:EnableLevelRVTVolume(r0_12.RoomId2StreamLevel[r0_12.CurrentRoomId][3])
  end
  local r1_12 = FArray(AActor)
  r1_12 = UGameplayStatics.GetAllActorsOfClass(r0_12, LoadClass("/Game/BluePrints/Common/Level/BP_StartPoint.BP_StartPoint_C"))
  local r2_12 = tostring(r0_12.CurrentRoomId)
  for r7_12, r8_12 in pairs(r1_12:ToTable()) do
    if r2_12 == r0_12:GetDesignActorLevelName(r8_12) then
      r8_12:SetPlayerTrans()
      UGameplayStatics.GetGameMode(r0_12):InitRougeLikeSubGameMode(r0_12.RoomData[r0_12.CurrentRoomId].GameModePath, r2_12)
      return 
    end
  end
  -- close: r3_12
end
function r0_0.CreateBattleMap(r0_13)
  -- line: [252, 270] id: 13
  local r1_13 = UIManager(r0_13):GetUI("BattleMain")
  if not r1_13 then
    return 
  end
  local r2_13 = r1_13.Battle_Map
  if r2_13 then
    local r3_13 = {
      [1] = string.gsub(r0_13.RoomData[r0_13.CurrentRoomId].ArtDataPath, "_Art", ""),
    }
    r3_13[1] = string.gsub(r3_13[1], "_Layout", "")
    r3_13[1] = string.sub(r3_13[1], string.find(r3_13[1], "%.") + 1)
    local r4_13 = r0_13.LevelID2GridFrame:FindRef(r0_13.CurrentRoomId):GetTransform()
    r3_13[2] = {
      X = r4_13.Translation.X,
      Y = r4_13.Translation.Y,
    }
    r3_13[3] = r4_13.Rotation:ToRotator().Yaw
    r3_13[4] = ""
    r2_13.MapNeedDynamicMaterial = false
    r2_13:CreateRougelikeBattleMap(r0_13.CurrentRoomId, r3_13)
  end
end
function r0_0.UnloadStreamLevelByRoomId(r0_14, r1_14, r2_14)
  -- line: [272, 285] id: 14
  r0_14.LevelID2GridFrame:Remove(tostring(r1_14))
  UAsyncFunctionLibrary.UnloadStreamLevelWithID(r0_14, r2_14 .. "-" .. r1_14 .. "_Art", r1_14, false)
  UAsyncFunctionLibrary.UnloadStreamLevelWithID(r0_14, r2_14 .. "-" .. r1_14 .. "_Design", r1_14 * 1000, false)
  if r0_14.RoomId2StreamLevel[r1_14][2] then
    UAsyncFunctionLibrary.UnloadStreamLevelWithID(r0_14, r2_14 .. "-" .. r1_14 .. "_NavMesh", r1_14 * 1000 + 1, false)
  end
  if #r0_14.RoomId2StreamLevel[r1_14][4] > 0 then
    UAsyncFunctionLibrary.UnloadStreamLevelWithID(r0_14, r2_14 .. "-" .. r1_14 .. "_Sound", r1_14 * 1000 + 2, false)
  end
  if #r0_14.RoomId2StreamLevel[r1_14][5] > 0 then
    UAsyncFunctionLibrary.UnloadStreamLevelWithID(r0_14, r2_14 .. "-" .. r1_14 .. "_Effect", r1_14 * 1000 + 3, false)
  end
end
function r0_0.LoadStreamLevelByRoomId(r0_15, r1_15, r2_15)
  -- line: [287, 327] id: 15
  r0_15.LoadingFlag = true
  local r3_15 = r0_15.RoomData[r1_15].ArtDataPath
  local r4_15 = r0_15.RoomData[r1_15].DesignDataPath
  local r5_15 = string.gsub(string.gsub(r3_15, "_Art", "_NavMesh"), "_Layout", "_NavMesh")
  local r6_15 = string.gsub(r3_15, "_Art", "_Sound")
  local r7_15 = string.gsub(r3_15, "_Art", "_Effect")
  if r0_15.IsMobile then
    local r8_15 = string.gsub(r3_15, "/Maps/", "/Maps_Phone/")
    if UResourceLibrary.CheckResourceExistOnDisk(r8_15) then
      r3_15 = r8_15
    end
  end
  local r8_15 = false
  local r9_15 = nil
  r0_15.RoomId2StreamLevel[r1_15] = {}
  local r10_15 = r0_15:GetRoomLocation(r2_15)
  r8_15, r9_15 = ULevelStreamingDynamic.LoadLevelInstance(r0_15, r4_15, r10_15, FRotator(), r8_15, r0_15.StepId .. "-" .. r1_15 .. "_Design")
  table.insert(r0_15.RoomId2StreamLevel[r1_15], r9_15)
  r0_15.ID2DesignStreamingLevel[tostring(r1_15)] = r9_15
  if r0_15.LoadingComplete then
    r8_15, r9_15 = UAsyncFunctionLibrary.LoadLevelInstance(r0_15, r5_15, r10_15, FRotator(), r8_15, r0_15.StepId .. "-" .. r1_15 .. "_NavMesh")
  else
    r8_15, r9_15 = ULevelStreamingDynamic.LoadLevelInstance(r0_15, r5_15, r10_15, FRotator(), r8_15, r0_15.StepId .. "-" .. r1_15 .. "_NavMesh")
  end
  table.insert(r0_15.RoomId2StreamLevel[r1_15], r9_15)
  r0_15.LevelName2Center:Add(r5_15, FVector2D(0, 0))
  r0_15.StreamLevel2ID:Add(r9_15, r1_15)
  r0_15.LevelID2Yaw:Add(r1_15, 0)
  r8_15, r9_15 = ULevelStreamingDynamic.LoadLevelInstance(r0_15, r3_15, r10_15, FRotator(), r8_15, r0_15.StepId .. "-" .. r1_15 .. "_Art")
  table.insert(r0_15.RoomId2StreamLevel[r1_15], r9_15)
  r9_15.OnLevelLoaded:Add(r0_15, function()
    -- line: [320, 322] id: 16
    r0_15:OnArtLevelLoaded(r1_15)
  end)
  r8_15, r9_15 = ULevelStreamingDynamic.LoadLevelInstance(r0_15, r6_15, r10_15, FRotator(), r8_15, r0_15.StepId .. "-" .. r1_15 .. "_Sound")
  table.insert(r0_15.RoomId2StreamLevel[r1_15], {
    r9_15
  })
  r8_15, r9_15 = ULevelStreamingDynamic.LoadLevelInstance(r0_15, r7_15, r10_15, FRotator(), r8_15, r0_15.StepId .. "-" .. r1_15 .. "_Effect")
  table.insert(r0_15.RoomId2StreamLevel[r1_15], {
    r9_15
  })
end
function r0_0.GetRoomLocation(r0_17, r1_17)
  -- line: [329, 332] id: 17
  return FVector(r0_17.LevelSpacing * (r0_17.StepId % 10 + -5), r0_17.LevelSpacing * r1_17, 0)
end
function r0_0.OnRougeLikeEnterRoom(r0_18, r1_18, r2_18)
  -- line: [334, 341] id: 18
  r0_18:PrintRougeLikeLevelLoader("Enter Room:" .. r1_18)
  for r6_18 = 1, r2_18:Length(), 1 do
    r0_18:PrintRougeLikeLevelLoader("Next Room:" .. r2_18[r6_18])
  end
  r0_18:EnterRoom(r1_18, r2_18)
end
function r0_0.K2_GetArtPathByLevelId(r0_19, r1_19)
  -- line: [343, 349] id: 19
  if not r0_19.ID2DesignStreamingLevel[r1_19] then
    return 
  end
  local r2_19 = r0_19.ID2DesignStreamingLevel[r1_19].LevelTransform
  return r0_19.RoomData[tonumber(r1_19)].ArtDataPath, r2_19.Translation, r2_19.Rotation
end
function r0_0.PrintRougeLikeLevelLoader(r0_20, r1_20)
  -- line: [351, 353] id: 20
  print(_G.LogTag, "RougeLike_LevelLoader", r1_20)
end
function r0_0.CheckIsRougeLike(r0_21)
  -- line: [355, 357] id: 21
  return true
end
function r0_0.GetLevelIdByLevel(r0_22, r1_22)
  -- line: [359, 366] id: 22
  for r6_22, r7_22 in pairs(r0_22.RoomId2StreamLevel) do
    if r7_22[2] and r7_22[2]:GetLoadedLevel() and r7_22[2]:GetLoadedLevel() == r1_22 then
      return r6_22
    end
  end
  -- close: r2_22
  return ""
end
function r0_0.GetActorInLevelTransform(r0_23, r1_23)
  -- line: [368, 380] id: 23
  print("RougeLike EnvirSystemActor GetActorInLevelTransform")
  if not r0_23.RoomId2StreamLevel then
    return FTransform()
  end
  local r2_23 = UE4.URuntimeCommonFunctionLibrary.GetLevel(r1_23)
  for r7_23, r8_23 in pairs(r0_23.RoomId2StreamLevel) do
    if r8_23 and r8_23[3] and r8_23[3]:GetLoadedLevel() == r2_23 then
      return r8_23[3].LevelTransform
    end
  end
  -- close: r3_23
  return FTransform()
end
return r0_0
