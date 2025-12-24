-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\STLExportQuestChain.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    DeliverType = 1,
    Id = 100104,
    IsWhite = false,
    StartIndex = 1,
  },
  RT_2 = {},
  RT_3 = {
    DeliverType = 1,
    Id = 101107,
    IsWhite = false,
    StartIndex = 1,
  },
}
r0_0.RT_4 = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestIds = r0_0.RT_2,
}
r0_0.RT_5 = {
  IsMultiQuest = false,
  SubRegionId = 101107,
  nextQuestIds = r0_0.RT_2,
}
r0_0.RT_6 = {
  DeliverType = 1,
  Id = 210101,
  IsWhite = false,
  StartIndex = 1,
}
r0_0.RT_7 = {
  DeliverType = 1,
  Id = 101101,
  IsWhite = false,
  StartIndex = 1,
}
r0_0.RT_8 = {
  IsMultiQuest = false,
  SubRegionId = 0,
  SuccQuestDeliver = r0_0.RT_7,
  nextQuestIds = r0_0.RT_2,
}
r0_0.RT_9 = {
  DeliverType = 1,
  Id = 101901,
  IsWhite = false,
  StartIndex = 1,
}
r0_0.RT_10 = {
  IsMultiQuest = false,
  SubRegionId = 101901,
  nextQuestIds = r0_0.RT_2,
}
r0_0.RT_11 = {
  IsMultiQuest = false,
  SubRegionId = 102101,
  nextQuestIds = r0_0.RT_2,
}
r0_0.RT_12 = {
  IsMultiQuest = false,
  SubRegionId = 102102,
  nextQuestIds = r0_0.RT_2,
}
r0_0.RT_13 = {
  IsMultiQuest = false,
  SubRegionId = 104110,
  nextQuestIds = r0_0.RT_2,
}
r0_0.RT_14 = {
  IsMultiQuest = false,
  SubRegionId = 104104,
  nextQuestIds = r0_0.RT_2,
}
r0_0.RT_15 = {
  IsMultiQuest = false,
  SubRegionId = 104105,
  nextQuestIds = r0_0.RT_2,
}
r0_0.RT_16 = {
  IsMultiQuest = false,
  SubRegionId = 101105,
  nextQuestIds = r0_0.RT_2,
}
r0_0.RT_17 = {
  DeliverType = 1,
  Id = 101105,
  IsWhite = false,
  StartIndex = 1,
}
r0_0.RT_18 = {
  DeliverType = 1,
  Id = 101101,
  IsWhite = false,
  StartIndex = 4,
}
r0_0.RT_19 = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestIds = r0_0.RT_2,
}
r0_0.RT_20 = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestIds = r0_0.RT_2,
}
r0_0.RT_21 = {
  Success = 20020905,
}
r0_0.RT_22 = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20020905,
  nextQuestIds = r0_0.RT_21,
}
r0_0.RT_23 = {
  IsMultiQuest = false,
  SubRegionId = 104108,
  nextQuestIds = r0_0.RT_2,
}
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [122, 122] id: 1
  return r1_1
end
local r4_0 = {}
local r6_0 = {
  EndQuestId = 10010111,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 100101,
}
local r7_0 = {}
r7_0[10010101] = {
  IsMultiQuest = false,
  SubRegionId = 100103,
  SuccQuestDeliver = r0_0.RT_1,
  nextQuestId = 10010102,
  nextQuestIds = {
    Success = 10010102,
  },
}
r7_0[10010102] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10010103,
  nextQuestIds = {
    Success = 10010103,
  },
}
r7_0[10010103] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10010104,
  nextQuestIds = {
    Success = 10010104,
  },
}
r7_0[10010104] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10010105,
  nextQuestIds = {
    Success = 10010105,
  },
}
r7_0[10010105] = {
  IsMultiQuest = false,
  SubRegionId = 100101,
  nextQuestId = 10010106,
  nextQuestIds = {
    Success = 10010106,
  },
}
r7_0[10010106] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10010107,
  nextQuestIds = {
    Success = 10010107,
  },
}
r7_0[10010107] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10010108,
  nextQuestIds = {
    Success = 10010108,
  },
}
r7_0[10010108] = {
  IsMultiQuest = false,
  SubRegionId = 100101,
  nextQuestId = 10010109,
  nextQuestIds = {
    Success = 10010109,
  },
}
r7_0[10010109] = {
  IsMultiQuest = false,
  SubRegionId = 100101,
  nextQuestId = 10010110,
  nextQuestIds = {
    Success = 10010110,
  },
}
r7_0[10010110] = {
  IsMultiQuest = false,
  SubRegionId = 100101,
  nextQuestId = 10010111,
  nextQuestIds = {
    Success = 10010111,
  },
}
r7_0[10010111] = {
  IsMultiQuest = false,
  SubRegionId = 100101,
  nextQuestIds = r0_0.RT_2,
}
r6_0.Quests = r7_0
r6_0.StartQuestId = 10010101
r4_0[100101] = r6_0
r6_0 = {
  EndQuestId = 10010213,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 100102,
}
r7_0 = {}
r7_0[10010201] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10010203,
  nextQuestIds = {
    Success = 10010203,
  },
}
r7_0[10010203] = {
  IsMultiQuest = false,
  SubRegionId = 100101,
  nextQuestId = 10010204,
  nextQuestIds = {
    Success = 10010204,
  },
}
r7_0[10010204] = {
  IsMultiQuest = false,
  SubRegionId = 100101,
  nextQuestId = 10010205,
  nextQuestIds = {
    Success = 10010205,
  },
}
r7_0[10010205] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10010206,
  nextQuestIds = {
    Success = 10010206,
  },
}
r7_0[10010206] = {
  IsMultiQuest = false,
  SubRegionId = 100102,
  nextQuestId = 10010207,
  nextQuestIds = {
    Success = 10010207,
  },
}
r7_0[10010207] = {
  IsMultiQuest = false,
  SubRegionId = 100102,
  nextQuestId = 10010208,
  nextQuestIds = {
    Success = 10010208,
  },
}
r7_0[10010208] = {
  IsMultiQuest = false,
  SubRegionId = 100102,
  nextQuestId = 10010209,
  nextQuestIds = {
    Success = 10010209,
  },
}
r7_0[10010209] = {
  IsMultiQuest = false,
  SubRegionId = 100102,
  nextQuestId = 10010210,
  nextQuestIds = {
    Success = 10010210,
  },
}
r7_0[10010210] = {
  IsMultiQuest = false,
  SubRegionId = 100102,
  nextQuestId = 10010212,
  nextQuestIds = {
    Success = 10010212,
  },
}
r7_0[10010212] = {
  IsMultiQuest = false,
  SubRegionId = 100102,
  nextQuestId = 10010213,
  nextQuestIds = {
    Success = 10010213,
  },
}
r7_0[10010213] = {
  IsMultiQuest = false,
  SubRegionId = 100102,
  nextQuestIds = r0_0.RT_2,
}
r6_0.Quests = r7_0
r6_0.StartQuestId = 10010201
r4_0[100102] = r6_0
r6_0 = {
  EndQuestId = 10010308,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 100103,
}
r7_0 = {}
r7_0[10010301] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10010302,
  nextQuestIds = {
    Success = 10010302,
  },
}
r7_0[10010302] = {
  IsMultiQuest = false,
  SubRegionId = 100103,
  nextQuestId = 10010303,
  nextQuestIds = {
    Success = 10010303,
  },
}
r7_0[10010303] = {
  IsMultiQuest = false,
  SubRegionId = 100103,
  nextQuestId = 10010304,
  nextQuestIds = {
    Success = 10010304,
  },
}
r7_0[10010304] = {
  IsMultiQuest = false,
  SubRegionId = 100103,
  nextQuestId = 10010305,
  nextQuestIds = {
    Success = 10010305,
  },
}
r7_0[10010305] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10010306,
  nextQuestIds = {
    Success = 10010306,
  },
}
r7_0[10010306] = {
  IsMultiQuest = false,
  SubRegionId = 100103,
  nextQuestId = 10010310,
  nextQuestIds = {
    Success = 10010310,
  },
}
r7_0[10010307] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  SuccQuestDeliver = r0_0.RT_3,
  nextQuestId = 10010308,
  nextQuestIds = {
    Success = 10010308,
  },
}
r7_0[10010308] = r0_0.RT_4
r7_0[10010310] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10010307,
  nextQuestIds = {
    Success = 10010307,
  },
}
r7_0[10010311] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10010312,
  nextQuestIds = {
    Success = 10010312,
  },
}
r7_0[10010312] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10010301,
  nextQuestIds = {
    Success = 10010301,
  },
}
r6_0.Quests = r7_0
r6_0.StartQuestId = 10010311
r4_0[100103] = r6_0
r6_0 = {
  EndQuestId = 10020112,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 100201,
}
r7_0 = {}
r7_0[10020101] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020102,
  nextQuestIds = {
    Success = 10020102,
  },
}
r7_0[10020102] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020103,
  nextQuestIds = {
    Success = 10020103,
  },
}
r7_0[10020103] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 10020104,
  nextQuestIds = {
    Success = 10020104,
  },
}
r7_0[10020104] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 10020105,
  nextQuestIds = {
    Success = 10020105,
  },
}
r7_0[10020105] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020106,
  nextQuestIds = {
    Success = 10020106,
  },
}
r7_0[10020106] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020107,
  nextQuestIds = {
    Success = 10020107,
  },
}
r7_0[10020107] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020108,
  nextQuestIds = {
    Success = 10020108,
  },
}
r7_0[10020108] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020111,
  nextQuestIds = {
    Success = 10020111,
  },
}
r7_0[10020111] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020112,
  nextQuestIds = {
    Success = 10020112,
  },
}
r7_0[10020112] = r0_0.RT_4
r6_0.Quests = r7_0
r6_0.StartQuestId = 10020101
r4_0[100201] = r6_0
r6_0 = {
  EndQuestId = 10020223,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 100202,
}
r7_0 = {}
r7_0[10020201] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020202,
  nextQuestIds = {
    Success = 10020202,
  },
}
r7_0[10020202] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020203,
  nextQuestIds = {
    Success = 10020203,
  },
}
r7_0[10020203] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020204,
  nextQuestIds = {
    Success = 10020204,
  },
}
r7_0[10020204] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020205,
  nextQuestIds = {
    Success = 10020205,
  },
}
r7_0[10020205] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020206,
  nextQuestIds = {
    Success = 10020206,
  },
}
r7_0[10020206] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020207,
  nextQuestIds = {
    Success = 10020207,
  },
}
r7_0[10020207] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020208,
  nextQuestIds = {
    Success = 10020208,
  },
}
r7_0[10020208] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020209,
  nextQuestIds = {
    Success = 10020209,
  },
}
r7_0[10020209] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020210,
  nextQuestIds = {
    Success = 10020210,
  },
}
r7_0[10020210] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020211,
  nextQuestIds = {
    Success = 10020211,
  },
}
r7_0[10020211] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020215,
  nextQuestIds = {
    Success = 10020215,
  },
}
r7_0[10020215] = {
  IsMultiQuest = false,
  SubRegionId = 101702,
  SuccQuestDeliver = r0_0.RT_3,
  nextQuestId = 10020221,
  nextQuestIds = {
    Success = 10020221,
  },
}
r7_0[10020221] = {
  IsMultiQuest = false,
  SubRegionId = 101107,
  nextQuestId = 10020222,
  nextQuestIds = {
    Success = 10020222,
  },
}
r7_0[10020222] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020223,
  nextQuestIds = {
    Success = 10020223,
  },
}
r7_0[10020223] = r0_0.RT_5
r6_0.Quests = r7_0
r6_0.StartQuestId = 10020201
r4_0[100202] = r6_0
r6_0 = {
  EndQuestId = 10020316,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 100203,
}
r7_0 = {}
r7_0[10020301] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020302,
  nextQuestIds = {
    Success = 10020302,
  },
}
r7_0[10020302] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020303,
  nextQuestIds = {
    Success = 10020303,
  },
}
r7_0[10020303] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020304,
  nextQuestIds = {
    Success = 10020304,
  },
}
r7_0[10020304] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020305,
  nextQuestIds = {
    Success = 10020305,
  },
}
r7_0[10020305] = {
  IsMultiQuest = false,
  SubRegionId = 101301,
  nextQuestId = 10020308,
  nextQuestIds = {
    Success = 10020308,
  },
}
r7_0[10020308] = {
  IsMultiQuest = false,
  SubRegionId = 101305,
  nextQuestId = 10020310,
  nextQuestIds = {
    Success = 10020310,
  },
}
r7_0[10020310] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020311,
  nextQuestIds = {
    Success = 10020311,
  },
}
r7_0[10020311] = {
  IsMultiQuest = false,
  SubRegionId = 101303,
  nextQuestId = 10020312,
  nextQuestIds = {
    Success = 10020312,
  },
}
r7_0[10020312] = {
  IsMultiQuest = false,
  SubRegionId = 101304,
  nextQuestId = 10020313,
  nextQuestIds = {
    Success = 10020313,
  },
}
r7_0[10020313] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020314,
  nextQuestIds = {
    Success = 10020314,
  },
}
r7_0[10020314] = {
  IsMultiQuest = false,
  SubRegionId = 101304,
  SuccQuestDeliver = {
    DeliverType = 1,
    Id = 101103,
    IsWhite = false,
    StartIndex = 14,
  },
  nextQuestId = 10020316,
  nextQuestIds = {
    Success = 10020316,
  },
}
r7_0[10020316] = r0_0.RT_4
r6_0.Quests = r7_0
r6_0.StartQuestId = 10020301
r4_0[100203] = r6_0
r6_0 = {
  EndQuestId = 10020412,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 100204,
}
r7_0 = {}
r7_0[10020401] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020402,
  nextQuestIds = {
    Success = 10020402,
  },
}
r7_0[10020402] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020403,
  nextQuestIds = {
    Success = 10020403,
  },
}
r7_0[10020403] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020404,
  nextQuestIds = {
    Success = 10020404,
  },
}
r7_0[10020404] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 10020405,
  nextQuestIds = {
    Success = 10020405,
  },
}
r7_0[10020405] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020406,
  nextQuestIds = {
    Success = 10020406,
  },
}
r7_0[10020406] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020407,
  nextQuestIds = {
    Success = 10020407,
  },
}
r7_0[10020407] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020408,
  nextQuestIds = {
    Success = 10020408,
  },
}
r7_0[10020408] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020409,
  nextQuestIds = {
    Success = 10020409,
  },
}
r7_0[10020409] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020410,
  nextQuestIds = {
    Success = 10020410,
  },
}
r7_0[10020410] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  SuccQuestDeliver = {
    DeliverType = 1,
    Id = 101101,
    IsWhite = false,
    StartIndex = 8,
  },
  nextQuestId = 10020412,
  nextQuestIds = {
    Success = 10020412,
  },
}
r7_0[10020412] = r0_0.RT_4
r6_0.Quests = r7_0
r6_0.StartQuestId = 10020401
r4_0[100204] = r6_0
r6_0 = {
  EndQuestId = 10020507,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 100205,
}
r7_0 = {}
r7_0[10020501] = {
  IsMultiQuest = false,
  TargetMode = {
    TargetCount = 1,
    TargetId = 10020301,
  },
  nextQuestId = 10020502,
  nextQuestIds = {
    Success = 10020502,
  },
}
r7_0[10020502] = {
  IsMultiQuest = false,
  StartQuestDeliver = {
    DeliverType = 1,
    Id = 101103,
    IsWhite = false,
    StartIndex = 8,
  },
  SubRegionId = 0,
  nextQuestId = 10020503,
  nextQuestIds = {
    Success = 10020503,
  },
}
r7_0[10020503] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020504,
  nextQuestIds = {
    Success = 10020504,
  },
}
r7_0[10020504] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 10020505,
  nextQuestIds = {
    Success = 10020505,
  },
}
r7_0[10020505] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 10020506,
  nextQuestIds = {
    Success = 10020506,
  },
}
r7_0[10020506] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020507,
  nextQuestIds = {
    Success = 10020507,
  },
}
r7_0[10020507] = r0_0.RT_4
r6_0.Quests = r7_0
r6_0.StartQuestId = 10020501
r4_0[100205] = r6_0
r6_0 = {
  EndQuestId = 10020615,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 100206,
}
r7_0 = {}
r7_0[10020602] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020603,
  nextQuestIds = {
    Success = 10020603,
  },
}
r7_0[10020603] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020604,
  nextQuestIds = {
    Success = 10020604,
  },
}
r7_0[10020604] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020605,
  nextQuestIds = {
    Success = 10020605,
  },
}
r7_0[10020605] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020606,
  nextQuestIds = {
    Success = 10020606,
  },
}
r7_0[10020606] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020607,
  nextQuestIds = {
    Success = 10020607,
  },
}
r7_0[10020607] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020608,
  nextQuestIds = {
    Success = 10020608,
  },
}
r7_0[10020608] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 10020611,
  nextQuestIds = {
    Success = 10020611,
  },
}
r7_0[10020611] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 10020612,
  nextQuestIds = {
    Success = 10020612,
  },
}
r7_0[10020612] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020613,
  nextQuestIds = {
    Success = 10020613,
  },
}
r7_0[10020613] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 10020615,
  nextQuestIds = {
    Success = 10020615,
  },
}
r7_0[10020615] = r0_0.RT_4
r7_0[10020651] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020652,
  nextQuestIds = {
    Success = 10020652,
  },
}
r7_0[10020652] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 10020602,
  nextQuestIds = {
    Success = 10020602,
  },
}
r6_0.Quests = r7_0
r6_0.StartQuestId = 10020651
r4_0[100206] = r6_0
r6_0 = {
  EndQuestId = 10020709,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 100207,
}
r7_0 = {}
r7_0[10020701] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020702,
  nextQuestIds = {
    Success = 10020702,
  },
}
r7_0[10020702] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020703,
  nextQuestIds = {
    Success = 10020703,
  },
}
r7_0[10020703] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020704,
  nextQuestIds = {
    Success = 10020704,
  },
}
r7_0[10020704] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020705,
  nextQuestIds = {
    Success = 10020705,
  },
}
r7_0[10020705] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020706,
  nextQuestIds = {
    Success = 10020706,
  },
}
r7_0[10020706] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 10020707,
  nextQuestIds = {
    Success = 10020707,
  },
}
r7_0[10020707] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 10020710,
  nextQuestIds = {
    Success = 10020710,
  },
}
r7_0[10020708] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 10020709,
  nextQuestIds = {
    Success = 10020709,
  },
}
r7_0[10020709] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  SuccQuestDeliver = {
    DeliverType = 1,
    Id = 101401,
    IsWhite = true,
    StartIndex = 1,
  },
  nextQuestIds = r0_0.RT_2,
}
r7_0[10020710] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 10020708,
  nextQuestIds = {
    Success = 10020708,
  },
}
r6_0.Quests = r7_0
r6_0.StartQuestId = 10020701
r4_0[100207] = r6_0
r6_0 = {
  EndQuestId = 10020810,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 100208,
}
r7_0 = {}
r7_0[10020801] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  SuccQuestDeliver = {
    DeliverType = 1,
    Id = 101401,
    IsWhite = false,
    StartIndex = 2,
  },
  nextQuestId = 10020802,
  nextQuestIds = {
    Success = 10020802,
  },
}
r7_0[10020802] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020803,
  nextQuestIds = {
    Success = 10020803,
  },
}
r7_0[10020803] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  SuccQuestDeliver = {
    DeliverType = 1,
    Id = 101402,
    IsWhite = false,
    StartIndex = 2,
  },
  nextQuestId = 10020804,
  nextQuestIds = {
    Success = 10020804,
  },
}
r7_0[10020804] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  SuccQuestDeliver = {
    DeliverType = 1,
    Id = 101103,
    IsWhite = false,
    StartIndex = 2,
  },
  nextQuestId = 10020806,
  nextQuestIds = {
    Success = 10020806,
  },
}
r7_0[10020806] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020807,
  nextQuestIds = {
    Success = 10020807,
  },
}
r7_0[10020807] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 10020808,
  nextQuestIds = {
    Success = 10020808,
  },
}
r7_0[10020808] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10020809,
  nextQuestIds = {
    Success = 10020809,
  },
}
r7_0[10020809] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  SuccQuestDeliver = r0_0.RT_1,
  nextQuestId = 10020810,
  nextQuestIds = {
    Success = 10020810,
  },
}
r7_0[10020810] = {
  IsMultiQuest = false,
  StartQuestDeliver = r0_0.RT_1,
  SubRegionId = 0,
  SuccQuestDeliver = r0_0.RT_6,
  nextQuestIds = r0_0.RT_2,
}
r6_0.Quests = r7_0
r6_0.StartQuestId = 10020801
r4_0[100208] = r6_0
r6_0 = {
  EndQuestId = 10030116,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 100301,
}
r7_0 = {}
r7_0[10030101] = {
  IsMultiQuest = false,
  SubRegionId = 210101,
  nextQuestId = 10030103,
  nextQuestIds = {
    Success = 10030103,
  },
}
r7_0[10030103] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10030104,
  nextQuestIds = {
    Success = 10030104,
  },
}
r7_0[10030104] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10030105,
  nextQuestIds = {
    Success = 10030105,
  },
}
r7_0[10030105] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10030106,
  nextQuestIds = {
    Success = 10030106,
  },
}
r7_0[10030106] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10030107,
  nextQuestIds = {
    Success = 10030107,
  },
}
r7_0[10030107] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10030198,
  nextQuestIds = {
    Success = 10030198,
  },
}
r7_0[10030108] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10030109,
  nextQuestIds = {
    Success = 10030109,
  },
}
r7_0[10030109] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10030110,
  nextQuestIds = {
    Success = 10030110,
  },
}
r7_0[10030110] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10030111,
  nextQuestIds = {
    Success = 10030111,
  },
}
r7_0[10030111] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10030112,
  nextQuestIds = {
    Success = 10030112,
  },
}
r7_0[10030112] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10030113,
  nextQuestIds = {
    Success = 10030113,
  },
}
r7_0[10030113] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10030114,
  nextQuestIds = {
    Success = 10030114,
  },
}
r7_0[10030114] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10030115,
  nextQuestIds = {
    Success = 10030115,
  },
}
r7_0[10030115] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10030116,
  nextQuestIds = {
    Success = 10030116,
  },
}
r7_0[10030116] = r0_0.RT_4
r7_0[10030197] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 10030108,
  nextQuestIds = {
    Success = 10030108,
  },
}
r7_0[10030198] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 10030197,
  nextQuestIds = {
    Success = 10030197,
  },
}
r6_0.Quests = r7_0
r6_0.StartQuestId = 10030101
r4_0[100301] = r6_0
r6_0 = {
  EndQuestId = 10030214,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 100302,
}
r7_0 = {}
r7_0[10030201] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10030202,
  nextQuestIds = {
    Success = 10030202,
  },
}
r7_0[10030202] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10030203,
  nextQuestIds = {
    Success = 10030203,
  },
}
r7_0[10030203] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10030205,
  nextQuestIds = {
    Success = 10030205,
  },
}
r7_0[10030205] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10030206,
  nextQuestIds = {
    Success = 10030206,
  },
}
r7_0[10030206] = {
  IsMultiQuest = false,
  SubRegionId = 101701,
  nextQuestId = 10030207,
  nextQuestIds = {
    Success = 10030207,
  },
}
r7_0[10030207] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10030208,
  nextQuestIds = {
    Success = 10030208,
  },
}
r7_0[10030208] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10030209,
  nextQuestIds = {
    Success = 10030209,
  },
}
r7_0[10030209] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10030214,
  nextQuestIds = {
    Success = 10030214,
  },
}
r7_0[10030214] = r0_0.RT_8
r7_0[10030299] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10030201,
  nextQuestIds = {
    Success = 10030201,
  },
}
r6_0.Quests = r7_0
r6_0.StartQuestId = 10030299
r4_0[100302] = r6_0
r6_0 = {
  EndQuestId = 10030301,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 100303,
}
r7_0 = {
  [10030301] = r0_0.RT_4,
}
r7_0[10030394] = {
  IsMultiQuest = false,
  SubRegionId = 101108,
  nextQuestId = 10030301,
  nextQuestIds = {
    Success = 10030301,
  },
}
r7_0[10030395] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10030394,
  nextQuestIds = {
    Success = 10030394,
  },
}
r7_0[10030396] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10030395,
  nextQuestIds = {
    Success = 10030395,
  },
}
r7_0[10030397] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10030396,
  nextQuestIds = {
    Success = 10030396,
  },
}
r7_0[10030398] = {
  IsMultiQuest = false,
  SubRegionId = 101110,
  nextQuestId = 10030397,
  nextQuestIds = {
    Success = 10030397,
  },
}
r7_0[10030399] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 10030398,
  nextQuestIds = {
    Success = 10030398,
  },
}
r6_0.Quests = r7_0
r6_0.StartQuestId = 10030399
r4_0[100303] = r6_0
r6_0 = {
  EndQuestId = 10030405,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 100304,
}
r7_0 = {}
r7_0[10030401] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 10030402,
  nextQuestIds = {
    Success = 10030402,
  },
}
r7_0[10030402] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10030403,
  nextQuestIds = {
    Success = 10030403,
  },
}
r7_0[10030403] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10030404,
  nextQuestIds = {
    Success = 10030404,
  },
}
r7_0[10030404] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10030405,
  nextQuestIds = {
    Success = 10030405,
  },
}
r7_0[10030405] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  SuccQuestDeliver = {
    DeliverType = 1,
    Id = 103201,
    IsWhite = false,
    StartIndex = 1,
  },
  nextQuestIds = r0_0.RT_2,
}
r7_0[10030498] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 10030499,
  nextQuestIds = {
    Success = 10030499,
  },
}
r7_0[10030499] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  SuccQuestDeliver = r0_0.RT_7,
  nextQuestId = 10030401,
  nextQuestIds = {
    Success = 10030401,
  },
}
r6_0.Quests = r7_0
r6_0.StartQuestId = 10030498
r4_0[100304] = r6_0
r6_0 = {
  EndQuestId = 10030512,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 100305,
}
r7_0 = {}
r7_0[10030501] = {
  IsMultiQuest = false,
  SubRegionId = 103201,
  nextQuestId = 10030502,
  nextQuestIds = {
    Success = 10030502,
  },
}
r7_0[10030502] = {
  IsMultiQuest = false,
  SubRegionId = 103201,
  nextQuestId = 10030503,
  nextQuestIds = {
    Success = 10030503,
  },
}
r7_0[10030503] = {
  IsMultiQuest = false,
  SubRegionId = 103201,
  nextQuestId = 10030504,
  nextQuestIds = {
    Success = 10030504,
  },
}
r7_0[10030504] = {
  IsMultiQuest = false,
  SubRegionId = 103201,
  nextQuestId = 10030505,
  nextQuestIds = {
    Success = 10030505,
  },
}
r7_0[10030505] = {
  IsMultiQuest = false,
  SubRegionId = 103201,
  nextQuestId = 10030506,
  nextQuestIds = {
    Success = 10030506,
  },
}
r7_0[10030506] = {
  IsMultiQuest = false,
  SubRegionId = 103201,
  nextQuestId = 10030507,
  nextQuestIds = {
    Success = 10030507,
  },
}
r7_0[10030507] = {
  IsMultiQuest = false,
  SubRegionId = 103201,
  SuccQuestDeliver = {
    DeliverType = 1,
    Id = 101703,
    IsWhite = false,
    StartIndex = 1,
  },
  nextQuestId = 10030508,
  nextQuestIds = {
    Success = 10030508,
  },
}
r7_0[10030508] = {
  IsMultiQuest = false,
  SubRegionId = 101703,
  SuccQuestDeliver = {
    DeliverType = 1,
    Id = 101103,
    IsWhite = false,
    StartIndex = 1,
  },
  nextQuestId = 10030509,
  nextQuestIds = {
    Success = 10030509,
  },
}
r7_0[10030509] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 10030510,
  nextQuestIds = {
    Success = 10030510,
  },
}
r7_0[10030510] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  SuccQuestDeliver = r0_0.RT_9,
  nextQuestId = 10030511,
  nextQuestIds = {
    Success = 10030511,
  },
}
r7_0[10030511] = {
  IsMultiQuest = false,
  SubRegionId = 101901,
  nextQuestId = 10030512,
  nextQuestIds = {
    Success = 10030512,
  },
}
r7_0[10030512] = r0_0.RT_10
r6_0.Quests = r7_0
r6_0.StartQuestId = 10030501
r4_0[100305] = r6_0
r6_0 = {
  EndQuestId = 10030601,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 100306,
}
r6_0.Quests = {
  [10030601] = {
    IsMultiQuest = false,
    SubRegionId = 101901,
    SuccQuestDeliver = r0_0.RT_7,
    nextQuestIds = r0_0.RT_2,
  },
}
r6_0.StartQuestId = 10030601
r4_0[100306] = r6_0
r6_0 = {
  EndQuestId = 10030702,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 100307,
}
r7_0 = {}
r7_0[10030701] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 10030702,
  nextQuestIds = {
    Success = 10030702,
  },
}
r7_0[10030702] = r0_0.RT_8
r6_0.Quests = r7_0
r6_0.StartQuestId = 10030701
r4_0[100307] = r6_0
r6_0 = {
  EndQuestId = 11010109,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 110101,
}
r7_0 = {}
r7_0[11010101] = {
  IsMultiQuest = false,
  SubRegionId = 100104,
  SuccQuestDeliver = {
    DeliverType = 1,
    Id = 102101,
    IsWhite = false,
    StartIndex = 1,
  },
  nextQuestId = 11010104,
  nextQuestIds = {
    Success = 11010104,
  },
}
r7_0[11010103] = {
  IsMultiQuest = false,
  SubRegionId = 210101,
  SuccQuestDeliver = r0_0.RT_1,
  nextQuestId = 11010101,
  nextQuestIds = {
    Success = 11010101,
  },
}
r7_0[11010104] = {
  IsMultiQuest = false,
  SubRegionId = 102101,
  nextQuestId = 11010106,
  nextQuestIds = {
    Success = 11010106,
  },
}
r7_0[11010106] = {
  IsMultiQuest = false,
  SubRegionId = 102101,
  nextQuestId = 11010107,
  nextQuestIds = {
    Success = 11010107,
  },
}
r7_0[11010107] = {
  IsMultiQuest = false,
  SubRegionId = 102101,
  nextQuestId = 11010108,
  nextQuestIds = {
    Success = 11010108,
  },
}
r7_0[11010108] = {
  IsMultiQuest = false,
  SubRegionId = 102101,
  nextQuestId = 11010109,
  nextQuestIds = {
    Success = 11010109,
  },
}
r7_0[11010109] = r0_0.RT_11
r6_0.Quests = r7_0
r6_0.StartQuestId = 11010103
r4_0[110101] = r6_0
r6_0 = {
  EndQuestId = 11010308,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 110103,
}
r7_0 = {}
r7_0[11010301] = {
  IsMultiQuest = false,
  SubRegionId = 102101,
  nextQuestId = 11010311,
  nextQuestIds = {
    Success = 11010311,
  },
}
r7_0[11010303] = {
  IsMultiQuest = false,
  SubRegionId = 102101,
  nextQuestId = 11010312,
  nextQuestIds = {
    Success = 11010312,
  },
}
r7_0[11010305] = {
  IsMultiQuest = false,
  SubRegionId = 102101,
  nextQuestId = 11010306,
  nextQuestIds = {
    Success = 11010306,
  },
}
r7_0[11010306] = {
  IsMultiQuest = false,
  SubRegionId = 102101,
  nextQuestId = 11010309,
  nextQuestIds = {
    Success = 11010309,
  },
}
r7_0[11010307] = {
  IsMultiQuest = false,
  SubRegionId = 102101,
  nextQuestId = 11010303,
  nextQuestIds = {
    Success = 11010303,
  },
}
r7_0[11010308] = r0_0.RT_11
r7_0[11010309] = {
  IsMultiQuest = false,
  SubRegionId = 102101,
  nextQuestId = 11010308,
  nextQuestIds = {
    Success = 11010308,
  },
}
r7_0[11010311] = {
  IsMultiQuest = false,
  SubRegionId = 102101,
  nextQuestId = 11010314,
  nextQuestIds = {
    Success = 11010314,
  },
}
r7_0[11010312] = {
  IsMultiQuest = false,
  SubRegionId = 102101,
  nextQuestId = 11010313,
  nextQuestIds = {
    Success = 11010313,
  },
}
r7_0[11010313] = {
  IsMultiQuest = false,
  SubRegionId = 102101,
  nextQuestId = 11010305,
  nextQuestIds = {
    Success = 11010305,
  },
}
r7_0[11010314] = {
  IsMultiQuest = false,
  SubRegionId = 102101,
  nextQuestId = 11010307,
  nextQuestIds = {
    Success = 11010307,
  },
}
r6_0.Quests = r7_0
r6_0.StartQuestId = 11010301
r4_0[110103] = r6_0
r6_0 = {
  EndQuestId = 11010516,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 110105,
}
r7_0 = {}
r7_0[11010501] = {
  IsMultiQuest = false,
  SubRegionId = 102101,
  nextQuestId = 11010525,
  nextQuestIds = {
    Success = 11010525,
  },
}
r7_0[11010502] = {
  IsMultiQuest = false,
  SubRegionId = 102101,
  nextQuestId = 11010520,
  nextQuestIds = {
    Success = 11010520,
  },
}
r7_0[11010505] = {
  IsMultiQuest = false,
  SubRegionId = 102101,
  nextQuestId = 11010518,
  nextQuestIds = {
    Success = 11010518,
  },
}
r7_0[11010507] = {
  IsMultiQuest = false,
  SubRegionId = 102102,
  nextQuestId = 11010509,
  nextQuestIds = {
    Success = 11010509,
  },
}
r7_0[11010509] = {
  IsMultiQuest = false,
  SubRegionId = 102102,
  nextQuestId = 11010510,
  nextQuestIds = {
    Success = 11010510,
  },
}
r7_0[11010510] = {
  IsMultiQuest = false,
  SubRegionId = 102102,
  nextQuestId = 11010521,
  nextQuestIds = {
    Success = 11010521,
  },
}
r7_0[11010511] = {
  IsMultiQuest = false,
  SubRegionId = 102102,
  nextQuestId = 11010528,
  nextQuestIds = {
    Success = 11010528,
  },
}
r7_0[11010512] = {
  IsMultiQuest = false,
  SubRegionId = 102102,
  nextQuestId = 11010513,
  nextQuestIds = {
    Success = 11010513,
  },
}
r7_0[11010513] = {
  IsMultiQuest = false,
  SubRegionId = 102102,
  nextQuestId = 11010514,
  nextQuestIds = {
    Success = 11010514,
  },
}
r7_0[11010514] = {
  IsMultiQuest = false,
  SubRegionId = 102102,
  nextQuestId = 11010519,
  nextQuestIds = {
    Success = 11010519,
  },
}
r7_0[11010515] = {
  IsMultiQuest = false,
  SubRegionId = 102102,
  nextQuestId = 11010516,
  nextQuestIds = {
    Success = 11010516,
  },
}
r7_0[11010516] = r0_0.RT_12
r7_0[11010518] = {
  IsMultiQuest = false,
  SubRegionId = 102101,
  nextQuestId = 11010524,
  nextQuestIds = {
    Success = 11010524,
  },
}
r7_0[11010519] = {
  IsMultiQuest = false,
  SubRegionId = 102102,
  nextQuestId = 11010515,
  nextQuestIds = {
    Success = 11010515,
  },
}
r7_0[11010520] = {
  IsMultiQuest = false,
  SubRegionId = 102101,
  nextQuestId = 11010507,
  nextQuestIds = {
    Success = 11010507,
  },
}
r7_0[11010521] = {
  IsMultiQuest = false,
  SubRegionId = 102102,
  nextQuestId = 11010522,
  nextQuestIds = {
    Success = 11010522,
  },
}
r7_0[11010522] = {
  IsMultiQuest = false,
  SubRegionId = 102102,
  nextQuestId = 11010523,
  nextQuestIds = {
    Success = 11010523,
  },
}
r7_0[11010523] = {
  IsMultiQuest = false,
  SubRegionId = 102102,
  nextQuestId = 11010526,
  nextQuestIds = {
    Success = 11010526,
  },
}
r7_0[11010524] = {
  IsMultiQuest = false,
  SubRegionId = 102101,
  nextQuestId = 11010502,
  nextQuestIds = {
    Success = 11010502,
  },
}
r7_0[11010525] = {
  IsMultiQuest = false,
  SubRegionId = 102101,
  nextQuestId = 11010505,
  nextQuestIds = {
    Success = 11010505,
  },
}
r7_0[11010526] = {
  IsMultiQuest = false,
  SubRegionId = 102102,
  nextQuestId = 11010511,
  nextQuestIds = {
    Success = 11010511,
  },
}
r7_0[11010527] = {
  IsMultiQuest = false,
  SubRegionId = 102102,
  nextQuestId = 11010529,
  nextQuestIds = {
    Success = 11010529,
  },
}
r7_0[11010528] = {
  IsMultiQuest = false,
  SubRegionId = 102102,
  nextQuestId = 11010527,
  nextQuestIds = {
    Success = 11010527,
  },
}
r7_0[11010529] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 11010512,
  nextQuestIds = {
    Success = 11010512,
  },
}
r6_0.Quests = r7_0
r6_0.StartQuestId = 11010501
r4_0[110105] = r6_0
r6_0 = {
  EndQuestId = 11010706,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 110107,
}
r7_0 = {}
r7_0[11010702] = {
  IsMultiQuest = false,
  SubRegionId = 102102,
  nextQuestId = 11010705,
  nextQuestIds = {
    Success = 11010705,
  },
}
r7_0[11010704] = {
  IsMultiQuest = false,
  SubRegionId = 102102,
  nextQuestId = 11010706,
  nextQuestIds = {
    Success = 11010706,
  },
}
r7_0[11010705] = {
  IsMultiQuest = false,
  SubRegionId = 102102,
  nextQuestId = 11010704,
  nextQuestIds = {
    Success = 11010704,
  },
}
r7_0[11010706] = r0_0.RT_12
r6_0.Quests = r7_0
r6_0.StartQuestId = 11010702
r4_0[110107] = r6_0
r6_0 = {
  EndQuestId = 11010816,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 110108,
}
r7_0 = {}
r7_0[11010801] = {
  IsMultiQuest = false,
  SubRegionId = 102103,
  nextQuestId = 11010802,
  nextQuestIds = {
    Success = 11010802,
  },
}
r7_0[11010802] = {
  IsMultiQuest = false,
  SubRegionId = 102103,
  nextQuestId = 11010804,
  nextQuestIds = {
    Success = 11010804,
  },
}
r7_0[11010804] = {
  IsMultiQuest = false,
  SubRegionId = 102103,
  SuccQuestDeliver = {
    DeliverType = 1,
    Id = 102104,
    IsWhite = false,
    StartIndex = 1,
  },
  nextQuestId = 11010816,
  nextQuestIds = {
    Success = 11010816,
  },
}
r7_0[11010808] = {
  IsMultiQuest = false,
  SubRegionId = 102102,
  nextQuestId = 11010809,
  nextQuestIds = {
    Success = 11010809,
  },
}
r7_0[11010809] = {
  IsMultiQuest = false,
  SubRegionId = 102102,
  nextQuestId = 11010815,
  nextQuestIds = {
    Success = 11010815,
  },
}
r7_0[11010810] = {
  IsMultiQuest = false,
  SubRegionId = 102102,
  nextQuestId = 11010813,
  nextQuestIds = {
    Success = 11010813,
  },
}
r7_0[11010812] = {
  IsMultiQuest = false,
  SubRegionId = 102102,
  nextQuestId = 11010814,
  nextQuestIds = {
    Success = 11010814,
  },
}
r7_0[11010813] = {
  IsMultiQuest = false,
  SubRegionId = 102102,
  nextQuestId = 11010812,
  nextQuestIds = {
    Success = 11010812,
  },
}
r7_0[11010814] = {
  IsMultiQuest = false,
  SubRegionId = 102102,
  SuccQuestDeliver = {
    DeliverType = 1,
    Id = 102103,
    IsWhite = false,
    StartIndex = 1,
  },
  nextQuestId = 11010801,
  nextQuestIds = {
    Success = 11010801,
  },
}
r7_0[11010815] = {
  IsMultiQuest = false,
  SubRegionId = 102102,
  nextQuestId = 11010810,
  nextQuestIds = {
    Success = 11010810,
  },
}
r7_0[11010816] = {
  IsMultiQuest = false,
  SubRegionId = 102104,
  nextQuestIds = r0_0.RT_2,
}
r6_0.Quests = r7_0
r6_0.StartQuestId = 11010808
r4_0[110108] = r6_0
r6_0 = {
  EndQuestId = 11010909,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 110109,
}
r7_0 = {}
r7_0[11010902] = {
  IsMultiQuest = false,
  SubRegionId = 102104,
  nextQuestId = 11010907,
  nextQuestIds = {
    Success = 11010907,
  },
}
r7_0[11010903] = {
  IsMultiQuest = false,
  SubRegionId = 102104,
  nextQuestId = 11010904,
  nextQuestIds = {
    Success = 11010904,
  },
}
r7_0[11010904] = {
  IsMultiQuest = false,
  SubRegionId = 102104,
  nextQuestId = 11010910,
  nextQuestIds = {
    Success = 11010910,
  },
}
r7_0[11010905] = {
  IsMultiQuest = false,
  SubRegionId = 102104,
  nextQuestId = 11010906,
  nextQuestIds = {
    Success = 11010906,
  },
}
r7_0[11010906] = {
  IsMultiQuest = false,
  SubRegionId = 102104,
  SuccQuestDeliver = r0_0.RT_9,
  nextQuestId = 11010909,
  nextQuestIds = {
    Success = 11010909,
  },
}
r7_0[11010907] = {
  IsMultiQuest = false,
  SubRegionId = 102104,
  nextQuestId = 11010908,
  nextQuestIds = {
    Success = 11010908,
  },
}
r7_0[11010908] = {
  IsMultiQuest = false,
  SubRegionId = 102104,
  nextQuestId = 11010903,
  nextQuestIds = {
    Success = 11010903,
  },
}
r7_0[11010909] = {
  IsMultiQuest = false,
  SubRegionId = 101901,
  SuccQuestDeliver = r0_0.RT_6,
  nextQuestIds = r0_0.RT_2,
}
r7_0[11010910] = {
  IsMultiQuest = false,
  SubRegionId = 102104,
  nextQuestId = 11010905,
  nextQuestIds = {
    Success = 11010905,
  },
}
r6_0.Quests = r7_0
r6_0.StartQuestId = 11010902
r4_0[110109] = r6_0
r6_0 = {
  EndQuestId = 12000104,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 120001,
}
r7_0 = {}
r7_0[12000101] = {
  IsMultiQuest = false,
  SubRegionId = 101107,
  nextQuestId = 12000102,
  nextQuestIds = {
    Success = 12000102,
  },
}
r7_0[12000102] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 12000103,
  nextQuestIds = {
    Success = 12000103,
  },
}
r7_0[12000103] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 12000104,
  nextQuestIds = {
    Success = 12000104,
  },
}
r7_0[12000104] = r0_0.RT_4
r6_0.Quests = r7_0
r6_0.StartQuestId = 12000101
r4_0[120001] = r6_0
r6_0 = {
  EndQuestId = 12000209,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 120002,
}
r7_0 = {}
r7_0[12000201] = {
  IsMultiQuest = false,
  SubRegionId = 101901,
  nextQuestId = 12000202,
  nextQuestIds = {
    Success = 12000202,
  },
}
r7_0[12000202] = {
  IsMultiQuest = false,
  SubRegionId = 101901,
  nextQuestId = 12000203,
  nextQuestIds = {
    Success = 12000203,
  },
}
r7_0[12000203] = {
  IsMultiQuest = false,
  SubRegionId = 101901,
  nextQuestId = 12000204,
  nextQuestIds = {
    Success = 12000204,
  },
}
r7_0[12000204] = {
  IsMultiQuest = false,
  SubRegionId = 101901,
  nextQuestId = 12000205,
  nextQuestIds = {
    Success = 12000205,
  },
}
r7_0[12000205] = {
  IsMultiQuest = false,
  SubRegionId = 101901,
  nextQuestId = 12000206,
  nextQuestIds = {
    Success = 12000206,
  },
}
r7_0[12000206] = {
  IsMultiQuest = false,
  SubRegionId = 101901,
  nextQuestId = 12000207,
  nextQuestIds = {
    Success = 12000207,
  },
}
r7_0[12000207] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 12000208,
  nextQuestIds = {
    Success = 12000208,
  },
}
r7_0[12000208] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 12000209,
  nextQuestIds = {
    Success = 12000209,
  },
}
r7_0[12000209] = r0_0.RT_5
r6_0.Quests = r7_0
r6_0.StartQuestId = 12000201
r4_0[120002] = r6_0
r6_0 = {
  EndQuestId = 12000308,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 120003,
}
r7_0 = {}
r7_0[12000301] = {
  IsMultiQuest = false,
  SubRegionId = 101107,
  SuccQuestDeliver = r0_0.RT_6,
  nextQuestId = 12000302,
  nextQuestIds = {
    Success = 12000302,
  },
}
r7_0[12000302] = {
  IsMultiQuest = false,
  SubRegionId = 210101,
  nextQuestId = 12000303,
  nextQuestIds = {
    Success = 12000303,
  },
}
r7_0[12000303] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 12000304,
  nextQuestIds = {
    Success = 12000304,
  },
}
r7_0[12000304] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 12000305,
  nextQuestIds = {
    Success = 12000305,
  },
}
r7_0[12000305] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 12000306,
  nextQuestIds = {
    Success = 12000306,
  },
}
r7_0[12000306] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 12000307,
  nextQuestIds = {
    Success = 12000307,
  },
}
r7_0[12000307] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 12000308,
  nextQuestIds = {
    Success = 12000308,
  },
}
r7_0[12000308] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  SuccQuestDeliver = {
    DeliverType = 1,
    Id = 104108,
    IsWhite = false,
    StartIndex = 1,
  },
  nextQuestIds = r0_0.RT_2,
}
r6_0.Quests = r7_0
r6_0.StartQuestId = 12000301
r4_0[120003] = r6_0
r6_0 = {
  EndQuestId = 12010112,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 120101,
}
r7_0 = {}
r7_0[12010101] = {
  IsMultiQuest = false,
  SubRegionId = 104108,
  nextQuestId = 12010102,
  nextQuestIds = {
    Success = 12010102,
  },
}
r7_0[12010102] = {
  IsMultiQuest = false,
  SubRegionId = 104108,
  nextQuestId = 12010103,
  nextQuestIds = {
    Success = 12010103,
  },
}
r7_0[12010103] = {
  IsMultiQuest = false,
  SubRegionId = 104108,
  nextQuestId = 12010104,
  nextQuestIds = {
    Success = 12010104,
  },
}
r7_0[12010104] = {
  IsMultiQuest = false,
  SubRegionId = 104108,
  nextQuestId = 12010105,
  nextQuestIds = {
    Success = 12010105,
  },
}
r7_0[12010105] = {
  IsMultiQuest = false,
  SubRegionId = 104108,
  nextQuestId = 12010106,
  nextQuestIds = {
    Success = 12010106,
  },
}
r7_0[12010106] = {
  IsMultiQuest = false,
  SubRegionId = 104108,
  nextQuestId = 12010107,
  nextQuestIds = {
    Success = 12010107,
  },
}
r7_0[12010107] = {
  IsMultiQuest = false,
  SubRegionId = 104108,
  nextQuestId = 12010108,
  nextQuestIds = {
    Success = 12010108,
  },
}
r7_0[12010108] = {
  IsMultiQuest = false,
  SubRegionId = 104108,
  nextQuestId = 12010109,
  nextQuestIds = {
    Success = 12010109,
  },
}
r7_0[12010109] = {
  IsMultiQuest = false,
  SubRegionId = 104108,
  nextQuestId = 12010110,
  nextQuestIds = {
    Success = 12010110,
  },
}
r7_0[12010110] = {
  IsMultiQuest = false,
  SubRegionId = 104108,
  nextQuestId = 12010111,
  nextQuestIds = {
    Success = 12010111,
  },
}
r7_0[12010111] = {
  IsMultiQuest = false,
  SubRegionId = 104108,
  nextQuestId = 12010112,
  nextQuestIds = {
    Success = 12010112,
  },
}
r7_0[12010112] = r0_0.RT_4
r6_0.Quests = r7_0
r6_0.StartQuestId = 12010101
r4_0[120101] = r6_0
r6_0 = {
  EndQuestId = 12010214,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 120102,
}
r7_0 = {}
r7_0[12010201] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 12010203,
  nextQuestIds = {
    Success = 12010203,
  },
}
r7_0[12010203] = {
  IsMultiQuest = false,
  SubRegionId = 104110,
  nextQuestId = 12010204,
  nextQuestIds = {
    Success = 12010204,
  },
}
r7_0[12010204] = {
  IsMultiQuest = false,
  SubRegionId = 104110,
  nextQuestId = 12010205,
  nextQuestIds = {
    Success = 12010205,
  },
}
r7_0[12010205] = {
  IsMultiQuest = false,
  SubRegionId = 104110,
  nextQuestId = 12010206,
  nextQuestIds = {
    Success = 12010206,
  },
}
r7_0[12010206] = {
  IsMultiQuest = false,
  SubRegionId = 104110,
  nextQuestId = 12010250,
  nextQuestIds = {
    Success = 12010250,
  },
}
r7_0[12010207] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 12010208,
  nextQuestIds = {
    Success = 12010208,
  },
}
r7_0[12010208] = {
  IsMultiQuest = false,
  SubRegionId = 104103,
  nextQuestId = 12010253,
  nextQuestIds = {
    Success = 12010253,
  },
}
r7_0[12010209] = {
  IsMultiQuest = false,
  SubRegionId = 104103,
  nextQuestId = 12010252,
  nextQuestIds = {
    Success = 12010252,
  },
}
r7_0[12010210] = {
  IsMultiQuest = false,
  SubRegionId = 104103,
  nextQuestId = 12010211,
  nextQuestIds = {
    Success = 12010211,
  },
}
r7_0[12010211] = {
  IsMultiQuest = false,
  SubRegionId = 104103,
  nextQuestId = 12010212,
  nextQuestIds = {
    Success = 12010212,
  },
}
r7_0[12010212] = {
  IsMultiQuest = false,
  SubRegionId = 104103,
  nextQuestId = 12010213,
  nextQuestIds = {
    Success = 12010213,
  },
}
r7_0[12010213] = {
  IsMultiQuest = false,
  SubRegionId = 104103,
  nextQuestId = 12010214,
  nextQuestIds = {
    Success = 12010214,
  },
}
r7_0[12010214] = r0_0.RT_4
r7_0[12010250] = {
  IsMultiQuest = false,
  SubRegionId = 104110,
  nextQuestId = 12010254,
  nextQuestIds = {
    Success = 12010254,
  },
}
r7_0[12010251] = {
  IsMultiQuest = false,
  SubRegionId = 104103,
  nextQuestId = 12010210,
  nextQuestIds = {
    Success = 12010210,
  },
}
r7_0[12010252] = {
  IsMultiQuest = false,
  SubRegionId = 104103,
  nextQuestId = 12010251,
  nextQuestIds = {
    Success = 12010251,
  },
}
r7_0[12010253] = {
  IsMultiQuest = false,
  SubRegionId = 104103,
  nextQuestId = 12010209,
  nextQuestIds = {
    Success = 12010209,
  },
}
r7_0[12010254] = {
  IsMultiQuest = false,
  SubRegionId = 104107,
  nextQuestId = 12010207,
  nextQuestIds = {
    Success = 12010207,
  },
}
r6_0.Quests = r7_0
r6_0.StartQuestId = 12010201
r4_0[120102] = r6_0
r6_0 = {
  EndQuestIds = {
    [12010317] = true,
    [12010318] = true,
  },
  HavePreQuest = false,
  IsMultiEndQuest = true,
  QuestChainId = 120103,
}
r7_0 = {}
r7_0[12010301] = {
  IsMultiQuest = false,
  SubRegionId = 104109,
  nextQuestId = 12010302,
  nextQuestIds = {
    Success = 12010302,
  },
}
r7_0[12010302] = {
  IsMultiQuest = false,
  SubRegionId = 104109,
  nextQuestId = 12010303,
  nextQuestIds = {
    Success = 12010303,
  },
}
r7_0[12010303] = {
  IsMultiQuest = false,
  SubRegionId = 104109,
  nextQuestId = 12010304,
  nextQuestIds = {
    Success = 12010304,
  },
}
r7_0[12010304] = {
  IsMultiQuest = false,
  SubRegionId = 104109,
  nextQuestId = 12010306,
  nextQuestIds = {
    Success = 12010306,
  },
}
r7_0[12010306] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 12010307,
  nextQuestIds = {
    Success = 12010307,
  },
}
r7_0[12010307] = {
  IsMultiQuest = false,
  SubRegionId = 104109,
  nextQuestId = 12010308,
  nextQuestIds = {
    Success = 12010308,
  },
}
r7_0[12010308] = {
  IsMultiQuest = false,
  SubRegionId = 104109,
  nextQuestId = 12010322,
  nextQuestIds = {
    Success = 12010322,
  },
}
r7_0[12010309] = {
  IsMultiQuest = false,
  SubRegionId = 104105,
  nextQuestId = 12010351,
  nextQuestIds = {
    Success = 12010351,
  },
}
r7_0[12010310] = {
  IsMultiQuest = false,
  SubRegionId = 104105,
  nextQuestId = 12010311,
  nextQuestIds = {
    Success = 12010311,
  },
}
r7_0[12010311] = {
  IsMultiQuest = false,
  SubRegionId = 104105,
  nextQuestId = 12010312,
  nextQuestIds = {
    Success = 12010312,
  },
}
r7_0[12010312] = {
  IsMultiQuest = false,
  SubRegionId = 104105,
  nextQuestId = 12010313,
  nextQuestIds = {
    Success = 12010313,
  },
}
r7_0[12010313] = {
  IsMultiQuest = false,
  SubRegionId = 104107,
  nextQuestId = 12010314,
  nextQuestIds = {
    Success = 12010314,
  },
}
r7_0[12010314] = {
  IsMultiQuest = false,
  SubRegionId = 104110,
  nextQuestId = 12010320,
  nextQuestIds = {
    Success = 12010320,
  },
}
r7_0[12010315] = {
  IsMultiQuest = false,
  SubRegionId = 104110,
  nextQuestId = 12010316,
  nextQuestIds = {
    Success = 12010316,
  },
}
r7_0[12010316] = {
  IsMultiQuest = true,
  SubRegionId = 104110,
  nextQuestId = 12010317,
  nextQuestIds = {
    扶疏 = 12010317,
    虬先生 = 12010318,
  },
}
r7_0[12010317] = r0_0.RT_13
r7_0[12010318] = r0_0.RT_13
r7_0[12010320] = {
  IsMultiQuest = false,
  SubRegionId = 104110,
  nextQuestId = 12010315,
  nextQuestIds = {
    Success = 12010315,
  },
}
r7_0[12010322] = {
  IsMultiQuest = false,
  SubRegionId = 104109,
  nextQuestId = 12010309,
  nextQuestIds = {
    Success = 12010309,
  },
}
r7_0[12010351] = {
  IsMultiQuest = false,
  SubRegionId = 104105,
  nextQuestId = 12010352,
  nextQuestIds = {
    Success = 12010352,
  },
}
r7_0[12010352] = {
  IsMultiQuest = false,
  SubRegionId = 104105,
  nextQuestId = 12010310,
  nextQuestIds = {
    Success = 12010310,
  },
}
r6_0.Quests = r7_0
r6_0.StartQuestId = 12010301
r4_0[120103] = r6_0
r6_0 = {
  EndQuestId = 12010420,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 120104,
}
r7_0 = {}
r7_0[12010401] = {
  IsMultiQuest = false,
  SubRegionId = 104106,
  nextQuestId = 12010402,
  nextQuestIds = {
    Success = 12010402,
  },
}
r7_0[12010402] = {
  IsMultiQuest = false,
  SubRegionId = 104106,
  nextQuestId = 12010403,
  nextQuestIds = {
    Success = 12010403,
  },
}
r7_0[12010403] = {
  IsMultiQuest = false,
  SubRegionId = 104106,
  nextQuestId = 12010404,
  nextQuestIds = {
    Success = 12010404,
  },
}
r7_0[12010404] = {
  IsMultiQuest = false,
  SubRegionId = 104106,
  nextQuestId = 12010405,
  nextQuestIds = {
    Success = 12010405,
  },
}
r7_0[12010405] = {
  IsMultiQuest = false,
  SubRegionId = 104104,
  nextQuestId = 12010406,
  nextQuestIds = {
    Success = 12010406,
  },
}
r7_0[12010406] = {
  IsMultiQuest = false,
  SubRegionId = 104104,
  nextQuestId = 12010407,
  nextQuestIds = {
    Success = 12010407,
  },
}
r7_0[12010407] = {
  IsMultiQuest = false,
  SubRegionId = 104104,
  nextQuestId = 12010408,
  nextQuestIds = {
    Success = 12010408,
  },
}
r7_0[12010408] = {
  IsMultiQuest = false,
  SubRegionId = 104104,
  nextQuestId = 12010409,
  nextQuestIds = {
    Success = 12010409,
  },
}
r7_0[12010409] = {
  IsMultiQuest = false,
  SubRegionId = 104104,
  nextQuestId = 12010411,
  nextQuestIds = {
    Success = 12010411,
  },
}
r7_0[12010411] = {
  IsMultiQuest = false,
  SubRegionId = 104104,
  nextQuestId = 12010412,
  nextQuestIds = {
    Success = 12010412,
  },
}
r7_0[12010412] = {
  IsMultiQuest = false,
  SubRegionId = 104104,
  nextQuestId = 12010413,
  nextQuestIds = {
    Success = 12010413,
  },
}
r7_0[12010413] = {
  IsMultiQuest = false,
  SubRegionId = 104104,
  nextQuestId = 12010414,
  nextQuestIds = {
    Success = 12010414,
  },
}
r7_0[12010414] = {
  IsMultiQuest = false,
  SubRegionId = 104104,
  nextQuestId = 12010415,
  nextQuestIds = {
    Success = 12010415,
  },
}
r7_0[12010415] = {
  IsMultiQuest = false,
  SubRegionId = 104104,
  SuccQuestDeliver = {
    DeliverType = 1,
    Id = 104301,
    IsWhite = false,
    StartIndex = 1,
  },
  nextQuestId = 12010416,
  nextQuestIds = {
    Success = 12010416,
  },
}
r7_0[12010416] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  SuccQuestDeliver = {
    DeliverType = 1,
    Id = 104401,
    IsWhite = false,
    StartIndex = 1,
  },
  nextQuestId = 12010417,
  nextQuestIds = {
    Success = 12010417,
  },
}
r7_0[12010417] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  SuccQuestDeliver = {
    DeliverType = 1,
    Id = 105001,
    IsWhite = true,
    StartIndex = 1,
  },
  nextQuestId = 12010418,
  nextQuestIds = {
    Success = 12010418,
  },
}
r7_0[12010418] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  SuccQuestDeliver = {
    DeliverType = 1,
    Id = 104104,
    IsWhite = true,
    StartIndex = 1,
  },
  nextQuestId = 12010419,
  nextQuestIds = {
    Success = 12010419,
  },
}
r7_0[12010419] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 12010420,
  nextQuestIds = {
    Success = 12010420,
  },
}
r7_0[12010420] = r0_0.RT_14
r6_0.Quests = r7_0
r6_0.StartQuestId = 12010401
r4_0[120104] = r6_0
r6_0 = {
  EndQuestId = 12010516,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 120105,
}
r7_0 = {}
r7_0[12010501] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 12010502,
  nextQuestIds = {
    Success = 12010502,
  },
}
r7_0[12010502] = {
  IsMultiQuest = false,
  SubRegionId = 104109,
  nextQuestId = 12010503,
  nextQuestIds = {
    Success = 12010503,
  },
}
r7_0[12010503] = {
  IsMultiQuest = false,
  SubRegionId = 104102,
  nextQuestId = 12010504,
  nextQuestIds = {
    Success = 12010504,
  },
}
r7_0[12010504] = {
  IsMultiQuest = false,
  SubRegionId = 104102,
  SuccQuestDeliver = {
    DeliverType = 1,
    Id = 104201,
    IsWhite = false,
    StartIndex = 1,
  },
  nextQuestId = 12010517,
  nextQuestIds = {
    Success = 12010517,
  },
}
r7_0[12010513] = {
  IsMultiQuest = false,
  SubRegionId = 104102,
  nextQuestId = 12010514,
  nextQuestIds = {
    Success = 12010514,
  },
}
r7_0[12010514] = {
  IsMultiQuest = false,
  SubRegionId = 104102,
  nextQuestId = 12010515,
  nextQuestIds = {
    Success = 12010515,
  },
}
r7_0[12010515] = {
  IsMultiQuest = false,
  SubRegionId = 104102,
  nextQuestId = 12010516,
  nextQuestIds = {
    Success = 12010516,
  },
}
r7_0[12010516] = {
  IsMultiQuest = false,
  SubRegionId = 104102,
  nextQuestIds = r0_0.RT_2,
}
r7_0[12010517] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  SuccQuestDeliver = {
    DeliverType = 1,
    Id = 104601,
    IsWhite = false,
    StartIndex = 1,
  },
  nextQuestId = 12010518,
  nextQuestIds = {
    Success = 12010518,
  },
}
r7_0[12010518] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  SuccQuestDeliver = {
    DeliverType = 1,
    Id = 104701,
    IsWhite = false,
    StartIndex = 1,
  },
  nextQuestId = 12010519,
  nextQuestIds = {
    Success = 12010519,
  },
}
r7_0[12010519] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  SuccQuestDeliver = {
    DeliverType = 1,
    Id = 104102,
    IsWhite = true,
    StartIndex = 1,
  },
  nextQuestId = 12010513,
  nextQuestIds = {
    Success = 12010513,
  },
}
r6_0.Quests = r7_0
r6_0.StartQuestId = 12010501
r4_0[120105] = r6_0
r6_0 = {
  EndQuestId = 12010608,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 120106,
}
r7_0 = {}
r7_0[12010601] = {
  IsMultiQuest = false,
  SubRegionId = 104110,
  nextQuestId = 12010602,
  nextQuestIds = {
    Success = 12010602,
  },
}
r7_0[12010602] = {
  IsMultiQuest = false,
  SubRegionId = 104105,
  SuccQuestDeliver = {
    DeliverType = 1,
    Id = 105701,
    IsWhite = false,
    StartIndex = 1,
  },
  nextQuestId = 12010603,
  nextQuestIds = {
    Success = 12010603,
  },
}
r7_0[12010603] = {
  IsMultiQuest = false,
  SubRegionId = 105701,
  nextQuestId = 12010604,
  nextQuestIds = {
    Success = 12010604,
  },
}
r7_0[12010604] = {
  IsMultiQuest = false,
  SubRegionId = 105701,
  nextQuestId = 12010605,
  nextQuestIds = {
    Success = 12010605,
  },
}
r7_0[12010605] = {
  IsMultiQuest = false,
  SubRegionId = 105701,
  nextQuestId = 12010606,
  nextQuestIds = {
    Success = 12010606,
  },
}
r7_0[12010606] = {
  IsMultiQuest = false,
  SubRegionId = 105701,
  nextQuestId = 12010607,
  nextQuestIds = {
    Success = 12010607,
  },
}
r7_0[12010607] = {
  IsMultiQuest = false,
  SubRegionId = 105701,
  SuccQuestDeliver = {
    DeliverType = 1,
    Id = 104105,
    IsWhite = false,
    StartIndex = 1,
  },
  nextQuestId = 12010608,
  nextQuestIds = {
    Success = 12010608,
  },
}
r7_0[12010608] = r0_0.RT_15
r6_0.Quests = r7_0
r6_0.StartQuestId = 12010601
r4_0[120106] = r6_0
r6_0 = {
  EndQuestId = 12011109,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 120111,
}
r7_0 = {}
r7_0[12011101] = {
  IsMultiQuest = false,
  SubRegionId = 101105,
  nextQuestId = 12011102,
  nextQuestIds = {
    Success = 12011102,
  },
}
r7_0[12011102] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 12011103,
  nextQuestIds = {
    Success = 12011103,
  },
}
r7_0[12011103] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 12011105,
  nextQuestIds = {
    Success = 12011105,
  },
}
r7_0[12011105] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 12011106,
  nextQuestIds = {
    Success = 12011106,
  },
}
r7_0[12011106] = {
  IsMultiQuest = true,
  SubRegionId = 101101,
  nextQuestId = 12011107,
  nextQuestIds = {
    完成副本 = 12011107,
    未完成副本 = 12011110,
  },
}
r7_0[12011107] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 12011108,
  nextQuestIds = {
    Success = 12011108,
  },
}
r7_0[12011108] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 12011109,
  nextQuestIds = {
    Success = 12011109,
  },
}
r7_0[12011109] = r0_0.RT_16
r7_0[12011110] = {
  IsMultiQuest = false,
  TargetMode = {
    TargetCount = 1,
    TargetId = 70151,
  },
  nextQuestId = 12011107,
  nextQuestIds = {
    Success = 12011107,
  },
}
r7_0[12011150] = {
  IsMultiQuest = false,
  SubRegionId = 101105,
  nextQuestId = 12011101,
  nextQuestIds = {
    Success = 12011101,
  },
}
r6_0.Quests = r7_0
r6_0.StartQuestId = 12011150
r4_0[120111] = r6_0
r6_0 = {
  EndQuestId = 12011207,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 120112,
}
r7_0 = {}
r7_0[12011201] = {
  IsMultiQuest = false,
  SubRegionId = 101105,
  nextQuestId = 12011202,
  nextQuestIds = {
    Success = 12011202,
  },
}
r7_0[12011202] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 12011203,
  nextQuestIds = {
    Success = 12011203,
  },
}
r7_0[12011203] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 12011204,
  nextQuestIds = {
    Success = 12011204,
  },
}
r7_0[12011204] = {
  IsMultiQuest = true,
  SubRegionId = 101101,
  nextQuestId = 12011205,
  nextQuestIds = {
    完成副本 = 12011205,
    未完成副本 = 12011210,
  },
}
r7_0[12011205] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 12011206,
  nextQuestIds = {
    Success = 12011206,
  },
}
r7_0[12011206] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 12011207,
  nextQuestIds = {
    Success = 12011207,
  },
}
r7_0[12011207] = r0_0.RT_16
r7_0[12011210] = {
  IsMultiQuest = false,
  TargetMode = {
    TargetCount = 1,
    TargetId = 70152,
  },
  nextQuestId = 12011205,
  nextQuestIds = {
    Success = 12011205,
  },
}
r7_0[12011250] = {
  IsMultiQuest = false,
  SubRegionId = 101105,
  nextQuestId = 12011201,
  nextQuestIds = {
    Success = 12011201,
  },
}
r6_0.Quests = r7_0
r6_0.StartQuestId = 12011250
r4_0[120112] = r6_0
r6_0 = {
  EndQuestId = 12011308,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 120113,
}
r7_0 = {}
r7_0[12011301] = {
  IsMultiQuest = false,
  SubRegionId = 101105,
  nextQuestId = 12011302,
  nextQuestIds = {
    Success = 12011302,
  },
}
r7_0[12011302] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 12011303,
  nextQuestIds = {
    Success = 12011303,
  },
}
r7_0[12011303] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  SuccQuestDeliver = r0_0.RT_17,
  nextQuestId = 12011305,
  nextQuestIds = {
    Success = 12011305,
  },
}
r7_0[12011305] = {
  IsMultiQuest = false,
  SubRegionId = 101105,
  nextQuestId = 12011306,
  nextQuestIds = {
    Success = 12011306,
  },
}
r7_0[12011306] = {
  IsMultiQuest = true,
  SubRegionId = 101105,
  nextQuestId = 12011308,
  nextQuestIds = {
    完成副本 = 12011308,
    未完成副本 = 12011307,
  },
}
r7_0[12011307] = {
  IsMultiQuest = false,
  TargetMode = {
    TargetCount = 1,
    TargetId = 70153,
  },
  nextQuestId = 12011308,
  nextQuestIds = {
    Success = 12011308,
  },
}
r7_0[12011308] = r0_0.RT_16
r7_0[12011350] = {
  IsMultiQuest = false,
  SubRegionId = 101105,
  nextQuestId = 12011301,
  nextQuestIds = {
    Success = 12011301,
  },
}
r6_0.Quests = r7_0
r6_0.StartQuestId = 12011350
r4_0[120113] = r6_0
r6_0 = {
  EndQuestId = 12011414,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 120114,
}
r7_0 = {}
r7_0[12011401] = {
  IsMultiQuest = false,
  SubRegionId = 101105,
  nextQuestId = 12011403,
  nextQuestIds = {
    Success = 12011403,
  },
}
r7_0[12011403] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  SuccQuestDeliver = r0_0.RT_17,
  nextQuestId = 12011404,
  nextQuestIds = {
    Success = 12011404,
  },
}
r7_0[12011404] = {
  IsMultiQuest = false,
  SubRegionId = 101105,
  SuccQuestDeliver = r0_0.RT_18,
  nextQuestId = 12011405,
  nextQuestIds = {
    Success = 12011405,
  },
}
r7_0[12011405] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 12011406,
  nextQuestIds = {
    Success = 12011406,
  },
}
r7_0[12011406] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 12011407,
  nextQuestIds = {
    Success = 12011407,
  },
}
r7_0[12011407] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 12011408,
  nextQuestIds = {
    Success = 12011408,
  },
}
r7_0[12011408] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 12011409,
  nextQuestIds = {
    Success = 12011409,
  },
}
r7_0[12011409] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 12011410,
  nextQuestIds = {
    Success = 12011410,
  },
}
r7_0[12011410] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 12011411,
  nextQuestIds = {
    Success = 12011411,
  },
}
r7_0[12011411] = {
  IsMultiQuest = false,
  SubRegionId = 101105,
  SuccQuestDeliver = r0_0.RT_18,
  nextQuestId = 12011415,
  nextQuestIds = {
    Success = 12011415,
  },
}
r7_0[12011412] = {
  IsMultiQuest = false,
  SubRegionId = 101105,
  nextQuestId = 12011413,
  nextQuestIds = {
    Success = 12011413,
  },
}
r7_0[12011413] = {
  IsMultiQuest = true,
  SubRegionId = 101105,
  nextQuestId = 12011414,
  nextQuestIds = {
    完成副本 = 12011414,
    未完成副本 = 12011420,
  },
}
r7_0[12011414] = r0_0.RT_16
r7_0[12011415] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  SuccQuestDeliver = r0_0.RT_17,
  nextQuestId = 12011412,
  nextQuestIds = {
    Success = 12011412,
  },
}
r7_0[12011420] = {
  IsMultiQuest = false,
  TargetMode = {
    TargetCount = 1,
    TargetId = 70154,
  },
  nextQuestId = 12011414,
  nextQuestIds = {
    Success = 12011414,
  },
}
r7_0[12011450] = {
  IsMultiQuest = false,
  SubRegionId = 101105,
  nextQuestId = 12011401,
  nextQuestIds = {
    Success = 12011401,
  },
}
r6_0.Quests = r7_0
r6_0.StartQuestId = 12011450
r4_0[120114] = r6_0
r6_0 = {
  EndQuestId = 20010105,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 200101,
}
r7_0 = {}
r7_0[20010101] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 20010102,
  nextQuestIds = {
    Success = 20010102,
  },
}
r7_0[20010102] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 20010103,
  nextQuestIds = {
    Success = 20010103,
  },
}
r7_0[20010103] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 20010104,
  nextQuestIds = {
    Success = 20010104,
  },
}
r7_0[20010104] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 20010105,
  nextQuestIds = {
    Success = 20010105,
  },
}
r7_0[20010105] = r0_0.RT_4
r6_0.Quests = r7_0
r6_0.StartQuestId = 20010101
r4_0[200101] = r6_0
r6_0 = {
  EndQuestId = 20010205,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 200102,
}
r7_0 = {}
r7_0[20010201] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 20010202,
  nextQuestIds = {
    Success = 20010202,
  },
}
r7_0[20010202] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 20010203,
  nextQuestIds = {
    Success = 20010203,
  },
}
r7_0[20010203] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 20010204,
  nextQuestIds = {
    Success = 20010204,
  },
}
r7_0[20010204] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 20010205,
  nextQuestIds = {
    Success = 20010205,
  },
}
r7_0[20010205] = r0_0.RT_4
r6_0.Quests = r7_0
r6_0.StartQuestId = 20010201
r4_0[200102] = r6_0
r6_0 = {
  EndQuestId = 20010306,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 200103,
}
r7_0 = {}
r7_0[20010301] = {
  IsMultiQuest = false,
  SubRegionId = 210101,
  nextQuestId = 20010302,
  nextQuestIds = {
    Success = 20010302,
  },
}
r7_0[20010302] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 20010303,
  nextQuestIds = {
    Success = 20010303,
  },
}
r7_0[20010303] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 20010304,
  nextQuestIds = {
    Success = 20010304,
  },
}
r7_0[20010304] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 20010305,
  nextQuestIds = {
    Success = 20010305,
  },
}
r7_0[20010305] = {
  IsMultiQuest = false,
  TargetMode = {
    TargetCount = 1,
    TargetId = 1400401,
  },
  nextQuestId = 20010306,
  nextQuestIds = {
    Success = 20010306,
  },
}
r7_0[20010306] = r0_0.RT_19
r6_0.Quests = r7_0
r6_0.StartQuestId = 20010301
r4_0[200103] = r6_0
r6_0 = {
  EndQuestId = 20010408,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 200104,
}
r7_0 = {}
r7_0[20010401] = {
  IsMultiQuest = false,
  SubRegionId = 101107,
  nextQuestId = 20010409,
  nextQuestIds = {
    Success = 20010409,
  },
}
r7_0[20010402] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  SuccQuestDeliver = r0_0.RT_3,
  nextQuestId = 20010403,
  nextQuestIds = {
    Success = 20010403,
  },
}
r7_0[20010403] = {
  IsMultiQuest = false,
  SubRegionId = 101107,
  nextQuestId = 20010404,
  nextQuestIds = {
    Success = 20010404,
  },
}
r7_0[20010404] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20010405,
  nextQuestIds = {
    Success = 20010405,
  },
}
r7_0[20010405] = {
  IsMultiQuest = false,
  SubRegionId = 101702,
  nextQuestId = 20010406,
  nextQuestIds = {
    Success = 20010406,
  },
}
r7_0[20010406] = {
  IsMultiQuest = false,
  SubRegionId = 101702,
  nextQuestId = 20010407,
  nextQuestIds = {
    Success = 20010407,
  },
}
r7_0[20010407] = {
  IsMultiQuest = false,
  SubRegionId = 101702,
  nextQuestId = 20010410,
  nextQuestIds = {
    Success = 20010410,
  },
}
r7_0[20010408] = r0_0.RT_5
r7_0[20010409] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 20010402,
  nextQuestIds = {
    Success = 20010402,
  },
}
r7_0[20010410] = {
  IsMultiQuest = false,
  SubRegionId = 101702,
  nextQuestId = 20010415,
  nextQuestIds = {
    Success = 20010415,
  },
}
r7_0[20010415] = {
  IsMultiQuest = false,
  SubRegionId = 101702,
  SuccQuestDeliver = r0_0.RT_3,
  nextQuestId = 20010408,
  nextQuestIds = {
    Success = 20010408,
  },
}
r6_0.Quests = r7_0
r6_0.StartQuestId = 20010401
r4_0[200104] = r6_0
r6_0 = {
  EndQuestIds = {
    [20020106] = true,
    [20020107] = true,
  },
  HavePreQuest = true,
  IsMultiEndQuest = true,
  QuestChainId = 200201,
}
r7_0 = {}
r7_0[20020100] = {
  IsMultiQuest = false,
  IsPreQuest = true,
  SubRegionId = 101101,
  nextQuestId = 20020102,
  nextQuestIds = {
    Success = 20020102,
  },
}
r7_0[20020102] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 20020104,
  nextQuestIds = {
    Success = 20020104,
  },
}
r7_0[20020104] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 20020105,
  nextQuestIds = {
    Success = 20020105,
  },
}
r7_0[20020105] = {
  IsMultiQuest = true,
  SubRegionId = 0,
  nextQuestId = 20020106,
  nextQuestIds = {
    ["【分支2.1】（隐瞒在矿坑中得到的日记）"] = 20020106,
    ["【分支2.2】（交出在矿坑中得到的日记）"] = 20020107,
  },
}
r7_0[20020106] = r0_0.RT_4
r7_0[20020107] = r0_0.RT_4
r6_0.Quests = r7_0
r6_0.StartQuestId = 20020100
r4_0[200201] = r6_0
r6_0 = {
  EndQuestIds = {
    [20020309] = true,
    [20020310] = true,
  },
  HavePreQuest = true,
  IsMultiEndQuest = true,
  QuestChainId = 200203,
}
r7_0 = {}
r7_0[20020300] = {
  IsMultiQuest = false,
  IsPreQuest = true,
  SubRegionId = 101101,
  nextQuestId = 20020312,
  nextQuestIds = {
    Success = 20020312,
  },
}
r7_0[20020302] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20020314,
  nextQuestIds = {
    Success = 20020314,
  },
}
r7_0[20020303] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 20020305,
  nextQuestIds = {
    Success = 20020305,
  },
}
r7_0[20020305] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 20020306,
  nextQuestIds = {
    Success = 20020306,
  },
}
r7_0[20020306] = {
  IsMultiQuest = true,
  SubRegionId = 0,
  nextQuestId = 20020319,
  nextQuestIds = {
    ["（不展示爱丽丝的日记）222"] = 20020319,
    ["（展示爱丽丝的日记）111"] = 20020320,
  },
}
r7_0[20020309] = r0_0.RT_4
r7_0[20020310] = r0_0.RT_20
r7_0[20020312] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20020313,
  nextQuestIds = {
    Success = 20020313,
  },
}
r7_0[20020313] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20020302,
  nextQuestIds = {
    Success = 20020302,
  },
}
r7_0[20020314] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20020303,
  nextQuestIds = {
    Success = 20020303,
  },
}
r7_0[20020319] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20020309,
  nextQuestIds = {
    Success = 20020309,
  },
}
r7_0[20020320] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20020310,
  nextQuestIds = {
    Success = 20020310,
  },
}
r6_0.Quests = r7_0
r6_0.StartQuestId = 20020300
r4_0[200203] = r6_0
r6_0 = {
  EndQuestId = 20020405,
  HavePreQuest = true,
  IsMultiEndQuest = false,
  QuestChainId = 200204,
}
r7_0 = {}
r7_0[20020400] = {
  IsMultiQuest = false,
  IsPreQuest = true,
  SubRegionId = 101107,
  nextQuestId = 20020403,
  nextQuestIds = {
    Success = 20020403,
  },
}
r7_0[20020403] = {
  IsMultiQuest = false,
  TargetMode = {
    TargetCount = 1,
    TargetId = 20020401,
  },
  nextQuestId = 20020404,
  nextQuestIds = {
    Success = 20020404,
  },
}
r7_0[20020404] = {
  IsMultiQuest = false,
  SubRegionId = 101107,
  nextQuestId = 20020405,
  nextQuestIds = {
    Success = 20020405,
  },
}
r7_0[20020405] = r0_0.RT_5
r6_0.Quests = r7_0
r6_0.StartQuestId = 20020400
r4_0[200204] = r6_0
r6_0 = {
  EndQuestId = 20020506,
  HavePreQuest = true,
  IsMultiEndQuest = false,
  QuestChainId = 200205,
}
r7_0 = {}
r7_0[20020501] = {
  IsMultiQuest = false,
  IsPreQuest = true,
  SubRegionId = 101101,
  nextQuestId = 20020503,
  nextQuestIds = {
    Success = 20020503,
  },
}
r7_0[20020503] = {
  IsMultiQuest = false,
  SubRegionId = 100101,
  nextQuestId = 20020504,
  nextQuestIds = {
    Success = 20020504,
  },
}
r7_0[20020504] = {
  IsMultiQuest = false,
  SubRegionId = 100101,
  nextQuestId = 20020505,
  nextQuestIds = {
    Success = 20020505,
  },
}
r7_0[20020505] = {
  IsMultiQuest = false,
  SubRegionId = 100101,
  nextQuestId = 20020507,
  nextQuestIds = {
    Success = 20020507,
  },
}
r7_0[20020506] = r0_0.RT_20
r7_0[20020507] = {
  IsMultiQuest = false,
  SubRegionId = 100101,
  nextQuestId = 20020508,
  nextQuestIds = {
    Success = 20020508,
  },
}
r7_0[20020508] = {
  IsMultiQuest = false,
  SubRegionId = 100101,
  nextQuestId = 20020512,
  nextQuestIds = {
    Success = 20020512,
  },
}
r7_0[20020509] = {
  IsMultiQuest = false,
  SubRegionId = 100101,
  nextQuestId = 20020510,
  nextQuestIds = {
    Success = 20020510,
  },
}
r7_0[20020510] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20020506,
  nextQuestIds = {
    Success = 20020506,
  },
}
r7_0[20020512] = {
  IsMultiQuest = false,
  TargetMode = {
    TargetCount = 1,
    TargetId = 10119,
  },
  nextQuestId = 20020509,
  nextQuestIds = {
    Success = 20020509,
  },
}
r6_0.Quests = r7_0
r6_0.StartQuestId = 20020501
r4_0[200205] = r6_0
r6_0 = {
  EndQuestId = 20020608,
  HavePreQuest = true,
  IsMultiEndQuest = false,
  QuestChainId = 200206,
}
r7_0 = {}
r7_0[20020600] = {
  IsMultiQuest = false,
  IsPreQuest = true,
  SubRegionId = 101107,
  nextQuestId = 20020603,
  nextQuestIds = {
    Success = 20020603,
  },
}
r7_0[20020603] = {
  IsMultiQuest = false,
  SubRegionId = 101107,
  nextQuestId = 20020605,
  nextQuestIds = {
    Success = 20020605,
  },
}
r7_0[20020605] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20020609,
  nextQuestIds = {
    Success = 20020609,
  },
}
r7_0[20020606] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20020607,
  nextQuestIds = {
    Success = 20020607,
  },
}
r7_0[20020607] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20020608,
  nextQuestIds = {
    Success = 20020608,
  },
}
r7_0[20020608] = r0_0.RT_5
r7_0[20020609] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20020606,
  nextQuestIds = {
    Success = 20020606,
  },
}
r6_0.Quests = r7_0
r6_0.StartQuestId = 20020600
r4_0[200206] = r6_0
r6_0 = {
  EndQuestId = 20020706,
  HavePreQuest = true,
  IsMultiEndQuest = false,
  QuestChainId = 200207,
}
r7_0 = {}
r7_0[20020700] = {
  IsMultiQuest = false,
  IsPreQuest = true,
  SubRegionId = 101101,
  nextQuestId = 20020702,
  nextQuestIds = {
    Success = 20020702,
  },
}
r7_0[20020702] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20020703,
  nextQuestIds = {
    Success = 20020703,
  },
}
r7_0[20020703] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20020704,
  nextQuestIds = {
    Success = 20020704,
  },
}
r7_0[20020704] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20020705,
  nextQuestIds = {
    Success = 20020705,
  },
}
r7_0[20020705] = {
  IsMultiQuest = false,
  SubRegionId = 101305,
  nextQuestId = 20020707,
  nextQuestIds = {
    Success = 20020707,
  },
}
r7_0[20020706] = r0_0.RT_20
r7_0[20020707] = {
  IsMultiQuest = false,
  SubRegionId = 101305,
  nextQuestId = 20020706,
  nextQuestIds = {
    Success = 20020706,
  },
}
r6_0.Quests = r7_0
r6_0.StartQuestId = 20020700
r4_0[200207] = r6_0
r6_0 = {
  EndQuestId = 20020803,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 200208,
}
r7_0 = {}
r7_0[20020802] = {
  IsMultiQuest = false,
  SubRegionId = 101106,
  nextQuestId = 20020803,
  nextQuestIds = {
    Success = 20020803,
  },
}
r7_0[20020803] = {
  IsMultiQuest = false,
  SubRegionId = 101106,
  nextQuestIds = r0_0.RT_2,
}
r6_0.Quests = r7_0
r6_0.StartQuestId = 20020802
r4_0[200208] = r6_0
r6_0 = {
  EndQuestId = 20020906,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 200209,
}
r7_0 = {}
r7_0[20020901] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20020902,
  nextQuestIds = {
    Success = 20020902,
  },
}
r7_0[20020902] = {
  IsMultiQuest = true,
  SubRegionId = 101101,
  nextQuestId = 20020903,
  nextQuestIds = {
    选项12 = 20020903,
    选项3 = 20020904,
  },
}
r7_0[20020903] = r0_0.RT_22
r7_0[20020904] = r0_0.RT_22
r7_0[20020905] = {
  IsMultiQuest = false,
  SubRegionId = 101106,
  nextQuestId = 20020906,
  nextQuestIds = {
    Success = 20020906,
  },
}
r7_0[20020906] = r0_0.RT_20
r6_0.Quests = r7_0
r6_0.StartQuestId = 20020901
r4_0[200209] = r6_0
r6_0 = {
  EndQuestId = 20021004,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 200210,
}
r7_0 = {}
r7_0[20021001] = {
  IsMultiQuest = false,
  SubRegionId = 101702,
  nextQuestId = 20021002,
  nextQuestIds = {
    Success = 20021002,
  },
}
r7_0[20021002] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 20021003,
  nextQuestIds = {
    Success = 20021003,
  },
}
r7_0[20021003] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 20021004,
  nextQuestIds = {
    Success = 20021004,
  },
}
r7_0[20021004] = r0_0.RT_19
r7_0[20021007] = {
  IsMultiQuest = false,
  SubRegionId = 101702,
  nextQuestId = 20021001,
  nextQuestIds = {
    Success = 20021001,
  },
}
r6_0.Quests = r7_0
r6_0.StartQuestId = 20021007
r4_0[200210] = r6_0
r6_0 = {
  EndQuestId = 20021105,
  HavePreQuest = true,
  IsMultiEndQuest = false,
  QuestChainId = 200211,
}
r7_0 = {}
r7_0[20021100] = {
  IsMultiQuest = false,
  IsPreQuest = true,
  SubRegionId = 101101,
  nextQuestId = 20021101,
  nextQuestIds = {
    Success = 20021101,
  },
}
r7_0[20021101] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20021102,
  nextQuestIds = {
    Success = 20021102,
  },
}
r7_0[20021102] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20021103,
  nextQuestIds = {
    Success = 20021103,
  },
}
r7_0[20021103] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20021104,
  nextQuestIds = {
    Success = 20021104,
  },
}
r7_0[20021104] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20021105,
  nextQuestIds = {
    Success = 20021105,
  },
}
r7_0[20021105] = r0_0.RT_20
r6_0.Quests = r7_0
r6_0.StartQuestId = 20021100
r4_0[200211] = r6_0
r6_0 = {
  EndQuestIds = {
    [20021203] = true,
    [20021207] = true,
  },
  HavePreQuest = true,
  IsMultiEndQuest = true,
  QuestChainId = 200212,
}
r7_0 = {}
r7_0[20021200] = {
  IsMultiQuest = false,
  IsPreQuest = true,
  SubRegionId = 101101,
  nextQuestId = 20021205,
  nextQuestIds = {
    Success = 20021205,
  },
}
r7_0[20021202] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20021203,
  nextQuestIds = {
    Success = 20021203,
  },
}
r7_0[20021203] = r0_0.RT_20
r7_0[20021205] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 20021206,
  nextQuestIds = {
    Success = 20021206,
  },
}
r7_0[20021206] = {
  IsMultiQuest = true,
  SubRegionId = 101103,
  nextQuestId = 20021207,
  nextQuestIds = {
    分支1 = 20021207,
    分支2 = 20021202,
  },
}
r7_0[20021207] = r0_0.RT_20
r6_0.Quests = r7_0
r6_0.StartQuestId = 20021200
r4_0[200212] = r6_0
r6_0 = {
  EndQuestId = 20021304,
  HavePreQuest = true,
  IsMultiEndQuest = false,
  QuestChainId = 200213,
}
r7_0 = {}
r7_0[20021300] = {
  IsMultiQuest = false,
  IsPreQuest = true,
  SubRegionId = 101101,
  nextQuestId = 20021301,
  nextQuestIds = {
    Success = 20021301,
  },
}
r7_0[20021301] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20021302,
  nextQuestIds = {
    Success = 20021302,
  },
}
r7_0[20021302] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 20021303,
  nextQuestIds = {
    Success = 20021303,
  },
}
r7_0[20021303] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20021304,
  nextQuestIds = {
    Success = 20021304,
  },
}
r7_0[20021304] = r0_0.RT_20
r6_0.Quests = r7_0
r6_0.StartQuestId = 20021300
r4_0[200213] = r6_0
r6_0 = {
  EndQuestId = 20021508,
  HavePreQuest = true,
  IsMultiEndQuest = false,
  QuestChainId = 200215,
}
r7_0 = {}
r7_0[20021500] = {
  IsMultiQuest = false,
  IsPreQuest = true,
  SubRegionId = 101103,
  nextQuestId = 20021501,
  nextQuestIds = {
    Success = 20021501,
  },
}
r7_0[20021501] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 20021510,
  nextQuestIds = {
    Success = 20021510,
  },
}
r7_0[20021502] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 20021503,
  nextQuestIds = {
    Success = 20021503,
  },
}
r7_0[20021503] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 20021504,
  nextQuestIds = {
    Success = 20021504,
  },
}
r7_0[20021504] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 20021509,
  nextQuestIds = {
    Success = 20021509,
  },
}
r7_0[20021506] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 20021507,
  nextQuestIds = {
    Success = 20021507,
  },
}
r7_0[20021507] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 20021508,
  nextQuestIds = {
    Success = 20021508,
  },
}
r7_0[20021508] = r0_0.RT_20
r7_0[20021509] = {
  IsMultiQuest = false,
  TargetMode = {
    TargetCount = 1,
    TargetId = 10115,
  },
  nextQuestId = 20021506,
  nextQuestIds = {
    Success = 20021506,
  },
}
r7_0[20021510] = {
  IsMultiQuest = false,
  TargetMode = {
    TargetCount = 1,
    TargetId = 10118,
  },
  nextQuestId = 20021502,
  nextQuestIds = {
    Success = 20021502,
  },
}
r6_0.Quests = r7_0
r6_0.StartQuestId = 20021500
r4_0[200215] = r6_0
r6_0 = {
  EndQuestId = 20021604,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 200216,
}
r7_0 = {}
r7_0[20021601] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 20021602,
  nextQuestIds = {
    Success = 20021602,
  },
}
r7_0[20021602] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 20021603,
  nextQuestIds = {
    Success = 20021603,
  },
}
r7_0[20021603] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 20021604,
  nextQuestIds = {
    Success = 20021604,
  },
}
r7_0[20021604] = r0_0.RT_19
r6_0.Quests = r7_0
r6_0.StartQuestId = 20021601
r4_0[200216] = r6_0
r6_0 = {
  EndQuestId = 20021906,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 200219,
}
r7_0 = {}
r7_0[20021901] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 20021902,
  nextQuestIds = {
    Success = 20021902,
  },
}
r7_0[20021902] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 20021903,
  nextQuestIds = {
    Success = 20021903,
  },
}
r7_0[20021903] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 20021905,
  nextQuestIds = {
    Success = 20021905,
  },
}
r7_0[20021904] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20021901,
  nextQuestIds = {
    Success = 20021901,
  },
}
r7_0[20021905] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 20021906,
  nextQuestIds = {
    Success = 20021906,
  },
}
r7_0[20021906] = r0_0.RT_19
r6_0.Quests = r7_0
r6_0.StartQuestId = 20021904
r4_0[200219] = r6_0
r6_0 = {
  EndQuestId = 20022009,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 200220,
}
r7_0 = {}
r7_0[20022002] = {
  IsMultiQuest = false,
  SubRegionId = 101107,
  nextQuestId = 20022004,
  nextQuestIds = {
    Success = 20022004,
  },
}
r7_0[20022004] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20022005,
  nextQuestIds = {
    Success = 20022005,
  },
}
r7_0[20022005] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20022006,
  nextQuestIds = {
    Success = 20022006,
  },
}
r7_0[20022006] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20022007,
  nextQuestIds = {
    Success = 20022007,
  },
}
r7_0[20022007] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20022008,
  nextQuestIds = {
    Success = 20022008,
  },
}
r7_0[20022008] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20022009,
  nextQuestIds = {
    Success = 20022009,
  },
}
r7_0[20022009] = r0_0.RT_20
r6_0.Quests = r7_0
r6_0.StartQuestId = 20022002
r4_0[200220] = r6_0
r6_0 = {
  EndQuestId = 20022104,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 200221,
}
r7_0 = {}
r7_0[20022101] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 20022102,
  nextQuestIds = {
    Success = 20022102,
  },
}
r7_0[20022102] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 20022103,
  nextQuestIds = {
    Success = 20022103,
  },
}
r7_0[20022103] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 20022104,
  nextQuestIds = {
    Success = 20022104,
  },
}
r7_0[20022104] = r0_0.RT_4
r7_0[20022105] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 20022101,
  nextQuestIds = {
    Success = 20022101,
  },
}
r6_0.Quests = r7_0
r6_0.StartQuestId = 20022105
r4_0[200221] = r6_0
r6_0 = {
  EndQuestId = 20022205,
  HavePreQuest = true,
  IsMultiEndQuest = false,
  QuestChainId = 200222,
}
r7_0 = {}
r7_0[20022200] = {
  IsMultiQuest = false,
  IsPreQuest = true,
  SubRegionId = 101101,
  nextQuestId = 20022202,
  nextQuestIds = {
    Success = 20022202,
  },
}
r7_0[20022202] = {
  IsMultiQuest = false,
  SubRegionId = 101701,
  nextQuestId = 20022203,
  nextQuestIds = {
    Success = 20022203,
  },
}
r7_0[20022203] = {
  IsMultiQuest = false,
  SubRegionId = 101701,
  nextQuestId = 20022204,
  nextQuestIds = {
    Success = 20022204,
  },
}
r7_0[20022204] = {
  IsMultiQuest = false,
  SubRegionId = 101701,
  nextQuestId = 20022205,
  nextQuestIds = {
    Success = 20022205,
  },
}
r7_0[20022205] = {
  IsMultiQuest = false,
  SubRegionId = 101701,
  nextQuestIds = r0_0.RT_2,
}
r6_0.Quests = r7_0
r6_0.StartQuestId = 20022200
r4_0[200222] = r6_0
r6_0 = {
  EndQuestId = 20022301,
  HavePreQuest = true,
  IsMultiEndQuest = false,
  QuestChainId = 200223,
}
r7_0 = {}
r7_0[20022300] = {
  IsMultiQuest = false,
  IsPreQuest = true,
  SubRegionId = 101101,
  nextQuestId = 20022301,
  nextQuestIds = {
    Success = 20022301,
  },
}
r7_0[20022301] = r0_0.RT_20
r6_0.Quests = r7_0
r6_0.StartQuestId = 20022300
r4_0[200223] = r6_0
r6_0 = {
  EndQuestId = 20022404,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 200224,
}
r7_0 = {}
r7_0[20022401] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20022402,
  nextQuestIds = {
    Success = 20022402,
  },
}
r7_0[20022402] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 20022403,
  nextQuestIds = {
    Success = 20022403,
  },
}
r7_0[20022403] = {
  IsMultiQuest = false,
  SubRegionId = 101701,
  nextQuestId = 20022404,
  nextQuestIds = {
    Success = 20022404,
  },
}
r7_0[20022404] = r0_0.RT_20
r6_0.Quests = r7_0
r6_0.StartQuestId = 20022401
r4_0[200224] = r6_0
r6_0 = {
  EndQuestId = 20022504,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 200225,
}
r7_0 = {}
r7_0[20022501] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20022502,
  nextQuestIds = {
    Success = 20022502,
  },
}
r7_0[20022502] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20022503,
  nextQuestIds = {
    Success = 20022503,
  },
}
r7_0[20022503] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20022504,
  nextQuestIds = {
    Success = 20022504,
  },
}
r7_0[20022504] = r0_0.RT_20
r6_0.Quests = r7_0
r6_0.StartQuestId = 20022501
r4_0[200225] = r6_0
r6_0 = {
  EndQuestIds = {
    [20022702] = true,
    [20022703] = true,
  },
  HavePreQuest = false,
  IsMultiEndQuest = true,
  QuestChainId = 200227,
}
r7_0 = {}
r7_0[20022701] = {
  IsMultiQuest = true,
  SubRegionId = 101101,
  nextQuestId = 20022703,
  nextQuestIds = {
    选项1 = 20022703,
    选项2 = 20022702,
  },
}
r7_0[20022702] = r0_0.RT_20
r7_0[20022703] = r0_0.RT_20
r6_0.Quests = r7_0
r6_0.StartQuestId = 20022701
r4_0[200227] = r6_0
r6_0 = {
  EndQuestId = 20022804,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 200228,
}
r7_0 = {}
r7_0[20022801] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 20022802,
  nextQuestIds = {
    Success = 20022802,
  },
}
r7_0[20022802] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 20022803,
  nextQuestIds = {
    Success = 20022803,
  },
}
r7_0[20022803] = {
  IsMultiQuest = false,
  TargetMode = {
    TargetCount = 1,
    TargetId = 20022803,
  },
  nextQuestId = 20022804,
  nextQuestIds = {
    Success = 20022804,
  },
}
r7_0[20022804] = r0_0.RT_4
r6_0.Quests = r7_0
r6_0.StartQuestId = 20022801
r4_0[200228] = r6_0
r6_0 = {
  EndQuestId = 20022904,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 200229,
}
r7_0 = {}
r7_0[20022901] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 20022902,
  nextQuestIds = {
    Success = 20022902,
  },
}
r7_0[20022902] = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestId = 20022903,
  nextQuestIds = {
    Success = 20022903,
  },
}
r7_0[20022903] = {
  IsMultiQuest = false,
  TargetMode = {
    TargetCount = 1,
    TargetId = 2000101,
  },
  nextQuestId = 20022904,
  nextQuestIds = {
    Success = 20022904,
  },
}
r7_0[20022904] = r0_0.RT_4
r6_0.Quests = r7_0
r6_0.StartQuestId = 20022901
r4_0[200229] = r6_0
r6_0 = {
  EndQuestId = 20023007,
  HavePreQuest = true,
  IsMultiEndQuest = false,
  QuestChainId = 200230,
}
r7_0 = {}
r7_0[20023000] = {
  IsMultiQuest = false,
  IsPreQuest = true,
  SubRegionId = 101101,
  nextQuestId = 20023001,
  nextQuestIds = {
    Success = 20023001,
  },
}
r7_0[20023001] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20023002,
  nextQuestIds = {
    Success = 20023002,
  },
}
r7_0[20023002] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20023003,
  nextQuestIds = {
    Success = 20023003,
  },
}
r7_0[20023003] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20023004,
  nextQuestIds = {
    Success = 20023004,
  },
}
r7_0[20023004] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20023006,
  nextQuestIds = {
    Success = 20023006,
  },
}
r7_0[20023006] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20023007,
  nextQuestIds = {
    Success = 20023007,
  },
}
r7_0[20023007] = r0_0.RT_20
r6_0.Quests = r7_0
r6_0.StartQuestId = 20023000
r4_0[200230] = r6_0
r6_0 = {
  EndQuestId = 20023108,
  HavePreQuest = true,
  IsMultiEndQuest = false,
  QuestChainId = 200231,
}
r7_0 = {}
r7_0[20023100] = {
  IsMultiQuest = false,
  IsPreQuest = true,
  SubRegionId = 101101,
  nextQuestId = 20023101,
  nextQuestIds = {
    Success = 20023101,
  },
}
r7_0[20023101] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20023102,
  nextQuestIds = {
    Success = 20023102,
  },
}
r7_0[20023102] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20023103,
  nextQuestIds = {
    Success = 20023103,
  },
}
r7_0[20023103] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 20023105,
  nextQuestIds = {
    Success = 20023105,
  },
}
r7_0[20023105] = {
  IsMultiQuest = false,
  SubRegionId = 101301,
  nextQuestId = 20023108,
  nextQuestIds = {
    Success = 20023108,
  },
}
r7_0[20023108] = r0_0.RT_20
r6_0.Quests = r7_0
r6_0.StartQuestId = 20023100
r4_0[200231] = r6_0
r6_0 = {
  EndQuestId = 20023205,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 200232,
}
r7_0 = {}
r7_0[20023201] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20023202,
  nextQuestIds = {
    Success = 20023202,
  },
}
r7_0[20023202] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20023203,
  nextQuestIds = {
    Success = 20023203,
  },
}
r7_0[20023203] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 20023204,
  nextQuestIds = {
    Success = 20023204,
  },
}
r7_0[20023204] = {
  IsMultiQuest = false,
  SubRegionId = 101107,
  nextQuestId = 20023205,
  nextQuestIds = {
    Success = 20023205,
  },
}
r7_0[20023205] = r0_0.RT_20
r6_0.Quests = r7_0
r6_0.StartQuestId = 20023201
r4_0[200232] = r6_0
r6_0 = {
  EndQuestIds = {
    [20023305] = true,
    [20023306] = true,
  },
  HavePreQuest = false,
  IsMultiEndQuest = true,
  QuestChainId = 200233,
}
r7_0 = {}
r7_0[20023301] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20023302,
  nextQuestIds = {
    Success = 20023302,
  },
}
r7_0[20023302] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 20023304,
  nextQuestIds = {
    Success = 20023304,
  },
}
r7_0[20023304] = {
  IsMultiQuest = true,
  SubRegionId = 101101,
  nextQuestId = 20023305,
  nextQuestIds = {
    不揭发 = 20023305,
    揭发 = 20023306,
  },
}
r7_0[20023305] = r0_0.RT_20
r7_0[20023306] = r0_0.RT_20
r6_0.Quests = r7_0
r6_0.StartQuestId = 20023301
r4_0[200233] = r6_0
r6_0 = {
  EndQuestId = 20023402,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 200234,
}
r7_0 = {}
r7_0[20023401] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20023402,
  nextQuestIds = {
    Success = 20023402,
  },
}
r7_0[20023402] = r0_0.RT_20
r6_0.Quests = r7_0
r6_0.StartQuestId = 20023401
r4_0[200234] = r6_0
r6_0 = {
  EndQuestId = 20023502,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 200235,
}
r7_0 = {}
r7_0[20023501] = {
  IsMultiQuest = false,
  TargetMode = {
    TargetCount = 1,
    TargetId = 50906,
  },
  nextQuestId = 20023502,
  nextQuestIds = {
    Success = 20023502,
  },
}
r7_0[20023502] = {
  IsMultiQuest = false,
  TargetMode = {
    TargetCount = 1,
    TargetId = 200235,
  },
  nextQuestIds = r0_0.RT_2,
}
r6_0.Quests = r7_0
r6_0.StartQuestId = 20023501
r4_0[200235] = r6_0
r6_0 = {
  EndQuestIds = {
    [20023602] = true,
    [20023604] = true,
  },
  HavePreQuest = false,
  IsMultiEndQuest = true,
  QuestChainId = 200236,
}
r7_0 = {}
r7_0[20023601] = {
  IsMultiQuest = false,
  TargetMode = {
    TargetCount = 1,
    TargetId = 20023601,
  },
  nextQuestId = 20023603,
  nextQuestIds = {
    Success = 20023603,
  },
}
r7_0[20023602] = r0_0.RT_4
r7_0[20023603] = {
  IsMultiQuest = true,
  SubRegionId = 0,
  nextQuestId = 20023604,
  nextQuestIds = {
    已合成 = 20023604,
    未合成 = 20023602,
  },
}
r7_0[20023604] = r0_0.RT_4
r6_0.Quests = r7_0
r6_0.StartQuestId = 20023601
r4_0[200236] = r6_0
r6_0 = {
  EndQuestId = 20030106,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 200301,
}
r7_0 = {}
r7_0[20030100] = {
  IsMultiQuest = false,
  SubRegionId = 104109,
  nextQuestId = 20030101,
  nextQuestIds = {
    Success = 20030101,
  },
}
r7_0[20030101] = {
  IsMultiQuest = false,
  SubRegionId = 104105,
  nextQuestId = 20030104,
  nextQuestIds = {
    Success = 20030104,
  },
}
r7_0[20030103] = {
  IsMultiQuest = false,
  SubRegionId = 104105,
  nextQuestId = 20030106,
  nextQuestIds = {
    Success = 20030106,
  },
}
r7_0[20030104] = {
  IsMultiQuest = false,
  SubRegionId = 104105,
  nextQuestId = 20030103,
  nextQuestIds = {
    Success = 20030103,
  },
}
r7_0[20030106] = r0_0.RT_15
r6_0.Quests = r7_0
r6_0.StartQuestId = 20030100
r4_0[200301] = r6_0
r6_0 = {
  EndQuestId = 20030204,
  HavePreQuest = true,
  IsMultiEndQuest = false,
  QuestChainId = 200302,
}
r7_0 = {}
r7_0[20030200] = {
  IsMultiQuest = false,
  IsPreQuest = true,
  SubRegionId = 104110,
  nextQuestId = 20030201,
  nextQuestIds = {
    Success = 20030201,
  },
}
r7_0[20030201] = {
  IsMultiQuest = false,
  SubRegionId = 104107,
  nextQuestId = 20030202,
  nextQuestIds = {
    Success = 20030202,
  },
}
r7_0[20030202] = {
  IsMultiQuest = false,
  SubRegionId = 104108,
  nextQuestId = 20030203,
  nextQuestIds = {
    Success = 20030203,
  },
}
r7_0[20030203] = {
  IsMultiQuest = false,
  SubRegionId = 104108,
  nextQuestId = 20030204,
  nextQuestIds = {
    Success = 20030204,
  },
}
r7_0[20030204] = r0_0.RT_23
r6_0.Quests = r7_0
r6_0.StartQuestId = 20030200
r4_0[200302] = r6_0
r6_0 = {
  EndQuestId = 20030304,
  HavePreQuest = true,
  IsMultiEndQuest = false,
  QuestChainId = 200303,
}
r7_0 = {}
r7_0[20030300] = {
  IsMultiQuest = false,
  IsPreQuest = true,
  SubRegionId = 104109,
  nextQuestId = 20030301,
  nextQuestIds = {
    Success = 20030301,
  },
}
r7_0[20030301] = {
  IsMultiQuest = false,
  SubRegionId = 104109,
  nextQuestId = 20030302,
  nextQuestIds = {
    Success = 20030302,
  },
}
r7_0[20030302] = {
  IsMultiQuest = false,
  SubRegionId = 104105,
  nextQuestId = 20030303,
  nextQuestIds = {
    Success = 20030303,
  },
}
r7_0[20030303] = {
  IsMultiQuest = false,
  SubRegionId = 104105,
  nextQuestId = 20030304,
  nextQuestIds = {
    Success = 20030304,
  },
}
r7_0[20030304] = r0_0.RT_15
r6_0.Quests = r7_0
r6_0.StartQuestId = 20030300
r4_0[200303] = r6_0
r6_0 = {
  EndQuestId = 20030409,
  HavePreQuest = true,
  IsMultiEndQuest = false,
  QuestChainId = 200304,
}
r7_0 = {}
r7_0[20030400] = {
  IsMultiQuest = false,
  IsPreQuest = true,
  SubRegionId = 104108,
  nextQuestId = 20030401,
  nextQuestIds = {
    Success = 20030401,
  },
}
r7_0[20030401] = {
  IsMultiQuest = false,
  SubRegionId = 104108,
  nextQuestId = 20030402,
  nextQuestIds = {
    Success = 20030402,
  },
}
r7_0[20030402] = {
  IsMultiQuest = false,
  SubRegionId = 104108,
  nextQuestId = 20030403,
  nextQuestIds = {
    Success = 20030403,
  },
}
r7_0[20030403] = {
  IsMultiQuest = false,
  SubRegionId = 104108,
  nextQuestId = 20030404,
  nextQuestIds = {
    Success = 20030404,
  },
}
r7_0[20030404] = {
  IsMultiQuest = false,
  SubRegionId = 104108,
  nextQuestId = 20030405,
  nextQuestIds = {
    Success = 20030405,
  },
}
r7_0[20030405] = {
  IsMultiQuest = false,
  SubRegionId = 104108,
  nextQuestId = 20030406,
  nextQuestIds = {
    Success = 20030406,
  },
}
r7_0[20030406] = {
  IsMultiQuest = false,
  SubRegionId = 104108,
  nextQuestId = 20030407,
  nextQuestIds = {
    Success = 20030407,
  },
}
r7_0[20030407] = {
  IsMultiQuest = false,
  SubRegionId = 104108,
  nextQuestId = 20030408,
  nextQuestIds = {
    Success = 20030408,
  },
}
r7_0[20030408] = {
  IsMultiQuest = false,
  SubRegionId = 104108,
  nextQuestId = 20030409,
  nextQuestIds = {
    Success = 20030409,
  },
}
r7_0[20030409] = r0_0.RT_23
r6_0.Quests = r7_0
r6_0.StartQuestId = 20030400
r4_0[200304] = r6_0
r6_0 = {
  EndQuestId = 20030603,
  HavePreQuest = true,
  IsMultiEndQuest = false,
  QuestChainId = 200306,
}
r7_0 = {}
r7_0[20030600] = {
  IsMultiQuest = false,
  IsPreQuest = true,
  SubRegionId = 104107,
  nextQuestId = 20030601,
  nextQuestIds = {
    Success = 20030601,
  },
}
r7_0[20030601] = {
  IsMultiQuest = false,
  SubRegionId = 104107,
  nextQuestId = 20030602,
  nextQuestIds = {
    Success = 20030602,
  },
}
r7_0[20030602] = {
  IsMultiQuest = false,
  SubRegionId = 104107,
  nextQuestId = 20030603,
  nextQuestIds = {
    Success = 20030603,
  },
}
r7_0[20030603] = {
  IsMultiQuest = false,
  SubRegionId = 104107,
  nextQuestIds = r0_0.RT_2,
}
r6_0.Quests = r7_0
r6_0.StartQuestId = 20030600
r4_0[200306] = r6_0
r6_0 = {
  EndQuestId = 20030905,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 200309,
}
r7_0 = {}
r7_0[20030901] = {
  IsMultiQuest = false,
  SubRegionId = 104104,
  nextQuestId = 20030902,
  nextQuestIds = {
    Success = 20030902,
  },
}
r7_0[20030902] = {
  IsMultiQuest = false,
  SubRegionId = 104106,
  nextQuestId = 20030903,
  nextQuestIds = {
    Success = 20030903,
  },
}
r7_0[20030903] = {
  IsMultiQuest = false,
  SubRegionId = 104106,
  nextQuestId = 20030906,
  nextQuestIds = {
    Success = 20030906,
  },
}
r7_0[20030904] = {
  IsMultiQuest = false,
  SubRegionId = 104106,
  nextQuestId = 20030905,
  nextQuestIds = {
    Success = 20030905,
  },
}
r7_0[20030905] = r0_0.RT_14
r7_0[20030906] = {
  IsMultiQuest = false,
  SubRegionId = 104106,
  nextQuestId = 20030904,
  nextQuestIds = {
    Success = 20030904,
  },
}
r6_0.Quests = r7_0
r6_0.StartQuestId = 20030901
r4_0[200309] = r6_0
r4_0[400101] = {
  EndQuestId = 4001011,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 400101,
  Quests = {
    [4001011] = r0_0.RT_19,
  },
  StartQuestId = 4001011,
}
r4_0[400102] = {
  EndQuestId = 4001021,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 400102,
  Quests = {
    [4001021] = r0_0.RT_19,
  },
  StartQuestId = 4001021,
}
r4_0[400103] = {
  EndQuestId = 4001031,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 400103,
  Quests = {
    [4001031] = r0_0.RT_19,
  },
  StartQuestId = 4001031,
}
r4_0[400104] = {
  EndQuestId = 4001041,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 400104,
  Quests = {
    [4001041] = r0_0.RT_19,
  },
  StartQuestId = 4001041,
}
r4_0[400105] = {
  EndQuestId = 4001051,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 400105,
  Quests = {
    [4001051] = r0_0.RT_19,
  },
  StartQuestId = 4001051,
}
r4_0[400106] = {
  EndQuestId = 4001061,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 400106,
  Quests = {
    [4001061] = r0_0.RT_19,
  },
  StartQuestId = 4001061,
}
r4_0[400107] = {
  EndQuestId = 4001071,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 400107,
  Quests = {
    [4001071] = r0_0.RT_19,
  },
  StartQuestId = 4001071,
}
r6_0 = {
  EndQuestId = 40011107,
  HavePreQuest = false,
  IsMultiEndQuest = false,
  QuestChainId = 400111,
}
r7_0 = {}
r7_0[40011101] = {
  IsMultiQuest = false,
  SubRegionId = 101107,
  nextQuestId = 40011102,
  nextQuestIds = {
    Success = 40011102,
  },
}
r7_0[40011102] = {
  IsMultiQuest = false,
  SubRegionId = 210101,
  nextQuestId = 40011103,
  nextQuestIds = {
    Success = 40011103,
  },
}
r7_0[40011103] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 40011104,
  nextQuestIds = {
    Success = 40011104,
  },
}
r7_0[40011104] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 40011105,
  nextQuestIds = {
    Success = 40011105,
  },
}
r7_0[40011105] = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestId = 40011106,
  nextQuestIds = {
    Success = 40011106,
  },
}
r7_0[40011106] = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 40011107,
  nextQuestIds = {
    Success = 40011107,
  },
}
r7_0[40011107] = r0_0.RT_10
r6_0.Quests = r7_0
r6_0.StartQuestId = 40011101
r4_0[400111] = r6_0
return r1_0("STLExportQuestChain", r4_0)
