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
          if r0_5.TimeCount < 10 then
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
function r4_0.TryCheckBornPosTimer(r0_7)
  -- line: [133, 165] id: 7
  -- notice: unreachable block#12
  local r1_7 = UE4.UGameplayStatics.GetGameMode(r0_7)
  if not r1_7 then
    return 
  end
  local r2_7 = r1_7:GetLevelLoader()
  if not r2_7 or not r2_7:CheckIsRougeLike() then
    return 
  end
  local r3_7 = r0_7.bInPool
  if not r3_7 then
    r3_7 = r0_7.IsDead and r0_7:IsDead() and r0_7.InitSuccess and r0_7.IsRealMonster and r0_7:IsRealMonster()
  else
    r3_7 = false
  end
  if r3_7 then
    DebugPrint(r0_7:GetName() .. " @gulinan Start CheckBornPos Timer")
    r0_7.CheckBornPosHandle = r0_7:AddTimer(1, function()
      -- line: [143, 163] id: 8
      if r0_7.bInPool or r0_7.IsDead and r0_7:IsDead() or not r0_7.InitSuccess then
        if r0_7.CheckBornPosHandle ~= nil then
          DebugPrint(r0_7:GetName() .. " @gulinan End CheckBornPosHandle Timer")
          r0_7:RemoveTimer(r0_7.CheckBornPosHandle)
          r0_7.CheckBornPosHandle = nil
        else
          DebugPrint(r0_7:GetName() .. " @gulinan CheckBornPos is nil but timer still tick")
          r0_7:RemoveTimer("CheckBornPos")
        end
      end
      local r0_8 = UE4.UGameplayStatics.GetPlayerPawn(r0_7, 0)
      local r1_8 = r0_7:K2_GetActorLocation()
      local r2_8 = r0_7.BornPos - r1_8
      local r3_8 = nil	-- notice: implicit variable refs by block#[13, 14]
      if r0_8 then
        r3_8 = r0_8:K2_GetActorLocation() - r1_8
        if not r3_8 then
          ::label_61::
          r3_8 = nil
        end
      else
        goto label_61	-- block#9 is visited secondly
      end
      if 20000 < r2_8:Size2D() and math.abs(r1_8.X) < 100 and math.abs(r1_8.Y) < 100 and (r3_8 == nil or 20000 < r3_8:Size2D()) then
        DebugPrint(r0_7:GetName() .. " @gulinan CheckBornPos Teleport To BornPos")
        r0_7:K2_SetActorLocation(r0_7.BornPos, false, nil, false)
      end
    end, true, 0, "CheckBornPos", false)
  end
end
function r4_0.CallFromCPPDelegete(r0_9, r1_9)
  -- line: [167, 169] id: 9
  DebugPrint("BP_MonsterCharacter_C:CallFromCPPDelegete", r1_9)
end
function r4_0.OnTagChange(r0_10, r1_10, r2_10, r3_10)
  -- line: [171, 182] id: 10
  if r3_10 ~= "HitFly" then
    return 
  end
  local r4_10 = r0_10.Mesh
  if r4_10 and r4_10.SkeletalMesh:GetPhysicsAsset() then
    for r10_10, r11_10 in pairs(r4_10.SkeletalMesh:GetPhysicsAsset().SkeletalBodySetups) do
      if r11_10 and r11_10.PhysicsType == EPhysicsType.PhysType_Default and r11_10.CollisionReponse ~= EBodyCollisionResponse.BodyCollision_Enabled then
        r11_10.CollisionReponse = EBodyCollisionResponse.BodyCollision_Enabled
      end
    end
    -- close: r6_10
  end
end
function r4_0.SetReplaceAttrsLua(r0_11, r1_11)
  -- line: [197, 202] id: 11
  local r2_11 = r1_11:GetLuaTable("ReplaceAttrs")
  if r2_11 then
    r0_11:SetReplaceAttrs(r2_11)
  end
end
function r4_0.TryResumeRootMotionFromPush(r0_12)
  -- line: [204, 208] id: 12
  if not r0_12.bBePushed and r0_12:GetRootMotionTagState(ESourceTags.ApplyPush) then
    r0_12:EnableRootMotion(ESourceTags.ApplyPush)
  end
end
function r4_0.TickMonsterBattleComponent(r0_13, r1_13)
  -- line: [210, 218] id: 13
  r0_13:TickComponent(r1_13)
end
function r4_0.CheckMonsterCanReachTest(r0_14)
  -- line: [220, 228] id: 14
  local r2_14 = r0_14:CheckMonsterCanReach(UE4.UGameplayStatics.GetPlayerCharacter(r0_14, 0))
  if not r2_14 then
    return 
  end
  r0_14:K2_SetActorLocation(r2_14, false, nil, false)
  print("selfCheckMonsterCanReachTest", r2_14)
end
function r4_0.GetBlueprintPath(r0_15)
  -- line: [230, 232] id: 15
  return r0_15.Data.UnitBPPath
end
function r4_0.PlayOutBattleMontage(r0_16, r1_16)
  -- line: [234, 254] id: 16
  local r3_16 = DataMgr.Model[r0_16.ModelId].BehaviorMontageGroupId
  if not r3_16 or not DataMgr.BehaviorRuleId[r3_16] then
    return 0
  end
  local r4_16 = DataMgr.BehaviorRuleId[r3_16].OutBattleList
  if not r4_16 then
    return 0
  end
  r0_16.LastOutBattleMontageIndex = r4_16[r1_16]
  if not r0_16.LastOutBattleMontageIndex then
    return 0
  end
  if not DataMgr.BehaviorMontage[r0_16.LastOutBattleMontageIndex] then
    return 0
  end
  r0_16:Montage_RepPlay(DataMgr.BehaviorMontage[r0_16.LastOutBattleMontageIndex].MontagePath)
  return r0_16.EMAnimInstance.NowMontageDuration
end
function r4_0.OnEMActorDestroy_Lua(r0_17, r1_17)
  -- line: [322, 341] id: 17
  r0_17:CommonOnEMActorDestroy(r1_17)
end
function r4_0.GetKillSourceType(r0_18, r1_18)
  -- line: [410, 422] id: 18
  local r2_18 = Battle(r0_18):GetEntity(r1_18)
  local r3_18 = nil
  if r2_18 then
    local r4_18 = r2_18:GetRootSource()
    if r4_18 and r4_18.IsPlayer and r4_18:IsPlayer() then
      r3_18 = r1_0.ActorType.Player
    elseif r4_18 and r4_18.IsCombatItemBase and r4_18:IsCombatItemBase() then
      r3_18 = r1_0.ActorType.CombatItemBase
    end
  end
  return r3_18
end
function r4_0.IsAllowedExp(r0_19)
  -- line: [541, 558] id: 19
  local r1_19 = GWorld:GetAvatar()
  if not r1_19 then
    return false
  end
  if not r1_19:IsInDungeon() then
    return true
  end
  local r2_19 = UE4.UGameplayStatics.GetGameState(r0_19)
  local r3_19 = DataMgr.Dungeon[r2_19.DungeonId]
  if not r3_19 then
    if DataMgr.HardBossDifficulty[r2_19.DungeonId] then
      return true
    end
    return false
  end
  return not r3_19.OnlyCombatReward
end
function r4_0.Recovery(r0_20, ...)
  -- line: [560, 563] id: 20
  r4_0.Super.Recovery(r0_20, ...)
  r0_20:SetCharacterTagIdle()
end
function r4_0.OnDeadAnimationEnd(r0_21)
  -- line: [565, 578] id: 21
  r0_21.Mesh:SetCollisionProfileName("Ragdoll")
  if not r0_21.IsSpawnedByMovieCaptureSequence then
    r0_21.Mesh:SetAllBodiesBelowSimulatePhysics("root", true, false)
  end
  r0_21.Mesh:SetAllBodiesPhysicsBlendWeight(1)
  r0_21:BeginRagdollState("Ragdoll", "pelvis", -1, true, 1, 0, ERagdollStateType.RagdollStateDead)
  if r0_21.DuringDyingHitFly then
    r0_21.DuringDyingHitFly = nil
  end
end
function r4_0.SetActionModeForBlackBoard(r0_22, r1_22)
  -- line: [580, 584] id: 22
  if r0_22:GetOwnBlackBoardComponent() then
    r0_22:GetOwnBlackBoardComponent():SetValueAsEnum("ActionMode", r1_22)
  end
end
function r4_0.MonsterCommonLeaveTag(r0_23)
  -- line: [586, 593] id: 23
  if not DataMgr.MonsterStateLimit[r0_23.AutoSyncProp.CharacterTag] then
    return 
  end
  if DataMgr.MonsterStateLimit[r0_23.AutoSyncProp.CharacterTag].ForbidAI == 1 then
    r0_23:ClearStopBTFlag(r0_23.AutoSyncProp.CharacterTag)
  end
end
function r4_0.TriggerFallingCallable(r0_24, r1_24)
  -- line: [595, 633] id: 24
  DebugPrint("OtherActor is Falling Dead. ActorName: ", r0_24:GetName(), ", UnitId: ", r0_24.UnitId, ", Eid: ", r0_24.Eid, ", CreatorId: ", r0_24.CreatorId, " CreatorType: ", r0_24.CreatorType, ", BornPos: ", r0_24.BornPos)
  if r0_24.IsSummonMonster and r0_24:IsSummonMonster() then
    local r2_24 = r0_24:GetDirectSource()
    if not r2_24 then
      return 
    end
    if r0_24:GetAttachParentActor() then
      return 
    end
    UNavigationFunctionLibrary.ActorToActorTeleport(r0_24, r2_24)
    r0_24:EnableCheckOverlapPush({})
    if r0_24.OnTriggerFallingCallable then
      r0_24:OnTriggerFallingCallable()
    end
    r0_24:Landed()
  elseif r0_24.IsCaptureMonster and r0_24:IsCaptureMonster() then
    local r2_24 = nil
    local r3_24 = 9999999
    for r8_24, r9_24 in pairs(r1_24:GetAllPlayer()) do
      if IsValid(r9_24) then
        local r10_24 = r9_24:GetDistanceTo(r0_24)
        if r10_24 < r3_24 then
          r3_24 = r10_24
          r2_24 = r9_24
        end
      end
    end
    -- close: r4_24
    if IsValid(r2_24) then
      UNavigationFunctionLibrary.ActorToActorTeleport(r0_24, r2_24)
    end
  elseif r0_24.IsAIControlled and r0_24:IsAIControlled() and not r0_24:IsNPC() then
    r0_24:SetIsFallTrigger()
    Battle(r1_24):BattleOnDead(r0_24.Eid, r0_24.Eid, 0, EDeathReason.TriggerFalling)
  end
end
function r4_0.TriggerWaterFallingCallable(r0_25, r1_25)
  -- line: [635, 655] id: 25
  if r0_25.IsCaptureMonster and r0_25:IsCaptureMonster() then
    local r2_25 = nil
    local r3_25 = 9999999
    for r8_25, r9_25 in pairs(r1_25:GetAllPlayer()) do
      if IsValid(r9_25) then
        local r10_25 = r9_25:GetDistanceTo(r0_25)
        if r10_25 < r3_25 then
          r3_25 = r10_25
          r2_25 = r9_25
        end
      end
    end
    -- close: r4_25
    if IsValid(r2_25) then
      UNavigationFunctionLibrary.ActorToActorTeleport(r0_25, r2_25)
    end
  elseif r0_25.IsMonster and r0_25:IsMonster() then
    r0_25:SetIsFallTrigger()
    Battle(r0_25):BattleOnDead(r0_25.Eid, r0_25.Eid, 0, EDeathReason.TriggerFalling)
  end
end
function r4_0.CheckMonsterCanReach(r0_26, r1_26, r2_26)
  -- line: [689, 716] id: 26
  if UE4.UNavigationFunctionLibrary.CheckTwoPosHasPath(r0_26:K2_GetActorLocation(), r1_26:K2_GetActorLocation(), r0_26) == Const.PathTypeHasPath then
    return nil
  end
  local r4_26 = r0_26:K2_GetActorLocation()
  local r5_26 = r1_26:K2_GetActorLocation()
  local r6_26 = 36
  local r7_26 = r0_26.CapsuleComponent:GetUnscaledCapsuleRadius() * 10
  local r8_26 = r0_26:GetActorForwardVector()
  for r12_26 = 0, 9, 1 do
    local r13_26 = UE4.UKismetMathLibrary.DegCos(r6_26 * r12_26)
    local r14_26 = UE4.UKismetMathLibrary.DegSin(r6_26 * r12_26)
    local r15_26 = FVector((r8_26.X * r13_26 + r8_26.Y * r14_26), (r8_26.Y * r13_26 - r8_26.X * r14_26), 0) * r7_26 + r4_26
    if UE4.UNavigationFunctionLibrary.CheckTwoPosHasPath(r15_26, r5_26, r0_26) == Const.PathTypeHasPath then
      return r15_26
    end
  end
  if r2_26 then
    return nil
  end
  return r1_26:K2_GetActorLocation()
end
function r4_0.SetIsFallTrigger(r0_27)
  -- line: [718, 720] id: 27
  r0_27.IsFallTrigger = true
end
function r4_0.LeaveHitFlyTag(r0_28)
  -- line: [722, 723] id: 28
end
function r4_0.GetMonsterToTargetPitch(r0_29)
  -- line: [734, 744] id: 29
  local r1_29 = r0_29.BBTarget
  if not r1_29 then
    return 0
  end
  return (r1_29:K2_GetActorLocation() - r0_29:K2_GetActorLocation()):ToRotator().Pitch
end
function r4_0.TreasureMonsterInRougLikeOnDead(r0_30)
  -- line: [798, 803] id: 30
  local r1_30 = UE4.UGameplayStatics.GetGameMode(r0_30)
  if r1_30 then
    r1_30:SpeciaMonsterOnDead(r0_30.UnitId)
  end
end
function r4_0.AddHatredTargetByWaitRecover(r0_31, r1_31)
  -- line: [887, 900] id: 31
  local r2_31 = Battle(r0_31):GetEntity(r1_31)
  if not r2_31:IsPlayer() and not r2_31:IsAIControlled() then
    return 
  end
  if not r2_31:IsDead() then
    return 
  end
  local r3_31 = r0_31:GetPresetHatredValue(r2_31, "ReasonWaitRecover")
  if r0_31.TargetHatred:Find(r1_31) then
    r0_31:RemoveHatredTarget(r1_31)
    r0_31:AddHatredTarget(r1_31, r3_31, r3_31)
  end
end
function r4_0.ListenRecoverHatredEvent(r0_32)
  -- line: [902, 904] id: 32
  EventManager:AddEvent(EventID.CharDie, r0_32, r0_32.AddHatredTargetByWaitRecover)
end
function r4_0.RemoveRecoverHatredEvent(r0_33)
  -- line: [906, 908] id: 33
  EventManager:RemoveEvent(EventID.CharDie, r0_33)
end
function r4_0.GetSplingAnim(r0_34)
  -- line: [910, 915] id: 34
  if not r0_34.IsCoverMontage then
    return 
  end
  local r1_34 = r0_34.CoverPointInfo.IsCrouch
end
function r4_0.GetCoverMontageAnimAsset(r0_35, r1_35)
  -- line: [918, 928] id: 35
  local r2_35 = DataMgr.Model[r0_35.ModelId]
  local r3_35, r4_35 = r0_35:GetHitMontageFolderAndPrefix()
  if not r3_35 then
    return nil, nil
  end
  local r5_35 = r4_35 .. r1_35
  return nil, r3_35 .. "Locomotion/" .. r5_35 .. Const.MontageSuffix .. "." .. r5_35 .. Const.MontageSuffix
end
function r4_0.IsLimitMontage(r0_36)
  -- line: [930, 933] id: 36
  return DataMgr.MonsterStateLimit[r0_36.AutoSyncProp.CharacterTag].SourceTag == Const.StunTag
end
function r4_0.PlayLimitMontage(r0_37, r1_37)
  -- line: [935, 943] id: 37
  if r0_37:IsLimitMontage() == false then
    return 
  end
  local r2_37 = r0_37:GetLimitMontagePath(r1_37)
  if r2_37 == nil then
    return 
  end
  r0_37:PlayMontageByPath(r2_37, nil, false)
end
function r4_0.StopLimitMontage(r0_38, r1_38)
  -- line: [945, 956] id: 38
  if r0_38:IsLimitMontage() == false then
    return 
  end
  local r2_38 = r0_38:GetLimitMontagePath(r1_38)
  if r2_38 == nil then
    return 
  end
  local r3_38 = LoadObject(r2_38)
  if not r3_38 then
    return 
  end
  r0_38.EMAnimInstance:Montage_Stop(Const.MontageBlendOutTime, r3_38)
end
function r4_0.GetLimitMontagePath(r0_39, r1_39)
  -- line: [958, 967] id: 39
  local r2_39, r3_39 = r0_39:GetHitMontageFolderAndPrefix()
  if r2_39 ~= nil then
    return r2_39 .. "Combat/Hit/" .. r3_39 .. r1_39 .. "_Montage"
  else
    return nil
  end
end
function r4_0.GetSkillIdBySkillType(r0_40, r1_40)
  -- line: [969, 971] id: 40
  return r1_40
end
function r4_0.GetCurrentAnimationBlueprint(r0_41, r1_41)
  -- line: [973, 978] id: 41
  if r0_41.Data and r0_41.Data.AnimCoverPath then
    return r0_41.Data.AnimCoverPath
  end
  return r4_0.Super.GetCurrentAnimationBlueprint(r0_41, r1_41)
end
function r4_0.IsContainCollapsedGraphTag(r0_42, r1_42)
  -- line: [1018, 1024] id: 42
  if r1_42 == "None" then
    return false
  end
  if r0_42:HasAnyTags_Table(r0_42, {
    r1_42
  }, false) then
    return true
  end
  return false
end
function r4_0.BlockTickLod(r0_43, r1_43, r2_43, r3_43)
  -- line: [1026, 1042] id: 43
  if r0_43.Data and r0_43.Data.DisableTicklod then
    return 
  end
  if r3_43 | ETickObjectFlag.FLAG_CHARMOVEMENTCOMPONENT then
    GWorld.logger.errorlog("@wuzhijun：BlockTickLod.处理移动组件用 BlockTickLod_MoveComp")
    return 
  end
  local r4_43 = USubsystemBlueprintLibrary.GetWorldSubsystem(r0_43, UEMSignificanceMgrSubsystem)
  if not r4_43 then
    return 
  end
  r4_43:BlockTickLod(ESignificanceTag.Monster, r1_43, r0_43, r2_43, r3_43)
end
function r4_0.BlockTickLod_BT(r0_44, r1_44, r2_44)
  -- line: [1044, 1054] id: 44
  if r0_44.Data and r0_44.Data.DisableTicklod then
    return 
  end
  local r3_44 = USubsystemBlueprintLibrary.GetWorldSubsystem(r0_44, UEMSignificanceMgrSubsystem)
  if not r3_44 then
    return 
  end
  r3_44:BlockTickLod(ESignificanceTag.MonsterBT, r1_44, r0_44:GetController(), r2_44, ETickObjectFlag.FLAG_ACTOR | ETickObjectFlag.FLAG_BTCOMPONENT)
end
function r4_0.CheckOverlapPushForChangeCollision(r0_45, r1_45, r2_45)
  -- line: [1056, 1064] id: 45
  return r0_45:EnableCheckOverlapPush({
    r0_45,
    function()
      -- line: [1057, 1061] id: 46
      if r0_45.CapsuleComponent then
        r0_45.CapsuleComponent:SetCollisionResponseToChannel(r1_45, r2_45)
      end
    end
  })
end
function r4_0.IsNeedHideInTalk(r0_47)
  -- line: [1066, 1072] id: 47
  if IsStandAlone(r0_47) then
    return GWorld.GameInstance:GetTalkContext():HasDisableMonsterSpawn()
  else
    return false
  end
end
function r4_0.OnTalkEnableMonsterSpawn(r0_48)
  -- line: [1074, 1077] id: 48
  r0_48:SetWaitInitTag(false, Const.CharWaitInitTag.HideInTalk)
  EventManager:RemoveEvent(EventID.TalkEnableMonsterSpawn, r0_48)
end
function r4_0.ReceiveEndPlay(r0_49, r1_49)
  -- line: [1079, 1110] id: 49
  EventManager:RemoveEvent(EventID.TalkEnableMonsterSpawn, r0_49)
  EventManager:RemoveEvent(EventID.CharDie, r0_49)
  GWorld.GameInstance.GlobalLockOnTargets:Remove(r0_49.Eid)
  if r0_49.BossBloodUI then
    r0_49.BossBloodUI:UnLoadSelf()
    r0_49.BossBloodUI = nil
  end
  r0_49.IsDestroied = true
  if r0_49.CheckOutAirDoorHandle ~= nil then
    DebugPrint(r0_49:GetName() .. " @gulinan Clear AirDoorBoxOutCheck Timer On Destroy")
    r0_49.RemoveTimer(r0_49.CheckOutAirDoorHandle)
    r0_49.CheckOutAirDoorHandle = nil
  end
  if r0_49.CheckServerBasedMovementTimer ~= nil then
    DebugPrint(r0_49:GetName() .. " @gulinan Clear CheckServerBasedMovementTimer Timer On Destroy")
    r0_49:RemoveTimer(r0_49.CheckServerBasedMovementTimer)
    r0_49.CheckServerBasedMovementTimer = nil
  end
  if r0_49.CheckBornPosHandle ~= nil then
    DebugPrint(r0_49:GetName() .. " @gulinan Clear CheckBornPosTimer Timer On Destroy")
    r0_49:RemoveTimer(r0_49.CheckBornPosHandle)
    r0_49.CheckBornPosHandle = nil
  end
end
function r4_0.UpdateCdAndUseSkill(r0_50, r1_50)
  -- line: [1112, 1116] id: 50
  r0_50:GetSkill(r1_50):ResetSkillCd()
  return r0_50:UseSkill(r1_50, 0)
end
function r4_0.ReuseSkill(r0_51, r1_51)
  -- line: [1118, 1131] id: 51
  local r2_51 = r0_51:GetSeqSkill(r1_51)
  if r2_51 == 0 then
    return false
  end
  local r3_51 = r0_51:GetSkill(r2_51)
  if not r3_51 then
    return false
  end
  if r3_51.SkillType == "Passive" then
    return false
  end
  r0_51:AddTimer(0.05, r0_51.UpdateCdAndUseSkill, true, 0, "ReuseSkillTimer", nil, r2_51)
end
function r4_0.CallSuperFunction(r0_52, r1_52, ...)
  -- line: [1133, 1135] id: 52
  r4_0.Super[r1_52](r0_52, ...)
end
function r4_0.OnTimeDilationChanged(r0_53, r1_53, r2_53)
  -- line: [1151, 1156] id: 53
  local r3_53 = UE4.UGameplayStatics.GetPlayerCharacter(r0_53, 0)
  if r3_53 then
    r3_53:TimeDilationPostProcess(r1_53, r2_53)
  end
end
function r4_0.SetTreasureMonsterTarget(r0_54, r1_54)
  -- line: [1158, 1160] id: 54
  r0_54:GetOwnBlackBoardComponent():SetValueAsVector("ExtractionLoc", r1_54)
end
function r4_0.GetManualItemId(r0_55)
  -- line: [1180, 1182] id: 55
  return -1
end
function r4_0.CommonOnEMActorDestroy(r0_56, r1_56)
  -- line: [1189, 1202] id: 56
end
function r4_0.AddPhantomBattleAchieve(r0_57, r1_57)
  -- line: [1205, 1222] id: 57
  if not IsStandAlone(r0_57) then
    return 
  end
  local r2_57 = UE4.URuntimeCommonFunctionLibrary.GetPlayerAchievementObject(r1_57)
  if r2_57 then
    if r0_57.UnitId == 8510001 then
      r2_57:UploadTargetValue(2203, 1)
    end
    if r0_57.UnitId == 8518001 then
      r2_57:UploadTargetValue(2204, 1)
    end
    if r0_57.UnitId == 8517001 then
      r2_57:UploadTargetValue(2205, 1)
    end
  end
end
AssembleComponents(r4_0)
if r4_0.TickComponent then
  AMonsterCharacter.SetHasLuaComponentTick(true)
end
return r4_0
