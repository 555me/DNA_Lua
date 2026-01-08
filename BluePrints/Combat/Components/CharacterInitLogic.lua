-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Combat\Components\CharacterInitLogic.lua
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
  RegionPlayerInitInfo = function(r0_7, r1_7, r2_7)
    -- line: [77, 140] id: 7
    local r3_7 = UE4.URegionSyncSubsystem.GetInstance(r0_7)
    local r4_7 = UE4.UGameplayStatics.GetGameInstance(r0_7)
    if not r3_7 then
      print(_G.LogTag, "RegionPlayerInitInfo RegionSyncSubsys is nil")
      return 
    end
    local r5_7 = GWorld:GetAvatar()
    if not r5_7 then
      print(_G.LogTag, "RegionPlayerInitInfo Avatar is nil")
      return 
    end
    if not r5_7.OtherRoleInfo then
      print(_G.LogTag, "RegionPlayerInitInfo Avatar.TempRoleInfo is nil")
      return 
    end
    if not CommonUtils.IsObjIdStr(r1_7) then
      print(_G.LogTag, "RegionPlayerInitInfo ObjId is  not a Legal ObjIdStr")
      return 
    end
    local r6_7 = CommonUtils.Str2ObjId(r1_7)
    local r7_7 = r5_7.OtherRoleInfo[r6_7]
    if not r7_7 then
      print(_G.LogTag, "RegionPlayerInitInfo RoleInfo is nil")
      return 
    end
    if r2_7 and r2_7 > 0 then
      r7_7.Eid = r2_7
    end
    r0_7.CacheInfo = r7_7
    if r7_7.AppearanceSuit then
      r0_7.CurrentSkinId = r7_7.AppearanceSuit.SkinId
    else
      r0_7.CurrentSkinId = r7_7.SkinId
    end
    r0_7.ShadowModelId = r7_7.ShadowModelId and 0
    r0_7:PreInitInfo(r7_7)
    r0_7:RegionPlayerPendingInit()
    r0_7:AddInteractiveComponent()
    r7_7.CharEid = r0_7.Eid
    if r0_7.RegionInterComp then
      r0_7.RegionInterComp:InitRegionInfo(r0_7.Eid, r6_7)
    end
    if r0_7.RegionInterAddFriendComp then
      r0_7.RegionInterAddFriendComp:InitRegionInfo(r0_7.Eid, r6_7)
    end
    if r0_7.RegionInterInviteTeamComp then
      r0_7.RegionInterInviteTeamComp:InitRegionInfo(r0_7.Eid, r6_7)
    end
    if r0_7.RegionInterPersonInfoComp then
      r0_7.RegionInterPersonInfoComp:InitRegionInfo(r0_7.Eid, r6_7)
    end
    EventManager:FireEvent(EventID.OnlineAddOtherPlayer, r0_7.Eid, r7_7.Uid, r0_7, r6_7)
    EventManager:FireEvent(EventID.AddRegionIndicatorInfo, r0_7.Eid, r7_7.Uid, r0_7:K2_GetActorLocation(), r6_7)
    r0_7:RegisterOtherWorldPlayerCharacterToSubSystem(r1_7)
    print(_G.LogTag, "RegionPlayerInitInfo Spawn Other Player Character Success Init", r7_7.IsCrouching)
    if r7_7.IsCrouching then
      r0_7:SetCrouch(true)
    else
      r0_7:SetCrouch(false)
    end
  end,
  ColletctPartMeshIds = function(r0_8, r1_8)
    -- line: [143, 150] id: 8
    if not r0_8.CharacterFashion then
      return {}
    end
    local r2_8 = {}
    r0_8.CharacterFashion:ColletctPartMeshIds(r1_8, r2_8)
    return r2_8
  end,
  RegionPlayerPendingInit = function(r0_9)
    -- line: [154, 163] id: 9
    print(_G.LogTag, "RegionPlayerPendingInit")
    if not r0_9.CacheInfo then
      return 
    end
    local r1_9 = r0_9.CacheInfo
    if not r0_9.InitSuccess then
      r0_9:RealInitInfo(r1_9)
    end
  end,
  InitCharacterInfo = function(r0_10, r1_10)
    -- line: [168, 179] id: 10
    if not r1_10 then
      r1_10 = r0_10.InfoForInit
    end
    if not r1_10 then
      print(_G.LogTag, "InitInfo is nil")
      return 
    end
    r0_10.CacheInfo = r1_10
    r0_10:PreInitInfo(r1_10)
    if not r0_10.InitSuccess and IsEmptyTable(r0_10.WaitInitTags) then
      r0_10:RealInitInfo(r1_10)
    end
  end,
  AuthorityPreInitInfo = function(r0_11, r1_11)
    -- line: [181, 198] id: 11
    if r0_11.Eid == 0 then
      if r1_11.Eid ~= nil then
        r0_11:SetEid(r1_11.Eid)
      else
        local r2_11 = UE4.UGameplayStatics.GetGameMode(r0_11)
        if r2_11 then
          r0_11:SetEid(r2_11:GetBattleEid())
        end
      end
    end
    r0_11:SetDirectSource(r1_11.DirectSource and r1_11.DirectSource.Eid)
    r0_11:RawRemoveAllBuff(true)
    r0_11:DestroyActorOnDead_CPP(false)
    r0_11:ClearSkill()
    r0_11:ClearAttrs()
  end,
  ClientPreInitInfo = function(r0_12, r1_12)
    -- line: [200, 202] id: 12
    r0_12:DestroyAllCreatures()
  end,
  UnpackAvatarInfoNew = function(r0_13, r1_13)
    -- line: [205, 241] id: 13
    local r2_13 = r1_13:GetLuaTable("AvatarInfo")
    if not r2_13 then
      return 
    end
    r0_13.AvatarInfo = r2_13
    local r3_13 = r2_13.RoleInfo
    if r3_13 then
      for r8_13, r9_13 in pairs(r3_13) do
        if type(r9_13) == "number" and not r1_13.IntParams:Find(r8_13) then
          r1_13.IntParams:Add(r8_13, r9_13)
        elseif type(r9_13) == "boolean" and not r1_13.BoolParams:Find(r8_13) then
          r1_13.BoolParams:Add(r8_13, r9_13)
        elseif type(r9_13) == "table" and not r1_13:GetLuaTable(r8_13) then
          r1_13:AddLuaTable(r8_13, r9_13)
        end
      end
      -- close: r4_13
    end
    if not r1_13:GetLuaTable("MeleeWeapon") then
      r1_13:AddLuaTable("MeleeWeapon", r2_13.MeleeWeapon)
    end
    if not r1_13:GetLuaTable("RangedWeapon") then
      r1_13:AddLuaTable("RangedWeapon", r2_13.RangedWeapon)
    end
    if not r1_13:GetLuaTable("UltraWeapons") then
      r1_13:AddLuaTable("UltraWeapons", r2_13.UltraWeapons)
    end
  end,
  UnpackAvatarInfo = function(r0_14, r1_14)
    -- line: [243, 268] id: 14
    if r1_14.UseMasterRole then
      return 
    end
    local r2_14 = r1_14.AvatarInfo
    if r2_14 then
      for r7_14, r8_14 in pairs(r2_14) do
        if not r1_14[r7_14] then
          r1_14[r7_14] = r8_14
        end
      end
      -- close: r3_14
    end
    r1_14.AvatarInfo = nil
    local r3_14 = r1_14.RoleInfo
    if r3_14 then
      for r8_14, r9_14 in pairs(r3_14) do
        if not r1_14[r8_14] then
          r1_14[r8_14] = r9_14
        end
      end
      -- close: r4_14
    end
    r1_14.RoleInfo = nil
  end,
  PreInitInfo = function(r0_15, r1_15)
    -- line: [271, 317] id: 15
    r0_15:UnpackAvatarInfo(r1_15)
    r0_15.FromOtherWorld = r1_15.FromOtherWorld and false
    r0_15.FromArmory = r1_15.FromArmory and false
    r0_15.IsSettlementOtherRole = r1_15.IsSettlementOtherRole and false
    r0_15.InfoForInit = r1_15
    if r1_15.ChangeRole then
      r0_15:ResetIdle()
    end
    r0_15:SetActorHideTag("login", true)
    if not r0_15.BornInfo then
      r0_15.BornInfo = r0_0.Result()
    end
    if IsAuthority(r0_15) then
      r0_15:AuthorityPreInitInfo(r1_15)
    else
      r0_15:ClientPreInitInfo(r1_15)
    end
    r0_15.InitSuccess = false
    r0_15.UnitId = r1_15.UnitId
    r0_15.PreRoleId = r0_15.CurrentRoleId
    r0_15:SetCurrentRoleId(r1_15.RoleId)
    r0_15:SetExtraModelIds()
    r0_15:PreloadSummonMonster(r0_15.PreRoleId)
    r0_15.BattleCharInfo = r0_15:GetDataInfo(r0_15.CurrentRoleId)
    r0_15.WaitInitTags = {}
    r0_15.CacheInfo = r1_15
    r0_15.bCharacterActive = true
    r0_15.PlayDieEffect = false
    r0_15.PlayBodyAccessoryEffect = false
  end,
  PreInitAssets = function(r0_16, r1_16)
    -- line: [320, 327] id: 16
  end,
  PrepareWaitInitTags = function(r0_17)
    -- line: [329, 336] id: 17
    if not r0_17.IsSimplePlayer and r0_17:NeedPreloadAssets() then
      r0_17:SetWaitInitTag(true, Const.CharWaitInitTag.AssetsLoading)
    end
    if not IsEmptyTable(r0_17.WaitInitTags) then
      r0_17:SetCharacterActive(false, "Init")
    end
  end,
  NeedPreloadAssets = function(r0_18)
    -- line: [339, 344] id: 18
    if r0_18.GetCharPreloadComp and r0_18:GetCharPreloadComp() then
      return r0_18:GetCharPreloadComp():NeedPreloadAssets()
    end
    return false
  end,
  NeedCacheLoadAssets = function(r0_19)
    -- line: [347, 367] id: 19
    if UE4.URuntimeCommonFunctionLibrary.IsPlayInEditor(r0_19) then
      return false
    end
    local r2_19 = false
    if r0_19.GetCharPreloadComp and r0_19:GetCharPreloadComp() then
      r2_19 = r0_19:GetCharPreloadComp():NeedCacheLoadAssets()
    end
    if r2_19 then
      local r3_19 = UE4.UGameplayStatics.GetGameState(r0_19)
      print(_G.LogTag, "---NeedCacheLoadAssets---", r3_19.bPreloadAssetsReady, r0_19.DelayCacheLoadPlayerAssets)
      if not r3_19.bPreloadAssetsReady then
        r0_19.DelayCacheLoadPlayerAssets = true
        r2_19 = false
      end
    end
    return r2_19
  end,
  RealInitInfo = function(r0_20, r1_20)
    -- line: [370, 424] id: 20
    if IsAuthority(r0_20) and not r0_20.FromOtherWorld then
      r0_20:AuthorityInitInfo(r1_20)
      r0_20:SnapShotInitInfo(r1_20)
    end
    r0_20:CommonInitInfo(r1_20)
    if IsStandAlone(r0_20) or not IsAuthority(r0_20) then
      r0_20:ClientInitInfo(r1_20)
    end
    r0_20.ServerInitSuccess = true
    r0_20.InitSuccess = true
    r0_20:PostInitInfo(r1_20)
    if r1_20.PreReadyCallback then
      r1_20.PreReadyCallback(r0_20)
    end
    r0_20:OnCharacterReady(r1_20)
    r0_20:SetIsCharacterReady(true)
    if r1_20.LoadFinishCallback then
      r1_20.LoadFinishCallback(r0_20)
    end
    if r0_20:NeedCacheLoadAssets() then
      r0_20:GetCharPreloadComp():CacheLoadAssets()
    end
    r0_20:OnCharacterInitOver()
    if not r0_20:IsMainPlayer() then
      return 
    end
    r0_20.ShouldTickVisible = true
    if r0_20.RangedWeapon == nil then
      return 
    end
    local r2_20 = r0_20.RangedWeapon.WeaponId
    local r3_20 = DataMgr.BattleWeapon[r2_20]
    if r3_20 and r3_20.IsForceEnablePhysics and UE4.UCharacterFunctionLibrary.SetMonsterPhysicsForceEnable(r0_20:GetWorld(), true) then
      DebugPrint("@gulinan RealInitInfo Enable physics, WeaponId: ", r2_20)
    elseif UE4.UCharacterFunctionLibrary.SetMonsterPhysicsForceEnable(r0_20:GetWorld(), false) then
      DebugPrint("@gulinan RealInitInfo Disable physics, WeaponId: ", r2_20)
    end
  end,
  PostInitInfo = function(r0_21, r1_21)
    -- line: [426, 439] id: 21
    if not r0_21.bCharacterActive then
      r0_21:SetCharacterActive(true, "Init")
    end
    if r0_21:IsMonster() then
      r0_21:DelayAdjustIfPossibleButAlwaysSpawn()
    end
    r0_21.CacheInfo = nil
    if r0_21:IsMainPlayer() then
      r0_21:ClearInputCache()
    end
  end,
  SetCharacterActive = function(r0_22, r1_22, r2_22)
    -- line: [441, 464] id: 22
    r0_22.bCharacterActive = r1_22
    if not r0_22.bCharacterActive then
      r0_22:SetActorHideTag(r2_22, true)
      r0_22:AddGravityModifier(UE4.EGravityModifierTag.CharInit, 0)
      r0_22:GetMovementComponent().Velocity = FVector(0, 0, 0)
      r0_22.DefaultCapsuleCollisionType = r0_22.CapsuleComponent:GetCollisionEnabled()
      r0_22.CapsuleComponent:SetCollisionEnabled(ECollisionEnabled.NoCollision)
      if r0_22.MonsterHitedCapsule then
        r0_22.DefaultHitCapsuleCollisionType = r0_22.MonsterHitedCapsule:GetCollisionEnabled()
        r0_22.MonsterHitedCapsule:SetCollisionEnabled(ECollisionEnabled.NoCollision)
      else
        r0_22.DefaultHitCapsuleCollisionType = ECollisionEnabled.NoCollision
      end
    else
      r0_22:SetActorHideTag(r2_22, false)
      r0_22.CapsuleComponent:SetCollisionEnabled(r0_22.DefaultCapsuleCollisionType)
      if r0_22.MonsterHitedCapsule then
        r0_22.MonsterHitedCapsule:SetCollisionEnabled(r0_22.DefaultHitCapsuleCollisionType)
      end
      r0_22:RemoveGravityModifier(UE4.EGravityModifierTag.CharInit)
    end
  end,
  SetWaitInitTag = function(r0_23, r1_23, r2_23)
    -- line: [466, 471] id: 23
    r0_23.WaitInitTags[r2_23] = r1_23 and nil
    if IsEmptyTable(r0_23.WaitInitTags) then
      r0_23:RealInitInfo(r0_23.CacheInfo)
    end
  end,
  GetWaitInitTag = function(r0_24, r1_24)
    -- line: [483, 485] id: 24
    -- notice: unreachable block#3
    local r2_24 = IsEmptyTable(r0_24.WaitInitTags)
    if not r2_24 then
      r2_24 = r0_24.WaitInitTags[r1_24]
    else
      r2_24 = false
    end
    return r2_24
  end,
  CommonInitInfo = function(r0_25, r1_25)
    -- line: [487, 519] id: 25
    Battle(r0_25):AddEntity(r0_25.Eid, r0_25)
    r0_25:InitCharacterTag()
    if not r1_25.FromOtherWorld then
      r0_25:AddRoleSkill(r0_25.CurrentRoleId, r0_25:GetSkillInitInfo(r1_25.SkillInfos))
    end
    local r2_25 = r1_25.AppearanceSuit
    if r2_25 then
      r2_25 = r1_25.AppearanceSuit.SkinId and r1_25.SkinId
    else
      goto label_26	-- block#5 is visited secondly
    end
    r0_25.CurrentSkinId = r2_25
    r0_25.ShadowModelId = r1_25.ShadowModelId and 0
    r0_25:LoadCurrentModel()
    r0_25.EnableAnimGravity = 0
    r0_25.UsingAnimGravity = false
    r0_25.bJetJump = false
    r0_25.EnableAnimFly = false
    if r0_25.BattleCharInfo then
      r0_25.bJetJump = r0_25.BattleCharInfo.EnableJetJump and false
      r0_25.EnableAnimFly = r0_25.BattleCharInfo.EnableAnimFly and false
    end
    print(_G.LogTag, "bJetJump", r0_25.bJetJump)
    r0_25:PlayerCommonInit(r1_25)
  end,
  LoadCurrentModel = function(r0_26)
    -- line: [521, 523] id: 26
    r0_26:GetCharModelComponent():LoadCurrentModel()
  end,
  AuthorityInitInfo = function(r0_27, r1_27)
    -- line: [525, 550] id: 27
    r0_27.UnitType = r1_27.UnitType
    if not r0_27:IsAIControlled() then
      local r2_27 = r1_27.Level and 1
      r0_27:SetAttr("Level", r2_27)
      r0_27:SetCharLevel(r2_27)
      r0_27:SetAttr("Exp", r1_27.Exp and 0)
      r0_27:SetAttr("GradeLevel", r1_27.GradeLevel and Const.DefaultCharGrade)
      r0_27:SetAttr("EnhanceLevel", r1_27.EnhanceLevel and 0)
      if r1_27.Camp then
        r0_27:SetCamp(r1_27.Camp)
      end
    end
    r0_27:SetTableAttr(r1_27.ReplaceAttrs)
    if r0_27:IsPlayer() then
      r0_27:SetStartLevelId()
    else
      r0_27:UpdateCurrentLevelId()
      if r0_27.CurrentLevelId:Length() > 0 then
        r0_27:SetSpawnLevelId(r0_27.CurrentLevelId:Get(1))
      end
    end
    r0_27.AvatarQuestRoleID = r1_27.AvatarQuestRoleID and 0
  end,
  SetPlayerInfo = function(r0_28, r1_28)
    -- line: [552, 569] id: 28
    r0_28.EndPointTransform = nil
    if r1_28.PlayerHp then
      r0_28:SetAttr("Hp", math.min(r1_28.PlayerHp, r0_28:GetAttr("MaxHp")))
      r0_28:CalcHpPercent()
    end
    if r1_28.PlayerSp then
      r0_28:SetAttr("Sp", math.min(r1_28.PlayerSp, r0_28:GetAttr("MaxSp")))
    end
    if r1_28.PlayerES then
      r0_28:SetAttr("ES", math.min(r1_28.PlayerES, r0_28:GetAttr("MaxES")))
    end
    if r1_28.DeathInfo then
      r0_28:SetDeathInfo(r1_28.DeathInfo)
    end
  end,
  SnapShotInitInfo = function(r0_29, r1_29)
    -- line: [573, 574] id: 29
  end,
  GetAvatarBuffList = function(r0_30)
    -- line: [577, 602] id: 30
    local r1_30 = UE4.UGameplayStatics.GetGameMode(r0_30)
    local r2_30 = nil
    local r3_30 = nil
    if r0_30:IsPhantom() then
      r2_30 = r0_30.PhantomOwner:GetController()
    else
      r2_30 = r0_30:GetController()
    end
    if r1_30 and r2_30 then
      if IsStandAlone(r2_30) then
        local r4_30 = GWorld:GetAvatar()
        if r4_30 then
          r3_30 = r4_30.ServerBuffs
        end
      else
        local r5_30 = r1_30.AvatarInfos[r2_30.AvatarEidStr]
        if not r5_30 then
          return 
        end
        r3_30 = r5_30.PlayerInfo.Buffs
      end
    end
    return r3_30
  end,
  GetAvatarBuffList_Cpp = function(r0_31)
    -- line: [604, 617] id: 31
    local r1_31 = r0_31:GetAvatarBuffList() and {}
    local r2_31 = TArray(UE4.FAvatarBuffInfo)
    if r1_31 then
      for r7_31, r8_31 in pairs(r1_31) do
        local r9_31 = UE4.FAvatarBuffInfo()
        r9_31.BuffId = r8_31.BuffId
        r9_31.BuffLevel = r8_31.Level
        r2_31:Add(r9_31)
      end
      -- close: r3_31
    end
    return r2_31
  end,
  InitAvatarBuffs = function(r0_32)
    -- line: [621, 637] id: 32
    local r1_32 = r0_32:GetAvatarBuffList()
    local r2_32 = Battle(r0_32)
    if r1_32 then
      for r7_32, r8_32 in pairs(r1_32) do
        local r9_32 = DataMgr.Buff[r8_32.BuffId]
        if r9_32 and (r9_32.IsAvatarBuff ~= 1 or r0_32:IsPlayer()) and r2_32 then
          r2_32:AddAvatarBuffToTarget(r0_32, r0_32, r8_32.BuffId, -1, 0, r8_32.Level)
        end
      end
      -- close: r3_32
    end
  end,
  ClientInitInfo = function(r0_33, r1_33)
    -- line: [639, 691] id: 33
    if r1_33.FromOtherWorld then
      r0_33:SetCharacterTagIdle()
      return 
    end
    if r0_33:IsPlayer() and not r1_33.ChangeRole then
      if r0_33:JudgeIfPlayLevelEnter() and not r1_33.ChangeRole then
        r0_33:SetCharacterTag("LevelEnter")
        r0_33.ShouldPlayEnterMontage = true
      else
        r0_33:SetCharacterTagIdle()
      end
      r0_33:InitUIWidgetComponent()
      if IsValid(r0_33.BillboardComponent) then
        r0_33.BillboardComponent:InitPlayerBillBoard(r0_33, "Char")
      end
      if r0_33.BP_RecoverInteractiveComponent then
        r0_33.BP_RecoverInteractiveComponent:InitCharInfo()
      end
      if r0_33:IsMainPlayer() and (IsClient(r0_33) or IsStandAlone(r0_33)) then
        r0_33:SetupCameraControlComponent()
        r0_33.UploadBDCTrackInfo = {}
      end
      local r2_33 = r0_33:GetEMPlayerState()
      if r2_33 then
        local r3_33 = r2_33.WheelIndex
        DebugPrint("gmy@CharacterInitLogic Component:ClientInitInfo", r3_33, r0_33.SquadWheelIndex)
        if r3_33 > 0 then
          r0_33.SquadWheelIndex = r3_33
        else
          r0_33.SquadWheelIndex = -1
        end
      end
    end
    if r0_33:GetLocalRole() == Const.ROLE_AutonomousProxy and r0_33:IsPlayer() then
      r0_33:ServerNotifyAutonomousInit()
    end
  end,
  FormatWeaponInfo = function(r0_34, r1_34, r2_34)
    -- line: [694, 706] id: 34
    r1_34.SlotData = {}
    r1_34.ModData = {}
    r1_34.ModPassives = nil
    r1_34.SkillInfos = nil
    r1_34.ReplaceAttrs = nil
    r1_34.EnhanceLevel = r2_34.EnhanceLevel and 0
    r1_34.WeaponId = r2_34.WeaponId and 0
    r1_34.GradeLevel = r2_34.GradeLevel and 0
    r1_34.AppearanceInfo = r2_34
    r1_34.AppearanceInfo.EnhanceLevel = nil
    r1_34.AppearanceInfo.GradeLevel = nil
  end,
  ClientPlayEnterMontage = function(r0_35)
    -- line: [708, 723] id: 35
    if not r0_35.ShouldPlayEnterMontage then
      return 
    end
    local r1_35 = {
      OnCompleted = r0_35.OnLevelEnterComplete,
      OnInterrupted = r0_35.OnLevelEnterInterrupted,
    }
    if r0_35.PlayerAnimInstance then
      r0_35.PlayerAnimInstance:SetKawaiiPhysics_Cpp("LevelEnter")
    end
    if r0_35.NpcAnimInstance then
      r0_35.NpcAnimInstance:SetKawaiiPhysics_Cpp("LevelEnter")
    end
    r0_35:PlayActionMontage("Interactive/LevelFinish", "LevelEnter_Montage", r1_35)
  end,
  OnCharacterReady = function(r0_36, r1_36)
    -- line: [725, 901] id: 36
    r0_36:SetActorHideTag("login", false)
    if r1_36.FromOtherWorld then
      if r1_36.IsDungeonEnd then
        r0_36:ServerSetUpWeapons(r1_36.MeleeWeapon, r1_36.RangedWeapon, r1_36.UltraWeapons)
      else
        r0_36:ServerSetUpWeapons(r1_36.MeleeWeapon, r1_36.RangedWeapon, nil)
      end
      if r1_36.ShowWeapon then
        r0_36:ChangeUsingWeaponByType(r1_36.ShowWeapon)
      end
      r0_36.DontInitColor = true
      r0_36:HandleModelFashion()
      r0_36.Overridden.OnCharacterReady(r0_36)
      r0_36.Overridden.ReceiveBeginPlay(r0_36)
      r0_36:ReceiveOnCharacterReady()
      return 
    end
    r0_36:GetBossDestructableComponent()
    if IsAuthority(r0_36) then
      if not r0_36:IsSummonMonster() then
        r0_36:ServerSetRoleMod(r1_36.RoleId, r1_36.ModPassives, false)
      end
      r0_36:ServerSetUpWeapons(r1_36.MeleeWeapon, r1_36.RangedWeapon, r1_36.UltraWeapons)
      r0_36:InitAllWeaponModifier(r1_36.ReplaceAttrs)
      r0_36:ServerSetUpAccessories()
      r0_36:ServerSetUpDestructableBody()
      r0_36:InitAvatarBuffs(r1_36)
      if r1_36.Pet and r0_36:IsPlayer() then
        local r3_36 = r1_36.Pet.PetId
        local r4_36 = r0_36:GetBattlePet()
        if r3_36 then
          local r5_36 = TArray(0)
          if r1_36.Pet.EntryIds then
            for r10_36, r11_36 in ipairs(r1_36.Pet.EntryIds) do
              if DataMgr.PetEntry[r11_36] then
                r5_36:Add(r11_36)
              end
            end
            -- close: r6_36
          end
          if r4_36 and r4_36.BattlePetId ~= 0 then
            r0_36:ServerRemoveBattlePet()
          end
          r0_36:ServerSetBattlePetAndAffixList(r3_36, r1_36.Pet.PetLevel and 1, r5_36, true)
        end
      end
    elseif r0_36.GetAccessories then
      for r7_36, r8_36 in pairs(r0_36:GetAccessories()) do
        r8_36:InitAccessoryInfo(r8_36.AccessoryId)
      end
      -- close: r3_36
    end
    print(_G.LogTag, "LXZ OnCharacterReady", r0_36:GetName(), r0_36:IsMainPlayer(), r1_36.ChangeRole)
    if r0_36:IsMainPlayer() and not r1_36.ChangeRole then
      local r3_36 = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(r0_36, UE4.UFXPreloadGameInstanceSubsystem)
      if r3_36 then
        local r6_36 = DataMgr.Model[r0_36:GetCharModelComponent():GetCurrentModelId()].MontagePrefix
        if r6_36 and string.find(r6_36, "_") == string.len(r6_36) then
          r3_36:PreloadCharacterFX(string.sub(r6_36, 1, -2))
        end
      end
      r0_36:AddInteractiveTrigger()
      local r5_36 = UE4.UGameplayStatics.GetGameInstance(r0_36):GetLoadingUI()
      if r5_36 and r5_36.bIsInLoading then
        r0_36:SetCanInteractiveTrigger(false, "Loading")
      end
    end
    r0_36:SetInteractiveTriggerDistance(r0_36:GetAttr("DropDistance"))
    if r0_36:IsPlayer() and not r1_36.ChangeRole then
      local function r3_36()
        -- line: [807, 813] id: 37
        local r0_37 = UE4.URuntimeCommonFunctionLibrary.GetCurrentGameState(r0_36)
        if not r0_37.PlayerReady then
          r0_37.PlayerReady = true
          r0_37:TryEndLoading("PlayerReady")
        end
      end
      if IsAuthority(r0_36) then
        r0_36:InitRegionBattleStateObject()
        if r0_36:GetController() then
          local r4_36 = UE4.UGameplayStatics.GetGameMode(r0_36)
          local r5_36 = r0_36:GetController().AvatarEidStr
          if r4_36.LevelLoader and not r4_36.AlreadyInit then
            r4_36.LevelLoader:SetInitTrans(r0_36:GetOwner())
          end
          r4_36:OnCharacterReady(r5_36, r0_36)
          r4_36:TryTriggerOnInit(r5_36)
          r0_36:TryCreatePhantomBySquad(r4_36, r5_36)
        end
      else
        r3_36()
      end
      if IsStandAlone(r0_36) then
        r3_36()
      end
    end
    if IsDedicatedServer(r0_36) and IsAuthority(r0_36) then
      r0_36.ServerBornInfo = r0_36.BornInfo:ToEffectStruct()
    end
    r0_36:ZeroComboCount(UE4.EClearComboReason.Timelimit)
    r0_36.DontInitColor = true
    r0_36:HandleModelFashion()
    r0_36:RefreshActorHideTag()
    r0_36.Overridden.OnCharacterReady(r0_36)
    r0_36.Overridden.ReceiveBeginPlay(r0_36)
    r0_36:ReceiveOnCharacterReady()
    if not r0_36:IsMainPlayer() and (r0_36:IsPlayer() or r0_36:IsPhantom()) then
      EventManager:FireEvent(EventID.ShowTeammateBloodUI, r0_36.Eid, r0_36:IsPlayer(), r0_36)
    end
    if r0_36:IsMainPlayer() then
      if r1_36.ChangeRole then
        EventManager:FireEvent(EventID.ChangeRole)
      end
      r0_36:GetController():ForbidWeapon()
      if IsClient(r0_36) or IsStandAlone(r0_36) then
        r0_36:InitSceneStartUI()
      end
      EventManager:FireEvent(EventID.OnMainCharacterInitReady, r0_36.Eid)
      EventManager:FireEvent(EventID.OnCharacterInitSuitRecover)
    else
      EventManager:FireEvent(EventID.OnCharacterInitReady, r0_36.Eid)
    end
    if r0_36:IsPhantom() then
      EventManager:FireEvent(EventID.OnPhantomInitReady, r0_36.Eid)
    end
    if r1_36.ChangeRole then
      r0_36.WeaponPos = Const.Shoulder
      if not r0_36:IsNPC() then
        r0_36.EMAnimInstance = r0_36.Mesh:GetAnimInstance()
        if r0_36.EMAnimInstance and not r0_36.EMAnimInstance.Begining then
          r0_36.EMAnimInstance:AnimInstanceRestart()
        end
      else
        r0_36.NpcAnimInstance = r0_36.Mesh:GetAnimInstance()
        if r0_36.NpcAnimInstance and not r0_36.NpcAnimInstance.Begining then
          r0_36.NpcAnimInstance:AnimInstanceRestart()
        end
      end
    end
    if IsAuthority(r0_36) then
      r0_36:SetPlayerInfo(r1_36)
    end
    r0_36.InfoForInit.ChangeRole = true
  end,
  TryCreatePhantomBySquad = function(r0_38, r1_38, r2_38)
    -- line: [903, 924] id: 38
    if not r1_38:GetDungeonComponent() then
      DebugPrint("TryCreatePhantomBySquad not Valid", r0_38.Eid, r2_38)
      return 
    end
    if URuntimeCommonFunctionLibrary.IsWorldCompositionEnabled(r0_38) then
      if r1_38.AlreadyInit then
        DebugPrint("TryCreatePhantomBySquad WC AlreadyInit, Create", r0_38.Eid, r2_38)
        r0_38:CreatePhantomBySquad(r2_38, r1_38)
      else
        DebugPrint("TryCreatePhantomBySquad WC, Register to OnInit", r0_38.Eid, r2_38)
        r1_38.EMGameState:RegisterGameModeEvent("OnInit", r0_38, function()
          -- line: [915, 918] id: 39
          DebugPrint("TryCreatePhantomBySquad WC, Create", r0_38.Eid, r2_38)
          r0_38:CreatePhantomBySquad(r2_38, r1_38)
        end)
      end
    else
      DebugPrint("TryCreatePhantomBySquad not WC, Create", r0_38.Eid, r2_38)
      r0_38:CreatePhantomBySquad(r2_38, r1_38)
    end
  end,
  HandleModelFashion = function(r0_40)
    -- line: [926, 949] id: 40
    if not IsStandAlone(r0_40) and not IsClient(r0_40) then
      return 
    end
    if not r0_40.CharacterFashion then
      return 
    end
    r0_40.CharacterFashion:CreateAllDynamicMaterialNew()
    if not r0_40.BuffManager then
      return 
    end
    if r0_40.BuffManager.ChangeModelId > 0 then
      return 
    end
    if r0_40.DontInitColor then
      r0_40.DontInitColor = false
      return 
    end
    r0_40.CharacterFashion:InitColorsWithInfo()
  end,
  GetBossDestructableComponent = function(r0_41)
    -- line: [950, 969] id: 41
    local r1_41 = r0_41:K2_GetComponentsByClass(UDestructableBodyComponent:StaticClass())
    if r1_41:Num() == 0 then
      return 
    end
    r0_41.DestructParts = {}
    for r6_41, r7_41 in pairs(r1_41) do
      r0_41.DestructParts[r7_41.PartId] = r7_41
    end
    -- close: r2_41
    if not r0_41.SocketMap then
      r0_41.SocketMap = {}
    end
    if not r0_41.HpNum then
      r0_41.HpNum = 0
    end
    r0_41.MaxHpNum = r1_41:Num()
  end,
  PlayerCommonInit = function(r0_42, r1_42)
    -- line: [972, 980] id: 42
    if r0_42:IsPlayer() or r0_42:IsPhantom() then
      r0_42:SetupActionLogicPramas()
      r0_42:InitAnimIntanceParam()
      r0_42:InitAppearanceSuit(r1_42.AppearanceSuit and r0_42.BornInfo.AppearanceSuit)
    end
  end,
  GetNewSkinId = function(r0_43, r1_43)
    -- line: [982, 992] id: 43
    if not r1_43 then
      return CurrentSkinId
    end
    local r2_43 = r1_43:GetLuaTable("AppearanceSuit") and r0_43.BornInfo.AppearanceSuit
    if r2_43 and r2_43.SkinId then
      return r2_43.SkinId
    end
    return CurrentSkinId
  end,
  NewPlayerCommonInit = function(r0_44, r1_44)
    -- line: [994, 1002] id: 44
    if r0_44:IsPlayer() or r0_44:IsPhantom() then
      r0_44:SetupActionLogicPramas()
      r0_44:InitAnimIntanceParam()
      r0_44:InitAppearanceSuit(r1_44:GetLuaTable("AppearanceSuit") and r0_44.BornInfo.AppearanceSuit)
    end
  end,
  InitAnimIntanceParam = function(r0_45)
    -- line: [1004, 1020] id: 45
    if r0_45.EMAnimInstance then
      local r2_45 = DataMgr.Model[r0_45:GetCharModelComponent():GetCurrentModelId()]
      if r0_45.EMAnimInstance.RunStopStartTime then
        r0_45.EMAnimInstance.RunStopStartTime = r2_45.RunStopStartTime and Const.RunStopStartTime
      end
      r0_45:InitKawaiiParams(r2_45)
    end
    if r0_45.NpcAnimInstance then
      r0_45.NpcAnimInstance.RunStopStartTime = DataMgr.Model[r0_45:GetCharModelComponent():GetCurrentModelId()].RunStopStartTime and Const.RunStopStartTime
      r0_45:InitKawaiiParams(r2_45)
    end
  end,
  InitKawaiiParams = function(r0_46, r1_46)
    -- line: [1022, 1057] id: 46
    if r0_46.PlayerAnimInstance then
      if not r1_46.KawaiiIdList then
        local r2_46 = r0_46.PlayerAnimInstance
        local r3_46 = UE4.EKawaiiLayerState.EKLS_Default
        if r2_46.ArtDebugSwitch then
          r3_46 = UE4.EKawaiiLayerState.EKLS_Battle
        end
        r2_46:SetKawiiLayerState(r3_46)
        return 
      end
      for r6_46, r7_46 in pairs(r1_46.KawaiiIdList) do
        if DataMgr.KawaiiParams[r7_46] then
          local r8_46 = DataMgr.KawaiiParams[r7_46].KawaiiType
          r0_46.KawaiiIdMap:Add(r8_46, r7_46)
          print(_G.LogTag, "InitKawaiiParamsInitKawaiiParams", r8_46, r7_46)
        end
      end
      -- close: r2_46
      r0_46.PlayerAnimInstance:SetKawaiiPhysics_Cpp("LevelEnter")
    end
    if r0_46.NpcAnimInstance then
      if r1_46.KawaiiIdList then
        for r6_46, r7_46 in pairs(r1_46.KawaiiIdList) do
          if DataMgr.KawaiiParams[r7_46] then
            local r8_46 = DataMgr.KawaiiParams[r7_46].KawaiiType
            r0_46.KawaiiIdMap:Add(r8_46, r7_46)
            print(_G.LogTag, "InitKawaiiParamsInitKawaiiParams", r8_46, r7_46)
          end
        end
        -- close: r2_46
      end
      r0_46.NpcAnimInstance:SetKawaiiPhysics_Cpp("LevelEnter")
    end
  end,
  InitAppearanceSuit = function(r0_47, r1_47)
    -- line: [1059, 1070] id: 47
    if r1_47 then
      if r0_47.CharacterFashion then
        r0_47.CharacterFashion:InitAppearanceSuit(r1_47)
      end
      if r0_47.BornInfo then
        r0_47.BornInfo.AppearanceSuit = r1_47
      end
    else
      r0_47:ClearAllSuitItem()
    end
  end,
  SetStartLevelId = function(r0_48)
    -- line: [1072, 1084] id: 48
    local r1_48 = UE4.UGameplayStatics.GetGameMode(r0_48)
    if not r1_48 then
      return 
    end
    local r2_48 = r1_48:GetLevelLoader()
    if not r2_48 or not r2_48.enterLevelID or type(r2_48.enterLevelID) ~= "string" then
      return 
    end
    local r3_48 = TArray("")
    r3_48:Add(r2_48.enterLevelID)
    r0_48:SetCurrentLevelId(r3_48)
  end,
  JudgeIfPlayLevelEnter = function(r0_49)
    -- line: [1100, 1133] id: 49
    if r1_0.IsSimulatedProxy(r0_49) then
      return false
    end
    if not GWorld:GetAvatar() then
      return false
    end
    local r1_49 = r0_49:GetEMPlayerState()
    if r1_49 and r1_49.bIsEMInactive == true then
      DebugPrint("Tianyi@ 重连不需要LevelEnter")
      return false
    elseif not r1_49 then
      DebugPrint("Tianyi@ PlayState is nullptr")
    end
    local r2_49 = UE4.UGameplayStatics.GetCurrentLevelName(r0_49, true)
    local r3_49 = UE4.UGameplayStatics.GetGameInstance(r0_49)
    if r3_49.NeedPlayTempSceneMonstage then
      r3_49.NeedPlayTempSceneMonstage = false
      return false
    end
    local r4_49 = r3_49 and r3_49:GetCurrentDungeonId()
    if r4_49 and DataMgr.Dungeon[r4_49] and DataMgr.Dungeon[r4_49].IsPlayLevelEnter then
      return true
    end
    for r9_49, r10_49 in pairs(DataMgr.Dungeon) do
      if string.match(r10_49.DungeonMapFile, r2_49) and r10_49.IsPlayLevelEnter then
        return true
      end
    end
    -- close: r5_49
    return false
  end,
  CleanAllTimer = function(r0_50)
    -- line: [1135, 1139] id: 50
    r0_50.Overridden.CleanAllTimer(r0_50)
    r0_50:CleanTimer()
  end,
  OnCharacterInitSuitRecover = function(r0_51)
    -- line: [1142, 1151] id: 51
    local r1_51 = UE4.UGameplayStatics.GetGameMode(r0_51)
    local r2_51 = GWorld:GetAvatar()
    EventManager:RemoveEvent(EventID.OnCharacterInitSuitRecover, r0_51)
    if r0_51:IsMainPlayer() and IsValid(r1_51) and r2_51 and r2_51:CheckCurrentSubRegion() and (IsClient(r0_51) or IsStandAlone(r0_51)) then
      r1_51:InitRegionSuit(r2_51, r2_51:GetSubRegionId2RegionId())
    end
  end,
  SetInteractiveTriggerDistance = function(r0_52, r1_52)
    -- line: [1154, 1157] id: 52
    if not IsValid(r0_52.InteractiveTriggerComponent) then
      return 
    end
    r0_52.InteractiveTriggerComponent:SetInteractiveTriggerDistance(r1_52)
  end,
  CreatePhantomBySquad = function(r0_53, r1_53, r2_53)
    -- line: [1159, 1185] id: 53
    if r2_53 == nil or r1_53 == nil then
      DebugPrint("gmy@CharacterInitLogic Component:CreatePhantomBySquad", "invalid params", r1_53)
      return 
    end
    local r3_53 = r2_53.AvatarInfos
    if r3_53 == nil then
      DebugPrint("gmy@CharacterInitLogic Component:CreatePhantomBySquad", "invalid AvatarInfos", r1_53)
      return 
    end
    local r4_53 = r3_53[r1_53]
    if r4_53 == nil then
      DebugPrint("gmy@CharacterInitLogic Component:CreatePhantomBySquad", "invalid AvatarInfo", r1_53)
      return 
    end
    local r5_53 = r4_53.PhantomInfo
    if r5_53 then
      for r10_53, r11_53 in ipairs(r5_53) do
        if r11_53.RoleInfo and r11_53.RoleInfo.RoleId then
          r0_53:CreatePhantom(r11_53.RoleInfo.RoleId, 1, r11_53, {
            IsSpawnBySquad = 1,
            TeamIndex = r10_53,
          })
        end
      end
      -- close: r6_53
    end
  end,
}
