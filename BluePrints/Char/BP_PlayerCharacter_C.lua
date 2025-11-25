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
UE4.URegionPlayerManagerSubsystem.SetOnlyShowTeammate(r1_0:Get("HidePlayer"))
local r10_0 = Class("BluePrints.Char.BP_CharacterBase_C")
r10_0._components = {
  "BluePrints.Char.CharacterComponent.PickupComponent",
  "BluePrints.Char.CharacterComponent.CameraComponent",
  "BluePrints.Char.CharacterComponent.CamPostProcessMgrComponent",
  "BluePrints.Char.CharacterComponent.AttackInputComponent",
  "BluePrints.Char.CharacterComponent.PlayerCommonInterface",
  "BluePrints.Char.CharacterComponent.NewBDCTrackComponent",
  "BluePrints.Char.CharacterComponent.CharacterPickupUseComponent",
  "BluePrints.Char.CharacterComponent.TeamRecoveryComponent",
  "BluePrints.Char.CharacterComponent.QTEComponent",
  "BluePrints.Char.CharacterComponent.CharMoveSyncMgr"
}
function r10_0.Initialize(r0_1, r1_1)
  -- line: [33, 35] id: 1
  r0_1:PlayerCharacterInitialize()
end
function r10_0.ReceiveBeginPlay(r0_2)
  -- line: [37, 81] id: 2
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
  r9_0.InitializeSettings()
  r0_2:RefreshTeamMemberInfo("ReceiveBeginPlay")
  if r0_2:IsMainPlayer() then
    EventManager:FireEvent(EventID.OnMainCharacterBeginPlay)
    local r1_2 = r1_0:Get("IsOpenHelperAim")
    local r2_2 = nil	-- notice: implicit variable refs by block#[4]
    if r1_2 == nil then
      r2_2 = true
      if not r2_2 then
        ::label_84::
        r2_2 = r1_2
      end
    else
      goto label_84	-- block#3 is visited secondly
    end
    r0_2.IsOpenHelperAim = r2_2
    r2_2 = r1_0:Get("IsOpenLockAim")
    local r3_2 = nil	-- notice: implicit variable refs by block#[7]
    if r2_2 == nil then
      r3_2 = true
      if not r3_2 then
        ::label_95::
        r3_2 = r2_2
      end
    else
      goto label_95	-- block#6 is visited secondly
    end
    r0_2.IsOpenLockAim = r3_2
    r0_2:UpdateOpenHelperAim(r0_2.IsOpenHelperAim)
    r0_2:InitGameSkillFaceTo()
    r0_2:SetEnableFallAtkDir()
    r0_2:SetRegionOnlineState()
  end
  r0_2:SetUpAllTimer()
  r0_2:SetGamepadFromCache()
  r0_2:SetMobileRotationFromCache()
  r0_2:SetMobileCameraSpringRate()
  r0_2:BindControllerChangedDelegate()
  local r1_2 = r0_2:GetController()
  if r1_2 then
    r1_2:ShowFlags("VisualizeSkyVisibilityLightmap", false)
    r1_2:ShowFlags("VisualizeBouncedSkyVisibilityLightmap", false)
  end
  r0_2:BindDropDistanceChanged()
end
function r10_0.BindDropDistanceChanged(r0_3)
  -- line: [83, 114] id: 3
  if not r0_3.BuffManager then
    return 
  end
  if not r0_3:K2_GetAttributesSet() then
    return 
  end
  local r1_3 = 530112
  local r2_3 = 10102104
  function r0_3.DropDistanceBuffAddDelegate()
    -- line: [92, 99] id: 4
    r0_3:K2_GetAttributesSet():GetAttrCpp("DropDistance")
    if IsClient(r0_3) then
      r0_3:AddTimer(0.05, function()
        -- line: [95, 97] id: 5
        r0_3:OnDropDistanceChangedByMod()
      end)
    end
  end
  r0_3.BuffManager:BP_BindOnBuffAdded(r1_3, r0_3.DropDistanceBuffAddDelegate)
  r0_3.BuffManager:BP_BindOnBuffAdded(r2_3, r0_3.DropDistanceBuffAddDelegate)
  function r0_3.DropDistanceBuffRemoveDelegate()
    -- line: [104, 111] id: 6
    r0_3:AddTimer(0.05, function()
      -- line: [105, 110] id: 7
      r0_3:K2_GetAttributesSet():GetAttrCpp("DropDistance")
      if IsClient(r0_3) then
        r0_3:OnDropDistanceChangedByMod()
      end
    end)
  end
  r0_3.BuffManager:BP_BindOnBuffRemoved(r1_3, r0_3.DropDistanceBuffRemoveDelegate)
  r0_3.BuffManager:BP_BindOnBuffRemoved(r2_3, r0_3.DropDistanceBuffRemoveDelegate)
end
function r10_0.BindControllerChangedDelegate(r0_8)
  -- line: [116, 119] id: 8
  UE4.UGameplayStatics.GetGameInstance(r0_8).OnPawnControllerChangedDelegates:Add(r0_8, r0_8.OnPlayerControllerChanged)
end
function r10_0.OnPlayerControllerChanged(r0_9, r1_9, r2_9)
  -- line: [121, 129] id: 9
  if r1_9 == r0_9 and r2_9 and r2_9:IsPlayerController() then
    if r0_9.DisableInputTags:Length() > 0 then
      r0_9:DisableInput(r0_9:GetController())
    else
      r0_9:EnableInput(r0_9:GetController())
    end
  end
end
function r10_0.SetGamepadFromCache(r0_10)
  -- line: [135, 150] id: 10
  if not r0_10:IsMainPlayer() then
    return 
  end
  local r1_10 = r1_0:Get("GamepadLayout")
  DebugPrint("@zyh 获取到的GamepadLayout", r1_10)
  if not r1_10 then
    local r2_10 = tonumber(DataMgr.Option.GamepadPreset.DefaultValue)
    r1_0:Set("GamepadLayout", r2_10)
    r0_10:InitGamepadSet(r2_10)
    r0_10:InitReplaceGamepadSet(r2_10)
  else
    r0_10:InitGamepadSet(r1_10)
    r0_10:InitReplaceGamepadSet(r1_10)
  end
end
function r10_0.SwitchGamepadSet(r0_11, r1_11)
  -- line: [152, 156] id: 11
  r0_11:InitGamepadSet(r1_11)
  r0_11:InitReplaceGamepadSet(r1_11)
  EventManager:FireEvent(EventID.OnSwitchGamepadSet)
end
function r10_0.SetMobileRotationFromCache(r0_12)
  -- line: [158, 172] id: 12
  if not r0_12:IsMainPlayer() then
    return 
  end
  local r1_12 = r1_0:Get("EnableMobileRotation")
  DebugPrint("@zyh 获取到的EnableMobileRotation", r1_12)
  if r1_12 == nil then
    local r3_12 = nil	-- notice: implicit variable refs by block#[6]
    if DataMgr.Option.EnableMobileRotation.DefaultValueM == "True" then
      r3_12 = true
      if not r3_12 then
        ::label_24::
        r3_12 = false
      end
    else
      goto label_24	-- block#5 is visited secondly
    end
    r1_0:Set("EnableMobileRotation", r3_12)
    r0_12.EnableMobileRotation = r3_12
  else
    r0_12.EnableMobileRotation = r1_12
  end
end
function r10_0.SetMobileCameraSpringRate(r0_13)
  -- line: [174, 180] id: 13
  if r2_0.GetDeviceTypeByPlatformName(r0_13) == "Mobile" then
    r0_13.CameraSpringChangeRate = 0.01
  else
    r0_13.CameraSpringChangeRate = 0.05
  end
end
function r10_0.SwitchEnableMobileRotation(r0_14, r1_14)
  -- line: [182, 185] id: 14
  r0_14.EnableMobileRotation = r1_14
  r1_0:Set("EnableMobileRotation", r1_14)
end
function r10_0.UpdateOpenHelperAim(r0_15, r1_15)
  -- line: [187, 191] id: 15
  r0_15.IsOpenHelperAim = r1_15
  r0_15.CurShootingLocation = r0_0.ZeroVector
  r1_0:Set("IsOpenHelperAim", r1_15)
end
function r10_0.UpdateOpenLockAim(r0_16, r1_16)
  -- line: [193, 197] id: 16
  r0_16.IsOpenLockAim = r1_16
  r0_16.CurShootingLocation = r0_0.ZeroVector
  r1_0:Set("IsOpenLockAim", r1_16)
end
function r10_0.InitGameSkillFaceTo(r0_17)
  -- line: [200, 219] id: 17
  local r1_17 = "SkillFaceTo"
  local r2_17 = r1_0:Get(r1_17)
  local r3_17 = nil
  if r2_17 == nil then
    local r4_17 = DataMgr.Option[r1_17]
    if r2_0.GetDeviceTypeByPlatformName(r0_17) == "Mobile" and r4_17.DefaultValueM then
      r3_17 = r4_17.DefaultValueM
    else
      r3_17 = r4_17.DefaultValue
    end
    r2_17 = r3_17 == "True"
    r1_0:Set(r1_17, r2_17)
  end
  r0_17:SetLockOrientpreference(r2_17)
end
function r10_0.SetUpAllTimer(r0_18)
  -- line: [221, 229] id: 18
  if r0_18:IsMainPlayer() then
    r0_18:AddTimer(1, r0_18.UpdatePlayerBloodEffectInfo, true, 0, "UpdatePlayerBloodEffectInfo")
    local r1_18 = GWorld:GetAvatar()
    if r1_18 and r1_18:IsInBigWorld() then
      r0_18:AddTimer(0.5, r0_18.CalcCurrentPlayerRegionId, true)
    end
  end
end
function r10_0.ShowCursor_Press(r0_19)
  -- line: [231, 238] id: 19
  DebugPrint("ShowCursor_Press", UE4.UKismetSystemLibrary.GetFrameCount())
  local r1_19 = UGameInputModeSubsystem.GetGameInputModeSubsystem(r0_19)
  if not IsValid(r1_19) then
    return 
  end
  r1_19:HandleShowCursorPressOrRelease(true)
end
function r10_0.ShowCursor_Release(r0_20)
  -- line: [240, 247] id: 20
  DebugPrint("ShowCursor_Release", UE4.UKismetSystemLibrary.GetFrameCount())
  local r1_20 = UGameInputModeSubsystem.GetGameInputModeSubsystem(r0_20)
  if not IsValid(r1_20) then
    return 
  end
  r1_20:HandleShowCursorPressOrRelease(false)
end
function r10_0.ShowCursorLock(r0_21, r1_21)
  -- line: [249, 251] id: 21
  r0_21.bShowCursorLock = r1_21
end
function r10_0.ShowMonsterInfo(r0_22)
  -- line: [253, 264] id: 22
  local r2_22 = UE4.UGameplayStatics.GetGameInstance(r0_22):GetGameUIManager()
  r0_22.bShowMonsterInfo = not r0_22.bShowMonsterInfo
  if r0_22.bShowMonsterInfo then
    r2_22:LoadUI(UIConst.MONSTERINFOPANEL, "MonsterInfo", UIConst.ZORDER_FOR_DESKTOP_TEMP)
  else
    r2_22:UnLoadUI("MonsterInfo")
  end
  r0_22:RemoveInputCache("ShowMonsterInfo")
end
function r10_0.ChangeAspectAndFOV(r0_23, r1_23, r2_23, r3_23)
  -- line: [266, 269] id: 23
end
function r10_0.OpenMap(r0_24)
  -- line: [271, 290] id: 24
  if TeamController:IsTeamPopupBarOpenInGamepad() then
    return 
  end
  if not UIManager(r0_24):TryOpenSystem("Map") then
    return 
  end
  local r2_24 = UE4.UGameplayStatics.GetGameInstance(r0_24):GetGameUIManager()
  if not r2_24 then
    return 
  end
  local r3_24 = nil
  local r4_24 = r2_24:GetUI("BattleMain") and r2_24:GetUI("HomeBaseMain")
  if r4_24 then
    r3_24 = r4_24.Battle_Map and r4_24.Battle_Map_PC
  end
  if r3_24 then
    r3_24:OnKeyboardClick()
  end
end
function r10_0.StartOpenMap(r0_25)
  -- line: [291, 305] id: 25
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    local r1_25 = GWorld:GetAvatar()
    if r1_25 and r1_25:CheckUIUnlocked("Chat") then
      local r2_25 = UIManager(r0_25):GetUIObj("BattleMain")
      if r2_25 and r2_25.Key_ChatEntry then
        r0_25.Key_ChatEntry = r2_25.Key_ChatEntry
        r0_25.Key_ChatEntry:AddExecuteLogic(r0_25, r0_25.ChatUpdate)
        r0_25.Key_ChatEntry:OnButtonPressed(nil, true, 0, 0.5)
        return 
      end
    end
  end
  r0_25:OpenMap()
end
function r10_0.ClearChatEntryKey(r0_26)
  -- line: [306, 310] id: 26
  r0_26.Key_ChatEntry:RemoveExecuteLogic()
  r0_26.Key_ChatEntry:OnButtonReleased()
  r0_26.Key_ChatEntry = nil
end
function r10_0.StopOpenMap(r0_27)
  -- line: [311, 316] id: 27
  if r0_27.Key_ChatEntry then
    r0_27:ClearChatEntryKey()
    r0_27:OpenMap()
  end
end
function r10_0.ChatUpdate(r0_28)
  -- line: [317, 320] id: 28
  r0_28:ClearChatEntryKey()
  r8_0:OpenView(r0_28, true)
end
function r10_0.OpenBattleWheel(r0_29)
  -- line: [321, 365] id: 29
  DebugPrint("gmy@OpenBattleWheel")
  local r1_29 = GWorld:GetAvatar()
  if r1_29 == nil then
    return 
  end
  local r2_29 = DataMgr.UIUnlockRule
  local r3_29 = r2_29.BattleWheel.UIUnlockRuleId
  local r4_29 = UE4.UGameplayStatics.GetGameInstance(r0_29)
  local r5_29 = UE4.UGameplayStatics.GetPlayerController(r4_29, 0)
  if r5_29.bEnableBattleWheel then
    local r6_29 = r1_29:CheckUIUnlocked(r3_29)
    DebugPrint("gmy@BattleMenu Unlocked", r6_29)
    if r6_29 then
      local r7_29 = r4_29:GetGameUIManager()
      local r8_29 = r7_29:GetUIObj("InBattleWheelMenu")
      if r8_29 then
        r7_29:UnLoadUI("InBattleWheelMenu")
        r8_29 = nil
      end
      if r8_29 == nil then
        r8_29 = r7_29:LoadUINew("InBattleWheelMenu")
        DebugPrint(LXYTag, "BattleWheel", r8_29)
        AudioManager(r0_29):PlayUISound(r8_29, "event:/ui/common/combat_bag_show", "BattleMenuShow", nil)
        r0_29:FlushInputKeyExceptMove()
        r0_29:AddForbidTag("BattleWheelForbid")
        r5_29:AddDisableRotationInputTag("SetRotation_Lerp")
      end
    else
      UIManager(r0_29):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, r2_29.BattleWheel.UIUnlockDesc)
    end
  else
    DebugPrint("gmy@BP_PlayerCharacter_C:OpenBattleWheel DisableBattleWheel")
    if WorldTravelSubsystem():GetCurrentDungeonType() == CommonConst.DungeonType.Abyss then
      UIManager(r0_29):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, GText("UI_Disabled_Des_BattleWheel"))
    else
      UIManager(r0_29):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, GText("UI_BATTLEWHEEL_FORBIDDEN"))
    end
  end
end
function r10_0.CloseBattleWheel(r0_30, r1_30)
  -- line: [367, 391] id: 30
  local r2_30 = UE4.UGameplayStatics.GetGameInstance(r0_30)
  local r4_30 = r2_30:GetGameUIManager():GetUIObj("InBattleWheelMenu")
  local r5_30 = UE4.UGameplayStatics.GetPlayerController(r2_30, 0)
  if r4_30 ~= nil then
    local r6_30 = UGameInputModeSubsystem.GetGameInputModeSubsystem(r0_30)
    if r6_30 then
      if r6_30:GetCurrentInputType() == ECommonInputType.Gamepad then
        r4_30:CloseMenu()
      else
        r4_30:SelectAndCloseMenu()
      end
    end
  end
  r0_30:MinusForbidTag("BattleWheelForbid")
  r5_30:RemoveDisableRotationInputTag("SetRotation_Lerp")
end
function r10_0.RefreshBattleWheelEnableState(r0_31)
  -- line: [393, 402] id: 31
  local r1_31 = r0_31:GetController()
  if not r1_31.bEnableBattleWheel then
    r0_31:CloseBattleWheel(true)
  end
  DebugPrint("gmy@BP_PlayerCharacter_C:RefreshBattleWheelEnableState", r1_31.bEnableBattleWheel)
  EventManager:FireEvent(EventID.OnRefreshBattleWheelEnableState, r1_31.bEnableBattleWheel, r1_31.bShowBattleWheel)
end
function r10_0.EnableBattleWheel(r0_32)
  -- line: [404, 411] id: 32
  local r2_32 = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  if r2_32 then
    r2_32.bEnableBattleWheel = true
    r0_32:RefreshBattleWheelEnableState()
  end
end
function r10_0.DisableBattleWheel(r0_33)
  -- line: [413, 420] id: 33
  local r2_33 = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  if r2_33 then
    r2_33.bEnableBattleWheel = false
    r0_33:RefreshBattleWheelEnableState()
  end
end
function r10_0.ShowBattleWheel(r0_34)
  -- line: [422, 428] id: 34
  local r1_34 = r0_34:GetController()
  if r1_34 then
    r1_34.bShowBattleWheel = true
    r0_34:RefreshBattleWheelEnableState()
  end
end
function r10_0.HideBattleWheel(r0_35)
  -- line: [430, 436] id: 35
  local r1_35 = r0_35:GetController()
  if r1_35 then
    r1_35.bShowBattleWheel = false
    r0_35:RefreshBattleWheelEnableState()
  end
end
function r10_0.CalcCurrentPlayerRegionId(r0_36)
  -- line: [443, 455] id: 36
  local r1_36 = GWorld:GetAvatar()
  local r2_36 = r0_36:GetRegionId()
  if not r2_36 or not r1_36 or not r1_36:CheckCurrentSubRegion() then
    return 
  end
  if r1_36.SyncReason ~= CommonConst.SyncReason.Normal then
    return 
  end
  if not r1_36:CheckCurrentSubRegion(r2_36) then
    return 
  end
  if r1_36.CurrentRegionId ~= r2_36 and r2_36 ~= -1 then
    if r1_36:GetSubRegionId2RegionId() ~= r1_36:GetSubRegionId2RegionId(r2_36) then
      return 
    end
    if r0_36:GetRegionId(r0_36:GetLastSafeLocation()) ~= r2_36 then
      return 
    end
    r1_36:SkipRegion(r2_36)
  end
end
function r10_0.OnEnteredNewSubRegion(r0_37)
  -- line: [457, 489] id: 37
  local r1_37 = GWorld:GetAvatar()
  DebugPrint("OnEnteredNewSubRegion", r1_37.CurrentRegionId)
  if r0_37.CanChangeToMaster == nil then
    r0_37.CanChangeToMaster = r0_37:CheckCanChangeToMaster(false)
  end
  local r2_37 = r0_37.CanChangeToMaster
  local r3_37 = r0_37:CheckCanChangeToMaster(false, true)
  if r0_37.CurrentMasterBan and not r3_37 then
    r0_37:SwitchMasterOrHeroUIPerform()
    r0_37:ChangeBackToHero()
  end
  AudioManager(r0_37):CheckLevelSoundAndRegionId(r1_37.CurrentRegionId)
end
function r10_0.GetRegionId(r0_38, r1_38)
  -- line: [491, 502] id: 38
  if not r1_38 then
    r1_38 = r0_38.CurrentLocation
  end
  local r2_38 = UE4.UGameplayStatics.GetGameMode(r0_38)
  local r3_38 = -1
  if not r2_38 then
    return 
  end
  local r4_38 = r2_38:GetLevelLoader()
  if r4_38 and GWorld:GetWorldRegionState() and r4_38.IsWorldLoader then
    r3_38 = r4_38:GetRegionIdByLocation(r1_38)
  end
  return r3_38
end
function r10_0.StartLookAt(r0_39, r1_39, r2_39)
  -- line: [508, 516] id: 39
  if not r0_39:CheckLookPriority(r1_39) then
    return 
  end
  r0_39:StopLookAt()
  r0_39.CurrentLookType = r1_39
  r0_39.CurrentLookInfo = r2_39
  r0_39.LookAtTag:SetTagState(r1_39, true)
end
function r10_0.CheckLookPriority(r0_40, r1_40)
  -- line: [518, 520] id: 40
  return true
end
function r10_0.StopLookAt(r0_41, r1_41)
  -- line: [522, 530] id: 41
  if not r1_41 then
    r0_41.LookAtTag:SetTagState(r0_41.CurrentLookType, false)
    return 
  end
  if r1_41 == r0_41.CurrentLookType then
    r0_41.LookAtTag:SetTagState(r0_41.CurrentLookType, false)
  end
end
function r10_0.CheckCanLookAt(r0_42, r1_42)
  -- line: [532, 545] id: 42
  if r1_42 then
    r0_42:StopLookAt()
    return 
  end
  local r2_42 = DataMgr.PlayerStateLimit[r0_42.AutoSyncProp.CharacterTag]
  if r2_42 and r2_42.NeackRotation then
    r0_42:StartLookAt("Camera", {
      TurnHeadParam = {
        bLookUseCamera = true,
        bIsLookAt = true,
      },
    })
  else
    r0_42:StopLookAt("Camera")
  end
end
function r10_0.OnSetLookAtTag(r0_43, r1_43)
  -- line: [547, 557] id: 43
  if not r0_43.PlayerAnimInstance then
    return 
  end
  if not r1_43 then
    r0_43.PlayerAnimInstance:StopLookAt()
    return 
  end
  r0_43:SetLookAtParam()
end
function r10_0.SetLookAtParam(r0_44)
  -- line: [559, 583] id: 44
  if not r0_44.PlayerAnimInstance then
    return 
  end
  if not r0_44.CurrentLookInfo then
    return 
  end
  for r5_44, r6_44 in pairs(r0_44.CurrentLookInfo.TurnHeadParam) do
    if r0_44.PlayerAnimInstance[r5_44] ~= nil then
      r0_44.PlayerAnimInstance[r5_44] = r6_44
    end
  end
  -- close: r1_44
  local r1_44 = r0_44.CurrentLookInfo.Target
  local r2_44 = r0_44.CurrentLookInfo.SocketName
  if r0_44.CurrentLookType == "Actor" then
    r0_44.PlayerAnimInstance:SetLookAtActor(r1_44, r2_44)
  elseif r0_44.CurrentLookType ~= "Camera" then
    r0_44.PlayerAnimInstance:SetLookAtActor(r1_44, r2_44)
  end
end
function r10_0.OnSkillFeatureBegin(r0_45)
  -- line: [622, 624] id: 45
  r0_45:StopFire(false, true)
end
function r10_0.CancelSkill(r0_46, r1_46, r2_46)
  -- line: [626, 632] id: 46
  if not r0_46:IsSkillFinished() then
    r0_46:StopSkill()
    r0_46:StopFire(r2_46, false)
    r0_46.PlayerAnimInstance:StopSkillAnimation()
  end
end
function r10_0.InitSceneStartUI(r0_47)
  -- line: [635, 670] id: 47
  local r1_47 = UE4.UGameplayStatics.GetGameInstance(r0_47)
  local r2_47 = r1_47:GetGameUIManager()
  if not IsValid(r2_47) then
    return 
  end
  r0_47.UIModePlatform = r2_0.GetDeviceTypeByPlatformName(r0_47)
  r0_47.PlatformName = UGameplayStatics.GetPlatformName()
  local r3_47 = r2_47:LoadUI(UIConst.SCENESTARTUI, "SceneStartUI", UIConst.ZORDER_FOR_DESKTOP)
  if r3_47 ~= nil then
    r3_47:InitMainPage()
  end
  if not r0_47:IsDead() then
    local r4_47 = r2_47:GetUI("BattleMain")
    if r4_47 then
      r4_47:HidePlayerDeadUI()
    end
    r2_47:HideAllUI_EX(TSet(FName), false, "RegionResurgence")
  end
  r0_47:UpdatePlayerTaskInfo()
  if not r1_47:GetLoadingUI() then
    r0_47:RefreshCharUIByPlatform()
  end
end
function r10_0.RefreshCharUIByPlatform(r0_48)
  -- line: [672, 687] id: 48
  local r1_48 = UIManager(r0_48)
  r0_48.SkillUINames = r0_48.SkillUINames and {}
  for r6_48, r7_48 in pairs(r0_48.SkillUINames) do
    DebugPrint("gmy@BP_PlayerCharacter_C:RefreshCharUIByPlatform ", r6_48)
    r1_48:UnLoadUI(r6_48)
    r0_48.SkillUINames[r6_48] = nil
  end
  -- close: r2_48
  DebugPrint("gmy@BP_PlayerCharacter_C BP_PlayerCharacter_C:RefreshCharUIByPlatform1", r0_48.CurrentRoleId)
  local r2_48 = DataMgr.BattleChar[r0_48.CurrentRoleId]
  if r2_48 and r2_48.CharUIId then
    r0_48:TryOpenSkillUI(r2_48.CharUIId, false)
  end
end
function r10_0.CheckDraftCanProduce(r0_49)
  -- line: [689, 705] id: 49
  local r1_49 = GWorld:GetAvatar()
  if not r1_49 then
    return 
  end
  if r1_49:CheckSubRegionType(r1_49:GetCurrentRegionId(), CommonConst.SubRegionType.Home) and r1_49:IsInBigWorld() and #r6_0:GetCanProduceDraftIds() > 0 then
    r0_49:AddTimer(1, function()
      -- line: [697, 702] id: 50
      UE4.UTalkFunctionLibrary.PlayDirectTalkByTalkTriggerId(GWorld.GameInstance, 3001)
    end)
  end
end
function r10_0.UpdatePlayerBloodEffectInfo(r0_51)
  -- line: [707, 765] id: 51
  if not r0_51.InitSuccess then
    return 
  end
  local r3_51 = r0_51:GetCurrentBloodVolume() / r0_51:GetMaxBloodVolume()
  local r4_51 = r0_51:GetAttr("ES")
  local r5_51 = DataMgr.SystemUI[UIConst.BattleNearDeathPCName]
  if r5_51 then
    local r6_51 = r5_51.Params.FirstLevelFactor
    local r7_51 = r5_51.Params.SecondLevelFactor
    local r8_51 = r5_51.Params.ShowUIBloodStrength
    local r9_51 = r5_51.Params.SecondLevelBloodStrength
    if r6_51 == nil or r7_51 == nil or r8_51 == nil or r9_51 == nil then
      return 
    end
    local r10_51 = r0_51.IsNearDeath
    local r11_51 = 0.0001
    if r11_51 < r3_51 and r3_51 < r8_51 then
      r11_51 = r4_51 <= 0
    else
      goto label_45	-- block#11 is visited secondly
    end
    r0_51.IsNearDeath = r11_51
    r11_51 = UIManager(r0_51):GetUIObj(UIConst.BattleNearDeathPCName)
    local r12_51 = nil
    if not r10_51 and r0_51.IsNearDeath then
      r12_51 = "In"
    end
    if r10_51 and r0_51.IsNearDeath then
      r12_51 = "Loop"
    end
    if r10_51 and not r0_51.IsNearDeath then
      r12_51 = "Out"
    end
    if r0_51.IsNearDeath then
      if r11_51 == nil then
        r11_51 = UIManager(r0_51):LoadUINew(UIConst.BattleNearDeathPCName)
      end
      if r11_51 ~= nil then
        local r13_51 = nil
        local r14_51 = nil	-- notice: implicit variable refs by block#[33]
        if r9_51 < r3_51 then
          r14_51 = r6_51
          if r14_51 then
            ::label_94::
            r14_51 = r7_51
          end
        else
          goto label_94	-- block#28 is visited secondly
        end
        if r2_0.GetDeviceTypeByPlatformName() == "PC" then
          r13_51 = r11_51.Bg_1:GetDynamicMaterial()
        else
          r13_51 = r11_51.glassglow:GetDynamicMaterial()
        end
        if r13_51 ~= nil then
          r13_51:SetScalarParameterValue("Flash", r14_51)
        end
      end
    elseif r11_51 ~= nil and r10_51 then
      r11_51:BindToAnimationFinished(r11_51.Out, function()
        -- line: [757, 760] id: 52
        r11_51:UnbindAllFromAnimationFinished(r11_51.Out)
        UIManager(r0_51):UnLoadUI(UIConst.BattleNearDeathPCName)
      end)
      EMUIAnimationSubsystem:EMPlayAnimation(r11_51, r11_51.Out)
    end
    -- close: r6_51
  end
end
function r10_0.UpdateUIMode(r0_53, r1_53)
  -- line: [767, 774] id: 53
  r0_53.UIModePlatform = r1_53
  local r2_53 = UIManager(r0_53):GetUIObj("SceneStartUI")
  if r2_53 ~= nil then
    r2_53:OnCloseOtherUI()
    r2_53:InitMainPage()
  end
end
function r10_0.Landed(r0_54)
  -- line: [776, 784] id: 54
  if not r0_54:PlayerLanded() then
    return 
  end
  if r0_54:CharacterInTag("Shooting") and r0_54:CheckCanEnterTag("LandHeavy") and r0_54.PlayerAnimInstance.FallingSpeed < r0_0.LandHeavySpeed then
    r0_54:StopFire(true, false)
    r0_54:StopSkill()
  end
end
function r10_0.Impending(r0_55)
  -- line: [786, 791] id: 55
  if not r0_55:PlayerImpending() then
    return 
  end
  r0_55.Overridden.Impending(r0_55)
end
function r10_0.StartSlide(r0_56)
  -- line: [793, 799] id: 56
  print(_G.LogTag, "StartSlideStartSlideStartSlide")
  r0_56:DoSlide()
  if r0_56.NeedSlideEvent then
    EventManager:FireEvent(EventID.OnSlidePressed)
  end
end
function r10_0.PressDodge(r0_57)
  -- line: [801, 804] id: 57
  r0_57.bSprintPressed = true
  r0_57:StartDodge()
end
function r10_0.StartDodge(r0_58)
  -- line: [806, 811] id: 58
  r0_58:DoDodge()
  if r0_58.NeedAvoidEvent then
    EventManager:FireEvent(EventID.OnAvoidPressed)
  end
end
function r10_0.ApplyHitFlyDown(r0_59)
  -- line: [818, 822] id: 59
  r0_59:ResetCapSize()
  r0_59:RealStopSlide(true)
  r0_59.Super.ApplyHitFlyDown(r0_59)
end
function r10_0.ShowPlayerDeadUI(r0_60)
  -- line: [845, 850] id: 60
  local r2_60 = UIManager(r0_60):LoadUINew(r0_60:GetCurRecoveryUIName())
  r2_60:OnMainCharacterInitReady()
  r2_60:InitResurgenceUI(r0_60.Eid)
end
function r10_0.IsDeadDuringQuest(r0_61)
  -- line: [852, 855] id: 61
  local r1_61 = GWorld.StoryMgr:GetCurrentStoryNode()
  return r1_61 and r1_61.bDeadTriggerQuestFail
end
function r10_0.HandleDeadDuringQuest(r0_62)
  -- line: [857, 869] id: 62
  local r2_62 = GWorld.StoryMgr:GetResurgencePointInfo()
  local r3_62 = 1.8
  if r2_62 then
    r0_62:AddTimer(r3_62, function()
      -- line: [862, 864] id: 63
      r0_62:RequestDeadAsyncTravel(r2_62)
    end)
  else
    DebugPrint("Tianyi@ 找不到复活点，走区域复活逻辑")
    r0_62:TryEnterDying()
  end
end
function r10_0.RealOnDead_Lua(r0_64, r1_64, r2_64, r3_64)
  -- line: [871, 914] id: 64
  local r4_64 = UE4.UGameplayStatics.GetGameMode(r0_64)
  if r4_64 ~= nil then
    r4_64:NotifyGameModePlayerDead(r0_64)
  end
  DebugPrint("Tianyi@ Player Die!!!!!!!!!!")
  if r0_64.PlayerAniminstance then
    r0_64.PlayerAniminstance:ResetIdleTag(true)
    r0_64:SetArmoryTag("None")
  end
  r0_64:PlayHitMontage("Die")
  r0_64:SetHoldCrouch(false)
  r0_64:StopFire(false, false)
  r0_64:ZeroComboCount(UE4.EClearComboReason.Dead)
  local r5_64 = UE4.UGameplayStatics.GetGameState(r0_64)
  if r4_64 and (r5_64.GameModeType == "Training" or r5_64.GameModeType == "Trial") then
    local r6_64 = 0
    local r7_64 = r5_64:GetTargetPoint("Training")
    if r7_64 then
      Battle(r0_64):TeleportRecovery(r0_64.Eid, r7_64:K2_GetActorLocation(), r7_64:K2_GetActorRotation(), r6_64)
    else
      DebugPrint("Tianyi@ 找不到训练场复活点")
      Battle(r0_64):TeleportRecovery(r0_64.Eid, FVector(2148.795166, -4042.718262, 2133), FRotator(0, 0, 0), r6_64)
    end
  elseif r0_64:IsDeadDuringQuest() then
    DebugPrint("Tianyi@ 玩家在任务中死亡")
    r0_64:HandleDeadDuringQuest()
  else
    r0_64:TryEnterDying()
  end
  local r6_64 = GWorld:GetAvatar()
  if r0_64:IsMainPlayer() and r6_64 and r6_64:IsInRougeLike() then
    r6_64:SavePlayerSlice({
      Type = r0_0.RougeSliceInfoType.RecoverCount,
      Value = {
        RecoveryCount = r0_64:GetRecoveryCount() + 1,
      },
    })
  end
end
function r10_0.OnTriggerFallTrigger(r0_65, r1_65, r2_65)
  -- line: [916, 921] id: 65
  if r1_65 and r2_65 then
    r1_65:OnTriggerFallTrigger(r2_65, r0_65, UE4.URuntimeCommonFunctionLibrary.GetPlayerControllerIndex(r0_65, r0_65:GetController()))
  end
end
function r10_0.HandleRemoveModPassives(r0_66)
  -- line: [922, 926] id: 66
  r0_66:ClearWeaponModPassive()
  r0_66:RemovePassiveEffectByRole(r0_66:GetController():GetRoleId())
end
function r10_0.TriggerFallingCallable(r0_67, r1_67, r2_67, r3_67, r4_67, r5_67, r6_67)
  -- line: [928, 1008] id: 67
  DebugPrint("OtherActor is Falling Dead. ActorName:", r0_67:GetName(), ", UnitId:", r0_67.UnitId, ", Eid:", r0_67.Eid, ", CreatorId:", r0_67.CreatorId, ", CreatorType:", r0_67.CreatorType, ", BornPos:", r0_67.BornPos)
  if r0_67.FromOtherWorld then
    DebugPrint("OtherActor is player, but from other world  ActorName:", r0_67:GetName())
    return 
  end
  r1_67:TriggerDungeonComponentFun("OnPlayerTriggerFallTrigger")
  r0_67:OnTriggerFallTrigger(r1_67, r5_67)
  local r7_67 = r1_67:TryGetSafeLocation(r0_67, r3_67)
  local r8_67 = nil
  if r0_67:CharacterInTag("Interactive") then
    r0_67:LeaveInteractiveTag("Interactive")
  end
  if r1_67.EMGameState.GameModeType == "Temple" and r4_67 ~= true then
    local r9_67, r10_67 = r1_67.EMGameState:BackToTempleArchivePoint()
    if r9_67 then
      r7_67 = r9_67 + FVector(0, 0, r0_67.CapsuleComponent:GetScaledCapsuleHalfHeight())
      r8_67 = r10_67
    else
      DebugPrint("ERROR:BackToTempleArchivePoint ArchivePointLocation is nil")
    end
  elseif r1_67.EMGameState.GameModeType == "Party" and r4_67 ~= true then
    local r9_67, r10_67 = r1_67.EMGameState:BackToPartyArchivePoint(r0_67)
    if r9_67 then
      r7_67 = r9_67 + FVector(0, 0, r0_67.CapsuleComponent:GetScaledCapsuleHalfHeight())
      r8_67 = r10_67
      r1_67:OnPartyPlayerTriggerFallTrigger(r0_67.Eid)
    else
      DebugPrint("ERROR:BackToPartyArchivePoint ArchivePointLocation is nil")
    end
  end
  DebugPrint("FallTrigger -----------------------------------------------------------------------")
  DebugPrint("FallTrigger TriggeredByPlayer  MaxDis", r3_67, "DefaultEnable", r4_67)
  if r7_67 then
    DebugPrint("FallTrigger PrintPlayer SafeLocation ", r7_67.X, r7_67.Y, r7_67.Z)
  end
  if r2_67 and r2_67.Translation then
    DebugPrint("FallTrigger PrintPlayer DefaultTransform ", r2_67.Translation.X, r2_67.Translation.Y, r2_67.Translation.Z)
  end
  if not r4_67 and r7_67 ~= FVector(0, 0, 0) then
    DebugPrint("FallTrigger SetPlayerLocation to SafeLocation", r7_67.X, r7_67.Y, r7_67.Z)
    r0_67:K2_SetActorLocation(r7_67, false, nil, false)
    if r8_67 ~= nil then
      r0_67:K2_SetActorRotation(r8_67, false)
    end
  else
    DebugPrint("FallTrigger SetPlayerLocation to DefaultTransform", r2_67.Translation.X, r2_67.Translation.Y, r2_67.Translation.Z)
    r0_67:K2_SetActorLocation(r2_67.Translation, false, nil, false)
    r0_67:K2_SetActorRotation(r2_67.Rotation:ToRotator(), false)
  end
  r0_67:GetMovementComponent():ForceClientUpdate()
  r0_67:EnableCheckOverlapPush({})
  if r0_67.OnTriggerFallingCallable then
    r0_67:OnTriggerFallingCallable()
  end
  if IsDedicatedServer(r0_67) then
    r0_67.RPCComponent:OnPlayerFallTriggerClient()
  else
    r0_67:ShowBlackScreenFade_StandAlone(r6_67)
  end
  r0_67:GetController():SetControlRotation(r0_67:K2_GetActorRotation())
  r0_67:Landed()
end
function r10_0.TriggerWaterFallingCallable(r0_68, r1_68, r2_68, r3_68, r4_68)
  -- line: [1010, 1012] id: 68
  r0_68:TriggerFallingCallable(r1_68, r2_68, r3_68, r4_68)
end
function r10_0.ShowBlackScreenFade_StandAlone(r0_69, r1_69, r2_69)
  -- line: [1015, 1026] id: 69
  if r1_69 == "White" then
    UIManager(r0_69):ShowCommonBlackScreen({
      BlackScreenHandle = "BlackScreenFade",
      ScreenColor = "White",
      OutAnimationPlayTime = 1,
      IsPlayOutWhenLoaded = true,
    })
  else
    r0_69:NewBlackScreenFade(r2_69)
  end
end
function r10_0.TryToUpdateScreenEffect(r0_70, r1_70, r2_70)
  -- line: [1103, 1149] id: 70
  local r3_70 = r0_70:GetAttr("ES")
  if r2_70 > 0 then
    local r4_70 = r0_70:GetAttr("MaxES")
    if r4_70 ~= 0 and DataMgr.SystemUI[UIConst.BattleBrokenShieldPCName].Params.ShieldUIResetRate and DataMgr.SystemUI[UIConst.BattleBrokenShieldPCName].Params.ShieldUIResetRate < (r3_70 + r2_70) / r4_70 then
      r0_70.PlayBrokenShiledAnim = true
    end
    if r3_70 <= 0 and r0_70:IsMainPlayer() and r0_70.PlayBrokenShiledAnim then
      r0_70.PlayBrokenShiledAnim = false
      local r5_70 = DataMgr.SystemUI[UIConst.BattleBrokenShieldPCName]
      if r5_70 then
        local r6_70 = r5_70.Params.AnimName
        if r6_70 ~= nil then
          local r7_70 = UIManager(r0_70):PlayScreenEffectAnim(UIConst.LoadInConfig, UIConst.BattleBrokenShieldPCName, {
            {
              AnimName = r6_70,
              StartTime = 0,
              LoopNums = 1,
            }
          })
          local r8_70 = r3_0.NowTime()
          AudioManager(r0_70):PlayUISound(r7_70, "event:/ui/common/char_sheild_break", nil, nil)
          if r0_70.PreHitSoundTime == nil or r8_70 - r0_70.PreHitSoundTime >= 30 then
            r0_70.PreHitSoundTime = r8_70
            local r9_70 = FPlayFMODSoundStruct()
            r9_70.FMODEventPath, r9_70.SelectKey = AudioManager(r0_70):ContactPlayerStringPath(r0_70, "vo_be_hit_heavy")
            r9_70.EventKey = "vo_be_hit_heavy"
            r9_70.bStopWhenAttachedToDestoryed = true
            r9_70.bPlayAs2D = true
            local r10_70 = AudioManager(r0_70):PlayFMODSound_Sync(UE4.UAudioManager.SetObjectToFPlayFMODSoundStruct(r9_70, r0_70))
          end
        end
      end
    end
  end
end
function r10_0.SkillEnd(r0_71, r1_71, r2_71)
  -- line: [1151, 1161] id: 71
  if not r2_71 or r2_71 == 0 then
    return 
  end
  if not r0_71:GetSkill(r2_71) then
    return 
  end
  r0_71.Super.SkillEnd(r1_71, r2_71)
  r0_71:SetRotationRate("OnGround")
end
function r10_0.ResetWeaponHandDelay(r0_72)
  -- line: [1163, 1169] id: 72
  if not r0_72.KeepWeaponOnHand then
    return 
  end
  r0_72.KeepWeaponOnHand = false
  r0_72:RemoveTimer("KeepWeaponDelay")
end
function r10_0.InitPlayerUseSkillTimes_Internal(r0_73)
  -- line: [1235, 1247] id: 73
  if not GWorld:GetAvatar() then
    return 
  end
  for r6_73, r7_73 in pairs(r1_0:Get("bNeedCountPlayerSkillUsedTimesList", true) and {}) do
    r0_73.NeedCountPlayerSkillUsedTimesList:Add(r6_73, r7_73)
  end
  -- close: r2_73
  for r7_73, r8_73 in pairs(r1_0:Get("CountPlayerSkillUsedTimesList", true) and {}) do
    r0_73.CountPlayerSkillUsedTimesList:Add(r7_73, r8_73)
  end
  -- close: r3_73
end
function r10_0.GetPlayerUseSkillTimesFromCache(r0_74, r1_74)
  -- line: [1249, 1255] id: 74
  if not GWorld:GetAvatar() then
    return 
  end
  return (r1_0:Get("CountPlayerSkillUsedTimesList", true) and {})[r1_74] and 0
end
function r10_0.SavePlayerSkillUsedTimes(r0_75)
  -- line: [1284, 1290] id: 75
  if GWorld:GetAvatar() then
    r1_0:Set("bNeedCountPlayerSkillUsedTimesList", r0_75.NeedCountPlayerSkillUsedTimesList:ToTable(), true)
    r1_0:Set("CountPlayerSkillUsedTimesList", r0_75.CountPlayerSkillUsedTimesList:ToTable(), true)
  end
end
function r10_0.PressFire(r0_76)
  -- line: [1311, 1341] id: 76
  if not r0_76:CharacterInTag("LandHeavy") and not r0_76:CheckCanSkillTypeCancel(UE.ESkillType.Shooting) and r0_76:CheckForbidInput() then
    return 
  end
  if r0_76:CheckSkillOccupiedByProp(ESkillName.HeavyShooting) then
    r0_76.PropHoldShootTimer = r0_76:AddTimer(0.2, function()
      -- line: [1316, 1319] id: 77
      r0_76.PropEffectComponent.CurrentPropEffect:OnHoldShoot()
      r0_76.PropHoldShootTimer = nil
    end, false, 0, "PropHoldShoot")
  end
  if r0_76:CheckSkillOccupiedByProp(ESkillName.Fire) then
    r0_76.PropEffectComponent.CurrentPropEffect:OnShootPressed()
    return 
  end
  r0_76.bPressedFire = true
  if r0_76:CharacterHasAnyTag("OverHeat") or r0_76:CharacterHasAnyTag("NoBullet") then
    r0_76:TryFireOverLoad()
    r0_76:RemoveInputCache("Fire")
    return 
  end
  if r0_76:GetSkillByType(UE.ESkillType.HeavyShooting) and not r0_76.PropHoldShootTimer then
    r0_76:RemoveInputCache("Fire")
    r0_76.HoldShootingTimer = r0_76:AddTimer(0.2, r0_76.HoldShooting)
    return 
  end
  r0_76:StartFire("Fire")
  if r0_76.NeedFireEvent then
    EventManager:FireEvent(EventID.OnFirePressed)
  end
end
function r10_0.StartFire(r0_78, r1_78)
  -- line: [1343, 1380] id: 78
  -- notice: unreachable block#6
  if r0_78:CheckSkillOccupiedByProp(ESkillName.Fire) then
    return false
  end
  if r0_78:CheckSkillIsBan(ESkillName.Fire) then
    if not r0_78.CurrentMasterBan then
      local r2_78 = UIManager(r0_78):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, GText("UI_RANGED_FORBIDDEN"))
    else
      local r2_78 = false
    end
    return false
  end
  if r0_78:CheckSkillInActive(ESkillName.Fire) then
    return false
  end
  if not r0_78:CheckCanShoot(false) then
    return 
  end
  print(_G.LogTag, "StartFireStartFireStartFire", r1_78)
  if r0_78.PlayerAnimInstance then
    r0_78.PlayerAnimInstance.bPressedFire = true
  end
  local r2_78 = nil
  if r1_78 == "Fire" then
    r2_78 = r0_78:GetSkillByType(UE.ESkillType.Shooting)
  else
    r2_78 = r0_78:GetSkillByType(UE.ESkillType.HeavyShooting)
  end
  print(_G.LogTag, "StartFireStartFireStartFireStartFire", r2_78)
  local r4_78 = nil	-- notice: implicit variable refs by block#[22]
  if not r0_78:UseSkill(r2_78, 0) then
    r4_78 = false
    return r4_78
  end
  r0_78.AllowEnterShoot = false
  if r1_78 ~= "Fire" then
    r4_78 = "HeavyShooting"
    if not r4_78 then
      ::label_93::
      r4_78 = "Fire"
    end
  else
    goto label_93	-- block#21 is visited secondly
  end
  r0_78:RemoveInputCache(r4_78)
  return true
end
function r10_0.HoldShooting(r0_79)
  -- line: [1382, 1390] id: 79
  r0_79.bHoldingShooting = true
  if r0_79:CharacterInTag("Slide") then
    return 
  end
  r0_79:SetInputCache("HeavyShooting")
  r0_79:StartFire("HeavyShooting")
  r0_79.HoldShootingTimer = nil
end
function r10_0.RemoveHoldShootingTimer(r0_80)
  -- line: [1465, 1468] id: 80
  r0_80:RemoveTimer(r0_80.HoldShootingTimer)
  r0_80.HoldShootingTimer = nil
end
function r10_0.ReleaseFire(r0_81)
  -- line: [1470, 1487] id: 81
  if r0_81:CheckSkillOccupiedByProp(ESkillName.HeavyShooting) and r0_81.PropHoldShootTimer then
    r0_81:RemoveTimer("PropHoldShoot")
    r0_81.PropHoldShootTimer = nil
  end
  if r0_81:CheckSkillOccupiedByProp(ESkillName.Fire) then
    r0_81.PropEffectComponent.CurrentPropEffect:OnShootReleased()
    return 
  end
  if not r0_81.bHoldingShooting and r0_81.HoldShootingTimer then
    r0_81:SetInputCache("Fire")
    r0_81:StartFire("Fire")
  end
  r0_81:StopFire(false, true)
end
function r10_0.StopFire(r0_82, r1_82, r2_82)
  -- line: [1489, 1517] id: 82
  if r0_82.NeedFireReleaseEvent then
    EventManager:FireEvent(EventID.OnFireRelease)
  end
  if r1_82 and not r0_82.bPressedFire then
    return 
  end
  if not r1_82 then
    r0_82.bPressedFire = false
    r0_82.bHoldingShooting = false
  end
  r0_82:RemoveHoldShootingTimer()
  if r0_82.PlayerAnimInstance then
    r0_82.PlayerAnimInstance.bPressedFire = false
  end
  if r2_82 then
    return 
  end
  r0_82.ResetedWhenShoot = false
  if r0_82.PlayerAnimInstance then
    if r1_82 then
      r0_82.PlayerAnimInstance.StartShoot = false
      r0_82:DisableReloadWithoutShoot()
      r0_82:ShouldEnableHandIk()
    end
    r0_82.PlayerAnimInstance.StopShoot = false
    r0_82.PlayerAnimInstance.EnableAim = UE4.UKismetMathLibrary.Clamp(r0_82.PlayerAnimInstance.EnableAim + -1, 0, 1)
  end
end
function r10_0.AnimIdleStart(r0_83)
  -- line: [1544, 1549] id: 83
  if r0_83:CheckShouldEnterNormalIdle() then
    r0_83.PlayerAnimInstance:AnimNotify_IdleStartNew()
  end
  r0_83:TryEnterTalk()
end
function r10_0.EnterCrouchTag(r0_84)
  -- line: [1551, 1554] id: 84
  r0_84:TryEnterTalk()
end
function r10_0.CheckShouldEnterNormalIdle(r0_85)
  -- line: [1556, 1571] id: 85
  if not r0_85.PlayerAnimInstance then
    return false
  end
  if not r0_85.BuffManager then
    return true
  end
  local r1_85 = r0_85.BuffManager.CurrentIdleTag
  if r1_85 and r1_85 ~= "0" then
    return false
  end
  return true
end
function r10_0.EnterSkillTag(r0_86)
  -- line: [1584, 1591] id: 86
  if r0_86:IsAnimCrouch() and r0_86.CurrentSkillId == r0_86:GetSkillByType(UE.ESkillType.SlideAttack) then
    return 
  end
  r0_86:ResetCapSize()
end
function r10_0.EnterBulletJumpTag(r0_87)
  -- line: [1593, 1609] id: 87
  Battle(r0_87):TriggerBattleEvent(BattleEventName.EnterBulletJump, r0_87)
end
function r10_0.LeaveBulletJumpTag(r0_88, r1_88)
  -- line: [1611, 1614] id: 88
  Battle(r0_88):TriggerBattleEvent(BattleEventName.QuitBulletJump, r0_88)
  r0_88:SetPushEnemyInfo("BulletJump", false)
end
function r10_0.K2_OnMovementModeChanged(r0_89, r1_89, r2_89, r3_89, r4_89)
  -- line: [1616, 1627] id: 89
  local r5_89 = r0_89:GetMovementComponent()
  if not r5_89 then
    return 
  end
  if r2_89 == 6 and r4_89 == 1 then
    local r6_89 = r0_89.RegionCachedLocation and r0_0.ZeroVector
    r0_89:K2_SetActorLocationAndRotation(r6_89, r0_89.RegionCachedRotation and FRotator(0, 0, 0), false, nil, false)
    r5_89:SetMovementMode(3, 0)
  end
end
function r10_0.CheckKeepBoneHit(r0_90)
  -- line: [1647, 1656] id: 90
  local r1_90 = r0_90.PlayerAnimInstance:GetCurrentStateNameByStateMachineName("Movement")
  if r1_90 ~= "Idle" and r1_90 ~= "Run" then
    r0_90.PlayerAnimInstance.InBoneHit = false
    if r0_90.LuaTimerHandles.BoneHit ~= nil then
      r0_90:RemoveTimer(r0_90.LuaTimerHandles.BoneHit)
      r0_90.LuaTimerHandles.BoneHit = nil
    end
  end
end
function r10_0.ForbidRenderMainCamera(r0_91)
  -- line: [1658, 1664] id: 91
  r0_91.CharCameraComponent:SetOrthoNearClipPlane(100000)
  r0_91.CharCameraComponent:SetOrthoFarClipPlane(100001)
  r0_91.CharCameraComponent:SetOrthoWidth(1)
  r0_91.CharCameraComponent:SetProjectionMode(1)
end
function r10_0.AllowRenderMainCamera(r0_92)
  -- line: [1666, 1668] id: 92
  r0_92.CharCameraComponent:SetProjectionMode(0)
end
function r10_0.CheckNeedFootprint(r0_93)
  -- line: [1765, 1785] id: 93
  if r2_0.GetDeviceTypeByPlatformName(r0_93) == "Mobile" then
    return false
  end
  if IsStandAlone(r0_93) or r9_0.IsAutonomousProxy(r0_93) then
    local r1_93 = GWorld:GetAvatar()
    if r1_93 then
      if r1_93:CheckCurrentSubRegion() == true then
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
function r10_0.IsOpenNormalAim(r0_94)
  -- line: [1787, 1796] id: 94
  if not IsValid(r0_94.RangedWeapon) then
    return false
  end
  local r1_94 = r0_94:GetWeaponAimLockStyle()
  if r1_94 and r1_94 == "FieldAim" then
    return true
  end
  local r2_94 = r0_94.ChooseTargetFilter
  if r2_94 ~= nil then
    r2_94 = r0_94.LockTargetFilter ~= nil
  else
    goto label_21	-- block#7 is visited secondly
  end
  return r2_94
end
function r10_0.HoldToRecovery(r0_95)
  -- line: [1804, 1806] id: 95
  Battle(r0_95):Recovery(r0_95.Eid)
end
function r10_0.Recovery(r0_96, ...)
  -- line: [1808, 1818] id: 96
  r10_0.Super.Recovery(r0_96, ...)
  r0_96:TryLeaveDying()
  r0_96:ResetForbidTag("Battle")
  r0_96:OnRecoverDissolve()
  if IsClient(r0_96) or IsStandAlone(r0_96) then
    r0_96:UseSkill(r0_0.PlayerRecoverySkill, 0)
  end
end
function r10_0.OnRealEnterDying(r0_97)
  -- line: [1820, 1830] id: 97
  r0_97.Super.OnRealEnterDying(r0_97)
  if not IsDedicatedServer(r0_97) and r0_97:IsMainPlayer() then
    r0_97:ShowPlayerDeadUI()
    r0_97:TryHideAllSkillUI()
    if r0_97.TeammateUI then
      r0_97.TeammateUI:OnDead()
    end
  end
end
function r10_0.OnRealDie(r0_98)
  -- line: [1833, 1840] id: 98
  DebugPrint("Tianyi@ Player real die, Eid = " .. r0_98.Eid)
  if IsAuthority(r0_98) then
    UE4.UGameplayStatics.GetGameMode(r0_98):DungeonFinish_OnPlayerRealDead({
      r0_98:GetController().AvatarEidStr
    })
  end
end
function r10_0.OnLanded(r0_99)
  -- line: [1843, 1857] id: 99
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
function r10_0.EnterDeadTag(r0_100)
  -- line: [1859, 1867] id: 100
  r0_100:AddForbidTag("Battle")
  r0_100:TrackDeadInfo()
  local r1_100 = r0_100:GetBattlePet()
  if not r1_100 then
    return 
  end
  r1_100:HideBattlePet("Dead", true)
end
function r10_0.LeaveDeadTag(r0_101)
  -- line: [1869, 1875] id: 101
  local r1_101 = r0_101:GetBattlePet()
  if not r1_101 then
    return 
  end
  r1_101:HideBattlePet("Dead", false)
end
function r10_0.EnterRecoveryTag(r0_102)
  -- line: [1877, 1879] id: 102
  r0_102:TrackRecoverInfo()
end
function r10_0.GetLogMask(r0_103)
  -- line: [1881, 1883] id: 103
  return _G.LogTag
end
function r10_0.SetLogMask(r0_104, r1_104)
  -- line: [1885, 1888] id: 104
  print("LogInfo", r1_104)
  _G.LogTag = r1_104
end
function r10_0.SetLogMask(r0_105, r1_105)
  -- line: [1890, 1893] id: 105
  print("LogInfo", r1_105)
  _G.LogTag = r1_105
end
function r10_0.GetLogMask(r0_106)
  -- line: [1895, 1897] id: 106
  return _G.LogTag
end
function r10_0.ReceiveSound(r0_107, r1_107, r2_107)
  -- line: [1907, 1909] id: 107
  r0_107.Overridden.ReceiveSound(r0_107, r1_107, r2_107)
end
function r10_0.GetCharSpringArmWorldResultLoc(r0_108)
  -- line: [1915, 1917] id: 108
  return r0_108.CharSpringArmComponent.bWorldResultLoc
end
function r10_0.GetNickName(r0_109)
  -- line: [1935, 1944] id: 109
  local r1_109 = GWorld:GetAvatar()
  if not r1_109 then
    return "夜航主角名"
  end
  if GWorld:IsStandAlone() then
    return r1_109.Nickname
  end
  return r0_109.PlayerState.PlayerName
end
function r10_0.CheckSkillInActive(r0_110, r1_110)
  -- line: [1946, 1952] id: 110
  local r2_110 = r0_110:GetController()
  if not r2_110 or not r2_110.CheckSkillInActive then
    return false
  end
  return r2_110:CheckSkillInActive(r1_110)
end
function r10_0.PickupFunctionDispatcher(r0_111, r1_111, r2_111, r3_111, r4_111, r5_111, r6_111)
  -- line: [1963, 1995] id: 111
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
function r10_0.SetDefaultWeapon(r0_112)
  -- line: [1998, 2021] id: 112
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
function r10_0.HideMonsterCapsule(r0_113, r1_113)
  -- line: [2023, 2031] id: 113
  for r7_113, r8_113 in pairs(Battle(r0_113):GetAllEntities()) do
    if r8_113 and r8_113.IsMonster and r8_113:IsMonster() then
      r8_113.CapsuleComponent:SetHiddenInGame(r1_113, false)
    end
  end
  -- close: r3_113
end
function r10_0.ServerInteractiveMechanism(r0_114, r1_114, r2_114, r3_114, r4_114, r5_114)
  -- line: [2048, 2075] id: 114
  print(_G.LogTag, "lxz ServerInteractiveMechanism", r2_114)
  local r6_114 = Battle(r0_114):GetEntity(r1_114)
  if r5_114 then
    if r6_114.CheckMontageInteractive then
      r0_114:SetMechanismEid(r1_114, r6_114:CheckMontageInteractive())
    else
      r0_114:SetMechanismEid(r1_114, false)
    end
  end
  local r7_114 = nil
  if r6_114.CombatStateChangeComponent then
    r6_114:ChangeState("Interactive", r2_114, r3_114)
  else
    if r6_114:CharacterInTag("Defeated") then
      r6_114:Penalize(r2_114)
    else
      r6_114:OpenMechanism(r2_114)
    end
    if r6_114.InteractiveComponent then
      r7_114 = r6_114.InteractiveComponent.InteractiveTag
    else
      r7_114 = r6_114.InteractiveTag
    end
    r0_114:SetCharacterTag(r7_114)
  end
end
function r10_0.ServerDeInteractiveMechanism(r0_115, r1_115, r2_115, r3_115, r4_115, r5_115, r6_115)
  -- line: [2077, 2096] id: 115
  print(_G.LogTag, "lxz ServerDeInteractiveMechanism", r2_115)
  local r7_115 = Battle(r0_115):GetEntity(r1_115)
  if not r7_115 or not r7_115.OpenMechanism then
    return 
  end
  if r6_115 then
    if r7_115.CheckMontageInteractive then
      r0_115:SetMechanismEid(0, r7_115:CheckMontageInteractive())
    else
      r0_115:SetMechanismEid(0, false)
    end
  end
  if r4_115 == nil or r4_115 ~= r0_0.ForceEndInteractive then
    print(_G.LogTag, "lxz ServerDeInteractiveMechanism2222", r2_115)
    r7_115:CloseMechanism(r2_115, r3_115)
  else
    r7_115:ForceCloseMechanism(r2_115, r3_115)
  end
end
function r10_0.LeaveInteractiveTag(r0_116, r1_116)
  -- line: [2097, 2107] id: 116
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
function r10_0.LeaveSeatingTag(r0_117, r1_117)
  -- line: [2109, 2112] id: 117
  r0_117:LeaveInteractiveTag(r1_117)
  r0_117.CapsuleComponent:SetCollisionResponseToChannel(ECollisionChannel.ECC_WorldStatic, ECollisionResponse.ECR_Block)
end
function r10_0.ReceiveEndPlay(r0_118, r1_118)
  -- line: [2114, 2130] id: 118
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
  r0_118:UnBindControllerChangedDelegate()
end
function r10_0.UnBindControllerChangedDelegate(r0_119)
  -- line: [2132, 2135] id: 119
  UE4.UGameplayStatics.GetGameInstance(r0_119).OnPawnControllerChangedDelegates:Remove(r0_119, r0_119.OnPlayerControllerChanged)
end
function r10_0.GetLastSafeLocation(r0_120)
  -- line: [2168, 2170] id: 120
  return r0_120.LastSafeLocation
end
function r10_0.SetBrushStaticMeshScalarParameter(r0_121, r1_121)
  -- line: [2173, 2205] id: 121
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
function r10_0.AddDisableInputTag(r0_122, r1_122)
  -- line: [2207, 2212] id: 122
  r0_122.DisableInputTags:AddUnique(r1_122)
  if r0_122.DisableInputTags:Length() > 0 and r0_122:GetController() and r0_122:GetController():IsPlayerController() then
    r0_122:DisableInput(r0_122:GetController())
  end
end
function r10_0.RemoveDisableInputTag(r0_123, r1_123)
  -- line: [2214, 2221] id: 123
  if r0_123.DisableInputTags:Find(r1_123) then
    r0_123.DisableInputTags:RemoveItem(r1_123)
  end
  if r0_123.DisableInputTags:Length() <= 0 and r0_123:GetController() and r0_123:GetController():IsPlayerController() then
    r0_123:EnableInput(r0_123:GetController())
  end
end
function r10_0.RemoveAllDisableInputTag(r0_124)
  -- line: [2223, 2226] id: 124
  r0_124.DisableInputTags:Clear()
  r0_124:EnableInput(r0_124:GetController())
end
function r10_0.EnableInput(r0_125, r1_125)
  -- line: [2228, 2233] id: 125
  if r0_125.DisableInputTags:Length() > 0 then
    return 
  end
  r0_125.Overridden.EnableInput(r0_125, r1_125)
end
function r10_0.SwitchBattleShortcutKeysHidden(r0_126)
  -- line: [2299, 2304] id: 126
  local r2_126 = not r1_0:Get("BattleShortcutHudKeysHidden", true)
  r1_0:Set("BattleShortcutHudKeysHidden", r2_126, true)
  UIManager(r0_126):SetBattleShortCutHudKeysHidden(r2_126)
end
function r10_0.GetSafeRegionLocation(r0_127, r1_127)
  -- line: [2306, 2323] id: 127
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
function r10_0.ImmersionModel(r0_128)
  -- line: [2325, 2349] id: 128
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
  else
    require("EMLuaConst").IsHideJumpWord = false
    r1_128:AddUIToStateTagsCluster(1, "ImmersionModel")
    EventManager:RemoveEvent(EventID.OnAddWidgetComponent, r0_128)
    if r2_128 then
      r2_128:HideAllNpcHeadUI(false, "ImmersionModel")
    end
  end
end
function r10_0.OnAddWidgetComponent(r0_129, r1_129)
  -- line: [2351, 2359] id: 129
  local r2_129 = r1_129.WidgetComponent
  if r2_129 then
    local r3_129 = r2_129:GetWidget()
    if r3_129 then
      r3_129:Hide(r0_0.ImmersionModelHideTag)
    end
  end
end
function r10_0.UpdateBulletNumUI(r0_130)
  -- line: [2361, 2390] id: 130
  r0_130:AddDelayFrameFunc(function()
    -- line: [2363, 2389] id: 131
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
function r10_0.UpdateSkillUIInfo(r0_132, r1_132)
  -- line: [2392, 2425] id: 132
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
function r10_0.SetESCMenuForbiddenState(r0_133, r1_133)
  -- line: [2428, 2430] id: 133
  r0_133.IsESCForbidden = r1_133 and false
end
function r10_0.GetESCMenuForbiddenState(r0_134)
  -- line: [2432, 2437] id: 134
  if r0_134.IsESCForbidden == nil then
    return false
  end
  return r0_134.IsESCForbidden
end
function r10_0.SetMaxMovingSpeed(r0_135, r1_135)
  -- line: [2439, 2444] id: 135
  r1_135 = math.max(0, r1_135)
  r0_135.PlayerSlideAtttirbute.NormalWalkSpeed = DataMgr.PlayerRotationRates.NormalWalkSpeed.ParamentValue[1] * r1_135
  r0_135.PlayerSlideAtttirbute.CrouchWalkSpeed = DataMgr.PlayerRotationRates.CrouchWalkSpeed.ParamentValue[1] * r1_135
  r0_135:SetWalkSpeed()
end
function r10_0.SetMaxMovingSpeedByInfo(r0_136, r1_136)
  -- line: [2446, 2449] id: 136
  r0_136.PlayerSlideAtttirbute.NormalWalkSpeed = r1_136.NormalWalk
  r0_136.PlayerSlideAtttirbute.CrouchWalkSpeed = r1_136.CrouchWalk
end
function r10_0.TryOpenSkillUI(r0_137, r1_137, r2_137)
  -- line: [2451, 2501] id: 137
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
        -- line: [2467, 2480] id: 138
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
          -- line: [2484, 2495] id: 139
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
function r10_0.TryCloseSkillUI(r0_140, r1_140)
  -- line: [2503, 2527] id: 140
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
function r10_0.GetReplacedCharUIId(r0_141, r1_141)
  -- line: [2529, 2544] id: 141
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
function r10_0.TryHideAllSkillUI(r0_142)
  -- line: [2546, 2566] id: 142
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
function r10_0.TryCloseAllSkillUI(r0_143)
  -- line: [2568, 2577] id: 143
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
function r10_0.TryShowAllSkillUI(r0_144)
  -- line: [2579, 2596] id: 144
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
function r10_0.LeaveRecoveryTag(r0_145, r1_145)
  -- line: [2598, 2600] id: 145
  r0_145:TryShowAllSkillUI()
end
function r10_0.TryEnterTalk(r0_146)
  -- line: [2602, 2609] id: 146
  if r0_146.EnterTalkDelegates then
    for r5_146, r6_146 in pairs(r0_146.EnterTalkDelegates) do
      r6_146()
    end
    -- close: r1_146
    r0_146.EnterTalkDelegates = nil
  end
end
function r10_0.SetEndPointInfo(r0_147, r1_147, r2_147, r3_147)
  -- line: [2611, 2615] id: 147
  r0_147.EndPointSeqEnable = r1_147
  r0_147.EndPointLocation = r2_147
  r0_147.EndPointRotation = r3_147
end
function r10_0.GetEndPointInfo(r0_148)
  -- line: [2617, 2619] id: 148
  return r0_148.EndPointSeqEnable, r0_148.EndPointLocation, r0_148.EndPointRotation
end
function r10_0.OnDungeonSettlement(r0_149, r1_149, r2_149, r3_149)
  -- line: [2621, 2675] id: 149
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
  end
  r0_149:OnRecoverDissolve()
  local r5_149 = UIManager(r0_149):GetUI(r0_149:GetCurRecoveryUIName())
  if r5_149 then
    r5_149:ShowBattleMainUI()
  end
end
function r10_0.PlayDungeonSettlementFailDeadMontage(r0_150)
  -- line: [2677, 2690] id: 150
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
function r10_0.CheckLevelFinishMontagePath(r0_151, r1_151)
  -- line: [2692, 2707] id: 151
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
function r10_0.OnDungeonSettlementByIndex(r0_152, r1_152, r2_152, r3_152, r4_152)
  -- line: [2709, 2730] id: 152
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
  end
end
function r10_0.SetMainPlayerDungeonSettlementTransform(r0_153, r1_153, r2_153, r3_153)
  -- line: [2732, 2761] id: 153
  if r1_153 then
    r0_153:ResetIdle()
    local r6_153 = FHitResult()
    UE4.UKismetSystemLibrary.LineTraceSingle(r0_153, r2_153 + FVector(0, 0, r0_153.CapsuleComponent:GetUnscaledCapsuleHalfHeight()), r2_153 + FVector(0, 0, -500), ETraceTypeQuery.TraceScene, false, nil, EDrawDebugTrace.None, r6_153, true)
    r0_153:K2_SetActorLocationAndRotation(FVector(r2_153.X, r2_153.Y, r6_153.ImpactPoint.Z + r0_153.CapsuleComponent:GetUnscaledCapsuleHalfHeight()), r3_153, false, nil, true)
  else
    local r4_153 = UE4.UGameplayStatics.GetGameState(r0_153)
    local r5_153 = GWorld:GetAvatar()
    if not r5_153 then
      return 
    end
    if r5_153:IsInHardBoss() then
      r0_153:ResetIdle()
      local r7_153 = FHitResult()
      UE4.UKismetSystemLibrary.LineTraceSingle(r0_153, r2_153, r2_153 + FVector(0, 0, -500), ETraceTypeQuery.TraceScene, false, nil, EDrawDebugTrace.None, r7_153, true)
      r0_153:K2_SetActorLocation(FVector(r2_153.X, r2_153.Y, r7_153.ImpactPoint.Z + r0_153.CapsuleComponent:GetUnscaledCapsuleHalfHeight()), false, nil, true)
      r0_153:K2_SetActorRotation(r3_153, false)
    end
  end
end
function r10_0.SetOtherPlayerDungeonSettlementTransform(r0_154)
  -- line: [2763, 2773] id: 154
  r0_154:ResetIdle()
  local r1_154 = r0_154:K2_GetActorLocation()
  local r4_154 = FHitResult()
  UE4.UKismetSystemLibrary.LineTraceSingle(r0_154, r1_154 + FVector(0, 0, r0_154.CapsuleComponent:GetUnscaledCapsuleHalfHeight()), r1_154 + FVector(0, 0, -500), ETraceTypeQuery.TraceScene, false, nil, EDrawDebugTrace.None, r4_154, true)
  r0_154:K2_SetActorLocation(FVector(r1_154.X, r1_154.Y, r4_154.ImpactPoint.Z + r0_154.CapsuleComponent:GetUnscaledCapsuleHalfHeight()), false, nil, true)
end
function r10_0.SetEndPointOffset(r0_155, r1_155, r2_155)
  -- line: [2775, 2784] id: 155
  local r3_155 = FVector(0, 0, 0)
  if r2_155 and r2_155.SettlementOffset then
    r3_155.X = r2_155.SettlementOffset[r1_155][1]
    r3_155.Y = r2_155.SettlementOffset[r1_155][2]
    r3_155.Z = r2_155.SettlementOffset[r1_155][3]
  end
  r0_155:K2_SetActorLocation(UE4.UKismetMathLibrary.TransformLocation(r0_155:GetTransform(), r3_155), false, nil, true)
end
function r10_0.ResetOnSetEndPoint(r0_156)
  -- line: [2786, 2790] id: 156
  r0_156.CharacterMovement.Velocity = FVector(0, 0, 0)
  r0_156:AddGravityModifier(UE4.EGravityModifierTag.AnimNotify, 0)
  r0_156:SetActorEnableCollision(false)
end
function r10_0.CheckCanRecovery(r0_157)
  -- line: [2889, 2897] id: 157
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
function r10_0.SetIsJumpPadLaunched(r0_158, r1_158)
  -- line: [2993, 2995] id: 158
  r0_158.PlayerAnimInstance.IsJumpPadLaunched = r1_158
end
function r10_0.SetIsJumpPadLaunching(r0_159, r1_159)
  -- line: [2997, 2999] id: 159
  r0_159.PlayerAnimInstance.IsJumpPadLaunching = r1_159
end
function r10_0.GetBattleExtraInfo(r0_160)
  -- line: [3001, 3081] id: 160
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
function r10_0.GetCurPhantomInfo(r0_161)
  -- line: [3083, 3160] id: 161
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
function r10_0.RefreshTeamMemberInfo(r0_162, r1_162)
  -- line: [3162, 3194] id: 162
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
function r10_0.PreEnterStory(r0_163, r1_163)
  -- line: [3198, 3205] id: 163
  r0_163:CleanInputWhenEnterTalk()
  r0_163:ReleaseFire()
  r0_163.bInStory = true
  r0_163:SetStealth(true, "Story")
end
function r10_0.PreExitStory(r0_164, r1_164)
  -- line: [3207, 3212] id: 164
  r0_164.bInStory = false
  r0_164:SetStealth(false, "Story")
end
function r10_0._CheckCanChangeToMaster(r0_165, r1_165, r2_165)
  -- line: [3215, 3278] id: 165
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
function r10_0.CheckCanChangeToMaster(r0_166, r1_166, r2_166)
  -- line: [3280, 3309] id: 166
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
function r10_0.CheckCanChangeBackToHero(r0_167, r1_167)
  -- line: [3311, 3313] id: 167
  return r0_167:_CheckCanChangeToMaster(r1_167, false)
end
function r10_0.SwitchMasterOrHeroUIPerform(r0_168)
  -- line: [3315, 3323] id: 168
  if not IsValid(r0_168.BattleMainUI) then
    r0_168.BattleMainUI = UIManager(r0_168):GetUIObj("BattleMain")
  end
  if r0_168.BattleMainUI == nil or r0_168.BattleMainUI.Char_Skill == nil then
    return 
  end
  r0_168.BattleMainUI.Char_Skill:OnSwitchMasterOrHero()
end
function r10_0.ChangeToMasterUIPerform(r0_169)
  -- line: [3325, 3336] id: 169
  EventManager:FireEvent(EventID.ShowOrHideMainPlayerBloodUI, false, "ChangeRoleToMaster")
  if not IsValid(r0_169.BattleMainUI) then
    r0_169.BattleMainUI = UIManager(r0_169):GetUIObj("BattleMain")
  end
  if r0_169.BattleMainUI == nil or r0_169.BattleMainUI.Char_Skill == nil then
    return 
  end
  r0_169.BattleMainUI.Char_Skill:OnChangeToMaster()
end
function r10_0.ChangeBackToHeroUIPerform(r0_170)
  -- line: [3338, 3349] id: 170
  EventManager:FireEvent(EventID.ShowOrHideMainPlayerBloodUI, true, "ChangeRoleToMaster")
  if not IsValid(r0_170.BattleMainUI) then
    r0_170.BattleMainUI = UIManager(r0_170):GetUIObj("BattleMain")
  end
  if r0_170.BattleMainUI == nil or r0_170.BattleMainUI.Char_Skill == nil then
    return 
  end
  r0_170.BattleMainUI.Char_Skill:OnChangeBackToHero()
end
function r10_0.SwitchMasterOrHero(r0_171)
  -- line: [3351, 3368] id: 171
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
    -- line: [3365, 3367] id: 172
    r0_171.IsSwitchFuncInCD = false
  end, false, 0, "SwitchFuncCDTimer")
end
function r10_0.ChangeToMaster(r0_173, r1_173, r2_173)
  -- line: [3370, 3451] id: 173
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
function r10_0.ChangeBackToHero(r0_174)
  -- line: [3453, 3474] id: 174
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
function r10_0.WithChangeBackToHero(r0_175)
  -- line: [3476, 3487] id: 175
  r0_175:SeparateTwoKeyToOneCommand("Skill3", "SwitchMaster")
  r0_175:ChangeBackToHeroUIPerform()
  r0_175:EnableBattleWheel()
  local r1_175 = r0_175:GetBattlePet()
  if r1_175 then
    r1_175:HideBattlePet("Master", false)
  end
end
function r10_0.RecoverHeroInfo(r0_176)
  -- line: [3489, 3501] id: 176
  local r1_176 = GWorld:GetAvatar()
  local r2_176 = r0_176.HeroTempInfo and r1_176.HeroTempInfo
  if r2_176 ~= nil then
    local r3_176 = GWorld:GetAvatar()
    r0_176:GetController():SetAvatarInfo(r2_0.ObjId2Str(r3_176.Eid), AvatarUtils:UpdateBattleInfo(AvatarUtils:GetDefaultBattleInfo(r3_176), r2_176))
    r0_176.HeroTempInfo = nil
    r3_176.HeroTempInfo = nil
  end
end
function r10_0.RecoverBanSkills(r0_177)
  -- line: [3503, 3513] id: 177
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
function r10_0.IsCurrentMasterBan(r0_178)
  -- line: [3515, 3517] id: 178
  return r0_178.CurrentMasterBan
end
function r10_0.OnBattleStateChanged(r0_179, r1_179)
  -- line: [3519, 3530] id: 179
  if not r1_179 then
    return 
  end
  if not r0_179.CurrentMasterBan then
    return 
  end
  print(_G.LogTag, "OnBattleStateChanged", r1_179)
  r0_179:ChangeBackToHero()
end
function r10_0.BanSkills(r0_180)
  -- line: [3531, 3542] id: 180
  local r1_180 = TArray(0)
  for r6_180, r7_180 in pairs(r0_0.AllSKillNames) do
    if not r0_180:CheckSkillInActive(r7_180) then
      r1_180:Add(r7_180)
    end
  end
  -- close: r2_180
  local r2_180 = r0_180:GetController()
  if r2_180 then
    r2_180:BanSkills(r1_180, "MasterBan")
  end
end
function r10_0.UnBanSkills(r0_181)
  -- line: [3544, 3549] id: 181
  local r1_181 = r0_181:GetController()
  if r1_181 then
    r1_181:UnBanSkills("MasterUnBan")
  end
end
function r10_0.RegionBanSkills(r0_182)
  -- line: [3550, 3562] id: 182
  local r1_182 = TArray(0)
  for r6_182, r7_182 in pairs(r0_0.AllSKillNames) do
    if not r0_182:CheckSkillInActive(r7_182) then
      r1_182:Add(r7_182)
    end
  end
  -- close: r2_182
  local r2_182 = r0_182:GetController()
  if r2_182 then
    r2_182:BanSkills(r1_182, "RegionBan")
  end
end
function r10_0.RegionUnBanSkills(r0_183)
  -- line: [3564, 3569] id: 183
  local r1_183 = r0_183:GetController()
  if r1_183 then
    r1_183:UnBanSkills("RegionUnBan")
  end
end
function r10_0.MoveAlongSplineBanSkills(r0_184)
  -- line: [3571, 3583] id: 184
  local r1_184 = TArray(0)
  for r6_184, r7_184 in pairs(r0_0.AllSKillNames) do
    if not r0_184:CheckSkillInActive(r7_184) then
      r1_184:Add(r7_184)
    end
  end
  -- close: r2_184
  r1_184:Add(ESkillName.SwitchMasterOrHero)
  local r2_184 = r0_184:GetController()
  if r2_184 then
    r2_184:BanSkills(r1_184, "MoveAlongSpline")
  end
end
function r10_0.MoveAlongSplineUnBanSkills(r0_185)
  -- line: [3585, 3590] id: 185
  local r1_185 = r0_185:GetController()
  if r1_185 then
    r1_185:UnBanSkills("MoveAlongSpline")
  end
end
function r10_0.ForbidActionWhileMoveAlongSpline(r0_186, r1_186)
  -- line: [3592, 3607] id: 186
  local r2_186 = TArray(0)
  r2_186:Add(ESkillName.Jump)
  r2_186:Add(ESkillName.Slide)
  r2_186:Add(ESkillName.BulletJump)
  r2_186:Add(ESkillName.Avoid)
  r2_186:Add(ESkillName.Crouch)
  local r3_186 = r0_186:GetController()
  if r3_186 then
    if r1_186 then
      r3_186:InActiveSkills(r2_186, "MoveAlongSpline")
    else
      r3_186:ActiveSkills(r2_186, "MoveAlongSpline")
    end
  end
end
function r10_0.ForbidSkillsInHooking(r0_187, r1_187)
  -- line: [3609, 3633] id: 187
  local r2_187 = {
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
  local r3_187 = TArray(0)
  for r8_187, r9_187 in pairs(r2_187) do
    r3_187:Add(r9_187)
  end
  -- close: r4_187
  local r4_187 = r0_187:GetController()
  if r4_187 then
    if r1_187 then
      r4_187:InActiveSkillsInHooking(r3_187)
    else
      r4_187:ActiveSkillsEndHooking(r3_187)
    end
  end
end
function r10_0.ForbidActiveSkills(r0_188, r1_188)
  -- line: [3635, 3642] id: 188
  r0_188:ForbidSkills(r1_188, {
    ESkillName.Skill1,
    ESkillName.Skill2,
    ESkillName.Skill3
  })
end
function r10_0.ForbidAllSkills(r0_189, r1_189)
  -- line: [3644, 3652] id: 189
  r0_189:ForbidSkills(r1_189, {
    ESkillName.Skill1,
    ESkillName.Skill2,
    ESkillName.Skill3,
    ESkillName.Passive
  })
end
function r10_0.ForbidMeleeSkills(r0_190, r1_190)
  -- line: [3654, 3662] id: 190
  r0_190:ForbidSkills(r1_190, {
    ESkillName.Attack,
    ESkillName.FallAttack,
    ESkillName.HeavyAttack,
    ESkillName.SlideAttack
  })
end
function r10_0.ForbidRangedSkills(r0_191, r1_191)
  -- line: [3664, 3671] id: 191
  r0_191:ForbidSkills(r1_191, {
    ESkillName.Fire,
    ESkillName.ChargeBullet,
    ESkillName.HeavyShooting
  })
end
function r10_0.ForbidSkills(r0_192, r1_192, r2_192)
  -- line: [3673, 3686] id: 192
  local r3_192 = TArray(0)
  for r8_192, r9_192 in pairs(r2_192) do
    r3_192:Add(r9_192)
  end
  -- close: r4_192
  local r4_192 = r0_192:GetController()
  if r4_192 then
    if r1_192 then
      r4_192:InActiveSkills(r3_192, "Ban")
    else
      r4_192:ActiveSkills(r3_192, "UnBan")
    end
  end
end
function r10_0.AfterLoading(r0_193)
  -- line: [3688, 3752] id: 193
  if r0_193.AfterLoadingDone then
    return 
  end
  if r1_0:Get("ImmersionModel") then
    r1_0:Set("ImmersionModel", false)
  end
  r0_193:RefreshCharUIByPlatform()
  local r2_193 = GWorld:GetAvatar()
  if r2_193 and r2_193:CheckSubRegionType(nil, CommonConst.SubRegionType.Home) then
    r0_193:CheckDraftCanProduce()
  end
  r0_193:SetActorHideTag("DeliveryMontage", false)
  local r3_193 = UE4.UGameplayStatics.GetGameInstance(r0_193)
  if r3_193 then
    if r3_193.ShouldPlayDeliveryEndMontage then
      local r6_193 = {
        OnNotifyBegin = function()
          -- line: [3717, 3721] id: 194
          DebugPrint("zwk OnDeliveryAfterLoadingMontageNotifyBegin")
          r0_193:RemoveDisableInputTag("DeliverMontage")
        end,
        OnInterrupted = function()
          -- line: [3722, 3725] id: 195
          DebugPrint("zwk OnDeliveryAfterLoadingInterrupted", r3_193.ShouldPlayDeliveryEndMontage)
          r0_193:RemoveDisableInputTag("DeliverMontage")
        end,
      }
      DebugPrint("zwk OnDeliveryAfterLoadingMontageBegin")
      r0_193:ResetIdle()
      r0_193:AddDisableInputTag("DeliverMontage")
      r0_193:PlayTeleportAction(r6_193, false, true, false)
      r0_193.Mesh:GetAnimInstance():Montage_JumpToSection("End")
      r0_193:AddTimer(2, function()
        -- line: [3735, 3742] id: 196
        if r0_193.DisableInputTags:Find("DeliverMontage") then
          DebugPrint("zwk RemoveDeliverTag")
        end
        r0_193:RemoveDisableInputTag("DeliverMontage")
        r0_193:SetActorHideTag("DeliveryMontage", false)
      end, false, 0)
    end
    r3_193.ShouldPlayDeliveryEndMontage = false
  end
  r0_193.AfterLoadingDone = true
  r0_193:AddTimer(1, function()
    -- line: [3749, 3751] id: 197
    r0_193.AfterLoadingDone = false
  end)
end
function r10_0.LoadHitDirection(r0_198, r1_198, r2_198)
  -- line: [3782, 3790] id: 198
  r1_198.CurHitDirectionNum = r1_198.CurHitDirectionNum + 1
  RunAsyncTask(r0_198, "CreateHitDirectionHandler" .. r1_198.CurHitDirectionNum, function(r0_199)
    -- line: [3784, 3789] id: 199
    r1_198:AddToQueue(UE4.UGameplayStatics.GetGameInstance(r0_198):GetGameUIManager():LoadUIAsync("BattleHitDirection", r0_199, r2_198, r0_198))
  end)
end
function r10_0.DungeonOtherPlayerLeave(r0_200)
  -- line: [3792, 3802] id: 200
  if not r0_200:IsMainPlayer() and IsClient(r0_200) then
    EventManager:FireEvent(EventID.OnDungeonOtherPlayerLeave, r0_200)
    if UIManager(r0_200):GetUIObj("TeamToast") then
      UIManager(r0_200):UnLoadUINew("TeamToast")
    end
    UIManager(r0_200):LoadUINew("TeamToast", r0_200.PlayerState, false)
  end
end
function r10_0.SetCollisionProfileOverlapAll(r0_201, r1_201)
  -- line: [3804, 3826] id: 201
  DebugPrint("BP_PlayerCharacter_C:SetCollisionProfileOverlapAll", r1_201, r0_201.CachedPlayerCollisionProfile)
  if r0_201.CachedPlayerCollisionProfile ~= nil == r1_201 then
  end
  if r1_201 then
    r0_201.CachedPlayerCollisionProfile = r0_201.CapsuleComponent:GetCollisionProfileName()
    r0_201.CapsuleComponent:SetCollisionResponseToAllChannels(UE4.ECollisionResponse.ECR_Overlap)
    if r0_201.SkillBlockCapsule then
      r0_201.SkillBlockCapsuleCachedCollision = r0_201.SkillBlockCapsule:GetCollisionEnabled()
      r0_201.SkillBlockCapsule:SetCollisionEnabled(ECollisionEnabled.NoCollision)
    end
  else
    r0_201.CapsuleComponent:SetCollisionProfileName("Pawn", false)
    r0_201.CachedPlayerCollisionProfile = nil
    if r0_201.SkillBlockCapsule then
      r0_201.SkillBlockCapsule:SetCollisionEnabled(r0_201.SkillBlockCapsuleCachedCollision)
    end
  end
end
function r10_0.NeedArmoryHelper(r0_202)
  -- line: [3828, 3830] id: 202
  return GWorld:GetAvatar() ~= nil
end
function r10_0.RequestDeadAsyncTravel(r0_203, r1_203)
  -- line: [3831, 3966] id: 203
  r0_203:DisablePlayerInputInDeliver(true)
  local r2_203 = GWorld.GameInstance
  local r3_203 = r2_203:GetTalkContext()
  local r4_203 = UIManager(r2_203)
  local r5_203 = UE4.UGameplayStatics.GetGameState(r0_203)
  local r6_203 = r0_203:GetController()
  local r7_203 = false
  local r8_203 = false
  local r9_203 = r1_203.Transform
  local function r10_203()
    -- line: [3843, 3863] id: 204
    r4_203:HideCommonBlackScreen("DeadAsyncTravel")
    local r0_204 = r4_203:GetUIObj("MainTaskIndicator")
    if IsValid(r0_204) then
      r0_204:SetVisibility(UE4.ESlateVisibility.Visible)
    end
    local r1_204 = r2_203:GetSceneManager()
    local r2_204 = UE4.UGameplayStatics.GetGameMode(r0_203)
    r1_204:ShowOrHideAllSceneGuideIcon(true)
    r0_203:EnableInput(r6_203)
    if IsValid(LevelLoader) then
      LevelLoader:RemoveArtLevelLoadedCompleteCallback(r2_204:GetLevelLoader():GetLevelIdByLocation(r9_203.Translation))
    end
    r0_203:DisablePlayerInputInDeliver(false)
    local r3_204 = GWorld.StoryMgr
    if r3_204 then
      r3_204:FailCurrentQuestWhenDead()
    end
  end
  local r14_203 = {
    BlackScreenHandle = "DeadAsyncTravel",
    BlackScreenText = GText(r1_203.FailBlackScreenText),
    InAnimationObj = r0_203,
    InAnimationPlayTime = r1_203.FadeInTime and nil,
    InAnimationCallback = function()
      -- line: [3865, 3954] id: 205
      local r0_205 = GWorld.GameInstance
      local r1_205 = r0_205:GetGameUIManager()
      r0_205:GetSceneManager():ShowOrHideAllSceneGuideIcon(false)
      local r3_205 = r1_205:GetUIObj("MainTaskIndicator")
      if IsValid(r3_205) then
        r3_205:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
      r0_203:DisableInput()
      r0_203:QuickRecovery()
      local r4_205 = UE4.UGameplayStatics.GetGameMode(r0_203)
      local function r5_205()
        -- line: [3878, 3884] id: 206
        r4_205:SetActorLocationAndRotationByTransform(0, r9_203, true)
        r0_203:SetSafeLocation()
        if r8_203 then
          r0_203:GetController():SetControlRotation(r0_203:K2_GetActorRotation())
        end
      end
      local r6_205 = r4_205:GetLevelLoader()
      r0_203.DurationEnd = false
      r0_203.TravelFinish = false
      local function r7_205()
        -- line: [3890, 3896] id: 207
        if r0_203.DurationEnd and r0_203.TravelFinish then
          r0_203.DurationEnd = nil
          r0_203.TravelFinish = nil
          r10_203()
        end
      end
      local function r8_205()
        -- line: [3897, 3900] id: 208
        r0_203.TravelFinish = true
        r7_205()
      end
      r4_205:AddTimer(r1_203.ContinueTime, function()
        -- line: [3901, 3904] id: 209
        r0_203.DurationEnd = true
        r7_205()
      end, false, 0, "CommonBlackScreenContinueTimer", true)
      if IsValid(r6_205) then
        local r10_205 = r4_205:GetLevelLoader():GetLevelIdByLocation(r9_203.Translation)
        local r11_205 = r4_205:GetLevelLoader():GetLevelIdByLocation(r0_203:K2_GetActorLocation())
        local r12_205 = r4_205:GetWCSubSystem()
        if r12_205 then
          if r7_203 then
            r12_205:RequestAsyncTravel(r3_203.Player, r9_203, {
              r3_203,
              r8_205
            }, r8_203)
          elseif r12_205:IsBigObjectLevelLoadedByLocation(r9_203.Translation) then
            r5_205()
            r8_205()
          else
            r12_205:RequestAsyncTravel(r3_203.Player, r9_203, {
              r3_203,
              r8_205
            }, r8_203)
          end
          return 
        end
        if r6_205:GetLevelLoaded(r10_205) then
          r5_205()
          r8_205()
          return 
        end
        if r10_205 ~= r11_205 then
          r6_205:BindArtLevelLoadedCompleteCallback(r10_205, function()
            -- line: [3941, 3944] id: 210
            r5_205()
            r8_205()
          end)
          r6_205:LoadArtLevel(r10_205)
        else
          r5_205()
          r8_205()
        end
      else
        r5_205()
        r8_205()
      end
    end,
    OutAnimationObj = r0_203,
    OutAnimationCallback = nil,
    OutAnimationPlayTime = r1_203.FadeOutTime and nil,
  }
  r4_203:ShowCommonBlackScreen(r14_203)
end
function r10_0.TeleportToCloestTeleportPoint(r0_211, r1_211, r2_211)
  -- line: [3968, 4038] id: 211
  local r3_211 = UE4.UGameplayStatics.GetGameMode(r0_211)
  if not r3_211 then
    return false
  end
  local r4_211 = r3_211:GetWCSubSystem()
  if not r4_211 then
    return 
  end
  local r5_211 = r3_211:GetRegionDataMgrSubSystem()
  if not r5_211 then
    return 
  end
  local r6_211 = UE4.UGameplayStatics.GetGameState(r0_211)
  local r7_211 = r0_211:K2_GetActorLocation()
  if r2_211 then
    r7_211 = r2_211
  end
  local r8_211 = 2100000000
  local r9_211 = nil
  for r14_211, r15_211 in pairs(r6_211.StaticCreatorMap) do
    if r15_211.UnitId == CommonConst.DeliveryAnchorMechanismUnitId and r15_211.UnitType == "Mechanism" then
      local r16_211 = r5_211:GetLuaDataIndex(r15_211.CreatedWorldRegionEid)
      if r16_211 >= 0 and r5_211.DataPool.RegionData[r16_211] and r5_211.DataPool.RegionData[r16_211].State and r5_211.DataPool.RegionData[r16_211].State.OpenState then
        local r18_211 = r7_211:DistSquared(r15_211:K2_GetActorLocation())
        if r18_211 < r8_211 then
          r8_211 = r18_211
          r9_211 = r15_211
        end
      end
    end
  end
  -- close: r10_211
  if not r9_211 then
    for r14_211, r15_211 in pairs(r5_211.CurRegionDeliverNew:ToTable()) do
      if r5_211:CheckDeliverMechanismIsDefault(r15_211) then
        r9_211 = r6_211.StaticCreatorMap:FindRef(r15_211)
        break
      end
    end
    -- close: r10_211
  end
  local r10_211 = 1
  if r9_211 then
    for r15_211, r16_211 in pairs(DataMgr.TeleportPoint) do
      if r16_211.StaticId == r9_211.StaticCreatorId then
        r10_211 = r16_211.TeleportPointPos
      end
    end
    -- close: r11_211
  end
  local r11_211 = r3_211:GetWCSubSystem()
  local r13_211 = nil	-- notice: implicit variable refs by block#[36]
  if r9_211 then
    r13_211 = r9_211:K2_GetActorLocation()
    if not r13_211 then
      ::label_126::
      r13_211 = r0_211.CurrentLocation
    end
  else
    goto label_126	-- block#35 is visited secondly
  end
  r13_211 = r3_211:GetLevelLoader():GetStartPointByManager(r11_211:GetParentLevelIdByLocation(r13_211), r10_211)
  r4_211:RequestAsyncTravel(r0_211, r13_211:GetTransform(), {
    r0_211,
    function()
      -- line: [4032, 4035] id: 212
      if r1_211 then
        r1_211()
      end
    end
  })
  return true
end
function r10_0.InpActEvt_GlobalSlow_K2Node_InputActionEvent_1(r0_213, r1_213)
  -- line: [4040, 4044] id: 213
  if TeamController and TeamController:GetTeamPopupBarOpen() then
    return 
  end
  DebugPrint(LXYTag, "BP_PlayerCharacter_C:InpActEvt_GlobalSlow_K2Node_InputActionEvent_1")
  r0_213.Overridden.InpActEvt_GlobalSlow_K2Node_InputActionEvent_1(r0_213, r1_213)
end
function r10_0.CallClientPrint_Lua(r0_214, r1_214)
  -- line: [4046, 4048] id: 214
  print(LogTag, "服务器的输出为:" .. tostring(r1_214))
end
function r10_0.SetEnableFallAtkDir(r0_215)
  -- line: [4050, 4066] id: 215
  local r1_215 = r1_0:Get("EnableFallAtkDir")
  if r1_215 == nil then
    local r2_215 = DataMgr.Option.FallAttackDirection
    local r3_215 = r2_215.DefaultValue
    if r2_0.GetDeviceTypeByPlatformName(r0_215) == "Mobile" and r2_215.DefaultValueM then
      r3_215 = r2_215.DefaultValueM
    end
    r1_215 = true
    if r3_215 == "False" then
      r1_215 = false
    end
  end
  r0_215:UpdateEnableFallAtkDir(r1_215)
end
function r10_0.UpdateEnableFallAtkDir(r0_216, r1_216)
  -- line: [4068, 4071] id: 216
  r0_216.Overridden.UpdateEnableFallAtkDir(r0_216, r1_216)
  r1_0:Set("EnableFallAtkDir", r1_216)
end
function r10_0.GetCurrentCharUI(r0_217)
  -- line: [4073, 4078] id: 217
  local r1_217 = DataMgr.BattleChar[r0_217.CurrentRoleId]
  if r1_217.CharUIId then
    return r0_217:GetCharUIObj(r1_217.CharUIId)
  end
end
function r10_0.GetCharUIObj(r0_218, r1_218)
  -- line: [4080, 4088] id: 218
  local r2_218 = GWorld.GameInstance:GetGameUIManager()
  if not IsValid(r2_218) then
    return nil
  end
  return r2_218:GetUIObj(DataMgr.BattleCharUI[r1_218][r0_218:GetAttr("GradeLevel") and 0].UIName)
end
function r10_0.K2_OnEndViewTarget(r0_219, r1_219)
  -- line: [4090, 4092] id: 219
  EventManager:FireEvent(EventID.OnEndViewTarget)
end
function r10_0.K2_OnBecomeViewTarget(r0_220, r1_220)
  -- line: [4093, 4097] id: 220
  rawset(r0_220, "Controller", r1_220)
  rawset(r1_220, "PlayerCameraManager", r1_220.PlayerCameraManager)
  EventManager:FireEvent(EventID.OnBecomeViewTarget)
end
function r10_0.SetRegionOnlineState(r0_221)
  -- line: [4099, 4115] id: 221
  local r1_221 = r1_0:Get("AutoJoin")
  if r1_221 == nil then
    local r2_221 = DataMgr.Option.AutoJoin
    local r3_221 = r2_221.DefaultValue
    if r2_0.GetDeviceTypeByPlatformName(r0_221) == "Mobile" and r2_221.DefaultValueM then
      r3_221 = r2_221.DefaultValueM
    end
    r1_221 = true
    if r3_221 == "False" then
      r1_221 = false
    end
  end
  r0_221:UpdateRegionOnlineState(r1_221)
end
function r10_0.UpdateRegionOnlineState(r0_222, r1_222)
  -- line: [4116, 4119] id: 222
  r0_222.bOpenRegionOnline = r1_222
  r1_0:Set("AutoJoin", r1_222)
end
function r10_0.GetPlayerGender(r0_223, r1_223)
  -- line: [4120, 4127] id: 223
  local r2_223 = GWorld:GetAvatar()
  if r2_223 then
    return r2_223.Sex
  else
    return 0
  end
end
function r10_0.GetTeamMemberEidArray(r0_224)
  -- line: [4129, 4146] id: 224
  local r1_224 = UE4.UGameplayStatics.GetGameInstance(r0_224)
  if not TeamController or not TeamController:GetModel() or not r1_224 then
    return {}
  end
  local r2_224 = r1_224:GetSceneManager()
  if not r2_224 or not r2_224.RegionOnlineCharacterInfo then
    return {}
  end
  local r3_224 = TeamController:GetModel():GetTeam() and {}
  local r4_224 = {}
  for r9_224, r10_224 in pairs(r3_224.Members and {}) do
    if r10_224 then
      table.insert(r4_224, r2_224.RegionOnlineCharacterInfo[r10_224.Uid])
    end
  end
  -- close: r5_224
  return r4_224
end
AssembleComponents(r10_0, {
  "GetDamageInstigatorCurrentAngle"
})
return r10_0
