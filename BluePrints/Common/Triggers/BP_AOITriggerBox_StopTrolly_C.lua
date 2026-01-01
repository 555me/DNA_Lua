-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Common\Triggers\BP_AOITriggerBox_StopTrolly_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class("BluePrints.Common.Triggers.BP_AOITriggerBox_C")
function r0_0.AuthorityInitInfo(r0_1, r1_1)
  -- line: [13, 30] id: 1
  print(_G.LogTag, "LXZ SpawnTriggerBox AuthorityInitInfo", r0_1:GetName())
  r0_0.Super.AuthorityInitInfo(r0_1, r1_1)
  r0_1.PathPoint = r1_1:FindObjectParams("TriggerCreator")
  local r2_1 = UGameplayStatics.GetGameState(r0_1)
  if r2_1 then
    local r3_1 = r0_1:K2_GetActorLocation()
    local r4_1 = r2_1.StopTrollyBoxLocation:Num()
    r2_1.StopTrollyBoxLocation:AddUnique(r3_1)
    local r5_1 = r2_1.StopTrollyBoxLocation:Num()
    DebugPrint("StopTrollyBoxLocation add location:", r3_1.X, " ", r3_1.Y, " ", r3_1.Z)
    DebugPrint("StopTrollyBoxLocation LastNum:", r4_1, " NewNum:", r5_1)
    if r4_1 < r5_1 then
      EventManager:FireEvent(EventID.OnDungeonUIStateUpdated)
    end
  end
end
function r0_0.GetUnitRealType(r0_2)
  -- line: [32, 34] id: 2
  return "AOITriggerBox"
end
function r0_0.CollisionBeginOverlap(r0_3, r1_3, r2_3)
  -- line: [54, 78] id: 3
  if not r2_3.IsCombatItemBase or not r2_3:IsCombatItemBase("Trolly") then
    if r2_3.IsCombatItemBase then
      print(_G.LogTag, "LXZ CollisionBeginOverlap", r2_3:IsCombatItemBase("Trolly"))
    end
    return 
  end
  r2_3:TriggerBoxStop()
  local r3_3 = nil
  for r8_3, r9_3 in pairs(r2_3.Spline.PointMap) do
    if r9_3 == r0_3.PathPoint then
      r3_3 = r8_3
      break
    end
  end
  -- close: r4_3
  if r3_3 ~= nil then
    r2_3.CurrentAccelerationValue = r2_3.Speed * -1 * r2_3.Speed / 2 / (r2_3.Spline.Spline:GetDistanceAlongSplineAtSplinePoint(r3_3 + -1) - r2_3.Distance)
  end
  r0_0.Super.CollisionBeginOverlap(r0_3, r1_3, r2_3)
end
function r0_0.OnEMActorDestroy(r0_4, r1_4)
  -- line: [80, 83] id: 4
  r0_4.Overridden.OnEMActorDestroy(r0_4, r1_4)
  print(_G.LogTag, "LXZ OnEMActorDestroy", r1_4)
end
return r0_0
