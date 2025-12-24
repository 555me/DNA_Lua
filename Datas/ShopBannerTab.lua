-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\ShopBannerTab.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    2401
  },
  RT_2 = {
    120101
  },
  RT_3 = {
    1503
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [12, 12] id: 1
  return r1_1
end
local r3_0 = "ShopBannerTab"
local r4_0 = {
  [1] = {
    ActivityId = 0,
    BannerIcon = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Shop/T_Shop_Recommend_Saiqi01.T_Shop_Recommend_Saiqi01\'",
    BgVideoPath = "FileMediaSource\'/Game/Asset/UIVideo/SystemShow/ShopSkin/Shop_Skin_SaiqiCar01.Shop_Skin_SaiqiCar01\'",
    Bp = "WBP_Shop_Recommend_Common",
    DisplayId = 530101,
    DisplayType = "Skin",
    EndTime = 1766394000,
    Id = 1,
    InterfaceJumpId = 5,
    Sequence = 4999,
    StartTime = 1735704000,
    Text1 = "UI_Skin_Name_530101",
  },
  [2] = {
    ActivityId = 105102011,
    BannerIcon = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Shop/T_Shop_Recommend_MonthCard.T_Shop_Recommend_MonthCard\'",
    BannerType = 1,
    Bp = "WBP_Shop_Banner_MonthCard",
    Id = 2,
    MarkText = "UI_Banner_Tab_SpSale_10",
    Sequence = 5000,
    StartTime = 1735704000,
    Text1 = "UI_Banner_MonthlyCard",
  },
}
r4_0[3] = {
  BannerIcon = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Shop/T_Shop_Recommend_NewPlayerGift.T_Shop_Recommend_NewPlayerGift\'",
  Bp = "WBP_Shop_Recommend_Gift4_1",
  DisplayText = "UI_Banner_Pack_All",
  GoodsId = "com.hero.dna.Pay_Bundle1",
  Id = 3,
  ItemIds = {
    160107
  },
  MarkText = "UI_Banner_Tab_SaleForNew",
  PreviewEntryText = "UI_Weapon_Preview",
  PreviewId = {
    20601,
    20305,
    10601,
    10302
  },
  PreviewType = "Weapon",
  Sequence = 9998,
  StartTime = 1735704000,
  Text1 = "Pack_Name_Shop_Start_01",
}
r4_0[4] = {
  BannerIcon = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Shop/T_Shop_Recommend_WeaponSkin01.T_Shop_Recommend_WeaponSkin01\'",
  Bp = "WBP_Shop_Recommend_WeaponSkin",
  Id = 4,
  ItemIds = r0_0.RT_2,
  MarkText = "UI_Banner_Tab_WeaponSkinForNew",
  PreviewEntryText = "UI_WeaponSkin_Preview",
  PreviewId = {
    3010202
  },
  PreviewType = "WeaponSkin",
  Sequence = 9999,
  StartTime = 1735704000,
  Text1 = "UI_WeaponSkin_Name_3010202",
}
r4_0[111] = {
  BannerIcon = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Shop/T_Shop_Recommend_0002.T_Shop_Recommend_0002\'",
  BgVideoPath = "FileMediaSource\'/Game/Asset/UIVideo/SystemShow/ShopSkin/Shop_Skin_Baiheng01.Shop_Skin_Baiheng01\'",
  Bp = "WBP_Shop_Recommend_Common",
  DisplayId = 240101,
  DisplayType = "Skin",
  EndTime = 1770667200,
  Id = 111,
  InterfaceJumpId = 5,
  IsSwitchTab = true,
  MarkText = "UI_Banner_Tab_NewGacha",
  PreviewEntryText = "UI_Banner_SkinPreview",
  PreviewId = {
    240101
  },
  PreviewType = "Skin",
  Sequence = 1,
  StartTime = 1766408400,
  SwitchTime = 5,
  Text1 = "UI_Skin_Name_240101",
}
r4_0[112] = {
  BannerIcon = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Shop/T_Shop_Recommend_0003.T_Shop_Recommend_0003\'",
  BgVideoPath = "FileMediaSource\'/Game/Asset/UIVideo/SystemShow/ShopSkin/Shop_Action_Baiheng01.Shop_Action_Baiheng01\'",
  Bp = "WBP_Shop_Recommend_Common",
  DisplayId = 41020,
  DisplayType = "Resource",
  EndTime = 1770667200,
  Id = 112,
  IsSwitchTab = true,
  ItemIds = {
    140227
  },
  MarkText = "UI_Banner_Tab_NewGacha",
  PreviewEntryText = "UI_Banner_GesturePreview",
  PreviewId = {
    41020
  },
  PreviewType = "Resource",
  Sequence = 2,
  StartTime = 1766408400,
  SwitchTime = 5,
  Text1 = "RESOURCE_NAME_41020",
}
r4_0[113] = {
  BannerIcon = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Shop/T_Shop_Recommend_0010.T_Shop_Recommend_0010\'",
  Bp = "WBP_Shop_Recommend_Common",
  DisplayId = 2401,
  DisplayType = "Char",
  EndTime = 1768770000,
  Id = 113,
  IsSwitchTab = true,
  ItemIds = {
    150125
  },
  MarkText = "UI_Banner_Tab_NewChar",
  PreviewEntryText = "UI_DailyPack_CharPreview",
  PreviewId = r0_0.RT_1,
  PreviewType = "Char",
  Sequence = 3,
  StartTime = 1766408400,
  SwitchTime = 5,
  Text1 = "UI_CHAR_NAME_2401",
}
r4_0[114] = {
  BannerIcon = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Shop/T_Shop_Recommend_0001.T_Shop_Recommend_0001\'",
  Bp = "WBP_Shop_Recommend_Common",
  DisplayId = 10502,
  DisplayType = "Weapon",
  EndTime = 1768770000,
  Id = 114,
  IsSwitchTab = true,
  ItemIds = {
    159123
  },
  MarkText = "UI_Banner_Tab_NewWeapon",
  PreviewEntryText = "UI_Weapon_Preview",
  PreviewId = {
    10502
  },
  PreviewType = "Weapon",
  Sequence = 4,
  StartTime = 1766408400,
  SwitchTime = 5,
  Text1 = "UI_WEAPON_NAME_10502",
}
r4_0[115] = {
  BannerIcon = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Shop/T_Shop_Recommend_0009.T_Shop_Recommend_0009\'",
  Bp = "WBP_Shop_Recommend_Common",
  DisplayType = "GeneralSkin",
  EndTime = 1770667200,
  Id = 115,
  ItemIds = {
    120109,
    120110,
    120111
  },
  MarkText = "UI_Banner_Tab_NewSkin",
  PreviewEntryText = "UI_Banner_SkinPreview",
  PreviewType = "GeneralSkin",
  Sequence = 11,
  SkinSeries = "BP_02",
  StartTime = 1766408400,
  Text1 = "UI_Skin_Name_0011",
  Text2 = "UI_Banner_GeneralTips",
  Text2EntryText = "UI_Banner_GeneralTipsEntry",
}
r4_0[116] = {
  BannerIcon = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Shop/T_Shop_Recommend_PageGift01.T_Shop_Recommend_PageGift01\'",
  BannerType = 2,
  Bp = "WBP_Shop_Recommend_PageGift",
  EndTime = 1768770000,
  Id = 116,
  MarkText = "UI_Banner_Tab_SpSale_200",
  PreviewEntryText = "UI_DailyPack_CharPreview",
  PreviewId = r0_0.RT_1,
  PreviewType = "Char",
  Sequence = 5002,
  StartTime = 1766408400,
  Text1 = "DailyPack_Name_1",
  Text2 = "UI_DailyPack_RuleDes_1",
  Text2EntryText = "UI_DailyPack_Rule",
}
r4_0[117] = {
  BannerIcon = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Shop/T_Shop_Recommend_0012.T_Shop_Recommend_0012\'",
  Bp = "WBP_Shop_Recommend_Common",
  DisplayId = 30002,
  DisplayType = "CharAccessory",
  EndTime = 1768770000,
  Id = 117,
  ItemIds = r0_0.RT_2,
  MarkText = "UI_Banner_Tab_NewWeaponSkin",
  Sequence = 5005,
  StartTime = 1766408400,
  Text1 = "UI_Accessory_Name_30002",
}
r4_0[120] = {
  BannerIcon = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Shop/T_Shop_Recommend_0011.T_Shop_Recommend_0011\'",
  Bp = "WBP_Shop_Recommend_Common",
  DisplayId = 1503,
  DisplayType = "Char",
  EndTime = 1770667200,
  Id = 120,
  IsSwitchTab = true,
  ItemIds = {
    150120
  },
  MarkText = "UI_Banner_Tab_NewChar",
  PreviewEntryText = "UI_DailyPack_CharPreview",
  PreviewId = r0_0.RT_3,
  PreviewType = "Char",
  Sequence = 5,
  StartTime = 1768874400,
  SwitchTime = 5,
  Text1 = "UI_CHAR_NAME_1503",
}
r4_0[121] = {
  BannerIcon = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Shop/T_Shop_Recommend_0006.T_Shop_Recommend_0006\'",
  Bp = "WBP_Shop_Recommend_Common",
  DisplayId = 20510,
  DisplayType = "Weapon",
  EndTime = 1770667200,
  Id = 121,
  IsSwitchTab = true,
  ItemIds = {
    159149
  },
  MarkText = "UI_Banner_Tab_NewWeapon",
  PreviewEntryText = "UI_Weapon_Preview",
  PreviewId = {
    20510
  },
  PreviewType = "Weapon",
  Sequence = 6,
  StartTime = 1768874400,
  SwitchTime = 5,
  Text1 = "UI_WEAPON_NAME_20510",
}
r4_0[122] = {
  BannerIcon = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Shop/T_Shop_Recommend_0007.T_Shop_Recommend_0007\'",
  Bp = "WBP_Shop_Recommend_Common",
  DisplayId = 3010502,
  DisplayType = "WeaponSkin",
  EndTime = 1770667200,
  Id = 122,
  ItemIds = {
    120124
  },
  MarkText = "UI_Banner_Tab_NewWeaponSkin",
  Sequence = 10,
  StartTime = 1768874400,
  Text1 = "UI_WeaponSkin_Name_3010502",
}
r4_0[123] = {
  BannerIcon = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Shop/T_Shop_Recommend_0004.T_Shop_Recommend_0004\'",
  Bp = "WBP_Shop_Recommend_Common",
  DisplayId = 40012,
  DisplayType = "CharAccessory",
  EndTime = 1770667200,
  Id = 123,
  ItemIds = {
    120510
  },
  MarkText = "UI_Banner_Tab_NewAccessory",
  Sequence = 5003,
  StartTime = 1768874400,
  Text1 = "UI_Accessory_Name_40012",
}
r4_0[124] = {
  BannerIcon = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Shop/T_Shop_Recommend_0005.T_Shop_Recommend_0005\'",
  Bp = "WBP_Shop_Recommend_Common",
  DisplayId = 40025,
  DisplayType = "CharAccessory",
  EndTime = 1770667200,
  Id = 124,
  ItemIds = {
    120515
  },
  MarkText = "UI_Banner_Tab_NewAccessory",
  Sequence = 5004,
  StartTime = 1768874400,
  Text1 = "UI_Accessory_Name_40025",
}
r4_0[125] = {
  BannerIcon = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Shop/T_Shop_Recommend_PageGift02.T_Shop_Recommend_PageGift02\'",
  BannerType = 2,
  Bp = "WBP_Shop_Recommend_PageGift",
  EndTime = 1770667200,
  Id = 125,
  MarkText = "UI_Banner_Tab_SpSale_200",
  PreviewEntryText = "UI_DailyPack_CharPreview",
  PreviewId = r0_0.RT_3,
  PreviewType = "Char",
  Sequence = 5001,
  StartTime = 1768874400,
  Text1 = "DailyPack_Name_1",
  Text2 = "UI_DailyPack_RuleDes_2",
  Text2EntryText = "UI_DailyPack_Rule",
}
return r2_0(r3_0, r4_0)
