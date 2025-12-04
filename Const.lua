-- filename: @E:/Pack/Branch/OBT10_Geili\Content/Script/Const.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  HOT_RELOAD = true,
  BattleHistoryTags = {
    "Skill",
    "Buff",
    "SkillEffect",
    "SkillCreature",
    "Summon",
    "Phantom",
    "MechanismSummon",
    "Mechanism",
    "Monster"
  },
  VectorSizeZero = 0.00001,
  NearZero = 0.0001,
  LittleOffset = 0.1,
  TestInt = 4,
  SlideSpeed = 5000,
  BulletJumpSpeed = 800,
  MaxJumpCount = 2,
  MaxBulletJumpCount = 1,
  SpeedLowGravity = 150,
  LowGravityScale = 1.5,
  HighGravityScale = 2.8,
  SlideBlendTime = 0.2,
  AvoidDeccelerTime = 0.03,
  DoSlideDelayTime = 0.1,
  DefaultCD = 0,
  BoneHitTime = 0.4,
  Shoulder = 1,
  Hand = 2,
  Blend = 3,
  NormalState = 0,
  FirstJump = 1,
  SecondJump = 2,
  BulletJump = 3,
  WallJump = 4,
  JumpFall = 5,
  Climb = 6,
  FlipEaves = 7,
  Flying = 8,
  JumpFunctionIndex = {
    "FirstJump",
    "SecondJump",
    "BulletJump",
    "WallJump"
  },
  BulletJumpDebug = false,
  DebugDruration = 3,
  ClimbHeight = 176.682999,
  RunStopStartTime = 0.13,
  TransplantSize = 500,
  NormalWallJump = "NormalWallJump",
  LeftSideWallJump = "LeftSideWallJump",
  RightSideWallJump = "RightSideWallJump",
  NormalWallJumpHeight = 300,
  SideWallJumpHeight = 400,
  SideWallJumpMultiply = 3,
  GapDistance = 30,
  GuidePointName = "GuideManBornLoc",
  FallAttackPointName = "BP_FallAttackPoint",
  Walking = 1,
  Falling = 3,
  Custom = 6,
  Slide = 2,
  InvincibleBuffId = 301,
  Forward = 0,
  Right = 1,
  Left = 2,
  Backward = 3,
  VelocityBlendInterpSpeed = 12,
  AimRotLerpSpeed = 30,
  FwdThresholdR = 22.5,
  FwdThresholdL = -22.5,
  FRThresholdR = 67.5,
  FLThresholdL = -67.5,
  RThresholdRB = 112.5,
  LThresholdLB = -112.5,
  BckThresholdR = 157.5,
  BckThresholdL = -157.5,
  FRThreshold = 60,
  FLThreshold = -60,
  BRThreshold = 120,
  BLThreshold = -120,
  Buffer = 5,
  AllQuestChainType = -1,
  MainQuestChainType = 1,
  DailyQuestChainType = 2,
  SideQuestChainType = 3,
  MainActivityQuestChainType = 6,
  LimTimeQuestChainType = 5,
  SpecialSideQuestChainType = 4,
  MontageBlendOutTime = 0.1,
  CrouchWalkSpeed = 160,
  NormalWalkSpeed = 500,
  MaxClimbHeight = 100,
  MinClimbHeight = 20,
  RST_World = 0,
  RST_Component = 2,
  UpVector = FVector(0, 0, 1),
  ZeroVector = FVector(0, 0, 0),
  OneVector = FVector(1, 1, 1),
  UpFootHeight = FVector(0, 0, 50),
  DownFootHeight = FVector(0, 0, 45),
  XAxisVector = FVector(1, 0, 0),
  FootCheckRadius = 15,
  FootHeight = 10,
  FootHeight2 = 9.5,
  IkFootBoneHeight = 13,
  ClampFootRot = 10,
  StandSlopeThreshold = 0.75,
  InterSpeedLevel0 = 5,
  InterSpeedLevel1 = 10,
  InterSpeedLevel2 = 15,
  InterSpeedLevel3 = 30,
  InterSpeedLevel4 = 40,
  EnterIKDelay = 1,
  DefaultAimRot = FRotator(0.5, 0.5, 0),
  RightAngle = 90,
  HalfRightAngle = 45,
  FlatAngle = 180,
  Angle270 = 270,
  FullAngle = 360,
  LowerPlayRate = 1.15,
  HigherPlayRate = 3,
  PushFactorSlide = 1,
  PushFactorBulletJump = 1,
  BulletClimbAngle = 45,
  Enemy = 0,
  Friend = 1,
  Neutral = 2,
  NormalAttack = "Attack",
  FallAttack = "FallAttack",
  HeavyAttack = "HeavyAttack",
  NormalSkill = "Skill1",
  UltraSkill = "Skill2",
  SummonRoleSupportSkill = "Skill3",
  SupportSkill = "Support",
  SlideSkill = "SlideAttack",
  FireSkill = "Shooting",
  HeavyShooting = "HeavyShooting",
  OverHeatSkill = "ShootingOverheat",
  ReloadSkill = "Reload",
  CondemnSkill = "Condemn",
  PassiveSkill = "Passive",
  ExtraPassiveSkill = "ExtraPassive",
  HomeBaseSubRegionId = 210101,
  IceCitySubRegionId = 101101,
  StopUnknown = 0,
  StopNormal = 1,
  StopBySkillCancel = 2,
  StopByWalkCancel = 3,
  StopBySlideCancel = 4,
  StateNormal = 0,
  StateHitFly = 2,
  StateHitFlyDown = 3,
  StateHeavyHit_1 = 4,
  StateHeavyHit_2 = 5,
  StateLightHit = 6,
  StateLightHitRanged = 7,
  Player = "Player",
  Monster = "Monster",
  First = 1,
  Second = 2,
  SimulatedProxy = 1,
  AutonomousProxy = 2,
  Authority = 3,
  AutoPickupDistance = 500,
  ManualPickupDistance = 100,
  LandHeavySpeed = -2000,
  SummonInheritAttrs = {
    MaxHp = 1,
    Hp = 1,
    MaxES = 1,
    ES = 1,
    DEF = 1,
    SkillRange = 1,
    SkillSustain = 1,
    SkillEfficiency = 1,
    SkillIntensity = 1,
  },
  HpAttrNames = {
    MaxHp = 1,
  },
  ATKAttrNames = {
    ATK = 1,
    WeaponATKModifierRate = 1,
  },
  WeaponAttrTable = {},
}
local r1_0 = {}
for r6_0, r7_0 in pairs(DataMgr.Attribute) do
  local r8_0 = "ATK_" .. r6_0
  r0_0.ATKAttrNames[r8_0] = 1
  r0_0.WeaponAttrTable[r8_0] = 1
  table.insert(r1_0, r8_0)
end
-- close: r2_0
local r2_0 = "WeaponModifierAttrs"
local r3_0 = {
  WeaponATKModifierRate = {
    AttrNames = r1_0,
    RateAttr = "WeaponATKModifierRate",
    ValueAttr = "WeaponATKModifierValue",
    CalcATK = 1,
    RateIndex = CommonConst.RateIndex.GlobalATK,
  },
}
r3_0.AttackSpeedModifierRate_Normal = {
  AttrNames = {
    "AttackSpeed_Normal"
  },
  RateAttr = "AttackSpeedModifierRate_Normal",
  ValueAttr = "AttackSpeedModifierValue_Normal",
}
r3_0.AttackSpeedModifierValue_Normal = {
  AttrNames = {
    "AttackSpeed_Normal"
  },
  RateAttr = "AttackSpeedModifierRate_Normal",
  ValueAttr = "AttackSpeedModifierValue_Normal",
}
r3_0.AttackRangeModifierRate_Normal = {
  AttrNames = {
    "AttackRange_Normal"
  },
  RateAttr = "AttackRangeModifierRate_Normal",
  ValueAttr = "AttackRangeModifierValue_Normal",
}
r3_0.AttackRangeModifierValue_Normal = {
  AttrNames = {
    "AttackRange_Normal"
  },
  RateAttr = "AttackRangeModifierRate_Normal",
  ValueAttr = "AttackRangeModifierValue_Normal",
}
r3_0.AttackRangeModifierRate_Bullet = {
  AttrNames = {
    "AttackRange_Bullet"
  },
  RateAttr = "AttackRangeModifierRate_Bullet",
  ValueAttr = "AttackRangeModifierValue_Bullet",
}
r3_0.AttackRangeModifierValue_Bullet = {
  AttrNames = {
    "AttackRange_Bullet"
  },
  RateAttr = "AttackRangeModifierRate_Bullet",
  ValueAttr = "AttackRangeModifierValue_Bullet",
}
r3_0.WeaponCRIModifierRate = {
  AttrNames = {
    "CRI"
  },
  RateAttr = "WeaponCRIModifierRate",
  ValueAttr = "WeaponCRIModifierValue",
}
r3_0.WeaponCRIModifierValue = {
  AttrNames = {
    "CRI"
  },
  RateAttr = "WeaponCRIModifierRate",
  ValueAttr = "WeaponCRIModifierValue",
}
r3_0.WeaponCRDModifierRate = {
  AttrNames = {
    "CRD"
  },
  RateAttr = "WeaponCRDModifierRate",
  ValueAttr = "WeaponCRDModifierValue",
}
r3_0.WeaponCRDModifierValue = {
  AttrNames = {
    "CRD"
  },
  RateAttr = "WeaponCRDModifierRate",
  ValueAttr = "WeaponCRDModifierValue",
}
r3_0.TriggerProbModifierRate = {
  AttrNames = {
    "TriggerProbability"
  },
  RateAttr = "TriggerProbModifierRate",
  ValueAttr = "TriggerProbModifierValue",
}
r3_0.TriggerProbModifierValue = {
  AttrNames = {
    "TriggerProbability"
  },
  RateAttr = "TriggerProbModifierRate",
  ValueAttr = "TriggerProbModifierValue",
}
r3_0.MultiShootModifierRate = {
  AttrNames = {
    "MultiShoot"
  },
  RateAttr = "MultiShootModifierRate",
  ValueAttr = "MultiShootModifierValue",
}
r3_0.MultiShootModifierValue = {
  AttrNames = {
    "MultiShoot"
  },
  RateAttr = "MultiShootModifierRate",
  ValueAttr = "MultiShootModifierValue",
}
r0_0[r2_0] = r3_0
r0_0.WeaponModifierAttrChangers = {
  AttackSpeed_Normal = {
    BattleEvent = "AttackSpeedNormalChanged",
  },
}
r0_0.ROLE_None = 0
r0_0.ROLE_SimulatedProxy = 1
r0_0.ROLE_AutonomousProxy = 2
r0_0.ROLE_Authority = 3
r0_0.ROLE_MAX = 4
r0_0.NM_Standalone = 0
r0_0.NM_DedicatedServer = 1
r0_0.NM_ListenServer = 2
r0_0.NM_Client = 3
r0_0.NM_MAX = 4
r0_0.StatePrepare = 0
r0_0.StateGameModeReady = 1
r0_0.StateRunning = 2
r0_0.StateAlert = 3
r0_0.StateBattle = 4
r0_0.StatePause = 5
r0_0.StateEnd = 6
r0_0.ExitStateAlert = 7
r0_0.StateBattleProgress = 99
r0_0.ProgressRecoverDungeonType = {
  Survival = true,
  SurvivalPro = true,
  SurvivalMini = true,
  Defence = true,
  Excavation = true,
  Rouge = true,
}
r0_0.DungeonEnd_NoReason = 0
r0_0.DungeonEnd_PlayerDead = 1
r0_0.DungeonEnd_DefenceCoreDead = 2
r0_0.GameModeEventServer = 0
r0_0.GameModeEventServerClient = 1
r0_0.AimProtectYaw = 175
r0_0.MaXRotPercent = 0.12
r0_0.ShootAimLengthLR = 1
r0_0.ShootAimLengthDU = 1
r0_0.CrouchHalfHeight = 67.5
r0_0.CrouchShrinkSpeed = 160
r0_0.SlideHalfHeight = 45
r0_0.SlideShrinkSpeed = 200
r0_0.BulletJumpHalfHeight = 44
r0_0.BulletJumpShrinkSpeed = 160
r0_0.SecondJumpHalfHeight = 44
r0_0.SecondJumpShrinkSpeed = 160
r0_0.WallJumpHalfHeight = 44
r0_0.WallJumpShrinkSpeed = 160
r0_0.CreateType = {
  Monster = 1,
  Npc = 1,
  CombatProp = 1,
  BattleChar = 1,
  Mechanism = 2,
  Phantom = 1,
}
r0_0.ScreenFadeMat = "Material\'/Game/Asset/Char/Player/Common/Material/PP/MI_PP_ScreenFade.MI_PP_ScreenFade\'"
r0_0.HitToLevel = {
  BoneHit = 1,
  LightHit = 2,
  LightHitRanged = 2,
  HeavyHit = 3,
  HitRepel = 4,
  HitFly = 5,
  GrabHit = 6,
}
r0_0.LevelToHit = {
  "BoneHit",
  "LightHit",
  "HeavyHit",
  "HitRepel",
  "HitFly",
  "GrabHit"
}
r0_0.CauseHitTypeNormal = 0
r0_0.CauseHitTypeFirst = 1
r0_0.CauseHitTypeDie = 2
r0_0.NormalStateInAlert = 0
r0_0.AlertState = 1
r0_0.FightState = 2
r0_0.EndBattleState = 3
r0_0.YXDNewState = 99
r0_0.PresetNone = 0
r0_0.PresetPlayer = 1
r0_0.PresetMechanism = 2
r0_0.SurvivalResourceItemId = 1006
r0_0.DefaultRoleId = 1101
r0_0.DeafaultMeleeWeapon = nil
r0_0.DeafaultRangedWeapon = nil
r0_0.DefaultBattlePet = 101
r0_0.DefaultPetLocation = FVector(0, 50, 0)
r0_0.RandomLimitedPetRarity = 4
r0_0.NvZhuRoleId = 101
r0_0.NanZhuRoleId = 104
r0_0.DefaultKawaiiLinkLayer = "AnimBlueprint\'/Game/AssetDesign/Char/Player/Heitao/ABP_Heitao_Kawaii.ABP_Heitao_Kawaii\'"
r0_0.MouthSlotName = "FacialMouth"
r0_0.EyeSlotName = "FacialMouth"
r0_0.RougeLikeBuff = 10101101
r0_0.BuffDotDuration = 10
r0_0.BuffDotDamage = "Dot"
r0_0.BuffDotHot = "Hot"
r0_0.BuffDotAddShield = "AddShield"
r0_0.BuffDotSkillEffect = "SkillEffect"
r0_0.BuffDotSpChange = "SpChange"
r0_0.BuffDefaultFresnelParams = {
  FresnelColor = {
    0.953125,
    0.677123,
    0.541725,
    0
  },
  FresnelColorRange = {
    Default = 0,
  },
  FresnelColorStrength = {
    Default = 0,
  },
}
r0_0.BuffDefaultNextPassParams = {
  NextPassShowyColor = {
    0,
    0,
    0,
    0
  },
  NextPassShowy = {
    Default = 0,
  },
  NextPassShowyWidth = {
    Default = 0.3,
  },
}
r0_0.PathTypeNoNav = 0
r0_0.PathTypeNoPath = 1
r0_0.PathTypeHasPath = 2
r0_0.EmojiIdleDelay = 5
r0_0.EmoIdleVoiceCoolDown = 60
r0_0.WholeShootHoldTime = 10
r0_0.StopShootHoldDelay = 2
r0_0.ExtraFixVitamin = {
  "Mon.Strong.Poison"
}
r0_0.BossMonster = {
  "Mon.Boss"
}
r0_0.StrongMonster = {
  "Mon.Strong"
}
r0_0.EliteMonster = {
  "Mon.Elite"
}
r0_0.SummonLightMonster = {
  "Mon.Summon.Light"
}
r0_0.CaptureMonster = {
  "Mon.Capture"
}
r0_0.InvisibleMonster = {
  "Mon.Invisible"
}
r0_0.SurvivalPoisonMonster = {
  "Mon.SurvivalPoison"
}
r0_0.StrongBloodMonster = {
  "Mon.Strong.Blood"
}
r0_0.StrongBurstMonster = {
  "Mon.Strong.Burst"
}
r0_0.StrongFadeMonster = {
  "Mon.Strong.Fade"
}
r0_0.StrongFrozenMonster = {
  "Mon.Strong.Frozen"
}
r0_0.StrongPoisonMonster = {
  "Mon.Strong.Poison"
}
r0_0.StrongShieldMonster = {
  "Mon.Strong.Shield"
}
r0_0.StrongThunderMonster = {
  "Mon.Strong.Thunder"
}
r0_0.MinusFindPathDist = 2000
r0_0.InitialCollisionProfileName = "meshcollision"
r0_0.HittedCollisionProfileName = "Ragdoll"
r0_0.DefaultBuffCollisionProfileName = "Ragdoll"
r0_0.ECreatorInit = 0
r0_0.ECreateSuccess = 1
r0_0.ELevelUnloaded = 2
r0_0.AllSKillNames = {
  ESkillName.Skill1,
  ESkillName.Skill2,
  ESkillName.Skill3,
  ESkillName.Passive,
  ESkillName.Attack,
  ESkillName.FallAttack,
  ESkillName.HeavyAttack,
  ESkillName.SlideAttack,
  ESkillName.Fire,
  ESkillName.ChargeBullet,
  ESkillName.HeavyShooting
}
r0_0.ArmoryIdleTags = {
  None = "None",
  Armory = "Armory",
  Armory_Mod = "Armory_Mod",
  Armory_Grade = "Armory_Grade",
  Armory_Pet = "Armory_Pet",
}
r0_0.ArmoryActionIdToArmoryTag = {
  [1] = "Melee",
  [2] = "Ranged",
  [3] = "Armory",
  [4] = "Ultra",
  [5] = "Armory_Grade",
}
r0_0.MaxBatteryOneChar = 4
r0_0.MaxCrackKeyOneChar = 1
r0_0.MainCityID = 2101
r0_0.DefaultMainCityFile = "/Game/Maps/Chapter01_HomeBase"
r0_0.DefaultLoginSceneFile = "/Game/Maps/Login"
r0_0.DefaultMainCityRegionId = 210101
r0_0.DefaultPrologueRegionId = 100103
r0_0.BigIceLakeRegionId = 1011
r0_0.BaseSummonOffset = 100
r2_0 = r0_0.BaseSummonOffset
r0_0.SummonOffset = {}
r0_0.HitFlyHeightMinValue = 50
for r6_0 = 0, 2, 1 do
  for r10_0 = 0, r6_0, 1 do
    local r11_0 = r6_0 - r10_0
    if r11_0 == 0 and r10_0 == 0 then
      table.insert(r0_0.SummonOffset, {
        r11_0 * r2_0,
        r10_0 * r2_0
      })
    elseif r11_0 == 0 then
      table.insert(r0_0.SummonOffset, {
        r11_0 * r2_0,
        r10_0 * r2_0
      })
      table.insert(r0_0.SummonOffset, {
        r11_0 * r2_0,
        -r10_0 * r2_0
      })
    elseif r10_0 == 0 then
      table.insert(r0_0.SummonOffset, {
        r11_0 * r2_0,
        r10_0 * r2_0
      })
      table.insert(r0_0.SummonOffset, {
        -r11_0 * r2_0,
        r10_0 * r2_0
      })
    else
      table.insert(r0_0.SummonOffset, {
        r11_0 * r2_0,
        r10_0 * r2_0
      })
      table.insert(r0_0.SummonOffset, {
        -r11_0 * r2_0,
        r10_0 * r2_0
      })
      table.insert(r0_0.SummonOffset, {
        r11_0 * r2_0,
        -r10_0 * r2_0
      })
      table.insert(r0_0.SummonOffset, {
        -r11_0 * r2_0,
        -r10_0 * r2_0
      })
    end
  end
end
r0_0.AttrLimit = {}
for r7_0, r8_0 in pairs(DataMgr.AttrLimit) do
  local r9_0 = r8_0.AttachAttrName
  if r9_0 then
    r9_0 = r0_0.AttrLimit
    local r10_0 = r8_0.AttachAttrName
    local r11_0 = r8_0.LimitValue
    r9_0[r10_0] = r11_0
  end
end
-- close: r3_0
r0_0.PlayerRecoverySkill = 20
r0_0.PlayerCondemnSkill = 30
r0_0.EmptyTNHpPercent = 0.3
r0_0.DefaultWeaponArmSocket = "root_point"
r0_0.UseLocation = {
  Weapon = "Weapon",
  ChildWeapon = "ChildWeapon",
  Target = "Target",
  Char = "Char",
}
r0_0.DefaultSkillLevel = 1
r0_0.DefaultSkillGrade = 0
r0_0.DefaultCharGrade = 0
r0_0.DefaultWeaponGrade = 0
r0_0.DefaultPhantomSkillLevel = 1
r0_0.DefaultPhantomSkillGrade = 0
r0_0.MontageSuffix = "_Montage"
r0_0.GravityAcceleration = -980
r0_0.BodyAccessoryDropFrameCount = 3
r0_0.ShortPressThreshold = 0.3
r0_0.LongPressThreshold = 1.5
r0_0.TalkUIDeactiveTimeThreshold = 3
r0_0.TalkState_IsInTalk = "IsInTalk"
r0_0.TalkState_DisableMonsterSpawn = "DisableMonsterSpawn"
r0_0.TalkState_HiddenGameUI = "HiddenGameUI"
r0_0.Tag_GamePausedByTalk = "PausedByTalk"
r0_0.Talk_LevelSequenceActorPath = "/Game/BluePrints/Story/Talk/Base/BP_TalkSequenceActor.BP_TalkSequenceActor_C"
r0_0.MaxFloorDetection = 2000
r0_0.BuffEffectInterval = 2
r0_0.SkillCreatureSpeed = 1
r0_0.TalkSoundKey = "Talk_VO"
r0_0.ReviewSoundKey = "Review_VO"
r0_0.DialogueEffectSoundKey = "DialogueEffectSoundKey"
r0_0.TalkActionMontageGroupName = "TalkGroup"
r0_0.CharacterFacialMouthMontageGroupName = "TalkFacialMouth"
r0_0.CharacterFacialEyeMontageGroupName = "TalkFacialEye"
r0_0.ForceEndInteractive = 1
r0_0.NormalEndInteractive = 0
r0_0.NoInteractive = 0
r0_0.InteractiveStart = 1
r0_0.InteractiveWaitToEnd = 2
r0_0.ClickInteractive = 1
r0_0.PressInteractive = 2
r0_0.EndByTargetInteractive = 3
r0_0.EnableTaskPrintError = true
r0_0.OpenFramingCreateUnit = {
  Npc = true,
  Monster = true,
  Drop = true,
  Mechanism = true,
}
r0_0.RegionSerializeUnitType = {
  Npc = 1,
  Monster = 1,
  Drop = 1,
  Mechanism = 1,
  Pet = 1,
  Phantom = 1,
}
r0_0.FrameCreateUnitCount = {
  Npc = 1,
  Monster = 1,
  Drop = 1,
  Mechanism = 1,
}
r0_0.MonsterCullDistance = 7000
r0_0.EnableTickLod = true
r0_0.EnableDungeonAssetsPreload = true
r0_0.DataMgrGCUseCount = 20
r0_0.DataMgrGCTablePercent = 0.5
r0_0.SkillCreaturePoolRefreshTime = 20
r0_0.SkillCreaturePoolCleanTime = 60
r0_0.SkillCreaturePoolDefaultPreloadNum = 100
r0_0.EnableMonsterPreloadPackage = true
r0_0.EnableNpcPreloadPackage = true
r0_0.OptimizationRegionRPC = true
r0_0.bSkipEQSTestWhilePlatformWarning = false
r0_0.NumOfEQSItemWhilePlatformWarning = 5
r0_0.EnablePlayerPreload = true
r0_0.EnableDungeonPhantomPreload = true
r0_0.EnableMonLevelChecker = true
r0_0.AndroidPlayDeathEffectDist = 1500
r0_0.EnableClientRpcDelay = true
r0_0.PushMonsterOptimizationLevel = 2
r0_0.BeginRagdollExecutePreFrame_PC = 3
r0_0.BeginRagdollExecutePreFrame_IOS = 3
r0_0.BeginRagdollExecutePreFrame_Android = 1
r0_0.bEnablePlayerRootMotionOptimizations = true
r0_0.CharResourcePaths = {
  DistructableBodyBp = "/Game/BluePrints/Item/AccessoryItems/BP_DestructablePart.BP_DestructablePart_C",
  AccessoryBP = "/Game/BluePrints/Item/AccessoryItems/BP_BodyAccessoryItem.BP_BodyAccessoryItem_C",
  StaticAccessoryBP = "/Game/BluePrints/Item/AccessoryItems/BP_BodyAccessoryStaticItem.BP_BodyAccessoryStaticItem_C",
}
r0_0.FixTraceChannel = {
  TraceCreatureHit = ETraceTypeQuery.TraceCreatureHit,
  TraceScene = ETraceTypeQuery.TraceScene,
}
r0_0.BlockTickLodTag = {
  SceneGuide = "SceneGuide",
  CharBillboard = "CharBillboard",
}
r0_0.EDungeonUIState = {
  None = 0,
  BeforeTarget = 1,
  OnTarget = 2,
  AfterTarget = 3,
}
r0_0.BrushStaticMesh = {
  "SM_Zhanshijia_01",
  "地图B",
  "地图贴纸"
}
r0_0.CharWaitInitTag = {
  AssetsLoading = "AssetsLoading",
  OverlapCheck = "OverlapCheck",
  HideInTalk = "HideInTalk",
}
r0_0.EnableDynamicAIController = true
r0_0.FlyAIControllerPath = "/Game/BluePrints/AI/BP_EMMonFlyAIController.BP_EMMonFlyAIController_C"
r0_0.DefaultAIControllerPath = "/Game/BluePrints/AI/BP_EMAIController.BP_EMAIController_C"
r0_0.EnableBornOverlapCheck = true
r0_0.MonsterPushFactor = 1.5
r0_0.MonsterMinPushVelocity = 200
r0_0.MonsterOverlapPushVelocity = 1000
r0_0.Patrol = 3
r0_0.Command = 4
r0_0.MaxLoadingPercentage = 100
r0_0.LoadingTipsInterval = 15
r0_0.MaxRecoverValue = 100
r0_0.BossTNToZeroRecoverTickInterival = 0.1
r0_0.MonsterTNRecoverTickInterival = 1
r0_0.BossTNRecoverTickFrequency = 30
r0_0.DefaultHUDScale = 100
r0_0.MinHUDScale = 50
r0_0.MaxHUDScale = 150
r0_0.ROLE_None = 0
r0_0.ROLE_SimulatedProxy = 1
r0_0.ROLE_AutonomousProxy = 2
r0_0.ROLE_Authority = 3
r0_0.ROLE_MAX = 4
r0_0.SkillFeatureHideTag = "SkillFeature"
r0_0.ImmersionModelHideTag = "ImmersionModel"
r0_0.MiniGameHideTag = "MiniGame"
r0_0.TalkHideTag = "Talk"
r0_0.ShowUIOnlyTag = "DoShowUIOnly"
r0_0.BattleResurgenceHidTag = "BattleResurgence"
r0_0.BlackScreenHideTag = "BlackScreen"
r0_0.DungeonSettlementHideTag = "DungeonSettlement"
r0_0.GuideMainHideTag = "GuideMain"
r0_0.BossBattleOpenHideTag = "BossBattleOpen"
r0_0.LevelSequenceStateRecorderTag = "LevelSequenceStateRecorder"
r0_0.Common = 0
r0_0.Hijack = 1
r0_0.RougeLike = 2
r0_0.GatherMaxTime = 5
r0_0.MinTimeDilation = 0.001
r0_0.Skill = "Skill"
r0_0.Melee = "Melee"
r0_0.Ranged = "Ranged"
r0_0.SequenceNpcMeshBoundScale = 5
r0_0.BreakableJsonPath = "Script/Datas/Houdini_data/Prologue/PrologueBreakableFile/"
r0_0.ScalabilityUpdateTime = 0
r0_0.ScalabilityLevelVeryLow = 0
r0_0.ScalabilityLevelLow = 1
r0_0.ScalabilityLevelMiddle = 2
r0_0.ScalabilityLevelHigh = 3
r0_0.ScalabilityLevelVeryHigh = 4
r0_0.BanSmallLevelScalabilityLevel = {}
r0_0.CutTNLevelThreshold = 10
r0_0.CutTNLevelModifer = 1
r0_0.AccessEnterDefeated = 0
r0_0.CantEnterDefeated = 1
r0_0.DefeatedStopNotify = 2
r0_0.DefeatedEndToIdle = 3
r0_0.ClearCombo_Timelimit = 0
r0_0.ClearCombo_Dead = 1
r0_0.ClearCombo_SkillEffect = 2
r0_0.ClearCombo_DisableUltraWeapon = 3
r0_0.ClearCombo_ChangeWeapon = 4
r0_0.MaxPhantomNum = 2
r0_0.MaxPhantomNum2Player = 1
r0_0.MaxPhantomNumOver2Player = 0
r0_0.SavePickupType = {
  GetWeapon = 1,
  GetMod = 1,
  GetResource = 1,
}
r0_0.Popup_GetProduceItem = 100017
r0_0.Popup_StartProduce = 100014
r0_0.Popup_CancelProduce = 100154
r0_0.Popup_BatchStartProduce = 100153
r0_0.Popup_AccerateProduce = 100018
r0_0.Popup_ConfirmLockedMod = 100098
r0_0.Popup_ConfirmUpgradedMod = 100099
r0_0.StunTag = "Stun"
r0_0.DS_Default_GroupId = 102
r0_0.DSVersion = 0
r0_0.NetWorkFailure_Tag = "NetWorkFailure"
r0_0.NET_CLIENT_SEND_HEARTBEAT_TIME = 60
r0_0.NET_CLIENT_HEARTBEAT_WARNING = 5
r0_0.NET_CLIENT_HEARTBEAT_TIMEOUT = 13
r0_0.DefaultResetPressSkillId = 0
r0_0.UseOriginSkillId = -1
r0_0.Popup_SecondConfirm = 100027
r0_0.Popup_CombatData = 100052
r0_0.RoleBarLength = 202.5
r0_0.BattleCharTagVXScaleTable = {
  Loli = {
    0.8,
    0.8,
    0.8
  },
  Girl = {
    1,
    1,
    1
  },
  Man = {
    1.2,
    1.2,
    1.2
  },
  Woman = {
    1.1,
    1.1,
    1.1
  },
  Boy = {
    1,
    1,
    1
  },
}
r0_0.Popup_ModUpgrade = 100045
r0_0.Popup_ModPolarity = 100050
r0_0.Popup_ModAutoPutOn = 100066
r0_0.BarriyBuffId = 50
r0_0.CrackKeyBuffId = 51
r0_0.SkillFeatureCD = 30
r0_0.bEnableSkillFeatureCD = true
r0_0.bHideSkillCD = 1
r0_0.DungeonBgBluePrint = "/Game/UI/UI_PC/LevelSelect/LevelSelect_Bg/LevelSelect_Bg_Training.LevelSelect_Bg_Training"
r0_0.BloodBarAnimTime = 0.3
r0_0.BloodBarDelayTime = 0.1
r0_0.SignalStrength = {
  30,
  90,
  150
}
r0_0.PlayerSignatureIllegal = 26005
r0_0.PlayerNicknameIllegal = 26006
r0_0.BattleTip_CommonTop_CD = 0.5
r0_0.BehaviorId = {
  Stroll = 0,
  LoopMontage = 1,
  MontageList = 2,
  Patrol = 3,
  Command = 4,
}
r0_0.TestGMRegionType = {
  NoneTest = 0,
  OnlyServer = 1,
  CompareServer = 2,
}
r0_0.RegionDataTypeDebugText = {
  "非存储数据",
  "关卡数据, 永不卸载",
  "任务数据",
  "探索组数据",
  "Boss数据",
  "关卡数据, 每一天清除",
  "关卡数据, 每三天清除",
  "关卡数据, 每一周清除",
  "跨任务数据"
}
r0_0.RegionDataStorageType = {
  ERegionDataType.RDT_CommonData,
  ERegionDataType.RDT_RarelyData,
  ERegionDataType.RDT_CommonDailyData,
  ERegionDataType.RDT_CommonTriduumData,
  ERegionDataType.RDT_CommonWeeklyData,
  ERegionDataType.RDT_CommonQuestData
}
r0_0.RougeSliceInfoType = {
  None = 0,
  RecoverCount = 1,
  TreasureMonCount = 2,
  BlueprintValue = 3,
}
r0_0.DUNGEON_MATCH_BAR_STATE = {
  SPONSOR_WAITING_CONFIRM = 1,
  TEAMMATE_CONFIRMING = 2,
  TEAMMATE_WAITING_CONFIRMING = 3,
  WAITING_MATCHING = 4,
  WAITING_MATCHING_WITH_CANCEL = 5,
  WAITING_ENTER_DUNGEON = 6,
}
r0_0.CampType = {
  Monster = ECampName.Monster,
  Player = ECampName.Player,
  DefenceCore = ECampName.DefenceCore,
  NPC = ECampName.NPC,
  Neutral = ECampName.Neutral,
  Hostile = ECampName.Hostile,
}
r0_0.EnableCreateUnitLog = false
r0_0.IsOpenNpcInitOpt = true
r0_0.EnableFXOptimization = true
r0_0.ToughnessTimeDilation = 0.33
r0_0.ToughnessShowBloodTip = 0.4
r0_0.ToughnessClose = 0.76
r0_0.PlayerHandAimSpeedRate = 0.9
r0_0.InVaildModUnlockLevel = 99
r0_0.PlaySoundAsync = true
r0_0.EveryAttackLimitSeNum = 3
r0_0.RomanNum = {
  "Ⅰ",
  "Ⅱ",
  "Ⅲ",
  "Ⅳ",
  "Ⅴ",
  "Ⅵ",
  "Ⅶ",
  "Ⅷ",
  "Ⅸ",
  "Ⅹ",
  "Ⅺ",
  "Ⅻ"
}
r0_0.IndexNum = {
  "①",
  "②",
  "③",
  "④",
  "⑤",
  "⑥",
  "⑦",
  "⑧",
  "⑨",
  "⑩"
}
r0_0.bShowDamageDetails = false
r0_0.bEditorOpenFXBudget = true
r0_0.DialogueSnapShot = {
  HEART = 1,
  MEMORY = 2,
  MYSTERIOUS = 3,
  MONSTER = 4,
  TELEPHONE = 5,
  OUTDOOR = 6,
  ELECTRIC = 7,
  BROADCAST = 8,
  ECHO = 9,
}
r0_0.DungeonFrameLoadBreakableItemMaxNum = 2
r0_0.MaxDungeonMonNum = 60
r0_0.bOverrideHLODDistance = false
r0_0.HLODDistanceDefault = {
  [0] = 12000,
  [1] = 13000,
  [2] = 15000,
  [3] = 16000,
  [4] = 18000,
}
r0_0.HLODDistanceAndroid = {
  [0] = 3000,
  [1] = 3000,
  [2] = 3000,
  [3] = 4000,
  [4] = 4000,
}
r0_0.PCRealStreamingDistanceRatio = {
  [0] = 1,
  [1] = 1.1,
  [2] = 1.2,
  [3] = 1.3,
  [4] = 1.5,
}
r0_0.AndroidRealStreamingDistanceRatio = {
  [0] = 0.9,
  [1] = 0.95,
  [2] = 1,
  [3] = 1.2,
  [4] = 1.3,
}
r0_0.IOSRealStreamingDistanceRatio = {
  [0] = 0.9,
  [1] = 0.95,
  [2] = 1,
  [3] = 1.2,
  [4] = 1.3,
}
r0_0.IOSSerializeDistanceRatio = {
  [0] = 0.8,
  [1] = 0.9,
  [2] = 1,
  [3] = 1,
  [4] = 1,
}
r0_0.CanUnloadNavMeshLevel = true
r0_0.SimulateMovementDebugPlatform = ""
r0_0.CheckDungeonMonId = false
r0_0.PreFrameRealInitNum = 1
r0_0.MonDeathTaskNumPreFrame = 1
r0_0.bEnableMonDeathOptimization = true
r0_0.bCloseWeaponMovementSync = true
r0_0.bCloseBodyAccessoryItemMovementSync = true
r0_0.bSpawnAIUnitAddToEventQueue = true
r0_0.bWeaponAndAccessoryItemHcc = true
r0_0.bMonsterInitByPropertySync = true
r0_0.OpenLookAtProtect = true
r0_0.StandAloneMonsterCanCache = true
r0_0.OnlineMonsterCanCache = true
r0_0.DungeonPreloadMonster = true
r0_0.MonsterNeedCache = true
r0_0.MonsterCanSpawnFromCache = true
r0_0.SummonDeadCache_Windows = false
r0_0.SummonDeadCache_Android = false
r0_0.SummonDeadCache_IOS = false
r0_0.PlayerPreloadSummon_Windows = false
r0_0.PlayerPreloadSummon_Android = false
r0_0.PlayerPreloadSummon_IOS = false
r0_0.NPCDeadCache_Win = true
r0_0.NPCDeadCache_IOS = false
r0_0.NPCDeadCache_Andriod = true
r0_0.LowMemoryDeviceNPCOptimize = true
r0_0.OnlineNPCCreateOptimize = true
r0_0.NeedStoreSTLBGM = true
r0_0.FootstepFXSlowSpeed = 230
r0_0.GamepadSpecialLeft = "Gamepad_Special_Left"
r0_0.GamepadSpecialRight = "Gamepad_Special_Right"
r0_0.GamepadDPadLeft = "Gamepad_DPad_Left"
r0_0.GamepadDPadRight = "Gamepad_DPad_Right"
r0_0.GamepadDPadUp = "Gamepad_DPad_Up"
r0_0.GamepadDPadDown = "Gamepad_DPad_Down"
r0_0.GamepadFaceButtonLeft = "Gamepad_FaceButton_Left"
r0_0.GamepadFaceButtonRight = "Gamepad_FaceButton_Right"
r0_0.GamepadFaceButtonUp = "Gamepad_FaceButton_Top"
r0_0.GamepadFaceButtonDown = "Gamepad_FaceButton_Bottom"
r0_0.GamepadLeftShoulder = "Gamepad_LeftShoulder"
r0_0.GamepadLeftTrigger = "Gamepad_LeftTrigger"
r0_0.GamepadRightShoulder = "Gamepad_RightShoulder"
r0_0.GamepadRightTrigger = "Gamepad_RightTrigger"
r0_0.GamepadRightThumbstick = "Gamepad_RightThumbstick"
r0_0.GamepadLeftThumbstick = "Gamepad_LeftThumbstick"
r0_0.LeftStickUp = "Gamepad_LeftStick_Up"
r0_0.LeftStickDown = "Gamepad_LeftStick_Down"
r0_0.LeftStickRight = "Gamepad_LeftStick_Right"
r0_0.LeftStickLeft = "Gamepad_LeftStick_Left"
r0_0.RightStickUp = "Gamepad_RightStick_Up"
r0_0.RightStickDown = "Gamepad_RightStick_Down"
r0_0.RightStickRight = "Gamepad_RightStick_Right"
r0_0.RightStickLeft = "Gamepad_RightStick_Left"
r0_0.ShortKeyToGamePadKey = {
  Menu = r0_0.GamepadSpecialRight,
  View = r0_0.GamepadSpecialLeft,
  A = r0_0.GamepadFaceButtonDown,
  B = r0_0.GamepadFaceButtonRight,
  X = r0_0.GamepadFaceButtonLeft,
  Y = r0_0.GamepadFaceButtonUp,
  LB = r0_0.GamepadLeftShoulder,
  RB = r0_0.GamepadRightShoulder,
  LT = r0_0.GamepadLeftTrigger,
  RT = r0_0.GamepadRightTrigger,
  LS = r0_0.GamepadLeftThumbstick,
  RS = r0_0.GamepadRightThumbstick,
  Up = r0_0.GamepadDPadUp,
  Down = r0_0.GamepadDPadDown,
  Left = r0_0.GamepadDPadLeft,
  Right = r0_0.GamepadDPadRight,
}
r0_0.ForceFeedbackScale = {
  1,
  0.6,
  0.2
}
r0_0.StandAloneNoWalnutTipsTime = 2
r0_0.WalnutNumberIconPath = {
  "/Game/UI/Texture/Dynamic/Atlas/Walnut/T_Walnut_Num0.T_Walnut_Num0",
  "/Game/UI/Texture/Dynamic/Atlas/Walnut/T_Walnut_Num1.T_Walnut_Num1",
  "/Game/UI/Texture/Dynamic/Atlas/Walnut/T_Walnut_Num2.T_Walnut_Num2",
  "/Game/UI/Texture/Dynamic/Atlas/Walnut/T_Walnut_Num3.T_Walnut_Num3",
  "/Game/UI/Texture/Dynamic/Atlas/Walnut/T_Walnut_Num4.T_Walnut_Num4",
  "/Game/UI/Texture/Dynamic/Atlas/Walnut/T_Walnut_Num5.T_Walnut_Num5",
  "/Game/UI/Texture/Dynamic/Atlas/Walnut/T_Walnut_Num6.T_Walnut_Num6",
  "/Game/UI/Texture/Dynamic/Atlas/Walnut/T_Walnut_Num7.T_Walnut_Num7",
  "/Game/UI/Texture/Dynamic/Atlas/Walnut/T_Walnut_Num8.T_Walnut_Num8",
  "/Game/UI/Texture/Dynamic/Atlas/Walnut/T_Walnut_Num9.T_Walnut_Num9",
  "/Game/UI/Texture/Dynamic/Atlas/Walnut/T_Walnut_Num10.T_Walnut_Num10"
}
r0_0.DeputeType = {
  RegularDepute = 1,
  NightFlightManualDepute = 2,
  WalnutDepute = 3,
  DeputeWeekly = 4,
}
r0_0.UnBorn = -1
r0_0.Borning = 0
r0_0.Bonred = 1
r0_0.ShouldDetory = 2
r0_0.IsOpenNewDepute = false
r0_0.BubbleTimePerLine = 2
r0_0.HeroUsdkSharePlatform = {
  All = 20000,
  QQ = 20001,
  QQZone = 20002,
  Wechat = 20003,
  WechatMoments = 20004,
  Weibo = 20005,
  DouyinContact = 20007,
  XHS = 20008,
  KS = 20009,
  BiliBili = 20010,
  TapTap = 20012,
  Twitter = 30001,
  Facebook = 30002,
  TwitterFriends = 30003,
  Tweets = 30004,
  Discord = 30011,
}
r0_0.HeroUsdkShareType = {
  None = 0,
  Link = 1,
  Image = 2,
  Text = 3,
}
r0_0.CustomNpcCreateOpt = true
r0_0.CustomNpcCanCache = true
r0_0.PickupNiagaraPaths = {
  "/Game/Asset/Effect/Niagara/Item/NS_Item_Base.NS_Item_Base",
  "/Game/Asset/Effect/Niagara/Item/NS_Item_Pick_Base.NS_Item_Pick_Base",
  "/Game/Asset/Effect/Niagara/Item/NS_Item_Base_Pro.NS_Item_Base_Pro",
  "/Game/Asset/Effect/Niagara/Item/NS_Item_Pick_Base_Pro.NS_Item_Pick_Base_Pro",
  "/Game/Asset/Effect/Niagara/Item/NS_Item_Base_Ultra.NS_Item_Base_Ultra",
  "/Game/Asset/Effect/Niagara/Item/NS_Item_Pick_Base_Ultra.NS_Item_Pick_Base_Ultra",
  "/Game/Asset/Effect/Niagara/Item/NS_Item_Base_Fly.NS_Item_Base_Fly"
}
r0_0.bForceOpenPay = false
r0_0.IsOpenNetMultiClientOnly = true
r0_0.ReddotCacheType = {
  UserCache = 1,
  CommonCache = 0,
  NoneCache = -1,
}
r0_0.ShopCacheReason = {
  Temporary = 1,
  Persistent = 2,
  Read = 0,
}
r0_0.bOpenAntiCheat = true
r0_0.AntiCheatInterval = 60
r0_0.bOpenScriptDetectionCheck = true
r0_0.IsShowRayCreature = false
r0_0.IsOpenBulletCreature = true
r0_0.IsOpenSkillCreature = true
r0_0.IsOpenCreatureECS = true
r0_0.UnlockRegionTeleport = false
r0_0.DefaultAttributeMaster = {
  [0] = 160101,
  [1] = 1601,
}
r0_0.SkipShadowBudgetConfig = {
  3102
}
r0_0.OpenVerifyArray = true
r0_0.bNullNetWorkMgr = true
r0_0.bUseDynamicResolution = true
r0_0.ScriptDetectionCheckType = {
  OnMouse = "OnMouse",
  OnKeyboard = "OnKeyboard",
}
return r0_0
