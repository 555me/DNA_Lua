-- filename: @E:/Pack/Branch/OBT10_Geili\Content/Script/BluePrints\GameMode\Components\ProgressSnapShotComponent.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("Utils.CommonUtils")
local r1_0 = require("Utils.SerializeUtils")
return {
  TryResetBattleEid = function(r0_1)
    -- line: [7, 22] id: 1
    if GWorld:GetAvatar() and GWorld:GetAvatar():IsInBigWorld() then
      return 
    end
    if not r0_1:GetProgressData() then
      return 
    end
    if not r0_1:NeedProgressRecover() then
      return 
    end
    local r1_1 = r0_1:GetProgressData().Eid
    if not r1_1 or r1_1 == 0 then
      return 
    end
    r0_1:SetBattleEid(r1_1)
  end,
  NeedProgressRecover = function(r0_2)
    -- line: [24, 34] id: 2
    local r1_2 = r0_2:GetProgressData()
    if not r1_2 then
      return false
    end
    if (r0_2.DungeonId and UE4.UGameplayStatics.GetGameInstance(r0_2):GetCurrentDungeonId()) ~= r1_2.DungeonId then
      return false
    end
    return true
  end,
  GetProgressData = function(r0_3)
    -- line: [36, 42] id: 3
    if r0_3.ProgressData == nil then
      r0_3.ProgressData = UE4.UGameplayStatics.GetGameInstance(r0_3):GetProgressData()
    end
    return r0_3.ProgressData
  end,
  GetPlayerSliceData = function(r0_4)
    -- line: [44, 47] id: 4
    return UE4.UGameplayStatics.GetGameInstance(r0_4):GetPlayerSliceData()
  end,
  GetProgressDataJsonName = function(r0_5)
    -- line: [49, 56] id: 5
    local r1_5 = r0_5:GetProgressData()
    if r1_5 then
      return r1_5.JsonName
    end
    return nil
  end,
  GetProgressDataDungeonId = function(r0_6)
    -- line: [58, 64] id: 6
    local r1_6 = r0_6:GetProgressData()
    if r1_6 then
      return r1_6.DungeonId
    end
    return nil
  end,
  GetProgressDataPlayerTransform = function(r0_7)
    -- line: [66, 73] id: 7
    local r1_7 = r0_7:GetProgressData()
    if r1_7 then
      return r0_0:UnSerializeFTransform(r1_7.PlayerTransform)
    end
    return nil
  end,
  TriggerProgressRecover = function(r0_8)
    -- line: [75, 88] id: 8
    local r1_8 = r0_8:GetProgressData()
    if r1_8 then
      if r1_8.IsRougeLike then
        r0_8:RougeRecoverProgressData()
      elseif r1_8.IsAbyss then
        r0_8:AbyssRecoverProgressData()
      else
        r0_8:RecoverProgressData()
      end
      r0_8:OnProgressRecoverSucceed()
    end
  end,
  RecordProgressData = function(r0_9)
    -- line: [90, 282] id: 9
    if not IsStandAlone(r0_9) then
      return 
    end
    if not Const.ProgressRecoverDungeonType[r0_9.EMGameState.GameModeType] then
      return 
    end
    DebugPrint("ProgressSnapShotComponent: RecordProgressData")
    local r1_9 = {}
    local r2_9 = {}
    local r3_9 = {}
    local r4_9 = r0_9:TriggerDungeonComponentFun("RecordDungeonRoundData")
    for r9_9, r10_9 in pairs(r0_9.EMGameState.MonsterMap) do
      if IsValid(r10_9) and not r10_9:IsDead() and r10_9.CreatorType == "StaticCreator" then
        if r10_9.RandomCreatorId ~= 0 then
          table.insert(r2_9, {
            RandomRuleId = r10_9.RandomRuleId,
            RandomTableId = r10_9.RandomTableId,
            RandomLevelName = r0_9.RandomActorManager:GetCreatorRegionDataLevelName(r10_9.RandomRuleId, r10_9.RandomCreatorId),
            RandomIdxInRule = r0_9.RandomActorManager:GetCreatorRegionDataIdxInRule(r10_9.RandomRuleId, r10_9.RandomCreatorId),
          })
        elseif r10_9.CreatorId ~= 0 then
          table.insert(r1_9, {
            StaticCreatorId = r10_9.CreatorId,
            PrivateEnable = r10_9.PrivateEnable,
            LevelName = r0_9:GetActorLevelName(r10_9),
          })
        end
      end
    end
    -- close: r5_9
    for r9_9, r10_9 in pairs(r0_9.EMGameState.NpcMap) do
      if IsValid(r10_9) and not r10_9:IsDead() and r10_9.CreatorType == "StaticCreator" then
        if r10_9.RandomCreatorId ~= 0 then
          table.insert(r2_9, {
            RandomRuleId = r10_9.RandomRuleId,
            RandomTableId = r10_9.RandomTableId,
            RandomLevelName = r0_9.RandomActorManager:GetCreatorRegionDataLevelName(r10_9.RandomRuleId, r10_9.RandomCreatorId),
            RandomIdxInRule = r0_9.RandomActorManager:GetCreatorRegionDataIdxInRule(r10_9.RandomRuleId, r10_9.RandomCreatorId),
          })
        elseif r10_9.CreatorId ~= 0 and not r10_9:IsPetNpc() then
          table.insert(r1_9, {
            StaticCreatorId = r10_9.CreatorId,
            PrivateEnable = r10_9.PrivateEnable,
            LevelName = r0_9:GetActorLevelName(r10_9),
          })
        end
      end
    end
    -- close: r5_9
    for r9_9, r10_9 in pairs(r0_9.EMGameState.CombatItemMap) do
      if IsValid(r10_9) then
        if r10_9.CanDungeonSave and not r10_9:CanDungeonSave() then
          DebugPrint("ProgressSnapShotComponent: CombatItem 即将销毁, 不存储", r10_9:GetName(), r10_9.Eid, r10_9.CreatorId, r10_9.UnitType)
        elseif r10_9.RandomCreatorId ~= 0 then
          local r11_9 = {
            RandomRuleId = r10_9.RandomRuleId,
            RandomTableId = r10_9.RandomTableId,
            RandomLevelName = r0_9.RandomActorManager:GetCreatorRegionDataLevelName(r10_9.RandomRuleId, r10_9.RandomCreatorId),
            RandomIdxInRule = r0_9.RandomActorManager:GetCreatorRegionDataIdxInRule(r10_9.RandomRuleId, r10_9.RandomCreatorId),
            ItemData = r10_9:GetDungeonSaveData() and {},
          }
          table.insert(r2_9, r11_9)
        elseif r10_9.CreatorId ~= 0 and not r10_9.IsPetDefenceMechanism then
          local r11_9 = {
            StaticCreatorId = r10_9.CreatorId,
            ItemData = r10_9:GetDungeonSaveData() and {},
            PrivateEnable = r10_9.PrivateEnable,
            LevelName = r0_9:GetActorLevelName(r10_9),
          }
          table.insert(r1_9, r11_9)
        end
      end
    end
    -- close: r5_9
    local r5_9 = TArray(FSnapShotInfo())
    r0_9:GetDungeonSnapShotData(r5_9)
    local r6_9 = {}
    for r11_9, r12_9 in pairs(r5_9) do
      table.insert(r6_9, r12_9)
    end
    -- close: r7_9
    local r7_9 = r0_9.DungeonId
    local r8_9 = UE4.URuntimeCommonFunctionLibrary.GetLevelLoadJsonName(r0_9)
    local r9_9 = r0_9:GetBattleEid()
    local r10_9 = UGameplayStatics.GetPlayerCharacter(r0_9, 0)
    local r11_9 = r0_0:SerializeFTransform(r10_9:GetTransform())
    r3_9 = {
      HpPercent = r10_9:GetAttr("HpPercent"),
      CurrentLevelId = {},
    }
    for r16_9, r17_9 in pairs(r10_9.CurrentLevelId) do
      table.insert(r3_9.CurrentLevelId, r17_9)
    end
    -- close: r12_9
    local r12_9 = {}
    if r10_9.BattleAchievement then
      local r13_9 = {}
      for r18_9, r19_9 in pairs(r10_9.BattleAchievement.DelayedTargetValues) do
        r13_9[r18_9] = r19_9
      end
      -- close: r14_9
      r12_9.DelayedTargetValues = r13_9
      local r14_9 = {}
      for r19_9, r20_9 in pairs(r10_9.BattleAchievement.TopProcessedValue) do
        r14_9[r19_9] = r20_9
      end
      -- close: r15_9
      r12_9.TopProcessedValue = r14_9
    end
    local r13_9 = {}
    for r18_9, r19_9 in pairs(r0_9.LevelGameMode.SubGameModeInfo) do
      r13_9[r18_9] = r19_9.GameModeFirstActiveEnable
    end
    -- close: r14_9
    local r14_9 = {
      TexturePath = r0_9.EMGameState.DungeonUIInfo.TexturePath,
      TextTitle = r0_9.EMGameState.DungeonUIInfo.TextTitle,
      TextMap = r0_9.EMGameState.DungeonUIInfo.TextMap,
    }
    local r15_9 = {}
    for r19_9 = 1, r0_9.EMGameState.DungeonEvent:Num(), 1 do
      local r20_9 = r0_9.EMGameState.DungeonEvent:GetValueByIdx(r19_9 + -1)
      if r20_9 ~= "ShowPetDefenseDynamicEvent" and r20_9 ~= "ShowPetDefenseProgress" then
        r15_9[r19_9] = r20_9
      end
    end
    local r17_9 = UE.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0).PlayerState
    local r18_9 = {
      RecoveryCount = r17_9.RecoveryCount,
      RecoveryMaxCount = r17_9.RecoveryMaxCount,
    }
    if r10_9 and r10_9:IsDead() and r18_9.RecoveryCount then
      r18_9.RecoveryCount = r18_9.RecoveryCount + 1
    end
    local r19_9 = {
      Eid = r9_9,
      DungeonId = r7_9,
      JsonName = r8_9,
      PlayerData = r3_9,
      PlayerTransform = r11_9,
      DungeonSnapShotData = r6_9,
      DungeonData = r4_9,
      StaticCreatorData = r1_9,
      RandomCreatorData = r2_9,
      SubGameModeData = r13_9,
      BattleAchievementData = r12_9,
      DungeonUIInfoData = r14_9,
      DungeonEventData = r15_9,
      RecoveryCountInfo = r18_9,
    }
    PrintTable(r19_9, 6)
    UE4.UGameplayStatics.GetGameInstance(r0_9):ClearProgressData()
    GWorld:GetAvatar():SaveProgressData(r19_9)
  end,
  RecoverProgressData = function(r0_10)
    -- line: [284, 376] id: 10
    local r1_10 = r0_10:GetProgressData()
    if not r1_10 then
      DebugPrint("ProgressSnapShotComponent       error  no data")
      return 
    end
    DebugPrint("ProgressSnapShotComponent: RecoverProgressData")
    PrintTable(r1_10, 6)
    UE4.UGameplayStatics.GetGameInstance(r0_10):ClearProgressData()
    local r2_10 = r1_10.PlayerData.HpPercent and 1
    local r3_10 = UGameplayStatics.GetPlayerCharacter(r0_10, 0)
    r3_10:SetAttr("Hp", r3_10:GetAttr("MaxHp") * r2_10)
    local r5_10 = TArray(FString)
    for r10_10, r11_10 in pairs(r1_10.PlayerData.CurrentLevelId) do
      r5_10:Add(r11_10)
    end
    -- close: r6_10
    r3_10:SetCurrentLevelId(r5_10)
    if r1_10.BattleAchievementData and r3_10.BattleAchievement then
      for r10_10, r11_10 in pairs(r1_10.BattleAchievementData.DelayedTargetValues) do
        r3_10.BattleAchievement.DelayedTargetValues:Add(r10_10, r11_10)
      end
      -- close: r6_10
      for r10_10, r11_10 in pairs(r1_10.BattleAchievementData.TopProcessedValue) do
        r3_10.BattleAchievement.TopProcessedValue:Add(r10_10, r11_10)
      end
      -- close: r6_10
    end
    for r10_10, r11_10 in pairs(r1_10.StaticCreatorData) do
      local r12_10 = r0_10.EMGameState:GetStaticCreatorInfo(r11_10.StaticCreatorId, r11_10.PrivateEnable, r11_10.LevelName)
      if r12_10 then
        if r11_10.ItemData then
          r12_10:RealActiveStaticCreator({
            DungeonState = r11_10.ItemData,
          })
        else
          r12_10:RealActiveStaticCreator()
        end
      else
        DebugPrint("ProgressSnapShotComponent: 找不到静态点,, StaticCreatorId", r11_10.StaticCreatorId, "PrivateEnable", r11_10.PrivateEnable, "LevelName", r11_10.LevelName)
      end
    end
    -- close: r6_10
    for r10_10, r11_10 in pairs(r1_10.RandomCreatorData) do
      r0_10.RandomActorManager:ProgressDataRecoverRandomActor(r11_10.RandomRuleId, r11_10.RandomLevelName, r11_10.RandomIdxInRule, r11_10.RandomTableId, r11_10.ItemData)
    end
    -- close: r6_10
    r0_10:TriggerDungeonComponentFun("RecoverDungeonRoundData", r1_10.DungeonData)
    r0_10:SetDungeonSnapShotData(r1_10.DungeonSnapShotData)
    for r10_10, r11_10 in pairs(r1_10.SubGameModeData) do
      local r12_10 = r0_10.LevelGameMode.SubGameModeInfo:FindRef(r10_10)
      if r12_10 then
        r12_10.GameModeFirstActiveEnable = r11_10
      else
        DebugPrint("ProgressSnapShot 子GameMode不存在，LevelName：", r10_10)
      end
    end
    -- close: r6_10
    r0_10.EMGameState.DungeonUIInfo.TexturePath = r1_10.DungeonUIInfoData.TexturePath
    r0_10.EMGameState.DungeonUIInfo.TextTitle = r1_10.DungeonUIInfoData.TextTitle
    r0_10.EMGameState.DungeonUIInfo.TextMap = r1_10.DungeonUIInfoData.TextMap
    r0_10.EMGameState:MarkDungeonUIInfoAsDirtyData()
    for r10_10, r11_10 in pairs(r1_10.DungeonEventData) do
      r0_10:AddDungeonEvent(r11_10)
    end
    -- close: r6_10
    r3_10:SetRecoveryCount(r1_10.RecoveryCountInfo.RecoveryCount)
    r3_10:SetRecoveryMaxCount(r1_10.RecoveryCountInfo.RecoveryMaxCount)
  end,
  OnProgressRecoverSucceed = function(r0_11)
    -- line: [378, 381] id: 11
    r0_11.Overridden.OnProgressRecoverSucceed(r0_11)
  end,
  RougeRecordProgressData = function(r0_12, r1_12)
    -- line: [385, 521] id: 12
    if r0_12:IsAllRoomPassed() then
      DebugPrint("ProgressSnapShotComponent: 所有房间已通关后不允许存储")
      return 
    end
    if r0_12:IsDungeonInSettlement() then
      DebugPrint("ProgressSnapShotComponent: 副本已结算后不允许存储")
      return 
    end
    DebugPrint("ProgressSnapShotComponent: RougeRecordProgressData 当前房间是否通关：", GWorld.RougeLikeManager:IsCurRougeLikeRoomClear(), "是否正处于事件关的事件中", GWorld.RougeLikeManager.IsListeningDealRewardEvent and false)
    local r5_12 = UE.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0).PlayerState
    local r6_12 = {
      RecoveryCount = r5_12.RecoveryCount,
      RecoveryMaxCount = r5_12.RecoveryMaxCount,
    }
    local r7_12 = UGameplayStatics.GetPlayerCharacter(r0_12, 0)
    if r7_12 and r7_12:IsDead() and r6_12.RecoveryCount then
      r6_12.RecoveryCount = r6_12.RecoveryCount + 1
    end
    DebugPrint("Tianyi@ 开始暂存肉鸽Buff")
    local r8_12 = {}
    local r9_12 = r7_12.BuffManager
    if r9_12 then
      r8_12 = r9_12:GetBuffsSnapshot()
      PrintTable(r8_12, 6, "BuffsSnapshot", true)
    end
    local r10_12 = {}
    for r15_12, r16_12 in pairs(r0_12.EMGameState.CombatItemMap) do
      if IsValid(r16_12) and r16_12.CreatorId ~= 0 and r16_12.UnitId ~= 112 then
        local r17_12 = {
          StaticCreatorId = r16_12.CreatorId,
          ItemData = r16_12:GetDungeonSaveData() and {},
          PrivateEnable = r16_12.PrivateEnable,
          LevelName = r0_12:GetActorLevelName(r16_12),
        }
        table.insert(r10_12, r17_12)
      end
    end
    -- close: r11_12
    for r15_12, r16_12 in pairs(r0_12.EMGameState.NpcMap) do
      if IsValid(r16_12) and r16_12.CreatorId then
        table.insert(r10_12, {
          StaticCreatorId = r16_12.CreatorId,
          PrivateEnable = r16_12.PrivateEnable,
          LevelName = r0_12:GetActorLevelName(r16_12),
        })
      end
    end
    -- close: r11_12
    local r11_12 = GWorld.RougeLikeManager.StaticCreatorIdToShopId
    local r12_12 = {
      Count = r0_12.EMGameState.RougeBattleCount,
      MaxNum = r0_12.EMGameState.RougeBattleMaxNum,
    }
    local r13_12 = GWorld.RougeLikeManager:GetOrAddDataSetObject()
    local r14_12 = {
      SetInt = r13_12.ExtraInt:ToTable(),
      SetBool = r13_12.ExtraBool:ToTable(),
      SetFloat = r13_12.ExtraFloat:ToTable(),
      SetVector = r13_12.ExtraVector:ToTable(),
      SaveLoc = r13_12.SaveLocations:ToTable(),
      SetString = r13_12.ExtraString:ToTable(),
    }
    local r21_12 = {
      TreasureMonProb = r0_12.TreasureMonsterSpawnProbability,
      TreasureMonCreatedNum = r0_12.TreasureMonsterCreatedNum,
    }
    local r22_12 = {}
    if r0_12.EMGameState.DungeonUIInfo.TextMap ~= "" then
      r22_12 = {
        TexturePath = r0_12.EMGameState.DungeonUIInfo.TexturePath,
        TextTitle = r0_12.EMGameState.DungeonUIInfo.TextTitle,
        TextMap = r0_12.EMGameState.DungeonUIInfo.TextMap,
        RougeLikeSubTaskText = r0_12.RougeLikeSubTaskText,
      }
    end
    local r25_12 = {
      IsRougeLike = true,
      DungeonId = r0_12.DungeonId,
      PassRoomExtraInfo = r1_12,
      RecoveryCountInfo = r6_12,
      StaticCreatorData = r10_12,
      BattleProgressNums = r12_12,
      ShopInfo = r11_12,
      BuffsSnapshot = r8_12,
      DataSetObjInfo = r14_12,
      TreasureMonInfo = r21_12,
      DungeonUIInfoData = r22_12,
      IsSimpleDesc = GWorld.RougeLikeManager.IsSimpleDesc,
      IsListeningDealRewardEvent = GWorld.RougeLikeManager.IsListeningDealRewardEvent,
    }
    PrintTable(r25_12, 6, "ResData")
    UE4.UGameplayStatics.GetGameInstance(r0_12):ClearProgressData()
    GWorld:GetAvatar():SaveProgressData(r25_12)
  end,
  RougeRecoverProgressData = function(r0_13)
    -- line: [523, 770] id: 13
    local r1_13 = r0_13:GetProgressData()
    if not r1_13 then
      DebugPrint("ProgressSnapShotComponent       error  no data")
      return 
    end
    local r2_13 = GWorld.RougeLikeManager:IsCurRougeLikeRoomClear()
    local r3_13 = r1_13.IsListeningDealRewardEvent and false
    DebugPrint("ProgressSnapShotComponent: RougeRecoverProgressData 当前房间是否通关：", r2_13, "是否正处于事件关的事件中", r3_13)
    PrintTable(r1_13, 6)
    UE4.UGameplayStatics.GetGameInstance(r0_13):ClearProgressData()
    local r4_13 = UE.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
    local r5_13 = UGameplayStatics.GetPlayerCharacter(r0_13, 0)
    local r6_13 = r4_13.PlayerState
    r6_13:SetRecoveryCount(r1_13.RecoveryCountInfo.RecoveryCount)
    r6_13:SetRecoveryMaxCount(r1_13.RecoveryCountInfo.RecoveryMaxCount)
    local r7_13 = r1_13.BuffsSnapshot
    local r8_13 = 0
    DebugPrint("Tianyi@ 开始恢复Buff")
    for r13_13, r14_13 in ipairs(r7_13) do
      local r15_13 = r14_13.BuffId
      local r16_13 = DataMgr.Buff[r15_13]
      if not r16_13 then
        DebugPrint("Tianyi@ Buff恢复失败, 存在非法BuffId: ", r15_13)
      else
        local r17_13 = r16_13.MergeRule2
        if r17_13 == "Merge" then
          local r18_13 = r14_13.bForever
          if r18_13 then
            r18_13 = -1 and r14_13.LastTime
          else
            goto label_83	-- block#10 is visited secondly
          end
          if Battle(r0_13):AddBuffToTarget(r5_13, r5_13, r15_13, r18_13, r14_13.Value, r5_13, r14_13.Layer):Num() > 0 then
            r8_13 = r8_13 + 1
          end
        elseif r17_13 == "NewFree" then
          local r18_13 = nil
          for r22_13 = 1, #r14_13.FreeLayerInfos, 1 do
            local r23_13 = r14_13.FreeLayerInfos[r22_13]
            if r22_13 == 1 then
              local r24_13 = r23_13.bForever
              if r24_13 then
                r24_13 = -1 and r23_13.LastTime
              else
                goto label_121	-- block#18 is visited secondly
              end
              r18_13 = Battle(r0_13):AddBuffToTarget(r5_13, r5_13, r15_13, r24_13, r23_13.Value, r5_13, 1)
              if r18_13:Num() > 0 then
                r8_13 = r8_13 + 1
              end
            elseif r18_13 then
              local r24_13 = r18_13:GetRef(1)
              if r24_13 then
                Battle(r0_13):IncreaseBuffLayerFromTarget(r24_13, r5_13, r23_13.LastTime, r23_13.Value, r5_13:GetSkillLevelInfo(), 1, false)
              end
            else
              DebugPrint("Tianyi@ AddedBuffs is nil")
            end
          end
        end
      end
    end
    -- close: r9_13
    if #r7_13 > 0 then
      r5_13:RefreshBuff()
      if r8_13 == #r7_13 then
        DebugPrint("Tianyi@ Buff恢复成功")
      else
        DebugPrint("Tianyi@ Buff恢复失败, 恢复了" .. tostring(r8_13) .. "个Buff, 但总共有" .. tostring(#r7_13) .. "个Buff")
      end
    end
    local r9_13 = r1_13.DataSetObjInfo
    local r10_13 = GWorld.RougeLikeManager:GetOrAddDataSetObject()
    if r1_13.TreasureMonInfo then
      r0_13.TreasureMonsterCreatedNum = r1_13.TreasureMonInfo.TreasureMonCreatedNum
      r0_13.TreasureMonsterSpawnProbability = r1_13.TreasureMonInfo.TreasureMonProb
    end
    local r11_13 = r0_13:GetPlayerSliceData()
    local r12_13 = r11_13:Length()
    local r13_13 = {}
    local r14_13 = {}
    for r18_13 = r12_13, 1, -1 do
      local r19_13 = r1_0:UnSerialize(r11_13[r18_13])
      local r20_13 = r19_13.Type
      local r21_13 = r19_13.Value
      if not r13_13[r20_13] then
        DebugPrint("Tianyi@ Reocver Player State, Type = " .. tostring(r20_13) .. " Value = ")
        PrintTable(r21_13, 10)
        if r20_13 == Const.RougeSliceInfoType.RecoverCount then
          r5_13:SetRecoveryCount(r21_13.RecoveryCount)
          r13_13[r20_13] = true
        elseif r20_13 == Const.RougeSliceInfoType.TreasureMonCount then
          r0_13.TreasureMonsterCreatedNum = r21_13.TreasureMonCount
          DebugPrint("RougeLike Recover, TreasureMonsterCreatedNum =", r0_13.TreasureMonsterCreatedNum)
          r13_13[r20_13] = true
        elseif r20_13 == Const.RougeSliceInfoType.BlueprintValue and not r14_13[r21_13.Key] then
          local r22_13 = r21_13.DataType
          local r23_13 = r21_13.DataValue
          r9_13[r22_13] = r9_13[r22_13] and {}
          r9_13[r22_13][r21_13.Key] = r23_13
          r14_13[r21_13.Key] = true
        end
      end
    end
    UE4.UGameplayStatics.GetGameInstance(r0_13):ClearPlayerSliceData()
    for r19_13, r20_13 in pairs(r9_13) do
      for r25_13, r26_13 in pairs(r20_13) do
        local r27_13 = GWorld.RougeLikeManager[r19_13]
        if r27_13 and type(r27_13) == "function" then
          r27_13(GWorld.RougeLikeManager, r25_13, r26_13)
          DebugPrint("Tianyi@ 恢复了蓝图数据: ", r25_13, r26_13)
        else
          DebugPrint("Tianyi@ 恢复蓝图数据失败, 不存在该函数: ", r19_13)
        end
      end
      -- close: r21_13
    end
    -- close: r15_13
    Battle(r0_13):TriggerBattleEvent(BattleEventName.RougeParamRecover, r5_13, GWorld.RougeLikeManager)
    if r3_13 or r2_13 then
      local r15_13 = r1_13.StaticCreatorData
      if r15_13 then
        for r20_13, r21_13 in pairs(r15_13) do
          local r22_13 = r0_13.EMGameState:GetStaticCreatorInfo(r21_13.StaticCreatorId, r21_13.PrivateEnable, r21_13.LevelName)
          if r22_13 then
            if r21_13.ItemData then
              r22_13:RealActiveStaticCreator({
                DungeonState = r21_13.ItemData,
              })
            else
              r22_13:RealActiveStaticCreator()
            end
          else
            DebugPrint("找不到静态点,, StaticCreatorId", r21_13.StaticCreatorId, "PrivateEnable", r21_13.PrivateEnable, "LevelName", r21_13.LevelName)
          end
        end
        -- close: r16_13
      end
      local r16_13 = r1_13.ShopInfo
      if r16_13 then
        GWorld.RougeLikeManager.StaticCreatorIdToShopId = r16_13
      end
    end
    if r3_13 or r2_13 then
      for r19_13, r20_13 in pairs(r0_13.LevelGameMode.SubGameModeInfo) do
        r20_13.GameModeFirstActiveEnable = false
        DebugPrint("ProgressSnapShotComponent: SubGameMode", r19_13, r20_13:GetName(), "关闭OnFirstActive")
      end
      -- close: r15_13
    end
    if (r3_13 or r2_13) and r1_13.DungeonUIInfoData.TextMap and r1_13.DungeonUIInfoData.TextMap ~= "" then
      r0_13:NotifyClientShowDungeonTaskNew(r1_13.DungeonUIInfoData.TexturePath, r1_13.DungeonUIInfoData.TextTitle, r1_13.DungeonUIInfoData.TextMap)
      local r18_13 = r1_13.DungeonUIInfoData.RougeLikeSubTaskText
      if r18_13 then
        r0_13:InitRougeLikeSubTask(r18_13)
      end
    end
    if r2_13 then
      local r15_13 = r1_13.BattleProgressNums
      if r15_13 then
        r0_13.EMGameState:SetRougeBattleNums(r15_13.Count, r15_13.MaxNum)
      end
    end
    GWorld.RougeLikeManager.IsSimpleDesc = r1_13.IsSimpleDesc
    if r1_13.IsListeningDealRewardEvent and not r2_13 then
      GWorld.RougeLikeManager:ListenDealRewardEvent()
      if GWorld.RougeLikeManager.EventId <= 0 and GWorld.RougeLikeManager.RandomBlessings:Num() <= 0 and GWorld.RougeLikeManager.RandomTreasures:Num() <= 0 then
        EventManager:FireEvent(EventID.OnRougeDealEventReward)
      end
    end
    if r2_13 then
      GWorld.RougeLikeManager:OnPassRoom(true)
    end
    local r15_13 = GWorld.RougeLikeManager.EventId
    DebugPrint("ProgressSnapShotComponent 当前事件ID为：", r15_13)
    if r15_13 > 0 then
      local r16_13 = DataMgr.RougeLikeEventSelect[r15_13].GameModeEvent
      if r16_13 then
        DebugPrint("ProgressSnapShotComponent: 恢复触发事件关事件", r16_13)
        r0_13:PostCustomEvent(r16_13)
      end
    end
    if r1_13.PassRoomExtraInfo.IsRougeFinished and GWorld.RougeLikeManager.StoryId ~= 0 then
      DebugPrint("ProgressSnapShotComponent: 恢复触发通关Story", GWorld.RougeLikeManager.StoryId, "是否通关:", r1_13.PassRoomExtraInfo.IsWin)
      r0_13:ShowFinishRougeStory(r1_13.PassRoomExtraInfo.IsWin)
    end
  end,
  AbyssRecordProgressData = function(r0_14, r1_14)
    -- line: [773, 805] id: 14
    DebugPrint("ProgressSnapShotComponent: AbyssRecordProgressData")
    local r5_14 = {
      IsAbyss = true,
      DungeonId = r0_14.DungeonId,
      AbyssLogicServerInfo = r0_14:GetDungeonComponent().AbyssLogicServerInfo,
      JsonName = UE4.URuntimeCommonFunctionLibrary.GetLevelLoadJsonName(r0_14),
      PlayerTransform = r0_0:SerializeFTransform(UGameplayStatics.GetPlayerCharacter(r0_14, 0):GetTransform()),
      LastLevelId = r1_14.LastLevelId,
      NewLevelId = r1_14.NewLevelId,
      AbyssRoomIndex = r0_14:TriggerDungeonComponentFun("GetAbyssRoomIndex"),
      PreAbyssLevelProgress = GWorld.GameInstance.PreAbyssLevelProgress,
    }
    PrintTable(r5_14, 6)
    UE4.UGameplayStatics.GetGameInstance(r0_14):ClearProgressData()
    GWorld:GetAvatar():SaveProgressData(r5_14)
  end,
  AbyssRecoverProgressData = function(r0_15)
    -- line: [807, 833] id: 15
    local r1_15 = r0_15:GetProgressData()
    if not r1_15 then
      DebugPrint("ProgressSnapShotComponent    Abyss   error  no data")
      return 
    end
    DebugPrint("ProgressSnapShotComponent: AbyssRecoverProgressData")
    PrintTable(r1_15, 6)
    UE4.UGameplayStatics.GetGameInstance(r0_15):ClearProgressData()
    r0_15:TriggerDungeonComponentFun("InitGlobalPassive")
    r0_15:GetDungeonComponent().AbyssRoomIndex = r1_15.AbyssRoomIndex
    r0_15:TriggerDungeonComponentFun("TriggerStartNextRoom", r1_15.LastLevelId, r1_15.NewLevelId)
    GWorld.GameInstance.PreAbyssLevelProgress = r1_15.PreAbyssLevelProgress
  end,
  GetProgressDataAbyssLogicServerInfo = function(r0_16)
    -- line: [835, 841] id: 16
    local r1_16 = r0_16:GetProgressData()
    if r1_16 then
      return r1_16.AbyssLogicServerInfo
    end
    return nil
  end,
}
