-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Client\AvatarUtils.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {}
local r1_0 = require("BluePrints.Client.BattleDumpUtils")
local r2_0 = require("Utils.CommonUtils")
function r0_0.GetModCostInSuit_ExchangeMod(r0_1, r1_1, r2_1, r3_1, r4_1, r5_1, r6_1)
  -- line: [6, 23] id: 1
  local r7_1, r8_1, r9_1, r10_1, r11_1 = r0_1:GetModCostInSuit_SwitchMod(r1_1, r2_1, r3_1, r4_1)
  local r14_1 = r1_1.Mods[r10_1[r5_1]]
  local r15_1 = r1_1.Mods[r10_1[r6_1]]
  local r16_1 = 0
  local r17_1 = 0
  if r14_1 then
    r16_1 = r16_1 + r0_1:GetModSlotCost(r11_1, r5_1, r14_1) - (r8_1[r14_1.Polarity] and 0)
    r17_1 = r17_1 + r0_1:GetModSlotCost(r11_1, r6_1, r14_1) - (r8_1[r14_1.Polarity] and 0)
  end
  if r15_1 then
    r16_1 = r16_1 + r0_1:GetModSlotCost(r11_1, r6_1, r15_1) - (r8_1[r15_1.Polarity] and 0)
    r17_1 = r17_1 + r0_1:GetModSlotCost(r11_1, r5_1, r15_1) - (r8_1[r15_1.Polarity] and 0)
  end
  return math.max(0, r7_1 - r16_1 + r17_1)
end
function r0_0.GetModSlotCost(r0_2, r1_2, r2_2, r3_2)
  -- line: [26, 31] id: 2
  return r0_2:GetModSlotCostImpl(r3_2.Polarity, r3_2.Cost, r1_2.ModSlotPolarity[r2_2])
end
function r0_0.GetModSlotCostImpl(r0_3, r1_3, r2_3, r3_3)
  -- line: [33, 44] id: 3
  if r3_3 <= 0 then
    return r2_3
  end
  if r1_3 == r3_3 then
    return r2_0:PerfectPolarityCost(r2_3)
  elseif r1_3 > 0 then
    return r2_0:WrongPolarityCost(r2_3)
  else
    return r2_3
  end
end
function r0_0.GetModCostInSuit_ChangeMod(r0_4, r1_4, r2_4, r3_4, r4_4, r5_4, r6_4)
  -- line: [46, 73] id: 4
  local r7_4, r8_4, r9_4, r10_4, r11_4, r12_4 = r0_4:CheckGetModCostInSuit(r1_4, r2_4, r3_4, r4_4)
  if not r7_4 then
    return r8_4, r9_4, r10_4
  end
  local r19_4 = nil	-- notice: implicit variable refs by block#[8]
  for r17_4, r18_4 in pairs(r11_4) do
    local r20_4 = nil	-- notice: implicit variable refs by block#[12, 16]
    if r17_4 == r5_4 then
      if r6_4 then
        if r6_4 then
          r19_4 = r0_4:GetModSlotCost(r12_4, r17_4, r6_4)
          if not r19_4 then
            ::label_29::
            r19_4 = 0
          end
        else
          goto label_29	-- block#7 is visited secondly
        end
        r8_4 = r8_4 + r19_4
        r0_4:CalcReduceMod(r6_4, r9_4, r10_4)
      else
        r19_4 = r1_4.Mods[r18_4]
        if r19_4 then
          r20_4 = r0_4:GetModSlotCost(r12_4, r17_4, r19_4)
          if not r20_4 then
            ::label_49::
            r20_4 = 0
          end
        else
          goto label_49	-- block#11 is visited secondly
        end
        r8_4 = r8_4 + r20_4
        r0_4:CalcReduceMod(r19_4, r9_4, r10_4)
      end
    else
      r19_4 = r1_4.Mods[r18_4]
      if r19_4 then
        r20_4 = r0_4:GetModSlotCost(r12_4, r17_4, r19_4)
        if not r20_4 then
          ::label_69::
          r20_4 = 0
        end
      else
        goto label_69	-- block#15 is visited secondly
      end
      r8_4 = r8_4 + r20_4
      r0_4:CalcReduceMod(r19_4, r9_4, r10_4)
    end
  end
  -- close: r13_4
  for r17_4, r18_4 in pairs(r9_4) do
    r19_4 = r10_4[r17_4]
    if r19_4 then
      r19_4 = r18_4 * r10_4[r17_4]
      r8_4 = r8_4 - r19_4
    end
  end
  -- close: r13_4
  return math.max(0, r8_4)
end
function r0_0.CheckGetModCostInSuit(r0_5, r1_5, r2_5, r3_5, r4_5)
  -- line: [75, 96] id: 5
  local r5_5 = nil
  local r6_5 = {}
  local r7_5 = {}
  local r8_5 = 0
  local r9_5 = nil
  if r2_5 == "Char" then
    r5_5 = r1_5.Chars[r3_5]
  elseif r2_5 == "Weapon" then
    r5_5 = r1_5.Weapons[r3_5]
  elseif r2_5 == "UWeapon" then
    r5_5 = r1_5.UWeapons[r3_5]
  end
  if not r5_5 then
    return false, r8_5, r6_5, r7_5, r9_5, r5_5
  end
  r9_5 = r0_5:GetTargetModSuit(r5_5, r4_5)
  if not r9_5 then
    return false, r8_5, r6_5, r7_5, r9_5, r5_5
  end
  return true, r8_5, r6_5, r7_5, r9_5, r5_5
end
function r0_0.GetModCostInSuit_SwitchMod(r0_6, r1_6, r2_6, r3_6, r4_6, r5_6, r6_6, r7_6)
  -- line: [98, 137] id: 6
  if not r7_6 then
    r7_6 = r0_6.CheckGetModCostInSuit
  end
  local r8_6, r9_6, r10_6, r11_6, r12_6, r13_6 = r7_6(r0_6, r1_6, r2_6, r3_6, r4_6)
  if not r8_6 then
    return r9_6, r10_6, r11_6, r12_6, r13_6
  end
  for r18_6, r19_6 in pairs(r12_6) do
    local r21_6 = nil	-- notice: implicit variable refs by block#[19, 27]
    if r5_6 then
      local r20_6 = r5_6.Uuid
      if r19_6 == r20_6 then
        if r6_6 then
          if r6_6 then
            r20_6 = r0_6:GetModSlotCost(r13_6, r18_6, r6_6) and 0
          else
            goto label_38	-- block#10 is visited secondly
          end
          r9_6 = r9_6 + r20_6
          r0_6:CalcReduceMod(r6_6, r10_6, r11_6)
        else
          r21_6 = r5_6.Uuid
          r20_6 = r1_6.Mods[r21_6]
          if r20_6 then
            r21_6 = r0_6:GetModSlotCost(r13_6, r18_6, r20_6) and 0
          else
            goto label_59	-- block#14 is visited secondly
          end
          r9_6 = r9_6 + r21_6
          r0_6:CalcReduceMod(r20_6, r10_6, r11_6)
        end
      else
        r20_6 = r1_6.Mods[r19_6]
        if r20_6 then
          r21_6 = r0_6:GetModSlotCost(r13_6, r18_6, r20_6)
          if not r21_6 then
            ::label_79::
            r21_6 = 0
          end
        else
          goto label_79	-- block#18 is visited secondly
        end
        r9_6 = r9_6 + r21_6
        r0_6:CalcReduceMod(r20_6, r10_6, r11_6)
      end
    elseif r6_6 then
      r9_6 = r9_6 + (r0_6:GetModSlotCost(r13_6, r18_6, r6_6) and 0)
      r0_6:CalcReduceMod(r6_6, r10_6, r11_6)
    else
      local r20_6 = r1_6.Mods[r19_6]
      if r20_6 then
        r21_6 = r0_6:GetModSlotCost(r13_6, r18_6, r20_6)
        if not r21_6 then
          ::label_117::
          r21_6 = 0
        end
      else
        goto label_117	-- block#26 is visited secondly
      end
      r9_6 = r9_6 + r21_6
      r0_6:CalcReduceMod(r20_6, r10_6, r11_6)
    end
  end
  -- close: r14_6
  for r18_6, r19_6 in pairs(r10_6) do
    if r11_6[r18_6] then
      r9_6 = r9_6 - r19_6 * r11_6[r18_6]
    end
  end
  -- close: r14_6
  return math.max(0, r9_6), r10_6, r10_6, r12_6, r13_6
end
function r0_0.GetModCostInSuit_TakeOffMod(r0_7, r1_7, r2_7, r3_7, r4_7, r5_7)
  -- line: [139, 161] id: 7
  local r6_7, r7_7, r8_7, r9_7, r10_7, r11_7 = r0_7:CheckGetModCostInSuit(r1_7, r2_7, r3_7, r4_7)
  local r12_7 = 0
  if not r6_7 then
    return r7_7, r8_7, r9_7, r12_7
  end
  for r17_7, r18_7 in pairs(r10_7) do
    local r20_7 = nil	-- notice: implicit variable refs by block#[7]
    if r17_7 ~= r5_7 then
      local r19_7 = r1_7.Mods[r18_7]
      if r19_7 then
        r20_7 = r0_7:GetModSlotCost(r11_7, r17_7, r19_7)
        if not r20_7 then
          ::label_31::
          r20_7 = 0
        end
      else
        goto label_31	-- block#6 is visited secondly
      end
      r7_7 = r7_7 + r20_7
      r0_7:CalcReduceMod(r19_7, r1_7, r8_7, r9_7)
    else
      local r19_7 = r1_7.Mods[r18_7]
      if r19_7 then
        r20_7 = r19_7:CalcExtralCharVolume()
        r12_7 = r20_7 and 0
      else
        goto label_49	-- block#10 is visited secondly
      end
    end
  end
  -- close: r13_7
  for r17_7, r18_7 in pairs(r8_7) do
    if r9_7[r17_7] then
      r7_7 = r7_7 - r18_7 * r9_7[r17_7]
    end
  end
  -- close: r13_7
  return math.max(0, r7_7), r8_7, r9_7, r12_7
end
function r0_0.CalcReduceMod(r0_8, r1_8, r2_8, r3_8)
  -- line: [164, 174] id: 8
  if r1_8 then
    if r1_8.ReducePolarityEffect then
      if r2_8[r1_8.ReducePolarityEffect[1]] == nil then
        r2_8[r1_8.ReducePolarityEffect[1]] = 0
      end
      r2_8[r1_8.ReducePolarityEffect[1]] = r2_8[r1_8.ReducePolarityEffect[1]] + r1_8.ReducePolarityEffect[2]
    end
    r1_8:CountModPolarity(r3_8)
  end
end
function r0_0.GetProperty(r0_9, r1_9, r2_9, r3_9)
  -- line: [177, 190] id: 9
  local r4_9 = nil
  if r2_9 == "Char" then
    r4_9 = r1_9.Chars[r3_9]
  elseif r2_9 == "Weapon" then
    r4_9 = r1_9.Weapons[r3_9]
  elseif r2_9 == "UWeapon" then
    r4_9 = r1_9.UWeapons[r3_9]
  end
  if not r4_9 then
    return false
  end
  return true, r4_9
end
function r0_0.IsHaveModRepeatGroup(r0_10, r1_10, r2_10)
  -- line: [192, 202] id: 10
  if not r1_10 or not r2_10 then
    return false
  end
  for r7_10, r8_10 in ipairs(r2_10) do
    if r2_0.HasValue(r1_10, r8_10) then
      return true
    end
  end
  -- close: r3_10
  return false
end
function r0_0.CheckChangeModRepeat(r0_11, r1_11, r2_11, r3_11, r4_11, r5_11, r6_11, r7_11)
  -- line: [205, 276] id: 11
  -- error: decompile function#11: Condition failed: `def_pos <= last_end && last_end <= self.stmts.len()`
end
function r0_0.CheckModRepeat(r0_12, r1_12, r2_12, r3_12, r4_12, r5_12, r6_12)
  -- line: [280, 282] id: 12
  return r0_12:CheckChangeModRepeat(r1_12, r2_12, r3_12, r4_12, nil, r5_12, r6_12)
end
function r0_0.HasAvatarStatusChanged(r0_13, r1_13, r2_13, r3_13)
  -- line: [285, 298] id: 13
  if not r1_13 then
    r1_13 = {}
  end
  if type(r3_13) == "number" then
    return r1_13[r3_13] ~= r2_13[r3_13]
  elseif type(r3_13) == "table" then
    for r8_13, r9_13 in ipairs(r3_13) do
      return r1_13[r9_13] ~= r2_13[r9_13]
    end
    -- close: r4_13
  end
end
function r0_0.GetAttrNameFromAttrData(r0_14, r1_14, r2_14)
  -- line: [301, 316] id: 14
  local r3_14 = r1_14.AttrName
  if r3_14 == "DamageRate" or r3_14 == "DamagedRate" then
    if r1_14.IndividualRateZone then
      r3_14 = r3_14 .. "_NoTag_" .. r2_14
    else
      local r4_14 = r1_14.DamageTag and "NoTag"
      r3_14 = r3_14 .. "_" .. tostring(r4_14) .. "_" .. tostring((r1_14.RateZone and "Normal"))
    end
  elseif DataMgr.AttributeType[r3_14] then
    r3_14 = r3_14 .. "_" .. (r1_14.Type and "Normal")
  end
  return r3_14
end
function r0_0.IsStorylineComplete(r0_15, r1_15, r2_15)
  -- line: [319, 321] id: 15
  return r0_0:IsStorylineSuccess(r1_15, r2_15) and r0_0:IsStorylineFailure(r1_15, r2_15)
end
function r0_0.IsStorylineUnComplete(r0_16, r1_16, r2_16)
  -- line: [323, 325] id: 16
  return not r0_0:IsStorylineComplete(r1_16, r2_16)
end
function r0_0.IsStorylineSuccess(r0_17, r1_17, r2_17)
  -- line: [327, 329] id: 17
  return r1_17.ImpressionTalkTriggers[r2_17] == CommonConst.ImpressionCheckType.Success
end
function r0_0.IsStorylineFailure(r0_18, r1_18, r2_18)
  -- line: [331, 333] id: 18
  return r1_18.ImpressionTalkTriggers[r2_18] == CommonConst.ImpressionCheckType.Failed
end
function r0_0.GetDefaultBattleInfo(r0_19, ...)
  -- line: [337, 343] id: 19
  local r1_19 = r1_0:GetDefaultBattleInfo(...)
  if r1_19 then
    r1_19.Camp = "Player"
  end
  return r1_19
end
function r0_0.GetCurrentBattleInfo(r0_20, ...)
  -- line: [345, 349] id: 20
  return {
    CharacterInfo = r1_0:GetDefaultBattleInfo(...),
  }
end
function r0_0.GetDefaultAvatarInfo(r0_21)
  -- line: [352, 363] id: 21
  local r1_21 = {
    RoleId = Const.DefaultRoleId,
  }
  if Const.DeafaultMeleeWeapon then
    r1_21.MeleeWeapon = {
      WeaponId = Const.DeafaultMeleeWeapon,
    }
  end
  if Const.DeafaultRangedWeapon then
    r1_21.RangedWeapon = {
      WeaponId = Const.DeafaultRangedWeapon,
    }
  end
  return r1_21
end
function r0_0.GetPhantomBattleInfo(r0_22, ...)
  -- line: [366, 368] id: 22
  return r1_0:GetPhantomBattleInfo(...)
end
function r0_0.GetCharBattleInfo(r0_23, ...)
  -- line: [371, 373] id: 23
  return r1_0:GetCharBattleInfo(...)
end
function r0_0.GetWeaponBattleInfo(r0_24, ...)
  -- line: [376, 378] id: 24
  return r1_0:GetWeaponBattleInfo(...)
end
function r0_0.GetBattleInfoByQuestRoleId(r0_25, ...)
  -- line: [381, 383] id: 25
  return r1_0:GetBattleInfoByQuestRoleId(...)
end
function r0_0.GetSquadInfoByQuestRoleId(r0_26, ...)
  -- line: [386, 388] id: 26
  return r1_0:GetSquadInfoByQuestRoleId(...)
end
function r0_0.UpdateBattleInfo(r0_27, ...)
  -- line: [391, 393] id: 27
  return r1_0:UpdateBattleInfo(...)
end
function r0_0.GetAbyssBattleInfo(r0_28, r1_28, r2_28, r3_28, r4_28, r5_28, r6_28, r7_28, r8_28, r9_28)
  -- line: [396, 423] id: 28
  if not r1_28 then
    return 
  end
  local r10_28 = {}
  local r11_28 = {
    Char = r2_28,
    MeleeWeapon = r3_28,
    RangedWeapon = r4_28,
    Pet = r9_28,
  }
  if r11_28.Char then
    r11_28.CharModSuit = r11_28.Char.ModSuitIndex
    r11_28.UltraWeapons = r1_0:GetDefaultUltraWeaponInfo(r1_28, r11_28.Char)
  end
  if r11_28.MeleeWeapon then
    r11_28.MeleeWeaponModSuit = r11_28.MeleeWeapon.ModSuitIndex
  end
  if r11_28.RangedWeapon then
    r11_28.RangedWeaponModSuit = r11_28.RangedWeapon.ModSuitIndex
  end
  r10_28.CharacterInfo = r1_0:GetBattleInfoByInfo(r1_28, r11_28)
  r10_28.PhantomInfo1 = r0_28:GetPhantomBattleInfo(r1_28, r5_28, r6_28, r9_28)
  r10_28.PhantomInfo2 = r0_28:GetPhantomBattleInfo(r1_28, r7_28, r8_28, r9_28)
  return r10_28
end
function r0_0.ReShapeSquadInfo(r0_29, r1_29, r2_29)
  -- line: [427, 449] id: 29
  local r3_29 = {
    Char = r1_29.Chars[r2_29.Char],
    CharModSuit = r2_29.ModSuit,
    MeleeWeapon = r1_29.Weapons[r2_29.MeleeWeapon],
    MeleeWeaponModSuit = r2_29.MeleeWeaponModSuit,
    MeleeWeaponModSuitSecondary = r2_29.MeleeWeaponModSuitSecondary,
    RangedWeapon = r1_29.Weapons[r2_29.RangedWeapon],
    RangedWeaponModSuit = r2_29.RangedWeaponModSuit,
    Pet = r1_29.Pets[r2_29.Pet],
    WheelIndex = r2_29.WheelIndex,
    Phantom1 = r2_29.Phantom1,
    PhantomWeapon1 = r2_29.PhantomWeapon1,
    Phantom2 = r2_29.Phantom2,
    PhantomWeapon2 = r2_29.PhantomWeapon2,
  }
  if r3_29.Char then
    r3_29.UltraWeapons = r1_0:GetDefaultUltraWeaponInfo(r1_29, r3_29.Char)
  end
  return r3_29
end
function r0_0.GetSquadBattleInfo(r0_30, r1_30, r2_30, r3_30)
  -- line: [452, 469] id: 30
  if not r1_30 or not r2_30 then
    return 
  end
  local r4_30 = r2_30.Pet
  return {
    CharacterInfo = r1_0:GetBattleInfoByInfo(r1_30, r2_30, r3_30),
    PhantomInfo1 = r0_30:GetPhantomBattleInfo(r1_30, r1_30.Chars[r2_30.Phantom1], r1_30.Weapons[r2_30.PhantomWeapon1], r4_30, r3_30),
    PhantomInfo2 = r0_30:GetPhantomBattleInfo(r1_30, r1_30.Chars[r2_30.Phantom2], r1_30.Weapons[r2_30.PhantomWeapon2], r4_30, r3_30),
  }
end
function r0_0.GetWeaponDetails(r0_31, r1_31, r2_31)
  -- line: [471, 492] id: 31
  local r3_31 = {
    WeaponId = r1_31,
    WeaponLevel = r2_31,
    NeedEnhance = false,
  }
  local r4_31 = GWorld:GetAvatar()
  if not r4_31 then
    return nil
  end
  local r5_31 = r0_31:AddTemplateWeapon(r3_31, r4_31)
  if not r5_31 then
    return nil
  end
  return r5_31:BattleDump(r4_31)
end
function r0_0.GetTargetModSuit(r0_32, r1_32, r2_32)
  -- line: [494, 507] id: 32
  if not r1_32 then
    return nil
  end
  if not r2_32 then
    return nil
  end
  local r3_32 = "ModSuit_" .. r2_32
  if not r1_32[r3_32] then
    return nil
  end
  return r1_32[r3_32]
end
function r0_0.SetModSlotPolarity(r0_33, r1_33, r2_33, r3_33)
  -- line: [510, 514] id: 33
  if r1_33 and r1_33.ModSlotPolarity and r2_33 and r1_33.ModSlotPolarity[r2_33] then
    r1_33.ModSlotPolarity[r2_33] = r3_33
  end
end
function r0_0.GetModSlotPolarity(r0_34, r1_34, r2_34)
  -- line: [516, 521] id: 34
  if r1_34 and r1_34.ModSlotPolarity and r2_34 and r1_34.ModSlotPolarity[r2_34] then
    return r1_34.ModSlotPolarity[r2_34]
  end
  return CommonConst.NonePolarity
end
function r0_0.ModSlotIsUnLock(r0_35, r1_35, r2_35)
  -- line: [523, 528] id: 35
  if r1_35 ~= nil and r1_35.ModSlotStatus ~= nil and r2_35 ~= nil and r1_35.ModSlotStatus[r2_35] ~= nil then
    return r1_35.ModSlotStatus[r2_35] == CommonConst.CommonStatus.UnLock
  end
  return false
end
function r0_0.UnLockModSlot(r0_36, r1_36, r2_36)
  -- line: [530, 534] id: 36
  if r1_36 and r1_36.ModSlotStatus and r2_36 and r1_36.ModSlotStatus[r2_36] then
    r1_36.ModSlotStatus[r2_36] = CommonConst.CommonStatus.UnLock
  end
end
function r0_0.GenerateModSuitInfo(r0_37, r1_37, r2_37, r3_37, r4_37)
  -- line: [537, 589] id: 37
  local r5_37 = nil
  local r6_37 = nil
  if r2_37 == "Char" then
    local r7_37 = r1_37.Chars[r3_37]
    if r7_37 then
      r5_37 = r7_37
      r6_37 = {
        r2_37,
        r7_37.CharId,
        r7_37.Level,
        r7_37.EnhanceLevel,
        r7_37.GradeLevel
      }
    end
  elseif r2_37 == "Weapon" then
    local r7_37 = r1_37.Weapons[r3_37]
    if r7_37 then
      r5_37 = r7_37
    end
    r6_37 = {
      r2_37,
      r7_37.WeaponId,
      r7_37.Level,
      r7_37.EnhanceLevel,
      r7_37.GradeLevel
    }
  elseif r2_37 == "UWeapon" then
    local r7_37 = r1_37.UWeapons[r3_37]
    if r7_37 then
      r5_37 = r7_37
    end
    r6_37 = {
      r2_37,
      r7_37.WeaponId,
      r7_37.Level,
      r7_37.EnhanceLevel,
      r7_37.GradeLevel
    }
  end
  table.insert(r6_37, r5_37.ModSuitsName[r4_37] and string.format("Mod_SuitName_%s", r4_37))
  if not r5_37 then
    return 
  end
  local r8_37 = r0_37:GetTargetModSuit(r5_37, r4_37)
  if not r8_37 then
    return 
  end
  local r9_37 = {
    TargetInfo = r6_37,
  }
  local r10_37 = {}
  for r15_37, r16_37 in pairs(r8_37) do
    r10_37[r15_37] = {}
    if r16_37 ~= -1 then
      local r17_37 = r1_37.Mods[r16_37]
      if r17_37 then
        r10_37[r15_37] = {
          r5_37.ModSlotPolarity[r15_37],
          r17_37.ModId,
          r17_37.Level,
          r17_37.CurrentModCardLevel
        }
      else
        r10_37[r15_37] = {
          r5_37.ModSlotPolarity[r15_37]
        }
      end
    else
      r10_37[r15_37] = {
        r5_37.ModSlotPolarity[r15_37]
      }
    end
  end
  -- close: r11_37
  r9_37.ModsInfo = r10_37
  return r9_37
end
function r0_0.InitModInfo(r0_38, r1_38, r2_38, r3_38)
  -- line: [592, 622] id: 38
  if r2_38.ModData then
    return 
  end
  local r4_38 = r2_38.ModSuit
  if not r4_38 then
    return 
  end
  local r5_38 = r0_38:GetTargetModSuit(r3_38, r4_38)
  if not r5_38 then
    return 
  end
  local r6_38 = {}
  local r7_38 = {}
  for r12_38, r13_38 in pairs(r5_38) do
    local r14_38 = r1_38.Mods[r13_38]
    if r14_38 then
      table.insert(r6_38, r14_38)
    end
    table.insert(r7_38, {
      SlotId = r12_38,
      Polarity = r3_38.ModSlotPolarity[r12_38],
      ModEid = r13_38,
    })
  end
  -- close: r8_38
  r2_38.SlotData = r7_38
  r2_38.ModData = r6_38
end
function r0_0.DumpModData(r0_39, r1_39)
  -- line: [625, 652] id: 39
  if not r1_39.ModData then
    return 
  end
  local r2_39 = {}
  for r7_39, r8_39 in ipairs(r1_39.ModData) do
    local r9_39 = {
      Uuid = r8_39.Uuid,
      ModId = r8_39.ModId,
      Level = r8_39.Level,
      Count = r8_39.Count,
      IsOriginal = r8_39.IsOriginal,
      LockState = r8_39.LockState,
      Cost = r8_39.Cost,
      CharUuids = {},
      WeaponUuids = {},
      CurrentModCardLevel = r8_39.CurrentModCardLevel,
    }
    for r14_39, r15_39 in ipairs(r8_39.CharUuids) do
      table.insert(r9_39.CharUuids, r15_39)
    end
    -- close: r10_39
    for r14_39, r15_39 in ipairs(r8_39.WeaponUuids) do
      table.insert(r9_39.WeaponUuids, r15_39)
    end
    -- close: r10_39
    table.insert(r2_39, r9_39)
  end
  -- close: r3_39
  return r2_39
end
function r0_0.RebuildModSuit(r0_40, r1_40)
  -- line: [657, 670] id: 40
  if skynet then
    return 
  end
  local r2_40 = require("BluePrints.Client.CustomTypes.Mod")
  local r3_40 = require("BluePrints.Client.CustomTypes.CustomTypes")
  local r4_40 = r2_40.ModSuits()
  for r8_40 = 1, 3, 1 do
    for r14_40, r15_40 in pairs(r4_40:AddModSuit(r1_40.ModSlotPolarity, r1_40.ModSlotStatus, r1_40.EnhanceLevel)) do
      r15_40.ModEid = r1_40[string.format("ModSuit_%d", r8_40)][r14_40]
    end
    -- close: r10_40
  end
  r1_40.ModSuits = r4_40
  r1_40.ModSuitsCostMap = r3_40.Int2IntDict()
end
function r0_0.CalculateFishPrice(r0_41, r1_41, r2_41)
  -- line: [673, 692] id: 41
  if not r1_41 then
    return 0
  end
  if not r2_41 then
    return 0
  end
  local r3_41 = DataMgr.ResourceId2FishId[r1_41]
  if not r3_41 then
    return 0
  end
  local r4_41 = DataMgr.Fish[r3_41]
  if not r4_41.PriceOnWeight then
    return 0
  end
  local r5_41 = r4_41.PriceOnWeight
  local r6_41 = r5_41[1]
  r2_41 = math.min(r2_41, r4_41.FishLength[2] * CommonConst.FishSizeScale)
  local r8_41 = (r4_41.FishLength[2] - r4_41.FishLength[1]) * CommonConst.FishSizeScale / r5_41[2]
  local r9_41 = (r2_41 - r4_41.FishLength[1] * CommonConst.FishSizeScale) // r8_41
  if (r2_41 - r4_41.FishLength[1] * CommonConst.FishSizeScale) % r8_41 == 0 then
    r9_41 = math.max(r9_41 + -1, 0)
  end
  return r6_41 + r9_41 * r5_41[3]
end
function r0_0.GetTargetDataStatistics(r0_42, r1_42, r2_42, r3_42)
  -- line: [696, 706] id: 42
  if not r1_42 or not r3_42 or not r2_42 then
    return 0
  end
  if r2_42 == "Char" then
    local r4_42 = r1_42.CommonChars[r3_42]
    if r4_42 then
      return r4_42.Count
    end
    return 0
  end
  return r1_42.DataStatistics[r2_42 .. r3_42] and 0
end
function r0_0.GetPlayerPersonalInfoChar(r0_43, r1_43, r2_43)
  -- line: [709, 802] id: 43
  local r3_43 = {}
  if r1_43.PersonalInfo and r1_43.PersonalInfo.CharDisplay then
    for r8_43, r9_43 in pairs(r1_43.PersonalInfo.CharDisplay) do
      local r10_43 = r9_43.Id
      if r2_43 then
        r10_43 = StrUtils.ObjId2Str(r9_43.Id)
      end
      if r1_43.Chars and r1_43.Chars[r10_43] then
        local r11_43 = r1_43.Chars[r10_43]
        local r12_43 = {}
        local r20_43 = nil	-- notice: implicit variable refs by block#[42]
        for r17_43, r18_43 in ipairs(r11_43.Skills) do
          local r19_43 = table.insert
          r20_43 = r12_43
          local r21_43 = {
            SkillId = r18_43.SkillId,
            Level = r18_43.Level and 1,
            ExtraLevel = r18_43.ExtraLevel and 0,
            LockState = r18_43.LockState and 1,
          }
          r19_43(r20_43, r21_43)
        end
        -- close: r13_43
        local r13_43 = {}
        for r17_43 = 1, CommonConst.CharSkillTreeCount, 1 do
          if not r13_43[r17_43] then
            r13_43[r17_43] = {}
          end
          for r21_43 = 1, CommonConst.CharSkillTreeCount, 1 do
            local r22_43 = r11_43.SkillTree[r17_43][r21_43]
            if r22_43 then
              local r23_43 = r13_43[r17_43]
              local r24_43 = {
                TargetId = r22_43.TargetId,
                SkillOrAttr = r22_43.SkillOrAttr and 0,
                LockState = r22_43.LockState and 1,
              }
              r23_43[r21_43] = r24_43
            end
          end
        end
        local r14_43 = r11_43.CurrentAppearanceIndex and 1
        if r9_43.AppearancePlan and r9_43.AppearancePlan ~= -1 then
          r14_43 = r9_43.AppearancePlan
        end
        local r15_43 = r11_43.AppearanceSuits[r14_43]
        local r16_43 = r1_43.CommonChars[r11_43.CharId]
        if r2_43 then
          r16_43 = r1_43.CommonChars[tostring(r11_43.CharId)]
        end
        local r17_43 = r15_43 and r15_43.SkinId
        local r18_43 = r16_43.OwnedSkins[r17_43]
        if r2_43 then
          r20_43 = tostring(r17_43)
          r18_43 = r16_43.OwnedSkins[r20_43]
        end
        local r19_43 = {
          SkinId = r17_43,
        }
        if r15_43 then
          r20_43 = r15_43.Accessory
          if not r20_43 then
            ::label_147::
            r20_43 = {}
          end
        else
          goto label_147	-- block#41 is visited secondly
        end
        r19_43.Accessory = r20_43
        r20_43 = r18_43.CurrentPlanIndex and 1
        r19_43.CurrentPlanIndex = r20_43
        r20_43 = pairs
        for r24_43, r25_43 in r20_43(r18_43.Colors) do
          if not r19_43.SkinColors then
            r19_43.SkinColors = {}
          end
          r19_43.SkinColors[tonumber(r24_43)] = r25_43
        end
        -- close: r20_43
        r20_43 = r9_43.ModPlan and 1
        local r22_43 = {}
        for r27_43, r28_43 in ipairs(r11_43["ModSuit_" .. r20_43]) do
          local r29_43 = {
            Polarity = r0_43:GetModSlotPolarity(r11_43, r27_43),
          }
          local r30_43 = r28_43
          if r2_43 then
            r30_43 = StrUtils.ObjId2Str(r28_43)
          end
          if r30_43 and r30_43 ~= CommonConst.ModSlotUnequipped and r1_43.Mods[r30_43] then
            local r32_43 = {
              ModId = r1_43.Mods[r30_43].ModId,
              Level = r31_43.Level and 0,
              CurrentModCardLevel = r31_43.CurrentModCardLevel and 0,
            }
            r29_43.Mod = r32_43
          end
          table.insert(r22_43, r29_43)
        end
        -- close: r23_43
        local r23_43 = #r3_43 + 1
        local r24_43 = {
          CharId = r11_43.CharId,
          Level = r11_43.Level and 1,
          EnhanceLevel = r11_43.EnhanceLevel and 0,
          GradeLevel = r11_43.GradeLevel and 0,
          Skills = r12_43,
          SkillTree = r13_43,
          Appearance = r19_43,
          ModSuit = r22_43,
        }
        r3_43[r23_43] = r24_43
      end
    end
    -- close: r4_43
  end
  return r3_43
end
function r0_0.GetPlayerPersonalInfoWeapon(r0_44, r1_44, r2_44)
  -- line: [805, 868] id: 44
  local r3_44 = {}
  if r1_44.PersonalInfo and r1_44.PersonalInfo.WeaponDisplay then
    for r8_44, r9_44 in pairs(r1_44.PersonalInfo.WeaponDisplay) do
      local r10_44 = r9_44.Id
      if r2_44 then
        r10_44 = StrUtils.ObjId2Str(r9_44.Id)
      end
      if r1_44.Weapons and r1_44.Weapons[r10_44] then
        local r11_44 = r1_44.Weapons[r10_44]
        local r12_44 = r11_44.CurrentAppearanceIndex and 1
        if r9_44.AppearancePlan and r9_44.AppearancePlan ~= -1 then
          r12_44 = r9_44.AppearancePlan
        end
        local r13_44 = r11_44.AppearanceSuits[r12_44]
        local r14_44 = nil	-- notice: implicit variable refs by block#[15, 16, 17]
        if r13_44 then
          r14_44 = r13_44.SkinId
          if not r14_44 then
            ::label_49::
            r14_44 = r11_44.WeaponId
          end
        else
          goto label_49	-- block#14 is visited secondly
        end
        local r15_44 = r11_44.UsedSkins[r14_44]
        if r2_44 then
          r15_44 = r11_44.UsedSkins[tostring(r14_44)]
        end
        local r16_44 = {
          SkinId = r14_44,
        }
        local r17_44 = r15_44.SpecialColor
        r16_44.SpecialColor = r17_44
        if r13_44 then
          r17_44 = r13_44.Accessory and {}
        else
          goto label_69	-- block#19 is visited secondly
        end
        r16_44.Accessory = r17_44
        r16_44.CurrentPlanIndex = r15_44.CurrentPlanIndex and 1
        for r21_44, r22_44 in pairs(r15_44.Colors) do
          if not r16_44.SkinColors then
            r16_44.SkinColors = {}
          end
          r16_44.SkinColors[tonumber(r21_44)] = r22_44
        end
        -- close: r17_44
        r17_44 = r9_44.ModPlan and 1
        local r19_44 = {}
        for r24_44, r25_44 in ipairs(r11_44["ModSuit_" .. r17_44]) do
          local r26_44 = {
            Polarity = r0_44:GetModSlotPolarity(r11_44, r24_44),
          }
          local r27_44 = r25_44
          if r2_44 then
            r27_44 = StrUtils.ObjId2Str(r25_44)
          end
          if r27_44 and r27_44 ~= CommonConst.ModSlotUnequipped and r1_44.Mods[r27_44] then
            local r29_44 = {
              ModId = r1_44.Mods[r27_44].ModId,
              Level = r28_44.Level and 0,
              CurrentModCardLevel = r28_44.CurrentModCardLevel and 0,
            }
            r26_44.Mod = r29_44
          end
          table.insert(r19_44, r26_44)
        end
        -- close: r20_44
        local r20_44 = #r3_44 + 1
        local r21_44 = {
          WeaponId = r11_44.WeaponId,
          Level = r11_44.Level and 1,
          EnhanceLevel = r11_44.EnhanceLevel and 0,
          GradeLevel = r11_44.GradeLevel and 0,
          Appearance = r16_44,
          ModSuit = r19_44,
        }
        r3_44[r20_44] = r21_44
      end
    end
    -- close: r4_44
  end
  return r3_44
end
function r0_0.GetAbyssSeasonMaxProgress(r0_45, r1_45, r2_45)
  -- line: [871, 949] id: 45
  local r3_45 = r1_45.CurrentAbyssSeasonId and -1
  local r4_45 = r1_45.Abysses
  local r5_45 = {
    0,
    0,
    0
  }
  for r10_45, r11_45 in pairs(DataMgr.AbyssSeason) do
    if not r11_45.AbyssSeasonId and r11_45.AbyssType == 1 then
      local r12_45 = r4_45[r10_45]
      if r2_45 then
        r12_45 = r4_45[tostring(r10_45)]
      end
      if r12_45 then
        local r13_45 = #r11_45.AbyssLevelId
        local r14_45 = true
        local r15_45 = r12_45.MaxAbyssProgress
        if not r15_45 then
          r15_45 = {}
          local r16_45 = 1
          local r17_45 = 0
          -- setlist for #15 failed
        end
        if r15_45[1] < r13_45 then
          r14_45 = true
        else
          local r17_45 = DataMgr.AbyssLevel[r11_45.AbyssLevelId[#r11_45.AbyssLevelId]]
          local r18_45 = 0
          if r17_45.AbyssDungeon1 then
            r18_45 = r18_45 + #DataMgr.AbyssDungeon[r17_45.AbyssDungeon1].RoomId
          end
          if r17_45.AbyssDungeon2 then
            r18_45 = r18_45 + #DataMgr.AbyssDungeon[r17_45.AbyssDungeon2].RoomId
          end
          if r15_45[2] == r18_45 then
            r14_45 = false
          end
        end
        if r14_45 or not r3_45 or not DataMgr.AbyssSeasonList[r3_45] then
          r5_45[1] = r11_45.AbyssType
          r5_45[2] = r15_45[1]
          r5_45[3] = r0_45:CalculateAbyssAllRoomCount(r12_45)
          return r5_45
        end
      else
        r5_45[1] = r11_45.AbyssType
        r5_45[2] = 1
        r5_45[3] = 0
        return r5_45
      end
    end
  end
  -- close: r6_45
  local r6_45 = DataMgr.AbyssSeasonList[r3_45]
  if not r6_45.Abyss then
    return r5_45
  end
  local r7_45 = r6_45.Abyss.Infinite
  local r8_45 = r4_45[r7_45]
  if r2_45 then
    r8_45 = r4_45[tostring(r7_45)]
  end
  local r9_45 = r6_45.Abyss.Rotate
  local r10_45 = r4_45[r9_45]
  if r2_45 then
    r10_45 = r4_45[tostring(r9_45)]
  end
  local r11_45 = r0_45:CalculateAbyssAllRoomCount(r10_45)
  if r8_45 and r8_45.MaxAbyssProgress and (r8_45.MaxAbyssProgress[1] > 1 or r8_45.MaxAbyssProgress[1] == 1 and r8_45.MaxAbyssProgress[2] > 0) then
    r5_45[1] = DataMgr.AbyssSeason[r7_45].AbyssType
    r5_45[2] = r8_45.MaxAbyssProgress[1]
    r5_45[3] = r0_45:CalculateAbyssAllRoomCount(r8_45) + r11_45
  else
    r5_45[1] = DataMgr.AbyssSeason[r9_45].AbyssType
    r5_45[2] = 1
    if r10_45.MaxAbyssProgress then
      r5_45[2] = r10_45.MaxAbyssProgress[1] and 1
    end
    r5_45[3] = r11_45
  end
  return r5_45
end
function r0_0.CalculateAbyssAllRoomCount(r0_46, r1_46)
  -- line: [951, 961] id: 46
  local r2_46 = 0
  local r3_46 = r1_46.MaxAbyssProgress
  if not r3_46 then
    r3_46 = {}
    local r4_46 = 1
    local r5_46 = 0
    -- setlist for #3 failed
  end
  for r7_46 = 1, r3_46[1] + -1, 1 do
    local r8_46 = r1_46.AbyssLevelList[r7_46]
    if r8_46 then
      r2_46 = r2_46 + (r8_46.MaxAbyssLevelProgress and 0)
    end
  end
  return r2_46 + r3_46[2]
end
function r0_0.GetPlayerPersonalInfoWeaponCount(r0_47, r1_47)
  -- line: [964, 979] id: 47
  local r2_47 = 0
  local r3_47 = 0
  for r8_47, r9_47 in pairs(r1_47.Weapons) do
    local r11_47 = DataMgr.BattleWeapon[r9_47.WeaponId]
    if r11_47 and r11_47.WeaponTag then
      if r2_0.HasValue(r11_47.WeaponTag, CommonConst.WeaponType.MeleeWeapon) then
        r2_47 = r2_47 + 1
      elseif r2_0.HasValue(r11_47.WeaponTag, CommonConst.WeaponType.RangedWeapon) then
        r3_47 = r3_47 + 1
      end
    end
  end
  -- close: r4_47
  return r2_47, r3_47
end
function r0_0.GetPlayerPersonalInfoCharSkinCount(r0_48, r1_48)
  -- line: [982, 992] id: 48
  local r2_48 = 0
  for r7_48, r8_48 in pairs(r1_48.CommonChars) do
    r2_48 = r2_48 + r2_0.TableLength(r8_48.OwnedSkins)
  end
  -- close: r3_48
  for r7_48, r8_48 in pairs(r1_48.OtherCharSkins) do
    r2_48 = r2_48 + r2_0.TableLength(r8_48)
  end
  -- close: r3_48
  return r2_48 - r2_0.TableLength(r1_48.Chars)
end
function r0_0.GetPlayerPersonalInfoRougeLikeProgress(r0_49, r1_49)
  -- line: [995, 1019] id: 49
  local r2_49 = nil
  if GWorld:IsSkynetServer() then
    r2_49 = require("src.utils.TimeUtils")
  else
    r2_49 = require("Utils.TimeUtils")
  end
  local r3_49 = r2_49.NowTime()
  local r4_49 = 0
  for r9_49, r10_49 in pairs(DataMgr.RougeLikeSeason) do
    if r9_49 > 0 and r10_49.SeasonStartTime <= r3_49 and r3_49 <= r10_49.SeasonEndTime then
      for r14_49 = #r10_49.DifficultyId, 1, -1 do
        local r15_49 = r10_49.DifficultyId[r14_49]
        if not r1_49.RougeLike then
          return r4_49
        end
        if (r1_49.RougeLike.PassCount and {})[r15_49] then
          return r15_49
        end
      end
    end
  end
  -- close: r5_49
  return r4_49
end
function r0_0.GetPlayerPersonalInfoAchievementCount(r0_50, r1_50, r2_50)
  -- line: [1022, 1041] id: 50
  local r3_50 = {}
  local r4_50 = 0
  for r9_50, r10_50 in pairs(r1_50.Achvs) do
    local r11_50 = DataMgr.Achievement[r10_50.AchvId]
    if r11_50 then
      local r12_50 = r11_50.AchievementRarity
      if r0_0:IsAchvFinished(r10_50, r2_50) and not r0_0:IsAchvLocked(r1_50, r10_50.AchvId, r2_50) then
        if r3_50[r12_50] then
          r3_50[r12_50] = r3_50[r12_50] + 1
        else
          r3_50[r12_50] = 1
        end
        r4_50 = r4_50 + 1
      end
    end
  end
  -- close: r5_50
  return r3_50, r4_50
end
function r0_0.IsAchvFinished(r0_51, r1_51, r2_51)
  -- line: [1043, 1057] id: 51
  local r3_51 = DataMgr.Achievement[r1_51.AchvId]
  local r4_51 = 0
  for r9_51, r10_51 in ipairs(r3_51.TargetId) do
    local r11_51 = r10_51
    if r2_51 then
      r11_51 = tostring(r10_51)
    end
    r4_51 = r4_51 + (r1_51.FinishedTargets[r11_51] and 0)
  end
  -- close: r5_51
  if r3_51.TargetProgress <= r4_51 then
    return true
  end
  return false
end
function r0_0.IsAchvLocked(r0_52, r1_52, r2_52, r3_52)
  -- line: [1059, 1072] id: 52
  local r4_52 = DataMgr.Achievement[r2_52]
  if not r4_52.AchievementRequire then
    return false
  end
  for r9_52, r10_52 in pairs(r4_52.AchievementRequire) do
    local r11_52 = r1_52.Achvs[r10_52]
    if not r11_52 or not r0_0:IsAchvFinished(r11_52, r3_52) or r0_0:IsAchvLocked(r1_52, r10_52, r3_52) then
      return true
    end
  end
  -- close: r5_52
  return false
end
function r0_0.HandleActiveRandomCreator(r0_53, r1_53, r2_53, r3_53)
  -- line: [1075, 1090] id: 53
  local r4_53 = {}
  if not r3_53 then
    r3_53 = {}
  end
  local r5_53 = DataMgr.RandomCreator[r1_53]
  if not r5_53 then
    return false, r4_53
  end
  r4_53.RuleType = r5_53.RuleType
  r4_53.UnitType = r5_53.UnitType
  if r4_53.RuleType == 1 then
    r4_53.UnitId, r4_53.Level, r4_53.CurrentTableId = r0_53:GetRandomRuleType_One(r5_53)
  else
    r4_53.UnitId, r4_53.Level, r4_53.CurrentTableId = r0_53:GetRandomRuleType_Two(r5_53, r2_53, r3_53)
  end
  return true, r4_53
end
function r0_0.GetRandomRuleType_Two(r0_54, r1_54, r2_54, r3_54)
  -- line: [1092, 1129] id: 54
  local r4_54 = {}
  local r5_54 = {}
  local r6_54 = 0
  local r7_54 = {}
  local r8_54 = {}
  local r9_54 = 0
  for r14_54, r15_54 in ipairs(r1_54.RandomInfos) do
    r4_54[r15_54.UnitId] = r15_54.Weight
    r5_54[r15_54.UnitId] = r15_54.UnitLevel and 1
    r6_54 = r6_54 + r15_54.Weight
    r9_54 = r9_54 + 1
    r8_54[r9_54] = r15_54.UnitId
    r7_54[r15_54.UnitId] = r9_54
  end
  -- close: r10_54
  local r10_54 = math.min(r1_54.Count, r2_54)
  return (function()
    -- line: [1108, 1127] id: 55
    local r0_55 = 1
    for r5_55, r6_55 in pairs(r4_54) do
      if r3_54[r1_54.RandomId] == nil then
        r3_54[r1_54.RandomId] = {}
      end
      if r3_54[r1_54.RandomId][r5_55] == nil then
        r3_54[r1_54.RandomId][r5_55] = 0
      end
      if r3_54[r1_54.RandomId][r5_55] ~= math.floor(r6_55 / r6_54 * r10_54) then
        r3_54[r1_54.RandomId][r5_55] = r3_54[r1_54.RandomId][r5_55] + 1
        return r5_55, r5_54[r5_55], r7_54[r5_55]
      end
      r0_55 = r0_55 + 1
      if r9_54 < r0_55 then
        r0_55 = math.random(1, r9_54)
        return r8_54[r0_55], r5_54[r5_55], r0_55
      end
    end
    -- close: r1_55
  end)()
end
function r0_0.GetRandomRuleType_One(r0_56, r1_56)
  -- line: [1131, 1154] id: 56
  local r2_56 = {}
  local r3_56 = {}
  local r4_56 = 0
  local r5_56 = {}
  local r6_56 = 0
  for r11_56, r12_56 in ipairs(r1_56.RandomInfos) do
    r2_56[r12_56.UnitId] = r12_56.Weight
    r3_56[r12_56.UnitId] = r12_56.UnitLevel and 1
    r4_56 = r4_56 + r12_56.Weight
    r6_56 = r6_56 + 1
    r5_56[r12_56.UnitId] = r6_56
  end
  -- close: r7_56
  return (function()
    -- line: [1144, 1152] id: 57
    for r4_57, r5_57 in pairs(r2_56) do
      if math.random(1, r4_56) <= r5_57 then
        return r4_57, r3_56[r4_57], r5_56[r4_57]
      end
      r4_56 = r4_56 - r5_57
    end
    -- close: r0_57
  end)()
end
function r0_0.GetRaidSeasonMaxScore(r0_58, r1_58)
  -- line: [1156, 1163] id: 58
  local r3_58 = r1_58.RaidSeasons[r1_58.CurrentRaidSeasonId]
  if not r3_58 then
    return 0
  end
  return r3_58.MaxRaidScore
end
function r0_0.GetFishCurrentPeriod(r0_59, r1_59)
  -- line: [1166, 1177] id: 59
  local r2_59 = nil
  if not r1_59.TimeOfDay then
    return 0
  end
  if r1_59.TimeOfDay >= 4 and r1_59.TimeOfDay < 12 then
    r2_59 = 1
  elseif r1_59.TimeOfDay >= 12 and r1_59.TimeOfDay < 20 then
    r2_59 = 2
  else
    r2_59 = 3
  end
  return r2_59
end
function r0_0.GetRaidSeasonMaxScrSquad(r0_60, r1_60, r2_60)
  -- line: [1179, 1192] id: 60
  local r3_60 = r1_60.CurrentRaidSeasonId
  if not r3_60 then
    return 
  end
  local r4_60 = r1_60.RaidSeasons[r3_60]
  if r2_60 then
    r4_60 = r1_60.RaidSeasons[tostring(r3_60)]
  end
  if not r4_60 then
    return 
  end
  return r4_60.MaxSquad
end
function r0_0.GetCurCharRankInfo(r0_61, r1_61, r2_61)
  -- line: [1194, 1223] id: 61
  local r4_61 = r1_61.Chars[r1_61.CurrentChar]
  if not r4_61 then
    return {}
  end
  local r6_61 = r4_61.AppearanceSuits[r4_61.CurrentAppearanceIndex and 1]
  local r7_61 = r1_61.CommonChars[r4_61.CharId]
  if r2_61 then
    r7_61 = r1_61.CommonChars[tostring(r4_61.CharId)]
  end
  local r8_61 = r6_61 and r6_61.SkinId
  local r9_61 = r7_61.OwnedSkins[r8_61]
  if r2_61 then
    r9_61 = r7_61.OwnedSkins[tostring(r8_61)]
  end
  local r10_61 = {}
  for r15_61, r16_61 in ipairs(r9_61.Colors) do
    r10_61[tonumber(r15_61)] = r16_61
    break
  end
  -- close: r11_61
  local r11_61 = {}
  local r12_61 = r4_61.CharId
  r11_61.CharId = r12_61
  r11_61.SkinId = r8_61
  if r6_61 then
    r12_61 = r6_61.Accessory and {}
  else
    goto label_60	-- block#15 is visited secondly
  end
  r11_61.Accessory = r12_61
  r11_61.SkinColors = r10_61
  return r11_61
end
function r0_0.GetCurWeaponRankInfo(r0_62, r1_62, r2_62)
  -- line: [1225, 1249] id: 62
  local r4_62 = r1_62.Weapons[r1_62.MeleeWeapon]
  if not r4_62 then
    return {}
  end
  local r6_62 = r4_62.AppearanceSuits[r4_62.CurrentAppearanceIndex and 1]
  local r7_62 = nil	-- notice: implicit variable refs by block#[7, 8, 12]
  if r6_62 then
    r7_62 = r6_62.SkinId
    if not r7_62 then
      ::label_19::
      r7_62 = r4_62.WeaponId
    end
  else
    goto label_19	-- block#6 is visited secondly
  end
  local r8_62 = r4_62.UsedSkins[r7_62]
  if r2_62 then
    r8_62 = r4_62.UsedSkins[tostring(r7_62)]
  end
  local r9_62 = {}
  for r14_62, r15_62 in ipairs(r8_62.Colors) do
    r9_62[tonumber(r14_62)] = r15_62
    break
  end
  -- close: r10_62
  local r10_62 = {}
  local r11_62 = r4_62.WeaponId
  r10_62.WeaponId = r11_62
  r10_62.SkinId = r7_62
  if r6_62 then
    r11_62 = r6_62.Accessory and {}
  else
    goto label_53	-- block#14 is visited secondly
  end
  r10_62.Accessory = r11_62
  r10_62.SkinColors = r9_62
  return r10_62
end
return r0_0
