-- filename: @E:/Pack/Branch/OBT10_Geili\Content/Script/BluePrints\Combat\Buff\BP_Buff1315_C.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = Class()
function r0_0.RefreshBloodBossUI(r0_1)
  -- line: [12, 17] id: 1
  local r1_1 = r0_1.Owner.BossBloodUI
  if r1_1 and r1_1.UpdateTakeDownTipText then
    r1_1:UpdateTakeDownTipText()
  end
end
return r0_0
