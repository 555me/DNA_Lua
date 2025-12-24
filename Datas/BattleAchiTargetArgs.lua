-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\BattleAchiTargetArgs.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    [1] = "DamageType",
    [2] = "DamageTag",
    [3] = "ExceptDamageTag",
  },
  RT_2 = {
    [1] = "List(DamageType)",
    [2] = "List(String)",
    [3] = "List(String)",
  },
  RT_3 = {
    [1] = "LimitTime",
  },
  RT_4 = {
    [1] = "float",
  },
  RT_5 = {
    [1] = "BuffType",
    [2] = "CampFilter",
  },
  RT_6 = {
    [1] = "List(Int)",
    [2] = "String",
  },
}
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [27, 27] id: 1
  return r1_1
end
local r4_0 = {
  AddOverEnergyShield = {
    TargetType = "AddOverEnergyShield",
  },
  BluePrintTrigger = {
    TargetType = "BluePrintTrigger",
  },
  ClearWithoutPhantomAndDamaged = {
    TargetType = "ClearWithoutPhantomAndDamaged",
  },
  Damage = {
    ArgName = r0_0.RT_1,
    ArgType = r0_0.RT_2,
    TargetType = "Damage",
  },
}
r4_0.DamageOnDefeated = {
  ArgName = {
    [1] = "DamageType",
    [2] = "DamageTag",
    [3] = "ExceptSkillType",
  },
  ArgType = {
    [1] = "List(DamageType)",
    [2] = "List(String)",
    [3] = "List(SkillType)",
  },
  TargetType = "DamageOnDefeated",
}
r4_0.Damaged = {
  ArgName = {
    [1] = "DamageType",
    [2] = "DamageTag",
    [3] = "TrueValue",
  },
  ArgType = {
    [1] = "List(DamageType)",
    [2] = "List(String)",
    [3] = "float",
  },
  TargetType = "Damaged",
}
r4_0.Heal = {
  ArgName = r0_0.RT_1,
  ArgType = r0_0.RT_2,
  TargetType = "Heal",
}
r4_0.LimitTimeAddBuff = {
  ArgName = {
    [1] = "LimitTime",
    [2] = "BuffType",
  },
  ArgType = {
    [1] = "float",
    [2] = "List(Int)",
  },
  TargetType = "LimitTimeAddBuff",
}
r4_0.LimitTimeKillMonster = {
  ArgName = r0_0.RT_3,
  ArgType = r0_0.RT_4,
  TargetType = "LimitTimeKillMonster",
}
r4_0.LimitTimeUseNormalSkill = {
  ArgName = r0_0.RT_3,
  ArgType = r0_0.RT_4,
  TargetType = "LimitTimeUseNormalSkill",
}
r4_0.LimitTimeUseUltraSkill = {
  ArgName = r0_0.RT_3,
  ArgType = r0_0.RT_4,
  TargetType = "LimitTimeUseUltraSkill",
}
r4_0.OnAddBuffToOther = {
  ArgName = r0_0.RT_5,
  ArgType = r0_0.RT_6,
  TargetType = "OnAddBuffToOther",
}
r4_0.OnAddPhantom = {
  ArgName = {
    [1] = "PhantomId",
  },
  ArgType = {
    [1] = "List(Int)",
  },
  TargetType = "OnAddPhantom",
}
r4_0.OnAddSp = {
  ArgName = {
    [1] = "Reason",
  },
  ArgType = {
    [1] = "Int",
  },
  TargetType = "OnAddSp",
}
r4_0.OnBuffRemovedFromTarget = {
  ArgName = r0_0.RT_5,
  ArgType = r0_0.RT_6,
  TargetType = "OnBuffRemovedFromTarget",
}
r4_0.OnDungeonEndWithoutPhantom = {
  TargetType = "OnDungeonEndWithoutPhantom",
}
r4_0.OnFinishHardBoss = {
  TargetType = "OnFinishHardBoss",
}
r4_0.OnMonsterAddedBuff = {
  ArgName = r0_0.RT_5,
  ArgType = r0_0.RT_6,
  TargetType = "OnMonsterAddedBuff",
}
r4_0.OnRecoverTeammate = {
  TargetType = "OnRecoverTeammate",
}
r4_0.OnTagChanged = {
  ArgName = {
    [1] = "Tags",
  },
  ArgType = {
    [1] = "List(String)",
  },
  TargetType = "OnTagChanged",
}
r4_0.OnTargetKilled = {
  ArgName = {
    [1] = "BuffType",
    [2] = "SkillType",
    [3] = "UnitId",
    [4] = "Tag",
    [5] = "Time",
    [6] = "DamageTag",
  },
  ArgType = {
    [1] = "List(Int)",
    [2] = "List(String)",
    [3] = "List(Int)",
    [4] = "List(String)",
    [5] = "float",
    [6] = "List(String)",
  },
  TargetType = "OnTargetKilled",
}
r4_0.PlayerMove = {
  TargetType = "PlayerMove",
}
r4_0.PlayerUseNormalSkill = {
  TargetType = "PlayerUseNormalSkill",
}
r4_0.PlayerUseSupportSkill = {
  TargetType = "PlayerUseSupportSkill",
}
r4_0.PlayerUseUltraSkill = {
  TargetType = "PlayerUseUltraSkill",
}
return r1_0("BattleAchiTargetArgs", r4_0)
