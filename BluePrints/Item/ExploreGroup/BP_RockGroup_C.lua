-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Item\ExploreGroup\BP_RockGroup_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.Item.BP_CombatItemBase_C",
  "BluePrints.Common.TimerMgr"
})
function r0_0.ReceiveBeginPlay(r0_1)
  -- line: [16, 35] id: 1
  r0_1.Super.ReceiveBeginPlay(r0_1)
  r0_1.FinishNum = 0
  r0_1.CurRotate = 0
  r0_1.HasWrongOne = false
  r0_1.RotateHalf = false
end
function r0_0.OnActorReady(r0_2, r1_2)
  -- line: [37, 41] id: 2
  r0_0.Super.OnActorReady(r0_2, r1_2)
  EventManager:AddEvent(EventID.OnRingRockFinish, r0_2, r0_2.OnRingRockFinish)
  r0_2:GetAllRocks()
end
function r0_0.ReceiveTick(r0_3, r1_3)
  -- line: [43, 62] id: 3
  r0_3.Overridden.ReceiveTick(r0_3, r1_3)
  if r0_3.IsActive then
    local r2_3 = r0_3.RotateSpeed * r1_3 * r0_3.RotateDir
    r0_3.CurRotate = r0_3.CurRotate + r2_3
    for r7_3, r8_3 in pairs(r0_3.Rocks) do
      r8_3:K2_AddActorWorldRotation(FRotator(0, r2_3, 0), false, nil, false)
    end
    -- close: r3_3
    if r0_3.RotateNum * 360 <= r0_3.CurRotate then
      r0_3:RotateEnd()
      return 
    end
  end
end
function r0_0.OnRingRockFinish(r0_4, r1_4, r2_4)
  -- line: [64, 92] id: 4
  if not r0_4:CheckIsSelfRock(r2_4) then
    return 
  end
  if not r1_4 then
    r0_4.HasWrongOne = true
  end
  r0_4.FinishNum = r0_4.FinishNum + 1
  if r0_4.FinishNum ~= r0_4.RightNums then
    return 
  end
  if not r0_4.HasWrongOne then
    r0_4:ChangeState("Manual", 0, r0_4.FinishStateId)
  else
    if r0_4.Rocks:Num() <= 0 then
      r0_4:GetAllRocks()
    end
    for r7_4, r8_4 in pairs(r0_4.Rocks) do
      r8_4.Finish = false
      r8_4.Energy = 0
      if r8_4.AlreadyPull then
        r8_4.IsInReset = true
        r8_4:StartReset()
        r8_4.AlreadyPull = false
      end
    end
    -- close: r3_4
    r0_4.FinishNum = 0
    r0_4.HasWrongOne = false
    r0_4:OnWrong()
  end
end
function r0_0.ActiveCombat(r0_5)
  -- line: [94, 110] id: 5
  r0_0.Super.ActiveCombat(r0_5)
  for r5_5, r6_5 in pairs(r0_5.Rocks) do
    r6_5.CanPull = false
    r6_5.Finish = false
    r6_5.Energy = 0
    if r6_5.AlreadyPull then
      r6_5.IsInReset = true
      r6_5:StartReset()
      r6_5.AlreadyPull = false
    end
  end
  -- close: r1_5
  r0_5.FinishNum = 0
  r0_5.HasWrongOne = false
  r0_5:AddTimer(r0_5.ResetRockTime, r0_5.OnActive, false, 0)
end
function r0_0.DeActiveCombat(r0_6)
  -- line: [112, 114] id: 6
  r0_0.Super.DeActiveCombat(r0_6)
end
function r0_0.OnActive(r0_7)
  -- line: [116, 127] id: 7
  r0_7.RotateHalf = not r0_7.RotateHalf
  r0_7.CurRotate = 0
  if r0_7.Rocks:Num() <= 0 or not r0_7.Rocks[1] then
    r0_7:GetAllRocks()
  end
  local r1_7 = r0_7.Rocks[1]:K2_GetActorRotation()
  r0_7.TargetRotation = FRotator(r1_7.Pitch, r1_7.Yaw + tonumber(string.format("%.1f", r0_7.RotateNum)) % 1 * 360, r1_7.Roll)
  r0_7:SetActorTickEnabled(true)
end
function r0_0.RotateEnd(r0_8)
  -- line: [129, 138] id: 8
  r0_8:SetActorTickEnabled(false)
  for r5_8, r6_8 in pairs(r0_8.Rocks) do
    r6_8:K2_SetActorRotation(r0_8.TargetRotation, false, nil, false)
  end
  -- close: r1_8
  r0_8:OnDeActive()
end
function r0_0.OnDeActive(r0_9)
  -- line: [140, 152] id: 9
  if r0_9.RotateHalf then
    r0_9:AddTimer(r0_9.WaitTime, r0_9.OnActive, false, 0)
    r0_9:OnRotateEnd()
  else
    r0_9:ChangeState("Manual", 0, r0_9.InitStateId)
    for r5_9, r6_9 in pairs(r0_9.Rocks) do
      r6_9.CanPull = true
    end
    -- close: r1_9
  end
end
function r0_0.OnEnterState(r0_10, r1_10)
  -- line: [154, 170] id: 10
  r0_10.Overridden.OnEnterState(r0_10, r1_10)
  if r1_10 == r0_10.FinishStateId then
    for r6_10, r7_10 in pairs(r0_10.Rocks) do
      r7_10.CanPull = false
      r7_10.Finish = false
      r7_10.Energy = 0
      if r7_10.AlreadyPull then
        r7_10.IsInReset = true
        r7_10:StartReset()
        r7_10.AlreadyPull = false
      end
    end
    -- close: r2_10
  end
end
function r0_0.CheckIsSelfRock(r0_11, r1_11)
  -- line: [172, 179] id: 11
  for r6_11, r7_11 in pairs(r0_11.Rocks) do
    if r7_11.Eid == r1_11 then
      return true
    end
  end
  -- close: r2_11
  return false
end
return r0_0
