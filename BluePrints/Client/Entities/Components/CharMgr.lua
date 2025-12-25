-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Client\Entities\Components\CharMgr.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("BluePrints.Common.MVC.Model.CharModel")
return {
  EnterWorld = function(r0_1)
    -- line: [5, 7] id: 1
    r0_0:Init(r0_1)
  end,
  LeaveWorld = function(r0_2)
    -- line: [9, 11] id: 2
    r0_0:Destory()
  end,
  GetCharUuidByCharId = function(r0_3, r1_3)
    -- line: [13, 15] id: 3
    return r0_0:GetUuidByCharId(r1_3)
  end,
  CheckCharEnough = function(r0_4, r1_4)
    -- line: [17, 31] id: 4
    for r6_4, r7_4 in pairs(r1_4) do
      local r8_4 = false
      for r13_4, r14_4 in pairs(r0_4.Chars) do
        if r14_4.CharId == r6_4 then
          r8_4 = true
          break
        end
      end
      -- close: r9_4
      if not r8_4 then
        return false
      end
    end
    -- close: r2_4
    return true
  end,
  _OnPropChangeChars = function(r0_5, r1_5)
    -- line: [33, 52] id: 5
    local r2_5 = r1_5 and r1_5[1]
    if r2_5 then
      if r0_0:GetCardLevelResourceByUuid(r2_5) and not r0_5.Chars[r2_5] then
        EventManager:FireEvent(EventID.OnCharDeleted, r2_5)
      elseif r0_5.Chars[r2_5] then
        r0_0:OnNewCharObtained(r2_5)
        EventManager:FireEvent(EventID.OnNewCharObtained, r2_5)
      end
      if r1_5[2] == "GradeLevel" then
        EventManager:FireEvent(EventID.OnCharCardLevelResourcesChanged, nil, nil, r2_5)
      end
    end
  end,
  _OnPropChangeCommonChars = function(r0_6, r1_6)
    -- line: [54, 64] id: 6
    local r2_6 = r1_6 and r1_6[1]
    if not r2_6 then
      return 
    end
    local r3_6 = r0_6.CommonChars[r2_6]
    if not r3_6 then
      return 
    end
    for r8_6, r9_6 in pairs(r3_6.OwnedSkins and {}) do
      if r0_0:GetCharIdBySkinId(r8_6) == nil then
        EventManager:FireEvent(EventID.OnNewCharSkinObtained, r8_6, r2_6)
      end
    end
    -- close: r4_6
  end,
  _OnPropChangeOtherCharSkins = function(r0_7, r1_7)
    -- line: [66, 76] id: 7
    local r2_7 = r1_7 and r1_7[1]
    if not r2_7 then
      return 
    end
    local r3_7 = r0_7.OtherCharSkins[r2_7]
    if not r3_7 then
      return 
    end
    for r8_7, r9_7 in pairs(r3_7 and {}) do
      if r0_0:GetCharIdBySkinId(r9_7) == nil then
        EventManager:FireEvent(EventID.OnNewCharSkinObtained, r9_7, r2_7)
      end
    end
    -- close: r4_7
  end,
  _OnPropChangeResources = function(r0_8, r1_8)
    -- line: [78, 87] id: 8
    local r2_8 = r1_8 and r1_8[1]
    if r2_8 then
      for r8_8, r9_8 in pairs(r0_0:GetCharIdsByCardLevelResource(r2_8, r0_8) and {}) do
        EventManager:FireEvent(EventID.OnCharCardLevelResourcesChanged, r2_8, r8_8, r0_0:GetUuidByCharId(r8_8))
      end
      -- close: r4_8
    end
  end,
  _OnPropChangeStoredCollectReward = function(r0_9, r1_9)
    -- line: [89, 94] id: 9
    local r2_9 = string.split
    local r3_9 = nil	-- notice: implicit variable refs by block#[3]
    if r1_9 then
      r3_9 = r1_9[1]
      if not r3_9 then
        ::label_7::
        r3_9 = ""
      end
    else
      goto label_7	-- block#2 is visited secondly
    end
    r2_9 = r2_9(r3_9, ".")
    r3_9 = #r2_9
    if r3_9 > 0 then
      r0_0:OnPropChangeStoredCollectReward(r2_9)
    end
  end,
  IsCharHasReward = function(r0_10, r1_10)
    -- line: [96, 98] id: 10
    return r0_0:IsCharHasReward(r1_10)
  end,
  _OnPropChangeCharAccessorys = function(r0_11)
    -- line: [100, 106] id: 11
    for r5_11, r6_11 in pairs(r0_11.CharAccessorys) do
      if not r0_0:IsCharAccessoryExist(r6_11) then
        EventManager:FireEvent(EventID.OnNewCharAccessoryObtained, r6_11)
      end
    end
    -- close: r1_11
  end,
  ChangeChar = function(r0_12, r1_12)
    -- line: [111, 117] id: 12
    r0_12:CallServer("ChangeChar", function(r0_13, r1_13)
      -- line: [112, 115] id: 13
      r0_12.logger.debug("ChangeChar", r0_13, r1_13)
      r1_12(r0_13, r1_13)
    end)
  end,
  SwitchCurrentChar = function(r0_14, r1_14)
    -- line: [120, 125] id: 14
    r0_14.logger.debug("SwitchCurrentChar", r1_14)
    r0_14:CallServerMethod("SwitchCurrentChar", r1_14)
  end,
  OnSwitchCurrentChar = function(r0_15, r1_15, r2_15)
    -- line: [128, 134] id: 15
    r0_15.logger.debug("OnSwitchCurrentChar", r1_15, r2_15)
    EventManager:FireEvent(EventID.OnSwitchCurrentChar, r1_15, r2_15)
    if r1_15 == ErrorCode.RET_SUCCESS then
      EventManager:FireEvent(EventID.OnSwitchRole, r2_15)
    end
  end,
  SwitchWeapon = function(r0_16, r1_16, r2_16)
    -- line: [138, 142] id: 16
    r0_16:CallServerMethod("SwitchWeapon", r1_16, r2_16)
  end,
  OnSwitchWeapon = function(r0_17, r1_17, r2_17, r3_17)
    -- line: [144, 151] id: 17
    EventManager:FireEvent(EventID.OnChangeWeapon, r1_17, r2_17, r3_17)
    if not ErrorCode:Check(r1_17) then
      return 
    end
    EventManager:FireEvent(EventID.OnSwitchWeapon, r2_17, r3_17)
    print(_G.LogTag, "OnSwitchWeapon : " .. r0_17.Weapons[r3_17].WeaponId)
  end,
  ChangeCharMod = function(r0_18, r1_18, r2_18, r3_18, r4_18, r5_18)
    -- line: [154, 162] id: 18
    r0_18:CallServer("ChangeCharMod", function(r0_19)
      -- line: [155, 160] id: 19
      r0_18.logger.debug("ZJT_ ChangeCharMod callback", r0_19)
      if not r1_18 then
        return 
      end
      r1_18.Func(r1_18.Obj, r0_19, r2_18, r3_18, r4_18, r5_18, table.unpack(r1_18.ExParams))
    end, r2_18, r3_18, r4_18, r5_18)
  end,
  ExchangeCharMod = function(r0_20, r1_20, r2_20, r3_20, r4_20, r5_20)
    -- line: [166, 173] id: 20
    r0_20:CallServer("ExchangeCharMod", function(r0_21)
      -- line: [167, 171] id: 21
      r0_20.logger.debug("ZJT_ ExchangeCharMod callback", r0_21)
      if not r1_20 then
        return 
      end
      r1_20.Func(r1_20.Obj, r0_21, r2_20, r3_20, r4_20, r5_20)
    end, r2_20, r3_20, r4_20, r5_20)
  end,
  TakeOffCharMod = function(r0_22, r1_22, r2_22, r3_22, r4_22)
    -- line: [177, 185] id: 22
    r0_22:CallServer("TakeOffCharMod", function(r0_23)
      -- line: [178, 183] id: 23
      r0_22.logger.debug("ZJT_ TakeOffCharMod callback")
      if not r1_22 then
        return 
      end
      r1_22.Func(r1_22.Obj, r0_23, r2_22, r3_22, r4_22, table.unpack(r1_22.ExParams))
    end, r2_22, r3_22, r4_22)
  end,
  ChangeCharModSuit = function(r0_24, r1_24, r2_24, r3_24)
    -- line: [189, 200] id: 24
    if r0_24.Chars[r2_24].ModSuitIndex == r3_24 then
      return 
    end
    r0_24:CallServer("ChangeCharModSuit", function(r0_25)
      -- line: [194, 198] id: 25
      r0_24.logger.debug("ChangeCharModSuit callback", r0_25)
      if not r1_24 then
        return 
      end
      r1_24.Func(r1_24.Obj, r0_25, r2_24, r3_24)
    end, r2_24, r3_24)
  end,
  UpSkillLevel = function(r0_26, r1_26, r2_26, r3_26, r4_26)
    -- line: [205, 212] id: 26
    r0_26:CallServer("UpSkillLevel", function(r0_27)
      -- line: [207, 210] id: 27
      r0_26.logger.debug("UpSkillLevel callback", r0_27)
      EventManager:FireEvent(EventID.OnCharSkillLevelUp, r0_27, r3_26, r4_26, r4_26 + 1)
    end, r1_26, r2_26, r3_26, r4_26)
  end,
  ActivateCharSkillTreeNode = function(r0_28, r1_28, r2_28, r3_28)
    -- line: [215, 222] id: 28
    r0_28.logger.debug("ActivateCharSkillTreeNode Begin", r2_28, r3_28)
    r0_28:CallServer("ActivateCharSkillTreeNode", function(r0_29)
      -- line: [217, 220] id: 29
      r0_28.logger.debug("ActivateCharSkillTreeNode callback", r0_29)
      EventManager:FireEvent(EventID.OnCharSkillTreeNodeActivated, r0_29, r1_28, r2_28, r3_28)
    end, r1_28, r2_28, r3_28)
  end,
  UnlockCharUsePiece = function(r0_30, r1_30)
    -- line: [225, 232] id: 30
    r0_30.logger.debug("UnlockCharUsePiece Begin", r1_30)
    r0_30:CallServer("UnlockCharUsePiece", function(r0_31)
      -- line: [227, 230] id: 31
      r0_30.logger.debug("UnlockCharUsePiece Callback", r0_31)
      EventManager:FireEvent(EventID.OnUnlockCharUsePiece, r0_31, r1_30)
    end, r1_30)
  end,
  UpCharGradeLevel = function(r0_32, r1_32, r2_32)
    -- line: [235, 241] id: 32
    r0_32:CallServer("UpCharGradeLevel", function(r0_33)
      -- line: [236, 239] id: 33
      r0_32.logger.debug("UpCharGradeLevel callback", r0_33)
      EventManager:FireEvent(EventID.OnCharGradeLevelUp, r0_33, r1_32, r2_32)
    end, r1_32, r2_32)
  end,
  CharLevelUp = function(r0_34, r1_34, r2_34, r3_34)
    -- line: [244, 258] id: 34
    r0_34.logger.debug("CharLevelUp", CommonUtils.ObjId2Str(r1_34), r2_34, r3_34)
    local r4_34 = r0_34.Chars[r1_34]
    if not r4_34 then
      return 
    end
    if r2_34 ~= r4_34.Level or r3_34 <= r2_34 then
      return 
    end
    r0_34:CallServer("CharLevelUp", function(r0_35)
      -- line: [253, 256] id: 35
      r0_34.logger.debug("CharLevelUp, Ret", r0_35, CommonUtils.ObjId2Str(r1_34), r2_34, r3_34)
      EventManager:FireEvent(EventID.OnCharLevelUp, r0_35, r1_34, r2_34, r3_34)
    end, r1_34, r2_34, r3_34)
  end,
  CharBreakLevelUp = function(r0_36, r1_36, r2_36)
    -- line: [261, 274] id: 36
    local r3_36 = r0_36.Chars[r1_36]
    if not r3_36 then
      return 
    end
    if r3_36.EnhanceLevel + 1 ~= r2_36 then
      return 
    end
    r0_36:CallServer("CharBreakLevelUp", function(r0_37)
      -- line: [269, 272] id: 37
      r0_36.logger.debug("CharBreakLevelUp, Ret", r0_37, CommonUtils.ObjId2Str(r1_36), r0_36.Chars[r1_36].EnhanceLevel)
      EventManager:FireEvent(EventID.OnCharBreakLevelUp, r0_37, r1_36, r0_36.Chars[r1_36].EnhanceLevel)
    end, r1_36)
  end,
  GetCurrentCharConfigID = function(r0_38)
    -- line: [276, 282] id: 38
    DebugPrint("GetCurrentCharConfigID")
    return r0_38.Chars[r0_38.CurrentChar].CharId
  end,
  GetCurrentMeleeWeaponConfigID = function(r0_39)
    -- line: [284, 286] id: 39
    return r0_39.Weapons[r0_39.MeleeWeapon].WeaponId
  end,
  GetCurrentRangedWeaponConfigID = function(r0_40)
    -- line: [288, 290] id: 40
    return r0_40.Weapons[r0_40.RangedWeapon].WeaponId
  end,
  UpdateCharModSuitName = function(r0_41, r1_41, r2_41, r3_41, r4_41)
    -- line: [295, 302] id: 41
    r0_41:CallServer("UpdateCharModSuitName", function(r0_42)
      -- line: [296, 300] id: 42
      r0_41.logger.debug("UpdateCharModSuitName callback", r0_42)
      if not r1_41 then
        return 
      end
      r1_41.Func(r1_41.Obj, r0_42, r2_41, r3_41, r4_41)
    end, r2_41, r3_41, r4_41)
  end,
  TakeOffAllCharMod = function(r0_43, r1_43, r2_43, r3_43)
    -- line: [304, 312] id: 43
    assert(r0_43.Chars[r2_43])
    r0_43:CallServer("TakeOffAllCharMod", function(r0_44)
      -- line: [306, 310] id: 44
      r0_43.logger.debug("TakeOffAllCharMod ServerCallClient", r0_44)
      if not r1_43 then
        return 
      end
      r1_43.Func(r1_43.Obj, r0_44, r2_43, r3_43)
    end, r2_43, r3_43)
  end,
  CheckAlternativeChar = function(r0_45, r1_45)
    -- line: [315, 321] id: 45
    r0_45:CallServer("CheckAlternativeChar", function(r0_46)
      -- line: [316, 319] id: 46
      r0_45.logger.debug("CheckAlternativeChar Callback", r0_46)
      r1_45(r0_46)
    end)
  end,
}
