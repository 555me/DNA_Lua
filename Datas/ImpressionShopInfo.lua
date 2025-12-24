-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\ImpressionShopInfo.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    3001
  },
}
return ((DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [6, 6] id: 1
  return r1_1
end)("ImpressionShopInfo", {
  [1011] = {
    ImpressionShopRegionId = 1011,
    PlaySystemUIBGM = "event:/bgm/1_0/0084_system_shop_danjiao",
    ShopBgBPPath = "WidgetBlueprint\'/Game/UI/WBP/Shop/Widget/BG/WBP_Shop_BG_Impression.WBP_Shop_BG_Impression\'",
    ShopName = "UI_ImpressionShop_ShopName",
    TabCoin = r0_0.RT_1,
  },
  [1041] = {
    ImpressionShopRegionId = 1041,
    PlaySystemUIBGM = "event:/bgm/1_0/0084_system_shop_danjiao",
    ShopBgBPPath = "WidgetBlueprint\'/Game/UI/WBP/Shop/Widget/BG/WBP_Shop_BG_Impression.WBP_Shop_BG_Impression\'",
    ShopName = "UI_ImpressionShop_ShopName",
    ShopUnlockRuleId = 12010101,
    TabCoin = r0_0.RT_1,
  },
})
