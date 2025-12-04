-- filename: @E:/Pack/Branch/OBT10_Geili\Content/Script/BluePrints\Managers\BP_SceneManagerComponent_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
require("DataMgr")
local r0_0 = Class("BluePrints.Common.TimerMgr")
local r1_0 = require("Utils.BattleUtils")
local r2_0 = require("sha1")
local r3_0 = 0.3
local r4_0 = 30
local r5_0 = 5
local r6_0 = 6
local r7_0 = "MonitorType: ScriptDetection [KeyBoardRepeatDetection] DungeonId: %d, DungeonType = %s, RoundNum: %d, RepeatTime: %d."
function r0_0.DebugPrint(r0_1, ...)
  -- line: [26, 28] id: 1
  DebugPrint("SceneManagerComponent", ...)
end
function r0_0.GetExcavationABCIconPath(r0_2, r1_2)
  -- line: [30, 32] id: 2
  return "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Digging_" .. r1_2 .. ".T_Gp_Digging_" .. r1_2
end
function r0_0.GetSabotageABCIconPath(r0_3, r1_3)
  -- line: [34, 36] id: 3
  return "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_DestroyTarget_" .. r1_3 .. ".T_Gp_DestroyTarget_" .. r1_3
end
function r0_0.GetABCText(r0_4, r1_4, r2_4, r3_4)
  -- line: [38, 47] id: 4
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
  -- line: [49, 51] id: 5
  return r0_5:GetABCText(r0_5[r1_5], r2_5, r3_5)
end
function r0_0.Initialize(r0_6, r1_6)
  -- line: [55, 82] id: 6
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
  -- line: [84, 91] id: 7
  DebugPrint(" BP_SceneManagerComponent_C:AddRegionEvent IsRegion: ", r1_7)
  if r1_7 then
    r0_7:RegisterTeamEvent()
    EventManager:AddEvent(EventID.AddRegionIndicatorInfo, r0_7, r0_7.AddRegionOnlineCharacterInfo)
    EventManager:AddEvent(EventID.RemoveRegionIndicatorInfo, r0_7, r0_7.RemoveRegionOnlineCharacterInfo)
  end
end
function r0_0.RemoveRegionEvent(r0_8)
  -- line: [93, 98] id: 8
  DebugPrint(" BP_SceneManagerComponent_C:RemoveRegionEvent")
  TeamController:UnRegisterEvent(r0_8)
  EventManager:RemoveEvent(EventID.AddRegionIndicatorInfo, r0_8)
  EventManager:RemoveEvent(EventID.RemoveRegionIndicatorInfo, r0_8)
end
function r0_0.NotifyOnWindowResized(r0_9)
  -- line: [100, 102] id: 9
  EventManager:FireEvent(EventID.OnWindowResized)
end
function r0_0.NotifyOnWindowMoved(r0_10)
  -- line: [104, 106] id: 10
  EventManager:FireEvent(EventID.OnWindowMoved)
end
function r0_0.OnOtherPlayerEntityChange(r0_11, r1_11)
  -- line: [108, 114] id: 11
  DebugPrint("LHQ_BP_SceneManagerComponent_C:OnOtherPlayerEntityChange")
  PrintTable(r1_11)
  if r1_11 then
  end
end
function r0_0.GetCurSceneName(r0_12)
  -- line: [116, 119] id: 12
  return r0_12:GetWorld():GetName()
end
function r0_0.GetTargetActorByName(r0_13, r1_13)
  -- line: [121, 131] id: 13
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
  -- line: [133, 147] id: 14
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
  -- line: [149, 154] id: 15
  local r2_15 = UE4.UClass.Load(r1_15)
  local r3_15 = TArray(AActor)
  UE4.UGameplayStatics.GetAllActorsOfClass(r0_15, r2_15, r3_15)
  return r3_15
end
function r0_0.UpdateSceneTargetDoorInfo(r0_16, r1_16, r2_16, r3_16)
  -- line: [156, 184] id: 16
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
  -- line: [186, 208] id: 17
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
  -- line: [210, 219] id: 18
  local r2_18 = DataMgr.Dungeon[r1_18]
  if r2_18 == nil then
    print(r0_18:GetLogMask(), "GetSceneLoadProgress  MapLevelConfig is nil, SceneId is ", r1_18)
    return 100
  end
  return UE4.UResourceLibrary.GetLoadProgress(r0_18, r2_18.DungeonMapFile and "/Game/Maps/Levels/TestLevel/TestScene", r0_18:GetCurrentLoadSceneResourceId())
end
function r0_0.CheckPlayerIsInDefaultMainCity(r0_19)
  -- line: [221, 240] id: 19
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
  -- line: [242, 261] id: 20
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
  -- line: [263, 266] id: 21
  return r0_21:CheckIsInLevelSceneByPath(DataMgr.Dungeon[r1_21].DungeonMapFile)
end
function r0_0.ReplaceGuideIcon(r0_22, r1_22, r2_22, r3_22, r4_22)
  -- line: [269, 291] id: 22
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
  -- line: [293, 311] id: 23
  local r1_23 = tostring(r0_23.CaptureMonsterEid) .. "Replace"
  RunAsyncTask(r0_23, "RecoverGuideIcon_GetUIObjAsync" .. r1_23, function(r0_24)
    -- line: [296, 310] id: 24
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
  -- line: [313, 373] id: 25
  if r1_25 == nil then
    return 
  end
  if (function(r0_26)
    -- line: [318, 348] id: 26
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
  -- line: [376, 385] id: 27
  if r0_27.CurSceneGuideEids and r0_27.CurSceneGuideEids[r1_27] then
    if r0_27.CurSceneGuideEids[r1_27].IsDataStruct then
      return r0_27.CurSceneGuideEids[r1_27].Entity, true
    else
      return Battle(r0_27):GetEntity(r1_27), false
    end
  end
  return nil, false
end
function r0_0.GetCurSceneGuideEntityByData(r0_28, r1_28)
  -- line: [387, 396] id: 28
  if r1_28 then
    if r1_28.IsDataStruct then
      return nil
    else
      return Battle(r0_28):GetEntity(r1_28.Entity)
    end
  end
  return nil
end
function r0_0.UpdateOneSceneGuideIcon(r0_29, r1_29, r2_29, r3_29)
  -- line: [398, 443] id: 29
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
  -- line: [445, 468] id: 30
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
  -- line: [470, 472] id: 31
  r0_31:UpdateSceneGuideIcon(r1_31, nil, nil, "Delete", true, nil, nil)
end
function r0_0.UpdateAllSceneGuideIcon(r0_32)
  -- line: [474, 506] id: 32
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
  -- line: [508, 558] id: 33
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
  -- line: [560, 620] id: 34
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
  if r1_34.GuideEids ~= nil then
    local r7_34 = r1_34:GetPlayerState(r2_34.Eid)
    if r7_34 ~= nil then
      r6_34 = r7_34.PlayerGuideEids
    end
  end
  for r10_34 = 1, r6_34.Items:Num(), 1 do
    local r11_34 = r6_34.Items:GetRef(r10_34).IntProperty
    local r12_34 = nil
    if Battle(r0_34) then
      r12_34 = Battle(r0_34):GetEntity(r11_34)
    end
    if r5_34[r11_34] ~= nil then
      r5_34[r11_34].IsActive = true
    end
    if IsValid(r12_34) and (r12_34.OpenState == nil or r12_34.OpenState == false) then
      local r13_34 = r5_34[r11_34]
      if r13_34 == nil then
        r13_34 = "Add" and "Modify"
      else
        goto label_115	-- block#26 is visited secondly
      end
      r0_34:UpdateSceneGuideIcon(r11_34, r12_34, nil, r13_34, true, nil, true)
    else
      UE4.UGameplayStatics.GetPlayerCharacter(UE4.UGameplayStatics.GetGameInstance(r0_34), 0).RPCComponent:RequestGuideInfo(r11_34)
    end
  end
  for r11_34, r12_34 in pairs(r5_34) do
    if r12_34 and not r12_34.IsActive then
      local r13_34 = r0_34:GetCurSceneGuideEntityByData(r12_34)
      if UKismetSystemLibrary.IsValid(r13_34) then
        r0_34:UpdateSceneGuideIcon(r11_34, r13_34, nil, "Delete", true, nil, r12_34.IsPlayerEid)
      else
        r0_34:UpdateSceneGuideIcon(r11_34, nil, nil, "Delete", true, nil, r12_34.IsPlayerEid)
      end
    end
  end
  -- close: r7_34
end
function r0_0.RemoveGuideFromPathFinding(r0_35, r1_35)
  -- line: [637, 658] id: 35
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
  -- line: [660, 667] id: 36
  local r3_36 = UIConst.IndicatorCategoryTable[r1_36] and UIConst.IndicatorCategoryIconTable[r2_36]
  if r3_36 then
    return r3_36
  end
  return ""
end
function r0_0.GetGuideGuideAnimByBPPath(r0_37, r1_37, r2_37)
  -- line: [669, 676] id: 37
  local r3_37 = UIConst.IndicatorAnimTable[r1_37] and UIConst.IndicatorAnimIconTable[r2_37]
  if r3_37 then
    return r3_37
  end
  return ""
end
function r0_0.RegisterTeamEvent(r0_38)
  -- line: [678, 704] id: 38
  TeamController:RegisterEvent(r0_38, function(r0_39, r1_39, ...)
    -- line: [679, 703] id: 39
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
  -- line: [707, 715] id: 40
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
  -- line: [718, 730] id: 41
  DebugPrint("OnTeamAddRegionOtherPlayerGuide MemberInfo.Uid", r1_41.Uid, "MemberInfo.Index", r1_41.Index)
  local r2_41 = r0_41.RegionOnlineCharacterInfo[r1_41.Uid]
  if r2_41 then
    local r3_41 = FVector(0, 0, 0)
    local r4_41 = Battle(r0_41):GetEntity(r2_41)
    if r4_41 then
      r3_41 = r4_41:K2_GetActorLocation()
    end
    r0_41:AddRegionOtherPlayerGuide(r2_41, r3_41, r1_41.Index)
  end
end
function r0_0.AddRegionOtherPlayerGuide(r0_42, r1_42, r2_42, r3_42)
  -- line: [733, 743] id: 42
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
  -- line: [746, 754] id: 43
  local r2_43 = r0_43.RegionOnlineCharacterInfo[r1_43]
  DebugPrint("RemoveRegionOnlineCharacterInfo Uid", r1_43, "CurrentEid", r2_43)
  if not r2_43 then
    return 
  end
  r0_43.RegionOnlineCharacterInfo[r1_43] = nil
  r0_43:RemoveRegionOtherPlayerGuide(r2_43)
end
function r0_0.OnTeamRemoveRegionOtherPlayerGuide(r0_44, r1_44)
  -- line: [757, 767] id: 44
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
  -- line: [770, 789] id: 45
  DebugPrint("RemoveRegionOtherPlayerGuide Eid: ", r1_45)
  local r2_45 = tostring(r1_45)
  RunAsyncTask(r0_45, "RemoveRegionOtherPlayerGuide_GetUIObjAsync" .. r2_45, function(r0_46)
    -- line: [773, 788] id: 46
    local r2_46 = UE4.UGameplayStatics.GetGameInstance(r0_45):GetGameUIManager()
    if not r2_46 then
      return 
    end
    local r3_46 = r2_46:GetUIObjAsync(r2_45, r0_46)
    local r4_46 = Battle(r0_45):GetEntity(r1_45)
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
  -- line: [791, 863] id: 47
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
      -- line: [845, 860] id: 48
      local r2_48 = UE4.UGameplayStatics.GetGameInstance(r0_47):GetGameUIManager()
      if not r2_48 then
        return 
      end
      if r2_48:GetUIObjAsync(r3_47, r0_48) then
        local r4_48 = Battle(r0_47):GetEntity(r1_47)
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
  -- line: [865, 873] id: 49
  if r2_49 then
    return "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Player" .. tostring(r1_49) .. "A.T_Gp_Player" .. tostring(r1_49) .. "A"
  else
    return "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Player" .. tostring(r1_49) .. "B.T_Gp_Player" .. tostring(r1_49) .. "B"
  end
  return ""
end
function r0_0.UpdateAllGuideIconsByName(r0_50, r1_50, r2_50, r3_50)
  -- line: [875, 896] id: 50
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
  -- line: [898, 930] id: 51
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
  -- line: [932, 1162] id: 52
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
    local r19_52 = not r8_52
    DebugPrint("UpdateSceneGuideIcon START UpdateSceneGuideIcon_GetUIObjAsync" .. r15_52 .. r4_52)
    RunAsyncTask(r0_52, "UpdateSceneGuideIcon_GetUIObjAsync" .. r15_52 .. r4_52, function(r0_53)
      -- line: [1008, 1160] id: 53
      DebugPrint("UpdateSceneGuideIcon REAL START UpdateSceneGuideIcon_GetUIObjAsync" .. r15_52 .. r4_52)
      local r1_53 = r11_52:GetUIObjAsync(r15_52, r0_53) and r11_52:GetUIObjAsync(r15_52 .. "Replace", r0_53)
      if r1_53 == nil and r4_52 == "Modify" then
        r1_53 = r0_52:GetGuideIconByEid(r1_52)
      end
      r2_52 = Battle(r0_52):GetEntity(r1_52)
      DebugPrint("UpdateSceneGuideIcon  GuideName is ", r15_52, r16_52, r17_52, r1_52, r2_52, r18_52, r4_52, r5_52, r1_53, r14_52)
      r0_52:AddTimer(0.2, r0_52.UpdateMiniMapGuideIcon, false, nil, "UpdateMiniMapGuideIcon" .. r15_52 .. r4_52, false, r15_52, r4_52, r1_52, r18_52, r6_52, r14_52, r12_52, r13_52)
      if r1_53 ~= nil then
        if r4_52 == "Modify" or r4_52 == "Add" then
          r1_53:Reset(r1_52, r2_52, r18_52, r6_52, r14_52, r12_52, r13_52, false, r5_52)
          if r1_53.IsFromPool then
            r1_53.IsActiveInPoor = true
          end
          if UKismetSystemLibrary.IsValid(r2_52) then
            if r19_52 then
              r0_52.CurSceneGuideEids[r1_52] = {
                Entity = r1_52,
                IsDataStruct = false,
                IsPlayerEid = r7_52,
                IsActive = true,
              }
            end
            r0_52:AddTimer(0.1, r0_52.AddGuideToPathFindingTimerFunc, false, nil, "AddGuideToPathFinding" .. r1_52, false, r1_52, false)
          end
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
            r0_52:ProcessGuideIconAfterLoad(r3_53)
            r0_52:UpdateAllGuideIconsByName(r4_52, r1_52, r3_53:GetName())
            if UKismetSystemLibrary.IsValid(r2_52) then
              if r19_52 then
                r0_52.CurSceneGuideEids[r1_52] = {
                  Entity = r1_52,
                  IsDataStruct = false,
                  IsPlayerEid = r7_52,
                  IsActive = true,
                }
              end
              r0_52:AddTimer(0.1, r0_52.AddGuideToPathFindingTimerFunc, false, nil, "AddGuideToPathFinding" .. r1_52, false, r1_52, true)
            elseif r19_52 then
              r0_52.CurSceneGuideEids[r1_52] = {
                Entity = nil,
                IsDataStruct = false,
                IsPlayerEid = r7_52,
                IsActive = true,
              }
            end
          else
            r0_52:ProcessGuideIconAfterLoad(r11_52:LoadGuideIconAsync(r6_52.GuideIconAni, r15_52, UIConst.ZORDER_FOR_INDICATORS, r0_53, r1_52, r2_52, r18_52, r6_52, r14_52, r12_52, r13_52, false, r5_52))
            r0_52:UpdateAllGuideIconsByName(r4_52, r1_52, r15_52)
            r2_52 = Battle(r0_52):GetEntity(r1_52)
            if UKismetSystemLibrary.IsValid(r2_52) then
              if r19_52 then
                r0_52.CurSceneGuideEids[r1_52] = {
                  Entity = r1_52,
                  IsDataStruct = false,
                  IsPlayerEid = r7_52,
                  IsActive = true,
                }
              end
              r0_52:AddTimer(0.1, r0_52.AddGuideToPathFindingTimerFunc, false, nil, "AddGuideToPathFinding" .. r1_52, false, r1_52, true)
            elseif r19_52 then
              r0_52.CurSceneGuideEids[r1_52] = {
                Entity = nil,
                IsDataStruct = false,
                IsPlayerEid = r7_52,
                IsActive = true,
              }
            end
          end
        else
          r0_52:ProcessGuideIconAfterLoad(r11_52:LoadGuideIconAsync(r6_52.GuideIconAni, r15_52, UIConst.ZORDER_FOR_INDICATORS, r0_53, r1_52, r2_52, r18_52, r6_52, r14_52, r12_52, r13_52, false, r5_52))
          r0_52:UpdateAllGuideIconsByName(r4_52, r1_52, r15_52)
          r2_52 = Battle(r0_52):GetEntity(r1_52)
          if UKismetSystemLibrary.IsValid(r2_52) then
            if r19_52 then
              r0_52.CurSceneGuideEids[r1_52] = {
                Entity = r1_52,
                IsDataStruct = false,
                IsPlayerEid = r7_52,
                IsActive = true,
              }
            end
            r0_52:AddTimer(0.1, r0_52.AddGuideToPathFindingTimerFunc, false, nil, "AddGuideToPathFinding" .. r1_52, false, r1_52, true)
          elseif r19_52 then
            r0_52.CurSceneGuideEids[r1_52] = {
              Entity = nil,
              IsDataStruct = false,
              IsPlayerEid = r7_52,
              IsActive = true,
            }
          end
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
  -- line: [1164, 1199] id: 54
  if r2_54 == "Delete" then
    if r0_54:IsExistTimer("UpdateMiniMapGuideIcon" .. r1_54 .. "Add") then
      r0_54:RemoveTimer("UpdateMiniMapGuideIcon" .. r1_54 .. "Add")
    end
    if r0_54:IsExistTimer("UpdateMiniMapGuideIcon" .. r1_54 .. "Modify") then
      r0_54:RemoveTimer("UpdateMiniMapGuideIcon" .. r1_54 .. "Modify")
    end
  end
  local r9_54 = Battle(r0_54):GetEntity(r3_54)
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
  -- line: [1201, 1204] id: 55
  r0_55:AddGuideToPathFinding(Battle(r0_55):GetEntity(r1_55), r1_55, r2_55)
end
function r0_0.ProcessGuideIconAfterLoad(r0_56, r1_56)
  -- line: [1206, 1220] id: 56
  if r1_56 == nil then
    return 
  end
  r1_56.IsDungeonIndicator = true
  local r3_56 = UE4.UGameplayStatics.GetGameInstance(r0_56):GetGameUIManager()
  if not r0_56.GuideIconMain then
    r0_56.GuideIconMain = r3_56:LoadUINew("GuideIconMain")
  end
  r0_56.GuideIconMain.GuideIconMain:AddChild(r1_56)
  r0_56.GuideIconMain:AddGuideIcon(r1_56)
  r1_56:AttachEventOnLoaded()
end
function r0_0.ProcessGuideIconBeforeClose(r0_57, r1_57)
  -- line: [1222, 1229] id: 57
  if r0_57.GuideIconMain then
    r0_57.GuideIconMain:DeleteGuideIcon(r1_57.WidgetName)
  end
  r1_57:RemoveFromParent()
  r1_57.IsInit = true
end
function r0_0.ShowOrHideAllSceneGuideIcon(r0_58, r1_58, r2_58)
  -- line: [1231, 1256] id: 58
  r0_58.IsSceneGuideShow = r1_58
  for r7_58, r8_58 in pairs(r0_58.CurSceneGuideEids) do
    RunAsyncTask(r0_58, "ShowOrHideAllSceneGuideIcon_GetUIObjAsync" .. r7_58, function(r0_59)
      -- line: [1235, 1254] id: 59
      local r2_59 = UE4.UGameplayStatics.GetGameInstance(r0_58):GetGameUIManager()
      if r2_59 == nil then
        return 
      end
      local r3_59 = r0_58.GuideIcons:FindRef(r7_58)
      if r3_59 then
        local r4_59 = r2_59:GetUIObjAsync(r3_59, r0_59)
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
      end
    end)
    -- close: r7_58
  end
  -- close: r3_58
end
function r0_0.ExistPathfindingEid(r0_60, r1_60)
  -- line: [1277, 1280] id: 60
  return r0_60.PathfindingEid:FindRef(r1_60)
end
function r0_0.ShowOrHideGuideIconByGuideName(r0_61, r1_61, r2_61)
  -- line: [1282, 1294] id: 61
  RunAsyncTask(r0_61, "ShowOrHideGuideIconByGuideName_GetUIObjAsync" .. r1_61, function(r0_62)
    -- line: [1283, 1293] id: 62
    local r2_62 = UE4.UGameplayStatics.GetGameInstance(r0_61):GetGameUIManager()
    if not r2_62 then
      return 
    end
    local r3_62 = r2_62:GetUIObjAsync(r1_61, r0_62)
    if r3_62 ~= nil then
      r3_62:SetVisibilityNotOnDoor(r2_61)
    end
  end)
end
function r0_0.GetAllKindsOfGuide(r0_63)
  -- line: [1296, 1305] id: 63
  local r1_63 = TArray("")
  for r6_63, r7_63 in pairs(r0_63.GuideIcons) do
    local r8_63 = r7_63
    if r8_63 ~= nil then
      r1_63:Add(r8_63)
    end
  end
  -- close: r2_63
  return r1_63
end
function r0_0.GetGuideIconByEid(r0_64, r1_64)
  -- line: [1307, 1318] id: 64
  local r3_64 = UE4.UGameplayStatics.GetGameInstance(r0_64):GetGameUIManager()
  if r0_64.GuideIcons:FindRef(r1_64) then
    local r5_64 = r3_64:GetUIObj(r0_64.GuideIcons:FindRef(r1_64))
    if r5_64 and r5_64.TargetEid == r1_64 then
      return r5_64
    end
  end
  return nil
end
function r0_0.RefreshAllGuideStyle(r0_65)
  -- line: [1320, 1455] id: 65
  local r1_65 = UE4.UKismetSystemLibrary.GetFrameCount()
  if r1_65 == r0_65.PreFrameCount then
    return 
  end
  r0_65.PreFrameCount = r1_65
  local r3_65 = UE4.UGameplayStatics.GetGameInstance(r0_65):GetGameUIManager()
  local r4_65 = r0_65:GetAllKindsOfGuide()
  local r5_65 = {}
  for r9_65 = 1, r4_65:Length(), 1 do
    local r10_65 = r4_65:GetRef(r9_65)
    local r11_65 = math.tointeger(r10_65)
    local r12_65 = r3_65:GetUIObj(r10_65)
    if r12_65 == nil then
      DebugPrint("RefreshAllGuideStyle: GuideIcon为空 UIName: ", r10_65)
    else
      if r12_65.TargetEid ~= nil then
        r11_65 = r12_65.TargetEid
      end
      local r13_65 = r12_65:GetIconPathName()
      local r14_65 = r12_65:GetRealDistance()
      local r15_65 = r12_65:CaluCurGuideNeedShowPos(r11_65)
      if r13_65 ~= "" and r13_65 ~= nil and r11_65 ~= nil and r11_65 ~= 0 then
        local r16_65 = "NotInDoor"
        if r15_65 and r0_65.Guide2InDoorNameMaps:Find(r11_65) ~= nil then
          r16_65 = r0_65.Guide2InDoorNameMaps:Find(r11_65)
        end
        if r5_65[r13_65] == nil then
          r5_65[r13_65] = {
            {
              UIObj = r12_65,
              ShowDoorName = r16_65,
              Index = r9_65,
              Name = r10_65,
              GuideDis = r14_65,
            }
          }
        else
          table.insert(r5_65[r13_65], {
            UIObj = r12_65,
            ShowDoorName = r16_65,
            Index = r9_65,
            Name = r10_65,
            GuideDis = r14_65,
          })
        end
      end
    end
  end
  for r10_65, r11_65 in pairs(r5_65) do
    table.sort(r11_65, function(r0_66, r1_66)
      -- line: [1370, 1375] id: 66
      if r0_66.GuideDis ~= r1_66.GuideDis then
        return r0_66.GuideDis < r1_66.GuideDis
      else
        return r0_66.Index < r1_66.Index
      end
    end)
  end
  -- close: r6_65
  for r10_65, r11_65 in pairs(r5_65) do
    local r12_65 = {}
    for r17_65 = 1, #r11_65, 1 do
      if r11_65[r17_65].ShowDoorName ~= nil and r11_65[r17_65].ShowDoorName ~= "" then
        if r12_65[r11_65[r17_65].ShowDoorName] ~= nil then
          table.insert(r12_65[r11_65[r17_65].ShowDoorName], r17_65)
        else
          r12_65[r11_65[r17_65].ShowDoorName] = {
            r17_65
          }
        end
      end
    end
    for r18_65, r19_65 in pairs(r12_65) do
      if r18_65 == "NotInDoor" or #r19_65 <= 1 then
        for r23_65 = 1, #r19_65, 1 do
          local r24_65 = r11_65[r19_65[r23_65]].UIObj
          r24_65:ChangeStyle(EIndicatorStyle.Single, 1)
          r24_65:SetVisibilityOnDoor(true)
        end
      else
        for r23_65 = 1, #r19_65, 1 do
          local r24_65 = r11_65[r19_65[r23_65]].UIObj
          r24_65:ChangeStyle(EIndicatorStyle.Single, 1)
          r24_65:SetVisibilityOnDoor(false)
        end
        local r20_65 = r11_65[r19_65[1]].UIObj
        r20_65:ChangeStyle(EIndicatorStyle.Multiple, #r19_65)
        r20_65:SetVisibilityOnDoor(true)
      end
    end
    -- close: r14_65
  end
  -- close: r6_65
end
function r0_0.RealArrangeAllGuideIcons(r0_67)
  -- line: [1457, 1635] id: 67
  r0_67:RefreshAllGuideStyle()
  local r1_67 = UE4.UGameplayStatics.GetGameInstance(r0_67)
  local r2_67 = r1_67:GetGameUIManager()
  local r3_67 = UE4.UGameplayStatics.GetPlayerCharacter(r1_67, 0)
  if r3_67 == nil then
    DebugPrint("RealArrangeAllGuideIcons: Player 不存在")
    return 
  end
  local r4_67 = r0_67:GetAllKindsOfGuide()
  local r5_67 = r4_67:ToTable()
  local r6_67 = {}
  for r10_67 = 1, r4_67:Length(), 1 do
    local r11_67 = r4_67:GetRef(r10_67)
    local r12_67 = math.tointeger(r11_67)
    local r13_67 = r2_67:GetUIObj(r11_67)
    if r13_67 == nil then
      DebugPrint("RealArrangeAllGuideIcons: GuideIcon为空 UIName: ", r11_67)
    else
      if r13_67.TargetEid ~= nil then
        r12_67 = r13_67.TargetEid
      end
      local r14_67 = nil
      if r13_67.ConfigData ~= nil then
        r14_67 = r13_67.ConfigData.GuideIconAni
      end
      if r13_67.Visibility ~= UE4.ESlateVisibility.Collapsed and r0_67.Guide2InDoorNameMaps:Find(r12_67) ~= nil and r12_67 ~= nil and r12_67 ~= 0 then
        local r15_67 = r0_67.Guide2InDoorNameMaps:Find(r12_67)
        if r15_67 ~= nil and r15_67 ~= "" then
          if r6_67[r15_67] == nil then
            local r16_67 = (FVector(r3_67:K2_GetActorLocation().X, r3_67:K2_GetActorLocation().Y, 0) - FVector(r13_67.DoorPosition.X, r13_67.DoorPosition.Y, 0)):Dot(FVector(r13_67.DoorDirection.X, r13_67.DoorDirection.Y, 0))
            if r16_67 >= 0 then
              r16_67 = 1
            else
              r16_67 = -1
            end
            r6_67[r15_67] = {
              {
                UIObj = r13_67,
                Index = r10_67,
                Category = r14_67,
                Order = ((FVector(r13_67.TargetPointPos.X, r13_67.TargetPointPos.Y, 0) - FVector(r13_67.DoorPosition.X, r13_67.DoorPosition.Y, 0))):Cross(FVector(r13_67.DoorDirection.X, r13_67.DoorDirection.Y, 0)).Z * r16_67,
              }
            }
          else
            local r16_67 = (FVector(r3_67:K2_GetActorLocation().X, r3_67:K2_GetActorLocation().Y, 0) - FVector(r13_67.DoorPosition.X, r13_67.DoorPosition.Y, 0)):Dot(FVector(r13_67.DoorDirection.X, r13_67.DoorDirection.Y, 0))
            if r16_67 >= 0 then
              r16_67 = 1
            else
              r16_67 = -1
            end
            local r17_67 = false
            if r6_67[r15_67] ~= nil then
              for r22_67, r23_67 in pairs(r6_67[r15_67]) do
                if r23_67.UIObj.ConfigData.GuideIconAni == r14_67 then
                  r17_67 = true
                  break
                end
              end
              -- close: r18_67
            end
            if r17_67 and not r13_67.IsNeedMultipleShow then
              table.insert(r6_67[r15_67], {
                UIObj = r13_67,
                Index = r10_67,
                Category = r14_67,
                Order = ((FVector(r13_67.TargetPointPos.X, r13_67.TargetPointPos.Y, 0) - FVector(r13_67.DoorPosition.X, r13_67.DoorPosition.Y, 0))):Cross(FVector(r13_67.DoorDirection.X, r13_67.DoorDirection.Y, 0)).Z * r16_67,
              })
            elseif not r17_67 then
              table.insert(r6_67[r15_67], {
                UIObj = r13_67,
                Index = r10_67,
                Category = r14_67,
                Order = ((FVector(r13_67.TargetPointPos.X, r13_67.TargetPointPos.Y, 0) - FVector(r13_67.DoorPosition.X, r13_67.DoorPosition.Y, 0))):Cross(FVector(r13_67.DoorDirection.X, r13_67.DoorDirection.Y, 0)).Z * r16_67,
              })
            end
          end
        end
      end
    end
  end
  for r11_67, r12_67 in pairs(r6_67) do
    table.sort(r12_67, function(r0_68, r1_68)
      -- line: [1558, 1564] id: 68
      if r0_68.Order ~= r1_68.Order then
        return r0_68.Order < r1_68.Order
      else
        return r0_68.Index < r1_68.Index
      end
    end)
  end
  -- close: r7_67
  for r11_67, r12_67 in pairs(r6_67) do
    local r14_67 = nil
    local r15_67 = nil
    if #r12_67 >= 1 and r12_67[1].UIObj:GetVisible() and r0_67.Guide2InDoorNameMaps:Find(r12_67[1].UIObj.TargetEid) ~= nil and r12_67[1].UIObj.TargetEid ~= nil and r12_67[1].UIObj.TargetEid ~= 0 then
      r14_67 = r0_67.Guide2InDoorNameMaps:Find(r12_67[1].UIObj.TargetEid)
      r15_67 = r0_67.Guide2NextLevelIdMaps:Find(r12_67[1].UIObj.TargetEid)
    end
    local r16_67 = {}
    local r17_67 = 0
    for r22_67, r23_67 in pairs(r12_67) do
      local r24_67 = r23_67.UIObj
      local r25_67 = r24_67.ConfigData.GuideIconAni
      if r16_67[r25_67] == nil then
        r16_67[r25_67] = {
          r24_67
        }
      else
        table.insert(r16_67[r25_67], r24_67)
      end
    end
    -- close: r18_67
    for r22_67, r23_67 in pairs(r16_67) do
      r17_67 = r17_67 + 1
    end
    -- close: r18_67
    local r18_67 = 300
    local r19_67 = r18_67 / (r17_67 + 1)
    local r20_67 = r19_67
    for r25_67, r26_67 in pairs(r16_67) do
      local r27_67 = #r26_67
      if r27_67 == 1 then
        r26_67[1].TargetOffsetOnDoor = -(r18_67 / 2)
        r26_67[1].TargetOffsetOnDoor = r26_67[1].TargetOffsetOnDoor + r20_67
        r20_67 = r20_67 + r19_67
      else
        local r28_67 = 150
        local r29_67 = r28_67 / (r27_67 + 1)
        local r30_67 = r29_67
        local r31_67 = true
        for r36_67, r37_67 in pairs(r26_67) do
          if r37_67.IsNeedMultipleShow then
            r37_67.TargetOffsetOnDoor = -(r18_67 / 2)
            r37_67.TargetOffsetOnDoor = r37_67.TargetOffsetOnDoor + r20_67
            r20_67 = r20_67 + r19_67
          else
            r31_67 = false
            r37_67.TargetOffsetOnDoor = -(r18_67 / 2)
            r37_67.TargetOffsetOnDoor = r37_67.TargetOffsetOnDoor + r20_67
            r37_67.TargetOffsetOnDoor = r37_67.TargetOffsetOnDoor - r28_67 / 2
            r37_67.TargetOffsetOnDoor = r37_67.TargetOffsetOnDoor + r30_67
            r30_67 = r29_67 + r30_67
          end
        end
        -- close: r32_67
        if not r31_67 then
          r20_67 = r20_67 + r19_67
        end
      end
    end
    -- close: r21_67
  end
  -- close: r7_67
end
function r0_0.ArrangeAllGuideIcons(r0_69, r1_69, r2_69, r3_69)
  -- line: [1637, 1659] id: 69
  if r2_69 == "NotInDoor" then
    r0_69.Guide2NextLevelIdMaps:Remove(r1_69)
    r0_69.Guide2InDoorNameMaps:Remove(r1_69)
    r0_69:UpdateGuide2LevelDoorInfo(r1_69, nil, nil, "Delete")
    r0_69:AddTimer(0.1, r0_69.RefreshAllGuideStyle, false, 0, "RefreshAllGuideStyle")
  elseif not r0_69:IsExistTimer("RealArrangeAllGuideIcons") then
    r0_69:AddTimer(0.1, r0_69.RealArrangeAllGuideIcons, false, 0, "RealArrangeAllGuideIcons")
  end
  local r4_69 = UIManager(r0_69):GetUI("BattleMain")
  if not r4_69 then
    return 
  end
  local r5_69 = r4_69.Battle_Map
  if r5_69 then
    r5_69:ArrangeGuideIcons(r1_69, r3_69, r2_69 == "NotInDoor")
  end
end
function r0_0.GetIsEnableScriptDetectionCheck(r0_70)
  -- line: [1663, 1669] id: 70
  -- notice: unreachable block#4
  local r1_70 = CommonUtils.GetDeviceTypeByPlatformName(r0_70)
  local r2_70 = UIUtils.UtilsGetCurrentInputType()
  local r3_70 = UE4.UUCloudGameInstanceSubsystem.IsCloudGame()
  local r4_70 = CommonConst.CLIENT_DEVICE_TYPE.PC
  if r1_70 == r4_70 then
    r4_70 = ECommonInputType.MouseAndKeyboard
    if r2_70 == r4_70 then
      r4_70 = not r3_70
    end
  else
    r4_70 = false
  end
  return r4_70
end
function r0_0.StartScriptDetectionCheck(r0_71, r1_71)
  -- line: [1673, 1696] id: 71
  local r2_71 = false
  local r3_71 = UE4.URuntimeCommonFunctionLibrary.GetCurrentGameState(r0_71)
  if r3_71 and r3_71:IsInDungeon() then
    r2_71 = true
  end
  if r1_71 == Const.ScriptDetectionCheckType.OnMouse then
    local r4_71 = false
    if r2_71 then
      r4_71 = r3_71.GameModeType ~= "ExtermPro"
    end
    if r4_71 then
      r0_71.bNeedRecordThisTurn = false
      r0_71.CurrentMouseLocation2D = UE4.UWidgetLayoutLibrary.GetMousePositionOnViewport(r0_71)
      r0_71:StartScriptDetectionCheck_OnMouse()
    end
  elseif r1_71 == Const.ScriptDetectionCheckType.OnKeyboard and r2_71 then
    r0_71:StartScriptDetectionCheck_OnKeyboard()
  end
end
function r0_0.StartScriptDetectionCheck_OnMouse(r0_72)
  -- line: [1699, 1721] id: 72
  if not r0_72.ScriptDetectionCheck_OnMouse_Timer then
    r0_72.ScriptDetectionCheck_OnMouse_Timer = r0_72:AddTimer(1, function()
      -- line: [1701, 1719] id: 73
      -- notice: unreachable block#10
      local r0_73 = true
      local r1_73 = true
      local r2_73 = UE4.UWidgetLayoutLibrary.GetMousePositionOnViewport(r0_72)
      if r0_72.CurrentMouseLocation2D ~= nil then
        r0_73 = UE4.UKismetMathLibrary.EqualEqual_Vector2DVector2D(r0_72.CurrentMouseLocation2D, r2_73, 0.001)
      end
      if r0_72.CurrentCheckCountInScene < 10 then
        if not r0_73 and r1_73 then
          r0_72:EndScriptDetectionCheck_OnMouse(false)
        end
      else
        local r3_73 = r0_73
        if r3_73 then
          if not r0_73 then
            r3_73 = not r1_73
          else
            r3_73 = false
          end
        end
        r0_72:EndScriptDetectionCheck_OnMouse(r3_73)
      end
      r0_72.CurrentCheckCountInScene = r0_72.CurrentCheckCountInScene + 1
    end, true, nil, "ScriptDetectionCheck_OnMouse_Timer")
  end
end
function r0_0.EndScriptDetectionCheck_OnMouse(r0_74, r1_74)
  -- line: [1725, 1732] id: 74
  if r0_74.ScriptDetectionCheck_OnMouse_Timer then
    r0_74.bNeedRecordThisTurn = r1_74
    r0_74:RemoveTimer(r0_74.ScriptDetectionCheck_OnMouse_Timer)
    r0_74.ScriptDetectionCheck_OnMouse_Timer = nil
    r0_74.CurrentCheckCountInScene = 0
  end
end
function r0_0.StartScriptDetectionCheck_OnKeyboard(r0_75)
  -- line: [1734, 1745] id: 75
  if r0_75.SDCKeyboardOverTimeTimer then
    r0_75:RemoveTimer(r0_75.SDCKeyboardOverTimeTimer)
  end
  r0_75.SDCKeyboardOverTimeTimer = r0_75:AddTimer(r4_0, function()
    -- line: [1739, 1741] id: 76
    r0_75:EndScriptDetectionCheck_OnKeyboard()
  end, false)
  r0_75.bEnableKeyboardSDC = true
  r0_75.KeyList = {}
end
function r0_0.EndScriptDetectionCheck_OnKeyboard(r0_77)
  -- line: [1747, 1770] id: 77
  if r0_77.SDCKeyboardOverTimeTimer then
    r0_77:RemoveTimer(r0_77.SDCKeyboardOverTimeTimer)
    r0_77.SDCKeyboardOverTimeTimer = nil
  end
  if r0_77.bEnableKeyboardSDC then
    local r1_77 = UE4.UGameplayStatics.GetGameInstance(r0_77)
    if r1_77 and r0_77.KeyList and r6_0 <= #r0_77.KeyList then
      local r2_77 = r0_77:GetKeyListFingerprints(r0_77.KeyList)
      if r2_77 then
        r1_77.KeyListRecord[r2_77] = (r1_77.KeyListRecord[r2_77] and 0) + 1
        if r5_0 <= r1_77.KeyListRecord[r2_77] then
          r0_77:ReportScriptDetection_Keyboard(r2_77)
        end
      end
    end
    r0_77.bEnableKeyboardSDC = false
    r0_77.KeyList = nil
  end
end
function r0_0.ReceivedInputKey(r0_78, r1_78, r2_78)
  -- line: [1773, 1788] id: 78
  local r3_78 = r1_78.KeyName
  if UIConst.MouseButton[r3_78] then
    return 
  end
  if r0_78.bEnableKeyboardSDC then
    local r4_78 = UE4.UGameplayStatics.GetTimeSeconds(r0_78)
    local r5_78 = r0_78.KeyList and {}
    r0_78.KeyList = r5_78
    r5_78[#r5_78 + 1] = {
      r3_78,
      r2_78,
      r4_78
    }
  end
end
function r0_0.ReportScriptDetection_Keyboard(r0_79, r1_79)
  -- line: [1790, 1816] id: 79
  local r2_79 = GWorld:GetAvatar()
  if r2_79 then
    local r3_79 = UE4.UGameplayStatics.GetGameInstance(r0_79)
    local r4_79 = UE4.URuntimeCommonFunctionLibrary.GetCurrentGameState(r0_79)
    if r3_79 and r4_79 then
      local r5_79 = r4_79.DungeonId
      local r6_79 = DataMgr.Dungeon[r5_79]
      if r6_79 then
        local r7_79 = r6_79.DungeonType and 0
        local r8_79 = 0
        local r9_79 = UE4.URuntimeCommonFunctionLibrary.GetCurrentGameState(r0_79)
        if IsValid(r9_79) then
          r8_79 = r9_79.DungeonProgress
        end
        r2_79:SendToFeishuForCombatMonitor(string.format(r7_0, r5_79, r7_79, r8_79, r3_79.KeyListRecord[r1_79] and 0))
      end
    end
  end
end
function r0_0.UpdateIfRecordThisTurnValue(r0_80)
  -- line: [1819, 1834] id: 80
  if r0_80.CurrentMouseLocation2D == nil then
    r0_80.bNeedRecordThisTurn = false
    return 
  end
  if not r0_80.bNeedRecordThisTurn then
    DebugPrint("ScriptDetection== UpdateIfRecordThisTurnValue: 当前结果不需要最后校验, 已经是移动过鼠标的状态了！")
    return 
  end
  r0_80.bNeedRecordThisTurn = UE4.UKismetMathLibrary.EqualEqual_Vector2DVector2D(r0_80.CurrentMouseLocation2D, UE4.UWidgetLayoutLibrary.GetMousePositionOnViewport(r0_80), 0.001)
end
function r0_0.CheckAndSendRecordToServer_OnMouse(r0_81)
  -- line: [1837, 1873] id: 81
  local r1_81 = GWorld:GetAvatar()
  if not r1_81 then
    return 
  end
  if r0_81.bNeedRecordThisTurn then
    local r2_81 = UE4.UGameplayStatics.GetGameInstance(r0_81)
    r2_81.ScriptDetectionCheckRecordNum = r2_81.ScriptDetectionCheckRecordNum + 1
    DebugPrint("ScriptDetection== CheckAndSendRecordToServer_OnMouse: 未检测到鼠标移动，疑似使用脚本进行游戏操作，移除检测Timer，并且记录次数：", r2_81.ScriptDetectionCheckRecordNum)
    if r2_81.ScriptDetectionCheckRecordNum >= 5 then
      DebugPrint("ScriptDetection== CheckAndSendRecordToServer_OnMouse: 脚本检测上报，当前累计次数超过5次")
      local r3_81 = "MonitorType: ScriptDetection "
      local r4_81 = UE4.URuntimeCommonFunctionLibrary.GetCurrentGameState(r0_81)
      if r4_81 then
        local r5_81 = r4_81.DungeonId
        if r5_81 then
          r3_81 = r3_81 .. "DungeonID: " .. r5_81 .. "  "
          local r6_81 = DataMgr.Dungeon[r5_81]
          if r6_81 then
            if r6_81.DungeonType then
              r3_81 = r3_81 .. "DungeonType: " .. r6_81.DungeonType .. "  "
            end
            if r6_81.DungeonLevel then
              r3_81 = r3_81 .. "DungeonLevel: " .. r6_81.DungeonLevel .. "  "
            end
          end
        end
        r3_81 = r3_81 .. "Detection threshold for unoperated duration: 10s  "
      end
      r1_81:SendToFeishuForCombatMonitor(r3_81)
    end
  else
    DebugPrint("ScriptDetection== CheckAndSendRecordToServer_OnMouse: 检测到结束前鼠标有过移动, 判定未使用脚本进行游戏操作, 若有临时记录数据也不算次数")
  end
end
function r0_0.OnDungeonEnd_ToSceneManager(r0_82, r1_82, r2_82, r3_82)
  -- line: [1880, 1891] id: 82
  DebugPrint("OnDungeonEnd_ToSceneManager: 副本结束通知，当前副本类型：", r3_82)
  if r0_82:GetIsEnableScriptDetectionCheck() then
    if r3_82 ~= "ExtermPro" then
      r0_82:UpdateIfRecordThisTurnValue()
      r0_82:CheckAndSendRecordToServer_OnMouse()
    end
    r0_82:EndScriptDetectionCheck_OnKeyboard()
  end
end
function r0_0.GetLogMask(r0_83)
  -- line: [1893, 1895] id: 83
  return _G.LogTag
end
function r0_0.CaluCurGuideNeedShowPos(r0_84, r1_84, r2_84, r3_84)
  -- line: [1904, 1919] id: 84
  if r0_84:GetLevelLoader() == nil then
    return false, nil
  end
  local r4_84 = r0_84.Guide2NextLevelIdMaps:Find(r1_84)
  local r5_84 = r0_84.Guide2InDoorNameMaps:Find(r1_84)
  if r4_84 ~= nil and r5_84 ~= nil then
    return r0_84.LevelLoader.LevelPathfinding:GetTargetActorGuideLocation(r4_84, r5_84, r2_84, r3_84)
  end
  return false
end
function r0_0.AddFoorBox(r0_85, r1_85)
  -- line: [1921, 1924] id: 85
  if not r0_85.FloorBoxArray then
    r0_85.FloorBoxArray = {}
  end
  table.insert(r0_85.FloorBoxArray, r1_85)
end
function r0_0.AddMinimapDoor(r0_86, r1_86)
  -- line: [1926, 1929] id: 86
  if not r0_86.MinimapDoorArray then
    r0_86.MinimapDoorArray = {}
  end
  table.insert(r0_86.MinimapDoorArray, r1_86)
end
function r0_0.DelaySetFullScreen_Lua(r0_87, r1_87, r2_87)
  -- line: [1932, 1941] id: 87
  r0_87:AddTimer(0.1, function()
    -- line: [1933, 1940] id: 88
    local r0_88 = UE4.UGameUserSettings:GetGameUserSettings()
    if r0_88 then
      DebugPrint("@zyh DelaySetFullScreen_Lua执行")
      r0_88:SetFullscreenMode(r2_87)
      r0_88:ApplySettings(false)
    end
  end, false)
end
function r0_0.CleanSpecialMonsterInfo(r0_89, r1_89)
  -- line: [1943, 1947] id: 89
  if r1_89 then
    r0_89.SpecialMonsterInfo[r1_89] = nil
  end
end
function r0_0.GetKeyListFingerprints(r0_90, r1_90)
  -- line: [1949, 1954] id: 90
  return r2_0.sha1(r0_90:SerializeInputSequence(r1_90))
end
function r0_0.SerializeInputSequence(r0_91, r1_91)
  -- line: [1956, 1975] id: 91
  local r2_91 = {}
  local r3_91 = 1
  for r8_91, r9_91 in ipairs(r1_91) do
    local r10_91 = 0
    if r8_91 > 1 then
      r10_91 = math.floor(((r9_91[3] - r1_91[r8_91 + -1][3]) / r3_0 + 0.5)) * r3_0
    end
    r2_91[r3_91] = r9_91[1]
    r2_91[r3_91 + 1] = r9_91[2]
    r2_91[r3_91 + 2] = r10_91
    r3_91 = r3_91 + 3
  end
  -- close: r4_91
  return table.concat(r2_91, "|")
end
AssembleComponents(r0_0)
return r0_0
