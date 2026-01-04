-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Char\CharacterComponent\CharPreloadComponent.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class()
local r1_0 = {
  "Bow",
  "Cannon",
  "Claymore",
  "Crossbow",
  "Funnel",
  "Katana",
  "Machinegun",
  "Polearm",
  "Shotgun",
  "Sword",
  "Swordwhip"
}
function r0_0.PreloadEnable(r0_1)
  -- line: [19, 24] id: 1
  if r0_1.Owner:IsPlayer() then
    return Const.EnablePlayerPreload
  end
  return true
end
function r0_0.NeedPreloadAssets_Phantom(r0_2)
  -- line: [46, 48] id: 2
  return Const.EnableDungeonPhantomPreload
end
function r0_0.InitDistructableBody(r0_3)
  -- line: [65, 67] id: 3
  r0_3.Owner.DistructableBodyId = r0_3:GetDistructableBodyId()
end
function r0_0.GetDistructableBodyId(r0_4)
  -- line: [69, 74] id: 4
  if not r0_4.Owner:IsRealMonster() or r0_4.Owner:IsPhantom() then
    return 
  end
  return DataMgr.Monster[r0_4.Owner.UnitId].DistructableId
end
function r0_0.GetPlayerWeaponMontageTags(r0_5)
  -- line: [80, 104] id: 5
  if not r0_5.Owner:IsPlayer() or not r0_5.Owner.InitSuccess then
    GWorld.logger.errorlog("主角预加载武器蒙太奇资源, 获取数据失败", r0_5.Owner.CurrentRoleId, r0_5.Owner.InitSuccess)
    return {}
  end
  local r1_5 = {}
  for r6_5, r7_5 in pairs(r0_5.Owner.Weapons) do
    table.insert(r1_5, r7_5.WeaponId)
  end
  -- close: r2_5
  local r2_5 = {}
  for r7_5, r8_5 in pairs(r1_5) do
    local r9_5 = DataMgr.BattleWeapon[r8_5]
    if r9_5 then
      for r14_5, r15_5 in pairs(r9_5.WeaponTag) do
        if CommonUtils.HasValue(r1_0, r15_5) then
          table.insert(r2_5, r15_5)
        end
      end
      -- close: r10_5
    end
  end
  -- close: r3_5
  return r2_5
end
function r0_0.GetPhantomWeaponIds(r0_6)
  -- line: [111, 151] id: 6
  local r1_6 = {}
  local r2_6 = r0_6.Owner.AvatarInfo
  if r2_6 and r2_6.MeleeWeapon then
    table.insert(r1_6, r2_6.MeleeWeapon.WeaponId)
  else
    table.insert(r1_6, r0_6.Owner:GetMeleeWeaponId())
  end
  if r2_6 and r2_6.RangedWeapon then
    table.insert(r1_6, r2_6.RangedWeapon.WeaponId)
  end
  if r2_6 and r2_6.UltraWeapon then
    table.insert(r1_6, r2_6.UltraWeapon.WeaponId)
  else
    table.insert(r1_6, r0_6.Owner:GetUltraWeaponId())
  end
  table.insert(r1_6, r0_6.Owner:GetCondemnWeaponId())
  return r1_6
end
return r0_0
