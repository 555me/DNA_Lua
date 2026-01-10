-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Managers\BP_SceneManagerComponent_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
require("DataMgr")
local r0_0 = Class("BluePrints.Common.TimerMgr")
local r1_0 = require("Utils.BattleUtils")
local r2_0 = require("sha1")
local r3_0 = require("rapidjson")
local r4_0 = 0.3
local r5_0 = 30
local r6_0 = 5
local r7_0 = 6
local r8_0 = "MonitorType: ScriptDetection [KeyBoardRepeatDetection] DungeonId: %d, DungeonType = %s, RoundNum: %d, RepeatTime: %d."
function r0_0.DebugPrint(r0_1, ...)
  -- line: [27, 29] id: 1
  DebugPrint("SceneManagerComponent", ...)
end
function r0_0.GetExcavationABCIconPath(r0_2, r1_2)
  -- line: [31, 33] id: 2
  return "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Digging_" .. r1_2 .. ".T_Gp_Digging_" .. r1_2
end
function r0_0.GetSabotageABCIconPath(r0_3, r1_3)
  -- line: [35, 37] id: 3
  return "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_DestroyTarget_" .. r1_3 .. ".T_Gp_DestroyTarget_" .. r1_3
end
function r0_0.GetABCText(r0_4, r1_4, r2_4, r3_4)
  -- line: [39, 48] id: 4
  if r1_4 == nil then
    return ""
  end
  if r1_4.Index[r2_4] == nil then
    r1_4.Index[r2_4] = r1_4.Count
    r1_4.Count = (r1_4.Count + 1) % r3_4
  end
  return string.char(string.byte("A") + r1_4.Index[r2_4])
end
function r0_0.GetABCTextByMapName(r0_5, r1_5, r2_5, r3_5)
  -- line: [50, 52] id: 5
  return r0_5:GetABCText(r0_5[r1_5], r2_5, r3_5)
end
function r0_0.Initialize(r0_6, r1_6)
  -- line: [56, 83] id: 6
  r0_6.LoadJsonLevelData = nil
  r0_6.LastAssetName = ""
  r0_6.NeedLoadAssetName = ""
  r0_6.LoadedWorld = nil
  r0_6.IsInLoading = false
  r0_6.NowLoadResourceHandle = nil
  r0_6.CurSceneGuideEids = {}
  r0_6.IsSceneGuideShow = true
  r0_6.LevelLoader = nil
  r0_6.SpecialMonsterInfo = {}
  r0_6.DungeonNetMode = CommonConst.DungeonNetMode.Standalone
  local r2_6 = FSnapShotInfo()
  r0_6.CacheGuideInfo = {}
  r0_6.SabotageABCMap = {
    Count = 0,
    Index = {},
  }
  r0_6.ExcavationABCMap = {
    Count = 0,
    Index = {},
  }
  r0_6.RegionOnlineCharacterInfo = {}
  r0_6.CurrentCheckCountInScene = 0
end
function r0_0.AddRegionEvent(r0_7, r1_7)
  -- line: [85, 92] id: 7
  DebugPrint(" BP_SceneManagerComponent_C:AddRegionEvent IsRegion: ", r1_7)
  if r1_7 then
    r0_7:RegisterTeamEvent()
    EventManager:AddEvent(EventID.AddRegionIndicatorInfo, r0_7, r0_7.AddRegionOnlineCharacterInfo)
    EventManager:AddEvent(EventID.RemoveRegionIndicatorInfo, r0_7, r0_7.RemoveRegionOnlineCharacterInfo)
  end
end
function r0_0.RemoveRegionEvent(r0_8)
  -- line: [94, 99] id: 8
  DebugPrint(" BP_SceneManagerComponent_C:RemoveRegionEvent")
  TeamController:UnRegisterEvent(r0_8)
  EventManager:RemoveEvent(EventID.AddRegionIndicatorInfo, r0_8)
  EventManager:RemoveEvent(EventID.RemoveRegionIndicatorInfo, r0_8)
end
function r0_0.NotifyOnWindowResized(r0_9)
  -- line: [101, 103] id: 9
  EventManager:FireEvent(EventID.OnWindowResized)
end
function r0_0.NotifyOnWindowMoved(r0_10)
  -- line: [105, 107] id: 10
  EventManager:FireEvent(EventID.OnWindowMoved)
end
function r0_0.OnOtherPlayerEntityChange(r0_11, r1_11)
  -- line: [109, 115] id: 11
  DebugPrint("LHQ_BP_SceneManagerComponent_C:OnOtherPlayerEntityChange")
  PrintTable(r1_11)
  if r1_11 then
  end
end
function r0_0.GetCurSceneName(r0_12)
  -- line: [117, 120] id: 12
  return r0_12:GetWorld():GetName()
end
function r0_0.GetTargetActorByName(r0_13, r1_13)
  -- line: [122, 132] id: 13
  local r2_13 = TArray(AActor)
  UE4.UGameplayStatics.GetAllActorsOfClass(r0_13, AActor:StaticClass(), r2_13)
  for r8_13, r9_13 in pairs(r2_13:ToTable()) do
    if r9_13:GetName():find(r1_13) then
      return r9_13
    end
  end
  -- close: r4_13
end
function r0_0.GetNpcActorInSceneByID(r0_14, r1_14)
  -- line: [134, 148] id: 14
  local r2_14 = DataMgr.Npc[r1_14]
  if not r2_14 then
    return 
  end
  local r3_14 = UE4.UClass.Load(r2_14.UnitBPPath)
  local r4_14 = TArray(AActor)
  UE4.UGameplayStatics.GetAllActorsOfClass(r0_14, r3_14, r4_14)
  for r10_14, r11_14 in pairs(r4_14:ToTable()) do
    if r1_14 == r11_14.UnitId then
      return r11_14
    end
  end
  -- close: r6_14
end
function r0_0.GetTargetActorInSceneByBPPath(r0_15, r1_15)
  -- line: [150, 155] id: 15
  local r2_15 = UE4.UClass.Load(r1_15)
  local r3_15 = TArray(AActor)
  UE4.UGameplayStatics.GetAllActorsOfClass(r0_15, r2_15, r3_15)
  return r3_15
end
function r0_0.UpdateSceneTargetDoorInfo(r0_16, r1_16, r2_16, r3_16)
  -- line: [157, 185] id: 16
  if not r0_16.Guide2NextLevelIdMaps:Find(r1_16) then
    r0_16.Guide2NextLevelIdMaps:Add(r1_16, r3_16)
  end
  if not r0_16.Guide2InDoorNameMaps:Find(r1_16) then
    r0_16.Guide2InDoorNameMaps:Add(r1_16, r2_16)
  end
  if r0_16.Guide2NextLevelIdMaps:Find(r1_16) then
    r0_16.Guide2NextLevelIdMaps:Remove(r1_16)
    r0_16.Guide2NextLevelIdMaps:Add(r1_16, r3_16)
  end
  if r0_16.Guide2InDoorNameMaps:Find(r1_16) then
    r0_16.Guide2InDoorNameMaps:Remove(r1_16)
    r0_16.Guide2InDoorNameMaps:Add(r1_16, r2_16)
  end
  r0_16:UpdateGuide2LevelDoorInfo(r1_16, r2_16, r3_16, "Update")
end
function r0_0.IsDungeonScene(r0_17)
  -- line: [187, 209] id: 17
  local r1_17 = r0_17:GetCurSceneName()
  for r6_17, r7_17 in pairs(DataMgr.Dungeon) do
    local r8_17 = Split(r7_17.DungeonMapFile, "/")
    local r9_17 = #r8_17
    local r10_17 = Split(r0_17:GetScenePathName(), "/")
    local r11_17 = true
    for r15_17 = 1, r9_17 + -1, 1 do
      if r10_17[r15_17] ~= r8_17[r15_17] then
        r11_17 = false
        break
      end
    end
    local r12_17 = Split(r8_17[r9_17], ".")
    if r1_17 == r12_17[#r12_17] and r11_17 and type(r7_17.DungeonLevel) == "number" then
      return true, r7_17.IsRandom, r7_17.DungeonType
    end
  end
  -- close: r2_17
  return false, false, ""
end
function r0_0.GetSceneLoadProgress(r0_18, r1_18)
  -- line: [211, 220] id: 18
  local r2_18 = DataMgr.Dungeon[r1_18]
  if r2_18 == nil then
    print(r0_18:GetLogMask(), "GetSceneLoadProgress  MapLevelConfig is nil, SceneId is ", r1_18)
    return 100
  end
  return UE4.UResourceLibrary.GetLoadProgress(r0_18, r2_18.DungeonMapFile and "/Game/Maps/Levels/TestLevel/TestScene", r0_18:GetCurrentLoadSceneResourceId())
end
function r0_0.CheckPlayerIsInDefaultMainCity(r0_19)
  -- line: [222, 241] id: 19
  local r1_19 = r0_19:GetCurSceneName()
  local r2_19 = Split(Const.DefaultMainCityFile, "/")
  local r3_19 = #r2_19
  local r4_19 = Split(r0_19:GetScenePathName(), "/")
  local r5_19 = true
  for r9_19 = 1, r3_19 + -1, 1 do
    if r4_19[r9_19] ~= r2_19[r9_19] then
      r5_19 = false
      break
    end
  end
  local r6_19 = Split(r2_19[r3_19], ".")
  if r1_19 == r6_19[#r6_19] and r5_19 then
    return true
  end
  return false
end
function r0_0.CheckIsInLevelSceneByPath(r0_20, r1_20)
  -- line: [243, 262] id: 20
  local r2_20 = r0_20:GetCurSceneName()
  local r3_20 = Split(r1_20, "/")
  local r4_20 = #r3_20
  local r5_20 = Split(r0_20:GetScenePathName(), "/")
  local r6_20 = true
  for r10_20 = 1, r4_20 + -1, 1 do
    if r5_20[r10_20] ~= r3_20[r10_20] then
      r6_20 = false
      break
    end
  end
  local r7_20 = Split(r3_20[r4_20], ".")
  if r2_20 == r7_20[#r7_20] and r6_20 then
    return true
  end
  return false
end
function r0_0.CheckIsInLevelSceneBySceneId(r0_21, r1_21)
  -- line: [264, 267] id: 21
  return r0_21:CheckIsInLevelSceneByPath(DataMgr.Dungeon[r1_21].DungeonMapFile)
end
function r0_0.ReplaceGuideIcon(r0_22, r1_22, r2_22, r3_22, r4_22)
  -- line: [270, 292] id: 22
  local r8_22 = UE4.UGameplayStatics.GetGameInstance(r0_22):GetGameUIManager():GetUIObj(tostring(r1_22))
  if r8_22 == nil then
    r8_22 = r0_22:GetGuideIconByEid(r1_22)
  end
  if r8_22 ~= nil then
    r0_22:ProcessGuideIconBeforeClose(r8_22)
    r8_22:Close()
    r0_22:UpdateSceneGuideIcon(r1_22, r2_22, nil, "Add", true, {
      GuideIconAni = UIConst.DUNGEONINDICATOR[r3_22],
      GuideIconBPPath = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_MainMission.T_Gp_MainMission",
      IsReplace = true,
    })
  end
  r0_22.CaptureMonsterEid = r1_22
end
function r0_0.RecoverGuideIcon(r0_23)
  -- line: [294, 312] id: 23
  local r1_23 = tostring(r0_23.CaptureMonsterEid) .. "Replace"
  RunAsyncTask(r0_23, "RecoverGuideIcon_GetUIObjAsync" .. r1_23, function(r0_24)
    -- line: [297, 311] id: 24
    local r2_24 = UE4.UGameplayStatics.GetGameInstance(r0_23):GetGameUIManager()
    if not r2_24 then
      return 
    end
    local r3_24 = r2_24:GetUIObjAsync(r1_23, r0_24)
    if r3_24 ~= nil then
      r0_23:ProcessGuideIconBeforeClose(r3_24)
      r3_24:Close()
      r0_23.CurSceneGuideEids[r0_23.CaptureMonsterEid] = nil
      r0_23:UpdateOneSceneGuideIcon(r0_23.CaptureMonsterEid, true, false)
    end
  end)
end
function r0_0.SetGuideActorInfo(r0_25, r1_25)
  -- line: [314, 374] id: 25
  if r1_25 == nil then
    return 
  end
  if (function(r0_26)
    -- line: [319, 349] id: 26
    local r1_26 = UE4.UGameplayStatics.GetGameInstance(r0_25)
    local r2_26 = UE4.UGameplayStatics.GetGameState(r0_25)
    local r4_26 = r2_26:GetPlayerState(UE4.UGameplayStatics.GetPlayerCharacter(r1_26, 0).Eid)
    if r4_26 then
      local r5_26 = FIntArray()
      if r4_26.PlayerGuideEids ~= nil then
        r5_26 = r4_26.PlayerGuideEids
      end
      for r9_26 = 1, r5_26.Items:Num(), 1 do
        if r0_26 == r5_26.Items:GetRef(r9_26).IntProperty then
          return true
        end
      end
    end
    local r5_26 = FIntArray()
    if r2_26.GuideEids ~= nil then
      r5_26 = r2_26.GuideEids
    end
    for r9_26 = 1, r5_26.Items:Num(), 1 do
      if r0_26 == r5_26.Items:GetRef(r9_26).IntProperty then
        return true
      end
    end
    return false
  end)(r1_25.SnapShotId) == false then
    DebugPrint("BP_SceneManagerComponent_C:SetGuideActorInfo 序列化数据的SnapShotId不合法 SnapShotId: ", r1_25.SnapShotId)
    return 
  end
  local r3_25 = DataMgr[r1_25.UnitType][r1_25.UnitId]
  local r4_25 = r0_25.CurSceneGuideEids[r1_25.SnapShotId]
  if r4_25 == nil then
    r4_25 = "Add" and "Modify"
  else
    goto label_27	-- block#6 is visited secondly
  end
  local r5_25 = r0_25:GetEidFromCommonOrPlayer(r1_25.SnapShotId)
  r0_25:UpdateSceneGuideIcon(r1_25.SnapShotId, nil, r1_25.Loc, r4_25, true, r3_25, not r5_25, true)
  DebugPrint("BP_SceneManagerComponent_C:SetGuideActorInfo GuideOp: ", r4_25, "SnapShotId: ", r1_25.SnapShotId, "GuideInfo.Loc", r1_25.Loc)
  local r6_25 = FSnapShotInfo()
  r6_25.Loc = r1_25.Loc
  r6_25.SnapShotId = r1_25.SnapShotId
  r6_25.UnitType = r1_25.UnitType
  r6_25.UnitId = r1_25.UnitId
  r0_25.CurSceneGuideEids[r1_25.SnapShotId] = {
    Entity = r6_25,
    IsDataStruct = true,
    IsPlayerEid = not r5_25,
    IsActive = true,
  }
  if (r1_25.UnitType == "Monster" or r1_25.UnitType == "Mechanism") and r0_25:GetLevelLoader() and r0_25:GetLevelLoader().StartPathfindingToActorByEid and not r0_25.PathfindingEid:FindRef(r1_25.SnapShotId) then
    r0_25:GetLevelLoader():StartPathfindingToActorByEid(r1_25.SnapShotId)
    r0_25.PathfindingEid:Add(r1_25.SnapShotId, true)
  end
end
function r0_0.GetCurSceneGuideEntityByEid(r0_27, r1_27)
  -- line: [377, 390] id: 27
  if r0_27.CurSceneGuideEids and r0_27.CurSceneGuideEids[r1_27] then
    if r0_27.CurSceneGuideEids[r1_27].IsDataStruct then
      return r0_27.CurSceneGuideEids[r1_27].Entity, true
    else
      local r2_27 = nil
      if Battle(r0_27) then
        r2_27 = Battle(r0_27):GetEntity(r1_27)
      end
      return r2_27, false
    end
  end
  return nil, false
end
function r0_0.GetCurSceneGuideEntityByData(r0_28, r1_28)
  -- line: [392, 405] id: 28
  if r1_28 then
    if r1_28.IsDataStruct then
      return nil
    else
      local r2_28 = nil
      if Battle(r0_28) then
        r2_28 = Battle(r0_28):GetEntity(r1_28.Entity)
      end
      return r2_28
    end
  end
  return nil
end
function r0_0.UpdateOneSceneGuideIcon(r0_29, r1_29, r2_29, r3_29)
  -- line: [407, 452] id: 29
  DebugPrint("BP_SceneManagerComponent_C:UpdateOneSceneGuideIcon TargetEid: ", r1_29, "IsAdd: ", r2_29, "IsPlayerEid: ", r3_29)
  r0_29.CurSceneGuideEids = r0_29.CurSceneGuideEids and {}
  if r2_29 == true then
    local r4_29 = nil
    if Battle(r0_29) then
      r4_29 = Battle(r0_29):GetEntity(r1_29)
    end
    if IsValid(r4_29) and (r4_29.OpenState == nil or r4_29.OpenState == false) then
      local r5_29 = r0_29.CurSceneGuideEids[r1_29]
      if r5_29 == nil then
        r5_29 = "Add" and "Modify"
      else
        goto label_47	-- block#10 is visited secondly
      end
      r0_29:UpdateSceneGuideIcon(r1_29, r4_29, nil, r5_29, true, nil, r3_29)
    else
      UE4.UGameplayStatics.GetPlayerCharacter(UE4.UGameplayStatics.GetGameInstance(r0_29), 0).RPCComponent:RequestGuideInfo(r1_29)
    end
  else
    local r7_29 = UE4.UGameplayStatics.GetGameState(r0_29):GetPlayerState(UE4.UGameplayStatics.GetPlayerCharacter(UE4.UGameplayStatics.GetGameInstance(r0_29), 0).Eid)
    if r7_29 and r7_29.PlayerGuideEids ~= nil then
      for r11_29 = 1, r7_29.PlayerGuideEids.Items:Num(), 1 do
        if r7_29.PlayerGuideEids.Items:GetRef(r11_29).IntProperty == r1_29 then
          return 
        end
      end
    end
    local r8_29, r9_29 = r0_29:GetCurSceneGuideEntityByEid(r1_29)
    DebugPrint("UpdateOneSceneGuideIcon GetCurSceneGuideEntityByEid: ", r1_29, "IsAdd: ", r2_29, "IsPlayerEid: ", r3_29, "IsDataStruct", r9_29)
    if not r9_29 and UKismetSystemLibrary.IsValid(r8_29) then
      r0_29:UpdateSceneGuideIcon(r1_29, r8_29, nil, "Delete", true, nil, r3_29)
    else
      r0_29:UpdateSceneGuideIcon(r1_29, nil, nil, "Delete", true, nil, r3_29)
    end
  end
end
function r0_0.AddOneGuideIconWithSkillEffect(r0_30, r1_30, r2_30, r3_30, r4_30)
  -- line: [454, 477] id: 30
  if not Battle(r0_30) then
    return 
  end
  local r5_30 = Battle(r0_30):GetEntity(r1_30)
  if IsValid(r5_30) then
    local r6_30 = r0_30.CurSceneGuideEids[r1_30]
    if r6_30 == nil then
      r6_30 = "Add" and "Modify"
    else
      goto label_24	-- block#5 is visited secondly
    end
    local r7_30 = DataMgr[r5_30.UnitType][r5_30.UnitId]
    r0_30:UpdateSceneGuideIcon(r1_30, r5_30, nil, r6_30, true, {
      GuideIconAni = r7_30.GuideIconAni,
      GuideIconBPPath = r7_30.GuideIconBPPath,
      GuideIconBPPath2 = r7_30.GuideIconBPPath2,
      GuideDuration = r3_30,
      GuideCloseRange = r4_30,
    }, r2_30)
  end
end
function r0_0.CloseOneGuideIconByTargetEid(r0_31, r1_31)
  -- line: [479, 481] id: 31
  r0_31:UpdateSceneGuideIcon(r1_31, nil, nil, "Delete", true, nil, nil)
end
function r0_0.UpdateAllSceneGuideIcon(r0_32)
  -- line: [483, 515] id: 32
  local r1_32 = UE4.UGameplayStatics.GetGameState(r0_32)
  if r1_32 == nil then
    return 
  end
  r0_32.CurSceneGuideEids = r0_32.CurSceneGuideEids and {}
  local r2_32 = FIntArray()
  if r1_32.GuideEids ~= nil then
    r2_32 = r1_32.GuideEids
  end
  for r6_32 = 1, r2_32.Items:Num(), 1 do
    local r7_32 = r2_32.Items:GetRef(r6_32).IntProperty
    local r8_32 = nil
    if Battle(r0_32) then
      r8_32 = Battle(r0_32):GetEntity(r7_32)
    end
    local r9_32 = nil
    if IsValid(r8_32) and r8_32.IsCombatItemBase then
      r9_32 = r8_32:IsCombatItemBase()
    end
    if IsValid(r8_32) and (r8_32.OpenState == nil or r8_32.OpenState == false) and r9_32 == true then
      local r10_32 = r0_32.CurSceneGuideEids[r7_32]
      if r10_32 == nil then
        r10_32 = "Add" and "Modify"
      else
        goto label_76	-- block#18 is visited secondly
      end
      r0_32:UpdateSceneGuideIcon(r7_32, r8_32, nil, r10_32, true)
    else
      UE4.UGameplayStatics.GetPlayerCharacter(UE4.UGameplayStatics.GetGameInstance(r0_32), 0).RPCComponent:RequestGuideInfo(r7_32)
    end
  end
end
function r0_0.UpdateAllCommonGuideIcon(r0_33)
  -- line: [517, 567] id: 33
  local r1_33 = UE4.UGameplayStatics.GetGameState(r0_33)
  if r1_33 == nil then
    return 
  end
  r0_33.CurSceneGuideEids = r0_33.CurSceneGuideEids and {}
  local r2_33 = {}
  for r7_33, r8_33 in pairs(r0_33.CurSceneGuideEids) do
    if not r8_33.IsPlayerEid then
      r2_33[r7_33] = r8_33
      r8_33.IsActive = false
    end
  end
  -- close: r3_33
  local r3_33 = FIntArray()
  if r1_33.GuideEids ~= nil then
    r3_33 = r1_33.GuideEids
  end
  DebugPrint("BP_SceneManagerComponent_C:UpdateAllCommonGuideIcon AllGuideEids", r3_33.Items:Num())
  for r7_33 = 1, r3_33.Items:Num(), 1 do
    local r8_33 = r3_33.Items:GetRef(r7_33).IntProperty
    local r9_33 = nil
    if Battle(r0_33) then
      r9_33 = Battle(r0_33):GetEntity(r8_33)
    end
    if r2_33[r8_33] ~= nil then
      r2_33[r8_33].IsActive = true
    end
    if IsValid(r9_33) and (r9_33.OpenState == nil or r9_33.OpenState == false) then
      local r10_33 = r2_33[r8_33]
      if r10_33 == nil then
        r10_33 = "Add" and "Modify"
      else
        goto label_86	-- block#20 is visited secondly
      end
      r0_33:UpdateSceneGuideIcon(r8_33, r9_33, nil, r10_33, true)
    else
      UE4.UGameplayStatics.GetPlayerCharacter(UE4.UGameplayStatics.GetGameInstance(r0_33), 0).RPCComponent:RequestGuideInfo(r8_33)
    end
  end
  for r8_33, r9_33 in pairs(r2_33) do
    if r9_33 and not r9_33.IsActive then
      local r10_33 = r0_33:GetCurSceneGuideEntityByData(r9_33)
      if UKismetSystemLibrary.IsValid(r10_33) then
        r0_33:UpdateSceneGuideIcon(r8_33, r10_33, nil, "Delete", true)
      else
        r0_33:UpdateSceneGuideIcon(r8_33, nil, nil, "Delete", true)
      end
    end
  end
  -- close: r4_33
end
function r0_0.UpdateAllPlayerGuideIcon(r0_34)
  -- line: [569, 629] id: 34
  local r1_34 = UE4.UGameplayStatics.GetGameState(r0_34)
  local r2_34 = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  local r4_34 = UE4.UGameplayStatics.GetGameInstance(r0_34):GetGameUIManager()
  if r1_34 == nil or r2_34 == nil then
    return 
  end
  r0_34.CurSceneGuideEids = r0_34.CurSceneGuideEids and {}
  local r5_34 = {}
  for r10_34, r11_34 in pairs(r0_34.CurSceneGuideEids) do
    if r11_34.IsPlayerEid then
      r5_34[r10_34] = r11_34
      local r12_34 = r4_34:GetUIObj(tostring(r10_34))
      if not r12_34 or r12_34.PlayerIndex == nil or r12_34.PlayerIndex <= 0 then
        r11_34.IsActive = false
      end
    end
  end
  -- close: r6_34
  local r6_34 = FIntArray()
  local r7_34 = r1_34:GetPlayerState(r2_34.Eid)
  if r7_34 ~= nil and r7_34.PlayerGuideEids ~= nil then
    r6_34 = r7_34.PlayerGuideEids
  end
  local r8_34 = {}
  for r12_34 = 1, r6_34.Items:Num(), 1 do
    local r13_34 = r6_34.Items:GetRef(r12_34).IntProperty
    r8_34[r13_34] = true
    local r14_34 = nil
    if Battle(r0_34) then
      r14_34 = Battle(r0_34):GetEntity(r13_34)
    end
    if r5_34[r13_34] ~= nil then
      r5_34[r13_34].IsActive = true
    end
    if IsValid(r14_34) and (r14_34.OpenState == nil or r14_34.OpenState == false) then
      local r15_34 = r5_34[r13_34]
      if r15_34 == nil then
        r15_34 = "Add" and "Modify"
      else
        goto label_118	-- block#26 is visited secondly
      end
      r0_34:UpdateSceneGuideIcon(r13_34, r14_34, nil, r15_34, true, nil, true)
    else
      UE4.UGameplayStatics.GetPlayerCharacter(UE4.UGameplayStatics.GetGameInstance(r0_34), 0).RPCComponent:RequestGuideInfo(r13_34)
    end
  end
  for r13_34, r14_34 in pairs(r5_34) do
    if r14_34 and not r14_34.IsActive then
      local r15_34 = r0_34:GetCurSceneGuideEntityByData(r14_34)
      if UKismetSystemLibrary.IsValid(r15_34) then
        r0_34:UpdateSceneGuideIcon(r13_34, r15_34, nil, "Delete", true, nil, r14_34.IsPlayerEid)
      else
        r0_34:UpdateSceneGuideIcon(r13_34, nil, nil, "Delete", true, nil, r14_34.IsPlayerEid)
      end
    end
  end
  -- close: r9_34
end
function r0_0.RemoveGuideFromPathFinding(r0_35, r1_35)
  -- line: [646, 667] id: 35
  if r0_35:IsExistTimer("AddGuideToPathFinding" .. r1_35) then
    r0_35:RemoveTimer("AddGuideToPathFinding" .. r1_35)
  end
  if r0_35.PathfindingEid:FindRef(r1_35) and r0_35:GetLevelLoader() then
    r0_35.PathfindingEid:Add(r1_35, nil)
    r0_35:GetLevelLoader():StopPathfindingToActorByEid(r1_35)
  end
  r0_35.CurSceneGuideEids[r1_35] = nil
  if r0_35.Guide2NextLevelIdMaps:Find(r1_35) then
    r0_35.Guide2NextLevelIdMaps:Remove(r1_35)
  end
  if r0_35.Guide2InDoorNameMaps:Find(r1_35) then
    r0_35.Guide2InDoorNameMaps:Remove(r1_35)
  end
end
function r0_0.GetGuideTypeByBPPath(r0_36, r1_36, r2_36)
  -- line: [669, 676] id: 36
  local r3_36 = UIConst.IndicatorCategoryTable[r1_36] and UIConst.IndicatorCategoryIconTable[r2_36]
  if r3_36 then
    return r3_36
  end
  return ""
end
function r0_0.GetGuideGuideAnimByBPPath(r0_37, r1_37, r2_37)
  -- line: [678, 685] id: 37
  local r3_37 = UIConst.IndicatorAnimTable[r1_37] and UIConst.IndicatorAnimIconTable[r2_37]
  if r3_37 then
    return r3_37
  end
  return ""
end
function r0_0.RegisterTeamEvent(r0_38)
  -- line: [687, 713] id: 38
  TeamController:RegisterEvent(r0_38, function(r0_39, r1_39, ...)
    -- line: [688, 712] id: 39
    local r2_39 = TeamCommon.EventId.TeamOnAddPlayer
    if r1_39 == r2_39 then
      ... = ... -- error: untaken top expr
      r0_39:OnTeamAddRegionOtherPlayerGuide(r2_39)
    else
      r2_39 = TeamCommon.EventId.TeamOnDelPlayer
      if r1_39 == r2_39 then
        ... = ... -- error: untaken top expr
        r0_39:OnTeamRemoveRegionOtherPlayerGuide(r2_39)
        for r8_39, r9_39 in pairs(TeamController:GetModel():GetTeam().Members) do
          r0_39:OnTeamAddRegionOtherPlayerGuide(r9_39)
        end
        -- close: r4_39
      else
        r2_39 = TeamCommon.EventId.TeamOnInit
        if r1_39 == r2_39 then
          ... = ... -- error: untaken top expr
          for r7_39, r8_39 in ipairs(r2_39.Members) do
            r0_39:OnTeamAddRegionOtherPlayerGuide(r8_39)
          end
          -- close: r3_39
        else
          r2_39 = TeamCommon.EventId.TeamLeave
          if r1_39 == r2_39 then
            ... = ... -- error: untaken top expr
            for r7_39, r8_39 in ipairs(r2_39.Members) do
              r0_39:OnTeamRemoveRegionOtherPlayerGuide(r8_39)
            end
            -- close: r3_39
          end
        end
      end
    end
  end)
end
function r0_0.AddRegionOnlineCharacterInfo(r0_40, r1_40, r2_40, r3_40)
  -- line: [716, 724] id: 40
  DebugPrint("AddRegionOnlineCharacterInfo Eid", r1_40, "Uid", r2_40, "StartLoc", r3_40)
  r0_40.RegionOnlineCharacterInfo[r2_40] = r1_40
  local r4_40 = TeamController:GetModel()
  local r4_40, r5_40 = r4_40:GetTeamMember(r2_40)
  if not r4_40 then
    return 
  end
  r0_40:AddRegionOtherPlayerGuide(r1_40, r3_40, r5_40)
end
function r0_0.OnTeamAddRegionOtherPlayerGuide(r0_41, r1_41)
  -- line: [727, 742] id: 41
  DebugPrint("OnTeamAddRegionOtherPlayerGuide MemberInfo.Uid", r1_41.Uid, "MemberInfo.Index", r1_41.Index)
  local r2_41 = r0_41.RegionOnlineCharacterInfo[r1_41.Uid]
  if r2_41 then
    local r3_41 = FVector(0, 0, 0)
    local r4_41 = nil
    if Battle(r0_41) then
      r4_41 = Battle(r0_41):GetEntity(r2_41)
    end
    if r4_41 then
      r3_41 = r4_41:K2_GetActorLocation()
    end
    r0_41:AddRegionOtherPlayerGuide(r2_41, r3_41, r1_41.Index)
  end
end
function r0_0.AddRegionOtherPlayerGuide(r0_42, r1_42, r2_42, r3_42)
  -- line: [745, 755] id: 42
  DebugPrint("AddRegionOtherPlayerGuide Eid: ", r1_42, "StartLoc", r2_42, "MemberIndex", r3_42)
  local r4_42 = r0_42.CurSceneGuideEids[r1_42]
  if r4_42 == nil then
    r4_42 = "Add" and "Modify"
  else
    goto label_15	-- block#2 is visited secondly
  end
  r0_42:UpdateSceneGuideIcon(r1_42, nil, r2_42, r4_42, true, {
    GuideIconAni = UIConst.DUNGEONINDICATOR.Phantom,
    GuideIconBPPath = r0_42:GetPlayerGuideIcon(r3_42, true),
    PlayerIndex = r3_42,
  }, true)
end
function r0_0.RemoveRegionOnlineCharacterInfo(r0_43, r1_43)
  -- line: [758, 766] id: 43
  local r2_43 = r0_43.RegionOnlineCharacterInfo[r1_43]
  DebugPrint("RemoveRegionOnlineCharacterInfo Uid", r1_43, "CurrentEid", r2_43)
  if not r2_43 then
    return 
  end
  r0_43.RegionOnlineCharacterInfo[r1_43] = nil
  r0_43:RemoveRegionOtherPlayerGuide(r2_43)
end
function r0_0.OnTeamRemoveRegionOtherPlayerGuide(r0_44, r1_44)
  -- line: [769, 779] id: 44
  local r2_44 = r0_44.RegionOnlineCharacterInfo[r1_44.Uid]
  DebugPrint("RemoveRegionOnlineCharacterInfo MemberInfo", r1_44, "MemberEid", r2_44)
  if not r2_44 then
    return 
  end
  if r2_44 then
    r0_44:RemoveRegionOtherPlayerGuide(r2_44)
  end
end
function r0_0.RemoveRegionOtherPlayerGuide(r0_45, r1_45)
  -- line: [782, 804] id: 45
  DebugPrint("RemoveRegionOtherPlayerGuide Eid: ", r1_45)
  local r2_45 = tostring(r1_45)
  RunAsyncTask(r0_45, "RemoveRegionOtherPlayerGuide_GetUIObjAsync" .. r2_45, function(r0_46)
    -- line: [785, 803] id: 46
    local r2_46 = UE4.UGameplayStatics.GetGameInstance(r0_45):GetGameUIManager()
    if not r2_46 then
      return 
    end
    local r3_46 = r2_46:GetUIObjAsync(r2_45, r0_46)
    local r4_46 = nil
    if Battle(r0_45) then
      r4_46 = Battle(r0_45):GetEntity(r1_45)
    end
    if r3_46 then
      if IsValid(r4_46) then
        r0_45:UpdateSceneGuideIcon(r1_45, r4_46, nil, "Delete", true)
      else
        r0_45:UpdateSceneGuideIcon(r1_45, nil, nil, "Delete", true)
      end
    end
  end)
end
function r0_0.UpdateSceneOtherPlayerGuide(r0_47, r1_47, r2_47)
  -- line: [806, 881] id: 47
  DebugPrint("BP_SceneManagerComponent_C:UpdateSceneOtherPlayerGuide Eid: ", r1_47, "OpType", r2_47)
  if r2_47 == "Enter" then
    local r3_47 = UE4.UGameplayStatics.GetGameState(r0_47)
    local r4_47 = r0_47.OtherPlayerGuideEidMaps:ToTable()
    if r4_47 then
      for r9_47, r10_47 in pairs(r4_47) do
        local r11_47 = FVector(0, 0, 0)
        for r16_47, r17_47 in pairs(r3_47.PlayerArray) do
          if r17_47.Eid == r10_47 then
            r11_47.X = r17_47.PlayerLoc.X
            r11_47.Y = r17_47.PlayerLoc.Y
            r11_47.Z = r17_47.PlayerLoc.Z
            break
          end
        end
        -- close: r12_47
        local r12_47 = r0_47.CurSceneGuideEids[r10_47]
        if r12_47 == nil then
          r12_47 = "Add" and "Modify"
        else
          goto label_54	-- block#9 is visited secondly
        end
        r0_47:UpdateSceneGuideIcon(r10_47, nil, r11_47, r12_47, true, {
          GuideIconAni = UIConst.DUNGEONINDICATOR.Phantom,
          GuideIconBPPath = r0_47:GetPlayerGuideIcon(r9_47, true),
          PlayerIndex = r9_47,
        }, true)
      end
      -- close: r5_47
    end
  elseif r2_47 == "Exit" then
    local r3_47 = tostring(r1_47)
    RunAsyncTask(r0_47, "UpdateSceneOtherPlayerGuide_GetUIObjAsync" .. r3_47, function(r0_48)
      -- line: [860, 878] id: 48
      local r2_48 = UE4.UGameplayStatics.GetGameInstance(r0_47):GetGameUIManager()
      if not r2_48 then
        return 
      end
      if r2_48:GetUIObjAsync(r3_47, r0_48) then
        local r4_48 = nil
        if Battle(r0_47) then
          r4_48 = Battle(r0_47):GetEntity(r1_47)
        end
        if IsValid(r4_48) then
          r0_47:UpdateSceneGuideIcon(r1_47, r4_48, nil, "Delete", true)
        else
          r0_47:UpdateSceneGuideIcon(r1_47, nil, nil, "Delete", true)
        end
      end
    end)
    -- close: r3_47
  end
end
function r0_0.GetPlayerGuideIcon(r0_49, r1_49, r2_49)
  -- line: [883, 891] id: 49
  if r2_49 then
    return "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Player" .. tostring(r1_49) .. "A.T_Gp_Player" .. tostring(r1_49) .. "A"
  else
    return "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Player" .. tostring(r1_49) .. "B.T_Gp_Player" .. tostring(r1_49) .. "B"
  end
  return ""
end
function r0_0.UpdateAllGuideIconsByName(r0_50, r1_50, r2_50, r3_50)
  -- line: [893, 914] id: 50
  if r1_50 == "Add" or r1_50 == "Modify" then
    if r3_50 ~= nil then
      if r0_50.GuideIcons:FindRef(r2_50) then
        r0_50.GuideIcons:Remove(r2_50)
        r0_50.GuideIcons:Add(r2_50, r3_50)
      else
        r0_50.GuideIcons:Add(r2_50, r3_50)
      end
    elseif r0_50.GuideIcons:FindRef(r2_50) then
      local r4_50 = r0_50.GuideIcons:FindRef(r2_50)
      r0_50.GuideIcons:Remove(r2_50)
      r0_50.GuideIcons:Add(r2_50, r4_50)
    end
  elseif r1_50 == "Delete" and r0_50.GuideIcons:FindRef(r2_50) then
    r0_50.GuideIcons:Remove(r2_50)
  end
end
function r0_0.IsExistInGuideEidArrays(r0_51, r1_51)
  -- line: [916, 948] id: 51
  local r2_51 = UE4.UGameplayStatics.GetGameInstance(r0_51)
  local r3_51 = UE4.UGameplayStatics.GetGameState(r0_51)
  local r4_51 = UE4.UGameplayStatics.GetPlayerCharacter(r2_51, 0)
  if r4_51 then
    local r5_51 = r3_51:GetPlayerState(r4_51.Eid)
    DebugPrint("BP_SceneManagerComponent_C:IsExistInGuideEidArrays TargetEid", r1_51)
    if r5_51 and r5_51.PlayerGuideEids ~= nil then
      for r9_51 = 1, r5_51.PlayerGuideEids.Items:Num(), 1 do
        local r10_51 = r5_51.PlayerGuideEids.Items:GetRef(r9_51).IntProperty
        DebugPrint("IsExistInGuideEidArrays PlayerState.PlayerGuideEids Eid", r10_51)
        if r10_51 == r1_51 then
          return true
        end
      end
    end
  end
  local r5_51 = FIntArray()
  if r3_51.GuideEids ~= nil then
    r5_51 = r3_51.GuideEids
  end
  for r9_51 = 1, r5_51.Items:Num(), 1 do
    local r10_51 = r5_51.Items:GetRef(r9_51).IntProperty
    DebugPrint("IsExistInGuideEidArrays GameState.GuideEids Eid", r10_51)
    if r10_51 == r1_51 then
      return true
    end
  end
  return false
end
function r0_0.UpdateSceneGuideIcon(r0_52, r1_52, r2_52, r3_52, r4_52, r5_52, r6_52, r7_52, r8_52)
  -- line: [950, 1151] id: 52
  r0_52.Overridden.UpdateSceneGuideIcon(r0_52, r1_52, r2_52, r3_52, r4_52, r5_52)
  local r9_52 = UE4.UGameplayStatics.GetGameInstance(r0_52)
  local r10_52 = UE4.UGameplayStatics.GetGameState(r0_52)
  local r11_52 = r9_52:GetGameUIManager()
  local r12_52 = true
  local r13_52 = false
  local r14_52 = true
  local r15_52 = ""
  local r16_52 = ""
  local r17_52 = ""
  if r7_52 == nil then
    r7_52 = false
  end
  if r4_52 == "Add" or r4_52 == "Modify" then
    DebugPrint("LHQ_UpdateSceneGuideIcon Add or Modify Guide:", r1_52, "IsPlayerEid:", r7_52, "IsDataStruct", r8_52)
  elseif r4_52 == "Delete" then
    DebugPrint("LHQ_UpdateSceneGuideIcon Delete Guide:", r1_52, "IsPlayerEid:", r7_52, "IsDataStruct", r8_52)
    if r0_52:IsExistInGuideEidArrays(r1_52) then
      return 
    end
  end
  if r11_52 ~= nil then
    if UKismetSystemLibrary.IsValid(r2_52) then
      if r6_52 == nil and r4_52 ~= "Delete" then
        r6_52 = DataMgr[r2_52.UnitType][r2_52.UnitId]
      end
      r17_52 = r2_52.UnitId
      if r6_52 ~= nil and r6_52.GuideIconAni then
        r16_52 = r0_52:GetGuideTypeByBPPath(r6_52.GuideIconAni, r6_52.GuideIconBPPath)
      end
      if r16_52 == "Phantom" and r1_0.GetExtraCreateInfo("Phantom", r17_52, r17_52).IsHostage then
        r16_52 = "Hostage"
      end
      r15_52 = r15_52 .. tostring(r1_52)
      if r16_52 == "Monster" and r2_52.BlockTickLod_MoveComp then
        if r4_52 == "Add" then
          r2_52:BlockTickLod_MoveComp(true, Const.BlockTickLodTag.SceneGuide)
        elseif r4_52 == "Delete" then
          r2_52:BlockTickLod_MoveComp(false, Const.BlockTickLodTag.SceneGuide)
        end
      end
    else
      if r6_52 ~= nil then
        r17_52 = r6_52.UnitId
        r16_52 = r0_52:GetGuideTypeByBPPath(r6_52.GuideIconAni, r6_52.GuideIconBPPath)
      end
      r13_52 = true
      r15_52 = r15_52 .. tostring(r1_52)
    end
    if r15_52 == nil or r15_52 == "" then
      print(_G.LogTag, "Warning ======= GuideName is nil !!!", r15_52, r16_52, r1_52, r2_52, r3_52, r4_52)
      r0_52.CurSceneGuideEids[r1_52] = nil
      return 
    end
    if r6_52 ~= nil and not r6_52.GuideIconAni and r6_52.GuideIconBPPath ~= nil then
      return 
    end
    local r18_52 = nil
    if r3_52 ~= nil then
      r18_52 = UE4.FVector(r3_52.X, r3_52.Y, r3_52.Z)
    end
    if not r8_52 and (r4_52 == "Add" or r4_52 == "Modify") then
      r0_52.CurSceneGuideEids[r1_52] = {
        Entity = r1_52,
        IsDataStruct = false,
        IsPlayerEid = r7_52,
        IsActive = true,
      }
    end
    DebugPrint("UpdateSceneGuideIcon START UpdateSceneGuideIcon_GetUIObjAsync" .. r15_52 .. r4_52)
    RunAsyncTask(r0_52, "UpdateSceneGuideIcon_GetUIObjAsync" .. r15_52 .. r4_52, function(r0_53)
      -- line: [1029, 1149] id: 53
      DebugPrint("UpdateSceneGuideIcon REAL START UpdateSceneGuideIcon_GetUIObjAsync" .. r15_52 .. r4_52)
      local r1_53 = r11_52:GetUIObjAsync(r15_52, r0_53) and r11_52:GetUIObjAsync(r15_52 .. "Replace", r0_53)
      if r1_53 == nil and r4_52 == "Modify" then
        r1_53 = r0_52:GetGuideIconByEid(r1_52)
      end
      r2_52 = nil
      if Battle(r0_52) then
        r2_52 = Battle(r0_52):GetEntity(r1_52)
      end
      DebugPrint("UpdateSceneGuideIcon  GuideName is ", r15_52, r16_52, r17_52, r1_52, r2_52, r18_52, r4_52, r5_52, r1_53, r14_52)
      r0_52:AddTimer(0.2, r0_52.UpdateMiniMapGuideIcon, false, nil, "UpdateMiniMapGuideIcon" .. r15_52 .. r4_52, false, r15_52, r4_52, r1_52, r18_52, r6_52, r14_52, r12_52, r13_52)
      if r1_53 ~= nil then
        if r4_52 == "Modify" or r4_52 == "Add" then
          r1_53:Reset(r1_52, r2_52, r18_52, r6_52, r14_52, r12_52, r13_52, false, r5_52)
          if r1_53.IsFromPool then
            r1_53.IsActiveInPoor = true
          end
          r0_52:AddTimer(0.1, r0_52.AddGuideToPathFindingTimerFunc, false, nil, "AddGuideToPathFinding" .. r1_52, false, r1_52, false)
          r0_52:UpdateAllGuideIconsByName(r4_52, r1_52, nil)
        elseif r4_52 == "Delete" then
          r0_52:ProcessGuideIconBeforeClose(r1_53)
          r1_53:Disappear()
          r0_52:RemoveGuideFromPathFinding(r1_52)
          r0_52:UpdateAllGuideIconsByName(r4_52, r1_52, nil)
        end
      elseif r4_52 == "Add" then
        local r2_53 = true
        if r6_52 ~= nil and r6_52.IsReplace then
          r15_52 = r15_52 .. "Replace"
          r2_53 = false
        end
        if r16_52 == "Monster" and r6_52.GuideIconAni == UIConst.DUNGEONINDICATOR.Annihilate_S then
          local r3_53 = r10_52:GetIndicatorBaseFromPool("Monster")
          if r3_53 then
            r3_53.IsDungeonIndicator = true
            if r18_52 == nil then
              r18_52 = UE4.FVector(r2_52:K2_GetActorLocation().X, r2_52:K2_GetActorLocation().Y, r2_52:K2_GetActorLocation().Z)
            end
            r3_53:Reset(r1_52, r2_52, r18_52, r6_52, r14_52, r12_52, r13_52, false, r5_52, true)
            r3_53.IsActiveInPoor = true
            r0_52:ProcessGuideIconAfterLoad(r3_53, r6_52.GuideIconAni, r1_52)
            r0_52:UpdateAllGuideIconsByName(r4_52, r1_52, r3_53:GetName())
            r0_52:AddTimer(0.1, r0_52.AddGuideToPathFindingTimerFunc, false, nil, "AddGuideToPathFinding" .. r1_52, false, r1_52, true)
          else
            r0_52:ProcessGuideIconAfterLoad(r11_52:LoadGuideIconAsync(r6_52.GuideIconAni, r15_52, UIConst.ZORDER_FOR_INDICATORS, r0_53, r1_52, r2_52, r18_52, r6_52, r14_52, r12_52, r13_52, false, r5_52), r6_52.GuideIconAni, r1_52)
            r0_52:UpdateAllGuideIconsByName(r4_52, r1_52, r15_52)
            r2_52 = nil
            if Battle(r0_52) then
              r2_52 = Battle(r0_52):GetEntity(r1_52)
            end
            r0_52:AddTimer(0.1, r0_52.AddGuideToPathFindingTimerFunc, false, nil, "AddGuideToPathFinding" .. r1_52, false, r1_52, true)
          end
        else
          r0_52:ProcessGuideIconAfterLoad(r11_52:LoadGuideIconAsync(r6_52.GuideIconAni, r15_52, UIConst.ZORDER_FOR_INDICATORS, r0_53, r1_52, r2_52, r18_52, r6_52, r14_52, r12_52, r13_52, false, r5_52), r6_52.GuideIconAni, r1_52)
          r0_52:UpdateAllGuideIconsByName(r4_52, r1_52, r15_52)
          r0_52:AddTimer(0.1, r0_52.AddGuideToPathFindingTimerFunc, false, nil, "AddGuideToPathFinding" .. r1_52, false, r1_52, true)
        end
      elseif r4_52 == "Delete" then
        EventManager:FireEvent(EventID.RecycleClassToCachePool, r1_52)
        DebugPrint("UpdateSceneGuideIcon Real RecycleGuideIcon TargetEid:", r1_52)
        r0_52:RemoveGuideFromPathFinding(r1_52)
        r0_52:UpdateAllGuideIconsByName(r4_52, r1_52, nil)
      end
    end)
    -- close: r18_52
  end
end
function r0_0.UpdateMiniMapGuideIcon(r0_54, r1_54, r2_54, r3_54, r4_54, r5_54, r6_54, r7_54, r8_54)
  -- line: [1153, 1191] id: 54
  if r2_54 == "Delete" then
    if r0_54:IsExistTimer("UpdateMiniMapGuideIcon" .. r1_54 .. "Add") then
      r0_54:RemoveTimer("UpdateMiniMapGuideIcon" .. r1_54 .. "Add")
    end
    if r0_54:IsExistTimer("UpdateMiniMapGuideIcon" .. r1_54 .. "Modify") then
      r0_54:RemoveTimer("UpdateMiniMapGuideIcon" .. r1_54 .. "Modify")
    end
  end
  local r9_54 = nil
  if Battle(r0_54) then
    r9_54 = Battle(r0_54):GetEntity(r3_54)
  end
  local r12_54 = UE4.UGameplayStatics.GetGameInstance(r0_54):GetGameUIManager():GetUI("BattleMain")
  if not r12_54 then
    if r2_54 == "Delete" then
      r0_54.CacheGuideInfo[r1_54] = nil
    else
      r0_54.CacheGuideInfo[r1_54] = {
        r9_54,
        r4_54,
        r5_54,
        r3_54,
        r6_54,
        r7_54,
        r8_54
      }
    end
  else
    local r13_54 = r12_54.Battle_Map
    if r13_54 then
      r13_54:UpdateGuideIcon(r0_54, r1_54, r2_54, r3_54, r9_54, r4_54, r5_54, r6_54, r7_54, r8_54)
    end
  end
end
function r0_0.AddGuideToPathFindingTimerFunc(r0_55, r1_55, r2_55)
  -- line: [1193, 1199] id: 55
  local r3_55 = nil
  if Battle(r0_55) then
    r3_55 = Battle(r0_55):GetEntity(r1_55)
  end
  r0_55:AddGuideToPathFinding(r3_55, r1_55, r2_55)
end
function r0_0.ProcessGuideIconAfterLoad(r0_56, r1_56, r2_56, r3_56)
  -- line: [1201, 1221] id: 56
  if r1_56 == nil then
    if UE4.UGameplayStatics.GetGameState(r0_56) then
    end
    DebugPrint("Error ProcessGuideIconAfterLoad NewGuideIcon == nil GuideIconAni: ", r2_56, "TargetEid: ", r3_56)
    return 
  end
  r1_56.IsDungeonIndicator = true
  local r5_56 = UE4.UGameplayStatics.GetGameInstance(r0_56):GetGameUIManager()
  if not r0_56.GuideIconMain then
    r0_56.GuideIconMain = r5_56:LoadUINew("GuideIconMain")
  end
  r0_56.GuideIconMain.GuideIconMain:AddChild(r1_56)
  r0_56.GuideIconMain:AddGuideIcon(r1_56)
  r1_56:AttachEventOnLoaded()
end
function r0_0.ProcessGuideIconBeforeClose(r0_57, r1_57)
  -- line: [1223, 1230] id: 57
  if r0_57.GuideIconMain then
    r0_57.GuideIconMain:DeleteGuideIcon(r1_57.WidgetName)
  end
  r1_57:RemoveFromParent()
  r1_57.IsInit = true
end
function r0_0.ShowOrHideAllSceneGuideIcon(r0_58, r1_58, r2_58)
  -- line: [1232, 1261] id: 58
  r0_58.IsSceneGuideShow = r1_58
  for r7_58, r8_58 in pairs(r0_58.CurSceneGuideEids) do
    RunAsyncTask(r0_58, "ShowOrHideAllSceneGuideIcon_GetUIObjAsync" .. r7_58, function(r0_59)
      -- line: [1236, 1259] id: 59
      local r2_59 = UE4.UGameplayStatics.GetGameInstance(r0_58):GetGameUIManager()
      if r2_59 == nil then
        return 
      end
      local r3_59 = tostring(r7_58)
      local r4_59 = r2_59:GetUIObjAsync(r3_59, r0_59) and r2_59:GetUIObjAsync(r3_59 .. "Replace", r0_59)
      if r4_59 == nil then
        local r5_59 = r0_58.GuideIcons:FindRef(r7_58)
        if r5_59 then
          r4_59 = r2_59:GetUIObj(r5_59)
        end
      end
      if r4_59 ~= nil then
        if r2_58 then
          if r1_58 then
            r4_59:Show(r2_58)
          else
            r4_59:Hide(r2_58)
          end
        else
          r4_59:SetVisibilityNotOnDoor(r1_58)
        end
      end
    end)
    -- close: r7_58
  end
  -- close: r3_58
end
function r0_0.ShowOrHideSceneGuideIcon(r0_60, r1_60, r2_60, r3_60)
  -- line: [1264, 1289] id: 60
  if not r3_60 then
    DebugPrint("Error: OpTag == nil 本接口必须传入显隐Tag")
    return 
  end
  RunAsyncTask(r0_60, "ShowOrHideSceneGuideIcon_GetUIObjAsync" .. r1_60, function(r0_61)
    -- line: [1269, 1288] id: 61
    local r2_61 = UE4.UGameplayStatics.GetGameInstance(r0_60):GetGameUIManager()
    if r2_61 == nil then
      return 
    end
    local r3_61 = tostring(r1_60)
    local r4_61 = r2_61:GetUIObjAsync(r3_61, r0_61) and r2_61:GetUIObjAsync(r3_61 .. "Replace", r0_61)
    if r4_61 == nil then
      local r5_61 = r0_60.GuideIcons:FindRef(r1_60)
      if r5_61 then
        r4_61 = r2_61:GetUIObj(r5_61)
      end
    end
    if r4_61 ~= nil then
      if r2_60 then
        r4_61:Show(r3_60)
      else
        r4_61:Hide(r3_60)
      end
    end
  end)
end
function r0_0.ExistPathfindingEid(r0_62, r1_62)
  -- line: [1310, 1313] id: 62
  return r0_62.PathfindingEid:FindRef(r1_62)
end
function r0_0.ShowOrHideGuideIconByGuideName(r0_63, r1_63, r2_63)
  -- line: [1315, 1327] id: 63
  RunAsyncTask(r0_63, "ShowOrHideGuideIconByGuideName_GetUIObjAsync" .. r1_63, function(r0_64)
    -- line: [1316, 1326] id: 64
    local r2_64 = UE4.UGameplayStatics.GetGameInstance(r0_63):GetGameUIManager()
    if not r2_64 then
      return 
    end
    local r3_64 = r2_64:GetUIObjAsync(r1_63, r0_64)
    if r3_64 ~= nil then
      r3_64:SetVisibilityNotOnDoor(r2_63)
    end
  end)
end
function r0_0.GetAllKindsOfGuide(r0_65)
  -- line: [1329, 1338] id: 65
  local r1_65 = TArray("")
  for r6_65, r7_65 in pairs(r0_65.GuideIcons) do
    local r8_65 = r7_65
    if r8_65 ~= nil then
      r1_65:Add(r8_65)
    end
  end
  -- close: r2_65
  return r1_65
end
function r0_0.GetGuideIconByEid(r0_66, r1_66)
  -- line: [1341, 1352] id: 66
  local r3_66 = UE4.UGameplayStatics.GetGameInstance(r0_66):GetGameUIManager()
  if r0_66.GuideIcons:FindRef(r1_66) then
    local r5_66 = r3_66:GetUIObj(r0_66.GuideIcons:FindRef(r1_66))
    if r5_66 and r5_66.TargetEid == r1_66 then
      return r5_66
    end
  end
  return nil
end
function r0_0.RefreshAllGuideStyle(r0_67)
  -- line: [1354, 1489] id: 67
  local r1_67 = UE4.UKismetSystemLibrary.GetFrameCount()
  if r1_67 == r0_67.PreFrameCount then
    return 
  end
  r0_67.PreFrameCount = r1_67
  local r3_67 = UE4.UGameplayStatics.GetGameInstance(r0_67):GetGameUIManager()
  local r4_67 = r0_67:GetAllKindsOfGuide()
  local r5_67 = {}
  for r9_67 = 1, r4_67:Length(), 1 do
    local r10_67 = r4_67:GetRef(r9_67)
    local r11_67 = math.tointeger(r10_67)
    local r12_67 = r3_67:GetUIObj(r10_67)
    if r12_67 == nil then
      DebugPrint("RefreshAllGuideStyle: GuideIcon为空 UIName: ", r10_67)
    else
      if r12_67.TargetEid ~= nil then
        r11_67 = r12_67.TargetEid
      end
      local r13_67 = r12_67:GetIconPathName()
      local r14_67 = r12_67:GetRealDistance()
      local r15_67 = r12_67:CaluCurGuideNeedShowPos(r11_67)
      if r13_67 ~= "" and r13_67 ~= nil and r11_67 ~= nil and r11_67 ~= 0 then
        local r16_67 = "NotInDoor"
        if r15_67 and r0_67.Guide2InDoorNameMaps:Find(r11_67) ~= nil then
          r16_67 = r0_67.Guide2InDoorNameMaps:Find(r11_67)
        end
        if r5_67[r13_67] == nil then
          r5_67[r13_67] = {
            {
              UIObj = r12_67,
              ShowDoorName = r16_67,
              Index = r9_67,
              Name = r10_67,
              GuideDis = r14_67,
            }
          }
        else
          table.insert(r5_67[r13_67], {
            UIObj = r12_67,
            ShowDoorName = r16_67,
            Index = r9_67,
            Name = r10_67,
            GuideDis = r14_67,
          })
        end
      end
    end
  end
  for r10_67, r11_67 in pairs(r5_67) do
    table.sort(r11_67, function(r0_68, r1_68)
      -- line: [1404, 1409] id: 68
      if r0_68.GuideDis ~= r1_68.GuideDis then
        return r0_68.GuideDis < r1_68.GuideDis
      else
        return r0_68.Index < r1_68.Index
      end
    end)
  end
  -- close: r6_67
  for r10_67, r11_67 in pairs(r5_67) do
    local r12_67 = {}
    for r17_67 = 1, #r11_67, 1 do
      if r11_67[r17_67].ShowDoorName ~= nil and r11_67[r17_67].ShowDoorName ~= "" then
        if r12_67[r11_67[r17_67].ShowDoorName] ~= nil then
          table.insert(r12_67[r11_67[r17_67].ShowDoorName], r17_67)
        else
          r12_67[r11_67[r17_67].ShowDoorName] = {
            r17_67
          }
        end
      end
    end
    for r18_67, r19_67 in pairs(r12_67) do
      if r18_67 == "NotInDoor" or #r19_67 <= 1 then
        for r23_67 = 1, #r19_67, 1 do
          local r24_67 = r11_67[r19_67[r23_67]].UIObj
          r24_67:ChangeStyle(EIndicatorStyle.Single, 1)
          r24_67:SetVisibilityOnDoor(true)
        end
      else
        for r23_67 = 1, #r19_67, 1 do
          local r24_67 = r11_67[r19_67[r23_67]].UIObj
          r24_67:ChangeStyle(EIndicatorStyle.Single, 1)
          r24_67:SetVisibilityOnDoor(false)
        end
        local r20_67 = r11_67[r19_67[1]].UIObj
        r20_67:ChangeStyle(EIndicatorStyle.Multiple, #r19_67)
        r20_67:SetVisibilityOnDoor(true)
      end
    end
    -- close: r14_67
  end
  -- close: r6_67
end
function r0_0.RealArrangeAllGuideIcons(r0_69)
  -- line: [1491, 1669] id: 69
  r0_69:RefreshAllGuideStyle()
  local r1_69 = UE4.UGameplayStatics.GetGameInstance(r0_69)
  local r2_69 = r1_69:GetGameUIManager()
  local r3_69 = UE4.UGameplayStatics.GetPlayerCharacter(r1_69, 0)
  if r3_69 == nil then
    DebugPrint("RealArrangeAllGuideIcons: Player 不存在")
    return 
  end
  local r4_69 = r0_69:GetAllKindsOfGuide()
  local r5_69 = r4_69:ToTable()
  local r6_69 = {}
  for r10_69 = 1, r4_69:Length(), 1 do
    local r11_69 = r4_69:GetRef(r10_69)
    local r12_69 = math.tointeger(r11_69)
    local r13_69 = r2_69:GetUIObj(r11_69)
    if r13_69 == nil then
      DebugPrint("RealArrangeAllGuideIcons: GuideIcon为空 UIName: ", r11_69)
    else
      if r13_69.TargetEid ~= nil then
        r12_69 = r13_69.TargetEid
      end
      local r14_69 = nil
      if r13_69.ConfigData ~= nil then
        r14_69 = r13_69.ConfigData.GuideIconAni
      end
      if r13_69.Visibility ~= UE4.ESlateVisibility.Collapsed and r0_69.Guide2InDoorNameMaps:Find(r12_69) ~= nil and r12_69 ~= nil and r12_69 ~= 0 then
        local r15_69 = r0_69.Guide2InDoorNameMaps:Find(r12_69)
        if r15_69 ~= nil and r15_69 ~= "" then
          if r6_69[r15_69] == nil then
            local r16_69 = (FVector(r3_69:K2_GetActorLocation().X, r3_69:K2_GetActorLocation().Y, 0) - FVector(r13_69.DoorPosition.X, r13_69.DoorPosition.Y, 0)):Dot(FVector(r13_69.DoorDirection.X, r13_69.DoorDirection.Y, 0))
            if r16_69 >= 0 then
              r16_69 = 1
            else
              r16_69 = -1
            end
            r6_69[r15_69] = {
              {
                UIObj = r13_69,
                Index = r10_69,
                Category = r14_69,
                Order = ((FVector(r13_69.TargetPointPos.X, r13_69.TargetPointPos.Y, 0) - FVector(r13_69.DoorPosition.X, r13_69.DoorPosition.Y, 0))):Cross(FVector(r13_69.DoorDirection.X, r13_69.DoorDirection.Y, 0)).Z * r16_69,
              }
            }
          else
            local r16_69 = (FVector(r3_69:K2_GetActorLocation().X, r3_69:K2_GetActorLocation().Y, 0) - FVector(r13_69.DoorPosition.X, r13_69.DoorPosition.Y, 0)):Dot(FVector(r13_69.DoorDirection.X, r13_69.DoorDirection.Y, 0))
            if r16_69 >= 0 then
              r16_69 = 1
            else
              r16_69 = -1
            end
            local r17_69 = false
            if r6_69[r15_69] ~= nil then
              for r22_69, r23_69 in pairs(r6_69[r15_69]) do
                if r23_69.UIObj.ConfigData.GuideIconAni == r14_69 then
                  r17_69 = true
                  break
                end
              end
              -- close: r18_69
            end
            if r17_69 and not r13_69.IsNeedMultipleShow then
              table.insert(r6_69[r15_69], {
                UIObj = r13_69,
                Index = r10_69,
                Category = r14_69,
                Order = ((FVector(r13_69.TargetPointPos.X, r13_69.TargetPointPos.Y, 0) - FVector(r13_69.DoorPosition.X, r13_69.DoorPosition.Y, 0))):Cross(FVector(r13_69.DoorDirection.X, r13_69.DoorDirection.Y, 0)).Z * r16_69,
              })
            elseif not r17_69 then
              table.insert(r6_69[r15_69], {
                UIObj = r13_69,
                Index = r10_69,
                Category = r14_69,
                Order = ((FVector(r13_69.TargetPointPos.X, r13_69.TargetPointPos.Y, 0) - FVector(r13_69.DoorPosition.X, r13_69.DoorPosition.Y, 0))):Cross(FVector(r13_69.DoorDirection.X, r13_69.DoorDirection.Y, 0)).Z * r16_69,
              })
            end
          end
        end
      end
    end
  end
  for r11_69, r12_69 in pairs(r6_69) do
    table.sort(r12_69, function(r0_70, r1_70)
      -- line: [1592, 1598] id: 70
      if r0_70.Order ~= r1_70.Order then
        return r0_70.Order < r1_70.Order
      else
        return r0_70.Index < r1_70.Index
      end
    end)
  end
  -- close: r7_69
  for r11_69, r12_69 in pairs(r6_69) do
    local r14_69 = nil
    local r15_69 = nil
    if #r12_69 >= 1 and r12_69[1].UIObj:GetVisible() and r0_69.Guide2InDoorNameMaps:Find(r12_69[1].UIObj.TargetEid) ~= nil and r12_69[1].UIObj.TargetEid ~= nil and r12_69[1].UIObj.TargetEid ~= 0 then
      r14_69 = r0_69.Guide2InDoorNameMaps:Find(r12_69[1].UIObj.TargetEid)
      r15_69 = r0_69.Guide2NextLevelIdMaps:Find(r12_69[1].UIObj.TargetEid)
    end
    local r16_69 = {}
    local r17_69 = 0
    for r22_69, r23_69 in pairs(r12_69) do
      local r24_69 = r23_69.UIObj
      local r25_69 = r24_69.ConfigData.GuideIconAni
      if r16_69[r25_69] == nil then
        r16_69[r25_69] = {
          r24_69
        }
      else
        table.insert(r16_69[r25_69], r24_69)
      end
    end
    -- close: r18_69
    for r22_69, r23_69 in pairs(r16_69) do
      r17_69 = r17_69 + 1
    end
    -- close: r18_69
    local r18_69 = 300
    local r19_69 = r18_69 / (r17_69 + 1)
    local r20_69 = r19_69
    for r25_69, r26_69 in pairs(r16_69) do
      local r27_69 = #r26_69
      if r27_69 == 1 then
        r26_69[1].TargetOffsetOnDoor = -(r18_69 / 2)
        r26_69[1].TargetOffsetOnDoor = r26_69[1].TargetOffsetOnDoor + r20_69
        r20_69 = r20_69 + r19_69
      else
        local r28_69 = 150
        local r29_69 = r28_69 / (r27_69 + 1)
        local r30_69 = r29_69
        local r31_69 = true
        for r36_69, r37_69 in pairs(r26_69) do
          if r37_69.IsNeedMultipleShow then
            r37_69.TargetOffsetOnDoor = -(r18_69 / 2)
            r37_69.TargetOffsetOnDoor = r37_69.TargetOffsetOnDoor + r20_69
            r20_69 = r20_69 + r19_69
          else
            r31_69 = false
            r37_69.TargetOffsetOnDoor = -(r18_69 / 2)
            r37_69.TargetOffsetOnDoor = r37_69.TargetOffsetOnDoor + r20_69
            r37_69.TargetOffsetOnDoor = r37_69.TargetOffsetOnDoor - r28_69 / 2
            r37_69.TargetOffsetOnDoor = r37_69.TargetOffsetOnDoor + r30_69
            r30_69 = r29_69 + r30_69
          end
        end
        -- close: r32_69
        if not r31_69 then
          r20_69 = r20_69 + r19_69
        end
      end
    end
    -- close: r21_69
  end
  -- close: r7_69
end
function r0_0.ArrangeAllGuideIcons(r0_71, r1_71, r2_71, r3_71)
  -- line: [1671, 1693] id: 71
  if r2_71 == "NotInDoor" then
    r0_71.Guide2NextLevelIdMaps:Remove(r1_71)
    r0_71.Guide2InDoorNameMaps:Remove(r1_71)
    r0_71:UpdateGuide2LevelDoorInfo(r1_71, nil, nil, "Delete")
    r0_71:AddTimer(0.1, r0_71.RefreshAllGuideStyle, false, 0, "RefreshAllGuideStyle")
  elseif not r0_71:IsExistTimer("RealArrangeAllGuideIcons") then
    r0_71:AddTimer(0.1, r0_71.RealArrangeAllGuideIcons, false, 0, "RealArrangeAllGuideIcons")
  end
  local r4_71 = UIManager(r0_71):GetUI("BattleMain")
  if not r4_71 then
    return 
  end
  local r5_71 = r4_71.Battle_Map
  if r5_71 then
    r5_71:ArrangeGuideIcons(r1_71, r3_71, r2_71 == "NotInDoor")
  end
end
function r0_0.GetIsEnableScriptDetectionCheck(r0_72)
  -- line: [1697, 1703] id: 72
  -- notice: unreachable block#4
  local r1_72 = CommonUtils.GetDeviceTypeByPlatformName(r0_72)
  local r2_72 = UIUtils.UtilsGetCurrentInputType()
  local r3_72 = UE4.UUCloudGameInstanceSubsystem.IsCloudGame()
  local r4_72 = CommonConst.CLIENT_DEVICE_TYPE.PC
  if r1_72 == r4_72 then
    r4_72 = ECommonInputType.MouseAndKeyboard
    if r2_72 == r4_72 then
      r4_72 = not r3_72
    end
  else
    r4_72 = false
  end
  return r4_72
end
function r0_0.GetScriptDetectionConditionMet_OnMouse(r0_73, r1_73, r2_73)
  -- line: [1706, 1728] id: 73
  DebugPrint("GetScriptDetectionConditionMet_OnMouse DungeonType:", r1_73, " DungeonId:", r2_73)
  local r3_73 = {
    "ExtermPro"
  }
  local r4_73 = {
    90108,
    90604,
    60702,
    62702,
    64702
  }
  local r5_73 = true
  for r10_73, r11_73 in ipairs(r3_73) do
    if r1_73 == r11_73 then
      r5_73 = false
      break
    end
  end
  -- close: r6_73
  if r5_73 then
    for r10_73, r11_73 in ipairs(r4_73) do
      if r2_73 == r11_73 then
        r5_73 = false
        break
      end
    end
    -- close: r6_73
  end
  return r5_73
end
function r0_0.StartScriptDetectionCheck(r0_74, r1_74)
  -- line: [1732, 1752] id: 74
  local r2_74 = false
  local r3_74 = UE4.URuntimeCommonFunctionLibrary.GetCurrentGameState(r0_74)
  if r3_74 and r3_74:IsInDungeon() then
    r2_74 = true
  end
  if r1_74 == Const.ScriptDetectionCheckType.OnMouse and r2_74 and r0_74:GetScriptDetectionConditionMet_OnMouse(r3_74.GameModeType, r3_74.DungeonId) then
    r0_74.bNeedRecordThisTurn = false
    r0_74.CurrentMouseLocation2D = UE4.UWidgetLayoutLibrary.GetMousePositionOnViewport(r0_74)
    r0_74:StartScriptDetectionCheck_OnMouse()
  elseif r1_74 == Const.ScriptDetectionCheckType.OnKeyboard and r2_74 then
    r0_74:StartScriptDetectionCheck_OnKeyboard()
  end
end
function r0_0.StartScriptDetectionCheck_OnMouse(r0_75)
  -- line: [1755, 1776] id: 75
  if not r0_75.ScriptDetectionCheck_OnMouse_Timer then
    r0_75.ScriptDetectionCheck_OnMouse_Timer = r0_75:AddTimer(1, function()
      -- line: [1757, 1774] id: 76
      -- notice: unreachable block#10
      local r0_76 = true
      local r1_76 = r0_75:IsGameWindowActivated()
      local r2_76 = UE4.UWidgetLayoutLibrary.GetMousePositionOnViewport(r0_75)
      if r0_75.CurrentMouseLocation2D ~= nil then
        r0_76 = UE4.UKismetMathLibrary.EqualEqual_Vector2DVector2D(r0_75.CurrentMouseLocation2D, r2_76, 0.001)
      end
      if r0_75.CurrentCheckCountInScene < 10 then
        if not r0_76 and r1_76 then
          r0_75:EndScriptDetectionCheck_OnMouse(false)
        end
      else
        local r3_76 = r0_76
        if r3_76 then
          if not r0_76 then
            r3_76 = not r1_76
          else
            r3_76 = false
          end
        end
        r0_75:EndScriptDetectionCheck_OnMouse(r3_76)
      end
      r0_75.CurrentCheckCountInScene = r0_75.CurrentCheckCountInScene + 1
    end, true, nil, "ScriptDetectionCheck_OnMouse_Timer")
  end
end
function r0_0.EndScriptDetectionCheck_OnMouse(r0_77, r1_77)
  -- line: [1780, 1787] id: 77
  if r0_77.ScriptDetectionCheck_OnMouse_Timer then
    r0_77.bNeedRecordThisTurn = r1_77
    r0_77:RemoveTimer(r0_77.ScriptDetectionCheck_OnMouse_Timer)
    r0_77.ScriptDetectionCheck_OnMouse_Timer = nil
    r0_77.CurrentCheckCountInScene = 0
  end
end
function r0_0.StartScriptDetectionCheck_OnKeyboard(r0_78)
  -- line: [1789, 1800] id: 78
  if r0_78.SDCKeyboardOverTimeTimer then
    r0_78:RemoveTimer(r0_78.SDCKeyboardOverTimeTimer)
  end
  r0_78.SDCKeyboardOverTimeTimer = r0_78:AddTimer(r5_0, function()
    -- line: [1794, 1796] id: 79
    r0_78:EndScriptDetectionCheck_OnKeyboard()
  end, false)
  r0_78.bEnableKeyboardSDC = true
  r0_78.KeyList = {}
end
function r0_0.EndScriptDetectionCheck_OnKeyboard(r0_80)
  -- line: [1802, 1825] id: 80
  if r0_80.SDCKeyboardOverTimeTimer then
    r0_80:RemoveTimer(r0_80.SDCKeyboardOverTimeTimer)
    r0_80.SDCKeyboardOverTimeTimer = nil
  end
  if r0_80.bEnableKeyboardSDC then
    local r1_80 = UE4.UGameplayStatics.GetGameInstance(r0_80)
    if r1_80 and r0_80.KeyList and r7_0 <= #r0_80.KeyList then
      local r2_80 = r0_80:GetKeyListFingerprints(r0_80.KeyList)
      if r2_80 then
        r1_80.KeyListRecord[r2_80] = (r1_80.KeyListRecord[r2_80] and 0) + 1
        if r6_0 <= r1_80.KeyListRecord[r2_80] then
          r0_80:ReportScriptDetection_Keyboard(r2_80)
        end
      end
    end
    r0_80.bEnableKeyboardSDC = false
    r0_80.KeyList = nil
  end
end
function r0_0.ReceivedInputKey(r0_81, r1_81, r2_81)
  -- line: [1828, 1843] id: 81
  local r3_81 = r1_81.KeyName
  if UIConst.MouseButton[r3_81] then
    return 
  end
  if r0_81.bEnableKeyboardSDC then
    local r4_81 = UE4.UGameplayStatics.GetTimeSeconds(r0_81)
    local r5_81 = r0_81.KeyList and {}
    r0_81.KeyList = r5_81
    r5_81[#r5_81 + 1] = {
      r3_81,
      r2_81,
      r4_81
    }
  end
end
function r0_0.ReportScriptDetection_Keyboard(r0_82, r1_82)
  -- line: [1845, 1871] id: 82
  if GWorld:GetAvatar() then
    local r3_82 = UE4.UGameplayStatics.GetGameInstance(r0_82)
    local r4_82 = UE4.URuntimeCommonFunctionLibrary.GetCurrentGameState(r0_82)
    if r3_82 and r4_82 then
      local r5_82 = r4_82.DungeonId
      local r6_82 = DataMgr.Dungeon[r5_82]
      if r6_82 then
        local r7_82 = r6_82.DungeonType and 0
        local r8_82 = 0
        local r9_82 = UE4.URuntimeCommonFunctionLibrary.GetCurrentGameState(r0_82)
        if IsValid(r9_82) then
          r8_82 = r9_82.DungeonProgress
        end
        r0_82:ReportCheatMsg(CommonConst.MonitorCheatType.Keyboard, string.format(r8_0, r5_82, r7_82, r8_82, r3_82.KeyListRecord[r1_82] and 0))
      end
    end
  end
end
function r0_0.UpdateIfRecordThisTurnValue(r0_83)
  -- line: [1874, 1889] id: 83
  if r0_83.CurrentMouseLocation2D == nil then
    r0_83.bNeedRecordThisTurn = false
    return 
  end
  if not r0_83.bNeedRecordThisTurn then
    DebugPrint("ScriptDetection== UpdateIfRecordThisTurnValue: 当前结果不需要最后校验, 已经是移动过鼠标的状态了！")
    return 
  end
  r0_83.bNeedRecordThisTurn = UE4.UKismetMathLibrary.EqualEqual_Vector2DVector2D(r0_83.CurrentMouseLocation2D, UE4.UWidgetLayoutLibrary.GetMousePositionOnViewport(r0_83), 0.001)
end
function r0_0.CheckAndSendRecordToServer_OnMouse(r0_84)
  -- line: [1892, 1928] id: 84
  if not GWorld:GetAvatar() then
    return 
  end
  if r0_84.bNeedRecordThisTurn then
    local r2_84 = UE4.UGameplayStatics.GetGameInstance(r0_84)
    r2_84.ScriptDetectionCheckRecordNum = r2_84.ScriptDetectionCheckRecordNum + 1
    DebugPrint("ScriptDetection== CheckAndSendRecordToServer_OnMouse: 未检测到鼠标移动，疑似使用脚本进行游戏操作，移除检测Timer，并且记录次数：", r2_84.ScriptDetectionCheckRecordNum)
    if r2_84.ScriptDetectionCheckRecordNum >= 5 then
      DebugPrint("ScriptDetection== CheckAndSendRecordToServer_OnMouse: 脚本检测上报，当前累计次数超过5次")
      local r3_84 = "MonitorType: ScriptDetection "
      local r4_84 = UE4.URuntimeCommonFunctionLibrary.GetCurrentGameState(r0_84)
      if r4_84 then
        local r5_84 = r4_84.DungeonId
        if r5_84 then
          r3_84 = r3_84 .. "DungeonID: " .. r5_84 .. "  "
          local r6_84 = DataMgr.Dungeon[r5_84]
          if r6_84 then
            if r6_84.DungeonType then
              r3_84 = r3_84 .. "DungeonType: " .. r6_84.DungeonType .. "  "
            end
            if r6_84.DungeonLevel then
              r3_84 = r3_84 .. "DungeonLevel: " .. r6_84.DungeonLevel .. "  "
            end
          end
        end
        r3_84 = r3_84 .. "Detection threshold for unoperated duration: 10s  "
      end
      r0_84:ReportCheatMsg(CommonConst.MonitorCheatType.Mouse, r3_84)
    end
  else
    DebugPrint("ScriptDetection== CheckAndSendRecordToServer_OnMouse: 检测到结束前鼠标有过移动, 判定未使用脚本进行游戏操作, 若有临时记录数据也不算次数")
  end
end
function r0_0.OnDungeonEnd_ToSceneManager(r0_85, r1_85, r2_85, r3_85, r4_85)
  -- line: [1936, 1948] id: 85
  DebugPrint("OnDungeonEnd_ToSceneManager: 副本结束通知，当前副本类型：", r3_85, r4_85)
  if r0_85:GetIsEnableScriptDetectionCheck() then
    if r0_85:GetScriptDetectionConditionMet_OnMouse(r3_85, r4_85) then
      r0_85:UpdateIfRecordThisTurnValue()
      r0_85:CheckAndSendRecordToServer_OnMouse()
    end
    r0_85:EndScriptDetectionCheck_OnKeyboard()
  end
end
function r0_0.GetLogMask(r0_86)
  -- line: [1950, 1952] id: 86
  return _G.LogTag
end
function r0_0.CaluCurGuideNeedShowPos(r0_87, r1_87, r2_87, r3_87)
  -- line: [1961, 1976] id: 87
  if r0_87:GetLevelLoader() == nil then
    return false, nil
  end
  local r4_87 = r0_87.Guide2NextLevelIdMaps:Find(r1_87)
  local r5_87 = r0_87.Guide2InDoorNameMaps:Find(r1_87)
  if r4_87 ~= nil and r5_87 ~= nil then
    return r0_87.LevelLoader.LevelPathfinding:GetTargetActorGuideLocation(r4_87, r5_87, r2_87, r3_87)
  end
  return false
end
function r0_0.AddFoorBox(r0_88, r1_88)
  -- line: [1978, 1981] id: 88
  if not r0_88.FloorBoxArray then
    r0_88.FloorBoxArray = {}
  end
  table.insert(r0_88.FloorBoxArray, r1_88)
end
function r0_0.AddMinimapDoor(r0_89, r1_89)
  -- line: [1983, 1986] id: 89
  if not r0_89.MinimapDoorArray then
    r0_89.MinimapDoorArray = {}
  end
  table.insert(r0_89.MinimapDoorArray, r1_89)
end
function r0_0.DelaySetFullScreen_Lua(r0_90, r1_90, r2_90)
  -- line: [1989, 1998] id: 90
  r0_90:AddTimer(0.1, function()
    -- line: [1990, 1997] id: 91
    local r0_91 = UE4.UGameUserSettings:GetGameUserSettings()
    if r0_91 then
      DebugPrint("@zyh DelaySetFullScreen_Lua执行")
      r0_91:SetFullscreenMode(r2_90)
      r0_91:ApplySettings(false)
    end
  end, false)
end
function r0_0.CleanSpecialMonsterInfo(r0_92, r1_92)
  -- line: [2000, 2004] id: 92
  if r1_92 then
    r0_92.SpecialMonsterInfo[r1_92] = nil
  end
end
function r0_0.GetKeyListFingerprints(r0_93, r1_93)
  -- line: [2006, 2011] id: 93
  return r2_0.sha1(r0_93:SerializeInputSequence(r1_93))
end
function r0_0.SerializeInputSequence(r0_94, r1_94)
  -- line: [2013, 2032] id: 94
  local r2_94 = {}
  local r3_94 = 1
  for r8_94, r9_94 in ipairs(r1_94) do
    local r10_94 = 0
    if r8_94 > 1 then
      r10_94 = math.floor(((r9_94[3] - r1_94[r8_94 + -1][3]) / r4_0 + 0.5)) * r4_0
    end
    r2_94[r3_94] = r9_94[1]
    r2_94[r3_94 + 1] = r9_94[2]
    r2_94[r3_94 + 2] = r10_94
    r3_94 = r3_94 + 3
  end
  -- close: r4_94
  return table.concat(r2_94, "|")
end
function r0_0.ReportCheatMsg(r0_95, r1_95, r2_95)
  -- line: [2034, 2046] id: 95
  local r3_95 = GWorld:GetAvatar()
  if not r3_95 then
    return 
  end
  r3_95:CallServerMethod("SendCheatMsgToServer", r1_95, r3_0.encode({
    CheatMsg = r2_95,
  }))
end
AssembleComponents(r0_0)
return r0_0
