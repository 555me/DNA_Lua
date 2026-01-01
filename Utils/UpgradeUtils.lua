-- filename: @C:/Pack/Branch/geili11\Content/Script/Utils\UpgradeUtils.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = {
  GetMaxLevel = function(r0_1, r1_1)
    -- line: [6, 29] id: 1
    local r7_1 = nil	-- notice: implicit variable refs by block#[10, 23]
    if r1_1 == "Char" then
      local r2_1 = r0_1.EnhanceLevel and 0
      local r3_1 = DataMgr.Char[r0_1.CharId]
      local r4_1 = r3_1 and r3_1.CharMaxLevel
      local r5_1 = DataMgr.CharBreak[r0_1.CharId]
      local r6_1 = r5_1 and r5_1[r2_1 + 1]
      if r6_1 then
        r7_1 = r6_1.CharBreakLevel
        if not r7_1 then
          ::label_27::
          r7_1 = r4_1
        end
      else
        goto label_27	-- block#9 is visited secondly
      end
      return r7_1, r4_1
    elseif r1_1 == "Weapon" then
      local r2_1 = r0_1.EnhanceLevel and 0
      local r3_1 = DataMgr.Weapon[r0_1.WeaponId] and DataMgr.UWeapon[r0_1.WeaponId]
      local r4_1 = r3_1 and r3_1.WeaponMaxLevel
      local r5_1 = DataMgr.WeaponBreak[r0_1.WeaponId]
      local r6_1 = r5_1 and r5_1[r2_1 + 1]
      if r6_1 then
        r7_1 = r6_1.WeaponBreakLevel
        if not r7_1 then
          ::label_64::
          r7_1 = r4_1
        end
      else
        goto label_64	-- block#22 is visited secondly
      end
      return r7_1, r4_1
    elseif r1_1 == "Pet" then
      local r2_1 = r0_1.BreakNum and 0
      local r3_1 = DataMgr.Pet[r0_1.PetId]
      local r4_1 = r3_1 and r3_1.PetMaxLevel
      local r5_1 = DataMgr.PetBreak[r0_1.PetId]
      local r6_1 = r5_1 and r5_1[r2_1]
      r7_1 = r6_1 and r6_1.PetBreakLevel
      return r7_1, r4_1
    end
  end,
  CalcCharOrWeaponLevelUp = function(r0_2, r1_2, r2_2, r3_2)
    -- line: [31, 102] id: 2
    local r4_2 = {
      CanUpgrade = false,
      CashConsume = 0,
      ExpConsume = 0,
      ExpNeed = 0,
      ErrorText = "",
      ResourceUse = {},
    }
    local r5_2 = GWorld:GetAvatar()
    if r5_2 == nil or r3_2 - r2_2 <= 0 then
      return r4_2
    end
    local r6_2 = r5_2[(r1_2 and "") .. "s"]
    if r6_2 == nil or r6_2[r0_2.Uuid] == nil then
      return r4_2
    end
    if r0_0.GetMaxLevel(r0_2, r1_2) < r3_2 then
      return r4_2
    end
    r4_2.ExpNeed = r0_0.CalcExpNeed(r0_2, r1_2, r3_2)
    if r4_2.ExpNeed == nil or r4_2.ExpNeed <= 0 then
      return r4_2
    end
    local r7_2 = {}
    local r8_2 = {}
    local r9_2 = 0
    local r10_2 = {}
    if DataMgr.ResourceSType2Resource and DataMgr.ResourceSType2Resource[r1_2 .. "Exp"] then
      r10_2 = DataMgr.ResourceSType2Resource[r1_2 .. "Exp"]
    end
    for r15_2 = 1, #r10_2, 1 do
      local r16_2 = r10_2[r15_2]
      local r17_2 = r5_2.Resources[r16_2]
      if not r17_2 then
        r17_2 = {}
        r17_2.Count = 0
      end
      local r18_2 = {
        ResourceId = r16_2,
        Count = r17_2.Count,
        UseParam = DataMgr.Resource[r16_2].UseParam,
      }
      r9_2 = r9_2 + r18_2.Count * r18_2.UseParam
      r7_2[r15_2] = r18_2
      r8_2[r15_2] = {
        ResourceId = r18_2.ResourceId,
        UseParam = r18_2.UseParam,
        Count = 1000000,
      }
    end
    if r9_2 < r4_2.ExpNeed then
      r4_2.ErrorText = "LevelUp_Insufficient_Exp"
      local r12_2 = r0_2["Calculate" .. r1_2 .. "LevelUpResources"](r0_2, r4_2.ExpNeed, r8_2)
      r4_2.ResourceUse = r12_2.ResourceUse
      r4_2.ExpConsume = r12_2.ExpConsume
      r4_2.CashConsume = r0_0.CalcCashConsume(r0_2, r1_2, r4_2.ExpConsume, r4_2.ExpNeed, r2_2, r3_2)
      return r4_2
    else
      local r12_2 = r0_2["Calculate" .. r1_2 .. "LevelUpResources"](r0_2, r4_2.ExpNeed, r7_2)
      r4_2.ResourceUse = r12_2.ResourceUse
      r4_2.ExpConsume = r12_2.ExpConsume
    end
    r4_2.CashConsume = r0_0.CalcCashConsume(r0_2, r1_2, r4_2.ExpConsume, r4_2.ExpNeed, r2_2, r3_2)
    if r4_2.CashConsume <= 0 then
      return r4_2
    end
    local r12_2 = r5_2.Resources[CommonConst.Coins.Coin2]
    if not r12_2 then
      r12_2 = {}
      r12_2.Count = 0
    end
    if r12_2.Count < r4_2.CashConsume then
      r4_2.ErrorText = "Insufficient_Cash"
      return r4_2
    end
    r4_2.CanUpgrade = true
    return r4_2
  end,
  CalcCashConsume = function(r0_3, r1_3, r2_3, r3_3, r4_3, r5_3)
    -- line: [104, 130] id: 3
    local r6_3 = -1
    if r5_3 <= r4_3 or r0_3.Level ~= r4_3 then
      return r6_3
    end
    local r7_3 = nil
    if r1_3 == "Char" then
      r7_3 = DataMgr.LevelUp
    elseif r1_3 == "Weapon" then
      r7_3 = DataMgr.WeaponLevelUp
    end
    local r9_3 = r7_3[r4_3][(r1_3 .. "LevelMaxExp")] - r0_3.Exp
    r6_3 = r9_3 * r7_3[r0_3.Level].CashToExp
    local r8_3 = r2_3 - r9_3
    for r13_3 = r4_3 + 1, r5_3 + -1, 1 do
      r6_3 = r6_3 + r7_3[r13_3][(r1_3 .. "LevelMaxExp")] * r7_3[r13_3].CashToExp
      r8_3 = r8_3 - r7_3[r13_3][(r1_3 .. "LevelMaxExp")]
    end
    r6_3 = math.ceil(r6_3 + r8_3 * r7_3[r5_3].CashToExp)
    if r2_3 - r8_3 ~= r3_3 then
      return -1
    end
    return r6_3
  end,
  CalcExpNeed = function(r0_4, r1_4, r2_4)
    -- line: [132, 149] id: 4
    local r3_4 = nil
    if r1_4 == "Char" then
      r3_4 = DataMgr.LevelUp
    elseif r1_4 == "Weapon" then
      r3_4 = DataMgr.WeaponLevelUp
    end
    if #r3_4 < r2_4 then
      return -1
    end
    local r4_4 = 0
    for r8_4 = r0_4.Level, r2_4 + -1, 1 do
      r4_4 = r4_4 + r3_4[r8_4][(r1_4 .. "LevelMaxExp")]
    end
    return r4_4 - r0_4.Exp
  end,
  CalcBreakLevelUp = function(r0_5, r1_5, r2_5)
    -- line: [151, 209] id: 5
    local r3_5 = nil
    if r1_5 == "Char" then
      r3_5 = r0_5.CharId
    elseif r1_5 == "Weapon" then
      r3_5 = r0_5.WeaponId
    end
    local r4_5 = {
      CanUpgrade = false,
      FirstUpgrade = false,
      AvataLevelEnough = false,
      ResourceEnough = false,
      BreakHintText = "",
      ResourceUse = {},
    }
    local r5_5 = GWorld:GetAvatar()
    local r6_5 = nil
    if DataMgr[r1_5 .. "Break"][r3_5] then
      r6_5 = DataMgr[r1_5 .. "Break"][r3_5][r2_5]
    end
    if r6_5 == nil or r5_5 == nil then
      return r4_5
    end
    r4_5.CanUpgrade = true
    for r10_5 = 1, 4, 1 do
      if r6_5.ItemId[r10_5] and r6_5.ItemNum[r10_5] then
        local r11_5 = {
          ResourceId = r6_5.ItemId[r10_5],
          Count = r6_5.ItemNum[r10_5],
        }
        local r12_5 = r5_5.Resources[r11_5.ResourceId]
        if not r12_5 then
          r12_5 = {}
          r12_5.Count = 0
        end
        if r12_5.Count < r11_5.Count then
          r4_5.BreakHintText = "BreakLevelUp_Insufficient_Resources"
          r4_5.CanUpgrade = false
        end
        table.insert(r4_5.ResourceUse, r11_5)
      end
    end
    r4_5.ResourceEnough = r4_5.CanUpgrade
    local r7_5 = DataMgr.GlobalConstant["BreakLimitLevel_" .. r2_5]
    if r7_5 and r5_5.Level < r7_5.ConstantValue then
      r4_5.CanUpgrade = false
      r4_5.BreakHintText = string.format(GText("UI_COMMONPOP_TEXT_100030"), math.ceil(r7_5.ConstantValue))
      return r4_5
    end
    r4_5.AvataLevelEnough = true
    if r0_5.Level < r6_5[r1_5 .. "BreakLevel"] then
      r4_5.CanUpgrade = false
      return r4_5
    end
    if r4_5.CanUpgrade and not r5_5.CollectRewardExpRecord[table.concat({
      r1_5,
      "Break",
      ".",
      r3_5,
      ".",
      r2_5
    })] then
      r4_5.FirstUpgrade = true
      r4_5.BreakHintText = string.format(GText("UI_Armory_WeaponBreakExp"), math.ceil(r2_5), math.ceil(r6_5.CollectRewardExp))
    end
    return r4_5
  end,
  CheckCharCanUpgradeCardLevel = function(r0_6)
    -- line: [211, 232] id: 6
    local r1_6 = tonumber(DataMgr.GlobalConstant.CharCardLevelMax.ConstantValue)
    local r2_6 = GWorld:GetAvatar()
    if not r2_6 then
      return 
    end
    if r1_6 <= r0_6.GradeLevel then
      return false
    end
    local r3_6 = DataMgr.CharCardLevelUp[r0_6.CharId]
    if not r3_6 or not r3_6[r0_6.GradeLevel] then
      return false
    end
    for r10_6, r11_6 in pairs(r0_6:CalculateCharGradeLevelUpResources(r3_6[r0_6.GradeLevel])) do
      if not r2_6.Resources[r10_6] or r2_6.Resources[r10_6].Count < r11_6 then
        return false
      end
    end
    -- close: r6_6
    return true
  end,
}
local r1_0 = nil
function r0_0.IsResourceForUpgrade(r0_7)
  -- line: [235, 255] id: 7
  if not r1_0 then
    r1_0 = {}
    for r5_7, r6_7 in pairs(DataMgr.WeaponBreak) do
      for r11_7, r12_7 in pairs(r6_7) do
        for r17_7, r18_7 in pairs(r12_7.ItemId) do
          r1_0[r18_7] = true
        end
        -- close: r13_7
      end
      -- close: r7_7
    end
    -- close: r1_7
    for r5_7, r6_7 in pairs(DataMgr.CharBreak) do
      for r11_7, r12_7 in pairs(r6_7) do
        for r17_7, r18_7 in pairs(r12_7.ItemId) do
          r1_0[r18_7] = true
        end
        -- close: r13_7
      end
      -- close: r7_7
    end
    -- close: r1_7
  end
  return r1_0[r0_7]
end
function r0_0.CheckPetCanBreakLevelUp(r0_8)
  -- line: [257, 277] id: 8
  if r0_8:IsMaxLevelBeforeBreak() and not r0_8:IsMaxBreak() then
    local r1_8 = GWorld:GetAvatar()
    local r2_8 = DataMgr.PetBreak[r0_8.PetId][r0_8.BreakNum]
    local r3_8 = r2_8.ConsumePetId
    for r8_8, r9_8 in pairs(r1_8.Pets) do
      for r14_8, r15_8 in pairs(r3_8) do
        if r9_8.UniqueId ~= r0_8.UniqueId and r15_8 == r9_8.PetId and r1_8.CurrentPet ~= r9_8.UniqueId then
          return true
        end
      end
      -- close: r10_8
    end
    -- close: r4_8
    for r9_8, r10_8 in pairs(r2_8.ConsumeResource and {}) do
      local r11_8 = r1_8.Resources[r9_8]
      if r11_8 and r11_8.Count > 0 then
        return true
      end
    end
    -- close: r5_8
  end
end
return r0_0
