-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\GameMode\Components\RewardGenComponent.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("BluePrints.GameMode.Components.GameModeRewardParseComponent")
local r1_0 = require("Utils.ItemUtils")
local r2_0 = require("CommonConst")
local r3_0 = require("BluePrints.Client.CustomTypes.SimpleRewardBox")
local r4_0 = TArray(0)
local r5_0 = {}
local r6_0 = {
  [r2_0.RewardReason.MonsterDead] = true,
  [r2_0.RewardReason.PickUp] = true,
}
function r5_0.InitRewardParams(r0_1)
  -- line: [19, 32] id: 1
  r0_1.RewardPerFrame = 20
  r0_1.CacheFrontIndex = 1
  r0_1.CacheRearIndex = 1
  r0_1.CacheBattleRewards = {}
  r0_1.CacheLogicRewards = {}
  r0_1.CacheEid2AvatarEid = {}
  r0_1.bNeedNotifyClientCreateDrop = false
end
function r5_0.TickGenReward(r0_2, r1_2)
  -- line: [34, 65] id: 2
  if r0_2.bNeedNotifyClientCreateDrop then
    r0_2.EMGameState:ClientCreateReward()
    r0_2.bNeedNotifyClientCreateDrop = false
  end
  if r0_2.CacheFrontIndex < r0_2.CacheRearIndex then
    for r5_2 = 1, r0_2.RewardPerFrame, 1 do
      r0_2.CacheBattleRewards[r0_2.CacheFrontIndex] = nil
      r0_2.CacheFrontIndex = r0_2.CacheFrontIndex + 1
      r0_2:RealGenerateReward(table.unpack(r0_2.CacheBattleRewards[r0_2.CacheFrontIndex]))
      if r0_2.CacheRearIndex <= r0_2.CacheFrontIndex then
        break
      end
    end
  end
  if not next(r0_2.CacheLogicRewards) then
    return 
  end
  local r2_2 = GWorld:GetServerEntity()
  if not r2_2 then
    return 
  end
  r0_2.CacheLogicRewards = {}
  r2_2:TriggerRewardEvent(r0_2.CacheLogicRewards)
end
function r5_0.AddCacheBattleReward(r0_3, r1_3, r2_3, r3_3, r4_3)
  -- line: [67, 74] id: 3
  if #r1_3 == 0 then
    return 
  end
  r0_3.CacheBattleRewards[r0_3.CacheRearIndex] = {
    r1_3,
    r2_3,
    r3_3,
    r4_3
  }
  r0_3.CacheRearIndex = r0_3.CacheRearIndex + 1
end
function r5_0.RealGenerateReward(r0_4, r1_4, r2_4, r3_4, r4_4)
  -- line: [76, 79] id: 4
  r0_4:ResolveRewardsInBattle(RewardUtils:GetRewards(r1_4), r2_4, r3_4, r4_4)
end
function r5_0.TriggerRewardEvent(r0_5, r1_5, r2_5, r3_5, r4_5, r5_5)
  -- line: [81, 88] id: 5
  DebugPrint("TriggerRewardEvent", r1_5, r2_5, r3_5)
  if not r4_5 then
    r4_5 = {}
  end
  r4_5.Avatar = r0_5:GetAvatarEidByBattleEid(rawget(r4_5, "SourceEid"))
  return r0_5:AddCacheGenUnitReward(r1_5, r2_5, r3_5, r4_5, r5_5)
end
function r5_0.AddCacheGenUnitReward(r0_6, r1_6, r2_6, r3_6, r4_6, r5_6)
  -- line: [91, 124] id: 6
  local r6_6, r7_6 = r0_0:ParseReward(r1_6, r2_6, r4_6)
  if not r6_6 then
    print(_G.LogTag, "Cannot Generate Reward for UnitId:", r1_6, "Reason:", r2_6)
    return false
  end
  if r2_6 == r2_0.RewardReason.MonsterDead then
    r0_6:GetMonsterSpawnRewardId(r1_6, r4_0)
    for r12_6, r13_6 in pairs(r4_0) do
      DebugPrint("Add GetMonsterSpawnRewardId", r13_6)
      r7_6[#r7_6 + 1] = r13_6
    end
    -- close: r8_6
  end
  local r8_6 = false
  if not r4_6.Avatar then
    r0_6:AddCacheBattleReward(r7_6, r2_6, r3_6, r4_6)
  else
    local r9_6, r10_6 = RewardUtils:SplitBattleRewards(r7_6)
    r0_6:AddCacheBattleReward(r10_6, r2_6, r3_6, r4_6)
    if #r9_6 > 0 or r6_0[r2_6] then
      r0_6:AddCacheLogicUnitReward(r1_6, r2_6, r3_6, r4_6, r5_6)
      r8_6 = true
    end
  end
  return r8_6
end
function r5_0.AddCacheLogicUnitReward(r0_7, r1_7, r2_7, r3_7, r4_7, r5_7)
  -- line: [126, 148] id: 7
  local r6_7 = r4_7.Avatar
  if not r6_7 then
    r0_7:AddCacheBattleUnitReward(r1_7, r2_7, r3_7, r4_7)
    return 
  end
  r4_7.Avatar = nil
  DebugPrint("AddCacheLogicUnitReward", r1_7, r2_7)
  local r7_7 = r0_7.CacheLogicRewards[r6_7]
  if not r7_7 then
    r7_7 = {
      UpValues = {},
      Rewards = {},
    }
  end
  local r8_7 = CommonUtils.LocationToTable(r3_7.Translation)
  r7_7.UpValues[#r7_7.UpValues + 1] = {
    r2_7,
    r3_7,
    r4_7,
    r5_7
  }
  r7_7.Rewards[#r7_7.Rewards + 1] = {
    r1_7,
    r2_7,
    r4_7,
    r8_7
  }
  r0_7.CacheLogicRewards[r6_7] = r7_7
end
function r5_0.AddCacheBattleUnitReward(r0_8, r1_8, r2_8, r3_8, r4_8)
  -- line: [150, 157] id: 8
  local r5_8, r6_8 = r0_0:ParseReward(r1_8, r2_8, r4_8)
  if not r5_8 then
    print(_G.LogTag, "Cannot Generate Reward for UnitId:", r1_8, "Reason:", r2_8)
    return 
  end
  r0_8:AddCacheBattleReward(r6_8, r2_8, r3_8, r4_8)
end
function r5_0.GetAvatarEidByBattleEid(r0_9, r1_9)
  -- line: [159, 184] id: 9
  if not r1_9 then
    return 
  end
  local r2_9 = r0_9.CacheEid2AvatarEid[r1_9]
  if r2_9 then
    return r2_9
  end
  local r3_9 = Battle(r0_9):GetEntity(r1_9)
  if not r3_9:IsPlayer() then
    print(_G.LogTag, "Cannot Generate Logic Reward for Player Character is nil")
    return 
  end
  local r4_9 = r3_9:GetController()
  if not r4_9 then
    print(_G.LogTag, "Cannot Generate Logic Reward for Player Character has no Controller")
    return 
  end
  r2_9 = CommonUtils.Str2ObjId(r4_9.AvatarEidStr)
  r0_9.CacheEid2AvatarEid[r1_9] = r2_9
  return r2_9
end
function r5_0.ResolveRewardsInBattle(r0_10, r1_10, r2_10, r3_10, r4_10, r5_10)
  -- line: [187, 191] id: 10
  DebugPrint("ResolveRewardsInBattle", r2_10, r3_10)
  r0_10:ResolveExpInBattle(r1_10, r2_10, r4_10, r5_10)
  r0_10:HandleRewardDrop(rawget(r1_10, "Drops"), r2_10, r3_10, r4_10, r5_10)
end
function r5_0.ResolveExpInBattle(r0_11, r1_11, r2_11, r3_11, r4_11)
  -- line: [193, 208] id: 11
  if not r4_11 then
    return 
  end
  local r5_11 = r4_11.Avatar
  local r6_11 = r0_11.BattleAvatars[r5_11]
  if not r6_11 then
    DebugPrint("ResolveExpInBattle no Character", r5_11)
    return 
  end
  r0_11:GetExpMap(r6_11, r1_11, r2_11, r3_11)
  r0_11:HandleExpInBattle()
  r0_11.ExpMap:Clear()
end
function r5_0.GetExpMap(r0_12, r1_12, r2_12)
  -- line: [211, 219] id: 12
  local r3_12 = rawget(r2_12, "Exps")
  if not r3_12 then
    return 
  end
  r0_12:SingleAddExpToMap(r1_12.Eid, r3_0:GetCount(r3_12[r2_0.CharExpItemId]), r3_0:GetCount(r3_12[r2_0.MeleeWeaponExpItemId]), r3_0:GetCount(r3_12[r2_0.RangedWeaponExpItemId]))
end
function r5_0.HandleRewardDrop(r0_13, r1_13, r2_13, r3_13, r4_13, r5_13)
  -- line: [221, 275] id: 13
  if not r1_13 then
    return 
  end
  if not r5_13 then
    r5_13 = {}
  end
  local r6_13 = r0_13.EMGameState
  local r7_13 = r0_13:GetItemLevelId(r3_13.Translation)
  local function r8_13(r0_14, r1_14, r2_14, r3_14)
    -- line: [228, 250] id: 14
    DebugPrint("HandleRewardDrop in Dungeon1111", r0_14, r1_14)
    if r0_13.LevelGameMode.DropRule[r0_14] then
      return 
    end
    DebugPrint("HandleRewardDrop in Dungeon2222", r0_14, r1_14)
    if IsStandAlone(r0_13) then
      if r0_13:IsInRegion() then
        DebugPrint("ZJT_ 111111111111111 DropId ,Count ", r0_14, r2_14, r3_14)
        r6_13.EventMgr:RealSpawnRewards_Region(r0_14, r1_14, r3_13, r2_13, r4_13, r2_14, r3_14, r5_13.RewardDropDatas)
      else
        DebugPrint("HandleRewardDrop in Dungeon", r0_14, r1_14)
        r6_13.EventMgr:RealSpawnRewards_Normal(r0_14, r1_14, r3_13, r2_13, r4_13, r2_14)
      end
    elseif IsDedicatedServer(r0_13) then
      if r1_0:IsServerCreate(r0_14) then
        r6_13.EventMgr:RealSpawnRewards_Normal(r0_14, r1_14, r3_13, r2_13, r4_13, r2_14)
      else
        print(_G.LogTag, "CreateDrop For Player", r0_14)
        r0_13:PickupToSpecPlayer(r0_14, r1_14, r5_13.Avatar and "", r2_13, r3_13, r7_13, r2_14)
        r0_13.bNeedNotifyClientCreateDrop = true
      end
    end
  end
  if r4_13 and r4_13.MultiWave and r0_13:IsInDungeon() then
    local r9_13 = Battle(r0_13):GetEntity(r4_13.ParentEid)
    print(_G.LogTag, "HandleCreateDrop For Player", r5_13.Avatar)
    r9_13:MultiWaveCreateDrop(r1_13, r8_13, r5_13.Avatar)
  else
    for r13_13, r14_13 in pairs(r1_13) do
      r13_13 = tonumber(r13_13)
      local r15_13 = r3_0:FindCountByTag(r14_13, "Extra")
      local r16_13 = 0
      if r15_13 > 0 then
        r16_13 = r15_13
        r8_13(r13_13, r15_13, true, 0)
      end
      local r17_13 = r3_0:FindCountByTag(r14_13, "Normal")
      if r17_13 > 0 then
        r8_13(r13_13, r17_13, false, r16_13)
      end
    end
    -- close: r9_13
  end
end
function r5_0.TriggerGenerateRewardForMonsterDeath(r0_15, r1_15, r2_15, r3_15, r4_15, r5_15, r6_15, r7_15, r8_15, r9_15, r10_15, r11_15)
  -- line: [277, 307] id: 15
  r2_15 = UE4.FTransform(r2_15.Rotation, r2_15.Translation)
  if r6_15 == "" then
    r6_15 = nil
  end
  r0_15:TriggerRewardEvent(r1_15, r2_0.RewardReason.MonsterDead, r2_15, {
    UniqueSign = r3_15,
    SourceEid = r4_15,
    bKilledByPlayer = r5_15,
    WeaponType = r6_15,
    Level = r7_15,
    IsSummonMonster = r9_15,
  }, function(r0_16)
    -- line: [292, 305] id: 16
    if not r0_16 then
      return 
    end
    local r1_16 = 0
    local r2_16 = rawget(r0_16, "Exps")
    if r2_16 then
      for r7_16, r8_16 in pairs(r2_16) do
        r1_16 = r1_16 + r3_0:GetCount(r8_16)
      end
      -- close: r3_16
    end
    if r0_15.GameState and r1_16 > 0 then
      r0_15.GameState:AddMonDeadShowJumpWordInfo(r10_15, r1_16, r4_15, r11_15)
    end
    DebugPrint("Component:TriggerGenerateRewardForMonsterDeath", r1_16)
  end)
end
function r5_0.FlushRewards(r0_17)
  -- line: [309, 312] id: 17
  DebugPrint("FlushRewards")
  r0_17:TickGenReward(0)
end
return r5_0
