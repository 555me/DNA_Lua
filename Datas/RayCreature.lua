-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\RayCreature.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    110355
  },
  RT_2 = {
    0,
    0,
    1
  },
  RT_3 = {
    110356
  },
  RT_4 = {
    SpawnSocket = "Player_Part_Mouth",
    UseLocation = "Char",
  },
  RT_5 = {
    "Bullet"
  },
  RT_6 = {
    1,
    0,
    1
  },
  RT_7 = {
    SpawnSocket = "gunpoint_01",
    UseLocation = "Weapon",
  },
  RT_8 = {
    2050631
  },
  RT_9 = {
    2050632
  },
  RT_10 = {
    4200105
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [39, 39] id: 1
  return r1_1
end
local r3_0 = "RayCreature"
local r4_0 = {
  [110301] = {
    AimUpdateEndLoc = true,
    AllowSkillRangeModify = true,
    CreatureId = 110301,
    DamageSource = 1,
    EffectMultiple = false,
    HitEnemy = r0_0.RT_1,
    HitOthers = r0_0.RT_2,
    HitScene = r0_0.RT_3,
    LifeTime = 0.5,
    Radius = 50,
    RayFXID = 110301,
    RayLength = 2000,
    SpawnSocket = r0_0.RT_4,
    Tags = r0_0.RT_5,
  },
  [110311] = {
    AimUpdateEndLoc = true,
    AllowSkillRangeModify = true,
    CreatureId = 110311,
    DamageSource = 1,
    EffectMultiple = false,
    HitEnemy = r0_0.RT_1,
    HitOthers = r0_0.RT_2,
    HitScene = r0_0.RT_3,
    LifeTime = 0.5,
    Radius = 50,
    RayFXID = 110312,
    RayLength = 2000,
    SpawnSocket = r0_0.RT_4,
    Tags = r0_0.RT_5,
  },
}
r4_0[110312] = {
  AllowSkillRangeModify = true,
  CreatureId = 110312,
  DamageSource = 1,
  EffectMultiple = false,
  HitEnemy = {
    110357
  },
  HitOthers = {
    1,
    0,
    0
  },
  LifeTime = 0.5,
  Radius = 50,
  RayLength = 2000,
  SpawnSocket = r0_0.RT_4,
  Tags = r0_0.RT_5,
}
r4_0[2050211] = {
  AllowAttackRangeModify = true,
  AttackRangeType = "RayLength",
  CreatureId = 2050211,
  EffectMultiple = true,
  FixDistanceByWeapon = true,
  HitEnemy = {
    2050213,
    2050218
  },
  HitOthers = r0_0.RT_6,
  HitScene = {
    2050217
  },
  RayLength = 2900,
  SkillEffectsDelayTime = 0.1,
  SpawnSocket = r0_0.RT_7,
  Tags = r0_0.RT_5,
}
r4_0[2050311] = {
  AllowAttackRangeModify = true,
  AttackRangeType = "RayLength",
  CreatureId = 2050311,
  EffectMultiple = true,
  FixDistanceByWeapon = true,
  HitEnemy = {
    2050314
  },
  HitOthers = r0_0.RT_2,
  Radius = 10,
  RayLength = 2000,
  SpawnSocket = r0_0.RT_7,
  Tags = r0_0.RT_5,
}
r4_0[2050411] = {
  AimUpdateEndLoc = true,
  AllowAttackRangeModify = true,
  AttackRangeType = "RayLength",
  CreatureId = 2050411,
  EffectMultiple = true,
  FixDistanceByWeapon = true,
  HitEnemy = {
    2050431
  },
  HitOthers = r0_0.RT_6,
  HitScene = {
    2050434
  },
  LifeTime = 1,
  RayFXID = 2050401,
  RayLength = 2000,
  SpawnSocket = r0_0.RT_7,
  Tags = r0_0.RT_5,
}
r4_0[2050412] = {
  AimUpdateEndLoc = true,
  AllowAttackRangeModify = true,
  AttackRangeType = "RayLength",
  CreatureId = 2050412,
  EffectMultiple = true,
  FixDistanceByWeapon = true,
  HitEnemy = {
    2050432
  },
  HitOthers = r0_0.RT_6,
  HitScene = {
    2050435
  },
  LifeTime = 1,
  RayFXID = 2050402,
  RayLength = 2000,
  SpawnSocket = r0_0.RT_7,
  Tags = r0_0.RT_5,
}
r4_0[2050413] = {
  AimUpdateEndLoc = true,
  AllowAttackRangeModify = true,
  AttackRangeType = "RayLength",
  CreatureId = 2050413,
  EffectMultiple = true,
  FixDistanceByWeapon = true,
  HitEnemy = {
    2050433
  },
  HitOthers = r0_0.RT_6,
  HitScene = {
    2050436
  },
  LifeTime = 1,
  RayFXID = 2050403,
  RayLength = 2000,
  SpawnSocket = r0_0.RT_7,
  Tags = r0_0.RT_5,
}
r4_0[2050511] = {
  AllowAttackRangeModify = true,
  AttackRangeType = "RayLength",
  CreatureId = 2050511,
  EffectMultiple = true,
  FixDistanceByWeapon = true,
  HitEnemy = {
    2050514
  },
  HitOthers = r0_0.RT_6,
  HitScene = {
    2050518
  },
  SkillEffectsDelayTime = 0.1,
  SpawnSocket = r0_0.RT_7,
  Tags = r0_0.RT_5,
}
r4_0[2050611] = {
  AimUpdateEndLoc = true,
  AllowAttackRangeModify = true,
  AttackRangeType = "RayLength",
  CreatureId = 2050611,
  EffectMultiple = true,
  FixDistanceByWeapon = true,
  HitEnemy = r0_0.RT_8,
  HitOthers = r0_0.RT_2,
  HitScene = r0_0.RT_9,
  LifeTime = 1,
  RayFXID = 2050602,
  RayLength = 2000,
  SpawnSocket = r0_0.RT_7,
  Tags = r0_0.RT_5,
}
r4_0[2050612] = {
  AimUpdateEndLoc = true,
  AllowAttackRangeModify = true,
  AttackRangeType = "RayLength",
  CreatureId = 2050612,
  EffectMultiple = true,
  FixDistanceByWeapon = true,
  HitEnemy = r0_0.RT_8,
  HitOthers = r0_0.RT_2,
  HitScene = r0_0.RT_9,
  LifeTime = 1,
  RayFXID = 2050602,
  RayLength = 2000,
  SpawnSocket = r0_0.RT_7,
  Tags = r0_0.RT_5,
}
r4_0[2050613] = {
  AimUpdateEndLoc = true,
  AllowAttackRangeModify = true,
  AttackRangeType = "RayLength",
  CreatureId = 2050613,
  EffectMultiple = true,
  FixDistanceByWeapon = true,
  HitEnemy = r0_0.RT_8,
  HitOthers = r0_0.RT_2,
  HitScene = r0_0.RT_9,
  LifeTime = 1,
  RayFXID = 2050603,
  RayLength = 2000,
  SpawnSocket = r0_0.RT_7,
  Tags = r0_0.RT_5,
}
r4_0[2050614] = {
  AimUpdateEndLoc = true,
  AllowAttackRangeModify = true,
  AttackRangeType = "RayLength",
  CreatureId = 2050614,
  EffectMultiple = true,
  FixDistanceByWeapon = true,
  HitEnemy = r0_0.RT_8,
  HitOthers = r0_0.RT_2,
  HitScene = r0_0.RT_9,
  LifeTime = 1,
  RayFXID = 2050603,
  RayLength = 2000,
  SpawnSocket = r0_0.RT_7,
  Tags = r0_0.RT_5,
}
r4_0[4010104] = {
  AimUpdateEndLoc = true,
  AllowSkillRangeModify = true,
  AttackRangeType = "RayLength",
  CreatureId = 4010104,
  DamageSource = 1,
  EffectMultiple = false,
  HitEnemy = r0_0.RT_1,
  HitOthers = r0_0.RT_2,
  HitScene = r0_0.RT_3,
  LifeTime = 0.5,
  Radius = 50,
  RayFXID = 110301,
  RayLength = 2000,
  Tags = r0_0.RT_5,
}
r4_0[4200101] = {
  AttackRangeType = "RayLength",
  CreatureId = 4200101,
  EffectMultiple = false,
  HitOthers = r0_0.RT_6,
  RayLength = 2900,
  SpawnSocket = r0_0.RT_7,
  Tags = r0_0.RT_5,
}
r4_0[4200102] = {
  AttackRangeType = "RayLength",
  CreatureId = 4200102,
  EffectMultiple = false,
  HitEnemy = r0_0.RT_10,
  HitOthers = r0_0.RT_6,
  HitScene = r0_0.RT_10,
  RayLength = 2900,
  SpawnSocket = r0_0.RT_7,
  Tags = r0_0.RT_5,
}
r4_0[4200201] = {
  AttackRangeType = "RayLength",
  CreatureId = 4200201,
  EffectMultiple = false,
  HitEnemy = {
    4200202
  },
  HitOthers = r0_0.RT_6,
  Radius = 25,
  RayLength = 2000,
  SpawnSocket = {
    EffectCreatureId = 42002,
    SpawnSocket = "Root",
    UseLocation = "EffectCreature",
  },
  Tags = r0_0.RT_5,
}
return r2_0(r3_0, r4_0)
