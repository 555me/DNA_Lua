-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\AnimNotifiers\BP_AnimNotifyState_GlobalTimeDilation.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = Class({
  "BluePrints.Common.TimerMgr"
})
function r0_0.Begin(r0_1, r1_1)
  -- line: [21, 32] id: 1
  if r0_1.TimerHandle then
    GWorld.GameInstance:RemoveTimer(r0_1.TimerHandle)
    r0_1.TimerHandle = nil
  end
  r0_1.TimerHandle = GWorld.GameInstance:AddTimer(0.0001, function()
    -- line: [26, 30] id: 2
    r0_1.TimerHandle = nil
    r0_1.Overridden.Begin(r0_1, r1_1)
    r0_1.HasStarted = true
  end, false, 0, nil, true)
end
function r0_0.End(r0_3, r1_3)
  -- line: [34, 43] id: 3
  if r0_3.TimerHandle then
    GWorld.GameInstance:RemoveTimer(r0_3.TimerHandle)
    r0_3.TimerHandle = nil
  end
  if r0_3.HasStarted then
    r0_3.Overridden.End(r0_3, r1_3)
    r0_3.HasStarted = false
  end
end
return r0_0
