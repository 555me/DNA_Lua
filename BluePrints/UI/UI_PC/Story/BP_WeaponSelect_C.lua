-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\UI_PC\Story\BP_WeaponSelect_C.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("BluePrints.Item.Pickups.PickupUseComponent")
local r1_0 = Class("BluePrints.UI.BP_UIState_C")
function r1_0.Construct(r0_1)
  -- line: [6, 30] id: 1
  r0_1.WidgetSwitcher:SetActiveWidgetIndex(1)
  r0_1.FindWeapon = false
  r0_1.WeaponEffectBox = {}
  r0_1.ControlEid = 0
  r0_1.Common_BlackBtn01_PC:BindEventOnClicked(r0_1, r0_1.OnChooseWeapon)
  r0_1.Common_BlackBtn01_PC.SoundFunc = r0_1.PlaySoundOnClick
  r0_1.Overridden.Construct(r0_1)
  r0_1.TextBlock:SetText(GText("PROLOGUE_SELECTGUN_TIP_3"))
  r0_1.TextBlock_99:SetText(GText("PROLOGUE_SELECTGUN_TIP_2"))
  r0_1.TextBlock_494:SetText(GText("PROLOGUE_SELECTGUN_TIP_1"))
  r0_1.Common_BlackBtn01_PC:SetText(GText("PROLOGUE_SELECTGUN_TIP_4"))
  r0_1:FindRangedWeaponActor()
  r0_1:InitDeviceInfo()
  r0_1:InitListenEvent()
  r0_1.DeviceInPc = CommonUtils.GetDeviceTypeByPlatformName(r0_1) ~= "Mobile"
  if not r0_1.DeviceInPc or r0_1.CurInputDeviceType == ECommonInputType.Gamepad then
    r0_1.LeftMouse:SetVisibility(ESlateVisibility.Collapsed)
  end
end
function r1_0.Tick(r0_2, r1_2, r2_2)
  -- line: [32, 43] id: 2
  if CommonUtils.GetDeviceTypeByPlatformName(r0_2) == "PC" then
    if r0_2.CurInputDeviceType ~= ECommonInputType.Gamepad then
      r0_2:TraceWeapon()
    end
    r0_2:IsWeapon(r0_2.SelectActor)
    if r0_2.FindWeapon then
      r0_2:SetWeaponEffectBox()
    end
    return 
  end
end
function r1_0.InitDeviceInfo(r0_3)
  -- line: [45, 51] id: 3
  r0_3.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(UE4.UGameplayStatics.GetPlayerController(r0_3, 0))
  if IsValid(r0_3.GameInputModeSubsystem) then
    r0_3:RefreshOpInfoByInputDevice(r0_3.GameInputModeSubsystem:GetCurrentInputType(), r0_3.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end
function r1_0.InitListenEvent(r0_4)
  -- line: [53, 57] id: 4
  if IsValid(r0_4.GameInputModeSubsystem) then
    r0_4.GameInputModeSubsystem.OnInputMethodChanged:Add(r0_4, r0_4.RefreshOpInfoByInputDevice)
  end
end
function r1_0.RefreshOpInfoByInputDevice(r0_5, r1_5, r2_5)
  -- line: [59, 68] id: 5
  if r0_5.CurInputDeviceType == r1_5 then
    return 
  end
  r0_5.CurInputDeviceType = r1_5
  r0_5.CurGamepadName = r2_5
  r0_5:InitBtnTipsUI()
end
function r1_0.InitBtnTipsUI(r0_6)
  -- line: [71, 87] id: 6
  if r0_6.CurInputDeviceType == ECommonInputType.Gamepad then
    r0_6:SwitchGamepadIconShowOrHide(true)
    r0_6.SelectActor = r0_6.RightRangedWeapon
    r0_6:SetWeaponEffectBox()
    r0_6.SelectActor = r0_6.LefttRangedWeapon
    r0_6:SetWeaponEffectBox()
  else
    r0_6:SwitchGamepadIconShowOrHide(false)
    if r0_6.CurInputDeviceType ~= ECommonInputType.MouseAndKeyboard then
      r0_6.LeftMouse:SetVisibility(ESlateVisibility.Collapsed)
    else
      r0_6.LeftMouse:SetVisibility(ESlateVisibility.Visibility)
    end
  end
end
function r1_0.SwitchGamepadIconShowOrHide(r0_7, r1_7)
  -- line: [90, 134] id: 7
  if r1_7 then
    r0_7.HB_Key:SetVisibility(ESlateVisibility.Visibility)
    r0_7.Com_KeyTips:SetVisibility(ESlateVisibility.Visibility)
    r0_7.TextBlock_99:SetVisibility(ESlateVisibility.Collapsed)
    r0_7.LeftMouse:SetVisibility(ESlateVisibility.Collapsed)
  else
    r0_7.TextBlock_99:SetVisibility(ESlateVisibility.Visibility)
    r0_7.HB_Key:SetVisibility(ESlateVisibility.Collapsed)
    r0_7.Com_KeyTips:SetVisibility(ESlateVisibility.Collapsed)
    return 
  end
  r0_7.Key_Text_1:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "LB",
      }
    },
  })
  r0_7.Key_Text_2:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "RB",
      }
    },
  })
  r0_7.Com_KeyTips:UpdateKeyInfo({
    {
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "LB",
        }
      },
      Desc = GText("UI_CTL_SelectLeft"),
    },
    {
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "RB",
        }
      },
      Desc = GText("UI_CTL_SelectRight"),
    }
  })
end
function r1_0.OnKeyDown(r0_8, r1_8, r2_8)
  -- line: [137, 150] id: 8
  local r3_8 = false
  local r4_8 = UE4.UKismetInputLibrary.GetKey(r2_8)
  local r5_8 = UE4.UFormulaFunctionLibrary.Key_GetFName(r4_8)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r4_8) then
    DebugPrint("thy    Key_IsGamepadKey", r5_8)
    r3_8 = r0_8:Handle_OnGamePadDown(r5_8)
  end
  if r3_8 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end
function r1_0.OnKeyUp(r0_9, r1_9, r2_9)
  -- line: [153, 166] id: 9
  local r3_9 = false
  local r4_9 = UE4.UKismetInputLibrary.GetKey(r2_9)
  local r5_9 = UE4.UFormulaFunctionLibrary.Key_GetFName(r4_9)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r4_9) then
    DebugPrint("thy    Key_IsGamepadKey", r5_9)
    r3_9 = r0_9:Handle_OnGamePadUp(r5_9)
  end
  if r3_9 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end
function r1_0.IsSubstringContained(r0_10, r1_10, r2_10)
  -- line: [168, 174] id: 10
  local r3_10, r4_10 = string.find(r1_10, r2_10)
  if r3_10 and r4_10 then
    return true
  end
  return false
end
function r1_0.GetWeapon(r0_11, r1_11)
  -- line: [176, 186] id: 11
  local r4_11 = UE4.UGameplayStatics.GetGameState(r0_11).StaticCreatorMap:Find(r1_11).ChildEids
  local r5_11 = r4_11:Length()
  local r6_11 = nil
  if r4_11 and r5_11 > 0 then
    r6_11 = Battle(r0_11):GetEntity(r4_11[1])
  end
  return r6_11
end
function r1_0.FindRangedWeaponActor(r0_12)
  -- line: [188, 191] id: 12
  r0_12.RightRangedWeapon = r0_12:GetWeapon(1510010302)
  r0_12.LefttRangedWeapon = r0_12:GetWeapon(1510010303)
end
function r1_0.Handle_OnGamePadDown(r0_13, r1_13)
  -- line: [193, 225] id: 13
  if r1_13 == "Gamepad_LeftShoulder" then
    if r0_13.LeftShoulderIsPress or r0_13.IsPressing then
      return true
    end
    r0_13.IsPressing = true
    r0_13.LeftShoulderIsPress = true
    r0_13.SelectActor = r0_13.RightRangedWeapon
    r0_13.TryToSelectActor = r0_13.LefttRangedWeapon
    r0_13:TraceWeaponGamePad()
    r0_13:OnSelectWeapon()
    return true
  elseif r1_13 == "Gamepad_RightShoulder" then
    if r0_13.RightShoulderIsPress or r0_13.IsPressing then
      return true
    end
    r0_13.IsPressing = true
    r0_13.RightShoulderIsPress = true
    r0_13.SelectActor = r0_13.LefttRangedWeapon
    r0_13.TryToSelectActor = r0_13.RightRangedWeapon
    r0_13:TraceWeaponGamePad()
    r0_13:OnSelectWeapon()
    return true
  elseif r1_13 == "Gamepad_FaceButton_Bottom" then
    if r0_13.IsPressing then
      return 
    end
    r0_13.Common_BlackBtn01_PC:OnBtnPressed()
    r0_13.IsPressing = true
    return true
  end
  return false
end
function r1_0.Handle_OnGamePadUp(r0_14, r1_14)
  -- line: [227, 249] id: 14
  DebugPrint("thy    Handle_OnGamePadDown", r1_14)
  if r1_14 == "Gamepad_FaceButton_Bottom" then
    r0_14.IsPressing = false
    r0_14.Common_BlackBtn01_PC:OnBtnClicked()
    return true
  elseif r1_14 == "Gamepad_LeftShoulder" then
    if r0_14.RightShoulderIsPress then
      return true
    end
    r0_14.LeftShoulderIsPress = false
    r0_14.IsPressing = false
    return true
  elseif r1_14 == "Gamepad_RightShoulder" then
    if r0_14.LeftShoulderIsPress then
      return true
    end
    r0_14.RightShoulderIsPress = false
    r0_14.IsPressing = false
    return true
  end
  return false
end
function r1_0.SetWeaponEffectBox(r0_15)
  -- line: [251, 266] id: 15
  if r0_15.WeaponEffectBox[r0_15.SelectActor.Eid] then
    return 
  end
  local r1_15 = r0_15:FindEffectBox()
  if r1_15:Length() == 0 then
    print(_G.LogTag, "Error:", r0_15.SelectActor:GetName(), "Can\'t Find EffectBox")
    return 
  elseif r1_15:Length() > 1 then
    print(_G.LogTag, "Error:", r0_15.SelectActor:GetName(), "Find more than 1 EffectBox")
    return 
  else
    r0_15.WeaponEffectBox[r0_15.SelectActor.Eid] = r1_15:GetRef(1)
  end
end
function r1_0.TraceWeaponMobile(r0_16, r1_16)
  -- line: [269, 321] id: 16
  local r2_16 = UE4.UUCloudGameInstanceSubsystem.IsCloudGame(r0_16) and CommonUtils.GetDeviceTypeByPlatformName(r0_16) == "PC"
  if CommonUtils.GetDeviceTypeByPlatformName(r0_16) == "PC" and not UE4.UUCloudGameInstanceSubsystem.IsCloudGame(r0_16) then
    return 
  end
  local r3_16 = UE4.UGameplayStatics.GetPlayerController(r0_16, 0)
  local r4_16 = TArray(EObjectTypeQuery)
  r4_16:Add(EObjectTypeQuery.Item)
  local r5_16 = UE4.TArray(UE4.FHitResult)
  if UE4.URuntimeCommonFunctionLibrary.IsPlayInEditor(r0_16) then
    r3_16:GetHitResultsUnderCursorForObjects(r4_16, true, r5_16)
  elseif r2_16 then
    DebugPrint("jly    TraceWeaponMobile CloudGamePC")
    local r6_16 = UE4.UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(r1_16)
    DebugPrint("MousePosition before scale:", r6_16)
    local r7_16 = UE4.UWidgetLayoutLibrary.GetViewportScale(r0_16)
    DebugPrint("ViewportScale:", r7_16)
    if r7_16 and r7_16 ~= 1 then
      r6_16.X = r6_16.X * r7_16
      r6_16.Y = r6_16.Y * r7_16
      DebugPrint("MousePosition after scale:", r6_16)
    end
    r5_16 = r3_16:GetHitResultsAtScreenPosition(r6_16, r4_16, true)
  else
    local r6_16 = UE4.UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(r1_16)
    DebugPrint("MousePosition:", r6_16)
    r5_16 = r3_16:GetHitResultsAtScreenPosition(r6_16, r4_16, true)
  end
  DebugPrint("Results:Length():", r5_16:Length())
  for r9_16 = 1, r5_16:Length(), 1 do
    local r10_16 = r5_16[r9_16].Actor
    DebugPrint(r10_16:GetName())
    if r10_16:Cast(UE4.APickupBase) then
      r0_16.bIsWeapon = true
      if r0_16.SelectActor ~= r10_16 then
        r0_16.SelectActor = r10_16
        DebugPrint("self.SelectActor", r10_16:GetName())
      end
    end
  end
  r0_16:IsWeapon(r0_16.SelectActor)
  if r0_16.FindWeapon then
    r0_16:SetWeaponEffectBox()
  end
end
function r1_0.OnMouseButtonDown(r0_17, r1_17, r2_17)
  -- line: [323, 328] id: 17
  DebugPrint("BP_WeaponSelect_C:OnMouseButtonDown")
  r0_17:TraceWeaponMobile(r2_17)
  r0_17:OnSelectWeapon()
  return UE4.UWidgetBlueprintLibrary.Handled()
end
function r1_0.OnTouchStarted(r0_18, r1_18, r2_18)
  -- line: [330, 335] id: 18
  DebugPrint("JLY    BP_WeaponSelect_C:OnMouseButtonDown")
  r0_18:TraceWeaponMobile(r2_18)
  r0_18:OnSelectWeapon()
  return UE4.UWidgetBlueprintLibrary.Handled()
end
function r1_0.OnSelectWeapon(r0_19)
  -- line: [338, 367] id: 19
  print(_G.LogTag, "OnSelectWeapon", r0_19.SelectActor, r0_19.ControlEid)
  if not r0_19.SelectActor or not r0_19.ControlEid or r0_19.SelectActor.Eid == r0_19.ControlEid then
    return 
  end
  if r0_19.ControlEid == 0 then
    r0_19.ControlEid = r0_19.SelectActor.Eid
  end
  Battle(r0_19):GetEntity(r0_19.ControlEid):SetWeaponLight(20)
  DebugPrint("thy   test", r0_19.WeaponEffectBox, r0_19.ControlEid, r0_19.WeaponEffectBox[r0_19.ControlEid])
  r0_19.WeaponEffectBox[r0_19.ControlEid]:PlayLeaveEffect()
  r0_19.ControlEid = r0_19.SelectActor.Eid
  r0_19.SelectActor:SetWeaponLight(100)
  r0_19.WeaponEffectBox[r0_19.ControlEid]:PlaySelectEffect()
  r0_19.WidgetSwitcher:SetActiveWidgetIndex(0)
  local r1_19 = r0_0.ClientGetWeaponId.GetWeaponId(r0_19.SelectActor.UnitId)
  local r3_19 = DataMgr.Drop[r0_19.SelectActor.UnitId]
  r0_19.TextBlock_1:SetText(GText(DataMgr.Weapon[r1_19].WeaponName))
  r0_19.Interduction:SetText(GText(r3_19.DropDescribe))
  AudioManager(r0_19):PlayFMODSound(r0_19, nil, "event:/ui/common/select_gun")
end
function r1_0.HasWeapon(r0_20, r1_20)
  -- line: [369, 380] id: 20
  local r2_20 = GWorld:GetAvatar()
  if not r2_20 then
    return 
  end
  for r7_20, r8_20 in pairs(r2_20.Weapons) do
    if r8_20.WeaponId == r1_20 then
      return true
    end
  end
  -- close: r3_20
  return false
end
function r1_0.OnChooseWeapon(r0_21)
  -- line: [383, 428] id: 21
  if r0_21.ControlEid == 0 then
    return 
  end
  local r1_21 = Battle(r0_21):GetEntity(r0_21.ControlEid)
  local r2_21 = r0_0.ClientGetWeaponId.GetWeaponId(r1_21.UnitId)
  local r3_21 = 1
  for r8_21, r9_21 in pairs(DataMgr.InitConfig[1].AlternativeRangedWeapon) do
    if r2_21 == r9_21 then
      r3_21 = r8_21
      break
    end
  end
  -- close: r4_21
  local function r4_21()
    -- line: [398, 407] id: 22
    r0_21:RefreshWeapon(r2_21)
    r1_21:EMActorDestroy(EDestroyReason.Pickup)
    r0_21.WeaponEffectBox[r0_21.ControlEid]:PlayLeaveEffect()
    UIManager(r0_21):OpenResidentUI()
    r0_21:StopListeningForInputAction("TalkClick", EInputEvent.IE_Pressed)
    UIManager(r0_21):UnLoadUI("StoryWeaponSelect")
    EventManager:FireEvent(EventID.OnSelectWeapon)
  end
  if r0_21:HasWeapon(r2_21) then
    r4_21()
    return 
  end
  local r5_21 = GWorld:GetAvatar()
  if r5_21 then
    r5_21:ChooseRangedWeapon(r3_21, function(r0_23)
      -- line: [416, 426] id: 23
      if not ErrorCode:Check(r0_23) then
        return 
      end
      if not IsValid(r0_21) then
        return 
      end
      r4_21()
    end)
  end
end
function r1_0.PlaySoundOnClick(r0_24)
  -- line: [430, 432] id: 24
  AudioManager(r0_24):PlayUISound(r0_24, "event:/ui/common/select_gun_click", nil, nil)
end
function r1_0.RefreshWeapon(r0_25, r1_25)
  -- line: [434, 439] id: 25
  UE4.UGameplayStatics.GetPlayerCharacter(r0_25, 0):InitCharacterInfo(AvatarUtils:GetDefaultBattleInfo(GWorld:GetAvatar()))
end
return r1_0
