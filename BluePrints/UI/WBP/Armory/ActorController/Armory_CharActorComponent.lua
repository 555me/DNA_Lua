-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Armory\ActorController\Armory_CharActorComponent.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = FHitResult()
local r1_0 = {}
local r2_0 = {}
function r1_0.Init(r0_1, r1_1)
  -- line: [8, 12] id: 1
  r0_1.PlayerMontageTimerKeys = {}
  r0_1.PlayerFXTimerKeys = {}
  r0_1.PlayerActorHideTags = {}
end
local function r3_0(r0_2)
  -- line: [14, 16] id: 2
  return UE4.UKismetMathLibrary.MakeTransform(r0_2.UncalculatedTrans.Translation, r0_2.UncalculatedTrans.Rotation:ToRotator(), FVector(1, 1, 1))
end
local function r4_0(r0_3, r1_3)
  -- line: [18, 38] id: 3
  local r2_3 = r3_0(r0_3)
  if r0_3.bPreviewSceneLoaded then
    r2_3.Translation.Z = r2_3.Translation.Z + r0_3.ArmoryPlayer.CapsuleComponent:GetScaledCapsuleHalfHeight() + 2.4
    r0_3.ArmoryPlayer:K2_SetActorRotation(FRotator(0, 90, 0), false, r0_0, false)
  else
    local r3_3 = nil
    local r4_3 = DataMgr.BattleChar[r1_3.PreRoleId]
    if r4_3 and r4_3.CapsuleInfo then
      r3_3 = r4_3.CapsuleInfo.OriHalfHeight
    end
    if not r3_3 then
      r3_3 = r1_3.PrePlayerCapsuleHalfHeight
    end
    r2_3.Translation.Z = r2_3.Translation.Z + r0_3.ArmoryPlayer.CapsuleComponent:GetScaledCapsuleHalfHeight() - r3_3
  end
  r0_3.ArmoryPlayer:K2_SetActorLocation(r2_3.Translation, false, r0_0, false)
  r0_3.PlayerOriginalRootTrans = r0_3.ArmoryPlayer.Mesh:K2_GetComponentToWorld()
  r0_3.ArmoryHelper.OriginalRootTrans = r0_3.PlayerOriginalRootTrans
  return r2_3
end
function r1_0.OnOpened(r0_4)
  -- line: [40, 64] id: 4
  if r0_4.IsPreviewMode or r0_4.IsSecondary then
    return 
  end
  local r1_4 = UE4.UGameplayStatics.GetPlayerCharacter(r0_4.ViewUI, 0)
  r1_4:SetCharacterTag("Interactive")
  r1_4:SetHoldCrouch(false)
  r1_4:ResetJumpState_Cpp()
  r1_4:ResetCapSize()
  r1_4.PlayerAnimInstance:Montage_Stop(0)
  r1_4.PlayerAnimInstance:ForceToIdle()
  r1_4:RemoveClearInputCache()
  r1_4:GetMovementComponent().bForceStop = true
  r1_4:LaunchCharacter(FVector(0, 0, 0), true, true)
  local r2_4 = GWorld:GetAvatar()
  r2_4:ResetNeedRefreshPlayer()
  if r1_4.CurrentMasterBan or r2_4.CurrentMasterBan then
    r1_4:ChangeBackToHero()
  end
  r0_4:SavePlayerInfo()
end
function r1_0.SavePlayerInfo(r0_5)
  -- line: [66, 125] id: 5
  local r1_5 = GWorld:GetAvatar()
  local r2_5 = UE4.UGameplayStatics.GetPlayerCharacter(r0_5.ViewUI, 0)
  local r3_5 = r2_5:GetAttr("Hp")
  local r4_5 = r2_5:GetAttr("ES")
  local r5_5 = r2_5:GetAttr("Sp")
  if r1_5.CurrentMasterBan and r1_5.HeroTempInfo then
    r3_5 = r1_5.HeroTempInfo.RoleInfo.PlayerHp
    r4_5 = r1_5.HeroTempInfo.RoleInfo.PlayerES
    r5_5 = r1_5.HeroTempInfo.RoleInfo.PlayerSp
  end
  local r7_5 = r3_5 / r2_5:GetAttr("MaxHp")
  local r8_5 = r2_5:GetAttr("MaxES")
  local r9_5 = 1
  if r8_5 and r8_5 ~= 0 then
    r9_5 = r4_5 / r8_5
  end
  local r10_5 = r2_5:GetAttr("MaxSp")
  local r11_5 = 1
  if r10_5 and r10_5 ~= 0 then
    r11_5 = r5_5 / r10_5
  end
  local r12_5 = 1
  local r13_5 = 1
  local r14_5 = r2_5.RangedWeapon
  if r14_5 then
    local r15_5 = r14_5:GetAttr("BulletNum") and 0
    local r16_5 = r14_5:GetAttr("MagazineBulletNum") and 0
    if r1_5.CurrentMasterBan and r1_5.HeroTempInfo then
      r15_5 = r1_5.HeroTempInfo.RangedWeapon.BulletNum
      r16_5 = r1_5.HeroTempInfo.RangedWeapon.MagazineBulletNum
    end
    local r17_5 = r14_5:GetAttr("BulletMax")
    if r17_5 and r17_5 ~= 0 then
      r12_5 = (r15_5 + r16_5) / r17_5
    end
    local r18_5 = r14_5:GetAttr("MagazineCapacity")
    if r18_5 and r18_5 ~= 0 then
      r13_5 = r16_5 / r18_5
    end
  end
  r0_5.PlayerInfo = {
    HpRate = r7_5,
    ESRate = r9_5,
    SpRate = r11_5,
    BulletRate = r12_5,
    MagazineBulletRate = r13_5,
  }
end
function r1_0.LoadPlayerInfo(r0_6)
  -- line: [127, 184] id: 6
  if not r0_6.PlayerInfo then
    return 
  end
  PrintTable({
    LoadPlayerInfo = r0_6.PlayerInfo,
  }, 10, "self.PlayerInfo")
  local r1_6 = UE4.UGameplayStatics.GetPlayerCharacter(r0_6.ViewUI, 0)
  if r1_6 == nil then
    return 
  end
  r1_6:SetAttr("Hp", math.floor(math.max(r0_6.PlayerInfo.HpRate * r1_6:GetAttr("MaxHp"), 1)))
  local r3_6 = r1_6:GetAttr("MaxES")
  if r3_6 and r3_6 ~= 0 then
    r1_6:SetAttr("ES", math.floor(r0_6.PlayerInfo.ESRate * r3_6))
  end
  local r4_6 = r1_6:GetAttr("MaxSp")
  if r4_6 and r4_6 ~= 0 then
    r1_6:SetAttr("Sp", math.floor(r0_6.PlayerInfo.SpRate * r4_6))
  end
  local r5_6 = r1_6.RangedWeapon
  if r5_6 then
    local r6_6 = r5_6:GetAttr("BulletMax")
    local r7_6 = nil
    if r6_6 and r6_6 ~= 0 then
      r7_6 = math.floor(r0_6.PlayerInfo.BulletRate * r6_6)
    end
    local r8_6 = r5_6:GetAttr("MagazineCapacity")
    if r8_6 and r8_6 ~= 0 then
      local r9_6 = math.min(r7_6, math.floor(r0_6.PlayerInfo.MagazineBulletRate * r8_6))
      r5_6:SetAttr("MagazineBulletNum", r9_6)
      r5_6:K2_GetAttributesSet():OnRep_MagazineBulletNum()
      if r7_6 then
        r7_6 = r7_6 - r9_6
      end
    end
    if r7_6 then
      r5_6:SetAttr("BulletNum", r7_6)
      r5_6:K2_GetAttributesSet():OnRep_BulletNum()
      r5_6:K2_GetAttributesSet():OnRep_MagazineBulletNum()
    end
    if r5_6:GetWeaponMeleeOrRanged() == "Ranged" and r5_6:GetAttr("MagazineBulletNum") == 0 then
      Battle(r0_6.ViewUI):TriggerBattleEvent(BattleEventName.OnMagazineBulletCleared, r5_6:GetOwner())
    end
    r1_6:UpdateBulletNumUI()
  end
  EventManager:FireEvent(EventID.RefreshMainPlayerBlood)
  EventManager:FireEvent(EventID.UpdateMainPlayerSp, nil, nil, r1_6)
end
function r1_0.ChangeCharModel(r0_7, r1_7, r2_7, r3_7, r4_7, r5_7)
  -- line: [187, 265] id: 7
  r0_7:BeforeViewActorChanged()
  local r6_7 = r0_7:GetPlayerActor(true)
  r0_7.ArmoryHelper:SetViewActor(r6_7)
  r0_7:ResetActorRotation()
  r0_7.ViewActorType = r0_7.ViewActorTypes.Player
  r0_7:HidePlayerActor(r0_7.UIName, false)
  r0_7.ArmoryHelper.OriginalRootTrans = r0_7.PlayerOriginalRootTrans
  local r7_7 = r0_7:GetAvatar()
  if not r7_7 then
    return 
  end
  local r8_7 = r1_7.Uuid
  local r9_7 = r8_7 and r7_7.Chars[r8_7]
  local r10_7 = r9_7 and r1_7
  if r0_7.CurrentCharInfo == r10_7 and not r4_7 then
    return 
  end
  local r11_7 = r0_7.CurrentCharInfo and r0_7.CurrentCharInfo.CharId
  r0_7.CurrentCharInfo = r10_7
  r0_7.CurrentCharFromAvatar = r7_7
  if r0_7.CurrentCharInfo.DumpAppearanceSuit then
    r0_7.CurrentAppearanceInfo = r0_7.CurrentCharInfo:DumpAppearanceSuit(r7_7)
  end
  local r12_7 = nil
  local r13_7 = {}
  local r14_7 = UE4.UGameplayStatics.GetGameMode(r6_7)
  if r9_7 and r14_7 then
    r12_7 = r9_7.CharId
    r13_7 = r14_7:SimplifyInfoForInit({
      AvatarInfo = AvatarUtils:GetDefaultBattleInfo(r7_7, {
        Char = r9_7,
      }),
    })
    r13_7.FromArmory = true
    if r13_7.AvatarInfo then
      r13_7.AvatarInfo.MeleeWeapon = nil
      r13_7.AvatarInfo.RangedWeapon = nil
    end
    r6_7:InitCharacterInfo(r13_7)
  else
    r12_7 = r1_7.CharId
    r13_7.FromOtherWorld = true
    r13_7.FromArmory = true
    r6_7:ChangeRole(r12_7, r13_7)
  end
  r6_7:ClearWeapon()
  r6_7:SetCharacterTag("Interactive")
  if r5_7 then
    r0_7.IsProtagonist = true
    r0_7.bWaitForNotifyToChangePet = true
  else
    r0_7:ChangePetModel(nil)
    r0_7.IsProtagonist = false
    r0_7.bWaitForNotifyToChangePet = false
  end
  if r2_7 then
    r0_7.DelayFrame = 0
  else
    r0_7.DelayFrame = 30
  end
  r0_7.bPlayRoleChangedSound = not r3_7
  if r11_7 and r11_7 == r12_7 then
    r0_7.bPlayRoleChangedSound = false
  end
  r0_7.bPlaySameMontage = true
  r6_7:KawaiiSwitch(true)
  if r6_7.PlayerAnimInstance then
    r6_7.PlayerAnimInstance:SetKawiiLayerState(EKawaiiLayerState.EKLS_Armory)
  end
  r0_7.ArmoryHelper:OnRoleChanged()
  r0_7:StopPlayerSound()
  if r0_7.OnCharModelChanged then
    r0_7.OnCharModelChanged(r0_7.EventObj)
  end
  return true
end
function r1_0.StopPlayerSound(r0_8)
  -- line: [267, 275] id: 8
  local r1_8 = r0_8:GetPlayerActor()
  if r1_8 then
    local r2_8 = AudioManager(r0_8)
    r2_8:StopSound(r1_8, "ArmoryRoleVoice")
    r2_8:StopSound(r1_8, r0_8.UIName)
    r2_8:RemoveCharacterFromEndStopAndLoopPlayRecordMapWhenCharacterEndPlay(r1_8, 0)
  end
end
function r1_0.ChangeToProtagonist(r0_9, r1_9, r2_9, r3_9)
  -- line: [279, 298] id: 9
  local r4_9 = nil
  local r5_9 = GWorld:GetAvatar()
  if not r5_9 then
    return 
  end
  local r6_9 = r0_9.ProtagonistCharInfo
  if not r6_9 then
    r6_9 = {}
    r6_9.CharId = DataMgr.Player2RoleId.Player[r5_9.Sex]
  end
  r0_9.ProtagonistCharInfo = r6_9
  r4_9 = r0_9:ChangeCharModel(r0_9.ProtagonistCharInfo, r1_9, r2_9, r3_9, true)
  r6_9 = r0_9:GetPlayerActor(true)
  if r6_9.CharacterFashion then
    for r11_9, r12_9 in pairs(CommonConst.CharAccessoryTypes) do
      r6_9.CharacterFashion:ChangeAccessory(nil, r12_9)
    end
    -- close: r7_9
    if r6_9.PartsMesh then
      r6_9.PartsMesh:SetVisibility(true, false)
    end
  end
  return r4_9
end
function r1_0.GetPlayerActor(r0_10, r1_10)
  -- line: [300, 305] id: 10
  if r0_10.ArmoryPlayer == nil and r1_10 then
    r0_10:CreatePlayerActor()
  end
  return r0_10.ArmoryPlayer
end
function r1_0.DoSomethingWithPlayer(r0_11)
  -- line: [307, 309] id: 11
end
function r1_0.CreatePlayerActor(r0_12)
  -- line: [311, 348] id: 12
  local r1_12 = UIManager(r0_12.ViewUI)
  local r2_12 = nil
  r0_12.ArmoryPlayer, r2_12 = r1_12:CreateOrGetArmoryPlayerActor(r0_12.CurrentCharInfo, r0_12:GetAvatar())
  r0_12:ClearPlayerHideTag()
  r2_0[r0_12] = r0_12.ArmoryPlayer
  local r3_12 = {}
  local r4_12 = UE4.UGameplayStatics.GetPlayerCharacter(r0_12.ViewUI, 0)
  r3_12.PreRoleId = r4_12.CurrentRoleId
  r3_12.PrePlayerCapsuleHalfHeight = r4_12.CapsuleComponent:GetScaledCapsuleHalfHeight()
  if not r2_12 and r0_12.CurrentCharInfo then
    r0_12:ChangeCharModel(r0_12.CurrentCharInfo, true, nil, true)
  end
  r0_12.CurrentAppearanceInfo = r0_12.ArmoryPlayer.InfoForInit and r0_12.ArmoryPlayer.InfoForInit.AppearanceSuit
  if r0_12.ArmoryPlayer.MeleeWeapon then
    r0_12.ArmoryPlayer.MeleeWeapon:SetActorHideTag(r0_12.UIName, true)
  end
  if IsValid(r1_12.ArmoryWeapon) then
    r1_12.ArmoryWeapon:SetActorHideTag(r0_12.UIName, true)
  end
  r0_12.ArmoryPlayer:KawaiiSwitch(true)
  if r0_12.ArmoryPlayer.PlayerAnimInstance then
    r0_12.ArmoryPlayer.PlayerAnimInstance:SetKawiiLayerState(EKawaiiLayerState.EKLS_Armory)
  end
  r0_12.ArmoryPlayer:SetCharacterTag("Interactive")
  r0_12.ArmoryPlayer.IsInArmory = true
  r0_12.ArmoryPlayer:K2_SetActorTransform(r4_12:GetTransform(), false, nil, false)
  r0_12.ArmoryHelper:SetPlayer(r0_12.ArmoryPlayer)
  r0_12.ArmoryHelper:SetViewActor(r0_12.ArmoryPlayer)
  r0_12.ViewActorType = r0_12.ViewActorTypes.Player
  if not r0_12.bPreviewSceneLoaded then
    local r5_12 = r0_12.ArmoryHelper:OpenArmoryTransformCheck()
    if r5_12 then
      r0_12.UncalculatedTrans = r5_12
    end
  end
  r4_0(r0_12, r3_12)
end
function r1_0.ChangeRealPlayerInfo(r0_13)
  -- line: [350, 380] id: 13
  if r0_13.IsPreviewMode or r0_13.IsSecondary then
    return 
  end
  local r1_13 = GWorld:GetAvatar()
  local r2_13 = UE4.UGameplayStatics.GetPlayerCharacter(r0_13.ViewUI, 0)
  if not r2_13 or not r1_13 then
    return 
  end
  if r1_13.CurrentPet ~= 0 then
    local r3_13 = r1_13.Pets[r1_13.CurrentPet]
    r2_13:ServerSetBattlePet(r3_13.PetId, r3_13:GetSkillLevel(), false)
  end
  if r2_13.CurrentMasterBan then
    r2_13:WithChangeBackToHero()
  end
  if r1_13:GetNeedRefreshPlayer() then
    local r3_13 = AvatarUtils:GetDefaultBattleInfo(r1_13)
    r2_13:GetController():SetAvatarInfo(CommonUtils.ObjId2Str(r1_13.Eid), r3_13)
    r2_13:ChangeRole(nil, r3_13)
    r2_13:RecoverBanSkills()
    UE4.UPhantomFunctionLibrary.CancelAllPhantom(r2_13, EDestroyReason.PhantomChangeRole)
    EventManager:FireEvent(EventID.OnSwitchRole, r1_13.CurrentChar)
  end
end
function r1_0.HidePlayerActor(r0_14, r1_14, r2_14, r3_14)
  -- line: [383, 392] id: 14
  if not IsValid(r0_14.ArmoryPlayer) then
    return 
  end
  if not r3_14 then
    r0_14.PlayerActorHideTags[r1_14] = r2_14
  end
  r0_14.ArmoryPlayer:SetActorHideTag(r1_14, r2_14, false, true)
  r0_14.ArmoryPlayer:HideAllEffectCreature(r1_14, r2_14)
end
function r1_0.HidePlayerActorOnDisplayMount(r0_15, r1_15, r2_15, r3_15)
  -- line: [394, 403] id: 15
  if not IsValid(r0_15.ArmoryPlayer) then
    return 
  end
  if not r3_15 then
    r0_15.PlayerActorHideTags[r1_15] = r2_15
  end
  r0_15.ArmoryPlayer:SetActorHideTag(r1_15, r2_15, true, false)
  r0_15.ArmoryPlayer:HideAllEffectCreature(r1_15, r2_15)
end
function r1_0.ClearPlayerHideTag(r0_16)
  -- line: [405, 413] id: 16
  if not IsValid(r0_16.ArmoryPlayer) then
    return 
  end
  for r6_16, r7_16 in pairs(r0_16.ArmoryPlayer.HideTags:ToTable()) do
    r0_16:HidePlayerActor(r7_16, false)
  end
  -- close: r2_16
end
function r1_0.BeforeViewActorChanged(r0_17)
  -- line: [415, 419] id: 17
  if r0_17.ViewActorType == r0_17.ViewActorTypes.Player then
    r0_17:HidePlayerActor(r0_17.UIName, true)
  end
end
function r1_0.AfterViewActorChanged(r0_18)
  -- line: [421, 425] id: 18
  if r0_18.ViewActorType == r0_18.ViewActorTypes.Player and not r0_18.LTweenHandle_PlayDisappearFX then
    r0_18:HidePlayerActor(r0_18.UIName, false)
  end
end
function r1_0.CharLvUpOrBreakUp(r0_19)
  -- line: [427, 430] id: 19
  r0_19.ArmoryPlayer.FXComponent:PlayEffectByIDParams(303, {
    bTickEvenWhenPaused = true,
    NotAttached = true,
  })
end
function r1_0.StopPlayerMontage(r0_20)
  -- line: [432, 440] id: 20
  for r5_20, r6_20 in pairs(r0_20.PlayerMontageTimerKeys) do
    r0_20.ViewUI:RemoveTimer(r5_20)
  end
  -- close: r1_20
  r0_20.PlayerMontageTimerKeys = {}
  r0_20:GetPlayerActor():StopMontage()
  r0_20.CurMontageTag = "None"
end
function r1_0.StopPlayerFX(r0_21)
  -- line: [442, 447] id: 21
  for r5_21, r6_21 in pairs(r0_21.PlayerFXTimerKeys) do
    r0_21.ViewUI:RemoveTimer(r5_21)
  end
  -- close: r1_21
  r0_21.PlayerFXTimerKeys = {}
end
function r1_0.Component_OnClosed(r0_22)
  -- line: [449, 452] id: 22
  r0_22:StopPlayerSound()
  r0_22:HidePlayerActor(r0_22.UIName, true)
end
function r1_0.Component_OnDestruct(r0_23)
  -- line: [454, 480] id: 23
  r0_23.CurrentCharInfo = nil
  for r5_23, r6_23 in pairs(r0_23.PlayerActorHideTags) do
    if r6_23 then
      r0_23:HidePlayerActor(r5_23, false)
    end
  end
  -- close: r1_23
  r2_0[r0_23] = nil
  local r1_23 = UIManager(r0_23.ViewUI)
  if next(r2_0) == nil then
    r1_23.ArmoryPlayer = nil
    if r0_23.ArmoryHelper then
      r0_23.ArmoryHelper.bNeedDestroyPlayerActor = true
    end
  end
  if r0_23.IsPreviewMode or r0_23.IsSecondary then
    return 
  end
  local r2_23 = UE4.UGameplayStatics.GetPlayerCharacter(r0_23.ViewUI, 0)
  if r2_23 then
    r2_23:SetCharacterTag("Idle")
    if r2_23.PlayerAnimInstance then
      r2_23.PlayerAnimInstance:SetKawiiLayerState(EKawaiiLayerState.EKLS_Battle)
    end
  end
  r0_23:LoadPlayerInfo()
end
return r1_0
