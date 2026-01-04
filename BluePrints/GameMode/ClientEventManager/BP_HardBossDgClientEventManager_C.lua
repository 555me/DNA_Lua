-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\GameMode\ClientEventManager\BP_HardBossDgClientEventManager_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.GameMode.ClientEventManager.BP_BaseClientEventManager_C"
})
function r0_0.OnClientInit(r0_1)
  -- line: [17, 26] id: 1
  local r1_1 = DataMgr.HardBossDg[GameState(r0_1).DungeonId]
  if r1_1 then
    r0_1.HardBossId = r1_1.HardBossId and 0
  end
  r0_1.Overridden.OnClientInit(r0_1)
  r0_1:CheckReconnect()
end
function r0_0.CheckReconnect(r0_2)
  -- line: [30, 40] id: 2
  if not GameState(r0_2).IsPlayingSkillFeature then
    return 
  end
  r0_2:AddTimer(3, function()
    -- line: [35, 39] id: 3
    local r0_3 = UE4.UGameplayStatics.GetPlayerCharacter(r0_2, 0)
    r0_3.RPCComponent:NotifyServerBossSkillFeatureSequenceFinish(r0_3.Eid)
    DebugPrint("HardBossDgComponent: CheckReconnect in skillfeature, notify DS to continue.")
  end)
end
return r0_0
