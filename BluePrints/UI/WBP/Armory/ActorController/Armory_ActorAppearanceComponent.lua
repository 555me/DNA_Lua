-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Armory\ActorController\Armory_ActorAppearanceComponent.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local r1_0 = {
  Init = function(r0_1, r1_1)
    -- line: [6, 9] id: 1
    EventManager:AddEvent(EventID.OnCharGradeLevelUp, r0_1, r0_1.OnCharGradeLevelUp)
    EventManager:AddEvent(EventID.OnWeaponBreakLevelUp, r0_1, r0_1.OnWeaponBreakLevelUp)
  end,
  OnCharGradeLevelUp = function(r0_2, r1_2, r2_2, r3_2)
    -- line: [14, 25] id: 2
    if r0_2.CurrentCharInfo and r0_2.CurrentCharInfo.Uuid == r2_2 then
      local r5_2 = r0_2:GetAvatar().Chars[r2_2]
      if r5_2 and r0_2.ArmoryPlayer and r0_2.ArmoryPlayer.CharacterFashion then
        r0_2.ArmoryPlayer.CharacterFashion:GradeUpEmissive(r5_2.GradeLevel)
        if r0_2.ArmoryPlayer.InfoForInit then
          r0_2.ArmoryPlayer.InfoForInit.GradeLevel = r5_2.GradeLevel
        end
      end
    end
  end,
  ChangeCharAppearance = function(r0_3, r1_3)
    -- line: [29, 36] id: 3
    if not r0_3.ArmoryPlayer or not r0_3.ArmoryPlayer.CharacterFashion then
      return 
    end
    r0_3.CurrentAppearanceInfo = r1_3
    r0_3.ArmoryPlayer.CharacterFashion:InitAppearanceSuit(r1_3)
    r0_3.bPlaySameMontage = true
  end,
  GetSkinPartMeshInfo = function(r0_4, r1_4)
    -- line: [38, 52] id: 4
    if not r1_4 then
      return 
    end
    for r6_4, r7_4 in pairs(DataMgr.CharPartMesh) do
      if r7_4.PartName == "PartMesh" then
        for r13_4, r14_4 in pairs(r7_4.Skin and {}) do
          if r14_4 == r1_4 then
            return r6_4, r7_4.AccessoryType
          end
        end
        -- close: r9_4
      end
    end
    -- close: r2_4
  end,
  ChangeCharSkin = function(r0_5, r1_5)
    -- line: [55, 64] id: 5
    if not r0_5.ArmoryPlayer then
      return 
    end
    r0_5.CurrentAppearanceInfo.SkinId = r1_5
    r0_5.ArmoryPlayer:ChangeSkinModel(r1_5)
    if r0_5.ArmoryPlayer.PlayerAnimInstance then
      r0_5.ArmoryPlayer.PlayerAnimInstance:SetKawiiLayerState(EKawaiiLayerState.EKLS_Armory)
    end
  end,
  ShowPartMesh = function(r0_6, r1_6)
    -- line: [67, 75] id: 6
    if not r0_6.ArmoryPlayer then
      return 
    end
    if r0_6.ArmoryPlayer.PartsMesh then
      r0_6.CurrentAppearanceInfo.IsShowPartMesh = r1_6
      r0_6.ArmoryPlayer.PartsMesh:SetVisibility(r1_6, r1_6)
    end
  end,
  ChangeCharSkinColor = function(r0_7, r1_7)
    -- line: [78, 84] id: 7
    if not r0_7.ArmoryPlayer or not r0_7.ArmoryPlayer.CharacterFashion then
      return 
    end
    r0_7.CurrentAppearanceInfo.Colors = r1_7
    r0_7.ArmoryPlayer.CharacterFashion:InitSkinColors(r1_7)
  end,
  ChangeCharPartColor = function(r0_8, r1_8, r2_8, r3_8)
    -- line: [87, 93] id: 8
    local r4_8 = r0_8.ArmoryPlayer and r0_8.ArmoryPlayer.CharacterFashion
    if not r4_8 then
      return 
    end
    r4_8:ChangePartColor(r1_8, r2_8, r3_8)
  end,
  ChangeCharAccessory = function(r0_9, r1_9, r2_9)
    -- line: [96, 101] id: 9
    if not r0_9.ArmoryPlayer then
      return 
    end
    r0_9.ArmoryPlayer.CharacterFashion:ChangeAccessory(r1_9, r2_9)
  end,
}
local r2_0 = "ShowFXAccessory_"
r1_0[r2_0 .. CommonConst.CharAccessoryTypes.FX_Dead] = function(r0_10, r1_10, r2_10, r3_10)
  -- line: [105, 118] id: 10
  local r4_10 = DataMgr.CharAccessory[r2_10]
  local r5_10 = r3_10
  r0_10:DestoryCreature(r5_10)
  local r6_10 = nil	-- notice: implicit variable refs by block#[3]
  if r4_10 then
    r6_10 = r4_10.CreatureId
    if not r6_10 then
      ::label_12::
      r6_10 = 14001
    end
  else
    goto label_12	-- block#2 is visited secondly
  end
  r1_10:AsyncCreateEffectCreatureWithCallBack(r6_10, FTransform(FRotator(0, 0, 180), FVector(0, 0, 0), FVector(1)), true, "Root", {
    Execute = function(r0_11, r1_11)
      -- line: [112, 116] id: 11
      r0_10:DestoryCreature(r5_10)
      r1_11:SetActorHiddenInGame(false)
      r0_10.Creatures[r5_10] = r1_11
    end,
  })
end
r1_0[r2_0 .. CommonConst.CharAccessoryTypes.FX_Footprint] = function(r0_12, r1_12, r2_12, r3_12)
  -- line: [120, 131] id: 12
  local r4_12 = DataMgr.CharAccessory[r2_12]
  local r5_12 = r4_12 and r4_12.VisualEffectId
  if not r5_12 then
    return 
  end
  local r6_12 = r1_12:K2_GetActorLocation()
  r6_12.Z = r6_12.Z - r1_12.CapsuleComponent:GetScaledCapsuleHalfHeight() - 2.4
  r0_12.PlayerFXTimerKeys.PlayFootprintFXLoop = true
  r1_12.FXComponent:PlayEffectByIDParams(r5_12, {
    bTickEvenWhenPaused = true,
    UseAbsoluteLocation = true,
    Location = {
      r6_12.X,
      r6_12.Y,
      r6_12.Z
    },
  })
  r0_12.ViewUI:AddTimer(1, function()
    -- line: [128, 130] id: 13
    r1_12.FXComponent:PlayEffectByIDParams(r5_12, {
      bTickEvenWhenPaused = true,
      UseAbsoluteLocation = true,
      Location = {
        r6_12.X,
        r6_12.Y,
        r6_12.Z
      },
    })
  end, true, 0, "PlayFootprintFXLoop", true)
end
r1_0[r2_0 .. CommonConst.CharAccessoryTypes.FX_Teleport] = function(r0_14, r1_14, r2_14, r3_14)
  -- line: [133, 151] id: 14
  local r4_14 = DataMgr.CharAccessory[r2_14]
  local r5_14 = nil	-- notice: implicit variable refs by block#[3]
  if r4_14 then
    r5_14 = r4_14.Montage
    if not r5_14 then
      ::label_8::
      r5_14 = "Teleport_01_Montage"
    end
  else
    goto label_8	-- block#2 is visited secondly
  end
  r1_14:PlayActionMontage("Interactive/MechInteractive", r5_14, {
    OnNotifyBegin = function()
      -- line: [137, 146] id: 15
      r1_14.PlayerAnimInstance:Montage_Pause()
      r0_14:HidePlayerActor(r0_14.UIName, true)
      r0_14.PlayerMontageTimerKeys.PlayTeleportMontage = true
      r0_14.ViewUI:AddTimer(1, function()
        -- line: [141, 145] id: 16
        r1_14:PlayActionMontage("Interactive/MechInteractive", r5_14, {}, false, true, false)
        r1_14.PlayerAnimInstance:Montage_JumpToSection("End")
        r0_14:HidePlayerActor(r0_14.UIName, false)
      end, false, 0, "PlayTeleportMontage", true)
    end,
    OnInterrupted = function()
      -- line: [147, 149] id: 17
      r0_14:HidePlayerActor(r0_14.UIName, false)
    end,
  }, false, true, true)
end
r1_0[r2_0 .. CommonConst.CharAccessoryTypes.FX_PlungingATK] = function(r0_18, r1_18, r2_18, r3_18)
  -- line: [153, 159] id: 18
  r0_18:ChangeCharAccessory(r2_18, r3_18)
  local r4_18 = GWorld:GetAvatar()
  r0_18:ChangePlayerWeapon(r4_18.Weapons[r4_18.MeleeWeapon], r1_18)
  r1_18:SetArmoryTag(Const.ArmoryWeaponIdleTags.Armory_FallAttack)
end
r1_0[r2_0 .. CommonConst.CharAccessoryTypes.FX_HelixLeap] = function(r0_19, r1_19, r2_19, r3_19)
  -- line: [161, 164] id: 19
  r0_19:ChangeCharAccessory(r2_19, r3_19)
  r1_19:SetArmoryTag(Const.ArmoryIdleTags.Armory_BullutJump)
end
function r1_0.ShowPlayerFXAccessory(r0_20, r1_20, r2_20)
  -- line: [167, 179] id: 20
  if not r2_20 then
    return 
  end
  local r3_20 = r0_20:GetPlayerActor()
  if not r3_20 then
    return 
  end
  local r4_20 = r2_0 .. r2_20
  if r0_20[r4_20] then
    r0_20[r4_20](r0_20, r3_20, r1_20, r2_20)
  end
end
function r1_0.StartPlayerPartHighLight(r0_21, r1_21, r2_21, r3_21, r4_21)
  -- line: [182, 202] id: 21
  local r5_21 = r0_21.ArmoryPlayer and r0_21.ArmoryPlayer.CharacterFashion
  local r6_21 = "SetCharTintColor" .. r2_21
  local r7_21 = r5_21[r6_21]
  local r8_21 = 0.033
  local r9_21, r10_21 = r4_21:GetTimeRange()
  local r11_21 = 0
  local r12_21 = nil
  if r7_21 then
    r0_21.ViewUI:AddTimer(r8_21, function()
      -- line: [191, 200] id: 22
      r11_21 = r11_21 + r8_21
      if r10_21 <= r11_21 then
        r0_21:StopPlayerPartHighLight(r2_21)
        r0_21:ChangeCharPartColor(r2_21, r1_21)
        return 
      end
      r12_21 = r4_21:GetFloatValue(r11_21)
      r0_21:ChangeCharPartColor(r2_21, UKismetMathLibrary.LinearColorLerp(r3_21, r1_21, r12_21))
    end, true, 0, r6_21, true)
  end
end
function r1_0.StopPlayerPartHighLight(r0_23, r1_23)
  -- line: [205, 208] id: 23
  r0_23.ViewUI:RemoveTimer("SetCharTintColor" .. r1_23)
end
function r1_0.ChangeWeaponAccessory(r0_24, r1_24)
  -- line: [214, 223] id: 24
  r0_24:DoSomethingWithWeapon("ChangeWeaponAccessory", function(...)
    -- line: [215, 221] id: 25
    local r0_25 = r0_24:GetWeaponActor()
    if r0_25 then
      r0_24.CurrentWeaponAppearanceInfo.AccessoryId = r1_24
      r0_25:ChangeAccessory(r1_24)
    end
  end)
end
function r1_0.ChangePlayerWeaponAccessory(r0_26, r1_26)
  -- line: [226, 235] id: 26
  r0_26:DoSomethingWithWeapon("ChangePlayerWeaponAccessory", function(...)
    -- line: [227, 233] id: 27
    local r0_27 = r0_26:GetPlayerWeaponActor()
    if r0_27 then
      r0_26.CurrentWeaponAppearanceInfo.AccessoryId = r1_26
      r0_27:ChangeAccessory(r1_26)
    end
  end)
end
function r1_0.ChangeWeaponColor(r0_28, r1_28)
  -- line: [238, 248] id: 28
  r0_28:DoSomethingWithWeapon("ChangeWeaponColor", function(...)
    -- line: [239, 246] id: 29
    local r0_29 = r0_28:GetWeaponActor()
    if r0_29 then
      r0_28.CurrentWeaponAppearanceInfo.Colors = r1_28
      r0_29:InitWeaponBreakMI()
      r0_29:InitWeaponColor(r1_28)
    end
  end)
end
function r1_0.ChangeWeaponPartColor(r0_30, r1_30, r2_30)
  -- line: [251, 271] id: 30
  r0_30:DoSomethingWithWeapon("ChangeWeaponPartColor", function()
    -- line: [252, 269] id: 31
    local r0_31 = r0_30:GetWeaponActor()
    if not r0_31 then
      return 
    end
    r0_31:InitWeaponBreakMI()
    local r1_31 = "SetWPTintColor" .. r1_30
    local r2_31 = r0_31[r1_31]
    if r2_31 then
      r2_31(r0_31, r2_30)
    end
    if r0_31.ChildWeapon then
      r2_31 = r0_31.ChildWeapon[r1_31]
      if r2_31 then
        r2_31(r0_31.ChildWeapon, r2_30)
      end
    end
  end)
end
function r1_0.ChangeWeaponSkin(r0_32, r1_32)
  -- line: [274, 288] id: 32
  r0_32:DoSomethingWithWeapon("ChangeWeaponSkin", function()
    -- line: [275, 286] id: 33
    local r0_33 = r0_32:GetWeaponActor()
    if r0_33 then
      r0_32.CurrentWeaponAppearanceInfo.SkinId = r1_32
      if r1_32 == r0_32.CurrentWeaponInfo.WeaponId then
        r0_33:InitWeaponSkin()
      else
        r0_33:InitWeaponSkin(r1_32)
      end
      r0_33:OnWeaponReady()
    end
  end)
end
function r1_0.ChangePlayerWeaponSkin(r0_34, r1_34)
  -- line: [291, 305] id: 34
  r0_34:DoSomethingWithWeapon("ChangePlayerWeaponSkin", function()
    -- line: [292, 303] id: 35
    local r0_35 = r0_34:GetPlayerWeaponActor()
    if r0_35 then
      r0_34.CurrentWeaponAppearanceInfo.SkinId = r1_34
      if r1_34 == r0_34.CurrentWeaponInfo.WeaponId then
        r0_35:InitWeaponSkin()
      else
        r0_35:InitWeaponSkin(r1_34)
      end
      r0_35:OnWeaponReady()
    end
  end)
end
function r1_0.ChangeWeaponAppearance(r0_36, r1_36)
  -- line: [308, 318] id: 36
  r0_36:DoSomethingWithWeapon("ChangeWeaponAppearance", function()
    -- line: [309, 316] id: 37
    local r0_37 = r0_36:GetWeaponActor()
    if r0_37 then
      r0_36.CurrentWeaponAppearanceInfo = r1_36
      r0_37:InitWeaponAppearance(r1_36)
      r0_37:OnWeaponReady()
    end
  end)
end
function r1_0.StartWeaponPartHighLight(r0_38, r1_38, r2_38, r3_38, r4_38)
  -- line: [321, 344] id: 38
  r0_38:DoSomethingWithWeapon("StartWeaponPartHighLight", function()
    -- line: [322, 342] id: 39
    local r0_39 = r0_38.ArmoryWeapon and r0_38.ArmoryPlayer and r0_38.ArmoryPlayer.UsingWeapon
    local r1_39 = "SetWPTintColor" .. r2_38
    local r2_39 = r0_39[r1_39]
    local r3_39 = 0.033
    local r4_39, r5_39 = r4_38:GetTimeRange()
    local r6_39 = 0
    local r7_39 = nil
    if r2_39 then
      r0_38.ViewUI:AddTimer(r3_39, function()
        -- line: [331, 340] id: 40
        r6_39 = r6_39 + r3_39
        if r5_39 <= r6_39 then
          r0_38:StopWeaponPartHighLight(r2_38)
          r0_38:ChangeWeaponPartColor(r2_38, r1_38)
          return 
        end
        r7_39 = r4_38:GetFloatValue(r6_39)
        r0_38:ChangeWeaponPartColor(r2_38, UKismetMathLibrary.LinearColorLerp(r3_38, r1_38, r7_39))
      end, true, 0, r1_39, true)
    end
  end)
end
function r1_0.StopWeaponPartHighLight(r0_41, r1_41)
  -- line: [347, 350] id: 41
  r0_41.ViewUI:RemoveTimer("SetWPTintColor" .. r1_41)
end
function r1_0.OnWeaponBreakLevelUp(r0_42, r1_42, r2_42, r3_42)
  -- line: [352, 361] id: 42
  if r1_42 ~= ErrorCode.RET_SUCCESS then
    return 
  end
  if not r0_42.CurrentWeaponInfo or r2_42 ~= r0_42.CurrentWeaponInfo.Uuid then
    return 
  end
  r0_42:SetWeaponActorEnhanceLevel(r3_42)
end
function r1_0.SetWeaponActorEnhanceLevel(r0_43, r1_43)
  -- line: [364, 373] id: 43
  local r2_43 = r0_43:GetWeaponActor()
  if not r2_43 then
    return 
  end
  r2_43:SetAttr("EnhanceLevel", r1_43)
  r2_43:InitWeaponBreakMI()
  r2_43:InitWeaponColor(r0_43.CurrentWeaponInfo:DumpColors())
end
function r1_0.SkinWeaponVFX(r0_44, r1_44)
  -- line: [375, 380] id: 44
  r0_44.SkinWeaponVFXHandle = r0_44.ArmoryPlayer.FXComponent:PlayEffectByIDParams(306, {
    bTickEvenWhenPaused = true,
    NotAttached = true,
  })
  r0_44.SkinWeaponVFXHandle:SetVariableLinearColor("Color", FLinearColor(r1_44.R, r1_44.G, r1_44.B))
end
function r1_0.StopSkinWeaponVFX(r0_45)
  -- line: [382, 389] id: 45
  if r0_45.SkinWeaponVFXHandle and r0_45.SkinWeaponVFXHandle:IsValid() then
    local r1_45 = r0_45.SkinWeaponVFXHandle:GetName()
    r0_45.SkinWeaponVFXHandle:Deactivate()
    r0_45.SkinWeaponVFXHandle = nil
  end
end
function r1_0.ChangeSkinWeaponVFXColor(r0_46, r1_46)
  -- line: [391, 396] id: 46
  if r0_46.SkinWeaponVFXHandle and r0_46.SkinWeaponVFXHandle:IsValid() then
    r0_46.SkinWeaponVFXHandle:SetVariableLinearColor("Color", FLinearColor(r1_46.R, r1_46.G, r1_46.B))
  end
end
function r1_0.Component_OnDestruct(r0_47)
  -- line: [400, 403] id: 47
  EventManager:RemoveEvent(EventID.OnCharGradeLevelUp, r0_47)
  EventManager:RemoveEvent(EventID.OnWeaponBreakLevelUp, r0_47)
end
return r1_0
