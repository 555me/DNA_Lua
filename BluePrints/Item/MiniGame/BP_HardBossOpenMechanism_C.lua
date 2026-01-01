-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Item\MiniGame\BP_HardBossOpenMechanism_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class("BluePrints/Item/MiniGame/BP_OpenUIMechanism_C")
function r0_0.OpenUI(r0_1, r1_1, r2_1)
  -- line: [14, 25] id: 1
  r0_0.Super.OpenUI(r0_1, r1_1, r2_1)
  local r3_1 = UE4.UGameplayStatics.GetPlayerController(r0_1, 0)
  local r4_1 = Battle(r0_1):GetEntity(r1_1)
  r0_1.Camera:SetAspectRatio(r4_1.CharCameraComponent.AspectRatio)
  r0_1.Camera:SetFieldOfView(r4_1.CharCameraComponent.FieldOfView)
  r3_1:SetViewTargetWithBlend(r0_1, r0_1.OpenBlendTime)
  r0_1.CacheControllerPausedParam = r3_1.bShouldPerformFullTickWhenPaused
  r3_1.bShouldPerformFullTickWhenPaused = true
  r4_1.CharSpringArmComponent:SetTickableWhenPaused(true)
end
function r0_0.CloseMechanism(r0_2, r1_2, r2_2)
  -- line: [27, 38] id: 2
  local r3_2 = UE4.UGameplayStatics.GetPlayerController(r0_2, 0)
  local r4_2 = Battle(r0_2):GetEntity(r1_2)
  r3_2:SetControlRotation(FRotator(0, r4_2:K2_GetActorRotation().Yaw, 0))
  r3_2:SetViewTargetWithBlend(r4_2, r0_2.CloseBlendTime, EViewTargetBlendFunction.VTBlend_Linear, 0)
  EventManager:AddEvent(EventID.UnLoadUI, r0_2, r0_2.ResetPauseState)
  r0_0.Super.CloseMechanism(r0_2, r1_2)
end
function r0_0.ResetPauseState(r0_3, r1_3)
  -- line: [40, 49] id: 3
  if r1_3 ~= "HardBossLevelChoose" then
    return 
  end
  EventManager:RemoveEvent(EventID.UnLoadUI, r0_3)
  UE4.UGameplayStatics.GetPlayerController(r0_3, 0).bShouldPerformFullTickWhenPaused = r0_3.CacheControllerPausedParam
  UE4.UGameplayStatics.GetPlayerCharacter(r0_3, 0).CharSpringArmComponent:SetTickableWhenPaused(false)
end
function r0_0.GetCanOpen(r0_4, r1_4)
  -- line: [51, 67] id: 4
  local r2_4 = GWorld:GetAvatar()
  if not r2_4 then
    r0_4.CanOpen = true
    return 
  end
  local r3_4 = Battle(r0_4)
  if not r3_4 then
    return 
  end
  local r4_4 = r3_4:GetEntity(r1_4)
  if r4_4 and r4_4:IsDead() then
    r0_4.CanOpen = false
    return 
  end
  r0_4.CanOpen = not r2_4:IsInHardBoss()
end
function r0_0.HideMechanism(r0_5, r1_5, r2_5, r3_5)
  -- line: [69, 85] id: 5
  for r9_5, r10_5 in pairs(r0_5:K2_GetComponentsByClass(UShapeComponent:StaticClass())) do
    r10_5:SetCollisionEnabled(0)
  end
  -- close: r5_5
  if not r3_5 then
    r0_5:SetActorHideTag(r2_5, true)
    for r10_5, r11_5 in pairs(r0_5:K2_GetComponentsByClass(UMeshComponent:StaticClass())) do
      r11_5:SetCollisionEnabled(0)
    end
    -- close: r6_5
  end
  if r1_5 then
    EventManager:AddEvent(EventID.ConditionComplete, r0_5, r0_5.ShowMechanismWithCondition)
  end
end
function r0_0.ShowMechanismWithCondition(r0_6, r1_6)
  -- line: [87, 102] id: 6
  if r1_6 ~= r0_6.Data.ShowConditionId then
    return 
  end
  for r7_6, r8_6 in pairs(r0_6:K2_GetComponentsByClass(UShapeComponent:StaticClass())) do
    r8_6:SetCollisionEnabled(1)
  end
  -- close: r3_6
  for r8_6, r9_6 in pairs(r0_6:K2_GetComponentsByClass(UMeshComponent:StaticClass())) do
    r9_6:SetCollisionEnabled(1)
  end
  -- close: r4_6
  EventManager:RemoveEvent(EventID.ConditionComplete, r0_6)
  r0_6:SetActorHideTag("Condition", false)
end
function r0_0.OnActorReady(r0_7, r1_7)
  -- line: [104, 115] id: 7
  r0_0.Super.OnActorReady(r0_7, r1_7)
  local r2_7 = DataMgr.MechanismState[r0_7.StateId]
  if r2_7 and r2_7.StateEvent then
    for r7_7, r8_7 in pairs(r2_7.StateEvent) do
      if r8_7.TypeNextState and r8_7.TypeNextState.Type == "InteractDone" then
        r0_7:ChangeState("InteractDone", 0)
      end
    end
    -- close: r3_7
  end
  EventManager:FireEvent(EventID.OnMiniGameCreated, r0_7)
end
function r0_0.ReceiveEndPlay(r0_8, r1_8)
  -- line: [117, 120] id: 8
  r0_0.Super.ReceiveEndPlay(r0_8, r1_8)
  EventManager:RemoveEvent(EventID.ConditionComplete, r0_8)
end
return r0_0
