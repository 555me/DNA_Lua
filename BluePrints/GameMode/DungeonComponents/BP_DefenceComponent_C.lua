-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\GameMode\DungeonComponents\BP_DefenceComponent_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.GameMode.DungeonComponents.BP_DungeonVoteComponent_C"
})
function r0_0.InitDefenceComponent(r0_1)
  -- line: [9, 31] id: 1
  r0_1.GameMode = r0_1:GetOwner()
  r0_1:InitVoteComponent()
  r0_1.GameMode.EMGameState:SetDefenceWaveInterval(DataMgr.GlobalConstant.DefenceWaveInterval.ConstantValue and 5)
  r0_1.DefenceInfo = r0_1:GetDataMgrInfo()
  if not r0_1.DefenceInfo then
    GameState(r0_1):ShowDungeonError("DefenceComponent:当前副本ID没有填写在对应的副本表中, 读表失败! 读入Id：" .. r0_1.GameMode.DungeonId, Const.DungeonErrorType.DungeonGame, Const.DungeonErrorTitle.Config)
    return 
  end
  r0_1.MonsterTotalBaseNum = r0_1.DefenceInfo.MonsterTotalBaseNum and 15
  r0_1.MonsterTotalNum = r0_1.MonsterTotalBaseNum
  r0_1.MonsterSpawnIds = r0_1.DefenceInfo.MonsterSpawnId
  r0_1.bMissionSwitched = false
  r0_1.bMonRuleReseted = false
  r0_1.GameMode:InitCreateEmergencyMonsterProb("Butcher", r0_1, r0_1.DefenceInfo)
  r0_1.GameMode.EMGameState:SetDefenceWavesPerStage(r0_1.DefenceInfo.WavesPerStage and 3)
  r0_1.EnsureGuideTime = r0_1.DefenceInfo.EnsureGuideTime and -1
end
function r0_0.GetDataMgrInfo(r0_2)
  -- line: [34, 36] id: 2
  return DataMgr.Defence[r0_2.GameMode.DungeonId]
end
function r0_0.RecordDungeonRoundData(r0_3)
  -- line: [39, 47] id: 3
  local r1_3 = {
    DungeonProgress = r0_3.GameMode.EMGameState.DungeonProgress,
    GameModeLevel = r0_3.GameMode:GetGameModeLevel(),
    DefenceWave = r0_3.GameMode.EMGameState.DefenceWave,
  }
  PrintTable(r1_3, 2)
  return r1_3
end
function r0_0.RecoverDungeonRoundData(r0_4, r1_4)
  -- line: [49, 54] id: 4
  PrintTable(r1_4, 2)
  r0_4.GameMode.EMGameState:SetDungeonProgress(r1_4.DungeonProgress)
  r0_4.GameMode.EMGameState:SetGameModeLevel(r1_4.GameModeLevel)
  r0_4.GameMode.EMGameState:SetDefenceWave(r1_4.DefenceWave)
end
function r0_0.WaveStart(r0_5)
  -- line: [57, 64] id: 5
  r0_5.GameMode:CreateEmergencyMonsterEachWave("Butcher", r0_5, r0_5.DefenceInfo)
  r0_5.MonsterTotalNum = r0_5.MonsterTotalBaseNum
  r0_5.GameMode:TriggerCreateMonsterSpawn(r0_5:GetMonsterSpawnId())
  r0_5.bMonRuleReseted = false
  r0_5:InitEnsureGuideTimerEachWave()
end
function r0_0.GetMonsterSpawnId(r0_6)
  -- line: [66, 72] id: 6
  local r1_6 = r0_6:GetWaveIndex() % #r0_6.MonsterSpawnIds
  if r1_6 == 0 then
    r1_6 = #r0_6.MonsterSpawnIds
  end
  return r0_6:TableToTArray(r0_6.MonsterSpawnIds[r1_6])
end
function r0_0.TriggerMonsterDead(r0_7, r1_7)
  -- line: [74, 106] id: 7
  if r1_7.CreatorType and r1_7.CreatorId and r1_7:GetCamp() == ECampName.Monster then
    r0_7.MonsterTotalNum = r0_7.MonsterTotalNum + -1
    if r0_7.MonsterTotalNum <= 0 then
      if r0_7:GetMonsterNum() <= 6 and r0_7:GetMonsterNum() > 0 then
        for r6_7, r7_7 in pairs(r0_7.GameMode.EMGameState.MonsterMap) do
          if IsValid(r7_7) and not r7_7:IsDead() and r7_7.UnitType == "Monster" and r0_7.GameMode:CheckCanGuide(r7_7.UnitId, r7_7.UnitType) then
            r0_7.GameMode.EMGameState:AddGuideEid(r7_7.Eid)
          end
        end
        -- close: r2_7
        if not r0_7.bMissionSwitched then
          r0_7.bMissionSwitched = true
          r0_7.GameMode:TriggerGameModeEvent("OnShowRemainMonster")
        end
      elseif r0_7:GetMonsterNum() == 0 then
        r0_7.bMissionSwitched = false
      end
      if not r0_7.bMonRuleReseted then
        r0_7.bMonRuleReseted = true
        r0_7.GameMode:DestroyAllMonsterSpawn()
        r0_7:AddTimer(3.5, function()
          -- line: [99, 102] id: 8
          r0_7:AddTimer(2, r0_7.MonsterNumCheck, true, 0, "MonsterNumCheck")
          r0_7:AddTimer(5, r0_7.FallbackNumCheck, true, 0, "FallbackNumCheck")
        end, false, 0, "MonRuleReset")
      end
    end
  end
end
function r0_0.MonsterNumCheck(r0_9)
  -- line: [108, 113] id: 9
  DebugPrint("DefenceComponent MonsterNumCheck, GetMonsterNum:", r0_9:GetMonsterNum(), "MonsterTotalNum:", r0_9.MonsterTotalNum)
  if r0_9:GetMonsterNum() == 0 and r0_9.MonsterTotalNum <= 0 then
    r0_9:DoWaveEnd()
  end
end
function r0_0.FallbackNumCheck(r0_10)
  -- line: [115, 132] id: 10
  DebugPrint("DefenceComponent FallbackNumCheck, GetMonsterNum:", r0_10:GetMonsterNum())
  if r0_10.GameMode.MonsterSpawnMap:Num() > 0 then
    DebugPrint("DefenceComponent FallbackNumCheck 仍存在MonsterSpawn")
    return 
  end
  if r0_10:CheckMonsterExists() then
    DebugPrint("DefenceComponent FallbackNumCheck 场上仍存在怪物ActorActor")
    return 
  end
  DebugPrint("DefenceComponent FallbackNumCheck Fallback Triggered! MonsterNum:", r0_10:GetMonsterNum())
  r0_10.GameMode.EMGameState.MonsterNum = 0
  r0_10:DoWaveEnd()
end
function r0_0.CheckMonsterExists(r0_11)
  -- line: [134, 141] id: 11
  for r5_11, r6_11 in pairs(r0_11.GameMode.EMGameState.MonsterMap) do
    if IsValid(r6_11) and r6_11.IsRealMonster and r6_11:IsRealMonster() then
      return true
    end
  end
  -- close: r1_11
  return false
end
function r0_0.DoWaveEnd(r0_12)
  -- line: [145, 151] id: 12
  r0_12:ClearEnsureGuideTimer()
  r0_12.GameMode:PostCustomEvent("DefenceWaveEnd")
  r0_12:RemoveTimer("MonsterNumCheck")
  r0_12:RemoveTimer("FallbackNumCheck")
  r0_12.GameMode:TriggerGameModeEvent("OnShowDefenceTarget")
end
function r0_0.OnDefenceCoreActive(r0_13)
  -- line: [153, 155] id: 13
  r0_13.GameMode.EMGameState:SetDungeonUIState(Const.EDungeonUIState.OnTarget)
end
function r0_0.GetMonsterNum(r0_14)
  -- line: [157, 159] id: 14
  return r0_14.GameMode.EMGameState.MonsterNum
end
function r0_0.GetWaveIndex(r0_15)
  -- line: [161, 163] id: 15
  return r0_15.GameMode.EMGameState.DefenceWave
end
function r0_0.AddWaveIndex(r0_16, r1_16)
  -- line: [165, 167] id: 16
  r0_16.GameMode.EMGameState:SetDefenceWave(r0_16.GameMode.EMGameState.DefenceWave + r1_16)
end
function r0_0.SetWaveIndex(r0_17, r1_17)
  -- line: [169, 171] id: 17
  r0_17.GameMode.EMGameState:SetDefenceWave(r1_17)
end
function r0_0.TableToTArray(r0_18, r1_18)
  -- line: [173, 181] id: 18
  local r2_18 = TArray(0)
  if r1_18 then
    for r7_18, r8_18 in ipairs(r1_18) do
      r2_18:Add(r8_18)
    end
    -- close: r3_18
  end
  return r2_18
end
function r0_0.InitEnsureGuideTimerEachWave(r0_19)
  -- line: [183, 192] id: 19
  if r0_19.EnsureGuideTime < 0 then
    return 
  end
  r0_19:AddTimer(r0_19.EnsureGuideTime, function()
    -- line: [188, 191] id: 20
    r0_19:DoEnsureGuide()
    r0_19:AddTimer(5, r0_19.DoEnsureGuide, true, 0, "DoEnsureGuide")
  end, false, 0, "EnsureGuideDelayTimer")
end
function r0_0.DoEnsureGuide(r0_21)
  -- line: [194, 211] id: 21
  for r5_21, r6_21 in pairs(r0_21.GameMode.EMGameState.MonsterMap) do
    if IsValid(r6_21) and not r6_21:IsDead() and r6_21.UnitType == "Monster" and r0_21.GameMode:CheckCanGuide(r6_21.UnitId, r6_21.UnitType) then
      r0_21.GameMode.EMGameState:AddGuideEid(r6_21.Eid)
    end
  end
  -- close: r1_21
end
function r0_0.ClearEnsureGuideTimer(r0_22)
  -- line: [213, 216] id: 22
  r0_22:RemoveTimer("EnsureGuideDelayTimer")
  r0_22:RemoveTimer("DoEnsureGuide")
end
return r0_0
