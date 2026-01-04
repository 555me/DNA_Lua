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
  -- line: [38, 88] id: 2
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
  local r2_2 = nil	-- notice: implicit variable refs by block#[4]
  if r0_2:IsMainPlayer() then
    EventManager:FireEvent(EventID.OnMainCharacterBeginPlay)
    local r1_2 = r1_0:Get("IsOpenHelperAim")
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
  r0_2:BindBossSpCameraChanged()
  r2_2 = r0_2.CharFSMComp
  if r2_2 then
    r0_2.CharFSMComp.OnAfterTagChanged:Add(r0_2, r0_2.OnTagChange)
  end
end
function r11_0.OnTagChange(r0_3, r1_3, r2_3, r3_3)
  -- line: [90, 109] id: 3
  if r3_3 == "GrabHit" and not r0_3.GrabHitCheckTimer then
    r0_3.GrabHitCheckTimer = r0_3:AddTimer(1, function()
      -- line: [92, 102] id: 4
      if r0_3:CharacterInTag("GrabHit") then
        r0_3:OnGrabHitLanded()
      elseif r0_3.GrabHitCheckTimer then
        r0_3:RemoveTimer(r0_3.GrabHitCheckTimer)
        r0_3.GrabHitCheckTimer = nil
      end
    end, true, 0, "GrabHitCheckTimer")
  elseif r0_3.GrabHitCheckTimer then
    r0_3:RemoveTimer(r0_3.GrabHitCheckTimer)
    r0_3.GrabHitCheckTimer = nil
  end
end
function r11_0.BindBossSpCameraChanged(r0_5)
  -- line: [111, 132] id: 5
  if not r0_5.BuffManager then
    return 
  end
  local r1_5 = 850502
  function r0_5.CameraBuffDelegate()
    -- line: [116, 130] id: 6
    if r0_5.BuffManager:FindBuffById(r1_5, 0, false):GetSource() == r0_5 then
      DebugPrint("@zyh 准备清除BossSpCamera")
      r0_5:AddDelayFrameFunc(function()
        -- line: [120, 128] id: 7
        r0_5.CameraRotationComponent.BuffSource = nil
        r0_5.CharSpringArmComponent.BaseSpringArmForReset = 330
        if r0_5:GetController() then
          r0_5:GetController():RemoveDisablePitchRotationInputTag("BossSpCamera")
        end
        r0_5:ResetSpringArm()
        r0_5:ResetCameraPitch()
      end, 3)
    end
  end
  r0_5.BuffManager:BP_BindOnBuffAdded(r1_5, r0_5.CameraBuffDelegate)
end
function r11_0.GetDropDistance(r0_8)
  -- line: [134, 136] id: 8
  r0_8:CalcAttr("DropDistance")
end
function r11_0.BindControllerChangedDelegate(r0_9)
  -- line: [138, 141] id: 9
  UE4.UGameplayStatics.GetGameInstance(r0_9).OnPawnControllerChangedDelegates:Add(r0_9, r0_9.OnPlayerControllerChanged)
end
function r11_0.OnPlayerControllerChanged(r0_10, r1_10, r2_10)
  -- line: [143, 151] id: 10
  if r1_10 == r0_10 and r2_10 and r2_10:IsPlayerController() then
    if r0_10.DisableInputTags:Length() > 0 then
      r0_10:DisableInput(r0_10:GetController())
    else
      r0_10:EnableInput(r0_10:GetController())
    end
  end
end
function r11_0.SetGamepadFromCache(r0_11)
  -- line: [161, 176] id: 11
  if not r0_11:IsMainPlayer() then
    return 
  end
  local r1_11 = r1_0:Get("GamepadLayout")
  DebugPrint("@zyh 获取到的GamepadLayout", r1_11)
  if not r1_11 then
    local r2_11 = tonumber(DataMgr.Option.GamepadPreset.DefaultValue)
    r1_0:Set("GamepadLayout", r2_11)
    r0_11:InitGamepadSet(r2_11)
    r0_11:InitReplaceGamepadSet(r2_11)
  else
    r0_11:InitGamepadSet(r1_11)
    r0_11:InitReplaceGamepadSet(r1_11)
  end
end
function r11_0.SwitchGamepadSet(r0_12, r1_12)
  -- line: [178, 182] id: 12
  r0_12:InitGamepadSet(r1_12)
  r0_12:InitReplaceGamepadSet(r1_12)
  EventManager:FireEvent(EventID.OnSwitchGamepadSet)
end
function r11_0.SetMobileRotationFromCache(r0_13)
  -- line: [184, 198] id: 13
  if not r0_13:IsMainPlayer() then
    return 
  end
  local r1_13 = r1_0:Get("EnableMobileRotation")
  DebugPrint("@zyh 获取到的EnableMobileRotation", r1_13)
  if r1_13 == nil then
    local r3_13 = nil	-- notice: implicit variable refs by block#[6]
    if DataMgr.Option.EnableMobileRotation.DefaultValueM == "True" then
      r3_13 = true
      if not r3_13 then
        ::label_24::
        r3_13 = false
      end
    else
      goto label_24	-- block#5 is visited secondly
    end
    r1_0:Set("EnableMobileRotation", r3_13)
    r0_13.EnableMobileRotation = r3_13
  else
    r0_13.EnableMobileRotation = r1_13
  end
end
function r11_0.SwitchEnableMobileRotation(r0_14, r1_14)
  -- line: [200, 203] id: 14
  r0_14.EnableMobileRotation = r1_14
  r1_0:Set("EnableMobileRotation", r1_14)
end
function r11_0.UpdateOpenHelperAim(r0_15, r1_15)
  -- line: [205, 209] id: 15
  r0_15.IsOpenHelperAim = r1_15
  r0_15.CurShootingLocation = r0_0.ZeroVector
  r1_0:Set("IsOpenHelperAim", r1_15)
end
function r11_0.UpdateOpenLockAim(r0_16, r1_16)
  -- line: [211, 215] id: 16
  r0_16.IsOpenLockAim = r1_16
  r0_16.CurShootingLocation = r0_0.ZeroVector
  r1_0:Set("IsOpenLockAim", r1_16)
end
function r11_0.InitGameSkillFaceTo(r0_17)
  -- line: [218, 237] id: 17
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
function r11_0.SetUpAllTimer(r0_18)
  -- line: [239, 249] id: 18
  if r0_18:IsMainPlayer() then
    r0_18:AddTimer(1, r0_18.UpdatePlayerBloodEffectInfo, true, 0, "UpdatePlayerBloodEffectInfo")
    local r1_18 = GWorld:GetAvatar()
    if r1_18 and r1_18:IsInBigWorld() then
      r0_18:AddTimer(0.5, r0_18.CalcCurrentPlayerRegionId, true)
    end
    r0_18:AddTimer(60, r0_18.CheckHPRate, true, math.random(1, 60), "CheckLockHpRate")
    r0_18:AddTimer(60, r0_18.CheckExtraRangeModify, true, math.random(1, 60), "CheckExtraRangeModify")
  end
end
function r11_0.CheckHPRate(r0_19)
  -- line: [251, 276] id: 19
  local r1_19 = GWorld:GetAvatar()
  if not r0_19.BuffManager or not r1_19 then
    return 
  end
  if r0_19.BuffManager.LockHpRate ~= 0 or r0_19.BuffManager.LockHpValue ~= 0 then
    local r2_19 = false
    local r3_19 = "当前Buff列表："
    for r8_19, r9_19 in pairs(r0_19.BuffManager.Buffs) do
      local r10_19 = DataMgr.Buff[r9_19.BuffId]
      r3_19 = r3_19 .. tostring(r9_19.BuffId) .. "\n"
      if r10_19 and r10_19.LockHp then
        r2_19 = true
      end
    end
    -- close: r4_19
    local r4_19 = ""
    if r0_19.BuffManager.LockHpRate ~= 0 then
      r4_19 = string.format("反外挂检测，非法修改发了LockHPRate,当前LockHPRate=%s\n", tostring(r0_19.BuffManager.LockHpRate))
    else
      r4_19 = string.format("反外挂检测，非法修改发了LockHpValue,当前LockHpValue=%s\n", tostring(r0_19.BuffManager.LockHpValue))
    end
    if not r2_19 then
      UE4.URuntimeCommonFunctionLibrary.SendCheatMsgToServer(r0_19:GetWorld(), ECheatType.HoneyJar, r4_19 .. r3_19)
    end
  end
end
function r11_0.CheckExtraRangeModify(r0_20)
  -- line: [278, 296] id: 20
  local r1_20 = GWorld:GetAvatar()
  if not r0_20.Skills or not r1_20 then
    return 
  end
  local r2_20 = false
  local r3_20 = "当前Skill列表：\n"
  for r8_20, r9_20 in pairs(r0_20.Skills) do
    if r9_20.ExtraRangeModify ~= 1 then
      r2_20 = true
      r3_20 = r3_20 .. tostring(string.format("SkillId: %d, ExtraRangeModify: %f \n", r9_20.SkillId, r9_20.ExtraRangeModify))
    end
  end
  -- close: r4_20
  if r2_20 then
    UE4.URuntimeCommonFunctionLibrary.SendCheatMsgToServer(r0_20:GetWorld(), ECheatType.HoneyJar, "反外挂检测，非法修改了技能的ExtraRangeModify \n" .. r3_20)
  end
end
function r11_0.ShowCursor_Press(r0_21)
  -- line: [298, 305] id: 21
  DebugPrint("ShowCursor_Press", UE4.UKismetSystemLibrary.GetFrameCount())
  local r1_21 = UGameInputModeSubsystem.GetGameInputModeSubsystem(r0_21)
  if not IsValid(r1_21) then
    return 
  end
  r1_21:HandleShowCursorPressOrRelease(true)
end
function r11_0.ShowCursor_Release(r0_22)
  -- line: [307, 314] id: 22
  DebugPrint("ShowCursor_Release", UE4.UKismetSystemLibrary.GetFrameCount())
  local r1_22 = UGameInputModeSubsystem.GetGameInputModeSubsystem(r0_22)
  if not IsValid(r1_22) then
    return 
  end
  r1_22:HandleShowCursorPressOrRelease(false)
end
function r11_0.ShowCursorLock(r0_23, r1_23)
  -- line: [316, 318] id: 23
  r0_23.bShowCursorLock = r1_23
end
function r11_0.ShowMonsterInfo(r0_24)
  -- line: [320, 331] id: 24
  local r2_24 = UE4.UGameplayStatics.GetGameInstance(r0_24):GetGameUIManager()
  r0_24.bShowMonsterInfo = not r0_24.bShowMonsterInfo
  if r0_24.bShowMonsterInfo then
    r2_24:LoadUI(UIConst.MONSTERINFOPANEL, "MonsterInfo", UIConst.ZORDER_FOR_DESKTOP_TEMP)
  else
    r2_24:UnLoadUI("MonsterInfo")
  end
  r0_24:RemoveInputCache("ShowMonsterInfo")
end
function r11_0.OpenMap(r0_25)
  -- line: [333, 352] id: 25
  if TeamController:IsTeamPopupBarOpenInGamepad() then
    return 
  end
  if not UIManager(r0_25):TryOpenSystem("Map") then
    return 
  end
  local r2_25 = UE4.UGameplayStatics.GetGameInstance(r0_25):GetGameUIManager()
  if not r2_25 then
    return 
  end
  local r3_25 = nil
  local r4_25 = r2_25:GetUI("BattleMain") and r2_25:GetUI("HomeBaseMain")
  if r4_25 then
    r3_25 = r4_25.Battle_Map and r4_25.Battle_Map_PC
  end
  if r3_25 then
    r3_25:OnKeyboardClick()
  end
end
function r11_0.StartOpenMap(r0_26)
  -- line: [353, 367] id: 26
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    local r1_26 = GWorld:GetAvatar()
    if r1_26 and r1_26:CheckUIUnlocked("Chat") then
      local r2_26 = UIManager(r0_26):GetUIObj("BattleMain")
      if r2_26 and r2_26.Key_ChatEntry then
        r0_26.Key_ChatEntry = r2_26.Key_ChatEntry
        r0_26.Key_ChatEntry:AddExecuteLogic(r0_26, r0_26.ChatUpdate)
        r0_26.Key_ChatEntry:OnButtonPressed(nil, true, 0, 0.5)
        return 
      end
    end
  end
  r0_26:OpenMap()
end
function r11_0.ClearChatEntryKey(r0_27)
  -- line: [368, 372] id: 27
  r0_27.Key_ChatEntry:RemoveExecuteLogic()
  r0_27.Key_ChatEntry:OnButtonReleased()
  r0_27.Key_ChatEntry = nil
end
function r11_0.StopOpenMap(r0_28)
  -- line: [373, 378] id: 28
  if r0_28.Key_ChatEntry then
    r0_28:ClearChatEntryKey()
    r0_28:OpenMap()
  end
end
function r11_0.ChatUpdate(r0_29)
  -- line: [379, 382] id: 29
  r0_29:ClearChatEntryKey()
  r8_0:OpenView(r0_29, true)
end
function r11_0.OpenBattleWheel(r0_30)
  -- line: [383, 433] id: 30
  DebugPrint("gmy@OpenBattleWheel")
  local r1_30 = GWorld:GetAvatar()
  if r1_30 == nil then
    return 
  end
  local r2_30 = DataMgr.UIUnlockRule
  local r3_30 = r2_30.BattleWheel.UIUnlockRuleId
  local r4_30 = UE4.UGameplayStatics.GetGameInstance(r0_30)
  local r5_30 = UE4.UGameplayStatics.GetPlayerController(r4_30, 0)
  if r5_30.bEnableBattleWheel then
    local r6_30 = r1_30:CheckUIUnlocked(r3_30)
    DebugPrint("gmy@BattleMenu Unlocked", r6_30)
    if r6_30 then
      local r7_30 = r4_30:GetGameUIManager()
      local r8_30 = r7_30:GetUIObj("InBattleWheelMenu")
      if r8_30 then
        r7_30:UnLoadUI("InBattleWheelMenu")
        r8_30 = nil
      end
      if r8_30 == nil then
        r8_30 = r7_30:LoadUINew("InBattleWheelMenu", r5_30.QuestBattleWheelID and nil)
      end
      DebugPrint(LXYTag, "BattleWheel", r8_30)
      AudioManager(r0_30):PlayUISound(r8_30, "event:/ui/common/combat_bag_show", "BattleMenuShow", nil)
      r0_30:FlushInputKeyExceptMove()
      r0_30:AddForbidTag("BattleWheelForbid")
      r5_30:AddDisableRotationInputTag("SetRotation_Lerp")
    else
      UIManager(r0_30):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, r2_30.BattleWheel.UIUnlockDesc)
    end
  else
    DebugPrint("gmy@BP_PlayerCharacter_C:OpenBattleWheel DisableBattleWheel")
    if WorldTravelSubsystem():GetCurrentDungeonType() == CommonConst.DungeonType.Abyss then
      UIManager(r0_30):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, GText("UI_Disabled_Des_BattleWheel"))
    else
      UIManager(r0_30):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, GText("UI_BATTLEWHEEL_FORBIDDEN"))
    end
  end
end
function r11_0.CloseBattleWheel(r0_31, r1_31)
  -- line: [435, 460] id: 31
  local r2_31 = UE4.UGameplayStatics.GetGameInstance(r0_31)
  local r4_31 = r2_31:GetGameUIManager():GetUIObj("InBattleWheelMenu")
  local r5_31 = UE4.UGameplayStatics.GetPlayerController(r2_31, 0)
  if r4_31 ~= nil then
    local r6_31 = UGameInputModeSubsystem.GetGameInputModeSubsystem(r0_31)
    if r6_31 then
      if r6_31:GetCurrentInputType() == ECommonInputType.Gamepad then
        r4_31:CloseMenu()
      else
        r4_31:SelectAndCloseMenu()
      end
    end
  end
  r0_31:MinusForbidTag("BattleWheelForbid")
  r5_31:RemoveDisableRotationInputTag("SetRotation_Lerp")
end
function r11_0.RefreshBattleWheelEnableState(r0_32)
  -- line: [462, 471] id: 32
  local r1_32 = r0_32:GetController()
  if not r1_32.bEnableBattleWheel then
    r0_32:CloseBattleWheel(true)
  end
  DebugPrint("gmy@BP_PlayerCharacter_C:RefreshBattleWheelEnableState", r1_32.bEnableBattleWheel)
  EventManager:FireEvent(EventID.OnRefreshBattleWheelEnableState, r1_32.bEnableBattleWheel, r1_32.bShowBattleWheel)
end
function r11_0.SetQuestBattleWheelID(r0_33, r1_33)
  -- line: [473, 480] id: 33
  r0_33.QuestBattleWheelID = r1_33
  local r3_33 = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  if r3_33 then
    r3_33.QuestBattleWheelID = r0_33.QuestBattleWheelID
  end
end
function r11_0.EnableBattleWheel(r0_34)
  -- line: [482, 489] id: 34
  local r2_34 = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  if r2_34 then
    r2_34.bEnableBattleWheel = true
    r0_34:RefreshBattleWheelEnableState()
  end
end
function r11_0.DisableBattleWheel(r0_35)
  -- line: [491, 498] id: 35
  local r2_35 = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  if r2_35 then
    r2_35.bEnableBattleWheel = false
    r0_35:RefreshBattleWheelEnableState()
  end
end
function r11_0.ShowBattleWheel(r0_36)
  -- line: [500, 506] id: 36
  local r1_36 = r0_36:GetController()
  if r1_36 then
    r1_36.bShowBattleWheel = true
    r0_36:RefreshBattleWheelEnableState()
  end
end
function r11_0.HideBattleWheel(r0_37)
  -- line: [508, 514] id: 37
  local r1_37 = r0_37:GetController()
  if r1_37 then
    r1_37.bShowBattleWheel = false
    r0_37:RefreshBattleWheelEnableState()
  end
end
function r11_0.CalcCurrentPlayerRegionId(r0_38)
  -- line: [521, 533] id: 38
  local r1_38 = GWorld:GetAvatar()
  local r2_38 = r0_38:GetRegionId()
  if not r2_38 or not r1_38 or not r1_38:CheckCurrentSubRegion() then
    return 
  end
  if r1_38.SyncReason ~= CommonConst.SyncReason.Normal then
    return 
  end
  if not r1_38:CheckCurrentSubRegion(r2_38) then
    return 
  end
  if r1_38.CurrentRegionId ~= r2_38 and r2_38 ~= -1 then
    if r1_38:GetSubRegionId2RegionId() ~= r1_38:GetSubRegionId2RegionId(r2_38) then
      return 
    end
    if r0_38:GetRegionId(r0_38:GetLastSafeLocation()) ~= r2_38 then
      return 
    end
    r1_38:SkipRegion(r2_38)
  end
end
function r11_0.OnEnteredNewSubRegion(r0_39)
  -- line: [535, 567] id: 39
  local r1_39 = GWorld:GetAvatar()
  DebugPrint("OnEnteredNewSubRegion", r1_39.CurrentRegionId)
  if r0_39.CanChangeToMaster == nil then
    r0_39.CanChangeToMaster = r0_39:CheckCanChangeToMaster(false)
  end
  local r2_39 = r0_39.CanChangeToMaster
  local r3_39 = r0_39:CheckCanChangeToMaster(false, true)
  if r0_39.CurrentMasterBan and not r3_39 then
    r0_39:SwitchMasterOrHeroUIPerform()
    r0_39:ChangeBackToHero()
  end
  AudioManager(r0_39):CheckLevelSoundAndRegionId(r1_39.CurrentRegionId)
end
function r11_0.GetRegionId(r0_40, r1_40)
  -- line: [569, 580] id: 40
  if not r1_40 then
    r1_40 = r0_40.CurrentLocation
  end
  local r2_40 = UE4.UGameplayStatics.GetGameMode(r0_40)
  local r3_40 = -1
  if not r2_40 then
    return 
  end
  local r4_40 = r2_40:GetLevelLoader()
  if r4_40 and GWorld:GetWorldRegionState() and r4_40.IsWorldLoader then
    r3_40 = r4_40:GetRegionIdByLocation(r1_40)
  end
  return r3_40
end
function r11_0.StartLookAt(r0_41, r1_41, r2_41)
  -- line: [586, 594] id: 41
  if not r0_41:CheckLookPriority(r1_41) then
    return 
  end
  r0_41:StopLookAt()
  r0_41.CurrentLookType = r1_41
  r0_41.CurrentLookInfo = r2_41
  r0_41.LookAtTag:SetTagState(r1_41, true)
end
function r11_0.CheckLookPriority(r0_42, r1_42)
  -- line: [596, 598] id: 42
  return true
end
function r11_0.StopLookAt(r0_43, r1_43)
  -- line: [600, 608] id: 43
  if not r1_43 then
    r0_43.LookAtTag:SetTagState(r0_43.CurrentLookType, false)
    return 
  end
  if r1_43 == r0_43.CurrentLookType then
    r0_43.LookAtTag:SetTagState(r0_43.CurrentLookType, false)
  end
end
function r11_0.CheckCanLookAt(r0_44, r1_44)
  -- line: [610, 623] id: 44
  if r1_44 then
    r0_44:StopLookAt()
    return 
  end
  local r2_44 = DataMgr.PlayerStateLimit[r0_44.AutoSyncProp.CharacterTag]
  if r2_44 and r2_44.NeackRotation then
    r0_44:StartLookAt("Camera", {
      TurnHeadParam = {
        bLookUseCamera = true,
        bIsLookAt = true,
      },
    })
  else
    r0_44:StopLookAt("Camera")
  end
end
function r11_0.OnSetLookAtTag(r0_45, r1_45)
  -- line: [625, 635] id: 45
  if not r0_45.PlayerAnimInstance then
    return 
  end
  if not r1_45 then
    r0_45.PlayerAnimInstance:StopLookAt()
    return 
  end
  r0_45:SetLookAtParam()
end
function r11_0.SetLookAtParam(r0_46)
  -- line: [637, 661] id: 46
  if not r0_46.PlayerAnimInstance then
    return 
  end
  if not r0_46.CurrentLookInfo then
    return 
  end
  for r5_46, r6_46 in pairs(r0_46.CurrentLookInfo.TurnHeadParam) do
    if r0_46.PlayerAnimInstance[r5_46] ~= nil then
      r0_46.PlayerAnimInstance[r5_46] = r6_46
    end
  end
  -- close: r1_46
  local r1_46 = r0_46.CurrentLookInfo.Target
  local r2_46 = r0_46.CurrentLookInfo.SocketName
  if r0_46.CurrentLookType == "Actor" then
    r0_46.PlayerAnimInstance:SetLookAtActor(r1_46, r2_46)
  elseif r0_46.CurrentLookType ~= "Camera" then
    r0_46.PlayerAnimInstance:SetLookAtActor(r1_46, r2_46)
  end
end
function r11_0.OnSkillFeatureBegin(r0_47)
  -- line: [700, 702] id: 47
  r0_47:StopFire(false, true)
end
function r11_0.CancelSkill(r0_48, r1_48, r2_48)
  -- line: [705, 711] id: 48
  if not r0_48:IsSkillFinished() then
    r0_48:StopSkill(UE.ESkillStopReason.ForceCancel)
    r0_48:StopFire(r2_48, false)
    r0_48.PlayerAnimInstance:StopSkillAnimation()
  end
end
function r11_0.InitSceneStartUI(r0_49)
  -- line: [714, 749] id: 49
  local r1_49 = UE4.UGameplayStatics.GetGameInstance(r0_49)
  local r2_49 = r1_49:GetGameUIManager()
  if not IsValid(r2_49) then
    return 
  end
  r0_49.UIModePlatform = r2_0.GetDeviceTypeByPlatformName(r0_49)
  r0_49.PlatformName = UGameplayStatics.GetPlatformName()
  local r3_49 = r2_49:LoadUI(UIConst.SCENESTARTUI, "SceneStartUI", UIConst.ZORDER_FOR_DESKTOP)
  if r3_49 ~= nil then
    r3_49:InitMainPage()
  end
  if not r0_49:IsDead() then
    local r4_49 = r2_49:GetUI("BattleMain")
    if r4_49 then
      r4_49:HidePlayerDeadUI()
    end
    r2_49:HideAllUI_EX(TSet(FName), false, "RegionResurgence")
  end
  r0_49:UpdatePlayerTaskInfo()
  if not r1_49:GetLoadingUI() then
    r0_49:RefreshCharUIByPlatform()
  end
end
function r11_0.RefreshCharUIByPlatform(r0_50)
  -- line: [751, 766] id: 50
  local r1_50 = UIManager(r0_50)
  r0_50.SkillUINames = r0_50.SkillUINames and {}
  for r6_50, r7_50 in pairs(r0_50.SkillUINames) do
    DebugPrint("gmy@BP_PlayerCharacter_C:RefreshCharUIByPlatform ", r6_50)
    r1_50:UnLoadUI(r6_50)
    r0_50.SkillUINames[r6_50] = nil
  end
  -- close: r2_50
  DebugPrint("gmy@BP_PlayerCharacter_C BP_PlayerCharacter_C:RefreshCharUIByPlatform1", r0_50.CurrentRoleId)
  local r2_50 = DataMgr.BattleChar[r0_50.CurrentRoleId]
  if r2_50 and r2_50.CharUIId then
    r0_50:TryOpenSkillUI(r2_50.CharUIId, false)
  end
end
function r11_0.CheckDraftCanProduce(r0_51)
  -- line: [768, 784] id: 51
  local r1_51 = GWorld:GetAvatar()
  if not r1_51 then
    return 
  end
  if r1_51:CheckSubRegionType(r1_51:GetCurrentRegionId(), CommonConst.SubRegionType.Home) and r1_51:IsInBigWorld() and #r6_0:GetCanProduceDraftIds() > 0 then
    r0_51:AddTimer(1, function()
      -- line: [776, 781] id: 52
      UE4.UTalkFunctionLibrary.PlayDirectTalkByTalkTriggerId(GWorld.GameInstance, 3001)
    end)
  end
end
function r11_0.UpdatePlayerBloodEffectInfo(r0_53)
  -- line: [786, 844] id: 53
  if not r0_53.InitSuccess then
    return 
  end
  local r3_53 = r0_53:GetCurrentBloodVolume() / r0_53:GetMaxBloodVolume()
  local r4_53 = r0_53:GetAttr("ES")
  local r5_53 = DataMgr.SystemUI[UIConst.BattleNearDeathPCName]
  if r5_53 then
    local r6_53 = r5_53.Params.FirstLevelFactor
    local r7_53 = r5_53.Params.SecondLevelFactor
    local r8_53 = r5_53.Params.ShowUIBloodStrength
    local r9_53 = r5_53.Params.SecondLevelBloodStrength
    if r6_53 == nil or r7_53 == nil or r8_53 == nil or r9_53 == nil then
      return 
    end
    local r10_53 = r0_53.IsNearDeath
    local r11_53 = 0.0001
    if r11_53 < r3_53 and r3_53 < r8_53 then
      r11_53 = r4_53 <= 0
    else
      goto label_45	-- block#11 is visited secondly
    end
    r0_53.IsNearDeath = r11_53
    r11_53 = UIManager(r0_53):GetUIObj(UIConst.BattleNearDeathPCName)
    local r12_53 = nil
    if not r10_53 and r0_53.IsNearDeath then
      r12_53 = "In"
    end
    if r10_53 and r0_53.IsNearDeath then
      r12_53 = "Loop"
    end
    if r10_53 and not r0_53.IsNearDeath then
      r12_53 = "Out"
    end
    if r0_53.IsNearDeath then
      if r11_53 == nil then
        r11_53 = UIManager(r0_53):LoadUINew(UIConst.BattleNearDeathPCName)
      end
      if r11_53 ~= nil then
        local r13_53 = nil
        local r14_53 = nil	-- notice: implicit variable refs by block#[33]
        if r9_53 < r3_53 then
          r14_53 = r6_53
          if r14_53 then
            ::label_94::
            r14_53 = r7_53
          end
        else
          goto label_94	-- block#28 is visited secondly
        end
        if r2_0.GetDeviceTypeByPlatformName() == "PC" then
          r13_53 = r11_53.Bg_1:GetDynamicMaterial()
        else
          r13_53 = r11_53.glassglow:GetDynamicMaterial()
        end
        if r13_53 ~= nil then
          r13_53:SetScalarParameterValue("Flash", r14_53)
        end
      end
    elseif r11_53 ~= nil and r10_53 then
      r11_53:BindToAnimationFinished(r11_53.Out, function()
        -- line: [836, 839] id: 54
        r11_53:UnbindAllFromAnimationFinished(r11_53.Out)
        UIManager(r0_53):UnLoadUI(UIConst.BattleNearDeathPCName)
      end)
      EMUIAnimationSubsystem:EMPlayAnimation(r11_53, r11_53.Out)
    end
    -- close: r6_53
  end
end
function r11_0.UpdateUIMode(r0_55, r1_55)
  -- line: [846, 853] id: 55
  r0_55.UIModePlatform = r1_55
  local r2_55 = UIManager(r0_55):GetUIObj("SceneStartUI")
  if r2_55 ~= nil then
    r2_55:OnCloseOtherUI()
    r2_55:InitMainPage()
  end
end
function r11_0.Landed(r0_56)
  -- line: [855, 863] id: 56
  if not r0_56:PlayerLanded() then
    return 
  end
  if r0_56:CharacterInTag("Shooting") and r0_56:CheckCanEnterTag("LandHeavy") and r0_56.PlayerAnimInstance.FallingSpeed < r0_0.LandHeavySpeed then
    r0_56:StopFire(true, false)
    r0_56:StopSkill(UE.ESkillStopReason.ActionCancel)
  end
end
function r11_0.Impending(r0_57)
  -- line: [865, 870] id: 57
  if not r0_57:PlayerImpending() then
    return 
  end
  r0_57.Overridden.Impending(r0_57)
end
function r11_0.StartSlide(r0_58)
  -- line: [872, 878] id: 58
  print(_G.LogTag, "StartSlideStartSlideStartSlide")
  r0_58:DoSlide()
  if r0_58.NeedSlideEvent then
    EventManager:FireEvent(EventID.OnSlidePressed)
  end
end
function r11_0.PressDodge(r0_59)
  -- line: [880, 883] id: 59
  r0_59.bSprintPressed = true
  r0_59:StartDodge()
end
function r11_0.StartDodge(r0_60)
  -- line: [885, 890] id: 60
  r0_60:DoDodge()
  if r0_60.NeedAvoidEvent then
    EventManager:FireEvent(EventID.OnAvoidPressed)
  end
end
function r11_0.ApplyHitFlyDown(r0_61)
  -- line: [897, 901] id: 61
  r0_61:ResetCapSize()
  r0_61:RealStopSlide(true)
  r0_61.Super.ApplyHitFlyDown(r0_61)
end
function r11_0.ShowPlayerDeadUI(r0_62)
  -- line: [924, 931] id: 62
  local r1_62 = r0_62:GetCurRecoveryUIName()
  if r1_62 then
    local r2_62 = UIManager(r0_62):LoadUINew(r1_62)
    r2_62:OnMainCharacterInitReady()
    r2_62:InitResurgenceUI(r0_62.Eid)
  end
end
function r11_0.IsDeadDuringQuest(r0_63)
  -- line: [933, 936] id: 63
  local r1_63 = GWorld.StoryMgr:GetCurrentStoryNode()
  return r1_63 and r1_63.bDeadTriggerQuestFail
end
function r11_0.HandleDeadDuringQuest(r0_64)
  -- line: [938, 950] id: 64
  local r2_64 = GWorld.StoryMgr:GetResurgencePointInfo()
  local r3_64 = 1.8
  if r2_64 then
    r0_64:AddTimer(r3_64, function()
      -- line: [943, 945] id: 65
      r0_64:RequestDeadAsyncTravel(r2_64)
    end)
  else
    DebugPrint("Tianyi@ 找不到复活点，走区域复活逻辑")
    r0_64:TryEnterDying()
  end
end
function r11_0.RealOnDead_Lua(r0_66, r1_66, r2_66, r3_66)
  -- line: [952, 990] id: 66
  local r4_66 = UE4.UGameplayStatics.GetGameMode(r0_66)
  if r4_66 ~= nil then
    r4_66:NotifyGameModePlayerDead(r0_66)
  end
  DebugPrint("Tianyi@ Player Die!!!!!!!!!!")
  r0_66:SetHoldCrouch(false)
  r0_66:StopFire(false, false)
  r0_66:ZeroComboCount(UE4.EClearComboReason.Dead)
  local r5_66 = UE4.UGameplayStatics.GetGameState(r0_66)
  if r4_66 and (r5_66.GameModeType == "Training" or r5_66.GameModeType == "Trial") then
    local r6_66 = 0
    local r7_66 = r5_66:GetTargetPoint("Training")
    if r7_66 then
      Battle(r0_66):TeleportRecovery(r0_66.Eid, r7_66:K2_GetActorLocation(), r7_66:K2_GetActorRotation(), r6_66)
    else
      DebugPrint("Tianyi@ 找不到训练场复活点")
      Battle(r0_66):TeleportRecovery(r0_66.Eid, FVector(2148.795166, -4042.718262, 2133), FRotator(0, 0, 0), r6_66)
    end
  elseif r0_66:IsDeadDuringQuest() then
    DebugPrint("Tianyi@ 玩家在任务中死亡")
    r0_66:HandleDeadDuringQuest()
  else
    r0_66:TryEnterDying()
  end
  local r6_66 = GWorld:GetAvatar()
  if r0_66:IsMainPlayer() and r6_66 and r6_66:IsInRougeLike() then
    r6_66:SavePlayerSlice({
      Type = r0_0.RougeSliceInfoType.RecoverCount,
      Value = {
        RecoveryCount = r0_66:GetRecoveryCount() + 1,
      },
    })
  end
end
function r11_0.OnTriggerFallTrigger(r0_67, r1_67, r2_67)
  -- line: [992, 997] id: 67
  if r1_67 and r2_67 then
    r1_67:OnTriggerFallTrigger(r2_67, r0_67, UE4.URuntimeCommonFunctionLibrary.GetPlayerControllerIndex(r0_67, r0_67:GetController()))
  end
end
function r11_0.HandleRemoveModPassives(r0_68)
  -- line: [998, 1002] id: 68
  r0_68:ClearWeaponModPassive()
  r0_68:RemovePassiveEffectByRole(r0_68:GetController():GetRoleId())
end
function r11_0.TriggerFallingCallable(r0_69, r1_69, r2_69, r3_69, r4_69, r5_69, r6_69)
  -- line: [1004, 1101] id: 69
  DebugPrint("OtherActor is Falling Dead. TriggeredByPlayer. ActorName:", r0_69:GetName(), ", UnitId:", r0_69.UnitId, ", Eid:", r0_69.Eid, ", CreatorId:", r0_69.CreatorId, ", CreatorType:", r0_69.CreatorType, ", BornPos:", r0_69.BornPos, "MaxDis", r3_69, "DefaultEnable", r4_69, "DefaultTransform", r2_69)
  if r0_69.FromOtherWorld then
    DebugPrint("OtherActor is player, but from other world  ActorName:", r0_69:GetName())
    return 
  end
  if not IsDedicatedServer(r0_69) and not r0_69:IsMainPlayer() then
    DebugPrint("OtherActor is player, but not main player  ActorName:", r0_69:GetName())
    return 
  end
  if not r0_69.InitSuccess then
    DebugPrint("OtherActor is player, but not InitSuccess  ActorName:", r0_69:GetName())
    return 
  end
  r1_69:TriggerDungeonComponentFun("OnPlayerTriggerFallTrigger")
  r0_69:OnTriggerFallTrigger(r1_69, r5_69)
  local r7_69 = r1_69:TryGetSafeLocation(r0_69, r3_69)
  local r8_69 = nil
  if r0_69:CharacterInTag("Interactive") then
    r0_69:LeaveInteractiveTag("Interactive")
  end
  if r0_69.EnterRegion then
    r0_69:StopAllCurrentMove()
  end
  if r4_69 ~= true then
    local r9_69 = r1_69.EMGameState.GameModeType
    if r9_69 == "Temple" then
      local r10_69, r11_69 = r1_69.EMGameState:BackToTempleArchivePoint()
      if r10_69 then
        r7_69 = r10_69 + FVector(0, 0, r0_69.CapsuleComponent:GetScaledCapsuleHalfHeight())
        r8_69 = r11_69
      else
        DebugPrint("ERROR:BackToTempleArchivePoint ArchivePointLocation is nil")
      end
    elseif r9_69 == "Party" then
      local r10_69, r11_69 = r1_69.EMGameState:BackToPartyArchivePoint(r0_69)
      if r10_69 then
        r7_69 = r10_69 + FVector(0, 0, r0_69.CapsuleComponent:GetScaledCapsuleHalfHeight())
        r8_69 = r11_69
        r1_69:OnPartyPlayerTriggerFallTrigger(r0_69.Eid)
      else
        DebugPrint("ERROR:BackToPartyArchivePoint ArchivePointLocation is nil")
      end
    end
  end
  if not r4_69 and r7_69 ~= FVector(0, 0, 0) then
    r0_69:K2_SetActorLocation(r7_69, false, nil, false)
    if r8_69 ~= nil then
      r0_69:K2_SetActorRotation(r8_69, false)
    end
  else
    r0_69:K2_SetActorLocation(r2_69.Translation, false, nil, false)
    r0_69:K2_SetActorRotation(r2_69.Rotation:ToRotator(), false)
  end
  r0_69:GetMovementComponent():ForceClientUpdate()
  local r11_69 = {}
  r0_69:EnableCheckOverlapPush(r11_69)
  if r0_69.OnTriggerFallingCallable then
    r0_69:OnTriggerFallingCallable()
  end
  if IsDedicatedServer(r0_69) then
    local r9_69 = r0_69.RPCComponent
    if r8_69 then
      r11_69 = r8_69 and r2_69.Rotation:ToRotator()
    else
      goto label_188	-- block#30 is visited secondly
    end
    r9_69:OnPlayerFallTriggerClient(r11_69)
  else
    r0_69:ShowBlackScreenFade_StandAlone(r6_69)
  end
  if r0_69.EnterRegion then
    r0_69:ForceReSyncLocation()
  end
  r0_69:GetController():SetControlRotation(r0_69:K2_GetActorRotation())
  r0_69:Landed()
end
function r11_0.TriggerWaterFallingCallable(r0_70, r1_70, r2_70, r3_70, r4_70)
  -- line: [1103, 1105] id: 70
  r0_70:TriggerFallingCallable(r1_70, r2_70, r3_70, r4_70)
end
function r11_0.ShowBlackScreenFade_StandAlone(r0_71, r1_71, r2_71)
  -- line: [1108, 1119] id: 71
  if r1_71 == "White" then
    UIManager(r0_71):ShowCommonBlackScreen({
      BlackScreenHandle = "BlackScreenFade",
      ScreenColor = "White",
      OutAnimationPlayTime = 1,
      IsPlayOutWhenLoaded = true,
    })
  else
    r0_71:NewBlackScreenFade(r2_71)
  end
end
function r11_0.TryToUpdateScreenEffect(r0_72, r1_72, r2_72)
  -- line: [1196, 1242] id: 72
  local r3_72 = r0_72:GetAttr("ES")
  if r2_72 > 0 then
    local r4_72 = r0_72:GetAttr("MaxES")
    if r4_72 ~= 0 and DataMgr.SystemUI[UIConst.BattleBrokenShieldPCName].Params.ShieldUIResetRate and DataMgr.SystemUI[UIConst.BattleBrokenShieldPCName].Params.ShieldUIResetRate < (r3_72 + r2_72) / r4_72 then
      r0_72.PlayBrokenShiledAnim = true
    end
    if r3_72 <= 0 and r0_72:IsMainPlayer() and r0_72.PlayBrokenShiledAnim then
      r0_72.PlayBrokenShiledAnim = false
      local r5_72 = DataMgr.SystemUI[UIConst.BattleBrokenShieldPCName]
      if r5_72 then
        local r6_72 = r5_72.Params.AnimName
        if r6_72 ~= nil then
          local r7_72 = UIManager(r0_72):PlayScreenEffectAnim(UIConst.LoadInConfig, UIConst.BattleBrokenShieldPCName, {
            {
              AnimName = r6_72,
              StartTime = 0,
              LoopNums = 1,
            }
          })
          local r8_72 = r3_0.NowTime()
          AudioManager(r0_72):PlayUISound(r7_72, "event:/ui/common/char_sheild_break", nil, nil)
          if r0_72.PreHitSoundTime == nil or r8_72 - r0_72.PreHitSoundTime >= 30 then
            r0_72.PreHitSoundTime = r8_72
            local r9_72 = FPlayFMODSoundStruct()
            r9_72.FMODEventPath, r9_72.SelectKey = AudioManager(r0_72):ContactPlayerStringPath(r0_72, "vo_be_hit_heavy")
            r9_72.EventKey = "vo_be_hit_heavy"
            r9_72.bStopWhenAttachedToDestoryed = true
            r9_72.bPlayAs2D = true
            local r10_72 = AudioManager(r0_72):PlayFMODSound_Sync(UE4.UAudioManager.SetObjectToFPlayFMODSoundStruct(r9_72, r0_72))
          end
        end
      end
    end
  end
end
function r11_0.SkillEnd(r0_73, r1_73, r2_73)
  -- line: [1244, 1254] id: 73
  if not r2_73 or r2_73 == 0 then
    return 
  end
  if not r0_73:GetSkill(r2_73) then
    return 
  end
  r0_73.Super.SkillEnd(r1_73, r2_73)
  r0_73:SetRotationRate("OnGround")
end
function r11_0.ResetWeaponHandDelay(r0_74)
  -- line: [1256, 1262] id: 74
  if not r0_74.KeepWeaponOnHand then
    return 
  end
  r0_74.KeepWeaponOnHand = false
  r0_74:RemoveTimer("KeepWeaponDelay")
end
function r11_0.InitPlayerUseSkillTimes_Internal(r0_75)
  -- line: [1328, 1340] id: 75
  if not GWorld:GetAvatar() then
    return 
  end
  for r6_75, r7_75 in pairs(r1_0:Get("bNeedCountPlayerSkillUsedTimesList", true) and {}) do
    r0_75.NeedCountPlayerSkillUsedTimesList:Add(r6_75, r7_75)
  end
  -- close: r2_75
  for r7_75, r8_75 in pairs(r1_0:Get("CountPlayerSkillUsedTimesList", true) and {}) do
    r0_75.CountPlayerSkillUsedTimesList:Add(r7_75, r8_75)
  end
  -- close: r3_75
end
function r11_0.GetPlayerUseSkillTimesFromCache(r0_76, r1_76)
  -- line: [1342, 1348] id: 76
  if not GWorld:GetAvatar() then
    return 
  end
  return (r1_0:Get("CountPlayerSkillUsedTimesList", true) and {})[r1_76] and 0
end
function r11_0.SavePlayerSkillUsedTimes(r0_77)
  -- line: [1377, 1383] id: 77
  if GWorld:GetAvatar() then
    r1_0:Set("bNeedCountPlayerSkillUsedTimesList", r0_77.NeedCountPlayerSkillUsedTimesList:ToTable(), true)
    r1_0:Set("CountPlayerSkillUsedTimesList", r0_77.CountPlayerSkillUsedTimesList:ToTable(), true)
  end
end
function r11_0.PressFire(r0_78)
  -- line: [1404, 1434] id: 78
  if not r0_78:CharacterInTag("LandHeavy") and not r0_78:CheckCanSkillTypeCancel(UE.ESkillType.Shooting) and r0_78:CheckForbidInput() then
    return 
  end
  if r0_78:CheckSkillOccupiedByProp(ESkillName.HeavyShooting) then
    r0_78.PropHoldShootTimer = r0_78:AddTimer(0.2, function()
      -- line: [1409, 1412] id: 79
      r0_78.PropEffectComponent.CurrentPropEffect:OnHoldShoot()
      r0_78.PropHoldShootTimer = nil
    end, false, 0, "PropHoldShoot")
  end
  if r0_78:CheckSkillOccupiedByProp(ESkillName.Fire) then
    r0_78.PropEffectComponent.CurrentPropEffect:OnShootPressed()
    return 
  end
  r0_78.bPressedFire = true
  if r0_78:CharacterHasAnyTag("OverHeat") or r0_78:CharacterHasAnyTag("NoBullet") then
    r0_78:TryFireOverLoad()
    r0_78:RemoveInputCache("Fire")
    return 
  end
  local r1_78 = r0_78:GetSkillByType(UE.ESkillType.HeavyShooting)
  if r1_78 and r1_78 ~= 0 and not r0_78.PropHoldShootTimer then
    r0_78:RemoveInputCache("Fire")
    r0_78.HoldShootingTimer = r0_78:AddTimer(0.2, r0_78.HoldShooting)
    return 
  end
  r0_78:StartFire("Fire")
  if r0_78.NeedFireEvent then
    EventManager:FireEvent(EventID.OnFirePressed)
  end
end
function r11_0.StartFire(r0_80, r1_80)
  -- line: [1436, 1473] id: 80
  -- notice: unreachable block#6
  if r0_80:CheckSkillOccupiedByProp(ESkillName.Fire) then
    return false
  end
  if r0_80:CheckSkillIsBan(ESkillName.Fire) then
    if not r0_80.CurrentMasterBan then
      local r2_80 = UIManager(r0_80):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, GText("UI_RANGED_FORBIDDEN"))
    else
      local r2_80 = false
    end
    return false
  end
  if r0_80:CheckSkillInActive(ESkillName.Fire) then
    return false
  end
  if not r0_80:CheckCanShoot(false) then
    return 
  end
  print(_G.LogTag, "StartFireStartFireStartFire", r1_80)
  if r0_80.PlayerAnimInstance then
    r0_80.PlayerAnimInstance.bPressedFire = true
  end
  local r2_80 = nil
  if r1_80 == "Fire" then
    r2_80 = r0_80:GetSkillByType(UE.ESkillType.Shooting)
  else
    r2_80 = r0_80:GetSkillByType(UE.ESkillType.HeavyShooting)
  end
  print(_G.LogTag, "StartFireStartFireStartFireStartFire", r2_80)
  local r4_80 = nil	-- notice: implicit variable refs by block#[22]
  if not r0_80:UseSkill(r2_80, 0) then
    r4_80 = false
    return r4_80
  end
  r0_80.AllowEnterShoot = false
  if r1_80 ~= "Fire" then
    r4_80 = "HeavyShooting"
    if not r4_80 then
      ::label_93::
      r4_80 = "Fire"
    end
  else
    goto label_93	-- block#21 is visited secondly
  end
  r0_80:RemoveInputCache(r4_80)
  return true
end
function r11_0.HoldShooting(r0_81)
  -- line: [1475, 1483] id: 81
  r0_81.bHoldingShooting = true
  if r0_81:CharacterInTag("Slide") then
    return 
  end
  r0_81:SetInputCache("HeavyShooting")
  r0_81:StartFire("HeavyShooting")
  r0_81.HoldShootingTimer = nil
end
function r11_0.RemoveHoldShootingTimer(r0_82)
  -- line: [1558, 1561] id: 82
  r0_82:RemoveTimer(r0_82.HoldShootingTimer)
  r0_82.HoldShootingTimer = nil
end
function r11_0.ReleaseFire(r0_83)
  -- line: [1563, 1580] id: 83
  if r0_83:CheckSkillOccupiedByProp(ESkillName.HeavyShooting) and r0_83.PropHoldShootTimer then
    r0_83:RemoveTimer("PropHoldShoot")
    r0_83.PropHoldShootTimer = nil
  end
  if r0_83:CheckSkillOccupiedByProp(ESkillName.Fire) then
    r0_83.PropEffectComponent.CurrentPropEffect:OnShootReleased()
    return 
  end
  if not r0_83.bHoldingShooting and r0_83.HoldShootingTimer then
    r0_83:SetInputCache("Fire")
    r0_83:StartFire("Fire")
  end
  r0_83:StopFire(false, true)
end
function r11_0.StopFire(r0_84, r1_84, r2_84)
  -- line: [1582, 1610] id: 84
  if r0_84.NeedFireReleaseEvent then
    EventManager:FireEvent(EventID.OnFireRelease)
  end
  if r1_84 and not r0_84.bPressedFire then
    return 
  end
  if not r1_84 then
    r0_84.bPressedFire = false
    r0_84.bHoldingShooting = false
  end
  r0_84:RemoveHoldShootingTimer()
  if r0_84.PlayerAnimInstance then
    r0_84.PlayerAnimInstance.bPressedFire = false
  end
  if r2_84 then
    return 
  end
  r0_84.ResetedWhenShoot = false
  if r0_84.PlayerAnimInstance then
    if r1_84 then
      r0_84.PlayerAnimInstance.StartShoot = false
      r0_84:DisableReloadWithoutShoot()
      r0_84:ShouldEnableHandIk()
    end
    r0_84.PlayerAnimInstance.StopShoot = false
    r0_84.PlayerAnimInstance.EnableAim = UE4.UKismetMathLibrary.Clamp(r0_84.PlayerAnimInstance.EnableAim + -1, 0, 1)
  end
end
function r11_0.AnimIdleStart(r0_85)
  -- line: [1637, 1642] id: 85
  if r0_85:CheckShouldEnterNormalIdle() then
    r0_85.PlayerAnimInstance:AnimNotify_IdleStartNew()
  end
  r0_85:TryEnterTalk()
end
function r11_0.EnterCrouchTag(r0_86)
  -- line: [1644, 1647] id: 86
  r0_86:TryEnterTalk()
end
function r11_0.CheckShouldEnterNormalIdle(r0_87)
  -- line: [1649, 1664] id: 87
  if not r0_87.PlayerAnimInstance then
    return false
  end
  if not r0_87.BuffManager then
    return true
  end
  local r1_87 = r0_87.BuffManager.CurrentIdleTag
  if r1_87 and r1_87 ~= "0" then
    return false
  end
  return true
end
function r11_0.EnterSkillTag(r0_88)
  -- line: [1676, 1684] id: 88
  r0_88.PreSkillId = r0_88.CurrentSkillId
  if r0_88:IsAnimCrouch() and r0_88.CurrentSkillId == r0_88:GetSkillByType(UE.ESkillType.SlideAttack) then
    return 
  end
  r0_88:ResetCapSize()
end
function r11_0.LeaveSkillTag(r0_89)
  -- line: [1686, 1688] id: 89
  r0_89:EnsureCondemnMonsterRecoverIdle()
end
function r11_0.EnsureCondemnMonsterRecoverIdle(r0_90)
  -- line: [1690, 1705] id: 90
  if not IsAuthority(r0_90) or not r0_90.PreSkillId then
    return 
  end
  local r1_90 = r0_90:GetSkill(r0_90.PreSkillId)
  if not r1_90 then
    return 
  end
  local r2_90 = r1_90:GetSkillType()
  if r2_90 and r2_90 == ESkillType.Condemn and r0_90.CondemnMonsterEid then
    local r3_90 = Battle(r0_90):GetEntity(r0_90.CondemnMonsterEid)
    if r3_90 and r3_90:IsCantLeaveDefeated() then
      r3_90:DefeatedRecoverToIdle(true)
    end
  end
end
function r11_0.EnterBulletJumpTag(r0_91)
  -- line: [1707, 1723] id: 91
  Battle(r0_91):TriggerBattleEvent(BattleEventName.EnterBulletJump, r0_91)
end
function r11_0.LeaveBulletJumpTag(r0_92, r1_92)
  -- line: [1725, 1728] id: 92
  Battle(r0_92):TriggerBattleEvent(BattleEventName.QuitBulletJump, r0_92)
  r0_92:SetPushEnemyInfo("BulletJump", false)
end
function r11_0.CheckKeepBoneHit(r0_93)
  -- line: [1748, 1757] id: 93
  local r1_93 = r0_93.PlayerAnimInstance:GetCurrentStateNameByStateMachineName("Movement")
  if r1_93 ~= "Idle" and r1_93 ~= "Run" then
    r0_93.PlayerAnimInstance.InBoneHit = false
    if r0_93.LuaTimerHandles.BoneHit ~= nil then
      r0_93:RemoveTimer(r0_93.LuaTimerHandles.BoneHit)
      r0_93.LuaTimerHandles.BoneHit = nil
    end
  end
end
function r11_0.ForbidRenderMainCamera(r0_94)
  -- line: [1759, 1765] id: 94
  r0_94.CharCameraComponent:SetOrthoNearClipPlane(100000)
  r0_94.CharCameraComponent:SetOrthoFarClipPlane(100001)
  r0_94.CharCameraComponent:SetOrthoWidth(1)
  r0_94.CharCameraComponent:SetProjectionMode(1)
end
function r11_0.AllowRenderMainCamera(r0_95)
  -- line: [1767, 1769] id: 95
  r0_95.CharCameraComponent:SetProjectionMode(0)
end
function r11_0.CheckNeedFootprint(r0_96)
  -- line: [1866, 1886] id: 96
  if r2_0.GetDeviceTypeByPlatformName(r0_96) == "Mobile" then
    return false
  end
  if IsStandAlone(r0_96) or r9_0.IsAutonomousProxy(r0_96) then
    local r1_96 = GWorld:GetAvatar()
    if r1_96 then
      if r1_96:CheckCurrentSubRegion() == true then
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
function r11_0.IsOpenNormalAim(r0_97)
  -- line: [1888, 1897] id: 97
  if not IsValid(r0_97.RangedWeapon) then
    return false
  end
  local r1_97 = r0_97:GetWeaponAimLockStyle()
  if r1_97 and r1_97 == "FieldAim" then
    return true
  end
  local r2_97 = r0_97.ChooseTargetFilter
  if r2_97 ~= nil then
    r2_97 = r0_97.LockTargetFilter ~= nil
  else
    goto label_21	-- block#7 is visited secondly
  end
  return r2_97
end
function r11_0.HoldToRecovery(r0_98)
  -- line: [1905, 1907] id: 98
  Battle(r0_98):Recovery(r0_98.Eid)
end
function r11_0.CommonRecoveryImpl(r0_99)
  -- line: [1909, 1916] id: 99
  r0_99.Super.CommonRecoveryImpl(r0_99)
  if IsClient(r0_99) or IsStandAlone(r0_99) then
    r0_99:ResetForbidTag("Battle")
    r0_99:RefreshClientSkillLogicComponents()
    r0_99:OnRecoverDissolve()
  end
end
function r11_0.Recovery(r0_100, ...)
  -- line: [1918, 1926] id: 100
  r11_0.Super.Recovery(r0_100, ...)
  if r0_100:IsInRideMove() then
    r0_100:DisableBattleMount(true)
  end
  if IsClient(r0_100) or IsStandAlone(r0_100) then
    r0_100:UseSkill(r0_0.PlayerRecoverySkill, 0)
  end
end
function r11_0.OnRealEnterDying(r0_101)
  -- line: [1928, 1938] id: 101
  r0_101.Super.OnRealEnterDying(r0_101)
  if not IsDedicatedServer(r0_101) and r0_101:IsMainPlayer() then
    r0_101:ShowPlayerDeadUI()
    r0_101:TryHideAllSkillUI()
    if r0_101.TeammateUI then
      r0_101.TeammateUI:OnDead()
    end
  end
end
function r11_0.OnRealDie(r0_102)
  -- line: [1941, 1948] id: 102
  DebugPrint("Tianyi@ Player real die, Eid = " .. r0_102.Eid)
  if IsAuthority(r0_102) then
    UE4.UGameplayStatics.GetGameMode(r0_102):DungeonFinish_OnPlayerRealDead({
      r0_102:GetController().AvatarEidStr
    })
  end
end
function r11_0.OnLanded(r0_103)
  -- line: [1951, 1965] id: 103
  if r0_103:IsExistTimer("PlayDeadMontage") then
    r0_103:RemoveTimer("PlayDeadMontage")
    r0_103:PlayHitMontage("Die")
  end
  if not r0_103:CharacterInTag("Shooting") and r0_103.PlayerAnimInstance and r0_103.PlayerAnimInstance.StartShoot then
    r0_103.PlayerAnimInstance.StartShoot = false
    r0_103.PlayerAnimInstance.FullBody = true
    r0_103:ShouldEnableHandIk()
  end
  if r0_103:CharacterInTag("GrabHit") then
    r0_103:OnGrabHitLanded()
  end
end
function r11_0.EnterDeadTag(r0_104)
  -- line: [1967, 1975] id: 104
  r0_104:AddForbidTag("Battle")
  r0_104:TrackDeadInfo()
  local r1_104 = r0_104:GetBattlePet()
  if not r1_104 then
    return 
  end
  r1_104:HideBattlePet("Dead", true)
end
function r11_0.LeaveDeadTag(r0_105)
  -- line: [1977, 1983] id: 105
  local r1_105 = r0_105:GetBattlePet()
  if not r1_105 then
    return 
  end
  r1_105:HideBattlePet("Dead", false)
end
function r11_0.EnterRecoveryTag(r0_106)
  -- line: [1985, 1987] id: 106
  r0_106:TrackRecoverInfo()
end
function r11_0.GetLogMask(r0_107)
  -- line: [1989, 1991] id: 107
  return _G.LogTag
end
function r11_0.SetLogMask(r0_108, r1_108)
  -- line: [1993, 1996] id: 108
  print("LogInfo", r1_108)
  _G.LogTag = r1_108
end
function r11_0.SetLogMask(r0_109, r1_109)
  -- line: [1998, 2001] id: 109
  print("LogInfo", r1_109)
  _G.LogTag = r1_109
end
function r11_0.GetLogMask(r0_110)
  -- line: [2003, 2005] id: 110
  return _G.LogTag
end
function r11_0.ReceiveSound(r0_111, r1_111, r2_111)
  -- line: [2015, 2017] id: 111
  r0_111.Overridden.ReceiveSound(r0_111, r1_111, r2_111)
end
function r11_0.GetCharSpringArmWorldResultLoc(r0_112)
  -- line: [2023, 2025] id: 112
  return r0_112.CharSpringArmComponent.bWorldResultLoc
end
function r11_0.GetNickName(r0_113)
  -- line: [2043, 2052] id: 113
  local r1_113 = GWorld:GetAvatar()
  if not r1_113 then
    return "夜航主角名"
  end
  if GWorld:IsStandAlone() then
    return r1_113.Nickname
  end
  return r0_113.PlayerState.PlayerName
end
function r11_0.CheckSkillInActive(r0_114, r1_114)
  -- line: [2054, 2060] id: 114
  local r2_114 = r0_114:GetController()
  if not r2_114 or not r2_114.CheckSkillInActive then
    return false
  end
  return r2_114:CheckSkillInActive(r1_114)
end
function r11_0.PickupFunctionDispatcher(r0_115, r1_115, r2_115, r3_115, r4_115, r5_115, r6_115)
  -- line: [2071, 2103] id: 115
  local r7_115 = Battle(r0_115)
  local r8_115 = r7_115:GetEntity(r4_115)
  local r9_115 = DataMgr.Drop[r1_115]
  if r9_115 then
    r7_115:TriggerBattleEvent(BattleEventName.OnGetDrop, r0_115, r1_115)
    if r9_115.UseEffectType then
      local r10_115 = "PickupTo" .. r9_115.UseEffectType
      if IsDedicatedServer(r0_115) then
        if rawget(r0_0.SavePickupType, r9_115.UseEffectType) and not GWorld.bDebugServer then
          local r11_115 = GWorld:GetDSEntity()
          if r11_115 then
            r11_115:PickUpToSave(r10_115, r2_115, r9_115, r1_115, r3_115, r4_115, r6_115)
          end
        elseif ItemUtils:IsServerCreate(r9_115.DropId) and r9_115.IsPickShare then
          UE4.UGameplayStatics.GetGameMode(r0_115):PickUpForAllPlayers(r10_115, r2_115, r9_115.UseParam, r1_115, r3_115, r5_115, r6_115)
        else
          r8_115[r10_115](r8_115, r2_115, r9_115.UseParam, r1_115, r3_115, r5_115, r6_115)
        end
      else
        r8_115[r10_115](r8_115, r2_115, r9_115.UseParam, r1_115, r3_115, r5_115, r6_115)
      end
    end
  end
end
function r11_0.SetDefaultWeapon(r0_116)
  -- line: [2106, 2129] id: 116
  if not IsAuthority(r0_116) then
    return 
  end
  local r1_116 = GWorld:GetAvatar()
  local r2_116 = nil
  for r7_116, r8_116 in pairs(r0_116.Weapons) do
    for r13_116, r14_116 in pairs(DataMgr.BattleWeapon[r7_116].WeaponTag) do
      if r14_116 == "Ultra" then
        r2_116 = r7_116
      end
    end
    -- close: r9_116
  end
  -- close: r3_116
  r0_116:ClearWeapon()
  r0_116:AddWeapon(r1_116.Weapons[r1_116.MeleeWeapon].WeaponId):UnBindWeaponFromHand()
  local r4_116 = r0_116:AddWeapon(r1_116.Weapons[r1_116.RangedWeapon].WeaponId)
  r4_116:ShouldHideWeapon(true, true)
  r4_116:UnBindWeaponFromHand()
  if r2_116 then
    r0_116:AddWeapon(r2_116)
  end
  r0_116:ChangeUsingWeaponByType("Melee")
end
function r11_0.HideMonsterCapsule(r0_117, r1_117)
  -- line: [2131, 2139] id: 117
  for r7_117, r8_117 in pairs(Battle(r0_117):GetAllEntities()) do
    if r8_117 and r8_117.IsMonster and r8_117:IsMonster() then
      r8_117.CapsuleComponent:SetHiddenInGame(r1_117, false)
    end
  end
  -- close: r3_117
end
function r11_0.ServerInteractiveMechanism(r0_118, r1_118, r2_118, r3_118, r4_118, r5_118, r6_118)
  -- line: [2156, 2187] id: 118
  print(_G.LogTag, "lxz ServerInteractiveMechanism", r1_118, r2_118)
  local r7_118 = Battle(r0_118):GetEntity(r1_118)
  if r5_118 then
    if r7_118.CheckMontageInteractive then
      r0_118:SetMechanismEid(r1_118, r7_118:CheckMontageInteractive())
    else
      r0_118:SetMechanismEid(r1_118, false)
    end
  end
  local r8_118 = nil
  if r7_118.CombatStateChangeComponent then
    if r6_118 ~= -1 then
      r7_118.RegionOnlineInteractiveMessage:Add(r0_118.Eid, r6_118)
    end
    print(_G.LogTag, "lxz ServerInteractiveMechanism222", r2_118, r3_118)
    r7_118:ChangeState("Interactive", r2_118, r3_118)
  else
    if r7_118:CharacterInTag("Defeated") then
      r7_118:Penalize(r2_118)
    else
      r7_118:OpenMechanism(r2_118)
    end
    if r7_118.InteractiveComponent then
      r8_118 = r7_118.InteractiveComponent.InteractiveTag
    else
      r8_118 = r7_118.InteractiveTag
    end
    r0_118:SetCharacterTag(r8_118)
  end
end
function r11_0.ServerDeInteractiveMechanism(r0_119, r1_119, r2_119, r3_119, r4_119, r5_119, r6_119, r7_119)
  -- line: [2189, 2211] id: 119
  print(_G.LogTag, "lxz ServerDeInteractiveMechanism", r2_119)
  local r8_119 = Battle(r0_119):GetEntity(r1_119)
  if not r8_119 or not r8_119.OpenMechanism then
    return 
  end
  if r6_119 then
    if r8_119.CheckMontageInteractive then
      r0_119:SetMechanismEid(0, r8_119:CheckMontageInteractive())
    else
      r0_119:SetMechanismEid(0, false)
    end
  end
  if r4_119 == nil or r4_119 ~= r0_0.ForceEndInteractive then
    print(_G.LogTag, "lxz ServerDeInteractiveMechanism2222", r2_119)
    r8_119:CloseMechanism(r2_119, r3_119)
  else
    r8_119:ForceCloseMechanism(r2_119, r3_119)
  end
  if r7_119 ~= -1 then
    r8_119.RegionOnlineInteractiveMessage:Remove(r0_119.Eid)
  end
end
function r11_0.LeaveInteractiveTag(r0_120, r1_120)
  -- line: [2212, 2222] id: 120
  if r1_120 ~= "Idle" and r0_120.MechanismEid ~= 0 then
    local r2_120 = Battle(r0_120):GetEntity(r0_120.MechanismEid)
    if r2_120 then
      local r3_120 = r2_120:GetComponentByClass(UChestInteractiveComponent:StaticClass())
      if r3_120 then
        r3_120:ForceEndInteractive(r0_120, true, r0_0.ForceEndInteractive)
      end
    end
  end
end
function r11_0.LeaveSeatingTag(r0_121, r1_121)
  -- line: [2224, 2227] id: 121
  r0_121:LeaveInteractiveTag(r1_121)
  r0_121.CapsuleComponent:SetCollisionResponseToChannel(ECollisionChannel.ECC_WorldStatic, ECollisionResponse.ECR_Block)
end
function r11_0.ReceiveEndPlay(r0_122, r1_122)
  -- line: [2229, 2247] id: 122
  if r0_122.ArmoryHelper then
    r0_122.ArmoryHelper:K2_DestroyActor()
  end
  r0_122:TryCloseAllSkillUI()
  r0_122:RefreshTeamMemberInfo("ReceiveEndPlay")
  EventManager:RemoveEvent(EventID.OnStartSkillFeature, r0_122)
  EventManager:RemoveEvent(EventID.SetDefaultWeapon, r0_122)
  EventManager:RemoveEvent(EventID.OnMainCharacterInitReady, r0_122)
  EventManager:RemoveEvent(EventID.OnCharacterInitSuitRecover, r0_122)
  EventManager:RemoveEvent(EventID.CloseLoading, r0_122)
  EventManager:RemoveEvent(EventID.OnLevelDeliverBlackCurtainEnd, r0_122)
  EventManager:RemoveEvent(EventID.OnRepBulletNum, r0_122)
  EventManager:RemoveEvent(EventID.OnChangeNickName, r0_122)
  EventManager:RemoveEvent(EventID.OnChangeTitle, r0_122)
  r0_122:UnBindControllerChangedDelegate()
end
function r11_0.UnBindControllerChangedDelegate(r0_123)
  -- line: [2249, 2252] id: 123
  UE4.UGameplayStatics.GetGameInstance(r0_123).OnPawnControllerChangedDelegates:Remove(r0_123, r0_123.OnPlayerControllerChanged)
end
function r11_0.GetLastSafeLocation(r0_124)
  -- line: [2285, 2287] id: 124
  return r0_124.LastSafeLocation
end
function r11_0.SetBrushStaticMeshScalarParameter(r0_125, r1_125)
  -- line: [2290, 2322] id: 125
  if r0_125.IsGetBrushStaticMesh == nil then
    r0_125.BrushStaticMesh = {}
    r0_125.IsGetBrushStaticMesh = false
  end
  if r0_125.IsGetBrushStaticMesh == false then
    local r2_125 = r0_0.BrushStaticMesh
    local r3_125 = TArray(AActor)
    UE4.UGameplayStatics.GetAllActorsOfClass(r0_125, AStaticMeshActor, r3_125)
    for r9_125, r10_125 in pairs(r3_125:ToTable()) do
      if r10_125.StaticMeshComponent ~= nil and r10_125.StaticMeshComponent.StaticMesh ~= nil then
        for r14_125 = 1, #r2_125, 1 do
          if r10_125.StaticMeshComponent.StaticMesh:GetName() == r2_125[r14_125] then
            table.insert(r0_125.BrushStaticMesh, r10_125.StaticMeshComponent)
          end
        end
      end
    end
    -- close: r5_125
    r0_125.IsGetBrushStaticMesh = true
  end
  for r6_125, r7_125 in pairs(r0_125.BrushStaticMesh) do
    local r8_125 = r7_125:CreateDynamicMaterialInstance(0)
    if IsValid(r8_125) then
      r8_125:SetScalarParameterValue("InteractiveScan", r1_125)
    end
    local r9_125 = r7_125:CreateDynamicMaterialInstance(1)
    if IsValid(r9_125) then
      r9_125:SetScalarParameterValue("InteractiveScan", r1_125)
    end
  end
  -- close: r2_125
end
function r11_0.AddDisableInputTag(r0_126, r1_126)
  -- line: [2324, 2329] id: 126
  r0_126.DisableInputTags:AddUnique(r1_126)
  if r0_126.DisableInputTags:Length() > 0 and r0_126:GetController() and r0_126:GetController():IsPlayerController() then
    r0_126:DisableInput(r0_126:GetController())
  end
end
function r11_0.RemoveDisableInputTag(r0_127, r1_127)
  -- line: [2331, 2338] id: 127
  if r0_127.DisableInputTags:Find(r1_127) then
    r0_127.DisableInputTags:RemoveItem(r1_127)
  end
  if r0_127.DisableInputTags:Length() <= 0 and r0_127:GetController() and r0_127:GetController():IsPlayerController() then
    r0_127:EnableInput(r0_127:GetController())
  end
end
function r11_0.RemoveAllDisableInputTag(r0_128)
  -- line: [2340, 2343] id: 128
  r0_128.DisableInputTags:Clear()
  r0_128:EnableInput(r0_128:GetController())
end
function r11_0.EnableInput(r0_129, r1_129)
  -- line: [2345, 2350] id: 129
  if r0_129.DisableInputTags:Length() > 0 then
    return 
  end
  r0_129.Overridden.EnableInput(r0_129, r1_129)
end
function r11_0.SwitchBattleShortcutKeysHidden(r0_130)
  -- line: [2416, 2421] id: 130
  local r2_130 = not r1_0:Get("BattleShortcutHudKeysHidden", true)
  r1_0:Set("BattleShortcutHudKeysHidden", r2_130, true)
  UIManager(r0_130):SetBattleShortCutHudKeysHidden(r2_130)
end
function r11_0.GetSafeRegionLocation(r0_131, r1_131)
  -- line: [2423, 2440] id: 131
  local r2_131 = {}
  local r3_131 = GWorld:GetAvatar()
  local r4_131 = r1_131 and r0_131:GetRecentSafeLocation()
  local r5_131 = r0_131:CheckLocationValid(r4_131)
  local r6_131 = r0_131:GetRegionId(r4_131)
  if r4_131 ~= r0_0.ZeroVector and r6_131 ~= -1 and r5_131 then
    r2_131.RegionId = r6_131
    r2_131.Location = r4_131
    r2_131.Rotation = r0_131:K2_GetActorRotation()
  else
    r2_131.RegionId = r3_131:GetLastRegionId()
    r2_131.Location = r3_131.LastRegionData:GetLocation()
    r2_131.Rotation = r3_131.LastRegionData:GetRotation()
  end
  return r2_131
end
function r11_0.ImmersionModel(r0_132)
  -- line: [2442, 2468] id: 132
  r0_132.Overridden.ImmersionModel(r0_132)
  r4_0.EnableShowBillboard = false
  local r1_132 = UIManager(r0_132)
  r1_132:HideAllComponentUI(r0_132.IsImmersionModel, r0_0.ImmersionModelHideTag)
  local r2_132 = USubsystemBlueprintLibrary.GetWorldSubsystem(r0_132, UNpcHeadUISubsystem)
  if r0_132.IsImmersionModel then
    require("EMLuaConst").IsHideJumpWord = true
    r1_132:AddUIToStateTagsCluster(1, "ImmersionModel", true)
    EventManager:AddEvent(EventID.OnAddWidgetComponent, r0_132, r0_132.OnAddWidgetComponent)
    if r2_132 then
      r2_132:HideAllNpcHeadUI(true, "ImmersionModel")
    end
    MissionIndicatorManager:TriggerAllIndicatorVisible(false)
  else
    require("EMLuaConst").IsHideJumpWord = false
    r1_132:AddUIToStateTagsCluster(1, "ImmersionModel")
    EventManager:RemoveEvent(EventID.OnAddWidgetComponent, r0_132)
    if r2_132 then
      r2_132:HideAllNpcHeadUI(false, "ImmersionModel")
    end
    MissionIndicatorManager:TriggerAllIndicatorVisible(true)
  end
end
function r11_0.OnAddWidgetComponent(r0_133, r1_133)
  -- line: [2470, 2478] id: 133
  local r2_133 = r1_133.WidgetComponent
  if r2_133 then
    local r3_133 = r2_133:GetWidget()
    if r3_133 then
      r3_133:Hide(r0_0.ImmersionModelHideTag)
    end
  end
end
function r11_0.UpdateBulletNumUI(r0_134)
  -- line: [2480, 2509] id: 134
  r0_134:AddDelayFrameFunc(function()
    -- line: [2482, 2508] id: 135
    if r0_134.TakeAimIndicator then
      r0_134.TakeAimIndicator:UpdateAmmoBarProgress(true)
    end
    local r0_135 = UIManager(r0_134)
    if r0_135 then
      if r0_134.UIModePlatform == "PC" then
        local r1_135 = r0_135:GetUIObj("BattleMain")
        if r1_135 ~= nil and r1_135.Char_Skill ~= nil and r1_135.Char_Skill.OnChargeWeaponBullet then
          r1_135.Char_Skill:OnChargeWeaponBullet()
        end
      elseif r0_134.UIModePlatform == "Mobile" then
        local r1_135 = r0_135:GetUIObj("BattleMain")
        if r1_135 ~= nil and r1_135.Char_Skill ~= nil then
          if r1_135.Char_Skill.Bullet.UpdatePlayerWeaponInfo then
            r1_135.Char_Skill.Bullet:UpdatePlayerWeaponInfo()
          end
          if r1_135.Char_Skill.AtkRanged.UpdateRangeWeaponButton then
            r1_135.Char_Skill.AtkRanged:UpdateRangeWeaponButton()
          end
        end
      end
    end
  end)
end
function r11_0.UpdateSkillUIInfo(r0_136, r1_136)
  -- line: [2511, 2544] id: 136
  if IsDedicatedServer(r0_136) then
    return 
  end
  if r0_136.UIModePlatform == "PC" then
    local r2_136 = UIManager(r0_136):GetUIObj("BattleMain")
    if r2_136 ~= nil and r2_136.Char_Skill ~= nil then
      for r7_136, r8_136 in pairs(r1_136) do
        local r9_136 = r0_136:GetSkill(r8_136)
        if r9_136 then
          local r10_136 = r9_136.Data
          r2_136.Char_Skill:RefreshRoleTargetSkill(r10_136.SkillType, r9_136)
          DebugPrint("@zyh123", r8_136, r10_136.SkillType)
        end
      end
      -- close: r3_136
    end
  elseif r0_136.UIModePlatform == "Mobile" then
    local r2_136 = UIManager(r0_136):GetUIObj("BattleMain")
    if r2_136 ~= nil and r2_136.Char_Skill ~= nil then
      for r7_136, r8_136 in pairs(r1_136) do
        local r9_136 = r0_136:GetSkill(r8_136)
        if r9_136 then
          r2_136.Char_Skill:RefreshRoleTargetSkill(r9_136.Data.SkillType, r9_136)
        end
      end
      -- close: r3_136
    end
  end
end
function r11_0.SetESCMenuForbiddenState(r0_137, r1_137)
  -- line: [2547, 2549] id: 137
  r0_137.IsESCForbidden = r1_137 and false
end
function r11_0.GetESCMenuForbiddenState(r0_138)
  -- line: [2551, 2556] id: 138
  if r0_138.IsESCForbidden == nil then
    return false
  end
  return r0_138.IsESCForbidden
end
function r11_0.SetMaxMovingSpeed(r0_139, r1_139)
  -- line: [2558, 2563] id: 139
  r1_139 = math.max(0, r1_139)
  r0_139.PlayerSlideAtttirbute.NormalWalkSpeed = DataMgr.PlayerRotationRates.NormalWalkSpeed.ParamentValue[1] * r1_139
  r0_139.PlayerSlideAtttirbute.CrouchWalkSpeed = DataMgr.PlayerRotationRates.CrouchWalkSpeed.ParamentValue[1] * r1_139
  r0_139:SetWalkSpeed()
end
function r11_0.SetMaxMovingSpeedByInfo(r0_140, r1_140)
  -- line: [2565, 2568] id: 140
  r0_140.PlayerSlideAtttirbute.NormalWalkSpeed = r1_140.NormalWalk
  r0_140.PlayerSlideAtttirbute.CrouchWalkSpeed = r1_140.CrouchWalk
end
function r11_0.TryOpenSkillUI(r0_141, r1_141, r2_141)
  -- line: [2570, 2620] id: 141
  DebugPrint("TryOpenSkillUI: ", r1_141, r2_141)
  if not r0_141:IsMainPlayer() then
    return 
  end
  r1_141 = r0_141:GetReplacedCharUIId(r1_141)
  local r3_141 = r0_141:GetAttr("GradeLevel") and 0
  local r4_141 = DataMgr.BattleCharUI[r1_141][r3_141]
  if r2_141 or not r4_141.TriggerBuffId then
    local r5_141 = UE4.UGameplayStatics.GetGameInstance(r0_141)
    if IsValid(r5_141:GetSceneManager()) then
      local function r7_141()
        -- line: [2586, 2599] id: 142
        local r0_142 = r5_141:GetGameUIManager()
        if r0_142:GetUIObj(r4_141.UIName) then
          r0_142:UnLoadUI(r4_141.UIName)
        end
        r0_141.SkillUINames = r0_141.SkillUINames and {}
        r0_141.SkillUINames[r4_141.UIName] = true
        local r1_142 = r0_142:LoadUINew(r4_141.UIName, r0_141, r4_141.Params)
        if r1_142 and r1_142.InitBattleCharUI then
          r1_142:InitBattleCharUI(r1_141, r3_141)
        end
      end
      if r2_141 and r4_141.TriggerBuffDelay then
        r0_141:AddTimer_Combat(r4_141.TriggerBuffDelay, function()
          -- line: [2603, 2614] id: 143
          local r0_143 = r0_141.BuffManager and r0_141.BuffManager.Buffs
          if r0_143 then
            for r5_143, r6_143 in pairs(r0_143) do
              if r6_143.BuffId == r4_141.TriggerBuffId then
                r7_141()
                break
              end
            end
            -- close: r1_143
          end
        end, false, 0, nil, true)
      else
        r7_141()
      end
      -- close: r7_141
    end
    -- close: r5_141
  end
end
function r11_0.TryCloseSkillUI(r0_144, r1_144)
  -- line: [2622, 2646] id: 144
  DebugPrint("TryCloseSkillUI: ", r1_144)
  if not r0_144:IsMainPlayer() then
    return 
  end
  r1_144 = r0_144:GetReplacedCharUIId(r1_144)
  local r3_144 = DataMgr.BattleCharUI[r1_144][r0_144:GetAttr("GradeLevel") and 0]
  if r3_144 then
    local r6_144 = UE4.UGameplayStatics.GetGameInstance(r0_144):GetGameUIManager():GetUIObj(r3_144.UIName)
    if r6_144 then
      r6_144:RemoveSelf()
    end
    if r0_144.SkillUINames and r0_144.SkillUINames[r3_144.UIName] then
      r0_144.SkillUINames[r3_144.UIName] = nil
    end
  end
end
function r11_0.GetReplacedCharUIId(r0_145, r1_145)
  -- line: [2648, 2663] id: 145
  if r0_145.CurrentSkinId then
    local r2_145 = DataMgr.Skin[r0_145.CurrentSkinId]
    if r2_145 then
      local r3_145 = r2_145.BattleCharUIMap
      if r3_145 and r3_145[r1_145] then
        DebugPrint("gmy@BP_PlayerCharacter_C BP_PlayerCharacter_C:TryOpenSkillUI Skill Replaced", r1_145, r3_145[r1_145])
        r1_145 = r3_145[r1_145]
      end
    end
  end
  return r1_145
end
function r11_0.TryHideAllSkillUI(r0_146)
  -- line: [2665, 2685] id: 146
  if not r0_146:IsMainPlayer() then
    return 
  end
  local r1_146 = r0_146:GetAttr("GradeLevel") and 0
  local r2_146 = DataMgr.BattleChar[r0_146.CurrentRoleId]
  if r2_146.CharUIId then
    local r4_146 = UE4.UGameplayStatics.GetGameInstance(r0_146):GetGameUIManager()
    local r5_146 = DataMgr.BattleCharUI[r2_146.CharUIId][r1_146]
    if r5_146 then
      local r6_146 = r4_146:GetUIObj(r5_146.UIName)
      if r6_146 then
        r6_146:Hide()
      end
    end
  end
end
function r11_0.TryCloseAllSkillUI(r0_147)
  -- line: [2687, 2696] id: 147
  if r0_147.SkillUINames then
    for r5_147, r6_147 in pairs(r0_147.SkillUINames) do
      if r6_147 then
        UIManager(r0_147):UnLoadUINew(r5_147)
      end
    end
    -- close: r1_147
  end
  r0_147.SkillUINames = {}
end
function r11_0.TryShowAllSkillUI(r0_148)
  -- line: [2698, 2715] id: 148
  if not r0_148:IsMainPlayer() then
    return 
  end
  local r1_148 = r0_148:GetAttr("GradeLevel")
  local r2_148 = DataMgr.BattleChar[r0_148.CurrentRoleId]
  if r2_148.CharUIId then
    local r6_148 = UE4.UGameplayStatics.GetGameInstance(r0_148):GetGameUIManager():GetUIObj(DataMgr.BattleCharUI[r2_148.CharUIId][r1_148].UIName)
    if r6_148 then
      r6_148:Show()
    end
  end
end
function r11_0.LeaveRecoveryTag(r0_149, r1_149)
  -- line: [2717, 2719] id: 149
  r0_149:TryShowAllSkillUI()
end
function r11_0.TryEnterTalk(r0_150)
  -- line: [2721, 2728] id: 150
  if r0_150.EnterTalkDelegates then
    for r5_150, r6_150 in pairs(r0_150.EnterTalkDelegates) do
      r6_150()
    end
    -- close: r1_150
    r0_150.EnterTalkDelegates = nil
  end
end
function r11_0.SetEndPointInfo(r0_151, r1_151, r2_151, r3_151)
  -- line: [2730, 2734] id: 151
  r0_151.EndPointSeqEnable = r1_151
  r0_151.EndPointLocation = r2_151
  r0_151.EndPointRotation = r3_151
end
function r11_0.GetEndPointInfo(r0_152)
  -- line: [2736, 2738] id: 152
  return r0_152.EndPointSeqEnable, r0_152.EndPointLocation, r0_152.EndPointRotation
end
function r11_0.OnDungeonSettlement(r0_153, r1_153, r2_153, r3_153)
  -- line: [2740, 2798] id: 153
  local r4_153 = true
  if r1_153 then
    local r5_153 = GWorld.GameInstance.ScenePlayers[r2_153].CurrentWeaponType and "Armory"
    if r3_153 and r3_153.UseDefaultMontage then
      r5_153 = "Armory"
    end
    local r6_153 = GWorld.GameInstance.ScenePlayers[r2_153].CurrentWeaponMeleeOrRanged
    DebugPrint("BP_PlayerCharacter_C:OnDungeonSettlement WeaponType: ", r5_153, "WeaponMeleeOrRanged: ", r6_153)
    local r7_153 = "LevelFinish_" .. r5_153 .. "_Montage"
    r4_153 = r0_153:CheckLevelFinishMontagePath(r7_153)
    if not r4_153 then
      r7_153 = "LevelFinish_Armory_Montage"
    end
    local r8_153 = r0_153:GetBattleCharBodyType()
    local r9_153 = FVector(0, 0, 0)
    if r3_153 and r3_153.CameraParam then
      r9_153.X = r3_153.CameraParam[r8_153][1]
      r9_153.Y = r3_153.CameraParam[r8_153][2]
      r9_153.Z = r3_153.CameraParam[r8_153][3]
    end
    DebugPrint("BP_PlayerCharacter_C:OnDungeonSettlement BattleCharTag", r8_153, "CameraParam", r9_153)
    r0_153:K2_SetActorLocation(UE4.UKismetMathLibrary.TransformLocation(r0_153:GetTransform(), r9_153), false, nil, true)
    r0_153:PlayDungeonSettlementSimpleSkillFeature(false, false, false, false, true, true, r9_153, r0_0.SettlementCameraRotation)
    r0_153:K2_SetActorLocation(UE4.UKismetMathLibrary.TransformLocation(r0_153:GetTransform(), -r9_153), false, nil, true)
    r0_153:PlayActionMontage("Interactive/LevelFinish", r7_153, {})
    r0_153:SetEndPointOffset(r2_153, r3_153)
    DebugPrint("BP_PlayerCharacter_C:OnDungeonSettlement PlayActionMontage: ", r7_153)
    if r6_153 then
      r0_153:ChangeUsingWeaponByType(r6_153)
    end
  else
    local r5_153 = "LevelFinish_Fail_Montage"
    local r6_153 = r0_153:GetController()
    local r7_153 = r6_153:GetControlRotation()
    r6_153:SetControlRotation(FRotator(r7_153.Pitch, r0_153:K2_EMGetActorRotation().Yaw + 180, r7_153.Roll))
    r0_153:PlayActionMontage("Interactive/LevelFinish", r5_153, {})
    r0_153:ResetOnSetEndPoint()
  end
  r0_153:SetCharacterTag("LevelFinish")
  if r1_153 and GWorld.GameInstance.ScenePlayers[r2_153].CurrentWeaponType and r4_153 then
    r0_153.KeepWeaponOnHand = true
    if r0_153.WeaponPos ~= 2 then
      r0_153:BindWeaponToHand()
    end
  end
  r0_153:OnRecoverDissolve()
  local r5_153 = UIManager(r0_153):GetUI(r0_153:GetCurRecoveryUIName())
  if r5_153 then
    r5_153:ShowBattleMainUI()
  end
end
function r11_0.PlayDungeonSettlementFailDeadMontage(r0_154)
  -- line: [2800, 2813] id: 154
  local r1_154, r2_154 = r0_154:GetHitMontageFolderAndPrefix()
  if r1_154 ~= nil then
    local r3_154 = r1_154 .. "Combat/Hit/" .. r2_154 .. "Die" .. r0_0.MontageSuffix .. "." .. r2_154 .. "Die" .. r0_0.MontageSuffix
    local r4_154 = LoadObject(r3_154)
    if not r4_154 then
      DebugPrint("Error: Load Montage Failed!!!", r3_154)
      return 
    end
    r0_154.Mesh:SetHiddenInGame(true)
    r0_154.PartsMesh:SetHiddenInGame(true)
    r0_154.PlayerAnimInstance:Montage_Play(r4_154, 1, UE4.EMontagePlayReturnType.Duration, 3, true)
  end
end
function r11_0.CheckLevelFinishMontagePath(r0_155, r1_155)
  -- line: [2815, 2830] id: 155
  local r2_155 = UBlueprintPathsLibrary.ProjectContentDir()
  local r5_155 = DataMgr.Model[r0_155:GetCharModelComponent():GetCurrentModelId()].MontageFolder and ""
  local r6_155 = r4_155.MontagePrefix and ""
  if not r6_155 then
    return false
  end
  local r7_155 = string.gsub(r5_155, "/Game/", r2_155) .. "Interactive/LevelFinish/" .. r6_155 .. r1_155 .. ".uasset"
  DebugPrint("CheckLevelFinishMontagePath MontPath:", r7_155)
  if UBlueprintPathsLibrary.FileExists(r7_155) then
    return true
  end
  DebugPrint("CheckLevelFinishMontagePath: File not Exists")
  return false
end
function r11_0.OnDungeonSettlementByIndex(r0_156, r1_156, r2_156, r3_156, r4_156)
  -- line: [2832, 2857] id: 156
  local r5_156 = r2_156 and "Armory"
  if r4_156 and r4_156.UseDefaultMontage then
    r5_156 = "Armory"
  end
  local r6_156 = r3_156
  local r7_156 = "LevelFinish_" .. r5_156 .. "_Montage"
  local r8_156 = r0_156:CheckLevelFinishMontagePath(r7_156)
  if not r8_156 then
    r7_156 = "LevelFinish_Armory_Montage"
  end
  r0_156:PlayActionMontage("Interactive/LevelFinish", r7_156, {})
  r0_156:SetEndPointOffset(r1_156, r4_156)
  DebugPrint("BP_PlayerCharacter_C:OnDungeonSettlementByIndex PlayActionMontage: ", r7_156)
  if r6_156 then
    r0_156:ChangeUsingWeaponByType(r6_156)
  end
  r0_156:SetCharacterTag("LevelFinish")
  if r2_156 and r8_156 then
    r0_156.KeepWeaponOnHand = true
    if r0_156.WeaponPos ~= 2 then
      r0_156:BindWeaponToHand()
    end
  end
end
function r11_0.SetMainPlayerDungeonSettlementTransform(r0_157, r1_157, r2_157, r3_157)
  -- line: [2859, 2886] id: 157
  if r1_157 then
    r0_157:ResetIdle()
    local r6_157 = FHitResult()
    UE4.UKismetSystemLibrary.LineTraceSingle(r0_157, r2_157 + FVector(0, 0, r0_157.CapsuleComponent:GetUnscaledCapsuleHalfHeight()), r2_157 + FVector(0, 0, -500), ETraceTypeQuery.TraceScene, false, nil, EDrawDebugTrace.None, r6_157, true)
    r0_157:K2_SetActorLocationAndRotation(FVector(r2_157.X, r2_157.Y, r6_157.ImpactPoint.Z + r0_157.CapsuleComponent:GetUnscaledCapsuleHalfHeight()), r3_157, false, nil, true)
  else
    local r4_157 = UE4.UGameplayStatics.GetGameState(r0_157)
    if not GWorld:GetAvatar() then
      return 
    end
    r0_157:ResetIdle()
    local r7_157 = FHitResult()
    UE4.UKismetSystemLibrary.LineTraceSingle(r0_157, r2_157, r2_157 + FVector(0, 0, -500), ETraceTypeQuery.TraceScene, false, nil, EDrawDebugTrace.None, r7_157, true)
    r0_157:K2_SetActorLocation(FVector(r2_157.X, r2_157.Y, r7_157.ImpactPoint.Z + r0_157.CapsuleComponent:GetUnscaledCapsuleHalfHeight()), false, nil, true)
    r0_157:K2_SetActorRotation(r3_157, false)
  end
end
function r11_0.SetOtherPlayerDungeonSettlementTransform(r0_158)
  -- line: [2888, 2898] id: 158
  r0_158:ResetIdle()
  local r1_158 = r0_158:K2_GetActorLocation()
  local r4_158 = FHitResult()
  UE4.UKismetSystemLibrary.LineTraceSingle(r0_158, r1_158 + FVector(0, 0, r0_158.CapsuleComponent:GetUnscaledCapsuleHalfHeight()), r1_158 + FVector(0, 0, -500), ETraceTypeQuery.TraceScene, false, nil, EDrawDebugTrace.None, r4_158, true)
  r0_158:K2_SetActorLocation(FVector(r1_158.X, r1_158.Y, r4_158.ImpactPoint.Z + r0_158.CapsuleComponent:GetUnscaledCapsuleHalfHeight()), false, nil, true)
end
function r11_0.SetEndPointOffset(r0_159, r1_159, r2_159)
  -- line: [2900, 2909] id: 159
  local r3_159 = FVector(0, 0, 0)
  if r2_159 and r2_159.SettlementOffset then
    r3_159.X = r2_159.SettlementOffset[r1_159][1]
    r3_159.Y = r2_159.SettlementOffset[r1_159][2]
    r3_159.Z = r2_159.SettlementOffset[r1_159][3]
  end
  r0_159:K2_SetActorLocation(UE4.UKismetMathLibrary.TransformLocation(r0_159:GetTransform(), r3_159), false, nil, true)
end
function r11_0.ResetOnSetEndPoint(r0_160)
  -- line: [2911, 2915] id: 160
  r0_160.CharacterMovement.Velocity = FVector(0, 0, 0)
  r0_160:AddGravityModifier(UE4.EGravityModifierTag.AnimNotify, 0)
  r0_160:SetActorEnableCollision(false)
end
function r11_0.CheckCanRecovery(r0_161)
  -- line: [3014, 3022] id: 161
  if IsClient(r0_161) then
    local r1_161 = r0_161:GetRecoveryCount()
    local r2_161 = r0_161:GetRecoveryMaxCount()
    local r3_161 = nil	-- notice: implicit variable refs by block#[5]
    if r2_161 >= 0 then
      r3_161 = r1_161 < r2_161
    else
      goto label_14	-- block#4 is visited secondly
    end
    return r3_161
  else
    return r0_161.Super.CheckCanRecovery(r0_161)
  end
end
function r11_0.SetIsJumpPadLaunched(r0_162, r1_162)
  -- line: [3118, 3120] id: 162
  r0_162.PlayerAnimInstance.IsJumpPadLaunched = r1_162
end
function r11_0.SetIsJumpPadLaunching(r0_163, r1_163)
  -- line: [3122, 3124] id: 163
  r0_163.PlayerAnimInstance.IsJumpPadLaunching = r1_163
end
function r11_0.GetBattleExtraInfo(r0_164)
  -- line: [3126, 3206] id: 164
  local r1_164 = {}
  local r2_164 = r0_164:GetAttr("Hp")
  local r3_164 = r0_164:GetAttr("Sp")
  local r4_164 = {
    RecoveryCount = r0_164:GetRecoveryCount(),
    IsRealDead = false,
  }
  if r0_164:IsDead() then
    r2_164 = r0_164:GetAttr("MaxHp")
    r3_164 = r0_164:GetAttr("MaxSp")
    r4_164.RecoveryCount = math.min(r4_164.RecoveryCount + 1, r0_164:GetRecoveryMaxCount())
  end
  r1_164.RoleInfo = {
    Level = r0_164:GetAttr("Level"),
    Exp = r0_164:GetAttr("Exp"),
    PlayerHp = r2_164,
    PlayerSp = r3_164,
    DeathInfo = r4_164,
  }
  if r0_164.MeleeWeapon then
    r1_164.MeleeWeapon = {
      Level = r0_164.MeleeWeapon:GetAttr("Level"),
      Exp = r0_164.MeleeWeapon:GetAttr("Exp"),
    }
  end
  if r0_164.RangedWeapon then
    local r5_164 = {
      Level = r0_164.RangedWeapon:GetAttr("Level"),
      Exp = r0_164.RangedWeapon:GetAttr("Exp"),
      BulletNum = r0_164.RangedWeapon:GetAttr("BulletNum") and 0,
      MagazineBulletNum = r0_164.RangedWeapon:GetAttr("MagazineBulletNum") and 0,
    }
    r1_164.RangedWeapon = r5_164
  end
  if r0_164.UltraWeapons then
    r1_164.UltraWeapons = {}
    for r9_164, r10_164 in pairs(r0_164.UltraWeapons) do
      table.insert(r1_164.UltraWeapons, {
        Level = r10_164:GetAttr("Level"),
        Exp = r10_164:GetAttr("Exp"),
      })
    end
    -- close: r5_164
  end
  for r10_164, r11_164 in pairs(r0_164:GetPhantomTeammates(false, true)) do
    local r12_164 = r11_164:GetAttr("Hp")
    local r13_164 = r11_164:GetAttr("Sp")
    local r14_164 = {
      RecoveryCount = r11_164:GetRecoveryCount(),
      IsRealDead = false,
    }
    if r11_164:IsDead() then
      if r11_164:IsRealDead() then
        r14_164.IsRealDead = true
      else
        r14_164.RecoveryCount = math.min(r14_164.RecoveryCount + 1, r11_164:GetRecoveryMaxCount())
      end
    end
    r1_164["PhantomInfo" .. r10_164] = {}
    r1_164["PhantomInfo" .. r10_164].RoleInfo = {
      Level = r0_164:GetAttr("Level"),
      PlayerHp = r12_164,
      PlayerSp = r13_164,
      DeathInfo = r14_164,
    }
    local r15_164 = r11_164:GetPhantomWeapon()
    if r15_164:HasTag(CommonConst.WeaponType.RangedWeapon) then
      local r16_164 = r1_164["PhantomInfo" .. r10_164]
      local r17_164 = {
        BulletNum = r15_164:GetAttr("BulletNum") and 0,
        MagazineBulletNum = r15_164:GetAttr("MagazineBulletNum") and 0,
      }
      r16_164.RangedWeapon = r17_164
    end
  end
  -- close: r6_164
  return r1_164
end
function r11_0.GetCurPhantomInfo(r0_165)
  -- line: [3208, 3285] id: 165
  local r1_165 = GWorld:GetAvatar()
  if not r1_165 then
    return 
  end
  local r2_165 = {}
  local r3_165 = r0_165:GetPhantomTeammates()
  local r4_165 = {}
  local r5_165 = {}
  for r10_165, r11_165 in pairs(r3_165) do
    if r11_165:IsPhantom() and (r11_165.IsSpawnByResource or r11_165.IsSpawnBySquad) then
      local r12_165 = r11_165.MeleeWeapon
      local r13_165 = r11_165.RangedWeapon
      local r14_165 = nil
      if r12_165 then
        r14_165 = r12_165.WeaponId
      elseif r13_165 then
        r14_165 = r13_165.WeaponId
      end
      if r14_165 then
        r5_165[r14_165] = r11_165.CurrentRoleId
      end
      r4_165[r11_165.CurrentRoleId] = r11_165
    end
  end
  -- close: r6_165
  for r10_165, r11_165 in pairs(r1_165.Chars) do
    if r4_165[r11_165.CharId] then
      local r12_165 = {}
      for r18_165, r19_165 in pairs(r11_165:GetModSuit()) do
        if r19_165.ModEid and r1_165.Mods[r19_165.ModEid] then
          local r20_165 = r1_165.Mods[r19_165.ModEid]
          table.insert(r12_165, {
            ModId = r20_165.ModId,
            Level = r20_165.Level,
          })
        end
      end
      -- close: r14_165
      r2_165[r11_165.CharId] = {}
      r2_165[r11_165.CharId].Character = {
        CharId = r11_165.CharId,
        Level = r11_165.Level,
        ModSuit = r12_165,
      }
    end
  end
  -- close: r6_165
  for r10_165, r11_165 in pairs(r1_165.Weapons) do
    local r12_165 = r5_165[r11_165.WeaponId]
    if r12_165 and r2_165[r12_165] then
      local r13_165 = {}
      for r19_165, r20_165 in pairs(r11_165:GetModSuit()) do
        if r20_165.ModEid and r1_165.Mods[r20_165.ModEid] then
          local r21_165 = r1_165.Mods[r20_165.ModEid]
          table.insert(r13_165, {
            ModId = r21_165.ModId,
            Level = r21_165.Level,
          })
        end
      end
      -- close: r15_165
      r2_165[r12_165].Weapon = {
        WeaponId = r11_165.WeaponId,
        Level = r11_165.Level,
        ModSuit = r13_165,
      }
    end
  end
  -- close: r6_165
  return r2_165
end
function r11_0.RefreshTeamMemberInfo(r0_166, r1_166)
  -- line: [3287, 3319] id: 166
  if IsDedicatedServer(r0_166) then
    return 
  end
  if not GWorld:GetAvatar() or GWorld:IsStandAlone() or GameState(r0_166).PlayerArray:Num() <= 1 then
    return 
  end
  if not r0_166.PlayerState then
    return 
  end
  local r3_166 = GWorld:GetMainPlayer()
  if r3_166 and r3_166.Eid == r0_166.PlayerState.Eid then
    return 
  end
  if TeamController:GetModel():IsTeammateByAvatarEid(r0_166.PlayerState.AvatarEidStr) then
    r0_166.PlayerState.OnReceiveActorStateChangeDelegate:Broadcast(r0_166.PlayerState.Eid, r7_0.OverReach, true, r1_166 == "ReceiveBeginPlay")
  end
end
function r11_0.PreEnterStory(r0_167, r1_167)
  -- line: [3323, 3328] id: 167
  r0_167:CleanInputWhenEnterTalk()
  r0_167:ReleaseFire()
  r0_167.bInStory = true
  r0_167:SetStealth(true, "Story")
end
function r11_0.PreExitStory(r0_168, r1_168)
  -- line: [3330, 3333] id: 168
  r0_168.bInStory = false
  r0_168:SetStealth(false, "Story")
end
function r11_0._CheckCanChangeToMaster(r0_169, r1_169, r2_169)
  -- line: [3336, 3399] id: 169
  if not IsStandAlone(r0_169) then
    if r1_169 then
      GWorld.logger.error("联机情况下，不能切换女主")
    end
    return false
  end
  if r0_169:CheckSkillIsBan(ESkillName.SwitchMasterOrHero) then
    if r1_169 then
      GWorld.logger.error("禁用切换女主和切回去英雄技能")
    end
    return false
  end
  if r0_169:CheckSkillInActive(ESkillName.SwitchMasterOrHero) then
    if r1_169 then
      GWorld.logger.error("切换女主和切回去英雄技能未激活")
    end
    return false
  end
  local r3_169 = UE4.UGameplayStatics.GetGameInstance(r0_169)
  local r4_169 = GWorld.GameInstance:GetCurrentDungeonId()
  if r4_169 and r4_169 > 0 then
    if r1_169 then
      GWorld.logger.error("副本内，不能切换女主")
    end
    return false
  end
  local r5_169 = GWorld:GetAvatar()
  if not r5_169 then
    if r1_169 then
      GWorld.logger.error("没有连接服务器，不能切换女主")
    end
    return false
  end
  local r6_169 = r5_169:GetCurrentRegionId()
  if not r6_169 or r6_169 == 0 then
    if r1_169 then
      GWorld.logger.error("不在区域中或者区域编号出错，不能切换女主")
    end
    return false
  end
  if not DataMgr.SubRegion[r6_169] then
    if r1_169 then
      GWorld.logger.error("不在区域中或者区域编号出错，不能切换女主")
    end
    return false
  end
  return true
end
function r11_0.CheckCanChangeToMaster(r0_170, r1_170, r2_170)
  -- line: [3401, 3430] id: 170
  r0_170.CanChangeToMaster = r0_170:_CheckCanChangeToMaster(r1_170, true)
  if not r2_170 and (not r0_170:CanEnterInteractive() or not r0_170:CharacterInTag("Idle")) then
    if r1_170 then
      GWorld.logger.error("当前状态不允许切换女主")
    end
    r0_170.CanChangeToMaster = false
    return r0_170.CanChangeToMaster
  end
  local r3_170 = UE4.UGameplayStatics.GetGameMode(r0_170)
  if not IsValid(r3_170) then
    r0_170.CanChangeToMaster = false
    if r1_170 then
      GWorld.logger.error("当前游戏模式无效, 不能切换女主")
    end
  elseif r3_170:IsInDungeon() and r0_170:IsDungeonInBattle() then
    r0_170.CanChangeToMaster = false
  elseif r0_170:IsRegionInBattle() then
    r0_170.CanChangeToMaster = false
  end
  return r0_170.CanChangeToMaster
end
function r11_0.CheckCanChangeBackToHero(r0_171, r1_171)
  -- line: [3432, 3434] id: 171
  return r0_171:_CheckCanChangeToMaster(r1_171, false)
end
function r11_0.SwitchMasterOrHeroUIPerform(r0_172)
  -- line: [3436, 3444] id: 172
  if not IsValid(r0_172.BattleMainUI) then
    r0_172.BattleMainUI = UIManager(r0_172):GetUIObj("BattleMain")
  end
  if r0_172.BattleMainUI == nil or r0_172.BattleMainUI.Char_Skill == nil then
    return 
  end
  r0_172.BattleMainUI.Char_Skill:OnSwitchMasterOrHero()
end
function r11_0.ChangeToMasterUIPerform(r0_173)
  -- line: [3446, 3457] id: 173
  EventManager:FireEvent(EventID.ShowOrHideMainPlayerBloodUI, false, "ChangeRoleToMaster")
  if not IsValid(r0_173.BattleMainUI) then
    r0_173.BattleMainUI = UIManager(r0_173):GetUIObj("BattleMain")
  end
  if r0_173.BattleMainUI == nil or r0_173.BattleMainUI.Char_Skill == nil then
    return 
  end
  r0_173.BattleMainUI.Char_Skill:OnChangeToMaster()
end
function r11_0.ChangeBackToHeroUIPerform(r0_174)
  -- line: [3459, 3470] id: 174
  EventManager:FireEvent(EventID.ShowOrHideMainPlayerBloodUI, true, "ChangeRoleToMaster")
  if not IsValid(r0_174.BattleMainUI) then
    r0_174.BattleMainUI = UIManager(r0_174):GetUIObj("BattleMain")
  end
  if r0_174.BattleMainUI == nil or r0_174.BattleMainUI.Char_Skill == nil then
    return 
  end
  r0_174.BattleMainUI.Char_Skill:OnChangeBackToHero()
end
function r11_0.SwitchMasterOrHero(r0_175)
  -- line: [3472, 3489] id: 175
  r0_175:SwitchMasterOrHeroUIPerform()
  if r0_175.IsSwitchFuncInCD then
    return 
  end
  if r0_175.CurrentMasterBan then
    r0_175:ChangeBackToHero()
  else
    r0_175:ChangeToMaster(true)
  end
  r0_175.IsSwitchFuncInCD = true
  r0_175:AddTimer_Combat(1, function()
    -- line: [3486, 3488] id: 176
    r0_175.IsSwitchFuncInCD = false
  end, false, 0, "SwitchFuncCDTimer")
end
function r11_0.ChangeToMaster(r0_177, r1_177, r2_177)
  -- line: [3491, 3572] id: 177
  if not r0_177:CheckCanChangeToMaster(r1_177, r2_177) then
    return 
  end
  if r0_177.CurrentMasterBan then
    GWorld.logger.error("当前已经是主角状态，不能执行切主角操作")
    return 
  end
  local r3_177 = 111
  local r4_177 = GWorld:GetAvatar()
  local r5_177 = r4_177:GetCurrentRegionId()
  print(_G.LogTag, "CheckCanChangeToMaster", r5_177)
  if not r5_177 or DataMgr.SubRegion[r5_177] == nil then
    GWorld.logger.error("当前不在区域中，不能切换主角")
    return 
  end
  local r6_177 = DataMgr.SubRegion[r5_177].SwitchPlayer
  if not r6_177 then
    GWorld.logger.error("当前区域没有可切换角色，不能切换主角")
    return 
  end
  local r7_177 = 1
  if not r4_177 then
    GWorld.logger.error("没有正常登录，不能切换主角")
    return 
  end
  local r8_177 = {
    RoleInfo = {
      PlayerHp = r0_177:GetAttr("Hp"),
      PlayerSp = r0_177:GetAttr("Sp"),
      PlayerES = r0_177:GetAttr("ES"),
    },
  }
  local r9_177 = {}
  local r10_177 = r0_177.RangedWeapon
  if r10_177 then
    r10_177 = r0_177.RangedWeapon:GetAttr("BulletNum") and 0
  else
    goto label_90	-- block#13 is visited secondly
  end
  r9_177.BulletNum = r10_177
  r10_177 = r0_177.RangedWeapon
  if r10_177 then
    r10_177 = r0_177.RangedWeapon:GetAttr("MagazineBulletNum") and 0
  else
    goto label_101	-- block#16 is visited secondly
  end
  r9_177.MagazineBulletNum = r10_177
  r8_177.RangedWeapon = r9_177
  r0_177.HeroTempInfo = r8_177
  r4_177.HeroTempInfo = r0_177.HeroTempInfo
  if r6_177 == "Player" then
    r7_177 = r4_177.Sex
  else
    r7_177 = r4_177.WeitaSex
  end
  print(_G.LogTag, "ChangeToMaster", r3_177, r7_177, r6_177)
  r8_177 = DataMgr.Player2RoleId[r6_177]
  if not r8_177 then
    GWorld.logger.error("没有找到对应的主角信息，请检查导表")
    return 
  end
  r9_177 = r8_177[r7_177]
  if not r9_177 then
    GWorld.logger.error("对应性别没有角色，请检查导表")
    return 
  end
  r0_177:ChangeRole(r9_177, nil)
  r0_177:RealChangeUsingWeapon(nil)
  r0_177:ClearAllSuitItem()
  r0_177:BanSkills()
  r0_177.CurrentMasterBan = true
  if r4_177 then
    r4_177.CurrentMasterBan = true
  end
  r0_177:CombindTwoKeyToOneCommand("Skill3", "SwitchMaster")
  r0_177:ChangeToMasterUIPerform()
  r0_177:DisableBattleWheel()
  r10_177 = r0_177:GetBattlePet()
  if r10_177 then
    r10_177:HideBattlePet("Master", true)
  end
end
function r11_0.ChangeBackToHero(r0_178)
  -- line: [3574, 3595] id: 178
  if not r0_178:CheckCanChangeBackToHero(true) then
    return 
  end
  if not IsValid(UE4.UGameplayStatics.GetGameMode(r0_178)) then
    return 
  end
  if not r0_178.CurrentMasterBan then
    GWorld.logger.error("当前不是女主状态，不能从女主切回军械库角色")
    return 
  end
  r0_178:RecoverBanSkills()
  r0_178.NotChangeRoleTips = true
  r0_178:RecoverHeroInfo()
  r0_178:ChangeRole()
  r0_178.NotChangeRoleTips = false
  r0_178:WithChangeBackToHero()
end
function r11_0.WithChangeBackToHero(r0_179)
  -- line: [3597, 3608] id: 179
  r0_179:SeparateTwoKeyToOneCommand("Skill3", "SwitchMaster")
  r0_179:ChangeBackToHeroUIPerform()
  r0_179:EnableBattleWheel()
  local r1_179 = r0_179:GetBattlePet()
  if r1_179 then
    r1_179:HideBattlePet("Master", false)
  end
end
function r11_0.RecoverHeroInfo(r0_180)
  -- line: [3610, 3622] id: 180
  local r1_180 = GWorld:GetAvatar()
  local r2_180 = r0_180.HeroTempInfo and r1_180.HeroTempInfo
  if r2_180 ~= nil then
    local r3_180 = GWorld:GetAvatar()
    r0_180:GetController():SetAvatarInfo(r2_0.ObjId2Str(r3_180.Eid), AvatarUtils:UpdateBattleInfo(AvatarUtils:GetDefaultBattleInfo(r3_180), r2_180))
    r0_180.HeroTempInfo = nil
    r3_180.HeroTempInfo = nil
  end
end
function r11_0.RecoverBanSkills(r0_181)
  -- line: [3624, 3634] id: 181
  print(_G.LogTag, "RecoverBanSkills", r0_181.CurrentRoleId)
  if r0_181.CurrentMasterBan then
    r0_181:UnBanSkills()
    r0_181.CurrentMasterBan = false
    local r1_181 = GWorld:GetAvatar()
    if r1_181 then
      r1_181.CurrentMasterBan = false
    end
  end
end
function r11_0.OnBattleStateChanged(r0_182, r1_182)
  -- line: [3636, 3647] id: 182
  if not r1_182 then
    return 
  end
  if not r0_182.CurrentMasterBan then
    return 
  end
  print(_G.LogTag, "OnBattleStateChanged", r1_182)
  r0_182:ChangeBackToHero()
end
function r11_0.BanSkills(r0_183)
  -- line: [3648, 3659] id: 183
  local r1_183 = TArray(0)
  for r6_183, r7_183 in pairs(r0_0.AllSKillNames) do
    if not r0_183:CheckSkillInActive(r7_183) then
      r1_183:Add(r7_183)
    end
  end
  -- close: r2_183
  local r2_183 = r0_183:GetController()
  if r2_183 then
    r2_183:BanSkills(r1_183, "MasterBan")
  end
end
function r11_0.UnBanSkills(r0_184)
  -- line: [3661, 3666] id: 184
  local r1_184 = r0_184:GetController()
  if r1_184 then
    r1_184:UnBanSkills("MasterUnBan")
  end
end
function r11_0.RegionBanSkills(r0_185)
  -- line: [3667, 3679] id: 185
  local r1_185 = TArray(0)
  for r6_185, r7_185 in pairs(r0_0.AllSKillNames) do
    if not r0_185:CheckSkillInActive(r7_185) then
      r1_185:Add(r7_185)
    end
  end
  -- close: r2_185
  local r2_185 = r0_185:GetController()
  if r2_185 then
    r2_185:BanSkills(r1_185, "RegionBan")
  end
end
function r11_0.RegionUnBanSkills(r0_186)
  -- line: [3681, 3686] id: 186
  local r1_186 = r0_186:GetController()
  if r1_186 then
    r1_186:UnBanSkills("RegionUnBan")
  end
end
function r11_0.MoveAlongSplineBanSkills(r0_187)
  -- line: [3688, 3700] id: 187
  local r1_187 = TArray(0)
  for r6_187, r7_187 in pairs(r0_0.AllSKillNames) do
    if not r0_187:CheckSkillInActive(r7_187) then
      r1_187:Add(r7_187)
    end
  end
  -- close: r2_187
  r1_187:Add(ESkillName.SwitchMasterOrHero)
  local r2_187 = r0_187:GetController()
  if r2_187 then
    r2_187:BanSkills(r1_187, "MoveAlongSpline")
  end
end
function r11_0.MoveAlongSplineUnBanSkills(r0_188)
  -- line: [3702, 3707] id: 188
  local r1_188 = r0_188:GetController()
  if r1_188 then
    r1_188:UnBanSkills("MoveAlongSpline")
  end
end
function r11_0.ForbidActionWhileMoveAlongSpline(r0_189, r1_189)
  -- line: [3709, 3724] id: 189
  local r2_189 = TArray(0)
  r2_189:Add(ESkillName.Jump)
  r2_189:Add(ESkillName.Slide)
  r2_189:Add(ESkillName.BulletJump)
  r2_189:Add(ESkillName.Avoid)
  r2_189:Add(ESkillName.Crouch)
  local r3_189 = r0_189:GetController()
  if r3_189 then
    if r1_189 then
      r3_189:InActiveSkills(r2_189, "MoveAlongSpline")
    else
      r3_189:ActiveSkills(r2_189, "MoveAlongSpline")
    end
  end
end
function r11_0.ForbidSkillsInHooking(r0_190, r1_190)
  -- line: [3726, 3750] id: 190
  local r2_190 = {
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
  local r3_190 = TArray(0)
  for r8_190, r9_190 in pairs(r2_190) do
    r3_190:Add(r9_190)
  end
  -- close: r4_190
  local r4_190 = r0_190:GetController()
  if r4_190 then
    if r1_190 then
      r4_190:InActiveSkillsInHooking(r3_190)
    else
      r4_190:ActiveSkillsEndHooking(r3_190)
    end
  end
end
function r11_0.ForbidActiveSkills(r0_191, r1_191)
  -- line: [3752, 3759] id: 191
  r0_191:ForbidSkills(r1_191, {
    ESkillName.Skill1,
    ESkillName.Skill2,
    ESkillName.Skill3
  })
end
function r11_0.ForbidAllSkills(r0_192, r1_192)
  -- line: [3761, 3769] id: 192
  r0_192:ForbidSkills(r1_192, {
    ESkillName.Skill1,
    ESkillName.Skill2,
    ESkillName.Skill3,
    ESkillName.Passive
  })
end
function r11_0.ForbidMeleeSkills(r0_193, r1_193)
  -- line: [3771, 3779] id: 193
  r0_193:ForbidSkills(r1_193, {
    ESkillName.Attack,
    ESkillName.FallAttack,
    ESkillName.HeavyAttack,
    ESkillName.SlideAttack
  })
end
function r11_0.ForbidRangedSkills(r0_194, r1_194)
  -- line: [3781, 3788] id: 194
  r0_194:ForbidSkills(r1_194, {
    ESkillName.Fire,
    ESkillName.ChargeBullet,
    ESkillName.HeavyShooting
  })
end
function r11_0.ForbidSkills(r0_195, r1_195, r2_195)
  -- line: [3790, 3803] id: 195
  local r3_195 = TArray(0)
  for r8_195, r9_195 in pairs(r2_195) do
    r3_195:Add(r9_195)
  end
  -- close: r4_195
  local r4_195 = r0_195:GetController()
  if r4_195 then
    if r1_195 then
      r4_195:InActiveSkills(r3_195, "Ban")
    else
      r4_195:ActiveSkills(r3_195, "UnBan")
    end
  end
end
function r11_0.AfterLoading(r0_196, r1_196)
  -- line: [3805, 3877] id: 196
  if r0_196.AfterLoadingDone then
    return 
  end
  if r1_0:Get("ImmersionModel") then
    r0_196:ImmersionModel()
  end
  r0_196:RefreshCharUIByPlatform()
  local r3_196 = GWorld:GetAvatar()
  if r3_196 and r3_196:CheckSubRegionType(nil, CommonConst.SubRegionType.Home) then
    r0_196:CheckDraftCanProduce()
  end
  r0_196:SetActorHideTag("DeliveryMontage", false)
  local r4_196 = UE4.UGameplayStatics.GetGameInstance(r0_196)
  if r4_196 and r1_196 and r1_196 == r0_196.Eid and r4_196.ShouldPlayDeliveryEndMontage then
    local r8_196 = {
      OnNotifyBegin = function()
        -- line: [3830, 3834] id: 197
        DebugPrint("zwk OnDeliveryAfterLoadingMontageNotifyBegin")
        r0_196:RemoveDisableInputTag("DeliverMontage")
      end,
      OnInterrupted = function()
        -- line: [3835, 3839] id: 198
        DebugPrint("zwk OnDeliveryAfterLoadingInterrupted", r4_196.ShouldPlayDeliveryEndMontage)
        r0_196:RemoveDisableInputTag("DeliverMontage")
        r4_196.ShouldPlayDeliveryEndMontage = false
      end,
      OnCompleted = function()
        -- line: [3840, 3843] id: 199
        DebugPrint("zwk OnDeliveryAfterLoadingMontageCompleted", r4_196.ShouldPlayDeliveryEndMontage)
        r4_196.ShouldPlayDeliveryEndMontage = false
      end,
    }
    DebugPrint("zwk OnDeliveryAfterLoadingMontageBegin")
    if r3_196 and r3_196.IsInRegionOnline and r3_196.CurrentOnlineType then
      r0_196:ForceReSyncLocation()
      r3_196:SwitchOnlineState(r3_196.CurrentOnlineType, CommonConst.OnlineState.Normal)
    end
    r0_196:ResetIdle()
    r0_196:AddDisableInputTag("DeliverMontage")
    r0_196:PlayTeleportAction(r8_196, false, true, false)
    r0_196.Mesh:GetAnimInstance():Montage_JumpToSection("End")
    r0_196:AddTimer(2, function()
      -- line: [3861, 3868] id: 200
      if r0_196.DisableInputTags:Find("DeliverMontage") then
        DebugPrint("zwk RemoveDeliverTag")
      end
      r0_196:RemoveDisableInputTag("DeliverMontage")
      r0_196:SetActorHideTag("DeliveryMontage", false)
    end, false, 0)
  end
  r0_196.AfterLoadingDone = true
  r0_196:AddTimer(1, function()
    -- line: [3874, 3876] id: 201
    r0_196.AfterLoadingDone = false
  end)
end
function r11_0.GetIsInDelivery(r0_202)
  -- line: [3879, 3886] id: 202
  local r1_202 = UE4.UGameplayStatics.GetGameInstance(r0_202)
  local r2_202 = r1_202:GetLoadingUI()
  local r3_202 = r2_202 and r2_202.bIsInLoading
  local r4_202 = UIManager(r0_202):GetUIObj("BlackScreenXiaobai")
  return r3_202 and r4_202 and r1_202.ShouldPlayDeliveryEndMontage
end
function r11_0.LoadHitDirection(r0_203, r1_203, r2_203)
  -- line: [3916, 3924] id: 203
  r1_203.CurHitDirectionNum = r1_203.CurHitDirectionNum + 1
  RunAsyncTask(r0_203, "CreateHitDirectionHandler" .. r1_203.CurHitDirectionNum, function(r0_204)
    -- line: [3918, 3923] id: 204
    r1_203:AddToQueue(UE4.UGameplayStatics.GetGameInstance(r0_203):GetGameUIManager():LoadUIAsync("BattleHitDirection", r0_204, r2_203, r0_203))
  end)
end
function r11_0.DungeonOtherPlayerLeave(r0_205)
  -- line: [3926, 3936] id: 205
  if not r0_205:IsMainPlayer() and IsClient(r0_205) then
    EventManager:FireEvent(EventID.OnDungeonOtherPlayerLeave, r0_205)
    if UIManager(r0_205):GetUIObj("TeamToast") then
      UIManager(r0_205):UnLoadUINew("TeamToast")
    end
    UIManager(r0_205):LoadUINew("TeamToast", r0_205.PlayerState, false)
  end
end
function r11_0.SetCollisionProfileOverlapAll(r0_206, r1_206)
  -- line: [3938, 3960] id: 206
  DebugPrint("BP_PlayerCharacter_C:SetCollisionProfileOverlapAll", r1_206, r0_206.CachedPlayerCollisionProfile)
  if r0_206.CachedPlayerCollisionProfile ~= nil == r1_206 then
  end
  if r1_206 then
    r0_206.CachedPlayerCollisionProfile = r0_206.CapsuleComponent:GetCollisionProfileName()
    r0_206.CapsuleComponent:SetCollisionResponseToAllChannels(UE4.ECollisionResponse.ECR_Overlap)
    if r0_206.SkillBlockCapsule then
      r0_206.SkillBlockCapsuleCachedCollision = r0_206.SkillBlockCapsule:GetCollisionEnabled()
      r0_206.SkillBlockCapsule:SetCollisionEnabled(ECollisionEnabled.NoCollision)
    end
  else
    r0_206.CapsuleComponent:SetCollisionProfileName("Pawn", false)
    r0_206.CachedPlayerCollisionProfile = nil
    if r0_206.SkillBlockCapsule then
      r0_206.SkillBlockCapsule:SetCollisionEnabled(r0_206.SkillBlockCapsuleCachedCollision)
    end
  end
end
function r11_0.NeedArmoryHelper(r0_207)
  -- line: [3962, 3964] id: 207
  return GWorld:GetAvatar() ~= nil
end
function r11_0.RequestDeadAsyncTravel(r0_208, r1_208)
  -- line: [3965, 4101] id: 208
  r0_208:DisablePlayerInputInDeliver(true)
  local r2_208 = GWorld.GameInstance
  local r3_208 = r2_208:GetTalkContext()
  local r4_208 = UIManager(r2_208)
  local r5_208 = UE4.UGameplayStatics.GetGameState(r0_208)
  local r6_208 = r0_208:GetController()
  local r7_208 = false
  local r8_208 = false
  local r9_208 = r1_208.Transform
  local function r10_208()
    -- line: [3977, 3998] id: 209
    r4_208:HideCommonBlackScreen("DeadAsyncTravel")
    local r0_209 = r4_208:GetUIObj("MainTaskIndicator")
    if IsValid(r0_209) then
      r0_209:SetVisibility(UE4.ESlateVisibility.Visible)
    end
    local r1_209 = r2_208:GetSceneManager()
    local r2_209 = UE4.UGameplayStatics.GetGameMode(r0_208)
    local r3_209 = r2_209:GetLevelLoader()
    r1_209:ShowOrHideAllSceneGuideIcon(true)
    r0_208:EnableInput(r6_208)
    if IsValid(r3_209) then
      r3_209:RemoveArtLevelLoadedCompleteCallback(r2_209:GetLevelLoader():GetLevelIdByLocation(r9_208.Translation))
    end
    r0_208:DisablePlayerInputInDeliver(false)
    local r4_209 = GWorld.StoryMgr
    if r4_209 then
      r4_209:FailCurrentQuestWhenDead()
    end
  end
  local r14_208 = {
    BlackScreenHandle = "DeadAsyncTravel",
    BlackScreenText = GText(r1_208.FailBlackScreenText),
    InAnimationObj = r0_208,
    InAnimationPlayTime = r1_208.FadeInTime and nil,
    InAnimationCallback = function()
      -- line: [4000, 4089] id: 210
      local r0_210 = GWorld.GameInstance
      local r1_210 = r0_210:GetGameUIManager()
      r0_210:GetSceneManager():ShowOrHideAllSceneGuideIcon(false)
      local r3_210 = r1_210:GetUIObj("MainTaskIndicator")
      if IsValid(r3_210) then
        r3_210:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
      r0_208:DisableInput()
      r0_208:QuickRecovery()
      local r4_210 = UE4.UGameplayStatics.GetGameMode(r0_208)
      local function r5_210()
        -- line: [4013, 4019] id: 211
        r4_210:SetActorLocationAndRotationByTransform(0, r9_208, true)
        r0_208:SetSafeLocation()
        if r8_208 then
          r0_208:GetController():SetControlRotation(r0_208:K2_GetActorRotation())
        end
      end
      local r6_210 = r4_210:GetLevelLoader()
      r0_208.DurationEnd = false
      r0_208.TravelFinish = false
      local function r7_210()
        -- line: [4025, 4031] id: 212
        if r0_208.DurationEnd and r0_208.TravelFinish then
          r0_208.DurationEnd = nil
          r0_208.TravelFinish = nil
          r10_208()
        end
      end
      local function r8_210()
        -- line: [4032, 4035] id: 213
        r0_208.TravelFinish = true
        r7_210()
      end
      r4_210:AddTimer(r1_208.ContinueTime, function()
        -- line: [4036, 4039] id: 214
        r0_208.DurationEnd = true
        r7_210()
      end, false, 0, "CommonBlackScreenContinueTimer", true)
      if IsValid(r6_210) then
        local r10_210 = r4_210:GetLevelLoader():GetLevelIdByLocation(r9_208.Translation)
        local r11_210 = r4_210:GetLevelLoader():GetLevelIdByLocation(r0_208:K2_GetActorLocation())
        local r12_210 = r4_210:GetWCSubSystem()
        if r12_210 then
          if r7_208 then
            r12_210:RequestAsyncTravel(r3_208.Player, r9_208, {
              r3_208,
              r8_210
            }, r8_208)
          elseif r12_210:IsBigObjectLevelLoadedByLocation(r9_208.Translation) then
            r5_210()
            r8_210()
          else
            r12_210:RequestAsyncTravel(r3_208.Player, r9_208, {
              r3_208,
              r8_210
            }, r8_208)
          end
          return 
        end
        if r6_210:GetLevelLoaded(r10_210) then
          r5_210()
          r8_210()
          return 
        end
        if r10_210 ~= r11_210 then
          r6_210:BindArtLevelLoadedCompleteCallback(r10_210, function()
            -- line: [4076, 4079] id: 215
            r5_210()
            r8_210()
          end)
          r6_210:LoadArtLevel(r10_210)
        else
          r5_210()
          r8_210()
        end
      else
        r5_210()
        r8_210()
      end
    end,
    OutAnimationObj = r0_208,
    OutAnimationCallback = nil,
    OutAnimationPlayTime = r1_208.FadeOutTime and nil,
  }
  r4_208:ShowCommonBlackScreen(r14_208)
end
function r11_0.TeleportToCloestTeleportPoint(r0_216, r1_216, r2_216)
  -- line: [4103, 4176] id: 216
  local r3_216 = UE4.UGameplayStatics.GetGameMode(r0_216)
  if not r3_216 then
    return false
  end
  if not r3_216:IsInRegion() then
    return 
  end
  local r4_216 = r3_216:GetWCSubSystem()
  if not r4_216 then
    return 
  end
  local r5_216 = r3_216:GetRegionDataMgrSubSystem()
  if not r5_216 then
    return 
  end
  local r6_216 = UE4.UGameplayStatics.GetGameState(r0_216)
  local r7_216 = r0_216:K2_GetActorLocation()
  if r2_216 then
    r7_216 = r2_216
  end
  local r8_216 = 2100000000
  local r9_216 = nil
  for r14_216, r15_216 in pairs(r6_216.StaticCreatorMap) do
    if r15_216.UnitId == CommonConst.DeliveryAnchorMechanismUnitId and r15_216.UnitType == "Mechanism" then
      local r16_216 = r5_216:GetLuaDataIndex(r15_216.CreatedWorldRegionEid)
      if r16_216 >= 0 and r5_216.DataPool.RegionData[r16_216] and r5_216.DataPool.RegionData[r16_216].State and r5_216.DataPool.RegionData[r16_216].State.OpenState then
        local r18_216 = r7_216:DistSquared(r15_216:K2_GetActorLocation())
        if r18_216 < r8_216 then
          r8_216 = r18_216
          r9_216 = r15_216
        end
      end
    end
  end
  -- close: r10_216
  if not r9_216 then
    for r14_216, r15_216 in pairs(r5_216.CurRegionDeliverNew:ToTable()) do
      if r5_216:CheckDeliverMechanismIsDefault(r15_216) then
        r9_216 = r6_216.StaticCreatorMap:FindRef(r15_216)
        break
      end
    end
    -- close: r10_216
  end
  local r10_216 = 1
  if r9_216 then
    for r15_216, r16_216 in pairs(DataMgr.TeleportPoint) do
      if r16_216.StaticId == r9_216.StaticCreatorId then
        r10_216 = r16_216.TeleportPointPos
      end
    end
    -- close: r11_216
  end
  local r11_216 = r3_216:GetWCSubSystem()
  local r13_216 = nil	-- notice: implicit variable refs by block#[38]
  if r9_216 then
    r13_216 = r9_216:K2_GetActorLocation()
    if not r13_216 then
      ::label_131::
      r13_216 = r0_216.CurrentLocation
    end
  else
    goto label_131	-- block#37 is visited secondly
  end
  r13_216 = r3_216:GetLevelLoader():GetStartPointByManager(r11_216:GetParentLevelIdByLocation(r13_216), r10_216)
  r4_216:RequestAsyncTravel(r0_216, r13_216:GetTransform(), {
    r0_216,
    function()
      -- line: [4170, 4173] id: 217
      if r1_216 then
        r1_216()
      end
    end
  })
  return true
end
function r11_0.InpActEvt_GlobalSlow_K2Node_InputActionEvent_1(r0_218, r1_218)
  -- line: [4178, 4182] id: 218
  if TeamController and TeamController:GetTeamPopupBarOpen() then
    return 
  end
  DebugPrint(LXYTag, "BP_PlayerCharacter_C:InpActEvt_GlobalSlow_K2Node_InputActionEvent_1")
  r0_218.Overridden.InpActEvt_GlobalSlow_K2Node_InputActionEvent_1(r0_218, r1_218)
end
function r11_0.CallClientPrint_Lua(r0_219, r1_219)
  -- line: [4184, 4186] id: 219
  print(LogTag, "服务器的输出为:" .. tostring(r1_219))
end
function r11_0.SetEnableFallAtkDir(r0_220)
  -- line: [4188, 4204] id: 220
  local r1_220 = r1_0:Get("EnableFallAtkDir")
  if r1_220 == nil then
    local r2_220 = DataMgr.Option.FallAttackDirection
    local r3_220 = r2_220.DefaultValue
    if r2_0.GetDeviceTypeByPlatformName(r0_220) == "Mobile" and r2_220.DefaultValueM then
      r3_220 = r2_220.DefaultValueM
    end
    r1_220 = true
    if r3_220 == "False" then
      r1_220 = false
    end
  end
  r0_220:UpdateEnableFallAtkDir(r1_220)
end
function r11_0.UpdateEnableFallAtkDir(r0_221, r1_221)
  -- line: [4206, 4209] id: 221
  r0_221.Overridden.UpdateEnableFallAtkDir(r0_221, r1_221)
  r1_0:Set("EnableFallAtkDir", r1_221)
end
function r11_0.GetCurrentCharUI(r0_222)
  -- line: [4211, 4216] id: 222
  local r1_222 = DataMgr.BattleChar[r0_222.CurrentRoleId]
  if r1_222.CharUIId then
    return r0_222:GetCharUIObj(r1_222.CharUIId)
  end
end
function r11_0.GetCharUIObj(r0_223, r1_223)
  -- line: [4218, 4226] id: 223
  local r2_223 = GWorld.GameInstance:GetGameUIManager()
  if not IsValid(r2_223) then
    return nil
  end
  return r2_223:GetUIObj(DataMgr.BattleCharUI[r1_223][r0_223:GetAttr("GradeLevel") and 0].UIName)
end
function r11_0.K2_OnEndViewTarget(r0_224, r1_224)
  -- line: [4228, 4230] id: 224
  EventManager:FireEvent(EventID.OnEndViewTarget)
end
function r11_0.K2_OnBecomeViewTarget(r0_225, r1_225)
  -- line: [4231, 4235] id: 225
  rawset(r0_225, "Controller", r1_225)
  rawset(r1_225, "PlayerCameraManager", r1_225.PlayerCameraManager)
  EventManager:FireEvent(EventID.OnBecomeViewTarget)
end
function r11_0.SetRegionOnlineState(r0_226)
  -- line: [4237, 4253] id: 226
  local r1_226 = r1_0:Get("AutoJoin")
  if r1_226 == nil then
    local r2_226 = DataMgr.Option.AutoJoin
    local r3_226 = r2_226.DefaultValue
    if r2_0.GetDeviceTypeByPlatformName(r0_226) == "Mobile" and r2_226.DefaultValueM then
      r3_226 = r2_226.DefaultValueM
    end
    r1_226 = true
    if r3_226 == "False" then
      r1_226 = false
    end
  end
  r0_226:UpdateRegionOnlineState(r1_226)
end
function r11_0.UpdateRegionOnlineState(r0_227, r1_227)
  -- line: [4254, 4257] id: 227
  r0_227.bOpenRegionOnline = r1_227
  r1_0:Set("AutoJoin", r1_227)
end
function r11_0.GetPlayerGender(r0_228, r1_228)
  -- line: [4258, 4265] id: 228
  local r2_228 = GWorld:GetAvatar()
  if r2_228 then
    return r2_228.Sex
  else
    return 0
  end
end
function r11_0.GetTeamMemberEidArray(r0_229)
  -- line: [4267, 4284] id: 229
  local r1_229 = UE4.UGameplayStatics.GetGameInstance(r0_229)
  if not TeamController or not TeamController:GetModel() or not r1_229 then
    return {}
  end
  local r2_229 = r1_229:GetSceneManager()
  if not r2_229 or not r2_229.RegionOnlineCharacterInfo then
    return {}
  end
  local r3_229 = TeamController:GetModel():GetTeam() and {}
  local r4_229 = {}
  for r9_229, r10_229 in pairs(r3_229.Members and {}) do
    if r10_229 then
      table.insert(r4_229, r2_229.RegionOnlineCharacterInfo[r10_229.Uid])
    end
  end
  -- close: r5_229
  return r4_229
end
function r11_0.EnterRegionOnlineRegisterTeamEvent(r0_230, r1_230)
  -- line: [4286, 4319] id: 230
  if not TeamController or not TeamController:GetModel() then
    return 
  end
  local r2_230 = UE4.URegionSyncSubsystem.GetInstance(r0_230)
  if r1_230 then
    TeamController:RegisterEvent(r0_230, function(r0_231, r1_231, ...)
      -- line: [4292, 4315] id: 231
      DebugPrint("EnterRegionOnlineRegisterTeamEvent  " .. r1_231)
      local r2_231 = TeamCommon.EventId.TeamOnAddPlayer
      local r3_231 = nil	-- notice: implicit variable refs by block#[15]
      if r1_231 == r2_231 then
        ... = ... -- error: untaken top expr
        r3_231 = r2_230
        if r3_231 and r2_231 then
          r3_231 = r2_231.Eid
          if r3_231 then
            r2_230:SetOnlinePlayerTeamMember(r2_0.ObjId2Str(r2_231.Eid), true)
          end
        end
      else
        r2_231 = TeamCommon.EventId.TeamOnDelPlayer
        if r1_231 == r2_231 then
          ... = ... -- error: untaken top expr
          r3_231 = r2_230
          if r3_231 and r2_231 then
            r3_231 = r2_231.Eid
            if r3_231 then
              r2_230:SetOnlinePlayerTeamMember(r2_0.ObjId2Str(r2_231.Eid), true)
            end
          end
        elseif r1_231 == TeamCommon.EventId.TeamOnInit or r1_231 == TeamCommon.EventId.TeamLeave then
          r2_231 = r1_231 == TeamCommon.EventId.TeamOnInit
          ... = ... -- error: untaken top expr
          local r4_231 = r3_231 and TeamController:GetModel():GetTeam()
          if not r4_231 or not r4_231.Members then
            return 
          end
          for r9_231, r10_231 in pairs(r4_231.Members) do
            if r2_230 then
              r2_230:SetOnlinePlayerTeamMember(r2_0.ObjId2Str(r10_231.Eid), r2_231)
            end
          end
          -- close: r5_231
        end
      end
    end)
  else
    TeamController:UnRegisterEvent(r0_230)
  end
end
function r11_0.OnChangeNickName(r0_232, r1_232)
  -- line: [4321, 4324] id: 232
  r0_232:EnableHeadWidget("Name", false)
  r0_232:EnableHeadWidget("Name", true, r1_232)
end
function r11_0.OnChangeTitle(r0_233, r1_233, r2_233, r3_233)
  -- line: [4326, 4328] id: 233
  r0_233:RefreshTitle(r1_233, r2_233, r3_233)
end
function r11_0.EnableNameWidget(r0_234)
  -- line: [4330, 4350] id: 234
  EventManager:AddEvent(EventID.OnChangeNickName, r0_234, r0_234.OnChangeNickName)
  EventManager:AddEvent(EventID.OnChangeTitle, r0_234, r0_234.OnChangeTitle)
  local r1_234 = r0_234.HeadWidgetComponent == nil
  r0_234:InitHeadWidgetComponent()
  if r1_234 then
    r0_234:EnableHeadWidget("Name", false)
    r0_234:EnableHeadWidget("Title", false)
  end
  local r2_234 = GWorld:GetAvatar()
  if r2_234 then
    r0_234:OnChangeNickName(r2_234.Nickname)
    r0_234:OnChangeTitle(r2_234.TitleBefore, r2_234.TitleAfter, r2_234.TitleFrame)
  end
  if r0_234.HeadWidgetComponent then
    local r3_234 = r0_234.HeadWidgetComponent:GetWidget()
    if r3_234 then
      r3_234:SetUIVisibilityTag("MainPlayerDisableNameWidget", false)
    end
  end
end
function r11_0.DisableNameWidget(r0_235)
  -- line: [4352, 4364] id: 235
  if not r0_235.HeadWidgetComponent then
    return 
  end
  EventManager:RemoveEvent(EventID.OnChangeNickName, r0_235)
  EventManager:RemoveEvent(EventID.OnChangeTitle, r0_235)
  if r0_235.HeadWidgetComponent then
    local r1_235 = r0_235.HeadWidgetComponent:GetWidget()
    if r1_235 then
      r1_235:SetUIVisibilityTag("MainPlayerDisableNameWidget", true)
    end
  end
end
AssembleComponents(r11_0, {
  "GetDamageInstigatorCurrentAngle"
})
return r11_0
