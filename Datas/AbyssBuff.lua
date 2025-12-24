-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\AbyssBuff.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    [1] = "$(#Buff[2010001].LockHp.Rate)*100$%",
    [2] = "$#GlobalPassiveData[20100].Vars.LastTime$",
    [3] = "$(#Buff[2010003].AddAttrs[1].Value)*100$%",
    [4] = "$#Buff[2010003].MaxLayer$",
  },
  RT_2 = {
    [1] = "$(#Buff[2010201].MaxLayer)*(#Buff[2010201].BuffDamagedRate.Value)*-100$%",
    [2] = "$(#Buff[2010201].BuffDamagedRate.Value)*-100$%",
  },
  RT_3 = {
    2010201
  },
}
r0_0.RT_4 = {
  BuffList = r0_0.RT_3,
}
r0_0.RT_5 = {
  80
}
r0_0.RT_6 = {
  40
}
r0_0.RT_7 = {
  1
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [28, 28] id: 1
  return r1_1
end
local r3_0 = "AbyssBuff"
local r4_0 = {
  [10] = {
    AbyssBuffDes = "Buff_Content_100",
    AbyssBuffID = 10,
    AbyssBuffName = "Buff_Title_100",
    AbyssBuffParameter = r0_0.RT_1,
    AbyssBuffType = 2,
    BuffLockToast = "Abyss_NormalBuffLockToast_2",
    GlobalPassiveId = 20100,
    GlobalPassiveLv = 1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Mon_Boss.T_Abyss_Buff_Mon_Boss",
  },
  [20] = {
    AbyssBuffDes = "Buff_Content_201",
    AbyssBuffID = 20,
    AbyssBuffName = "Buff_Title_201",
    AbyssBuffParameter = r0_0.RT_2,
    AbyssBuffType = 2,
    BuffLockToast = "Abyss_NormalBuffLockToast_1",
    GlobalPassiveId = 20201,
    GlobalPassiveLv = 1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Mon_Survive02.T_Abyss_Buff_Mon_Survive02",
    MonsterBuff = r0_0.RT_4,
    MonsterBuffLayer = r0_0.RT_5,
  },
}
r4_0[30] = {
  AbyssBuffDes = "Buff_Content_30",
  AbyssBuffID = 30,
  AbyssBuffName = "Buff_Title_30",
  AbyssBuffParameter = {
    [1] = "$#GlobalPassiveData[20030].Vars.HitCount$",
    [2] = "$(#Buff[2010011].AddAttrs[1].Rate)*100$%",
    [3] = "$#GlobalPassiveData[20030].Vars.LastTime$",
    [4] = "$#Buff[2010011].MaxLayer$",
  },
  AbyssBuffType = 1,
  BuffLockToast = "Abyss_InfiniteLockToast_1",
  GlobalPassiveId = 20030,
  GlobalPassiveLv = 1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Common.T_Abyss_Buff_Common",
}
r4_0[100] = {
  AbyssBuffDes = "Buff_Content_100",
  AbyssBuffID = 100,
  AbyssBuffName = "Buff_Title_100",
  AbyssBuffParameter = r0_0.RT_1,
  AbyssBuffType = 2,
  GlobalPassiveId = 20100,
  GlobalPassiveLv = 1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Mon_Boss.T_Abyss_Buff_Mon_Boss",
}
r4_0[201] = {
  AbyssBuffDes = "Buff_Content_201",
  AbyssBuffID = 201,
  AbyssBuffName = "Buff_Title_201",
  AbyssBuffParameter = r0_0.RT_2,
  AbyssBuffType = 2,
  BuffLockToast = "Abyss_InfiniteLockToast_1",
  GlobalPassiveId = 20201,
  GlobalPassiveLv = 1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Mon_Survive02.T_Abyss_Buff_Mon_Survive02",
  MonsterBuff = r0_0.RT_4,
  MonsterBuffLayer = r0_0.RT_5,
}
local r5_0 = {
  AbyssBuffDes = "Buff_Content_202",
  AbyssBuffID = 202,
  AbyssBuffName = "Buff_Title_202",
  AbyssBuffParameter = {
    [1] = "$(#Buff[2010202].MaxLayer)*(#Buff[2010202].BuffDamagedRate.Value)*-100$%",
    [2] = "$(#Buff[2010202].BuffDamagedRate.Value)*-100$%",
  },
  AbyssBuffType = 2,
  BuffLockToast = "Abyss_InfiniteLockToast_1",
  GlobalPassiveId = 20202,
  GlobalPassiveLv = 1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Mon_Survive02.T_Abyss_Buff_Mon_Survive02",
}
r5_0.MonsterBuff = {
  BuffList = {
    2010202
  },
}
r5_0.MonsterBuffLayer = r0_0.RT_6
r4_0[202] = r5_0
r5_0 = {
  AbyssBuffDes = "Buff_Content_203",
  AbyssBuffID = 203,
  AbyssBuffName = "Buff_Title_203",
  AbyssBuffParameter = {
    [1] = "$(#Buff[2010203].MaxLayer)*(#Buff[2010203].BuffDamagedRate.Value)*-100$%",
    [2] = "$(#Buff[2010203].BuffDamagedRate.Value)*-100$%",
  },
  AbyssBuffType = 2,
  BuffLockToast = "Abyss_InfiniteLockToast_1",
  GlobalPassiveId = 20203,
  GlobalPassiveLv = 1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Mon_Survive02.T_Abyss_Buff_Mon_Survive02",
}
r5_0.MonsterBuff = {
  BuffList = {
    2010203
  },
}
r5_0.MonsterBuffLayer = r0_0.RT_6
r4_0[203] = r5_0
r5_0 = {
  AbyssBuffDes = "Buff_Content_204",
  AbyssBuffID = 204,
  AbyssBuffName = "Buff_Title_204",
  AbyssBuffParameter = {
    [1] = "$(#Buff[2010204].MaxLayer)*(#Buff[2010204].BuffDamagedRate.Value)*-100$%",
    [2] = "$(#Buff[2010204].BuffDamagedRate.Value)*-100$%",
  },
  AbyssBuffType = 2,
  BuffLockToast = "Abyss_InfiniteLockToast_1",
  GlobalPassiveId = 20204,
  GlobalPassiveLv = 1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Mon_Survive02.T_Abyss_Buff_Mon_Survive02",
}
r5_0.MonsterBuff = {
  BuffList = {
    2010204
  },
}
r5_0.MonsterBuffLayer = r0_0.RT_6
r4_0[204] = r5_0
r5_0 = {
  AbyssBuffDes = "Buff_Content_205",
  AbyssBuffID = 205,
  AbyssBuffName = "Buff_Title_205",
  AbyssBuffParameter = {
    [1] = "$(#Buff[2010205].MaxLayer)*(#Buff[2010205].BuffDamagedRate.Value)*-100$%",
    [2] = "$(#Buff[2010205].BuffDamagedRate.Value)*-100$%",
  },
  AbyssBuffType = 2,
  BuffLockToast = "Abyss_InfiniteLockToast_1",
  GlobalPassiveId = 20205,
  GlobalPassiveLv = 1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Mon_Survive02.T_Abyss_Buff_Mon_Survive02",
}
r5_0.MonsterBuff = {
  BuffList = {
    2010205
  },
}
r5_0.MonsterBuffLayer = {
  20
}
r4_0[205] = r5_0
r5_0 = {
  AbyssBuffDes = "Buff_Content_206",
  AbyssBuffID = 206,
  AbyssBuffName = "Buff_Title_206",
  AbyssBuffParameter = {
    [1] = "$(#Buff[2010206].MaxLayer)*(#Buff[2010206].BuffDamagedRate.Value)*-100$%",
    [2] = "$(#Buff[2010206].BuffDamagedRate.Value)*-100$%",
  },
  AbyssBuffType = 2,
  BuffLockToast = "Abyss_InfiniteLockToast_1",
  GlobalPassiveId = 20206,
  GlobalPassiveLv = 1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Mon_Survive02.T_Abyss_Buff_Mon_Survive02",
}
r5_0.MonsterBuff = {
  BuffList = {
    2010206
  },
}
r5_0.MonsterBuffLayer = {
  10
}
r4_0[206] = r5_0
r5_0 = {
  AbyssBuffDes = "Buff_Content_211",
  AbyssBuffID = 211,
  AbyssBuffName = "Buff_Title_211",
  AbyssBuffParameter = {
    [1] = "$(#Buff[2010211].DotDatas[1].Rate)*100$%",
  },
  AbyssBuffType = 2,
  BuffLockToast = "Abyss_InfiniteLockToast_1",
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Mon_Survive02.T_Abyss_Buff_Mon_Survive02",
}
r5_0.MonsterBuff = {
  BuffList = {
    2010211
  },
}
r5_0.MonsterBuffLayer = r0_0.RT_7
r4_0[211] = r5_0
r4_0[301] = {
  AbyssBuffDes = "Buff_Content_301",
  AbyssBuffID = 301,
  AbyssBuffName = "Buff_Title_301",
  AbyssBuffParameter = {
    [1] = "$#GlobalPassiveData[20301].Vars.HitCount$",
    [2] = "$(#Buff[2010301].AddAttrs[1].Rate)*100$%",
    [3] = "$#GlobalPassiveData[20301].Vars.LastTime$",
    [4] = "$#Buff[2010301].MaxLayer$",
  },
  AbyssBuffType = 1,
  BuffLockToast = "Abyss_InfiniteLockToast_1",
  GlobalPassiveId = 20301,
  GlobalPassiveLv = 1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Skill.T_Abyss_Buff_Skill",
}
r4_0[302] = {
  AbyssBuffDes = "Buff_Content_302",
  AbyssBuffID = 302,
  AbyssBuffName = "Buff_Title_302",
  AbyssBuffParameter = {
    [1] = "$(#Buff[2010302].AddAttrs[1].Value)*100$%",
  },
  AbyssBuffType = 1,
  BuffLockToast = "Abyss_InfiniteLockToast_1",
  GlobalPassiveId = 20302,
  GlobalPassiveLv = 1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Range.T_Abyss_Buff_Range",
}
r4_0[303] = {
  AbyssBuffDes = "Buff_Content_303",
  AbyssBuffID = 303,
  AbyssBuffName = "Buff_Title_303",
  AbyssBuffParameter = {
    [1] = "$#GlobalPassiveData[20303].Vars.CritRate*100$%",
  },
  AbyssBuffType = 1,
  BuffLockToast = "Abyss_InfiniteLockToast_1",
  GlobalPassiveId = 20303,
  GlobalPassiveLv = 1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Common.T_Abyss_Buff_Common",
}
r4_0[304] = {
  AbyssBuffDes = "Buff_Content_304",
  AbyssBuffID = 304,
  AbyssBuffName = "Buff_Title_304",
  AbyssBuffParameter = {
    [1] = "$#GlobalPassiveData[20304].Vars.SpCost$",
    [2] = "$(#Buff[2010304].AddAttrs[1].Rate)*100$%",
    [3] = "$#GlobalPassiveData[20304].Vars.LastTime$",
    [4] = "$#Buff[2010304].MaxLayer$",
  },
  AbyssBuffType = 1,
  BuffLockToast = "Abyss_InfiniteLockToast_1",
  GlobalPassiveId = 20304,
  GlobalPassiveLv = 1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Skill.T_Abyss_Buff_Skill",
}
r4_0[401] = {
  AbyssBuffDes = "Buff_Content_401",
  AbyssBuffID = 401,
  AbyssBuffName = "Buff_Title_401",
  AbyssBuffParameter = {
    [1] = "$(#Buff[2010102].BuffDamagedRate.Value)*(-100)$%",
  },
  AbyssBuffType = 2,
  BuffLockToast = "Abyss_InfiniteLockToast_1",
  GlobalPassiveId = 20401,
  GlobalPassiveLv = 1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Mon_Aura.T_Abyss_Buff_Mon_Aura",
}
r5_0 = 402
local r6_0 = {
  AbyssBuffDes = "Buff_Content_402",
  AbyssBuffID = 402,
  AbyssBuffName = "Buff_Title_402",
  AbyssBuffParameter = {
    [1] = "$(#Buff[2010402].AddAttrs[1].Value)*-100$%",
  },
  AbyssBuffType = 2,
  BuffLockToast = "Abyss_InfiniteLockToast_1",
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Mon_Survive01.T_Abyss_Buff_Mon_Survive01",
}
r6_0.MonsterBuff = {
  BuffList = {
    2010402
  },
}
r6_0.MonsterBuffLayer = r0_0.RT_7
r4_0[r5_0] = r6_0
r4_0[511] = {
  AbyssBuffDes = "Buff_Content_511",
  AbyssBuffID = 511,
  AbyssBuffName = "Buff_Title_511",
  AbyssBuffParameter = {
    [1] = "$#GlobalPassiveData[20511].Vars.DownRate*-100$%",
    [2] = "$#GlobalPassiveData[20511].Vars.UpRate*100$%",
  },
  AbyssBuffType = 2,
  BuffLockToast = "Abyss_InfiniteLockToast_1",
  GlobalPassiveId = 20511,
  GlobalPassiveLv = 1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Exchange.T_Abyss_Buff_Exchange",
}
r4_0[512] = {
  AbyssBuffDes = "Buff_Content_512",
  AbyssBuffID = 512,
  AbyssBuffName = "Buff_Title_512",
  AbyssBuffParameter = {
    [1] = "$(#Buff[2010512].AddAttrs[1].Value)*-100$%",
    [2] = "$#GlobalPassiveData[20512].Vars.TriggerProb*100$%",
  },
  AbyssBuffType = 2,
  BuffLockToast = "Abyss_InfiniteLockToast_1",
  GlobalPassiveId = 20512,
  GlobalPassiveLv = 1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Exchange.T_Abyss_Buff_Exchange",
}
r5_0 = 905
r6_0 = {
  AbyssBuffDes = "Buff_Content_905",
  AbyssBuffID = 905,
  AbyssBuffName = "Buff_Title_905",
  AbyssBuffParameter = {
    [1] = "$#Buff[2010005].OverrideAttrs.Rate*100$%",
  },
  AbyssBuffType = 2,
  BuffLockToast = "Abyss_InfiniteLockToast_1",
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Mon_Survive01.T_Abyss_Buff_Mon_Survive01",
}
r6_0.MonsterBuff = {
  BuffList = {
    2010005
  },
}
r6_0.MonsterBuffLayer = r0_0.RT_7
r4_0[r5_0] = r6_0
r5_0 = 920
r6_0 = {
  AbyssBuffDes = "Buff_Content_920",
  AbyssBuffID = 920,
  AbyssBuffName = "Buff_Title_920",
  AbyssBuffType = 1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Exchange.T_Abyss_Buff_Exchange",
}
r6_0.MonsterBuff = {
  BuffList = {
    2010020
  },
}
r6_0.MonsterBuffLayer = r0_0.RT_7
r4_0[r5_0] = r6_0
r5_0 = 925
r6_0 = {
  AbyssBuffDes = "Buff_Content_925",
  AbyssBuffID = 925,
  AbyssBuffName = "Buff_Title_925",
  AbyssBuffType = 1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Exchange.T_Abyss_Buff_Exchange",
}
r6_0.MonsterBuff = {
  BuffList = {
    2010025
  },
}
r6_0.MonsterBuffLayer = r0_0.RT_7
r4_0[r5_0] = r6_0
r5_0 = 935
r6_0 = {
  AbyssBuffDes = "Buff_Content_935",
  AbyssBuffID = 935,
  AbyssBuffName = "Buff_Title_935",
  AbyssBuffType = 1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Exchange.T_Abyss_Buff_Exchange",
}
r6_0.MonsterBuff = {
  BuffList = {
    2010035
  },
}
r6_0.MonsterBuffLayer = r0_0.RT_7
r4_0[r5_0] = r6_0
r5_0 = 951
r6_0 = {
  AbyssBuffDes = "Buff_Content_951",
  AbyssBuffID = 951,
  AbyssBuffName = "Buff_Title_951",
  AbyssBuffType = 1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Exchange.T_Abyss_Buff_Exchange",
}
r6_0.MonsterBuff = {
  BuffList = {
    2010051
  },
}
r6_0.MonsterBuffLayer = r0_0.RT_7
r4_0[r5_0] = r6_0
r5_0 = 11111
r6_0 = {
  AbyssBuffDes = "Buff_Content_11111",
  AbyssBuffID = 11111,
  AbyssBuffName = "Buff_Title_11111",
  AbyssBuffParameter = {
    [1] = "$(#Buff[2011111].MaxLayer)*(#Buff[2011111].BuffDamagedRate.Value)*-100$%",
    [2] = "$(#Buff[2011111].BuffDamagedRate.Value)*-100$%",
  },
  AbyssBuffType = 2,
  GlobalPassiveId = 11112,
  GlobalPassiveLv = 1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Mon_Survive02.T_Abyss_Buff_Mon_Survive02",
}
r6_0.MonsterBuff = {
  BuffList = {
    2011111
  },
}
r6_0.MonsterBuffLayer = {
  6
}
r4_0[r5_0] = r6_0
r4_0[11113] = {
  AbyssBuffDes = "Buff_Content_11113",
  AbyssBuffID = 11113,
  AbyssBuffName = "Buff_Title_11113",
  AbyssBuffParameter = {
    [1] = "$#Buff[2011113].AddAttrs[1].Value*100$%",
    [2] = "$#Buff[2011113].AddAttrs[2].Rate*100$%",
    [3] = "$#GlobalPassiveData[11113].Vars.LastTime$",
    [4] = "$#Buff[2011113].MaxLayer$",
  },
  AbyssBuffType = 1,
  GlobalPassiveId = 11113,
  GlobalPassiveLv = 1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Common.T_Abyss_Buff_Common",
}
r4_0[11121] = {
  AbyssBuffDes = "Buff_Content_11121",
  AbyssBuffID = 11121,
  AbyssBuffName = "Buff_Title_11121",
  AbyssBuffParameter = {
    [1] = "$#GlobalPassiveData[11121].Vars.HpCost*100$%",
    [2] = "$#Buff[2011121].AddAttrs[1].Value*100$%",
    [3] = "$#GlobalPassiveData[11121].Vars.LastTime$",
    [4] = "$#Buff[2011121].MaxLayer$",
  },
  AbyssBuffType = 1,
  GlobalPassiveId = 11121,
  GlobalPassiveLv = 1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Range.T_Abyss_Buff_Range",
}
r4_0[11122] = {
  AbyssBuffDes = "Buff_Content_11122",
  AbyssBuffID = 11122,
  AbyssBuffName = "Buff_Title_11122",
  AbyssBuffParameter = {
    [1] = "$(#Buff[2011122].AddAttrs[1].Value)*-100$%",
    [2] = "$#Buff[2011122].AddAttrs[2].Value*100$%",
  },
  AbyssBuffType = 2,
  GlobalPassiveId = 11122,
  GlobalPassiveLv = 1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Exchange.T_Abyss_Buff_Exchange",
}
r4_0[11211] = {
  AbyssBuffDes = "Buff_Content_11211",
  AbyssBuffID = 11211,
  AbyssBuffName = "Buff_Title_11211",
  AbyssBuffParameter = {
    [1] = "$#GlobalPassiveData[11211].Vars.HpRate*100$%",
    [2] = "$#Buff[2011211].AddAttrs[1].Rate*100$%",
  },
  AbyssBuffType = 1,
  GlobalPassiveId = 11211,
  GlobalPassiveLv = 1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Skill.T_Abyss_Buff_Skill",
}
r4_0[11212] = {
  AbyssBuffDes = "Buff_Content_11212",
  AbyssBuffID = 11212,
  AbyssBuffName = "Buff_Title_11212",
  AbyssBuffParameter = {
    [1] = "$(#Buff[2011212].AddAttrs[1].Value)*-100$%",
    [2] = "$#Buff[2011212].AddAttrs[2].Value*100$%",
  },
  AbyssBuffType = 2,
  GlobalPassiveId = 11212,
  GlobalPassiveLv = 1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Exchange.T_Abyss_Buff_Exchange",
}
r4_0[11221] = {
  AbyssBuffDes = "Buff_Content_11221",
  AbyssBuffID = 11221,
  AbyssBuffName = "Buff_Title_11221",
  AbyssBuffParameter = {
    [1] = "$#Buff[2011221].AddAttrs[1].Value*100$%",
    [2] = "$#GlobalPassiveData[11221].Vars.LastTime$",
    [3] = "$#Buff[2011221].MaxLayer$",
  },
  AbyssBuffType = 1,
  GlobalPassiveId = 11221,
  GlobalPassiveLv = 1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Melee.T_Abyss_Buff_Melee",
}
r4_0[11222] = {
  AbyssBuffDes = "Buff_Content_11222",
  AbyssBuffID = 11222,
  AbyssBuffName = "Buff_Title_11222",
  AbyssBuffParameter = {
    [1] = "$(#Buff[2011222].AddAttrs[1].Value)*-100$%",
    [2] = "$#Buff[2011222].AddAttrs[2].Value*100$%",
  },
  AbyssBuffType = 2,
  GlobalPassiveId = 11222,
  GlobalPassiveLv = 1,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Exchange.T_Abyss_Buff_Exchange",
}
return r2_0(r3_0, r4_0)
