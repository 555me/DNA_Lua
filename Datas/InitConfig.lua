-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\InitConfig.lua
-- version: lua54
-- line: [0, 0] id: 0
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end
local r2_0 = "InitConfig"
local r3_0 = {}
r3_0[1] = {
  AlternativeCharId = 3301,
  AlternativeRangedWeapon = {
    20501,
    20401
  },
  CharId = 1101,
  Id = 1,
  MeleeWeaponId = 10101,
  RangedWeaponId = 20401,
  TitleFrameId = 10001,
}
return r1_0(r2_0, r3_0)
