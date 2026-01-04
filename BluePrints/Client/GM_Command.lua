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
    -- line: [31, 742] id: 3
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
    -- line: [744, 747] id: 4
    r0_4:GetClientAvatar():UseCDK(r1_4)
  end,
  ShowScenarioDataOnTick = function(r0_5)
    -- line: [749, 762] id: 5
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
    -- line: [764, 790] id: 6
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
    -- line: [792, 801] id: 7
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
    -- line: [803, 812] id: 8
    local r2_8 = UIManager(r0_8:GetGameInstance())
    r1_8 = tonumber(r1_8)
    local r3_8 = r2_8:GetUIObj("BattleMain")
    r3_8.VB_PlayerBar:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r3_8:RemoveBattleTeamBloodBar(r1_8)
  end,
  CTestTeamBloodBar = function(r0_9, r1_9)
    -- line: [814, 823] id: 9
    r1_9 = tonumber(r1_9)
    local r3_9 = UIManager(r0_9:GetGameInstance()):GetUIObj("BattleMain")
    r3_9.VB_PlayerBar:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r3_9:AddBattleTeamBloodBar(r1_9, true, true)
  end,
  CTeamInviteTest = function(r0_10)
    -- line: [827, 836] id: 10
    TeamController:RecvTeamBeInvited({
      Uid = 23333,
      HeadIconId = TeamController:GetAvatar().HeadIconId,
      IsOnline = true,
      Nickname = "test2",
      Level = 3,
    })
  end,
  CInitTeamTest = function(r0_11)
    -- line: [838, 866] id: 11
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
    -- line: [868, 876] id: 12
    TeamController:RecvTeamOnAddPlayer({
      Uid = tonumber(r1_12),
      HeadIconId = TeamController:GetAvatar().HeadIconId,
      IsOnline = true,
      Nickname = "test2",
    })
  end,
  CDelTeammateTest = function(r0_13, r1_13)
    -- line: [878, 906] id: 13
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
    -- line: [908, 911] id: 14
    r1_14 = tonumber(r1_14)
    ChatCommon.IgnoreSensitiveCheck = r1_14 == 0
  end,
  ChatToOtherPlayer = function(r0_15, r1_15, r2_15, r3_15)
    -- line: [913, 919] id: 15
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
    -- line: [921, 924] id: 16
    require("EMCache.EMCache"):Reset()
  end,
  ExecuteGM = function(r0_17, r1_17, r2_17, r3_17, r4_17, r5_17)
    -- line: [927, 935] id: 17
    if r5_17 then
      r0_17:DedicatedServerGM(r1_17, r2_17, r3_17)
    elseif r4_17 then
      r0_17:ClientGM(r1_17, r2_17, r3_17)
    else
      r0_17:ServerGM(r2_17, r3_17)
    end
  end,
  DedicatedServerGM = function(r0_18, r1_18, r2_18, r3_18)
    -- line: [938, 952] id: 18
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
    -- line: [955, 1027] id: 19
    local function r4_19(r0_20)
      -- line: [957, 966] id: 20
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
    -- line: [1030, 1037] id: 21
    DebugPrint(string.format("ServerGM, %s, %s", r1_21, r2_21))
    local r3_21 = {}
    for r8_21 in string.gmatch(r2_21, "%S+") do
      table.insert(r3_21, r8_21)
    end
    -- close: r4_21
    r0_21:Server_Command(r1_21, r3_21)
  end,
  ServerBattleCommand = function(r0_22, r1_22, ...)
    -- line: [1040, 1064] id: 22
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
    -- line: [1068, 1087] id: 23
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
    -- line: [1090, 1110] id: 24
    local r3_24 = r0_24:GetClientAvatar()
    if r3_24 == nil then
      ScreenPrint("can not find avatar")
      return 
    end
    r3_24:CallServer("DoGmCommand", function(r0_25, ...)
      -- line: [1097, 1108] id: 25
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
    -- line: [1113, 1117] id: 26
    UUnLuaFunctionLibrary.HotReload()
  end,
  Hotfix = function(r0_27, ...)
    -- line: [1120, 1130] id: 27
    local r1_27 = require("Datas.HotfixData")
    assert(r1_27.index, "需要填写HotfixData.index")
    assert(r1_27.script, "需要填写HotfixData.script")
    local r2_27 = require("UnLuaHotReload")
    require("HotFix").ExecHotFix(r1_27.index, r1_27.script)
    GWorld.HotfixDataIndex = r1_27.index
    r0_27:ServerBattleCommand("Hotfix")
  end,
  GetAvatar = function(r0_28, ...)
    -- line: [1132, 1151] id: 28
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
    -- line: [1153, 1162] id: 29
    local r1_29 = r0_29:GetClientAvatar()
    if not r1_29 then
      return 
    end
    r1_29:GetServerAvatar(...)
  end,
  LowQuality = function(r0_30)
    -- line: [1164, 1177] id: 30
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
    -- line: [1190, 1201] id: 31
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
    -- line: [1203, 1208] id: 32
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
    -- line: [1210, 1225] id: 33
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
    -- line: [1227, 1250] id: 34
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
    -- line: [1252, 1265] id: 35
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
    -- line: [1267, 1272] id: 36
    UE4.UUIStateAsyncActionBase.ShowGuideUI(r0_36:GetGameInstance(), tonumber(r1_36))
  end,
  CreateNpc = function(r0_37, r1_37, r2_37, r3_37)
    -- line: [1274, 1278] id: 37
    r0_37:ServerBattleCommand("CreateNpc", r1_37, r2_37, r3_37, "StaticCreator")
  end,
  CreatePet = function(r0_38, r1_38, r2_38, r3_38)
    -- line: [1280, 1284] id: 38
    r0_38:ServerBattleCommand("CreatePet", r1_38, r2_38, r3_38, "StaticCreator")
  end,
  CreateMonster = function(r0_39, r1_39, r2_39, r3_39)
    -- line: [1286, 1290] id: 39
    r0_39:ServerBattleCommand("CreateMonster", r0_39.Player.Eid, r1_39, r2_39, r3_39, "StaticCreator")
  end,
  CreateMonsterSpawnMonster = function(r0_40, r1_40, r2_40, r3_40)
    -- line: [1292, 1296] id: 40
    r0_40:ServerBattleCommand("CreateMonster", r0_40.Player.Eid, r1_40, r2_40, r3_40, "MonsterSpawn")
  end,
  CreateTestMonster = function(r0_41, r1_41, r2_41)
    -- line: [1298, 1303] id: 41
    r0_41:ServerBattleCommand("CreateTestMonster", r0_41.Player.Eid, r1_41, r2_41)
  end,
  GuideBookFinishSomething = function(r0_42, r1_42, r2_42)
    -- line: [1305, 1312] id: 42
    local r3_42 = GWorld:GetAvatar()
    print(_G.LogTag, "GMGuideBookFinishSomething", r1_42, r2_42)
    if tonumber(r2_42) ~= nil then
      r2_42 = tonumber(r2_42)
    end
    r3_42:GuideBookFinishSomething(r1_42, r2_42)
  end,
  EchoAvatar = function(r0_43, r1_43)
    -- line: [1313, 1316] id: 43
    GWorld:GetAvatar():EchoAvatar(r1_43)
  end,
  CreatePhantom = function(r0_44, r1_44, r2_44, r3_44, r4_44, r5_44, r6_44, r7_44, r8_44)
    -- line: [1318, 1349] id: 44
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
    -- line: [1351, 1354] id: 45
    local r1_45 = GWorld:GetAvatar()
    r0_45:ServerBattleCommand("ClearPhantoms", r0_45.Player.Eid)
  end,
  KillAllPhantoms = function(r0_46)
    -- line: [1356, 1358] id: 46
    r0_46:ServerBattleCommand("KillAllPhantoms")
  end,
  CreateMechanismSummon = function(r0_47, r1_47, r2_47)
    -- line: [1360, 1370] id: 47
    if not r1_47 or r1_47 == 0 then
      ScreenPrint(string.format("CreateMechanismSummon Error,UnitId:%s", tostring(r1_47)))
      return 
    end
    r0_47:ServerBattleCommand("CreateMechanismSummon", r0_47.Player.Eid, r1_47, r2_47)
  end,
  KillMonster = function(r0_48, r1_48)
    -- line: [1373, 1378] id: 48
    r0_48:ServerBattleCommand("KillMonster", r0_48.Player.Eid, r1_48)
  end,
  RecoverySelf = function(r0_49)
    -- line: [1380, 1385] id: 49
    r0_49:ServerBattleCommand("RecoverySelf", r0_49.Player.Eid)
  end,
  RecoverPlayer = function(r0_50, r1_50, r2_50, r3_50)
    -- line: [1387, 1391] id: 50
    r0_50:ServerBattleCommand("RecoverPlayer", r0_50.Player.Eid, r1_50, r2_50, r3_50)
  end,
  HideMonsterCapsule = function(r0_51, r1_51)
    -- line: [1393, 1407] id: 51
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
    -- line: [1409, 1422] id: 52
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
    -- line: [1424, 1436] id: 53
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
    -- line: [1438, 1462] id: 54
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
    -- line: [1464, 1476] id: 55
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
    -- line: [1478, 1503] id: 56
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
    -- line: [1505, 1518] id: 57
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
    -- line: [1520, 1531] id: 58
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
    -- line: [1533, 1538] id: 59
    GWorld:GetAvatar():GMCleanAllQuest()
  end,
  ChangeToNewModel = function(r0_60, r1_60)
    -- line: [1540, 1557] id: 60
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
    -- line: [1559, 1570] id: 61
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
    -- line: [1572, 1582] id: 62
    if r1_62 == nil then
      ScreenPrint(string.format("当前远程武器剩余子弹数量: %s", r0_62.Player.RangedWeapon:GetAttr("BulletNum")))
    else
      r1_62 = tonumber(r1_62)
      r0_62.Player.RangedWeapon:SetAttr("BulletNum", r1_62)
    end
  end,
  ForbidDamage = function(r0_63)
    -- line: [1584, 1592] id: 63
    local r1_63 = false
    if r0_63.Player then
      r1_63 = require("EMLuaConst").bForbidDamage
    end
    r0_63:ServerBattleCommand("ForbidDamage", not r1_63)
  end,
  ForbidPlay = function(r0_64)
    -- line: [1594, 1602] id: 64
    local r1_64 = false
    if r0_64.Player then
      r1_64 = require("EMLuaConst").bForbidPlay
    end
    r0_64:ServerBattleCommand("ForbidPlay", not r1_64)
  end,
  TestBattle = function(r0_65, r1_65)
    -- line: [1604, 1608] id: 65
    r0_65:ServerBattleCommand("TestBattle", r1_65)
  end,
  GetOrSetPlayerAttr = function(r0_66, r1_66, r2_66)
    -- line: [1625, 1634] id: 66
    if not r1_66 then
      ScreenPrint(string.format("至少需要传入属性名才可进行查询操作"))
    else
      r0_66:ServerBattleCommand("GetOrSetPlayerAttr", r0_66.Player.Eid, r1_66, r2_66)
    end
  end,
  GetOrSetPlayerWeaponAttr = function(r0_67, r1_67, r2_67, r3_67)
    -- line: [1636, 1645] id: 67
    if not r1_67 or not r2_67 then
      ScreenPrint(string.format("至少需要传入武器编号和属性名才可进行查询操作"))
    else
      r0_67:ServerBattleCommand("GetOrSetPlayerWeaponAttr", r0_67.Player.Eid, r1_67, r2_67, r3_67)
    end
  end,
  RandomCreateTest = function(r0_68, r1_68, r2_68)
    -- line: [1647, 1690] id: 68
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
      -- line: [1663, 1672] id: 69
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
    -- line: [1692, 1698] id: 70
    r0_70:ServerBattleCommand("MaxBullet", r0_70.Player.Eid)
    Battle(r0_70.Player):GM_MaxBullet(r0_70.Player.Eid)
  end,
  MaxMagazineBullet = function(r0_71)
    -- line: [1700, 1705] id: 71
    r0_71:ServerBattleCommand("MaxMagazineBullet", r0_71.Player.Eid)
  end,
  MaxAttack = function(r0_72)
    -- line: [1707, 1712] id: 72
    r0_72:ServerBattleCommand("MaxAttack", r0_72.Player.Eid)
  end,
  MaxDefence = function(r0_73)
    -- line: [1714, 1719] id: 73
    r0_73:ServerBattleCommand("MaxDefence", r0_73.Player.Eid)
  end,
  MaxSp = function(r0_74)
    -- line: [1721, 1726] id: 74
    r0_74:ServerBattleCommand("MaxSp", r0_74.Player.Eid)
  end,
  AddSp = function(r0_75, r1_75)
    -- line: [1728, 1733] id: 75
    r0_75:ServerBattleCommand("AddSp", r0_75.Player.Eid, tonumber(r1_75))
  end,
  MaxHp = function(r0_76)
    -- line: [1735, 1740] id: 76
    r0_76:ServerBattleCommand("MaxHp", r0_76.Player.Eid)
  end,
  AddHp = function(r0_77, r1_77)
    -- line: [1742, 1747] id: 77
    r0_77:ServerBattleCommand("AddHp", r0_77.Player.Eid, tonumber(r1_77))
  end,
  MaxES = function(r0_78)
    -- line: [1749, 1754] id: 78
    r0_78:ServerBattleCommand("MaxES", r0_78.Player.Eid)
  end,
  AddES = function(r0_79, r1_79)
    -- line: [1756, 1761] id: 79
    r0_79:ServerBattleCommand("AddES", r0_79.Player.Eid, tonumber(r1_79))
  end,
  God = function(r0_80)
    -- line: [1763, 1775] id: 80
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
    -- line: [1777, 1783] id: 81
    if Battle(r0_81.Player).IsFullTriggerProbability then
      Battle(r0_81.Player).IsFullTriggerProbability = false
    else
      Battle(r0_81.Player).IsFullTriggerProbability = true
    end
  end,
  AddMod = function(r0_82, r1_82, r2_82, r3_82)
    -- line: [1785, 1800] id: 82
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
    -- line: [1804, 1807] id: 83
    r1_83 = tonumber(r1_83)
    ModCommon.DebugMode = r1_83 == 1
  end,
  DefCoreGod = function(r0_84)
    -- line: [1809, 1825] id: 84
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
    -- line: [1827, 1833] id: 85
    r0_85:MaxBullet()
    r0_85:MaxMagazineBullet()
  end,
  NoCDForSkill = function(r0_86)
    -- line: [1835, 1843] id: 86
    for r5_86, r6_86 in pairs(r0_86.Player.Skills) do
      r6_86:ResetSkillCd()
    end
    -- close: r1_86
    Battle(r0_86.Player):GM_NoCDForSkill(r0_86.Player.Eid)
    r0_86:ServerBattleCommand("NoCDForSkill", r0_86.Player.Eid)
  end,
  UpdateMonCd = function(r0_87)
    -- line: [1845, 1850] id: 87
    Battle(r0_87.Player):GM_UpdateMonSkillCd()
    r0_87:ServerBattleCommand("UpdateMonSkillCd")
  end,
  FireDanmaku = function(r0_88, r1_88, r2_88)
    -- line: [1852, 1859] id: 88
    r1_88 = tonumber(r1_88)
    r2_88 = tonumber(r2_88)
    assert(DataMgr.DanmakuTemplate[r1_88], "弹幕模板编号不存在")
    r0_88:ServerBattleCommand("FireDanmaku", r0_88.Player.Eid, r1_88, r2_88, "")
  end,
  MonsterMaxHp = function(r0_89)
    -- line: [1861, 1866] id: 89
    r0_89:ServerBattleCommand("MonsterMaxHp")
  end,
  DebugMonsterSpawn = function(r0_90)
    -- line: [1868, 1872] id: 90
    local r1_90 = UE.UGameplayStatics.GetGameMode(r0_90.Player)
    r1_90.DebugMonsterSpawn = not r1_90.DebugMonsterSpawn
  end,
  DebugPrintMonsterSpawn = function(r0_91)
    -- line: [1874, 1878] id: 91
    local r1_91 = UE.UGameplayStatics.GetGameMode(r0_91.Player)
    r1_91.DebugPrintMonsterSpawn = not r1_91.DebugPrintMonsterSpawn
  end,
  GuideAllMonster = function(r0_92)
    -- line: [1881, 1888] id: 92
    local r1_92 = UE.UGameplayStatics.GetGameMode(r0_92.Player)
    for r6_92, r7_92 in pairs(r1_92.EMGameState.MonsterMap) do
      if IsValid(r7_92) and not r7_92:IsDead() then
        r1_92.EMGameState:AddGuideEid(r6_92)
      end
    end
    -- close: r2_92
  end,
  PrintLevelDebugInfo = function(r0_93)
    -- line: [1891, 1924] id: 93
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
    -- line: [1926, 1959] id: 94
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
    -- line: [1961, 1977] id: 95
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
    -- line: [1979, 1995] id: 96
    if UE.UGameplayStatics.GetGameState(r0_96.Player):IsInDungeon() then
      try({
        exec = function()
          -- line: [1983, 1985] id: 97
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
    -- line: [1997, 2025] id: 98
    local r2_98 = UE4.URuntimeCommonFunctionLibrary.GetLevelLoadJsonName(r0_98.Player)
    local function r3_98(r0_99)
      -- line: [1999, 2006] id: 99
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
    -- line: [2027, 2058] id: 100
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
    -- line: [2060, 2100] id: 101
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
    -- line: [2103, 2105] id: 102
    r0_102.Player.RPCComponent:RequestSnapShotInfo()
  end,
  RequestMonsterCacheInfo = function(r0_103)
    -- line: [2107, 2109] id: 103
    r0_103.Player.RPCComponent:RequestMonsterCacheInfo()
  end,
  RequestStaticCreatorInfo = function(r0_104)
    -- line: [2111, 2113] id: 104
    r0_104.Player.RPCComponent:RequestStaticCreatorInfo()
  end,
  PrintActorSCLoc = function(r0_105, r1_105)
    -- line: [2115, 2132] id: 105
    local r2_105 = tonumber(r1_105)
    local r3_105 = Battle(r0_105.Player):GetEntity(r2_105)
    if not r3_105 then
      return 
    end
    local r4_105 = r3_105:GetName()
    r0_105.Player:AddTimer(0.1, function()
      -- line: [2125, 2129] id: 106
      DebugPrint("PrintActorSCLoc Actor Eid:", r2_105, "Name:", r4_105, " Loc:", r3_105:K2_GetActorLocation(), "Rot:", r3_105:K2_GetActorRotation())
    end, true)
    r0_105:DedicatedServerCommand("PrintActorSCLoc", r2_105)
  end,
  LJLTEST = function(r0_107, r1_107)
    -- line: [2134, 2174] id: 107
    r0_107.Player.RPCComponent:NotifyServerStartDelivery()
  end,
  YXDTEST = function(r0_108, r1_108)
    -- line: [2176, 2223] id: 108
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
    -- line: [2225, 2264] id: 109
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
    -- line: [2266, 2287] id: 110
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
    -- line: [2289, 2349] id: 111
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
          -- line: [2315, 2317] id: 112
          r3_111:LoadOrUnloadLevelDynamically("Prologue_Main_01_Art_Breakable", false)
        end, false, 0)
        r0_111.Player:AddTimer(0.4, function()
          -- line: [2318, 2320] id: 113
          r3_111:LoadOrUnloadLevelDynamically("Prologue_Main_01_Art_Breakable", true)
        end, false, 0)
        r0_111.Player:AddTimer(0.6, function()
          -- line: [2321, 2323] id: 114
          r3_111:LoadOrUnloadLevelDynamically("Prologue_Main_01_Art_Breakable", false)
        end, false, 0)
        r0_111.Player:AddTimer(0.8, function()
          -- line: [2324, 2326] id: 115
          r3_111:LoadOrUnloadLevelDynamically("Prologue_Main_01_Art_Breakable", true)
        end, false, 0)
        r0_111.Player:AddTimer(1, function()
          -- line: [2327, 2329] id: 116
          r3_111:LoadOrUnloadLevelDynamically("Prologue_Main_01_Art_Breakable", false)
        end, false, 0)
        r0_111.Player:AddTimer(1.2, function()
          -- line: [2330, 2332] id: 117
          r3_111:LoadOrUnloadLevelDynamically("Prologue_Main_01_Art_Breakable", true)
        end, false, 0)
        r0_111.Player:AddTimer(1.4, function()
          -- line: [2333, 2335] id: 118
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
    -- line: [2351, 2367] id: 119
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
    -- line: [2369, 2381] id: 120
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
    -- line: [2383, 2394] id: 121
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
    -- line: [2396, 2409] id: 122
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
    -- line: [2411, 2417] id: 123
    r1_123 = tonumber(r1_123)
    r2_123 = tonumber(r2_123)
    Battle(r0_123.Player):AddGlobalPassive(r1_123, r0_123.Player, r2_123)
  end,
  RemoveAllGP = function(r0_124)
    -- line: [2419, 2421] id: 124
    Battle(r0_124.Player):RemoveAllGlobalPassives()
  end,
  PrintGP = function(r0_125)
    -- line: [2423, 2425] id: 125
    Battle(r0_125.Player):PrintCurrentGlobalPassives()
  end,
  PrintMarks = function(r0_126, r1_126)
    -- line: [2427, 2434] id: 126
    local r2_126 = r0_126.Player
    if r1_126 then
      r2_126 = Battle(r0_126.Player):GetEntity(tonumber(r1_126))
    end
    Battle(r0_126):PrintMarksFromTarget(r2_126)
  end,
  RemoveBuff = function(r0_127, r1_127)
    -- line: [2436, 2444] id: 127
    r1_127 = tonumber(r1_127)
    assert(r1_127, "BuffId要填数字")
    assert(DataMgr.Buff[r1_127], "找不到[" .. tostring(r1_127) .. "]对应的Buff")
    r0_127:ServerBattleCommand("RemoveBuff", r0_127.Player.Eid, r1_127)
  end,
  AddMonsterBuff = function(r0_128, r1_128, r2_128)
    -- line: [2446, 2450] id: 128
    r0_128:AddMonsterBuffDuration(r1_128, -1, r2_128)
  end,
  AddMonsterBuffDuration = function(r0_129, r1_129, r2_129, r3_129)
    -- line: [2452, 2463] id: 129
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
    -- line: [2465, 2473] id: 130
    r1_130 = tonumber(r1_130)
    assert(r1_130, "BuffId要填数字")
    assert(DataMgr.Buff[r1_130], "找不到[" .. tostring(r1_130) .. "]对应的Buff")
    r0_130:ServerBattleCommand("RemoveMonsterBuff", r1_130)
  end,
  StartXibiBoss = function(r0_131)
    -- line: [2475, 2490] id: 131
    local function r1_131(...)
      -- line: [2478, 2481] id: 132
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
    -- line: [2492, 2522] id: 133
    print(_G.LogTag, "UnlockHardBoss", r1_133)
    local function r2_133(r0_134)
      -- line: [2494, 2508] id: 134
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
    -- line: [2524, 2534] id: 135
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
    -- line: [2536, 2546] id: 136
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
    -- line: [2548, 2555] id: 137
    local r3_137 = require("BluePrints.UI.GMInterface.GMFunctionLibrary")
    local r4_137 = "sgm AddRougeLikeToken " .. r1_137
    if r2_137 then
      r4_137 = r4_137 .. " " .. r2_137
    end
    r3_137.ExecConsoleCommand(r0_137:GetGameInstance(), r4_137)
  end,
  GetRougeLikeToken = function(r0_138)
    -- line: [2557, 2562] id: 138
    local r1_138 = GWorld:GetAvatar()
    if r1_138 then
      print(_G.LogTag, "GetRougeLikeCurrency", r1_138:GetCurrentRougeLikeToken())
    end
  end,
  RougeLikePassRoom = function(r0_139, r1_139)
    -- line: [2564, 2575] id: 139
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
    -- line: [2577, 2582] id: 140
    _G.DrawDebugTest = not _G.DrawDebugTest
    Battle(r0_140.Player).DrawDebugTest = _G.DrawDebugTest
  end,
  ResetLoc = function(r0_141)
    -- line: [2584, 2589] id: 141
    UE.UGameplayStatics.GetGameMode(r0_141.Player):SetPlayerSafeLoction(r0_141.Player.Eid)
  end,
  ChangeCharCornerVisibility = function(r0_142, r1_142)
    -- line: [2591, 2605] id: 142
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
    -- line: [2607, 2609] id: 143
    r0_143.Player:TeleportToCloestTeleportPoint()
  end,
  UpWeaponGradeLevel = function(r0_144, r1_144, r2_144, r3_144, r4_144, r5_144, r6_144, r7_144)
    -- line: [2611, 2635] id: 144
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
    -- line: [2637, 2656] id: 145
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
    -- line: [2658, 2670] id: 146
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
    -- line: [2672, 2690] id: 147
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
    -- line: [2692, 2709] id: 148
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
    -- line: [2711, 2727] id: 149
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
    -- line: [2729, 2742] id: 150
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
    -- line: [2744, 2757] id: 151
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
    -- line: [2759, 2773] id: 152
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
    -- line: [2775, 2788] id: 153
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
    -- line: [2790, 2803] id: 154
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
    -- line: [2805, 2819] id: 155
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
    -- line: [2821, 2833] id: 156
    local r1_156 = r0_156:GetClientAvatar()
    local r2_156 = r1_156.Chars[r1_156.CurrentChar]
    if not r1_156 then
      return 
    end
    r1_156:UpCharGradeLevel(r2_156.Uuid, tonumber(r2_156.GradeLevel))
  end,
  CharBreak = function(r0_157, r1_157, r2_157)
    -- line: [2836, 2849] id: 157
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
    -- line: [2851, 2877] id: 158
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
    -- line: [2879, 2881] id: 159
    UE4.UGameplayStatics.SetGlobalTimeDilation(r0_159.Player, tonumber(r1_159))
  end,
  MonsterTimeDilation = function(r0_160, r1_160)
    -- line: [2883, 2893] id: 160
    if r0_160:HasTargetMonster() == false or not r1_160 then
      return 
    end
    if r1_160 == 0 then
      r0_160.Player:RemoveTimer("MonsterTimeDilationTimer", true)
      r0_160.Monster.CustomTimeDilation = 1
    else
      r0_160.Player:AddTimer(0.01, function()
        -- line: [2889, 2891] id: 161
        r0_160.Monster.CustomTimeDilation = tonumber(r1_160)
      end, true, 0, "MonsterTimeDilationTimer", true)
    end
  end,
  SetMonsterCrouch = function(r0_162, r1_162)
    -- line: [2895, 2899] id: 162
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
    -- line: [2901, 2914] id: 163
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
    -- line: [2916, 2920] id: 164
    if r0_164:HasTargetMonster() == false then
      return 
    end
    r0_164.Monster:StopBT("GM")
  end,
  StartAI = function(r0_165, ...)
    -- line: [2922, 2926] id: 165
    if r0_165:HasTargetMonster() == false then
      return 
    end
    r0_165.Monster:StartBT()
  end,
  Target = function(r0_166, ...)
    -- line: [2928, 2932] id: 166
    if r0_166:HasTargetMonster() == false then
      return 
    end
    r0_166.Monster:BBSetTarget(Battle(r0_166.Player):GetCharacter(r0_166.Player.Eid))
  end,
  TargetAll = function(r0_167, ...)
    -- line: [2935, 2942] id: 167
    for r6_167, r7_167 in pairs(Battle(r0_167.Player):GetAllEntities()) do
      if r7_167 and r7_167.IsMonster and r7_167:IsMonster() then
        r7_167:BBSetTarget(Battle(r0_167.Player):GetCharacter(r0_167.Player.Eid))
      end
    end
    -- close: r2_167
  end,
  MoveTo = function(r0_168, ...)
    -- line: [2944, 2951] id: 168
    if r0_168:HasTargetMonster() == false then
      return 
    end
    local r1_168 = r0_168.Monster:GetController()
    r0_168.Monster:GetMovementComponent():SetAvoidanceEnabled(true)
    r1_168:MoveToLocation(r0_168.Player:K2_GetActorLocation(), 1, true, true, false, true, nil, true)
  end,
  ReuseSkill = function(r0_169, r1_169, r2_169)
    -- line: [2953, 2955] id: 169
    r0_169:ServerBattleCommand("ReuseSkill", r1_169, r2_169, r0_169.Player.Eid)
  end,
  HasTargetMonster = function(r0_170)
    -- line: [2957, 2968] id: 170
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
    -- line: [2970, 2974] id: 171
    require("BluePrints.UI.GMInterface.GMFunctionLibrary").SetTakeRecorderCapture(r0_171.Player, r1_171 == "1")
  end,
  UseDungeonLevelBounds = function(r0_172, r1_172)
    -- line: [2976, 2978] id: 172
    _G.UseDungeonLevelBounds = r1_172 == "1"
  end,
  UseMinimumLoad = function(r0_173, r1_173)
    -- line: [2980, 2982] id: 173
    _G.UseMinimumLoad = r1_173 ~= "0"
  end,
  GameModeEnable = function(r0_174, r1_174)
    -- line: [2984, 2989] id: 174
    r0_174:GetGameInstance().IsGameModeEnable = r1_174 ~= "false"
    DebugPrint("GM_GameMode逻辑设置是否启用", r0_174:GetGameInstance().IsGameModeEnable)
  end,
  MoveDebug = function(r0_175, r1_175)
    -- line: [2991, 3001] id: 175
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
    -- line: [3003, 3013] id: 176
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
    -- line: [3015, 3026] id: 177
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
    -- line: [3028, 3037] id: 178
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
    -- line: [3039, 3048] id: 179
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
    -- line: [3054, 3056] id: 180
    r0_180:RunStoryline("test_czc.story")
  end,
  TestStory1 = function(r0_181, r1_181, r2_181, r3_181)
    -- line: [3058, 3060] id: 181
    r0_181:RunStoryline("test_czc1.story")
  end,
  RunStoryline = function(r0_182, r1_182, r2_182, r3_182)
    -- line: [3062, 3064] id: 182
    GWorld.StoryMgr:RunStory(r1_182, r2_182, r3_182)
  end,
  StopStoryline = function(r0_183, r1_183)
    -- line: [3066, 3075] id: 183
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
    -- line: [3077, 3079] id: 184
    GWorld.StoryMgr:RunQuest(tonumber(r1_184))
  end,
  SkipQuest = function(r0_185, r1_185)
    -- line: [3081, 3083] id: 185
    GWorld.StoryMgr:CompleteQuest(tonumber(r1_185))
  end,
  RemoveAllImpression = function(r0_186)
    -- line: [3085, 3093] id: 186
    local r1_186 = GWorld:GetAvatar()
    if r1_186 then
      r1_186:CallServer("GMRemoveAllmpressionRegionData", function(r0_187)
        -- line: [3088, 3090] id: 187
        r0_186.logger.debug("ZJT_ GMRemoveAllmpressionRegionData ", r0_187)
      end)
    end
  end,
  TestImpression = function(r0_188)
    -- line: [3096, 3128] id: 188
  end,
  FinishImpressionTalk = function(r0_189, r1_189)
    -- line: [3130, 3158] id: 189
    r1_189 = tonumber(r1_189)
    local r2_189 = ""
    local function r3_189()
      -- line: [3133, 3137] id: 190
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
        -- line: [3155, 3157] id: 191
        DebugPrint("Log: Impression Talk Finished", r1_189)
      end
    })
  end,
  ImpressionCheckByEnumId = function(r0_192, r1_192, r2_192, r3_192, r4_192)
    -- line: [3164, 3185] id: 192
    local r5_192 = GWorld:GetAvatar()
    local r6_192 = ""
    local function r7_192()
      -- line: [3167, 3171] id: 193
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
    -- line: [3189, 3210] id: 194
    local r3_194 = GWorld:GetAvatar()
    local r4_194 = ""
    local function r5_194()
      -- line: [3192, 3196] id: 195
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
    -- line: [3212, 3227] id: 196
    local r2_196 = GWorld:GetAvatar()
    if r2_196 == nil then
      DebugPrint(_G.ErrorTag, "Complete dialogue by text failed, Avatar is nil.")
      return 
    end
    string.gsub(r1_196, "DialogueHasRead:%[(%d+)%]", function(r0_197)
      -- line: [3219, 3226] id: 197
      r0_197 = tonumber(r0_197)
      if DataMgr.DialogueId2WikiTextIds[r0_197] == nil then
        DebugPrint(_G.ErrorTag, string.format("Complete dialogue by text failed, dialogue id %d not exist in dialogue id to wiki text ids data.", r0_197))
        return 
      end
      r2_196:CompletedDialogue(r0_197)
    end)
  end,
  ForceSetStorySkipable = function(r0_198, r1_198)
    -- line: [3229, 3235] id: 198
    local r2_198 = TalkSubsystem()
    if r2_198 then
      r2_198:ForceSetStorySkipable(r1_198)
      return true
    end
  end,
  PlayTalk = function(r0_199, r1_199, r2_199)
    -- line: [3242, 3288] id: 199
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
          -- line: [3268, 3269] id: 200
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
        -- line: [3281, 3284] id: 201
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
    -- line: [3290, 3337] id: 202
    local r1_202 = {}
    local function r2_202(r0_203)
      -- line: [3292, 3298] id: 203
      r0_203 = string.gsub(r0_203, "[/\\]", ".")
      if string.sub(r0_203, -6) == ".story" then
        r0_203 = string.sub(r0_203, 1, string.len(r0_203) + -6)
      end
      return r0_203
    end
    local function r3_202(r0_204)
      -- line: [3299, 3306] id: 204
      local r1_204, r2_204 = pcall(require, r0_204)
      if r1_204 then
        return r2_204
      else
        return nil
      end
    end
    local r4_202 = "../../Content/Script/StoryCreator/StoryFiles/"
    local function r5_202(r0_205, r1_205)
      -- line: [3308, 3328] id: 205
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
    -- line: [3340, 3350] id: 206
    DebugPrint("lhr@ScanForDuplicatedTalk")
    r1_206 = not not r1_206
    local r4_206 = URuntimeCommonFunctionLibrary.ScanForDuplicatedTalk(GWorld.GameInstance, UE4.UKismetSystemLibrary.GetProjectContentDirectory() .. "../Tools/storycreator/talk_nodes.json", r1_206)
    local r5_206 = require("Utils.TimeUtils")
    UE.URuntimeCommonFunctionLibrary.SaveFile(UEMPathFunctionLibrary.GetProjectSavedDirectory() .. "Talk/" .. "DuplicatedTalkData_" .. tostring(r5_206.TimeToYMDHMSStr(r5_206.RealTime(), false, "_", "_")) .. ".txt", r4_206)
  end,
  CreateSTLNode = function(r0_207, r1_207, r2_207)
    -- line: [3352, 3373] id: 207
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
    -- line: [3375, 3399] id: 208
    local r4_208 = r0_208:CreateSTLNode(r1_208, r2_208)
    local r5_208 = nil
    local r6_208 = r4_208.Finish
    if r3_208 then
      local r7_208 = string.lower(r3_208)
      if r7_208 == "success" then
        function r5_208(...)
          -- line: [3384, 3387] id: 209
          r6_208(r4_208)
          r4_208:ClearWhenQuestSuccess()
        end
      elseif r7_208 == "fail" then
        function r5_208(...)
          -- line: [3389, 3392] id: 210
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
    -- line: [3401, 3420] id: 211
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
    -- line: [3439, 3442] id: 212
    require("Utils.MonsterAnimationUtils"):LookAtMonster(r1_212)
  end,
  QuitMAU = function(r0_213)
    -- line: [3444, 3447] id: 213
    require("Utils.MonsterAnimationUtils"):QuitMAUtil()
  end,
  UseSkill = function(r0_214, r1_214, r2_214)
    -- line: [3449, 3452] id: 214
    require("Utils.MonsterAnimationUtils"):UseSkill(r1_214, r2_214)
  end,
  Focus = function(r0_215, r1_215)
    -- line: [3454, 3457] id: 215
    require("Utils.MonsterAnimationUtils"):Focus(tonumber(r1_215))
  end,
  SetSpeed = function(r0_216, r1_216)
    -- line: [3459, 3462] id: 216
    require("Utils.MonsterAnimationUtils"):SetSpeed(tonumber(r1_216))
  end,
  HeadScale = function(r0_217, r1_217, r2_217)
    -- line: [3464, 3471] id: 217
    local r4_217 = Battle(r0_217.Player):GetEntity(tonumber(r1_217))
    if r4_217.EMAnimInstance then
      r4_217.EMAnimInstance.HeadScale = r2_217
    end
  end,
  UpperArmScale = function(r0_218, r1_218)
    -- line: [3473, 3476] id: 218
    r0_218.Player.PlayerAnimInstance.UpperArmScale = r1_218
  end,
  LowerArmScale = function(r0_219, r1_219)
    -- line: [3478, 3481] id: 219
    r0_219.Player.PlayerAnimInstance.LowerArmScale = r1_219
  end,
  HandScale = function(r0_220, r1_220)
    -- line: [3483, 3486] id: 220
    r0_220.Player.PlayerAnimInstance.TargetHandScale = r1_220
  end,
  UpdateVLM = function(r0_221)
    -- line: [3488, 3491] id: 221
    URuntimeCommonFunctionLibrary.UpdateFoliageVLM(r0_221.Player)
  end,
  ChangeCreatureSpeed = function(r0_222, r1_222)
    -- line: [3493, 3497] id: 222
    Const.SkillCreatureSpeed = r1_222
    require("EMLuaConst").SkillCreatureSpeed = Const.SkillCreatureSpeed
    r0_222:ServerBattleCommand("ChangeCreatureSpeed", r1_222)
  end,
  ShowSkillCreature = function(r0_223)
    -- line: [3499, 3501] id: 223
    UE4.URuntimeCommonFunctionLibrary.ShowSkillCreature()
  end,
  ShowRayCreature = function(r0_224)
    -- line: [3503, 3506] id: 224
    Const.IsShowRayCreature = not Const.IsShowRayCreature
    require("EMLuaConst").IsShowRayCreature = Const.IsShowRayCreature
  end,
  AnimCacheEnableState = function(r0_225, r1_225)
    -- line: [3508, 3512] id: 225
    UE4.URuntimeCommonFunctionLibrary.EnableGlobalAnimCache(r0_225.Player, tonumber(r1_225) > 0)
  end,
  DisconnectServer = function(r0_226)
    -- line: [3514, 3520] id: 226
    local r1_226 = r0_226:GetClientAvatar()
    if r1_226 then
      r1_226:DisconnectServer()
    end
  end,
  ExitBattle = function(r0_227, r1_227)
    -- line: [3522, 3540] id: 227
    r1_227 = tonumber(r1_227)
    if r1_227 == 1 then
      r1_227 = true and false
    else
      goto label_9	-- block#2 is visited secondly
    end
    if IsStandAlone(r0_227:GetGameInstance()) then
      local r2_227 = r0_227:GetClientAvatar()
      if r2_227 then
        r2_227:ExitBattle(r1_227)
      end
    elseif r1_227 then
      r0_227:DedicatedServerCommand("DungeonWin")
    else
      r0_227:DedicatedServerCommand("DungeonFailed")
    end
  end,
  PlayerEnd = function(r0_228, r1_228)
    -- line: [3542, 3558] id: 228
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
      r0_228:DedicatedServerCommand("PlayerWin")
    else
      r0_228:DedicatedServerCommand("PlayerFailed")
    end
  end,
  SetInvincible = function(r0_229, r1_229)
    -- line: [3560, 3565] id: 229
    Battle(UE4.UGameplayStatics.GetPlayerCharacter(r0_229:GetGameInstance(), 0)):GetEntity(tonumber(r1_229)):SetInvincible(true, "GM")
  end,
  GetDrop = function(r0_230, r1_230, r2_230)
    -- line: [3567, 3600] id: 230
    r1_230 = tonumber(r1_230)
    r2_230 = tonumber(r2_230)
    local r3_230 = r0_230:GetGameInstance()
    local r4_230 = r3_230:GetSceneManager()
    local r5_230 = UE4.UGameplayStatics.GetGameMode(r3_230)
    local r6_230 = DataMgr.Drop[r1_230]
    local r7_230 = UE4.UGameplayStatics.GetPlayerCharacter(r3_230, 0)
    local r8_230 = r7_230:K2_GetActorRotation()
    local r9_230 = r7_230:K2_GetActorLocation() + FVector(400, 0, 0)
    if not r6_230 or r2_230 <= 0 then
      print(_G.LogTag, "ZJT_ DropInfo Battle DropCount ", not r6_230, not r4_230:IsDungeonScene(), r2_230)
      return 
    end
    local r10_230 = r0_230:GetClientAvatar()
    if r10_230 and not r10_230:IsInDungeon() and not r10_230:CheckCurrentSubRegion() then
      print(_G.LogTag, "ZJT_ Avatar not Avatar:IsInDungeon() ", r10_230, r10_230:IsInDungeon())
      return 
    end
    local r11_230 = UE4.UKismetMathLibrary.MakeTransform(r9_230, r8_230, UE4.FVector(1, 1, 1))
    local r13_230 = {
      [r1_230] = {
        [tostring(require("BluePrints.Client.CustomTypes.SimpleRewardBox"):GetTag("Normal"))] = r2_230,
      },
    }
    r0_230.Player = UE4.UGameplayStatics.GetPlayerCharacter(r3_230, 0)
    if IsStandAlone(r0_230.Player) then
      r5_230:HandleRewardDrop(r13_230, CommonConst.RewardReason.REASON_GM_SPAWN, r11_230, {}, nil)
    elseif IsClient(r0_230.Player) then
      r0_230.Player.RPCComponent:GMServerGetDrop(r1_230, r2_230)
    end
  end,
  PerMonsterDebug = function(r0_231, r1_231)
    -- line: [3602, 3621] id: 231
    local r2_231 = false
    if r1_231 == "0" then
      r2_231 = true
    end
    local r3_231 = Battle(r0_231.Player):GetAllEntities()
    local r4_231 = nil
    for r9_231, r10_231 in pairs(r3_231) do
      if r10_231 and r10_231.IsMonster and r10_231:IsMonster() then
        r4_231 = r10_231:K2_GetComponentsByClass(UCharDebugWidgetComponent:StaticClass())
        for r14_231 = 1, r4_231:Length(), 1 do
          r4_231[r14_231]:SetHiddenInGame(r2_231)
        end
      end
    end
    -- close: r5_231
    r4_231 = r0_231.Player:K2_GetComponentsByClass(UCharDebugWidgetComponent:StaticClass())
    for r8_231 = 1, r4_231:Length(), 1 do
      r4_231[r8_231]:SetHiddenInGame(r2_231)
    end
  end,
  ShowOrHideMonsterGuideIcon = function(r0_232, r1_232)
    -- line: [3626, 3665] id: 232
    local r2_232 = (tonumber(r1_232) and 0) ~= 0
    local r3_232 = TArray(FUnitLabel)
    local r4_232 = FUnitLabel()
    r4_232.UnitId = 0
    r4_232.UnitType = "Monster"
    r3_232:Add(r4_232)
    local r5_232 = UE.UGameplayStatics.GetGameMode(r0_232.Player)
    if not r5_232 then
      return 
    end
    local r6_232 = UE4.UGameplayStatics.GetGameInstance(r0_232.Player)
    if not r6_232 then
      return 
    end
    local r7_232 = r6_232:GetGameUIManager()
    local r8_232 = r6_232:GetSceneManager()
    if r7_232 == nil then
      return 
    end
    local function r9_232(r0_233)
      -- line: [3650, 3659] id: 233
      r8_232.IsSceneGuideShow = r0_233
      local r1_233 = nil	-- notice: implicit variable refs by block#[5]
      if r0_233 then
        r1_233 = 1
        if not r1_233 then
          ::label_6::
          r1_233 = 0
        end
      else
        goto label_6	-- block#2 is visited secondly
      end
      for r6_233, r7_233 in pairs(r8_232.CurSceneGuideEids) do
        local r8_233 = r7_232:GetUIObj(r6_233)
        if r8_233 ~= nil then
          r8_233:SetRenderOpacity(r1_233)
        end
      end
      -- close: r2_233
    end
    if r2_232 then
      r5_232:ShowGuideIcon(r3_232)
    end
    r9_232(r2_232)
  end,
  ScanLevel = function(r0_234)
    -- line: [3667, 3699] id: 234
    local r1_234 = UE4.URuntimeCommonFunctionLibrary.GetLevelLoadJsonName(r0_234.Player)
    local r3_234 = r0_234.Player.CurrentLevelId
    local r4_234 = string.format("当前玩家进的拼接关卡: %s", r1_234)
    for r10_234, r11_234 in pairs((function(r0_235)
      -- line: [3672, 3679] id: 235
      return require("rapidjson").decode(UE4.URuntimeCommonFunctionLibrary.LoadFile(UE4.UKismetSystemLibrary.GetProjectContentDirectory() .. "Script/Datas/Houdini_data/" .. r0_235 .. ".json"))
    end)(r1_234).points) do
      for r15_234 = 1, r3_234:Length(), 1 do
        local r16_234 = r3_234:Get(r15_234)
        if tostring(r11_234.id) == r16_234 then
          local r17_234 = r11_234.art_path
          if r17_234 == "" then
            r17_234 = string.gsub(r11_234.struct, "Data_Design", "Data_Art", 1)
          end
          r4_234 = r4_234 .. string.format("，所在的美术关卡是: %s， 关卡id是： %s", r17_234, r16_234)
        end
      end
    end
    -- close: r6_234
    return r4_234
  end,
  DebugAchvUI = function(r0_236, r1_236)
    -- line: [3701, 3728] id: 236
    local r2_236 = r0_236:GetGameInstance():GetGameUIManager()
    r1_236 = tonumber(r1_236)
    if not r1_236 then
      print(LogTag, "必要参数缺失~")
      return 
    end
    local r3_236 = DataMgr.Achievement[r1_236]
    if not r3_236 or not r3_236.TargetProgress then
      return 
    end
    local r4_236 = r3_236.TargetProgress
    local r5_236 = 1
    if r3_236.TargetProgressRenew then
      r5_236 = #r3_236.TargetProgressRenew + 1
    end
    if not r2_236:GetUIObjAsync("AchievementPanel", function(r0_237)
      -- line: [3715, 3719] id: 237
      if r0_237 then
        r0_237:AddQuene(r1_236, r4_236, r3_236.TargetProgress, r5_236)
      end
    end) and not r2_236:GetUIObjIsAsyncLoading("AchievementPanel") then
      if r3_236.CompletionValue then
        r4_236 = r3_236.CompletionValue
      end
      local r6_236 = r2_236:LoadUIAsync("AchievementPanel", function()
        -- line: [3724, 3724] id: 238
      end, r1_236, r4_236, r3_236.TargetProgress, r5_236)
    end
  end,
  EnableJetRush = function(r0_239, r1_239, r2_239, r3_239)
    -- line: [3730, 3745] id: 239
    local r4_239 = tonumber(r1_239)
    if not r4_239 then
      return 
    end
    r2_239 = tonumber(r2_239) and 100
    r3_239 = tonumber(r3_239) and 100
    local r5_239 = r0_239.Player
    if r4_239 == 1 then
      r5_239:StartJetRush(r2_239, r3_239)
    else
      r5_239:EndJetRush()
    end
  end,
  EnableBuffMesh = function(r0_240, r1_240)
    -- line: [3747, 3760] id: 240
    local r2_240 = tonumber(r1_240)
    if not r2_240 then
      return 
    end
    local r3_240 = r0_240.Player
    if r2_240 == 1 then
      r3_240:EnableRimLightModel(true)
    else
      r3_240:EnableRimLightModel(false)
    end
  end,
  EnableJetJump = function(r0_241, r1_241)
    -- line: [3761, 3774] id: 241
    local r2_241 = tonumber(r1_241)
    if not r2_241 then
      return 
    end
    local r3_241 = r0_241.Player
    if r2_241 == 1 then
      r3_241.bJetJump = true
    else
      r3_241.bJetJump = false
    end
  end,
  EnableSplineMove = function(r0_242, r1_242, r2_242, r3_242)
    -- line: [3776, 3801] id: 242
    local r4_242 = tonumber(r1_242)
    if not r4_242 then
      return 
    end
    local r5_242 = tonumber(r2_242) and 0
    local r6_242 = tonumber(r3_242) and 0
    local r7_242 = r5_242 == 1
    local r8_242 = r6_242 == 1
    local r9_242 = r0_242.Player
    local r10_242 = UE4.UGameplayStatics.GetAllActorsOfClass(r9_242, ACinemaMoveSpline:StaticClass())
    if r10_242:Length() == 0 then
      print(_G.LogTag, "没有找到CinemaMoveSpline")
      return 
    end
    local r11_242 = r10_242[1]
    r9_242:SetWalkType(2)
    r9_242:SetPlayerMaxMovingSpeed(0.16)
    if r4_242 == 1 then
      r9_242:StartMoveAlongSpline(r11_242.SplineComponent, r11_242.SplineComponent:K2_GetComponentLocation(), r7_242, r8_242)
    else
      r9_242:EndMoveAlongSpline()
    end
  end,
  EnableSplatoonMove = function(r0_243, r1_243)
    -- line: [3803, 3816] id: 243
    local r2_243 = tonumber(r1_243)
    if not r2_243 then
      return 
    end
    local r3_243 = r0_243.Player
    if r2_243 == 1 then
      r3_243:StartSplatoonMove()
    else
      r3_243:EndSplatoonMove()
    end
  end,
  SpeedUp = function(r0_244, r1_244)
    -- line: [3819, 3839] id: 244
    r1_244 = tonumber(r1_244)
    if not r1_244 then
      return 
    end
    if not r0_244.Player.CurrentSpeedRate then
      r0_244.Player.CurrentSpeedRate = 1
    end
    r0_244.Player.PlayerSlideAtttirbute.NormalWalkSpeed = DataMgr.PlayerRotationRates.NormalWalkSpeed.ParamentValue[1] * r1_244
    r0_244.Player.PlayerSlideAtttirbute.CrouchWalkSpeed = DataMgr.PlayerRotationRates.CrouchWalkSpeed.ParamentValue[1] * r1_244
    local r4_244 = r0_244.Player:GetMovementComponent()
    r4_244.MaxFlySpeed = r4_244.MaxFlySpeed / r0_244.Player.CurrentSpeedRate * r1_244
    r0_244.Player.CurrentSpeedRate = r1_244
  end,
  SetWalk = function(r0_245, r1_245, r2_245)
    -- line: [3840, 3856] id: 245
    local r3_245 = tonumber(r1_245)
    local r4_245 = tonumber(r2_245)
    if not r3_245 then
      return 
    end
    local r5_245 = r0_245.Player
    if not r5_245.PlayerAnimInstance then
      return 
    end
    if r3_245 == 1 then
      r5_245.PlayerAnimInstance.IsWalking = true
    else
      r5_245.PlayerAnimInstance.IsWalking = false
    end
    r5_245.PlayerAnimInstance.WalkType = r4_245 and 0
  end,
  ChangeSpeed = function(r0_246, r1_246)
    -- line: [3857, 3863] id: 246
    r1_246 = tonumber(r1_246)
    if not r1_246 then
      return 
    end
    r0_246.Player:SetPlayerMaxMovingSpeed(r1_246)
  end,
  ShowPreloadFX = function(r0_247)
    -- line: [3864, 3883] id: 247
    local r1_247 = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(r0_247.Player, UFXPreloadGameInstanceSubsystem)
    if not r1_247 then
      return 
    end
    local r2_247 = "\nCommonNiagara:\n"
    local r3_247 = r1_247.CommonNiagaraSystems:ToArray()
    for r7_247 = 1, r3_247:Length(), 1 do
      r2_247 = r2_247 .. UKismetSystemLibrary.GetObjectName(r3_247:GetRef(r7_247)) .. ","
    end
    r2_247 = r2_247 .. "\nPlayerNiagara\n"
    local r4_247 = r1_247.CharacterNiagaraSystems:ToArray()
    for r8_247 = 1, r4_247:Length(), 1 do
      r2_247 = r2_247 .. UKismetSystemLibrary.GetObjectName(r4_247:GetRef(r8_247)) .. ","
    end
    DebugPrint(r2_247)
  end,
  GetSceneSoundPause = function(r0_248, r1_248)
    -- line: [3885, 3887] id: 248
    print(_G.LogTag, "GetSceneSoundPause 的输出值是", r1_248, AudioManager(r0_248.Player):GetSceneSoundPause(tonumber(r1_248)))
  end,
  EnterDungeon = function(r0_249, r1_249)
    -- line: [3889, 3900] id: 249
    r1_249 = tonumber(r1_249)
    if not r1_249 then
      return 
    end
    local r2_249 = r0_249:GetClientAvatar()
    if r2_249 then
      r2_249:EnterDungeon(r1_249)
    end
  end,
  EnterEventDungeon = function(r0_250, r1_250, r2_250)
    -- line: [3902, 3917] id: 250
    r1_250 = tonumber(r1_250)
    r2_250 = tonumber(r2_250)
    if not r1_250 or not r2_250 then
      return 
    end
    if not DataMgr.Dungeon[r1_250] then
      return 
    end
    local r4_250 = r0_250:GetClientAvatar()
    if not r4_250 then
      return 
    end
    r4_250:EnterEventDungeon(nil, r1_250, nil, r2_250)
  end,
  EnterPaotai = function(r0_251, r1_251, r2_251)
    -- line: [3919, 3931] id: 251
    r1_251 = tonumber(r1_251)
    r2_251 = tonumber(r2_251)
    if not r1_251 or not r2_251 then
      return 
    end
    local r3_251 = r0_251:GetClientAvatar()
    if r3_251 then
      r3_251:EnterDungeon(r1_251, nil, nil, nil, nil, {
        PaotaiId = r2_251,
      })
    end
  end,
  EnterLocalDungeon = function(r0_252, r1_252)
    -- line: [3933, 3936] id: 252
    require("BluePrints.UI.GMInterface.GMFunctionLibrary").ExecConsoleCommand(r0_252:GetGameInstance(), "sgm EnterLocalDungeon " .. r1_252)
  end,
  EnterNewDS = function(r0_253, r1_253, r2_253)
    -- line: [3938, 3946] id: 253
    if not r2_253 then
      r2_253 = ""
    end
    if not r1_253 then
      return 
    end
    require("BluePrints.UI.GMInterface.GMFunctionLibrary").ExecConsoleCommand(r0_253:GetGameInstance(), "sgm EnterMultiDungeon " .. r1_253 .. " " .. r2_253)
  end,
  TestEnterDS = function(r0_254, r1_254, r2_254)
    -- line: [3948, 3953] id: 254
    if not r1_254 then
      r1_254 = "127.0.0.1"
    end
    if not r2_254 then
      r2_254 = 17777
    end
    UE4.UGameplayStatics.GetPlayerController(r0_254.GameInstance, 0):ClientTravel(r1_254 .. ":" .. tostring(r2_254) .. "?TestRegion", false, false)
  end,
  DSLog = function(r0_255)
    -- line: [3955, 3960] id: 255
    local r1_255 = r0_255:GetClientAvatar()
    if r1_255 then
      r1_255:GetDSLogPath()
    end
  end,
  SetNickname = function(r0_256, r1_256)
    -- line: [3962, 3968] id: 256
    local r2_256 = tostring(r1_256)
    local r3_256 = r0_256:GetClientAvatar()
    if r3_256 then
      r3_256:SetAvatarNickname(r2_256)
    end
  end,
  SetSex = function(r0_257, r1_257, r2_257, r3_257)
    -- line: [3970, 3983] id: 257
    local r4_257 = tostring(r2_257)
    local r5_257 = r0_257:GetClientAvatar()
    if r5_257 then
      r5_257:AvatarCreateRole(r1_257, tonumber(r2_257), function()
        -- line: [3974, 3977] id: 258
        DebugPrint("AvatarCreateRole Callback")
        AudioManager(r0_257):SetVoiceGender()
      end)
      r5_257:SetWeitaInfo(r1_257, tonumber(r3_257), function()
        -- line: [3978, 3981] id: 259
        DebugPrint("SetWeitaInfo Callback")
        AudioManager(r0_257):SetVoiceGender()
      end)
    end
  end,
  SetBGMVolume = function(r0_260, r1_260)
    -- line: [3985, 3989] id: 260
    UE4.UFMODBlueprintStatics.BusSetVolume(UE4.UFMODBlueprintStatics.FindAssetByName("bus:/bgm"):Cast(UE4.UFMODBus), tonumber(r1_260))
  end,
  SetAudioListenerOpenDebug = function(r0_261, r1_261)
    -- line: [3991, 3999] id: 261
    if r0_261.Player and r0_261.Player.AudioListener then
      if r1_261 == "true" then
        r0_261.Player.AudioListener.OpenDebug = true
      elseif r1_261 == "false" then
        r0_261.Player.AudioListener.OpenDebug = false
      end
    end
  end,
  SetEMPreviewMute = function(r0_262, r1_262)
    -- line: [4001, 4007] id: 262
    if r1_262 == "true" then
      AudioManager(r0_262.Player):SetCinePreviewSoundMute(true)
    elseif r1_262 == "false" then
      AudioManager(r0_262.Player):SetCinePreviewSoundMute(false)
    end
  end,
  StartSpecialQuest = function(r0_263, r1_263)
    -- line: [4009, 4016] id: 263
    assert(r1_263, "一定要传入参数:SpecialQuestId")
    r1_263 = tonumber(r1_263)
    require("BluePrints.Common.ClientEvent.ClientEventUtils"):StartSpecialQuestEvent(r1_263)
  end,
  SuccessSpecialQuest = function(r0_264)
    -- line: [4020, 4028] id: 264
    assert(require("BluePrints.Common.ClientEvent.ClientEventUtils"):GetCurrentEvent(), "客户端不存在特殊任务")
    assert(r2_264.Type == "SpecialQuest", "客户端不存在特殊任务")
    r2_264:TryFinishEvent(true)
  end,
  FailerSpecialQuest = function(r0_265)
    -- line: [4030, 4038] id: 265
    assert(require("BluePrints.Common.ClientEvent.ClientEventUtils"):GetCurrentEvent(), "客户端不存在特殊任务")
    assert(r2_265.Type == "SpecialQuest", "客户端不存在特殊任务")
    r2_265:TryFinishEvent(false)
  end,
  ChangeToMaster = function(r0_266)
    -- line: [4040, 4046] id: 266
    if r0_266.Player then
      r0_266.Player:ChangeToMaster(true)
    end
  end,
  ChangeBackToHero = function(r0_267)
    -- line: [4048, 4054] id: 267
    if r0_267.Player then
      r0_267.Player:ChangeBackToHero()
    end
  end,
  ActiveExploreStaticCreator = function(r0_268)
    -- line: [4056, 4063] id: 268
    for r6_268, r7_268 in pairs(UE4.UGameplayStatics.GetGameState(r0_268.Player).ExploreGroupMap) do
      print(_G.LogTag, "LXZ ActiveExploreStaticCreator", r6_268)
      r7_268:ActiveExploreGroupGM()
    end
    -- close: r2_268
  end,
  PrintRegionTypeData = function(r0_269, r1_269, r2_269)
    -- line: [4065, 4067] id: 269
    PrintTable({
      Type = r1_269,
    }, 10)
  end,
  InitGameMode = function(r0_270, r1_270)
    -- line: [4069, 4075] id: 270
    local r2_270 = UE.UGameplayStatics.GetGameMode(r0_270.Player)
    if not r2_270 then
      return 
    end
    r2_270:GMInitGameModeInfo(tonumber(r1_270))
  end,
  TestRealtimeContentValidate = function(r0_271, r1_271)
    -- line: [4078, 4090] id: 271
    HeroUSDKSubsystem():RequestRealTimeContentValidate(r1_271, {
      r0_271,
      function(r0_272, r1_272)
        -- line: [4081, 4083] id: 272
        DebugPrint("TestRealtimeContentValidateResponse", r1_272.Code, r1_272.Msg, r1_272.Data)
      end
    }, {
      r0_271,
      function(r0_273)
        -- line: [4086, 4088] id: 273
        DebugPrint("TestRealtimeContentValidateResponseFail")
      end
    })
  end,
  TestUploadChat = function(r0_274, ...)
    -- line: [4092, 4098] id: 274
    HeroUSDKSubsystem():RequestUploadChatData_Lua({
      ...
    }, r0_274, function(r0_275, r1_275)
      -- line: [4095, 4097] id: 275
      DebugPrint("TestUploadChatResponse", r1_275.Code, r1_275.Msg, r1_275.Data)
    end)
  end,
  TestUploadReport = function(r0_276)
    -- line: [4100, 4115] id: 276
    HeroUSDKSubsystem():RequestUploadReportData_Lua({
      {
        FromServerId = 1,
        FromRoleId = 2,
        FromRoleName = "TestName",
        Text = "TestText",
        Remark = "TestRemark",
        Reason = "TestReason",
      }
    }, r0_276, function(r0_277, r1_277)
      -- line: [4112, 4114] id: 277
      DebugPrint("TestUploadReportResponse", r1_277.Code, r1_277.Msg, r1_277.Data)
    end)
  end,
  TestUploadBanLog = function(r0_278)
    -- line: [4117, 4126] id: 278
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
    }, r0_278, function(r0_279, r1_279)
      -- line: [4123, 4125] id: 279
      DebugPrint("TestUploadBanLogResponse", r1_279.Code, r1_279.Msg, r1_279.Data)
    end)
  end,
  UnLoadChangeUI = function(r0_280)
    -- line: [4128, 4133] id: 280
    r0_280:GetGameInstance():CloseLoadingUI()
  end,
  PrintQuestData = function(r0_281)
    -- line: [4140, 4149] id: 281
    for r6_281, r7_281 in pairs(GWorld:GetAvatar().QuestUpdateDatas) do
      print(_G.LogTag, "ZJT_ 打印之前待提交任务数据缓存 PrintQuestData QuestId ", r6_281)
      for r12_281, r13_281 in pairs(r7_281) do
        print(_G.LogTag, "ZJT_ PrintQuestData QuestData eid ", r12_281, r13_281.Eid, r13_281.QuestId, r13_281.Id, r13_281.SubRegionId, r13_281.LevelName, r13_281.CreatorId)
      end
      -- close: r8_281
    end
    -- close: r2_281
  end,
  RequireAndEnterDS = function(r0_282, r1_282, r2_282)
    -- line: [4152, 4161] id: 282
    local r3_282 = GWorld:GetAvatar()
    r3_282:RequireDS(tonumber(r1_282), r2_282, function(r0_283)
      -- line: [4155, 4159] id: 283
      if ErrorCode:Check(r0_283) then
        r3_282:ConnectAndEnterDS()
      end
    end)
  end,
  LoadSmallObjects = function(r0_284)
    -- line: [4163, 4165] id: 284
    URuntimeCommonFunctionLibrary.LoadStreamingLevel(r0_284.Player)
  end,
  ExitDS = function(r0_285)
    -- line: [4167, 4170] id: 285
    GWorld:GetAvatar():ExitDS()
  end,
  EnterLocalDS = function(r0_286)
    -- line: [4172, 4175] id: 286
    local r1_286 = GWorld:GetAvatar()
    r0_286:GetGameInstance():ConnectDedicatedServer_Lua("127.0.0.1", 17777, r1_286.Account, r1_286.Eid)
  end,
  StartBlueProduct = function(r0_287, r1_287)
    -- line: [4177, 4180] id: 287
    GWorld:GetAvatar():StartProduct(r1_287)
  end,
  CompleteBlueProduct = function(r0_288, r1_288)
    -- line: [4182, 4185] id: 288
    GWorld:GetAvatar():CompleteProduct(r1_288)
  end,
  AccelerateBlueProduct = function(r0_289, r1_289)
    -- line: [4187, 4190] id: 289
    GWorld:GetAvatar():AccelerateProduct(r1_289)
  end,
  KickPlayer = function(r0_290, r1_290)
    -- line: [4192, 4195] id: 290
    GWorld:GetAvatar():KickPlayer(r1_290)
  end,
  KickSelf = function(r0_291, r1_291)
    -- line: [4197, 4199] id: 291
    r0_0:DedicatedServerCommand("KickSelf", r1_291)
  end,
  ShowClientTime = function(r0_292)
    -- line: [4201, 4204] id: 292
    DebugPrint("Current Time is", require("Utils.TimeUtils").TimeToStr())
  end,
  ShowServerTime = function(r0_293)
    -- line: [4206, 4211] id: 293
    local r1_293 = GWorld:GetAvatar()
    if r1_293 then
      r1_293:GetServerTime()
    end
  end,
  StartBattle = function(r0_294)
    -- line: [4213, 4218] id: 294
    UE4.UGameplayStatics.GetPlayerController(r0_294:GetGameInstance(), 0):StartBattle()
  end,
  TestDrawGacha = function(r0_295, r1_295, r2_295)
    -- line: [4220, 4223] id: 295
    GWorld:GetAvatar():DrawGacha(tonumber(r1_295), tonumber(r2_295))
  end,
  TestDrawSkinGacha = function(r0_296, r1_296, r2_296)
    -- line: [4225, 4232] id: 296
    local r3_296 = GWorld:GetAvatar()
    if not r3_296 then
      return 
    end
    r3_296:DrawSkinGacha(tonumber(r1_296), tonumber(r2_296))
  end,
  ShowGachaParams = function(r0_297)
    -- line: [4234, 4240] id: 297
    GWorld:GetAvatar():CallServer("GMGachaParams", function(r0_298)
      -- line: [4236, 4238] id: 298
      PrintTable(r0_298, 3)
    end)
  end,
  GachaSelfSelect = function(r0_299, r1_299, r2_299)
    -- line: [4242, 4249] id: 299
    local r3_299 = GWorld:GetAvatar()
    if not r3_299 then
      return 
    end
    r3_299:SetGachaSelfSelect(nil, tonumber(r1_299), tonumber(r2_299))
  end,
  FinishSystemGuide = function(r0_300, r1_300)
    -- line: [4251, 4254] id: 300
    GWorld:GetAvatar():FinishSystemGuide(tonumber(r1_300))
  end,
  PurchaseShopItem = function(r0_301, r1_301, r2_301)
    -- line: [4256, 4259] id: 301
    GWorld:GetAvatar():PurchaseShopItem(tonumber(r1_301), tonumber(r2_301))
  end,
  ShowPurchaseShopUI = function(r0_302)
    -- line: [4261, 4264] id: 302
    GWorld:GetGameInstance():GetGameUIManager():LoadUI(UIConst.SHOPMAIN, "ShopMain", UIConst.ZORDER_FOR_DESKTOP_TEMP)
  end,
  PlayAllNiagaraArround = function(r0_303)
    -- line: [4266, 4268] id: 303
    URuntimeCommonFunctionLibrary.PlayAllNiagaraArround(r0_303:GetGameInstance())
  end,
  EnemyVisionDebug = function(r0_304)
    -- line: [4270, 4278] id: 304
    for r6_304, r7_304 in ipairs(UGameplayStatics.GetAllActorsOfClass(r0_304.Player, AMonsterCharacter:StaticClass()):ToTable()) do
      local r8_304 = r7_304:GetComponentByClass(UCharDebugWidgetComponent:StaticClass())
      if r8_304 then
        r8_304.bEnemyVisionDebug = not r8_304.bEnemyVisionDebug
      end
    end
    -- close: r2_304
  end,
  TargetLocDebug = function(r0_305)
    -- line: [4280, 4288] id: 305
    for r6_305, r7_305 in ipairs(UGameplayStatics.GetAllActorsOfClass(r0_305.Player, AMonsterCharacter:StaticClass()):ToTable()) do
      local r8_305 = r7_305:GetComponentByClass(UCharDebugWidgetComponent:StaticClass())
      if r8_305 then
        r8_305.bTargetLocDebug = not r8_305.bTargetLocDebug
      end
    end
    -- close: r2_305
  end,
  ConnectServer = function(r0_306)
    -- line: [4290, 4295] id: 306
    local r1_306 = GWorld:GetAvatar()
    if r1_306 then
      r1_306:TestConnectLS()
    end
  end,
  ListenServer = function(r0_307, r1_307)
    -- line: [4297, 4300] id: 307
    print(_G.LogTag, "ListenServer", r1_307)
    WorldTravelSubsystem():ChangeDungeonByDungeonId(r1_307, CommonConst.DungeonNetMode.ListenServer)
  end,
  NetMode = function(r0_308)
    -- line: [4302, 4315] id: 308
    local r1_308 = r0_308:GetGameInstance():GetNetMode()
    if r1_308 == 0 then
      print(_G.LogTag, "Current NetMode StandAlone")
    elseif r1_308 == 1 then
      print(_G.LogTag, "Current NetMode DedicatedServer")
    elseif r1_308 == 2 then
      print(_G.LogTag, "Current NetMode ListenServer")
    elseif r1_308 == 3 then
      print(_G.LogTag, "Current NetMode Client")
    else
      print(_G.LogTag, "Unknown Current NetMode", r1_308)
    end
  end,
  Reconnect = function(r0_309)
    -- line: [4317, 4320] id: 309
    r0_309:GetGameInstance():GetNetworkManager():TestReconnect()
  end,
  TestNetworkFailure = function(r0_310, r1_310)
    -- line: [4322, 4324] id: 310
    r0_310:GetGameInstance():HandleNetworkError(tonumber(r1_310), false)
  end,
  TestCrash = function(r0_311)
    -- line: [4326, 4329] id: 311
    UE.UGameplayStatics.GetPlayerController(r0_311:GetGameInstance(), 0):TestCrash()
  end,
  ForbidEntityMessage = function(r0_312, r1_312)
    -- line: [4331, 4333] id: 312
    GWorld:ForbidEntityMessage(r1_312)
  end,
  DestroyAllMonster = function(r0_313)
    -- line: [4335, 4345] id: 313
    local r1_313 = TArray(AActor)
    UE4.UGameplayStatics.GetAllActorsOfClass(r0_313.Player, AMonsterCharacter, r1_313)
    for r5_313 = 1, r1_313:Length(), 1 do
      local r6_313 = r1_313:Get(r5_313)
      if r6_313 then
        r6_313:EMActorDestroy(EDestroyReason.GM)
      end
    end
  end,
  DSVersion = function(r0_314)
    -- line: [4347, 4353] id: 314
    return require("Utils.MiscUtils").GetGameCofingSettings("DSVersion")
  end,
  ManualGC = function(r0_315)
    -- line: [4355, 4360] id: 315
    collectgarbage("collect")
    UE4.UKismetSystemLibrary.CollectGarbage()
  end,
  SetClientTime = function(r0_316, r1_316, r2_316, r3_316, r4_316, r5_316, r6_316)
    -- line: [4362, 4368] id: 316
    local r7_316 = require("Utils.TimeUtils")
    r7_316.TimeOffset = math.floor(r7_316.DataToTimestamp(tonumber(r1_316), tonumber(r2_316), tonumber(r3_316), tonumber(r4_316), tonumber(r5_316), tonumber(r6_316)) - os.time())
  end,
  PSOPrepare = function(r0_317, r1_317, r2_317)
    -- line: [4370, 4376] id: 317
    local r3_317 = require("Test.PSOPrepare")
    r3_317:Initialize(r0_317)
    r3_317:DoPrepare(r1_317, r2_317)
  end,
  ResetTrollyLoc = function(r0_318, r1_318, r2_318)
    -- line: [4378, 4402] id: 318
    local r3_318 = tonumber(r1_318)
    local r4_318 = tonumber(r2_318)
    local r5_318 = UE.UGameplayStatics.GetGameMode(r0_318.Player)
    if not r5_318:GetDungeonComponent() then
      DebugPrint("当前未找到副本组件")
      return 
    end
    r5_318.EMGameState.NowPathId = r3_318
    r5_318.EMGameState.NextPathId = r4_318
    for r10_318, r11_318 in pairs(r5_318.EMGameState.DefBaseMap) do
      if IsValid(r11_318) then
        r11_318.NowPathId = r3_318
        r11_318.NextPathId = r4_318
        r11_318.Percent = 0
        r11_318.Spline.Spline:ClearSplinePoints(false)
        r11_318:AddNewPath()
        local r12_318 = r11_318.Spline:GetMoveTransform(r11_318.Percent)
        r12_318 = FTransform(r12_318.Rotation, r12_318.Translation + FVector(0, 0, 200), r11_318:GetActorScale3D())
        r11_318:K2_SetActorTransform(r12_318, false, nil, false)
        r0_318.Player:K2_SetActorLocation(FTransform(r12_318.Rotation, r12_318.Translation + FVector(0, 0, 400), r11_318:GetActorScale3D()).Translation, false, nil, false)
      end
    end
    -- close: r6_318
  end,
  ClearFirstMonsterRecords = function(r0_319)
    -- line: [4404, 4414] id: 319
    local r1_319 = GWorld:GetAvatar()
    if not r1_319 then
      return 
    end
    r1_319:CallServerMethod("GMClearFirstMonsterRecords")
    local r2_319 = r0_319:GetGameInstance():GetCurrentGameMode().EMGameState
    r2_319.FirstSeen = {}
    r2_319.MonstersNeedCheck = {}
  end,
  ClearMonGuide = function(r0_320)
    -- line: [4416, 4423] id: 320
    local r1_320 = GWorld:GetAvatar()
    if not r1_320 then
      return 
    end
    r1_320:CallServerMethod("GMClearFirstStrongMonsterRecords")
  end,
  StartQuest = function(r0_321, r1_321)
    -- line: [4425, 4447] id: 321
    local r2_321 = GWorld:GetAvatar()
    if not r2_321 then
      return 
    end
    local r3_321 = tonumber(string.sub(r1_321, 1, 6))
    print(_G.LogTag, "QuestChainId", r3_321)
    local r4_321 = r2_321.QuestChains[r3_321]
    if r4_321 and r4_321:IsFinish() then
      DebugPrint("ZJT_ 任务链已经完成 ", r3_321)
      return 
    end
    if r4_321 and r4_321:CheckQuestIdComplete(r1_321) then
      DebugPrint("ZJT_ 任务已经完成 ", r1_321)
      return 
    end
    if r4_321 and r4_321.DoingQuestId == r1_321 then
      DebugPrint("任务正在进行 ", r1_321)
      return 
    end
    r2_321:GMStartQuest(tonumber(r3_321), tonumber(r1_321), true)
  end,
  SuccQuest = function(r0_322, r1_322)
    -- line: [4449, 4464] id: 322
    local r2_322 = GWorld:GetAvatar()
    if not r2_322 then
      return 
    end
    local r3_322 = tonumber(string.sub(r1_322, 1, 6))
    r1_322 = tonumber(r1_322)
    local r4_322 = r2_322.QuestChains[r3_322]
    if r4_322 and r4_322:IsFinish() then
      DebugPrint("ZJT_ 任务链已经完成 ", r3_322)
      return 
    end
    if r4_322 and r4_322:CheckQuestIdComplete(r1_322) then
      DebugPrint("ZJT_ 任务已经完成 ", r1_322)
      return 
    end
    r2_322:CallServerMethod("GMSuccestQuest", r3_322, r1_322)
  end,
  SkipCurrentRunningQuest = function(r0_323)
    -- line: [4466, 4485] id: 323
    local r1_323 = GWorld:GetAvatar()
    if not r1_323 then
      return 
    end
    local r2_323 = r1_323.TrackingQuestChainId
    if r2_323 == 0 then
      DebugPrint("ZJT_ 当前未追踪任何任务链 ", r2_323)
      return 
    end
    local r3_323 = r1_323.QuestChains[r2_323]
    if r3_323 and r3_323:IsFinish() then
      DebugPrint("ZJT_ 任务链已经完成 ", r2_323)
      return 
    end
    local r4_323 = r3_323.DoingQuestId
    if r3_323 and r3_323:CheckQuestIdComplete(r4_323) then
      DebugPrint("ZJT_ 任务已经完成 ", r4_323)
      return 
    end
    r0_323:SuccQuest(r4_323)
  end,
  FailQuest = function(r0_324, r1_324)
    -- line: [4487, 4497] id: 324
    local r2_324 = GWorld:GetAvatar()
    if not r2_324 then
      return 
    end
    local r3_324 = tonumber(string.sub(r1_324, 1, 6))
    print(_G.LogTag, "QuestChainId", r3_324)
    if not r2_324.QuestChains[r3_324] then
      r0_324:StartQuestChain(r3_324)
    end
    r2_324:RecoverDataByQuestChainId(r3_324)
  end,
  ShowUseCountSkill = function(r0_325)
    -- line: [4499, 4515] id: 325
    local r1_325 = require("EMCache.EMCache")
    local r2_325 = r1_325:Get("bNeedCountPlayerSkillUsedTimesList", true) and {}
    local r3_325 = {}
    for r8_325, r9_325 in pairs(r2_325) do
      table.insert(r3_325, r8_325)
    end
    -- close: r4_325
    DebugPrint("CountSkillUsedTime->当前角色的本地存储允许哪些技能类似可以计算:", table.concat(r3_325, ","))
    local r5_325 = r1_325:Get("CountPlayerSkillUsedTimesList", true) and {}
    DebugPrint("CountSkillUsedTime->当前技能的使用次数:")
    DebugPrint("CountSkillUsedTime->----------------------------")
    for r10_325, r11_325 in pairs(r5_325) do
      DebugPrint("CountSkillUsedTime->技能类型", r10_325, "使用次数", r11_325)
    end
    -- close: r6_325
    DebugPrint("CountSkillUsedTime->----------------------------")
  end,
  ShowCacheUseCountSkill = function(r0_326)
    -- line: [4517, 4532] id: 326
    local r1_326 = r0_326.Player
    if r1_326 then
      r1_326 = r0_326.Player.NeedCountPlayerSkillUsedTimesList and {}
    else
      goto label_7	-- block#2 is visited secondly
    end
    local r2_326 = {}
    for r7_326, r8_326 in pairs(r1_326) do
      table.insert(r2_326, r7_326)
    end
    -- close: r3_326
    DebugPrint("CountSkillUsedTime->当前角色的缓存允许哪些技能类似可以计算:", table.concat(r2_326, ","))
    local r4_326 = r0_326.Player
    if r4_326 then
      r4_326 = r0_326.Player.CountPlayerSkillUsedTimesList and {}
    else
      goto label_39	-- block#8 is visited secondly
    end
    DebugPrint("CountSkillUsedTime->当前技能的使用次数:")
    DebugPrint("CountSkillUsedTime->----------------------------")
    for r9_326, r10_326 in pairs(r4_326) do
      DebugPrint("CountSkillUsedTime->技能类型", r9_326, "使用次数", r10_326)
    end
    -- close: r5_326
    DebugPrint("CountSkillUsedTime->----------------------------")
  end,
  SuccessAllQuest = function(r0_327)
    -- line: [4534, 4536] id: 327
    GWorld.StoryMgr:SuccessAllQuest()
  end,
  PrintStorylineInfo = function(r0_328)
    -- line: [4538, 4540] id: 328
    GWorld.StoryMgr:PrintStorylineInfo()
  end,
  PrintStorylinesNeedRestartInfo = function(r0_329)
    -- line: [4542, 4544] id: 329
    GWorld.StoryMgr:PrintStorylinesNeedRestartInfo()
  end,
  SetPlayerDilation = function(r0_330, r1_330)
    -- line: [4546, 4550] id: 330
    if r0_330.Player then
      r0_330.Player:SetTimeDilation(tonumber(r1_330))
    end
  end,
  Mem = function(r0_331)
    -- line: [4552, 4556] id: 331
    local r1_331 = require("MemDump")
    r1_331 = nil
    collectgarbage("collect")
  end,
  CleanLuaTable = function(r0_332)
    -- line: [4558, 4560] id: 332
    DataMgr.CleanAllTable()
  end,
  PrintCurrentSkillID = function(r0_333)
    -- line: [4562, 4574] id: 333
    local r1_333 = {}
    for r6_333, r7_333 in pairs(r0_333.Player.Type_2_Skills) do
      r1_333[r6_333] = r7_333
    end
    -- close: r2_333
    local r2_333 = r0_333.Player.ForceSkills
    for r7_333, r8_333 in pairs(r1_333) do
      if r2_333:Find(r8_333) then
        r1_333[r7_333] = r2_333:Find(r8_333)
      end
    end
    -- close: r3_333
    PrintTable(r1_333, 10, "当前按键技能为")
  end,
  PrintMonsterSkill = function(r0_334, r1_334)
    -- line: [4576, 4587] id: 334
    local r4_334 = Battle(UE4.UGameplayStatics.GetPlayerCharacter(r0_334:GetGameInstance(), 0)):GetEntity(tonumber(r1_334))
    if not r4_334 then
      DebugPrint("Tianyi@ 找不到对应怪物")
      return 
    end
    r4_334.DebugPrintSkillId = true
  end,
  ShowAvatarStatus = function(r0_335)
    -- line: [4589, 4595] id: 335
    local r1_335 = GWorld:GetAvatar()
    local r2_335 = "CurrentAvatarStatus: "
    if r1_335 then
      r1_335:PrintAvatarStatus()
    end
  end,
  StatMonster = function(r0_336)
    -- line: [4597, 4601] id: 336
    require("StatMonster"):Stat(r0_336)
    local r1_336 = nil
  end,
  StatMonsterMem = function(r0_337)
    -- line: [4603, 4607] id: 337
    require("StatMonster"):StatMem(r0_337)
    local r1_337 = nil
  end,
  StatFX = function(r0_338, r1_338)
    -- line: [4609, 4611] id: 338
    require("StatFX"):Stat(r0_338, r1_338)
  end,
  StatLevel = function(r0_339)
    -- line: [4613, 4617] id: 339
    require("StatLevel"):Stat(r0_339)
    local r1_339 = nil
  end,
  StatRecordLevel = function(r0_340)
    -- line: [4619, 4623] id: 340
    require("StatRecordLevel"):Stat(r0_340)
    local r1_340 = nil
  end,
  PreviewPopup = function(r0_341, r1_341)
    -- line: [4625, 4629] id: 341
    r0_341:GetGameInstance():GetGameUIManager():PreviewCommonPopupStyle(r1_341)
  end,
  ShowPopup = function(r0_342, r1_342)
    -- line: [4631, 4635] id: 342
    r0_342:GetGameInstance():GetGameUIManager():ShowCommonPopupUI(tonumber(r1_342), {})
  end,
  ShowRecoverUI = function(r0_343)
    -- line: [4637, 4639] id: 343
    UIUtils.ShowActionRecover(r0_343)
  end,
  TestGetCharWeapon = function(r0_344, r1_344, ...)
    -- line: [4641, 4652] id: 344
    local r2_344 = {
      ...
    }
    local r3_344 = {
      [r1_344 .. "s"] = {},
    }
    for r8_344, r9_344 in ipairs(r2_344) do
      if not r3_344[(r1_344 .. "s")][tonumber(r9_344)] then
        r3_344[r1_344 .. "s"][tonumber(r9_344)] = 0
      end
      r3_344[r1_344 .. "s"][tonumber(r9_344)] = r3_344[(r1_344 .. "s")][tonumber(r9_344)] + 1
    end
    -- close: r4_344
    UIUtils.ShowGetCharWeaponPage(r3_344, nil, nil, false)
  end,
  DisableCheckBox = function(r0_345)
    -- line: [4654, 4659] id: 345
    r0_345:GetGameInstance():GetGameUIManager():GetUIObj("TrainingGroundSetup").WBP_Training_Root.WBP_Com_CheckBox_LeftText:ForbidBtn(true)
  end,
  EnableCheckBox = function(r0_346)
    -- line: [4661, 4666] id: 346
    r0_346:GetGameInstance():GetGameUIManager():GetUIObj("TrainingGroundSetup").WBP_Training_Root.WBP_Com_CheckBox_LeftText:ForbidBtn(false)
  end,
  IsCrit = function(r0_347)
    -- line: [4668, 4676] id: 347
    if require("EMLuaConst").IsCanCrit == false then
      require("EMLuaConst").IsCanCrit = true
    else
      require("EMLuaConst").IsCanCrit = false
    end
  end,
  IsFloat = function(r0_348)
    -- line: [4678, 4686] id: 348
    if require("EMLuaConst").IsCanFloat == false then
      require("EMLuaConst").IsCanFloat = true
    else
      require("EMLuaConst").IsCanFloat = false
    end
  end,
  TestEvent = function(r0_349)
    -- line: [4688, 4690] id: 349
    r0_349.Player:TestTriggerBattleEvent(30)
  end,
  ShowDamageDetails = function(r0_350)
    -- line: [4692, 4695] id: 350
    Const.bShowDamageDetails = not Const.bShowDamageDetails
    require("EMLuaConst").bShowDamageDetails = Const.bShowDamageDetails
  end,
  DSShowDetails = function(r0_351)
    -- line: [4697, 4699] id: 351
    r0_351:ServerBattleCommand("DSShowDetails")
  end,
  ShowRealAttr = function(r0_352)
    -- line: [4701, 4733] id: 352
    r0_352.Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
    local r2_352 = r0_352.Player:GetAttr("ATK")
    local r3_352 = r0_352.Player:GetAttr("ATK_Char")
    local r4_352 = r2_352 - r3_352
    local r5_352 = r0_352.Player:GetAttr("SkillIntensity")
    local r6_352 = r0_352.Player:GetAttr("SkillSustain")
    local r7_352 = r0_352.Player:GetAttr("SkillRange")
    local r8_352 = r0_352.Player:GetAttr("SkillEfficiency")
    local r9_352 = string.format("%.2f", (r0_352.Player:GetAttr("StrongValue") + 1) * 100)
    ScreenPrint("背水：" .. string.format("%.2f", (r0_352.Player:GetAttr("EnmityValue") + 1) * 100) .. "%")
    ScreenPrint("昂扬：" .. r9_352 .. "%")
    local r11_352 = r0_352.Player:GetCurrentWeapon()
    if r11_352 then
      local r12_352 = string.format("%.2f", r11_352:GetAttr("CRI") * 100)
      local r13_352 = string.format("%.2f", r11_352:GetAttr("CRD") * 100)
      local r14_352 = string.format("%.2f", r11_352:GetAttr("TriggerProbability") * 100)
      ScreenPrint("多重射击：" .. string.format("%.2f", r11_352:GetAttr("MultiShoot") * 100) .. "%")
      ScreenPrint("触发概率：" .. r14_352 .. "%")
      ScreenPrint("爆伤：" .. r13_352 .. "%")
      ScreenPrint("暴击：" .. r12_352 .. "%")
    end
    ScreenPrint("技能效益：" .. string.format("%.2f", r8_352 * 100) .. "%")
    ScreenPrint("技能耐久：" .. string.format("%.2f", r6_352 * 100) .. "%")
    ScreenPrint("技能范围：" .. string.format("%.2f", r7_352 * 100) .. "%")
    ScreenPrint("技能强度：" .. string.format("%.2f", r5_352 * 100) .. "%")
    ScreenPrint("武器攻击：" .. r4_352)
    ScreenPrint("角色攻击：" .. r3_352)
    ScreenPrint("总攻击：" .. r2_352)
  end,
  StatDamage = function(r0_353)
    -- line: [4735, 4754] id: 353
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
  CheckCondition = function(r0_354, r1_354, r2_354)
    -- line: [4756, 4762] id: 354
    if not r2_354 then
      r2_354 = false
    end
    local r3_354 = GWorld:GetAvatar()
    if r3_354 then
      print(_G.LogTag, "CheckCondition Result: ", ConditionUtils.CheckCondition(r3_354, tonumber(r1_354), r2_354))
    end
  end,
  ServerCheckCondition = function(r0_355, r1_355, r2_355)
    -- line: [4764, 4773] id: 355
    if not r2_355 then
      r2_355 = false
    end
    local r3_355 = GWorld:GetAvatar()
    if r3_355 then
      ConditionUtils.ServerCheckCondition(r3_355, tonumber(r1_355), function(r0_356)
        -- line: [4768, 4770] id: 356
        print(_G.LogTag, "ServerCheckCondition Result: ", r0_356)
      end, r2_355)
    end
  end,
  PrintGetCover = function(r0_357, r1_357)
    -- line: [4775, 4783] id: 357
  end,
  PrintUpdateCover = function(r0_358, r1_358)
    -- line: [4785, 4793] id: 358
  end,
  TrainingCreateMonster = function(r0_359, ...)
    -- line: [4795, 4804] id: 359
    local r1_359 = {
      ...
    }
    local r2_359 = {}
    for r6_359 = 1, #r1_359, 3 do
      table.insert(r2_359, {
        tonumber(r1_359[r6_359]),
        tonumber(r1_359[r6_359 + 1]),
        tonumber(r1_359[r6_359 + 2])
      })
    end
    local r3_359 = UE4.UGameplayStatics.GetGameMode(r0_359.Player)
    if r3_359 ~= nil then
      r3_359:TriggerDungeonComponentFun("CreateMonster", r2_359)
    end
  end,
  TrainingSetMonsterAI = function(r0_360, r1_360)
    -- line: [4806, 4815] id: 360
    local r2_360 = UE4.UGameplayStatics.GetGameMode(r0_360.Player)
    if r2_360 ~= nil then
      local r3_360 = false
      if r1_360 == "true" then
        r3_360 = true
      end
      r2_360:TriggerDungeonComponentFun("SetMonsterAI", r3_360)
    end
  end,
  TrainingRemoveMonster = function(r0_361)
    -- line: [4817, 4822] id: 361
    local r1_361 = UE4.UGameplayStatics.GetGameMode(r0_361.Player)
    if r1_361 ~= nil then
      r1_361:TriggerDungeonComponentFun("RemoveMonster")
    end
  end,
  TrainingClearCreateInfo = function(r0_362)
    -- line: [4824, 4829] id: 362
    local r1_362 = UE4.UGameplayStatics.GetGameMode(r0_362.Player)
    if r1_362 ~= nil then
      r1_362:TriggerDungeonComponentFun("ClearCreateInfo")
    end
  end,
  TouchSpeedPitch = function(r0_363, r1_363)
    -- line: [4831, 4835] id: 363
    local r2_363 = UE4.UGameplayStatics.GetPlayerCharacter(r0_363:GetGameInstance(), 0)
    r1_363 = tonumber(r1_363)
    r2_363.TurnSpeedPitch = r1_363
  end,
  TouchSpeedYaw = function(r0_364, r1_364)
    -- line: [4837, 4841] id: 364
    local r2_364 = UE4.UGameplayStatics.GetPlayerCharacter(r0_364:GetGameInstance(), 0)
    r1_364 = tonumber(r1_364)
    r2_364.TurnSpeedYaw = r1_364
  end,
  TouchLimitPitch = function(r0_365, r1_365)
    -- line: [4843, 4847] id: 365
    local r2_365 = UE4.UGameplayStatics.GetPlayerCharacter(r0_365:GetGameInstance(), 0)
    r1_365 = tonumber(r1_365)
    r2_365.TurnLimitPitch = math.pi / 180 * r1_365
  end,
  TouchLimitYaw = function(r0_366, r1_366)
    -- line: [4849, 4853] id: 366
    local r2_366 = UE4.UGameplayStatics.GetPlayerCharacter(r0_366:GetGameInstance(), 0)
    r1_366 = tonumber(r1_366)
    r2_366.TurnLimitYaw = math.pi / 180 * r1_366
  end,
}
local r1_0 = {
  PlayerLevelMin = function(r0_367, r1_367)
    -- line: [4856, 4862] id: 367
    if not r0_367 then
      return 
    end
    r0_367:GMSetPlayerLevel(r1_367)
  end,
  DynamicEventCompleteTimes = function(r0_368, r1_368)
    -- line: [4864, 4867] id: 368
    PrintTable({
      Params = r1_368,
    }, 10)
    r0_368:CallServerMethod("GMSetDynamicQuestCompleteTimes", table.unpack(r1_368))
  end,
  PlayerLevelMax = function(r0_369, r1_369)
    -- line: [4869, 4875] id: 369
    if not r0_369 then
      return 
    end
    r0_369:GMSetPlayerLevel(r1_369)
  end,
  QuestChain = function(r0_370, r1_370)
    -- line: [4877, 4879] id: 370
    r0_0:SuccQuestChain(r1_370)
  end,
  Impression = function(r0_371, r1_371)
    -- line: [4881, 4885] id: 371
    if type(r1_371) == "table" then
      r0_0:CompleteImpressionSystem(tonumber(r1_371[1]))
    end
  end,
  HaveResource = function(r0_372, r1_372)
    -- line: [4887, 4894] id: 372
    if not r0_372 then
      return 
    end
    require("BluePrints.UI.GMInterface.GMFunctionLibrary").ExecConsoleCommand(GWorld.GameInstance, "sgm ar " .. r1_372[1] .. " " .. r1_372[2])
  end,
  Quest = function(r0_373, r1_373)
    -- line: [4896, 4898] id: 373
    r0_0:SuccQuest(r1_373)
  end,
  MechanismState = function(r0_374, r1_374)
    -- line: [4900, 4902] id: 374
    r0_0:DedicatedServerCommand("TriggerMechanism", table.unpack(r1_374))
  end,
  DungeonComplete = function(r0_375, r1_375)
    -- line: [4904, 4906] id: 375
    r0_375:CallServerMethod("GMDungeonComplete", table.unpack(r1_375))
  end,
  HardBossComplete = function(r0_376, r1_376)
    -- line: [4908, 4910] id: 376
    r0_376:CallServerMethod("GMHardBossComplete", table.unpack(r1_376))
  end,
  RougeLikeComplete = function(r0_377, r1_377)
    -- line: [4912, 4914] id: 377
    r0_377:CallServerMethod("GMRougeLikeComplete", r1_377)
  end,
}
function r0_0.CompleteCondition(r0_378, r1_378)
  -- line: [4917, 4945] id: 378
  if not r1_378 then
    return 
  end
  if type(r1_378) ~= "table" then
    r1_378 = {
      tonumber(r1_378)
    }
  end
  local r2_378 = GWorld:GetAvatar()
  if not r2_378 then
    return 
  end
  local r3_378 = 1
  local function r4_378(r0_379, r1_379)
    -- line: [4927, 4937] id: 379
    if r1_379 == r1_378[r3_378] and r3_378 < #r1_378 then
      r3_378 = r3_378 + 1
      while r3_378 < #r1_378 do
        local r2_379 = ConditionUtils.CheckCondition(r2_378, r1_378[r3_378])
        if r2_379 then
          r2_379 = r3_378 + 1
          r3_378 = r2_379
        else
          break
        end
      end
      r0_378:CompleteSingleCondition(r1_378[r3_378])
    end
  end
  EventManager:AddEvent(EventID.ConditionComplete, r0_378, r4_378)
  local r5_378 = r1_378[1]
  if ConditionUtils.CheckCondition(r2_378, r5_378) then
    r4_378(nil, r5_378)
  else
    r0_378:CompleteSingleCondition(r5_378)
  end
end
function r0_0.FreezeWorldComposition(r0_380, r1_380)
  -- line: [4947, 4962] id: 380
  if not r1_380 then
    r1_380 = 1
  end
  r1_380 = tonumber(r1_380)
  local r3_380 = UE4.UGameplayStatics.GetGameMode(r0_380:GetGameInstance()):GetWCSubSystem()
  if not r3_380 then
    return 
  end
  if r1_380 > 0 then
    r3_380:FreezeWorldComposition()
  else
    r3_380:UnFreezeWorldComposition()
  end
end
function r0_0.BreakableItemNavEnableInLower(r0_381, r1_381)
  -- line: [4965, 4967] id: 381
  UE4.URuntimeCommonFunctionLibrary.EnableBreakableItemNavModifyInLower(tonumber(r1_381) > 0)
end
function r0_0.CompleteSingleCondition(r0_382, r1_382)
  -- line: [4970, 4995] id: 382
  if not r1_382 then
    return 
  end
  r1_382 = tonumber(r1_382)
  local r2_382 = GWorld:GetAvatar()
  if not r2_382 then
    return 
  end
  if ConditionUtils.CheckCondition(r2_382, r1_382) then
    return 
  end
  local r3_382 = DataMgr.Condition[r1_382]
  local r5_382 = string.lower(r3_382.ConditionLogic)
  for r10_382, r11_382 in pairs(r3_382.ConditionMap) do
    for r15_382 = 1, #r11_382, 1 do
      if not ConditionUtils[("Judge" .. r10_382)](r2_382, r11_382[r15_382]) then
        if r1_0[r10_382] then
          r1_0[r10_382](r2_382, r11_382[r15_382])
          if r5_382 == "or" then
            return 
          end
        else
          print(_G.LogTag, string.format("条件完成函数【%s】不存在", r10_382))
        end
      end
    end
  end
  -- close: r6_382
end
function r0_0.CompleteSystemCondition(r0_383)
  -- line: [4998, 5006] id: 383
  local r1_383 = require("BluePrints.UI.GMInterface.GMFunctionLibrary")
  r1_383.ExecConsoleCommand(r0_383:GetGameInstance(), "sgm sysu")
  r0_383:SuccessAllSystemGuide()
  r1_383.ExecConsoleCommand(r0_383:GetGameInstance(), "sgm CompleteCondition " .. tostring(8002))
  r1_383.ExecConsoleCommand(r0_383:GetGameInstance(), "sgm CompleteCondition " .. tostring(4220))
  r1_383.ExecConsoleCommand(r0_383:GetGameInstance(), "sgm CompleteCondition " .. tostring(4170))
  r1_383.ExecConsoleCommand(r0_383:GetGameInstance(), "sgm CompleteCondition " .. tostring(2001))
end
function r0_0.MockAllSystemCondition(r0_384, r1_384)
  -- line: [5009, 5029] id: 384
  local r2_384 = GWorld:GetAvatar()
  if r2_384 then
    r2_384.bCrackUnlockAllSystems = true
  end
  local r5_384 = r0_384:GetGameInstance():GetGameUIManager():GetUIObj("BattleMain")
  if r5_384 then
    r5_384:InitBtnList()
    r5_384.Btn_Esc:LoadImage(11)
    r5_384.Battle_Map:OnChangeKeyBoardSet()
    r5_384:EndChat()
    r5_384:InitChat()
    r5_384:_RefreshEscReddot()
  end
  if r1_384 == "1" then
    require("EMCache.EMCache"):Set("GM_MockAllSystemCondition", true, true)
  end
end
function r0_0.MockSystemCondition(r0_385, r1_385)
  -- line: [5032, 5043] id: 385
  local r2_385 = GWorld:GetAvatar()
  if r2_385 then
    r2_385.CrackedUnlockSystems[r1_385] = true
  end
  local r5_385 = r0_385:GetGameInstance():GetGameUIManager():GetUIObj("BattleMain")
  if r5_385 then
    r5_385:InitBtnList()
  end
end
function r0_0.ShowSystemUnlock(r0_386, r1_386)
  -- line: [5045, 5055] id: 386
  GWorld:GetAvatar():OnSystemFirstTimeUnlock_Internal(r1_386, function()
    -- line: [5047, 5054] id: 387
    UIManager(GWorld.GameInstance):UnLoadUINew("SystemUnlockGuide")
    local r0_387 = UIManager(GWorld.GameInstance):GetUIObj("BattleMain")
    if r0_387 ~= nil and r0_387.Pos_SubSystemUnlock ~= nil then
      r0_387.Pos_SubSystemUnlock:ClearChildren()
      r0_387.Pos_SubSystemUnlock:SetVisibility(ESlateVisibility.Collapsed)
    end
  end)
end
function r0_0.FakeUIUnlockConditionComplete(r0_388, ...)
  -- line: [5058, 5067] id: 388
  local r1_388 = {
    ...
  }
  local r2_388 = #r1_388
  local r3_388 = GWorld:GetAvatar()
  if r3_388 and r2_388 > 0 then
    for r7_388 = 1, r2_388, 1 do
      r3_388:UIUnlockMgrOnConditionComplete(tonumber(r1_388[r7_388]))
    end
  end
end
function r0_0.UnLockAllDungeonSelectLevels(r0_389)
  -- line: [5070, 5086] id: 389
  local r2_389 = {}
  local r3_389 = GWorld:GetAvatar()
  for r8_389, r9_389 in pairs(DataMgr.SelectDungeon) do
    local r10_389 = r9_389.Condition
    if r10_389 then
      for r15_389, r16_389 in pairs(r10_389) do
        if not ConditionUtils.CheckCondition(r3_389, r16_389) then
          table.insert(r2_389, r16_389)
        end
      end
      -- close: r11_389
    end
  end
  -- close: r4_389
  r0_389:CompleteCondition(r2_389)
end
function r0_0.UnLockAllDungeonLevels(r0_390)
  -- line: [5089, 5105] id: 390
  local r2_390 = {}
  local r3_390 = GWorld:GetAvatar()
  for r8_390, r9_390 in pairs(DataMgr.Dungeon) do
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
function r0_0.PlaySequence(r0_391, r1_391)
  -- line: [5107, 5116] id: 391
  local r2_391 = LoadObject(r1_391)
  if not r2_391 then
    DebugPrint("error GM播放sequence传入路径错误", r1_391)
    return 
  end
  local r3_391, r4_391 = UE4.ULevelSequencePlayer.CreateLevelSequencePlayer(r0_391:GetGameInstance(), r2_391, UE4.FMovieSceneSequencePlaybackSettings())
  r4_391:Play()
end
function r0_0.FSMDebug(r0_392, r1_392)
  -- line: [5118, 5134] id: 392
  if r1_392 ~= nil and tonumber(r1_392) == nil then
    UE4.UCharacterFSM.EnableTagDebug(r1_392)
    return 
  end
  local r3_392 = UE4.UGameplayStatics.GetPlayerCharacter(r0_392:GetGameInstance(), 0)
  if not r1_392 then
    r3_392.CharFSMComp.bDebugMode = not r3_392.CharFSMComp.bDebugMode
  else
    local r4_392 = Battle(r3_392):GetEntity(tonumber(r1_392))
    if r4_392 then
      r4_392.CharFSMComp.bDebugMode = not r4_392.CharFSMComp.bDebugMode
    end
  end
end
function r0_0.CompleteImpressionSystem(r0_393, r1_393, r2_393)
  -- line: [5136, 5162] id: 393
  r1_393 = tonumber(r1_393)
  local r3_393 = ""
  local function r4_393()
    -- line: [5139, 5143] id: 394
    DebugPrint("GM_Command:CompleteImpressionSystem@", r3_393)
    GWorld.GameInstance:GetGameUIManager():ShowUITip(UIConst.Tip_CommonToast, r3_393, 3)
  end
  if not r1_393 then
    r3_393 = "TalkTriggerId为空"
    r4_393()
    return 
  end
  local r5_393 = GWorld:GetAvatar()
  if not r5_393 then
    r3_393 = "Avatar不存在"
    r4_393()
    return 
  end
  if r5_393.ImpressionTalkTriggers[r1_393] then
    r3_393 = "对应的对话已完成，无法重复完成"
    r4_393()
    return 
  end
  r5_393:SetTalkTriggerComplete_New(r1_393)
end
function r0_0.SystemGuideSwitch(r0_395, r1_395)
  -- line: [5165, 5178] id: 395
  if r1_395 == "Open" then
    SystemGuideManager.Invalid = false
    DebugPrint("系统引导打开")
    return 
  end
  if r1_395 == "Close" then
    SystemGuideManager.Invalid = true
    DebugPrint("系统引导关闭")
    return 
  end
end
function r0_0.SuccessAllSystemGuide(r0_396)
  -- line: [5180, 5185] id: 396
  DebugPrint("GM_Command:SuccessAllSystemGuide:Success all SystemGuide")
  SystemGuideManager:GMEnforceFinishAllSysGuide()
end
function r0_0.SwitchCullModifier(r0_397, r1_397)
  -- line: [5187, 5195] id: 397
  if r1_397 == "true" then
    DebugPrint("UE4.AEMRecastNavMesh.SwitchCullModifier(true)")
    UE4.AEMRecastNavMesh.SwitchCullModifier(true)
  else
    DebugPrint("UE4.AEMRecastNavMesh.SwitchCullModifier(false)")
    UE4.AEMRecastNavMesh.SwitchCullModifier(false)
  end
end
function r0_0.I18Time(r0_398, r1_398, r2_398)
  -- line: [5197, 5210] id: 398
  r2_398 = string.lower(r2_398)
  if r2_398 == "cn" then
    DebugPrint("Current I18Time: " .. GDate(r1_398, nil, CommonConst.SystemLanguages.CN))
  elseif r2_398 == "en" then
    DebugPrint("Current I18Time: " .. GDate(r1_398, nil, CommonConst.SystemLanguages.EN))
  elseif r2_398 == "jp" then
    DebugPrint("Current I18Time: " .. GDate(r1_398, nil, CommonConst.SystemLanguages.JP))
  elseif r2_398 == "kr" then
    DebugPrint("Current I18Time: " .. GDate(r1_398, nil, CommonConst.SystemLanguages.KR))
  else
    DebugPrint("Current I18Time: " .. GDate(r1_398, nil, CommonConst.SystemLanguages.CN))
  end
end
function r0_0.PrintGuideBook(r0_399)
  -- line: [5212, 5220] id: 399
  local r1_399 = GWorld:GetAvatar()
  if r1_399 and r1_399.GuideBook then
    for r6_399, r7_399 in pairs(r1_399.GuideBook) do
      local r8_399 = r7_399.Reward
      if r8_399 == 1 then
        r8_399 = "未领取" and "已领取"
      else
        goto label_18	-- block#5 is visited secondly
      end
      DebugPrint("教学条目Id:", r6_399, "状态:", r8_399)
    end
    -- close: r2_399
  end
end
function r0_0.GuideBookGetReward(r0_400, r1_400)
  -- line: [5222, 5227] id: 400
  local r2_400 = GWorld:GetAvatar()
  if r2_400 then
    r2_400:GuideBookGetReward(tonumber(r1_400))
  end
end
function r0_0.TestWarningToast(r0_401, r1_401, r2_401)
  -- line: [5229, 5233] id: 401
  r0_401:GetGameInstance():GetGameUIManager():ShowUITip(UIConst.Tip_CommonWarning, r1_401, tonumber(r2_401))
end
function r0_0.PlayLightHit(r0_402, r1_402, r2_402)
  -- line: [5235, 5254] id: 402
  for r8_402, r9_402 in pairs(UE4.UGameplayStatics.GetGameState(r0_402.Player).MonsterMap) do
    if r9_402:GetCamp() == ECampName.Monster then
      local r10_402 = UE4.FHitParams()
      r10_402.CauseHitName = r2_402 and "LightHit_120"
      r10_402.CauseHitType = Const.CauseHitTypeNormal
      r9_402:SetCharacterTag("LightHit")
      r9_402:ProcessHit("LightHit", r0_402.Player, r10_402)
    end
  end
  -- close: r4_402
  if tonumber(r1_402) == 1 then
    local r4_402 = UE4.FHitParams()
    r4_402.CauseHitName = r2_402 and "LightHit_120"
    r4_402.CauseHitType = Const.CauseHitTypeNormal
    r0_402.Player:SetCharacterTag("LightHit")
    r0_402.Player:ProcessHit("LightHit", r0_402.Player, r4_402)
  end
end
function r0_0.PlayLightHitRanged(r0_403, r1_403, r2_403)
  -- line: [5256, 5275] id: 403
  for r8_403, r9_403 in pairs(UE4.UGameplayStatics.GetGameState(r0_403.Player).MonsterMap) do
    if r9_403:GetCamp() == ECampName.Monster then
      local r10_403 = UE4.FHitParams()
      r10_403.CauseHitName = r2_403 and "RangedWeapon_Common"
      r10_403.CauseHitType = Const.CauseHitTypeNormal
      r9_403:SetCharacterTag("LightHitRanged")
      r9_403:ProcessHit("LightHitRanged", r0_403.Player, r10_403)
    end
  end
  -- close: r4_403
  if tonumber(r1_403) == 1 then
    local r4_403 = UE4.FHitParams()
    r4_403.CauseHitName = r2_403 and "RangedWeapon_Common"
    r4_403.CauseHitType = Const.CauseHitTypeNormal
    r0_403.Player:SetCharacterTag("LightHitRanged")
    r0_403.Player:ProcessHit("LightHitRanged", r0_403.Player, r4_403)
  end
end
function r0_0.PlayHeavyHit(r0_404, r1_404, r2_404)
  -- line: [5277, 5296] id: 404
  for r8_404, r9_404 in pairs(UE4.UGameplayStatics.GetGameState(r0_404.Player).MonsterMap) do
    if r9_404:GetCamp() == ECampName.Monster then
      local r10_404 = UE4.FHitParams()
      r10_404.CauseHitName = r2_404 and "HeavyHit_30"
      r10_404.CauseHitType = Const.CauseHitTypeNormal
      r9_404:SetCharacterTag("HeavyHit")
      r9_404:ProcessHit("HeavyHit", r0_404.Player, r10_404)
    end
  end
  -- close: r4_404
  if tonumber(r1_404) == 1 then
    local r4_404 = UE4.FHitParams()
    r4_404.CauseHitName = r2_404 and "HeavyHit_30"
    r4_404.CauseHitType = Const.CauseHitTypeNormal
    r0_404.Player:SetCharacterTag("HeavyHit")
    r0_404.Player:ProcessHit("HeavyHit", r0_404.Player, r4_404)
  end
end
function r0_0.PlayHitFly(r0_405, r1_405, r2_405)
  -- line: [5298, 5315] id: 405
  for r8_405, r9_405 in pairs(UE4.UGameplayStatics.GetGameState(r0_405.Player).MonsterMap) do
    local r10_405 = UE4.FHitParams()
    r10_405.CauseHitName = r2_405 and "HitFly_XY500Z1000"
    r10_405.CauseHitType = Const.CauseHitTypeNormal
    r9_405:SetCharacterTag("HitFly")
    r9_405:ProcessHitFly(r0_405.Player, r10_405)
  end
  -- close: r4_405
  if tonumber(r1_405) == 1 then
    local r4_405 = UE4.FHitParams()
    r4_405.CauseHitName = r2_405 and "HitFly_XY400Z300"
    r4_405.CauseHitType = Const.CauseHitTypeNormal
    r0_405.Player:SetCharacterTag("HitFly")
    r0_405.Player:ProcessHitFly(r0_405.Player, r4_405)
  end
end
function r0_0.PlayHitFly_Force(r0_406, r1_406)
  -- line: [5317, 5328] id: 406
  for r7_406, r8_406 in pairs(UE4.UGameplayStatics.GetGameState(r0_406.Player).MonsterMap) do
    if r8_406:GetCamp() == ECampName.Monster then
      local r9_406 = UE4.FHitParams()
      r9_406.CauseHitName = r1_406 and "HitFly_Force_Common"
      r9_406.CauseHitType = Const.CauseHitTypeNormal
      r8_406:SetCharacterTag("HitFly")
      r8_406:ProcessHitFly(r0_406.Player, r9_406)
    end
  end
  -- close: r3_406
end
function r0_0.EnterRougeLike(r0_407, r1_407, r2_407, r3_407)
  -- line: [5330, 5337] id: 407
  print(_G.LogTag, "EnterRougeLike", r1_407, r2_407, r3_407)
  if not r1_407 then
    r1_407 = ""
  end
  if not r2_407 then
    r2_407 = ""
  end
  if not r3_407 then
    r3_407 = ""
  end
  require("BluePrints.UI.GMInterface.GMFunctionLibrary").ExecConsoleCommand(r0_407:GetGameInstance(), "sgm EnterRougeLike " .. r1_407 .. " " .. r2_407 .. " " .. r3_407)
end
function r0_0.UpgradeAward(r0_408, r1_408, r2_408)
  -- line: [5339, 5344] id: 408
  local r3_408 = GWorld:GetAvatar()
  if r3_408 then
    r3_408:UpgradeAward(r1_408, r2_408)
  end
end
function r0_0.StartAutoTest(r0_409)
  -- line: [5346, 5363] id: 409
  local r2_409 = UE4.UGameplayStatics.GetGameMode(r0_409.Player)
  local r3_409 = r0_409.Player:K2_GetActorLocation()
  local r5_409 = UE4.UGameplayStatics.GetPlayerController(r0_409.Player, 0):GetAvatarInfo()
  local r6_409 = AEventMgr.CreateUnitContext()
  r6_409.UnitId = 1
  r6_409.IntParams:Add("RoleId", r0_409.Player.CurrentRoleId)
  r6_409.UnitType = "Phantom"
  r6_409.Loc = r3_409
  r6_409.NameParams:Add("Camp", "Player")
  r6_409.BoolParams:Add("FixLocation", true)
  r6_409:AddLuaTable("AvatarInfo", r5_409)
  r2_409.EMGameState.EventMgr:CreateUnitNew(r6_409, false)
end
function r0_0.AutoBattleTestServer(r0_410, r1_410)
  -- line: [5365, 5370] id: 410
  local r2_410 = GWorld:GetAvatar()
  if r2_410 then
    r2_410:CallServerMethod("GMTestAutoBattle", r1_410)
  end
end
function r0_0.AutoBattleTestClient(r0_411, r1_411)
  -- line: [5372, 5377] id: 411
  local r2_411 = GWorld:GetAvatar()
  if r2_411 then
    r2_411:CallServerMethod("GMTestAutoBattle", r1_411, true)
  end
end
function r0_0.StopAutoBattleTest(r0_412, r1_412)
  -- line: [5379, 5388] id: 412
  local r2_412 = false
  if r1_412 then
    r2_412 = true
  end
  local r3_412 = GWorld:GetAvatar()
  if r3_412 then
    r3_412:CallServerMethod("GMStopAutoBattleTest", r2_412)
  end
end
function r0_0.StartVote(r0_413)
  -- line: [5390, 5400] id: 413
  if IsStandAlone(r0_413:GetGameInstance()) then
    UE4.UGameplayStatics.GetGameMode(r0_413.Player):TriggerActiveGameModeState(5)
  else
    r0_413:DedicatedServerCommand("StartVote")
  end
end
function r0_0.SpawnPet(r0_414)
  -- line: [5402, 5409] id: 414
  if IsStandAlone(r0_414:GetGameInstance()) then
    UE4.UGameplayStatics.GetGameMode(r0_414.Player):TriggerSpawnPet()
  else
    r0_414:DedicatedServerCommand("SpawnPet")
  end
end
function r0_0.PostCustomEvent(r0_415, r1_415)
  -- line: [5411, 5421] id: 415
  DebugPrint("GM PostCustomEvent", r1_415)
  if IsStandAlone(r0_415:GetGameInstance()) then
    UE4.UGameplayStatics.GetGameMode(r0_415.Player):PostCustomEvent(r1_415)
  else
    r0_415:DedicatedServerCommand("PostCustomEvent", r1_415)
  end
end
function r0_0.SetFeinaStar(r0_416, r1_416)
  -- line: [5423, 5428] id: 416
  UE4.UGameplayStatics.GetGameMode(r0_416.Player):TriggerDungeonComponentFun("SetStar", tonumber(r1_416))
end
function r0_0.EnterAbyss(r0_417, r1_417, r2_417)
  -- line: [5430, 5443] id: 417
  local r3_417 = tonumber(r1_417)
  local r4_417 = DataMgr.AbyssDungeon[r3_417].DungeonId
  local r5_417 = tonumber(r2_417)
  GWorld.GameInstance.TempAbyssInfo = {
    AbyssDungeonId = r3_417,
    AbyssDifficulty = r5_417,
  }
  DebugPrint("GM_EnterAbyss AbyssDungeonId", r3_417, "DungeonId", r4_417, "AbyssDifficulty", r5_417)
  r0_417:EnterDungeon(r4_417)
end
function r0_0.EnterAbyssNew(r0_418, r1_418, r2_418, r3_418)
  -- line: [5445, 5460] id: 418
  local function r4_418(r0_419)
    -- line: [5449, 5455] id: 419
    if not ErrorCode:Check(r0_419) then
      return 
    end
    DebugPrint("GM_EnterAbyssNew Success AbyssId", r1_418, "AbyssLevelId", r2_418, "AbyssDungeonIndex", r3_418)
  end
  local r5_418 = r0_418:GetClientAvatar()
  if r5_418 then
    r5_418:TriggerEnterAbyss(r4_418, tonumber(r1_418), tonumber(r2_418), tonumber(r3_418))
  end
end
function r0_0.PrintAllDailyTask(r0_420)
  -- line: [5462, 5470] id: 420
  local r1_420 = GWorld:GetAvatar()
  if not r1_420 then
    return 
  end
  r1_420:UpdateStoryVariable("PhotoTalk110105", 1)
end
function r0_0.AbyssPassRoom(r0_421)
  -- line: [5472, 5491] id: 421
  local r1_421 = UE4.UGameplayStatics.GetGameMode(r0_421.Player)
  for r6_421, r7_421 in pairs(r1_421.MonsterSpawnMap) do
    r7_421:ClearMonsterSpawnInfo()
    if IsValid(r1_421.MonsterSpawnMap:Find(r7_421.UnitSpawnId)) then
      r1_421.MonsterSpawnMap:Remove(r7_421.UnitSpawnId)
    end
    r7_421:K2_DestroyActor()
  end
  -- close: r2_421
  r0_421:ServerBattleCommand("KillMonster", r0_421.Player.Eid)
  for r6_421, r7_421 in pairs(r1_421.SubGameModeInfo) do
    r7_421:BpDelTimer("AbyssBattle", false, Const.GameModeEventServerClient)
    r7_421:AbyssRoomEnd(EAbyssRoomEndReason.MissionClear)
    r7_421:TeleportToNextRoom()
    return 
  end
  -- close: r2_421
end
function r0_0.ReduceBuffLayer(r0_422, r1_422, r2_422)
  -- line: [5493, 5497] id: 422
  local r4_422 = UE4.UGameplayStatics.GetPlayerCharacter(r0_422:GetGameInstance(), 0)
  r4_422:ReduceBuffLayer(r4_422, tonumber(r1_422), tonumber(r2_422))
end
function r0_0.ChangeBuffLastTime(r0_423, r1_423, r2_423, r3_423)
  -- line: [5499, 5503] id: 423
  UE4.UGameplayStatics.GetPlayerCharacter(r0_423:GetGameInstance(), 0):ChangeBuffLastTime(tonumber(r1_423), 0, tonumber(r2_423), r3_423)
end
function r0_0.TestTrackingQuest(r0_424, r1_424)
  -- line: [5505, 5511] id: 424
  local r2_424 = tonumber(r1_424)
  local r3_424 = GWorld:GetAvatar()
  if r3_424 and r2_424 then
    r3_424:SetQuestTracking(r2_424)
  end
end
function r0_0.SetBGMOpenDebug(r0_425, r1_425)
  -- line: [5513, 5519] id: 425
  if r1_425 == "true" then
    AudioManager(r0_425.Player):SetBGMDebugValue(true)
  elseif r1_425 == "false" then
    AudioManager(r0_425.Player):SetBGMDebugValue(false)
  end
end
function r0_0.PrintBGMInfo(r0_426)
  -- line: [5521, 5523] id: 426
  AudioManager(r0_426.Player):PrintBGMInfo()
end
function r0_0.GetAllBusVolume(r0_427)
  -- line: [5525, 5527] id: 427
  AudioManager(r0_427.Player):GetAllBusVolume()
end
function r0_0.GetAllBusPauseState(r0_428)
  -- line: [5529, 5531] id: 428
  AudioManager(r0_428.Player):GetAllBusPauseState()
end
function r0_0.ReloadAllBank(r0_429)
  -- line: [5533, 5535] id: 429
  UE4.UFMODBlueprintStatics.ReloadAllBank()
end
function r0_0.TriggerLoadedEvent(r0_430)
  -- line: [5537, 5546] id: 430
  DebugPrint("TriggerLoadedEvent")
  local r1_430 = UE4.UGameplayStatics.GetGameMode(r0_430:GetGameInstance())
  if r1_430 then
    r1_430:TriggerLoadedEvent()
    return 
  end
end
function r0_0.SetDrawDebugEnabled(r0_431, r1_431)
  -- line: [5548, 5555] id: 431
  if r1_431 == "true" then
    AudioManager(r0_431.Player).DrawDebug = true
  elseif r1_431 == "false" then
    AudioManager(r0_431.Player).DrawDebug = false
  end
end
function r0_0.SetSoundPointCompDebugEnabled(r0_432, r1_432)
  -- line: [5557, 5566] id: 432
  if not r0_432.Player.SoundPointManagerComp then
    return 
  end
  if r1_432 == "true" then
    r0_432.Player.SoundPointManagerComp.EnableDebug = true
  elseif r1_432 == "false" then
    r0_432.Player.SoundPointManagerComp.EnableDebug = false
  end
end
function r0_0.SetSoundSplineDrawDebug(r0_433, r1_433)
  -- line: [5568, 5579] id: 433
  local r2_433 = nil
  if r1_433 == "true" then
    r2_433 = true
  elseif r1_433 == "false" then
    r2_433 = false
  end
  for r8_433, r9_433 in pairs(UGameplayStatics.GetAllActorsOfClass(r0_433.Player, ASoundSpline:StaticClass()):ToTable()) do
    r9_433.SplineDrawDebug = r2_433
  end
  -- close: r4_433
end
function r0_0.SetReverLogicOpenbDebug(r0_434, r1_434)
  -- line: [5581, 5589] id: 434
  if r1_434 == "true" then
    AudioManager(r0_434.Player).ReverbLogicDebug = true
  elseif r1_434 == "false" then
    AudioManager(r0_434.Player).ReverbLogicDebug = false
  end
end
function r0_0.PrintHeadPhonePlugIn(r0_435)
  -- line: [5591, 5593] id: 435
  AudioManager(r0_435.Player):DebugPrintHeadPhonePlugInParam()
end
function r0_0.SetAudioManagerTestRegionId(r0_436, r1_436)
  -- line: [5595, 5597] id: 436
  AudioManager(r0_436.Player).TestRegionId = tonumber(r1_436)
end
function r0_0.SimulateBGMEnterNewRegion(r0_437, r1_437)
  -- line: [5599, 5602] id: 437
  AudioManager(r0_437.Player).TestRegionId = tonumber(r1_437)
  AudioManager(r0_437.Player):CheckLevelSoundAndRegionId(tonumber(r1_437))
end
function r0_0.SetLineSoundDebug(r0_438, r1_438)
  -- line: [5604, 5610] id: 438
  if r1_438 == "true" then
    AudioManager(r0_438.Player).LineSound_DrawDebug = true
  elseif r1_438 == "false" then
    AudioManager(r0_438.Player).LineSound_DrawDebug = false
  end
end
function r0_0.SectorSoundDebug(r0_439, r1_439)
  -- line: [5612, 5618] id: 439
  if r1_439 == "true" then
    AudioManager(r0_439.Player).SectorSound_DrawDebug = true
  elseif r1_439 == "false" then
    AudioManager(r0_439.Player).SectorSound_DrawDebug = false
  end
end
function r0_0.CircularSoundDebug(r0_440, r1_440)
  -- line: [5620, 5626] id: 440
  if r1_440 == "true" then
    AudioManager(r0_440.Player).Circular_DrawDebug = true
  elseif r1_440 == "false" then
    AudioManager(r0_440.Player).Circular_DrawDebug = false
  end
end
function r0_0.PrintEventsMap(r0_441)
  -- line: [5628, 5630] id: 441
  AudioManager(r0_441.Player):PrintEventsMap()
end
function r0_0.PrintAUAForbidTag(r0_442)
  -- line: [5632, 5634] id: 442
  AudioManager(r0_442.Player):PrintAuANotifyForbidTag()
end
function r0_0.PrintCurAuActionCount(r0_443)
  -- line: [5636, 5638] id: 443
  AudioManager(r0_443.Player):PrintCurAuActionCount()
end
function r0_0.RogueShopTest(r0_444)
  -- line: [5641, 5657] id: 444
  local r1_444 = r0_444:GetGameInstance():GetGameUIManager()
  if not GWorld:GetAvatar() then
    return 
  end
  local r3_444 = GWorld.RougeLikeManager
  if not r3_444 then
    return 
  end
  local r4_444 = r3_444.Shop:Keys()
  local r5_444 = nil
  if r4_444:Length() > 0 then
    r5_444 = r4_444[1]
  end
  r1_444:LoadUINew("RougeShop", r5_444)
end
function r0_0.RougeDetailsTest(r0_445)
  -- line: [5659, 5662] id: 445
  r0_445:GetGameInstance():GetGameUIManager():LoadUINew("RougeBag")
end
function r0_0.ShowRougeManual(r0_446)
  -- line: [5664, 5669] id: 446
  local r1_446 = GWorld:GetAvatar()
  if r1_446 then
    PrintTable(r1_446.RougeLike.Manual, 5)
  end
end
function r0_0.DisableBattleWheel(r0_447)
  -- line: [5671, 5678] id: 447
  local r1_447 = UE4.UGameplayStatics.GetPlayerController(r0_447:GetGameInstance(), 0)
  DebugPrint("gmy@GM_Command:DisableBattleWheel", r1_447.bEnableBattleWheel)
  r1_447.bEnableBattleWheel = false
  if r0_447.Player then
    r0_447.Player:RefreshBattleWheelEnableState()
  end
end
function r0_0.EnableBattleWheel(r0_448)
  -- line: [5680, 5687] id: 448
  local r1_448 = UE4.UGameplayStatics.GetPlayerController(r0_448:GetGameInstance(), 0)
  DebugPrint("gmy@GM_Command:EnableBattleWheel", r1_448.bEnableBattleWheel)
  r1_448.bEnableBattleWheel = true
  if r0_448.Player then
    r0_448.Player:RefreshBattleWheelEnableState()
  end
end
function r0_0.FillBattleWheel(r0_449)
  -- line: [5689, 5695] id: 449
  local r1_449 = GWorld:GetAvatar()
  for r7_449, r8_449 in ipairs({
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
    r1_449:ChangeBattleWheel(1, r7_449, r8_449)
  end
  -- close: r3_449
end
function r0_0.PrintBattleWheel(r0_450)
  -- line: [5697, 5704] id: 450
  local r2_450 = GWorld:GetAvatar().Wheels
  for r6_450 = 1, 24, 1 do
    DebugPrint("gmy@GM_Command GM_Command:PrintBattleWheel", r6_450, r2_450[1][r6_450].ResourceId)
  end
end
function r0_0.AddPet(r0_451, r1_451)
  -- line: [5706, 5708] id: 451
  r0_451:ServerBattleCommand("AddPet", r1_451)
end
function r0_0.AddPetAffix(r0_452, r1_452)
  -- line: [5710, 5712] id: 452
  r0_452:ServerBattleCommand("AddPetAffix", r1_452)
end
function r0_0.RemovePet(r0_453)
  -- line: [5714, 5716] id: 453
  r0_453:ServerBattleCommand("RemovePet")
end
function r0_0.RemovePetAffix(r0_454, r1_454)
  -- line: [5718, 5720] id: 454
  r0_454:ServerBattleCommand("RemovePetAffix", r1_454)
end
function r0_0.PrintTeammates(r0_455)
  -- line: [5722, 5727] id: 455
  for r6_455, r7_455 in pairs(r0_455.Player:GetAllTeammates()) do
    DebugPrint("gmy@GM_Command:PrintTeammates", r6_455, r7_455:GetName())
  end
  -- close: r2_455
end
function r0_0.PrintPlayers(r0_456)
  -- line: [5729, 5736] id: 456
  for r7_456, r8_456 in pairs(UE4.UGameplayStatics.GetGameState(r0_456.Player):GetAllPlayer()) do
    DebugPrint("gmy@GM_Command:PrintPlayers", r7_456, r8_456:GetName())
  end
  -- close: r3_456
end
function r0_0.ShowCountdownToast(r0_457, r1_457, r2_457)
  -- line: [5738, 5747] id: 457
  r1_457 = tonumber(r1_457)
  r2_457 = tonumber(r2_457)
  local r4_457 = r0_457:GetGameInstance():GetGameUIManager()
  if r4_457 then
    r4_457:LoadUINew("DungeonCaptureFloat", r1_457, r2_457):UIStateChange_OnTarget()
  end
end
function r0_0.AddCountdownTime(r0_458, r1_458)
  -- line: [5749, 5757] id: 458
  r1_458 = tonumber(r1_458)
  local r3_458 = r0_458:GetGameInstance():GetGameUIManager()
  if r3_458 then
    r3_458:GetUIObj("DungeonCaptureFloat"):AddRemainingTime(r1_458)
  end
end
function r0_0.ForceUseSkill(r0_459, r1_459, r2_459)
  -- line: [5759, 5766] id: 459
  if DrawDebugTest then
    r0_459.Player:ServerUseSkillTest(tonumber(r1_459), tonumber(r2_459))
  end
end
function r0_0.UnlockMonsterGallery(r0_460)
  -- line: [5768, 5776] id: 460
  local r1_460 = GWorld:GetAvatar()
  for r6_460, r7_460 in pairs(DataMgr.GalleryRule) do
    if not r7_460.DisableTrainingGround then
      r1_460:CheckFirstMonster(r7_460.PreferredMonsterId, false)
    end
  end
  -- close: r2_460
end
function r0_0.ShowHudReward(r0_461, r1_461, r2_461, r3_461)
  -- line: [5778, 5843] id: 461
  local r4_461 = {}
  r2_461 = tonumber(r2_461)
  if r1_461 == "Quest" then
    if DataMgr.QuestChain[r2_461] == nil or DataMgr.QuestChain[r2_461].QuestChainReward == nil then
      DebugPrint("QuestChainId is error or QuestChainReward is nil")
      return 
    end
    for r10_461, r11_461 in pairs(DataMgr.QuestChain[r2_461].QuestChainReward) do
      local r12_461 = DataMgr.Reward[r11_461]
      if r12_461 then
        local r13_461 = r12_461.Id and {}
        local r14_461 = r12_461.Count and {}
        local r15_461 = r12_461.Type and {}
        for r19_461 = 1, #r13_461, 1 do
          local r20_461 = r13_461[r19_461]
          table.insert(r4_461, {
            ItemType = r15_461[r19_461],
            ItemId = r20_461,
            Count = RewardUtils:GetCount(r14_461[r19_461]),
            Rarity = ItemUtils.GetItemRarity(r20_461, r15_461[r19_461]),
          })
        end
      end
    end
    -- close: r6_461
  elseif r1_461 == "Reward" then
    local r5_461 = DataMgr.Reward[r2_461]
    local r6_461 = {}
    if r5_461 then
      local r7_461 = r5_461.Id and {}
      local r8_461 = r5_461.Count and {}
      local r9_461 = r5_461.Type and {}
      for r13_461 = 1, #r7_461, 1 do
        local r14_461 = r7_461[r13_461]
        table.insert(r4_461, {
          ItemType = r9_461[r13_461],
          ItemId = r14_461,
          Count = RewardUtils:GetCount(r8_461[r13_461]),
          Rarity = ItemUtils.GetItemRarity(r14_461, r9_461[r13_461]),
        })
      end
    end
  else
    table.insert(r4_461, {
      ItemType = r1_461,
      ItemId = r2_461,
      Count = r3_461,
      Rarity = ItemUtils.GetItemRarity(r2_461, r1_461),
    })
  end
  table.sort(r4_461, function(r0_462, r1_462)
    -- line: [5838, 5840] id: 462
    return r1_462.Rarity < r0_462.Rarity
  end)
  UIUtils.ShowHudReward("测试", r4_461)
end
function r0_0.FXPriorityTest(r0_463)
  -- line: [5845, 5870] id: 463
  local r2_463 = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_RunAttack01_dg_Pro.NS_Huipo_RunAttack01_dg_Pro"
  local r3_463 = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_RunAttack01_dg_Pro.NS_Huipo_RunAttack01_dg_Pro"
  r0_463.Player.FXComponent:PlayFX(LoadObject("/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_RunAttack01_dg_Pro.NS_Huipo_RunAttack01_dg_Pro"), r0_463.Player.Mesh, nil, r0_463.Player:K2_GetActorLocation(), FRotator(0, 0, 0), true, false, false, false, EAttachLocation.KeepWorldPosition, EFXPriorityType.Lowest)
  r0_463.Player:AddTimer(0.1, function()
    -- line: [5855, 5858] id: 464
    r0_463.Player.FXComponent:PlayFX(LoadObject(r2_463), r0_463.Player.Mesh, nil, r0_463.Player:K2_GetActorLocation() + FVector(0, 300, 0), FRotator(0, 0, 0), true, false, false, false, EAttachLocation.KeepWorldPosition, EFXPriorityType.Dead)
  end, false, 0, "FXTest1", false)
  r0_463.Player:AddTimer(0.2, function()
    -- line: [5860, 5863] id: 465
    r0_463.Player.FXComponent:PlayFX(LoadObject(r3_463), r0_463.Player.Mesh, nil, r0_463.Player:K2_GetActorLocation() + FVector(0, 500, 0), FRotator(0, 0, 0), true, false, false, false, EAttachLocation.KeepWorldPosition, EFXPriorityType.Born)
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
function r0_0.FXPriorityTest_Char(r0_466, r1_466)
  -- line: [5893, 5932] id: 466
  local r2_466 = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(r0_466.Player, UFXPreloadGameInstanceSubsystem)
  local r3_466 = r0_466.Player:K2_GetActorLocation()
  local r4_466 = FVector(100, 0, 0)
  local r5_466 = 0
  local r6_466 = FVector(0, 100, 0)
  local r7_466 = 0
  local function r8_466(r0_467)
    -- line: [5901, 5922] id: 467
    if not r0_467 then
      return 
    end
    r2_466:PreloadCharacterFX(r0_467)
    for r6_467, r7_467 in pairs(r2_466.CharacterNiagaraSystems:ToArray()) do
      table.insert(r3_0, r0_466.Player.FXComponent:PlayFX(r7_467, r0_466.Player.Mesh, nil, r3_466, FRotator(0, 0, 0), true, false, false, false, EAttachLocation.KeepWorldPosition, EFXPriorityType.Lowest))
      r5_466 = r5_466 + 1
    end
    -- close: r2_467
    r7_466 = r7_466 + 1
  end
  if r1_466 and tonumber(r1_466) > 0 then
    r8_466(r2_0[tonumber(r1_466)])
  else
    for r13_466, r14_466 in pairs(r2_0) do
      r8_466(r14_466)
    end
    -- close: r9_466
  end
end
function r0_0.ClearFXTest(r0_468)
  -- line: [5934, 5942] id: 468
  for r5_468, r6_468 in pairs(r3_0) do
    if IsValid(r6_468) then
      UE4.UCharacterFunctionLibrary.DeactivateNiagaraImmediately(r6_468)
    end
  end
  -- close: r1_468
  r3_0 = {}
  r0_468:ManualGC()
end
function r0_0.PrintAllFXPath(r0_469)
  -- line: [5944, 5951] id: 469
  local r3_469, r4_469 = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(r0_469.Player, UE4.URolePreloadGameInstanceSubsystem).GetFolderAssetPaths("Asset/Effect/Niagara/")
  for r9_469, r10_469 in ipairs(r4_469:ToTable()) do
    print(_G.LogTag, r10_469)
  end
  -- close: r5_469
end
function r0_0.LevelFXTest(r0_470, r1_470)
  -- line: [5953, 5961] id: 470
  r0_470.Player.FXComponent:SpawnFXAtLocation_Level(r1_470, "Test", true, r0_470.Player:K2_GetActorLocation())
  r0_470.Player.FXComponent:SpawnFXAtLocation_Level(r1_470, "Test", true, r0_470.Player:K2_GetActorLocation())
  local function r2_470(r0_471)
    -- line: [5956, 5958] id: 471
    print(_G.LogTag, "------------", r0_471)
  end
end
function r0_0.FXPriorityTest_One(r0_472, r1_472, r2_472)
  -- line: [5963, 5982] id: 472
  if not r1_472 then
    return 
  end
  for r7_472, r8_472 in pairs(r3_0) do
    if IsValid(r8_472) then
      UE4.UCharacterFunctionLibrary.DeactivateNiagaraImmediately(r8_472)
    end
  end
  -- close: r3_472
  r3_0 = {}
  local r3_472 = LoadObject(r1_472)
  if not r2_472 then
    r2_472 = 30
  end
  for r7_472 = 1, r2_472, 1 do
    table.insert(r3_0, r0_472.Player.FXComponent:PlayFX(r3_472, r0_472.Player.Mesh, nil, r0_472.Player:K2_GetActorLocation(), FRotator(0, 0, 0), true, false, false, false, EAttachLocation.KeepWorldPosition, EFXPriorityType.Lowest))
  end
end
function r0_0.CharacterTag(r0_473)
  -- line: [5984, 5986] id: 473
  DebugPrint("Tianyi@ CurrentTag: " .. r0_473.Player:GetCharacterTag())
end
function r0_0.CalcAttrOpt(r0_474, r1_474)
  -- line: [5988, 5997] id: 474
  local r2_474 = tonumber(r1_474)
  if not r2_474 then
    return 
  end
  local r3_474 = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UAttributesSetSubsystem:StaticClass())
  if r2_474 == 0 then
    r3_474:SwitchCalcAttrOptimization(false)
  elseif r2_474 == 1 then
    r3_474:SwitchCalcAttrOptimization(true)
  end
end
function r0_0.IsQuestChainLock(r0_475, r1_475)
  -- line: [5999, 6009] id: 475
  local r2_475 = GWorld:GetAvatar()
  if not r2_475 then
    return 
  end
  if r2_475:IsQuestChainLock(tonumber(r1_475)) then
    DebugPrint("Lock", r1_475)
  else
    DebugPrint("Not Lock", r1_475)
  end
end
function r0_0.IsQuestChainUnlock(r0_476, r1_476)
  -- line: [6011, 6021] id: 476
  local r2_476 = GWorld:GetAvatar()
  if not r2_476 then
    return 
  end
  if r2_476:IsQuestChainUnlock(tonumber(r1_476)) then
    DebugPrint("UnLock", r1_476)
  else
    DebugPrint("Not UnLock", r1_476)
  end
end
function r0_0.MonsterSpawnPointDistributeLogicTest(r0_477)
  -- line: [6023, 6025] id: 477
  AMonsterSpawn.GMTestDistributedMonsterLogic(r0_477.Player)
end
function r0_0.UMGAnimationsTime(r0_478, r1_478)
  -- line: [6027, 6045] id: 478
  local r2_478 = r0_478:GetGameInstance()
  local r3_478 = r2_478:GetGameUIManager()
  UWidgetLayoutLibrary.RemoveAllWidgets(r2_478)
  local r4_478 = r3_478:CreateWidget(r1_478, true)
  if r4_478 == nil then
    ScreenPrint("can not find Widget")
    return 
  end
  for r10_478, r11_478 in pairs(UE4.UUIFunctionLibrary.GetAllAnimationOfUserWidget(r4_478)) do
    DebugPrint("UMGAnimationsTime Widget:", r1_478, "AnimationName: ", r10_478, "Time: ", r11_478:GetEndTime())
  end
  -- close: r6_478
end
function r0_0.EMPlayWidgetAnimation(r0_479, r1_479, r2_479)
  -- line: [6047, 6069] id: 479
  local r3_479 = r0_479:GetGameInstance()
  local r4_479 = r3_479:GetGameUIManager()
  UWidgetLayoutLibrary.RemoveAllWidgets(r3_479)
  local r5_479 = r4_479:CreateWidget(r1_479, true)
  if r5_479 == nil then
    ScreenPrint("can not find Widget")
    return 
  end
  local r7_479 = UE4.UUIFunctionLibrary.GetAllAnimationOfUserWidget(r5_479):Find(r2_479)
  if r7_479 == nil then
    ScreenPrint("can not find Animation")
    return 
  end
  EMUIAnimationSubsystem:EMPlayAnimation(r5_479, r7_479)
end
function r0_0.HideAllUI(r0_480, r1_480)
  -- line: [6071, 6081] id: 480
  local r2_480 = true
  if r1_480 == "0" then
    r2_480 = false
  end
  local r3_480 = r0_480:GetGameInstance()
  r3_480.ImmersionModel = r2_480
  r3_480:GetGameUIManager():HideAllUI(r2_480, "DefaultTag", true)
end
function r0_0.PlayUMGAnimation(r0_481, r1_481, r2_481, r3_481, r4_481)
  -- line: [6083, 6140] id: 481
  local r5_481 = r0_481:GetGameInstance()
  local r6_481 = r5_481:GetGameUIManager()
  UWidgetLayoutLibrary.RemoveAllWidgets(r5_481)
  if r4_481 == nil then
    r4_481 = 1
  end
  for r10_481 = 1, r4_481, 1 do
    local r11_481 = r6_481:CreateWidget(r1_481, true)
    if r11_481 == nil then
      ScreenPrint("can not find Widget")
      return 
    end
    if r2_481 == nil then
      r2_481 = 1
    end
    local r12_481 = UE4.UUIFunctionLibrary.GetAllAnimationOfUserWidget(r11_481)
    local r13_481 = nil	-- notice: implicit variable refs by block#[9, 11]
    if r3_481 == nil then
      r13_481 = nil
      r13_481 = coroutine.create(function()
        -- line: [6106, 6117] id: 482
        for r3_482 = 1, r2_481, 1 do
          for r8_482, r9_482 in pairs(r12_481) do
            DebugPrint("Play Current Animation ", r8_482)
            local r10_482, r11_482 = UWidgetAnimationPlayCallbackProxy.CreatePlayAnimationProxyObject(nil, r11_481, r9_482, 0, 1, 0)
            r11_482.Finished:Add(r0_481, function()
              -- line: [6111, 6113] id: 483
              coroutine.resume(r13_481)
            end)
            coroutine.yield()
          end
          -- close: r4_482
        end
      end)
      coroutine.resume(r13_481)
      -- close: r13_481
    else
      r13_481 = r12_481:Find(r3_481)
      if r13_481 == nil then
        ScreenPrint("can not find Animation")
        return 
      end
      local r14_481 = nil
      r14_481 = coroutine.create(function()
        -- line: [6126, 6135] id: 484
        for r3_484 = 1, r2_481, 1 do
          DebugPrint("Play Animation ", r3_481, " Times: ", r3_484)
          local r4_484, r5_484 = UWidgetAnimationPlayCallbackProxy.CreatePlayAnimationProxyObject(nil, r11_481, r13_481, 0, 1, 0)
          r5_484.Finished:Add(r0_481, function()
            -- line: [6130, 6132] id: 485
            coroutine.resume(r14_481)
          end)
          coroutine.yield()
        end
      end)
      coroutine.resume(r14_481)
      -- close: r13_481
    end
    -- close: r11_481
  end
end
function r0_0.obj(r0_486)
  -- line: [6142, 6144] id: 486
  URuntimeCommonFunctionLibrary.LogMaximumUObject()
end
function r0_0.SwitchSurvivalValueChange(r0_487)
  -- line: [6146, 6164] id: 487
  local r3_487 = nil	-- notice: implicit variable refs by block#[6]
  if IsStandAlone(r0_487:GetGameInstance()) then
    local r2_487 = UE4.UGameplayStatics.GetPlayerCharacter(r0_487:GetGameInstance(), 0)
    r3_487 = UE4.UGameplayStatics.GetGameState(r2_487)
    if not r2_487 then
      return 
    end
    if r2_487.AddSurvivalValueTimer then
      r2_487:RemoveTimer(r2_487.AddSurvivalValueTimer)
      r2_487.AddSurvivalValueTimer = nil
    end
    r2_487.AddSurvivalValueTimer = r2_487:AddTimer(1, function()
      -- line: [6158, 6160] id: 488
      r3_487:SetSurvivalValue(r3_487.SurvivalValue + 100)
    end, true)
    -- close: r1_487
  else
    r3_487 = "SwitchSurvivalValueChange"
    r0_487:DedicatedServerCommand(r3_487)
  end
end
function r0_0.CreateMonstersBatches(r0_489, r1_489, r2_489, r3_489)
  -- line: [6166, 6174] id: 489
  local r4_489 = {}
  for r9_489 in string.gmatch(r1_489, "([^,]+)") do
    table.insert(r4_489, r9_489)
  end
  -- close: r5_489
  for r9_489, r10_489 in pairs(r4_489) do
    r0_489:ServerBattleCommand("CreateMonster", r0_489.Player.Eid, r10_489, r2_489, r3_489, "StaticCreator")
  end
  -- close: r5_489
end
function r0_0.CutToughnessValue(r0_490, r1_490)
  -- line: [6176, 6185] id: 490
  if r1_490 then
    r1_490 = tonumber(r1_490) and 1000000
  else
    goto label_7	-- block#2 is visited secondly
  end
  r0_490:ServerBattleCommand("CutToughnessValue", r0_490.Player.Eid, r1_490)
  local r2_490 = Battle(r0_490.Player)
  if r2_490 then
    r2_490:SetGMCuttoughnessValue(r1_490)
  end
end
function r0_0.PrintCurrentTaskGuideInfo(r0_491)
  -- line: [6187, 6239] id: 491
  DebugPrint("PrintCurrentTaskGuideInfo start===")
  local r1_491 = UIManager(r0_491:GetGameInstance())
  local r2_491 = UE4.UGameplayStatics.GetPlayerCharacter(r0_491:GetGameInstance(), 0)
  local r3_491 = GWorld:GetAvatar()
  if not r3_491 then
    return 
  end
  local r4_491 = require("BluePrints.UI.TaskPanel/QuestGuidePointLocData")
  local r5_491 = nil
  DebugPrint("PlayerRegionId:", r3_491.CurrentRegionId)
  DebugPrint("PlayerLoc:", r2_491:k2_GetActorLocation())
  local r6_491 = MissionIndicatorManager:GetAllIndicatorUIObjs()
  if not IsEmptyTable(r6_491) then
    local r7_491 = 1
    for r12_491, r13_491 in pairs(r6_491) do
      DebugPrint("========================")
      local r14_491 = "折叠"
      if r13_491.Visibility ~= UE4.ESlateVisibility.Collapsed and r13_491.Guide_Node.Visibility == UE4.ESlateVisibility.SelfHitTestInvisible then
        r14_491 = "显示"
      end
      local r15_491 = 0
      if r13_491.GuideInfoCache and r13_491.GuideInfoCache.QuestNode and r13_491.GuideInfoCache.QuestNode.QuestId then
        r15_491 = r13_491.GuideInfoCache.QuestNode.QuestId
      end
      DebugPrint("Indicator[" .. r7_491 .. "]：" .. r14_491)
      DebugPrint("WidgetName:", r12_491)
      DebugPrint("STLIndicatorType:", r13_491.STLIndicatorType)
      if r13_491.GuideInfoCache then
        DebugPrint("QuestChainId:", r13_491.CurGuideChainId, " STLNode:", r15_491)
        DebugPrint("PointType", r13_491.GuideInfoCache.PointType, "TargetPointName:", r13_491.GuideInfoCache.PointName, "MapPointName:", r13_491.GuideInfoCache.PointOrStaticCreatorName)
        DebugPrint("Location:", r13_491.TargetPointPos)
        DebugPrint("TaskRegionId:", r13_491.TaskRegionId)
        if r4_491[r13_491.GuideInfoCache.PointOrStaticCreatorName] then
          local r16_491 = r4_491[r13_491.GuideInfoCache.PointOrStaticCreatorName]
          DebugPrint("GuidePointLocData: X:", r16_491.X, ",Y:", r16_491.Y, ",Z:", r16_491.Z, ",R:", r16_491.R, ",SubRegionId:", r16_491.SubRegionId)
        else
          DebugPrint("GuidePointLocData is nil")
        end
      end
      DebugPrint("========================")
      r7_491 = r7_491 + 1
    end
    -- close: r8_491
  end
  DebugPrint("PrintCurrentTaskGuideInfo end===")
end
function r0_0.SetTaskGuidePointDebugMode(r0_492, r1_492)
  -- line: [6241, 6253] id: 492
  local r2_492 = UIManager(GWorld.GameInstance)
  local r3_492 = MissionIndicatorManager:GetAllIndicatorUIObjs()
  if not IsEmptyTable(r3_492) then
    for r8_492, r9_492 in pairs(r3_492) do
      if tonumber(r1_492) == 1 then
        r9_492.IsDebugMode = true
      else
        r9_492.IsDebugMode = false
      end
    end
    -- close: r4_492
  end
end
function r0_0.PrintAllAssetPath(r0_493, r1_493, r2_493)
  -- line: [6255, 6286] id: 493
  local r3_493 = tonumber(r1_493)
  local r4_493 = tonumber(r2_493)
  local r5_493 = 0
  local r6_493 = 0
  local r7_493 = 0
  local r8_493 = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(r0_493.Player, UE4.URolePreloadGameInstanceSubsystem)
  DebugPrint("Montage:")
  for r14_493, r15_493 in pairs(r8_493:CommonPrepareAllBattleMontage(r3_493, r4_493)) do
    r5_493 = r5_493 + 1
    DebugPrint(r15_493:GetOriginPath())
  end
  -- close: r10_493
  DebugPrint("Mesh:")
  for r14_493, r15_493 in pairs(r8_493:CommonPrepareAllMesh(r3_493, r4_493)) do
    r6_493 = r6_493 + 1
    DebugPrint(r15_493:GetOriginPath())
  end
  -- close: r10_493
  DebugPrint("Weapon:")
  local r10_493 = {}
  for r15_493, r16_493 in pairs(DataMgr.WeaponTag) do
    table.insert(r10_493, r15_493)
  end
  -- close: r11_493
  for r15_493, r16_493 in pairs(r8_493:CommonPrepareAllWeaponMontage(r10_493, r3_493, r4_493)) do
    r7_493 = r7_493 + 1
    DebugPrint(r16_493:GetOriginPath())
  end
  -- close: r11_493
  DebugPrint("End!!! Find MeshNum = ", r5_493, " MontageNum = ", r6_493, " Weapon = ", r7_493)
end
function r0_0.PrintAllPreloadCacheInfo(r0_494)
  -- line: [6289, 6292] id: 494
  UCharPreloadEMComponent.PrintAllCacheDebugInfo()
  URolePreloadGameInstanceSubsystem.PrintAllDebugInfo()
end
function r0_0.PrintDynamicEventInfo(r0_495, r1_495)
  -- line: [6293, 6298] id: 495
  local r3_495 = require("BluePrints.Common.ClientEvent.ClientEventUtils").GetDynEventInfo(r1_495)
  URuntimeCommonFunctionLibrary.AddOnScreenDebugMessage(-1, 5, FColor(255, 255, 255), r3_495, false, FVector2D(1, 1))
  DebugPrint(r3_495)
end
function r0_0.UseMobileUnitBudget(r0_496, r1_496)
  -- line: [6300, 6309] id: 496
  local r2_496 = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(r0_496.Player, UUnitBudgetAllocatorSubsystem)
  if r2_496 then
    if tonumber(r1_496) == 0 then
      r2_496.bUseMobile = false
    else
      r2_496.bUseMobile = true
    end
  end
end
function r0_0.DebugTickUnitBudget(r0_497)
  -- line: [6311, 6316] id: 497
  local r1_497 = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(r0_497.Player, UUnitBudgetAllocatorSubsystem)
  if r1_497 then
    r1_497:Debug_TickUnitBudget()
  end
end
function r0_0.OpenMonsterDebug(r0_498)
  -- line: [6318, 6323] id: 498
  local r1_498 = UIManager(GWorld.GameInstance):GetUIObj("BattleMain")
  r1_498.TakeAimIndicator.bOpenMonsterDebug = not r1_498.TakeAimIndicator.bOpenMonsterDebug
  require("BluePrints.UI.GMInterface.GMFunctionLibrary").ExecConsoleCommand(r0_498:GetGameInstance(), "EnableGDT")
end
function r0_0.CrashTest(r0_499, r1_499)
  -- line: [6327, 6331] id: 499
  if not r1_499 then
    r1_499 = "IllegalAccess"
  end
  ScreenPrint("CrashTest CrashTest CrashTest", r1_499)
  URuntimeCommonFunctionLibrary.CrashTest(r1_499)
end
function r0_0.EnableSkillPrediction(r0_500)
  -- line: [6333, 6338] id: 500
  r0_0.bEnableSkillPrediction = not Battle(r0_500.Player).bEnableSkillPrediction
  Battle(r0_500.Player).bEnableSkillPrediction = r0_0.bEnableSkillPrediction
  r0_500:ServerBattleCommand("EnableSkillPrediction", r0_0.bEnableSkillPrediction)
end
function r0_0.ForceSimPredictionFailed(r0_501)
  -- line: [6340, 6347] id: 501
  r0_0.bSimPredictionFailed = not Battle(r0_501.Player).bSimPredictionFailed
  Battle(r0_501.Player).bSimPredictionFailed = r0_0.bSimPredictionFailed
  DebugPrint("gmy@GM_Command GM_Command:ForceSimPredictionFailed", r0_0.bSimPredictionFailed)
  r0_501:ServerBattleCommand("ForceSimPredictionFailed", r0_0.bSimPredictionFailed)
end
function r0_0.PrintPredictionDebugInfo(r0_502, r1_502)
  -- line: [6349, 6361] id: 502
  if r0_502.Player then
    if r1_502 then
      local r3_502 = Battle(r0_502.Player):GetEntity(tonumber(r1_502))
      if r3_502 and r3_502.PrintPredictionDebugInfo then
        r3_502:PrintPredictionDebugInfo()
      end
    else
      r0_502.Player:PrintPredictionDebugInfo()
    end
  end
end
function r0_0.SetGamepad(r0_503, r1_503)
  -- line: [6363, 6369] id: 503
  local r3_503 = UE4.UGameplayStatics.GetPlayerCharacter(r0_503:GetGameInstance(), 0)
  if r3_503 then
    r3_503:SwitchGamepadSet(tonumber(r1_503))
  end
end
function r0_0.PrintBattleHistory(r0_504, r1_504, ...)
  -- line: [6371, 6391] id: 504
  if r1_504 then
    r1_504 = tonumber(r1_504) and 0
  else
    goto label_8	-- block#2 is visited secondly
  end
  local r2_504 = {
    ...
  }
  local r3_504 = UE4.FBattleHistoryFilter()
  if r1_504 and r1_504 == 1 then
    r3_504.Verbosity = UE4.EBattleRecordVerbosity.Verbose
  else
    r3_504.Verbosity = UE4.EBattleRecordVerbosity.Normal
  end
  for r8_504, r9_504 in ipairs(r2_504) do
    r3_504.TargetTags:Add(r9_504)
  end
  -- close: r4_504
  Battle(r0_504.Player):BP_PrintBattleHistory(r3_504)
end
function r0_0.ShowGetItemsTip(r0_505, r1_505, r2_505)
  -- line: [6393, 6415] id: 505
  local r3_505 = {
    InfoDataList = {},
  }
  if r1_505 == "Blessing" then
    table.insert(r3_505.InfoDataList, DataMgr.RougeLikeBlessing[505])
  else
    table.insert(r3_505.InfoDataList, DataMgr.RougeLikeTreasure[14201])
    table.insert(r3_505.InfoDataList, DataMgr.RougeLikeTreasure[10102])
    table.insert(r3_505.InfoDataList, DataMgr.RougeLikeTreasure[10103])
  end
  if r2_505 then
    r3_505.Islose = true
  else
    r3_505.Islose = false
  end
  r3_505.ItemId = 101
  r3_505.OldLevel = 1
  r3_505.NewLevel = 2
  UIManager(r0_505):LoadUINew(UIConst.GetItemsTip, r3_505)
end
function r0_0.TestTriggerAbyssOnEnd(r0_506)
  -- line: [6417, 6526] id: 506
  r0_506.AbyssLogicServerInfo = {}
  r0_506.AbyssLogicServerInfo.AbyssLevelId = 3
  r0_506.AbyssLogicServerInfo.AbyssId = 1012
  local r1_506 = GWorld:GetAvatar()
  if not r1_506 then
    return 
  end
  local r2_506 = r1_506.Abysses[r0_506.AbyssLogicServerInfo.AbyssId]
  if not r2_506 then
    return 
  end
  local r3_506 = r2_506.AbyssLevelList[r0_506.AbyssLogicServerInfo.AbyssLevelId]
  if not r3_506 then
    return 
  end
  if r3_506:IsAbyssLevelPass() then
    return 
  end
  local r5_506 = DataMgr.AbyssLevel
  local r6_506 = r0_506.AbyssLogicServerInfo.AbyssLevelId
  local r7_506 = r6_506 + 1
  local r9_506 = {}
  local r10_506 = {}
  if r5_506[r6_506].AbyssDungeon1 then
    local r11_506 = {}
    local r12_506 = {}
    if r5_506[r7_506] then
      r12_506 = DataMgr.AbyssDungeon[r5_506[r7_506].AbyssDungeon1].AbyssBuffID
    end
    if r5_506[r6_506] then
      r11_506 = DataMgr.AbyssDungeon[r5_506[r6_506].AbyssDungeon1].AbyssBuffID
    end
    for r17_506, r18_506 in pairs(r12_506) do
      local r19_506 = false
      for r24_506, r25_506 in pairs(r11_506) do
        if r18_506 == r25_506 then
          r19_506 = true
          goto label_84
        end
      end
      -- close: r20_506
      ::label_84::
      -- close: r20_506
      if not r19_506 then
        table.insert(r9_506, r18_506)
      end
    end
    -- close: r13_506
  end
  if r5_506[r6_506].AbyssDungeon2 then
    local r12_506 = {}
    local r13_506 = {}
    if r5_506[r7_506] then
      r13_506 = DataMgr.AbyssDungeon[r5_506[r7_506].AbyssDungeon2].AbyssBuffID
    end
    if r5_506[r6_506] then
      r12_506 = DataMgr.AbyssDungeon[r5_506[r6_506].AbyssDungeon2].AbyssBuffID
    end
    for r18_506, r19_506 in pairs(r13_506) do
      local r20_506 = false
      for r25_506, r26_506 in pairs(r12_506) do
        if r19_506 == r26_506 then
          r20_506 = true
          goto label_137
        end
      end
      -- close: r21_506
      ::label_137::
      -- close: r21_506
      if not r20_506 then
        table.insert(r10_506, r19_506)
      end
    end
    -- close: r14_506
  end
  local r12_506 = ReddotManager.GetLeafNodeCacheDetail("AbyssEntry1")
  local r13_506 = false
  for r18_506, r19_506 in ipairs(r9_506) do
    local r20_506 = tostring(r19_506)
    if not r12_506[r0_506.AbyssLogicServerInfo.AbyssId] then
      r12_506[r0_506.AbyssLogicServerInfo.AbyssId] = {}
    end
    if not r12_506[r0_506.AbyssLogicServerInfo.AbyssId][r20_506] then
      r12_506[r0_506.AbyssLogicServerInfo.AbyssId][r20_506] = true
      r13_506 = true
    end
  end
  -- close: r14_506
  if r13_506 then
    ReddotManager.IncreaseLeafNodeCount("AbyssEntry1")
  end
  r13_506 = false
  r12_506 = ReddotManager.GetLeafNodeCacheDetail("AbyssEntry2")
  for r18_506, r19_506 in ipairs(r10_506) do
    local r20_506 = tostring(r19_506)
    if not r12_506[r0_506.AbyssLogicServerInfo.AbyssId] then
      r12_506[r0_506.AbyssLogicServerInfo.AbyssId] = {}
    end
    if not r12_506[r0_506.AbyssLogicServerInfo.AbyssId][r20_506] then
      r12_506[r0_506.AbyssLogicServerInfo.AbyssId][r20_506] = true
      r13_506 = true
    end
  end
  -- close: r14_506
  if r13_506 then
    ReddotManager.IncreaseLeafNodeCount("AbyssEntry2")
  end
end
function r0_0.ShowUpgradeTip(r0_507, r1_507, r2_507)
  -- line: [6528, 6534] id: 507
  UIManager(r0_507):LoadUINew(UIConst.UpgradeTip, {
    ItemId = 105,
    OldLevel = 1,
    NewLevel = 2,
  })
end
function r0_0.ForceStartDynQuest(r0_508, r1_508)
  -- line: [6536, 6604] id: 508
  if r1_508 then
    local r2_508 = DataMgr.DynQuest[tonumber(r1_508)]
    local r3_508 = r2_508.RegionId
    local r4_508 = r2_508.TriggerBoxID
    local r5_508 = UE4.UGameplayStatics.GetGameMode(r0_508.Player)
    local r6_508 = nil
    if DataMgr.Region and DataMgr.Region[r3_508] then
      local r7_508 = DataMgr.Region[r3_508].IsRandom
      if r7_508 then
        r6_508 = r7_508[1]
      end
    end
    if r5_508 and r6_508 then
      if DataMgr.DispatchUI[tonumber(r1_508)] then
        local r7_508 = DataMgr.DispatchUI[tonumber(r1_508)].TeleportPointPos
        if r7_508 then
          r6_508 = DataMgr.DynQuest[tonumber(r1_508)].SubRegionId
          r5_508:HandleLevelDeliver(UE4.EModeType.ModeRegion, r6_508, r7_508, nil, nil, true)
          return 
        end
      end
      local r7_508 = UE4.UGameplayStatics.GetPlayerCharacter(r5_508, 0)
      local r8_508 = GWorld:GetAvatar()
      if not r8_508 then
        return 
      end
      local function r9_508(...)
        -- line: [6564, 6590] id: 509
        require("BluePrints.Common.ClientEvent.ClientEventUtils"):StartDynamicEvent(tonumber(r1_508))
        local r1_509 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
        if not r1_509 then
          return 
        end
        local r2_509 = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
        local r3_509 = r1_509.StaticCreatorMap:FindRef(r4_508)
        if r3_509 then
          local r4_509 = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
          local r5_509 = r2_509:GetWCSubSystem()
          if not r5_509 then
            return 
          end
          local r6_509 = r3_509:GetTransform()
          r6_509.Translation = UE4.UNavigationFunctionLibrary.ProjectPointToNavigation3D(r6_509.Translation, r5_509)
          r5_509:RequestAsyncTravel(r4_509, r6_509, {
            r4_509,
            function()
              -- line: [6584, 6587] id: 510
            end
          })
        end
      end
      if r8_508:GetCurrentRegionId() ~= r6_508 then
        r8_508:StartJumpRegion(r6_508, r9_508)
        r0_508:SkipRegion(1, r6_508, 1)
      else
        r9_508()
      end
    end
    -- close: r2_508
  end
end
function r0_0.CompleteAllDispatchCondion(r0_511)
  -- line: [6606, 6610] id: 511
  for r5_511, r6_511 in pairs(DataMgr.Dispatch) do
    r0_511:CompleteSingleCondition(r6_511.DispatchCondition)
  end
  -- close: r1_511
end
function r0_0.TractedMonsterToPlayer(r0_512, r1_512, r2_512)
  -- line: [6612, 6621] id: 512
  local r3_512 = tonumber(r1_512) and 2000
  local r4_512 = tonumber(r2_512) and 500000
  local r5_512 = UE.UGameplayStatics.GetGameMode(r0_512.Player)
  local r6_512 = TArray(0)
  for r11_512, r12_512 in pairs(r5_512.EMGameState.MonsterMap) do
    r6_512:Add(r12_512.Eid)
  end
  -- close: r7_512
  URuntimeCommonFunctionLibrary.TractionActorsToCenter(ESourceTags.Skill, r0_512.Player:K2_GetActorLocation(), r3_512, r4_512, r6_512, r0_512.Player)
end
function r0_0.TestTractedPlayer(r0_513, r1_513, r2_513)
  -- line: [6623, 6630] id: 513
  local r3_513 = tonumber(r1_513) and 200
  local r4_513 = tonumber(r2_513) and 500000
  local r5_513 = TArray(0)
  r5_513:Add(r0_513.Player.Eid)
  URuntimeCommonFunctionLibrary.TractionActorsToCenter(ESourceTags.Skill, r0_513.Player:K2_GetActorLocation(), r3_513, r4_513, r5_513, r0_513.Player)
end
function r0_0.SkipAngling(r0_514, r1_514)
  -- line: [6632, 6638] id: 514
  if not _G.bSkipAngling and r1_514 then
    _G.bSkipAngling = true
  elseif _G.bSkipAngling and not r1_514 then
    _G.bSkipAngling = false
  end
end
function r0_0.ShowRegionmapPane(r0_515, r1_515)
  -- line: [6640, 6642] id: 515
  _G.ShowRegionmapPane = r1_515 == "1"
end
function r0_0.SSRPlaySequence(r0_516, r1_516, r2_516)
  -- line: [6644, 6649] id: 516
  local r3_516 = UE.UGameplayStatics.GetGameMode(r0_516.Player)
  if r3_516.LevelSequenceStateRecorder then
    r3_516.LevelSequenceStateRecorder:PlaySequence(tonumber(r1_516), tonumber(r2_516))
  end
end
function r0_0.SSRPlaySequence(r0_517, r1_517, r2_517)
  -- line: [6651, 6656] id: 517
  local r3_517 = UE.UGameplayStatics.GetGameMode(r0_517.Player)
  if r3_517.LevelSequenceStateRecorder then
    r3_517.LevelSequenceStateRecorder:PlaySequence(tonumber(r1_517), tonumber(r2_517))
  end
end
function r0_0.StartFlow(r0_518, r1_518, r2_518)
  -- line: [6658, 6669] id: 518
  if not r1_518 then
    r1_518 = r0_518.Player
  end
  if not r2_518 then
    r2_518 = LoadObject("/Game/Dialogue/SpecialSideStory/2002/200234/510122.510122")
  end
  if UE.UEMFlowFunctionLibrary then
    local r3_518 = UE.UEMFlowFunctionLibrary.GetFlowSubsystem(r0_518.Player)
    if r3_518 then
      r3_518:StartRootFlow(r1_518, r2_518)
    end
  end
end
function r0_0.StopFlow(r0_519, r1_519, r2_519)
  -- line: [6671, 6682] id: 519
  if not r1_519 then
    r1_519 = r0_519.Player
  end
  if not r2_519 then
    r2_519 = LoadObject("/Game/TestFlowAsset.TestFlowAsset")
  end
  if UE.UEMFlowFunctionLibrary then
    local r3_519 = UE.UEMFlowFunctionLibrary.GetFlowSubsystem(r0_519.Player)
    if r3_519 then
      r3_519:StopRootFlow(r1_519, r2_519)
    end
  end
end
function r0_0.NewDeputeTest(r0_520)
  -- line: [6685, 6687] id: 520
  Const.IsOpenNewDepute = true
end
function r0_0.PrintCharModVolume(r0_521)
  -- line: [6689, 6697] id: 521
  local r1_521 = GWorld:GetAvatar()
  if not r1_521 then
    return 
  end
  for r6_521, r7_521 in pairs(r1_521.Chars) do
    DebugPrint("ZJT_ 11111111 PrintCharModVolume ", r7_521.CharId, r7_521:GetModVolume(), r7_521.ModVolume, r7_521.ExtralModVolume and 0)
  end
  -- close: r2_521
end
function r0_0.DetectiveMinigame(r0_522, r1_522, r2_522)
  -- line: [6700, 6719] id: 522
  if r1_522 == "UnlockQuestion" then
    local r3_522 = GWorld:GetAvatar()
    if r3_522 then
      r3_522:DetectiveQuestionUnlockQuestion(tonumber(r2_522))
    end
  elseif r1_522 == "UnlockAnswer" then
    local r3_522 = GWorld:GetAvatar()
    if r3_522 then
      r3_522:DetectiveQuestionUnlockAnswer(tonumber(r2_522))
    end
  elseif r1_522 == "OpenUI" then
    r0_522:GetGameInstance():GetGameUIManager():LoadUINew("DetectiveMinigame")
  elseif r1_522 == "OpenDetailUI" then
    UIManager(r0_522):LoadUINew("DetectiveReasoningAni", function()
      -- line: [6715, 6717] id: 523
      UIManager(r0_522):LoadUINew("DetectiveReasoningDetail", r2_522)
    end)
  end
end
function r0_0.CommonActivitySettlement(r0_524)
  -- line: [6722, 6768] id: 524
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
      -- line: [6756, 6759] id: 525
      GWorld.GameInstance:GetGameUIManager():ShowUITip("CommonToastMain", GText("Minigame_Textmap_100305"))
    end,
  })
end
function r0_0.EnterTiaoPinGame(r0_526)
  -- line: [6770, 6772] id: 526
  UIManager(GWorld.GameInstance):LoadUINew("TiaoPin")
end
function r0_0.PinAttr(r0_527, r1_527, r2_527)
  -- line: [6774, 6781] id: 527
  UIManager(r0_527.Player):LoadUI(UIConst.ATTRDEBUGPANEL, "AttrDebugPanel", UIConst.ZORDER_ABOVE_ALL):AddAttrWatcher(r1_527, r2_527)
end
function r0_0.OpenWalnutRewardDialog(r0_528, r1_528)
  -- line: [6783, 6787] id: 528
  if not UIManager(r0_528):GetUIObj("WalnutRewardDialog") then
    r0_528.DetailWidget = UIManager(r0_528):LoadUINew("WalnutRewardDialog", tonumber(r1_528))
  end
end
function r0_0.VerifyArrayTest(r0_529)
  -- line: [6789, 6792] id: 529
  GWorld.GameInstance:GmChangeVerifyArray()
end
function r0_0.FloatVerifyArrayTest(r0_530)
  -- line: [6794, 6797] id: 530
  GWorld.GameInstance:GmChangeFloatVerifyArray()
end
function r0_0.CreateSquad(r0_531, r1_531)
  -- line: [6799, 6806] id: 531
  local r2_531 = GWorld:GetAvatar()
  if not r2_531 then
    return 
  end
  r2_531:CallServerMethod("GMCreateSquad", r1_531)
end
function r0_0.QuitGame(r0_532, r1_532)
  -- line: [6808, 6814] id: 532
  if r1_532 then
    GWorld.GameInstance.ForceQuitGame()
  else
    UKismetSystemLibrary.QuitGame(r0_532.Player, nil, EQuitPreference.Quit, false)
  end
end
function r0_0.SyncTest(r0_533)
  -- line: [6816, 6873] id: 533
  for r6_533, r7_533 in pairs({
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
    local r11_533 = {}
    UE4.UResourceLibrary.LoadObjectAsync(r0_533.Player, r7_533, r11_533)
  end
  -- close: r2_533
  LoadObject("NiagaraSystem\'/Game/Asset/Effect/Niagara/Monster/A_Common/NS_Common_Part_Smash.NS_Common_Part_Smash\'")
end
function r0_0.ShowLookAtDebug(r0_534, r1_534, r2_534)
  -- line: [6875, 6895] id: 534
  local r3_534 = tonumber(r2_534)
  local r4_534 = tonumber(r1_534)
  local r5_534 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if r3_534 > 0 and r5_534 then
    local r6_534 = r5_534.NpcCharacterMap:FindRef(r4_534)
    if r6_534 and r6_534.NpcAnimInstance then
      r6_534.NpcAnimInstance.IsLookAtDebug = true
    end
  elseif r5_534 then
    local r6_534 = r5_534.NpcCharacterMap:FindRef(r4_534)
    if r6_534 and r6_534.NpcAnimInstance then
      r6_534.NpcAnimInstance.IsLookAtDebug = false
    end
  end
end
function r0_0.StartLookAt(r0_535, r1_535, r2_535, r3_535)
  -- line: [6897, 6923] id: 535
  local r4_535 = tonumber(r3_535)
  local r5_535 = tonumber(r1_535)
  local r6_535 = tonumber(r2_535)
  local r7_535 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if r4_535 > 0 and r7_535 then
    local r8_535 = r7_535.NpcCharacterMap:FindRef(r5_535)
    local r9_535 = r7_535.NpcCharacterMap:FindRef(r2_535)
    if r6_535 == 1 then
      r9_535 = UE4.UGameplayStatics.GetPlayerCharacter(UE4.UGameplayStatics.GetGameMode(r0_535.Player), 0)
    end
    if r8_535 and r8_535.NpcAnimInstance and r9_535 then
      r8_535.NpcAnimInstance:SetLookAtActor(r9_535, "head")
    end
  elseif r7_535 then
    local r8_535 = r7_535.NpcCharacterMap:FindRef(r5_535)
    if r8_535 and r8_535.NpcAnimInstance then
      r8_535.NpcAnimInstance:ResetNormalLookAt()
    end
  end
end
function r0_0.NPCMoveTo(r0_536, r1_536, r2_536, r3_536)
  -- line: [6925, 6939] id: 536
  local r4_536 = tonumber(r1_536)
  local r5_536 = tonumber(r2_536)
  local r6_536 = tonumber(r3_536)
  local r7_536 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if r7_536 then
    local r8_536 = r7_536.NpcCharacterMap:FindRef(r4_536)
    r8_536:SetMaxWalkSpeedBase(r5_536)
    r8_536:SetNpcMovementTickEnable(true)
    UAIBlueprintHelperLibrary.CreateMoveToProxyObject(r8_536, r8_536, r8_536:K2_GetActorLocation() + r8_536:GetActorForwardVector() * r6_536)
  end
end
function r0_0.LookAtBySlerp(r0_537, r1_537, r2_537, r3_537, r4_537)
  -- line: [6941, 6973] id: 537
  local r5_537 = tonumber(r3_537)
  local r6_537 = tonumber(r1_537)
  local r7_537 = tonumber(r2_537)
  local r8_537 = tonumber(r4_537)
  local r9_537 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if r5_537 > 0 and r9_537 then
    local r10_537 = r9_537.NpcCharacterMap:FindRef(r6_537)
    local r11_537 = r9_537.NpcCharacterMap:FindRef(r2_537)
    if r7_537 == 1 then
      r11_537 = UE4.UGameplayStatics.GetPlayerCharacter(UE4.UGameplayStatics.GetGameMode(r0_537.Player), 0)
    end
    if r10_537 and r10_537.NpcAnimInstance and r11_537 then
      r10_537.NpcAnimInstance.PitchSlerpAlpha.TotalTime = 10
      r10_537.NpcAnimInstance.YawSlerpAlpha.TotalTime = 1
      r10_537.NpcAnimInstance:SetLookAtActor(r11_537, "head", true)
      r10_537.NpcAnimInstance.IsLookAtDebug = true
      r10_537.NpcAnimInstance:StartSlerpLookAt()
    end
  elseif r9_537 then
    local r10_537 = r9_537.NpcCharacterMap:FindRef(r6_537)
    if r10_537 and r10_537.NpcAnimInstance then
      r10_537.NpcAnimInstance:ResetNormalLookAt()
      r10_537.NpcAnimInstance.IsLookAtDebug = false
    end
  end
end
function r0_0.ControlAllMonsterBTTickEnable(r0_538, r1_538)
  -- line: [6975, 6981] id: 538
  local r2_538 = UE4.UGameplayStatics.GetGameState(r0_538.Player)
  if r1_538 == false then
    r1_538 = false
  end
  for r7_538, r8_538 in pairs(r2_538.MonsterMap) do
    r8_538:SetTickEnabled(ETickCtrlType.UnitBudget, ETickObjectFlag.FLAG_BTCOMPONENT, r1_538)
  end
  -- close: r3_538
end
function r0_0.LJHTEST(r0_539)
  -- line: [6983, 6986] id: 539
  UIUtils.OpenRaidReward()
end
function r0_0.TestGraphTask(r0_540)
  -- line: [6988, 6990] id: 540
  UE4.UBattleFunctionLibrary.TestTaskGraphTask(r0_540.Player)
end
function r0_0.LHQTEST(r0_541, r1_541, r2_541)
  -- line: [6992, 7013] id: 541
  local r3_541 = tonumber(r1_541)
  local r4_541 = tonumber(r2_541)
  local r5_541 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if r5_541 then
    local r6_541 = r5_541.NpcCharacterMap:FindRef(r3_541)
    local r7_541 = "AnimMontage\'/Game/Asset/Char/Player/Char009_Xibi/Animation/Montage/Interactive/MechInteractive/Xibi_Interactive_Sit_F_Montage.Xibi_Interactive_Sit_F_Montage\'"
    local r8_541 = LoadObject(r7_541)
    local r9_541 = "AnimMontage\'/Game/Asset/Char/Player/Char010_Saiqi/Animation/Montage/Interactive/MechInteractive/Saiqi_Interactive_Sit_F_Montage.Saiqi_Interactive_Sit_F_Montage\'"
    local r10_541 = LoadObject(r7_541)
    if r6_541 and r6_541.NpcAnimInstance and r4_541 == 1 then
      r6_541:RotateOffset(60)
    else
      r6_541:RotateOffset(-120)
    end
  end
end
function r0_0.NPCRotate90(r0_542, r1_542, r2_542)
  -- line: [7015, 7024] id: 542
  local r3_542 = tonumber(r2_542)
  local r4_542 = tonumber(r1_542)
  local r5_542 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if r5_542 then
    local r6_542 = r5_542.NpcCharacterMap:FindRef(r4_542)
    r6_542.NpcAnimInstance:SetTurnInPlace90(r6_542.ModelId)
    r6_542:RotateOffset(r3_542)
  end
end
function r0_0.NPCRotate(r0_543, r1_543, r2_543)
  -- line: [7026, 7035] id: 543
  local r3_543 = tonumber(r2_543)
  local r4_543 = tonumber(r1_543)
  local r5_543 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if r5_543 then
    local r6_543 = r5_543.NpcCharacterMap:FindRef(r4_543)
    r6_543.NpcAnimInstance:SetTurnInPlace45()
    r6_543:RotateOffset(r3_543)
  end
end
function r0_0.NPCTalkAgree(r0_544, r1_544, r2_544)
  -- line: [7037, 7050] id: 544
  local r3_544 = tonumber(r1_544)
  local r4_544 = tonumber(r2_544)
  local r5_544 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if r5_544 then
    local r6_544 = r5_544.NpcCharacterMap:FindRef(r3_544)
    local r8_544 = LoadObject("AnimMontage\'/Game/Asset/Char/Player/Char028_Kajia/Animation/Montage/Locomotion/Kajia_Agree_Montage_Only_For_Test.Kajia_Agree_Montage_Only_For_Test\'")
    r6_544.NpcAnimInstance:Montage_Play(r8_544)
    if r4_544 == 0 then
      r6_544.NpcAnimInstance:Montage_JumpToSection("Disagree", r8_544)
    end
  end
end
function r0_0.NPCTalk03(r0_545, r1_545)
  -- line: [7052, 7061] id: 545
  local r2_545 = tonumber(r1_545)
  local r3_545 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if r3_545 then
    r3_545.NpcCharacterMap:FindRef(r2_545).NpcAnimInstance:Montage_Play(LoadObject("AnimMontage\'/Game/Asset/Char/Player/Char028_Kajia/Animation/Montage/Interactive/Kajia_Emo_Talk03_Montage.Kajia_Emo_Talk03_Montage\'"))
  end
end
function r0_0.NPCAgree(r0_546, r1_546, r2_546)
  -- line: [7063, 7077] id: 546
  local r3_546 = tonumber(r1_546)
  local r4_546 = tonumber(r2_546)
  local r5_546 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if r5_546 then
    local r6_546 = r5_546.NpcCharacterMap:FindRef(r3_546)
    local r8_546 = LoadObject("AnimMontage\'/Game/Asset/Char/Player/Char028_Kajia/Animation/Montage/Locomotion/Kajia_Agree_Montage_Only_For_Test.Kajia_Agree_Montage_Only_For_Test\'")
    r6_546.NpcAnimInstance.bEnableAgreeTest = true
    r6_546.NpcAnimInstance:Montage_Play(r8_546)
    if r4_546 == 0 then
      r6_546.NpcAnimInstance:Montage_JumpToSection("Disagree", r8_546)
    end
  end
end
function r0_0.GM_SkipMonthCardPay(r0_547)
  -- line: [7080, 7089] id: 547
  DebugPrint("GM_SkipMonthCardPay")
  require("BluePrints.UI.WBP.Perk.MonthCard.MonthCardController").TryPurchaseMonthCard = function()
    -- line: [7083, 7088] id: 548
    local r0_548 = GWorld:GetAvatar()
    if r0_548 then
      r0_548:BuyMonthlyCard()
    end
  end
end
function r0_0.DungeonDoubleCost(r0_549, r1_549)
  -- line: [7091, 7097] id: 549
  local r2_549 = nil	-- notice: implicit variable refs by block#[4]
  if r1_549 then
    r2_549 = true
    if not r2_549 then
      ::label_5::
      r2_549 = false
    end
  else
    goto label_5	-- block#2 is visited secondly
  end
  local r3_549 = GWorld:GetAvatar()
  if r3_549 then
    r3_549:SetDungeonDoubleCost(r2_549)
  end
end
function r0_0.GetWorldRegionEidByCreatorId(r0_550, r1_550)
  -- line: [7099, 7115] id: 550
  local r3_550 = UE4.UGameplayStatics.GetGameMode(r0_550.Player):GetRegionDataMgrSubSystem().DataPool.RegionData
  if not r3_550 then
    return 
  end
  local r4_550 = nil
  for r9_550, r10_550 in pairs(r3_550) do
    if r10_550.CreatorId == tonumber(r1_550) then
      r4_550 = r10_550.WorldRegionEid
      break
    end
  end
  -- close: r5_550
  if not r4_550 then
    ScreenPrint("can not find Eid")
    return 
  end
  DebugPrint(r1_550 .. "的Eid为 " .. r4_550)
end
function r0_0.GetWorldRegionEidByManualItemId(r0_551, r1_551)
  -- line: [7117, 7133] id: 551
  local r3_551 = UE4.UGameplayStatics.GetGameMode(r0_551.Player):GetRegionDataMgrSubSystem().DataPool.RegionData
  if not r3_551 then
    return 
  end
  local r4_551 = nil
  for r9_551, r10_551 in pairs(r3_551) do
    if r10_551.ManualItemId == tonumber(r1_551) then
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
function r0_0.GetWorldRegionEidByRandomRuleId(r0_552, r1_552)
  -- line: [7135, 7153] id: 552
  local r3_552 = UE4.UGameplayStatics.GetGameMode(r0_552.Player):GetRegionDataMgrSubSystem().DataPool.RegionData
  if not r3_552 then
    return 
  end
  local r4_552 = {}
  for r9_552, r10_552 in pairs(r3_552) do
    if r10_552.RandomRuleId == tonumber(r1_552) then
      table.insert(r4_552, r10_552.WorldRegionEid)
    end
  end
  -- close: r5_552
  if not r4_552 then
    ScreenPrint("can not find Eid")
    return 
  end
  for r9_552, r10_552 in pairs(r4_552) do
    DebugPrint(r1_552 .. "的Eid为 " .. r10_552)
  end
  -- close: r5_552
end
function r0_0.EnablePropEffect(r0_553, r1_553, r2_553)
  -- line: [7156, 7173] id: 553
  local r3_553 = tonumber(r1_553)
  local r4_553 = tonumber(r2_553)
  if not r4_553 or not r3_553 then
    return 
  end
  if not DataMgr.PropEffect[r3_553] then
    return 
  end
  local r5_553 = DataMgr.PropEffect[r3_553].BPPath
  if r4_553 == 1 then
    r0_553.Player.PropEffectComponent:LoadPropEffect(r5_553)
  else
    r0_553.Player.PropEffectComponent:UnloadPropEffect()
  end
end
function r0_0.ShowSequenceTime(r0_554, r1_554)
  -- line: [7175, 7181] id: 554
  if r1_554 == "true" then
    ULevelSequenceCommonFunctionLibrary.CreateRunTimeSequenceTimeWidget(r0_554.Player, r0_554.Player)
  else
    ULevelSequenceCommonFunctionLibrary.DestroyRunTimeSequenceTimeWidget(r0_554.Player, r0_554.Player)
  end
end
function r0_0.UWAUpLoad(r0_555)
  -- line: [7183, 7188] id: 555
  UE4.UUWABlueprintFunctionLibrary.UpLLoad("17357126837", "yingxiongwudi123", 11211)
end
function r0_0.GenerateStripMesh(r0_556, r1_556, r2_556, r3_556, r4_556)
  -- line: [7190, 7224] id: 556
  local r7_556 = UE4.UGameplayStatics.GetPlayerCharacter(r0_556:GetGameInstance(), 0):K2_GetActorLocation()
  local r8_556 = UE4.UClass.Load("/Game/BluePrints/Test/TestProceduralMesh.TestProceduralMesh")
  if not r8_556 then
    DebugPrint("Failed to load ProceduralMesh actor class.")
    return 
  end
  for r12_556 = 1, r1_556, 1 do
    local r16_556 = GWorld.GameInstance:GetWorld():SpawnActor(r8_556, UE4.FTransform(FRotator(0, 0, 0), FVector(r7_556.X + (r12_556 + -1) * 300, r7_556.Y, r7_556.Z)), UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn, nil, r0_556, nil)
    if r16_556 and r16_556.GenerateStripMesh then
      r16_556:GenerateStripMesh(r2_556, r3_556, r4_556)
    else
      DebugPrint("Failed to spawn actor or GenerateStripMesh is nil.")
    end
  end
end
function r0_0.PrintLevelbound(r0_557, r1_557)
  -- line: [7226, 7267] id: 557
  if r1_557 == nil then
    r1_557 = "Prologue_Clouds_Art"
  end
  local r2_557 = r0_557.Player
  local r3_557 = UE4.UGameplayStatics.GetAllActorsOfClass(r2_557, ALevelBounds.StaticClass())
  local r4_557 = UE4.UGameplayStatics.GetStreamingLevel(r2_557, "Prologue_Clouds_Art")
  for r9_557, r10_557 in pairs(r3_557) do
    if UE4.URuntimeCommonFunctionLibrary.GetLevel(r10_557) == r4_557:GetLoadedLevel() then
      local r13_557 = r10_557:GetTransform()
      local r14_557 = r13_557.Translation
      local r15_557 = r13_557.Rotation
      local r16_557 = r13_557.Scale3D
      DebugPrint(r1_557 .. " Levelbound Location:", r14_557.X, r14_557.Y, r14_557.Z)
      DebugPrint(r1_557 .. " Levelbound Rotation:", r15_557.X, r15_557.Y, r15_557.Z)
      DebugPrint(r1_557 .. " Levelbound Scale:", r16_557.X, r16_557.Y, r16_557.Z)
    end
  end
  -- close: r5_557
end
if UE and UE.URuntimeCommonFunctionLibrary.IsDistribution() then
  for r8_0, r9_0 in pairs(r0_0) do
    local r10_0 = type(r9_0)
    local r11_0 = "function"
    if r10_0 == r11_0 then
      function r10_0()
        -- line: [7273, 7273] id: 558
      end
      r0_0[r8_0] = r10_0
    end
  end
  -- close: r4_0
end
function r0_0.PrintCustomNPCCacheInfo(r0_559)
  -- line: [7278, 7283] id: 559
  local r1_559 = UE4.USubsystemBlueprintLibrary.GetWorldSubsystem(r0_559.Player, UE4.UNPCCreateSubSystem)
  if r1_559 then
    r1_559:CustomNPCCacheDebug()
  end
end
function r0_0.MechanismStateDebug(r0_560, r1_560)
  -- line: [7285, 7295] id: 560
  local r2_560 = UE4.UGameplayStatics.GetGameState(r0_560.Player)
  if r2_560 then
    r1_560 = tonumber(r1_560)
    if r1_560 > 0 then
      r2_560.MechanismStateChangeDebug = true
    else
      r2_560.MechanismStateChangeDebug = false
    end
  end
end
function r0_0.ShowBattleError(r0_561, r1_561)
  -- line: [7297, 7333] id: 561
  local r2_561 = GWorld.Battle
  if not r2_561 then
    ScreenPrint("Error:找不到GWorld.Battle")
    return 
  end
  r1_561 = tonumber(r1_561) and 1
  if r1_561 < 1 or r1_561 > 3 then
    ScreenPrint("参数错误，num应为1-3之间的整数")
    return 
  end
  if r1_561 == 1 then
    r2_561:ShowBattleError("GM测试自定义信息", false)
  elseif r1_561 == 2 then
    r2_561:StandardShowBattleErrorLua(UE.EShowBattleErrorType.Weapon, "GM测试小类")
  elseif r1_561 == 3 then
    if not r0_561.Player then
      return 
    end
    r0_561.Player:ResetSkillCD(100000)
  end
end
function r0_0.ShowUIError(r0_562, r1_562, r2_562)
  -- line: [7335, 7341] id: 562
  local r3_562 = GWorld.GameInstance:GetGameUIManager()
  if not r3_562 then
    ScreenPrint("Error:找不到UIManager")
  end
  r3_562:ShowUIError(r1_562, r2_562)
end
function r0_0.ShowPersonalInfoPage(r0_563, r1_563)
  -- line: [7345, 7352] id: 563
  if r1_563 then
    GWorld:GetAvatar():CheckOtherPlayerPersonallInfo(GWorld:GetAvatar().Uid, true)
  else
    require("BluePrints.UI.WBP.PersonInfo.PersonInfoController"):OpenView()
  end
end
function r0_0.UseResourceBattle(r0_564, r1_564)
  -- line: [7354, 7364] id: 564
  r1_564 = tonumber(r1_564)
  if r0_564.ResourceUseHelper == nil then
    r0_564.ResourceUseHelper = require("Utils.ResourceUseHelper")
  end
  if r0_564.ResourceUseHelper then
    r0_564.ResourceUseHelper:ForceUseItemInBattle(r1_564)
  end
end
function r0_0.EnableRegionPlayerOnlyShowHeadUI(r0_565, r1_565, r2_565)
  -- line: [7366, 7375] id: 565
end
function r0_0.NPCSubSystemOnline(r0_566, r1_566)
  -- line: [7377, 7384] id: 566
  local r2_566 = UE4.USubsystemBlueprintLibrary.GetWorldSubsystem(r0_566.Player, UE4.UNPCCreateSubSystem)
  if r1_566 then
    r2_566:SetIsOnlineState(true)
  else
    r2_566:SetIsOnlineState(false)
  end
end
function r0_0.NPCSubSystemChangeOnlineRegionId(r0_567, r1_567)
  -- line: [7386, 7389] id: 567
  UE4.USubsystemBlueprintLibrary.GetWorldSubsystem(r0_567.Player, UE4.UNPCCreateSubSystem):TestChangeRegionOnlineId(tonumber(r1_567))
end
function r0_0.ReadyForRegonOnline(r0_568)
  -- line: [7391, 7421] id: 568
  r0_568:CompleteSystemCondition()
  r0_568:CompleteCondition({
    100103,
    100208
  })
  local r1_568 = r0_568:GetGameInstance()
  local r2_568 = require("BluePrints.UI.GMInterface.GMFunctionLibrary")
  r2_568.ExecConsoleCommand(r1_568, "sgm saq")
  r2_568.ExecConsoleCommand(r1_568, "sgm aac")
  r2_568.ExecConsoleCommand(r1_568, "sgm macml")
  r2_568.ExecConsoleCommand(r1_568, "sgm aas")
  r2_568.ExecConsoleCommand(r1_568, "sgm aad")
  r2_568.ExecConsoleCommand(r1_568, "sgm aaw")
  r2_568.ExecConsoleCommand(r1_568, "sgm mawml")
  r2_568.ExecConsoleCommand(r1_568, "sgm aar")
  r2_568.ExecConsoleCommand(r1_568, "sgm aaws")
  r2_568.ExecConsoleCommand(r1_568, "sgm aawa")
  local r3_568 = GWorld:GetAvatar()
  r3_568:GmGetAllTitle()
  r3_568:GmGetAllTitleFrame()
  r2_568.ExecConsoleCommand(r1_568, "sgm aah")
  r2_568.ExecConsoleCommand(r1_568, "sgm aahf")
  for r8_568, r9_568 in pairs(DataMgr.Pet) do
    r2_568.ExecConsoleCommand(r1_568, "sgm PetAdd " .. r8_568)
  end
  -- close: r4_568
  r0_568:UnlockRegionTeleport(1)
  r0_568:RandomChar()
  r0_568:SkipRegion(1, 999701, 1)
end
function r0_0.RandomChar(r0_569)
  -- line: [7423, 7578] id: 569
  local r1_569 = GWorld:GetAvatar()
  r1_569:ChangeBattleWheel(1, 2, 41017)
  r1_569:ChangeBattleWheel(1, 1, 41014)
  r1_569:ChangeBattleWheel(1, 4, 41015)
  r1_569:ChangeBattleWheel(1, 5, 41011)
  r1_569:ChangeBattleWheel(1, 6, 41010)
  r1_569:ChangeBattleWheel(1, 7, 41003)
  r1_569:ChangeBattleWheel(1, 8, 41013)
  local function r2_569(r0_570, r1_570)
    -- line: [7433, 7453] id: 570
    local r2_570 = {}
    for r7_570 in pairs(r0_570) do
      if r1_570 then
        if r1_570(r7_570) then
          table.insert(r2_570, r7_570)
        end
      else
        table.insert(r2_570, r7_570)
      end
    end
    -- close: r3_570
    if #r2_570 == 0 then
      return nil
    end
    return r2_570[math.random(1, #r2_570)]
  end
  local function r3_569(r0_571, r1_571)
    -- line: [7455, 7475] id: 571
    local r2_571 = {}
    for r7_571, r8_571 in pairs(r0_571) do
      if r1_571 then
        if r1_571(r8_571) then
          table.insert(r2_571, r8_571)
        end
      else
        table.insert(r2_571, r8_571)
      end
    end
    -- close: r3_571
    if #r2_571 == 0 then
      return nil
    end
    return r2_571[math.random(1, #r2_571)]
  end
  local r4_569 = r2_569(r1_569.Chars)
  r1_569:SwitchCurrentChar(r4_569)
  local r5_569 = {}
  for r10_569, r11_569 in pairs(r1_569.Weapons) do
    r5_569[r11_569.WeaponId] = r10_569
  end
  -- close: r6_569
  local r6_569 = r3_569(r5_569, function(r0_572)
    -- line: [7483, 7486] id: 572
    return r1_569.Weapons[r0_572]:IsMelee()
  end)
  r1_569:SwitchWeapon(CommonConst.WeaponType.MeleeWeapon, r6_569)
  local r7_569 = r3_569(r5_569, function(r0_573)
    -- line: [7490, 7492] id: 573
    return r1_569.Weapons[r0_573]:IsRanged()
  end)
  r1_569:SwitchWeapon(CommonConst.WeaponType.RangedWeapon, r7_569)
  r1_569:EquipPet(r2_569(r1_569.Pets))
  local r9_569 = r1_569.Chars[r4_569].CharId
  (function(...)
    -- line: [7500, 7568] id: 574
    local r1_574 = r2_569(r1_569.CommonChars[r9_569].OwnedSkins)
    if r1_574 then
      r1_569:ChangeCharAppearanceSkin(r4_569, 1, r1_574)
    end
    for r6_574, r7_574 in pairs(CommonConst.CharAccessoryTypes) do
      local r8_574 = r3_569(r1_569.CharAccessorys, function(r0_575)
        -- line: [7508, 7510] id: 575
        return DataMgr.CharAccessory[r0_575].AccessoryType == r6_574
      end)
      if r8_574 then
        r1_569:SetCharAppearanceAccessory(r4_569, 1, r8_574)
      end
      -- close: r6_574
    end
    -- close: r2_574
    if r1_574 then
      local r2_574 = {}
      for r6_574 = 1, DataMgr.GlobalConstant.CharColorPart.ConstantValue, 1 do
        r2_574[r6_574] = r2_569(DataMgr.Swatch)
      end
      local r6_574 = r2_574
      r1_569:ChangeCharSkinColors(r1_574, r6_574, 1)
    end
    local r2_574 = r1_569.Weapons[r6_569]
    local r3_574 = r2_569(r1_569.OwnedWeaponSkins, function(r0_576)
      -- line: [7525, 7528] id: 576
      return DataMgr.WeaponSkin[r0_576].ApplicationType == r2_574.SkinApplicationType
    end) and r2_574.WeaponId
    local r6_574 = r6_569
    r1_569:ChangeWeaponAppearanceSkin(r6_574, r3_574)
    local r4_574 = r3_569(r1_569.WeaponAccessorys)
    if r4_574 then
      r1_569:ChangeWeaponAppearanceAccessory(r6_569, r4_574)
    end
    local r5_574 = {}
    r6_574 = 1
    for r9_574 = r6_574, DataMgr.GlobalConstant.WeaponColorPart.ConstantValue, 1 do
      r5_574[r9_574] = r2_569(DataMgr.Swatch)
    end
    r6_574 = r1_569
    r6_574:ChangeWeaponSkinColors(r6_569, r3_574, 1, r5_574)
    r6_574 = r1_569.Weapons
    r6_574 = r6_574[r7_569]
    local r7_574 = r2_569(r1_569.OwnedWeaponSkins, function(r0_577)
      -- line: [7548, 7551] id: 577
      return DataMgr.WeaponSkin[r0_577].ApplicationType == r6_574.SkinApplicationType
    end) and r6_574.WeaponId
    r1_569:ChangeWeaponAppearanceSkin(r7_569, r7_574)
    r4_574 = r3_569(r1_569.WeaponAccessorys)
    if r4_574 then
      r1_569:ChangeWeaponAppearanceAccessory(r7_569, r4_574)
    end
    r5_574 = {}
    for r11_574 = 1, DataMgr.GlobalConstant.WeaponColorPart.ConstantValue, 1 do
      r5_574[r11_574] = r2_569(DataMgr.Swatch)
    end
    r1_569:ChangeWeaponSkinColors(r7_569, r7_574, 1, r5_574)
  end)()
  local r11_569 = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  r11_569:AddTimer(1, function()
    -- line: [7572, 7577] id: 578
    r11_569:ChangeRole(r9_569, AvatarUtils:GetDefaultBattleInfo(r1_569))
  end)
end
function r0_0.ShowGlobalVersion(r0_579)
  -- line: [7580, 7582] id: 579
  UIManager(r0_579):ShowGlobalVersion()
end
function r0_0.HideGlobalVersion(r0_580)
  -- line: [7584, 7586] id: 580
  UIManager(r0_580):HideGlobalVersion()
end
function r0_0.CompleteSystemConditionWithoutGuide(r0_581)
  -- line: [7589, 7614] id: 581
  local r1_581 = GWorld:GetAvatar()
  if not r1_581 then
    return 
  end
  r1_581.bGMHideUnlockPopup = true
  local r2_581 = require("BluePrints.UI.GMInterface.GMFunctionLibrary")
  r2_581.ExecConsoleCommand(r0_581:GetGameInstance(), "sgm sysu")
  r0_581:SuccessAllSystemGuide()
  r2_581.ExecConsoleCommand(r0_581:GetGameInstance(), "sgm CompleteCondition " .. tostring(8002))
  r2_581.ExecConsoleCommand(r0_581:GetGameInstance(), "sgm CompleteCondition " .. tostring(4220))
  r2_581.ExecConsoleCommand(r0_581:GetGameInstance(), "sgm CompleteCondition " .. tostring(4170))
  r2_581.ExecConsoleCommand(r0_581:GetGameInstance(), "sgm CompleteCondition " .. tostring(2001))
end
function r0_0.OpenOnlineActionView(r0_582, r1_582)
  -- line: [7617, 7630] id: 582
  if not r1_582 then
    r1_582 = 1
  else
    r1_582 = tonumber(r1_582)
  end
  local r2_582 = require("BluePrints.UI.WBP.BattleOnlineAction.OnlineActionController")
  if r1_582 == -1 then
    r2_582:HideBtn()
  else
    r2_582:ShowBtn(r1_582)
  end
  r2_582:GetModel():CreatFakeInvitationInfo()
end
function r0_0.OpenMultiChallenge(r0_583, r1_583)
  -- line: [7632, 7634] id: 583
  UIUtils.OpenMultiplayerChallengeLevelChoose(r1_583)
end
function r0_0.SwitchMobileHUDLayout(r0_584, r1_584)
  -- line: [7636, 7639] id: 584
  EventManager:FireEvent(EventID.OnSwitchMobileHUDLayout, tonumber(r1_584))
end
function r0_0.ChangeDSMonsterFramingNodeConfig(r0_585, r1_585, r2_585, r3_585, r4_585, r5_585)
  -- line: [7641, 7650] id: 585
  if not r1_585 or not r2_585 or not r3_585 or not r4_585 or not r5_585 then
    return 
  end
  r1_585 = tonumber(r1_585)
  r2_585 = tonumber(r2_585)
  r3_585 = tonumber(r3_585)
  r5_585 = tonumber(r5_585)
  r0_585:ServerBattleCommand("ChangeDSMonsterFramingNodeConfig", r1_585, r2_585, r3_585, r4_585, r5_585)
end
function r0_0.HideEntertainmentUI(r0_586, r1_586)
  -- line: [7652, 7685] id: 586
  local r2_586 = require("BluePrints.UI.GMInterface.GMVariable")
  if r1_586 ~= 0 then
    r1_586 = r1_586 ~= "0"
  else
    goto label_7	-- block#2 is visited secondly
  end
  if r1_586 then
    r2_586.HideEntertainmentUI = true
  else
    r2_586.HideEntertainmentUI = false
  end
  local r3_586 = GWorld.GameInstance:GetGameUIManager()
  local r4_586 = r3_586:GetUIObj("Entertainment")
  if r4_586 then
    if r1_586 then
      r4_586:SetRenderOpacity(0)
    else
      r4_586:SetRenderOpacity(1)
    end
  end
  if r1_586 then
    EventManager:AddEvent(EventID.LoadUI, r2_586.HideEntertainmentUIObj, function(r0_587, r1_587)
      -- line: [7674, 7681] id: 587
      r4_586 = r3_586:GetUIObj("Entertainment")
      if r4_586 and r2_586.HideEntertainmentUI then
        r4_586:SetRenderOpacity(0)
      end
    end)
  else
    EventManager:RemoveEvent(EventID.LoadUI, r2_586.HideEntertainmentUIObj)
  end
end
function r0_0.HideStoryUI(r0_588, r1_588)
  -- line: [7687, 7736] id: 588
  if r1_588 ~= 0 then
    r1_588 = r1_588 ~= "0"
  else
    goto label_4	-- block#2 is visited secondly
  end
  local r2_588 = require("BluePrints.UI.GMInterface.GMVariable")
  if r1_588 then
    r2_588.HideStoryUI = true
  else
    r2_588.HideStoryUI = false
  end
  local r3_588 = TalkSubsystem()
  local r4_588 = r3_588:GetAllTasks()
  if r1_588 then
    for r9_588, r10_588 in pairs(r4_588) do
      if IsValid(r10_588.UI) then
        r10_588.UI:SetRenderOpacity(0)
      end
    end
    -- close: r5_588
  else
    for r9_588, r10_588 in pairs(r4_588) do
      if IsValid(r10_588.UI) then
        r10_588.UI:SetRenderOpacity(1)
      end
    end
    -- close: r5_588
  end
  if r1_588 then
    EventManager:AddEvent(EventID.LoadUI, r2_588.HideStoryUIObj, function(r0_589, r1_589)
      -- line: [7716, 7732] id: 589
      r3_588 = TalkSubsystem()
      local r2_589 = r3_588:GetAllTasks()
      if r2_588.HideStoryUI then
        for r7_589, r8_589 in pairs(r2_589) do
          if IsValid(r8_589.UI) then
            r8_589.UI:SetRenderOpacity(0)
          end
        end
        -- close: r3_589
      else
        for r7_589, r8_589 in pairs(r2_589) do
          if IsValid(r8_589.UI) then
            r8_589.UI:SetRenderOpacity(1)
          end
        end
        -- close: r3_589
      end
    end)
  else
    EventManager:RemoveEvent(EventID.LoadUI, r2_588.HideStoryUIObj)
  end
end
function r0_0.GetAllOptPackages(r0_590, r1_590)
  -- line: [7738, 7750] id: 590
  local r2_590 = require("BluePrints.UI.GMInterface.GMFunctionLibrary")
  local r3_590 = DataMgr.Resource
  if not r1_590 then
    r1_590 = 10
  end
  for r8_590, r9_590 in pairs(r3_590) do
    if r9_590.MaterialClassify == 7 then
      r2_590.ExecConsoleCommand(r0_590:GetGameInstance(), "sgm ar " .. r8_590 .. " " .. r1_590)
      DebugPrint("ayff test resourceid:" .. r8_590)
    end
  end
  -- close: r4_590
end
function r0_0.ActorSnapShot(r0_591, r1_591, r2_591)
  -- line: [7752, 7811] id: 591
  r1_591 = tonumber(r1_591) and 0
  r2_591 = tonumber(r2_591) and 10000
  local r3_591 = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if not IsValid(r3_591) then
    Utils.ScreenPrint("Error: Player not found!")
    return 
  end
  local r4_591 = TArray(AActor)
  UE4.UGameplayStatics.GetAllActorsOfClass(r3_591, AActor:StaticClass(), r4_591)
  local r5_591 = r4_591:ToTable()
  local r6_591 = UE4.AStaticMeshActor
  local r7_591 = UE4.UInstancedStaticMeshComponent
  local r8_591 = {}
  for r13_591, r14_591 in pairs(r5_591) do
    if IsValid(r14_591) then
      local r15_591 = false
      if r14_591:IsA(r6_591) then
        r15_591 = true
      elseif r14_591:GetComponentByClass(r7_591) then
        r15_591 = true
      end
      if r15_591 then
        table.insert(r8_591, r14_591)
      end
    end
  end
  -- close: r9_591
  Utils.ScreenPrint("Static/Instanced Actors Count: " .. tostring(#r8_591))
  local r9_591 = r3_591:K2_GetActorLocation()
  local r10_591 = r1_591 * 100 * r1_591 * 100
  local r11_591 = r2_591 * 100 * r2_591 * 100
  for r16_591, r17_591 in pairs(r8_591) do
    local r19_591 = UE4.UKismetMathLibrary.VSizeSquared(r17_591:K2_GetActorLocation() - r9_591)
    local r20_591 = nil	-- notice: implicit variable refs by block#[20]
    if r10_591 <= r19_591 then
      r20_591 = r19_591 <= r11_591
    else
      goto label_120	-- block#18 is visited secondly
    end
    if r20_591 and r17_591:ActorHasTag("HiddenByActorSnapShot") then
      r17_591:SetActorHiddenInGame(false)
      r17_591.Tags:Remove("HiddenByActorSnapShot")
    elseif not r17_591.bHidden then
      r17_591:SetActorHiddenInGame(true)
      r17_591.Tags:AddUnique("HiddenByActorSnapShot")
    end
  end
  -- close: r12_591
end
function r0_0.TeleportPlayer(r0_592, r1_592, r2_592, r3_592)
  -- line: [7814, 7822] id: 592
  r1_592 = tonumber(r1_592)
  r2_592 = tonumber(r2_592)
  r3_592 = tonumber(r3_592)
  UE4.UGameplayStatics.GetPlayerCharacter(r0_592:GetGameInstance(), 0):K2_SetActorLocation(UE4.FVector(r1_592, r2_592, r3_592), false, nil, false)
end
return r0_0
