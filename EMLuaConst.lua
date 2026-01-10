-- filename: @C:/Pack/Branch/geili11\Content/Script/EMLuaConst.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  EMRandomSubSystem_MaxNumber = 10000,
  EMRandomSubSystem_MaxNumberPerTick = 1000,
  EMRandomSubSystem_TickInterval = 5,
}
local r1_0 = UE4.UUIFunctionLibrary.GetDevicePlatformName()
r0_0.EnableClientRpcDelay = Const.EnableClientRpcDelay
r0_0.PushMonsterOptimizationLevel = Const.PushMonsterOptimizationLevel
r0_0.BeginRagdollExecutePreFrame_PC = Const.BeginRagdollExecutePreFrame_PC
r0_0.BeginRagdollExecutePreFrame_IOS = Const.BeginRagdollExecutePreFrame_IOS
r0_0.BeginRagdollExecutePreFrame_Android = Const.BeginRagdollExecutePreFrame_Android
r0_0.bPlayerMoveDefferUpdateOverlap = true
if r1_0 == "Android" then
  r0_0.bPlayerPreloadSummon = Const.PlayerPreloadSummon_Android
  r0_0.bSummonDeadCache = Const.SummonDeadCache_Android
  r0_0.NPCDeadCache = Const.NPCDeadCache_Andriod
elseif r1_0 == "IOS" then
  r0_0.bPlayerPreloadSummon = Const.PlayerPreloadSummon_IOS
  r0_0.bSummonDeadCache = Const.SummonDeadCache_IOS
  r0_0.NPCDeadCache = Const.NPCDeadCache_IOS
  r0_0.bEnableClassCache = false
else
  r0_0.bPlayerPreloadSummon = Const.PlayerPreloadSummon_Windows
  r0_0.bSummonDeadCache = Const.SummonDeadCache_Windows
  r0_0.NPCDeadCache = Const.NPCDeadCache_Win
end
r0_0.bALSameLM = Const.bALSameLM
r0_0.bCNPCDelHide = Const.CNPCDelHide
if r1_0 == "Android" or r1_0 == "IOS" then
  r0_0.bCustomNPCUseSignificanceOpt = false
end
r0_0.AndroidPreloadCoefficient = 1.2
r0_0.PcPreloadCoefficient = 1
r0_0.IosPreloadCoefficient = 1
r0_0.RegionPreloadSupportSceneId = Const.RegionPreloadSupportSceneId
r0_0.RegionStoryPreloadSupportSceneId = Const.RegionStoryPreloadSupportSceneId
r0_0.EnableCacheSummonID = Const.EnableCacheSummonID
r0_0.SkillCreatureSpeed = Const.SkillCreatureSpeed
r0_0.DecalHeight = 2000
r0_0.DefaultSkillLevel = Const.DefaultSkillLevel
r0_0.DefaultSkillGrade = Const.DefaultSkillGrade
r0_0.DefaultPhantomSkillLevel = Const.DefaultPhantomSkillLevel
r0_0.DefaultPhantomSkillGrade = Const.DefaultPhantomSkillGrade
r0_0.ChargingFPS = 27
r0_0.CheckTimeAccelerationInterval = CommonConst.CheckTimeAccelerationInterval
r0_0.bShowDamageDetails = Const.bShowDamageDetails
r0_0.SkillFeatureEndCameraBlendType = EViewTargetBlendFunction.VTBlend_Linear
r0_0.EnableHitDelay = false
r0_0.IsOpenNpcInitOpt = Const.IsOpenNpcInitOpt
r0_0.IsNpcUseNavFixPawnLoc = Const.IsNpcUseNavFixPawnLoc
r0_0.EnableDynamicAIController = Const.EnableDynamicAIController
r0_0.EnableMonDeathOptimization = Const.bEnableMonDeathOptimization
r0_0.FlyAIControllerPath = Const.FlyAIControllerPath
r0_0.MonsterNeedCache = Const.MonsterNeedCache
r0_0.bSpawnAIUnitAddToEventQueue = Const.bSpawnAIUnitAddToEventQueue
r0_0.RegionPlayerInterType = "Biography"
r0_0.RegionPlayerInterId = 100032
r0_0.CheatReportInterval = -1000000
r0_0.bCloseWeaponMovementSync = Const.bCloseWeaponMovementSync
r0_0.bCloseBodyAccessoryItemMovementSync = Const.bCloseBodyAccessoryItemMovementSync
r0_0.bWeaponAndAccessoryItemHcc = Const.bWeaponAndAccessoryItemHcc
r0_0.bMonsterInitByPropertySync = Const.bMonsterInitByPropertySync
r0_0.IsOpenNetMultiClientOnly = Const.IsOpenNetMultiClientOnly
r0_0.OpenLookAtProtect = Const.OpenLookAtProtect
r0_0.bOpenPropertyEncryption = true
r0_0.AntiCheat_MonsterGatherWhiteListChars = {
  1502
}
r0_0.bOpenComputeDotBuff = false
r0_0.DungeonCheckMonsterZLocDist = 40000
r0_0.SyncNavModiferCullIsolatedTileNums = 1
r0_0.bEnableAndroidBackgroundLua = false
r0_0.bEnableIOSBackgroundLua = true
r0_0.IsShowRayCreature = Const.IsShowRayCreature
r0_0.IsOpenBulletCreature = Const.IsOpenBulletCreature
r0_0.IsOpenSkillCreature = Const.IsOpenSkillCreature
r0_0.IsOpenCreatureECS = Const.IsOpenCreatureECS
r0_0.MaxFilterDisSquare = 225000000
r0_0.bOpenComputeBattleAchievement = false
r0_0.MaxBatteryOneChar = Const.MaxBatteryOneChar
r0_0.MaxCrackKeyOneChar = Const.MaxCrackKeyOneChar
r0_0.DungeonFrameLoadBreakableItemMaxNum = Const.DungeonFrameLoadBreakableItemMaxNum
r0_0.bEnablePlayerRootMotionOptimizations = Const.bEnablePlayerRootMotionOptimizations
r0_0.OpenCritCompute = true
r0_0.OpenHatredCompute = true
r0_0.bIsEnableHotUpdate = true
r0_0.HotUpdateServerIdStr = "Default"
r0_0.PCInterativeTickCount = 5
r0_0.MobileInterativeTickCount = 3
r0_0.bEnableHideRegionPlayer = true
r0_0.RagdollClientMotorsAngularDriveParams = 1000
r0_0.LowMemoryDeviceNPCOptimize = Const.LowMemoryDeviceNPCOptimize
r0_0.FootstepFXSlowSpeed = Const.FootstepFXSlowSpeed
r0_0.FootstepFXFastSpeed = Const.FootstepFXFastSpeed
r0_0.OnlineNPCCreateOptimize = Const.OnlineNPCCreateOptimize
r0_0.LimitCreateCharacterNum_Low = 0
r0_0.HighFrequencyCheckGCInterval = 2
r0_0.bEnableClientMonsterOptimization = true
r0_0.RegionSyncSubsysEnable = true
r0_0.bSplitFrame_RefreshBloodBar = true
r0_0.SplitFrame_RefreshBloodBar_MaxTimes = 16
r0_0.bAutoChoosePhysicsAssetForOptimization = true
r0_0.bForceChoosePhysicsAssetOriginal = false
r0_0.bForceChoosePhysicsAssetLite = false
r0_0.bForceChoosePhysicsAssetMinimal = false
r0_0.bEnablePCGlobalAnimCache = false
r0_0.bEnableRegionAnimCache = true
r0_0.bEnableAnimCacheAsyncLoad = false
r0_0.bEnableSummonAnimCache = true
r0_0.bMonEnableExecuteInLuaDelegate = false
r0_0.bEnableAnimCacheRootMotion = true
r0_0.RootMotionSampleInterval = 1
r0_0.bMoveOpt_SkipSlideMove = true
r0_0.bMoveOpt_SkipRVONavigationCheck = true
r0_0.bMoveOpt_SweepIgnoreStatic = false
r0_0.bAsyncMonMovement = false
r0_0.bAsyncMonMoveTickInPhysThread = false
r0_0.EnableComputeThreadTick = true
r0_0.bEnableRegionPlayerUnitBudget = true
r0_0.bEnableLimitCreateCharacterNumDefault = false
r0_0.HookEllipsePCX = 0.74
r0_0.HookEllipsePCY = 0.82
r0_0.HookEllipseMoblieX = 0.82
r0_0.HookEllipseMoblieY = 0.95
r0_0.bShouldMobileReplacePath = true
r0_0.MapPCReplacePath = "Maps"
r0_0.MapMobileReplacePath = "Maps_Phone"
r0_0.bConditionalSkipMonsterReplication = true
return setmetatable({}, {
  __index = function(r0_1, r1_1)
    -- line: [194, 202] id: 1
    local r2_1 = rawget(r0_0, r1_1)
    if r2_1 then
      return r2_1
    end
    return rawget(r0_1, "EMLuaConstCpp").TempVars[r1_1]
  end,
  __newindex = function(r0_2, r1_2, r2_2)
    -- line: [203, 209] id: 2
    r0_0[r1_2] = r2_2
    local r3_2 = rawget(r0_2, "EMLuaConstCpp")
    if r3_2 then
      r3_2:RefreshVars()
    end
  end,
  __pairs = function(r0_3)
    -- line: [210, 210] id: 3
    return pairs(r0_0)
  end,
})
