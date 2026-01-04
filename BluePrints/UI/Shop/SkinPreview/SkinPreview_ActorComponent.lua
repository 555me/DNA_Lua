-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\Shop\SkinPreview\SkinPreview_ActorComponent.lua
-- version: lua54
-- line: [0, 0] id: 0
return {
  Construct = function(r0_1)
    -- line: [4, 10] id: 1
    r0_1.SpecialLightGesture = {
      [41020] = true,
      [41021] = true,
      [41022] = true,
    }
  end,
  UpdatePreviewActor = function(r0_2, r1_2, r2_2)
    -- line: [13, 48] id: 2
    r0_2.Avatar = GWorld:GetAvatar()
    if not r0_2.Avatar then
      return 
    end
    r0_2.UIName = r0_2:GetUIConfigName()
    r0_2.WeaponCameraOffset = r2_2 and FVector(0, 0, 0)
    r0_2:BlockAllUIInput(true)
    r0_2:AddDelayFrameFunc(function()
      -- line: [23, 25] id: 3
      r0_2:BlockAllUIInput(false)
    end, 31)
    r0_2.Params = r0_2:GenerateActorParams(r1_2)
    if not r0_2.Params then
      return 
    end
    r0_2.Params.Target = r0_2:CreatePreviewTargetData(r0_2.Params)
    if not r0_2.ActorController then
      r0_2:InitializePreviewActor(r1_2)
    else
      r0_2:HideAllPreviewActor()
      r0_2:StopActorSound()
      r0_2:UpdateExistingPreviewActor(r1_2)
    end
    r0_2.PreviewItemData = r1_2
    if r0_2.ActorController and r0_2.ActorController.UpdatePreviewSceneLight then
      if r0_2.SpecialLightGesture and r0_2.SpecialLightGesture[r1_2.TypeId] then
        r0_2.ActorController:UpdatePreviewSceneLight(true)
      else
        r0_2.ActorController:UpdatePreviewSceneLight(false)
      end
    end
  end,
  GenerateActorParams = function(r0_4, r1_4)
    -- line: [51, 71] id: 4
    local r2_4 = r1_4.ItemType
    if r2_4 == "Char" then
      return {
        Type = "Char",
        SkinId = r1_4.TypeId,
      }
    elseif r2_4 == "Weapon" then
      return {
        Type = "Weapon",
        SkinId = r1_4.TypeId,
      }
    elseif r2_4 == "Skin" then
      return r0_4:_GenerateSkinParams(r1_4)
    elseif r2_4 == "GeneralSkin" then
      return r0_4:_GenerateSkinSeriesParams(r1_4, r0_4.Avatar)
    elseif r2_4 == "WeaponSkin" then
      return r0_4:_GenerateWeaponSkinParams(r1_4)
    elseif r2_4 == "CharAccessory" then
      return r0_4:_GenerateCharAccessoryParams(r1_4, r0_4.Avatar)
    elseif r2_4 == "WeaponAccessory" then
      return r0_4:_GenerateWeaponAccessoryParams(r1_4, r0_4.Avatar)
    elseif r2_4 == "Resource" then
      return r0_4:_GenerateCharGestureParams(r1_4, r0_4.Avatar)
    end
    return nil
  end,
  _GenerateSkinParams = function(r0_5, r1_5)
    -- line: [73, 77] id: 5
    local r2_5 = DataMgr.Skin[r1_5.TypeId]
    if not r2_5 then
      return nil
    end
    return {
      Type = "Char",
      SkinId = r2_5.SkinId,
    }
  end,
  _GenerateSkinSeriesParams = function(r0_6, r1_6, r2_6)
    -- line: [79, 99] id: 6
    local r3_6 = r2_6.Chars[r2_6.CurrentChar].CharId
    local r6_6 = Const.DefaultAttributeMaster[r2_6.Sex]
    local r7_6 = nil
    for r12_6, r13_6 in pairs(DataMgr.Skin) do
      if r13_6.SkinSeries == r1_6.SkinSeries and r13_6.CharId == r3_6 then
        r7_6 = {
          Type = "Char",
          SkinId = r12_6,
        }
        break
      elseif r13_6.SkinSeries == r1_6.SkinSeries and r13_6.CharId == r6_6 then
        r7_6 = {
          Type = "Char",
          SkinId = r12_6,
        }
      end
    end
    -- close: r8_6
    if not r7_6 then
      return nil
    end
    r1_6.ItemType = "Skin"
    r1_6.TypeId = r7_6.SkinId
    return r7_6
  end,
  _GenerateWeaponSkinParams = function(r0_7, r1_7)
    -- line: [101, 105] id: 7
    local r2_7 = DataMgr.WeaponSkin[r1_7.TypeId]
    if not r2_7 then
      return nil
    end
    return {
      Type = "Weapon",
      SkinId = r2_7.SkinID,
    }
  end,
  _GenerateCharAccessoryParams = function(r0_8, r1_8, r2_8)
    -- line: [107, 117] id: 8
    local r3_8 = DataMgr.CharAccessory[r1_8.TypeId]
    if not r3_8 then
      return nil
    end
    local r4_8 = r2_8.Chars[r2_8.CurrentChar]
    return {
      Type = "Char",
      SkinId = r4_8.AppearanceSuits[r4_8.CurrentAppearanceIndex].SkinId,
      AccessoryId = r3_8.AccessoryId,
      AccessoryType = r3_8.AccessoryType,
    }
  end,
  _GenerateWeaponAccessoryParams = function(r0_9, r1_9, r2_9)
    -- line: [119, 145] id: 9
    local r3_9 = DataMgr.WeaponAccessory[r1_9.TypeId]
    if not r3_9 then
      return nil
    end
    local r4_9 = {
      Type = "Weapon",
      AccessoryId = r3_9.WeaponAccessoryId,
      AccessoryType = r3_9.AccessoryType,
      SkinId = nil,
    }
    local r5_9 = nil
    if r0_9.Tab_Change and r0_9.Tab_Change.TabIdx == 2 then
      r5_9 = r2_9.Weapons[r2_9.RangedWeapon]
    else
      r5_9 = r2_9.Weapons[r2_9.MeleeWeapon]
    end
    if r5_9 then
      local r6_9 = r5_9:GetCurrentSkin().SkinId
      if r6_9 ~= r5_9.WeaponId then
        r4_9.SkinId = r6_9
      end
    end
    return r4_9
  end,
  _GenerateCharGestureParams = function(r0_10, r1_10, r2_10)
    -- line: [147, 155] id: 10
    local r3_10 = r2_10.Chars[r2_10.CurrentChar]
    return {
      Type = "Char",
      SkinId = r3_10.AppearanceSuits[r3_10.CurrentAppearanceIndex].SkinId,
    }
  end,
  InitializePreviewActor = function(r0_11, r1_11)
    -- line: [158, 182] id: 11
    r0_11.ActorController = r0_11:CreatePreviewActor(r0_11.Params)
    local r2_11 = r1_11.ItemType
    if r2_11 == "Weapon" or r2_11 == "WeaponSkin" or r2_11 == "WeaponAccessory" then
      r0_11.ActorController.ExCameraOffset = r0_11.WeaponCameraOffset
    end
    r0_11.ActorController:OnOpened()
    r0_11.ActorController.bPlayRoleChangedSound = false
    if r2_11 == "Char" then
      r0_11:SetupInitialCharPreview(r1_11)
    elseif r2_11 == "Weapon" then
      r0_11:SetupInitialWeaponPreview(r1_11)
    elseif r2_11 == "Skin" then
      r0_11:SetupInitialSkinPreview(r1_11)
    elseif r2_11 == "WeaponSkin" then
      r0_11:SetupInitialWeaponSkinPreview(r1_11)
    elseif r2_11 == "Resource" then
      r0_11:SetupInitialResourcePreview(r1_11)
    elseif r2_11 == "CharAccessory" or r2_11 == "WeaponAccessory" then
      r0_11:ApplyAccessoryPreview(r2_11)
    end
  end,
  UpdateExistingPreviewActor = function(r0_12, r1_12)
    -- line: [185, 204] id: 12
    r0_12:CleanupPreviousPreviewEffects()
    local r2_12 = r1_12.ItemType
    if r2_12 == "Char" then
      r0_12:UpdateToCharPreview(r1_12)
    elseif r2_12 == "Weapon" then
      r0_12:UpdateToWeaponPreview(r1_12)
    elseif r2_12 == "Skin" then
      r0_12:UpdateToSkinPreview(r1_12)
    elseif r2_12 == "WeaponSkin" then
      r0_12:UpdateToWeaponSkinPreview(r1_12)
    elseif r2_12 == "CharAccessory" then
      r0_12:UpdateToCharAccessoryPreview(r1_12)
    elseif r2_12 == "WeaponAccessory" then
      r0_12:UpdateToWeaponAccessoryPreview(r1_12)
    elseif r2_12 == "Resource" then
      r0_12:UpdateToResourcePreview(r1_12)
    end
  end,
  CleanupPreviousPreviewEffects = function(r0_13)
    -- line: [207, 214] id: 13
    r0_13.ActorController:StopPlayerFX()
    r0_13.ActorController:DestoryCreature(CommonConst.CharAccessoryTypes.FX_Dead)
    r0_13.ActorController:DestoryCreature(CommonConst.CharAccessoryTypes.FX_Body)
    if r0_13.ActorController.ArmoryPlayer then
      r0_13.ActorController.ArmoryPlayer:RemoveAllEffectCreature()
    end
  end,
  SetupDefaultCharacterModel = function(r0_14)
    -- line: [217, 234] id: 14
    r0_14.ActorController:HidePlayerActor(r0_14.UIName, false)
    r0_14:HidePlayerWeapon(true)
    r0_14:HideSingleWeapon(true)
    local r1_14 = r0_14.Avatar.Chars[r0_14.Avatar.CurrentChar]
    local r2_14 = r1_14.AppearanceSuits[r1_14.CurrentAppearanceIndex].SkinId
    local r4_14 = r0_14:CreatePreviewTargetData({
      Type = "Char",
      SkinId = r2_14,
    })
    r0_14.ActorController.ArmoryHelper:SetOriginalRotation(FRotator(0, 90, 0))
    r0_14.ActorController.ExCameraOffset = FVector(0, 0, 0)
    r0_14.ActorController:ChangeCharModel(r4_14, true, true)
    r0_14.ActorController:ChangeCharAppearance({
      CharId = r1_14.CharId,
      SkinId = r2_14,
      AccessorySuit = {},
    })
    r0_14.ActorController.ArmoryHelper:SetPlayer(r0_14.ActorController.ArmoryPlayer)
  end,
  SetupInitialCharPreview = function(r0_15, r1_15)
    -- line: [238, 244] id: 15
    r0_15.ActorController:ChangeCharAppearance({
      CharId = DataMgr.Skin[r1_15.TypeId].CharId,
      SkinId = r1_15.TypeId,
      AccessorySuit = {},
    })
    r0_15.ActorController:SetMontageAndCamera("Char", nil, nil)
  end,
  SetupInitialWeaponPreview = function(r0_16, r1_16)
    -- line: [246, 250] id: 16
    local r2_16 = r0_16.Params.Target:HasTag("Melee")
    if r2_16 then
      r2_16 = "Melee" and "Ranged"
    else
      goto label_10	-- block#2 is visited secondly
    end
    r0_16.ActorController:SetMontageAndCamera("Weapon", r2_16)
    r0_16.ActorController.ArmoryHelper.EnableCameraScrolling = false
  end,
  SetupInitialSkinPreview = function(r0_17, r1_17)
    -- line: [252, 258] id: 17
    r0_17.ActorController:ChangeCharAppearance({
      CharId = DataMgr.Skin[r1_17.TypeId].CharId,
      SkinId = r1_17.TypeId,
      AccessorySuit = {},
    })
    r0_17.ActorController:SetMontageAndCamera("Char", nil, nil)
  end,
  SetupInitialWeaponSkinPreview = function(r0_18, r1_18)
    -- line: [260, 265] id: 18
    r0_18.ActorController:ChangeWeaponSkin(r1_18.TypeId)
    local r2_18 = r0_18.Params.Target:HasTag("Melee")
    if r2_18 then
      r2_18 = "Melee" and "Ranged"
    else
      goto label_14	-- block#2 is visited secondly
    end
    r0_18.ActorController:SetMontageAndCamera("Weapon", r2_18)
    r0_18.ActorController.ArmoryHelper.EnableCameraScrolling = false
  end,
  SetupInitialResourcePreview = function(r0_19, r1_19)
    -- line: [267, 290] id: 19
    local r2_19 = DataMgr.Resource[r1_19.TypeId]
    if r2_19 then
      if r2_19.ResourceSType == "GestureItem" then
        r0_19:ClearCharAccessory()
        r0_19.ActorController:ChangeWeaponModel(r0_19.Avatar.Weapons[r0_19.Avatar.MeleeWeapon])
        r0_19.ActorController:ChangeWeaponModel(r0_19.Avatar.Weapons[r0_19.Avatar.RangedWeapon])
        r0_19.EffectCreatureHideTags = {}
        if r0_19.ActorController.ArmoryPlayer.EffectCreatureHideTags then
          for r7_19, r8_19 in pairs(r0_19.ActorController.ArmoryPlayer.EffectCreatureHideTags) do
            r0_19.EffectCreatureHideTags[r7_19] = r8_19
            r0_19.ActorController.ArmoryPlayer:HideAllEffectCreature(r7_19, false)
          end
          -- close: r3_19
        end
        r0_19.ActorController:SetArmoryMontageTag(r0_19.ActorController.ArmoryPlayer, "Armory")
        r0_19.ActorController:SetArmoryCameraTag(r2_19.CameraName and "Char", "", "")
        r0_19.ActorController.ArmoryPlayer:InvokeResourceBPFunction(r1_19.TypeId)
      elseif r2_19.ResourceSType == "MountItem" then
      end
    end
  end,
  ApplyAccessoryPreview = function(r0_20, r1_20)
    -- line: [296, 315] id: 20
    r0_20.ActorController.bPlaySameMontage = true
    r0_20:UpdateAccessoryCamera(r0_20.Params.AccessoryId, r0_20.Params.AccessoryType)
    if r1_20 == "CharAccessory" then
      r0_20.ActorController:StopPlayerMontage()
      r0_20:ClearCharAccessory()
      if UIConst.FXAccessoryTypes[r0_20.Params.AccessoryType] then
        r0_20.ActorController:ShowPlayerFXAccessory(r0_20.Params.AccessoryId, r0_20.Params.AccessoryType)
        if UIConst.HidePlayerAccessoryTypes[r0_20.Params.AccessoryType] then
          r0_20.ActorController:HidePlayerActor(r0_20.UIName, true)
        end
      else
        r0_20.ActorController:ChangeCharAccessory(r0_20.Params.AccessoryId, r0_20.Params.AccessoryType)
      end
    else
      r0_20.ActorController:ChangeWeaponAccessory(r0_20.Params.AccessoryId)
      r0_20.ActorController.ArmoryHelper.EnableCameraScrolling = false
    end
  end,
  UpdateToCharPreview = function(r0_21, r1_21)
    -- line: [317, 335] id: 21
    r0_21.ActorController:HidePlayerActor(r0_21.UIName, false)
    r0_21:HidePlayerWeapon(true)
    r0_21:HideSingleWeapon(true)
    local r3_21 = r1_21.TypeId
    local r4_21 = {
      CharId = DataMgr.Skin[r1_21.TypeId].CharId,
      SkinId = r3_21,
      AccessorySuit = {},
    }
    r0_21.Params.Target = r0_21:CreatePreviewTargetData({
      Type = "Char",
      SkinId = r3_21,
    })
    r0_21.ActorController.ArmoryHelper:SetOriginalRotation(FRotator(0, 90, 0))
    r0_21.ActorController.ExCameraOffset = FVector(0, 0, 0)
    r0_21.ActorController:ChangeCharModel(r0_21.Params.Target, true, true)
    r0_21.ActorController.ArmoryHelper:SetPlayer(r0_21.ActorController.ArmoryPlayer)
    r0_21.ActorController:ChangeCharAppearance(r4_21)
    r0_21.ActorController.DelayFrame = 30
    r0_21.ActorController.bPlaySameMontage = true
    r0_21.ActorController:SetMontageAndCamera("Char", nil, nil)
  end,
  UpdateToWeaponPreview = function(r0_22, r1_22)
    -- line: [337, 347] id: 22
    r0_22.ActorController:HidePlayerActor(r0_22.UIName, true)
    r0_22:HidePlayerWeapon(true)
    local r2_22 = r0_22:CreatePreviewTargetData({
      Type = "Weapon",
      SkinId = r1_22.TypeId,
    })
    r0_22.ActorController.bStandaloneWeapon = true
    r0_22.ActorController.ExCameraOffset = r0_22.WeaponCameraOffset
    r0_22.ActorController:ChangeSingleWeapon(r2_22)
    r0_22.ActorController.ArmoryHelper.EnableCameraScrolling = false
  end,
  UpdateToSkinPreview = function(r0_23, r1_23)
    -- line: [349, 368] id: 23
    r0_23.ActorController:HidePlayerActor(r0_23.UIName, false)
    r0_23:HidePlayerWeapon(true)
    r0_23:HideSingleWeapon(true)
    local r3_23 = r1_23.TypeId
    local r4_23 = {
      CharId = DataMgr.Skin[r1_23.TypeId].CharId,
      SkinId = r3_23,
      AccessorySuit = {},
    }
    r0_23.Params.Target = r0_23:CreatePreviewTargetData({
      Type = "Char",
      SkinId = r3_23,
    })
    r0_23.ActorController.bStandaloneWeapon = false
    r0_23.ActorController.ArmoryHelper:SetOriginalRotation(FRotator(0, 90, 0))
    r0_23.ActorController.ExCameraOffset = FVector(0, 0, 0)
    r0_23.ActorController:ChangeCharModel(r0_23.Params.Target, true, true)
    r0_23.ActorController.ArmoryHelper:SetPlayer(r0_23.ActorController.ArmoryPlayer)
    r0_23.ActorController:ChangeCharAppearance(r4_23)
    r0_23.ActorController.DelayFrame = 30
    r0_23.ActorController.bPlaySameMontage = true
    r0_23.ActorController:SetMontageAndCamera("Char", nil, nil)
  end,
  UpdateToWeaponSkinPreview = function(r0_24, r1_24)
    -- line: [370, 381] id: 24
    r0_24.ActorController:HidePlayerActor(r0_24.UIName, true)
    r0_24:HidePlayerWeapon(true)
    local r2_24 = r0_24:CreatePreviewTargetData({
      Type = "Weapon",
      SkinId = r1_24.TypeId,
    })
    r0_24.ActorController.bStandaloneWeapon = true
    r0_24.ActorController.ExCameraOffset = r0_24.WeaponCameraOffset
    r0_24.ActorController:ChangeSingleWeapon(r2_24)
    r0_24.ActorController:ChangeWeaponSkin(r1_24.TypeId)
    r0_24.ActorController.ArmoryHelper.EnableCameraScrolling = false
  end,
  UpdateToCharAccessoryPreview = function(r0_25, r1_25)
    -- line: [383, 386] id: 25
    r0_25:SetupDefaultCharacterModel()
    r0_25:ApplyAccessoryPreview("CharAccessory")
  end,
  UpdateToWeaponAccessoryPreview = function(r0_26, r1_26)
    -- line: [388, 405] id: 26
    r0_26.ActorController:HidePlayerActor(r0_26.UIName, true)
    r0_26:HidePlayerWeapon(true)
    r0_26:HideSingleWeapon(false)
    local r2_26 = DataMgr.WeaponAccessory[r1_26.TypeId]
    if not r2_26 then
      return 
    end
    r0_26.ActorController.ExCameraOffset = r0_26.WeaponCameraOffset
    if r0_26.Tab_Change and r0_26.Tab_Change.TabIdx == 2 then
      r0_26.Tab_Change:BtnSwitchToLeft()
      r0_26.ActorController:ChangeSingleWeapon(r0_26.Avatar.Weapons[r0_26.Avatar.MeleeWeapon])
    else
      r0_26.ActorController:ChangeSingleWeapon(r0_26.Avatar.Weapons[r0_26.Avatar.MeleeWeapon], r0_26.LastItemType == "WeaponAccessory")
    end
    r0_26.ActorController:ChangeWeaponAccessory(r2_26.WeaponAccessoryId)
    r0_26.ActorController.ArmoryHelper.EnableCameraScrolling = false
  end,
  UpdateToResourcePreview = function(r0_27, r1_27)
    -- line: [407, 415] id: 27
    r0_27:SetupDefaultCharacterModel()
    r0_27.ActorController:SetArmoryMontageTag(r0_27.ActorController.ArmoryPlayer, "Armory")
    r0_27.ActorController.ArmoryPlayer:InvokeResourceBPFunction(r1_27.TypeId)
    r0_27.ActorController:SetArmoryCameraTag(DataMgr.Resource[r1_27.TypeId].CameraName and "Char", "", "")
  end,
  ClearCharAccessory = function(r0_28)
    -- line: [417, 428] id: 28
    r0_28.ActorController:StopPlayerFX()
    r0_28.ActorController:DestoryCreature(CommonConst.CharAccessoryTypes.FX_Dead)
    r0_28.ActorController:DestoryCreature(CommonConst.CharAccessoryTypes.FX_Body)
    if r0_28.ActorController.ArmoryPlayer then
      r0_28.ActorController.ArmoryPlayer:RemoveAllEffectCreature()
    end
    local r1_28 = r0_28.Avatar.Chars[r0_28.Avatar.CurrentChar]
    r0_28.ActorController:ChangeCharAppearance({
      CharId = r1_28.CharId,
      SkinId = r1_28.AppearanceSuits[r1_28.CurrentAppearanceIndex].SkinId,
      AccessorySuit = {},
    })
  end,
  ApplySuitPreview = function(r0_29, r1_29)
    -- line: [434, 464] id: 29
    local r2_29 = DataMgr.Reward[r1_29.SuitRewardId[1]]
    if not r2_29 then
      return 
    end
    r0_29.ActorController:HidePlayerActor(r0_29.UIName, false)
    r0_29:HideSingleWeapon(true)
    local r3_29 = {
      CharId = -1,
      SkinId = -1,
      AccessorySuit = {},
    }
    local r4_29 = r1_29.ItemType
    if r4_29 == "Skin" then
      r3_29.CharId = DataMgr.Skin[r1_29.TypeId].CharId
      r3_29.SkinId = r1_29.TypeId
    end
    if r4_29 == "WeaponSkin" or r4_29 == "WeaponAccessory" then
      r0_29:HideSingleWeapon(true)
      r0_29.ActorController.ArmoryHelper:SetOriginalRotation(FRotator(0, 90, 0))
    end
    if r4_29 ~= "Skin" then
      r0_29.ActorController.DelayFrame = 30
    end
    for r8_29 = 1, #r2_29.Id, 1 do
      if r4_29 ~= "Skin" or r2_29.Type[r8_29] ~= "Skin" then
        r0_29:ApplySingleRewardItem(r2_29.Type[r8_29], r2_29.Id[r8_29], r3_29)
      end
    end
    r0_29.ActorController:ChangeCharAppearance(r3_29)
  end,
  ApplySingleRewardItem = function(r0_30, r1_30, r2_30, r3_30)
    -- line: [466, 493] id: 30
    if r1_30 == "Skin" then
      r0_30.ActorController:ChangeCharModel(r0_30:CreatePreviewTargetData({
        Type = "Char",
        SkinId = r2_30,
      }), true, true)
      r3_30.CharId = DataMgr.Skin[r2_30].CharId
      r3_30.SkinId = r2_30
      r0_30:HideZoomKey(false)
    elseif r1_30 == "WeaponSkin" then
      r0_30:HidePlayerWeapon(false)
      local r4_30 = r0_30:CreatePreviewTargetData({
        Type = "Weapon",
        SkinId = r2_30,
      })
      r0_30.ActorController:ChangeWeaponModel(r4_30)
      r0_30.ActorController:ChangePlayerWeaponSkin(r2_30)
      local r5_30 = r4_30:HasTag("Melee")
      if r5_30 then
        r5_30 = "Melee" and "Ranged"
      else
        goto label_51	-- block#5 is visited secondly
      end
      r0_30.ActorController.DelayFrame = 30
      r0_30.ActorController.bPlaySameMontage = true
      r0_30.ActorController:SetMontageAndCamera("Weapon", r5_30)
    elseif r1_30 == "CharAccessory" then
      r3_30.AccessorySuit[CommonConst.NewCharAccessoryTypes[DataMgr.CharAccessory[r2_30].AccessoryType]] = r2_30
      r0_30:HideZoomKey(false)
    elseif r1_30 == "WeaponAccessory" then
      r0_30:HidePlayerWeapon(false)
      r0_30.ActorController:ChangePlayerWeaponAccessory(r2_30)
    end
  end,
  RevertToSingleItemPreview = function(r0_31, r1_31)
    -- line: [495, 507] id: 31
    local r2_31 = r1_31.ItemType
    if r2_31 == "Skin" then
      r0_31:RevertToSkinPreview(r1_31)
    elseif r2_31 == "WeaponSkin" then
      r0_31:RevertToWeaponSkinPreview(r1_31)
    elseif r2_31 == "CharAccessory" then
      r0_31:RevertToCharAccessoryPreview(r1_31)
    elseif r2_31 == "WeaponAccessory" then
      r0_31:RevertToWeaponAccessoryPreview(r1_31)
    end
  end,
  RevertToSkinPreview = function(r0_32, r1_32)
    -- line: [514, 523] id: 32
    r0_32.ActorController:ChangeCharAppearance({
      CharId = DataMgr.Skin[r1_32.TypeId].CharId,
      SkinId = r1_32.TypeId,
      AccessorySuit = {},
    })
    r0_32.ActorController.DelayFrame = 30
    r0_32.ActorController:SetMontageAndCamera(CommonConst.ArmoryType.Char, nil, nil)
    r0_32.ActorController.bStandaloneWeapon = true
    r0_32:HideZoomKey(false)
  end,
  RevertToWeaponSkinPreview = function(r0_33, r1_33)
    -- line: [526, 537] id: 33
    r0_33.ActorController:HidePlayerActor(r0_33.UIName, true)
    r0_33:HidePlayerWeapon(true)
    local r2_33 = r0_33:CreatePreviewTargetData({
      Type = "Weapon",
      SkinId = r1_33.TypeId,
    })
    r0_33.ActorController.ExCameraOffset = r0_33.WeaponCameraOffset
    r0_33.ActorController.ArmoryHelper:SetOriginalRotation(FRotator(0, 0, 0))
    r0_33.ActorController:ChangeSingleWeapon(r2_33)
    r0_33.ActorController:ChangeWeaponSkin(r1_33.TypeId)
    r0_33.ActorController.ArmoryHelper.EnableCameraScrolling = false
    r0_33.ActorController.bStandaloneWeapon = true
    r0_33:HideZoomKey(true)
  end,
  RevertToCharAccessoryPreview = function(r0_34, r1_34)
    -- line: [540, 551] id: 34
    local r2_34 = DataMgr.CharAccessory[r1_34.TypeId]
    local r3_34 = r0_34.Avatar.Chars[r0_34.Avatar.CurrentChar]
    r0_34.ActorController:ChangeCharModel(r0_34:CreatePreviewTargetData({
      Type = "Char",
      SkinId = r3_34.AppearanceSuits[r3_34.CurrentAppearanceIndex].SkinId,
    }), true, true)
    r0_34:UpdateAccessoryCamera(r2_34.AccessoryId, r2_34.AccessoryType)
    r0_34.ActorController:StopPlayerMontage()
    r0_34.ActorController:ChangeCharAccessory(r2_34.AccessoryId, r2_34.AccessoryType)
    r0_34:HideZoomKey(false)
  end,
  RevertToWeaponAccessoryPreview = function(r0_35, r1_35)
    -- line: [554, 571] id: 35
    r0_35.ActorController:HidePlayerActor(r0_35.UIName, true)
    local r2_35 = DataMgr.WeaponAccessory[r1_35.TypeId]
    if not r2_35 then
      return 
    end
    r0_35.ActorController:ResetActorRotation()
    r0_35.ActorController.ExCameraOffset = r0_35.WeaponCameraOffset
    if r0_35.Tab_Change.TabIdx == 2 then
      r0_35.ActorController:ChangeSingleWeapon(r0_35.Avatar.Weapons[r0_35.Avatar.RangedWeapon])
    else
      r0_35.ActorController:ChangeSingleWeapon(r0_35.Avatar.Weapons[r0_35.Avatar.MeleeWeapon])
    end
    r0_35.ActorController:ChangeWeaponAccessory(r2_35.WeaponAccessoryId)
    r0_35.ActorController.ArmoryHelper.EnableCameraScrolling = false
    r0_35:HideZoomKey(true)
  end,
  SwitchWeaponAccessoryPreview = function(r0_36, r1_36)
    -- line: [576, 599] id: 36
    if not r0_36.ActorController or not r0_36.Avatar then
      return 
    end
    local r2_36 = nil
    if r1_36 == 1 then
      r2_36 = r0_36.Avatar.Weapons[r0_36.Avatar.MeleeWeapon]
    elseif r1_36 == 2 then
      r2_36 = r0_36.Avatar.Weapons[r0_36.Avatar.RangedWeapon]
    else
      return 
    end
    if not r2_36 then
      return 
    end
    local r3_36 = r0_36.Params and r0_36.Params.AccessoryId
    if not r3_36 then
      return 
    end
    r0_36.ActorController.ExCameraOffset = r0_36.WeaponCameraOffset
    r0_36.ActorController:ChangeSingleWeapon(r2_36)
    r0_36.ActorController:ChangeWeaponAccessory(r3_36)
  end,
  ReplayGesture = function(r0_37, r1_37)
    -- line: [602, 610] id: 37
    if not r0_37.ActorController or not r0_37.ActorController.ArmoryPlayer then
      return 
    end
    local r2_37 = DataMgr.Resource[r1_37]
    if r2_37 and r2_37.ResourceSType == "GestureItem" then
      r0_37.ActorController.ArmoryPlayer:InvokeResourceBPFunction(r1_37)
    end
  end,
  ForceUpdateLight = function(r0_38)
    -- line: [614, 622] id: 38
    if r0_38.ActorController and r0_38.ActorController.UpdatePreviewSceneLight then
      if r0_38.PreviewItemData and r0_38.SpecialLightGesture and r0_38.SpecialLightGesture[r0_38.PreviewItemData.TypeId] then
        r0_38.ActorController:UpdatePreviewSceneLight(true, true)
      else
        r0_38.ActorController:UpdatePreviewSceneLight(false, true)
      end
    end
  end,
  HidePlayerWeapon = function(r0_39, r1_39)
    -- line: [624, 629] id: 39
    if not r0_39.ActorController:GetPlayerWeaponActor() then
      return 
    end
    r0_39.ActorController:GetPlayerWeaponActor():SetActorHideTag(r0_39.UIName, r1_39)
  end,
  HideSingleWeapon = function(r0_40, r1_40)
    -- line: [631, 640] id: 40
    if not UIManager(r0_40).ShowWeapon then
      return 
    end
    UIManager(r0_40).ShowWeapon:SetActorHideTag(r0_40.UIName, r1_40)
  end,
  HideAllPreviewActor = function(r0_41)
    -- line: [642, 648] id: 41
    if r0_41.ActorController then
      r0_41.ActorController:HidePlayerActor(r0_41.UIName, true)
      r0_41:HidePlayerWeapon(true)
      r0_41:HideSingleWeapon(true)
    end
  end,
  StopActorSound = function(r0_42)
    -- line: [650, 656] id: 42
    if r0_42.ActorController and r0_42.ActorController.ArmoryPlayer then
      r0_42.ActorController:StopPlayerMontage()
      r0_42.ActorController:StopPlayerFX()
      r0_42.ActorController.ArmoryPlayer:RemoveAllEffectCreature()
    end
  end,
  SetCameraToDefault = function(r0_43)
    -- line: [658, 671] id: 43
    if r0_43.CurrentCameraState == "Default" then
      return 
    end
    local r1_43 = UE4.UGameplayStatics.GetPlayerController(r0_43, 0)
    local r2_43 = UE4.UGameplayStatics.GetPlayerCharacter(r0_43, 0)
    local r3_43 = r0_43.ActorController
    if r1_43 and r2_43 and r3_43 then
      r1_43:SetViewTargetWithBlend(r2_43)
      r0_43.CurrentCameraState = "Default"
    end
  end,
  SetCameraToPreviewActor = function(r0_44)
    -- line: [673, 687] id: 44
    if r0_44.CurrentCameraState == "Preview" then
      return 
    end
    local r1_44 = UE4.UGameplayStatics.GetPlayerController(r0_44, 0)
    local r2_44 = r0_44.ActorController
    if r1_44 and r2_44 then
      local r3_44 = r2_44:GetViewTarget()
      if r3_44 then
        r1_44:SetViewTargetWithBlend(r3_44)
        r0_44.CurrentCameraState = "Preview"
      end
    end
  end,
  DestroyPreviewActor = function(r0_45)
    -- line: [691, 697] id: 45
    if r0_45.ActorController then
      r0_45.ActorController:DestroyMount()
      r0_45.ActorController:OnDestruct()
      r0_45.ActorController = nil
    end
  end,
  ClosePreview = function(r0_46)
    -- line: [699, 708] id: 46
    if r0_46.ActorController and r0_46.EffectCreatureHideTags then
      for r5_46, r6_46 in pairs(r0_46.EffectCreatureHideTags) do
        r0_46.ActorController.ArmoryPlayer:HideAllEffectCreature(r5_46, r6_46)
      end
      -- close: r1_46
    end
  end,
  "BluePrints.Common.DelayFrameComponent"
}
