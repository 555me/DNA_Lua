-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Char\BP_PhantomCharacter_C.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("BluePrints.Combat.BattleLogic.EffectResults")
require("UnLua")
local r1_0 = Class({
  "BluePrints.Char.BP_MonsterCharacter_C",
  "BluePrints.Char.CharacterComponent.PlayerCommonInterface"
})
r1_0._components = {
  "BluePrints.Char.CharacterComponent.PickupComponent",
  "BluePrints.Char.CharacterComponent.CharacterPickupUseComponent",
  "BluePrints.Char.CharacterComponent.TeamRecoveryComponent"
}
function r1_0.Initialize(r0_1, r1_1)
  -- line: [20, 23] id: 1
  r1_0.Super.Initialize(r0_1)
  r0_1:InitActionLogicParamas()
end
function r1_0.ClientInitInfoNew(r0_2, r1_2)
  -- line: [25, 35] id: 2
  r0_2:InitUIWidgetComponent()
  if r0_2.PhantomOwner and r0_2.PhantomOwner:IsMainPlayer() then
    r0_2:AddInteractiveTrigger()
    r0_2.InteractiveTriggerComponent.SpecInteractiveComps:Add(UPickUpInteractiveComponent:StaticClass())
  end
  if r0_2.BP_RecoverInteractiveComponent then
    r0_2.BP_RecoverInteractiveComponent:InitCharInfo()
  end
end
function r1_0.ClientInitInfo(r0_3, r1_3)
  -- line: [37, 48] id: 3
  r1_0.Super.ClientInitInfo(r0_3, r1_3)
  r0_3:InitUIWidgetComponent()
  if r0_3.PhantomOwner and r0_3.PhantomOwner:IsMainPlayer() then
    r0_3:AddInteractiveTrigger()
    r0_3.InteractiveTriggerComponent.SpecInteractiveComps:Add(UPickUpInteractiveComponent:StaticClass())
  end
  if r0_3.BP_RecoverInteractiveComponent then
    r0_3.BP_RecoverInteractiveComponent:InitCharInfo()
  end
end
function r1_0.ReceiveEndPlay(r0_4, r1_4)
  -- line: [65, 71] id: 4
  local r2_4 = GWorld:GetAvatar()
  if r2_4 and r1_4 ~= EEndPlayReason.LevelTransition then
    r2_4:ClearCreatePhantomInfo(r0_4.UnitId)
  end
  r0_4.Overridden.ReceiveEndPlay(r0_4, r1_4)
end
function r1_0.CheckCanPart(r0_5)
  -- line: [73, 75] id: 5
  return true
end
function r1_0.CheckJumpStage(r0_6)
  -- line: [118, 130] id: 6
  local r1_6 = r0_6.PlayerAnimInstance.CurrentJumpState
  local r2_6 = not r0_6.IsInAir
  if r0_6:CheckFirstJumpCondition(r1_6, r2_6) then
    return Const.FirstJump
  end
  if r0_6:CheckSecondJumpCondition(r1_6, r2_6) then
    return Const.SecondJump
  end
  return nil
end
function r1_0.OnJumpStageChaned(r0_7, r1_7)
  -- line: [132, 146] id: 7
  if r1_7 == Const.BulletJump then
    r0_7.BulletJumpCount = r0_7.BulletJumpCount + 1
    r0_7:RealStopSlide(false)
  end
  if r0_7:CharacterInTag("Avoid") then
    r0_7:StopDodge()
  end
  if r0_7.SlideTime ~= -1 then
    r0_7.SlideTime = -1
  end
  r0_7:SetCrouch(false)
  r0_7:SetHoldCrouch(false)
end
function r1_0.CommonRecoveryImpl(r0_8)
  -- line: [170, 175] id: 8
  r0_8.Super.CommonRecoveryImpl(r0_8)
  if r0_8.PhantomOwner then
    Battle(r0_8):TriggerBattleEvent(BattleEventName.OnPhantomRecover, r0_8.PhantomOwner, r0_8)
  end
end
function r1_0.Recovery(r0_9, ...)
  -- line: [177, 194] id: 9
  r1_0.Super.Recovery(r0_9, ...)
  r0_9:AddGravityModifier(UE4.EGravityModifierTag.PhantomDead, 1)
  if IsAuthority(r0_9) then
    r0_9:UseSkill(Const.PlayerRecoverySkill, 0)
  end
  if r0_9.IsHostage and IsAuthority(r0_9) then
    local r1_9 = UGameplayStatics.GetGameMode(r0_9)
    if r1_9 then
      r1_9:RemoveDungeonEvent("HostageDyingCountDown")
    end
  end
end
function r1_0.OnRealEnterDying(r0_10)
  -- line: [217, 238] id: 10
  r0_10.Super.OnRealEnterDying(r0_10)
  DebugPrint("LHQPhantomState OnRealEnterDying")
  if IsAuthority(r0_10) and not r0_10.IsHostage then
    local r1_10 = UGameplayStatics.GetGameMode(r0_10)
    if r0_10:CheckCanRecovery() then
      local r2_10 = r1_10:GetRespawnRule(r0_10)
      if r2_10 and r2_10.PhantomRecoverSpeed then
        Battle(r0_10):RecoverOther(r0_10.Eid, r0_10.Eid, true, {
          Speed = r2_10.PhantomRecoverSpeed,
        }, UE4.ERecoverReason.RecoverReason_SelfRecover)
      end
    end
  end
  if r0_10.IsHostage then
    local r1_10 = r0_10:GetOrAddTeamRecoveryComp()
    if r1_10 then
      r1_10.HaveDyingCountDown = true
    end
  end
end
function r1_0.OnRealDie(r0_11)
  -- line: [241, 283] id: 11
  DebugPrint("Tianyi@ Phantom real die, Eid = " .. r0_11.Eid)
  local r1_11 = r0_11:GetCurRespawnRuleName()
  if r1_11 and DataMgr.RespawnRule[r1_11] and DataMgr.RespawnRule[r1_11].DissolveAfterDead == true then
    local r3_11 = 1
    r0_11:PhantomDiscard(r3_11, 0, false)
    if IsAuthority(r0_11) then
      r0_11:AddTimer_Combat(0.4 / r3_11, function()
        -- line: [250, 250] id: 12
        r0_11:EMActorDestroy(EDestroyReason.PhantomDieInRegion)
      end, false, 0, "DestroyPhantomTimer", false)
    end
  end
  if IsAuthority(r0_11) and r0_11.IsHostage then
    local r2_11 = UGameplayStatics.GetGameMode(r0_11)
    if r2_11 then
      r2_11:TriggerDungeonComponentFun("OnHostageDie", r0_11)
    end
  end
end
function r1_0.TriggerFallingCallable(r0_13)
  -- line: [286, 295] id: 13
  DebugPrint("OtherActor is Falling Dead. ActorName: ", r0_13:GetName(), ", UnitId: ", r0_13.UnitId, ", Eid: ", r0_13.Eid, ", CreatorId: ", r0_13.CreatorId, " CreatorType: ", r0_13.CreatorType, ", BornPos: ", r0_13.BornPos)
  UNavigationFunctionLibrary.ActorToActorTeleport(r0_13, r0_13.PhantomOwner)
  r0_13:EnableCheckOverlapPush({})
  if r0_13.OnTriggerFallingCallable then
    r0_13:OnTriggerFallingCallable()
  end
  r0_13:Landed()
end
function r1_0.TriggerWaterFallingCallable(r0_14)
  -- line: [298, 300] id: 14
  r0_14:TriggerFallingCallable()
end
function r1_0.ActiveHostageGuide(r0_15, r1_15, r2_15)
  -- line: [321, 330] id: 15
  local r4_15 = UE4.UGameplayStatics.GetGameInstance(r0_15):GetSceneManager()
  r0_15.StartFireDistanceEvent = true
  r0_15.IsHostageChar = true
  if IsValid(r4_15) and r0_15.Data and r0_15.Data.GuideIconAni then
    r4_15:UpdateSceneGuideIcon(r2_15, r0_15, nil, r1_15, true, r0_15.Data)
  end
end
function r1_0.DeactiveHostageGuide(r0_16)
  -- line: [332, 339] id: 16
  local r2_16 = UE4.UGameplayStatics.GetGameInstance(r0_16):GetSceneManager()
  if IsValid(r2_16) and r0_16.Data and r0_16.Data.GuideIconAni then
    r2_16:UpdateSceneGuideIcon(r0_16.Eid, r0_16, nil, "Delete", true, r0_16.Data)
  end
end
function r1_0.PhantomBulletJump(r0_17, r1_17)
  -- line: [352, 355] id: 17
  r0_17.BulletForward = FVector(r1_17.X, r1_17.Y, r1_17.Z)
  return r0_17:ServerDoJump(Const.BulletJump)
end
function r1_0.GetBulletJumpForwardVector(r0_18)
  -- line: [357, 365] id: 18
  if not r0_18.BulletForward then
    return r0_18:GetActorForwardVector(), r0_18:GetActorRightVector(), r0_18:K2_GetActorRotation()
  end
  local r1_18 = r0_18.BulletForward:ToRotator()
  return r0_18.BulletForward, UE4.UKismetMathLibrary.GetRightVector(r1_18), r1_18
end
function r1_0.OnEMActorDestroy_Lua(r0_19, r1_19)
  -- line: [367, 373] id: 19
  if IsClient(r0_19) and not GameState(r0_19):GetPhantomState(r0_19.Eid) or IsStandAlone(r0_19) then
    EventManager:FireEvent(EventID.CloseTeammateBloodUI, r0_19.Eid, r0_19.TeammateUI)
    r0_19.TeammateUI = nil
  end
  r0_19.Super.OnEMActorDestroy_Lua(r0_19, r1_19)
end
function r1_0.OnCharacterReady_Lua(r0_20)
  -- line: [375, 391] id: 20
  if r0_20.RangedWeapon == nil then
    return 
  end
  local r1_20 = r0_20.RangedWeapon.WeaponId
  local r2_20 = DataMgr.BattleWeapon[r1_20]
  if r2_20 and r2_20.IsForceEnablePhysics and UE4.UCharacterFunctionLibrary.SetMonsterPhysicsForceEnable(r0_20:GetWorld(), true) then
    DebugPrint("@gulinan BP_PhantomCharacter::OnCharacterReady_Lua try Enable physics, WeaponId: ", r1_20)
  elseif UE4.UCharacterFunctionLibrary.SetMonsterPhysicsForceEnable(r0_20:GetWorld(), false) then
    DebugPrint("@gulinan BP_PhantomCharacter::OnCharacterReady_Lua try Disable physics, WeaponId: ", r1_20)
  end
end
function r1_0.UpdatePhantomRegionData(r0_21)
  -- line: [393, 399] id: 21
  local r1_21 = UGameplayStatics.GetGameMode(r0_21)
  if r1_21 then
    r1_21:GetRegionDataMgrSubSystem():UpdatePhantomRegionData(r0_21)
  end
end
AssembleComponents(r1_0, {
  "CheckJumpStage",
  "OnJumpStageChaned",
  "GetBulletJumpForwardVector"
})
return r1_0
