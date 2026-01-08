-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Client\BattleDumpUtils.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("BluePrints.Client.TemplateDumpUtils")
return {
  GetInfoProxy = function(r0_1, r1_1, r2_1, r3_1)
    -- line: [5, 8] id: 1
    return setmetatable({
      ModData = r2_1,
      ModSuit = r3_1,
    }, {
      __index = r1_1,
    })
  end,
  GetMeleeWeaponInfoProxy = function(r0_2, r1_2, r2_2, r3_2, r4_2)
    -- line: [10, 13] id: 2
    return setmetatable({
      ModData = r2_2,
      ModSuit = r3_2,
      SecondModSuit = r4_2,
    }, {
      __index = r1_2,
    })
  end,
  GetBattleInfoByInfo = function(r0_3, r1_3, r2_3, r3_3)
    -- line: [16, 115] id: 3
    if r2_3.ReplaceAvatar then
      r1_3 = r2_3.ReplaceAvatar
    end
    if not r1_3 then
      return {}
    end
    if not r2_3 then
      r2_3 = {}
    end
    local r4_3 = r2_3.Char
    local r5_3 = r2_3.MeleeWeapon
    local r6_3 = r2_3.RangedWeapon
    local r7_3 = {
      AvatarQuestRoleID = r2_3.AvatarQuestRoleID,
    }
    if r4_3 then
      r7_3.RoleInfo = r4_3:BattleDump(r1_3, r0_3:GetInfoProxy(r2_3, r2_3.CharModData, r2_3.CharModSuit))
    else
      r7_3.RoleInfo = {}
    end
    if r5_3 then
      r7_3.MeleeWeapon = r5_3:BattleDump(r1_3, r0_3:GetMeleeWeaponInfoProxy(r2_3, r2_3.MeleeWeaponModData, r2_3.MeleeWeaponModSuit, r2_3.MeleeWeaponModSuitSecondary))
    else
      r7_3.MeleeWeapon = {}
    end
    if r6_3 then
      r7_3.RangedWeapon = r6_3:BattleDump(r1_3, r0_3:GetInfoProxy(r2_3, r2_3.RangedWeaponModData, r2_3.RangedWeaponModSuit))
    else
      r7_3.RangedWeapon = {}
    end
    if r4_3 then
      r7_3.UltraWeapons = {}
      for r13_3, r14_3 in ipairs(r2_3.UltraWeapons and {}) do
        local r15_3 = r14_3.UltraWeapon
        if r15_3 then
          local r16_3 = nil
          if r3_3 then
            r16_3 = {}
          else
            r16_3 = r14_3.ModData
          end
          table.insert(r7_3.UltraWeapons, r15_3:BattleDump(r1_3, r0_3:GetInfoProxy(r2_3, r16_3, r14_3.ModSuit)))
        end
      end
      -- close: r9_3
    else
      r7_3.UltraWeapons = {}
    end
    r7_3.WheelIndex = r2_3.WheelIndex
    local r8_3 = r2_3.Pet
    if r8_3 then
      r7_3.Pet = r8_3:BattleDump(r1_3)
    else
      r7_3.Pet = {}
    end
    return r7_3
  end,
  GetDefaultBattleInfo = function(r0_4, r1_4, r2_4)
    -- line: [118, 148] id: 4
    if not r1_4 then
      return 
    end
    if not r2_4 then
      r2_4 = {}
    end
    local r3_4 = {
      Char = r2_4.Char and r1_4.Chars[r1_4.CurrentChar],
      MeleeWeapon = r2_4.MeleeWeapon and r1_4.Weapons[r1_4.MeleeWeapon],
      RangedWeapon = r2_4.RangedWeapon and r1_4.Weapons[r1_4.RangedWeapon],
      Pet = r2_4.Pet and r1_4.Pets[r1_4.CurrentPet],
    }
    if r3_4.Char then
      r3_4.CharModSuit = r3_4.Char.ModSuitIndex
      r3_4.UltraWeapons = r0_4:GetDefaultUltraWeaponInfo(r1_4, r3_4.Char)
    end
    if r3_4.MeleeWeapon then
      r3_4.MeleeWeaponModSuit = r3_4.MeleeWeapon.ModSuitIndex
    end
    if r3_4.RangedWeapon then
      r3_4.RangedWeaponModSuit = r3_4.RangedWeapon.ModSuitIndex
    end
    if r2_4 then
      for r8_4, r9_4 in pairs(r2_4) do
        r3_4[r8_4] = r9_4
      end
      -- close: r4_4
    end
    return r0_4:GetBattleInfoByInfo(r1_4, r3_4)
  end,
  GetDefaultUltraWeaponInfo = function(r0_5, r1_5, r2_5)
    -- line: [151, 164] id: 5
    if not r2_5 then
      return {}
    end
    local r3_5 = {}
    for r8_5, r9_5 in ipairs(r2_5.UWeaponEids) do
      local r10_5 = r1_5.UWeapons[r9_5]
      if r10_5 then
        table.insert(r3_5, {
          UltraWeapon = r10_5,
          ModSuit = r10_5.ModSuitIndex,
        })
      end
    end
    -- close: r4_5
    return r3_5
  end,
  GetPhantomBattleInfo = function(r0_6, r1_6, r2_6, r3_6, r4_6, r5_6)
    -- line: [167, 197] id: 6
    local r6_6 = {
      Char = r2_6,
      IsPhantom = true,
      Pet = r4_6,
    }
    if r3_6 then
      if r3_6:IsMelee() then
        r6_6.MeleeWeapon = r3_6
      else
        r6_6.RangedWeapon = r3_6
      end
    else
      return {
        RoleInfo = {},
      }
    end
    if r6_6.Char then
      r6_6.CharModSuit = r6_6.Char.ModSuitIndex
      r6_6.UltraWeapons = r0_6:GetDefaultUltraWeaponInfo(r1_6, r6_6.Char)
    end
    if r6_6.MeleeWeapon then
      r6_6.MeleeWeaponModSuit = r6_6.MeleeWeapon.ModSuitIndex
    end
    if r6_6.RangedWeapon then
      r6_6.RangedWeaponModSuit = r6_6.RangedWeapon.ModSuitIndex
    end
    local r7_6 = r0_6:GetBattleInfoByInfo(r1_6, r6_6, r5_6)
    r7_6.Pet = {}
    return r7_6
  end,
  GetCharBattleInfo = function(r0_7, r1_7, r2_7, r3_7)
    -- line: [200, 211] id: 7
    local r4_7 = {
      Char = r2_7,
    }
    if r4_7.Char then
      r4_7.CharModSuit = r4_7.Char.ModSuitIndex
    end
    if r3_7 then
      r4_7.CharModSuit = r3_7
    end
    return r0_7:GetBattleInfoByInfo(r1_7, r4_7)
  end,
  GetWeaponBattleInfo = function(r0_8, r1_8, r2_8, r3_8)
    -- line: [214, 232] id: 8
    local r4_8 = {}
    if r2_8 then
      if r2_8:IsMelee() then
        r4_8.MeleeWeapon = r2_8
        r4_8.MeleeWeaponModSuit = r4_8.MeleeWeapon.ModSuitIndex
        if r3_8 then
          r4_8.MeleeWeaponModSuit = r3_8
        end
      else
        r4_8.RangedWeapon = r2_8
        r4_8.RangedWeaponModSuit = r4_8.RangedWeapon.ModSuitIndex
        if r3_8 then
          r4_8.RangedWeaponModSuit = r3_8
        end
      end
    end
    return r0_8:GetBattleInfoByInfo(r1_8, r4_8)
  end,
  GetSquadInfoByQuestRoleId = function(r0_9, r1_9, r2_9)
    -- line: [235, 261] id: 9
    local r3_9 = DataMgr.QuestRoleInfo[r1_9]
    if not r3_9 then
      return 
    end
    local r4_9 = nil
    if r3_9.ExStroyInfo ~= nil then
      local r5_9 = r2_9.Sex
      if r3_9.ExStroyInfo == "Player" then
        r5_9 = r2_9.Sex
      else
        r5_9 = r2_9.WeitaSex
      end
      r4_9 = DataMgr.Player2RoleId[r3_9.ExStroyInfo][r5_9]
    end
    local r6_9 = require("BluePrints.Client.TemplateAvatar.TemplateAvatarComponent")()
    r0_0:CreateTemplate_Char(r6_9, r3_9.CharTemplateRuleId, r4_9, true)
    r6_9.MeleeWeapon = r0_0:CreateTemplate_Weapon(r6_9, r3_9.MeleeWeaponRuleId, true)
    r6_9.RangedWeapon = r0_0:CreateTemplate_Weapon(r6_9, r3_9.RangedWeaponRuleId, true)
    local r7_9 = r6_9:GetSquadCreateInfoByNow()
    r7_9.AvatarQuestRoleID = r1_9
    return r7_9, r6_9
  end,
  GetSquadInfoByTemplate = function(r0_10, r1_10, r2_10, r3_10, r4_10)
    -- line: [263, 332] id: 10
    local r6_10 = require("BluePrints.Client.TemplateAvatar.TemplateAvatarComponent")()
    local r7_10 = {}
    if r2_10.Char then
      r6_10.CurrentChar = r2_10.Char
      r6_10.Chars[r2_10.Char] = r1_10.Chars[r2_10.Char]
    end
    if r3_10.Char then
      r0_0:CreateTemplate_Char(r6_10, r3_10.Char, nil, true)
    end
    if r2_10.MeleeWeapon then
      r6_10.MeleeWeapon = r2_10.MeleeWeapon
      r6_10.Weapons[r2_10.MeleeWeapon] = r1_10.Weapons[r2_10.MeleeWeapon]
    end
    if r3_10.MeleeWeapon then
      r6_10.MeleeWeapon = r0_0:CreateTemplate_Weapon(r6_10, r3_10.MeleeWeapon)
    end
    if r2_10.RangedWeapon then
      r6_10.RangedWeapon = r2_10.RangedWeapon
      r6_10.Weapons[r2_10.RangedWeapon] = r1_10.Weapons[r2_10.RangedWeapon]
    end
    if r3_10.RangedWeapon then
      r6_10.RangedWeapon = r0_0:CreateTemplate_Weapon(r6_10, r3_10.RangedWeapon)
    end
    if r2_10.Phantom1 then
      r6_10.Chars[r2_10.Phantom1] = r1_10.Chars[r2_10.Phantom1]
      r7_10.Phantom1 = r2_10.Phantom1
    end
    if r3_10.Phantom1 then
      local r8_10, r9_10 = r0_0:CreateTemplate_Char(r6_10, r3_10.Phantom1, nil, false)
      if r8_10 then
        r7_10.Phantom1 = r9_10
      end
    end
    if r2_10.Phantom2 then
      r6_10.Chars[r2_10.Phantom2] = r1_10.Chars[r2_10.Phantom2]
      r7_10.Phantom2 = r2_10.Phantom2
    end
    if r3_10.Phantom2 then
      local r8_10, r9_10 = r0_0:CreateTemplate_Char(r6_10, r3_10.Phantom2, nil, false)
      if r8_10 then
        r7_10.Phantom2 = r9_10
      end
    end
    if r2_10.PhantomWeapon1 then
      r6_10.Weapons[r2_10.PhantomWeapon1] = r1_10.Weapons[r2_10.PhantomWeapon1]
      r7_10.PhantomWeapon1 = r2_10.PhantomWeapon1
    end
    if r3_10.PhantomWeapon1 then
      r7_10.PhantomWeapon1 = r0_0:CreateTemplate_Weapon(r6_10, r3_10.PhantomWeapon1)
    end
    if r2_10.PhantomWeapon2 then
      r6_10.Weapons[r2_10.PhantomWeapon2] = r1_10.Weapons[r2_10.PhantomWeapon2]
      r7_10.PhantomWeapon2 = r2_10.PhantomWeapon2
    end
    if r3_10.PhantomWeapon2 then
      r7_10.PhantomWeapon2 = r0_0:CreateTemplate_Weapon(r6_10, r3_10.PhantomWeapon2)
    end
    r7_10.Pet = r0_0:CreateTemplate_Pet(r6_10, r4_10)
    return r6_10:GetSquadCreateInfoByNow(r7_10), r6_10
  end,
  GetBattleInfoByQuestRoleId = function(r0_11, r1_11, r2_11)
    -- line: [335, 338] id: 11
    local r3_11, r4_11 = r0_11:GetSquadInfoByQuestRoleId(r1_11, r2_11)
    return r0_11:GetBattleInfoByInfo(r4_11, r3_11)
  end,
  UpdateBattleInfo = function(r0_12, r1_12, r2_12)
    -- line: [341, 373] id: 12
    if not r2_12 then
      return r1_12
    end
    if r2_12.RoleInfo then
      r1_12.RoleInfo = r1_12.RoleInfo and {}
      for r7_12, r8_12 in pairs(r2_12.RoleInfo) do
        r1_12.RoleInfo[r7_12] = r8_12
      end
      -- close: r3_12
    end
    if r2_12.MeleeWeapon then
      r1_12.MeleeWeapon = r1_12.MeleeWeapon and {}
      for r7_12, r8_12 in pairs(r2_12.MeleeWeapon) do
        r1_12.MeleeWeapon[r7_12] = r8_12
      end
      -- close: r3_12
    end
    if r2_12.RangedWeapon then
      r1_12.RangedWeapon = r1_12.RangedWeapon and {}
      for r7_12, r8_12 in pairs(r2_12.RangedWeapon) do
        r1_12.RangedWeapon[r7_12] = r8_12
      end
      -- close: r3_12
    end
    if r2_12.UltraWeapons then
      r1_12.UltraWeapons = r1_12.UltraWeapons and {}
      for r7_12, r8_12 in pairs(r2_12.UltraWeapons) do
        r1_12.UltraWeapons[r7_12] = r1_12.UltraWeapons[r7_12] and {}
        for r13_12, r14_12 in pairs(r8_12) do
          r1_12.UltraWeapons[r7_12][r13_12] = r14_12
        end
        -- close: r9_12
      end
      -- close: r3_12
    end
    return r1_12
  end,
}
