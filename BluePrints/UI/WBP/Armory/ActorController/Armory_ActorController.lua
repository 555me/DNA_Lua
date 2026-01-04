-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Armory\ActorController\Armory_ActorController.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local r1_0 = {
  _components = {
    "BluePrints.UI.WBP.Armory.ActorController.Armory_WeaponActorComponent",
    "BluePrints.UI.WBP.Armory.ActorController.Armory_PetActorComponent",
    "BluePrints.UI.WBP.Armory.ActorController.Armory_ActorAppearanceComponent",
    "BluePrints.UI.WBP.Armory.ActorController.Armory_SceneActorComponent",
    "BluePrints.UI.WBP.Armory.ActorController.Armory_CharActorComponent"
  },
}
local r2_0 = 0
local r3_0 = FHitResult()
function r1_0.CreateMount(r0_1, r1_1)
  -- line: [18, 28] id: 1
  local r2_1 = r0_1:GetPlayerActor()
  if not r2_1 then
    return 
  end
  local r3_1 = DataMgr.Mount[r1_1]
  if not r3_1.BattleMountId then
    return 
  end
  r2_1:EnableBattleMountOnDisplay(r3_1.BattleMountId)
end
function r1_0.HidePlayerOnMount(r0_2, r1_2)
  -- line: [30, 36] id: 2
  if not r0_2:GetPlayerActor() then
    return 
  end
  r0_2:HidePlayerActorOnDisplayMount("ActorController_HidePlayerBeforeMount", r1_2)
end
function r1_0.DestroyMount(r0_3)
  -- line: [38, 44] id: 3
  local r1_3 = r0_3:GetPlayerActor()
  if not r1_3 then
    return 
  end
  r1_3:DisableBattleMount(true)
end
function r1_0.SwitchArmoryCamera(r0_4, r1_4, r2_4)
  -- line: [46, 73] id: 4
  if not r0_4.ArmoryHelper then
    return 
  end
  local r3_4 = UE4.UGameplayStatics.GetPlayerCharacter(r0_4.ViewUI, 0)
  if not r3_4 then
    return 
  end
  if r1_4 then
    r0_4.ViewActor = r0_4.ArmoryPlayer and r0_4.ArmoryWeapon
    r0_4.ArmoryHelper:SetViewActor(r0_4.ViewActor)
    if r0_4.ArmoryPlayer then
      r0_4.PlayerOriginalRootTrans = r0_4.ArmoryPlayer.Mesh:K2_GetComponentToWorld()
      r0_4.ArmoryHelper.OriginalRootTrans = r0_4.PlayerOriginalRootTrans
      r0_4.ArmoryHelper:SetCameraStartTrans(r0_4:LoadOpenArmoryCameraInfo(r0_4.ArmoryPlayer), r3_4.CharCameraComponent.FieldOfView, r0_4.ArmoryPlayer)
    elseif not r0_4.ArmoryWeapon and r0_4.IsArmoryWeaponLoading then
    end
  else
    local r4_4, r5_4, r6_4, r7_4 = r0_4:LoadCloseArmoryCameraInfo()
    if not r2_4 then
      r2_4 = r7_4
    end
    r0_4.ArmoryHelper:RecorverCamera(nil, function()
      -- line: [68, 70] id: 5
      r0_4:OnRecorverCameraEnd()
    end, r2_4, r4_4, r5_4, r6_4)
  end
end
function r1_0.LoadOpenArmoryCameraInfo(r0_6, r1_6)
  -- line: [75, 93] id: 6
  local r2_6 = nil
  local r3_6 = r0_6:GetCameraData()["Char_" .. r1_6:GetBattleCharBodyType()]
  if r3_6 and DataMgr.GlobalConstant.ArmoryCameraX then
    local r4_6 = r0_6.ArmoryPlayer.Mesh:GetSocketTransform("Root", ERelativeTransformSpace.RTS_World)
    local r5_6 = FVector(r3_6.Location[1], r3_6.Location[2], r3_6.Location[3])
    local r6_6 = FRotator(r3_6.Rotation[2], r3_6.Rotation[3], r3_6.Rotation[1])
    r2_6 = FTransform()
    r2_6.Translation = UE4.UKismetMathLibrary.TransformLocation(r4_6, r5_6 + FVector(DataMgr.GlobalConstant.ArmoryCameraX.ConstantValue, DataMgr.GlobalConstant.ArmoryCameraY.ConstantValue, DataMgr.GlobalConstant.ArmoryCameraZ.ConstantValue))
    r2_6.Rotation = UKismetMathLibrary.FindLookAtRotation(r2_6.Translation, r4_6.Translation)
    r2_6.Rotation = UE4.UKismetMathLibrary.TransformRotation(r4_6, r6_6):ToQuat()
  else
    r2_6 = r1_6.CharCameraComponent:K2_GetComponentToWorld()
  end
  return r2_6
end
function r1_0.LoadCloseArmoryCameraInfo(r0_7)
  -- line: [95, 110] id: 7
  local r1_7 = nil
  local r2_7 = nil
  local r3_7 = nil
  local r4_7 = nil
  if DataMgr.GlobalConstant.ArmoryExitX then
    r1_7 = FTransform()
    local r5_7 = r0_7.ArmoryHelper.RecoverEndTransform and r1_7
    r2_7 = FVector(DataMgr.GlobalConstant.ArmoryExitX.ConstantValue, DataMgr.GlobalConstant.ArmoryExitY.ConstantValue, DataMgr.GlobalConstant.ArmoryExitZ.ConstantValue)
    r1_7.Translation = UE4.UKismetMathLibrary.TransformLocation(r5_7, r2_7)
    r1_7.Rotation = r5_7.Rotation
    if not r4_7 then
      r4_7 = DataMgr.GlobalConstant.ArmoryExitTime.ConstantValue
    end
    r2_7 = FVector(0, 0, 0)
    r3_7 = FRotator(0, 0, 0)
  end
  return r1_7, r2_7, r3_7, r4_7
end
function r1_0.OnHelperBecomeViewTarget(r0_8, r1_8)
  -- line: [112, 139] id: 8
  r0_8.IsControled = true
  if r0_8.OnFirstBecomeViewTarget then
    r0_8.OnFirstBecomeViewTarget()
    r0_8.OnFirstBecomeViewTarget = nil
    r0_8:HidePlayerActor("ActorController_ChangeViewTarget", false)
    r0_8:HideWeaponActor("ActorController_ChangeViewTarget", false)
    r0_8:HidePetActor("ActorController_ChangeViewTarget", false)
    r0_8:UpdateLighting()
    return 
  end
  for r6_8, r7_8 in pairs(r0_8.PlayerActorHideTags) do
    if r7_8 then
      r0_8:HidePlayerActor(r6_8, true, true)
    end
  end
  -- close: r2_8
  r0_8:HidePlayerActor("ActorController_ChangeViewTarget", false)
  r0_8:HideWeaponActor("ActorController_ChangeViewTarget", false)
  r0_8:HidePetActor("ActorController_ChangeViewTarget", false)
  if r0_8.ViewActorType == r0_8.ViewActorTypes.Player then
    r0_8:RecoverToPlayerActor()
  elseif r0_8.ViewActorType == r0_8.ViewActorTypes.SingleWeapon then
    r0_8:RecoverToSingleWeapon()
  end
  r0_8:UpdateLighting()
end
function r1_0.RecoverToPlayerActor(r0_9)
  -- line: [141, 177] id: 9
  local r1_9 = r0_9.LastCharModelInfo
  r0_9.LastCharModelInfo = nil
  if not r1_9 then
    return 
  end
  local r2_9 = nil
  if r0_9.IsProtagonist then
    r2_9 = r0_9:ChangeToProtagonist(true, true, true)
  else
    r2_9 = r0_9:ChangeCharModel(r1_9, true, true, true)
    if r0_9.LastCharAppearanceInfo then
      r0_9:ChangeCharAppearance(r0_9.LastCharAppearanceInfo)
    end
  end
  if r0_9.CurrentPetInfo then
    r0_9:ChangePetModel(r0_9.CurrentPetInfo)
  end
  if r0_9.LastArmoryPlayerLoc then
    r0_9.ArmoryPlayer:K2_SetActorLocation(r0_9.LastArmoryPlayerLoc, false, r3_0, false)
  end
  if r0_9.LastArmoryPlayerRot then
    r0_9.ArmoryPlayer:K2_SetActorRotation(r0_9.LastArmoryPlayerRot, false, r3_0, false)
  end
  if r0_9.CurrentWeaponInfo then
    r0_9:ChangeWeaponModel(r0_9.CurrentWeaponInfo)
    if r0_9.LastWeaponAppearanceInfo then
      r0_9:ChangeWeaponAppearance(r0_9.LastWeaponAppearanceInfo)
    end
  end
  r0_9.ArmoryHelper:OnRoleChanged()
  r0_9.bPlaySameMontage = true
  r0_9:SetArmoryMontageTag(r0_9.ArmoryPlayer, r0_9.CurMontageTag, r0_9.LastShowOrHideWeapon)
end
function r1_0.RecoverToSingleWeapon(r0_10)
  -- line: [179, 186] id: 10
  if r0_10.CurrentWeaponInfo then
    r0_10:ChangeWeaponModel(r0_10.CurrentWeaponInfo, nil, true, true)
    if r0_10.LastWeaponAppearanceInfo then
      r0_10:ChangeWeaponAppearance(r0_10.LastWeaponAppearanceInfo)
    end
  end
end
function r1_0.OnHelperEndViewTarget(r0_11, r1_11)
  -- line: [188, 208] id: 11
  r0_11.IsControled = false
  r0_11.LastCharModelInfo = r0_11.CurrentCharInfo
  r0_11.LastCharAppearanceInfo = r0_11.CurrentAppearanceInfo
  r0_11.LastWeaponAppearanceInfo = r0_11.CurrentWeaponAppearanceInfo
  if r0_11.bDestructed then
    return 
  end
  for r6_11, r7_11 in pairs(r0_11.PlayerActorHideTags) do
    if r7_11 then
      r0_11:HidePlayerActor(r6_11, false, true)
    end
  end
  -- close: r2_11
  r0_11:HidePlayerActor("ActorController_ChangeViewTarget", true)
  r0_11:HideWeaponActor("ActorController_ChangeViewTarget", true)
  r0_11:HidePetActor("ActorController_ChangeViewTarget", true)
  if IsValid(r0_11.ArmoryPlayer) and r0_11.CurrentCharInfo then
    r0_11.LastArmoryPlayerLoc = r0_11.ArmoryPlayer:K2_GetActorLocation()
    r0_11.LastArmoryPlayerRot = r0_11.ArmoryPlayer:K2_GetActorRotation()
  end
end
function r1_0.OnOpened(r0_12, r1_12)
  -- line: [211, 271] id: 12
  local r3_12 = UE4.UGameplayStatics.GetGameInstance(r0_12.ViewUI):GetGameUIManager()
  if not IsValid(r0_12.ArmoryHelper) then
    r0_12.ArmoryHelper = r3_12:CreateUIActorCameraHelper(UE4.UGameplayStatics.GetPlayerCharacter(r0_12.ViewUI, 0))
  end
  if IsValid(r0_12.ArmoryHelper) then
    r0_12.ArmoryHelper:BindViewTargetEvents({
      OnBecomeViewTarget = r0_12.OnHelperBecomeViewTarget,
      OnEndViewTarget = r0_12.OnHelperEndViewTarget,
    }, r0_12)
    r0_12:UpdateCameraPPSetting()
    r0_12.ArmoryHelper.ArchivePreview = false
    r0_12.ArmoryHelper.PersonalPreview = false
    if r0_12.EPreviewSceneType == CommonConst.EPreviewSceneType.PreviewArmory then
      r0_12.ArmoryHelper.ArchivePreview = true
    elseif r0_12.EPreviewSceneType == CommonConst.EPreviewSceneType.PersonInfo then
      r0_12.ArmoryHelper.PersonalPreview = true
    end
  end
  local r4_12 = UE4.UGameplayStatics.GetPlayerCharacter(r0_12.ViewUI, 0)
  if not r4_12 then
    return 
  end
  r0_12:TryLoadPreviewScene()
  r0_12.UncalculatedTrans = r0_12.PreviewSceneTrans and r4_12:GetTransform()
  local r5_12 = UKismetMathLibrary.MakeTransform(r0_12.UncalculatedTrans.Translation, FRotator(0), FVector(1))
  r5_12.Translation.Z = r5_12.Translation.Z + 90
  r5_12.Translation.Y = r5_12.Translation.Y + 90
  r5_12.Rotation = r0_12.UncalculatedTrans.Rotation
  r0_12.ArmoryHelper:K2_SetActorTransform(r5_12, false, nil, false)
  r0_12:HideRealPlayer(true)
  r0_12.OpenDuration = r1_12
  function r0_12.OnFirstBecomeViewTarget()
    -- line: [259, 261] id: 13
    r0_12:InitActors()
  end
  if r0_12.ArmoryHelper then
    UE4.UGameplayStatics.GetPlayerController(r0_12.ViewUI, 0):SetViewTargetWithBlend(r0_12.ArmoryHelper, 0, UE4.EViewTargetBlendFunction.VTBlend_Linear, 0, false)
  end
  local r6_12 = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(r0_12.ViewUI, UE4.UFXPriorityManager)
  if r6_12 then
    r6_12.SetFXTickEvenPaused(r0_12.ViewUI, r0_12.UIName, true)
  end
  GWorld.GameInstance:SetDynamicResolution(r0_12.UIName, true)
end
function r1_0.InitActors(r0_14)
  -- line: [273, 283] id: 14
  if r0_14.CurrentCharInfo then
    r0_14:GetPlayerActor(true)
  elseif r0_14.CurrentWeaponInfo then
    r0_14:SetSingleWeaponCameraStartInfo(r0_14.CurrentWeaponInfo)
    r0_14:ChangeSingleWeapon(r0_14.CurrentWeaponInfo, true)
  elseif r0_14.CurrentPetInfo then
    r0_14:ChangeToProtagonist(true)
  end
  r0_14:SwitchArmoryCamera(true, r0_14.OpenDuration)
end
function r1_0.HideRealPlayer(r0_15, r1_15)
  -- line: [285, 299] id: 15
  local r2_15 = UE4.UGameplayStatics.GetPlayerCharacter(r0_15.ViewUI, 0)
  if not r2_15 then
    return 
  end
  r2_15:SetActorHideTag(r0_15.UIName, r1_15)
  r2_15.CharCameraComponent:SetComponentTickEnabled(not r1_15)
  if r0_15.IsCharActorFistCreated then
    local r3_15 = UIManager(r0_15.ViewUI)
    r3_15:HideOrShowPlayerFX(r2_15, r1_15, r0_15.UIName)
    if r0_15.ArmoryPlayer and r0_15.IsCharActorFistCreated then
      r3_15:SetTargetActorState(r1_15, r0_15.ArmoryPlayer, r0_15.UIName)
    end
  end
end
function r1_0.CalcArmoryCameraTag(r0_16, r1_16, r2_16, r3_16, r4_16)
  -- line: [301, 361] id: 16
  local r5_16 = ""
  local r6_16 = ""
  local r7_16 = ""
  local r8_16 = ""
  if r0_16.ViewUI.IsListExpanded then
    r7_16 = "Switch"
  end
  r7_16 = r4_16
  if r7_16 then
    r7_16 = r7_16
  end
  if r1_16 == CommonConst.ArmoryType.Char then
    r5_16 = r1_16
    r6_16 = r3_16
    if r3_16 == CommonConst.ArmoryType.Mod then
      r7_16 = nil
    elseif r3_16 == CommonConst.ArmoryTag.Appearance then
      if not r2_16 or r2_16 == CommonConst.ArmoryType.Char then
        r6_16 = r3_16
      else
        r6_16 = r2_16
        r7_16 = r4_16 and ""
      end
    elseif r3_16 == CommonConst.ArmoryTag.Files then
      r6_16 = r3_16
    elseif r3_16 == CommonConst.ArmoryTag.Char then
      r6_16 = nil
    end
  elseif r1_16 == CommonConst.ArmoryType.Weapon then
    r5_16 = r1_16
    if r2_16 and string.find(r2_16, CommonConst.ArmoryTag.UWeapon) then
      r6_16 = "Ultra"
      if r3_16 == CommonConst.ArmoryType.Mod then
        r7_16 = r3_16
      end
      r8_16 = r0_16.ArmoryPlayer.CurrentRoleId
    elseif r3_16 == CommonConst.ArmoryType.Mod then
      r6_16 = r3_16
      r7_16 = nil
    elseif r3_16 == CommonConst.ArmoryTag.Grade then
      r6_16 = r0_16.ArmoryPlayer.PlayerAnimInstance.IdleTag
      r7_16 = r3_16
    else
      r6_16 = r0_16.ArmoryPlayer.PlayerAnimInstance.IdleTag
    end
    if r3_16 == CommonConst.ArmoryTag.Appearance then
      r7_16 = "Color"
    end
  elseif r1_16 == CommonConst.ArmoryType.Pet then
    local r9_16 = GWorld:GetAvatar()
    if not r9_16 then
      r9_16 = {}
      r9_16.Sex = 1
    end
    if r9_16.Sex == 1 then
      r5_16 = "Nvzhu"
    else
      r5_16 = "Nanzhu"
    end
    if r3_16 == "Entry" then
      r6_16 = r3_16
    end
    r8_16 = r1_16
  else
    r5_16 = CommonConst.ArmoryType.Char
  end
  return r5_16, r6_16, r7_16, r8_16
end
function r1_0.CalcArmoryMontageTag(r0_17, r1_17, r2_17, r3_17)
  -- line: [363, 400] id: 17
  local r4_17 = nil
  local r5_17 = nil
  if r1_17 == CommonConst.ArmoryType.Char then
    if r3_17 == CommonConst.ArmoryType.Mod then
      r5_17 = Const.ArmoryIdleTags.Armory_Mod
      r4_17 = false
    elseif r3_17 == CommonConst.ArmoryTag.Grade then
      r5_17 = Const.ArmoryIdleTags.Armory_Grade
    elseif r3_17 == CommonConst.ArmoryTag.Appearance then
      if r2_17 and r2_17 ~= CommonConst.ArmoryType.Char then
        r5_17 = Const.ArmoryIdleTags.None
      else
        r5_17 = Const.ArmoryIdleTags.Armory
      end
    else
      r5_17 = Const.ArmoryIdleTags.Armory
    end
  elseif r1_17 == CommonConst.ArmoryType.Weapon then
    if r3_17 == CommonConst.ArmoryType.Mod then
      r5_17 = Const.ArmoryIdleTags.Armory_Mod
      if r2_17 and string.find(r2_17, CommonConst.ArmoryTag.UWeapon) then
        r4_17 = false
      else
        r4_17 = true
      end
    elseif r2_17 and string.find(r2_17, CommonConst.ArmoryTag.UWeapon) then
      r5_17 = "Ultra"
    else
      r5_17 = r2_17
    end
  elseif r1_17 == CommonConst.ArmoryType.Pet then
    r5_17 = Const.ArmoryIdleTags.Armory_Pet
  else
    r5_17 = Const.ArmoryIdleTags.Armory_Mod
  end
  return r5_17, r4_17
end
function r1_0.SetMontageAndCamera(r0_18, r1_18, r2_18, r3_18, r4_18)
  -- line: [403, 430] id: 18
  if not IsValid(r0_18.ViewUI) then
    return 
  end
  if not r0_18.ArmoryPlayer then
    return 
  end
  local r5_18 = r0_18.ArmoryPlayer
  r0_18.LastMontageAndCameraType = r1_18
  r0_18.LastMontageAndCameraTag = r2_18
  r0_18.LastMontageAndCameraBehavior = r3_18
  r0_18.LastExtraTag = r4_18
  if r0_18.DelayFrame and r0_18.DelayFrame > 0 then
    r5_18:SetArmoryTag("None")
    r0_18:HidePlayerActor(r0_18.UIName, true)
    r0_18.LastMontageTag, r0_18.bShowOrHideWeapon = r0_18:CalcArmoryMontageTag(r0_18.LastMontageAndCameraType, r0_18.LastMontageAndCameraTag, r0_18.LastMontageAndCameraBehavior)
    r0_18:PlayDisappearFX(r5_18.FXComponent, function()
      -- line: [419, 426] id: 19
      if r0_18.bClosed or r0_18.bDestructed or not r0_18.IsControled then
        return 
      end
      r0_18:PlayAppearFX(r5_18.FXComponent)
      r0_18:HidePlayerActor(r0_18.UIName, false)
      r0_18:RealPlayMontageAndCamera(r5_18, r0_18.LastMontageTag, r0_18.bShowOrHideWeapon, r0_18.LastDelayCameraTags)
    end)
  else
    r0_18:RealPlayMontageAndCamera(r5_18)
  end
end
function r1_0.PlayDisappearFX(r0_20, r1_20, r2_20)
  -- line: [432, 464] id: 20
  local r3_20 = r0_20.DelayFrame
  r0_20.DelayFrame = nil
  local r4_20 = r0_20.DisappearFXPlaying
  r0_20.bWatingForDelayFrame = true
  if r1_20 and not r4_20 and not r0_20.bNoDisappearFX then
    AudioManager(r0_20.ViewUI):PlayUISound(r0_20.ViewUI, "event:/ui/common/role_disappear", nil, nil)
    local r5_20 = {
      bTickEvenWhenPaused = true,
      NotAttached = true,
    }
    if r0_20.bPreviewSceneLoaded then
      r5_20.UseAbsoluteLocation = true
      local r6_20 = r0_20:GetPreviewSceneTrans().Translation
      r5_20.Location = {
        r6_20.X,
        r6_20.Y,
        r6_20.Z
      }
    end
    r1_20:PlayEffectByIDParams(302, r5_20)
    r0_20.DisappearFXPlaying = true
  end
  if r4_20 then
    return 
  end
  r0_20.LTweenHandle_PlayDisappearFX = UE4.ULTweenBPLibrary.DelayFrameCall(r0_20.ViewUI, r3_20 and 0, function()
    -- line: [451, 459] id: 21
    r0_20.LTweenHandle_PlayDisappearFX = nil
    r0_20.DisappearFXPlaying = false
    r0_20.bWatingForDelayFrame = false
    r0_20.bNoDisappearFX = false
    if r2_20 then
      r2_20()
    end
  end)
  local r5_20 = UE4.ALTweenActor.GetLTweenInstance(r0_20.LTweenHandle_PlayDisappearFX)
  if r5_20 then
    r5_20:SetTickableWhenPaused(true)
  end
end
function r1_0.PlayAppearFX(r0_22, r1_22)
  -- line: [466, 477] id: 22
  if r1_22 and not r0_22.bNoDisappearFX then
    AudioManager(r0_22.ViewUI):PlayUISound(r0_22.ViewUI, "event:/ui/common/role_appear", nil, nil)
    local r2_22 = {
      bTickEvenWhenPaused = true,
      NotAttached = true,
    }
    if r0_22.bPreviewSceneLoaded then
      r2_22.UseAbsoluteLocation = true
      local r3_22 = r0_22.PreviewSceneTrans.Translation
      r2_22.Location = {
        r3_22.X,
        r3_22.Y,
        r3_22.Z
      }
    end
    r1_22:PlayEffectByIDParams(301, r2_22)
  end
end
function r1_0.RealPlayMontageAndCamera(r0_23, r1_23, r2_23, r3_23, r4_23)
  -- line: [479, 492] id: 23
  if r2_23 == nil then
    r2_23, r3_23 = r0_23:CalcArmoryMontageTag(r0_23.LastMontageAndCameraType, r0_23.LastMontageAndCameraTag, r0_23.LastMontageAndCameraBehavior)
  end
  r0_23:SetArmoryMontageTag(r1_23, r2_23, r3_23)
  if r4_23 then
    r0_23:SetArmoryCameraTag(table.unpack(r4_23))
  else
    local r5_23 = {
      r0_23:CalcArmoryCameraTag(r0_23.LastMontageAndCameraType, r0_23.LastMontageAndCameraTag, r0_23.LastMontageAndCameraBehavior, r0_23.LastExtraTag)
    }
    if next(r5_23) then
      r0_23:SetArmoryCameraTag(table.unpack(r5_23))
    end
  end
end
function r1_0.ResetActorRotation(r0_24)
  -- line: [495, 501] id: 24
  r0_24.ArmoryHelper:ResetRotation()
  local r1_24 = r0_24:GetPetActor()
  if r1_24 and r1_24.SkeletalMesh then
    r1_24.SkeletalMesh:K2_SetRelativeRotation(FRotator(0, 0, 0), false, nil, false)
  end
end
function r1_0.BindEvent(r0_25, r1_25, r2_25)
  -- line: [503, 508] id: 25
  if not r2_25 then
    r2_25 = {}
  end
  r0_25.EventObj = r1_25
  r0_25.OnPlayPetFresnel = r2_25.OnPlayPetFresnel
  r0_25.OnCharModelChanged = r2_25.OnCharModelChanged
end
function r1_0.SetArmoryMontageTag(r0_26, r1_26, r2_26, r3_26)
  -- line: [511, 565] id: 26
  r0_26.bShowOrHideWeapon = r3_26
  if not r2_26 then
    r2_26 = "None"
  end
  r0_26.LastMontageTag = r2_26
  if r0_26.bWatingForDelayFrame then
    return 
  end
  local r4_26 = true
  if r0_26.LastMontageTag == r0_26.CurMontageTag and not r0_26.bPlaySameMontage then
    r4_26 = false
  end
  if r4_26 then
    r0_26:ResetActorRotation()
    r0_26.bPlaySameMontage = false
    r0_26.CurMontageTag = r2_26
    r1_26.UsingWeapon = nil
    if r2_26 == "Ultra" and not r1_26:GetWeaponByWeaponTag(r2_26, 1) then
      r0_26:AddPlayerUltraWeapons(r1_26)
    end
    r1_26:SetArmoryTag(r2_26)
  end
  r0_26.LastShowOrHideWeapon = r0_26.bShowOrHideWeapon
  if r0_26.bShowOrHideWeapon == true then
    r0_26:ChangePlayerWeaponByType(r0_26.LastMontageAndCameraTag, r1_26)
    if r1_26.UsingWeapon then
      r1_26:UnBindWeaponFromHand()
    end
  elseif r0_26.bShowOrHideWeapon == false then
    r0_26:ChangePlayerWeaponByType(nil, r1_26)
  end
  if r0_26.bPlayRoleChangedSound and r2_26 == Const.ArmoryIdleTags.Armory then
    AudioManager(r0_26.ViewUI):PlayFMODSoundByID(r1_26, 213, r1_26, "None", {
      bFollowSocket = true,
      bPlayAs2D = true,
      EventKey = "ArmoryRoleVoice",
    })
  end
  r0_26.bPlayRoleChangedSound = false
  if r4_26 or r0_26.bShowOrHideWeapon then
    CommonUtils:SetActorTickableWhenPaused(r1_26, true)
    if r1_26.MeleeWeapon then
      CommonUtils:SetActorTickableWhenPaused(r1_26.MeleeWeapon, true)
      r0_26:SetAccessoriesTickableWhenPaused(r1_26.MeleeWeapon.Accessories)
    end
    if r1_26.RangedWeapon then
      CommonUtils:SetActorTickableWhenPaused(r1_26.RangedWeapon, true)
      r0_26:SetAccessoriesTickableWhenPaused(r1_26.RangedWeapon.Accessories)
    end
    if r1_26.UltraWeapon then
      CommonUtils:SetActorTickableWhenPaused(r1_26.UltraWeapon, true)
      r0_26:SetAccessoriesTickableWhenPaused(r1_26.UltraWeapon.Accessories)
    end
  end
end
function r1_0.SetAccessoriesTickableWhenPaused(r0_27, r1_27)
  -- line: [567, 573] id: 27
  if r1_27 then
    for r6_27, r7_27 in pairs(r1_27) do
      CommonUtils:SetActorTickableWhenPaused(r7_27, true)
    end
    -- close: r2_27
  end
end
function r1_0.SetExCameraOffset(r0_28, r1_28)
  -- line: [576, 578] id: 28
  r0_28.ExCameraOffset = r1_28
end
function r1_0.SetArmoryCameraTag(r0_29, r1_29, r2_29, r3_29, r4_29)
  -- line: [585, 715] id: 29
  DebugPrint("gmy@Armory_ActorController M:SetArmoryCameraTag", r1_29, r2_29, r3_29, r4_29)
  local r5_29 = {}
  local r6_29 = r1_29 and ""
  local r7_29 = r2_29 and ""
  local r8_29 = r3_29 and ""
  local r9_29 = r4_29 and ""
  -- setlist for #5 failed
  r0_29.LastCameraTags = r5_29
  if r0_29.bWatingForDelayFrame then
    r5_29 = {}
    r6_29 = r1_29 and ""
    r7_29 = r2_29 and ""
    r8_29 = r3_29 and ""
    r9_29 = r4_29 and ""
    -- setlist for #5 failed
    r0_29.LastDelayCameraTags = r5_29
    return 
  end
  r0_29.LastDelayCameraTags = nil
  if r0_29.ArmoryPlayer then
    if not r1_29 then
      r1_29 = ""
    end
    if r2_29 == "0" then
      r2_29 = "_" .. r0_29.ArmoryPlayer.PlayerAnimInstance.IdleTag
      if r2_29 then
        ::label_59::
        if r2_29 and r2_29 ~= "" then
          r2_29 = "_" .. r2_29 and ""
        else
          goto label_68	-- block#26 is visited secondly
        end
      end
    else
      goto label_59	-- block#23 is visited secondly
    end
    if r3_29 and r3_29 ~= "" then
      r3_29 = "_" .. r3_29 and ""
    else
      goto label_78	-- block#30 is visited secondly
    end
    if r4_29 and r4_29 ~= "" then
      r4_29 = "_" .. r4_29 and "_" .. r0_29.ArmoryPlayer:GetBattleCharBodyType()
    else
      goto label_88	-- block#34 is visited secondly
    end
  elseif not r0_29.ArmoryPlayer and r0_29.ArmoryWeapon then
    if not r1_29 then
      r1_29 = ""
    end
    if not r2_29 then
      r2_29 = ""
    end
    if not r3_29 then
      r3_29 = ""
    end
    if not r4_29 then
      r4_29 = ""
    end
  end
  r5_29 = r1_29 .. r2_29 .. r3_29 .. r4_29
  DebugPrint("gmy@Armory_ActorController M:SetArmoryCameraTag111", r5_29)
  r6_29 = r0_29:GetCameraData()[r5_29]
  if not r6_29 then
    r5_29 = "Default"
    r6_29 = r0_29:GetCameraData()[r5_29]
  end
  r7_29 = FVector(r6_29.Location[1], r6_29.Location[2], r6_29.Location[3])
  r8_29 = FRotator(r6_29.Rotation[2], r6_29.Rotation[3], r6_29.Rotation[1])
  r9_29 = FVector(0, 0, 0)
  local r10_29 = FRotator(0, 0, 0)
  local r11_29 = r0_29.ArmoryPlayer
  if r11_29 then
    r11_29 = r0_29.ArmoryPlayer.CurrentRoleId and r0_29.ArmoryWeapon.WeaponId
  else
    goto label_164	-- block#49 is visited secondly
  end
  if r6_29.LocationOffset then
    local r12_29 = r6_29.LocationOffset[r11_29]
    if r12_29 then
      r9_29 = FVector(r12_29[1], r12_29[2], r12_29[3])
    end
  end
  if r6_29.RotationOffset then
    local r12_29 = r6_29.RotationOffset[r11_29]
    if r12_29 then
      r10_29 = r10_29 + FRotator(r12_29[2], r12_29[3], r12_29[1])
    end
  end
  if CommonUtils.GetDeviceTypeByPlatformName(r0_29.ViewUI) == "Mobile" then
    local r12_29 = nil
    if r6_29.MobileLocationOffset then
      r12_29 = r6_29.MobileLocationOffset[r11_29] and r6_29.MobileLocationOffset[0]
    end
    if r12_29 then
      r9_29 = r9_29 + FVector(r12_29[1], r12_29[2], r12_29[3])
    end
    local r13_29 = nil
    if r6_29.MobileRotationOffset and r6_29.MobileRotationOffset[r11_29] then
      r12_29 = r6_29.MobileRotationOffset[0]
    end
    if r13_29 then
      r10_29 = r10_29 + FRotator(r13_29[2], r13_29[3], r13_29[1])
    end
  end
  if r6_29.AccessoryLocationOffset and r0_29.CameraOffsetAccessoryId then
    local r12_29 = r6_29.AccessoryLocationOffset[r0_29.CameraOffsetAccessoryId]
    if r12_29 then
      r9_29 = r9_29 + FVector(r12_29[1], r12_29[2], r12_29[3])
    end
  end
  r0_29.CameraOffsetAccessoryId = nil
  r0_29.LastExCameraOffset = r0_29.ExCameraOffset
  if r0_29.ExCameraOffset then
    r9_29 = r9_29 + r0_29.ExCameraOffset
    r0_29.ExCameraOffset = nil
  end
  r7_29 = r7_29 + r9_29
  r8_29 = r8_29 + r10_29
  local r12_29 = r0_29._FixedCameraTransTimeOnce and r6_29.Time and 0
  r0_29._FixedCameraTransTimeOnce = nil
  local r13_29, r14_29 = r0_29.ArmoryHelper:TransformCamera(r7_29, r8_29, r12_29, r6_29.Ease)
  local r15_29 = r6_29.ForwardLocation
  local r16_29 = r6_29.BackwardLocation
  if r15_29 or r16_29 then
    if r15_29 then
      r15_29 = FVector(r15_29[1], r15_29[2], r15_29[3])
    else
      r15_29 = r7_29
    end
    if r16_29 then
      r16_29 = FVector(r16_29[1], r16_29[2], r16_29[3])
    else
      r16_29 = r7_29
    end
    r0_29.ArmoryHelper:SetCameraScrollRange(r15_29 + r9_29, r16_29 + r9_29, 0.5, r6_29.Ease)
    r0_29.ArmoryHelper.EnableCameraScrolling = true
  else
    r0_29.ArmoryHelper.EnableCameraScrolling = false
  end
  r0_29.ArmoryHelper:StartFOVAnim(CommonUtils:FocalLengthToFOV(r6_29.CameraFocal and 22), r12_29, r6_29.Ease)
  if r0_29.bPreviewSceneLoaded and r0_29.EPreviewSceneType == CommonConst.EPreviewSceneType.PreviewCommon then
    r0_29:StartPreviewBGAnimation(r6_29.PreviewBGPos, r12_29)
  end
  if r5_29 ~= "Default" then
    if r0_29.LastApplyCameraTag and r0_29.LastApplyCameraTag ~= r5_29 and r13_29 then
      local r18_29 = (r13_29 - r14_29):Size()
      if r18_29 > 150 then
        AudioManager(r0_29.ViewUI):StopSound(r0_29.ArmoryHelper, "ArmoryCameraMoveShort")
        AudioManager(r0_29.ViewUI):PlayUISound(r0_29.ArmoryHelper, "event:/ui/common/whoosh_cam_move_long", "ArmoryCameraMoveLong", nil)
      elseif r18_29 > 1 then
        AudioManager(r0_29.ViewUI):StopSound(r0_29.ArmoryHelper, "ArmoryCameraMoveLong")
        AudioManager(r0_29.ViewUI):PlayUISound(r0_29.ArmoryHelper, "event:/ui/common/whoosh_cam_move_short", "ArmoryCameraMoveShort", nil)
      end
    end
    r0_29.LastApplyCameraTag = r5_29
  end
end
function r1_0.FixedCameraTransTimeOnce(r0_30, r1_30)
  -- line: [718, 720] id: 30
  r0_30._FixedCameraTransTimeOnce = r1_30
end
function r1_0.UpdateCameraPPSetting(r0_31, r1_31)
  -- line: [723, 740] id: 31
  if not r0_31.ViewUI then
    return 
  end
  if not r1_31 then
    r1_31 = {}
  end
  r0_31.ViewUI:AddTimer(0.1, function()
    -- line: [728, 739] id: 32
    r0_31.ArmoryHelper:ClearPPSetting()
    if r1_31.IsAccessoryPPSetting then
      r0_31.ArmoryHelper:OnOpenAccessory()
    elseif r0_31.EPreviewSceneType == CommonConst.EPreviewSceneType.PreviewArmory then
      r0_31.ArmoryHelper:UpdatePPSetting(1)
    elseif r0_31.EPreviewSceneType == CommonConst.EPreviewSceneType.PreviewCommon then
      r0_31.ArmoryHelper:UpdatePPSetting(2)
    else
      r0_31.ArmoryHelper:UpdatePPSetting(0)
    end
  end, false, 0, "DelayUpdateCameraPPSetting", true)
end
local r4_0 = DataMgr.SystemUI
local r5_0 = {
  [r4_0.ArmoryMain.UIName] = DataMgr.ArmoryCameraData,
  [r4_0.ArmoryDetail.UIName] = DataMgr.ArmoryCameraData,
  [r4_0.PersonInfoPageMain.UIName] = DataMgr.PersonalPageCameraData,
  [r4_0.SquadMainUI.UIName] = DataMgr.SquadCameraData,
  [r4_0.BattlePassMain.UIName] = DataMgr.BattlePassCameraData,
  [r4_0.BattlePassPurchase.UIName] = DataMgr.BattlePassCameraData,
  [r4_0.CharSkinPreview.UIName] = DataMgr.BattlePassCameraData,
  [r4_0.SkinPreview.UIName] = DataMgr.SkinPreviewCameraData,
  [r4_0.GuildWarRank.UIName] = DataMgr.GuildWarRankCameraData,
  [r4_0.ShopMain.UIName] = DataMgr.RecommendCameraData,
  [r4_0.MountsMain.UIName] = DataMgr.MountCameraData,
}
function r1_0.GetCameraData(r0_33)
  -- line: [758, 763] id: 33
  if r5_0[r0_33.UIName] then
    return r5_0[r0_33.UIName]
  end
  return DataMgr.ArmoryCameraData
end
function r1_0.OnDragging(r0_34, r1_34)
  -- line: [766, 775] id: 34
  local r2_34 = r0_34:GetPetActor()
  if r2_34 and r2_34.SkeletalMesh then
    if not r1_34 then
      r1_34 = {
        X = 0,
      }
    end
    r2_34.SkeletalMesh:K2_AddRelativeRotation(FRotator(0, math.clamp(-r1_34.X, -20, 20), 0), false, nil, false)
  else
    r0_34.ArmoryHelper:OnDragging(r1_34)
  end
end
function r1_0.OnScrolling(r0_35, r1_35)
  -- line: [778, 780] id: 35
  r0_35.ArmoryHelper:OnScrolling(r1_35)
end
function r1_0.OnRecorverCameraEnd(r0_36)
  -- line: [783, 788] id: 36
  r0_36:BeforeDestruct()
  if r0_36.Event_OnRecorverCameraEnd then
    r0_36.Event_OnRecorverCameraEnd.Func(r0_36.Event_OnRecorverCameraEnd.Obj)
  end
end
function r1_0.BeforeDestruct(r0_37)
  -- line: [790, 791] id: 37
end
function r1_0.OnClosed(r0_38)
  -- line: [794, 801] id: 38
  if r0_38.bClosed then
    return 
  end
  r0_38.bClosed = true
  r0_38:RecoverCamera()
  r0_38:OnClosed_Implementation()
end
function r1_0.OnClosed_Implementation(r0_39)
  -- line: [803, 816] id: 39
  try({
    exec = function()
      -- line: [805, 809] id: 40
      r0_39:ChangeRealPlayerInfo()
      r0_39:HideRealPlayer(false)
      r0_39:Component_OnClosed()
    end,
    catch = function(r0_41)
      -- line: [810, 814] id: 41
      local r1_41 = debug.traceback()
      if not r0_41 then
        r0_41 = ""
      end
      DebugPrint("Error:" .. "\n" .. r1_41)
    end,
  })
end
function r1_0.Component_OnClosed(r0_42)
  -- line: [818, 819] id: 42
end
function r1_0.RecoverCamera(r0_43)
  -- line: [821, 830] id: 43
  if not r0_43.bNeedEndCamera then
    r0_43:SwitchArmoryCamera(false, 0)
  else
    if r0_43.Event_OnRecorverCameraStart then
      r0_43.Event_OnRecorverCameraStart.Func(r0_43.Event_OnRecorverCameraStart.Obj)
    end
    r0_43:SwitchArmoryCamera(false, nil)
  end
end
function r1_0.OnDestruct(r0_44)
  -- line: [833, 857] id: 44
  if r0_44.bDestructed then
    return 
  end
  r2_0 = r2_0 + -1
  GWorld.GameInstance:SetDynamicResolution(r0_44.UIName, false)
  r0_44.bDestructed = true
  if not r0_44.bClosed then
    r0_44:OnClosed_Implementation()
  end
  EventManager:RemoveEvent(EventID.OnWindowResized, r0_44)
  r0_44:Component_OnDestruct()
  r0_44.ArmoryHelper:DestroyViewActorIfNeed()
  if r0_44.LTweenHandle_PlayDisappearFX and IsValid(r0_44.LTweenHandle_PlayDisappearFX) and IsValid(r0_44.ViewUI) then
    ULTweenBPLibrary.KillIfIsTweening(r0_44.ViewUI, r0_44.LTweenHandle_PlayDisappearFX, false)
  end
  if IsValid(r0_44.ArmoryHelper) then
    r0_44.ArmoryHelper:K2_DestroyActor()
  end
  local r1_44 = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(r0_44.ViewUI, UE4.UFXPriorityManager)
  if r1_44 then
    r1_44.SetFXTickEvenPaused(r0_44.ViewUI, r0_44.UIName, false)
  end
  r0_44.ViewUI = nil
end
function r1_0.Component_OnDestruct(r0_45)
  -- line: [859, 860] id: 45
end
function r1_0.ViewTarget(r0_46)
  -- line: [862, 868] id: 46
  if not IsValid(r0_46.ArmoryHelper) then
    return 
  end
  UE4.UGameplayStatics.GetPlayerController(r0_46.ArmoryHelper, 0):SetViewTargetWithBlend(r0_46.ArmoryHelper, 0, UE4.EViewTargetBlendFunction.VTBlend_Linear, 0, false)
end
function r1_0.GetViewTarget(r0_47)
  -- line: [870, 872] id: 47
  return r0_47.ArmoryHelper
end
function r1_0.SetAvatar(r0_48, r1_48)
  -- line: [874, 876] id: 48
  r0_48.Avatar = r1_48
end
function r1_0.GetAvatar(r0_49)
  -- line: [878, 880] id: 49
  return r0_49.Avatar
end
function r1_0.DestoryCreature(r0_50, r1_50)
  -- line: [882, 887] id: 50
  if r0_50.Creatures[r1_50] then
    r0_50.Creatures[r1_50]:DestroyEffectCreature()
    r0_50.Creatures[r1_50] = nil
  end
end
function r1_0.Init(r0_51, r1_51)
  -- line: [889, 940] id: 51
  if not r1_51 then
    r1_51 = {}
  end
  r0_51.Params = r1_51
  r0_51.ViewUI = r1_51.ViewUI
  r0_51.IsPreviewMode = r1_51.IsPreviewMode
  r0_51.EPreviewSceneType = r1_51.EPreviewSceneType
  r0_51.PreviewSceneLocation = r1_51.PreviewSceneLocation
  r0_51.SkyBoxColor = r1_51.SkyBoxColor
  r0_51.bNeedEndCamera = r1_51.bNeedEndCamera
  r0_51.Avatar = r1_51.Avatar and r0_0:GetAvatar()
  r0_51.CurrentCharInfo = r1_51.Char
  r0_51.CurrentWeaponInfo = r1_51.Weapon
  r0_51.CurrentPetInfo = r1_51.Pet
  r0_51.Event_OnRecorverCameraStart = r1_51.OnRecorverCameraStart
  r0_51.Event_OnRecorverCameraEnd = r1_51.OnRecorverCameraEnd
  r0_51.SmoothLoad = r1_51.SmoothLoad and false
  r0_51.ViewActorTypes = {
    Player = 1,
    SingleWeapon = 2,
  }
  r0_51.Creatures = {}
  r0_51.IsSecondary = r2_0 > 1
  r0_51.UIName = r0_51.ViewUI:GetUIConfigName()
  if r1_51.bPlayRoleChangedSound ~= nil then
    r0_51.bPlayRoleChangedSound = r1_51.bPlayRoleChangedSound
  else
    r0_51.bPlayRoleChangedSound = true
  end
  if r0_51.CurrentPetInfo then
    local r4_51, r5_51 = next(r0_0:CreateNewDummyAvatar(r0_0.PreviewTargetStates.Prime, {
      CharIds = {
        DataMgr.Player2RoleId.Player[r0_51.Avatar.Sex]
      },
    }).Chars)
    r0_51.CurrentCharInfo = r5_51
  end
  EventManager:AddEvent(EventID.OnWindowResized, r0_51, function(r0_52)
    -- line: [921, 928] id: 52
    r0_52.ViewUI:AddTimer(0.3, function()
      -- line: [923, 927] id: 53
      if r0_52.LastCameraTags then
        r0_52:SetArmoryCameraTag(table.unpack(r0_52.LastCameraTags))
      end
    end, false, 0, "DelayUpdateCamera", true)
  end)
  if r0_51.IsPreviewMode or r0_51.IsSecondary then
    return 
  end
  if not UE4.UGameplayStatics.GetPlayerCharacter(r0_51.ViewUI, 0) then
    return 
  end
  print(_G.LogtTag, "Player:RemoveSyncUsingWeapon()")
end
function r1_0.New(r0_54, r1_54)
  -- line: [943, 950] id: 54
  r2_0 = r2_0 + 1
  local r2_54 = {}
  r0_54.__index = r0_54
  setmetatable(r2_54, r0_54)
  r2_54:Init(r1_54)
  return r2_54
end
AssembleComponents(r1_0)
return r1_0
