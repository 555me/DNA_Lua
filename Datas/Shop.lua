-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\Shop.lua
-- version: lua54
-- line: [0, 0] id: 0
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end
local r2_0 = "Shop"
local r3_0 = {}
r3_0.AbyssShop = {
  MainTabId = {
    10000
  },
  ShopBgBPPath = "WidgetBlueprint\'/Game/UI/WBP/Shop/Widget/BG/WBP_Shop_BG_Abyss.WBP_Shop_BG_Abyss\'",
  ShopName = "Abyss_ExchangeStore",
  ShopUIName = "ShopActivity",
  SystemName = "AbyssShop",
}
r3_0.ExploreBadgeShop = {
  MainTabId = {
    701,
    702,
    703,
    704
  },
  ShopBgBPPath = "WidgetBlueprint\'/Game/UI/WBP/Shop/Widget/BG/WBP_Shop_BG_Area.WBP_Shop_BG_Area\'",
  ShopName = "UI_SHOP_ExploreBadge",
  ShopUIName = "ShopActivity",
  SpawnNPCId = 920005,
  SystemName = "ExploreBadgeShop",
}
r3_0.FishingShop = {
  MainTabId = {
    801,
    802
  },
  PlaySystemUIBGM = "event:/bgm/cbt03/0082_system_fishing",
  ShopBgBPPath = "WidgetBlueprint\'/Game/UI/WBP/Shop/Widget/BG/WBP_Shop_BG_Fishing.WBP_Shop_BG_Fishing\'",
  ShopName = "UI_SHOP_Fishing",
  ShopUIName = "ShopActivity",
  SpawnNPCId = 900010,
  SystemName = "FishingShop",
}
r3_0.HuaxuEventShop = {
  MainTabId = {
    10001
  },
  ShopBgBPPath = "WidgetBlueprint\'/Game/UI/WBP/Shop/Widget/BG/WBP_Shop_BG_Abyss.WBP_Shop_BG_Abyss\'",
  ShopName = "HuaxuEventShop",
  ShopUIName = "ShopActivity",
  SystemName = "HuaxuEventShop",
}
r3_0.HuaxuExploreShop = {
  MainTabId = {
    10005
  },
  ShopBgBPPath = "WidgetBlueprint\'/Game/UI/WBP/Shop/Widget/BG/WBP_Shop_BG_Dongguo.WBP_Shop_BG_Dongguo\'",
  ShopName = "HuaxuExploreShop",
  ShopUIName = "ShopActivity",
  SystemName = "HuaxuExploreShop",
}
r3_0.RaidShopSeason01 = {
  MainTabId = {
    10004
  },
  ShopBgBPPath = "WidgetBlueprint\'/Game/UI/WBP/Activity/Widget/Shop/ShopBG/WBP_Activity_Shop_BG_GuildWar.WBP_Activity_Shop_BG_GuildWar\'",
  ShopName = "RaidDungeon_Shop_Name",
  ShopUIName = "ShopActivity",
  SystemName = "RaidShopSeason01",
}
r3_0.Rouge = {
  MainTabId = {
    10002
  },
  ShopBgBPPath = "WidgetBlueprint\'/Game/UI/WBP/Shop/Widget/BG/WBP_Shop_BG_Rouge.WBP_Shop_BG_Rouge\'",
  ShopName = "Rouge_ExchangeShop",
  ShopUIName = "ShopActivity",
  SystemName = "Rouge",
}
r3_0.Shop = {
  MainTabId = {
    170,
    160,
    150,
    180,
    140,
    120,
    110,
    200
  },
  PlaySystemUIBGM = "event:/bgm/1_0/0083_system_shop_normal",
  ShopBgBPPath = "WidgetBlueprint\'/Game/UI/WBP/Shop/Widget/BG/WBP_Shop_BG_Normal.WBP_Shop_BG_Normal\'",
  ShopName = "MAIN_UI_SHOP",
  ShopUIName = "ShopMain",
  SpawnNPCId = 900002,
  SystemName = "Shop",
}
r3_0.WeeklyDungeonShop = {
  MainTabId = {
    10003
  },
  ShopBgBPPath = "WidgetBlueprint\'/Game/UI/WBP/Shop/Widget/BG/WBP_Shop_BG_Mod.WBP_Shop_BG_Mod\'",
  ShopName = "WeeklyDungeonShop",
  ShopUIName = "ShopActivity",
  SystemName = "WeeklyDungeonShop",
}
return r1_0(r2_0, r3_0)
