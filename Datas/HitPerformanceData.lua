-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\HitPerformanceData.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    HitFlyXY = 0,
    HitFlyZ = 1000,
  },
  RT_2 = {
    HitFlyXY = 1500,
    HitFlyZ = 1000,
    UseResourceDirection = "Y",
  },
  RT_3 = {
    MoveDis = 400,
  },
  RT_4 = {
    HitFlyXY = 500,
    HitFlyZ = 700,
  },
  RT_5 = {
    HitFlyXY = 0,
    HitFlyZ = 500,
  },
  RT_6 = {
    HitFlyXY = 800,
    HitFlyZ = 1000,
  },
  RT_7 = {
    MoveDis = 250,
  },
  RT_8 = {
    MoveDis = 150,
  },
  RT_9 = {
    HitFlyXY = 800,
    HitFlyZ = 800,
  },
  RT_10 = {
    MoveDis = 100,
  },
  RT_11 = {
    MoveDis = 120,
  },
  RT_12 = {
    MoveDis = 200,
  },
  RT_13 = {
    MoveDis = 50,
  },
  RT_14 = {
    MoveDis = 80,
  },
  RT_15 = {
    HitFlyXY = 0,
    HitFlyZ = 300,
  },
  RT_16 = {
    "Pelvis"
  },
  RT_17 = {
    HitFlyXY = 600,
    HitFlyZ = 500,
  },
  RT_18 = {
    MoveDis = 500,
  },
  RT_19 = {
    HitFlyXY = 1000,
    HitFlyZ = 400,
  },
  RT_20 = {
    HitFlyXY = 0,
    HitFlyZ = 800,
  },
  RT_21 = {
    HitFlyXY = 0,
    HitFlyZ = 3000,
  },
  RT_22 = {
    HitFlyXY = 200,
    HitFlyZ = 100,
  },
  RT_23 = {
    HitFlyXY = 200,
    HitFlyZ = 100,
    UseResourceDirection = "-X",
  },
  RT_24 = {
    HitFlyXY = 200,
    HitFlyZ = 300,
  },
  RT_25 = {
    HitFlyXY = 200,
    HitFlyZ = 200,
    UseResourceDirection = "X",
  },
  RT_26 = {
    HitFlyXY = 300,
    HitFlyZ = 800,
  },
  RT_27 = {
    HitFlyXY = 400,
    HitFlyZ = 200,
  },
  RT_28 = {
    HitFlyXY = 400,
    HitFlyZ = 300,
    UseResourceDirection = "X",
  },
  RT_29 = {
    HitFlyXY = 400,
    HitFlyZ = 200,
    UseResourceDirection = "X",
  },
  RT_30 = {
    HitFlyXY = 400,
    HitFlyZ = 400,
    UseResourceDirection = "X",
  },
  RT_31 = {
    HitFlyXY = 500,
    HitFlyZ = 300,
  },
  RT_32 = {
    MoveDis = 300,
  },
  RT_33 = {
    HitFlyXY = 600,
    HitFlyZ = 300,
  },
  RT_34 = {
    HitFlyXY = 600,
    HitFlyZ = 400,
    UseResourceDirection = "X",
  },
  RT_35 = {
    HitFlyXY = 50,
    HitFlyZ = 100,
  },
  RT_36 = {
    MoveDis = 100,
    UseResourceDirection = "X",
  },
  RT_37 = {
    UseTargetDirection = 1,
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [146, 146] id: 1
  return r1_1
end
local r3_0 = "HitPerformanceData"
local r4_0 = {
  AirToHitFly_Common = {
    CauseHit = "HitFly",
    CauseHitParam = r0_0.RT_1,
    HitId = "AirToHitFly_Common",
  },
  BossAida_Skill08TrainHit = {
    CauseHit = "HitFly",
    CauseHitParam = r0_0.RT_2,
    HitId = "BossAida_Skill08TrainHit",
  },
  BossAida_Skill10SPHit = {
    CauseHit = "HitFly",
    CauseHitParam = r0_0.RT_2,
    HitId = "BossAida_Skill10SPHit",
  },
  BossKuxiu_ShockWave = {
    CauseHit = "LightHit",
    CauseHitParam = r0_0.RT_3,
    HitId = "BossKuxiu_ShockWave",
  },
  BossKuxiu_Skill01 = {
    CauseHit = "LightHit",
    CauseHitParam = r0_0.RT_3,
    HitId = "BossKuxiu_Skill01",
  },
}
local r5_0 = {
  CauseHit = "GrabHit",
}
r5_0.CauseHitParam = {
  GrabAnim = "GrabHit_Lianhuo",
  Offset = {
    12.5,
    -0.5,
    0
  },
}
r5_0.HitId = "BossLianhuo_Effect850507"
r4_0.BossLianhuo_Effect850507 = r5_0
r4_0.BossLinen_Skill02 = {
  CauseHit = "HitFly",
  CauseHitParam = r0_0.RT_4,
  HitId = "BossLinen_Skill02",
}
r4_0.BossLinen_Skill05 = {
  CauseHit = "HitFly",
  CauseHitParam = r0_0.RT_5,
  HitId = "BossLinen_Skill05",
}
r4_0.BossLinen_Skill06 = {
  CauseHit = "HitFly",
  CauseHitParam = r0_0.RT_4,
  HitId = "BossLinen_Skill06",
}
r4_0.BossLinen_Skill07 = {
  CauseHit = "HitFly",
  CauseHitParam = r0_0.RT_4,
  HitId = "BossLinen_Skill07",
}
r4_0.BossLinen_Skill11 = {
  CauseHit = "HitFly",
  CauseHitParam = r0_0.RT_4,
  HitId = "BossLinen_Skill11",
}
r4_0.BossLinen_Summon3 = {
  CauseHit = "HitFly",
  CauseHitParam = r0_0.RT_4,
  HitId = "BossLinen_Summon3",
}
r4_0.BossLizhan_Skill02 = {
  CauseHit = "HitFly",
  CauseHitParam = {
    HitFlyXY = 600,
    HitFlyZ = 700,
  },
  HitId = "BossLizhan_Skill02",
}
r4_0.BossLizhan_Skill04 = {
  CauseHit = "HitFly",
  CauseHitParam = {
    HitFlyXY = 800,
    HitFlyZ = 1300,
  },
  HitId = "BossLizhan_Skill04",
}
r4_0.BossLizhan_Skill07 = {
  CauseHit = "HitFly",
  CauseHitParam = r0_0.RT_6,
  HitId = "BossLizhan_Skill07",
}
r4_0.BossShijingzhe_Effect850301 = {
  CauseHit = "LightHit",
  CauseHitParam = r0_0.RT_7,
  HitId = "BossShijingzhe_Effect850301",
}
r4_0.BossShijingzhe_Effect850302 = {
  CauseHit = "HitFly",
  CauseHitParam = r0_0.RT_4,
  HitId = "BossShijingzhe_Effect850302",
}
r4_0.BossShijingzhe_Effect850304 = {
  CauseHit = "HitFly",
  CauseHitParam = {
    HitFlyXY = 800,
    HitFlyZ = 1500,
  },
  HitId = "BossShijingzhe_Effect850304",
}
r4_0.BossShijingzhe_Effect850306 = {
  CauseHit = "HitFly",
  CauseHitParam = {
    HitFlyXY = 500,
    HitFlyZ = 900,
  },
  HitId = "BossShijingzhe_Effect850306",
}
r4_0.BossShijingzhe_Effect850316 = {
  CauseHit = "LightHit",
  CauseHitParam = r0_0.RT_8,
  HitId = "BossShijingzhe_Effect850316",
}
r4_0.BossShijingzhe_Effect8503181 = {
  CauseHit = "HitFly",
  CauseHitParam = r0_0.RT_1,
  HitId = "BossShijingzhe_Effect8503181",
}
r5_0 = {
  CauseHit = "GrabHit",
}
r5_0.CauseHitParam = {
  GrabAnim = "GrabHit_Shijingzhe",
  Offset = {
    3.51566,
    0.0145,
    0
  },
}
r5_0.HitId = "BossShijingzhe_Effect8503182"
r4_0.BossShijingzhe_Effect8503182 = r5_0
r4_0.BossShijingzhe_Effect850320 = {
  CauseHit = "HitFly",
  CauseHitParam = {
    HitFlyXY = 650,
    HitFlyZ = 900,
  },
  HitId = "BossShijingzhe_Effect850320",
}
r4_0.BossShijingzhe_Effect850322 = {
  CauseHit = "HitFly",
  CauseHitParam = {
    HitFlyXY = 700,
    HitFlyZ = 1350,
  },
  HitId = "BossShijingzhe_Effect850322",
}
r4_0.BossShijingzhe_Effect850324 = {
  CauseHit = "HitFly",
  CauseHitParam = r0_0.RT_9,
  HitId = "BossShijingzhe_Effect850324",
}
r4_0.BossXibi_Skill07 = {
  CauseHit = "HitFly",
  CauseHitParam = {
    HitFlyXY = 400,
    HitFlyZ = 1000,
  },
  HitId = "BossXibi_Skill07",
}
r4_0.BossXibi_Skill08 = {
  CauseHit = "HitFly",
  CauseHitParam = r0_0.RT_6,
  HitId = "BossXibi_Skill08",
}
r4_0.HeavyHit = {
  CauseHit = "HeavyHit",
  HitId = "HeavyHit",
}
r4_0.HeavyHit_100 = {
  CauseHit = "HeavyHit",
  CauseHitParam = r0_0.RT_10,
  HitId = "HeavyHit_100",
}
r4_0.HeavyHit_120 = {
  CauseHit = "HeavyHit",
  CauseHitParam = r0_0.RT_11,
  HitId = "HeavyHit_120",
}
r4_0.HeavyHit_200 = {
  CauseHit = "HeavyHit",
  CauseHitParam = r0_0.RT_12,
  HitId = "HeavyHit_200",
}
r4_0.HeavyHit_30 = {
  CauseHit = "HeavyHit",
  CauseHitParam = {
    MoveDis = 30,
  },
  HitId = "HeavyHit_30",
}
r4_0.HeavyHit_50 = {
  CauseHit = "HeavyHit",
  CauseHitParam = r0_0.RT_13,
  HitId = "HeavyHit_50",
}
r4_0.HeavyHit_80 = {
  CauseHit = "HeavyHit",
  CauseHitParam = r0_0.RT_14,
  HitId = "HeavyHit_80",
}
r4_0.HitDown = {
  CauseHit = "HitFly",
  CauseHitParam = r0_0.RT_15,
  HitFlyComboParam = {
    HitFlyXY = 0,
    HitFlyZ = -500,
  },
  HitId = "HitDown",
  TNZeroHeavyHitParam = r0_0.RT_13,
}
r5_0 = {
  CauseHit = "HitFly",
}
r5_0.CauseHitParam = {
  Bone = r0_0.RT_16,
  ForceXY = {
    8000,
    15000
  },
  ForceZ = {
    8000,
    12000
  },
}
r5_0.HitFlyComboParam = r0_0.RT_17
r5_0.HitId = "HitFly_Force_Common"
r5_0.TNZeroHeavyHitParam = r0_0.RT_18
r4_0.HitFly_Force_Common = r5_0
r5_0 = {
  CauseHit = "HitFly",
}
r5_0.CauseHitParam = {
  Bone = r0_0.RT_16,
  ForceXY = {
    50000,
    80000
  },
  ForceZ = {
    30000,
    50000
  },
}
r5_0.HitFlyComboParam = r0_0.RT_19
r5_0.HitId = "HitFly_Force_Songlu"
r5_0.TNZeroHeavyHitParam = r0_0.RT_18
r4_0.HitFly_Force_Songlu = r5_0
r4_0.HitFly_XY0Z1000 = {
  CauseHit = "HitFly",
  CauseHitParam = r0_0.RT_1,
  HitFlyComboParam = r0_0.RT_20,
  HitId = "HitFly_XY0Z1000",
  TNZeroHeavyHitParam = r0_0.RT_13,
}
r4_0.HitFly_XY0Z300 = {
  CauseHit = "HitFly",
  CauseHitParam = r0_0.RT_15,
  HitFlyComboParam = r0_0.RT_15,
  HitId = "HitFly_XY0Z300",
  TNZeroHeavyHitParam = r0_0.RT_13,
}
r4_0.HitFly_XY0Z3000 = {
  CauseHit = "HitFly",
  CauseHitParam = r0_0.RT_21,
  HitFlyComboParam = r0_0.RT_21,
  HitId = "HitFly_XY0Z3000",
  TNZeroHeavyHitParam = r0_0.RT_18,
}
r4_0.HitFly_XY0Z500 = {
  CauseHit = "HitFly",
  CauseHitParam = r0_0.RT_5,
  HitFlyComboParam = r0_0.RT_5,
  HitId = "HitFly_XY0Z500",
  TNZeroHeavyHitParam = r0_0.RT_13,
}
r4_0.HitFly_XY0Z800 = {
  CauseHit = "HitFly",
  CauseHitParam = r0_0.RT_20,
  HitFlyComboParam = r0_0.RT_20,
  HitId = "HitFly_XY0Z800",
  TNZeroHeavyHitParam = r0_0.RT_13,
}
r4_0.HitFly_XY1000Z1000 = {
  CauseHit = "HitFly",
  CauseHitParam = {
    HitFlyXY = 1000,
    HitFlyZ = 1000,
  },
  HitFlyComboParam = {
    HitFlyXY = 1000,
    HitFlyZ = 800,
  },
  HitId = "HitFly_XY1000Z1000",
  TNZeroHeavyHitParam = r0_0.RT_18,
}
r4_0.HitFly_XY1000Z300_F = {
  CauseHit = "HitFly",
  CauseHitParam = {
    HitFlyXY = 1000,
    HitFlyZ = 300,
    UseResourceDirection = "X",
  },
  HitFlyComboParam = {
    HitFlyXY = 1000,
    HitFlyZ = 200,
    UseResourceDirection = "X",
  },
  HitId = "HitFly_XY1000Z300_F",
  TNZeroHeavyHitParam = r0_0.RT_18,
}
r4_0.HitFly_XY1000Z500 = {
  CauseHit = "HitFly",
  CauseHitParam = {
    HitFlyXY = 1000,
    HitFlyZ = 500,
  },
  HitFlyComboParam = r0_0.RT_19,
  HitId = "HitFly_XY1000Z500",
  TNZeroHeavyHitParam = r0_0.RT_18,
}
r4_0.HitFly_XY1200Z1000 = {
  CauseHit = "HitFly",
  CauseHitParam = {
    HitFlyXY = 1200,
    HitFlyZ = 1000,
  },
  HitFlyComboParam = {
    HitFlyXY = 1200,
    HitFlyZ = 800,
  },
  HitId = "HitFly_XY1200Z1000",
  TNZeroHeavyHitParam = r0_0.RT_18,
}
r4_0.HitFly_XY2000Z1000 = {
  CauseHit = "HitFly",
  CauseHitParam = {
    HitFlyXY = 2000,
    HitFlyZ = 1000,
  },
  HitFlyComboParam = {
    HitFlyXY = 2000,
    HitFlyZ = 800,
  },
  HitId = "HitFly_XY2000Z1000",
  TNZeroHeavyHitParam = r0_0.RT_18,
}
r4_0.HitFly_XY200Z100 = {
  CauseHit = "HitFly",
  CauseHitParam = r0_0.RT_22,
  HitFlyComboParam = r0_0.RT_22,
  HitId = "HitFly_XY200Z100",
  TNZeroHeavyHitParam = r0_0.RT_10,
}
r4_0.HitFly_XY200Z100_B = {
  CauseHit = "HitFly",
  CauseHitParam = r0_0.RT_23,
  HitFlyComboParam = r0_0.RT_23,
  HitId = "HitFly_XY200Z100_B",
  TNZeroHeavyHitParam = r0_0.RT_10,
}
r4_0.HitFly_XY200Z300 = {
  CauseHit = "HitFly",
  CauseHitParam = r0_0.RT_24,
  HitFlyComboParam = r0_0.RT_24,
  HitId = "HitFly_XY200Z300",
  TNZeroHeavyHitParam = r0_0.RT_10,
}
r4_0.HitFly_XY200Z300_B = {
  CauseHit = "HitFly",
  CauseHitParam = {
    HitFlyXY = 200,
    HitFlyZ = 300,
    UseResourceDirection = "-X",
  },
  HitFlyComboParam = {
    HitFlyXY = 200,
    HitFlyZ = 200,
    UseResourceDirection = "-X",
  },
  HitId = "HitFly_XY200Z300_B",
  TNZeroHeavyHitParam = r0_0.RT_10,
}
r4_0.HitFly_XY200Z300_F = {
  CauseHit = "HitFly",
  CauseHitParam = {
    HitFlyXY = 200,
    HitFlyZ = 300,
    UseResourceDirection = "X",
  },
  HitFlyComboParam = r0_0.RT_25,
  HitId = "HitFly_XY200Z300_F",
  TNZeroHeavyHitParam = r0_0.RT_10,
}
r4_0.HitFly_XY200Z500 = {
  CauseHit = "HitFly",
  CauseHitParam = {
    HitFlyXY = 200,
    HitFlyZ = 500,
  },
  HitFlyComboParam = {
    HitFlyXY = 200,
    HitFlyZ = 400,
  },
  HitId = "HitFly_XY200Z500",
  TNZeroHeavyHitParam = r0_0.RT_10,
}
r4_0.HitFly_XY200Z500_F = {
  CauseHit = "HitFly",
  CauseHitParam = {
    HitFlyXY = 200,
    HitFlyZ = 500,
    UseResourceDirection = "X",
  },
  HitFlyComboParam = {
    HitFlyXY = 200,
    HitFlyZ = 400,
    UseResourceDirection = "X",
  },
  HitId = "HitFly_XY200Z500_F",
  TNZeroHeavyHitParam = r0_0.RT_10,
}
r4_0.HitFly_XY300Z1000 = {
  CauseHit = "HitFly",
  CauseHitParam = {
    HitFlyXY = 300,
    HitFlyZ = 1000,
  },
  HitFlyComboParam = r0_0.RT_26,
  HitId = "HitFly_XY300Z1000",
  TNZeroHeavyHitParam = r0_0.RT_8,
}
r4_0.HitFly_XY300Z800 = {
  CauseHit = "HitFly",
  CauseHitParam = r0_0.RT_26,
  HitFlyComboParam = {
    HitFlyXY = 300,
    HitFlyZ = 700,
  },
  HitId = "HitFly_XY300Z800",
  TNZeroHeavyHitParam = r0_0.RT_8,
}
r4_0.HitFly_XY400Z300 = {
  CauseHit = "HitFly",
  CauseHitParam = {
    HitFlyXY = 400,
    HitFlyZ = 300,
  },
  HitFlyComboParam = r0_0.RT_27,
  HitId = "HitFly_XY400Z300",
  TNZeroHeavyHitParam = r0_0.RT_12,
}
r4_0.HitFly_XY400Z300_F = {
  CauseHit = "HitFly",
  CauseHitParam = r0_0.RT_28,
  HitFlyComboParam = r0_0.RT_29,
  HitId = "HitFly_XY400Z300_F",
  TNZeroHeavyHitParam = r0_0.RT_12,
}
r4_0.HitFly_XY400Z400_F = {
  CauseHit = "HitFly",
  CauseHitParam = r0_0.RT_30,
  HitFlyComboParam = r0_0.RT_28,
  HitId = "HitFly_XY400Z400_F",
  TNZeroHeavyHitParam = r0_0.RT_12,
}
r4_0.HitFly_XY400Z500_F = {
  CauseHit = "HitFly",
  CauseHitParam = {
    HitFlyXY = 400,
    HitFlyZ = 500,
    UseResourceDirection = "X",
  },
  HitFlyComboParam = r0_0.RT_30,
  HitId = "HitFly_XY400Z500_F",
  TNZeroHeavyHitParam = r0_0.RT_12,
}
r4_0.HitFly_XY400Z600 = {
  CauseHit = "HitFly",
  CauseHitParam = {
    HitFlyXY = 400,
    HitFlyZ = 600,
  },
  HitFlyComboParam = {
    HitFlyXY = 400,
    HitFlyZ = 500,
  },
  HitId = "HitFly_XY400Z600",
  TNZeroHeavyHitParam = r0_0.RT_12,
}
r4_0.HitFly_XY500Z1000 = {
  CauseHit = "HitFly",
  CauseHitParam = {
    HitFlyXY = 500,
    HitFlyZ = 1000,
  },
  HitFlyComboParam = {
    HitFlyXY = 500,
    HitFlyZ = 800,
  },
  HitId = "HitFly_XY500Z1000",
  TNZeroHeavyHitParam = r0_0.RT_7,
}
r4_0.HitFly_XY500Z300 = {
  CauseHit = "HitFly",
  CauseHitParam = r0_0.RT_31,
  HitFlyComboParam = {
    HitFlyXY = 500,
    HitFlyZ = 200,
  },
  HitId = "HitFly_XY500Z300",
  TNZeroHeavyHitParam = r0_0.RT_7,
}
r4_0.HitFly_XY500Z300_F = {
  CauseHit = "HitFly",
  CauseHitParam = r0_0.RT_31,
  HitFlyComboParam = {
    HitFlyXY = 500,
    HitFlyZ = 200,
    UseResourceDirection = "X",
  },
  HitId = "HitFly_XY500Z300_F",
  TNZeroHeavyHitParam = r0_0.RT_7,
}
r4_0.HitFly_XY600Z1000 = {
  CauseHit = "HitFly",
  CauseHitParam = {
    HitFlyXY = 600,
    HitFlyZ = 1000,
  },
  HitFlyComboParam = {
    HitFlyXY = 600,
    HitFlyZ = 800,
  },
  HitId = "HitFly_XY600Z1000",
  TNZeroHeavyHitParam = r0_0.RT_32,
}
r4_0.HitFly_XY600Z300 = {
  CauseHit = "HitFly",
  CauseHitParam = r0_0.RT_33,
  HitFlyComboParam = {
    HitFlyXY = 600,
    HitFlyZ = 250,
  },
  HitId = "HitFly_XY600Z300",
  TNZeroHeavyHitParam = r0_0.RT_32,
}
r4_0.HitFly_XY600Z400 = {
  CauseHit = "HitFly",
  CauseHitParam = {
    HitFlyXY = 600,
    HitFlyZ = 400,
  },
  HitFlyComboParam = r0_0.RT_33,
  HitId = "HitFly_XY600Z400",
  TNZeroHeavyHitParam = r0_0.RT_32,
}
r4_0.HitFly_XY600Z400_F = {
  CauseHit = "HitFly",
  CauseHitParam = r0_0.RT_34,
  HitFlyComboParam = r0_0.RT_34,
  HitId = "HitFly_XY600Z400_F",
  TNZeroHeavyHitParam = r0_0.RT_32,
}
r4_0.HitFly_XY600Z600 = {
  CauseHit = "HitFly",
  CauseHitParam = {
    HitFlyXY = 600,
    HitFlyZ = 600,
  },
  HitFlyComboParam = r0_0.RT_17,
  HitId = "HitFly_XY600Z600",
  TNZeroHeavyHitParam = r0_0.RT_32,
}
r4_0.HitFly_XY800Z1000 = {
  CauseHit = "HitFly",
  CauseHitParam = r0_0.RT_6,
  HitFlyComboParam = r0_0.RT_9,
  HitId = "HitFly_XY800Z1000",
  TNZeroHeavyHitParam = r0_0.RT_3,
}
r4_0.HitFly_XY800Z300A270 = {
  CauseHit = "HitFly",
  CauseHitParam = {
    Angle = 270,
    HitFlyXY = 800,
    HitFlyZ = 300,
  },
  HitFlyComboParam = {
    Angle = 270,
    HitFlyXY = 800,
    HitFlyZ = 200,
  },
  HitId = "HitFly_XY800Z300A270",
  TNZeroHeavyHitParam = r0_0.RT_18,
}
r4_0.HitFly_XY800Z300A90 = {
  CauseHit = "HitFly",
  CauseHitParam = {
    Angle = 90,
    HitFlyXY = 800,
    HitFlyZ = 300,
  },
  HitFlyComboParam = {
    Angle = 90,
    HitFlyXY = 800,
    HitFlyZ = 200,
  },
  HitId = "HitFly_XY800Z300A90",
  TNZeroHeavyHitParam = r0_0.RT_18,
}
r4_0.HitFly_XY800Z400 = {
  CauseHit = "HitFly",
  CauseHitParam = {
    HitFlyXY = 800,
    HitFlyZ = 400,
  },
  HitFlyComboParam = r0_0.RT_33,
  HitId = "HitFly_XY800Z400",
  TNZeroHeavyHitParam = r0_0.RT_3,
}
r4_0.HitFly_XY800Z400_F = {
  CauseHit = "HitFly",
  CauseHitParam = {
    HitFlyXY = 800,
    HitFlyZ = 400,
    UseResourceDirection = "X",
  },
  HitFlyComboParam = {
    HitFlyXY = 800,
    HitFlyZ = 300,
    UseResourceDirection = "X",
  },
  HitId = "HitFly_XY800Z400_F",
  TNZeroHeavyHitParam = r0_0.RT_3,
}
r4_0.HitFly_XY800Z600_F = {
  CauseHit = "HitFly",
  CauseHitParam = {
    HitFlyXY = 800,
    HitFlyZ = 600,
    UseResourceDirection = "X",
  },
  HitFlyComboParam = {
    HitFlyXY = 800,
    HitFlyZ = 500,
    UseResourceDirection = "X",
  },
  HitId = "HitFly_XY800Z600_F",
  TNZeroHeavyHitParam = r0_0.RT_3,
}
r4_0.LightHit = {
  CauseHit = "LightHit",
  HitFlyComboParam = r0_0.RT_35,
  HitId = "LightHit",
}
r4_0.LightHit_100 = {
  CauseHit = "LightHit",
  CauseHitParam = r0_0.RT_10,
  HitFlyComboParam = r0_0.RT_27,
  HitId = "LightHit_100",
  TNZeroHeavyHitParam = r0_0.RT_10,
}
r4_0.LightHit_1000_Z = {
  CauseHit = "LightHit",
  CauseHitParam = {
    MoveDis = 1000,
    UseResourceDirection = "Z",
  },
  HitId = "LightHit_1000_Z",
}
r4_0.LightHit_100_F = {
  CauseHit = "LightHit",
  CauseHitParam = r0_0.RT_36,
  HitFlyComboParam = r0_0.RT_29,
  HitId = "LightHit_100_F",
  TNZeroHeavyHitParam = r0_0.RT_10,
}
r4_0.LightHit_120 = {
  CauseHit = "LightHit",
  CauseHitParam = r0_0.RT_11,
  HitFlyComboParam = r0_0.RT_27,
  HitId = "LightHit_120",
  TNZeroHeavyHitParam = r0_0.RT_10,
}
r4_0.LightHit_150 = {
  CauseHit = "LightHit",
  CauseHitParam = r0_0.RT_8,
  HitId = "LightHit_150",
  TNZeroHeavyHitParam = r0_0.RT_8,
}
r4_0.LightHit_150_F = {
  CauseHit = "LightHit",
  CauseHitParam = {
    MoveDis = 150,
    UseResourceDirection = "X",
  },
  HitFlyComboParam = r0_0.RT_28,
  HitId = "LightHit_150_F",
  TNZeroHeavyHitParam = r0_0.RT_8,
}
r4_0.LightHit_150_Laser = {
  CauseHit = "LightHit",
  CauseHitParam = {
    MoveDis = 150,
    UseTargetDirection = 1,
  },
  HitFlyComboParam = r0_0.RT_35,
  HitId = "LightHit_150_Laser",
}
r4_0.LightHit_200 = {
  CauseHit = "LightHit",
  CauseHitParam = r0_0.RT_12,
  HitId = "LightHit_200",
  TNZeroHeavyHitParam = r0_0.RT_8,
}
r4_0.LightHit_300 = {
  CauseHit = "LightHit",
  CauseHitParam = r0_0.RT_32,
  HitId = "LightHit_300",
  TNZeroHeavyHitParam = r0_0.RT_8,
}
r4_0.LightHit_40 = {
  CauseHit = "LightHit",
  CauseHitParam = {
    MoveDis = 40,
  },
  HitId = "LightHit_40",
}
r4_0.LightHit_400 = {
  CauseHit = "LightHit",
  CauseHitParam = r0_0.RT_3,
  HitId = "LightHit_400",
  TNZeroHeavyHitParam = r0_0.RT_8,
}
r4_0.LightHit_50 = {
  CauseHit = "LightHit",
  CauseHitParam = r0_0.RT_13,
  HitFlyComboParam = {
    HitFlyXY = 200,
    HitFlyZ = 200,
  },
  HitId = "LightHit_50",
  TNZeroHeavyHitParam = r0_0.RT_14,
}
r4_0.LightHit_50_F = {
  CauseHit = "LightHit",
  CauseHitParam = {
    MoveDis = 50,
    UseResourceDirection = "X",
  },
  HitFlyComboParam = r0_0.RT_25,
  HitId = "LightHit_50_F",
  TNZeroHeavyHitParam = r0_0.RT_14,
}
r4_0.LightHit_60 = {
  CauseHit = "LightHit",
  CauseHitParam = {
    MoveDis = 60,
  },
  HitId = "LightHit_60",
  TNZeroHeavyHitParam = r0_0.RT_14,
}
r4_0.LightHit_80 = {
  CauseHit = "LightHit",
  CauseHitParam = r0_0.RT_14,
  HitFlyComboParam = {
    HitFlyXY = 300,
    HitFlyZ = 200,
  },
  HitId = "LightHit_80",
  TNZeroHeavyHitParam = r0_0.RT_14,
}
r4_0.LightHit_IceBomb = {
  CauseHit = "LightHit",
  CauseHitParam = r0_0.RT_37,
  HitId = "LightHit_IceBomb",
}
r4_0.LightHit_Laser = {
  CauseHit = "LightHit",
  CauseHitParam = r0_0.RT_37,
  HitFlyComboParam = r0_0.RT_35,
  HitId = "LightHit_Laser",
}
r4_0.LightHit_Tuosi = {
  CauseHit = "LightHit",
  CauseHitParam = r0_0.RT_36,
  HitFlyComboParam = {
    HitFlyXY = 300,
    HitFlyZ = 80,
    UseResourceDirection = "X",
  },
  HitId = "LightHit_Tuosi",
  TNZeroHeavyHitParam = r0_0.RT_10,
}
r4_0.RangedWeapon_Common = {
  CauseHit = "LightHitRanged",
  FirstHit = "LightHit",
  HitFlyComboParam = r0_0.RT_35,
  HitId = "RangedWeapon_Common",
  TNZeroHeavyHitParam = r0_0.RT_10,
}
r4_0.RangedWeapon_Shotgun = {
  CauseDie = "HitFly",
  CauseDieParam = r0_0.RT_33,
  CauseHit = "LightHitRanged",
  FirstHit = "LightHit",
  FirstHitParam = r0_0.RT_13,
  HitFlyComboParam = {
    HitFlyXY = 50,
    HitFlyZ = 200,
  },
  HitId = "RangedWeapon_Shotgun",
  TNZeroHeavyHitParam = r0_0.RT_12,
}
return r2_0(r3_0, r4_0)
