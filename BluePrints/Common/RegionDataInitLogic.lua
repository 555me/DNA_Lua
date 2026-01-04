-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Common\RegionDataInitLogic.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
require("Const")
local r0_0 = Class()
function r0_0.SyncFullRegionStoreDataFromServer(r0_1, r1_1)
  -- line: [21, 23] id: 1
  r0_1.DataLibrary.FullRegionStoreDatas = r1_1
end
function r0_0.SyncPartRegionDataFromServer(r0_2, r1_2)
  -- line: [29, 43] id: 2
  r0_2.NewDataReceived = true
  r0_2.PartRegionStoreData = r1_2
end
function r0_0.ClearServerRegionData(r0_3)
  -- line: [45, 57] id: 3
  r0_3.DataLibrary:ClearSSData()
  r0_3.DataLibrary:ClearRegionCacheDatas()
  r0_3.DataLibrary:ClearManualItemDatas()
  r0_3:ClearCppRegionData()
  r0_3:MakeManualItemIdMap()
  if r0_3.DataPool then
    r0_3.DataPool:Initialize(r0_3)
  end
  r0_3.DataLibrary.LogHelper.bIsRegionLogEnabled = r0_3.IsRegionLogEnabled
end
function r0_0.MakeManualItemIdMap(r0_4)
  -- line: [59, 75] id: 4
  if not r0_4.PartRegionStoreData then
    return 
  end
  for r5_4, r6_4 in pairs(r0_4.PartRegionStoreData) do
    for r11_4, r12_4 in pairs(r6_4) do
      for r17_4, r18_4 in pairs(r12_4) do
        for r23_4, r24_4 in pairs(r18_4) do
          if r24_4.ManualItemId ~= nil and r24_4.ManualItemId > 0 then
            r0_4.DataLibrary.ManualItemIdMap[r24_4.ManualItemId] = r24_4
            r0_4.DataLibrary.ManualItemWorldRegionEidExist:Add(r24_4.ManualItemId, r24_4.WorldRegionEid)
          end
        end
        -- close: r19_4
      end
      -- close: r13_4
    end
    -- close: r7_4
  end
  -- close: r1_4
end
function r0_0.SyncServerRegionData(r0_5)
  -- line: [77, 118] id: 5
  GWorld.UploadQuestChainData = true
  r0_5.DataLibrary:ClearSSData()
  r0_5.DataLibrary:ClearRegionCacheDatas()
  if not r0_5.PartRegionStoreData or not r0_5.NewDataReceived then
    r0_5.CurRegionDeliverDatas = {}
    r0_5.CurRegionDeliver = {}
    r0_5.CurRegionDeliverNew:Clear()
    r0_5.CurRegionDeliverDatasNew:Clear()
    return 
  end
  r0_5.NewDataReceived = false
  for r5_5, r6_5 in pairs(r0_5.PartRegionStoreData) do
    for r11_5, r12_5 in pairs(r6_5) do
      for r17_5, r18_5 in pairs(r12_5) do
        for r23_5, r24_5 in pairs(r18_5) do
          if r0_5.DataLibrary.RegionSSDatas[r17_5] == nil then
            r0_5.DataLibrary.RegionSSDatas[r17_5] = {}
          end
          r24_5.ExtraRegionInfo = r24_5.ExtraRegionInfo and {}
          if URuntimeCommonFunctionLibrary.UseCppRegionData(r0_5) then
            r0_5.DataLibrary:AddUnitRegionCacheData(r24_5)
            r0_5:InitSSDataFromServer(r24_5)
          else
            r0_5.DataLibrary:SetUnitRegionCacheData(r5_5, r11_5, r17_5, r23_5, r24_5)
            r0_5.DataLibrary:AddRegionSSDatas(r24_5)
          end
        end
        -- close: r19_5
      end
      -- close: r13_5
    end
    -- close: r7_5
  end
  -- close: r1_5
  if UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, URegionDataMgrSubsystem:StaticClass()) then
  end
  GWorld.UploadQuestChainData = false
end
function r0_0.InitSSDataFromServer(r0_6, r1_6)
  -- line: [120, 152] id: 6
  r0_6:InitSubRegionInfoByData(r1_6)
  if r1_6.ManualItemId ~= nil and r1_6.ManualItemId > 0 then
    return 
  end
  if r1_6.IsDead and r0_6:CheckRegionDataNeedDead(r1_6) then
    r0_6.DataLibrary:SetUnitRegionCacheData(r1_6.RegionDataType, r1_6.SubRegionId, r1_6.LevelName, r1_6.WorldRegionEid, r1_6)
    return 
  end
  r0_6.LastState = r1_6.State
  r0_6.LastBornLocation = r1_6.BornLocation
  local r2_6 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if r1_6.CreatorId ~= nil and r1_6.CreatorId > 0 then
    if not r1_6.RandomRuleId or r1_6.RandomRuleId == 0 then
      if r2_6.StaticCreatorMap:Find(r1_6.CreatorId) then
        r0_6:InitStaticCreatorParams(r1_6.CreatorId, r1_6.QuestChainId, r1_6.ExtraRegionInfo.SpecialQuestId, r1_6.ExtraRegionInfo.DynQuestId)
        r0_6:InitSSDataFromServer_StaticCreator(r1_6.WorldRegionEid, r1_6.LevelName, r1_6.CreatorId)
      else
        GWorld.logger.error("区域数据初始化没有找到StaticCreator!! 已跳过：" .. r1_6.CreatorId)
      end
    end
  elseif r1_6.RandomRuleId and r1_6.RandomRuleId > 0 then
    local r3_6 = r1_6.BornLocation
    if not r3_6 then
      r3_6 = {}
      r3_6.X = 0
      r3_6.Y = 0
      r3_6.Z = 0
    end
    r1_6.BornLocation = r3_6
    r0_6:InitSSDataFromServer_RandomCreator(r1_6.WorldRegionEid, r1_6.LevelName, r1_6.RandomCreatorId, r1_6.RandomRuleId, r1_6.RandomTableId, r1_6.RandomIdxInRule, r1_6.BornLocation.X, r1_6.BornLocation.Y, r1_6.BornLocation.Z)
  else
    local r3_6 = r1_6.BornLocation
    if not r3_6 then
      r3_6 = {}
      r3_6.X = 0
      r3_6.Y = 0
      r3_6.Z = 0
    end
    r1_6.BornLocation = r3_6
    r3_6 = FVector(r1_6.BornLocation.X, r1_6.BornLocation.Y, r1_6.BornLocation.Z)
    local r4_6 = r1_6.Rotation
    if not r4_6 then
      r4_6 = {}
      r4_6.Pitch = 0
      r4_6.Yaw = 0
      r4_6.Roll = 0
    end
    r1_6.Rotation = r4_6
    r0_6:InitSSDataFromServer_Raw(r1_6.WorldRegionEid, r1_6.LevelName, r1_6.UnitType, r1_6.UnitId, r3_6, FRotator(r1_6.Rotation.Pitch, r1_6.Rotation.Yaw, r1_6.Rotation.Roll), r1_6.RegionDataType)
  end
end
function r0_0.CheckRegionDataNeedDead(r0_7, r1_7)
  -- line: [154, 165] id: 7
  if r1_7.RegionDataType == 1 and r1_7.UnitType == "Mechanism" and r1_7.UnitId then
    if not r0_7.MechanismNoDeadType then
      r0_7.MechanismNoDeadType = {
        "HardBossOpenMechanism",
        "TeleportMechanism",
        "Delivery"
      }
    end
    local r2_7 = DataMgr.Mechanism[r1_7.UnitId]
    if r2_7 then
      return not CommonUtils.HasValue(r0_7.MechanismNoDeadType, r2_7.UnitRealType)
    end
  end
  return true
end
function r0_0.InitStaticCreatorParams(r0_8, r1_8, r2_8, r3_8, r4_8)
  -- line: [167, 179] id: 8
  local r5_8 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if not r5_8 then
    return 
  end
  local r6_8 = r5_8.StaticCreatorMap:FindRef(r1_8)
  if not r6_8 then
    return 
  end
  r6_8:SetQuestChainId(r2_8)
  r6_8.ExtraRegionInfo.SpecialQuestId = r3_8
  r6_8.ExtraRegionInfo.DynQuestId = r4_8
end
function r0_0.InitSSDataFromServer_StaticCreator_Lua(r0_9, r1_9, r2_9)
  -- line: [181, 190] id: 9
  local r3_9 = AEventMgr.CreateUnitContext()
  r3_9.IntParams:Add("CreatorId", r2_9)
  r3_9.IntParams:Add("Type", 4)
  r3_9:AddLuaTable("State", r0_9.LastState)
  r0_9:InitRegionDataTable(r1_9, r3_9)
  r0_9.LastState = nil
  r0_9.LastBornLocation = nil
  r0_9.DataPool:GetRegionEntityDataNoCopy(r1_9)
end
function r0_0.InitSSDataFromServer_RandomCreator_Lua(r0_10, r1_10, r2_10, r3_10, r4_10, r5_10, r6_10)
  -- line: [192, 207] id: 10
  UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance).RandomActorManager:GetCreator(r3_10, r6_10, r5_10)
  local r8_10 = AEventMgr.CreateUnitContext()
  r8_10.IntParams:Add("RandomCreatorId", r2_10)
  r8_10.IntParams:Add("RandomRuleId", r3_10)
  r8_10.IntParams:Add("RandomTableId", r4_10)
  r8_10.IntParams:Add("RandomIdxInRule", r5_10)
  r8_10.VectorParams:Add("BornLocation", FVector(r0_10.LastBornLocation.X, r0_10.LastBornLocation.Y, r0_10.LastBornLocation.Z))
  r8_10.IntParams:Add("Type", 4)
  r8_10:AddLuaTable("State", r0_10.LastState)
  r0_10:InitRegionDataTable(r1_10, r8_10)
  r0_10.LastState = nil
  r0_10.LastBornLocation = nil
  r0_10.DataPool:GetRegionEntityDataNoCopy(r1_10)
end
function r0_0.InitSSDataFromServer_Raw_Lua(r0_11, r1_11, r2_11, r3_11, r4_11, r5_11, r6_11)
  -- line: [209, 222] id: 11
  local r7_11 = AEventMgr.CreateUnitContext()
  r7_11.UnitId = r3_11
  r7_11.UnitType = r2_11
  r7_11.Loc = r4_11
  r7_11.Rotation = r5_11
  r7_11.IntParams:Add("RegionDataType", r6_11)
  r7_11.IntParams:Add("Type", 4)
  r7_11:AddLuaTable("State", r0_11.LastState)
  r0_11:InitRegionDataTable(r1_11, r7_11)
  r0_11.LastState = nil
  r0_11.LastBornLocation = nil
  r0_11.DataPool:GetRegionEntityDataNoCopy(r1_11)
end
function r0_0.InitCacheByPrepareRegion(r0_12)
  -- line: [228, 232] id: 12
  r0_12:InitRegionDeliverMechanismCache()
  r0_12:InitSpawnActorDataCache()
  r0_12:InitCretorDataCache()
end
function r0_0.InitCretorDataCache(r0_13)
  -- line: [234, 238] id: 13
  r0_13.StaticIdControlCache = {}
  r0_13.RandomIdControlCache = {}
  r0_13:ClearControlCache()
end
function r0_0.InitRegionDeliverMechanismCache(r0_14)
  -- line: [241, 250] id: 14
  if UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance) then
    r0_14:TryActiveDefaultDeliver()
  end
  r0_14.CurRegionDeliverNew:Clear()
  r0_14.CurRegionDeliverDatasNew:Clear()
  r0_14:InitRegionDeliverMechanismCacheCpp(GWorld:GetAvatar():GetSubRegionId2RegionId())
end
function r0_0.InitSpawnActorDataCache(r0_15)
  -- line: [253, 255] id: 15
  r0_15.ManualDatas = {}
end
function r0_0.AddManualDataToCache(r0_16, r1_16, r2_16)
  -- line: [256, 261] id: 16
  if not r1_16 or not r2_16 or r1_16 <= 0 then
    return 
  end
  if not r0_16:IsExistManualItemId(r1_16) and r1_16 > 0 then
    r0_16.ManualDatas[r1_16] = r2_16
  end
end
function r0_0.IsExistManualItemId(r0_17, r1_17)
  -- line: [263, 267] id: 17
  if not r1_17 then
    return false
  end
  if r0_17.ManualDatas[r1_17] then
    return true
  end
  return false
end
function r0_0.InitRegionInfo(r0_18)
  -- line: [273, 298] id: 18
  GWorld.UploadQuestChainData = true
  r0_18.ReadyRegionRecover = true
  r0_18.LoadSubRegionCache = {}
  local r1_18 = GWorld:GetAvatar()
  local r2_18 = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if not r2_18:IsInRegion() then
    return 
  end
  if r2_18:GetLevelLoader() and GWorld:GetWorldRegionState() and r1_18:CheckCurrentSubRegion() then
    r0_18:RecoverRegionBpData(r1_18, r1_18.CurrenRegionId)
  end
  GWorld.UploadQuestChainData = false
  if not r0_18.Inited then
    r0_18:OnInitRecoverRegionData(false)
  end
end
function r0_0.RecoverRegionBpData(r0_19, r1_19, r2_19)
  -- line: [301, 321] id: 19
  local r3_19 = r1_19:GetSubRegionId2RegionId(r2_19)
  local r4_19 = DataMgr.Region[r3_19]
  if not r4_19 then
    DebugPrint("Error! RecoverRegionBpData 找不到区域数据", r3_19)
    return 
  end
  for r10_19, r11_19 in ipairs({
    1,
    2,
    3,
    5,
    6,
    7
  }) do
    for r16_19, r17_19 in ipairs(r4_19.IsRandom) do
      r0_19:RecoverSubRegionDataCache(r1_19, r17_19, r10_19, r0_19.DataLibrary:GetRegionCacheDatasByIdType(r10_19))
    end
    -- close: r12_19
  end
  -- close: r6_19
  for r10_19, r11_19 in ipairs(r4_19.IsRandom) do
    r0_19:RecoverRegionRarelyGroupDataCache(r1_19, r11_19)
  end
  -- close: r6_19
end
function r0_0.RecoverRegionRarelyGroupDataCache(r0_20, r1_20, r2_20)
  -- line: [325, 340] id: 20
  if not r1_20 then
    return 
  end
  local r3_20 = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  for r8_20, r9_20 in pairs(r1_20.Explores:Keys()) do
    local r10_20 = r3_20.EMGameState.ExploreGroupMap:FindRef(r9_20)
    local r11_20 = r1_20.Explores[r9_20]
    if IsValid(r10_20) and r11_20 and not r11_20:IsInActive() and r11_20.RegionId == r2_20 then
      r10_20:RealSetExploreGroupStatus(r11_20:GetState())
      for r16_20, r17_20 in pairs(r11_20.ExploreData.Props) do
        r10_20[r16_20] = r17_20
      end
      -- close: r12_20
    end
  end
  -- close: r4_20
end
function r0_0.InitSubRegionInfoByData(r0_21, r1_21)
  -- line: [342, 397] id: 21
  local r2_21 = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if r1_21.ManualItemId and r1_21.ManualItemId > 0 then
    DebugPrint("RecoverSubRegionDataCache 恢复这些manualitem", r1_21.ManualItemId, r1_21.SubRegionId, r1_21.UnitType, r1_21.UnitId)
    local r3_21 = r2_21.BPBornRegionActor:FindRef(r1_21.ManualItemId)
    if r3_21 then
      if r1_21.IsDead and r3_21:GetUnitRealType() == "RockTrap" then
        if r3_21.EMActorDestroy then
          r3_21:EMActorDestroy(EDestroyReason.RecoverSubRegionDataCacheButBpBornHasAlreadyDead)
        else
          DebugPrint("Error! RecoverSubRegionDataCache 此ACTOR 蓝图生成，但是没有销毁方法", r3_21)
        end
      else
        local r4_21 = AEventMgr.CreateUnitContext()
        r4_21.UnitId = r1_21.UnitId
        r4_21.UnitType = r1_21.UnitType
        r4_21:AddLuaTable("State", r1_21.State)
        r4_21.IntParams:Add("RegionDataType", r1_21.RegionDataType)
        r4_21.NameParams:Add("WorldRegionEid", r1_21.WorldRegionEid)
        r4_21.IntParams:Add("SubRegionId", r1_21.SubRegionId)
        r4_21.VectorParams:Add("BornLoc", r3_21:K2_GetActorLocation())
        r3_21:RegisterInfoNew(r4_21)
      end
      r0_21:AddManualDataToCache(r1_21.ManualItemId, r1_21.WorldRegionEid)
    else
      DebugPrint("Error! 区域，存在一个蓝图生成的actor，但是当前场景内未找到")
    end
  elseif r1_21.CreatorId then
    local r3_21 = AEventMgr.CreateUnitContext()
    r3_21.IntParams:Add("CreatorId", r1_21.CreatorId)
    r3_21.NameParams:Add("WorldRegionEid", r1_21.WorldRegionEid)
    r3_21.IntParams:Add("SubRegionId", r1_21.SubRegionId)
    r0_21:AddCretorActiveCacheNew(r3_21)
    r0_21:InitStaticCreatorData(r1_21)
  elseif r1_21.RandomRuleId then
    local r4_21 = r2_21:GetLevelLoader():GetLevelIdByLocation(FVector(r1_21.BornLocation.X, r1_21.BornLocation.Y, r1_21.BornLocation.Z))
    if r4_21 == "None" or r4_21 == "" then
      DebugPrint("RandomCreator中不存在如下数据： Location = ", r1_21.BornLocation.X, r1_21.BornLocation.Y, r1_21.BornLocation.Z)
    end
    r1_21.RandomCreatorId = r2_21.RandomActorManager:GetParamActorId(r1_21.RandomRuleId, r4_21, r1_21.RandomIdxInRule)
    local r6_21 = AEventMgr.CreateUnitContext()
    r6_21.IntParams:Add("RandomCreatorId", r1_21.RandomCreatorId)
    r6_21.IntParams:Add("RandomRuleId", r1_21.RandomRuleId)
    r6_21.NameParams:Add("WorldRegionEid", r1_21.WorldRegionEid)
    r6_21.IntParams:Add("SubRegionId", r1_21.SubRegionId)
    r0_21:AddCretorActiveCacheNew(r6_21)
  end
end
function r0_0.RecoverSubRegionDataCache(r0_22, r1_22, r2_22, r3_22, r4_22)
  -- line: [399, 418] id: 22
  if not r4_22 then
    return 
  end
  if URuntimeCommonFunctionLibrary.UseCppRegionData(GWorld.GameInstance) then
    return 
  end
  local r5_22 = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local r6_22 = r4_22[r2_22]
  if not r6_22 then
    return 
  end
  for r11_22, r12_22 in pairs(r6_22) do
    for r17_22, r18_22 in pairs(r12_22) do
      r0_22:InitSubRegionInfoByData(r18_22)
    end
    -- close: r13_22
  end
  -- close: r7_22
end
function r0_0.InitStaticCreatorData(r0_23, r1_23)
  -- line: [421, 434] id: 23
  local r2_23 = UE4.UGameplayStatics.GetGameState(r0_23)
  if not r2_23 then
    return 
  end
  local r3_23 = r2_23.StaticCreatorMap:FindRef(r1_23.CreatorId)
  if not IsValid(r3_23) then
    return 
  end
  if not r1_23.WorldRegionEid or r1_23.WorldRegionEid == "" then
    return 
  end
  r3_23.ChildSerializedWorldRegionEids:Add(r1_23.WorldRegionEid)
end
function r0_0.OnInitRecoverRegionData(r0_24, r1_24)
  -- line: [442, 473] id: 24
  local r2_24 = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if not r0_24.ReadyRegionRecover then
    DebugPrint("ZJT_ Recover Region Data Failer !!!")
    return 
  end
  local r3_24 = GWorld:GetAvatar()
  if not r3_24 then
    return 
  end
  local r4_24 = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local r5_24 = r4_24:GetLevelLoader()
  if r5_24 and GWorld:GetWorldRegionState() and r3_24:CheckCurrentSubRegion() then
    if not URuntimeCommonFunctionLibrary.IsWorldCompositionEnabled(r0_24) then
      r5_24:ArtLevelBindEvent(r1_24)
    elseif not r1_24 then
      r4_24:InitWCEvent()
    else
      r4_24:TriggerLoadedEvent()
    end
  end
  r5_24:OpenInitSuit()
  r0_24.Inited = true
end
return r0_0
