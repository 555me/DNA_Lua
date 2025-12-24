-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\AnimNotifiers\BP_AnimNotify_SkillFeatureVoid_C.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = Class()
function r0_0.Received_Notify(r0_1, r1_1, r2_1)
  -- line: [15, 31] id: 1
  local r3_1 = r1_1:GetOwner()
  if not r3_1 then
    return false
  end
  r3_1.SkillFeature = true
  if r3_1.AddTimer then
    r3_1:AddTimer(r0_1:GetSequenceDuration(), function(r0_2)
      -- line: [23, 25] id: 2
      r0_2.SkillFeature = false
    end, false, 0, "SkillFeature")
  end
  if IsStandAlone(r0_1) or IsClient(r0_1) then
    r0_1:DoFeature(r1_1)
  end
  return true
end
return r0_0
