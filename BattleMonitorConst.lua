-- filename: @C:/Pack/Branch/geili11\Content/Script/BattleMonitorConst.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  ATK_Char = 8000,
  DEF = 8000,
  HP = 40000,
  SP = 40000,
  ATK_Weapon = 8000,
  SkillIntensity = 8,
  Strong = 8,
  Enmity = 4,
  CRI = 5,
  CRD = 20,
  Mul_Shoot = 5,
  CheckAttributeValid = function(r0_1, r1_1)
    -- line: [15, 78] id: 1
    if not r1_1 then
      return false
    end
    local r2_1 = r1_1:GetAttr("ATK")
    local r3_1 = r1_1:GetAttr("ATK_Char")
    if r0_0.ATK_Char < r3_1 then
      return true
    end
    if r0_0.ATK_Weapon < r2_1 - r3_1 then
      return true
    end
    if r0_0.HP < r1_1:GetAttr("MaxHp") then
      return true
    end
    if r0_0.DEF < r1_1:GetAttr("DEF") then
      return true
    end
    if r0_0.SP < r1_1:GetAttr("MaxES") then
      return true
    end
    if r0_0.Strong < (r1_1:GetAttr("StrongValue") and 0) then
      return true
    end
    if r0_0.Enmity < (r1_1:GetAttr("EnmityValue") and 0) then
      return true
    end
    if r0_0.SkillIntensity < r1_1:GetAttr("SkillIntensity") then
      return true
    end
    local r11_1 = r1_1:GetCurrentWeapon()
    if r11_1 then
      if r0_0.CRI < r11_1:GetAttr("CRI") then
        return true
      end
      if r0_0.CRD < r11_1:GetAttr("CRD") then
        return true
      end
      if r0_0.Mul_Shoot < r11_1:GetAttr("MultiShoot") then
        return true
      end
    end
    return false
  end,
}
return r0_0
