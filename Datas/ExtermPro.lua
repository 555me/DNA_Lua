-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\ExtermPro.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    9998,
    9999
  },
  RT_2 = {
    10850
  },
  RT_3 = {
    9998,
    10001
  },
  RT_4 = {
    10804
  },
  RT_5 = {
    0,
    5
  },
  RT_6 = {
    9998,
    10002
  },
  RT_7 = {
    10805
  },
  RT_8 = {
    10810
  },
  RT_9 = {
    10812
  },
  RT_10 = {
    10813
  },
  RT_11 = {
    10814
  },
  RT_12 = {
    10815
  },
  RT_13 = {
    9998,
    10005
  },
  RT_14 = {
    10816
  },
  RT_15 = {
    55,
    60
  },
  RT_16 = {
    26,
    30
  },
  RT_17 = {
    10809
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [61, 61] id: 1
  return r1_1
end
local r3_0 = "ExtermPro"
local r4_0 = {
  [31001] = {
    DungeonId = 31001,
    EliteRange = r0_0.RT_1,
    EliteSpawnOnlyRelation = false,
    EliteSpawnRule = 10801,
    NormalRange = r0_0.RT_1,
    NormalSpawnOnlyRelation = false,
    NormalSpawnRule = 10850,
    OnInitSpawnRule = r0_0.RT_2,
    TargetNum = 100,
  },
  [31002] = {
    DungeonId = 31002,
    EliteRange = r0_0.RT_1,
    EliteSpawnOnlyRelation = false,
    EliteSpawnRule = 10801,
    NormalRange = r0_0.RT_1,
    NormalSpawnOnlyRelation = false,
    NormalSpawnRule = 10850,
    OnInitSpawnRule = r0_0.RT_2,
    TargetNum = 100,
  },
  [31003] = {
    DungeonId = 31003,
    EliteRange = r0_0.RT_1,
    EliteSpawnOnlyRelation = false,
    EliteSpawnRule = 10801,
    NormalRange = r0_0.RT_1,
    NormalSpawnOnlyRelation = false,
    NormalSpawnRule = 10850,
    OnInitSpawnRule = r0_0.RT_2,
    TargetNum = 100,
  },
  [61101] = {
    DungeonId = 61101,
    EliteRange = r0_0.RT_3,
    EliteSpawnOnlyRelation = false,
    EliteSpawnRule = 10801,
    NormalRange = r0_0.RT_1,
    NormalSpawnOnlyRelation = false,
    NormalSpawnRule = 10804,
    OnInitSpawnRule = r0_0.RT_4,
    PetSpawnRange = r0_0.RT_5,
    TargetNum = 100,
  },
  [61102] = {
    DungeonId = 61102,
    EliteRange = r0_0.RT_6,
    EliteSpawnOnlyRelation = false,
    EliteSpawnRule = 10801,
    NormalRange = r0_0.RT_1,
    NormalSpawnOnlyRelation = false,
    NormalSpawnRule = 10805,
    OnInitSpawnRule = r0_0.RT_7,
    PetSpawnRange = r0_0.RT_5,
    TargetNum = 100,
  },
  [63101] = {
    DungeonId = 63101,
    EliteRange = r0_0.RT_3,
    EliteSpawnOnlyRelation = false,
    EliteSpawnRule = 10801,
    NormalRange = r0_0.RT_1,
    NormalSpawnOnlyRelation = false,
    NormalSpawnRule = 10804,
    OnInitSpawnRule = r0_0.RT_4,
    PetSpawnRange = r0_0.RT_5,
    TargetNum = 100,
  },
  [63102] = {
    DungeonId = 63102,
    EliteRange = r0_0.RT_6,
    EliteSpawnOnlyRelation = false,
    EliteSpawnRule = 10801,
    NormalRange = r0_0.RT_1,
    NormalSpawnOnlyRelation = false,
    NormalSpawnRule = 10805,
    OnInitSpawnRule = r0_0.RT_7,
    PetSpawnRange = r0_0.RT_5,
    TargetNum = 100,
  },
  [65101] = {
    DungeonId = 65101,
    EliteRange = r0_0.RT_3,
    EliteSpawnOnlyRelation = false,
    EliteSpawnRule = 10801,
    NormalRange = r0_0.RT_1,
    NormalSpawnOnlyRelation = false,
    NormalSpawnRule = 10804,
    OnInitSpawnRule = r0_0.RT_4,
    PetSpawnRange = r0_0.RT_5,
    TargetNum = 100,
  },
  [65102] = {
    DungeonId = 65102,
    EliteRange = r0_0.RT_6,
    EliteSpawnOnlyRelation = false,
    EliteSpawnRule = 10801,
    NormalRange = r0_0.RT_1,
    NormalSpawnOnlyRelation = false,
    NormalSpawnRule = 10805,
    OnInitSpawnRule = r0_0.RT_7,
    PetSpawnRange = r0_0.RT_5,
    TargetNum = 100,
  },
  [91001] = {
    DungeonId = 91001,
    EliteRange = r0_0.RT_1,
    EliteSpawnOnlyRelation = false,
    EliteSpawnRule = 10801,
    NormalRange = r0_0.RT_1,
    NormalSpawnOnlyRelation = false,
    NormalSpawnRule = 10810,
    OnInitSpawnRule = r0_0.RT_8,
    PetSpawnRange = r0_0.RT_5,
    TargetNum = 100,
  },
}
r4_0[91002] = {
  DungeonId = 91002,
  EliteRange = {
    9998,
    10000
  },
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 10801,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10811,
  OnInitSpawnRule = {
    10811
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 100,
}
r4_0[91003] = {
  DungeonId = 91003,
  EliteRange = r0_0.RT_3,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 10801,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10812,
  OnInitSpawnRule = r0_0.RT_9,
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 100,
}
r4_0[91004] = {
  DungeonId = 91004,
  EliteRange = r0_0.RT_6,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 10801,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10813,
  OnInitSpawnRule = r0_0.RT_10,
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 100,
}
r4_0[91005] = {
  DungeonId = 91005,
  EliteRange = {
    9998,
    10003
  },
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 10801,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10814,
  OnInitSpawnRule = r0_0.RT_11,
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 100,
}
r4_0[91006] = {
  DungeonId = 91006,
  EliteRange = {
    9998,
    10004
  },
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 10801,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10815,
  OnInitSpawnRule = r0_0.RT_12,
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 100,
}
r4_0[91007] = {
  DungeonId = 91007,
  EliteRange = r0_0.RT_13,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 10801,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10816,
  OnInitSpawnRule = r0_0.RT_14,
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 100,
}
r4_0[91008] = {
  DungeonId = 91008,
  EliteRange = r0_0.RT_13,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 10801,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10827,
  OnInitSpawnRule = {
    10827
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 150,
}
r4_0[91009] = {
  DungeonId = 91009,
  EliteRange = r0_0.RT_13,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 10801,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10829,
  OnInitSpawnRule = {
    10829
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 175,
}
r4_0[91010] = {
  DungeonId = 91010,
  EliteRange = r0_0.RT_13,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 10801,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10831,
  OnInitSpawnRule = {
    10831
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 200,
}
r4_0[91011] = {
  DungeonId = 91011,
  EliteRange = r0_0.RT_13,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 10801,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10833,
  OnInitSpawnRule = {
    10833
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 250,
}
r4_0[91091] = {
  DungeonId = 91091,
  EliteRange = r0_0.RT_15,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91113,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10813,
  OnInitSpawnRule = {
    10840
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 200,
}
r4_0[91092] = {
  DungeonId = 91092,
  EliteRange = r0_0.RT_15,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91114,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10813,
  OnInitSpawnRule = {
    10841
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 200,
}
r4_0[91101] = {
  DungeonId = 91101,
  EliteRange = r0_0.RT_16,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91101,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10809,
  OnInitSpawnRule = r0_0.RT_17,
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 50,
}
r4_0[91102] = {
  DungeonId = 91102,
  EliteRange = r0_0.RT_16,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91102,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10809,
  OnInitSpawnRule = r0_0.RT_17,
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 50,
}
r4_0[91103] = {
  DungeonId = 91103,
  EliteRange = r0_0.RT_16,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91103,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10809,
  OnInitSpawnRule = r0_0.RT_17,
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 50,
}
r4_0[91104] = {
  DungeonId = 91104,
  EliteRange = r0_0.RT_16,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91104,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10809,
  OnInitSpawnRule = r0_0.RT_17,
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 50,
}
r4_0[91105] = {
  DungeonId = 91105,
  EliteRange = r0_0.RT_16,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91105,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10810,
  OnInitSpawnRule = r0_0.RT_8,
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 50,
}
r4_0[91106] = {
  DungeonId = 91106,
  EliteRange = r0_0.RT_16,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91106,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10810,
  OnInitSpawnRule = r0_0.RT_8,
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 50,
}
r4_0[91107] = {
  DungeonId = 91107,
  EliteRange = r0_0.RT_15,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91107,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10812,
  OnInitSpawnRule = r0_0.RT_9,
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 100,
}
r4_0[91108] = {
  DungeonId = 91108,
  EliteRange = r0_0.RT_15,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91108,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10812,
  OnInitSpawnRule = r0_0.RT_9,
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 100,
}
r4_0[91109] = {
  DungeonId = 91109,
  EliteRange = r0_0.RT_15,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91109,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10812,
  OnInitSpawnRule = r0_0.RT_9,
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 100,
}
r4_0[91110] = {
  DungeonId = 91110,
  EliteRange = r0_0.RT_15,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91110,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10812,
  OnInitSpawnRule = r0_0.RT_9,
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 100,
}
r4_0[91111] = {
  DungeonId = 91111,
  EliteRange = r0_0.RT_15,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91111,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10812,
  OnInitSpawnRule = r0_0.RT_9,
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 100,
}
r4_0[91112] = {
  DungeonId = 91112,
  EliteRange = r0_0.RT_15,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91112,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10813,
  OnInitSpawnRule = r0_0.RT_10,
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 100,
}
r4_0[91113] = {
  DungeonId = 91113,
  EliteRange = r0_0.RT_15,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91113,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10813,
  OnInitSpawnRule = r0_0.RT_10,
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 100,
}
r4_0[91114] = {
  DungeonId = 91114,
  EliteRange = r0_0.RT_15,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91114,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10813,
  OnInitSpawnRule = r0_0.RT_10,
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 100,
}
r4_0[91115] = {
  DungeonId = 91115,
  EliteRange = r0_0.RT_15,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91115,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10813,
  OnInitSpawnRule = r0_0.RT_10,
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 100,
}
r4_0[91116] = {
  DungeonId = 91116,
  EliteRange = r0_0.RT_15,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91116,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10813,
  OnInitSpawnRule = r0_0.RT_10,
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 100,
}
r4_0[91117] = {
  DungeonId = 91117,
  EliteRange = r0_0.RT_15,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91117,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10813,
  OnInitSpawnRule = r0_0.RT_10,
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 100,
}
r4_0[91118] = {
  DungeonId = 91118,
  EliteRange = r0_0.RT_15,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91118,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10814,
  OnInitSpawnRule = r0_0.RT_11,
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 100,
}
r4_0[91119] = {
  DungeonId = 91119,
  EliteRange = r0_0.RT_15,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91119,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10814,
  OnInitSpawnRule = r0_0.RT_11,
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 100,
}
r4_0[91120] = {
  DungeonId = 91120,
  EliteRange = r0_0.RT_15,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91120,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10814,
  OnInitSpawnRule = r0_0.RT_11,
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 100,
}
r4_0[91121] = {
  DungeonId = 91121,
  EliteRange = r0_0.RT_15,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91121,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10814,
  OnInitSpawnRule = r0_0.RT_11,
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 100,
}
r4_0[91122] = {
  DungeonId = 91122,
  EliteRange = r0_0.RT_15,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91122,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10814,
  OnInitSpawnRule = r0_0.RT_11,
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 100,
}
r4_0[91123] = {
  DungeonId = 91123,
  EliteRange = r0_0.RT_15,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91123,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10814,
  OnInitSpawnRule = r0_0.RT_11,
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 100,
}
r4_0[91124] = {
  DungeonId = 91124,
  EliteRange = r0_0.RT_15,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91124,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 108141,
  OnInitSpawnRule = {
    108141
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 100,
}
r4_0[91137] = {
  DungeonId = 91137,
  EliteRange = r0_0.RT_15,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91137,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10815,
  OnInitSpawnRule = r0_0.RT_12,
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 100,
}
r4_0[91138] = {
  DungeonId = 91138,
  EliteRange = r0_0.RT_15,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91138,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10815,
  OnInitSpawnRule = r0_0.RT_12,
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 100,
}
r4_0[91139] = {
  DungeonId = 91139,
  EliteRange = r0_0.RT_15,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91139,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10815,
  OnInitSpawnRule = r0_0.RT_12,
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 100,
}
r4_0[91140] = {
  DungeonId = 91140,
  EliteRange = r0_0.RT_15,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91140,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10815,
  OnInitSpawnRule = r0_0.RT_12,
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 100,
}
r4_0[91141] = {
  DungeonId = 91141,
  EliteRange = r0_0.RT_15,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91141,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10815,
  OnInitSpawnRule = r0_0.RT_12,
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 100,
}
r4_0[91142] = {
  DungeonId = 91142,
  EliteRange = r0_0.RT_15,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91142,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10815,
  OnInitSpawnRule = r0_0.RT_12,
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 100,
}
r4_0[91143] = {
  DungeonId = 91143,
  EliteRange = r0_0.RT_15,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91143,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10816,
  OnInitSpawnRule = r0_0.RT_14,
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 100,
}
r4_0[91151] = {
  DungeonId = 91151,
  EliteRange = r0_0.RT_1,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91101,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10809,
  OnInitSpawnRule = {
    10842,
    91151,
    911510
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 200,
}
r4_0[91152] = {
  DungeonId = 91152,
  EliteRange = r0_0.RT_1,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91102,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10809,
  OnInitSpawnRule = {
    10842,
    91152,
    911520
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 200,
}
r4_0[91153] = {
  DungeonId = 91153,
  EliteRange = r0_0.RT_1,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91103,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10809,
  OnInitSpawnRule = {
    10842,
    91153,
    911530
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 200,
}
r4_0[91154] = {
  DungeonId = 91154,
  EliteRange = r0_0.RT_1,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91104,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10809,
  OnInitSpawnRule = {
    10842,
    91154,
    911540
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 200,
}
r4_0[91155] = {
  DungeonId = 91155,
  EliteRange = r0_0.RT_1,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91105,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10810,
  OnInitSpawnRule = {
    10843,
    91155,
    911550
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 200,
}
r4_0[91156] = {
  DungeonId = 91156,
  EliteRange = r0_0.RT_1,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91106,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10810,
  OnInitSpawnRule = {
    10843,
    91156,
    911560
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 200,
}
r4_0[91157] = {
  DungeonId = 91157,
  EliteRange = r0_0.RT_1,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91107,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10812,
  OnInitSpawnRule = {
    10845,
    91157,
    911570
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 200,
}
r4_0[91158] = {
  DungeonId = 91158,
  EliteRange = r0_0.RT_1,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91108,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10812,
  OnInitSpawnRule = {
    10845,
    91158,
    911580
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 200,
}
r4_0[91159] = {
  DungeonId = 91159,
  EliteRange = r0_0.RT_1,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91109,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10812,
  OnInitSpawnRule = {
    10845,
    91159,
    911590
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 200,
}
r4_0[91160] = {
  DungeonId = 91160,
  EliteRange = r0_0.RT_1,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91110,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10812,
  OnInitSpawnRule = {
    10845,
    91160,
    911600
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 200,
}
r4_0[91161] = {
  DungeonId = 91161,
  EliteRange = r0_0.RT_1,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91111,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10812,
  OnInitSpawnRule = {
    10845,
    91161,
    911610
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 200,
}
r4_0[91162] = {
  DungeonId = 91162,
  EliteRange = r0_0.RT_1,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91112,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10813,
  OnInitSpawnRule = {
    10846,
    91162,
    911620
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 200,
}
r4_0[91163] = {
  DungeonId = 91163,
  EliteRange = r0_0.RT_1,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91113,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10813,
  OnInitSpawnRule = {
    10846,
    91163,
    911630
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 200,
}
r4_0[91164] = {
  DungeonId = 91164,
  EliteRange = r0_0.RT_1,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91114,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10813,
  OnInitSpawnRule = {
    10846,
    91164,
    911640
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 200,
}
r4_0[91165] = {
  DungeonId = 91165,
  EliteRange = r0_0.RT_1,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91115,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10813,
  OnInitSpawnRule = {
    10846,
    91165,
    911650
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 200,
}
r4_0[91166] = {
  DungeonId = 91166,
  EliteRange = r0_0.RT_1,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91116,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10813,
  OnInitSpawnRule = {
    10846,
    91166,
    911660
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 200,
}
r4_0[91167] = {
  DungeonId = 91167,
  EliteRange = r0_0.RT_1,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91117,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10813,
  OnInitSpawnRule = {
    10846,
    91167,
    911670
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 200,
}
r4_0[91168] = {
  DungeonId = 91168,
  EliteRange = r0_0.RT_1,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91118,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10814,
  OnInitSpawnRule = {
    10847,
    91168,
    911680
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 200,
}
r4_0[91169] = {
  DungeonId = 91169,
  EliteRange = r0_0.RT_1,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91119,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10814,
  OnInitSpawnRule = {
    10847,
    91169,
    911690
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 200,
}
r4_0[91170] = {
  DungeonId = 91170,
  EliteRange = r0_0.RT_1,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91120,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10814,
  OnInitSpawnRule = {
    10847,
    91170,
    911700
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 200,
}
r4_0[91171] = {
  DungeonId = 91171,
  EliteRange = r0_0.RT_1,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91121,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10814,
  OnInitSpawnRule = {
    10847,
    91171,
    911710
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 200,
}
r4_0[91172] = {
  DungeonId = 91172,
  EliteRange = r0_0.RT_1,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91122,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10814,
  OnInitSpawnRule = {
    10847,
    91172,
    911720
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 200,
}
r4_0[91173] = {
  DungeonId = 91173,
  EliteRange = r0_0.RT_1,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91123,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10814,
  OnInitSpawnRule = {
    10847,
    91173,
    911730
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 200,
}
r4_0[91174] = {
  DungeonId = 91174,
  EliteRange = r0_0.RT_1,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91137,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10815,
  OnInitSpawnRule = {
    10848,
    91174,
    911740
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 200,
}
r4_0[91175] = {
  DungeonId = 91175,
  EliteRange = r0_0.RT_1,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91138,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10815,
  OnInitSpawnRule = {
    10848,
    91175,
    911750
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 200,
}
r4_0[91176] = {
  DungeonId = 91176,
  EliteRange = r0_0.RT_1,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91139,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10815,
  OnInitSpawnRule = {
    10848,
    91176,
    911760
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 200,
}
r4_0[91177] = {
  DungeonId = 91177,
  EliteRange = r0_0.RT_1,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91140,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10815,
  OnInitSpawnRule = {
    10848,
    91177,
    911770
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 200,
}
r4_0[91178] = {
  DungeonId = 91178,
  EliteRange = r0_0.RT_1,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91141,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10815,
  OnInitSpawnRule = {
    10848,
    91178,
    911780
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 200,
}
r4_0[91179] = {
  DungeonId = 91179,
  EliteRange = r0_0.RT_1,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91142,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10815,
  OnInitSpawnRule = {
    10848,
    91179,
    911790
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 200,
}
r4_0[91180] = {
  DungeonId = 91180,
  EliteRange = r0_0.RT_1,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91143,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10816,
  OnInitSpawnRule = {
    10849,
    91180,
    911800
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 200,
}
r4_0[91185] = {
  DungeonId = 91185,
  EliteRange = r0_0.RT_1,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91143,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10816,
  OnInitSpawnRule = {
    10851,
    91185,
    911850
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 200,
}
r4_0[91186] = {
  DungeonId = 91186,
  EliteRange = r0_0.RT_1,
  EliteSpawnOnlyRelation = false,
  EliteSpawnRule = 91143,
  NormalRange = r0_0.RT_1,
  NormalSpawnOnlyRelation = false,
  NormalSpawnRule = 10816,
  OnInitSpawnRule = {
    10851,
    91186,
    911860
  },
  PetSpawnRange = r0_0.RT_5,
  TargetNum = 200,
}
return r2_0(r3_0, r4_0)
