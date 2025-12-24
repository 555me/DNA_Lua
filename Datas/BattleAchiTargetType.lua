-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\BattleAchiTargetType.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    "Default"
  },
}
r0_0.RT_2 = {
  DamageType = r0_0.RT_1,
}
r0_0.RT_3 = {
  "Melee"
}
r0_0.RT_4 = {
  DamageTag = r0_0.RT_3,
}
r0_0.RT_5 = {
  "Ranged"
}
r0_0.RT_6 = {
  DamageTag = r0_0.RT_5,
}
r0_0.RT_7 = {
  LimitTime = 3,
}
r0_0.RT_8 = {
  AllPhantom = 1,
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [27, 27] id: 1
  return r1_1
end
local r3_0 = "BattleAchiTargetType"
local r4_0 = {
  [1] = {
    Id = 1,
    TargetType = "BluePrintTrigger",
  },
  [1001] = {
    Args = r0_0.RT_2,
    Id = 1001,
    TargetType = "Heal",
  },
}
local r5_0 = 1010
local r6_0 = {}
r6_0.Args = {
  DamageType = {
    "Light"
  },
}
r6_0.Id = 1010
r6_0.TargetType = "Damage"
r4_0[r5_0] = r6_0
r5_0 = 1011
r6_0 = {}
r6_0.Args = {
  DamageType = {
    "Dark"
  },
}
r6_0.Id = 1011
r6_0.TargetType = "Damage"
r4_0[r5_0] = r6_0
r5_0 = 1012
r6_0 = {}
r6_0.Args = {
  DamageType = {
    "Water"
  },
}
r6_0.Id = 1012
r6_0.TargetType = "Damage"
r4_0[r5_0] = r6_0
r5_0 = 1013
r6_0 = {}
r6_0.Args = {
  DamageType = {
    "Fire"
  },
}
r6_0.Id = 1013
r6_0.TargetType = "Damage"
r4_0[r5_0] = r6_0
r5_0 = 1014
r6_0 = {}
r6_0.Args = {
  DamageType = {
    "Thunder"
  },
}
r6_0.Id = 1014
r6_0.TargetType = "Damage"
r4_0[r5_0] = r6_0
r5_0 = 1015
r6_0 = {}
r6_0.Args = {
  DamageType = {
    "Wind"
  },
}
r6_0.Id = 1015
r6_0.TargetType = "Damage"
r4_0[r5_0] = r6_0
r5_0 = 1016
r6_0 = {}
r6_0.Args = {
  DamageType = {
    "Slash"
  },
}
r6_0.Id = 1016
r6_0.TargetType = "Damage"
r4_0[r5_0] = r6_0
r5_0 = 1017
r6_0 = {}
r6_0.Args = {
  DamageType = {
    "Spike"
  },
}
r6_0.Id = 1017
r6_0.TargetType = "Damage"
r4_0[r5_0] = r6_0
r5_0 = 1018
r6_0 = {}
r6_0.Args = {
  DamageType = {
    "Smash"
  },
}
r6_0.Id = 1018
r6_0.TargetType = "Damage"
r4_0[r5_0] = r6_0
r4_0[1021] = {
  Args = r0_0.RT_2,
  Id = 1021,
  TargetType = "Heal",
}
r5_0 = 1022
r6_0 = {}
r6_0.Args = {
  DamageTag = {
    "Weapon"
  },
}
r6_0.Id = 1022
r6_0.TargetType = "Damage"
r4_0[r5_0] = r6_0
r5_0 = 1023
r6_0 = {}
r6_0.Args = {
  DamageTag = {
    "Skill"
  },
}
r6_0.Id = 1023
r6_0.TargetType = "Damage"
r4_0[r5_0] = r6_0
r4_0[1024] = {
  Args = r0_0.RT_4,
  Id = 1024,
  TargetType = "Damage",
}
r4_0[1025] = {
  Args = r0_0.RT_6,
  Id = 1025,
  TargetType = "Damage",
}
r5_0 = 1026
r6_0 = {}
r6_0.Args = {
  DamageTag = {
    "RouB105"
  },
}
r6_0.Id = 1026
r6_0.TargetType = "Damage"
r4_0[r5_0] = r6_0
r5_0 = 1027
r6_0 = {}
r6_0.Args = {
  DamageTag = {
    "RouB106"
  },
}
r6_0.Id = 1027
r6_0.TargetType = "Damage"
r4_0[r5_0] = r6_0
r5_0 = 1028
r6_0 = {}
r6_0.Args = {
  DamageTag = {
    "RouB104"
  },
}
r6_0.Id = 1028
r6_0.TargetType = "Damage"
r4_0[r5_0] = r6_0
r4_0[2000] = {
  Id = 2000,
  TargetType = "OnTargetKilled",
}
r5_0 = 2001
r6_0 = {}
r6_0.Args = {
  Tag = {
    "Mon.Gr"
  },
}
r6_0.Id = 2001
r6_0.TargetType = "OnTargetKilled"
r4_0[r5_0] = r6_0
r5_0 = 2002
r6_0 = {}
r6_0.Args = {
  Tag = {
    "Mon.Jt"
  },
}
r6_0.Id = 2002
r6_0.TargetType = "OnTargetKilled"
r4_0[r5_0] = r6_0
r5_0 = 2003
r6_0 = {}
r6_0.Args = {
  Tag = {
    "Mon.Jh"
  },
}
r6_0.Id = 2003
r6_0.TargetType = "OnTargetKilled"
r4_0[r5_0] = r6_0
r5_0 = 2004
r6_0 = {}
r6_0.Args = {
  Tag = {
    "Mon.Strong"
  },
}
r6_0.Id = 2004
r6_0.TargetType = "OnTargetKilled"
r4_0[r5_0] = r6_0
r5_0 = 2005
r6_0 = {}
r6_0.Args = {
  Tag = {
    "Mon.Sq"
  },
}
r6_0.Id = 2005
r6_0.TargetType = "OnTargetKilled"
r4_0[r5_0] = r6_0
r5_0 = 2006
r6_0 = {}
r6_0.Args = {
  Tag = {
    "Mon.Strong.Double"
  },
}
r6_0.Id = 2006
r6_0.TargetType = "OnTargetKilled"
r4_0[r5_0] = r6_0
r5_0 = 2007
r6_0 = {}
r6_0.Args = {
  Tag = {
    "Mon.Strong.Triple"
  },
}
r6_0.Id = 2007
r6_0.TargetType = "OnTargetKilled"
r4_0[r5_0] = r6_0
r5_0 = 2008
r6_0 = {}
r6_0.Args = {
  Tag = {
    "Mon.Treasure"
  },
}
r6_0.Id = 2008
r6_0.TargetType = "OnTargetKilled"
r4_0[r5_0] = r6_0
r4_0[2011] = {
  Args = r0_0.RT_4,
  Id = 2011,
  TargetType = "OnTargetKilled",
}
r4_0[2012] = {
  Args = r0_0.RT_6,
  Id = 2012,
  TargetType = "OnTargetKilled",
}
r5_0 = 2013
r6_0 = {}
r6_0.Args = {
  DamageTag = {
    "FallAttack"
  },
}
r6_0.Id = 2013
r6_0.TargetType = "OnTargetKilled"
r4_0[r5_0] = r6_0
r5_0 = 2014
r6_0 = {}
r6_0.Args = {
  DamageTag = {
    "HeavyAttack"
  },
}
r6_0.Id = 2014
r6_0.TargetType = "OnTargetKilled"
r4_0[r5_0] = r6_0
r5_0 = 2015
r6_0 = {}
r6_0.Args = {
  DamageTag = {
    "SlideAttack"
  },
}
r6_0.Id = 2015
r6_0.TargetType = "OnTargetKilled"
r4_0[r5_0] = r6_0
r5_0 = 2016
r6_0 = {}
r6_0.Args = {
  DamageTag = {
    "Ray"
  },
}
r6_0.Id = 2016
r6_0.TargetType = "OnTargetKilled"
r4_0[r5_0] = r6_0
r5_0 = 2017
r6_0 = {}
r6_0.Args = {
  DamageTag = {
    "Explode"
  },
}
r6_0.Id = 2017
r6_0.TargetType = "OnTargetKilled"
r4_0[r5_0] = r6_0
r4_0[2021] = {
  Args = r0_0.RT_7,
  Id = 2021,
  TargetType = "LimitTimeKillMonster",
}
r4_0[2022] = {
  Args = r0_0.RT_7,
  Id = 2022,
  TargetType = "LimitTimeUseNormalSkill",
}
r4_0[2023] = {
  Args = {
    LimitTime = 6,
  },
  Id = 2023,
  TargetType = "LimitTimeUseUltraSkill",
}
r5_0 = 2024
r6_0 = {}
r6_0.Args = {
  BuffType = {
    101,
    102,
    103,
    104,
    105,
    106
  },
  LimitTime = 3,
}
r6_0.Id = 2024
r6_0.TargetType = "LimitTimeAddBuff"
r4_0[r5_0] = r6_0
r4_0[2031] = {
  Id = 2031,
  TargetType = "PlayerUseNormalSkill",
}
r4_0[2032] = {
  Id = 2032,
  TargetType = "PlayerUseUltraSkill",
}
r4_0[2033] = {
  Id = 2033,
  TargetType = "PlayerUseSupportSkill",
}
r4_0[2041] = {
  Id = 2041,
  TargetType = "BluePrintTrigger",
}
r4_0[2042] = {
  Id = 2042,
  TargetType = "BluePrintTrigger",
}
r4_0[2043] = {
  Id = 2043,
  TargetType = "BluePrintTrigger",
}
r4_0[2044] = {
  Id = 2044,
  TargetType = "BluePrintTrigger",
}
r4_0[2045] = {
  Id = 2045,
  TargetType = "BluePrintTrigger",
}
r4_0[2046] = {
  Id = 2046,
  TargetType = "BluePrintTrigger",
}
r4_0[2047] = {
  Id = 2047,
  TargetType = "BluePrintTrigger",
}
r5_0 = 2051
r6_0 = {}
r6_0.Args = {
  UnitId = {
    70010051
  },
}
r6_0.Id = 2051
r6_0.TargetType = "OnTargetKilled"
r4_0[r5_0] = r6_0
r4_0[2052] = {
  Id = 2052,
  TargetType = "BluePrintTrigger",
}
r5_0 = 2053
r6_0 = {}
r6_0.Args = {
  BuffType = {
    203
  },
  CampFilter = "Monster",
}
r6_0.Id = 2053
r6_0.TargetType = "OnMonsterAddedBuff"
r4_0[r5_0] = r6_0
r4_0[2101] = {
  Id = 2101,
  TargetType = "BluePrintTrigger",
}
r4_0[2102] = {
  Id = 2102,
  TargetType = "BluePrintTrigger",
}
r4_0[2103] = {
  Id = 2103,
  TargetType = "BluePrintTrigger",
}
r4_0[2104] = {
  Id = 2104,
  TargetType = "BluePrintTrigger",
}
r4_0[2105] = {
  Id = 2105,
  TargetType = "BluePrintTrigger",
}
r4_0[2106] = {
  Id = 2106,
  TargetType = "BluePrintTrigger",
}
r4_0[2107] = {
  Id = 2107,
  TargetType = "BluePrintTrigger",
}
r5_0 = 2201
r6_0 = {}
r6_0.Args = {
  UnitId = {
    10003001,
    10003061,
    10003062
  },
}
r6_0.Id = 2201
r6_0.TargetType = "OnTargetKilled"
r4_0[r5_0] = r6_0
r5_0 = 2202
r6_0 = {}
r6_0.Args = {
  UnitId = {
    10005001,
    10005011,
    10005012,
    10005014,
    10005016,
    10005017,
    10005018,
    10005019,
    10005020,
    10005021,
    10005023,
    10005024,
    10005061,
    10005062
  },
}
r6_0.Id = 2202
r6_0.TargetType = "OnTargetKilled"
r4_0[r5_0] = r6_0
r5_0 = 2203
r6_0 = {}
r6_0.Args = {
  UnitId = {
    8510001
  },
}
r6_0.Id = 2203
r6_0.TargetType = "OnTargetKilled"
r4_0[r5_0] = r6_0
r5_0 = 2204
r6_0 = {}
r6_0.Args = {
  UnitId = {
    8518001
  },
}
r6_0.Id = 2204
r6_0.TargetType = "OnTargetKilled"
r4_0[r5_0] = r6_0
r5_0 = 2205
r6_0 = {}
r6_0.Args = {
  UnitId = {
    8517001
  },
}
r6_0.Id = 2205
r6_0.TargetType = "OnTargetKilled"
r4_0[r5_0] = r6_0
r5_0 = 3001
r6_0 = {}
r6_0.Args = {
  ExceptSkillType = {
    "Condemn"
  },
}
r6_0.Id = 3001
r6_0.TargetType = "DamageOnDefeated"
r4_0[r5_0] = r6_0
r4_0[3011] = {
  Id = 3011,
  TargetType = "AddOverEnergyShield",
}
r4_0[3012] = {
  Id = 3012,
  TargetType = "OnRecoverTeammate",
}
r4_0[3021] = {
  CombatConditionId = 34,
  Id = 3021,
  TargetType = "PlayerMove",
}
r5_0 = 3031
r6_0 = {}
r6_0.Args = {
  BuffType = {
    102
  },
  CampFilter = "Enemy",
}
r6_0.Id = 3031
r6_0.TargetType = "OnBuffRemovedFromTarget"
r4_0[r5_0] = r6_0
r5_0 = 3032
r6_0 = {}
r6_0.Args = {
  BuffType = {
    103
  },
  CampFilter = "Enemy",
}
r6_0.Id = 3032
r6_0.TargetType = "OnBuffRemovedFromTarget"
r4_0[r5_0] = r6_0
r5_0 = 3033
r6_0 = {}
r6_0.Args = {
  BuffType = {
    104
  },
  CampFilter = "Enemy",
}
r6_0.Id = 3033
r6_0.TargetType = "OnBuffRemovedFromTarget"
r4_0[r5_0] = r6_0
r5_0 = 3034
r6_0 = {}
r6_0.Args = {
  BuffType = {
    105
  },
  CampFilter = "Enemy",
}
r6_0.Id = 3034
r6_0.TargetType = "OnBuffRemovedFromTarget"
r4_0[r5_0] = r6_0
r5_0 = 3035
r6_0 = {}
r6_0.Args = {
  BuffType = {
    101
  },
  CampFilter = "Enemy",
}
r6_0.Id = 3035
r6_0.TargetType = "OnBuffRemovedFromTarget"
r4_0[r5_0] = r6_0
r5_0 = 3036
r6_0 = {}
r6_0.Args = {
  BuffType = {
    106
  },
  CampFilter = "Enemy",
}
r6_0.Id = 3036
r6_0.TargetType = "OnBuffRemovedFromTarget"
r4_0[r5_0] = r6_0
r4_0[3041] = {
  Id = 3041,
  TargetType = "OnAddPhantom",
}
r4_0[3042] = {
  Id = 3042,
  RoleIdConstraints = r0_0.RT_8,
  TargetType = "Damage",
}
r4_0[3043] = {
  Args = r0_0.RT_2,
  Id = 3043,
  RoleIdConstraints = r0_0.RT_8,
  TargetType = "Heal",
}
r4_0[3044] = {
  Id = 3044,
  RoleIdConstraints = r0_0.RT_8,
  TargetType = "Damaged",
}
r4_0[5001] = {
  Id = 5001,
  TargetType = "OnFinishHardBoss",
}
r4_0[5011] = {
  Id = 5011,
  TargetType = "OnDungeonEndWithoutPhantom",
}
r4_0[5021] = {
  Id = 5021,
  TargetType = "OnDungeonEndWithoutPhantom",
}
r4_0[5031] = {
  Id = 5031,
  TargetType = "OnTargetKilled",
  TopProgressLimit = true,
}
r4_0[5041] = {
  Id = 5041,
  TargetType = "ClearWithoutPhantomAndDamaged",
}
r4_0[5051] = {
  Id = 5051,
  TargetType = "BluePrintTrigger",
}
r4_0[5052] = {
  Id = 5052,
  TargetType = "BluePrintTrigger",
}
r4_0[5053] = {
  Id = 5053,
  TargetType = "BluePrintTrigger",
}
return r2_0(r3_0, r4_0)
