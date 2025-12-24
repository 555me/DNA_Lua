-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\MonsterGroupSpawn.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    0,
    0
  },
  RT_2 = {
    4,
    4
  },
  RT_3 = {
    2,
    2
  },
  RT_4 = {
    300,
    500
  },
  RT_5 = {
    1,
    1,
    1,
    1
  },
  RT_6 = {
    1000,
    1500
  },
  RT_7 = {
    0,
    0,
    0,
    0,
    0
  },
  RT_8 = {
    2,
    2,
    2,
    2,
    0
  },
  RT_9 = {
    200,
    2000
  },
  RT_10 = {
    2,
    2,
    2,
    2,
    1
  },
  RT_11 = {
    800,
    2000
  },
  RT_12 = {
    0,
    0,
    0,
    0,
    0,
    0
  },
  RT_13 = {
    3,
    3,
    1,
    3,
    3,
    1
  },
  RT_14 = {
    1200,
    2000
  },
  RT_15 = {
    2,
    2,
    1,
    2,
    2,
    1
  },
  RT_16 = {
    6012,
    6022,
    6023,
    8011,
    8021,
    8022
  },
  RT_17 = {
    0,
    2000
  },
  RT_18 = {
    6012,
    6022,
    6023,
    7012,
    7023,
    7024
  },
  RT_19 = {
    800,
    1200
  },
  RT_20 = {
    3,
    3,
    1,
    3,
    3
  },
  RT_21 = {
    2,
    2,
    1,
    2,
    2
  },
  RT_22 = {
    6012,
    6022,
    6023,
    9011,
    9021
  },
  RT_23 = {
    6010,
    6011,
    6020,
    6021,
    6030
  },
  RT_24 = {
    1,
    1
  },
  RT_25 = {
    1000,
    3000
  },
  RT_26 = {
    0
  },
  RT_27 = {
    1
  },
  RT_28 = {
    1500,
    2000
  },
  RT_29 = {
    0,
    0,
    0,
    0
  },
  RT_30 = {
    2,
    1,
    1,
    1
  },
  RT_31 = {
    200,
    3000
  },
  RT_32 = {
    6010,
    6011,
    6020,
    6021
  },
  RT_33 = {
    2,
    1,
    2,
    1
  },
  RT_34 = {
    1200,
    3000
  },
  RT_35 = {
    2,
    1,
    2,
    1,
    1
  },
  RT_36 = {
    0,
    0,
    0
  },
  RT_37 = {
    2,
    1,
    1
  },
  RT_38 = {
    3,
    1,
    1
  },
  RT_39 = {
    600,
    2000
  },
  RT_40 = {
    400,
    3000
  },
  RT_41 = {
    7010,
    7020,
    7022
  },
  RT_42 = {
    2,
    2,
    1
  },
  RT_43 = {
    1,
    3,
    1
  },
  RT_44 = {
    7010,
    7020,
    7022,
    6010
  },
  RT_45 = {
    2,
    2,
    1,
    1
  },
  RT_46 = {
    1,
    2,
    1,
    1
  },
  RT_47 = {
    2,
    1,
    2
  },
  RT_48 = {
    2,
    3,
    1
  },
  RT_49 = {
    1,
    2,
    2
  },
  RT_50 = {
    1,
    1,
    2
  },
  RT_51 = {
    6040,
    6042,
    8040
  },
  RT_52 = {
    6050,
    6052,
    8050
  },
  RT_53 = {
    6040,
    6042,
    9040
  },
  RT_54 = {
    600,
    3000
  },
  RT_55 = {
    6050,
    6052,
    9050
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [295, 295] id: 1
  return r1_1
end
local r3_0 = "MonsterGroupSpawn"
local r4_0 = {}
r4_0[1] = {
  GroupDetectDelayTime = 5,
  GroupDetectTime = 2,
  GroupInitUnitSpawnCenterRange = {
    2000,
    2100
  },
  GroupLevel = r0_0.RT_1,
  GroupLimit = 30,
  GroupNumber = r0_0.RT_2,
  GroupRadius = 800,
  GroupRangeZ = 500,
  GroupReplenishInterval = 4,
  GroupSpawnId = 1,
  GroupThreshold = 20,
  GroupUnitSpawnCenterRange = {
    500,
    510
  },
  GroupWeight = r0_0.RT_3,
  MonsterGroupIds = {
    7010,
    7020
  },
}
r4_0[2] = {
  GroupDetectDelayTime = 3,
  GroupDetectTime = 2,
  GroupInitUnitSpawnCenterRange = r0_0.RT_6,
  GroupLevel = r0_0.RT_7,
  GroupLimit = 30,
  GroupNumber = r0_0.RT_8,
  GroupRadius = 500,
  GroupRangeZ = 500,
  GroupReplenishInterval = 4,
  GroupSpawnId = 2,
  GroupThreshold = 20,
  GroupUnitSpawnCenterRange = r0_0.RT_9,
  GroupWeight = r0_0.RT_10,
  MonsterGroupIds = {
    7010,
    7011,
    7020,
    7021,
    7030
  },
}
r4_0[3] = {
  GroupDetectDelayTime = 3,
  GroupDetectTime = 2,
  GroupInitUnitSpawnCenterRange = r0_0.RT_6,
  GroupLevel = r0_0.RT_7,
  GroupLimit = 30,
  GroupNumber = r0_0.RT_8,
  GroupRadius = 500,
  GroupRangeZ = 500,
  GroupReplenishInterval = 4,
  GroupSpawnId = 3,
  GroupThreshold = 20,
  GroupUnitSpawnCenterRange = r0_0.RT_9,
  GroupWeight = r0_0.RT_10,
  MonsterGroupIds = r0_0.RT_23,
}
r4_0[4] = {
  GroupDetectDelayTime = 3,
  GroupDetectTime = 2,
  GroupInitUnitSpawnCenterRange = r0_0.RT_6,
  GroupLevel = r0_0.RT_1,
  GroupLimit = 30,
  GroupNumber = r0_0.RT_2,
  GroupRadius = 500,
  GroupRangeZ = 500,
  GroupReplenishInterval = 4,
  GroupSpawnId = 4,
  GroupThreshold = 20,
  GroupUnitSpawnCenterRange = r0_0.RT_9,
  GroupWeight = r0_0.RT_24,
  MonsterGroupIds = {
    8010,
    8020
  },
}
r4_0[5] = {
  GroupDetectDelayTime = 3,
  GroupDetectTime = 2,
  GroupInitUnitSpawnCenterRange = r0_0.RT_6,
  GroupLevel = r0_0.RT_1,
  GroupLimit = 30,
  GroupNumber = r0_0.RT_2,
  GroupRadius = 500,
  GroupRangeZ = 500,
  GroupReplenishInterval = 4,
  GroupSpawnId = 5,
  GroupThreshold = 20,
  GroupUnitSpawnCenterRange = r0_0.RT_9,
  GroupWeight = r0_0.RT_24,
  MonsterGroupIds = {
    9010,
    9020
  },
}
r4_0[11] = {
  GroupDetectDelayTime = 3,
  GroupDetectTime = 1,
  GroupInitUnitSpawnCenterRange = r0_0.RT_4,
  GroupLevel = r0_0.RT_5,
  GroupLimit = 30,
  GroupNumber = {
    3,
    3,
    3,
    3
  },
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 1,
  GroupSpawnId = 11,
  GroupThreshold = 25,
  GroupUnitSpawnCenterRange = r0_0.RT_4,
  GroupWeight = r0_0.RT_5,
  MonsterGroupIds = {
    11,
    12,
    13,
    14
  },
}
r4_0[60037] = {
  GroupDetectDelayTime = 0,
  GroupDetectTime = 1,
  GroupInitUnitSpawnCenterRange = r0_0.RT_9,
  GroupLevel = r0_0.RT_29,
  GroupLimit = 35,
  GroupNumber = r0_0.RT_30,
  GroupRadius = 800,
  GroupRangeZ = 500,
  GroupReplenishInterval = 1,
  GroupSpawnId = 60037,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_31,
  GroupWeight = r0_0.RT_30,
  MonsterGroupIds = r0_0.RT_32,
}
r4_0[60055] = {
  GroupDetectDelayTime = 3,
  GroupDetectTime = 1,
  GroupInitUnitSpawnCenterRange = r0_0.RT_14,
  GroupLevel = r0_0.RT_29,
  GroupLimit = 50,
  GroupNumber = r0_0.RT_33,
  GroupRadius = 500,
  GroupRangeZ = 500,
  GroupReplenishInterval = 1,
  GroupSpawnId = 60055,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_34,
  GroupWeight = r0_0.RT_33,
  MonsterGroupIds = r0_0.RT_32,
}
r4_0[60073] = {
  GroupDetectDelayTime = 3,
  GroupDetectTime = 1,
  GroupInitUnitSpawnCenterRange = r0_0.RT_14,
  GroupLevel = r0_0.RT_29,
  GroupLimit = 50,
  GroupNumber = r0_0.RT_33,
  GroupRadius = 500,
  GroupRangeZ = 500,
  GroupReplenishInterval = 1,
  GroupSpawnId = 60073,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_34,
  GroupWeight = {
    1,
    1,
    3,
    1
  },
  MonsterGroupIds = r0_0.RT_32,
}
r4_0[60137] = {
  GroupDetectDelayTime = 0,
  GroupDetectTime = 1,
  GroupInitUnitSpawnCenterRange = r0_0.RT_9,
  GroupLevel = r0_0.RT_7,
  GroupLimit = 35,
  GroupNumber = {
    2,
    1,
    1,
    1,
    1
  },
  GroupRadius = 800,
  GroupRangeZ = 500,
  GroupReplenishInterval = 1,
  GroupSpawnId = 60137,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_31,
  GroupWeight = {
    3,
    1,
    1,
    1,
    1
  },
  MonsterGroupIds = r0_0.RT_23,
}
r4_0[60155] = {
  GroupDetectDelayTime = 3,
  GroupDetectTime = 1,
  GroupInitUnitSpawnCenterRange = r0_0.RT_14,
  GroupLevel = r0_0.RT_7,
  GroupLimit = 50,
  GroupNumber = r0_0.RT_35,
  GroupRadius = 500,
  GroupRangeZ = 500,
  GroupReplenishInterval = 1,
  GroupSpawnId = 60155,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_34,
  GroupWeight = r0_0.RT_35,
  MonsterGroupIds = r0_0.RT_23,
}
r4_0[60173] = {
  GroupDetectDelayTime = 3,
  GroupDetectTime = 1,
  GroupInitUnitSpawnCenterRange = r0_0.RT_14,
  GroupLevel = r0_0.RT_7,
  GroupLimit = 50,
  GroupNumber = r0_0.RT_35,
  GroupRadius = 500,
  GroupRangeZ = 500,
  GroupReplenishInterval = 1,
  GroupSpawnId = 60173,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_34,
  GroupWeight = {
    1,
    1,
    3,
    1,
    1
  },
  MonsterGroupIds = r0_0.RT_23,
}
r4_0[60200] = {
  GroupDetectDelayTime = 2,
  GroupDetectTime = 0.5,
  GroupInitUnitSpawnCenterRange = r0_0.RT_9,
  GroupLevel = r0_0.RT_36,
  GroupLimit = 35,
  GroupNumber = r0_0.RT_37,
  GroupRadius = 800,
  GroupRangeZ = 500,
  GroupReplenishInterval = 1,
  GroupSpawnId = 60200,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_31,
  GroupWeight = r0_0.RT_38,
  MonsterGroupIds = {
    6040,
    6041,
    6042
  },
}
r4_0[60201] = {
  GroupDetectDelayTime = 2,
  GroupDetectTime = 0.5,
  GroupInitUnitSpawnCenterRange = r0_0.RT_14,
  GroupLevel = r0_0.RT_29,
  GroupLimit = 40,
  GroupNumber = {
    2,
    1,
    1,
    0
  },
  GroupRadius = 500,
  GroupRangeZ = 500,
  GroupReplenishInterval = 1,
  GroupSpawnId = 60201,
  GroupThreshold = 35,
  GroupUnitSpawnCenterRange = r0_0.RT_25,
  GroupWeight = {
    3,
    2,
    2,
    1
  },
  MonsterGroupIds = {
    6040,
    6041,
    6042,
    6030
  },
}
r4_0[60501] = {
  GroupDetectDelayTime = 3,
  GroupDetectTime = 0.5,
  GroupInitUnitSpawnCenterRange = r0_0.RT_39,
  GroupLevel = r0_0.RT_36,
  GroupLimit = 35,
  GroupNumber = r0_0.RT_37,
  GroupRadius = 800,
  GroupRangeZ = 500,
  GroupReplenishInterval = 1,
  GroupSpawnId = 60501,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_40,
  GroupWeight = r0_0.RT_38,
  MonsterGroupIds = {
    6050,
    6051,
    6052
  },
}
r4_0[70037] = {
  GroupDetectDelayTime = 0,
  GroupDetectTime = 1,
  GroupInitUnitSpawnCenterRange = r0_0.RT_9,
  GroupLevel = r0_0.RT_36,
  GroupLimit = 35,
  GroupNumber = r0_0.RT_37,
  GroupRadius = 800,
  GroupRangeZ = 500,
  GroupReplenishInterval = 1,
  GroupSpawnId = 70037,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_31,
  GroupWeight = r0_0.RT_37,
  MonsterGroupIds = r0_0.RT_41,
}
r4_0[70055] = {
  GroupDetectDelayTime = 3,
  GroupDetectTime = 1,
  GroupInitUnitSpawnCenterRange = r0_0.RT_14,
  GroupLevel = r0_0.RT_36,
  GroupLimit = 50,
  GroupNumber = r0_0.RT_42,
  GroupRadius = 500,
  GroupRangeZ = 500,
  GroupReplenishInterval = 1,
  GroupSpawnId = 70055,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_34,
  GroupWeight = r0_0.RT_42,
  MonsterGroupIds = r0_0.RT_41,
}
r4_0[70073] = {
  GroupDetectDelayTime = 3,
  GroupDetectTime = 1,
  GroupInitUnitSpawnCenterRange = r0_0.RT_14,
  GroupLevel = r0_0.RT_36,
  GroupLimit = 50,
  GroupNumber = r0_0.RT_43,
  GroupRadius = 500,
  GroupRangeZ = 500,
  GroupReplenishInterval = 1,
  GroupSpawnId = 70073,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_34,
  GroupWeight = r0_0.RT_43,
  MonsterGroupIds = r0_0.RT_41,
}
r4_0[70137] = {
  GroupDetectDelayTime = 0,
  GroupDetectTime = 1,
  GroupInitUnitSpawnCenterRange = r0_0.RT_9,
  GroupLevel = r0_0.RT_29,
  GroupLimit = 35,
  GroupNumber = r0_0.RT_30,
  GroupRadius = 800,
  GroupRangeZ = 500,
  GroupReplenishInterval = 1,
  GroupSpawnId = 70137,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_31,
  GroupWeight = r0_0.RT_30,
  MonsterGroupIds = r0_0.RT_44,
}
r4_0[70155] = {
  GroupDetectDelayTime = 3,
  GroupDetectTime = 1,
  GroupInitUnitSpawnCenterRange = r0_0.RT_14,
  GroupLevel = r0_0.RT_29,
  GroupLimit = 50,
  GroupNumber = r0_0.RT_45,
  GroupRadius = 500,
  GroupRangeZ = 500,
  GroupReplenishInterval = 1,
  GroupSpawnId = 70155,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_34,
  GroupWeight = r0_0.RT_46,
  MonsterGroupIds = r0_0.RT_44,
}
r4_0[70173] = {
  GroupDetectDelayTime = 3,
  GroupDetectTime = 1,
  GroupInitUnitSpawnCenterRange = r0_0.RT_14,
  GroupLevel = r0_0.RT_29,
  GroupLimit = 50,
  GroupNumber = r0_0.RT_45,
  GroupRadius = 500,
  GroupRangeZ = 500,
  GroupReplenishInterval = 1,
  GroupSpawnId = 70173,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_34,
  GroupWeight = r0_0.RT_46,
  MonsterGroupIds = {
    7010,
    7020,
    7022,
    6020
  },
}
r4_0[70200] = {
  GroupDetectDelayTime = 2,
  GroupDetectTime = 0.5,
  GroupInitUnitSpawnCenterRange = r0_0.RT_9,
  GroupLevel = r0_0.RT_1,
  GroupLimit = 35,
  GroupNumber = r0_0.RT_3,
  GroupRadius = 800,
  GroupRangeZ = 500,
  GroupReplenishInterval = 1,
  GroupSpawnId = 70200,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_31,
  GroupWeight = {
    2,
    1
  },
  MonsterGroupIds = {
    7040,
    7041
  },
}
r4_0[70201] = {
  GroupDetectDelayTime = 2,
  GroupDetectTime = 0.5,
  GroupInitUnitSpawnCenterRange = r0_0.RT_14,
  GroupLevel = r0_0.RT_29,
  GroupLimit = 40,
  GroupNumber = {
    2,
    2,
    0,
    0
  },
  GroupRadius = 500,
  GroupRangeZ = 500,
  GroupReplenishInterval = 1,
  GroupSpawnId = 70201,
  GroupThreshold = 35,
  GroupUnitSpawnCenterRange = r0_0.RT_25,
  GroupWeight = {
    3,
    2,
    1,
    1
  },
  MonsterGroupIds = {
    7040,
    7041,
    7042,
    7044
  },
}
r4_0[80037] = {
  GroupDetectDelayTime = 0,
  GroupDetectTime = 1,
  GroupInitUnitSpawnCenterRange = r0_0.RT_9,
  GroupLevel = r0_0.RT_36,
  GroupLimit = 35,
  GroupNumber = r0_0.RT_47,
  GroupRadius = 800,
  GroupRangeZ = 500,
  GroupReplenishInterval = 1,
  GroupSpawnId = 80037,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_31,
  GroupWeight = r0_0.RT_47,
  MonsterGroupIds = {
    8010,
    8020,
    6010
  },
}
r4_0[80055] = {
  GroupDetectDelayTime = 3,
  GroupDetectTime = 1,
  GroupInitUnitSpawnCenterRange = r0_0.RT_14,
  GroupLevel = r0_0.RT_29,
  GroupLimit = 50,
  GroupNumber = r0_0.RT_45,
  GroupRadius = 500,
  GroupRangeZ = 500,
  GroupReplenishInterval = 1,
  GroupSpawnId = 80055,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_34,
  GroupWeight = r0_0.RT_45,
  MonsterGroupIds = {
    8010,
    8020,
    6010,
    6020
  },
}
r4_0[80073] = {
  GroupDetectDelayTime = 3,
  GroupDetectTime = 1,
  GroupInitUnitSpawnCenterRange = r0_0.RT_14,
  GroupLevel = r0_0.RT_36,
  GroupLimit = 50,
  GroupNumber = r0_0.RT_48,
  GroupRadius = 500,
  GroupRangeZ = 500,
  GroupReplenishInterval = 1,
  GroupSpawnId = 80073,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_34,
  GroupWeight = r0_0.RT_49,
  MonsterGroupIds = {
    8010,
    8020,
    6020
  },
}
r4_0[80200] = {
  GroupDetectDelayTime = 2,
  GroupDetectTime = 0.5,
  GroupInitUnitSpawnCenterRange = r0_0.RT_9,
  GroupLevel = r0_0.RT_36,
  GroupLimit = 35,
  GroupNumber = r0_0.RT_50,
  GroupRadius = 800,
  GroupRangeZ = 500,
  GroupReplenishInterval = 1,
  GroupSpawnId = 80200,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_31,
  GroupWeight = r0_0.RT_50,
  MonsterGroupIds = r0_0.RT_51,
}
r4_0[80201] = {
  GroupDetectDelayTime = 2,
  GroupDetectTime = 0.5,
  GroupInitUnitSpawnCenterRange = r0_0.RT_14,
  GroupLevel = r0_0.RT_36,
  GroupLimit = 40,
  GroupNumber = r0_0.RT_50,
  GroupRadius = 600,
  GroupRangeZ = 500,
  GroupReplenishInterval = 1,
  GroupSpawnId = 80201,
  GroupThreshold = 35,
  GroupUnitSpawnCenterRange = r0_0.RT_25,
  GroupWeight = r0_0.RT_50,
  MonsterGroupIds = r0_0.RT_51,
}
r4_0[80501] = {
  GroupDetectDelayTime = 1,
  GroupDetectTime = 0.5,
  GroupInitUnitSpawnCenterRange = r0_0.RT_39,
  GroupLevel = r0_0.RT_36,
  GroupLimit = 40,
  GroupNumber = r0_0.RT_50,
  GroupRadius = 800,
  GroupRangeZ = 500,
  GroupReplenishInterval = 1,
  GroupSpawnId = 80501,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_40,
  GroupWeight = r0_0.RT_50,
  MonsterGroupIds = r0_0.RT_52,
}
r4_0[80502] = {
  GroupDetectDelayTime = 1,
  GroupDetectTime = 0.5,
  GroupInitUnitSpawnCenterRange = r0_0.RT_39,
  GroupLevel = r0_0.RT_36,
  GroupLimit = 30,
  GroupNumber = r0_0.RT_50,
  GroupRadius = 800,
  GroupRangeZ = 500,
  GroupReplenishInterval = 1,
  GroupSpawnId = 80502,
  GroupThreshold = 25,
  GroupUnitSpawnCenterRange = r0_0.RT_40,
  GroupWeight = r0_0.RT_50,
  MonsterGroupIds = r0_0.RT_52,
}
r4_0[90037] = {
  GroupDetectDelayTime = 0,
  GroupDetectTime = 1,
  GroupInitUnitSpawnCenterRange = r0_0.RT_9,
  GroupLevel = r0_0.RT_36,
  GroupLimit = 35,
  GroupNumber = r0_0.RT_47,
  GroupRadius = 800,
  GroupRangeZ = 500,
  GroupReplenishInterval = 1,
  GroupSpawnId = 90037,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_31,
  GroupWeight = r0_0.RT_47,
  MonsterGroupIds = {
    9010,
    9020,
    6010
  },
}
r4_0[90055] = {
  GroupDetectDelayTime = 3,
  GroupDetectTime = 1,
  GroupInitUnitSpawnCenterRange = r0_0.RT_14,
  GroupLevel = r0_0.RT_29,
  GroupLimit = 50,
  GroupNumber = r0_0.RT_45,
  GroupRadius = 500,
  GroupRangeZ = 500,
  GroupReplenishInterval = 1,
  GroupSpawnId = 90055,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_34,
  GroupWeight = r0_0.RT_45,
  MonsterGroupIds = {
    9010,
    9020,
    6010,
    6020
  },
}
r4_0[90073] = {
  GroupDetectDelayTime = 3,
  GroupDetectTime = 1,
  GroupInitUnitSpawnCenterRange = r0_0.RT_14,
  GroupLevel = r0_0.RT_36,
  GroupLimit = 50,
  GroupNumber = r0_0.RT_48,
  GroupRadius = 500,
  GroupRangeZ = 500,
  GroupReplenishInterval = 1,
  GroupSpawnId = 90073,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_34,
  GroupWeight = r0_0.RT_49,
  MonsterGroupIds = {
    9010,
    9020,
    6020
  },
}
r4_0[90200] = {
  GroupDetectDelayTime = 2,
  GroupDetectTime = 0.5,
  GroupInitUnitSpawnCenterRange = r0_0.RT_9,
  GroupLevel = r0_0.RT_36,
  GroupLimit = 35,
  GroupNumber = r0_0.RT_50,
  GroupRadius = 800,
  GroupRangeZ = 500,
  GroupReplenishInterval = 1,
  GroupSpawnId = 90200,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_31,
  GroupWeight = r0_0.RT_50,
  MonsterGroupIds = r0_0.RT_53,
}
r4_0[90201] = {
  GroupDetectDelayTime = 2,
  GroupDetectTime = 0.5,
  GroupInitUnitSpawnCenterRange = r0_0.RT_14,
  GroupLevel = r0_0.RT_36,
  GroupLimit = 40,
  GroupNumber = r0_0.RT_50,
  GroupRadius = 600,
  GroupRangeZ = 500,
  GroupReplenishInterval = 1,
  GroupSpawnId = 90201,
  GroupThreshold = 35,
  GroupUnitSpawnCenterRange = r0_0.RT_25,
  GroupWeight = r0_0.RT_50,
  MonsterGroupIds = r0_0.RT_53,
}
r4_0[90501] = {
  GroupDetectDelayTime = 1,
  GroupDetectTime = 0.5,
  GroupInitUnitSpawnCenterRange = r0_0.RT_39,
  GroupLevel = r0_0.RT_36,
  GroupLimit = 40,
  GroupNumber = r0_0.RT_50,
  GroupRadius = 800,
  GroupRangeZ = 500,
  GroupReplenishInterval = 1,
  GroupSpawnId = 90501,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_54,
  GroupWeight = r0_0.RT_50,
  MonsterGroupIds = r0_0.RT_55,
}
r4_0[90502] = {
  GroupDetectDelayTime = 1,
  GroupDetectTime = 0.5,
  GroupInitUnitSpawnCenterRange = r0_0.RT_39,
  GroupLevel = r0_0.RT_36,
  GroupLimit = 30,
  GroupNumber = r0_0.RT_50,
  GroupRadius = 800,
  GroupRangeZ = 500,
  GroupReplenishInterval = 1,
  GroupSpawnId = 90502,
  GroupThreshold = 25,
  GroupUnitSpawnCenterRange = r0_0.RT_54,
  GroupWeight = r0_0.RT_50,
  MonsterGroupIds = r0_0.RT_55,
}
r4_0[2200101] = {
  GroupDetectDelayTime = 3,
  GroupDetectTime = 1,
  GroupInitUnitSpawnCenterRange = r0_0.RT_11,
  GroupLevel = r0_0.RT_12,
  GroupLimit = 50,
  GroupNumber = r0_0.RT_13,
  GroupRadius = 600,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0.5,
  GroupSpawnId = 2200101,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_14,
  GroupWeight = r0_0.RT_15,
  MonsterGroupIds = r0_0.RT_16,
}
r4_0[2200102] = {
  GroupDetectDelayTime = 3,
  GroupDetectTime = 1,
  GroupInitUnitSpawnCenterRange = r0_0.RT_17,
  GroupLevel = r0_0.RT_12,
  GroupLimit = 50,
  GroupNumber = r0_0.RT_13,
  GroupRadius = 600,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0.5,
  GroupSpawnId = 2200102,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_17,
  GroupWeight = r0_0.RT_15,
  MonsterGroupIds = r0_0.RT_16,
}
r4_0[2200201] = {
  GroupDetectDelayTime = 3,
  GroupDetectTime = 1,
  GroupInitUnitSpawnCenterRange = r0_0.RT_11,
  GroupLevel = r0_0.RT_12,
  GroupLimit = 50,
  GroupNumber = r0_0.RT_13,
  GroupRadius = 600,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0.5,
  GroupSpawnId = 2200201,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_14,
  GroupWeight = r0_0.RT_15,
  MonsterGroupIds = r0_0.RT_18,
}
r4_0[2200202] = {
  GroupDetectDelayTime = 3,
  GroupDetectTime = 1,
  GroupInitUnitSpawnCenterRange = r0_0.RT_17,
  GroupLevel = r0_0.RT_12,
  GroupLimit = 50,
  GroupNumber = r0_0.RT_13,
  GroupRadius = 600,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0.5,
  GroupSpawnId = 2200202,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_17,
  GroupWeight = r0_0.RT_15,
  MonsterGroupIds = r0_0.RT_18,
}
r4_0[2200301] = {
  GroupDetectDelayTime = 3,
  GroupDetectTime = 1,
  GroupInitUnitSpawnCenterRange = r0_0.RT_19,
  GroupLevel = r0_0.RT_7,
  GroupLimit = 50,
  GroupNumber = r0_0.RT_20,
  GroupRadius = 600,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0.5,
  GroupSpawnId = 2200301,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_14,
  GroupWeight = r0_0.RT_21,
  MonsterGroupIds = r0_0.RT_22,
}
r4_0[2200302] = {
  GroupDetectDelayTime = 3,
  GroupDetectTime = 1,
  GroupInitUnitSpawnCenterRange = r0_0.RT_17,
  GroupLevel = r0_0.RT_7,
  GroupLimit = 50,
  GroupNumber = r0_0.RT_20,
  GroupRadius = 600,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0.5,
  GroupSpawnId = 2200302,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_17,
  GroupWeight = r0_0.RT_21,
  MonsterGroupIds = r0_0.RT_22,
}
r4_0[2200401] = {
  GroupDetectDelayTime = 3,
  GroupDetectTime = 1,
  GroupInitUnitSpawnCenterRange = r0_0.RT_11,
  GroupLevel = r0_0.RT_12,
  GroupLimit = 50,
  GroupNumber = r0_0.RT_13,
  GroupRadius = 600,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0.5,
  GroupSpawnId = 2200401,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_14,
  GroupWeight = r0_0.RT_15,
  MonsterGroupIds = r0_0.RT_18,
}
r4_0[2200402] = {
  GroupDetectDelayTime = 3,
  GroupDetectTime = 1,
  GroupInitUnitSpawnCenterRange = r0_0.RT_17,
  GroupLevel = r0_0.RT_12,
  GroupLimit = 50,
  GroupNumber = r0_0.RT_13,
  GroupRadius = 600,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0.5,
  GroupSpawnId = 2200402,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_17,
  GroupWeight = r0_0.RT_15,
  MonsterGroupIds = r0_0.RT_18,
}
r4_0[2200501] = {
  GroupDetectDelayTime = 3,
  GroupDetectTime = 1,
  GroupInitUnitSpawnCenterRange = r0_0.RT_11,
  GroupLevel = r0_0.RT_12,
  GroupLimit = 50,
  GroupNumber = r0_0.RT_13,
  GroupRadius = 600,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0.5,
  GroupSpawnId = 2200501,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_14,
  GroupWeight = r0_0.RT_15,
  MonsterGroupIds = r0_0.RT_16,
}
r4_0[2200502] = {
  GroupDetectDelayTime = 3,
  GroupDetectTime = 1,
  GroupInitUnitSpawnCenterRange = r0_0.RT_17,
  GroupLevel = r0_0.RT_12,
  GroupLimit = 50,
  GroupNumber = r0_0.RT_13,
  GroupRadius = 600,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0.5,
  GroupSpawnId = 2200502,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_17,
  GroupWeight = r0_0.RT_15,
  MonsterGroupIds = r0_0.RT_16,
}
r4_0[2200601] = {
  GroupDetectDelayTime = 3,
  GroupDetectTime = 1,
  GroupInitUnitSpawnCenterRange = r0_0.RT_19,
  GroupLevel = r0_0.RT_7,
  GroupLimit = 50,
  GroupNumber = r0_0.RT_20,
  GroupRadius = 600,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0.5,
  GroupSpawnId = 2200601,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_14,
  GroupWeight = r0_0.RT_21,
  MonsterGroupIds = r0_0.RT_22,
}
r4_0[2200602] = {
  GroupDetectDelayTime = 3,
  GroupDetectTime = 1,
  GroupInitUnitSpawnCenterRange = r0_0.RT_17,
  GroupLevel = r0_0.RT_7,
  GroupLimit = 50,
  GroupNumber = r0_0.RT_20,
  GroupRadius = 600,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0.5,
  GroupSpawnId = 2200602,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_17,
  GroupWeight = r0_0.RT_21,
  MonsterGroupIds = r0_0.RT_22,
}
r4_0[2200701] = {
  GroupDetectDelayTime = 3,
  GroupDetectTime = 1,
  GroupInitUnitSpawnCenterRange = r0_0.RT_19,
  GroupLevel = r0_0.RT_7,
  GroupLimit = 50,
  GroupNumber = r0_0.RT_20,
  GroupRadius = 600,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0.5,
  GroupSpawnId = 2200701,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_14,
  GroupWeight = r0_0.RT_21,
  MonsterGroupIds = r0_0.RT_22,
}
r4_0[2200702] = {
  GroupDetectDelayTime = 3,
  GroupDetectTime = 1,
  GroupInitUnitSpawnCenterRange = r0_0.RT_17,
  GroupLevel = r0_0.RT_7,
  GroupLimit = 50,
  GroupNumber = r0_0.RT_20,
  GroupRadius = 600,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0.5,
  GroupSpawnId = 2200702,
  GroupThreshold = 30,
  GroupUnitSpawnCenterRange = r0_0.RT_17,
  GroupWeight = r0_0.RT_21,
  MonsterGroupIds = r0_0.RT_22,
}
r4_0[6001012] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 6001012,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    6001012
  },
}
r4_0[6001013] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 6001013,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    6001013
  },
}
r4_0[6001014] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 6001014,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    6001014
  },
}
r4_0[6001016] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 6001016,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    6001016
  },
}
r4_0[6001018] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 6001018,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    6001018
  },
}
r4_0[6002011] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 6002011,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    6002011
  },
}
r4_0[6002015] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 6002015,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    6002015
  },
}
r4_0[6002016] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 6002016,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    6002016
  },
}
r4_0[6002017] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 6002017,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    6002017
  },
}
r4_0[6002018] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 6002018,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    6002018
  },
}
r4_0[6004013] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 6004013,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    6004013
  },
}
r4_0[7001011] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 7001011,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    7001011
  },
}
r4_0[7001015] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 7001015,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    7001015
  },
}
r4_0[7001016] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 7001016,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    7001016
  },
}
r4_0[7001017] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 7001017,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    7001017
  },
}
r4_0[7001018] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 7001018,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    7001018
  },
}
r4_0[7002011] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 7002011,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    7002011
  },
}
r4_0[7002012] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 7002012,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    7002012
  },
}
r4_0[7002013] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 7002013,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    7002013
  },
}
r4_0[7002014] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 7002014,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    7002014
  },
}
r4_0[7002016] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 7002016,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    7002016
  },
}
r4_0[7002018] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 7002018,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    7002018
  },
}
r4_0[7003011] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 7003011,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    7003011
  },
}
r4_0[7003015] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 7003015,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    7003015
  },
}
r4_0[7003016] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 7003016,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    7003016
  },
}
r4_0[7003017] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 7003017,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    7003017
  },
}
r4_0[7003018] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 7003018,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    7003018
  },
}
r4_0[7008601] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 7008601,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    7021
  },
}
r4_0[8001011] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8001011,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8001011
  },
}
r4_0[8001012] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8001012,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8001012
  },
}
r4_0[8001013] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8001013,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8001013
  },
}
r4_0[8001014] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8001014,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8001014
  },
}
r4_0[8001015] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8001015,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8001015
  },
}
r4_0[8001016] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8001016,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8001016
  },
}
r4_0[8001017] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8001017,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8001017
  },
}
r4_0[8001018] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8001018,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8001018
  },
}
r4_0[8001019] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8001019,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8001019
  },
}
r4_0[8001020] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8001020,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8001020
  },
}
r4_0[8001021] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8001021,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8001021
  },
}
r4_0[8001022] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8001022,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8001022
  },
}
r4_0[8001023] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8001023,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8001023
  },
}
r4_0[8001024] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8001024,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8001024
  },
}
r4_0[8002011] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8002011,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8002011
  },
}
r4_0[8002012] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8002012,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8002012
  },
}
r4_0[8002013] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8002013,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8002013
  },
}
r4_0[8002014] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8002014,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8002014
  },
}
r4_0[8002015] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8002015,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8002015
  },
}
r4_0[8002016] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8002016,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8002016
  },
}
r4_0[8002017] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8002017,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8002017
  },
}
r4_0[8002018] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8002018,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8002018
  },
}
r4_0[8002019] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8002019,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8002019
  },
}
r4_0[8002020] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8002020,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8002020
  },
}
r4_0[8002021] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8002021,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8002021
  },
}
r4_0[8002022] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8002022,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8002022
  },
}
r4_0[8002023] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8002023,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8002023
  },
}
r4_0[8002024] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8002024,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8002024
  },
}
r4_0[8002701] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8002701,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8002701
  },
}
r4_0[8002702] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8002702,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8002702
  },
}
r4_0[8002703] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8002703,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8002703
  },
}
r4_0[8003011] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8003011,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8003011
  },
}
r4_0[8003012] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8003012,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8003012
  },
}
r4_0[8003013] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8003013,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8003013
  },
}
r4_0[8003014] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8003014,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8003014
  },
}
r4_0[8003015] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8003015,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8003015
  },
}
r4_0[8003016] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8003016,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8003016
  },
}
r4_0[8003017] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8003017,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8003017
  },
}
r4_0[8003018] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8003018,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8003018
  },
}
r4_0[8003019] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8003019,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8003019
  },
}
r4_0[8003020] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8003020,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8003020
  },
}
r4_0[8003021] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8003021,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8003021
  },
}
r4_0[8003022] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8003022,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8003022
  },
}
r4_0[8003023] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8003023,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8003023
  },
}
r4_0[8003024] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8003024,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8003024
  },
}
r4_0[8003701] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8003701,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8003701
  },
}
r4_0[8003702] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8003702,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8003702
  },
}
r4_0[8003703] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 8003703,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    8003703
  },
}
r4_0[9001011] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9001011,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9001011
  },
}
r4_0[9001012] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9001012,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9001012
  },
}
r4_0[9001013] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9001013,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9001013
  },
}
r4_0[9001014] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9001014,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9001014
  },
}
r4_0[9001015] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9001015,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9001015
  },
}
r4_0[9001016] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9001016,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9001016
  },
}
r4_0[9001017] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9001017,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9001017
  },
}
r4_0[9001018] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9001018,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9001018
  },
}
r4_0[9001019] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9001019,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9001019
  },
}
r4_0[9001020] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9001020,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9001020
  },
}
r4_0[9001021] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9001021,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9001021
  },
}
r4_0[9001022] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9001022,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9001022
  },
}
r4_0[9001023] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9001023,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9001023
  },
}
r4_0[9001024] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9001024,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9001024
  },
}
r4_0[9002011] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9002011,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9002011
  },
}
r4_0[9002012] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9002012,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9002012
  },
}
r4_0[9002013] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9002013,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9002013
  },
}
r4_0[9002014] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9002014,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9002014
  },
}
r4_0[9002015] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9002015,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9002015
  },
}
r4_0[9002016] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9002016,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9002016
  },
}
r4_0[9002017] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9002017,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9002017
  },
}
r4_0[9002018] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9002018,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9002018
  },
}
r4_0[9002019] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9002019,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9002019
  },
}
r4_0[9002020] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9002020,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9002020
  },
}
r4_0[9002021] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9002021,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9002021
  },
}
r4_0[9002022] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9002022,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9002022
  },
}
r4_0[9002023] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9002023,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9002023
  },
}
r4_0[9002024] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9002024,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9002024
  },
}
r4_0[9007011] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9007011,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9007011
  },
}
r4_0[9007012] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9007012,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9007012
  },
}
r4_0[9007013] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9007013,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9007013
  },
}
r4_0[9007014] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9007014,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9007014
  },
}
r4_0[9007015] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9007015,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9007015
  },
}
r4_0[9007016] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9007016,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9007016
  },
}
r4_0[9007017] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9007017,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9007017
  },
}
r4_0[9007018] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9007018,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9007018
  },
}
r4_0[9007019] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9007019,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9007019
  },
}
r4_0[9007020] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9007020,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9007020
  },
}
r4_0[9007021] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9007021,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9007021
  },
}
r4_0[9007022] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9007022,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9007022
  },
}
r4_0[9007023] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9007023,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9007023
  },
}
r4_0[9007024] = {
  CloseGroupReplenish = true,
  GroupDetectDelayTime = 0,
  GroupDetectTime = 0,
  GroupInitUnitSpawnCenterRange = r0_0.RT_25,
  GroupLevel = r0_0.RT_26,
  GroupLimit = 60,
  GroupNumber = r0_0.RT_27,
  GroupRadius = 300,
  GroupRangeZ = 500,
  GroupReplenishInterval = 0,
  GroupSpawnId = 9007024,
  GroupThreshold = 10,
  GroupUnitSpawnCenterRange = r0_0.RT_28,
  GroupWeight = r0_0.RT_27,
  MonsterGroupIds = {
    9007024
  },
}
return r2_0(r3_0, r4_0)
