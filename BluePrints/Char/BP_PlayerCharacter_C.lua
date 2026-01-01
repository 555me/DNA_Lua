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
  -- line: [38, 82] id: 2
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
  r0_2:BindControllerChangedDelegate()
  local r1_2 = r0_2:GetController()
  if r1_2 then
    r1_2:ShowFlags("VisualizeSkyVisibilityLightmap", false)
    r1_2:ShowFlags("VisualizeBouncedSkyVisibilityLightmap", false)
  end
end
function r11_0.GetDropDistance(r0_3)
  -- line: [84, 86] id: 3
  r0_3:CalcAttr("DropDistance")
end
function r11_0.BindControllerChangedDelegate(r0_4)
  -- line: [88, 91] id: 4
  UE4.UGameplayStatics.GetGameInstance(r0_4).OnPawnControllerChangedDelegates:Add(r0_4, r0_4.OnPlayerControllerChanged)
end
function r11_0.OnPlayerControllerChanged(r0_5, r1_5, r2_5)
  -- line: [93, 101] id: 5
  if r1_5 == r0_5 and r2_5 and r2_5:IsPlayerController() then
    if r0_5.DisableInputTags:Length() > 0 then
      r0_5:DisableInput(r0_5:GetController())
    else
      r0_5:EnableInput(r0_5:GetController())
    end
  end
end
function r11_0.SetGamepadFromCache(r0_6)
  -- line: [111, 126] id: 6
  if not r0_6:IsMainPlayer() then
    return 
  end
  local r1_6 = r1_0:Get("GamepadLayout")
  DebugPrint("@zyh 获取到的GamepadLayout", r1_6)
  if not r1_6 then
    local r2_6 = tonumber(DataMgr.Option.GamepadPreset.DefaultValue)
    r1_0:Set("GamepadLayout", r2_6)
    r0_6:InitGamepadSet(r2_6)
    r0_6:InitReplaceGamepadSet(r2_6)
  else
    r0_6:InitGamepadSet(r1_6)
    r0_6:InitReplaceGamepadSet(r1_6)
  end
end
function r11_0.SwitchGamepadSet(r0_7, r1_7)
  -- line: [128, 132] id: 7
  r0_7:InitGamepadSet(r1_7)
  r0_7:InitReplaceGamepadSet(r1_7)
  EventManager:FireEvent(EventID.OnSwitchGamepadSet)
end
function r11_0.SetMobileRotationFromCache(r0_8)
  -- line: [134, 148] id: 8
  if not r0_8:IsMainPlayer() then
    return 
  end
  local r1_8 = r1_0:Get("EnableMobileRotation")
  DebugPrint("@zyh 获取到的EnableMobileRotation", r1_8)
  if r1_8 == nil then
    local r3_8 = nil	-- notice: implicit variable refs by block#[6]
    if DataMgr.Option.EnableMobileRotation.DefaultValueM == "True" then
      r3_8 = true
      if not r3_8 then
        ::label_24::
        r3_8 = false
      end
    else
      goto label_24	-- block#5 is visited secondly
    end
    r1_0:Set("EnableMobileRotation", r3_8)
    r0_8.EnableMobileRotation = r3_8
  else
    r0_8.EnableMobileRotation = r1_8
  end
end
function r11_0.SwitchEnableMobileRotation(r0_9, r1_9)
  -- line: [150, 153] id: 9
  r0_9.EnableMobileRotation = r1_9
  r1_0:Set("EnableMobileRotation", r1_9)
end
function r11_0.UpdateOpenHelperAim(r0_10, r1_10)
  -- line: [155, 159] id: 10
  r0_10.IsOpenHelperAim = r1_10
  r0_10.CurShootingLocation = r0_0.ZeroVector
  r1_0:Set("IsOpenHelperAim", r1_10)
end
function r11_0.UpdateOpenLockAim(r0_11, r1_11)
  -- line: [161, 165] id: 11
  r0_11.IsOpenLockAim = r1_11
  r0_11.CurShootingLocation = r0_0.ZeroVector
  r1_0:Set("IsOpenLockAim", r1_11)
end
function r11_0.InitGameSkillFaceTo(r0_12)
  -- line: [168, 187] id: 12
  local r1_12 = "SkillFaceTo"
  local r2_12 = r1_0:Get(r1_12)
  local r3_12 = nil
  if r2_12 == nil then
    local r4_12 = DataMgr.Option[r1_12]
    if r2_0.GetDeviceTypeByPlatformName(r0_12) == "Mobile" and r4_12.DefaultValueM then
      r3_12 = r4_12.DefaultValueM
    else
      r3_12 = r4_12.DefaultValue
    end
    r2_12 = r3_12 == "True"
    r1_0:Set(r1_12, r2_12)
  end
  r0_12:SetLockOrientpreference(r2_12)
end
function r11_0.SetUpAllTimer(r0_13)
  -- line: [189, 199] id: 13
  if r0_13:IsMainPlayer() then
    r0_13:AddTimer(1, r0_13.UpdatePlayerBloodEffectInfo, true, 0, "UpdatePlayerBloodEffectInfo")
    local r1_13 = GWorld:GetAvatar()
    if r1_13 and r1_13:IsInBigWorld() then
      r0_13:AddTimer(0.5, r0_13.CalcCurrentPlayerRegionId, true)
    end
    r0_13:AddTimer(60, r0_13.CheckHPRate, true, math.random(1, 60), "CheckLockHpRate")
    r0_13:AddTimer(60, r0_13.CheckExtraRangeModify, true, math.random(1, 60), "CheckExtraRangeModify")
  end
end
function r11_0.CheckHPRate(r0_14)
  -- line: [201, 226] id: 14
  local r1_14 = GWorld:GetAvatar()
  if not r0_14.BuffManager or not r1_14 then
    return 
  end
  if r0_14.BuffManager.LockHpRate ~= 0 or r0_14.BuffManager.LockHpValue ~= 0 then
    local r2_14 = false
    local r3_14 = "当前Buff列表："
    for r8_14, r9_14 in pairs(r0_14.BuffManager.Buffs) do
      local r10_14 = DataMgr.Buff[r9_14.BuffId]
      r3_14 = r3_14 .. tostring(r9_14.BuffId) .. "\n"
      if r10_14 and r10_14.LockHp then
        r2_14 = true
      end
    end
    -- close: r4_14
    local r4_14 = ""
    if r0_14.BuffManager.LockHpRate ~= 0 then
      r4_14 = string.format("反外挂检测，非法修改发了LockHPRate,当前LockHPRate=%s\n", tostring(r0_14.BuffManager.LockHpRate))
    else
      r4_14 = string.format("反外挂检测，非法修改发了LockHpValue,当前LockHpValue=%s\n", tostring(r0_14.BuffManager.LockHpValue))
    end
    if not r2_14 then
      UE4.URuntimeCommonFunctionLibrary.SendCheatMsgToServer(r0_14:GetWorld(), ECheatType.HoneyJar, r4_14 .. r3_14)
    end
  end
end
function r11_0.CheckExtraRangeModify(r0_15)
  -- line: [228, 246] id: 15
  local r1_15 = GWorld:GetAvatar()
  if not r0_15.Skills or not r1_15 then
    return 
  end
  local r2_15 = false
  local r3_15 = "当前Skill列表：\n"
  for r8_15, r9_15 in pairs(r0_15.Skills) do
    if r9_15.ExtraRangeModify ~= 1 then
      r2_15 = true
      r3_15 = r3_15 .. tostring(string.format("SkillId: %d, ExtraRangeModify: %f \n", r9_15.SkillId, r9_15.ExtraRangeModify))
    end
  end
  -- close: r4_15
  if r2_15 then
    UE4.URuntimeCommonFunctionLibrary.SendCheatMsgToServer(r0_15:GetWorld(), ECheatType.HoneyJar, "反外挂检测，非法修改了技能的ExtraRangeModify \n" .. r3_15)
  end
end
function r11_0.ShowCursor_Press(r0_16)
  -- line: [248, 255] id: 16
  DebugPrint("ShowCursor_Press", UE4.UKismetSystemLibrary.GetFrameCount())
  local r1_16 = UGameInputModeSubsystem.GetGameInputModeSubsystem(r0_16)
  if not IsValid(r1_16) then
    return 
  end
  r1_16:HandleShowCursorPressOrRelease(true)
end
function r11_0.ShowCursor_Release(r0_17)
  -- line: [257, 264] id: 17
  DebugPrint("ShowCursor_Release", UE4.UKismetSystemLibrary.GetFrameCount())
  local r1_17 = UGameInputModeSubsystem.GetGameInputModeSubsystem(r0_17)
  if not IsValid(r1_17) then
    return 
  end
  r1_17:HandleShowCursorPressOrRelease(false)
end
function r11_0.ShowCursorLock(r0_18, r1_18)
  -- line: [266, 268] id: 18
  r0_18.bShowCursorLock = r1_18
end
function r11_0.ShowMonsterInfo(r0_19)
  -- line: [270, 281] id: 19
  local r2_19 = UE4.UGameplayStatics.GetGameInstance(r0_19):GetGameUIManager()
  r0_19.bShowMonsterInfo = not r0_19.bShowMonsterInfo
  if r0_19.bShowMonsterInfo then
    r2_19:LoadUI(UIConst.MONSTERINFOPANEL, "MonsterInfo", UIConst.ZORDER_FOR_DESKTOP_TEMP)
  else
    r2_19:UnLoadUI("MonsterInfo")
  end
  r0_19:RemoveInputCache("ShowMonsterInfo")
end
function r11_0.OpenMap(r0_20)
  -- line: [283, 302] id: 20
  if TeamController:IsTeamPopupBarOpenInGamepad() then
    return 
  end
  if not UIManager(r0_20):TryOpenSystem("Map") then
    return 
  end
  local r2_20 = UE4.UGameplayStatics.GetGameInstance(r0_20):GetGameUIManager()
  if not r2_20 then
    return 
  end
  local r3_20 = nil
  local r4_20 = r2_20:GetUI("BattleMain") and r2_20:GetUI("HomeBaseMain")
  if r4_20 then
    r3_20 = r4_20.Battle_Map and r4_20.Battle_Map_PC
  end
  if r3_20 then
    r3_20:OnKeyboardClick()
  end
end
function r11_0.StartOpenMap(r0_21)
  -- line: [303, 317] id: 21
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    local r1_21 = GWorld:GetAvatar()
    if r1_21 and r1_21:CheckUIUnlocked("Chat") then
      local r2_21 = UIManager(r0_21):GetUIObj("BattleMain")
      if r2_21 and r2_21.Key_ChatEntry then
        r0_21.Key_ChatEntry = r2_21.Key_ChatEntry
        r0_21.Key_ChatEntry:AddExecuteLogic(r0_21, r0_21.ChatUpdate)
        r0_21.Key_ChatEntry:OnButtonPressed(nil, true, 0, 0.5)
        return 
      end
    end
  end
  r0_21:OpenMap()
end
function r11_0.ClearChatEntryKey(r0_22)
  -- line: [318, 322] id: 22
  r0_22.Key_ChatEntry:RemoveExecuteLogic()
  r0_22.Key_ChatEntry:OnButtonReleased()
  r0_22.Key_ChatEntry = nil
end
function r11_0.StopOpenMap(r0_23)
  -- line: [323, 328] id: 23
  if r0_23.Key_ChatEntry then
    r0_23:ClearChatEntryKey()
    r0_23:OpenMap()
  end
end
function r11_0.ChatUpdate(r0_24)
  -- line: [329, 332] id: 24
  r0_24:ClearChatEntryKey()
  r8_0:OpenView(r0_24, true)
end
function r11_0.OpenBattleWheel(r0_25)
  -- line: [333, 383] id: 25
  DebugPrint("gmy@OpenBattleWheel")
  local r1_25 = GWorld:GetAvatar()
  if r1_25 == nil then
    return 
  end
  local r2_25 = DataMgr.UIUnlockRule
  local r3_25 = r2_25.BattleWheel.UIUnlockRuleId
  local r4_25 = UE4.UGameplayStatics.GetGameInstance(r0_25)
  local r5_25 = UE4.UGameplayStatics.GetPlayerController(r4_25, 0)
  if r5_25.bEnableBattleWheel then
    local r6_25 = r1_25:CheckUIUnlocked(r3_25)
    DebugPrint("gmy@BattleMenu Unlocked", r6_25)
    if r6_25 then
      local r7_25 = r4_25:GetGameUIManager()
      local r8_25 = r7_25:GetUIObj("InBattleWheelMenu")
      if r8_25 then
        r7_25:UnLoadUI("InBattleWheelMenu")
        r8_25 = nil
      end
      if r8_25 == nil then
        r8_25 = r7_25:LoadUINew("InBattleWheelMenu", r5_25.QuestBattleWheelID and nil)
      end
      DebugPrint(LXYTag, "BattleWheel", r8_25)
      AudioManager(r0_25):PlayUISound(r8_25, "event:/ui/common/combat_bag_show", "BattleMenuShow", nil)
      r0_25:FlushInputKeyExceptMove()
      r0_25:AddForbidTag("BattleWheelForbid")
      r5_25:AddDisableRotationInputTag("SetRotation_Lerp")
    else
      UIManager(r0_25):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, r2_25.BattleWheel.UIUnlockDesc)
    end
  else
    DebugPrint("gmy@BP_PlayerCharacter_C:OpenBattleWheel DisableBattleWheel")
    if WorldTravelSubsystem():GetCurrentDungeonType() == CommonConst.DungeonType.Abyss then
      UIManager(r0_25):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, GText("UI_Disabled_Des_BattleWheel"))
    else
      UIManager(r0_25):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, GText("UI_BATTLEWHEEL_FORBIDDEN"))
    end
  end
end
function r11_0.CloseBattleWheel(r0_26, r1_26)
  -- line: [385, 410] id: 26
  local r2_26 = UE4.UGameplayStatics.GetGameInstance(r0_26)
  local r4_26 = r2_26:GetGameUIManager():GetUIObj("InBattleWheelMenu")
  local r5_26 = UE4.UGameplayStatics.GetPlayerController(r2_26, 0)
  if r4_26 ~= nil then
    local r6_26 = UGameInputModeSubsystem.GetGameInputModeSubsystem(r0_26)
    if r6_26 then
      if r6_26:GetCurrentInputType() == ECommonInputType.Gamepad then
        r4_26:CloseMenu()
      else
        r4_26:SelectAndCloseMenu()
      end
    end
  end
  r0_26:MinusForbidTag("BattleWheelForbid")
  r5_26:RemoveDisableRotationInputTag("SetRotation_Lerp")
end
function r11_0.RefreshBattleWheelEnableState(r0_27)
  -- line: [412, 421] id: 27
  local r1_27 = r0_27:GetController()
  if not r1_27.bEnableBattleWheel then
    r0_27:CloseBattleWheel(true)
  end
  DebugPrint("gmy@BP_PlayerCharacter_C:RefreshBattleWheelEnableState", r1_27.bEnableBattleWheel)
  EventManager:FireEvent(EventID.OnRefreshBattleWheelEnableState, r1_27.bEnableBattleWheel, r1_27.bShowBattleWheel)
end
function r11_0.SetQuestBattleWheelID(r0_28, r1_28)
  -- line: [423, 430] id: 28
  r0_28.QuestBattleWheelID = r1_28
  local r3_28 = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  if r3_28 then
    r3_28.QuestBattleWheelID = r0_28.QuestBattleWheelID
  end
end
function r11_0.EnableBattleWheel(r0_29)
  -- line: [432, 439] id: 29
  local r2_29 = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  if r2_29 then
    r2_29.bEnableBattleWheel = true
    r0_29:RefreshBattleWheelEnableState()
  end
end
function r11_0.DisableBattleWheel(r0_30)
  -- line: [441, 448] id: 30
  local r2_30 = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  if r2_30 then
    r2_30.bEnableBattleWheel = false
    r0_30:RefreshBattleWheelEnableState()
  end
end
function r11_0.ShowBattleWheel(r0_31)
  -- line: [450, 456] id: 31
  local r1_31 = r0_31:GetController()
  if r1_31 then
    r1_31.bShowBattleWheel = true
    r0_31:RefreshBattleWheelEnableState()
  end
end
function r11_0.HideBattleWheel(r0_32)
  -- line: [458, 464] id: 32
  local r1_32 = r0_32:GetController()
  if r1_32 then
    r1_32.bShowBattleWheel = false
    r0_32:RefreshBattleWheelEnableState()
  end
end
function r11_0.CalcCurrentPlayerRegionId(r0_33)
  -- line: [471, 483] id: 33
  local r1_33 = GWorld:GetAvatar()
  local r2_33 = r0_33:GetRegionId()
  if not r2_33 or not r1_33 or not r1_33:CheckCurrentSubRegion() then
    return 
  end
  if r1_33.SyncReason ~= CommonConst.SyncReason.Normal then
    return 
  end
  if not r1_33:CheckCurrentSubRegion(r2_33) then
    return 
  end
  if r1_33.CurrentRegionId ~= r2_33 and r2_33 ~= -1 then
    if r1_33:GetSubRegionId2RegionId() ~= r1_33:GetSubRegionId2RegionId(r2_33) then
      return 
    end
    if r0_33:GetRegionId(r0_33:GetLastSafeLocation()) ~= r2_33 then
      return 
    end
    r1_33:SkipRegion(r2_33)
  end
end
function r11_0.OnEnteredNewSubRegion(r0_34)
  -- line: [485, 517] id: 34
  local r1_34 = GWorld:GetAvatar()
  DebugPrint("OnEnteredNewSubRegion", r1_34.CurrentRegionId)
  if r0_34.CanChangeToMaster == nil then
    r0_34.CanChangeToMaster = r0_34:CheckCanChangeToMaster(false)
  end
  local r2_34 = r0_34.CanChangeToMaster
  local r3_34 = r0_34:CheckCanChangeToMaster(false, true)
  if r0_34.CurrentMasterBan and not r3_34 then
    r0_34:SwitchMasterOrHeroUIPerform()
    r0_34:ChangeBackToHero()
  end
  AudioManager(r0_34):CheckLevelSoundAndRegionId(r1_34.CurrentRegionId)
end
function r11_0.GetRegionId(r0_35, r1_35)
  -- line: [519, 530] id: 35
  if not r1_35 then
    r1_35 = r0_35.CurrentLocation
  end
  local r2_35 = UE4.UGameplayStatics.GetGameMode(r0_35)
  local r3_35 = -1
  if not r2_35 then
    return 
  end
  local r4_35 = r2_35:GetLevelLoader()
  if r4_35 and GWorld:GetWorldRegionState() and r4_35.IsWorldLoader then
    r3_35 = r4_35:GetRegionIdByLocation(r1_35)
  end
  return r3_35
end
function r11_0.StartLookAt(r0_36, r1_36, r2_36)
  -- line: [536, 544] id: 36
  if not r0_36:CheckLookPriority(r1_36) then
    return 
  end
  r0_36:StopLookAt()
  r0_36.CurrentLookType = r1_36
  r0_36.CurrentLookInfo = r2_36
  r0_36.LookAtTag:SetTagState(r1_36, true)
end
function r11_0.CheckLookPriority(r0_37, r1_37)
  -- line: [546, 548] id: 37
  return true
end
function r11_0.StopLookAt(r0_38, r1_38)
  -- line: [550, 558] id: 38
  if not r1_38 then
    r0_38.LookAtTag:SetTagState(r0_38.CurrentLookType, false)
    return 
  end
  if r1_38 == r0_38.CurrentLookType then
    r0_38.LookAtTag:SetTagState(r0_38.CurrentLookType, false)
  end
end
function r11_0.CheckCanLookAt(r0_39, r1_39)
  -- line: [560, 573] id: 39
  if r1_39 then
    r0_39:StopLookAt()
    return 
  end
  local r2_39 = DataMgr.PlayerStateLimit[r0_39.AutoSyncProp.CharacterTag]
  if r2_39 and r2_39.NeackRotation then
    r0_39:StartLookAt("Camera", {
      TurnHeadParam = {
        bLookUseCamera = true,
        bIsLookAt = true,
      },
    })
  else
    r0_39:StopLookAt("Camera")
  end
end
function r11_0.OnSetLookAtTag(r0_40, r1_40)
  -- line: [575, 585] id: 40
  if not r0_40.PlayerAnimInstance then
    return 
  end
  if not r1_40 then
    r0_40.PlayerAnimInstance:StopLookAt()
    return 
  end
  r0_40:SetLookAtParam()
end
function r11_0.SetLookAtParam(r0_41)
  -- line: [587, 611] id: 41
  if not r0_41.PlayerAnimInstance then
    return 
  end
  if not r0_41.CurrentLookInfo then
    return 
  end
  for r5_41, r6_41 in pairs(r0_41.CurrentLookInfo.TurnHeadParam) do
    if r0_41.PlayerAnimInstance[r5_41] ~= nil then
      r0_41.PlayerAnimInstance[r5_41] = r6_41
    end
  end
  -- close: r1_41
  local r1_41 = r0_41.CurrentLookInfo.Target
  local r2_41 = r0_41.CurrentLookInfo.SocketName
  if r0_41.CurrentLookType == "Actor" then
    r0_41.PlayerAnimInstance:SetLookAtActor(r1_41, r2_41)
  elseif r0_41.CurrentLookType ~= "Camera" then
    r0_41.PlayerAnimInstance:SetLookAtActor(r1_41, r2_41)
  end
end
function r11_0.OnSkillFeatureBegin(r0_42)
  -- line: [650, 652] id: 42
  r0_42:StopFire(false, true)
end
function r11_0.CancelSkill(r0_43, r1_43, r2_43)
  -- line: [655, 661] id: 43
  if not r0_43:IsSkillFinished() then
    r0_43:StopSkill(UE.ESkillStopReason.ForceCancel)
    r0_43:StopFire(r2_43, false)
    r0_43.PlayerAnimInstance:StopSkillAnimation()
  end
end
function r11_0.InitSceneStartUI(r0_44)
  -- line: [664, 699] id: 44
  local r1_44 = UE4.UGameplayStatics.GetGameInstance(r0_44)
  local r2_44 = r1_44:GetGameUIManager()
  if not IsValid(r2_44) then
    return 
  end
  r0_44.UIModePlatform = r2_0.GetDeviceTypeByPlatformName(r0_44)
  r0_44.PlatformName = UGameplayStatics.GetPlatformName()
  local r3_44 = r2_44:LoadUI(UIConst.SCENESTARTUI, "SceneStartUI", UIConst.ZORDER_FOR_DESKTOP)
  if r3_44 ~= nil then
    r3_44:InitMainPage()
  end
  if not r0_44:IsDead() then
    local r4_44 = r2_44:GetUI("BattleMain")
    if r4_44 then
      r4_44:HidePlayerDeadUI()
    end
    r2_44:HideAllUI_EX(TSet(FName), false, "RegionResurgence")
  end
  r0_44:UpdatePlayerTaskInfo()
  if not r1_44:GetLoadingUI() then
    r0_44:RefreshCharUIByPlatform()
  end
end
function r11_0.RefreshCharUIByPlatform(r0_45)
  -- line: [701, 716] id: 45
  local r1_45 = UIManager(r0_45)
  r0_45.SkillUINames = r0_45.SkillUINames and {}
  for r6_45, r7_45 in pairs(r0_45.SkillUINames) do
    DebugPrint("gmy@BP_PlayerCharacter_C:RefreshCharUIByPlatform ", r6_45)
    r1_45:UnLoadUI(r6_45)
    r0_45.SkillUINames[r6_45] = nil
  end
  -- close: r2_45
  DebugPrint("gmy@BP_PlayerCharacter_C BP_PlayerCharacter_C:RefreshCharUIByPlatform1", r0_45.CurrentRoleId)
  local r2_45 = DataMgr.BattleChar[r0_45.CurrentRoleId]
  if r2_45 and r2_45.CharUIId then
    r0_45:TryOpenSkillUI(r2_45.CharUIId, false)
  end
end
function r11_0.CheckDraftCanProduce(r0_46)
  -- line: [718, 734] id: 46
  local r1_46 = GWorld:GetAvatar()
  if not r1_46 then
    return 
  end
  if r1_46:CheckSubRegionType(r1_46:GetCurrentRegionId(), CommonConst.SubRegionType.Home) and r1_46:IsInBigWorld() and #r6_0:GetCanProduceDraftIds() > 0 then
    r0_46:AddTimer(1, function()
      -- line: [726, 731] id: 47
      UE4.UTalkFunctionLibrary.PlayDirectTalkByTalkTriggerId(GWorld.GameInstance, 3001)
    end)
  end
end
function r11_0.UpdatePlayerBloodEffectInfo(r0_48)
  -- line: [736, 794] id: 48
  if not r0_48.InitSuccess then
    return 
  end
  local r3_48 = r0_48:GetCurrentBloodVolume() / r0_48:GetMaxBloodVolume()
  local r4_48 = r0_48:GetAttr("ES")
  local r5_48 = DataMgr.SystemUI[UIConst.BattleNearDeathPCName]
  if r5_48 then
    local r6_48 = r5_48.Params.FirstLevelFactor
    local r7_48 = r5_48.Params.SecondLevelFactor
    local r8_48 = r5_48.Params.ShowUIBloodStrength
    local r9_48 = r5_48.Params.SecondLevelBloodStrength
    if r6_48 == nil or r7_48 == nil or r8_48 == nil or r9_48 == nil then
      return 
    end
    local r10_48 = r0_48.IsNearDeath
    local r11_48 = 0.0001
    if r11_48 < r3_48 and r3_48 < r8_48 then
      r11_48 = r4_48 <= 0
    else
      goto label_45	-- block#11 is visited secondly
    end
    r0_48.IsNearDeath = r11_48
    r11_48 = UIManager(r0_48):GetUIObj(UIConst.BattleNearDeathPCName)
    local r12_48 = nil
    if not r10_48 and r0_48.IsNearDeath then
      r12_48 = "In"
    end
    if r10_48 and r0_48.IsNearDeath then
      r12_48 = "Loop"
    end
    if r10_48 and not r0_48.IsNearDeath then
      r12_48 = "Out"
    end
    if r0_48.IsNearDeath then
      if r11_48 == nil then
        r11_48 = UIManager(r0_48):LoadUINew(UIConst.BattleNearDeathPCName)
      end
      if r11_48 ~= nil then
        local r13_48 = nil
        local r14_48 = nil	-- notice: implicit variable refs by block#[33]
        if r9_48 < r3_48 then
          r14_48 = r6_48
          if r14_48 then
            ::label_94::
            r14_48 = r7_48
          end
        else
          goto label_94	-- block#28 is visited secondly
        end
        if r2_0.GetDeviceTypeByPlatformName() == "PC" then
          r13_48 = r11_48.Bg_1:GetDynamicMaterial()
        else
          r13_48 = r11_48.glassglow:GetDynamicMaterial()
        end
        if r13_48 ~= nil then
          r13_48:SetScalarParameterValue("Flash", r14_48)
        end
      end
    elseif r11_48 ~= nil and r10_48 then
      r11_48:BindToAnimationFinished(r11_48.Out, function()
        -- line: [786, 789] id: 49
        r11_48:UnbindAllFromAnimationFinished(r11_48.Out)
        UIManager(r0_48):UnLoadUI(UIConst.BattleNearDeathPCName)
      end)
      EMUIAnimationSubsystem:EMPlayAnimation(r11_48, r11_48.Out)
    end
    -- close: r6_48
  end
end
function r11_0.UpdateUIMode(r0_50, r1_50)
  -- line: [796, 803] id: 50
  r0_50.UIModePlatform = r1_50
  local r2_50 = UIManager(r0_50):GetUIObj("SceneStartUI")
  if r2_50 ~= nil then
    r2_50:OnCloseOtherUI()
    r2_50:InitMainPage()
  end
end
function r11_0.Landed(r0_51)
  -- line: [805, 813] id: 51
  if not r0_51:PlayerLanded() then
    return 
  end
  if r0_51:CharacterInTag("Shooting") and r0_51:CheckCanEnterTag("LandHeavy") and r0_51.PlayerAnimInstance.FallingSpeed < r0_0.LandHeavySpeed then
    r0_51:StopFire(true, false)
    r0_51:StopSkill(UE.ESkillStopReason.ActionCancel)
  end
end
function r11_0.Impending(r0_52)
  -- line: [815, 820] id: 52
  if not r0_52:PlayerImpending() then
    return 
  end
  r0_52.Overridden.Impending(r0_52)
end
function r11_0.StartSlide(r0_53)
  -- line: [822, 828] id: 53
  print(_G.LogTag, "StartSlideStartSlideStartSlide")
  r0_53:DoSlide()
  if r0_53.NeedSlideEvent then
    EventManager:FireEvent(EventID.OnSlidePressed)
  end
end
function r11_0.PressDodge(r0_54)
  -- line: [830, 833] id: 54
  r0_54.bSprintPressed = true
  r0_54:StartDodge()
end
function r11_0.StartDodge(r0_55)
  -- line: [835, 840] id: 55
  r0_55:DoDodge()
  if r0_55.NeedAvoidEvent then
    EventManager:FireEvent(EventID.OnAvoidPressed)
  end
end
function r11_0.ApplyHitFlyDown(r0_56)
  -- line: [847, 851] id: 56
  r0_56:ResetCapSize()
  r0_56:RealStopSlide(true)
  r0_56.Super.ApplyHitFlyDown(r0_56)
end
function r11_0.ShowPlayerDeadUI(r0_57)
  -- line: [874, 881] id: 57
  local r1_57 = r0_57:GetCurRecoveryUIName()
  if r1_57 then
    local r2_57 = UIManager(r0_57):LoadUINew(r1_57)
    r2_57:OnMainCharacterInitReady()
    r2_57:InitResurgenceUI(r0_57.Eid)
  end
end
function r11_0.IsDeadDuringQuest(r0_58)
  -- line: [883, 886] id: 58
  local r1_58 = GWorld.StoryMgr:GetCurrentStoryNode()
  return r1_58 and r1_58.bDeadTriggerQuestFail
end
function r11_0.HandleDeadDuringQuest(r0_59)
  -- line: [888, 900] id: 59
  local r2_59 = GWorld.StoryMgr:GetResurgencePointInfo()
  local r3_59 = 1.8
  if r2_59 then
    r0_59:AddTimer(r3_59, function()
      -- line: [893, 895] id: 60
      r0_59:RequestDeadAsyncTravel(r2_59)
    end)
  else
    DebugPrint("Tianyi@ 找不到复活点，走区域复活逻辑")
    r0_59:TryEnterDying()
  end
end
function r11_0.RealOnDead_Lua(r0_61, r1_61, r2_61, r3_61)
  -- line: [902, 940] id: 61
  local r4_61 = UE4.UGameplayStatics.GetGameMode(r0_61)
  if r4_61 ~= nil then
    r4_61:NotifyGameModePlayerDead(r0_61)
  end
  DebugPrint("Tianyi@ Player Die!!!!!!!!!!")
  r0_61:SetHoldCrouch(false)
  r0_61:StopFire(false, false)
  r0_61:ZeroComboCount(UE4.EClearComboReason.Dead)
  local r5_61 = UE4.UGameplayStatics.GetGameState(r0_61)
  if r4_61 and (r5_61.GameModeType == "Training" or r5_61.GameModeType == "Trial") then
    local r6_61 = 0
    local r7_61 = r5_61:GetTargetPoint("Training")
    if r7_61 then
      Battle(r0_61):TeleportRecovery(r0_61.Eid, r7_61:K2_GetActorLocation(), r7_61:K2_GetActorRotation(), r6_61)
    else
      DebugPrint("Tianyi@ 找不到训练场复活点")
      Battle(r0_61):TeleportRecovery(r0_61.Eid, FVector(2148.795166, -4042.718262, 2133), FRotator(0, 0, 0), r6_61)
    end
  elseif r0_61:IsDeadDuringQuest() then
    DebugPrint("Tianyi@ 玩家在任务中死亡")
    r0_61:HandleDeadDuringQuest()
  else
    r0_61:TryEnterDying()
  end
  local r6_61 = GWorld:GetAvatar()
  if r0_61:IsMainPlayer() and r6_61 and r6_61:IsInRougeLike() then
    r6_61:SavePlayerSlice({
      Type = r0_0.RougeSliceInfoType.RecoverCount,
      Value = {
        RecoveryCount = r0_61:GetRecoveryCount() + 1,
      },
    })
  end
end
function r11_0.OnTriggerFallTrigger(r0_62, r1_62, r2_62)
  -- line: [942, 947] id: 62
  if r1_62 and r2_62 then
    r1_62:OnTriggerFallTrigger(r2_62, r0_62, UE4.URuntimeCommonFunctionLibrary.GetPlayerControllerIndex(r0_62, r0_62:GetController()))
  end
end
function r11_0.HandleRemoveModPassives(r0_63)
  -- line: [948, 952] id: 63
  r0_63:ClearWeaponModPassive()
  r0_63:RemovePassiveEffectByRole(r0_63:GetController():GetRoleId())
end
function r11_0.TriggerFallingCallable(r0_64, r1_64, r2_64, r3_64, r4_64, r5_64, r6_64)
  -- line: [954, 1051] id: 64
  DebugPrint("OtherActor is Falling Dead. TriggeredByPlayer. ActorName:", r0_64:GetName(), ", UnitId:", r0_64.UnitId, ", Eid:", r0_64.Eid, ", CreatorId:", r0_64.CreatorId, ", CreatorType:", r0_64.CreatorType, ", BornPos:", r0_64.BornPos, "MaxDis", r3_64, "DefaultEnable", r4_64, "DefaultTransform", r2_64)
  if r0_64.FromOtherWorld then
    DebugPrint("OtherActor is player, but from other world  ActorName:", r0_64:GetName())
    return 
  end
  if not IsDedicatedServer(r0_64) and not r0_64:IsMainPlayer() then
    DebugPrint("OtherActor is player, but not main player  ActorName:", r0_64:GetName())
    return 
  end
  if not r0_64.InitSuccess then
    DebugPrint("OtherActor is player, but not InitSuccess  ActorName:", r0_64:GetName())
    return 
  end
  r1_64:TriggerDungeonComponentFun("OnPlayerTriggerFallTrigger")
  r0_64:OnTriggerFallTrigger(r1_64, r5_64)
  local r7_64 = r1_64:TryGetSafeLocation(r0_64, r3_64)
  local r8_64 = nil
  if r0_64:CharacterInTag("Interactive") then
    r0_64:LeaveInteractiveTag("Interactive")
  end
  if r0_64.EnterRegion then
    r0_64:StopAllCurrentMove()
  end
  if r4_64 ~= true then
    local r9_64 = r1_64.EMGameState.GameModeType
    if r9_64 == "Temple" then
      local r10_64, r11_64 = r1_64.EMGameState:BackToTempleArchivePoint()
      if r10_64 then
        r7_64 = r10_64 + FVector(0, 0, r0_64.CapsuleComponent:GetScaledCapsuleHalfHeight())
        r8_64 = r11_64
      else
        DebugPrint("ERROR:BackToTempleArchivePoint ArchivePointLocation is nil")
      end
    elseif r9_64 == "Party" then
      local r10_64, r11_64 = r1_64.EMGameState:BackToPartyArchivePoint(r0_64)
      if r10_64 then
        r7_64 = r10_64 + FVector(0, 0, r0_64.CapsuleComponent:GetScaledCapsuleHalfHeight())
        r8_64 = r11_64
        r1_64:OnPartyPlayerTriggerFallTrigger(r0_64.Eid)
      else
        DebugPrint("ERROR:BackToPartyArchivePoint ArchivePointLocation is nil")
      end
    end
  end
  if not r4_64 and r7_64 ~= FVector(0, 0, 0) then
    r0_64:K2_SetActorLocation(r7_64, false, nil, false)
    if r8_64 ~= nil then
      r0_64:K2_SetActorRotation(r8_64, false)
    end
  else
    r0_64:K2_SetActorLocation(r2_64.Translation, false, nil, false)
    r0_64:K2_SetActorRotation(r2_64.Rotation:ToRotator(), false)
  end
  r0_64:GetMovementComponent():ForceClientUpdate()
  local r11_64 = {}
  r0_64:EnableCheckOverlapPush(r11_64)
  if r0_64.OnTriggerFallingCallable then
    r0_64:OnTriggerFallingCallable()
  end
  if IsDedicatedServer(r0_64) then
    local r9_64 = r0_64.RPCComponent
    if r8_64 then
      r11_64 = r8_64 and r2_64.Rotation:ToRotator()
    else
      goto label_188	-- block#30 is visited secondly
    end
    r9_64:OnPlayerFallTriggerClient(r11_64)
  else
    r0_64:ShowBlackScreenFade_StandAlone(r6_64)
  end
  if r0_64.EnterRegion then
    r0_64:ForceReSyncLocation()
  end
  r0_64:GetController():SetControlRotation(r0_64:K2_GetActorRotation())
  r0_64:Landed()
end
function r11_0.TriggerWaterFallingCallable(r0_65, r1_65, r2_65, r3_65, r4_65)
  -- line: [1053, 1055] id: 65
  r0_65:TriggerFallingCallable(r1_65, r2_65, r3_65, r4_65)
end
function r11_0.ShowBlackScreenFade_StandAlone(r0_66, r1_66, r2_66)
  -- line: [1058, 1069] id: 66
  if r1_66 == "White" then
    UIManager(r0_66):ShowCommonBlackScreen({
      BlackScreenHandle = "BlackScreenFade",
      ScreenColor = "White",
      OutAnimationPlayTime = 1,
      IsPlayOutWhenLoaded = true,
    })
  else
    r0_66:NewBlackScreenFade(r2_66)
  end
end
function r11_0.TryToUpdateScreenEffect(r0_67, r1_67, r2_67)
  -- line: [1146, 1192] id: 67
  local r3_67 = r0_67:GetAttr("ES")
  if r2_67 > 0 then
    local r4_67 = r0_67:GetAttr("MaxES")
    if r4_67 ~= 0 and DataMgr.SystemUI[UIConst.BattleBrokenShieldPCName].Params.ShieldUIResetRate and DataMgr.SystemUI[UIConst.BattleBrokenShieldPCName].Params.ShieldUIResetRate < (r3_67 + r2_67) / r4_67 then
      r0_67.PlayBrokenShiledAnim = true
    end
    if r3_67 <= 0 and r0_67:IsMainPlayer() and r0_67.PlayBrokenShiledAnim then
      r0_67.PlayBrokenShiledAnim = false
      local r5_67 = DataMgr.SystemUI[UIConst.BattleBrokenShieldPCName]
      if r5_67 then
        local r6_67 = r5_67.Params.AnimName
        if r6_67 ~= nil then
          local r7_67 = UIManager(r0_67):PlayScreenEffectAnim(UIConst.LoadInConfig, UIConst.BattleBrokenShieldPCName, {
            {
              AnimName = r6_67,
              StartTime = 0,
              LoopNums = 1,
            }
          })
          local r8_67 = r3_0.NowTime()
          AudioManager(r0_67):PlayUISound(r7_67, "event:/ui/common/char_sheild_break", nil, nil)
          if r0_67.PreHitSoundTime == nil or r8_67 - r0_67.PreHitSoundTime >= 30 then
            r0_67.PreHitSoundTime = r8_67
            local r9_67 = FPlayFMODSoundStruct()
            r9_67.FMODEventPath, r9_67.SelectKey = AudioManager(r0_67):ContactPlayerStringPath(r0_67, "vo_be_hit_heavy")
            r9_67.EventKey = "vo_be_hit_heavy"
            r9_67.bStopWhenAttachedToDestoryed = true
            r9_67.bPlayAs2D = true
            local r10_67 = AudioManager(r0_67):PlayFMODSound_Sync(UE4.UAudioManager.SetObjectToFPlayFMODSoundStruct(r9_67, r0_67))
          end
        end
      end
    end
  end
end
function r11_0.SkillEnd(r0_68, r1_68, r2_68)
  -- line: [1194, 1204] id: 68
  if not r2_68 or r2_68 == 0 then
    return 
  end
  if not r0_68:GetSkill(r2_68) then
    return 
  end
  r0_68.Super.SkillEnd(r1_68, r2_68)
  r0_68:SetRotationRate("OnGround")
end
function r11_0.ResetWeaponHandDelay(r0_69)
  -- line: [1206, 1212] id: 69
  if not r0_69.KeepWeaponOnHand then
    return 
  end
  r0_69.KeepWeaponOnHand = false
  r0_69:RemoveTimer("KeepWeaponDelay")
end
function r11_0.InitPlayerUseSkillTimes_Internal(r0_70)
  -- line: [1278, 1290] id: 70
  if not GWorld:GetAvatar() then
    return 
  end
  for r6_70, r7_70 in pairs(r1_0:Get("bNeedCountPlayerSkillUsedTimesList", true) and {}) do
    r0_70.NeedCountPlayerSkillUsedTimesList:Add(r6_70, r7_70)
  end
  -- close: r2_70
  for r7_70, r8_70 in pairs(r1_0:Get("CountPlayerSkillUsedTimesList", true) and {}) do
    r0_70.CountPlayerSkillUsedTimesList:Add(r7_70, r8_70)
  end
  -- close: r3_70
end
function r11_0.GetPlayerUseSkillTimesFromCache(r0_71, r1_71)
  -- line: [1292, 1298] id: 71
  if not GWorld:GetAvatar() then
    return 
  end
  return (r1_0:Get("CountPlayerSkillUsedTimesList", true) and {})[r1_71] and 0
end
function r11_0.SavePlayerSkillUsedTimes(r0_72)
  -- line: [1327, 1333] id: 72
  if GWorld:GetAvatar() then
    r1_0:Set("bNeedCountPlayerSkillUsedTimesList", r0_72.NeedCountPlayerSkillUsedTimesList:ToTable(), true)
    r1_0:Set("CountPlayerSkillUsedTimesList", r0_72.CountPlayerSkillUsedTimesList:ToTable(), true)
  end
end
function r11_0.PressFire(r0_73)
  -- line: [1354, 1384] id: 73
  if not r0_73:CharacterInTag("LandHeavy") and not r0_73:CheckCanSkillTypeCancel(UE.ESkillType.Shooting) and r0_73:CheckForbidInput() then
    return 
  end
  if r0_73:CheckSkillOccupiedByProp(ESkillName.HeavyShooting) then
    r0_73.PropHoldShootTimer = r0_73:AddTimer(0.2, function()
      -- line: [1359, 1362] id: 74
      r0_73.PropEffectComponent.CurrentPropEffect:OnHoldShoot()
      r0_73.PropHoldShootTimer = nil
    end, false, 0, "PropHoldShoot")
  end
  if r0_73:CheckSkillOccupiedByProp(ESkillName.Fire) then
    r0_73.PropEffectComponent.CurrentPropEffect:OnShootPressed()
    return 
  end
  r0_73.bPressedFire = true
  if r0_73:CharacterHasAnyTag("OverHeat") or r0_73:CharacterHasAnyTag("NoBullet") then
    r0_73:TryFireOverLoad()
    r0_73:RemoveInputCache("Fire")
    return 
  end
  local r1_73 = r0_73:GetSkillByType(UE.ESkillType.HeavyShooting)
  if r1_73 and r1_73 ~= 0 and not r0_73.PropHoldShootTimer then
    r0_73:RemoveInputCache("Fire")
    r0_73.HoldShootingTimer = r0_73:AddTimer(0.2, r0_73.HoldShooting)
    return 
  end
  r0_73:StartFire("Fire")
  if r0_73.NeedFireEvent then
    EventManager:FireEvent(EventID.OnFirePressed)
  end
end
function r11_0.StartFire(r0_75, r1_75)
  -- line: [1386, 1423] id: 75
  -- notice: unreachable block#6
  if r0_75:CheckSkillOccupiedByProp(ESkillName.Fire) then
    return false
  end
  if r0_75:CheckSkillIsBan(ESkillName.Fire) then
    if not r0_75.CurrentMasterBan then
      local r2_75 = UIManager(r0_75):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, GText("UI_RANGED_FORBIDDEN"))
    else
      local r2_75 = false
    end
    return false
  end
  if r0_75:CheckSkillInActive(ESkillName.Fire) then
    return false
  end
  if not r0_75:CheckCanShoot(false) then
    return 
  end
  print(_G.LogTag, "StartFireStartFireStartFire", r1_75)
  if r0_75.PlayerAnimInstance then
    r0_75.PlayerAnimInstance.bPressedFire = true
  end
  local r2_75 = nil
  if r1_75 == "Fire" then
    r2_75 = r0_75:GetSkillByType(UE.ESkillType.Shooting)
  else
    r2_75 = r0_75:GetSkillByType(UE.ESkillType.HeavyShooting)
  end
  print(_G.LogTag, "StartFireStartFireStartFireStartFire", r2_75)
  local r4_75 = nil	-- notice: implicit variable refs by block#[22]
  if not r0_75:UseSkill(r2_75, 0) then
    r4_75 = false
    return r4_75
  end
  r0_75.AllowEnterShoot = false
  if r1_75 ~= "Fire" then
    r4_75 = "HeavyShooting"
    if not r4_75 then
      ::label_93::
      r4_75 = "Fire"
    end
  else
    goto label_93	-- block#21 is visited secondly
  end
  r0_75:RemoveInputCache(r4_75)
  return true
end
function r11_0.HoldShooting(r0_76)
  -- line: [1425, 1433] id: 76
  r0_76.bHoldingShooting = true
  if r0_76:CharacterInTag("Slide") then
    return 
  end
  r0_76:SetInputCache("HeavyShooting")
  r0_76:StartFire("HeavyShooting")
  r0_76.HoldShootingTimer = nil
end
function r11_0.RemoveHoldShootingTimer(r0_77)
  -- line: [1508, 1511] id: 77
  r0_77:RemoveTimer(r0_77.HoldShootingTimer)
  r0_77.HoldShootingTimer = nil
end
function r11_0.ReleaseFire(r0_78)
  -- line: [1513, 1530] id: 78
  if r0_78:CheckSkillOccupiedByProp(ESkillName.HeavyShooting) and r0_78.PropHoldShootTimer then
    r0_78:RemoveTimer("PropHoldShoot")
    r0_78.PropHoldShootTimer = nil
  end
  if r0_78:CheckSkillOccupiedByProp(ESkillName.Fire) then
    r0_78.PropEffectComponent.CurrentPropEffect:OnShootReleased()
    return 
  end
  if not r0_78.bHoldingShooting and r0_78.HoldShootingTimer then
    r0_78:SetInputCache("Fire")
    r0_78:StartFire("Fire")
  end
  r0_78:StopFire(false, true)
end
function r11_0.StopFire(r0_79, r1_79, r2_79)
  -- line: [1532, 1560] id: 79
  if r0_79.NeedFireReleaseEvent then
    EventManager:FireEvent(EventID.OnFireRelease)
  end
  if r1_79 and not r0_79.bPressedFire then
    return 
  end
  if not r1_79 then
    r0_79.bPressedFire = false
    r0_79.bHoldingShooting = false
  end
  r0_79:RemoveHoldShootingTimer()
  if r0_79.PlayerAnimInstance then
    r0_79.PlayerAnimInstance.bPressedFire = false
  end
  if r2_79 then
    return 
  end
  r0_79.ResetedWhenShoot = false
  if r0_79.PlayerAnimInstance then
    if r1_79 then
      r0_79.PlayerAnimInstance.StartShoot = false
      r0_79:DisableReloadWithoutShoot()
      r0_79:ShouldEnableHandIk()
    end
    r0_79.PlayerAnimInstance.StopShoot = false
    r0_79.PlayerAnimInstance.EnableAim = UE4.UKismetMathLibrary.Clamp(r0_79.PlayerAnimInstance.EnableAim + -1, 0, 1)
  end
end
function r11_0.AnimIdleStart(r0_80)
  -- line: [1587, 1592] id: 80
  if r0_80:CheckShouldEnterNormalIdle() then
    r0_80.PlayerAnimInstance:AnimNotify_IdleStartNew()
  end
  r0_80:TryEnterTalk()
end
function r11_0.EnterCrouchTag(r0_81)
  -- line: [1594, 1597] id: 81
  r0_81:TryEnterTalk()
end
function r11_0.CheckShouldEnterNormalIdle(r0_82)
  -- line: [1599, 1614] id: 82
  if not r0_82.PlayerAnimInstance then
    return false
  end
  if not r0_82.BuffManager then
    return true
  end
  local r1_82 = r0_82.BuffManager.CurrentIdleTag
  if r1_82 and r1_82 ~= "0" then
    return false
  end
  return true
end
function r11_0.EnterSkillTag(r0_83)
  -- line: [1626, 1634] id: 83
  r0_83.PreSkillId = r0_83.CurrentSkillId
  if r0_83:IsAnimCrouch() and r0_83.CurrentSkillId == r0_83:GetSkillByType(UE.ESkillType.SlideAttack) then
    return 
  end
  r0_83:ResetCapSize()
end
function r11_0.LeaveSkillTag(r0_84)
  -- line: [1636, 1638] id: 84
  r0_84:EnsureCondemnMonsterRecoverIdle()
end
function r11_0.EnsureCondemnMonsterRecoverIdle(r0_85)
  -- line: [1640, 1655] id: 85
  if not IsAuthority(r0_85) or not r0_85.PreSkillId then
    return 
  end
  local r1_85 = r0_85:GetSkill(r0_85.PreSkillId)
  if not r1_85 then
    return 
  end
  local r2_85 = r1_85:GetSkillType()
  if r2_85 and r2_85 == ESkillType.Condemn and r0_85.CondemnMonsterEid then
    local r3_85 = Battle(r0_85):GetEntity(r0_85.CondemnMonsterEid)
    if r3_85 and r3_85:IsCantLeaveDefeated() then
      r3_85:DefeatedRecoverToIdle(true)
    end
  end
end
function r11_0.EnterBulletJumpTag(r0_86)
  -- line: [1657, 1673] id: 86
  Battle(r0_86):TriggerBattleEvent(BattleEventName.EnterBulletJump, r0_86)
end
function r11_0.LeaveBulletJumpTag(r0_87, r1_87)
  -- line: [1675, 1678] id: 87
  Battle(r0_87):TriggerBattleEvent(BattleEventName.QuitBulletJump, r0_87)
  r0_87:SetPushEnemyInfo("BulletJump", false)
end
function r11_0.CheckKeepBoneHit(r0_88)
  -- line: [1698, 1707] id: 88
  local r1_88 = r0_88.PlayerAnimInstance:GetCurrentStateNameByStateMachineName("Movement")
  if r1_88 ~= "Idle" and r1_88 ~= "Run" then
    r0_88.PlayerAnimInstance.InBoneHit = false
    if r0_88.LuaTimerHandles.BoneHit ~= nil then
      r0_88:RemoveTimer(r0_88.LuaTimerHandles.BoneHit)
      r0_88.LuaTimerHandles.BoneHit = nil
    end
  end
end
function r11_0.ForbidRenderMainCamera(r0_89)
  -- line: [1709, 1715] id: 89
  r0_89.CharCameraComponent:SetOrthoNearClipPlane(100000)
  r0_89.CharCameraComponent:SetOrthoFarClipPlane(100001)
  r0_89.CharCameraComponent:SetOrthoWidth(1)
  r0_89.CharCameraComponent:SetProjectionMode(1)
end
function r11_0.AllowRenderMainCamera(r0_90)
  -- line: [1717, 1719] id: 90
  r0_90.CharCameraComponent:SetProjectionMode(0)
end
function r11_0.CheckNeedFootprint(r0_91)
  -- line: [1816, 1836] id: 91
  if r2_0.GetDeviceTypeByPlatformName(r0_91) == "Mobile" then
    return false
  end
  if IsStandAlone(r0_91) or r9_0.IsAutonomousProxy(r0_91) then
    local r1_91 = GWorld:GetAvatar()
    if r1_91 then
      if r1_91:CheckCurrentSubRegion() == true then
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
function r11_0.IsOpenNormalAim(r0_92)
  -- line: [1838, 1847] id: 92
  if not IsValid(r0_92.RangedWeapon) then
    return false
  end
  local r1_92 = r0_92:GetWeaponAimLockStyle()
  if r1_92 and r1_92 == "FieldAim" then
    return true
  end
  local r2_92 = r0_92.ChooseTargetFilter
  if r2_92 ~= nil then
    r2_92 = r0_92.LockTargetFilter ~= nil
  else
    goto label_21	-- block#7 is visited secondly
  end
  return r2_92
end
function r11_0.HoldToRecovery(r0_93)
  -- line: [1855, 1857] id: 93
  Battle(r0_93):Recovery(r0_93.Eid)
end
function r11_0.CommonRecoveryImpl(r0_94)
  -- line: [1859, 1866] id: 94
  r0_94.Super.CommonRecoveryImpl(r0_94)
  if IsClient(r0_94) or IsStandAlone(r0_94) then
    r0_94:ResetForbidTag("Battle")
    r0_94:RefreshClientSkillLogicComponents()
    r0_94:OnRecoverDissolve()
  end
end
function r11_0.Recovery(r0_95, ...)
  -- line: [1868, 1876] id: 95
  r11_0.Super.Recovery(r0_95, ...)
  if r0_95:IsInRideMove() then
    r0_95:DisableBattleMount(true)
  end
  if IsClient(r0_95) or IsStandAlone(r0_95) then
    r0_95:UseSkill(r0_0.PlayerRecoverySkill, 0)
  end
end
function r11_0.OnRealEnterDying(r0_96)
  -- line: [1878, 1888] id: 96
  r0_96.Super.OnRealEnterDying(r0_96)
  if not IsDedicatedServer(r0_96) and r0_96:IsMainPlayer() then
    r0_96:ShowPlayerDeadUI()
    r0_96:TryHideAllSkillUI()
    if r0_96.TeammateUI then
      r0_96.TeammateUI:OnDead()
    end
  end
end
function r11_0.OnRealDie(r0_97)
  -- line: [1891, 1898] id: 97
  DebugPrint("Tianyi@ Player real die, Eid = " .. r0_97.Eid)
  if IsAuthority(r0_97) then
    UE4.UGameplayStatics.GetGameMode(r0_97):DungeonFinish_OnPlayerRealDead({
      r0_97:GetController().AvatarEidStr
    })
  end
end
function r11_0.OnLanded(r0_98)
  -- line: [1901, 1915] id: 98
  if r0_98:IsExistTimer("PlayDeadMontage") then
    r0_98:RemoveTimer("PlayDeadMontage")
    r0_98:PlayHitMontage("Die")
  end
  if not r0_98:CharacterInTag("Shooting") and r0_98.PlayerAnimInstance and r0_98.PlayerAnimInstance.StartShoot then
    r0_98.PlayerAnimInstance.StartShoot = false
    r0_98.PlayerAnimInstance.FullBody = true
    r0_98:ShouldEnableHandIk()
  end
  if r0_98:CharacterInTag("GrabHit") then
    r0_98:OnGrabHitLanded()
  end
end
function r11_0.EnterDeadTag(r0_99)
  -- line: [1917, 1925] id: 99
  r0_99:AddForbidTag("Battle")
  r0_99:TrackDeadInfo()
  local r1_99 = r0_99:GetBattlePet()
  if not r1_99 then
    return 
  end
  r1_99:HideBattlePet("Dead", true)
end
function r11_0.LeaveDeadTag(r0_100)
  -- line: [1927, 1933] id: 100
  local r1_100 = r0_100:GetBattlePet()
  if not r1_100 then
    return 
  end
  r1_100:HideBattlePet("Dead", false)
end
function r11_0.EnterRecoveryTag(r0_101)
  -- line: [1935, 1937] id: 101
  r0_101:TrackRecoverInfo()
end
function r11_0.GetLogMask(r0_102)
  -- line: [1939, 1941] id: 102
  return _G.LogTag
end
function r11_0.SetLogMask(r0_103, r1_103)
  -- line: [1943, 1946] id: 103
  print("LogInfo", r1_103)
  _G.LogTag = r1_103
end
function r11_0.SetLogMask(r0_104, r1_104)
  -- line: [1948, 1951] id: 104
  print("LogInfo", r1_104)
  _G.LogTag = r1_104
end
function r11_0.GetLogMask(r0_105)
  -- line: [1953, 1955] id: 105
  return _G.LogTag
end
function r11_0.ReceiveSound(r0_106, r1_106, r2_106)
  -- line: [1965, 1967] id: 106
  r0_106.Overridden.ReceiveSound(r0_106, r1_106, r2_106)
end
function r11_0.GetCharSpringArmWorldResultLoc(r0_107)
  -- line: [1973, 1975] id: 107
  return r0_107.CharSpringArmComponent.bWorldResultLoc
end
function r11_0.GetNickName(r0_108)
  -- line: [1993, 2002] id: 108
  local r1_108 = GWorld:GetAvatar()
  if not r1_108 then
    return "夜航主角名"
  end
  if GWorld:IsStandAlone() then
    return r1_108.Nickname
  end
  return r0_108.PlayerState.PlayerName
end
function r11_0.CheckSkillInActive(r0_109, r1_109)
  -- line: [2004, 2010] id: 109
  local r2_109 = r0_109:GetController()
  if not r2_109 or not r2_109.CheckSkillInActive then
    return false
  end
  return r2_109:CheckSkillInActive(r1_109)
end
function r11_0.PickupFunctionDispatcher(r0_110, r1_110, r2_110, r3_110, r4_110, r5_110, r6_110)
  -- line: [2021, 2053] id: 110
  local r7_110 = Battle(r0_110)
  local r8_110 = r7_110:GetEntity(r4_110)
  local r9_110 = DataMgr.Drop[r1_110]
  if r9_110 then
    r7_110:TriggerBattleEvent(BattleEventName.OnGetDrop, r0_110, r1_110)
    if r9_110.UseEffectType then
      local r10_110 = "PickupTo" .. r9_110.UseEffectType
      if IsDedicatedServer(r0_110) then
        if rawget(r0_0.SavePickupType, r9_110.UseEffectType) and not GWorld.bDebugServer then
          local r11_110 = GWorld:GetDSEntity()
          if r11_110 then
            r11_110:PickUpToSave(r10_110, r2_110, r9_110, r1_110, r3_110, r4_110, r6_110)
          end
        elseif ItemUtils:IsServerCreate(r9_110.DropId) and r9_110.IsPickShare then
          UE4.UGameplayStatics.GetGameMode(r0_110):PickUpForAllPlayers(r10_110, r2_110, r9_110.UseParam, r1_110, r3_110, r5_110, r6_110)
        else
          r8_110[r10_110](r8_110, r2_110, r9_110.UseParam, r1_110, r3_110, r5_110, r6_110)
        end
      else
        r8_110[r10_110](r8_110, r2_110, r9_110.UseParam, r1_110, r3_110, r5_110, r6_110)
      end
    end
  end
end
function r11_0.SetDefaultWeapon(r0_111)
  -- line: [2056, 2079] id: 111
  if not IsAuthority(r0_111) then
    return 
  end
  local r1_111 = GWorld:GetAvatar()
  local r2_111 = nil
  for r7_111, r8_111 in pairs(r0_111.Weapons) do
    for r13_111, r14_111 in pairs(DataMgr.BattleWeapon[r7_111].WeaponTag) do
      if r14_111 == "Ultra" then
        r2_111 = r7_111
      end
    end
    -- close: r9_111
  end
  -- close: r3_111
  r0_111:ClearWeapon()
  r0_111:AddWeapon(r1_111.Weapons[r1_111.MeleeWeapon].WeaponId):UnBindWeaponFromHand()
  local r4_111 = r0_111:AddWeapon(r1_111.Weapons[r1_111.RangedWeapon].WeaponId)
  r4_111:ShouldHideWeapon(true, true)
  r4_111:UnBindWeaponFromHand()
  if r2_111 then
    r0_111:AddWeapon(r2_111)
  end
  r0_111:ChangeUsingWeaponByType("Melee")
end
function r11_0.HideMonsterCapsule(r0_112, r1_112)
  -- line: [2081, 2089] id: 112
  for r7_112, r8_112 in pairs(Battle(r0_112):GetAllEntities()) do
    if r8_112 and r8_112.IsMonster and r8_112:IsMonster() then
      r8_112.CapsuleComponent:SetHiddenInGame(r1_112, false)
    end
  end
  -- close: r3_112
end
function r11_0.ServerInteractiveMechanism(r0_113, r1_113, r2_113, r3_113, r4_113, r5_113, r6_113)
  -- line: [2106, 2137] id: 113
  print(_G.LogTag, "lxz ServerInteractiveMechanism", r1_113, r2_113)
  local r7_113 = Battle(r0_113):GetEntity(r1_113)
  if r5_113 then
    if r7_113.CheckMontageInteractive then
      r0_113:SetMechanismEid(r1_113, r7_113:CheckMontageInteractive())
    else
      r0_113:SetMechanismEid(r1_113, false)
    end
  end
  local r8_113 = nil
  if r7_113.CombatStateChangeComponent then
    if r6_113 ~= -1 then
      r7_113.RegionOnlineInteractiveMessage:Add(r0_113.Eid, r6_113)
    end
    print(_G.LogTag, "lxz ServerInteractiveMechanism222", r2_113, r3_113)
    r7_113:ChangeState("Interactive", r2_113, r3_113)
  else
    if r7_113:CharacterInTag("Defeated") then
      r7_113:Penalize(r2_113)
    else
      r7_113:OpenMechanism(r2_113)
    end
    if r7_113.InteractiveComponent then
      r8_113 = r7_113.InteractiveComponent.InteractiveTag
    else
      r8_113 = r7_113.InteractiveTag
    end
    r0_113:SetCharacterTag(r8_113)
  end
end
function r11_0.ServerDeInteractiveMechanism(r0_114, r1_114, r2_114, r3_114, r4_114, r5_114, r6_114, r7_114)
  -- line: [2139, 2161] id: 114
  print(_G.LogTag, "lxz ServerDeInteractiveMechanism", r2_114)
  local r8_114 = Battle(r0_114):GetEntity(r1_114)
  if not r8_114 or not r8_114.OpenMechanism then
    return 
  end
  if r6_114 then
    if r8_114.CheckMontageInteractive then
      r0_114:SetMechanismEid(0, r8_114:CheckMontageInteractive())
    else
      r0_114:SetMechanismEid(0, false)
    end
  end
  if r4_114 == nil or r4_114 ~= r0_0.ForceEndInteractive then
    print(_G.LogTag, "lxz ServerDeInteractiveMechanism2222", r2_114)
    r8_114:CloseMechanism(r2_114, r3_114)
  else
    r8_114:ForceCloseMechanism(r2_114, r3_114)
  end
  if r7_114 ~= -1 then
    r8_114.RegionOnlineInteractiveMessage:Remove(r0_114.Eid)
  end
end
function r11_0.LeaveInteractiveTag(r0_115, r1_115)
  -- line: [2162, 2172] id: 115
  if r1_115 ~= "Idle" and r0_115.MechanismEid ~= 0 then
    local r2_115 = Battle(r0_115):GetEntity(r0_115.MechanismEid)
    if r2_115 then
      local r3_115 = r2_115:GetComponentByClass(UChestInteractiveComponent:StaticClass())
      if r3_115 then
        r3_115:ForceEndInteractive(r0_115, true, r0_0.ForceEndInteractive)
      end
    end
  end
end
function r11_0.LeaveSeatingTag(r0_116, r1_116)
  -- line: [2174, 2177] id: 116
  r0_116:LeaveInteractiveTag(r1_116)
  r0_116.CapsuleComponent:SetCollisionResponseToChannel(ECollisionChannel.ECC_WorldStatic, ECollisionResponse.ECR_Block)
end
function r11_0.ReceiveEndPlay(r0_117, r1_117)
  -- line: [2179, 2197] id: 117
  if r0_117.ArmoryHelper then
    r0_117.ArmoryHelper:K2_DestroyActor()
  end
  r0_117:TryCloseAllSkillUI()
  r0_117:RefreshTeamMemberInfo("ReceiveEndPlay")
  EventManager:RemoveEvent(EventID.OnStartSkillFeature, r0_117)
  EventManager:RemoveEvent(EventID.SetDefaultWeapon, r0_117)
  EventManager:RemoveEvent(EventID.OnMainCharacterInitReady, r0_117)
  EventManager:RemoveEvent(EventID.OnCharacterInitSuitRecover, r0_117)
  EventManager:RemoveEvent(EventID.CloseLoading, r0_117)
  EventManager:RemoveEvent(EventID.OnLevelDeliverBlackCurtainEnd, r0_117)
  EventManager:RemoveEvent(EventID.OnRepBulletNum, r0_117)
  EventManager:RemoveEvent(EventID.OnChangeNickName, r0_117)
  EventManager:RemoveEvent(EventID.OnChangeTitle, r0_117)
  r0_117:UnBindControllerChangedDelegate()
end
function r11_0.UnBindControllerChangedDelegate(r0_118)
  -- line: [2199, 2202] id: 118
  UE4.UGameplayStatics.GetGameInstance(r0_118).OnPawnControllerChangedDelegates:Remove(r0_118, r0_118.OnPlayerControllerChanged)
end
function r11_0.GetLastSafeLocation(r0_119)
  -- line: [2235, 2237] id: 119
  return r0_119.LastSafeLocation
end
function r11_0.SetBrushStaticMeshScalarParameter(r0_120, r1_120)
  -- line: [2240, 2272] id: 120
  if r0_120.IsGetBrushStaticMesh == nil then
    r0_120.BrushStaticMesh = {}
    r0_120.IsGetBrushStaticMesh = false
  end
  if r0_120.IsGetBrushStaticMesh == false then
    local r2_120 = r0_0.BrushStaticMesh
    local r3_120 = TArray(AActor)
    UE4.UGameplayStatics.GetAllActorsOfClass(r0_120, AStaticMeshActor, r3_120)
    for r9_120, r10_120 in pairs(r3_120:ToTable()) do
      if r10_120.StaticMeshComponent ~= nil and r10_120.StaticMeshComponent.StaticMesh ~= nil then
        for r14_120 = 1, #r2_120, 1 do
          if r10_120.StaticMeshComponent.StaticMesh:GetName() == r2_120[r14_120] then
            table.insert(r0_120.BrushStaticMesh, r10_120.StaticMeshComponent)
          end
        end
      end
    end
    -- close: r5_120
    r0_120.IsGetBrushStaticMesh = true
  end
  for r6_120, r7_120 in pairs(r0_120.BrushStaticMesh) do
    local r8_120 = r7_120:CreateDynamicMaterialInstance(0)
    if IsValid(r8_120) then
      r8_120:SetScalarParameterValue("InteractiveScan", r1_120)
    end
    local r9_120 = r7_120:CreateDynamicMaterialInstance(1)
    if IsValid(r9_120) then
      r9_120:SetScalarParameterValue("InteractiveScan", r1_120)
    end
  end
  -- close: r2_120
end
function r11_0.AddDisableInputTag(r0_121, r1_121)
  -- line: [2274, 2279] id: 121
  r0_121.DisableInputTags:AddUnique(r1_121)
  if r0_121.DisableInputTags:Length() > 0 and r0_121:GetController() and r0_121:GetController():IsPlayerController() then
    r0_121:DisableInput(r0_121:GetController())
  end
end
function r11_0.RemoveDisableInputTag(r0_122, r1_122)
  -- line: [2281, 2288] id: 122
  if r0_122.DisableInputTags:Find(r1_122) then
    r0_122.DisableInputTags:RemoveItem(r1_122)
  end
  if r0_122.DisableInputTags:Length() <= 0 and r0_122:GetController() and r0_122:GetController():IsPlayerController() then
    r0_122:EnableInput(r0_122:GetController())
  end
end
function r11_0.RemoveAllDisableInputTag(r0_123)
  -- line: [2290, 2293] id: 123
  r0_123.DisableInputTags:Clear()
  r0_123:EnableInput(r0_123:GetController())
end
function r11_0.EnableInput(r0_124, r1_124)
  -- line: [2295, 2300] id: 124
  if r0_124.DisableInputTags:Length() > 0 then
    return 
  end
  r0_124.Overridden.EnableInput(r0_124, r1_124)
end
function r11_0.SwitchBattleShortcutKeysHidden(r0_125)
  -- line: [2366, 2371] id: 125
  local r2_125 = not r1_0:Get("BattleShortcutHudKeysHidden", true)
  r1_0:Set("BattleShortcutHudKeysHidden", r2_125, true)
  UIManager(r0_125):SetBattleShortCutHudKeysHidden(r2_125)
end
function r11_0.GetSafeRegionLocation(r0_126, r1_126)
  -- line: [2373, 2390] id: 126
  local r2_126 = {}
  local r3_126 = GWorld:GetAvatar()
  local r4_126 = r1_126 and r0_126:GetRecentSafeLocation()
  local r5_126 = r0_126:CheckLocationValid(r4_126)
  local r6_126 = r0_126:GetRegionId(r4_126)
  if r4_126 ~= r0_0.ZeroVector and r6_126 ~= -1 and r5_126 then
    r2_126.RegionId = r6_126
    r2_126.Location = r4_126
    r2_126.Rotation = r0_126:K2_GetActorRotation()
  else
    r2_126.RegionId = r3_126:GetLastRegionId()
    r2_126.Location = r3_126.LastRegionData:GetLocation()
    r2_126.Rotation = r3_126.LastRegionData:GetRotation()
  end
  return r2_126
end
function r11_0.ImmersionModel(r0_127)
  -- line: [2392, 2418] id: 127
  r0_127.Overridden.ImmersionModel(r0_127)
  r4_0.EnableShowBillboard = false
  local r1_127 = UIManager(r0_127)
  r1_127:HideAllComponentUI(r0_127.IsImmersionModel, r0_0.ImmersionModelHideTag)
  local r2_127 = USubsystemBlueprintLibrary.GetWorldSubsystem(r0_127, UNpcHeadUISubsystem)
  if r0_127.IsImmersionModel then
    require("EMLuaConst").IsHideJumpWord = true
    r1_127:AddUIToStateTagsCluster(1, "ImmersionModel", true)
    EventManager:AddEvent(EventID.OnAddWidgetComponent, r0_127, r0_127.OnAddWidgetComponent)
    if r2_127 then
      r2_127:HideAllNpcHeadUI(true, "ImmersionModel")
    end
    MissionIndicatorManager:TriggerAllIndicatorVisible(false)
  else
    require("EMLuaConst").IsHideJumpWord = false
    r1_127:AddUIToStateTagsCluster(1, "ImmersionModel")
    EventManager:RemoveEvent(EventID.OnAddWidgetComponent, r0_127)
    if r2_127 then
      r2_127:HideAllNpcHeadUI(false, "ImmersionModel")
    end
    MissionIndicatorManager:TriggerAllIndicatorVisible(true)
  end
end
function r11_0.OnAddWidgetComponent(r0_128, r1_128)
  -- line: [2420, 2428] id: 128
  local r2_128 = r1_128.WidgetComponent
  if r2_128 then
    local r3_128 = r2_128:GetWidget()
    if r3_128 then
      r3_128:Hide(r0_0.ImmersionModelHideTag)
    end
  end
end
function r11_0.UpdateBulletNumUI(r0_129)
  -- line: [2430, 2459] id: 129
  r0_129:AddDelayFrameFunc(function()
    -- line: [2432, 2458] id: 130
    if r0_129.TakeAimIndicator then
      r0_129.TakeAimIndicator:UpdateAmmoBarProgress(true)
    end
    local r0_130 = UIManager(r0_129)
    if r0_130 then
      if r0_129.UIModePlatform == "PC" then
        local r1_130 = r0_130:GetUIObj("BattleMain")
        if r1_130 ~= nil and r1_130.Char_Skill ~= nil and r1_130.Char_Skill.OnChargeWeaponBullet then
          r1_130.Char_Skill:OnChargeWeaponBullet()
        end
      elseif r0_129.UIModePlatform == "Mobile" then
        local r1_130 = r0_130:GetUIObj("BattleMain")
        if r1_130 ~= nil and r1_130.Char_Skill ~= nil then
          if r1_130.Char_Skill.Bullet.UpdatePlayerWeaponInfo then
            r1_130.Char_Skill.Bullet:UpdatePlayerWeaponInfo()
          end
          if r1_130.Char_Skill.AtkRanged.UpdateRangeWeaponButton then
            r1_130.Char_Skill.AtkRanged:UpdateRangeWeaponButton()
          end
        end
      end
    end
  end)
end
function r11_0.UpdateSkillUIInfo(r0_131, r1_131)
  -- line: [2461, 2494] id: 131
  if IsDedicatedServer(r0_131) then
    return 
  end
  if r0_131.UIModePlatform == "PC" then
    local r2_131 = UIManager(r0_131):GetUIObj("BattleMain")
    if r2_131 ~= nil and r2_131.Char_Skill ~= nil then
      for r7_131, r8_131 in pairs(r1_131) do
        local r9_131 = r0_131:GetSkill(r8_131)
        if r9_131 then
          local r10_131 = r9_131.Data
          r2_131.Char_Skill:RefreshRoleTargetSkill(r10_131.SkillType, r9_131)
          DebugPrint("@zyh123", r8_131, r10_131.SkillType)
        end
      end
      -- close: r3_131
    end
  elseif r0_131.UIModePlatform == "Mobile" then
    local r2_131 = UIManager(r0_131):GetUIObj("BattleMain")
    if r2_131 ~= nil and r2_131.Char_Skill ~= nil then
      for r7_131, r8_131 in pairs(r1_131) do
        local r9_131 = r0_131:GetSkill(r8_131)
        if r9_131 then
          r2_131.Char_Skill:RefreshRoleTargetSkill(r9_131.Data.SkillType, r9_131)
        end
      end
      -- close: r3_131
    end
  end
end
function r11_0.SetESCMenuForbiddenState(r0_132, r1_132)
  -- line: [2497, 2499] id: 132
  r0_132.IsESCForbidden = r1_132 and false
end
function r11_0.GetESCMenuForbiddenState(r0_133)
  -- line: [2501, 2506] id: 133
  if r0_133.IsESCForbidden == nil then
    return false
  end
  return r0_133.IsESCForbidden
end
function r11_0.SetMaxMovingSpeed(r0_134, r1_134)
  -- line: [2508, 2513] id: 134
  r1_134 = math.max(0, r1_134)
  r0_134.PlayerSlideAtttirbute.NormalWalkSpeed = DataMgr.PlayerRotationRates.NormalWalkSpeed.ParamentValue[1] * r1_134
  r0_134.PlayerSlideAtttirbute.CrouchWalkSpeed = DataMgr.PlayerRotationRates.CrouchWalkSpeed.ParamentValue[1] * r1_134
  r0_134:SetWalkSpeed()
end
function r11_0.SetMaxMovingSpeedByInfo(r0_135, r1_135)
  -- line: [2515, 2518] id: 135
  r0_135.PlayerSlideAtttirbute.NormalWalkSpeed = r1_135.NormalWalk
  r0_135.PlayerSlideAtttirbute.CrouchWalkSpeed = r1_135.CrouchWalk
end
function r11_0.TryOpenSkillUI(r0_136, r1_136, r2_136)
  -- line: [2520, 2570] id: 136
  DebugPrint("TryOpenSkillUI: ", r1_136, r2_136)
  if not r0_136:IsMainPlayer() then
    return 
  end
  r1_136 = r0_136:GetReplacedCharUIId(r1_136)
  local r3_136 = r0_136:GetAttr("GradeLevel") and 0
  local r4_136 = DataMgr.BattleCharUI[r1_136][r3_136]
  if r2_136 or not r4_136.TriggerBuffId then
    local r5_136 = UE4.UGameplayStatics.GetGameInstance(r0_136)
    if IsValid(r5_136:GetSceneManager()) then
      local function r7_136()
        -- line: [2536, 2549] id: 137
        local r0_137 = r5_136:GetGameUIManager()
        if r0_137:GetUIObj(r4_136.UIName) then
          r0_137:UnLoadUI(r4_136.UIName)
        end
        r0_136.SkillUINames = r0_136.SkillUINames and {}
        r0_136.SkillUINames[r4_136.UIName] = true
        local r1_137 = r0_137:LoadUINew(r4_136.UIName, r0_136, r4_136.Params)
        if r1_137 and r1_137.InitBattleCharUI then
          r1_137:InitBattleCharUI(r1_136, r3_136)
        end
      end
      if r2_136 and r4_136.TriggerBuffDelay then
        r0_136:AddTimer_Combat(r4_136.TriggerBuffDelay, function()
          -- line: [2553, 2564] id: 138
          local r0_138 = r0_136.BuffManager and r0_136.BuffManager.Buffs
          if r0_138 then
            for r5_138, r6_138 in pairs(r0_138) do
              if r6_138.BuffId == r4_136.TriggerBuffId then
                r7_136()
                break
              end
            end
            -- close: r1_138
          end
        end, false, 0, nil, true)
      else
        r7_136()
      end
      -- close: r7_136
    end
    -- close: r5_136
  end
end
function r11_0.TryCloseSkillUI(r0_139, r1_139)
  -- line: [2572, 2596] id: 139
  DebugPrint("TryCloseSkillUI: ", r1_139)
  if not r0_139:IsMainPlayer() then
    return 
  end
  r1_139 = r0_139:GetReplacedCharUIId(r1_139)
  local r3_139 = DataMgr.BattleCharUI[r1_139][r0_139:GetAttr("GradeLevel") and 0]
  if r3_139 then
    local r6_139 = UE4.UGameplayStatics.GetGameInstance(r0_139):GetGameUIManager():GetUIObj(r3_139.UIName)
    if r6_139 then
      r6_139:RemoveSelf()
    end
    if r0_139.SkillUINames and r0_139.SkillUINames[r3_139.UIName] then
      r0_139.SkillUINames[r3_139.UIName] = nil
    end
  end
end
function r11_0.GetReplacedCharUIId(r0_140, r1_140)
  -- line: [2598, 2613] id: 140
  if r0_140.CurrentSkinId then
    local r2_140 = DataMgr.Skin[r0_140.CurrentSkinId]
    if r2_140 then
      local r3_140 = r2_140.BattleCharUIMap
      if r3_140 and r3_140[r1_140] then
        DebugPrint("gmy@BP_PlayerCharacter_C BP_PlayerCharacter_C:TryOpenSkillUI Skill Replaced", r1_140, r3_140[r1_140])
        r1_140 = r3_140[r1_140]
      end
    end
  end
  return r1_140
end
function r11_0.TryHideAllSkillUI(r0_141)
  -- line: [2615, 2635] id: 141
  if not r0_141:IsMainPlayer() then
    return 
  end
  local r1_141 = r0_141:GetAttr("GradeLevel") and 0
  local r2_141 = DataMgr.BattleChar[r0_141.CurrentRoleId]
  if r2_141.CharUIId then
    local r4_141 = UE4.UGameplayStatics.GetGameInstance(r0_141):GetGameUIManager()
    local r5_141 = DataMgr.BattleCharUI[r2_141.CharUIId][r1_141]
    if r5_141 then
      local r6_141 = r4_141:GetUIObj(r5_141.UIName)
      if r6_141 then
        r6_141:Hide()
      end
    end
  end
end
function r11_0.TryCloseAllSkillUI(r0_142)
  -- line: [2637, 2646] id: 142
  if r0_142.SkillUINames then
    for r5_142, r6_142 in pairs(r0_142.SkillUINames) do
      if r6_142 then
        UIManager(r0_142):UnLoadUINew(r5_142)
      end
    end
    -- close: r1_142
  end
  r0_142.SkillUINames = {}
end
function r11_0.TryShowAllSkillUI(r0_143)
  -- line: [2648, 2665] id: 143
  if not r0_143:IsMainPlayer() then
    return 
  end
  local r1_143 = r0_143:GetAttr("GradeLevel")
  local r2_143 = DataMgr.BattleChar[r0_143.CurrentRoleId]
  if r2_143.CharUIId then
    local r6_143 = UE4.UGameplayStatics.GetGameInstance(r0_143):GetGameUIManager():GetUIObj(DataMgr.BattleCharUI[r2_143.CharUIId][r1_143].UIName)
    if r6_143 then
      r6_143:Show()
    end
  end
end
function r11_0.LeaveRecoveryTag(r0_144, r1_144)
  -- line: [2667, 2669] id: 144
  r0_144:TryShowAllSkillUI()
end
function r11_0.TryEnterTalk(r0_145)
  -- line: [2671, 2678] id: 145
  if r0_145.EnterTalkDelegates then
    for r5_145, r6_145 in pairs(r0_145.EnterTalkDelegates) do
      r6_145()
    end
    -- close: r1_145
    r0_145.EnterTalkDelegates = nil
  end
end
function r11_0.SetEndPointInfo(r0_146, r1_146, r2_146, r3_146)
  -- line: [2680, 2684] id: 146
  r0_146.EndPointSeqEnable = r1_146
  r0_146.EndPointLocation = r2_146
  r0_146.EndPointRotation = r3_146
end
function r11_0.GetEndPointInfo(r0_147)
  -- line: [2686, 2688] id: 147
  return r0_147.EndPointSeqEnable, r0_147.EndPointLocation, r0_147.EndPointRotation
end
function r11_0.OnDungeonSettlement(r0_148, r1_148, r2_148, r3_148)
  -- line: [2690, 2748] id: 148
  local r4_148 = true
  if r1_148 then
    local r5_148 = GWorld.GameInstance.ScenePlayers[r2_148].CurrentWeaponType and "Armory"
    if r3_148 and r3_148.UseDefaultMontage then
      r5_148 = "Armory"
    end
    local r6_148 = GWorld.GameInstance.ScenePlayers[r2_148].CurrentWeaponMeleeOrRanged
    DebugPrint("BP_PlayerCharacter_C:OnDungeonSettlement WeaponType: ", r5_148, "WeaponMeleeOrRanged: ", r6_148)
    local r7_148 = "LevelFinish_" .. r5_148 .. "_Montage"
    r4_148 = r0_148:CheckLevelFinishMontagePath(r7_148)
    if not r4_148 then
      r7_148 = "LevelFinish_Armory_Montage"
    end
    local r8_148 = r0_148:GetBattleCharBodyType()
    local r9_148 = FVector(0, 0, 0)
    if r3_148 and r3_148.CameraParam then
      r9_148.X = r3_148.CameraParam[r8_148][1]
      r9_148.Y = r3_148.CameraParam[r8_148][2]
      r9_148.Z = r3_148.CameraParam[r8_148][3]
    end
    DebugPrint("BP_PlayerCharacter_C:OnDungeonSettlement BattleCharTag", r8_148, "CameraParam", r9_148)
    r0_148:K2_SetActorLocation(UE4.UKismetMathLibrary.TransformLocation(r0_148:GetTransform(), r9_148), false, nil, true)
    r0_148:PlayDungeonSettlementSimpleSkillFeature(false, false, false, false, true, true, r9_148, r0_0.SettlementCameraRotation)
    r0_148:K2_SetActorLocation(UE4.UKismetMathLibrary.TransformLocation(r0_148:GetTransform(), -r9_148), false, nil, true)
    r0_148:PlayActionMontage("Interactive/LevelFinish", r7_148, {})
    r0_148:SetEndPointOffset(r2_148, r3_148)
    DebugPrint("BP_PlayerCharacter_C:OnDungeonSettlement PlayActionMontage: ", r7_148)
    if r6_148 then
      r0_148:ChangeUsingWeaponByType(r6_148)
    end
  else
    local r5_148 = "LevelFinish_Fail_Montage"
    local r6_148 = r0_148:GetController()
    local r7_148 = r6_148:GetControlRotation()
    r6_148:SetControlRotation(FRotator(r7_148.Pitch, r0_148:K2_EMGetActorRotation().Yaw + 180, r7_148.Roll))
    r0_148:PlayActionMontage("Interactive/LevelFinish", r5_148, {})
    r0_148:ResetOnSetEndPoint()
  end
  r0_148:SetCharacterTag("LevelFinish")
  if r1_148 and GWorld.GameInstance.ScenePlayers[r2_148].CurrentWeaponType and r4_148 then
    r0_148.KeepWeaponOnHand = true
    if r0_148.WeaponPos ~= 2 then
      r0_148:BindWeaponToHand()
    end
  end
  r0_148:OnRecoverDissolve()
  local r5_148 = UIManager(r0_148):GetUI(r0_148:GetCurRecoveryUIName())
  if r5_148 then
    r5_148:ShowBattleMainUI()
  end
end
function r11_0.PlayDungeonSettlementFailDeadMontage(r0_149)
  -- line: [2750, 2763] id: 149
  local r1_149, r2_149 = r0_149:GetHitMontageFolderAndPrefix()
  if r1_149 ~= nil then
    local r3_149 = r1_149 .. "Combat/Hit/" .. r2_149 .. "Die" .. r0_0.MontageSuffix .. "." .. r2_149 .. "Die" .. r0_0.MontageSuffix
    local r4_149 = LoadObject(r3_149)
    if not r4_149 then
      DebugPrint("Error: Load Montage Failed!!!", r3_149)
      return 
    end
    r0_149.Mesh:SetHiddenInGame(true)
    r0_149.PartsMesh:SetHiddenInGame(true)
    r0_149.PlayerAnimInstance:Montage_Play(r4_149, 1, UE4.EMontagePlayReturnType.Duration, 3, true)
  end
end
function r11_0.CheckLevelFinishMontagePath(r0_150, r1_150)
  -- line: [2765, 2780] id: 150
  local r2_150 = UBlueprintPathsLibrary.ProjectContentDir()
  local r5_150 = DataMgr.Model[r0_150:GetCharModelComponent():GetCurrentModelId()].MontageFolder and ""
  local r6_150 = r4_150.MontagePrefix and ""
  if not r6_150 then
    return false
  end
  local r7_150 = string.gsub(r5_150, "/Game/", r2_150) .. "Interactive/LevelFinish/" .. r6_150 .. r1_150 .. ".uasset"
  DebugPrint("CheckLevelFinishMontagePath MontPath:", r7_150)
  if UBlueprintPathsLibrary.FileExists(r7_150) then
    return true
  end
  DebugPrint("CheckLevelFinishMontagePath: File not Exists")
  return false
end
function r11_0.OnDungeonSettlementByIndex(r0_151, r1_151, r2_151, r3_151, r4_151)
  -- line: [2782, 2807] id: 151
  local r5_151 = r2_151 and "Armory"
  if r4_151 and r4_151.UseDefaultMontage then
    r5_151 = "Armory"
  end
  local r6_151 = r3_151
  local r7_151 = "LevelFinish_" .. r5_151 .. "_Montage"
  local r8_151 = r0_151:CheckLevelFinishMontagePath(r7_151)
  if not r8_151 then
    r7_151 = "LevelFinish_Armory_Montage"
  end
  r0_151:PlayActionMontage("Interactive/LevelFinish", r7_151, {})
  r0_151:SetEndPointOffset(r1_151, r4_151)
  DebugPrint("BP_PlayerCharacter_C:OnDungeonSettlementByIndex PlayActionMontage: ", r7_151)
  if r6_151 then
    r0_151:ChangeUsingWeaponByType(r6_151)
  end
  r0_151:SetCharacterTag("LevelFinish")
  if r2_151 and r8_151 then
    r0_151.KeepWeaponOnHand = true
    if r0_151.WeaponPos ~= 2 then
      r0_151:BindWeaponToHand()
    end
  end
end
function r11_0.SetMainPlayerDungeonSettlementTransform(r0_152, r1_152, r2_152, r3_152)
  -- line: [2809, 2836] id: 152
  if r1_152 then
    r0_152:ResetIdle()
    local r6_152 = FHitResult()
    UE4.UKismetSystemLibrary.LineTraceSingle(r0_152, r2_152 + FVector(0, 0, r0_152.CapsuleComponent:GetUnscaledCapsuleHalfHeight()), r2_152 + FVector(0, 0, -500), ETraceTypeQuery.TraceScene, false, nil, EDrawDebugTrace.None, r6_152, true)
    r0_152:K2_SetActorLocationAndRotation(FVector(r2_152.X, r2_152.Y, r6_152.ImpactPoint.Z + r0_152.CapsuleComponent:GetUnscaledCapsuleHalfHeight()), r3_152, false, nil, true)
  else
    local r4_152 = UE4.UGameplayStatics.GetGameState(r0_152)
    if not GWorld:GetAvatar() then
      return 
    end
    r0_152:ResetIdle()
    local r7_152 = FHitResult()
    UE4.UKismetSystemLibrary.LineTraceSingle(r0_152, r2_152, r2_152 + FVector(0, 0, -500), ETraceTypeQuery.TraceScene, false, nil, EDrawDebugTrace.None, r7_152, true)
    r0_152:K2_SetActorLocation(FVector(r2_152.X, r2_152.Y, r7_152.ImpactPoint.Z + r0_152.CapsuleComponent:GetUnscaledCapsuleHalfHeight()), false, nil, true)
    r0_152:K2_SetActorRotation(r3_152, false)
  end
end
function r11_0.SetOtherPlayerDungeonSettlementTransform(r0_153)
  -- line: [2838, 2848] id: 153
  r0_153:ResetIdle()
  local r1_153 = r0_153:K2_GetActorLocation()
  local r4_153 = FHitResult()
  UE4.UKismetSystemLibrary.LineTraceSingle(r0_153, r1_153 + FVector(0, 0, r0_153.CapsuleComponent:GetUnscaledCapsuleHalfHeight()), r1_153 + FVector(0, 0, -500), ETraceTypeQuery.TraceScene, false, nil, EDrawDebugTrace.None, r4_153, true)
  r0_153:K2_SetActorLocation(FVector(r1_153.X, r1_153.Y, r4_153.ImpactPoint.Z + r0_153.CapsuleComponent:GetUnscaledCapsuleHalfHeight()), false, nil, true)
end
function r11_0.SetEndPointOffset(r0_154, r1_154, r2_154)
  -- line: [2850, 2859] id: 154
  local r3_154 = FVector(0, 0, 0)
  if r2_154 and r2_154.SettlementOffset then
    r3_154.X = r2_154.SettlementOffset[r1_154][1]
    r3_154.Y = r2_154.SettlementOffset[r1_154][2]
    r3_154.Z = r2_154.SettlementOffset[r1_154][3]
  end
  r0_154:K2_SetActorLocation(UE4.UKismetMathLibrary.TransformLocation(r0_154:GetTransform(), r3_154), false, nil, true)
end
function r11_0.ResetOnSetEndPoint(r0_155)
  -- line: [2861, 2865] id: 155
  r0_155.CharacterMovement.Velocity = FVector(0, 0, 0)
  r0_155:AddGravityModifier(UE4.EGravityModifierTag.AnimNotify, 0)
  r0_155:SetActorEnableCollision(false)
end
function r11_0.CheckCanRecovery(r0_156)
  -- line: [2964, 2972] id: 156
  if IsClient(r0_156) then
    local r1_156 = r0_156:GetRecoveryCount()
    local r2_156 = r0_156:GetRecoveryMaxCount()
    local r3_156 = nil	-- notice: implicit variable refs by block#[5]
    if r2_156 >= 0 then
      r3_156 = r1_156 < r2_156
    else
      goto label_14	-- block#4 is visited secondly
    end
    return r3_156
  else
    return r0_156.Super.CheckCanRecovery(r0_156)
  end
end
function r11_0.SetIsJumpPadLaunched(r0_157, r1_157)
  -- line: [3068, 3070] id: 157
  r0_157.PlayerAnimInstance.IsJumpPadLaunched = r1_157
end
function r11_0.SetIsJumpPadLaunching(r0_158, r1_158)
  -- line: [3072, 3074] id: 158
  r0_158.PlayerAnimInstance.IsJumpPadLaunching = r1_158
end
function r11_0.GetBattleExtraInfo(r0_159)
  -- line: [3076, 3156] id: 159
  local r1_159 = {}
  local r2_159 = r0_159:GetAttr("Hp")
  local r3_159 = r0_159:GetAttr("Sp")
  local r4_159 = {
    RecoveryCount = r0_159:GetRecoveryCount(),
    IsRealDead = false,
  }
  if r0_159:IsDead() then
    r2_159 = r0_159:GetAttr("MaxHp")
    r3_159 = r0_159:GetAttr("MaxSp")
    r4_159.RecoveryCount = math.min(r4_159.RecoveryCount + 1, r0_159:GetRecoveryMaxCount())
  end
  r1_159.RoleInfo = {
    Level = r0_159:GetAttr("Level"),
    Exp = r0_159:GetAttr("Exp"),
    PlayerHp = r2_159,
    PlayerSp = r3_159,
    DeathInfo = r4_159,
  }
  if r0_159.MeleeWeapon then
    r1_159.MeleeWeapon = {
      Level = r0_159.MeleeWeapon:GetAttr("Level"),
      Exp = r0_159.MeleeWeapon:GetAttr("Exp"),
    }
  end
  if r0_159.RangedWeapon then
    local r5_159 = {
      Level = r0_159.RangedWeapon:GetAttr("Level"),
      Exp = r0_159.RangedWeapon:GetAttr("Exp"),
      BulletNum = r0_159.RangedWeapon:GetAttr("BulletNum") and 0,
      MagazineBulletNum = r0_159.RangedWeapon:GetAttr("MagazineBulletNum") and 0,
    }
    r1_159.RangedWeapon = r5_159
  end
  if r0_159.UltraWeapons then
    r1_159.UltraWeapons = {}
    for r9_159, r10_159 in pairs(r0_159.UltraWeapons) do
      table.insert(r1_159.UltraWeapons, {
        Level = r10_159:GetAttr("Level"),
        Exp = r10_159:GetAttr("Exp"),
      })
    end
    -- close: r5_159
  end
  for r10_159, r11_159 in pairs(r0_159:GetPhantomTeammates(false, true)) do
    local r12_159 = r11_159:GetAttr("Hp")
    local r13_159 = r11_159:GetAttr("Sp")
    local r14_159 = {
      RecoveryCount = r11_159:GetRecoveryCount(),
      IsRealDead = false,
    }
    if r11_159:IsDead() then
      if r11_159:IsRealDead() then
        r14_159.IsRealDead = true
      else
        r14_159.RecoveryCount = math.min(r14_159.RecoveryCount + 1, r11_159:GetRecoveryMaxCount())
      end
    end
    r1_159["PhantomInfo" .. r10_159] = {}
    r1_159["PhantomInfo" .. r10_159].RoleInfo = {
      Level = r0_159:GetAttr("Level"),
      PlayerHp = r12_159,
      PlayerSp = r13_159,
      DeathInfo = r14_159,
    }
    local r15_159 = r11_159:GetPhantomWeapon()
    if r15_159:HasTag(CommonConst.WeaponType.RangedWeapon) then
      local r16_159 = r1_159["PhantomInfo" .. r10_159]
      local r17_159 = {
        BulletNum = r15_159:GetAttr("BulletNum") and 0,
        MagazineBulletNum = r15_159:GetAttr("MagazineBulletNum") and 0,
      }
      r16_159.RangedWeapon = r17_159
    end
  end
  -- close: r6_159
  return r1_159
end
function r11_0.GetCurPhantomInfo(r0_160)
  -- line: [3158, 3235] id: 160
  local r1_160 = GWorld:GetAvatar()
  if not r1_160 then
    return 
  end
  local r2_160 = {}
  local r3_160 = r0_160:GetPhantomTeammates()
  local r4_160 = {}
  local r5_160 = {}
  for r10_160, r11_160 in pairs(r3_160) do
    if r11_160:IsPhantom() and (r11_160.IsSpawnByResource or r11_160.IsSpawnBySquad) then
      local r12_160 = r11_160.MeleeWeapon
      local r13_160 = r11_160.RangedWeapon
      local r14_160 = nil
      if r12_160 then
        r14_160 = r12_160.WeaponId
      elseif r13_160 then
        r14_160 = r13_160.WeaponId
      end
      if r14_160 then
        r5_160[r14_160] = r11_160.CurrentRoleId
      end
      r4_160[r11_160.CurrentRoleId] = r11_160
    end
  end
  -- close: r6_160
  for r10_160, r11_160 in pairs(r1_160.Chars) do
    if r4_160[r11_160.CharId] then
      local r12_160 = {}
      for r18_160, r19_160 in pairs(r11_160:GetModSuit()) do
        if r19_160.ModEid and r1_160.Mods[r19_160.ModEid] then
          local r20_160 = r1_160.Mods[r19_160.ModEid]
          table.insert(r12_160, {
            ModId = r20_160.ModId,
            Level = r20_160.Level,
          })
        end
      end
      -- close: r14_160
      r2_160[r11_160.CharId] = {}
      r2_160[r11_160.CharId].Character = {
        CharId = r11_160.CharId,
        Level = r11_160.Level,
        ModSuit = r12_160,
      }
    end
  end
  -- close: r6_160
  for r10_160, r11_160 in pairs(r1_160.Weapons) do
    local r12_160 = r5_160[r11_160.WeaponId]
    if r12_160 and r2_160[r12_160] then
      local r13_160 = {}
      for r19_160, r20_160 in pairs(r11_160:GetModSuit()) do
        if r20_160.ModEid and r1_160.Mods[r20_160.ModEid] then
          local r21_160 = r1_160.Mods[r20_160.ModEid]
          table.insert(r13_160, {
            ModId = r21_160.ModId,
            Level = r21_160.Level,
          })
        end
      end
      -- close: r15_160
      r2_160[r12_160].Weapon = {
        WeaponId = r11_160.WeaponId,
        Level = r11_160.Level,
        ModSuit = r13_160,
      }
    end
  end
  -- close: r6_160
  return r2_160
end
function r11_0.RefreshTeamMemberInfo(r0_161, r1_161)
  -- line: [3237, 3269] id: 161
  if IsDedicatedServer(r0_161) then
    return 
  end
  if not GWorld:GetAvatar() or GWorld:IsStandAlone() or GameState(r0_161).PlayerArray:Num() <= 1 then
    return 
  end
  if not r0_161.PlayerState then
    return 
  end
  local r3_161 = GWorld:GetMainPlayer()
  if r3_161 and r3_161.Eid == r0_161.PlayerState.Eid then
    return 
  end
  if TeamController:GetModel():IsTeammateByAvatarEid(r0_161.PlayerState.AvatarEidStr) then
    r0_161.PlayerState.OnReceiveActorStateChangeDelegate:Broadcast(r0_161.PlayerState.Eid, r7_0.OverReach, true, r1_161 == "ReceiveBeginPlay")
  end
end
function r11_0.PreEnterStory(r0_162, r1_162)
  -- line: [3273, 3278] id: 162
  r0_162:CleanInputWhenEnterTalk()
  r0_162:ReleaseFire()
  r0_162.bInStory = true
  r0_162:SetStealth(true, "Story")
end
function r11_0.PreExitStory(r0_163, r1_163)
  -- line: [3280, 3283] id: 163
  r0_163.bInStory = false
  r0_163:SetStealth(false, "Story")
end
function r11_0._CheckCanChangeToMaster(r0_164, r1_164, r2_164)
  -- line: [3286, 3349] id: 164
  if not IsStandAlone(r0_164) then
    if r1_164 then
      GWorld.logger.error("联机情况下，不能切换女主")
    end
    return false
  end
  if r0_164:CheckSkillIsBan(ESkillName.SwitchMasterOrHero) then
    if r1_164 then
      GWorld.logger.error("禁用切换女主和切回去英雄技能")
    end
    return false
  end
  if r0_164:CheckSkillInActive(ESkillName.SwitchMasterOrHero) then
    if r1_164 then
      GWorld.logger.error("切换女主和切回去英雄技能未激活")
    end
    return false
  end
  local r3_164 = UE4.UGameplayStatics.GetGameInstance(r0_164)
  local r4_164 = GWorld.GameInstance:GetCurrentDungeonId()
  if r4_164 and r4_164 > 0 then
    if r1_164 then
      GWorld.logger.error("副本内，不能切换女主")
    end
    return false
  end
  local r5_164 = GWorld:GetAvatar()
  if not r5_164 then
    if r1_164 then
      GWorld.logger.error("没有连接服务器，不能切换女主")
    end
    return false
  end
  local r6_164 = r5_164:GetCurrentRegionId()
  if not r6_164 or r6_164 == 0 then
    if r1_164 then
      GWorld.logger.error("不在区域中或者区域编号出错，不能切换女主")
    end
    return false
  end
  if not DataMgr.SubRegion[r6_164] then
    if r1_164 then
      GWorld.logger.error("不在区域中或者区域编号出错，不能切换女主")
    end
    return false
  end
  return true
end
function r11_0.CheckCanChangeToMaster(r0_165, r1_165, r2_165)
  -- line: [3351, 3380] id: 165
  r0_165.CanChangeToMaster = r0_165:_CheckCanChangeToMaster(r1_165, true)
  if not r2_165 and (not r0_165:CanEnterInteractive() or not r0_165:CharacterInTag("Idle")) then
    if r1_165 then
      GWorld.logger.error("当前状态不允许切换女主")
    end
    r0_165.CanChangeToMaster = false
    return r0_165.CanChangeToMaster
  end
  local r3_165 = UE4.UGameplayStatics.GetGameMode(r0_165)
  if not IsValid(r3_165) then
    r0_165.CanChangeToMaster = false
    if r1_165 then
      GWorld.logger.error("当前游戏模式无效, 不能切换女主")
    end
  elseif r3_165:IsInDungeon() and r0_165:IsDungeonInBattle() then
    r0_165.CanChangeToMaster = false
  elseif r0_165:IsRegionInBattle() then
    r0_165.CanChangeToMaster = false
  end
  return r0_165.CanChangeToMaster
end
function r11_0.CheckCanChangeBackToHero(r0_166, r1_166)
  -- line: [3382, 3384] id: 166
  return r0_166:_CheckCanChangeToMaster(r1_166, false)
end
function r11_0.SwitchMasterOrHeroUIPerform(r0_167)
  -- line: [3386, 3394] id: 167
  if not IsValid(r0_167.BattleMainUI) then
    r0_167.BattleMainUI = UIManager(r0_167):GetUIObj("BattleMain")
  end
  if r0_167.BattleMainUI == nil or r0_167.BattleMainUI.Char_Skill == nil then
    return 
  end
  r0_167.BattleMainUI.Char_Skill:OnSwitchMasterOrHero()
end
function r11_0.ChangeToMasterUIPerform(r0_168)
  -- line: [3396, 3407] id: 168
  EventManager:FireEvent(EventID.ShowOrHideMainPlayerBloodUI, false, "ChangeRoleToMaster")
  if not IsValid(r0_168.BattleMainUI) then
    r0_168.BattleMainUI = UIManager(r0_168):GetUIObj("BattleMain")
  end
  if r0_168.BattleMainUI == nil or r0_168.BattleMainUI.Char_Skill == nil then
    return 
  end
  r0_168.BattleMainUI.Char_Skill:OnChangeToMaster()
end
function r11_0.ChangeBackToHeroUIPerform(r0_169)
  -- line: [3409, 3420] id: 169
  EventManager:FireEvent(EventID.ShowOrHideMainPlayerBloodUI, true, "ChangeRoleToMaster")
  if not IsValid(r0_169.BattleMainUI) then
    r0_169.BattleMainUI = UIManager(r0_169):GetUIObj("BattleMain")
  end
  if r0_169.BattleMainUI == nil or r0_169.BattleMainUI.Char_Skill == nil then
    return 
  end
  r0_169.BattleMainUI.Char_Skill:OnChangeBackToHero()
end
function r11_0.SwitchMasterOrHero(r0_170)
  -- line: [3422, 3439] id: 170
  r0_170:SwitchMasterOrHeroUIPerform()
  if r0_170.IsSwitchFuncInCD then
    return 
  end
  if r0_170.CurrentMasterBan then
    r0_170:ChangeBackToHero()
  else
    r0_170:ChangeToMaster(true)
  end
  r0_170.IsSwitchFuncInCD = true
  r0_170:AddTimer_Combat(1, function()
    -- line: [3436, 3438] id: 171
    r0_170.IsSwitchFuncInCD = false
  end, false, 0, "SwitchFuncCDTimer")
end
function r11_0.ChangeToMaster(r0_172, r1_172, r2_172)
  -- line: [3441, 3522] id: 172
  if not r0_172:CheckCanChangeToMaster(r1_172, r2_172) then
    return 
  end
  if r0_172.CurrentMasterBan then
    GWorld.logger.error("当前已经是主角状态，不能执行切主角操作")
    return 
  end
  local r3_172 = 111
  local r4_172 = GWorld:GetAvatar()
  local r5_172 = r4_172:GetCurrentRegionId()
  print(_G.LogTag, "CheckCanChangeToMaster", r5_172)
  if not r5_172 or DataMgr.SubRegion[r5_172] == nil then
    GWorld.logger.error("当前不在区域中，不能切换主角")
    return 
  end
  local r6_172 = DataMgr.SubRegion[r5_172].SwitchPlayer
  if not r6_172 then
    GWorld.logger.error("当前区域没有可切换角色，不能切换主角")
    return 
  end
  local r7_172 = 1
  if not r4_172 then
    GWorld.logger.error("没有正常登录，不能切换主角")
    return 
  end
  local r8_172 = {
    RoleInfo = {
      PlayerHp = r0_172:GetAttr("Hp"),
      PlayerSp = r0_172:GetAttr("Sp"),
      PlayerES = r0_172:GetAttr("ES"),
    },
  }
  local r9_172 = {}
  local r10_172 = r0_172.RangedWeapon
  if r10_172 then
    r10_172 = r0_172.RangedWeapon:GetAttr("BulletNum") and 0
  else
    goto label_90	-- block#13 is visited secondly
  end
  r9_172.BulletNum = r10_172
  r10_172 = r0_172.RangedWeapon
  if r10_172 then
    r10_172 = r0_172.RangedWeapon:GetAttr("MagazineBulletNum") and 0
  else
    goto label_101	-- block#16 is visited secondly
  end
  r9_172.MagazineBulletNum = r10_172
  r8_172.RangedWeapon = r9_172
  r0_172.HeroTempInfo = r8_172
  r4_172.HeroTempInfo = r0_172.HeroTempInfo
  if r6_172 == "Player" then
    r7_172 = r4_172.Sex
  else
    r7_172 = r4_172.WeitaSex
  end
  print(_G.LogTag, "ChangeToMaster", r3_172, r7_172, r6_172)
  r8_172 = DataMgr.Player2RoleId[r6_172]
  if not r8_172 then
    GWorld.logger.error("没有找到对应的主角信息，请检查导表")
    return 
  end
  r9_172 = r8_172[r7_172]
  if not r9_172 then
    GWorld.logger.error("对应性别没有角色，请检查导表")
    return 
  end
  r0_172:ChangeRole(r9_172, nil)
  r0_172:RealChangeUsingWeapon(nil)
  r0_172:ClearAllSuitItem()
  r0_172:BanSkills()
  r0_172.CurrentMasterBan = true
  if r4_172 then
    r4_172.CurrentMasterBan = true
  end
  r0_172:CombindTwoKeyToOneCommand("Skill3", "SwitchMaster")
  r0_172:ChangeToMasterUIPerform()
  r0_172:DisableBattleWheel()
  r10_172 = r0_172:GetBattlePet()
  if r10_172 then
    r10_172:HideBattlePet("Master", true)
  end
end
function r11_0.ChangeBackToHero(r0_173)
  -- line: [3524, 3545] id: 173
  if not r0_173:CheckCanChangeBackToHero(true) then
    return 
  end
  if not IsValid(UE4.UGameplayStatics.GetGameMode(r0_173)) then
    return 
  end
  if not r0_173.CurrentMasterBan then
    GWorld.logger.error("当前不是女主状态，不能从女主切回军械库角色")
    return 
  end
  r0_173:RecoverBanSkills()
  r0_173.NotChangeRoleTips = true
  r0_173:RecoverHeroInfo()
  r0_173:ChangeRole()
  r0_173.NotChangeRoleTips = false
  r0_173:WithChangeBackToHero()
end
function r11_0.WithChangeBackToHero(r0_174)
  -- line: [3547, 3558] id: 174
  r0_174:SeparateTwoKeyToOneCommand("Skill3", "SwitchMaster")
  r0_174:ChangeBackToHeroUIPerform()
  r0_174:EnableBattleWheel()
  local r1_174 = r0_174:GetBattlePet()
  if r1_174 then
    r1_174:HideBattlePet("Master", false)
  end
end
function r11_0.RecoverHeroInfo(r0_175)
  -- line: [3560, 3572] id: 175
  local r1_175 = GWorld:GetAvatar()
  local r2_175 = r0_175.HeroTempInfo and r1_175.HeroTempInfo
  if r2_175 ~= nil then
    local r3_175 = GWorld:GetAvatar()
    r0_175:GetController():SetAvatarInfo(r2_0.ObjId2Str(r3_175.Eid), AvatarUtils:UpdateBattleInfo(AvatarUtils:GetDefaultBattleInfo(r3_175), r2_175))
    r0_175.HeroTempInfo = nil
    r3_175.HeroTempInfo = nil
  end
end
function r11_0.RecoverBanSkills(r0_176)
  -- line: [3574, 3584] id: 176
  print(_G.LogTag, "RecoverBanSkills", r0_176.CurrentRoleId)
  if r0_176.CurrentMasterBan then
    r0_176:UnBanSkills()
    r0_176.CurrentMasterBan = false
    local r1_176 = GWorld:GetAvatar()
    if r1_176 then
      r1_176.CurrentMasterBan = false
    end
  end
end
function r11_0.OnBattleStateChanged(r0_177, r1_177)
  -- line: [3586, 3597] id: 177
  if not r1_177 then
    return 
  end
  if not r0_177.CurrentMasterBan then
    return 
  end
  print(_G.LogTag, "OnBattleStateChanged", r1_177)
  r0_177:ChangeBackToHero()
end
function r11_0.BanSkills(r0_178)
  -- line: [3598, 3609] id: 178
  local r1_178 = TArray(0)
  for r6_178, r7_178 in pairs(r0_0.AllSKillNames) do
    if not r0_178:CheckSkillInActive(r7_178) then
      r1_178:Add(r7_178)
    end
  end
  -- close: r2_178
  local r2_178 = r0_178:GetController()
  if r2_178 then
    r2_178:BanSkills(r1_178, "MasterBan")
  end
end
function r11_0.UnBanSkills(r0_179)
  -- line: [3611, 3616] id: 179
  local r1_179 = r0_179:GetController()
  if r1_179 then
    r1_179:UnBanSkills("MasterUnBan")
  end
end
function r11_0.RegionBanSkills(r0_180)
  -- line: [3617, 3629] id: 180
  local r1_180 = TArray(0)
  for r6_180, r7_180 in pairs(r0_0.AllSKillNames) do
    if not r0_180:CheckSkillInActive(r7_180) then
      r1_180:Add(r7_180)
    end
  end
  -- close: r2_180
  local r2_180 = r0_180:GetController()
  if r2_180 then
    r2_180:BanSkills(r1_180, "RegionBan")
  end
end
function r11_0.RegionUnBanSkills(r0_181)
  -- line: [3631, 3636] id: 181
  local r1_181 = r0_181:GetController()
  if r1_181 then
    r1_181:UnBanSkills("RegionUnBan")
  end
end
function r11_0.MoveAlongSplineBanSkills(r0_182)
  -- line: [3638, 3650] id: 182
  local r1_182 = TArray(0)
  for r6_182, r7_182 in pairs(r0_0.AllSKillNames) do
    if not r0_182:CheckSkillInActive(r7_182) then
      r1_182:Add(r7_182)
    end
  end
  -- close: r2_182
  r1_182:Add(ESkillName.SwitchMasterOrHero)
  local r2_182 = r0_182:GetController()
  if r2_182 then
    r2_182:BanSkills(r1_182, "MoveAlongSpline")
  end
end
function r11_0.MoveAlongSplineUnBanSkills(r0_183)
  -- line: [3652, 3657] id: 183
  local r1_183 = r0_183:GetController()
  if r1_183 then
    r1_183:UnBanSkills("MoveAlongSpline")
  end
end
function r11_0.ForbidActionWhileMoveAlongSpline(r0_184, r1_184)
  -- line: [3659, 3674] id: 184
  local r2_184 = TArray(0)
  r2_184:Add(ESkillName.Jump)
  r2_184:Add(ESkillName.Slide)
  r2_184:Add(ESkillName.BulletJump)
  r2_184:Add(ESkillName.Avoid)
  r2_184:Add(ESkillName.Crouch)
  local r3_184 = r0_184:GetController()
  if r3_184 then
    if r1_184 then
      r3_184:InActiveSkills(r2_184, "MoveAlongSpline")
    else
      r3_184:ActiveSkills(r2_184, "MoveAlongSpline")
    end
  end
end
function r11_0.ForbidSkillsInHooking(r0_185, r1_185)
  -- line: [3676, 3700] id: 185
  local r2_185 = {
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
  local r3_185 = TArray(0)
  for r8_185, r9_185 in pairs(r2_185) do
    r3_185:Add(r9_185)
  end
  -- close: r4_185
  local r4_185 = r0_185:GetController()
  if r4_185 then
    if r1_185 then
      r4_185:InActiveSkillsInHooking(r3_185)
    else
      r4_185:ActiveSkillsEndHooking(r3_185)
    end
  end
end
function r11_0.ForbidActiveSkills(r0_186, r1_186)
  -- line: [3702, 3709] id: 186
  r0_186:ForbidSkills(r1_186, {
    ESkillName.Skill1,
    ESkillName.Skill2,
    ESkillName.Skill3
  })
end
function r11_0.ForbidAllSkills(r0_187, r1_187)
  -- line: [3711, 3719] id: 187
  r0_187:ForbidSkills(r1_187, {
    ESkillName.Skill1,
    ESkillName.Skill2,
    ESkillName.Skill3,
    ESkillName.Passive
  })
end
function r11_0.ForbidMeleeSkills(r0_188, r1_188)
  -- line: [3721, 3729] id: 188
  r0_188:ForbidSkills(r1_188, {
    ESkillName.Attack,
    ESkillName.FallAttack,
    ESkillName.HeavyAttack,
    ESkillName.SlideAttack
  })
end
function r11_0.ForbidRangedSkills(r0_189, r1_189)
  -- line: [3731, 3738] id: 189
  r0_189:ForbidSkills(r1_189, {
    ESkillName.Fire,
    ESkillName.ChargeBullet,
    ESkillName.HeavyShooting
  })
end
function r11_0.ForbidSkills(r0_190, r1_190, r2_190)
  -- line: [3740, 3753] id: 190
  local r3_190 = TArray(0)
  for r8_190, r9_190 in pairs(r2_190) do
    r3_190:Add(r9_190)
  end
  -- close: r4_190
  local r4_190 = r0_190:GetController()
  if r4_190 then
    if r1_190 then
      r4_190:InActiveSkills(r3_190, "Ban")
    else
      r4_190:ActiveSkills(r3_190, "UnBan")
    end
  end
end
function r11_0.AfterLoading(r0_191, r1_191)
  -- line: [3755, 3827] id: 191
  if r0_191.AfterLoadingDone then
    return 
  end
  if r1_0:Get("ImmersionModel") then
    r0_191:ImmersionModel()
  end
  r0_191:RefreshCharUIByPlatform()
  local r3_191 = GWorld:GetAvatar()
  if r3_191 and r3_191:CheckSubRegionType(nil, CommonConst.SubRegionType.Home) then
    r0_191:CheckDraftCanProduce()
  end
  r0_191:SetActorHideTag("DeliveryMontage", false)
  local r4_191 = UE4.UGameplayStatics.GetGameInstance(r0_191)
  if r4_191 and r1_191 and r1_191 == r0_191.Eid and r4_191.ShouldPlayDeliveryEndMontage then
    local r8_191 = {
      OnNotifyBegin = function()
        -- line: [3780, 3784] id: 192
        DebugPrint("zwk OnDeliveryAfterLoadingMontageNotifyBegin")
        r0_191:RemoveDisableInputTag("DeliverMontage")
      end,
      OnInterrupted = function()
        -- line: [3785, 3789] id: 193
        DebugPrint("zwk OnDeliveryAfterLoadingInterrupted", r4_191.ShouldPlayDeliveryEndMontage)
        r0_191:RemoveDisableInputTag("DeliverMontage")
        r4_191.ShouldPlayDeliveryEndMontage = false
      end,
      OnCompleted = function()
        -- line: [3790, 3793] id: 194
        DebugPrint("zwk OnDeliveryAfterLoadingMontageCompleted", r4_191.ShouldPlayDeliveryEndMontage)
        r4_191.ShouldPlayDeliveryEndMontage = false
      end,
    }
    DebugPrint("zwk OnDeliveryAfterLoadingMontageBegin")
    if r3_191 and r3_191.IsInRegionOnline and r3_191.CurrentOnlineType then
      r0_191:ForceReSyncLocation()
      r3_191:SwitchOnlineState(r3_191.CurrentOnlineType, CommonConst.OnlineState.Normal)
    end
    r0_191:ResetIdle()
    r0_191:AddDisableInputTag("DeliverMontage")
    r0_191:PlayTeleportAction(r8_191, false, true, false)
    r0_191.Mesh:GetAnimInstance():Montage_JumpToSection("End")
    r0_191:AddTimer(2, function()
      -- line: [3811, 3818] id: 195
      if r0_191.DisableInputTags:Find("DeliverMontage") then
        DebugPrint("zwk RemoveDeliverTag")
      end
      r0_191:RemoveDisableInputTag("DeliverMontage")
      r0_191:SetActorHideTag("DeliveryMontage", false)
    end, false, 0)
  end
  r0_191.AfterLoadingDone = true
  r0_191:AddTimer(1, function()
    -- line: [3824, 3826] id: 196
    r0_191.AfterLoadingDone = false
  end)
end
function r11_0.GetIsInDelivery(r0_197)
  -- line: [3829, 3836] id: 197
  local r1_197 = UE4.UGameplayStatics.GetGameInstance(r0_197)
  local r2_197 = r1_197:GetLoadingUI()
  local r3_197 = r2_197 and r2_197.bIsInLoading
  local r4_197 = UIManager(r0_197):GetUIObj("BlackScreenXiaobai")
  return r3_197 and r4_197 and r1_197.ShouldPlayDeliveryEndMontage
end
function r11_0.LoadHitDirection(r0_198, r1_198, r2_198)
  -- line: [3866, 3874] id: 198
  r1_198.CurHitDirectionNum = r1_198.CurHitDirectionNum + 1
  RunAsyncTask(r0_198, "CreateHitDirectionHandler" .. r1_198.CurHitDirectionNum, function(r0_199)
    -- line: [3868, 3873] id: 199
    r1_198:AddToQueue(UE4.UGameplayStatics.GetGameInstance(r0_198):GetGameUIManager():LoadUIAsync("BattleHitDirection", r0_199, r2_198, r0_198))
  end)
end
function r11_0.DungeonOtherPlayerLeave(r0_200)
  -- line: [3876, 3886] id: 200
  if not r0_200:IsMainPlayer() and IsClient(r0_200) then
    EventManager:FireEvent(EventID.OnDungeonOtherPlayerLeave, r0_200)
    if UIManager(r0_200):GetUIObj("TeamToast") then
      UIManager(r0_200):UnLoadUINew("TeamToast")
    end
    UIManager(r0_200):LoadUINew("TeamToast", r0_200.PlayerState, false)
  end
end
function r11_0.SetCollisionProfileOverlapAll(r0_201, r1_201)
  -- line: [3888, 3910] id: 201
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
function r11_0.NeedArmoryHelper(r0_202)
  -- line: [3912, 3914] id: 202
  return GWorld:GetAvatar() ~= nil
end
function r11_0.RequestDeadAsyncTravel(r0_203, r1_203)
  -- line: [3915, 4051] id: 203
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
    -- line: [3927, 3948] id: 204
    r4_203:HideCommonBlackScreen("DeadAsyncTravel")
    local r0_204 = r4_203:GetUIObj("MainTaskIndicator")
    if IsValid(r0_204) then
      r0_204:SetVisibility(UE4.ESlateVisibility.Visible)
    end
    local r1_204 = r2_203:GetSceneManager()
    local r2_204 = UE4.UGameplayStatics.GetGameMode(r0_203)
    local r3_204 = r2_204:GetLevelLoader()
    r1_204:ShowOrHideAllSceneGuideIcon(true)
    r0_203:EnableInput(r6_203)
    if IsValid(r3_204) then
      r3_204:RemoveArtLevelLoadedCompleteCallback(r2_204:GetLevelLoader():GetLevelIdByLocation(r9_203.Translation))
    end
    r0_203:DisablePlayerInputInDeliver(false)
    local r4_204 = GWorld.StoryMgr
    if r4_204 then
      r4_204:FailCurrentQuestWhenDead()
    end
  end
  local r14_203 = {
    BlackScreenHandle = "DeadAsyncTravel",
    BlackScreenText = GText(r1_203.FailBlackScreenText),
    InAnimationObj = r0_203,
    InAnimationPlayTime = r1_203.FadeInTime and nil,
    InAnimationCallback = function()
      -- line: [3950, 4039] id: 205
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
        -- line: [3963, 3969] id: 206
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
        -- line: [3975, 3981] id: 207
        if r0_203.DurationEnd and r0_203.TravelFinish then
          r0_203.DurationEnd = nil
          r0_203.TravelFinish = nil
          r10_203()
        end
      end
      local function r8_205()
        -- line: [3982, 3985] id: 208
        r0_203.TravelFinish = true
        r7_205()
      end
      r4_205:AddTimer(r1_203.ContinueTime, function()
        -- line: [3986, 3989] id: 209
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
            -- line: [4026, 4029] id: 210
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
function r11_0.TeleportToCloestTeleportPoint(r0_211, r1_211, r2_211)
  -- line: [4053, 4126] id: 211
  local r3_211 = UE4.UGameplayStatics.GetGameMode(r0_211)
  if not r3_211 then
    return false
  end
  if not r3_211:IsInRegion() then
    return 
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
  local r13_211 = nil	-- notice: implicit variable refs by block#[38]
  if r9_211 then
    r13_211 = r9_211:K2_GetActorLocation()
    if not r13_211 then
      ::label_131::
      r13_211 = r0_211.CurrentLocation
    end
  else
    goto label_131	-- block#37 is visited secondly
  end
  r13_211 = r3_211:GetLevelLoader():GetStartPointByManager(r11_211:GetParentLevelIdByLocation(r13_211), r10_211)
  r4_211:RequestAsyncTravel(r0_211, r13_211:GetTransform(), {
    r0_211,
    function()
      -- line: [4120, 4123] id: 212
      if r1_211 then
        r1_211()
      end
    end
  })
  return true
end
function r11_0.InpActEvt_GlobalSlow_K2Node_InputActionEvent_1(r0_213, r1_213)
  -- line: [4128, 4132] id: 213
  if TeamController and TeamController:GetTeamPopupBarOpen() then
    return 
  end
  DebugPrint(LXYTag, "BP_PlayerCharacter_C:InpActEvt_GlobalSlow_K2Node_InputActionEvent_1")
  r0_213.Overridden.InpActEvt_GlobalSlow_K2Node_InputActionEvent_1(r0_213, r1_213)
end
function r11_0.CallClientPrint_Lua(r0_214, r1_214)
  -- line: [4134, 4136] id: 214
  print(LogTag, "服务器的输出为:" .. tostring(r1_214))
end
function r11_0.SetEnableFallAtkDir(r0_215)
  -- line: [4138, 4154] id: 215
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
function r11_0.UpdateEnableFallAtkDir(r0_216, r1_216)
  -- line: [4156, 4159] id: 216
  r0_216.Overridden.UpdateEnableFallAtkDir(r0_216, r1_216)
  r1_0:Set("EnableFallAtkDir", r1_216)
end
function r11_0.GetCurrentCharUI(r0_217)
  -- line: [4161, 4166] id: 217
  local r1_217 = DataMgr.BattleChar[r0_217.CurrentRoleId]
  if r1_217.CharUIId then
    return r0_217:GetCharUIObj(r1_217.CharUIId)
  end
end
function r11_0.GetCharUIObj(r0_218, r1_218)
  -- line: [4168, 4176] id: 218
  local r2_218 = GWorld.GameInstance:GetGameUIManager()
  if not IsValid(r2_218) then
    return nil
  end
  return r2_218:GetUIObj(DataMgr.BattleCharUI[r1_218][r0_218:GetAttr("GradeLevel") and 0].UIName)
end
function r11_0.K2_OnEndViewTarget(r0_219, r1_219)
  -- line: [4178, 4180] id: 219
  EventManager:FireEvent(EventID.OnEndViewTarget)
end
function r11_0.K2_OnBecomeViewTarget(r0_220, r1_220)
  -- line: [4181, 4185] id: 220
  rawset(r0_220, "Controller", r1_220)
  rawset(r1_220, "PlayerCameraManager", r1_220.PlayerCameraManager)
  EventManager:FireEvent(EventID.OnBecomeViewTarget)
end
function r11_0.SetRegionOnlineState(r0_221)
  -- line: [4187, 4203] id: 221
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
function r11_0.UpdateRegionOnlineState(r0_222, r1_222)
  -- line: [4204, 4207] id: 222
  r0_222.bOpenRegionOnline = r1_222
  r1_0:Set("AutoJoin", r1_222)
end
function r11_0.GetPlayerGender(r0_223, r1_223)
  -- line: [4208, 4215] id: 223
  local r2_223 = GWorld:GetAvatar()
  if r2_223 then
    return r2_223.Sex
  else
    return 0
  end
end
function r11_0.GetTeamMemberEidArray(r0_224)
  -- line: [4217, 4234] id: 224
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
function r11_0.EnterRegionOnlineRegisterTeamEvent(r0_225, r1_225)
  -- line: [4236, 4269] id: 225
  if not TeamController or not TeamController:GetModel() then
    return 
  end
  local r2_225 = UE4.URegionSyncSubsystem.GetInstance(r0_225)
  if r1_225 then
    TeamController:RegisterEvent(r0_225, function(r0_226, r1_226, ...)
      -- line: [4242, 4265] id: 226
      DebugPrint("EnterRegionOnlineRegisterTeamEvent  " .. r1_226)
      local r2_226 = TeamCommon.EventId.TeamOnAddPlayer
      local r3_226 = nil	-- notice: implicit variable refs by block#[15]
      if r1_226 == r2_226 then
        ... = ... -- error: untaken top expr
        r3_226 = r2_225
        if r3_226 and r2_226 then
          r3_226 = r2_226.Eid
          if r3_226 then
            r2_225:SetOnlinePlayerTeamMember(r2_0.ObjId2Str(r2_226.Eid), true)
          end
        end
      else
        r2_226 = TeamCommon.EventId.TeamOnDelPlayer
        if r1_226 == r2_226 then
          ... = ... -- error: untaken top expr
          r3_226 = r2_225
          if r3_226 and r2_226 then
            r3_226 = r2_226.Eid
            if r3_226 then
              r2_225:SetOnlinePlayerTeamMember(r2_0.ObjId2Str(r2_226.Eid), true)
            end
          end
        elseif r1_226 == TeamCommon.EventId.TeamOnInit or r1_226 == TeamCommon.EventId.TeamLeave then
          r2_226 = r1_226 == TeamCommon.EventId.TeamOnInit
          ... = ... -- error: untaken top expr
          local r4_226 = r3_226 and TeamController:GetModel():GetTeam()
          if not r4_226 or not r4_226.Members then
            return 
          end
          for r9_226, r10_226 in pairs(r4_226.Members) do
            if r2_225 then
              r2_225:SetOnlinePlayerTeamMember(r2_0.ObjId2Str(r10_226.Eid), r2_226)
            end
          end
          -- close: r5_226
        end
      end
    end)
  else
    TeamController:UnRegisterEvent(r0_225)
  end
end
function r11_0.OnChangeNickName(r0_227, r1_227)
  -- line: [4271, 4274] id: 227
  r0_227:EnableHeadWidget("Name", false)
  r0_227:EnableHeadWidget("Name", true, r1_227)
end
function r11_0.OnChangeTitle(r0_228, r1_228, r2_228, r3_228)
  -- line: [4276, 4278] id: 228
  r0_228:RefreshTitle(r1_228, r2_228, r3_228)
end
function r11_0.EnableNameWidget(r0_229)
  -- line: [4280, 4300] id: 229
  EventManager:AddEvent(EventID.OnChangeNickName, r0_229, r0_229.OnChangeNickName)
  EventManager:AddEvent(EventID.OnChangeTitle, r0_229, r0_229.OnChangeTitle)
  local r1_229 = r0_229.HeadWidgetComponent == nil
  r0_229:InitHeadWidgetComponent()
  if r1_229 then
    r0_229:EnableHeadWidget("Name", false)
    r0_229:EnableHeadWidget("Title", false)
  end
  local r2_229 = GWorld:GetAvatar()
  if r2_229 then
    r0_229:OnChangeNickName(r2_229.Nickname)
    r0_229:OnChangeTitle(r2_229.TitleBefore, r2_229.TitleAfter, r2_229.TitleFrame)
  end
  if r0_229.HeadWidgetComponent then
    local r3_229 = r0_229.HeadWidgetComponent:GetWidget()
    if r3_229 then
      r3_229:SetUIVisibilityTag("MainPlayerDisableNameWidget", false)
    end
  end
end
function r11_0.DisableNameWidget(r0_230)
  -- line: [4302, 4314] id: 230
  if not r0_230.HeadWidgetComponent then
    return 
  end
  EventManager:RemoveEvent(EventID.OnChangeNickName, r0_230)
  EventManager:RemoveEvent(EventID.OnChangeTitle, r0_230)
  if r0_230.HeadWidgetComponent then
    local r1_230 = r0_230.HeadWidgetComponent:GetWidget()
    if r1_230 then
      r1_230:SetUIVisibilityTag("MainPlayerDisableNameWidget", true)
    end
  end
end
AssembleComponents(r11_0, {
  "GetDamageInstigatorCurrentAngle"
})
return r11_0
