-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\CombatCondition.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    800203
  },
  RT_2 = {
    Key = "Sword",
  },
  RT_3 = {
    KeyName = "Loli",
  },
  RT_4 = {
    BuffId = 110302,
  },
  RT_5 = {
    BuffId = 110331,
  },
  RT_6 = {
    KeyName = "Woman",
  },
  RT_7 = {
    KeyName = "Man",
  },
  RT_8 = {
    BuffId = 120101,
  },
  RT_9 = {
    BuffId = 15,
  },
  RT_10 = {
    BuffId = 150111,
  },
  RT_11 = {
    Int = 0,
    Key = "Skill01Count2",
  },
  RT_12 = {
    150206
  },
  RT_13 = {
    Int = 0,
    Key = "Skill01Count1",
  },
  RT_14 = {
    150205
  },
  RT_15 = {
    BuffId = 150221,
  },
  RT_16 = {
    CompareBase = 1000,
    CompareBaseInt = 1,
    Key = "Default",
    SummonId = 180101,
  },
  RT_17 = {
    CompareBaseInt = 1,
    Int = 20405,
  },
  RT_18 = {
    901
  },
  RT_19 = {
    BuffId = 210202,
  },
  RT_20 = {
    CompareBaseInt = 0,
    CompareLogic = "Equal",
  },
  RT_21 = {
    310124
  },
  RT_22 = {
    BuffId = 310301,
  },
  RT_23 = {
    BuffId = 310303,
  },
  RT_24 = {
    Key = "ToExplode",
  },
  RT_25 = {
    BuffId = 320111,
  },
  RT_26 = {
    BuffId = 320113,
  },
  RT_27 = {
    BuffId = 410101,
  },
  RT_28 = {
    Key = "SuperFallAttack",
  },
  RT_29 = {
    KeyName = "Hook",
  },
  RT_30 = {
    BuffId = 510106,
  },
  RT_31 = {
    BuffId = 530100,
  },
  RT_32 = {
    CompareBase = 0.15,
  },
  RT_33 = {
    BuffId = 106,
  },
  RT_34 = {
    SkillGrade = 1,
  },
  RT_35 = {
    SkillGrade = 2,
  },
  RT_36 = {
    SkillGrade = 4,
  },
  RT_37 = {
    SkillGrade = 6,
  },
  RT_38 = {
    PartId = 1,
  },
  RT_39 = {
    PartId = 2,
  },
  RT_40 = {
    PartId = 3,
  },
  RT_41 = {
    PartId = 4,
  },
  RT_42 = {
    RelativeAngle = 180,
  },
  RT_43 = {
    HpPercent = 0.45,
  },
  RT_44 = {
    KeyName = "PartIsAlive",
  },
  RT_45 = {
    RelativeDis = 2300,
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [145, 145] id: 1
  return r1_1
end
local r3_0 = "CombatCondition"
local r4_0 = {
  [1] = {
    Id = 1,
  },
  [2] = {
    FuncName = "Not_HpMax",
    Id = 2,
  },
  [3] = {
    FuncName = "Not_SpMax",
    Id = 3,
  },
  [4] = {
    FuncName = "Not_BulletMax",
    Id = 4,
  },
}
r4_0[5] = {
  ConditionVars = {
    BuffId = 50,
    CompareBaseInt = 4,
    CompareLogic = "Less",
  },
  FuncName = "Check_Buff_Layer",
  Id = 5,
}
r4_0[6] = {
  FuncName = "Is_In_SkillFeature",
  Id = 6,
  Not = true,
}
r4_0[8] = {
  FuncName = "Sp_Zero",
  Id = 8,
}
r4_0[9] = {
  FuncName = "Is_In_SkillFeature",
  Id = 9,
}
r4_0[11] = {
  FuncName = "Not_In_Battle",
  Id = 11,
}
r4_0[15] = {
  ConditionVars = r0_0.RT_9,
  FuncName = "Check_Buff",
  Id = 15,
}
r4_0[16] = {
  ConditionVars = r0_0.RT_9,
  FuncName = "Check_Buff",
  Id = 16,
  Not = true,
}
r4_0[20] = {
  FuncName = "Is_In_Air",
  Id = 20,
}
r4_0[21] = {
  FuncName = "Is_In_Air",
  Id = 21,
  Not = true,
}
r4_0[22] = {
  FuncName = "Not_Attack_Hold",
  Id = 22,
}
r4_0[23] = {
  ConditionVars = {
    Key = "Attack",
  },
  FuncName = "Press_Attack",
  Id = 23,
}
r4_0[24] = {
  FuncName = "Magazine_Is_Full",
  Id = 24,
}
r4_0[25] = {
  ConditionVars = r0_0.RT_20,
  FuncName = "Check_No_Bullet",
  Id = 25,
}
r4_0[26] = {
  FuncName = "Skill1_Hold",
  Id = 26,
  Not = true,
}
r4_0[27] = {
  FuncName = "Skill2_Hold",
  Id = 27,
  Not = true,
}
r4_0[28] = {
  FuncName = "Is_FallAttack_Landed",
  Id = 28,
}
r4_0[29] = {
  FuncName = "Not_Shoot_Hold",
  Id = 29,
}
r4_0[30] = {
  FuncName = "IsInteractive",
  Id = 30,
  Not = true,
}
r4_0[31] = {
  FuncName = "Has_Movement_Input",
  Id = 31,
}
r4_0[32] = {
  FuncName = "Not_Shoot_Hold",
  Id = 32,
  Not = true,
  Or = r0_0.RT_18,
}
r4_0[33] = {
  FuncName = "Has_Movement_Input",
  Id = 33,
  Not = true,
}
r4_0[34] = {
  FuncName = "Is_In_BulletJump",
  Id = 34,
}
r4_0[35] = {
  FuncName = "Is_Flying",
  Id = 35,
}
r4_0[36] = {
  FuncName = "Is_Idle",
  Id = 36,
}
r4_0[37] = {
  FuncName = "Is_Seating",
  Id = 37,
}
r4_0[38] = {
  FuncName = "Bullet_Zero",
  Id = 38,
}
r4_0[39] = {
  FuncName = "Press_AnyAttack",
  Id = 39,
  Or = r0_0.RT_18,
}
r4_0[40] = {
  FuncName = "Not_Attack_Hold",
  Id = 40,
  Not = true,
  Or = r0_0.RT_18,
}
r4_0[41] = {
  FuncName = "Magazine_Zero",
  Id = 41,
  Not = true,
}
r4_0[42] = {
  FuncName = "Magazine_Zero",
  Id = 42,
}
r4_0[43] = {
  FuncName = "Is_Shooting",
  Id = 43,
  Not = true,
}
r4_0[44] = {
  ConditionVars = r0_0.RT_20,
  FuncName = "Check_No_Bullet",
  Id = 44,
  Not = true,
}
r4_0[52] = {
  FuncName = "Check_Mon_Region_EscapingFromBattle",
  Id = 52,
}
r4_0[54] = {
  FuncName = "Check_Mon_Dungeon_EscapingFromBattle",
  Id = 54,
}
r4_0[60] = {
  ConditionVars = {
    BuffId = 101,
  },
  FuncName = "Check_Buff",
  Id = 60,
}
r4_0[61] = {
  ConditionVars = {
    BuffId = 102,
  },
  FuncName = "Check_Buff",
  Id = 61,
}
r4_0[62] = {
  ConditionVars = {
    BuffId = 103,
  },
  FuncName = "Check_Buff",
  Id = 62,
}
r4_0[63] = {
  ConditionVars = {
    BuffId = 104,
  },
  FuncName = "Check_Buff",
  Id = 63,
}
r4_0[64] = {
  ConditionVars = {
    BuffId = 105,
  },
  FuncName = "Check_Buff",
  Id = 64,
}
r4_0[65] = {
  ConditionVars = r0_0.RT_33,
  FuncName = "Check_Buff",
  Id = 65,
}
r4_0[66] = {
  FuncName = "Is_In_Stun",
  Id = 66,
}
r4_0[67] = {
  ConditionVars = {
    Int = 70,
  },
  FuncName = "Can_Interactive_Paotai",
  Id = 67,
}
r4_0[68] = {
  ConditionVars = {
    Int = 71,
  },
  FuncName = "Check_Buff_Type",
  Id = 68,
  Not = true,
}
r4_0[69] = {
  FuncName = "CheckInSquadDungeon",
  Id = 69,
  Not = true,
}
r4_0[71] = {
  ConditionVars = r0_0.RT_34,
  FuncName = "Check_Skill_Grade",
  Id = 71,
}
r4_0[72] = {
  ConditionVars = r0_0.RT_35,
  FuncName = "Check_Skill_Grade",
  Id = 72,
}
r4_0[74] = {
  ConditionVars = r0_0.RT_36,
  FuncName = "Check_Skill_Grade",
  Id = 74,
}
r4_0[76] = {
  ConditionVars = r0_0.RT_37,
  FuncName = "Check_Skill_Grade",
  Id = 76,
}
r4_0[81] = {
  FuncName = "Is_PlayerCharacter",
  Id = 81,
}
r4_0[82] = {
  FuncName = "Is_MonsterCharacter",
  Id = 82,
}
r4_0[91] = {
  ConditionVars = r0_0.RT_34,
  FuncName = "Check_Skill_Grade",
  Id = 91,
  Not = true,
}
r4_0[92] = {
  ConditionVars = r0_0.RT_35,
  FuncName = "Check_Skill_Grade",
  Id = 92,
  Not = true,
}
r4_0[94] = {
  ConditionVars = r0_0.RT_36,
  FuncName = "Check_Skill_Grade",
  Id = 94,
  Not = true,
}
r4_0[96] = {
  ConditionVars = r0_0.RT_37,
  FuncName = "Check_Skill_Grade",
  Id = 96,
  Not = true,
}
r4_0[100] = {
  FuncName = "hit_target",
  Id = 100,
}
r4_0[101] = {
  FuncName = "effect_hit_target",
  Id = 101,
}
r4_0[102] = {
  FuncName = "Check_TriggerProb",
  Id = 102,
}
r4_0[103] = {
  FuncName = "IsRecovering",
  Id = 103,
  Not = true,
}
r4_0[104] = {
  FuncName = "Check_TriggerProb_Ranged",
  Id = 104,
}
r4_0[110] = {
  ConditionVars = r0_0.RT_3,
  FuncName = "Check_Char_Tag",
  Id = 110,
}
r4_0[111] = {
  ConditionVars = r0_0.RT_3,
  FuncName = "Check_Char_Tag",
  Id = 111,
  Not = true,
}
r4_0[112] = {
  ConditionVars = {
    KeyName = "Girl",
  },
  FuncName = "Check_Char_Tag",
  Id = 112,
}
r4_0[113] = {
  ConditionVars = r0_0.RT_6,
  FuncName = "Check_Char_Tag",
  Id = 113,
}
r4_0[114] = {
  ConditionVars = {
    KeyName = "Boy",
  },
  FuncName = "Check_Char_Tag",
  Id = 114,
}
r4_0[115] = {
  ConditionVars = r0_0.RT_7,
  FuncName = "Check_Char_Tag",
  Id = 115,
}
r4_0[116] = {
  ConditionVars = r0_0.RT_7,
  FuncName = "Check_Char_Tag",
  Id = 116,
  Or = {
    114
  },
}
r4_0[117] = {
  ConditionVars = r0_0.RT_6,
  FuncName = "Check_Char_Tag",
  Id = 117,
  Or = {
    110,
    112
  },
}
r4_0[200] = {
  FuncName = "Summoner_Skill1_Hold",
  Id = 200,
  Not = true,
}
r4_0[210] = {
  ConditionVars = {
    CompareBaseInt = 0,
  },
  FuncName = "SummonNumMore_Arbitray",
  Id = 210,
}
r4_0[211] = {
  ConditionVars = {
    CompareBaseInt = 1,
  },
  FuncName = "SummonNumMore_Arbitray",
  Id = 211,
}
r4_0[212] = {
  ConditionVars = {
    CompareBaseInt = 2,
  },
  FuncName = "SummonNumMore_Arbitray",
  Id = 212,
}
r4_0[213] = {
  FuncName = "IsRealSummon",
  Id = 213,
}
r4_0[300] = {
  FuncName = "Is_In_Rouge",
  Id = 300,
}
r4_0[301] = {
  FuncName = "Is_In_Rouge",
  Id = 301,
  Not = true,
}
r4_0[415] = {
  ConditionVars = {
    CompareBase = 0.25,
    CompareLogic = "Less",
    Key = "HpPercent",
  },
  FuncName = "Check_Attr_Self",
  Id = 415,
}
r4_0[500] = {
  FuncName = "Can_Gesture",
  Id = 500,
}
r4_0[501] = {
  FuncName = "Can_BattleProp",
  Id = 501,
}
r4_0[502] = {
  FuncName = "IsQuestRole",
  Id = 502,
  Not = true,
}
r4_0[503] = {
  FuncName = "Is_FromArmory",
  Id = 503,
}
r4_0[504] = {
  FuncName = "Is_FromArmory",
  Id = 504,
  Not = true,
}
r4_0[505] = {
  ConditionVars = r0_0.RT_29,
  FuncName = "Is_InCharacterTag",
  Id = 505,
}
r4_0[506] = {
  ConditionVars = r0_0.RT_29,
  FuncName = "Is_InCharacterTag",
  Id = 506,
  Not = true,
}
r4_0[900] = {
  ConditionVars = r0_0.RT_45,
  FuncName = "Phantom_OwnerDis",
  Id = 900,
}
r4_0[901] = {
  FuncName = "Is_Phantom",
  Id = 901,
}
r4_0[902] = {
  ConditionVars = r0_0.RT_45,
  FuncName = "Phantom_OwnerDis",
  Id = 902,
  Not = true,
}
r4_0[903] = {
  ConditionVars = {
    RelativeDis = 750,
  },
  FuncName = "Phantom_OwnerDis",
  Id = 903,
}
r4_0[904] = {
  ConditionVars = {
    CompareBase = 30,
  },
  FuncName = "Phantom_BulletJump",
  Id = 904,
}
r4_0[905] = {
  ConditionVars = {
    CompareBaseInt = 4,
  },
  FuncName = "Check_ComboLevel",
  Id = 905,
}
r4_0[906] = {
  FuncName = "Is_Phantom",
  Id = 906,
  Not = true,
}
r4_0[907] = {
  ConditionVars = {
    RelativeDis = 300,
  },
  FuncName = "Phantom_OwnerDis",
  Id = 907,
}
r4_0[908] = {
  And = {
    906
  },
  FuncName = "Not_Shoot_Hold",
  Id = 908,
}
r4_0[911] = {
  FuncName = "Can_Phantom_Summon_Num",
  Id = 911,
}
r4_0[912] = {
  FuncName = "Can_Phantom_Summon_Id",
  Id = 912,
}
r4_0[913] = {
  FuncName = "Is_Phantom_Dispatching",
  Id = 913,
  Not = true,
}
r4_0[921] = {
  ConditionVars = {
    CompareBase = 0.4,
  },
  FuncName = "Is_TeamHp_Below",
  Id = 921,
}
r4_0[922] = {
  ConditionVars = {
    CompareBase = 0.9,
  },
  FuncName = "Is_TeamHp_Below",
  Id = 922,
}
r4_0[923] = {
  ConditionVars = {
    CompareBase = 0.8,
  },
  FuncName = "Is_TeamSp_Below",
  Id = 923,
}
r4_0[1001] = {
  ConditionVars = {
    Key = "Dark",
  },
  FuncName = "Check_Attr_Element",
  Id = 1001,
}
r4_0[1002] = {
  ConditionVars = {
    Key = "Water",
  },
  FuncName = "Check_Attr_Element",
  Id = 1002,
}
r4_0[1003] = {
  ConditionVars = {
    Key = "Fire",
  },
  FuncName = "Check_Attr_Element",
  Id = 1003,
}
r4_0[1004] = {
  ConditionVars = {
    Key = "Thunder",
  },
  FuncName = "Check_Attr_Element",
  Id = 1004,
}
r4_0[1005] = {
  ConditionVars = {
    Key = "Wind",
  },
  FuncName = "Check_Attr_Element",
  Id = 1005,
}
r4_0[1006] = {
  ConditionVars = {
    Key = "Light",
  },
  FuncName = "Check_Attr_Element",
  Id = 1006,
}
r4_0[1007] = {
  ConditionVars = {
    Int = 2,
  },
  FuncName = "Check_Team_Same_Element",
  Id = 1007,
}
r4_0[1011] = {
  ConditionVars = r0_0.RT_2,
  FuncName = "Check_Excel_Weapon",
  Id = 1011,
}
r4_0[1012] = {
  ConditionVars = {
    Key = "Polearm",
  },
  FuncName = "Check_Excel_Weapon",
  Id = 1012,
}
r4_0[1013] = {
  ConditionVars = {
    Key = "Claymore",
  },
  FuncName = "Check_Excel_Weapon",
  Id = 1013,
}
r4_0[1014] = {
  ConditionVars = {
    Key = "Dualblade",
  },
  FuncName = "Check_Excel_Weapon",
  Id = 1014,
}
r4_0[1015] = {
  ConditionVars = {
    Key = "Swordwhip",
  },
  FuncName = "Check_Excel_Weapon",
  Id = 1015,
}
r4_0[1016] = {
  ConditionVars = {
    Key = "Katana",
  },
  FuncName = "Check_Excel_Weapon",
  Id = 1016,
}
r4_0[1021] = {
  ConditionVars = {
    Key = "Pistol",
  },
  FuncName = "Check_Excel_Weapon",
  Id = 1021,
}
r4_0[1022] = {
  ConditionVars = {
    Key = "Crossbow",
  },
  FuncName = "Check_Excel_Weapon",
  Id = 1022,
}
r4_0[1023] = {
  ConditionVars = {
    Key = "Cannon",
  },
  FuncName = "Check_Excel_Weapon",
  Id = 1023,
}
r4_0[1024] = {
  ConditionVars = {
    Key = "Shotgun",
  },
  FuncName = "Check_Excel_Weapon",
  Id = 1024,
}
r4_0[1025] = {
  ConditionVars = {
    Key = "Machinegun",
  },
  FuncName = "Check_Excel_Weapon",
  Id = 1025,
}
r4_0[1026] = {
  ConditionVars = {
    Key = "Bow",
  },
  FuncName = "Check_Excel_Weapon",
  Id = 1026,
}
r4_0[1031] = {
  ConditionVars = r0_0.RT_2,
  FuncName = "Check_Excel_Weapon",
  Id = 1031,
  Or = {
    1025
  },
}
r4_0[10001] = {
  FuncName = "Is_PlayerCharacter",
  Id = 10001,
}
r4_0[10002] = {
  And = {
    10003
  },
  FuncName = "Is_MonsterCharacter",
  Id = 10002,
}
r4_0[10003] = {
  ConditionVars = {
    MonsterId = 7011101,
  },
  FuncName = "Check_Mon_UnitId",
  Id = 10003,
  Not = true,
}
r4_0[110101] = {
  ConditionVars = {
    BuffId = 110101,
  },
  FuncName = "Check_Buff",
  Id = 110101,
}
r4_0[110102] = {
  FuncName = "Check_Heitao_SkillGrade6",
  Id = 110102,
}
r4_0[110201] = {
  ConditionVars = {
    BuffId = 110232,
    CompareBaseInt = 6,
    CompareLogic = "Less",
  },
  FuncName = "Check_Buff_Layer",
  Id = 110201,
}
r4_0[110211] = {
  ConditionVars = {
    BuffId = 110232,
    CompareBaseInt = 1,
    CompareLogic = "NotLess",
  },
  FuncName = "Check_Buff_Layer",
  Id = 110211,
}
r4_0[110301] = {
  ConditionVars = r0_0.RT_4,
  FuncName = "Check_Buff",
  Id = 110301,
}
r4_0[110302] = {
  ConditionVars = {
    CompareBase = 0.8,
    CompareLogic = "NotLess",
  },
  FuncName = "Check_SecondSpRate",
  Id = 110302,
}
r4_0[110311] = {
  ConditionVars = r0_0.RT_4,
  FuncName = "Check_Buff",
  Id = 110311,
  Not = true,
}
r4_0[110312] = {
  ConditionVars = r0_0.RT_5,
  FuncName = "Check_Buff",
  Id = 110312,
  Not = true,
}
r4_0[110313] = {
  ConditionVars = r0_0.RT_5,
  FuncName = "Check_Buff",
  Id = 110313,
}
r4_0[110401] = {
  ConditionVars = {
    Key = "Qiuxian_Skill01_Grade2",
  },
  FuncName = "Check_Key_Bool",
  Id = 110401,
}
r4_0[110441] = {
  ConditionVars = {
    CompareBase = 0.3,
    CompareLogic = "Greater",
  },
  FuncName = "Check_Char_AO",
  Id = 110441,
}
r4_0[110442] = {
  ConditionVars = {
    CompareBase = -0.3,
    CompareLogic = "Less",
  },
  FuncName = "Check_Char_AO",
  Id = 110442,
}
r4_0[120101] = {
  ConditionVars = r0_0.RT_8,
  FuncName = "Check_Buff",
  Id = 120101,
}
r4_0[120102] = {
  ConditionVars = r0_0.RT_8,
  FuncName = "Check_Buff",
  Id = 120102,
  Not = true,
}
r4_0[120201] = {
  ConditionVars = {
    CompareBase = 0.251,
  },
  FuncName = "Is_Hp_Above",
  Id = 120201,
}
r4_0[150101] = {
  ConditionVars = {
    Key = "BaonuEnd",
  },
  FuncName = "Check_Key_Bool",
  Id = 150101,
  Or = {
    22
  },
}
r4_0[150102] = {
  ConditionVars = {
    Key = "BaonuInAir",
  },
  FuncName = "Check_Key_Bool",
  Id = 150102,
}
r4_0[150103] = {
  ConditionVars = {
    BuffId = 150102,
  },
  FuncName = "Check_Buff",
  Id = 150103,
}
r4_0[150104] = {
  ConditionVars = r0_0.RT_10,
  FuncName = "Check_Buff",
  Id = 150104,
}
r4_0[150111] = {
  ConditionVars = {
    Key = "BaonuFinish",
  },
  FuncName = "Check_Key_Bool",
  Id = 150111,
}
r4_0[150141] = {
  ConditionVars = r0_0.RT_10,
  FuncName = "Check_Buff",
  Id = 150141,
  Not = true,
}
r4_0[150201] = {
  ConditionVars = r0_0.RT_11,
  FuncName = "Check_Key_Int",
  Id = 150201,
  Or = r0_0.RT_12,
}
r4_0[150202] = {
  ConditionVars = r0_0.RT_13,
  FuncName = "Check_Key_Int",
  Id = 150202,
  Or = r0_0.RT_12,
}
r4_0[150203] = {
  And = r0_0.RT_14,
  ConditionVars = r0_0.RT_11,
  FuncName = "Check_Key_Int",
  Id = 150203,
  Not = true,
}
r4_0[150204] = {
  And = r0_0.RT_14,
  ConditionVars = r0_0.RT_13,
  FuncName = "Check_Key_Int",
  Id = 150204,
  Not = true,
}
r4_0[150205] = {
  ConditionVars = r0_0.RT_15,
  FuncName = "Check_Buff",
  Id = 150205,
}
r4_0[150206] = {
  ConditionVars = r0_0.RT_15,
  FuncName = "Check_Buff",
  Id = 150206,
  Not = true,
}
r4_0[150301] = {
  ConditionVars = {
    BuffId = 150305,
  },
  FuncName = "Check_Buff",
  Id = 150301,
}
r4_0[150302] = {
  ConditionVars = {
    BuffId = 150306,
  },
  FuncName = "Check_Buff",
  Id = 150302,
}
r4_0[150303] = {
  ConditionVars = {
    BuffId = 150325,
  },
  FuncName = "Check_Buff",
  Id = 150303,
}
r4_0[150402] = {
  ConditionVars = {
    BuffId = 150402,
    CompareBaseInt = 100,
    CompareLogic = "NotLess",
  },
  FuncName = "Check_Buff_Layer",
  Id = 150402,
  Or = r0_0.RT_12,
}
r4_0[150403] = {
  ConditionVars = {
    BuffId = 150401,
  },
  FuncName = "Check_Buff",
  Id = 150403,
}
r4_0[150404] = {
  ConditionVars = {
    BuffId = 150407,
  },
  FuncName = "Check_Buff",
  Id = 150404,
}
r4_0[150501] = {
  ConditionVars = {
    BuffId = 150503,
  },
  FuncName = "Check_Buff",
  Id = 150501,
}
r4_0[150502] = {
  ConditionVars = {
    BuffId = 150531,
  },
  FuncName = "Check_Buff",
  Id = 150502,
}
r4_0[180101] = {
  ConditionVars = r0_0.RT_16,
  FuncName = "SummonInRange",
  Id = 180101,
  Not = true,
}
r4_0[180102] = {
  ConditionVars = r0_0.RT_16,
  FuncName = "SummonInRange",
  Id = 180102,
}
r4_0[180104] = {
  ConditionVars = r0_0.RT_16,
  FuncName = "SummonInRange",
  Id = 180104,
}
r4_0[180111] = {
  ConditionVars = {
    BuffId = 180102,
  },
  FuncName = "Check_Buff",
  Id = 180111,
}
r4_0[210101] = {
  ConditionVars = {
    CompareBase = 1500,
    Key = "SummonNum",
    SummonId = 210101,
  },
  FuncName = "SummonInRange",
  Id = 210101,
}
r4_0[210201] = {
  ConditionVars = {
    Int = 0,
    Key = "PassiveWaitingNum",
  },
  FuncName = "Check_Creater_Key_Int",
  Id = 210201,
  Not = true,
}
r4_0[210202] = {
  ConditionVars = r0_0.RT_19,
  FuncName = "CheckCreaterBuff",
  Id = 210202,
}
r4_0[210203] = {
  ConditionVars = r0_0.RT_19,
  FuncName = "Check_Buff",
  Id = 210203,
}
r4_0[230101] = {
  ConditionVars = {
    CompareBase = 1500,
    Key = "SummonNum",
    SummonId = 230101,
  },
  FuncName = "SummonInRange",
  Id = 230101,
}
r4_0[240101] = {
  ConditionVars = {
    CompareBase = 1500,
    Key = "SummonNum",
    SummonId = 240101,
  },
  FuncName = "SummonInRange",
  Id = 240101,
}
r4_0[240102] = {
  ConditionVars = {
    CompareBase = 0.6,
  },
  FuncName = "Is_TeamHp_Below",
  Id = 240102,
}
r4_0[310120] = {
  ConditionVars = {
    BuffId = 310120,
  },
  FuncName = "Check_Buff",
  Id = 310120,
  Or = r0_0.RT_21,
}
r4_0[310121] = {
  ConditionVars = {
    BuffId = 310124,
    CompareBaseInt = 10,
    CompareLogic = "Less",
  },
  FuncName = "Check_Buff_Layer",
  Id = 310121,
}
r4_0[310122] = {
  ConditionVars = {
    BuffId = 310124,
    CompareBaseInt = 10,
    CompareLogic = "NotLess",
  },
  FuncName = "Check_Buff_Layer",
  Id = 310122,
}
r4_0[310123] = {
  ConditionVars = {
    BuffId = 310124,
    CompareBaseInt = 25,
    CompareLogic = "NotLess",
  },
  FuncName = "Check_Buff_Layer",
  Id = 310123,
}
r4_0[310124] = {
  ConditionVars = {
    BuffId = 310121,
  },
  FuncName = "Check_Buff",
  Id = 310124,
}
r4_0[310201] = {
  ConditionVars = {
    CompareBase = 1000,
    CompareBaseInt = 6,
    Key = "Default",
    SummonId = 310202,
  },
  FuncName = "SummonInRange",
  Id = 310201,
}
r4_0[310202] = {
  FuncName = "Check_Xier_InSkill2",
  Id = 310202,
  Not = true,
}
r4_0[310203] = {
  ConditionVars = {
    Height = 125,
  },
  FuncName = "Is_HighEnough",
  Id = 310203,
}
r4_0[310301] = {
  ConditionVars = r0_0.RT_22,
  FuncName = "Check_Buff",
  Id = 310301,
}
r4_0[310302] = {
  ConditionVars = r0_0.RT_22,
  FuncName = "Check_Buff",
  Id = 310302,
  Not = true,
}
r4_0[310303] = {
  ConditionVars = r0_0.RT_23,
  FuncName = "Check_Yeer_Skill01A",
  Id = 310303,
}
r4_0[310304] = {
  ConditionVars = r0_0.RT_23,
  FuncName = "Check_Yeer_Skill01B",
  Id = 310304,
}
r4_0[310305] = {
  ConditionVars = r0_0.RT_24,
  FuncName = "Check_Key_Bool",
  Id = 310305,
}
r4_0[310306] = {
  ConditionVars = r0_0.RT_24,
  FuncName = "Check_Key_Bool",
  Id = 310306,
  Not = true,
}
r4_0[320101] = {
  ConditionVars = {
    BuffId = 320111,
    CompareBase = 3,
  },
  FuncName = "Check_Buff_LastTime",
  Id = 320101,
}
r4_0[320111] = {
  ConditionVars = r0_0.RT_25,
  FuncName = "Check_Buff",
  Id = 320111,
}
r4_0[320112] = {
  ConditionVars = r0_0.RT_25,
  FuncName = "Check_Buff",
  Id = 320112,
  Not = true,
}
r4_0[320113] = {
  ConditionVars = r0_0.RT_26,
  FuncName = "Check_Buff",
  Id = 320113,
}
r4_0[320114] = {
  ConditionVars = r0_0.RT_26,
  FuncName = "Check_Buff",
  Id = 320114,
  Not = true,
}
r4_0[320201] = {
  ConditionVars = {
    BuffId = 320202,
  },
  FuncName = "Check_Buff",
  Id = 320201,
}
r4_0[330101] = {
  FuncName = "Check_Maer_Skill01_Grade2",
  Id = 330101,
}
r4_0[330102] = {
  FuncName = "Check_Maer_PassiveBuff",
  Id = 330102,
}
r4_0[330103] = {
  ConditionVars = {
    BuffId = 330101,
    CompareBaseInt = 5,
    CompareLogic = "NotLess",
  },
  FuncName = "Check_Buff_Layer",
  Id = 330103,
}
r4_0[330104] = {
  FuncName = "Check_Maer_Skill01_Target",
  Id = 330104,
}
r4_0[330111] = {
  ConditionVars = {
    Key = "Maer_Skill02_Level1",
  },
  FuncName = "Check_Key_Bool",
  Id = 330111,
}
r4_0[330112] = {
  ConditionVars = {
    Key = "Maer_Skill02_Level2",
  },
  FuncName = "Check_Key_Bool",
  Id = 330112,
}
r4_0[330113] = {
  ConditionVars = {
    Key = "Maer_Skill02_Level3",
  },
  FuncName = "Check_Key_Bool",
  Id = 330113,
}
r4_0[410101] = {
  ConditionVars = {
    BuffId = 410111,
  },
  FuncName = "Check_Buff",
  Id = 410101,
  Or = r0_0.RT_21,
}
r4_0[410102] = {
  FuncName = "Is_OnGround",
  Id = 410102,
}
r4_0[410103] = {
  ConditionVars = r0_0.RT_27,
  FuncName = "Check_Buff",
  Id = 410103,
}
r4_0[410104] = {
  ConditionVars = r0_0.RT_27,
  FuncName = "Check_Buff",
  Id = 410104,
  Not = true,
}
r4_0[410222] = {
  ConditionVars = {
    Int = 410222,
  },
  FuncName = "Check_Current_Skill",
  Id = 410222,
}
r4_0[410224] = {
  ConditionVars = {
    Int = 410224,
  },
  FuncName = "Check_Current_Skill",
  Id = 410224,
}
r4_0[420101] = {
  ConditionVars = {
    BuffId = 420111,
  },
  FuncName = "Check_Buff",
  Id = 420101,
  Not = true,
}
r4_0[420102] = {
  ConditionVars = {
    BuffId = 420121,
  },
  FuncName = "Check_Buff",
  Id = 420102,
}
r4_0[420103] = {
  ConditionVars = r0_0.RT_28,
  FuncName = "Check_Key_Bool",
  Id = 420103,
}
r4_0[420104] = {
  ConditionVars = r0_0.RT_28,
  FuncName = "Check_Key_Bool",
  Id = 420104,
  Not = true,
}
r4_0[420201] = {
  And = {
    902
  },
  ConditionVars = {
    CompareBaseInt = 5,
    TargetFilter = "Char_Cylinder_Large180",
  },
  FuncName = "Check_Ranged_Mon_Num",
  Id = 420201,
}
r4_0[420202] = {
  ConditionVars = {
    CompareBase = 0,
    CompareLogic = "NotGreater",
    Key = "ES",
  },
  FuncName = "Check_Attr_Self",
  Id = 420202,
}
r4_0[420221] = {
  ConditionVars = {
    CompareBaseInt = 3,
    RelativeDis = 2000,
    SummonId = 420202,
  },
  FuncName = "Check_SkillCreature",
  Id = 420221,
  Not = true,
}
r4_0[430101] = {
  ConditionVars = {
    CompareBaseInt = 15,
    CompareLogic = "NotLess",
  },
  FuncName = "Check_SecondSP",
  Id = 430101,
}
r4_0[430102] = {
  ConditionVars = {
    CompareBaseInt = 15,
    CompareLogic = "Less",
  },
  FuncName = "Check_SecondSP",
  Id = 430102,
}
r4_0[430103] = {
  ConditionVars = {
    CompareBaseInt = 60,
    CompareLogic = "NotLess",
  },
  FuncName = "Check_SecondSP",
  Id = 430103,
}
r4_0[430104] = {
  ConditionVars = {
    CompareBaseInt = 60,
    CompareLogic = "Less",
  },
  FuncName = "Check_SecondSP",
  Id = 430104,
}
r4_0[430105] = {
  ConditionVars = {
    Key = "Xibi_Grade4_Bool",
  },
  FuncName = "Check_Key_Bool",
  Id = 430105,
}
r4_0[430121] = {
  ConditionVars = {
    CompareBase = 1000,
    CompareBaseInt = 1,
    Key = "Default",
    SummonId = 430101,
  },
  FuncName = "SummonInRange",
  Id = 430121,
}
r4_0[510101] = {
  ConditionVars = r0_0.RT_30,
  FuncName = "Check_Buff",
  Id = 510101,
}
r4_0[510102] = {
  ConditionVars = r0_0.RT_30,
  FuncName = "Summoner_Check_Buff",
  Id = 510102,
}
r4_0[510103] = {
  ConditionVars = {
    BuffId = 510121,
  },
  FuncName = "Check_Buff",
  Id = 510103,
}
r4_0[510104] = {
  FuncName = "Check_Songlu_CanDash",
  Id = 510104,
}
r4_0[530102] = {
  ConditionVars = r0_0.RT_31,
  FuncName = "Check_Buff",
  Id = 530102,
  Or = {
    530123
  },
}
r4_0[530121] = {
  ConditionVars = r0_0.RT_32,
  FuncName = "Is_Hp_Above",
  Id = 530121,
}
r4_0[530122] = {
  ConditionVars = r0_0.RT_32,
  FuncName = "Is_Hp_Above",
  Id = 530122,
  Not = true,
}
r4_0[530123] = {
  And = {
    530122
  },
  ConditionVars = r0_0.RT_31,
  FuncName = "Check_Buff",
  Id = 530123,
}
r4_0[540201] = {
  ConditionVars = {
    BuffId = 540201,
  },
  FuncName = "Check_Buff",
  Id = 540201,
}
r4_0[540202] = {
  And = {
    540201
  },
  ConditionVars = {
    BuffId = 540202,
  },
  FuncName = "Check_Buff",
  Id = 540202,
}
r4_0[540203] = {
  And = {
    540202
  },
  ConditionVars = {
    BuffId = 540203,
  },
  FuncName = "Check_Buff",
  Id = 540203,
}
r4_0[540205] = {
  ConditionVars = {
    BuffId = 540205,
  },
  FuncName = "Check_Buff",
  Id = 540205,
  Not = true,
  Or = {
    540206
  },
}
r4_0[540206] = {
  ConditionVars = {
    BuffId = 540206,
    CompareBaseInt = 20,
    CompareLogic = "NotLess",
  },
  FuncName = "Check_Buff_Layer",
  Id = 540206,
}
r4_0[600401] = {
  ConditionVars = {
    HalfHeight = 70,
    Radius = 150,
  },
  FuncName = "IsAnySceneAroundBTTarget",
  Id = 600401,
  Not = true,
}
r4_0[600501] = {
  ConditionVars = {
    BuffId = 600502,
  },
  FuncName = "Check_Buff",
  Id = 600501,
}
r4_0[600502] = {
  ConditionVars = r0_0.RT_33,
  FuncName = "Check_Buff",
  Id = 600502,
  Or = {
    60,
    61,
    62,
    63,
    64
  },
}
r4_0[700101] = {
  And = {
    700102
  },
  ConditionVars = {
    MonsterId = 7016001,
  },
  FuncName = "Check_Mon_UnitId",
  Id = 700101,
}
r4_0[700102] = {
  ConditionVars = {
    KeyName = "Rider",
  },
  FuncName = "Check_Mon_BBValue_ObjectIsNull",
  Id = 700102,
}
r4_0[700103] = {
  ConditionVars = {
    TargetDis = 5000,
  },
  FuncName = "Check_Mon_EscapingFromBattle_TargetDis",
  Id = 700103,
}
r4_0[700301] = {
  ConditionVars = {
    Radius = 1000,
  },
  FuncName = "Check_Mon_EX02_EscapingFromBattle",
  Id = 700301,
}
r4_0[700801] = {
  And = r0_0.RT_1,
  ConditionVars = {
    MonsterId = 7015061,
  },
  FuncName = "Check_Mon_UnitId",
  Id = 700801,
}
r4_0[701501] = {
  ConditionVars = {
    KeyName = "CorpPhase",
  },
  FuncName = "Check_Mon_BBValue_Int",
  Id = 701501,
}
r4_0[800201] = {
  And = r0_0.RT_1,
  ConditionVars = {
    MonsterId = 8002061,
  },
  FuncName = "Check_Mon_UnitId",
  Id = 800201,
}
r4_0[800202] = {
  And = r0_0.RT_1,
  ConditionVars = {
    MonsterId = 8002062,
  },
  FuncName = "Check_Mon_UnitId",
  Id = 800202,
}
r4_0[800203] = {
  And = {
    800204
  },
  FuncName = "Check_Mon_IsActive",
  Id = 800203,
}
r4_0[800204] = {
  FuncName = "Check_Mon_IsInBattle",
  Id = 800204,
}
r4_0[850000] = {
  FuncName = "IsStoryBoss",
  Id = 850000,
}
r4_0[850001] = {
  ConditionVars = {
    TNValue = 0,
  },
  FuncName = "Check_CurrentTN",
  Id = 850001,
}
r4_0[850002] = {
  ConditionVars = {
    HpPercent = 0.85,
  },
  FuncName = "Check_Mon_HpPercentUnder",
  Id = 850002,
}
r4_0[850003] = {
  ConditionVars = {
    HpPercent = 0.5,
  },
  FuncName = "Check_Mon_HpPercentUnder",
  Id = 850003,
}
r4_0[850004] = {
  ConditionVars = {
    HpPercent = 0.15,
  },
  FuncName = "Check_Mon_HpPercentUnder",
  Id = 850004,
}
r4_0[850011] = {
  ConditionVars = {
    RelativeDis = 600,
  },
  FuncName = "Check_BTTargetLoc",
  Id = 850011,
  Or = {
    850012
  },
}
r4_0[850012] = {
  ConditionVars = {
    RelativeAngle = 120,
  },
  FuncName = "Check_BTTargetAngle",
  Id = 850012,
}
r4_0[850071] = {
  ConditionVars = {
    EffectId = 850071,
  },
  FuncName = "Check_EffectTargetValid",
  Id = 850071,
}
r4_0[850072] = {
  ConditionVars = {
    EffectId = 8500171,
  },
  FuncName = "Check_EffectTargetValid",
  Id = 850072,
}
r4_0[850081] = {
  ConditionVars = {
    RelativeDis = 1000,
  },
  FuncName = "Check_BTTargetLoc",
  Id = 850081,
}
r4_0[850201] = {
  ConditionVars = r0_0.RT_38,
  FuncName = "PartIsBroken",
  Id = 850201,
  Not = true,
}
r4_0[850202] = {
  ConditionVars = r0_0.RT_39,
  FuncName = "PartIsBroken",
  Id = 850202,
  Not = true,
}
r4_0[850203] = {
  ConditionVars = r0_0.RT_40,
  FuncName = "PartIsBroken",
  Id = 850203,
  Not = true,
}
r4_0[850204] = {
  ConditionVars = r0_0.RT_41,
  FuncName = "PartIsBroken",
  Id = 850204,
  Not = true,
}
r4_0[850205] = {
  ConditionVars = r0_0.RT_38,
  FuncName = "BrokenPart",
  Id = 850205,
}
r4_0[850206] = {
  ConditionVars = r0_0.RT_39,
  FuncName = "BrokenPart",
  Id = 850206,
}
r4_0[850207] = {
  ConditionVars = r0_0.RT_40,
  FuncName = "BrokenPart",
  Id = 850207,
}
r4_0[850208] = {
  ConditionVars = r0_0.RT_41,
  FuncName = "BrokenPart",
  Id = 850208,
}
r4_0[850209] = {
  ConditionVars = {
    UnitId = 8502001,
  },
  FuncName = "Is_UnitId_Match",
  Id = 850209,
}
r4_0[850210] = {
  ConditionVars = {
    BuffId = 850210,
    CompareBaseInt = 2,
    CompareLogic = "Equal",
  },
  FuncName = "Check_Buff_Layer",
  Id = 850210,
}
r4_0[850211] = {
  ConditionVars = {
    BuffId = 850210,
    CompareBaseInt = 3,
    CompareLogic = "Equal",
  },
  FuncName = "Check_Buff_Layer",
  Id = 850211,
}
r4_0[850212] = {
  ConditionVars = {
    BuffId = 850210,
    CompareBaseInt = 4,
    CompareLogic = "Equal",
  },
  FuncName = "Check_Buff_Layer",
  Id = 850212,
}
r4_0[850213] = {
  ConditionVars = {
    BuffId = 850202,
  },
  FuncName = "Check_Buff",
  Id = 850213,
}
r4_0[850301] = {
  ConditionVars = r0_0.RT_38,
  FuncName = "BrokenPart",
  Id = 850301,
}
r4_0[850302] = {
  ConditionVars = r0_0.RT_39,
  FuncName = "BrokenPart",
  Id = 850302,
}
r4_0[850303] = {
  ConditionVars = r0_0.RT_40,
  FuncName = "BrokenPart",
  Id = 850303,
}
r4_0[850304] = {
  ConditionVars = r0_0.RT_41,
  FuncName = "BrokenPart",
  Id = 850304,
}
r4_0[850305] = {
  ConditionVars = {
    EffectId = 8503182,
  },
  FuncName = "Check_EffectTargetValid",
  Id = 850305,
}
r4_0[850306] = {
  FuncName = "Is_In_LieDown",
  Id = 850306,
  Not = true,
}
r4_0[850501] = {
  ConditionVars = {
    EffectId = 850534,
  },
  FuncName = "Check_EffectTargetValid",
  Id = 850501,
}
r4_0[850502] = {
  ConditionVars = {
    CompareBaseInt = 1,
    TargetFilter = "BossLianhuo_Skill02_Cylinder",
  },
  FuncName = "Check_Ranged_Mon_Num",
  Id = 850502,
}
r4_0[850901] = {
  And = {
    850902
  },
  ConditionVars = {
    RelativeDis = 1200,
  },
  FuncName = "Check_BTTargetLoc",
  Id = 850901,
  Not = true,
}
r4_0[850902] = {
  ConditionVars = r0_0.RT_42,
  FuncName = "Check_BTTargetAngle",
  Id = 850902,
  Not = true,
}
r4_0[850903] = {
  ConditionVars = {
    HpPercent = 0.9,
  },
  FuncName = "Check_Mon_HpPercentUnder",
  Id = 850903,
}
r4_0[850904] = {
  ConditionVars = r0_0.RT_43,
  FuncName = "Check_Mon_HpPercentUnder",
  Id = 850904,
}
r4_0[850905] = {
  ConditionVars = {
    HpPercent = 0.25,
  },
  FuncName = "Check_Mon_HpPercentUnder",
  Id = 850905,
}
r4_0[850906] = {
  ConditionVars = {
    KeyName = "Skill01Hit3",
  },
  FuncName = "Check_Mon_BBValue",
  Id = 850906,
}
r4_0[850907] = {
  ConditionVars = {
    KeyName = "Skill03Left",
  },
  FuncName = "Check_Mon_BBValue",
  Id = 850907,
}
r4_0[850908] = {
  ConditionVars = {
    KeyName = "Skill03Right",
  },
  FuncName = "Check_Mon_BBValue",
  Id = 850908,
}
r4_0[850909] = {
  ConditionVars = {
    KeyName = "Skill03Front",
  },
  FuncName = "Check_Mon_BBValue",
  Id = 850909,
}
r4_0[850910] = {
  FuncName = "BossTuosi_CanUseSkill04",
  Id = 850910,
  Not = true,
}
r4_0[851401] = {
  ConditionVars = {
    MonsterId = 8514051,
  },
  FuncName = "Check_Mon_UnitId",
  Id = 851401,
  Not = true,
}
r4_0[851601] = {
  ConditionVars = {
    HpPercent = 0.67,
  },
  FuncName = "Check_Mon_HpPercentUnder",
  Id = 851601,
}
r4_0[851602] = {
  ConditionVars = {
    HpPercent = 0.33,
  },
  FuncName = "Check_Mon_HpPercentUnder",
  Id = 851602,
}
r4_0[851701] = {
  ConditionVars = r0_0.RT_44,
  FuncName = "Check_Mon_BBValue",
  Id = 851701,
}
r4_0[851702] = {
  ConditionVars = r0_0.RT_44,
  FuncName = "Check_Mon_BBValue",
  Id = 851702,
  Not = true,
}
r4_0[851801] = {
  ConditionVars = r0_0.RT_38,
  FuncName = "BrokenPart",
  Id = 851801,
}
r4_0[851802] = {
  ConditionVars = r0_0.RT_39,
  FuncName = "BrokenPart",
  Id = 851802,
}
r4_0[852001] = {
  ConditionVars = {
    HpPercent = 0.8,
  },
  FuncName = "Check_Mon_HpPercentUnder",
  Id = 852001,
}
r4_0[852002] = {
  ConditionVars = r0_0.RT_43,
  FuncName = "Check_Mon_HpPercentUnder",
  Id = 852002,
}
r4_0[852003] = {
  FuncName = "BossAida_InP1orP2",
  Id = 852003,
}
r4_0[852004] = {
  FuncName = "BossAida_InP3orP4orP5",
  Id = 852004,
}
r4_0[852201] = {
  And = {
    852202
  },
  ConditionVars = {
    RelativeDis = 800,
  },
  FuncName = "Check_BTTargetLoc",
  Id = 852201,
  Not = true,
}
r4_0[852202] = {
  ConditionVars = r0_0.RT_42,
  FuncName = "Check_BTTargetAngle",
  Id = 852202,
  Not = true,
}
r4_0[852203] = {
  ConditionVars = {
    Key = "BossTuisheng_Skill02Hit1Result",
  },
  FuncName = "Check_Key_Bool",
  Id = 852203,
}
r4_0[852204] = {
  ConditionVars = {
    Key = "BossTuisheng_Skill04CreatureHitResult",
  },
  FuncName = "Check_Key_Bool",
  Id = 852204,
}
r4_0[852205] = {
  ConditionVars = {
    RelativeDis = 400,
  },
  FuncName = "Check_BTTargetLoc",
  Id = 852205,
  Not = true,
}
r4_0[852301] = {
  And = r0_0.RT_1,
  ConditionVars = {
    MonsterId = 8523002,
  },
  FuncName = "Check_Mon_UnitId",
  Id = 852301,
}
r4_0[859901] = {
  ConditionVars = {
    CompareBase = 30,
    CompareLogic = "NotGreater",
    Key = "Level",
  },
  FuncName = "Check_Attr_Self",
  Id = 859901,
}
r4_0[859902] = {
  ConditionVars = {
    CompareBase = 40,
    CompareLogic = "NotGreater",
    Key = "Level",
  },
  FuncName = "Check_Attr_Self",
  Id = 859902,
}
r4_0[859903] = {
  ConditionVars = {
    CompareBase = 50,
    CompareLogic = "NotGreater",
    Key = "Level",
  },
  FuncName = "Check_Attr_Self",
  Id = 859903,
}
r4_0[859904] = {
  ConditionVars = {
    CompareBase = 60,
    CompareLogic = "NotGreater",
    Key = "Level",
  },
  FuncName = "Check_Attr_Self",
  Id = 859904,
}
r4_0[950001] = {
  ConditionVars = {
    MonsterId = 9500001,
  },
  FuncName = "Check_Mon_UnitId",
  Id = 950001,
  Or = {
    950051
  },
}
r4_0[950011] = {
  ConditionVars = {
    MonsterId = 9500101,
  },
  FuncName = "Check_Mon_UnitId",
  Id = 950011,
}
r4_0[950012] = {
  ConditionVars = {
    MonsterId = 9500102,
  },
  FuncName = "Check_Mon_UnitId",
  Id = 950012,
  Not = true,
}
r4_0[950051] = {
  ConditionVars = {
    MonsterId = 9500051,
  },
  FuncName = "Check_Mon_UnitId",
  Id = 950051,
  Or = {
    950052
  },
}
r4_0[950052] = {
  ConditionVars = {
    MonsterId = 9500052,
  },
  FuncName = "Check_Mon_UnitId",
  Id = 950052,
}
r4_0[950053] = {
  ConditionVars = {
    MonsterId = 9500053,
  },
  FuncName = "Check_Mon_UnitId",
  Id = 950053,
}
r4_0[950054] = {
  ConditionVars = {
    MonsterId = 9500054,
  },
  FuncName = "Check_Mon_UnitId",
  Id = 950054,
}
r4_0[950101] = {
  ConditionVars = {
    MonsterId = 9501001,
  },
  FuncName = "Check_Mon_UnitId",
  Id = 950101,
  Or = {
    950102
  },
}
r4_0[950102] = {
  ConditionVars = {
    MonsterId = 9501002,
  },
  FuncName = "Check_Mon_UnitId",
  Id = 950102,
}
r4_0[980101] = {
  ConditionVars = {
    Int = 3,
    KeyName = "VehPhase",
  },
  FuncName = "Check_Mon_BBValue_Int",
  Id = 980101,
  Not = true,
}
r4_0[980501] = {
  ConditionVars = {
    BuffId = 980501,
  },
  FuncName = "Check_Buff",
  Id = 980501,
}
r4_0[1000101] = {
  And = r0_0.RT_1,
  ConditionVars = {
    MonsterId = 10001061,
  },
  FuncName = "Check_Mon_UnitId",
  Id = 1000101,
}
r4_0[1000102] = {
  And = r0_0.RT_1,
  ConditionVars = {
    MonsterId = 10001062,
  },
  FuncName = "Check_Mon_UnitId",
  Id = 1000102,
}
r4_0[1000301] = {
  And = r0_0.RT_1,
  ConditionVars = {
    CorpType = "BiAn02",
  },
  FuncName = "Check_Mon_CorpType",
  Id = 1000301,
}
r4_0[1000401] = {
  And = r0_0.RT_1,
  ConditionVars = {
    CorpType = "BiAn01",
  },
  FuncName = "Check_Mon_CorpType",
  Id = 1000401,
}
r4_0[1000501] = {
  And = r0_0.RT_1,
  ConditionVars = {
    MonsterId = 10005061,
  },
  FuncName = "Check_Mon_UnitId",
  Id = 1000501,
}
r4_0[1000502] = {
  And = r0_0.RT_1,
  ConditionVars = {
    MonsterId = 10005062,
  },
  FuncName = "Check_Mon_UnitId",
  Id = 1000502,
}
r4_0[1030101] = {
  ConditionVars = {
    Key = "Claymore_Heavyattack_Mod01_Grab",
  },
  FuncName = "Check_Key_Bool",
  Id = 1030101,
  Not = true,
  Or = {
    1030102
  },
}
r4_0[1030102] = {
  ConditionVars = {
    Key = "Claymore_Heavyattack_Mod01_Grab_Cilent",
  },
  FuncName = "Check_Key_Bool",
  Id = 1030102,
  Not = true,
}
r4_0[1060101] = {
  ConditionVars = {
    EffectId = 1060251,
  },
  FuncName = "Check_EffectTargetValid",
  Id = 1060101,
}
r4_0[1060102] = {
  ConditionVars = {
    BuffId = 1060202,
  },
  FuncName = "Check_Buff",
  Id = 1060102,
}
r4_0[2010211] = {
  ConditionVars = {
    Int = 100,
  },
  FuncName = "Check_Buff_Type",
  Id = 2010211,
  Not = true,
}
r4_0[2030501] = {
  ConditionVars = {
    CompareBaseInt = 1,
    Int = 20305,
  },
  FuncName = "Check_HeavyCharge_Grade",
  Id = 2030501,
}
r4_0[2030502] = {
  ConditionVars = {
    CompareBaseInt = 2,
    Int = 20305,
  },
  FuncName = "Check_HeavyCharge_Grade",
  Id = 2030502,
}
r4_0[2030503] = {
  ConditionVars = {
    CompareBaseInt = 3,
    Int = 20305,
  },
  FuncName = "Check_HeavyCharge_Grade",
  Id = 2030503,
}
r4_0[2040201] = {
  ConditionVars = {
    CompareBase = 1,
    Key = "Weapon20402_Scale",
  },
  FuncName = "Check_Key_Float",
  Id = 2040201,
  Or = {
    2040204,
    2040203,
    2040202
  },
}
r4_0[2040202] = {
  ConditionVars = {
    CompareBase = 1.5,
    Key = "Weapon20402_Scale",
  },
  FuncName = "Check_Key_Float",
  Id = 2040202,
  Or = {
    2040204,
    2040203
  },
}
r4_0[2040203] = {
  ConditionVars = {
    CompareBase = 2,
    Key = "Weapon20402_Scale",
  },
  FuncName = "Check_Key_Float",
  Id = 2040203,
  Or = {
    2040204
  },
}
r4_0[2040204] = {
  ConditionVars = {
    CompareBase = 2.5,
    Key = "Weapon20402_Scale",
  },
  FuncName = "Check_Key_Float",
  Id = 2040204,
}
r4_0[2040501] = {
  ConditionVars = r0_0.RT_17,
  FuncName = "Check_HeavyCharge_Grade",
  Id = 2040501,
}
r4_0[2040502] = {
  ConditionVars = r0_0.RT_17,
  FuncName = "Check_HeavyCharge_Grade",
  Id = 2040502,
  Not = true,
}
r4_0[2050401] = {
  ConditionVars = {
    CompareBaseInt = 1,
    Int = 20504,
  },
  FuncName = "Check_HeavyCharge_Grade",
  Id = 2050401,
}
r4_0[2050402] = {
  ConditionVars = {
    CompareBaseInt = 2,
    Int = 20504,
  },
  FuncName = "Check_HeavyCharge_Grade",
  Id = 2050402,
}
r4_0[2050501] = {
  ConditionVars = {
    BuffId = 2050501,
    CompareBaseInt = 10,
    CompareLogic = "NotLess",
  },
  FuncName = "Check_Buff_Layer",
  Id = 2050501,
}
r4_0[2050601] = {
  ConditionVars = {
    CompareBaseInt = 1,
    Int = 20506,
  },
  FuncName = "Check_HeavyCharge_Grade",
  Id = 2050601,
}
r4_0[2060100] = {
  ConditionVars = {
    CompareBaseInt = 0,
    Int = 20601,
  },
  FuncName = "Check_HeavyCharge_Grade",
  Id = 2060100,
}
r4_0[2060101] = {
  ConditionVars = {
    CompareBaseInt = 1,
    Int = 20601,
  },
  FuncName = "Check_HeavyCharge_Grade",
  Id = 2060101,
}
r4_0[2060102] = {
  ConditionVars = {
    CompareBaseInt = 2,
    Int = 20601,
  },
  FuncName = "Check_HeavyCharge_Grade",
  Id = 2060102,
}
r4_0[2060103] = {
  ConditionVars = {
    CompareBaseInt = 3,
    Int = 20601,
  },
  FuncName = "Check_HeavyCharge_Grade",
  Id = 2060103,
}
r4_0[2060111] = {
  And = r0_0.RT_18,
  FuncName = "Not_PerfectHeavyShooting",
  Id = 2060111,
}
r4_0[2060301] = {
  FuncName = "CustomizedTargets_IsValid",
  Id = 2060301,
}
r4_0[3040001] = {
  ConditionVars = {
    HpPercent = 0.95,
  },
  FuncName = "Check_Mon_HpPercentUnder",
  Id = 3040001,
}
r4_0[3040002] = {
  ConditionVars = {
    HpPercent = 0.63,
  },
  FuncName = "Check_Mon_HpPercentUnder",
  Id = 3040002,
}
r4_0[3040003] = {
  ConditionVars = {
    HpPercent = 0.31,
  },
  FuncName = "Check_Mon_HpPercentUnder",
  Id = 3040003,
}
r4_0[3040004] = {
  ConditionVars = {
    Int = 30401,
  },
  FuncName = "Check_Buff_Type",
  Id = 3040004,
}
r4_0[3040005] = {
  ConditionVars = {
    Int = 30402,
  },
  FuncName = "Check_Buff_Type",
  Id = 3040005,
}
r4_0[3040006] = {
  ConditionVars = {
    Int = 30407,
  },
  FuncName = "Check_Buff_Type",
  Id = 3040006,
}
r4_0[3040007] = {
  ConditionVars = {
    HpPercent = 0.21,
  },
  FuncName = "Check_Mon_HpPercentUnder",
  Id = 3040007,
}
r4_0[3040008] = {
  ConditionVars = {
    MonsterId = 309,
  },
  FuncName = "Check_Mon_UnitId",
  Id = 3040008,
}
r4_0[10104101] = {
  ConditionVars = {
    CompareBaseInt = 0,
    SummonId = 9901113,
  },
  FuncName = "SummonNumMore",
  Id = 10104101,
  Not = true,
}
return r2_0(r3_0, r4_0)
