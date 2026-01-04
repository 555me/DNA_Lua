-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\GameMode\DungeonComponents\BP_ExterminateBaseComponent_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.Common.DelayFrameComponent"
})
function r0_0.InitExterminateBaseComponent(r0_1)
  -- line: [8, 43] id: 1
  r0_1.GameMode = r0_1:GetOwner()
  r0_1.NowGuideEids = {}
  r0_1.HasGuideUpdateRequest = {}
  r0_1.Success = false
  r0_1.ExterminateInfo = r0_1:GetDataMgrInfo()
  if not r0_1.ExterminateInfo then
    GameState(r0_1):ShowDungeonError("ExterminateBaseComponent:当前副本ID没有填写在对应的副本表中, 读表失败! 读入Id：" .. r0_1.GameMode.DungeonId, Const.DungeonErrorType.DungeonGame, Const.DungeonErrorTitle.Config)
    return 
  end
  r0_1.TargetNum = r0_1.ExterminateInfo.TargetNum and 80
  r0_1.NormalRange = r0_1.ExterminateInfo.NormalRange
  r0_1.NormalSpawnRule = r0_1.ExterminateInfo.NormalSpawnRule
  r0_1.NormalSpawnOnlyRelation = r0_1.ExterminateInfo.NormalSpawnOnlyRelation
  r0_1.IsNormalNumActive = r0_1:ResetNormalNum()
  r0_1.EliteRange = r0_1.ExterminateInfo.EliteRange
  r0_1.EliteSpawnRule = r0_1.ExterminateInfo.EliteSpawnRule
  r0_1.EliteSpawnOnlyRelation = r0_1.ExterminateInfo.EliteSpawnOnlyRelation
  r0_1.IsEliteNumActive = r0_1:ResetEliteNum()
  r0_1.PetSpawnRange = r0_1.ExterminateInfo.PetSpawnRange
  if r0_1.PetSpawnRange then
    if #r0_1.PetSpawnRange == 1 then
      r0_1.PetSpawnNum = r0_1.PetSpawnRange[1]
    else
      r0_1.PetSpawnNum = math.random(r0_1.PetSpawnRange[1], r0_1.PetSpawnRange[2])
    end
  end
  r0_1.GameMode.EMGameState:SetExterminateTotalNum(r0_1.TargetNum)
end
function r0_0.GetDataMgrInfo(r0_2)
  -- line: [46, 48] id: 2
end
function r0_0.OnEliteNumClear(r0_3)
  -- line: [50, 52] id: 3
end
function r0_0.ResetNormalNum(r0_4)
  -- line: [58, 76] id: 4
  if r0_4.NormalRange == nil then
    return false
  end
  if r0_4.NormalSpawnRule == nil then
    return false
  end
  if r0_4.NormalSpawnOnlyRelation == nil then
    return false
  end
  if #r0_4.NormalRange == 1 then
    r0_4.NormalNum = r0_4.NormalRange[1]
  else
    r0_4.NormalNum = math.random(r0_4.NormalRange[1], r0_4.NormalRange[2])
  end
  DebugPrint("ExterminateBaseComponent: New NormalNum:", r0_4.NormalNum)
  return true
end
function r0_0.ResetEliteNum(r0_5)
  -- line: [78, 96] id: 5
  if r0_5.EliteRange == nil then
    return false
  end
  if r0_5.EliteSpawnRule == nil then
    return false
  end
  if r0_5.EliteSpawnOnlyRelation == nil then
    return false
  end
  if #r0_5.EliteRange == 1 then
    r0_5.EliteNum = r0_5.EliteRange[1]
  else
    r0_5.EliteNum = math.random(r0_5.EliteRange[1], r0_5.EliteRange[2])
  end
  DebugPrint("ExterminateBaseComponent: New EliteNum:", r0_5.EliteNum)
  return true
end
function r0_0.InitGuideUpdateTimerLogic(r0_6)
  -- line: [103, 119] id: 6
  r0_6.GuideTimerHandle_DetectFault = "Handle_DetectFault"
  r0_6.GuideTimerInterval_AutoUpdate = DataMgr.GlobalConstant.ExterminateGuideInterval.ConstantValue and 10
  r0_6:AddGuideTimer_DetectFault()
  for r4_6 = 0, r0_6.GameMode:GetPlayerNum() + -1, 1 do
    local r5_6 = UE4.UGameplayStatics.GetPlayerCharacter(r0_6, r4_6)
    if IsValid(r5_6) then
      r0_6.HasGuideUpdateRequest[r5_6.Eid] = false
      r0_6:AddGuideTimer_AutoUpdate(r5_6.Eid)
    end
  end
end
function r0_0.OnPlayerEnter(r0_7, r1_7)
  -- line: [121, 124] id: 7
  DebugPrint("zwk  中途有玩家加入 Eid： ", r1_7)
  r0_7:AddGuideTimer_AutoUpdate(r1_7)
end
function r0_0.AddGuideTimer_AutoUpdate(r0_8, r1_8)
  -- line: [126, 128] id: 8
  r0_8:AddTimer(r0_8.GuideTimerInterval_AutoUpdate, r0_8.OnTimerEnd_AutoUpdate, true, 0, "Handle_AutoUpdate_" .. r1_8, nil, r1_8)
end
function r0_0.OnTimerEnd_AutoUpdate(r0_9, r1_9)
  -- line: [130, 134] id: 9
  DebugPrint("ExterminateBaseComponent: 自动更新RemoveGuideEid 被Remove的指引点Eid: " .. tostring(r0_9.NowGuideEids[r1_9]) .. "  Player Eid: " .. tostring(r1_9))
  r0_9:TryUpdateGuidePoint(r1_9)
end
function r0_0.AddGuideTimer_LimitCalls(r0_10, r1_10)
  -- line: [136, 138] id: 10
  r0_10:AddTimer(1, r0_10.OnTimerEnd_LimitCalls, false, 0, "Handle_LimitCalls_" .. r1_10, nil, r1_10)
end
function r0_0.OnTimerEnd_LimitCalls(r0_11, r1_11)
  -- line: [140, 146] id: 11
  if r0_11.HasGuideUpdateRequest[r1_11] then
    DebugPrint("ExterminateBaseComponent: 补充调用更新指引 PlayerEid: " .. r1_11)
    r0_11:UpdateNearestMonsterGuide(r1_11)
    r0_11.HasGuideUpdateRequest[r1_11] = false
  end
end
function r0_0.AddGuideTimer_DetectFault(r0_12)
  -- line: [148, 150] id: 12
  r0_12:AddTimer(2, r0_12.OnTimerEnd_DetectFault, true, 0, r0_12.GuideTimerHandle_DetectFault)
end
function r0_0.OnTimerEnd_DetectFault(r0_13)
  -- line: [152, 163] id: 13
  for r4_13 = 0, r0_13.GameMode:GetPlayerNum() + -1, 1 do
    local r5_13 = UE4.UGameplayStatics.GetPlayerCharacter(r0_13, r4_13)
    if IsValid(r5_13) and r0_13:CheckGuideLogicHasFault(r5_13) then
      DebugPrint("ExterminateBaseComponent: 检测到玩家Eid: " .. r5_13.Eid .. " 不存在指引点，准备添加")
      r0_13:TryUpdateGuidePoint(r5_13.Eid)
    end
  end
end
function r0_0.CheckGuideLogicHasFault(r0_14, r1_14)
  -- line: [165, 176] id: 14
  if not IsValid(r1_14) then
    return true
  end
  if r0_14.NowGuideEids[r1_14.Eid] == nil then
    return true
  end
  if not r0_14.GameMode.EMGameState:ContainsGuideEid(r0_14.NowGuideEids[r1_14.Eid], r1_14.Eid) then
    return true
  end
  return false
end
function r0_0.TryUpdateGuidePoint(r0_15, r1_15)
  -- line: [178, 186] id: 15
  if r0_15:IsExistTimer("Handle_LimitCalls_" .. r1_15) then
    DebugPrint("ExterminateBaseComponent: 此次调用更新指引频率过高，已暂缓调用 PlayerEid: " .. r1_15)
    r0_15.HasGuideUpdateRequest[r1_15] = true
  else
    r0_15:UpdateNearestMonsterGuide(r1_15)
    r0_15:AddGuideTimer_LimitCalls(r1_15)
  end
end
function r0_0.OnUnitDeadEvent(r0_16, r1_16)
  -- line: [188, 212] id: 16
  if r0_16.Success then
    return 
  end
  if not IsValid(r1_16) then
    return 
  end
  if not r1_16:IsRealMonster() then
    return 
  end
  r0_16:AddExterminateKilledNum(1)
  r0_16:CheckTargetNum()
  if r1_16:IsEliteMonster() then
    return 
  end
  for r6_16, r7_16 in pairs(r0_16.NowGuideEids) do
    if r1_16.Eid == r7_16 then
      DebugPrint("ExterminateBaseComponent: 怪物死亡RemoveGuideEid 被Remove的指引点Eid: " .. r7_16 .. "  Player Eid: " .. r6_16)
      r0_16:TryUpdateGuidePoint(r6_16)
      r0_16:AddGuideTimer_AutoUpdate(r6_16)
      DebugPrint("ExterminateBaseComponent: OnUnitDeadEvent", r1_16:GetName(), r1_16.Eid, r6_16)
    end
  end
  -- close: r2_16
end
function r0_0.AddExterminateKilledNum(r0_17, r1_17)
  -- line: [214, 219] id: 17
  r0_17.GameMode.EMGameState:SetExterminateKilledNum(r0_17.GameMode.EMGameState.ExterminateKilledNum + r1_17)
  if IsStandAlone(r0_17) then
    r0_17.GameMode.EMGameState:OnRep_ExterminateKilledNum()
  end
end
function r0_0.UpdateNearestMonsterGuide(r0_18, r1_18)
  -- line: [245, 276] id: 18
  local r2_18 = Battle(r0_18):GetEntity(r1_18)
  if not IsValid(r2_18) then
    return 
  end
  local r3_18 = r0_18.NowGuideEids[r1_18]
  local r4_18 = r0_18.GameMode:GetNearestMonsterEid(r2_18)
  if r3_18 == r4_18 then
    DebugPrint("ExterminateBaseComponent: 指引点未发生变化，无需更新 指引点Eid: " .. r4_18 .. "  Player Eid: " .. r1_18)
    return 
  end
  if r3_18 ~= nil and r3_18 > 0 then
    DebugPrint("ExterminateBaseComponent: 更新指引点，移除旧指引 RemoveGuideEid 被Remove的指引点Eid: " .. r3_18 .. "  Player Eid: " .. r1_18)
    r0_18.GameMode.EMGameState:RemoveGuideEid(r3_18, r1_18)
  end
  if r4_18 ~= nil and r4_18 > 0 then
    r0_18.NowGuideEids[r1_18] = r4_18
    r0_18:AddDelayFrameFunc(function()
      -- line: [265, 272] id: 19
      if r0_18.NowGuideEids[r1_18] == r4_18 then
        r0_18.GameMode.EMGameState:AddGuideEid(r4_18, r1_18)
        DebugPrint("ExterminateBaseComponent: 已成功添加指引点 指引点Eid: " .. r4_18 .. "  Player Eid: " .. r1_18)
      else
        DebugPrint("ExterminateBaseComponent: 延迟添加指引点时, self.NowGuideEids已发生变化. 原本准备添加的指引点Eid: " .. r4_18 .. "  Player Eid: " .. r1_18)
      end
    end, 2)
  else
    DebugPrint("ExterminateBaseComponent: Error  歼灭玩法当前场上找不到怪物!")
  end
end
function r0_0.ClearGuideUpdateTimerLogic(r0_20)
  -- line: [278, 293] id: 20
  for r5_20, r6_20 in ipairs(r0_20.NowGuideEids) do
    DebugPrint("ExterminateBaseComponent: 结束清理RemoveGuideEid 被Remove的指引点Eid: " .. r6_20 .. "  Player Eid: " .. r5_20)
    r0_20.GameMode.EMGameState:RemoveGuideEid(r6_20, r5_20)
  end
  -- close: r1_20
  r0_20.NowGuideEids = {}
  r0_20:RemoveTimer(r0_20.GuideTimerHandle_DetectFault)
  for r4_20 = 0, r0_20.GameMode:GetPlayerNum() + -1, 1 do
    local r5_20 = UE4.UGameplayStatics.GetPlayerCharacter(r0_20, r4_20)
    if IsValid(r5_20) then
      r0_20.GameMode.EMGameState:ClearGuideEid(r5_20.Eid)
      r0_20:RemoveTimer("Handle_AutoUpdate_" .. r5_20.Eid)
      r0_20:RemoveTimer("Handle_LimitCalls_" .. r5_20.Eid)
    end
  end
end
function r0_0.CheckTargetNum(r0_21)
  -- line: [295, 331] id: 21
  r0_21.TargetNum = r0_21.TargetNum + -1
  if r0_21.TargetNum <= 0 then
    r0_21.Success = true
    r0_21.GameMode:TriggerGameModeEvent("OnAchieveTarget")
    if r0_21.GameMode:GetNeedCreateEmergencyMonster("Pet") then
      r0_21.GameMode:TriggerSpawnPet()
    end
  end
  if r0_21.IsNormalNumActive then
    r0_21.NormalNum = r0_21.NormalNum + -1
    if r0_21.NormalNum == 0 then
      r0_21.GameMode:TriggerCreateMonsterSpawn(r0_21:RuleToTArray(r0_21.NormalSpawnRule), r0_21.NormalSpawnOnlyRelation)
      r0_21:ResetNormalNum()
    end
  end
  if r0_21.IsEliteNumActive then
    r0_21.EliteNum = r0_21.EliteNum + -1
    if r0_21.EliteNum == 0 then
      r0_21:OnEliteNumClear()
      r0_21.GameMode:TriggerCreateMonsterSpawn(r0_21:RuleToTArray(r0_21.EliteSpawnRule), r0_21.EliteSpawnOnlyRelation)
      r0_21:ResetEliteNum()
    end
  end
  if r0_21.PetSpawnNum then
    r0_21.PetSpawnNum = r0_21.PetSpawnNum + -1
    if r0_21.PetSpawnNum == 0 then
      r0_21.PetSpawnNum = nil
      if r0_21.GameMode:GetNeedCreateEmergencyMonster("Pet") then
        r0_21.GameMode:TriggerSpawnPet()
      end
    end
  end
end
function r0_0.RuleToTArray(r0_22, r1_22)
  -- line: [333, 339] id: 22
  local r2_22 = TArray(0)
  if r1_22 then
    r2_22:Add(r1_22)
  end
  return r2_22
end
return r0_0
