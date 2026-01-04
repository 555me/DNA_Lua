-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Char\BP_CharacterBase_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("BluePrints.Combat.BattleLogic.EffectResults")
local r1_0 = require("EMCache.EMCache")
local r2_0 = require("Utils.TimeUtils")
local r3_0 = require("BluePrints.Story.StoryPlayableUtils").StoryPlayableUtils
local r4_0 = require("BluePrints.UI.GMInterface.GMVariable")
local r5_0 = require("Utils.MiscUtils")
local r6_0 = Class({
  "BluePrints.Combat.Components.CharacterComponent"
})
r6_0._components = {
  "BluePrints.Combat.Components.AccessoryComponent",
  "BluePrints.Combat.Components.ActorTypeComponent",
  "BluePrints.Combat.Components.CharacterBattleEventComponent",
  "BluePrints.Combat.Components.EffectCreatureComponent",
  "BluePrints.Combat.Components.PassiveEffectComponent",
  "BluePrints.Combat.Components.WeaponComponent",
  "BluePrints.Combat.Components.DestructableComponent",
  "BluePrints.Char.CharacterComponent.CharacterTagLogic.CharacterTagComponent",
  "BluePrints.Char.CharacterComponent.ChangeRoleComponent",
  "BluePrints.Char.CharacterComponent.HitLogicComponent",
  "BluePrints.Char.CharacterComponent.TagComponent",
  "BluePrints.Char.CharacterComponent.ActionLogicComponent",
  "BluePrints.Char.CharacterComponent.PhantomComponent",
  "BluePrints.Common.DelayFrameComponent",
  "BluePrints.Char.CharacterComponent.CheckOverlapAndPushComponent"
}
function r6_0.Initialize(r0_1, r1_1)
  -- line: [45, 60] id: 1
  r0_1.StartBulletJumpTime = -1
  r0_1.PrepareIntoBulletJump = -1
  r0_1.LuaTimerHandles = {}
  r0_1.LastZSpeed = 0
  r0_1.WallJumpCount = 0
  r0_1.OriginCapsuleRadius = r0_1.CapsuleComponent:GetUnscaledCapsuleRadius()
  r0_1.OriginHalfHeight = r0_1.CapsuleComponent:GetUnscaledCapsuleHalfHeight()
  r0_1.LastBipHeight = r0_1.Mesh:GetSocketTransform("Bip001", 3)
  r0_1.PlayAddtiveHitTime = 0
  r0_1.HitMontageRule = nil
  rawset(r0_1, "AutoSyncProp", r0_1.AutoSyncProp)
end
function r6_0.GetShootingTargets(r0_2)
  -- line: [66, 68] id: 2
  return r0_2.ShootingTargets
end
function r6_0.ClearShootingTargets(r0_3)
  -- line: [70, 72] id: 3
  r0_3.ShootingTargets:Clear()
end
function r6_0.ReceiveBeginPlay(r0_4)
  -- line: [80, 123] id: 4
  EventManager:AddEvent(EventID.OnBattleReady, r0_4, r0_4.OnBattleReady_TryInitCharacterInfo)
  r0_4.LuaTimerHandles = {}
end
function r6_0.OnBattleReady_TryInitCharacterInfo(r0_5, r1_5)
  -- line: [126, 130] id: 5
  if Battle(r0_5) == r1_5 then
    r0_5:TryInitCharacterInfo("Battle")
  end
end
function r6_0.GetConstAimRotLerpSpeed_Lua(r0_6)
  -- line: [211, 213] id: 6
  return Const.AimRotLerpSpeed
end
function r6_0.SetSkillCD(r0_7, r1_7, r2_7)
  -- line: [453, 459] id: 7
  if r0_7:HandleCheckSkillNodeCondition(r2_7, r1_7.SkillId, 0) and not r1_7.StopSkillCalcCD then
    r0_7:SetSkillTimestamp(r1_7.SkillId, true)
  end
end
function r6_0.IsSkillFinished(r0_8)
  -- line: [783, 785] id: 8
  return r0_8.SkillTimeLine.SkillFinish
end
function r6_0.GetDataInfo(r0_9, r1_9)
  -- line: [788, 797] id: 9
  if not r1_9 or r1_9 == 0 then
    return 
  end
  if r0_9:IsPlayer() or r0_9:IsPhantom() then
    return DataMgr.BattleChar[r1_9]
  elseif r0_9:IsAIControlled() then
    return DataMgr.BattleMonster[r1_9]
  end
end
function r6_0.GetSkillInitInfo(r0_10, r1_10)
  -- line: [799, 814] id: 10
  local r2_10 = TArray(FSkillInitInfo)
  if r1_10 then
    for r7_10, r8_10 in ipairs(r1_10) do
      local r9_10 = r8_10.SkillInfo.Level and Const.DefaultSkillLevel
      local r10_10 = r8_10.SkillInfo.Grade and Const.DefaultSkillGrade
      local r11_10 = FSkillInitInfo()
      r11_10.SkillId = r8_10.SkillId
      r11_10.SkillLevel = r9_10
      r11_10.SkillGrade = r10_10
      r2_10:Add(r11_10)
    end
    -- close: r3_10
  end
  return r2_10
end
function r6_0.GetHitMontageRule(r0_11)
  -- line: [836, 861] id: 11
  if r0_11.HitMontageRule then
    return r0_11.HitMontageRule
  end
  if r0_11:IsMonster() then
    local r1_11 = DataMgr.Monster[r0_11.UnitId]
    if r1_11 and r1_11.HitMontageRule then
      r0_11.HitMontageRule = DataMgr.HitMontageData[r1_11.HitMontageRule]
    end
  end
  if not r0_11.HitMontageRule then
    local r1_11 = DataMgr.Model[r0_11.ModelId]
    if r1_11 and r1_11.HitMontageRule then
      r0_11.HitMontageRule = DataMgr.HitMontageData[r1_11.HitMontageRule]
    end
  end
  if not r0_11.HitMontageRule then
    r0_11.HitMontageRule = DataMgr.Model[r0_11.ModelId]
  end
  return r0_11.HitMontageRule
end
function r6_0.CheckCanPart(r0_12)
  -- line: [863, 866] id: 12
  return r0_12:IsPlayer()
end
function r6_0.StopMontage(r0_13)
  -- line: [868, 873] id: 13
  if not r0_13.EMAnimInstance then
    return 
  end
  r0_13.EMAnimInstance:Montage_Stop(Const.MontageBlendOutTime)
end
function r6_0.PlayMontageByPath(r0_14, r1_14, r2_14, r3_14, r4_14, r5_14)
  -- line: [875, 882] id: 14
  local r6_14 = LoadObject(r1_14)
  if not r6_14 then
    DebugPrint("Error: Load Montage Failed!!!", r1_14)
    return nil
  end
  return r0_14:PlayMontageByAsset(r6_14, r2_14, r3_14, r4_14, r5_14)
end
function r6_0.PlayMontageByAsset(r0_15, r1_15, r2_15, r3_15, r4_15, r5_15)
  -- line: [884, 908] id: 15
  if not r1_15 then
    return nil
  end
  if not r3_15 then
    r0_15.EMAnimInstance:Montage_Stop(Const.MontageBlendOutTime)
  end
  if r2_15 then
    r2_15(r0_15)
  end
  r0_15:SetCanExtractZVelocity()
  r0_15:ResetAllCancelTag()
  r0_15.CurrentHitMontage = r1_15
  local r6_15 = r0_15.EMAnimInstance:Montage_Play(r1_15, 1, UE4.EMontagePlayReturnType.Duration, 0, not r3_15)
  local r7_15 = r1_15
  if r4_15 then
    r0_15.EMAnimInstance:Montage_JumpToSection(r4_15, r1_15)
  end
  if r5_15 then
    r0_15:HideActorBeforeLoop(r1_15)
  end
  return r6_15, r1_15
end
function r6_0.GetHitMontageFolderAndPrefix(r0_16)
  -- line: [917, 926] id: 16
  local r2_16 = DataMgr.Model[r0_16.ModelId]
  if r2_16 ~= nil and r2_16.MontageFolder ~= nil then
    return r0_16:FormatSubFileFolderWithMount(r2_16.MontageFolder), r0_16:FormatPrefixWithMount(r2_16.MontagePrefix)
  else
    return nil, nil
  end
end
function r6_0.PressSkill1(r0_17, r1_17)
  -- line: [928, 930] id: 17
  print("use skill 1")
end
function r6_0.PressSkill2(r0_18)
  -- line: [932, 934] id: 18
  print("use skill 2")
end
function r6_0.PressSkill3(r0_19)
  -- line: [936, 938] id: 19
  print("use skill 3")
end
function r6_0.PressOpenMenu(r0_20)
  -- line: [940, 942] id: 20
  print("use OpenMenu")
end
function r6_0.SupportSkill(r0_21)
  -- line: [944, 946] id: 21
  print("use skill SupportSkill")
end
function r6_0.StartHeavyAttack(r0_22, r1_22)
  -- line: [948, 950] id: 22
  print("use heavy attack")
end
function r6_0.CallLanded(r0_23)
  -- line: [952, 954] id: 23
  r0_23:Landed()
end
function r6_0.Landed(r0_24)
  -- line: [956, 999] id: 24
  if not r0_24.EMAnimInstance then
    return 
  end
  if r0_24.EMAnimInstance.CurrentJumpState == Const.Climb then
    return 
  end
  if r0_24:CharacterInTag("Avoid") then
    return 
  end
  r0_24:ResetJumpState_Cpp()
  print(_G.LogTag, "CallLandedCallLandedCallLandedCallLanded")
  if not r0_24:CharacterInTag("Slide") and not r0_24.LuaTimerHandles.HitRepel then
    if r0_24.EMAnimInstance.FallingSpeed and r0_24.EMAnimInstance.FallingSpeed < Const.LandHeavySpeed and r0_24:SetCharacterTag("LandHeavy") then
      r0_24:AddTimer_Combat(DataMgr.PlayerRotationRates.LandHeavyTime.ParamentValue[1], r0_24.SetCharacterTagIdle, false, 0, "LandHeavy")
      r0_24.EMAnimInstance.FallingSpeed = 0
    end
    if not r0_24:CharacterInTag("Shooting") and not r0_24:CharacterInTag("Idle") and not r0_24:CharacterInTag("LandHeavy") then
      r0_24:SetCharacterTagIdle()
    end
  end
  r0_24.JumpCount = 0
  r0_24.BulletJumpCount = 0
  r0_24.AutoSyncProp.IsBulletJumping = false
  r0_24.ImpendingSetted = false
  local r1_24 = r0_24:K2_EMGetActorRotation()
  r0_24:K2_EMSetActorRotation({
    Yaw = r1_24.Yaw,
    Pitch = 0,
    Roll = r1_24.Roll,
  })
  r0_24.bBulletJumpRotation = false
  r0_24.BulletJumpRotation = nil
  r0_24.LastZSpeed = nil
  if r0_24:IsPlayer() or r0_24:IsPhantom() then
    r0_24:ChangeOrientControll()
  end
end
function r6_0.HasMoveInput(r0_25)
  -- line: [1001, 1003] id: 25
  return r0_25.IsMoveInput
end
function r6_0.SetDeathInfo(r0_26, r1_26)
  -- line: [1024, 1034] id: 26
  if r1_26 and r1_26.IsRealDead then
    r0_26:SetDead(true)
  else
    r0_26:SetDead(false)
  end
  if r1_26 and r1_26.RecoveryCount then
    r0_26:SetRecoveryCount(r1_26.RecoveryCount)
  end
end
function r6_0.CheckCanRecovery(r0_27)
  -- line: [1037, 1044] id: 27
  local r1_27 = UE4.UGameplayStatics.GetGameMode(r0_27)
  if not r1_27 then
    return true
  end
  return r1_27:CheckEntityCanRecover(r0_27)
end
function r6_0.ServerRecoverOther_Impl(r0_28, r1_28, r2_28, r3_28, r4_28)
  -- line: [1046, 1048] id: 28
  Battle(r0_28):RecoverOther(r0_28.Eid, r1_28, r2_28, {
    Speed = r3_28,
  }, r4_28)
end
function r6_0.GetRemainRecoveryTimes(r0_29)
  -- line: [1052, 1060] id: 29
  local r1_29 = r0_29:GetRecoveryMaxCount()
  local r2_29 = r0_29:GetRecoveryCount()
  if r1_29 and r2_29 then
    return r1_29 - r2_29
  end
  return 0
end
function r6_0.CheckHaveDyingCountDown(r0_30)
  -- line: [1063, 1070] id: 30
  if r0_30:IsPlayer() and not IsStandAlone(r0_30) then
    return true
  elseif r0_30:IsPhantom() and r0_30.IsHostage == true then
    return true
  end
  return false
end
function r6_0.Recovery(r0_31, r1_31)
  -- line: [1076, 1096] id: 31
  if IsAuthority(r0_31) then
    if r0_31:IsDead() then
      r0_31:SetDead(false, 0, 0, 0)
      if not r1_31 then
        r0_31:SetAttr("Hp", r0_31:GetAttr("MaxHp"))
        r0_31:CalcHpPercent()
        r0_31:SetAttr("ES", r0_31:GetAttr("MaxES"))
        r0_31:SetAttr("Sp", r0_31:GetAttr("InitSp"))
        r0_31:RecoveryPassiveEffects()
      end
    end
  else
    r0_31:SetDead(false, 0, 0, 0)
  end
  r0_31:CommonRecoveryImpl()
  EventManager:FireEvent(EventID.CharRecover, r0_31.Eid)
  Battle(r0_31):TriggerBattleEvent(BattleEventName.OnRecover, r0_31)
  r0_31.Overridden.Recovery(r0_31)
end
function r6_0.QuickRecovery(r0_32, r1_32)
  -- line: [1098, 1104] id: 32
  if not r0_32:IsDead() then
    return 
  end
  r0_32.Super.Recovery(r0_32, r1_32)
  r0_32.EMAnimInstance:Montage_Stop(0)
  r0_32:SetCharacterTag("Recovery")
  r0_32:SetCharacterTag("Idle")
end
function r6_0.CommonRecoveryImpl(r0_33)
  -- line: [1107, 1130] id: 33
  r0_33.AlreadyDead = false
  if r0_33:IsPlayer() or r0_33:IsPhantom() then
    r0_33:TryLeaveDying()
    local r1_33 = r0_33.CharacterFashion
    if r1_33 then
      r0_33:InitAppearanceSuit(r1_33.AppearanceSuitInfo)
      local r2_33 = DataMgr.Model[r0_33.ModelId].AdditionalFXID
      if r2_33 then
        r1_33.NiagaraGroup:Clear()
        for r7_33, r8_33 in pairs(r2_33) do
          r1_33.NiagaraGroup:Add(r8_33, r0_33.FXComponent:PlayEffectByID(r8_33))
        end
        -- close: r3_33
        r1_33:InitColorsWithInfo()
      end
    end
    if r5_0.IsAutonomousProxy(r0_33) or IsStandAlone(r0_33) then
      r0_33.DodgeCount = 0
    end
  end
end
function r6_0.SetHitDurationTime(r0_34, r1_34, r2_34)
  -- line: [1134, 1143] id: 34
  if not r2_34 then
    return 
  end
  if r0_34.LuaTimerHandles[r1_34] ~= nil then
    r0_34:RemoveTimer(r0_34.LuaTimerHandles[r1_34])
    r0_34.LuaTimerHandles[r1_34] = nil
  end
  r0_34.LuaTimerHandles[r1_34] = r0_34:AddTimer_Combat(r2_34, r0_34.SetCharacterTagIdle)
end
function r6_0.PlayHitMontage(r0_35, r1_35, r2_35, r3_35, r4_35)
  -- line: [1146, 1152] id: 35
  local r5_35, r6_35 = r0_35:GetHitMontageFolderAndPrefix()
  if r5_35 ~= nil then
    return r0_35:PlayMontageByPath(r5_35 .. "Combat/Hit/" .. r6_35 .. r1_35 .. Const.MontageSuffix .. "." .. r6_35 .. r1_35 .. Const.MontageSuffix, r2_35, r3_35, r4_35)
  end
end
function r6_0.CheckHitMontage(r0_36, r1_36)
  -- line: [1154, 1161] id: 36
  local r2_36, r3_36 = r0_36:GetHitMontageFolderAndPrefix()
  if r2_36 ~= nil then
    return UResourceLibrary.CheckResourceExistOnDisk(r2_36 .. "Combat/Hit/" .. r3_36 .. r1_36 .. Const.MontageSuffix)
  end
  return false
end
function r6_0.GetHitFlyCD(r0_37)
  -- line: [1163, 1169] id: 37
  if r0_37:IsPlayer() then
    return DataMgr.PlayerRotationRates.HitFlyCD.ParamentValue[1]
  else
    return Const.DefaultCD
  end
end
function r6_0.GetHitRepelCD(r0_38)
  -- line: [1171, 1177] id: 38
  if r0_38:IsPlayer() then
    return DataMgr.PlayerRotationRates.HitRepelCD.ParamentValue[1]
  else
    return Const.DefaultCD
  end
end
function r6_0.GetHeavyHitCD(r0_39)
  -- line: [1179, 1185] id: 39
  if r0_39:IsPlayer() then
    return DataMgr.PlayerRotationRates.HeavyHitCD.ParamentValue[1]
  else
    return Const.DefaultCD
  end
end
function r6_0.GetBoneHitCD(r0_40)
  -- line: [1187, 1193] id: 40
  if r0_40:IsPlayer() then
    return DataMgr.PlayerRotationRates.BoneHitCD.ParamentValue[1]
  else
    return Const.DefaultCD
  end
end
function r6_0.GetCauseHitData(r0_41, r1_41, r2_41)
  -- line: [1196, 1208] id: 41
  local r3_41 = DataMgr.HitPerformanceData[r1_41]
  if not r3_41 then
    return nil
  end
  if r2_41 == UE4.ECauseHitType.CauseHitTypeDie then
    return r3_41.CauseDieParam
  elseif r2_41 == UE4.ECauseHitType.CauseHitTypeFirst then
    return r3_41.FirstHitParam
  elseif r2_41 == UE4.ECauseHitType.CauseHitTypeNormal then
    return r3_41.CauseHitParam
  end
end
function r6_0.ApplyGrabHitGetup(r0_42)
  -- line: [1211, 1215] id: 42
  if r0_42:CharacterInTag("GrabHit") then
    r0_42:SetCharactertagIdle()
  end
end
function r6_0.HitFlyDownRestore(r0_43)
  -- line: [1217, 1228] id: 43
  if not r0_43:IsPlayer() and r0_43:CharacterInTag("HitFly") then
    r0_43:SetCharacterTagIdle()
  end
  if r0_43.LuaTimerHandles.HitFlyDown ~= nil then
    r0_43:RemoveTimer(r0_43.LuaTimerHandles.HitFlyDown)
    r0_43.LuaTimerHandles.HitFlyDown = nil
  end
end
function r6_0.CheckBuffCanEnterIdleTag(r0_44, r1_44)
  -- line: [1230, 1235] id: 44
  if not r0_44.EMAnimInstance or not r0_44.EMAnimInstance.CheckCanEnterIdleTag then
    return false
  end
  return r0_44.EMAnimInstance:CheckCanEnterIdleTag(r1_44)
end
function r6_0.SetIdleTag(r0_45, r1_45)
  -- line: [1237, 1242] id: 45
  if not r0_45.EMAnimInstance and not r0_45.EMAnimInstance.SetIdleTag then
    return 
  end
  r0_45.EMAnimInstance:SetIdleTag(r1_45)
end
function r6_0.GetIdleTag(r0_46)
  -- line: [1244, 1250] id: 46
  local r1_46 = r0_46.EMAnimInstance
  if not r1_46 or not r1_46.IdleTag then
    return 
  end
  return r1_46.IdleTag
end
function r6_0.SetArmoryTag(r0_47, r1_47, r2_47, r3_47)
  -- line: [1252, 1288] id: 47
  local r4_47 = Const.ArmoryIdleTags[r1_47]
  r0_47.LastArmoryTag = r0_47.ArmoryTag
  r0_47.ArmoryTag = r1_47
  if r0_47.UsingWeapon and r1_47 == "None" then
    r0_47.UsingWeapon:SetWeaponTypeChanged(false)
  end
  if r1_47 and not r4_47 then
    local r5_47 = r0_47.UsingWeapon
    local r6_47 = Const.ArmoryWeaponIdleTags[r1_47]
    if r6_47 then
      r0_47:ChangeUsingWeaponByType(Const.ArmoryWeaponIdleTag2WeaponType[r6_47])
    else
      r0_47:ChangeUsingWeaponByType(r1_47)
    end
    print(_G.LogTag, "SetArmoryTag", r1_47, r0_47.UsingWeapon)
    if r5_47 ~= r0_47.UsingWeapon then
      r0_47.UsingWeapon:SetWeaponTypeChanged(true)
      r0_47:BindWeaponToHand()
    end
  else
    if not r2_47 then
      r0_47:ChangeUsingWeaponByType(nil)
    end
    r0_47:UnBindWeaponFromHand()
  end
  r0_47.IsEnterArmory = r1_47
  if r0_47.PlayerAnimInstance then
    r0_47.PlayerAnimInstance.IsEnterArmory = r1_47
    r0_47.PlayerAnimInstance:EnterArmoryIdle()
  end
  if r0_47.IsEnterArmory ~= "None" then
    r0_47:SetArmoryIdleTag(r3_47)
  else
    r0_47:StopArmoryIdle()
  end
end
function r6_0.PlayShowIdleMontage(r0_48, r1_48, r2_48)
  -- line: [1289, 1300] id: 48
  local r5_48 = DataMgr.Model[r0_48.ModelId].MontageFolder .. "Armory/" .. r0_48:FormatPrefixWithMount(DataMgr.Model[r0_48.ModelId].MontagePrefix) .. r1_48 .. "_Show_Montage"
  print(_G.LogTag, "PlayShowIdleMontage", r5_48)
  r0_48:PlayMontageByPath(r5_48, nil, nil, nil, r2_48)
end
function r6_0.StopArmoryIdle(r0_49)
  -- line: [1302, 1308] id: 49
  r0_49:ShouldEnableHandIk()
  if r0_49.EMAnimInstance then
    r0_49.EMAnimInstance:Montage_StopSlotByName(0, "ArmoryIdle")
  end
end
function r6_0.GetUsingWeaponType(r0_50, r1_50)
  -- line: [1310, 1315] id: 50
  if not r0_50[(r1_50 .. "Weapon")] then
    return Const.ArmoryIdleTags.None
  end
  return r0_50[r1_50 .. "Weapon"]:GetWeaponType()
end
function r6_0.CharacterHasAnyTag(r0_51, r1_51)
  -- line: [1370, 1381] id: 51
  local r3_51 = r0_51:GetSkill(r0_51:GetSkillByType(UE.ESkillType.Shooting))
  if not r3_51 then
    return 
  end
  local r4_51 = r3_51.Weapon
  if not r4_51 then
    return 
  end
  return r4_51:CheckWeaponState(r1_51)
end
function r6_0.ShouldResetJump(r0_52, r1_52)
  -- line: [1383, 1385] id: 52
  local r2_52 = nil	-- notice: implicit variable refs by block#[4]
  if r1_52 ~= "HitFly" then
    r2_52 = r1_52 == "HeavyHit"
  else
    goto label_5	-- block#3 is visited secondly
  end
  return r2_52
end
function r6_0.ResetJumpState(r0_53, r1_53)
  -- line: [1387, 1392] id: 53
  if not r1_53 then
    r0_53.JumpCount = 0
  end
  r0_53:SetCurrentJumpState(Const.NormalState)
end
function r6_0.EnterStunFloatTag(r0_54)
  -- line: [1489, 1492] id: 54
  r0_54:SetRagdollFloating(true)
end
function r6_0.LeaveStunFloatTag(r0_55)
  -- line: [1494, 1497] id: 55
  r0_55:SetRagdollFloating(false)
end
function r6_0.MonsterCommonLeaveTag(r0_56)
  -- line: [1499, 1500] id: 56
end
function r6_0.UpdateBillboardComp_BuffSpecialEffect(r0_57, r1_57, r2_57, r3_57)
  -- line: [1657, 1661] id: 57
  if r0_57.BillBoardComponent then
    r0_57.BillBoardComponent:BuffChange_SpecialEffect(r1_57, r2_57, r3_57)
  end
end
function r6_0.OnRealEnterDying(r0_58)
  -- line: [1680, 1698] id: 58
  if not Battle(r0_58) then
    return 
  end
  if not IsDedicatedServer(r0_58) and r0_58:IsMainPlayer() then
    r0_58:ShowPlayerDeadUI()
  end
  Battle(r0_58):TriggerBattleEvent(BattleEventName.OnTeammateCanRecovery, r0_58)
  if r0_58.IsHostage then
    local r1_58 = UGameplayStatics.GetGameMode(r0_58)
    if r1_58 then
      r1_58:TriggerDungeonComponentFun("OnHostageDying", r0_58)
    end
  end
end
function r6_0.OnRealDie(r0_59)
  -- line: [1701, 1703] id: 59
end
function r6_0.UpdateRecovererInfo(r0_60, r1_60, r2_60)
  -- line: [1705, 1720] id: 60
  r0_60.RecoverTargets = r0_60.RecoverTargets and {}
  if r2_60 <= 0 then
    r0_60.RecoverTargets[r1_60] = nil
  else
    r0_60.RecoverTargets[r1_60] = r2_60
  end
  if not next(r0_60.RecoverTargets) then
    DebugPrint("Tianyi@ 救助者: " .. r0_60.Eid .. "不再救助对象")
    r0_60.IsRecoveringOthers = false
  else
    DebugPrint("Tianyi@ 救助者: " .. r0_60.Eid .. "正在救助对象")
    r0_60.IsRecoveringOthers = true
  end
end
function r6_0.DestroyActorOnDead(r0_61, r1_61, r2_61)
  -- line: [1722, 1724] id: 61
  r0_61:DestroyActorOnDead_CPP(r1_61, r2_61)
end
function r6_0.ClearCharacterBattleInfo(r0_62, r1_62, r2_62)
  -- line: [1726, 1730] id: 62
  r0_62.BornInfo = nil
  r0_62:DestroyActorOnDead_CPP(r1_62, r2_62)
  r0_62:RemoveAllEffectCreature(r1_62)
end
function r6_0.StopFire(r0_63, r1_63, r2_63)
  -- line: [1732, 1733] id: 63
end
function r6_0.ResetIdle(r0_64)
  -- line: [1734, 1784] id: 64
  if r0_64:IsDead() then
    return 
  end
  r0_64:StopSkill(UE.ESkillStopReason.ActionCancel)
  r0_64:StopFire(false, false)
  if r0_64:IsPlayer() then
    r0_64:StopAllCurrentMove()
    r0_64:StopJump()
    r0_64:SetHoldCrouch(false)
    if r0_64:CharacterInTag("Avoid") then
      r0_64:StopDodge(true, 0)
    end
    r0_64:RemoveClearInputCache()
    r0_64:FlushPlayerPressedKeys()
    r0_64.MoveInputCache:Set(0, 0, 0)
    r0_64.MoveInput:Set(0, 0, 0)
    if r0_64:GetMovementComponent() then
      r0_64:GetMovementComponent():ConsumeInputVector()
    end
  end
  r0_64:ResetJumpState_Cpp()
  r0_64:RealStopSlide(false)
  r0_64:ResetCapSize()
  if r0_64.PlayerAnimInstance then
    r0_64.PlayerAnimInstance:ForceToIdle()
  end
  r0_64:GetMovementComponent().bForceStop = true
  r0_64:LaunchCharacter(FVector(0, 0, 0), true, true)
  if r0_64.LuaTimerHandles then
    r0_64:RemoveTimer(r0_64.LuaTimerHandles.BulletJump)
  end
  r0_64:StopInteractive()
  r0_64:SetCharacterTagIdle()
  if not r0_64.EMAnimInstance then
    return 
  end
  local r1_64 = r0_64.EMAnimInstance
  r1_64:StopSkillAnimation()
  r1_64:Montage_Stop(0)
  if r1_64.ForceToIdle then
    r1_64:ForceToIdle()
  end
  if r1_64.RootMotionMode ~= ERootMotionMode.RootMotionFromMontagesOnly then
    r1_64:SetRootMotionMode(ERootMotionMode.RootMotionFromMontagesOnly)
  end
end
function r6_0.OnTriggerFallingCallable(r0_65)
  -- line: [1786, 1806] id: 65
  r0_65:ResetIdle()
  r0_65:FinishGather()
  r0_65:HandleDestroyCreatureOnFalling()
  r0_65:HandleRemoveBuff(r0_65.Eid, 1)
  r0_65:GetGrabLogicComponent():ReleaseAllGrabTargets()
  if r0_65.CurrentSkillId then
    if r0_65:IsPlayer() then
      r0_65.bSkill1LongPress = false
      r0_65.bSkill2LongPress = false
    end
    r0_65:ClearInputCache()
  end
  r0_65:LaunchCharacter(FVector(0, 0, -100), true, true)
end
function r6_0.ResetBulletRotation(r0_66)
  -- line: [1808, 1812] id: 66
  r0_66.bBulletJumpRotation = false
  r0_66.BulletJumpRotation = nil
  r0_66.RecoverPitch = true
end
function r6_0.CheckCeilingHit(r0_67, r1_67)
  -- line: [1814, 1820] id: 67
  local r2_67 = r0_67:K2_GetActorLocation()
  return UE4.UKismetSystemLibrary.LineTraceSingle(r0_67, r2_67, r2_67 + FVector(0, 0, r1_67 + r0_67.CapsuleComponent:GetUnscaledCapsuleHalfHeight()), ETraceTypeQuery.TraceSkillCreatureBlock, false, nil, 0, FHitResult(), true)
end
function r6_0.GetFloorInfo(r0_68)
  -- line: [1823, 1827] id: 68
  local r1_68 = FFindFloorResult()
  r0_68:GetMovementComponent():K2_FindFloor(r0_68.CapsuleComponent:K2_GetComponentLocation(), r1_68)
  return r1_68
end
function r6_0.GetFloorDist(r0_69, r1_69)
  -- line: [1829, 1835] id: 69
  local r2_69 = r1_69.FloorDist
  if r1_69.bLineTrace then
    r2_69 = r1_69.LineDist
  end
  return r2_69
end
function r6_0.IsCharacterWalking(r0_70)
  -- line: [1851, 1853] id: 70
  -- notice: unreachable block#5
  local r1_70 = r0_70:GetMovementComponent():IsWalking()
  if r1_70 then
    r1_70 = r0_70:GetVelocity():Size2D()
    if r1_70 ~= 0 then
      r1_70 = r0_70:CharacterInTag("Idle") and r0_70:CharacterInTag("Name_None")
    else
      r1_70 = false
    end
  end
  return r1_70
end
function r6_0.IsCharacterIdling(r0_71)
  -- line: [1855, 1857] id: 71
  return r0_71:GetMovementComponent():IsWalking() and r0_71:GetVelocity():Size2D() == 0
end
function r6_0.IsCharacterInAirAndFalling(r0_72)
  -- line: [1871, 1886] id: 72
  local r1_72 = false
  if r0_72.JumpCount == 0 and r0_72:GetMovementComponent():IsFalling() and (r0_72:GetVelocity().Z >= 0 and r0_72:GetVelocity().Z <= Const.VectorSizeZero or r0_72:GetVelocity().Z <= 0) then
    return true
  end
  if r0_72.LastZSpeed ~= nil then
    r1_72 = r0_72.LastZSpeed * r0_72:GetVelocity().Z <= 0
    r0_72.LastZSpeed = r0_72:GetVelocity().Z
  end
  if r0_72.LastZSpeed ~= nil and r1_72 and r0_72:GetMovementComponent():IsFalling() then
    return true
  end
  return false
end
function r6_0.GetAimRotation(r0_73)
  -- line: [1932, 1934] id: 73
  return r0_73.AimingRotation
end
function r6_0.GetLittleOffset(r0_74)
  -- line: [2043, 2045] id: 74
  return Const.LittleOffset
end
function r6_0.GetAllAttaches(r0_75)
  -- line: [2127, 2142] id: 75
  local r1_75 = {}
  if r0_75.Weapons then
    for r6_75, r7_75 in pairs(r0_75.Weapons) do
      table.insert(r1_75, r7_75)
    end
    -- close: r2_75
  end
  if r0_75.GetAccessories then
    for r6_75, r7_75 in pairs(r0_75:GetAccessories()) do
      table.insert(r1_75, r7_75)
    end
    -- close: r2_75
  end
  return r1_75
end
function r6_0.OnSpawnedByMovieCaptureSequence(r0_76)
  -- line: [2172, 2181] id: 76
  r0_76.Overridden.OnSpawnedByMovieCaptureSequence(r0_76)
  if r0_76.Weapons then
    for r5_76, r6_76 in pairs(r0_76.Weapons) do
      if IsValid(r6_76) then
        r6_76:SetActorHiddenInGame(true)
      end
    end
    -- close: r1_76
  end
end
function r6_0.InitRoleInfo(r0_77)
  -- line: [2183, 2185] id: 77
end
function r6_0.CheckIfEffectHitTarget(r0_78, r1_78)
  -- line: [2330, 2345] id: 78
  if not r0_78.SkillTimeLine.CurrentSkillNode then
    return false
  end
  local r2_78 = r0_78.SkillTimeLine.CurrentSkillNode:GetEffectIDsByNotifyName(r1_78)
  for r6_78 = 1, #r2_78, 1 do
    local r7_78 = DataMgr.SkillEffects[r2_78[r6_78]]
    local r8_78 = r7_78.TargetFilter
    if r8_78 then
      r8_78 = Battle(r0_78)
      local r10_78 = r0_78
      local r11_78 = nil
      local r12_78 = DataMgr.SkillEffects[r2_78[r6_78]].TargetFilter
      local r13_78 = r7_78.AllowSkillRangeModify and false
      r8_78 = r8_78:DoTargetFilter(r10_78, r11_78, r12_78, r13_78, r7_78.AttackRangeType and "", false, 0)
    end
    if r8_78 and r8_78:Length() > 0 then
      return true
    end
  end
  return false
end
function r6_0.IsEqualCurrentWeaponAttribute(r0_79)
  -- line: [2347, 2352] id: 79
  if r0_79:GetCurrentWeapon() == nil then
    return false
  end
  return r0_79:GetAttr("Attribute") == r0_79:GetCurrentWeapon():GetAttr("Attribute")
end
function r6_0.DestroyPlayer(r0_80)
  -- line: [2374, 2376] id: 80
  r0_80:K2_DestroyActor()
end
function r6_0.GetBattleCharBodyType(r0_81)
  -- line: [2379, 2409] id: 81
  local r1_81 = "Girl"
  if not r0_81.CurrentRoleId then
    LogError("GetBattleCharBodyType: CurrentRoleId is nil")
    return r1_81
  end
  local r2_81 = DataMgr.BattleChar[r0_81.CurrentRoleId]
  if not r2_81 then
    LogError("GetBattleCharBodyType: No BattleChar found for ID", r0_81.CurrentRoleId)
    return r1_81
  end
  local r3_81 = r2_81.BattleCharTag
  if r3_81 then
    local r4_81 = {
      "Girl",
      "Boy",
      "Loli",
      "Woman",
      "Man"
    }
    for r9_81, r10_81 in ipairs(r3_81) do
      for r15_81, r16_81 in ipairs(r4_81) do
        if r10_81 == r16_81 then
          return r16_81
        end
      end
      -- close: r11_81
    end
    -- close: r5_81
  end
  return r1_81
end
function r6_0.SetCollisionType_Lua(r0_82, r1_82, r2_82, r3_82, r4_82)
  -- line: [2431, 2436] id: 82
  if r4_82 then
    r0_82[r1_82]:SetCollisionResponseToAllChannels(ECollisionResponse.ECR_Ignore)
  end
  r0_82[r1_82]:SetCollisionResponseToChannel(r2_82, r3_82)
end
function r6_0.HandleStuck(r0_83, r1_83)
  -- line: [2438, 2442] id: 83
  r0_83:K2_SetActorLocation(r0_83:K2_GetActorLocation() + FVector(r1_83.Normal.X, r1_83.Normal.Y, r1_83.Normal.Z) * r1_83.PenetrationDepth, false, nil, false)
end
function r6_0.AddInteractiveTrigger(r0_84)
  -- line: [2448, 2457] id: 84
  if r0_84.InteractiveTriggerComponent == nil then
    r0_84.InteractiveTriggerComponent = r0_84:AddComponentByClass(LoadClass("/Game/BluePrints/Story/Interactive/Base/BP_InteractiveTriggerComponent.BP_InteractiveTriggerComponent"), false, FTransform(), false)
    r0_84.InteractiveTriggerComponent:InitOnPlayerPossessed()
    if r0_84.bForbidInteractiveTrigger then
      r0_84.InteractiveTriggerComponent:SetIsCanTrigger(false)
    end
  end
end
function r6_0.GetHeadWidgetComponent(r0_85)
  -- line: [2459, 2461] id: 85
  return r0_85.HeadWidgetComponent
end
function r6_0.InitHeadWidgetComponent(r0_86)
  -- line: [2464, 2472] id: 86
  if r0_86.HeadWidgetComponent then
    return 
  end
  local r1_86 = UNpcHeadUISubsystem.GetHeadUISubsystem(r0_86)
  if not r1_86 then
    return 
  end
  r0_86.HeadWidgetComponent = r1_86:InitHeadWidgetComponent(r0_86)
end
function r6_0.EnableHeadWidget(r0_87, r1_87, r2_87, ...)
  -- line: [2474, 2488] id: 87
  if r2_87 then
    r0_87:InitHeadWidgetComponent()
  end
  if r0_87.HeadWidgetComponent then
    if r2_87 then
      if r0_87.HeadWidgetComponent:NeedForceInit() then
        r0_87.HeadWidgetComponent:AdjustSelfTransform()
      end
      r0_87.HeadWidgetComponent:EnableWidget(r1_87, ...)
    else
      r0_87.HeadWidgetComponent:DisableWidget(r1_87, ...)
    end
  end
end
function r6_0.SetPlayerMaxMovingSpeed(r0_88, r1_88)
  -- line: [2490, 2502] id: 88
  if r1_88 < 0 then
    r1_88 = 0
  end
  if IsAuthority(r0_88) then
    r0_88.SpeedRate = r1_88
  end
  r0_88:SetWalkSpeed()
end
function r6_0.RecoverPlayerMovingSpeed(r0_89)
  -- line: [2504, 2513] id: 89
  if IsAuthority(r0_89) then
    r0_89.SpeedRate = 1
  end
  r0_89:SetWalkSpeed()
end
function r6_0.GetMoveRate(r0_90)
  -- line: [2515, 2517] id: 90
  return r0_90.PlayerSlideAtttirbute.NormalWalkSpeed / DataMgr.PlayerRotationRates.NormalWalkSpeed.ParamentValue[1]
end
function r6_0.GetMovingSpeed(r0_91)
  -- line: [2519, 2521] id: 91
  return r0_91.PlayerSlideAtttirbute.NormalWalkSpeed, r0_91.PlayerSlideAtttirbute.CrouchWalkSpeed
end
function r6_0.SetMaxMovingSpeedByInfo(r0_92, r1_92)
  -- line: [2530, 2534] id: 92
  r0_92.PlayerSlideAtttirbute.NormalWalkSpeed = r1_92.NormalWalk
  r0_92.PlayerSlideAtttirbute.CrouchWalkSpeed = r1_92.CrouchWalk
  r0_92:SetWalkSpeed()
end
function r6_0.GetMaxMovingSpeedInfo(r0_93)
  -- line: [2536, 2541] id: 93
  return {
    NormalWalk = r0_93.PlayerSlideAtttirbute.NormalWalkSpeed,
    CrouchWalk = r0_93.PlayerSlideAtttirbute.CrouchWalkSpeed,
  }
end
function r6_0.IsSeating(r0_94)
  -- line: [2580, 2582] id: 94
  return r0_94:GetCharacterTag() == "Seating"
end
function r6_0.TestEnterTag(r0_95, r1_95)
  -- line: [2584, 2586] id: 95
  DebugPrint(r0_95.Eid .. " Enter Tag " .. r1_95)
end
function r6_0.TestLeaveTag(r0_96, r1_96)
  -- line: [2588, 2590] id: 96
  DebugPrint(r0_96.Eid .. " Enter Tag " .. r1_96)
end
function r6_0.HandleCheckSkillNodeCondition(r0_97, r1_97, r2_97, r3_97)
  -- line: [2592, 2613] id: 97
  if r1_97 == ESkillNodeCondRetCode.Success then
    return true
  end
  if r1_97 == ESkillNodeCondRetCode.OutOfBullet then
    if r0_97:IsMainPlayer() then
      local r4_97 = DataMgr.SkillNode[r3_97]
      if r4_97 and not r0_97.RangedWeapon:IsAllBulletEnough(r4_97.CostBullet) then
        EventManager:FireEvent(EventID.OutOfBullet)
      end
    end
    r0_97.RangedWeapon:SetWeaponState("NoBullet", true)
  elseif r1_97 == ESkillNodeCondRetCode.OutOfSp and r0_97:IsMainPlayer() then
    UIManager(r0_97):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, "UI_TIP_MP")
  elseif r1_97 == ESkillNodeCondRetCode.OverHeat then
    r0_97.RangedWeapon:SetWeaponState("OverHeat", true)
  end
  return false
end
function r6_0.ApplyEnterTag_Lua(r0_98, r1_98)
  -- line: [2619, 2622] id: 98
  return r0_98:ApplyEnterCharacterTag(r1_98)
end
function r6_0.ApplyLeaveTag_Lua(r0_99, r1_99, r2_99)
  -- line: [2624, 2627] id: 99
  return r0_99:ApplyLeaveCharacterTag(r1_99, r2_99)
end
function r6_0.CanLeaveTag_Lua(r0_100, r1_100)
  -- line: [2629, 2631] id: 100
  return r0_100:CanLeaveCharacterTag(r1_100)
end
function r6_0.EnableTeleport_Lua(r0_101, r1_101)
  -- line: [2633, 2653] id: 101
  local r2_101 = UGameplayStatics.GetPlayerCharacter(r0_101, 0)
  if ((r2_101 and r2_101.PlayerState)).ActivatedDungeonDeliveryPointId == -1 then
    return false
  end
  local r4_101 = r2_101:GetCharacterTag()
  if r4_101 == "Hook" or r4_101 == "HitFly" then
    if r1_101 == false then
      EventManager:FireEvent(EventID.OnTeleportReady, true)
      DebugPrint("ayff test  : stop teleport due to tag ", r4_101)
    elseif r1_101 == true then
      EventManager:FireEvent(EventID.OnTeleportReady, false)
      DebugPrint("ayff test  : enable teleport due to tag ", r4_101)
    end
  end
  return false
end
function r6_0.RotateOffset(r0_102, r1_102, r2_102, r3_102, r4_102)
  -- line: [2658, 2716] id: 102
  if r0_102.EMAnimInstance == nil and r0_102.NpcAnimInstance == nil then
    r3_0:ExecuteStoryDelegate(r2_102)
    return 
  end
  if r0_102.EMAnimInstance then
    if not r0_102.EMAnimInstance:CanTurnInPlace() or math.abs(r1_102) < 10 then
      r3_0:ExecuteStoryDelegate(r2_102)
    else
      function r0_102.OnStoryActionFinished()
        -- line: [2668, 2673] id: 103
        if r0_102.OnStoryActionFinished then
          r3_0:ExecuteStoryDelegate(r2_102)
        end
        r0_102.OnStoryActionFinished = nil
      end
      r0_102:TurnByMotionWarping(r1_102, function()
        -- line: [2674, 2676] id: 104
        r3_0:ExecuteStoryDelegate(r2_102)
      end, r3_102)
    end
  end
  if r0_102.NpcAnimInstance then
    if r3_102 and r3_102 ~= "None" then
      local r7_102 = DataMgr.Model[r0_102:GetCharModelComponent():GetCurrentModelId()].MontageFolder and ""
      local r8_102 = r6_102.MontagePrefix and ""
      r3_102 = r7_102 .. "Locomotion/" .. r8_102 .. r3_102 .. "_Montage." .. r8_102 .. r3_102 .. "_Montage"
    end
    if not r0_102.NpcAnimInstance:CanTurnInPlace() or math.abs(r1_102) < 10 then
      r3_0:ExecuteStoryDelegate(r2_102)
    else
      r0_102.NpcAnimInstance:ChangeTurnState(true)
      if not r0_102:GetMovementComponent():IsComponentTickEnabled() then
        r0_102:SetNpcMovementTickEnable(true)
      end
      if r0_102:GetMovementComponent() and r0_102:GetMovementComponent().LockMovementMode then
        r0_102:GetMovementComponent():LockMovementMode(true, EMovementMode.MOVE_Walking)
      end
      function r0_102.OnStoryActionFinished()
        -- line: [2705, 2710] id: 105
        if r0_102.OnStoryActionFinished then
          r3_0:ExecuteStoryDelegate(r2_102)
        end
        r0_102.OnStoryActionFinished = nil
      end
      r0_102:TurnByMotionWarping(r1_102, function()
        -- line: [2711, 2713] id: 106
        r3_0:ExecuteStoryDelegate(r2_102)
      end, nil, r3_102, r4_102)
    end
  end
end
function r6_0.PlayTalkAction(r0_107, r1_107, r2_107, r3_107, r4_107, r5_107, r6_107)
  -- line: [2718, 2838] id: 107
  if type(r2_107) == "userdata" then
    assert(r2_107.Execute ~= nil)
  end
  local r7_107 = DataMgr.TalkAction[r1_107]
  if r7_107 == nil then
    Utils.ScreenPrint("ActionId 不存在:" .. tostring(r1_107))
    r3_0:ExecuteStoryDelegate(r2_107)
    return 0
  end
  r0_107.MontagesProxy = r0_107.MontagesProxy and {}
  r0_107.ActionGroupProxy = r0_107.ActionGroupProxy and {}
  local r8_107 = {}
  if r7_107.ActionMontage then
    local r9_107 = r0_107:GetTalkActionPath(r7_107.MontagePrePath, r7_107.ActionMontage)
    table.insert(r0_107.MontagesProxy, {
      Path = r9_107,
      Group = "",
      ActionId = r1_107,
    })
    table.insert(r8_107, r9_107)
  end
  if r7_107.EndLoopMontage then
    local r9_107 = r0_107:GetTalkActionPath(r7_107.MontagePrePath, r7_107.EndLoopMontage)
    table.insert(r0_107.MontagesProxy, {
      Path = r9_107,
      Group = "",
      ActionId = r1_107,
    })
    table.insert(r8_107, r9_107)
  end
  local r9_107 = 0
  local r10_107 = #r8_107
  if r5_107 then
    for r15_107, r16_107 in pairs(r8_107) do
      local r17_107 = LoadObject(r16_107)
      local r18_107 = ""
      r0_107.ActionGroupProxy[r16_107] = true
      if IsValid(r0_107.Mesh:GetAnimInstance()) and r0_107.Mesh:GetAnimInstance().GetMontageSlotGroupName then
        r18_107 = r0_107.Mesh:GetAnimInstance():GetMontageSlotGroupName(r17_107)
      end
      if r18_107 ~= "" and r0_107.ActionGroupProxy[r16_107] == true then
        DebugPrint("LHQ@@@@@PlayTalkAction:", r16_107, "MontageGroupName:", r18_107, "UnitId:", r0_107.UnitId)
        r0_107.ActionGroupProxy[r16_107] = nil
        r0_107:PlayTalkActionInternal(r7_107, r2_107, r3_107, r4_107, r6_107, r18_107)
      elseif IsValid(r3_107) and r4_107 then
        r3_107[r4_107](r3_107)
        if r0_107.ActionGroupProxy then
          r0_107.ActionGroupProxy[r16_107] = nil
        end
      else
        r3_0:ExecuteStoryDelegate(r2_107)
        if r0_107.ActionGroupProxy then
          r0_107.ActionGroupProxy[r16_107] = nil
        end
      end
    end
    -- close: r11_107
  else
    for r15_107, r16_107 in pairs(r8_107) do
      r0_107.ActionGroupProxy[r16_107] = true
      UResourceLibrary.LoadObjectAsync(r0_107, r16_107, {
        r0_107,
        function(r0_108, r1_108)
          -- line: [2787, 2831] id: 108
          local r2_108 = ""
          local r3_108 = 0
          local r4_108 = true
          if IsValid(r0_107.Mesh:GetAnimInstance()) and r0_107.Mesh:GetAnimInstance().GetMontageSlotGroupName then
            r2_108 = r0_107.Mesh:GetAnimInstance():GetMontageSlotGroupName(r1_108)
            for r9_108, r10_108 in pairs(r0_107.MontagesProxy) do
              if r10_108 and r10_108.Path ~= r16_107 and r10_108.ActionId ~= r1_107 and r10_108.Group == r2_108 then
                r4_108 = false
              end
              if r10_108 and r10_108.Path == r16_107 then
                r10_108.Group = r2_108
                r3_108 = r9_108
                r4_108 = true
              end
            end
            -- close: r5_108
          end
          r9_107 = r9_107 + 1
          if r3_108 == 0 or r4_108 == false then
            return 
          end
          if r9_107 == r10_107 then
            if r2_108 ~= "" and r0_107.ActionGroupProxy and r0_107.ActionGroupProxy[r16_107] == true then
              r0_107.ActionGroupProxy[r16_107] = nil
              DebugPrint("LHQ@@@@@PlayTalkAction:", r16_107, "MontageGroupName:", r2_108, "UnitId:", r0_107.UnitId)
              r0_107:PlayTalkActionInternal(r7_107, r2_107, r3_107, r4_107, r6_107, r2_108)
            elseif IsValid(r3_107) and r4_107 then
              r3_107[r4_107](r3_107)
              if r0_107.ActionGroupProxy then
                r0_107.ActionGroupProxy[r16_107] = nil
              end
            else
              r3_0:ExecuteStoryDelegate(r2_107)
              if r0_107.ActionGroupProxy then
                r0_107.ActionGroupProxy[r16_107] = nil
              end
            end
          end
        end
      })
      -- close: r15_107
    end
    -- close: r11_107
  end
  return 0
end
function r6_0.AsyncLoadAndPlayTalkMontage(r0_109, r1_109, r2_109, r3_109, r4_109, r5_109, r6_109, r7_109)
  -- line: [2840, 2878] id: 109
  local r8_109 = 0
  for r13_109, r14_109 in pairs(r1_109) do
    r8_109 = r8_109 + 1
  end
  -- close: r9_109
  if r8_109 < r2_109 then
    return 
  end
  local r9_109 = r1_109[r2_109]
  UResourceLibrary.LoadObjectAsync(r0_109, r9_109, {
    r0_109,
    function(r0_110, r1_110)
      -- line: [2851, 2877] id: 110
      r0_109.ActionGroupProxy[r9_109] = true
      local r2_110 = ""
      if IsValid(r0_109.Mesh:GetAnimInstance()) and r0_109.Mesh:GetAnimInstance().GetMontageSlotGroupName then
        r2_110 = r0_109.Mesh:GetAnimInstance():GetMontageSlotGroupName(r1_110)
      end
      if r2_110 ~= "" and r0_109.ActionGroupProxy and r0_109.ActionGroupProxy[r9_109] == true then
        r0_109.ActionGroupProxy[r9_109] = nil
        DebugPrint("LHQ@@@@@PlayTalkAction:", r9_109, "MontageGroupName:", r2_110, "UnitId:", r0_109.UnitId)
        r0_109:PlayTalkActionInternal(r3_109, r4_109, r5_109, r6_109, r7_109, r2_110)
      elseif IsValid(r5_109) and r6_109 then
        r5_109[r6_109](r5_109)
        if r0_109.ActionGroupProxy then
          r0_109.ActionGroupProxy[r9_109] = nil
        end
      else
        r3_0:ExecuteStoryDelegate(r4_109)
        if r0_109.ActionGroupProxy then
          r0_109.ActionGroupProxy[r9_109] = nil
        end
      end
      r0_109:AsyncLoadAndPlayTalkMontage(r1_109, r2_109 + 1, r3_109, r4_109, r5_109, r6_109, r7_109)
    end
  })
end
function r6_0.PlayTalkActionInternal(r0_111, r1_111, r2_111, r3_111, r4_111, r5_111, r6_111)
  -- line: [2880, 2938] id: 111
  if r1_111 == nil then
    Utils.ScreenPrint("TalkActionData 不存在")
    if IsValid(r3_111) and r4_111 then
      r3_111[r4_111](r3_111)
    else
      r3_0:ExecuteStoryDelegate(r2_111)
    end
    return 
  end
  local r7_111 = r1_111.BlendInTime and 0.5
  if r5_111 then
    r7_111 = 0
  end
  if r6_111 == Const.TalkActionMontageGroupName then
    r0_111.CurrentTalkGroupMontageName = r1_111.AnimationId
  end
  local r8_111 = r1_111.BlendOutTime and 0.5
  local r9_111 = r1_111.MontagePrePath and ""
  if r1_111.EndLoopMontage then
    r0_111:PlayTalkMontage(r1_111.ActionMontage, r7_111, r8_111, r1_111.MontageSection, function()
      -- line: [2904, 2907] id: 112
      r0_111:PlayTalkMontage(r1_111.EndLoopMontage, 0, r8_111, r1_111.EndLoopMontageSection, nil, nil, r1_111.bUseIK, r9_111, r6_111)
    end, function()
      -- line: [2908, 2910] id: 113
      r0_111.CurrentTalkGroupMontageName = nil
    end, r1_111.bUseIK, r9_111, r6_111)
    if IsValid(r3_111) and r4_111 then
      r3_111[r4_111](r3_111)
    else
      r3_0:ExecuteStoryDelegate(r2_111)
    end
  else
    r0_111:PlayTalkMontage(r1_111.ActionMontage, r7_111, r8_111, r1_111.MontageSection, nil, function()
      -- line: [2919, 2927] id: 114
      if r1_111.IsSpecialAnim then
        if IsValid(r3_111) and r4_111 then
          r3_111[r4_111](r3_111)
        else
          r3_0:ExecuteStoryDelegate(r2_111)
        end
      end
    end, r1_111.bUseIK, r9_111, r6_111)
    if r1_111.IsSpecialAnim == false then
      if IsValid(r3_111) and r4_111 then
        r3_111[r4_111](r3_111)
      else
        r3_0:ExecuteStoryDelegate(r2_111)
      end
    end
  end
end
function r6_0.StopTalkAction(r0_115, r1_115)
  -- line: [2940, 2964] id: 115
  local r2_115 = DataMgr.TalkAction[r1_115]
  if r2_115 == nil then
    return 
  end
  local r3_115 = {}
  if r2_115 and r2_115.ActionMontage then
    table.insert(r3_115, r0_115:GetTalkActionPath(r2_115.MontagePrePath, r2_115.ActionMontage))
  end
  if r2_115 and r2_115.EndLoopMontage then
    table.insert(r3_115, r0_115:GetTalkActionPath(r2_115.MontagePrePath, r2_115.EndLoopMontage))
  end
  for r8_115, r9_115 in pairs(r3_115) do
    if r0_115.ActionGroupProxy and r0_115.ActionGroupProxy[r9_115] then
      r0_115.ActionGroupProxy[r9_115] = nil
    end
    local r10_115 = LoadObject(r9_115)
    if IsValid(r0_115.Mesh:GetAnimInstance()) and r0_115.Mesh:GetAnimInstance().GetMontageSlotGroupName then
      r0_115.Mesh:GetAnimInstance():Montage_StopGroupByName(0, r0_115.Mesh:GetAnimInstance():GetMontageSlotGroupName(r10_115))
    end
  end
  -- close: r4_115
end
function r6_0.StopAllTalkAction(r0_116)
  -- line: [2966, 2973] id: 116
  r0_116.ActionGroupProxy = nil
  if IsValid(r0_116.Mesh:GetAnimInstance()) then
    r0_116.Mesh:GetAnimInstance():Montage_StopGroupByName(0, "TalkGroup")
    r0_116.Mesh:GetAnimInstance():Montage_StopGroupByName(0, "HeadGroup")
    r0_116.Mesh:GetAnimInstance():Montage_StopGroupByName(0, "DefaultGroup")
  end
end
function r6_0.PlayTalkMontage(r0_117, r1_117, r2_117, r3_117, r4_117, r5_117, r6_117, r7_117, r8_117, r9_117)
  -- line: [2975, 3011] id: 117
  local r10_117 = r0_117:GetTalkActionPath(r8_117, r1_117)
  local r11_117 = LoadObject(r10_117)
  if r11_117 == nil then
    Utils.ScreenPrint("蒙太奇路径不存在" .. r10_117 .. "NPC:", r0_117:GetName() .. "UnitId:", r0_117.UnitId)
    if r6_117 then
      r6_117()
    end
    return 
  end
  if r0_117:IsNPC() then
    if r9_117 == "TalkGroup" then
      r0_117:ResetDynamicsWithCurrentMontageSection(r1_117, r4_117)
      r0_117.CurrentAnimationMontageSectionName = r1_117
    end
    r0_117:SwitchEnableAnimInstanceIK(not r7_117)
  else
    r0_117:SwitchEnableAnimInstanceIK(r7_117)
  end
  UTalkFunctionLibrary.SetMontageBlendInTime(r11_117, r2_117)
  UTalkFunctionLibrary.SetMontageBlendOutTime(r11_117, r3_117)
  r5_0.PlayMontageBySkeletaMesh(r0_117, r0_117.Mesh, r11_117, {
    StartSec = r4_117,
    OnBlendOut = r5_117,
    OnCompleted = r6_117,
    ExcuteFnishOnlyWhenCompelete = true,
    MontageName = r1_117,
    MontageSlotGroupName = r9_117,
  })
end
function r6_0.GetTalkActionPath(r0_118, r1_118, r2_118)
  -- line: [3016, 3027] id: 118
  local r3_118 = ""
  if r2_118 == nil then
    return r3_118
  end
  local r4_118 = DataMgr.Model[r0_118.ModelId]
  if r1_118 == nil or r1_118 == "" then
    return string.format("%sInteractive/%s%s_Montage", r4_118.MontageFolder, r4_118.MontagePrefix, r2_118)
  else
    return string.format("%s%s/%s%s_Montage", r4_118.MontageFolder, r1_118, r4_118.MontagePrefix, r2_118)
  end
end
function r6_0.PlayOrStopEmoIdleMontage(r0_119, r1_119)
  -- line: [3029, 3050] id: 119
  if r1_119 then
    local r4_119 = DataMgr.Model[r0_119:GetCharModelComponent():GetCurrentModelId()].MontageFolder and ""
    local r5_119 = r0_119:FormatPrefixWithMount(r3_119.MontagePrefix and "")
    local r6_119 = r4_119 .. "Interactive/" .. r5_119 .. "Emo_Idle" .. "_Montage." .. r5_119 .. "Emo_Idle" .. "_Montage"
    if r6_119 then
      UResourceLibrary.LoadObjectAsync(r0_119, r6_119, {
        r0_119,
        function(r0_120, r1_120)
          -- line: [3038, 3042] id: 120
          r5_0.PlayMontageBySkeletaMesh(r0_119, r0_119.Mesh, r1_120, {})
        end
      })
    end
  else
    local r2_119 = r0_119.Mesh:GetAnimInstance()
    if r2_119 then
      r2_119:Montage_StopGroupByName(0.5, Const.TalkActionMontageGroupName)
    end
  end
end
function r6_0.SwitchEnableAnimInstanceIK(r0_121, r1_121)
  -- line: [3052, 3062] id: 121
  local r2_121 = r0_121.EMAnimInstance
  if r2_121 and r2_121.SwitchEnableAnimInstanceIK then
    r2_121:SwitchEnableAnimInstanceIK(r1_121)
  end
  if r0_121.NpcAnimInstance then
    r0_121.NpcAnimInstance.EnableDataFootIK = r1_121
    DebugPrint("NPC Swich foot ik ", r1_121)
  end
end
function r6_0.GetHoldInput(r0_122, r1_122)
  -- line: [3064, 3066] id: 122
  return r0_122[r1_122]
end
function r6_0.CanEnterInteractive(r0_123)
  -- line: [3069, 3083] id: 123
  if r0_123.IsInAir then
    return false
  end
  if (r0_123:CharacterInTag("Skill") or r0_123:CharacterInTag("Shooting")) and r0_123:IsSafeToCancelSkill() then
    return r0_123:CheckTagCanEnterTag("Idle", "Interactive")
  end
  if r0_123:CheckCanEnterTag("Interactive") then
    return true
  end
  return false
end
function r6_0.StartDamageCounter(r0_124)
  -- line: [3085, 3095] id: 124
  if r0_124.IsCountingDamage then
    return 
  end
  r0_124:StopDamageCounter()
  Battle(r0_124):RegisterBattleEvent(BattleEventName.Damaged, r0_124, "CountDamageValue")
  r0_124.DpsArr = {}
  r0_124.DpsVal = 0
  r0_124.TotalVal = 0
  r0_124.IsCountingDamage = true
end
function r6_0.CountDamageValue(r0_125, r1_125, r2_125, r3_125, r4_125)
  -- line: [3097, 3116] id: 125
  local r5_125 = r2_125:GetTrueValue()
  local r6_125 = os.time()
  if r0_125.FirstDamageTime then
    if r6_125 - (r0_125.LastDamageTime and r6_125) > 3 then
      ::label_16::
      r0_125.DpsVal = r5_125
      r0_125.TotalVal = r5_125
      r0_125.FirstDamageTime = r6_125
    else
      local r7_125 = r6_125 - r0_125.FirstDamageTime
      r0_125.TotalVal = r0_125.TotalVal + r5_125
      if r7_125 >= 1 then
        r0_125.DpsVal = r0_125.TotalVal / r7_125
      else
        r0_125.DpsVal = r0_125.TotalVal
      end
    end
  else
    goto label_16	-- block#4 is visited secondly
  end
  r0_125.LastDamageTime = r6_125
end
function r6_0.UpdateDamageValue(r0_126)
  -- line: [3118, 3137] id: 126
  local r1_126 = 0
  local r2_126 = os.time()
  for r6_126 = 1, #r0_126.DpsArr, 1 do
    local r7_126 = r0_126.DpsArr[r6_126]
    if r2_126 - r7_126.Time > 1 then
      r0_126.DpsVal = r0_126.DpsVal - r7_126.Value
      r1_126 = r6_126
    else
      break
    end
  end
  if r1_126 == #r0_126.DpsArr then
    r0_126.DpsArr = {}
  elseif r1_126 > 0 then
    r0_126.DpsArr = table.slice(r0_126.DpsArr, r1_126 + 1, #r0_126.DpsArr)
  end
end
function r6_0.StopDamageCounter(r0_127)
  -- line: [3139, 3144] id: 127
  Battle(r0_127):UnregisterBattleEvent(BattleEventName.Damaged, r0_127, "CountDamageValue")
  r0_127.DpsArr = nil
  r0_127.DpsVal = nil
  r0_127.IsCountingDamage = false
end
function r6_0.GetMaxGatherTime_Lua(r0_128)
  -- line: [3146, 3148] id: 128
  return Const.GatherMaxTime
end
function r6_0.GetConstStandAloneMonsterCanCache(r0_129)
  -- line: [3151, 3153] id: 129
  return Const.StandAloneMonsterCanCache
end
function r6_0.GetConstOnlineMonsterCanCache(r0_130)
  -- line: [3155, 3157] id: 130
  return Const.OnlineMonsterCanCache
end
function r6_0.IsPhantomDispatching(r0_131, r1_131)
  -- line: [3159, 3179] id: 131
  DebugPrint("gmy@BP_PhantomCharacter_C BP_PhantomCharacter:IsPhantomDispatching", r0_131.CurrentRoleId)
  local r2_131 = GWorld:GetAvatar()
  if r2_131 then
    for r7_131, r8_131 in pairs(r2_131.Dispatches) do
      if r8_131.DispatchCharsList:Length() > 0 then
        for r13_131, r14_131 in pairs(r8_131.DispatchCharsList) do
          local r15_131 = CommonUtils.ObjId2Str(r14_131)
          local r16_131 = r0_131:GetCharIdByCharUuid(r15_131)
          DebugPrint("gmy@BP_CharacterBase_C BP_CharacterBase_C:IsPhantomDispatching Info:", r13_131, r15_131, r16_131)
          if r16_131 == r1_131 then
            return true
          end
        end
        -- close: r9_131
      end
    end
    -- close: r3_131
  end
  return false
end
function r6_0.GetCharIdByCharUuid(r0_132, r1_132)
  -- line: [3182, 3192] id: 132
  local r2_132 = GWorld:GetAvatar()
  if not r2_132 then
    return 
  end
  for r7_132, r8_132 in pairs(r2_132.Chars) do
    if CommonUtils.ObjId2Str(r8_132.Uuid) == r1_132 then
      return r8_132.CharId
    end
  end
  -- close: r3_132
end
function r6_0.OnLeaveGesture01_Idle(r0_133)
  -- line: [3194, 3221] id: 133
  local r1_133 = GWorld:GetAvatar()
  if not r1_133 then
    return 
  end
  DebugPrint("gmy@BP_CharacterBase_C BP_CharacterBase_C:OnLeaveGesture01_Idle", r1_133.IsInRegionOnline)
  local r2_133 = UGameplayStatics.GetPlayerCharacter(r0_133, 0)
  if r2_133 and r2_133.Eid ~= r0_133.Eid then
    return 
  end
  if r1_133.IsInRegionOnline then
    r1_133:RequestCancelGestureOnline(r0_133)
  end
  EventManager:FireEvent(EventID.RequestDeadRegionOnlineItem)
  local r5_133 = UGameplayStatics.GetGameState(r0_133).PlayerRegionOnlineMechanismMap:Find(CommonUtils.ObjId2Str(r1_133.Eid))
  if r5_133 then
    for r10_133, r11_133 in pairs(r5_133.Array) do
      r1_133:RequestDeadRegionOnlineItem(r1_133.CurrentOnlineType, r1_133.Eid, r11_133)
    end
    -- close: r6_133
  end
end
AssembleComponents(r6_0)
return r6_0
