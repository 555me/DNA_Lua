-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Item\MiniGame\BP_MiniGame_Training_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class("BluePrints/Item/MiniGame/BP_OpenUIMechanism_C")
function r0_0.OpenMechanism(r0_1, r1_1)
  -- line: [5, 9] id: 1
  UE4.UGameplayStatics.GetGameInstance(r0_1):GetGameUIManager():LoadUINew("TrainingGroundSetup")
end
function r0_0.CloseMechanism(r0_2, r1_2)
  -- line: [11, 23] id: 2
end
return r0_0
