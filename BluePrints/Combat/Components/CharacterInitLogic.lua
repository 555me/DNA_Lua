-- filename: @E:/Pack/Branch/OBT10_Geili\Content/Script/BluePrints\Combat\Components\CharacterInitLogic.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("BluePrints.Combat.BattleLogic.EffectResults")
local r1_0 = require("Utils.MiscUtils")
return {
  RegisterInfo = function(r0_1, r1_1)
    -- line: [9, 15] id: 1
    if r1_1 then
      r0_1.InfoForInit = r1_1
    end
    r0_1:TryInitCharacterInfo("InitInfo")
  end,
  OnRep_ServerBornInfo = function(r0_2)
    -- line: [17, 20] id: 2
    r0_2.BornInfo = r0_0.UnpackEffectStruct(r0_2.ServerBornInfo)
  end,
  OnRep_ServerInitSuccessOld = function(r0_3)
    -- line: [23, 34] id: 3
    if r0_3.ServerInitSuccess == true then
      print(_G.LogTag, "OnRep_ServerInitSuccess")
      r0_3.InfoForInit = r0_3:GetInfoForInit()
      if r0_3.IsFromCache then
        r0_3.InfoForInit.InitType = "FromCache"
      end
      r0_3:SetActorHideTag("login", true)
      r0_3:TryInitCharacterInfo("InitInfo")
    end
  end,
  GetInfoForInit = function(r0_4)
    -- line: [36, 42] id: 4
    return {
      RoleId = r0_4.CurrentRoleId,
      UnitId = r0_4.UnitId,
      ShadowModelId = r0_4.ShadowModelId,
    }
  end,
  BeginInitInfo = function(r0_5)
    -- line: [44, 51] id: 5
    print(_G.LogTag, "BeginInitInfo")
    if r0_5.InitSuccess then
      Battle(r0_5):ShowBattleError("CharacterInitLogic InitSuccess is true, do not init again", r0_5.InitSuccess)
      return 
    end
    r0_5:InitCharacterInfo()
  end,
  InitCharacterInfoForRegionPlayer = function(r0_6, r1_6)
    -- line: [53, 75] id: 6
    if not r1_6 then
      r1_6 = r0_6.InfoForInit
    end
    if not r1_6 then
      print(_G.LogTag, "InitInfo is nil")
      return 
    end
    r0_6.CacheInfo = r1_6
    if r1_6.AppearanceSuit then
      r0_6.CurrentSkinId = r1_6.AppearanceSuit.SkinId
    else
      r0_6.CurrentSkinId = r1_6.SkinId
    end
    r0_6.ShadowModelId = r1_6.ShadowModelId and 0
    r0_6:PreInitInfo(r1_6)
    local r2_6 = r0_6:GetCharPreloadComp()
    if r2_6 then
      r2_6:PreloadAssetsForRegionPlayer(r0_6:ColletctPartMeshIds(r1_6.AppearanceSuit), {
        r0_6,
        r0_6.RegionPlayerPendingInit
      })
    else
      r0_6:RegionPlayerPendingInit()
    end
  end,
  ColletctPartMeshIds = function(r0_7, r1_7)
    -- line: [77, 84] id: 7
    if not r0_7.CharacterFashion then
      return {}
    end
    local r2_7 = {}
    r0_7.CharacterFashion:ColletctPartMeshIds(r1_7, r2_7)
    return r2_7
  end,
  RegionPlayerPendingInit = function(r0_8)
    -- line: [88, 97] id: 8
    print(_G.LogTag, "RegionPlayerPendingInit")
    if not r0_8.CacheInfo then
      return 
    end
    local r1_8 = r0_8.CacheInfo
    if not r0_8.InitSuccess then
      r0_8:RealInitInfo(r1_8)
    end
  end,
  InitCharacterInfo = function(r0_9, r1_9)
    -- line: [102, 113] id: 9
    if not r1_9 then
      r1_9 = r0_9.InfoForInit
    end
    if not r1_9 then
      print(_G.LogTag, "InitInfo is nil")
      return 
    end
    r0_9.CacheInfo = r1_9
    r0_9:PreInitInfo(r1_9)
    if not r0_9.InitSuccess and IsEmptyTable(r0_9.WaitInitTags) then
      r0_9:RealInitInfo(r1_9)
    end
  end,
  AuthorityPreInitInfo = function(r0_10, r1_10)
    -- line: [115, 130] id: 10
    if r0_10.Eid == 0 then
      if r1_10.Eid ~= nil then
        r0_10:SetEid(r1_10.Eid)
      else
        r0_10:SetEid(UE4.UGameplayStatics.GetGameMode(r0_10):GetBattleEid())
      end
    end
    r0_10:SetDirectSource(r1_10.DirectSource and r1_10.DirectSource.Eid)
    r0_10:RawRemoveAllBuff()
    r0_10:DestroyActorOnDead_CPP(false)
    r0_10:ClearSkill()
    r0_10:ClearAttrs()
  end,
  ClientPreInitInfo = function(r0_11, r1_11)
    -- line: [132, 133] id: 11
  end,
  UnpackAvatarInfoNew = function(r0_12, r1_12)
    -- line: [136, 172] id: 12
    local r2_12 = r1_12:GetLuaTable("AvatarInfo")
    if not r2_12 then
      return 
    end
    r0_12.AvatarInfo = r2_12
    local r3_12 = r2_12.RoleInfo
    if r3_12 then
      for r8_12, r9_12 in pairs(r3_12) do
        if type(r9_12) == "number" and not r1_12.IntParams:Find(r8_12) then
          r1_12.IntParams:Add(r8_12, r9_12)
        elseif type(r9_12) == "boolean" and not r1_12.BoolParams:Find(r8_12) then
          r1_12.BoolParams:Add(r8_12, r9_12)
        elseif type(r9_12) == "table" and not r1_12:GetLuaTable(r8_12) then
          r1_12:AddLuaTable(r8_12, r9_12)
        end
      end
      -- close: r4_12
    end
    if not r1_12:GetLuaTable("MeleeWeapon") then
      r1_12:AddLuaTable("MeleeWeapon", r2_12.MeleeWeapon)
    end
    if not r1_12:GetLuaTable("RangedWeapon") then
      r1_12:AddLuaTable("RangedWeapon", r2_12.RangedWeapon)
    end
    if not r1_12:GetLuaTable("UltraWeapons") then
      r1_12:AddLuaTable("UltraWeapons", r2_12.UltraWeapons)
    end
  end,
  UnpackAvatarInfo = function(r0_13, r1_13)
    -- line: [174, 199] id: 13
    if r1_13.UseMasterRole then
      return 
    end
    local r2_13 = r1_13.AvatarInfo
    if r2_13 then
      for r7_13, r8_13 in pairs(r2_13) do
        if not r1_13[r7_13] then
          r1_13[r7_13] = r8_13
        end
      end
      -- close: r3_13
    end
    r1_13.AvatarInfo = nil
    local r3_13 = r1_13.RoleInfo
    if r3_13 then
      for r8_13, r9_13 in pairs(r3_13) do
        if not r1_13[r8_13] then
          r1_13[r8_13] = r9_13
        end
      end
      -- close: r4_13
    end
    r1_13.RoleInfo = nil
  end,
  PreInitInfo = function(r0_14, r1_14)
    -- line: [202, 247] id: 14
    r0_14.FromOtherWorld = r1_14.FromOtherWorld and false
    r0_14.FromArmory = r1_14.FromArmory and false
    r0_14.InfoForInit = r1_14
    if r1_14.ChangeRole then
      r0_14:ResetIdle()
    end
    r0_14:SetActorHideTag("login", true)
    r0_14:UnpackAvatarInfo(r1_14)
    if not r0_14.BornInfo then
      r0_14.BornInfo = r0_0.Result()
    end
    if IsAuthority(r0_14) then
      r0_14:AuthorityPreInitInfo(r1_14)
    else
      r0_14:ClientPreInitInfo(r1_14)
    end
    r0_14.InitSuccess = false
    r0_14.UnitId = r1_14.UnitId
    r0_14.PreRoleId = r0_14.CurrentRoleId
    r0_14:SetCurrentRoleId(r1_14.RoleId)
    r0_14:SetExtraModelIds()
    r0_14:PreloadSummonMonster(r0_14.PreRoleId)
    r0_14.BattleCharInfo = r0_14:GetDataInfo(r0_14.CurrentRoleId)
    r0_14.WaitInitTags = {}
    r0_14.CacheInfo = r1_14
    r0_14.bCharacterActive = true
    r0_14.PlayDieEffect = false
    r0_14.PlayBodyAccessoryEffect = false
  end,
  PreInitAssets = function(r0_15, r1_15)
    -- line: [250, 257] id: 15
  end,
  PrepareWaitInitTags = function(r0_16)
    -- line: [259, 266] id: 16
    if not r0_16.IsSimplePlayer and r0_16:NeedPreloadAssets() then
      r0_16:SetWaitInitTag(true, Const.CharWaitInitTag.AssetsLoading)
    end
    if not IsEmptyTable(r0_16.WaitInitTags) then
      r0_16:SetCharacterActive(false, "Init")
    end
  end,
  NeedPreloadAssets = function(r0_17)
    -- line: [269, 274] id: 17
    if r0_17.GetCharPreloadComp and r0_17:GetCharPreloadComp() then
      return r0_17:GetCharPreloadComp():NeedPreloadAssets()
    end
    return false
  end,
  NeedCacheLoadAssets = function(r0_18)
    -- line: [277, 297] id: 18
    if UE4.URuntimeCommonFunctionLibrary.IsPlayInEditor(r0_18) then
      return false
    end
    local r2_18 = false
    if r0_18.GetCharPreloadComp and r0_18:GetCharPreloadComp() then
      r2_18 = r0_18:GetCharPreloadComp():NeedCacheLoadAssets()
    end
    if r2_18 then
      local r3_18 = UE4.UGameplayStatics.GetGameState(r0_18)
      print(_G.LogTag, "---NeedCacheLoadAssets---", r3_18.bPreloadAssetsReady, r0_18.DelayCacheLoadPlayerAssets)
      if not r3_18.bPreloadAssetsReady then
        r0_18.DelayCacheLoadPlayerAssets = true
        r2_18 = false
      end
    end
    return r2_18
  end,
  RealInitInfo = function(r0_19, r1_19)
    -- line: [300, 351] id: 19
    if IsAuthority(r0_19) and not r0_19.FromOtherWorld then
      r0_19:AuthorityInitInfo(r1_19)
      r0_19:SnapShotInitInfo(r1_19)
    end
    r0_19:CommonInitInfo(r1_19)
    if IsStandAlone(r0_19) or not IsAuthority(r0_19) then
      r0_19:ClientInitInfo(r1_19)
    end
    r0_19.ServerInitSuccess = true
    r0_19.InitSuccess = true
    r0_19:PostInitInfo(r1_19)
    if r1_19.PreReadyCallback then
      r1_19.PreReadyCallback(r0_19)
    end
    r0_19:OnCharacterReady(r1_19)
    r0_19:SetIsCharacterReady(true)
    if r1_19.LoadFinishCallback then
      r1_19.LoadFinishCallback(r0_19)
    end
    if r0_19:NeedCacheLoadAssets() then
      r0_19:GetCharPreloadComp():CacheLoadAssets()
    end
    if not r0_19:IsMainPlayer() then
      return 
    end
    if r0_19.RangedWeapon == nil then
      return 
    end
    local r2_19 = r0_19.RangedWeapon.WeaponId
    local r3_19 = DataMgr.BattleWeapon[r2_19]
    if r3_19 and r3_19.IsForceEnablePhysics and UE4.UCharacterFunctionLibrary.SetMonsterPhysicsForceEnable(r0_19:GetWorld(), true) then
      DebugPrint("@gulinan RealInitInfo Enable physics, WeaponId: ", r2_19)
    elseif UE4.UCharacterFunctionLibrary.SetMonsterPhysicsForceEnable(r0_19:GetWorld(), false) then
      DebugPrint("@gulinan RealInitInfo Disable physics, WeaponId: ", r2_19)
    end
  end,
  PostInitInfo = function(r0_20, r1_20)
    -- line: [353, 366] id: 20
    if not r0_20.bCharacterActive then
      r0_20:SetCharacterActive(true, "Init")
    end
    if r0_20:IsMonster() then
      r0_20:DelayAdjustIfPossibleButAlwaysSpawn()
    end
    r0_20.CacheInfo = nil
    if r0_20:IsMainPlayer() then
      r0_20:ClearInputCache()
    end
  end,
  SetCharacterActive = function(r0_21, r1_21, r2_21)
    -- line: [368, 391] id: 21
    r0_21.bCharacterActive = r1_21
    if not r0_21.bCharacterActive then
      r0_21:SetActorHideTag(r2_21, true)
      r0_21:AddGravityModifier(UE4.EGravityModifierTag.CharInit, 0)
      r0_21:GetMovementComponent().Velocity = FVector(0, 0, 0)
      r0_21.DefaultCapsuleCollisionType = r0_21.CapsuleComponent:GetCollisionEnabled()
      r0_21.CapsuleComponent:SetCollisionEnabled(ECollisionEnabled.NoCollision)
      if r0_21.MonsterHitedCapsule then
        r0_21.DefaultHitCapsuleCollisionType = r0_21.MonsterHitedCapsule:GetCollisionEnabled()
        r0_21.MonsterHitedCapsule:SetCollisionEnabled(ECollisionEnabled.NoCollision)
      else
        r0_21.DefaultHitCapsuleCollisionType = ECollisionEnabled.NoCollision
      end
    else
      r0_21:SetActorHideTag(r2_21, false)
      r0_21.CapsuleComponent:SetCollisionEnabled(r0_21.DefaultCapsuleCollisionType)
      if r0_21.MonsterHitedCapsule then
        r0_21.MonsterHitedCapsule:SetCollisionEnabled(r0_21.DefaultHitCapsuleCollisionType)
      end
      r0_21:RemoveGravityModifier(UE4.EGravityModifierTag.CharInit)
    end
  end,
  SetWaitInitTag = function(r0_22, r1_22, r2_22)
    -- line: [393, 398] id: 22
    r0_22.WaitInitTags[r2_22] = r1_22 and nil
    if IsEmptyTable(r0_22.WaitInitTags) then
      r0_22:RealInitInfo(r0_22.CacheInfo)
    end
  end,
  GetWaitInitTag = function(r0_23, r1_23)
    -- line: [410, 412] id: 23
    -- notice: unreachable block#3
    local r2_23 = IsEmptyTable(r0_23.WaitInitTags)
    if not r2_23 then
      r2_23 = r0_23.WaitInitTags[r1_23]
    else
      r2_23 = false
    end
    return r2_23
  end,
  CommonInitInfo = function(r0_24, r1_24)
    -- line: [414, 446] id: 24
    Battle(r0_24):AddEntity(r0_24.Eid, r0_24)
    r0_24:InitCharacterTag()
    if not r1_24.FromOtherWorld then
      r0_24:AddRoleSkill(r0_24.CurrentRoleId, r0_24:GetSkillInitInfo(r1_24.SkillInfos))
    end
    local r2_24 = r1_24.AppearanceSuit
    if r2_24 then
      r2_24 = r1_24.AppearanceSuit.SkinId and r1_24.SkinId
    else
      goto label_26	-- block#5 is visited secondly
    end
    r0_24.CurrentSkinId = r2_24
    r0_24.ShadowModelId = r1_24.ShadowModelId and 0
    r0_24:LoadCurrentModel()
    r0_24.EnableAnimGravity = 0
    r0_24.UsingAnimGravity = false
    r0_24.bJetJump = false
    r0_24.EnableAnimFly = false
    if r0_24.BattleCharInfo then
      r0_24.bJetJump = r0_24.BattleCharInfo.EnableJetJump and false
      r0_24.EnableAnimFly = r0_24.BattleCharInfo.EnableAnimFly and false
    end
    print(_G.LogTag, "bJetJump", r0_24.bJetJump)
    r0_24:PlayerCommonInit(r1_24)
  end,
  LoadCurrentModel = function(r0_25)
    -- line: [448, 450] id: 25
    r0_25:GetCharModelComponent():LoadCurrentModel()
  end,
  AuthorityInitInfo = function(r0_26, r1_26)
    -- line: [452, 478] id: 26
    r0_26.UnitType = r1_26.UnitType
    if not r0_26:IsAIControlled() then
      local r2_26 = r1_26.Level and 1
      r0_26:SetAttr("Level", r2_26)
      r0_26:SetCharLevel(r2_26)
      r0_26:SetAttr("Exp", r1_26.Exp and 0)
      r0_26:SetAttr("GradeLevel", r1_26.GradeLevel and Const.DefaultCharGrade)
      r0_26:SetAttr("EnhanceLevel", r1_26.EnhanceLevel and 0)
      if r1_26.Camp then
        r0_26:SetCamp(r1_26.Camp)
      end
    end
    r0_26:SetTableAttr(r1_26.ReplaceAttrs)
    if r0_26:IsPlayer() then
      r0_26:SetStartLevelId()
      r0_26:SetPlayerInfo(r1_26)
    else
      r0_26:UpdateCurrentLevelId()
      if r0_26.CurrentLevelId:Length() > 0 then
        r0_26:SetSpawnLevelId(r0_26.CurrentLevelId:Get(1))
      end
    end
    r0_26.AvatarQuestRoleID = r1_26.AvatarQuestRoleID and 0
  end,
  SetPlayerInfo = function(r0_27, r1_27)
    -- line: [480, 497] id: 27
    r0_27.EndPointTransform = nil
    if r1_27.PlayerHp then
      r0_27:SetAttr("Hp", math.min(r1_27.PlayerHp, r0_27:GetAttr("MaxHp")))
      r0_27:CalcHpPercent()
    end
    if r1_27.PlayerSp then
      r0_27:SetAttr("Sp", math.min(r1_27.PlayerSp, r0_27:GetAttr("MaxSp")))
    end
    if r1_27.PlayerEs then
      r0_27:SetAttr("ES", math.min(r1_27.PlayerES, r0_27:GetAttr("MaxES")))
    end
    if r1_27.DeathInfo then
      r0_27:SetDeathInfo(r1_27.DeathInfo)
    end
  end,
  SnapShotInitInfo = function(r0_28, r1_28)
    -- line: [501, 502] id: 28
  end,
  InitAvatarBuffs = function(r0_29)
    -- line: [510, 528] id: 29
    local r1_29 = UE4.UGameplayStatics.GetGameMode(r0_29)
    local r2_29 = r0_29:GetController()
    if r1_29 and r2_29 then
      local r4_29 = r1_29.AvatarInfos[r2_29.AvatarEidStr]
      if not r4_29 then
        return 
      end
      local r5_29 = r4_29.PlayerInfo.Buffs
      local r6_29 = Battle(r0_29)
      if r5_29 then
        for r11_29, r12_29 in pairs(r5_29) do
          DebugPrint("Tianyi@ BuffInfo: " .. r12_29.BuffId .. " StartTime: " .. r12_29.StartTime .. " Duration: " .. r12_29.Duration .. "SkillLevel: " .. r12_29.Level)
          if r6_29 then
            r6_29:AddAvatarBuffToTarget(r0_29, r0_29, r12_29.BuffId, -1, 0, r12_29.Level)
          end
        end
        -- close: r7_29
      end
    end
  end,
  ClientInitInfo = function(r0_30, r1_30)
    -- line: [530, 582] id: 30
    if r1_30.FromOtherWorld then
      r0_30:SetCharacterTagIdle()
      return 
    end
    if r0_30:IsPlayer() and not r1_30.ChangeRole then
      if r0_30:JudgeIfPlayLevelEnter() and not r1_30.ChangeRole then
        r0_30:SetCharacterTag("LevelEnter")
        r0_30.ShouldPlayEnterMontage = true
      else
        r0_30:SetCharacterTagIdle()
      end
      r0_30:InitUIWidgetComponent()
      if IsValid(r0_30.BillboardComponent) then
        r0_30.BillboardComponent:InitPlayerBillBoard(r0_30, "Char")
      end
      if r0_30.BP_RecoverInteractiveComponent then
        r0_30.BP_RecoverInteractiveComponent:InitCharInfo()
      end
      if r0_30:IsMainPlayer() and (IsClient(r0_30) or IsStandAlone(r0_30)) then
        r0_30:SetupCameraControlComponent()
        r0_30.UploadBDCTrackInfo = {}
      end
      local r2_30 = r0_30:GetEMPlayerState()
      if r2_30 then
        local r3_30 = r2_30.WheelIndex
        DebugPrint("gmy@CharacterInitLogic Component:ClientInitInfo", r3_30, r0_30.SquadWheelIndex)
        if r3_30 > 0 then
          r0_30.SquadWheelIndex = r3_30
        else
          r0_30.SquadWheelIndex = -1
        end
      end
    end
    if r0_30:GetLocalRole() == Const.ROLE_AutonomousProxy and r0_30:IsPlayer() then
      r0_30:ServerNotifyAutonomousInit()
    end
  end,
  ClientPlayEnterMontage = function(r0_31)
    -- line: [584, 599] id: 31
    if not r0_31.ShouldPlayEnterMontage then
      return 
    end
    local r1_31 = {
      OnCompleted = r0_31.OnLevelEnterComplete,
      OnInterrupted = r0_31.OnLevelEnterInterrupted,
    }
    if r0_31.PlayerAnimInstance then
      r0_31.PlayerAnimInstance:SetKawaiiPhysics_Cpp("LevelEnter")
    end
    if r0_31.NpcAnimInstance then
      r0_31.NpcAnimInstance:SetKawaiiPhysics_Cpp("LevelEnter")
    end
    r0_31:PlayActionMontage("Interactive/LevelFinish", "LevelEnter_Montage", r1_31)
  end,
  FormatWeaponInfo = function(r0_32, r1_32, r2_32)
    -- line: [601, 613] id: 32
    r1_32.SlotData = {}
    r1_32.ModData = {}
    r1_32.ModPassives = nil
    r1_32.SkillInfos = nil
    r1_32.ReplaceAttrs = nil
    r1_32.EnhanceLevel = r2_32.EnhanceLevel and 0
    r1_32.WeaponId = r2_32.WeaponId and 0
    r1_32.GradeLevel = r2_32.GradeLevel and 0
    r1_32.AppearanceInfo = r2_32
    r1_32.AppearanceInfo.EnhanceLevel = nil
    r1_32.AppearanceInfo.GradeLevel = nil
  end,
  OnCharacterReady = function(r0_33, r1_33)
    -- line: [615, 794] id: 33
    r0_33:SetActorHideTag("login", false)
    if r1_33.FromOtherWorld then
      if r1_33.IsDungeonEnd then
        r0_33:ServerSetUpWeapons(r1_33.MeleeWeapon, r1_33.RangedWeapon, r1_33.UltraWeapons)
      elseif r1_33.RegionWeaponInfo then
        local r2_33 = {}
        r0_33:FormatWeaponInfo(r2_33, r1_33.RegionWeaponInfo.MeleeWeapon)
        local r3_33 = {}
        r0_33:FormatWeaponInfo(r3_33, r1_33.RegionWeaponInfo.RangedWeapon)
        r0_33:ServerSetUpWeapons(r2_33, r3_33, nil)
        if r1_33.ShowWeapon then
          r0_33:ChangeUsingWeaponByType(r1_33.ShowWeapon)
        end
      end
      r0_33:HandleModelFashion()
      r0_33.Overridden.OnCharacterReady(r0_33)
      r0_33.Overridden.ReceiveBeginPlay(r0_33)
      r0_33:ReceiveOnCharacterReady()
      return 
    end
    r0_33:GetBossDestructableComponent()
    if IsAuthority(r0_33) then
      if not r0_33:IsSummonMonster() then
        r0_33:ServerSetRoleMod(r1_33.RoleId, r1_33.ModPassives, false)
      end
      PrintTable({
        ZJYINFOINFO = r1_33.MeleeWeapon,
      }, 100)
      r0_33:ServerSetUpWeapons(r1_33.MeleeWeapon, r1_33.RangedWeapon, r1_33.UltraWeapons)
      r0_33:InitAllWeaponModifier(r1_33.ReplaceAttrs)
      r0_33:ServerSetUpAccessories()
      r0_33:ServerSetUpDestructableBody()
      r0_33:InitAvatarBuffs(r1_33)
      if r1_33.Pet and r0_33:IsPlayer() then
        local r3_33 = r1_33.Pet.PetId
        local r4_33 = r0_33:GetBattlePet()
        if r3_33 then
          local r5_33 = TArray(0)
          if r1_33.Pet.EntryIds then
            for r10_33, r11_33 in ipairs(r1_33.Pet.EntryIds) do
              if DataMgr.PetEntry[r11_33] then
                r5_33:Add(r11_33)
              end
            end
            -- close: r6_33
          end
          if r4_33 and r4_33.BattlePetId ~= 0 then
            r0_33:ServerRemoveBattlePet()
          end
          r0_33:ServerSetBattlePetAndAffixList(r3_33, r1_33.Pet.PetLevel and 1, r5_33, true)
        end
      end
    elseif r0_33.GetAccessories then
      for r7_33, r8_33 in pairs(r0_33:GetAccessories()) do
        r8_33:InitAccessoryInfo(r8_33.AccessoryId)
      end
      -- close: r3_33
    end
    print(_G.LogTag, "LXZ OnCharacterReady", r0_33:GetName(), r0_33:IsMainPlayer(), r1_33.ChangeRole)
    if r0_33:IsMainPlayer() and not r1_33.ChangeRole then
      local r3_33 = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(r0_33, UE4.UFXPreloadGameInstanceSubsystem)
      if r3_33 then
        local r6_33 = DataMgr.Model[r0_33:GetCharModelComponent():GetCurrentModelId()].MontagePrefix
        if r6_33 and string.find(r6_33, "_") == string.len(r6_33) then
          r3_33:PreloadCharacterFX(string.sub(r6_33, 1, -2))
        end
      end
      r0_33:AddInteractiveTrigger()
      local r5_33 = UE4.UGameplayStatics.GetGameInstance(r0_33):GetLoadingUI()
      if r5_33 and r5_33.bIsInLoading then
        r0_33:SetCanInteractiveTrigger(false, "Loading")
      end
    end
    r0_33:SetInteractiveTriggerDistance(r0_33:GetAttr("DropDistance"))
    if r0_33:IsPlayer() and not r1_33.ChangeRole then
      local function r3_33()
        -- line: [701, 707] id: 34
        local r0_34 = UE4.URuntimeCommonFunctionLibrary.GetCurrentGameState(r0_33)
        if not r0_34.PlayerReady then
          r0_34.PlayerReady = true
          r0_34:TryEndLoading("PlayerReady")
        end
      end
      if IsAuthority(r0_33) then
        r0_33:InitRegionBattleStateObject()
        if r0_33:GetController() then
          local r4_33 = UE4.UGameplayStatics.GetGameMode(r0_33)
          local r5_33 = r0_33:GetController().AvatarEidStr
          if r4_33.LevelLoader and not r4_33.AlreadyInit then
            r4_33.LevelLoader:SetInitTrans(r0_33:GetOwner())
          end
          r4_33:OnCharacterReady(r5_33, r0_33)
          r4_33:TryTriggerOnInit(r5_33)
          if r4_33:GetDungeonComponent() then
            r0_33:CreatePhantomBySquad(r5_33, r4_33)
          end
        end
      else
        r3_33()
      end
      if IsStandAlone(r0_33) then
        r3_33()
      end
    end
    if IsDedicatedServer(r0_33) and IsAuthority(r0_33) then
      r0_33.ServerBornInfo = r0_33.BornInfo:ToEffectStruct()
    end
    r0_33:ZeroComboCount(UE4.EClearComboReason.Timelimit)
    r0_33:HandleModelFashion()
    r0_33:RefreshActorHideTag()
    r0_33.Overridden.OnCharacterReady(r0_33)
    r0_33.Overridden.ReceiveBeginPlay(r0_33)
    r0_33:ReceiveOnCharacterReady()
    if not r0_33:IsMainPlayer() and (r0_33:IsPlayer() or r0_33:IsPhantom()) then
      EventManager:FireEvent(EventID.ShowTeammateBloodUI, r0_33.Eid, r0_33:IsPlayer(), r0_33)
    end
    if r0_33:IsMainPlayer() then
      if r1_33.ChangeRole then
        EventManager:FireEvent(EventID.ChangeRole)
      end
      r0_33:GetController():ForbidWeapon()
      if IsClient(r0_33) or IsStandAlone(r0_33) then
        r0_33:InitSceneStartUI()
      end
      EventManager:FireEvent(EventID.OnMainCharacterInitReady, r0_33.Eid)
      EventManager:FireEvent(EventID.OnCharacterInitSuitRecover)
    else
      EventManager:FireEvent(EventID.OnCharacterInitReady, r0_33.Eid)
    end
    if r0_33:IsPhantom() then
      EventManager:FireEvent(EventID.OnPhantomInitReady, r0_33.Eid)
    end
    if r1_33.ChangeRole then
      r0_33.WeaponPos = Const.Shoulder
      if not r0_33:IsNPC() then
        r0_33.EMAnimInstance = r0_33.Mesh:GetAnimInstance()
        if r0_33.EMAnimInstance and not r0_33.EMAnimInstance.Begining then
          r0_33.EMAnimInstance:AnimInstanceRestart()
        end
      else
        r0_33.NpcAnimInstance = r0_33.Mesh:GetAnimInstance()
        if r0_33.NpcAnimInstance and not r0_33.NpcAnimInstance.Begining then
          r0_33.NpcAnimInstance:AnimInstanceRestart()
        end
      end
    end
    r0_33.InfoForInit.ChangeRole = true
  end,
  HandleModelFashion = function(r0_35)
    -- line: [797, 806] id: 35
    print(_G.LogTag, "HandleModelFashionHandleModelFashion111")
    if not IsStandAlone(r0_35) and not IsClient(r0_35) then
      return 
    end
    print(_G.LogTag, "HandleModelFashionHandleModelFashion")
    r0_35.CharacterFashion:CreateAllDynamicMaterialNew()
  end,
  GetBossDestructableComponent = function(r0_36)
    -- line: [807, 826] id: 36
    local r1_36 = r0_36:K2_GetComponentsByClass(UDestructableBodyComponent:StaticClass())
    if r1_36:Num() == 0 then
      return 
    end
    r0_36.DestructParts = {}
    for r6_36, r7_36 in pairs(r1_36) do
      r0_36.DestructParts[r7_36.PartId] = r7_36
    end
    -- close: r2_36
    if not r0_36.SocketMap then
      r0_36.SocketMap = {}
    end
    if not r0_36.HpNum then
      r0_36.HpNum = 0
    end
    r0_36.MaxHpNum = r1_36:Num()
  end,
  PlayerCommonInit = function(r0_37, r1_37)
    -- line: [829, 837] id: 37
    if r0_37:IsPlayer() or r0_37:IsPhantom() then
      r0_37:SetupActionLogicPramas()
      r0_37:InitAnimIntanceParam()
      r0_37:InitAppearanceSuit(r1_37.AppearanceSuit and r0_37.BornInfo.AppearanceSuit)
    end
  end,
  GetNewSkinId = function(r0_38, r1_38)
    -- line: [839, 849] id: 38
    if not r1_38 then
      return CurrentSkinId
    end
    local r2_38 = r1_38:GetLuaTable("AppearanceSuit") and r0_38.BornInfo.AppearanceSuit
    if r2_38 and r2_38.SkinId then
      return r2_38.SkinId
    end
    return CurrentSkinId
  end,
  NewPlayerCommonInit = function(r0_39, r1_39)
    -- line: [851, 859] id: 39
    if r0_39:IsPlayer() or r0_39:IsPhantom() then
      r0_39:SetupActionLogicPramas()
      r0_39:InitAnimIntanceParam()
      r0_39:InitAppearanceSuit(r1_39:GetLuaTable("AppearanceSuit") and r0_39.BornInfo.AppearanceSuit)
    end
  end,
  InitAnimIntanceParam = function(r0_40)
    -- line: [861, 877] id: 40
    if r0_40.EMAnimInstance then
      local r2_40 = DataMgr.Model[r0_40:GetCharModelComponent():GetCurrentModelId()]
      if r0_40.EMAnimInstance.RunStopStartTime then
        r0_40.EMAnimInstance.RunStopStartTime = r2_40.RunStopStartTime and Const.RunStopStartTime
      end
      r0_40:InitKawaiiParams(r2_40)
    end
    if r0_40.NpcAnimInstance then
      r0_40.NpcAnimInstance.RunStopStartTime = DataMgr.Model[r0_40:GetCharModelComponent():GetCurrentModelId()].RunStopStartTime and Const.RunStopStartTime
      r0_40:InitKawaiiParams(r2_40)
    end
  end,
  InitKawaiiParams = function(r0_41, r1_41)
    -- line: [879, 914] id: 41
    if r0_41.PlayerAnimInstance then
      if not r1_41.KawaiiIdList then
        local r2_41 = r0_41.PlayerAnimInstance
        local r3_41 = UE4.EKawaiiLayerState.EKLS_Default
        if r2_41.ArtDebugSwitch then
          r3_41 = UE4.EKawaiiLayerState.EKLS_Battle
        end
        r2_41:SetKawiiLayerState(r3_41)
        return 
      end
      for r6_41, r7_41 in pairs(r1_41.KawaiiIdList) do
        if DataMgr.KawaiiParams[r7_41] then
          local r8_41 = DataMgr.KawaiiParams[r7_41].KawaiiType
          r0_41.KawaiiIdMap:Add(r8_41, r7_41)
          print(_G.LogTag, "InitKawaiiParamsInitKawaiiParams", r8_41, r7_41)
        end
      end
      -- close: r2_41
      r0_41.PlayerAnimInstance:SetKawaiiPhysics_Cpp("LevelEnter")
    end
    if r0_41.NpcAnimInstance then
      if r1_41.KawaiiIdList then
        for r6_41, r7_41 in pairs(r1_41.KawaiiIdList) do
          if DataMgr.KawaiiParams[r7_41] then
            local r8_41 = DataMgr.KawaiiParams[r7_41].KawaiiType
            r0_41.KawaiiIdMap:Add(r8_41, r7_41)
            print(_G.LogTag, "InitKawaiiParamsInitKawaiiParams", r8_41, r7_41)
          end
        end
        -- close: r2_41
      end
      r0_41.NpcAnimInstance:SetKawaiiPhysics_Cpp("LevelEnter")
    end
  end,
  InitAppearanceSuit = function(r0_42, r1_42)
    -- line: [916, 927] id: 42
    if r1_42 then
      if r0_42.CharacterFashion then
        r0_42.CharacterFashion:InitAppearanceSuit(r1_42)
      end
      if r0_42.BornInfo then
        r0_42.BornInfo.AppearanceSuit = r1_42
      end
    else
      r0_42:ClearAllSuitItem()
    end
  end,
  SetStartLevelId = function(r0_43)
    -- line: [929, 941] id: 43
    local r1_43 = UE4.UGameplayStatics.GetGameMode(r0_43)
    if not r1_43 then
      return 
    end
    local r2_43 = r1_43:GetLevelLoader()
    if not r2_43 or not r2_43.enterLevelID or type(r2_43.enterLevelID) ~= "string" then
      return 
    end
    local r3_43 = TArray("")
    r3_43:Add(r2_43.enterLevelID)
    r0_43:SetCurrentLevelId(r3_43)
  end,
  JudgeIfPlayLevelEnter = function(r0_44)
    -- line: [957, 990] id: 44
    if r1_0.IsSimulatedProxy(r0_44) then
      return false
    end
    if not GWorld:GetAvatar() then
      return false
    end
    local r1_44 = r0_44:GetEMPlayerState()
    if r1_44 and r1_44.bIsEMInactive == true then
      DebugPrint("Tianyi@ 重连不需要LevelEnter")
      return false
    elseif not r1_44 then
      DebugPrint("Tianyi@ PlayState is nullptr")
    end
    local r2_44 = UE4.UGameplayStatics.GetCurrentLevelName(r0_44, true)
    local r3_44 = UE4.UGameplayStatics.GetGameInstance(r0_44)
    if r3_44.NeedPlayTempSceneMonstage then
      r3_44.NeedPlayTempSceneMonstage = false
      return false
    end
    local r4_44 = r3_44 and r3_44:GetCurrentDungeonId()
    if r4_44 and DataMgr.Dungeon[r4_44] and DataMgr.Dungeon[r4_44].IsPlayLevelEnter then
      return true
    end
    for r9_44, r10_44 in pairs(DataMgr.Dungeon) do
      if string.match(r10_44.DungeonMapFile, r2_44) and r10_44.IsPlayLevelEnter then
        return true
      end
    end
    -- close: r5_44
    return false
  end,
  CleanAllTimer = function(r0_45)
    -- line: [992, 996] id: 45
    r0_45.Overridden.CleanAllTimer(r0_45)
    r0_45:CleanTimer()
  end,
  OnCharacterInitSuitRecover = function(r0_46)
    -- line: [999, 1008] id: 46
    local r1_46 = UE4.UGameplayStatics.GetGameMode(r0_46)
    local r2_46 = GWorld:GetAvatar()
    EventManager:RemoveEvent(EventID.OnCharacterInitSuitRecover, r0_46)
    if r0_46:IsMainPlayer() and IsValid(r1_46) and r2_46 and r2_46:CheckCurrentSubRegion() and (IsClient(r0_46) or IsStandAlone(r0_46)) then
      r1_46:InitRegionSuit(r2_46, r2_46:GetSubRegionId2RegionId())
    end
  end,
  SetInteractiveTriggerDistance = function(r0_47, r1_47)
    -- line: [1011, 1014] id: 47
    if not IsValid(r0_47.InteractiveTriggerComponent) then
      return 
    end
    r0_47.InteractiveTriggerComponent:SetInteractiveTriggerDistance(r1_47)
  end,
  CreatePhantomBySquad = function(r0_48, r1_48, r2_48)
    -- line: [1016, 1023] id: 48
    for r8_48, r9_48 in ipairs(r2_48.AvatarInfos[r1_48].PhantomInfo) do
      if next(r9_48.RoleInfo) then
        r0_48:CreatePhantom(r9_48.RoleInfo.RoleId, 1, r9_48, {
          IsSpawnBySquad = 1,
          TeamIndex = r8_48,
        })
      end
    end
    -- close: r4_48
  end,
}
