-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Story\Interactive\InteractiveComponent\BP_HookInteractiveComponent_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.Story.Interactive.InteractiveComponent.BP_InteractiveBaseComponent_C",
  "BluePrints.Common.TimerMgr"
})
function r0_0.StartInteractive(r0_1, r1_1)
  -- line: [19, 38] id: 1
  if not r1_1 then
    return 
  end
  if UGameplayStatics.GetGameState(r0_1).ShouldStopHookInDungeonDelivery then
    DebugPrint("ayff test DungeonDelivery中禁止钩锁交互")
    return 
  end
  local r3_1 = GWorld:GetAvatar()
  local r5_1 = UE4.UGameplayStatics.GetPlayerCharacter(r0_1, 0).Eid == r1_1.Eid
  local r6_1 = r0_1:GetOwner()
  r1_1.RPCComponent:InteractiveHook(r1_1.Eid, r6_1.Eid)
  if r5_1 and r3_1 and r3_1.IsInRegionOnline then
    r1_1:ForceReSyncLocation()
    r3_1:UseGouSuoMessage(r3_1.CurrentOnlineType, r6_1.CreatorId)
  end
end
function r0_0.EndInteractive(r0_2, r1_2)
  -- line: [40, 53] id: 2
  local r2_2 = r0_2:GetOwner()
  if r2_2.PlayerEids:Length() == 0 then
    return 
  end
  if not r1_2 then
    UGameplayStatics.GetPlayerCharacter(r0_2, 0).RPCComponent:DeInteractiveHook(r0_2.PlayerEid, r2_2.Eid)
  else
    r1_2.RPCComponent:DeInteractiveHook(r1_2.Eid, r2_2.Eid)
    r1_2:ForceReSyncLocation()
  end
end
function r0_0.ForceEndInteractive(r0_3, r1_3)
  -- line: [55, 64] id: 3
  local r2_3 = r0_3:GetOwner()
  if not r1_3 then
    local r3_3 = UGameplayStatics.GetPlayerCharacter(r0_3, 0)
    r3_3.RPCComponent:DeInteractiveHook(r3_3.Eid, r2_3.Eid)
  else
    r1_3.RPCComponent:DeInteractiveHookForce(r1_3.Eid, r2_3.Eid)
  end
end
function r0_0.IsCanInteractive(r0_4, r1_4)
  -- line: [68, 80] id: 4
  return false
end
function r0_0.ReceiveBeginPlay(r0_5)
  -- line: [82, 84] id: 5
  r0_5.MontageName = "Interactive_02_Montage"
end
return r0_0
