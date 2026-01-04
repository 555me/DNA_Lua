-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Common\AnimOptGameInstanceSubsystem_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("Unlua")
require("Const")
local r0_0 = Class()
function r0_0.Initialize_Lua(r0_1)
  -- line: [6, 20] id: 1
  r0_1.SystemEnableState = 1
  r0_1.CacheFrameDeltaSeconds = 0.033333
  r0_1.bDebugBonesTrans = false
  r0_1.bDebugCachedTrans = false
  r0_1.DebugCacheTransType = 4
  r0_1.BodyFilterBoneName = "Spine_02"
  r0_1.InitialMeshTickInterval = 0.05
end
return r0_0
