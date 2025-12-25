-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\UI_PC\Battle\WBP_Player_SkillPanel_PC_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = {
  SupportSkill = 1,
  BulletIcon = 2,
  WeaponIcon = 3,
}
local r1_0 = Class("BluePrints.UI.BP_UIState_C")
function r1_0.Initialize(r0_1, r1_1)
  -- line: [19, 33] id: 1
  r0_1.Super.Initialize(r0_1)
  r0_1.OwnerPlayer = nil
  r0_1.CurState = "Normal"
  r0_1.PlayerMainRoleId = nil
  r0_1.SupportSkillState = "UnLock"
  r0_1.SupportSkillForCRTimeStamp = nil
  r0_1.SkillButtons = {}
  r0_1.PlayerSpHelpInfo = {}
  r0_1.IsLackMagazine = false
  r0_1.IsRefreshWeapon = true
  r0_1.LoadingIconMap = {}
  r0_1.InfinitySymbol = GText("INFINITY_SYMBOL")
  r0_1.MyFVector2D = FVector2D(0, 0)
end
function r1_0.Construct(r0_2)
  -- line: [35, 39] id: 2
  r0_2.Super.Construct(r0_2)
  r0_2:InitListenEvent()
  r0_2.Energy_Skill:SetExplicitChildLayer(true)
end
function r1_0.InitSkillAfterCharInitReady(r0_3)
  -- line: [41, 58] id: 3
  r0_3:GetOwnerPlayer()
  if not IsValid(r0_3.OwnerPlayer) then
    return 
  end
  r0_3:InitSupportSkill()
  r0_3:InitVariable(r0_3:GetOwnerPlayer())
  r0_3:GetSkillActiveInfo()
  if r0_3.IsInit then
    if not r0_3:IsExistTimer("UpdateSkillPanelInfoInTimer") then
      r0_3:AddTimer(0.1, r0_3.UpdateSkillPanelInfoInTimer, true, 0, "UpdateSkillPanelInfoInTimer", false)
    end
    return 
  end
  r0_3:OnLoaded()
  r0_3:ClearRemainAnim()
end
function r1_0.Destruct(r0_4)
  -- line: [60, 72] id: 4
  r0_4.Super.Destruct(r0_4)
  r0_4:StopAllAnimations()
  r0_4:FlushAnimations()
  local r1_4 = GWorld:GetAvatar()
  if r1_4 == nil then
    return 
  end
  if r0_4.SupportUnlockKey then
    r1_4:UnBindOnUIFirstTimeUnlock(r0_4.SupportUIUnlockRuleId, r0_4.SupportUnlockKey)
  end
  if r0_4.SwitchUnlockKey then
    r1_4:UnBindOnUIFirstTimeUnlock(r0_4.SwitchUIUnlockRuleId, r0_4.SwitchUnlockKey)
  end
end
function r1_0.OnLoaded(r0_5, ...)
  -- line: [74, 80] id: 5
  r0_5.Super.OnLoaded(r0_5, ...)
  r0_5.IsInit = true
  r0_5:PlayAnim("In")
  r0_5:OnBattlePetInitReady()
  r0_5.Main:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end
function r1_0.CloseWithOutAnim(r0_6)
  -- line: [82, 85] id: 6
  r0_6:BindToAnimationFinished(r0_6.Out, {
    r0_6,
    r0_6.Close
  })
  r0_6:PlayAnim("Out")
end
function r1_0.InitListenEvent(r0_7)
  -- line: [87, 110] id: 7
  r0_7:AddDispatcher(EventID.OnBattlePetInitReady, r0_7, r0_7.OnBattlePetInitReady)
  r0_7:AddDispatcher(EventID.OnSwitchRole, r0_7, r0_7.OnSwitchRole)
  r0_7:AddDispatcher(EventID.ChangeRole, r0_7, r0_7.OnSwitchRole)
  r0_7:AddDispatcher(EventID.OnSwitchPet, r0_7, r0_7.OnSwitchPet)
  r0_7:AddDispatcher(EventID.UpdateMainPlayerSp, r0_7, r0_7.OnUpdateCharSp)
  r0_7:AddDispatcher(EventID.UpdateMainPlayerMaxSp, r0_7, r0_7.OnUpdateMaxSp)
  r0_7:AddDispatcher(EventID.OutOfBullet, r0_7, r0_7.OnWeaponBulletNotEnough)
  r0_7:AddDispatcher(EventID.OnSelectWeapon, r0_7, r0_7.RefreshWeaponIcon)
  r0_7:AddDispatcher(EventID.OnSwitchWeapon, r0_7, r0_7.RefreshWeaponIcon)
  r0_7:AddDispatcher(EventID.OnChangeKeyBoardSet, r0_7, r0_7.RefreshKeyName)
  r0_7:AddDispatcher(EventID.OnSwitchGamepadSet, r0_7, r0_7.SetGamepadIcons)
  r0_7:AddDispatcher(EventID.TriggerAddSpAnim, r0_7, r0_7.PlayAddSpAnim)
  r0_7:AddDispatcher(EventID.ShowSkillAnim, r0_7, r0_7.PlayGuideRemind)
  r0_7:AddDispatcher(EventID.HideSkillAnim, r0_7, r0_7.StopGuideRemind)
  r0_7:AddDispatcher(EventID.UpdateSkillEfficiency, r0_7, r0_7.OnUpdateSkillEfficiency)
  r0_7:AddDispatcher(EventID.OnBuffSpModify, r0_7, r0_7.OnUpdateBuffSpModify)
  r0_7:AddDispatcher(EventID.OnPropEffectReplaceSkill, r0_7, r0_7.OnPropEffectReplaceSkill)
  r0_7:AddDispatcher(EventID.OnPropEffectEndReplaceSkill, r0_7, r0_7.OnPropEffectEndReplaceSkill)
  r0_7:AddDispatcher(EventID.OnGamepadUseSkillForceReleased, r0_7, r0_7.OnGamepadUseSkillRelease)
  r0_7:AddDispatcher(EventID.OnEnableBattleMount, r0_7, r0_7.OnEnableBattleMount)
  r0_7:AddDispatcher(EventID.OnDisableBattleMount, r0_7, r0_7.OnDisableBattleMount)
end
function r1_0.InitVariable(r0_8, r1_8)
  -- line: [112, 212] id: 8
  r0_8.OwnerPlayer = r1_8
  local r2_8 = GWorld:GetAvatar()
  local r3_8 = ""
  local r4_8 = ""
  local r5_8 = ""
  local r6_8 = ""
  local r7_8 = ""
  local r8_8 = ""
  if r2_8 and r2_8.ActionMapping ~= nil then
    r3_8 = r2_8.ActionMapping.Skill1 and DataMgr.KeyBoardMap.Skill1.Key
    r4_8 = r2_8.ActionMapping.Skill2 and DataMgr.KeyBoardMap.Skill2.Key
    r5_8 = r2_8.ActionMapping.Skill3 and DataMgr.KeyBoardMap.Skill3.Key
    r6_8 = r2_8.ActionMapping.Fire and DataMgr.KeyBoardMap.Fire.Key
    r7_8 = r2_8.ActionMapping.Avoid and DataMgr.KeyBoardMap.Avoid.Key
    r8_8 = r2_8.ActionMapping.Slide and DataMgr.KeyBoardMap.Slide.Key
  else
    r3_8 = DataMgr.KeyBoardMap.Skill1.Key
    r4_8 = DataMgr.KeyBoardMap.Skill2.Key
    r5_8 = DataMgr.KeyBoardMap.Skill3.Key
    r6_8 = DataMgr.KeyBoardMap.Fire.Key
    r7_8 = DataMgr.KeyBoardMap.Avoid.Key
    r8_8 = DataMgr.KeyBoardMap.Slide.Key
  end
  r0_8.Battle_Skill_1.OwnerPanel = r0_8
  r0_8.Battle_Skill_1.Common_Key_PC:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = r3_8,
      }
    },
    bBattleKey = true,
  })
  r0_8.Battle_Skill_2.OwnerPanel = r0_8
  r0_8.Battle_Skill_2.Common_Key_PC:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = r4_8,
      }
    },
    bBattleKey = true,
  })
  r0_8.Common_Key_PC:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = r5_8,
      }
    },
    bBattleKey = true,
  })
  r0_8.Key_Organ:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = r6_8,
      }
    },
    bBattleKey = true,
  })
  r0_8.WBP_Key_Mounts01_PC:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = r7_8,
      }
    },
    Desc = "加速_待配表",
    bBattleKey = true,
  })
  r0_8.WBP_Key_Mounts02_PC:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = r8_8,
      }
    },
    Desc = "超加速_待配表",
    bBattleKey = true,
  })
  r0_8.Text_Organ:SetText(GText("UI_Prop_ExploreItem"))
  r0_8.PlayerSpHelpInfo.StartPos = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r0_8.Bar_Shield):GetPosition()
  r0_8.PlayerSpHelpInfo.TotalSize = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r0_8.Image_Energy_Bg):GetSize()
  r0_8.PlayerSpBarWidth = r0_8.PlayerSpHelpInfo.TotalSize.X
  r0_8.PlayerSpBarHeight = r0_8.PlayerSpHelpInfo.TotalSize.Y
  r0_8:InitDodgeButtonVariables()
  r0_8:RefreshSkillConfig()
  r0_8:UnEmptyFireSkill()
  r0_8:InitBulletUI()
  if r0_8.OwnerPlayer then
    r0_8.MaxSp = r0_8.OwnerPlayer:GetAttr("MaxSp")
  end
  r0_8:OnUpdateCharSp(nil, nil, r1_8)
  if not next(r0_8.SkillButtons) then
    r0_8:InitSkillButtons()
  end
  r0_8:InitGamepadButtons()
  r0_8:UpdateSkillPanelInfoInTimer()
  r0_8:AddTimer(0.1, r0_8.UpdateSkillPanelInfoInTimer, true, 0, "UpdateSkillPanelInfoInTimer", false)
end
function r1_0.InitSkillButtons(r0_9)
  -- line: [214, 220] id: 9
  r0_9.SkillButtons[ESkillName.Fire] = r0_9.Weapon_Panel
  r0_9.SkillButtons[ESkillName.Skill1] = r0_9.Battle_Skill_1
  r0_9.SkillButtons[ESkillName.Skill2] = r0_9.Battle_Skill_2
  r0_9.SkillButtons[ESkillName.Skill3] = r0_9.Assist_Skill
  r0_9.SkillButtons[ESkillName.Avoid] = r0_9.Dodge_Skill
end
function r1_0.InitDodgeButtonVariables(r0_10)
  -- line: [222, 232] id: 10
  r0_10:ListenForInputAction("Avoid", UE4.EInputEvent.IE_Pressed, false, {
    r0_10,
    r0_10.OnDodgeActionInput
  })
  r0_10:DodgeNormalAnim()
  r0_10.DodgeCD = r0_10.OwnerPlayer:GetAttr("AvoidChargeCd") and 0
  r0_10.DodgeChargeTimeRemain = 0
  print(_G.LogTag, "DodgeCount changed:InitDodgeButtonVariables", r0_10.DodgeCD)
  r0_10.MaxAvoidTimes = r0_10.OwnerPlayer:GetAttr("MaxAvoidExecuteTimes")
  r0_10.AvoidRemainTimes = r0_10.MaxAvoidTimes - r0_10.OwnerPlayer.DodgeCount
  r0_10.Charge_Num:SetText(r0_10.AvoidRemainTimes)
end
function r1_0.InitBulletUI(r0_11)
  -- line: [234, 237] id: 11
  r0_11.Bullet_Num_Zero:SetText(0)
  r0_11.Bullet_Num_Bow_Zero:SetText(0)
end
function r1_0.InitGamepadButtons(r0_12)
  -- line: [239, 249] id: 12
  r0_12.GameInputModeSubsystem.OnInputMethodChanged:Add(r0_12, r0_12.RefreshOpInfoByInputDevice)
  r0_12:ListenForInputAction("GamepadUseSkill", UE4.EInputEvent.IE_Pressed, false, {
    r0_12,
    r0_12.OnGamepadUseSkillPressed
  })
  r0_12:ListenForInputAction("GamepadUseSkill", UE4.EInputEvent.IE_Released, false, {
    r0_12,
    r0_12.OnGamepadUseSkillRelease
  })
  r0_12:SetGamepadIcons()
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    r0_12:InitGamepadView()
  else
    r0_12:InitKeyboardView()
  end
end
function r1_0.SetGamepadIcons(r0_13)
  -- line: [251, 284] id: 13
  local r1_13 = UIUtils.GetIconListByActionName("Fire")[1]
  local r2_13 = UIUtils.GetIconListByActionName("Avoid")[1]
  local r3_13 = UIUtils.GetIconListByActionName("GamepadUseSkill")[1]
  local r4_13 = UIUtils.GetIconListByActionName("Skill3")[2]
  local r5_13 = UIUtils.GetIconListByActionName("Avoid")[1]
  local r6_13 = UIUtils.GetIconListByActionName("Slide")[1]
  r0_13.Key_Weapon:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = r1_13,
      }
    },
  })
  r0_13.Key_Organ02:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = r1_13,
      }
    },
  })
  r0_13.Key_Dodge:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = r2_13,
      }
    },
  })
  r0_13.Key_Skill:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = r3_13,
      }
    },
  })
  r0_13.Key_Assist_GamePad:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = r4_13,
      }
    },
  })
  r0_13.WBP_Key_Mounts01_Gamepad:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = r5_13,
      }
    },
    Desc = "加速_待配表",
  })
  r0_13.WBP_Key_Mounts02_Gamepad:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = r6_13,
      }
    },
    Desc = "超加速_待配表",
  })
  r0_13.Battle_Skill_1:SetGamepadIcons()
  r0_13.Battle_Skill_2:SetGamepadIcons()
end
function r1_0.RefreshOpInfoByInputDevice(r0_14, r1_14, r2_14)
  -- line: [287, 293] id: 14
  if r1_14 == ECommonInputType.Gamepad then
    r0_14:InitGamepadView()
  else
    r0_14:InitKeyboardView()
  end
end
function r1_0.InitGamepadView(r0_15)
  -- line: [295, 305] id: 15
  r0_15.Key_Weapon:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  r0_15.Key_Dodge:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  r0_15.Key_Skill:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  r0_15.WidgetSwitcher_Key:SetActiveWidgetIndex(1)
  r0_15.WidgetSwitcher_Organ:SetActiveWidgetIndex(1)
  r0_15.Switcher_Mount:SetActiveWidgetIndex(1)
  r0_15.Battle_Skill_1.WidgetSwitcher_0:SetActiveWidgetIndex(1)
  r0_15.Battle_Skill_2.WidgetSwitcher_0:SetActiveWidgetIndex(1)
end
function r1_0.InitKeyboardView(r0_16)
  -- line: [307, 316] id: 16
  r0_16.Key_Weapon:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_16.Key_Dodge:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_16.Key_Skill:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_16.WidgetSwitcher_Key:SetActiveWidgetIndex(0)
  r0_16.WidgetSwitcher_Organ:SetActiveWidgetIndex(0)
  r0_16.Switcher_Mount:SetActiveWidgetIndex(0)
  r0_16.Battle_Skill_1.WidgetSwitcher_0:SetActiveWidgetIndex(0)
  r0_16.Battle_Skill_2.WidgetSwitcher_0:SetActiveWidgetIndex(0)
end
function r1_0.OnGamepadUseSkillPressed(r0_17)
  -- line: [318, 325] id: 17
  if EMUIAnimationSubsystem:EMAnimationIsPlaying(r0_17, r0_17.GamePad_LB_Out) then
    EMUIAnimationSubsystem:EMStopAnimation(r0_17, r0_17.GamePad_LB_Out)
  end
  EMUIAnimationSubsystem:EMPlayAnimation(r0_17, r0_17.GamePad_LB_In)
  EMUIAnimationSubsystem:EMPlayAnimation(r0_17.Battle_Skill_1, r0_17.Battle_Skill_1.GamePad_LB_In)
  EMUIAnimationSubsystem:EMPlayAnimation(r0_17.Battle_Skill_2, r0_17.Battle_Skill_2.GamePad_LB_In)
end
function r1_0.OnGamepadUseSkillRelease(r0_18)
  -- line: [327, 334] id: 18
  if EMUIAnimationSubsystem:EMAnimationIsPlaying(r0_18, r0_18.GamePad_LB_In) then
    EMUIAnimationSubsystem:EMStopAnimation(r0_18, r0_18.GamePad_LB_In)
  end
  EMUIAnimationSubsystem:EMPlayAnimation(r0_18, r0_18.GamePad_LB_Out)
  EMUIAnimationSubsystem:EMPlayAnimation(r0_18.Battle_Skill_1, r0_18.Battle_Skill_1.GamePad_LB_Out)
  EMUIAnimationSubsystem:EMPlayAnimation(r0_18.Battle_Skill_2, r0_18.Battle_Skill_2.GamePad_LB_Out)
end
function r1_0.OnBattlePetInitReady(r0_19)
  -- line: [337, 350] id: 19
  local r1_19 = r0_19.OwnerPlayer:GetBattlePet()
  if not r1_19 or r1_19.BattlePetId == 0 then
    r0_19:EmptySkill3()
    DebugPrint("BattlePet为空!!!")
    return 
  end
  r0_19:RefreshSupportSkillIcon()
  if not r0_19.OwnerPlayer:CheckSkillInActive(ESkillName.Skill3) then
    r0_19:UnEmptySkill3()
  end
end
function r1_0.RefreshSupportSkillIcon(r0_20)
  -- line: [352, 381] id: 20
  local r1_20 = r0_20.OwnerPlayer:GetBattlePet()
  if not r1_20 or r1_20.BattlePetId == 0 then
    r0_20:EmptySkill3()
    DebugPrint("BattlePet为空!!!")
    return 
  end
  local r2_20 = DataMgr.BattlePet[r1_20.BattlePetId].SupportSkillId
  r0_20.SupportSkillId = r2_20
  if not r2_20 then
    DebugPrint("SupportSKillId为空", r2_20)
    return 
  end
  local r3_20 = DataMgr.Skill[r2_20][1][0]
  local r4_20 = nil
  if r3_20.SkillBtnIcon then
    local r5_20 = "Texture2D\'/Game/UI/Texture/Dynamic/Atlas/Skill/T_" .. r3_20.SkillBtnIcon
    r0_20.LoadingIconMap[r3_20.SkillBtnIcon] = r0_0.SupportSkill
    r0_20.SupportPath = r5_20
    if r0_20.OwnerPlayer.ActivePropEffectId == -1 then
      UE.UResourceLibrary.LoadObjectAsync(r0_20, r5_20, {
        r0_20,
        r1_0.OnIconLoadFinish
      })
    end
  end
  if r3_20.SkillBtnDesc ~= nil then
    r0_20.Assist_Skill_Text:SetText(GText(r3_20.SkillBtnDesc))
  end
  r0_20:ListenForInputAction("Skill3", UE4.EInputEvent.IE_Released, false, {
    r0_20,
    r0_20.OnSupportSkillActionInput
  })
end
function r1_0.GetSkillActiveInfo(r0_21)
  -- line: [383, 400] id: 21
  local r1_21 = nil
  if r0_21.OwnerPlayer and r0_21.OwnerPlayer.GetController then
    r1_21 = r0_21.OwnerPlayer:GetController()
  end
  if r1_21 then
    local r2_21 = r1_21.CurrentInActiveSkills:Length()
    local r3_21 = r0_21.SkillButtons
    for r7_21 = 1, r2_21, 1 do
      r0_21:ChangeSkillButtonState(r1_21.CurrentInActiveSkills[r7_21], "Lock")
      r3_21[r1_21.CurrentInActiveSkills[r7_21]] = nil
    end
    for r8_21, r9_21 in pairs(r3_21) do
      r0_21:ChangeSkillButtonState(r8_21, "UnLock")
    end
    -- close: r4_21
  end
end
function r1_0.ChangeSkillButtonState(r0_22, r1_22, r2_22)
  -- line: [402, 484] id: 22
  if not r0_22.SkillButtons then
    print(_G.LogTag, "can not get skill buttons array")
    return 
  end
  if not next(r0_22.SkillButtons) then
    r0_22:InitSkillButtons()
  end
  if not r0_22.SkillButtons[r1_22] then
    print(_G.LogTag, "widget dont have this button")
    return 
  end
  if type(r0_22.SkillButtons[r1_22].SetButtonStyleByState) == "function" then
    r0_22.SkillButtons[r1_22]:SetButtonStyleByState(r1_22, r2_22)
  elseif r1_22 == ESkillName.Skill3 then
    if r2_22 == "Empty" then
      r0_22.SupportSkillState = "Lock"
      r0_22:EmptySkill3()
    elseif r2_22 == "UnEmpty" then
      r0_22.SupportSkillState = "UnLock"
      r0_22:UnEmptySkill3()
    end
    if r0_22.bSupportSkillUnlock == false then
      return 
    end
    if r2_22 == "Lock" then
      r0_22.SupportSkillState = "Lock"
      if not r0_22:IsAnimationPlaying(r0_22.Lock_In) then
        r0_22:PlayAnimationForward(r0_22.Lock_In)
      end
    elseif r2_22 == "Ban" and r0_22.bSupportSkillUnlock == true then
      r0_22.SupportSkillState = "Lock"
      EMUIAnimationSubsystem:EMPlayAnimation(r0_22, r0_22.Assist_Ban)
    elseif r2_22 == "UnBan" and r0_22.bSupportSkillUnlock == true then
      r0_22.SupportSkillState = "UnLock"
      EMUIAnimationSubsystem:EMPlayAnimation(r0_22, r0_22.Assist_Normal)
    elseif r2_22 == "UnLock" and r0_22.bSupportSkillUnlock == true then
      r0_22.SupportSkillState = "UnLock"
      if not r0_22:IsAnimationPlaying(r0_22.UnLock) then
        r0_22:PlayAnimationForward(r0_22.UnLock)
      end
    elseif r2_22 == "Hooking" or r2_22 == "RegionBan" then
      r0_22.SupportSkillState = "TempBan"
      r0_22.Assist_Skill:SetRenderOpacity(0.6)
    elseif r2_22 == "EndHooking" or r2_22 == "RegionUnBan" then
      r0_22.SupportSkillState = "UnLock"
      r0_22.Assist_Skill:SetRenderOpacity(1)
    end
  elseif r2_22 == "Lock" then
    r0_22.SkillButtons[r1_22]:SetVisibility(UE4.ESlateVisibility.Collapsed)
  elseif r2_22 == "UnLock" then
    r0_22.SkillButtons[r1_22]:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  elseif r2_22 == "Ban" then
    if r1_22 == ESkillName.Avoid then
      EMUIAnimationSubsystem:EMPlayAnimation(r0_22, r0_22.Dodge_Ban)
    elseif r1_22 == ESkillName.Fire then
      r0_22:PlayAnimationForward(r0_22.Weapon_Ban)
    end
  elseif r2_22 == "UnBan" then
    if r1_22 == ESkillName.Avoid then
      r0_22:DodgeNormalAnim()
    elseif r1_22 == ESkillName.Fire then
      EMUIAnimationSubsystem:EMPlayAnimation(r0_22, r0_22.Weapon_Normal)
    end
  elseif r2_22 == "Empty" and r1_22 == ESkillName.Fire then
    r0_22:EmptyFireSkill()
  elseif r2_22 == "UnEmpty" and r1_22 == ESkillName.Fire then
    r0_22:UnEmptyFireSkill()
  elseif (r2_22 == "Hooking" or r2_22 == "RegionBan") and r0_22.SkillButtons[r1_22] then
    r0_22.SkillButtons[r1_22]:SetRenderOpacity(0.6)
  elseif (r2_22 == "EndHooking" or r2_22 == "RegionUnBan") and r0_22.SkillButtons[r1_22] then
    r0_22.SkillButtons[r1_22]:SetRenderOpacity(1)
  end
end
function r1_0.ChangeState(r0_23, r1_23)
  -- line: [486, 492] id: 23
  if r0_23.CurState ~= r1_23 then
    r0_23.CurState = r1_23
    r0_23:RefreshUIStyleByState(false)
  end
end
function r1_0.EmptySkill3(r0_24)
  -- line: [494, 497] id: 24
  r0_24.Switcher_Skill03:SetActiveWidgetIndex(1)
  r0_24.Image_2:SetBrushTintColor(UE4.UUIFunctionLibrary.GetSlateColorByRGBA(0, 0, 0, 0.2))
end
function r1_0.UnEmptySkill3(r0_25)
  -- line: [499, 503] id: 25
  r0_25.Assist_Skill:SetRenderOpacity(1)
  r0_25.Switcher_Skill03:SetActiveWidgetIndex(0)
  r0_25.Image_2:SetBrushTintColor(UE4.UUIFunctionLibrary.GetSlateColorByRGBA(0, 0, 0, 0.55))
end
function r1_0.EmptyFireSkill(r0_26)
  -- line: [505, 508] id: 26
  r0_26.Switcher_Weapon_Skill:SetActiveWidgetIndex(1)
  r0_26.Bg01:SetBrushTintColor(UE4.UUIFunctionLibrary.GetSlateColorByRGBA(0, 0, 0, 0.2))
end
function r1_0.UnEmptyFireSkill(r0_27)
  -- line: [510, 513] id: 27
  r0_27.Switcher_Weapon_Skill:SetActiveWidgetIndex(0)
  r0_27.Bg01:SetBrushTintColor(UE4.UUIFunctionLibrary.GetSlateColorByRGBA(0, 0, 0, 0.55))
end
function r1_0.RefreshSkillConfig(r0_28)
  -- line: [515, 533] id: 28
  r0_28:ListenForInputAction("Fire", UE4.EInputEvent.IE_Pressed, false, {
    r0_28,
    r0_28.OnFireActionInputPressed
  })
  if IsValid(r0_28.OwnerPlayer.RangedWeapon) then
    r0_28:RefreshWeaponIcon()
  end
  r0_28.PlayerMainRoleId = r0_28:GetPlayerRoleId()
  r0_28:RefreshUIStyleByState(true)
  if not IsValid(r0_28.OwnerPlayer) then
    r0_28.OwnerPlayer = UE4.UGameplayStatics.GetPlayerCharacter(r0_28, 0)
  end
  if r0_28.OwnerPlayer.SkillsComponent and r0_28.OwnerPlayer.SkillsComponent.SkillInfos and r0_28.OwnerPlayer.SkillsComponent.SkillInfos:Num() > 0 then
    r0_28:RefreshRoleSkillButton()
  else
    r0_28:AddTimer(0.1, r0_28.RefreshRoleSkillButton, true, 0, "RefreshRoleSkillButtonTimer", true)
  end
end
function r1_0.RefreshWeaponIcon(r0_29)
  -- line: [535, 602] id: 29
  local r1_29 = nil
  local r2_29 = nil
  if r0_29.OwnerPlayer.BuffManager.UseSummonWeapon ~= -1 then
    if CommonUtils.HasValue(DataMgr.BattleWeapon[r0_29.OwnerPlayer.UltraWeapon.WeaponId].WeaponTag, "Ranged") then
      r1_29 = r0_29.OwnerPlayer.UltraWeapon
    else
      r1_29 = r0_29.OwnerPlayer.RangedWeapon
    end
  else
    r1_29 = r0_29.OwnerPlayer.RangedWeapon
  end
  if not IsValid(r1_29) then
    return 
  end
  r0_29.RangedWeapon = r1_29
  r0_29.WeaponId = r1_29.WeaponId
  r0_29.MagazineUIType = DataMgr.BattleWeapon[r0_29.WeaponId].MagazineUIType
  if r0_29.MagazineUIType == "NoMagazine" then
    r0_29.Bullet_Bow:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_29.Group_AmmunitionNum:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    r0_29.Bullet_Bow:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_29.Group_AmmunitionNum:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  r0_29.IsRefreshWeapon = true
  local r3_29 = DataMgr.BattleWeapon[r0_29.WeaponId].BulletIcon
  local r4_29 = nil
  local r5_29 = nil
  if r3_29 then
    r5_29 = "/Game/UI/Texture/Dynamic/Atlas/Battle/T_" .. r3_29
    r0_29.LoadingIconMap[r3_29] = r0_0.BulletIcon
  else
    r5_29 = "/Game/UI/Texture/Dynamic/Atlas/Battle/T_Battle_Bullet"
    r0_29.LoadingIconMap.T_Battle_Bullet = r0_0.BulletIcon
  end
  UE.UResourceLibrary.LoadObjectAsync(r0_29, r5_29, {
    r0_29,
    r1_0.OnIconLoadFinish
  })
  r0_29:UpdatePlayerWeaponInfo()
  local r6_29 = DataMgr.BattleWeapon[r0_29.WeaponId]
  local r7_29 = nil
  if r6_29 ~= nil and r6_29.WeaponHUDIcon ~= nil then
    r7_29 = "/Game/UI/Texture/Dynamic/Atlas/Battle/Weapon/T_" .. r6_29.WeaponHUDIcon
    r0_29.LoadingIconMap[r6_29.WeaponHUDIcon] = r0_0.WeaponIcon
  else
    r7_29 = "/Game/UI/Texture/Dynamic/Atlas/Battle/Weapon/T_Crossbow_Chixing.T_Crossbow_Chixing"
    r0_29.LoadingIconMap.Skill_Crossbow_Chixing = r0_0.WeaponIcon
  end
  r0_29.LoadWeaponIconID = nil
  local r8_29 = UE.UResourceLibrary.LoadObjectAsyncWithId(r0_29, r7_29, {
    r0_29,
    r1_0.OnIconLoadFinishWithId
  })
  if r8_29 then
    r0_29.LoadWeaponIconID = r8_29.ResourceID
  end
  if not r0_29:IsWeaponBulletNotEnough(r1_29) then
    r0_29.Weapon_Icon:SetRenderOpacity(1)
  else
    r0_29.Weapon_Icon:SetRenderOpacity(0.5)
  end
end
function r1_0.RefreshRoleSkillButton(r0_30)
  -- line: [604, 624] id: 30
  if not IsValid(r0_30.OwnerPlayer) then
    r0_30.OwnerPlayer = UE4.UGameplayStatics.GetPlayerCharacter(r0_30, 0)
  end
  if r0_30.OwnerPlayer.SkillsComponent and r0_30.OwnerPlayer.SkillsComponent.SkillInfos and r0_30.OwnerPlayer.SkillsComponent.SkillInfos:Num() > 0 then
    if r0_30:IsExistTimer("RefreshRoleSkillButtonTimer") then
      r0_30:RemoveTimer("RefreshRoleSkillButtonTimer")
    end
  else
    return 
  end
  local r1_30 = r0_30.OwnerPlayer:GetSkillByType(UE.ESkillType.Skill1)
  DebugPrint("gmy@WBP_Player_SkillPanel_PC_C WBP_Player_SkillPanel_PC_C:RefreshRoleSkillButton", UE.ESkillType.Skill1, r1_30)
  r0_30.Battle_Skill_1:RefreshButtonStyle("Skill1", r0_30.OwnerPlayer:GetSkill(r1_30), ESkillName.Skill1, r0_30.OwnerPlayer)
  r0_30.Battle_Skill_2:RefreshButtonStyle("Skill2", r0_30.OwnerPlayer:GetSkill(r0_30.OwnerPlayer:GetSkillByType(UE.ESkillType.Skill2)), ESkillName.Skill2, r0_30.OwnerPlayer)
end
function r1_0.RefreshRoleTargetSkill(r0_31, r1_31, r2_31)
  -- line: [626, 636] id: 31
  if r1_31 == "Skill1" then
    r0_31.Battle_Skill_1:RefreshButtonStyle("Skill1", r0_31.OwnerPlayer:GetSkill(r0_31.OwnerPlayer:GetSkillByType(UE.ESkillType.Skill1)), ESkillName.Skill1, r0_31.OwnerPlayer)
  elseif r1_31 == "Skill2" then
    r0_31.Battle_Skill_2:RefreshButtonStyle("Skill2", r0_31.OwnerPlayer:GetSkill(r0_31.OwnerPlayer:GetSkillByType(UE.ESkillType.Skill2)), ESkillName.Skill2, r0_31.OwnerPlayer)
  end
end
function r1_0.RefreshKeyName(r0_32)
  -- line: [638, 645] id: 32
  local r1_32 = CommonUtils:GetActionMappingKeyName("Skill1")
  local r2_32 = CommonUtils:GetActionMappingKeyName("Skill2")
  local r3_32 = CommonUtils:GetActionMappingKeyName("Skill3")
  r0_32.Battle_Skill_1.Common_Key_PC:SetImage("Text", r1_32)
  r0_32.Battle_Skill_2.Common_Key_PC:SetImage("Text", r2_32)
  r0_32.Common_Key_PC:SetImage("Text", r3_32)
end
function r1_0.RefreshUIStyleByState(r0_33, r1_33)
  -- line: [648, 656] id: 33
  if r1_33 then
    r0_33.CurState = "Battle"
  end
  if r0_33.CurState ~= "Battle" and r0_33.CurState ~= "Normal" then
    r0_33.Assist_Skill:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
function r1_0.GetOwnerPlayer(r0_34)
  -- line: [658, 663] id: 34
  if not IsValid(r0_34.OwnerPlayer) then
    r0_34.OwnerPlayer = UE4.UGameplayStatics.GetPlayerCharacter(r0_34, 0)
  end
  return r0_34.OwnerPlayer
end
function r1_0.UpdateSkillPanelInfoInTimer(r0_35)
  -- line: [666, 681] id: 35
  if not IsValid(r0_35.OwnerPlayer) then
    r0_35.OwnerPlayer = UE4.UGameplayStatics.GetPlayerCharacter(r0_35, 0)
  end
  if not r0_35.OwnerPlayer then
    return 
  end
  if not r0_35.OwnerPlayer.IsUpdatedUIInThisTick then
    r0_35:UpdatePlayerExclusiveSkill()
    r0_35:UpdatePlayerSupportSkill()
    r0_35:UpdatePlayerDodgeSkill()
    r0_35.IsCharacterInFalling = r0_35.OwnerPlayer:CharacterInTag("Falling")
    r0_35.OwnerPlayer.IsUpdatedUIInThisTick = true
  end
end
function r1_0.UpdatePlayerWeaponInfo(r0_36)
  -- line: [683, 685] id: 36
  r0_36:UpdateBulletInfo(r0_36.RangedWeapon)
end
function r1_0.UpdateBulletInfo(r0_37, r1_37)
  -- line: [687, 762] id: 37
  local r2_37 = r1_37:GetAttr("MagazineBulletNum")
  local r3_37 = r1_37:GetAttr("BulletNum")
  local r4_37 = r2_37 + r3_37
  if r2_37 == -1 then
    r2_37 = r0_37.InfinitySymbol
  end
  if r3_37 == -1 then
    r3_37 = r0_37.InfinitySymbol
  end
  if r4_37 == -2 then
    r4_37 = r0_37.InfinitySymbol
  end
  if r0_37.MagazineUIType == "NoMagazine" then
    r0_37.Bullet_Num_Bow:SetText(tostring(r4_37))
    if type(r4_37) == "number" and r4_37 <= 0 then
      if r0_37.IsRefreshWeapon or not r0_37.IsLackMagazine then
        r0_37.Bullet_Num_Bow:SetVisibility(UE4.ESlateVisibility.Collapsed)
        r0_37.Bullet_Num_Bow_Zero:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
        r0_37.IsLackMagazine = true
        r0_37.IsRefreshWeapon = false
      end
      if not r0_37.IsLackBullets then
        r0_37.Weapon_Icon:SetRenderOpacity(0.5)
        EMUIAnimationSubsystem:EMPlayAnimation(r0_37, r0_37.Bullets_Lack)
        r0_37.IsLackBullets = true
      end
    else
      if r0_37.IsRefreshWeapon or r0_37.IsLackMagazine then
        r0_37.Bullet_Num_Bow:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
        r0_37.Bullet_Num_Bow_Zero:SetVisibility(UE4.ESlateVisibility.Collapsed)
        r0_37.IsLackMagazine = false
        r0_37.IsRefreshWeapon = false
      end
      if r0_37.IsLackBullets then
        r0_37.Weapon_Icon:SetRenderOpacity(1)
        EMUIAnimationSubsystem:EMPlayAnimation(r0_37, r0_37.Bullets_Lack, 1)
        r0_37.IsLackBullets = false
      end
    end
  else
    r0_37.Bullet_Num:SetText(tostring(r2_37))
    r0_37.Clipsize:SetText(tostring(r3_37))
    if type(r2_37) == "number" and r2_37 <= 0 and (r0_37.IsRefreshWeapon or not r0_37.IsLackMagazine) then
      r0_37.Bullet_Num:SetVisibility(UE4.ESlateVisibility.Collapsed)
      r0_37.Bullet_Num_Zero:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      r0_37.IsLackMagazine = true
      r0_37.IsRefreshWeapon = false
    elseif r0_37.IsRefreshWeapon or r0_37.IsLackMagazine then
      r0_37.Bullet_Num:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      r0_37.Bullet_Num_Zero:SetVisibility(UE4.ESlateVisibility.Collapsed)
      r0_37.IsRefreshWeapon = false
      r0_37.IsLackMagazine = false
    end
    if type(r2_37) == "number" and type(r3_37) == "number" and r2_37 <= 0 and r3_37 <= 0 and not r0_37.IsLackBullets then
      r0_37.Weapon_Icon:SetRenderOpacity(0.5)
      EMUIAnimationSubsystem:EMPlayAnimation(r0_37, r0_37.Bullets_Lack)
      r0_37.IsLackBullets = true
    elseif r0_37.IsLackBullets then
      r0_37.Weapon_Icon:SetRenderOpacity(1)
      EMUIAnimationSubsystem:EMPlayAnimation(r0_37, r0_37.Bullets_Lack, 1)
      r0_37.IsLackBullets = false
    end
  end
end
function r1_0.UpdatePlayerExclusiveSkill(r0_38)
  -- line: [764, 770] id: 38
  r0_38.Battle_Skill_1:RefreshSkillStyleInTimer("Skill1")
  r0_38.Battle_Skill_2:RefreshSkillStyleInTimer("Skill2")
end
function r1_0.UpdatePlayerSupportSkill(r0_39)
  -- line: [772, 795] id: 39
  if not IsValid(r0_39.OwnerPlayer) or r0_39.SupportSkillState == "Lock" or r0_39.bSupportSkillUnlock == false then
    return 
  end
  if r0_39.OwnerPlayer.ActivePropEffectId ~= -1 then
    return 
  end
  local r1_39, r2_39 = r0_39.OwnerPlayer:GetSkillCdTimeAndPercent(r0_39.SupportSkillId)
  if r1_39 > 0 then
    r0_39.SupportSkillState = "InCDTime"
    r0_39.Assist_Text_CD:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_39.Assist_Text_CD:SetText(r0_39:GetPreciseDecimal(r1_39, 1))
    r0_39.Assist_Bar_Skill_CD:SetPercent(1 - r2_39)
  elseif r0_39.SupportSkillState == "InCDTime" then
    r0_39.SupportSkillState = "UnLock"
  end
  if r0_39.SupportSkillState == "TempBan" then
    return 
  end
  r0_39:HandleSupportButtonState()
end
function r1_0.HandleSupportButtonState(r0_40)
  -- line: [797, 815] id: 40
  if r0_40.LastSupportSkillState ~= r0_40.SupportSkillState then
    if r0_40.SupportSkillState == "InCDTime" then
      r0_40.Assist_Skill_Icon:SetRenderOpacity(0.5)
      r0_40.Assist_Text_CD:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    else
      if r0_40.SupportSkillState == "UnLock" and not EMUIAnimationSubsystem:EMAnimationIsPlaying(r0_40, r0_40.Skill_Complete) then
        EMUIAnimationSubsystem:EMPlayAnimation(r0_40, r0_40.Skill_Complete)
      end
      r0_40.Assist_Skill_Icon:SetRenderOpacity(1)
      r0_40.Assist_Bar_Skill_CD:SetPercent(0)
      r0_40.Assist_Text_CD:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
  r0_40.LastSupportSkillState = r0_40.SupportSkillState
end
function r1_0.UpdatePlayerDodgeSkill(r0_41)
  -- line: [817, 849] id: 41
  if r0_41.Dodge_Skill:GetVisibility() == ESlateVisibility.Collapsed or not IsValid(r0_41.OwnerPlayer) then
    return 
  end
  r0_41.MaxAvoidTimes = r0_41.OwnerPlayer:GetAttr("MaxAvoidExecuteTimes")
  r0_41.DodgeCD = r0_41.OwnerPlayer:GetAttr("AvoidChargeCd") and 0
  local r2_41 = math.max(0, r0_41.MaxAvoidTimes - r0_41.OwnerPlayer.DodgeCount)
  local r3_41 = UE4.UGameplayStatics.GetTimeSeconds(r0_41)
  if r2_41 ~= r0_41.MaxAvoidTimes then
    r0_41.DodgeChargeTimeRemain = r0_41.OwnerPlayer:GetDodgeChargeRemainTime()
    r0_41.Dodge_Bar_Skill_CD:SetPercent(r0_41.DodgeChargeTimeRemain / r0_41.DodgeCD)
  else
    r0_41.DodgeChargeTimeRemain = 0
    r0_41.Dodge_Bar_Skill_CD:SetPercent(0)
  end
  if r0_41.AvoidRemainTimes ~= r2_41 then
    print(_G.LogTag, "DodgeCount changed, AvoidRemainTimes:", r2_41, r3_41, r0_41.DodgeChargeTimeRemain)
    r0_41.Charge_Num:SetText(r2_41)
    if r2_41 == 0 then
      r0_41:DodgeForbidAnim()
    else
      r0_41:DodgeNormalAnim()
    end
  end
  if r0_41.AvoidRemainTimes < r2_41 then
    r0_41:PlayAnimation(r0_41.Dodge_Complete)
  end
  r0_41.AvoidRemainTimes = r2_41
end
function r1_0.OnSupportSkillActionInput(r0_42)
  -- line: [851, 866] id: 42
  if r0_42.SupportSkillState == "Lock" then
    return 
  end
  if r0_42.SupportSkillState == "InCDTime" and not EMUIAnimationSubsystem:EMAnimationIsPlaying(r0_42, r0_42.Skills_Disable) then
    EMUIAnimationSubsystem:EMPlayAnimation(r0_42, r0_42.Skills_Disable)
  elseif r0_42.SupportSkillState == "UnLock" and not EMUIAnimationSubsystem:EMAnimationIsPlaying(r0_42, r0_42.Click) then
    EMUIAnimationSubsystem:EMPlayAnimation(r0_42, r0_42.Click)
  end
end
function r1_0.OnDodgeActionInput(r0_43)
  -- line: [868, 878] id: 43
  if r0_43.AvoidRemainTimes > 0 and not EMUIAnimationSubsystem:EMAnimationIsPlaying(r0_43, r0_43.Dodge_Click) then
    EMUIAnimationSubsystem:EMPlayAnimation(r0_43, r0_43.Dodge_Click)
  elseif not EMUIAnimationSubsystem:EMAnimationIsPlaying(r0_43, r0_43.Dodge_Disable) then
    EMUIAnimationSubsystem:EMPlayAnimation(r0_43, r0_43.Dodge_Disable)
  end
end
function r1_0.OnUpdateMaxSp(r0_44, r1_44)
  -- line: [880, 889] id: 44
  if not r1_44 then
    return 
  end
  DebugPrint("@zyh 最新MaxSp更新为", r1_44)
  r0_44.MaxSp = r1_44
  r0_44.MyFVector2D.X = r0_44.PlayerSpBarWidth * math.min(math.max(r0_44.NowSp / r0_44.MaxSp, 0), 1)
  r0_44.MyFVector2D.Y = r0_44.PlayerSpBarHeight
  UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r0_44.Bar_Shield):SetSize(r0_44.MyFVector2D)
end
function r1_0.OnUpdateCharSp(r0_45, r1_45, r2_45, r3_45)
  -- line: [891, 940] id: 45
  if not IsValid(r0_45.OwnerPlayer) then
    return 
  end
  if not r3_45 or r3_45 ~= r0_45.OwnerPlayer then
    return 
  end
  local r4_45 = nil
  if not r0_45.MaxSp then
    r0_45.MaxSp = r0_45.OwnerPlayer:GetAttr("MaxSp")
  end
  if not r1_45 then
    r1_45 = r0_45.OwnerPlayer:GetAttr("Sp")
  else
    r4_45 = r1_45 - r2_45
  end
  r0_45.NowSp = r1_45
  r0_45.Battle_Skill_1:UpdateCharSpInfo("Skill1", r1_45)
  r0_45.Battle_Skill_2:UpdateCharSpInfo("Skill2", r1_45)
  r0_45.Energy_Num:SetText(math.floor(r1_45))
  local r5_45 = math.min(math.max(r1_45 / r0_45.MaxSp, 0), 1)
  r0_45.MyFVector2D.X = r0_45.PlayerSpBarWidth * r5_45
  r0_45.MyFVector2D.Y = r0_45.PlayerSpBarHeight
  UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r0_45.Bar_Shield):SetSize(r0_45.MyFVector2D)
  if r4_45 ~= nil and r4_45 ~= 0 then
    local r7_45 = math.min(r4_45 / r0_45.MaxSp, 1)
    r0_45.MyFVector2D.X = r7_45
    r0_45.MyFVector2D.Y = 1
    r0_45.Panel_Deduct:SetRenderScale(r0_45.MyFVector2D)
    r0_45.MyFVector2D.X = r0_45.PlayerSpBarWidth * (r5_45 - r7_45)
    r0_45.MyFVector2D.Y = 0
    r0_45.Panel_Deduct:SetRenderTranslation(r0_45.MyFVector2D)
    if r7_45 < 0 then
      r0_45.Deduct:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToLinearColor("FF46467F"))
    else
      r0_45.Deduct:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToLinearColor("FFE08066"))
    end
    if not EMUIAnimationSubsystem:EMAnimationIsPlaying(r0_45, r0_45.Deduct_MP) then
      EMUIAnimationSubsystem:EMPlayAnimation(r0_45, r0_45.Deduct_MP)
    end
    r0_45.Deduct:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end
function r1_0.OnUpdateSkillEfficiency(r0_46, r1_46)
  -- line: [942, 954] id: 46
  if not IsValid(r0_46.OwnerPlayer) then
    return 
  end
  if not r1_46 or r1_46 ~= r0_46.OwnerPlayer then
    return 
  end
  DebugPrint("@zyh 刷新技能的显示蓝耗")
  local r2_46 = r0_46.OwnerPlayer:GetAttr("Sp")
  r0_46.Battle_Skill_1:UpdateSkillEfficiency("Skill1", r2_46)
  r0_46.Battle_Skill_2:UpdateSkillEfficiency("Skill2", r2_46)
end
function r1_0.OnUpdateBuffSpModify(r0_47)
  -- line: [956, 964] id: 47
  if not IsValid(r0_47.OwnerPlayer) then
    return 
  end
  local r1_47 = r0_47.OwnerPlayer:GetAttr("Sp")
  r0_47.Battle_Skill_1:UpdateBuffSpModify("Skill1", r1_47)
  r0_47.Battle_Skill_2:UpdateBuffSpModify("Skill2", r1_47)
end
function r1_0.PlayAddSpAnim(r0_48, r1_48)
  -- line: [966, 975] id: 48
  if Battle(r0_48):GetEntity(r1_48) ~= r0_48.OwnerPlayer then
    return 
  end
  if EMUIAnimationSubsystem:EMAnimationIsPlaying(r0_48, r0_48.Energy_Return) then
    return 
  end
  EMUIAnimationSubsystem:EMPlayAnimation(r0_48, r0_48.Energy_Return)
end
function r1_0.OnWeaponBulletNotEnough(r0_49)
  -- line: [977, 1008] id: 49
  local r1_49 = nil
  if r0_49.OwnerPlayer.BuffManager.UseSummonWeapon ~= -1 then
    if CommonUtils.HasValue(DataMgr.BattleWeapon[r0_49.OwnerPlayer.UltraWeapon.WeaponId].WeaponTag, "Ranged") then
      r1_49 = r0_49.OwnerPlayer.UltraWeapon
    else
      r1_49 = r0_49.OwnerPlayer.RangedWeapon
    end
  else
    r1_49 = r0_49.OwnerPlayer.RangedWeapon
  end
  if not IsValid(r1_49) then
    return 
  end
  local r2_49 = r1_49:GetAttr("MagazineBulletNum")
  local r3_49 = r1_49:GetAttr("BulletNum")
  r0_49.Bullet_Num:SetText(tostring(r2_49))
  r0_49.Clipsize:SetText(tostring(r3_49))
  if not EMUIAnimationSubsystem:EMAnimationIsPlaying(r0_49, r0_49.No_BulletsBackup) then
    EMUIAnimationSubsystem:EMPlayAnimation(r0_49, r0_49.No_BulletsBackup)
  end
  if r0_49:IsWeaponBulletNotEnough(r1_49) then
    if r0_49.Bullet_Num_Zero:IsVisible() and not EMUIAnimationSubsystem:EMAnimationIsPlaying(r0_49, r0_49.No_Bullets) then
      EMUIAnimationSubsystem:EMPlayAnimation(r0_49, r0_49.No_Bullets)
    end
    r0_49.Weapon_Icon:SetRenderOpacity(0.5)
  end
end
function r1_0.OnChargeWeaponBullet(r0_50)
  -- line: [1010, 1012] id: 50
  r0_50:UpdatePlayerWeaponInfo()
end
function r1_0.IsWeaponBulletNotEnough(r0_51, r1_51)
  -- line: [1014, 1035] id: 51
  local r2_51 = nil
  if IsValid(r0_51.OwnerPlayer) then
    r2_51 = r0_51.OwnerPlayer:GetSkill(r0_51.OwnerPlayer:GetSkillByType(UE.ESkillType.Shooting))
  end
  if not r1_51 then
    r1_51 = r0_51.OwnerPlayer.RangedWeapon
  end
  if IsValid(r1_51) then
    if r2_51 ~= nil then
      local r4_51 = DataMgr.SkillNode[r2_51.BeginNodeId]
      if not r4_51 then
        return false
      end
      return not r1_51:IsAllBulletEnough((r4_51.CostBullet and 0))
    end
    return not r1_51:IsAllBulletEnough(0)
  end
  return false
end
function r1_0.OnFireActionInputPressed(r0_52)
  -- line: [1037, 1042] id: 52
  if r0_52.OwnerPlayer.CurrentSkillId == r0_52.OwnerPlayer:GetSkillByType(UE.ESkillType.Reload) and not EMUIAnimationSubsystem:EMAnimationIsPlaying(r0_52, r0_52.No_Bullets) then
    EMUIAnimationSubsystem:EMPlayAnimation(r0_52, r0_52.No_Bullets)
  end
end
function r1_0.GetPlayerRoleId(r0_53)
  -- line: [1044, 1058] id: 53
  if not IsValid(r0_53.OwnerPlayer) then
    r0_53.OwnerPlayer = UE4.UGameplayStatics.GetPlayerCharacter(r0_53, 0)
  end
  if r0_53.OwnerPlayer ~= nil then
    if r0_53.OwnerPlayer.CurrentRoleId ~= nil then
      return r0_53.OwnerPlayer.CurrentRoleId
    elseif r0_53.OwnerPlayer.PreRoleId ~= nil and r0_53.OwnerPlayer.PreRoleId ~= 0 then
      return r0_53.OwnerPlayer.PreRoleId
    else
      return r0_53.OwnerPlayer:GetController():GetRoleId()
    end
  end
end
function r1_0.OnSwitchRole(r0_54)
  -- line: [1060, 1067] id: 54
  r0_54.PlayerMainRoleId = r0_54:GetPlayerRoleId()
  if r0_54.PlayerMainRoleId then
    r0_54:RefreshSkillConfig()
    r0_54:OnUpdateCharSp(nil, nil, r0_54:GetOwnerPlayer())
    r0_54:ClearRemainAnim()
  end
end
function r1_0.OnSwitchPet(r0_55)
  -- line: [1069, 1071] id: 55
  r0_55:RefreshSupportSkillIcon()
end
function r1_0.InitSupportSkill(r0_56)
  -- line: [1074, 1093] id: 56
  r0_56.bSupportSkillUnlock = false
  local r1_56 = GWorld:GetAvatar()
  r0_56.SupportUIUnlockRuleId = DataMgr.UIUnlockRule.PetSkill.UIUnlockRuleId
  if r1_56 then
    r0_56.bSupportSkillUnlock = r1_56:CheckUIUnlocked(r0_56.SupportUIUnlockRuleId)
    if not r0_56.bSupportSkillUnlock then
      if not r0_56:IsAnimationPlaying(r0_56.Lock_In) then
        r0_56:PlayAnimationForward(r0_56.Lock_In)
      end
      r0_56.SupportUnlockKey = r1_56:BindOnUIFirstTimeUnlock(r0_56.SupportUIUnlockRuleId, function()
        -- line: [1085, 1088] id: 57
        r0_56.bSupportSkillUnlock = true
        r0_56:ChangeSkillButtonState(ESkillName.Skill3, "UnLock")
      end)
    else
      r0_56:EmptySkill3()
    end
  end
end
function r1_0.PlayGuideRemind(r0_58, r1_58)
  -- line: [1095, 1108] id: 58
  local r2_58 = nil
  if r1_58 == "Skill1" then
    r2_58 = r0_58.Battle_Skill_1
  elseif r1_58 == "Skill2" then
    r2_58 = r0_58.Battle_Skill_2
  end
  if r2_58 then
    if EMUIAnimationSubsystem:EMAnimationIsPlaying(r2_58, r2_58.Guide_Remind) then
      EMUIAnimationSubsystem:EMStopAnimation(r2_58, r2_58.Guide_Remind)
    end
    EMUIAnimationSubsystem:EMPlayAnimation(r2_58, r2_58.Guide_Remind)
  end
end
function r1_0.StopGuideRemind(r0_59, r1_59)
  -- line: [1110, 1123] id: 59
  local r2_59 = nil
  if r1_59 == "Skill1" then
    r2_59 = r0_59.Battle_Skill_1
  elseif r1_59 == "Skill2" then
    r2_59 = r0_59.Battle_Skill_2
  end
  if r2_59 then
    if EMUIAnimationSubsystem:EMAnimationIsPlaying(r2_59, r2_59.Guide_Remind) then
      EMUIAnimationSubsystem:EMStopAnimation(r2_59, r2_59.Guide_Remind)
    end
    EMUIAnimationSubsystem:EMPlayAnimation(r2_59, r2_59.Guide_Remind, 1)
  end
end
function r1_0.ClearRemainAnim(r0_60)
  -- line: [1125, 1147] id: 60
  EMUIAnimationSubsystem:EMPlayAnimation(r0_60, r0_60.Deduct_MP)
  if r0_60.VX_RotLine:GetVisibility() == ESlateVisibility.SelfHitTestInvisible and not r0_60:IsAnimationPlaying(r0_60.UnLock) then
    r0_60:PlayAnimationForward(r0_60.UnLock)
  end
  if r0_60.VX_CompleteGlow:GetVisibility() == ESlateVisibility.HitTestInvisible and not EMUIAnimationSubsystem:EMAnimationIsPlaying(r0_60, r0_60.Skill_Complete) then
    EMUIAnimationSubsystem:EMPlayAnimation(r0_60, r0_60.Skill_Complete)
  end
  if r0_60.Image_BanWeaponSkill:GetVisibility() ~= ESlateVisibility.Collapsed and r0_60.OwnerPlayer and r0_60.OwnerPlayer.ActivePropEffectId == -1 then
    r0_60:OnPropEffectEndReplaceSkill(ESkillName.Fire)
  end
  if r0_60.Overlay_Mounts:GetVisibility() == ESlateVisibility.SelfHitTestInvisible and r0_60.OwnerPlayer and not r0_60.OwnerPlayer.CurMount then
    r0_60.Overlay_Mounts:SetVisibility(ESlateVisibility.Collapsed)
    EMUIAnimationSubsystem:EMPlayAnimation(r0_60, r0_60.Mounts_Out)
  end
end
function r1_0.OnPropEffectReplaceSkill(r0_61, r1_61, r2_61)
  -- line: [1149, 1161] id: 61
  if r1_61 == ESkillName.Fire then
    r0_61.Overlay_Organ:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    EMUIAnimationSubsystem:EMStopAnimation(r0_61, r0_61.Weapon_Normal)
    EMUIAnimationSubsystem:EMPlayAnimation(r0_61, r0_61.Weapon_Ban)
  elseif r1_61 == ESkillName.Skill3 then
    r0_61.Assist_Text_CD:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_61.Assist_Bar_Skill_CD:SetPercent(0)
    r0_61.Assist_Skill_Icon:SetRenderOpacity(1)
    UE.UResourceLibrary.LoadObjectAsync(r0_61, DataMgr.PropEffect[r2_61].ReplaceSupportIconPath, {
      r0_61,
      r1_0.OnSupportIconLoadFinish
    })
  end
end
function r1_0.OnPropEffectEndReplaceSkill(r0_62, r1_62)
  -- line: [1163, 1173] id: 62
  if r1_62 == ESkillName.Fire then
    r0_62.Overlay_Organ:SetVisibility(ESlateVisibility.Collapsed)
    EMUIAnimationSubsystem:EMStopAnimation(r0_62, r0_62.Weapon_Ban)
    EMUIAnimationSubsystem:EMPlayAnimation(r0_62, r0_62.Weapon_Normal)
  elseif r1_62 == ESkillName.Skill3 then
    r0_62.LastSupportSkillState = nil
    r0_62:HandleSupportButtonState()
    UE.UResourceLibrary.LoadObjectAsync(r0_62, r0_62.SupportPath, {
      r0_62,
      r1_0.OnSupportIconLoadFinish
    })
  end
end
function r1_0.OnIconLoadFinish(r0_63, r1_63)
  -- line: [1175, 1189] id: 63
  if not r1_63 or not IsValid(r0_63) then
    return 
  end
  local r2_63 = r1_63:GetName():gsub("T_", "")
  local r3_63 = r0_63.LoadingIconMap[r2_63]
  r0_63.LoadingIconMap[r2_63] = nil
  if not r3_63 then
    return 
  end
  if r3_63 == r0_0.SupportSkill then
    r0_63.Assist_Skill_Icon:SetBrushResourceObject(r1_63)
    r0_63.VX_skillIcon:GetDynamicMaterial():SetTextureParameterValue("Mask", r1_63)
  elseif r3_63 == r0_0.BulletIcon then
    r0_63.Bullet:SetBrushResourceObject(r1_63)
  end
end
function r1_0.OnIconLoadFinishWithId(r0_64, r1_64, r2_64)
  -- line: [1191, 1200] id: 64
  if not r1_64 or not IsValid(r0_64) or r2_64 ~= r0_64.LoadWeaponIconID then
    return 
  end
  local r3_64 = r1_64:GetName():gsub("T_", "")
  r0_64.LoadingIconMap[r3_64] = nil
  if r0_64.LoadingIconMap[r3_64] == r0_0.WeaponIcon then
    r0_64.Weapon_Icon:SetBrushResourceObject(r1_64)
  end
end
function r1_0.OnSupportIconLoadFinish(r0_65, r1_65)
  -- line: [1202, 1207] id: 65
  if not r1_65 or not IsValid(r0_65) then
    return 
  end
  r0_65.Assist_Skill_Icon:SetBrushResourceObject(r1_65)
  r0_65.VX_skillIcon:GetDynamicMaterial():SetTextureParameterValue("Mask", r1_65)
end
function r1_0.DodgeNormalAnim(r0_66)
  -- line: [1210, 1215] id: 66
  r0_66.Dodge_Icon:SetRenderOpacity(1)
  r0_66.Bg01_1:SetRenderOpacity(1)
  r0_66.Charge_Num:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("FEFFD2FF"))
  r0_66.Image_BanDodgeSkill:SetVisibility(ESlateVisibility.Collapsed)
end
function r1_0.DodgeForbidAnim(r0_67)
  -- line: [1218, 1222] id: 67
  r0_67.Dodge_Icon:SetRenderOpacity(0.3)
  r0_67.Bg01_1:SetRenderOpacity(1)
  r0_67.Charge_Num:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("DD1C45FF"))
end
function r1_0.OnEnableBattleMount(r0_68, r1_68)
  -- line: [1225, 1233] id: 68
  if not r1_68:IsMainPlayer() then
    return 
  end
  if r0_68.Overlay_Mounts:GetVisibility() ~= ESlateVisibility.SelfHitTestInvisible then
    r0_68.Overlay_Mounts:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    EMUIAnimationSubsystem:EMPlayAnimation(r0_68, r0_68.Mounts_In)
  end
end
function r1_0.OnDisableBattleMount(r0_69, r1_69)
  -- line: [1235, 1243] id: 69
  if not r1_69:IsMainPlayer() then
    return 
  end
  if r0_69.Overlay_Mounts:GetVisibility() ~= ESlateVisibility.Collapsed then
    r0_69.Overlay_Mounts:SetVisibility(ESlateVisibility.Collapsed)
    EMUIAnimationSubsystem:EMPlayAnimation(r0_69, r0_69.Mounts_Out)
  end
end
return r1_0
