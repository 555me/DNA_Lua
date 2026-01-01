-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Client\Entities\Components\AppearanceMgr.lua
-- version: lua54
-- line: [0, 0] id: 0
return {
  CheckWeaponSkinEnough = function(r0_1, r1_1)
    -- line: [3, 11] id: 1
    for r6_1, r7_1 in pairs(r1_1) do
      if not r0_1.OwnedWeaponSkins[r6_1] then
        return false
      end
    end
    -- close: r2_1
    return true
  end,
  CheckWeaponAccessoryEnough = function(r0_2, r1_2)
    -- line: [13, 20] id: 2
    for r6_2, r7_2 in pairs(r1_2) do
      if not r0_2.WeaponAccessorys:HasValue(r6_2) then
        return false
      end
    end
    -- close: r2_2
    return true
  end,
  CheckSkinEnough = function(r0_3, r1_3)
    -- line: [22, 47] id: 3
    for r6_3, r7_3 in pairs(r1_3) do
      local r8_3 = DataMgr.Skin[r6_3]
      if not r8_3 or not r8_3.CharId then
        return false
      end
      local r9_3 = r8_3.CharId
      if not CommonUtils.HasValue(DataMgr.Char[r9_3].SkinId, r6_3) then
        return false
      end
      local r11_3 = r0_3.CommonChars[r9_3]
      if r11_3 then
        if r11_3.OwnedSkins[r6_3] == nil then
          return false
        end
      else
        local r12_3 = r0_3.OtherCharSkins[r9_3]
        if not r12_3 then
          return false
        end
        if not r12_3:HasValue(r6_3) then
          return false
        end
      end
    end
    -- close: r2_3
    return true
  end,
  CheckCharAccessoryEnough = function(r0_4, r1_4)
    -- line: [49, 62] id: 4
    if next(r1_4) == nil then
      return true
    end
    for r6_4, r7_4 in pairs(r1_4) do
      if not DataMgr.CharAccessory[r6_4] then
        return false
      end
      if not r0_4.CharAccessorys:HasValue(r6_4) then
        return false
      end
    end
    -- close: r2_4
    return true
  end,
  AddNewCharAppearance = function(r0_5)
    -- line: [64, 69] id: 5
    r0_5:CallServer("AddNewCharAppearance", function(r0_6)
      -- line: [65, 67] id: 6
      DebugPrint("ZJT_ AddNewCharAppearance ", r0_6)
    end, r0_5.CurrentChar)
  end,
  SwitchCurrentCharAppearance = function(r0_7, r1_7, r2_7)
    -- line: [71, 78] id: 7
    if not r1_7 then
      r1_7 = r0_7.CurrentChar
    end
    r0_7:CallServer("SwitchCurrentCharAppearance", function(r0_8)
      -- line: [73, 76] id: 8
      DebugPrint("ZJT_ SwitchCurrentCharAppearance", r0_8)
      EventManager:FireEvent(EventID.OnCharAppearanceChanged, r0_8, r1_7, r2_7)
    end, r1_7, r2_7)
  end,
  SetCharAppearanceAccessory = function(r0_9, r1_9, r2_9, r3_9)
    -- line: [80, 88] id: 9
    DebugPrint("ZJT_ SetCharAppearanceAccessory ", r1_9, r2_9, r3_9)
    if not r1_9 then
      r1_9 = r0_9.CurrentChar
    end
    r0_9:CallServer("SetCharAppearanceAccessory", function(r0_10)
      -- line: [83, 86] id: 10
      DebugPrint("ZJT_ OnSetCharAppearanceAccessory ", r0_10)
      EventManager:FireEvent(EventID.OnCharAccessorySetted, r0_10, r1_9, r2_9, r3_9)
    end, r1_9, r2_9, r3_9)
  end,
  RemoveCharAppearanceAccessory = function(r0_11, r1_11, r2_11, r3_11)
    -- line: [91, 98] id: 11
    if not r1_11 then
      r1_11 = r0_11.CurrentChar
    end
    r0_11:CallServer("RemoveCharAppearanceAccessory", function(r0_12)
      -- line: [93, 96] id: 12
      DebugPrint("ZJT_ RemoveCharAppearanceAccessory ", r0_12)
      EventManager:FireEvent(EventID.OnCharAccessoryRemoved, r0_12, r1_11, r2_11, r3_11)
    end, r1_11, r2_11, r3_11)
  end,
  SetCharSkinShowPart = function(r0_13, r1_13, r2_13, r3_13)
    -- line: [100, 106] id: 13
    r0_13:CallServer("SetCharSkinShowPart", function(r0_14)
      -- line: [101, 104] id: 14
      r0_13.logger.debug("ZJT_ 1 SetCharSkinShowPart ServerCallClient ", r0_14, r1_13, r2_13, r3_13)
      EventManager:FireEvent(EventID.OnCharShowPartMesh, r0_14, r1_13, r2_13, r3_13)
    end, r1_13, r2_13, r3_13)
  end,
  ChangeCharAppearanceSkin = function(r0_15, r1_15, r2_15, r3_15)
    -- line: [108, 115] id: 15
    DebugPrint("ZJT_ ChangeCharAppearanceSkin", r1_15, r2_15, r3_15)
    r0_15:CallServer("ChangeCharAppearanceSkin", function(r0_16)
      -- line: [110, 113] id: 16
      DebugPrint("ZJT_ OnChangeCharAppearanceSkin ", r0_16)
      EventManager:FireEvent(EventID.OnCharSkinChanged, r0_16, r1_15, r2_15, r3_15)
    end, r1_15, r2_15, r3_15)
  end,
  SetCharCornerVisibility = function(r0_17, r1_17, r2_17, r3_17)
    -- line: [117, 124] id: 17
    if not r1_17 then
      r1_17 = r0_17.CurrentChar
    end
    r0_17:CallServer("SetCharCornerVisibility", function(r0_18)
      -- line: [119, 122] id: 18
      DebugPrint("ZJT_ SetCharCornerVisibility ", r0_18)
      EventManager:FireEvent(EventID.OnCharCornerVisibilityChanged, r0_18, r1_17, r2_17, r3_17)
    end, r1_17, r2_17, r3_17)
  end,
  ChangeWeaponAppearanceAccessory = function(r0_19, r1_19, r2_19)
    -- line: [127, 133] id: 19
    r0_19:CallServer("ChangeWeaponAppearanceAccessory", function(r0_20)
      -- line: [128, 131] id: 20
      r0_19.logger.debug("ZJT_ OnChangeWeaponAppearanceAccessory callback", r0_20, r2_19)
      EventManager:FireEvent(EventID.OnWeaponAccessoryChanged, r0_20, r1_19, r2_19)
    end, r1_19, r2_19)
  end,
  ChangeWeaponAppearanceSkin = function(r0_21, r1_21, r2_21)
    -- line: [136, 143] id: 21
    r0_21.logger.debug("ZJT_ ChangeWeaponAppearanceSkin Start", CommonUtils.ObjId2Str(r1_21), r2_21)
    r0_21:CallServer("ChangeWeaponAppearanceSkin", function(r0_22)
      -- line: [138, 141] id: 22
      r0_21.logger.debug("ZJT_ OnChangeWeaponAppearanceSkin callback", r0_22, r2_21)
      EventManager:FireEvent(EventID.OnWeaponSkinChanged, r0_22, r1_21, r2_21)
    end, r1_21, r2_21)
  end,
  SwitchCurrentWeaponSkinColorPlan = function(r0_23, r1_23, r2_23, r3_23)
    -- line: [146, 153] id: 23
    r0_23.logger.debug("SwitchCurrentWeaponSkinColorPlan Start", CommonUtils.ObjId2Str(r1_23), r2_23, r3_23)
    r0_23:CallServer("SwitchCurrentWeaponSkinColorPlan", function(r0_24)
      -- line: [148, 151] id: 24
      r0_23.logger.debug("SwitchCurrentWeaponSkinColorPlan callback", r0_24, r2_23, r3_23)
      EventManager:FireEvent(EventID.OnWeaponSkinColorPlanChanged, r0_24, r1_23, r2_23, r3_23)
    end, r1_23, r2_23, r3_23)
  end,
  ChangeWeaponSkinColors = function(r0_25, r1_25, r2_25, r3_25, r4_25)
    -- line: [157, 164] id: 25
    r0_25.logger.debug("ChangeWeaponSkinColors Start", CommonUtils.ObjId2Str(r1_25), r2_25)
    r0_25:CallServer("ChangeWeaponSkinColors", function(r0_26)
      -- line: [159, 162] id: 26
      EventManager:FireEvent(EventID.OnWeaponColorsChanged, r0_26, r1_25, r2_25, r3_25, r4_25)
      r0_25.logger.debug("ZJT_ OnChangeWeaponSkinColors callback", r0_26, r2_25, r3_25)
    end, r1_25, r2_25, r3_25, r4_25)
  end,
  ChangeWeaponSkinSpecialColor = function(r0_27, r1_27, r2_27, r3_27, r4_27)
    -- line: [167, 174] id: 27
    r0_27.logger.debug("ChangeWeaponSkinSpecialColor Start", CommonUtils.ObjId2Str(r1_27), r2_27, r3_27, r4_27)
    r0_27:CallServer("ChangeWeaponSkinSpecialColor", function(r0_28)
      -- line: [169, 172] id: 28
      r0_27.logger.debug("ChangeWeaponSkinSpecialColor callback", r0_28, r2_27)
      EventManager:FireEvent(EventID.OnWeaponColorsChanged, r0_28, r1_27, r2_27, r3_27, r4_27)
    end, r1_27, r2_27, r3_27, r4_27)
  end,
  UpdateCharAppearanceSuitName = function(r0_29, r1_29, r2_29, r3_29)
    -- line: [176, 182] id: 29
    r0_29:CallServer("UpdateCharAppearanceSuitName", function(r0_30)
      -- line: [177, 180] id: 30
      r0_29.logger.debug("ZJT_ UpdateCharAppearanceSuitName ", r0_30, r3_29)
      EventManager:FireEvent(EventID.OnCharAppearanSuitRenamed, r0_30, r1_29, r2_29, r3_29)
    end, r1_29, r2_29, r3_29)
  end,
  UpdateWeaponAppearanceSuitName = function(r0_31, r1_31, r2_31)
    -- line: [185, 191] id: 31
    r0_31:CallServer("UpdateWeaponAppearanceSuitName", function(r0_32)
      -- line: [186, 189] id: 32
      r0_31.logger.debug("ZJT_ UpdateWeaponAppearanceSuitName ", r0_32, r2_31)
      EventManager:FireEvent(EventID.OnWeaponAppearanSuitRenamed, r0_32, r1_31, r2_31)
    end, r1_31, r2_31)
  end,
  SwitchCurrentCharSkinColorPlan = function(r0_33, r1_33, r2_33)
    -- line: [194, 200] id: 33
    r0_33:CallServer("SwitchCurrentCharSkinColorPlan", function(r0_34)
      -- line: [195, 198] id: 34
      r0_33.logger.debug("ZJT_ ServerCallClient SwitchCurrentCharSkinColorPlan ", r0_34, r1_33, r2_33)
      EventManager:FireEvent(EventID.OnCharSkinColorPlanChanged, r0_34, r1_33, r2_33)
    end, r1_33, r2_33)
  end,
  ChangeCharSkinColors = function(r0_35, r1_35, r2_35, r3_35)
    -- line: [202, 210] id: 35
    if not r3_35 then
      r3_35 = 1
    end
    if type(r2_35) ~= "table" or not r1_35 or not DataMgr.Skin[r1_35] then
      return 
    end
    r0_35:CallServer("ChangeCharSkinColors", function(r0_36)
      -- line: [205, 208] id: 36
      r0_35.logger.debug("ChangeCharSkinColors, Ret", r0_36, r1_35, r2_35)
      EventManager:FireEvent(EventID.OnCharColorsChanged, r0_36, r1_35, r2_35)
    end, r1_35, r3_35, r2_35)
  end,
}
