-- filename: @E:/Pack/Branch/OBT10_Geili\Content/Script/BluePrints\UI\BP_EMGameViewportClient_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class()
function r0_0.OnInputKey_Lua(r0_1, r1_1, r2_1, r3_1)
  -- line: [10, 27] id: 1
  DebugPrint(LXYTag, "BP_EMGameViewportClient_C:: OnInputKey_Lua", r2_1.KeyName, r3_1)
  if r3_1 == EInputEvent.IE_Pressed then
    EventManager:FireEvent(EventID.GameViewportInputKeyPressed, r2_1, r3_1)
  elseif r3_1 == EInputEvent.IE_Released then
    EventManager:FireEvent(EventID.GameViewportInputKeyReleased, r2_1, r3_1)
  elseif r3_1 == EInputEvent.IE_Repeat then
    EventManager:FireEvent(EventID.GameViewportInputKeyLongPressed, r2_1, r3_1)
  end
  local r4_1 = UE4.UGameplayStatics.GetGameInstance(r0_1)
  if IsValid(r4_1) then
    local r5_1 = r4_1:GetSceneManager()
    if IsValid(r5_1) then
      r5_1:ReceivedInputKey(r2_1, r3_1)
    end
  end
end
function r0_0.OnInputAxis_Lua(r0_2, r1_2, r2_2, r3_2, r4_2, r5_2, r6_2)
  -- line: [30, 32] id: 2
end
function r0_0.OnViewportSizeChanged_Lua(r0_3)
  -- line: [35, 38] id: 3
  DebugPrint(LXYTag, "BP_EMGameViewportClient_C:: OnViewportSizeChanged_Lua")
  EventManager:FireEvent(EventID.GameViewportSizeChanged)
end
return r0_0
