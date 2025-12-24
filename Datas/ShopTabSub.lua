-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\ShopTabSub.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    210,
    101
  },
  RT_2 = {
    215
  },
  RT_3 = {
    99,
    100
  },
  RT_4 = {
    99
  },
  RT_5 = {
    211
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [20, 20] id: 1
  return r1_1
end
local r3_0 = "ShopTabSub"
local r4_0 = {
  [1101] = {
    MainTabId = 110,
    SubName = "UI_SHOP_MAINTAB_PAY",
    SubTabId = 1101,
    TabCoin = r0_0.RT_3,
    TabType = "Pay",
  },
  [1201] = {
    MainTabId = 120,
    ReddotNode = "Shop_Skin_Suit",
    SubName = "UI_SHOP_SUBTAB_SKIN",
    SubTabId = 1201,
    TabCoin = r0_0.RT_3,
    TabType = "Skin",
  },
  [1202] = {
    MainTabId = 120,
    ReddotNode = "Shop_Skin_Head",
    SubName = "UI_SHOP_MAINTAB_ACCESSORY_Head",
    SubTabId = 1202,
    TabCoin = r0_0.RT_3,
    TabType = "Skin",
  },
  [1203] = {
    MainTabId = 120,
    ReddotNode = "Shop_Skin_Face",
    SubName = "UI_SHOP_MAINTAB_ACCESSORY_Face",
    SubTabId = 1203,
    TabCoin = r0_0.RT_3,
    TabType = "Skin",
  },
  [1204] = {
    MainTabId = 120,
    ReddotNode = "Shop_Skin_Waist",
    SubName = "UI_SHOP_MAINTAB_ACCESSORY_Waist",
    SubTabId = 1204,
    TabCoin = r0_0.RT_3,
    TabType = "Skin",
  },
  [1205] = {
    MainTabId = 120,
    ReddotNode = "Shop_Skin_Back",
    SubName = "UI_SHOP_MAINTAB_ACCESSORY_Back",
    SubTabId = 1205,
    TabCoin = r0_0.RT_3,
    TabType = "Skin",
  },
  [1207] = {
    MainTabId = 120,
    ReddotNode = "Shop_Skin_Effect",
    SubName = "UI_SHOP_MAINTAB_ACCESSORY_EFFECT",
    SubTabId = 1207,
    TabCoin = r0_0.RT_3,
    TabType = "Skin",
  },
}
r4_0[1401] = {
  MainTabId = 140,
  ReddotNode = "Shop_Gacha_Higth",
  SubName = "UI_SHOP_SUBTAB_NAME_SPPrism",
  SubTabId = 1401,
  TabCoin = {
    111,
    110
  },
  TabType = "Normal",
}
r4_0[1402] = {
  MainTabId = 140,
  ReddotNode = "Shop_Gacha_Low",
  SubName = "UI_SHOP_SUBTAB_NAME_Prism",
  SubTabId = 1402,
  TabCoin = {
    110
  },
  TabType = "Normal",
}
r4_0[1500] = {
  MainTabId = 150,
  ReddotNode = "Shop_Item_Yueshijingpei",
  SubName = "UI_SHOP_SUBTAB_NAME_YUESHIJINGPEI",
  SubTabId = 1500,
  TabCoin = r0_0.RT_4,
  TabType = "Normal",
}
r4_0[1501] = {
  MainTabId = 150,
  ReddotNode = "Shop_Item_Yueshi",
  SubName = "UI_SHOP_SUBTAB_NAME_YUESHITAB",
  SubTabId = 1501,
  TabCoin = {
    100
  },
  TabType = "Normal",
}
r4_0[1502] = {
  MainTabId = 150,
  ReddotNode = "Shop_Item_CharPiece",
  SubName = "UI_SHOP_SUBTAB_NAME_CHARPIECE",
  SubTabId = 1502,
  TabCoin = r0_0.RT_4,
  TabType = "Normal",
}
r4_0[1503] = {
  MainTabId = 150,
  ReddotNode = "Shop_Item_Weapon",
  SubName = "UI_SHOP_SUBTAB_NAME_WEAPON",
  SubTabId = 1503,
  TabCoin = r0_0.RT_4,
  TabType = "Normal",
}
r4_0[1601] = {
  MainTabId = 160,
  ReddotNode = "Shop_Pack_Limit",
  SubName = "UI_SHOP_MAINTAB_PACK_LIMIT",
  SubTabId = 1601,
  TabCoin = r0_0.RT_3,
  TabType = "Pack",
}
r4_0[1604] = {
  MainTabId = 160,
  ReddotNode = "Shop_Pack_Month",
  SubName = "UI_SHOP_MAINTAB_PACK_MONTH",
  SubTabId = 1604,
  TabCoin = r0_0.RT_3,
  TabType = "Pack",
}
r4_0[1605] = {
  MainTabId = 160,
  ReddotNode = "Shop_Pack_Week",
  SubName = "UI_SHOP_MAINTAB_PACK_WEEK",
  SubTabId = 1605,
  TabCoin = r0_0.RT_3,
  TabType = "Pack",
}
r4_0[1606] = {
  MainTabId = 160,
  ReddotNode = "Shop_Pack_Item",
  SubName = "UI_SHOP_MAINTAB_PACK_ITEM",
  SubTabId = 1606,
  TabCoin = r0_0.RT_3,
  TabType = "Pack",
}
r4_0[1701] = {
  MainTabId = 170,
  SubName = "UI_SHOP_MAINTAB_BANNER",
  SubTabId = 1701,
  TabCoin = r0_0.RT_3,
  TabType = "Banner",
}
r4_0[1801] = {
  ConditionId = "SecretLetterShopTab",
  MainTabId = 180,
  ReddotNode = "Shop_Walnut_1",
  SubName = "UI_Armory_Char",
  SubTabId = 1801,
  TabCoin = r0_0.RT_5,
  TabType = "Normal",
}
r4_0[1802] = {
  ConditionId = "SecretLetterShopTab",
  MainTabId = 180,
  ReddotNode = "Shop_Walnut_2",
  SubName = "UI_SHOP_SUBTAB_NAME_WEAPON",
  SubTabId = 1802,
  TabCoin = r0_0.RT_5,
  TabType = "Normal",
}
r4_0[1803] = {
  ConditionId = "SecretLetterShopTab",
  MainTabId = 180,
  ReddotNode = "Shop_Walnut_3",
  SubName = "UI_Armory_Mod",
  SubTabId = 1803,
  TabCoin = r0_0.RT_5,
  TabType = "Normal",
}
r4_0[2001] = {
  MainTabId = 200,
  SubName = "UI_SHOP_MAINTAB_COMPLEX_1",
  SubTabId = 2001,
  TabCoin = r0_0.RT_3,
  TabType = "Complex",
}
r4_0[2002] = {
  ConditionId = "TimeRewardShopTab",
  MainTabId = 200,
  SubName = "UI_SHOP_MAINTAB_COMPLEX_2",
  SubTabId = 2002,
  TabCoin = r0_0.RT_3,
  TabType = "Complex",
  UnlockHide = true,
}
r4_0[2003] = {
  ConditionId = "RegionalShopTab",
  MainTabId = 200,
  SubName = "UI_SHOP_MAINTAB_COMPLEX_3",
  SubTabId = 2003,
  TabCoin = r0_0.RT_3,
  TabType = "Complex",
  UnlockHide = true,
}
r4_0[7010] = {
  MainTabId = 701,
  SubName = "UI_SHOP_TAB_ExploreBadge_Prologue",
  SubTabId = 7010,
  TabCoin = {
    29001
  },
  TabType = "Normal",
}
r4_0[7020] = {
  MainTabId = 702,
  SubName = "UI_SHOP_TAB_ExploreBadge_Chapter01",
  SubTabId = 7020,
  TabCoin = {
    29002
  },
  TabType = "Normal",
}
r4_0[7030] = {
  ConditionId = "LonzaFortressShopTab",
  MainTabId = 703,
  SubName = "UI_SHOP_TAB_ExploreBadge_EXChapter01",
  SubTabId = 7030,
  TabCoin = {
    29003
  },
  TabType = "Normal",
  UnlockHide = true,
}
r4_0[7040] = {
  ConditionId = "YanjinduShopTab",
  MainTabId = 704,
  SubName = "UI_SHOP_TAB_ExploreBadge_East01",
  SubTabId = 7040,
  TabCoin = {
    29004
  },
  TabType = "Normal",
  UnlockHide = true,
}
r4_0[8010] = {
  MainTabId = 801,
  SubName = "UI_SHOP_SUBTAB_NAME_FISHING",
  SubTabId = 8010,
  TabCoin = r0_0.RT_1,
  TabType = "Normal",
}
r4_0[8011] = {
  MainTabId = 801,
  SubName = "UI_SHOP_MAINTAB_ITEM",
  SubTabId = 8011,
  TabCoin = r0_0.RT_1,
  TabType = "Normal",
}
r4_0[8020] = {
  ConditionId = "YanjinduShopTab",
  MainTabId = 802,
  SubName = "UI_SHOP_SUBTAB_NAME_FISHING",
  SubTabId = 8020,
  TabCoin = r0_0.RT_1,
  TabType = "Normal",
  UnlockHide = true,
}
r4_0[8021] = {
  ConditionId = "YanjinduShopTab",
  MainTabId = 802,
  SubName = "UI_SHOP_MAINTAB_ITEM",
  SubTabId = 8021,
  TabCoin = r0_0.RT_1,
  TabType = "Normal",
  UnlockHide = true,
}
r4_0[99010] = {
  MainTabId = 9901,
  SubName = "MAIN_UI_SHOP",
  SubTabId = 99010,
  TabCoin = {
    101
  },
  TabType = "Normal",
}
r4_0[100001] = {
  MainTabId = 10000,
  SubName = "Abyss_ExchangeStore",
  SubTabId = 100001,
  TabCoin = {
    214
  },
  TabType = "Normal",
}
r4_0[100011] = {
  MainTabId = 10001,
  SubName = "HuaxuEventShop",
  SubTabId = 100011,
  TabCoin = r0_0.RT_1,
  TabType = "Normal",
}
r4_0[100021] = {
  MainTabId = 10002,
  SubName = "UI_SHOP_ROGUE_ITEM",
  SubTabId = 100021,
  TabCoin = r0_0.RT_2,
  TabType = "Normal",
}
r4_0[100022] = {
  MainTabId = 10002,
  SubName = "UI_SHOP_MOD_MELEEUWEAPON",
  SubTabId = 100022,
  TabCoin = r0_0.RT_2,
  TabType = "Normal",
}
r4_0[100023] = {
  MainTabId = 10002,
  SubName = "UI_SHOP_MOD_RANGEUWEAPON",
  SubTabId = 100023,
  TabCoin = r0_0.RT_2,
  TabType = "Normal",
}
r4_0[100031] = {
  MainTabId = 10003,
  SubName = "WeeklyDungeonShop",
  SubTabId = 100031,
  TabCoin = {
    216
  },
  TabType = "Normal",
}
r4_0[100041] = {
  MainTabId = 10004,
  SubName = "RaidDungeon_Shop_Name",
  SubTabId = 100041,
  TabCoin = {
    218
  },
  TabType = "Normal",
}
r4_0[100051] = {
  MainTabId = 10005,
  SubName = "HuaxuExploreShop",
  SubTabId = 100051,
  TabCoin = {
    29005
  },
  TabType = "Normal",
}
return r2_0(r3_0, r4_0)
