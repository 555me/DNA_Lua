-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Item\ExploreGroup\BP_AOITriggerBox_DongguoLand_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class("BluePrints.Common.Triggers.BP_AOITriggerBox_C")
function r0_0.CollisionBeginOverlap(r0_1, r1_1, r2_1)
  -- line: [13, 29] id: 1
  if not r2_1.IsPlayer or not r2_1:IsPlayer() then
    return 
  end
  local r3_1 = r2_1.CapsuleComponent:GetOverlappingActors()
  for r7_1 = 1, r3_1:Length(), 1 do
    if r3_1[r7_1].IsFushuItem and r3_1[r7_1]:IsFushuItem() and r3_1[r7_1].IsActive then
      return 
    end
  end
  if r2_1.DongguoLandNum == nil then
    r2_1.DongguoLandNum = 0
  end
  r2_1.DongguoLandNum = r2_1.DongguoLandNum + 1
  r2_1:SetBool("Baiheng_Mijing_Dot", true)
  r0_0.Super.CollisionBeginOverlap(r0_1, r1_1, r2_1)
end
function r0_0.CollisionEndOverlap(r0_2, r1_2, r2_2)
  -- line: [31, 49] id: 2
  if not r2_2.IsPlayer or not r2_2:IsPlayer() then
    return 
  end
  local r3_2 = r2_2.CapsuleComponent:GetOverlappingActors()
  for r7_2 = 1, r3_2:Length(), 1 do
    if r3_2[r7_2].IsFushuItem and r3_2[r7_2]:IsFushuItem() and r3_2[r7_2].IsActive then
      return 
    end
  end
  if r2_2.DongguoLandNum and r2_2.DongguoLandNum > 0 then
    r2_2.DongguoLandNum = r2_2.DongguoLandNum + -1
  end
  if not r2_2.DongguoLandNum or r2_2.DongguoLandNum > 0 then
    return 
  end
  r2_2:SetBool("Baiheng_Mijing_Dot", false)
  r0_0.Super.CollisionEndOverlap(r0_2, r1_2, r2_2)
end
return r0_0
