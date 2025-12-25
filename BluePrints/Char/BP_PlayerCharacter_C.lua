-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Char\BP_PlayerCharacter_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
require("DataMgr")
local r0_0 = require("Const")
local r1_0 = require("EMCache.EMCache")
local r2_0 = require("Utils.CommonUtils")
local r3_0 = require("Utils.TimeUtils")
local r4_0 = require("BluePrints.UI.GMInterface.GMVariable")
local r5_0 = require("BluePrints.Story.StoryPlayableUtils").StoryPlayableUtils
local r6_0 = require("Blueprints.UI.Forge.ForgeDataModel")
local r7_0 = require("BluePrints.UI.BloodBar.BloodBarUtils").AllBloodState
local r8_0 = require("BluePrints.UI.WBP.Chat.ChatController")
local r9_0 = require("Utils.MiscUtils")
local r10_0 = require("EMLuaConst")
local r11_0 = Class("BluePrints.Char.BP_CharacterBase_C")
r11_0._components = {
  "BluePrints.Char.CharacterComponent.PickupComponent",
  "BluePrints.Char.CharacterComponent.CameraComponent",
  "BluePrints.Char.CharacterComponent.CamPostProcessMgrComponent",
  "BluePrints.Char.CharacterComponent.AttackInputComponent",
  "BluePrints.Char.CharacterComponent.PlayerCommonInterface",
  "BluePrints.Char.CharacterComponent.NewBDCTrackComponent",
  "BluePrints.Char.CharacterComponent.CharacterPickupUseComponent",
  "BluePrints.Char.CharacterComponent.TeamRecoveryComponent",
  "BluePrints.Char.CharacterComponent.QTEComponent",
  "BluePrints.Char.CharacterComponent.CharMoveSyncMgr",
  "BluePrints.Char.CharacterComponent.PropEffectComponent"
}
function r11_0.Initialize(r0_1, r1_1)
  -- line: [34, 36] id: 1
  r0_1:PlayerCharacterInitialize()
end
function r11_0.ReceiveBeginPlay(r0_2)
  -- line: [38, 83] id: 2
  r0_2:BeforeBeginPlay()
  r0_2.Super.ReceiveBeginPlay(r0_2)
  r0_2:AfterBeginPlay()
  r0_2.UpVector = FVector(0, 0, 1)
  r0_2.IsNearDeath = false
  r0_2.UpVector:Normalize()
  EventManager:AddEvent(EventID.SetDefaultWeapon, r0_2, r0_2.SetDefaultWeapon)
  EventManager:AddEvent(EventID.OnStartSkillFeature, r0_2, r0_2.OnSkillFeatureBegin)
  EventManager:AddEvent(EventID.CloseLoading, r0_2, r0_2.AfterLoading)
  EventManager:AddEvent(EventID.OnLevelDeliverBlackCurtainEnd, r0_2, r0_2.AfterLoading)
  EventManager:AddEvent(EventID.OnRepBulletNum, r0_2, r0_2.UpdateBulletNumUI)
  r0_2:SetActorHideTag("login", true)
  r0_2.DisableInputTags = TArray("")
  r9_0.InitializeSettings(r0_2)
  r0_2:RefreshTeamMemberInfo("ReceiveBeginPlay")
  if r0_2:IsMainPlayer() then
    EventManager:FireEvent(EventID.OnMainCharacterBeginPlay)
    local r1_2 = r1_0:Get("IsOpenHelperAim")
    local r2_2 = nil	-- notice: implicit variable refs by block#[4]
    if r1_2 == nil then
      r2_2 = true
      if not r2_2 then
        ::label_85::
        r2_2 = r1_2
      end
    else
      goto label_85	-- block#3 is visited secondly
    end
    r0_2.IsOpenHelperAim = r2_2
    r2_2 = r1_0:Get("IsOpenLockAim")
    local r3_2 = nil	-- notice: implicit variable refs by block#[7]
    if r2_2 == nil then
      r3_2 = true
      if not r3_2 then
        ::label_96::
        r3_2 = r2_2
      end
    else
      goto label_96	-- block#6 is visited secondly
    end
    r0_2.IsOpenLockAim = r3_2
    r0_2:UpdateOpenHelperAim(r0_2.IsOpenHelperAim)
    r0_2:InitGameSkillFaceTo()
    r0_2:SetEnableFallAtkDir()
    r0_2:SetRegionOnlineState()
    r3_2 = r1_0:Get("ShowPlayerName") and EMainPlayerNameWidgetOption.EOnlyInRegionOnline
    r0_2:ChangeNameWidgetOption(r3_2, true)
  end
  r0_2:SetUpAllTimer()
  r0_2:SetGamepadFromCache()
  r0_2:SetMobileRotationFromCache()
  r0_2:InitLockHpCache()
  r0_2:BindControllerChangedDelegate()
  local r1_2 = r0_2:GetController()
  if r1_2 then
    r1_2:ShowFlags("VisualizeSkyVisibilityLightmap", false)
    r1_2:ShowFlags("VisualizeBouncedSkyVisibilityLightmap", false)
  end
end
function r11_0.InitLockHpCache(r0_3)
  -- line: [85, 93] id: 3
  if r0_3.BuffManager then
    r0_3.CachedLockHPRate = r0_3.BuffManager.LockHpRate
    r0_3.CachedLockHPValue = r0_3.BuffManager.LockHpValue
  else
    r0_3.CachedLockHPRate = 0
    r0_3.CachedLockHPValue = 0
  end
end
function r11_0.GetDropDistance(r0_4)
  -- line: [95, 97] id: 4
  r0_4:CalcAttr("DropDistance")
end
function r11_0.BindControllerChangedDelegate(r0_5)
  -- line: [99, 102] id: 5
  UE4.UGameplayStatics.GetGameInstance(r0_5).OnPawnControllerChangedDelegates:Add(r0_5, r0_5.OnPlayerControllerChanged)
end
function r11_0.OnPlayerControllerChanged(r0_6, r1_6, r2_6)
  -- line: [104, 112] id: 6
  if r1_6 == r0_6 and r2_6 and r2_6:IsPlayerController() then
    if r0_6.DisableInputTags:Length() > 0 then
      r0_6:DisableInput(r0_6:GetController())
    else
      r0_6:EnableInput(r0_6:GetController())
    end
  end
end
function r11_0.SetGamepadFromCache(r0_7)
  -- line: [122, 137] id: 7
  if not r0_7:IsMainPlayer() then
    return 
  end
  local r1_7 = r1_0:Get("GamepadLayout")
  DebugPrint("@zyh 获取到的GamepadLayout", r1_7)
  if not r1_7 then
    local r2_7 = tonumber(DataMgr.Option.GamepadPreset.DefaultValue)
    r1_0:Set("GamepadLayout", r2_7)
    r0_7:InitGamepadSet(r2_7)
    r0_7:InitReplaceGamepadSet(r2_7)
  else
    r0_7:InitGamepadSet(r1_7)
    r0_7:InitReplaceGamepadSet(r1_7)
  end
end
function r11_0.SwitchGamepadSet(r0_8, r1_8)
  -- line: [139, 143] id: 8
  r0_8:InitGamepadSet(r1_8)
  r0_8:InitReplaceGamepadSet(r1_8)
  EventManager:FireEvent(EventID.OnSwitchGamepadSet)
end
function r11_0.SetMobileRotationFromCache(r0_9)
  -- line: [145, 159] id: 9
  if not r0_9:IsMainPlayer() then
    return 
  end
  local r1_9 = r1_0:Get("EnableMobileRotation")
  DebugPrint("@zyh 获取到的EnableMobileRotation", r1_9)
  if r1_9 == nil then
    local r3_9 = nil	-- notice: implicit variable refs by block#[6]
    if DataMgr.Option.EnableMobileRotation.DefaultValueM == "True" then
      r3_9 = true
      if not r3_9 then
        ::label_24::
        r3_9 = false
      end
    else
      goto label_24	-- block#5 is visited secondly
    end
    r1_0:Set("EnableMobileRotation", r3_9)
    r0_9.EnableMobileRotation = r3_9
  else
    r0_9.EnableMobileRotation = r1_9
  end
end
function r11_0.SwitchEnableMobileRotation(r0_10, r1_10)
  -- line: [161, 164] id: 10
  r0_10.EnableMobileRotation = r1_10
  r1_0:Set("EnableMobileRotation", r1_10)
end
function r11_0.UpdateOpenHelperAim(r0_11, r1_11)
  -- line: [166, 170] id: 11
  r0_11.IsOpenHelperAim = r1_11
  r0_11.CurShootingLocation = r0_0.ZeroVector
  r1_0:Set("IsOpenHelperAim", r1_11)
end
function r11_0.UpdateOpenLockAim(r0_12, r1_12)
  -- line: [172, 176] id: 12
  r0_12.IsOpenLockAim = r1_12
  r0_12.CurShootingLocation = r0_0.ZeroVector
  r1_0:Set("IsOpenLockAim", r1_12)
end
function r11_0.InitGameSkillFaceTo(r0_13)
  -- line: [179, 198] id: 13
  local r1_13 = "SkillFaceTo"
  local r2_13 = r1_0:Get(r1_13)
  local r3_13 = nil
  if r2_13 == nil then
    local r4_13 = DataMgr.Option[r1_13]
    if r2_0.GetDeviceTypeByPlatformName(r0_13) == "Mobile" and r4_13.DefaultValueM then
      r3_13 = r4_13.DefaultValueM
    else
      r3_13 = r4_13.DefaultValue
    end
    r2_13 = r3_13 == "True"
    r1_0:Set(r1_13, r2_13)
  end
  r0_13:SetLockOrientpreference(r2_13)
end
function r11_0.SetUpAllTimer(r0_14)
  -- line: [200, 210] id: 14
  if r0_14:IsMainPlayer() then
    r0_14:AddTimer(1, r0_14.UpdatePlayerBloodEffectInfo, true, 0, "UpdatePlayerBloodEffectInfo")
    local r1_14 = GWorld:GetAvatar()
    if r1_14 and r1_14:IsInBigWorld() then
      r0_14:AddTimer(0.5, r0_14.CalcCurrentPlayerRegionId, true)
    end
    r0_14:AddTimer(60, r0_14.CheckHPRate, true, math.random(1, 60), "CheckLockHpRate")
    r0_14:AddTimer(60, r0_14.CheckExtraRangeModify, true, math.random(1, 60), "CheckExtraRangeModify")
  end
end
function r11_0.CheckHPRate(r0_15)
  -- line: [212, 239] id: 15
  local r1_15 = GWorld:GetAvatar()
  if not r0_15.BuffManager or not r1_15 then
    return 
  end
  local r2_15 = UE4.URuntimeCommonFunctionLibrary.IsDistribution()
  if r0_15.CachedLockHPRate ~= r0_15.BuffManager.LockHpRate or r0_15.CachedLockHPValue ~= r0_15.BuffManager.LockHpValue then
    r0_15.CachedLockHPRate = r0_15.BuffManager.LockHpRate
    r0_15.CachedLockHPValue = r0_15.BuffManager.LockHpValue
    if r0_15.CachedLockHPRate ~= 0 or r0_15.CachedLockHPValue ~= 0 then
      local r3_15 = false
      for r8_15, r9_15 in pairs(r0_15.BuffManager.Buffs) do
        local r10_15 = DataMgr.Buff[r9_15.BuffId]
        if r10_15 and r10_15.LockHp then
          r3_15 = true
          break
        end
      end
      -- close: r4_15
      if not r3_15 and (r2_15 or r10_0.OpenCheckHPLock) then
        UE4.URuntimeCommonFunctionLibrary.SendCheatMsgToServer(r0_15:GetWorld(), ECheatType.HoneyJar, "反外挂检测，非法修改了LockHpRate或LockHpValue")
      end
    end
  end
end
function r11_0.CheckExtraRangeModify(r0_16)
  -- line: [241, 259] id: 16
  local r1_16 = GWorld:GetAvatar()
  if not r0_16.Skills or not r1_16 then
    return 
  end
  local r2_16 = false
  local r3_16 = "当前Skill列表：\n"
  for r8_16, r9_16 in pairs(r0_16.Skills) do
    if r9_16.ExtraRangeModify ~= 1 then
      r2_16 = true
      r3_16 = r3_16 .. tostring(string.format("SkillId: %d, ExtraRangeModify: %f \n", r9_16.SkillId, r9_16.ExtraRangeModify))
    end
  end
  -- close: r4_16
  if r2_16 then
    UE4.URuntimeCommonFunctionLibrary.SendCheatMsgToServer(r0_16:GetWorld(), ECheatType.HoneyJar, "反外挂检测，非法修改了技能的ExtraRangeModify \n" .. r3_16)
  end
end
function r11_0.ShowCursor_Press(r0_17)
  -- line: [261, 268] id: 17
  DebugPrint("ShowCursor_Press", UE4.UKismetSystemLibrary.GetFrameCount())
  local r1_17 = UGameInputModeSubsystem.GetGameInputModeSubsystem(r0_17)
  if not IsValid(r1_17) then
    return 
  end
  r1_17:HandleShowCursorPressOrRelease(true)
end
function r11_0.ShowCursor_Release(r0_18)
  -- line: [270, 277] id: 18
  DebugPrint("ShowCursor_Release", UE4.UKismetSystemLibrary.GetFrameCount())
  local r1_18 = UGameInputModeSubsystem.GetGameInputModeSubsystem(r0_18)
  if not IsValid(r1_18) then
    return 
  end
  r1_18:HandleShowCursorPressOrRelease(false)
end
function r11_0.ShowCursorLock(r0_19, r1_19)
  -- line: [279, 281] id: 19
  r0_19.bShowCursorLock = r1_19
end
function r11_0.ShowMonsterInfo(r0_20)
  -- line: [283, 294] id: 20
  local r2_20 = UE4.UGameplayStatics.GetGameInstance(r0_20):GetGameUIManager()
  r0_20.bShowMonsterInfo = not r0_20.bShowMonsterInfo
  if r0_20.bShowMonsterInfo then
    r2_20:LoadUI(UIConst.MONSTERINFOPANEL, "MonsterInfo", UIConst.ZORDER_FOR_DESKTOP_TEMP)
  else
    r2_20:UnLoadUI("MonsterInfo")
  end
  r0_20:RemoveInputCache("ShowMonsterInfo")
end
function r11_0.OpenMap(r0_21)
  -- line: [296, 315] id: 21
  if TeamController:IsTeamPopupBarOpenInGamepad() then
    return 
  end
  if not UIManager(r0_21):TryOpenSystem("Map") then
    return 
  end
  local r2_21 = UE4.UGameplayStatics.GetGameInstance(r0_21):GetGameUIManager()
  if not r2_21 then
    return 
  end
  local r3_21 = nil
  local r4_21 = r2_21:GetUI("BattleMain") and r2_21:GetUI("HomeBaseMain")
  if r4_21 then
    r3_21 = r4_21.Battle_Map and r4_21.Battle_Map_PC
  end
  if r3_21 then
    r3_21:OnKeyboardClick()
  end
end
function r11_0.StartOpenMap(r0_22)
  -- line: [316, 330] id: 22
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    local r1_22 = GWorld:GetAvatar()
    if r1_22 and r1_22:CheckUIUnlocked("Chat") then
      local r2_22 = UIManager(r0_22):GetUIObj("BattleMain")
      if r2_22 and r2_22.Key_ChatEntry then
        r0_22.Key_ChatEntry = r2_22.Key_ChatEntry
        r0_22.Key_ChatEntry:AddExecuteLogic(r0_22, r0_22.ChatUpdate)
        r0_22.Key_ChatEntry:OnButtonPressed(nil, true, 0, 0.5)
        return 
      end
    end
  end
  r0_22:OpenMap()
end
function r11_0.ClearChatEntryKey(r0_23)
  -- line: [331, 335] id: 23
  r0_23.Key_ChatEntry:RemoveExecuteLogic()
  r0_23.Key_ChatEntry:OnButtonReleased()
  r0_23.Key_ChatEntry = nil
end
function r11_0.StopOpenMap(r0_24)
  -- line: [336, 341] id: 24
  if r0_24.Key_ChatEntry then
    r0_24:ClearChatEntryKey()
    r0_24:OpenMap()
  end
end
function r11_0.ChatUpdate(r0_25)
  -- line: [342, 345] id: 25
  r0_25:ClearChatEntryKey()
  r8_0:OpenView(r0_25, true)
end
function r11_0.OpenBattleWheel(r0_26)
  -- line: [346, 396] id: 26
  DebugPrint("gmy@OpenBattleWheel")
  local r1_26 = GWorld:GetAvatar()
  if r1_26 == nil then
    return 
  end
  local r2_26 = DataMgr.UIUnlockRule
  local r3_26 = r2_26.BattleWheel.UIUnlockRuleId
  local r4_26 = UE4.UGameplayStatics.GetGameInstance(r0_26)
  local r5_26 = UE4.UGameplayStatics.GetPlayerController(r4_26, 0)
  if r5_26.bEnableBattleWheel then
    local r6_26 = r1_26:CheckUIUnlocked(r3_26)
    DebugPrint("gmy@BattleMenu Unlocked", r6_26)
    if r6_26 then
      local r7_26 = r4_26:GetGameUIManager()
      local r8_26 = r7_26:GetUIObj("InBattleWheelMenu")
      if r8_26 then
        r7_26:UnLoadUI("InBattleWheelMenu")
        r8_26 = nil
      end
      if r8_26 == nil then
        r8_26 = r7_26:LoadUINew("InBattleWheelMenu", r5_26.QuestBattleWheelID and nil)
      end
      DebugPrint(LXYTag, "BattleWheel", r8_26)
      AudioManager(r0_26):PlayUISound(r8_26, "event:/ui/common/combat_bag_show", "BattleMenuShow", nil)
      r0_26:FlushInputKeyExceptMove()
      r0_26:AddForbidTag("BattleWheelForbid")
      r5_26:AddDisableRotationInputTag("SetRotation_Lerp")
    else
      UIManager(r0_26):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, r2_26.BattleWheel.UIUnlockDesc)
    end
  else
    DebugPrint("gmy@BP_PlayerCharacter_C:OpenBattleWheel DisableBattleWheel")
    if WorldTravelSubsystem():GetCurrentDungeonType() == CommonConst.DungeonType.Abyss then
      UIManager(r0_26):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, GText("UI_Disabled_Des_BattleWheel"))
    else
      UIManager(r0_26):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, GText("UI_BATTLEWHEEL_FORBIDDEN"))
    end
  end
end
function r11_0.CloseBattleWheel(r0_27, r1_27)
  -- line: [398, 423] id: 27
  local r2_27 = UE4.UGameplayStatics.GetGameInstance(r0_27)
  local r4_27 = r2_27:GetGameUIManager():GetUIObj("InBattleWheelMenu")
  local r5_27 = UE4.UGameplayStatics.GetPlayerController(r2_27, 0)
  if r4_27 ~= nil then
    local r6_27 = UGameInputModeSubsystem.GetGameInputModeSubsystem(r0_27)
    if r6_27 then
      if r6_27:GetCurrentInputType() == ECommonInputType.Gamepad then
        r4_27:CloseMenu()
      else
        r4_27:SelectAndCloseMenu()
      end
    end
  end
  r0_27:MinusForbidTag("BattleWheelForbid")
  r5_27:RemoveDisableRotationInputTag("SetRotation_Lerp")
end
function r11_0.RefreshBattleWheelEnableState(r0_28)
  -- line: [425, 434] id: 28
  local r1_28 = r0_28:GetController()
  if not r1_28.bEnableBattleWheel then
    r0_28:CloseBattleWheel(true)
  end
  DebugPrint("gmy@BP_PlayerCharacter_C:RefreshBattleWheelEnableState", r1_28.bEnableBattleWheel)
  EventManager:FireEvent(EventID.OnRefreshBattleWheelEnableState, r1_28.bEnableBattleWheel, r1_28.bShowBattleWheel)
end
function r11_0.SetQuestBattleWheelID(r0_29, r1_29)
  -- line: [436, 443] id: 29
  r0_29.QuestBattleWheelID = r1_29
  local r3_29 = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  if r3_29 then
    r3_29.QuestBattleWheelID = r0_29.QuestBattleWheelID
  end
end
function r11_0.EnableBattleWheel(r0_30)
  -- line: [445, 452] id: 30
  local r2_30 = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  if r2_30 then
    r2_30.bEnableBattleWheel = true
    r0_30:RefreshBattleWheelEnableState()
  end
end
function r11_0.DisableBattleWheel(r0_31)
  -- line: [454, 461] id: 31
  local r2_31 = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  if r2_31 then
    r2_31.bEnableBattleWheel = false
    r0_31:RefreshBattleWheelEnableState()
  end
end
function r11_0.ShowBattleWheel(r0_32)
  -- line: [463, 469] id: 32
  local r1_32 = r0_32:GetController()
  if r1_32 then
    r1_32.bShowBattleWheel = true
    r0_32:RefreshBattleWheelEnableState()
  end
end
function r11_0.HideBattleWheel(r0_33)
  -- line: [471, 477] id: 33
  local r1_33 = r0_33:GetController()
  if r1_33 then
    r1_33.bShowBattleWheel = false
    r0_33:RefreshBattleWheelEnableState()
  end
end
function r11_0.CalcCurrentPlayerRegionId(r0_34)
  -- line: [484, 496] id: 34
  local r1_34 = GWorld:GetAvatar()
  local r2_34 = r0_34:GetRegionId()
  if not r2_34 or not r1_34 or not r1_34:CheckCurrentSubRegion() then
    return 
  end
  if r1_34.SyncReason ~= CommonConst.SyncReason.Normal then
    return 
  end
  if not r1_34:CheckCurrentSubRegion(r2_34) then
    return 
  end
  if r1_34.CurrentRegionId ~= r2_34 and r2_34 ~= -1 then
    if r1_34:GetSubRegionId2RegionId() ~= r1_34:GetSubRegionId2RegionId(r2_34) then
      return 
    end
    if r0_34:GetRegionId(r0_34:GetLastSafeLocation()) ~= r2_34 then
      return 
    end
    r1_34:SkipRegion(r2_34)
  end
end
function r11_0.OnEnteredNewSubRegion(r0_35)
  -- line: [498, 530] id: 35
  local r1_35 = GWorld:GetAvatar()
  DebugPrint("OnEnteredNewSubRegion", r1_35.CurrentRegionId)
  if r0_35.CanChangeToMaster == nil then
    r0_35.CanChangeToMaster = r0_35:CheckCanChangeToMaster(false)
  end
  local r2_35 = r0_35.CanChangeToMaster
  local r3_35 = r0_35:CheckCanChangeToMaster(false, true)
  if r0_35.CurrentMasterBan and not r3_35 then
    r0_35:SwitchMasterOrHeroUIPerform()
    r0_35:ChangeBackToHero()
  end
  AudioManager(r0_35):CheckLevelSoundAndRegionId(r1_35.CurrentRegionId)
end
function r11_0.GetRegionId(r0_36, r1_36)
  -- line: [532, 543] id: 36
  if not r1_36 then
    r1_36 = r0_36.CurrentLocation
  end
  local r2_36 = UE4.UGameplayStatics.GetGameMode(r0_36)
  local r3_36 = -1
  if not r2_36 then
    return 
  end
  local r4_36 = r2_36:GetLevelLoader()
  if r4_36 and GWorld:GetWorldRegionState() and r4_36.IsWorldLoader then
    r3_36 = r4_36:GetRegionIdByLocation(r1_36)
  end
  return r3_36
end
function r11_0.StartLookAt(r0_37, r1_37, r2_37)
  -- line: [549, 557] id: 37
  if not r0_37:CheckLookPriority(r1_37) then
    return 
  end
  r0_37:StopLookAt()
  r0_37.CurrentLookType = r1_37
  r0_37.CurrentLookInfo = r2_37
  r0_37.LookAtTag:SetTagState(r1_37, true)
end
function r11_0.CheckLookPriority(r0_38, r1_38)
  -- line: [559, 561] id: 38
  return true
end
function r11_0.StopLookAt(r0_39, r1_39)
  -- line: [563, 571] id: 39
  if not r1_39 then
    r0_39.LookAtTag:SetTagState(r0_39.CurrentLookType, false)
    return 
  end
  if r1_39 == r0_39.CurrentLookType then
    r0_39.LookAtTag:SetTagState(r0_39.CurrentLookType, false)
  end
end
function r11_0.CheckCanLookAt(r0_40, r1_40)
  -- line: [573, 586] id: 40
  if r1_40 then
    r0_40:StopLookAt()
    return 
  end
  local r2_40 = DataMgr.PlayerStateLimit[r0_40.AutoSyncProp.CharacterTag]
  if r2_40 and r2_40.NeackRotation then
    r0_40:StartLookAt("Camera", {
      TurnHeadParam = {
        bLookUseCamera = true,
        bIsLookAt = true,
      },
    })
  else
    r0_40:StopLookAt("Camera")
  end
end
function r11_0.OnSetLookAtTag(r0_41, r1_41)
  -- line: [588, 598] id: 41
  if not r0_41.PlayerAnimInstance then
    return 
  end
  if not r1_41 then
    r0_41.PlayerAnimInstance:StopLookAt()
    return 
  end
  r0_41:SetLookAtParam()
end
function r11_0.SetLookAtParam(r0_42)
  -- line: [600, 624] id: 42
  if not r0_42.PlayerAnimInstance then
    return 
  end
  if not r0_42.CurrentLookInfo then
    return 
  end
  for r5_42, r6_42 in pairs(r0_42.CurrentLookInfo.TurnHeadParam) do
    if r0_42.PlayerAnimInstance[r5_42] ~= nil then
      r0_42.PlayerAnimInstance[r5_42] = r6_42
    end
  end
  -- close: r1_42
  local r1_42 = r0_42.CurrentLookInfo.Target
  local r2_42 = r0_42.CurrentLookInfo.SocketName
  if r0_42.CurrentLookType == "Actor" then
    r0_42.PlayerAnimInstance:SetLookAtActor(r1_42, r2_42)
  elseif r0_42.CurrentLookType ~= "Camera" then
    r0_42.PlayerAnimInstance:SetLookAtActor(r1_42, r2_42)
  end
end
function r11_0.OnSkillFeatureBegin(r0_43)
  -- line: [663, 665] id: 43
  r0_43:StopFire(false, true)
end
function r11_0.CancelSkill(r0_44, r1_44, r2_44)
  -- line: [668, 674] id: 44
  if not r0_44:IsSkillFinished() then
    r0_44:StopSkill(UE.ESkillStopReason.ForceCancel)
    r0_44:StopFire(r2_44, false)
    r0_44.PlayerAnimInstance:StopSkillAnimation()
  end
end
function r11_0.InitSceneStartUI(r0_45)
  -- line: [677, 712] id: 45
  local r1_45 = UE4.UGameplayStatics.GetGameInstance(r0_45)
  local r2_45 = r1_45:GetGameUIManager()
  if not IsValid(r2_45) then
    return 
  end
  r0_45.UIModePlatform = r2_0.GetDeviceTypeByPlatformName(r0_45)
  r0_45.PlatformName = UGameplayStatics.GetPlatformName()
  local r3_45 = r2_45:LoadUI(UIConst.SCENESTARTUI, "SceneStartUI", UIConst.ZORDER_FOR_DESKTOP)
  if r3_45 ~= nil then
    r3_45:InitMainPage()
  end
  if not r0_45:IsDead() then
    local r4_45 = r2_45:GetUI("BattleMain")
    if r4_45 then
      r4_45:HidePlayerDeadUI()
    end
    r2_45:HideAllUI_EX(TSet(FName), false, "RegionResurgence")
  end
  r0_45:UpdatePlayerTaskInfo()
  if not r1_45:GetLoadingUI() then
    r0_45:RefreshCharUIByPlatform()
  end
end
function r11_0.RefreshCharUIByPlatform(r0_46)
  -- line: [714, 729] id: 46
  local r1_46 = UIManager(r0_46)
  r0_46.SkillUINames = r0_46.SkillUINames and {}
  for r6_46, r7_46 in pairs(r0_46.SkillUINames) do
    DebugPrint("gmy@BP_PlayerCharacter_C:RefreshCharUIByPlatform ", r6_46)
    r1_46:UnLoadUI(r6_46)
    r0_46.SkillUINames[r6_46] = nil
  end
  -- close: r2_46
  DebugPrint("gmy@BP_PlayerCharacter_C BP_PlayerCharacter_C:RefreshCharUIByPlatform1", r0_46.CurrentRoleId)
  local r2_46 = DataMgr.BattleChar[r0_46.CurrentRoleId]
  if r2_46 and r2_46.CharUIId then
    r0_46:TryOpenSkillUI(r2_46.CharUIId, false)
  end
end
function r11_0.CheckDraftCanProduce(r0_47)
  -- line: [731, 747] id: 47
  local r1_47 = GWorld:GetAvatar()
  if not r1_47 then
    return 
  end
  if r1_47:CheckSubRegionType(r1_47:GetCurrentRegionId(), CommonConst.SubRegionType.Home) and r1_47:IsInBigWorld() and #r6_0:GetCanProduceDraftIds() > 0 then
    r0_47:AddTimer(1, function()
      -- line: [739, 744] id: 48
      UE4.UTalkFunctionLibrary.PlayDirectTalkByTalkTriggerId(GWorld.GameInstance, 3001)
    end)
  end
end
function r11_0.UpdatePlayerBloodEffectInfo(r0_49)
  -- line: [749, 807] id: 49
  if not r0_49.InitSuccess then
    return 
  end
  local r3_49 = r0_49:GetCurrentBloodVolume() / r0_49:GetMaxBloodVolume()
  local r4_49 = r0_49:GetAttr("ES")
  local r5_49 = DataMgr.SystemUI[UIConst.BattleNearDeathPCName]
  if r5_49 then
    local r6_49 = r5_49.Params.FirstLevelFactor
    local r7_49 = r5_49.Params.SecondLevelFactor
    local r8_49 = r5_49.Params.ShowUIBloodStrength
    local r9_49 = r5_49.Params.SecondLevelBloodStrength
    if r6_49 == nil or r7_49 == nil or r8_49 == nil or r9_49 == nil then
      return 
    end
    local r10_49 = r0_49.IsNearDeath
    local r11_49 = 0.0001
    if r11_49 < r3_49 and r3_49 < r8_49 then
      r11_49 = r4_49 <= 0
    else
      goto label_45	-- block#11 is visited secondly
    end
    r0_49.IsNearDeath = r11_49
    r11_49 = UIManager(r0_49):GetUIObj(UIConst.BattleNearDeathPCName)
    local r12_49 = nil
    if not r10_49 and r0_49.IsNearDeath then
      r12_49 = "In"
    end
    if r10_49 and r0_49.IsNearDeath then
      r12_49 = "Loop"
    end
    if r10_49 and not r0_49.IsNearDeath then
      r12_49 = "Out"
    end
    if r0_49.IsNearDeath then
      if r11_49 == nil then
        r11_49 = UIManager(r0_49):LoadUINew(UIConst.BattleNearDeathPCName)
      end
      if r11_49 ~= nil then
        local r13_49 = nil
        local r14_49 = nil	-- notice: implicit variable refs by block#[33]
        if r9_49 < r3_49 then
          r14_49 = r6_49
          if r14_49 then
            ::label_94::
            r14_49 = r7_49
          end
        else
          goto label_94	-- block#28 is visited secondly
        end
        if r2_0.GetDeviceTypeByPlatformName() == "PC" then
          r13_49 = r11_49.Bg_1:GetDynamicMaterial()
        else
          r13_49 = r11_49.glassglow:GetDynamicMaterial()
        end
        if r13_49 ~= nil then
          r13_49:SetScalarParameterValue("Flash", r14_49)
        end
      end
    elseif r11_49 ~= nil and r10_49 then
      r11_49:BindToAnimationFinished(r11_49.Out, function()
        -- line: [799, 802] id: 50
        r11_49:UnbindAllFromAnimationFinished(r11_49.Out)
        UIManager(r0_49):UnLoadUI(UIConst.BattleNearDeathPCName)
      end)
      EMUIAnimationSubsystem:EMPlayAnimation(r11_49, r11_49.Out)
    end
    -- close: r6_49
  end
end
function r11_0.UpdateUIMode(r0_51, r1_51)
  -- line: [809, 816] id: 51
  r0_51.UIModePlatform = r1_51
  local r2_51 = UIManager(r0_51):GetUIObj("SceneStartUI")
  if r2_51 ~= nil then
    r2_51:OnCloseOtherUI()
    r2_51:InitMainPage()
  end
end
function r11_0.Landed(r0_52)
  -- line: [818, 826] id: 52
  if not r0_52:PlayerLanded() then
    return 
  end
  if r0_52:CharacterInTag("Shooting") and r0_52:CheckCanEnterTag("LandHeavy") and r0_52.PlayerAnimInstance.FallingSpeed < r0_0.LandHeavySpeed then
    r0_52:StopFire(true, false)
    r0_52:StopSkill(UE.ESkillStopReason.ActionCancel)
  end
end
function r11_0.Impending(r0_53)
  -- line: [828, 833] id: 53
  if not r0_53:PlayerImpending() then
    return 
  end
  r0_53.Overridden.Impending(r0_53)
end
function r11_0.StartSlide(r0_54)
  -- line: [835, 841] id: 54
  print(_G.LogTag, "StartSlideStartSlideStartSlide")
  r0_54:DoSlide()
  if r0_54.NeedSlideEvent then
    EventManager:FireEvent(EventID.OnSlidePressed)
  end
end
function r11_0.PressDodge(r0_55)
  -- line: [843, 846] id: 55
  r0_55.bSprintPressed = true
  r0_55:StartDodge()
end
function r11_0.StartDodge(r0_56)
  -- line: [848, 853] id: 56
  r0_56:DoDodge()
  if r0_56.NeedAvoidEvent then
    EventManager:FireEvent(EventID.OnAvoidPressed)
  end
end
function r11_0.ApplyHitFlyDown(r0_57)
  -- line: [860, 864] id: 57
  r0_57:ResetCapSize()
  r0_57:RealStopSlide(true)
  r0_57.Super.ApplyHitFlyDown(r0_57)
end
function r11_0.ShowPlayerDeadUI(r0_58)
  -- line: [887, 894] id: 58
  local r1_58 = r0_58:GetCurRecoveryUIName()
  if r1_58 then
    local r2_58 = UIManager(r0_58):LoadUINew(r1_58)
    r2_58:OnMainCharacterInitReady()
    r2_58:InitResurgenceUI(r0_58.Eid)
  end
end
function r11_0.IsDeadDuringQuest(r0_59)
  -- line: [896, 899] id: 59
  local r1_59 = GWorld.StoryMgr:GetCurrentStoryNode()
  return r1_59 and r1_59.bDeadTriggerQuestFail
end
function r11_0.HandleDeadDuringQuest(r0_60)
  -- line: [901, 913] id: 60
  local r2_60 = GWorld.StoryMgr:GetResurgencePointInfo()
  local r3_60 = 1.8
  if r2_60 then
    r0_60:AddTimer(r3_60, function()
      -- line: [906, 908] id: 61
      r0_60:RequestDeadAsyncTravel(r2_60)
    end)
  else
    DebugPrint("Tianyi@ 找不到复活点，走区域复活逻辑")
    r0_60:TryEnterDying()
  end
end
function r11_0.RealOnDead_Lua(r0_62, r1_62, r2_62, r3_62)
  -- line: [915, 953] id: 62
  local r4_62 = UE4.UGameplayStatics.GetGameMode(r0_62)
  if r4_62 ~= nil then
    r4_62:NotifyGameModePlayerDead(r0_62)
  end
  DebugPrint("Tianyi@ Player Die!!!!!!!!!!")
  r0_62:SetHoldCrouch(false)
  r0_62:StopFire(false, false)
  r0_62:ZeroComboCount(UE4.EClearComboReason.Dead)
  local r5_62 = UE4.UGameplayStatics.GetGameState(r0_62)
  if r4_62 and (r5_62.GameModeType == "Training" or r5_62.GameModeType == "Trial") then
    local r6_62 = 0
    local r7_62 = r5_62:GetTargetPoint("Training")
    if r7_62 then
      Battle(r0_62):TeleportRecovery(r0_62.Eid, r7_62:K2_GetActorLocation(), r7_62:K2_GetActorRotation(), r6_62)
    else
      DebugPrint("Tianyi@ 找不到训练场复活点")
      Battle(r0_62):TeleportRecovery(r0_62.Eid, FVector(2148.795166, -4042.718262, 2133), FRotator(0, 0, 0), r6_62)
    end
  elseif r0_62:IsDeadDuringQuest() then
    DebugPrint("Tianyi@ 玩家在任务中死亡")
    r0_62:HandleDeadDuringQuest()
  else
    r0_62:TryEnterDying()
  end
  local r6_62 = GWorld:GetAvatar()
  if r0_62:IsMainPlayer() and r6_62 and r6_62:IsInRougeLike() then
    r6_62:SavePlayerSlice({
      Type = r0_0.RougeSliceInfoType.RecoverCount,
      Value = {
        RecoveryCount = r0_62:GetRecoveryCount() + 1,
      },
    })
  end
end
function r11_0.OnTriggerFallTrigger(r0_63, r1_63, r2_63)
  -- line: [955, 960] id: 63
  if r1_63 and r2_63 then
    r1_63:OnTriggerFallTrigger(r2_63, r0_63, UE4.URuntimeCommonFunctionLibrary.GetPlayerControllerIndex(r0_63, r0_63:GetController()))
  end
end
function r11_0.HandleRemoveModPassives(r0_64)
  -- line: [961, 965] id: 64
  r0_64:ClearWeaponModPassive()
  r0_64:RemovePassiveEffectByRole(r0_64:GetController():GetRoleId())
end
function r11_0.TriggerFallingCallable(r0_65, r1_65, r2_65, r3_65, r4_65, r5_65, r6_65)
  -- line: [967, 1064] id: 65
  DebugPrint("OtherActor is Falling Dead. TriggeredByPlayer. ActorName:", r0_65:GetName(), ", UnitId:", r0_65.UnitId, ", Eid:", r0_65.Eid, ", CreatorId:", r0_65.CreatorId, ", CreatorType:", r0_65.CreatorType, ", BornPos:", r0_65.BornPos, "MaxDis", r3_65, "DefaultEnable", r4_65, "DefaultTransform", r2_65)
  if r0_65.FromOtherWorld then
    DebugPrint("OtherActor is player, but from other world  ActorName:", r0_65:GetName())
    return 
  end
  if not r0_65:IsMainPlayer() then
    DebugPrint("OtherActor is player, but not main player  ActorName:", r0_65:GetName())
    return 
  end
  if not r0_65.InitSuccess then
    DebugPrint("OtherActor is player, but not InitSuccess  ActorName:", r0_65:GetName())
    return 
  end
  r1_65:TriggerDungeonComponentFun("OnPlayerTriggerFallTrigger")
  r0_65:OnTriggerFallTrigger(r1_65, r5_65)
  local r7_65 = r1_65:TryGetSafeLocation(r0_65, r3_65)
  local r8_65 = nil
  if r0_65:CharacterInTag("Interactive") then
    r0_65:LeaveInteractiveTag("Interactive")
  end
  if r0_65.EnterRegion then
    r0_65:StopAllCurrentMove()
  end
  if r4_65 ~= true then
    local r9_65 = r1_65.EMGameState.GameModeType
    if r9_65 == "Temple" then
      local r10_65, r11_65 = r1_65.EMGameState:BackToTempleArchivePoint()
      if r10_65 then
        r7_65 = r10_65 + FVector(0, 0, r0_65.CapsuleComponent:GetScaledCapsuleHalfHeight())
        r8_65 = r11_65
      else
        DebugPrint("ERROR:BackToTempleArchivePoint ArchivePointLocation is nil")
      end
    elseif r9_65 == "Party" then
      local r10_65, r11_65 = r1_65.EMGameState:BackToPartyArchivePoint(r0_65)
      if r10_65 then
        r7_65 = r10_65 + FVector(0, 0, r0_65.CapsuleComponent:GetScaledCapsuleHalfHeight())
        r8_65 = r11_65
        r1_65:OnPartyPlayerTriggerFallTrigger(r0_65.Eid)
      else
        DebugPrint("ERROR:BackToPartyArchivePoint ArchivePointLocation is nil")
      end
    end
  end
  if not r4_65 and r7_65 ~= FVector(0, 0, 0) then
    r0_65:K2_SetActorLocation(r7_65, false, nil, false)
    if r8_65 ~= nil then
      r0_65:K2_SetActorRotation(r8_65, false)
    end
  else
    r0_65:K2_SetActorLocation(r2_65.Translation, false, nil, false)
    r0_65:K2_SetActorRotation(r2_65.Rotation:ToRotator(), false)
  end
  r0_65:GetMovementComponent():ForceClientUpdate()
  local r11_65 = {}
  r0_65:EnableCheckOverlapPush(r11_65)
  if r0_65.OnTriggerFallingCallable then
    r0_65:OnTriggerFallingCallable()
  end
  if IsDedicatedServer(r0_65) then
    local r9_65 = r0_65.RPCComponent
    if r8_65 then
      r11_65 = r8_65 and r2_65.Rotation:ToRotator()
    else
      goto label_183	-- block#29 is visited secondly
    end
    r9_65:OnPlayerFallTriggerClient(r11_65)
  else
    r0_65:ShowBlackScreenFade_StandAlone(r6_65)
  end
  if r0_65.EnterRegion then
    r0_65:ForceReSyncLocation()
  end
  r0_65:GetController():SetControlRotation(r0_65:K2_GetActorRotation())
  r0_65:Landed()
end
function r11_0.TriggerWaterFallingCallable(r0_66, r1_66, r2_66, r3_66, r4_66)
  -- line: [1066, 1068] id: 66
  r0_66:TriggerFallingCallable(r1_66, r2_66, r3_66, r4_66)
end
function r11_0.ShowBlackScreenFade_StandAlone(r0_67, r1_67, r2_67)
  -- line: [1071, 1082] id: 67
  if r1_67 == "White" then
    UIManager(r0_67):ShowCommonBlackScreen({
      BlackScreenHandle = "BlackScreenFade",
      ScreenColor = "White",
      OutAnimationPlayTime = 1,
      IsPlayOutWhenLoaded = true,
    })
  else
    r0_67:NewBlackScreenFade(r2_67)
  end
end
function r11_0.TryToUpdateScreenEffect(r0_68, r1_68, r2_68)
  -- line: [1159, 1205] id: 68
  local r3_68 = r0_68:GetAttr("ES")
  if r2_68 > 0 then
    local r4_68 = r0_68:GetAttr("MaxES")
    if r4_68 ~= 0 and DataMgr.SystemUI[UIConst.BattleBrokenShieldPCName].Params.ShieldUIResetRate and DataMgr.SystemUI[UIConst.BattleBrokenShieldPCName].Params.ShieldUIResetRate < (r3_68 + r2_68) / r4_68 then
      r0_68.PlayBrokenShiledAnim = true
    end
    if r3_68 <= 0 and r0_68:IsMainPlayer() and r0_68.PlayBrokenShiledAnim then
      r0_68.PlayBrokenShiledAnim = false
      local r5_68 = DataMgr.SystemUI[UIConst.BattleBrokenShieldPCName]
      if r5_68 then
        local r6_68 = r5_68.Params.AnimName
        if r6_68 ~= nil then
          local r7_68 = UIManager(r0_68):PlayScreenEffectAnim(UIConst.LoadInConfig, UIConst.BattleBrokenShieldPCName, {
            {
              AnimName = r6_68,
              StartTime = 0,
              LoopNums = 1,
            }
          })
          local r8_68 = r3_0.NowTime()
          AudioManager(r0_68):PlayUISound(r7_68, "event:/ui/common/char_sheild_break", nil, nil)
          if r0_68.PreHitSoundTime == nil or r8_68 - r0_68.PreHitSoundTime >= 30 then
            r0_68.PreHitSoundTime = r8_68
            local r9_68 = FPlayFMODSoundStruct()
            r9_68.FMODEventPath, r9_68.SelectKey = AudioManager(r0_68):ContactPlayerStringPath(r0_68, "vo_be_hit_heavy")
            r9_68.EventKey = "vo_be_hit_heavy"
            r9_68.bStopWhenAttachedToDestoryed = true
            r9_68.bPlayAs2D = true
            local r10_68 = AudioManager(r0_68):PlayFMODSound_Sync(UE4.UAudioManager.SetObjectToFPlayFMODSoundStruct(r9_68, r0_68))
          end
        end
      end
    end
  end
end
function r11_0.SkillEnd(r0_69, r1_69, r2_69)
  -- line: [1207, 1217] id: 69
  if not r2_69 or r2_69 == 0 then
    return 
  end
  if not r0_69:GetSkill(r2_69) then
    return 
  end
  r0_69.Super.SkillEnd(r1_69, r2_69)
  r0_69:SetRotationRate("OnGround")
end
function r11_0.ResetWeaponHandDelay(r0_70)
  -- line: [1219, 1225] id: 70
  if not r0_70.KeepWeaponOnHand then
    return 
  end
  r0_70.KeepWeaponOnHand = false
  r0_70:RemoveTimer("KeepWeaponDelay")
end
function r11_0.InitPlayerUseSkillTimes_Internal(r0_71)
  -- line: [1291, 1303] id: 71
  if not GWorld:GetAvatar() then
    return 
  end
  for r6_71, r7_71 in pairs(r1_0:Get("bNeedCountPlayerSkillUsedTimesList", true) and {}) do
    r0_71.NeedCountPlayerSkillUsedTimesList:Add(r6_71, r7_71)
  end
  -- close: r2_71
  for r7_71, r8_71 in pairs(r1_0:Get("CountPlayerSkillUsedTimesList", true) and {}) do
    r0_71.CountPlayerSkillUsedTimesList:Add(r7_71, r8_71)
  end
  -- close: r3_71
end
function r11_0.GetPlayerUseSkillTimesFromCache(r0_72, r1_72)
  -- line: [1305, 1311] id: 72
  if not GWorld:GetAvatar() then
    return 
  end
  return (r1_0:Get("CountPlayerSkillUsedTimesList", true) and {})[r1_72] and 0
end
function r11_0.SavePlayerSkillUsedTimes(r0_73)
  -- line: [1340, 1346] id: 73
  if GWorld:GetAvatar() then
    r1_0:Set("bNeedCountPlayerSkillUsedTimesList", r0_73.NeedCountPlayerSkillUsedTimesList:ToTable(), true)
    r1_0:Set("CountPlayerSkillUsedTimesList", r0_73.CountPlayerSkillUsedTimesList:ToTable(), true)
  end
end
function r11_0.PressFire(r0_74)
  -- line: [1367, 1397] id: 74
  if not r0_74:CharacterInTag("LandHeavy") and not r0_74:CheckCanSkillTypeCancel(UE.ESkillType.Shooting) and r0_74:CheckForbidInput() then
    return 
  end
  if r0_74:CheckSkillOccupiedByProp(ESkillName.HeavyShooting) then
    r0_74.PropHoldShootTimer = r0_74:AddTimer(0.2, function()
      -- line: [1372, 1375] id: 75
      r0_74.PropEffectComponent.CurrentPropEffect:OnHoldShoot()
      r0_74.PropHoldShootTimer = nil
    end, false, 0, "PropHoldShoot")
  end
  if r0_74:CheckSkillOccupiedByProp(ESkillName.Fire) then
    r0_74.PropEffectComponent.CurrentPropEffect:OnShootPressed()
    return 
  end
  r0_74.bPressedFire = true
  if r0_74:CharacterHasAnyTag("OverHeat") or r0_74:CharacterHasAnyTag("NoBullet") then
    r0_74:TryFireOverLoad()
    r0_74:RemoveInputCache("Fire")
    return 
  end
  local r1_74 = r0_74:GetSkillByType(UE.ESkillType.HeavyShooting)
  if r1_74 and r1_74 ~= 0 and not r0_74.PropHoldShootTimer then
    r0_74:RemoveInputCache("Fire")
    r0_74.HoldShootingTimer = r0_74:AddTimer(0.2, r0_74.HoldShooting)
    return 
  end
  r0_74:StartFire("Fire")
  if r0_74.NeedFireEvent then
    EventManager:FireEvent(EventID.OnFirePressed)
  end
end
function r11_0.StartFire(r0_76, r1_76)
  -- line: [1399, 1436] id: 76
  -- notice: unreachable block#6
  if r0_76:CheckSkillOccupiedByProp(ESkillName.Fire) then
    return false
  end
  if r0_76:CheckSkillIsBan(ESkillName.Fire) then
    if not r0_76.CurrentMasterBan then
      local r2_76 = UIManager(r0_76):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, GText("UI_RANGED_FORBIDDEN"))
    else
      local r2_76 = false
    end
    return false
  end
  if r0_76:CheckSkillInActive(ESkillName.Fire) then
    return false
  end
  if not r0_76:CheckCanShoot(false) then
    return 
  end
  print(_G.LogTag, "StartFireStartFireStartFire", r1_76)
  if r0_76.PlayerAnimInstance then
    r0_76.PlayerAnimInstance.bPressedFire = true
  end
  local r2_76 = nil
  if r1_76 == "Fire" then
    r2_76 = r0_76:GetSkillByType(UE.ESkillType.Shooting)
  else
    r2_76 = r0_76:GetSkillByType(UE.ESkillType.HeavyShooting)
  end
  print(_G.LogTag, "StartFireStartFireStartFireStartFire", r2_76)
  local r4_76 = nil	-- notice: implicit variable refs by block#[22]
  if not r0_76:UseSkill(r2_76, 0) then
    r4_76 = false
    return r4_76
  end
  r0_76.AllowEnterShoot = false
  if r1_76 ~= "Fire" then
    r4_76 = "HeavyShooting"
    if not r4_76 then
      ::label_93::
      r4_76 = "Fire"
    end
  else
    goto label_93	-- block#21 is visited secondly
  end
  r0_76:RemoveInputCache(r4_76)
  return true
end
function r11_0.HoldShooting(r0_77)
  -- line: [1438, 1446] id: 77
  r0_77.bHoldingShooting = true
  if r0_77:CharacterInTag("Slide") then
    return 
  end
  r0_77:SetInputCache("HeavyShooting")
  r0_77:StartFire("HeavyShooting")
  r0_77.HoldShootingTimer = nil
end
function r11_0.RemoveHoldShootingTimer(r0_78)
  -- line: [1521, 1524] id: 78
  r0_78:RemoveTimer(r0_78.HoldShootingTimer)
  r0_78.HoldShootingTimer = nil
end
function r11_0.ReleaseFire(r0_79)
  -- line: [1526, 1543] id: 79
  if r0_79:CheckSkillOccupiedByProp(ESkillName.HeavyShooting) and r0_79.PropHoldShootTimer then
    r0_79:RemoveTimer("PropHoldShoot")
    r0_79.PropHoldShootTimer = nil
  end
  if r0_79:CheckSkillOccupiedByProp(ESkillName.Fire) then
    r0_79.PropEffectComponent.CurrentPropEffect:OnShootReleased()
    return 
  end
  if not r0_79.bHoldingShooting and r0_79.HoldShootingTimer then
    r0_79:SetInputCache("Fire")
    r0_79:StartFire("Fire")
  end
  r0_79:StopFire(false, true)
end
function r11_0.StopFire(r0_80, r1_80, r2_80)
  -- line: [1545, 1573] id: 80
  if r0_80.NeedFireReleaseEvent then
    EventManager:FireEvent(EventID.OnFireRelease)
  end
  if r1_80 and not r0_80.bPressedFire then
    return 
  end
  if not r1_80 then
    r0_80.bPressedFire = false
    r0_80.bHoldingShooting = false
  end
  r0_80:RemoveHoldShootingTimer()
  if r0_80.PlayerAnimInstance then
    r0_80.PlayerAnimInstance.bPressedFire = false
  end
  if r2_80 then
    return 
  end
  r0_80.ResetedWhenShoot = false
  if r0_80.PlayerAnimInstance then
    if r1_80 then
      r0_80.PlayerAnimInstance.StartShoot = false
      r0_80:DisableReloadWithoutShoot()
      r0_80:ShouldEnableHandIk()
    end
    r0_80.PlayerAnimInstance.StopShoot = false
    r0_80.PlayerAnimInstance.EnableAim = UE4.UKismetMathLibrary.Clamp(r0_80.PlayerAnimInstance.EnableAim + -1, 0, 1)
  end
end
function r11_0.AnimIdleStart(r0_81)
  -- line: [1600, 1605] id: 81
  if r0_81:CheckShouldEnterNormalIdle() then
    r0_81.PlayerAnimInstance:AnimNotify_IdleStartNew()
  end
  r0_81:TryEnterTalk()
end
function r11_0.EnterCrouchTag(r0_82)
  -- line: [1607, 1610] id: 82
  r0_82:TryEnterTalk()
end
function r11_0.CheckShouldEnterNormalIdle(r0_83)
  -- line: [1612, 1627] id: 83
  if not r0_83.PlayerAnimInstance then
    return false
  end
  if not r0_83.BuffManager then
    return true
  end
  local r1_83 = r0_83.BuffManager.CurrentIdleTag
  if r1_83 and r1_83 ~= "0" then
    return false
  end
  return true
end
function r11_0.EnterSkillTag(r0_84)
  -- line: [1639, 1647] id: 84
  r0_84.PreSkillId = r0_84.CurrentSkillId
  if r0_84:IsAnimCrouch() and r0_84.CurrentSkillId == r0_84:GetSkillByType(UE.ESkillType.SlideAttack) then
    return 
  end
  r0_84:ResetCapSize()
end
function r11_0.LeaveSkillTag(r0_85)
  -- line: [1649, 1651] id: 85
  r0_85:EnsureCondemnMonsterRecoverIdle()
end
function r11_0.EnsureCondemnMonsterRecoverIdle(r0_86)
  -- line: [1653, 1668] id: 86
  if not IsAuthority(r0_86) or not r0_86.PreSkillId then
    return 
  end
  local r1_86 = r0_86:GetSkill(r0_86.PreSkillId)
  if not r1_86 then
    return 
  end
  local r2_86 = r1_86:GetSkillType()
  if r2_86 and r2_86 == ESkillType.Condemn and r0_86.CondemnMonsterEid then
    local r3_86 = Battle(r0_86):GetEntity(r0_86.CondemnMonsterEid)
    if r3_86 and r3_86:IsCantLeaveDefeated() then
      r3_86:DefeatedRecoverToIdle(true)
    end
  end
end
function r11_0.EnterBulletJumpTag(r0_87)
  -- line: [1670, 1686] id: 87
  Battle(r0_87):TriggerBattleEvent(BattleEventName.EnterBulletJump, r0_87)
end
function r11_0.LeaveBulletJumpTag(r0_88, r1_88)
  -- line: [1688, 1691] id: 88
  Battle(r0_88):TriggerBattleEvent(BattleEventName.QuitBulletJump, r0_88)
  r0_88:SetPushEnemyInfo("BulletJump", false)
end
function r11_0.CheckKeepBoneHit(r0_89)
  -- line: [1711, 1720] id: 89
  local r1_89 = r0_89.PlayerAnimInstance:GetCurrentStateNameByStateMachineName("Movement")
  if r1_89 ~= "Idle" and r1_89 ~= "Run" then
    r0_89.PlayerAnimInstance.InBoneHit = false
    if r0_89.LuaTimerHandles.BoneHit ~= nil then
      r0_89:RemoveTimer(r0_89.LuaTimerHandles.BoneHit)
      r0_89.LuaTimerHandles.BoneHit = nil
    end
  end
end
function r11_0.ForbidRenderMainCamera(r0_90)
  -- line: [1722, 1728] id: 90
  r0_90.CharCameraComponent:SetOrthoNearClipPlane(100000)
  r0_90.CharCameraComponent:SetOrthoFarClipPlane(100001)
  r0_90.CharCameraComponent:SetOrthoWidth(1)
  r0_90.CharCameraComponent:SetProjectionMode(1)
end
function r11_0.AllowRenderMainCamera(r0_91)
  -- line: [1730, 1732] id: 91
  r0_91.CharCameraComponent:SetProjectionMode(0)
end
function r11_0.CheckNeedFootprint(r0_92)
  -- line: [1829, 1849] id: 92
  if r2_0.GetDeviceTypeByPlatformName(r0_92) == "Mobile" then
    return false
  end
  if IsStandAlone(r0_92) or r9_0.IsAutonomousProxy(r0_92) then
    local r1_92 = GWorld:GetAvatar()
    if r1_92 then
      if r1_92:CheckCurrentSubRegion() == true then
        print("need foot print")
        return true
      end
    else
      print("need foot print")
      return true
    end
  end
  print("not need foot print")
  return false
end
function r11_0.IsOpenNormalAim(r0_93)
  -- line: [1851, 1860] id: 93
  if not IsValid(r0_93.RangedWeapon) then
    return false
  end
  local r1_93 = r0_93:GetWeaponAimLockStyle()
  if r1_93 and r1_93 == "FieldAim" then
    return true
  end
  local r2_93 = r0_93.ChooseTargetFilter
  if r2_93 ~= nil then
    r2_93 = r0_93.LockTargetFilter ~= nil
  else
    goto label_21	-- block#7 is visited secondly
  end
  return r2_93
end
function r11_0.HoldToRecovery(r0_94)
  -- line: [1868, 1870] id: 94
  Battle(r0_94):Recovery(r0_94.Eid)
end
function r11_0.CommonRecoveryImpl(r0_95)
  -- line: [1872, 1879] id: 95
  r0_95.Super.CommonRecoveryImpl(r0_95)
  if IsClient(r0_95) or IsStandAlone(r0_95) then
    r0_95:ResetForbidTag("Battle")
    r0_95:RefreshClientSkillLogicComponents()
    r0_95:OnRecoverDissolve()
  end
end
function r11_0.Recovery(r0_96, ...)
  -- line: [1881, 1889] id: 96
  r11_0.Super.Recovery(r0_96, ...)
  if r0_96:IsInRideMove() then
    r0_96:DisableBattleMount(true)
  end
  if IsClient(r0_96) or IsStandAlone(r0_96) then
    r0_96:UseSkill(r0_0.PlayerRecoverySkill, 0)
  end
end
function r11_0.OnRealEnterDying(r0_97)
  -- line: [1891, 1901] id: 97
  r0_97.Super.OnRealEnterDying(r0_97)
  if not IsDedicatedServer(r0_97) and r0_97:IsMainPlayer() then
    r0_97:ShowPlayerDeadUI()
    r0_97:TryHideAllSkillUI()
    if r0_97.TeammateUI then
      r0_97.TeammateUI:OnDead()
    end
  end
end
function r11_0.OnRealDie(r0_98)
  -- line: [1904, 1911] id: 98
  DebugPrint("Tianyi@ Player real die, Eid = " .. r0_98.Eid)
  if IsAuthority(r0_98) then
    UE4.UGameplayStatics.GetGameMode(r0_98):DungeonFinish_OnPlayerRealDead({
      r0_98:GetController().AvatarEidStr
    })
  end
end
function r11_0.OnLanded(r0_99)
  -- line: [1914, 1928] id: 99
  if r0_99:IsExistTimer("PlayDeadMontage") then
    r0_99:RemoveTimer("PlayDeadMontage")
    r0_99:PlayHitMontage("Die")
  end
  if not r0_99:CharacterInTag("Shooting") and r0_99.PlayerAnimInstance and r0_99.PlayerAnimInstance.StartShoot then
    r0_99.PlayerAnimInstance.StartShoot = false
    r0_99.PlayerAnimInstance.FullBody = true
    r0_99:ShouldEnableHandIk()
  end
  if r0_99:CharacterInTag("GrabHit") then
    r0_99:OnGrabHitLanded()
  end
end
function r11_0.EnterDeadTag(r0_100)
  -- line: [1930, 1938] id: 100
  r0_100:AddForbidTag("Battle")
  r0_100:TrackDeadInfo()
  local r1_100 = r0_100:GetBattlePet()
  if not r1_100 then
    return 
  end
  r1_100:HideBattlePet("Dead", true)
end
function r11_0.LeaveDeadTag(r0_101)
  -- line: [1940, 1946] id: 101
  local r1_101 = r0_101:GetBattlePet()
  if not r1_101 then
    return 
  end
  r1_101:HideBattlePet("Dead", false)
end
function r11_0.EnterRecoveryTag(r0_102)
  -- line: [1948, 1950] id: 102
  r0_102:TrackRecoverInfo()
end
function r11_0.GetLogMask(r0_103)
  -- line: [1952, 1954] id: 103
  return _G.LogTag
end
function r11_0.SetLogMask(r0_104, r1_104)
  -- line: [1956, 1959] id: 104
  print("LogInfo", r1_104)
  _G.LogTag = r1_104
end
function r11_0.SetLogMask(r0_105, r1_105)
  -- line: [1961, 1964] id: 105
  print("LogInfo", r1_105)
  _G.LogTag = r1_105
end
function r11_0.GetLogMask(r0_106)
  -- line: [1966, 1968] id: 106
  return _G.LogTag
end
function r11_0.ReceiveSound(r0_107, r1_107, r2_107)
  -- line: [1978, 1980] id: 107
  r0_107.Overridden.ReceiveSound(r0_107, r1_107, r2_107)
end
function r11_0.GetCharSpringArmWorldResultLoc(r0_108)
  -- line: [1986, 1988] id: 108
  return r0_108.CharSpringArmComponent.bWorldResultLoc
end
function r11_0.GetNickName(r0_109)
  -- line: [2006, 2015] id: 109
  local r1_109 = GWorld:GetAvatar()
  if not r1_109 then
    return "夜航主角名"
  end
  if GWorld:IsStandAlone() then
    return r1_109.Nickname
  end
  return r0_109.PlayerState.PlayerName
end
function r11_0.CheckSkillInActive(r0_110, r1_110)
  -- line: [2017, 2023] id: 110
  local r2_110 = r0_110:GetController()
  if not r2_110 or not r2_110.CheckSkillInActive then
    return false
  end
  return r2_110:CheckSkillInActive(r1_110)
end
function r11_0.PickupFunctionDispatcher(r0_111, r1_111, r2_111, r3_111, r4_111, r5_111, r6_111)
  -- line: [2034, 2066] id: 111
  local r7_111 = Battle(r0_111)
  local r8_111 = r7_111:GetEntity(r4_111)
  local r9_111 = DataMgr.Drop[r1_111]
  if r9_111 then
    r7_111:TriggerBattleEvent(BattleEventName.OnGetDrop, r0_111, r1_111)
    if r9_111.UseEffectType then
      local r10_111 = "PickupTo" .. r9_111.UseEffectType
      if IsDedicatedServer(r0_111) then
        if rawget(r0_0.SavePickupType, r9_111.UseEffectType) and not GWorld.bDebugServer then
          local r11_111 = GWorld:GetDSEntity()
          if r11_111 then
            r11_111:PickUpToSave(r10_111, r2_111, r9_111, r1_111, r3_111, r4_111, r6_111)
          end
        elseif ItemUtils:IsServerCreate(r9_111.DropId) and r9_111.IsPickShare then
          UE4.UGameplayStatics.GetGameMode(r0_111):PickUpForAllPlayers(r10_111, r2_111, r9_111.UseParam, r1_111, r3_111, r5_111, r6_111)
        else
          r8_111[r10_111](r8_111, r2_111, r9_111.UseParam, r1_111, r3_111, r5_111, r6_111)
        end
      else
        r8_111[r10_111](r8_111, r2_111, r9_111.UseParam, r1_111, r3_111, r5_111, r6_111)
      end
    end
  end
end
function r11_0.SetDefaultWeapon(r0_112)
  -- line: [2069, 2092] id: 112
  if not IsAuthority(r0_112) then
    return 
  end
  local r1_112 = GWorld:GetAvatar()
  local r2_112 = nil
  for r7_112, r8_112 in pairs(r0_112.Weapons) do
    for r13_112, r14_112 in pairs(DataMgr.BattleWeapon[r7_112].WeaponTag) do
      if r14_112 == "Ultra" then
        r2_112 = r7_112
      end
    end
    -- close: r9_112
  end
  -- close: r3_112
  r0_112:ClearWeapon()
  r0_112:AddWeapon(r1_112.Weapons[r1_112.MeleeWeapon].WeaponId):UnBindWeaponFromHand()
  local r4_112 = r0_112:AddWeapon(r1_112.Weapons[r1_112.RangedWeapon].WeaponId)
  r4_112:ShouldHideWeapon(true, true)
  r4_112:UnBindWeaponFromHand()
  if r2_112 then
    r0_112:AddWeapon(r2_112)
  end
  r0_112:ChangeUsingWeaponByType("Melee")
end
function r11_0.HideMonsterCapsule(r0_113, r1_113)
  -- line: [2094, 2102] id: 113
  for r7_113, r8_113 in pairs(Battle(r0_113):GetAllEntities()) do
    if r8_113 and r8_113.IsMonster and r8_113:IsMonster() then
      r8_113.CapsuleComponent:SetHiddenInGame(r1_113, false)
    end
  end
  -- close: r3_113
end
function r11_0.ServerInteractiveMechanism(r0_114, r1_114, r2_114, r3_114, r4_114, r5_114, r6_114)
  -- line: [2119, 2150] id: 114
  print(_G.LogTag, "lxz ServerInteractiveMechanism", r1_114, r2_114)
  local r7_114 = Battle(r0_114):GetEntity(r1_114)
  if r5_114 then
    if r7_114.CheckMontageInteractive then
      r0_114:SetMechanismEid(r1_114, r7_114:CheckMontageInteractive())
    else
      r0_114:SetMechanismEid(r1_114, false)
    end
  end
  local r8_114 = nil
  if r7_114.CombatStateChangeComponent then
    if r6_114 ~= -1 then
      r7_114.RegionOnlineInteractiveMessage:Add(r0_114.Eid, r6_114)
    end
    print(_G.LogTag, "lxz ServerInteractiveMechanism222", r2_114, r3_114)
    r7_114:ChangeState("Interactive", r2_114, r3_114)
  else
    if r7_114:CharacterInTag("Defeated") then
      r7_114:Penalize(r2_114)
    else
      r7_114:OpenMechanism(r2_114)
    end
    if r7_114.InteractiveComponent then
      r8_114 = r7_114.InteractiveComponent.InteractiveTag
    else
      r8_114 = r7_114.InteractiveTag
    end
    r0_114:SetCharacterTag(r8_114)
  end
end
function r11_0.ServerDeInteractiveMechanism(r0_115, r1_115, r2_115, r3_115, r4_115, r5_115, r6_115, r7_115)
  -- line: [2152, 2174] id: 115
  print(_G.LogTag, "lxz ServerDeInteractiveMechanism", r2_115)
  local r8_115 = Battle(r0_115):GetEntity(r1_115)
  if not r8_115 or not r8_115.OpenMechanism then
    return 
  end
  if r6_115 then
    if r8_115.CheckMontageInteractive then
      r0_115:SetMechanismEid(0, r8_115:CheckMontageInteractive())
    else
      r0_115:SetMechanismEid(0, false)
    end
  end
  if r4_115 == nil or r4_115 ~= r0_0.ForceEndInteractive then
    print(_G.LogTag, "lxz ServerDeInteractiveMechanism2222", r2_115)
    r8_115:CloseMechanism(r2_115, r3_115)
  else
    r8_115:ForceCloseMechanism(r2_115, r3_115)
  end
  if r7_115 ~= -1 then
    r8_115.RegionOnlineInteractiveMessage:Remove(r0_115.Eid)
  end
end
function r11_0.LeaveInteractiveTag(r0_116, r1_116)
  -- line: [2175, 2185] id: 116
  if r1_116 ~= "Idle" and r0_116.MechanismEid ~= 0 then
    local r2_116 = Battle(r0_116):GetEntity(r0_116.MechanismEid)
    if r2_116 then
      local r3_116 = r2_116:GetComponentByClass(UChestInteractiveComponent:StaticClass())
      if r3_116 then
        r3_116:ForceEndInteractive(r0_116, true, r0_0.ForceEndInteractive)
      end
    end
  end
end
function r11_0.LeaveSeatingTag(r0_117, r1_117)
  -- line: [2187, 2190] id: 117
  r0_117:LeaveInteractiveTag(r1_117)
  r0_117.CapsuleComponent:SetCollisionResponseToChannel(ECollisionChannel.ECC_WorldStatic, ECollisionResponse.ECR_Block)
end
function r11_0.ReceiveEndPlay(r0_118, r1_118)
  -- line: [2192, 2210] id: 118
  if r0_118.ArmoryHelper then
    r0_118.ArmoryHelper:K2_DestroyActor()
  end
  r0_118:TryCloseAllSkillUI()
  r0_118:RefreshTeamMemberInfo("ReceiveEndPlay")
  EventManager:RemoveEvent(EventID.OnStartSkillFeature, r0_118)
  EventManager:RemoveEvent(EventID.SetDefaultWeapon, r0_118)
  EventManager:RemoveEvent(EventID.OnMainCharacterInitReady, r0_118)
  EventManager:RemoveEvent(EventID.OnCharacterInitSuitRecover, r0_118)
  EventManager:RemoveEvent(EventID.CloseLoading, r0_118)
  EventManager:RemoveEvent(EventID.OnLevelDeliverBlackCurtainEnd, r0_118)
  EventManager:RemoveEvent(EventID.OnRepBulletNum, r0_118)
  EventManager:RemoveEvent(EventID.OnChangeNickName, r0_118)
  EventManager:RemoveEvent(EventID.OnChangeTitle, r0_118)
  r0_118:UnBindControllerChangedDelegate()
end
function r11_0.UnBindControllerChangedDelegate(r0_119)
  -- line: [2212, 2215] id: 119
  UE4.UGameplayStatics.GetGameInstance(r0_119).OnPawnControllerChangedDelegates:Remove(r0_119, r0_119.OnPlayerControllerChanged)
end
function r11_0.GetLastSafeLocation(r0_120)
  -- line: [2248, 2250] id: 120
  return r0_120.LastSafeLocation
end
function r11_0.SetBrushStaticMeshScalarParameter(r0_121, r1_121)
  -- line: [2253, 2285] id: 121
  if r0_121.IsGetBrushStaticMesh == nil then
    r0_121.BrushStaticMesh = {}
    r0_121.IsGetBrushStaticMesh = false
  end
  if r0_121.IsGetBrushStaticMesh == false then
    local r2_121 = r0_0.BrushStaticMesh
    local r3_121 = TArray(AActor)
    UE4.UGameplayStatics.GetAllActorsOfClass(r0_121, AStaticMeshActor, r3_121)
    for r9_121, r10_121 in pairs(r3_121:ToTable()) do
      if r10_121.StaticMeshComponent ~= nil and r10_121.StaticMeshComponent.StaticMesh ~= nil then
        for r14_121 = 1, #r2_121, 1 do
          if r10_121.StaticMeshComponent.StaticMesh:GetName() == r2_121[r14_121] then
            table.insert(r0_121.BrushStaticMesh, r10_121.StaticMeshComponent)
          end
        end
      end
    end
    -- close: r5_121
    r0_121.IsGetBrushStaticMesh = true
  end
  for r6_121, r7_121 in pairs(r0_121.BrushStaticMesh) do
    local r8_121 = r7_121:CreateDynamicMaterialInstance(0)
    if IsValid(r8_121) then
      r8_121:SetScalarParameterValue("InteractiveScan", r1_121)
    end
    local r9_121 = r7_121:CreateDynamicMaterialInstance(1)
    if IsValid(r9_121) then
      r9_121:SetScalarParameterValue("InteractiveScan", r1_121)
    end
  end
  -- close: r2_121
end
function r11_0.AddDisableInputTag(r0_122, r1_122)
  -- line: [2287, 2292] id: 122
  r0_122.DisableInputTags:AddUnique(r1_122)
  if r0_122.DisableInputTags:Length() > 0 and r0_122:GetController() and r0_122:GetController():IsPlayerController() then
    r0_122:DisableInput(r0_122:GetController())
  end
end
function r11_0.RemoveDisableInputTag(r0_123, r1_123)
  -- line: [2294, 2301] id: 123
  if r0_123.DisableInputTags:Find(r1_123) then
    r0_123.DisableInputTags:RemoveItem(r1_123)
  end
  if r0_123.DisableInputTags:Length() <= 0 and r0_123:GetController() and r0_123:GetController():IsPlayerController() then
    r0_123:EnableInput(r0_123:GetController())
  end
end
function r11_0.RemoveAllDisableInputTag(r0_124)
  -- line: [2303, 2306] id: 124
  r0_124.DisableInputTags:Clear()
  r0_124:EnableInput(r0_124:GetController())
end
function r11_0.EnableInput(r0_125, r1_125)
  -- line: [2308, 2313] id: 125
  if r0_125.DisableInputTags:Length() > 0 then
    return 
  end
  r0_125.Overridden.EnableInput(r0_125, r1_125)
end
function r11_0.SwitchBattleShortcutKeysHidden(r0_126)
  -- line: [2379, 2384] id: 126
  local r2_126 = not r1_0:Get("BattleShortcutHudKeysHidden", true)
  r1_0:Set("BattleShortcutHudKeysHidden", r2_126, true)
  UIManager(r0_126):SetBattleShortCutHudKeysHidden(r2_126)
end
function r11_0.GetSafeRegionLocation(r0_127, r1_127)
  -- line: [2386, 2403] id: 127
  local r2_127 = {}
  local r3_127 = GWorld:GetAvatar()
  local r4_127 = r1_127 and r0_127:GetRecentSafeLocation()
  local r5_127 = r0_127:CheckLocationValid(r4_127)
  local r6_127 = r0_127:GetRegionId(r4_127)
  if r4_127 ~= r0_0.ZeroVector and r6_127 ~= -1 and r5_127 then
    r2_127.RegionId = r6_127
    r2_127.Location = r4_127
    r2_127.Rotation = r0_127:K2_GetActorRotation()
  else
    r2_127.RegionId = r3_127:GetLastRegionId()
    r2_127.Location = r3_127.LastRegionData:GetLocation()
    r2_127.Rotation = r3_127.LastRegionData:GetRotation()
  end
  return r2_127
end
function r11_0.ImmersionModel(r0_128)
  -- line: [2405, 2431] id: 128
  r0_128.Overridden.ImmersionModel(r0_128)
  r4_0.EnableShowBillboard = false
  local r1_128 = UIManager(r0_128)
  r1_128:HideAllComponentUI(r0_128.IsImmersionModel, r0_0.ImmersionModelHideTag)
  local r2_128 = USubsystemBlueprintLibrary.GetWorldSubsystem(r0_128, UNpcHeadUISubsystem)
  if r0_128.IsImmersionModel then
    require("EMLuaConst").IsHideJumpWord = true
    r1_128:AddUIToStateTagsCluster(1, "ImmersionModel", true)
    EventManager:AddEvent(EventID.OnAddWidgetComponent, r0_128, r0_128.OnAddWidgetComponent)
    if r2_128 then
      r2_128:HideAllNpcHeadUI(true, "ImmersionModel")
    end
    MissionIndicatorManager:TriggerAllIndicatorVisible(false)
  else
    require("EMLuaConst").IsHideJumpWord = false
    r1_128:AddUIToStateTagsCluster(1, "ImmersionModel")
    EventManager:RemoveEvent(EventID.OnAddWidgetComponent, r0_128)
    if r2_128 then
      r2_128:HideAllNpcHeadUI(false, "ImmersionModel")
    end
    MissionIndicatorManager:TriggerAllIndicatorVisible(true)
  end
end
function r11_0.OnAddWidgetComponent(r0_129, r1_129)
  -- line: [2433, 2441] id: 129
  local r2_129 = r1_129.WidgetComponent
  if r2_129 then
    local r3_129 = r2_129:GetWidget()
    if r3_129 then
      r3_129:Hide(r0_0.ImmersionModelHideTag)
    end
  end
end
function r11_0.UpdateBulletNumUI(r0_130)
  -- line: [2443, 2472] id: 130
  r0_130:AddDelayFrameFunc(function()
    -- line: [2445, 2471] id: 131
    if r0_130.TakeAimIndicator then
      r0_130.TakeAimIndicator:UpdateAmmoBarProgress(true)
    end
    local r0_131 = UIManager(r0_130)
    if r0_131 then
      if r0_130.UIModePlatform == "PC" then
        local r1_131 = r0_131:GetUIObj("BattleMain")
        if r1_131 ~= nil and r1_131.Char_Skill ~= nil and r1_131.Char_Skill.OnChargeWeaponBullet then
          r1_131.Char_Skill:OnChargeWeaponBullet()
        end
      elseif r0_130.UIModePlatform == "Mobile" then
        local r1_131 = r0_131:GetUIObj("BattleMain")
        if r1_131 ~= nil and r1_131.Char_Skill ~= nil then
          if r1_131.Char_Skill.Bullet.UpdatePlayerWeaponInfo then
            r1_131.Char_Skill.Bullet:UpdatePlayerWeaponInfo()
          end
          if r1_131.Char_Skill.AtkRanged.UpdateRangeWeaponButton then
            r1_131.Char_Skill.AtkRanged:UpdateRangeWeaponButton()
          end
        end
      end
    end
  end, 2, "UpdateBulletNumFunc")
end
function r11_0.UpdateSkillUIInfo(r0_132, r1_132)
  -- line: [2474, 2507] id: 132
  if IsDedicatedServer(r0_132) then
    return 
  end
  if r0_132.UIModePlatform == "PC" then
    local r2_132 = UIManager(r0_132):GetUIObj("BattleMain")
    if r2_132 ~= nil and r2_132.Char_Skill ~= nil then
      for r7_132, r8_132 in pairs(r1_132) do
        local r9_132 = r0_132:GetSkill(r8_132)
        if r9_132 then
          local r10_132 = r9_132.Data
          r2_132.Char_Skill:RefreshRoleTargetSkill(r10_132.SkillType, r9_132)
          DebugPrint("@zyh123", r8_132, r10_132.SkillType)
        end
      end
      -- close: r3_132
    end
  elseif r0_132.UIModePlatform == "Mobile" then
    local r2_132 = UIManager(r0_132):GetUIObj("BattleMain")
    if r2_132 ~= nil and r2_132.Char_Skill ~= nil then
      for r7_132, r8_132 in pairs(r1_132) do
        local r9_132 = r0_132:GetSkill(r8_132)
        if r9_132 then
          r2_132.Char_Skill:RefreshRoleTargetSkill(r9_132.Data.SkillType, r9_132)
        end
      end
      -- close: r3_132
    end
  end
end
function r11_0.SetESCMenuForbiddenState(r0_133, r1_133)
  -- line: [2510, 2512] id: 133
  r0_133.IsESCForbidden = r1_133 and false
end
function r11_0.GetESCMenuForbiddenState(r0_134)
  -- line: [2514, 2519] id: 134
  if r0_134.IsESCForbidden == nil then
    return false
  end
  return r0_134.IsESCForbidden
end
function r11_0.SetMaxMovingSpeed(r0_135, r1_135)
  -- line: [2521, 2526] id: 135
  r1_135 = math.max(0, r1_135)
  r0_135.PlayerSlideAtttirbute.NormalWalkSpeed = DataMgr.PlayerRotationRates.NormalWalkSpeed.ParamentValue[1] * r1_135
  r0_135.PlayerSlideAtttirbute.CrouchWalkSpeed = DataMgr.PlayerRotationRates.CrouchWalkSpeed.ParamentValue[1] * r1_135
  r0_135:SetWalkSpeed()
end
function r11_0.SetMaxMovingSpeedByInfo(r0_136, r1_136)
  -- line: [2528, 2531] id: 136
  r0_136.PlayerSlideAtttirbute.NormalWalkSpeed = r1_136.NormalWalk
  r0_136.PlayerSlideAtttirbute.CrouchWalkSpeed = r1_136.CrouchWalk
end
function r11_0.TryOpenSkillUI(r0_137, r1_137, r2_137)
  -- line: [2533, 2583] id: 137
  DebugPrint("TryOpenSkillUI: ", r1_137, r2_137)
  if not r0_137:IsMainPlayer() then
    return 
  end
  r1_137 = r0_137:GetReplacedCharUIId(r1_137)
  local r3_137 = r0_137:GetAttr("GradeLevel") and 0
  local r4_137 = DataMgr.BattleCharUI[r1_137][r3_137]
  if r2_137 or not r4_137.TriggerBuffId then
    local r5_137 = UE4.UGameplayStatics.GetGameInstance(r0_137)
    if IsValid(r5_137:GetSceneManager()) then
      local function r7_137()
        -- line: [2549, 2562] id: 138
        local r0_138 = r5_137:GetGameUIManager()
        if r0_138:GetUIObj(r4_137.UIName) then
          r0_138:UnLoadUI(r4_137.UIName)
        end
        r0_137.SkillUINames = r0_137.SkillUINames and {}
        r0_137.SkillUINames[r4_137.UIName] = true
        local r1_138 = r0_138:LoadUINew(r4_137.UIName, r0_137, r4_137.Params)
        if r1_138 and r1_138.InitBattleCharUI then
          r1_138:InitBattleCharUI(r1_137, r3_137)
        end
      end
      if r2_137 and r4_137.TriggerBuffDelay then
        r0_137:AddTimer_Combat(r4_137.TriggerBuffDelay, function()
          -- line: [2566, 2577] id: 139
          local r0_139 = r0_137.BuffManager and r0_137.BuffManager.Buffs
          if r0_139 then
            for r5_139, r6_139 in pairs(r0_139) do
              if r6_139.BuffId == r4_137.TriggerBuffId then
                r7_137()
                break
              end
            end
            -- close: r1_139
          end
        end, false, 0, nil, true)
      else
        r7_137()
      end
      -- close: r7_137
    end
    -- close: r5_137
  end
end
function r11_0.TryCloseSkillUI(r0_140, r1_140)
  -- line: [2585, 2609] id: 140
  DebugPrint("TryCloseSkillUI: ", r1_140)
  if not r0_140:IsMainPlayer() then
    return 
  end
  r1_140 = r0_140:GetReplacedCharUIId(r1_140)
  local r3_140 = DataMgr.BattleCharUI[r1_140][r0_140:GetAttr("GradeLevel") and 0]
  if r3_140 then
    local r6_140 = UE4.UGameplayStatics.GetGameInstance(r0_140):GetGameUIManager():GetUIObj(r3_140.UIName)
    if r6_140 then
      r6_140:RemoveSelf()
    end
    if r0_140.SkillUINames and r0_140.SkillUINames[r3_140.UIName] then
      r0_140.SkillUINames[r3_140.UIName] = nil
    end
  end
end
function r11_0.GetReplacedCharUIId(r0_141, r1_141)
  -- line: [2611, 2626] id: 141
  if r0_141.CurrentSkinId then
    local r2_141 = DataMgr.Skin[r0_141.CurrentSkinId]
    if r2_141 then
      local r3_141 = r2_141.BattleCharUIMap
      if r3_141 and r3_141[r1_141] then
        DebugPrint("gmy@BP_PlayerCharacter_C BP_PlayerCharacter_C:TryOpenSkillUI Skill Replaced", r1_141, r3_141[r1_141])
        r1_141 = r3_141[r1_141]
      end
    end
  end
  return r1_141
end
function r11_0.TryHideAllSkillUI(r0_142)
  -- line: [2628, 2648] id: 142
  if not r0_142:IsMainPlayer() then
    return 
  end
  local r1_142 = r0_142:GetAttr("GradeLevel") and 0
  local r2_142 = DataMgr.BattleChar[r0_142.CurrentRoleId]
  if r2_142.CharUIId then
    local r4_142 = UE4.UGameplayStatics.GetGameInstance(r0_142):GetGameUIManager()
    local r5_142 = DataMgr.BattleCharUI[r2_142.CharUIId][r1_142]
    if r5_142 then
      local r6_142 = r4_142:GetUIObj(r5_142.UIName)
      if r6_142 then
        r6_142:Hide()
      end
    end
  end
end
function r11_0.TryCloseAllSkillUI(r0_143)
  -- line: [2650, 2659] id: 143
  if r0_143.SkillUINames then
    for r5_143, r6_143 in pairs(r0_143.SkillUINames) do
      if r6_143 then
        UIManager(r0_143):UnLoadUINew(r5_143)
      end
    end
    -- close: r1_143
  end
  r0_143.SkillUINames = {}
end
function r11_0.TryShowAllSkillUI(r0_144)
  -- line: [2661, 2678] id: 144
  if not r0_144:IsMainPlayer() then
    return 
  end
  local r1_144 = r0_144:GetAttr("GradeLevel")
  local r2_144 = DataMgr.BattleChar[r0_144.CurrentRoleId]
  if r2_144.CharUIId then
    local r6_144 = UE4.UGameplayStatics.GetGameInstance(r0_144):GetGameUIManager():GetUIObj(DataMgr.BattleCharUI[r2_144.CharUIId][r1_144].UIName)
    if r6_144 then
      r6_144:Show()
    end
  end
end
function r11_0.LeaveRecoveryTag(r0_145, r1_145)
  -- line: [2680, 2682] id: 145
  r0_145:TryShowAllSkillUI()
end
function r11_0.TryEnterTalk(r0_146)
  -- line: [2684, 2691] id: 146
  if r0_146.EnterTalkDelegates then
    for r5_146, r6_146 in pairs(r0_146.EnterTalkDelegates) do
      r6_146()
    end
    -- close: r1_146
    r0_146.EnterTalkDelegates = nil
  end
end
function r11_0.SetEndPointInfo(r0_147, r1_147, r2_147, r3_147)
  -- line: [2693, 2697] id: 147
  r0_147.EndPointSeqEnable = r1_147
  r0_147.EndPointLocation = r2_147
  r0_147.EndPointRotation = r3_147
end
function r11_0.GetEndPointInfo(r0_148)
  -- line: [2699, 2701] id: 148
  return r0_148.EndPointSeqEnable, r0_148.EndPointLocation, r0_148.EndPointRotation
end
function r11_0.OnDungeonSettlement(r0_149, r1_149, r2_149, r3_149)
  -- line: [2703, 2761] id: 149
  local r4_149 = true
  if r1_149 then
    local r5_149 = GWorld.GameInstance.ScenePlayers[r2_149].CurrentWeaponType and "Armory"
    if r3_149 and r3_149.UseDefaultMontage then
      r5_149 = "Armory"
    end
    local r6_149 = GWorld.GameInstance.ScenePlayers[r2_149].CurrentWeaponMeleeOrRanged
    DebugPrint("BP_PlayerCharacter_C:OnDungeonSettlement WeaponType: ", r5_149, "WeaponMeleeOrRanged: ", r6_149)
    local r7_149 = "LevelFinish_" .. r5_149 .. "_Montage"
    r4_149 = r0_149:CheckLevelFinishMontagePath(r7_149)
    if not r4_149 then
      r7_149 = "LevelFinish_Armory_Montage"
    end
    local r8_149 = r0_149:GetBattleCharBodyType()
    local r9_149 = FVector(0, 0, 0)
    if r3_149 and r3_149.CameraParam then
      r9_149.X = r3_149.CameraParam[r8_149][1]
      r9_149.Y = r3_149.CameraParam[r8_149][2]
      r9_149.Z = r3_149.CameraParam[r8_149][3]
    end
    DebugPrint("BP_PlayerCharacter_C:OnDungeonSettlement BattleCharTag", r8_149, "CameraParam", r9_149)
    r0_149:K2_SetActorLocation(UE4.UKismetMathLibrary.TransformLocation(r0_149:GetTransform(), r9_149), false, nil, true)
    r0_149:PlayDungeonSettlementSimpleSkillFeature(false, false, false, false, true, true, r9_149, r0_0.SettlementCameraRotation)
    r0_149:K2_SetActorLocation(UE4.UKismetMathLibrary.TransformLocation(r0_149:GetTransform(), -r9_149), false, nil, true)
    r0_149:PlayActionMontage("Interactive/LevelFinish", r7_149, {})
    r0_149:SetEndPointOffset(r2_149, r3_149)
    DebugPrint("BP_PlayerCharacter_C:OnDungeonSettlement PlayActionMontage: ", r7_149)
    if r6_149 then
      r0_149:ChangeUsingWeaponByType(r6_149)
    end
  else
    local r5_149 = "LevelFinish_Fail_Montage"
    local r6_149 = r0_149:GetController()
    local r7_149 = r6_149:GetControlRotation()
    r6_149:SetControlRotation(FRotator(r7_149.Pitch, r0_149:K2_EMGetActorRotation().Yaw + 180, r7_149.Roll))
    r0_149:PlayActionMontage("Interactive/LevelFinish", r5_149, {})
    r0_149:ResetOnSetEndPoint()
  end
  r0_149:SetCharacterTag("LevelFinish")
  if r1_149 and GWorld.GameInstance.ScenePlayers[r2_149].CurrentWeaponType and r4_149 then
    r0_149.KeepWeaponOnHand = true
    if r0_149.WeaponPos ~= 2 then
      r0_149:BindWeaponToHand()
    end
  end
  r0_149:OnRecoverDissolve()
  local r5_149 = UIManager(r0_149):GetUI(r0_149:GetCurRecoveryUIName())
  if r5_149 then
    r5_149:ShowBattleMainUI()
  end
end
function r11_0.PlayDungeonSettlementFailDeadMontage(r0_150)
  -- line: [2763, 2776] id: 150
  local r1_150, r2_150 = r0_150:GetHitMontageFolderAndPrefix()
  if r1_150 ~= nil then
    local r3_150 = r1_150 .. "Combat/Hit/" .. r2_150 .. "Die" .. r0_0.MontageSuffix .. "." .. r2_150 .. "Die" .. r0_0.MontageSuffix
    local r4_150 = LoadObject(r3_150)
    if not r4_150 then
      DebugPrint("Error: Load Montage Failed!!!", r3_150)
      return 
    end
    r0_150.Mesh:SetHiddenInGame(true)
    r0_150.PartsMesh:SetHiddenInGame(true)
    r0_150.PlayerAnimInstance:Montage_Play(r4_150, 1, UE4.EMontagePlayReturnType.Duration, 3, true)
  end
end
function r11_0.CheckLevelFinishMontagePath(r0_151, r1_151)
  -- line: [2778, 2793] id: 151
  local r2_151 = UBlueprintPathsLibrary.ProjectContentDir()
  local r5_151 = DataMgr.Model[r0_151:GetCharModelComponent():GetCurrentModelId()].MontageFolder and ""
  local r6_151 = r4_151.MontagePrefix and ""
  if not r6_151 then
    return false
  end
  local r7_151 = string.gsub(r5_151, "/Game/", r2_151) .. "Interactive/LevelFinish/" .. r6_151 .. r1_151 .. ".uasset"
  DebugPrint("CheckLevelFinishMontagePath MontPath:", r7_151)
  if UBlueprintPathsLibrary.FileExists(r7_151) then
    return true
  end
  DebugPrint("CheckLevelFinishMontagePath: File not Exists")
  return false
end
function r11_0.OnDungeonSettlementByIndex(r0_152, r1_152, r2_152, r3_152, r4_152)
  -- line: [2795, 2820] id: 152
  local r5_152 = r2_152 and "Armory"
  if r4_152 and r4_152.UseDefaultMontage then
    r5_152 = "Armory"
  end
  local r6_152 = r3_152
  local r7_152 = "LevelFinish_" .. r5_152 .. "_Montage"
  local r8_152 = r0_152:CheckLevelFinishMontagePath(r7_152)
  if not r8_152 then
    r7_152 = "LevelFinish_Armory_Montage"
  end
  r0_152:PlayActionMontage("Interactive/LevelFinish", r7_152, {})
  r0_152:SetEndPointOffset(r1_152, r4_152)
  DebugPrint("BP_PlayerCharacter_C:OnDungeonSettlementByIndex PlayActionMontage: ", r7_152)
  if r6_152 then
    r0_152:ChangeUsingWeaponByType(r6_152)
  end
  r0_152:SetCharacterTag("LevelFinish")
  if r2_152 and r8_152 then
    r0_152.KeepWeaponOnHand = true
    if r0_152.WeaponPos ~= 2 then
      r0_152:BindWeaponToHand()
    end
  end
end
function r11_0.SetMainPlayerDungeonSettlementTransform(r0_153, r1_153, r2_153, r3_153)
  -- line: [2822, 2849] id: 153
  if r1_153 then
    r0_153:ResetIdle()
    local r6_153 = FHitResult()
    UE4.UKismetSystemLibrary.LineTraceSingle(r0_153, r2_153 + FVector(0, 0, r0_153.CapsuleComponent:GetUnscaledCapsuleHalfHeight()), r2_153 + FVector(0, 0, -500), ETraceTypeQuery.TraceScene, false, nil, EDrawDebugTrace.None, r6_153, true)
    r0_153:K2_SetActorLocationAndRotation(FVector(r2_153.X, r2_153.Y, r6_153.ImpactPoint.Z + r0_153.CapsuleComponent:GetUnscaledCapsuleHalfHeight()), r3_153, false, nil, true)
  else
    local r4_153 = UE4.UGameplayStatics.GetGameState(r0_153)
    if not GWorld:GetAvatar() then
      return 
    end
    r0_153:ResetIdle()
    local r7_153 = FHitResult()
    UE4.UKismetSystemLibrary.LineTraceSingle(r0_153, r2_153, r2_153 + FVector(0, 0, -500), ETraceTypeQuery.TraceScene, false, nil, EDrawDebugTrace.None, r7_153, true)
    r0_153:K2_SetActorLocation(FVector(r2_153.X, r2_153.Y, r7_153.ImpactPoint.Z + r0_153.CapsuleComponent:GetUnscaledCapsuleHalfHeight()), false, nil, true)
    r0_153:K2_SetActorRotation(r3_153, false)
  end
end
function r11_0.SetOtherPlayerDungeonSettlementTransform(r0_154)
  -- line: [2851, 2861] id: 154
  r0_154:ResetIdle()
  local r1_154 = r0_154:K2_GetActorLocation()
  local r4_154 = FHitResult()
  UE4.UKismetSystemLibrary.LineTraceSingle(r0_154, r1_154 + FVector(0, 0, r0_154.CapsuleComponent:GetUnscaledCapsuleHalfHeight()), r1_154 + FVector(0, 0, -500), ETraceTypeQuery.TraceScene, false, nil, EDrawDebugTrace.None, r4_154, true)
  r0_154:K2_SetActorLocation(FVector(r1_154.X, r1_154.Y, r4_154.ImpactPoint.Z + r0_154.CapsuleComponent:GetUnscaledCapsuleHalfHeight()), false, nil, true)
end
function r11_0.SetEndPointOffset(r0_155, r1_155, r2_155)
  -- line: [2863, 2872] id: 155
  local r3_155 = FVector(0, 0, 0)
  if r2_155 and r2_155.SettlementOffset then
    r3_155.X = r2_155.SettlementOffset[r1_155][1]
    r3_155.Y = r2_155.SettlementOffset[r1_155][2]
    r3_155.Z = r2_155.SettlementOffset[r1_155][3]
  end
  r0_155:K2_SetActorLocation(UE4.UKismetMathLibrary.TransformLocation(r0_155:GetTransform(), r3_155), false, nil, true)
end
function r11_0.ResetOnSetEndPoint(r0_156)
  -- line: [2874, 2878] id: 156
  r0_156.CharacterMovement.Velocity = FVector(0, 0, 0)
  r0_156:AddGravityModifier(UE4.EGravityModifierTag.AnimNotify, 0)
  r0_156:SetActorEnableCollision(false)
end
function r11_0.CheckCanRecovery(r0_157)
  -- line: [2977, 2985] id: 157
  if IsClient(r0_157) then
    local r1_157 = r0_157:GetRecoveryCount()
    local r2_157 = r0_157:GetRecoveryMaxCount()
    local r3_157 = nil	-- notice: implicit variable refs by block#[5]
    if r2_157 >= 0 then
      r3_157 = r1_157 < r2_157
    else
      goto label_14	-- block#4 is visited secondly
    end
    return r3_157
  else
    return r0_157.Super.CheckCanRecovery(r0_157)
  end
end
function r11_0.SetIsJumpPadLaunched(r0_158, r1_158)
  -- line: [3081, 3083] id: 158
  r0_158.PlayerAnimInstance.IsJumpPadLaunched = r1_158
end
function r11_0.SetIsJumpPadLaunching(r0_159, r1_159)
  -- line: [3085, 3087] id: 159
  r0_159.PlayerAnimInstance.IsJumpPadLaunching = r1_159
end
function r11_0.GetBattleExtraInfo(r0_160)
  -- line: [3089, 3169] id: 160
  local r1_160 = {}
  local r2_160 = r0_160:GetAttr("Hp")
  local r3_160 = r0_160:GetAttr("Sp")
  local r4_160 = {
    RecoveryCount = r0_160:GetRecoveryCount(),
    IsRealDead = false,
  }
  if r0_160:IsDead() then
    r2_160 = r0_160:GetAttr("MaxHp")
    r3_160 = r0_160:GetAttr("MaxSp")
    r4_160.RecoveryCount = math.min(r4_160.RecoveryCount + 1, r0_160:GetRecoveryMaxCount())
  end
  r1_160.RoleInfo = {
    Level = r0_160:GetAttr("Level"),
    Exp = r0_160:GetAttr("Exp"),
    PlayerHp = r2_160,
    PlayerSp = r3_160,
    DeathInfo = r4_160,
  }
  if r0_160.MeleeWeapon then
    r1_160.MeleeWeapon = {
      Level = r0_160.MeleeWeapon:GetAttr("Level"),
      Exp = r0_160.MeleeWeapon:GetAttr("Exp"),
    }
  end
  if r0_160.RangedWeapon then
    local r5_160 = {
      Level = r0_160.RangedWeapon:GetAttr("Level"),
      Exp = r0_160.RangedWeapon:GetAttr("Exp"),
      BulletNum = r0_160.RangedWeapon:GetAttr("BulletNum") and 0,
      MagazineBulletNum = r0_160.RangedWeapon:GetAttr("MagazineBulletNum") and 0,
    }
    r1_160.RangedWeapon = r5_160
  end
  if r0_160.UltraWeapons then
    r1_160.UltraWeapons = {}
    for r9_160, r10_160 in pairs(r0_160.UltraWeapons) do
      table.insert(r1_160.UltraWeapons, {
        Level = r10_160:GetAttr("Level"),
        Exp = r10_160:GetAttr("Exp"),
      })
    end
    -- close: r5_160
  end
  for r10_160, r11_160 in pairs(r0_160:GetPhantomTeammates(false, true)) do
    local r12_160 = r11_160:GetAttr("Hp")
    local r13_160 = r11_160:GetAttr("Sp")
    local r14_160 = {
      RecoveryCount = r11_160:GetRecoveryCount(),
      IsRealDead = false,
    }
    if r11_160:IsDead() then
      if r11_160:IsRealDead() then
        r14_160.IsRealDead = true
      else
        r14_160.RecoveryCount = math.min(r14_160.RecoveryCount + 1, r11_160:GetRecoveryMaxCount())
      end
    end
    r1_160["PhantomInfo" .. r10_160] = {}
    r1_160["PhantomInfo" .. r10_160].RoleInfo = {
      Level = r0_160:GetAttr("Level"),
      PlayerHp = r12_160,
      PlayerSp = r13_160,
      DeathInfo = r14_160,
    }
    local r15_160 = r11_160:GetPhantomWeapon()
    if r15_160:HasTag(CommonConst.WeaponType.RangedWeapon) then
      local r16_160 = r1_160["PhantomInfo" .. r10_160]
      local r17_160 = {
        BulletNum = r15_160:GetAttr("BulletNum") and 0,
        MagazineBulletNum = r15_160:GetAttr("MagazineBulletNum") and 0,
      }
      r16_160.RangedWeapon = r17_160
    end
  end
  -- close: r6_160
  return r1_160
end
function r11_0.GetCurPhantomInfo(r0_161)
  -- line: [3171, 3248] id: 161
  local r1_161 = GWorld:GetAvatar()
  if not r1_161 then
    return 
  end
  local r2_161 = {}
  local r3_161 = r0_161:GetPhantomTeammates()
  local r4_161 = {}
  local r5_161 = {}
  for r10_161, r11_161 in pairs(r3_161) do
    if r11_161:IsPhantom() and (r11_161.IsSpawnByResource or r11_161.IsSpawnBySquad) then
      local r12_161 = r11_161.MeleeWeapon
      local r13_161 = r11_161.RangedWeapon
      local r14_161 = nil
      if r12_161 then
        r14_161 = r12_161.WeaponId
      elseif r13_161 then
        r14_161 = r13_161.WeaponId
      end
      if r14_161 then
        r5_161[r14_161] = r11_161.CurrentRoleId
      end
      r4_161[r11_161.CurrentRoleId] = r11_161
    end
  end
  -- close: r6_161
  for r10_161, r11_161 in pairs(r1_161.Chars) do
    if r4_161[r11_161.CharId] then
      local r12_161 = {}
      for r18_161, r19_161 in pairs(r11_161:GetModSuit()) do
        if r19_161.ModEid and r1_161.Mods[r19_161.ModEid] then
          local r20_161 = r1_161.Mods[r19_161.ModEid]
          table.insert(r12_161, {
            ModId = r20_161.ModId,
            Level = r20_161.Level,
          })
        end
      end
      -- close: r14_161
      r2_161[r11_161.CharId] = {}
      r2_161[r11_161.CharId].Character = {
        CharId = r11_161.CharId,
        Level = r11_161.Level,
        ModSuit = r12_161,
      }
    end
  end
  -- close: r6_161
  for r10_161, r11_161 in pairs(r1_161.Weapons) do
    local r12_161 = r5_161[r11_161.WeaponId]
    if r12_161 and r2_161[r12_161] then
      local r13_161 = {}
      for r19_161, r20_161 in pairs(r11_161:GetModSuit()) do
        if r20_161.ModEid and r1_161.Mods[r20_161.ModEid] then
          local r21_161 = r1_161.Mods[r20_161.ModEid]
          table.insert(r13_161, {
            ModId = r21_161.ModId,
            Level = r21_161.Level,
          })
        end
      end
      -- close: r15_161
      r2_161[r12_161].Weapon = {
        WeaponId = r11_161.WeaponId,
        Level = r11_161.Level,
        ModSuit = r13_161,
      }
    end
  end
  -- close: r6_161
  return r2_161
end
function r11_0.RefreshTeamMemberInfo(r0_162, r1_162)
  -- line: [3250, 3282] id: 162
  if IsDedicatedServer(r0_162) then
    return 
  end
  if not GWorld:GetAvatar() or GWorld:IsStandAlone() or GameState(r0_162).PlayerArray:Num() <= 1 then
    return 
  end
  if not r0_162.PlayerState then
    return 
  end
  local r3_162 = GWorld:GetMainPlayer()
  if r3_162 and r3_162.Eid == r0_162.PlayerState.Eid then
    return 
  end
  if TeamController:GetModel():IsTeammateByAvatarEid(r0_162.PlayerState.AvatarEidStr) then
    r0_162.PlayerState.OnReceiveActorStateChangeDelegate:Broadcast(r0_162.PlayerState.Eid, r7_0.OverReach, true, r1_162 == "ReceiveBeginPlay")
  end
end
function r11_0.PreEnterStory(r0_163, r1_163)
  -- line: [3286, 3291] id: 163
  r0_163:CleanInputWhenEnterTalk()
  r0_163:ReleaseFire()
  r0_163.bInStory = true
  r0_163:SetStealth(true, "Story")
end
function r11_0.PreExitStory(r0_164, r1_164)
  -- line: [3293, 3296] id: 164
  r0_164.bInStory = false
  r0_164:SetStealth(false, "Story")
end
function r11_0._CheckCanChangeToMaster(r0_165, r1_165, r2_165)
  -- line: [3299, 3362] id: 165
  if not IsStandAlone(r0_165) then
    if r1_165 then
      GWorld.logger.error("联机情况下，不能切换女主")
    end
    return false
  end
  if r0_165:CheckSkillIsBan(ESkillName.SwitchMasterOrHero) then
    if r1_165 then
      GWorld.logger.error("禁用切换女主和切回去英雄技能")
    end
    return false
  end
  if r0_165:CheckSkillInActive(ESkillName.SwitchMasterOrHero) then
    if r1_165 then
      GWorld.logger.error("切换女主和切回去英雄技能未激活")
    end
    return false
  end
  local r3_165 = UE4.UGameplayStatics.GetGameInstance(r0_165)
  local r4_165 = GWorld.GameInstance:GetCurrentDungeonId()
  if r4_165 and r4_165 > 0 then
    if r1_165 then
      GWorld.logger.error("副本内，不能切换女主")
    end
    return false
  end
  local r5_165 = GWorld:GetAvatar()
  if not r5_165 then
    if r1_165 then
      GWorld.logger.error("没有连接服务器，不能切换女主")
    end
    return false
  end
  local r6_165 = r5_165:GetCurrentRegionId()
  if not r6_165 or r6_165 == 0 then
    if r1_165 then
      GWorld.logger.error("不在区域中或者区域编号出错，不能切换女主")
    end
    return false
  end
  if not DataMgr.SubRegion[r6_165] then
    if r1_165 then
      GWorld.logger.error("不在区域中或者区域编号出错，不能切换女主")
    end
    return false
  end
  return true
end
function r11_0.CheckCanChangeToMaster(r0_166, r1_166, r2_166)
  -- line: [3364, 3393] id: 166
  r0_166.CanChangeToMaster = r0_166:_CheckCanChangeToMaster(r1_166, true)
  if not r2_166 and (not r0_166:CanEnterInteractive() or not r0_166:CharacterInTag("Idle")) then
    if r1_166 then
      GWorld.logger.error("当前状态不允许切换女主")
    end
    r0_166.CanChangeToMaster = false
    return r0_166.CanChangeToMaster
  end
  local r3_166 = UE4.UGameplayStatics.GetGameMode(r0_166)
  if not IsValid(r3_166) then
    r0_166.CanChangeToMaster = false
    if r1_166 then
      GWorld.logger.error("当前游戏模式无效, 不能切换女主")
    end
  elseif r3_166:IsInDungeon() and r0_166:IsDungeonInBattle() then
    r0_166.CanChangeToMaster = false
  elseif r0_166:IsRegionInBattle() then
    r0_166.CanChangeToMaster = false
  end
  return r0_166.CanChangeToMaster
end
function r11_0.CheckCanChangeBackToHero(r0_167, r1_167)
  -- line: [3395, 3397] id: 167
  return r0_167:_CheckCanChangeToMaster(r1_167, false)
end
function r11_0.SwitchMasterOrHeroUIPerform(r0_168)
  -- line: [3399, 3407] id: 168
  if not IsValid(r0_168.BattleMainUI) then
    r0_168.BattleMainUI = UIManager(r0_168):GetUIObj("BattleMain")
  end
  if r0_168.BattleMainUI == nil or r0_168.BattleMainUI.Char_Skill == nil then
    return 
  end
  r0_168.BattleMainUI.Char_Skill:OnSwitchMasterOrHero()
end
function r11_0.ChangeToMasterUIPerform(r0_169)
  -- line: [3409, 3420] id: 169
  EventManager:FireEvent(EventID.ShowOrHideMainPlayerBloodUI, false, "ChangeRoleToMaster")
  if not IsValid(r0_169.BattleMainUI) then
    r0_169.BattleMainUI = UIManager(r0_169):GetUIObj("BattleMain")
  end
  if r0_169.BattleMainUI == nil or r0_169.BattleMainUI.Char_Skill == nil then
    return 
  end
  r0_169.BattleMainUI.Char_Skill:OnChangeToMaster()
end
function r11_0.ChangeBackToHeroUIPerform(r0_170)
  -- line: [3422, 3433] id: 170
  EventManager:FireEvent(EventID.ShowOrHideMainPlayerBloodUI, true, "ChangeRoleToMaster")
  if not IsValid(r0_170.BattleMainUI) then
    r0_170.BattleMainUI = UIManager(r0_170):GetUIObj("BattleMain")
  end
  if r0_170.BattleMainUI == nil or r0_170.BattleMainUI.Char_Skill == nil then
    return 
  end
  r0_170.BattleMainUI.Char_Skill:OnChangeBackToHero()
end
function r11_0.SwitchMasterOrHero(r0_171)
  -- line: [3435, 3452] id: 171
  r0_171:SwitchMasterOrHeroUIPerform()
  if r0_171.IsSwitchFuncInCD then
    return 
  end
  if r0_171.CurrentMasterBan then
    r0_171:ChangeBackToHero()
  else
    r0_171:ChangeToMaster(true)
  end
  r0_171.IsSwitchFuncInCD = true
  r0_171:AddTimer_Combat(1, function()
    -- line: [3449, 3451] id: 172
    r0_171.IsSwitchFuncInCD = false
  end, false, 0, "SwitchFuncCDTimer")
end
function r11_0.ChangeToMaster(r0_173, r1_173, r2_173)
  -- line: [3454, 3535] id: 173
  if not r0_173:CheckCanChangeToMaster(r1_173, r2_173) then
    return 
  end
  if r0_173.CurrentMasterBan then
    GWorld.logger.error("当前已经是主角状态，不能执行切主角操作")
    return 
  end
  local r3_173 = 111
  local r4_173 = GWorld:GetAvatar()
  local r5_173 = r4_173:GetCurrentRegionId()
  print(_G.LogTag, "CheckCanChangeToMaster", r5_173)
  if not r5_173 or DataMgr.SubRegion[r5_173] == nil then
    GWorld.logger.error("当前不在区域中，不能切换主角")
    return 
  end
  local r6_173 = DataMgr.SubRegion[r5_173].SwitchPlayer
  if not r6_173 then
    GWorld.logger.error("当前区域没有可切换角色，不能切换主角")
    return 
  end
  local r7_173 = 1
  if not r4_173 then
    GWorld.logger.error("没有正常登录，不能切换主角")
    return 
  end
  local r8_173 = {
    RoleInfo = {
      PlayerHp = r0_173:GetAttr("Hp"),
      PlayerSp = r0_173:GetAttr("Sp"),
      PlayerES = r0_173:GetAttr("ES"),
    },
  }
  local r9_173 = {}
  local r10_173 = r0_173.RangedWeapon
  if r10_173 then
    r10_173 = r0_173.RangedWeapon:GetAttr("BulletNum") and 0
  else
    goto label_90	-- block#13 is visited secondly
  end
  r9_173.BulletNum = r10_173
  r10_173 = r0_173.RangedWeapon
  if r10_173 then
    r10_173 = r0_173.RangedWeapon:GetAttr("MagazineBulletNum") and 0
  else
    goto label_101	-- block#16 is visited secondly
  end
  r9_173.MagazineBulletNum = r10_173
  r8_173.RangedWeapon = r9_173
  r0_173.HeroTempInfo = r8_173
  r4_173.HeroTempInfo = r0_173.HeroTempInfo
  if r6_173 == "Player" then
    r7_173 = r4_173.Sex
  else
    r7_173 = r4_173.WeitaSex
  end
  print(_G.LogTag, "ChangeToMaster", r3_173, r7_173, r6_173)
  r8_173 = DataMgr.Player2RoleId[r6_173]
  if not r8_173 then
    GWorld.logger.error("没有找到对应的主角信息，请检查导表")
    return 
  end
  r9_173 = r8_173[r7_173]
  if not r9_173 then
    GWorld.logger.error("对应性别没有角色，请检查导表")
    return 
  end
  r0_173:ChangeRole(r9_173, nil)
  r0_173:RealChangeUsingWeapon(nil)
  r0_173:ClearAllSuitItem()
  r0_173:BanSkills()
  r0_173.CurrentMasterBan = true
  if r4_173 then
    r4_173.CurrentMasterBan = true
  end
  r0_173:CombindTwoKeyToOneCommand("Skill3", "SwitchMaster")
  r0_173:ChangeToMasterUIPerform()
  r0_173:DisableBattleWheel()
  r10_173 = r0_173:GetBattlePet()
  if r10_173 then
    r10_173:HideBattlePet("Master", true)
  end
end
function r11_0.ChangeBackToHero(r0_174)
  -- line: [3537, 3558] id: 174
  if not r0_174:CheckCanChangeBackToHero(true) then
    return 
  end
  if not IsValid(UE4.UGameplayStatics.GetGameMode(r0_174)) then
    return 
  end
  if not r0_174.CurrentMasterBan then
    GWorld.logger.error("当前不是女主状态，不能从女主切回军械库角色")
    return 
  end
  r0_174:RecoverBanSkills()
  r0_174.NotChangeRoleTips = true
  r0_174:RecoverHeroInfo()
  r0_174:ChangeRole()
  r0_174.NotChangeRoleTips = false
  r0_174:WithChangeBackToHero()
end
function r11_0.WithChangeBackToHero(r0_175)
  -- line: [3560, 3571] id: 175
  r0_175:SeparateTwoKeyToOneCommand("Skill3", "SwitchMaster")
  r0_175:ChangeBackToHeroUIPerform()
  r0_175:EnableBattleWheel()
  local r1_175 = r0_175:GetBattlePet()
  if r1_175 then
    r1_175:HideBattlePet("Master", false)
  end
end
function r11_0.RecoverHeroInfo(r0_176)
  -- line: [3573, 3585] id: 176
  local r1_176 = GWorld:GetAvatar()
  local r2_176 = r0_176.HeroTempInfo and r1_176.HeroTempInfo
  if r2_176 ~= nil then
    local r3_176 = GWorld:GetAvatar()
    r0_176:GetController():SetAvatarInfo(r2_0.ObjId2Str(r3_176.Eid), AvatarUtils:UpdateBattleInfo(AvatarUtils:GetDefaultBattleInfo(r3_176), r2_176))
    r0_176.HeroTempInfo = nil
    r3_176.HeroTempInfo = nil
  end
end
function r11_0.RecoverBanSkills(r0_177)
  -- line: [3587, 3597] id: 177
  print(_G.LogTag, "RecoverBanSkills", r0_177.CurrentRoleId)
  if r0_177.CurrentMasterBan then
    r0_177:UnBanSkills()
    r0_177.CurrentMasterBan = false
    local r1_177 = GWorld:GetAvatar()
    if r1_177 then
      r1_177.CurrentMasterBan = false
    end
  end
end
function r11_0.OnBattleStateChanged(r0_178, r1_178)
  -- line: [3599, 3610] id: 178
  if not r1_178 then
    return 
  end
  if not r0_178.CurrentMasterBan then
    return 
  end
  print(_G.LogTag, "OnBattleStateChanged", r1_178)
  r0_178:ChangeBackToHero()
end
function r11_0.BanSkills(r0_179)
  -- line: [3611, 3622] id: 179
  local r1_179 = TArray(0)
  for r6_179, r7_179 in pairs(r0_0.AllSKillNames) do
    if not r0_179:CheckSkillInActive(r7_179) then
      r1_179:Add(r7_179)
    end
  end
  -- close: r2_179
  local r2_179 = r0_179:GetController()
  if r2_179 then
    r2_179:BanSkills(r1_179, "MasterBan")
  end
end
function r11_0.UnBanSkills(r0_180)
  -- line: [3624, 3629] id: 180
  local r1_180 = r0_180:GetController()
  if r1_180 then
    r1_180:UnBanSkills("MasterUnBan")
  end
end
function r11_0.RegionBanSkills(r0_181)
  -- line: [3630, 3642] id: 181
  local r1_181 = TArray(0)
  for r6_181, r7_181 in pairs(r0_0.AllSKillNames) do
    if not r0_181:CheckSkillInActive(r7_181) then
      r1_181:Add(r7_181)
    end
  end
  -- close: r2_181
  local r2_181 = r0_181:GetController()
  if r2_181 then
    r2_181:BanSkills(r1_181, "RegionBan")
  end
end
function r11_0.RegionUnBanSkills(r0_182)
  -- line: [3644, 3649] id: 182
  local r1_182 = r0_182:GetController()
  if r1_182 then
    r1_182:UnBanSkills("RegionUnBan")
  end
end
function r11_0.MoveAlongSplineBanSkills(r0_183)
  -- line: [3651, 3663] id: 183
  local r1_183 = TArray(0)
  for r6_183, r7_183 in pairs(r0_0.AllSKillNames) do
    if not r0_183:CheckSkillInActive(r7_183) then
      r1_183:Add(r7_183)
    end
  end
  -- close: r2_183
  r1_183:Add(ESkillName.SwitchMasterOrHero)
  local r2_183 = r0_183:GetController()
  if r2_183 then
    r2_183:BanSkills(r1_183, "MoveAlongSpline")
  end
end
function r11_0.MoveAlongSplineUnBanSkills(r0_184)
  -- line: [3665, 3670] id: 184
  local r1_184 = r0_184:GetController()
  if r1_184 then
    r1_184:UnBanSkills("MoveAlongSpline")
  end
end
function r11_0.ForbidActionWhileMoveAlongSpline(r0_185, r1_185)
  -- line: [3672, 3687] id: 185
  local r2_185 = TArray(0)
  r2_185:Add(ESkillName.Jump)
  r2_185:Add(ESkillName.Slide)
  r2_185:Add(ESkillName.BulletJump)
  r2_185:Add(ESkillName.Avoid)
  r2_185:Add(ESkillName.Crouch)
  local r3_185 = r0_185:GetController()
  if r3_185 then
    if r1_185 then
      r3_185:InActiveSkills(r2_185, "MoveAlongSpline")
    else
      r3_185:ActiveSkills(r2_185, "MoveAlongSpline")
    end
  end
end
function r11_0.ForbidSkillsInHooking(r0_186, r1_186)
  -- line: [3689, 3713] id: 186
  local r2_186 = {
    ESkillName.Fire,
    ESkillName.ChargeBullet,
    ESkillName.Attack,
    ESkillName.Jump,
    ESkillName.Avoid,
    ESkillName.Skill1,
    ESkillName.Skill2,
    ESkillName.Skill3,
    ESkillName.Slide
  }
  local r3_186 = TArray(0)
  for r8_186, r9_186 in pairs(r2_186) do
    r3_186:Add(r9_186)
  end
  -- close: r4_186
  local r4_186 = r0_186:GetController()
  if r4_186 then
    if r1_186 then
      r4_186:InActiveSkillsInHooking(r3_186)
    else
      r4_186:ActiveSkillsEndHooking(r3_186)
    end
  end
end
function r11_0.ForbidActiveSkills(r0_187, r1_187)
  -- line: [3715, 3722] id: 187
  r0_187:ForbidSkills(r1_187, {
    ESkillName.Skill1,
    ESkillName.Skill2,
    ESkillName.Skill3
  })
end
function r11_0.ForbidAllSkills(r0_188, r1_188)
  -- line: [3724, 3732] id: 188
  r0_188:ForbidSkills(r1_188, {
    ESkillName.Skill1,
    ESkillName.Skill2,
    ESkillName.Skill3,
    ESkillName.Passive
  })
end
function r11_0.ForbidMeleeSkills(r0_189, r1_189)
  -- line: [3734, 3742] id: 189
  r0_189:ForbidSkills(r1_189, {
    ESkillName.Attack,
    ESkillName.FallAttack,
    ESkillName.HeavyAttack,
    ESkillName.SlideAttack
  })
end
function r11_0.ForbidRangedSkills(r0_190, r1_190)
  -- line: [3744, 3751] id: 190
  r0_190:ForbidSkills(r1_190, {
    ESkillName.Fire,
    ESkillName.ChargeBullet,
    ESkillName.HeavyShooting
  })
end
function r11_0.ForbidSkills(r0_191, r1_191, r2_191)
  -- line: [3753, 3766] id: 191
  local r3_191 = TArray(0)
  for r8_191, r9_191 in pairs(r2_191) do
    r3_191:Add(r9_191)
  end
  -- close: r4_191
  local r4_191 = r0_191:GetController()
  if r4_191 then
    if r1_191 then
      r4_191:InActiveSkills(r3_191, "Ban")
    else
      r4_191:ActiveSkills(r3_191, "UnBan")
    end
  end
end
function r11_0.AfterLoading(r0_192, r1_192)
  -- line: [3768, 3840] id: 192
  if r0_192.AfterLoadingDone then
    return 
  end
  if r1_0:Get("ImmersionModel") then
    r0_192:ImmersionModel()
  end
  r0_192:RefreshCharUIByPlatform()
  local r3_192 = GWorld:GetAvatar()
  if r3_192 and r3_192:CheckSubRegionType(nil, CommonConst.SubRegionType.Home) then
    r0_192:CheckDraftCanProduce()
  end
  r0_192:SetActorHideTag("DeliveryMontage", false)
  local r4_192 = UE4.UGameplayStatics.GetGameInstance(r0_192)
  if r4_192 and r1_192 and r1_192 == r0_192.Eid and r4_192.ShouldPlayDeliveryEndMontage then
    local r8_192 = {
      OnNotifyBegin = function()
        -- line: [3793, 3797] id: 193
        DebugPrint("zwk OnDeliveryAfterLoadingMontageNotifyBegin")
        r0_192:RemoveDisableInputTag("DeliverMontage")
      end,
      OnInterrupted = function()
        -- line: [3798, 3802] id: 194
        DebugPrint("zwk OnDeliveryAfterLoadingInterrupted", r4_192.ShouldPlayDeliveryEndMontage)
        r0_192:RemoveDisableInputTag("DeliverMontage")
        r4_192.ShouldPlayDeliveryEndMontage = false
      end,
      OnCompleted = function()
        -- line: [3803, 3806] id: 195
        DebugPrint("zwk OnDeliveryAfterLoadingMontageCompleted", r4_192.ShouldPlayDeliveryEndMontage)
        r4_192.ShouldPlayDeliveryEndMontage = false
      end,
    }
    DebugPrint("zwk OnDeliveryAfterLoadingMontageBegin")
    if r3_192 and r3_192.IsInRegionOnline and r3_192.CurrentOnlineType then
      r0_192:ForceReSyncLocation()
      r3_192:SwitchOnlineState(r3_192.CurrentOnlineType, CommonConst.OnlineState.Normal)
    end
    r0_192:ResetIdle()
    r0_192:AddDisableInputTag("DeliverMontage")
    r0_192:PlayTeleportAction(r8_192, false, true, false)
    r0_192.Mesh:GetAnimInstance():Montage_JumpToSection("End")
    r0_192:AddTimer(2, function()
      -- line: [3824, 3831] id: 196
      if r0_192.DisableInputTags:Find("DeliverMontage") then
        DebugPrint("zwk RemoveDeliverTag")
      end
      r0_192:RemoveDisableInputTag("DeliverMontage")
      r0_192:SetActorHideTag("DeliveryMontage", false)
    end, false, 0)
  end
  r0_192.AfterLoadingDone = true
  r0_192:AddTimer(1, function()
    -- line: [3837, 3839] id: 197
    r0_192.AfterLoadingDone = false
  end)
end
function r11_0.GetIsInDelivery(r0_198)
  -- line: [3842, 3849] id: 198
  local r1_198 = UE4.UGameplayStatics.GetGameInstance(r0_198)
  local r2_198 = r1_198:GetLoadingUI()
  local r3_198 = r2_198 and r2_198.bIsInLoading
  local r4_198 = UIManager(r0_198):GetUIObj("BlackScreenXiaobai")
  return r3_198 and r4_198 and r1_198.ShouldPlayDeliveryEndMontage
end
function r11_0.LoadHitDirection(r0_199, r1_199, r2_199)
  -- line: [3879, 3887] id: 199
  r1_199.CurHitDirectionNum = r1_199.CurHitDirectionNum + 1
  RunAsyncTask(r0_199, "CreateHitDirectionHandler" .. r1_199.CurHitDirectionNum, function(r0_200)
    -- line: [3881, 3886] id: 200
    r1_199:AddToQueue(UE4.UGameplayStatics.GetGameInstance(r0_199):GetGameUIManager():LoadUIAsync("BattleHitDirection", r0_200, r2_199, r0_199))
  end)
end
function r11_0.DungeonOtherPlayerLeave(r0_201)
  -- line: [3889, 3899] id: 201
  if not r0_201:IsMainPlayer() and IsClient(r0_201) then
    EventManager:FireEvent(EventID.OnDungeonOtherPlayerLeave, r0_201)
    if UIManager(r0_201):GetUIObj("TeamToast") then
      UIManager(r0_201):UnLoadUINew("TeamToast")
    end
    UIManager(r0_201):LoadUINew("TeamToast", r0_201.PlayerState, false)
  end
end
function r11_0.SetCollisionProfileOverlapAll(r0_202, r1_202)
  -- line: [3901, 3923] id: 202
  DebugPrint("BP_PlayerCharacter_C:SetCollisionProfileOverlapAll", r1_202, r0_202.CachedPlayerCollisionProfile)
  if r0_202.CachedPlayerCollisionProfile ~= nil == r1_202 then
  end
  if r1_202 then
    r0_202.CachedPlayerCollisionProfile = r0_202.CapsuleComponent:GetCollisionProfileName()
    r0_202.CapsuleComponent:SetCollisionResponseToAllChannels(UE4.ECollisionResponse.ECR_Overlap)
    if r0_202.SkillBlockCapsule then
      r0_202.SkillBlockCapsuleCachedCollision = r0_202.SkillBlockCapsule:GetCollisionEnabled()
      r0_202.SkillBlockCapsule:SetCollisionEnabled(ECollisionEnabled.NoCollision)
    end
  else
    r0_202.CapsuleComponent:SetCollisionProfileName("Pawn", false)
    r0_202.CachedPlayerCollisionProfile = nil
    if r0_202.SkillBlockCapsule then
      r0_202.SkillBlockCapsule:SetCollisionEnabled(r0_202.SkillBlockCapsuleCachedCollision)
    end
  end
end
function r11_0.NeedArmoryHelper(r0_203)
  -- line: [3925, 3927] id: 203
  return GWorld:GetAvatar() ~= nil
end
function r11_0.RequestDeadAsyncTravel(r0_204, r1_204)
  -- line: [3928, 4064] id: 204
  r0_204:DisablePlayerInputInDeliver(true)
  local r2_204 = GWorld.GameInstance
  local r3_204 = r2_204:GetTalkContext()
  local r4_204 = UIManager(r2_204)
  local r5_204 = UE4.UGameplayStatics.GetGameState(r0_204)
  local r6_204 = r0_204:GetController()
  local r7_204 = false
  local r8_204 = false
  local r9_204 = r1_204.Transform
  local function r10_204()
    -- line: [3940, 3961] id: 205
    r4_204:HideCommonBlackScreen("DeadAsyncTravel")
    local r0_205 = r4_204:GetUIObj("MainTaskIndicator")
    if IsValid(r0_205) then
      r0_205:SetVisibility(UE4.ESlateVisibility.Visible)
    end
    local r1_205 = r2_204:GetSceneManager()
    local r2_205 = UE4.UGameplayStatics.GetGameMode(r0_204)
    local r3_205 = r2_205:GetLevelLoader()
    r1_205:ShowOrHideAllSceneGuideIcon(true)
    r0_204:EnableInput(r6_204)
    if IsValid(r3_205) then
      r3_205:RemoveArtLevelLoadedCompleteCallback(r2_205:GetLevelLoader():GetLevelIdByLocation(r9_204.Translation))
    end
    r0_204:DisablePlayerInputInDeliver(false)
    local r4_205 = GWorld.StoryMgr
    if r4_205 then
      r4_205:FailCurrentQuestWhenDead()
    end
  end
  local r14_204 = {
    BlackScreenHandle = "DeadAsyncTravel",
    BlackScreenText = GText(r1_204.FailBlackScreenText),
    InAnimationObj = r0_204,
    InAnimationPlayTime = r1_204.FadeInTime and nil,
    InAnimationCallback = function()
      -- line: [3963, 4052] id: 206
      local r0_206 = GWorld.GameInstance
      local r1_206 = r0_206:GetGameUIManager()
      r0_206:GetSceneManager():ShowOrHideAllSceneGuideIcon(false)
      local r3_206 = r1_206:GetUIObj("MainTaskIndicator")
      if IsValid(r3_206) then
        r3_206:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
      r0_204:DisableInput()
      r0_204:QuickRecovery()
      local r4_206 = UE4.UGameplayStatics.GetGameMode(r0_204)
      local function r5_206()
        -- line: [3976, 3982] id: 207
        r4_206:SetActorLocationAndRotationByTransform(0, r9_204, true)
        r0_204:SetSafeLocation()
        if r8_204 then
          r0_204:GetController():SetControlRotation(r0_204:K2_GetActorRotation())
        end
      end
      local r6_206 = r4_206:GetLevelLoader()
      r0_204.DurationEnd = false
      r0_204.TravelFinish = false
      local function r7_206()
        -- line: [3988, 3994] id: 208
        if r0_204.DurationEnd and r0_204.TravelFinish then
          r0_204.DurationEnd = nil
          r0_204.TravelFinish = nil
          r10_204()
        end
      end
      local function r8_206()
        -- line: [3995, 3998] id: 209
        r0_204.TravelFinish = true
        r7_206()
      end
      r4_206:AddTimer(r1_204.ContinueTime, function()
        -- line: [3999, 4002] id: 210
        r0_204.DurationEnd = true
        r7_206()
      end, false, 0, "CommonBlackScreenContinueTimer", true)
      if IsValid(r6_206) then
        local r10_206 = r4_206:GetLevelLoader():GetLevelIdByLocation(r9_204.Translation)
        local r11_206 = r4_206:GetLevelLoader():GetLevelIdByLocation(r0_204:K2_GetActorLocation())
        local r12_206 = r4_206:GetWCSubSystem()
        if r12_206 then
          if r7_204 then
            r12_206:RequestAsyncTravel(r3_204.Player, r9_204, {
              r3_204,
              r8_206
            }, r8_204)
          elseif r12_206:IsBigObjectLevelLoadedByLocation(r9_204.Translation) then
            r5_206()
            r8_206()
          else
            r12_206:RequestAsyncTravel(r3_204.Player, r9_204, {
              r3_204,
              r8_206
            }, r8_204)
          end
          return 
        end
        if r6_206:GetLevelLoaded(r10_206) then
          r5_206()
          r8_206()
          return 
        end
        if r10_206 ~= r11_206 then
          r6_206:BindArtLevelLoadedCompleteCallback(r10_206, function()
            -- line: [4039, 4042] id: 211
            r5_206()
            r8_206()
          end)
          r6_206:LoadArtLevel(r10_206)
        else
          r5_206()
          r8_206()
        end
      else
        r5_206()
        r8_206()
      end
    end,
    OutAnimationObj = r0_204,
    OutAnimationCallback = nil,
    OutAnimationPlayTime = r1_204.FadeOutTime and nil,
  }
  r4_204:ShowCommonBlackScreen(r14_204)
end
function r11_0.TeleportToCloestTeleportPoint(r0_212, r1_212, r2_212)
  -- line: [4066, 4139] id: 212
  local r3_212 = UE4.UGameplayStatics.GetGameMode(r0_212)
  if not r3_212 then
    return false
  end
  if not r3_212:IsInRegion() then
    return 
  end
  local r4_212 = r3_212:GetWCSubSystem()
  if not r4_212 then
    return 
  end
  local r5_212 = r3_212:GetRegionDataMgrSubSystem()
  if not r5_212 then
    return 
  end
  local r6_212 = UE4.UGameplayStatics.GetGameState(r0_212)
  local r7_212 = r0_212:K2_GetActorLocation()
  if r2_212 then
    r7_212 = r2_212
  end
  local r8_212 = 2100000000
  local r9_212 = nil
  for r14_212, r15_212 in pairs(r6_212.StaticCreatorMap) do
    if r15_212.UnitId == CommonConst.DeliveryAnchorMechanismUnitId and r15_212.UnitType == "Mechanism" then
      local r16_212 = r5_212:GetLuaDataIndex(r15_212.CreatedWorldRegionEid)
      if r16_212 >= 0 and r5_212.DataPool.RegionData[r16_212] and r5_212.DataPool.RegionData[r16_212].State and r5_212.DataPool.RegionData[r16_212].State.OpenState then
        local r18_212 = r7_212:DistSquared(r15_212:K2_GetActorLocation())
        if r18_212 < r8_212 then
          r8_212 = r18_212
          r9_212 = r15_212
        end
      end
    end
  end
  -- close: r10_212
  if not r9_212 then
    for r14_212, r15_212 in pairs(r5_212.CurRegionDeliverNew:ToTable()) do
      if r5_212:CheckDeliverMechanismIsDefault(r15_212) then
        r9_212 = r6_212.StaticCreatorMap:FindRef(r15_212)
        break
      end
    end
    -- close: r10_212
  end
  local r10_212 = 1
  if r9_212 then
    for r15_212, r16_212 in pairs(DataMgr.TeleportPoint) do
      if r16_212.StaticId == r9_212.StaticCreatorId then
        r10_212 = r16_212.TeleportPointPos
      end
    end
    -- close: r11_212
  end
  local r11_212 = r3_212:GetWCSubSystem()
  local r13_212 = nil	-- notice: implicit variable refs by block#[38]
  if r9_212 then
    r13_212 = r9_212:K2_GetActorLocation()
    if not r13_212 then
      ::label_131::
      r13_212 = r0_212.CurrentLocation
    end
  else
    goto label_131	-- block#37 is visited secondly
  end
  r13_212 = r3_212:GetLevelLoader():GetStartPointByManager(r11_212:GetParentLevelIdByLocation(r13_212), r10_212)
  r4_212:RequestAsyncTravel(r0_212, r13_212:GetTransform(), {
    r0_212,
    function()
      -- line: [4133, 4136] id: 213
      if r1_212 then
        r1_212()
      end
    end
  })
  return true
end
function r11_0.InpActEvt_GlobalSlow_K2Node_InputActionEvent_1(r0_214, r1_214)
  -- line: [4141, 4145] id: 214
  if TeamController and TeamController:GetTeamPopupBarOpen() then
    return 
  end
  DebugPrint(LXYTag, "BP_PlayerCharacter_C:InpActEvt_GlobalSlow_K2Node_InputActionEvent_1")
  r0_214.Overridden.InpActEvt_GlobalSlow_K2Node_InputActionEvent_1(r0_214, r1_214)
end
function r11_0.CallClientPrint_Lua(r0_215, r1_215)
  -- line: [4147, 4149] id: 215
  print(LogTag, "服务器的输出为:" .. tostring(r1_215))
end
function r11_0.SetEnableFallAtkDir(r0_216)
  -- line: [4151, 4167] id: 216
  local r1_216 = r1_0:Get("EnableFallAtkDir")
  if r1_216 == nil then
    local r2_216 = DataMgr.Option.FallAttackDirection
    local r3_216 = r2_216.DefaultValue
    if r2_0.GetDeviceTypeByPlatformName(r0_216) == "Mobile" and r2_216.DefaultValueM then
      r3_216 = r2_216.DefaultValueM
    end
    r1_216 = true
    if r3_216 == "False" then
      r1_216 = false
    end
  end
  r0_216:UpdateEnableFallAtkDir(r1_216)
end
function r11_0.UpdateEnableFallAtkDir(r0_217, r1_217)
  -- line: [4169, 4172] id: 217
  r0_217.Overridden.UpdateEnableFallAtkDir(r0_217, r1_217)
  r1_0:Set("EnableFallAtkDir", r1_217)
end
function r11_0.GetCurrentCharUI(r0_218)
  -- line: [4174, 4179] id: 218
  local r1_218 = DataMgr.BattleChar[r0_218.CurrentRoleId]
  if r1_218.CharUIId then
    return r0_218:GetCharUIObj(r1_218.CharUIId)
  end
end
function r11_0.GetCharUIObj(r0_219, r1_219)
  -- line: [4181, 4189] id: 219
  local r2_219 = GWorld.GameInstance:GetGameUIManager()
  if not IsValid(r2_219) then
    return nil
  end
  return r2_219:GetUIObj(DataMgr.BattleCharUI[r1_219][r0_219:GetAttr("GradeLevel") and 0].UIName)
end
function r11_0.K2_OnEndViewTarget(r0_220, r1_220)
  -- line: [4191, 4193] id: 220
  EventManager:FireEvent(EventID.OnEndViewTarget)
end
function r11_0.K2_OnBecomeViewTarget(r0_221, r1_221)
  -- line: [4194, 4198] id: 221
  rawset(r0_221, "Controller", r1_221)
  rawset(r1_221, "PlayerCameraManager", r1_221.PlayerCameraManager)
  EventManager:FireEvent(EventID.OnBecomeViewTarget)
end
function r11_0.SetRegionOnlineState(r0_222)
  -- line: [4200, 4216] id: 222
  local r1_222 = r1_0:Get("AutoJoin")
  if r1_222 == nil then
    local r2_222 = DataMgr.Option.AutoJoin
    local r3_222 = r2_222.DefaultValue
    if r2_0.GetDeviceTypeByPlatformName(r0_222) == "Mobile" and r2_222.DefaultValueM then
      r3_222 = r2_222.DefaultValueM
    end
    r1_222 = true
    if r3_222 == "False" then
      r1_222 = false
    end
  end
  r0_222:UpdateRegionOnlineState(r1_222)
end
function r11_0.UpdateRegionOnlineState(r0_223, r1_223)
  -- line: [4217, 4220] id: 223
  r0_223.bOpenRegionOnline = r1_223
  r1_0:Set("AutoJoin", r1_223)
end
function r11_0.GetPlayerGender(r0_224, r1_224)
  -- line: [4221, 4228] id: 224
  local r2_224 = GWorld:GetAvatar()
  if r2_224 then
    return r2_224.Sex
  else
    return 0
  end
end
function r11_0.GetTeamMemberEidArray(r0_225)
  -- line: [4230, 4247] id: 225
  local r1_225 = UE4.UGameplayStatics.GetGameInstance(r0_225)
  if not TeamController or not TeamController:GetModel() or not r1_225 then
    return {}
  end
  local r2_225 = r1_225:GetSceneManager()
  if not r2_225 or not r2_225.RegionOnlineCharacterInfo then
    return {}
  end
  local r3_225 = TeamController:GetModel():GetTeam() and {}
  local r4_225 = {}
  for r9_225, r10_225 in pairs(r3_225.Members and {}) do
    if r10_225 then
      table.insert(r4_225, r2_225.RegionOnlineCharacterInfo[r10_225.Uid])
    end
  end
  -- close: r5_225
  return r4_225
end
function r11_0.EnterRegionOnlineRegisterTeamEvent(r0_226, r1_226)
  -- line: [4249, 4282] id: 226
  if not TeamController or not TeamController:GetModel() then
    return 
  end
  local r2_226 = UE4.URegionSyncSubsystem.GetInstance(r0_226)
  if r1_226 then
    TeamController:RegisterEvent(r0_226, function(r0_227, r1_227, ...)
      -- line: [4255, 4278] id: 227
      DebugPrint("EnterRegionOnlineRegisterTeamEvent  " .. r1_227)
      local r2_227 = TeamCommon.EventId.TeamOnAddPlayer
      local r3_227 = nil	-- notice: implicit variable refs by block#[15]
      if r1_227 == r2_227 then
        ... = ... -- error: untaken top expr
        r3_227 = r2_226
        if r3_227 and r2_227 then
          r3_227 = r2_227.Eid
          if r3_227 then
            r2_226:SetOnlinePlayerTeamMember(r2_0.ObjId2Str(r2_227.Eid), true)
          end
        end
      else
        r2_227 = TeamCommon.EventId.TeamOnDelPlayer
        if r1_227 == r2_227 then
          ... = ... -- error: untaken top expr
          r3_227 = r2_226
          if r3_227 and r2_227 then
            r3_227 = r2_227.Eid
            if r3_227 then
              r2_226:SetOnlinePlayerTeamMember(r2_0.ObjId2Str(r2_227.Eid), true)
            end
          end
        elseif r1_227 == TeamCommon.EventId.TeamOnInit or r1_227 == TeamCommon.EventId.TeamLeave then
          r2_227 = r1_227 == TeamCommon.EventId.TeamOnInit
          ... = ... -- error: untaken top expr
          local r4_227 = r3_227 and TeamController:GetModel():GetTeam()
          if not r4_227 or not r4_227.Members then
            return 
          end
          for r9_227, r10_227 in pairs(r4_227.Members) do
            if r2_226 then
              r2_226:SetOnlinePlayerTeamMember(r2_0.ObjId2Str(r10_227.Eid), r2_227)
            end
          end
          -- close: r5_227
        end
      end
    end)
  else
    TeamController:UnRegisterEvent(r0_226)
  end
end
function r11_0.OnChangeNickName(r0_228, r1_228)
  -- line: [4284, 4287] id: 228
  r0_228:EnableHeadWidget("Name", false)
  r0_228:EnableHeadWidget("Name", true, r1_228)
end
function r11_0.OnChangeTitle(r0_229, r1_229, r2_229, r3_229)
  -- line: [4289, 4291] id: 229
  r0_229:RefreshTitle(r1_229, r2_229, r3_229)
end
function r11_0.EnableNameWidget(r0_230)
  -- line: [4293, 4313] id: 230
  EventManager:AddEvent(EventID.OnChangeNickName, r0_230, r0_230.OnChangeNickName)
  EventManager:AddEvent(EventID.OnChangeTitle, r0_230, r0_230.OnChangeTitle)
  local r1_230 = r0_230.HeadWidgetComponent == nil
  r0_230:InitHeadWidgetComponent()
  if r1_230 then
    r0_230:EnableHeadWidget("Name", false)
    r0_230:EnableHeadWidget("Title", false)
  end
  local r2_230 = GWorld:GetAvatar()
  if r2_230 then
    r0_230:OnChangeNickName(r2_230.Nickname)
    r0_230:OnChangeTitle(r2_230.TitleBefore, r2_230.TitleAfter, r2_230.TitleFrame)
  end
  if r0_230.HeadWidgetComponent then
    local r3_230 = r0_230.HeadWidgetComponent:GetWidget()
    if r3_230 then
      r3_230:SetUIVisibilityTag("MainPlayerDisableNameWidget", false)
    end
  end
end
function r11_0.DisableNameWidget(r0_231)
  -- line: [4315, 4327] id: 231
  if not r0_231.HeadWidgetComponent then
    return 
  end
  EventManager:RemoveEvent(EventID.OnChangeNickName, r0_231)
  EventManager:RemoveEvent(EventID.OnChangeTitle, r0_231)
  if r0_231.HeadWidgetComponent then
    local r1_231 = r0_231.HeadWidgetComponent:GetWidget()
    if r1_231 then
      r1_231:SetUIVisibilityTag("MainPlayerDisableNameWidget", true)
    end
  end
end
AssembleComponents(r11_0, {
  "GetDamageInstigatorCurrentAngle"
})
return r11_0
