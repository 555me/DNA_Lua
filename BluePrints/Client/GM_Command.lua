-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Client\GM_Command.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  Initialize = function(r0_1, r1_1)
    -- line: [11, 21] id: 1
    r0_1:Init_Command()
    r0_1.NewCommands = {}
    for r6_1, r7_1 in pairs(r0_1.Commands) do
      r0_1.NewCommands[string.upper(r6_1)] = r7_1
    end
    -- close: r2_1
    for r6_1, r7_1 in pairs(r0_1.NewCommands) do
      r0_1.Commands[r6_1] = r7_1
    end
    -- close: r2_1
  end,
  AutoExecuteGM = function(r0_2)
    -- line: [24, 29] id: 2
    if require("EMCache.EMCache"):Get("GM_MockAllSystemCondition", true) then
      r0_2:MockAllSystemCondition()
    end
  end,
  Init_Command = function(r0_3)
    -- line: [31, 744] id: 3
    r0_3.Commands = {
      R = "ReloadAll",
      Hotfix = "Hotfix",
      GA = "GetAvatar",
      GSA = "GetServerAvatar",
      CM = "CreateMonster",
      CMSM = "CreateMonsterSpawnMonster",
      CTM = "CreateTestMonster",
      CP = "CreatePhantom",
      CMS = "CreateMechanismSummon",
      CN = "CreateNpc",
      CPet = "CreatePet",
      TriggerLoadedEvent = "TriggerLoadedEvent",
      LowQuality = "LowQuality",
      ShowFlag = "ShowFlag",
      QualityLevel = "QualityLevel",
      OpenUI = "OpenUI",
      HideUI = "HideUI",
      CloseUI = "CloseUI",
      ShowGuideUI = "ShowGuideUI",
      FallAttackPoint = "FallAttackPoint",
      FallAttackPointPos = "FallAttackPointPos",
      SwitchKawaiiDebug = "SwitchKawaiiDebug",
      HeadScale = "HeadScale",
      UpperArmScale = "UpperArmScale",
      LowerArmScale = "LowerArmScale",
      HandScale = "HandScale",
      Debug = "Debug",
      UpdateVLM = "UpdateVLM",
      GlobalTimeDilation = "GlobalTimeDilation",
      EnterDungeon = "EnterDungeon",
      ExitBattle = "ExitBattle",
      PlayerEnd = "PlayerEnd",
      InitGM = "InitGameMode",
      RequireAndEnterDS = "RequireAndEnterDS",
      ExitDS = "ExitDS",
      EnterLocalDS = "EnterLocalDS",
      EnterLocalDungeon = "EnterLocalDungeon",
      EnterNewDS = "EnterNewDS",
      TestEnterDS = "TestEnterDS",
      DSLog = "DSLog",
      KickPlayer = "KickPlayer",
      KickSelf = "KickSelf",
      BlockEntrance = "BlockEntrance",
      UseMinimumLoad = "UseMinimumLoad",
      GameModeEnable = "GameModeEnable",
      DSC = "DedicatedServerCommand",
      DungeonDoubleCost = "DungeonDoubleCost",
      Tel = "Tel",
      FreezeWorldComposition = "FreezeWorldComposition",
      BreakableItemNavEnableInLower = "BreakableItemNavEnableInLower",
      PrintActorSCLoc = "PrintActorSCLoc",
      Recovery = "RecoverySelf",
      RecoverPlayer = "RecoverPlayer",
      KM = "KillMonster",
      RTL = "ResetTrollyLoc",
      DMS = "DebugMonsterSpawn",
      DPMS = "DebugPrintMonsterSpawn",
      GAM = "GuideAllMonster",
      RSS = "RequestSnapShotInfo",
      RMC = "RequestMonsterCacheInfo",
      RSC = "RequestStaticCreatorInfo",
      NPCRotate = "NPCRotate",
      NPCRotate90 = "NPCRotate90",
      NPCTalkAgree = "NPCTalkAgree",
      NPCAgree = "NPCAgree",
      NPCTalk03 = "NPCTalk03",
      YXD = "YXDTEST",
      THY = "THYTEST",
      JTY = "JTYTEST",
      LJL = "LJLTEST",
      HTY = "HTYTEST",
      LHQ = "LHQTEST",
      LJH = "LJHTEST",
      AYF = "AYFTEST",
      DungeonEventTest = "DungeonEventTest",
      SwitchSurvivalValueChange = "SwitchSurvivalValueChange",
      PrintLevelDebugInfo = "PrintLevelDebugInfo",
      PrintPlayerInfoOnScreen = "PrintPlayerInfoOnScreen",
      PrintGameModeInfoOnScreen = "PrintGameModeInfoOnScreen",
      TeleportPlayer = "TeleportPlayer",
      PrintGetCover = "PrintGetCover",
      PrintUpdateCover = "PrintUpdateCover",
      TrainingCreateMonster = "TrainingCreateMonster",
      TrainingSetMonsterAI = "TrainingSetMonsterAI",
      TrainingRemoveMonster = "TrainingRemoveMonster",
      TrainingClearCreateInfo = "TrainingClearCreateInfo",
      CNPCCache = "PrintCustomNPCCacheInfo",
      StartVote = "StartVote",
      SpawnPet = "SpawnPet",
      PostCustomEvent = "PostCustomEvent",
      SetFeinaStar = "SetFeinaStar",
      EnterAbyss = "EnterAbyss",
      EnterAbyssNew = "EnterAbyssNew",
      AbyssPassRoom = "AbyssPassRoom",
      padt = "PrintAllDailyTask",
      MonsterMaxHp = "MonsterMaxHp",
      HMC = "HideMonsterCapsule",
      HM = "HideMonster",
      ShowCapsule = "ShowCapsule",
      GetMonster = "GetMonster",
      StopAI = "StopAI",
      StartAI = "StartAI",
      MoveTo = "MoveTo",
      Target = "Target",
      TargetAll = "TargetAll",
      MoveDebug = "MoveDebug",
      PerMonsterDebug = "PerMonsterDebug",
      StopMonsterSkill = "StopMonsterSkill",
      BTTest = "BTTest",
      ChangeCL = "ChangeCrossLevel",
      DrawCL = "DrawCrossLevel",
      ReuseSkill = "ReuseSkill",
      SetMonsterCrouch = "SetMonsterCrouch",
      GetBlackboardValue = "GetBlackboardValue",
      MonsterTimeDilation = "MonsterTimeDilation",
      ControlAllMonsterBTTickEnable = "ControlAllMonsterBTTickEnable",
      TestTriggerAbyssOnEnd = "TestTriggerAbyssOnEnd",
      TestGraphTask = "TestGraphTask",
      ForbidDamage = "ForbidDamage",
      ForbidPlay = "ForbidPlay",
      TestBattle = "TestBattle",
      Attr = "GetOrSetPlayerAttr",
      WeaponAttr = "GetOrSetPlayerWeaponAttr",
      PinAttr = "PinAttr",
      MaxBullet = "MaxBullet",
      MaxMagazineBullet = "MaxMagazineBullet",
      MaxAttack = "MaxAttack",
      MaxDefence = "MaxDefence",
      MaxSp = "MaxSp",
      AddSp = "AddSp",
      MaxHp = "MaxHp",
      MaxTriggerProbability = "MaxTriggerProbability",
      SetNickname = "SetNickname",
      SetSex = "SetSex",
      AddHp = "AddHp",
      MaxES = "MaxES",
      AddES = "AddES",
      God = "God",
      DefCoreGod = "DefCoreGod",
      UnlimitFire = "UnlimitFire",
      GAW = "GetAllWeapons",
      GAC = "GetAllChars",
      IsCrit = "IsCrit",
      IsFloat = "IsFloat",
      CharacterTag = "CharacterTag",
      CalcAttrOpt = "CalcAttrOpt",
      AddMod = "AddMod",
      DebugMod = "DebugMod",
      TestEvent = "TestEvent",
      ShowDamageDetails = "ShowDamageDetails",
      DSShowDetails = "DSShowDetails",
      ShowRealAttr = "ShowRealAttr",
      StatDamage = "StatDamage",
      Buff = "Printbuff",
      BuffDebug = "BuffDebug",
      AddBuff = "AddBuff",
      RemoveBuff = "RemoveBuff",
      AddMonsterBuff = "AddMonsterBuff",
      AddMonsterBuffDuration = "AddMonsterBuffDuration",
      RemoveMonsterBuff = "RemoveMonsterBuff",
      AddGP = "AddGP",
      RemoveAllGP = "RemoveAllGP",
      PrintGP = "PrintGP",
      PrintMarks = "PrintMarks",
      MSPDT = "MonsterSpawnPointDistributeLogicTest",
      StartXibiBoss = "StartXibiBoss",
      UnlockHardBoss = "UnlockHardBoss",
      UnlockRegionTeleport = "UnlockRegionTeleport",
      UnlockRegionDelivery = "UnlockRegionDelivery",
      AddRougeLikeCurrency = "AddRougeLikeCurrency",
      GetRougeLikeCurrency = "GetRougeLikeCurrency",
      RGPassRoom = "RougeLikePassRoom",
      StartQuestChain = "StartQuestChain",
      SuccQuestChain = "SuccQuestChain",
      CleanQuestChain = "CleanQuestChain",
      CleanAllQuest = "CleanAllQuest",
      StartQuest = "StartQuest",
      SuccQuest = "SuccQuest",
      FailQuest = "FailQuest",
      IsQuestChainLock = "IsQuestChainLock",
      IsQuestChainUnlock = "IsQuestChainUnlock",
      ShowUseCountSkill = "ShowUseCountSkill",
      ShowCacheUseCountSkill = "ShowCacheUseCountSkill",
      SCRQ = "SkipCurrentRunningQuest",
      PrintCurrentTaskGuideInfo = "PrintCurrentTaskGuideInfo",
      SetTaskGuidePointDebugMode = "SetTaskGuidePointDebugMode",
      ChangeToNewModel = "ChangeToNewModel",
      bn = "GetOrSetRangedWeaponBulletNum",
      ChangeWeapon = "ChangeWeapon",
      rct = "RandomCreateTest",
      ChangeMod = "ChangeMod",
      TakeOffMod = "TakeOffMod",
      ChangeModSuit = "ChangeModSuit",
      ModLevelUp = "ModLevelUp",
      WLU = "WeaponLevelUp",
      WB = "WeaponBreak",
      CLU = "CharLevelUp",
      CGLU = "CharGradeLevelUp",
      CB = "CharBreak",
      clearmonsterdes = "ClearFirstMonsterRecords",
      UnlockMonsterGallery = "UnlockMonsterGallery",
      clearmonguide = "ClearMonGuide",
      RL = "ResetLoc",
      CCCV = "ChangeCharCornerVisibility",
      UWGL = "UpWeaponGradeLevel",
      ChangeWeaponColor = "ChangeWeaponColor",
      CleanWeaponColor = "CleanWeaponColor",
      NOCD = "NoCDForSkill",
      UpdateMonCd = "UpdateMonCd",
      FireDanmaku = "FireDanmaku",
      PrintSkill = "PrintCurrentSkillID",
      PrintMonsterSkill = "PrintMonsterSkill",
      CTN = "CutToughnessValue",
      PlayLightHit = "PlayLightHit",
      PlayLightHitRanged = "PlayLightHitRanged",
      PlayHeavyHit = "PlayHeavyHit",
      PlayHitFly = "PlayHitFly",
      PlayHitFly_Force = "PlayHitFly_Force",
      TakeRecorderCapture = "TakeRecorderCapture",
      UseDungeonLevelBounds = "UseDungeonLevelBounds",
      EnemyVisionDebug = "EnemyVisionDebug",
      TargetLocDebug = "TargetLocDebug",
      TestStory = "TestStory",
      TestStory1 = "TestStory1",
      RunStory = "RunStoryline",
      StopStory = "StopStoryline",
      RunQuest = "RunQuest",
      SkipQuest = "SkipQuest",
      SuccessAllQuest = "SuccessAllQuest",
      PrintStorylineInfo = "PrintStorylineInfo",
      PrintStorylinesNeedRestartInfo = "PrintStorylinesNeedRestartInfo",
      RemoveAllImpression = "RemoveAllImpression",
      CIS = "CompleteImpressionSystem",
      PlayTalk = "PlayTalk",
      PT = "PlayTalk",
      ScanForDuplicatedTalk = "ScanForDuplicatedTalk",
      ST = "ScanForDuplicatedTalk",
      ForceSetStorySkipable = "ForceSetStorySkipable",
      NPCLookAtDebug = "ShowLookAtDebug",
      StartNPCLookAt = "StartLookAt",
      LookAtBySlerp = "LookAtBySlerp",
      NPCMoveTo = "NPCMoveTo",
      TestSTLNode = "TestSTLNode",
      TIP = "TestImpression",
      FinishImpressionTalk = "FinishImpressionTalk",
      ImpressionCheckByEnumId = "ImpressionCheckByEnumId",
      ImpressionAddByEnumId = "ImpressionAddByEnumId",
      CompleteDialogueByText = "CompleteDialogueByText",
      MAULookAt = "MAULookAt",
      QuitMAU = "QuitMAU",
      UseSkill = "UseSkill",
      Focus = "Focus",
      SetSpeed = "SetSpeed",
      CCSpeed = "ChangeCreatureSpeed",
      ShowSkillCreature = "ShowSkillCreature",
      ShowRayCreature = "ShowRayCreature",
      AnimCacheEnableState = "AnimCacheEnableState",
      MonsterBornPosCheck = "MonsterBornPosCheck",
      GetDrop = "GetDrop",
      DS = "DisconnectServer",
      CS = "ConnectServer",
      LS = "ListenServer",
      NetMode = "NetMode",
      Re0 = "Reconnect",
      TestNetworkFailure = "TestNetworkFailure",
      TestCrash = "TestCrash",
      ForbidEntityMessage = "ForbidEntityMessage",
      smgi = "ShowOrHideMonsterGuideIcon",
      CMBS = "CreateMonstersBatches",
      ScanLevel = "ScanLevel",
      ShowPreloadFX = "ShowPreloadFX",
      DebugAchvUI = "DebugAchvUI",
      SpeedUp = "SpeedUp",
      EnableJetJump = "EnableJetJump",
      EnableJetRush = "EnableJetRush",
      EnableSplineMove = "EnableSplineMove",
      EnableSplatoonMove = "EnableSplatoonMove",
      PlayAllNiagaraArround = "PlayAllNiagaraArround",
      DestroyAllMonster = "DestroyAllMonster",
      DSVersion = "DSVersion",
      MGC = "ManualGC",
      sctime = "SetClientTime",
      EnableBuffMesh = "EnableBuffMesh",
      PSOP = "PSOPrepare",
      pcmv = "PrintCharModVolume",
      ChangeSpeed = "ChangeSpeed",
      SetWalk = "SetWalk",
      GetSceneSoundPause = "GetSceneSoundPause",
      SetBGMVolume = "SetBGMVolume",
      SetAudioListenerOpenDebug = "SetAudioListenerOpenDebug",
      SetEMPreviewMute = "SetEMPreviewMute",
      SetBGMOpenDebug = "SetBGMOpenDebug",
      PrintBGMInfo = "PrintBGMInfo",
      GetAllBusVolume = "GetAllBusVolume",
      GetAllBusPauseState = "GetAllBusPauseState",
      ReloadAllBank = "ReloadAllBank",
      SetDrawDebugEnabled = "SetDrawDebugEnabled",
      SetSoundPointCompDebugEnabled = "SetSoundPointCompDebugEnabled",
      SetSoundSplineDrawDebug = "SetSoundSplineDrawDebug",
      SetReverbDebug = "SetReverLogicOpenbDebug",
      PrintHeadPhonePlugIn = "PrintHeadPhonePlugIn",
      SetAudioManagerTestRegionId = "SetAudioManagerTestRegionId",
      SimulateBGMEnterNewRegion = "SimulateBGMEnterNewRegion",
      SetLineSoundDebug = "SetLineSoundDebug",
      SectorSoundDebug = "SectorSoundDebug",
      CircularSoundDebug = "CircularSoundDebug",
      PrintEventsMap = "PrintEventsMap",
      PrintAUAForbidTag = "PrintAUAForbidTag",
      PrintCurAuActionCount = "PrintCurAuActionCount",
      MechanismStateDebug = "MechanismStateDebug",
      StartSpecialQuest = "StartSpecialQuest",
      SuccessSpecialQuest = "SuccessSpecialQuest",
      FailerSpecialQuest = "FailerSpecialQuest",
      PrintDynamicEventInfo = "PrintDynamicEventInfo",
      ForceStartDynQuest = "ForceStartDynQuest",
      CADC = "CompleteAllDispatchCondion",
      ChangeToMaster = "ChangeToMaster",
      ChangeBackToHero = "ChangeBackToHero",
      ActiveExplores = "ActiveExploreStaticCreator",
      TestRealtimeContentValidate = "TestRealtimeContentValidate",
      TestUploadChat = "TestUploadChat",
      TestUploadReport = "TestUploadReport",
      TestUploadBanLog = "TestUploadBanLog",
      TestDrawGacha = "TestDrawGacha",
      ShowGachaParams = "ShowGachaParams",
      GachaSelfSelect = "GachaSelfSelect",
      TestDrawSkinGacha = "TestDrawSkinGacha",
      FSG = "FinishSystemGuide",
      PSI = "PurchaseShopItem",
      SPSUI = "ShowPurchaseShopUI",
      UnLoadChangeUI = "UnLoadChangeUI",
      SBP = "StartBlueProduct",
      CBP = "CompleteBlueProduct",
      CTime = "ShowClientTime",
      STime = "ShowServerTime",
      StartBattle = "StartBattle",
      LoadSmallObj = "LoadSmallObjects",
      SetPlayerDilation = "SetPlayerDilation",
      Mem = "Mem",
      CleanLuaTable = "CleanLuaTable",
      ShowAvatarStatus = "ShowAvatarStatus",
      CheckCondition = "CheckCondition",
      ServerCheckCondition = "ServerCheckCondition",
      StatMonster = "StatMonster",
      StatMonsterMem = "StatMonsterMem",
      StatFX = "StatFX",
      StatLevel = "StatLevel",
      StatRecordLevel = "StatRecordLevel",
      GenerateStripMesh = "GenerateStripMesh",
      UWAUpLoad = "UWAUpLoad",
      PreviewPopup = "PreviewPopup",
      ShowPopup = "ShowPopup",
      ShowRecoverUI = "ShowRecoverUI",
      TestGetCharWeapon = "TestGetCharWeapon",
      DisableCheckBox = "DisableCheckBox",
      EnableCheckBox = "EnableCheckBox",
      TouchSpeedPitch = "TouchSpeedPitch",
      TouchSpeedYaw = "TouchSpeedYaw",
      TouchLimitPitch = "TouchLimitPitch",
      TouchLimitYaw = "TouchLimitYaw",
      SetInvincible = "SetInvincible",
      ClearPhantoms = "ClearPhantoms",
      KillAllPhantoms = "KillAllPhantoms",
      CompleteCondition = "CompleteCondition",
      CompleteSystemCondition = "CompleteSystemCondition",
      CompleteSystemConditionWithoutGuide = "CompleteSystemConditionWithoutGuide",
      ShowSystemUnlock = "ShowSystemUnlock",
      FakeUIUnlockConditionComplete = "FakeUIUnlockConditionComplete",
      MockAllSystemCondition = "MockAllSystemCondition",
      MockSystemCondition = "MockSystemCondition",
      UnLockAllDungeonSelectLevels = "UnLockAllDungeonSelectLevels",
      UnLockAllDungeonLevels = "UnLockAllDungeonLevels",
      PlaySequence = "PlaySequence",
      FSMDebug = "FSMDebug",
      SystemGuideSwitch = "SystemGuideSwitch",
      SuccessAllSystemGuide = "SuccessAllSystemGuide",
      SwitchCullModifier = "SwitchCullModifier",
      I18Time = "I18Time",
      GBFS = "GuideBookFinishSomething",
      EchoAvatar = "EchoAvatar",
      PrintGuideBook = "PrintGuideBook",
      GuideBookGetReward = "GuideBookGetReward",
      ResetEMCache = "ResetEMCache",
      TestWarningToast = "TestWarningToast",
      StartAutoTest = "StartAutoTest",
      ABTS = "AutoBattleTestServer",
      ABTC = "AutoBattleTestClient",
      StopABT = "StopAutoBattleTest",
      ChangeBuffLastTime = "ChangeBuffLastTime",
      ReduceBuffLayer = "ReduceBuffLayer",
      TestTrackingQuest = "TestTrackingQuest",
      EnterRougeLike = "EnterRougeLike",
      UpgradeAward = "UpgradeAward",
      RogueShopTest = "RogueShopTest",
      RougeDetailsTest = "RougeDetailsTest",
      ShowRougeManual = "ShowRougeManual",
      ShowGetItemsTip = "ShowGetItemsTip",
      ShowUpgradeTip = "ShowUpgradeTip",
      DisableBattleWheel = "DisableBattleWheel",
      EnableBattleWheel = "EnableBattleWheel",
      FillBattleWheel = "FillBattleWheel",
      PrintBattleWheel = "PrintBattleWheel",
      AddPet = "AddPet",
      RemovePet = "RemovePet",
      AddPetAffix = "AddPetAffix",
      RemovePetAffix = "RemovePetAffix",
      PrintPlayers = "PrintPlayers",
      PrintTeammates = "PrintTeammates",
      ShowCountdownToast = "ShowCountdownToast",
      AddCountdownTime = "AddCountdownTime",
      EnableChatCheck = "EnableChatCheck",
      ChatToOtherPlayer = "ChatToOtherPlayer",
      ForceUseSkill = "ForceUseSkill",
      ShowHudReward = "ShowHudReward",
      CInitTeamTest = "CInitTeamTest",
      CAddTeammateTest = "CAddTeammateTest",
      CDelTeammateTest = "CDelTeammateTest",
      CTeamInviteTest = "CTeamInviteTest",
      CTestTeamBloodBar = "CTestTeamBloodBar",
      CTestDelBloodBar = "CTestDelBloodBar",
      FXTest = "FXPriorityTest",
      FXTestChar = "FXPriorityTest_Char",
      FXTestOne = "FXPriorityTest_One",
      PrintAllFXPath = "PrintAllFXPath",
      ClearFXTest = "ClearFXTest",
      LevelFXTest = "LevelFXTest",
      PrintAllAssetPath = "PrintAllAssetPath",
      PrintAllPreloadCacheInfo = "PrintAllPreloadCacheInfo",
      UseDebug = "UseDebug",
      obj = "obj",
      PUA = "PlayUMGAnimation",
      UAT = "UMGAnimationsTime",
      cdk = "GMUseCDK",
      EMPWA = "EMPlayWidgetAnimation",
      HideAllUI = "HideAllUI",
      UseMobileUnitBudget = "UseMobileUnitBudget",
      DebugTickUnitBudget = "DebugTickUnitBudget",
      OpenMonsterDebug = "OpenMonsterDebug",
      EnableSkillPrediction = "EnableSkillPrediction",
      ForceSimPredictionFailed = "ForceSimPredictionFailed",
      PrintPredictionDebugInfo = "PrintPredictionDebugInfo",
      CrashTest = "CrashTest",
      SetGamepad = "SetGamepad",
      History = "PrintBattleHistory",
      TractedMonsterToPlayer = "TractedMonsterToPlayer",
      TestTractedPlayer = "TestTractedPlayer",
      SkipAngling = "SkipAngling",
      SSRPlaySequence = "SSRPlaySequence",
      NewDeputeTest = "NewDeputeTest",
      DetectiveMinigame = "DetectiveMinigame",
      StartFlow = "StartFlow",
      StopFlow = "StopFlow",
      OpenWalnutRewardDialog = "OpenWalnutRewardDialog",
      CreateSquad = "CreateSquad",
      QuitGame = "QuitGame",
      SyncTest = "SyncTest",
      GM_SkipMonthCardPay = "GM_SkipMonthCardPay",
      GetWorldRegionEidByCreatorId = "GetWorldRegionEidByCreatorId",
      GetWorldRegionEidByManualItemId = "GetWorldRegionEidByManualItemId",
      GetWorldRegionEidByRandomRuleId = "GetWorldRegionEidByRandomRuleId",
      ShowUI = "ShowUI",
      EnablePropEffect = "EnablePropEffect",
      ShowSequenceTime = "ShowSequenceTime",
      CommonActivitySettlement = "CommonActivitySettlement",
      EnterPaotai = "EnterPaotai",
      EnterEventDungeon = "EnterEventDungeon",
      PrintLevelbound = "PrintLevelbound",
      ShowScenarioPerformanceData = "ShowScenarioPerformanceData",
      ShowScenarioDataOnTick = "ShowScenarioDataOnTick",
      ShowBattleError = "ShowBattleError",
      ShowUIError = "ShowUIError",
      ShowPersonalInfoPage = "ShowPersonalInfoPage",
      VerifyArrayTest = "VerifyArrayTest",
      FloatVerifyArrayTest = "FloatVerifyArrayTest",
      EnableRegionPlayerRandomRoleId = "EnableRegionPlayerRandomRoleId",
      EnableRegionPlayerOnlyShowHeadUI = "EnableRegionPlayerOnlyShowHeadUI",
      URB = "UseResourceBattle",
      NPCSubSystemOnline = "NPCSubSystemOnline",
      NPCSubSystemChangeId = "NPCSubSystemChangeOnlineRegionId",
      ReadyForRegonOnline = "ReadyForRegonOnline",
      RandomChar = "RandomChar",
      ShowGlobalVersion = "ShowGlobalVersion",
      HideGlobalVersion = "HideGlobalVersion",
      OpenOnlineActionView = "OpenOnlineActionView",
      SwitchMobileHUDLayout = "SwitchMobileHUDLayout",
      OpenMultiChallenge = "OpenMultiChallenge",
      ChangeDSMonsterFramingNodeConfig = "ChangeDSMonsterFramingNodeConfig",
      HideStoryUI = "HideStoryUI",
      HideEntertainmentUI = "HideEntertainmentUI",
      GetAllOptPackages = "GetAllOptPackages",
      ActorSnapShot = "ActorSnapShot",
    }
  end,
  GMUseCDK = function(r0_4, r1_4)
    -- line: [746, 749] id: 4
    r0_4:GetClientAvatar():UseCDK(r1_4)
  end,
  ShowScenarioDataOnTick = function(r0_5)
    -- line: [751, 764] id: 5
    local r2_5 = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
    UE4.UKismetSystemLibrary.ExecuteConsoleCommand(r2_5, "stat unit", nil)
    UE4.UKismetSystemLibrary.ExecuteConsoleCommand(r2_5, "DumpMeshLODData", nil)
    if r2_5:IsExistTimer("DataOnTick") then
      r2_5:RemoveTimer("DataOnTick")
      URuntimeCommonFunctionLibrary.RemoveOnScreenDebugMessage(28)
    else
      r2_5:AddTimer(0.5, r0_5.ShowScenarioPerformanceData, true, 0.1, "DataOnTick", true)
      r0_5:ShowScenarioPerformanceData()
    end
  end,
  ShowScenarioPerformanceData = function(r0_6)
    -- line: [766, 792] id: 6
    local r3_6 = URuntimeCommonFunctionLibrary.GetStaticMeshTrianglesTopTen(UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0):GetWorld()):ToTable()
    local r4_6 = string.rep(" ", 100)
    local r5_6 = string.rep(" ", 10)
    local r6_6 = "" .. r4_6
    for r11_6, r12_6 in ipairs(r3_6) do
      r6_6 = r6_6 .. "StaticMeshName: " .. r12_6.ActorName .. r5_6 .. "StaticMeshNum: " .. r12_6.ActorNum .. "\n" .. r4_6
      for r16_6 = 1, r12_6.LODNum, 1 do
        if r12_6.CurLODIndex and r12_6.CurLODIndex >= 0 and r12_6.CurLODIndex + 1 == r16_6 then
          r6_6 = r6_6 .. "->->-> LOD" .. r16_6 + -1 .. "(Triangles: " .. r12_6.NumTriangles[r16_6] / r12_6.ActorNum .. ", Vertices: " .. r12_6.NumVertices[r16_6] / r12_6.ActorNum .. ")" .. "<-<-<-" .. r5_6
        else
          r6_6 = r6_6 .. " LOD" .. r16_6 + -1 .. "(Triangles: " .. r12_6.NumTriangles[r16_6] / r12_6.ActorNum .. ", Vertices: " .. r12_6.NumVertices[r16_6] / r12_6.ActorNum .. ")" .. r5_6
        end
      end
      r6_6 = r6_6 .. "\n\n" .. r4_6
    end
    -- close: r7_6
    URuntimeCommonFunctionLibrary.AddOnScreenDebugMessage(28, 3600, FColor(255, 255, 255), r6_6, false, FVector2D(1, 1))
  end,
  UseDebug = function(r0_7, r1_7)
    -- line: [794, 803] id: 7
    if r1_7 == nil then
      r1_7 = "1"
    end
    local r2_7 = require("LuaPanda")
    if r1_7 == "1" then
      r2_7.reGetSock()
      r2_7.start()
    else
      r2_7.stopAttach()
    end
  end,
  CTestDelBloodBar = function(r0_8, r1_8)
    -- line: [805, 814] id: 8
    local r2_8 = UIManager(r0_8:GetGameInstance())
    r1_8 = tonumber(r1_8)
    local r3_8 = r2_8:GetUIObj("BattleMain")
    r3_8.VB_PlayerBar:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r3_8:RemoveBattleTeamBloodBar(r1_8)
  end,
  CTestTeamBloodBar = function(r0_9, r1_9)
    -- line: [816, 825] id: 9
    r1_9 = tonumber(r1_9)
    local r3_9 = UIManager(r0_9:GetGameInstance()):GetUIObj("BattleMain")
    r3_9.VB_PlayerBar:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r3_9:AddBattleTeamBloodBar(r1_9, true, true)
  end,
  CTeamInviteTest = function(r0_10)
    -- line: [829, 838] id: 10
    TeamController:RecvTeamBeInvited({
      Uid = 23333,
      HeadIconId = TeamController:GetAvatar().HeadIconId,
      IsOnline = true,
      Nickname = "test2",
      Level = 3,
    })
  end,
  CInitTeamTest = function(r0_11)
    -- line: [840, 868] id: 11
    TeamController:RecvTeamOnInit({
      TeamId = 2,
      LeaderId = TeamController:GetAvatar().Uid,
      Hostnum = 101,
      Members = {
        {
          Uid = 23333,
          HeadIconId = TeamController:GetAvatar().HeadIconId,
          IsOnline = true,
          Nickname = "test2",
        },
        TeamController:GetAvatar(),
        {
          Uid = 23335,
          HeadIconId = TeamController:GetAvatar().HeadIconId,
          IsOnline = true,
          Nickname = "test2",
        },
        {
          Uid = 23336,
          HeadIconId = TeamController:GetAvatar().HeadIconId,
          IsOnline = true,
          Nickname = "test2",
        }
      },
    })
  end,
  CAddTeammateTest = function(r0_12, r1_12)
    -- line: [870, 878] id: 12
    TeamController:RecvTeamOnAddPlayer({
      Uid = tonumber(r1_12),
      HeadIconId = TeamController:GetAvatar().HeadIconId,
      IsOnline = true,
      Nickname = "test2",
    })
  end,
  CDelTeammateTest = function(r0_13, r1_13)
    -- line: [880, 908] id: 13
    if r1_13 ~= "0" then
      TeamController:RecvTeamOnDelPlayer(tonumber(r1_13), CommonConst.LeaveTeamReason.Willing)
    else
      TeamController:RecvTeamOnDelPlayer(23333, CommonConst.LeaveTeamReason.Willing)
      TeamController:RecvTeamOnAddPlayer({
        Uid = 23336,
        HeadIconId = TeamController:GetAvatar().HeadIconId,
        IsOnline = true,
        Nickname = "test2",
      })
      TeamController:RecvTeamOnDelPlayer(23335, CommonConst.LeaveTeamReason.Willing)
      local r2_13 = {
        Uid = 23337,
        HeadIconId = TeamController:GetAvatar().HeadIconId,
        IsOnline = true,
        Nickname = "test2",
      }
      TeamController:RecvTeamOnAddPlayer(r2_13)
      r2_13 = {
        Uid = 23338,
        HeadIconId = TeamController:GetAvatar().HeadIconId,
        IsOnline = true,
        Nickname = "test2",
        TeamController:RecvTeamOnAddPlayer(r2_13)
      }
    end
  end,
  EnableChatCheck = function(r0_14, r1_14)
    -- line: [910, 913] id: 14
    r1_14 = tonumber(r1_14)
    ChatCommon.IgnoreSensitiveCheck = r1_14 == 0
  end,
  ChatToOtherPlayer = function(r0_15, r1_15, r2_15, r3_15)
    -- line: [915, 921] id: 15
    if not r2_15 then
      r2_15 = 60
    end
    for r7_15 = 1, tonumber(r2_15), 1 do
      if not r3_15 then
        r3_15 = "2333"
      end
      GWorld:GetAvatar():ChatToPlayer(tonumber(r1_15), r3_15 .. r7_15)
    end
  end,
  ResetEMCache = function(r0_16)
    -- line: [923, 926] id: 16
    require("EMCache.EMCache"):Reset()
  end,
  ExecuteGM = function(r0_17, r1_17, r2_17, r3_17, r4_17, r5_17)
    -- line: [929, 937] id: 17
    if r5_17 then
      r0_17:DedicatedServerGM(r1_17, r2_17, r3_17)
    elseif r4_17 then
      r0_17:ClientGM(r1_17, r2_17, r3_17)
    else
      r0_17:ServerGM(r2_17, r3_17)
    end
  end,
  DedicatedServerGM = function(r0_18, r1_18, r2_18, r3_18)
    -- line: [940, 954] id: 18
    local r4_18 = UE4.UGameplayStatics.GetGameInstance(r1_18)
    assert(r4_18, "找不到GameInstance")
    r0_18.Player = UE4.UGameplayStatics.GetPlayerCharacter(r4_18, 0)
    assert(Battle(r0_18.Player), "没找到Battle")
    assert(not IsStandAlone(r0_18.Player), "不能在单机情况下使用DSGM")
    local r7_18 = require("BluePrints.Combat.BattleLogic.EffectResults").Result()
    r7_18:Add(r2_18, r3_18)
    r0_18.Player:GMServerBattleCommand(r7_18:ToEffectStruct())
  end,
  ClientGM = function(r0_19, r1_19, r2_19, r3_19)
    -- line: [957, 1029] id: 19
    local function r4_19(r0_20)
      -- line: [959, 968] id: 20
      if type(r0_20) == "string" then
        local r1_20 = {}
        for r6_20 in string.gmatch(r0_20, "%S+") do
          table.insert(r1_20, r6_20)
        end
        -- close: r2_20
        return r1_20
      end
      return r0_20
    end
    local r5_19 = UE4.UGameplayStatics.GetGameInstance(r1_19) and GWorld.GameInstance
    assert(r5_19, "找不到GameInstance")
    r0_19.Player = UE4.UGameplayStatics.GetPlayerCharacter(r5_19, 0)
    local r6_19 = nil
    local r7_19 = DataMgr.GMIntegration[r2_19]
    if r7_19 then
      for r12_19, r13_19 in pairs(r7_19.GMCommands) do
        UE4.UKismetSystemLibrary.ExecuteConsoleCommand(r5_19, r13_19)
      end
      -- close: r8_19
    else
      local r8_19 = r0_19.Commands[string.upper(r2_19)]
      if r8_19 then
        local r9_19 = r0_19[r8_19]
        assert(r9_19, "错误的函数名:" .. r8_19)
        r2_19 = r8_19
        if r3_19 then
          r2_19 = r2_19 .. " " .. tostring(r3_19)
        end
        r6_19 = r9_19(r0_19, table.unpack(r4_19(r3_19)))
      else
        if r3_19 then
          r2_19 = r2_19 .. " " .. r3_19
        end
        local r9_19 = "                local A = self.Avatar\n                local P = self.Player\n                local W = self.Player:GetCurrentWeapon()\n                local B = Battle(self.Player)\n                local GameMode = UE4.UGameplayStatics.GetGameMode(P)\n                local GameState = UE4.UGameplayStatics.GetGameState(P)\n                local GameInstance = UE4.UGameplayStatics.GetGameInstance(P)\n                local UIManager = GameInstance:GetGameUIManager()\n                local E = function(eid)\n                    return B:GetEntity(eid)\n                end\n                local ObjectId = function (obj_str)\n                    return CommonUtils.Str2ObjId(\"ObjectId(\\\"\"..obj_str..\"\\\")\")\n                end\n            "
        local r10_19 = "return function(self) " .. r9_19 .. "return " .. r2_19 .. " end"
        local r11_19 = load(r10_19)
        if not r11_19 then
          r10_19 = "return function(self) " .. r9_19 .. r2_19 .. " end"
          r11_19 = load(r10_19)
        end
        assert(r11_19, "错误的代码:" .. r10_19)
        r6_19 = r11_19()(r0_19)
      end
    end
    if r6_19 == nil then
      r6_19 = "nil"
    end
    PrintTable({
      FunctionName = r2_19,
      Result = r6_19,
    }, 1, "GM指令执行结果")
  end,
  ServerGM = function(r0_21, r1_21, r2_21)
    -- line: [1032, 1039] id: 21
    DebugPrint(string.format("ServerGM, %s, %s", r1_21, r2_21))
    local r3_21 = {}
    for r8_21 in string.gmatch(r2_21, "%S+") do
      table.insert(r3_21, r8_21)
    end
    -- close: r4_21
    r0_21:Server_Command(r1_21, r3_21)
  end,
  ServerBattleCommand = function(r0_22, r1_22, ...)
    -- line: [1042, 1066] id: 22
    local r4_22 = nil	-- notice: implicit variable refs by block#[0, 3, 4]
    local r2_22 = Battle(r0_22.Player)
    assert(r2_22, "没找到battle")
    local r3_22 = r2_22["GM_" .. r1_22]
    assert(r3_22, "没找到函数:GM_" .. r1_22)
    ... = ... -- error: untaken top expr
    if type(r4_22) ~= "table" then
      r4_22 = {
        ...
      }
    end
    if IsStandAlone(r0_22.Player) then
      r3_22(r2_22, table.unpack(r4_22))
      return 
    end
    local r6_22 = require("BluePrints.Combat.BattleLogic.EffectResults").Result()
    r6_22:Add(r1_22, r4_22)
    r0_22.Player:GMServerBattleCommand(r6_22:ToEffectStruct())
  end,
  DedicatedServerCommand = function(r0_23, r1_23, ...)
    -- line: [1070, 1089] id: 23
    local r2_23 = UE4.UGameplayStatics.GetPlayerController(r0_23:GetGameInstance(), 0)
    assert(r2_23, "非法PlayerController")
    local r3_23 = r2_23["GM_" .. r1_23]
    assert(r3_23, "没找到函数:GM_" .. r1_23)
    local r6_23 = require("msgpack_core").pack({
      ...
    })
    local r7_23 = FMessage()
    r7_23:SetBytes(r6_23, #r6_23)
    if IsStandAlone(r0_23.Player) then
      r3_23(r2_23, r7_23)
      return 
    end
    r2_23:GMDedicatedServerCommand(r1_23, r7_23)
  end,
  Server_Command = function(r0_24, r1_24, r2_24)
    -- line: [1092, 1112] id: 24
    local r3_24 = r0_24:GetClientAvatar()
    if r3_24 == nil then
      ScreenPrint("can not find avatar")
      return 
    end
    r3_24:CallServer("DoGmCommand", function(r0_25, ...)
      -- line: [1099, 1110] id: 25
      DebugPrint("ServerGM Callback", r1_24, r0_25)
      DebugPrintTable({
        ...
      }, 5)
      if r0_25 == ErrorCode.RET_FAIL then
        return 
      end
      if r1_24 == "scl" then
        r0_24:ClientGM("attr", "Level " .. table.unpack(r2_24))
      end
      EventManager:FireEvent(EventID.ServerGMSucceed, r1_24)
    end, r1_24, table.unpack(r2_24))
  end,
  ReloadAll = function(r0_26, ...)
    -- line: [1115, 1119] id: 26
    UUnLuaFunctionLibrary.HotReload()
  end,
  Hotfix = function(r0_27, ...)
    -- line: [1122, 1132] id: 27
    local r1_27 = require("Datas.HotfixData")
    assert(r1_27.index, "需要填写HotfixData.index")
    assert(r1_27.script, "需要填写HotfixData.script")
    local r2_27 = require("UnLuaHotReload")
    require("HotFix").ExecHotFix(r1_27.index, r1_27.script)
    GWorld.HotfixDataIndex = r1_27.index
    r0_27:ServerBattleCommand("Hotfix")
  end,
  GetAvatar = function(r0_28, ...)
    -- line: [1134, 1153] id: 28
    local r1_28 = {
      ...
    }
    local r2_28 = #r1_28
    local r3_28 = r0_28:GetClientAvatar()
    if not r3_28 then
      return 
    end
    local r5_28 = r3_28:GetClientAttrs()
    if r2_28 > 0 then
      for r9_28 = 1, r2_28, 1 do
        r5_28 = r5_28[r1_28[r9_28]]
      end
    end
    PrintTable({
      result = r5_28,
    }, 10)
  end,
  GetServerAvatar = function(r0_29, ...)
    -- line: [1155, 1164] id: 29
    local r1_29 = r0_29:GetClientAvatar()
    if not r1_29 then
      return 
    end
    r1_29:GetServerAvatar(...)
  end,
  LowQuality = function(r0_30)
    -- line: [1166, 1179] id: 30
    local r1_30 = r0_30:GetGameInstance()
    assert(r1_30, "找不到GameInstance")
    local r2_30 = UE4.UGameplayStatics.GetPlayerCharacter(r1_30, 0)
    local r3_30 = r2_30:GetController()
    r3_30:ShowFlags("DynamicShadows", false)
    r3_30:ShowFlags("VolumetricFog", false)
    r3_30:ShowFlags("PointLights", false)
    r3_30:ShowFlags("InstancedFoliage", false)
    r3_30:ShowFlags("InstancedGrass", false)
    r2_30.CharacterFashion:HideHairCapture()
  end,
  ShowFlag = function(r0_31, r1_31, r2_31)
    -- line: [1192, 1203] id: 31
    local r3_31 = r0_31:GetGameInstance()
    assert(r3_31, "找不到GameInstance")
    local r5_31 = UE4.UGameplayStatics.GetPlayerCharacter(r3_31, 0):GetController()
    if r2_31 == "1" then
      r5_31:ShowFlags(r1_31, true)
    elseif r2_31 == "0" then
      r5_31:ShowFlags(r1_31, false)
    end
  end,
  QualityLevel = function(r0_32, r1_32)
    -- line: [1205, 1210] id: 32
    local r2_32 = r0_32:GetGameInstance()
    local r3_32 = UEMGameInstance.SetOverallScalabilityLevel
    local r4_32 = nil	-- notice: implicit variable refs by block#[3]
    if r1_32 then
      r4_32 = tonumber(r1_32)
      if not r4_32 then
        ::label_11::
        r4_32 = -1
      end
    else
      goto label_11	-- block#2 is visited secondly
    end
    r3_32(r4_32)
    r4_32 = Const.ScalabilityUpdateTime + 1
    Const.ScalabilityUpdateTime = r4_32
  end,
  OpenUI = function(r0_33, r1_33, ...)
    -- line: [1212, 1227] id: 33
    local r3_33 = r0_33:GetGameInstance():GetGameUIManager()
    if DataMgr.SystemUI[r1_33] ~= nil then
      return r3_33:LoadUINew(r1_33, ...)
    end
    local r5_33 = UIConst.AllUIConfig[r1_33]
    if r5_33 == nil then
      ScreenPrint(string.format("Not find UIConfig Which Name is %s", r1_33))
      return 
    end
    return r3_33:LoadUI(r5_33.resource, r1_33, r5_33.zorder)
  end,
  HideUI = function(r0_34, r1_34, r2_34, r3_34)
    -- line: [1229, 1252] id: 34
    local r6_34 = r0_34:GetGameInstance():GetGameUIManager():GetUIObj(r1_34, true)
    if r6_34 == nil then
      ScreenPrint(string.format("Not find UIWidget Which Name is %s", r1_34))
      return 
    end
    if r2_34 == "1" then
      if type(r6_34.Show) == "function" then
        r6_34:Show(r3_34)
      else
        r6_34:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      end
    elseif type(r6_34.Hide) == "function" then
      r6_34:Hide(r3_34)
    else
      r6_34:SetVisibility(ESlateVisibility.Collapsed)
    end
  end,
  CloseUI = function(r0_35, r1_35)
    -- line: [1254, 1267] id: 35
    local r4_35 = r0_35:GetGameInstance():GetGameUIManager():GetUIObj(r1_35)
    if r4_35 == nil then
      ScreenPrint(string.format("Not find UIWidget Which Name is %s", r1_35))
      return 
    end
    if type(r4_35.Close) == "function" then
      r4_35:Close()
    end
  end,
  ShowGuideUI = function(r0_36, r1_36)
    -- line: [1269, 1274] id: 36
    UE4.UUIStateAsyncActionBase.ShowGuideUI(r0_36:GetGameInstance(), tonumber(r1_36))
  end,
  CreateNpc = function(r0_37, r1_37, r2_37, r3_37)
    -- line: [1276, 1280] id: 37
    r0_37:ServerBattleCommand("CreateNpc", r1_37, r2_37, r3_37, "StaticCreator")
  end,
  CreatePet = function(r0_38, r1_38, r2_38, r3_38)
    -- line: [1282, 1286] id: 38
    r0_38:ServerBattleCommand("CreatePet", r1_38, r2_38, r3_38, "StaticCreator")
  end,
  CreateMonster = function(r0_39, r1_39, r2_39, r3_39)
    -- line: [1288, 1292] id: 39
    r0_39:ServerBattleCommand("CreateMonster", r0_39.Player.Eid, r1_39, r2_39, r3_39, "StaticCreator")
  end,
  CreateMonsterSpawnMonster = function(r0_40, r1_40, r2_40, r3_40)
    -- line: [1294, 1298] id: 40
    r0_40:ServerBattleCommand("CreateMonster", r0_40.Player.Eid, r1_40, r2_40, r3_40, "MonsterSpawn")
  end,
  CreateTestMonster = function(r0_41, r1_41, r2_41)
    -- line: [1300, 1305] id: 41
    r0_41:ServerBattleCommand("CreateTestMonster", r0_41.Player.Eid, r1_41, r2_41)
  end,
  GuideBookFinishSomething = function(r0_42, r1_42, r2_42)
    -- line: [1307, 1314] id: 42
    local r3_42 = GWorld:GetAvatar()
    print(_G.LogTag, "GMGuideBookFinishSomething", r1_42, r2_42)
    if tonumber(r2_42) ~= nil then
      r2_42 = tonumber(r2_42)
    end
    r3_42:GuideBookFinishSomething(r1_42, r2_42)
  end,
  EchoAvatar = function(r0_43, r1_43)
    -- line: [1315, 1318] id: 43
    GWorld:GetAvatar():EchoAvatar(r1_43)
  end,
  CreatePhantom = function(r0_44, r1_44, r2_44, r3_44, r4_44, r5_44, r6_44, r7_44, r8_44)
    -- line: [1320, 1351] id: 44
    if not r1_44 or r1_44 == 0 then
      r1_44 = r0_44.Player.CurrentRoleId
    end
    if r8_44 then
      r8_44 = r8_44 ~= "0"
    else
      goto label_12	-- block#6 is visited secondly
    end
    if r5_44 and not DataMgr.Weapon[tonumber(r5_44)] then
      DebugPrint(string.format("武器表中不存在该武器ID:%s", tostring(r5_44)))
      return 
    end
    if not r6_44 or not r7_44 then
      r0_44:ServerBattleCommand("CreatePhantom", r0_44.Player.Eid, r1_44, r2_44, r3_44, r4_44, false, false, r5_44)
      return 
    else
      Const.DefaultPhantomSkillLevel = tonumber(r6_44)
      Const.DefaultPhantomSkillGrade = tonumber(r7_44)
      r0_44:ServerBattleCommand("CreatePhantom", r0_44.Player.Eid, r1_44, r2_44, r3_44, r4_44, r8_44, r8_44, r5_44)
    end
    Const.DefaultPhantomSkillLevel = 1
    Const.DefaultPhantomSkillGrade = 0
  end,
  ClearPhantoms = function(r0_45)
    -- line: [1353, 1356] id: 45
    local r1_45 = GWorld:GetAvatar()
    r0_45:ServerBattleCommand("ClearPhantoms", r0_45.Player.Eid)
  end,
  KillAllPhantoms = function(r0_46)
    -- line: [1358, 1360] id: 46
    r0_46:ServerBattleCommand("KillAllPhantoms")
  end,
  CreateMechanismSummon = function(r0_47, r1_47, r2_47)
    -- line: [1362, 1372] id: 47
    if not r1_47 or r1_47 == 0 then
      ScreenPrint(string.format("CreateMechanismSummon Error,UnitId:%s", tostring(r1_47)))
      return 
    end
    r0_47:ServerBattleCommand("CreateMechanismSummon", r0_47.Player.Eid, r1_47, r2_47)
  end,
  KillMonster = function(r0_48, r1_48)
    -- line: [1375, 1380] id: 48
    r0_48:ServerBattleCommand("KillMonster", r0_48.Player.Eid, r1_48)
  end,
  RecoverySelf = function(r0_49)
    -- line: [1382, 1387] id: 49
    r0_49:ServerBattleCommand("RecoverySelf", r0_49.Player.Eid)
  end,
  RecoverPlayer = function(r0_50, r1_50, r2_50, r3_50)
    -- line: [1389, 1393] id: 50
    r0_50:ServerBattleCommand("RecoverPlayer", r0_50.Player.Eid, r1_50, r2_50, r3_50)
  end,
  HideMonsterCapsule = function(r0_51, r1_51)
    -- line: [1395, 1409] id: 51
    local r2_51 = false
    if r1_51 ~= nil and string.lower(r1_51) == "true" then
      r2_51 = true
    end
    for r8_51, r9_51 in pairs(Battle(r0_51.Player):GetAllEntities()) do
      if r9_51 and r9_51.IsMonster and r9_51:IsMonster() then
        r9_51.CapsuleComponent:SetHiddenInGame(r2_51, false)
      end
    end
    -- close: r4_51
    ScreenPrint(string.format("HideMonsterCapsule %s", r2_51))
  end,
  HideMonster = function(r0_52, r1_52)
    -- line: [1411, 1424] id: 52
    local r2_52 = false
    if r1_52 ~= nil and string.lower(r1_52) == "true" then
      r2_52 = true
    end
    for r8_52, r9_52 in pairs(Battle(r0_52.Player):GetAllEntities()) do
      if r9_52 and r9_52.IsMonster and r9_52:IsMonster() then
        r9_52:SetActorHideTag("GMHideMonster", r2_52)
      end
    end
    -- close: r4_52
  end,
  StartQuestChain = function(r0_53, r1_53)
    -- line: [1426, 1438] id: 53
    if not r1_53 then
      ScreenPrint(string.format("QuestChainId %s is invalid", r1_53))
      return 
    end
    r1_53 = tonumber(r1_53)
    local r2_53 = GWorld:GetAvatar()
    if r2_53 then
      r2_53:GMStartQuestChain(r1_53)
    end
  end,
  FallAttackPoint = function(r0_54, r1_54)
    -- line: [1440, 1464] id: 54
    local r4_54 = UE4.UGameplayStatics.GetPlayerCharacter(r0_54:GetGameInstance(), 0):GetOrAddFallAttackObject()
    if r1_54 == nil then
      r4_54.bFallAttackPoint = false
      r4_54.FallAttackPoint = FVector(0, 0, 0)
      ScreenPrint(string.format("FallAttackPoint is closed"))
      return 
    end
    local r6_54 = UE4.UGameplayStatics.GetGameState(r0_54.Player):GetTargetPoint(r1_54)
    if not r6_54 then
      ScreenPrint(string.format("FallAttackPoint Setting Failed", r1_54))
      return 
    end
    if r6_54.IsActive then
      r4_54.bFallAttackPoint = true
      r4_54.FallAttackPoint = r6_54:K2_GetActorLocation()
      print("FallAttackPoint is open at", r4_54.FallAttackPoint)
    end
  end,
  SwitchKawaiiDebug = function(r0_55, r1_55)
    -- line: [1466, 1478] id: 55
    if not r0_55.Player then
      return 
    end
    if not r0_55.Player.PlayerAnimInstance then
      return 
    end
    r1_55 = tonumber(r1_55)
    r1_55 = r1_55 == 1
    r0_55.Player.PlayerAnimInstance.ArtDebugSwitch = r1_55
  end,
  FallAttackPointPos = function(r0_56, r1_56, r2_56, r3_56)
    -- line: [1480, 1505] id: 56
    local r6_56 = UE4.UGameplayStatics.GetPlayerCharacter(r0_56:GetGameInstance(), 0):GetOrAddFallAttackObject()
    if r1_56 == nil and r2_56 == nil and r3_56 == nil then
      r6_56.bFallAttackPoint = false
      r6_56.FallAttackPoint = FVector(0, 0, 0)
      ScreenPrint(string.format("FallAttackPoint is closed"))
      return 
    end
    if r2_56 == nil then
      r2_56 = "0"
    end
    if r3_56 == nil then
      r3_56 = "0"
    end
    print("FallAttackPoint is open at", r1_56, r2_56, r3_56)
    r1_56 = tonumber(r1_56)
    r2_56 = tonumber(r2_56)
    r3_56 = tonumber(r3_56)
    r6_56.bFallAttackPoint = true
    r6_56.FallAttackPoint = FVector(r1_56, r2_56, r3_56)
    print("FallAttackPoint is open at", r6_56.FallAttackPoint)
  end,
  SuccQuestChain = function(r0_57, r1_57)
    -- line: [1507, 1520] id: 57
    if not r1_57 then
      ScreenPrint(string.format("QuestChainId %s is invalid", r1_57))
      return 
    end
    r1_57 = tonumber(r1_57)
    local r2_57 = GWorld:GetAvatar()
    if r2_57 then
      r2_57:GMSuccQuestChain(r1_57)
    end
    r0_57:StopStoryline(r1_57)
  end,
  CleanQuestChain = function(r0_58, r1_58)
    -- line: [1522, 1533] id: 58
    if not r1_58 then
      return 
    end
    r1_58 = tonumber(r1_58)
    local r2_58 = GWorld:GetAvatar()
    if r2_58 then
      r2_58:GMCleanQuestChain(r1_58)
    end
    r0_58:StopStoryline(r1_58)
  end,
  CleanAllQuest = function(r0_59)
    -- line: [1535, 1540] id: 59
    GWorld:GetAvatar():GMCleanAllQuest()
  end,
  ChangeToNewModel = function(r0_60, r1_60)
    -- line: [1542, 1559] id: 60
    if not r1_60 then
      return 
    end
    if GWorld:GetAvatar() then
      ScreenPrint("连接服务器情况下，请在军械库更换角色")
      return 
    end
    r1_60 = tonumber(r1_60)
    if r0_60.Player.ChangeRole then
      r0_60.Player:ChangeRole(r1_60)
    end
  end,
  ChangeWeapon = function(r0_61, r1_61)
    -- line: [1561, 1572] id: 61
    if not r1_61 then
      ScreenPrint("需要传入武器编号才可以进行武器更换哦~")
      return 
    end
    if r0_61.Player then
      r0_61.Player:ChangeToNewWeapon(tonumber(r1_61))
      EventManager:FireEvent(EventID.OnSwitchWeapon)
    end
  end,
  GetOrSetRangedWeaponBulletNum = function(r0_62, r1_62)
    -- line: [1574, 1584] id: 62
    if r1_62 == nil then
      ScreenPrint(string.format("当前远程武器剩余子弹数量: %s", r0_62.Player.RangedWeapon:GetAttr("BulletNum")))
    else
      r1_62 = tonumber(r1_62)
      r0_62.Player.RangedWeapon:SetAttr("BulletNum", r1_62)
    end
  end,
  ForbidDamage = function(r0_63)
    -- line: [1586, 1594] id: 63
    local r1_63 = false
    if r0_63.Player then
      r1_63 = require("EMLuaConst").bForbidDamage
    end
    r0_63:ServerBattleCommand("ForbidDamage", not r1_63)
  end,
  ForbidPlay = function(r0_64)
    -- line: [1596, 1604] id: 64
    local r1_64 = false
    if r0_64.Player then
      r1_64 = require("EMLuaConst").bForbidPlay
    end
    r0_64:ServerBattleCommand("ForbidPlay", not r1_64)
  end,
  TestBattle = function(r0_65, r1_65)
    -- line: [1606, 1610] id: 65
    r0_65:ServerBattleCommand("TestBattle", r1_65)
  end,
  GetOrSetPlayerAttr = function(r0_66, r1_66, r2_66)
    -- line: [1627, 1636] id: 66
    if not r1_66 then
      ScreenPrint(string.format("至少需要传入属性名才可进行查询操作"))
    else
      r0_66:ServerBattleCommand("GetOrSetPlayerAttr", r0_66.Player.Eid, r1_66, r2_66)
    end
  end,
  GetOrSetPlayerWeaponAttr = function(r0_67, r1_67, r2_67, r3_67)
    -- line: [1638, 1647] id: 67
    if not r1_67 or not r2_67 then
      ScreenPrint(string.format("至少需要传入武器编号和属性名才可进行查询操作"))
    else
      r0_67:ServerBattleCommand("GetOrSetPlayerWeaponAttr", r0_67.Player.Eid, r1_67, r2_67, r3_67)
    end
  end,
  RandomCreateTest = function(r0_68, r1_68, r2_68)
    -- line: [1649, 1692] id: 68
    local r3_68 = r1_68 and 1
    local r4_68 = r2_68 and 1000000
    local r5_68 = {}
    local r6_68 = {}
    local r7_68 = 0
    local r8_68 = {}
    for r13_68, r14_68 in pairs(DataMgr.RandomCreator[r3_68].RandomInfos) do
      r6_68[r14_68.UnitId] = 0
      r8_68[r14_68.UnitId] = r14_68.Weight
      r7_68 = r7_68 + r14_68.Weight
    end
    -- close: r9_68
    local function r9_68(r0_69)
      -- line: [1665, 1674] id: 69
      for r5_69, r6_69 in pairs(r8_68) do
        if math.random(1, r0_69) <= r6_69 then
          return r5_69
        else
          r0_69 = r0_69 - r6_69
        end
      end
      -- close: r1_69
    end
    for r13_68 = 1, r4_68, 1 do
      local r14_68 = r9_68(r7_68)
      if r5_68[r14_68] == nil then
        rawset(r5_68, r14_68, 1)
      else
        rawset(r5_68, r14_68, rawget(r5_68, r14_68) + 1)
      end
    end
    for r14_68, r15_68 in pairs(r5_68) do
      rawset(r5_68, r14_68, r15_68 / r4_68)
    end
    -- close: r10_68
    PrintTable(r5_68)
  end,
  MaxBullet = function(r0_70)
    -- line: [1694, 1700] id: 70
    r0_70:ServerBattleCommand("MaxBullet", r0_70.Player.Eid)
    Battle(r0_70.Player):GM_MaxBullet(r0_70.Player.Eid)
  end,
  MaxMagazineBullet = function(r0_71)
    -- line: [1702, 1707] id: 71
    r0_71:ServerBattleCommand("MaxMagazineBullet", r0_71.Player.Eid)
  end,
  MaxAttack = function(r0_72)
    -- line: [1709, 1714] id: 72
    r0_72:ServerBattleCommand("MaxAttack", r0_72.Player.Eid)
  end,
  MaxDefence = function(r0_73)
    -- line: [1716, 1721] id: 73
    r0_73:ServerBattleCommand("MaxDefence", r0_73.Player.Eid)
  end,
  MaxSp = function(r0_74)
    -- line: [1723, 1728] id: 74
    r0_74:ServerBattleCommand("MaxSp", r0_74.Player.Eid)
  end,
  AddSp = function(r0_75, r1_75)
    -- line: [1730, 1735] id: 75
    r0_75:ServerBattleCommand("AddSp", r0_75.Player.Eid, tonumber(r1_75))
  end,
  MaxHp = function(r0_76)
    -- line: [1737, 1742] id: 76
    r0_76:ServerBattleCommand("MaxHp", r0_76.Player.Eid)
  end,
  AddHp = function(r0_77, r1_77)
    -- line: [1744, 1749] id: 77
    r0_77:ServerBattleCommand("AddHp", r0_77.Player.Eid, tonumber(r1_77))
  end,
  MaxES = function(r0_78)
    -- line: [1751, 1756] id: 78
    r0_78:ServerBattleCommand("MaxES", r0_78.Player.Eid)
  end,
  AddES = function(r0_79, r1_79)
    -- line: [1758, 1763] id: 79
    r0_79:ServerBattleCommand("AddES", r0_79.Player.Eid, tonumber(r1_79))
  end,
  God = function(r0_80)
    -- line: [1765, 1777] id: 80
    r0_80:MaxBullet()
    r0_80:MaxAttack()
    r0_80:MaxDefence()
    r0_80:MaxSp()
    r0_80:MaxHp()
    r0_80:MaxES()
    r0_80:NoCDForSkill()
    r0_80:MaxTriggerProbability()
  end,
  MaxTriggerProbability = function(r0_81)
    -- line: [1779, 1785] id: 81
    if Battle(r0_81.Player).IsFullTriggerProbability then
      Battle(r0_81.Player).IsFullTriggerProbability = false
    else
      Battle(r0_81.Player).IsFullTriggerProbability = true
    end
  end,
  AddMod = function(r0_82, r1_82, r2_82, r3_82)
    -- line: [1787, 1802] id: 82
    if not r2_82 then
      r2_82 = 0
    end
    if not r3_82 then
      r3_82 = 1
    end
    r1_82 = tonumber(r1_82)
    assert(DataMgr.Mod[r1_82], "找不到编号为【" .. tostring(r1_82) .. "】的Mod")
    r3_82 = tonumber(r3_82)
    local r4_82 = assert
    local r5_82 = nil	-- notice: implicit variable refs by block#[8]
    if r3_82 >= 1 then
      r5_82 = r3_82 <= 4
    else
      goto label_30	-- block#6 is visited secondly
    end
    r4_82(r5_82, "请填写1~4之间的Type,1=角色，2=近战武器，3=远程武器, 4=显赫武器")
    r0_82:ServerBattleCommand("AddMod", tonumber(r1_82), r0_82.Player.Eid, r2_82, r3_82)
  end,
  DebugMod = function(r0_83, r1_83)
    -- line: [1806, 1809] id: 83
    r1_83 = tonumber(r1_83)
    ModCommon.DebugMode = r1_83 == 1
  end,
  DefCoreGod = function(r0_84)
    -- line: [1811, 1827] id: 84
    local r1_84 = UE.UGameplayStatics.GetGameState(r0_84.Player)
    if not r1_84 then
      return 
    end
    local r2_84 = r1_84.DefBaseMap:Keys():ToTable()[1]
    r0_84:ServerBattleCommand("MaxHp", r2_84)
    r0_84:ServerBattleCommand("MaxDefence", r2_84)
    r0_84:ServerBattleCommand("MaxES", r2_84)
  end,
  UnlimitFire = function(r0_85)
    -- line: [1829, 1835] id: 85
    r0_85:MaxBullet()
    r0_85:MaxMagazineBullet()
  end,
  NoCDForSkill = function(r0_86)
    -- line: [1837, 1845] id: 86
    for r5_86, r6_86 in pairs(r0_86.Player.Skills) do
      r6_86:ResetSkillCd()
    end
    -- close: r1_86
    Battle(r0_86.Player):GM_NoCDForSkill(r0_86.Player.Eid)
    r0_86:ServerBattleCommand("NoCDForSkill", r0_86.Player.Eid)
  end,
  UpdateMonCd = function(r0_87)
    -- line: [1847, 1852] id: 87
    Battle(r0_87.Player):GM_UpdateMonSkillCd()
    r0_87:ServerBattleCommand("UpdateMonSkillCd")
  end,
  FireDanmaku = function(r0_88, r1_88, r2_88)
    -- line: [1854, 1861] id: 88
    r1_88 = tonumber(r1_88)
    r2_88 = tonumber(r2_88)
    assert(DataMgr.DanmakuTemplate[r1_88], "弹幕模板编号不存在")
    r0_88:ServerBattleCommand("FireDanmaku", r0_88.Player.Eid, r1_88, r2_88, "")
  end,
  MonsterMaxHp = function(r0_89)
    -- line: [1863, 1868] id: 89
    r0_89:ServerBattleCommand("MonsterMaxHp")
  end,
  DebugMonsterSpawn = function(r0_90)
    -- line: [1870, 1874] id: 90
    local r1_90 = UE.UGameplayStatics.GetGameMode(r0_90.Player)
    r1_90.DebugMonsterSpawn = not r1_90.DebugMonsterSpawn
  end,
  DebugPrintMonsterSpawn = function(r0_91)
    -- line: [1876, 1880] id: 91
    local r1_91 = UE.UGameplayStatics.GetGameMode(r0_91.Player)
    r1_91.DebugPrintMonsterSpawn = not r1_91.DebugPrintMonsterSpawn
  end,
  GuideAllMonster = function(r0_92)
    -- line: [1883, 1890] id: 92
    local r1_92 = UE.UGameplayStatics.GetGameMode(r0_92.Player)
    for r6_92, r7_92 in pairs(r1_92.EMGameState.MonsterMap) do
      if IsValid(r7_92) and not r7_92:IsDead() then
        r1_92.EMGameState:AddGuideEid(r6_92)
      end
    end
    -- close: r2_92
  end,
  PrintLevelDebugInfo = function(r0_93)
    -- line: [1893, 1926] id: 93
    local r1_93 = {}
    local r2_93 = "================="
    local r3_93 = "====="
    if IsStandAlone(GWorld.GameInstance) then
      table.insert(r1_93, r2_93 .. " PrintLevelDebugInfo " .. r2_93 .. "\n")
      table.insert(r1_93, r3_93 .. " PrintGameStateInfo " .. r3_93 .. "\n")
      r0_93:FillGameStateInfo(r1_93)
      table.insert(r1_93, r3_93 .. " PrintGameModeInfo " .. r3_93 .. "\n")
      r0_93:FillGameModeInfo(r1_93)
      table.insert(r1_93, r3_93 .. " PrintPlayerInfo " .. r3_93 .. "\n")
      r0_93:FillPlayerInfo(r1_93)
      table.insert(r1_93, r2_93 .. r2_93 .. r2_93 .. "\n")
    else
      r0_93:DedicatedServerCommand("PrintLevelDebugInfo")
      table.insert(r1_93, r2_93 .. " PrintLevelDebugInfo  Client " .. r2_93 .. "\n")
      table.insert(r1_93, r3_93 .. " PrintGameStateInfo Client " .. r3_93 .. "\n")
      r0_93:FillGameStateInfo(r1_93)
      table.insert(r1_93, r3_93 .. " PrintPlayerInfo Client " .. r3_93 .. "\n")
      r0_93:FillPlayerInfo(r1_93)
      table.insert(r1_93, r2_93 .. r2_93 .. r2_93 .. "\n")
    end
    local r4_93 = table.concat(r1_93)
    DebugPrint(r4_93)
    UUIFunctionLibrary.ClipboardCopy(r4_93)
  end,
  FillGameStateInfo = function(r0_94, r1_94)
    -- line: [1928, 1961] id: 94
    local r2_94 = UE.UGameplayStatics.GetGameState(r0_94.Player)
    table.insert(r1_94, "DungeonId\t" .. tostring(r2_94.DungeonId) .. "\n")
    table.insert(r1_94, "GameModeType\t" .. r2_94.GameModeType .. "\n")
    table.insert(r1_94, "GameModeState\t" .. EGameModeState:GetNameByValue(r2_94.GameModeState) .. "\n")
    table.insert(r1_94, "DungeonUIState\t" .. EDungeonUIState:GetNameByValue(r2_94.DungeonUIState) .. "\n")
    table.insert(r1_94, "GameModeLevel\t" .. tostring(r2_94.GameModeLevel) .. "\n")
    table.insert(r1_94, "DungeonProgress\t" .. tostring(r2_94.DungeonProgress) .. "\n")
    table.insert(r1_94, "InDungeon\t" .. tostring(r2_94:IsInDungeon()) .. "\n")
    table.insert(r1_94, "InCommonAlert\t" .. tostring(r2_94.InCommonAlert) .. "\n")
    local r3_94 = ""
    for r7_94 = 1, r2_94.DungeonEvent:Num(), 1 do
      r3_94 = r3_94 .. r2_94.DungeonEvent:GetValueByIdx(r7_94 + -1) .. ", "
    end
    table.insert(r1_94, "DungeonEvent\t" .. r3_94 .. "\n")
    local r4_94 = ""
    for r8_94 = 1, r2_94.GuideEids.Items:Num(), 1 do
      r4_94 = r4_94 .. r2_94.GuideEids.Items:GetRef(r8_94).IntProperty .. ", "
    end
    table.insert(r1_94, "GuideEids\t" .. r4_94 .. "\n")
    local r5_94 = r0_94.Player.PlayerState
    local r6_94 = ""
    for r10_94 = 1, r5_94.PlayerGuideEids.Items:Num(), 1 do
      r6_94 = r6_94 .. r5_94.PlayerGuideEids.Items:GetRef(r10_94).IntProperty .. ", "
    end
    table.insert(r1_94, "PlayerGuideEids\t" .. r6_94 .. "\n")
  end,
  FillGameModeInfo = function(r0_95, r1_95)
    -- line: [1963, 1979] id: 95
    local r2_95 = UE.UGameplayStatics.GetGameMode(r0_95.Player)
    local r3_95 = ""
    for r8_95, r9_95 in pairs(r2_95.MonsterSpawnMap) do
      r3_95 = r3_95 .. r8_95 .. ", "
    end
    -- close: r4_95
    table.insert(r1_95, "MonsterSpawnMap\t" .. r3_95 .. "\n")
    table.insert(r1_95, "SubGameModeInfo\t LevelName\t IsActive\n")
    for r8_95, r9_95 in pairs(r2_95.SubGameModeInfo) do
      table.insert(r1_95, "...............\t " .. r8_95 .. "\t " .. tostring(r9_95.IsActive) .. "\n")
    end
    -- close: r4_95
    r2_95:TriggerDungeonComponentFun("Print" .. r2_95.EMGameState.GameModeType .. "DebugInfo", r1_95)
    table.insert(r1_95, "Player_LevelName\t" .. r2_95:GetActorLevelName(r0_95.Player) .. "\n")
  end,
  FillPlayerInfo = function(r0_96, r1_96)
    -- line: [1981, 1997] id: 96
    if UE.UGameplayStatics.GetGameState(r0_96.Player):IsInDungeon() then
      try({
        exec = function()
          -- line: [1985, 1987] id: 97
          r0_96:FillScanLevelInfo(r1_96)
        end,
      })
    end
    local r3_96 = r0_96.Player:K2_GetActorLocation()
    table.insert(r1_96, "Player Location XYZ \t" .. r3_96.X .. " " .. r3_96.Y .. " " .. r3_96.Z .. "\n")
    table.insert(r1_96, "FrameRate \t" .. tostring(1 / UE4.UGameplayStatics.GetWorldDeltaSeconds(r0_96.Player)) .. "\n")
    table.insert(r1_96, "PlayerPing \t" .. tostring(r0_96.Player.PlayerState:GetPlayerPing()) .. "\n")
  end,
  FillScanLevelInfo = function(r0_98, r1_98)
    -- line: [1999, 2027] id: 98
    local r2_98 = UE4.URuntimeCommonFunctionLibrary.GetLevelLoadJsonName(r0_98.Player)
    local function r3_98(r0_99)
      -- line: [2001, 2008] id: 99
      return require("rapidjson").decode(UE4.URuntimeCommonFunctionLibrary.LoadFile(UE4.UKismetSystemLibrary.GetProjectContentDirectory() .. "Script/Datas/Houdini_data/" .. r0_99 .. ".json"))
    end
    local r4_98 = r0_98.Player.CurrentLevelId
    table.insert(r1_98, "当前玩家进的拼接关卡 \t" .. r2_98 .. "\n")
    for r10_98, r11_98 in pairs(r3_98(r2_98).points) do
      for r15_98 = 1, r4_98:Length(), 1 do
        local r16_98 = r4_98:Get(r15_98)
        if tostring(r11_98.id) == r16_98 then
          local r17_98 = r11_98.art_path
          if r17_98 == "" then
            r17_98 = string.gsub(r11_98.struct, "Data_Design", "Data_Art", 1)
          end
          table.insert(r1_98, "所在的美术关卡 \t" .. r17_98 .. "\t关卡id\t" .. r16_98 .. "\n")
        end
      end
    end
    -- close: r6_98
  end,
  PrintPlayerInfoOnScreen = function(r0_100)
    -- line: [2029, 2060] id: 100
    local r1_100 = {}
    Battle(GWorld.GameInstance):FillBattleLog(r1_100)
    local r2_100 = "---------------玩家信息-------------\n"
    for r7_100, r8_100 in ipairs(r1_100) do
      r2_100 = r2_100 .. r8_100
    end
    -- close: r3_100
    local r3_100 = {}
    if IsDedicatedServer(GWorld.GameInstance) then
      r3_100 = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance):GetAllPlayer()
    else
      table.insert(r3_100, UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0))
    end
    local r4_100 = UE.UGameplayStatics.GetGameState(GWorld.GameInstance)
    for r9_100, r10_100 in pairs(r3_100) do
      if r4_100:IsInDungeon() then
      end
      r2_100 = r2_100 .. "玩家位置" .. tostring(r10_100:K2_GetActorLocation()) .. "\n" .. "帧率" .. 1 / UE4.UGameplayStatics.GetWorldDeltaSeconds(r10_100) .. "\n" .. "延迟" .. r10_100.PlayerState:GetPlayerPing() .. "\n"
    end
    -- close: r5_100
    URuntimeCommonFunctionLibrary.AddOnScreenDebugMessage(-1, 5, FColor(255, 255, 255), r2_100, false, FVector2D(1, 1))
    DebugPrint(r2_100)
  end,
  PrintGameModeInfoOnScreen = function(r0_101)
    -- line: [2062, 2102] id: 101
    local r1_101 = "-------GameModeInfo----------\n" .. "环境：联机"
    if IsStandAlone(GWorld.GameInstance) then
      r1_101 = r1_101 .. "环境：单机\n"
    end
    local r2_101 = UE.UGameplayStatics.GetGameState(GWorld.GameInstance)
    r1_101 = r1_101 .. "DungeonId: " .. r2_101.DungeonId .. "\n" .. "GameModeType: " .. r2_101.GameModeType .. "\n" .. "GameModeState: " .. EGameModeState:GetNameByValue(r2_101.GameModeState) .. "\n" .. "DungeonUIState: " .. EDungeonUIState:GetNameByValue(r2_101.DungeonUIState) .. "\n" .. "GameModeLevel: " .. r2_101.GameModeLevel .. "\n" .. "DungeonProgress: " .. r2_101.DungeonProgress .. "\n" .. "InDungeon: " .. tostring(r2_101:IsInDungeon()) .. "\n" .. "InCommonAlert: " .. tostring(r2_101.InCommonAlert) .. "\n"
    local r3_101 = ""
    for r7_101 = 1, r2_101.DungeonEvent:Num(), 1 do
      r3_101 = r3_101 .. r2_101.DungeonEvent:GetValueByIdx(r7_101 + -1) .. ", "
    end
    r1_101 = r1_101 .. "DungeonEvent: " .. r3_101 .. "\n"
    URuntimeCommonFunctionLibrary.AddOnScreenDebugMessage(-1, 5, FColor(255, 255, 255), r1_101, false, FVector2D(1, 1))
    DebugPrint(r1_101)
  end,
  RequestSnapShotInfo = function(r0_102)
    -- line: [2105, 2107] id: 102
    r0_102.Player.RPCComponent:RequestSnapShotInfo()
  end,
  RequestMonsterCacheInfo = function(r0_103)
    -- line: [2109, 2111] id: 103
    r0_103.Player.RPCComponent:RequestMonsterCacheInfo()
  end,
  RequestStaticCreatorInfo = function(r0_104)
    -- line: [2113, 2115] id: 104
    r0_104.Player.RPCComponent:RequestStaticCreatorInfo()
  end,
  PrintActorSCLoc = function(r0_105, r1_105)
    -- line: [2117, 2134] id: 105
    local r2_105 = tonumber(r1_105)
    local r3_105 = Battle(r0_105.Player):GetEntity(r2_105)
    if not r3_105 then
      return 
    end
    local r4_105 = r3_105:GetName()
    r0_105.Player:AddTimer(0.1, function()
      -- line: [2127, 2131] id: 106
      DebugPrint("PrintActorSCLoc Actor Eid:", r2_105, "Name:", r4_105, " Loc:", r3_105:K2_GetActorLocation(), "Rot:", r3_105:K2_GetActorRotation())
    end, true)
    r0_105:DedicatedServerCommand("PrintActorSCLoc", r2_105)
  end,
  LJLTEST = function(r0_107, r1_107)
    -- line: [2136, 2176] id: 107
    r0_107.Player.RPCComponent:NotifyServerStartDelivery()
  end,
  YXDTEST = function(r0_108, r1_108)
    -- line: [2178, 2225] id: 108
    local r2_108 = UE.UGameplayStatics.GetGameMode(r0_108.Player)
    local r4_108 = TArray(FString)
    r4_108:Add("/Game/Maps/Levels/Chapter01/Chapter01_Main/Art_Data/Chapter01_IcelakeCity_Art/Chapter01_IcelakeCity_Temp_Art_Foliage.Chapter01_IcelakeCity_Temp_Art_Foliage")
    local r6_108 = TArray(FString)
    r6_108:Add("/Game/Maps/Levels/Chapter01/Chapter01_Main/Art_Data/Chapter01_IcelakeCity_Art/Chapter01_IcelakeCity_Art_Foliage.Chapter01_IcelakeCity_Art_Foliage")
    r2_108:ChangeLevelLoadingState(r4_108, r6_108)
    if r1_108 == "1" then
      r2_108:TriggerQuestArtLevelChange({
        TestVar1 = {
          OldValue = 0,
          NewValue = 1,
        },
      })
    elseif r1_108 == "2" then
      r2_108:TriggerQuestArtLevelChange({
        TestVar1 = {
          OldValue = 1,
          NewValue = 0,
        },
      })
    end
    if r1_108 == "3" then
      local r7_108 = TArray(0)
      r7_108:Add(-1)
      r2_108:TriggerCreateMonsterSpawn(r7_108, false)
    end
    if r1_108 == "6" then
      local r7_108 = UE4.UGameplayStatics.GetActorOfClass(r2_108, UE4.AEnvironmentManager:StaticClass())
      local r8_108 = nil
      if r7_108 then
        r8_108 = r7_108:GetTimeOfDay()
        r7_108:SetBlendTime(0.1)
        r7_108:SetTimeOfDay(0)
        r7_108:SetTimeOfDay(12)
      end
      DebugPrint("yxd @@@@@@@@@@@@@@@@@@@@@@@@", r8_108, r7_108)
    end
  end,
  THYTEST = function(r0_109, r1_109, r2_109, r3_109)
    -- line: [2227, 2266] id: 109
    DebugPrint("THY  THYTEST ")
    local r4_109 = UE.UGameplayStatics.GetGameMode(r0_109.Player)
    local r5_109 = GWorld:GetAvatar()
    if not r4_109 then
      return 
    end
    if r1_109 == "1" then
      r4_109:ShowTrialTask(r2_109)
    elseif r1_109 == "2" then
      r5_109:EnterCharTrial(nil, 900002, 105101011)
    elseif r1_109 == "3" then
      DebugPrint("thy    GameMode.GameState.GameModeType", r4_109.GameState.GameModeType)
    elseif r1_109 == "4" then
      DebugPrint("thy   RoomIndex", GWorld.RougeLikeManager.RoomIndex)
      DebugPrint("thy   IsCurRougeLikeRoomClear", GWorld.RougeLikeManager:IsCurRougeLikeRoomClear())
      DebugPrint("thy   GetCurRougeLikeRoomType", GWorld.RougeLikeManager:GetCurRougeLikeRoomType())
    elseif r1_109 == "5" then
      DebugPrint("thy     gm", r2_109, r3_109)
      local r6_109 = r2_109 .. "#" .. r3_109
      DebugPrint("thy     EventName", r6_109)
      r4_109:PostCustomEvent(r6_109)
    elseif r1_109 == "6" then
      r4_109:ResetRegionSpecialQuest()
    elseif r1_109 == "7" then
      r4_109:UpdateProgressToTarget(r2_109)
    elseif r1_109 == "8" then
      UIManager(GWorld.GameInstance):LoadUINew("RegionCoDefenceProgress")
    elseif r1_109 == "9" then
      UIManager(GWorld.GameInstance):LoadUINew("TiaoPin")
    elseif r1_109 == "10" then
      UIManager(GWorld.GameInstance):GetUIObj("TiaoPin"):PrintBindMessage()
    elseif r1_109 == "11" then
      DebugPrint("thy   IsInRegion", r4_109:IsInRegion())
    end
  end,
  JTYTEST = function(r0_110, r1_110)
    -- line: [2268, 2289] id: 110
    UIManager(r0_110):ShowCommonPopupUI(100000, {
      TabConfigData = {
        TitleName = GText("MAIN_UI_FORGE"),
        LeftKey = "Q",
        RightKey = "E",
        StyleName = "Text",
        Tabs = {
          {
            Text = "测试1",
            TabId = 1,
          },
          {
            Text = "测试2",
            TabId = 2,
          }
        },
        DynamicNode = {
          "Back",
          "ResourceBar",
          "BottomKey"
        },
        BottomKeyInfo = {},
        OwnerPanel = r0_110,
        ChildWidgetBPPath = "WidgetBlueprint\'/Game/UI/WBP/Announcement/Widget/WBP_Announcement_TabItem.WBP_Announcement_TabItem\'",
      },
    })
  end,
  HTYTEST = function(r0_111, r1_111, r2_111)
    -- line: [2291, 2351] id: 111
    local r3_111 = nil	-- notice: implicit variable refs by block#[18, 19, 21, 22]
    if r1_111 == "1" then
      r3_111 = UE.UGameplayStatics.GetGameMode(r0_111.Player)
      r3_111:OpenGuideIconDungeon("Mechanism", 11201)
      r3_111:OpenGuideIconDungeon("Mechanism", 10613)
    elseif r1_111 == "2" then
      r3_111 = UE.UGameplayStatics.GetGameMode(r0_111.Player)
      r3_111:CloseGuideIconDungeon("Mechanism", 11201)
      r3_111:CloseGuideIconDungeon("Mechanism", 10613)
    elseif r1_111 == "3" then
      r3_111 = UIManager(r0_111)
      r3_111:LoadUINew("GuideBook_Tips", 1001)
    elseif r1_111 == "4" then
      r3_111 = UE.UGameplayStatics.GetGameMode(r0_111.Player)
      local r4_111 = TArray(0)
      r4_111:Add(-1)
      r3_111:TriggerCreateMonsterSpawn(r4_111, false)
    elseif r1_111 == "PrintPlayArray" then
      r3_111 = UE4.UGameplayStatics.GetGameState(r0_111.Player)
      for r9_111, r10_111 in pairs(r3_111.PlayerArray) do
        DebugPrint("PLAYER ARRAY INFO: ", r9_111, r10_111.Eid)
      end
      -- close: r5_111
    elseif r1_111 == "5" then
      r3_111 = UE4.USubsystemBlueprintLibrary.GetWorldSubsystem(r0_111.Player, UE4.UWorldCompositionSubSystem)
      if r3_111 then
        r3_111:LoadOrUnloadLevelDynamically("Prologue_Main_01_Art_Breakable", true)
        r0_111.Player:AddTimer(0.2, function()
          -- line: [2317, 2319] id: 112
          r3_111:LoadOrUnloadLevelDynamically("Prologue_Main_01_Art_Breakable", false)
        end, false, 0)
        r0_111.Player:AddTimer(0.4, function()
          -- line: [2320, 2322] id: 113
          r3_111:LoadOrUnloadLevelDynamically("Prologue_Main_01_Art_Breakable", true)
        end, false, 0)
        r0_111.Player:AddTimer(0.6, function()
          -- line: [2323, 2325] id: 114
          r3_111:LoadOrUnloadLevelDynamically("Prologue_Main_01_Art_Breakable", false)
        end, false, 0)
        r0_111.Player:AddTimer(0.8, function()
          -- line: [2326, 2328] id: 115
          r3_111:LoadOrUnloadLevelDynamically("Prologue_Main_01_Art_Breakable", true)
        end, false, 0)
        r0_111.Player:AddTimer(1, function()
          -- line: [2329, 2331] id: 116
          r3_111:LoadOrUnloadLevelDynamically("Prologue_Main_01_Art_Breakable", false)
        end, false, 0)
        r0_111.Player:AddTimer(1.2, function()
          -- line: [2332, 2334] id: 117
          r3_111:LoadOrUnloadLevelDynamically("Prologue_Main_01_Art_Breakable", true)
        end, false, 0)
        r0_111.Player:AddTimer(1.4, function()
          -- line: [2335, 2337] id: 118
          r3_111:LoadOrUnloadLevelDynamically("Prologue_Main_01_Art_Breakable", false)
        end, false, 0)
      end
      -- close: r3_111
    elseif r1_111 == "6" then
      r3_111 = UE4
      r3_111 = r3_111.USubsystemBlueprintLibrary
      r3_111 = r3_111.GetWorldSubsystem
      r3_111 = r3_111(r0_111.Player, UE4.UWorldCompositionSubSystem)
      if r3_111 then
        r3_111:LoadOrUnloadLevelDynamically("Prologue_Main_01_Art_Breakable", true)
      end
    elseif r1_111 == "7" then
      r3_111 = UE4
      r3_111 = r3_111.USubsystemBlueprintLibrary
      r3_111 = r3_111.GetWorldSubsystem
      r3_111 = r3_111(r0_111.Player, UE4.UWorldCompositionSubSystem)
      if r3_111 then
        r3_111:LoadOrUnloadLevelDynamically("Prologue_Main_01_Art_Breakable", false)
      end
    end
  end,
  DungeonEventTest = function(r0_119, r1_119, r2_119)
    -- line: [2353, 2369] id: 119
    if not IsStandAlone(GWorld.GameInstance) then
      r0_119:DedicatedServerCommand("DungeonEventTest", r1_119, r2_119)
    else
      local r3_119 = UE.UGameplayStatics.GetGameMode(r0_119.Player)
      if r1_119 == "add" or r1_119 == "Add" then
        r3_119:AddDungeonEvent(r2_119)
        return 
      end
      if r1_119 == "remove" or r1_119 == "Remove" then
        r3_119:RemoveDungeonEvent(r2_119)
        return 
      end
    end
  end,
  Printbuff = function(r0_120, r1_120)
    -- line: [2371, 2383] id: 120
    local r2_120 = nil
    if not r1_120 then
      r2_120 = r0_120.Player
    else
      r1_120 = tonumber(r1_120)
      r2_120 = Battle(r0_120.Player):GetEntity(r1_120)
    end
    r2_120.BuffManager:DebugPrint()
  end,
  BuffDebug = function(r0_121, r1_121)
    -- line: [2385, 2396] id: 121
    local r2_121 = nil
    if not r1_121 then
      r2_121 = r0_121.Player
    else
      r1_121 = tonumber(r1_121)
      r2_121 = Battle(r0_121.Player):GetEntity(r1_121)
    end
    UIManager(r0_121.Player):LoadUI(UIConst.BUFFDEBUGPANEL, "BuffDebugPanel", UIConst.ZORDER_ABOVE_ALL, r2_121):SetEntity(r2_121)
  end,
  AddBuff = function(r0_122, r1_122, r2_122, r3_122)
    -- line: [2398, 2411] id: 122
    r1_122 = tonumber(r1_122)
    assert(r1_122, "BuffId要填数字")
    assert(DataMgr.Buff[r1_122], "找不到[" .. tostring(r1_122) .. "]对应的Buff")
    r2_122 = tonumber(r2_122)
    assert(r2_122 and r2_122 ~= 0, "LastTime要填数字且不能为0")
    if r3_122 then
      r3_122 = tonumber(r3_122)
    end
    r0_122:ServerBattleCommand("AddBuff", r0_122.Player.Eid, r1_122, tonumber(r2_122), r3_122)
  end,
  AddGP = function(r0_123, r1_123, r2_123)
    -- line: [2413, 2419] id: 123
    r1_123 = tonumber(r1_123)
    r2_123 = tonumber(r2_123)
    Battle(r0_123.Player):AddGlobalPassive(r1_123, r0_123.Player, r2_123)
  end,
  RemoveAllGP = function(r0_124)
    -- line: [2421, 2423] id: 124
    Battle(r0_124.Player):RemoveAllGlobalPassives()
  end,
  PrintGP = function(r0_125)
    -- line: [2425, 2427] id: 125
    Battle(r0_125.Player):PrintCurrentGlobalPassives()
  end,
  PrintMarks = function(r0_126, r1_126)
    -- line: [2429, 2436] id: 126
    local r2_126 = r0_126.Player
    if r1_126 then
      r2_126 = Battle(r0_126.Player):GetEntity(tonumber(r1_126))
    end
    Battle(r0_126):PrintMarksFromTarget(r2_126)
  end,
  RemoveBuff = function(r0_127, r1_127)
    -- line: [2438, 2446] id: 127
    r1_127 = tonumber(r1_127)
    assert(r1_127, "BuffId要填数字")
    assert(DataMgr.Buff[r1_127], "找不到[" .. tostring(r1_127) .. "]对应的Buff")
    r0_127:ServerBattleCommand("RemoveBuff", r0_127.Player.Eid, r1_127)
  end,
  AddMonsterBuff = function(r0_128, r1_128, r2_128)
    -- line: [2448, 2452] id: 128
    r0_128:AddMonsterBuffDuration(r1_128, -1, r2_128)
  end,
  AddMonsterBuffDuration = function(r0_129, r1_129, r2_129, r3_129)
    -- line: [2454, 2465] id: 129
    r1_129 = tonumber(r1_129)
    assert(r1_129, "BuffId要填数字")
    assert(DataMgr.Buff[r1_129], "找不到[" .. tostring(r1_129) .. "]对应的Buff")
    if r3_129 then
      r3_129 = tonumber(r3_129)
    end
    r2_129 = tonumber(r2_129)
    r0_129:ServerBattleCommand("AddMonsterBuff", r1_129, r2_129, r3_129)
  end,
  RemoveMonsterBuff = function(r0_130, r1_130)
    -- line: [2467, 2475] id: 130
    r1_130 = tonumber(r1_130)
    assert(r1_130, "BuffId要填数字")
    assert(DataMgr.Buff[r1_130], "找不到[" .. tostring(r1_130) .. "]对应的Buff")
    r0_130:ServerBattleCommand("RemoveMonsterBuff", r1_130)
  end,
  StartXibiBoss = function(r0_131)
    -- line: [2477, 2492] id: 131
    local function r1_131(...)
      -- line: [2480, 2483] id: 132
      r0_131:SuccQuestChain(100102)
      r0_131:StartQuest(10010306)
    end
    r0_131:SuccessAllSystemGuide()
    local r2_131 = 100103
    local r3_131 = GWorld:GetAvatar()
    if not r3_131 then
      return 
    end
    r3_131:AddRegionSkipCallback(r2_131, r0_131, r1_131)
    r0_131:SkipRegion(1, r2_131, 1)
  end,
  UnlockHardBoss = function(r0_133, r1_133)
    -- line: [2494, 2524] id: 133
    print(_G.LogTag, "UnlockHardBoss", r1_133)
    local function r2_133(r0_134)
      -- line: [2496, 2510] id: 134
      local r1_134 = {}
      for r6_134, r7_134 in pairs(r0_134) do
        local r8_134 = r7_134.UnlockCondition
        if r8_134 then
          if type(r8_134) == "table" then
            table.move(r8_134, 1, #r8_134, #r1_134 + 1, r1_134)
          else
            r1_134[#r1_134 + 1] = r8_134
          end
        end
      end
      -- close: r2_134
      return r1_134
    end
    r0_133:CompleteCondition(r2_133(DataMgr.HardBossMain))
    if r1_133 then
      r0_133:CompleteCondition(r2_133(DataMgr.HardBossDifficulty))
    end
    if not Const.UnlockRegionTeleport then
      Const.UnlockRegionTeleport = true
    end
    r0_133:CompleteSystemCondition()
    SystemGuideManager:GMEnforceFinishAllSysGuide()
  end,
  UnlockRegionTeleport = function(r0_135, r1_135)
    -- line: [2526, 2536] id: 135
    Const.UnlockRegionTeleport = r1_135 == "1"
    local r3_135 = UE4.UGameplayStatics.GetGameState(r0_135.Player).MechanismMap:FindRef("TeleportMechanism")
    if not r3_135 then
      return 
    end
    for r8_135, r9_135 in pairs(r3_135.Array:ToTable()) do
      r9_135:GMUnlock()
    end
    -- close: r4_135
  end,
  UnlockRegionDelivery = function(r0_136, r1_136)
    -- line: [2538, 2548] id: 136
    _G.UnlockRegionDelivery = r1_136 == "1"
    local r3_136 = UE4.UGameplayStatics.GetGameState(r0_136.Player).MechanismMap:FindRef("Delivery")
    if not r3_136 then
      return 
    end
    for r8_136, r9_136 in pairs(r3_136.Array:ToTable()) do
      r9_136:GMUnlock()
    end
    -- close: r4_136
  end,
  AddRougeLikeToken = function(r0_137, r1_137, r2_137)
    -- line: [2550, 2557] id: 137
    local r3_137 = require("BluePrints.UI.GMInterface.GMFunctionLibrary")
    local r4_137 = "sgm AddRougeLikeToken " .. r1_137
    if r2_137 then
      r4_137 = r4_137 .. " " .. r2_137
    end
    r3_137.ExecConsoleCommand(r0_137:GetGameInstance(), r4_137)
  end,
  GetRougeLikeToken = function(r0_138)
    -- line: [2559, 2564] id: 138
    local r1_138 = GWorld:GetAvatar()
    if r1_138 then
      print(_G.LogTag, "GetRougeLikeCurrency", r1_138:GetCurrentRougeLikeToken())
    end
  end,
  RougeLikePassRoom = function(r0_139, r1_139)
    -- line: [2566, 2577] id: 139
    local r2_139 = UE.UGameplayStatics.GetGameMode(r0_139.Player)
    for r7_139, r8_139 in pairs(r2_139.MonsterSpawnMap) do
      r8_139:ClearMonsterSpawnInfo()
      if IsValid(r2_139.MonsterSpawnMap:Find(r8_139.UnitSpawnId)) then
        r2_139.MonsterSpawnMap:Remove(r8_139.UnitSpawnId)
      end
      r8_139:K2_DestroyActor()
    end
    -- close: r3_139
    r0_139:ServerBattleCommand("KillMonster", r0_139.Player.Eid)
    r2_139:TriggerRougeLikeEnd(true)
  end,
  Debug = function(r0_140)
    -- line: [2579, 2584] id: 140
    _G.DrawDebugTest = not _G.DrawDebugTest
    Battle(r0_140.Player).DrawDebugTest = _G.DrawDebugTest
  end,
  ResetLoc = function(r0_141)
    -- line: [2586, 2591] id: 141
    UE.UGameplayStatics.GetGameMode(r0_141.Player):SetPlayerSafeLoction(r0_141.Player.Eid)
  end,
  ChangeCharCornerVisibility = function(r0_142, r1_142)
    -- line: [2593, 2607] id: 142
    if r1_142 == "true" or r1_142 == "1" then
      r1_142 = true
    elseif r1_142 == "false" or r1_142 == "0" then
      r1_142 = false
    end
    local r2_142 = GWorld:GetAvatar()
    if r2_142 then
      r2_142:ChangeCharCornerVisibility(r2_142.Chars[r2_142.CurrentChar].Uuid, r1_142)
    end
  end,
  Tel = function(r0_143)
    -- line: [2609, 2611] id: 143
    r0_143.Player:TeleportToCloestTeleportPoint()
  end,
  UpWeaponGradeLevel = function(r0_144, r1_144, r2_144, r3_144, r4_144, r5_144, r6_144, r7_144)
    -- line: [2613, 2637] id: 144
    local r8_144 = tonumber(r2_144)
    local r9_144 = GWorld:GetAvatar()
    local r10_144 = {}
    if r3_144 then
      table.insert(r10_144, CommonUtils.Str2ObjId(r3_144))
    end
    if r4_144 then
      table.insert(r10_144, CommonUtils.Str2ObjId(r4_144))
    end
    if r5_144 then
      table.insert(r10_144, CommonUtils.Str2ObjId(r5_144))
    end
    if r6_144 then
      table.insert(r10_144, CommonUtils.Str2ObjId(r6_144))
    end
    if r7_144 then
      table.insert(r10_144, CommonUtils.Str2ObjId(r7_144))
    end
    if r9_144 then
      r9_144:UpWeaponGradeLevel(CommonUtils.Str2ObjId(r1_144), r8_144, r10_144)
    end
  end,
  ChangeWeaponColor = function(r0_145, r1_145, r2_145, r3_145, r4_145, r5_145, r6_145, r7_145, r8_145, r9_145)
    -- line: [2639, 2658] id: 145
    local r10_145 = GWorld:GetAvatar()
    local r11_145 = {}
    if r2_145 and r3_145 then
      r11_145[tonumber(r2_145)] = tonumber(r3_145)
    end
    if r4_145 and r5_145 then
      r11_145[tonumber(r4_145)] = tonumber(r5_145)
    end
    if r6_145 and r7_145 then
      r11_145[tonumber(r6_145)] = tonumber(r7_145)
    end
    if r8_145 and r9_145 then
      r11_145[tonumber(r8_145)] = tonumber(r9_145)
    end
    if r10_145 then
      r10_145:ChangeWeaponColors(CommonUtils.Str2ObjId(r1_145), r11_145)
    end
  end,
  CleanWeaponColor = function(r0_146, r1_146)
    -- line: [2660, 2672] id: 146
    local r2_146 = GWorld:GetAvatar()
    local r3_146 = {
      [1] = -1,
      [2] = -1,
      [3] = -1,
      [4] = -1,
    }
    if r2_146 then
      r2_146:ChangeWeaponColors(CommonUtils.Str2ObjId(r1_146), r3_146)
    end
  end,
  ChangeMod = function(r0_147, r1_147, r2_147, r3_147, r4_147, r5_147)
    -- line: [2674, 2692] id: 147
    if not r1_147 or not r2_147 or not r3_147 or not r4_147 or not r5_147 then
      return 
    end
    r2_147 = CommonUtils.Str2ObjId(r2_147)
    r3_147 = tonumber(r3_147)
    r4_147 = tonumber(r4_147)
    r5_147 = CommonUtils.Str2ObjId(r5_147)
    local r6_147 = r0_147:GetClientAvatar()
    if string.lower(r1_147) == "char" then
      r6_147:ChangeCharMod(nil, r2_147, r3_147, r4_147, r5_147)
    elseif string.lower(r1_147) == "weapon" then
      r6_147:ChangeWeaponMod(nil, r2_147, r3_147, r4_147, r5_147)
    end
  end,
  TakeOffMod = function(r0_148, r1_148, r2_148, r3_148, r4_148)
    -- line: [2694, 2711] id: 148
    if not r1_148 or not r2_148 or not r3_148 or not r4_148 then
      return 
    end
    r2_148 = CommonUtils.Str2ObjId(r2_148)
    r3_148 = tonumber(r3_148)
    r4_148 = tonumber(r4_148)
    local r5_148 = r0_148:GetClientAvatar()
    if string.lower(r1_148) == "char" then
      r5_148:TakeOffCharMod(nil, r2_148, r3_148, r4_148)
    elseif string.lower(r1_148) == "weapon" then
      r5_148:TakeOffWeaponMod(nil, r2_148, r3_148, r4_148)
    end
  end,
  ChangeModSuit = function(r0_149, r1_149, r2_149, r3_149)
    -- line: [2713, 2729] id: 149
    if not r1_149 or not r2_149 or not r3_149 then
      return 
    end
    r2_149 = CommonUtils.Str2ObjId(r2_149)
    r3_149 = tonumber(r3_149)
    local r4_149 = r0_149:GetClientAvatar()
    if string.lower(r1_149) == "char" then
      r4_149:ChangeCharModSuit(nil, r2_149, r3_149)
    elseif string.lower(r1_149) == "weapon" then
      r4_149:ChangeWeaponModSuit(nil, r2_149, r3_149)
    end
  end,
  ModLevelUp = function(r0_150, r1_150, r2_150, r3_150, r4_150)
    -- line: [2731, 2744] id: 150
    if not r1_150 or not r2_150 or not r3_150 or not r4_150 then
      return 
    end
    r1_150 = CommonUtils.Str2ObjId(r1_150)
    r2_150 = tonumber(r2_150)
    r3_150 = tonumber(r3_150)
    r4_150 = r4_150 == "true"
    r0_150:GetClientAvatar():ModLevelUp(nil, r1_150, r2_150, r3_150, r4_150)
  end,
  GetAllWeapons = function(r0_151)
    -- line: [2746, 2759] id: 151
    local r1_151 = r0_151:GetClientAvatar()
    if not r1_151 then
      return 
    end
    local r3_151 = {}
    for r8_151, r9_151 in pairs(r1_151.Weapons) do
      r3_151[CommonUtils.ObjId2Str(r8_151)] = {
        r9_151.WeaponId,
        r9_151.Level,
        r9_151.MaxLevel,
        r9_151.EnhanceLevel
      }
    end
    -- close: r4_151
    PrintTable({
      result = r3_151,
    }, 10)
  end,
  WeaponLevelUp = function(r0_152, r1_152, r2_152, r3_152)
    -- line: [2761, 2775] id: 152
    if not r1_152 or not r2_152 or not r3_152 then
      return 
    end
    r1_152 = CommonUtils.Str2ObjId(r1_152)
    r2_152 = tonumber(r2_152)
    r3_152 = tonumber(r3_152)
    local r4_152 = r0_152:GetClientAvatar()
    if not r4_152 then
      return 
    end
    r4_152:WeaponLevelUp(r1_152, r2_152, r3_152)
  end,
  WeaponBreak = function(r0_153, r1_153, r2_153)
    -- line: [2777, 2790] id: 153
    if not r1_153 or not r2_153 then
      return 
    end
    r1_153 = CommonUtils.Str2ObjId(r1_153)
    r2_153 = tonumber(r2_153)
    local r3_153 = r0_153:GetClientAvatar()
    if not r3_153 then
      return 
    end
    r3_153:WeaponBreakLevelUp(r1_153, r2_153)
  end,
  GetAllChars = function(r0_154)
    -- line: [2792, 2805] id: 154
    local r1_154 = r0_154:GetClientAvatar()
    if not r1_154 then
      return 
    end
    local r3_154 = {}
    for r8_154, r9_154 in pairs(r1_154.Chars) do
      r3_154[CommonUtils.ObjId2Str(r8_154)] = {
        r9_154.CharId,
        r9_154.Level,
        r9_154.MaxLevel,
        r9_154.EnhanceLevel
      }
    end
    -- close: r4_154
    PrintTable({
      result = r3_154,
    }, 10)
  end,
  CharLevelUp = function(r0_155, r1_155, r2_155, r3_155)
    -- line: [2807, 2821] id: 155
    if not r1_155 or not r2_155 or not r3_155 then
      return 
    end
    r1_155 = CommonUtils.Str2ObjId(r1_155)
    r2_155 = tonumber(r2_155)
    r3_155 = tonumber(r3_155)
    local r4_155 = r0_155:GetClientAvatar()
    if not r4_155 then
      return 
    end
    r4_155:CharLevelUp(r1_155, r2_155, r3_155)
  end,
  CharGradeLevelUp = function(r0_156)
    -- line: [2823, 2835] id: 156
    local r1_156 = r0_156:GetClientAvatar()
    local r2_156 = r1_156.Chars[r1_156.CurrentChar]
    if not r1_156 then
      return 
    end
    r1_156:UpCharGradeLevel(r2_156.Uuid, tonumber(r2_156.GradeLevel))
  end,
  CharBreak = function(r0_157, r1_157, r2_157)
    -- line: [2838, 2851] id: 157
    if not r1_157 or not r2_157 then
      return 
    end
    r1_157 = CommonUtils.Str2ObjId(r1_157)
    r2_157 = tonumber(r2_157)
    local r3_157 = r0_157:GetClientAvatar()
    if not r3_157 then
      return 
    end
    r3_157:CharBreakLevelUp(r1_157, r2_157)
  end,
  GetMonster = function(r0_158, ...)
    -- line: [2853, 2879] id: 158
    local r1_158 = Battle(r0_158.Player):GetAllEntities()
    local r2_158 = nil
    local r3_158 = 9999999
    local r4_158 = r0_158.Player:K2_GetActorLocation()
    for r9_158, r10_158 in pairs(r1_158) do
      if r10_158 and r10_158.IsMonster and r10_158:IsMonster() then
        local r12_158 = UE4.UKismetMathLibrary.Vector_Distance(r4_158, r10_158:K2_GetActorLocation())
        if r12_158 < r3_158 then
          r3_158 = r12_158
          r2_158 = r10_158
        end
      end
    end
    -- close: r5_158
    if r2_158 then
      r0_158.Monster = r2_158
      local r5_158 = UE4.UGameplayStatics.GetGameState(r0_158.Player)
      if r5_158 then
        r5_158.DebugMonster = r2_158
      end
      print(_G.LogTag, "Get NearestMonster, Eid:", r0_158.Monster.Eid)
    end
  end,
  GlobalTimeDilation = function(r0_159, r1_159)
    -- line: [2881, 2883] id: 159
    UE4.UGameplayStatics.SetGlobalTimeDilation(r0_159.Player, tonumber(r1_159))
  end,
  MonsterTimeDilation = function(r0_160, r1_160)
    -- line: [2885, 2895] id: 160
    if r0_160:HasTargetMonster() == false or not r1_160 then
      return 
    end
    if r1_160 == 0 then
      r0_160.Player:RemoveTimer("MonsterTimeDilationTimer", true)
      r0_160.Monster.CustomTimeDilation = 1
    else
      r0_160.Player:AddTimer(0.01, function()
        -- line: [2891, 2893] id: 161
        r0_160.Monster.CustomTimeDilation = tonumber(r1_160)
      end, true, 0, "MonsterTimeDilationTimer", true)
    end
  end,
  SetMonsterCrouch = function(r0_162, r1_162)
    -- line: [2897, 2901] id: 162
    if r0_162:HasTargetMonster() == false or not r1_162 then
      return 
    end
    local r2_162 = tonumber(r1_162)
    if r2_162 > 0 then
      r2_162 = true and false
    else
      goto label_15	-- block#5 is visited secondly
    end
    r0_162:ServerBattleCommand("SetMonsterCrouch", r0_162.Monster.Eid, r2_162)
  end,
  GetBlackboardValue = function(r0_163, r1_163, r2_163)
    -- line: [2903, 2916] id: 163
    for r8_163, r9_163 in pairs(UE4.UGameplayStatics.GetGameState(r0_163.Player).MonsterMap) do
      local r10_163 = r9_163:GetOwnBlackBoardComponent()
      local r11_163 = r10_163["GetValueAs" .. r1_163]
      if r11_163 ~= nil then
        DebugPrint("Monster Eid =", r9_163.Eid, ", BBValue =", r11_163(r10_163, r2_163))
      else
        DebugPrint("TypeError type =", r1_163)
      end
    end
    -- close: r4_163
  end,
  StopAI = function(r0_164, ...)
    -- line: [2918, 2922] id: 164
    if r0_164:HasTargetMonster() == false then
      return 
    end
    r0_164.Monster:StopBT("GM")
  end,
  StartAI = function(r0_165, ...)
    -- line: [2924, 2928] id: 165
    if r0_165:HasTargetMonster() == false then
      return 
    end
    r0_165.Monster:StartBT()
  end,
  Target = function(r0_166, ...)
    -- line: [2930, 2934] id: 166
    if r0_166:HasTargetMonster() == false then
      return 
    end
    r0_166.Monster:BBSetTarget(Battle(r0_166.Player):GetCharacter(r0_166.Player.Eid))
  end,
  TargetAll = function(r0_167, ...)
    -- line: [2937, 2944] id: 167
    for r6_167, r7_167 in pairs(Battle(r0_167.Player):GetAllEntities()) do
      if r7_167 and r7_167.IsMonster and r7_167:IsMonster() then
        r7_167:BBSetTarget(Battle(r0_167.Player):GetCharacter(r0_167.Player.Eid))
      end
    end
    -- close: r2_167
  end,
  MoveTo = function(r0_168, ...)
    -- line: [2946, 2953] id: 168
    if r0_168:HasTargetMonster() == false then
      return 
    end
    local r1_168 = r0_168.Monster:GetController()
    r0_168.Monster:GetMovementComponent():SetAvoidanceEnabled(true)
    r1_168:MoveToLocation(r0_168.Player:K2_GetActorLocation(), 1, true, true, false, true, nil, true)
  end,
  ReuseSkill = function(r0_169, r1_169, r2_169)
    -- line: [2955, 2957] id: 169
    r0_169:ServerBattleCommand("ReuseSkill", r1_169, r2_169, r0_169.Player.Eid)
  end,
  HasTargetMonster = function(r0_170)
    -- line: [2959, 2970] id: 170
    local r1_170 = true
    if r0_170.Monster == nil then
      r1_170 = false
    end
    if Battle(r0_170.Player):GetEntity(r0_170.Monster.Eid) == nil then
      r0_170.Monster = nil
      r1_170 = false
    end
    if r1_170 == false then
      print(_G.LogTag, "No Target Monster")
    end
    return r1_170
  end,
  TakeRecorderCapture = function(r0_171, r1_171)
    -- line: [2972, 2976] id: 171
    require("BluePrints.UI.GMInterface.GMFunctionLibrary").SetTakeRecorderCapture(r0_171.Player, r1_171 == "1")
  end,
  UseDungeonLevelBounds = function(r0_172, r1_172)
    -- line: [2978, 2980] id: 172
    _G.UseDungeonLevelBounds = r1_172 == "1"
  end,
  UseMinimumLoad = function(r0_173, r1_173)
    -- line: [2982, 2984] id: 173
    _G.UseMinimumLoad = r1_173 ~= "0"
  end,
  GameModeEnable = function(r0_174, r1_174)
    -- line: [2986, 2991] id: 174
    r0_174:GetGameInstance().IsGameModeEnable = r1_174 ~= "false"
    DebugPrint("GM_GameMode逻辑设置是否启用", r0_174:GetGameInstance().IsGameModeEnable)
  end,
  MoveDebug = function(r0_175, r1_175)
    -- line: [2993, 3003] id: 175
    local r2_175 = UE4.UGameplayStatics.GetGameState(r0_175.Player)
    if r2_175 then
      r1_175 = tonumber(r1_175)
      if r1_175 > 0 then
        r2_175.MonsterMoveDebug = true
      else
        r2_175.MonsterMoveDebug = false
      end
    end
  end,
  StopMonsterSkill = function(r0_176, r1_176)
    -- line: [3005, 3015] id: 176
    local r2_176 = UE4.UGameplayStatics.GetGameState(r0_176.Player)
    if r2_176 then
      r1_176 = tonumber(r1_176)
      if r1_176 > 0 then
        r2_176.MonsterStopSkillDebug = true
      else
        r2_176.MonsterStopSkillDebug = false
      end
    end
  end,
  BTTest = function(r0_177, r1_177)
    -- line: [3017, 3028] id: 177
    local r2_177 = UE.UGameplayStatics.GetGameMode(r0_177.Player)
    if not r2_177 then
      return 
    end
    r1_177 = tonumber(r1_177)
    if r1_177 > 0 then
      r2_177.DebugTestBT = true
    else
      r2_177.DebugTestBT = false
    end
  end,
  ChangeCrossLevel = function(r0_178, r1_178)
    -- line: [3030, 3039] id: 178
    r1_178 = tonumber(r1_178)
    for r7_178, r8_178 in pairs(UE4.UGameplayStatics.GetGameState(r0_178.Player).MonsterMap) do
      local r9_178 = r8_178:GetController()
      if r9_178 then
        r9_178.CrossLevelEnable = r1_178 > 0
      end
    end
    -- close: r3_178
  end,
  DrawCrossLevel = function(r0_179, r1_179)
    -- line: [3041, 3050] id: 179
    r1_179 = tonumber(r1_179)
    for r7_179, r8_179 in pairs(UE4.UGameplayStatics.GetGameState(r0_179.Player).MonsterMap) do
      local r9_179 = r8_179:GetController()
      if r9_179 then
        r9_179.DrawCrossLevel = r1_179 > 0
      end
    end
    -- close: r3_179
  end,
  TestStory = function(r0_180, r1_180, r2_180, r3_180)
    -- line: [3056, 3058] id: 180
    r0_180:RunStoryline("test_czc.story")
  end,
  TestStory1 = function(r0_181, r1_181, r2_181, r3_181)
    -- line: [3060, 3062] id: 181
    r0_181:RunStoryline("test_czc1.story")
  end,
  RunStoryline = function(r0_182, r1_182, r2_182, r3_182)
    -- line: [3064, 3066] id: 182
    GWorld.StoryMgr:RunStory(r1_182, r2_182, r3_182)
  end,
  StopStoryline = function(r0_183, r1_183)
    -- line: [3068, 3077] id: 183
    local r2_183 = DataMgr.QuestChain[r1_183]
    if r2_183 == nil then
      UIManager(GWorld.GameInstance):ShowError(6001)
      return 
    end
    if GWorld.StoryMgr:IsRunningStoryline(r2_183.StoryPath) then
      GWorld.StoryMgr:StopStoryline(r2_183.StoryPath)
    end
  end,
  RunQuest = function(r0_184, r1_184)
    -- line: [3079, 3081] id: 184
    GWorld.StoryMgr:RunQuest(tonumber(r1_184))
  end,
  SkipQuest = function(r0_185, r1_185)
    -- line: [3083, 3085] id: 185
    GWorld.StoryMgr:CompleteQuest(tonumber(r1_185))
  end,
  RemoveAllImpression = function(r0_186)
    -- line: [3087, 3095] id: 186
    local r1_186 = GWorld:GetAvatar()
    if r1_186 then
      r1_186:CallServer("GMRemoveAllmpressionRegionData", function(r0_187)
        -- line: [3090, 3092] id: 187
        r0_186.logger.debug("ZJT_ GMRemoveAllmpressionRegionData ", r0_187)
      end)
    end
  end,
  TestImpression = function(r0_188)
    -- line: [3098, 3130] id: 188
  end,
  FinishImpressionTalk = function(r0_189, r1_189)
    -- line: [3132, 3160] id: 189
    r1_189 = tonumber(r1_189)
    local r2_189 = ""
    local function r3_189()
      -- line: [3135, 3139] id: 190
      DebugPrint("GM_Command:FinishImpressionTalk@", r2_189)
      GWorld.GameInstance:GetGameUIManager():ShowUITip(UIConst.Tip_CommonToast, r2_189, 3)
    end
    if not r1_189 then
      r2_189 = "TalkTriggerId为空"
      r3_189()
      return 
    end
    local r4_189 = GWorld:GetAvatar()
    if not r4_189 then
      r2_189 = "Avatar不存在"
      r3_189()
      return 
    end
    if r4_189.ImpressionTalkTriggers[r1_189] then
      r2_189 = "对应的对话已完成，无法重复完成"
      r3_189()
      return 
    end
    r4_189:SetTalkTriggerComplete_New(r1_189, {
      r0_189,
      function()
        -- line: [3157, 3159] id: 191
        DebugPrint("Log: Impression Talk Finished", r1_189)
      end
    })
  end,
  ImpressionCheckByEnumId = function(r0_192, r1_192, r2_192, r3_192, r4_192)
    -- line: [3166, 3187] id: 192
    local r5_192 = GWorld:GetAvatar()
    local r6_192 = ""
    local function r7_192()
      -- line: [3169, 3173] id: 193
      DebugPrint("GM_Command:ImpressionCheckByEnumId@", r6_192)
      GWorld.GameInstance:GetGameUIManager():ShowUITip(UIConst.Tip_CommonToast, r6_192, 3)
    end
    if not r5_192 then
      r6_192 = "Avatar不存在"
      r7_192()
    end
    if not r1_192 then
      r1_192 = {
        741148230
      }
    end
    if not r2_192 then
      r2_192 = 7411482301
    end
    if not r3_192 then
      r3_192 = 74114730
    end
    if not r4_192 then
      r4_192 = 1011
    end
    if r5_192:IsImpressionCheckSuccess(r2_192) then
      r6_192 = "对应的选项已被记录，无法重复选择"
      r7_192()
    end
    r5_192:ImpressionCheckByEnumId_New(r1_192, r2_192, r3_192, r4_192)
  end,
  ImpressionAddByEnumId = function(r0_194, r1_194, r2_194)
    -- line: [3191, 3212] id: 194
    local r3_194 = GWorld:GetAvatar()
    local r4_194 = ""
    local function r5_194()
      -- line: [3194, 3198] id: 195
      DebugPrint("GM_Command:ImpressionAddByEnumId@", r4_194)
      GWorld.GameInstance:GetGameUIManager():ShowUITip(UIConst.Tip_CommonToast, r4_194, 3)
    end
    if not r3_194 then
      r4_194 = "Avatar不存在"
      r5_194()
      return 
    end
    if not r1_194 then
      r1_194 = {
        741148229
      }
    end
    if not r2_194 then
      r2_194 = 7411482291
    end
    if r3_194:IsImpressionCheckSuccess(r2_194) then
      r4_194 = "对应的选项已被记录，无法重复选择"
      r5_194()
      return 
    end
    r3_194:ImpressionAddByEnumId_New(r1_194, r2_194)
  end,
  CompleteDialogueByText = function(r0_196, r1_196)
    -- line: [3214, 3229] id: 196
    local r2_196 = GWorld:GetAvatar()
    if r2_196 == nil then
      DebugPrint(_G.ErrorTag, "Complete dialogue by text failed, Avatar is nil.")
      return 
    end
    string.gsub(r1_196, "DialogueHasRead:%[(%d+)%]", function(r0_197)
      -- line: [3221, 3228] id: 197
      r0_197 = tonumber(r0_197)
      if DataMgr.DialogueId2WikiTextIds[r0_197] == nil then
        DebugPrint(_G.ErrorTag, string.format("Complete dialogue by text failed, dialogue id %d not exist in dialogue id to wiki text ids data.", r0_197))
        return 
      end
      r2_196:CompletedDialogue(r0_197)
    end)
  end,
  ForceSetStorySkipable = function(r0_198, r1_198)
    -- line: [3231, 3237] id: 198
    local r2_198 = TalkSubsystem()
    if r2_198 then
      r2_198:ForceSetStorySkipable(r1_198)
      return true
    end
  end,
  PlayTalk = function(r0_199, r1_199, r2_199)
    -- line: [3244, 3290] id: 199
    r2_199 = not not r2_199
    local r4_199 = UE4.UKismetSystemLibrary.GetProjectContentDirectory() .. "../Tools/storycreator/talk_nodes.json"
    local r5_199 = nil
    local r6_199 = nil
    if not UBlueprintPathsLibrary.FileExists(r4_199) then
      r5_199, r6_199 = URuntimeCommonFunctionLibrary.ParseTalkNodesJson(GWorld.GameInstance, r0_199:SerializeTalkNodeData(), r1_199, r2_199)
    else
      r5_199, r6_199 = URuntimeCommonFunctionLibrary.ParseTalkNodesByPath(GWorld.GameInstance, r4_199, r1_199, r2_199)
    end
    local r10_199 = nil	-- notice: implicit variable refs by block#[11]
    if r6_199 and r6_199 ~= "" then
      local r8_199 = require("rapidjson").decode(r6_199)
      r8_199.props = r8_199.props and {}
      if r8_199.props.IsNpcNode then
        local r9_199 = r8_199.props.NpcId
        if r9_199 then
          r0_199:CreateNpc(r9_199)
        end
      end
      r10_199 = require("StoryCreator.StoryLogic.StorylineUtils").CreateQuestNode("TalkNode", {
        FinishNode = function(r0_200, r1_200, r2_200)
          -- line: [3270, 3271] id: 200
        end,
      })
      r10_199:BuildNode(r8_199.nodeId, {
        key = r8_199.nodeId,
        type = "TalkNode",
        name = "TalkNode_Temp",
        propsData = r8_199.props,
      }, {})
      r10_199.GuideUIEnable = false
      r10_199:Execute(function()
        -- line: [3283, 3286] id: 201
        r10_199:Finish()
        DebugPrint("PlayTalk执行结束")
      end)
      -- close: r7_199
    else
      r10_199 = r1_199
      local r9_199 = tonumber(r10_199)
      r10_199 = nil
      UE4.UPlayTalkAsyncAction.PlayTalk(GWorld.GameInstance, r9_199, r10_199)
    end
  end,
  SerializeTalkNodeData = function(r0_202)
    -- line: [3292, 3339] id: 202
    local r1_202 = {}
    local function r2_202(r0_203)
      -- line: [3294, 3300] id: 203
      r0_203 = string.gsub(r0_203, "[/\\]", ".")
      if string.sub(r0_203, -6) == ".story" then
        r0_203 = string.sub(r0_203, 1, string.len(r0_203) + -6)
      end
      return r0_203
    end
    local function r3_202(r0_204)
      -- line: [3301, 3308] id: 204
      local r1_204, r2_204 = pcall(require, r0_204)
      if r1_204 then
        return r2_204
      else
        return nil
      end
    end
    local r4_202 = "../../Content/Script/StoryCreator/StoryFiles/"
    local function r5_202(r0_205, r1_205)
      -- line: [3310, 3330] id: 205
      for r6_205, r7_205 in pairs(r0_205) do
        if r7_205[r1_205] then
          local r8_205 = r7_205[r1_205]
          local r9_205 = r3_202("StoryCreator.StoryFiles." .. r2_202(r8_205))
          local r10_205 = nil	-- notice: implicit variable refs by block#[5]
          if r9_205 then
            r10_205 = r9_205.storyNodeData
            if not r10_205 then
              ::label_20::
              r10_205 = {}
            end
          else
            goto label_20	-- block#4 is visited secondly
          end
          for r15_205, r16_205 in pairs(r10_205) do
            for r22_205, r23_205 in pairs(r16_205.questNodeData.nodeData) do
              if r23_205.type == "TalkNode" then
                r1_202[r22_205] = {
                  filePath = r4_202 .. string.gsub(r8_205, ".story", ".lua"),
                  nodeId = r22_205,
                  props = r23_205.propsData,
                }
              end
            end
            -- close: r18_205
          end
          -- close: r11_205
        end
      end
      -- close: r2_205
    end
    r5_202(DataMgr.DynQuest, "StoryPath")
    r5_202(DataMgr.QuestChain, "StoryPath")
    r5_202(DataMgr.TalkTrigger, "StoryLinePath")
    r5_202(DataMgr.PartyTopic, "PartyTopicTalkId")
    r5_202(DataMgr.SpecialQuestConfig, "StoryPath")
    return require("rapidjson").encode(r1_202)
  end,
  ScanForDuplicatedTalk = function(r0_206, r1_206)
    -- line: [3342, 3352] id: 206
    DebugPrint("lhr@ScanForDuplicatedTalk")
    r1_206 = not not r1_206
    local r4_206 = URuntimeCommonFunctionLibrary.ScanForDuplicatedTalk(GWorld.GameInstance, UE4.UKismetSystemLibrary.GetProjectContentDirectory() .. "../Tools/storycreator/talk_nodes.json", r1_206)
    local r5_206 = require("Utils.TimeUtils")
    UE.URuntimeCommonFunctionLibrary.SaveFile(UEMPathFunctionLibrary.GetProjectSavedDirectory() .. "Talk/" .. "DuplicatedTalkData_" .. tostring(r5_206.TimeToYMDHMSStr(r5_206.RealTime(), false, "_", "_")) .. ".txt", r4_206)
  end,
  CreateSTLNode = function(r0_207, r1_207, r2_207)
    -- line: [3354, 3375] id: 207
    local r3_207 = DataMgr.QuestNodeCore[r1_207]
    local r4_207 = {}
    if r3_207 and r3_207.TestArgs then
      for r9_207, r10_207 in pairs(r3_207.TestArgs) do
        r4_207[r9_207] = r10_207
      end
      -- close: r5_207
    end
    if r2_207 then
      r2_207 = (_G.loadstring and load)("return " .. tostring(r2_207))()
      for r11_207, r12_207 in pairs(r2_207) do
        r4_207[r11_207] = r12_207
      end
      -- close: r7_207
    end
    r4_207.Type = r1_207
    PrintTable({
      NodeType = r1_207,
      RealArgs = r4_207,
    }, 10)
    return require("StoryCreator.StoryLogic.StorylineUtils").GMCreateQuestNode(r1_207, r4_207)
  end,
  TestSTLNode = function(r0_208, r1_208, r2_208, r3_208)
    -- line: [3377, 3401] id: 208
    local r4_208 = r0_208:CreateSTLNode(r1_208, r2_208)
    local r5_208 = nil
    local r6_208 = r4_208.Finish
    if r3_208 then
      local r7_208 = string.lower(r3_208)
      if r7_208 == "success" then
        function r5_208(...)
          -- line: [3386, 3389] id: 209
          r6_208(r4_208)
          r4_208:ClearWhenQuestSuccess()
        end
      elseif r7_208 == "fail" then
        function r5_208(...)
          -- line: [3391, 3394] id: 210
          r6_208(r4_208)
          r4_208:ClearWhenQuestFail()
        end
      end
    end
    if r5_208 then
      r4_208.Finish = r5_208
    end
    r4_208:Start()
  end,
  ShowCapsule = function(r0_211, r1_211)
    -- line: [3403, 3422] id: 211
    if not r1_211 then
      r1_211 = 0
    end
    local r2_211 = true
    if r1_211 ~= "0" then
      r2_211 = false
    end
    r0_211:HideMonsterCapsule(r1_211)
    r0_211.Player.CapsuleComponent:SetHiddenInGame(r2_211, false)
    r0_211.Player.CapsuleComponent:SetVisibility(not r2_211, false)
    for r8_211, r9_211 in pairs(Battle(r0_211.Player):GetAllEntities()) do
      if r9_211 and r9_211.IsMonster and r9_211:IsMonster() then
        r9_211.CapsuleComponent:SetHiddenInGame(r2_211, false)
        r9_211.CapsuleComponent:SetVisibility(not r2_211, false)
      end
    end
    -- close: r4_211
    UCharacterFunctionLibrary.SetNewCharacterCapsuleVisibility(r2_211)
  end,
  MAULookAt = function(r0_212, r1_212)
    -- line: [3441, 3444] id: 212
    require("Utils.MonsterAnimationUtils"):LookAtMonster(r1_212)
  end,
  QuitMAU = function(r0_213)
    -- line: [3446, 3449] id: 213
    require("Utils.MonsterAnimationUtils"):QuitMAUtil()
  end,
  UseSkill = function(r0_214, r1_214, r2_214)
    -- line: [3451, 3454] id: 214
    require("Utils.MonsterAnimationUtils"):UseSkill(r1_214, r2_214)
  end,
  Focus = function(r0_215, r1_215)
    -- line: [3456, 3459] id: 215
    require("Utils.MonsterAnimationUtils"):Focus(tonumber(r1_215))
  end,
  SetSpeed = function(r0_216, r1_216)
    -- line: [3461, 3464] id: 216
    require("Utils.MonsterAnimationUtils"):SetSpeed(tonumber(r1_216))
  end,
  HeadScale = function(r0_217, r1_217, r2_217)
    -- line: [3466, 3473] id: 217
    local r4_217 = Battle(r0_217.Player):GetEntity(tonumber(r1_217))
    if r4_217.EMAnimInstance then
      r4_217.EMAnimInstance.HeadScale = r2_217
    end
  end,
  UpperArmScale = function(r0_218, r1_218)
    -- line: [3475, 3478] id: 218
    r0_218.Player.PlayerAnimInstance.UpperArmScale = r1_218
  end,
  LowerArmScale = function(r0_219, r1_219)
    -- line: [3480, 3483] id: 219
    r0_219.Player.PlayerAnimInstance.LowerArmScale = r1_219
  end,
  HandScale = function(r0_220, r1_220)
    -- line: [3485, 3488] id: 220
    r0_220.Player.PlayerAnimInstance.TargetHandScale = r1_220
  end,
  UpdateVLM = function(r0_221)
    -- line: [3490, 3493] id: 221
    URuntimeCommonFunctionLibrary.UpdateFoliageVLM(r0_221.Player)
  end,
  ChangeCreatureSpeed = function(r0_222, r1_222)
    -- line: [3495, 3499] id: 222
    Const.SkillCreatureSpeed = r1_222
    require("EMLuaConst").SkillCreatureSpeed = Const.SkillCreatureSpeed
    r0_222:ServerBattleCommand("ChangeCreatureSpeed", r1_222)
  end,
  ShowSkillCreature = function(r0_223)
    -- line: [3501, 3503] id: 223
    UE4.URuntimeCommonFunctionLibrary.ShowSkillCreature()
  end,
  ShowRayCreature = function(r0_224)
    -- line: [3505, 3508] id: 224
    Const.IsShowRayCreature = not Const.IsShowRayCreature
    require("EMLuaConst").IsShowRayCreature = Const.IsShowRayCreature
  end,
  AnimCacheEnableState = function(r0_225, r1_225)
    -- line: [3510, 3514] id: 225
    UE4.URuntimeCommonFunctionLibrary.EnableGlobalAnimCache(r0_225.Player, tonumber(r1_225) > 0)
  end,
  MonsterBornPosCheck = function(r0_226, r1_226)
    -- line: [3516, 3520] id: 226
    Const.EnableRougeLikeBornCheck = tonumber(r1_226) > 0
  end,
  DisconnectServer = function(r0_227)
    -- line: [3522, 3528] id: 227
    local r1_227 = r0_227:GetClientAvatar()
    if r1_227 then
      r1_227:DisconnectServer()
    end
  end,
  ExitBattle = function(r0_228, r1_228)
    -- line: [3530, 3548] id: 228
    r1_228 = tonumber(r1_228)
    if r1_228 == 1 then
      r1_228 = true and false
    else
      goto label_9	-- block#2 is visited secondly
    end
    if IsStandAlone(r0_228:GetGameInstance()) then
      local r2_228 = r0_228:GetClientAvatar()
      if r2_228 then
        r2_228:ExitBattle(r1_228)
      end
    elseif r1_228 then
      r0_228:DedicatedServerCommand("DungeonWin")
    else
      r0_228:DedicatedServerCommand("DungeonFailed")
    end
  end,
  PlayerEnd = function(r0_229, r1_229)
    -- line: [3550, 3566] id: 229
    r1_229 = tonumber(r1_229)
    if r1_229 == 1 then
      r1_229 = true and false
    else
      goto label_9	-- block#2 is visited secondly
    end
    if IsStandAlone(r0_229:GetGameInstance()) then
      local r2_229 = r0_229:GetClientAvatar()
      if r2_229 then
        r2_229:ExitBattle(r1_229)
      end
    elseif r1_229 then
      r0_229:DedicatedServerCommand("PlayerWin")
    else
      r0_229:DedicatedServerCommand("PlayerFailed")
    end
  end,
  SetInvincible = function(r0_230, r1_230)
    -- line: [3568, 3573] id: 230
    Battle(UE4.UGameplayStatics.GetPlayerCharacter(r0_230:GetGameInstance(), 0)):GetEntity(tonumber(r1_230)):SetInvincible(true, "GM")
  end,
  GetDrop = function(r0_231, r1_231, r2_231)
    -- line: [3575, 3608] id: 231
    r1_231 = tonumber(r1_231)
    r2_231 = tonumber(r2_231)
    local r3_231 = r0_231:GetGameInstance()
    local r4_231 = r3_231:GetSceneManager()
    local r5_231 = UE4.UGameplayStatics.GetGameMode(r3_231)
    local r6_231 = DataMgr.Drop[r1_231]
    local r7_231 = UE4.UGameplayStatics.GetPlayerCharacter(r3_231, 0)
    local r8_231 = r7_231:K2_GetActorRotation()
    local r9_231 = r7_231:K2_GetActorLocation() + FVector(400, 0, 0)
    if not r6_231 or r2_231 <= 0 then
      print(_G.LogTag, "ZJT_ DropInfo Battle DropCount ", not r6_231, not r4_231:IsDungeonScene(), r2_231)
      return 
    end
    local r10_231 = r0_231:GetClientAvatar()
    if r10_231 and not r10_231:IsInDungeon() and not r10_231:CheckCurrentSubRegion() then
      print(_G.LogTag, "ZJT_ Avatar not Avatar:IsInDungeon() ", r10_231, r10_231:IsInDungeon())
      return 
    end
    local r11_231 = UE4.UKismetMathLibrary.MakeTransform(r9_231, r8_231, UE4.FVector(1, 1, 1))
    local r13_231 = {
      [r1_231] = {
        [tostring(require("BluePrints.Client.CustomTypes.SimpleRewardBox"):GetTag("Normal"))] = r2_231,
      },
    }
    r0_231.Player = UE4.UGameplayStatics.GetPlayerCharacter(r3_231, 0)
    if IsStandAlone(r0_231.Player) then
      r5_231:HandleRewardDrop(r13_231, CommonConst.RewardReason.REASON_GM_SPAWN, r11_231, {}, nil)
    elseif IsClient(r0_231.Player) then
      r0_231.Player.RPCComponent:GMServerGetDrop(r1_231, r2_231)
    end
  end,
  PerMonsterDebug = function(r0_232, r1_232)
    -- line: [3610, 3629] id: 232
    local r2_232 = false
    if r1_232 == "0" then
      r2_232 = true
    end
    local r3_232 = Battle(r0_232.Player):GetAllEntities()
    local r4_232 = nil
    for r9_232, r10_232 in pairs(r3_232) do
      if r10_232 and r10_232.IsMonster and r10_232:IsMonster() then
        r4_232 = r10_232:K2_GetComponentsByClass(UCharDebugWidgetComponent:StaticClass())
        for r14_232 = 1, r4_232:Length(), 1 do
          r4_232[r14_232]:SetHiddenInGame(r2_232)
        end
      end
    end
    -- close: r5_232
    r4_232 = r0_232.Player:K2_GetComponentsByClass(UCharDebugWidgetComponent:StaticClass())
    for r8_232 = 1, r4_232:Length(), 1 do
      r4_232[r8_232]:SetHiddenInGame(r2_232)
    end
  end,
  ShowOrHideMonsterGuideIcon = function(r0_233, r1_233)
    -- line: [3634, 3673] id: 233
    local r2_233 = (tonumber(r1_233) and 0) ~= 0
    local r3_233 = TArray(FUnitLabel)
    local r4_233 = FUnitLabel()
    r4_233.UnitId = 0
    r4_233.UnitType = "Monster"
    r3_233:Add(r4_233)
    local r5_233 = UE.UGameplayStatics.GetGameMode(r0_233.Player)
    if not r5_233 then
      return 
    end
    local r6_233 = UE4.UGameplayStatics.GetGameInstance(r0_233.Player)
    if not r6_233 then
      return 
    end
    local r7_233 = r6_233:GetGameUIManager()
    local r8_233 = r6_233:GetSceneManager()
    if r7_233 == nil then
      return 
    end
    local function r9_233(r0_234)
      -- line: [3658, 3667] id: 234
      r8_233.IsSceneGuideShow = r0_234
      local r1_234 = nil	-- notice: implicit variable refs by block#[5]
      if r0_234 then
        r1_234 = 1
        if not r1_234 then
          ::label_6::
          r1_234 = 0
        end
      else
        goto label_6	-- block#2 is visited secondly
      end
      for r6_234, r7_234 in pairs(r8_233.CurSceneGuideEids) do
        local r8_234 = r7_233:GetUIObj(r6_234)
        if r8_234 ~= nil then
          r8_234:SetRenderOpacity(r1_234)
        end
      end
      -- close: r2_234
    end
    if r2_233 then
      r5_233:ShowGuideIcon(r3_233)
    end
    r9_233(r2_233)
  end,
  ScanLevel = function(r0_235)
    -- line: [3675, 3707] id: 235
    local r1_235 = UE4.URuntimeCommonFunctionLibrary.GetLevelLoadJsonName(r0_235.Player)
    local r3_235 = r0_235.Player.CurrentLevelId
    local r4_235 = string.format("当前玩家进的拼接关卡: %s", r1_235)
    for r10_235, r11_235 in pairs((function(r0_236)
      -- line: [3680, 3687] id: 236
      return require("rapidjson").decode(UE4.URuntimeCommonFunctionLibrary.LoadFile(UE4.UKismetSystemLibrary.GetProjectContentDirectory() .. "Script/Datas/Houdini_data/" .. r0_236 .. ".json"))
    end)(r1_235).points) do
      for r15_235 = 1, r3_235:Length(), 1 do
        local r16_235 = r3_235:Get(r15_235)
        if tostring(r11_235.id) == r16_235 then
          local r17_235 = r11_235.art_path
          if r17_235 == "" then
            r17_235 = string.gsub(r11_235.struct, "Data_Design", "Data_Art", 1)
          end
          r4_235 = r4_235 .. string.format("，所在的美术关卡是: %s， 关卡id是： %s", r17_235, r16_235)
        end
      end
    end
    -- close: r6_235
    return r4_235
  end,
  DebugAchvUI = function(r0_237, r1_237)
    -- line: [3709, 3736] id: 237
    local r2_237 = r0_237:GetGameInstance():GetGameUIManager()
    r1_237 = tonumber(r1_237)
    if not r1_237 then
      print(LogTag, "必要参数缺失~")
      return 
    end
    local r3_237 = DataMgr.Achievement[r1_237]
    if not r3_237 or not r3_237.TargetProgress then
      return 
    end
    local r4_237 = r3_237.TargetProgress
    local r5_237 = 1
    if r3_237.TargetProgressRenew then
      r5_237 = #r3_237.TargetProgressRenew + 1
    end
    if not r2_237:GetUIObjAsync("AchievementPanel", function(r0_238)
      -- line: [3723, 3727] id: 238
      if r0_238 then
        r0_238:AddQuene(r1_237, r4_237, r3_237.TargetProgress, r5_237)
      end
    end) and not r2_237:GetUIObjIsAsyncLoading("AchievementPanel") then
      if r3_237.CompletionValue then
        r4_237 = r3_237.CompletionValue
      end
      local r6_237 = r2_237:LoadUIAsync("AchievementPanel", function()
        -- line: [3732, 3732] id: 239
      end, r1_237, r4_237, r3_237.TargetProgress, r5_237)
    end
  end,
  EnableJetRush = function(r0_240, r1_240, r2_240, r3_240)
    -- line: [3738, 3753] id: 240
    local r4_240 = tonumber(r1_240)
    if not r4_240 then
      return 
    end
    r2_240 = tonumber(r2_240) and 100
    r3_240 = tonumber(r3_240) and 100
    local r5_240 = r0_240.Player
    if r4_240 == 1 then
      r5_240:StartJetRush(r2_240, r3_240)
    else
      r5_240:EndJetRush()
    end
  end,
  EnableBuffMesh = function(r0_241, r1_241)
    -- line: [3755, 3768] id: 241
    local r2_241 = tonumber(r1_241)
    if not r2_241 then
      return 
    end
    local r3_241 = r0_241.Player
    if r2_241 == 1 then
      r3_241:EnableRimLightModel(true)
    else
      r3_241:EnableRimLightModel(false)
    end
  end,
  EnableJetJump = function(r0_242, r1_242)
    -- line: [3769, 3782] id: 242
    local r2_242 = tonumber(r1_242)
    if not r2_242 then
      return 
    end
    local r3_242 = r0_242.Player
    if r2_242 == 1 then
      r3_242.bJetJump = true
    else
      r3_242.bJetJump = false
    end
  end,
  EnableSplineMove = function(r0_243, r1_243, r2_243, r3_243)
    -- line: [3784, 3809] id: 243
    local r4_243 = tonumber(r1_243)
    if not r4_243 then
      return 
    end
    local r5_243 = tonumber(r2_243) and 0
    local r6_243 = tonumber(r3_243) and 0
    local r7_243 = r5_243 == 1
    local r8_243 = r6_243 == 1
    local r9_243 = r0_243.Player
    local r10_243 = UE4.UGameplayStatics.GetAllActorsOfClass(r9_243, ACinemaMoveSpline:StaticClass())
    if r10_243:Length() == 0 then
      print(_G.LogTag, "没有找到CinemaMoveSpline")
      return 
    end
    local r11_243 = r10_243[1]
    r9_243:SetWalkType(2)
    r9_243:SetPlayerMaxMovingSpeed(0.16)
    if r4_243 == 1 then
      r9_243:StartMoveAlongSpline(r11_243.SplineComponent, r11_243.SplineComponent:K2_GetComponentLocation(), r7_243, r8_243)
    else
      r9_243:EndMoveAlongSpline()
    end
  end,
  EnableSplatoonMove = function(r0_244, r1_244)
    -- line: [3811, 3824] id: 244
    local r2_244 = tonumber(r1_244)
    if not r2_244 then
      return 
    end
    local r3_244 = r0_244.Player
    if r2_244 == 1 then
      r3_244:StartSplatoonMove()
    else
      r3_244:EndSplatoonMove()
    end
  end,
  SpeedUp = function(r0_245, r1_245)
    -- line: [3827, 3847] id: 245
    r1_245 = tonumber(r1_245)
    if not r1_245 then
      return 
    end
    if not r0_245.Player.CurrentSpeedRate then
      r0_245.Player.CurrentSpeedRate = 1
    end
    r0_245.Player.PlayerSlideAtttirbute.NormalWalkSpeed = DataMgr.PlayerRotationRates.NormalWalkSpeed.ParamentValue[1] * r1_245
    r0_245.Player.PlayerSlideAtttirbute.CrouchWalkSpeed = DataMgr.PlayerRotationRates.CrouchWalkSpeed.ParamentValue[1] * r1_245
    local r4_245 = r0_245.Player:GetMovementComponent()
    r4_245.MaxFlySpeed = r4_245.MaxFlySpeed / r0_245.Player.CurrentSpeedRate * r1_245
    r0_245.Player.CurrentSpeedRate = r1_245
  end,
  SetWalk = function(r0_246, r1_246, r2_246)
    -- line: [3848, 3864] id: 246
    local r3_246 = tonumber(r1_246)
    local r4_246 = tonumber(r2_246)
    if not r3_246 then
      return 
    end
    local r5_246 = r0_246.Player
    if not r5_246.PlayerAnimInstance then
      return 
    end
    if r3_246 == 1 then
      r5_246.PlayerAnimInstance.IsWalking = true
    else
      r5_246.PlayerAnimInstance.IsWalking = false
    end
    r5_246.PlayerAnimInstance.WalkType = r4_246 and 0
  end,
  ChangeSpeed = function(r0_247, r1_247)
    -- line: [3865, 3871] id: 247
    r1_247 = tonumber(r1_247)
    if not r1_247 then
      return 
    end
    r0_247.Player:SetPlayerMaxMovingSpeed(r1_247)
  end,
  ShowPreloadFX = function(r0_248)
    -- line: [3872, 3891] id: 248
    local r1_248 = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(r0_248.Player, UFXPreloadGameInstanceSubsystem)
    if not r1_248 then
      return 
    end
    local r2_248 = "\nCommonNiagara:\n"
    local r3_248 = r1_248.CommonNiagaraSystems:ToArray()
    for r7_248 = 1, r3_248:Length(), 1 do
      r2_248 = r2_248 .. UKismetSystemLibrary.GetObjectName(r3_248:GetRef(r7_248)) .. ","
    end
    r2_248 = r2_248 .. "\nPlayerNiagara\n"
    local r4_248 = r1_248.CharacterNiagaraSystems:ToArray()
    for r8_248 = 1, r4_248:Length(), 1 do
      r2_248 = r2_248 .. UKismetSystemLibrary.GetObjectName(r4_248:GetRef(r8_248)) .. ","
    end
    DebugPrint(r2_248)
  end,
  GetSceneSoundPause = function(r0_249, r1_249)
    -- line: [3893, 3895] id: 249
    print(_G.LogTag, "GetSceneSoundPause 的输出值是", r1_249, AudioManager(r0_249.Player):GetSceneSoundPause(tonumber(r1_249)))
  end,
  EnterDungeon = function(r0_250, r1_250)
    -- line: [3897, 3908] id: 250
    r1_250 = tonumber(r1_250)
    if not r1_250 then
      return 
    end
    local r2_250 = r0_250:GetClientAvatar()
    if r2_250 then
      r2_250:EnterDungeon(r1_250)
    end
  end,
  EnterEventDungeon = function(r0_251, r1_251, r2_251)
    -- line: [3910, 3925] id: 251
    r1_251 = tonumber(r1_251)
    r2_251 = tonumber(r2_251)
    if not r1_251 or not r2_251 then
      return 
    end
    if not DataMgr.Dungeon[r1_251] then
      return 
    end
    local r4_251 = r0_251:GetClientAvatar()
    if not r4_251 then
      return 
    end
    r4_251:EnterEventDungeon(nil, r1_251, nil, r2_251)
  end,
  EnterPaotai = function(r0_252, r1_252, r2_252)
    -- line: [3927, 3939] id: 252
    r1_252 = tonumber(r1_252)
    r2_252 = tonumber(r2_252)
    if not r1_252 or not r2_252 then
      return 
    end
    local r3_252 = r0_252:GetClientAvatar()
    if r3_252 then
      r3_252:EnterDungeon(r1_252, nil, nil, nil, nil, {
        PaotaiId = r2_252,
      })
    end
  end,
  EnterLocalDungeon = function(r0_253, r1_253)
    -- line: [3941, 3944] id: 253
    require("BluePrints.UI.GMInterface.GMFunctionLibrary").ExecConsoleCommand(r0_253:GetGameInstance(), "sgm EnterLocalDungeon " .. r1_253)
  end,
  EnterNewDS = function(r0_254, r1_254, r2_254)
    -- line: [3946, 3954] id: 254
    if not r2_254 then
      r2_254 = ""
    end
    if not r1_254 then
      return 
    end
    require("BluePrints.UI.GMInterface.GMFunctionLibrary").ExecConsoleCommand(r0_254:GetGameInstance(), "sgm EnterMultiDungeon " .. r1_254 .. " " .. r2_254)
  end,
  TestEnterDS = function(r0_255, r1_255, r2_255)
    -- line: [3956, 3961] id: 255
    if not r1_255 then
      r1_255 = "127.0.0.1"
    end
    if not r2_255 then
      r2_255 = 17777
    end
    UE4.UGameplayStatics.GetPlayerController(r0_255.GameInstance, 0):ClientTravel(r1_255 .. ":" .. tostring(r2_255) .. "?TestRegion", false, false)
  end,
  DSLog = function(r0_256)
    -- line: [3963, 3968] id: 256
    local r1_256 = r0_256:GetClientAvatar()
    if r1_256 then
      r1_256:GetDSLogPath()
    end
  end,
  SetNickname = function(r0_257, r1_257)
    -- line: [3970, 3976] id: 257
    local r2_257 = tostring(r1_257)
    local r3_257 = r0_257:GetClientAvatar()
    if r3_257 then
      r3_257:SetAvatarNickname(r2_257)
    end
  end,
  SetSex = function(r0_258, r1_258, r2_258, r3_258)
    -- line: [3978, 3991] id: 258
    local r4_258 = tostring(r2_258)
    local r5_258 = r0_258:GetClientAvatar()
    if r5_258 then
      r5_258:AvatarCreateRole(r1_258, tonumber(r2_258), function()
        -- line: [3982, 3985] id: 259
        DebugPrint("AvatarCreateRole Callback")
        AudioManager(r0_258):SetVoiceGender()
      end)
      r5_258:SetWeitaInfo(r1_258, tonumber(r3_258), function()
        -- line: [3986, 3989] id: 260
        DebugPrint("SetWeitaInfo Callback")
        AudioManager(r0_258):SetVoiceGender()
      end)
    end
  end,
  SetBGMVolume = function(r0_261, r1_261)
    -- line: [3993, 3997] id: 261
    UE4.UFMODBlueprintStatics.BusSetVolume(UE4.UFMODBlueprintStatics.FindAssetByName("bus:/bgm"):Cast(UE4.UFMODBus), tonumber(r1_261))
  end,
  SetAudioListenerOpenDebug = function(r0_262, r1_262)
    -- line: [3999, 4007] id: 262
    if r0_262.Player and r0_262.Player.AudioListener then
      if r1_262 == "true" then
        r0_262.Player.AudioListener.OpenDebug = true
      elseif r1_262 == "false" then
        r0_262.Player.AudioListener.OpenDebug = false
      end
    end
  end,
  SetEMPreviewMute = function(r0_263, r1_263)
    -- line: [4009, 4015] id: 263
    if r1_263 == "true" then
      AudioManager(r0_263.Player):SetCinePreviewSoundMute(true)
    elseif r1_263 == "false" then
      AudioManager(r0_263.Player):SetCinePreviewSoundMute(false)
    end
  end,
  StartSpecialQuest = function(r0_264, r1_264)
    -- line: [4017, 4024] id: 264
    assert(r1_264, "一定要传入参数:SpecialQuestId")
    r1_264 = tonumber(r1_264)
    require("BluePrints.Common.ClientEvent.ClientEventUtils"):StartSpecialQuestEvent(r1_264)
  end,
  SuccessSpecialQuest = function(r0_265)
    -- line: [4028, 4036] id: 265
    assert(require("BluePrints.Common.ClientEvent.ClientEventUtils"):GetCurrentEvent(), "客户端不存在特殊任务")
    assert(r2_265.Type == "SpecialQuest", "客户端不存在特殊任务")
    r2_265:TryFinishEvent(true)
  end,
  FailerSpecialQuest = function(r0_266)
    -- line: [4038, 4046] id: 266
    assert(require("BluePrints.Common.ClientEvent.ClientEventUtils"):GetCurrentEvent(), "客户端不存在特殊任务")
    assert(r2_266.Type == "SpecialQuest", "客户端不存在特殊任务")
    r2_266:TryFinishEvent(false)
  end,
  ChangeToMaster = function(r0_267)
    -- line: [4048, 4054] id: 267
    if r0_267.Player then
      r0_267.Player:ChangeToMaster(true)
    end
  end,
  ChangeBackToHero = function(r0_268)
    -- line: [4056, 4062] id: 268
    if r0_268.Player then
      r0_268.Player:ChangeBackToHero()
    end
  end,
  ActiveExploreStaticCreator = function(r0_269)
    -- line: [4064, 4071] id: 269
    for r6_269, r7_269 in pairs(UE4.UGameplayStatics.GetGameState(r0_269.Player).ExploreGroupMap) do
      print(_G.LogTag, "LXZ ActiveExploreStaticCreator", r6_269)
      r7_269:ActiveExploreGroupGM()
    end
    -- close: r2_269
  end,
  PrintRegionTypeData = function(r0_270, r1_270, r2_270)
    -- line: [4073, 4075] id: 270
    PrintTable({
      Type = r1_270,
    }, 10)
  end,
  InitGameMode = function(r0_271, r1_271)
    -- line: [4077, 4083] id: 271
    local r2_271 = UE.UGameplayStatics.GetGameMode(r0_271.Player)
    if not r2_271 then
      return 
    end
    r2_271:GMInitGameModeInfo(tonumber(r1_271))
  end,
  TestRealtimeContentValidate = function(r0_272, r1_272)
    -- line: [4086, 4098] id: 272
    HeroUSDKSubsystem():RequestRealTimeContentValidate(r1_272, {
      r0_272,
      function(r0_273, r1_273)
        -- line: [4089, 4091] id: 273
        DebugPrint("TestRealtimeContentValidateResponse", r1_273.Code, r1_273.Msg, r1_273.Data)
      end
    }, {
      r0_272,
      function(r0_274)
        -- line: [4094, 4096] id: 274
        DebugPrint("TestRealtimeContentValidateResponseFail")
      end
    })
  end,
  TestUploadChat = function(r0_275, ...)
    -- line: [4100, 4106] id: 275
    HeroUSDKSubsystem():RequestUploadChatData_Lua({
      ...
    }, r0_275, function(r0_276, r1_276)
      -- line: [4103, 4105] id: 276
      DebugPrint("TestUploadChatResponse", r1_276.Code, r1_276.Msg, r1_276.Data)
    end)
  end,
  TestUploadReport = function(r0_277)
    -- line: [4108, 4123] id: 277
    HeroUSDKSubsystem():RequestUploadReportData_Lua({
      {
        FromServerId = 1,
        FromRoleId = 2,
        FromRoleName = "TestName",
        Text = "TestText",
        Remark = "TestRemark",
        Reason = "TestReason",
      }
    }, r0_277, function(r0_278, r1_278)
      -- line: [4120, 4122] id: 278
      DebugPrint("TestUploadReportResponse", r1_278.Code, r1_278.Msg, r1_278.Data)
    end)
  end,
  TestUploadBanLog = function(r0_279)
    -- line: [4125, 4134] id: 279
    HeroUSDKSubsystem():RequestUploadBanLog_Lua({
      {
        BanType = 1,
        BanReason = "Reason1",
        BanBeginTime = 1,
        BanEndTime = 2,
      },
      {
        BanType = 2,
        BanReason = "Reason2",
        BanBeginTime = 1,
        BanEndTime = 2,
      }
    }, r0_279, function(r0_280, r1_280)
      -- line: [4131, 4133] id: 280
      DebugPrint("TestUploadBanLogResponse", r1_280.Code, r1_280.Msg, r1_280.Data)
    end)
  end,
  UnLoadChangeUI = function(r0_281)
    -- line: [4136, 4141] id: 281
    r0_281:GetGameInstance():CloseLoadingUI()
  end,
  PrintQuestData = function(r0_282)
    -- line: [4148, 4157] id: 282
    for r6_282, r7_282 in pairs(GWorld:GetAvatar().QuestUpdateDatas) do
      print(_G.LogTag, "ZJT_ 打印之前待提交任务数据缓存 PrintQuestData QuestId ", r6_282)
      for r12_282, r13_282 in pairs(r7_282) do
        print(_G.LogTag, "ZJT_ PrintQuestData QuestData eid ", r12_282, r13_282.Eid, r13_282.QuestId, r13_282.Id, r13_282.SubRegionId, r13_282.LevelName, r13_282.CreatorId)
      end
      -- close: r8_282
    end
    -- close: r2_282
  end,
  RequireAndEnterDS = function(r0_283, r1_283, r2_283)
    -- line: [4160, 4169] id: 283
    local r3_283 = GWorld:GetAvatar()
    r3_283:RequireDS(tonumber(r1_283), r2_283, function(r0_284)
      -- line: [4163, 4167] id: 284
      if ErrorCode:Check(r0_284) then
        r3_283:ConnectAndEnterDS()
      end
    end)
  end,
  LoadSmallObjects = function(r0_285)
    -- line: [4171, 4173] id: 285
    URuntimeCommonFunctionLibrary.LoadStreamingLevel(r0_285.Player)
  end,
  ExitDS = function(r0_286)
    -- line: [4175, 4178] id: 286
    GWorld:GetAvatar():ExitDS()
  end,
  EnterLocalDS = function(r0_287)
    -- line: [4180, 4183] id: 287
    local r1_287 = GWorld:GetAvatar()
    r0_287:GetGameInstance():ConnectDedicatedServer_Lua("127.0.0.1", 17777, r1_287.Account, r1_287.Eid)
  end,
  StartBlueProduct = function(r0_288, r1_288)
    -- line: [4185, 4188] id: 288
    GWorld:GetAvatar():StartProduct(r1_288)
  end,
  CompleteBlueProduct = function(r0_289, r1_289)
    -- line: [4190, 4193] id: 289
    GWorld:GetAvatar():CompleteProduct(r1_289)
  end,
  AccelerateBlueProduct = function(r0_290, r1_290)
    -- line: [4195, 4198] id: 290
    GWorld:GetAvatar():AccelerateProduct(r1_290)
  end,
  KickPlayer = function(r0_291, r1_291)
    -- line: [4200, 4203] id: 291
    GWorld:GetAvatar():KickPlayer(r1_291)
  end,
  KickSelf = function(r0_292, r1_292)
    -- line: [4205, 4207] id: 292
    r0_0:DedicatedServerCommand("KickSelf", r1_292)
  end,
  ShowClientTime = function(r0_293)
    -- line: [4209, 4212] id: 293
    DebugPrint("Current Time is", require("Utils.TimeUtils").TimeToStr())
  end,
  ShowServerTime = function(r0_294)
    -- line: [4214, 4219] id: 294
    local r1_294 = GWorld:GetAvatar()
    if r1_294 then
      r1_294:GetServerTime()
    end
  end,
  StartBattle = function(r0_295)
    -- line: [4221, 4226] id: 295
    UE4.UGameplayStatics.GetPlayerController(r0_295:GetGameInstance(), 0):StartBattle()
  end,
  TestDrawGacha = function(r0_296, r1_296, r2_296)
    -- line: [4228, 4231] id: 296
    GWorld:GetAvatar():DrawGacha(tonumber(r1_296), tonumber(r2_296))
  end,
  TestDrawSkinGacha = function(r0_297, r1_297, r2_297)
    -- line: [4233, 4240] id: 297
    local r3_297 = GWorld:GetAvatar()
    if not r3_297 then
      return 
    end
    r3_297:DrawSkinGacha(tonumber(r1_297), tonumber(r2_297))
  end,
  ShowGachaParams = function(r0_298)
    -- line: [4242, 4248] id: 298
    GWorld:GetAvatar():CallServer("GMGachaParams", function(r0_299)
      -- line: [4244, 4246] id: 299
      PrintTable(r0_299, 3)
    end)
  end,
  GachaSelfSelect = function(r0_300, r1_300, r2_300)
    -- line: [4250, 4257] id: 300
    local r3_300 = GWorld:GetAvatar()
    if not r3_300 then
      return 
    end
    r3_300:SetGachaSelfSelect(nil, tonumber(r1_300), tonumber(r2_300))
  end,
  FinishSystemGuide = function(r0_301, r1_301)
    -- line: [4259, 4262] id: 301
    GWorld:GetAvatar():FinishSystemGuide(tonumber(r1_301))
  end,
  PurchaseShopItem = function(r0_302, r1_302, r2_302)
    -- line: [4264, 4267] id: 302
    GWorld:GetAvatar():PurchaseShopItem(tonumber(r1_302), tonumber(r2_302))
  end,
  ShowPurchaseShopUI = function(r0_303)
    -- line: [4269, 4272] id: 303
    GWorld:GetGameInstance():GetGameUIManager():LoadUI(UIConst.SHOPMAIN, "ShopMain", UIConst.ZORDER_FOR_DESKTOP_TEMP)
  end,
  PlayAllNiagaraArround = function(r0_304)
    -- line: [4274, 4276] id: 304
    URuntimeCommonFunctionLibrary.PlayAllNiagaraArround(r0_304:GetGameInstance())
  end,
  EnemyVisionDebug = function(r0_305)
    -- line: [4278, 4286] id: 305
    for r6_305, r7_305 in ipairs(UGameplayStatics.GetAllActorsOfClass(r0_305.Player, AMonsterCharacter:StaticClass()):ToTable()) do
      local r8_305 = r7_305:GetComponentByClass(UCharDebugWidgetComponent:StaticClass())
      if r8_305 then
        r8_305.bEnemyVisionDebug = not r8_305.bEnemyVisionDebug
      end
    end
    -- close: r2_305
  end,
  TargetLocDebug = function(r0_306)
    -- line: [4288, 4296] id: 306
    for r6_306, r7_306 in ipairs(UGameplayStatics.GetAllActorsOfClass(r0_306.Player, AMonsterCharacter:StaticClass()):ToTable()) do
      local r8_306 = r7_306:GetComponentByClass(UCharDebugWidgetComponent:StaticClass())
      if r8_306 then
        r8_306.bTargetLocDebug = not r8_306.bTargetLocDebug
      end
    end
    -- close: r2_306
  end,
  ConnectServer = function(r0_307)
    -- line: [4298, 4303] id: 307
    local r1_307 = GWorld:GetAvatar()
    if r1_307 then
      r1_307:TestConnectLS()
    end
  end,
  ListenServer = function(r0_308, r1_308)
    -- line: [4305, 4308] id: 308
    print(_G.LogTag, "ListenServer", r1_308)
    WorldTravelSubsystem():ChangeDungeonByDungeonId(r1_308, CommonConst.DungeonNetMode.ListenServer)
  end,
  NetMode = function(r0_309)
    -- line: [4310, 4323] id: 309
    local r1_309 = r0_309:GetGameInstance():GetNetMode()
    if r1_309 == 0 then
      print(_G.LogTag, "Current NetMode StandAlone")
    elseif r1_309 == 1 then
      print(_G.LogTag, "Current NetMode DedicatedServer")
    elseif r1_309 == 2 then
      print(_G.LogTag, "Current NetMode ListenServer")
    elseif r1_309 == 3 then
      print(_G.LogTag, "Current NetMode Client")
    else
      print(_G.LogTag, "Unknown Current NetMode", r1_309)
    end
  end,
  Reconnect = function(r0_310)
    -- line: [4325, 4328] id: 310
    r0_310:GetGameInstance():GetNetworkManager():TestReconnect()
  end,
  TestNetworkFailure = function(r0_311, r1_311)
    -- line: [4330, 4332] id: 311
    r0_311:GetGameInstance():HandleNetworkError(tonumber(r1_311), false)
  end,
  TestCrash = function(r0_312)
    -- line: [4334, 4337] id: 312
    UE.UGameplayStatics.GetPlayerController(r0_312:GetGameInstance(), 0):TestCrash()
  end,
  ForbidEntityMessage = function(r0_313, r1_313)
    -- line: [4339, 4341] id: 313
    GWorld:ForbidEntityMessage(r1_313)
  end,
  DestroyAllMonster = function(r0_314)
    -- line: [4343, 4353] id: 314
    local r1_314 = TArray(AActor)
    UE4.UGameplayStatics.GetAllActorsOfClass(r0_314.Player, AMonsterCharacter, r1_314)
    for r5_314 = 1, r1_314:Length(), 1 do
      local r6_314 = r1_314:Get(r5_314)
      if r6_314 then
        r6_314:EMActorDestroy(EDestroyReason.GM)
      end
    end
  end,
  DSVersion = function(r0_315)
    -- line: [4355, 4361] id: 315
    return require("Utils.MiscUtils").GetGameCofingSettings("DSVersion")
  end,
  ManualGC = function(r0_316)
    -- line: [4363, 4368] id: 316
    collectgarbage("collect")
    UE4.UKismetSystemLibrary.CollectGarbage()
  end,
  SetClientTime = function(r0_317, r1_317, r2_317, r3_317, r4_317, r5_317, r6_317)
    -- line: [4370, 4376] id: 317
    local r7_317 = require("Utils.TimeUtils")
    r7_317.TimeOffset = math.floor(r7_317.DataToTimestamp(tonumber(r1_317), tonumber(r2_317), tonumber(r3_317), tonumber(r4_317), tonumber(r5_317), tonumber(r6_317)) - os.time())
  end,
  PSOPrepare = function(r0_318, r1_318, r2_318)
    -- line: [4378, 4384] id: 318
    local r3_318 = require("Test.PSOPrepare")
    r3_318:Initialize(r0_318)
    r3_318:DoPrepare(r1_318, r2_318)
  end,
  ResetTrollyLoc = function(r0_319, r1_319, r2_319)
    -- line: [4386, 4410] id: 319
    local r3_319 = tonumber(r1_319)
    local r4_319 = tonumber(r2_319)
    local r5_319 = UE.UGameplayStatics.GetGameMode(r0_319.Player)
    if not r5_319:GetDungeonComponent() then
      DebugPrint("当前未找到副本组件")
      return 
    end
    r5_319.EMGameState.NowPathId = r3_319
    r5_319.EMGameState.NextPathId = r4_319
    for r10_319, r11_319 in pairs(r5_319.EMGameState.DefBaseMap) do
      if IsValid(r11_319) then
        r11_319.NowPathId = r3_319
        r11_319.NextPathId = r4_319
        r11_319.Percent = 0
        r11_319.Spline.Spline:ClearSplinePoints(false)
        r11_319:AddNewPath()
        local r12_319 = r11_319.Spline:GetMoveTransform(r11_319.Percent)
        r12_319 = FTransform(r12_319.Rotation, r12_319.Translation + FVector(0, 0, 200), r11_319:GetActorScale3D())
        r11_319:K2_SetActorTransform(r12_319, false, nil, false)
        r0_319.Player:K2_SetActorLocation(FTransform(r12_319.Rotation, r12_319.Translation + FVector(0, 0, 400), r11_319:GetActorScale3D()).Translation, false, nil, false)
      end
    end
    -- close: r6_319
  end,
  ClearFirstMonsterRecords = function(r0_320)
    -- line: [4412, 4422] id: 320
    local r1_320 = GWorld:GetAvatar()
    if not r1_320 then
      return 
    end
    r1_320:CallServerMethod("GMClearFirstMonsterRecords")
    local r2_320 = r0_320:GetGameInstance():GetCurrentGameMode().EMGameState
    r2_320.FirstSeen = {}
    r2_320.MonstersNeedCheck = {}
  end,
  ClearMonGuide = function(r0_321)
    -- line: [4424, 4431] id: 321
    local r1_321 = GWorld:GetAvatar()
    if not r1_321 then
      return 
    end
    r1_321:CallServerMethod("GMClearFirstStrongMonsterRecords")
  end,
  StartQuest = function(r0_322, r1_322)
    -- line: [4433, 4455] id: 322
    local r2_322 = GWorld:GetAvatar()
    if not r2_322 then
      return 
    end
    local r3_322 = tonumber(string.sub(r1_322, 1, 6))
    print(_G.LogTag, "QuestChainId", r3_322)
    local r4_322 = r2_322.QuestChains[r3_322]
    if r4_322 and r4_322:IsFinish() then
      DebugPrint("ZJT_ 任务链已经完成 ", r3_322)
      return 
    end
    if r4_322 and r4_322:CheckQuestIdComplete(r1_322) then
      DebugPrint("ZJT_ 任务已经完成 ", r1_322)
      return 
    end
    if r4_322 and r4_322.DoingQuestId == r1_322 then
      DebugPrint("任务正在进行 ", r1_322)
      return 
    end
    r2_322:GMStartQuest(tonumber(r3_322), tonumber(r1_322), true)
  end,
  SuccQuest = function(r0_323, r1_323)
    -- line: [4457, 4472] id: 323
    local r2_323 = GWorld:GetAvatar()
    if not r2_323 then
      return 
    end
    local r3_323 = tonumber(string.sub(r1_323, 1, 6))
    r1_323 = tonumber(r1_323)
    local r4_323 = r2_323.QuestChains[r3_323]
    if r4_323 and r4_323:IsFinish() then
      DebugPrint("ZJT_ 任务链已经完成 ", r3_323)
      return 
    end
    if r4_323 and r4_323:CheckQuestIdComplete(r1_323) then
      DebugPrint("ZJT_ 任务已经完成 ", r1_323)
      return 
    end
    r2_323:CallServerMethod("GMSuccestQuest", r3_323, r1_323)
  end,
  SkipCurrentRunningQuest = function(r0_324)
    -- line: [4474, 4493] id: 324
    local r1_324 = GWorld:GetAvatar()
    if not r1_324 then
      return 
    end
    local r2_324 = r1_324.TrackingQuestChainId
    if r2_324 == 0 then
      DebugPrint("ZJT_ 当前未追踪任何任务链 ", r2_324)
      return 
    end
    local r3_324 = r1_324.QuestChains[r2_324]
    if r3_324 and r3_324:IsFinish() then
      DebugPrint("ZJT_ 任务链已经完成 ", r2_324)
      return 
    end
    local r4_324 = r3_324.DoingQuestId
    if r3_324 and r3_324:CheckQuestIdComplete(r4_324) then
      DebugPrint("ZJT_ 任务已经完成 ", r4_324)
      return 
    end
    r0_324:SuccQuest(r4_324)
  end,
  FailQuest = function(r0_325, r1_325)
    -- line: [4495, 4505] id: 325
    local r2_325 = GWorld:GetAvatar()
    if not r2_325 then
      return 
    end
    local r3_325 = tonumber(string.sub(r1_325, 1, 6))
    print(_G.LogTag, "QuestChainId", r3_325)
    if not r2_325.QuestChains[r3_325] then
      r0_325:StartQuestChain(r3_325)
    end
    r2_325:RecoverDataByQuestChainId(r3_325)
  end,
  ShowUseCountSkill = function(r0_326)
    -- line: [4507, 4523] id: 326
    local r1_326 = require("EMCache.EMCache")
    local r2_326 = r1_326:Get("bNeedCountPlayerSkillUsedTimesList", true) and {}
    local r3_326 = {}
    for r8_326, r9_326 in pairs(r2_326) do
      table.insert(r3_326, r8_326)
    end
    -- close: r4_326
    DebugPrint("CountSkillUsedTime->当前角色的本地存储允许哪些技能类似可以计算:", table.concat(r3_326, ","))
    local r5_326 = r1_326:Get("CountPlayerSkillUsedTimesList", true) and {}
    DebugPrint("CountSkillUsedTime->当前技能的使用次数:")
    DebugPrint("CountSkillUsedTime->----------------------------")
    for r10_326, r11_326 in pairs(r5_326) do
      DebugPrint("CountSkillUsedTime->技能类型", r10_326, "使用次数", r11_326)
    end
    -- close: r6_326
    DebugPrint("CountSkillUsedTime->----------------------------")
  end,
  ShowCacheUseCountSkill = function(r0_327)
    -- line: [4525, 4540] id: 327
    local r1_327 = r0_327.Player
    if r1_327 then
      r1_327 = r0_327.Player.NeedCountPlayerSkillUsedTimesList and {}
    else
      goto label_7	-- block#2 is visited secondly
    end
    local r2_327 = {}
    for r7_327, r8_327 in pairs(r1_327) do
      table.insert(r2_327, r7_327)
    end
    -- close: r3_327
    DebugPrint("CountSkillUsedTime->当前角色的缓存允许哪些技能类似可以计算:", table.concat(r2_327, ","))
    local r4_327 = r0_327.Player
    if r4_327 then
      r4_327 = r0_327.Player.CountPlayerSkillUsedTimesList and {}
    else
      goto label_39	-- block#8 is visited secondly
    end
    DebugPrint("CountSkillUsedTime->当前技能的使用次数:")
    DebugPrint("CountSkillUsedTime->----------------------------")
    for r9_327, r10_327 in pairs(r4_327) do
      DebugPrint("CountSkillUsedTime->技能类型", r9_327, "使用次数", r10_327)
    end
    -- close: r5_327
    DebugPrint("CountSkillUsedTime->----------------------------")
  end,
  SuccessAllQuest = function(r0_328)
    -- line: [4542, 4544] id: 328
    GWorld.StoryMgr:SuccessAllQuest()
  end,
  PrintStorylineInfo = function(r0_329)
    -- line: [4546, 4548] id: 329
    GWorld.StoryMgr:PrintStorylineInfo()
  end,
  PrintStorylinesNeedRestartInfo = function(r0_330)
    -- line: [4550, 4552] id: 330
    GWorld.StoryMgr:PrintStorylinesNeedRestartInfo()
  end,
  SetPlayerDilation = function(r0_331, r1_331)
    -- line: [4554, 4558] id: 331
    if r0_331.Player then
      r0_331.Player:SetTimeDilation(tonumber(r1_331))
    end
  end,
  Mem = function(r0_332)
    -- line: [4560, 4564] id: 332
    local r1_332 = require("MemDump")
    r1_332 = nil
    collectgarbage("collect")
  end,
  CleanLuaTable = function(r0_333)
    -- line: [4566, 4568] id: 333
    DataMgr.CleanAllTable()
  end,
  PrintCurrentSkillID = function(r0_334)
    -- line: [4570, 4582] id: 334
    local r1_334 = {}
    for r6_334, r7_334 in pairs(r0_334.Player.Type_2_Skills) do
      r1_334[r6_334] = r7_334
    end
    -- close: r2_334
    local r2_334 = r0_334.Player.ForceSkills
    for r7_334, r8_334 in pairs(r1_334) do
      if r2_334:Find(r8_334) then
        r1_334[r7_334] = r2_334:Find(r8_334)
      end
    end
    -- close: r3_334
    PrintTable(r1_334, 10, "当前按键技能为")
  end,
  PrintMonsterSkill = function(r0_335, r1_335)
    -- line: [4584, 4595] id: 335
    local r4_335 = Battle(UE4.UGameplayStatics.GetPlayerCharacter(r0_335:GetGameInstance(), 0)):GetEntity(tonumber(r1_335))
    if not r4_335 then
      DebugPrint("Tianyi@ 找不到对应怪物")
      return 
    end
    r4_335.DebugPrintSkillId = true
  end,
  ShowAvatarStatus = function(r0_336)
    -- line: [4597, 4603] id: 336
    local r1_336 = GWorld:GetAvatar()
    local r2_336 = "CurrentAvatarStatus: "
    if r1_336 then
      r1_336:PrintAvatarStatus()
    end
  end,
  StatMonster = function(r0_337)
    -- line: [4605, 4609] id: 337
    require("StatMonster"):Stat(r0_337)
    local r1_337 = nil
  end,
  StatMonsterMem = function(r0_338)
    -- line: [4611, 4615] id: 338
    require("StatMonster"):StatMem(r0_338)
    local r1_338 = nil
  end,
  StatFX = function(r0_339, r1_339)
    -- line: [4617, 4619] id: 339
    require("StatFX"):Stat(r0_339, r1_339)
  end,
  StatLevel = function(r0_340)
    -- line: [4621, 4625] id: 340
    require("StatLevel"):Stat(r0_340)
    local r1_340 = nil
  end,
  StatRecordLevel = function(r0_341)
    -- line: [4627, 4631] id: 341
    require("StatRecordLevel"):Stat(r0_341)
    local r1_341 = nil
  end,
  PreviewPopup = function(r0_342, r1_342)
    -- line: [4633, 4637] id: 342
    r0_342:GetGameInstance():GetGameUIManager():PreviewCommonPopupStyle(r1_342)
  end,
  ShowPopup = function(r0_343, r1_343)
    -- line: [4639, 4643] id: 343
    r0_343:GetGameInstance():GetGameUIManager():ShowCommonPopupUI(tonumber(r1_343), {})
  end,
  ShowRecoverUI = function(r0_344)
    -- line: [4645, 4647] id: 344
    UIUtils.ShowActionRecover(r0_344)
  end,
  TestGetCharWeapon = function(r0_345, r1_345, ...)
    -- line: [4649, 4660] id: 345
    local r2_345 = {
      ...
    }
    local r3_345 = {
      [r1_345 .. "s"] = {},
    }
    for r8_345, r9_345 in ipairs(r2_345) do
      if not r3_345[(r1_345 .. "s")][tonumber(r9_345)] then
        r3_345[r1_345 .. "s"][tonumber(r9_345)] = 0
      end
      r3_345[r1_345 .. "s"][tonumber(r9_345)] = r3_345[(r1_345 .. "s")][tonumber(r9_345)] + 1
    end
    -- close: r4_345
    UIUtils.ShowGetCharWeaponPage(r3_345, nil, nil, false)
  end,
  DisableCheckBox = function(r0_346)
    -- line: [4662, 4667] id: 346
    r0_346:GetGameInstance():GetGameUIManager():GetUIObj("TrainingGroundSetup").WBP_Training_Root.WBP_Com_CheckBox_LeftText:ForbidBtn(true)
  end,
  EnableCheckBox = function(r0_347)
    -- line: [4669, 4674] id: 347
    r0_347:GetGameInstance():GetGameUIManager():GetUIObj("TrainingGroundSetup").WBP_Training_Root.WBP_Com_CheckBox_LeftText:ForbidBtn(false)
  end,
  IsCrit = function(r0_348)
    -- line: [4676, 4684] id: 348
    if require("EMLuaConst").IsCanCrit == false then
      require("EMLuaConst").IsCanCrit = true
    else
      require("EMLuaConst").IsCanCrit = false
    end
  end,
  IsFloat = function(r0_349)
    -- line: [4686, 4694] id: 349
    if require("EMLuaConst").IsCanFloat == false then
      require("EMLuaConst").IsCanFloat = true
    else
      require("EMLuaConst").IsCanFloat = false
    end
  end,
  TestEvent = function(r0_350)
    -- line: [4696, 4698] id: 350
    r0_350.Player:TestTriggerBattleEvent(30)
  end,
  ShowDamageDetails = function(r0_351)
    -- line: [4700, 4703] id: 351
    Const.bShowDamageDetails = not Const.bShowDamageDetails
    require("EMLuaConst").bShowDamageDetails = Const.bShowDamageDetails
  end,
  DSShowDetails = function(r0_352)
    -- line: [4705, 4707] id: 352
    r0_352:ServerBattleCommand("DSShowDetails")
  end,
  ShowRealAttr = function(r0_353)
    -- line: [4709, 4741] id: 353
    r0_353.Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
    local r2_353 = r0_353.Player:GetAttr("ATK")
    local r3_353 = r0_353.Player:GetAttr("ATK_Char")
    local r4_353 = r2_353 - r3_353
    local r5_353 = r0_353.Player:GetAttr("SkillIntensity")
    local r6_353 = r0_353.Player:GetAttr("SkillSustain")
    local r7_353 = r0_353.Player:GetAttr("SkillRange")
    local r8_353 = r0_353.Player:GetAttr("SkillEfficiency")
    local r9_353 = string.format("%.2f", (r0_353.Player:GetAttr("StrongValue") + 1) * 100)
    ScreenPrint("背水：" .. string.format("%.2f", (r0_353.Player:GetAttr("EnmityValue") + 1) * 100) .. "%")
    ScreenPrint("昂扬：" .. r9_353 .. "%")
    local r11_353 = r0_353.Player:GetCurrentWeapon()
    if r11_353 then
      local r12_353 = string.format("%.2f", r11_353:GetAttr("CRI") * 100)
      local r13_353 = string.format("%.2f", r11_353:GetAttr("CRD") * 100)
      local r14_353 = string.format("%.2f", r11_353:GetAttr("TriggerProbability") * 100)
      ScreenPrint("多重射击：" .. string.format("%.2f", r11_353:GetAttr("MultiShoot") * 100) .. "%")
      ScreenPrint("触发概率：" .. r14_353 .. "%")
      ScreenPrint("爆伤：" .. r13_353 .. "%")
      ScreenPrint("暴击：" .. r12_353 .. "%")
    end
    ScreenPrint("技能效益：" .. string.format("%.2f", r8_353 * 100) .. "%")
    ScreenPrint("技能耐久：" .. string.format("%.2f", r6_353 * 100) .. "%")
    ScreenPrint("技能范围：" .. string.format("%.2f", r7_353 * 100) .. "%")
    ScreenPrint("技能强度：" .. string.format("%.2f", r5_353 * 100) .. "%")
    ScreenPrint("武器攻击：" .. r4_353)
    ScreenPrint("角色攻击：" .. r3_353)
    ScreenPrint("总攻击：" .. r2_353)
  end,
  StatDamage = function(r0_354)
    -- line: [4743, 4762] id: 354
    if not Const.bShowDamageDetails then
      ScreenPrint("未开启伤害详细信息")
      return 
    end
    if Const.bStatDamage then
      Const.bStatDamage = false
      ScreenPrint("该次统计总计伤害：" .. string.format("%.5f", Const.TotalDamage))
      if Const.EndTime and Const.StartTime then
        ScreenPrint("该次统计总计伤害时长：" .. string.format("%.5f", Const.EndTime - Const.StartTime))
      end
      Const.TotalDamage = 0
    else
      ScreenPrint("统计总计伤害开始！！！")
      Const.TotalDamage = 0
      Const.bStatDamage = true
      Const.StartTime = nil
      Const.EndTime = nil
    end
  end,
  CheckCondition = function(r0_355, r1_355, r2_355)
    -- line: [4764, 4770] id: 355
    if not r2_355 then
      r2_355 = false
    end
    local r3_355 = GWorld:GetAvatar()
    if r3_355 then
      print(_G.LogTag, "CheckCondition Result: ", ConditionUtils.CheckCondition(r3_355, tonumber(r1_355), r2_355))
    end
  end,
  ServerCheckCondition = function(r0_356, r1_356, r2_356)
    -- line: [4772, 4781] id: 356
    if not r2_356 then
      r2_356 = false
    end
    local r3_356 = GWorld:GetAvatar()
    if r3_356 then
      ConditionUtils.ServerCheckCondition(r3_356, tonumber(r1_356), function(r0_357)
        -- line: [4776, 4778] id: 357
        print(_G.LogTag, "ServerCheckCondition Result: ", r0_357)
      end, r2_356)
    end
  end,
  PrintGetCover = function(r0_358, r1_358)
    -- line: [4783, 4791] id: 358
  end,
  PrintUpdateCover = function(r0_359, r1_359)
    -- line: [4793, 4801] id: 359
  end,
  TrainingCreateMonster = function(r0_360, ...)
    -- line: [4803, 4812] id: 360
    local r1_360 = {
      ...
    }
    local r2_360 = {}
    for r6_360 = 1, #r1_360, 3 do
      table.insert(r2_360, {
        tonumber(r1_360[r6_360]),
        tonumber(r1_360[r6_360 + 1]),
        tonumber(r1_360[r6_360 + 2])
      })
    end
    local r3_360 = UE4.UGameplayStatics.GetGameMode(r0_360.Player)
    if r3_360 ~= nil then
      r3_360:TriggerDungeonComponentFun("CreateMonster", r2_360)
    end
  end,
  TrainingSetMonsterAI = function(r0_361, r1_361)
    -- line: [4814, 4823] id: 361
    local r2_361 = UE4.UGameplayStatics.GetGameMode(r0_361.Player)
    if r2_361 ~= nil then
      local r3_361 = false
      if r1_361 == "true" then
        r3_361 = true
      end
      r2_361:TriggerDungeonComponentFun("SetMonsterAI", r3_361)
    end
  end,
  TrainingRemoveMonster = function(r0_362)
    -- line: [4825, 4830] id: 362
    local r1_362 = UE4.UGameplayStatics.GetGameMode(r0_362.Player)
    if r1_362 ~= nil then
      r1_362:TriggerDungeonComponentFun("RemoveMonster")
    end
  end,
  TrainingClearCreateInfo = function(r0_363)
    -- line: [4832, 4837] id: 363
    local r1_363 = UE4.UGameplayStatics.GetGameMode(r0_363.Player)
    if r1_363 ~= nil then
      r1_363:TriggerDungeonComponentFun("ClearCreateInfo")
    end
  end,
  TouchSpeedPitch = function(r0_364, r1_364)
    -- line: [4839, 4843] id: 364
    local r2_364 = UE4.UGameplayStatics.GetPlayerCharacter(r0_364:GetGameInstance(), 0)
    r1_364 = tonumber(r1_364)
    r2_364.TurnSpeedPitch = r1_364
  end,
  TouchSpeedYaw = function(r0_365, r1_365)
    -- line: [4845, 4849] id: 365
    local r2_365 = UE4.UGameplayStatics.GetPlayerCharacter(r0_365:GetGameInstance(), 0)
    r1_365 = tonumber(r1_365)
    r2_365.TurnSpeedYaw = r1_365
  end,
  TouchLimitPitch = function(r0_366, r1_366)
    -- line: [4851, 4855] id: 366
    local r2_366 = UE4.UGameplayStatics.GetPlayerCharacter(r0_366:GetGameInstance(), 0)
    r1_366 = tonumber(r1_366)
    r2_366.TurnLimitPitch = math.pi / 180 * r1_366
  end,
  TouchLimitYaw = function(r0_367, r1_367)
    -- line: [4857, 4861] id: 367
    local r2_367 = UE4.UGameplayStatics.GetPlayerCharacter(r0_367:GetGameInstance(), 0)
    r1_367 = tonumber(r1_367)
    r2_367.TurnLimitYaw = math.pi / 180 * r1_367
  end,
}
local r1_0 = {
  PlayerLevelMin = function(r0_368, r1_368)
    -- line: [4864, 4870] id: 368
    if not r0_368 then
      return 
    end
    r0_368:GMSetPlayerLevel(r1_368)
  end,
  DynamicEventCompleteTimes = function(r0_369, r1_369)
    -- line: [4872, 4875] id: 369
    PrintTable({
      Params = r1_369,
    }, 10)
    r0_369:CallServerMethod("GMSetDynamicQuestCompleteTimes", table.unpack(r1_369))
  end,
  PlayerLevelMax = function(r0_370, r1_370)
    -- line: [4877, 4883] id: 370
    if not r0_370 then
      return 
    end
    r0_370:GMSetPlayerLevel(r1_370)
  end,
  QuestChain = function(r0_371, r1_371)
    -- line: [4885, 4887] id: 371
    r0_0:SuccQuestChain(r1_371)
  end,
  Impression = function(r0_372, r1_372)
    -- line: [4889, 4893] id: 372
    if type(r1_372) == "table" then
      r0_0:CompleteImpressionSystem(tonumber(r1_372[1]))
    end
  end,
  HaveResource = function(r0_373, r1_373)
    -- line: [4895, 4902] id: 373
    if not r0_373 then
      return 
    end
    require("BluePrints.UI.GMInterface.GMFunctionLibrary").ExecConsoleCommand(GWorld.GameInstance, "sgm ar " .. r1_373[1] .. " " .. r1_373[2])
  end,
  Quest = function(r0_374, r1_374)
    -- line: [4904, 4906] id: 374
    r0_0:SuccQuest(r1_374)
  end,
  MechanismState = function(r0_375, r1_375)
    -- line: [4908, 4910] id: 375
    r0_0:DedicatedServerCommand("TriggerMechanism", table.unpack(r1_375))
  end,
  DungeonComplete = function(r0_376, r1_376)
    -- line: [4912, 4914] id: 376
    r0_376:CallServerMethod("GMDungeonComplete", table.unpack(r1_376))
  end,
  HardBossComplete = function(r0_377, r1_377)
    -- line: [4916, 4918] id: 377
    r0_377:CallServerMethod("GMHardBossComplete", table.unpack(r1_377))
  end,
  RougeLikeComplete = function(r0_378, r1_378)
    -- line: [4920, 4922] id: 378
    r0_378:CallServerMethod("GMRougeLikeComplete", r1_378)
  end,
}
function r0_0.CompleteCondition(r0_379, r1_379)
  -- line: [4925, 4953] id: 379
  if not r1_379 then
    return 
  end
  if type(r1_379) ~= "table" then
    r1_379 = {
      tonumber(r1_379)
    }
  end
  local r2_379 = GWorld:GetAvatar()
  if not r2_379 then
    return 
  end
  local r3_379 = 1
  local function r4_379(r0_380, r1_380)
    -- line: [4935, 4945] id: 380
    if r1_380 == r1_379[r3_379] and r3_379 < #r1_379 then
      r3_379 = r3_379 + 1
      while r3_379 < #r1_379 do
        local r2_380 = ConditionUtils.CheckCondition(r2_379, r1_379[r3_379])
        if r2_380 then
          r2_380 = r3_379 + 1
          r3_379 = r2_380
        else
          break
        end
      end
      r0_379:CompleteSingleCondition(r1_379[r3_379])
    end
  end
  EventManager:AddEvent(EventID.ConditionComplete, r0_379, r4_379)
  local r5_379 = r1_379[1]
  if ConditionUtils.CheckCondition(r2_379, r5_379) then
    r4_379(nil, r5_379)
  else
    r0_379:CompleteSingleCondition(r5_379)
  end
end
function r0_0.FreezeWorldComposition(r0_381, r1_381)
  -- line: [4955, 4970] id: 381
  if not r1_381 then
    r1_381 = 1
  end
  r1_381 = tonumber(r1_381)
  local r3_381 = UE4.UGameplayStatics.GetGameMode(r0_381:GetGameInstance()):GetWCSubSystem()
  if not r3_381 then
    return 
  end
  if r1_381 > 0 then
    r3_381:FreezeWorldComposition()
  else
    r3_381:UnFreezeWorldComposition()
  end
end
function r0_0.BreakableItemNavEnableInLower(r0_382, r1_382)
  -- line: [4973, 4975] id: 382
  UE4.URuntimeCommonFunctionLibrary.EnableBreakableItemNavModifyInLower(tonumber(r1_382) > 0)
end
function r0_0.CompleteSingleCondition(r0_383, r1_383)
  -- line: [4978, 5003] id: 383
  if not r1_383 then
    return 
  end
  r1_383 = tonumber(r1_383)
  local r2_383 = GWorld:GetAvatar()
  if not r2_383 then
    return 
  end
  if ConditionUtils.CheckCondition(r2_383, r1_383) then
    return 
  end
  local r3_383 = DataMgr.Condition[r1_383]
  local r5_383 = string.lower(r3_383.ConditionLogic)
  for r10_383, r11_383 in pairs(r3_383.ConditionMap) do
    for r15_383 = 1, #r11_383, 1 do
      if not ConditionUtils[("Judge" .. r10_383)](r2_383, r11_383[r15_383]) then
        if r1_0[r10_383] then
          r1_0[r10_383](r2_383, r11_383[r15_383])
          if r5_383 == "or" then
            return 
          end
        else
          print(_G.LogTag, string.format("条件完成函数【%s】不存在", r10_383))
        end
      end
    end
  end
  -- close: r6_383
end
function r0_0.CompleteSystemCondition(r0_384)
  -- line: [5006, 5014] id: 384
  local r1_384 = require("BluePrints.UI.GMInterface.GMFunctionLibrary")
  r1_384.ExecConsoleCommand(r0_384:GetGameInstance(), "sgm sysu")
  r0_384:SuccessAllSystemGuide()
  r1_384.ExecConsoleCommand(r0_384:GetGameInstance(), "sgm CompleteCondition " .. tostring(8002))
  r1_384.ExecConsoleCommand(r0_384:GetGameInstance(), "sgm CompleteCondition " .. tostring(4220))
  r1_384.ExecConsoleCommand(r0_384:GetGameInstance(), "sgm CompleteCondition " .. tostring(4170))
  r1_384.ExecConsoleCommand(r0_384:GetGameInstance(), "sgm CompleteCondition " .. tostring(2001))
end
function r0_0.MockAllSystemCondition(r0_385, r1_385)
  -- line: [5017, 5037] id: 385
  local r2_385 = GWorld:GetAvatar()
  if r2_385 then
    r2_385.bCrackUnlockAllSystems = true
  end
  local r5_385 = r0_385:GetGameInstance():GetGameUIManager():GetUIObj("BattleMain")
  if r5_385 then
    r5_385:InitBtnList()
    r5_385.Btn_Esc:LoadImage(11)
    r5_385.Battle_Map:OnChangeKeyBoardSet()
    r5_385:EndChat()
    r5_385:InitChat()
    r5_385:_RefreshEscReddot()
  end
  if r1_385 == "1" then
    require("EMCache.EMCache"):Set("GM_MockAllSystemCondition", true, true)
  end
end
function r0_0.MockSystemCondition(r0_386, r1_386)
  -- line: [5040, 5051] id: 386
  local r2_386 = GWorld:GetAvatar()
  if r2_386 then
    r2_386.CrackedUnlockSystems[r1_386] = true
  end
  local r5_386 = r0_386:GetGameInstance():GetGameUIManager():GetUIObj("BattleMain")
  if r5_386 then
    r5_386:InitBtnList()
  end
end
function r0_0.ShowSystemUnlock(r0_387, r1_387)
  -- line: [5053, 5063] id: 387
  GWorld:GetAvatar():OnSystemFirstTimeUnlock_Internal(r1_387, function()
    -- line: [5055, 5062] id: 388
    UIManager(GWorld.GameInstance):UnLoadUINew("SystemUnlockGuide")
    local r0_388 = UIManager(GWorld.GameInstance):GetUIObj("BattleMain")
    if r0_388 ~= nil and r0_388.Pos_SubSystemUnlock ~= nil then
      r0_388.Pos_SubSystemUnlock:ClearChildren()
      r0_388.Pos_SubSystemUnlock:SetVisibility(ESlateVisibility.Collapsed)
    end
  end)
end
function r0_0.FakeUIUnlockConditionComplete(r0_389, ...)
  -- line: [5066, 5075] id: 389
  local r1_389 = {
    ...
  }
  local r2_389 = #r1_389
  local r3_389 = GWorld:GetAvatar()
  if r3_389 and r2_389 > 0 then
    for r7_389 = 1, r2_389, 1 do
      r3_389:UIUnlockMgrOnConditionComplete(tonumber(r1_389[r7_389]))
    end
  end
end
function r0_0.UnLockAllDungeonSelectLevels(r0_390)
  -- line: [5078, 5094] id: 390
  local r2_390 = {}
  local r3_390 = GWorld:GetAvatar()
  for r8_390, r9_390 in pairs(DataMgr.SelectDungeon) do
    local r10_390 = r9_390.Condition
    if r10_390 then
      for r15_390, r16_390 in pairs(r10_390) do
        if not ConditionUtils.CheckCondition(r3_390, r16_390) then
          table.insert(r2_390, r16_390)
        end
      end
      -- close: r11_390
    end
  end
  -- close: r4_390
  r0_390:CompleteCondition(r2_390)
end
function r0_0.UnLockAllDungeonLevels(r0_391)
  -- line: [5097, 5113] id: 391
  local r2_391 = {}
  local r3_391 = GWorld:GetAvatar()
  for r8_391, r9_391 in pairs(DataMgr.Dungeon) do
    local r10_391 = r9_391.Condition
    if r10_391 then
      for r15_391, r16_391 in pairs(r10_391) do
        if not ConditionUtils.CheckCondition(r3_391, r16_391) then
          table.insert(r2_391, r16_391)
        end
      end
      -- close: r11_391
    end
  end
  -- close: r4_391
  r0_391:CompleteCondition(r2_391)
end
function r0_0.PlaySequence(r0_392, r1_392)
  -- line: [5115, 5124] id: 392
  local r2_392 = LoadObject(r1_392)
  if not r2_392 then
    DebugPrint("error GM播放sequence传入路径错误", r1_392)
    return 
  end
  local r3_392, r4_392 = UE4.ULevelSequencePlayer.CreateLevelSequencePlayer(r0_392:GetGameInstance(), r2_392, UE4.FMovieSceneSequencePlaybackSettings())
  r4_392:Play()
end
function r0_0.FSMDebug(r0_393, r1_393)
  -- line: [5126, 5142] id: 393
  if r1_393 ~= nil and tonumber(r1_393) == nil then
    UE4.UCharacterFSM.EnableTagDebug(r1_393)
    return 
  end
  local r3_393 = UE4.UGameplayStatics.GetPlayerCharacter(r0_393:GetGameInstance(), 0)
  if not r1_393 then
    r3_393.CharFSMComp.bDebugMode = not r3_393.CharFSMComp.bDebugMode
  else
    local r4_393 = Battle(r3_393):GetEntity(tonumber(r1_393))
    if r4_393 then
      r4_393.CharFSMComp.bDebugMode = not r4_393.CharFSMComp.bDebugMode
    end
  end
end
function r0_0.CompleteImpressionSystem(r0_394, r1_394, r2_394)
  -- line: [5144, 5170] id: 394
  r1_394 = tonumber(r1_394)
  local r3_394 = ""
  local function r4_394()
    -- line: [5147, 5151] id: 395
    DebugPrint("GM_Command:CompleteImpressionSystem@", r3_394)
    GWorld.GameInstance:GetGameUIManager():ShowUITip(UIConst.Tip_CommonToast, r3_394, 3)
  end
  if not r1_394 then
    r3_394 = "TalkTriggerId为空"
    r4_394()
    return 
  end
  local r5_394 = GWorld:GetAvatar()
  if not r5_394 then
    r3_394 = "Avatar不存在"
    r4_394()
    return 
  end
  if r5_394.ImpressionTalkTriggers[r1_394] then
    r3_394 = "对应的对话已完成，无法重复完成"
    r4_394()
    return 
  end
  r5_394:SetTalkTriggerComplete_New(r1_394)
end
function r0_0.SystemGuideSwitch(r0_396, r1_396)
  -- line: [5173, 5186] id: 396
  if r1_396 == "Open" then
    SystemGuideManager.Invalid = false
    DebugPrint("系统引导打开")
    return 
  end
  if r1_396 == "Close" then
    SystemGuideManager.Invalid = true
    DebugPrint("系统引导关闭")
    return 
  end
end
function r0_0.SuccessAllSystemGuide(r0_397)
  -- line: [5188, 5193] id: 397
  DebugPrint("GM_Command:SuccessAllSystemGuide:Success all SystemGuide")
  SystemGuideManager:GMEnforceFinishAllSysGuide()
end
function r0_0.SwitchCullModifier(r0_398, r1_398)
  -- line: [5195, 5203] id: 398
  if r1_398 == "true" then
    DebugPrint("UE4.AEMRecastNavMesh.SwitchCullModifier(true)")
    UE4.AEMRecastNavMesh.SwitchCullModifier(true)
  else
    DebugPrint("UE4.AEMRecastNavMesh.SwitchCullModifier(false)")
    UE4.AEMRecastNavMesh.SwitchCullModifier(false)
  end
end
function r0_0.I18Time(r0_399, r1_399, r2_399)
  -- line: [5205, 5218] id: 399
  r2_399 = string.lower(r2_399)
  if r2_399 == "cn" then
    DebugPrint("Current I18Time: " .. GDate(r1_399, nil, CommonConst.SystemLanguages.CN))
  elseif r2_399 == "en" then
    DebugPrint("Current I18Time: " .. GDate(r1_399, nil, CommonConst.SystemLanguages.EN))
  elseif r2_399 == "jp" then
    DebugPrint("Current I18Time: " .. GDate(r1_399, nil, CommonConst.SystemLanguages.JP))
  elseif r2_399 == "kr" then
    DebugPrint("Current I18Time: " .. GDate(r1_399, nil, CommonConst.SystemLanguages.KR))
  else
    DebugPrint("Current I18Time: " .. GDate(r1_399, nil, CommonConst.SystemLanguages.CN))
  end
end
function r0_0.PrintGuideBook(r0_400)
  -- line: [5220, 5228] id: 400
  local r1_400 = GWorld:GetAvatar()
  if r1_400 and r1_400.GuideBook then
    for r6_400, r7_400 in pairs(r1_400.GuideBook) do
      local r8_400 = r7_400.Reward
      if r8_400 == 1 then
        r8_400 = "未领取" and "已领取"
      else
        goto label_18	-- block#5 is visited secondly
      end
      DebugPrint("教学条目Id:", r6_400, "状态:", r8_400)
    end
    -- close: r2_400
  end
end
function r0_0.GuideBookGetReward(r0_401, r1_401)
  -- line: [5230, 5235] id: 401
  local r2_401 = GWorld:GetAvatar()
  if r2_401 then
    r2_401:GuideBookGetReward(tonumber(r1_401))
  end
end
function r0_0.TestWarningToast(r0_402, r1_402, r2_402)
  -- line: [5237, 5241] id: 402
  r0_402:GetGameInstance():GetGameUIManager():ShowUITip(UIConst.Tip_CommonWarning, r1_402, tonumber(r2_402))
end
function r0_0.PlayLightHit(r0_403, r1_403, r2_403)
  -- line: [5243, 5262] id: 403
  for r8_403, r9_403 in pairs(UE4.UGameplayStatics.GetGameState(r0_403.Player).MonsterMap) do
    if r9_403:GetCamp() == ECampName.Monster then
      local r10_403 = UE4.FHitParams()
      r10_403.CauseHitName = r2_403 and "LightHit_120"
      r10_403.CauseHitType = Const.CauseHitTypeNormal
      r9_403:SetCharacterTag("LightHit")
      r9_403:ProcessHit("LightHit", r0_403.Player, r10_403)
    end
  end
  -- close: r4_403
  if tonumber(r1_403) == 1 then
    local r4_403 = UE4.FHitParams()
    r4_403.CauseHitName = r2_403 and "LightHit_120"
    r4_403.CauseHitType = Const.CauseHitTypeNormal
    r0_403.Player:SetCharacterTag("LightHit")
    r0_403.Player:ProcessHit("LightHit", r0_403.Player, r4_403)
  end
end
function r0_0.PlayLightHitRanged(r0_404, r1_404, r2_404)
  -- line: [5264, 5283] id: 404
  for r8_404, r9_404 in pairs(UE4.UGameplayStatics.GetGameState(r0_404.Player).MonsterMap) do
    if r9_404:GetCamp() == ECampName.Monster then
      local r10_404 = UE4.FHitParams()
      r10_404.CauseHitName = r2_404 and "RangedWeapon_Common"
      r10_404.CauseHitType = Const.CauseHitTypeNormal
      r9_404:SetCharacterTag("LightHitRanged")
      r9_404:ProcessHit("LightHitRanged", r0_404.Player, r10_404)
    end
  end
  -- close: r4_404
  if tonumber(r1_404) == 1 then
    local r4_404 = UE4.FHitParams()
    r4_404.CauseHitName = r2_404 and "RangedWeapon_Common"
    r4_404.CauseHitType = Const.CauseHitTypeNormal
    r0_404.Player:SetCharacterTag("LightHitRanged")
    r0_404.Player:ProcessHit("LightHitRanged", r0_404.Player, r4_404)
  end
end
function r0_0.PlayHeavyHit(r0_405, r1_405, r2_405)
  -- line: [5285, 5304] id: 405
  for r8_405, r9_405 in pairs(UE4.UGameplayStatics.GetGameState(r0_405.Player).MonsterMap) do
    if r9_405:GetCamp() == ECampName.Monster then
      local r10_405 = UE4.FHitParams()
      r10_405.CauseHitName = r2_405 and "HeavyHit_30"
      r10_405.CauseHitType = Const.CauseHitTypeNormal
      r9_405:SetCharacterTag("HeavyHit")
      r9_405:ProcessHit("HeavyHit", r0_405.Player, r10_405)
    end
  end
  -- close: r4_405
  if tonumber(r1_405) == 1 then
    local r4_405 = UE4.FHitParams()
    r4_405.CauseHitName = r2_405 and "HeavyHit_30"
    r4_405.CauseHitType = Const.CauseHitTypeNormal
    r0_405.Player:SetCharacterTag("HeavyHit")
    r0_405.Player:ProcessHit("HeavyHit", r0_405.Player, r4_405)
  end
end
function r0_0.PlayHitFly(r0_406, r1_406, r2_406)
  -- line: [5306, 5323] id: 406
  for r8_406, r9_406 in pairs(UE4.UGameplayStatics.GetGameState(r0_406.Player).MonsterMap) do
    local r10_406 = UE4.FHitParams()
    r10_406.CauseHitName = r2_406 and "HitFly_XY500Z1000"
    r10_406.CauseHitType = Const.CauseHitTypeNormal
    r9_406:SetCharacterTag("HitFly")
    r9_406:ProcessHitFly(r0_406.Player, r10_406)
  end
  -- close: r4_406
  if tonumber(r1_406) == 1 then
    local r4_406 = UE4.FHitParams()
    r4_406.CauseHitName = r2_406 and "HitFly_XY400Z300"
    r4_406.CauseHitType = Const.CauseHitTypeNormal
    r0_406.Player:SetCharacterTag("HitFly")
    r0_406.Player:ProcessHitFly(r0_406.Player, r4_406)
  end
end
function r0_0.PlayHitFly_Force(r0_407, r1_407)
  -- line: [5325, 5336] id: 407
  for r7_407, r8_407 in pairs(UE4.UGameplayStatics.GetGameState(r0_407.Player).MonsterMap) do
    if r8_407:GetCamp() == ECampName.Monster then
      local r9_407 = UE4.FHitParams()
      r9_407.CauseHitName = r1_407 and "HitFly_Force_Common"
      r9_407.CauseHitType = Const.CauseHitTypeNormal
      r8_407:SetCharacterTag("HitFly")
      r8_407:ProcessHitFly(r0_407.Player, r9_407)
    end
  end
  -- close: r3_407
end
function r0_0.EnterRougeLike(r0_408, r1_408, r2_408, r3_408)
  -- line: [5338, 5345] id: 408
  print(_G.LogTag, "EnterRougeLike", r1_408, r2_408, r3_408)
  if not r1_408 then
    r1_408 = ""
  end
  if not r2_408 then
    r2_408 = ""
  end
  if not r3_408 then
    r3_408 = ""
  end
  require("BluePrints.UI.GMInterface.GMFunctionLibrary").ExecConsoleCommand(r0_408:GetGameInstance(), "sgm EnterRougeLike " .. r1_408 .. " " .. r2_408 .. " " .. r3_408)
end
function r0_0.UpgradeAward(r0_409, r1_409, r2_409)
  -- line: [5347, 5352] id: 409
  local r3_409 = GWorld:GetAvatar()
  if r3_409 then
    r3_409:UpgradeAward(r1_409, r2_409)
  end
end
function r0_0.StartAutoTest(r0_410)
  -- line: [5354, 5371] id: 410
  local r2_410 = UE4.UGameplayStatics.GetGameMode(r0_410.Player)
  local r3_410 = r0_410.Player:K2_GetActorLocation()
  local r5_410 = UE4.UGameplayStatics.GetPlayerController(r0_410.Player, 0):GetAvatarInfo()
  local r6_410 = AEventMgr.CreateUnitContext()
  r6_410.UnitId = 1
  r6_410.IntParams:Add("RoleId", r0_410.Player.CurrentRoleId)
  r6_410.UnitType = "Phantom"
  r6_410.Loc = r3_410
  r6_410.NameParams:Add("Camp", "Player")
  r6_410.BoolParams:Add("FixLocation", true)
  r6_410:AddLuaTable("AvatarInfo", r5_410)
  r2_410.EMGameState.EventMgr:CreateUnitNew(r6_410, false)
end
function r0_0.AutoBattleTestServer(r0_411, r1_411)
  -- line: [5373, 5378] id: 411
  local r2_411 = GWorld:GetAvatar()
  if r2_411 then
    r2_411:CallServerMethod("GMTestAutoBattle", r1_411)
  end
end
function r0_0.AutoBattleTestClient(r0_412, r1_412)
  -- line: [5380, 5385] id: 412
  local r2_412 = GWorld:GetAvatar()
  if r2_412 then
    r2_412:CallServerMethod("GMTestAutoBattle", r1_412, true)
  end
end
function r0_0.StopAutoBattleTest(r0_413, r1_413)
  -- line: [5387, 5396] id: 413
  local r2_413 = false
  if r1_413 then
    r2_413 = true
  end
  local r3_413 = GWorld:GetAvatar()
  if r3_413 then
    r3_413:CallServerMethod("GMStopAutoBattleTest", r2_413)
  end
end
function r0_0.StartVote(r0_414)
  -- line: [5398, 5408] id: 414
  if IsStandAlone(r0_414:GetGameInstance()) then
    UE4.UGameplayStatics.GetGameMode(r0_414.Player):TriggerActiveGameModeState(5)
  else
    r0_414:DedicatedServerCommand("StartVote")
  end
end
function r0_0.SpawnPet(r0_415)
  -- line: [5410, 5417] id: 415
  if IsStandAlone(r0_415:GetGameInstance()) then
    UE4.UGameplayStatics.GetGameMode(r0_415.Player):TriggerSpawnPet()
  else
    r0_415:DedicatedServerCommand("SpawnPet")
  end
end
function r0_0.PostCustomEvent(r0_416, r1_416)
  -- line: [5419, 5429] id: 416
  DebugPrint("GM PostCustomEvent", r1_416)
  if IsStandAlone(r0_416:GetGameInstance()) then
    UE4.UGameplayStatics.GetGameMode(r0_416.Player):PostCustomEvent(r1_416)
  else
    r0_416:DedicatedServerCommand("PostCustomEvent", r1_416)
  end
end
function r0_0.SetFeinaStar(r0_417, r1_417)
  -- line: [5431, 5436] id: 417
  UE4.UGameplayStatics.GetGameMode(r0_417.Player):TriggerDungeonComponentFun("SetStar", tonumber(r1_417))
end
function r0_0.EnterAbyss(r0_418, r1_418, r2_418)
  -- line: [5438, 5451] id: 418
  local r3_418 = tonumber(r1_418)
  local r4_418 = DataMgr.AbyssDungeon[r3_418].DungeonId
  local r5_418 = tonumber(r2_418)
  GWorld.GameInstance.TempAbyssInfo = {
    AbyssDungeonId = r3_418,
    AbyssDifficulty = r5_418,
  }
  DebugPrint("GM_EnterAbyss AbyssDungeonId", r3_418, "DungeonId", r4_418, "AbyssDifficulty", r5_418)
  r0_418:EnterDungeon(r4_418)
end
function r0_0.EnterAbyssNew(r0_419, r1_419, r2_419, r3_419)
  -- line: [5453, 5468] id: 419
  local function r4_419(r0_420)
    -- line: [5457, 5463] id: 420
    if not ErrorCode:Check(r0_420) then
      return 
    end
    DebugPrint("GM_EnterAbyssNew Success AbyssId", r1_419, "AbyssLevelId", r2_419, "AbyssDungeonIndex", r3_419)
  end
  local r5_419 = r0_419:GetClientAvatar()
  if r5_419 then
    r5_419:TriggerEnterAbyss(r4_419, tonumber(r1_419), tonumber(r2_419), tonumber(r3_419))
  end
end
function r0_0.PrintAllDailyTask(r0_421)
  -- line: [5470, 5478] id: 421
  local r1_421 = GWorld:GetAvatar()
  if not r1_421 then
    return 
  end
  r1_421:UpdateStoryVariable("PhotoTalk110105", 1)
end
function r0_0.AbyssPassRoom(r0_422)
  -- line: [5480, 5499] id: 422
  local r1_422 = UE4.UGameplayStatics.GetGameMode(r0_422.Player)
  for r6_422, r7_422 in pairs(r1_422.MonsterSpawnMap) do
    r7_422:ClearMonsterSpawnInfo()
    if IsValid(r1_422.MonsterSpawnMap:Find(r7_422.UnitSpawnId)) then
      r1_422.MonsterSpawnMap:Remove(r7_422.UnitSpawnId)
    end
    r7_422:K2_DestroyActor()
  end
  -- close: r2_422
  r0_422:ServerBattleCommand("KillMonster", r0_422.Player.Eid)
  for r6_422, r7_422 in pairs(r1_422.SubGameModeInfo) do
    r7_422:BpDelTimer("AbyssBattle", false, Const.GameModeEventServerClient)
    r7_422:AbyssRoomEnd(EAbyssRoomEndReason.MissionClear)
    r7_422:TeleportToNextRoom()
    return 
  end
  -- close: r2_422
end
function r0_0.ReduceBuffLayer(r0_423, r1_423, r2_423)
  -- line: [5501, 5505] id: 423
  local r4_423 = UE4.UGameplayStatics.GetPlayerCharacter(r0_423:GetGameInstance(), 0)
  r4_423:ReduceBuffLayer(r4_423, tonumber(r1_423), tonumber(r2_423))
end
function r0_0.ChangeBuffLastTime(r0_424, r1_424, r2_424, r3_424)
  -- line: [5507, 5511] id: 424
  UE4.UGameplayStatics.GetPlayerCharacter(r0_424:GetGameInstance(), 0):ChangeBuffLastTime(tonumber(r1_424), 0, tonumber(r2_424), r3_424)
end
function r0_0.TestTrackingQuest(r0_425, r1_425)
  -- line: [5513, 5519] id: 425
  local r2_425 = tonumber(r1_425)
  local r3_425 = GWorld:GetAvatar()
  if r3_425 and r2_425 then
    r3_425:SetQuestTracking(r2_425)
  end
end
function r0_0.SetBGMOpenDebug(r0_426, r1_426)
  -- line: [5521, 5527] id: 426
  if r1_426 == "true" then
    AudioManager(r0_426.Player):SetBGMDebugValue(true)
  elseif r1_426 == "false" then
    AudioManager(r0_426.Player):SetBGMDebugValue(false)
  end
end
function r0_0.PrintBGMInfo(r0_427)
  -- line: [5529, 5531] id: 427
  AudioManager(r0_427.Player):PrintBGMInfo()
end
function r0_0.GetAllBusVolume(r0_428)
  -- line: [5533, 5535] id: 428
  AudioManager(r0_428.Player):GetAllBusVolume()
end
function r0_0.GetAllBusPauseState(r0_429)
  -- line: [5537, 5539] id: 429
  AudioManager(r0_429.Player):GetAllBusPauseState()
end
function r0_0.ReloadAllBank(r0_430)
  -- line: [5541, 5543] id: 430
  UE4.UFMODBlueprintStatics.ReloadAllBank()
end
function r0_0.TriggerLoadedEvent(r0_431)
  -- line: [5545, 5554] id: 431
  DebugPrint("TriggerLoadedEvent")
  local r1_431 = UE4.UGameplayStatics.GetGameMode(r0_431:GetGameInstance())
  if r1_431 then
    r1_431:TriggerLoadedEvent()
    return 
  end
end
function r0_0.SetDrawDebugEnabled(r0_432, r1_432)
  -- line: [5556, 5563] id: 432
  if r1_432 == "true" then
    AudioManager(r0_432.Player).DrawDebug = true
  elseif r1_432 == "false" then
    AudioManager(r0_432.Player).DrawDebug = false
  end
end
function r0_0.SetSoundPointCompDebugEnabled(r0_433, r1_433)
  -- line: [5565, 5574] id: 433
  if not r0_433.Player.SoundPointManagerComp then
    return 
  end
  if r1_433 == "true" then
    r0_433.Player.SoundPointManagerComp.EnableDebug = true
  elseif r1_433 == "false" then
    r0_433.Player.SoundPointManagerComp.EnableDebug = false
  end
end
function r0_0.SetSoundSplineDrawDebug(r0_434, r1_434)
  -- line: [5576, 5587] id: 434
  local r2_434 = nil
  if r1_434 == "true" then
    r2_434 = true
  elseif r1_434 == "false" then
    r2_434 = false
  end
  for r8_434, r9_434 in pairs(UGameplayStatics.GetAllActorsOfClass(r0_434.Player, ASoundSpline:StaticClass()):ToTable()) do
    r9_434.SplineDrawDebug = r2_434
  end
  -- close: r4_434
end
function r0_0.SetReverLogicOpenbDebug(r0_435, r1_435)
  -- line: [5589, 5597] id: 435
  if r1_435 == "true" then
    AudioManager(r0_435.Player).ReverbLogicDebug = true
  elseif r1_435 == "false" then
    AudioManager(r0_435.Player).ReverbLogicDebug = false
  end
end
function r0_0.PrintHeadPhonePlugIn(r0_436)
  -- line: [5599, 5601] id: 436
  AudioManager(r0_436.Player):DebugPrintHeadPhonePlugInParam()
end
function r0_0.SetAudioManagerTestRegionId(r0_437, r1_437)
  -- line: [5603, 5605] id: 437
  AudioManager(r0_437.Player).TestRegionId = tonumber(r1_437)
end
function r0_0.SimulateBGMEnterNewRegion(r0_438, r1_438)
  -- line: [5607, 5610] id: 438
  AudioManager(r0_438.Player).TestRegionId = tonumber(r1_438)
  AudioManager(r0_438.Player):CheckLevelSoundAndRegionId(tonumber(r1_438))
end
function r0_0.SetLineSoundDebug(r0_439, r1_439)
  -- line: [5612, 5618] id: 439
  if r1_439 == "true" then
    AudioManager(r0_439.Player).LineSound_DrawDebug = true
  elseif r1_439 == "false" then
    AudioManager(r0_439.Player).LineSound_DrawDebug = false
  end
end
function r0_0.SectorSoundDebug(r0_440, r1_440)
  -- line: [5620, 5626] id: 440
  if r1_440 == "true" then
    AudioManager(r0_440.Player).SectorSound_DrawDebug = true
  elseif r1_440 == "false" then
    AudioManager(r0_440.Player).SectorSound_DrawDebug = false
  end
end
function r0_0.CircularSoundDebug(r0_441, r1_441)
  -- line: [5628, 5634] id: 441
  if r1_441 == "true" then
    AudioManager(r0_441.Player).Circular_DrawDebug = true
  elseif r1_441 == "false" then
    AudioManager(r0_441.Player).Circular_DrawDebug = false
  end
end
function r0_0.PrintEventsMap(r0_442)
  -- line: [5636, 5638] id: 442
  AudioManager(r0_442.Player):PrintEventsMap()
end
function r0_0.PrintAUAForbidTag(r0_443)
  -- line: [5640, 5642] id: 443
  AudioManager(r0_443.Player):PrintAuANotifyForbidTag()
end
function r0_0.PrintCurAuActionCount(r0_444)
  -- line: [5644, 5646] id: 444
  AudioManager(r0_444.Player):PrintCurAuActionCount()
end
function r0_0.RogueShopTest(r0_445)
  -- line: [5649, 5665] id: 445
  local r1_445 = r0_445:GetGameInstance():GetGameUIManager()
  if not GWorld:GetAvatar() then
    return 
  end
  local r3_445 = GWorld.RougeLikeManager
  if not r3_445 then
    return 
  end
  local r4_445 = r3_445.Shop:Keys()
  local r5_445 = nil
  if r4_445:Length() > 0 then
    r5_445 = r4_445[1]
  end
  r1_445:LoadUINew("RougeShop", r5_445)
end
function r0_0.RougeDetailsTest(r0_446)
  -- line: [5667, 5670] id: 446
  r0_446:GetGameInstance():GetGameUIManager():LoadUINew("RougeBag")
end
function r0_0.ShowRougeManual(r0_447)
  -- line: [5672, 5677] id: 447
  local r1_447 = GWorld:GetAvatar()
  if r1_447 then
    PrintTable(r1_447.RougeLike.Manual, 5)
  end
end
function r0_0.DisableBattleWheel(r0_448)
  -- line: [5679, 5686] id: 448
  local r1_448 = UE4.UGameplayStatics.GetPlayerController(r0_448:GetGameInstance(), 0)
  DebugPrint("gmy@GM_Command:DisableBattleWheel", r1_448.bEnableBattleWheel)
  r1_448.bEnableBattleWheel = false
  if r0_448.Player then
    r0_448.Player:RefreshBattleWheelEnableState()
  end
end
function r0_0.EnableBattleWheel(r0_449)
  -- line: [5688, 5695] id: 449
  local r1_449 = UE4.UGameplayStatics.GetPlayerController(r0_449:GetGameInstance(), 0)
  DebugPrint("gmy@GM_Command:EnableBattleWheel", r1_449.bEnableBattleWheel)
  r1_449.bEnableBattleWheel = true
  if r0_449.Player then
    r0_449.Player:RefreshBattleWheelEnableState()
  end
end
function r0_0.FillBattleWheel(r0_450)
  -- line: [5697, 5703] id: 450
  local r1_450 = GWorld:GetAvatar()
  for r7_450, r8_450 in ipairs({
    40001,
    40002,
    40003,
    40011,
    40012,
    40013,
    41001,
    41002,
    41003,
    41004,
    41005,
    41006,
    41007,
    41008,
    41009,
    41010,
    41011,
    41012,
    41013,
    41014
  }) do
    r1_450:ChangeBattleWheel(1, r7_450, r8_450)
  end
  -- close: r3_450
end
function r0_0.PrintBattleWheel(r0_451)
  -- line: [5705, 5712] id: 451
  local r2_451 = GWorld:GetAvatar().Wheels
  for r6_451 = 1, 24, 1 do
    DebugPrint("gmy@GM_Command GM_Command:PrintBattleWheel", r6_451, r2_451[1][r6_451].ResourceId)
  end
end
function r0_0.AddPet(r0_452, r1_452)
  -- line: [5714, 5716] id: 452
  r0_452:ServerBattleCommand("AddPet", r1_452)
end
function r0_0.AddPetAffix(r0_453, r1_453)
  -- line: [5718, 5720] id: 453
  r0_453:ServerBattleCommand("AddPetAffix", r1_453)
end
function r0_0.RemovePet(r0_454)
  -- line: [5722, 5724] id: 454
  r0_454:ServerBattleCommand("RemovePet")
end
function r0_0.RemovePetAffix(r0_455, r1_455)
  -- line: [5726, 5728] id: 455
  r0_455:ServerBattleCommand("RemovePetAffix", r1_455)
end
function r0_0.PrintTeammates(r0_456)
  -- line: [5730, 5735] id: 456
  for r6_456, r7_456 in pairs(r0_456.Player:GetAllTeammates()) do
    DebugPrint("gmy@GM_Command:PrintTeammates", r6_456, r7_456:GetName())
  end
  -- close: r2_456
end
function r0_0.PrintPlayers(r0_457)
  -- line: [5737, 5744] id: 457
  for r7_457, r8_457 in pairs(UE4.UGameplayStatics.GetGameState(r0_457.Player):GetAllPlayer()) do
    DebugPrint("gmy@GM_Command:PrintPlayers", r7_457, r8_457:GetName())
  end
  -- close: r3_457
end
function r0_0.ShowCountdownToast(r0_458, r1_458, r2_458)
  -- line: [5746, 5755] id: 458
  r1_458 = tonumber(r1_458)
  r2_458 = tonumber(r2_458)
  local r4_458 = r0_458:GetGameInstance():GetGameUIManager()
  if r4_458 then
    r4_458:LoadUINew("DungeonCaptureFloat", r1_458, r2_458):UIStateChange_OnTarget()
  end
end
function r0_0.AddCountdownTime(r0_459, r1_459)
  -- line: [5757, 5765] id: 459
  r1_459 = tonumber(r1_459)
  local r3_459 = r0_459:GetGameInstance():GetGameUIManager()
  if r3_459 then
    r3_459:GetUIObj("DungeonCaptureFloat"):AddRemainingTime(r1_459)
  end
end
function r0_0.ForceUseSkill(r0_460, r1_460, r2_460)
  -- line: [5767, 5774] id: 460
  if DrawDebugTest then
    r0_460.Player:ServerUseSkillTest(tonumber(r1_460), tonumber(r2_460))
  end
end
function r0_0.UnlockMonsterGallery(r0_461)
  -- line: [5776, 5784] id: 461
  local r1_461 = GWorld:GetAvatar()
  for r6_461, r7_461 in pairs(DataMgr.GalleryRule) do
    if not r7_461.DisableTrainingGround then
      r1_461:CheckFirstMonster(r7_461.PreferredMonsterId, false)
    end
  end
  -- close: r2_461
end
function r0_0.ShowHudReward(r0_462, r1_462, r2_462, r3_462)
  -- line: [5786, 5851] id: 462
  local r4_462 = {}
  r2_462 = tonumber(r2_462)
  if r1_462 == "Quest" then
    if DataMgr.QuestChain[r2_462] == nil or DataMgr.QuestChain[r2_462].QuestChainReward == nil then
      DebugPrint("QuestChainId is error or QuestChainReward is nil")
      return 
    end
    for r10_462, r11_462 in pairs(DataMgr.QuestChain[r2_462].QuestChainReward) do
      local r12_462 = DataMgr.Reward[r11_462]
      if r12_462 then
        local r13_462 = r12_462.Id and {}
        local r14_462 = r12_462.Count and {}
        local r15_462 = r12_462.Type and {}
        for r19_462 = 1, #r13_462, 1 do
          local r20_462 = r13_462[r19_462]
          table.insert(r4_462, {
            ItemType = r15_462[r19_462],
            ItemId = r20_462,
            Count = RewardUtils:GetCount(r14_462[r19_462]),
            Rarity = ItemUtils.GetItemRarity(r20_462, r15_462[r19_462]),
          })
        end
      end
    end
    -- close: r6_462
  elseif r1_462 == "Reward" then
    local r5_462 = DataMgr.Reward[r2_462]
    local r6_462 = {}
    if r5_462 then
      local r7_462 = r5_462.Id and {}
      local r8_462 = r5_462.Count and {}
      local r9_462 = r5_462.Type and {}
      for r13_462 = 1, #r7_462, 1 do
        local r14_462 = r7_462[r13_462]
        table.insert(r4_462, {
          ItemType = r9_462[r13_462],
          ItemId = r14_462,
          Count = RewardUtils:GetCount(r8_462[r13_462]),
          Rarity = ItemUtils.GetItemRarity(r14_462, r9_462[r13_462]),
        })
      end
    end
  else
    table.insert(r4_462, {
      ItemType = r1_462,
      ItemId = r2_462,
      Count = r3_462,
      Rarity = ItemUtils.GetItemRarity(r2_462, r1_462),
    })
  end
  table.sort(r4_462, function(r0_463, r1_463)
    -- line: [5846, 5848] id: 463
    return r1_463.Rarity < r0_463.Rarity
  end)
  UIUtils.ShowHudReward("测试", r4_462)
end
function r0_0.FXPriorityTest(r0_464)
  -- line: [5853, 5878] id: 464
  local r2_464 = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_RunAttack01_dg_Pro.NS_Huipo_RunAttack01_dg_Pro"
  local r3_464 = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_RunAttack01_dg_Pro.NS_Huipo_RunAttack01_dg_Pro"
  r0_464.Player.FXComponent:PlayFX(LoadObject("/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_RunAttack01_dg_Pro.NS_Huipo_RunAttack01_dg_Pro"), r0_464.Player.Mesh, nil, r0_464.Player:K2_GetActorLocation(), FRotator(0, 0, 0), true, false, false, false, EAttachLocation.KeepWorldPosition, EFXPriorityType.Lowest)
  r0_464.Player:AddTimer(0.1, function()
    -- line: [5863, 5866] id: 465
    r0_464.Player.FXComponent:PlayFX(LoadObject(r2_464), r0_464.Player.Mesh, nil, r0_464.Player:K2_GetActorLocation() + FVector(0, 300, 0), FRotator(0, 0, 0), true, false, false, false, EAttachLocation.KeepWorldPosition, EFXPriorityType.Dead)
  end, false, 0, "FXTest1", false)
  r0_464.Player:AddTimer(0.2, function()
    -- line: [5868, 5871] id: 466
    r0_464.Player.FXComponent:PlayFX(LoadObject(r3_464), r0_464.Player.Mesh, nil, r0_464.Player:K2_GetActorLocation() + FVector(0, 500, 0), FRotator(0, 0, 0), true, false, false, false, EAttachLocation.KeepWorldPosition, EFXPriorityType.Born)
  end, false, 0, "FXTest2", false)
end
local r2_0 = {
  "Baiheng",
  "Feina",
  "Haier",
  "Heitao",
  "Landi",
  "Linen",
  "Maer",
  "Nvzhu",
  "Saiqi",
  "Shuimu",
  "Songlu",
  "Xibi",
  "Xier",
  "Yeer",
  "Yuming",
  "Zhangyu"
}
local r3_0 = {}
function r0_0.FXPriorityTest_Char(r0_467, r1_467)
  -- line: [5901, 5940] id: 467
  local r2_467 = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(r0_467.Player, UFXPreloadGameInstanceSubsystem)
  local r3_467 = r0_467.Player:K2_GetActorLocation()
  local r4_467 = FVector(100, 0, 0)
  local r5_467 = 0
  local r6_467 = FVector(0, 100, 0)
  local r7_467 = 0
  local function r8_467(r0_468)
    -- line: [5909, 5930] id: 468
    if not r0_468 then
      return 
    end
    r2_467:PreloadCharacterFX(r0_468)
    for r6_468, r7_468 in pairs(r2_467.CharacterNiagaraSystems:ToArray()) do
      table.insert(r3_0, r0_467.Player.FXComponent:PlayFX(r7_468, r0_467.Player.Mesh, nil, r3_467, FRotator(0, 0, 0), true, false, false, false, EAttachLocation.KeepWorldPosition, EFXPriorityType.Lowest))
      r5_467 = r5_467 + 1
    end
    -- close: r2_468
    r7_467 = r7_467 + 1
  end
  if r1_467 and tonumber(r1_467) > 0 then
    r8_467(r2_0[tonumber(r1_467)])
  else
    for r13_467, r14_467 in pairs(r2_0) do
      r8_467(r14_467)
    end
    -- close: r9_467
  end
end
function r0_0.ClearFXTest(r0_469)
  -- line: [5942, 5950] id: 469
  for r5_469, r6_469 in pairs(r3_0) do
    if IsValid(r6_469) then
      UE4.UCharacterFunctionLibrary.DeactivateNiagaraImmediately(r6_469)
    end
  end
  -- close: r1_469
  r3_0 = {}
  r0_469:ManualGC()
end
function r0_0.PrintAllFXPath(r0_470)
  -- line: [5952, 5959] id: 470
  local r3_470, r4_470 = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(r0_470.Player, UE4.URolePreloadGameInstanceSubsystem).GetFolderAssetPaths("Asset/Effect/Niagara/")
  for r9_470, r10_470 in ipairs(r4_470:ToTable()) do
    print(_G.LogTag, r10_470)
  end
  -- close: r5_470
end
function r0_0.LevelFXTest(r0_471, r1_471)
  -- line: [5961, 5969] id: 471
  r0_471.Player.FXComponent:SpawnFXAtLocation_Level(r1_471, "Test", true, r0_471.Player:K2_GetActorLocation())
  r0_471.Player.FXComponent:SpawnFXAtLocation_Level(r1_471, "Test", true, r0_471.Player:K2_GetActorLocation())
  local function r2_471(r0_472)
    -- line: [5964, 5966] id: 472
    print(_G.LogTag, "------------", r0_472)
  end
end
function r0_0.FXPriorityTest_One(r0_473, r1_473, r2_473)
  -- line: [5971, 5990] id: 473
  if not r1_473 then
    return 
  end
  for r7_473, r8_473 in pairs(r3_0) do
    if IsValid(r8_473) then
      UE4.UCharacterFunctionLibrary.DeactivateNiagaraImmediately(r8_473)
    end
  end
  -- close: r3_473
  r3_0 = {}
  local r3_473 = LoadObject(r1_473)
  if not r2_473 then
    r2_473 = 30
  end
  for r7_473 = 1, r2_473, 1 do
    table.insert(r3_0, r0_473.Player.FXComponent:PlayFX(r3_473, r0_473.Player.Mesh, nil, r0_473.Player:K2_GetActorLocation(), FRotator(0, 0, 0), true, false, false, false, EAttachLocation.KeepWorldPosition, EFXPriorityType.Lowest))
  end
end
function r0_0.CharacterTag(r0_474)
  -- line: [5992, 5994] id: 474
  DebugPrint("Tianyi@ CurrentTag: " .. r0_474.Player:GetCharacterTag())
end
function r0_0.CalcAttrOpt(r0_475, r1_475)
  -- line: [5996, 6005] id: 475
  local r2_475 = tonumber(r1_475)
  if not r2_475 then
    return 
  end
  local r3_475 = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UAttributesSetSubsystem:StaticClass())
  if r2_475 == 0 then
    r3_475:SwitchCalcAttrOptimization(false)
  elseif r2_475 == 1 then
    r3_475:SwitchCalcAttrOptimization(true)
  end
end
function r0_0.IsQuestChainLock(r0_476, r1_476)
  -- line: [6007, 6017] id: 476
  local r2_476 = GWorld:GetAvatar()
  if not r2_476 then
    return 
  end
  if r2_476:IsQuestChainLock(tonumber(r1_476)) then
    DebugPrint("Lock", r1_476)
  else
    DebugPrint("Not Lock", r1_476)
  end
end
function r0_0.IsQuestChainUnlock(r0_477, r1_477)
  -- line: [6019, 6029] id: 477
  local r2_477 = GWorld:GetAvatar()
  if not r2_477 then
    return 
  end
  if r2_477:IsQuestChainUnlock(tonumber(r1_477)) then
    DebugPrint("UnLock", r1_477)
  else
    DebugPrint("Not UnLock", r1_477)
  end
end
function r0_0.MonsterSpawnPointDistributeLogicTest(r0_478)
  -- line: [6031, 6033] id: 478
  AMonsterSpawn.GMTestDistributedMonsterLogic(r0_478.Player)
end
function r0_0.UMGAnimationsTime(r0_479, r1_479)
  -- line: [6035, 6053] id: 479
  local r2_479 = r0_479:GetGameInstance()
  local r3_479 = r2_479:GetGameUIManager()
  UWidgetLayoutLibrary.RemoveAllWidgets(r2_479)
  local r4_479 = r3_479:CreateWidget(r1_479, true)
  if r4_479 == nil then
    ScreenPrint("can not find Widget")
    return 
  end
  for r10_479, r11_479 in pairs(UE4.UUIFunctionLibrary.GetAllAnimationOfUserWidget(r4_479)) do
    DebugPrint("UMGAnimationsTime Widget:", r1_479, "AnimationName: ", r10_479, "Time: ", r11_479:GetEndTime())
  end
  -- close: r6_479
end
function r0_0.EMPlayWidgetAnimation(r0_480, r1_480, r2_480)
  -- line: [6055, 6077] id: 480
  local r3_480 = r0_480:GetGameInstance()
  local r4_480 = r3_480:GetGameUIManager()
  UWidgetLayoutLibrary.RemoveAllWidgets(r3_480)
  local r5_480 = r4_480:CreateWidget(r1_480, true)
  if r5_480 == nil then
    ScreenPrint("can not find Widget")
    return 
  end
  local r7_480 = UE4.UUIFunctionLibrary.GetAllAnimationOfUserWidget(r5_480):Find(r2_480)
  if r7_480 == nil then
    ScreenPrint("can not find Animation")
    return 
  end
  EMUIAnimationSubsystem:EMPlayAnimation(r5_480, r7_480)
end
function r0_0.HideAllUI(r0_481, r1_481)
  -- line: [6079, 6089] id: 481
  local r2_481 = true
  if r1_481 == "0" then
    r2_481 = false
  end
  local r3_481 = r0_481:GetGameInstance()
  r3_481.ImmersionModel = r2_481
  r3_481:GetGameUIManager():HideAllUI(r2_481, "DefaultTag", true)
end
function r0_0.PlayUMGAnimation(r0_482, r1_482, r2_482, r3_482, r4_482)
  -- line: [6091, 6148] id: 482
  local r5_482 = r0_482:GetGameInstance()
  local r6_482 = r5_482:GetGameUIManager()
  UWidgetLayoutLibrary.RemoveAllWidgets(r5_482)
  if r4_482 == nil then
    r4_482 = 1
  end
  for r10_482 = 1, r4_482, 1 do
    local r11_482 = r6_482:CreateWidget(r1_482, true)
    if r11_482 == nil then
      ScreenPrint("can not find Widget")
      return 
    end
    if r2_482 == nil then
      r2_482 = 1
    end
    local r12_482 = UE4.UUIFunctionLibrary.GetAllAnimationOfUserWidget(r11_482)
    local r13_482 = nil	-- notice: implicit variable refs by block#[9, 11]
    if r3_482 == nil then
      r13_482 = nil
      r13_482 = coroutine.create(function()
        -- line: [6114, 6125] id: 483
        for r3_483 = 1, r2_482, 1 do
          for r8_483, r9_483 in pairs(r12_482) do
            DebugPrint("Play Current Animation ", r8_483)
            local r10_483, r11_483 = UWidgetAnimationPlayCallbackProxy.CreatePlayAnimationProxyObject(nil, r11_482, r9_483, 0, 1, 0)
            r11_483.Finished:Add(r0_482, function()
              -- line: [6119, 6121] id: 484
              coroutine.resume(r13_482)
            end)
            coroutine.yield()
          end
          -- close: r4_483
        end
      end)
      coroutine.resume(r13_482)
      -- close: r13_482
    else
      r13_482 = r12_482:Find(r3_482)
      if r13_482 == nil then
        ScreenPrint("can not find Animation")
        return 
      end
      local r14_482 = nil
      r14_482 = coroutine.create(function()
        -- line: [6134, 6143] id: 485
        for r3_485 = 1, r2_482, 1 do
          DebugPrint("Play Animation ", r3_482, " Times: ", r3_485)
          local r4_485, r5_485 = UWidgetAnimationPlayCallbackProxy.CreatePlayAnimationProxyObject(nil, r11_482, r13_482, 0, 1, 0)
          r5_485.Finished:Add(r0_482, function()
            -- line: [6138, 6140] id: 486
            coroutine.resume(r14_482)
          end)
          coroutine.yield()
        end
      end)
      coroutine.resume(r14_482)
      -- close: r13_482
    end
    -- close: r11_482
  end
end
function r0_0.obj(r0_487)
  -- line: [6150, 6152] id: 487
  URuntimeCommonFunctionLibrary.LogMaximumUObject()
end
function r0_0.SwitchSurvivalValueChange(r0_488)
  -- line: [6154, 6172] id: 488
  local r3_488 = nil	-- notice: implicit variable refs by block#[6]
  if IsStandAlone(r0_488:GetGameInstance()) then
    local r2_488 = UE4.UGameplayStatics.GetPlayerCharacter(r0_488:GetGameInstance(), 0)
    r3_488 = UE4.UGameplayStatics.GetGameState(r2_488)
    if not r2_488 then
      return 
    end
    if r2_488.AddSurvivalValueTimer then
      r2_488:RemoveTimer(r2_488.AddSurvivalValueTimer)
      r2_488.AddSurvivalValueTimer = nil
    end
    r2_488.AddSurvivalValueTimer = r2_488:AddTimer(1, function()
      -- line: [6166, 6168] id: 489
      r3_488:SetSurvivalValue(r3_488.SurvivalValue + 100)
    end, true)
    -- close: r1_488
  else
    r3_488 = "SwitchSurvivalValueChange"
    r0_488:DedicatedServerCommand(r3_488)
  end
end
function r0_0.CreateMonstersBatches(r0_490, r1_490, r2_490, r3_490)
  -- line: [6174, 6182] id: 490
  local r4_490 = {}
  for r9_490 in string.gmatch(r1_490, "([^,]+)") do
    table.insert(r4_490, r9_490)
  end
  -- close: r5_490
  for r9_490, r10_490 in pairs(r4_490) do
    r0_490:ServerBattleCommand("CreateMonster", r0_490.Player.Eid, r10_490, r2_490, r3_490, "StaticCreator")
  end
  -- close: r5_490
end
function r0_0.CutToughnessValue(r0_491, r1_491)
  -- line: [6184, 6193] id: 491
  if r1_491 then
    r1_491 = tonumber(r1_491) and 1000000
  else
    goto label_7	-- block#2 is visited secondly
  end
  r0_491:ServerBattleCommand("CutToughnessValue", r0_491.Player.Eid, r1_491)
  local r2_491 = Battle(r0_491.Player)
  if r2_491 then
    r2_491:SetGMCuttoughnessValue(r1_491)
  end
end
function r0_0.PrintCurrentTaskGuideInfo(r0_492)
  -- line: [6195, 6247] id: 492
  DebugPrint("PrintCurrentTaskGuideInfo start===")
  local r1_492 = UIManager(r0_492:GetGameInstance())
  local r2_492 = UE4.UGameplayStatics.GetPlayerCharacter(r0_492:GetGameInstance(), 0)
  local r3_492 = GWorld:GetAvatar()
  if not r3_492 then
    return 
  end
  local r4_492 = require("BluePrints.UI.TaskPanel/QuestGuidePointLocData")
  local r5_492 = nil
  DebugPrint("PlayerRegionId:", r3_492.CurrentRegionId)
  DebugPrint("PlayerLoc:", r2_492:k2_GetActorLocation())
  local r6_492 = MissionIndicatorManager:GetAllIndicatorUIObjs()
  if not IsEmptyTable(r6_492) then
    local r7_492 = 1
    for r12_492, r13_492 in pairs(r6_492) do
      DebugPrint("========================")
      local r14_492 = "折叠"
      if r13_492.Visibility ~= UE4.ESlateVisibility.Collapsed and r13_492.Guide_Node.Visibility == UE4.ESlateVisibility.SelfHitTestInvisible then
        r14_492 = "显示"
      end
      local r15_492 = 0
      if r13_492.GuideInfoCache and r13_492.GuideInfoCache.QuestNode and r13_492.GuideInfoCache.QuestNode.QuestId then
        r15_492 = r13_492.GuideInfoCache.QuestNode.QuestId
      end
      DebugPrint("Indicator[" .. r7_492 .. "]：" .. r14_492)
      DebugPrint("WidgetName:", r12_492)
      DebugPrint("STLIndicatorType:", r13_492.STLIndicatorType)
      if r13_492.GuideInfoCache then
        DebugPrint("QuestChainId:", r13_492.CurGuideChainId, " STLNode:", r15_492)
        DebugPrint("PointType", r13_492.GuideInfoCache.PointType, "TargetPointName:", r13_492.GuideInfoCache.PointName, "MapPointName:", r13_492.GuideInfoCache.PointOrStaticCreatorName)
        DebugPrint("Location:", r13_492.TargetPointPos)
        DebugPrint("TaskRegionId:", r13_492.TaskRegionId)
        if r4_492[r13_492.GuideInfoCache.PointOrStaticCreatorName] then
          local r16_492 = r4_492[r13_492.GuideInfoCache.PointOrStaticCreatorName]
          DebugPrint("GuidePointLocData: X:", r16_492.X, ",Y:", r16_492.Y, ",Z:", r16_492.Z, ",R:", r16_492.R, ",SubRegionId:", r16_492.SubRegionId)
        else
          DebugPrint("GuidePointLocData is nil")
        end
      end
      DebugPrint("========================")
      r7_492 = r7_492 + 1
    end
    -- close: r8_492
  end
  DebugPrint("PrintCurrentTaskGuideInfo end===")
end
function r0_0.SetTaskGuidePointDebugMode(r0_493, r1_493)
  -- line: [6249, 6261] id: 493
  local r2_493 = UIManager(GWorld.GameInstance)
  local r3_493 = MissionIndicatorManager:GetAllIndicatorUIObjs()
  if not IsEmptyTable(r3_493) then
    for r8_493, r9_493 in pairs(r3_493) do
      if tonumber(r1_493) == 1 then
        r9_493.IsDebugMode = true
      else
        r9_493.IsDebugMode = false
      end
    end
    -- close: r4_493
  end
end
function r0_0.PrintAllAssetPath(r0_494, r1_494, r2_494)
  -- line: [6263, 6294] id: 494
  local r3_494 = tonumber(r1_494)
  local r4_494 = tonumber(r2_494)
  local r5_494 = 0
  local r6_494 = 0
  local r7_494 = 0
  local r8_494 = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(r0_494.Player, UE4.URolePreloadGameInstanceSubsystem)
  DebugPrint("Montage:")
  for r14_494, r15_494 in pairs(r8_494:CommonPrepareAllBattleMontage(r3_494, r4_494)) do
    r5_494 = r5_494 + 1
    DebugPrint(r15_494:GetOriginPath())
  end
  -- close: r10_494
  DebugPrint("Mesh:")
  for r14_494, r15_494 in pairs(r8_494:CommonPrepareAllMesh(r3_494, r4_494)) do
    r6_494 = r6_494 + 1
    DebugPrint(r15_494:GetOriginPath())
  end
  -- close: r10_494
  DebugPrint("Weapon:")
  local r10_494 = {}
  for r15_494, r16_494 in pairs(DataMgr.WeaponTag) do
    table.insert(r10_494, r15_494)
  end
  -- close: r11_494
  for r15_494, r16_494 in pairs(r8_494:CommonPrepareAllWeaponMontage(r10_494, r3_494, r4_494)) do
    r7_494 = r7_494 + 1
    DebugPrint(r16_494:GetOriginPath())
  end
  -- close: r11_494
  DebugPrint("End!!! Find MeshNum = ", r5_494, " MontageNum = ", r6_494, " Weapon = ", r7_494)
end
function r0_0.PrintAllPreloadCacheInfo(r0_495)
  -- line: [6297, 6300] id: 495
  UCharPreloadEMComponent.PrintAllCacheDebugInfo()
  URolePreloadGameInstanceSubsystem.PrintAllDebugInfo()
end
function r0_0.PrintDynamicEventInfo(r0_496, r1_496)
  -- line: [6301, 6306] id: 496
  local r3_496 = require("BluePrints.Common.ClientEvent.ClientEventUtils").GetDynEventInfo(r1_496)
  URuntimeCommonFunctionLibrary.AddOnScreenDebugMessage(-1, 5, FColor(255, 255, 255), r3_496, false, FVector2D(1, 1))
  DebugPrint(r3_496)
end
function r0_0.UseMobileUnitBudget(r0_497, r1_497)
  -- line: [6308, 6317] id: 497
  local r2_497 = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(r0_497.Player, UUnitBudgetAllocatorSubsystem)
  if r2_497 then
    if tonumber(r1_497) == 0 then
      r2_497.bUseMobile = false
    else
      r2_497.bUseMobile = true
    end
  end
end
function r0_0.DebugTickUnitBudget(r0_498)
  -- line: [6319, 6324] id: 498
  local r1_498 = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(r0_498.Player, UUnitBudgetAllocatorSubsystem)
  if r1_498 then
    r1_498:Debug_TickUnitBudget()
  end
end
function r0_0.OpenMonsterDebug(r0_499)
  -- line: [6326, 6331] id: 499
  local r1_499 = UIManager(GWorld.GameInstance):GetUIObj("BattleMain")
  r1_499.TakeAimIndicator.bOpenMonsterDebug = not r1_499.TakeAimIndicator.bOpenMonsterDebug
  require("BluePrints.UI.GMInterface.GMFunctionLibrary").ExecConsoleCommand(r0_499:GetGameInstance(), "EnableGDT")
end
function r0_0.CrashTest(r0_500, r1_500)
  -- line: [6335, 6339] id: 500
  if not r1_500 then
    r1_500 = "IllegalAccess"
  end
  ScreenPrint("CrashTest CrashTest CrashTest", r1_500)
  URuntimeCommonFunctionLibrary.CrashTest(r1_500)
end
function r0_0.EnableSkillPrediction(r0_501)
  -- line: [6341, 6346] id: 501
  r0_0.bEnableSkillPrediction = not Battle(r0_501.Player).bEnableSkillPrediction
  Battle(r0_501.Player).bEnableSkillPrediction = r0_0.bEnableSkillPrediction
  r0_501:ServerBattleCommand("EnableSkillPrediction", r0_0.bEnableSkillPrediction)
end
function r0_0.ForceSimPredictionFailed(r0_502)
  -- line: [6348, 6355] id: 502
  r0_0.bSimPredictionFailed = not Battle(r0_502.Player).bSimPredictionFailed
  Battle(r0_502.Player).bSimPredictionFailed = r0_0.bSimPredictionFailed
  DebugPrint("gmy@GM_Command GM_Command:ForceSimPredictionFailed", r0_0.bSimPredictionFailed)
  r0_502:ServerBattleCommand("ForceSimPredictionFailed", r0_0.bSimPredictionFailed)
end
function r0_0.PrintPredictionDebugInfo(r0_503, r1_503)
  -- line: [6357, 6369] id: 503
  if r0_503.Player then
    if r1_503 then
      local r3_503 = Battle(r0_503.Player):GetEntity(tonumber(r1_503))
      if r3_503 and r3_503.PrintPredictionDebugInfo then
        r3_503:PrintPredictionDebugInfo()
      end
    else
      r0_503.Player:PrintPredictionDebugInfo()
    end
  end
end
function r0_0.SetGamepad(r0_504, r1_504)
  -- line: [6371, 6377] id: 504
  local r3_504 = UE4.UGameplayStatics.GetPlayerCharacter(r0_504:GetGameInstance(), 0)
  if r3_504 then
    r3_504:SwitchGamepadSet(tonumber(r1_504))
  end
end
function r0_0.PrintBattleHistory(r0_505, r1_505, ...)
  -- line: [6379, 6399] id: 505
  if r1_505 then
    r1_505 = tonumber(r1_505) and 0
  else
    goto label_8	-- block#2 is visited secondly
  end
  local r2_505 = {
    ...
  }
  local r3_505 = UE4.FBattleHistoryFilter()
  if r1_505 and r1_505 == 1 then
    r3_505.Verbosity = UE4.EBattleRecordVerbosity.Verbose
  else
    r3_505.Verbosity = UE4.EBattleRecordVerbosity.Normal
  end
  for r8_505, r9_505 in ipairs(r2_505) do
    r3_505.TargetTags:Add(r9_505)
  end
  -- close: r4_505
  Battle(r0_505.Player):BP_PrintBattleHistory(r3_505)
end
function r0_0.ShowGetItemsTip(r0_506, r1_506, r2_506)
  -- line: [6401, 6423] id: 506
  local r3_506 = {
    InfoDataList = {},
  }
  if r1_506 == "Blessing" then
    table.insert(r3_506.InfoDataList, DataMgr.RougeLikeBlessing[505])
  else
    table.insert(r3_506.InfoDataList, DataMgr.RougeLikeTreasure[14201])
    table.insert(r3_506.InfoDataList, DataMgr.RougeLikeTreasure[10102])
    table.insert(r3_506.InfoDataList, DataMgr.RougeLikeTreasure[10103])
  end
  if r2_506 then
    r3_506.Islose = true
  else
    r3_506.Islose = false
  end
  r3_506.ItemId = 101
  r3_506.OldLevel = 1
  r3_506.NewLevel = 2
  UIManager(r0_506):LoadUINew(UIConst.GetItemsTip, r3_506)
end
function r0_0.TestTriggerAbyssOnEnd(r0_507)
  -- line: [6425, 6534] id: 507
  r0_507.AbyssLogicServerInfo = {}
  r0_507.AbyssLogicServerInfo.AbyssLevelId = 3
  r0_507.AbyssLogicServerInfo.AbyssId = 1012
  local r1_507 = GWorld:GetAvatar()
  if not r1_507 then
    return 
  end
  local r2_507 = r1_507.Abysses[r0_507.AbyssLogicServerInfo.AbyssId]
  if not r2_507 then
    return 
  end
  local r3_507 = r2_507.AbyssLevelList[r0_507.AbyssLogicServerInfo.AbyssLevelId]
  if not r3_507 then
    return 
  end
  if r3_507:IsAbyssLevelPass() then
    return 
  end
  local r5_507 = DataMgr.AbyssLevel
  local r6_507 = r0_507.AbyssLogicServerInfo.AbyssLevelId
  local r7_507 = r6_507 + 1
  local r9_507 = {}
  local r10_507 = {}
  if r5_507[r6_507].AbyssDungeon1 then
    local r11_507 = {}
    local r12_507 = {}
    if r5_507[r7_507] then
      r12_507 = DataMgr.AbyssDungeon[r5_507[r7_507].AbyssDungeon1].AbyssBuffID
    end
    if r5_507[r6_507] then
      r11_507 = DataMgr.AbyssDungeon[r5_507[r6_507].AbyssDungeon1].AbyssBuffID
    end
    for r17_507, r18_507 in pairs(r12_507) do
      local r19_507 = false
      for r24_507, r25_507 in pairs(r11_507) do
        if r18_507 == r25_507 then
          r19_507 = true
          goto label_84
        end
      end
      -- close: r20_507
      ::label_84::
      -- close: r20_507
      if not r19_507 then
        table.insert(r9_507, r18_507)
      end
    end
    -- close: r13_507
  end
  if r5_507[r6_507].AbyssDungeon2 then
    local r12_507 = {}
    local r13_507 = {}
    if r5_507[r7_507] then
      r13_507 = DataMgr.AbyssDungeon[r5_507[r7_507].AbyssDungeon2].AbyssBuffID
    end
    if r5_507[r6_507] then
      r12_507 = DataMgr.AbyssDungeon[r5_507[r6_507].AbyssDungeon2].AbyssBuffID
    end
    for r18_507, r19_507 in pairs(r13_507) do
      local r20_507 = false
      for r25_507, r26_507 in pairs(r12_507) do
        if r19_507 == r26_507 then
          r20_507 = true
          goto label_137
        end
      end
      -- close: r21_507
      ::label_137::
      -- close: r21_507
      if not r20_507 then
        table.insert(r10_507, r19_507)
      end
    end
    -- close: r14_507
  end
  local r12_507 = ReddotManager.GetLeafNodeCacheDetail("AbyssEntry1")
  local r13_507 = false
  for r18_507, r19_507 in ipairs(r9_507) do
    local r20_507 = tostring(r19_507)
    if not r12_507[r0_507.AbyssLogicServerInfo.AbyssId] then
      r12_507[r0_507.AbyssLogicServerInfo.AbyssId] = {}
    end
    if not r12_507[r0_507.AbyssLogicServerInfo.AbyssId][r20_507] then
      r12_507[r0_507.AbyssLogicServerInfo.AbyssId][r20_507] = true
      r13_507 = true
    end
  end
  -- close: r14_507
  if r13_507 then
    ReddotManager.IncreaseLeafNodeCount("AbyssEntry1")
  end
  r13_507 = false
  r12_507 = ReddotManager.GetLeafNodeCacheDetail("AbyssEntry2")
  for r18_507, r19_507 in ipairs(r10_507) do
    local r20_507 = tostring(r19_507)
    if not r12_507[r0_507.AbyssLogicServerInfo.AbyssId] then
      r12_507[r0_507.AbyssLogicServerInfo.AbyssId] = {}
    end
    if not r12_507[r0_507.AbyssLogicServerInfo.AbyssId][r20_507] then
      r12_507[r0_507.AbyssLogicServerInfo.AbyssId][r20_507] = true
      r13_507 = true
    end
  end
  -- close: r14_507
  if r13_507 then
    ReddotManager.IncreaseLeafNodeCount("AbyssEntry2")
  end
end
function r0_0.ShowUpgradeTip(r0_508, r1_508, r2_508)
  -- line: [6536, 6542] id: 508
  UIManager(r0_508):LoadUINew(UIConst.UpgradeTip, {
    ItemId = 105,
    OldLevel = 1,
    NewLevel = 2,
  })
end
function r0_0.ForceStartDynQuest(r0_509, r1_509)
  -- line: [6544, 6612] id: 509
  if r1_509 then
    local r2_509 = DataMgr.DynQuest[tonumber(r1_509)]
    local r3_509 = r2_509.RegionId
    local r4_509 = r2_509.TriggerBoxID
    local r5_509 = UE4.UGameplayStatics.GetGameMode(r0_509.Player)
    local r6_509 = nil
    if DataMgr.Region and DataMgr.Region[r3_509] then
      local r7_509 = DataMgr.Region[r3_509].IsRandom
      if r7_509 then
        r6_509 = r7_509[1]
      end
    end
    if r5_509 and r6_509 then
      if DataMgr.DispatchUI[tonumber(r1_509)] then
        local r7_509 = DataMgr.DispatchUI[tonumber(r1_509)].TeleportPointPos
        if r7_509 then
          r6_509 = DataMgr.DynQuest[tonumber(r1_509)].SubRegionId
          r5_509:HandleLevelDeliver(UE4.EModeType.ModeRegion, r6_509, r7_509, nil, nil, true)
          return 
        end
      end
      local r7_509 = UE4.UGameplayStatics.GetPlayerCharacter(r5_509, 0)
      local r8_509 = GWorld:GetAvatar()
      if not r8_509 then
        return 
      end
      local function r9_509(...)
        -- line: [6572, 6598] id: 510
        require("BluePrints.Common.ClientEvent.ClientEventUtils"):StartDynamicEvent(tonumber(r1_509))
        local r1_510 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
        if not r1_510 then
          return 
        end
        local r2_510 = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
        local r3_510 = r1_510.StaticCreatorMap:FindRef(r4_509)
        if r3_510 then
          local r4_510 = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
          local r5_510 = r2_510:GetWCSubSystem()
          if not r5_510 then
            return 
          end
          local r6_510 = r3_510:GetTransform()
          r6_510.Translation = UE4.UNavigationFunctionLibrary.ProjectPointToNavigation3D(r6_510.Translation, r5_510)
          r5_510:RequestAsyncTravel(r4_510, r6_510, {
            r4_510,
            function()
              -- line: [6592, 6595] id: 511
            end
          })
        end
      end
      if r8_509:GetCurrentRegionId() ~= r6_509 then
        r8_509:StartJumpRegion(r6_509, r9_509)
        r0_509:SkipRegion(1, r6_509, 1)
      else
        r9_509()
      end
    end
    -- close: r2_509
  end
end
function r0_0.CompleteAllDispatchCondion(r0_512)
  -- line: [6614, 6618] id: 512
  for r5_512, r6_512 in pairs(DataMgr.Dispatch) do
    r0_512:CompleteSingleCondition(r6_512.DispatchCondition)
  end
  -- close: r1_512
end
function r0_0.TractedMonsterToPlayer(r0_513, r1_513, r2_513)
  -- line: [6620, 6629] id: 513
  local r3_513 = tonumber(r1_513) and 2000
  local r4_513 = tonumber(r2_513) and 500000
  local r5_513 = UE.UGameplayStatics.GetGameMode(r0_513.Player)
  local r6_513 = TArray(0)
  for r11_513, r12_513 in pairs(r5_513.EMGameState.MonsterMap) do
    r6_513:Add(r12_513.Eid)
  end
  -- close: r7_513
  URuntimeCommonFunctionLibrary.TractionActorsToCenter(ESourceTags.Skill, r0_513.Player:K2_GetActorLocation(), r3_513, r4_513, r6_513, r0_513.Player)
end
function r0_0.TestTractedPlayer(r0_514, r1_514, r2_514)
  -- line: [6631, 6638] id: 514
  local r3_514 = tonumber(r1_514) and 200
  local r4_514 = tonumber(r2_514) and 500000
  local r5_514 = TArray(0)
  r5_514:Add(r0_514.Player.Eid)
  URuntimeCommonFunctionLibrary.TractionActorsToCenter(ESourceTags.Skill, r0_514.Player:K2_GetActorLocation(), r3_514, r4_514, r5_514, r0_514.Player)
end
function r0_0.SkipAngling(r0_515, r1_515)
  -- line: [6640, 6646] id: 515
  if not _G.bSkipAngling and r1_515 then
    _G.bSkipAngling = true
  elseif _G.bSkipAngling and not r1_515 then
    _G.bSkipAngling = false
  end
end
function r0_0.ShowRegionmapPane(r0_516, r1_516)
  -- line: [6648, 6650] id: 516
  _G.ShowRegionmapPane = r1_516 == "1"
end
function r0_0.SSRPlaySequence(r0_517, r1_517, r2_517)
  -- line: [6652, 6657] id: 517
  local r3_517 = UE.UGameplayStatics.GetGameMode(r0_517.Player)
  if r3_517.LevelSequenceStateRecorder then
    r3_517.LevelSequenceStateRecorder:PlaySequence(tonumber(r1_517), tonumber(r2_517))
  end
end
function r0_0.SSRPlaySequence(r0_518, r1_518, r2_518)
  -- line: [6659, 6664] id: 518
  local r3_518 = UE.UGameplayStatics.GetGameMode(r0_518.Player)
  if r3_518.LevelSequenceStateRecorder then
    r3_518.LevelSequenceStateRecorder:PlaySequence(tonumber(r1_518), tonumber(r2_518))
  end
end
function r0_0.StartFlow(r0_519, r1_519, r2_519)
  -- line: [6666, 6677] id: 519
  if not r1_519 then
    r1_519 = r0_519.Player
  end
  if not r2_519 then
    r2_519 = LoadObject("/Game/Dialogue/SpecialSideStory/2002/200234/510122.510122")
  end
  if UE.UEMFlowFunctionLibrary then
    local r3_519 = UE.UEMFlowFunctionLibrary.GetFlowSubsystem(r0_519.Player)
    if r3_519 then
      r3_519:StartRootFlow(r1_519, r2_519)
    end
  end
end
function r0_0.StopFlow(r0_520, r1_520, r2_520)
  -- line: [6679, 6690] id: 520
  if not r1_520 then
    r1_520 = r0_520.Player
  end
  if not r2_520 then
    r2_520 = LoadObject("/Game/TestFlowAsset.TestFlowAsset")
  end
  if UE.UEMFlowFunctionLibrary then
    local r3_520 = UE.UEMFlowFunctionLibrary.GetFlowSubsystem(r0_520.Player)
    if r3_520 then
      r3_520:StopRootFlow(r1_520, r2_520)
    end
  end
end
function r0_0.NewDeputeTest(r0_521)
  -- line: [6693, 6695] id: 521
  Const.IsOpenNewDepute = true
end
function r0_0.PrintCharModVolume(r0_522)
  -- line: [6697, 6705] id: 522
  local r1_522 = GWorld:GetAvatar()
  if not r1_522 then
    return 
  end
  for r6_522, r7_522 in pairs(r1_522.Chars) do
    DebugPrint("ZJT_ 11111111 PrintCharModVolume ", r7_522.CharId, r7_522:GetModVolume(), r7_522.ModVolume, r7_522.ExtralModVolume and 0)
  end
  -- close: r2_522
end
function r0_0.DetectiveMinigame(r0_523, r1_523, r2_523)
  -- line: [6708, 6727] id: 523
  if r1_523 == "UnlockQuestion" then
    local r3_523 = GWorld:GetAvatar()
    if r3_523 then
      r3_523:DetectiveQuestionUnlockQuestion(tonumber(r2_523))
    end
  elseif r1_523 == "UnlockAnswer" then
    local r3_523 = GWorld:GetAvatar()
    if r3_523 then
      r3_523:DetectiveQuestionUnlockAnswer(tonumber(r2_523))
    end
  elseif r1_523 == "OpenUI" then
    r0_523:GetGameInstance():GetGameUIManager():LoadUINew("DetectiveMinigame")
  elseif r1_523 == "OpenDetailUI" then
    UIManager(r0_523):LoadUINew("DetectiveReasoningAni", function()
      -- line: [6723, 6725] id: 524
      UIManager(r0_523):LoadUINew("DetectiveReasoningDetail", r2_523)
    end)
  end
end
function r0_0.CommonActivitySettlement(r0_525)
  -- line: [6730, 6776] id: 525
  GWorld.GameInstance:GetGameUIManager():LoadUINew("ActivitySettlement", {
    LevelScore = 500,
    IsWin = true,
    LevelTitle = "关卡标题",
    Text_Title = "标题文本",
    Text_GetReward = "获得奖励111",
    TitleColor = UE4.UUIFunctionLibrary.StringToSlateColor("FFFF00"),
    ScoreLineColor = UE4.UUIFunctionLibrary.StringToSlateColor("FFFF00"),
    ActivityId = 1030103,
    ScoreInfo = {
      {
        text = "通关时达到12300",
        isFinish = true,
      },
      {
        text = "通关时达到21330",
        isFinish = false,
      },
      {
        text = "通关时达到31330",
        isFinish = true,
      },
      {
        text = "通关时达到12",
        isFinish = true,
      },
      {
        text = "通关时达到210",
        isFinish = false,
      },
      {
        text = "通关时达到3130",
        isFinish = true,
      }
    },
    RewardIds = {
      1016,
      1017,
      1018
    },
    ExitCallback = function()
      -- line: [6764, 6767] id: 526
      GWorld.GameInstance:GetGameUIManager():ShowUITip("CommonToastMain", GText("Minigame_Textmap_100305"))
    end,
  })
end
function r0_0.EnterTiaoPinGame(r0_527)
  -- line: [6778, 6780] id: 527
  UIManager(GWorld.GameInstance):LoadUINew("TiaoPin")
end
function r0_0.PinAttr(r0_528, r1_528, r2_528)
  -- line: [6782, 6789] id: 528
  UIManager(r0_528.Player):LoadUI(UIConst.ATTRDEBUGPANEL, "AttrDebugPanel", UIConst.ZORDER_ABOVE_ALL):AddAttrWatcher(r1_528, r2_528)
end
function r0_0.OpenWalnutRewardDialog(r0_529, r1_529)
  -- line: [6791, 6795] id: 529
  if not UIManager(r0_529):GetUIObj("WalnutRewardDialog") then
    r0_529.DetailWidget = UIManager(r0_529):LoadUINew("WalnutRewardDialog", tonumber(r1_529))
  end
end
function r0_0.VerifyArrayTest(r0_530)
  -- line: [6797, 6800] id: 530
  GWorld.GameInstance:GmChangeVerifyArray()
end
function r0_0.FloatVerifyArrayTest(r0_531)
  -- line: [6802, 6805] id: 531
  GWorld.GameInstance:GmChangeFloatVerifyArray()
end
function r0_0.CreateSquad(r0_532, r1_532)
  -- line: [6807, 6814] id: 532
  local r2_532 = GWorld:GetAvatar()
  if not r2_532 then
    return 
  end
  r2_532:CallServerMethod("GMCreateSquad", r1_532)
end
function r0_0.QuitGame(r0_533, r1_533)
  -- line: [6816, 6822] id: 533
  if r1_533 then
    GWorld.GameInstance.ForceQuitGame()
  else
    UKismetSystemLibrary.QuitGame(r0_533.Player, nil, EQuitPreference.Quit, false)
  end
end
function r0_0.SyncTest(r0_534)
  -- line: [6824, 6881] id: 534
  for r6_534, r7_534 in pairs({
    "/Game/AssetDesign/Char/Monster/Jt_Pizhuo/BP_Mon_Jt_Pizhuo.BP_Mon_Jt_Pizhuo",
    "AnimBlueprint\'/Game/AssetDesign/Char/Monster/Jt_Pizhuo/ABP_Mon_Jt_Pizhuo.ABP_Mon_Jt_Pizhuo_C\'",
    "/Game/AssetDesign/AI/Monster/Jt_Pizhuo/BT_7Pizhuo.BT_7Pizhuo",
    "/Game/AssetDesign/Weapon/Monster/Melee/BP_Jt_Pizhuo.BP_Jt_Pizhuo",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Mesh/JT_Pizhuo_Physics",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Mesh/Jt_Pizhuo_SM",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Mesh/JT_Pizhuo_WP02_Physics",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Mesh/JT_Pizhuo_WP02_SM",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Mesh/JT_Pizhuo_WP_SK",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Mesh/JT_Pizhuo_WP_SM",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Mesh/JT_Pizhuo_WP_SM_Physics",
    "/Game/Asset/Char/Monster/Common/Part/Mesh/JT_Part02F_SM.JT_Part02F_SM",
    "/Game/Asset/Char/Monster/Common/Part/Mesh/JT_Part01L_SM.JT_Part01L_SM",
    "/Game/Asset/Char/Monster/Common/Part/Mesh/JT_Part01R_SM.JT_Part01R_SM",
    "/Game/Asset/Char/Monster/Common/Part/Mesh/JT_Part02B_SM.JT_Part02B_SM",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Hit/JT_Pizhuo_CaughtDie_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Hit/JT_Pizhuo_Die_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Hit/JT_Pizhuo_GetUpBack_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Hit/JT_Pizhuo_GetUpFront_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Hit/JT_Pizhuo_HeavyHit_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Hit/JT_Pizhuo_HitFly_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Hit/JT_Pizhuo_HitFlyDie_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Hit/JT_Pizhuo_LightHit1_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Hit/JT_Pizhuo_LightHit2_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Hit/JT_Pizhuo_LightHitRanged_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Hit/JT_Pizhuo_StunBlind_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Hit/JT_Pizhuo_StunBound_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Hit/JT_Pizhuo_StunFire_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Hit/JT_Pizhuo_StunParalysis_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Skill/JT_Pizhuo_Alarm01_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Skill/JT_Pizhuo_Attack01_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Skill/JT_Pizhuo_Attack02_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Skill/JT_Pizhuo_C01_Attack01_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Skill/JT_Pizhuo_C01_Attack02_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Skill/JT_Pizhuo_C01_Skill01_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Skill/JT_Pizhuo_DYZAlarmTest_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Skill/JT_Pizhuo_ShakeIdle_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Skill/JT_Pizhuo_Skill01_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Skill/JT_Pizhuo_Skill02_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Combat/Skill/JT_Pizhuo_Skill03_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/Locomotion/JT_Pizhuo_Rotation_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/SpecialIdle/JT_Pizhuo_SpecialAlert_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/SpecialIdle/JT_Pizhuo_SpecialIdle01_End_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/SpecialIdle/JT_Pizhuo_SpecialIdle01_Montage",
    "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/SpecialIdle/JT_Pizhuo_SpecialIdle02_Montage"
  }) do
    local r11_534 = {}
    UE4.UResourceLibrary.LoadObjectAsync(r0_534.Player, r7_534, r11_534)
  end
  -- close: r2_534
  LoadObject("NiagaraSystem\'/Game/Asset/Effect/Niagara/Monster/A_Common/NS_Common_Part_Smash.NS_Common_Part_Smash\'")
end
function r0_0.ShowLookAtDebug(r0_535, r1_535, r2_535)
  -- line: [6883, 6903] id: 535
  local r3_535 = tonumber(r2_535)
  local r4_535 = tonumber(r1_535)
  local r5_535 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if r3_535 > 0 and r5_535 then
    local r6_535 = r5_535.NpcCharacterMap:FindRef(r4_535)
    if r6_535 and r6_535.NpcAnimInstance then
      r6_535.NpcAnimInstance.IsLookAtDebug = true
    end
  elseif r5_535 then
    local r6_535 = r5_535.NpcCharacterMap:FindRef(r4_535)
    if r6_535 and r6_535.NpcAnimInstance then
      r6_535.NpcAnimInstance.IsLookAtDebug = false
    end
  end
end
function r0_0.StartLookAt(r0_536, r1_536, r2_536, r3_536)
  -- line: [6905, 6931] id: 536
  local r4_536 = tonumber(r3_536)
  local r5_536 = tonumber(r1_536)
  local r6_536 = tonumber(r2_536)
  local r7_536 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if r4_536 > 0 and r7_536 then
    local r8_536 = r7_536.NpcCharacterMap:FindRef(r5_536)
    local r9_536 = r7_536.NpcCharacterMap:FindRef(r2_536)
    if r6_536 == 1 then
      r9_536 = UE4.UGameplayStatics.GetPlayerCharacter(UE4.UGameplayStatics.GetGameMode(r0_536.Player), 0)
    end
    if r8_536 and r8_536.NpcAnimInstance and r9_536 then
      r8_536.NpcAnimInstance:SetLookAtActor(r9_536, "head")
    end
  elseif r7_536 then
    local r8_536 = r7_536.NpcCharacterMap:FindRef(r5_536)
    if r8_536 and r8_536.NpcAnimInstance then
      r8_536.NpcAnimInstance:ResetNormalLookAt()
    end
  end
end
function r0_0.NPCMoveTo(r0_537, r1_537, r2_537, r3_537)
  -- line: [6933, 6947] id: 537
  local r4_537 = tonumber(r1_537)
  local r5_537 = tonumber(r2_537)
  local r6_537 = tonumber(r3_537)
  local r7_537 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if r7_537 then
    local r8_537 = r7_537.NpcCharacterMap:FindRef(r4_537)
    r8_537:SetMaxWalkSpeedBase(r5_537)
    r8_537:SetNpcMovementTickEnable(true)
    UAIBlueprintHelperLibrary.CreateMoveToProxyObject(r8_537, r8_537, r8_537:K2_GetActorLocation() + r8_537:GetActorForwardVector() * r6_537)
  end
end
function r0_0.LookAtBySlerp(r0_538, r1_538, r2_538, r3_538, r4_538)
  -- line: [6949, 6981] id: 538
  local r5_538 = tonumber(r3_538)
  local r6_538 = tonumber(r1_538)
  local r7_538 = tonumber(r2_538)
  local r8_538 = tonumber(r4_538)
  local r9_538 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if r5_538 > 0 and r9_538 then
    local r10_538 = r9_538.NpcCharacterMap:FindRef(r6_538)
    local r11_538 = r9_538.NpcCharacterMap:FindRef(r2_538)
    if r7_538 == 1 then
      r11_538 = UE4.UGameplayStatics.GetPlayerCharacter(UE4.UGameplayStatics.GetGameMode(r0_538.Player), 0)
    end
    if r10_538 and r10_538.NpcAnimInstance and r11_538 then
      r10_538.NpcAnimInstance.PitchSlerpAlpha.TotalTime = 10
      r10_538.NpcAnimInstance.YawSlerpAlpha.TotalTime = 1
      r10_538.NpcAnimInstance:SetLookAtActor(r11_538, "head", true)
      r10_538.NpcAnimInstance.IsLookAtDebug = true
      r10_538.NpcAnimInstance:StartSlerpLookAt()
    end
  elseif r9_538 then
    local r10_538 = r9_538.NpcCharacterMap:FindRef(r6_538)
    if r10_538 and r10_538.NpcAnimInstance then
      r10_538.NpcAnimInstance:ResetNormalLookAt()
      r10_538.NpcAnimInstance.IsLookAtDebug = false
    end
  end
end
function r0_0.ControlAllMonsterBTTickEnable(r0_539, r1_539)
  -- line: [6983, 6989] id: 539
  local r2_539 = UE4.UGameplayStatics.GetGameState(r0_539.Player)
  if r1_539 == false then
    r1_539 = false
  end
  for r7_539, r8_539 in pairs(r2_539.MonsterMap) do
    r8_539:SetTickEnabled(ETickCtrlType.UnitBudget, ETickObjectFlag.FLAG_BTCOMPONENT, r1_539)
  end
  -- close: r3_539
end
function r0_0.LJHTEST(r0_540, r1_540, r2_540)
  -- line: [6991, 6998] id: 540
  local r3_540 = GWorld:GetAvatar()
  if r3_540 then
    r3_540:GetFeiNaProgressRewerd(InCallBack, r1_540, r2_540)
  end
end
function r0_0.TestGraphTask(r0_541)
  -- line: [7000, 7002] id: 541
  UE4.UBattleFunctionLibrary.TestTaskGraphTask(r0_541.Player)
end
function r0_0.LHQTEST(r0_542, r1_542, r2_542)
  -- line: [7004, 7025] id: 542
  local r3_542 = tonumber(r1_542)
  local r4_542 = tonumber(r2_542)
  local r5_542 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if r5_542 then
    local r6_542 = r5_542.NpcCharacterMap:FindRef(r3_542)
    local r7_542 = "AnimMontage\'/Game/Asset/Char/Player/Char009_Xibi/Animation/Montage/Interactive/MechInteractive/Xibi_Interactive_Sit_F_Montage.Xibi_Interactive_Sit_F_Montage\'"
    local r8_542 = LoadObject(r7_542)
    local r9_542 = "AnimMontage\'/Game/Asset/Char/Player/Char010_Saiqi/Animation/Montage/Interactive/MechInteractive/Saiqi_Interactive_Sit_F_Montage.Saiqi_Interactive_Sit_F_Montage\'"
    local r10_542 = LoadObject(r7_542)
    if r6_542 and r6_542.NpcAnimInstance and r4_542 == 1 then
      r6_542:RotateOffset(60)
    else
      r6_542:RotateOffset(-120)
    end
  end
end
function r0_0.NPCRotate90(r0_543, r1_543, r2_543)
  -- line: [7027, 7036] id: 543
  local r3_543 = tonumber(r2_543)
  local r4_543 = tonumber(r1_543)
  local r5_543 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if r5_543 then
    local r6_543 = r5_543.NpcCharacterMap:FindRef(r4_543)
    r6_543.NpcAnimInstance:SetTurnInPlace90(r6_543.ModelId)
    r6_543:RotateOffset(r3_543)
  end
end
function r0_0.NPCRotate(r0_544, r1_544, r2_544)
  -- line: [7038, 7047] id: 544
  local r3_544 = tonumber(r2_544)
  local r4_544 = tonumber(r1_544)
  local r5_544 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if r5_544 then
    local r6_544 = r5_544.NpcCharacterMap:FindRef(r4_544)
    r6_544.NpcAnimInstance:SetTurnInPlace45()
    r6_544:RotateOffset(r3_544)
  end
end
function r0_0.NPCTalkAgree(r0_545, r1_545, r2_545)
  -- line: [7049, 7062] id: 545
  local r3_545 = tonumber(r1_545)
  local r4_545 = tonumber(r2_545)
  local r5_545 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if r5_545 then
    local r6_545 = r5_545.NpcCharacterMap:FindRef(r3_545)
    local r8_545 = LoadObject("AnimMontage\'/Game/Asset/Char/Player/Char028_Kajia/Animation/Montage/Locomotion/Kajia_Agree_Montage_Only_For_Test.Kajia_Agree_Montage_Only_For_Test\'")
    r6_545.NpcAnimInstance:Montage_Play(r8_545)
    if r4_545 == 0 then
      r6_545.NpcAnimInstance:Montage_JumpToSection("Disagree", r8_545)
    end
  end
end
function r0_0.NPCTalk03(r0_546, r1_546)
  -- line: [7064, 7073] id: 546
  local r2_546 = tonumber(r1_546)
  local r3_546 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if r3_546 then
    r3_546.NpcCharacterMap:FindRef(r2_546).NpcAnimInstance:Montage_Play(LoadObject("AnimMontage\'/Game/Asset/Char/Player/Char028_Kajia/Animation/Montage/Interactive/Kajia_Emo_Talk03_Montage.Kajia_Emo_Talk03_Montage\'"))
  end
end
function r0_0.NPCAgree(r0_547, r1_547, r2_547)
  -- line: [7075, 7089] id: 547
  local r3_547 = tonumber(r1_547)
  local r4_547 = tonumber(r2_547)
  local r5_547 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if r5_547 then
    local r6_547 = r5_547.NpcCharacterMap:FindRef(r3_547)
    local r8_547 = LoadObject("AnimMontage\'/Game/Asset/Char/Player/Char028_Kajia/Animation/Montage/Locomotion/Kajia_Agree_Montage_Only_For_Test.Kajia_Agree_Montage_Only_For_Test\'")
    r6_547.NpcAnimInstance.bEnableAgreeTest = true
    r6_547.NpcAnimInstance:Montage_Play(r8_547)
    if r4_547 == 0 then
      r6_547.NpcAnimInstance:Montage_JumpToSection("Disagree", r8_547)
    end
  end
end
function r0_0.GM_SkipMonthCardPay(r0_548)
  -- line: [7092, 7101] id: 548
  DebugPrint("GM_SkipMonthCardPay")
  require("BluePrints.UI.WBP.Perk.MonthCard.MonthCardController").TryPurchaseMonthCard = function()
    -- line: [7095, 7100] id: 549
    local r0_549 = GWorld:GetAvatar()
    if r0_549 then
      r0_549:BuyMonthlyCard()
    end
  end
end
function r0_0.DungeonDoubleCost(r0_550, r1_550)
  -- line: [7103, 7109] id: 550
  local r2_550 = nil	-- notice: implicit variable refs by block#[4]
  if r1_550 then
    r2_550 = true
    if not r2_550 then
      ::label_5::
      r2_550 = false
    end
  else
    goto label_5	-- block#2 is visited secondly
  end
  local r3_550 = GWorld:GetAvatar()
  if r3_550 then
    r3_550:SetDungeonDoubleCost(r2_550)
  end
end
function r0_0.GetWorldRegionEidByCreatorId(r0_551, r1_551)
  -- line: [7111, 7127] id: 551
  local r3_551 = UE4.UGameplayStatics.GetGameMode(r0_551.Player):GetRegionDataMgrSubSystem().DataPool.RegionData
  if not r3_551 then
    return 
  end
  local r4_551 = nil
  for r9_551, r10_551 in pairs(r3_551) do
    if r10_551.CreatorId == tonumber(r1_551) then
      r4_551 = r10_551.WorldRegionEid
      break
    end
  end
  -- close: r5_551
  if not r4_551 then
    ScreenPrint("can not find Eid")
    return 
  end
  DebugPrint(r1_551 .. "的Eid为 " .. r4_551)
end
function r0_0.GetWorldRegionEidByManualItemId(r0_552, r1_552)
  -- line: [7129, 7145] id: 552
  local r3_552 = UE4.UGameplayStatics.GetGameMode(r0_552.Player):GetRegionDataMgrSubSystem().DataPool.RegionData
  if not r3_552 then
    return 
  end
  local r4_552 = nil
  for r9_552, r10_552 in pairs(r3_552) do
    if r10_552.ManualItemId == tonumber(r1_552) then
      r4_552 = r10_552.WorldRegionEid
      break
    end
  end
  -- close: r5_552
  if not r4_552 then
    ScreenPrint("can not find Eid")
    return 
  end
  DebugPrint(r1_552 .. "的Eid为 " .. r4_552)
end
function r0_0.GetWorldRegionEidByRandomRuleId(r0_553, r1_553)
  -- line: [7147, 7165] id: 553
  local r3_553 = UE4.UGameplayStatics.GetGameMode(r0_553.Player):GetRegionDataMgrSubSystem().DataPool.RegionData
  if not r3_553 then
    return 
  end
  local r4_553 = {}
  for r9_553, r10_553 in pairs(r3_553) do
    if r10_553.RandomRuleId == tonumber(r1_553) then
      table.insert(r4_553, r10_553.WorldRegionEid)
    end
  end
  -- close: r5_553
  if not r4_553 then
    ScreenPrint("can not find Eid")
    return 
  end
  for r9_553, r10_553 in pairs(r4_553) do
    DebugPrint(r1_553 .. "的Eid为 " .. r10_553)
  end
  -- close: r5_553
end
function r0_0.EnablePropEffect(r0_554, r1_554, r2_554)
  -- line: [7168, 7185] id: 554
  local r3_554 = tonumber(r1_554)
  local r4_554 = tonumber(r2_554)
  if not r4_554 or not r3_554 then
    return 
  end
  if not DataMgr.PropEffect[r3_554] then
    return 
  end
  local r5_554 = DataMgr.PropEffect[r3_554].BPPath
  if r4_554 == 1 then
    r0_554.Player.PropEffectComponent:LoadPropEffect(r5_554)
  else
    r0_554.Player.PropEffectComponent:UnloadPropEffect()
  end
end
function r0_0.ShowSequenceTime(r0_555, r1_555)
  -- line: [7187, 7193] id: 555
  if r1_555 == "true" then
    ULevelSequenceCommonFunctionLibrary.CreateRunTimeSequenceTimeWidget(r0_555.Player, r0_555.Player)
  else
    ULevelSequenceCommonFunctionLibrary.DestroyRunTimeSequenceTimeWidget(r0_555.Player, r0_555.Player)
  end
end
function r0_0.UWAUpLoad(r0_556)
  -- line: [7195, 7200] id: 556
  UE4.UUWABlueprintFunctionLibrary.UpLLoad("17357126837", "yingxiongwudi123", 11211)
end
function r0_0.GenerateStripMesh(r0_557, r1_557, r2_557, r3_557, r4_557)
  -- line: [7202, 7236] id: 557
  local r7_557 = UE4.UGameplayStatics.GetPlayerCharacter(r0_557:GetGameInstance(), 0):K2_GetActorLocation()
  local r8_557 = UE4.UClass.Load("/Game/BluePrints/Test/TestProceduralMesh.TestProceduralMesh")
  if not r8_557 then
    DebugPrint("Failed to load ProceduralMesh actor class.")
    return 
  end
  for r12_557 = 1, r1_557, 1 do
    local r16_557 = GWorld.GameInstance:GetWorld():SpawnActor(r8_557, UE4.FTransform(FRotator(0, 0, 0), FVector(r7_557.X + (r12_557 + -1) * 300, r7_557.Y, r7_557.Z)), UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn, nil, r0_557, nil)
    if r16_557 and r16_557.GenerateStripMesh then
      r16_557:GenerateStripMesh(r2_557, r3_557, r4_557)
    else
      DebugPrint("Failed to spawn actor or GenerateStripMesh is nil.")
    end
  end
end
function r0_0.PrintLevelbound(r0_558, r1_558)
  -- line: [7238, 7279] id: 558
  if r1_558 == nil then
    r1_558 = "Prologue_Clouds_Art"
  end
  local r2_558 = r0_558.Player
  local r3_558 = UE4.UGameplayStatics.GetAllActorsOfClass(r2_558, ALevelBounds.StaticClass())
  local r4_558 = UE4.UGameplayStatics.GetStreamingLevel(r2_558, "Prologue_Clouds_Art")
  for r9_558, r10_558 in pairs(r3_558) do
    if UE4.URuntimeCommonFunctionLibrary.GetLevel(r10_558) == r4_558:GetLoadedLevel() then
      local r13_558 = r10_558:GetTransform()
      local r14_558 = r13_558.Translation
      local r15_558 = r13_558.Rotation
      local r16_558 = r13_558.Scale3D
      DebugPrint(r1_558 .. " Levelbound Location:", r14_558.X, r14_558.Y, r14_558.Z)
      DebugPrint(r1_558 .. " Levelbound Rotation:", r15_558.X, r15_558.Y, r15_558.Z)
      DebugPrint(r1_558 .. " Levelbound Scale:", r16_558.X, r16_558.Y, r16_558.Z)
    end
  end
  -- close: r5_558
end
if UE and UE.URuntimeCommonFunctionLibrary.IsDistribution() then
  for r8_0, r9_0 in pairs(r0_0) do
    local r10_0 = type(r9_0)
    local r11_0 = "function"
    if r10_0 == r11_0 then
      function r10_0()
        -- line: [7285, 7285] id: 559
      end
      r0_0[r8_0] = r10_0
    end
  end
  -- close: r4_0
end
function r0_0.PrintCustomNPCCacheInfo(r0_560)
  -- line: [7290, 7295] id: 560
  local r1_560 = UE4.USubsystemBlueprintLibrary.GetWorldSubsystem(r0_560.Player, UE4.UNPCCreateSubSystem)
  if r1_560 then
    r1_560:CustomNPCCacheDebug()
  end
end
function r0_0.MechanismStateDebug(r0_561, r1_561)
  -- line: [7297, 7307] id: 561
  local r2_561 = UE4.UGameplayStatics.GetGameState(r0_561.Player)
  if r2_561 then
    r1_561 = tonumber(r1_561)
    if r1_561 > 0 then
      r2_561.MechanismStateChangeDebug = true
    else
      r2_561.MechanismStateChangeDebug = false
    end
  end
end
function r0_0.ShowBattleError(r0_562, r1_562)
  -- line: [7309, 7345] id: 562
  local r2_562 = GWorld.Battle
  if not r2_562 then
    ScreenPrint("Error:找不到GWorld.Battle")
    return 
  end
  r1_562 = tonumber(r1_562) and 1
  if r1_562 < 1 or r1_562 > 3 then
    ScreenPrint("参数错误，num应为1-3之间的整数")
    return 
  end
  if r1_562 == 1 then
    r2_562:ShowBattleError("GM测试自定义信息", false)
  elseif r1_562 == 2 then
    r2_562:StandardShowBattleErrorLua(UE.EShowBattleErrorType.Weapon, "GM测试小类")
  elseif r1_562 == 3 then
    if not r0_562.Player then
      return 
    end
    r0_562.Player:ResetSkillCD(100000)
  end
end
function r0_0.ShowUIError(r0_563, r1_563, r2_563)
  -- line: [7347, 7353] id: 563
  local r3_563 = GWorld.GameInstance:GetGameUIManager()
  if not r3_563 then
    ScreenPrint("Error:找不到UIManager")
  end
  r3_563:ShowUIError(r1_563, r2_563)
end
function r0_0.ShowPersonalInfoPage(r0_564, r1_564)
  -- line: [7357, 7364] id: 564
  if r1_564 then
    GWorld:GetAvatar():CheckOtherPlayerPersonallInfo(GWorld:GetAvatar().Uid, true)
  else
    require("BluePrints.UI.WBP.PersonInfo.PersonInfoController"):OpenView()
  end
end
function r0_0.UseResourceBattle(r0_565, r1_565)
  -- line: [7366, 7376] id: 565
  r1_565 = tonumber(r1_565)
  if r0_565.ResourceUseHelper == nil then
    r0_565.ResourceUseHelper = require("Utils.ResourceUseHelper")
  end
  if r0_565.ResourceUseHelper then
    r0_565.ResourceUseHelper:ForceUseItemInBattle(r1_565)
  end
end
function r0_0.EnableRegionPlayerOnlyShowHeadUI(r0_566, r1_566, r2_566)
  -- line: [7378, 7387] id: 566
end
function r0_0.NPCSubSystemOnline(r0_567, r1_567)
  -- line: [7389, 7396] id: 567
  local r2_567 = UE4.USubsystemBlueprintLibrary.GetWorldSubsystem(r0_567.Player, UE4.UNPCCreateSubSystem)
  if r1_567 then
    r2_567:SetIsOnlineState(true)
  else
    r2_567:SetIsOnlineState(false)
  end
end
function r0_0.NPCSubSystemChangeOnlineRegionId(r0_568, r1_568)
  -- line: [7398, 7401] id: 568
  UE4.USubsystemBlueprintLibrary.GetWorldSubsystem(r0_568.Player, UE4.UNPCCreateSubSystem):TestChangeRegionOnlineId(tonumber(r1_568))
end
function r0_0.ReadyForRegonOnline(r0_569)
  -- line: [7403, 7433] id: 569
  r0_569:CompleteSystemCondition()
  r0_569:CompleteCondition({
    100103,
    100208
  })
  local r1_569 = r0_569:GetGameInstance()
  local r2_569 = require("BluePrints.UI.GMInterface.GMFunctionLibrary")
  r2_569.ExecConsoleCommand(r1_569, "sgm saq")
  r2_569.ExecConsoleCommand(r1_569, "sgm aac")
  r2_569.ExecConsoleCommand(r1_569, "sgm macml")
  r2_569.ExecConsoleCommand(r1_569, "sgm aas")
  r2_569.ExecConsoleCommand(r1_569, "sgm aad")
  r2_569.ExecConsoleCommand(r1_569, "sgm aaw")
  r2_569.ExecConsoleCommand(r1_569, "sgm mawml")
  r2_569.ExecConsoleCommand(r1_569, "sgm aar")
  r2_569.ExecConsoleCommand(r1_569, "sgm aaws")
  r2_569.ExecConsoleCommand(r1_569, "sgm aawa")
  local r3_569 = GWorld:GetAvatar()
  r3_569:GmGetAllTitle()
  r3_569:GmGetAllTitleFrame()
  r2_569.ExecConsoleCommand(r1_569, "sgm aah")
  r2_569.ExecConsoleCommand(r1_569, "sgm aahf")
  for r8_569, r9_569 in pairs(DataMgr.Pet) do
    r2_569.ExecConsoleCommand(r1_569, "sgm PetAdd " .. r8_569)
  end
  -- close: r4_569
  r0_569:UnlockRegionTeleport(1)
  r0_569:RandomChar()
  r0_569:SkipRegion(1, 999701, 1)
end
function r0_0.RandomChar(r0_570)
  -- line: [7435, 7590] id: 570
  local r1_570 = GWorld:GetAvatar()
  r1_570:ChangeBattleWheel(1, 2, 41017)
  r1_570:ChangeBattleWheel(1, 1, 41014)
  r1_570:ChangeBattleWheel(1, 4, 41015)
  r1_570:ChangeBattleWheel(1, 5, 41011)
  r1_570:ChangeBattleWheel(1, 6, 41010)
  r1_570:ChangeBattleWheel(1, 7, 41003)
  r1_570:ChangeBattleWheel(1, 8, 41013)
  local function r2_570(r0_571, r1_571)
    -- line: [7445, 7465] id: 571
    local r2_571 = {}
    for r7_571 in pairs(r0_571) do
      if r1_571 then
        if r1_571(r7_571) then
          table.insert(r2_571, r7_571)
        end
      else
        table.insert(r2_571, r7_571)
      end
    end
    -- close: r3_571
    if #r2_571 == 0 then
      return nil
    end
    return r2_571[math.random(1, #r2_571)]
  end
  local function r3_570(r0_572, r1_572)
    -- line: [7467, 7487] id: 572
    local r2_572 = {}
    for r7_572, r8_572 in pairs(r0_572) do
      if r1_572 then
        if r1_572(r8_572) then
          table.insert(r2_572, r8_572)
        end
      else
        table.insert(r2_572, r8_572)
      end
    end
    -- close: r3_572
    if #r2_572 == 0 then
      return nil
    end
    return r2_572[math.random(1, #r2_572)]
  end
  local r4_570 = r2_570(r1_570.Chars)
  r1_570:SwitchCurrentChar(r4_570)
  local r5_570 = {}
  for r10_570, r11_570 in pairs(r1_570.Weapons) do
    r5_570[r11_570.WeaponId] = r10_570
  end
  -- close: r6_570
  local r6_570 = r3_570(r5_570, function(r0_573)
    -- line: [7495, 7498] id: 573
    return r1_570.Weapons[r0_573]:IsMelee()
  end)
  r1_570:SwitchWeapon(CommonConst.WeaponType.MeleeWeapon, r6_570)
  local r7_570 = r3_570(r5_570, function(r0_574)
    -- line: [7502, 7504] id: 574
    return r1_570.Weapons[r0_574]:IsRanged()
  end)
  r1_570:SwitchWeapon(CommonConst.WeaponType.RangedWeapon, r7_570)
  r1_570:EquipPet(r2_570(r1_570.Pets))
  local r9_570 = r1_570.Chars[r4_570].CharId
  (function(...)
    -- line: [7512, 7580] id: 575
    local r1_575 = r2_570(r1_570.CommonChars[r9_570].OwnedSkins)
    if r1_575 then
      r1_570:ChangeCharAppearanceSkin(r4_570, 1, r1_575)
    end
    for r6_575, r7_575 in pairs(CommonConst.CharAccessoryTypes) do
      local r8_575 = r3_570(r1_570.CharAccessorys, function(r0_576)
        -- line: [7520, 7522] id: 576
        return DataMgr.CharAccessory[r0_576].AccessoryType == r6_575
      end)
      if r8_575 then
        r1_570:SetCharAppearanceAccessory(r4_570, 1, r8_575)
      end
      -- close: r6_575
    end
    -- close: r2_575
    if r1_575 then
      local r2_575 = {}
      for r6_575 = 1, DataMgr.GlobalConstant.CharColorPart.ConstantValue, 1 do
        r2_575[r6_575] = r2_570(DataMgr.Swatch)
      end
      local r6_575 = r2_575
      r1_570:ChangeCharSkinColors(r1_575, r6_575, 1)
    end
    local r2_575 = r1_570.Weapons[r6_570]
    local r3_575 = r2_570(r1_570.OwnedWeaponSkins, function(r0_577)
      -- line: [7537, 7540] id: 577
      return DataMgr.WeaponSkin[r0_577].ApplicationType == r2_575.SkinApplicationType
    end) and r2_575.WeaponId
    local r6_575 = r6_570
    r1_570:ChangeWeaponAppearanceSkin(r6_575, r3_575)
    local r4_575 = r3_570(r1_570.WeaponAccessorys)
    if r4_575 then
      r1_570:ChangeWeaponAppearanceAccessory(r6_570, r4_575)
    end
    local r5_575 = {}
    r6_575 = 1
    for r9_575 = r6_575, DataMgr.GlobalConstant.WeaponColorPart.ConstantValue, 1 do
      r5_575[r9_575] = r2_570(DataMgr.Swatch)
    end
    r6_575 = r1_570
    r6_575:ChangeWeaponSkinColors(r6_570, r3_575, 1, r5_575)
    r6_575 = r1_570.Weapons
    r6_575 = r6_575[r7_570]
    local r7_575 = r2_570(r1_570.OwnedWeaponSkins, function(r0_578)
      -- line: [7560, 7563] id: 578
      return DataMgr.WeaponSkin[r0_578].ApplicationType == r6_575.SkinApplicationType
    end) and r6_575.WeaponId
    r1_570:ChangeWeaponAppearanceSkin(r7_570, r7_575)
    r4_575 = r3_570(r1_570.WeaponAccessorys)
    if r4_575 then
      r1_570:ChangeWeaponAppearanceAccessory(r7_570, r4_575)
    end
    r5_575 = {}
    for r11_575 = 1, DataMgr.GlobalConstant.WeaponColorPart.ConstantValue, 1 do
      r5_575[r11_575] = r2_570(DataMgr.Swatch)
    end
    r1_570:ChangeWeaponSkinColors(r7_570, r7_575, 1, r5_575)
  end)()
  local r11_570 = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  r11_570:AddTimer(1, function()
    -- line: [7584, 7589] id: 579
    r11_570:ChangeRole(r9_570, AvatarUtils:GetDefaultBattleInfo(r1_570))
  end)
end
function r0_0.ShowGlobalVersion(r0_580)
  -- line: [7592, 7594] id: 580
  UIManager(r0_580):ShowGlobalVersion()
end
function r0_0.HideGlobalVersion(r0_581)
  -- line: [7596, 7598] id: 581
  UIManager(r0_581):HideGlobalVersion()
end
function r0_0.CompleteSystemConditionWithoutGuide(r0_582)
  -- line: [7601, 7626] id: 582
  local r1_582 = GWorld:GetAvatar()
  if not r1_582 then
    return 
  end
  r1_582.bGMHideUnlockPopup = true
  local r2_582 = require("BluePrints.UI.GMInterface.GMFunctionLibrary")
  r2_582.ExecConsoleCommand(r0_582:GetGameInstance(), "sgm sysu")
  r0_582:SuccessAllSystemGuide()
  r2_582.ExecConsoleCommand(r0_582:GetGameInstance(), "sgm CompleteCondition " .. tostring(8002))
  r2_582.ExecConsoleCommand(r0_582:GetGameInstance(), "sgm CompleteCondition " .. tostring(4220))
  r2_582.ExecConsoleCommand(r0_582:GetGameInstance(), "sgm CompleteCondition " .. tostring(4170))
  r2_582.ExecConsoleCommand(r0_582:GetGameInstance(), "sgm CompleteCondition " .. tostring(2001))
end
function r0_0.OpenOnlineActionView(r0_583, r1_583)
  -- line: [7629, 7642] id: 583
  if not r1_583 then
    r1_583 = 1
  else
    r1_583 = tonumber(r1_583)
  end
  local r2_583 = require("BluePrints.UI.WBP.BattleOnlineAction.OnlineActionController")
  if r1_583 == -1 then
    r2_583:HideBtn()
  else
    r2_583:ShowBtn(r1_583)
  end
  r2_583:GetModel():CreatFakeInvitationInfo()
end
function r0_0.OpenMultiChallenge(r0_584, r1_584)
  -- line: [7644, 7646] id: 584
  UIUtils.OpenMultiplayerChallengeLevelChoose(r1_584)
end
function r0_0.SwitchMobileHUDLayout(r0_585, r1_585)
  -- line: [7648, 7651] id: 585
  EventManager:FireEvent(EventID.OnSwitchMobileHUDLayout, tonumber(r1_585))
end
function r0_0.ChangeDSMonsterFramingNodeConfig(r0_586, r1_586, r2_586, r3_586, r4_586, r5_586)
  -- line: [7653, 7662] id: 586
  if not r1_586 or not r2_586 or not r3_586 or not r4_586 or not r5_586 then
    return 
  end
  r1_586 = tonumber(r1_586)
  r2_586 = tonumber(r2_586)
  r3_586 = tonumber(r3_586)
  r5_586 = tonumber(r5_586)
  r0_586:ServerBattleCommand("ChangeDSMonsterFramingNodeConfig", r1_586, r2_586, r3_586, r4_586, r5_586)
end
function r0_0.HideEntertainmentUI(r0_587, r1_587)
  -- line: [7664, 7697] id: 587
  local r2_587 = require("BluePrints.UI.GMInterface.GMVariable")
  if r1_587 ~= 0 then
    r1_587 = r1_587 ~= "0"
  else
    goto label_7	-- block#2 is visited secondly
  end
  if r1_587 then
    r2_587.HideEntertainmentUI = true
  else
    r2_587.HideEntertainmentUI = false
  end
  local r3_587 = GWorld.GameInstance:GetGameUIManager()
  local r4_587 = r3_587:GetUIObj("Entertainment")
  if r4_587 then
    if r1_587 then
      r4_587:SetRenderOpacity(0)
    else
      r4_587:SetRenderOpacity(1)
    end
  end
  if r1_587 then
    EventManager:AddEvent(EventID.LoadUI, r2_587.HideEntertainmentUIObj, function(r0_588, r1_588)
      -- line: [7686, 7693] id: 588
      r4_587 = r3_587:GetUIObj("Entertainment")
      if r4_587 and r2_587.HideEntertainmentUI then
        r4_587:SetRenderOpacity(0)
      end
    end)
  else
    EventManager:RemoveEvent(EventID.LoadUI, r2_587.HideEntertainmentUIObj)
  end
end
function r0_0.HideStoryUI(r0_589, r1_589)
  -- line: [7699, 7748] id: 589
  if r1_589 ~= 0 then
    r1_589 = r1_589 ~= "0"
  else
    goto label_4	-- block#2 is visited secondly
  end
  local r2_589 = require("BluePrints.UI.GMInterface.GMVariable")
  if r1_589 then
    r2_589.HideStoryUI = true
  else
    r2_589.HideStoryUI = false
  end
  local r3_589 = TalkSubsystem()
  local r4_589 = r3_589:GetAllTasks()
  if r1_589 then
    for r9_589, r10_589 in pairs(r4_589) do
      if IsValid(r10_589.UI) then
        r10_589.UI:SetRenderOpacity(0)
      end
    end
    -- close: r5_589
  else
    for r9_589, r10_589 in pairs(r4_589) do
      if IsValid(r10_589.UI) then
        r10_589.UI:SetRenderOpacity(1)
      end
    end
    -- close: r5_589
  end
  if r1_589 then
    EventManager:AddEvent(EventID.LoadUI, r2_589.HideStoryUIObj, function(r0_590, r1_590)
      -- line: [7728, 7744] id: 590
      r3_589 = TalkSubsystem()
      local r2_590 = r3_589:GetAllTasks()
      if r2_589.HideStoryUI then
        for r7_590, r8_590 in pairs(r2_590) do
          if IsValid(r8_590.UI) then
            r8_590.UI:SetRenderOpacity(0)
          end
        end
        -- close: r3_590
      else
        for r7_590, r8_590 in pairs(r2_590) do
          if IsValid(r8_590.UI) then
            r8_590.UI:SetRenderOpacity(1)
          end
        end
        -- close: r3_590
      end
    end)
  else
    EventManager:RemoveEvent(EventID.LoadUI, r2_589.HideStoryUIObj)
  end
end
function r0_0.GetAllOptPackages(r0_591, r1_591)
  -- line: [7750, 7762] id: 591
  local r2_591 = require("BluePrints.UI.GMInterface.GMFunctionLibrary")
  local r3_591 = DataMgr.Resource
  if not r1_591 then
    r1_591 = 10
  end
  for r8_591, r9_591 in pairs(r3_591) do
    if r9_591.MaterialClassify == 7 then
      r2_591.ExecConsoleCommand(r0_591:GetGameInstance(), "sgm ar " .. r8_591 .. " " .. r1_591)
      DebugPrint("ayff test resourceid:" .. r8_591)
    end
  end
  -- close: r4_591
end
function r0_0.ActorSnapShot(r0_592, r1_592, r2_592)
  -- line: [7764, 7823] id: 592
  r1_592 = tonumber(r1_592) and 0
  r2_592 = tonumber(r2_592) and 10000
  local r3_592 = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if not IsValid(r3_592) then
    Utils.ScreenPrint("Error: Player not found!")
    return 
  end
  local r4_592 = TArray(AActor)
  UE4.UGameplayStatics.GetAllActorsOfClass(r3_592, AActor:StaticClass(), r4_592)
  local r5_592 = r4_592:ToTable()
  local r6_592 = UE4.AStaticMeshActor
  local r7_592 = UE4.UInstancedStaticMeshComponent
  local r8_592 = {}
  for r13_592, r14_592 in pairs(r5_592) do
    if IsValid(r14_592) then
      local r15_592 = false
      if r14_592:IsA(r6_592) then
        r15_592 = true
      elseif r14_592:GetComponentByClass(r7_592) then
        r15_592 = true
      end
      if r15_592 then
        table.insert(r8_592, r14_592)
      end
    end
  end
  -- close: r9_592
  Utils.ScreenPrint("Static/Instanced Actors Count: " .. tostring(#r8_592))
  local r9_592 = r3_592:K2_GetActorLocation()
  local r10_592 = r1_592 * 100 * r1_592 * 100
  local r11_592 = r2_592 * 100 * r2_592 * 100
  for r16_592, r17_592 in pairs(r8_592) do
    local r19_592 = UE4.UKismetMathLibrary.VSizeSquared(r17_592:K2_GetActorLocation() - r9_592)
    local r20_592 = nil	-- notice: implicit variable refs by block#[20]
    if r10_592 <= r19_592 then
      r20_592 = r19_592 <= r11_592
    else
      goto label_120	-- block#18 is visited secondly
    end
    if r20_592 and r17_592:ActorHasTag("HiddenByActorSnapShot") then
      r17_592:SetActorHiddenInGame(false)
      r17_592.Tags:Remove("HiddenByActorSnapShot")
    elseif not r17_592.bHidden then
      r17_592:SetActorHiddenInGame(true)
      r17_592.Tags:AddUnique("HiddenByActorSnapShot")
    end
  end
  -- close: r12_592
end
function r0_0.TeleportPlayer(r0_593, r1_593, r2_593, r3_593)
  -- line: [7826, 7834] id: 593
  r1_593 = tonumber(r1_593)
  r2_593 = tonumber(r2_593)
  r3_593 = tonumber(r3_593)
  UE4.UGameplayStatics.GetPlayerCharacter(r0_593:GetGameInstance(), 0):K2_SetActorLocation(UE4.FVector(r1_593, r2_593, r3_593), false, nil, false)
end
return r0_0
