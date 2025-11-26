-- filename: @E:/Pack/Branch/OBT10_Geili\Content/Script/BluePrints\BP_EMGameInstance_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
require("DataMgr")
local r0_0 = require("EMCache.EMCache")
local r1_0 = require("Utils.TimeUtils")
local r2_0 = require("BluePrints.UI.Reddot.ReddotManager")
local r3_0 = require("BluePrints.UI.GameLogin.CdnTool")
local r4_0 = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local r5_0 = require("Utils.MiscUtils")
local r6_0 = require("Utils.SettingUtils")
local r7_0 = {
  TextMapContent = ESystemLanguage.TextMapContent,
  ContentEN = ESystemLanguage.ContentEN,
  ContentJP = ESystemLanguage.ContentJP,
  ContentKR = ESystemLanguage.ContentKR,
  ContentTC = ESystemLanguage.ContentTC,
  ContentDE = ESystemLanguage.ContentDE,
  ContentFR = ESystemLanguage.ContentFR,
  ContentES = ESystemLanguage.ContentES,
}
local r8_0 = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.Common.DelayFrameComponent"
})
function r8_0.Initialize(r0_1, r1_1)
  -- line: [32, 33] id: 1
end
function r8_0.OnLoginSuccess(r0_2)
  -- line: [35, 41] id: 2
  UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UStorySubsystem:StaticClass()):TryInitVars()
  if Const.OpenVerifyArray then
    r0_2:InitVerifyArray()
  end
end
function r8_0.GetInt(r0_3, r1_3, r2_3)
  -- line: [43, 50] id: 3
  local r4_3 = require(string.format("%s", r1_3))[r2_3]
  if r4_3 == nil then
    return 0
  end
  return r4_3
end
function r8_0.IsLowScalabilityLevel(r0_4, r1_4)
  -- line: [52, 57] id: 4
  if CommonUtils.HasValue(Const.BanSmallLevelScalabilityLevel, r1_4) then
    return true
  end
  return false
end
function r8_0.GetSerializeDistanceRatio(r0_5, r1_5, r2_5)
  -- line: [59, 65] id: 5
  local r3_5 = 1
  if r2_5 == "IOS" or r0_5:GetUseMapPhoneInPC() then
    r3_5 = Const.IOSSerializeDistanceRatio[r1_5]
    if r3_5 then
      r3_5 = r3_5
    end
  end
  return r3_5
end
function r8_0._FontOptimizeSetting(r0_6)
  -- line: [68, 84] id: 6
  UKismetSystemLibrary.ExecuteConsoleCommand(r0_6, "Slate.MaxFontAtlasPagesBeforeFlush 2")
  UKismetSystemLibrary.ExecuteConsoleCommand(r0_6, "Slate.MaxFontNonAtlasTexturesBeforeFlush 4")
  local r1_6 = UE4.UUIFunctionLibrary.GetDevicePlatformName(r0_6)
  if r1_6 == "Android" then
    UKismetSystemLibrary.ExecuteConsoleCommand(r0_6, "Slate.Font.AsyncLazyLoad 1")
    UKismetSystemLibrary.ExecuteConsoleCommand(r0_6, "Slate.Font.RemoveLastNoUseFontFace 1")
    UKismetSystemLibrary.ExecuteConsoleCommand(r0_6, "Slate.Font.ForcePreserveFontFaceCount 6")
    UKismetSystemLibrary.ExecuteConsoleCommand(r0_6, "Slate.GrowFontAtlasFrameWindow 10")
  elseif r1_6 == "IOS" then
    UKismetSystemLibrary.ExecuteConsoleCommand(r0_6, "Slate.Font.AsyncLazyLoad 1")
    UKismetSystemLibrary.ExecuteConsoleCommand(r0_6, "Slate.Font.RemoveLastNoUseFontFace 1")
    UKismetSystemLibrary.ExecuteConsoleCommand(r0_6, "Slate.Font.ForcePreserveFontFaceCount 4")
    UKismetSystemLibrary.ExecuteConsoleCommand(r0_6, "Slate.GrowFontAtlasFrameWindow 5")
  end
end
function r8_0.InitReady(r0_7)
  -- line: [86, 121] id: 7
  if IsDedicatedServer(r0_7) then
    GWorld.bDebugServer = r0_7.bDebugServer
    print(_G.LogTag, "DebugServer", GWorld.bDebugServer)
  else
    r0_7:_FontOptimizeSetting()
  end
  if URuntimeCommonFunctionLibrary.IsPlayInEditor(r0_7) then
    DebugPrint("Check Open FX Budget in Editor ", Const.bEditorOpenFXBudget)
    if Const.bEditorOpenFXBudget then
      UKismetSystemLibrary.ExecuteConsoleCommand(r0_7, "fx.Niagara.ForceAutoPooling 1", nil)
    else
      UKismetSystemLibrary.ExecuteConsoleCommand(r0_7, "fx.Niagara.ForceAutoPooling 0", nil)
    end
  end
  r0_7:CreateAvatar()
  GWorld.GameInstance = r0_7
  if not URuntimeCommonFunctionLibrary.IsPlayInEditor(r0_7) then
    _G.Battle = function(r0_8)
      -- line: [109, 109] id: 8
      return GWorld.Battle
    end
  end
  r0_7:InitGameSystemVoice()
  GWorld.NetworkMgr = r0_7:GetNetworkManager()
  GWorld.NetworkMgr:GetTcpInstance():InitSuccessLua()
  GWorld.BP_Avatar = r0_7:GetAvatar()
end
function r8_0.OnPostWorldCleanup(r0_9, r1_9, r2_9, r3_9)
  -- line: [123, 129] id: 9
  if r1_9:GetName() == r0_9:GetWorld():GetName() and not GWorld:GetAvatar() then
    EventManager:CheckIsLeak()
  end
end
function r8_0.NowTime(r0_10)
  -- line: [131, 133] id: 10
  return r1_0.NowTime()
end
function r8_0.SetWorldStandardTime_Lua(r0_11)
  -- line: [135, 139] id: 11
  if IsStandAlone(r0_11) or IsClient(r0_11) then
    r1_0.RequestSetNowTime()
  end
end
function r8_0.OnStart_Lua(r0_12, r1_12)
  -- line: [141, 145] id: 12
  if IsDedicatedServer(r0_12) and not GWorld.bDebugServer then
    r0_12:HandleDSConnect(r1_12)
  end
end
function r8_0.OnUpdateNetDriverInfo(r0_13, r1_13, r2_13)
  -- line: [147, 160] id: 13
  DebugPrint(r1_13, r2_13)
  if IsDedicatedServer(r0_13) and not GWorld.bDebugServer then
    local r3_13 = GWorld:GetDSEntity()
    if r3_13 then
      r3_13:UpdateNetDriverInfo(r1_13, r2_13)
    end
  elseif r5_0.IsListenServer(r0_13) then
    local r3_13 = GWorld:GetAvatar()
    if r3_13 then
      r3_13:UpdateNetDriverInfo(r1_13, r2_13)
    end
  end
end
function r8_0.SetInstance2GWorld(r0_14)
  -- line: [162, 166] id: 14
  GWorld.GameInstance = r0_14
  GWorld.IsDev = r0_14:GetIsDev()
  _G.EMUIAnimationSubsystem = USubsystemBlueprintLibrary.GetWorldSubsystem(r0_14, UEMUIAnimationSubsystem)
end
function r8_0.HandleDSConnect(r0_15, r1_15)
  -- line: [168, 199] id: 15
  if r1_15 == -1 then
    r1_15 = Const.DS_Default_GroupId
  end
  r0_15.DSConnectHostnum = r1_15
  local r2_15 = r1_15
  local r4_15 = require("BluePrints/UI/GameLogin/BattleServerList")[r2_15]
  if not r4_15 then
    DebugNetPrint("HandleDSConnect error with no BattleServerInfo", r1_15)
    return 
  end
  local r5_15 = nil
  local r6_15 = nil
  local r7_15 = r4_15.ip
  if type(r7_15) == "string" then
    r5_15 = r7_15
  else
    r5_15 = r7_15[math.random(1, #r7_15)]
  end
  local r8_15 = r4_15.port
  if type(r8_15) == "number" then
    r6_15 = r8_15
  else
    r6_15 = r8_15[math.random(1, #r8_15)]
  end
  DebugNetPrint("HandleDSConnect", r2_15, r5_15, r6_15)
  GWorld.NetworkMgr:ConnectServer(r2_15, r5_15, r6_15)
end
function r8_0.IsNullDungeonId(r0_16, r1_16)
  -- line: [201, 203] id: 16
  return r1_16 == -1
end
function r8_0.GetDataInt(r0_17, r1_17, r2_17, r3_17)
  -- line: [205, 219] id: 17
  local r4_17 = DataMgr[r1_17]
  if r4_17 ~= nil then
    local r5_17 = r4_17[r2_17]
    if r5_17 ~= nil then
      local r6_17 = r5_17[r3_17]
      if r6_17 ~= nil then
        return r6_17
      end
    end
  end
  return 0
end
function r8_0.HandleNetworkError(r0_18, r1_18, r2_18)
  -- line: [223, 239] id: 18
  print(_G.LogTag, "HandleNetworkError", r1_18, r2_18)
  if not r2_18 and not r0_18.bHandleNetError then
    r0_18.bHandleNetError = true
    if r1_18 == 4 then
      print(_G.LogTag, "HandleNetworkError ConnectTimeout")
      local r3_18 = GWorld:GetAvatar()
      if r3_18 then
        r3_18:HandleNetworkError_ConnectTimeout()
        return 
      end
    end
    GWorld.NetworkMgr:DisconnectAndReturnLogin()
  elseif r2_18 then
    r0_18:CloseDS()
  end
end
function r8_0.GetDsType(r0_19)
  -- line: [241, 250] id: 19
  if r0_19.DSType == CommonConst.DSType.Leaf then
    return "Leaf"
  elseif r0_19.DSType == CommonConst.DSType.Child then
    return "Child"
  elseif r0_19.DSType == CommonConst.DSType.Root then
    return "Root"
  end
  return "None"
end
function r8_0.OnSubProcessInit(r0_20, r1_20)
  -- line: [252, 259] id: 20
  math.randomseed(r1_20)
  if r0_20.DSType == CommonConst.DSType.Leaf then
    r0_20:AddTimer(2, function()
      -- line: [255, 257] id: 21
      r0_20:GetDSAssetsManager():TryCheckPreLoadAssets()
    end)
  end
end
function r8_0.SetFixedStartPoint(r0_22, r1_22, r2_22, r3_22, r4_22)
  -- line: [262, 269] id: 22
  print(_G.LogTag, "SetFixedStartPoint", r1_22, r2_22)
  r0_22.UseFixedStartPoint = true
  r0_22.StartLocation = r1_22
  r0_22.StartRotation = r2_22
  r0_22.StartControllerRotation = r3_22
  r0_22.bCharacterDead = r4_22
end
function r8_0.ResetFixedStartPoint(r0_23)
  -- line: [272, 276] id: 23
  print(_G.LogTag, "ResetFixedStartPoint")
  r0_23.UseFixedStartPoint = false
  r0_23.bCharacterDead = nil
end
function r8_0.IsUseFixedStartPoint(r0_24)
  -- line: [278, 280] id: 24
  return r0_24.UseFixedStartPoint and false
end
function r8_0.SetStartSpotWithFixedTransform(r0_25, r1_25)
  -- line: [282, 291] id: 25
  if not r0_25.UseFixedStartPoint then
    return false
  end
  r1_25:K2_SetActorTransform(UE4.FTransform(r0_25.StartRotation:ToQuat(), r0_25.StartLocation), false, nil, false)
  r1_25:K2_SetActorLocation(r0_25.StartLocation, false, nil, false)
  r1_25:K2_SetActorRotation(r0_25.StartRotation, false, nil, false)
  return true
end
function r8_0.CachePlayerCharacterInfo(r0_26, ...)
  -- line: [293, 295] id: 26
  r0_26.PlayerCharacterInfo = table.pack(...)
end
function r8_0.ConsumePlayerCharacterInfo(r0_27, r1_27)
  -- line: [297, 305] id: 27
  if not r0_27.PlayerCharacterInfo then
    return 
  end
  local r2_27, r3_27, r4_27 = table.unpack(r0_27.PlayerCharacterInfo)
  r1_27:SetEndPointInfo(r2_27, r3_27, r4_27)
  r0_27.PlayerCharacterInfo = nil
end
function r8_0.PreInitGameMode(r0_28, r1_28)
  -- line: [307, 309] id: 28
  r0_28.CustomPreInitInfo = r1_28
end
function r8_0.ConsumeGameModePreInitInfo(r0_29)
  -- line: [311, 315] id: 29
  r0_29.CustomPreInitInfo = nil
  return r0_29.CustomPreInitInfo
end
function r8_0.OnPlayerControllerGameEnd(r0_30, r1_30, r2_30, r3_30)
  -- line: [317, 342] id: 30
  r0_30.DungeonIdCache = r0_30:GetCurrentDungeonId()
  local r4_30 = UE4.UGameplayStatics.GetGameState(r0_30)
  local r5_30 = r0_30:GetSceneManager()
  if r5_30 ~= nil then
    r5_30:OnDungeonEnd_ToSceneManager(r1_30, r2_30, r4_30.GameModeType)
  end
  if r4_30.GameModeType == "Training" or r4_30.GameModeType == "Trial" then
    DebugPrint("DungeonSettlement: 训练场或角色试玩玩法，直接退出副本")
    GWorld:GetAvatar():ExitDungeonSettlement()
    return 
  end
  r0_30.IsInSettlementScene = true
  local r6_30 = UIManager(r0_30):GetUIObj("WalnutChoice")
  if r6_30 then
    r6_30:Close()
  end
  r0_30:OnPlayerControllerGameEnd_Internal(r1_30, r2_30, r3_30)
end
function r8_0.CalculatePhantom(r0_31)
  -- line: [345, 357] id: 31
  local r1_31 = UE4.UGameplayStatics.GetPlayerCharacter(r0_31, 0)
  local r2_31 = r1_31:GetPhantomTeammates()
  local r3_31 = 0
  for r8_31, r9_31 in pairs(r2_31) do
    if r9_31 ~= r1_31 and not r9_31:IsDead() then
      r3_31 = r3_31 + 1
    end
  end
  -- close: r4_31
  r0_31.PhantomTeammatesNum = r3_31
  r0_31.InitPhantomTeammates = 0
  DebugPrint("CalculatePhantom PhantomTeammatesNum", r0_31.PhantomTeammatesNum)
end
function r8_0.AddOnPhantomInitReadyEvent(r0_32)
  -- line: [359, 363] id: 32
  if r0_32.PhantomTeammatesNum > 0 then
    EventManager:AddEvent(EventID.OnPhantomInitReady, r0_32, r0_32.OnSettlementPhantomInitReady)
  end
end
function r8_0.OnPlayerControllerGameEnd_Internal(r0_33, r1_33, r2_33, r3_33)
  -- line: [365, 404] id: 33
  -- notice: unreachable block#6
  r0_33:PushGameEndInfo(r1_33, r2_33)
  local r4_33 = GWorld:GetAvatar()
  local r5_33 = r4_33 and r4_33:IsInHardBoss()
  local r6_33 = r4_33
  if r6_33 then
    r6_33 = r4_33:IsInHardBoss()
    if not r6_33 then
      r6_33 = not r4_33:IsInRougeLike()
    else
      r6_33 = false
    end
  end
  if r6_33 and not r4_33:IsInNarrowDungeon() then
    GWorld.DungeonSettlementAgainInVisible = true
  end
  r0_33.IsMoveToTempScene = false
  local r7_33 = nil
  local r8_33 = r0_33:GetCurrentDungeonId()
  r0_33.ScenePlayers = r3_33
  function r7_33()
    -- line: [380, 392] id: 34
    local r0_34 = GWorld:GetAvatar()
    if r6_33 and r0_34:CheckMoveToTempScene(r8_33, r1_33) then
      EventManager:AddEvent(EventID.OnMainCharacterBeginPlay, r0_33, r0_33.OnSettlementPlayerCharacterBeginPlay)
      EventManager:AddEvent(EventID.OnNotifyClientToCloseLoading, r0_33, r0_33.OnSettlementPlayerCharacterInitReady)
      r0_33.IsMoveToTempScene = true
      r0_33.NeedPlayTempSceneMonstage = true
    else
      r0_33:CalculatePhantom()
      r0_33:OnBlackScreenSyncFinished(r5_33)
    end
  end
  r0_33:RecordCombatData()
  local r9_33 = r0_33:CreateDungeonBlackScreen(true, r7_33, r1_33)
  UE4.UGameplayStatics.GetPlayerController(r0_33, 0):GetMyPawn():ResetIdle()
end
function r8_0.RecordCombatData(r0_35)
  -- line: [406, 533] id: 35
  r0_35.CombatData = {}
  local r1_35 = UE4.UGameplayStatics.GetPlayerCharacter(r0_35, 0)
  if r1_35 then
    r0_35.CombatData.TakeDamagePercentage = r1_35.PlayerState.TakeDamagePercentage
    r0_35.CombatData.TakedDamage = r1_35:GetTakedDamage()
    r0_35.CombatData.TakedShieldDamage = r1_35:GetShieldTakedDamage()
    r0_35.CombatData.TakedHeal = r1_35:GetTakedHeal()
    r0_35.CombatData.DeadCount = r1_35:GetRecoveryCount()
    if r1_35:IsDead() then
      r0_35.CombatData.DeadCount = r0_35.CombatData.DeadCount + 1
    end
    r0_35.CombatData.DamagePercentage = r1_35.PlayerState.DamagePercentage and 0
    r0_35.CombatData.TotalDamage = r1_35:GetFinalDamage() and 0
    r0_35.CombatData.MeleeDamage = r1_35:GetMeleeDamage() and 0
    r0_35.CombatData.RangedDamage = r1_35:GetRangedDamage() and 0
    local r2_35 = r0_35.CombatData
    local r3_35 = r1_35:GetSkillDamage() and 0
    r2_35.SkillDamage = r3_35 + (r1_35:GetSummonDamage() and 0)
    r0_35.CombatData.SupportDamage = r1_35:GetSupportDamage() and 0
    r0_35.CombatData.GiveHealing = r1_35:GetGiveHealing() and 0
    r0_35.CombatData.TotalKill = r1_35:GetTotalKillCount() and 0
    r0_35.CombatData.MeleeKill = r1_35:GetMeleeKillCount() and 0
    r0_35.CombatData.RangedKill = r1_35:GetRangedKillCount() and 0
    r2_35 = r0_35.CombatData
    r3_35 = r1_35:GetSkillKillCount() and 0
    r2_35.SkillKill = r3_35 + (r1_35:GetSummonKillCount() and 0)
    r0_35.CombatData.SupportKill = r1_35:GetSupportKillCount() and 0
    r0_35.CombatData.SpConsume = r1_35:GetSpConsume() and 0
    r0_35.CombatData.BulletConsume = r1_35:GetBulletConsume() and 0
    r0_35.CombatData.ChestOpenedCount = r1_35:GetChestOpenedCount() and 0
    r0_35.CombatData.BreakableItemCount = r1_35:GetBreakableItemCount() and 0
    r0_35.CombatData.MaxComboCount = r1_35:GetMaxComboCount() and 0
    r0_35.CombatData.MaxDamage = r1_35:GetMaxDamage() and 0
    r0_35.CombatData.OldBattleInfo = {
      Char_OldBattleInfo = r1_35.PlayerState:GetOldBattleInfo("Char"),
      MeleeWeapon_OldBattleInfo = r1_35.PlayerState:GetOldBattleInfo("MeleeWeapon"),
      RangedWeapon_OldBattleInfo = r1_35.PlayerState:GetOldBattleInfo("RangedWeapon"),
      Player_OldBattleInfo = r1_35.PlayerState:GetOldBattleInfo("Player"),
    }
    r0_35.CombatData.CurBattleInfo = {}
    r0_35.CombatData.CurBattleInfo.Char_CurBattleInfo = {
      Exp = r1_35:GetAttr("Exp"),
      Level = r1_35:GetAttr("Level"),
    }
    if r1_35.MeleeWeapon then
      r0_35.CombatData.CurBattleInfo.MeleeWeapon_CurBattleInfo = {
        Exp = r1_35.MeleeWeapon:GetAttr("Exp"),
        Level = r1_35.MeleeWeapon:GetAttr("Level"),
      }
    end
    if r1_35.RangedWeapon then
      r0_35.CombatData.CurBattleInfo.RangedWeapon_CurBattleInfo = {
        Exp = r1_35.RangedWeapon:GetAttr("Exp"),
        Level = r1_35.RangedWeapon:GetAttr("Level"),
      }
    end
    r2_35 = r1_35:GetCurrentWeapon()
    if r2_35 then
      r0_35.CombatData.CurrentWeaponType = r2_35:GetWeaponType()
      r0_35.CombatData.CurrentWeaponMeleeOrRanged = r2_35:GetWeaponMeleeOrRanged()
    end
    r3_35 = UE4.UGameplayStatics.GetGameMode(r0_35)
    local r4_35 = UE4.UGameplayStatics.GetGameState(r0_35)
    if r3_35 and r4_35 and r4_35.GameModeType == "Temple" then
      r0_35.CombatData.StarLevel = r3_35:TriggerDungeonComponentFun("GetStarLevel")
      r0_35.CombatData.FailReason = r3_35:TriggerDungeonComponentFun("GetPlayerFailReason")
      r0_35.CombatData.Score = r3_35:TriggerDungeonComponentFun("GetScore")
      r0_35.CombatData.Collection = r3_35:TriggerDungeonComponentFun("GetCollection")
      r0_35.CombatData.RemainTempleTime = r3_35:TriggerDungeonComponentFun("GetRemainTempleTime")
      r0_35.CombatData.TempleTime = r4_35.TempleTime
      r0_35.CombatData.MaxTempleStar = r4_35.MaxTempleStar
    end
    if r4_35 and r4_35.GameModeType == "Party" then
      r0_35.CombatData.StarLevel = r4_35.CurPartyStar
      r0_35.CombatData.NumOfPlayers = r4_35.PartyPlayerDisPercent.Items:Num()
      r0_35.CombatData.PartyPlayerCompleteTime = {}
      for r8_35 = 1, r4_35.PartyPlayerCompleteTime:Num(), 1 do
        r0_35.CombatData.PartyPlayerCompleteTime[r8_35] = r4_35.PartyPlayerCompleteTime:GetRef(r8_35)
      end
    end
    if r3_35 and r4_35 and r4_35.GameModeType == "FeinaEvent" then
      r0_35.CombatData.CurScore = r3_35:TriggerDungeonComponentFun("GetStar")
      local r5_35 = GWorld:GetAvatar()
      local r6_35 = r0_35:GetCurrentDungeonId()
      if r5_35 and r5_35.FeiNaDungeonData and r5_35.FeiNaDungeonData[r6_35] and r5_35.FeiNaDungeonData[r6_35].MaxProgress then
        r0_35.CombatData.MaxScore = r5_35.FeiNaDungeonData[r6_35].MaxProgress
      end
      if r5_35 and r5_35.Dungeons[r6_35] and not r5_35.Dungeons[r6_35].IsPass then
        r0_35.CombatData.NotPass = true
      end
    end
    if r3_35 and r4_35 and r4_35.GameModeType == "Paotai" then
      r0_35.CombatData.CurScore = r3_35:TriggerDungeonComponentFun("GetScore")
      r0_35.CombatData.CurStar = r3_35:TriggerDungeonComponentFun("GetStar")
      local r5_35 = GWorld:GetAvatar()
      local r6_35 = r0_35:GetCurrentDungeonId()
      if r5_35 and r5_35.PaotaiGame and r5_35.PaotaiGame[r6_35] and r5_35.PaotaiGame[r6_35].MaxScore then
        r0_35.CombatData.MaxScore = r5_35.PaotaiGame[r6_35].MaxScore
      end
    end
    r0_35.CombatData.IsInOnlineDungeon = GWorld:GetAvatar():IsInMultiDungeon()
    r0_35.CombatData.TeammateDamageInfos = r1_35:GetTeammateDamageInfos():ToTable()
    for r10_35, r11_35 in ipairs(r0_35.CombatData.TeammateDamageInfos) do
      if r11_35.TeammateEid and TeamController:GetModel() and TeamController:GetModel():GetTeamMember(r11_35.TeammateEid) then
        r11_35.Index = TeamController:GetModel():GetTeamMember(r11_35.TeammateEid).Index
      end
    end
    -- close: r6_35
    local r6_35 = r0_35.CombatData
    local r7_35 = r1_35:GetTeammateDamageInfos()
    if r7_35 then
      r7_35 = r1_35:GetTeammateDamageInfos():Num() and 0
    else
      goto label_496	-- block#86 is visited secondly
    end
    r6_35.TeammateNum = r7_35
    r0_35.CombatData.PhantomAttrInfos = r1_35:GetPhantomAttrInfos():ToTable()
    r6_35 = r0_35.CombatData
    r7_35 = r1_35:GetPhantomAttrInfos()
    if r7_35 then
      r7_35 = r1_35:GetPhantomAttrInfos():Num() and 0
    else
      goto label_515	-- block#89 is visited secondly
    end
    r6_35.PhantomNum = r7_35
    r0_35.GameEndTime = r1_0.NowTime()
    r0_35:FillTempTeamInfo(r4_35, r1_35)
  end
  PrintTable(r0_35.CombatData, 5)
end
function r8_0.FillTempTeamInfo(r0_36, r1_36, r2_36)
  -- line: [535, 555] id: 36
  r0_36.CombatData.TempTeamInfo = {}
  if not r1_36 or not r2_36 then
    return 
  end
  for r7_36, r8_36 in pairs(r1_36.PlayerArray) do
    if r8_36 then
      local r9_36 = {
        IsMainPlayer = r8_36.Eid == r2_36.Eid,
        Eid = r8_36.Eid,
        Uid = r8_36.Uid,
        PlayerLevel = r8_36.PlayerLevel,
        PlayerName = r8_36.PlayerName,
        HeadIconId = r8_36.HeadIconId,
      }
      r0_36.CombatData.TempTeamInfo[r8_36.Uid] = r9_36
      DebugPrint("ljl@FillTempTeamInfo Uid", r9_36.Uid)
    end
  end
  -- close: r3_36
end
function r8_0.PushGameEndInfo(r0_37, ...)
  -- line: [557, 559] id: 37
  r0_37.GameEndInfo = table.pack(...)
end
function r8_0.EnablePlayerCharacterInput(r0_38)
  -- line: [561, 565] id: 38
  local r1_38 = UE4.UGameplayStatics.GetPlayerController(r0_38, 0)
  r1_38:GetMyPawn():EnableInput(r1_38)
end
function r8_0.CreateDungeonBlackScreen(r0_39, r1_39, r2_39, r3_39)
  -- line: [567, 571] id: 39
  local r4_39 = GWorld.GameInstance:GetGameUIManager()
  DebugPrint("DungeonSettlement: CreateDungeonBlackScreen")
  return r4_39:LoadUINew("DungeonBlackScreen", r1_39, r2_39, r3_39)
end
function r8_0.OnBlackScreenSyncFinished(r0_40, r1_40)
  -- line: [573, 580] id: 40
  DebugPrint("OnBlackScreenSyncFinished")
  r0_40:OnSettlementPlayerCharacterBeginPlay()
  if not r1_40 or r0_40.PhantomTeammatesNum == 0 then
    r0_40:OnCharaterReset()
    r0_40:OnSettlementPlayerCharacterInitReady()
  end
end
function r8_0.OnSettlementPlayerCharacterBeginPlay(r0_41)
  -- line: [583, 588] id: 41
  EventManager:RemoveEvent(EventID.OnMainCharacterBeginPlay, r0_41)
  DebugPrint("DungeonSettlement: OnSettlementPlayerCharacterBeginPlay")
  local r1_41 = r0_41:CreateDungeonBlackScreen(false)
  r0_41.GameEndInfo = nil
end
function r8_0.OnSettlementPhantomInitReady(r0_42)
  -- line: [590, 598] id: 42
  DebugPrint("OnSettlementPhantomInitReady")
  r0_42.InitPhantomTeammates = r0_42.InitPhantomTeammates + 1
  if r0_42.PhantomTeammatesNum <= r0_42.InitPhantomTeammates then
    EventManager:RemoveEvent(EventID.OnPhantomInitReady, r0_42)
    r0_42:OnCharaterReset()
    r0_42:OnSettlementPlayerCharacterInitReady()
  end
end
function r8_0.OnCharaterReset(r0_43)
  -- line: [600, 605] id: 43
  local r1_43 = UE4.UGameplayStatics.GetPlayerCharacter(r0_43, 0)
  r1_43:InitCharacterInfo(r1_43.InfoForInit)
  r1_43:ResetIdle()
  USkillFeatureFunctionLibrary.SKillFeatureForceStop()
end
function r8_0.OnSettlementPlayerCharacterInitReady(r0_44)
  -- line: [607, 612] id: 44
  EventManager:RemoveEvent(EventID.OnNotifyClientToCloseLoading, r0_44)
  r0_44.bPlayerCharacterInitReady = true
  r0_44:TryDungeonSettlement()
end
function r8_0.PushLogicServerCallbackInfo(r0_45, ...)
  -- line: [614, 626] id: 45
  if WorldTravelSubsystem() and WorldTravelSubsystem():GetCurrentSceneId() == 0 then
    DebugPrint("TryDungeonSettlement SceneId为0，丢弃此次逻辑服结算数据！")
    return 
  end
  r0_45.LogicServerCallbackInfo = table.pack(...)
  r0_45:TryDungeonSettlement()
end
function r8_0.SetExitLevelEndPointInfo(r0_46, r1_46)
  -- line: [629, 633] id: 46
  print(_G.LogTag, "SetExitLevelEndPointInfo", r1_46.Translation, r1_46.Rotation)
  r0_46.UseExitLevel = true
  r0_46.ExitLevelEndPointTransformation = r1_46
end
function r8_0.TryDungeonSettlement(r0_47)
  -- line: [635, 715] id: 47
  DebugPrint("DungeonSettlement: TryDungeonSettlement", r0_47.bPlayerCharacterInitReady, r0_47.LogicServerCallbackInfo)
  if r0_47.bPlayerCharacterInitReady and r0_47.LogicServerCallbackInfo then
    if CommonUtils.GetDeviceTypeByPlatformName(r0_47) ~= "Mobile" then
      local r1_47 = UGameplayStatics.GetActorOfClass(r0_47, APostProcessVolume:StaticClass())
      local r2_47 = UGameplayStatics.GetActorOfClass(r0_47, ARuntimeVirtualTextureVolume:StaticClass())
      if r1_47 and not r2_47 then
        local r3_47 = r1_47:GetTransform()
        local r4_47 = UKismetMathLibrary.MakeTransform(r3_47.Translation - r3_47.Scale3D * 200, FRotator(), r3_47.Scale3D * 400 * 2)
        local r5_47 = r0_47:GetWorld():SpawnActor(ARuntimeVirtualTextureVolume:StaticClass(), r4_47, UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn)
        local r6_47 = r0_47:GetWorld():SpawnActor(ARuntimeVirtualTextureVolume:StaticClass(), r4_47, UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn)
        r5_47.VirtualTextureComponent.VirtualTexture = LoadObject("/Game/Asset/Scene/common/3Texture/RVT/RVT_DefaultColor.RVT_DefaultColor")
        r5_47.VirtualTextureComponent.StreamingTexture = LoadObject("/Game/Asset/Scene/common/3Texture/RVT/RVT_Color_SVT.RVT_Color_SVT")
        r6_47.VirtualTextureComponent.VirtualTexture = LoadObject("/Game/Asset/Scene/common/3Texture/RVT/RVT_DefaultHeight.RVT_DefaultHeight")
        r6_47.VirtualTextureComponent.StreamingTexture = LoadObject("/Game/Asset/Scene/common/3Texture/RVT/RVT_Height_SVT.RVT_Height_SVT")
        URuntimeCommonFunctionLibrary.MarkRVTVolumeDirty(r5_47)
        URuntimeCommonFunctionLibrary.MarkRVTVolumeDirty(r6_47)
      elseif not r1_47 then
        DebugPrint("DungeonSettlement:No PostProcessVolume So No RuntimeVirtualVolume")
      end
    end
    local r1_47 = r0_47:GetCurrentDungeonId()
    if r1_47 ~= 0 then
      EventManager:FireEvent(EventID.SystemGuideExitDungeon, r0_47:GetCurrentDungeonId())
    end
    PrintTable(r0_47.LogicServerCallbackInfo, 5)
    r0_47.bPlayerCharacterInitReady = nil
    local r2_47 = GWorld:GetAvatar()
    if not r2_47 then
      DebugPrint("Error: DungeonSettlement: 找不到Avatar!")
    end
    local r3_47 = WorldTravelSubsystem():GetCurrentDungeonType()
    local r4_47 = CommonUtils.DeepCopy(r0_47.LogicServerCallbackInfo)
    r0_47.LogicServerCallbackInfo = nil
    local r5_47 = GWorld.GameInstance:GetGameUIManager()
    local function r6_47()
      -- line: [671, 690] id: 48
      r0_47.IsInSettlementScene = nil
      local r0_48 = UE4.UGameplayStatics.GetGameState(r0_47)
      if r0_48 then
        r0_48.IsInSettlementScene = true
      end
      if r2_47 and r2_47:IsInRougeLike() then
        r5_47:LoadUINew("RougeSettlement", r4_47)
      elseif r3_47 and r3_47 == CommonConst.DungeonType.Abyss then
        r5_47:LoadUINew("AbyssSettlement", r4_47)
      elseif DataMgr.Dungeon[r1_47] and DataMgr.Dungeon[r1_47].IsGameEventDungeon then
        r0_47:LoadGameEventSettlementUI(r1_47, r3_47, r4_47)
      else
        r5_47:LoadUINew("DungeonSettlement", r4_47, r0_47.DungeonIdCache, r0_47.CombatData)
      end
    end
    local r7_47 = false
    if DataMgr.Dungeon[r1_47] and DataMgr.Dungeon[r1_47].IsGameEventDungeon then
      r7_47 = true
    end
    r5_47:GetUI("DungeonBlackScreen"):FadeOut(r6_47, r7_47)
    if r2_47 and r2_47:IsInRougeLike() then
      return 
    end
    local r10_47 = UE4.UGameplayStatics.GetPlayerController(r0_47, 0):GetMyPawn()
    if r0_47.UseExitLevel then
      local r11_47 = r0_47.ExitLevelEndPointTransformation
      r10_47:SetEndPointInfo(true, r11_47.Translation, r11_47.Rotation:ToRotator())
      r0_47.UseExitLevel = false
    end
    r10_47:SetCanInteractiveTrigger(false)
    r0_47:PlayerDungeonSettlement(table.unpack(r4_47))
    -- close: r1_47
  end
end
function r8_0.IsInTempScene(r0_49)
  -- line: [717, 726] id: 49
  if r0_49.IsInSettlementScene then
    return true
  end
  local r1_49 = UE4.UGameplayStatics.GetGameState(r0_49)
  if r1_49 and r1_49.IsInSettlementScene then
    return true
  end
  return false
end
function r8_0.PlayerDungeonSettlement(r0_50, r1_50)
  -- line: [728, 794] id: 50
  r0_50.SettlementCharacters = {}
  if r0_50.ScenePlayers ~= nil then
    local r2_50 = nil
    local r3_50 = GWorld:GetAvatar()
    if r3_50 then
      if r3_50:IsInHardBoss() then
        local r4_50 = r3_50.HardBossInfo.HardBossId
        DebugPrint("BP_EMGameInstance_C:PlayerDungeonSettlement HardBossId:", r4_50)
        r2_50 = DataMgr.HardBossMain[r4_50]
      else
        local r4_50 = r0_50:GetCurrentDungeonId()
        DebugPrint("BP_EMGameInstance_C:PlayerDungeonSettlement DungeonId:", r4_50)
        r2_50 = DataMgr.Dungeon[r4_50]
      end
    end
    if r2_50 == nil then
      DebugPrint("error: BP_EMGameInstance_C:PlayerDungeonSettlement SettlementData is nil!")
    end
    local r4_50, r5_50 = r0_50:CalculateSettlementOriginLoc(r0_50.IsMoveToTempScene)
    local r6_50 = FTransform(r5_50:ToQuat(), r4_50)
    for r10_50 = 1, #r0_50.ScenePlayers, 1 do
      if r0_50.ScenePlayers[r10_50].IsMainPlayer then
        local r11_50 = UE4.UGameplayStatics.GetPlayerCharacter(r0_50, 0)
        r11_50:InitCharacterInfo(r0_50.ScenePlayers[r10_50])
        r11_50:ResetOnSetEndPoint()
        r11_50:SetMainPlayerDungeonSettlementTransform(r0_50.IsMoveToTempScene, r4_50, r5_50)
        if r2_50 then
          r11_50:OnDungeonSettlement(r1_50, r10_50, r2_50)
        end
        for r17_50, r18_50 in pairs(r11_50:GetPhantomTeammates()) do
          if r18_50 ~= r11_50 then
            r18_50:SetActorHideTag("DungeonSettlement", true, false, true)
          end
        end
        -- close: r13_50
        if r0_50.ScenePlayers[r10_50].IsDead and TeamController then
          TeamController:SendTeamLeave()
          TeamController:GetModel():SetTeam(nil)
        end
      elseif r1_50 and (not r2_50 or not r2_50.NotShowTeammate) then
        local r11_50 = r0_50:GetWorld():SpawnActor(LoadClass("/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C"), r6_50, UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn)
        r11_50:InitCharacterInfo(r0_50.ScenePlayers[r10_50])
        r11_50:ResetOnSetEndPoint()
        r11_50:SetOtherPlayerDungeonSettlementTransform()
        if r2_50 then
          r11_50:OnDungeonSettlementByIndex(r10_50, r0_50.ScenePlayers[r10_50].CurrentWeaponType, r0_50.ScenePlayers[r10_50].CurrentWeaponMeleeOrRanged, r2_50)
        end
        table.insert(r0_50.SettlementCharacters, r11_50)
      end
    end
  end
end
function r8_0.CalculateSettlementOriginLoc(r0_51, r1_51)
  -- line: [796, 820] id: 51
  local r2_51 = UE4.UGameplayStatics.GetPlayerCharacter(r0_51, 0)
  if r1_51 then
    local r3_51, r4_51, r5_51 = r2_51:GetEndPointInfo()
    if r3_51 then
      return r4_51, r5_51
    end
  else
    local r3_51 = UE4.UGameplayStatics.GetGameState(r0_51)
    local r4_51 = GWorld:GetAvatar()
    if r4_51 and r4_51:IsInHardBoss() then
      local r5_51 = r4_51.HardBossInfo.HardBossId
      if DataMgr.HardBossMain[r5_51] then
        local r7_51 = r3_51:GetTargetPoint(DataMgr.HardBossMain[r5_51].PosDisplayName)
        return r7_51:K2_GetActorLocation(), r7_51:K2_GetActorRotation()
      end
    end
  end
  return FVector(0, 0, 0), FRotator(0, 0, 0)
end
function r8_0.ProcessSettlementCharacter(r0_52)
  -- line: [822, 842] id: 52
  local r1_52 = UE4.UGameplayStatics.GetPlayerCharacter(r0_52, 0)
  r1_52:SetActorEnableCollision(true)
  if r0_52.SettlementCharacters ~= nil then
    for r5_52 = 1, #r0_52.SettlementCharacters, 1 do
      local r6_52 = r0_52.SettlementCharacters[r5_52]
      if r6_52 then
        r6_52:K2_DestroyActor()
      end
    end
    r0_52.SettlementCharacters = {}
  end
  for r7_52, r8_52 in pairs(r1_52:GetPhantomTeammates()) do
    if r8_52 ~= r1_52 then
      r8_52:SetActorHideTag("DungeonSettlement", false, false, true)
    end
  end
  -- close: r3_52
end
function r8_0.LoadGameEventSettlementUI(r0_53, r1_53, r2_53, r3_53)
  -- line: [844, 940] id: 53
  local r4_53 = GWorld:GetAvatar()
  if not r4_53 then
    DebugPrint("Error: DungeonSettlement: 找不到Avatar!")
    return 
  end
  local r5_53, r6_53, r7_53 = table.unpack(r3_53)
  local r8_53 = GWorld.GameInstance:GetGameUIManager()
  if r2_53 and r2_53 == "FeinaEvent" then
    local r9_53 = DataMgr.FeinaEventDungeon[r1_53]
    local r10_53 = 0
    local r11_53 = 0
    if r0_53.CombatData and r0_53.CombatData.CurScore then
      r10_53 = r0_53.CombatData.CurScore
    end
    if r0_53.CombatData and r0_53.CombatData.MaxScore then
      r11_53 = r0_53.CombatData.MaxScore
    end
    local r12_53 = {
      LevelScore = r10_53,
      IsWin = r5_53,
      Text_Title = "FeinaEvent_DungeonFinish_Title",
      Text_GetReward = "UI_Dungeon_First_Reward",
      ActivityId = r9_53.SettlementId,
      IsNewRecord = r11_53 < r10_53,
      DungeonId = r1_53,
    }
    local r13_53 = {}
    local r14_53 = {
      text = string.format(GText("FeinaEvent_DungeonTask_1"), r9_53.Level[1]),
      isFinish = r9_53.Level[1] <= r10_53,
    }
    local r15_53 = {
      text = string.format(GText("FeinaEvent_DungeonTask_1"), r9_53.Level[2]),
      isFinish = r9_53.Level[2] <= r10_53,
    }
    local r16_53 = {
      text = string.format(GText("FeinaEvent_DungeonTask_1"), r9_53.Level[3]),
      isFinish = r9_53.Level[3] <= r10_53,
    }
    -- setlist for #13 failed
    r12_53.ScoreInfo = r13_53
    r13_53 = false
    if r5_53 and r4_53.Dungeons[r1_53] and r4_53.Dungeons[r1_53].IsPass and r0_53.CombatData and r0_53.CombatData.NotPass then
      r12_53.RewardIds = {
        r9_53.PassReward
      }
      r13_53 = true
    end
    function r12_53.ContinueCallback()
      -- line: [894, 896] id: 54
      r4_53:EnterDungeon(r1_53)
    end
    r14_53 = r4_0.OpenActivitySettlement(r9_53.SettlementId, r1_53, r12_53)
    if r14_53 and not r13_53 then
      r14_53.Settlement_RewardItem:SetVisibility(ESlateVisibility.Collapsed)
    end
  elseif r2_53 and r2_53 == "Paotai" then
    local r9_53 = 0
    local r10_53 = 0
    local r11_53 = 0
    if r0_53.CombatData and r0_53.CombatData.CurScore then
      r9_53 = r0_53.CombatData.CurScore
    end
    if r0_53.CombatData and r0_53.CombatData.MaxScore then
      r10_53 = r0_53.CombatData.MaxScore
    end
    if r0_53.CombatData and r0_53.CombatData.CurStar then
      r11_53 = r0_53.CombatData.CurStar
    end
    local r12_53 = {
      LevelScore = r9_53,
      IsWin = r5_53,
      Text_Title = "FeinaEvent_DungeonFinish_Title",
      Text_GetReward = "FeinaEvent_DungeonFinish_Reward",
      ActivityId = DataMgr.PaotaiEventConstant.PaotaiGameEventId.ConstantValue,
      IsNewRecord = r10_53 < r9_53,
      DungeonId = r1_53,
      ScoreInfo = {},
    }
    local r13_53 = DataMgr.PaotaiMiniGame[r1_53].LeveDes
    for r17_53 = 1, #r13_53, 1 do
      local r18_53 = table.insert
      local r19_53 = r12_53.ScoreInfo
      local r20_53 = {
        text = string.format(GText(r13_53[r17_53]), DataMgr.PaotaiMiniGame[r1_53].Level[r17_53]),
        isFinish = r17_53 <= r11_53,
      }
      r18_53(r19_53, r20_53)
    end
    function r12_53.ContinueCallback()
      -- line: [933, 935] id: 55
      r4_53:EnterDungeon(r1_53)
    end
    r4_0.OpenActivitySettlement(DataMgr.PaotaiEventConstant.PaotaiGameEventId.ConstantValue, r1_53, r12_53)
  else
    r8_53:LoadUINew("DungeonSettlement", r3_53, r0_53.DungeonIdCache, r0_53.CombatData)
  end
end
function r8_0.CheckMaintenanceInfo(r0_56, r1_56, r2_56)
  -- line: [942, 947] id: 56
  r3_0:GetMaintenance(r1_56, function(r0_57)
    -- line: [944, 946] id: 57
    r0_56:GetMaintenanceCb(r1_56, r0_57, r2_56)
  end)
end
function r8_0.JumpToHomepage(r0_58, r1_58)
  -- line: [948, 1012] id: 58
  local function r2_58(r0_59, r1_59, r2_59)
    -- line: [949, 988] id: 59
    if not r2_59 then
      return false
    end
    if r0_59 == -1 and r1_59 == -1 then
      return true
    end
    if r2_59.medium then
      for r7_59, r8_59 in ipairs(r2_59.medium) do
        if r0_59 == tonumber(r8_59) then
          return true
        end
      end
      -- close: r3_59
    end
    if r2_59.channel_ids then
      local r3_59 = DataMgr.ChannelInfo[r0_59]
      local r4_59 = r3_59 and r3_59.Provider
      if r4_59 then
        for r9_59, r10_59 in ipairs(r2_59.channel_ids) do
          if r4_59 == r10_59 or r4_59 == r10_59.code then
            return true
          end
        end
        -- close: r5_59
      end
    end
    if r2_59.img_channel_id then
      local r3_59 = DataMgr.ImgChannelInfo[r1_59]
      local r4_59 = r3_59 and r3_59.Provider
      if r4_59 then
        for r9_59, r10_59 in ipairs(r2_59.img_channel_id) do
          if r4_59 == r10_59 or r4_59 == r10_59.code then
            return true
          end
        end
        -- close: r5_59
      end
    end
    return false
  end
  r3_0:GetMaintenanceInterceptUrl(r1_58, function(r0_60)
    -- line: [989, 1011] id: 60
    local r1_60 = nil
    if r0_60 and r0_60.mediumList then
      local r2_60 = Utils.HeroUSDKSubsystem():GetChannelId()
      local r3_60 = Utils.HeroUSDKSubsystem():GetMirrorChannelId()
      for r8_60, r9_60 in ipairs(r0_60.mediumList) do
        if r2_58(r2_60, r3_60, r9_60) then
          r1_60 = r9_60.content and r9_60.content[1] and r9_60.content[1].url
          local r10_60 = r0_0:Get("SystemLanguage")
          for r15_60, r16_60 in ipairs(r9_60.content) do
            if r16_60.language and r16_60.language.code == r10_60 then
              r1_60 = r16_60.url
              break
            end
          end
          -- close: r11_60
          break
        end
      end
      -- close: r4_60
    end
    if r1_60 then
      UE4.UKismetSystemLibrary.LaunchURL(r1_60)
    end
  end)
end
function r8_0.GetMaintenanceCb(r0_61, r1_61, r2_61, r3_61)
  -- line: [1014, 1059] id: 61
  local r4_61 = true
  local r5_61 = false
  if r2_61 then
    local r6_61 = r1_0.NowTime()
    for r11_61, r12_61 in pairs(r2_61) do
      if r12_61.Content and #r12_61.Content > 0 and r12_61.StartTimestamp < r6_61 and r6_61 < r12_61.EndTimestamp then
        local r13_61 = nil
        local r14_61 = r0_0:Get("SystemLanguage")
        for r19_61, r20_61 in ipairs(r12_61.Content) do
          if r20_61.language == r14_61 then
            r13_61 = r20_61
            break
          end
        end
        -- close: r15_61
        if r13_61 then
          r4_61 = false
          UIManager(r0_61):ShowCommonPopupUI(100205, {
            ShortText = r13_61.body,
            RightCallbackFunction = function()
              -- line: [1036, 1038] id: 62
              r0_61:JumpToHomepage(r1_61)
            end,
          })
          r5_61 = true
          break
        end
      end
    end
    -- close: r7_61
  end
  if r3_61 then
    r3_61(r4_61, r5_61)
  end
end
function r8_0.SetProgressData(r0_63, r1_63, r2_63)
  -- line: [1061, 1064] id: 63
  r0_63.InterruptProgressData = r1_63
  r0_63.PlayerSliceData = r2_63
end
function r8_0.GetProgressData(r0_64)
  -- line: [1066, 1068] id: 64
  return r0_64.InterruptProgressData
end
function r8_0.GetPlayerSliceData(r0_65)
  -- line: [1070, 1072] id: 65
  return r0_65.PlayerSliceData
end
function r8_0.ClearProgressData(r0_66)
  -- line: [1074, 1076] id: 66
  r0_66.InterruptProgressData = nil
end
function r8_0.ClearPlayerSliceData(r0_67)
  -- line: [1078, 1080] id: 67
  r0_67.PlayerSliceData = nil
end
function r8_0.SetExitDungeonData(r0_68, r1_68)
  -- line: [1083, 1085] id: 68
  r0_68.ExitDungeonData = r1_68
end
function r8_0.GetExitDungeonData(r0_69)
  -- line: [1087, 1089] id: 69
  return r0_69.ExitDungeonData
end
function r8_0.ClearExitDungeonData(r0_70)
  -- line: [1091, 1093] id: 70
  r0_70.ExitDungeonData = nil
end
function r8_0.LoadLogoAtEndOfPrologue(r0_71)
  -- line: [1096, 1110] id: 71
  local r2_71 = GWorld.GameInstance:GetGameUIManager():LoadUI(UIConst.PROLOGUEENDLOGO, "PrologueEndLogo", UIConst.ZORDER_ABOVE_ALL)
  if r2_71 ~= nil then
    r2_71:Show("Talk")
  end
  r0_71.LogoLanguageMap = {
    TextMapContent = "CN_In",
    ContentEN = "EN_In",
    ContentJP = "JP_In",
    ContentKR = "KR_In",
    ContentTC = "TC_In",
  }
end
function r8_0.UnLoadLogoAtEndOfPrologue(r0_72)
  -- line: [1111, 1115] id: 72
  GWorld.GameInstance:GetGameUIManager():GetUIObj("PrologueEndLogo"):Close()
end
function r8_0.ShowLogoAtEndOfPrologue(r0_73)
  -- line: [1117, 1123] id: 73
  local r2_73 = GWorld.GameInstance:GetGameUIManager():GetUIObj("PrologueEndLogo")
  r2_73:PlayAnimation(r2_73[r0_73.LogoLanguageMap[CommonConst.SystemLanguage] and r0_73.LogoLanguageMap[CommonConst.SystemLanguages.Default]])
end
function r8_0.ShowWhiteAtEndOfPrologue(r0_74)
  -- line: [1124, 1128] id: 74
  local r2_74 = GWorld.GameInstance:GetGameUIManager():GetUIObj("PrologueEndLogo")
  r2_74:PlayAnimation(r2_74.Static_Img_BottomMask_In)
end
function r8_0.ShowBlackAtEndOfPrologue(r0_75)
  -- line: [1129, 1133] id: 75
  local r2_75 = GWorld.GameInstance:GetGameUIManager():GetUIObj("PrologueEndLogo")
  r2_75:PlayAnimation(r2_75.Black_In)
end
function r8_0.HideLogoAtEndOfPrologue(r0_76)
  -- line: [1135, 1139] id: 76
  local r2_76 = GWorld.GameInstance:GetGameUIManager():GetUIObj("PrologueEndLogo")
  r2_76:PlayAnimation(r2_76.Logo_Out)
end
function r8_0.HideBlackAtEndOfPrologue(r0_77)
  -- line: [1140, 1144] id: 77
  local r2_77 = GWorld.GameInstance:GetGameUIManager():GetUIObj("PrologueEndLogo")
  r2_77:PlayAnimation(r2_77.Black_Out)
end
function r8_0.PrologueLogoSetFirstDialog(r0_78)
  -- line: [1146, 1153] id: 78
  local r2_78 = GWorld.GameInstance:GetGameUIManager():GetUIObj("PrologueEndLogo")
  r2_78.Text_ChapterDesc:SetText(GText("UI_LOGO_DIALOGUE_10018201"))
  r2_78.Text_WorldDesc:SetText(GText("UI_LOGO_DIALOGUE_10018201_WORLD"))
  r2_78:PlayAnimation(r2_78.Text_In)
end
function r8_0.PrologueLogoUnSetFirstDialog(r0_79)
  -- line: [1154, 1158] id: 79
  local r2_79 = GWorld.GameInstance:GetGameUIManager():GetUIObj("PrologueEndLogo")
  r2_79:PlayAnimation(r2_79.Text_Out)
end
function r8_0.PrologueLogoSetSecondDialog(r0_80)
  -- line: [1160, 1167] id: 80
  local r2_80 = GWorld.GameInstance:GetGameUIManager():GetUIObj("PrologueEndLogo")
  r2_80.Text_ChapterDesc:SetText(GText("UI_LOGO_DIALOGUE_10018202"))
  r2_80.Text_WorldDesc:SetText(GText("UI_LOGO_DIALOGUE_10018202_WORLD"))
  r2_80:PlayAnimation(r2_80.Text_In)
end
function r8_0.PrologueLogoUnSetSecondDialog(r0_81)
  -- line: [1168, 1172] id: 81
  local r2_81 = GWorld.GameInstance:GetGameUIManager():GetUIObj("PrologueEndLogo")
  r2_81:PlayAnimation(r2_81.Text_Out)
end
function r8_0.OnGlobalGameUITagChanged(r0_82, r1_82, r2_82)
  -- line: [1175, 1183] id: 82
  DebugPrint("LHQ_OnGlobalGameUITagChanged: start")
  if r2_82 == "" then
    r0_82:TriggerAllNpcPauseAndHide("None")
  else
    r0_82:TriggerAllNpcPauseAndHide(r2_82)
  end
  DebugPrint("LHQ_OnGlobalGameUITagChanged: end")
end
function r8_0.TriggerAllNpcPauseAndHide(r0_83, r1_83)
  -- line: [1185, 1262] id: 83
  DebugPrint("LHQ_OnGlobalGameUITagChanged_HideNpc: start")
  local function r2_83(r0_84)
    -- line: [1187, 1198] id: 84
    if r0_84.FXComponent then
      r0_84:SetTickableWhenPaused(true)
    end
    if r0_84.FXComponent then
      r0_84.FXComponent:PlayEffectByIDParams(302, {
        bTickEvenWhenPaused = true,
        NotAttached = true,
      })
    else
      local r1_84 = UE4.UGameplayStatics.GetPlayerCharacter(r0_83, 0)
      local r2_84 = r0_84:K2_GetActorLocation()
      r1_84.FXComponent:PlayEffectByIDParams(302, {
        UseAbsoluteLocation = true,
        Location = {
          r2_84.X,
          r2_84.Y,
          r2_84.Z
        },
        bTickEvenWhenPaused = true,
      })
    end
  end
  local r3_83 = UE4.UGameplayStatics.GetGameMode(r0_83)
  local r4_83 = UE4.UGameplayStatics.GetGameInstance(r0_83)
  if not r3_83 or not r4_83 then
    return 
  end
  local r5_83 = UE4.UGameplayStatics.GetGameState(r0_83)
  for r11_83, r12_83 in pairs(r5_83.NpcCharacterMap:ToTable()) do
    local r13_83 = DataMgr.Npc[r12_83.UnitId]
    if r13_83 ~= nil then
      if r13_83.GlobalGameUITagList ~= nil then
        for r18_83, r19_83 in pairs(r13_83.GlobalGameUITagList) do
          if r19_83 == r1_83 then
            r12_83:TriggerNpcGlobalTimeDilation(true)
            r12_83:SetActorHideTag("GlobalTimeDilation", false, false, true)
          end
        end
        -- close: r14_83
        if (not r12_83.HideTags or r12_83.HideTags:Num() == 0) and r1_83 ~= "None" then
          r12_83:TriggerNpcGlobalTimeDilation(true)
          r2_83(r12_83)
        end
        r12_83:SetActorHideTag("GlobalTimeDilation", true, false, true)
      else
        goto label_59	-- block#11 is visited secondly
      end
      -- close: r14_83
      if r1_83 == "None" then
        r12_83:SetActorHideTag("GlobalTimeDilation", false, false, true)
      end
    end
    local r14_83 = r12_83:GetName()
    if r12_83.bHidden then
      DebugPrint("LHQ_OnGlobalGameUITagChanged_HideNpc: " .. r1_83 .. " Npc: " .. r14_83 .. " IsHidden: " .. "true")
    else
      DebugPrint("LHQ_OnGlobalGameUITagChanged_HideNpc: " .. r1_83 .. " Npc: " .. r14_83 .. " IsHidden: " .. "false")
    end
  end
  -- close: r7_83
  for r12_83, r13_83 in pairs(r5_83.CustomNpcSet:ToTable()) do
    if (not r13_83.HideTags or r13_83.HideTags:Num() == 0) and r1_83 ~= "None" then
      r2_83(r13_83)
    end
    r13_83:SetCustomNpcHideTag("GlobalTimeDilation", true)
    if r1_83 == "None" then
      r13_83:SetCustomNpcHideTag("GlobalTimeDilation", false)
    end
    local r14_83 = r13_83:GetName()
    if r13_83.bHidden then
      DebugPrint("LHQ_OnGlobalGameUITagChanged_HideNpc: " .. r1_83 .. " Npc: " .. r14_83 .. " IsHidden: " .. "true")
    else
      DebugPrint("LHQ_OnGlobalGameUITagChanged_HideNpc: " .. r1_83 .. " Npc: " .. r14_83 .. " IsHidden: " .. "false")
    end
  end
  -- close: r8_83
  DebugPrint("LHQ_OnGlobalGameUITagChanged_HideNpc: end")
end
function r8_0.OnGameInputMethodChanged(r0_85, r1_85, r2_85)
  -- line: [1264, 1267] id: 85
  r0_85.CurInputDeviceType = r1_85
  r0_85.CurInputDeviceName = r2_85
end
function r8_0.BindGamepadEvent(r0_86)
  -- line: [1269, 1278] id: 86
  if r0_86.CurInputDeviceType ~= nil then
    return 
  end
  local r1_86 = r0_86:GetGameUIManager():GetGameInputModeSubsystem(r0_86)
  if r1_86 then
    r0_86.CurInputDeviceType = r1_86:GetCurrentInputType()
    r0_86.CurInputDeviceName = r1_86:GetCurrentGamepadName()
    r1_86.OnInputMethodChanged:Add(r0_86, r0_86.OnGameInputMethodChanged)
    r1_86.OnInputMethodChanged:Add(r0_86, r0_86.SendInputDiviceChangeMessage)
  end
end
function r8_0.UnBindGamepadEvent(r0_87)
  -- line: [1280, 1289] id: 87
  if r0_87.CurInputDeviceType == nil then
    return 
  end
  local r1_87 = r0_87:GetGameUIManager():GetGameInputModeSubsystem(r0_87)
  if r1_87 then
    r1_87.OnInputMethodChanged:Remove(r0_87, r0_87.OnGameInputMethodChanged)
    r1_87.OnInputMethodChanged:Remove(r0_87, r0_87.SendInputDiviceChangeMessage)
  end
  r0_87.CurInputDeviceType = nil
  r0_87.CurInputDeviceName = nil
end
function r8_0.ReceiveInit(r0_88)
  -- line: [1291, 1347] id: 88
  GWorld.GameInstance = r0_88
  if IsDedicatedServer(r0_88) then
    return 
  end
  r2_0._Init()
  function r0_88.OnApplicationWillEnterBackground(r0_89)
    -- line: [1309, 1313] id: 89
    EventManager:FireEvent(EventID.ApplicationWillEnterBackground)
    r0_0:SaveAll(false)
  end
  r0_88.ApplicationWillEnterBackgroundDelegate:Add(r0_88, r0_88.OnApplicationWillEnterBackground)
  function r0_88.OnApplicationHasEnteredForeground(r0_90)
    -- line: [1315, 1317] id: 90
    EventManager:FireEvent(EventID.ApplicationHasEnteredForeground)
  end
  r0_88.ApplicationHasEnteredForegroundDelegate:Add(r0_88, r0_88.OnApplicationHasEnteredForeground)
  function r0_88.OnApplicationWillDeactivate(r0_91)
    -- line: [1321, 1325] id: 91
    EventManager:FireEvent(EventID.ApplicationWillDeactivate)
    r0_0:SaveAll(false)
  end
  r0_88.ApplicationWillDeactivateDelegate:Add(r0_88, r0_88.OnApplicationWillDeactivate)
  function r0_88.OnApplicationHasReactivated(r0_92)
    -- line: [1327, 1329] id: 92
    EventManager:FireEvent(EventID.ApplicationHasReactivated)
  end
  r0_88.ApplicationHasReactivatedDelegate:Add(r0_88, r0_88.OnApplicationHasReactivated)
  local r1_88 = r0_0:Get("TeammateEffects")
  if r1_88 then
    UEMGameInstance.SetFriendFXQuality(r1_88)
  else
    local r2_88 = r0_88.GetGameplayScalabilityLevel()
    local r3_88 = UEMGameInstance.SetFriendFXQuality
    local r4_88 = nil	-- notice: implicit variable refs by block#[7]
    if r2_88 <= 1 then
      r4_88 = 0
      if not r4_88 then
        ::label_58::
        r4_88 = 1
      end
    else
      goto label_58	-- block#6 is visited secondly
    end
    r3_88(r4_88)
  end
  r0_88.CacheShowRewardUIParams = {}
  r0_88.ScriptDetectionCheckRecordNum = 0
  EventManager:AddEvent(EventID.TalkHiddenGameUI, r0_88, r0_88.OnTalkHiddenGameUIChange)
  EventManager:AddEvent(EventID.ConditionComplete, r0_88, r0_88.OnConditionComplete)
end
function r8_0.OnApplicationWillTerminate(r0_93)
  -- line: [1350, 1354] id: 93
  r0_93.ApplicationWillTerminateDelegate:Clear()
  r0_0:SaveAll(false)
end
function r8_0.ReceiveShutdown(r0_94)
  -- line: [1357, 1393] id: 94
  if IsDedicatedServer(r0_94) then
    return 
  end
  r0_0:Set("ShundownCount", (r0_0:Get("ShundownCount") and 0) + 1)
  local r1_94 = r0_0:Get("ShundownCount") and 0
  r2_0._Close()
  r0_0:SaveAll(true)
  if Const.bNullNetWorkMgr then
    r0_94.NetworkManager = nil
  end
  if not URuntimeCommonFunctionLibrary.IsPlayInEditor(r0_94) and UE4.UUIFunctionLibrary.GetDevicePlatformName(r0_94) == "Windows" and r1_94 > 3 then
    UEMGameInstance.ForceQuitGame()
  end
end
function r8_0.InitGameSetting(r0_95)
  -- line: [1396, 1403] id: 95
  r6_0.InitPerformanceSetting()
  r0_95:InitGameSystemLanguage()
  r0_95:InitGameSystemVoice()
  r0_95:InitGameInterfaceMode()
  r0_95:InitGameMuteBackstage()
  r0_95:InitHideBackWeapons()
end
function r8_0.InitGameSystemLanguage(r0_96)
  -- line: [1405, 1473] id: 96
  local r1_96 = r0_0:Get("SystemLanguage")
  if r1_96 ~= nil then
    CommonConst.SystemLanguage = CommonConst.SystemLanguages[r1_96]
    r0_96.SystemLanguage = r7_0[CommonConst.SystemLanguage]
  else
    if UE.AHotUpdateGameMode.IsGlobalPak() then
      local r3_96 = {
        zh = "CN",
        en = "EN",
        ko = "KR",
        ja = "JP",
      }
      local r4_96 = {
        cn = "CN",
        hk = "TC",
        tw = "TC",
        mo = "TC",
      }
      local r5_96 = {
        CN = "CN",
        TC = "CN",
        EN = "EN",
        KR = "KR",
        JP = "JP",
      }
      local r6_96 = UE4.UKismetSystemLibrary.GetDefaultLanguage()
      local r8_96 = r3_96[string.lower(string.sub(r6_96, 1, 2))] and "EN"
      if r8_96 == "CN" then
        local r9_96 = string.lower(r6_96)
        for r14_96, r15_96 in pairs(r4_96) do
          if string.find(r9_96, r14_96) then
            r8_96 = r15_96
            break
          end
        end
        -- close: r10_96
      end
      CommonConst.SystemLanguage = CommonConst.SystemLanguages[r8_96]
      r0_96.SystemLanguage = r7_0[CommonConst.SystemLanguage]
      local r9_96 = r5_96[r8_96] and "EN"
      CommonConst.SystemVoice = r9_96
      r0_0:Set("SystemVoice", r9_96)
      r0_0:Set("SystemLanguage", r8_96)
    else
      CommonConst.SystemLanguage = CommonConst.SystemLanguages.CN
      r0_0:Set("SystemLanguage", "CN")
      CommonConst.SystemVoice = CommonConst.SystemVoices.CN
      r0_0:Set("SystemVoice", "CN")
    end
    r0_96:OnSystemLanguageChanged()
  end
  if not UE4.URuntimeCommonFunctionLibrary.IsPlayInEditor(r0_96) then
    r0_96:SetCurrentLanguage()
  end
  r0_96:SetUsdkLanguage()
  require("BluePrints.UI.WBP.Announcement.AnnounceUtils"):Init()
end
function r8_0.SetCurrentLanguage(r0_97)
  -- line: [1476, 1487] id: 97
  UE4.UKismetInternationalizationLibrary.SetCurrentLanguage(({
    CN = "en",
    EN = "en",
    KR = "ko",
    JP = "ja",
    TC = "zh-Hant-tw",
  })[r0_0:Get("SystemLanguage")] and "en", true)
end
function r8_0.SetUsdkLanguage(r0_98)
  -- line: [1489, 1500] id: 98
  r0_98:InitUsdkLanguage(EHeroUsdkLanguageFlag[({
    CN = "HeroLanguageZhHans",
    TC = "HeroLanguageZhHant",
    EN = "HeroLanguageEn",
    JP = "HeroLanguageJa",
    KR = "HeroLanguageKo",
  })[r0_0:Get("SystemLanguage")]])
end
function r8_0.InitGameSystemVoice(r0_99)
  -- line: [1502, 1516] id: 99
  if IsDedicatedServer(r0_99) then
    return 
  end
  local r1_99 = r0_0:Get("SystemVoice")
  if r1_99 ~= nil then
    CommonConst.SystemVoice = r1_99
  end
  r0_99:AddDelayFrameFunc(function()
    -- line: [1511, 1513] id: 100
    AudioManager(r0_99):RecoverSavedData()
  end, 1)
  r0_99:OnSystemVoiceLanguageChanged()
end
function r8_0.InitGameInterfaceMode(r0_101)
  -- line: [1519, 1552] id: 101
  if UE4.URuntimeCommonFunctionLibrary.IsPlayInEditor(r0_101) then
    return 
  end
  if UE4.UUCloudGameInstanceSubsystem and UE4.UUCloudGameInstanceSubsystem.IsCloudGame(r0_101) then
    return 
  end
  local r2_101 = "InterfaceMode"
  local r3_101 = "InterfaceModeCacheName"
  if r0_0:Get(r3_101) == nil then
    local r5_101 = r0_101:GetSceneManager()
    if r5_101 == nil then
      return 
    end
    local r6_101 = {
      [1] = EWindowMode.Fullscreen,
      [2] = EWindowMode.Windowed,
      [3] = EWindowMode.WindowedFullscreen,
    }
    local r7_101 = DataMgr.Option[r2_101]
    local r8_101 = EWindowMode.WindowedFullscreen
    if r7_101 then
      r8_101 = r6_101[tonumber(r7_101.DefaultValue)]
      if CommonUtils.GetDeviceTypeByPlatformName(r0_101) == "Mobile" and r7_101.DefaultValueM then
        r8_101 = r6_101[tonumber(r7_101.DefaultValueM)]
      end
    end
    r5_101:ResizeWindow(r8_101)
    r0_0:Set(r3_101, r8_101)
    DebugPrint("初始化显示模式 包体首次登陆时设置成无边框窗口化 InitGameInterfaceMode DefaultMode:" .. r8_101)
  end
end
function r8_0.InitGameMuteBackstage(r0_102)
  -- line: [1555, 1572] id: 102
  local r1_102 = "MuteBackstage"
  local r2_102 = r0_0:Get(r1_102)
  if r2_102 == nil then
    r2_102 = DataMgr.Option[r1_102].DefaultValue == "True"
    r0_0:Set(r1_102, r2_102)
  end
  if r2_102 then
    AudioManager(r0_102):BindLogicToWindowActivatedDeactivated()
  else
    AudioManager(r0_102):UnBindLogicToWindowActivatedDeactivated()
  end
end
function r8_0.InitHideBackWeapons(r0_103)
  -- line: [1575, 1591] id: 103
  local r1_103 = "HideBackWeapons"
  local r2_103 = r0_0:Get(r1_103)
  if r2_103 == nil then
    r2_103 = DataMgr.Option[r1_103].DefaultValue == "True"
    r0_0:Set(r1_103, r2_103)
  end
  if not AWeaponBase or not AWeaponBase.SetWeaponBackTimerEnabled then
    return 
  end
  AWeaponBase.SetWeaponBackTimerEnabled(r0_103, r2_103)
end
function r8_0.UploadLuaCallError(r0_104, r1_104)
  -- line: [1593, 1673] id: 104
  if not GWorld then
    return 
  end
  local r2_104 = GWorld:GetAvatar()
  if not r2_104 then
    return 
  end
  local r3_104 = UGameplayStatics.GetPlayerCharacter(r0_104, 0)
  local function r4_104()
    -- line: [1603, 1654] id: 105
    if not r3_104 then
      return ""
    end
    local r0_105 = UE4.UGameplayStatics.GetGameState(r0_104)
    if not r0_105 then
      return ""
    end
    if r0_105:IsInDungeon() then
      local r1_105 = UE4.URuntimeCommonFunctionLibrary.GetLevelLoadJsonName(r3_104)
      local function r2_105(r0_106)
        -- line: [1613, 1620] id: 106
        return require("rapidjson").decode(UE4.URuntimeCommonFunctionLibrary.LoadFile(UE4.UKismetSystemLibrary.GetProjectContentDirectory() .. "Script/Datas/Houdini_data/" .. r0_106 .. ".json"))
      end
      local r3_105 = r3_104.CurrentLevelId
      if not r3_105 then
        return ""
      end
      local r4_105 = string.format("当前玩家进的拼接关卡: %s", r1_105)
      for r10_105, r11_105 in pairs(r2_105(r1_105).points) do
        for r15_105 = 1, r3_105:Length(), 1 do
          local r16_105 = r3_105:Get(r15_105)
          if tostring(r11_105.id) == r16_105 then
            local r17_105 = r11_105.art_path
            if r17_105 == "" then
              r17_105 = string.gsub(r11_105.struct, "Data_Design", "Data_Art", 1)
            end
            r4_105 = r4_105 .. string.format("，所在的美术关卡是: %s， 关卡id是： %s", r17_105, r16_105)
          end
        end
      end
      -- close: r6_105
      return r4_105
    elseif r2_104:IsInBigWorld() then
      if not r3_104 then
        return ""
      end
      local r1_105 = UE4.UGameplayStatics.GetGameMode(r0_104)
      if not r1_105 then
        return ""
      end
      local r2_105 = r1_105:GetWCSubSystem()
      if r2_105 then
        return r2_105:GetLocationLevelName(r3_104:K2_GetActorLocation())
      end
    end
    return ""
  end
  local r5_104 = "Error"
  pcall(function()
    -- line: [1657, 1657] id: 107
    r5_104 = r4_104()
  end)
  local r6_104 = tostring(WorldTravelSubsystem():GetCurrentSceneId())
  local r7_104 = nil	-- notice: implicit variable refs by block#[7, 8]
  if r3_104 then
    r7_104 = tostring(r3_104:K2_GetActorLocation())
    if not r7_104 then
      ::label_34::
      r7_104 = " "
    end
  else
    goto label_34	-- block#6 is visited secondly
  end
  r2_104:ReportClientTrace("Uid:" .. tostring(r2_104.Uid) .. "\n" .. "SceneId:" .. r6_104 .. "\n" .. "SceneName:" .. tostring(r5_104) .. "\n" .. "PlayerLocation:" .. r7_104 .. "\n" .. r1_104)
  local r9_104 = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UEMSentrySubsystem)
  if r9_104 then
    r9_104:ReportLuaTrace(r1_104, {
      SceneId = r6_104,
      SceneName = tostring(r5_104),
      Location = r7_104,
    })
  end
end
function r8_0.GetDeviceTypeByPlatformName(r0_108)
  -- line: [1675, 1677] id: 108
  return CommonUtils:GetDeviceTypeByPlatformName()
end
function r8_0.SimulateMovementDebugPlatform(r0_109)
  -- line: [1679, 1690] id: 109
  if Const.SimulateMovementDebugPlatform == "Android" or Const.SimulateMovementDebugPlatform == "Windows" or Const.SimulateMovementDebugPlatform == "IOS" or Const.SimulateMovementDebugPlatform == "Mac" then
    return Const.SimulateMovementDebugPlatform
  end
  return UE4.UUIFunctionLibrary.GetDevicePlatformName(r0_109)
end
function r8_0.DisableLuaMemoryMonitorFromCPP(r0_110)
  -- line: [1692, 1694] id: 110
  LuaMemoryManager:DisableLuaMemoryMonitor()
end
function r8_0.RequestShowPopup(r0_111, r1_111, r2_111, r3_111)
  -- line: [1696, 1727] id: 111
  if not r0_111.RequestPopupQueue then
    r0_111.RequestPopupQueue = {}
  end
  table.insert(r0_111.RequestPopupQueue, {
    PopupId = r1_111,
    Params = r2_111,
    ParentWidget = r3_111,
  })
  local function r4_111()
    -- line: [1707, 1722] id: 112
    DebugPrint("Tianyi@ Try to show popup")
    if not r0_111.RequestPopupQueue then
      r0_111:RemoveTimer(r0_111.RequestShowPopupTimer)
    end
    if r0_111:CheckCanShowPopup() then
      DebugPrint("Tianyi@ TryShowPopup")
      r0_111:RemoveTimer(r0_111.RequestShowPopupTimer)
      local r0_112 = GWorld.GameInstance:GetGameUIManager()
      for r5_112, r6_112 in ipairs(r0_111.RequestPopupQueue) do
        r0_112:ShowCommonPopupUI(r6_112.PopupId, r6_112.Params, r6_112.ParentWidget)
      end
      -- close: r1_112
      r0_111.RequestPopupQueue = nil
    end
  end
  if not r0_111.RequestShowPopupTimer then
    r0_111.RequestShowPopupTimer = r0_111:AddTimer(0.2, r4_111, true)
  end
end
function r8_0.CheckCanShowPopup(r0_113)
  -- line: [1730, 1734] id: 113
  if r0_113:GetLoadingUI() then
    return false
  end
  return true
end
function r8_0.OnTalkHiddenGameUIChange(r0_114)
  -- line: [1736, 1750] id: 114
  local r1_114 = GWorld:GetAvatar()
  if not r1_114 or not r1_114:IsInBigWorld() then
    return 
  end
  UE4.UKismetSystemLibrary.K2_SetTimerDelegate({
    r0_114,
    function()
      -- line: [1742, 1749] id: 115
      local r0_115 = r0_114:GetTalkContext()
      if not IsValid(r0_115) or r0_115:HasHiddenGameUI() then
        return 
      end
      for r5_115, r6_115 in pairs(r0_114.CacheShowRewardUIParams) do
        UIUtils.ShowDungeonRewardUI(table.unpack(r6_115))
      end
      -- close: r1_115
      r0_114.CacheShowRewardUIParams = {}
    end
  }, 0.01, false, 0)
end
function r8_0.OnConditionComplete(r0_116, r1_116)
  -- line: [1752, 1789] id: 116
  if DataMgr.ConditionId2ModArchiveId and DataMgr.ConditionId2ModArchiveId[r1_116] then
    for r6_116, r7_116 in pairs(DataMgr.ConditionId2ModArchiveId[r1_116]) do
      if r7_116 then
        local r8_116 = DataMgr.ModGuideBookArchive[r7_116]
        if r8_116 then
          local r9_116 = #r8_116.ModList
          local r10_116 = DataMgr.ModGuideBookArchiveTab[r8_116.TabId].ReddotNode
          if not r2_0.GetTreeNode("ModArchive") then
            r2_0.AddNodeEx("ModArchive")
          end
          local r11_116 = r2_0.GetLeafNodeCacheDetail(r10_116) and {}
          if not r11_116.NewNum then
            r11_116.NewNum = 0
          end
          if not r11_116.States then
            r11_116.States = {}
          end
          for r15_116 = 1, #r8_116.ModList, 1 do
            local r16_116 = r8_116.ModList[r15_116]
            if not r11_116.States[r16_116] then
              r11_116.States[r16_116] = true
            else
              r9_116 = r9_116 + -1
            end
          end
          r11_116.NewNum = r11_116.NewNum + r9_116
          r2_0.IncreaseLeafNodeCount(r10_116, r9_116, r11_116)
        end
      end
    end
    -- close: r2_116
  end
end
function r8_0.CloseLoadingUI(r0_117)
  -- line: [1791, 1795] id: 117
  UKismetSystemLibrary.ExecuteConsoleCommand(r0_117, "r.Shadow.ForceCacheUpdate 1", nil)
  r0_117.Overridden.CloseLoadingUI(r0_117)
end
function r8_0.SpawnOtherRole(r0_118, r1_118, r2_118, r3_118)
  -- line: [1796, 1899] id: 118
  local function r4_118(r0_119, r1_119)
    -- line: [1797, 1884] id: 119
    local r2_119 = GWorld:GetAvatar()
    if r2_119 and r2_119.OtherRoleInfo[r1_118].BornState == Const.ShouldDetory then
      r2_119.OtherRoleInfo[r1_118] = nil
      return 
    end
    local r6_119 = r0_119:GetWorld():SpawnActor(r1_119, FTransform(FRotator(r3_118.Rotation.Pitch, r3_118.Rotation.Yaw, r3_118.Rotation.Roll):ToQuat(), FVector(r3_118.Location.X, r3_118.Location.Y, r3_118.Location.Z)), UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn)
    r6_119.FromOtherWorld = true
    if r6_119 and r6_119:GetMovementComponent() and r6_119:GetMovementComponent().EnableSmoothStep then
      r6_119:GetMovementComponent().EnableSmoothStep = false
    end
    local r7_119 = {}
    local r8_119 = UE4.UGameplayStatics.GetGameMode(r0_119)
    r7_119.RoleId = r2_118.CharId
    r7_119.SkinId = r2_118.SkinId
    r7_119.FromOtherWorld = true
    r7_119.AppearanceSuit = r2_118.AppearanceSuit
    r7_119.RegionWeaponInfo = r2_118.RegionWeaponInfo
    r7_119.ShowWeapon = r2_118.ShowWeapon
    if r0_119.RandomClientRegionPlayerRoleId then
      local r9_119 = {
        1101,
        1103,
        1501,
        1502,
        1801,
        2101,
        2301,
        3101,
        3103,
        3201,
        3301,
        4101,
        4202,
        4301,
        5101,
        5102,
        5301,
        5401
      }
      local r10_119 = r9_119[math.random(1, #r9_119)]
      r7_119.RoleId = r10_119
      r7_119.SkinId = r10_119
      r7_119.AppearanceSuit.SkinId = r10_119
      r2_118.CharId = r10_119
      r2_118.SkinId = r10_119
      r2_118.AppearanceSuit.SkinId = r10_119
    end
    function r7_119.LoadFinishCallback(r0_120)
      -- line: [1852, 1879] id: 120
      print(_G.LogTag, "CharacterRead", r0_120:K2_GetActorLocation(), r0_120:K2_GetActorRotation())
      local r1_120 = GWorld:GetAvatar()
      if r1_120 then
        if r1_120.OtherRoleInfo[r1_118].BornState == Const.ShouldDetory and r0_120 then
          r0_120:K2_DestroyActor()
          r1_120.OtherRoleInfo[r1_118] = nil
          return 
        end
        r1_120.OtherRoleInfo[r1_118].BornState = Const.Bonred
        r1_120.OtherRoleInfo[r1_118].CharEid = r0_120.Eid
      end
      r0_120:AddInteractiveComponent()
      if r0_120.RegionInterComp then
        r0_120.RegionInterComp:InitRegionInfo(r0_120.Eid, r1_118)
      end
      if r0_120.RegionInterAddFriendComp then
        r0_120.RegionInterAddFriendComp:InitRegionInfo(r0_120.Eid, r1_118)
      end
      if r0_120.RegionInterInviteTeamComp then
        r0_120.RegionInterInviteTeamComp:InitRegionInfo(r0_120.Eid, r1_118)
      end
      if r0_120.RegionInterPersonInfoComp then
        r0_120.RegionInterPersonInfoComp:InitRegionInfo(r0_120.Eid, r1_118)
      end
      EventManager:FireEvent(EventID.OnlineAddOtherPlayer, r6_119.Eid, r2_118.Uid, r0_120, r1_118)
    end
    r6_119:InitCharacterInfoForRegionPlayer(r7_119)
    EventManager:FireEvent(EventID.AddRegionIndicatorInfo, r6_119.Eid, r2_118.Uid, r6_119:K2_GetActorLocation(), r1_118)
    r6_119:RegisterOtherWorldPlayerCharacterToSubSystem()
  end
  if not r0_118.bRegionClientOnlyShowUI then
    UE4.UResourceLibrary.LoadClassAsync(r0_118, "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C", {
      r0_118,
      r4_118
    })
  else
    local r5_118 = r0_118:AddPlayerHeadUI(FVector(r3_118.Location.X, r3_118.Location.Y, r3_118.Location.Z))
    local r6_118 = GWorld:GetAvatar()
    if r5_118 > 0 and r6_118 then
      r6_118.OtherRoleInfo[r1_118].BornState = Const.Bonred
      r6_118.OtherRoleInfo[r1_118].CharEid = r5_118
      EventManager:FireEvent(EventID.AddRegionIndicatorInfo, r5_118, r2_118.Uid, FVector(r3_118.Location.X, r3_118.Location.Y, r3_118.Location.Z), r1_118)
      EventManager:FireEvent(EventID.OnlineAddOtherPlayer, r5_118, r2_118.Uid, nil, r1_118)
    end
  end
end
function r8_0.CreatePlayerCharacterWhileOnlyShowUI(r0_121, r1_121, r2_121)
  -- line: [1901, 1988] id: 121
  local r3_121 = GWorld:GetAvatar()
  if r1_121 <= 0 or not r3_121 then
    return 
  end
  local r4_121 = {}
  local r5_121 = {}
  local r6_121 = nil
  for r11_121, r12_121 in pairs(r3_121.OtherRoleInfo and {}) do
    if r12_121.CharEid == r1_121 then
      r6_121 = r11_121
      r4_121 = r12_121
      break
    end
  end
  -- close: r7_121
  if not r6_121 then
    return 
  end
  local r8_121 = r0_121:GetWorld():SpawnActor(LoadClass("/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C"), r2_121, UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn)
  if not r8_121 then
    return 
  end
  r8_121.FromOtherWorld = true
  r5_121.RoleId = r4_121.CharId
  r5_121.SkinId = r4_121.SkinId
  r5_121.FromOtherWorld = true
  r5_121.AppearanceSuit = r4_121.AppearanceSuit
  r5_121.Eid = r1_121
  if r0_121.RandomClientRegionPlayerRoleId then
    local r9_121 = {
      1101,
      1103,
      1501,
      1502,
      1801,
      2101,
      2301,
      3101,
      3103,
      3201,
      3301,
      4101,
      4202,
      4301,
      5101,
      5102,
      5301,
      5401
    }
    local r10_121 = r9_121[math.random(1, #r9_121)]
    r5_121.RoleId = r10_121
    r5_121.SkinId = r10_121
    r5_121.AppearanceSuit.SkinId = r10_121
    r4_121.CharId = r10_121
    r4_121.SkinId = r10_121
    r4_121.AppearanceSuit.SkinId = r10_121
  end
  function r5_121.LoadFinishCallback(r0_122)
    -- line: [1961, 1985] id: 122
    local r1_122 = GWorld:GetAvatar()
    if r1_122 and r1_122.OtherRoleInfo[r6_121].BornState == Const.ShouldDetory and r0_122 then
      r0_122:K2_DestroyActor()
      r1_122.OtherRoleInfo[r6_121] = nil
      return 
    end
    r0_122:AddInteractiveComponent()
    if r0_122.RegionInterComp then
      r0_122.RegionInterComp:InitRegionInfo(r0_122.Eid, r6_121)
    end
    if r0_122.RegionInterAddFriendComp then
      r0_122.RegionInterAddFriendComp:InitRegionInfo(r0_122.Eid, r6_121)
    end
    if r0_122.RegionInterInviteTeamComp then
      r0_122.RegionInterInviteTeamComp:InitRegionInfo(r0_122.Eid, r6_121)
    end
    if r0_122.RegionInterPersonInfoComp then
      r0_122.RegionInterPersonInfoComp:InitRegionInfo(r0_122.Eid, r6_121)
    end
    r8_121:RegisterOtherWorldPlayerCharacterToSubSystem()
    EventManager:FireEvent(EventID.OnlineAddOtherPlayer, r8_121.Eid, r4_121.Uid, r0_122, r6_121)
  end
  r8_121:InitCharacterInfoForRegionPlayer(r5_121)
end
function r8_0.TeleportToCloestTeleportPoint(r0_123)
  -- line: [1991, 1997] id: 123
  DebugPrint("============TeleportToCloestTeleportPoint==============", r0_123.TriggerBoxID)
  CommonUtils:TeleportToCloestTeleportPoint(r0_123.TriggerBoxID)
  r0_123.TriggerBoxID = nil
  EventManager:RemoveEvent(EventID.CloseLoading, GWorld.GameInstance)
  EventManager:RemoveEvent(EventID.OnLevelDeliverBlackCurtainEnd, GWorld.GameInstance)
end
function r8_0.GetIsOpenCrashSight(r0_124)
  -- line: [1999, 2001] id: 124
  return r0_0:Get("IsOpenCrashSight")
end
function r8_0.IsInSquadDungeon(r0_125)
  -- line: [2004, 2018] id: 125
  local r1_125 = r0_125:GetCurrentDungeonId()
  local r2_125 = DataMgr.Dungeon[r1_125]
  if r2_125 then
    local r4_125 = GWorld:GetAvatar().Dungeons[r1_125]
    if r4_125 then
      DebugPrint("gmy@BP_EMGameInstance_C BP_EMGameInstance_C:IsInSquadDungeon", r2_125.Squad, r4_125.Squad)
      return r2_125.Squad and r4_125.Squad ~= 0
    end
  end
  return false
end
function r8_0.SendInputDiviceChangeMessage(r0_126, r1_126, r2_126)
  -- line: [2020, 2040] id: 126
  DebugPrint("yklua___@BP_EMGameInstance_C BP_EMGameInstance_C:SendInputDiviceChangeMessage", r1_126, r2_126)
  local r3_126 = {
    [ECommonInputType.MouseAndKeyboard] = "MouseAndKeyboard",
    [ECommonInputType.Gamepad] = "Gamepad",
    [ECommonInputType.Touch] = "Touch",
    [ECommonInputType.Count] = "Count",
  }
  local r4_126 = {
    device_type = r3_126[r1_126] and "未知设备类型",
  }
  if not r3_126[r1_126] then
    DebugPrint("yklua 切换设备时无法识别输入设备类型")
  end
  HeroUSDKSubsystem(r0_126):UploadTrackLog_Lua("input_device_change", r4_126)
end
function r8_0.VerifyArraySendTrace(r0_127, r1_127, r2_127)
  -- line: [2042, 2053] id: 127
  local r3_127 = GWorld:GetAvatar()
  if not r3_127 then
    return 
  end
  if not r0_127.MemChangeWarning then
    r0_127.MemChangeWarning = true
    r3_127:CallServerMethod("ReportSentimentSDKCheat", "CRC memory modification", 1, 1, nil)
    return 
  end
end
function r8_0.InitFloatVerifyArray(r0_128)
  -- line: [2055, 2072] id: 128
  local r2_128 = AvatarUtils:GetDefaultBattleInfo(GWorld:GetAvatar())
  if r2_128 and r2_128.RoleInfo and r2_128.RoleInfo.ReplaceAttrs and r2_128.RoleInfo.ReplaceAttrs.TotalValues then
    local r3_128 = r2_128.RoleInfo.ReplaceAttrs.TotalValues
    r0_128.FloatVerifyArray:Add(r3_128.DEF)
    r0_128.FloatVerifyArray:Add(r3_128.MaxHp)
    r0_128.FloatVerifyArray:Add(r3_128.SPD)
    r0_128.FloatVerifyArray:Add(r3_128.MaxES)
    r0_128.FloatVerifyArray:Add(r3_128.MaxSp)
    r0_128.FloatVerifyArray:Add(r3_128.SkillEfficiency)
    r0_128.FloatVerifyArray:Add(r3_128.SkillIntensity)
    r0_128.FloatVerifyArray:Add(r3_128.SkillSustain)
    r0_128.FloatVerifyArray:Add(r3_128.SkillRange)
  end
end
function r8_0.SetDynamicResolution(r0_129, r1_129, r2_129)
  -- line: [2074, 2124] id: 129
  if not Const.bUseDynamicResolution then
    return 
  end
  local r3_129 = UE4.UUIFunctionLibrary.GetDevicePlatformName(r0_129)
  if r3_129 == "PC" then
    return 
  end
  if UEMGameInstance.IsLowMemoryDevice() then
    return 
  end
  local r5_129 = nil	-- notice: implicit variable refs by block#[17]
  if not rawget(r0_129, "DynamicResolution") then
    if r3_129 == "Android" then
      local r4_129 = rawset
      r5_129 = r0_129
      r4_129(r5_129, "DynamicResolution", {
        [1] = {
          100,
          80,
          648
        },
        [2] = {
          110,
          90,
          720
        },
        [3] = {
          150,
          100,
          1260
        },
      })
    elseif r3_129 == "IOS" then
      local r4_129 = rawset
      r5_129 = r0_129
      r4_129(r5_129, "DynamicResolution", {
        [1] = {
          75,
          75,
          0
        },
        [2] = {
          80,
          80,
          0
        },
        [3] = {
          105,
          105,
          0
        },
      })
    else
      return 
    end
  end
  if not rawget(r0_129, "DynamicResolutionTags") then
    rawset(r0_129, "DynamicResolutionTags", {})
  end
  local r4_129 = r0_129.DynamicResolutionTags
  if r2_129 then
    r5_129 = true
    if not r5_129 then
      ::label_104::
      r5_129 = nil
    end
  else
    goto label_104	-- block#16 is visited secondly
  end
  r4_129[r1_129] = r5_129
  if CommonUtils.TableLength(r0_129.DynamicResolutionTags) ~= 0 then
    r4_129 = "MobileResolution"
    r5_129 = r0_0:Get(r4_129)
    if r5_129 == nil then
      r5_129 = tonumber(DataMgr.Option[r4_129].DefaultValue)
    end
    if not r0_129.DynamicResolution[r5_129] then
      r5_129 = 3
    end
    local r6_129 = r0_129.DynamicResolution[r5_129]
    GWorld.GameInstance.SetScreenPercentageLevel(r6_129[1], r6_129[2], r6_129[3])
  else
    r6_0.ResetMobileResolution()
  end
end
return r8_0
