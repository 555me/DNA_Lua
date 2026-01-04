-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\BP_EMGameInstance_C.lua
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
local r7_0 = require("BluePrints.UI.WBP.Activity.Widget.GuildWar.GuildWarUtils")
local r8_0 = {
  TextMapContent = ESystemLanguage.TextMapContent,
  ContentEN = ESystemLanguage.ContentEN,
  ContentJP = ESystemLanguage.ContentJP,
  ContentKR = ESystemLanguage.ContentKR,
  ContentTC = ESystemLanguage.ContentTC,
  ContentDE = ESystemLanguage.ContentDE,
  ContentFR = ESystemLanguage.ContentFR,
  ContentES = ESystemLanguage.ContentES,
}
local r9_0 = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.Common.DelayFrameComponent"
})
function r9_0.Initialize(r0_1, r1_1)
  -- line: [33, 36] id: 1
  print(_G.LogTag, "BP_EMGameInstance_C:Initialize")
  GWorld.GameInstance = r0_1
end
function r9_0.OnLoginSuccess(r0_2)
  -- line: [38, 47] id: 2
  UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UStorySubsystem:StaticClass()):TryInitVars()
  if Const.OpenVerifyArray then
    r0_2:InitVerifyArray()
  end
  r0_2.KeyListRecord = {}
end
function r9_0.GetInt(r0_3, r1_3, r2_3)
  -- line: [49, 56] id: 3
  local r4_3 = require(string.format("%s", r1_3))[r2_3]
  if r4_3 == nil then
    return 0
  end
  return r4_3
end
function r9_0.IsBanSmallLevelScalability(r0_4, r1_4)
  -- line: [58, 63] id: 4
  if CommonUtils.HasValue(Const.BanSmallLevelScalabilityLevel, r1_4) then
    return true
  end
  return false
end
function r9_0.GetSerializeDistanceRatio(r0_5, r1_5, r2_5)
  -- line: [65, 71] id: 5
  local r3_5 = 1
  if r2_5 == "IOS" or r0_5:GetUseMapPhoneInPC() then
    r3_5 = Const.IOSSerializeDistanceRatio[r1_5]
    if r3_5 then
      r3_5 = r3_5
    end
  end
  return r3_5
end
function r9_0._FontOptimizeSetting(r0_6)
  -- line: [74, 90] id: 6
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
function r9_0.InitReady(r0_7)
  -- line: [92, 127] id: 7
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
      -- line: [115, 115] id: 8
      return GWorld.Battle
    end
  end
  r0_7:InitGameSystemVoice()
  GWorld.NetworkMgr = r0_7:GetNetworkManager()
  GWorld.NetworkMgr:GetTcpInstance():InitSuccessLua()
  GWorld.BP_Avatar = r0_7:GetAvatar()
end
function r9_0.OnPostWorldCleanup(r0_9, r1_9, r2_9, r3_9)
  -- line: [129, 135] id: 9
  if r1_9:GetName() == r0_9:GetWorld():GetName() and not GWorld:GetAvatar() then
    EventManager:CheckIsLeak()
  end
end
function r9_0.NowTime(r0_10)
  -- line: [137, 139] id: 10
  return r1_0.NowTime()
end
function r9_0.SetWorldStandardTime_Lua(r0_11)
  -- line: [141, 145] id: 11
  if IsStandAlone(r0_11) or IsClient(r0_11) then
    r1_0.RequestSetNowTime()
  end
end
function r9_0.OnStart_Lua(r0_12, r1_12)
  -- line: [147, 151] id: 12
  if IsDedicatedServer(r0_12) and not GWorld.bDebugServer then
    r0_12:HandleDSConnect(r1_12)
  end
end
function r9_0.OnUpdateNetDriverInfo(r0_13, r1_13, r2_13)
  -- line: [153, 166] id: 13
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
function r9_0.SetInstance2GWorld(r0_14)
  -- line: [168, 173] id: 14
  GWorld.GameInstance = r0_14
  GWorld.IsDev = r0_14:GetIsDev()
  GWorld:IsDedicatedServer()
  _G.EMUIAnimationSubsystem = USubsystemBlueprintLibrary.GetWorldSubsystem(r0_14, UEMUIAnimationSubsystem)
end
function r9_0.HandleDSConnect(r0_15, r1_15)
  -- line: [175, 206] id: 15
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
function r9_0.IsNullDungeonId(r0_16, r1_16)
  -- line: [208, 210] id: 16
  return r1_16 == -1
end
function r9_0.GetDataInt(r0_17, r1_17, r2_17, r3_17)
  -- line: [212, 226] id: 17
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
function r9_0.HandleNetworkError(r0_18, r1_18, r2_18)
  -- line: [230, 239] id: 18
  print(_G.LogTag, "HandleNetworkError", r1_18, r2_18)
  if not r2_18 and not r0_18.bHandleNetError then
    r0_18.bHandleNetError = true
    GWorld.NetworkMgr:DisconnectAndReturnLogin()
  elseif r2_18 then
    ServerPrint("HandleNetworkError", r1_18, r2_18)
  end
end
function r9_0.GetDsType(r0_19)
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
function r9_0.OnSubProcessInit(r0_20, r1_20)
  -- line: [252, 259] id: 20
  math.randomseed(r1_20)
  if r0_20.DSType == CommonConst.DSType.Leaf then
    r0_20:AddTimer(2, function()
      -- line: [255, 257] id: 21
      r0_20:GetDSAssetsManager():TryCheckPreLoadAssets()
    end)
  end
end
function r9_0.SetFixedStartPoint(r0_22, r1_22, r2_22, r3_22, r4_22)
  -- line: [262, 269] id: 22
  print(_G.LogTag, "SetFixedStartPoint", r1_22, r2_22)
  r0_22.UseFixedStartPoint = true
  r0_22.StartLocation = r1_22
  r0_22.StartRotation = r2_22
  r0_22.StartControllerRotation = r3_22
  r0_22.bCharacterDead = r4_22
end
function r9_0.ResetFixedStartPoint(r0_23)
  -- line: [272, 276] id: 23
  print(_G.LogTag, "ResetFixedStartPoint")
  r0_23.UseFixedStartPoint = false
  r0_23.bCharacterDead = nil
end
function r9_0.IsUseFixedStartPoint(r0_24)
  -- line: [278, 280] id: 24
  return r0_24.UseFixedStartPoint and false
end
function r9_0.SetStartSpotWithFixedTransform(r0_25, r1_25)
  -- line: [282, 291] id: 25
  if not r0_25.UseFixedStartPoint then
    return false
  end
  r1_25:K2_SetActorTransform(UE4.FTransform(r0_25.StartRotation:ToQuat(), r0_25.StartLocation), false, nil, false)
  r1_25:K2_SetActorLocation(r0_25.StartLocation, false, nil, false)
  r1_25:K2_SetActorRotation(r0_25.StartRotation, false, nil, false)
  return true
end
function r9_0.CachePlayerCharacterInfo(r0_26, ...)
  -- line: [293, 295] id: 26
  r0_26.PlayerCharacterInfo = table.pack(...)
end
function r9_0.ConsumePlayerCharacterInfo(r0_27, r1_27)
  -- line: [297, 305] id: 27
  if not r0_27.PlayerCharacterInfo then
    return 
  end
  local r2_27, r3_27, r4_27 = table.unpack(r0_27.PlayerCharacterInfo)
  r1_27:SetEndPointInfo(r2_27, r3_27, r4_27)
  r0_27.PlayerCharacterInfo = nil
end
function r9_0.PreInitGameMode(r0_28, r1_28)
  -- line: [307, 309] id: 28
  r0_28.CustomPreInitInfo = r1_28
end
function r9_0.ConsumeGameModePreInitInfo(r0_29)
  -- line: [311, 315] id: 29
  r0_29.CustomPreInitInfo = nil
  return r0_29.CustomPreInitInfo
end
function r9_0.OnPlayerControllerGameEnd(r0_30, r1_30, r2_30, r3_30)
  -- line: [317, 344] id: 30
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
  r4_30:TriggerClientEvent("OnDungeonSettlement")
  r0_30.IsInSettlementScene = true
  local r6_30 = UIManager(r0_30):GetUIObj("WalnutChoice")
  if r6_30 then
    r6_30:Close()
  end
  r0_30:OnPlayerControllerGameEnd_Internal(r1_30, r2_30, r3_30)
end
function r9_0.CalculatePhantom(r0_31)
  -- line: [347, 359] id: 31
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
function r9_0.AddOnPhantomInitReadyEvent(r0_32)
  -- line: [361, 365] id: 32
  if r0_32.PhantomTeammatesNum > 0 then
    EventManager:AddEvent(EventID.OnPhantomInitReady, r0_32, r0_32.OnSettlementPhantomInitReady)
  end
end
function r9_0.OnPlayerControllerGameEnd_Internal(r0_33, r1_33, r2_33, r3_33)
  -- line: [367, 407] id: 33
  -- notice: unreachable block#6
  r0_33:PushGameEndInfo(r1_33, r2_33)
  local r4_33 = GWorld:GetAvatar()
  local r5_33 = r4_33 and r4_33:IsInHardBoss()
  local r6_33 = UE4.USubsystemBlueprintLibrary.GetWorldSubsystem(r0_33, UE4.UWorldCompositionSubSystem)
  local r7_33 = r4_33
  if r7_33 then
    if not r6_33 then
      r7_33 = not r4_33:IsInRougeLike()
    else
      r7_33 = false
    end
  end
  if r7_33 and not r4_33:IsInNarrowDungeon() then
    GWorld.DungeonSettlementAgainInVisible = true
  end
  r0_33.IsMoveToTempScene = false
  local r8_33 = nil
  local r9_33 = r0_33:GetCurrentDungeonId()
  r0_33.ScenePlayers = r3_33
  function r8_33()
    -- line: [383, 395] id: 34
    local r0_34 = GWorld:GetAvatar()
    if r7_33 and r0_34:CheckMoveToTempScene(r9_33, r1_33) then
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
  local r10_33 = r0_33:CreateDungeonBlackScreen(true, r8_33, r1_33)
  UE4.UGameplayStatics.GetPlayerController(r0_33, 0):GetMyPawn():ResetIdle()
end
function r9_0.RecordCombatData(r0_35)
  -- line: [409, 540] id: 35
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
      local r5_35 = DataMgr.PaotaiEventConstant.PaotaiGameEventId.ConstantValue
      local r6_35 = GWorld:GetAvatar()
      local r7_35 = r0_35:GetCurrentDungeonId()
      if r6_35 and r6_35.PaotaiGame and r6_35.PaotaiGame[r5_35] and r6_35.PaotaiGame[r5_35][r7_35] and r6_35.PaotaiGame[r5_35][r7_35].MaxScore then
        r0_35.CombatData.MaxScore = r6_35.PaotaiGame[r5_35][r7_35].MaxScore
      end
    end
    if r4_35 and r4_35.GameModeType == "SoloRaid" then
      r0_35.CombatData.MaxScore = r4_35.SoloRaidHistoryMaxScore and 0
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
      goto label_518	-- block#92 is visited secondly
    end
    r6_35.TeammateNum = r7_35
    r0_35.CombatData.PhantomAttrInfos = r1_35:GetPhantomAttrInfos():ToTable()
    r6_35 = r0_35.CombatData
    r7_35 = r1_35:GetPhantomAttrInfos()
    if r7_35 then
      r7_35 = r1_35:GetPhantomAttrInfos():Num() and 0
    else
      goto label_537	-- block#95 is visited secondly
    end
    r6_35.PhantomNum = r7_35
    r0_35.GameEndTime = r1_0.NowTime()
    r0_35:FillTempTeamInfo(r4_35, r1_35)
  end
  PrintTable(r0_35.CombatData, 5)
end
function r9_0.FillTempTeamInfo(r0_36, r1_36, r2_36)
  -- line: [542, 562] id: 36
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
function r9_0.PushGameEndInfo(r0_37, ...)
  -- line: [564, 566] id: 37
  r0_37.GameEndInfo = table.pack(...)
end
function r9_0.EnablePlayerCharacterInput(r0_38)
  -- line: [568, 572] id: 38
  local r1_38 = UE4.UGameplayStatics.GetPlayerController(r0_38, 0)
  r1_38:GetMyPawn():EnableInput(r1_38)
end
function r9_0.CreateDungeonBlackScreen(r0_39, r1_39, r2_39, r3_39)
  -- line: [574, 578] id: 39
  local r4_39 = GWorld.GameInstance:GetGameUIManager()
  DebugPrint("DungeonSettlement: CreateDungeonBlackScreen")
  return r4_39:LoadUINew("DungeonBlackScreen", r1_39, r2_39, r3_39)
end
function r9_0.OnBlackScreenSyncFinished(r0_40, r1_40)
  -- line: [580, 587] id: 40
  DebugPrint("OnBlackScreenSyncFinished")
  r0_40:OnSettlementPlayerCharacterBeginPlay()
  if not r1_40 or r0_40.PhantomTeammatesNum == 0 then
    r0_40:OnCharaterReset()
    r0_40:OnSettlementPlayerCharacterInitReady()
  end
end
function r9_0.OnSettlementPlayerCharacterBeginPlay(r0_41)
  -- line: [590, 602] id: 41
  EventManager:RemoveEvent(EventID.OnMainCharacterBeginPlay, r0_41)
  DebugPrint("DungeonSettlement: OnSettlementPlayerCharacterBeginPlay")
  local r1_41 = r0_41:CreateDungeonBlackScreen(false)
  r0_41.GameEndInfo = nil
  local r2_41 = LoadClass("/Game/Asset/Scene/common/EnvirSystem/EnvirCreat.EnvirCreat_C")
  if not UGameplayStatics.GetActorOfClass(r0_41, r2_41) and r2_41 then
    r0_41:GetWorld():SpawnActor(r2_41, FTransform())
    DebugPrint("Settlement Spawn EnvirCreat")
  end
end
function r9_0.OnSettlementPhantomInitReady(r0_42)
  -- line: [604, 612] id: 42
  DebugPrint("OnSettlementPhantomInitReady")
  r0_42.InitPhantomTeammates = r0_42.InitPhantomTeammates + 1
  if r0_42.PhantomTeammatesNum <= r0_42.InitPhantomTeammates then
    EventManager:RemoveEvent(EventID.OnPhantomInitReady, r0_42)
    r0_42:OnCharaterReset()
    r0_42:OnSettlementPlayerCharacterInitReady()
  end
end
function r9_0.OnCharaterReset(r0_43)
  -- line: [614, 619] id: 43
  local r1_43 = UE4.UGameplayStatics.GetPlayerCharacter(r0_43, 0)
  r1_43:InitCharacterInfo(r1_43.InfoForInit)
  r1_43:ResetIdle()
  USkillFeatureFunctionLibrary.SKillFeatureForceStop()
end
function r9_0.OnSettlementPlayerCharacterInitReady(r0_44)
  -- line: [621, 626] id: 44
  EventManager:RemoveEvent(EventID.OnNotifyClientToCloseLoading, r0_44)
  r0_44.bPlayerCharacterInitReady = true
  r0_44:TryDungeonSettlement()
end
function r9_0.PushLogicServerCallbackInfo(r0_45, ...)
  -- line: [628, 640] id: 45
  if WorldTravelSubsystem() and WorldTravelSubsystem():GetCurrentSceneId() == 0 then
    DebugPrint("TryDungeonSettlement SceneId为0，丢弃此次逻辑服结算数据！")
    return 
  end
  r0_45.LogicServerCallbackInfo = table.pack(...)
  r0_45:TryDungeonSettlement()
end
function r9_0.SetExitLevelEndPointInfo(r0_46, r1_46)
  -- line: [643, 647] id: 46
  print(_G.LogTag, "SetExitLevelEndPointInfo", r1_46.Translation, r1_46.Rotation)
  r0_46.UseExitLevel = true
  r0_46.ExitLevelEndPointTransformation = r1_46
end
function r9_0.TryDungeonSettlement(r0_47)
  -- line: [649, 737] id: 47
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
      -- line: [685, 706] id: 48
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
      elseif r1_47 == 80401 then
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
    local r11_47 = table.unpack(r4_47)
    if r11_47 then
      local r12_47 = UE4.UGameplayStatics.GetGameState(r0_47)
      if r12_47 then
        r12_47:OnWCDungeonSettlement()
      end
    end
    r0_47:PlayerDungeonSettlement(r11_47)
    -- close: r1_47
  end
end
function r9_0.IsInTempScene(r0_49)
  -- line: [739, 748] id: 49
  if r0_49.IsInSettlementScene then
    return true
  end
  local r1_49 = UE4.UGameplayStatics.GetGameState(r0_49)
  if r1_49 and r1_49.IsInSettlementScene then
    return true
  end
  return false
end
function r9_0.PlayerDungeonSettlement(r0_50, r1_50)
  -- line: [750, 847] id: 50
  local r2_50 = UE4.UGameplayStatics.GetGameState(r0_50)
  if r2_50 then
    r2_50.SettlementCharacters:Clear()
  end
  local r3_50 = r2_50 and r2_50:IsInDungeon()
  if r0_50.ScenePlayers ~= nil then
    local r4_50 = nil
    local r5_50 = GWorld:GetAvatar()
    if r5_50 then
      if r5_50:IsInHardBoss() and not r3_50 then
        local r6_50 = r5_50.HardBossInfo.HardBossId
        DebugPrint("BP_EMGameInstance_C:PlayerDungeonSettlement HardBossId:", r6_50)
        r4_50 = DataMgr.HardBossMain[r6_50]
        if r4_50 == nil then
          r2_50:ShowDungeonError("PlayerDungeonSettlement 梦魇SettlementData为空，请检查配表数据 HardBossId: " .. r6_50, Const.DungeonErrorType.Settlement, Const.DungeonErrorTitle.Config)
        end
      else
        local r6_50 = r0_50:GetCurrentDungeonId()
        DebugPrint("BP_EMGameInstance_C:PlayerDungeonSettlement DungeonId:", r6_50)
        r4_50 = DataMgr.Dungeon[r6_50]
        if r4_50 == nil then
          r2_50:ShowDungeonError("PlayerDungeonSettlement 副本SettlementData为空，请检查配表数据 DungeonId: " .. r6_50, Const.DungeonErrorType.Settlement, Const.DungeonErrorTitle.Config)
        end
      end
    end
    if r4_50 == nil then
      DebugPrint("error: BP_EMGameInstance_C:PlayerDungeonSettlement SettlementData is nil!")
    end
    local r6_50, r7_50 = r0_50:CalculateSettlementOriginLoc(r0_50.IsMoveToTempScene)
    local r8_50 = FTransform(r7_50:ToQuat(), r6_50)
    for r12_50 = 1, #r0_50.ScenePlayers, 1 do
      if r0_50.ScenePlayers[r12_50].IsMainPlayer then
        local r13_50 = UE4.UGameplayStatics.GetPlayerCharacter(r0_50, 0)
        r13_50:InitCharacterInfo(r0_50.ScenePlayers[r12_50])
        r13_50:ResetOnSetEndPoint()
        r13_50:SetMainPlayerDungeonSettlementTransform(r0_50.IsMoveToTempScene, r6_50, r7_50)
        if r4_50 then
          r13_50:OnDungeonSettlement(r1_50, r12_50, r4_50)
        end
        for r19_50, r20_50 in pairs(r13_50:GetAllTeammates()) do
          if r20_50 ~= r13_50 then
            r20_50:SetActorHideTag("DungeonSettlement", true, false, true)
          end
        end
        -- close: r15_50
        if r0_50.ScenePlayers[r12_50].IsDead and TeamController then
          TeamController:SendTeamLeave()
          TeamController:GetModel():SetTeam(nil)
        end
      elseif r1_50 and (not r4_50 or not r4_50.NotShowTeammate) then
        local r13_50 = r0_50:GetWorld():SpawnActor(LoadClass("/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C"), r8_50, UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn)
        r13_50:InitCharacterInfo(r0_50.ScenePlayers[r12_50])
        r13_50:ResetOnSetEndPoint()
        r13_50:SetOtherPlayerDungeonSettlementTransform()
        if r4_50 then
          r13_50:OnDungeonSettlementByIndex(r12_50, r0_50.ScenePlayers[r12_50].CurrentWeaponType, r0_50.ScenePlayers[r12_50].CurrentWeaponMeleeOrRanged, r4_50)
        end
        r13_50:SetActorHideTag("InGame", false)
        if r2_50 then
          r2_50.SettlementCharacters:Add(r13_50)
        end
      end
    end
  elseif r2_50 then
    local r4_50 = GWorld:GetAvatar()
    if r4_50 then
      if r4_50:IsInHardBoss() and not r3_50 then
        r2_50:ShowDungeonError("PlayerDungeonSettlement ScenePlayers为空，无法正常做结算表现 HardBossId: " .. r4_50.HardBossInfo.HardBossId, Const.DungeonErrorType.Settlement, Const.DungeonErrorTitle.DataNil)
      else
        r2_50:ShowDungeonError("PlayerDungeonSettlement ScenePlayers为空，无法正常做结算表现 DungeonId: " .. r0_50:GetCurrentDungeonId(), Const.DungeonErrorType.Settlement, Const.DungeonErrorTitle.DataNil)
      end
    end
  end
end
function r9_0.CalculateSettlementOriginLoc(r0_51, r1_51)
  -- line: [849, 896] id: 51
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
      if r4_51.HardBossInfo then
        local r5_51 = r4_51.HardBossInfo.HardBossId
        if DataMgr.HardBossMain[r5_51] then
          local r7_51 = r3_51:GetTargetPoint(DataMgr.HardBossMain[r5_51].PosDisplayName)
          return r7_51:K2_GetActorLocation(), r7_51:K2_GetActorRotation()
        end
      else
        local r5_51, r6_51, r7_51 = r2_51:GetEndPointInfo()
        if r5_51 then
          return r6_51, r7_51
        end
      end
    else
      local r5_51 = UE4.USubsystemBlueprintLibrary.GetWorldSubsystem(r0_51, UE4.UWorldCompositionSubSystem)
      if r5_51 and r5_51:WCIsInDungeon() then
        local r7_51 = UE4.UGameplayStatics.GetGameState(r0_51)
        if r7_51 then
          local r8_51 = r7_51:GetNearestSettlementPoint(r2_51:K2_GetActorLocation())
          if r8_51 then
            local r9_51 = r8_51:K2_GetActorLocation()
            local r10_51 = r8_51:K2_GetActorRotation()
            DebugPrint("CalculateSettlementOriginLoc Find Nearest Settlement Point:", r9_51, r10_51)
            return r9_51, r10_51
          end
        end
      end
    end
  end
  return FVector(0, 0, 0), FRotator(0, 0, 0)
end
function r9_0.ProcessSettlementCharacter(r0_52)
  -- line: [898, 919] id: 52
  local r1_52 = UE4.UGameplayStatics.GetPlayerCharacter(r0_52, 0)
  r1_52:SetActorEnableCollision(true)
  local r2_52 = UE4.UGameplayStatics.GetGameState(r0_52)
  if r2_52 then
    for r6_52 = 1, r2_52.SettlementCharacters:Length(), 1 do
      local r7_52 = r2_52.SettlementCharacters:GetRef(r6_52)
      if IsValid(r7_52) then
        r7_52:K2_DestroyActor()
      end
    end
    r2_52.SettlementCharacters:Clear()
  end
  for r8_52, r9_52 in pairs(r1_52:GetPhantomTeammates()) do
    if r9_52 ~= r1_52 then
      r9_52:SetActorHideTag("DungeonSettlement", false, false, true)
    end
  end
  -- close: r4_52
end
function r9_0.LoadGameEventSettlementUI(r0_53, r1_53, r2_53, r3_53)
  -- line: [921, 1187] id: 53
  local r4_53 = GWorld:GetAvatar()
  if not r4_53 then
    DebugPrint("Error: DungeonSettlement: 找不到Avatar!")
    return 
  end
  local r5_53, r6_53, r7_53, r8_53, r9_53, r10_53, r11_53 = table.unpack(r3_53)
  local r12_53 = GWorld.GameInstance:GetGameUIManager()
  local r16_53 = nil	-- notice: implicit variable refs by block#[55, 58, 60, 62, 64, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 102, 122, 128, 129, 130]
  local r22_53 = nil	-- notice: implicit variable refs by block#[75]
  if r2_53 and r2_53 == "FeinaEvent" then
    local r13_53 = DataMgr.FeinaEventDungeon[r1_53]
    local r14_53 = 0
    local r15_53 = 0
    r16_53 = r0_53.CombatData
    if r16_53 then
      r16_53 = r0_53.CombatData.CurScore
      if r16_53 then
        r16_53 = r0_53.CombatData
        r14_53 = r16_53.CurScore
      end
    end
    r16_53 = r0_53.CombatData
    if r16_53 then
      r16_53 = r0_53.CombatData.MaxScore
      if r16_53 then
        r16_53 = r0_53.CombatData
        r15_53 = r16_53.MaxScore
      end
    end
    r16_53 = {
      LevelScore = r14_53,
      IsWin = r5_53,
      Text_Title = "FeinaEvent_DungeonFinish_Title",
      Text_GetReward = "UI_Dungeon_First_Reward",
      ActivityId = r13_53.SettlementId,
      IsNewRecord = r15_53 < r14_53,
      DungeonId = r1_53,
    }
    local r17_53 = {}
    local r18_53 = {
      text = string.format(GText("FeinaEvent_DungeonTask_1"), r13_53.Level[1]),
      isFinish = r13_53.Level[1] <= r14_53,
    }
    local r19_53 = {
      text = string.format(GText("FeinaEvent_DungeonTask_1"), r13_53.Level[2]),
      isFinish = r13_53.Level[2] <= r14_53,
    }
    local r20_53 = {}
    r22_53 = GText("FeinaEvent_DungeonTask_1")
    r20_53.text = string.format(r22_53, r13_53.Level[3])
    r20_53.isFinish = r13_53.Level[3] <= r14_53
    -- setlist for #17 failed
    r16_53.ScoreInfo = r17_53
    r17_53 = false
    if r5_53 and r4_53.Dungeons[r1_53] and r4_53.Dungeons[r1_53].IsPass and r0_53.CombatData and r0_53.CombatData.NotPass then
      r16_53.RewardIds = {
        r13_53.PassReward
      }
      r17_53 = true
    end
    function r16_53.ContinueCallback()
      -- line: [971, 973] id: 54
      r4_53:EnterDungeon(r1_53)
    end
    r18_53 = r4_0.OpenActivitySettlement(r13_53.SettlementId, r1_53, r16_53)
    if r18_53 and not r17_53 then
      r18_53.Settlement_RewardItem:SetVisibility(ESlateVisibility.Collapsed)
    end
  elseif r2_53 and r2_53 == "Paotai" then
    local r13_53 = 0
    local r14_53 = 0
    local r15_53 = 0
    r16_53 = r0_53.CombatData
    if r16_53 then
      r16_53 = r0_53.CombatData.CurScore
      if r16_53 then
        r16_53 = r0_53.CombatData
        r13_53 = r16_53.CurScore
      end
    end
    r16_53 = r0_53.CombatData
    if r16_53 then
      r16_53 = r0_53.CombatData.MaxScore
      if r16_53 then
        r16_53 = r0_53.CombatData
        r14_53 = r16_53.MaxScore
      end
    end
    r16_53 = r0_53.CombatData
    if r16_53 then
      r16_53 = r0_53.CombatData.CurStar
      if r16_53 then
        r16_53 = r0_53.CombatData
        r15_53 = r16_53.CurStar
      end
    end
    r16_53 = DataMgr.PaotaiEventConstant.PaotaiGameEventId.ConstantValue
    local r17_53 = {
      LevelScore = r13_53,
      IsWin = r5_53,
      Text_Title = "FeinaEvent_DungeonFinish_Title",
      Text_GetReward = "FeinaEvent_DungeonFinish_Reward",
      ActivityId = r16_53,
      IsNewRecord = r14_53 < r13_53,
      DungeonId = r1_53,
      ScoreInfo = {},
    }
    local r18_53 = DataMgr.PaotaiMiniGame[r1_53].LeveDes
    for r22_53 = 1, #r18_53, 1 do
      local r23_53 = table.insert
      local r24_53 = r17_53.ScoreInfo
      local r25_53 = {
        text = string.format(GText(r18_53[r22_53]), DataMgr.PaotaiMiniGame[r1_53].Level[r22_53]),
        isFinish = r22_53 <= r15_53,
      }
      r23_53(r24_53, r25_53)
    end
    function r17_53.ContinueCallback()
      -- line: [1011, 1016] id: 55
      r4_53:EnterEventDungeon(nil, r1_53, nil, r16_53, {
        PaotaiId = DataMgr.PaotaiMiniGame[r1_53].Id,
      })
    end
    r4_0.OpenActivitySettlement(DataMgr.PaotaiEventConstant.PaotaiGameEventId.ConstantValue, r1_53, r17_53)
    -- close: r13_53
  elseif r2_53 and r2_53 == "SoloRaid" then
    local r13_53 = 0
    local r14_53 = 0
    local r15_53 = 0
    if r11_53 then
      r16_53 = r11_53.ResRaidScore
      if r16_53 then
        r13_53 = r11_53.ResRaidScore
      end
    end
    if r11_53 then
      r16_53 = r11_53.RawTimeRemain
      if r16_53 then
        r15_53 = r11_53.RawTimeRemain
      end
    end
    r16_53 = r0_53.CombatData
    r16_53 = r16_53.MaxScore
    r14_53 = r16_53 and 0
    r16_53 = GWorld
    r16_53 = r16_53:GetAvatar()
    if not r16_53 then
      return nil
    end
    local r17_53 = r16_53.CurrentRaidSeasonId
    local r18_53 = r16_53.RaidSeasons[r17_53]
    local r19_53 = DataMgr.RaidSeason[r17_53]
    if r19_53 then
      r19_53 = DataMgr.RaidSeason[r17_53].EventId and DataMgr.RaidSeason[1].EventId
    else
      goto label_301	-- block#66 is visited secondly
    end
    local r20_53 = false
    local r21_53 = DataMgr.RaidDungeon[r1_53]
    if r21_53 then
      r22_53 = r21_53.TicketNum
      if r22_53 then
        r22_53 = pairs
        for r26_53, r27_53 in r22_53(r21_53.TicketNum) do
          if r27_53 and r27_53 > 0 then
            r20_53 = true
            break
          end
        end
        -- close: r22_53
      end
    end
    function r22_53(r0_56, r1_56)
      -- line: [1050, 1071] id: 56
      if not r1_56 then
        return 
      end
      for r6_56, r7_56 in pairs(r1_56) do
        if type(r7_56) == "table" then
          if not r0_56[r6_56] then
            r0_56[r6_56] = {}
          end
          r22_53(r0_56[r6_56], r7_56)
        elseif r0_56[r6_56] and type(r0_56[r6_56]) == "number" and type(r7_56) == "number" then
          r0_56[r6_56] = r0_56[r6_56] + r7_56
        else
          r0_56[r6_56] = r7_56
        end
      end
      -- close: r2_56
    end
    local r23_53 = {}
    if r7_53 then
      r22_53(r23_53, r7_53)
    end
    if r8_53 then
      r22_53(r23_53, r8_53)
    end
    local r24_53, r25_53, r26_53 = r7_0.GetDungeonTicketInfo(r1_53)
    local r27_53 = {
      LevelScore = math.floor(r13_53),
      IsWin = r5_53,
      Text_Title = "FeinaEvent_DungeonFinish_Title",
      Text_GetReward = "FeinaEvent_DungeonFinish_Reward",
      ActivityId = r19_53,
      IsNewRecord = r14_53 < r13_53,
      DungeonId = r1_53,
      TimeRemain = math.floor(r15_53 and 0),
      RewardsInfo = r23_53,
      IsShowReturnText = r20_53,
    }
    if r24_53 > 0 and r25_53 > 0 then
      r27_53.CostParams = {
        ResourceId = r24_53,
        Numerator = r26_53,
        Denominator = r25_53,
        bShowDenominator = true,
        Owner = nil,
      }
    end
    function r27_53.ContinueCallback()
      -- line: [1109, 1111] id: 57
      return r7_0.EnterEventDungeon(r1_53, r19_53)
    end
    r4_0.OpenActivitySettlement(r19_53, r1_53, r27_53)
    -- close: r13_53
  elseif r2_53 and r2_53 == "Temple" then
    local r13_53 = 0
    local r14_53 = 0
    local r15_53 = 0
    r16_53 = r0_53.CombatData
    if r16_53 then
      r16_53 = r0_53.CombatData
      r16_53 = r16_53.Score
      if r16_53 then
        r16_53 = r0_53.CombatData
        r13_53 = r16_53.Score
      end
    end
    r16_53 = r0_53.CombatData
    if r16_53 then
      r16_53 = r0_53.CombatData
      r16_53 = r16_53.Score
      if r16_53 then
        r16_53 = r0_53.CombatData
        r14_53 = r16_53.Score
      end
    end
    r16_53 = r0_53.CombatData
    if r16_53 then
      r16_53 = r0_53.CombatData
      r16_53 = r16_53.StarLevel
      if r16_53 then
        r16_53 = r0_53.CombatData
        r15_53 = r16_53.StarLevel
      end
    end
    r16_53 = {}
    r16_53.LevelScore = r13_53
    r16_53.IsWin = r5_53
    r16_53.Text_Title = "TempleSolo_DungeonFinish_Title"
    r16_53.Text_GetReward = "TempleSolo_DungeonFinish_Reward"
    r16_53.ActivityId = 108001
    r16_53.IsNewRecord = r14_53 < r13_53
    r16_53.DungeonId = r1_53
    r16_53.Text_TotalScore = "TempleSolo_Total_Time"
    r16_53.ScoreInfo = {}
    local r17_53 = DataMgr.Temple[r1_53]
    for r21_53 = 1, #r17_53.RatingRange, 1 do
      r22_53 = ""
      local r23_53 = r17_53.RatingRange[r21_53]
      local r24_53 = ""
      if r17_53.SucRule == "Time" or r17_53.SucRule == "CountDown" then
        r24_53 = "SECONDS"
      elseif r17_53.SucRule == "Score" then
        r24_53 = "SCORE"
      elseif r17_53.SucRule == "Collect" then
        r24_53 = "COUNT"
      end
      if r23_53 == nil then
        r22_53 = ""
      elseif r23_53 == 0 then
        r22_53 = GText("UI_TEMPLE_SUCRULE_ZERO")
      elseif r17_53.SucRule == "CountDown" and r17_53.UIShowType and r17_53.UIShowType > 0 then
        r22_53 = string.format(GText("UI_TEMPLE_SUCRULE_COUNTDOWN_" .. r17_53.UIShowType), 100 - r23_53)
      elseif r24_53 == "SCORE" or r24_53 == "COUNT" then
        r22_53 = GText("UI_TEMPLE_SUCRULE_" .. string.upper(r17_53.SucRule)) .. r23_53
      else
        r22_53 = GText("UI_TEMPLE_SUCRULE_" .. string.upper(r17_53.SucRule)) .. r23_53 .. GText("UI_TEMPLE_MEASURE_" .. r24_53)
      end
      local r25_53 = table.insert
      local r26_53 = r16_53.ScoreInfo
      local r27_53 = {
        text = r22_53,
        isFinish = r21_53 <= r15_53,
      }
      r25_53(r26_53, r27_53)
    end
    if DataMgr.TempleEventLevel[r1_53].IsHardMode then
      r16_53.IconPath = "/Game/UI/Texture/Static/Atlas/Activity/Temple/Solo/T_Activity_Temple_Solo_Star_Challenge.T_Activity_Temple_Solo_Star_Challenge"
      r16_53.IconPath_2 = "/Game/UI/Texture/Static/Atlas/Activity/Temple/Solo/T_Activity_Temple_Solo_Star_Challenge_Empty.T_Activity_Temple_Solo_Star_Challenge_Empty"
    end
    function r16_53.ContinueCallback()
      -- line: [1179, 1182] id: 58
      r4_53:EnterEventDungeon(nil, r1_53, nil, 108001)
    end
    r4_0.OpenActivitySettlement(108001, r1_53, r16_53)
  else
    r16_53 = r3_53
    r12_53:LoadUINew("DungeonSettlement", r16_53, r0_53.DungeonIdCache, r0_53.CombatData)
  end
end
function r9_0.CheckMaintenanceInfo(r0_59, r1_59, r2_59)
  -- line: [1189, 1194] id: 59
  r3_0:GetMaintenance(r1_59, function(r0_60)
    -- line: [1191, 1193] id: 60
    r0_59:GetMaintenanceCb(r1_59, r0_60, r2_59)
  end)
end
function r9_0.JumpToHomepage(r0_61, r1_61)
  -- line: [1195, 1259] id: 61
  local function r2_61(r0_62, r1_62, r2_62)
    -- line: [1196, 1235] id: 62
    if not r2_62 then
      return false
    end
    if r0_62 == -1 and r1_62 == -1 then
      return true
    end
    if r2_62.medium then
      for r7_62, r8_62 in ipairs(r2_62.medium) do
        if r0_62 == tonumber(r8_62) then
          return true
        end
      end
      -- close: r3_62
    end
    if r2_62.channel_ids then
      local r3_62 = DataMgr.ChannelInfo[r0_62]
      local r4_62 = r3_62 and r3_62.Provider
      if r4_62 then
        for r9_62, r10_62 in ipairs(r2_62.channel_ids) do
          if r4_62 == r10_62 or r4_62 == r10_62.code then
            return true
          end
        end
        -- close: r5_62
      end
    end
    if r2_62.img_channel_id then
      local r3_62 = DataMgr.ImgChannelInfo[r1_62]
      local r4_62 = r3_62 and r3_62.Provider
      if r4_62 then
        for r9_62, r10_62 in ipairs(r2_62.img_channel_id) do
          if r4_62 == r10_62 or r4_62 == r10_62.code then
            return true
          end
        end
        -- close: r5_62
      end
    end
    return false
  end
  r3_0:GetMaintenanceInterceptUrl(r1_61, function(r0_63)
    -- line: [1236, 1258] id: 63
    local r1_63 = nil
    if r0_63 and r0_63.mediumList then
      local r2_63 = Utils.HeroUSDKSubsystem():GetChannelId()
      local r3_63 = Utils.HeroUSDKSubsystem():GetMirrorChannelId()
      for r8_63, r9_63 in ipairs(r0_63.mediumList) do
        if r2_61(r2_63, r3_63, r9_63) then
          r1_63 = r9_63.content and r9_63.content[1] and r9_63.content[1].url
          local r10_63 = r0_0:Get("SystemLanguage")
          for r15_63, r16_63 in ipairs(r9_63.content) do
            if r16_63.language and r16_63.language.code == r10_63 then
              r1_63 = r16_63.url
              break
            end
          end
          -- close: r11_63
          break
        end
      end
      -- close: r4_63
    end
    if r1_63 then
      UE4.UKismetSystemLibrary.LaunchURL(r1_63)
    end
  end)
end
function r9_0.GetMaintenanceCb(r0_64, r1_64, r2_64, r3_64)
  -- line: [1261, 1306] id: 64
  local r4_64 = true
  local r5_64 = false
  if r2_64 then
    local r6_64 = r1_0.NowTime()
    for r11_64, r12_64 in pairs(r2_64) do
      if r12_64.Content and #r12_64.Content > 0 and r12_64.StartTimestamp < r6_64 and r6_64 < r12_64.EndTimestamp then
        local r13_64 = nil
        local r14_64 = r0_0:Get("SystemLanguage")
        for r19_64, r20_64 in ipairs(r12_64.Content) do
          if r20_64.language == r14_64 then
            r13_64 = r20_64
            break
          end
        end
        -- close: r15_64
        if r13_64 then
          r4_64 = false
          UIManager(r0_64):ShowCommonPopupUI(100205, {
            ShortText = r13_64.body,
            RightCallbackFunction = function()
              -- line: [1283, 1285] id: 65
              r0_64:JumpToHomepage(r1_64)
            end,
          })
          r5_64 = true
          break
        end
      end
    end
    -- close: r7_64
  end
  if r3_64 then
    r3_64(r4_64, r5_64)
  end
end
function r9_0.SetProgressData(r0_66, r1_66, r2_66)
  -- line: [1308, 1311] id: 66
  r0_66.InterruptProgressData = r1_66
  r0_66.PlayerSliceData = r2_66
end
function r9_0.GetProgressData(r0_67)
  -- line: [1313, 1315] id: 67
  return r0_67.InterruptProgressData
end
function r9_0.GetPlayerSliceData(r0_68)
  -- line: [1317, 1319] id: 68
  return r0_68.PlayerSliceData
end
function r9_0.ClearProgressData(r0_69)
  -- line: [1321, 1323] id: 69
  r0_69.InterruptProgressData = nil
end
function r9_0.ClearPlayerSliceData(r0_70)
  -- line: [1325, 1327] id: 70
  r0_70.PlayerSliceData = nil
end
function r9_0.SetExitDungeonData(r0_71, r1_71)
  -- line: [1330, 1332] id: 71
  r0_71.ExitDungeonData = r1_71
end
function r9_0.GetExitDungeonData(r0_72)
  -- line: [1334, 1336] id: 72
  return r0_72.ExitDungeonData
end
function r9_0.ClearExitDungeonData(r0_73)
  -- line: [1338, 1340] id: 73
  r0_73.ExitDungeonData = nil
end
function r9_0.LoadLogoAtEndOfPrologue(r0_74)
  -- line: [1343, 1357] id: 74
  local r2_74 = GWorld.GameInstance:GetGameUIManager():LoadUI(UIConst.PROLOGUEENDLOGO, "PrologueEndLogo", UIConst.ZORDER_ABOVE_ALL)
  if r2_74 ~= nil then
    r2_74:Show("Talk")
  end
  r0_74.LogoLanguageMap = {
    TextMapContent = "CN_In",
    ContentEN = "EN_In",
    ContentJP = "JP_In",
    ContentKR = "KR_In",
    ContentTC = "TC_In",
  }
end
function r9_0.UnLoadLogoAtEndOfPrologue(r0_75)
  -- line: [1358, 1362] id: 75
  GWorld.GameInstance:GetGameUIManager():GetUIObj("PrologueEndLogo"):Close()
end
function r9_0.ShowLogoAtEndOfPrologue(r0_76)
  -- line: [1364, 1370] id: 76
  local r2_76 = GWorld.GameInstance:GetGameUIManager():GetUIObj("PrologueEndLogo")
  r2_76:PlayAnimation(r2_76[r0_76.LogoLanguageMap[CommonConst.SystemLanguage] and r0_76.LogoLanguageMap[CommonConst.SystemLanguages.Default]])
end
function r9_0.ShowWhiteAtEndOfPrologue(r0_77)
  -- line: [1371, 1375] id: 77
  local r2_77 = GWorld.GameInstance:GetGameUIManager():GetUIObj("PrologueEndLogo")
  r2_77:PlayAnimation(r2_77.Static_Img_BottomMask_In)
end
function r9_0.ShowBlackAtEndOfPrologue(r0_78)
  -- line: [1376, 1380] id: 78
  local r2_78 = GWorld.GameInstance:GetGameUIManager():GetUIObj("PrologueEndLogo")
  r2_78:PlayAnimation(r2_78.Black_In)
end
function r9_0.HideLogoAtEndOfPrologue(r0_79)
  -- line: [1382, 1386] id: 79
  local r2_79 = GWorld.GameInstance:GetGameUIManager():GetUIObj("PrologueEndLogo")
  r2_79:PlayAnimation(r2_79.Logo_Out)
end
function r9_0.HideBlackAtEndOfPrologue(r0_80)
  -- line: [1387, 1391] id: 80
  local r2_80 = GWorld.GameInstance:GetGameUIManager():GetUIObj("PrologueEndLogo")
  r2_80:PlayAnimation(r2_80.Black_Out)
end
function r9_0.PrologueLogoSetFirstDialog(r0_81)
  -- line: [1393, 1400] id: 81
  local r2_81 = GWorld.GameInstance:GetGameUIManager():GetUIObj("PrologueEndLogo")
  r2_81.Text_ChapterDesc:SetText(GText("UI_LOGO_DIALOGUE_10018201"))
  r2_81.Text_WorldDesc:SetText(GText("UI_LOGO_DIALOGUE_10018201_WORLD"))
  r2_81:PlayAnimation(r2_81.Text_In)
end
function r9_0.PrologueLogoUnSetFirstDialog(r0_82)
  -- line: [1401, 1405] id: 82
  local r2_82 = GWorld.GameInstance:GetGameUIManager():GetUIObj("PrologueEndLogo")
  r2_82:PlayAnimation(r2_82.Text_Out)
end
function r9_0.PrologueLogoSetSecondDialog(r0_83)
  -- line: [1407, 1414] id: 83
  local r2_83 = GWorld.GameInstance:GetGameUIManager():GetUIObj("PrologueEndLogo")
  r2_83.Text_ChapterDesc:SetText(GText("UI_LOGO_DIALOGUE_10018202"))
  r2_83.Text_WorldDesc:SetText(GText("UI_LOGO_DIALOGUE_10018202_WORLD"))
  r2_83:PlayAnimation(r2_83.Text_In)
end
function r9_0.PrologueLogoUnSetSecondDialog(r0_84)
  -- line: [1415, 1419] id: 84
  local r2_84 = GWorld.GameInstance:GetGameUIManager():GetUIObj("PrologueEndLogo")
  r2_84:PlayAnimation(r2_84.Text_Out)
end
function r9_0.OnGlobalGameUITagChanged(r0_85, r1_85, r2_85)
  -- line: [1422, 1430] id: 85
  DebugPrint("LHQ_OnGlobalGameUITagChanged: start")
  if r2_85 == "" then
    r0_85:TriggerAllNpcPauseAndHide("None")
  else
    r0_85:TriggerAllNpcPauseAndHide(r2_85)
  end
  DebugPrint("LHQ_OnGlobalGameUITagChanged: end")
end
function r9_0.TriggerAllNpcPauseAndHide(r0_86, r1_86)
  -- line: [1432, 1509] id: 86
  DebugPrint("LHQ_OnGlobalGameUITagChanged_HideNpc: start")
  local function r2_86(r0_87)
    -- line: [1434, 1445] id: 87
    if r0_87.FXComponent then
      r0_87:SetTickableWhenPaused(true)
    end
    if r0_87.FXComponent then
      r0_87.FXComponent:PlayEffectByIDParams(302, {
        bTickEvenWhenPaused = true,
        NotAttached = true,
      })
    else
      local r1_87 = UE4.UGameplayStatics.GetPlayerCharacter(r0_86, 0)
      local r2_87 = r0_87:K2_GetActorLocation()
      r1_87.FXComponent:PlayEffectByIDParams(302, {
        UseAbsoluteLocation = true,
        Location = {
          r2_87.X,
          r2_87.Y,
          r2_87.Z
        },
        bTickEvenWhenPaused = true,
      })
    end
  end
  local r3_86 = UE4.UGameplayStatics.GetGameMode(r0_86)
  local r4_86 = UE4.UGameplayStatics.GetGameInstance(r0_86)
  if not r3_86 or not r4_86 then
    return 
  end
  local r5_86 = UE4.UGameplayStatics.GetGameState(r0_86)
  for r11_86, r12_86 in pairs(r5_86.NpcCharacterMap:ToTable()) do
    local r13_86 = DataMgr.Npc[r12_86.UnitId]
    if r13_86 ~= nil then
      if r13_86.GlobalGameUITagList ~= nil then
        for r18_86, r19_86 in pairs(r13_86.GlobalGameUITagList) do
          if r19_86 == r1_86 then
            r12_86:TriggerNpcGlobalTimeDilation(true)
            r12_86:SetActorHideTag("GlobalTimeDilation", false, false, true)
          end
        end
        -- close: r14_86
        if (not r12_86.HideTags or r12_86.HideTags:Num() == 0) and r1_86 ~= "None" then
          r12_86:TriggerNpcGlobalTimeDilation(true)
          r2_86(r12_86)
        end
        r12_86:SetActorHideTag("GlobalTimeDilation", true, false, true)
      else
        goto label_59	-- block#11 is visited secondly
      end
      -- close: r14_86
      if r1_86 == "None" then
        r12_86:SetActorHideTag("GlobalTimeDilation", false, false, true)
      end
    end
    local r14_86 = r12_86:GetName()
    if r12_86.bHidden then
      DebugPrint("LHQ_OnGlobalGameUITagChanged_HideNpc: " .. r1_86 .. " Npc: " .. r14_86 .. " IsHidden: " .. "true")
    else
      DebugPrint("LHQ_OnGlobalGameUITagChanged_HideNpc: " .. r1_86 .. " Npc: " .. r14_86 .. " IsHidden: " .. "false")
    end
  end
  -- close: r7_86
  for r12_86, r13_86 in pairs(r5_86.CustomNpcSet:ToTable()) do
    if (not r13_86.HideTags or r13_86.HideTags:Num() == 0) and r1_86 ~= "None" then
      r2_86(r13_86)
    end
    r13_86:SetCustomNpcHideTag("GlobalTimeDilation", true)
    if r1_86 == "None" then
      r13_86:SetCustomNpcHideTag("GlobalTimeDilation", false)
    end
    local r14_86 = r13_86:GetName()
    if r13_86.bHidden then
      DebugPrint("LHQ_OnGlobalGameUITagChanged_HideNpc: " .. r1_86 .. " Npc: " .. r14_86 .. " IsHidden: " .. "true")
    else
      DebugPrint("LHQ_OnGlobalGameUITagChanged_HideNpc: " .. r1_86 .. " Npc: " .. r14_86 .. " IsHidden: " .. "false")
    end
  end
  -- close: r8_86
  DebugPrint("LHQ_OnGlobalGameUITagChanged_HideNpc: end")
end
function r9_0.OnGameInputMethodChanged(r0_88, r1_88, r2_88)
  -- line: [1511, 1514] id: 88
  r0_88.CurInputDeviceType = r1_88
  r0_88.CurInputDeviceName = r2_88
end
function r9_0.BindGamepadEvent(r0_89)
  -- line: [1516, 1525] id: 89
  if r0_89.CurInputDeviceType ~= nil then
    return 
  end
  local r1_89 = r0_89:GetGameUIManager():GetGameInputModeSubsystem(r0_89)
  if r1_89 then
    r0_89.CurInputDeviceType = r1_89:GetCurrentInputType()
    r0_89.CurInputDeviceName = r1_89:GetCurrentGamepadName()
    r1_89.OnInputMethodChanged:Add(r0_89, r0_89.OnGameInputMethodChanged)
    r1_89.OnInputMethodChanged:Add(r0_89, r0_89.SendInputDiviceChangeMessage)
  end
end
function r9_0.UnBindGamepadEvent(r0_90)
  -- line: [1527, 1536] id: 90
  if r0_90.CurInputDeviceType == nil then
    return 
  end
  local r1_90 = r0_90:GetGameUIManager():GetGameInputModeSubsystem(r0_90)
  if r1_90 then
    r1_90.OnInputMethodChanged:Remove(r0_90, r0_90.OnGameInputMethodChanged)
    r1_90.OnInputMethodChanged:Remove(r0_90, r0_90.SendInputDiviceChangeMessage)
  end
  r0_90.CurInputDeviceType = nil
  r0_90.CurInputDeviceName = nil
end
function r9_0.ReceiveInit(r0_91)
  -- line: [1538, 1594] id: 91
  GWorld.GameInstance = r0_91
  if IsDedicatedServer(r0_91) then
    return 
  end
  r2_0._Init()
  function r0_91.OnApplicationWillEnterBackground(r0_92)
    -- line: [1556, 1560] id: 92
    EventManager:FireEvent(EventID.ApplicationWillEnterBackground)
    r0_0:SaveAll(false)
  end
  r0_91.ApplicationWillEnterBackgroundDelegate:Add(r0_91, r0_91.OnApplicationWillEnterBackground)
  function r0_91.OnApplicationHasEnteredForeground(r0_93)
    -- line: [1562, 1564] id: 93
    EventManager:FireEvent(EventID.ApplicationHasEnteredForeground)
  end
  r0_91.ApplicationHasEnteredForegroundDelegate:Add(r0_91, r0_91.OnApplicationHasEnteredForeground)
  function r0_91.OnApplicationWillDeactivate(r0_94)
    -- line: [1568, 1572] id: 94
    EventManager:FireEvent(EventID.ApplicationWillDeactivate)
    r0_0:SaveAll(false)
  end
  r0_91.ApplicationWillDeactivateDelegate:Add(r0_91, r0_91.OnApplicationWillDeactivate)
  function r0_91.OnApplicationHasReactivated(r0_95)
    -- line: [1574, 1576] id: 95
    EventManager:FireEvent(EventID.ApplicationHasReactivated)
  end
  r0_91.ApplicationHasReactivatedDelegate:Add(r0_91, r0_91.OnApplicationHasReactivated)
  local r1_91 = r0_0:Get("TeammateEffects")
  if r1_91 then
    UEMGameInstance.SetFriendFXQuality(r1_91)
  else
    local r2_91 = r0_91.GetGameplayScalabilityLevel()
    local r3_91 = UEMGameInstance.SetFriendFXQuality
    local r4_91 = nil	-- notice: implicit variable refs by block#[7]
    if r2_91 <= 1 then
      r4_91 = 0
      if not r4_91 then
        ::label_58::
        r4_91 = 1
      end
    else
      goto label_58	-- block#6 is visited secondly
    end
    r3_91(r4_91)
  end
  r0_91.CacheShowRewardUIParams = {}
  r0_91.ScriptDetectionCheckRecordNum = 0
  EventManager:AddEvent(EventID.TalkHiddenGameUI, r0_91, r0_91.OnTalkHiddenGameUIChange)
  EventManager:AddEvent(EventID.ConditionComplete, r0_91, r0_91.OnConditionComplete)
end
function r9_0.OnApplicationWillTerminate(r0_96)
  -- line: [1597, 1601] id: 96
  r0_96.ApplicationWillTerminateDelegate:Clear()
  r0_0:SaveAll(false)
end
function r9_0.ReceiveShutdown(r0_97)
  -- line: [1604, 1636] id: 97
  if IsDedicatedServer(r0_97) then
    return 
  end
  r0_0:Set("ShundownCount", (r0_0:Get("ShundownCount") and 0) + 1)
  local r1_97 = r0_0:Get("ShundownCount") and 0
  r2_0._Close()
  r0_0:SaveAll(true)
  if not URuntimeCommonFunctionLibrary.IsPlayInEditor(r0_97) and UE4.UUIFunctionLibrary.GetDevicePlatformName(r0_97) == "Windows" and r1_97 > 3 then
    UEMGameInstance.ForceQuitGame()
  end
end
function r9_0.InitGameSetting(r0_98)
  -- line: [1639, 1646] id: 98
  r6_0.InitPerformanceSetting()
  r0_98:InitGameSystemLanguage()
  r0_98:InitGameSystemVoice()
  r0_98:InitGameInterfaceMode()
  r0_98:InitGameMuteBackstage()
  r0_98:InitHideBackWeapons()
end
function r9_0.InitGameSystemLanguage(r0_99)
  -- line: [1648, 1716] id: 99
  local r1_99 = r0_0:Get("SystemLanguage")
  if r1_99 ~= nil then
    CommonConst.SystemLanguage = CommonConst.SystemLanguages[r1_99]
    r0_99.SystemLanguage = r8_0[CommonConst.SystemLanguage]
  else
    if UE.AHotUpdateGameMode.IsGlobalPak() then
      local r3_99 = {
        zh = "CN",
        en = "EN",
        ko = "KR",
        ja = "JP",
      }
      local r4_99 = {
        cn = "CN",
        hk = "TC",
        tw = "TC",
        mo = "TC",
      }
      local r5_99 = {
        CN = "CN",
        TC = "CN",
        EN = "EN",
        KR = "KR",
        JP = "JP",
      }
      local r6_99 = UE4.UKismetSystemLibrary.GetDefaultLanguage()
      local r8_99 = r3_99[string.lower(string.sub(r6_99, 1, 2))] and "EN"
      if r8_99 == "CN" then
        local r9_99 = string.lower(r6_99)
        for r14_99, r15_99 in pairs(r4_99) do
          if string.find(r9_99, r14_99) then
            r8_99 = r15_99
            break
          end
        end
        -- close: r10_99
      end
      CommonConst.SystemLanguage = CommonConst.SystemLanguages[r8_99]
      r0_99.SystemLanguage = r8_0[CommonConst.SystemLanguage]
      local r9_99 = r5_99[r8_99] and "EN"
      CommonConst.SystemVoice = r9_99
      r0_0:Set("SystemVoice", r9_99)
      r0_0:Set("SystemLanguage", r8_99)
    else
      CommonConst.SystemLanguage = CommonConst.SystemLanguages.CN
      r0_0:Set("SystemLanguage", "CN")
      CommonConst.SystemVoice = CommonConst.SystemVoices.CN
      r0_0:Set("SystemVoice", "CN")
    end
    r0_99:OnSystemLanguageChanged()
  end
  if not UE4.URuntimeCommonFunctionLibrary.IsPlayInEditor(r0_99) then
    r0_99:SetCurrentLanguage()
  end
  r0_99:SetUsdkLanguage()
  require("BluePrints.UI.WBP.Announcement.AnnounceUtils"):Init(r0_99)
end
function r9_0.SetCurrentLanguage(r0_100)
  -- line: [1719, 1730] id: 100
  UE4.UKismetInternationalizationLibrary.SetCurrentLanguage(({
    CN = "en",
    EN = "en",
    KR = "ko",
    JP = "ja",
    TC = "zh-Hant-tw",
  })[r0_0:Get("SystemLanguage")] and "en", true)
end
function r9_0.SetUsdkLanguage(r0_101)
  -- line: [1732, 1743] id: 101
  r0_101:InitUsdkLanguage(EHeroUsdkLanguageFlag[({
    CN = "HeroLanguageZhHans",
    TC = "HeroLanguageZhHant",
    EN = "HeroLanguageEn",
    JP = "HeroLanguageJa",
    KR = "HeroLanguageKo",
  })[r0_0:Get("SystemLanguage")]])
end
function r9_0.InitGameSystemVoice(r0_102)
  -- line: [1745, 1759] id: 102
  if IsDedicatedServer(r0_102) then
    return 
  end
  local r1_102 = r0_0:Get("SystemVoice")
  if r1_102 ~= nil then
    CommonConst.SystemVoice = r1_102
  end
  r0_102:AddDelayFrameFunc(function()
    -- line: [1754, 1756] id: 103
    AudioManager(r0_102):RecoverSavedData()
  end, 1)
  r0_102:OnSystemVoiceLanguageChanged()
end
function r9_0.InitGameInterfaceMode(r0_104)
  -- line: [1762, 1795] id: 104
  if UE4.URuntimeCommonFunctionLibrary.IsPlayInEditor(r0_104) then
    return 
  end
  if UE4.UUCloudGameInstanceSubsystem and UE4.UUCloudGameInstanceSubsystem.IsCloudGame(r0_104) then
    return 
  end
  local r2_104 = "InterfaceMode"
  local r3_104 = "InterfaceModeCacheName"
  if r0_0:Get(r3_104) == nil then
    local r5_104 = r0_104:GetSceneManager()
    if r5_104 == nil then
      return 
    end
    local r6_104 = {
      [1] = EWindowMode.Fullscreen,
      [2] = EWindowMode.Windowed,
      [3] = EWindowMode.WindowedFullscreen,
    }
    local r7_104 = DataMgr.Option[r2_104]
    local r8_104 = EWindowMode.WindowedFullscreen
    if r7_104 then
      r8_104 = r6_104[tonumber(r7_104.DefaultValue)]
      if CommonUtils.GetDeviceTypeByPlatformName(r0_104) == "Mobile" and r7_104.DefaultValueM then
        r8_104 = r6_104[tonumber(r7_104.DefaultValueM)]
      end
    end
    r5_104:ResizeWindow(r8_104)
    r0_0:Set(r3_104, r8_104)
    DebugPrint("初始化显示模式 包体首次登陆时设置成无边框窗口化 InitGameInterfaceMode DefaultMode:" .. r8_104)
  end
end
function r9_0.InitGameMuteBackstage(r0_105)
  -- line: [1798, 1815] id: 105
  local r1_105 = "MuteBackstage"
  local r2_105 = r0_0:Get(r1_105)
  if r2_105 == nil then
    r2_105 = DataMgr.Option[r1_105].DefaultValue == "True"
    r0_0:Set(r1_105, r2_105)
  end
  if r2_105 then
    AudioManager(r0_105):BindLogicToWindowActivatedDeactivated()
  else
    AudioManager(r0_105):UnBindLogicToWindowActivatedDeactivated()
  end
end
function r9_0.InitHideBackWeapons(r0_106)
  -- line: [1818, 1834] id: 106
  local r1_106 = "HideBackWeapons"
  local r2_106 = r0_0:Get(r1_106)
  if r2_106 == nil then
    r2_106 = DataMgr.Option[r1_106].DefaultValue == "True"
    r0_0:Set(r1_106, r2_106)
  end
  if not AWeaponBase or not AWeaponBase.SetWeaponBackTimerEnabled then
    return 
  end
  AWeaponBase.SetWeaponBackTimerEnabled(r0_106, r2_106)
end
function r9_0.UploadLuaCallError(r0_107, r1_107)
  -- line: [1836, 1914] id: 107
  if not GWorld or not GWorld:GetAvatar() then
    return ""
  end
  local r2_107 = GWorld:GetAvatar()
  local r3_107 = UGameplayStatics.GetPlayerCharacter(r0_107, 0)
  local function r4_107()
    -- line: [1844, 1892] id: 108
    local r0_108 = UE4.UGameplayStatics.GetGameState(r0_107)
    local r1_108 = UE4.UGameplayStatics.GetGameMode(r0_107)
    if not r3_107 or not r0_108 or not r1_108 then
      return ""
    end
    local r2_108 = r1_108:GetWCSubSystem()
    if r2_108 then
      if r0_108:IsInDungeon() then
        return r2_108:GetLocationLevelName(r3_107:K2_GetActorLocation())
      elseif r2_107:IsInBigWorld() then
        return r2_108:GetLocationLevelName(r3_107:K2_GetActorLocation())
      end
      return ""
    else
      if not r0_108:IsInDungeon() then
        return ""
      end
      local r3_108 = UE4.URuntimeCommonFunctionLibrary.GetLevelLoadJsonName(r3_107)
      local function r4_108(r0_109)
        -- line: [1864, 1871] id: 109
        return require("rapidjson").decode(UE4.URuntimeCommonFunctionLibrary.LoadFile(UE4.UKismetSystemLibrary.GetProjectContentDirectory() .. "Script/Datas/Houdini_data/" .. r0_109 .. ".json"))
      end
      local r5_108 = r3_107.CurrentLevelId
      if not r5_108 then
        return ""
      end
      local r6_108 = string.format("当前玩家进的拼接关卡: %s", r3_108)
      for r12_108, r13_108 in pairs(r4_108(r3_108).points) do
        for r17_108 = 1, r5_108:Length(), 1 do
          local r18_108 = r5_108:Get(r17_108)
          if tostring(r13_108.id) == r18_108 then
            local r19_108 = r13_108.art_path
            if r19_108 == "" then
              r19_108 = string.gsub(r13_108.struct, "Data_Design", "Data_Art", 1)
            end
            r6_108 = r6_108 .. string.format("，所在的美术关卡是: %s， 关卡id是： %s", r19_108, r18_108)
          end
        end
      end
      -- close: r8_108
      return r6_108
    end
  end
  local r5_107 = "Error"
  pcall(function()
    -- line: [1895, 1895] id: 110
    r5_107 = r4_107()
  end)
  local r6_107 = ""
  local r7_107 = WorldTravelSubsystem
  if r7_107 then
    r7_107 = WorldTravelSubsystem()
    if r7_107 then
      r7_107 = tostring(WorldTravelSubsystem():GetCurrentSceneId())
      r6_107 = r7_107
    end
  end
  if r3_107 then
    r7_107 = tostring(r3_107:K2_GetActorLocation()) and " "
  else
    goto label_46	-- block#8 is visited secondly
  end
  r2_107:ReportClientTrace("Uid:" .. tostring(r2_107.Uid) .. "\n" .. "SceneId:" .. r6_107 .. "\n" .. "SceneName:" .. tostring(r5_107) .. "\n" .. "PlayerLocation:" .. r7_107 .. "\n" .. r1_107)
  local r9_107 = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UEMSentrySubsystem)
  if r9_107 then
    r9_107:ReportLuaTrace(r1_107, {
      SceneId = r6_107,
      SceneName = tostring(r5_107),
      Location = r7_107,
    })
  end
end
function r9_0.GetDeviceTypeByPlatformName(r0_111)
  -- line: [1916, 1918] id: 111
  return CommonUtils:GetDeviceTypeByPlatformName()
end
function r9_0.SimulateMovementDebugPlatform(r0_112)
  -- line: [1920, 1931] id: 112
  if Const.SimulateMovementDebugPlatform == "Android" or Const.SimulateMovementDebugPlatform == "Windows" or Const.SimulateMovementDebugPlatform == "IOS" or Const.SimulateMovementDebugPlatform == "Mac" then
    return Const.SimulateMovementDebugPlatform
  end
  return UE4.UUIFunctionLibrary.GetDevicePlatformName(r0_112)
end
function r9_0.DisableLuaMemoryMonitorFromCPP(r0_113)
  -- line: [1933, 1935] id: 113
  LuaMemoryManager:DisableLuaMemoryMonitor()
end
function r9_0.RequestShowPopup(r0_114, r1_114, r2_114, r3_114)
  -- line: [1937, 1968] id: 114
  if not r0_114.RequestPopupQueue then
    r0_114.RequestPopupQueue = {}
  end
  table.insert(r0_114.RequestPopupQueue, {
    PopupId = r1_114,
    Params = r2_114,
    ParentWidget = r3_114,
  })
  local function r4_114()
    -- line: [1948, 1963] id: 115
    DebugPrint("Tianyi@ Try to show popup")
    if not r0_114.RequestPopupQueue then
      r0_114:RemoveTimer(r0_114.RequestShowPopupTimer)
    end
    if r0_114:CheckCanShowPopup() then
      DebugPrint("Tianyi@ TryShowPopup")
      r0_114:RemoveTimer(r0_114.RequestShowPopupTimer)
      local r0_115 = GWorld.GameInstance:GetGameUIManager()
      for r5_115, r6_115 in ipairs(r0_114.RequestPopupQueue) do
        r0_115:ShowCommonPopupUI(r6_115.PopupId, r6_115.Params, r6_115.ParentWidget)
      end
      -- close: r1_115
      r0_114.RequestPopupQueue = nil
    end
  end
  if not r0_114.RequestShowPopupTimer then
    r0_114.RequestShowPopupTimer = r0_114:AddTimer(0.2, r4_114, true)
  end
end
function r9_0.CheckCanShowPopup(r0_116)
  -- line: [1971, 1975] id: 116
  if r0_116:GetLoadingUI() then
    return false
  end
  return true
end
function r9_0.OnTalkHiddenGameUIChange(r0_117)
  -- line: [1977, 1991] id: 117
  local r1_117 = GWorld:GetAvatar()
  if not r1_117 or not r1_117:IsInBigWorld() then
    return 
  end
  UE4.UKismetSystemLibrary.K2_SetTimerDelegate({
    r0_117,
    function()
      -- line: [1983, 1990] id: 118
      local r0_118 = r0_117:GetTalkContext()
      if not IsValid(r0_118) or r0_118:HasHiddenGameUI() then
        return 
      end
      for r5_118, r6_118 in pairs(r0_117.CacheShowRewardUIParams) do
        UIUtils.ShowDungeonRewardUI(table.unpack(r6_118))
      end
      -- close: r1_118
      r0_117.CacheShowRewardUIParams = {}
    end
  }, 0.01, false, 0)
end
function r9_0.OnConditionComplete(r0_119, r1_119)
  -- line: [1993, 2030] id: 119
  if DataMgr.ConditionId2ModArchiveId and DataMgr.ConditionId2ModArchiveId[r1_119] then
    for r6_119, r7_119 in pairs(DataMgr.ConditionId2ModArchiveId[r1_119]) do
      if r7_119 then
        local r8_119 = DataMgr.ModGuideBookArchive[r7_119]
        if r8_119 then
          local r9_119 = #r8_119.ModList
          local r10_119 = DataMgr.ModGuideBookArchiveTab[r8_119.TabId].ReddotNode
          if not r2_0.GetTreeNode("ModArchive") then
            r2_0.AddNodeEx("ModArchive")
          end
          local r11_119 = r2_0.GetLeafNodeCacheDetail(r10_119) and {}
          if not r11_119.NewNum then
            r11_119.NewNum = 0
          end
          if not r11_119.States then
            r11_119.States = {}
          end
          for r15_119 = 1, #r8_119.ModList, 1 do
            local r16_119 = r8_119.ModList[r15_119]
            if not r11_119.States[r16_119] then
              r11_119.States[r16_119] = true
            else
              r9_119 = r9_119 + -1
            end
          end
          r11_119.NewNum = r11_119.NewNum + r9_119
          r2_0.IncreaseLeafNodeCount(r10_119, r9_119, r11_119)
        end
      end
    end
    -- close: r2_119
  end
end
function r9_0.CloseLoadingUI(r0_120)
  -- line: [2032, 2036] id: 120
  UKismetSystemLibrary.ExecuteConsoleCommand(r0_120, "r.Shadow.ForceCacheUpdate 1", nil)
  r0_120.Overridden.CloseLoadingUI(r0_120)
end
function r9_0.SpawnOtherRole(r0_121, r1_121, r2_121, r3_121)
  -- line: [2037, 2140] id: 121
  local function r4_121(r0_122, r1_122)
    -- line: [2038, 2125] id: 122
    local r2_122 = GWorld:GetAvatar()
    if r2_122 and r2_122.OtherRoleInfo[r1_121].BornState == Const.ShouldDetory then
      r2_122.OtherRoleInfo[r1_121] = nil
      return 
    end
    local r6_122 = r0_122:GetWorld():SpawnActor(r1_122, FTransform(FRotator(r3_121.Rotation.Pitch, r3_121.Rotation.Yaw, r3_121.Rotation.Roll):ToQuat(), FVector(r3_121.Location.X, r3_121.Location.Y, r3_121.Location.Z)), UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn)
    r6_122.FromOtherWorld = true
    if r6_122 and r6_122:GetMovementComponent() and r6_122:GetMovementComponent().EnableSmoothStep then
      r6_122:GetMovementComponent().EnableSmoothStep = false
    end
    local r7_122 = {}
    local r8_122 = UE4.UGameplayStatics.GetGameMode(r0_122)
    r7_122.RoleId = r2_121.CharId
    r7_122.SkinId = r2_121.SkinId
    r7_122.FromOtherWorld = true
    r7_122.AppearanceSuit = r2_121.AppearanceSuit
    r7_122.RegionWeaponInfo = r2_121.RegionWeaponInfo
    r7_122.ShowWeapon = r2_121.ShowWeapon
    if r0_122.RandomClientRegionPlayerRoleId then
      local r9_122 = {
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
      local r10_122 = r9_122[math.random(1, #r9_122)]
      r7_122.RoleId = r10_122
      r7_122.SkinId = r10_122
      r7_122.AppearanceSuit.SkinId = r10_122
      r2_121.CharId = r10_122
      r2_121.SkinId = r10_122
      r2_121.AppearanceSuit.SkinId = r10_122
    end
    function r7_122.LoadFinishCallback(r0_123)
      -- line: [2093, 2120] id: 123
      print(_G.LogTag, "CharacterRead", r0_123:K2_GetActorLocation(), r0_123:K2_GetActorRotation())
      local r1_123 = GWorld:GetAvatar()
      if r1_123 then
        if r1_123.OtherRoleInfo[r1_121].BornState == Const.ShouldDetory and r0_123 then
          r0_123:K2_DestroyActor()
          r1_123.OtherRoleInfo[r1_121] = nil
          return 
        end
        r1_123.OtherRoleInfo[r1_121].BornState = Const.Bonred
        r1_123.OtherRoleInfo[r1_121].CharEid = r0_123.Eid
      end
      r0_123:AddInteractiveComponent()
      if r0_123.RegionInterComp then
        r0_123.RegionInterComp:InitRegionInfo(r0_123.Eid, r1_121)
      end
      if r0_123.RegionInterAddFriendComp then
        r0_123.RegionInterAddFriendComp:InitRegionInfo(r0_123.Eid, r1_121)
      end
      if r0_123.RegionInterInviteTeamComp then
        r0_123.RegionInterInviteTeamComp:InitRegionInfo(r0_123.Eid, r1_121)
      end
      if r0_123.RegionInterPersonInfoComp then
        r0_123.RegionInterPersonInfoComp:InitRegionInfo(r0_123.Eid, r1_121)
      end
      EventManager:FireEvent(EventID.OnlineAddOtherPlayer, r6_122.Eid, r2_121.Uid, r0_123, r1_121)
    end
    r6_122:InitCharacterInfoForRegionPlayer(r7_122)
    EventManager:FireEvent(EventID.AddRegionIndicatorInfo, r6_122.Eid, r2_121.Uid, r6_122:K2_GetActorLocation(), r1_121)
    r6_122:RegisterOtherWorldPlayerCharacterToSubSystem()
  end
  if not r0_121.bRegionClientOnlyShowUI then
    UE4.UResourceLibrary.LoadClassAsync(r0_121, "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C", {
      r0_121,
      r4_121
    })
  else
    local r5_121 = r0_121:AddPlayerHeadUI(FVector(r3_121.Location.X, r3_121.Location.Y, r3_121.Location.Z))
    local r6_121 = GWorld:GetAvatar()
    if r5_121 > 0 and r6_121 then
      r6_121.OtherRoleInfo[r1_121].BornState = Const.Bonred
      r6_121.OtherRoleInfo[r1_121].CharEid = r5_121
      EventManager:FireEvent(EventID.AddRegionIndicatorInfo, r5_121, r2_121.Uid, FVector(r3_121.Location.X, r3_121.Location.Y, r3_121.Location.Z), r1_121)
      EventManager:FireEvent(EventID.OnlineAddOtherPlayer, r5_121, r2_121.Uid, nil, r1_121)
    end
  end
end
function r9_0.HeadUIReady(r0_124, r1_124, r2_124, r3_124)
  -- line: [2141, 2170] id: 124
  if not UE4.URegionSyncSubsystem.GetInstance(r0_124) then
    print(_G.LogTag, "RegionPlayerInitInfo RegionSyncSubsys is nil")
    return 
  end
  local r5_124 = GWorld:GetAvatar()
  if not r5_124 then
    print(_G.LogTag, "RegionPlayerInitInfo Avatar is nil")
    return 
  end
  if not r5_124.OtherRoleInfo then
    print(_G.LogTag, "RegionPlayerInitInfo Avatar.TempRoleInfo is nil")
    return 
  end
  if not CommonUtils.IsObjIdStr(r1_124) then
    print(_G.LogTag, "RegionPlayerInitInfo ObjId is  not a Legal ObjIdStr")
    return 
  end
  local r6_124 = CommonUtils.Str2ObjId(r1_124)
  local r7_124 = r5_124.OtherRoleInfo[r6_124]
  if not r7_124 then
    print(_G.LogTag, "RegionPlayerInitInfo RoleInfo is nil")
    return 
  end
  r7_124.BornState = Const.Bonred
  r7_124.CharEid = r2_124
  EventManager:FireEvent(EventID.AddRegionIndicatorInfo, r2_124, r7_124.Uid, r3_124, r6_124)
  EventManager:FireEvent(EventID.OnlineAddOtherPlayer, r2_124, r7_124.Uid, nil, r6_124)
end
function r9_0.CreatePlayerCharacterWhileOnlyShowUI(r0_125, r1_125, r2_125)
  -- line: [2171, 2242] id: 125
  local r3_125 = GWorld:GetAvatar()
  if r1_125 <= 0 or not r3_125 then
    return 
  end
  local r4_125 = {}
  local r5_125 = {}
  local r6_125 = nil
  for r11_125, r12_125 in pairs(r3_125.OtherRoleInfo and {}) do
    if r12_125.CharEid == r1_125 then
      r6_125 = r11_125
      r4_125 = r12_125
      break
    end
  end
  -- close: r7_125
  if not r6_125 then
    return 
  end
  local r8_125 = r0_125:GetWorld():SpawnActor(LoadClass("/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C"), r2_125, UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn)
  if not r8_125 then
    return 
  end
  r8_125.FromOtherWorld = true
  local r9_125 = UE4.URegionSyncSubsystem.GetInstance(r0_125)
  if r9_125 then
    r9_125:RegisterBornCharWhileOnlyCreateHeadUI(CommonUtils.ObjId2Str(r6_125), r8_125)
  end
  local r10_125 = GWorld:GetAvatar()
  if not r10_125 or not r10_125.OtherRoleInfo then
    return 
  end
  local r11_125 = r10_125.OtherRoleInfo[r6_125]
  if not r11_125 then
    print(_G.LogTag, "RegionPlayerInitInfo RoleInfo is nil")
    return 
  end
  r8_125.CacheInfo = r11_125
  if r11_125.AppearanceSuit then
    r8_125.CurrentSkinId = r11_125.AppearanceSuit.SkinId
  else
    r8_125.CurrentSkinId = r11_125.SkinId
  end
  r8_125.ShadowModelId = r11_125.ShadowModelId and 0
  r11_125.Eid = r1_125
  r8_125:PreInitInfo(r11_125)
  r8_125:RegionPlayerPendingInit()
  r8_125:AddInteractiveComponent()
  r11_125.CharEid = r8_125.Eid
  if r8_125.RegionInterComp then
    r8_125.RegionInterComp:InitRegionInfo(r8_125.Eid, r6_125)
  end
  if r8_125.RegionInterAddFriendComp then
    r8_125.RegionInterAddFriendComp:InitRegionInfo(r8_125.Eid, r6_125)
  end
  if r8_125.RegionInterInviteTeamComp then
    r8_125.RegionInterInviteTeamComp:InitRegionInfo(r8_125.Eid, r6_125)
  end
  if r8_125.RegionInterPersonInfoComp then
    r8_125.RegionInterPersonInfoComp:InitRegionInfo(r8_125.Eid, r6_125)
  end
  EventManager:FireEvent(EventID.AddRegionIndicatorInfo, r8_125.Eid, r11_125.Uid, r8_125:K2_GetActorLocation(), r6_125)
  r8_125:RegisterOtherWorldPlayerCharacterToSubSystem()
  if r11_125.IsCrouching then
    r8_125:SetCrouch(true)
  else
    r8_125:SetCrouch(false)
  end
end
function r9_0.TeleportToCloestTeleportPoint(r0_126)
  -- line: [2245, 2251] id: 126
  DebugPrint("============TeleportToCloestTeleportPoint==============", r0_126.TriggerBoxID)
  CommonUtils:TeleportToCloestTeleportPoint(r0_126.TriggerBoxID)
  r0_126.TriggerBoxID = nil
  EventManager:RemoveEvent(EventID.CloseLoading, GWorld.GameInstance)
  EventManager:RemoveEvent(EventID.OnLevelDeliverBlackCurtainEnd, GWorld.GameInstance)
end
function r9_0.GetIsOpenCrashSight(r0_127)
  -- line: [2253, 2255] id: 127
  return r0_0:Get("IsOpenCrashSight")
end
function r9_0.IsInSquadDungeon(r0_128)
  -- line: [2258, 2272] id: 128
  local r1_128 = r0_128:GetCurrentDungeonId()
  local r2_128 = DataMgr.Dungeon[r1_128]
  if r2_128 then
    local r4_128 = GWorld:GetAvatar().Dungeons[r1_128]
    if r4_128 then
      DebugPrint("gmy@BP_EMGameInstance_C BP_EMGameInstance_C:IsInSquadDungeon", r2_128.Squad, r4_128.Squad)
      return r2_128.Squad and r4_128.Squad ~= 0
    end
  end
  return false
end
function r9_0.SendInputDiviceChangeMessage(r0_129, r1_129, r2_129)
  -- line: [2274, 2294] id: 129
  DebugPrint("yklua___@BP_EMGameInstance_C BP_EMGameInstance_C:SendInputDiviceChangeMessage", r1_129, r2_129)
  local r3_129 = {
    [ECommonInputType.MouseAndKeyboard] = "MouseAndKeyboard",
    [ECommonInputType.Gamepad] = "Gamepad",
    [ECommonInputType.Touch] = "Touch",
    [ECommonInputType.Count] = "Count",
  }
  local r4_129 = {
    device_type = r3_129[r1_129] and "未知设备类型",
  }
  if not r3_129[r1_129] then
    DebugPrint("yklua 切换设备时无法识别输入设备类型")
  end
  HeroUSDKSubsystem(r0_129):UploadTrackLog_Lua("input_device_change", r4_129)
end
function r9_0.VerifyArraySendTrace(r0_130, r1_130, r2_130)
  -- line: [2296, 2307] id: 130
  local r3_130 = GWorld:GetAvatar()
  if not r3_130 then
    return 
  end
  if not r0_130.MemChangeWarning then
    r0_130.MemChangeWarning = true
    r3_130:CallServerMethod("ReportSentimentSDKCheat", "CRC memory modification", 1, 1, {})
    return 
  end
end
function r9_0.InitFloatVerifyArray(r0_131)
  -- line: [2309, 2326] id: 131
  local r2_131 = AvatarUtils:GetDefaultBattleInfo(GWorld:GetAvatar())
  if r2_131 and r2_131.RoleInfo and r2_131.RoleInfo.ReplaceAttrs and r2_131.RoleInfo.ReplaceAttrs.TotalValues then
    local r3_131 = r2_131.RoleInfo.ReplaceAttrs.TotalValues
    r0_131.FloatVerifyArray:Add(r3_131.DEF)
    r0_131.FloatVerifyArray:Add(r3_131.MaxHp)
    r0_131.FloatVerifyArray:Add(r3_131.SPD)
    r0_131.FloatVerifyArray:Add(r3_131.MaxES)
    r0_131.FloatVerifyArray:Add(r3_131.MaxSp)
    r0_131.FloatVerifyArray:Add(r3_131.SkillEfficiency)
    r0_131.FloatVerifyArray:Add(r3_131.SkillIntensity)
    r0_131.FloatVerifyArray:Add(r3_131.SkillSustain)
    r0_131.FloatVerifyArray:Add(r3_131.SkillRange)
  end
end
function r9_0.UpdatePostProcessMaterial(r0_132)
  -- line: [2328, 2347] id: 132
  if IsDedicatedServer(r0_132) then
    return 
  end
  local r1_132 = URuntimeCommonFunctionLibrary.GetWorldSettsings(r0_132)
  if r1_132 and r1_132.bClosePostProcessMaterial then
    local r3_132 = UGameplayStatics.GetPlatformName()
    local r4_132 = r0_132:GetUseMapPhoneInPC()
    if not r4_132 then
      if r3_132 ~= "IOS" then
        r4_132 = r3_132 == "Android"
      else
        goto label_27	-- block#9 is visited secondly
      end
    end
    local r5_132 = r0_132:GetGameplayScalabilityLevel() <= 1
    local r6_132 = r0_132:IsLowMemoryDevice()
    if r4_132 and (r5_132 or r6_132) then
      UKismetSystemLibrary.ExecuteConsoleCommand(r0_132, "r.Mobile.PostProcessMaterial 0")
    else
      UKismetSystemLibrary.ExecuteConsoleCommand(r0_132, "r.Mobile.PostProcessMaterial 1")
    end
  else
    UKismetSystemLibrary.ExecuteConsoleCommand(r0_132, "r.Mobile.PostProcessMaterial 1")
  end
end
function r9_0.SetDynamicResolution(r0_133, r1_133, r2_133)
  -- line: [2349, 2403] id: 133
  if not Const.bUseDynamicResolution then
    return 
  end
  local r3_133 = UE4.UUIFunctionLibrary.GetDevicePlatformName(r0_133)
  if r3_133 == "PC" then
    return 
  end
  if UEMGameInstance.IsLowMemoryDevice() then
    return 
  end
  local r5_133 = nil	-- notice: implicit variable refs by block#[17]
  if not rawget(r0_133, "DynamicResolution") then
    if r3_133 == "Android" then
      local r4_133 = rawset
      r5_133 = r0_133
      r4_133(r5_133, "DynamicResolution", {
        [1] = {
          100,
          80,
          720
        },
        [2] = {
          110,
          90,
          750
        },
        [3] = {
          150,
          100,
          810
        },
        [4] = {
          150,
          100,
          900
        },
        [5] = {
          150,
          100,
          1260
        },
      })
    elseif r3_133 == "IOS" then
      local r4_133 = rawset
      r5_133 = r0_133
      r4_133(r5_133, "DynamicResolution", {
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
          85,
          85,
          0
        },
        [4] = {
          90,
          90,
          0
        },
        [5] = {
          105,
          105,
          0
        },
      })
    else
      return 
    end
  end
  if not rawget(r0_133, "DynamicResolutionTags") then
    rawset(r0_133, "DynamicResolutionTags", {})
  end
  local r4_133 = r0_133.DynamicResolutionTags
  if r2_133 then
    r5_133 = true
    if not r5_133 then
      ::label_132::
      r5_133 = nil
    end
  else
    goto label_132	-- block#16 is visited secondly
  end
  r4_133[r1_133] = r5_133
  if CommonUtils.TableLength(r0_133.DynamicResolutionTags) ~= 0 then
    r4_133 = "MobileResolution"
    r5_133 = r0_0:Get(r4_133)
    if r5_133 == nil then
      r5_133 = tonumber(DataMgr.Option[r4_133].DefaultValue)
    end
    if not r0_133.DynamicResolution[r5_133] then
      r5_133 = 5
    end
    local r6_133 = r0_133.DynamicResolution[r5_133]
    GWorld.GameInstance.SetScreenPercentageLevel(r6_133[1], r6_133[2], r6_133[3])
  else
    r6_0.ResetMobileResolution()
  end
end
return r9_0
