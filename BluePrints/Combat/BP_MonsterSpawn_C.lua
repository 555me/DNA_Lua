-- filename: @E:/Pack/Branch/OBT10_Geili\Content/Script/BluePrints\Combat\BP_MonsterSpawn_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.Combat.Components.MonsterSpawnComponent",
  "BluePrints.Common.DelayFrameComponent"
})
function r0_0.RealCreateUnits(r0_1, r1_1, r2_1, r3_1, r4_1, r5_1)
  -- line: [148, 203] id: 1
  if r0_1.GameMode.EMGameState.GameModeType == "Abyss" then
    r5_1 = math.min(r5_1, DataMgr.GlobalConstant.MonsterLevelUpperLimit.ConstantValue)
  end
  DebugPrint("RealCreateUnits CreateUnitNew UnitId:", r1_1, "UnitNum:", r2_1)
  local r6_1 = UE4.UKismetSystemLibrary.GetFrameCount()
  if r0_1.PreFreameCount ~= r6_1 then
    if r0_1.RemainUnitNum ~= nil and r0_1.RemainUnitNum > 0 then
      return 
    end
    r0_1.RemainUnitNum = 0
    r0_1.TempLocations = r0_1.Locations
    r0_1.TempLocationIndex = 0
    r0_1.DelayFrameStartCount = 1
    r0_1.PreFreameCount = r6_1
  end
  r0_1.RemainUnitNum = r0_1.RemainUnitNum + r2_1
  for r10_1 = 1, r2_1, 1 do
    r0_1:AddDelayFrameFunc(function()
      -- line: [171, 200] id: 2
      r0_1.RemainUnitNum = r0_1.RemainUnitNum + -1
      if r4_1 == "Main" and not r0_1:DetectMonsterSpawnTotalNum() then
        DebugPrint("BP_MonsterSpawn_C 刷怪过程中数量已达上限, 直接返回  MonsterSpawnId:", r0_1.UnitSpawnId)
        return 
      end
      if r0_1.TempLocations:Num() == 0 then
        DebugPrint("Error: BP_MonsterSpawn_C No Locations MonsterSpawnId:", r0_1.UnitSpawnId)
        return 
      end
      r0_1.TempLocationIndex = r0_1.TempLocationIndex + 1
      local r1_2 = AEventMgr.CreateUnitContext()
      r1_2.UnitType = "Monster"
      r1_2.UnitId = r1_1
      r1_2.Loc = r0_1.TempLocations[r0_1.TempLocationIndex % r0_1.TempLocations:Num() + 1]
      r1_2.MonsterSpawn = r0_1
      r1_2.BoolParams:Add("RelationSpawn", r4_1 == "Relation")
      r1_2.IntParams:Add("Level", r5_1)
      r1_2:AddObjectParams("PresetTarget", r3_1)
      r0_1:DebugPrintMonsterSpawn("RealCreateUnits CreateUnitNew UnitId: " .. r1_1 .. " Level: " .. r5_1)
      r0_1.GameState.EventMgr:CreateUnitNew(r1_2, false)
      if r4_1 == "Main" then
        r0_1:UpdateMonsterSpawnTotalNum(-1)
        r0_1.UnitSpawningNum = r0_1.UnitSpawningNum + 1
      else
        r0_1.RelationSpawningNum = r0_1.RelationSpawningNum + 1
      end
    end, r0_1.DelayFrameStartCount)
    r0_1.DelayFrameStartCount = r0_1.DelayFrameStartCount + 1
  end
end
function r0_0.DetectMonsterSpawnInfo(r0_3)
  -- line: [205, 237] id: 3
  if not r0_3.TempData then
    local r1_3 = UGameplayStatics.GetPlatformName()
    local r2_3 = nil	-- notice: implicit variable refs by block#[6]
    if r1_3 ~= "IOS" then
      r2_3 = r1_3 == "Android"
    else
      goto label_11	-- block#4 is visited secondly
    end
    r0_3.TempData = DataMgr.MonsterSpawn[r0_3.UnitSpawnId]
    if r0_3.TempData then
      if r2_3 then
        r0_3.UnitSpawnRadiusMin = r0_3.TempData.PhoneUnitSpawnRadiusMin
        r0_3.UnitSpawnRadiusMax = r0_3.TempData.PhoneUnitSpawnRadiusMax
      else
        r0_3.UnitSpawnRadiusMin = r0_3.TempData.UnitSpawnRadiusMin
        r0_3.UnitSpawnRadiusMax = r0_3.TempData.UnitSpawnRadiusMax
      end
      DebugPrint("self.UnitSpawnRadiusMin", r0_3.UnitSpawnRadiusMin, "self.UnitSpawnRadiusMax", r0_3.UnitSpawnRadiusMax)
    end
  end
  if r0_3.bIsPaused or r0_3.bDestroyAll then
    return 
  end
  if not r0_3.bRelationDestory then
    r0_3:DetectRelationSpawn()
  end
  if r0_3.bMainDestory then
    return 
  end
  if r0_3.UnitSpawningNum > 0 then
    DebugPrint("AMonsterSpawn::DetectMonsterSpawnInfo UnitSpawningNum > 0 MonsterSpawnId：", r0_3.UnitSpawnId)
    return 
  end
  r0_3:UpdateDetectFix(r0_3:DetectMonsterThreshold())
end
function r0_0.CheckDungeonReachable(r0_4, r1_4, r2_4, r3_4)
  -- line: [269, 280] id: 4
  local r4_4 = r1_4:GetLevelIdByLocation(r2_4:K2_GetActorLocation())
  local r5_4 = false
  for r10_4, r11_4 in pairs(r1_4.LevelId2Doors[r4_4]) do
    if UE4.UNavigationFunctionLibrary.CheckTwoPosHasPath(r3_4.Loc, r11_4:K2_GetActorLocation(), r0_4.GameMode) == UE4.EPathConnectType.HasPath then
      r5_4 = true
      break
    end
  end
  -- close: r6_4
  return r5_4
end
function r0_0.GetAroundDivisionInfos(r0_5, r1_5)
  -- line: [282, 284] id: 5
  return r0_5.GameMode:GetAroundDivisionInfos(r1_5)
end
function r0_0.AddHostageInfo(r0_6, r1_6)
  -- line: [287, 302] id: 6
  local r2_6 = r0_6.GameMode:TriggerDungeonComponentFun("GetHostageEid")
  if r2_6 == nil then
    DebugPrint("BP_MonsterSpawn_C  当前预设目标为人质，但不应该在非捕获玩法使用  MonsterSpawnId:", r0_6.UnitSpawnId)
    r0_6:AddPlayerInfo(r1_6)
    return 
  end
  local r3_6 = Battle(r0_6):Getentity(r2_6)
  if not IsValid(r3_6) then
    DebugPrint("BP_MonsterSpawn_C  当前预设目标为人质，人质不存在  MonsterSpawnId:", r0_6.UnitSpawnId)
    r0_6:AddPlayerInfo(r1_6)
    return 
  end
  DebugPrint("BP_MonsterSpawn_C  当前预设目标为人质  MonsterSpawnId:", r0_6.UnitSpawnId, "人质Eid:", r2_6)
  r1_6:Add(r3_6)
end
function r0_0.DebugPrintMonsterSpawn(r0_7, r1_7)
  -- line: [305, 309] id: 7
  if r0_7.GameMode.DebugPrintMonsterSpawn then
    DebugPrint("WARNING:  " .. r1_7)
  end
end
return r0_0
