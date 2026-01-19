-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\GlobalPassiveData.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    Count = "#1",
  },
}
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [6, 6] id: 1
  return r1_1
end
local r4_0 = {}
r4_0[1] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/BP_AbyssPassive_Test.BP_AbyssPassive_Test",
  Camp = "Monster",
  ID = 1,
  Vars = {
    GrowVar = "#1",
    TestVar = 30,
  },
}
r4_0[11112] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_PersonalRemoveBuff.BP_AbyssGP_PersonalRemoveBuff",
  Camp = "Player",
  ID = 11112,
  Vars = {
    Buff = 2011111,
  },
}
r4_0[11113] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_HealAddBuff.BP_AbyssGP_HealAddBuff",
  Camp = "Player",
  ID = 11113,
  Vars = {
    Buff = 2011113,
    LastTime = 10,
  },
}
r4_0[11121] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_HpCostAddBuff.BP_AbyssGP_HpCostAddBuff",
  Camp = "Player",
  ID = 11121,
  Vars = {
    Buff = 2011121,
    HpCost = 0.04,
    LastTime = 12,
  },
}
r4_0[11122] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_AddBuff.BP_AbyssGP_AddBuff",
  Camp = "Player",
  ID = 11122,
  Vars = {
    Buff = 2011122,
  },
}
r4_0[11211] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_HpAboveBuff.BP_AbyssGP_HpAboveBuff",
  Camp = "Player",
  ID = 11211,
  Vars = {
    Buff = 2011211,
    HpRate = 0.8,
  },
}
r4_0[11212] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_AddBuff.BP_AbyssGP_AddBuff",
  Camp = "Player",
  ID = 11212,
  Vars = {
    Buff = 2011212,
  },
}
r4_0[11221] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_MeleeAddBuff.BP_AbyssGP_MeleeAddBuff",
  Camp = "Player",
  ID = 11221,
  Vars = {
    Buff = 2011221,
    LastTime = 10,
  },
}
r4_0[11222] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_AddBuff.BP_AbyssGP_AddBuff",
  Camp = "Player",
  ID = 11222,
  Vars = {
    Buff = 2011222,
  },
}
r4_0[20030] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_HitCountBuff.BP_AbyssGP_HitCountBuff",
  Camp = "Player",
  ID = 20030,
  Vars = {
    Buff = 2010011,
    HitCount = 5,
    LastTime = 10,
  },
}
r4_0[20100] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_BossLockHp.BP_AbyssGP_BossLockHp",
  Camp = "Monster",
  GameplayTag = "Mon.Boss",
  ID = 20100,
  Vars = {
    LastTime = 30,
    LockHpBuff = 2010001,
    LockHpRate = 0.5,
  },
}
r4_0[20102] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_EsAddDamage.BP_AbyssGP_EsAddDamage",
  Camp = "Monster",
  ID = 20102,
  Vars = {
    DamageRate = 0.2,
  },
}
r4_0[20201] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_HittedRemoveBuff.BP_AbyssGP_HittedRemoveBuff",
  Camp = "Monster",
  ID = 20201,
  Vars = {
    Buff = 2010201,
  },
}
r4_0[20202] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_HittedRemoveBuff.BP_AbyssGP_HittedRemoveBuff",
  Camp = "Monster",
  ID = 20202,
  Vars = {
    Buff = 2010202,
    Condition = "Crit",
  },
}
r4_0[20203] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_HittedRemoveBuff.BP_AbyssGP_HittedRemoveBuff",
  Camp = "Monster",
  ID = 20203,
  Vars = {
    Buff = 2010203,
    Condition = "Tag",
    DamageTag = "Ranged",
  },
}
r4_0[20204] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_HittedRemoveBuff.BP_AbyssGP_HittedRemoveBuff",
  Camp = "Monster",
  ID = 20204,
  Vars = {
    Buff = 2010204,
    Condition = "Tag",
    DamageTag = "Weapon",
  },
}
r4_0[20205] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_HittedRemoveBuff.BP_AbyssGP_HittedRemoveBuff",
  Camp = "Monster",
  ID = 20205,
  Vars = {
    Buff = 2010205,
    Condition = "Tag",
    DamageTag = "Melee",
  },
}
r4_0[20206] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_HittedRemoveBuff.BP_AbyssGP_HittedRemoveBuff",
  Camp = "Monster",
  ID = 20206,
  Vars = {
    Buff = 2010206,
    Condition = "Tag",
    DamageTag = "Dot",
  },
}
r4_0[20301] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_HitCountBuff.BP_AbyssGP_HitCountBuff",
  Camp = "Player",
  ID = 20301,
  Vars = {
    Buff = 2010301,
    HitCount = 5,
    LastTime = 15,
  },
}
r4_0[20302] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_AddBuff.BP_AbyssGP_AddBuff",
  Camp = "Player",
  ID = 20302,
  Vars = {
    Buff = 2010302,
  },
}
r4_0[20303] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_CritUpByBuff.BP_AbyssGP_CritUpByBuff",
  Camp = "Player",
  ID = 20303,
  Vars = {
    CritRate = 0.2,
  },
}
r4_0[20304] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_SpAddBuff.BP_AbyssGP_SpAddBuff",
  ID = 20304,
  Vars = {
    Buff = 2010304,
    LastTime = 15,
    SpCost = 15,
  },
}
r4_0[20401] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_AddBuff.BP_AbyssGP_AddBuff",
  Camp = "Monster",
  GameplayTag = "Mon.Elite",
  ID = 20401,
  Vars = {
    Buff = 2010101,
  },
}
r4_0[20511] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_DmgExchange.BP_AbyssGP_DmgExchange",
  Camp = "Player",
  ID = 20511,
  Vars = {
    DownRate = -0.5,
    DownTag = "Dot",
    UpRate = 0.5,
    UpTag = "Weapon",
  },
}
r4_0[20512] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_SkillTrigger.BP_AbyssGP_SkillTrigger",
  Camp = "Player",
  ID = 20512,
  Vars = {
    Buff = 2010512,
    TriggerProb = 1,
  },
}
r4_0[22001] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Event/BP_EventGP_Wys_1.BP_EventGP_Wys_1",
  Camp = "Player",
  ID = 22001,
}
r4_0[22002] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Event/BP_EventGP_Wys_2.BP_EventGP_Wys_2",
  Camp = "Player",
  ID = 22002,
}
r4_0[22003] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Event/BP_EventGP_Wys_3.BP_EventGP_Wys_3",
  Camp = "Player",
  ID = 22003,
}
r4_0[22004] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Event/BP_EventGP_Wys_4.BP_EventGP_Wys_4",
  Camp = "Player",
  ID = 22004,
}
r4_0[30100] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Raid/BP_RaidGP_Common.BP_RaidGP_Common",
  Camp = "Monster",
  ID = 30100,
  Vars = {
    EliteRate = 0.27,
    NormalRate = 0.033,
  },
}
r4_0[30101] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Raid/BP_RaidGP_010.BP_RaidGP_010",
  Camp = "Player",
  ID = 30101,
  Vars = {
    Divider = 0.3,
    MaxSkillInten = 4,
    Penetration = 0.05,
  },
}
r4_0[30101001] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/RougeLike/Contract/BP_Rou_Contract_30101001.BP_Rou_Contract_30101001",
  Camp = "Player",
  ID = 30101001,
  Vars = {
    HealRate = "#1",
  },
}
r4_0[30101002] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/RougeLike/Contract/BP_Rou_Contract_30101002.BP_Rou_Contract_30101002",
  Camp = "Player",
  ID = 30101002,
}
r4_0[30102001] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/RougeLike/Contract/BP_Rou_Contract_30102001.BP_Rou_Contract_30102001",
  Camp = "Monster",
  ID = 30102001,
}
r4_0[30102002] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/RougeLike/Contract/BP_Rou_Contract_30102002.BP_Rou_Contract_30102002",
  Camp = "Monster",
  ID = 30102002,
}
r4_0[30102003] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/RougeLike/Contract/BP_Rou_Contract_30102003.BP_Rou_Contract_30102003",
  Camp = "Monster",
  ID = 30102003,
  Vars = {
    DamagedRate = "#1",
  },
}
r4_0[30102004] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/RougeLike/Contract/BP_Rou_Contract_30102004.BP_Rou_Contract_30102004",
  Camp = "Monster",
  ID = 30102004,
}
r4_0[30103001] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/RougeLike/Contract/BP_Rou_Contract_30103001.BP_Rou_Contract_30103001",
  Camp = "Player",
  ID = 30103001,
  Vars = r0_0.RT_1,
}
r4_0[30103002] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/RougeLike/Contract/BP_Rou_Contract_30103002.BP_Rou_Contract_30103002",
  Camp = "Player",
  ID = 30103002,
  Vars = r0_0.RT_1,
}
r4_0[30103003] = {
  BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/RougeLike/Contract/BP_Rou_Contract_30103003.BP_Rou_Contract_30103003",
  Camp = "Player",
  ID = 30103003,
  Vars = r0_0.RT_1,
}
return r1_0("GlobalPassiveData", r4_0)
