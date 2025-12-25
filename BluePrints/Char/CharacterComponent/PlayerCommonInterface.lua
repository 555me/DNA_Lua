-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Char\CharacterComponent\PlayerCommonInterface.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("EMCache.EMCache")
local r1_0 = require("BluePrints.UI.TaskPanel.TaskUtils")
local r2_0 = require("Utils.MiscUtils")
return {
  PlayerCharacterInitialize = function(r0_1)
    -- line: [7, 25] id: 1
    r0_1.bWeaponByHand = false
    r0_1.WeaponPos = Const.Shoulder
    r0_1.bGotControllerPitchInput = false
    r0_1.bGotControllerYawInput = false
    r0_1.fNoControlRotationInputTime = 0
    r0_1:InitActionLogicParamas()
    r0_1.LookAtTag = r0_1:AddOneSwitchTag(r0_1.OnSetLookAtTag)
    r0_1.bForbidInteractiveTrigger = false
    r0_1:UpdateCameraSensitivityFromCache()
    r0_1:SetPlayerCameraSensitivityByType("Normal")
  end,
  PrintCameraSensitivity = function(r0_2, r1_2)
    -- line: [27, 35] id: 2
    DebugPrint("Tianyi@ Current Pitch Sensivity: " .. tostring(r1_2.CameraPitchSensitivity) .. " Current Yaw Sensivity: " .. tostring(r1_2.CameraYawSensitivity))
    DebugPrint("Tianyi@ CameraPitchSensitivity_Normal: " .. tostring(r1_2.CameraPitchSensitivity_Normal) .. " CameraYawSensitivity_Normal: " .. tostring(r1_2.CameraYawSensitivity_Normal))
    DebugPrint("Tianyi@ CameraPitchSensitivity_Shoot: " .. tostring(r1_2.CameraPitchSensitivity_Shoot) .. " CameraYawSensitivity_Shoot: " .. tostring(r1_2.CameraYawSensitivity_Shoot))
    DebugPrint("Tianyi@ GamepadCameraPitchSensitivity_Normal: " .. tostring(r1_2.GamepadCameraPitchSensitivity_Normal) .. " GamepadCameraYawSensitivity_Normal: " .. tostring(r1_2.GamepadCameraYawSensitivity_Normal))
    DebugPrint("Tianyi@ GamepadCameraPitchSensitivity_Shoot: " .. tostring(r1_2.GamepadCameraPitchSensitivity_Shoot) .. " GamepadCameraYawSensitivity_Shoot: " .. tostring(r1_2.GamepadCameraYawSensitivity_Shoot))
    DebugPrint("Tianyi@ TurnSpeedPitch: " .. tostring(r1_2.TurnSpeedPitch))
    DebugPrint("Tianyi@ TurnSpeedYaw: " .. tostring(r1_2.TurnSpeedYaw))
  end,
  SetPlayerCameraSensitivityByType = function(r0_3, r1_3, r2_3)
    -- line: [37, 56] id: 3
    if r1_3 == "Normal" then
      if UIUtils.IsGamepadInput() then
        r0_3.CameraPitchSensitivity = r0_3.GamepadCameraPitchSensitivity_Normal
        r0_3.CameraYawSensitivity = r0_3.GamepadCameraYawSensitivity_Normal
      else
        r0_3.CameraPitchSensitivity = r0_3.CameraPitchSensitivity_Normal
        r0_3.CameraYawSensitivity = r0_3.CameraYawSensitivity_Normal
      end
    elseif r1_3 == "Shooting" then
      if UIUtils.IsGamepadInput() then
        r0_3.CameraPitchSensitivity = r0_3.GamepadCameraPitchSensitivity_Shoot
        r0_3.CameraYawSensitivity = r0_3.GamepadCameraYawSensitivity_Shoot
      else
        r0_3.CameraPitchSensitivity = r0_3.CameraPitchSensitivity_Shoot
        r0_3.CameraYawSensitivity = r0_3.CameraYawSensitivity_Shoot
      end
    end
  end,
  SetPlayerCameraSensitivityCannon = function(r0_4)
    -- line: [58, 63] id: 4
    r0_4.CameraPitchSensitivity_Normal = r0_4.CameraPitchSensitivity_Shoot
    r0_4.CameraYawSensitivity_Normal = r0_4.CameraYawSensitivity_Shoot
    r0_4.GamepadCameraPitchSensitivity_Normal = r0_4.GamepadCameraPitchSensitivity_Shoot
    r0_4.GamepadCameraYawSensitivity_Normal = r0_4.GamepadCameraYawSensitivity_Shoot
  end,
  UpdateGamePadCameraSensitivityFromCache = function(r0_5)
    -- line: [65, 97] id: 5
    local r1_5 = r0_0:Get("GamepadCameraPitch")
    if not r1_5 then
      local r2_5 = tonumber((DataMgr.Option.GamePadVerticalSensitivity.DefaultValue and 1)) / (DataMgr.Option.GamePadVerticalSensitivity.ScrollMappingScale and 1)
      r0_0:Set("GamepadCameraPitch", r2_5)
      r1_5 = r2_5
    end
    r0_5.GamepadCameraPitchSensitivity_Normal = r1_5
    local r2_5 = r0_0:Get("GamepadCameraPitchOnShoot")
    if not r2_5 then
      local r3_5 = tonumber((DataMgr.Option.GamePadVerticalSensitivityOnShooting.DefaultValue and 1)) / (DataMgr.Option.GamePadVerticalSensitivityOnShooting.ScrollMappingScale and 1)
      r0_0:Set("GamepadCameraPitchOnShoot", r3_5)
      r2_5 = r3_5
    end
    r0_5.GamepadCameraPitchSensitivity_Shoot = r2_5
    local r3_5 = r0_0:Get("GamepadCameraYaw")
    if not r3_5 then
      local r4_5 = tonumber((DataMgr.Option.GamePadHorizontalSensitivity.DefaultValue and 1)) / (DataMgr.Option.GamePadHorizontalSensitivity.ScrollMappingScale and 1)
      r0_0:Set("GamepadCameraYaw", r4_5)
      r3_5 = r4_5
    end
    r0_5.GamepadCameraYawSensitivity_Normal = r3_5
    local r4_5 = r0_0:Get("GamepadCameraYawOnShoot")
    if not r4_5 then
      local r5_5 = tonumber((DataMgr.Option.GamePadHorizontalSensitivityOnShooting.DefaultValue and 1)) / (DataMgr.Option.GamePadHorizontalSensitivityOnShooting.ScrollMappingScale and 1)
      r0_0:Set("GamepadCameraYawOnShoot", r5_5)
      r4_5 = r5_5
    end
    r0_5.GamepadCameraYawSensitivity_Shoot = r4_5
  end,
  UpdateKeyBoardCameraSensitivityFromCache = function(r0_6)
    -- line: [99, 131] id: 6
    local r1_6 = r0_0:Get("CameraPitch")
    if not r1_6 then
      local r2_6 = tonumber((DataMgr.Option.VerticalSensitivity.DefaultValue and 1)) / (DataMgr.Option.VerticalSensitivity.ScrollMappingScale and 1)
      r0_0:Set("CameraPitch", r2_6)
      r1_6 = r2_6
    end
    r0_6.CameraPitchSensitivity_Normal = r1_6
    local r2_6 = r0_0:Get("CameraPitchOnShoot")
    if not r2_6 then
      local r3_6 = tonumber((DataMgr.Option.VerticalSensitivityOnShooting.DefaultValue and 1)) / (DataMgr.Option.VerticalSensitivityOnShooting.ScrollMappingScale and 1)
      r0_0:Set("CameraPitchOnShoot", r3_6)
      r2_6 = r3_6
    end
    r0_6.CameraPitchSensitivity_Shoot = r2_6
    local r3_6 = r0_0:Get("CameraYaw")
    if not r3_6 then
      local r4_6 = tonumber((DataMgr.Option.HorizontalSensitivity.DefaultValue and 1)) / (DataMgr.Option.HorizontalSensitivity.ScrollMappingScale and 1)
      r0_0:Set("CameraYaw", r4_6)
      r3_6 = r4_6
    end
    r0_6.CameraYawSensitivity_Normal = r3_6
    local r4_6 = r0_0:Get("CameraYawOnShoot")
    if not r4_6 then
      local r5_6 = tonumber((DataMgr.Option.HorizontalSensitivityOnShooting.DefaultValue and 1)) / (DataMgr.Option.HorizontalSensitivityOnShooting.ScrollMappingScale and 1)
      r0_0:Set("CameraYawOnShoot", r5_6)
      r4_6 = r5_6
    end
    r0_6.CameraYawSensitivity_Shoot = r4_6
  end,
  UpdateCameraSensitivityFromCache = function(r0_7, r1_7, r2_7)
    -- line: [134, 137] id: 7
    r0_7:UpdateGamePadCameraSensitivityFromCache()
    r0_7:UpdateKeyBoardCameraSensitivityFromCache()
  end,
  BeforeBeginPlay = function(r0_8)
    -- line: [139, 142] id: 8
    r0_8.CheckAnimNotifyOnZeroFrame = false
    r0_8.MaxSafeLocations = 10
  end,
  AfterBeginPlay = function(r0_9)
    -- line: [144, 151] id: 9
    r0_9.WeaponPos = Const.Shoulder
    if r0_9.PlayerAnimInstance then
      r0_9.PlayerAnimInstance.WeaponPos = r0_9.WeaponPos
    end
    r0_9:SetupActionGroups()
    r0_9:InitPostProcessSettings()
  end,
  SetupActionGroups = function(r0_10)
    -- line: [153, 173] id: 10
    r0_10:AddToActionGroups("Battle", "Attack")
    r0_10:AddToActionGroups("Battle", "Jump")
    r0_10:AddToActionGroups("Battle", "Slide")
    r0_10:AddToActionGroups("Battle", "BulletJump")
    r0_10:AddToActionGroups("Battle", "Skill1")
    r0_10:AddToActionGroups("Battle", "Skill2")
    r0_10:AddToActionGroups("Battle", "Skill3")
    r0_10:AddToActionGroups("Battle", "Fire")
    r0_10:AddToActionGroups("Battle", "Reload")
    r0_10:AddToActionGroups("Battle", "ChargeBullet")
    r0_10:AddToActionGroups("Battle", "Avoid")
    r0_10:AddToActionGroups("Battle", "SwitchCrouch")
    r0_10:AddToActionGroups("Battle", "Locomotion")
    r0_10:AddToActionGroups("Region", "SwitchMaster")
    r0_10:AddToActionGroups("Flying", "BulletJump")
    r0_10:InitBattleWheelForbidGroup()
  end,
  LoadFinished = function(r0_11)
    -- line: [188, 190] id: 11
    print("LoadFinished")
  end,
  LatenTick = function(r0_12, r1_12)
    -- line: [193, 196] id: 12
  end,
  ProcessItemsOnTouchTick = function(r0_13)
    -- line: [201, 203] id: 13
    r0_13:ProcessItemsOnTouch()
  end,
  ReturnIdle = function(r0_14, r1_14)
    -- line: [226, 230] id: 14
    r0_14:SetCharacterTagIdle()
    r0_14.KeepWeaponOnHand = false
    r0_14:ServerSetCharacterTag("Idle")
  end,
  SetLogMask = function(r0_15, r1_15)
    -- line: [248, 251] id: 15
    print("LogInfo", r1_15)
    _G.LogTag = r1_15
  end,
  SetEmoIdleEnabled = function(r0_16, r1_16, r2_16)
    -- line: [292, 296] id: 16
    if r0_16.PlayerAnimInstance then
      r0_16.PlayerAnimInstance:SetEmoIdleEnabled(r1_16, r2_16)
    end
  end,
  KawaiiSwitch = function(r0_17, r1_17)
    -- line: [302, 308] id: 17
    if r0_17.PlayerAnimInstance then
      r0_17.PlayerAnimInstance:EnableKawaiiSettings(r1_17)
    end
  end,
  StopArmoryIdle = function(r0_18)
    -- line: [311, 314] id: 18
    r0_18:ShouldEnableHandIk()
    r0_18.PlayerAnimInstance:Montage_StopSlotByName(0, "ArmoryIdle")
  end,
  SetArmoryIdleTag = function(r0_19, r1_19)
    -- line: [316, 323] id: 19
    if not r0_19.PlayerAnimInstance then
      return 
    end
    r0_19:ShouldEnableHandIk()
    r0_19.PlayerAnimInstance:SetArmoryIdleTag(r1_19)
  end,
  CancelSkill = function(r0_20, r1_20, r2_20)
    -- line: [347, 348] id: 20
  end,
  CalcVectorAngle = function(r0_21, r1_21, r2_21)
    -- line: [350, 356] id: 21
    r1_21:Normalize()
    r2_21:Normalize()
    return UE4.UKismetMathLibrary.DegAcos(r1_21:Dot(r2_21))
  end,
  IsLocalPlayer = function(r0_22)
    -- line: [366, 372] id: 22
    if URuntimeCommonFunctionLibrary.ObjIsChildOf(r0_22:GetController(), APlayerController) and (IsStandAlone(r0_22) or r2_0.IsAutonomousProxy(r0_22)) then
      return true
    end
    return false
  end,
  UpdatePlayerTaskInfo = function(r0_23)
    -- line: [374, 416] id: 23
    local r1_23 = UE4.UGameplayStatics.GetGameInstance(r0_23)
    local r2_23 = r1_23:GetGameUIManager()
    if r1_23:GetSceneManager() == nil or r2_23 == nil then
      return 
    end
    local r4_23 = GWorld:GetAvatar()
    if not r4_23 then
      return 
    end
    local r5_23 = nil
    local r6_23 = r2_23:GetUIObj("BattleMain")
    if r6_23 ~= nil and r6_23.Pos_TaskBar ~= nil and r6_23.Pos_TaskBar:GetChildrenCount() == 0 then
      r5_23 = r6_23:CreateWidgetNew("TaskBar")
      if r5_23 ~= nil then
        r6_23.Pos_TaskBar:AddChildToOverlay(r5_23)
      end
      local r7_23 = r4_23.QuestChains[r4_23.TrackingQuestChainId]
      if not r7_23 or r7_23 and r7_23:IsFinish() then
        r6_23.Pos_TaskBar:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
    elseif r6_23 ~= nil and r6_23.Pos_TaskBar ~= nil then
      r5_23 = r6_23.Pos_TaskBar:GetChildAt(0)
    end
    local r7_23 = r1_0:GetUnlockMainStory()
    if r7_23 and r5_23 then
      r5_23:UpdateUnlockMainStory(r7_23)
    elseif r5_23 then
      r5_23.Panel_Lock:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    local r8_23 = r1_0:GetIconTextureByTrackQuestChainType()
    if r8_23 and r5_23 then
      r5_23.Icon_GuidePoint:SetBrushResourceObject(r8_23)
    end
  end,
  InitSceneStartUI = function(r0_24)
    -- line: [418, 419] id: 24
  end,
  UpdatePlayerBloodEffectInfo = function(r0_25)
    -- line: [421, 422] id: 25
  end,
  Landed = function(r0_26)
    -- line: [424, 432] id: 26
    if not r0_26:PlayerLanded() then
      return 
    end
    r0_26.Super.Landed(r0_26)
    if r0_26:CharacterInTag("LandHeavy") then
      return 
    end
  end,
  Impending = function(r0_27)
    -- line: [435, 440] id: 27
    if not r0_27:PlayerImpending() then
      return 
    end
  end,
  StartSlide = function(r0_28)
    -- line: [443, 444] id: 28
  end,
  EnterHitFlyTag = function(r0_29)
    -- line: [449, 454] id: 29
    if r0_29.PlayerAnimInstance then
      r0_29:SetCurrentJumpState(Const.NormalState)
      r0_29:SetRotationRate("OnGround")
    end
  end,
  GetDamageInstigatorCurrentAngle = function(r0_30, r1_30)
    -- line: [456, 457] id: 30
  end,
  TryToUpdateScreenEffect = function(r0_31, r1_31, r2_31)
    -- line: [459, 461] id: 31
  end,
  SkillEnd = function(r0_32, r1_32, r2_32)
    -- line: [463, 464] id: 32
  end,
  PressFire = function(r0_33)
    -- line: [482, 483] id: 33
  end,
  ResetJumpState = function(r0_34, r1_34)
    -- line: [489, 503] id: 34
    r0_34:SetCurrentJumpState(Const.NormalState)
    if not r1_34 then
      r0_34.JumpCount = 0
      r0_34.BulletJumpCount = 0
    end
    r0_34.AutoSyncProp.IsBulletJumping = false
    r0_34.StartBulletJumpTime = -1
    r0_34.ForbidSlide = false
    local r2_34 = r0_34:GetMovementComponent()
    r0_34.ForbidOrient = false
    r0_34:ChangeOrientControll()
    r0_34:ResetCapRot()
  end,
  ResetJumpState_Lua = function(r0_35)
    -- line: [505, 515] id: 35
    if r0_35.LuaTimerHandles.BulletJump then
      r0_35:RemoveTimer(r0_35.LuaTimerHandles.BulletJump)
      r0_35.LuaTimerHandles.BulletJump = nil
    end
    if r0_35.BulletJumpDirectionInfo then
      r0_35.BulletJumpDirectionInfo = nil
    end
    r0_35.AutoSyncProp.IsBulletJumping = false
  end,
  ReleaseFire = function(r0_36)
    -- line: [524, 525] id: 36
  end,
  StopFire = function(r0_37, r1_37)
    -- line: [527, 528] id: 37
  end,
  EnterWalkingTag = function(r0_38)
    -- line: [540, 545] id: 38
    r0_38:SetRotationRate("OnGround")
    if not r0_38:IsAnimCrouch() then
    end
  end,
  CheckKeepBoneHit = function(r0_39)
    -- line: [548, 549] id: 39
  end,
  ApplyEffectBoneHit = function(r0_40, r1_40, r2_40)
    -- line: [551, 552] id: 40
  end,
  EndBoneHit = function(r0_41)
    -- line: [554, 556] id: 41
    r0_41.PlayerAnimInstance.InBoneHit = false
  end,
  ChangeToNewWeapon = function(r0_42, r1_42)
    -- line: [558, 637] id: 42
    local r2_42 = DataMgr.BattleWeapon[r1_42]
    if not r2_42 then
      ScreenPrint("请输入正确的武器编号:" .. tostring(r1_42))
      return 
    end
    if GWorld:GetAvatar() then
      ScreenPrint("连接服务器情况下，请在军械库更换武器")
      return 
    end
    if not IsAuthority(r0_42) then
      ScreenPrint("多人联机模式不能换武器")
      return 
    end
    local function r4_42(r0_43, r1_43)
      -- line: [576, 588] id: 43
      local r2_43 = r0_43.WeaponTag
      if not r2_43 then
        return false
      end
      for r7_43, r8_43 in pairs(r2_43) do
        if r1_43 == r8_43 then
          return true
        end
      end
      -- close: r3_43
      return false
    end
    if r4_42(r2_42, "Ultra") then
      ScreenPrint("无法更换显赫武器")
      return 
    end
    if r4_42(r2_42, "Condemn") then
      ScreenPrint("无法更换处刑武器")
      return 
    end
    local r5_42 = r4_42(r2_42, "Melee")
    local r6_42 = {}
    table.insert(r6_42, {
      WeaponId = r1_42,
      Weight = 1.5,
    })
    for r11_42, r12_42 in pairs(r0_42.Weapons) do
      if not r12_42.IsChild then
        if r12_42:HasTag("Ultra") or r12_42:HasTag("Condemn") then
          table.insert(r6_42, {
            WeaponId = r11_42,
            Weight = 3,
          })
        elseif r5_42 and not r12_42:HasTag("Melee") then
          table.insert(r6_42, {
            WeaponId = r11_42,
            Weight = 2,
          })
        elseif not r12_42:HasTag("Ranged") then
          table.insert(r6_42, {
            WeaponId = r11_42,
            Weight = 1,
          })
        end
      end
    end
    -- close: r7_42
    table.sort(r6_42, function(r0_44, r1_44)
      -- line: [621, 623] id: 44
      return r0_44.Weight < r1_44.Weight
    end)
    if r0_42:GetCurrentSkill() then
      r0_42:StopSkill(UE.ESkillStopReason.ForceCancel)
    end
    r0_42:ClearWeapon()
    for r12_42, r13_42 in pairs(r6_42) do
      local r14_42 = r0_42:AddWeapon(r13_42.WeaponId)
      r14_42:UnBindWeaponFromHand()
      r14_42:ShouldHideWeapon(true, true)
      r14_42:UnBindWeaponFromHand()
    end
    -- close: r8_42
    r0_42:ChangeUsingWeaponByType("Melee")
  end,
  AnimIdleStart = function(r0_45)
    -- line: [638, 640] id: 45
  end,
  StartJump = function(r0_46)
    -- line: [642, 647] id: 46
    r0_46:PlayerDoJump()
    if r0_46.NeedJumpEvent then
      EventManager:FireEvent(EventID.OnJumpPressed)
    end
  end,
  SetDebugDrawTest = function(r0_47, r1_47)
    -- line: [649, 651] id: 47
    _G.DrawDebugTest = r1_47
  end,
  SetCanInteractiveTrigger = function(r0_48, r1_48, r2_48)
    -- line: [654, 673] id: 48
    local r3_48 = r2_48 and "Default"
    r0_48.DisableInteractiveTriggerTagMap = r0_48.DisableInteractiveTriggerTagMap and {}
    if r1_48 then
      r0_48.DisableInteractiveTriggerTagMap[r3_48] = nil
    else
      r0_48.DisableInteractiveTriggerTagMap[r3_48] = true
    end
    local r4_48 = next(r0_48.DisableInteractiveTriggerTagMap) ~= nil
    if r0_48.bForbidInteractiveTrigger == r4_48 then
      return 
    end
    r0_48.bForbidInteractiveTrigger = r4_48
    if r0_48.InteractiveTriggerComponent then
      r0_48.InteractiveTriggerComponent:SetIsCanTrigger(not r4_48)
    end
  end,
  CheckCanInteractiveTrigger = function(r0_49)
    -- line: [675, 677] id: 49
    return not r0_49.bForbidInteractiveTrigger
  end,
  RefreshRegionNameInfo = function(r0_50, r1_50, r2_50)
    -- line: [679, 694] id: 50
    local r3_50 = ""
    local r4_50 = GWorld:GetAvatar()
    if r4_50 then
      local r6_50 = (r4_50.RegionAvatars and {})[r2_50]
      r3_50 = r6_50 and r6_50.AvatarInfo.Nickname
    end
    local r5_50, r6_50 = TeamController:GetModel():GetTeamMember(r1_50)
    r0_50:EnableHeadWidget("Name", false)
    local r7_50 = "Player"
    if r6_50 == 0 or not r6_50 then
      r7_50 = nil
    end
    r0_50:EnableHeadWidget("Name", true, r3_50, r7_50, r6_50)
  end,
  RefreshTitleInfo = function(r0_51, r1_51)
    -- line: [695, 712] id: 51
    local r2_51 = GWorld:GetAvatar()
    if not r2_51 then
      return 
    end
    local r4_51 = (r2_51.RegionAvatars and {})[r1_51]
    if not r4_51 or not r4_51.AvatarInfo then
      return 
    end
    local r5_51 = r4_51.AvatarInfo.TitleBefore
    local r6_51 = r4_51.AvatarInfo.TitleAfter
    local r7_51 = r4_51.AvatarInfo.TitleFrame
    print(_G.LogTag, "RefreshTitleInfo", r5_51, r6_51, r7_51)
    r0_51:RefreshTitle(r5_51, r6_51, r7_51)
  end,
  EnableTitle = function(r0_52, r1_52, r2_52, r3_52)
    -- line: [713, 715] id: 52
    r0_52:EnableHeadWidget("Title", true, r1_52, r2_52, r3_52)
  end,
  DisableTitle = function(r0_53)
    -- line: [717, 719] id: 53
    r0_53:EnableHeadWidget("Title", false)
  end,
  RefreshTitle = function(r0_54, r1_54, r2_54, r3_54)
    -- line: [721, 724] id: 54
    r0_54:DisableTitle()
    r0_54:EnableTitle(r1_54, r2_54, r3_54)
  end,
  InitBattleWheelForbidGroup = function(r0_55)
    -- line: [726, 743] id: 55
    local r1_55 = {
      W = true,
      A = true,
      S = true,
      D = true,
      OpenBattleWheel = true,
      Fire = true,
    }
    for r7_55, r8_55 in pairs(DataMgr.KeyboardMap) do
      if not r1_55[r7_55] then
        r0_55:AddToActionGroups("BattleWheelForbid", r7_55)
      end
    end
    -- close: r3_55
  end,
  DisablePlayerInputInDeliver = function(r0_56, r1_56)
    -- line: [745, 747] id: 56
    UIManager(r0_56):SetBannedActionCallback("InDeliver", r1_56)
  end,
}
