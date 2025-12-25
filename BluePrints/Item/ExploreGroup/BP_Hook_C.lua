-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Item\ExploreGroup\BP_Hook_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.Item.BP_CombatItemBase_C"
})
function r0_0.OnActorReady(r0_1, r1_1)
  -- line: [15, 40] id: 1
  print(_G.LogTag, "LXZ OnActorReady", r0_1:GetName())
  r0_0.Super.OnActorReady(r0_1, r1_1)
  r0_1.Box.OnComponentBeginOverlap:Add(r0_1, r0_1.BoxBeginOverlap)
  r0_1.Box.OnComponentEndOverlap:Add(r0_1, r0_1.BoxEndOverlap)
  r0_1:SetActorEnableCollision(true)
  r0_1.TargetLoc = r0_1.FXLoc:K2_GetComponentLocation()
  r0_1.FxLocComp = r0_1.FXLoc
  if r1_1.Creator and r1_1.Creator.TriggerSphereRadius ~= 0 then
    r0_1.MaxDis = r1_1.Creator.TriggerSphereRadius
  end
  if r0_1.HookInteractiveComponent.InteractiveDistance ~= 0 then
    r0_1.MinDis = r0_1.HookInteractiveComponent.InteractiveDistance
  end
  r0_1.HookInteractiveComponent:InitCommonUIConfirmID(r0_1.Data.InteractiveId)
  r0_1.DeviceInPc = CommonUtils.GetDeviceTypeByPlatformName(r0_1) == "PC"
end
function r0_0.OpenMechanism(r0_2, r1_2)
  -- line: [42, 93] id: 2
  if r0_2:CheckPlayerEid(r1_2) then
    return 
  end
  local r2_2 = UE4.UGameplayStatics.GetGameInstance(r0_2)
  local r3_2 = Battle(r0_2):GetEntity(r1_2)
  local r4_2 = UGameplayStatics.GetGameState(r0_2)
  if r2_2.ShouldPlayDeliveryEndMontage or r4_2.ShouldStopHookInDungeonDelivery then
    return 
  end
  local r5_2 = UGameplayStatics.GetPlayerCharacter(r0_2, 0)
  if not r3_2:SetCharacterTag("Hook") then
    if r5_2 == r3_2 then
      GWorld.GameInstance:GetGameUIManager():ShowUITip(UIConst.Tip_CommonTop, GText("UI_Mechanism_CannotHook"))
    end
    return 
  end
  r3_2.IsInHook = true
  r3_2:SetMechanismEid(r0_2.Eid)
  r0_2.Overridden.OpenMechanism(r0_2, r1_2)
  r0_2.HookInteractiveComponent:OnStartInteractive(r3_2, r0_2.HookInteractiveComponent.MontageName, r0_2.Eid)
  print(_G.LogTag, "LXZ SetPlayer OpenMechanism", r3_2)
  r0_2:SetPlayer(r3_2, true)
  r0_2:SetPlayerEid(r1_2, true)
  local r6_2 = UGameplayStatics.GetGameState(r0_2)
  if r6_2.ValidHook then
    r6_2.ValidHook.HookInteractiveComponent:ForceEndInteractive(r3_2)
  end
  r6_2.ValidHook = r0_2
  if r5_2.Eid == r1_2 and (IsStandAlone(r0_2) or IsClient(r0_2)) then
    r3_2:ForbidSkillsInHooking(true)
    r3_2:DisableBattleWheel()
    r3_2:AddForbidTag("Battle")
    r3_2.MoveInput = FVector(0, 0, 0)
    r3_2.MoveInputCache = FVector(0, 0, 0)
    r3_2:AddMoveBlock(ESourceTags.Interactive)
  end
  local r7_2 = UKismetMathLibrary.FindLookAtRotation(r3_2:K2_GetActorLocation(), r0_2:K2_GetActorLocation())
  r7_2.Pitch = 0
  r7_2.Roll = 0
  r3_2:SetCollisionType("CapsuleComponent", "MonsterPawn", ECollisionResponse.ECR_OverLap, false)
  r3_2:SetCollisionType("CapsuleComponent", "WorldStatic", ECollisionResponse.ECR_OverLap, false)
  r3_2:K2_SetActorRotation(r7_2, false, nil, false)
end
function r0_0.CloseMechanism(r0_3, r1_3, r2_3)
  -- line: [95, 127] id: 3
  print(_G.LogTag, "LXZ Hook CloseMechanism")
  r0_3.Overridden.CloseMechanism(r0_3, r1_3, r2_3)
  local r3_3 = Battle(r0_3):GetEntity(r1_3)
  if r3_3 then
    r3_3.IsInHook = false
    r3_3:SetMechanismEid(0)
    r0_3.HookInteractiveComponent:OnEndInteractive(r3_3, r0_3.HookInteractiveComponent.MontageName, r0_3.Eid)
  end
  local r4_3 = UGameplayStatics.GetPlayerCharacter(r0_3, 0)
  r0_3:SetPlayer(r3_3, false)
  r0_3:SetPlayerEid(r1_3, false)
  local r5_3 = UGameplayStatics.GetGameState(r0_3)
  if r5_3 then
    r5_3.LastValidHook = r0_3
    r5_3.ValidHook = nil
  end
  if r4_3 and r4_3.Eid == r1_3 and (IsStandAlone(r0_3) or IsClient(r0_3)) then
    r3_3:ForbidSkillsInHooking(false)
    r3_3:EnableBattleWheel()
    r3_3:MinusForbidTag("Battle")
    r3_3:RemoveMoveBlock(ESourceTags.Interactive)
  end
  if r3_3 then
    r3_3:SetCollisionType("CapsuleComponent", "MonsterPawn", ECollisionResponse.ECR_Block, false)
    r3_3:SetCollisionType("CapsuleComponent", "WorldStatic", ECollisionResponse.ECR_Block, false)
  end
end
function r0_0.ForceCloseMechanism(r0_4, r1_4, r2_4)
  -- line: [129, 151] id: 4
  r0_4.Overridden.ForceCloseMechanism(r0_4, r1_4, r2_4)
  local r3_4 = Battle(r0_4):GetEntity(r1_4)
  local r4_4 = UGameplayStatics.GetPlayerCharacter(r0_4, 0)
  r0_4:SetPlayer(r3_4, false)
  r0_4:SetPlayerEid(r1_4, false)
  local r5_4 = UGameplayStatics.GetGameState(r0_4)
  r5_4.LastValidHook = r0_4
  r5_4.ValidHook = nil
  if r3_4 then
    if r4_4 and r4_4.Eid == r1_4 and (IsStandAlone(r0_4) or IsClient(r0_4)) then
      r3_4:ForbidSkillsInHooking(false)
      r3_4:EnableBattleWheel()
      r3_4:MinusForbidTag("Battle")
    end
    print(_G.LogTag, "LXZ HandleUseGouSuo ForceCloseMechanism")
    r3_4:SetCharacterTag("Falling")
    r3_4:SetMechanismEid(0)
  end
end
function r0_0.GetCanOpen(r0_5)
  -- line: [153, 159] id: 5
  local r1_5 = GWorld:GetAvatar()
  if r1_5 and r1_5.IsInRegionOnline then
    return true
  end
  return r0_5.Players:Length() > 0
end
function r0_0.BoxBeginOverlap(r0_6, r1_6, r2_6)
  -- line: [161, 167] id: 6
  if r2_6 ~= UGameplayStatics.GetPlayerCharacter(r0_6, 0) then
    return 
  end
  r0_6:SetPlayer(r2_6, true)
end
function r0_0.BoxEndOverlap(r0_7, r1_7, r2_7)
  -- line: [169, 175] id: 7
  if r2_7 ~= UGameplayStatics.GetPlayerCharacter(r0_7, 0) then
    return 
  end
  r0_7:SetPlayer(r2_7, false)
end
function r0_0.ShowUI(r0_8)
  -- line: [177, 179] id: 8
  r0_8.Overridden.ShowUI(r0_8)
end
function r0_0.CloseUI(r0_9)
  -- line: [181, 183] id: 9
  r0_9.Overridden.CloseUI(r0_9)
end
function r0_0.RefreshUI(r0_10, r1_10)
  -- line: [185, 187] id: 10
end
function r0_0.OnCharacterEnterLanding(r0_11, r1_11, r2_11)
  -- line: [189, 194] id: 11
  if not r1_11:IsPlayer() or r0_11:CheckPlayer(r1_11) then
    return 
  end
  r0_11.HookInteractiveComponent:EndInteractive(r1_11)
end
function r0_0.PlayEndMontage(r0_12, r1_12, r2_12)
  -- line: [196, 198] id: 12
  r1_12:PlayActionMontage("Interactive/MechInteractive", r2_12 .. "_Montage", {}, false)
end
function r0_0.OnRep_PlayerEid(r0_13)
  -- line: [200, 208] id: 13
end
function r0_0.DisplayInteractiveBtn(r0_14, r1_14)
  -- line: [212, 219] id: 14
  local r2_14 = UGameplayStatics.GetGameState(r0_14)
  if not r2_14 then
    return 
  end
  r2_14:AddInteractiveHook(r0_14)
  r0_14:SetBtnDisplay(true)
end
function r0_0.RefreshInteractiveBtn(r0_15, r1_15)
  -- line: [221, 285] id: 15
  local r2_15 = UGameplayStatics.GetGameState(r0_15)
  if not r2_15 then
    return 
  end
  local r3_15 = r2_15:GetValidHook(r1_15, r0_15.TargetLoc)
  if r3_15 ~= r0_15 then
    return 
  end
  if not IsValid(r0_15.InteractiveUI) then
    if r0_15.DeviceInPc then
      r0_15.InteractiveUI = UIManager(r0_15):GetUIObj("HookInteractive")
      if not IsValid(r0_15.InteractiveUI) then
        r0_15.InteractiveUI = UIManager(r0_15):LoadUINew("HookInteractive")
        r0_15.InteractiveUI:Init(r0_15)
      end
    else
      EventManager:FireEvent(EventID.OnMobileHookShow, r0_15)
    end
  end
  if IsValid(r0_15.InteractiveUI) then
    if not UIManager(r0_15):GetUIObj("HookInteractive") and r0_15.DeviceInPc then
      r0_15.InteractiveUI = UIManager(r0_15):LoadUINew("HookInteractive")
      r0_15.InteractiveUI:Init(r0_15)
    elseif not r0_15.DeviceInPc then
      EventManager:FireEvent(EventID.OnMobileHookShow, r0_15)
    end
  end
  if IsValid(r0_15.InteractiveUI) and r0_15.InteractiveUI.Hook and r0_15.InteractiveUI.Hook ~= r3_15 then
    r0_15.InteractiveUI.Hook:CloseUI()
    r3_15:ShowUI()
    r0_15.InteractiveUI:UpdateOwner(r0_15, r0_15.HookInteractiveComponent, r1_15)
  elseif IsValid(r0_15.InteractiveUI) and r0_15.InteractiveUI.Hook == nil then
    r3_15:ShowUI()
    r0_15.InteractiveUI:UpdateOwner(r0_15, r0_15.HookInteractiveComponent, r1_15)
  end
  r0_15:RefreshUI(r1_15)
end
function r0_0.NotDisplayInteractiveBtn(r0_16, r1_16)
  -- line: [287, 300] id: 16
  local r2_16 = UGameplayStatics.GetGameState(r0_16)
  if not r2_16 then
    return 
  end
  r0_16:SetBtnDisplay(false)
  r2_16:RemoveInteractiveHook(r0_16)
  if not IsValid(r0_16.InteractiveUI) or r0_16.InteractiveUI.Hook ~= r0_16 then
    return 
  end
  r0_16.InteractiveUI:Close(r0_16)
  r0_16.InteractiveUI = nil
  r0_16:CloseUI()
end
function r0_0.OnEMActorDestroy(r0_17, ...)
  -- line: [302, 309] id: 17
  if r0_17.Players:Length() > 0 then
    for r5_17, r6_17 in pairs(r0_17.Players) do
      r0_17.HookInteractiveComponent:EndInteractive(r6_17)
    end
    -- close: r1_17
  end
  r0_0.Super.OnEMActorDestroy(r0_17, ...)
end
function r0_0.ReceiveEndPlay(r0_18, r1_18)
  -- line: [311, 321] id: 18
  if r0_18.bDisplayBtn then
    r0_18:NotDisplayInteractiveBtn()
  end
  if r0_18.Players:Length() > 0 then
    for r6_18, r7_18 in pairs(r0_18.Players) do
      r0_18.HookInteractiveComponent:EndInteractive(r7_18)
    end
    -- close: r2_18
  end
  r0_0.Super.ReceiveEndPlay(r0_18, r1_18)
end
return r0_0
