-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\UI_Phone\Battle\WBP_Atk_Ranged_Phone_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("EMCache.EMCache")
local r1_0 = Class("BluePrints.UI.BP_UIState_C")
r1_0._components = {
  "BluePrints.UI.UI_Phone.Battle.Component.DraggableWidgetComponent"
}
function r1_0.Initialize(r0_1, r1_1)
  -- line: [18, 28] id: 1
  r0_1.CircleLimitArea = 55
  r0_1.LocalTurnSpeed_Horizontal = 4.5
  r0_1.LocalTurnSpeed_Vertical = 2
  r0_1.DefaultEdgeWidth = 60
  r0_1.LerpTime = 1.5
  r0_1.YawRotateSpeed = 30
  r0_1.BtnHoldCD = 3
  r0_1.OccupiedTag = "Right"
  r0_1.EdgeWidth = r0_1.DefaultEdgeWidth
end
function r1_0.Construct(r0_2)
  -- line: [33, 44] id: 2
  r0_2.CurButtonState = "Normal"
  r0_2.ImageMat = r0_2.Image_Main:GetDynamicMaterial()
  r0_2.OwnerPlayer = UGameplayStatics.GetPlayerCharacter(r0_2, 0)
  if r0_0:Get("LongPressLockShooting") == nil then
    local r3_2 = nil	-- notice: implicit variable refs by block#[4]
    if DataMgr.Option.LongPressLockShooting.DefaultValueM == "True" then
      r3_2 = true
      if not r3_2 then
        ::label_26::
        r3_2 = false
      end
    else
      goto label_26	-- block#3 is visited secondly
    end
    r0_0:Set("LongPressLockShooting", r3_2)
  end
end
function r1_0.Tick(r0_3, r1_3, r2_3)
  -- line: [46, 60] id: 3
  if r0_3.AutoYawRotate then
    local r3_3 = r0_3.YawRotateSpeed
    if r0_3.YawDirection < 0 then
      r3_3 = -r0_3.YawRotateSpeed
    end
    if r0_3.PassedTime < r0_3.LerpTime then
      r0_3.PassedTime = r0_3.PassedTime + r2_3
      r3_3 = UE4.UKismetMathLibrary.Ease(r0_3.LastYawSpeed, r3_3, math.clamp(r0_3.PassedTime / r0_3.LerpTime, 0, 1), UE4.EEasingFunc.EaseOut)
    end
    r0_3.OwnerPlayer:AddControllerYawInput(r3_3 * r2_3)
  end
end
function r1_0.ButtonFireDown(r0_4, r1_4, r2_4)
  -- line: [62, 88] id: 4
  local r3_4 = r0_4.AtkRanged
  if not r3_4.OwnerPanel.FireOccupied then
    r3_4.OwnerPanel.FireOccupied = r3_4.OccupiedTag
    r3_4.OwnerPanel:TryToPlayTargetCommand("Fire", true)
    r3_4.LockShooting = r0_0:Get("LongPressLockShooting")
    if r3_4.LockShooting and not r3_4.HasHeavyShooting then
      r3_4.StartTime = UE4.UGameplayStatics.GetRealTimeSeconds(r3_4)
    end
  end
  r3_4.IsFireDown = true
  r3_4.ViewPortSize = UWidgetLayoutLibrary.GetViewportSize(r0_4)
  if r3_4.CurButtonState == "Ban" then
    UIManager(r3_4):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, GText("UI_RANGED_FORBIDDEN"))
    return 
  elseif r3_4.OwnerPlayer:CheckSkillInActive(ESkillName.Fire) then
    return 
  end
  r3_4.Joystick:SetRenderOpacity(1)
  r3_4.Joystick_Border:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  if not EMUIAnimationSubsystem:EMAnimationIsPlaying(r3_4, r3_4.Press) and r3_4.CurButtonState ~= "Forbidden" then
    EMUIAnimationSubsystem:EMPlayAnimation(r3_4, r3_4.Press)
  end
end
function r1_0.ButtonFireMove(r0_5, r1_5, r2_5, r3_5, r4_5, r5_5, r6_5)
  -- line: [90, 127] id: 5
  local r7_5 = r0_5.AtkRanged
  local r8_5 = UE4.UGameplayStatics.GetWorldDeltaSeconds(r7_5)
  r7_5.OwnerPlayer:AddCharacterPitchInput(-r7_5.LocalTurnSpeed_Vertical * r5_5.Y * r8_5)
  if r7_5.EdgeWidth < r6_5.X and r6_5.X < r7_5.ViewPortSize.X - r7_5.EdgeWidth then
    r7_5.AutoYawRotate = false
    r7_5.LastYawSpeed = r7_5.LocalTurnSpeed_Horizontal * r5_5.X
    r7_5.OwnerPlayer:AddCharacterYawInput(r7_5.LastYawSpeed * r8_5)
    r7_5.PassedTime = 0
    r7_5.YawDirection = r4_5.X
  else
    r7_5.AutoYawRotate = true
  end
  if r7_5.CurButtonState == "Forbidden" or r7_5.CurButtonState == "Ban" or r7_5.CurButtonState == "Empty" then
    return 
  end
  if r7_5.CurButtonState ~= "Forbidden" and r7_5.LastButtonState == "Forbidden" and not EMUIAnimationSubsystem:EMAnimationIsPlaying(r7_5, r7_5.Press) then
    EMUIAnimationSubsystem:EMPlayAnimation(r7_5, r7_5.Press)
    r7_5.Joystick:SetRenderOpacity(1)
    r7_5.Joystick_Border:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if r7_5.CurButtonState ~= "ChangeMagazine" and r7_5.LastButtonState == "ChangeMagazine" and not EMUIAnimationSubsystem:EMAnimationIsPlaying(r7_5, r7_5.Press) then
    EMUIAnimationSubsystem:EMPlayAnimation(r7_5, r7_5.Press)
    r7_5.Joystick:SetRenderOpacity(1)
    r7_5.Joystick_Border:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  r7_5.LastButtonState = r7_5.CurButtonState
  r7_5.Joystick_Border:SetRenderTransformAngle(r7_5:CalcFinalAngle(r3_5))
end
function r1_0.ButtonFireUp(r0_6, r1_6, r2_6, r3_6, r4_6, r5_6)
  -- line: [129, 159] id: 6
  local r6_6 = r0_6.AtkRanged
  if r6_6.OwnerPanel.FireOccupied == r6_6.OccupiedTag then
    r6_6.OwnerPanel.FireOccupied = nil
    if r6_6.LockShooting and r6_6.OwnerPlayer:CharacterInTag("Shooting") and not r6_6.HasHeavyShooting then
      r6_6.CurrentTime = UE4.UGameplayStatics.GetRealTimeSeconds(r6_6)
      if r6_6.BtnHoldCD < r6_6.CurrentTime - r6_6.StartTime then
        r6_6.IsLockingShoot = true
        return 
      end
    end
    r6_6.OwnerPanel:TryToStopTargetCommand("Fire", true)
  end
  r6_6.AutoYawRotate = false
  r6_6.IsFireDown = false
  r6_6.IsLockingShoot = false
  r6_6.Joystick:SetRenderOpacity(0)
  r6_6.Joystick_Border:SetVisibility(UIConst.VisibilityOp.Hidden)
  if r6_6.CurButtonState ~= "Forbidden" and r6_6.CurButtonState ~= "Ban" and r6_6.CurButtonState ~= "Empty" then
    if EMUIAnimationSubsystem:EMAnimationIsPlaying(r6_6, r6_6.Press) then
      EMUIAnimationSubsystem:EMStopAnimation(r6_6, r6_6.Press)
    end
    EMUIAnimationSubsystem:EMPlayAnimation(r6_6, r6_6.Click)
    r6_6:AddTimer(r6_6.Click:GetEndTime(), function()
      -- line: [155, 157] id: 7
      EMUIAnimationSubsystem:EMPlayAnimation(r6_6, r6_6.Normal)
    end)
  end
end
function r1_0.UpdateWeaponIcon(r0_8)
  -- line: [162, 203] id: 8
  local r1_8 = nil
  local r2_8 = nil
  local r3_8 = false
  if r0_8.OwnerPlayer.BuffManager.UseSummonWeapon ~= -1 then
    if CommonUtils.HasValue(DataMgr.BattleWeapon[r0_8.OwnerPlayer.UltraWeapon.WeaponId].WeaponTag, "Ranged") then
      r1_8 = r0_8.OwnerPlayer.UltraWeapon
      r3_8 = true
    else
      r1_8 = r0_8.OwnerPlayer.RangedWeapon
    end
  else
    r1_8 = r0_8.OwnerPlayer.RangedWeapon
  end
  if not IsValid(r1_8) then
    r0_8.RangedWeapon = nil
    return 
  end
  r0_8.RangedWeapon = r1_8
  r0_8.WeaponId = r1_8.WeaponId
  local r4_8 = DataMgr.BattleWeapon[r0_8.WeaponId]
  local r5_8 = nil
  if r4_8 ~= nil and r4_8.WeaponHUDIcon ~= nil then
    r5_8 = "/Game/UI/Texture/Dynamic/Atlas/Battle/Weapon/T_" .. r4_8.WeaponHUDIcon
  else
    r5_8 = "/Game/UI/Texture/Dynamic/Atlas/Battle/Weapon/T_Crossbow_Chixing.T_Crossbow_Chixing"
  end
  r0_8.WeaponHUDIcon = r5_8
  if r0_8.OwnerPlayer.ActivePropEffectId ~= -1 then
    return 
  end
  r0_8.LoadResourceID = nil
  local r6_8 = UE.UResourceLibrary.LoadObjectAsyncWithId(r0_8, r5_8, {
    r0_8,
    r1_0.OnWeaponHUDIconLoadFinish
  })
  if r6_8 then
    r0_8.LoadResourceID = r6_8.ResourceID
  end
  r0_8:GetCurrentWeaponHeavyShooting(r3_8)
end
function r1_0.GetCurrentWeaponHeavyShooting(r0_9, r1_9)
  -- line: [205, 217] id: 9
  local r2_9 = nil
  if r1_9 then
    r2_9 = r0_9.OwnerPlayer:GetSkillByTypeAndOwner(ESkillType.HeavyShooting, "UltraWeapon")
  else
    r2_9 = r0_9.OwnerPlayer:GetSkillByTypeAndOwner(ESkillType.HeavyShooting, "RangedWeapon")
  end
  if r2_9 ~= 0 then
    r0_9.HasHeavyShooting = true
  else
    r0_9.HasHeavyShooting = false
  end
end
function r1_0.OnWeaponHUDIconLoadFinish(r0_10, r1_10, r2_10)
  -- line: [219, 234] id: 10
  if not IsValid(r0_10) or not r1_10 or r0_10.LoadResourceID ~= r2_10 then
    return 
  end
  r0_10.OwnerPanel.AtkRangedLeft:OnWeaponHUDIconLoadFinish(r1_10)
  r0_10:WeaponIcon()
  r0_10.ImageMat = r0_10.Image_Main:GetDynamicMaterial()
  if r0_10.ImageMat then
    r0_10.ImageMat:SetTextureParameterValue("Icon_Ranged", r1_10)
  end
  r0_10:UpdateRangeWeaponButton()
end
function r1_0.OnPropIconLoadFinish(r0_11, r1_11, r2_11)
  -- line: [236, 244] id: 11
  if not IsValid(r0_11) or not r1_11 or r0_11.LoadPropResourceID ~= r2_11 then
    return 
  end
  r0_11:OrganIcon(r1_11)
  r0_11.ImageMat = r0_11.Image_Main:GetDynamicMaterial()
  r0_11.OwnerPanel.AtkRangedLeft:OnPropIconLoadFinish(r1_11)
end
function r1_0.OnPropEffectReplaceFire(r0_12, r1_12)
  -- line: [246, 255] id: 12
  local r2_12 = DataMgr.PropEffect[r1_12].ReplaceShootIconPath
  if not r2_12 then
    return 
  end
  local r3_12 = UE.UResourceLibrary.LoadObjectAsyncWithId(r0_12, r2_12, {
    r0_12,
    r1_0.OnPropIconLoadFinish
  })
  if r3_12 then
    r0_12.LoadPropResourceID = r3_12.ResourceID
  end
end
function r1_0.OnPropEffectEndReplaceFire(r0_13)
  -- line: [257, 264] id: 13
  if r0_13.WeaponHUDIcon then
    local r1_13 = UE.UResourceLibrary.LoadObjectAsyncWithId(r0_13, r0_13.WeaponHUDIcon, {
      r0_13,
      r1_0.OnWeaponHUDIconLoadFinish
    })
    if r1_13 then
      r0_13.LoadResourceID = r1_13.ResourceID
    end
  end
end
function r1_0.UpdateButtonInTimer(r0_14)
  -- line: [266, 270] id: 14
  if r0_14.IsLockingShoot and r0_14.OwnerPlayer:GetCharacterTag() ~= "Shooting" then
    r0_14.ButtonFireUp(r0_14.OwnerPanel)
  end
end
function r1_0.UpdateRangeWeaponButton(r0_15)
  -- line: [273, 308] id: 15
  DebugPrint("射击键当前状态", r0_15.CurButtonState)
  if not r0_15.RangedWeapon then
    return 
  end
  if r0_15.CurButtonState == "Empty" then
    r0_15.ImageMat:SetScalarParameterValue("IconState", 0)
    r0_15:ChangeLeftShootState()
    return 
  end
  local r1_15 = r0_15.RangedWeapon:GetAttr("MagazineBulletNum")
  local r2_15 = r0_15.RangedWeapon:GetAttr("BulletNum")
  if r1_15 == 0 and r2_15 == 0 then
    r0_15.CurButtonState = "Forbidden"
    r0_15:ChangeLeftShootState()
    if not EMUIAnimationSubsystem:EMAnimationIsPlaying(r0_15, r0_15.Forbidden) then
      r0_15.Joystick:SetRenderOpacity(0)
      EMUIAnimationSubsystem:EMPlayAnimation(r0_15, r0_15.Forbidden)
    end
  elseif r1_15 == 0 then
    EMUIAnimationSubsystem:EMPlayAnimation(r0_15, r0_15.Normal)
    r0_15.CurButtonState = "ChangeMagazine"
    r0_15:ChangeLeftShootState()
    r0_15.ImageMat:SetScalarParameterValue("IconState", 1)
  else
    r0_15.ImageMat:SetScalarParameterValue("IconState", 2)
    r0_15.CurButtonState = "Normal"
    r0_15:ChangeLeftShootState()
    r0_15:StopAllAnimations()
    EMUIAnimationSubsystem:EMPlayAnimation(r0_15, r0_15.Normal)
    r0_15.Image_Main:SetRenderOpacity(1)
    if r0_15.IsFireDown then
      r0_15.Joystick:SetRenderOpacity(1)
    end
  end
end
function r1_0.ChangeLeftShootState(r0_16)
  -- line: [310, 315] id: 16
  if not r0_16.OwnerPanel.HasLeftShoot then
    return 
  end
  r0_16.OwnerPanel.AtkRangedLeft:UpdateRangeWeaponButtonByState(r0_16.CurButtonState)
end
function r1_0.CalcFinalAngle(r0_17, r1_17)
  -- line: [317, 332] id: 17
  local r2_17 = FVector2D(r1_17.X, -r1_17.Y)
  r2_17:Normalize()
  local r4_17 = math.asin(r2_17.X / 1) / math.pi
  local r5_17 = 0
  if r2_17.Y < 0 then
    if r2_17.X < 0 then
      r5_17 = -180 - r4_17 * 180
    else
      r5_17 = 180 - r4_17 * 180
    end
  else
    r5_17 = r4_17 * 180
  end
  return r5_17
end
AssembleComponents(r1_0)
return r1_0
