-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\AnimNotifiers\AnimNotifyState_HitCapsuleFollow.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class()
function r0_0.Received_NotifyBegin(r0_1, r1_1, r2_1, r3_1)
  -- line: [13, 22] id: 1
  DebugPrint("@gulinan UAnimNotifyState_HitCapsuleFollow Received_NotifyBegin")
  if r1_1 then
    local r4_1 = r1_1:GetOwner()
    if r4_1 then
      r4_1:SetHitCapsuleBeginplayState(true)
    end
  end
  return false
end
function r0_0.Received_NotifyEnd(r0_2, r1_2, r2_2)
  -- line: [24, 34] id: 2
  DebugPrint("@gulinan UAnimNotifyState_HitCapsuleFollow Received_NotifyEnd")
  if r1_2 then
    local r3_2 = r1_2:GetOwner()
    if r3_2 then
      DebugPrint("@gulinan UAnimNotifyState_HitCapsuleFollow Owner.bHitCapsuleBeginplay ~= true: " .. tostring((r3_2.bHitCapsuleBeginplay ~= true)))
      return r3_2.bHitCapsuleBeginplay ~= true
    end
  end
  return true
end
return r0_0
