-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\RougeLikeShopRandom.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    6,
    7
  },
  RT_2 = {
    1,
    2
  },
  RT_3 = {
    8,
    10
  },
  RT_4 = {
    2,
    3
  },
  RT_5 = {
    3,
    4
  },
  RT_6 = {
    7,
    9
  },
  RT_7 = {
    5,
    6
  },
  RT_8 = {
    1,
    2,
    3
  },
  RT_9 = {
    4,
    5
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [40, 40] id: 1
  return r1_1
end
local r3_0 = "RougeLikeShopRandom"
local r4_0 = {
  [1] = {
    Blessing = r0_0.RT_1,
    Rarity = r0_0.RT_2,
    ShopRandom = 1,
    Treasure = r0_0.RT_2,
  },
  [2] = {
    Blessing = r0_0.RT_7,
    Rarity = r0_0.RT_2,
    ShopRandom = 2,
    Treasure = r0_0.RT_4,
  },
}
r4_0[3] = {
  Blessing = {
    7,
    8
  },
  Rarity = r0_0.RT_2,
  ShopRandom = 3,
  Treasure = r0_0.RT_4,
}
r4_0[4] = {
  Blessing = r0_0.RT_1,
  Rarity = r0_0.RT_2,
  ShopRandom = 4,
  Treasure = r0_0.RT_5,
}
r4_0[5] = {
  Blessing = r0_0.RT_3,
  Rarity = r0_0.RT_8,
  ShopRandom = 5,
  Treasure = r0_0.RT_5,
}
r4_0[6] = {
  Blessing = r0_0.RT_6,
  Rarity = r0_0.RT_8,
  ShopRandom = 6,
  Treasure = r0_0.RT_9,
}
r4_0[7] = {
  Blessing = {
    10,
    12
  },
  Rarity = r0_0.RT_8,
  ShopRandom = 7,
  Treasure = r0_0.RT_9,
}
r4_0[8] = {
  Blessing = {
    9,
    11
  },
  Rarity = r0_0.RT_8,
  ShopRandom = 8,
  Treasure = r0_0.RT_7,
}
r4_0[101] = {
  Blessing = r0_0.RT_3,
  Rarity = r0_0.RT_4,
  ShopRandom = 101,
  Treasure = r0_0.RT_5,
}
r4_0[102] = {
  Blessing = r0_0.RT_6,
  Rarity = {
    3
  },
  ShopRandom = 102,
  Treasure = r0_0.RT_5,
}
r4_0[201] = {
  Blessing = {
    9,
    12
  },
  Item = {
    5,
    7
  },
  Rarity = r0_0.RT_8,
  ShopRandom = 201,
  Treasure = {
    4,
    6
  },
}
return r2_0(r3_0, r4_0)
