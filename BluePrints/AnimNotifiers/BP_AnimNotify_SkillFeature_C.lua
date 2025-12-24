-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\AnimNotifiers\BP_AnimNotify_SkillFeature_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class()
function r0_0.Received_Notify(r0_1, r1_1, r2_1)
  -- line: [16, 27] id: 1
  if IsStandAlone(r0_1) and r0_1:NotifyServer(r1_1, r2_1) then
    return r0_1:NotifyClient(r1_1, r2_1)
  elseif IsClient(r0_1) then
    return r0_1:NotifyClient(r1_1, r2_1)
  elseif IsDedicatedServer(r0_1) then
    return r0_1:NotifyServer(r1_1, r2_1)
  end
  return false
end
function r0_0.NotifyServer(r0_2, r1_2, r2_2)
  -- line: [32, 45] id: 2
  local r3_2 = r1_2:GetOwner()
  if not r3_2 then
    return false
  end
  r3_2.SkillFeature = true
  if r3_2.AddTimer then
    r3_2:AddTimer(r0_2:GetSequenceDuration(), function(r0_3)
      -- line: [40, 42] id: 3
      r0_3.SkillFeature = false
    end, false, 0, "SkillFeature")
  end
  return true
end
function r0_0.NotifyClient(r0_4, r1_4, r2_4)
  -- line: [49, 67] id: 4
  local r3_4 = r1_4:GetOwner()
  if not r3_4 then
    return false
  end
  if not r3_4.IsMainPlayer or not r3_4:IsMainPlayer() then
    return false
  end
  r3_4.SkillFeature = true
  if r3_4.AddTimer then
    r3_4:AddTimer(r0_4:GetSequenceDuration(), function(r0_5)
      -- line: [61, 63] id: 5
      r0_5.SkillFeature = false
    end, false, 0, "SkillFeature")
  end
  return r0_4.Overridden.NotifyClient(r0_4, r1_4, r2_4)
end
return r0_0
