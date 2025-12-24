-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\RexclusionGroup2ShopItem.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    [1] = 160118,
    [2] = 160317,
  },
  RT_2 = {
    [1] = 160111,
    [2] = 160316,
  },
}
return ((DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [10, 10] id: 1
  return r1_1
end)("RexclusionGroup2ShopItem", {
  [160111] = r0_0.RT_2,
  [160118] = r0_0.RT_1,
  [160316] = r0_0.RT_2,
  [160317] = r0_0.RT_1,
})
