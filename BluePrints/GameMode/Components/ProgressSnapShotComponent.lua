-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\GameMode\Components\ProgressSnapShotComponent.lua
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
    -- line: [75, 97] id: 8
    local r1_8 = r0_8:GetProgressData()
    if r1_8 then
      local r2_8 = r1_8.CurStage and "OnBattle"
      if r1_8.IsRougeLike then
        r0_8:RougeRecoverProgressData()
      elseif r1_8.IsAbyss then
        r0_8:AbyssRecoverProgressData()
      else
        r0_8:RecoverProgressData()
      end
      if r2_8 == "OnVoteBegin" then
        r0_8:ExecuteNextStepOfDungeonVote()
        if r0_8.EMGameState.GameModeType == "SurvivalMini" then
          r0_8:OnProgressRecoverSucceed()
        end
      elseif r2_8 == "OnBattle" then
        r0_8:OnProgressRecoverSucceed()
      end
    end
  end,
  RecordProgressData = function(r0_9)
    -- line: [99, 101] id: 9
    r0_9:RecordProgressDataWithStageInfo("OnBattle")
  end,
  RecordProgressDataWithStageInfo = function(r0_10, r1_10)
    -- line: [104, 303] id: 10
    if not IsStandAlone(r0_10) then
      return 
    end
    if not Const.ProgressRecoverDungeonType[r0_10.EMGameState.GameModeType] then
      return 
    end
    DebugPrint("ProgressSnapShotComponent: RecordProgressData")
    local r2_10 = {}
    local r3_10 = {}
    local r4_10 = {}
    local r5_10 = r0_10:TriggerDungeonComponentFun("RecordDungeonRoundData")
    for r10_10, r11_10 in pairs(r0_10.EMGameState.MonsterMap) do
      if IsValid(r11_10) and not r11_10:IsDead() and r11_10.CreatorType == "StaticCreator" then
        if r11_10.RandomCreatorId ~= 0 then
          table.insert(r3_10, {
            RandomRuleId = r11_10.RandomRuleId,
            RandomTableId = r11_10.RandomTableId,
            RandomLevelName = r0_10.RandomActorManager:GetCreatorRegionDataLevelName(r11_10.RandomRuleId, r11_10.RandomCreatorId),
            RandomIdxInRule = r0_10.RandomActorManager:GetCreatorRegionDataIdxInRule(r11_10.RandomRuleId, r11_10.RandomCreatorId),
          })
        elseif r11_10.CreatorId ~= 0 then
          table.insert(r2_10, {
            StaticCreatorId = r11_10.CreatorId,
            PrivateEnable = r11_10.PrivateEnable,
            LevelName = r0_10:GetActorLevelName(r11_10),
          })
        end
      end
    end
    -- close: r6_10
    for r10_10, r11_10 in pairs(r0_10.EMGameState.NpcMap) do
      if IsValid(r11_10) and not r11_10:IsDead() and r11_10.CreatorType == "StaticCreator" then
        if r11_10.RandomCreatorId ~= 0 then
          table.insert(r3_10, {
            RandomRuleId = r11_10.RandomRuleId,
            RandomTableId = r11_10.RandomTableId,
            RandomLevelName = r0_10.RandomActorManager:GetCreatorRegionDataLevelName(r11_10.RandomRuleId, r11_10.RandomCreatorId),
            RandomIdxInRule = r0_10.RandomActorManager:GetCreatorRegionDataIdxInRule(r11_10.RandomRuleId, r11_10.RandomCreatorId),
          })
        elseif r11_10.CreatorId ~= 0 and not r11_10:IsPetNpc() then
          table.insert(r2_10, {
            StaticCreatorId = r11_10.CreatorId,
            PrivateEnable = r11_10.PrivateEnable,
            LevelName = r0_10:GetActorLevelName(r11_10),
          })
        end
      end
    end
    -- close: r6_10
    for r10_10, r11_10 in pairs(r0_10.EMGameState.CombatItemMap) do
      if IsValid(r11_10) then
        if r11_10.CanDungeonSave and not r11_10:CanDungeonSave() then
          DebugPrint("ProgressSnapShotComponent: CombatItem 即将销毁, 不存储", r11_10:GetName(), r11_10.Eid, r11_10.CreatorId, r11_10.UnitType)
        elseif r11_10.RandomCreatorId ~= 0 then
          local r12_10 = {
            RandomRuleId = r11_10.RandomRuleId,
            RandomTableId = r11_10.RandomTableId,
            RandomLevelName = r0_10.RandomActorManager:GetCreatorRegionDataLevelName(r11_10.RandomRuleId, r11_10.RandomCreatorId),
            RandomIdxInRule = r0_10.RandomActorManager:GetCreatorRegionDataIdxInRule(r11_10.RandomRuleId, r11_10.RandomCreatorId),
            ItemData = r11_10:GetDungeonSaveData() and {},
          }
          table.insert(r3_10, r12_10)
        elseif r11_10.CreatorId ~= 0 and not r11_10.IsPetDefenceMechanism then
          local r12_10 = {
            StaticCreatorId = r11_10.CreatorId,
            ItemData = r11_10:GetDungeonSaveData() and {},
            PrivateEnable = r11_10.PrivateEnable,
            LevelName = r0_10:GetActorLevelName(r11_10),
          }
          table.insert(r2_10, r12_10)
        end
      end
    end
    -- close: r6_10
    local r6_10 = TArray(FSnapShotInfo())
    r0_10:GetDungeonSnapShotData(r6_10)
    local r7_10 = {}
    for r12_10, r13_10 in pairs(r6_10) do
      table.insert(r7_10, r13_10)
    end
    -- close: r8_10
    local r8_10 = r0_10.DungeonId
    local r9_10 = UE4.URuntimeCommonFunctionLibrary.GetLevelLoadJsonName(r0_10)
    local r10_10 = r0_10:GetBattleEid()
    local r11_10 = UGameplayStatics.GetPlayerCharacter(r0_10, 0)
    local r12_10 = r0_0:SerializeFTransform(r11_10:GetTransform())
    r4_10 = {
      HpPercent = r11_10:GetAttr("HpPercent"),
      CurrentLevelId = {},
    }
    for r17_10, r18_10 in pairs(r11_10.CurrentLevelId) do
      table.insert(r4_10.CurrentLevelId, r18_10)
    end
    -- close: r13_10
    local r13_10 = {}
    if r11_10.BattleAchievement then
      local r14_10 = {}
      for r19_10, r20_10 in pairs(r11_10.BattleAchievement.DelayedTargetValues) do
        r14_10[r19_10] = r20_10
      end
      -- close: r15_10
      r13_10.DelayedTargetValues = r14_10
      local r15_10 = {}
      for r20_10, r21_10 in pairs(r11_10.BattleAchievement.TopProcessedValue) do
        r15_10[r20_10] = r21_10
      end
      -- close: r16_10
      r13_10.TopProcessedValue = r15_10
    end
    local r14_10 = {}
    for r19_10, r20_10 in pairs(r0_10.LevelGameMode.SubGameModeInfo) do
      r14_10[r19_10] = r20_10.GameModeFirstActiveEnable
    end
    -- close: r15_10
    local r15_10 = {
      TexturePath = r0_10.EMGameState.DungeonUIInfo.TexturePath,
      TextTitle = r0_10.EMGameState.DungeonUIInfo.TextTitle,
      TextMap = r0_10.EMGameState.DungeonUIInfo.TextMap,
    }
    local r16_10 = {}
    for r20_10 = 1, r0_10.EMGameState.DungeonEvent:Num(), 1 do
      local r21_10 = r0_10.EMGameState.DungeonEvent:GetValueByIdx(r20_10 + -1)
      if r21_10 ~= "ShowPetDefenseDynamicEvent" and r21_10 ~= "ShowPetDefenseProgress" then
        r16_10[r20_10] = r21_10
      end
    end
    local r18_10 = UE.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0).PlayerState
    local r19_10 = {
      RecoveryCount = r18_10.RecoveryCount,
      RecoveryMaxCount = r18_10.RecoveryMaxCount,
    }
    if r11_10 and r11_10:IsDead() and r19_10.RecoveryCount then
      r19_10.RecoveryCount = r19_10.RecoveryCount + 1
    end
    local r21_10 = {
      Eid = r10_10,
      DungeonId = r8_10,
      JsonName = r9_10,
      PlayerData = r4_10,
      PlayerTransform = r12_10,
      DungeonSnapShotData = r7_10,
      DungeonData = r5_10,
      StaticCreatorData = r2_10,
      RandomCreatorData = r3_10,
      SubGameModeData = r14_10,
      BattleAchievementData = r13_10,
      DungeonUIInfoData = r15_10,
      DungeonEventData = r16_10,
      RecoveryCountInfo = r19_10,
      DungeonTimeData = {
        GameTime = r0_10.EMGameState:GetGameEndTime(),
        PlayerTime = r18_10:GetPlayerEndTime(),
      },
      CurStage = r1_10,
    }
    PrintTable(r21_10, 6)
    UE4.UGameplayStatics.GetGameInstance(r0_10):ClearProgressData()
    GWorld:GetAvatar():SaveProgressData(r21_10)
  end,
  RecoverProgressData = function(r0_11)
    -- line: [305, 406] id: 11
    local r1_11 = r0_11:GetProgressData()
    if not r1_11 then
      DebugPrint("ProgressSnapShotComponent       error  no data")
      return 
    end
    DebugPrint("ProgressSnapShotComponent: RecoverProgressData")
    PrintTable(r1_11, 6)
    UE4.UGameplayStatics.GetGameInstance(r0_11):ClearProgressData()
    local r2_11 = r1_11.PlayerData.HpPercent and 1
    local r3_11 = UGameplayStatics.GetPlayerCharacter(r0_11, 0)
    r3_11:SetAttr("Hp", r3_11:GetAttr("MaxHp") * r2_11)
    local r5_11 = TArray(FString)
    for r10_11, r11_11 in pairs(r1_11.PlayerData.CurrentLevelId) do
      r5_11:Add(r11_11)
    end
    -- close: r6_11
    r3_11:SetCurrentLevelId(r5_11)
    if r1_11.BattleAchievementData and r3_11.BattleAchievement then
      for r10_11, r11_11 in pairs(r1_11.BattleAchievementData.DelayedTargetValues) do
        r3_11.BattleAchievement.DelayedTargetValues:Add(r10_11, r11_11)
      end
      -- close: r6_11
      for r10_11, r11_11 in pairs(r1_11.BattleAchievementData.TopProcessedValue) do
        r3_11.BattleAchievement.TopProcessedValue:Add(r10_11, r11_11)
      end
      -- close: r6_11
    end
    for r10_11, r11_11 in pairs(r1_11.StaticCreatorData) do
      local r12_11 = r0_11.EMGameState:GetStaticCreatorInfo(r11_11.StaticCreatorId, r11_11.PrivateEnable, r11_11.LevelName)
      if r12_11 then
        if r11_11.ItemData then
          r12_11:RealActiveStaticCreator({
            DungeonState = r11_11.ItemData,
          })
        else
          r12_11:RealActiveStaticCreator()
        end
      else
        DebugPrint("ProgressSnapShotComponent: 找不到静态点,, StaticCreatorId", r11_11.StaticCreatorId, "PrivateEnable", r11_11.PrivateEnable, "LevelName", r11_11.LevelName)
      end
    end
    -- close: r6_11
    for r10_11, r11_11 in pairs(r1_11.RandomCreatorData) do
      r0_11.RandomActorManager:ProgressDataRecoverRandomActor(r11_11.RandomRuleId, r11_11.RandomLevelName, r11_11.RandomIdxInRule, r11_11.RandomTableId, r11_11.ItemData)
    end
    -- close: r6_11
    r0_11:TriggerDungeonComponentFun("RecoverDungeonRoundData", r1_11.DungeonData)
    r0_11:SetDungeonSnapShotData(r1_11.DungeonSnapShotData)
    for r10_11, r11_11 in pairs(r1_11.SubGameModeData) do
      local r12_11 = r0_11.LevelGameMode.SubGameModeInfo:FindRef(r10_11)
      if r12_11 then
        r12_11.GameModeFirstActiveEnable = r11_11
      else
        DebugPrint("ProgressSnapShot 子GameMode不存在，LevelName：", r10_11)
      end
    end
    -- close: r6_11
    r0_11.EMGameState.DungeonUIInfo.TexturePath = r1_11.DungeonUIInfoData.TexturePath
    r0_11.EMGameState.DungeonUIInfo.TextTitle = r1_11.DungeonUIInfoData.TextTitle
    r0_11.EMGameState.DungeonUIInfo.TextMap = r1_11.DungeonUIInfoData.TextMap
    r0_11.EMGameState:MarkDungeonUIInfoAsDirtyData()
    for r10_11, r11_11 in pairs(r1_11.DungeonEventData) do
      r0_11:AddDungeonEvent(r11_11)
    end
    -- close: r6_11
    r3_11:SetRecoveryCount(r1_11.RecoveryCountInfo.RecoveryCount)
    r3_11:SetRecoveryMaxCount(r1_11.RecoveryCountInfo.RecoveryMaxCount)
    if r1_11.DungeonTimeData then
      r0_11.EMGameState.RecoveredGameTime = r1_11.DungeonTimeData.GameTime and 0
      if r3_11.PlayerState then
        r3_11.PlayerState.RecoveredPlayerTime = r1_11.DungeonTimeData.PlayerTime and 0
      end
    end
  end,
  OnProgressRecoverSucceed = function(r0_12)
    -- line: [408, 411] id: 12
    r0_12.Overridden.OnProgressRecoverSucceed(r0_12)
  end,
  RougeRecordProgressData = function(r0_13, r1_13)
    -- line: [415, 551] id: 13
    if r0_13:IsAllRoomPassed() then
      DebugPrint("ProgressSnapShotComponent: 所有房间已通关后不允许存储")
      return 
    end
    if r0_13:IsDungeonInSettlement() then
      DebugPrint("ProgressSnapShotComponent: 副本已结算后不允许存储")
      return 
    end
    DebugPrint("ProgressSnapShotComponent: RougeRecordProgressData 当前房间是否通关：", GWorld.RougeLikeManager:IsCurRougeLikeRoomClear(), "是否正处于事件关的事件中", GWorld.RougeLikeManager.IsListeningDealRewardEvent and false)
    local r5_13 = UE.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0).PlayerState
    local r6_13 = {
      RecoveryCount = r5_13.RecoveryCount,
      RecoveryMaxCount = r5_13.RecoveryMaxCount,
    }
    local r7_13 = UGameplayStatics.GetPlayerCharacter(r0_13, 0)
    if r7_13 and r7_13:IsDead() and r6_13.RecoveryCount then
      r6_13.RecoveryCount = r6_13.RecoveryCount + 1
    end
    DebugPrint("Tianyi@ 开始暂存肉鸽Buff")
    local r8_13 = {}
    local r9_13 = r7_13.BuffManager
    if r9_13 then
      r8_13 = r9_13:GetBuffsSnapshot()
      PrintTable(r8_13, 6, "BuffsSnapshot", true)
    end
    local r10_13 = {}
    for r15_13, r16_13 in pairs(r0_13.EMGameState.CombatItemMap) do
      if IsValid(r16_13) and r16_13.CreatorId ~= 0 and r16_13.UnitId ~= 112 then
        local r17_13 = {
          StaticCreatorId = r16_13.CreatorId,
          ItemData = r16_13:GetDungeonSaveData() and {},
          PrivateEnable = r16_13.PrivateEnable,
          LevelName = r0_13:GetActorLevelName(r16_13),
        }
        table.insert(r10_13, r17_13)
      end
    end
    -- close: r11_13
    for r15_13, r16_13 in pairs(r0_13.EMGameState.NpcMap) do
      if IsValid(r16_13) and r16_13.CreatorId then
        table.insert(r10_13, {
          StaticCreatorId = r16_13.CreatorId,
          PrivateEnable = r16_13.PrivateEnable,
          LevelName = r0_13:GetActorLevelName(r16_13),
        })
      end
    end
    -- close: r11_13
    local r11_13 = GWorld.RougeLikeManager.StaticCreatorIdToShopId
    local r12_13 = {
      Count = r0_13.EMGameState.RougeBattleCount,
      MaxNum = r0_13.EMGameState.RougeBattleMaxNum,
    }
    local r13_13 = GWorld.RougeLikeManager:GetOrAddDataSetObject()
    local r14_13 = {
      SetInt = r13_13.ExtraInt:ToTable(),
      SetBool = r13_13.ExtraBool:ToTable(),
      SetFloat = r13_13.ExtraFloat:ToTable(),
      SetVector = r13_13.ExtraVector:ToTable(),
      SaveLoc = r13_13.SaveLocations:ToTable(),
      SetString = r13_13.ExtraString:ToTable(),
    }
    local r21_13 = {
      TreasureMonProb = r0_13.TreasureMonsterSpawnProbability,
      TreasureMonCreatedNum = r0_13.TreasureMonsterCreatedNum,
    }
    local r22_13 = {}
    if r0_13.EMGameState.DungeonUIInfo.TextMap ~= "" then
      r22_13 = {
        TexturePath = r0_13.EMGameState.DungeonUIInfo.TexturePath,
        TextTitle = r0_13.EMGameState.DungeonUIInfo.TextTitle,
        TextMap = r0_13.EMGameState.DungeonUIInfo.TextMap,
        RougeLikeSubTaskText = r0_13.RougeLikeSubTaskText,
      }
    end
    local r25_13 = {
      IsRougeLike = true,
      DungeonId = r0_13.DungeonId,
      PassRoomExtraInfo = r1_13,
      RecoveryCountInfo = r6_13,
      StaticCreatorData = r10_13,
      BattleProgressNums = r12_13,
      ShopInfo = r11_13,
      BuffsSnapshot = r8_13,
      DataSetObjInfo = r14_13,
      TreasureMonInfo = r21_13,
      DungeonUIInfoData = r22_13,
      IsSimpleDesc = GWorld.RougeLikeManager.IsSimpleDesc,
      IsListeningDealRewardEvent = GWorld.RougeLikeManager.IsListeningDealRewardEvent,
    }
    PrintTable(r25_13, 6, "ResData")
    UE4.UGameplayStatics.GetGameInstance(r0_13):ClearProgressData()
    GWorld:GetAvatar():SaveProgressData(r25_13)
  end,
  RougeRecoverProgressData = function(r0_14)
    -- line: [553, 800] id: 14
    local r1_14 = r0_14:GetProgressData()
    if not r1_14 then
      DebugPrint("ProgressSnapShotComponent       error  no data")
      return 
    end
    local r2_14 = GWorld.RougeLikeManager:IsCurRougeLikeRoomClear()
    local r3_14 = r1_14.IsListeningDealRewardEvent and false
    DebugPrint("ProgressSnapShotComponent: RougeRecoverProgressData 当前房间是否通关：", r2_14, "是否正处于事件关的事件中", r3_14)
    PrintTable(r1_14, 6)
    UE4.UGameplayStatics.GetGameInstance(r0_14):ClearProgressData()
    local r4_14 = UE.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
    local r5_14 = UGameplayStatics.GetPlayerCharacter(r0_14, 0)
    local r6_14 = r4_14.PlayerState
    r6_14:SetRecoveryCount(r1_14.RecoveryCountInfo.RecoveryCount)
    r6_14:SetRecoveryMaxCount(r1_14.RecoveryCountInfo.RecoveryMaxCount)
    local r7_14 = r1_14.BuffsSnapshot
    local r8_14 = 0
    DebugPrint("Tianyi@ 开始恢复Buff")
    for r13_14, r14_14 in ipairs(r7_14) do
      local r15_14 = r14_14.BuffId
      local r16_14 = DataMgr.Buff[r15_14]
      if not r16_14 then
        DebugPrint("Tianyi@ Buff恢复失败, 存在非法BuffId: ", r15_14)
      else
        local r17_14 = r16_14.MergeRule2
        if r17_14 == "Merge" then
          local r18_14 = r14_14.bForever
          if r18_14 then
            r18_14 = -1 and r14_14.LastTime
          else
            goto label_83	-- block#10 is visited secondly
          end
          if Battle(r0_14):AddBuffToTarget(r5_14, r5_14, r15_14, r18_14, r14_14.Value, r5_14, r14_14.Layer):Num() > 0 then
            r8_14 = r8_14 + 1
          end
        elseif r17_14 == "NewFree" then
          local r18_14 = nil
          for r22_14 = 1, #r14_14.FreeLayerInfos, 1 do
            local r23_14 = r14_14.FreeLayerInfos[r22_14]
            if r22_14 == 1 then
              local r24_14 = r23_14.bForever
              if r24_14 then
                r24_14 = -1 and r23_14.LastTime
              else
                goto label_121	-- block#18 is visited secondly
              end
              r18_14 = Battle(r0_14):AddBuffToTarget(r5_14, r5_14, r15_14, r24_14, r23_14.Value, r5_14, 1)
              if r18_14:Num() > 0 then
                r8_14 = r8_14 + 1
              end
            elseif r18_14 then
              local r24_14 = r18_14:GetRef(1)
              if r24_14 then
                Battle(r0_14):IncreaseBuffLayerFromTarget(r24_14, r5_14, r23_14.LastTime, r23_14.Value, r5_14:GetSkillLevelInfo(), 1, false)
              end
            else
              DebugPrint("Tianyi@ AddedBuffs is nil")
            end
          end
        end
      end
    end
    -- close: r9_14
    if #r7_14 > 0 then
      r5_14:RefreshBuff()
      if r8_14 == #r7_14 then
        DebugPrint("Tianyi@ Buff恢复成功")
      else
        DebugPrint("Tianyi@ Buff恢复失败, 恢复了" .. tostring(r8_14) .. "个Buff, 但总共有" .. tostring(#r7_14) .. "个Buff")
      end
    end
    local r9_14 = r1_14.DataSetObjInfo
    local r10_14 = GWorld.RougeLikeManager:GetOrAddDataSetObject()
    if r1_14.TreasureMonInfo then
      r0_14.TreasureMonsterCreatedNum = r1_14.TreasureMonInfo.TreasureMonCreatedNum
      r0_14.TreasureMonsterSpawnProbability = r1_14.TreasureMonInfo.TreasureMonProb
    end
    local r11_14 = r0_14:GetPlayerSliceData()
    local r12_14 = r11_14:Length()
    local r13_14 = {}
    local r14_14 = {}
    for r18_14 = r12_14, 1, -1 do
      local r19_14 = r1_0:UnSerialize(r11_14[r18_14])
      local r20_14 = r19_14.Type
      local r21_14 = r19_14.Value
      if not r13_14[r20_14] then
        DebugPrint("Tianyi@ Reocver Player State, Type = " .. tostring(r20_14) .. " Value = ")
        PrintTable(r21_14, 10)
        if r20_14 == Const.RougeSliceInfoType.RecoverCount then
          r5_14:SetRecoveryCount(r21_14.RecoveryCount)
          r13_14[r20_14] = true
        elseif r20_14 == Const.RougeSliceInfoType.TreasureMonCount then
          r0_14.TreasureMonsterCreatedNum = r21_14.TreasureMonCount
          DebugPrint("RougeLike Recover, TreasureMonsterCreatedNum =", r0_14.TreasureMonsterCreatedNum)
          r13_14[r20_14] = true
        elseif r20_14 == Const.RougeSliceInfoType.BlueprintValue and not r14_14[r21_14.Key] then
          local r22_14 = r21_14.DataType
          local r23_14 = r21_14.DataValue
          r9_14[r22_14] = r9_14[r22_14] and {}
          r9_14[r22_14][r21_14.Key] = r23_14
          r14_14[r21_14.Key] = true
        end
      end
    end
    UE4.UGameplayStatics.GetGameInstance(r0_14):ClearPlayerSliceData()
    for r19_14, r20_14 in pairs(r9_14) do
      for r25_14, r26_14 in pairs(r20_14) do
        local r27_14 = GWorld.RougeLikeManager[r19_14]
        if r27_14 and type(r27_14) == "function" then
          r27_14(GWorld.RougeLikeManager, r25_14, r26_14)
          DebugPrint("Tianyi@ 恢复了蓝图数据: ", r25_14, r26_14)
        else
          DebugPrint("Tianyi@ 恢复蓝图数据失败, 不存在该函数: ", r19_14)
        end
      end
      -- close: r21_14
    end
    -- close: r15_14
    Battle(r0_14):TriggerBattleEvent(BattleEventName.RougeParamRecover, r5_14, GWorld.RougeLikeManager)
    if r3_14 or r2_14 then
      local r15_14 = r1_14.StaticCreatorData
      if r15_14 then
        for r20_14, r21_14 in pairs(r15_14) do
          local r22_14 = r0_14.EMGameState:GetStaticCreatorInfo(r21_14.StaticCreatorId, r21_14.PrivateEnable, r21_14.LevelName)
          if r22_14 then
            if r21_14.ItemData then
              r22_14:RealActiveStaticCreator({
                DungeonState = r21_14.ItemData,
              })
            else
              r22_14:RealActiveStaticCreator()
            end
          else
            DebugPrint("找不到静态点,, StaticCreatorId", r21_14.StaticCreatorId, "PrivateEnable", r21_14.PrivateEnable, "LevelName", r21_14.LevelName)
          end
        end
        -- close: r16_14
      end
      local r16_14 = r1_14.ShopInfo
      if r16_14 then
        GWorld.RougeLikeManager.StaticCreatorIdToShopId = r16_14
      end
    end
    if r3_14 or r2_14 then
      for r19_14, r20_14 in pairs(r0_14.LevelGameMode.SubGameModeInfo) do
        r20_14.GameModeFirstActiveEnable = false
        DebugPrint("ProgressSnapShotComponent: SubGameMode", r19_14, r20_14:GetName(), "关闭OnFirstActive")
      end
      -- close: r15_14
    end
    if (r3_14 or r2_14) and r1_14.DungeonUIInfoData.TextMap and r1_14.DungeonUIInfoData.TextMap ~= "" then
      r0_14:NotifyClientShowDungeonTaskNew(r1_14.DungeonUIInfoData.TexturePath, r1_14.DungeonUIInfoData.TextTitle, r1_14.DungeonUIInfoData.TextMap)
      local r18_14 = r1_14.DungeonUIInfoData.RougeLikeSubTaskText
      if r18_14 then
        r0_14:InitRougeLikeSubTask(r18_14)
      end
    end
    if r2_14 then
      local r15_14 = r1_14.BattleProgressNums
      if r15_14 then
        r0_14.EMGameState:SetRougeBattleNums(r15_14.Count, r15_14.MaxNum)
      end
    end
    GWorld.RougeLikeManager.IsSimpleDesc = r1_14.IsSimpleDesc
    if r1_14.IsListeningDealRewardEvent and not r2_14 then
      GWorld.RougeLikeManager:ListenDealRewardEvent()
      if GWorld.RougeLikeManager.EventId <= 0 and GWorld.RougeLikeManager.RandomBlessings:Num() <= 0 and GWorld.RougeLikeManager.RandomTreasures:Num() <= 0 then
        EventManager:FireEvent(EventID.OnRougeDealEventReward)
      end
    end
    if r2_14 then
      GWorld.RougeLikeManager:OnPassRoom(true)
    end
    local r15_14 = GWorld.RougeLikeManager.EventId
    DebugPrint("ProgressSnapShotComponent 当前事件ID为：", r15_14)
    if r15_14 > 0 then
      local r16_14 = DataMgr.RougeLikeEventSelect[r15_14].GameModeEvent
      if r16_14 then
        DebugPrint("ProgressSnapShotComponent: 恢复触发事件关事件", r16_14)
        r0_14:PostCustomEvent(r16_14)
      end
    end
    if r1_14.PassRoomExtraInfo.IsRougeFinished and GWorld.RougeLikeManager.StoryId ~= 0 then
      DebugPrint("ProgressSnapShotComponent: 恢复触发通关Story", GWorld.RougeLikeManager.StoryId, "是否通关:", r1_14.PassRoomExtraInfo.IsWin)
      r0_14:ShowFinishRougeStory(r1_14.PassRoomExtraInfo.IsWin)
    end
  end,
  AbyssRecordProgressData = function(r0_15, r1_15)
    -- line: [803, 835] id: 15
    DebugPrint("ProgressSnapShotComponent: AbyssRecordProgressData")
    local r5_15 = {
      IsAbyss = true,
      DungeonId = r0_15.DungeonId,
      AbyssLogicServerInfo = r0_15:GetDungeonComponent().AbyssLogicServerInfo,
      JsonName = UE4.URuntimeCommonFunctionLibrary.GetLevelLoadJsonName(r0_15),
      PlayerTransform = r0_0:SerializeFTransform(UGameplayStatics.GetPlayerCharacter(r0_15, 0):GetTransform()),
      LastLevelId = r1_15.LastLevelId,
      NewLevelId = r1_15.NewLevelId,
      AbyssRoomIndex = r0_15:TriggerDungeonComponentFun("GetAbyssRoomIndex"),
      PreAbyssLevelProgress = GWorld.GameInstance.PreAbyssLevelProgress,
    }
    PrintTable(r5_15, 6)
    UE4.UGameplayStatics.GetGameInstance(r0_15):ClearProgressData()
    GWorld:GetAvatar():SaveProgressData(r5_15)
  end,
  AbyssRecoverProgressData = function(r0_16)
    -- line: [837, 863] id: 16
    local r1_16 = r0_16:GetProgressData()
    if not r1_16 then
      DebugPrint("ProgressSnapShotComponent    Abyss   error  no data")
      return 
    end
    DebugPrint("ProgressSnapShotComponent: AbyssRecoverProgressData")
    PrintTable(r1_16, 6)
    UE4.UGameplayStatics.GetGameInstance(r0_16):ClearProgressData()
    r0_16:TriggerDungeonComponentFun("InitGlobalPassive")
    r0_16:GetDungeonComponent().AbyssRoomIndex = r1_16.AbyssRoomIndex
    r0_16:TriggerDungeonComponentFun("TriggerStartNextRoom", r1_16.LastLevelId, r1_16.NewLevelId)
    GWorld.GameInstance.PreAbyssLevelProgress = r1_16.PreAbyssLevelProgress
  end,
  GetProgressDataAbyssLogicServerInfo = function(r0_17)
    -- line: [865, 871] id: 17
    local r1_17 = r0_17:GetProgressData()
    if r1_17 then
      return r1_17.AbyssLogicServerInfo
    end
    return nil
  end,
}
