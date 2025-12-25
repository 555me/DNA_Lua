-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\UI_Phone\Battle\WBP_Battle_Button_Phone_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("Unlua")
local r0_0 = require("EMCache.EMCache")
local r1_0 = require("BluePrints.UI.UI_Phone.Battle.BattleHUDCommonConst")
local r2_0 = Class("BluePrints.UI.BP_UIState_C")
r2_0._components = {
  "BluePrints.UI.UIComponent.TouchComponent",
  "BluePrints.UI.UI_Phone.Battle.Component.HUDWidgetDesignComponent"
}
function r2_0.Initialize(r0_1, r1_1)
  -- line: [21, 24] id: 1
  r0_1.Super.Initialize(r0_1)
  r0_1.OwnerPlayer = nil
end
function r2_0.Construct(r0_2)
  -- line: [26, 28] id: 2
  r0_2.Super.Construct(r0_2)
end
function r2_0.ForceInit(r0_3)
  -- line: [31, 44] id: 3
  r0_3:OnLoaded()
  r0_3.OwnerPlayer = UGameplayStatics.GetPlayerCharacter(r0_3, 0)
  r0_3:InitUnlockInfo()
  r0_3:PlayAnim("In")
  r0_3:InitTouchLayer(r0_3.OwnerPlayer, 0, 0)
  r0_3:InitVariable()
  r0_3:GetSkillActiveInfo()
  r0_3.AtkRanged:UpdateWeaponIcon()
  r0_3.DelayAddTouchLayerTimer = r0_3:AddTimer(0.1, r0_3.DelayAddTouchLayer, true)
  r0_3:InitHUDLayout()
end
function r2_0.OnLoaded(r0_4, ...)
  -- line: [47, 50] id: 4
  r0_4.Super.OnLoaded(r0_4, ...)
end
function r2_0.InitListenEvent(r0_5)
  -- line: [53, 75] id: 5
  r0_5:AddDispatcher(EventID.UpdateMainPlayerSp, r0_5, r0_5.OnUpdateCharSp)
  r0_5:AddDispatcher(EventID.UpdateMainPlayerMaxSp, r0_5, r0_5.OnUpdateMaxSp)
  r0_5:AddDispatcher(EventID.UpdateSkillEfficiency, r0_5, r0_5.OnUpdateSkillEfficiency)
  r0_5:AddDispatcher(EventID.OnSwitchRole, r0_5, r0_5.OnSwitchRole)
  r0_5:AddDispatcher(EventID.OnSwitchPet, r0_5, r0_5.OnSwitchPet)
  r0_5:AddDispatcher(EventID.OnBattlePetInitReady, r0_5, r0_5.OnBattlePetInitReady)
  r0_5:AddDispatcher(EventID.ReloadStart, r0_5, r0_5.TryToEnterReloadState)
  r0_5:AddDispatcher(EventID.OnSelectWeapon, r0_5, r0_5.RefreshWeaponInfo)
  r0_5:AddDispatcher(EventID.OnSwitchWeapon, r0_5, r0_5.RefreshWeaponInfo)
  r0_5:AddDispatcher(EventID.OnMainCharacterInitReady, r0_5, r0_5.RefreshWeaponInfo)
  r0_5:AddDispatcher(EventID.OnRefreshBattleWheelEnableState, r0_5, r0_5.ChangeBattleWheelState)
  r0_5:AddDispatcher(EventID.OnBuffSpModify, r0_5, r0_5.OnUpdateBuffSpModify)
  r0_5:AddDispatcher(EventID.OnPropEffectReplaceSkill, r0_5, r0_5.OnPropEffectReplaceSkill)
  r0_5:AddDispatcher(EventID.OnPropEffectEndReplaceSkill, r0_5, r0_5.OnPropEffectEndReplaceSkill)
  r0_5:AddDispatcher(EventID.OnSwitchMobileHUDLayout, r0_5, r0_5.OnSwitchMobileHUDLayout)
  r0_5:AddDispatcher(EventID.OnMobileHudPlanChanged, r0_5, r0_5.UpdateLayoutInfoByServerData)
  r0_5:AddDispatcher(EventID.OnSwitchLeftShoot, r0_5, r0_5.InitLeftShoot)
  r0_5:AddDispatcher(EventID.OnSwitchLeftBulletJump, r0_5, r0_5.InitLeftBulletJump)
  r0_5:AddDispatcher(EventID.OnMobileHookShow, r0_5, r0_5.OnMobileHookShow)
  r0_5:InitTouchListenEvent()
end
function r2_0.InitLeftButtons(r0_6)
  -- line: [77, 80] id: 6
  r0_6:InitLeftShoot()
  r0_6:InitLeftBulletJump()
end
function r2_0.InitLeftShoot(r0_7)
  -- line: [82, 95] id: 7
  r0_7.HasLeftShoot = r0_0:Get("HasLeftShoot")
  if r0_7.HasLeftShoot == nil then
    local r2_7 = nil	-- notice: implicit variable refs by block#[4]
    if DataMgr.Option.LeftShootShow.DefaultValueM == "True" then
      r2_7 = true
      if not r2_7 then
        ::label_17::
        r2_7 = false
      end
    else
      goto label_17	-- block#3 is visited secondly
    end
    r0_0:Set("HasLeftShoot", r2_7)
  end
  if r0_7.HasLeftShoot then
    r0_7.AtkRangedPosLeft:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_7.AtkRanged:ChangeLeftShootState()
  else
    r0_7.AtkRangedPosLeft:SetVisibility(ESlateVisibility.Collapsed)
  end
end
function r2_0.InitLeftBulletJump(r0_8)
  -- line: [97, 110] id: 8
  r0_8.HasLeftBulletJump = r0_0:Get("HasLeftBulletJump")
  if r0_8.HasLeftBulletJump == nil then
    local r2_8 = nil	-- notice: implicit variable refs by block#[4]
    if DataMgr.Option.LeftBulletJumpShow.DefaultValueM == "True" then
      r2_8 = true
      if not r2_8 then
        ::label_17::
        r2_8 = false
      end
    else
      goto label_17	-- block#3 is visited secondly
    end
    r0_0:Set("HasLeftBulletJump", r2_8)
  end
  if r0_8.HasLeftBulletJump then
    r0_8.BulletJumpPos_Left:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    r0_8.BulletJumpPos_Left:SetVisibility(ESlateVisibility.Collapsed)
  end
end
function r2_0.InitHUDLayout(r0_9)
  -- line: [112, 120] id: 9
  local r1_9 = GWorld:GetAvatar()
  if not r1_9 then
    return 
  end
  r0_9.CurrentLayout = r1_9:GetCurrentMobileHudPlanIndex() and 2
  r0_9:OnSwitchMobileHUDLayout(r0_9.CurrentLayout)
end
function r2_0.UpdateLayoutInfoByServerData(r0_10, r1_10, r2_10, r3_10)
  -- line: [122, 152] id: 10
  local r4_10 = GWorld:GetAvatar()
  if not r4_10 then
    return 
  end
  if r1_10 == "Update" then
    local r5_10 = r4_10:GetMobileHudPlan(r2_10) and {}
    if IsEmptyTable(r5_10) then
      r0_10:SetBtnDefaultPosition(r2_10 + -1)
      r0_10:InitLeftButtons()
    else
      for r10_10, r11_10 in pairs(r1_0.DesignBaseConfigInHUD) do
        local r12_10 = r5_10[r10_10]
        DebugPrint("WBP_Battle_Button_Phone:UpdateLayoutInfoByServerData", r10_10, r12_10)
        if r12_10 then
          local r13_10 = r0_10[r10_10]
          r0_10:_UpdateWidgetToTargetPos(r13_10, FVector2D(r12_10.PosX, r12_10.PosY), false, true)
          r0_10:_UpdateWidgetToTargetScale(r13_10, FVector2D(r12_10.ScaleX, r12_10.ScaleY), true)
        end
        if r10_10 == "JumpPos" then
          r0_10.Jump.InnerButtonDis = r0_10.Jump.DefaultButtonDis * r12_10.ScaleX
        end
        if r10_10 == "AtkRangedPos" then
          r0_10.AtkRanged.EdgeWidth = r0_10.AtkRanged.DefaultEdgeWidth * r12_10.ScaleX
        end
      end
      -- close: r6_10
      r0_10:SetBtnDefaultPosition(r2_10 + -1)
      r0_10:InitLeftButtons()
    end
  end
end
function r2_0.OnSwitchMobileHUDLayout(r0_11, r1_11)
  -- line: [154, 160] id: 11
  r0_11.CurrentLayOut = r1_11
  r0_11.EditPlanIndex = r1_11
  r0_11:SetRootLayoutNode(r0_11.Panel_Skill)
  r0_11:UpdateLayoutInfoByServerData("Update", r1_11)
  r0_11.Jump:ChangeByLayout(r1_11)
end
function r2_0.CheckHasBulletJumpButton(r0_12)
  -- line: [162, 164] id: 12
  return r0_12.CurrentLayout == 2
end
function r2_0.CloseWithoutAnim(r0_13)
  -- line: [167, 170] id: 13
  r0_13:BindToAnimationFinished(r0_13.Out, {
    r0_13,
    r0_13.Close
  })
  r0_13:PlayAnim("Out")
end
function r2_0.InitSkillAfterCharInitReady(r0_14)
  -- line: [173, 185] id: 14
  if not IsValid(r0_14) or IsDedicatedServer(r0_14) then
    return 
  end
  r0_14.OwnerPlayer = UGameplayStatics.GetPlayerCharacter(r0_14, 0)
  if not IsValid(r0_14.OwnerPlayer) then
    return 
  end
  r0_14:ForceInit()
  r0_14.SupportSkill:InitSupportSkill()
  r0_14:OnBattlePetInitReady()
  r0_14:InitListenEvent()
end
function r2_0.InitVariable(r0_15)
  -- line: [188, 221] id: 15
  r0_15.Skill.OwnerPanel = r0_15
  r0_15.Skill.CharSkill_1.OwnerPanel = r0_15
  r0_15.Skill.CharSkill_2.OwnerPanel = r0_15
  r0_15.SkillItems = {
    r0_15.Skill.CharSkill_1,
    r0_15.Skill.CharSkill_2
  }
  r0_15.SupportSkill.OwnerPanel = r0_15
  r0_15.Bullet.OwnerPanel = r0_15
  r0_15.Jump.OwnerPanel = r0_15
  r0_15.AtkRanged.OwnerPanel = r0_15
  r0_15.AtkRangedLeft.OwnerPanel = r0_15
  r0_15.Dodge.OwnerPanel = r0_15
  r0_15.AtkMelee.OwnerPanel = r0_15
  r0_15.Squat.OwnerPanel = r0_15
  r0_15.Squat.OwnerPlayer = r0_15.OwnerPlayer
  r0_15.Battle_Menu.OwnerPanel = r0_15
  r0_15.Dodge.OwnerPanel = r0_15
  r0_15.AimLocked.OwnerPanel = r0_15
  r0_15.BulletJump.OwnerPanel = r0_15
  r0_15.BulletJumpLeft.OwnerPanel = r0_15
  r0_15.SkillButtons = {}
  r0_15.SkillButtons[ESkillName.Attack] = r0_15.AtkMelee
  r0_15.SkillButtons[ESkillName.Jump] = r0_15.Jump
  r0_15.SkillButtons[ESkillName.Slide] = r0_15.Squat
  r0_15.SkillButtons[ESkillName.Skill1] = r0_15.Skill.CharSkill_1
  r0_15.SkillButtons[ESkillName.Skill2] = r0_15.Skill.CharSkill_2
  r0_15.SkillButtons[ESkillName.Skill3] = r0_15.SupportSkill
  r0_15.SkillButtons[ESkillName.Fire] = r0_15.AtkRanged
  r0_15.SkillButtons[ESkillName.ChargeBullet] = r0_15.Bullet
  r0_15.SkillButtons[ESkillName.Avoid] = r0_15.Dodge
  r0_15:AddTimer(0.1, r0_15.UpdateSkillInfoInTimer, true, 0, "UpdateSkillInfoInTimer", false)
  r0_15:AddTimer(0.1, r0_15.UpdateOtherInfoInTimer, true, 0.05, "UpdateOtherInfoInTimer", false)
end
function r2_0.OnBattlePetInitReady(r0_16)
  -- line: [223, 234] id: 16
  local r1_16 = r0_16.OwnerPlayer:GetBattlePet()
  if not r1_16 or r1_16.BattlePetId == 0 then
    r0_16:ChangeSkillButtonState(ESkillName.Skill3, "Empty")
    return 
  end
  r0_16.SupportSkill:RefreshSupportSkillIcon()
  if not r0_16.OwnerPlayer:CheckSkillInActive(ESkillName.Skill3) then
    r0_16:ChangeSkillButtonState(ESkillName.Skill3, "UnEmpty")
  end
end
function r2_0.DelayAddTouchLayer(r0_17)
  -- line: [238, 260] id: 17
  if r0_17.Jump.Image_Hotspot and not r0_17.IsInitJumpTouch then
    r0_17.IsInitJumpTouch = true
    r0_17:AddStaticSubTouchItem("Jump", r0_17.Jump.Image_Hotspot, {
      Down = r0_17.Jump.ButtonJumpDown,
      Move = r0_17.Jump.ButtonJumpMove,
      Up = r0_17.Jump.ButtonJumpUp,
    }, r0_17.JumpPos)
  end
  if r0_17.AtkRanged.Joystick and not r0_17.IsInitAtkTouch then
    r0_17.IsInitAtkTouch = true
    r0_17:AddMovedSubTouchItem("RangedAttack", r0_17.AtkRanged.Joystick, r0_17.AtkRangedPos, {
      Down = r0_17.AtkRanged.ButtonFireDown,
      Move = r0_17.AtkRanged.ButtonFireMove,
      Up = r0_17.AtkRanged.ButtonFireUp,
    }, {
      Type = "Circle",
      Param = {
        Radius = r0_17.AtkRanged.CircleLimitArea,
        NeedReset = false,
      },
      TouchTimes = -1,
      NeedResetPos = true,
    })
  end
  local r1_17 = r0_17.Battle_Menu
  if r1_17.Bg and not r0_17.IsInitMenuTouch then
    r0_17.IsInitMenuTouch = true
    r0_17:AddStaticSubTouchItem("BattleMenu", r1_17.Bg, {
      Down = r1_17.BattleMenuDown,
      Move = r1_17.BattleMenuMove,
      Up = r1_17.BattleMenuUp,
    }, r0_17.BattleMenuPos)
  end
  if r0_17.IsInitAtkTouch and r0_17.IsInitJumpTouch and r0_17.IsInitMenuTouch then
    r0_17:RemoveTimer(r0_17.DelayAddTouchLayerTimer)
  end
end
function r2_0.TryToPlayTargetCommand(r0_18, r1_18, r2_18)
  -- line: [264, 301] id: 18
  if not IsValid(r0_18.OwnerPlayer) then
    return 
  end
  if r0_18.OwnerPlayer:CheckForbidTags(r1_18) then
    return 
  end
  if r2_18 then
    r0_18.OwnerPlayer:SetInputCache(r1_18)
  end
  if not r0_18.OwnerPlayer.InitSuccess then
    return 
  end
  if r1_18 == "Skill1" then
    r0_18.OwnerPlayer:ActionCallback("Skill1", EInputEvent.IE_Pressed)
  elseif r1_18 == "Skill2" then
    r0_18.OwnerPlayer:ActionCallback("Skill2", EInputEvent.IE_Pressed)
  elseif r1_18 == "Skill3" then
    r0_18.OwnerPlayer:ActionCallback("Skill3", EInputEvent.IE_Pressed)
  elseif r1_18 == "Reload" then
    r0_18.OwnerPlayer:ActionCallback("ChargeBullet", EInputEvent.IE_Pressed)
  elseif r1_18 == "Avoid" then
    r0_18.OwnerPlayer:ActionCallback("Avoid", EInputEvent.IE_Pressed)
  elseif r1_18 == "Slide" then
    r0_18.OwnerPlayer:ActionCallback("Slide", EInputEvent.IE_Pressed)
  elseif r1_18 == "Attack" then
    r0_18.OwnerPlayer:ActionCallback("Attack", EInputEvent.IE_Pressed)
  elseif r1_18 == "Fire" then
    r0_18.OwnerPlayer:ActionCallback("Fire", EInputEvent.IE_Pressed)
  elseif r1_18 == "Jump" then
    r0_18.OwnerPlayer:ActionCallback("Jump", EInputEvent.IE_Pressed)
  elseif r1_18 == "BulletJump" then
    r0_18.OwnerPlayer:ActionCallback("BulletJump", EInputEvent.IE_Pressed)
  end
end
function r2_0.TryToStopTargetCommand(r0_19, r1_19, r2_19)
  -- line: [303, 340] id: 19
  if not IsValid(r0_19.OwnerPlayer) then
    return 
  end
  if r2_19 then
    r0_19.OwnerPlayer:RemoveInputCache(r1_19)
  end
  if r0_19.OwnerPlayer:CheckForbidTags(r1_19) then
    r0_19.OwnerPlayer:ResetAttackProperty(r1_19)
    return 
  end
  if not r0_19.OwnerPlayer.InitSuccess then
    return 
  end
  if r1_19 == "Skill1" then
    r0_19.OwnerPlayer:ActionCallback("Skill1", EInputEvent.IE_Released)
  elseif r1_19 == "Skill2" then
    r0_19.OwnerPlayer:ActionCallback("Skill2", EInputEvent.IE_Released)
  elseif r1_19 == "Skill3" then
    r0_19.OwnerPlayer:ActionCallback("Skill3", EInputEvent.IE_Released)
  elseif r1_19 == "Slide" then
    r0_19.OwnerPlayer:ActionCallback("Slide", EInputEvent.IE_Released)
  elseif r1_19 == "Attack" then
    r0_19.OwnerPlayer:ActionCallback("Attack", EInputEvent.IE_Released)
  elseif r1_19 == "Fire" then
    r0_19.OwnerPlayer:ActionCallback("Fire", EInputEvent.IE_Released)
  elseif r1_19 == "Jump" then
    r0_19.OwnerPlayer:ActionCallback("Jump", EInputEvent.IE_Released)
  elseif r1_19 == "BulletJump" then
    r0_19.OwnerPlayer:ActionCallback("BulletJump", EInputEvent.IE_Released)
  elseif r1_19 == "SwitchCrouch" then
    r0_19.OwnerPlayer:ActionCallback("SwitchCrouch", EInputEvent.IE_Released)
  end
end
function r2_0.GetSkillActiveInfo(r0_20)
  -- line: [346, 364] id: 20
  local r1_20 = nil
  if r0_20.OwnerPlayer and r0_20.OwnerPlayer.GetController then
    r1_20 = r0_20.OwnerPlayer:GetController()
  end
  if r1_20 then
    local r2_20 = r1_20.CurrentInActiveSkills:Length()
    local r3_20 = r0_20.SkillButtons
    for r7_20 = 1, r2_20, 1 do
      r0_20:ChangeSkillButtonState(r1_20.CurrentInActiveSkills[r7_20], "Lock")
      r3_20[r1_20.CurrentInActiveSkills[r7_20]] = nil
    end
    for r8_20, r9_20 in pairs(r3_20) do
      r0_20:ChangeSkillButtonState(r8_20, "UnLock")
    end
    -- close: r4_20
    r0_20:ChangeBattleWheelState(r1_20.bEnableBattleWheel, r1_20.bShowBattleWheel)
  end
end
function r2_0.ChangeBattleWheelState(r0_21, r1_21, r2_21)
  -- line: [366, 383] id: 21
  DebugPrint("gmy@WBP_Battle_Button_Phone:ChangeBattleWheelState", r1_21)
  r0_21.Battle_Menu.IsBan = not r1_21
  if not r1_21 then
    r0_21.Battle_Menu:StopAnimation(r0_21.Battle_Menu.Normal)
    r0_21.Battle_Menu:PlayAnimationForward(r0_21.Battle_Menu.Ban)
  else
    r0_21.Battle_Menu:StopAnimation(r0_21.Battle_Menu.Ban)
    r0_21.Battle_Menu:PlayAnimationForward(r0_21.Battle_Menu.Normal)
  end
  if r0_21.BattleMenuUnlocked and r2_21 then
    r0_21.Battle_Menu:SetVisibility(UE4.ESlateVisibility.Visible)
  else
    r0_21.Battle_Menu:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
function r2_0.ChangeSkillButtonState(r0_22, r1_22, r2_22)
  -- line: [387, 567] id: 22
  if r2_22 == "Empty" then
    if r1_22 == ESkillName.Skill1 then
      r0_22.SkillItems[1].CurButtonState = "Empty"
      r0_22.SkillItems[1].Switcher:SetActiveWidgetIndex(1)
      r0_22.SkillItems[1].Bg_Skill:SetBrushTintColor(UE4.UUIFunctionLibrary.GetSlateColorByRGBA(1, 1, 1, 0.3))
    elseif r1_22 == ESkillName.Skill2 then
      r0_22.SkillItems[2].CurButtonState = "Empty"
      r0_22.SkillItems[2].Switcher:SetActiveWidgetIndex(1)
      r0_22.SkillItems[2].Bg_Skill:SetBrushTintColor(UE4.UUIFunctionLibrary.GetSlateColorByRGBA(1, 1, 1, 0.3))
    elseif r1_22 == ESkillName.Skill3 then
      r0_22.SupportSkill.CurButtonState = "Empty"
      r0_22.SupportSkill.Switcher:SetActiveWidgetIndex(1)
      r0_22.SupportSkill.Bg:SetBrushTintColor(UE4.UUIFunctionLibrary.GetSlateColorByRGBA(1, 1, 1, 0.3))
    elseif r1_22 == ESkillName.Fire then
      r0_22.AtkRanged.CurButtonState = "Empty"
      r0_22.Bullet.CurButtonState = "Empty"
      r0_22.AtkRanged:UpdateRangeWeaponButton()
      r0_22.Bullet:SetVisibility(ESlateVisibility.Collapsed)
    end
  elseif r2_22 == "UnEmpty" then
    if r1_22 == ESkillName.Skill1 then
      r0_22.SkillItems[1].CurButtonState = "Normal"
      r0_22.SkillItems[1].Switcher:SetActiveWidgetIndex(0)
      r0_22.SkillItems[1].Bg_Skill:SetBrushTintColor(UE4.UUIFunctionLibrary.GetSlateColorByRGBA(1, 1, 1, 1))
    elseif r1_22 == ESkillName.Skill2 then
      r0_22.SkillItems[2].CurButtonState = "Normal"
      r0_22.SkillItems[2].Switcher:SetActiveWidgetIndex(0)
      r0_22.SkillItems[2].Bg_Skill:SetBrushTintColor(UE4.UUIFunctionLibrary.GetSlateColorByRGBA(1, 1, 1, 1))
    elseif r1_22 == ESkillName.Skill3 then
      r0_22.SupportSkill.CurButtonState = "Normal"
      r0_22.SupportSkill.Switcher:SetActiveWidgetIndex(0)
      r0_22.SupportSkill.Bg:SetBrushTintColor(UE4.UUIFunctionLibrary.GetSlateColorByRGBA(1, 1, 1, 1))
    elseif r1_22 == ESkillName.Fire then
      r0_22.AtkRanged.CurButtonState = "Normal"
      r0_22.Bullet.CurButtonState = "Normal"
      r0_22.AtkRanged:UpdateRangeWeaponButton()
      r0_22.Bullet:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
  end
  if r2_22 == "UnLock" then
    if r1_22 == ESkillName.Attack then
      r0_22.AtkMelee:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      r0_22.Jump:OnSkillActive(r1_22)
    elseif r1_22 == ESkillName.Jump then
      r0_22.Jump:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      r0_22.Jump.CurButtonState = "Active"
    elseif r1_22 == ESkillName.Slide then
      r0_22.Squat:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      r0_22.Jump:OnSkillActive(r1_22)
    elseif r1_22 == ESkillName.Skill1 then
      r0_22.Skill:PlayAnimationForward(r0_22.Skill.In)
      if r0_22.SkillItems[1].CurButtonState == "Lock_In" then
        r0_22.SkillItems[1].SkillInfo.NeedUnlock = true
      end
    elseif r1_22 == ESkillName.Skill2 and r0_22.SkillItems[2].CurButtonState == "Lock_In" then
      r0_22.SkillItems[2].SkillInfo.NeedUnlock = true
    elseif r1_22 == ESkillName.Skill3 then
      r0_22.SupportSkill:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      r0_22.SupportSkill:PlayAnimationForward(r0_22.SupportSkill.In)
    elseif r1_22 == ESkillName.Fire then
      r0_22.AtkRanged:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      r0_22.AtkRangedLeft:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      r0_22.Bullet:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    elseif r1_22 == ESkillName.Avoid then
      r0_22.Dodge:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    elseif r1_22 == ESkillName.BulletJump then
      r0_22.BulletJump:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      r0_22.BulletJumpLeft:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      r0_22.Jump:OnSkillActive(r1_22)
    end
  elseif r2_22 == "Lock" then
    if r1_22 == ESkillName.Attack then
      r0_22.AtkMelee:SetVisibility(UE4.ESlateVisibility.Collapsed)
      r0_22.Jump:OnSkillInActive(r1_22)
    elseif r1_22 == ESkillName.Jump then
      r0_22.Jump:SetVisibility(UE4.ESlateVisibility.Collapsed)
      r0_22.Jump.CurButtonState = "InActive"
    elseif r1_22 == ESkillName.Slide then
      r0_22.Squat:SetVisibility(UE4.ESlateVisibility.Collapsed)
      r0_22.Jump:OnSkillInActive(r1_22)
    elseif r1_22 == ESkillName.Skill1 then
      r0_22.SkillItems[1].CurButtonState = "Lock_In"
      r0_22.SkillItems[1]:PlayButtonStateAnimation()
    elseif r1_22 == ESkillName.Skill2 then
      r0_22.SkillItems[2].CurButtonState = "Lock_In"
      r0_22.SkillItems[2]:PlayButtonStateAnimation()
    elseif r1_22 == ESkillName.Skill3 then
      r0_22.SupportSkill:SetVisibility(UE4.ESlateVisibility.Collapsed)
    elseif r1_22 == ESkillName.Fire then
      r0_22.AtkRanged:SetVisibility(UE4.ESlateVisibility.Collapsed)
      r0_22.AtkRangedLeft:SetVisibility(UE4.ESlateVisibility.Collapsed)
      r0_22.Bullet:SetVisibility(UE4.ESlateVisibility.Collapsed)
    elseif r1_22 == ESkillName.Avoid then
      r0_22.Dodge:SetVisibility(UE4.ESlateVisibility.Collapsed)
    elseif r1_22 == ESkillName.BulletJump then
      r0_22.BulletJump:SetVisibility(UE4.ESlateVisibility.Collapsed)
      r0_22.BulletJumpLeft:SetVisibility(UE4.ESlateVisibility.Collapsed)
      r0_22.Jump:OnSkillInActive(r1_22)
    end
  elseif r2_22 == "Ban" then
    if r1_22 == ESkillName.Attack then
      r0_22.AtkMelee.IsBan = true
      r0_22.AtkMelee:PlayAnimationForward(r0_22.AtkMelee.Ban)
    elseif r1_22 == ESkillName.Jump then
      r0_22.Jump:PlayAnimationForward(r0_22.Jump.Ban)
      r0_22.Jump.CurButtonState = "InActive"
    elseif r1_22 == ESkillName.Slide then
      r0_22.Squat:PlayAnimationForward(r0_22.Squat.Ban)
    elseif r1_22 == ESkillName.Skill1 then
      r0_22.SkillItems[1].CurButtonState = "Ban"
      r0_22.SkillItems[1]:PlayButtonStateAnimation()
    elseif r1_22 == ESkillName.Skill2 then
      r0_22.SkillItems[2].CurButtonState = "Ban"
      r0_22.SkillItems[2]:PlayButtonStateAnimation()
    elseif r1_22 == ESkillName.Skill3 then
      r0_22.SupportSkill.CurButtonState = "Ban"
      r0_22.SupportSkill:PlayAnimationForward(r0_22.SupportSkill.Ban)
    elseif r1_22 == ESkillName.Fire then
      r0_22.AtkRanged.CurButtonState = "Ban"
      EMUIAnimationSubsystem:EMPlayAnimation(r0_22.AtkRanged, r0_22.AtkRanged.Ban)
      EMUIAnimationSubsystem:EMPlayAnimation(r0_22.AtkRangedLeft, r0_22.AtkRangedLeft.Ban)
      r0_22.Bullet.CurButtonState = "Ban"
      r0_22.Bullet:PlayButtonStateAnimation()
    elseif r1_22 == ESkillName.Avoid then
      r0_22.Dodge:PlayAnimationForward(r0_22.Dodge.Ban)
      if r0_22:CheckHasBulletJumpButton() then
        r0_22.BulletJump:InActiveBulletJump()
      end
      if r0_22.HasLeftBulletJump then
        r0_22.BulletJumpLeft:InActiveBulletJump()
      end
    end
  elseif r2_22 == "UnBan" then
    if r1_22 == ESkillName.Attack then
      r0_22.AtkMelee.IsBan = false
      r0_22.AtkMelee:PlayAnimationForward(r0_22.AtkMelee.Normal)
    elseif r1_22 == ESkillName.Jump then
      r0_22.Jump:PlayAnimationForward(r0_22.Jump.Normal)
      r0_22.Jump.CurButtonState = "Active"
    elseif r1_22 == ESkillName.Slide then
      r0_22.Squat:PlayAnimationForward(r0_22.Squat.Normal)
    elseif r1_22 == ESkillName.Skill1 then
      r0_22.SkillItems[1].CurButtonState = "Normal"
    elseif r1_22 == ESkillName.Skill2 then
      r0_22.SkillItems[2].CurButtonState = "Normal"
    elseif r1_22 == ESkillName.Skill3 then
      r0_22.SupportSkill.CurButtonState = "Normal"
      r0_22.SupportSkill:PlayAnimationForward(r0_22.SupportSkill.Normal)
    elseif r1_22 == ESkillName.Fire then
      r0_22.AtkRanged.CurButtonState = nil
      r0_22.AtkRanged:PlayAnimationForward(r0_22.AtkRanged.Normal)
      r0_22.AtkRangedLeft.CurButtonState = nil
      EMUIAnimationSubsystem:EMPlayAnimation(r0_22.AtkRangedLeft, r0_22.AtkRangedLeft.Normal)
      r0_22.Bullet:PlayAnimationForward(r0_22.Bullet.Normal)
    elseif r1_22 == ESkillName.Avoid then
      r0_22.Dodge:PlayAnimationForward(r0_22.Dodge.Normal)
      if r0_22:CheckHasBulletJumpButton() then
        r0_22.BulletJump:ActiveBulletJump()
      end
      if r0_22.HasLeftBulletJump then
        r0_22.BulletJumpLeft:ActiveBulletJump()
      end
    end
  elseif (r2_22 == "Hooking" or r2_22 == "RegionBan") and r0_22.SkillButtons[r1_22] then
    r0_22.SkillButtons[r1_22]:SetRenderOpacity(0.5)
  elseif (r2_22 == "EndHooking" or r2_22 == "RegionUnBan") and r0_22.SkillButtons[r1_22] then
    r0_22.SkillButtons[r1_22]:SetRenderOpacity(1)
  end
end
function r2_0.RefreshWeaponInfo(r0_23)
  -- line: [570, 574] id: 23
  r0_23.Bullet:UpdateBulletType()
  r0_23.Bullet:UpdatePlayerWeaponInfo()
  r0_23.AtkRanged:UpdateWeaponIcon()
end
function r2_0.RefreshRoleTargetSkill(r0_24, r1_24)
  -- line: [577, 585] id: 24
  if r1_24 == "Skill1" then
    r0_24.SkillItems[1]:RefreshButtonStyle()
  elseif r1_24 == "Skill2" then
    r0_24.SkillItems[2]:RefreshButtonStyle()
  elseif r1_24 == "Support" then
    r0_24.SupportSkill:RefreshButtonStyle()
  end
end
function r2_0.RefreshRoleSkillButton(r0_25)
  -- line: [588, 594] id: 25
  r0_25.SkillItems[1]:RefreshButtonStyle()
  r0_25.SkillItems[2]:RefreshButtonStyle()
  r0_25.SupportSkill:RefreshButtonStyle()
end
function r2_0.UpdateSkillInfoInTimer(r0_26)
  -- line: [600, 610] id: 26
  if IsValid(r0_26.OwnerPlayer) and not r0_26.OwnerPlayer.IsUpdatedUIInThisTick then
    r0_26.Skill:UpdateSkillInTimer()
    r0_26.Squat:UpdateButtonInTimer()
    r0_26.Dodge:UpdateButtonInTimer()
    r0_26.AimLocked:UpdateButtonInTimer()
    r0_26.IsCharacterInFalling = r0_26.OwnerPlayer:CharacterInTag("Falling")
    r0_26.OwnerPlayer.IsUpdatedUIInThisTick = true
  end
end
function r2_0.UpdateOtherInfoInTimer(r0_27)
  -- line: [613, 627] id: 27
  if IsValid(r0_27.OwnerPlayer) and not r0_27.OwnerPlayer.IsUpdatedOtherUIInThisTick then
    r0_27.SupportSkill:UpdateSkillInTimer()
    r0_27.Bullet:UpdateButtonInTimer()
    r0_27.AtkRanged:UpdateButtonInTimer()
    if r0_27:CheckHasBulletJumpButton() then
      r0_27.BulletJump:UpdateButtonInTimer()
    end
    if r0_27.HasLeftBulletJump then
      r0_27.BulletJumpLeft:UpdateButtonInTimer()
    end
    r0_27.OwnerPlayer.IsUpdatedOtherUIInThisTick = true
  end
end
function r2_0.OnUpdateCharSp(r0_28, r1_28, r2_28, r3_28)
  -- line: [632, 634] id: 28
  r0_28.Skill:OnUpdateCharSp(r1_28, r2_28, r3_28)
end
function r2_0.OnUpdateMaxSp(r0_29, r1_29)
  -- line: [636, 638] id: 29
  r0_29.Skill:OnUpdateMaxSp(r1_29)
end
function r2_0.OnUpdateSkillEfficiency(r0_30, r1_30)
  -- line: [641, 645] id: 30
  for r5_30 = 1, 2, 1 do
    r0_30.SkillItems[r5_30]:OnRefreshSkillSpCost(r1_30)
  end
end
function r2_0.OnUpdateBuffSpModify(r0_31)
  -- line: [648, 652] id: 31
  for r4_31 = 1, 2, 1 do
    r0_31.SkillItems[r4_31]:OnUpdateBuffSpModify()
  end
end
function r2_0.OnSwitchRole(r0_32)
  -- line: [655, 661] id: 32
  if r0_32.OwnerPlayer then
    r0_32:OnUpdateCharSp(nil, nil, r0_32.OwnerPlayer)
    r0_32:RefreshRoleSkillButton()
    r0_32:RefreshWeaponInfo()
  end
end
function r2_0.OnSwitchPet(r0_33)
  -- line: [664, 666] id: 33
  r0_33.SupportSkill:RefreshSupportSkillIcon()
end
function r2_0.TryToEnterReloadState(r0_34)
  -- line: [669, 671] id: 34
  r0_34.Bullet:TryToEnterReloadState()
end
function r2_0.ExecuteCheckIsSkillInUsing(r0_35, r1_35)
  -- line: [674, 681] id: 35
  if r1_35.CombatConditionID then
    return Battle(r0_35):CheckConditionNew(r1_35.CombatConditionID, r0_35.OwnerPlayer, nil, "From WBP_Battle_Button_Phone:ExecuteCheckIsSkillInUsing")
  end
  return false
end
function r2_0.InitUnlockInfo(r0_36)
  -- line: [683, 697] id: 36
  r0_36:InitButtonUnlockState(DataMgr.UIUnlockRule.BattleWheel.UIUnlockRuleId, function()
    -- line: [685, 688] id: 37
    r0_36.BattleMenuUnlocked = true
    r0_36.Battle_Menu:SetVisibility(UE4.ESlateVisibility.Visible)
  end, function()
    -- line: [688, 691] id: 38
    r0_36.BattleMenuUnlocked = false
    r0_36.Battle_Menu:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end, function()
    -- line: [691, 694] id: 39
    r0_36.BattleMenuUnlocked = true
    r0_36.Battle_Menu:SetVisibility(UE4.ESlateVisibility.Visible)
  end)
  r0_36.Execute:SetVisibility(UE4.ESlateVisibility.Collapsed)
end
function r2_0.InitButtonUnlockState(r0_40, r1_40, r2_40, r3_40, r4_40)
  -- line: [702, 722] id: 40
  local r5_40 = GWorld:GetAvatar()
  if r5_40 == nil then
    return 
  end
  if r4_40 then
    r0_40.UnlockEvents = r0_40.UnlockEvents and {}
    r0_40.UnlockEvents[r1_40] = r5_40:BindOnUIFirstTimeUnlock(r1_40, r4_40)
  end
  local r6_40 = r5_40:CheckUIUnlocked(r1_40)
  DebugPrint("gmy@InitButtonUnlockState Unlocked", r6_40)
  if r6_40 and r2_40 then
    r2_40()
  elseif r3_40 then
    r3_40()
  end
end
function r2_0.OnPropEffectReplaceSkill(r0_41, r1_41, r2_41)
  -- line: [724, 732] id: 41
  if r1_41 == ESkillName.Attack or r1_41 == ESkillName.HeavyAttack then
    r0_41.AtkMelee:OnPropEffectReplaceAttack(r2_41)
  elseif r1_41 == ESkillName.Fire or r1_41 == ESkillName.HeavyShooting then
    r0_41.AtkRanged:OnPropEffectReplaceFire(r2_41)
    r0_41.SupportSkill:OnPropEffectReplaceSupport(r2_41)
  end
end
function r2_0.OnPropEffectEndReplaceSkill(r0_42, r1_42)
  -- line: [734, 742] id: 42
  if r1_42 == ESkillName.Attack or r1_42 == ESkillName.HeavyAttack then
    r0_42.AtkMelee:OnPropEffectEndReplaceAttack()
  elseif r1_42 == ESkillName.Fire or r1_42 == ESkillName.HeavyShooting then
    r0_42.AtkRanged:OnPropEffectEndReplaceFire()
    r0_42.SupportSkill:OnPropEffectEndReplaceSupport()
  end
end
function r2_0.Destruct(r0_43)
  -- line: [744, 756] id: 43
  r0_43.Super.Destruct(r0_43)
  local r1_43 = GWorld:GetAvatar()
  if r1_43 == nil then
    return 
  end
  if r0_43.UnlockEvents then
    for r6_43, r7_43 in pairs(r0_43.UnlockEvents) do
      r1_43:UnBindOnUIFirstTimeUnlock(r6_43, r7_43)
    end
    -- close: r2_43
  end
  r0_43:RemoveTouchListenEvent()
end
function r2_0.ShowAtkMeleeForbidTips(r0_44)
  -- line: [758, 760] id: 44
  UIManager(r0_44):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, GText("UI_MELEE_FORBIDDEN"))
end
function r2_0.OnMobileHookShow(r0_45, r1_45)
  -- line: [762, 771] id: 45
  local r2_45 = UIManager(r0_45):GetUIObj("BattleMain")
  if r2_45.Char_Skill.Execute.IsShow then
    r2_45.Char_Skill.Switch_Type:SetActiveWidgetIndex(0)
    return 
  end
  r2_45.Char_Skill.Switch_Type:SetActiveWidgetIndex(1)
  r1_45.InteractiveUI = r2_45.Char_Skill.HookLock
  r1_45.InteractiveUI:Init(r1_45)
end
AssembleComponents(r2_0)
return r2_0
