-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\GachaRebate.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end
local r3_0 = {}
r3_0.Char = {
  [4] = {
    Rarity = 4,
    Type = "Char",
  },
  [5] = {
    Rarity = 5,
    Type = "Char",
  },
}
r3_0.Weapon = {
  [3] = {
    Rarity = 3,
    Type = "Weapon",
  },
  [4] = {
    Rarity = 4,
    Type = "Weapon",
  },
  [5] = {
    Rarity = 5,
    Type = "Weapon",
  },
}
return r0_0("GachaRebate", r3_0)
