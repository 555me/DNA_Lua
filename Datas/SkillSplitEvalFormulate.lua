-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\SkillSplitEvalFormulate.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = "/Game/BluePrints/Common/BP_SkillFunctionLibrary"
local r1_0 = LoadClass(r0_0)
local function r2_0(r0_1, r1_1)
  -- line: [3, 10] id: 1
  if not r1_0 then
    r1_0 = LoadClass(r0_0)
  end
  if r1_0 then
    return r1_0.CondemnDamageValue(r0_1, r1_1)
  end
end
return ((DataMgr and {}).ReadOnly and function(r0_2, r1_2)
  -- line: [11, 11] id: 2
  return r1_2
end)("SkillSplitEvalFormulate", {
  ["$0.25*math.exp(0.0002*Source:GetAttr(\'Level\')^2+0.0868*Source:GetAttr(\'Level\')+7.0885)$"] = function(r0_3, r1_3, r2_3)
    -- line: [13, 15] id: 3
    return math.exp((r0_3:GetAttr("Level") ^ 2 * 0.0002 + r0_3:GetAttr("Level") * 0.0868 + 7.0885)) * 0.25
  end,
  ["$0.75*math.exp(0.0002*Source:GetAttr(\'Level\')^2+0.0868*Source:GetAttr(\'Level\')+7.0885)$"] = function(r0_4, r1_4, r2_4)
    -- line: [16, 18] id: 4
    return math.exp((r0_4:GetAttr("Level") ^ 2 * 0.0002 + r0_4:GetAttr("Level") * 0.0868 + 7.0885)) * 0.75
  end,
  ["$Source:GetRootSource():GetFloat(\'Xibi_Skill04_Rate\')$"] = function(r0_5, r1_5, r2_5)
    -- line: [19, 21] id: 5
    return r0_5:GetRootSource():GetFloat("Xibi_Skill04_Rate")
  end,
  ["$Source:GetInt(\'MagazineBulletNum_20406\')$"] = function(r0_6, r1_6, r2_6)
    -- line: [22, 24] id: 6
    return r0_6:GetInt("MagazineBulletNum_20406")
  end,
  ["$Source:GetRootSource():GetInt(\'PassiveWaitingNum\')$"] = function(r0_7, r1_7, r2_7)
    -- line: [25, 27] id: 7
    return r0_7:GetRootSource():GetInt("PassiveWaitingNum")
  end,
  ["$Source:GetInt(\'MagazineBulletNum_20505\')$"] = function(r0_8, r1_8, r2_8)
    -- line: [28, 30] id: 8
    return r0_8:GetInt("MagazineBulletNum_20505")
  end,
  ["$Source:GetRootSource():GetFloat(\'Skill04TriggerRate\')$"] = function(r0_9, r1_9, r2_9)
    -- line: [31, 33] id: 9
    return r0_9:GetRootSource():GetFloat("Skill04TriggerRate")
  end,
  ["$Source:GetRootSource():GetInt(\'Skill1Buff\')$"] = function(r0_10, r1_10, r2_10)
    -- line: [34, 36] id: 10
    return r0_10:GetRootSource():GetInt("Skill1Buff")
  end,
  ["$Source:GetInt(\'Skill02BulletNum\')$"] = function(r0_11, r1_11, r2_11)
    -- line: [37, 39] id: 11
    return r0_11:GetInt("Skill02BulletNum")
  end,
  ["$Source:GetFloat(\'LinenSkill02ShootRate\')*Source:GetCurrentWeaponAttr(\'MultiShoot\', 1)$"] = function(r0_12, r1_12, r2_12)
    -- line: [40, 42] id: 12
    return r0_12:GetFloat("LinenSkill02ShootRate") * r0_12:GetCurrentWeaponAttr("MultiShoot", 1)
  end,
})
