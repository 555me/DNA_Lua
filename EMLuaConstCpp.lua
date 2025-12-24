-- filename: @C:/Pack/Branch/geili11\Content/Script/EMLuaConstCpp.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("EMLuaConst")
local r1_0 = Class()
function r1_0.FillVars(r0_1)
  -- line: [6, 11] id: 1
  for r5_1, r6_1 in pairs(r0_0) do
    r0_1.TempVars[r5_1] = r6_1
  end
  -- close: r1_1
  rawset(r0_0, "EMLuaConstCpp", r0_1)
end
return r1_0
