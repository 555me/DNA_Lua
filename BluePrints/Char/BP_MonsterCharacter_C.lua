-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Char\BP_MonsterCharacter_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("Utils.ItemUtils")
local r1_0 = require("CommonConst")
local r2_0 = require("Utils.UIUtils")
local r3_0 = require("BluePrints.UI.GMInterface.GMVariable")
local r4_0 = Class({
  "BluePrints.Char.BP_AICharacterBase_C",
  "BluePrints.Combat.Components.MonsterInitLogic",
  "BluePrints.Combat.BattleLogic.CampLogic",
  "BluePrints.Char.CharacterComponent.MonsterComponent.MonModelComponent"
})
r4_0._components = {
  "BluePrints.Char.CharacterComponent.MonsterComponent.MonCaptureComponent",
  "BluePrints.Char.CharacterComponent.MonsterComponent.MonPenalizeComponent"
}
UE4.AMonsterCharacter.SetEQSOptimizationInfo(Const.bSkipEQSTestWhilePlatformWarning, Const.NumOfEQSItemWhilePlatformWarning)
UE4.AMonsterCharacter.SetAndroidPlayDeathEffectDist(Const.AndroidPlayDeathEffectDist)
function r4_0.Initialize(r0_1, r1_1)
  -- line: [38, 41] id: 1
  r0_1.bIsBossInPart = false
end
function r4_0.ReceiveBeginPlay(r0_2)
  -- line: [43, 60] id: 2
  r0_2.IsDestroied = false
  r4_0.Super.ReceiveBeginPlay(r0_2)
  local r1_2 = UGameplayStatics.GetGameState(r0_2)
  if r1_2 and r1_2:IsInRegion() then
    r0_2.CharFSMComp.OnAfterTagChanged:Add(r0_2, r0_2.OnTagChange)
  end
end
function r4_0.TryStartServerBasedMovementTimer(r0_3)
  -- line: [62, 82] id: 3
  -- notice: unreachable block#7
  local r1_3 = UE4.USubsystemBlueprintLibrary.GetWorldSubsystem(r0_3, UE4.UWorldCompositionSubSystem)
  local r2_3 = r0_3.bInPool
  if not r2_3 then
    r2_3 = r0_3.IsDead and r0_3:IsDead() and r0_3.InitSuccess and r0_3.IsRealMonster and r0_3:IsRealMonster()
  else
    r2_3 = false
  end
  if r1_3 ~= nil and r1_3:WCIsInDungeon() and IsClient(r0_3) and r2_3 then
    DebugPrint(r0_3:GetName() .. " @gulinan Start CheckServerBasedMovementTimer Timer")
    r0_3.CheckServerBasedMovementTimer = r0_3:AddTimer(1, function()
      -- line: [67, 80] id: 4
      if r0_3.bInPool or r0_3.IsDead and r0_3:IsDead() or not r0_3.InitSuccess then
        if r0_3.CheckServerBasedMovementTimer ~= nil then
          DebugPrint(r0_3:GetName() .. " @gulinan End CheckServerBasedMovementTimer Timer")
          r0_3:RemoveTimer(r0_3.CheckServerBasedMovementTimer)
          r0_3.CheckServerBasedMovementTimer = nil
        else
          DebugPrint(r0_3:GetName() .. " @gulinan CheckServerBasedMovementTimer is nil but timer still tick")
          r0_3:RemoveTimer("CheckServerBasedMovement")
        end
      end
      r0_3.ReplicatedBasedMovement.bServerHasBaseComponent = false
    end, true, 0, "CheckServerBasedMovement", false)
  end
end
function r4_0.TryStartOutAirWallCheck(r0_5, r1_5)
  -- line: [84, 131] id: 5
  -- notice: unreachable block#14
  local r2_5 = UGameplayStatics.GetGameState(r0_5)
  local r3_5 = r2_5 and r2_5:IsInDungeon()
  if r2_5 and r3_5 and URuntimeCommonFunctionLibrary.IsWorldCompositionEnabled(r0_5) and r2_5.CheckOutAirDoorBoxTransform ~= nil and r2_5.CheckOutAirBoxLocal ~= nil then
    r0_5.CheckOutAirDoorBoxTransform = r2_5.CheckOutAirDoorBoxTransform
    r0_5.CheckOutAirBoxLocal = r2_5.CheckOutAirBoxLocal
    local r4_5 = r0_5.bInPool
    if not r4_5 then
      r4_5 = r0_5.IsDead and r0_5:IsDead() and r0_5.InitSuccess and r0_5.IsRealMonster and r0_5:IsRealMonster()
    else
      r4_5 = false
    end
    if r4_5 then
      r0_5.TimeCount = 0
      r0_5.CheckOutAirDoorHandle = r0_5:AddTimer(1, function()
        -- line: [94, 128] id: 6
        -- notice: unreachable block#9
        if r0_5.CheckOutAirDoorHandle == nil then
          DebugPrint(r0_5:GetName() .. " @gulinan AirDoorBoxOutCheck Handle is invalid but timer still tick")
          r0_5.RemoveTimer("CheckOutAirDoorBoxTimer")
          r0_5.CheckOutAirDoorHandle = nil
        end
        local r0_6 = r0_5.bInPool
        if not r0_6 then
          r0_6 = r0_5.IsDead and r0_5:IsDead() and r0_5.InitSuccess and r0_5.IsRealMonster and r0_5:IsRealMonster()
        else
          r0_6 = false
        end
        if r0_5 ~= nil and not r0_6 and r0_5.CheckOutAirDoorHandle ~= nil then
          r0_5:RemoveTimer(r0_5.CheckOutAirDoorHandle)
          r0_5.CheckOutAirDoorHandle = nil
        end
        r0_5.CheckOutAirDoorBoxTransform.Scale3D = FVector(1, 1, 1)
        local r1_6 = UE4.UKismetMathLibrary.InverseTransformLocation(r0_5.CheckOutAirDoorBoxTransform, r0_5:K2_GetActorLocation())
        if r0_5.CheckOutAirBoxLocal.X < r1_6.X or r1_6.X < -r0_5.CheckOutAirBoxLocal.X or r0_5.CheckOutAirBoxLocal.Y < r1_6.Y or r1_6.Y < -r0_5.CheckOutAirBoxLocal.Y or r0_5.CheckOutAirBoxLocal.Z < r1_6.Z or r1_6.Z < -r0_5.CheckOutAirBoxLocal.Z then
          if r0_5.TimeCount < 15 then
            r0_5.TimeCount = r0_5.TimeCount + 1
          else
            r0_5.TimeCount = 0
            Battle(r0_5):BattleOnDead(r0_5.Eid, r0_5.Eid, 0, EDeathReason.StuckInWall)
            if r0_5.CheckOutAirDoorHandle ~= nil then
              r0_5:RemoveTimer(r0_5.CheckOutAirDoorHandle)
              r0_5.CheckOutAirDoorHandle = nil
            end
          end
        else
          r0_5.TimeCount = 0
        end
      end, true, 0, "CheckOutAirDoorBoxTimer", false)
    end
  end
end
function r4_0.CallFromCPPDelegete(r0_7, r1_7)
  -- line: [133, 135] id: 7
  DebugPrint("BP_MonsterCharacter_C:CallFromCPPDelegete", r1_7)
end
function r4_0.OnTagChange(r0_8, r1_8, r2_8, r3_8)
  -- line: [137, 148] id: 8
  if r3_8 ~= "HitFly" then
    return 
  end
  local r4_8 = r0_8.Mesh
  if r4_8 and r4_8.SkeletalMesh:GetPhysicsAsset() then
    for r10_8, r11_8 in pairs(r4_8.SkeletalMesh:GetPhysicsAsset().SkeletalBodySetups) do
      if r11_8 and r11_8.PhysicsType == EPhysicsType.PhysType_Default and r11_8.CollisionReponse ~= EBodyCollisionResponse.BodyCollision_Enabled then
        r11_8.CollisionReponse = EBodyCollisionResponse.BodyCollision_Enabled
      end
    end
    -- close: r6_8
  end
end
function r4_0.SetReplaceAttrsLua(r0_9, r1_9)
  -- line: [163, 168] id: 9
  local r2_9 = r1_9:GetLuaTable("ReplaceAttrs")
  if r2_9 then
    r0_9:SetReplaceAttrs(r2_9)
  end
end
function r4_0.TryResumeRootMotionFromPush(r0_10)
  -- line: [170, 174] id: 10
  if not r0_10.bBePushed and r0_10:GetRootMotionTagState(ESourceTags.ApplyPush) then
    r0_10:EnableRootMotion(ESourceTags.ApplyPush)
  end
end
function r4_0.TickMonsterBattleComponent(r0_11, r1_11)
  -- line: [176, 184] id: 11
  r0_11:TickComponent(r1_11)
end
function r4_0.CheckMonsterCanReachTest(r0_12)
  -- line: [186, 194] id: 12
  local r2_12 = r0_12:CheckMonsterCanReach(UE4.UGameplayStatics.GetPlayerCharacter(r0_12, 0))
  if not r2_12 then
    return 
  end
  r0_12:K2_SetActorLocation(r2_12, false, nil, false)
  print("selfCheckMonsterCanReachTest", r2_12)
end
function r4_0.GetBlueprintPath(r0_13)
  -- line: [196, 198] id: 13
  return r0_13.Data.UnitBPPath
end
function r4_0.PlayOutBattleMontage(r0_14, r1_14)
  -- line: [200, 220] id: 14
  local r3_14 = DataMgr.Model[r0_14.ModelId].BehaviorMontageGroupId
  if not r3_14 or not DataMgr.BehaviorRuleId[r3_14] then
    return 0
  end
  local r4_14 = DataMgr.BehaviorRuleId[r3_14].OutBattleList
  if not r4_14 then
    return 0
  end
  r0_14.LastOutBattleMontageIndex = r4_14[r1_14]
  if not r0_14.LastOutBattleMontageIndex then
    return 0
  end
  if not DataMgr.BehaviorMontage[r0_14.LastOutBattleMontageIndex] then
    return 0
  end
  r0_14:Montage_RepPlay(DataMgr.BehaviorMontage[r0_14.LastOutBattleMontageIndex].MontagePath)
  return r0_14.EMAnimInstance.NowMontageDuration
end
function r4_0.OnEMActorDestroy_Lua(r0_15, r1_15)
  -- line: [288, 307] id: 15
  r0_15:CommonOnEMActorDestroy(r1_15)
end
function r4_0.GetKillSourceType(r0_16, r1_16)
  -- line: [376, 388] id: 16
  local r2_16 = Battle(r0_16):GetEntity(r1_16)
  local r3_16 = nil
  if r2_16 then
    local r4_16 = r2_16:GetRootSource()
    if r4_16 and r4_16.IsPlayer and r4_16:IsPlayer() then
      r3_16 = r1_0.ActorType.Player
    elseif r4_16 and r4_16.IsCombatItemBase and r4_16:IsCombatItemBase() then
      r3_16 = r1_0.ActorType.CombatItemBase
    end
  end
  return r3_16
end
function r4_0.IsAllowedExp(r0_17)
  -- line: [507, 524] id: 17
  local r1_17 = GWorld:GetAvatar()
  if not r1_17 then
    return false
  end
  if not r1_17:IsInDungeon() then
    return true
  end
  local r2_17 = UE4.UGameplayStatics.GetGameState(r0_17)
  local r3_17 = DataMgr.Dungeon[r2_17.DungeonId]
  if not r3_17 then
    if DataMgr.HardBossDifficulty[r2_17.DungeonId] then
      return true
    end
    return false
  end
  return not r3_17.OnlyCombatReward
end
function r4_0.Recovery(r0_18, ...)
  -- line: [526, 529] id: 18
  r4_0.Super.Recovery(r0_18, ...)
  r0_18:SetCharacterTagIdle()
end
function r4_0.OnDeadAnimationEnd(r0_19)
  -- line: [531, 544] id: 19
  r0_19.Mesh:SetCollisionProfileName("Ragdoll")
  if not r0_19.IsSpawnedByMovieCaptureSequence then
    r0_19.Mesh:SetAllBodiesBelowSimulatePhysics("root", true, false)
  end
  r0_19.Mesh:SetAllBodiesPhysicsBlendWeight(1)
  r0_19:BeginRagdollState("Ragdoll", "pelvis", -1, true, 1, 0, ERagdollStateType.RagdollStateDead)
  if r0_19.DuringDyingHitFly then
    r0_19.DuringDyingHitFly = nil
  end
end
function r4_0.SetActionModeForBlackBoard(r0_20, r1_20)
  -- line: [546, 550] id: 20
  if r0_20:GetOwnBlackBoardComponent() then
    r0_20:GetOwnBlackBoardComponent():SetValueAsEnum("ActionMode", r1_20)
  end
end
function r4_0.MonsterCommonLeaveTag(r0_21)
  -- line: [552, 559] id: 21
  if not DataMgr.MonsterStateLimit[r0_21.AutoSyncProp.CharacterTag] then
    return 
  end
  if DataMgr.MonsterStateLimit[r0_21.AutoSyncProp.CharacterTag].ForbidAI == 1 then
    r0_21:ClearStopBTFlag(r0_21.AutoSyncProp.CharacterTag)
  end
end
function r4_0.TriggerFallingCallable(r0_22, r1_22)
  -- line: [561, 599] id: 22
  DebugPrint("OtherActor is Falling Dead. ActorName: ", r0_22:GetName(), ", UnitId: ", r0_22.UnitId, ", Eid: ", r0_22.Eid, ", CreatorId: ", r0_22.CreatorId, " CreatorType: ", r0_22.CreatorType, ", BornPos: ", r0_22.BornPos)
  if r0_22.IsSummonMonster and r0_22:IsSummonMonster() then
    local r2_22 = r0_22:GetDirectSource()
    if not r2_22 then
      return 
    end
    if r0_22:GetAttachParentActor() then
      return 
    end
    UNavigationFunctionLibrary.ActorToActorTeleport(r0_22, r2_22)
    r0_22:EnableCheckOverlapPush({})
    if r0_22.OnTriggerFallingCallable then
      r0_22:OnTriggerFallingCallable()
    end
    r0_22:Landed()
  elseif r0_22.IsCaptureMonster and r0_22:IsCaptureMonster() then
    local r2_22 = nil
    local r3_22 = 9999999
    for r8_22, r9_22 in pairs(r1_22:GetAllPlayer()) do
      if IsValid(r9_22) then
        local r10_22 = r9_22:GetDistanceTo(r0_22)
        if r10_22 < r3_22 then
          r3_22 = r10_22
          r2_22 = r9_22
        end
      end
    end
    -- close: r4_22
    if IsValid(r2_22) then
      UNavigationFunctionLibrary.ActorToActorTeleport(r0_22, r2_22)
    end
  elseif r0_22.IsAIControlled and r0_22:IsAIControlled() and not r0_22:IsNPC() then
    r0_22:SetIsFallTrigger()
    Battle(r1_22):BattleOnDead(r0_22.Eid, r0_22.Eid, 0, EDeathReason.TriggerFalling)
  end
end
function r4_0.TriggerWaterFallingCallable(r0_23, r1_23)
  -- line: [601, 621] id: 23
  if r0_23.IsCaptureMonster and r0_23:IsCaptureMonster() then
    local r2_23 = nil
    local r3_23 = 9999999
    for r8_23, r9_23 in pairs(r1_23:GetAllPlayer()) do
      if IsValid(r9_23) then
        local r10_23 = r9_23:GetDistanceTo(r0_23)
        if r10_23 < r3_23 then
          r3_23 = r10_23
          r2_23 = r9_23
        end
      end
    end
    -- close: r4_23
    if IsValid(r2_23) then
      UNavigationFunctionLibrary.ActorToActorTeleport(r0_23, r2_23)
    end
  elseif r0_23.IsMonster and r0_23:IsMonster() then
    r0_23:SetIsFallTrigger()
    Battle(r0_23):BattleOnDead(r0_23.Eid, r0_23.Eid, 0, EDeathReason.TriggerFalling)
  end
end
function r4_0.CheckMonsterCanReach(r0_24, r1_24, r2_24)
  -- line: [655, 682] id: 24
  if UE4.UNavigationFunctionLibrary.CheckTwoPosHasPath(r0_24:K2_GetActorLocation(), r1_24:K2_GetActorLocation(), r0_24) == Const.PathTypeHasPath then
    return nil
  end
  local r4_24 = r0_24:K2_GetActorLocation()
  local r5_24 = r1_24:K2_GetActorLocation()
  local r6_24 = 36
  local r7_24 = r0_24.CapsuleComponent:GetUnscaledCapsuleRadius() * 10
  local r8_24 = r0_24:GetActorForwardVector()
  for r12_24 = 0, 9, 1 do
    local r13_24 = UE4.UKismetMathLibrary.DegCos(r6_24 * r12_24)
    local r14_24 = UE4.UKismetMathLibrary.DegSin(r6_24 * r12_24)
    local r15_24 = FVector((r8_24.X * r13_24 + r8_24.Y * r14_24), (r8_24.Y * r13_24 - r8_24.X * r14_24), 0) * r7_24 + r4_24
    if UE4.UNavigationFunctionLibrary.CheckTwoPosHasPath(r15_24, r5_24, r0_24) == Const.PathTypeHasPath then
      return r15_24
    end
  end
  if r2_24 then
    return nil
  end
  return r1_24:K2_GetActorLocation()
end
function r4_0.SetIsFallTrigger(r0_25)
  -- line: [684, 686] id: 25
  r0_25.IsFallTrigger = true
end
function r4_0.LeaveHitFlyTag(r0_26)
  -- line: [688, 689] id: 26
end
function r4_0.GetMonsterToTargetPitch(r0_27)
  -- line: [700, 710] id: 27
  local r1_27 = r0_27.BBTarget
  if not r1_27 then
    return 0
  end
  return (r1_27:K2_GetActorLocation() - r0_27:K2_GetActorLocation()):ToRotator().Pitch
end
function r4_0.TreasureMonsterInRougLikeOnDead(r0_28)
  -- line: [764, 769] id: 28
  local r1_28 = UE4.UGameplayStatics.GetGameMode(r0_28)
  if r1_28 then
    r1_28:SpeciaMonsterOnDead(r0_28.UnitId)
  end
end
function r4_0.AddHatredTargetByWaitRecover(r0_29, r1_29)
  -- line: [853, 866] id: 29
  local r2_29 = Battle(r0_29):GetEntity(r1_29)
  if not r2_29:IsPlayer() and not r2_29:IsAIControlled() then
    return 
  end
  if not r2_29:IsDead() then
    return 
  end
  local r3_29 = r0_29:GetPresetHatredValue(r2_29, "ReasonWaitRecover")
  if r0_29.TargetHatred:Find(r1_29) then
    r0_29:RemoveHatredTarget(r1_29)
    r0_29:AddHatredTarget(r1_29, r3_29, r3_29)
  end
end
function r4_0.ListenRecoverHatredEvent(r0_30)
  -- line: [868, 870] id: 30
  EventManager:AddEvent(EventID.CharDie, r0_30, r0_30.AddHatredTargetByWaitRecover)
end
function r4_0.RemoveRecoverHatredEvent(r0_31)
  -- line: [872, 874] id: 31
  EventManager:RemoveEvent(EventID.CharDie, r0_31)
end
function r4_0.GetSplingAnim(r0_32)
  -- line: [876, 881] id: 32
  if not r0_32.IsCoverMontage then
    return 
  end
  local r1_32 = r0_32.CoverPointInfo.IsCrouch
end
function r4_0.GetCoverMontageAnimAsset(r0_33, r1_33)
  -- line: [884, 894] id: 33
  local r2_33 = DataMgr.Model[r0_33.ModelId]
  local r3_33, r4_33 = r0_33:GetHitMontageFolderAndPrefix()
  if not r3_33 then
    return nil, nil
  end
  local r5_33 = r4_33 .. r1_33
  return nil, r3_33 .. "Locomotion/" .. r5_33 .. Const.MontageSuffix .. "." .. r5_33 .. Const.MontageSuffix
end
function r4_0.IsLimitMontage(r0_34)
  -- line: [896, 899] id: 34
  return DataMgr.MonsterStateLimit[r0_34.AutoSyncProp.CharacterTag].SourceTag == Const.StunTag
end
function r4_0.PlayLimitMontage(r0_35, r1_35)
  -- line: [901, 909] id: 35
  if r0_35:IsLimitMontage() == false then
    return 
  end
  local r2_35 = r0_35:GetLimitMontagePath(r1_35)
  if r2_35 == nil then
    return 
  end
  r0_35:PlayMontageByPath(r2_35, nil, false)
end
function r4_0.StopLimitMontage(r0_36, r1_36)
  -- line: [911, 922] id: 36
  if r0_36:IsLimitMontage() == false then
    return 
  end
  local r2_36 = r0_36:GetLimitMontagePath(r1_36)
  if r2_36 == nil then
    return 
  end
  local r3_36 = LoadObject(r2_36)
  if not r3_36 then
    return 
  end
  r0_36.EMAnimInstance:Montage_Stop(Const.MontageBlendOutTime, r3_36)
end
function r4_0.GetLimitMontagePath(r0_37, r1_37)
  -- line: [924, 933] id: 37
  local r2_37, r3_37 = r0_37:GetHitMontageFolderAndPrefix()
  if r2_37 ~= nil then
    return r2_37 .. "Combat/Hit/" .. r3_37 .. r1_37 .. "_Montage"
  else
    return nil
  end
end
function r4_0.GetSkillIdBySkillType(r0_38, r1_38)
  -- line: [935, 937] id: 38
  return r1_38
end
function r4_0.GetCurrentAnimationBlueprint(r0_39, r1_39)
  -- line: [939, 944] id: 39
  if r0_39.Data and r0_39.Data.AnimCoverPath then
    return r0_39.Data.AnimCoverPath
  end
  return r4_0.Super.GetCurrentAnimationBlueprint(r0_39, r1_39)
end
function r4_0.IsContainCollapsedGraphTag(r0_40, r1_40)
  -- line: [984, 990] id: 40
  if r1_40 == "None" then
    return false
  end
  if r0_40:HasAnyTags_Table(r0_40, {
    r1_40
  }, false) then
    return true
  end
  return false
end
function r4_0.BlockTickLod(r0_41, r1_41, r2_41, r3_41)
  -- line: [992, 1008] id: 41
  if r0_41.Data and r0_41.Data.DisableTicklod then
    return 
  end
  if r3_41 | ETickObjectFlag.FLAG_CHARMOVEMENTCOMPONENT then
    GWorld.logger.errorlog("@wuzhijun：BlockTickLod.处理移动组件用 BlockTickLod_MoveComp")
    return 
  end
  local r4_41 = USubsystemBlueprintLibrary.GetWorldSubsystem(r0_41, UEMSignificanceMgrSubsystem)
  if not r4_41 then
    return 
  end
  r4_41:BlockTickLod(ESignificanceTag.Monster, r1_41, r0_41, r2_41, r3_41)
end
function r4_0.BlockTickLod_BT(r0_42, r1_42, r2_42)
  -- line: [1010, 1020] id: 42
  if r0_42.Data and r0_42.Data.DisableTicklod then
    return 
  end
  local r3_42 = USubsystemBlueprintLibrary.GetWorldSubsystem(r0_42, UEMSignificanceMgrSubsystem)
  if not r3_42 then
    return 
  end
  r3_42:BlockTickLod(ESignificanceTag.MonsterBT, r1_42, r0_42:GetController(), r2_42, ETickObjectFlag.FLAG_ACTOR | ETickObjectFlag.FLAG_BTCOMPONENT)
end
function r4_0.CheckOverlapPushForChangeCollision(r0_43, r1_43, r2_43)
  -- line: [1022, 1030] id: 43
  return r0_43:EnableCheckOverlapPush({
    r0_43,
    function()
      -- line: [1023, 1027] id: 44
      if r0_43.CapsuleComponent then
        r0_43.CapsuleComponent:SetCollisionResponseToChannel(r1_43, r2_43)
      end
    end
  })
end
function r4_0.IsNeedHideInTalk(r0_45)
  -- line: [1032, 1038] id: 45
  if IsStandAlone(r0_45) then
    return GWorld.GameInstance:GetTalkContext():HasDisableMonsterSpawn()
  else
    return false
  end
end
function r4_0.OnTalkEnableMonsterSpawn(r0_46)
  -- line: [1040, 1043] id: 46
  r0_46:SetWaitInitTag(false, Const.CharWaitInitTag.HideInTalk)
  EventManager:RemoveEvent(EventID.TalkEnableMonsterSpawn, r0_46)
end
function r4_0.ReceiveEndPlay(r0_47, r1_47)
  -- line: [1045, 1070] id: 47
  EventManager:RemoveEvent(EventID.TalkEnableMonsterSpawn, r0_47)
  EventManager:RemoveEvent(EventID.CharDie, r0_47)
  GWorld.GameInstance.GlobalLockOnTargets:Remove(r0_47.Eid)
  if r0_47.BossBloodUI then
    r0_47.BossBloodUI:UnLoadSelf()
    r0_47.BossBloodUI = nil
  end
  r0_47.IsDestroied = true
  if r0_47.CheckOutAirDoorHandle ~= nil then
    DebugPrint(r0_47:GetName() .. " @gulinan Clear AirDoorBoxOutCheck Timer On Destroy")
    r0_47.RemoveTimer(r0_47.CheckOutAirDoorHandle)
    r0_47.CheckOutAirDoorHandle = nil
  end
  if r0_47.CheckServerBasedMovementTimer ~= nil then
    DebugPrint(r0_47:GetName() .. " @gulinan Clear CheckServerBasedMovementTimer Timer On Destroy")
    r0_47:RemoveTimer(r0_47.CheckServerBasedMovementTimer)
    r0_47.CheckServerBasedMovementTimer = nil
  end
end
function r4_0.UpdateCdAndUseSkill(r0_48, r1_48)
  -- line: [1072, 1076] id: 48
  r0_48:GetSkill(r1_48):ResetSkillCd()
  return r0_48:UseSkill(r1_48, 0)
end
function r4_0.ReuseSkill(r0_49, r1_49)
  -- line: [1078, 1091] id: 49
  local r2_49 = r0_49:GetSeqSkill(r1_49)
  if r2_49 == 0 then
    return false
  end
  local r3_49 = r0_49:GetSkill(r2_49)
  if not r3_49 then
    return false
  end
  if r3_49.SkillType == "Passive" then
    return false
  end
  r0_49:AddTimer(0.05, r0_49.UpdateCdAndUseSkill, true, 0, "ReuseSkillTimer", nil, r2_49)
end
function r4_0.CallSuperFunction(r0_50, r1_50, ...)
  -- line: [1093, 1095] id: 50
  r4_0.Super[r1_50](r0_50, ...)
end
function r4_0.OnTimeDilationChanged(r0_51, r1_51, r2_51)
  -- line: [1111, 1116] id: 51
  local r3_51 = UE4.UGameplayStatics.GetPlayerCharacter(r0_51, 0)
  if r3_51 then
    r3_51:TimeDilationPostProcess(r1_51, r2_51)
  end
end
function r4_0.SetTreasureMonsterTarget(r0_52, r1_52)
  -- line: [1118, 1120] id: 52
  r0_52:GetOwnBlackBoardComponent():SetValueAsVector("ExtractionLoc", r1_52)
end
function r4_0.GetManualItemId(r0_53)
  -- line: [1140, 1142] id: 53
  return -1
end
function r4_0.CommonOnEMActorDestroy(r0_54, r1_54)
  -- line: [1149, 1162] id: 54
end
AssembleComponents(r4_0)
if r4_0.TickComponent then
  AMonsterCharacter.SetHasLuaComponentTick(true)
end
return r4_0
