-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\HitMontageData.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    "HitFlyDie"
  },
  RT_2 = {
    "Die"
  },
  RT_3 = {
    "DisarmHit"
  },
  RT_4 = {
    "HeavyHit"
  },
  RT_5 = {
    "HitFly"
  },
  RT_6 = {
    "LightHit1",
    "LightHit2"
  },
  RT_7 = {
    "LightHitRanged"
  },
  RT_8 = {
    "HitLight"
  },
  RT_9 = {
    "HeavyHit1",
    "HeavyHit2"
  },
  RT_10 = {
    "LightHit1"
  },
  RT_11 = {
    KillSelf = 0,
  },
  RT_12 = {
    "HeavyHit4"
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [41, 41] id: 1
  return r1_1
end
local r3_0 = "HitMontageData"
local r4_0 = {
  AnimalCommon = {
    DeadDissolveTime = 2,
    DeadHitFlyMontage = r0_0.RT_1,
    DeadMontage = r0_0.RT_2,
    DisarmHitMontage = r0_0.RT_3,
    HeavyHitMontage = r0_0.RT_4,
    HitAddtiveDuration = 0.46,
    HitFlyMontage = r0_0.RT_5,
    HitMontageId = "AnimalCommon",
    LightHitMontage = r0_0.RT_6,
    LightHitRangedMontage = r0_0.RT_7,
  },
}
r4_0.AnimalFly = {
  ConditionHitMontage = {
    [980501] = "DieFly",
  },
  DeadDissolveTime = 1,
  DeadMontage = r0_0.RT_2,
  HitAddtiveDuration = 0.3,
  HitMontageId = "AnimalFly",
  LightHitMontage = r0_0.RT_8,
}
r4_0.BossDefault = {
  DeadDissolveTime = 1,
  DeadMontage = r0_0.RT_2,
  HitAddtiveDuration = 0.3,
  HitMontageId = "BossDefault",
  LightHitMontage = r0_0.RT_8,
}
r4_0.BossFuer = {
  DeadDissolveTime = 1,
  DeadMontage = r0_0.RT_2,
  HitAddtiveDuration = 0.49,
  HitMontageId = "BossFuer",
  LightHitMontage = r0_0.RT_8,
}
r4_0.BossJishi = {
  DeadDissolveTime = 1,
  DeadMontage = r0_0.RT_2,
  HitAddtiveDuration = 0.3,
  HitMontageId = "BossJishi",
  LightHitMontage = r0_0.RT_8,
}
r4_0.BossJuque = {
  ConditionHitMontage = {
    [851801] = "LightHit2",
    [851802] = "LightHit1",
  },
  DeadDissolveTime = 1,
  DeadMontage = r0_0.RT_2,
  HitAddtiveDirection = 1,
  HitAddtiveDuration = 0.3,
  HitMontageId = "BossJuque",
  LightHitMontage = r0_0.RT_6,
}
r4_0.BossJushi = {
  DeadDissolveTime = 1,
  DeadMontage = r0_0.RT_2,
  HitAddtiveDuration = 0.3,
  HitMontageId = "BossJushi",
  LightHitMontage = r0_0.RT_8,
}
r4_0.BossKuxiu = {
  DeadDissolveTime = 1,
  DeadMontage = r0_0.RT_2,
  HitAddtiveDuration = 0.3,
  HitMontageId = "BossKuxiu",
  LightHitMontage = r0_0.RT_8,
}
r4_0.BossLianhuo = {
  DeadDissolveTime = 1,
  DeadMontage = r0_0.RT_2,
  HitAddtiveDirection = 1,
  HitAddtiveDuration = 0.3,
  HitMontageId = "BossLianhuo",
  LightHitMontage = {
    "LightHit"
  },
}
r4_0.BossLinen = {
  DeadDissolveTime = 1,
  DeadMontage = r0_0.RT_2,
  HitAddtiveDirection = 1,
  HitAddtiveDuration = 0.3,
  HitMontageId = "BossLinen",
  LightHitMontage = r0_0.RT_6,
}
r4_0.BossLizhan = {
  DeadDissolveTime = 1,
  DeadMontage = r0_0.RT_2,
  HitAddtiveDuration = 0.3,
  HitMontageId = "BossLizhan",
  LightHitMontage = r0_0.RT_8,
}
r4_0.BossNvzhu = {
  DeadDissolveTime = 1,
  DeadMontage = r0_0.RT_2,
  HitAddtiveDuration = 0.3,
  HitMontageId = "BossNvzhu",
  LightHitMontage = r0_0.RT_6,
}
r4_0.BossSaiqi = {
  ConditionHitMontage = {
    [850205] = "LightHit2",
    [850206] = "LightHit2",
    [850207] = "LightHit1",
    [850208] = "LightHit1",
    [850213] = "LightHit1",
  },
  DeadDissolveTime = 1,
  DeadMontage = r0_0.RT_2,
  HitAddtiveDirection = 1,
  HitAddtiveDuration = 0.3,
  HitMontageId = "BossSaiqi",
  LightHitMontage = {
    "LightHit3",
    "LightHit4"
  },
}
r4_0.BossShenpan = {
  DeadDissolveTime = 1,
  DeadMontage = r0_0.RT_2,
  HitAddtiveDuration = 0.3,
  HitMontageId = "BossShenpan",
  LightHitMontage = r0_0.RT_8,
}
r4_0.BossShijingzhe = {
  ConditionHitMontage = {
    [850301] = "LightHit1",
    [850302] = "LightHit2",
    [850303] = "LightHit3",
    [850304] = "LightHit4",
  },
  DeadDissolveTime = 1,
  DeadMontage = r0_0.RT_2,
  HitAddtiveCoolDown = 0.5,
  HitAddtiveDuration = 0.3,
  HitMontageId = "BossShijingzhe",
  LightHitMontage = {
    "LightHit5",
    "LightHit6"
  },
  NotRotateWhenHit = true,
}
r4_0.BossTuosi = {
  DeadDissolveTime = 1,
  DeadMontage = r0_0.RT_2,
  HitAddtiveDuration = 0.3,
  HitMontageId = "BossTuosi",
  LightHitMontage = r0_0.RT_8,
}
r4_0.BossXibi = {
  HitAddtiveDuration = 0.3,
  HitMontageId = "BossXibi",
  LightHitMontage = r0_0.RT_8,
}
r4_0.BossXibiHard = {
  DeadDissolveTime = 1,
  DeadMontage = r0_0.RT_2,
  HitAddtiveDuration = 0.3,
  HitMontageId = "BossXibiHard",
  LightHitMontage = r0_0.RT_8,
}
r4_0.GRPiaofu = {
  DeadDissolveTime = 2,
  DeadHitFlyMontage = r0_0.RT_1,
  DeadMontage = r0_0.RT_2,
  DisarmHitMontage = r0_0.RT_3,
  EnableRagdollHitFly = true,
  HeavyHitMontage = r0_0.RT_4,
  HitAddtiveDuration = 0.46,
  HitFlyMontage = r0_0.RT_5,
  HitMontageId = "GRPiaofu",
  LightHitMontage = r0_0.RT_6,
  LightHitRangedMontage = r0_0.RT_7,
  RagdollHitFlyBeginTime = 0.25,
  RagdollHitFlyBoneName = "pelvis",
}
r4_0.MonDefault = {
  DeadDissolveTime = 2,
  DeadHitFlyMontage = r0_0.RT_1,
  DeadMontage = r0_0.RT_2,
  DisarmHitMontage = r0_0.RT_3,
  EnableRagdollHitFly = true,
  HeavyHitMontage = r0_0.RT_4,
  HitAddtiveDuration = 0.46,
  HitFlyMontage = r0_0.RT_5,
  HitMontageId = "MonDefault",
  LightHitMontage = r0_0.RT_6,
  LightHitRangedMontage = r0_0.RT_7,
  RagdollHitFlyBeginTime = 0.25,
  RagdollHitFlyBoneName = "pelvis",
  RagdollHitFlyGetUpTime = 0.5,
}
r4_0.MonGRLongcao = {
  ConditionHitMontage = {
    [600501] = "LightHit3",
  },
  DeadDissolveTime = 2,
  DeadHitFlyMontage = r0_0.RT_1,
  DeadMontage = r0_0.RT_2,
  EnableRagdollHitFly = true,
  HeavyHitMontage = r0_0.RT_4,
  HitAddtiveDuration = 0.46,
  HitFlyMontage = r0_0.RT_5,
  HitMontageId = "MonGRLongcao",
  LightHitMontage = r0_0.RT_6,
  LightHitRangedMontage = r0_0.RT_7,
  RagdollHitFlyBeginTime = 0.25,
  RagdollHitFlyBoneName = "pelvis",
  RagdollHitFlyGetUpTime = 0.5,
}
r4_0.MonHongjiaolu = {
  DeadDissolveTime = 2,
  DeadHitFlyMontage = r0_0.RT_1,
  DeadMontage = r0_0.RT_2,
  DisarmHitMontage = r0_0.RT_3,
  HeavyHitMontage = r0_0.RT_9,
  HitAddtiveDuration = 0.46,
  HitFlyMontage = r0_0.RT_9,
  HitMontageId = "MonHongjiaolu",
  LightHitMontage = r0_0.RT_6,
  LightHitRangedMontage = r0_0.RT_7,
}
r4_0.MonJTBlastRobot = {
  DeadDissolveTime = 2,
  DeadMontage = r0_0.RT_2,
  HitAddtiveDuration = 0.46,
  HitMontageId = "MonJTBlastRobot",
  LightHitMontage = r0_0.RT_10,
  SPDeadDissolveTime = r0_0.RT_11,
}
r4_0.MonJTHealRobot = {
  DeadDissolveTime = 1,
  DeadMontage = r0_0.RT_2,
  HitAddtiveDuration = 0.46,
  HitMontageId = "MonJTHealRobot",
  LightHitMontage = r0_0.RT_6,
}
r4_0.MonNEDajie = {
  DeadDissolveTime = 2,
  DeadMontage = r0_0.RT_2,
  HeavyHitMontage = {
    "HeavyHit1",
    "HeavyHit2",
    "HeavyHit3"
  },
  HitAddtiveDuration = 0.46,
  HitMontageId = "MonNEDajie",
  LightHitMontage = r0_0.RT_6,
}
r4_0.MonNEDajieTem102 = {
  DeadDissolveTime = 2,
  DeadMontage = r0_0.RT_2,
  HeavyHitMontage = r0_0.RT_12,
  HitAddtiveDuration = 0.46,
  HitMontageId = "MonNEDajieTem102",
  LightHitMontage = r0_0.RT_12,
}
r4_0.MonNEHaer = {
  DeadDissolveTime = 2,
  DeadHitFlyMontage = r0_0.RT_1,
  DeadMontage = {
    "HaerDie"
  },
  DisarmHitMontage = r0_0.RT_3,
  EnableRagdollHitFly = true,
  HeavyHitMontage = r0_0.RT_4,
  HitAddtiveDuration = 0.46,
  HitFlyMontage = r0_0.RT_5,
  HitMontageId = "MonNEHaer",
  LightHitMontage = r0_0.RT_6,
  LightHitRangedMontage = r0_0.RT_7,
  RagdollHitFlyBeginTime = 0.25,
  RagdollHitFlyBoneName = "pelvis",
  RagdollHitFlyGetUpTime = 0.5,
}
r4_0.MonNoRagdoll = {
  DeadDissolveTime = 2,
  DeadMontage = r0_0.RT_2,
  HeavyHitMontage = r0_0.RT_4,
  HitAddtiveDuration = 0.46,
  HitMontageId = "MonNoRagdoll",
  LightHitMontage = r0_0.RT_6,
  LightHitRangedMontage = r0_0.RT_7,
}
r4_0.MonSQBaozha = {
  DeadDissolveTime = 2,
  DeadHitFlyMontage = r0_0.RT_1,
  DeadMontage = r0_0.RT_2,
  DisarmHitMontage = r0_0.RT_3,
  EnableRagdollHitFly = true,
  HeavyHitMontage = r0_0.RT_4,
  HitAddtiveDuration = 0.46,
  HitFlyMontage = r0_0.RT_5,
  HitMontageId = "MonSQBaozha",
  LightHitMontage = r0_0.RT_6,
  LightHitRangedMontage = r0_0.RT_7,
  RagdollHitFlyBeginTime = 0.25,
  RagdollHitFlyBoneName = "pelvis",
  RagdollHitFlyGetUpTime = 0.5,
  SPDeadDissolveTime = r0_0.RT_11,
}
r4_0.MonVehicle = {
  DeadDissolveTime = 2,
  DeadMontage = {
    "DieVeh"
  },
  HitAddtiveDuration = 0.46,
  HitMontageId = "MonVehicle",
}
r4_0.MonXuelang = {
  DeadDissolveTime = 2,
  DeadMontage = r0_0.RT_2,
  DisarmHitMontage = r0_0.RT_3,
  HeavyHitMontage = r0_0.RT_4,
  HitAddtiveDuration = 0.46,
  HitMontageId = "MonXuelang",
  LightHitMontage = r0_0.RT_6,
  LightHitRangedMontage = r0_0.RT_7,
  RagdollHitFlyBoneName = "pelvis",
}
r4_0.NEWuyou = {
  HitAddtiveDuration = 0.3,
  HitMontageId = "NEWuyou",
  LightHitMontage = r0_0.RT_10,
}
r4_0.NoHitOrDie = {
  HitMontageId = "NoHitOrDie",
  NoHit = true,
}
r4_0.OnlyDieNoDissolve = {
  DeadMontage = r0_0.RT_2,
  HitMontageId = "OnlyDieNoDissolve",
}
r4_0.OnlyDieWithDissolve = {
  DeadDissolveTime = 1.25,
  DeadMontage = r0_0.RT_2,
  HitMontageId = "OnlyDieWithDissolve",
}
r4_0.RoleDefault = {
  DeadMontage = r0_0.RT_2,
  HitFlyMontage = r0_0.RT_5,
  HitMontageId = "RoleDefault",
  LightHitMontage = r0_0.RT_6,
}
r4_0.TestSimpleMon = {
  DeadDissolveTime = 2,
  DeadMontage = r0_0.RT_2,
  EnableRagdollHitFly = true,
  HitFlyMontage = r0_0.RT_5,
  HitMontageId = "TestSimpleMon",
  LightHitMontage = r0_0.RT_10,
  RagdollHitFlyBeginTime = 0.25,
  RagdollHitFlyBoneName = "pelvis",
  RagdollHitFlyGetUpTime = 0.5,
}
return r2_0(r3_0, r4_0)
