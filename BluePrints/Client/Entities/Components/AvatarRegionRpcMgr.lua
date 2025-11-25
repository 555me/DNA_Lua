local r0_0 = require("pb")
local r1_0 = require("BluePrints.Client.CustomTypes.Region").LevelBaseDataAttrDict
local r2_0, r3_0 = pcall(require, "utf8")
return {
  ReceiveSynchronizedDataFromServer = function(r0_1, r1_1)
    -- line: [7, 33] id: 1
    local r2_1 = r0_1:GetSubRegionId2RegionId()
    local r3_1 = DataMgr.Region[r2_1]
    if not r3_1 then
      r0_1.logger.error("ZJT_ ReceiveSynchronizedDataFromServer 数据错误 ", r2_1, r0_1:GetCurrentRegionId())
      PrintTable({
        RegionDatas = r1_1,
      }, 10)
      return 
    end
    for r8_1, r9_1 in pairs(CommonConst.RegionDataType) do
      local r10_1 = r1_1[r8_1]
      if r10_1 then
        for r15_1, r16_1 in ipairs(r3_1.IsRandom) do
          local r17_1 = r10_1[tostring(r16_1)]
          if r17_1 then
            local r18_1 = r0_0.decode(".LevelBaseDataAttrDict", r17_1)
            if r18_1 then
              local r19_1 = r1_0:proto_load(r18_1)
              r10_1[tostring(r16_1)] = r19_1:save_dump(r19_1)
            end
          end
        end
        -- close: r11_1
      end
    end
    -- close: r4_1
    PrintTable({
      DecodeRegionDatas = r1_1,
    }, 10)
    UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, URegionDataMgrSubsystem:StaticClass()):SyncPartRegionDataFromServer(r1_1)
  end,
  ReceiveSyncAllRegionDataFromServer = function(r0_2, r1_2)
    -- line: [36, 39] id: 2
    UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, URegionDataMgrSubsystem:StaticClass()):SyncFullRegionStoreDataFromServer(r1_2)
  end,
  GMReceiveSynchronizedDataFromServer = function(r0_3, r1_3, r2_3)
    -- line: [46, 55] id: 3
    print(_G.LogTag, "GMReceiveSynchronizedDataFromServer")
    local r3_3 = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, URegionDataMgrSubsystem:StaticClass())
    if r1_3 == CommonConst.GMRegionTargetType.AllData then
      r3_3:GMTest_PrintServerRegionData(r2_3)
    elseif r1_3 == CommonConst.GMRegionTargetType.AllQuestData then
      r3_3:GMTest_PrintServerQuestChainData(r2_3)
    end
  end,
  GMC2S_RequestSynchronizedDataFromServer = function(r0_4, r1_4, r2_4)
    -- line: [60, 64] id: 4
    if not r2_4 then
      r2_4 = {}
    end
    print(_G.LogTag, "GMC2S_RequestSynchronizedDataFromServer")
    r0_4:CallServerMethod("GMHandleQuestDatasEnterRegion", r1_4, r2_4)
  end,
  GMHandleSyncAllRegionDataToClient = function(r0_5, r1_5)
    -- line: [66, 68] id: 5
    r0_5:CallServer("GMHandleSyncAllRegionDataToClient", r1_5)
  end,
  EnterRegion = function(r0_6, r1_6, r2_6, r3_6, r4_6, r5_6)
    -- line: [78, 87] id: 6
    local r6_6, r7_6 = r0_6:PreHandleEnterRegion(r1_6, r2_6, r3_6, r5_6)
    if not r6_6 then
      return 
    end
    if not r4_6 then
      r4_6 = false
    end
    r0_6:CallServer("EnterRegion", function(r0_7, r1_7)
      -- line: [82, 85] id: 7
      if not ErrorCode:Check(r0_7) then
        return 
      end
      r0_6:RealHandleEnterRegion(r1_6, r5_6, r7_6)
    end, r1_6, r2_6, r3_6, r4_6)
  end,
  RealHandleEnterRegion = function(r0_8, r1_8, r2_8, r3_8)
    -- line: [89, 99] id: 8
    if r2_8 then
      UIManager(r0_8):HideCommonBlackScreen(r3_8)
      UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0):RemoveDisableInputTag("CameraLookToTarget")
      local r5_8 = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, USojournsGameInstanceSubsystem)
      if r5_8 then
        r5_8:SetInvitationRegionId(r1_8)
      end
    end
  end,
  SetDisableInputTag = function(r0_9, r1_9, r2_9, r3_9)
    -- line: [101, 106] id: 9
    if r1_9 then
      UIManager(r0_9):ShowCommonBlackScreen(r3_9)
      r2_9:AddDisableInputTag("CameraLookToTarget")
    end
  end,
  SetTryActiveDefaultDeliver = function(r0_10, r1_10)
    -- line: [108, 118] id: 10
    local r2_10 = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
    if not r2_10 then
      return 
    end
    if r1_10 == CommonConst.EnterRegionType.FirstRegion then
      return 
    end
    if r1_10 == CommonConst.EnterRegionType.Recover then
      return 
    end
    r2_10:GetRegionDataMgrSubSystem().bTryActiveDefaultDeliver = true
  end,
  CheckRepeatEnterRegion = function(r0_11, r1_11)
    -- line: [120, 126] id: 11
    if r0_11:GetSubRegionId2RegionId(r1_11) == r0_11:GetSubRegionId2RegionId() and r0_11:IsInBigWorld() then
      r0_11.logger.error("ZJT_ 同区域传送请走关卡加卸载 ", r1_11, r0_11:GetCurrentRegionId())
      return false
    end
    return true
  end,
  PreHandleEnterRegion = function(r0_12, r1_12, r2_12, r3_12, r4_12)
    -- line: [128, 140] id: 12
    local r5_12 = nil
    local r6_12 = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
    if not r0_12:CheckRepeatEnterRegion(r1_12) then
      return false, r5_12
    end
    r5_12 = {
      BlackScreenHandle = "Invitation",
      InAnimationObj = r0_12,
      OutAnimationObj = r0_12,
    }
    r0_12:SetDisableInputTag(r4_12, r6_12, r5_12)
    if not r0_12:CheckRegionId(r1_12) then
      return false, r5_12
    end
    GWorld:OpenWorldRegionState()
    r0_12:SetTryActiveDefaultDeliver(r3_12)
    r0_12.StartIndex = tonumber(r2_12) and 1
    return true, r5_12
  end,
  RecoverRegion_ExitDungeon = function(r0_13)
    -- line: [144, 153] id: 13
    local r1_13, r2_13 = r0_13:PreHandleEnterRegion(r0_13:GetCurrentRegionId(), r0_13.StartIndex, CommonConst.EnterRegionType.Recover)
    if not r1_13 then
      return 
    end
    r0_13:CallServer("RecoverRegion_ExitDungeon", function(r0_14, r1_14)
      -- line: [147, 151] id: 14
      if not ErrorCode:Check(r0_14) then
        return 
      end
      EventManager:FireEvent(EventID.OnExitDungeon)
      r0_13:RealHandleEnterRegion(r1_14, nil, r2_13)
    end)
  end,
  SkipRegion = function(r0_15, r1_15)
    -- line: [156, 169] id: 15
    local r2_15 = r0_15.CurrentRegionId
    local function r3_15(r0_16)
      -- line: [158, 166] id: 16
      if not r0_15:CheckRegionErrorCode(r0_16) then
        if not r0_15:CheckRegionErrorCode(r0_16, ErrorCode.RET_REGION_BASEDATA_WORLDREGIONEID_REPEAT) and not r0_15:CheckRegionErrorCode(r0_16, ErrorCode.RET_CURRENT_TARGET_REGIOINID_EQUAL) then
          GWorld.logger.debug("SkipRegion  " .. "ErrorCode:" .. r0_16 .. "  TargetRegionId:" .. r1_15 .. " CurrentRegionId:" .. r0_15.CurrentRegionId .. ", 详细数据见Log")
        end
        return 
      end
      r0_15:RealHandleSkipRegion(r2_15, r0_15:GetCurrentRegionId())
    end
    r0_15:GetCurrentSafeAndSaveLocation()
    r0_15:CallServer("SkipRegion", r3_15, r1_15, r0_15.LastRegionData.RegionId, r0_15.LastRegionData:GetLocation(), r0_15.LastRegionData:GetRotation())
  end,
  RealHandleSkipRegion = function(r0_17, r1_17)
    -- line: [171, 181] id: 17
    r0_17:ExeRegionSkipCallbck(r1_17)
    r0_17:ExeRegionSkipCallbck(r0_17:GetCurrentRegionId())
    EventManager:FireEvent(EventID.OnSkipRegion, r0_17:GetCurrentRegionId())
    local r2_17 = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
    if r2_17 then
      r2_17:OnEnteredNewSubRegion()
    end
    require("BluePrints.UI.TaskPanel.TaskUtils"):UpdatePlayerSubRegionIdInfo(r0_17.CurrentRegionId)
  end,
  TrySpawnSpecialMonster = function(r0_18, r1_18, r2_18)
    -- line: [183, 207] id: 18
    local r3_18 = r2_18 and function(r0_19)
      -- line: [184, 186] id: 19
      DebugPrint("TrySpawnSpecialMonster ", ErrorCode:Name(r0_19))
    end
    local r4_18 = DataMgr.SpecialMonsterSpawn[r1_18]
    if not r4_18 then
      r3_18(ErrorCode.RET_REGION_SPECIAL_MONSTER_RULE_NOT_EXIST)
      return 
    end
    if r4_18.WeeklyLimit <= (r0_18.RegionSpecialMonsterCounter[r1_18] and 0) then
      r3_18(ErrorCode.RET_REGION_SPECIAL_MONSTER_MAX_COUNT)
      return 
    end
    if r4_18.SpawnRegion and r0_18.CurrentRegionId ~= r4_18.SpawnRegion then
      DebugPrint("[TrySpawnSpecialMonster] RET_REGION_SPECIAL_MONSTER_NOT_IN_REGION ", r0_18.CurrentRegionId, r4_18.SpawnRegion)
      r3_18(ErrorCode.RET_REGION_SPECIAL_MONSTER_NOT_IN_REGION)
      return 
    end
    r0_18:CallServer("TrySpawnSpecialMonster", r3_18 and function(r0_20)
      -- line: [204, 206] id: 20
      DebugPrint("TrySpawnSpecialMonster ", ErrorCode:Name(r0_20))
    end, r1_18)
  end,
  RegionActorUpdate = function(r0_21, r1_21, r2_21, r3_21, r4_21)
    -- line: [209, 241] id: 21
    if CommonUtils.HasValue({
      ERegionDataType.RDT_QuestData,
      ERegionDataType.RDT_None,
      ERegionDataType.RDT_HardBossData,
      ERegionDataType.RDT_QuestCommonData
    }, r1_21.RegionDataType) then
      DebugPrint("RegionLog:  Actor更新属性,当前类型为：" .. r1_21.RegionDataType .. "  不做任何处理, WorldRegionEid:" .. tostring(r1_21.WorldRegionEid))
      return 
    end
    local r6_21 = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
    local r7_21, r8_21 = r0_21:AvatarUpdateUnitRegionData(r1_21, r2_21, r3_21)
    if not r0_21:CheckRegionErrorCode(r7_21) then
      DebugPrint("RegionLog:  Actor更新属性,当前类型为：" .. r1_21.RegionDataType .. "  WorldRegionEid:" .. tostring(r1_21.WorldRegionEid) .. "    更新数据失败，Ret：" .. r7_21)
      return 
    end
    local function r9_21(r0_22)
      -- line: [229, 235] id: 22
      if r0_22 ~= ErrorCode.RET_SUCCESS and r0_22 ~= ErrorCode.RET_REGION_BASEDATA_WORLDREGIONEID_REPEAT then
        GWorld.logger.error("UpdateRegionActorData " .. "ErrorCode:" .. r0_22 .. " WorldRegionEid:" .. r1_21.WorldRegionEid .. " NewSubRegionId:" .. r2_21 .. " RegionDataType:" .. r1_21.RegionDataType .. " NewLevelName:" .. r3_21)
        PrintTable(r4_21)
      end
    end
    if r0_21.CombineAdd and r0_21:TryUpdateCombineRegionData(r1_21, r4_21) then
      return 
    end
    r0_21:CallServer("UpdateRegionActorData", r9_21, r1_21.WorldRegionEid, r2_21, r1_21.RegionDataType, r4_21, r3_21)
  end,
  CheckRegionErrorCode = function(r0_23, r1_23, r2_23)
    -- line: [243, 246] id: 23
    if not r2_23 then
      r2_23 = ErrorCode.RET_SUCCESS
    end
    return r1_23 == r2_23
  end,
  C2SReigonActorDead = function(r0_24, r1_24, r2_24, r3_24)
    -- line: [253, 263] id: 24
    r0_24:CallServer("DeadRegionActorData", function(r0_25)
      -- line: [255, 260] id: 25
      if r0_25 ~= ErrorCode.RET_SUCCESS and r0_25 ~= ErrorCode.RET_REGION_BASEDATA_WORLDREGIONEID_REPEAT then
        GWorld.logger.error("DeadRegionActorData" .. " ErrorCode" .. r0_25 .. " WorldRegionEid:" .. r1_24.WorldRegionEid .. " NewSubRegionId:" .. r2_24 .. " RegionDataType:" .. r1_24.RegionDataType .. " NewLevelName:" .. r3_24)
      end
    end, r1_24.WorldRegionEid, r2_24, r1_24.RegionDataType, r3_24)
  end,
  RegionActorDead = function(r0_26, r1_26, r2_26, r3_26, r4_26)
    -- line: [265, 345] id: 26
    local r5_26 = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
    local r6_26 = {
      ERegionDataType.RDT_QuestData,
      ERegionDataType.RDT_None,
      ERegionDataType.RDT_HardBossData,
      ERegionDataType.RDT_QuestCommonData
    }
    if r2_26 == EDestroyReason.LevelUnloadedSaveGame or r2_26 == EDestroyReason.LevelNotExsit then
      DebugPrint("RegionLog:  WC导致Actor销毁,当前类型为：" .. r1_26.RegionDataType .. "  WorldRegionEid:" .. r1_26.WorldRegionEid)
      r5_26:GetRegionDataMgrSubSystem():AddSSData(r1_26.WorldRegionEid)
      return 
    end
    if r2_26 == EDestroyReason.HardBossClear and r1_26.RegionDataType ~= ERegionDataType.RDT_HardBossData then
      DebugPrint("RegionLog:  HardBossClear导致Actor销毁,当前类型为：" .. r1_26.RegionDataType .. "  WorldRegionEid:" .. r1_26.WorldRegionEid)
      if r1_26.CheckHardBossNeedSnapShot and r1_26:CheckHardBossNeedSnapShot() then
        r5_26:GetRegionDataMgrSubSystem():AddSSData(r1_26.WorldRegionEid, true)
      end
      return 
    end
    if r2_26 == EDestroyReason.SepcialQuestStart then
      DebugPrint("RegionLog:  SepcialQuestStart导致Actor销毁,当前类型为：" .. r1_26.RegionDataType .. "  WorldRegionEid:" .. r1_26.WorldRegionEid)
      r5_26:GetRegionDataMgrSubSystem():AddSSData(r1_26.WorldRegionEid, true)
      return 
    end
    r5_26:GetRegionDataMgrSubSystem():OnActorDead(r1_26)
    if CommonUtils.HasValue(r6_26, r1_26.RegionDataType) then
      DebugPrint("RegionLog:  Actor销毁,当前类型为：" .. r1_26.RegionDataType .. "  不做任何处理, WorldRegionEid:" .. tostring(r1_26.WorldRegionEid))
      return 
    end
    if r2_26 == EDestroyReason.RegionExploreGroup then
      return 
    end
    if r5_26:GetRegionDataMgrSubSystem().DataLibrary:SetUnitIsDeadByWorldRegionEid(r1_26.WorldRegionEid) then
      if r1_26.UnitType == "Drop" and r1_26.UseEffectType == "GetResource" then
        return 
      else
        r0_26:C2SReigonActorDead(r1_26, r3_26, r4_26)
      end
    end
  end,
  AvatarUpdateUnitRegionData = function(r0_27, r1_27)
    -- line: [347, 356] id: 27
    local r3_27 = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance):GetRegionDataMgrSubSystem():UpdateUnitRegionCacheDataByActor(r1_27)
    if not r3_27 then
      return ErrorCode.RET_REGION_NOT_EXIST_CACHE_REGIONBASEDATA, nil
    end
    return ErrorCode.RET_SUCCESS, r3_27
  end,
  AvatarC2SAddRegionActorData = function(r0_28, r1_28)
    -- line: [358, 378] id: 28
    if r1_28.RegionDataType == ERegionDataType.RDT_QuestCommonData then
      DebugPrint("AddRegionActorData Fail, RegionDataType:RDT_QuestCommonData, WorldRegionEid:", r1_28.WorldRegionEid)
      return 
    end
    if r0_28.CombineAdd then
      table.insert(r0_28.CombineAddDatas, r1_28)
      return 
    end
    r0_28:RegionDataValidCheck(r1_28)
    DebugPrint("ZJT_  RegionDataMgr: Client  RegionAddDataByUnit", r1_28.ManualItemId, r1_28.WorldRegionEid)
    r0_28:CallServer("AddRegionActorData", function(r0_29)
      -- line: [369, 376] id: 29
      if r0_29 ~= ErrorCode.RET_SUCCESS and r0_29 ~= ErrorCode.RET_REGION_BASEDATA_WORLDREGIONEID_REPEAT then
        GWorld.logger.error("AddRegionActorData " .. "ErrorCode:" .. r0_29 .. " RegionDataType:" .. r1_28.RegionDataType .. " WorldRegionEid:" .. r1_28.WorldRegionEid .. " ManualItemId:" .. tostring((r1_28.ManualItemId and -1)))
        PrintTable(r1_28)
      end
      DebugPrint("zjt_ RegionDataMgr: CallServer  RegionAddDataByUnit", r0_29, r1_28.ManualItemId, r1_28.WorldRegionEid)
    end, r1_28.RegionDataType, r1_28)
  end,
  AddAutoRegionActorDatas = function(r0_30, r1_30)
    -- line: [380, 395] id: 30
    if next(r1_30) == nil then
      return 
    end
    for r6_30, r7_30 in pairs(r1_30) do
      r0_30:RegionDataValidCheck(r7_30)
    end
    -- close: r2_30
    r0_30:CallServer("AddAutoRegionActorDatas", function(r0_31)
      -- line: [387, 393] id: 31
      if not r0_30:CheckRegionErrorCode(r0_31) then
        r0_30.logger.error("ZJT_ AddAutoRegionActorDatas ServerCallClient Failed ", r0_31)
      else
        r0_30.logger.debug("ZJT_ AddAutoRegionActorDatas ServerCallClient Success ", r0_31)
      end
    end, r1_30)
  end,
  ResetRarelyStaticCreator = function(r0_32, r1_32, r2_32, r3_32, r4_32)
    -- line: [398, 409] id: 32
    r0_32:CallServer("ResetRarelyStaticCreator", function(r0_33)
      -- line: [399, 407] id: 33
      if r0_32:CheckRegionErrorCode(r0_33) then
        r2_32(r1_32, r3_32, r4_32)
      end
    end, r1_32)
  end,
  AvatarC2SAddRandomRegionActorData = function(r0_34, r1_34)
    -- line: [410, 419] id: 34
    if not r1_34 or type(r1_34) ~= "table" then
      return 
    end
    r0_34:CallServer("AddRandomCreatorRegionDatas", function(r0_35)
      -- line: [412, 417] id: 35
      if r0_35 ~= ErrorCode.RET_SUCCESS and r0_35 ~= ErrorCode.RET_REGION_BASEDATA_WORLDREGIONEID_REPEAT then
        GWorld.logger.error("AddRandomCreatorRegionDatas " .. "ErrorCode:" .. r0_35)
        PrintTable(r1_34)
      end
    end, r1_34)
  end,
  UpdateRegionDataStateByCreatorId = function(r0_36, r1_36, r2_36)
    -- line: [421, 443] id: 36
    local r3_36 = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
    if not r3_36.GetRegionDataMgrSubSystem then
      return 
    end
    local r4_36 = r3_36:GetRegionDataMgrSubSystem():UpdateRegionDataStateCacheByCreatorId(r1_36, r2_36)
    if not r4_36 or #r4_36 == 0 then
      return 
    end
    local function r5_36(r0_37)
      -- line: [430, 439] id: 37
      if r0_37 ~= ErrorCode.RET_SUCCESS and r0_37 ~= ErrorCode.RET_REGION_BASEDATA_WORLDREGIONEID_REPEAT then
        GWorld.logger.error("UpdateRegionActorData" .. " ErrorCode:" .. r0_37)
        for r5_37, r6_37 in pairs(r4_36) do
          GWorld.logger.error(" WorldRegionEid:" .. r6_37.WorldRegionEid .. " SubRegionId:" .. r6_37.SubRegionId .. " RegionDataType:" .. r6_37.RegionDataType .. " LevelName" .. r6_37.LevelName)
        end
        -- close: r1_37
        PrintTable(r2_36)
      end
    end
    for r10_36, r11_36 in pairs(r4_36) do
      r0_36:CallServer("UpdateRegionActorData", r5_36, r11_36.WorldRegionEid, r11_36.SubRegionId, r11_36.RegionDataType, r2_36, r11_36.LevelName)
    end
    -- close: r6_36
  end,
  UpdatePhantomRegionActorData = function(r0_38, r1_38, r2_38)
    -- line: [445, 450] id: 38
    r0_38:CallServer("UpdatePhantomRegionActorData", function(r0_39)
      -- line: [446, 448] id: 39
      r0_38.logger.debug("ZJT_ UpdatePhantomRegionActorData ", r0_39)
    end, r1_38.WorldRegionEid, r1_38.SubRegionId, r1_38.RegionDataType, r1_38.LevelName, r2_38)
  end,
  RegionActorDataDeadByCreatorId = function(r0_40, r1_40)
    -- line: [453, 471] id: 40
    local r3_40 = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance):GetRegionDataMgrSubSystem():RegionActorCacheDataDeadByCreatorId(r1_40)
    if not r3_40 or #r3_40 == 0 then
      return 
    end
    local function r4_40(r0_41)
      -- line: [459, 467] id: 41
      if r0_41 ~= ErrorCode.RET_SUCCESS and r0_41 ~= ErrorCode.RET_REGION_BASEDATA_WORLDREGIONEID_REPEAT then
        GWorld.logger.error("DeadRegionActorData" .. " ErrorCode:" .. r0_41)
        for r5_41, r6_41 in pairs(r3_40) do
          GWorld.logger.error(" WorldRegionEid:" .. r6_41.WorldRegionEid .. " SubRegionId" .. r6_41.SubRegionId .. " RegionDataType:" .. r6_41.RegionDataType .. " LevelName:" .. r6_41.LevelName)
        end
        -- close: r1_41
      end
    end
    for r9_40, r10_40 in pairs(r3_40) do
      r0_40:CallServer("DeadRegionActorData", r4_40, r10_40.WorldRegionEid, r10_40.SubRegionId, r10_40.RegionDataType, r10_40.LevelName)
    end
    -- close: r5_40
  end,
  RegionDataDead = function(r0_42, r1_42)
    -- line: [473, 481] id: 42
    r0_42:CallServer("DeadRegionActorData", function(r0_43)
      -- line: [474, 479] id: 43
      if r0_43 ~= ErrorCode.RET_SUCCESS and r0_43 ~= ErrorCode.RET_REGION_BASEDATA_WORLDREGIONEID_REPEAT then
        GWorld.logger.error("DeadRegionActorData" .. " ErrorCode" .. r0_43 .. " WorldRegionEid:" .. r1_42.WorldRegionEid .. " SubRegionId:" .. r1_42.SubRegionId .. " RegionDataType:" .. r1_42.RegionDataType .. " LevelName:" .. r1_42.LevelName)
      end
    end, r1_42.WorldRegionEid, r1_42.SubRegionId, r1_42.RegionDataType, r1_42.LevelName)
  end,
  RegionActorDataDeadByUnitLabel = function(r0_44, r1_44, r2_44)
    -- line: [484, 502] id: 44
    local r4_44 = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance):GetRegionDataMgrSubSystem():RegionActorCacheDataDeadByUnitLabel(r1_44, r2_44)
    if not r4_44 or #r4_44 == 0 then
      return 
    end
    local function r5_44(r0_45)
      -- line: [490, 498] id: 45
      if r0_45 ~= ErrorCode.RET_SUCCESS and r0_45 ~= ErrorCode.RET_REGION_BASEDATA_WORLDREGIONEID_REPEAT then
        GWorld.logger.error("DeadRegionActorData" .. " ErrorCode:" .. r0_45)
        for r5_45, r6_45 in pairs(r4_44) do
          GWorld.logger.error(" WorldRegionEid:" .. r6_45.WorldRegionEid .. " SubRegionId:" .. r6_45.SubRegionId .. " RegionDataType:" .. r6_45.RegionDataType .. " LevelName:" .. r6_45.LevelName)
        end
        -- close: r1_45
      end
    end
    for r10_44, r11_44 in pairs(r4_44) do
      r0_44:CallServer("DeadRegionActorData", r5_44, r11_44.WorldRegionEid, r11_44.SubRegionId, r11_44.RegionDataType, r11_44.LevelName)
    end
    -- close: r6_44
  end,
  S2CSwitchInRegionStateFailer = function(r0_46)
    -- line: [505, 507] id: 46
    r0_46.logger.debug("ZJT_ S2CSwitchInRegionStateFailer ")
  end,
  AddRandomCreatorRegionDatas = function(r0_47, r1_47)
    -- line: [510, 517] id: 47
    if not r1_47 or type(r1_47) ~= "table" then
      return 
    end
    r0_47:CallServer("AddRandomCreatorRegionDatas", function(r0_48)
      -- line: [512, 514] id: 48
      DebugPrint("ZJT_ AddRandomCreatorRegionDatas ", r0_48, r1_47)
    end, r1_47)
  end,
  ActiveRandomCreator = function(r0_49, r1_49, r2_49, r3_49)
    -- line: [520, 529] id: 49
    if not r2_49 then
      r2_49 = 0
    end
    if not r1_49 then
      return 
    end
    r0_49:CallServer("ActiveRandomCreator", function(r0_50, r1_50)
      -- line: [523, 527] id: 50
      DebugPrint("ZJT_ ActiveRandomCreator ", r0_50, r1_49, r2_49)
      PrintTable({
        ClientRes = r1_50,
      }, 10)
      r3_49(r0_50, r1_50)
    end, r1_49, r2_49)
  end,
  ActiveRandomCreators = function(r0_51, r1_51)
    -- line: [531, 538] id: 51
    if not r1_51 or type(r1_51) ~= "table" then
      return 
    end
    r0_51:CallServer("ActiveRandomCreators", function(r0_52, r1_52)
      -- line: [533, 536] id: 52
      DebugPrint("ZJT_ ActiveRandomCreators ", r0_52)
      PrintTable({
        ClientRes = r1_52,
        RandomRuleInfos = r1_51,
      }, 10)
    end, r1_51)
  end,
  TryCapturePetRegion = function(r0_53, r1_53, r2_53, r3_53, r4_53, r5_53, r6_53)
    -- line: [540, 548] id: 53
    r0_53:CallServer("TryCapturePetRegion", function(r0_54, r1_54)
      -- line: [541, 546] id: 54
      DebugPrint("zjt_ TryCapturePetRegion Ret = ", r0_54, r5_53, r4_53, r3_53, r1_53, r2_53)
      if r6_53 then
        r6_53(r0_54, r1_54)
      end
    end, r1_53, r2_53, r3_53, r4_53, r5_53)
  end,
  CombineAddRegionData = function(r0_55, r1_55)
    -- line: [550, 559] id: 55
    r0_55.CombineAdd = r1_55
    if r0_55.CombineAdd then
      r0_55.CombineAddDatas = {}
    else
      DebugPrint("CombineAddRegionData:", #r0_55.CombineAddDatas)
      r0_55:AddAutoRegionActorDatas(r0_55.CombineAddDatas)
      r0_55.CombineAddDatas = {}
    end
  end,
  TryUpdateCombineRegionData = function(r0_56, r1_56, r2_56)
    -- line: [561, 570] id: 56
    local r3_56 = r1_56.WorldRegionEid
    for r8_56, r9_56 in pairs(r0_56.CombineAddDatas) do
      if r9_56.WorldRegionEid == r3_56 then
        return true
      end
    end
    -- close: r4_56
    return false
  end,
  RegionDataValidCheck = function(r0_57, r1_57)
    -- line: [572, 607] id: 57
    local r2_57 = false
    if not r1_57 then
      return 
    end
    local r3_57 = r1_57.SubRegionId
    local r4_57 = nil	-- notice: implicit variable refs by block#[5, 11]
    if r3_57 then
      r3_57 = r1_57.LevelName
      if r3_57 then
        r3_57 = r1_57.RegionDataType
        if not r3_57 then
          ::label_13::
          r3_57 = GWorld
          r3_57 = r3_57.logger
          r3_57 = r3_57.error
          r4_57 = "RegionDataValidCheck Error!!!"
          r3_57(r4_57)
          r2_57 = true
        else
          r3_57 = r2_0
          if r3_57 then
            function r3_57(r0_58)
              -- line: [581, 585] id: 58
              return r0_58:gsub("<(%x%x)>", function(r0_59)
                -- line: [582, 584] id: 59
                return string.char(tonumber(r0_59, 16))
              end)
            end
            r4_57 = r1_57.LevelName
            if not pcall(function()
              -- line: [587, 591] id: 60
              for r5_60 in r3_0.codes(r3_57(r4_57)) do
              end
              -- close: r1_60
            end) then
              GWorld.logger.error("Error LevelName ", r4_57)
              r2_57 = true
            end
            -- close: r3_57
          end
        end
      end
    else
      goto label_13	-- block#5 is visited secondly
    end
    if r2_57 then
      r3_57 = {}
      r4_57 = "RegionData Error:\n\t"
      ... = PrintTable(r1_57, 3) -- error: untaken top expr
      -- setlist for #3 failed
      r4_57 = table
      r4_57 = r4_57.insert
      r4_57(r3_57, "Traceback:\n\t")
      r4_57 = table
      r4_57 = r4_57.insert
      r4_57(r3_57, debug.traceback())
      r4_57 = table
      r4_57 = r4_57.insert
      r4_57(r3_57, "\n=====================\n")
      r4_57 = table
      r4_57 = r4_57.insert
      r4_57(r3_57, UBattleFunctionLibrary.GetTraceStack(50))
      r4_57 = table
      r4_57 = r4_57.concat
      r4_57 = r4_57(r3_57)
      r0_57:RegionReportToSentry(r4_57)
    end
  end,
  RegionReportToSentry = function(r0_61, r1_61)
    -- line: [609, 629] id: 61
    local r2_61 = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UEMSentrySubsystem)
    if r2_61 then
      local r3_61 = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
      local r4_61 = "Error"
      local r6_61 = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance):GetWCSubSystem()
      if r6_61 and r3_61 then
        r4_61 = r6_61:GetLocationLevelName(r3_61:K2_GetActorLocation())
      end
      local r7_61 = tostring(WorldTravelSubsystem():GetCurrentSceneId())
      local r8_61 = nil	-- notice: implicit variable refs by block#[7]
      if r3_61 then
        r8_61 = tostring(r3_61:K2_GetActorLocation())
        if not r8_61 then
          ::label_47::
          r8_61 = " "
        end
      else
        goto label_47	-- block#6 is visited secondly
      end
      local r9_61 = UE.TMap("", "")
      r9_61:Add("em.scene_id", r7_61)
      r9_61:Add("em.scene_name", tostring(r4_61))
      r9_61:Add("em.player_location", r8_61)
      local r10_61 = UE.TArray("")
      r10_61:Add("RegionData Error")
      r2_61:ReportEventTrace(r1_61, r9_61, r10_61)
    end
  end,
}
