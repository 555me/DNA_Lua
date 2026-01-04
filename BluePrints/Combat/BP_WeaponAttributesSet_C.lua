-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Combat\BP_WeaponAttributesSet_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class("BluePrints.Combat.BaseAttributesSet")
r0_0.CppAttrs = {}
function r0_0.LevelUp(r0_1, r1_1, r2_1)
  -- line: [52, 62] id: 1
  local r3_1 = r0_1.OwnerActor.Owner
  if r3_1:IsMainPlayer() then
    local r4_1 = GWorld.GameInstance:GetGameUIManager()
    if r0_1.OwnerActor == r3_1.MeleeWeapon then
      r4_1:ShowLevelUpToast(r1_1, "MeleeWeapon", r2_1)
    elseif r0_1.OwnerActor == r3_1.RangedWeapon then
      r4_1:ShowLevelUpToast(r1_1, "RangedWeapon", r2_1)
    end
  end
end
return r0_0
