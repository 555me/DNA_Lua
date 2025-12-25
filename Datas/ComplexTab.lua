-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\ComplexTab.lua
-- version: lua54
-- line: [0, 0] id: 0
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end
local r2_0 = "ComplexTab"
local r3_0 = {}
r3_0[1] = {
  BackgroundIcon = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Shop/T_Shop_JumpEntry_Impression_1172_2850.T_Shop_JumpEntry_Impression_1172_2850\'",
  BackgroundVx = "Vx_Icon_Impression",
  CoinId = {
    3001
  },
  EntrySort = 100,
  InterfaceJumpId = 58,
  ShopEntryId = 1,
  ShopName = "UI_ImpressionShop_ShopName",
  SubTabId = 2001,
}
r3_0[2] = {
  BackgroundIcon = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Shop/T_Shop_JumpEntry_Area_1172_2850.T_Shop_JumpEntry_Area_1172_2850\'",
  BackgroundVx = "Vx_Icon_Area",
  CoinId = {
    29001,
    29002
  },
  EntrySort = 99,
  InterfaceJumpId = 60,
  ShopEntryId = 2,
  ShopName = "UI_SHOP_ExploreBadge",
  SubTabId = 2001,
}
r3_0[3] = {
  BackgroundIcon = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Shop/T_Shop_JumpEntry_Fishing_1172_2850.T_Shop_JumpEntry_Fishing_1172_2850\'",
  BackgroundVx = "Vx_Icon_Fishing",
  CoinId = {
    210
  },
  EntrySort = 98,
  InterfaceJumpId = 59,
  RefreshTime = {
    DAY = 1,
  },
  ShopEntryId = 3,
  ShopName = "UI_SHOP_Fishing",
  SubTabId = 2001,
}
r3_0[4] = {
  BackgroundIcon = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Shop/T_Shop_JumpEntry_Abyss_1172_2850.T_Shop_JumpEntry_Abyss_1172_2850\'",
  BackgroundVx = "Vx_Icon_Abyss",
  CoinId = {
    214
  },
  EntrySort = 97,
  InterfaceJumpId = 28,
  ShopEntryId = 4,
  ShopName = "Abyss_ExchangeStore",
  SubTabId = 2002,
}
r3_0[5] = {
  BackgroundIcon = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Shop/T_Shop_JumpEntry_Rouge_1172_2850.T_Shop_JumpEntry_Rouge_1172_2850\'",
  BackgroundVx = "Vx_Icon_Rouge",
  CoinId = {
    215
  },
  EntrySort = 96,
  InterfaceJumpId = 55,
  RefreshTime = {
    WEEK = 1,
  },
  ShopEntryId = 5,
  ShopName = "UI_RougeExchangeShop_Title",
  SubTabId = 2002,
}
r3_0[6] = {
  BackgroundIcon = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Shop/T_Shop_JumpEntry_Dongguo.T_Shop_JumpEntry_Dongguo\'",
  BackgroundVx = "Vx_Icon_Dongguo",
  CoinId = {
    29005
  },
  EntrySort = 95,
  InterfaceJumpId = 72,
  ShopEntryId = 6,
  ShopName = "HuaxuExploreShop",
  SubTabId = 2003,
}
r3_0[7] = {
  BackgroundIcon = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Shop/T_Shop_JumpEntry_Mod_1172.T_Shop_JumpEntry_Mod_1172\'",
  BackgroundVx = "Vx_Icon_Mod",
  CoinId = {
    216
  },
  EntrySort = 94,
  InterfaceJumpId = 73,
  RefreshTime = {
    WEEK = 4,
  },
  ShopEntryId = 7,
  ShopName = "WeeklyDungeonShop",
  SubTabId = 2002,
}
return r1_0(r2_0, r3_0)
