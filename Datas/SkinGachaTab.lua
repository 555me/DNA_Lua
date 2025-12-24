-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\SkinGachaTab.lua
-- version: lua54
-- line: [0, 0] id: 0
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end
local r2_0 = "SkinGachaTab"
local r3_0 = {}
r3_0[1] = {
  GachaId = {
    9001
  },
  Icon = "/Game/UI/Texture/Dynamic/Image/Gacha/Banner/T_Gacha_PoolBanner_Normal01.T_Gacha_PoolBanner_Normal01",
  ReddotNode = "Gacha_Normal",
  Sequence = 99,
  TabId = 1,
  TabName = "UI_SkinGacha_Normal",
}
r3_0[2] = {
  GachaId = {
    9002
  },
  Icon = "/Game/UI/Texture/Dynamic/Image/Gacha/Banner/T_Gacha_PoolBanner_Saiqi01.T_Gacha_PoolBanner_Saiqi01",
  ReddotNode = "Gacha_Special",
  Sequence = 1,
  TabId = 2,
  TabName = "UI_SkinGacha_Special",
}
r3_0[3] = {
  GachaId = {
    9003
  },
  Icon = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Gacha/Banner/T_Gacha_PoolBanner_Baiheng01.T_Gacha_PoolBanner_Baiheng01\'",
  ReddotNode = "Gacha_Special_2",
  Sequence = 1,
  TabId = 3,
  TabName = "UI_SkinGacha_Special",
}
return r1_0(r2_0, r3_0)
